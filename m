Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA2FCA5FA5
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 11:05:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6924410EE42;
	Tue, 29 Sep 2026 11:05:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X0KsZs89";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A019910E9D7;
 Tue, 29 Sep 2026 11:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790679914; x=1822215914;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rwTg6gLRX+ukpCHvyU48tfDtKuWBx02q3yicT2t1UkE=;
 b=X0KsZs89wRzWkivFUV/eVMKcSnn+9oudksknpRiUySnZ6vuXW7gII+xJ
 QmO2dcNcVCUoXnlaUWWqercE4Qq0v3RwbqsLgVDYcTNolXJbANfMh7RcD
 TlVWqzepKDRMmA/GOq+id/py1+DnLyBxTYySwMqsXcepWRnfJx79gKTJZ
 1DOQgcNSK8VpDipzi2RgmJ07fGMMLQYQg+mL356LH2v0ZVkxTeBVUBMkG
 ASFxlBy4eBEZLI5ywWE1XbI/WJAeyDFX18U0SGCZt3XbKIdXUF1H4lf+6
 KZzB2b7u0V6ihh6xFCalJ+4Sx+uq1uV8vZzEaBozfWLwXl6LMKWsAz9jr g==;
X-CSE-ConnectionGUID: 8ekHKoWCQAme7OA52A9etg==
X-CSE-MsgGUID: jcrQc0hYTHCUSnGPcjC2dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90295471"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="90295471"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 04:04:55 -0700
X-CSE-ConnectionGUID: VCliESAYQcKC5vWiu7o2EQ==
X-CSE-MsgGUID: dynyAeDuS0m2QMNA7/0U/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="274887301"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 04:04:51 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, alexander.kaplan@sms-medipool.de,
 swati2.sharma@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v3 00/10] DP-HDMI PCON DSC fixes
Date: Tue, 29 Sep 2026 16:18:25 +0530
Message-ID: <20260929104835.1050882-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
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

The PCON mode_valid path currently does not fully account for the bandwidth
limitations of the PCON <-> HDMI link. The DSC capability between the
PCON and the HDMI sink also needs to be taken into account, which currently
isn't. Furthermore, the compressed bpp chosen needs to fit the
FRL configuration, which is also missing.

This series:
 - reworks the HDMI DSC helpers so they can be reused across the
   mode_valid, compute_config and FRL bandwidth check paths
 - fixes the FRL/TMDS downstream bandwidth checks, and allows
   PCON DSC modes through the FRL check
 - Clamps the programmed DSC bpp to the FRL link bandwidth.

Rev2:
 - Rebase and address comments from Suraj.
 - Drop drm/i915/dp: Use FRL pair check for the DFP dotclock limit as no
   longer required.

Rev3:
 - Address Comments from Sashiko.
 - Account for FRL encoding overhead during bw calculation.
 - Pass pixel clock instead of using mode->crtc_clock to make it work
   with mode-valid case.
 - Clamp the target bpp only when it equals the pipe bpp to avoid
   missing the case when dsc min_bpp and max_bpp are same.

Ankit Nautiyal (10):
  drm/i915/hdmi: Split the intel_hdmi_dsc_get_bpp()
  drm/i915/dp: Fix FRL BW check for HDMI2.1 DFP
  drm/i915/dp: Add a wrapper to check frl/tmds downstream constraints
  drm/i915/dp: Use the common downstream bw check in compute_bpc
  drm/i915/hdmi: Expose DSC min/max bpp helpers
  drm/i915/hdmi: Add helper to check if DSC chunksize fits the sink
    limits
  drm/i915/hdmi: Pass pixel clock to DSC slice helper
  drm/i915/dp: Allow PCON DSC modes through FRL bw check
  drm/i915/hdmi: Clamp the target_bpp only when it equals the pipe bpp
  drm/i915/dp: Clamp PCON DSC bpp to the FRL link bandwidth

 drivers/gpu/drm/i915/display/intel_dp.c   | 152 ++++++++++++++++++----
 drivers/gpu/drm/i915/display/intel_hdmi.c | 150 +++++++++++++++------
 drivers/gpu/drm/i915/display/intel_hdmi.h |   8 +-
 3 files changed, 250 insertions(+), 60 deletions(-)

-- 
2.50.1

