Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4161CA0EC0
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 17:30:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C6410E96C;
	Fri,  8 Aug 2025 17:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QbYk7K0p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C71610E1EB
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 17:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754674209; x=1786210209;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bGnKdvkGVamEsG3axkGCeAwqRuUntK1mMcHCiEnHAIQ=;
 b=QbYk7K0pKgZwKCJgMs2aApFlhmaCMU3+FgSU3CQNJcO7lbQG2kVcv5+l
 nP0kBwEZZcSgF/HP1K5J52K0RVxhLRlXKfD7oSlmG7PtEJa5wdiE5c9CB
 42+39wQ6nQuYQFQjyUeIanoYqQ8BHMIkAKCg/GRTqw7trkwW2sUXYXzle
 h3lJRoQvxIjTOCmSoGAW4ClkdXUBSmfC4mpw3hHY69hJCFpNLIa+SuIFs
 rEYj1/LwlNsCe7X0hwPPCnlgL/vOiAGvmdEAuYhSUQqYhaQm5tG9COgBy
 ztNlDWb6S4DGGvZLPgf+dqjF5otZIrIrnk2yn3pIoNv0MJuTdNTR6/KLN g==;
X-CSE-ConnectionGUID: YBaI/lzqQT2cyiyMVTfP2w==
X-CSE-MsgGUID: pO/YnjcdSgO8S5ryTY1CjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="68109816"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="68109816"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 10:30:09 -0700
X-CSE-ConnectionGUID: V9wXdudKTgix5q+2jX4FFw==
X-CSE-MsgGUID: QVk2rzjoQXaRuwuW4l5NTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="165387394"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 10:30:08 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, prashanth.kumar@intel.com,
 dnyaneshwar.bhadane@intel.com, Matt Roper <matthew.d.roper@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Brian Welty <brian.welty@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v3 00/13] drm/xe: Add psmi support
Date: Fri,  8 Aug 2025 10:29:43 -0700
Message-ID: <20250808-psmi-v3-0-a111e9f1e4b7@intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250618-psmi-9f270bf67895
X-Mailer: b4 0.15-dev-858c0
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

Add PSMI support to aid debugging. More information about PSMI is in the
first and second patches.

Expose the toggle to enable it via configfs, which allows to debug just
one of the possible cards attached.

The buffer allocation request is done via debugfs.

In order to apply WAs conditionally to using PSMI, a new
RTP match is also added.

The rest of the patches are improvements to our configfs integration
that I've been collecting while reviewing other semi-related patches.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
Changes in v3:
- Rebase and refactor on multiple configfs changes
- Add patches to log to dmesg when non-default configfs value is found
- Block runtime changes of configfs attributes as they don't have any
  effect
- Improve documentation
- Link to v2: https://lore.kernel.org/r/20250723-psmi-v2-0-84a04b5a3c04@intel.com

Changes in v2:
- configfs
- some refactors as noted on individual patches
- Link to v1: https://lore.kernel.org/r/20250716-psmi-v1-0-674c13d7028e@intel.com
---
Badal Nilawar (1):
      drm/xe/psmi: Add Wa_14020001231

Lucas De Marchi (11):
      drm/xe/psmi: Add GuC flag to enable PSMI
      drm/xe/psmi: Add debugfs interface for PSMI
      drm/xe/rtp: Add match for psmi
      drm/xe/configfs: Simplify kernel doc
      drm/xe/configfs: Allow to enable PSMI
      drm/xe/configfs: Use guard() for dev->lock
      drm/xe/configfs: Block runtime attribute changes
      drm/xe/configfs: Use tree-like output in documentation
      drm/xe/configfs: Improve documentation steps
      drm/xe/configfs: Minor fixes to documentation
      drm/xe/configfs: Dump custom settings when binding

Vinay Belgaumkar (1):
      drm/xe/psmi: Add Wa_16023683509

 drivers/gpu/drm/xe/Makefile           |   1 +
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h |   1 +
 drivers/gpu/drm/xe/xe_configfs.c      | 208 ++++++++++++++++++----
 drivers/gpu/drm/xe/xe_configfs.h      |   4 +
 drivers/gpu/drm/xe/xe_debugfs.c       |   3 +
 drivers/gpu/drm/xe/xe_device.c        |   5 +
 drivers/gpu/drm/xe/xe_device_types.h  |   8 +
 drivers/gpu/drm/xe/xe_guc.c           |  10 +-
 drivers/gpu/drm/xe/xe_guc_ads.c       |   4 +
 drivers/gpu/drm/xe/xe_guc_fwif.h      |   2 +
 drivers/gpu/drm/xe/xe_pci.c           |   3 +
 drivers/gpu/drm/xe/xe_psmi.c          | 313 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_psmi.h          |  14 ++
 drivers/gpu/drm/xe/xe_rtp.c           |   7 +
 drivers/gpu/drm/xe/xe_rtp.h           |   3 +
 drivers/gpu/drm/xe/xe_wa_oob.rules    |   6 +
 16 files changed, 559 insertions(+), 33 deletions(-)

base-commit: 2632d3c5d7f7c1b80996fc74d27bed6612a0ff9b
change-id: 20250618-psmi-9f270bf67895

Lucas De Marchi

