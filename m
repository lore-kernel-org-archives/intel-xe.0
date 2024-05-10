Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E90C25B75
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 18:12:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB13910EF39;
	Fri, 10 May 2024 18:12:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UQUAhxgI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D511F10EEFB
 for <intel-xe@lists.freedesktop.org>; Fri, 10 May 2024 18:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715364754; x=1746900754;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SROGqHvgRrXY10pZKoayaTAJ9AisSdXsqbvK9i98QI8=;
 b=UQUAhxgIm6PaktoyOAPJdmKm4zFB31fcfOneW0tohqZyrSrYOUaLIIu7
 BsmE6A9whB9MEkiss8q4pFXaLpSwULFSDa2EgYprOoGI4PXeox7BsauMM
 UkAQOs+jBVBZqbhy6qA/JPy1ZZWi9cmZGH26tQCO3BwVBJvzXpCEBvNmu
 67Z5PBn9kyUbfEYJAV+WGKTayyx7w0vBFk5TrAd8R5z010QjtVnEg1u38
 DWIQHNukb5ZXshz2idZB52GfnuXVzXbiPImVAWVSww9ERE5K11wp8MIG9
 ZOwQvlXpz9e+xmSWYd5/RSoFA2W3w4TsCZUpofbVOavcIcq3MH2LOiAHJ Q==;
X-CSE-ConnectionGUID: 118q70VCQ6KnsDC3Wi8LyQ==
X-CSE-MsgGUID: muikOptZSoGIz4l8q/OnJw==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="28844588"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="28844588"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 11:12:34 -0700
X-CSE-ConnectionGUID: qUpW572nRlKMS9fSyVeFfw==
X-CSE-MsgGUID: Y20/ht8XT6Or6LnmSvzPww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="60544074"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.149])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 11:12:32 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH 06/20] drm/xe/guc: move guc_fini over to devm
Date: Fri, 10 May 2024 19:12:19 +0100
Message-ID: <20240510181212.264622-28-matthew.auld@intel.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240510181212.264622-22-matthew.auld@intel.com>
References: <20240510181212.264622-22-matthew.auld@intel.com>
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

Make sure to actually call this when the device is removed. Currently we
only trigger it when the driver instance goes away, but that doesn't
work too well with hotunplug, since device can be removed and re-probed
with a new driver instance, where the guc_fini() is called too late.
Move the fini over to devm to ensure this is called when device is
removed.

References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1717
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 0c9938e0ab8c..97e2b62df486 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -239,7 +239,7 @@ static void guc_write_params(struct xe_guc *guc)
 		xe_mmio_write32(gt, SOFT_SCRATCH(1 + i), guc->params[i]);
 }
 
-static void guc_fini(struct drm_device *drm, void *arg)
+static void guc_fini(void *arg)
 {
 	struct xe_guc *guc = arg;
 	struct xe_gt *gt = guc_to_gt(guc);
@@ -323,7 +323,7 @@ int xe_guc_init(struct xe_guc *guc)
 	if (ret)
 		goto out;
 
-	ret = drmm_add_action_or_reset(&xe->drm, guc_fini, guc);
+	ret = devm_add_action_or_reset(xe->drm.dev, guc_fini, guc);
 	if (ret)
 		goto out;
 
-- 
2.45.0

