Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8740CCD182
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 22:56:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2477510E568;
	Tue, 30 Sep 2025 22:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UbOximhj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F50810E2E4
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 22:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759272994; x=1790808994;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g1Jjl7xUOJ4bufkeolxLDByyIoE/MleXubQCvZTt3HI=;
 b=UbOximhj8TwjMSAfq+8NdnCWEnMNtJOFmsGw/35APTumvcW5qumCB/ro
 7mq6m+8BBf6aL9WCrFEuWsH59hmejwTddioJlW8V/zQwVoZGVJGoGh7dH
 ymhKSCFOtkQHE54yIE1hRhaRx03G37r1/WbmN01sHpmsESEpZsklLqWwV
 JTJmsNlzObCLDKJVeHIJTrID0/hXW/QJFVAzaZm82IVCpftUy3XeEQyEI
 Ig+siTvEL+rW4rV8XDgvEocApNuDH4rvnl8aKC+3zfI2aNOjQBSZ6grxK
 09jzSijK5UDyyg+p2cQ5kQj4/JVb1Bp7LzPboBJPghkV92WZKGH53VJtg A==;
X-CSE-ConnectionGUID: fRfQLq0IT6uSZI820yGmcQ==
X-CSE-MsgGUID: DVHoS/2tQgmT3B+a9j3fOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="65397759"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="65397759"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 15:56:33 -0700
X-CSE-ConnectionGUID: BzX8OJD4SYGu7QpKmlkU/A==
X-CSE-MsgGUID: TMbkwWylQ1uKEcl6uBja4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="178229485"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 15:56:32 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v3 18/23] drm/xe: Correct lineage for Wa_22014953428 and only
 check with valid GT
Date: Tue, 30 Sep 2025 15:56:35 -0700
Message-ID: <20250930225618.140071-43-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930225618.140071-25-matthew.d.roper@intel.com>
References: <20250930225618.140071-25-matthew.d.roper@intel.com>
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

