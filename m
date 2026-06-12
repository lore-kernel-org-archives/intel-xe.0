Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A095CD8CA8
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 17:37:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54DB510F5F0;
	Fri, 12 Jun 2026 17:37:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dx/a/sRM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C965F10F5F0;
 Fri, 12 Jun 2026 17:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781285819; x=1812821819;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3F4z9V/5/RL44DlOti/y0wmA1tYriSsdcnZ6Vr0FwhQ=;
 b=Dx/a/sRMVFlHsDjYRbqG7nTwXfv1/7PpIySBFaaITiMunhV3pJ/LV2a1
 JpZbbKFIOv//NHI6EBYMdm6qkS1i2iWoe1i6421x8g29BKkCKX50NXnq3
 3hj+zwQq/8Aevx/7ZEEzM9BHj55o/v/zTghDvTSCXOvK/LxQmzYZJyQvt
 +ndOpUscXLceDGvBtCb29mOsV8uHOlEAJfZHVv4uYZ7Zx13KnqxQoNfBw
 9Cus0GIbKKBYRzPPrzG9hZjYy5FoM54OiCqhkguoZxpHfqO3M/wcM6jkG
 g47rLHKuPfs3vnO4nBOGUMWXJYjypgXTu95r3CwXpCmMHjbf1FShVjBy6 A==;
X-CSE-ConnectionGUID: aW7eNAWARYWkgLoGMXPqfw==
X-CSE-MsgGUID: Pv/qC/7MSA+PF5Ys11t+vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="81965725"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208";a="81965725"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 10:36:58 -0700
X-CSE-ConnectionGUID: tyjnTjYsSGSo4FIiMcGSbw==
X-CSE-MsgGUID: HlESWt+BRfWCZQ14+tNNZg==
X-ExtLoop1: 1
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.89])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 10:36:57 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/6] drm/i915/cdclk: CDCLK sanitization stuff
Date: Fri, 12 Jun 2026 20:36:47 +0300
Message-ID: <20260612173653.7830-1-ville.syrjala@linux.intel.com>
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

Handle the CDCLK decimal divider sanitization a bit more gently,
add some more helpful debugs to the process, and clean up the
CDCLK_CTL bits.

Ville Syrjälä (6):
  drm/i915/cdclk: Fix up CDCLK_FREQ_DECIMAL without a full PLL re-enable
  drm/i915/cdclk: Print the reason for the CDCLK sanitization
  drm/i915/cdclk Clean up CDCLK_CTL defines
  drm/i915/cdclk: Document CDCLK_CTL bits
  drm/i915/cdclk: Introduce bxt_cdclk_cd2x_pipe_mask() and use it
  drm/i915/cdclk: Use the TGL+ CD2x pipe select bits also on ICL

 drivers/gpu/drm/i915/display/intel_cdclk.c    | 91 ++++++++++++++-----
 .../gpu/drm/i915/display/intel_display_regs.h | 26 +++---
 2 files changed, 80 insertions(+), 37 deletions(-)

-- 
2.53.0

