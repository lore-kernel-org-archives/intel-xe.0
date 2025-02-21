Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09C0C021AA
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 10:38:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CABB10E132;
	Fri, 21 Feb 2025 10:38:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N1UAWUpo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC5E410E132
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 10:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740134293; x=1771670293;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LPET5H4cmUX6804xeK7qjIgk5uCtuxO5I4SLoks7vts=;
 b=N1UAWUpoDDiSlZmYk0wDs4RcJjh7u3PUg+T2ssfTyT8Sxc9kpaPg1cnh
 WkctZaRfCVk377H2u8UFgYd0CCswp5fb6TaMEgfs3dk52oADUNsnT1+/6
 ENVuetzA7M0eKBx1mvOJWqiceeYE6WYmjesz5JP1b/KopzkXVplpzZAub
 3mjdtISC2IafJtPogLURG5bFEzRkVM3xl8w9ezPGdko70CTp9zoC6AXrm
 EQ4HdVQbChWPsxG0unAaCKYRGtPSjrb/aU2LGZFgxEjVJqnYcyUlWiSew
 J1g4yjhbgIeWbT4qqGUY6GD3GXa/twt8Cv2VySMSY1gMwSRrCxnV3LQN4 w==;
X-CSE-ConnectionGUID: m/O7bdEXQ6u71d/rqDA0MQ==
X-CSE-MsgGUID: k0pVIv6pSKCNrBlAqjaeyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40178185"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; d="scan'208";a="40178185"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 02:38:12 -0800
X-CSE-ConnectionGUID: iK+nZF1UQyeiYkZPJlgXaQ==
X-CSE-MsgGUID: JoGAmC3cTVizoFHzyejXsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; d="scan'208";a="120442359"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 02:38:10 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com
Subject: [PATCH v8 0/5] PMU support for engine activity
Date: Fri, 21 Feb 2025 16:29:02 +0530
Message-ID: <20250221105908.1966738-1-riana.tauro@intel.com>
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
        engine_class    - config:20-27
        engine_instance - config:12-19

The events can then be read using perf tool

        ./perf stat -e xe_<bdf>/engine-active-ticks,gt=<n>,engine_class=<n>,
                                engine_instance=<n>/,
                       xe_<bdf>/engine-total-ticks,gt=<n>,engine_class=<n>,
                                engine_instance=<n>/
                       -I 1000

Engine activity can then be calculated as below
engine activity % = (engine active ticks/engine total ticks) * 100

Test-with: 20250212095834.384508-1-riana.tauro@intel.com

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

Rev7: Split VF and Native

Rev8: add fw_ref to pmu event data

Riana Tauro (5):
  drm/xe: Add engine activity support
  drm/xe/trace: Add trace for engine activity
  drm/xe/guc: Expose engine activity only for supported GuC version
  drm/xe/xe_pmu: Add PMU support for engine activity
  drm/xe/xe_pmu: Acquire forcewake on event init for engine events

 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/abi/guc_actions_abi.h      |   1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   2 +
 drivers/gpu/drm/xe/xe_guc.c                   |   5 +
 drivers/gpu/drm/xe/xe_guc_engine_activity.c   | 373 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_engine_activity.h   |  19 +
 .../gpu/drm/xe/xe_guc_engine_activity_types.h |  92 +++++
 drivers/gpu/drm/xe/xe_guc_fwif.h              |  19 +
 drivers/gpu/drm/xe/xe_guc_types.h             |   4 +
 drivers/gpu/drm/xe/xe_pmu.c                   | 175 +++++++-
 drivers/gpu/drm/xe/xe_trace_guc.h             |  49 +++
 drivers/gpu/drm/xe/xe_uc.c                    |   3 +
 12 files changed, 734 insertions(+), 9 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity_types.h

-- 
2.47.1

