Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BEF2FF510D
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 15:51:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6154610E472;
	Tue,  7 Apr 2026 15:51:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SzzWEnMO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B0A510E472;
 Tue,  7 Apr 2026 15:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775577068; x=1807113068;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=30OCcPdh4t0HZWkboXYCQCLhX8mJqQD97iTCkReLg6Q=;
 b=SzzWEnMOJa8ZZw8r4pStrS2E3pGeSontDGbYRtvrG8jrslP6L52kK3go
 lw1kjNMaiHcoXg46Ls2gI4lfe5AIagf3qfyGVZz3CF6VFZbhxX4AVXv8r
 jLiIXScJ4cnW27H1GHnqOEd35l0sLIFYn415LgLMoLtSwXAI1K8rPOmr4
 BH97JlSl8PrJuPpoAS63TjsyE1yydVqoaiyKk1R8nHYKKbimjAlBwao3d
 b5ztdVoDFC4ZYgXNPeLvObu8rwgT8EMCr71oDtYm9gl1CgpFtTA4SL1of
 IYcw+1cJCq+jcZ5opgfkekaXbOUaefJX9v9hpJIl5hCIYnCTMiSl0tHvH g==;
X-CSE-ConnectionGUID: 5Cwjuv8/R9mIlHSbk2qzUg==
X-CSE-MsgGUID: ioP9EDXGQ/6ySd6+USExAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="101999100"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="101999100"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 08:51:08 -0700
X-CSE-ConnectionGUID: DO0IX4mXS4OSsboQHrQgzA==
X-CSE-MsgGUID: 3wUn3R+2SvSKCWe2McnKtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="221633742"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.211])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 08:51:07 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 03/12] drm/i915/fb: Reject per-plane remapping with DPT
Date: Tue,  7 Apr 2026 18:50:44 +0300
Message-ID: <20260407155053.32156-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260407155053.32156-1-ville.syrjala@linux.intel.com>
References: <20260407155053.32156-1-ville.syrjala@linux.intel.com>
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

We currently create a single DPT for the entire FB, so we can't
actually do the per-plane remap. Reject it for now.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_fb.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 4b0afea1c456..52a619088e8e 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -1252,6 +1252,10 @@ static bool intel_plane_can_remap(const struct intel_plane_state *plane_state)
 	if (intel_fb_is_ccs_modifier(fb->modifier))
 		return false;
 
+	/* TODO implement remapping with DPT */
+	if (intel_fb_uses_dpt(fb))
+		return false;
+
 	/* Linear needs a page aligned stride for remapping */
 	if (fb->modifier == DRM_FORMAT_MOD_LINEAR) {
 		unsigned int alignment = intel_tile_size(display) - 1;
-- 
2.52.0

