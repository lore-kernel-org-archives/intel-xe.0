Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F0ACAC5BC
	for <intel-xe@archiver.kernel.org>; Thu, 25 Sep 2025 23:46:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF4D10E9D2;
	Thu, 25 Sep 2025 23:46:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cGmInBnw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F93310E30A
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Sep 2025 23:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758844008; x=1790380008;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g1Jjl7xUOJ4bufkeolxLDByyIoE/MleXubQCvZTt3HI=;
 b=cGmInBnwWhd2OWo9F2eCF7C/ki794Sp8W/zOOdxqGhjNADLK9urTFQbq
 LhBW3xzfsl7+PPvxnZPSdfgUxI8UIW5p9zVvWf77VNRu5m+JqboRp4Fww
 5ag1UMzLMxp4eAlroTY/Xat3gn3b6KkRfYoP8zW55CZhkn7L3dxav92AQ
 xkRnqdPCrFeqgczUaq852E5kuWTlHlcHeJkeBjdf2AxEyFzWxM329Yj+1
 sL9ZbeDcF+X9EodVYYwr+hbR6Dk0sbaBfC4VlD3aeHsrpSUWyWn5mTzZv
 D32DQxLQEvyz/qC5aSaYXiSsHtxGUNBfCJEi+hvmJHLMPKjcf4earLxa4 g==;
X-CSE-ConnectionGUID: 0ThwTn13TAWxOPHWwnQNjw==
X-CSE-MsgGUID: iPHcxkMwRVeh8jrsh+aVaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="78817679"
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="78817679"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 16:46:46 -0700
X-CSE-ConnectionGUID: 91/XVvcqROypqbccaleKpw==
X-CSE-MsgGUID: jOYIZ4f0TlmTlN/UVVT5TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="181852997"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 16:46:46 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 17/22] drm/xe: Correct lineage for Wa_22014953428 and only
 check with valid GT
Date: Thu, 25 Sep 2025 16:46:45 -0700
Message-ID: <20250925234628.2112163-41-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925234628.2112163-24-matthew.d.roper@intel.com>
References: <20250925234628.2112163-24-matthew.d.roper@intel.com>
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
---
 drivers/gpu/drm/xe/xe_vm.c         | 3 ++-
 drivers/gpu/drm/xe/xe_wa_oob.rules | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 80b7f13ecd80..1677ae729e85 100644
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

