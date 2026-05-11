Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B3CACD37B7
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 05:19:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE3EE10E489;
	Mon, 11 May 2026 05:19:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ATbHD5yh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7070010E481;
 Mon, 11 May 2026 05:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778476757; x=1810012757;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PdtgCU8L5RM97eprdKwvHOi8MJpfK8m7Ubpnf2qk3qA=;
 b=ATbHD5yh/Ix61ZcI3RCSjtw4j90oUYyX4Hre08S6R7InY5aS7YvTaz4B
 VqFZW5pvxAzVJvdQPGHWS+uo9kQ5aIUULNjNwciAt2ZjFjYQJUkMO8P2f
 ZfHlZMtmUUzPN7KF3oLAAcS71Rp0VniRcBmQr/rGemTBWBEl2YYE6/KTZ
 6jO/7f3HGddsfmebHxKSCy6tQ886lGeku6VvhvP0SKT9dmE5IzmECdDlH
 Ww4oeah0q5saS8UL8M1Y7YO2LSupvpJumiFx021b0p6sKj+kDo8yqcmkq
 DjRfRheunoHG+Mkc7d8toruMIXASFqVK6Ik7yJ/hDlXD0zyDHPhGvm3PG A==;
X-CSE-ConnectionGUID: NJAWCH6aQ/G9yCaYP20KxQ==
X-CSE-MsgGUID: SrOlWYt2SMy02neE8xUmxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="81921103"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="81921103"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2026 22:19:17 -0700
X-CSE-ConnectionGUID: hgZci6CxQUip71AljFnFPA==
X-CSE-MsgGUID: +my3kOHlRv6gLSqay52Wbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="261086251"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2026 22:19:16 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: imre.deak@intel.com, jani.nikula@intel.com,
 Kunal Joshi <kunal1.joshi@intel.com>
Subject: [RFC 4/7] drm/i915/dp_tunnel: Wire up DP tunnel debugfs from DRM core
Date: Mon, 11 May 2026 11:10:25 +0530
Message-Id: <20260511054028.1310995-5-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260511054028.1310995-1-kunal1.joshi@intel.com>
References: <20260511054028.1310995-1-kunal1.joshi@intel.com>
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

The DRM-core tunnel debugfs helpers need a driver-side call site.
Wire them into detect_new_tunnel() so the dp_tunnel/ subdir is
created once the tunnel's BWA state has settled, giving IGT and
developers access to the tunnel info/knobs through debugfs.

The helper is invoked on all three retained-tunnel branches in
detect_new_tunnel() (BWA unsupported, BWA enable failure, and
successful state update). Error paths that destroy the tunnel
do not register debugfs.

Cc: Imre Deak <imre.deak@intel.com>
Assisted-by: Copilot:claude-sonnet-4-6
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 .../gpu/drm/i915/display/intel_dp_tunnel.c    | 23 ++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_tunnel.c b/drivers/gpu/drm/i915/display/intel_dp_tunnel.c
index 11712a151f729..cc36d5651f6a9 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_tunnel.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_tunnel.c
@@ -16,6 +16,17 @@
 #include "intel_dp_tunnel.h"
 #include "intel_link_bw.h"
 
+static void intel_dp_tunnel_debugfs_add(struct intel_dp *intel_dp)
+{
+	struct intel_connector *connector = intel_dp->attached_connector;
+
+	if (!connector || !intel_dp->tunnel)
+		return;
+
+	drm_dp_tunnel_debugfs_add(intel_dp->tunnel,
+				  connector->base.debugfs_entry);
+}
+
 struct intel_dp_tunnel_inherited_state {
 	struct drm_dp_tunnel_ref ref[I915_MAX_PIPES];
 };
@@ -214,8 +225,10 @@ static int detect_new_tunnel(struct intel_dp *intel_dp, struct drm_modeset_acqui
 
 	ret = drm_dp_tunnel_enable_bw_alloc(intel_dp->tunnel);
 	if (ret) {
-		if (ret == -EOPNOTSUPP)
+		if (ret == -EOPNOTSUPP) {
+			intel_dp_tunnel_debugfs_add(intel_dp);
 			return 0;
+		}
 
 		drm_dbg_kms(display->drm,
 			    "[DPTUN %s][ENCODER:%d:%s] Failed to enable BW allocation mode (ret %pe)\n",
@@ -224,6 +237,7 @@ static int detect_new_tunnel(struct intel_dp *intel_dp, struct drm_modeset_acqui
 			    ERR_PTR(ret));
 
 		/* Keep the tunnel with BWA disabled */
+		intel_dp_tunnel_debugfs_add(intel_dp);
 		return 0;
 	}
 
@@ -238,6 +252,13 @@ static int detect_new_tunnel(struct intel_dp *intel_dp, struct drm_modeset_acqui
 	if (ret)
 		return ret;
 
+	/*
+	 * Register debugfs only after BWA negotiation has fully
+	 * settled so the first read of 'info' shows steady-state
+	 * values rather than transient ones.
+	 */
+	intel_dp_tunnel_debugfs_add(intel_dp);
+
 	return has_tunnel_bw_changed(intel_dp, old_bw) ? 1 : 0;
 }
 
-- 
2.25.1

