Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 109FCC761AF
	for <intel-xe@archiver.kernel.org>; Sun,  2 Apr 2023 02:41:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BF3010E03D;
	Sun,  2 Apr 2023 02:41:43 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB13410E03D
 for <intel-xe@lists.freedesktop.org>; Sun,  2 Apr 2023 02:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680403300; x=1711939300;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x1CVbkuTSUSoiJYp7UB+saPkiymfYXT5Bswpy1B7qfs=;
 b=IiJ21DZu7iwhyBy/iAyKFERHSEV6gEl7aNV4xXJG+TVOgAutvhDFJfp2
 6tiolWZehyV8FNR6WBx44X0jlZKTg+uM8tptVo0hPG1QQmodV+7Nxd84O
 5VqtpQfL1gEqNY0kLwR8QVP7KdPgIJhXJhGywT3afQtbOyiauLAJ4utwx
 ilHeuS7+YwZKVEiaim/IpAmyPhDu21bR7YWfa265fn/cawe/QsYthFkHp
 w2LUGPKhANu/tjemy0Jnzg0XXG/X/qsAGpewFM8OKzqlcDRDLuTz+aB4T
 K6x2aP3EI6nfk7sfoOh9dT6JQZJm5HgdKg7D58dXaftxzm6ymmSDC533h A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="341715410"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; d="scan'208";a="341715410"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2023 19:41:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="715869805"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; d="scan'208";a="715869805"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2023 19:41:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Sat,  1 Apr 2023 19:41:42 -0700
Message-Id: <20230402024145.2572923-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 0/3] Upstream DRM scheduler policy story
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

I'm thinking we include these patches in addition to the 5 scheduler
patches initially submitted in [1]. Also missing is passing in run_wq
into the drm_sched_init functions, that will included by modifying [2].

Let's review these internally and reach a consensus if this what we want
to send upstream for our DRM scheduler story wrt to a 1 to 1
relationship between scheduler and entity.

Another thing to consider is if we want to include [3] in our upstream
DRM scheduler post for our long running workload story.

Matt

[1] https://patchwork.freedesktop.org/series/112188/
[2] https://patchwork.freedesktop.org/patch/515854/?series=112188&rev=1
[3] https://gitlab.freedesktop.org/drm/xe/kernel/-/merge_requests/338

Matthew Brost (3):
  drm/sched: Move schedule policy to scheduler / entity
  drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
  drm/xe: Use DRM_SCHED_POLICY_SINGLE_ENTITY mode

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  1 +
 drivers/gpu/drm/etnaviv/etnaviv_sched.c    |  3 +-
 drivers/gpu/drm/lima/lima_sched.c          |  3 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c       |  3 +-
 drivers/gpu/drm/panfrost/panfrost_job.c    |  3 +-
 drivers/gpu/drm/scheduler/sched_entity.c   | 83 +++++++++++++++++----
 drivers/gpu/drm/scheduler/sched_fence.c    |  2 +-
 drivers/gpu/drm/scheduler/sched_main.c     | 85 ++++++++++++++++++----
 drivers/gpu/drm/v3d/v3d_sched.c            | 15 ++--
 drivers/gpu/drm/xe/xe_execlist.c           |  1 +
 drivers/gpu/drm/xe/xe_guc_submit.c         |  3 +-
 include/drm/gpu_scheduler.h                | 52 +++++++++----
 12 files changed, 199 insertions(+), 55 deletions(-)

-- 
2.34.1

