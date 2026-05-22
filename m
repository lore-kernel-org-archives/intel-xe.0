Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3FB6CD5BAC
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 20:03:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A22E010E2A6;
	Fri, 22 May 2026 20:03:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OBFDx3Ha";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAE4910E2A6;
 Fri, 22 May 2026 20:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779480232; x=1811016232;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QSKrhMWJtKQbaAcZR9NMxQqMdyFalUWu//GKIJEOAO0=;
 b=OBFDx3HaHj4LfbErBfOqAWvS4RpfAbcq8cvgkb1Fu37llI/YX4gp6dVR
 ZhxViQ2Tiosp8tez10WxXX3WG+mnHXAJux6d1X2gQNFMjfz4I/pioc71B
 31VHP8h57nvwejWCoas9pom+O6aoL6c7UjyFZD8RyOJy0kmKgbIGWWISb
 N/GIHj2mysPzcBHOdz7yN6NuvRDNZBJ3p2IwO2QXY7jl/6scGzqEvKgkH
 2x+zg5xpi+LRL1j/0HWmoz4PAEpt2UnGpeFPZAGouOIz4E+53ZUYqrDG8
 4reor6wsIZaQnMVi3tYeWy4w5Kxk7GUkXn9x7S0n37RxU/88RTwPBxttc A==;
X-CSE-ConnectionGUID: MgZHH2KSTVCPm8p0SfJ0Kw==
X-CSE-MsgGUID: 6m5NghujR7qB5uy9KBccpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="84299642"
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; d="scan'208";a="84299642"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 13:03:52 -0700
X-CSE-ConnectionGUID: oLRuHZrgTjOY3kmk59okoQ==
X-CSE-MsgGUID: fSGLera/QRKEbMrNbdSqJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; d="scan'208";a="245042144"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.71])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 13:03:50 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 00/10] drm/i915/bw: Bunch of fixes
Date: Fri, 22 May 2026 23:03:36 +0300
Message-ID: <20260522200346.17377-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
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

The QGV code has accumulated tons of rounding
errors and other similar things. Fix them up.

Ville Syrjälä (10):
  drm/i915/bw: Fix num_planes handling on TGL+
  drm/i915/bw: Fix DCLK rounding mess
  drm/i915/bw: Fix bw rounding direction
  drm/i915/bw: Fix 'deinterleave' rounding direction
  drm/i915/bw: Fix rounding direction in clperchgroup calculation
  drm/i915/bw: Fix DEPROGBWPCLIMIT handling on BMG
  drm/i915/bw: Fix/unify peakbw calculations
  drm/i915/bw: Round the PM demand bandwidth down
  drm/i915/bw: Remove deinterleave fallback for TGL+
  drm/i915/bw: Do not consider tile4 as tileY

 drivers/gpu/drm/i915/display/intel_bw.c | 97 ++++++++++++-------------
 1 file changed, 47 insertions(+), 50 deletions(-)

-- 
2.52.0

