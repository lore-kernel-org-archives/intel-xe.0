Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D1A3CD5BD1
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 10:35:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1776C10EFBA;
	Thu, 28 May 2026 10:35:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="epTwgpKh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C72A10EFB6;
 Thu, 28 May 2026 10:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779964504; x=1811500504;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SDkgc6KWVN9nvvrFpnbEarQdMfwyTdYTy+nPp16z+5I=;
 b=epTwgpKhhAYFbqsuyCjStDhxWootLsEN71lgxEMIdcePDXP4f+RJQ2Un
 o/kLkjHUHtrDY4aWbj+GInYtbUXRBn0kTDZy0WAtfWEvTsjP0VEneUAeo
 SMLIiquR9beEl9oDwRb/+BIrea0ROIDMCr8gJlbaYlQfsw0LZncTS7mgE
 cwzcR5w/QYKQjHbmOF8IfmvMpC572LgMRrHiFnahMlk0TQjj8UAt70ClQ
 g1Yev0S/ONpu4o0KYo19lVeXj2EjWMeemjPyGAnJRTSrZ02tBW+oRzomz
 vJOp/BDKR2dZ0G5TuqdV2wDB/PbyFt0DxPXKdBiAiwoPnTNdQjZTOS+Cx A==;
X-CSE-ConnectionGUID: Wq1gyhLwQweaRshnVDCjgw==
X-CSE-MsgGUID: wnyMdmafTIKnzW3wKw0dKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="98221190"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="98221190"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 03:35:03 -0700
X-CSE-ConnectionGUID: 8Lp9xg8IRGKsaPHZ3Bg+Bg==
X-CSE-MsgGUID: TRoFaIfKRYqFsq6SjqroIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="241682259"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.166])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 03:35:02 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 00/11] drm/i915/bw: Cleanups
Date: Thu, 28 May 2026 13:34:47 +0300
Message-ID: <20260528103458.18069-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.53.0
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

Clean up some of the mess in the bw/sagv code.

Ville Syrjälä (11):
  drm/i915/bw: Don't memcpy() pointlessly
  drm/i915/bw: Streamline dg2_get_bw_info()
  drm/i915/bw: Initialize num_planes sensibly for the first plane group
    in TGL+
  drm/i915/bw: Move 'bi_next' to tighter scope
  drn/i915/bw: s/num_points/num_qgv_points/
  drm/i915/bw: Move num_{qgv,psf}_points out from the plane group
  drm/i915/bw: Move psf_bw[] out from the plane group
  drm/i915/bw: Move peakbw[] out from the plane group
  drm/i915/bw: Print derated bandwidth numbers for DG2
  drm/i915/bw: Use icl_qgv_bw()
  drm/i915/bw: Simplify the best max_data_rate search

 drivers/gpu/drm/i915/display/intel_bw.c       | 168 ++++++++----------
 .../gpu/drm/i915/display/intel_display_core.h |  12 +-
 2 files changed, 82 insertions(+), 98 deletions(-)

-- 
2.53.0

