Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FEA4C4707B
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 17:32:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 241E610E610;
	Wed, 10 Jan 2024 17:32:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F5B10E610
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jan 2024 17:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704907975; x=1736443975;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vfNfrXExGbRiIdscm/HtKp7EtK053ET6Eewm8w/8weg=;
 b=ZYXH8YvABTvMtX4NYftqEGNPaq1ZmHdnD2E1yP4QYQzp0CVSuD4rgOj/
 3i03qjSbsEbWh9+GtL31nEifiijcqIr+WJySDDyhU/7IZz+cbd1wPWIc7
 J8ZwIBZGTsRsg0klbXTa1345NG6P/bIZC3auRSKVPgY16RaxEIwWDUw5l
 X4TmHKp5/fJCW8MF4o9ZHg88FlZhdypF9wYv7nCX/gwA1X2FAISeSVdzf
 rZ9SSzauOEsvTHJtfDfOAPu4ykLOoeBDsLJNxUij3qPRgiYccrsIQz68C
 CC23TbklyzSlcwvo58Hzr9OSmTuJB4dvdjZiR4slPQM767TGA3xPg7Weo g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="389026817"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="389026817"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 09:32:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="955435662"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="955435662"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 09:32:53 -0800
From: Brian Welty <brian.welty@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 0/4] Refactor xe_exec_queue_create to fix user extensions
Date: Wed, 10 Jan 2024 09:32:48 -0800
Message-ID: <20240110173252.16707-1-brian.welty@intel.com>
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

We have an issue in that exec_queue_user_extensions are applied too late.
In the case of USM properties, these need to be set prior to xe_lrc_init().

Split __xe_exec_queue_create() into two functions, alloc and init.
Setting of exec_queue user extensions is moved from the end of the ioctl
function earlier, into __xe_exec_queue_alloc(). This fixes above issue
with USM properties being set too late.

However, in order to apply user extensions this early, we can no longer
call q->ops functions.  Instead, make it more efficient. User extension
functions can simply update the q->sched_props values and they will be
applied by the backend during q->ops->init().

Note to reviewers, perhaps review patch #3 first.

v2: readability cleanup, added a patch to remove now unused
    exec_queue_ops.set_job_timeout_ms()
v3: rebased, sched_props.priority fixes and changes are already
    merged


Brian Welty (4):
  drm/xe: Refactor __xe_exec_queue_create()
  drm/xe: Add exec_queue.sched_props.job_timeout_ms
  drm/xe: Finish refactoring of exec_queue_create
  drm/xe: Remove set_job_timeout_ms() from exec_queue_ops

 drivers/gpu/drm/xe/xe_exec_queue.c       | 128 ++++++++++++++++-------
 drivers/gpu/drm/xe/xe_exec_queue.h       |   3 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |   4 +-
 drivers/gpu/drm/xe/xe_execlist.c         |   8 --
 drivers/gpu/drm/xe/xe_gsc.c              |   2 +-
 drivers/gpu/drm/xe/xe_gt.c               |   4 +-
 drivers/gpu/drm/xe/xe_guc_submit.c       |  18 +---
 drivers/gpu/drm/xe/xe_migrate.c          |   2 +-
 8 files changed, 98 insertions(+), 71 deletions(-)

-- 
2.43.0

