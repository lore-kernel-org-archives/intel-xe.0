Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 544B4E9B24D
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 10:30:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F0210E1D5;
	Tue, 24 Feb 2026 10:30:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ymbrrw4B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C2310E1D5
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 10:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771929019; x=1803465019;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y7MGxiDKYOvkAGRp5Miy6nJtzBFNzxIItUvYSiMHuwo=;
 b=Ymbrrw4BdJReqoWclX6XuW6Buhww9pAoX4Zn0IFPnHUgbrvtlFjmKi0h
 xf0+VJuFqgELBriHAeEonmfVdOjWFQJoGbVL9B1xf26EI9NW2jsJhupKE
 UqZA7IklszjsqNDosWqq1r1MJaNBZXbeyvpabJ5ezjeCZZWu9hUQm6gBh
 MYyqUPmZe0kakUHt1wqIA6iBqUTr9Tv/DAIcEUxq0wDyXrOCLYNIg+sEP
 0zZPYz46yqIDXjERHO3jbKa4VGDaeQ2nUeDUWNmhMfA+MudoYhj3uX0YP
 JmNFjdxsu/mewQ9Fnw/NxUwhv6smxDUqL0sPcu/MENgF8xGWLU8BGRSxO Q==;
X-CSE-ConnectionGUID: 3BukWXjCSfqCR+InxHwIOg==
X-CSE-MsgGUID: HxHdY/1wQ1uo2ptUAXy7Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="73046313"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="73046313"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 02:30:19 -0800
X-CSE-ConnectionGUID: 27hWlHSvSVy8meWDep78lg==
X-CSE-MsgGUID: 1trD4vajTV+zGkpEpn5L9g==
X-ExtLoop1: 1
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa003.fm.intel.com with ESMTP; 24 Feb 2026 02:30:16 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1 1/6] drm/xe/uc_fw: Allow reloading firmware
Date: Tue, 24 Feb 2026 15:55:14 +0530
Message-ID: <20260224102618.3105171-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224102618.3105171-1-raag.jadav@intel.com>
References: <20260224102618.3105171-1-raag.jadav@intel.com>
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

In preparation of usecases which require loading firmware without
reloading the driver, introduce xe_uc_fw_copy() so that it can be
reused.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 33 +++++++++++++++++----------------
 drivers/gpu/drm/xe/xe_uc_fw.h |  1 +
 2 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index d35bc4989144..a97cd885a052 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -320,7 +320,7 @@ size_t xe_uc_fw_copy_rsa(struct xe_uc_fw *uc_fw, void *dst, u32 max_len)
 	return size;
 }
 
-static void uc_fw_fini(struct drm_device *drm, void *arg)
+static void xe_uc_fw_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_uc_fw *uc_fw = arg;
 
@@ -704,14 +704,6 @@ static int uc_fw_request(struct xe_uc_fw *uc_fw, const struct firmware **firmwar
 	const struct firmware *fw = NULL;
 	int err;
 
-	/*
-	 * we use FIRMWARE_UNINITIALIZED to detect checks against uc_fw->status
-	 * before we're looked at the HW caps to see if we have uc support
-	 */
-	BUILD_BUG_ON(XE_UC_FIRMWARE_UNINITIALIZED);
-	xe_gt_assert(gt, !uc_fw->status);
-	xe_gt_assert(gt, !uc_fw->path);
-
 	uc_fw_auto_select(xe, uc_fw);
 
 	if (IS_SRIOV_VF(xe)) {
@@ -804,15 +796,13 @@ static int uc_fw_copy(struct xe_uc_fw *uc_fw, const void *data, size_t size, u32
 		goto fail;
 	}
 
+	if (uc_fw->bo)
+		xe_managed_bo_unpin_map_no_vm(uc_fw->bo);
+
 	uc_fw->bo = obj;
 	uc_fw->size = size;
 
 	xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_AVAILABLE);
-
-	err = drmm_add_action_or_reset(&xe->drm, uc_fw_fini, uc_fw);
-	if (err)
-		goto fail;
-
 	return 0;
 
 fail:
@@ -823,7 +813,7 @@ static int uc_fw_copy(struct xe_uc_fw *uc_fw, const void *data, size_t size, u32
 	return err;
 }
 
-int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
+int xe_uc_fw_copy(struct xe_uc_fw *uc_fw)
 {
 	const struct firmware *fw = NULL;
 	int err;
@@ -841,9 +831,20 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 			 XE_BO_FLAG_GGTT_INVALIDATE);
 
 	uc_fw_release(fw);
-
 	return err;
 }
+
+int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
+{
+	struct xe_device *xe = uc_fw_to_xe(uc_fw);
+	int err;
+
+	err = xe_uc_fw_copy(uc_fw);
+	if (err)
+		return err;
+
+	return drmm_add_action_or_reset(&xe->drm, xe_uc_fw_fini, uc_fw);
+}
 ALLOW_ERROR_INJECTION(xe_uc_fw_init, ERRNO); /* See xe_pci_probe() */
 
 static u32 uc_fw_ggtt_offset(struct xe_uc_fw *uc_fw)
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h b/drivers/gpu/drm/xe/xe_uc_fw.h
index 6195e353f269..cbe8ea397efc 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.h
+++ b/drivers/gpu/drm/xe/xe_uc_fw.h
@@ -15,6 +15,7 @@
 struct drm_printer;
 
 int xe_uc_fw_init(struct xe_uc_fw *uc_fw);
+int xe_uc_fw_copy(struct xe_uc_fw *uc_fw);
 size_t xe_uc_fw_copy_rsa(struct xe_uc_fw *uc_fw, void *dst, u32 max_len);
 int xe_uc_fw_upload(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags);
 int xe_uc_fw_check_version_requirements(struct xe_uc_fw *uc_fw);
-- 
2.43.0

