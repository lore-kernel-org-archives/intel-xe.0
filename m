Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E993C369C2
	for <intel-xe@archiver.kernel.org>; Tue, 22 Apr 2025 17:20:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12ECE10E2DF;
	Tue, 22 Apr 2025 17:20:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mnI3uQRA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54D7710E2DF
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Apr 2025 17:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745342406; x=1776878406;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8sgiZYnHPu/vuto7b7c86euHbA716BqUaDWR4vP3oU8=;
 b=mnI3uQRADXoH0yfhZzULiy1WwQTNCBasuT3o0oibz3TOEjVeVDupPunR
 QXbAeemR+FajFhl45Wudk+6t63+K+MigJDl6LIxaAyWJRKAewjfmzNJkq
 cdTJMeIJolnhL5iGDDk5x2bqntmXsnb/nAz1IgG0XVDp2+CKOT8lOyBVZ
 QzeZrsPYYzr0Ga2SRTLe9xFl3kPleq9uOWTT6BI1YqHBEfmChVNsnC2n3
 6/vb+YexjZCygOaeVbiVmqJ3BE+XuV6Z3Z4wuD9asRD4zZpGUS9zhmKCv
 t+FdgyVUOE+QxiWVur1YfN6EFCYsE6shpsXktoeUGJwaKS3zuX9ARC9Ko A==;
X-CSE-ConnectionGUID: 7q7bWuL+QLiuINdJqrIy2A==
X-CSE-MsgGUID: YpB3e3QPQw27TXRvEfe7aQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="58288675"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="58288675"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 10:20:05 -0700
X-CSE-ConnectionGUID: dqT1HacbQnSrctNJ8MYCcg==
X-CSE-MsgGUID: zNwwgo6oTqua3tX6A8vncA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="132074200"
Received: from intel-s2600stb.iind.intel.com (HELO
 08ca91f16b80.iind.intel.com) ([10.66.234.77])
 by fmviesa007.fm.intel.com with ESMTP; 22 Apr 2025 10:20:03 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH] drm/xe: Fix CFI violation when accessing sysfs files
Date: Tue, 22 Apr 2025 17:18:52 +0000
Message-ID: <20250422171852.85558-1-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
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

When an attribute group is created with sysfs_create_group() or
sysfs_create_files() the ->sysfs_ops() callback is set to
kobj_sysfs_ops, which sets the ->show() callback to kobj_attr_show().
kobj_attr_show() uses container_of() to get the ->show() callback
from the attribute it was passed, meaning the ->show() callback needs
to be the same type as the ->show() callback in 'struct kobj_attribute'.

However, cur_freq_show() has the type of the ->show() callback in
'struct device_attribute', which causes a CFI violation when opening the
'id' sysfs node under gtidle/freq/throttle. This happens to work because
the layout of 'struct kobj_attribute' and 'struct device_attribute' are
the same, so the container_of() cast happens to allow the ->show()
callback to still work.

Changed the type of cur_freq_show() and few more functions to match the
->show() callback in 'struct kobj_attributes' to resolve the CFI
violation.

