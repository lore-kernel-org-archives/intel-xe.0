Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6922CA5FB1
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 11:53:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4A0F10F344;
	Wed, 30 Sep 2026 11:53:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EnWvCTtq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F41B10F336;
 Wed, 30 Sep 2026 11:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790769197; x=1822305197;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NvNOJzQcipecoUjUimOxPunyPfTrMFsqrjB145Ouh2E=;
 b=EnWvCTtqqD/g8gYMFrQUZ1hQhPsuEUPgtWPei2ktPM5h2jeLUeqJ9sTC
 PADCNkhBUX1mf4cH4d3wx+2AcqpBUJHboB74Ui43ApHQW1RdeqqoauU6W
 4j1ZbyOcDnWuiGATVOKq+dIwLSxeWm/Lydf5H9d0aANKJiF+sI3nsliEr
 rQAykgtrQWqbHtguzvOnnMw3IfU5qZxUXZWb8WLf0t8xCJbACcGA/Js4W
 r7q7t7BzqIMimvZBeAVN5vtKReBSam8viBa3UwVjvHusRrAVJ6YHomtKS
 9ZeeomL4hIhZU3nWHnzM7BySAnQCb7VHhlqmFnBybvtLjlrMbRcfdcelw Q==;
X-CSE-ConnectionGUID: Y693unnTSL+CMuW5J1GVlg==
X-CSE-MsgGUID: e6L6MSN6TXCOd/PdJi745w==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="113290682"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="113290682"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 04:53:16 -0700
X-CSE-ConnectionGUID: hj6+aDwyTLWhnLJJG9Sphw==
X-CSE-MsgGUID: UkAz3Bb7Sn6exJnd7j8fOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="273472936"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.175])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 04:53:15 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/3] drm/i915/de: Nuke intel_de_{read,write}_notrace()
Date: Wed, 30 Sep 2026 14:53:03 +0300
Message-ID: <20260930115303.24285-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260930115303.24285-1-ville.syrjala@linux.intel.com>
References: <20260930115303.24285-1-ville.syrjala@linux.intel.com>
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

intel_de_{read,write}_notrace() are now completely unused,
so nuke them. Reducing the number of different register
access functions should help a bit with cleaning up the
final uncore mess between xe vs. i915.

And with this we can also nuke the corresponding xe uncore
compat wrappers.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_de.h          | 12 ------------
 .../drm/xe/compat-i915-headers/intel_uncore.h    | 16 ----------------
 2 files changed, 28 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i915/display/intel_de.h
index 8144588d3cf7..4ae041a96b31 100644
--- a/drivers/gpu/drm/i915/display/intel_de.h
+++ b/drivers/gpu/drm/i915/display/intel_de.h
@@ -164,18 +164,6 @@ intel_de_posting_read_fw(struct intel_display *display, intel_reg_t reg)
 	intel_de_read_fw(display, reg);
 }
 
-static inline u32
-intel_de_read_notrace(struct intel_display *display, intel_reg_t reg)
-{
-	return intel_uncore_read_notrace(__to_uncore(display), reg);
-}
-
-static inline void
-intel_de_write_notrace(struct intel_display *display, intel_reg_t reg, u32 val)
-{
-	intel_uncore_write_notrace(__to_uncore(display), reg, val);
-}
-
 static __always_inline void
 intel_de_write_dsb(struct intel_display *display, struct intel_dsb *dsb,
 		   intel_reg_t reg, u32 val)
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
index 08d7ab933672..b8ea8f5b22d1 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
@@ -114,22 +114,6 @@ static inline void intel_uncore_write_fw(struct intel_uncore *uncore,
 	xe_mmio_write32(__compat_uncore_to_mmio(uncore), reg, val);
 }
 
-static inline u32 intel_uncore_read_notrace(struct intel_uncore *uncore,
-					    i915_reg_t i915_reg)
-{
-	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
-
-	return xe_mmio_read32(__compat_uncore_to_mmio(uncore), reg);
-}
-
-static inline void intel_uncore_write_notrace(struct intel_uncore *uncore,
-					      i915_reg_t i915_reg, u32 val)
-{
-	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
-
-	xe_mmio_write32(__compat_uncore_to_mmio(uncore), reg, val);
-}
-
 static inline bool
 intel_uncore_arm_unclaimed_mmio_detection(struct intel_uncore *uncore)
 {
-- 
2.54.0

