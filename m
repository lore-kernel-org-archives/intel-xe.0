Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E01C0218D
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jan 2025 09:56:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE7810E77A;
	Wed, 29 Jan 2025 09:56:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R22AuQaN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E4DA10E77A
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jan 2025 09:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738144587; x=1769680587;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7imLO1FE2OILF15Jja4iFHK9ohk8SS9uQqQfOZI7Pqw=;
 b=R22AuQaNDU4Gy23cav6DBFbm7u4aV7UqwcsUu39FVchFU3QV2rWOIYm8
 LHa2PTFzP8vdiUb5n5mxgdtdx7TFNTTXCdqYbRhSSrlKcs3qUv6U17oKB
 QSYGksPienA+IGRn11fPYZ+lHdjEad7HZK5IGUxvI8KkFQNcjxhM8w0aq
 EkyNswIJB/3OxQTy0JG2kWkwOv/MuTOXFUVunlWCpcjy6aGr4wiJAieoH
 eptSfLCSDNi4dZksE1fDhI7XUd47UAVpZTTRjOf1SqrBTkCzE4O7YZEF2
 guoSeHg0uaG9yDt51G62iNuh80hQBYCOHguki39gJuXROHh8WvQNhva8F A==;
X-CSE-ConnectionGUID: KVx5NhaUREOXp9IiJth5ug==
X-CSE-MsgGUID: vnlPzsVPTzu+vqExox57iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="42579450"
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; d="scan'208";a="42579450"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 01:56:26 -0800
X-CSE-ConnectionGUID: lFPcoYeNRZComMxWn+zhkQ==
X-CSE-MsgGUID: mc8b3yFaSV+Aub5mDwyy7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; d="scan'208";a="108958112"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 01:56:23 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 vinay.belgaumkar@intel.com, soham.purkait@intel.com
Subject: [PATCH v4 0/8] PMU Support for per-engine-class activity
Date: Wed, 29 Jan 2025 15:46:43 +0530
Message-ID: <20250129101653.1976699-1-riana.tauro@intel.com>
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

This series adds support for per-engine-class activity for native
and PF and VF's

PMU provides two counters (engine-active-ticks, engine-total-ticks)
to calculate engine activity. When querying this, user must group
these 2 counters using the perf_event group mechanism to ensure
both counters are sampled together.

To list the events

        ./perf list
                xe_0000_03_00.0/engine-active-ticks/    [Kernel PMU event]
                xe_0000_03_00.0/engine-total-ticks/     [Kernel PMU event]

The formats to be used with the above are

        function        - config:59-44
        engine_class    - config:20-27
        engine_instance - config:12-19
        gt              - config:60-63

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
      bump minimum guc to 70.36.0
      replace busyness with engine activity

Rev4: add per-function per-engine-class activity
      fix review comments

Riana Tauro (8):
  drm/xe: Add per-engine-class activity support
  drm/xe/trace: Add trace for engine activity
  drm/xe/guc: Expose engine activity only for supported GuC version
  drm/xe/xe_pmu: Add PMU support for per-engine-class activity
  drm/xe/guc: Bump minimum required GuC version to v70.36.0
  drm/xe: Add support for per-function engine activity
  drm/xe/xe_pmu: Add pmu support for per-function engine activity stats
  drm/xe/pf: Enable per-function per-engine-class activity stats

 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/abi/guc_actions_abi.h      |   2 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   2 +
 drivers/gpu/drm/xe/xe_guc.c                   |   5 +
 drivers/gpu/drm/xe/xe_guc_engine_activity.c   | 500 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_engine_activity.h   |  20 +
 .../gpu/drm/xe/xe_guc_engine_activity_types.h |  95 ++++
 drivers/gpu/drm/xe/xe_guc_fwif.h              |  19 +
 drivers/gpu/drm/xe/xe_guc_types.h             |   4 +
 drivers/gpu/drm/xe/xe_pci_sriov.c             |  23 +
 drivers/gpu/drm/xe/xe_pmu.c                   | 158 +++++-
 drivers/gpu/drm/xe/xe_trace_guc.h             |  49 ++
 drivers/gpu/drm/xe/xe_uc.c                    |   3 +
 drivers/gpu/drm/xe/xe_uc_fw.c                 |  28 +-
 14 files changed, 886 insertions(+), 23 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity_types.h

-- 
2.47.1

