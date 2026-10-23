Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F326606A31D
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 05:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mOnJJ/Gd
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D40112989;
	Fri, 23 Oct 2026 05:02:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD9010E4D8;
 Fri, 23 Oct 2026 05:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792731759; x=1824267759;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y8UH2tdruye1F7RYPpQTJqbiphU5z0MC5Wt9sQ7uj/g=;
 b=mOnJJ/GdiBBcHNOMCTo2e236XXrlLDWxcAi8BsAbUgVCgFKpsr27qcnd
 UTx+3fIQe1Veq+Dsp7PCDIl5h6RZakv/f0Y1IlGP+tiOqjTl35gKfK4ER
 YA94Iyt89FL8MNJcFMnULi4qXrzoFEaBKy4n0E0ug6+YAhEKy5szU2z9M
 uHUnlibFQB+U6CG7tlTkdqKZc8yrJGtfmBszMcz5g9Cqu9kknRfw5AJAL
 6Cngl99X8qCD+sI7BOM8pYcmjd+Qw1VF3tNj2li4O4HHqTCz/E5pYoAG0
 1a0w+aTismFBka5bG7Q06NKZBJIMlY5CtfQ54dcT/jgXRKVRxBlXQs015 g==;
X-CSE-ConnectionGUID: +FaRMHvuQ7e6TkbGF+kgDA==
X-CSE-MsgGUID: AbX6nUU5RaKx/En+6y1z0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1499156"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1499156"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 22:02:39 -0700
X-CSE-ConnectionGUID: 5dPPgjufR1yHn4sGLING1Q==
X-CSE-MsgGUID: zXjKR0HSQSKY1A6uT0VWxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3926592"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa006.fm.intel.com with ESMTP; 22 Oct 2026 22:02:37 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v8 04/14] drm/i915/dp_mst: Limit M/N ratio for MST
Date: Fri, 23 Oct 2026 10:32:17 +0530
Message-Id: <20261023050227.2068466-5-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023050227.2068466-1-suraj.kandpal@intel.com>
References: <20261023050227.2068466-1-suraj.kandpal@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

The hardware does not support DisplayPort configurations where the
ceiling of the Link M/Link N ratio exceeds the limit. Enforce this
constraint for MST as well.

The compute config path needs no change: MST goes through
intel_dp_compute_config_limits() too, which pins the link configuration
to the maximum BW one before the ratio filtering, so a stream whose
ratio does not fit that configuration is rejected there.

What is still missing is pruning such modes, so add the check to
mst_connector_mode_valid_ctx(). MST always runs the link at the maximum
BW configuration, which mode_valid already uses for the BW check, so
check the ratio against that configuration as well. Accepting the mode
if any configuration could satisfy the ratio would let through modes
MST then fails to compute: on UHBR links the maximum BW configuration
has a lower link symbol clock than HBR3 or HBR2.

v2:
-Drop the checks in the MST link config helpers, redundant now that the
constraint is applied while computing the link config limits. (Imre)
-Share the mode_valid helper with SST instead of evaluating the ratio at
one link rate, since the link symbol clock is not monotonic in the link
rate and there is no single best case configuration.
v3:
-Now that intel_dp_mode_valid_m_n checks for all configs just call
that (Sashiko)
v4:
-Go back to checking the ratio against the maximum BW configuration,
which is the only one MST uses. Walking all the link configurations
accepted modes that MST then fails to compute. (Mitul)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Co-developed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c     | 5 ++---
 drivers/gpu/drm/i915/display/intel_dp.h     | 3 +++
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 5 +++++
 3 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 3703135f41e2..1e06107627bc 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1286,9 +1286,8 @@ static int intel_dp_link_m_n_ratio(u32 link_m, u32 link_n)
 	return DIV_ROUND_UP(link_m, link_n);
 }
 
-static bool
-intel_dp_can_support_m_n(struct intel_display *display,
-			 int pixel_clock, int link_rate)
+bool intel_dp_can_support_m_n(struct intel_display *display,
+			      int pixel_clock, int link_rate)
 {
 	int max_m_n_ratio = intel_dp_get_max_m_n_ratio(display);
 	u32 link_m, link_n;
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 04fae203bb69..de90296acce9 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -239,6 +239,9 @@ bool intel_dp_joiner_candidate_valid(struct intel_connector *connector,
 
 u8 intel_dp_as_sdp_transmission_time(void);
 
+bool intel_dp_can_support_m_n(struct intel_display *display,
+			      int pixel_clock, int link_rate);
+
 int intel_dp_link_init(struct intel_dp *intel_dp);
 void intel_dp_link_cleanup(struct intel_dp *intel_dp);
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 7023619aaaba..ae18817b4f35 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -1565,6 +1565,11 @@ mst_connector_mode_valid_ctx(struct drm_connector *_connector,
 					   min_link_bpp_x16,
 					   bw_overhead_flags);
 
+	if (!intel_dp_can_support_m_n(display, mode->clock, max_link_clock)) {
+		*status = MODE_CLOCK_HIGH;
+		return 0;
+	}
+
 	/*
 	 * TODO:
 	 * - Also check if compression would allow for the mode
-- 
2.34.1

