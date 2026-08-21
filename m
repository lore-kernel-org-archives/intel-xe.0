Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E53D9C5DF89
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 11:25:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 901B310E278;
	Fri, 21 Aug 2026 11:25:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CQHhhV7t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F02810E278
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 11:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787311517; x=1818847517;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YyMunQV3P+AuwnCUqdzRQFjNNEiO9seeG7x8ByjQx0k=;
 b=CQHhhV7tWZ6VK2JBRmY0VXps0Riq8XraTYN4zP1iXbNaOiLEia8xEcce
 ZKS6OvUMIA9Sdgba/FRfRZmD/pjpd2TKVq0pACXcdb2q8TnnCx1ZbYZ3g
 vdp6apX7YXNTmKTBC+s/7adDv6oxqIAwgCE1HWd6xnFAvDlX62IAjqEta
 DQjvE75RLv+RPewEne71j3X/i6RTlqp52s1lUnnK3DKD6BZYHY8gbtpLN
 rmqQFOAhjfD26daFuk+bs0vMIN7lGAskV1/Tk6zNyKZ2/0bjFgG0VBAZu
 p+uBr9WyO6uRAqzEpi8BQV8xBk1KnJvXE6M5XFQiUbJzWNX9lHVr4tv+z w==;
X-CSE-ConnectionGUID: wGNQN31CQq6liITYVfmXEA==
X-CSE-MsgGUID: bCKfM4OaTCa5v3gQ7DbCCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="90377523"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="90377523"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 04:25:16 -0700
X-CSE-ConnectionGUID: aaZdzuDxS1igxI57J0kwGQ==
X-CSE-MsgGUID: uvJNQVeZThaxHEZF82S63Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="304523388"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa001.jf.intel.com with ESMTP; 21 Aug 2026 04:25:12 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, dev@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com, lukas@wunner.de,
 daniele.ceraolospurio@intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v10 01/10] drm/xe/uc_fw: Allow re-initializing firmware
Date: Fri, 21 Aug 2026 16:53:23 +0530
Message-ID: <20260821112436.545405-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821112436.545405-1-raag.jadav@intel.com>
References: <20260821112436.545405-1-raag.jadav@intel.com>
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
index a8e6f18cc9b4..8577ddf95710 100644
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
@@ -857,6 +865,65 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
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

