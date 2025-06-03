Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED779C5B559
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 23:33:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E3A10E228;
	Tue,  3 Jun 2025 23:33:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dTkLWiEO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3BF910E0BC
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 23:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748993596; x=1780529596;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=A+Z16N7UpvfnxFEktJkYo3nnR61HyxSKCs8T0E4Yi38=;
 b=dTkLWiEOrCAhTeiVa+sezCGW1+lSxeVDm463oPkYt+eZS9lZ+4F01qXL
 rHFW7one1erNIiTHZ7ZNGGJN7aysM9gJc8ktl9yF0kXa1thFtHo2oPwnM
 AOlMe6lGUArfU4dtpLpiBHHPlV9GdTxJP/zyuNGdIZC4KAW3o3LjWqcA+
 ik/D7G3Ld7zie7DuxgIC82KXsnK+KTX0vpCbqwZ9KLLKlX5LYQ1FXjumh
 UR7Wc5Ogd6mnOnNJtgywlXhMRpnAbAxfpRB9bwt8CHqQlgpZX2zuaQ+RS
 R/yDBe4wjtZKJScah1Ama+wRDuySj3vRcUDkx9lUJchClKnWMQD9ts9a5 w==;
X-CSE-ConnectionGUID: aroB9n+cTBaPzyA7TtL99w==
X-CSE-MsgGUID: N81bxuAoRlSuo6KdJvydoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="51152108"
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="51152108"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 16:33:14 -0700
X-CSE-ConnectionGUID: fvpl6zCTR3O5YdoiXvZw4Q==
X-CSE-MsgGUID: NnwAyR+rSsGOtGN2qYbl5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="150299195"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 16:33:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.mrozek@intel.com, francois.dugast@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com
Subject: [PATCH v3 0/2] Enhance SVM stats
Date: Tue,  3 Jun 2025 16:34:43 -0700
Message-Id: <20250603233445.2304383-1-matthew.brost@intel.com>
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

v2:
 - Include local changes missed in first rev
v3:
 - More stats after putting together script to parse

Matthew Brost (2):
  drm/xe: Add clear_stats GT debugfs
  drm/xe: Add more SVM GT stats

 drivers/gpu/drm/xe/xe_gt_debugfs.c     |  22 ++
 drivers/gpu/drm/xe/xe_gt_stats.c       |  47 +++++
 drivers/gpu/drm/xe/xe_gt_stats.h       |   1 +
 drivers/gpu/drm/xe/xe_gt_stats_types.h |  33 +++
 drivers/gpu/drm/xe/xe_svm.c            | 274 ++++++++++++++++++++++++-
 5 files changed, 369 insertions(+), 8 deletions(-)

-- 
2.34.1

