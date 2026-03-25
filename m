Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C6C103A9BD
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 13:58:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0FB510E1EE;
	Wed, 25 Mar 2026 13:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iOVJEi9E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E03010E1EE;
 Wed, 25 Mar 2026 13:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774447135; x=1805983135;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=v2PbOUodmcj9C0Q9g1YpTDSV0g6m2UbZ4dO5KjU/3IY=;
 b=iOVJEi9ETrbw51f/ABp3H23Fk2l8I9y4XoUZv8vBQjYrh2M+Nv/JiXHK
 qeqNc7JdOl/sMJcD+koRjfRxuWc7xH9SjXwbQVqp+dVFUrgrXuTaZrLk1
 uRmfZO2i5d1/wCWBqkJH/EbibW5VV0t3GZk9kmDJPuBNYqEaR4Tfdf3I1
 mjTqGMllm+aL1LDOdUBazAzz4yZa25F77c3NDg9KFVyLdL/f15O0K+qur
 rSAU+87mzPB5umxYzPfzw3yHaqJdtArFaSX02J2c8qZBhzCKQHFpezkWt
 h2BSNYmkOtj0qI2va6x0dnMygb4hNGVCydfsppeiL7CUKL70KTJWdFKRx Q==;
X-CSE-ConnectionGUID: dLDaRYmDR6OPAfWEmcIBPg==
X-CSE-MsgGUID: KdrswgJ6TSKT/gkSn9U5nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75365732"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="75365732"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 06:58:54 -0700
X-CSE-ConnectionGUID: nDAM88UzS5ay4S0vbQeIcA==
X-CSE-MsgGUID: eWh1tZ41SemNPo37vaQR/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="248197416"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.117])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 06:58:52 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/6] drm/i915: Some fixes and cleanups
Date: Wed, 25 Mar 2026 15:58:43 +0200
Message-ID: <20260325135849.12603-1-ville.syrjala@linux.intel.com>
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

Somewhat random pile of things:
- Fix min_voltage_level regression
- Fix enhanced_framing handling on ivb/hsw CPU eDP
- improve the state dump a bit

Ville Syrjälä (6):
  drm/i915/cdclk: Do the full CDCLK dance for min_voltage_level changes
  drm/i915/dp: Use crtc_state->enhanced_framing properly on ivb/hsw CPU
    eDP
  drm/i915: Split the pipe_src dump to its own line
  drm/i915: Include the crtc min_voltage_level in the state dump
  drm/i915: Eliminate out of place "HBlank" CamelCase
  drm/i915: Move the sharness filter dump next to pfit

 drivers/gpu/drm/i915/display/g4x_dp.c         |  2 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c    | 54 +++++++++++++++++++
 .../drm/i915/display/intel_crtc_state_dump.c  | 21 ++++----
 3 files changed, 67 insertions(+), 10 deletions(-)

-- 
2.52.0

