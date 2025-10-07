Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE90ACCD18C
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 20:48:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA65210E704;
	Tue,  7 Oct 2025 20:48:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ewWRmSze";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 379AA10E38C
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 20:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759870130; x=1791406130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BVYg/i8ZWznDyNlA5IKOVXHatoOWVIAxFMOTiI4zWIU=;
 b=ewWRmSzeWxtaaHHFv1ObFkKZUeDVMp8THipLEx8Bjx8SJzhdaLCNcYFn
 TKf5dcJldZXdc0LO/rhijMrHGT/8p5wrHfPaxPmIP6KlLzJxRdA8N9gro
 MXpu55UZ2ppbDRphUlgrqYyy4qvMzE8d20kfvqb+T0gj5UX6vG7HB1zvx
 MFZIUR5MDxQRrvBKbffXjdwB95kTe4gIec0Jd69vxgxIlEUecnQnrQI+C
 rmvNvWjBTw88CXC9DiOzrhgV1EBH9nJClCYJ2Q1Se2pLakT8inFDTa7r3
 DtGb/Dr4e/8HpY45xG9LoRBiEZZMedFvkgrwP7xcl6NwlqWkGpB7EJXWs A==;
X-CSE-ConnectionGUID: IW+ZxqJCTUSJ7jeYRnIANw==
X-CSE-MsgGUID: LyG9P0qlTR+3Bm1sbFIOuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="49616757"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="49616757"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 13:48:49 -0700
X-CSE-ConnectionGUID: SPrNOF1nSLqa7BoY2GMxSg==
X-CSE-MsgGUID: 8jh1GOyQQdmiLuyn/OqXGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="184631112"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 13:48:48 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v4 18/23] drm/xe: Correct lineage for Wa_22014953428 and only
 check with valid GT
Date: Tue,  7 Oct 2025 13:48:48 -0700
Message-ID: <20251007204829.1468209-43-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251007204829.1468209-25-matthew.d.roper@intel.com>
References: <20251007204829.1468209-25-matthew.d.roper@intel.com>
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

Wa_22014953428 was incorrectly labelled with a release-specific ID
number rather than the cross-platform lineage number; fix that.
Also check that the GT is not NULL before trying to lookup the
workaround in it.  Since this workaround only applies to DG2 discrete
GPUs (where the primary GT cannot be disabled), no coverage is lost.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c         | 3 ++-
 drivers/gpu/drm/xe/xe_wa_oob.rules | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 4e914928e0a9..b5e842faa613 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1886,6 +1886,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	struct xe_device *xe = to_xe_device(dev);
 	struct xe_file *xef = to_xe_file(file);
 	struct drm_xe_vm_create *args = data;
+	struct xe_gt *wa_gt = xe_root_mmio_gt(xe);
 	struct xe_vm *vm;
 	u32 id;
 	int err;
@@ -1894,7 +1895,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(xe, args->extensions))
 		return -EINVAL;
 
-	if (XE_GT_WA(xe_root_mmio_gt(xe), 14016763929))
+	if (wa_gt && XE_GT_WA(wa_gt, 22014953428))
 		args->flags |= DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE;
 
 	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE &&
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 113a62f1b541..4bb94e5799ed 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -11,7 +11,7 @@
 18020744125	PLATFORM(PVC)
 1509372804	PLATFORM(PVC), GRAPHICS_STEP(A0, C0)
 1409600907	GRAPHICS_VERSION_RANGE(1200, 1250)
-14016763929	SUBPLATFORM(DG2, G10)
+22014953428	SUBPLATFORM(DG2, G10)
 		SUBPLATFORM(DG2, G12)
 16017236439	PLATFORM(PVC)
 14019821291	MEDIA_VERSION_RANGE(1300, 2000)
-- 
2.51.0

