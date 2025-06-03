Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF926C5AE59
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 18:40:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B20D10E688;
	Tue,  3 Jun 2025 18:40:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WTmE12zF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD0DA10E610
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 18:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748976013; x=1780512013;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rBQbOgY+OZkVIW9R2I3c8YKnLn8yvXJQwcvfZ7XXEC4=;
 b=WTmE12zFhldbiwSY5wlFzSmMrw38PfgB5h5vn6e68A4smPUyXiZcrPIP
 VWOy4LLzizZ82+oZCc5dW9rDhafGoGQiiAEvnHIIK7ZKiBFvC/fe6YDC7
 7mea3QewjsTTvvf22lZIaeamtMUkHnWkfp5LjbmmyjUEY/Swe4ITXYZzL
 BzDbzfpLJPSR9O9T/IRXnlji3KIc35cWDA+UoMvjfS7M5MqI8xNSXOAR+
 IzkfNECLh3KD3Q+AaMjtdq6VKGltcr4ta/dstLOCakJ45jJlIYZa1MqlO
 3GczCtVRMFY5G9eivTd7ZumI52Mz6qNQWvBlSY1OPrreJcOsy/Ia1ZiUH A==;
X-CSE-ConnectionGUID: C73G6GLkRD6Q1AE/U+hgYA==
X-CSE-MsgGUID: lylV5XayRo2fWY/S7V8VvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="50902704"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="50902704"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 11:40:13 -0700
X-CSE-ConnectionGUID: JqeUOK8BTH6/jvhcmBSpjQ==
X-CSE-MsgGUID: fgXzLcT0RJqLsOIq9VPvqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="149834962"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 11:40:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.mrozek@intel.com, francois.dugast@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com
Subject: [PATCH 0/2] Enhance SVM stats 
Date: Tue,  3 Jun 2025 11:41:31 -0700
Message-Id: <20250603184133.2215422-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Matthew Brost (2):
  drm/xe: Add clear_stats GT debugfs
  drm/xe: Add more SVM GT stats

 drivers/gpu/drm/xe/xe_gt_debugfs.c     |  22 +++
 drivers/gpu/drm/xe/xe_gt_stats.c       |  36 +++++
 drivers/gpu/drm/xe/xe_gt_stats.h       |   1 +
 drivers/gpu/drm/xe/xe_gt_stats_types.h |  22 +++
 drivers/gpu/drm/xe/xe_svm.c            | 202 ++++++++++++++++++++++++-
 5 files changed, 275 insertions(+), 8 deletions(-)

-- 
2.34.1