CFI failure seen while accessing sysfs files under
/sys/class/drm/card0/device/tile0/gt*/gtidle/*
/sys/class/drm/card0/device/tile0/gt*/freq0/*
/sys/class/drm/card0/device/tile0/gt*/freq0/throttle/*

[ 2599.618075] RIP: 0010:__cfi_cur_freq_show+0xd/0x10 [xe]
[ 2599.624452] Code: 44 c1 44 89 fa e8 03 95 39 f2 48 98 5b 41 5e 41 5f 5d c3 c9
[ 2599.646638] RSP: 0018:ffffbe438ead7d10 EFLAGS: 00010286
[ 2599.652823] RAX: ffff9f7d8b3845d8 RBX: ffff9f7dee8c95d8 RCX: 0000000000000000
[ 2599.661246] RDX: ffff9f7e6f439000 RSI: ffffffffc13ada30 RDI: ffff9f7d975d4b00
[ 2599.669669] RBP: ffffbe438ead7d18 R08: 0000000000001000 R09: ffff9f7e6f439000
[ 2599.678092] R10: 00000000e07304a6 R11: ffffffffc1241ca0 R12: ffffffffb4836ea0
[ 2599.688435] R13: ffff9f7e45fb1180 R14: ffff9f7d975d4b00 R15: ffff9f7e6f439000
[ 2599.696860] FS: 000076b02b66cfc0(0000) GS:ffff9f80ef400000(0000) knlGS:00000
[ 2599.706412] CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 2599.713196] CR2: 00005f80d94641a9 CR3: 00000001e44ec006 CR4: 0000000100f72ef0
[ 2599.721618] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[ 2599.730041] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 0000000000000400
[ 2599.738464] PKRU: 55555554
[ 2599.741655] Call Trace:
[ 2599.744541] <TASK>
[ 2599.747017] ? __die_body+0x69/0xb0
[ 2599.751151] ? die+0xa9/0xd0
[ 2599.754548] ? do_trap+0x89/0x160
[ 2599.758476] ? __cfi_cur_freq_show+0xd/0x10 [xe b37985c94829727668bd7c5b33c1]
[ 2599.768315] ? handle_invalid_op+0x69/0x90
[ 2599.773167] ? __cfi_cur_freq_show+0xd/0x10 [xe b37985c94829727668bd7c5b33c1]
[ 2599.783010] ? exc_invalid_op+0x36/0x60
[ 2599.787552] ? fred_hwexc+0x123/0x1a0
[ 2599.791873] ? fred_entry_from_kernel+0x7b/0xd0
[ 2599.797219] ? asm_fred_entrypoint_kernel+0x45/0x70
[ 2599.802976] ? act_freq_show+0x70/0x70 [xe b37985c94829727668bd7c5b33c1d9998]
[ 2599.812301] ? __cfi_cur_freq_show+0xd/0x10 [xe b37985c94829727668bd7c5b33c1]
[ 2599.822137] ? __kmalloc_node_noprof+0x1f3/0x420
[ 2599.827594] ? __kvmalloc_node_noprof+0xcb/0x180
[ 2599.833045] ? kobj_attr_show+0x22/0x40
[ 2599.837571] sysfs_kf_seq_show+0xa8/0x110
[ 2599.842302] kernfs_seq_show+0x38/0x50

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_freq.c     | 82 ++++++++++++++------------
 drivers/gpu/drm/xe/xe_gt_idle.c     | 28 +++++----
 drivers/gpu/drm/xe/xe_gt_throttle.c | 90 ++++++++++++++---------------
 3 files changed, 107 insertions(+), 93 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
index 604bdc7c8173..868a5d2c1a52 100644
--- a/drivers/gpu/drm/xe/xe_gt_freq.c
+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
@@ -56,9 +56,10 @@ dev_to_xe(struct device *dev)
 	return gt_to_xe(kobj_to_gt(dev->kobj.parent));
 }
 
-static ssize_t act_freq_show(struct device *dev,
-			     struct device_attribute *attr, char *buf)
+static ssize_t act_freq_show(struct kobject *kobj,
+			     struct kobj_attribute *attr, char *buf)
 {
+	struct device *dev = kobj_to_dev(kobj);
 	struct xe_guc_pc *pc = dev_to_pc(dev);
 	u32 freq;
 
@@ -68,11 +69,12 @@ static ssize_t act_freq_show(struct device *dev,
 
 	return sysfs_emit(buf, "%d\n", freq);
 }
-static DEVICE_ATTR_RO(act_freq);
+static struct kobj_attribute attr_act_freq = __ATTR_RO(act_freq);
 
-static ssize_t cur_freq_show(struct device *dev,
-			     struct device_attribute *attr, char *buf)
+static ssize_t cur_freq_show(struct kobject *kobj,
+			     struct kobj_attribute *attr, char *buf)
 {
+	struct device *dev = kobj_to_dev(kobj);
 	struct xe_guc_pc *pc = dev_to_pc(dev);
 	u32 freq;
 	ssize_t ret;
@@ -85,11 +87,12 @@ static ssize_t cur_freq_show(struct device *dev,
 
 	return sysfs_emit(buf, "%d\n", freq);
 }
-static DEVICE_ATTR_RO(cur_freq);
+static struct kobj_attribute attr_cur_freq = __ATTR_RO(cur_freq);
 
-static ssize_t rp0_freq_show(struct device *dev,
-			     struct device_attribute *attr, char *buf)
+static ssize_t rp0_freq_show(struct kobject *kobj,
+			     struct kobj_attribute *attr, char *buf)
 {
+	struct device *dev = kobj_to_dev(kobj);
 	struct xe_guc_pc *pc = dev_to_pc(dev);
 	u32 freq;
 
@@ -99,11 +102,12 @@ static ssize_t rp0_freq_show(struct device *dev,
 
 	return sysfs_emit(buf, "%d\n", freq);
 }
-static DEVICE_ATTR_RO(rp0_freq);
+static struct kobj_attribute attr_rp0_freq = __ATTR_RO(rp0_freq);
 
-static ssize_t rpe_freq_show(struct device *dev,
-			     struct device_attribute *attr, char *buf)
+static ssize_t rpe_freq_show(struct kobject *kobj,
+			     struct kobj_attribute *attr, char *buf)
 {
+	struct device *dev = kobj_to_dev(kobj);
 	struct xe_guc_pc *pc = dev_to_pc(dev);
 	u32 freq;
 
@@ -113,11 +117,12 @@ static ssize_t rpe_freq_show(struct device *dev,
 
 	return sysfs_emit(buf, "%d\n", freq);
 }
-static DEVICE_ATTR_RO(rpe_freq);
+static struct kobj_attribute attr_rpe_freq = __ATTR_RO(rpe_freq);
 
-static ssize_t rpa_freq_show(struct device *dev,
-			     struct device_attribute *attr, char *buf)
+static ssize_t rpa_freq_show(struct kobject *kobj,
+			     struct kobj_attribute *attr, char *buf)
 {
+	struct device *dev = kobj_to_dev(kobj);
 	struct xe_guc_pc *pc = dev_to_pc(dev);
 	u32 freq;
 
@@ -127,20 +132,22 @@ static ssize_t rpa_freq_show(struct device *dev,
 
 	return sysfs_emit(buf, "%d\n", freq);
 }
-static DEVICE_ATTR_RO(rpa_freq);
+static struct kobj_attribute attr_rpa_freq = __ATTR_RO(rpa_freq);
 
-static ssize_t rpn_freq_show(struct device *dev,
-			     struct device_attribute *attr, char *buf)
+static ssize_t rpn_freq_show(struct kobject *kobj,
+			     struct kobj_attribute *attr, char *buf)
 {
+	struct device *dev = kobj_to_dev(kobj);
 	struct xe_guc_pc *pc = dev_to_pc(dev);
 
 	return sysfs_emit(buf, "%d\n", xe_guc_pc_get_rpn_freq(pc));
 }
-static DEVICE_ATTR_RO(rpn_freq);
+static struct kobj_attribute attr_rpn_freq = __ATTR_RO(rpn_freq);
 
-static ssize_t min_freq_show(struct device *dev,
-			     struct device_attribute *attr, char *buf)
+static ssize_t min_freq_show(struct kobject *kobj,
+			     struct kobj_attribute *attr, char *buf)
 {
+	struct device *dev = kobj_to_dev(kobj);
 	struct xe_guc_pc *pc = dev_to_pc(dev);
 	u32 freq;
 	ssize_t ret;
@@ -154,9 +161,10 @@ static ssize_t min_freq_show(struct device *dev,
 	return sysfs_emit(buf, "%d\n", freq);
 }
 
-static ssize_t min_freq_store(struct device *dev, struct device_attribute *attr,
-			      const char *buff, size_t count)
+static ssize_t min_freq_store(struct kobject *kobj,
+			      struct kobj_attribute *attr, const char *buff, size_t count)
 {
+	struct device *dev = kobj_to_dev(kobj);
 	struct xe_guc_pc *pc = dev_to_pc(dev);
 	u32 freq;
 	ssize_t ret;
@@ -173,11 +181,12 @@ static ssize_t min_freq_store(struct device *dev, struct device_attribute *attr,
 
 	return count;
 }
-static DEVICE_ATTR_RW(min_freq);
+static struct kobj_attribute attr_min_freq = __ATTR_RW(min_freq);
 
-static ssize_t max_freq_show(struct device *dev,
-			     struct device_attribute *attr, char *buf)
+static ssize_t max_freq_show(struct kobject *kobj,
+			     struct kobj_attribute *attr, char *buf)
 {
+	struct device *dev = kobj_to_dev(kobj);
 	struct xe_guc_pc *pc = dev_to_pc(dev);
 	u32 freq;
 	ssize_t ret;
@@ -191,9 +200,10 @@ static ssize_t max_freq_show(struct device *dev,
 	return sysfs_emit(buf, "%d\n", freq);
 }
 
-static ssize_t max_freq_store(struct device *dev, struct device_attribute *attr,
-			      const char *buff, size_t count)
+static ssize_t max_freq_store(struct kobject *kobj,
+			      struct kobj_attribute *attr, const char *buff, size_t count)
 {
+	struct device *dev = kobj_to_dev(kobj);
 	struct xe_guc_pc *pc = dev_to_pc(dev);
 	u32 freq;
 	ssize_t ret;
@@ -210,17 +220,17 @@ static ssize_t max_freq_store(struct device *dev, struct device_attribute *attr,
 
 	return count;
 }
-static DEVICE_ATTR_RW(max_freq);
+static struct kobj_attribute attr_max_freq = __ATTR_RW(max_freq);
 
 static const struct attribute *freq_attrs[] = {
-	&dev_attr_act_freq.attr,
-	&dev_attr_cur_freq.attr,
-	&dev_attr_rp0_freq.attr,
-	&dev_attr_rpa_freq.attr,
-	&dev_attr_rpe_freq.attr,
-	&dev_attr_rpn_freq.attr,
-	&dev_attr_min_freq.attr,
-	&dev_attr_max_freq.attr,
+	&attr_act_freq.attr,
+	&attr_cur_freq.attr,
+	&attr_rp0_freq.attr,
+	&attr_rpa_freq.attr,
+	&attr_rpe_freq.attr,
+	&attr_rpn_freq.attr,
+	&attr_min_freq.attr,
+	&attr_max_freq.attr,
 	NULL
 };
 
diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index fbbace7b0b12..c11206410a4d 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -249,9 +249,10 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
 	return 0;
 }
 
-static ssize_t name_show(struct device *dev,
-			 struct device_attribute *attr, char *buff)
+static ssize_t name_show(struct kobject *kobj,
+			 struct kobj_attribute *attr, char *buff)
 {
+	struct device *dev = kobj_to_dev(kobj);
 	struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
 	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
 	ssize_t ret;
@@ -262,11 +263,12 @@ static ssize_t name_show(struct device *dev,
 
 	return ret;
 }
-static DEVICE_ATTR_RO(name);
+static struct kobj_attribute name_attr = __ATTR_RO(name);
 
-static ssize_t idle_status_show(struct device *dev,
-				struct device_attribute *attr, char *buff)
+static ssize_t idle_status_show(struct kobject *kobj,
+				struct kobj_attribute *attr, char *buff)
 {
+	struct device *dev = kobj_to_dev(kobj);
 	struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
 	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
 	enum xe_gt_idle_state state;
@@ -277,6 +279,7 @@ static ssize_t idle_status_show(struct device *dev,
 
 	return sysfs_emit(buff, "%s\n", gt_idle_state_to_string(state));
 }
+static struct kobj_attribute idle_status_attr = __ATTR_RO(idle_status);
 
 u64 xe_gt_idle_residency_msec(struct xe_gt_idle *gtidle)
 {
@@ -291,10 +294,11 @@ u64 xe_gt_idle_residency_msec(struct xe_gt_idle *gtidle)
 	return residency;
 }
 
-static DEVICE_ATTR_RO(idle_status);
-static ssize_t idle_residency_ms_show(struct device *dev,
-				      struct device_attribute *attr, char *buff)
+
+static ssize_t idle_residency_ms_show(struct kobject *kobj,
+				      struct kobj_attribute *attr, char *buff)
 {
+	struct device *dev = kobj_to_dev(kobj);
 	struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
 	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
 	u64 residency;
@@ -305,12 +309,12 @@ static ssize_t idle_residency_ms_show(struct device *dev,
 
 	return sysfs_emit(buff, "%llu\n", residency);
 }
-static DEVICE_ATTR_RO(idle_residency_ms);
+static struct kobj_attribute idle_residency_attr = __ATTR_RO(idle_residency_ms);
 
 static const struct attribute *gt_idle_attrs[] = {
-	&dev_attr_name.attr,
-	&dev_attr_idle_status.attr,
-	&dev_attr_idle_residency_ms.attr,
+	&name_attr.attr,
+	&idle_status_attr.attr,
+	&idle_residency_attr.attr,
 	NULL,
 };
 
diff --git a/drivers/gpu/drm/xe/xe_gt_throttle.c b/drivers/gpu/drm/xe/xe_gt_throttle.c
index 8db78d616b6f..aa962c783cdf 100644
--- a/drivers/gpu/drm/xe/xe_gt_throttle.c
+++ b/drivers/gpu/drm/xe/xe_gt_throttle.c
@@ -114,115 +114,115 @@ static u32 read_reason_vr_tdc(struct xe_gt *gt)
 	return tdc;
 }
 
-static ssize_t status_show(struct device *dev,
-			   struct device_attribute *attr,
-			   char *buff)
+static ssize_t status_show(struct kobject *kobj,
+			   struct kobj_attribute *attr, char *buff)
 {
+	struct device *dev = kobj_to_dev(kobj);
 	struct xe_gt *gt = dev_to_gt(dev);
 	bool status = !!read_status(gt);
 
 	return sysfs_emit(buff, "%u\n", status);
 }
-static DEVICE_ATTR_RO(status);
+static struct kobj_attribute attr_status = __ATTR_RO(status);
 
-static ssize_t reason_pl1_show(struct device *dev,
-			       struct device_attribute *attr,
-			       char *buff)
+static ssize_t reason_pl1_show(struct kobject *kobj,
+			       struct kobj_attribute *attr, char *buff)
 {
+	struct device *dev = kobj_to_dev(kobj);
 	struct xe_gt *gt = dev_to_gt(dev);
 	bool pl1 = !!read_reason_pl1(gt);
 
 	return sysfs_emit(buff, "%u\n", pl1);
 }
-static DEVICE_ATTR_RO(reason_pl1);
+static struct kobj_attribute attr_reason_pl1 = __ATTR_RO(reason_pl1);
 
-static ssize_t reason_pl2_show(struct device *dev,
-			       struct device_attribute *attr,
-			       char *buff)
+static ssize_t reason_pl2_show(struct kobject *kobj,
+			       struct kobj_attribute *attr, char *buff)
 {
+	struct device *dev = kobj_to_dev(kobj);
 	struct xe_gt *gt = dev_to_gt(dev);
 	bool pl2 = !!read_reason_pl2(gt);
 
 	return sysfs_emit(buff, "%u\n", pl2);
 }
-static DEVICE_ATTR_RO(reason_pl2);
+static struct kobj_attribute attr_reason_pl2 = __ATTR_RO(reason_pl2);
 
-static ssize_t reason_pl4_show(struct device *dev,
-			       struct device_attribute *attr,
-			       char *buff)
+static ssize_t reason_pl4_show(struct kobject *kobj,
+			       struct kobj_attribute *attr, char *buff)
 {
+	struct device *dev = kobj_to_dev(kobj);
 	struct xe_gt *gt = dev_to_gt(dev);
 	bool pl4 = !!read_reason_pl4(gt);
 
 	return sysfs_emit(buff, "%u\n", pl4);
 }
-static DEVICE_ATTR_RO(reason_pl4);
+static struct kobj_attribute attr_reason_pl4 = __ATTR_RO(reason_pl4);
 
-static ssize_t reason_thermal_show(struct device *dev,
-				   struct device_attribute *attr,
-				   char *buff)
+static ssize_t reason_thermal_show(struct kobject *kobj,
+				   struct kobj_attribute *attr, char *buff)
 {
+	struct device *dev = kobj_to_dev(kobj);
 	struct xe_gt *gt = dev_to_gt(dev);
 	bool thermal = !!read_reason_thermal(gt);
 
 	return sysfs_emit(buff, "%u\n", thermal);
 }
-static DEVICE_ATTR_RO(reason_thermal);
+static struct kobj_attribute attr_reason_thermal = __ATTR_RO(reason_thermal);
 
-static ssize_t reason_prochot_show(struct device *dev,
-				   struct device_attribute *attr,
-				   char *buff)
+static ssize_t reason_prochot_show(struct kobject *kobj,
+				   struct kobj_attribute *attr, char *buff)
 {
+	struct device *dev = kobj_to_dev(kobj);
 	struct xe_gt *gt = dev_to_gt(dev);
 	bool prochot = !!read_reason_prochot(gt);
 
 	return sysfs_emit(buff, "%u\n", prochot);
 }
-static DEVICE_ATTR_RO(reason_prochot);
+static struct kobj_attribute attr_reason_prochot = __ATTR_RO(reason_prochot);
 
-static ssize_t reason_ratl_show(struct device *dev,
-				struct device_attribute *attr,
-				char *buff)
+static ssize_t reason_ratl_show(struct kobject *kobj,
+				struct kobj_attribute *attr, char *buff)
 {
+	struct device *dev = kobj_to_dev(kobj);
 	struct xe_gt *gt = dev_to_gt(dev);
 	bool ratl = !!read_reason_ratl(gt);
 
 	return sysfs_emit(buff, "%u\n", ratl);
 }
-static DEVICE_ATTR_RO(reason_ratl);
+static struct kobj_attribute attr_reason_ratl = __ATTR_RO(reason_ratl);
 
-static ssize_t reason_vr_thermalert_show(struct device *dev,
-					 struct device_attribute *attr,
-					 char *buff)
+static ssize_t reason_vr_thermalert_show(struct kobject *kobj,
+					 struct kobj_attribute *attr, char *buff)
 {
+	struct device *dev = kobj_to_dev(kobj);
 	struct xe_gt *gt = dev_to_gt(dev);
 	bool thermalert = !!read_reason_vr_thermalert(gt);
 
 	return sysfs_emit(buff, "%u\n", thermalert);
 }
-static DEVICE_ATTR_RO(reason_vr_thermalert);
+static struct kobj_attribute attr_reason_vr_thermalert = __ATTR_RO(reason_vr_thermalert);
 
-static ssize_t reason_vr_tdc_show(struct device *dev,
-				  struct device_attribute *attr,
-				  char *buff)
+static ssize_t reason_vr_tdc_show(struct kobject *kobj,
+				  struct kobj_attribute *attr, char *buff)
 {
+	struct device *dev = kobj_to_dev(kobj);
 	struct xe_gt *gt = dev_to_gt(dev);
 	bool tdc = !!read_reason_vr_tdc(gt);
 
 	return sysfs_emit(buff, "%u\n", tdc);
 }
-static DEVICE_ATTR_RO(reason_vr_tdc);
+static struct kobj_attribute attr_reason_vr_tdc = __ATTR_RO(reason_vr_tdc);
 
 static struct attribute *throttle_attrs[] = {
-	&dev_attr_status.attr,
-	&dev_attr_reason_pl1.attr,
-	&dev_attr_reason_pl2.attr,
-	&dev_attr_reason_pl4.attr,
-	&dev_attr_reason_thermal.attr,
-	&dev_attr_reason_prochot.attr,
-	&dev_attr_reason_ratl.attr,
-	&dev_attr_reason_vr_thermalert.attr,
-	&dev_attr_reason_vr_tdc.attr,
+	&attr_status.attr,
+	&attr_reason_pl1.attr,
+	&attr_reason_pl2.attr,
+	&attr_reason_pl4.attr,
+	&attr_reason_thermal.attr,
+	&attr_reason_prochot.attr,
+	&attr_reason_ratl.attr,
+	&attr_reason_vr_thermalert.attr,
+	&attr_reason_vr_tdc.attr,
 	NULL
 };
 
-- 
2.49.0

