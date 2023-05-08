Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45803C77B7F
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 14:47:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD1410E2E4;
	Mon,  8 May 2023 14:47:27 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5E9310E2DB
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 14:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683557241; x=1715093241;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RRlLubcfgNPEAqwnO7nqwDaXR2EU3Q5HXFHREPo0T+o=;
 b=UvaTc+czBH/iMuIJ5T+xycM4uOC7CB/TV8JMFx89t3JZeOnJH+C4ubFh
 IokxsDB+KMgKT62SIlBFif27rWy4XitV3SO8pNRR/fy9Fd3tqnjVt2OLI
 RGAoApGUaqQLQQzeX9WQoz3wqy7+AoV1bMjTEwLtVBm++sQBWvEswAnOY
 PxnPg+IlX8kqSqFQ3ongr75jnFSHZhDPypAbiJYkd98lEwZuGzc/9isr3
 uzQsgzWKCcSAd54vU//JQDazhjdXskbquAXp7BwmM2bl8sDPEz1GKpSS3
 fTyx6r5XgYRzJMOBxoxpx4pe8QDA+R8u6hSf0DL6pZjxLmfKg0fYpi8V1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="349697859"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="349697859"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 07:47:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="648908161"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="648908161"
Received: from heid-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.62.78])
 by orsmga003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 07:47:19 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  8 May 2023 17:46:10 +0300
Message-Id: <20230508144618.162140-11-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508144618.162140-1-jani.nikula@intel.com>
References: <20230508144618.162140-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 10/18] fixup! drm/i915/display: Remaining changes
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

This is unused.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_de.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i915/display/intel_de.h
index ab711b2cba12..e858011efa02 100644
--- a/drivers/gpu/drm/i915/display/intel_de.h
+++ b/drivers/gpu/drm/i915/display/intel_de.h
@@ -22,12 +22,6 @@ intel_de_read8(struct drm_i915_private *i915, i915_reg_t reg)
 	return intel_uncore_read8(&i915->uncore, reg);
 }
 
-static inline u8
-intel_de_read64(struct drm_i915_private *i915, i915_reg_t reg)
-{
-	return intel_uncore_read64(&i915->uncore, reg);
-}
-
 static inline u64
 intel_de_read64_2x32(struct drm_i915_private *i915,
 		     i915_reg_t lower_reg, i915_reg_t upper_reg)
-- 
2.39.2

