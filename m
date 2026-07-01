Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC8CFC43458
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 08:35:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98D2A10E315;
	Wed,  1 Jul 2026 08:35:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dtn6vFyQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4091C10E315
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Jul 2026 08:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782894941; x=1814430941;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pS48iiLY6cNVCWWrNAAvllB6RPPdySsoRF0UpNhryUA=;
 b=Dtn6vFyQnSlA9241oZooFCwIiBFPmrLawMDvvGkMmLmBDHJqIJve+Gdm
 Kv33z16JtSBgpLLRDFDJRlByiRt+Bf6DlGiuwN78ZkmonHYeJFQtDFIEU
 257deUbwm7y4/FTSVivJnYMZM7gJHdJukKg5WeOKXECmBHgVAnBFe6UUk
 BzeNvUcJHdniMBXT1LLRK+Lfre9b0xD73RmMVzIxKhO8wpoYLGNmNbbLQ
 50wXa7T124qekY5Da2xUepYdwlDPRyyh9BCCt/J6T4j25hvqbn0ex+Glp
 tMqRCjSlFge95+OEbNhTqcL8sGPL9USP/cE1o0iThKnfsFdk8sorzUndf A==;
X-CSE-ConnectionGUID: sNHN47JgRxSctwGQMkGcvg==
X-CSE-MsgGUID: yrcienTJTmyBISZh1Rmz9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="83492960"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; d="scan'208";a="83492960"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 01:35:40 -0700
X-CSE-ConnectionGUID: 265yKpYOQVmSBYNcGNt5QQ==
X-CSE-MsgGUID: A7ihIRw/SZuTfY1vcgVpEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; d="scan'208";a="276806180"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa001.fm.intel.com with ESMTP; 01 Jul 2026 01:35:35 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, dev@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com, zhanjun.dong@intel.com,
 lukas@wunner.de, daniele.ceraolospurio@intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v9 01/10] drm/xe/uc_fw: Allow re-initializing firmware
Date: Wed,  1 Jul 2026 13:59:25 +0530
Message-ID: <20260701083051.450259-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701083051.450259-1-raag.jadav@intel.com>
References: <20260701083051.450259-1-raag.jadav@intel.com>
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
Tested-by: Lukasz Laguna <lukasz.laguna@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
v2: Add kernel doc (Matthew Brost)
v6: Skip uC firmware selection during re-initialization (Daniele)
v8: Set fw state to XE_UC_FIRMWARE_INIT_FAIL on failure (Daniele)
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 67 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_uc_fw.h |  1 +
 2 files changed, 68 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 3f08a3b54062..158ac15dde55 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -833,6 +833,14 @@ static int uc_fw_copy(struct xe_uc_fw *uc_fw, const void *data, size_t size, u32
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
@@ -856,6 +864,65 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
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
+	struct xe_device *xe = uc_fw_to_xe(uc_fw);
+	struct xe_uc_fw_version old_fw, new_fw;
+	const struct firmware *fw = NULL;
+	int err;
+
+	/* Make sure the status was cleared the last time we reset the uc */
+	xe_assert(xe, !xe_uc_fw_is_loaded(uc_fw));
+
+	/* We shouldn't be here for the firmware which wasn't available */
+	if (!xe_uc_fw_is_available(uc_fw))
+		return -ENOEXEC;
+
+	old_fw = uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
+
+	err = firmware_request_nowarn(&fw, uc_fw->path, xe->drm.dev);
+	if (err)
+		goto init_fail;
+
+	err = parse_headers(uc_fw, fw);
+	if (err)
+		goto restore_old;
+
+	new_fw = uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
+	if (memcmp(&old_fw, &new_fw, sizeof(old_fw)) || uc_fw->size != fw->size) {
+		drm_err(&xe->drm, "%s firmware mismatch on %s",
+			xe_uc_fw_type_repr(uc_fw->type), uc_fw->path);
+
+		err = -ENOEXEC;
+		goto restore_old;
+	}
+
+	uc_fw_reinit(uc_fw, fw->data);
+	uc_fw_release(fw);
+	return 0;
+
+restore_old:
+	/*
+	 * parse_headers() updates version details, so restore original version
+	 * before bailing.
+	 *
+	 * TODO: Create a struct of all the fields touched by parse_headers()
+	 * and restore them all.
+	 */
+	uc_fw->versions.found[XE_UC_FW_VER_RELEASE] = old_fw;
+init_fail:
+	xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_INIT_FAIL);
+	/* OK even if fw is NULL */
+	uc_fw_release(fw);
+	return err;
+}
+
 static u32 uc_fw_ggtt_offset(struct xe_uc_fw *uc_fw)
 {
 	return xe_bo_ggtt_addr(uc_fw->bo);
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h b/drivers/gpu/drm/xe/xe_uc_fw.h
index f2d3a3e7208b..6debdb924310 100644
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

