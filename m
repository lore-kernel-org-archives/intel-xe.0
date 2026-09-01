Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19116C61DE4
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 06:31:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE7BE10E30F;
	Tue,  1 Sep 2026 06:31:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BC/BqVpm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF7410E30F
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Sep 2026 06:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788244273; x=1819780273;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gPFueyaeT1cJ7PuVE/16q28ZHpqiTmzj4g3D2lUpp08=;
 b=BC/BqVpmredRd4UMr5Smgu8Kx2B4loLFDSqcbsAdvRwn3AQ0TIx5a5cr
 73+2aNFeRTRaljxwhqnCsMAfX3f9JrMgpijLOktPKQsckTQLhV2aRueC3
 AGpTSaO7K13Qm4bxrYXH8uxBxvcxQgB4Y/AErvAtTPMP/Sf68x2HwLk6j
 NIAPSvTcHbKZ5154PZxNNGsgpb41Eb73+ziL0/GL7x+ehSSxohdB1TurJ
 lDQU/6N87fObz5U4nsTKRRiZC6YJN787CycIU1nZy8hthqGskWytSOWBI
 /XyWFoGvxrZevmD39HDUqI6Bkwv5R/bR9YK0MNsB/P7m/eBYUAnfJLq3W A==;
X-CSE-ConnectionGUID: j3ZIjThMT7iji/xO1YQcBg==
X-CSE-MsgGUID: UO+XMcQ/QcSWvHPMOfR8kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88588869"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="88588869"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 23:31:12 -0700
X-CSE-ConnectionGUID: oDQJPvobQTmAeM4N2/wSmA==
X-CSE-MsgGUID: DApzIgIUQMqav+kNdR58Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="272791266"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 23:31:11 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, badal.nilawar@intel.com,
 michal.wajdeczko@intel.com, himal.prasad.ghimiray@intel.com,
 dnyaneshwar.bhadane@intel.com, mallesh.koujalagi@intel.com,
 matthew.brost@intel.com
Subject: [PATCH v6 0/4] drm/xe: Report GT TDR and VM rebind faults using SIGID
Date: Tue,  1 Sep 2026 12:00:55 +0530
Message-ID: <20260901063059.2547247-1-arvind.yadav@intel.com>
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

This series is a small follow-up on top of the structured SIGID error
logging infrastructure series:

https://patchwork.freedesktop.org/series/171022/

That series adds SIGID-based error reporting and the xe_log_*() helpers.
This series converts selected GuC submit, SVM page-fault and GT reset error
paths to that logging path.

The VM rebind conversion from earlier revisions remains dropped.

v6:
 - Moved GUCSUBMIT from DRIVER_FIRMWARE to DRIVER, since GuC submit
   is a driver submission component and not a firmware component.
   (Michal)
 - Updated the log message to print class/instance as %u:%u and
   reason as %#x. (Michal)

v5:
 - Dropped the GuC CGP protocol SIGID conversion, since malformed G2H
   handler errors are already reported by the CT layer after -EPROTO.
 - Added a GUCSUBMIT component mapped to XE_SIGID_GT_TDR and used it for
   the GuC submit reset failure.
 - Dropped "request" from the GuC submit reset failure message.
 - Kept the GT patch limited to the reset failure path.
 - Dropped GT PM-flow SIGID conversions for now, since the correct
   component/SIGID mapping needs agreement.
 - Improved the GT reset failure message to describe that full graphics
   reset did not complete.

v4:
 - Clarified that the GT component maps to XE_SIGID_GT_TDR and -EIO is
   only the errno value.
 - Split GuC CGP protocol error conversions into a separate patch.
 - Added terminal SVM page-fault allocation failures as MEM_FAULT reports.
 - Converted GT reset and power-flow failures to GT_TDR reports.
 - Kept the VM rebind conversion dropped.

v3:
 - Split GuC and VM changes into separate patches.
 - Dropped GuC job-timeout warning conversions to avoid changing warning
   logs into error-level SIGID reports.

v2:
 - Rebased on the latest structured SIGID logging series.
 - Switched from the old xe_ras_log_*() helpers to the new xe_log_*()
   helpers.

Arvind Yadav (4):
  drm/xe/log: Add GUCSUBMIT component
  drm/xe/guc: Report reset failure using SIGID
  drm/xe/svm: Report terminal page-fault failures using SIGID
  drm/xe/gt: Report GT reset failure using SIGID

 drivers/gpu/drm/xe/abi/xe_log_abi.h |  1 +
 drivers/gpu/drm/xe/xe_gt.c          |  4 ++--
 drivers/gpu/drm/xe/xe_guc_submit.c  |  6 ++++--
 drivers/gpu/drm/xe/xe_svm.c         | 13 +++++++------
 4 files changed, 14 insertions(+), 10 deletions(-)

-- 
2.43.0

