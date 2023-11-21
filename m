Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2714C54FB9
	for <intel-xe@archiver.kernel.org>; Tue, 21 Nov 2023 04:08:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD5010E035;
	Tue, 21 Nov 2023 04:08:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D2810E035
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Nov 2023 04:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700539737; x=1732075737;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GAk7Az7OOG/ws0lKo21WDTk4j6XqH5UzjRg+DB9WyRs=;
 b=I5w1tcyKKpYsITux8n3Vw+Kw6ub72FnyUUPRxGrUjjvEetKhaubrpoPF
 6ZUGkqHH6VdMS97PKBHtqWLePTOatYG8cmXsLEMLL3sqG6l1hkJ5D8x3o
 qlNVxRHA3Cdgvr71Xq9anJYULCB3uZs5H6Ug78abnLw1X7L40OCHgZGAE
 BRAxqtdVd3T7sKNWB1nSePuOsV85KwBOGgfLmEpMrO2HtJFVhT/n94NCQ
 igUu6cYpGQSMtmmxkGjvd0YpwDXCxdPAWAYSHCaWMMZTNMFstHlUAzXFY
 zaQZh3fXw9XPHDNV6xwBkPNgc8P96jK4ISeyG1RVgrsmspYhaR4bxjVni g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="4883707"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="4883707"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 20:08:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="832504171"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="832504171"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 20:08:55 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 intel-xe@lists.freedesktop.org
Date: Mon, 20 Nov 2023 20:08:52 -0800
Message-ID: <20231121040852.462742-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] fixup! drm/xe: Moving and renaming existing
 frequency sysfs attributes
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Actually: Revert "drm/xe: Moving and renaming existing frequency sysfs attributes"

This reverts commit c2785fa716b862203a640564a849377d4d8470f5.

The commit is badly broken. Allow the author to fix and resubmit.

$ cat /sys/class/drm/card0/device/tile0/gt0/freq/min_freq
Segmentation fault

In dmesg:

[  786.327812] general protection fault, probably for non-canonical address 0xcccccccccccccccc: 0000 [#3] PREEMPT SMP NOPTI
[  786.327840] CPU: 13 PID: 2267 Comm: cat Tainted: G      D    O       6.6.0-rc3+ #15
[  786.327853] Hardware name: Intel Corporation Raptor Lake Client Platform/RaptorLake-P DDR5 RVP, BIOS RPLPFWI1.R00.4221.A00.2305271351 05/27/2023
[  786.327868] RIP: 0010:min_freq_show+0x15/0x120 [xe]
[  786.327973] RSP: 0018:ffffc9000481fdb8 EFLAGS: 00010282
[  786.327984] RAX: ffffffffa017aee0 RBX: cccccccccccccccc RCX: 0000000000000000
[  786.327994] RDX: ffff888147209000 RSI: ffffffffa02c3da0 RDI: ffff888103f2af40
[  786.328003] RBP: ffff888147209000 R08: 0000000000000001 R09: 0000000000000000
[  786.328013] R10: ffffc9000481fdf0 R11: ffffffff8147d0e2 R12: ffff888103f2af40
[  786.328022] R13: ffff888108df6800 R14: ffff88813d668e48 R15: 0000000000000001
[  786.328031] FS:  00007f8a5a4db740(0000) GS:ffff88906f880000(0000) knlGS:0000000000000000
[  786.328043] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  786.328051] CR2: 00007f8a5a462000 CR3: 000000013d85c000 CR4: 0000000000f50ee0
[  786.328061] PKRU: 55555554
[  786.328066] Call Trace:
[  786.328072]  <TASK>
[  786.328077]  ? die_addr+0x32/0x90
[  786.328090]  ? exc_general_protection+0x1a5/0x3f0
[  786.328104]  ? asm_exc_general_protection+0x26/0x30
[  786.328118]  ? kernfs_seq_start+0x22/0x110
[  786.328130]  ? __pfx_min_freq_show+0x10/0x10 [xe]
[  786.328189]  ? min_freq_show+0x15/0x120 [xe]
[  786.328241]  sysfs_kf_seq_show+0xb5/0x100
[  786.328252]  seq_read_iter+0x111/0x4c0
[  786.328264]  vfs_read+0x1c7/0x330
[  786.328276]  ksys_read+0x64/0xe0
[  786.328285]  do_syscall_64+0x3c/0x90
[  786.328293]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 65 ++++++++++++++++------------------
 1 file changed, 31 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 2047bc5265490..e9dd6c3d750bd 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -57,15 +57,15 @@
  * Xe's GuC PC provides a sysfs API for frequency management:
  *
  * device/gt#/freq_* *read-only* files:
- * - act_freq: The actual resolved frequency decided by PCODE.
- * - cur_freq: The current one requested by GuC PC to the Hardware.
- * - rpn_freq: The Render Performance (RP) N level, which is the minimal one.
- * - rpe_freq: The Render Performance (RP) E level, which is the efficient one.
- * - rp0_freq: The Render Performance (RP) 0 level, which is the maximum one.
+ * - freq_act: The actual resolved frequency decided by PCODE.
+ * - freq_cur: The current one requested by GuC PC to the Hardware.
+ * - freq_rpn: The Render Performance (RP) N level, which is the minimal one.
+ * - freq_rpe: The Render Performance (RP) E level, which is the efficient one.
+ * - freq_rp0: The Render Performance (RP) 0 level, which is the maximum one.
  *
  * device/gt#/freq_* *read-write* files:
- * - min_freq: GuC PC min request.
- * - max_freq: GuC PC max request.
+ * - freq_min: GuC PC min request.
+ * - freq_max: GuC PC max request.
  *             If max <= min, then freq_min becomes a fixed frequency request.
  *
  * Render-C States:
