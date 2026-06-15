Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BBECD98CE
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 20:34:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED10A10E6AB;
	Mon, 15 Jun 2026 20:34:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ektcRj8i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A39210E6AD;
 Mon, 15 Jun 2026 20:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781555659; x=1813091659;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Rgh8990NXQhY5lWkk67xGajGYrleD1bIomItQkysPjc=;
 b=ektcRj8id0VdwQvNl8uNbGyURsJAQ3PyM4/m4doIavjk0w/dji/kRenn
 QVrFgizL1miHpw7ehIiADL//gebq5c4+YTX/V3BLf86STpRVhHHaJt//r
 z2KK/tzWyaQ/ATJAD6p5GzrNelgdFPOhEx7PrHkDNhDtw0UTg/6pgnqzQ
 PCg/LiTE09wUege2uconEW8fbr0lvSdjnz5CbQ767fS+sYOmVnWIBiodZ
 JO16cDtuVqR3SJem0ZNg3BdJUfUwfOnDHiS5uN2KQuawNlOzUcEDxixye
 uXgaBRfTXSOchxHWPQXvFZG7vVphTaWRJf//OYJs3jppl5OOlG6RQyDz4 g==;
X-CSE-ConnectionGUID: SFuOHEkcRVe1Krsiv1IQbg==
X-CSE-MsgGUID: K12KlBkxR2qJBr9YGBTmdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="93694576"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="93694576"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 13:34:18 -0700
X-CSE-ConnectionGUID: kYHyRWhkQuKTLpuUym31YQ==
X-CSE-MsgGUID: ZxzBjJ8/TLOuZuiCrPTC8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="252538490"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.245.246])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 13:34:16 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH v3 3/7] drm/i915/display: sagv pre/post plane calls to check
 pmdemand support
Date: Mon, 15 Jun 2026 23:33:51 +0300
Message-ID: <20260615203355.218578-4-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615203355.218578-1-vinod.govindapillai@intel.com>
References: <20260615203355.218578-1-vinod.govindapillai@intel.com>
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
index a4ce21d4c024..ec1bfe46edef 100644
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

