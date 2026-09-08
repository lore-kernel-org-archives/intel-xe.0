Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66DC1C79FAB
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 06:39:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA5C810E7DD;
	Tue,  8 Sep 2026 06:39:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZAJF5sHe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E0C710E086;
 Tue,  8 Sep 2026 06:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788849550; x=1820385550;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vIkKzAIIU/Vlj6E/bHYWwD87/VtuOi63b32xyNXNAJE=;
 b=ZAJF5sHePSZlmLqlEg7qqJr5TTdIOtDXUmq5nqmKkFiBsSkPzTGieiqM
 KIs3cZVH6ERyqOHH1J4kkJ1N78GcBxadN+jI2KOd2qupdFV1Zb6yyz5+F
 tEiEdhjNB/8xZta2IuHqOenOSLK3oLGesUa9AbiSo8U2Pgp+R2L40ui9z
 tBqEti3jTlP1IxI3iq99XbrHD+7QO1TcYnUbMLeAkPMlRICa9/PPbhmyA
 zyi4NAVo2IAw6mWJPfgcZ6o8VlwNwN35kJNlaA/OkN/UwWvaDTVhzTaGU
 NOAdE0nJ0hBN6OTfq4oEvQCltpW80BmGrIwDkFJZ+yU/3HD/gWjilIoM+ g==;
X-CSE-ConnectionGUID: 3ViwJ5u7REaZ9W1lxXY26g==
X-CSE-MsgGUID: SmvH0cQmShWO+eYlWIx4/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="93061783"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="93061783"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 23:39:04 -0700
X-CSE-ConnectionGUID: yJGJQ8p7RZa/n4Pwf9uKoQ==
X-CSE-MsgGUID: ZaJwO+riRwq8jsubWEX95A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="264702429"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 23:39:02 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, arun.r.murthy@intel.com,
 jani.nikula@linux.intel.com, suraj.kandpal@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v5 03/12] drm/i915/intel_dip: Add check for DP encoder
Date: Tue,  8 Sep 2026 11:52:14 +0530
Message-ID: <20260908062224.2897987-4-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260908062224.2897987-1-ankit.k.nautiyal@intel.com>
References: <20260908062224.2897987-1-ankit.k.nautiyal@intel.com>
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

At the moment, the common register for programming Transmission line for
Extended Metadata Packet and Adaptive-Sync Secondary Data Packet
(EMP_AS_SDP_TL) is only used to program Adaptive-Sync SDP (AS SDP).

Since VRR and Video Timing Extended Metadat Packet (VTEMP) are not yet
implemented for HDMI, add an explicit check to write the register only
for DP encoders (that may use AS SDP) and reset the register for non-DP
encoders.

In subsequent changes, instead of directly writing the value,
appropriate helpers will be called, that will supply the transmission line
for these packets.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dip.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dip.c b/drivers/gpu/drm/i915/display/intel_dip.c
index 2e2bdb2b199c..b28352a9e23f 100644
--- a/drivers/gpu/drm/i915/display/intel_dip.c
+++ b/drivers/gpu/drm/i915/display/intel_dip.c
@@ -26,14 +26,19 @@ void intel_dip_write_emp_as_sdp_tl(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
+	u32 transmission_line = 0;
 
 	if (!HAS_EMP_AS_SDP_TL(display))
 		return;
 	/*
-	 * Since currently we support VRR only for DP/eDP, so this is programmed
-	 * only for Adaptive Sync SDP to Vsync start.
+	 * Since we currently support VRR only for DP/eDP, program the register
+	 * for Adaptive Sync SDP using vsync start. For non-DP encoders,
+	 * the register is reset to 0.
 	 */
+	if (intel_crtc_has_dp_encoder(crtc_state))
+		transmission_line = crtc_state->vrr.vsync_start;
+
 	intel_de_write(display,
 		       EMP_AS_SDP_TL(display, cpu_transcoder),
-		       EMP_AS_SDP_DB_TL(crtc_state->vrr.vsync_start));
+		       EMP_AS_SDP_DB_TL(transmission_line));
 }
-- 
2.50.1

