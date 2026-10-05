Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F11A7CA5FFE
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 22:06:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC6110EEC7;
	Mon,  5 Oct 2026 22:06:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nh+LmIpa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D43E810EEA4
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 22:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791238001; x=1822774001;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r0Eeg07DIFE2WcudOKrlD7eUOk8yhHlZu4uEAGqR0c8=;
 b=Nh+LmIpaCs/L5+DHuZEMMnH9PHAt1Fa7pxFPEKYAgapiNXlqxeGg3t73
 1PbQj0h2cimmiCt0OgNhiOGWsNOE51VsTIzMC8xqYDA+Wqz/4srpy60Wn
 1LiT6u1vQqqGluRBHmY32Y45oU/zK+2KE1FB+fVlZb/Oc06+juF9cPCdh
 3Bw5ySDmI9cO70y4SUuQw3XCKVQXCEzSqz8q9aZr1SHIPiYsxZjGJ8qJX
 APJHfK4GTobfDSff4+hBu+W5JMSkGh8Qb9NHdHAK2Wr9ymWTPz2pwYMH2
 v4bMjzJgO9kKnMONKVBv+egQsRgzIAkqI12gzhjoM3wvkweaeptJOMUGp g==;
X-CSE-ConnectionGUID: 24AWnTwJSkqoOFm80R6Sjg==
X-CSE-MsgGUID: MADF/F9uRG6jOLggZxv5JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="109410168"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="109410168"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 15:06:40 -0700
X-CSE-ConnectionGUID: VuX2cQf2SFe/1exl1xIpwQ==
X-CSE-MsgGUID: I5p+98tfReGJX1LYw/Z5Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="274732159"
Received: from dut4435arlh.fm.intel.com ([10.105.8.126])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 15:06:40 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, umesh.nerlige.ramappa@intel.com,
 gustavo.sousa@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com, shuicheng.lin@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 03/15] drm/xe/configfs: Copy wa_bb out under the configfs lock
Date: Mon,  5 Oct 2026 22:06:39 +0000
Message-ID: <20261005220636.602826-20-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005220636.602826-17-stuart.summers@intel.com>
References: <20261005220636.602826-17-stuart.summers@intel.com>
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
Assisted-by: LLM
---
 drivers/gpu/drm/xe/xe_configfs.c | 52 ++++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_configfs.h | 24 +++++++--------
 drivers/gpu/drm/xe/xe_lrc.c      | 38 +++++++----------------
 3 files changed, 59 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 1c7a096aa046..6e62fdccb4c4 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -1441,25 +1441,34 @@ bool xe_configfs_get_disable_vram_page_offline(struct pci_dev *pdev)
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
 
@@ -1470,23 +1479,34 @@ u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
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
index 10a00d6bbf8f..14e49f23306f 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -26,12 +26,12 @@ bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
 bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev);
 u32 xe_configfs_get_migrate_ulls_period_ms(struct pci_dev *pdev);
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
@@ -48,12 +48,12 @@ static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return f
 static inline bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev) { return true; }
 static inline u32 xe_configfs_get_migrate_ulls_period_ms(struct pci_dev *pdev) { return 5; }
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
index de9a9560ecf3..f751687dc568 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -94,7 +94,7 @@ gt_engine_needs_indirect_ctx(struct xe_gt *gt, enum xe_engine_class class)
 		return true;
 
 	if (xe_configfs_get_ctx_restore_mid_bb(to_pci_dev(xe->drm.dev),
-					       class, NULL))
+					       class, NULL, 0) > 0)
 		return true;
 
 	if (gt->ring_ops[class]->emit_aux_table_inv)
@@ -1186,17 +1186,12 @@ static ssize_t setup_configfs_post_ctx_restore_bb(struct xe_lrc *lrc,
 						  bool indirect)
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
@@ -1204,10 +1199,7 @@ static ssize_t setup_configfs_post_ctx_restore_bb(struct xe_lrc *lrc,
 	 */
 	add_taint(TAINT_TEST, LOCKDEP_STILL_OK);
 
-	memcpy(cmd, user_batch, count * sizeof(u32));
-	cmd += count;
-
-	return cmd - batch;
+	return count;
 }
 
 static ssize_t setup_configfs_mid_ctx_restore_bb(struct xe_lrc *lrc,
@@ -1216,17 +1208,12 @@ static ssize_t setup_configfs_mid_ctx_restore_bb(struct xe_lrc *lrc,
 						 bool indirect)
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
@@ -1234,10 +1221,7 @@ static ssize_t setup_configfs_mid_ctx_restore_bb(struct xe_lrc *lrc,
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

