Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 251A1C79FB6
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 16:18:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC09D10F219;
	Wed,  9 Sep 2026 16:18:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HDTmjyAY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D8C10F216;
 Wed,  9 Sep 2026 16:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788970687; x=1820506687;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OIFt7BM3GODwpPOMhri6YsvH3wKjOPcTtAW8hvF6J58=;
 b=HDTmjyAYebZiz0ozH6i/nV+yfySXMWyz51sDkeEtQ6vPVzxucV46jo7t
 iOO8z7UIlJX6tAxXXAsYB6gsH59YjeAAaeC687d1K5zNQePL/+vz+r7ks
 h+L6+L9PchxzVZrF/Y9XoxmKvnnqLItsUgv/4IH68nsEhtYe7kvpoLQtS
 EXH7rpbke9hzZoKPWG4utJFaRoOz0qJP4+YDummwgE1Onfsvi6oDJ2KWU
 dml/ruxQ2HIEJ1fW9XfX+ZBatlGndzNffQlrpFL3WFPwtZGtrYk+2Zm+8
 7qeQqvXvXP+AXAHlvoB4lR1EKKckwPUoPK7Z6Ym8Iw61JuEhRpUk7hOp3 g==;
X-CSE-ConnectionGUID: yDNVRECEQFC42ubs4onyPA==
X-CSE-MsgGUID: ABwWmdusRSuGUBC8AktDcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100064623"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="100064623"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 09:18:07 -0700
X-CSE-ConnectionGUID: 77158BpIQ6yXIcECY2bDSw==
X-CSE-MsgGUID: +pihUAC3SXSG5UX3FOCDrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="275503313"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.137])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 09:18:07 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 08/13] drm/i915: Use intel_dsb_supported() to determine
 'use_dsb'
Date: Wed,  9 Sep 2026 19:17:25 +0300
Message-ID: <20260909161730.12969-9-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260909161730.12969-1-ville.syrjala@linux.intel.com>
References: <20260909161730.12969-1-ville.syrjala@linux.intel.com>
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

Currently we calculate crtc_state->use_dsb by simply assuming
that DSB is available, and then falling back to MMIO when the
actual DSB buffer allocation fails.

This is somewhat confusing, and doesn't match how the flip queue
counterpart (use_flipq) is calculated.  Check whether DSB is
available ahead of time, just like we in the flip queue case.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index fc30a455bed3..7741f1395375 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7392,6 +7392,7 @@ static void intel_atomic_dsb_prepare(struct intel_atomic_state *state,
 		!intel_crtc_needs_color_update(new_crtc_state);
 
 	new_crtc_state->use_dsb =
+		intel_dsb_supported(display) &&
 		!new_crtc_state->use_flipq &&
 		!new_crtc_state->do_async_flip &&
 		(DISPLAY_VER(display) >= 20 || !new_crtc_state->has_psr) &&
-- 
2.54.0

