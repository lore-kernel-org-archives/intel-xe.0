Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD8CCCF2D6
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 11:34:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7709F10EC47;
	Mon, 19 Oct 2026 11:34:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EBCE10EC37;
 Mon, 19 Oct 2026 11:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792409649; x=1823945649;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ihfiDfoieI6RGkGQq9OLZlprHMM8mG9TsCU0BGiOO2g=;
 b=gImAsGa6HZLMEAt2z6b5lvFyNxoSo/Lr1FMO29gI2zVxlaKBn6rd4ML7
 fUipkUcCDSuKQhDnYf+2bHYeNeLuLXiidNB3b3x3I9cGPKxIpPaZYMxbh
 EqC4fUyhukySQU8rLl6NN08mavFcjwILnR8G7vY1DV7RKubQ3Ki06xb1O
 RFG7I7a7DnMlrEhVux2pYOy++i+RbCykny4ib9Cum3Dz5NE99gxl2aL4u
 j5bi9IfOPszWcCxLHKBeyOdRninBBq4QWC5+ksZDC2h+u0CALpphrKRc5
 SFSL/SvOSdF3xWuoAcLDuzko+Stq+/kvQJ/ZJ/oIYTgJD2kPhwfN7PhdK A==;
X-CSE-ConnectionGUID: z1TL/5j7RSyLQMYfbaDa6g==
X-CSE-MsgGUID: zvk6SiZlQ/uYuRyGDHisCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1109789"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1109789"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 04:34:09 -0700
X-CSE-ConnectionGUID: 6gtdcHEYQTag4WgzELjoUg==
X-CSE-MsgGUID: oIrclKQpRk+D+1Xr14KPGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2930791"
Received: from xiaolu.sh.intel.com ([10.239.146.103])
 by orviesa010.jf.intel.com with ESMTP; 19 Oct 2026 04:34:07 -0700
From: Xiao Lu <xiaolu.xie@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, ville.syrjala@linux.intel.com,
 imre.deak@intel.com, jouni.hogander@intel.com,
 Xiao Lu <xiaolu.xie@intel.com>, stable@vger.kernel.org
Subject: [PATCH] drm/i915/dp: Fail the DSC slice config if the minimum slice
 count is 0
Date: Mon, 19 Oct 2026 19:31:51 +0800
Message-ID: <20261019113151.2258239-1-xiaolu.xie@intel.com>
X-Mailer: git-send-email 2.43.0
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

intel_dp_dsc_min_slice_count() returns 0 if DSC can't be used for the
given mode: if the mode's pixel clock or hdisplay exceeds the maximum
overall throughput or line width reported by a DSC branch device, or if
the sink's maximum slice width is invalid.

Before commit 15f908bce5d9 ("drm/i915/dp: Factor out
intel_dp_dsc_min_slice_count()"), these checks returned 0 from
intel_dp_dsc_get_slice_count(), which its callers treat as DSC not being
possible. After the refactor, intel_dp_dsc_get_slice_config() uses the
returned value as a lower bound and since 0 is less than any slice
count, it selects the smallest slice config supported by the source and
the sink instead of failing.

This was seen with a Synaptics SST branch device (OUI 90-cc-24, dev-ID
SYNAR) in a USB4 dock, which reports the same 340 MP/s per-slice DSC
throughput as the monitor behind it. For 3840x2160@240Hz (2315950 kHz
pixel clock) the minimum slice count computation bailed out due to the
branch device's overall throughput limit, so the mode was not pruned and
was enabled with 4 slices on two joined pipes, ie. ~579 MP/s per slice,
resulting in a garbled image. With the monitor connected directly, the
same mode is enabled with 8 slices.

Fail the slice config computation if the minimum slice count is 0, so
that such modes are rejected as before the above refactor.

Fixes: 15f908bce5d9 ("drm/i915/dp: Factor out intel_dp_dsc_min_slice_count()")
Cc: Imre Deak <imre.deak@intel.com>
Cc: <stable@vger.kernel.org> # v7.1+
Signed-off-by: Xiao Lu <xiaolu.xie@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index d8c0d9381..404839a2a 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -910,6 +910,10 @@ intel_dp_dsc_get_slice_config(const struct intel_connector *connector,
 		drm_dp_dsc_sink_slice_count_mask(connector->dp.dsc_dpcd, is_edp);
 	int slices_per_pipe;
 
+	/* A 0 minimum slice count means DSC isn't supported for the mode. */
+	if (!min_slice_count)
+		return false;
+
 	/*
 	 * Find the closest match to the valid slice count values
 	 *
-- 
2.43.0

