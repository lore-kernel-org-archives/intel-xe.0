Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8991EC1438
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 12:54:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 476D8891D9;
	Tue,  3 Mar 2026 12:54:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UCDYCo0+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9074210E7C6;
 Tue,  3 Mar 2026 12:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772542464; x=1804078464;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=av8+L30nVaapIj3fTDGGcxm5bFsQnh49jSxm9fqFqm4=;
 b=UCDYCo0+YMvPJqD297ZDahgFW97gMx4IcNVIjuePF9j++Y8s55CNjHzg
 2dUvGP53QrhQcWA5lN/pMrk6kp7Ttm0yQu2TdDFmrceBCApW87yuxhACV
 ch+pywc2gUNsnnhchXcX9qdEN0tRqAjrtdUlVpkXLrC4Wj90gRvKgV6iy
 lvbX++99fhDoButliuD3GthYTfDMaTifDgkLM0k5A2V/7Rr0hkm1FWs7L
 ae7AQTMovMjMREV8II6p2XPM/apA9PWyJoxAp3SGyTeoekojuoPo/sLCq
 wvwdHeEXlCKmqG6IotaYu0/l66GlIoNzPHOHzfQTSKyruFOf0jhilDYRg g==;
X-CSE-ConnectionGUID: pNEGYSX2SoOYo/4Eq4piCg==
X-CSE-MsgGUID: fa1GzwTwRHu0I4+zcjfxKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="77421786"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="77421786"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 04:54:23 -0800
X-CSE-ConnectionGUID: BZcKqrMKR7mBjevxrhCzHw==
X-CSE-MsgGUID: h6Z6wsGERdejvIIAIkVQIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="222651970"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.245.74])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 04:54:20 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v2 0/4] PSR/PR Selective Fetch Early Transport fixes
Date: Tue,  3 Mar 2026 14:54:05 +0200
Message-ID: <20260303125409.503148-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

This patch set contains fixes for Selective Fetch Early Transport configuration:

  - add necessary DSC Early Transport configuration
  - corner case fix for Selective Update area when Early Transport is
    in use and cursor plane is included into SU are due to alignment.

v2:
  - optimize elignment loop
  - move register definitions to intel_vdsc_regs.h
  - replace patches 3 and 4 with new patches
  - drop patch 5

Jouni Högander (4):
  drm/i915/psr: Repeat Selective Update area alignment
  drm/i915/dsc: Add Selective Update register definitions
  drm/i915/dsc: Add helper for writing DSC Selective Update ET
    parameters
  drm/i915/psr: Write DSC parameters on Selective Update in ET mode

 drivers/gpu/drm/i915/display/intel_psr.c      | 61 +++++++++++++++----
 drivers/gpu/drm/i915/display/intel_vdsc.c     | 22 +++++++
 drivers/gpu/drm/i915/display/intel_vdsc.h     |  3 +
 .../gpu/drm/i915/display/intel_vdsc_regs.h    | 12 ++++
 4 files changed, 85 insertions(+), 13 deletions(-)

-- 
2.43.0

