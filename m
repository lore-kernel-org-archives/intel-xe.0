Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19BEDC5DF97
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 14:31:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5DBF10E2B4;
	Wed, 26 Aug 2026 14:31:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m41V3EBZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 758D310E29F;
 Wed, 26 Aug 2026 14:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787754664; x=1819290664;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lDKpRJX27XcdIQWtopYUdjsezsQ/7wfrESd5hxGGZTY=;
 b=m41V3EBZHh8R49fxFRVFVCkUEF4xMRQNZAqjUwG8304PJ6GurB5+FOxC
 THN4XiIX33uFtOli2Rcz9jxKCyJkbhB2R6mSkrL/qL4MPDdgp5Kg006g8
 FARWmc6wOjUAS4nFhLpzm0UNWn524ftdNgWVhGg/Egk26lx6BWOfSlrEw
 eVsyhdpLtmMkyOfBu7SW1lvCtDEreaZtW18eP8I+IshayHmm5OI3gJ2vZ
 SKp5ZxRZ9xsb8h4OjkOiNBOzaHkDvg2f5KW3HtI+w0GkbSMaJ0jqC5TrX
 nC9OGSkdFhHeYylGsxr27xUF9ZTPTGsPy60kfgid1VwCojCZGI8WA/wAt w==;
X-CSE-ConnectionGUID: +kgjfOKxTuuFcc4aXP6ADw==
X-CSE-MsgGUID: MG0afRZCQaOwiqhhijXyIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="98830569"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="98830569"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 07:31:04 -0700
X-CSE-ConnectionGUID: uZmnSwptQaSwoKUBrH74+A==
X-CSE-MsgGUID: P5czHyVIQKWGdYgeQO1Xrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="271787180"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.39])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 07:31:03 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/i915/cdclk: Fix dg2_power_well_count() return type
Date: Wed, 26 Aug 2026 17:31:00 +0300
Message-ID: <20260826143100.19401-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

dg2_power_well_count() is supposed to return an integer,
not a boolean. Make it so.

Fixes: 9112ce99c1d7 ("drm/i915/cdclk: Extract dg2_power_well_count()")
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 75ada941d113..279006f7b881 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -2719,8 +2719,8 @@ static void intel_set_cdclk(struct intel_display *display,
 	}
 }
 
-static bool dg2_power_well_count(struct intel_display *display,
-				 const struct intel_cdclk_state *cdclk_state)
+static int dg2_power_well_count(struct intel_display *display,
+				const struct intel_cdclk_state *cdclk_state)
 {
 	return display->platform.dg2 ? hweight8(cdclk_state->active_pipes) : 0;
 }
-- 
2.54.0

