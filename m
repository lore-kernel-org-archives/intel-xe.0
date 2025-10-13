Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D0ECCD18F
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 20:10:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F045210E50A;
	Mon, 13 Oct 2025 20:10:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n3gKRw07";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7935B10E503
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 20:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760386203; x=1791922203;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/TcUZQZ9ilTHesYUbZlp8DIq/EqNrBjBdDMy+2lkAzQ=;
 b=n3gKRw07o1pqY+bqFY662kaBaPS/wN/n+UBPGDsWATj5vYdj59yCkhrv
 PkWipN75JuYXeZ/vhg1H6HXVIltVx6OWjgVUMzwO7DgJHbjl7fXWdgfM5
 wWEND9cQ2abr08h11/5kglK9fPE421SPBcvlFrfb0/uUhFhGTQh4z7EwZ
 glqIjxMKvG/45SDlq+8vwOui9NK8XwUSJJPNxbMCFJ2fJ73cA7DPLxZmy
 Wjg6pmvxc3NIFKgsSlBZgq7JxEB0JnsJHXRFCG3nf59tQ1kJ1yqZfU5M+
 IrToG6skjwEV0gzdBsB+NG2NOQNHOAqfg2iFf2LWaL8N0nNB0lJWI02iE w==;
X-CSE-ConnectionGUID: 5fn2ZvrhRWGbLex399wXJg==
X-CSE-MsgGUID: wMo5lCmtSkCeKhCUrLVr5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="72800554"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="72800554"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:10:03 -0700
X-CSE-ConnectionGUID: yQH7RjjrT+q2pIGo3aLv1g==
X-CSE-MsgGUID: JVIXNswQSBCrJux3Oj7V0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="185707611"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:10:03 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v5 18/23] drm/xe: Correct lineage for Wa_22014953428 and only
 check with valid GT
Date: Mon, 13 Oct 2025 13:10:01 -0700
Message-ID: <20251013200944.2499947-43-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013200944.2499947-25-matthew.d.roper@intel.com>
References: <20251013200944.2499947-25-matthew.d.roper@intel.com>
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
index 179758ca7cb8..08bc55bd91d7 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1910,6 +1910,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	struct xe_device *xe = to_xe_device(dev);
 	struct xe_file *xef = to_xe_file(file);
 	struct drm_xe_vm_create *args = data;
+	struct xe_gt *wa_gt = xe_root_mmio_gt(xe);
 	struct xe_vm *vm;
 	u32 id;
 	int err;
@@ -1918,7 +1919,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
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

