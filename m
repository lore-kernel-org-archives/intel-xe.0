Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1339CE8D7A
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 11:29:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA8A10E0B9;
	Thu, 19 Sep 2024 11:29:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="icLkzpBA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6588E10E0B9
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Sep 2024 11:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726745380; x=1758281380;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aHtzFEZrd5u6WBw10uPbM1Wpw/MZm46IkmPKFPPEjeU=;
 b=icLkzpBAgAOJERy3rY5wF62sP+JdUjkqP5fSVFRvXM5RCm78W4UC0G8u
 HV4eyyKxdujdKqMZVTpdqs4dnov7p7JAgMKcefw5B177rt5uT0P52PNVB
 oBrifzTczpb/34TPXpmEyLp4uQg92xDMOXaQ7vQaRGR77zXvKTRM8uFqb
 2Yw+xs0tzFQYuZhLlKmNNeNcqXb3+C2r5pc5q7pPcTa+qqJgWFRIJbhpu
 AXwJvKNbDB3pyv8Nhj+97HIy0h4FvgsaBOwOv0MjdC2uaW1MzD0Bbz7Qo
 Nnl7WtzoiTekC8ylnf3oZFnvaJiyD8xPjitNiFKSaFf7cpZoxIjQ0tBl6 w==;
X-CSE-ConnectionGUID: mb/PihgoQrCVY892Eferrw==
X-CSE-MsgGUID: q5+xHNwcQWye/F9JwQ3IPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="13591777"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="13591777"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 04:29:40 -0700
X-CSE-ConnectionGUID: wba0s4PCSwi+ngGG+2LrZA==
X-CSE-MsgGUID: rshghgx6Q1mlLh52B3pwOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="74013553"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 04:29:38 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH] drm/xe: Do not allow scratch page on long running jobs
Date: Thu, 19 Sep 2024 12:47:04 +0200
Message-ID: <20240919104704.3591977-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

This was agreed upon but not enforced, so enforce the limitation
of not allowing scratch pages on long-running jobs unless absolutely
required, which is currently the case for a DG2 SKU.

Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Suggested-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index a3d7cb7cfd22..92dc55f3479b 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1711,6 +1711,11 @@ find_ufence_get(struct xe_sync_entry *syncs, u32 num_syncs)
 	return NULL;
 }
 
+static bool xe_vm_device_requires_scratch_page(struct xe_device *xe)
+{
+	return XE_WA(xe_root_mmio_gt(xe), 14016763929);
+}
+
 #define ALL_DRM_XE_VM_CREATE_FLAGS (DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE | \
 				    DRM_XE_VM_CREATE_FLAG_LR_MODE | \
 				    DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
@@ -1730,7 +1735,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(xe, args->extensions))
 		return -EINVAL;
 
-	if (XE_WA(xe_root_mmio_gt(xe), 14016763929))
+	if (xe_vm_device_requires_scratch_page(xe))
 		args->flags |= DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE;
 
 	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE &&
@@ -1747,6 +1752,15 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
 		return -EINVAL;
 
+	/*
+	 * Scratch page is disabled for long running job unless absolutely
+	 * required as this can introduce hidden bugs.
+	 */
+	if (!xe_vm_device_requires_scratch_page(xe) &&
+	    XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE &&
+			 (args->flags & DRM_XE_VM_CREATE_FLAG_LR_MODE)))
+		return -EINVAL;
+
 	if (XE_IOCTL_DBG(xe, !(args->flags & DRM_XE_VM_CREATE_FLAG_LR_MODE) &&
 			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
 		return -EINVAL;
-- 
2.46.0

