Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52302C77B73
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 23:29:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 256D310E9EC;
	Wed, 12 Apr 2023 23:29:08 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7338210E9E3
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 23:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681342145; x=1712878145;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xpp17ufDzNACg0R58dht+q77Pup1hQJxXZ6j0X0SL/Q=;
 b=RQEhKxenc/O+Sa4cWK0y1PsujGhdRk1lMqNflYcIIc5lnMugacx33uJN
 IOBGJznxKUpHFI99k38eEHxSzEHP1/Uol3MTLhXr3CU/Of85QFs/Cb8Ep
 qbD9IM5H8rn0yjt2jpJUgGWRYMs7lcT8Ltcc4sviWL852hpY4x5L1E5J6
 CGOvk7PMgQfUhDQq/BlgwYSkrdcz8C70HO9ICO/AVjvs1uZhLWcAe1H7V
 0y9+NNH6xAgd6UKy0Lz6ZeJ9/m5YNJFEePjkGsBRzJhz4oaquVVdhm+zh
 BRfMQE8Bpe0+25AdGWcykMAmEBLt3Kn5Me4wabXZozqOW/P3Id2x/DJea Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="332747996"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="332747996"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 16:29:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="691711991"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="691711991"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 16:29:03 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 16:28:42 -0700
Message-Id: <20230412232846.3411883-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230412232846.3411883-1-lucas.demarchi@intel.com>
References: <20230412232846.3411883-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/6] fixup! drm/i915/display: Remaining changes
 to make xe compile
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
 Matt Roper <matthew.d.roper@intel.com>
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

