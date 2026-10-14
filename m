Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC87CC6B1A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 12:06:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD69A10FD48;
	Wed, 14 Oct 2026 12:06:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C4E10FD2E;
 Wed, 14 Oct 2026 12:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791979570; x=1823515570;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p6+oHtJyxlg11NU5rFudE5VxoJKLuhsaZyZlxsO2oUE=;
 b=MPZ14ShcaRhJwG+vYlgVCutZY1AfScyrqyEnp28bddLas5lej4CJqxly
 X30DenucN9lCAGe4+8UPU19NFrU+GblhbS3nbiY/90PnR5pHZG2b8GNck
 XcIJnscXxGqeIfQuAcQqCDkjIF4QSO/gbqEPbDSa8BtQlRXBy7cF0Zduz
 CfiFbUhGSQSKUt0aa1HLW9g8NebUjzPydPT3/37oEYL7xa/Xvch8OTwEa
 olCQkLWT5s1x3Cgki21Crt6l1DhG/VGVhLsDeQ6OlPZEBNX+hPTOHKGgH
 Onk9o03jDyUqqxqb5IoZpr4OqCUEPnB90YYkfU/r+KgM4mn1X1PoCtaiu A==;
X-CSE-ConnectionGUID: hixHrXBgT0agvsHWsiQ7aQ==
X-CSE-MsgGUID: gW1LRS13SmKzXDg3+fZ26g==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="739801"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="739801"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 05:06:09 -0700
X-CSE-ConnectionGUID: EcQzEccvQISpxzfZVGS1rA==
X-CSE-MsgGUID: mGEf6Em8TTCFwixETGTDhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1736827"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.13])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 05:06:07 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 6/6] drm/xe: Remove unused uncore wrappers
Date: Wed, 14 Oct 2026 15:05:42 +0300
Message-ID: <20261014120542.29675-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014120542.29675-1-ville.syrjala@linux.intel.com>
References: <20261014120542.29675-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

intel_uncore_read64_2x32(), intel_uncore_posting_read(),
and intel_uncore_rmw() are no longer used by the display code.
Nuke the wrappers.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 .../drm/xe/compat-i915-headers/intel_uncore.h | 35 -------------------
 1 file changed, 35 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
index b8ea8f5b22d1..2f198e2e2fec 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
@@ -55,33 +55,6 @@ static inline u16 intel_uncore_read16(struct intel_uncore *uncore,
 	return xe_mmio_read16(__compat_uncore_to_mmio(uncore), reg);
 }
 
-static inline u64
-intel_uncore_read64_2x32(struct intel_uncore *uncore,
-			 i915_reg_t i915_lower_reg, i915_reg_t i915_upper_reg)
-{
-	struct xe_reg lower_reg = XE_REG(i915_mmio_reg_offset(i915_lower_reg));
-	struct xe_reg upper_reg = XE_REG(i915_mmio_reg_offset(i915_upper_reg));
-	u32 upper, lower, old_upper;
-	int loop = 0;
-
-	upper = xe_mmio_read32(__compat_uncore_to_mmio(uncore), upper_reg);
-	do {
-		old_upper = upper;
-		lower = xe_mmio_read32(__compat_uncore_to_mmio(uncore), lower_reg);
-		upper = xe_mmio_read32(__compat_uncore_to_mmio(uncore), upper_reg);
-	} while (upper != old_upper && loop++ < 2);
-
-	return (u64)upper << 32 | lower;
-}
-
-static inline void intel_uncore_posting_read(struct intel_uncore *uncore,
-					     i915_reg_t i915_reg)
-{
-	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
-
-	xe_mmio_read32(__compat_uncore_to_mmio(uncore), reg);
-}
-
 static inline void intel_uncore_write(struct intel_uncore *uncore,
 				      i915_reg_t i915_reg, u32 val)
 {
@@ -90,14 +63,6 @@ static inline void intel_uncore_write(struct intel_uncore *uncore,
 	xe_mmio_write32(__compat_uncore_to_mmio(uncore), reg, val);
 }
 
-static inline u32 intel_uncore_rmw(struct intel_uncore *uncore,
-				   i915_reg_t i915_reg, u32 clear, u32 set)
-{
-	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
-
-	return xe_mmio_rmw32(__compat_uncore_to_mmio(uncore), reg, clear, set);
-}
-
 static inline u32 intel_uncore_read_fw(struct intel_uncore *uncore,
 				       i915_reg_t i915_reg)
 {
-- 
2.55.0

