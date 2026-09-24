Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF8AC9831E
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 23:02:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49CBD10E8C6;
	Thu, 24 Sep 2026 23:02:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mRpBTrMI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B754E10E767
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 23:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790290883; x=1821826883;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5FlVHhGajFIzWlD1sxm8PIsbLhnEJibEeo1Q4KBL7EQ=;
 b=mRpBTrMISAg0OnHI9uLJmo7ZfmRGJzro4wUNtEjleX7WdPy+MjAfgAEo
 re3i2k0EA2IZTuSCrTx+zuyURT0f/Mll2VMTCJ3f8nJOEsyrW3pT8JoHQ
 2ZDEqq5e0etc0HgZH72S7ywh3HEJQcI4pFClrWyQQzoJrHuWYbFttl9Ei
 WUo/7VHeSyR2miut/FTSavHH9jfH2k9cLNj4Mx+hCp8HtJ4D46dr50s6o
 kBIOCQpowOMIBbcrQCzjrkl+9z6T4F3jtCZcN5PfwShlRJ4gfprlMUwdV
 OVfGd5Tmhs1dFT0fvitc9hkUDIpy3oWZn3HBFSAewWvH3MrJIEhxRJwJy w==;
X-CSE-ConnectionGUID: HTyPI22LTIiF/S2MJ7uHug==
X-CSE-MsgGUID: zwPwNLiFRZiNZDyESnBhLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90120170"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="90120170"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 16:01:22 -0700
X-CSE-ConnectionGUID: OnHvaWioT4+nCSF/9CdBaA==
X-CSE-MsgGUID: a0oM7RURQkm4nywFLI2GyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="270651594"
Received: from dut4435arlh.fm.intel.com ([10.105.8.61])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 16:01:21 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, umesh.nerlige.ramappa@intel.com,
 gustavo.sousa@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com, shuicheng.lin@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 03/16] drm/xe/configfs: Copy wa_bb out under the configfs lock
Date: Thu, 24 Sep 2026 23:01:22 +0000
Message-ID: <20260924230120.389685-21-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924230120.389685-18-stuart.summers@intel.com>
References: <20260924230120.389685-18-stuart.summers@intel.com>
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

The ctx_restore_{mid,post}_bb getters handed the caller a pointer into
storage owned by the configfs group and then dropped both the lock and
the group reference. A concurrent store can krealloc() that buffer and
an rmdir can free it outright, leaving the caller in xe_lrc.c to
memcpy() from freed memory. Copy the batch into a caller supplied
buffer while the lock is still held instead, which also folds the
length check the callers were doing into the getters.

Fixes: 6c6988c5e03d ("drm/xe/lrc: Allow to add user commands on context switch")
Fixes: 39ac06f70062 ("drm/xe/configfs: Add post context restore bb")

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Assisted-by: Copilot:claude-opus-5
---
 drivers/gpu/drm/xe/xe_configfs.c | 52 ++++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_configfs.h | 24 +++++++--------
 drivers/gpu/drm/xe/xe_lrc.c      | 38 +++++++----------------
 3 files changed, 59 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index c4ef151c9008..50bfc357ce4e 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -1374,25 +1374,34 @@ bool xe_configfs_get_disable_vram_page_offline(struct pci_dev *pdev)
  * xe_configfs_get_ctx_restore_mid_bb - get configfs ctx_restore_mid_bb setting
  * @pdev: pci device
  * @class: hw engine class
- * @cs: pointer to the bb to use - only valid during probe
+ * @cs: destination buffer for the batch, or NULL to only query the length
+ * @max_len: capacity of @cs, in dwords
  *
- * Return: Number of dwords used in the mid_ctx_restore setting in configfs
+ * Copy the configured batch into @cs while holding the configfs lock, so the
+ * caller never gets a pointer to storage owned by the configfs group.
+ *
+ * Return: Number of dwords used in the mid_ctx_restore setting in configfs, or
+ * -ENOSPC if it does not fit in @max_len
  */
-u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
-				       enum xe_engine_class class,
-				       const u32 **cs)
+ssize_t xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
+					   enum xe_engine_class class,
+					   u32 *cs, size_t max_len)
 {
 	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
-	u32 len;
+	ssize_t len;
 
 	if (!dev)
 		return 0;
 
 	scoped_guard(mutex, &dev->lock) {
-		if (cs)
-			*cs = dev->config.ctx_restore_mid_bb[class].cs;
-
 		len = dev->config.ctx_restore_mid_bb[class].len;
+		if (cs && len) {
+			if (len > max_len)
+				len = -ENOSPC;
+			else
+				memcpy(cs, dev->config.ctx_restore_mid_bb[class].cs,
+				       len * sizeof(u32));
+		}
 	}
 	config_group_put(&dev->group);
 
@@ -1403,23 +1412,34 @@ u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
  * xe_configfs_get_ctx_restore_post_bb - get configfs ctx_restore_post_bb setting
  * @pdev: pci device
  * @class: hw engine class
- * @cs: pointer to the bb to use - only valid during probe
+ * @cs: destination buffer for the batch, or NULL to only query the length
+ * @max_len: capacity of @cs, in dwords
  *
- * Return: Number of dwords used in the post_ctx_restore setting in configfs
+ * Copy the configured batch into @cs while holding the configfs lock, so the
+ * caller never gets a pointer to storage owned by the configfs group.
+ *
+ * Return: Number of dwords used in the post_ctx_restore setting in configfs, or
+ * -ENOSPC if it does not fit in @max_len
  */
-u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
-					enum xe_engine_class class,
-					const u32 **cs)
+ssize_t xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
+					    enum xe_engine_class class,
+					    u32 *cs, size_t max_len)
 {
 	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
-	u32 len;
+	ssize_t len;
 
 	if (!dev)
 		return 0;
 
 	scoped_guard(mutex, &dev->lock) {
-		*cs = dev->config.ctx_restore_post_bb[class].cs;
 		len = dev->config.ctx_restore_post_bb[class].len;
+		if (cs && len) {
+			if (len > max_len)
+				len = -ENOSPC;
+			else
+				memcpy(cs, dev->config.ctx_restore_post_bb[class].cs,
+				       len * sizeof(u32));
+		}
 	}
 	config_group_put(&dev->group);
 
diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index 42cd1a491d01..f89dc0ffb884 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -25,12 +25,12 @@ u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
 bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
 bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev);
 bool xe_configfs_get_disable_vram_page_offline(struct pci_dev *pdev);
