Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08DA3C55162
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 11:09:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA9F010EEBF;
	Thu, 30 Jul 2026 11:09:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nu+Dlbat";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D78A10EEBC;
 Thu, 30 Jul 2026 11:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785409769; x=1816945769;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hmt79ijGVKksiRAalD0FgMUw3UrKYGngZTMKu29Bukw=;
 b=nu+DlbatB8pcZ/1MwDPHPRP+/1/AohTxgs9KEFQllke3RpsyBh7sqRLE
 93as1fbh/ZdPM7s5Joy0BxwcPcC0aP3vBVjs3vrWP/LSHSkDpICgjgGeb
 Bo8y41RC6y1EO2yNQuKIDOkPi1rv6wrsqMk3+zKvFmPy7En0VigkT9l4w
 fqK0l6VcAUmjC3i/jM7nsOhlHF/v8LU7XVHa/NUjC68du7/0LaB7ns6gi
 H93GROaEkCeIxXPlskg3gnPSLGBMRcvdXJ0Pjkhe3M+swh551F5nmYPnj
 fqq2Z6N0abNqFtoCNON8PtmVwpetfS0RDGnQ1Wc5+WWQw45EXleOkMlnl A==;
X-CSE-ConnectionGUID: TSb1zCM1T/+6gNkS6WwhpA==
X-CSE-MsgGUID: 1aiO9J/nRPelNG6AiMBXTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="97182394"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="97182394"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 04:09:29 -0700
X-CSE-ConnectionGUID: DJQe3ByARDe7Nl0aqMrVVw==
X-CSE-MsgGUID: gqKp348mQXGqhTkD6RkXqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="265327083"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 04:09:26 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 00/14] DP-HDMI PCON DSC fixes
Date: Thu, 30 Jul 2026 16:22:12 +0530
Message-ID: <20260730105226.2731341-1-ankit.k.nautiyal@intel.com>
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

Ankit Nautiyal (14):
  drm/i915/hdmi: Use correct type for output_format parameter
  drm/i915/display: Generalize intel_hdmi_dsc_get_num_slices helper
  drm/i915/display: Pass bpc in intel_hdmi_dsc_get_bpp
  drm/i915/hdmi21/mtl: Split the intel_hdmi_dsc_get_bpp()
  drm/i915/dp: Fix FRL BW check for HDMI2.1 DFP
  drm/i915/dp: Add a wrapper to check frl/tmds downstream constraints
  drm/i915/dp: Use FRL pair check for the DFP dotclock limit
  drm/i915/dp: Use the common downstream bw check in compute_bpc
  drm/i915/hdmi: Expose DSC min/max bpp helpers
  drm/i915/hdmi: Add helper to check if DSC chunksize fits the sink
    limits
  drm/i915/dp: Allow PCON DSC modes through FRL bw check
  drm/i915/dp: Clamp PCON DSC bpp to the FRL link bandwidth
  drm/i915/hdmi: Add helper to get max FRL rate for an HDMI sink
  drm/i915/dp: Use helpers for getting max FRL rate

 drivers/gpu/drm/i915/display/intel_dp.c   | 173 +++++++++++++++++-----
 drivers/gpu/drm/i915/display/intel_hdmi.c | 150 ++++++++++++++-----
 drivers/gpu/drm/i915/display/intel_hdmi.h |  16 +-
 3 files changed, 261 insertions(+), 78 deletions(-)

-- 
2.50.1

