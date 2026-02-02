Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1DBBE7FDEF
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 21:44:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBF1A10E3DB;
	Mon,  2 Feb 2026 21:44:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MBuQ5Ic1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B05D110E3CF;
 Mon,  2 Feb 2026 21:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770068646; x=1801604646;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=4UIJ6gi76CP6S/ds+j9xR7SakMmdDuRSvq3j8Bdy89U=;
 b=MBuQ5Ic1DfkZotmJw10ploCcbg+B1wSRzAcExZyMCeV26pNlLcUViyc5
 CQWkJcGt9b1UZd5ykKP6I9GyAvetF/EB2ShSX0kQiIEX6skWYSaIGzT2Z
 RLSZO/az03wTNPSeP2Us77LKcogkVJSmSTCTEUO9uEk8gxIjYLI6ozgM/
 JgB3uTwsyty8TGtecwKHP4QoG0Y0m2gLSTyUqhBeTFn8PPAbHjN35Pyzn
 HSmZp0LYhOr+OoFB80r+v0XxMfQKzr/f9lQCb8KkTJDZtQZnzaj4UtaM4
 3zaenRIhltuHB1dNGEFIEsslAGVUMS89OlrCwLD/bLXJFKyNdiK+yy/n5 Q==;
X-CSE-ConnectionGUID: dy06QydMTxiCC5dGPLpmwQ==
X-CSE-MsgGUID: WoiO8Am1QXOfPoZ+mttcBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="58814317"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="58814317"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 13:44:05 -0800
X-CSE-ConnectionGUID: Uh4B0nNtSJaJHM0XfaHkSQ==
X-CSE-MsgGUID: AsvRs9N2RuWi6YP0jc9Ibw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="209646792"
Received: from smoehrl-linux.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.51])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 13:44:01 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH 00/16] Basic enabling patches for Xe3p_LPG and NVL-P
Date: Mon, 02 Feb 2026 18:43:06 -0300
Message-Id: <20260202-nvl-p-upstreaming-v1-0-653e4ff105dc@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBtQA6GuEi0sxxooEy0JwrsnL
 d/i/xcSRaYEQ/NCpMyJT18h2waWzfiVkG01KKG0kJ1An3cMeId0RTIH+xVJ9+SMk3buJdQuRHL
 8/M9xKuUDe6fF9GMAAAA=
X-Change-ID: 20260130-nvl-p-upstreaming-e69efaf1db91
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Shekhar Chauhan <shekhar.chauhan@intel.com>, 
 Nitin Gote <nitin.r.gote@intel.com>, 
 Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>, 
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>, 
 Tejas Upadhyay <tejas.upadhyay@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>, 
 Aradhya Bhatia <aradhya.bhatia@intel.com>, 
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>, 
 John Harrison <John.C.Harrison@Intel.com>
X-Mailer: b4 0.15-dev
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

NVL-P is a new Intel platform that comes with the following IPs:

- Xe3p_LPG graphics;
- Xe3p_LPM media;
- Xe3p_LPD display.

Enabling patches for Xe3p_LPM and Xe3p_LPD are already integrated in our
driver.  In this series we add patches enabling Xe3p_LPG and then follow
up with patches enabling NVL-P as a platform in our driver.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
Aradhya Bhatia (1):
      drm/xe/xe3p_lpg: Set STLB bank hash mode to 4KB

Dnyaneshwar Bhadane (1):
      drm/xe/nvlp: Attach MOCS table for nvlp

Gustavo Sousa (3):
      drm/xe/pat: Differentiate between primary and media for PTA
      drm/xe/xe3p_lpg: Update LRC sizes
      drm/xe/xe3p_lpg: Enable multi-queue feature

John Harrison (1):
      drm/xe/nvlp: Define GuC firmware for NVL-P

Matt Roper (7):
      drm/xe/xe3p_lpg: Add new PAT table
      drm/xe/xe3p_lpg: Add MCR steering
      drm/xe/xe3p_lpg: Add LRC parsing for additional RCS engine state
      drm/xe/xe3p_lpg: Disable reporting of context switch status to GHWSP
      drm/xe/xe3p_lpg: Drop unnecessary tuning settings
      drm/xe/xe3p_lpg: Extend 'group ID' mask size
      drm/i915/nvlp: Hook up display support

Shekhar Chauhan (3):
      drm/xe/xe3p_lpg: Add support for graphics IP 35.10
      drm/xe/xe3p_lpg: Add initial workarounds for graphics version 35.10
      drm/xe/nvlp: Add NVL-P platform definition

 .../gpu/drm/i915/display/intel_display_device.c    |  1 +
 .../gpu/drm/xe/instructions/xe_gfxpipe_commands.h  | 10 +++
 drivers/gpu/drm/xe/regs/xe_gt_regs.h               | 23 +++++-
 drivers/gpu/drm/xe/xe_bo.c                         |  4 +-
 drivers/gpu/drm/xe/xe_device_types.h               |  8 ++-
 drivers/gpu/drm/xe/xe_gt_mcr.c                     | 18 ++++-
 drivers/gpu/drm/xe/xe_lrc.c                        | 18 ++++-
 drivers/gpu/drm/xe/xe_mocs.c                       |  1 +
 drivers/gpu/drm/xe/xe_pat.c                        | 82 +++++++++++++++++++---
 drivers/gpu/drm/xe/xe_pci.c                        | 21 ++++++
 drivers/gpu/drm/xe/xe_platform_types.h             |  1 +
 drivers/gpu/drm/xe/xe_reg_whitelist.c              |  8 +++
 drivers/gpu/drm/xe/xe_tuning.c                     | 22 +++++-
 drivers/gpu/drm/xe/xe_uc_fw.c                      |  2 +
 drivers/gpu/drm/xe/xe_wa.c                         | 48 +++++++++++++
 include/drm/intel/pciids.h                         | 12 ++++
 16 files changed, 257 insertions(+), 22 deletions(-)
---
base-commit: c716d3fcf63ff63e6ecab8769c949e1cdbfb7a79
change-id: 20260130-nvl-p-upstreaming-e69efaf1db91

Best regards,
--  
Gustavo Sousa <gustavo.sousa@intel.com>

