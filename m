Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B78C46CD2
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jan 2024 21:17:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41FF510E216;
	Tue,  2 Jan 2024 21:17:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD87B10E21E
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jan 2024 21:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704230251; x=1735766251;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DLHYpZuqu2qqqU21nJNCsSX9e9jl7TZU1/1FfPlCfKE=;
 b=d4SxdlKOztwlSP2ILSQDyEROSPZNkcCHa3gUp8kVU3GLc+2Eicm82NAy
 dVOJsvqbChRFgxKJrs0q4bEz9tSSO4WwS7tKikJJvqIQmoG2ylmsRNxq/
 oNpuuhkMTiBGJlyMStShQdh0boYhFxkRwB6ANP2yN5gIHTGNrwdG2EFCE
 06uRcKrvpICga0q0Z0OBnZDH5yFd6GGSoMhwvVZjzsXLMTZAtMOiiQ+In
 BPUAvde+H/4GNZ6hs7XzlVRhLbNAq0WWDBXji2+ZbSmt28akbf/gZV9ET
 d1abtITR/F57r64PTY3VTuLFuF+L1dHQFXQZoxdG3dufsc8bScGgX59D9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="396654454"
X-IronPort-AV: E=Sophos;i="6.04,326,1695711600"; d="scan'208";a="396654454"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 13:17:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="898648787"
X-IronPort-AV: E=Sophos;i="6.04,326,1695711600"; d="scan'208";a="898648787"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 13:17:31 -0800
From: Brian Welty <brian.welty@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/4] Refactor xe_exec_queue_create to fix user extensions
Date: Tue,  2 Jan 2024 13:17:27 -0800
Message-ID: <20240102211731.6720-1-brian.welty@intel.com>
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


Brian Welty (4):
  drm/xe: Refactor __xe_exec_queue_create()
  drm/xe: Add exec_queue.sched_props.job_timeout_ms
  drm/xe: Add exec_queue.sched_props.priority
  drm/xe: Finish refactoring of exec_queue_create

 drivers/gpu/drm/xe/xe_exec_queue.c       | 129 ++++++++++++++++-------
 drivers/gpu/drm/xe/xe_exec_queue.h       |   3 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |   6 +-
 drivers/gpu/drm/xe/xe_gsc.c              |   2 +-
 drivers/gpu/drm/xe/xe_gt.c               |   4 +-
 drivers/gpu/drm/xe/xe_guc_submit.c       |  10 +-
 drivers/gpu/drm/xe/xe_migrate.c          |   4 +-
 7 files changed, 106 insertions(+), 52 deletions(-)

-- 
2.43.0

