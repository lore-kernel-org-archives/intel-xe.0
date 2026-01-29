Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B310D73EA0
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 23:00:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 326E410E1EA;
	Thu, 29 Jan 2026 23:00:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ChHc3vxs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67A1910E1EA
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 23:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769727612; x=1801263612;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+6+ofwovX1gWt5UuNJwnpd6H0c6MkJsGpnoZSEIffPg=;
 b=ChHc3vxsiVC3yo0T1EX5BnTlL0cpWVVqblj+dZC6gzEp21kYlBxokAj0
 1F7TnJ99kskOxcUoVO3UfvRh/1Za5i05uzKAX1vnIuIc3CyO5dSZlxktR
 p0cpLbrb3ys39RitNSkHdthUiSRZiueWr+yx0coLJX6JcuUJBBU4Xu4Wc
 JzX2NY1SAAE0mxzuiBdkjukagF2kwmbt8o1Kjy2x/+fAbkB/l2yRhmjPi
 BjPm0H7hugSDYtSxJsbwfhaFce2JRTmdY4PJ8QxGxt+f1O8YK33Uz8Rzu
 CA5A3Ry46c2YdZpwTLetYmA3A7PnMNlfWLYWJ02WnhInfb84SgBu+hKVp A==;
X-CSE-ConnectionGUID: 8Z3Dvp0eQz601pjUWjynjg==
X-CSE-MsgGUID: IbZtopprQTaxYgLjzyGTPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="82089482"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="82089482"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 15:00:12 -0800
X-CSE-ConnectionGUID: iqBzSSG1RZOmA6EO4p21+Q==
X-CSE-MsgGUID: BQbHG8kDTJ2WqZdYS9P/xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="208715199"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa008.jf.intel.com with ESMTP; 29 Jan 2026 15:00:10 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH 0/3] Fix warning of kerneldoc
Date: Thu, 29 Jan 2026 22:56:07 +0000
Message-ID: <20260129225606.412902-5-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
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

Shuicheng Lin (3):
  drm/xe: Fix kerneldoc for xe_migrate_exec_queue
  drm/xe: Fix kerneldoc for xe_gt_tlb_inval_init_early
  drm/xe: Fix kerneldoc for xe_tlb_inval_job_alloc_dep

 drivers/gpu/drm/xe/xe_migrate.c       | 2 +-
 drivers/gpu/drm/xe/xe_tlb_inval.c     | 2 +-
 drivers/gpu/drm/xe/xe_tlb_inval_job.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.50.1

