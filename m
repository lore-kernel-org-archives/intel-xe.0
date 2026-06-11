Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B88CD98C7
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 07:50:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D2710ED3D;
	Thu, 11 Jun 2026 07:50:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EQ3oump/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 510C710ED3D;
 Thu, 11 Jun 2026 07:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781164255; x=1812700255;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ovdzfMV/dAy0rrvt/ciAYSuyfADhvQQzLaLU4Ih/cVM=;
 b=EQ3oump/Mrt+BtjG0XGxSrqAGbpis4hMw0C6/GP8znvELUl6uAnSRsfs
 dbfOKWCAb5NDh4ZZPKtYWi+whZhQ/R0emdpgkCka3TL/XJEBDrvp2Ueo/
 4QWaftuEaNyzZL3X9PLuzkYzA8OrQM9gkMRnky7A1Bh2gDZv9AnZFMX0y
 c4RE3ZZeLvc40Kex5NyUuGKuLQwsGEF8Th6wIJs4bkiMqxQXj89shtMJ8
 jAAOm/FhCG+H4fMmfa3U4aJ5PNwEAh95TXsydDDonzB49cuodR/h+MSF1
 IvUqLGZL4/DUrcQ4HgHH7kl9y2FLaXdcNUIzvFegFdF3LvUqU8VmktPbB g==;
X-CSE-ConnectionGUID: HZhCgIU7QvWlw5HpI1ADVA==
X-CSE-MsgGUID: QwzodhgWQf6U6H7KrXm0UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93078740"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="93078740"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 00:50:54 -0700
X-CSE-ConnectionGUID: lljt3fEPTO+4XPR+NhRtzA==
X-CSE-MsgGUID: M18CMouXTZWlRn6Gsomjtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="251503310"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 00:50:51 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, arun.r.murthy@intel.com,
 jani.nikula@linux.intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v4 00/12] Add support for Common SDP Transmission Line
Date: Thu, 11 Jun 2026 13:03:02 +0530
Message-ID: <20260611073316.1439306-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
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

Xe3p_lpd introduces new register bits to program a common SDP
Transmission line that will be used by the Hardware to position the
SDPs. Along with this, another new register is also added to stagger
the different SDPs.

This series adds support for programming the Common SDP Transmission Line
(CMN_SDP_TL) and its stagger control registers.

Rev2:
 - Add tracking for AS SDP Transmission line first. Instead of directly
   programming it in the register, compute the state during
   compute_config_late() and write the value from crtc_state.
   Readout from the register through a vrr helper, since the register is
   defined in context of VRR and will be used for both DP and HDMI VRR
   packets.
 - Add support to track other SDP transmission lines, instead of stagger
   values.
 - Compute the transmission lines in compute_config_late path and add
   readout.
 - Always write the Common SDP Transmission line and other stagger
   values, whether the packets are sent or not.
 - Dump SDP transmission lines in crtc_state.

Rev3:
 - Introduce new files for handling the Data Island Packets (DIPs)
   programming in one place. (Ville)
 - Extract the Transmission Line programming for
   HDMI Extended Metadata Packet (EMP) and Adaptive Sync SDP (AS SDP)
   i.e. EMP_AS_SDP_TL in the new file.
 - Add programming for Common Base SDP Transmission lines and other
   stagger offsets in the new file.
 - Add a #TODO to extract other helpers that deal with Data Island Packets
   and VIDEO_DIP registers.
 - Place the HAS_* Macros related to DIP in the intel_dip.h file
   instead of intel_display_devices.h (Jani) 
 - Make function names more descriptive and avoid overuse of multiple
   acronyms. (Jani)

Note:
 - Though I have fixed the naming as suggested in most places, I
   have retained HAS_EMP_AS_SDP_TL for the following reasons:
   1) Lack of an apt name that avoids the acronym for
      'Extended Metadata Packet Adaptive Sync Secondary Packet Transmission
      Line'.
   2) Keeping this name makes it easier to find and map with the exact name
      for such a complex register name.

   However, I am open to suggestions for a better name.

Rev4:
 - Drop the patch to check for DP encoder before writing EMP_AS_SDP_TL
   register. Instead reset the register to 0 for non DP encoder case.

Ankit Nautiyal (11):
  drm/i915/dip: Add new file to handle Data Island Packet hardware
  drm/i915/vrr: Use the helper to write EMP_AS_SDP_TL register
  drm/i915/intel_dip: Add check for DP encoder
  drm/i915/dp: Add helper to get AS SDP Transmission Line
  drm/i915/display: Add crtc state for DIP transmission lines
  drm/i915/dip: Store and use AS SDP transmission line from crtc state
  drm/i915/display: Add HAS_COMMON_SDP_TL macro
  drm/i915/dp: Store SDP transmission lines in crtc_state
  drm/i915/dp: Introduce helpers to enable/disable CMN SDP Transmission
    line
  drm/i915/dip: Enable Common SDP Transmission line
  drm/i915/display: Dump DIP Transmission lines

Arun R Murthy (1):
  drm/i915/nvl: Add register definitions for common SDP Transmission
    Line

 drivers/gpu/drm/i915/Makefile                 |   1 +
 .../drm/i915/display/intel_crtc_state_dump.c  |   9 +
 drivers/gpu/drm/i915/display/intel_ddi.c      |   5 +
 drivers/gpu/drm/i915/display/intel_dip.c      | 193 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dip.h      |  67 ++++++
 drivers/gpu/drm/i915/display/intel_dip_regs.h |  36 ++++
 drivers/gpu/drm/i915/display/intel_display.c  |   7 +
 .../drm/i915/display/intel_display_types.h    |   3 +
 drivers/gpu/drm/i915/display/intel_dp.c       |  23 +++
 drivers/gpu/drm/i915/display/intel_dp.h       |   1 +
 drivers/gpu/drm/i915/display/intel_vrr.c      |  13 +-
 drivers/gpu/drm/i915/display/intel_vrr_regs.h |   6 -
 drivers/gpu/drm/xe/Makefile                   |   1 +
 13 files changed, 348 insertions(+), 17 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_dip.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_dip.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_dip_regs.h

-- 
2.45.2

