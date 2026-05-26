Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E859CD5BB1
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 19:19:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 026C910E6BA;
	Tue, 26 May 2026 19:19:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Enrck9Jr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 160CA10E6E0;
 Tue, 26 May 2026 19:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779823142; x=1811359142;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QYDuwIC1sUtqYaXVYsmZf3pTKSJbTIxrFR/sVGrKc0c=;
 b=Enrck9JrqA1Qdlv++cabdbjMppzcoyL3IooN/zl/xX95LR2Ed6XLrVkD
 ac9TRrHk/MFpHjUl0W8rIgcJLeih5q+R1ofJQ1OubHQhKsxwucAqLO828
 NHx1B/1TvTy7Bm+/4grw/MopB6FQpw3jc0jOAEBrR+R5nj4V7SmxGDB8g
 xnOqsKYEdGNulfPzS90EIChWARoKB6gP5c05cNmlzooRsVcK0lZID2bBV
 IEX+vmz1vXfUo9bhZH78GR5ySHQlqn6HMdLFWRGfX6pmDYkRZXvOplaGx
 8ijOjVfU4YWx35AenAVEPCZ8IecrnsMarE0Yx4AFQRODld3lQOKgabRdp A==;
X-CSE-ConnectionGUID: bq/5AYPfRnmiX1o2iIqt3w==
X-CSE-MsgGUID: NWe6/AbLTOStstUvPkREYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="83226286"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="83226286"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 12:19:02 -0700
X-CSE-ConnectionGUID: Dpagd+g8SW+uzUzGhfP3dg==
X-CSE-MsgGUID: 0+f7jk83RUyV/TbOe4TnNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="237841860"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 12:19:00 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: animesh.manna@intel.com,
	uma.shankar@intel.com
Subject: [PATCH v4 05/13] drm/i915/display: Add DC3CO support check
Date: Wed, 27 May 2026 00:48:18 +0530
Message-ID: <20260526191826.3786009-6-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526191826.3786009-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260526191826.3786009-1-dibin.moolakadan.subrahmanian@intel.com>
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
index c70971ffd9f0..4b91747b38f1 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -302,6 +302,7 @@ void intel_display_power_set_target_dc_state(struct intel_display *display,
 	struct i915_power_domains *power_domains = &display->power.domains;
 
 	mutex_lock(&power_domains->lock);
+
 	power_well = lookup_power_well(display, SKL_DISP_DC_OFF);
 
 	if (drm_WARN_ON(display->drm, !power_well))
@@ -358,6 +359,13 @@ u32 intel_display_power_get_current_dc_state(struct intel_display *display)
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
index d616d5d09cbe..05880e9da89f 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.h
+++ b/drivers/gpu/drm/i915/display/intel_display_power.h
@@ -186,6 +186,7 @@ void intel_display_power_resume(struct intel_display *display);
 void intel_display_power_set_target_dc_state(struct intel_display *display,
 					     u32 state);
 u32 intel_display_power_get_current_dc_state(struct intel_display *display);
+bool intel_display_power_dc3co_supported(struct intel_display *display);
 
 bool intel_display_power_is_enabled(struct intel_display *display,
 				    enum intel_display_power_domain domain);
-- 
2.43.0

