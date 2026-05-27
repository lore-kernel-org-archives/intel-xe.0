Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F005CD6E4C
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 19:00:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C3A10E93C;
	Wed, 27 May 2026 19:00:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CTrmuUeT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B808D10E938;
 Wed, 27 May 2026 19:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779908440; x=1811444440;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=cdYhh0pt+3xq2Lt1srw51fFDo2Dcw6L+XZhQW1I4uBU=;
 b=CTrmuUeTBV3OAURUvUENJFeydIKkouwB5w43xl2MktFvEaM93OBIcx7E
 0hLfhERKiDVlBdqnuSYVpS/MhksFu7qxY85mJ0+Go3jMfjArm7+PnrMo8
 Szo9T7kCJMzxL1S0B9ZbYjp49wdit1zwUmYVSANHtKN7ItP+WCzCASkIk
 g/0OAHcNCeiNiM7CmUbBXBo8IfTaCq5LLnByL8bhC0rCIs8uqk7M9ZkaH
 khMEMrUD0rU9z6p8sReBiyhZMULaWF6HIjAhqCK28Ju4CoS0Zb40Fnrp3
 SzCW7HBJK2aNyQCUdYwVWemKFX7b2u6t+37PloiLfaXoJZKJ0tqVEaYy+ Q==;
X-CSE-ConnectionGUID: /ixllLjPTUmfszJUOqkYwg==
X-CSE-MsgGUID: P0CbWzYqTOOfDeuXHDKSjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80602140"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="80602140"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 12:00:40 -0700
X-CSE-ConnectionGUID: b130NsY4R7e28iZXRSe0gg==
X-CSE-MsgGUID: xahj7FoxRqK5hrlZFAGnmQ==
X-ExtLoop1: 1
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 12:00:38 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [CI 06/17] drm/i915/display: Add DC3CO support check
Date: Thu, 28 May 2026 00:29:53 +0530
Message-ID: <20260527190004.118730-7-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527190004.118730-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260527190004.118730-1-dibin.moolakadan.subrahmanian@intel.com>
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

Add intel_display_power_dc3co_supported() helper to query DC3CO
support from allowed_dc_mask.

Changes in v2:
- Squash "Add helper to check DC3CO support" patch into this patch

Changes in v4:
- Remove introduced dc state validation,as it may break
  fall back mechanism (sashiko)

Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_power.c | 8 ++++++++
 drivers/gpu/drm/i915/display/intel_display_power.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 2a05af31a142..0f4b27661e1c 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -315,6 +315,7 @@ void intel_display_power_set_target_dc_state(struct intel_display *display,
 	struct i915_power_domains *power_domains = &display->power.domains;
 
 	mutex_lock(&power_domains->lock);
+
 	power_well = lookup_power_well(display, SKL_DISP_DC_OFF);
 
 	if (drm_WARN_ON(display->drm, !power_well))
@@ -375,6 +376,13 @@ u32 intel_display_power_get_current_dc_state(struct intel_display *display)
 	return current_dc_state;
 }
 
+bool intel_display_power_dc3co_supported(struct intel_display *display)
+{
+	struct i915_power_domains *power_domains = &display->power.domains;
+
+	return (power_domains->allowed_dc_mask & DC_STATE_EN_UPTO_DC3CO) == DC_STATE_EN_UPTO_DC3CO;
+}
+
 static void __async_put_domains_mask(struct i915_power_domains *power_domains,
 				     struct intel_power_domain_mask *mask)
 {
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.h b/drivers/gpu/drm/i915/display/intel_display_power.h
index b43d4146a78a..5e0ffe2a2400 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.h
+++ b/drivers/gpu/drm/i915/display/intel_display_power.h
@@ -188,6 +188,7 @@ bool intel_display_power_get_and_reset_dc3co_to_dc6(struct intel_display *displa
 void intel_display_power_set_target_dc_state(struct intel_display *display,
 					     u32 state);
 u32 intel_display_power_get_current_dc_state(struct intel_display *display);
+bool intel_display_power_dc3co_supported(struct intel_display *display);
 
 bool intel_display_power_is_enabled(struct intel_display *display,
 				    enum intel_display_power_domain domain);
-- 
2.43.0

