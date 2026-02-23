Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 228FCEA4FC1
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 14:00:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D066910E3DE;
	Mon, 23 Feb 2026 14:00:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K2ZzTIhj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9943D10E3E1;
 Mon, 23 Feb 2026 14:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771855205; x=1803391205;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NA444oKFd6SCqmUXkkli1TzcdIM/CCNMW/U70vL4rIU=;
 b=K2ZzTIhj+CjbVdFJY0W6MWBLcoKhJrgfpcqEalTZnMtT2NWD/tEr8qh9
 +qz+BrvWfmIfeLPm8JNL+JQRwH18osyXcOZ1WyQLBM5HctJoghbCNr653
 4yNDelb+CkHYmznk4oZ7smcPR8SusJtaMtIsBvu+9EbPFKMtI+bXWRL3u
 CzOSaMUMkAWWxuNkcuoInS6qSGSfgN8HnKMau8PZtXg9W+FW7GSmXhvPa
 FrtnFyeklpI16P8vBejLuzVqv1VyrfYqGfMTGE9J5X4Y/69NSm5v0yHtG
 MpL+Pc7OXF8slsMmDpnZbo7M4IqbdW3aVnx+JBrnGt+vVGtLt98+DX3C4 Q==;
X-CSE-ConnectionGUID: uojYOEekRlWqPJH6nbSjMw==
X-CSE-MsgGUID: mL1Ai+rZS3iYvLEg8+/MNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72827034"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="72827034"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:00:05 -0800
X-CSE-ConnectionGUID: IUS0kAI3SY6x9fI4YYQs3A==
X-CSE-MsgGUID: 85NAmobySAam0+VJilu4fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="212961170"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:00:03 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, jouni.hogander@intel.com,
 animesh.manna@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 02/14] drm/i915/vrr: Avoid vrr for PCON with HDMI2.1 sink
Date: Mon, 23 Feb 2026 19:14:19 +0530
Message-ID: <20260223134431.1639308-3-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260223134431.1639308-1-ankit.k.nautiyal@intel.com>
References: <20260223134431.1639308-1-ankit.k.nautiyal@intel.com>
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

Currently we do not support VRR with HDMI so skip vrr compute
config step for all DP branch devices.

v2: Restrict VRR on all DP branch devices instead for checking only for
    HDMI. (Ville)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 00ca76dbdd6c..c1d8b32ef42f 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -55,6 +55,16 @@ bool intel_vrr_is_capable(struct intel_connector *connector)
 		if (connector->mst.dp)
 			return false;
 		intel_dp = intel_attached_dp(connector);
+		/*
+		 * Among non-MST DP branch devices, only an HDMI 2.1 sink connected
+		 * via a PCON could support VRR. However, supporting VRR through a
+		 * PCON requires non-trivial changes that are not implemented yet.
+		 * Until that support exists, avoid VRR on all DP branch devices.
+		 *
+		 * TODO: Add support for VRR for DP->HDMI 2.1 PCON.
+		 */
+		if (drm_dp_is_branch(intel_dp->dpcd))
+			return false;
 
 		if (!drm_dp_sink_can_do_video_without_timing_msa(intel_dp->dpcd))
 			return false;
-- 
2.45.2

