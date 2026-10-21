Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D0D60A263A
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 07:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JIonALKy
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A1F10F9C0;
	Wed, 21 Oct 2026 07:08:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF3E210F9B7;
 Wed, 21 Oct 2026 07:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792566506; x=1824102506;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Nlp5tERVYpzrky90NGvR+RkCFdEVhOOnOP7OK+DYZ80=;
 b=JIonALKyr9LgBXPDQDC7/ZK4KJEXsf1U/gEX6jf0ItmVo2TTbqGpobxR
 YkYAvNVYqWYV2J7Vww1i+BDYZpVs19hv2DEN4reTePstiomxtzDPo4tTB
 CC0zLi5y0gM7aZSUMzZ0vzrnbH8obz1imz5zXgiyUWtGT4ux8BWBRKsN+
 3wKLi2DnLEOk4oyJFzu8wDsSe8qC2uv/YYdpa32KvRpvCLw165L92tc2b
 hXlCq4LpCkvTgy/M90P+Vkyd9rRsJgLHNb3uZNZfDXL0whrRkv8LEt8af
 PdVhw/hrXNPujfoFXUkGcRqzyAOGsvXOIvIO8dmKcJ1C/OihsFmyVJ+qs w==;
X-CSE-ConnectionGUID: fiJVTJJfRICvtix3z4V7Qg==
X-CSE-MsgGUID: iU1ETXGTRhy+8APABa5rGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1171400"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1171400"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 00:08:26 -0700
X-CSE-ConnectionGUID: oPP6GsmnRliCzf41+wck4g==
X-CSE-MsgGUID: 3Wb1CCRsR4OzV3dxcEzcHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="4850628"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa011.fm.intel.com with ESMTP; 21 Oct 2026 00:08:24 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v5 04/11] drm/i915/dp_mst: Limit M/N ratio for MST
Date: Wed, 21 Oct 2026 12:38:08 +0530
Message-Id: <20261021070815.1159785-5-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261021070815.1159785-1-suraj.kandpal@intel.com>
References: <20260917050649.871960-1-suraj.kandpal@intel.com>
 <20261021070815.1159785-1-suraj.kandpal@intel.com>
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
intel_dp_compute_config_limits() too, so the link config filter set up
there already excludes the configurations violating the ratio limit, and
MST fails there if none is left.

What is still missing is pruning such modes, so add the check to
mst_connector_mode_valid_ctx(), reusing the helper the SST mode_valid
uses. It walks the link configurations and only rejects the mode if none
of them can satisfy the ratio, rather than evaluating it at a single
link rate.

v2:
-Drop the checks in the MST link config helpers, redundant now that the
constraint is applied while computing the link config limits. (Imre)
-Share the mode_valid helper with SST instead of evaluating the ratio at
one link rate, since the link symbol clock is not monotonic in the link
rate and there is no single best case configuration.
v3:
-Now that intel_dp_mode_valid_m_n checks for all configs just call
that (Sashiko)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Co-developed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 7023619aaaba..f00edfb66a10 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -1565,6 +1565,11 @@ mst_connector_mode_valid_ctx(struct drm_connector *_connector,
 					   min_link_bpp_x16,
 					   bw_overhead_flags);
 
+	if (!intel_dp_mode_valid_m_n(intel_dp, mode->clock)) {
+		*status = MODE_CLOCK_HIGH;
+		return 0;
+	}
+
 	/*
 	 * TODO:
 	 * - Also check if compression would allow for the mode
-- 
2.34.1

