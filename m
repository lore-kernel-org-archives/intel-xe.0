Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA31EC61DBD
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 09:58:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 472FF10E44D;
	Fri, 28 Aug 2026 09:58:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GTLNxbdG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D502D10E44D
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 09:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787911095; x=1819447095;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MuaKXMc5Nx/oArrd80hMU5pTjwj/4YONMq3+a1bBXdY=;
 b=GTLNxbdGLXQhdxBUPMrR1th/3GiQRYbFJ0CdIf/zBX/zaPRvkqqnGn4L
 z5Q1Sfh7avxgKrb8tfZDie77Lpd7ZibUptD8cn3ouo22rfYRt3zzoxWN8
 oqu30fAFjL48k5n6S1bsqBgXtOIqeFEsGcBQXwcPqrLzH4gFlv43GE6Xq
 H6S4NiNKaIbl1VZs98Lq3T3/9gyTJ1R6Ul14gd5kpzkZBnQVl3/5T34P2
 bkYxw5gpL+FJphlLFSkNivgN2O6EPBNUORj2KMfzxH8BLTBYf2cWTd1zF
 rw/v6gy5zE4NePyk+8s39iDcTEnN2dHxZQaNl0QLV2/CGAwqK3HS5XY5S w==;
X-CSE-ConnectionGUID: f3R0raTxQoep8CO24rVzKg==
X-CSE-MsgGUID: dp44Jdh3S3icRZcTGp0V6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="99084935"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="99084935"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 02:58:15 -0700
X-CSE-ConnectionGUID: PeUe+97nTqapb1URIZiNUA==
X-CSE-MsgGUID: 1nefoVglRy6sRy2DatubhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="272338890"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 02:58:13 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, badal.nilawar@intel.com,
 michal.wajdeczko@intel.com, himal.prasad.ghimiray@intel.com,
 dnyaneshwar.bhadane@intel.com, mallesh.koujalagi@intel.com,
 matthew.brost@intel.com
Subject: [PATCH v4 0/4] drm/xe: Report GT TDR and VM rebind faults using SIGID
Date: Fri, 28 Aug 2026 15:27:59 +0530
Message-ID: <20260828095803.2130312-1-arvind.yadav@intel.com>
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
This series converts selected GuC, SVM page-fault and GT reset/power error
paths to that logging path.

The VM rebind conversion from earlier revisions remains dropped.

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
  drm/xe/guc: Report reset-request failure using SIGID
  drm/xe/guc: Report CGP protocol errors using SIGID
  drm/xe/svm: Report terminal page-fault failures using SIGID
  drm/xe/gt: Report GT reset and power failures using SIGID

 drivers/gpu/drm/xe/xe_gt.c         | 13 ++++++-------
 drivers/gpu/drm/xe/xe_guc_submit.c | 15 ++++++++-------
 drivers/gpu/drm/xe/xe_svm.c        | 13 +++++++------
 3 files changed, 21 insertions(+), 20 deletions(-)

-- 
2.43.0

