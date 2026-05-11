Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D492CD37BE
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 05:56:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C6FE10E489;
	Mon, 11 May 2026 05:56:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fUshCLPU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAE4910E486;
 Mon, 11 May 2026 05:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778479007; x=1810015007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U6Wh5Gv0D56MOUy2DzHZyVMtM17X5gG4x9V6InyVG/4=;
 b=fUshCLPUSpQBYOpuQc4TaZJbWdsyeUBhoupnZ2+ypsP/TCJqQtrOf8S5
 xNXSB2bm9irkJhKtKdchXxX9Edkn5O3sTVQMDmVDyPgntqwJNZfweNHxY
 7qWe36RcTCzCQeVGq+6BIrWZ8z4urwSRebxD3oM0lgg6sw3X3GK/VwF3I
 cE6noLGzJOiaWMZeU1W3Oa4Fm8ip+uTYIMczsV/+gmnJXe5u4xmcR5GM4
 jVyyHTwVFDsIpnkDjUtMejKBkjmjzgNUn8apgSlQfZlLK/IiXUmTeM+MX
 T+zZpXSxEN/4n7TtkcAHorr756ZtSj7v+rJU9y6xUTRimIHmYqQIuGPJP g==;
X-CSE-ConnectionGUID: +BSx6kS+Sg6eX1uo/RJoYA==
X-CSE-MsgGUID: fuentGoDSO6+IUhne8u8YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="81922840"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="81922840"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2026 22:56:47 -0700
X-CSE-ConnectionGUID: fxYH/fl7TCeDheqcOccFyg==
X-CSE-MsgGUID: bJC9tEHpQK2+Qb0kQK6sBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="241719944"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orviesa004.jf.intel.com with ESMTP; 10 May 2026 22:56:45 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, uma.shankar@intel.com,
 chaitanya.kumar.borah@intel.com, pranay.samala@intel.com,
 stable@vger.kernel.org, Vidya Srinivas <vidya.srinivas@intel.com>
Subject: [PATCH v3 1/4] drm/i915/display: Copy color pipeline from plane in
 the primary joiner pipe
Date: Mon, 11 May 2026 11:02:10 +0530
Message-Id: <20260511053213.3122314-2-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260511053213.3122314-1-chaitanya.kumar.borah@intel.com>
References: <20260511053213.3122314-1-chaitanya.kumar.borah@intel.com>
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

When copying plane color state in a joiner configuration, use the plane in
the primary joiner pipe since it carries the pipeline number selected by
the user-space.

This assumes that all pipes in the joiner are symmetric in their plane
color capabilities.

Cc: stable@vger.kernel.org # v6.19+
Fixes: a78f1b6baf4d ("drm/i915/color: Add framework to program CSC")
Tested-by: Vidya Srinivas <vidya.srinivas@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/intel_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_plane.c b/drivers/gpu/drm/i915/display/intel_plane.c
index c181a7d063ec..e403fe4a8a20 100644
--- a/drivers/gpu/drm/i915/display/intel_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_plane.c
@@ -396,7 +396,7 @@ intel_plane_color_copy_uapi_to_hw_state(struct intel_plane_state *plane_state,
 	bool changed = false;
 	int i = 0;
 
-	iter_colorop = plane_state->uapi.color_pipeline;
+	iter_colorop = from_plane_state->uapi.color_pipeline;
 
 	while (iter_colorop) {
 		for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
-- 
2.25.1

