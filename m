Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC20CCD4846
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 12:28:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE5E610E72C;
	Mon, 11 May 2026 12:28:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B2Uo2UPb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB05A10E742;
 Mon, 11 May 2026 12:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778502526; x=1810038526;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+C5NP30mwLfwV4+Mv1EK1pwLcxera8QZ2ACz5yZ5ltM=;
 b=B2Uo2UPbI2Gb2Ulje/6alxRQwvEwJJ3ySvp6Stl+tkWFEK26GNvaQwzD
 5X19CT8yXgkEA7bUDzFykBxNIxTyZLko61/BpEIYU6jsybFhuuamyoo/N
 4+eh/rHU7hE5AuERtXDEXNQrQdJpV3zEDgapRJs7pNuGNZAqO38OY/loc
 Z3S4VcFey+ZtWfL8tvfbToCUEMWR1P6WnnxoAk96WOal/zjjeBymhLKfX
 nQriGacrdMXdlecr9wXuYfu2xx9V53odblHqZhbcjxIRHZsho1BFLMThw
 2bVlWRGCPRWecY+SEDdOzeJgzoGcLeSEcIwmVf3athkJpwBZL0RYhGkKD Q==;
X-CSE-ConnectionGUID: jEUDE/gjSgeWRYTuEqYq5Q==
X-CSE-MsgGUID: /M0eF9R5Sv2bnZj8UEv0Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="90762764"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="90762764"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 05:28:42 -0700
X-CSE-ConnectionGUID: fK/yTfiaTrKl6YiTwh4G3w==
X-CSE-MsgGUID: DX4PyLpDTUm3py9q/180FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="267801428"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.245.16])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 05:28:41 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH v2 03/11] drm/i915/display: sagv pre/post plane calls to check
 pmdemand support
Date: Mon, 11 May 2026 15:28:08 +0300
Message-ID: <20260511122816.1235478-4-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260511122816.1235478-1-vinod.govindapillai@intel.com>
References: <20260511122816.1235478-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

For pmdemand cases, no need to even calculate the masks based
on the qgv points index. Though the current logic avoids setting
the registers based on the pmdemand support, some qgv point masks
are compared in vain and do nothing. So leave early if pmdemand
is supported.

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/i915/display/skl_watermark.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/drm/i915/display/skl_watermark.c
index c942ccfe6897..30a2031aa613 100644
--- a/drivers/gpu/drm/i915/display/skl_watermark.c
+++ b/drivers/gpu/drm/i915/display/skl_watermark.c
@@ -275,6 +275,9 @@ void intel_sagv_pre_plane_update(struct intel_atomic_state *state)
 	if (!intel_has_sagv(display))
 		return;
 
+	if (HAS_PMDEMAND(display))
+		return;
+
 	if (DISPLAY_VER(display) >= 11)
 		icl_sagv_pre_plane_update(state);
 	else
@@ -295,6 +298,9 @@ void intel_sagv_post_plane_update(struct intel_atomic_state *state)
 	if (!intel_has_sagv(display))
 		return;
 
+	if (HAS_PMDEMAND(display))
+		return;
+
 	if (DISPLAY_VER(display) >= 11)
 		icl_sagv_post_plane_update(state);
 	else
-- 
2.43.0

