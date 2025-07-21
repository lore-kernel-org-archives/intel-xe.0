Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 115F3C83F25
	for <intel-xe@archiver.kernel.org>; Mon, 21 Jul 2025 16:38:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC2010E2C7;
	Mon, 21 Jul 2025 16:38:36 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7323010E2C7
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Jul 2025 16:38:35 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] [CI-test] devcoredump: Fix circular locking dependency with
 devcd->mutex.
Date: Mon, 21 Jul 2025 18:38:28 +0200
Message-ID: <20250721163828.548746-1-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The original code causes a circular locking dependency found by lockdep.

======================================================
WARNING: possible circular locking dependency detected
6.16.0-rc6-lgci-xe-xe-pw-151626v3+ #1 Tainted: G S   U
------------------------------------------------------
xe_fault_inject/5091 is trying to acquire lock:
ffff888156815688 ((work_completion)(&(&devcd->del_wk)->work)){+.+.}-{0:0}, at: __flush_work+0x25d/0x660

but task is already holding lock:

ffff888156815620 (&devcd->mutex){+.+.}-{3:3}, at: dev_coredump_put+0x3f/0xa0
which lock already depends on the new lock.
the existing dependency chain (in reverse order) is:
-> #2 (&devcd->mutex){+.+.}-{3:3}:
       mutex_lock_nested+0x4e/0xc0
       devcd_data_write+0x27/0x90
       sysfs_kf_bin_write+0x80/0xf0
       kernfs_fop_write_iter+0x169/0x220
       vfs_write+0x293/0x560
       ksys_write+0x72/0xf0
       __x64_sys_write+0x19/0x30
       x64_sys_call+0x2bf/0x2660
       do_syscall_64+0x93/0xb60
       entry_SYSCALL_64_after_hwframe+0x76/0x7e
-> #1 (kn->active#236){++++}-{0:0}:
       kernfs_drain+0x1e2/0x200
       __kernfs_remove+0xae/0x400
       kernfs_remove_by_name_ns+0x5d/0xc0
       remove_files+0x54/0x70
       sysfs_remove_group+0x3d/0xa0
       sysfs_remove_groups+0x2e/0x60
       device_remove_attrs+0xc7/0x100
       device_del+0x15d/0x3b0
       devcd_del+0x19/0x30
       process_one_work+0x22b/0x6f0
       worker_thread+0x1e8/0x3d0
       kthread+0x11c/0x250
       ret_from_fork+0x26c/0x2e0
       ret_from_fork_asm+0x1a/0x30
-> #0 ((work_completion)(&(&devcd->del_wk)->work)){+.+.}-{0:0}:
       __lock_acquire+0x1661/0x2860
       lock_acquire+0xc4/0x2f0
       __flush_work+0x27a/0x660
       flush_delayed_work+0x5d/0xa0
       dev_coredump_put+0x63/0xa0
       xe_driver_devcoredump_fini+0x12/0x20 [xe]
       devm_action_release+0x12/0x30
       release_nodes+0x3a/0x120
       devres_release_all+0x8a/0xd0
       device_unbind_cleanup+0x12/0x80
       device_release_driver_internal+0x23a/0x280
       device_driver_detach+0x14/0x20
       unbind_store+0xaf/0xc0
       drv_attr_store+0x21/0x50
       sysfs_kf_write+0x4a/0x80
       kernfs_fop_write_iter+0x169/0x220
       vfs_write+0x293/0x560
       ksys_write+0x72/0xf0
       __x64_sys_write+0x19/0x30
       x64_sys_call+0x2bf/0x2660
       do_syscall_64+0x93/0xb60
       entry_SYSCALL_64_after_hwframe+0x76/0x7e
