Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2581C0015E
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jul 2023 19:00:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B3810E5DE;
	Thu, 27 Jul 2023 19:00:12 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E887110E5DE
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jul 2023 19:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690484410; x=1722020410;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=45ZXOwcPbpS20SJnZl03bdhXfOh7kFDqhwLqV2KnbzI=;
 b=hLnp71+JNoPYNJMoySFg8BqUgOkRnIbsJZFTSdCy0UiIFMRvTDnQDt/H
 ZNdkgofXbJy+XpSx5ZI2AOL53XKPZSyvSZbB3UyJjcSBRzyGmoplC40WN
 tWRk+OKe0YZer8h+MJR3ZQXBj05liJSnWW/t6+RGwLwx+jn0XG2D4vrFt
 8Id1GiV2pedq84b2xnrY+IcuQ9+vlgnvJfQY4zDc8KNDlSKy09SgO13WE
 c8oJoxNnzNy8rB4jW/dqpLQ3HO0ony8ZYXG/VGMZQ6refOfumzJMtGjMW
 giTGP9CGSLmDbBK+/wxwWLEx26jPeAcUXSKgvZx1hA1VherVaWs+JvRWM A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="348681568"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="348681568"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 12:00:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="727127082"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="727127082"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 12:00:08 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 27 Jul 2023 11:59:42 -0700
Message-ID: <20230727185945.401047-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/3] drm/xe: clean up kernel submissions
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

A few fixes/improvements to kernel submissions, in preparation for more
use-cases coming with GSC and PXP. The aim is to have a generic way to
submit kernel workloads without having to special-case them (migration
aside).

Note: these patches can probably be all considered fixups of the intial
Xe driver introduction. I'm keeping them separate for now for review,
but I'm not sure if it is better to merge them as fixups or not.

Cc: Matthew Brost <matthew.brost@intel.com>

Daniele Ceraolo Spurio (3):
  drm/xe: fix submissions without vm
  drm/xe: split kernel vs permanent engine flags
  drm/xe: standardize vm-less kernel submissions

 drivers/gpu/drm/xe/xe_bb.c           | 10 ----------
 drivers/gpu/drm/xe/xe_bb.h           |  2 --
 drivers/gpu/drm/xe/xe_engine.c       |  3 +++
 drivers/gpu/drm/xe/xe_engine_types.h | 18 ++++++++++++------
 drivers/gpu/drm/xe/xe_gt.c           | 23 +++++++----------------
 drivers/gpu/drm/xe/xe_guc_submit.c   | 14 +++++++-------
 drivers/gpu/drm/xe/xe_migrate.c      |  4 ++--
 drivers/gpu/drm/xe/xe_ring_ops.c     | 10 +++++-----
 drivers/gpu/drm/xe/xe_sched_job.c    |  9 +++++----
 9 files changed, 41 insertions(+), 52 deletions(-)

-- 
2.41.0

