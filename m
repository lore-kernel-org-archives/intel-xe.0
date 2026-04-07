Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87E8FF512E
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 17:52:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A2310E07E;
	Tue,  7 Apr 2026 17:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LzAr8WUI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E87010E06C;
 Tue,  7 Apr 2026 17:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775584369; x=1807120369;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RPWqZDUVvU01ngdLx4ZWReoMEp5/PUB/9l3DOgJcXKk=;
 b=LzAr8WUInmFc7rGTeSJN4fCDhdPaR5z82E/X4ia5L6Q+8BXVIcE6uSq+
 rBBxznSavhbFZocflZ1QIrrbHelpW8k9knbjEXx7NHBstBM0AKaB3Cl3A
 e0mubMLkwhOcenwKN1vmBHRS7BIK6R/r2qVMFsTku12r7hGuXxpLjgBhc
 Ghk7wnkarivJgIM1ftY0Ix8RxSCRH1eMGdqgQixiTLccIht9EilxYxSpr
 4mPCqMd21BLVyPFL3KoX6gvxHkX77jOYjgP2zT38ge7DvnahCT+Cc9+gV
 Pgem3KdT5gWkJk9QChC7KrqIhiKOlhMMWjCsxuPF7WRpdbZ91h5DRfeKq g==;
X-CSE-ConnectionGUID: kygK4U4qQKW3H/a2A13Itw==
X-CSE-MsgGUID: qoDlGo9dRLikAvcsxn6lnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="64101719"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="64101719"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 10:52:49 -0700
X-CSE-ConnectionGUID: zrDu5xRgRA+6uEDc/1AL+w==
X-CSE-MsgGUID: sPvlWJc5Qk+pwfAC83owXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="258661027"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.211])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 10:52:47 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 0/9] drm/i915/casf: Integrate the sharpness filter properly
 into the scaler code
Date: Tue,  7 Apr 2026 20:52:34 +0300
Message-ID: <20260407175244.19654-1-ville.syrjala@linux.intel.com>
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

The sharpness filter isn't anything special. It's just another
mode of the pipe scaler, so treat is as such.

This gets rid of tons of special casing all over the place,
and will allow me to finally land the pending pipe prefill
series: https://patchwork.freedesktop.org/series/156137/

Note that this will fail some kms_sharpness_filter tests,
because those tests are basically incorrect. But I couldn't
decide yet how much of that entire test should be nuked. It
seems to be doing a *lot* of things, most of which have
nothing to do with the sharpness filter...

v2: Rebase due to related changes
    Also reject sharpness + scaling_filter!=DEFAULT

Ville Syrjälä (9):
  drm/i915/casf: s/casf_enable/enable/
  drm/i915/casf: Make a proper hw state copy of the sharpness_strength
  drm/i915/casf: Move the casf state to better place
  drm/i915/casf: Extract scaler_has_casf()
  drm/i915/casf: Handle CASF in skl_scaler_get_filter_select()
  drm/i915/casf: Constify crtc_state
  drm/i915/casf: Remove redundant argument from
    intel_casf_filter_lut_load()
  drm/i915/pfit: Call intel_pfit_compute_config() unconditionally on
    (e)DP/HDMI
  drm/i915/casf: Integrate the sharpness filter properly into the scaler
    code

 drivers/gpu/drm/i915/display/intel_casf.c     | 102 +++++-----------
 drivers/gpu/drm/i915/display/intel_casf.h     |   6 +-
 .../drm/i915/display/intel_crtc_state_dump.c  |  11 +-
 drivers/gpu/drm/i915/display/intel_display.c  |  46 ++------
 .../drm/i915/display/intel_display_debugfs.c  |   5 +-
 .../drm/i915/display/intel_display_types.h    |   5 +-
 drivers/gpu/drm/i915/display/intel_dp.c       |   9 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     |   8 +-
 .../drm/i915/display/intel_modeset_setup.c    |   1 +
 drivers/gpu/drm/i915/display/intel_pfit.c     |  13 ++-
 drivers/gpu/drm/i915/display/skl_scaler.c     | 110 +++++++-----------
 drivers/gpu/drm/i915/display/skl_scaler.h     |   2 -
 12 files changed, 112 insertions(+), 206 deletions(-)

-- 
2.52.0

