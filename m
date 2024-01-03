Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D33BC3DA6E
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jan 2024 18:44:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BAB810E0BA;
	Wed,  3 Jan 2024 18:44:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E88910E0BA
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jan 2024 18:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704307449; x=1735843449;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RYmyZcQwYcDQrmjsP4D1cIohcdSpkjSh147z1EV8Zf0=;
 b=hXSh+NfcEzfMP2A8h+gySYws1MG2eO3HfPJEaFf0fn/WLmqI/afGIsYe
 8Ie+KpPzNNAuN1HT4Mh588FxLrkKrdb9xPXRMJuWK465Td+tVkdNynR0h
 JTsWSLX9iondErCgEYgN6SsHDzx+uI4cMSgtiEJcYG0dYGjOkMYJCdlyx
 WXoXAXrk4fh0a9AuMHdMam9ydw26Cz9EL/eyZwUdU0evGDRsmsQN2NngQ
 qDBYBXIv9wlIjrx2kpw5TYtQ7tH29wpLRNXGuqOE40qXoSN89i1ZbCRLQ
 1DUZRCyrtKUpiOZQMvt/+6awrhpW1Z5uvgD4JJow6uPfyohVvwNhI258r w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="3815681"
X-IronPort-AV: E=Sophos;i="6.04,328,1695711600"; 
   d="scan'208";a="3815681"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 10:44:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="814330121"
X-IronPort-AV: E=Sophos;i="6.04,328,1695711600"; d="scan'208";a="814330121"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 10:44:08 -0800
From: Brian Welty <brian.welty@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 0/5] Refactor xe_exec_queue_create to fix user extensions
Date: Wed,  3 Jan 2024 10:44:03 -0800
Message-ID: <20240103184408.17844-1-brian.welty@intel.com>
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

Note to reviewers, perhaps review the last patch first.

v2: changes noted in patches, added a patch 5 to remove now unused
    exec_queue_ops.set_job_timeout_ms()


Brian Welty (5):
  drm/xe: Refactor __xe_exec_queue_create()
  drm/xe: Add exec_queue.sched_props.job_timeout_ms
  drm/xe: Add exec_queue.sched_props.priority
  drm/xe: Finish refactoring of exec_queue_create
  drm/xe: Remove set_job_timeout_ms() from exec_queue_ops

 drivers/gpu/drm/xe/xe_exec_queue.c       | 129 ++++++++++++++++-------
 drivers/gpu/drm/xe/xe_exec_queue.h       |   3 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |   8 +-
 drivers/gpu/drm/xe/xe_execlist.c         |   8 --
 drivers/gpu/drm/xe/xe_gsc.c              |   2 +-
 drivers/gpu/drm/xe/xe_gt.c               |   4 +-
 drivers/gpu/drm/xe/xe_guc_submit.c       |  25 +----
 drivers/gpu/drm/xe/xe_migrate.c          |   4 +-
 8 files changed, 105 insertions(+), 78 deletions(-)

-- 
2.43.0

