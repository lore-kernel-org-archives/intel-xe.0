Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D962C88E5C
	for <intel-xe@archiver.kernel.org>; Sun, 13 Sep 2026 15:13:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F15410E2A8;
	Sun, 13 Sep 2026 15:13:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RXoj35kQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B10210E21B;
 Sun, 13 Sep 2026 15:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789312399; x=1820848399;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=G+FZCFXPLZsd7YZKlF2cIL8pue/8moLPOWxhO7JDEnE=;
 b=RXoj35kQcqc+ZD08PiVHx7pWhHU+5IFCPmN+9tsoOpnniNG8A9FwmJIN
 CwP2eSc+noAPNIOMZa21ymdCrb+orhpll2C5Tz8svtqKOdU4eDyA+aF0U
 /m9MdpDFGohXIy8QlrrkZJUaqZSVrDu1gaw6Ceh/6nFfiTEjRS91egqCl
 rRIaLv36VkH5qLBXrMbuPvKC7SnqwySGoT5f7M8zBuC9HNwCTGL2wBt3v
 MuPm4E7jvuXtS/+vq2ZQT4HQD4bc0GKsAtMeh/VOB19dTxN+uhcVdk9pF
 OrGowqfDrvXOPhUYflQcniAPonv5Gy+c/CDk/ylr7OFHCmPdYONDwE/Df Q==;
X-CSE-ConnectionGUID: NRzUtkDLTjCSXgwtOHo6LA==
X-CSE-MsgGUID: QJaeytPtShGwCbZ13duxhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="93388733"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; d="scan'208";a="93388733"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2026 08:13:18 -0700
X-CSE-ConnectionGUID: Lr+gvrIdSVGjUQuygjmRhg==
X-CSE-MsgGUID: euh9z6veRa+azeSXJPf+yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; d="scan'208";a="310693887"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2026 08:13:16 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, arun.r.murthy@intel.com,
 jani.nikula@linux.intel.com, suraj.kandpal@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v6 00/13] Add support for Common SDP Transmission Line
Date: Sun, 13 Sep 2026 20:26:35 +0530
Message-ID: <20260913145649.3240904-1-ankit.k.nautiyal@intel.com>
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

Rev6:
 - Move the new struct in intel_display_types.h from intel_dip.h (Jani)
 - Check for CMN_SDP_TL restriction and Warn if not followed. (Suraj)
 - Use HAS_CMN_SDP_TL() instead of checking if cmn_sdp_tl is set or not.
   (Sashiko)
 - Make sure that the guardband is sufficient as per CMN_SDP_TL while
   optiminzing the guardband.

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


Ankit Nautiyal (12):
  drm/i915/dip: Add new file to handle Data Island Packet hardware
  drm/i915/vrr: Use the helper to write EMP_AS_SDP_TL register
  drm/i915/intel_dip: Add check for DP encoder
  drm/i915/dip: Add helper to get AS SDP Transmission Line
  drm/i915/display: Add crtc state for DIP transmission lines
  drm/i915/dip: Store and use AS SDP transmission line from crtc state
  drm/i915/dip: Add HAS_COMMON_SDP_TL macro
  drm/i915/dip: Store SDP transmission lines in crtc_state
  drm/i915/dp: Introduce helpers to enable/disable CMN SDP Transmission
    line
  drm/i915/dip: Enable Common SDP Transmission line
  drm/i915/dp: Adjust SDP guardband requirement for CMN_SDP_TL
  drm/i915/display: Dump DIP Transmission lines

Arun R Murthy (1):
  drm/i915/dip_regs: Add register definitions for common SDP
    Transmission Line

 drivers/gpu/drm/i915/Makefile                 |   1 +
 .../drm/i915/display/intel_crtc_state_dump.c  |   9 +
 drivers/gpu/drm/i915/display/intel_ddi.c      |   5 +
 drivers/gpu/drm/i915/display/intel_dip.c      | 215 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dip.h      |  53 +++++
 drivers/gpu/drm/i915/display/intel_dip_regs.h |  36 +++
 drivers/gpu/drm/i915/display/intel_display.c  |   6 +
 .../drm/i915/display/intel_display_types.h    |  16 ++
 drivers/gpu/drm/i915/display/intel_dp.c       |  52 ++++-
 drivers/gpu/drm/i915/display/intel_vrr.c      |  14 +-
 drivers/gpu/drm/i915/display/intel_vrr_regs.h |   6 -
 drivers/gpu/drm/xe/Makefile                   |   1 +
 12 files changed, 395 insertions(+), 19 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_dip.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_dip.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_dip_regs.h

-- 
2.50.1

