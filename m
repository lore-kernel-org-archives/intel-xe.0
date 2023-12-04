Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B32C10F14
	for <intel-xe@archiver.kernel.org>; Mon,  4 Dec 2023 06:51:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81EAB10E22D;
	Mon,  4 Dec 2023 06:50:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0822910E2C0
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Dec 2023 06:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701672606; x=1733208606;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4Ymrl5xPJhvf0gQ62ZU5KIkYboty78kSZh8dLbOxGJs=;
 b=UBDNvfOTtXB0lRh1TLXd8jA5hDKNHaiezx3D+wNtgRfdN5lGXvROIra6
 qfpdAWb/Vy1adRlWPtrVRdfOvAdeWUmn8S4tsGay/wEGijn1VdIPplwOF
 wHGXSnbi2NY8n3AfKZ3JoKCdHc/04tadiHwhqEtknrp2wLSpS463HjaBv
 NZtMc71pfZjtVaDGUTuWeAmyAgvxg3y/StwZRbeu3No4R5/WTRgMkhJIk
 6Zn7E3e5QPUexXaZGVSvIESGQ+6++BhB/8wpXe/bFfHxeBP4uc+2E4Zte
 zYRU8Jq05p0uL1mpR8esyttDuJH9Kg0kCLDkeVpVq/0khmS6VSue6xb/a Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="373880077"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; d="scan'208";a="373880077"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2023 22:50:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="836482840"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; d="scan'208";a="836482840"
Received: from martinro-mobl2.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.252.46.174])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2023 22:50:04 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  4 Dec 2023 08:49:28 +0200
Message-Id: <20231204064932.869215-6-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231204064932.869215-1-jouni.hogander@intel.com>
References: <20231204064932.869215-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 5/9] drm/i915/display: Handle invalid
 fb_modifier in intel_fb_modifier_to_tiling
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Lookup_modifier is returning INTEL_PLANE_CAP_TILING_4 on invalid
fb_modifier value. Use lookup_modifier_or_null in
intel_fb_modifier_to_tiling and return I915_TILING_NONE in case
lookup_modifier_or_null returns null.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231203114840.841311-4-jouni.hogander@intel.com
(cherry picked from commit c61d8f7baabad322d53db301f7afaa2ce41493e6)
---
 drivers/gpu/drm/i915/display/intel_fb.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index f42a693f96c1..20d58a021a42 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -303,7 +303,14 @@ lookup_format_info(const struct drm_format_info formats[],
 
 unsigned int intel_fb_modifier_to_tiling(u64 fb_modifier)
 {
-	u8 tiling_caps = lookup_modifier(fb_modifier)->plane_caps &
+	const struct intel_modifier_desc *md;
+	u8 tiling_caps;
+
+	md = lookup_modifier_or_null(fb_modifier);
+	if (!md)
+		return I915_TILING_NONE;
+
+	tiling_caps = lookup_modifier_or_null(fb_modifier)->plane_caps &
 			 INTEL_PLANE_CAP_TILING_MASK;
 
 	switch (tiling_caps) {
-- 
2.34.1