@@ -385,7 +385,7 @@ static void pc_update_rp_values(struct xe_guc_pc *pc)
 	pc->rpn_freq = min(pc->rpn_freq, pc->rpe_freq);
 }
 
-static ssize_t act_freq_show(struct device *dev,
+static ssize_t freq_act_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
 	struct kobject *kobj = &dev->kobj;
@@ -410,9 +410,9 @@ static ssize_t act_freq_show(struct device *dev,
 	xe_device_mem_access_put(gt_to_xe(gt));
 	return ret;
 }
-static DEVICE_ATTR_RO(act_freq);
+static DEVICE_ATTR_RO(freq_act);
 
-static ssize_t cur_freq_show(struct device *dev,
+static ssize_t freq_cur_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
 	struct kobject *kobj = &dev->kobj;
@@ -439,18 +439,18 @@ static ssize_t cur_freq_show(struct device *dev,
 	xe_device_mem_access_put(gt_to_xe(gt));
 	return ret;
 }
-static DEVICE_ATTR_RO(cur_freq);
+static DEVICE_ATTR_RO(freq_cur);
 
-static ssize_t rp0_freq_show(struct device *dev,
+static ssize_t freq_rp0_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
 	struct xe_guc_pc *pc = dev_to_pc(dev);
 
 	return sysfs_emit(buf, "%d\n", pc->rp0_freq);
 }
-static DEVICE_ATTR_RO(rp0_freq);
+static DEVICE_ATTR_RO(freq_rp0);
 
-static ssize_t rpe_freq_show(struct device *dev,
+static ssize_t freq_rpe_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
 	struct xe_guc_pc *pc = dev_to_pc(dev);
@@ -462,18 +462,18 @@ static ssize_t rpe_freq_show(struct device *dev,
 	xe_device_mem_access_put(xe);
 	return sysfs_emit(buf, "%d\n", pc->rpe_freq);
 }
-static DEVICE_ATTR_RO(rpe_freq);
+static DEVICE_ATTR_RO(freq_rpe);
 
-static ssize_t rpn_freq_show(struct device *dev,
+static ssize_t freq_rpn_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
 	struct xe_guc_pc *pc = dev_to_pc(dev);
 
 	return sysfs_emit(buf, "%d\n", pc->rpn_freq);
 }
-static DEVICE_ATTR_RO(rpn_freq);
+static DEVICE_ATTR_RO(freq_rpn);
 
-static ssize_t min_freq_show(struct device *dev,
+static ssize_t freq_min_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
 	struct xe_guc_pc *pc = dev_to_pc(dev);
@@ -510,7 +510,7 @@ static ssize_t min_freq_show(struct device *dev,
 	return ret;
 }
 
-static ssize_t min_freq_store(struct device *dev, struct device_attribute *attr,
+static ssize_t freq_min_store(struct device *dev, struct device_attribute *attr,
 			      const char *buff, size_t count)
 {
 	struct xe_guc_pc *pc = dev_to_pc(dev);
@@ -540,9 +540,9 @@ static ssize_t min_freq_store(struct device *dev, struct device_attribute *attr,
 	xe_device_mem_access_put(pc_to_xe(pc));
 	return ret ?: count;
 }
-static DEVICE_ATTR_RW(min_freq);
+static DEVICE_ATTR_RW(freq_min);
 
-static ssize_t max_freq_show(struct device *dev,
+static ssize_t freq_max_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
 	struct xe_guc_pc *pc = dev_to_pc(dev);
@@ -568,7 +568,7 @@ static ssize_t max_freq_show(struct device *dev,
 	return ret;
 }
 
-static ssize_t max_freq_store(struct device *dev, struct device_attribute *attr,
+static ssize_t freq_max_store(struct device *dev, struct device_attribute *attr,
 			      const char *buff, size_t count)
 {
 	struct xe_guc_pc *pc = dev_to_pc(dev);
@@ -598,7 +598,7 @@ static ssize_t max_freq_store(struct device *dev, struct device_attribute *attr,
 	xe_device_mem_access_put(pc_to_xe(pc));
 	return ret ?: count;
 }
-static DEVICE_ATTR_RW(max_freq);
+static DEVICE_ATTR_RW(freq_max);
 
 /**
  * xe_guc_pc_c_status - get the current GT C state
@@ -664,13 +664,13 @@ u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc)
 }
 
 static const struct attribute *pc_attrs[] = {
-	&dev_attr_act_freq.attr,
-	&dev_attr_cur_freq.attr,
-	&dev_attr_rp0_freq.attr,
-	&dev_attr_rpe_freq.attr,
-	&dev_attr_rpn_freq.attr,
-	&dev_attr_min_freq.attr,
-	&dev_attr_max_freq.attr,
+	&dev_attr_freq_act.attr,
+	&dev_attr_freq_cur.attr,
+	&dev_attr_freq_rp0.attr,
+	&dev_attr_freq_rpe.attr,
+	&dev_attr_freq_rpn.attr,
+	&dev_attr_freq_min.attr,
+	&dev_attr_freq_max.attr,
 	NULL
 };
 
@@ -950,7 +950,6 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_bo *bo;
-	struct kobject *kobj;
 	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
 	int err;
 
@@ -966,9 +965,7 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 
 	pc->bo = bo;
 
-	kobj = kobject_create_and_add("freq", gt->sysfs);
-
-	err = sysfs_create_files(kobj, pc_attrs);
+	err = sysfs_create_files(gt->sysfs, pc_attrs);
 	if (err)
 		return err;
 
-- 
2.41.0

