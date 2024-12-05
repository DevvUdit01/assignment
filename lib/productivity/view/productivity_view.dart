import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart'; // Import the fl_chart package
import '../controller/productivity_controller.dart';

class ProductivityView extends StatelessWidget {
  const ProductivityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductivityController controller = Get.put(ProductivityController());

    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 245, 236, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(249, 245, 236, 1),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_rounded, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Productivity',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.keyboard_control_rounded, size: 30,)
              ],
            ),
            const SizedBox(height: 20),

            // Productivity Chart Section
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Overall',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Row(
                        children: [
                          Row(
                                children: const [
                                  Icon(Icons.circle, size: 10, color: Colors.green),
                                  SizedBox(width: 5),
                                  Text(
                                    'Planned',
                                    style: TextStyle(fontSize: 14, color: Colors.grey),
                                  ),
                                ],
                              ),
                              SizedBox(width: 10,),
                              Row(
                                children: const [
                                  Icon(Icons.circle, size: 10, color: Colors.brown),
                                  SizedBox(width: 5),
                                  Text(
                                    'Complete',
                                    style: TextStyle(fontSize: 14, color: Colors.grey),
                                  ),
                                ],
                              ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '41',
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                 
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 180,
                    child: BarChart(
  BarChartData(
  gridData: FlGridData(show: false), // Hide grid lines
  borderData: FlBorderData(show: false), // Hide borders
  titlesData: FlTitlesData(
    leftTitles: AxisTitles(
      sideTitles: SideTitles(showTitles: false), // Hide left numbers
    ),
    bottomTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          const style = TextStyle(color: Colors.black, fontSize: 12);
          switch (value.toInt()) {
            case 0:
              return Text('Su', style: style);
            case 1:
              return Text('Mo', style: style);
            case 2:
              return Text('Tu', style: style);
            case 3:
              return Text('We', style: style);
            case 4:
              return Text('Th', style: style);
            case 5:
              return Text('Fr', style: style);
            case 6:
              return Text('Sa', style: style);
            default:
              return Text('', style: style);
          }
        },
        reservedSize: 32,
      ),
    ),
    topTitles: AxisTitles(
      sideTitles: SideTitles(showTitles: false), // Hide top numbers
    ),
    rightTitles: AxisTitles(
      sideTitles: SideTitles(showTitles: false), // Hide right numbers
    ),
  ),
  barGroups: [
    for (int i = 0; i < 7; i++)
      BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(
            fromY: 0,
            toY: (i == 5) ? 8 : (i + 1).toDouble(),
            color: Colors.green,
            width: 22,
            borderRadius: BorderRadius.circular(6),
            backDrawRodData: BackgroundBarChartRodData(
              show: true,
              toY: 10,
              color: Colors.grey.withOpacity(0.2),
            ),
          ),
        ],
        showingTooltipIndicators:  i == 5 ? [08] :[], // Remove tooltips
      ),
  ],
  groupsSpace: 10,
  barTouchData: BarTouchData(
    enabled: false, // Disable touch interaction to remove top numbers
  ),
)

)

                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Subtasks Section
            const Text(
              'Subtasks',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Obx(() => Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  for (var task in controller.subtasks)
                    ListTile(
                      leading: Icon(
                        Icons.check_circle,
                        color: task.isCompleted ? Colors.green : Colors.grey,
                      ),
                      title: Text(
                        task.title,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      trailing:SizedBox(
    width: 120, // Adjust this width as needed
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Show multiple assignee avatars
        ...task.assigneeImages.map((image) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage(image),
              onBackgroundImageError: (_, __) =>
                  debugPrint('Image not found: $image'),
            ),
          );
        }).toList(),
      ],
    ),
  ),
                    ),
                     const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 50,
                        width: 180,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(25)
                        ),
                        child: Center(
                          child: Text(
                            "Add Subtasks",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20
                            ),
                            ),
                        ),
                      ),

                      IconButton(
                                      onPressed: () => _showAddSubtaskDialog(context, controller), //controller.addSubtask,
                                      icon: const Icon(Icons.add, color: Colors.white, size: 30,),
                                      style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                                      ),
                                    ),
                    ],
                  ),
                   const SizedBox(height: 20),
                ],
              ),
            ),
            ),
            const SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}

// class Subtask {
//   final String title;
//   final bool isCompleted;
//   final String? assigneeImage;

//   Subtask({
//     required this.title,
//     required this.isCompleted,
//     this.assigneeImage,
//   });
// }

 void _showAddSubtaskDialog(BuildContext context, ProductivityController controller) {
    final TextEditingController subtaskController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Add Subtask"),
          content: TextField(
            controller: subtaskController,
            decoration: const InputDecoration(
              labelText: "Subtask Name",
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                final subtaskName = subtaskController.text.trim();
                if (subtaskName.isNotEmpty) {
                  controller.addSubtask(subtaskName);
                }
                Navigator.of(context).pop();
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

