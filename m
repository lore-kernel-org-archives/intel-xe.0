Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86BDBC77B6E
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 14:27:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A0910E82A;
	Wed, 12 Apr 2023 14:27:24 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15FA310E82A
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 14:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681309642; x=1712845642;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ql7U5LxwX9+L6hfuGj4cg+qiXr73gCmgJttdQ1QvXJI=;
 b=GCJaKFwTACpriXjb5H+7ffjJKfRTZXquATHhjKPwtEHmdXd6gEYEf8LN
 aVM9tIc90PrnV7YeSpLNwkSsF7nXXm0/5WJUzPx2pHu/z5gJHLrKzpNiU
 isqH3Xjh91J97+xMYeo/kVZ3QVgQrjFsSc4XZrDHjBbIYxpHRO4HU2ca8
 94w781c1TcHa9RCjMA1uT9vBOUa9n90Z8mMPfbRk2nD7g0rqBAAp3q1sl
 p6Rpea20n7oGZDvt0k4Nsg4lFuRu8R/UJdvEOCwLePIdmkqHj0OuTOcCt
 yTA1vdDFFWdfWkKeWK7LKSuUkgsfCgngNqmEzKm91fP4rp9EezfZdk/bN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="328021794"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="328021794"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:27:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="666376224"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="666376224"
Received: from smoticic-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.45.172])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:27:07 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 17:20:00 +0300
Message-Id: <20230412142006.877109-36-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412142006.877109-1-jani.nikula@intel.com>
References: <20230412142006.877109-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 35/41] fixup! drm/i915/display: Remaining changes
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_power_map.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power_map.c b/drivers/gpu/drm/i915/display/intel_display_power_map.c
index 1a077a91859b..5784d3a51868 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power_map.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power_map.c
@@ -197,7 +197,6 @@ I915_DECL_PW_DOMAINS(vlv_pwdoms_dpio_tx_bc_lanes,
 	POWER_DOMAIN_INIT);
 
 static const struct i915_power_well_desc vlv_power_wells_main[] = {
-#ifdef I915
 	{
 		.instances = &I915_PW_INSTANCES(
 			I915_PW("display", &vlv_pwdoms_display,
@@ -225,7 +224,6 @@ static const struct i915_power_well_desc vlv_power_wells_main[] = {
 		),
 		.ops = &vlv_dpio_cmn_power_well_ops,
 	},
-#endif
 };
 
 static const struct i915_power_well_desc_list vlv_power_wells[] = {
@@ -276,7 +274,6 @@ I915_DECL_PW_DOMAINS(chv_pwdoms_dpio_cmn_d,
 	POWER_DOMAIN_INIT);
 
 static const struct i915_power_well_desc chv_power_wells_main[] = {
-#ifdef I915
 	{
 		/*
 		 * Pipe A power well is the new disp2d well. Pipe B and C
@@ -298,7 +295,6 @@ static const struct i915_power_well_desc chv_power_wells_main[] = {
 		),
 		.ops = &chv_dpio_cmn_power_well_ops,
 	},
-#endif
 };
 
 static const struct i915_power_well_desc_list chv_power_wells[] = {
-- 
2.39.2

