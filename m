Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C70CD4936
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 23:19:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1EDC10E44B;
	Wed, 20 Sep 2023 23:19:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 074D310E44B
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 23:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695251967; x=1726787967;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IfAtQtkK+CPPsIfrR+jn5g9wRR95w9P00QkeYF1sNAM=;
 b=GiSuvZPjo2Ac/Q5bzZMbZveRwSb+vYNsPnEqmPAm1E6y9tXWbjpjVUrr
 KG3Xp+k6z2IHXW8Xsgu6nlzxFR/P+1S9DwyLe/2/o8O1puX++4ZvcE6lT
 JHcjDqqqBsoa9IZDoScyZoWH7BMQhAUZdqc5fuUK2loyvASwLwtgVDcKB
 4qxIWF0nt4I6GqZ5Gl5TPeerH2f3npljrIeObPcxB4m71umHfkXe9E3NF
 IsbdEvUKWGmDyx5051mtdXdGk9xbaRk07XLsCP3LGgQfyPoqKusB3icHO
 xAmdFERyAMhWf6nW4s4DUAOS5wP/EIcDdTDSy3NiWTLrfb+BKyMqXaVUP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="379246335"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="379246335"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 16:19:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="776194905"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="776194905"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 16:19:25 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 20 Sep 2023 16:19:41 -0700
Message-Id: <20230920231942.2706278-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 0/1] DRM scheduler update
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

Update DRM scheduler in Xe to latest upstream post [1].

Want feedback on introducing Xe scheduler layer. This looks to be
required as Xe must implement the message interface rather than the DRM
scheduler [2].

Matt

[1] https://patchwork.freedesktop.org/series/121745/#rev6
[2] https://patchwork.freedesktop.org/patch/556934/?series=121745&rev=5

Matthew Brost (1):
  drm/xe: Update to upstream DRM scheduler code

 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c  |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c   |   2 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c      |   2 +-
 drivers/gpu/drm/lima/lima_sched.c            |   2 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c   |   4 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c         |   2 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c      |   2 +-
 drivers/gpu/drm/panfrost/panfrost_job.c      |   2 +-
 drivers/gpu/drm/scheduler/sched_entity.c     |   6 +-
 drivers/gpu/drm/scheduler/sched_main.c       | 471 ++++++++++---------
 drivers/gpu/drm/v3d/v3d_sched.c              |  10 +-
 drivers/gpu/drm/xe/Makefile                  |   1 +
 drivers/gpu/drm/xe/xe_gpu_scheduler.c        | 102 ++++
 drivers/gpu/drm/xe/xe_gpu_scheduler.h        |  75 +++
 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h  |  58 +++
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |   8 +-
 drivers/gpu/drm/xe/xe_guc_submit.c           | 142 +++---
 drivers/gpu/drm/xe/xe_trace.h                |  13 +-
 include/drm/gpu_scheduler.h                  |  54 +--
 19 files changed, 599 insertions(+), 365 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_gpu_scheduler.c
 create mode 100644 drivers/gpu/drm/xe/xe_gpu_scheduler.h
 create mode 100644 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h

-- 
2.34.1

