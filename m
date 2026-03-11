Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E65106286B
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 11:52:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F307610E8CE;
	Wed, 11 Mar 2026 11:52:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AxCyo8vd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2338910E8CE;
 Wed, 11 Mar 2026 11:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773229941; x=1804765941;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fM9P6gHKXmUk7Qqjf3Tq8Y/ZQhQKAiZn+qzTdWLKYyo=;
 b=AxCyo8vdNBQHN0Dm4VaMHQzAz1/3cLLXkBxTmhMtSbGgtEbKYOxSHy26
 6Bo7ChLOKhJGKpURor/69PP7e9p0kvf7veQJJKuUCDLHpB+0ji/0522/Y
 Tdy6H1yaTP6bwrwYAlolAQv5iatOuykBvU2NIeYDXYc7xtDh6fiA0GtFz
 CTaq3bCrJ4zIsBLBCliEsc6H+2lHhmkIprcwXACNbFXAoU5dpAmktONLR
 NxAeeyDSTHBhtF8n6f22nCfrpuspOdefi1zC1ES3duCDZasN13ABySQXD
 vD9+FDvRS4WOF/AM3mCJ9aU5BQEhELPUeWkjxsUfYwwdBmo6xYhn57CxG g==;
X-CSE-ConnectionGUID: xmQJsTO9R6aRkcijnkE35w==
X-CSE-MsgGUID: mbl5vLceRLqTdQx2Z7ogdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74205010"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="74205010"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 04:52:21 -0700
X-CSE-ConnectionGUID: lu+xniWrSEC6RCYoVOPi6A==
X-CSE-MsgGUID: WQTw7xSQRva80lbiEoXXcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="224602457"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 04:52:18 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, jouni.hogander@intel.com,
 animesh.manna@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 19/19] drm/i915/dp: Always enable AS SDP if supported by
 source + sink
Date: Wed, 11 Mar 2026 17:06:11 +0530
Message-ID: <20260311113611.3393194-20-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260311113611.3393194-1-ankit.k.nautiyal@intel.com>
References: <20260311113611.3393194-1-ankit.k.nautiyal@intel.com>
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

To avoid this, always send AS SDP whenever the source and sink both
support it.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 6b45894e40e0..a9ee3d307b3b 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3136,7 +3136,7 @@ static bool intel_dp_can_use_as_sdp(struct intel_dp *intel_dp,
 	if (drm_dp_is_branch(intel_dp->dpcd))
 		return false;
 
-	return crtc_state->vrr.enable;
+	return true;
 }
 
 static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
-- 
2.45.2

