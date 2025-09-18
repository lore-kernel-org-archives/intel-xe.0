Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A4F2CAC59A
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 07:13:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9977410E666;
	Thu, 18 Sep 2025 07:13:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QMo4vBg6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F00C710E665
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Sep 2025 07:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758179593; x=1789715593;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1/I2XkHz4fn+y+NH6JBcKoM+x4I6vxViXyWna47ezyk=;
 b=QMo4vBg6zz+HMWhXmQFgRfxZKgSfR7bQMahoKufoXgArVLUglFeLU42+
 LWW+JLQ2vWctrwfrKDUXH3MQzu4Uyvs/SBJV+3psi3l5xM5INjztSHKc+
 YhdAr/D+YRtZ72COA/jec6FVrjD/JrZFpQ+erBCySB32YpiJWR51Hggwx
 tIIy2a3ppaUpLCzsM51dUioKju5AchDENleSMWe1B2kPNKIRnIrsBTPgJ
 COR+QDaiQusLs6MoHODza5s6MJMiMNiFyvYw6SNW2MEmmQO3oA3UL9BGe
 ujaI0MovVhPczjQXKNsccYikIP6x1Wg/l53HCYXLw5XbkDQE+7Oz/mI5Q Q==;
X-CSE-ConnectionGUID: tHCO/1IGTiySgvZDwSahcA==
X-CSE-MsgGUID: SoWbx2imSYKTHYAYWSqE9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="60648766"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="60648766"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 00:13:13 -0700
X-CSE-ConnectionGUID: tUZd7JwfSQ6uF/5ySmIaCQ==
X-CSE-MsgGUID: 4GVbZODFQT6QFY7PdiMrTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="175856981"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa008.fm.intel.com with ESMTP; 18 Sep 2025 00:13:11 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 4/4] drm/xe/guc: Increase wait timeout to 2sec after BUSY
 reply from GuC
Date: Thu, 18 Sep 2025 13:00:07 +0530
Message-ID: <20250918073002.15242-10-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250918073002.15242-6-satyanarayana.k.v.p@intel.com>
References: <20250918073002.15242-6-satyanarayana.k.v.p@intel.com>
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

Some VF2GUC actions may take longer to process. Increase default timeout
after received BUSY indication to 2sec to cover all worst case scenarios.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index e56c9c5c8845..1f67317907ac 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1469,7 +1469,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 		BUILD_BUG_ON((GUC_HXG_TYPE_RESPONSE_SUCCESS ^ GUC_HXG_TYPE_RESPONSE_FAILURE) != 1);
 
 		ret = xe_mmio_wait32(mmio, reply_reg, resp_mask, resp_mask,
-				     1000000, &header, false);
+				     2000000, &header, false);
 
 		if (unlikely(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, header) !=
 			     GUC_HXG_ORIGIN_GUC))
-- 
2.51.0