-u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
-				       enum xe_engine_class class,
-				       const u32 **cs);
-u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
-					enum xe_engine_class class,
-					const u32 **cs);
+ssize_t xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
+					   enum xe_engine_class class,
+					   u32 *cs, size_t max_len);
+ssize_t xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
+					    enum xe_engine_class class,
+					    u32 *cs, size_t max_len);
 #ifdef CONFIG_PCI_IOV
 unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev);
 bool xe_configfs_admin_only_pf(struct pci_dev *pdev);
@@ -46,12 +46,12 @@ static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return
 static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
 static inline bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev) { return true; }
 static inline bool xe_configfs_get_disable_vram_page_offline(struct pci_dev *pdev) { return false; }
-static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
-						     enum xe_engine_class class,
-						     const u32 **cs) { return 0; }
-static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
-						      enum xe_engine_class class,
-						      const u32 **cs) { return 0; }
+static inline ssize_t xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
+							 enum xe_engine_class class,
+							 u32 *cs, size_t max_len) { return 0; }
+static inline ssize_t xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
+							  enum xe_engine_class class,
+							  u32 *cs, size_t max_len) { return 0; }
 #ifdef CONFIG_PCI_IOV
 static inline unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev)
 {
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index f1cf1463f1b2..0011e7820f3b 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -94,7 +94,7 @@ gt_engine_needs_indirect_ctx(struct xe_gt *gt, enum xe_engine_class class)
 		return true;
 
 	if (xe_configfs_get_ctx_restore_mid_bb(to_pci_dev(xe->drm.dev),
-					       class, NULL))
+					       class, NULL, 0) > 0)
 		return true;
 
 	if (gt->ring_ops[class]->emit_aux_table_inv)
@@ -1172,17 +1172,12 @@ static ssize_t setup_configfs_post_ctx_restore_bb(struct xe_lrc *lrc,
 						  u32 *batch, size_t max_len)
 {
 	struct xe_device *xe = gt_to_xe(lrc->gt);
-	const u32 *user_batch;
-	u32 *cmd = batch;
-	u32 count;
+	ssize_t count;
 
 	count = xe_configfs_get_ctx_restore_post_bb(to_pci_dev(xe->drm.dev),
-						    hwe->class, &user_batch);
-	if (!count)
-		return 0;
-
-	if (count > max_len)
-		return -ENOSPC;
+						    hwe->class, batch, max_len);
+	if (count <= 0)
+		return count;
 
 	/*
 	 * This should be used only for tests and validation. Taint the kernel
@@ -1190,10 +1185,7 @@ static ssize_t setup_configfs_post_ctx_restore_bb(struct xe_lrc *lrc,
 	 */
 	add_taint(TAINT_TEST, LOCKDEP_STILL_OK);
 
-	memcpy(cmd, user_batch, count * sizeof(u32));
-	cmd += count;
-
-	return cmd - batch;
+	return count;
 }
 
 static ssize_t setup_configfs_mid_ctx_restore_bb(struct xe_lrc *lrc,
@@ -1201,17 +1193,12 @@ static ssize_t setup_configfs_mid_ctx_restore_bb(struct xe_lrc *lrc,
 						 u32 *batch, size_t max_len)
 {
 	struct xe_device *xe = gt_to_xe(lrc->gt);
-	const u32 *user_batch;
-	u32 *cmd = batch;
-	u32 count;
+	ssize_t count;
 
 	count = xe_configfs_get_ctx_restore_mid_bb(to_pci_dev(xe->drm.dev),
-						   hwe->class, &user_batch);
-	if (!count)
-		return 0;
-
-	if (count > max_len)
-		return -ENOSPC;
+						   hwe->class, batch, max_len);
+	if (count <= 0)
+		return count;
 
 	/*
 	 * This should be used only for tests and validation. Taint the kernel
@@ -1219,10 +1206,7 @@ static ssize_t setup_configfs_mid_ctx_restore_bb(struct xe_lrc *lrc,
 	 */
 	add_taint(TAINT_TEST, LOCKDEP_STILL_OK);
 
-	memcpy(cmd, user_batch, count * sizeof(u32));
-	cmd += count;
-
-	return cmd - batch;
+	return count;
 }
 
 static ssize_t setup_invalidate_state_cache_wa(struct xe_lrc *lrc,
-- 
2.43.0

