Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 198C8C3ABBE
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 01:30:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B509C10E0BE;
	Wed,  7 May 2025 01:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KwQ8OmDn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EC3710E008
 for <intel-xe@lists.freedesktop.org>; Wed,  7 May 2025 01:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746581444; x=1778117444;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mNMlUjqixtWmns7MwSvs9IASuqQaAD0NF+paMWXA/hc=;
 b=KwQ8OmDnLznBuNdGes49X+TKcdKTY+dtaYybCPA3ZNkPaMpXwIyRJQgc
 IxJJX0uByvLIf15gjSMKohkoM8xDuRy0S+ijQwSgHuzUX1UaiONnUAW7h
 dT2oCptPLlpHU8tvQgM74mp5AYU3T92GMk4/vWszkMvybMpQgU5/iCgCC
 ojr4QbLt8FwMhnkRg/Mf1KuyBEJdxpOqIt8lFgO9H69hmYIagYxNKN9Nk
 97wDjWS+0BHUzaBxTyIagVeRTGglh5FZpsag39viwlyL2GqLzHARkj8kk
 wC+Z0NLCkiG2e0dJ9BljgrbVn5vp3GvArFLloaJzJO0mTz+Olpbt1Cl2d A==;
X-CSE-ConnectionGUID: BQ4uG+jWT36BVtMOL2tClQ==
X-CSE-MsgGUID: bTVZ/HqjTveNhGy7u8M35w==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="58913457"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; d="scan'208";a="58913457"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 18:30:42 -0700
X-CSE-ConnectionGUID: UU92LXOiTwi6X+yDPm8Vew==
X-CSE-MsgGUID: tXKGo/CHQiqc82jgwEogXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; d="scan'208";a="135792194"
Received: from unerlige-desk1.jf.intel.com ([10.165.21.138])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 18:30:41 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 matthew.brost@intel.com
Cc: michal.wajdeczko@intel.com
Subject: [PATCH v3 0/4] Support active context utilization
Date: Tue,  6 May 2025 18:30:39 -0700
Message-ID: <20250507013039.2043897-6-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add support for active context utilization using WA BB.

v2: (Matt)
- Fix breakage in TDR due to this feature.
- Other review comments

v3:
- Include review comments from Matt and Lucas
- Bug fixes

v4:
- Review comments
- CI bug fixes

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (4):
  drm/xe: Save CTX_TIMESTAMP mmio value instead of LRC value
  drm/xe: Save the gt pointer in lrc and drop the tile
  drm/xe: Check 64-bit CTX timestamp for TDR when available
  drm/xe: Add WA BB to capture active context utilization

 .../gpu/drm/xe/instructions/xe_mi_commands.h  |   4 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h      |   5 +
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h       |   2 +
 drivers/gpu/drm/xe/xe_device_types.h          |   2 +
 drivers/gpu/drm/xe/xe_exec_queue.c            |   2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c            |  18 +-
 drivers/gpu/drm/xe/xe_lrc.c                   | 226 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_lrc.h                   |  12 +-
 drivers/gpu/drm/xe/xe_lrc_types.h             |   9 +-
 drivers/gpu/drm/xe/xe_pci.c                   |   2 +
 drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
 drivers/gpu/drm/xe/xe_ring_ops.c              |  15 +-
 drivers/gpu/drm/xe/xe_trace_lrc.h             |   8 +-
 13 files changed, 268 insertions(+), 38 deletions(-)

-- 
2.43.0

