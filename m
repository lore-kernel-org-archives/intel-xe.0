Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E93EC5AC67
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 04:59:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A25CA10E270;
	Tue, 11 Aug 2026 04:59:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N/PeCqIs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CFDF10E174;
 Tue, 11 Aug 2026 04:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786424372; x=1817960372;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fUgX6et/ARotcdzGa2b/y/nZb1SiHs0vODSzPSj2kT4=;
 b=N/PeCqIsMsPRfRcU7WayRqfm1DRZ0iC6eYvi7Ybm3JjqInJI9GcZ+x/N
 hKTdePCF2u3Y/zcrwv0h35uk9xXO1sFNjyjTJWx0weJ/lNPS2ezSydMZU
 O8D0sGlKmX9T/I64+OARhfMpK7oVBHoZIEHyke/ec5vLFTZp75k94PFCV
 BdkmaPozZ010BipZzXmgSeiLjhhSc5obALiCTWm5QhB28KA5zVdiptikJ
 3P40OXd7Tj+jivjj6rrZUj21fmGu/X6IF2KphPCdBQr8xk0FjISsUiWlD
 6QeHXpgJMHABu/xcr+6g2aWznbH6t4KlCdkO26XCgcWBcZgFt+JVNDL16 g==;
X-CSE-ConnectionGUID: sRPwnALMRUS74olDGMCnyQ==
X-CSE-MsgGUID: PtywyDCTRdel6eklk0Qdpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="86708320"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="86708320"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 21:59:31 -0700
X-CSE-ConnectionGUID: bUhhLsw5S/2cXX3gw41viA==
X-CSE-MsgGUID: JZX1DXJPSEWFijoVq9KhUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="267082717"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 21:59:24 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de, suraj.kandpal@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v2 0/8] DP-HDMI PCON DSC fixes
Date: Tue, 11 Aug 2026 10:12:26 +0530
Message-ID: <20260811044234.593986-1-ankit.k.nautiyal@intel.com>
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

Ankit Nautiyal (8):
  drm/i915/hdmi: Split the intel_hdmi_dsc_get_bpp()
  drm/i915/dp: Fix FRL BW check for HDMI2.1 DFP
  drm/i915/dp: Add a wrapper to check frl/tmds downstream constraints
  drm/i915/dp: Use the common downstream bw check in compute_bpc
  drm/i915/hdmi: Expose DSC min/max bpp helpers
  drm/i915/hdmi: Add helper to check if DSC chunksize fits the sink
    limits
  drm/i915/dp: Allow PCON DSC modes through FRL bw check
  drm/i915/dp: Clamp PCON DSC bpp to the FRL link bandwidth

 drivers/gpu/drm/i915/display/intel_dp.c   | 144 ++++++++++++++++++----
 drivers/gpu/drm/i915/display/intel_hdmi.c | 124 ++++++++++++++-----
 drivers/gpu/drm/i915/display/intel_hdmi.h |   7 +-
 3 files changed, 218 insertions(+), 57 deletions(-)

-- 
2.50.1

