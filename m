Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ECF8CD4F21
	for <intel-xe@archiver.kernel.org>; Sat, 16 May 2026 09:35:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDF0710E1A9;
	Sat, 16 May 2026 09:35:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JD9X+Grg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26EB410E1A9
 for <intel-xe@lists.freedesktop.org>; Sat, 16 May 2026 09:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778924123; x=1810460123;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+exF34btGT6cKatQtNKY47JS26kdP84HV1eu8CvmufQ=;
 b=JD9X+GrgdpWV/6Vf9Oq7q0rdXvPgbiurMcwbMv/MJrSsGGTmYVF6W64u
 LW8NKKFkzh35bqeo6v+ud6OWDvFWUXWdOZPKVitb3KGx4Ao1k5goMV3Vj
 JMROIwJD+V3/c5e6iclHb0BPCXASWKe0GKhKynGGPON1z3Sq9AU+GGjMi
 dkV6dVXeZ4z6dLLTejQlbNAVp6y4064Y0f5HgLn3PdN44qOvlx0orUg8x
 BZG6Wgxm8ShW9gkwTxlf9BObUlSYgvKv+2+nksBDaOM9Bdu0NaPQWC5Oj
 kEffeyBCSCJLh79NZrTEuaz6sy5rbuHLIzJYG8eBxdyGkUEP24zK4NmK9 w==;
X-CSE-ConnectionGUID: a3QIVtaFQUK2GAtZaX0ssA==
X-CSE-MsgGUID: ifMRuje3T52VltzE5PUMLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="90441893"
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; d="scan'208";a="90441893"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2026 02:35:23 -0700
X-CSE-ConnectionGUID: Rm3SLmXbQeeb6qPu9Wrtyg==
X-CSE-MsgGUID: OrDnhpBqSca0DkX1WZ7BJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; d="scan'208";a="243911632"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa005.jf.intel.com with ESMTP; 16 May 2026 02:35:18 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, dev@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com, zhanjun.dong@intel.com,
 lukas@wunner.de, daniele.ceraolospurio@intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v7 1/8] drm/xe/uc_fw: Allow re-initializing firmware
Date: Sat, 16 May 2026 15:01:24 +0530
Message-ID: <20260516093131.27442-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260516093131.27442-1-raag.jadav@intel.com>
References: <20260516093131.27442-1-raag.jadav@intel.com>
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
 drivers/gpu/drm/xe/xe_uc_fw.c | 56 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_uc_fw.h |  1 +
 2 files changed, 57 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index df2aa196f6f9..c23c35dc2a4d 100644
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
@@ -857,6 +865,54 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
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
+
+		/*
+		 * parse_headers() updates version details, so restore original
+		 * version before bailing.
+		 */
+		uc_fw->versions.found[XE_UC_FW_VER_RELEASE] = old_fw;
+		err = -ENOEXEC;
+		goto fail;
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