other info that might help us debug this:
Chain exists of: (work_completion)(&(&devcd->del_wk)->work) --> kn->active#236 --> &devcd->mutex
 Possible unsafe locking scenario:
       CPU0                    CPU1
       ----                    ----
  lock(&devcd->mutex);
                               lock(kn->active#236);
                               lock(&devcd->mutex);
  lock((work_completion)(&(&devcd->del_wk)->work));
 *** DEADLOCK ***
5 locks held by xe_fault_inject/5091:
 #0: ffff8881129f9488 (sb_writers#5){.+.+}-{0:0}, at: ksys_write+0x72/0xf0
 #1: ffff88810c755078 (&of->mutex#2){+.+.}-{3:3}, at: kernfs_fop_write_iter+0x123/0x220
 #2: ffff8881054811a0 (&dev->mutex){....}-{3:3}, at: device_release_driver_internal+0x55/0x280
 #3: ffff888156815620 (&devcd->mutex){+.+.}-{3:3}, at: dev_coredump_put+0x3f/0xa0
 #4: ffffffff8359e020 (rcu_read_lock){....}-{1:2}, at: __flush_work+0x72/0x660
stack backtrace:
CPU: 14 UID: 0 PID: 5091 Comm: xe_fault_inject Tainted: G S   U              6.16.0-rc6-lgci-xe-xe-pw-151626v3+ #1 PREEMPT_{RT,(lazy)}
Tainted: [S]=CPU_OUT_OF_SPEC, [U]=USER
Hardware name: Micro-Star International Co., Ltd. MS-7D25/PRO Z690-A DDR4(MS-7D25), BIOS 1.10 12/13/2021
Call Trace:
 <TASK>
 dump_stack_lvl+0x91/0xf0
 dump_stack+0x10/0x20
 print_circular_bug+0x285/0x360
 check_noncircular+0x135/0x150
 ? register_lock_class+0x48/0x4a0
 __lock_acquire+0x1661/0x2860
 lock_acquire+0xc4/0x2f0
 ? __flush_work+0x25d/0x660
 ? mark_held_locks+0x46/0x90
 ? __flush_work+0x25d/0x660
 __flush_work+0x27a/0x660
 ? __flush_work+0x25d/0x660
 ? trace_hardirqs_on+0x1e/0xd0
 ? __pfx_wq_barrier_func+0x10/0x10
 flush_delayed_work+0x5d/0xa0
 dev_coredump_put+0x63/0xa0
 xe_driver_devcoredump_fini+0x12/0x20 [xe]
 devm_action_release+0x12/0x30
 release_nodes+0x3a/0x120
 devres_release_all+0x8a/0xd0
 device_unbind_cleanup+0x12/0x80
 device_release_driver_internal+0x23a/0x280
 ? bus_find_device+0xa8/0xe0
 device_driver_detach+0x14/0x20
 unbind_store+0xaf/0xc0
 drv_attr_store+0x21/0x50
 sysfs_kf_write+0x4a/0x80
 kernfs_fop_write_iter+0x169/0x220
 vfs_write+0x293/0x560
 ksys_write+0x72/0xf0
 __x64_sys_write+0x19/0x30
 x64_sys_call+0x2bf/0x2660
 do_syscall_64+0x93/0xb60
 ? __f_unlock_pos+0x15/0x20
 ? __x64_sys_getdents64+0x9b/0x130
 ? __pfx_filldir64+0x10/0x10
 ? do_syscall_64+0x1a2/0xb60
 ? clear_bhb_loop+0x30/0x80
 ? clear_bhb_loop+0x30/0x80
 entry_SYSCALL_64_after_hwframe+0x76/0x7e
RIP: 0033:0x76e292edd574
Code: c7 00 16 00 00 00 b8 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 80 3d d5 ea 0e 00 00 74 13 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 54 c3 0f 1f 00 55 48 89 e5 48 83 ec 20 48 89
RSP: 002b:00007fffe247a828 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 000076e292edd574
RDX: 000000000000000c RSI: 00006267f6306063 RDI: 000000000000000b
RBP: 000000000000000c R08: 000076e292fc4b20 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 00006267f6306063
R13: 000000000000000b R14: 00006267e6859c00 R15: 000076e29322a000
 </TASK>
xe 0000:03:00.0: [drm] Xe device coredump has been deleted.

Fixes: 01daccf74832 ("devcoredump : Serialize devcd_del work")
Cc: Mukesh Ojha <quic_mojha@quicinc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johannes Berg <johannes@sipsolutions.net>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org
Cc: <stable@vger.kernel.org> # v6.1+

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/base/devcoredump.c | 98 ++++++++++++++------------------------
 1 file changed, 36 insertions(+), 62 deletions(-)

diff --git a/drivers/base/devcoredump.c b/drivers/base/devcoredump.c
index 03a39c417dc41..fb16e959812ec 100644
--- a/drivers/base/devcoredump.c
+++ b/drivers/base/devcoredump.c
@@ -22,47 +22,9 @@ struct devcd_entry {
 	struct device devcd_dev;
 	void *data;
 	size_t datalen;
-	/*
-	 * Here, mutex is required to serialize the calls to del_wk work between
-	 * user/kernel space which happens when devcd is added with device_add()
-	 * and that sends uevent to user space. User space reads the uevents,
-	 * and calls to devcd_data_write() which try to modify the work which is
-	 * not even initialized/queued from devcoredump.
-	 *
-	 *
-	 *
-	 *        cpu0(X)                                 cpu1(Y)
-	 *
-	 *        dev_coredump() uevent sent to user space
-	 *        device_add()  ======================> user space process Y reads the
-	 *                                              uevents writes to devcd fd
-	 *                                              which results into writes to
-	 *
-	 *                                             devcd_data_write()
-	 *                                               mod_delayed_work()
-	 *                                                 try_to_grab_pending()
-	 *                                                   timer_delete()
-	 *                                                     debug_assert_init()
-	 *       INIT_DELAYED_WORK()
-	 *       schedule_delayed_work()
-	 *
-	 *
-	 * Also, mutex alone would not be enough to avoid scheduling of
-	 * del_wk work after it get flush from a call to devcd_free()
-	 * mentioned as below.
-	 *
-	 *	disabled_store()
-	 *        devcd_free()
-	 *          mutex_lock()             devcd_data_write()
-	 *          flush_delayed_work()
-	 *          mutex_unlock()
-	 *                                   mutex_lock()
-	 *                                   mod_delayed_work()
-	 *                                   mutex_unlock()
-	 * So, delete_work flag is required.
-	 */
-	struct mutex mutex;
-	bool delete_work;
+
+	struct mutex init_mutex;
+	bool init_completed;
 	struct module *owner;
 	ssize_t (*read)(char *buffer, loff_t offset, size_t count,
 			void *data, size_t datalen);
@@ -98,9 +60,19 @@ static void devcd_dev_release(struct device *dev)
 static void devcd_del(struct work_struct *wk)
 {
 	struct devcd_entry *devcd;
+	bool init_completed;
 
 	devcd = container_of(wk, struct devcd_entry, del_wk.work);
 
+	/* devcd->init_mutex serializes against dev_coredumpm_timeout */
+	mutex_lock(&devcd->init_mutex);
+	init_completed = devcd->init_completed;
+	mutex_unlock(&devcd->init_mutex);
+
+	/* Aborted? */
+	if (!init_completed)
+		return;
+
 	device_del(&devcd->devcd_dev);
 	put_device(&devcd->devcd_dev);
 }
@@ -122,12 +94,7 @@ static ssize_t devcd_data_write(struct file *filp, struct kobject *kobj,
 	struct device *dev = kobj_to_dev(kobj);
 	struct devcd_entry *devcd = dev_to_devcd(dev);
 
-	mutex_lock(&devcd->mutex);
-	if (!devcd->delete_work) {
-		devcd->delete_work = true;
-		mod_delayed_work(system_wq, &devcd->del_wk, 0);
-	}
-	mutex_unlock(&devcd->mutex);
+	mod_delayed_work(system_wq, &devcd->del_wk, 0);
 
 	return count;
 }
@@ -151,12 +118,8 @@ static int devcd_free(struct device *dev, void *data)
 {
 	struct devcd_entry *devcd = dev_to_devcd(dev);
 
-	mutex_lock(&devcd->mutex);
-	if (!devcd->delete_work)
-		devcd->delete_work = true;
-
 	flush_delayed_work(&devcd->del_wk);
-	mutex_unlock(&devcd->mutex);
+
 	return 0;
 }
 
@@ -179,12 +142,10 @@ static ssize_t disabled_show(const struct class *class, const struct class_attri
  *                                                                 put_device() <- last reference
  *             error = fn(dev, data)                           devcd_dev_release()
  *             devcd_free(dev, data)                           kfree(devcd)
- *             mutex_lock(&devcd->mutex);
  *
  *
  * In the above diagram, it looks like disabled_store() would be racing with parallelly
- * running devcd_del() and result in memory abort while acquiring devcd->mutex which
- * is called after kfree of devcd memory after dropping its last reference with
+ * running devcd_del() and result in memory abort after dropping its last reference with
  * put_device(). However, this will not happens as fn(dev, data) runs
  * with its own reference to device via klist_node so it is not its last reference.
  * so, above situation would not occur.
@@ -374,20 +335,26 @@ void dev_coredumpm_timeout(struct device *dev, struct module *owner,
 	devcd->read = read;
 	devcd->free = free;
 	devcd->failing_dev = get_device(dev);
-	devcd->delete_work = false;
 
-	mutex_init(&devcd->mutex);
+	mutex_init(&devcd->init_mutex);
 	device_initialize(&devcd->devcd_dev);
 
 	dev_set_name(&devcd->devcd_dev, "devcd%d",
 		     atomic_inc_return(&devcd_count));
 	devcd->devcd_dev.class = &devcd_class;
 
-	mutex_lock(&devcd->mutex);
 	dev_set_uevent_suppress(&devcd->devcd_dev, true);
+
+	/* devcd->init_mutex prevents devcd_del() completing until init finishes */
+	mutex_lock(&devcd->init_mutex);
+	devcd->init_completed = false;
+	INIT_DELAYED_WORK(&devcd->del_wk, devcd_del);
+	schedule_delayed_work(&devcd->del_wk, timeout);
+
 	if (device_add(&devcd->devcd_dev))
 		goto put_device;
 
+
 	/*
 	 * These should normally not fail, but there is no problem
 	 * continuing without the links, so just warn instead of
@@ -401,13 +368,20 @@ void dev_coredumpm_timeout(struct device *dev, struct module *owner,
 
 	dev_set_uevent_suppress(&devcd->devcd_dev, false);
 	kobject_uevent(&devcd->devcd_dev.kobj, KOBJ_ADD);
-	INIT_DELAYED_WORK(&devcd->del_wk, devcd_del);
-	schedule_delayed_work(&devcd->del_wk, timeout);
-	mutex_unlock(&devcd->mutex);
+
+	/*
+	 * Safe to run devcd_del() now that we are done with devcd_dev.
+	 * Alternatively we could have taken a ref on devcd_dev before
+	 * dropping the lock.
+	 */
+	devcd->init_completed = true;
+	mutex_unlock(&devcd->init_mutex);
 	return;
  put_device:
+	mutex_unlock(&devcd->init_mutex);
+	cancel_delayed_work_sync(&devcd->del_wk);
 	put_device(&devcd->devcd_dev);
-	mutex_unlock(&devcd->mutex);
+
  put_module:
 	module_put(owner);
  free:
-- 
2.45.2

