Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E15A5EB64DD
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jul 2023 15:32:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3F3410E16B;
	Tue,  4 Jul 2023 15:32:55 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E29BE10E16B
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jul 2023 15:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688484773; x=1720020773;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mJVwSHUOL+Ckq188lqcUv/CyQt8SvipYzpAhPv8fidI=;
 b=KOe5ABfPjnLdlHvO9VOhMzFp3N21rAPVO/UYFgVepqX6ICRtn/XWv1qi
 L/IDm/J1qnySa2/YCqG/3CO73JzZRF5VrFzwa4m4YyWdAROLQqJPfyxSM
 55wXz32qrqhGQfxYMG4pb7fYQi18by3NvTzNoLPeTYAzhuAQ7UHAtvBqA
 wrXZu7+bXS1ZX037fLzwxsOg0R/otdMI0KqtYjqTMGzosLXFpD+auDFBi
 7oAr/WPY2OcS4Tj71kwdGsTyY7wEaDA58Vsem/FZWXif6heFDtZGBwp/J
 bAK9Yfh+7c5dTQEUWoyetv1/PV8efOqRSYy4ITWIYC7+2nTH4q3QtOahZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="343480167"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="343480167"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 08:32:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="712913899"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="712913899"
Received: from jbouhlil-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.48.173])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 08:32:52 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  4 Jul 2023 18:32:40 +0300
Message-Id: <20230704153243.2489821-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230704153243.2489821-1-jani.nikula@intel.com>
References: <20230704153243.2489821-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/4] drm/i915/dram: replace __raw_uncore_read32()
 with intel_uncore_read_fw()
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The __raw_uncore_* interface is supposed to be intel_uncore.[ch]
internal only. Replace the remaining outside user with
intel_uncore_read_fw(), which is essentially the same thing.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230627105849.274263-1-jani.nikula@intel.com
(cherry picked from commit ce98870593fc9f4c62d02e4dea3492ad82a248b9)
---
 drivers/gpu/drm/i915/soc/intel_dram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/soc/intel_dram.c b/drivers/gpu/drm/i915/soc/intel_dram.c
index 9f0651d48d41..15492b69f698 100644
--- a/drivers/gpu/drm/i915/soc/intel_dram.c
+++ b/drivers/gpu/drm/i915/soc/intel_dram.c
@@ -704,7 +704,7 @@ void intel_dram_edram_detect(struct drm_i915_private *i915)
 	if (!(IS_HASWELL(i915) || IS_BROADWELL(i915) || GRAPHICS_VER(i915) >= 9))
 		return;
 
-	edram_cap = __raw_uncore_read32(&i915->uncore, HSW_EDRAM_CAP);
+	edram_cap = intel_uncore_read_fw(&i915->uncore, HSW_EDRAM_CAP);
 
 	/* NB: We can't write IDICR yet because we don't have gt funcs set up */
 
-- 
2.39.2

