Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D403C5479A
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 20:18:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5AD610E094;
	Thu, 17 Aug 2023 20:18:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 436B910E430
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Aug 2023 20:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692303523; x=1723839523;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xi4tVGq8v4FisQbXSRwisrZ14m4scbZ+Wh6pjELw/AY=;
 b=Ja4qictyFfT3xughstzf2GpLx852paNKC4cKFB+RL5y1Ckh8Xu6cDuj+
 EpA4JWIims4XO9w4qXwhF8K8Rkko/+gn+oLNJp1jK+sOuKkFrNc04lm3q
 AMq9T3lXwLHINZjREqdC9rbWhXrkSk/cHfvCk0KdAB+tdwEZ09zA8Xi6c
 RO97v/UDL0E997R4MdUbWfQdVw5C80CZQwY6QbM0Sw8Qd9Woh/vDjwRcq
 adi9blUw2N/V1w+fmNNhor0JILbXT3Cwa/TtFxzFSWTPTHfKQVu83V+qu
 FOC+1+jw0yvQSXA9nbuQd/s1llKTz6R70n6Zb8ZwM3af0ViLeJF4KlDRT A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="363077707"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="363077707"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 13:18:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="878379274"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 13:18:44 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 17 Aug 2023 13:18:24 -0700
Message-ID: <20230817201831.1583172-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/7] Add plumbing for submitting to the GSCCS
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The GSCCS is used to load and communicate with the GSC FW. This series
adds all the required defines and functions to submit to the GSCCS. Note
that the GSCCS is not added to the list of available engines as part
of these changes because we have no use of it until we add support for
the GSC FW (which will come in a separate series after this one is
merged).

v2: add bspec tags, fix reg definition ordering (Matt), add one more
patch to enable gsc engine idleness.

Cc: Vivaik Balasubrawmanian <vivaik.balasubrawmanian@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>

Daniele Ceraolo Spurio (7):
  drm/xe: common function to assign queue name
  drm/xe: base definitions for the GSCCS
  drm/xe: add GSCCS irq support
  drm/xe: add GSCCS ring ops
  drm/xe: GSC forcewake support
  drm/xe: don't expose the GSCCS to users
  drm/xe: enable idle msg and set hysteresis for GSCCS

 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  4 ++++
 drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  5 +++++
 drivers/gpu/drm/xe/regs/xe_regs.h        |  1 +
 drivers/gpu/drm/xe/xe_exec_queue.c       | 26 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_exec_queue.h       |  1 +
 drivers/gpu/drm/xe/xe_execlist.c         | 20 +-----------------
 drivers/gpu/drm/xe/xe_force_wake.c       |  7 ++++++
 drivers/gpu/drm/xe/xe_guc.h              |  1 +
 drivers/gpu/drm/xe/xe_guc_ads.c          |  8 ++-----
 drivers/gpu/drm/xe/xe_guc_submit.c       | 20 +-----------------
 drivers/gpu/drm/xe/xe_hw_engine.c        | 27 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine_types.h  |  2 ++
 drivers/gpu/drm/xe/xe_irq.c              | 25 ++++++++++++++++------
 drivers/gpu/drm/xe/xe_lrc.c              |  1 +
 drivers/gpu/drm/xe/xe_ring_ops.c         | 26 ++++++++++++++++++-----
 15 files changed, 118 insertions(+), 56 deletions(-)

-- 
2.41.0

