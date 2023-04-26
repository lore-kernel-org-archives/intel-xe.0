Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15129C7EE23
	for <intel-xe@archiver.kernel.org>; Wed, 26 Apr 2023 21:33:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E63E710EA50;
	Wed, 26 Apr 2023 21:33:10 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 706F210E335
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Apr 2023 21:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682544776; x=1714080776;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mgT32tj9fI4GyFa+eAgFzhJsPvqVLm1uTNNlC3XRmqQ=;
 b=iLK1uj55Nh/hHQjthXgrMW3yUt6MHyXnsIsvab4KZ+ggU+wYO9CDXyHK
 Vekd4Z2nvtKimNlT2AeNmeRUJHb3FUAKRzsu0aLHI9am9Ukiwir3VSomE
 /hmnrPUbkOdbrdhtWHKopfVtosMHK23RMA5zgxn87c0vFAbRFLQwNCMrJ
 G/OKTFMjnUdf8g1xb9I+nyVspW8gD31gvKDPifAF0dmKp2YMI9SmaA2ff
 P6uP2VtCFfOeStzQFGEO2F3b7GPG9P8ITLcYY/glijP5yfFBuojHpf2xw
 BMxO3nfAu3/gUg/WD8UhqwMWA0Egd+IMuxs49GfBJUycGNsGihAhpDybd w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="375213086"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="375213086"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 14:32:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="644415160"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="644415160"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 14:32:54 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 26 Apr 2023 14:32:28 -0700
Message-Id: <20230426213242.1315119-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230426213242.1315119-1-lucas.demarchi@intel.com>
References: <20230426213242.1315119-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 03/17] fixup! drm/i915/display: Allow fbdev to
 allocate stolen memory
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
index 46447dd58f3f..2d2388cbc626 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -349,7 +349,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
 		else
 			info->fix.smem_start =
 				pci_resource_start(pdev, 2) +
-				xe_bo_addr(obj, 0, GEN8_PAGE_SIZE, &lmem);
+				xe_bo_addr(obj, 0, XE_PAGE_SIZE, &lmem);
 
 		info->fix.smem_len = obj->ttm.base.size;
 	} else {
-- 
2.40.1

