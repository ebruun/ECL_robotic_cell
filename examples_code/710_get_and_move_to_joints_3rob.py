import compas_rrc as rrc

if __name__ == '__main__':

    # Create Ros Client
    ros = rrc.RosClient()
    ros.run()

    # Create ABB Client
    abb1 = rrc.AbbClient(ros, '/rob1')
    abb2 = rrc.AbbClient(ros, '/rob2')
    # abb3 = rrc.AbbClient(ros, '/rob3')
    print('Connected.')

    # Read value of joints
    robot_joints1, external_axes1 = abb1.send_and_wait(rrc.GetJoints())
    robot_joints2, external_axes2 = abb2.send_and_wait(rrc.GetJoints())
    # robot_joints3, external_axes3 = abb3.send_and_wait(rrc.GetJoints())

    # Print received values
    print(robot_joints1, external_axes1)
    print(robot_joints2, external_axes2)
    # print(robot_joints3, external_axes3)

    # Change a joint value [°]
    robot_joints1.rax_1 -= 20

    robot_joints2.rax_1 -= 20
    
    # robot_joints3.rax_1 = 0
    # robot_joints3.rax_2 = 1
    # robot_joints3.rax_3 = 1
    # robot_joints3.rax_4 = 2
    # robot_joints3.rax_5 = 3
    # robot_joints3.rax_6 = 4

    # Set speed [mm/s]
    speed = 100

    # Move robot the new pos
    done1 = abb1.send(rrc.MoveToJoints(robot_joints1, external_axes1, speed, rrc.Zone.FINE))
    done2 = abb2.send(rrc.MoveToJoints(robot_joints2, external_axes2, speed, rrc.Zone.FINE))
    # done3 = abb3.send(rrc.MoveToJoints(robot_joints3, external_axes3, speed, rrc.Zone.FINE))

    # Print feedback
    print('Feedback = ', done1, done2)

    # End of Code
    print('Finished')

    # Close client
    ros.close()
    ros.terminate()
