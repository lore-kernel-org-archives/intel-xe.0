Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91060606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 05:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hFDpbHqW
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57CE910E2E4;
	Mon, 26 Oct 2026 05:08:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5070110E2E4
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 05:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792991300; x=1824527300;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uzkFSxjiHUfGj7QIlxlELdv4NDggdpDiyC+PFOhUCPQ=;
 b=hFDpbHqW1najZtB0XaMk84RAPJJHjSJYQ+7AA+Q8oT3v0B3VKZbQMHz+
 i2ywiFiKqYCsXoSrw4ncRXKNiY29Ab/7tqggbmLBbt1fg6IZZVSf6Teiq
 1n/ewNZilbAaegvtRs2YLN2Oc87iZub1DNRpFDb3eE/6j6QafK6IotENT
 2FStEqeaQBXY/xuSbWgL3lJL2PSdvBr5N+PKJ2/hFVAvXS7vTe1bNSEkD
 Yq1j8YEwersRW/ZX2di9+A1Qt0vcozvfT0OKTJndcOPn+29tB0pz9rSvJ
 5FBd0DY+8uUPxQwIp7GylWYMyBJGR1Yqya01VnXEx7RLNJ90eAarwj++p A==;
X-CSE-ConnectionGUID: Q8nMHm5mTq2SJIAOXkROZA==
X-CSE-MsgGUID: PEu8jVOIT5i7fSmSFNxuRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1522389"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1522389"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2026 22:08:20 -0700
X-CSE-ConnectionGUID: KhgELUC1TAOFjX0wXhEpRw==
X-CSE-MsgGUID: gIZ/ntkfTWahA9/i8G7NGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4289476"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa002.fm.intel.com with ESMTP; 25 Oct 2026 22:08:16 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, dev@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com, lukas@wunner.de,
 daniele.ceraolospurio@intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v11 01/10] drm/xe/uc_fw: Allow re-initializing firmware
Date: Mon, 26 Oct 2026 10:36:51 +0530
Message-ID: <20261026050735.566613-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026050735.566613-1-raag.jadav@intel.com>
References: <20261026050735.566613-1-raag.jadav@intel.com>
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
index 9a92251e2312..a7304b2a0d76 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -837,6 +837,14 @@ static int uc_fw_copy(struct xe_uc_fw *uc_fw, const void *data, size_t size, u32
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
@@ -860,6 +868,65 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
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

