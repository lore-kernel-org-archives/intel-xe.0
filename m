Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4DFDE83060
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 08:23:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A879110E586;
	Tue,  3 Feb 2026 08:23:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FY4u/y4O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6274A10E569;
 Tue,  3 Feb 2026 08:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770106979; x=1801642979;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DietvwbJGUgfKYE5oigHP37JP6WbYEW3rND+snnLB8w=;
 b=FY4u/y4O3WhJrnveQNtSaKTvDg+wXZLEZDby4y5lqePfI521qdcBi9XW
 QrvjEO1InknMqu0ewFaQRlAkpxhRhU4nhBVw41D6Ts9ja4Qc44H5L6A2o
 YSXYMIQfFWrIWoBBr2J2/mM2tGpYl3iGdwGxEFOPnKQUPjoHHXxbZZmMX
 DCJ7uXfp+FSAvFvlCXf+pTl9Hcs1FL/Sd/LGVB7WpayX26keW++MlL6j+
 qBAE43tr9IsdCr/n92ORX8Ti11kclKrs0hKcaG4A7AnM29ahP7Jnu/Gku
 t0RZ8LYPiguQf7XcdD1KvSCbxfv1woClBin1IHZ1eWWTcvO6yGnHb4BIz A==;
X-CSE-ConnectionGUID: 3RfyN22HS6iZF8T3BfguLA==
X-CSE-MsgGUID: yRyQnuLlTaKRU7AZPYvtmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="82381352"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="82381352"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 00:22:59 -0800
X-CSE-ConnectionGUID: lNHEvY1eRBirwbrqrJrxtg==
X-CSE-MsgGUID: DuPRq2wBR++DUfbJ+XZWYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="209069013"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 00:22:58 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v3 2/4] drm/i915/vrr: Avoid vrr for PCON with HDMI2.1 sink
Date: Tue,  3 Feb 2026 13:37:16 +0530
Message-ID: <20260203080716.559932-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251111093007.3771409-3-ankit.k.nautiyal@intel.com>
References: <20251111093007.3771409-3-ankit.k.nautiyal@intel.com>
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
index 9d814cc2d608..c57328b76f26 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -54,6 +54,16 @@ bool intel_vrr_is_capable(struct intel_connector *connector)
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

