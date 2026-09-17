Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC5BC982D0
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 05:07:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1259A10E56B;
	Thu, 17 Sep 2026 05:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aGz90cBr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADD5310E52B;
 Thu, 17 Sep 2026 05:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789621661; x=1821157661;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IJIMEUDqzxgU9/D5GSIE1v5S71AVR/VrMCkjoIzmJ6g=;
 b=aGz90cBrWbZwFzM0aVcVeBQpNOPCNPq+cDhqKbAtEV5/Ibn98O4aLuSm
 x92lO77FTcBZp1P2+wiqinuMS8DgZeH+E092YNU5lBHp5VeZnZUR32JXA
 SCVcjJtQogI8eTrZdcj+NiKA9HkvvlOQzhtohjrp4lUFwkeItg+Yzxu89
 KOphwGOqv9stp9QUrgn2Nm201zhAJa6oif3q7PufT4pbBQmrQeHfQrM2e
 IbLfQED7zL0ukMW9X6Y8BNYNATYIFgqvOdyAg9NMqq+X16tMXcgw91QnJ
 uAKx4lFdYmQ6rEehXj9ue7gacoyv1bkg0axH361dved/+bTRzJ5hHm6H0 w==;
X-CSE-ConnectionGUID: PGUg8H3/SueVMa4GJecXTQ==
X-CSE-MsgGUID: 6tVSwZrzRNeY8WzKJTG/wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77569676"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="77569676"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 22:07:40 -0700
X-CSE-ConnectionGUID: qhmskLIISNWCmSvNtk3yLQ==
X-CSE-MsgGUID: nB55R2o7REmMthzxeQet+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="278798991"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa005.fm.intel.com with ESMTP; 16 Sep 2026 22:07:39 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v4 03/10] drm/i915/dp_mst: Limit M/N ratio for MST
Date: Thu, 17 Sep 2026 10:36:42 +0530
Message-Id: <20260917050649.871960-4-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260917050649.871960-1-suraj.kandpal@intel.com>
References: <20260917050649.871960-1-suraj.kandpal@intel.com>
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
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 0c362784afe4..823fe99ca0a1 100644
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

