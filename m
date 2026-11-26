Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F75606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 06:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Jzp1UlTR
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 023E610FC10;
	Thu, 26 Nov 2026 06:35:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B2A10FC6C;
 Thu, 26 Nov 2026 06:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795674909; x=1827210909;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/ByliYgYLBGWbpE/APqzFu82gAuDqRGgftahj7MyT78=;
 b=Jzp1UlTRdPYq4UY1B6LvQgxF0iKQfrNVDPMwUdwRsaDGJTSEQwH3px3P
 IZRqLOGGO/vVJsd8bLeFknrtFlYL92g/sDA57+sKxGf3K60xK+iqB1Z/g
 oW3qAGecXNoqg40tGZP7gLNGtYkI+aVtvUQ8M/Pkv75VJBTswFi55z7cI
 Tv2DQoo3qQF4hqh5mNs6RZ/bj9bzyRI+zjfdsUCl2guG4i3cPMj2jnu6d
 7RjfyFg6G5+Pwa2tPdxnUjkn0M54tchrYssvqQl9/n6ZRextdKTPFz6hb
 VsB5vM7ObwwMuSbFZc7xVsWPhHi/zPFvWeGQE0NXEwVBIm87O2z4wi7zY w==;
X-CSE-ConnectionGUID: ueMCZRdBTL6AWdxKj6E39w==
X-CSE-MsgGUID: YBgJSM38Th20iSiV2vfLPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4462620"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4462620"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 22:35:09 -0800
X-CSE-ConnectionGUID: 0bUf3fHFTwOK+H9b88s3fQ==
X-CSE-MsgGUID: p7jngQ+HTLOCsmBXm/BblA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12346674"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa002.fm.intel.com with ESMTP; 25 Nov 2026 22:35:07 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 chaitanya.kumar.borah@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 02/15] drm/i915/display: Add HAS_PIPELOCK()
Date: Thu, 26 Nov 2026 12:04:46 +0530
Message-Id: <20261126063459.863698-3-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126063459.863698-1-suraj.kandpal@intel.com>
References: <20261126063459.863698-1-suraj.kandpal@intel.com>
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Starting with NVL, port sync is gone and transcoders are synchronized
with pipelock instead. Add a macro to check for it.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_device.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
index 4f82520ef960..c6a5409e2db0 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.h
+++ b/drivers/gpu/drm/i915/display/intel_display_device.h
@@ -193,6 +193,7 @@ struct intel_display_platforms {
 #define HAS_OVERLAY(__display)		(DISPLAY_INFO(__display)->has_overlay)
 #define HAS_PEAK_BW_THRESHOLD(__display)	(DISPLAY_VER(__display) >= 30)
 #define HAS_PIPEDMC(__display)		(DISPLAY_VER(__display) >= 12)
+#define HAS_PIPELOCK(__display)		(DISPLAY_VER(__display) >= 35)
 #define HAS_PIXEL_NORMALIZER(__display)	(DISPLAY_VER(__display) >= 35)
 #define HAS_PMDEMAND(__display)		(DISPLAY_VER(__display) >= 14)
 #define HAS_PSR(__display)		(DISPLAY_INFO(__display)->has_psr)
-- 
2.34.1

