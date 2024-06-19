Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C77CC27C53
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 21:46:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C94D10E2A2;
	Wed, 19 Jun 2024 21:46:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eH2qVw4q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2157E10E366
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jun 2024 21:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718833596; x=1750369596;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=aAWlsNtqX1M1UPvNntHukcVtpiZro+7HNJ1eXifbFFU=;
 b=eH2qVw4qIsQ1rlGKGpTz1/dYc1Xx26MAjvFNvPFrNkuL0GeJ1r86mBhb
 i25+Oz5e+FMwW2mkM+VxlOVEux899xXqB1MyLiz+xSUKir9MXGAgDiOJm
 PaokCXcmHxHAWT++kKBLwg4lt9XymFQX6AAMmq8BiwZgYp4Gim2i/yXa6
 pdYjKViFuiZNyJYlBNrvW4MGQjVTft2ltf94bjheahA5lKx7vEVb2sOLQ
 1onXo2xsh9QksggxiCB8SqEV5KI8Bx6Uj9BeMDVcTIbG/QB796N/s9r+H
 krSgpaplsNDRBVQzjXNgrRiXl3tzOu1Tz/fKcPNZqA4r5/hr52Plx3Y8K A==;
X-CSE-ConnectionGUID: zPRJLcO/SJuFqMk8mzVTyw==
X-CSE-MsgGUID: fZgn8iICQ+mJPj1zvcovHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15662985"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="15662985"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 14:46:36 -0700
X-CSE-ConnectionGUID: pAtRtjl/QoiT8MlZ3iQsQw==
X-CSE-MsgGUID: lSEOiJSrRBCVpwCvopCj5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="42157816"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.119.62])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 14:46:35 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 8/9] drm/xe/vf: Skip engine ring enabling if VF
Date: Wed, 19 Jun 2024 23:45:56 +0200
Message-Id: <20240619214557.905-9-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240619214557.905-1-michal.wajdeczko@intel.com>
References: <20240619214557.905-1-michal.wajdeczko@intel.com>
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

All engines will be correctly initialized by the PF driver.
Moreover, VF drivers can't access related engine registers.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 52f12009678e..78b50d3a6501 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -547,7 +547,8 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 		if (hwe->class == XE_ENGINE_CLASS_OTHER)
 			hwe->irq_handler = xe_gsc_hwe_irq_handler;
 
-		xe_hw_engine_enable_ring(hwe);
+		if (!IS_SRIOV_VF(xe))
+			xe_hw_engine_enable_ring(hwe);
 	}
 
 	/* We reserve the highest BCS instance for USM */
-- 
2.43.0

