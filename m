Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D21FECA0FF9
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 17:22:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9151110E1F1;
	Fri, 29 Aug 2025 17:22:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J2CUrhoI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C2B010E1E0
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 17:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756488156; x=1788024156;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=i62A8D70yE696RVD8SpR25Drr/JOwMhFILUGBL17tyc=;
 b=J2CUrhoIjSFEqPTjatrPKAxIWpD/GyhRsj79mShc5pOsxTLVyHKIJWkV
 rpDugWknp/gCosD43eJd592h200ccgJS4UoOWyqDhOgvBekp8d8P/qTxF
 r/Iuv8gNloNsaqGhTvStTVx1c+0uH2drEc6h3Ievos9WJAlv/c9+SLyI1
 +A3bNAF6xgF4L/1nihzZRLnmVrWsy1HowfedF9XoOyoYNY9LwL2aXkFBx
 jKb9G+6le9hJhg1Sos304KmTxC9X19af/dRlHlmAW9iDnVDEFMYdzUAEN
 vXEUjLqeW5nh9Lhzq4DPnlo2Trxh/PGusJrAdQkVCFYi2nJFdQjr4jzt+ g==;
X-CSE-ConnectionGUID: bdB7EWMYReak58Xb54OYmg==
X-CSE-MsgGUID: MIcz5kgcRz26lvLOMdo2MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="57805135"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="57805135"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 10:22:36 -0700
X-CSE-ConnectionGUID: 6zP3EfGKSMqbhh5QtPfsEA==
X-CSE-MsgGUID: 5Odpd/QZRX+a7nEKFy9Iyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="170597596"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 10:22:36 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v7 0/2] Enhance SVM stats
Date: Fri, 29 Aug 2025 10:22:30 -0700
Message-Id: <20250829172232.1308004-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Add ability to clear GT stats and add more SVM stats for profiling.
Scripts should be able to be built on top of stats to breakdown time
spent in parts of the SVM page fault handler, bandwidth of copy engine,
etc... Will help showing concrete performance improvements when
implementing SVM optimizations.

Open suggestions of more stats. Prefetch not considered - can be done in
a follow up.

Scritpt to parse stats for reference: https://pastebin.com/rZZN5sgh

v2:
 - Include local changes missed in first rev
v3:
 - More stats after putting together script to parse
v4:
 - Rebase
v5:
 - Rebase
 - Drop clear_stats entry
v6:
 - Rebase
 - Address Michal's comments
v7:
 - Add macro to define stats strings (Michal)

Matthew Brost (2):
  drm/xe: Add clearing stats to GT debugfs
  drm/xe: Add more SVM GT stats

 drivers/gpu/drm/xe/xe_gt_debugfs.c     |  20 ++-
 drivers/gpu/drm/xe/xe_gt_stats.c       |  57 +++++++-
 drivers/gpu/drm/xe/xe_gt_stats.h       |   1 +
 drivers/gpu/drm/xe/xe_gt_stats_types.h |  33 +++++
 drivers/gpu/drm/xe/xe_svm.c            | 194 +++++++++++++++++++++++--
 5 files changed, 291 insertions(+), 14 deletions(-)

-- 
2.34.1

