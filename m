Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6E5606A323
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 21:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UrFOrsAy
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F7310FC85;
	Thu, 12 Nov 2026 21:35:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7838C10E6C0
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 21:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794519316; x=1826055316;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=idqNXFe5CIiOSRYIoMWH+y+HVX2MAPk9MU/qPITgwXI=;
 b=UrFOrsAyPBx3ta3IaUXl24YL2PoxVMvjKfR/1W1PFDSIwEqEgOUG0GGa
 +7MIURCP98Qbit7me8RHufPDevBYND0xgCLAXH1vbc/sSkV2lHvFgOXrs
 4Qn4TqrhMCrQHrLG1QkLV+fkAqT6Hc0hr9hWMWU0Jd1EUNxgx0M+LvwEn
 HCH+ZexIizryBxsWfdxROrzdmmLMr7gnRdasoitZ9Uiel8Gwji+JIEvRm
 /QVjnPVW3QqXMlZaITVs/qQR4ne3+ZwbNJj0gW5l2pi0kt/Uo/TOJlp/G
 qXYVUtbPz1F0CiJgdXdbD8oyxSWQLkJ11blGkm6YLVvnqcQ02an7iVJam A==;
X-CSE-ConnectionGUID: pzlwRz/eTm66IKKy16wnfg==
X-CSE-MsgGUID: iKfE7AdVRqCMQREiFPI54w==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3351723"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3351723"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 13:35:11 -0800
X-CSE-ConnectionGUID: r853UVIBTyS311Fr4yJE4A==
X-CSE-MsgGUID: z9QATnWYRqCjSLgUtj8CLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8754523"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.189])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 13:35:11 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.d.roper@intel.com, gustavo.sousa@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 3/8] drm/xe/configfs: Copy wa_bb out under the configfs lock
Date: Thu, 12 Nov 2026 21:35:08 +0000
Message-ID: <20261112213508.457213-13-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112213508.457213-10-stuart.summers@intel.com>
References: <20261112213508.457213-10-stuart.summers@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 52 ++++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_configfs.h | 12 ++++----
 drivers/gpu/drm/xe/xe_lrc.c      | 38 +++++++----------------
 3 files changed, 53 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index c844155afe52..c4fbf737b907 100644
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
index d726800de26a..98154beabd5a 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -25,12 +25,12 @@ bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
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
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 040a52f9320e..e17853427eec 100644
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

