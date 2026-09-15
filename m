Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05719C88E77
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 17:03:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C7BE10E211;
	Tue, 15 Sep 2026 17:03:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CDNdCq2/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D471010E211;
 Tue, 15 Sep 2026 17:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789491810; x=1821027810;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fmONBvWpuhbeKJhsmYewgk9SshsIZkP9VQiBROl/rXM=;
 b=CDNdCq2/jLyfXr/yEhAso4U5bPoLoay9yOFc1awxreOSy+QEcaFGgV7Y
 2tOxzhKefgYuyh0Zrc1NLlJZchnG+pEGaXsNhq5UzMCtHV10r4Zv8Lxw9
 zdE3vs7c4N6UxGUzGUP4Jr/7VpK9jb40WOc5fW0g5o/uKQ7oCGhAg4Jsb
 jyaV2NiuINlS7sF/F2dteaj+GMLQkgJ5cVTq9IpQiwdKUd8G9q7UMLd71
 NXb95JzSDG1Vq/bvsFOeFqld2nspXCB242ahDvfVMI+qaSfuCZgi+cYW5
 xajnoM3T38wGstbJUMTJOcGxfSv1BE/2JhXFQXTnOtVYjUq/z3M+PAId3 A==;
X-CSE-ConnectionGUID: sBBc9EzmQS6p4c6lmkyNdA==
X-CSE-MsgGUID: UNrC5rtKTIm5Ijj4u2M8LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="371859"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="371859"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 10:03:29 -0700
X-CSE-ConnectionGUID: s1ij1KJvQDuM8OPLX0X6Xg==
X-CSE-MsgGUID: Hwmcno6STPytJCgbiFMR5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270443870"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 10:03:26 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, arun.r.murthy@intel.com,
 jani.nikula@linux.intel.com, suraj.kandpal@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v7 00/14] Add support for Common SDP Transmission Line
Date: Tue, 15 Sep 2026 22:16:41 +0530
Message-ID: <20260915164657.3429075-1-ankit.k.nautiyal@intel.com>
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

Rev7:
 - Account for VSC SDP's own minimum guardband requirement in
   intel_dp_sdp_min_guardband(), for completeness. (Sashiko)
 - Wrap two long line macro definitions in intel_dip_regs.h.

Ankit Nautiyal (13):
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
  drm/i915/dp: Account VSC SDP in min guardband
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
 drivers/gpu/drm/i915/display/intel_dip_regs.h |  38 ++++
 drivers/gpu/drm/i915/display/intel_display.c  |   6 +
 .../drm/i915/display/intel_display_types.h    |  16 ++
 drivers/gpu/drm/i915/display/intel_dp.c       |  62 ++++-
 drivers/gpu/drm/i915/display/intel_vrr.c      |  14 +-
 drivers/gpu/drm/i915/display/intel_vrr_regs.h |   6 -
 drivers/gpu/drm/xe/Makefile                   |   1 +
 12 files changed, 407 insertions(+), 19 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_dip.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_dip.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_dip_regs.h

-- 
2.50.1

