Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE0E5C7618E
	for <intel-xe@archiver.kernel.org>; Fri, 21 Apr 2023 22:33:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86FE710E0D8;
	Fri, 21 Apr 2023 22:33:32 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4524310E118
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Apr 2023 22:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682116394; x=1713652394;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xpp17ufDzNACg0R58dht+q77Pup1hQJxXZ6j0X0SL/Q=;
 b=LZxaDA16I/no0OmbuRGMc24RwmTRdBPIE0UiBFSfskifEHFofOCvW6u5
 aBzD6ir49LGemirRerKfAyF45BDuGbKdb4v9lsYOA+RibIaGFhslaBElD
 lSF1QLfWtEA4D2HidBV1msffxO4T2oxtPt0HIYhtaI5SuXB7MK4/6yJ7/
 LnMHHpmx11K41jzXK4RyE/DdcOiwEpF938+KKl3f/1siSsyFfCCaKuwxo
 94+qxCzjx4j9SRCWeHaexjqUNOdP/XkTFfAaXYdnDjEID2E6Rwj9+4tgA
 kB45wnx2nra9nmt/MnmKjk3DvH9nfrlWQtAaV5SWkEqQwTk2LnPDtHlT3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="325693732"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="325693732"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 15:33:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="722913731"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="722913731"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 15:33:12 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 21 Apr 2023 15:32:43 -0700
Message-Id: <20230421223258.128781-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230421223258.128781-1-lucas.demarchi@intel.com>
References: <20230421223258.128781-1-lucas.demarchi@intel.com>
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
2.39.0

