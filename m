Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F979F99344
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 10:03:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3BC510F039;
	Thu, 23 Apr 2026 10:03:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e4MoGl1y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54A2510F035
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Apr 2026 10:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776938600; x=1808474600;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y2qzjH6Gf8sKaNW5dcJ/f/beJsNRgZP1glSZzUjL+Ok=;
 b=e4MoGl1y0QtdLHACndpYYkxox7d/DrdBLeQknF4ORXZDDf5XeSRfTXIB
 qELaDrO+7IxLUCrl5ZnuPAfIJggM9B8DwwBRmJ7pCIjYDjby6CoAsTq+4
 wt7WroRjExVdmEReRrC57Eh3agYOSMie/HLFI0VqgwucOvUASGpFj91ti
 Bl27YqSVCSMQKAYcey1V4ZT+cWsCDkK9879CoJV7OjClVIyIfO4SJVJzA
 JBgmufZJd5U9gpinezUvOYgueF/lLig2H1vsi+7zlerkrauWZKd3poV91
 P7klOrAwrupL3wAxs2TrUFISK7F4oY/Ow9fqOi+aU3i5S6xyzIhi6LH/o w==;
X-CSE-ConnectionGUID: tqr5jx9lRwqAMlxdwJd4iA==
X-CSE-MsgGUID: LpvqeSUqRMGZ9DwvxNE+sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="88600256"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="88600256"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 03:03:20 -0700
X-CSE-ConnectionGUID: qheNxAELRVih6LH3xAsydw==
X-CSE-MsgGUID: gyK3egHNTaWLMzA9aduNKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="232522735"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa008.jf.intel.com with ESMTP; 23 Apr 2026 03:03:16 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, maarten@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com, zhanjun.dong@intel.com,
 lukas@wunner.de, daniele.ceraolospurio@intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v6 1/8] drm/xe/uc_fw: Allow re-initializing firmware
Date: Thu, 23 Apr 2026 15:30:10 +0530
Message-ID: <20260423100017.1051587-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423100017.1051587-1-raag.jadav@intel.com>
References: <20260423100017.1051587-1-raag.jadav@intel.com>
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
---
v2: Add kernel doc (Matthew Brost)
v6: Skip uC firmware selection during re-initialization (Daniele)
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 49 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_uc_fw.h |  1 +
 2 files changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index df2aa196f6f9..9bb646ee998b 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -834,6 +834,14 @@ static int uc_fw_copy(struct xe_uc_fw *uc_fw, const void *data, size_t size, u32
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
@@ -857,6 +865,47 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
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
+	struct xe_uc_fw_version new_fw, old_fw;
+	const struct firmware *fw = NULL;
+	int err;
+
+	/* We shouldn't be here for the firmware which wasn't loaded */
+	xe_assert(xe, xe_uc_fw_is_available(uc_fw));
+
+	old_fw = uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
+
+	err = firmware_request_nowarn(&fw, uc_fw->path, xe->drm.dev);
+	if (err)
+		goto fail;
+
+	err = parse_headers(uc_fw, fw);
+	if (err)
+		goto fail;
+
+	new_fw = uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
+	if (new_fw.branch != old_fw.branch || new_fw.major != old_fw.major ||
+	    new_fw.minor != old_fw.minor || new_fw.patch != old_fw.patch ||
+	    new_fw.build != old_fw.build || uc_fw->size != fw->size) {
+		drm_err(&xe->drm, "%s firmware mismatch on %s",
+			xe_uc_fw_type_repr(uc_fw->type), uc_fw->path);
+		return -ENOEXEC;
+	}
+
+	uc_fw_reinit(uc_fw, fw->data);
+fail:
+	uc_fw_release(fw);
+	return err;
+}
+
 static u32 uc_fw_ggtt_offset(struct xe_uc_fw *uc_fw)
 {
 	return xe_bo_ggtt_addr(uc_fw->bo);
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h b/drivers/gpu/drm/xe/xe_uc_fw.h
index bb281b72a677..9f469bf07d66 100644
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

