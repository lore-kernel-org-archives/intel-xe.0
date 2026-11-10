Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18ADA606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 18:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZLbURwYD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C9710E973;
	Tue, 10 Nov 2026 18:47:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D03810F2DB;
 Tue, 10 Nov 2026 18:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794336430; x=1825872430;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IN0SoWY7agMLdn5GjsWZIjFNeCbV2ScAgmtswYJsGVk=;
 b=ZLbURwYDSye8QJabfI4/Me8kzHLUuixxFghpWQGCCrWiwcUfZiiU/5Re
 UgFrdChc+WYzrSoaYLkCZifawiC1mv39UVDDNIWu65BkHWCcaYrMIWFuI
 1MTPVKx6xgOHAwHl0ddRx4M6IngJlwVWoxteBP+JhnyzsKWCIcfVizfSV
 4usXs8DBfWuN0uJ+OFDaSAyFfYREYbrmZzkOPye/q+5qiF4S4XQ5MJogY
 xGxtJlkqUJEzcPvxBhNhTHN8hXsalVDnPaxTRy1q/KXHiwd298g60xF5G
 HhsIsmMYD9a/xZ/hN0Z82jghGh3MyPudQtMzkJGPxWD/Su3gAI7t9CiGF Q==;
X-CSE-ConnectionGUID: /AtMMVAaTF+CursPtDBv6A==
X-CSE-MsgGUID: HsArMiazSJygUbPwhMxEyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="2975379"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="2975379"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 10:47:09 -0800
X-CSE-ConnectionGUID: yVYZADGQTa6/FgYPUXQXkQ==
X-CSE-MsgGUID: y+yMgnYfS92Nkv/m60h2gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; d="scan'208";a="10007782"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.86])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 10:47:08 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 10/10] drm/xe: Nuke the intel_uncore_{read,
 write}() wrappers
Date: Tue, 10 Nov 2026 20:46:21 +0200
Message-ID: <20261110184622.1721-11-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110184622.1721-1-ville.syrjala@linux.intel.com>
References: <20261110184622.1721-1-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

intel_uncore_{read,write}() are no longer needed by the
display code. Remove them.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 .../drm/xe/compat-i915-headers/intel_uncore.h    | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
index 2f198e2e2fec..238addc1e5fc 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
@@ -23,14 +23,6 @@ static inline struct xe_mmio *__compat_uncore_to_mmio(struct intel_uncore *uncor
 	return xe_root_tile_mmio(xe);
 }
 
-static inline u32 intel_uncore_read(struct intel_uncore *uncore,
-				    i915_reg_t i915_reg)
-{
-	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
-
-	return xe_mmio_read32(__compat_uncore_to_mmio(uncore), reg);
-}
-
 static inline u8 intel_uncore_read8(struct intel_uncore *uncore,
 				    i915_reg_t i915_reg)
 {
@@ -55,14 +47,6 @@ static inline u16 intel_uncore_read16(struct intel_uncore *uncore,
 	return xe_mmio_read16(__compat_uncore_to_mmio(uncore), reg);
 }
 
-static inline void intel_uncore_write(struct intel_uncore *uncore,
-				      i915_reg_t i915_reg, u32 val)
-{
-	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
-
-	xe_mmio_write32(__compat_uncore_to_mmio(uncore), reg, val);
-}
-
 static inline u32 intel_uncore_read_fw(struct intel_uncore *uncore,
 				       i915_reg_t i915_reg)
 {
-- 
2.56.0

