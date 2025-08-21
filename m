Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6944BCA0FE4
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 16:18:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A1A10E397;
	Thu, 21 Aug 2025 16:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QmPWddl9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 630E710E38D
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Aug 2025 16:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755793115; x=1787329115;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xza+askcyg+l8HlH6mDlcNOxlViBgXRolz1mzvZjd9U=;
 b=QmPWddl9q5U4JLPzlGgXWr7iqlgzYPjvIYGGaT50XRgYqG74I/RZt1J3
 7gSkAiqMiR2Xm/cscMgMFV2/3ec8u4jt4rauYUBcE2+O9wfAbx3x8TdYm
 y7GxEvx0gDpjcoVLkxyH9ulqCHQGaitDid3E6phDNaNFw0HEBfW1pC8Mw
 YfT8JP9hkN6qBm1n+tHX4QLXoa2vts8f2IjACwx9eIg0WEYS5hUP5kwC5
 zhbgTqZhPpFRJxVupjH+hRelG+mRxKeFwsXZExZ1kquJgkruBdpLG5GUE
 7c1rSMHGy9+p9aDuXV745n7i9ayKXN0P5zPieWfvnTu7wkFHedD5nh957 w==;
X-CSE-ConnectionGUID: HDXnZyYLSaeR5rrJ3VIgmQ==
X-CSE-MsgGUID: aI28Z49+RHiNADKzGfE0Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="69527879"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="69527879"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 09:18:35 -0700
X-CSE-ConnectionGUID: v5jKrJgWQDOHKei1exNZ3w==
X-CSE-MsgGUID: YT9acgjZT9SW/2e7ACzL9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="199326698"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 09:18:33 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, prashanth.kumar@intel.com,
 dnyaneshwar.bhadane@intel.com, Matt Roper <matthew.d.roper@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Brian Welty <brian.welty@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v5 00/12] drm/xe: Add psmi support
Date: Thu, 21 Aug 2025 09:17:55 -0700
Message-ID: <20250821-psmi-v5-0-34ab7550d3d8@intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250618-psmi-9f270bf67895
X-Mailer: b4 0.15-dev-b03c7
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
Changes in v5:
- Fix wrong check for GRAPHICS_STEP
- Remove patch to block changes in runtime: that needs changes in igt
  that can wait those patches to be reviewed:
  https://patchwork.freedesktop.org/series/153175/
- Link to v4: https://lore.kernel.org/r/20250818-psmi-v4-0-a330783ce1c0@intel.com

Changes in v4:
- Rebase and handle feedback from reviews as noted in individual patches
- One open is if the reserved buffer needs to be cleared
- Link to v3: https://lore.kernel.org/r/20250808-psmi-v3-0-a111e9f1e4b7@intel.com

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

Lucas De Marchi (10):
      drm/xe/psmi: Add GuC flag to enable PSMI
      drm/xe/psmi: Add debugfs interface for PSMI
      drm/xe/rtp: Add match for psmi
      drm/xe/configfs: Simplify kernel doc
      drm/xe/configfs: Allow to enable PSMI
      drm/xe/configfs: Use guard() for dev->lock
      drm/xe/configfs: Use tree-like output in documentation
      drm/xe/configfs: Improve documentation steps
      drm/xe/configfs: Minor fixes to documentation
      drm/xe/configfs: Dump custom settings when binding

Vinay Belgaumkar (1):
      drm/xe/psmi: Add Wa_16023683509

 drivers/gpu/drm/xe/Makefile           |   1 +
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h |   1 +
 drivers/gpu/drm/xe/xe_configfs.c      | 170 +++++++++++++++----
 drivers/gpu/drm/xe/xe_configfs.h      |   4 +
 drivers/gpu/drm/xe/xe_debugfs.c       |   3 +
 drivers/gpu/drm/xe/xe_device.c        |   5 +
 drivers/gpu/drm/xe/xe_device_types.h  |   8 +
 drivers/gpu/drm/xe/xe_guc.c           |  10 +-
 drivers/gpu/drm/xe/xe_guc_ads.c       |   4 +
 drivers/gpu/drm/xe/xe_guc_fwif.h      |   2 +
 drivers/gpu/drm/xe/xe_pci.c           |   3 +
 drivers/gpu/drm/xe/xe_psmi.c          | 306 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_psmi.h          |  14 ++
 drivers/gpu/drm/xe/xe_rtp.c           |   7 +
 drivers/gpu/drm/xe/xe_rtp.h           |   3 +
 drivers/gpu/drm/xe/xe_wa_oob.rules    |   6 +
 16 files changed, 514 insertions(+), 33 deletions(-)

base-commit: 16e133c7e6922a9f224b272a48ac172cf06e3408
change-id: 20250618-psmi-9f270bf67895

Lucas De Marchi

