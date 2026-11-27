Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B500A606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 06:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WQ+taDgi
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5706C11231C;
	Fri, 27 Nov 2026 06:10:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26605112282;
 Fri, 27 Nov 2026 06:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795759817; x=1827295817;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9zN5spTTY79xgRc02BNj7dDTPo8BRDq8ZwxNigshA+U=;
 b=WQ+taDgiifUE3WtAMQ6b6PYHfH6ysOeg8sWqkVO+PQ1q15VT6BfDMgDH
 uMr4UW/+jeO64AxJk98+n9WTChbppzjTlSlpKRDQ+t0puK1V8w/ji0qvF
 LzWj/llrZK97qi04BXjVbSzB6GpC0qHkWWlB2xmiU+XrmWmsYyIJeI+N4
 XX/vlmKyff1BAMhqFqJlxepxZG2+QbvGm6RShhlHVwPYB2SO8cxNrLRiI
 PRfUzs+q7h8yGXX9krjtc1P2UzWckZ1bIdJD73Ev6OdIvd8Vp5iMKlWmy
 BlYKnJ+VcWBrSdQIu8td8yW135wiwReRm3URCeaHNsHCrWSgrlzm8SCXI A==;
X-CSE-ConnectionGUID: Vs8l70/ZRXqtM//sLjbCnw==
X-CSE-MsgGUID: iAzmeIZ9T6STyG27l7Tblg==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4578279"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4578279"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 22:10:16 -0800
X-CSE-ConnectionGUID: TmhdBoQ1SgO77/RUJ1Ja7A==
X-CSE-MsgGUID: RixOscEUTVaM4hWFYsY7EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="14361990"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa013.fm.intel.com with ESMTP; 26 Nov 2026 22:10:14 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 chaitanya.kumar.borah@intel.com, jani.nikula@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v2 18/18] drm/i915/display: Disable port sync on PTL
Date: Fri, 27 Nov 2026 11:39:24 +0530
Message-Id: <20261127060924.1648295-19-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261127060924.1648295-1-suraj.kandpal@intel.com>
References: <20261127060924.1648295-1-suraj.kandpal@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Port sync is defeatured from xe3lpd onwards (Wa_16024710867). It was
allowed again on PTL to keep the tiles of dual-SST tiled displays in
sync, but PTL now uses pipelock for that. Limit port sync to the
platforms before xe3lpd again.

Bspec: 69965
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
v1 -> v2:
- Narrow HAS_PORT_SYNC() instead of the version check (Jani)

 drivers/gpu/drm/i915/display/intel_display_device.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
index 5c76516ec115..34aee9a77910 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.h
+++ b/drivers/gpu/drm/i915/display/intel_display_device.h
@@ -196,7 +196,7 @@ struct intel_display_platforms {
 #define HAS_PIPELOCK(__display)		(DISPLAY_VER(__display) >= 30)
 #define HAS_PIXEL_NORMALIZER(__display)	(DISPLAY_VER(__display) >= 35)
 #define HAS_PMDEMAND(__display)		(DISPLAY_VER(__display) >= 14)
-#define HAS_PORT_SYNC(__display)	(IS_DISPLAY_VER(__display, 9, 30))
+#define HAS_PORT_SYNC(__display)	(IS_DISPLAY_VER(__display, 9, 20))
 #define HAS_PSR(__display)		(DISPLAY_INFO(__display)->has_psr)
 #define HAS_PSR_HW_TRACKING(__display)	(DISPLAY_INFO(__display)->has_psr_hw_tracking)
 #define HAS_PSR2_SEL_FETCH(__display)	(DISPLAY_VER(__display) >= 12)
-- 
2.34.1

