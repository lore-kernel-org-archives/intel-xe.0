Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C78F5C7EE26
	for <intel-xe@archiver.kernel.org>; Mon, 22 May 2023 08:54:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9915910E27B;
	Mon, 22 May 2023 08:54:31 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5284410E27B
 for <intel-xe@lists.freedesktop.org>; Mon, 22 May 2023 08:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684745670; x=1716281670;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=I2WH0NYy0KLzWxGzkIhlfIAXHycKbNUWNOgo11lbKbI=;
 b=eY3IRMD3w8o/UWHYbul5PdthTG0Ut98QZFLFhO9Bft13BmSl9lKN7X+K
 WP9GIZ1fUPfTMXu9BbGldPgKOYz95SILUEkBIHLQHAJgAeRd9nNUUOii9
 V/I/L5UYM0f6wSBamFnGC9RLzktLYpMbAEg2IHjzl0o7JeQ97KRS/tux5
 Umoz1tWv3auPCU5cX+QiePSeGxTUcI65f6FAvpuoxcWqRAjYe1xwgayVf
 aDAH7Jm0R0DgWd4kYfLXD+7lKZaO7au5bAnDkzzKeGhMU2r9R4lPqqcGZ
 A3a5+h+vYcAmt1Ky2Jd3kw2ewJNtg5SNS19SMB8uMHuySN2c0D1sxrRME w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="439220099"
X-IronPort-AV: E=Sophos;i="6.00,183,1681196400"; d="scan'208";a="439220099"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 01:54:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="697574681"
X-IronPort-AV: E=Sophos;i="6.00,183,1681196400"; d="scan'208";a="697574681"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga007.jf.intel.com with ESMTP; 22 May 2023 01:54:27 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 22 May 2023 14:28:17 +0530
Message-Id: <20230522085817.1347213-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 1/1] drm/xe: Add a debugfs for faking gt reset
 failure.
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

In case of gt reset failure, KMD notifies userspace about failure
via uevent. To validate this notification we need to ensure gt
reset fails and there is no mechanism to cause failure from hardware.
Hence added a debugfs which will cause fake reset failure.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c         | 26 +++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_debugfs.c | 11 +++++++++++
 drivers/gpu/drm/xe/xe_gt_types.h   |  3 +++
 3 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index d98761d9eeba..e05615ca13e5 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -301,6 +301,9 @@ int xe_gt_init_early(struct xe_gt *gt)
 {
 	int err;
 
+	/* Reset is supported by default */
+	gt->reset_enabled = true;
+
 	xe_force_wake_init_gt(gt, gt_to_fw(gt));
 
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
@@ -605,6 +608,16 @@ static void xe_uevent_gt_reset_failure(struct xe_device *xe, u8 id)
 	kfree(reset_event[3]);
 }
 
+static int reset_disabled(struct xe_gt *gt)
+{
+	return !READ_ONCE(gt->reset_enabled);
+}
+
+static void enable_reset(struct xe_gt *gt)
+{
+	WRITE_ONCE(gt->reset_enabled, true);
+}
+
 static int gt_reset(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
@@ -617,8 +630,19 @@ static int gt_reset(struct xe_gt *gt)
 	drm_info(&xe->drm, "GT reset started\n");
 
 	xe_gt_sanitize(gt);
-
 	xe_device_mem_access_get(gt_to_xe(gt));
+
+	err = reset_disabled(gt);
+	if (err) {
+		drm_info(&xe->drm, "GT reset is disabled\n");
+
+		/*Enable GT reset for next call if disabled
+		 * for fake reset failure.
+		 */
+		enable_reset(gt);
+		goto err_msg;
+	}
+
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (err)
 		goto err_msg;
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index c45486c2015a..1c3e673c8c60 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -127,6 +127,16 @@ static int register_save_restore(struct seq_file *m, void *data)
 	return 0;
 }
 
+static int fake_reset_failure(struct seq_file *m, void *data)
+{
+	struct xe_gt *gt = node_to_gt(m->private);
+
+	WRITE_ONCE(gt->reset_enabled, false);
+	xe_gt_reset_async(gt);
+
+	return 0;
+}
+
 static const struct drm_info_list debugfs_list[] = {
 	{"hw_engines", hw_engines, 0},
 	{"force_reset", force_reset, 0},
@@ -135,6 +145,7 @@ static const struct drm_info_list debugfs_list[] = {
 	{"steering", steering, 0},
 	{"ggtt", ggtt, 0},
 	{"register-save-restore", register_save_restore, 0},
+	{"fake_reset_failure", fake_reset_failure, 0},
 };
 
 void xe_gt_debugfs_register(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 7c47d67aa8be..7ec19ad0365d 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -175,6 +175,9 @@ struct xe_gt {
 		struct work_struct worker;
 	} reset;
 
+	/** @reset_enabled: GT supports reset */
+	bool reset_enabled;
+
 	/** @tlb_invalidation: TLB invalidation state */
 	struct {
 		/** @seqno: TLB invalidation seqno, protected by CT lock */
-- 
2.25.1

