Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 097CFCA5FA1
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 09:45:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B17B510EDF1;
	Tue, 29 Sep 2026 09:45:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W7ywPxCK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09CBE10EDDD;
 Tue, 29 Sep 2026 09:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790675105; x=1822211105;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P1cuXnO4K1GNtuUfH0ej8OHMzUajKE8ugZMPTZPsdcw=;
 b=W7ywPxCKQdFinVT8gl1o1U380SRzZkGaVfYAFgDSXwntQ5cjge91oJ9d
 XrsLW1oWePn+K6gGM4nrh0y58y+c5AGPqTLMxhu8JqdPlC4kK502ZYVSr
 p3g8B3KjHWxwh2ulxeilwCZDTPzsEmKDPeN8Egfm4DeDzdxu5hT9cgMqf
 WzzclDDaH8tbGLH76Vf+lokoaZ0STzaBQsggSWPH/yydQGSn0C8/1zTIs
 lz10foni/1QqMnCt5GReFn0ZBs97LHRzkIR/h3RYU5kUYxZo1/0V0QvI3
 itjuyIPJgnrkWVI/5g60ZGoSfwL1jCjaXBopJq9fIsB1VgMsKfwniWrQE w==;
X-CSE-ConnectionGUID: jgKhtFFZQUiRYtFMVaPRRw==
X-CSE-MsgGUID: 7ONlxYoOSWaAGPyOT7gNTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="91250084"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="91250084"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 02:45:04 -0700
X-CSE-ConnectionGUID: e4ZERtAvTPeq9zBT62EmmQ==
X-CSE-MsgGUID: pnuJW//uRVeDlL9Zbkiakw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="283415121"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.120])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 02:45:02 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 stable@vger.kernel.org
Subject: [PATCH 8/8] drm/i915/psr: Don't clip plane state destination rectangle
Date: Tue, 29 Sep 2026 12:44:34 +0300
Message-ID: <20260929094434.77129-9-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929094434.77129-1-jouni.hogander@intel.com>
References: <20260929094434.77129-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

clip_area_update() uses drm_rect_intersect which modifies passed r1
rectangle. Early transport alignment passes the cursor uapi.dst rectangle
to clip_area_update, so the cursor uapi.dst is unintentionally modified by
drm_rect_intersect.

Fix this by using local copy in clip_area_update(). Also make the damage
and the display area const.

Fixes: 1bff93b8bc27 ("drm/i915/psr: Extend SU area to cover cursor fully if needed")
Cc: <stable@vger.kernel.org> # v6.9+
Assisted-by: GitHub-Copilot:claude-opus-5
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index d8fefb13c2790..99603a486c278 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -2709,23 +2709,25 @@ static u32 psr2_pipe_srcsz_early_tpt_calc(struct intel_crtc_state *crtc_state,
 }
 
 static void clip_area_update(struct drm_rect *overlap_damage_area,
-			     struct drm_rect *damage_area,
-			     struct drm_rect *display_area)
+			     const struct drm_rect *damage_area,
+			     const struct drm_rect *display_area)
 {
-	if (!drm_rect_intersect(damage_area, display_area))
+	struct drm_rect inter = *damage_area;
+
+	if (!drm_rect_intersect(&inter, display_area))
 		return;
 
 	if (overlap_damage_area->y1 == -1) {
-		overlap_damage_area->y1 = damage_area->y1;
-		overlap_damage_area->y2 = damage_area->y2;
+		overlap_damage_area->y1 = inter.y1;
+		overlap_damage_area->y2 = inter.y2;
 		return;
 	}
 
-	if (damage_area->y1 < overlap_damage_area->y1)
-		overlap_damage_area->y1 = damage_area->y1;
+	if (inter.y1 < overlap_damage_area->y1)
+		overlap_damage_area->y1 = inter.y1;
 
-	if (damage_area->y2 > overlap_damage_area->y2)
-		overlap_damage_area->y2 = damage_area->y2;
+	if (inter.y2 > overlap_damage_area->y2)
+		overlap_damage_area->y2 = inter.y2;
 }
 
 static bool intel_psr2_sel_fetch_pipe_alignment(struct intel_crtc_state *crtc_state)
-- 
2.43.0

