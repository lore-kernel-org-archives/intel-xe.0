Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33455CD4F51
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 05:27:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE33910E67F;
	Mon, 18 May 2026 05:27:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OaK1cIK0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48F6D10E66C;
 Mon, 18 May 2026 05:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779082027; x=1810618027;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RtZFT7ABsmZlK3dCW48QayfmGAPQ/tOPtnvOBFt7spY=;
 b=OaK1cIK0syOlzqMDzya7smqc0NSP9SRhr0qVDH2HIoaI0E7D7b2Pbqcp
 orPxqA0mMLOaPhb/tDXKkkbpzMli5y5/nDf46fPjBXKxUjV5HsyAgUvRi
 Yp2v14zCdoxaHDZ7iCospSa/pTLbUE9NUVZVok7MpU5N6DuZ50eWqPf43
 ged/hnOFOQtuClg6CN19sS3ijBTMqYJU0oV1WeTeMSXgorWXvxwN2N6/c
 QqU9nwuZWWupETHNGDxBKVPv/t9tQEiC/Gv1oiuGYymN83r8nfYVm0MMc
 yhqSZR14RZ1XI1nHxElJjhSvU60faImMGHgcH+QFb04ZyN7KDUXNjDbTV w==;
X-CSE-ConnectionGUID: bxGRyXERQraTmOW9qY1jLA==
X-CSE-MsgGUID: IIZnJWDgRYSsWnpZ6j5InA==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="79064956"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="79064956"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 22:27:07 -0700
X-CSE-ConnectionGUID: NaR7yCg+SK2fd0tbXY4MGA==
X-CSE-MsgGUID: J2WeRXqjRxyTL7MdNBuZXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="243606230"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 22:27:05 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, jouni.hogander@intel.com,
 animesh.manna@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 11/12] drm/i915/dp: Always enable AS SDP if supported by
 source + sink
Date: Mon, 18 May 2026 10:42:14 +0530
Message-ID: <20260518051216.2936634-12-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260518051216.2936634-1-ankit.k.nautiyal@intel.com>
References: <20260518051216.2936634-1-ankit.k.nautiyal@intel.com>
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

Currently AS SDP is only configured when VRR is enabled. However, other
use cases like CMRR, Panel Replay, etc. also send information to the sink
via AS SDPs.

With optimized guardband, we also need to account for wakeup time and other
relevant details that depend on the AS SDP position whenever AS SDP is
enabled. If a feature enabling AS SDP gets turned on later (after modeset),
the guardband might not be sufficient and may need to increase, triggering
a full modeset.

To avoid this, always send AS SDP whenever:
 - the source and sink both support it, AND,
 - there is a possibility to use it for VRR and Panel Replay for
   synchronization.

v2: Check if AS SDP can be used for synchronization for VRR or PR. (Ville)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 69eb474fede7..2c1dbcb0a2ca 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3181,7 +3181,11 @@ static bool intel_dp_needs_as_sdp(struct intel_dp *intel_dp,
 	if (drm_dp_is_branch(intel_dp->dpcd))
 		return false;
 
-	return crtc_state->vrr.enable;
+	if (intel_alpm_is_alpm_aux_less(intel_dp, crtc_state) &&
+	    !intel_psr_pr_async_video_timing_supported(intel_dp))
+		return true;
+
+	return intel_vrr_possible(crtc_state);
 }
 
 static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
-- 
2.45.2

