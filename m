Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 987D0EEAA51
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 15:29:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50AEF10E144;
	Thu, 14 Sep 2023 15:29:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79CD810E144
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Sep 2023 15:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694705350; x=1726241350;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NW1bw0px6+QkDmft8T7/7DOyflqwKN8IAOtlKoAvWAI=;
 b=oBQfVs9U36bWONgH05pEed16F8z+2FOEjGVNPnXInVnIPSLESv98HaTv
 1ch8Pi53jrihmEsogY7eu+ztHGHrSKm11irhovT5y88I8W6iZnMNcXsJK
 kDruePRf/VXPqnk80fx97QpBErNQ1rzmt8x5hhmlt1n80iA2jn5W+4I4B
 eR1b2JeE9iNS9apQieQRxuzAKeK93NJqEvxp6xOOnTMnSjw4VzcoeywXi
 hrJICSNmuqCkfCpVDyeDD73JGP2xN1NnNzK+BeHErs4L1dmQQuFHm1cnZ
 XIIB6K394P5xkeLk9l3GinttR4DmpVAdPB362QBGsusLrqYkmiGpsRunX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="381693198"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="381693198"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 08:12:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="887852092"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="887852092"
Received: from vgovind2-mobl3.tm.intel.com ([10.237.50.42])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 08:12:23 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 14 Sep 2023 18:12:40 +0300
Message-Id: <20230914151240.163434-2-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230914151240.163434-1-vinod.govindapillai@intel.com>
References: <20230914151240.163434-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/1] Revert "FIXME: drm/i915/hpd: skip
 intel_hpd_poll_fini() for non-display paths"
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
Cc: jani.nikula@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This reverts commit 5b503f7b6aa156d452fae3c92d9060b531aa628c.

This can be reverted as the intel_hpd_poll_fini is called from
display paths

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 9df8081f78d9..b2e16cb8d026 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -8027,9 +8027,6 @@ void intel_hpd_poll_fini(struct drm_i915_private *i915)
 	struct intel_connector *connector;
 	struct drm_connector_list_iter conn_iter;
 
-	if (!HAS_DISPLAY(i915))
-		return;
-
 	/* Kill all the work that may have been queued by hpd. */
 	drm_connector_list_iter_begin(&i915->drm, &conn_iter);
 	for_each_intel_connector_iter(connector, &conn_iter) {
-- 
2.34.1

