Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F69ACA6012
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 10:36:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0505911206B;
	Fri,  9 Oct 2026 10:36:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UYruFTSr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10AC9112065;
 Fri,  9 Oct 2026 10:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791542165; x=1823078165;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sifTCDYjc0bLjNQckWzlUm73dcBV7lxrj3rArwngJgM=;
 b=UYruFTSrXPjyWDMh6BG+LaKhcTkHgT1GC8niprIUQcogwaUNJN/FqQYt
 vGC5jK2wsr+TDdODRe4O+HqWEImypY7J0Mt2hlyNh86UKvDtL5HocM2YQ
 u3pE/HqggCIcfw4GJ0m1gzM4HvuiTGVBg9hljCCjUlYvwkuEXoGC7wR4N
 NxnaYY6SgkPtSm0NLpNkavvNJ2eL3Fpn8bcfHT1MqrRYKCf/hiznpgWYn
 HRDWMu12NFJ64L7WWb9QXCDyA9ZtZOTQUCpWtnUJLksw9F+RWOr8BT1ih
 yJzE7djgea5asYX0m7UooOzADElhfpDdsoX37g4k8QhYiwVhbjaYJnRZn w==;
X-CSE-ConnectionGUID: mzABzkd1Tlmx4VuYr/z8uA==
X-CSE-MsgGUID: D/b7wi3tQ3+wmC9n9MNNrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="219342"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="219342"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 03:36:04 -0700
X-CSE-ConnectionGUID: D2i/WwZCTlmvJv8feLZCpw==
X-CSE-MsgGUID: pgt3tDu5RRCSCmT3Ym9MDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="399280"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa002.fm.intel.com with ESMTP; 09 Oct 2026 03:36:03 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH 4/5] drm/i915/lt_phy: drop the unused pll argument from
 intel_lt_phy_pll_enable()
Date: Fri,  9 Oct 2026 10:35:50 +0000
Message-ID: <20261009103552.1864818-5-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009103552.1864818-1-mika.kahola@intel.com>
References: <20261009103552.1864818-1-mika.kahola@intel.com>
MIME-Version: 1.0
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

intel_lt_phy_pll_enable() never looks at the pll, it is there only
because intel_xe3plpd_pll_enable() forwards its own arguments. Drop it
so callers that have no pll do not have to pass NULL.

No functional change.

Assisted-by: Copilot:claude-opus-5
Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_lt_phy.c | 3 +--
 drivers/gpu/drm/i915/display/intel_lt_phy.h | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.c b/drivers/gpu/drm/i915/display/intel_lt_phy.c
index c626246b71f9..e05fd23b8a65 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy.c
@@ -1924,7 +1924,6 @@ intel_lt_phy_enable_disable_tx(struct intel_encoder *encoder,
 }
 
 void intel_lt_phy_pll_enable(struct intel_encoder *encoder,
-			     struct intel_dpll *pll,
 			     const struct intel_dpll_hw_state *dpll_hw_state)
 {
 	struct intel_display *display = to_intel_display(encoder);
@@ -2300,7 +2299,7 @@ void intel_xe3plpd_pll_enable(struct intel_encoder *encoder,
 			      struct intel_dpll *pll,
 			      const struct intel_dpll_hw_state *dpll_hw_state)
 {
-	intel_lt_phy_pll_enable(encoder, pll, dpll_hw_state);
+	intel_lt_phy_pll_enable(encoder, dpll_hw_state);
 }
 
 void intel_xe3plpd_pll_disable(struct intel_encoder *encoder)
diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.h b/drivers/gpu/drm/i915/display/intel_lt_phy.h
index 16de39484779..368ceedb1e0a 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy.h
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy.h
@@ -19,7 +19,6 @@ struct intel_crtc;
 struct intel_lt_phy_pll_state;
 
 void intel_lt_phy_pll_enable(struct intel_encoder *encoder,
-			     struct intel_dpll *pll,
 			     const struct intel_dpll_hw_state *dpll_hw_state);
 void intel_lt_phy_pll_disable(struct intel_encoder *encoder);
 int
-- 
2.43.0

