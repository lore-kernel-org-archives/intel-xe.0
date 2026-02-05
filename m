Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9353E91298
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 08:52:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BAB010E803;
	Thu,  5 Feb 2026 08:52:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ddhGl+I1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52CA610E7FB;
 Thu,  5 Feb 2026 08:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770281533; x=1801817533;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4oHuQFQJASmM3+Ir3QzpVh9945D5FkXapntrNAVXxRE=;
 b=ddhGl+I10DGE5ushY2C+LDCYD+kLzuu1YcSwyS7QjOuKags8L+czbmxW
 YZQrqu9PcxVQANhV8pn4Mco9VsS6qZbVuIZk9DKZYUFffimKj1CqfNsy2
 OhrcuQnDKsIibl1GlxErxqKB5k/2w6HoAF/9bGkA+gbZ8FO97Oz+OXpML
 yQWYio0z/zCEPvKka4nUSNmYTclttIAgdbH++gkL5reQs55Ux9dF7aRvw
 ePiv+zxDbe0xodQM/+Geg7KNdMskXh3IGb87kJWId8ONjDAOwdHRFSKMF
 NGazds9JjhhQP+SwTiyjvDYeKZkKOkYEtaGyCApE2rTDC8FvzFArpyolP w==;
X-CSE-ConnectionGUID: n5mJa7hKRayFzW20XHsbPA==
X-CSE-MsgGUID: 2Aee0ABeSAigANRBDgNrAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71377282"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="71377282"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 00:52:12 -0800
X-CSE-ConnectionGUID: xlFq26SbRZKnzVWmf47eew==
X-CSE-MsgGUID: JWTKo6qfT+O3zBrjSG02hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="233380063"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 00:52:09 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, imre.deak@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 1/2] drm/i915/dp: Make intel_dp_can_join() static
Date: Thu,  5 Feb 2026 14:06:22 +0530
Message-ID: <20260205083623.793902-2-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260205083623.793902-1-ankit.k.nautiyal@intel.com>
References: <20260205083623.793902-1-ankit.k.nautiyal@intel.com>
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

intel_dp_can_join() was previously exposed in intel_dp.h, but after the
recent joiner refactor it is only used internally via
intel_dp_joiner_candidate_valid(). It no longer needs external
visibility, so make it static and drop the prototype from intel_dp.h.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 1 +
 drivers/gpu/drm/i915/display/intel_dp.h | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index e2fd01d1a1e4..4f5b89f80e55 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1396,6 +1396,7 @@ bool intel_dp_has_dsc(const struct intel_connector *connector)
 	return true;
 }
 
+static
 bool intel_dp_can_join(struct intel_display *display,
 		       int num_joined_pipes)
 {
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index ff527b351de0..cbd7fcd3789f 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -222,8 +222,6 @@ int intel_dp_compute_config_late(struct intel_encoder *encoder,
 int intel_dp_sdp_min_guardband(const struct intel_crtc_state *crtc_state,
 			       bool assume_all_enabled);
 int intel_dp_max_hdisplay_per_pipe(struct intel_display *display);
-bool intel_dp_can_join(struct intel_display *display,
-		       int num_joined_pipes);
 bool intel_dp_dotclk_valid(struct intel_display *display,
 			   int target_clock,
 			   int htotal,
-- 
2.45.2

