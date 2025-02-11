Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D0FBC0219D
	for <intel-xe@archiver.kernel.org>; Tue, 11 Feb 2025 09:49:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA6C10E11C;
	Tue, 11 Feb 2025 09:49:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Np1Lckjl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4031510E11C
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Feb 2025 09:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739267359; x=1770803359;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DKi34RDZA545W94UKvOUnV7IhivbjvB/HtnEhRIAJyY=;
 b=Np1LckjloziOt70Sr04tOyxDVftXOCft/0vTEdJx0BeV4kgPeGT3Al+V
 vx5B++Wxu9acaziEFKHqhTBnZynG/nCCBgwaoRfoiBPo/j5Ek0c/g+aKx
 TaElHKFSyFXZsXmGwt4ccVK5XinnZoHAjgtyC1rJq/26TTNSMzJstg6eu
 Si+INWCR6fNM0Sk8c/AR/Exxsz7GWeH8wW6TCndjj+RSVBa45SkV2pvM/
 2+8ayWx1SllOD3PZSGdM5QYuay8AdwdO/9jw1Gpb+ZwKzmlpn9zdEm5+E
 9L/KHk9glxicTJMPI0neE/ICLWXIBehXNNLjGr4krJENLQZBeYLbtIii7 g==;
X-CSE-ConnectionGUID: w9TjGXfnSH+8EyRa2fgQCA==
X-CSE-MsgGUID: tTmhZKWkR/6VuVIam+bHhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="50104729"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; d="scan'208";a="50104729"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 01:49:19 -0800
X-CSE-ConnectionGUID: uX+E0G4hTbWxrraEa0i3RA==
X-CSE-MsgGUID: QLXKqXkGQgKwCA+VlTxY4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; d="scan'208";a="112974326"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 01:49:16 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 vinay.belgaumkar@intel.com, soham.purkait@intel.com
Subject: [PATCH v6 0/8] PMU support for engine activity
Date: Tue, 11 Feb 2025 15:39:42 +0530
Message-ID: <20250211100952.322303-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
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

PMU provides two counters (engine-active-ticks, engine-total-ticks)
to calculate engine activity. When querying this, user must group
these 2 counters using the perf_event group mechanism to ensure
both counters are sampled together.

To list the events

        ./perf list
        xe_0000_03_00.0/engine-active-ticks/    [Kernel PMU event]
        xe_0000_03_00.0/engine-total-ticks/     [Kernel PMU event]

The formats to be used with the above are

        gt              - config:60-63
        function        - config:59-44
        engine_class    - config:20-27
        engine_instance - config:12-19

The events can then be read using perf tool

        ./perf stat -e xe_<bdf>/engine-active-ticks,gt=<n>,engine_class=<n>,
                                engine_instance=<n>,function=<n>/,
                       xe_<bdf>/engine-total-ticks,gt=<n>,engine_class=<n>,
                                engine_instance=<n>,function<n>/
                       -I 1000

Engine activity can then be calculated as below
engine activity % = (engine active ticks/engine total ticks) * 100


Rev2: Add trace functions
      fix cosmetic review comments

Rev3: add engine class and instance as parameters
      replace busyness with engine activity

Rev4: add per-function engine activity
      fix review comments

Rev5: Remove global for SRIOV
      Add forcewake during init and destroy
      fix other review comments

Rev6: fix review comments

Riana Tauro (8):
  drm/xe: Add engine activity support
  drm/xe/trace: Add trace for engine activity
  drm/xe/guc: Expose engine activity only for supported GuC version
  drm/xe/xe_pmu: Add PMU support for engine activity
  drm/xe/xe_pmu: Acquire forcewake on event init for engine events
  drm/xe: Add support for per-function engine activity
  drm/xe/xe_pmu: Add PMU support for per-function engine activity stats
  drm/xe/pf: Enable per-function engine activity stats

 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/abi/guc_actions_abi.h      |   2 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   2 +
 drivers/gpu/drm/xe/xe_guc.c                   |   5 +
 drivers/gpu/drm/xe/xe_guc_engine_activity.c   | 515 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_engine_activity.h   |  22 +
 .../gpu/drm/xe/xe_guc_engine_activity_types.h |  98 ++++
 drivers/gpu/drm/xe/xe_guc_fwif.h              |  19 +
 drivers/gpu/drm/xe/xe_guc_types.h             |   4 +
 drivers/gpu/drm/xe/xe_pci_sriov.c             |  20 +
 drivers/gpu/drm/xe/xe_pmu.c                   | 209 ++++++-
 drivers/gpu/drm/xe/xe_pmu_types.h             |   4 +
 drivers/gpu/drm/xe/xe_trace_guc.h             |  49 ++
 drivers/gpu/drm/xe/xe_uc.c                    |   3 +
 14 files changed, 940 insertions(+), 13 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity_types.h

-- 
2.47.1

