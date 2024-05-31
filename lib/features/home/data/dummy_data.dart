import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:healthcare/features/home/model/organModel.dart';
import 'package:iconsax/iconsax.dart';

class DummyData {
  static List<OrganModel> orgnaList = [
    OrganModel(
        name: "My Brain",
        imageUrl: 'assets/images/brain.png',
        conditions: [
          ListModel(
              icon: Iconsax.battery_charging,
              name: "Brain Activity",
              value: "Normal"),
          ListModel(icon: Icons.memory, name: "Memory Status", value: "Good"),
          ListModel(icon: Icons.graphic_eq, name: "EEG", value: "Stable"),
          ListModel(
              icon: Icons.access_time, name: "Reaction Time", value: "200ms"),
        ]),
    OrganModel(
        name: "My Heart",
        imageUrl: 'assets/images/heart.png',
        conditions: [
          ListModel(icon: IconlyLight.heart, name: "My Heart", value: "123bmp"),
          ListModel(icon: Iconsax.drop, name: "Blood Status", value: "116/70"),
          ListModel(
              icon: IconlyLight.graph, name: "Blood Count", value: "80-90"),
          ListModel(
              icon: Icons.grid_3x3_outlined,
              name: "Glucose",
              value: "90 mg/dL"),
        ]),
    OrganModel(
        name: "My Kidney",
        imageUrl: 'assets/images/kidney.png',
        conditions: [
          ListModel(
              icon: Icons.local_drink,
              name: "Hydration Level",
              value: "Normal"),
          ListModel(
              icon: Icons.filter_alt,
              name: "Filtration Rate",
              value: "90 mL/min"),
          ListModel(
              icon: Icons.opacity, name: "Urine Output", value: "1500 mL/day"),
          ListModel(
              icon: Icons.check_circle,
              name: "Health Status",
              value: "Healthy"),
        ]),
    OrganModel(
        name: "My Liver",
        imageUrl: 'assets/images/liver.png',
        conditions: [
          ListModel(
              icon: Icons.local_hospital,
              name: "Liver Enzymes",
              value: "Normal"),
          ListModel(
              icon: Icons.water, name: "Bile Production", value: "500 mL/day"),
          ListModel(
              icon: Icons.shield, name: "Detoxification", value: "Active"),
          ListModel(
              icon: Icons.health_and_safety,
              name: "Overall Health",
              value: "Good"),
        ]),
    OrganModel(
        name: "My Eye",
        imageUrl: 'assets/images/human_eye.png',
        conditions: [
          ListModel(
              icon: Icons.visibility, name: "Vision Clarity", value: "20/20"),
          ListModel(
              icon: Icons.remove_red_eye,
              name: "Eye Pressure",
              value: "15 mmHg"),
          ListModel(
              icon: Icons.color_lens, name: "Color Vision", value: "Normal"),
          ListModel(
              icon: Icons.light_mode,
              name: "Light Sensitivity",
              value: "Normal"),
        ]),
  ];
}
