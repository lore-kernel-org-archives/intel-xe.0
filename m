Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 438A4C77B7F
	for <intel-xe@archiver.kernel.org>; Wed, 26 Apr 2023 21:33:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B40D210EA49;
	Wed, 26 Apr 2023 21:32:58 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3267110EA29
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Apr 2023 21:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682544776; x=1714080776;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nCSnJwVg/mComMdeszV5vCbCg+A5kYyr9jiOoyktlTA=;
 b=QpIutKXbb5/ABcbbNVKskyvHBsgEmdgiIWfFW+6Oqb++CFZfqT5rt7AV
 I+y6RvudR+6y4Mxj/77ZbVpN+H6Ja0BhIW8yB4+Oc5Vp292UTmAvaa9a0
 qfKLOIS3M8N8DBxkUuWyffbXmkcLEfOG95UtxQQa3vbDpUnSBn2DQiJmU
 gfYiV6ciauokqCGDTsvN/HWBh1aVx5BTeZKUiWLRAlZ1eu9mduSgBcb16
 n4dPl7ukMsLCqNKxTRtGe5Axyr+OYfBM9C54wzeZ+XgGJrBzBXE1ihQwH
 FSCYa/2zOT7APQxGZDSwb0vJKU+LFney9qU0FP6iL+3LsXryBAirzZsok A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="375213084"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="375213084"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 14:32:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="644415157"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="644415157"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 14:32:54 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 26 Apr 2023 14:32:27 -0700
Message-Id: <20230426213242.1315119-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230426213242.1315119-1-lucas.demarchi@intel.com>
References: <20230426213242.1315119-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 02/17] fixup! drm/i915/display: Remaining
 changes to make xe compile
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index ed996546edfc..46447dd58f3f 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -165,7 +165,7 @@ static int intelfb_alloc(struct drm_fb_helper *helper,
 				    DIV_ROUND_UP(sizes->surface_bpp, 8), 64);
 #else
 	mode_cmd.pitches[0] = ALIGN(mode_cmd.width *
-				    DIV_ROUND_UP(sizes->surface_bpp, 8), GEN8_PAGE_SIZE);
+				    DIV_ROUND_UP(sizes->surface_bpp, 8), XE_PAGE_SIZE);
 #endif
 	mode_cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
 							  sizes->surface_depth);
-- 
2.40.1

