Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3245EE499E
	for <intel-xe@archiver.kernel.org>; Fri, 18 Aug 2023 22:08:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7898F10E587;
	Fri, 18 Aug 2023 22:08:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E5910E049
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Aug 2023 22:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692396511; x=1723932511;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZVOKvcNJXsBJr1hyImxRLe8HuwyMGXCjrYYwulNJJqg=;
 b=aiylMT4REFwFOG6hPM8ujpdaZ0XgBRzc9RBrUIIDU35h11/F428ZYj+k
 sLGFgZhqUsB240L0FxizfyJJtcxkRJtS8yXF78dQqsEFvowVfmFLGu3Pr
 joaIIepyoyXlzOa8PFvfvSy7unHwg4CuVrn1+uy220S4Wew2zb0ehoH+K
 NVzVhAt047atlWu8QbEm/Rsnxn3Phxro0F6Eusc6VLPaCL6JD3/YWosBc
 ++i9RbTD/G1vY7PKr7tm9C5HJy4Pw4lXn6Uf7FSU1jkX+1wOhTLXO3IUt
 mNN/bTs3eQYEA9o2aUc2fa3vJ33BzsZ/fAfrzlvPIViyG5B/pnyTkc5gS A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="439592981"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="439592981"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 15:08:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="728758173"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="728758173"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 15:08:31 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 18 Aug 2023 15:08:09 -0700
Message-Id: <20230818220824.700519-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 00/15] Add Lunar Lake support
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add the basic enabling for Lunar Lake, which uses the Xe2 architecture.
This mostly plugs in the missing xe2 bits and define the platform. The
codebase had already been prepared for this.

Display support will follow later as it's going through i915 and its
integration with xe is still moving up in the drm-xe-next branch.
PAT changes are also coming later as it's currently being refactored in
drm-xe-next for MTL.

v2: Mainly fixes to the MCR table to follow the latest version of the
bspec and some renames, all of them pointed out during the review of
v1.

Balasubramani Vivekanandan (2):
  drm/xe/xe2: Add MOCS table
  drm/xe/lnl: Hook up MOCS table

Matt Roper (13):
  drm/xe/xe2: Update render/compute context image sizes
  drm/xe/xe2: Add GT topology readout
  drm/xe/xe2: Add MCR register steering for primary GT
  drm/xe/xe2: Add MCR register steering for media GT
  drm/xe/xe2: Update context image layouts
  drm/xe/xe2: Handle fused-off CCS engines
  drm/xe/xe2: AuxCCS is no longer used
  drm/xe/xe2: Define Xe2_LPG IP features
  drm/xe/xe2: Define Xe2_LPM IP features
  drm/xe/xe2: Track VA bits independently of max page table level
  drm/xe/xe2: Program GuC's MOCS on Xe2 and beyond
  drm/xe/lnl: Add LNL platform definition
  drm/xe/lnl: Add GuC firmware definition

 drivers/gpu/drm/xe/regs/xe_gt_regs.h   |  5 ++
 drivers/gpu/drm/xe/regs/xe_guc_regs.h  |  2 +-
 drivers/gpu/drm/xe/xe_device_types.h   |  2 +
 drivers/gpu/drm/xe/xe_gt_mcr.c         | 76 ++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_topology.c    | 16 +++--
 drivers/gpu/drm/xe/xe_gt_types.h       |  3 +-
 drivers/gpu/drm/xe/xe_guc.c            |  2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c      | 29 ++++++++-
 drivers/gpu/drm/xe/xe_lrc.c            | 85 +++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_mocs.c           | 37 +++++++++--
 drivers/gpu/drm/xe/xe_pci.c            | 40 ++++++++++++
 drivers/gpu/drm/xe/xe_pci_types.h      |  1 +
 drivers/gpu/drm/xe/xe_platform_types.h |  1 +
 drivers/gpu/drm/xe/xe_query.c          |  3 +-
 drivers/gpu/drm/xe/xe_ring_ops.c       |  6 +-
 drivers/gpu/drm/xe/xe_uc_fw.c          |  1 +
 drivers/gpu/drm/xe/xe_vm.c             |  2 +-
 include/drm/xe_pciids.h                |  5 ++
 18 files changed, 290 insertions(+), 26 deletions(-)

-- 
2.40.1

