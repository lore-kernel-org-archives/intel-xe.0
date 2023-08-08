Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90208C001DF
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 11:46:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62F4810E3DC;
	Tue,  8 Aug 2023 11:46:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D7C10E3DC
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Aug 2023 11:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691495180; x=1723031180;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iW2sRqmB1lmYBUf1amS76KckLiGH6y4bI0lInoyBR00=;
 b=XuqXj4yucw1KHlBzde63JT/Lm4zorQ1wJw2m4atFvyGTZJ3X534bBKEx
 uHuP8SretMqmpC5RZQG9kpYQnuBrINPBM2wqMRYxxCGAJYy8+ELbw/BRG
 ObSrgVaVBtOrbreauoaLrpGAg66ZES31226pqFP4lOIbYt9okP+cGBacN
 l8OW8cwEmk+va8AS7IWJiGf9F6czLl7WSCiASGY7mN3JaWIvEVpbXxVIC
 ztVBysTYPAzPApdX4Kd5lQOc1iSRU3C6IwMkS81JP+0xCez/xg54I9GNg
 gExRrQkUMxr/ZxudfFXDO5RsNLZFXYWkw9W7YXwPxjC7jSXvHiWGb2lc8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="401758788"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; d="scan'208";a="401758788"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 04:46:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="734497609"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; d="scan'208";a="734497609"
Received: from sschwar3-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.49.159])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 04:46:17 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  8 Aug 2023 14:45:35 +0300
Message-Id: <20230808114535.1600595-9-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230808114535.1600595-1-jani.nikula@intel.com>
References: <20230808114535.1600595-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 9/9] fixup! drm/i915/display: Remaining changes
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
Cc: jani.nikula@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Unnecessary change, drop it.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vbt_defs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vbt_defs.h b/drivers/gpu/drm/i915/display/intel_vbt_defs.h
index 001de8fe4e64..a9f44abfc9fc 100644
--- a/drivers/gpu/drm/i915/display/intel_vbt_defs.h
+++ b/drivers/gpu/drm/i915/display/intel_vbt_defs.h
@@ -30,7 +30,7 @@
  *
  * Please do NOT include anywhere else.
  */
-#if !defined(_INTEL_BIOS_PRIVATE) && !defined(HDRTEST)
+#ifndef _INTEL_BIOS_PRIVATE
 #error "intel_vbt_defs.h is private to intel_bios.c"
 #endif
 
-- 
2.39.2

