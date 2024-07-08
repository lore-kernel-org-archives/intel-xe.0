Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148C2C3DA42
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 04:02:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD5E110E1EB;
	Mon,  8 Jul 2024 04:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jZVQCwRO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C07510E012
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jul 2024 04:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720411373; x=1751947373;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=acxZmMmz0kAa2oTq7TiuTGu3OK6qLIj1s9x++I2NV08=;
 b=jZVQCwRO/G0JpbhF4a9ZWwsYQN+EP4iCq972fyg0a0JdMAKNqzELlKXT
 YD+Ioatl722uPfzt9c52rnbnOdS6PkZgU2yV07WAuUot4vW51aL3tHEYT
 JykI3xttVwg2WBgLRzWyWdr0DTIs6dkQDHdzWZGqgkggFJnbSoYilMmdk
 /droxYwSso6TOvTcYWr4rW94gXXeRs2lq8qJUHu8RVp4fv8+aTP4QE+sF
 zFw0GhoAebkRST0k7f5rL9qv65BdcH2PnbAWulpQtRf8RKdJ/w8GmtwUC
 MKwgekyECZlwMhOlZHt+XTzI+mXJQcMt4XRnm0XLAmsMiQ0ie2al+aZa/ w==;
X-CSE-ConnectionGUID: dcDC+NtiTDOrJ8q4wJnRUg==
X-CSE-MsgGUID: OKphIMbNSHaDhD+HXsQFXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="28205309"
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; d="scan'208";a="28205309"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2024 21:02:53 -0700
X-CSE-ConnectionGUID: 1WDQ624aQbWi3CM1zEYA7w==
X-CSE-MsgGUID: XZj4WtfrTlqOijlKrYqiJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; d="scan'208";a="78518815"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2024 21:02:53 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: nirmoy.das@intel.com, farah.kassabri@intel.com, michal.wajdeczko@intel.com
Subject: [PATCH v2 11/11] drm/xe: Add GT TLB invalidation watermark debugfs
Date: Sun,  7 Jul 2024 21:03:31 -0700
Message-Id: <20240708040331.766264-12-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240708040331.766264-1-matthew.brost@intel.com>
References: <20240708040331.766264-1-matthew.brost@intel.com>
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

Add GT TLB invalidation watermark to debugfs for feature tuning and
disabling (less than equal to a value of 1).

v2:
 - Change watermark logic to be zero based

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c             | 38 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.c              |  3 ++
 drivers/gpu/drm/xe/xe_device_types.h        |  5 +++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  9 ++---
 4 files changed, 51 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 1011e5d281fa..dd27172197be 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -173,6 +173,41 @@ static const struct file_operations wedged_mode_fops = {
 	.write = wedged_mode_set,
 };
 
+static ssize_t tlb_invalidation_watermark_show(struct file *f, char __user *ubuf,
+					       size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	char buf[32];
+	int len = 0;
+
+	len = scnprintf(buf, sizeof(buf), "%d\n", xe->tlb_invalidation_watermark);
+
+	return simple_read_from_buffer(ubuf, size, pos, buf, len);
+}
+
+static ssize_t tlb_invalidation_watermark_set(struct file *f,
+					      const char __user *ubuf,
+					      size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	int tlb_invalidation_watermark;
+	ssize_t ret;
+
+	ret = kstrtoint_from_user(ubuf, size, 0, &tlb_invalidation_watermark);
+	if (ret)
+		return ret;
+
+	xe->tlb_invalidation_watermark = tlb_invalidation_watermark;
+
+	return size;
+}
+
+static const struct file_operations tlb_invalidation_watermark_fops = {
+	.owner = THIS_MODULE,
+	.read = tlb_invalidation_watermark_show,
+	.write = tlb_invalidation_watermark_set,
+};
+
 void xe_debugfs_register(struct xe_device *xe)
 {
 	struct ttm_device *bdev = &xe->ttm;
@@ -193,6 +228,9 @@ void xe_debugfs_register(struct xe_device *xe)
 	debugfs_create_file("wedged_mode", 0400, root, xe,
 			    &wedged_mode_fops);
 
+	debugfs_create_file("tlb_invalidation_watermark", 0400, root, xe,
+			    &tlb_invalidation_watermark_fops);
+
 	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; ++mem_type) {
 		man = ttm_manager_type(bdev, mem_type);
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index db513175b29e..6d5ef3563082 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -274,6 +274,9 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	xe->info.revid = pdev->revision;
 	xe->info.force_execlist = xe_modparam.force_execlist;
 
+#define TLB_INVALIDATION_WATERMARK_DEFAULT	16
+	xe->tlb_invalidation_watermark = TLB_INVALIDATION_WATERMARK_DEFAULT;
+
 	spin_lock_init(&xe->irq.lock);
 	spin_lock_init(&xe->clients.lock);
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index f0cf9020e463..7e029493110a 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -481,6 +481,11 @@ struct xe_device {
 		int mode;
 	} wedged;
 
+	/**
+	 * @tlb_invalidation_watermark: TLB invalidation watermark to coalesce
+	 */
+	int tlb_invalidation_watermark;
+
 #ifdef TEST_VM_OPS_ERROR
 	/**
 	 * @vm_inject_error_position: inject errors at different places in VM
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index db127432b469..097e53227e50 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -392,9 +392,6 @@ xe_gt_tlb_invalidation_coalesce_issue(struct xe_gt *gt,
 	xe_gt_assert(gt, list_empty(&coalesce->link));
 }
 
-/* Any more pending TLB invalidations start to hold in KMD */
-#define SEQNO_WATERMARK		16
-
 static int
 xe_gt_tlb_invalidation_coalesce_prep(struct xe_gt *gt,
 				     struct xe_gt_tlb_invalidation_fence *fence,
@@ -405,10 +402,14 @@ xe_gt_tlb_invalidation_coalesce_prep(struct xe_gt *gt,
 
 	lockdep_assert_held(&gt->tlb_invalidation.seqno_lock);
 
+	if (gt_to_xe(gt)->tlb_invalidation_watermark <= 0)	/* Disabled */
+		return 0;
+
 	spin_lock_irq(&gt->tlb_invalidation.pending_lock);
 
 	if (list_empty(&gt->tlb_invalidation.pending_coalesce) &&
-	    tlb_invalidation_seqno_diff(gt) < SEQNO_WATERMARK) {
+	    tlb_invalidation_seqno_diff(gt) <
+	    gt_to_xe(gt)->tlb_invalidation_watermark + 1) {
 		ret = 0;
 		goto unlock;
 	}
-- 
2.34.1

