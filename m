Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 878A7C38150
	for <intel-xe@archiver.kernel.org>; Sat,  6 Jul 2024 00:02:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB6A10E12F;
	Sat,  6 Jul 2024 00:02:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a9apTuqF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8598410E0E4
 for <intel-xe@lists.freedesktop.org>; Sat,  6 Jul 2024 00:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720224138; x=1751760138;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l2fyTwgwsvQh5mKgXt2uw2iyv0Qxt/ebRS9c/lxeMfw=;
 b=a9apTuqFD0BxyuRS0iDoS2XJH/2cXwJLsJMsBhcK4QkGNfPERsGNIHI1
 +Kjp21ZJYYYi21BBdSjOxB3/+yU4K22PlCiTFbSn/SqvXXmm6CoI1Wn5E
 eLXa/lMxefq0WaGYT1iQBCVAoCWMPM9bUx9BgcR9owqspQYeVOZ2i91/F
 r95HFiSXhEKdlxIEniHewfDJnZLXAumvOSeNjeyjCMomSnkz7FTTh0F2M
 VdVzCba4UHTMz8g6FHnmcr+Z7hfBWHolGpzzFlmJT502vgrsgLy2whxp0
 X8F0VMdori/2G4DXLdlsL9WIY6JboLZlMlHngnPDGap/+6FgovYBza0m0 Q==;
X-CSE-ConnectionGUID: DaqIHWwkSJ+1N6qVN3QM6A==
X-CSE-MsgGUID: EYKxFLa9SzeMQ2rDqmjOGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17464666"
X-IronPort-AV: E=Sophos;i="6.09,186,1716274800"; d="scan'208";a="17464666"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 17:02:16 -0700
X-CSE-ConnectionGUID: AzoFv9WCRNSoVN8IkrdQtw==
X-CSE-MsgGUID: R4wvrmHNT/GZXgJNUCNeNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,186,1716274800"; d="scan'208";a="78128271"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 17:02:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: farah.kassabri@intel.com,
	michal.wajdeczko@intel.com
Subject: [PATCH 11/11] drm/xe: Add GT TLB invalidation watermark debugfs
Date: Fri,  5 Jul 2024 17:02:52 -0700
Message-Id: <20240706000252.702044-12-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240706000252.702044-1-matthew.brost@intel.com>
References: <20240706000252.702044-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c             | 38 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.c              |  3 ++
 drivers/gpu/drm/xe/xe_device_types.h        |  5 +++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  8 ++---
 4 files changed, 50 insertions(+), 4 deletions(-)

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
index c7634acea938..74c2c33e043d 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -391,9 +391,6 @@ xe_gt_tlb_invalidation_coalesce_issue(struct xe_gt *gt,
 	xe_gt_assert(gt, list_empty(&coalesce->link));
 }
 
-/* Any more pending TLB invalidations start to hold in KMD */
-#define SEQNO_WATERMARK		16
-
 static int
 xe_gt_tlb_invalidation_coalesce_prep(struct xe_gt *gt,
 				     struct xe_gt_tlb_invalidation_fence *fence,
@@ -404,10 +401,13 @@ xe_gt_tlb_invalidation_coalesce_prep(struct xe_gt *gt,
 
 	lockdep_assert_held(&gt->tlb_invalidation.seqno_lock);
 
+	if (gt_to_xe(gt)->tlb_invalidation_watermark <= 1)	/* Disabled */
+		return 0;
+
 	spin_lock_irq(&gt->tlb_invalidation.pending_lock);
 
 	if (list_empty(&gt->tlb_invalidation.pending_coalesce) &&
-	    tlb_invalidation_seqno_diff(gt) < SEQNO_WATERMARK) {
+	    tlb_invalidation_seqno_diff(gt) < gt_to_xe(gt)->tlb_invalidation_watermark) {
 		ret = 0;
 		goto unlock;
 	}
-- 
2.34.1

