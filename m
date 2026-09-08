Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D49C79FA0
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 06:38:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F7F10E086;
	Tue,  8 Sep 2026 06:38:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PiBiwBAt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A95F10E086;
 Tue,  8 Sep 2026 06:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788849537; x=1820385537;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5DU890dOMogpil4Dsr7hjnogWV1x17Z0h35ZRwmfb4E=;
 b=PiBiwBAtcvl+61NMLtABJlEro+eGPmn2bGuk2N1r+djeW+9grpu4RXel
 NDrfQ2vzCwlvEAEx+Y2vjrnPgp55zpEV+4JUJ5pejPyUZTZSj8g1j6xSo
 I49iMJgD9+QnYlwkTdNeGr5AIAgqt3tnAYMrnjbXxrXseQmTJONWlhfl1
 EW1RCQqh2nnlDIyeoTRsM4/Xl9Me7APu5hpjp3Oy/5yB9bCL1HNz9TC83
 XC7BiGd1YyknO/APSN5OPGHnJKeuDdWkBXWZbTtfOi4J0MIHCOTv7lsYy
 uiuida6Dyj6KVit+Nd9jdP241ToCcViObP3KPI+EVCM2C7Tcxp8EFR+uC w==;
X-CSE-ConnectionGUID: gmwd6JKDSMu3sTgyCm0b+g==
X-CSE-MsgGUID: ONL92cnAQuu3RqT7KicOBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="93061772"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="93061772"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 23:38:57 -0700
X-CSE-ConnectionGUID: q0V1h4WjS0+pZg06UdQ/Cg==
X-CSE-MsgGUID: dDeFHm3/TaGX3VgcM2sovA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="264702398"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 23:38:55 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, arun.r.murthy@intel.com,
 jani.nikula@linux.intel.com, suraj.kandpal@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v5 00/12] Add support for Common SDP Transmission Line
Date: Tue,  8 Sep 2026 11:52:11 +0530
Message-ID: <20260908062224.2897987-1-ankit.k.nautiyal@intel.com>
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

Rev5:
 - Rebase
 - Address review comments from Suraj:
 - Drop some redundant checks, and fix few commit messages.

Ankit Nautiyal (11):
  drm/i915/dip: Add new file to handle Data Island Packet hardware
  drm/i915/vrr: Use the helper to write EMP_AS_SDP_TL register
  drm/i915/intel_dip: Add check for DP encoder
  drm/i915/dip: Add helper to get AS SDP Transmission Line
  drm/i915/display: Add crtc state for DIP transmission lines
  drm/i915/dip: Store and use AS SDP transmission line from crtc state
  drm/i915/dip: Add HAS_COMMON_SDP_TL macro
  drm/i915/dp: Store SDP transmission lines in crtc_state
  drm/i915/dp: Introduce helpers to enable/disable CMN SDP Transmission
    line
  drm/i915/dip: Enable Common SDP Transmission line
  drm/i915/display: Dump DIP Transmission lines

Arun R Murthy (1):
  drm/i915/dip_regs: Add register definitions for common SDP
    Transmission Line

 drivers/gpu/drm/i915/Makefile                 |   1 +
 .../drm/i915/display/intel_crtc_state_dump.c  |   9 +
 drivers/gpu/drm/i915/display/intel_ddi.c      |   5 +
 drivers/gpu/drm/i915/display/intel_dip.c      | 209 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dip.h      |  67 ++++++
 drivers/gpu/drm/i915/display/intel_dip_regs.h |  36 +++
 drivers/gpu/drm/i915/display/intel_display.c  |   7 +
 .../drm/i915/display/intel_display_types.h    |   3 +
 drivers/gpu/drm/i915/display/intel_dp.c       |   2 +
 drivers/gpu/drm/i915/display/intel_vrr.c      |  14 +-
 drivers/gpu/drm/i915/display/intel_vrr_regs.h |   6 -
 drivers/gpu/drm/xe/Makefile                   |   1 +
 12 files changed, 343 insertions(+), 17 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_dip.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_dip.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_dip_regs.h

-- 
2.50.1

