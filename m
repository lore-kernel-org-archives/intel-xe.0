Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A36C47258
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 15:02:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C4EA10E0FC;
	Wed, 17 Jan 2024 15:02:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E469010E0FC
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jan 2024 15:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705503729; x=1737039729;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=duwS1E1xQVYXectPT1AJwN+KSKSGAd1RHL9/OxuJUEE=;
 b=MXy1XagGPOELmxu6aHfDRKFn84WvLNWnWqggpoLBtt1xe2EJB5FevbmC
 YyHUI3ThnCwUaxbRFeF2HIuNQdGNsGYnWaDo7xJSGOO8eh5E20tUSj3r+
 OB57I1/4n4QPT7R2s8Mc0xeVxyIUPj9xZV3GUdaS1fAHMIS/ENKnFHkI0
 S8rjMSaT12l4THvgudNIc1GyvLnMjFYjo+3cpj7/8UyUf5bpLMlmqJGCF
 5nKMnUx5iCWQPx9ENpI3ybUqd7wI75Emu/b2yDnjonQLKxpULJp5k5E9u
 r7OrmqOsDt32T316oHrnmfVspo/t2Xj4TlU6+2aXpUvkxRg5c5RylSg5B A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="486337084"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="486337084"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 07:02:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="26511033"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 07:02:07 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Set PTE_AE for xe2 dgfx platforms
Date: Wed, 17 Jan 2024 15:48:51 +0100
Message-ID: <20240117144851.22952-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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
Cc: Matt Roper <matthew.d.roper@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Atomics on XE2 works for both type of memory so
extend setting PTE_AE for dgfx platforms as well.

Cc: Fei Yang <fei.yang@intel.com>
Cc: Jose Souza <jose.souza@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index de1030a47588..3ace4b401369 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -602,8 +602,12 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
 	int ret;
 
+	/**
+	 * XE_USM_PPGTT_PTE_AE is available for igfx and dgfx from xe2 onwards
+	 * and also for PVC but atomics only works for PVC on device memory.
+	 */
 	if (vma && (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) &&
-	    (is_devmem || !IS_DGFX(xe)))
+	    (is_devmem || GRAPHICS_VER(xe) >= 20))
 		xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
 
 	if (is_devmem) {
-- 
2.42.0

