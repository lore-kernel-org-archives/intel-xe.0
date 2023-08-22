Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD00EE49AE
	for <intel-xe@archiver.kernel.org>; Tue, 22 Aug 2023 17:33:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4225510E3BC;
	Tue, 22 Aug 2023 17:33:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E6410E3BC
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Aug 2023 17:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692725624; x=1724261624;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rY1PPC/qixq8axpMmX17GcW5bFGQHoVevKMQj01Pk2Y=;
 b=iH/cW7vZBt7YEo7dbvujyeaZycN93k5z0nGvsiR01/d6PFI6y8D9zIua
 i4+lmeJeSzko00LMjNYl2zcokQjamcOuq/4Y6TUBPVyeuY7qq4lMAgUrK
 ZBVDbbS/WypTOi/YhB4mw9kh6eqGMv7tGn50V2BD2WZa1mTysO4TJf1Zp
 JRJUB8L/+jfkMbAnoJ3UXMuWY/cx9w8BDguIs1LVy63wsDy0VS4rVCVWg
 BVKBTzhceMmuUdEbvMkAJj1JnxpyePPbQkXc9qiBXMMr4Lh/wYRxrNil5
 Cwmpvx5FEci3cAis6OVZ2W2XKDK9LySDfR0v5DB/O0kqQuJU4S4fRVaup Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="376685265"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="376685265"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 10:33:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="860009003"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="860009003"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 10:33:43 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 22 Aug 2023 10:33:31 -0700
Message-ID: <20230822173334.1664332-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 0/3] drm/xe: clean up kernel submissions
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
v3: rebased on changes in guc_exec_queue_fini_async

Note: I've kept the r-bs since the rebases were trivial.

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
 drivers/gpu/drm/xe/xe_guc_submit.c       |  8 ++++----
 drivers/gpu/drm/xe/xe_migrate.c          |  7 +++++--
 drivers/gpu/drm/xe/xe_ring_ops.c         | 10 +++++-----
 drivers/gpu/drm/xe/xe_sched_job.c        |  9 +++++----
 9 files changed, 43 insertions(+), 51 deletions(-)

-- 
2.41.0

