Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36CDEC001DB
	for <intel-xe@archiver.kernel.org>; Mon,  7 Aug 2023 23:40:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D948010E05D;
	Mon,  7 Aug 2023 23:40:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED8410E05D
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Aug 2023 23:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691451627; x=1722987627;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=n5ccoF3Pzxt6o1ujSikFXJitMkntODgoIASF4dbZX0k=;
 b=X+SCpt5yKflg3Ic1p5PATsZ8Gr1z+K2u6uY3xayMWKDwIqU+DGpOno0k
 glj+TrqlrLN3PvgfbmMe5O+GJ8NzYHMmexTVBoWDAj1rhHkmdRKiS68Yw
 r20IfyOXDWnnKinD6KHqz+ALcJ5B3C6zSr9NrOZ52UsF4PGEp1XL/zJRH
 x8JL5ynakA7lloTLwbudMRUfj4jHwLX/kFtvR735FlFmCBAcJ7VHelokj
 YWRzIu9oiuLZuIwYazP1Abv91KwCktZEt8UoY1YUE/ZD319yo0wYPPeN2
 2/pxYwTkX9DnjST3h1lNtEleUwoBp188kgvAZdC0R8lcZ2w/exZby07Nx w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="401637464"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; d="scan'208";a="401637464"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 16:40:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="680998722"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; d="scan'208";a="680998722"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 16:40:26 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  7 Aug 2023 16:40:11 -0700
Message-ID: <20230807234014.960795-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/3] drm/xe: clean up kernel submissions
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

v2: rebase on s/XE_BUG_ON/XE_WARN_ON/ and s/engine/exec_queue/

Cc: Matthew Brost <matthew.brost@intel.com>

Daniele Ceraolo Spurio (3):
  drm/xe: fix submissions without vm
  drm/xe: split kernel vs permanent engine flags
  drm/xe: standardize vm-less kernel submissions

 drivers/gpu/drm/xe/xe_bb.c               | 10 ----------
 drivers/gpu/drm/xe/xe_bb.h               |  2 --
 drivers/gpu/drm/xe/xe_exec_queue.c       |  3 +++
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 22 ++++++++++++++--------
 drivers/gpu/drm/xe/xe_gt.c               | 23 +++++++----------------
 drivers/gpu/drm/xe/xe_guc_submit.c       | 15 ++++++++-------
 drivers/gpu/drm/xe/xe_migrate.c          |  7 +++++--
 drivers/gpu/drm/xe/xe_ring_ops.c         | 10 +++++-----
 drivers/gpu/drm/xe/xe_sched_job.c        |  9 +++++----
 9 files changed, 47 insertions(+), 54 deletions(-)

-- 
2.41.0

