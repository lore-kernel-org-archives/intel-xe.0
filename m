Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D9BC4167B
	for <intel-xe@archiver.kernel.org>; Tue, 31 Oct 2023 03:24:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E1E410E3E7;
	Tue, 31 Oct 2023 03:24:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84BE110E3E7;
 Tue, 31 Oct 2023 03:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698722694; x=1730258694;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3iMCoPFy5N9Ue/7HW9k+iLk+fUmJC98Gyw1XSlOc3KQ=;
 b=h/Mc7JFT+Z2aZtBtGK0Xcm1Dar7dlvHYxkr3lZg4aUl4X4fPPo8jqYB/
 jiFs5hbqs41M/UscalBird/VKgv9Cb0xYzWtHy61o5i76OBz6sDQBVmHt
 BA2KIc45Gaab7gmAUb3uciWvPtv4gfr5OknF9+/1Ry/Jxb+DB5eHd0ap/
 XuBUcIEIomBaEZAzLyYKxTfwQpAjHrdnCFmT1Ea4YA02VrcIB/GFUfIXo
 ljqEPfWe5pY6Zx0YV79HyrDHxBfqOcJRi/IHPJJXpFVGLaUZ/+u3xztyu
 yNMs+Nxxlj6toqcDeUbblrQCxNvPYdbq6uBY9sdOfIiPhLEaPZvy4ECb/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="392069016"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; d="scan'208";a="392069016"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 20:24:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="1660973"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 20:24:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Date: Mon, 30 Oct 2023 20:24:34 -0700
Message-Id: <20231031032439.1558703-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v8 0/5] DRM scheduler changes for Xe
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
Cc: robdclark@chromium.org, sarah.walker@imgtec.com, ltuikov@yahoo.com,
 ketil.johnsen@arm.com, Liviu.Dudau@arm.com, mcanal@igalia.com,
 frank.binns@imgtec.com, boris.brezillon@collabora.com, dakr@redhat.com,
 donald.robson@imgtec.com, daniel@ffwll.ch, lina@asahilina.net,
 airlied@gmail.com, christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

      As a prerequisite to merging the new Intel Xe DRM driver [1] [2], we
have been asked to merge our common DRM scheduler patches first.

This a continuation of a RFC [3] with all comments addressed, ready for
a full review, and hopefully in state which can merged in the near
future. More details of this series can found in the cover letter of the
RFC [3].

These changes have been tested with the Xe driver. Based on drm-tip branch.

A follow up series will be posted to address some of dakr requets for
kernel doc changes.

v2:
 - Break run job, free job, and process message in own work items
 - This might break other drivers as run job and free job now can run in
   parallel, can fix up if needed

v3:
 - Include missing patch 'drm/sched: Add drm_sched_submit_* helpers'
 - Fix issue with setting timestamp to early
 - Don't dequeue jobs for single entity after calling entity fini
 - Flush pending jobs on entity fini
 - Add documentation for entity teardown
 - Add Matthew Brost to maintainers of DRM scheduler

v4:
 - Drop message interface
 - Drop 'Flush pending jobs on entity fini'
 - Drop 'Add documentation for entity teardown'
 - Address all feedback

v5:
 - Address Luben's feedback
 - Drop starting TDR after calling run_job()
 - Drop adding Matthew Brost to maintainers of DRM scheduler

v6:
 - Address Luben's feedback
 - Include base commit

v7:
 - Drop SINGLE_ENTITY mode rather pull in Luben's patch for dynamic run queues
 - Address Luben's feedback for free_job work item patch

v8:
 - Rebase on drm-tip which includes Luben's patch for dynamic run queues
 - Don't adjust comments, change variable names, function names twice in series
 - Don't move existing code to different places in a file to preserve git history

Matt

[1] https://gitlab.freedesktop.org/drm/xe/kernel
[2] https://patchwork.freedesktop.org/series/112188/
[3] https://patchwork.freedesktop.org/series/116055/

Matthew Brost (5):
  drm/sched: Add drm_sched_wqueue_* helpers
  drm/sched: Convert drm scheduler to use a work queue rather than
    kthread
  drm/sched: Split free_job into own work item
  drm/sched: Add drm_sched_start_timeout_unlocked helper
  drm/sched: Add a helper to queue TDR immediately

 .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   |  15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  14 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c       |   2 +-
 drivers/gpu/drm/lima/lima_sched.c             |   2 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c    |   6 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c          |   2 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c       |   2 +-
 drivers/gpu/drm/panfrost/panfrost_job.c       |   2 +-
 drivers/gpu/drm/scheduler/sched_main.c        | 301 ++++++++++++------
 drivers/gpu/drm/v3d/v3d_sched.c               |  10 +-
 include/drm/gpu_scheduler.h                   |  20 +-
 12 files changed, 248 insertions(+), 130 deletions(-)


base-commit: b560681c6bf623db41064ac486dd148d6c103e53
-- 
2.34.1

