Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E35F5513F
	for <intel-xe@archiver.kernel.org>; Sun,  8 Mar 2026 13:58:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC6B810E040;
	Sun,  8 Mar 2026 13:58:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S2f96Y02";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5AC610E040
 for <intel-xe@lists.freedesktop.org>; Sun,  8 Mar 2026 13:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772978288; x=1804514288;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PwWIOmSE7x2Sw/FTpFQV7ob5ZNJBldSImkj0jJJXZSc=;
 b=S2f96Y02FrffA0GSaWv7LgmZAG5yWQHlQXUZ7sU+oJ3tG7OZKUxl6DYu
 GXUDuyCXQ3z5a6JhxLGB/uzlMvtUip//Hx7IS0xirJkQ9+4OakeE/46xi
 a1R9PJyPtX9JBfUNq1uP1t3U7Rq2rU9EEZcFtHu2gXlMF8/VuKXl385A2
 +OcFQ12NOKJZf88DpM4y60gGsg6cgkWtCJ5YcxHeYB6y3SvS6XqzAlg1P
 RaMQ97YG81jEiqYlRVxUmm4hPdINwWhGM1Bk8zYhdfdzYjHa2iBd8HLDv
 0BeuQt0c1Jzv6IdD8NRQZHwIhimRHlCvldweB/fWVob9kKNA9UY8dRxBs A==;
X-CSE-ConnectionGUID: xwMWHDLrTlSW2ayV2Mj3iA==
X-CSE-MsgGUID: 9uKKn7eMQKCl6ESQS1X/jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="73934696"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; d="scan'208";a="73934696"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2026 06:58:08 -0700
X-CSE-ConnectionGUID: sFu9pA2iTI+ieHZ7pLtBXA==
X-CSE-MsgGUID: D59xPHuXSMu5rCzF22utkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; d="scan'208";a="242523266"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa002.fm.intel.com with ESMTP; 08 Mar 2026 06:58:04 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, maarten@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3 01/10] drm/xe/uc_fw: Allow re-initializing firmware
Date: Sun,  8 Mar 2026 19:25:27 +0530
Message-ID: <20260308135536.3852304-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260308135536.3852304-1-raag.jadav@intel.com>
References: <20260308135536.3852304-1-raag.jadav@intel.com>
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

In preparation of usecases which require re-initializing firmware without
reloading the driver, introduce xe_uc_fw_reinit(). The uC firmware bo
already exists but since it's contents are on VRAM, they are lost on PCIe
FLR. Copy the firmware back to it's bo and mark it as loadable as part of
re-initialization.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
v2: Add kernel doc (Matthew Brost)
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 39 +++++++++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_uc_fw.h |  1 +
 2 files changed, 34 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index d35bc4989144..205bd05f684d 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -704,13 +704,7 @@ static int uc_fw_request(struct xe_uc_fw *uc_fw, const struct firmware **firmwar
 	const struct firmware *fw = NULL;
 	int err;
 
-	/*
-	 * we use FIRMWARE_UNINITIALIZED to detect checks against uc_fw->status
-	 * before we're looked at the HW caps to see if we have uc support
-	 */
 	BUILD_BUG_ON(XE_UC_FIRMWARE_UNINITIALIZED);
-	xe_gt_assert(gt, !uc_fw->status);
-	xe_gt_assert(gt, !uc_fw->path);
 
 	uc_fw_auto_select(xe, uc_fw);
 
@@ -823,6 +817,14 @@ static int uc_fw_copy(struct xe_uc_fw *uc_fw, const void *data, size_t size, u32
 	return err;
 }
 
+static void uc_fw_reinit(struct xe_uc_fw *uc_fw, const void *data)
+{
+	struct xe_device *xe = uc_fw_to_xe(uc_fw);
+
+	xe_map_memcpy_to(xe, &uc_fw->bo->vmap, 0, data, uc_fw->size);
+	xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_LOADABLE);
+}
+
 int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 {
 	const struct firmware *fw = NULL;
@@ -846,6 +848,31 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 }
 ALLOW_ERROR_INJECTION(xe_uc_fw_init, ERRNO); /* See xe_pci_probe() */
 
+/**
+ * xe_uc_fw_reinit() - Re-initialize uC firmware into its bo
+ * @uc_fw: uC firmware
+ *
+ * Returns: 0 on success, negative error code otherwise.
+ */
+int xe_uc_fw_reinit(struct xe_uc_fw *uc_fw)
+{
+	const struct firmware *fw = NULL;
+	int err;
+
+	err = uc_fw_request(uc_fw, &fw);
+	if (err)
+		return err;
+
+	/* no error and no firmware means nothing to copy */
+	if (!fw)
+		return 0;
+
+	uc_fw_reinit(uc_fw, fw->data);
+	uc_fw_release(fw);
+
+	return err;
+}
+
 static u32 uc_fw_ggtt_offset(struct xe_uc_fw *uc_fw)
 {
 	return xe_bo_ggtt_addr(uc_fw->bo);
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h b/drivers/gpu/drm/xe/xe_uc_fw.h
index 6195e353f269..a73935b976d5 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.h
+++ b/drivers/gpu/drm/xe/xe_uc_fw.h
@@ -15,6 +15,7 @@
 struct drm_printer;
 
 int xe_uc_fw_init(struct xe_uc_fw *uc_fw);
+int xe_uc_fw_reinit(struct xe_uc_fw *uc_fw);
 size_t xe_uc_fw_copy_rsa(struct xe_uc_fw *uc_fw, void *dst, u32 max_len);
 int xe_uc_fw_upload(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags);
 int xe_uc_fw_check_version_requirements(struct xe_uc_fw *uc_fw);
-- 
2.43.0

