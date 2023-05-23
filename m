Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5EF1C77B7A
	for <intel-xe@archiver.kernel.org>; Tue, 23 May 2023 03:58:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD1810E3CB;
	Tue, 23 May 2023 03:58:37 +0000 (UTC)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB9D10E3CB
 for <intel-xe@lists.freedesktop.org>; Tue, 23 May 2023 03:58:35 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-64d2a87b9daso3498934b3a.0
 for <intel-xe@lists.freedesktop.org>; Mon, 22 May 2023 20:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684814314; x=1687406314;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SLTZQi5jh61CpKBwFzohxBpf+n3OwLYboDV2KHbfp10=;
 b=Mj02UgpKzMSrSDsSJZR+8KcfSBefCCLd+Eeflid9k80gToHee1hgPZOyhmhInnQtI5
 2wWUWcF8NoMfd8W1sYLGip4TUwDXLjpJrMeyxFzMIhu1WncFp/lwDU0Y/Pc9RchO/AWH
 8p2dPy6DHcJ3827DJdPEfGcH8Jo21Bu0nA/eRR7W40oYdkjdeSXxW7Q1SFhIg1zJfdDV
 XZZVk/iWVpUvMo8jJd/f2yXh7QifAzVfuvHjDThGdqU5z/BQz3UY5yWw11n9pxfQd3YE
 1Y09aafkVUUiDpgLqqPND71VTfxMoN6ot3Ka5hS5fXaY7i+YVtEFn7P22RpEYYZmca9E
 VIKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684814314; x=1687406314;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SLTZQi5jh61CpKBwFzohxBpf+n3OwLYboDV2KHbfp10=;
 b=Tk250L3clmeNNOJcAVSRqtysAqbL+OFOv+biQG5c045mxESz0pEHqM/MLpnLJZ3Agh
 jYYso2Ejxt2cYNKvJau4ylR2Xi8ojOngjDFU5oofLhBa62/ntIcDYQPpPiZ0Io/tmEU5
 NM7DGGxzl8OOUwHOjMQmmqk0iOld0HSnKtc+bu5PHo4YPOrJGlnalKpoTH4/o7I82lDf
 2L5bqpF+E9Uiv0U3kpBKeuIz0ZUwPxbsjuOhGNADTM5cRfG53Ee0A9xJzgvqyuHhcOGs
 XbAE4088c/v4V8kApmVKFaV4bNVFJRiiYZi6JvT7Oj1QpdkHq8IL7VjzFOPmR7UFLHvV
 KDxQ==
X-Gm-Message-State: AC+VfDz9Anq3AanXpVSeTTuRkMeDi4et2IhFKjFV3x3/2HLCBk8aYghi
 1jB982k802VSjrRHMic9GCu2XzDCR4oCSw==
X-Google-Smtp-Source: ACHHUZ7aF1KZWNUTIUMD4bRd/4H7+yk47IPSYOsJcVTLlnip/OSJ9FLqPVDcHcoY7c/ySdwGTKgndw==
X-Received: by 2002:a05:6a20:8e05:b0:ee:f290:5b5e with SMTP id
 y5-20020a056a208e0500b000eef2905b5emr14694445pzj.43.1684814314374; 
 Mon, 22 May 2023 20:58:34 -0700 (PDT)
Received: from mrgency.tuatara-tone.ts.net
 ([2600:6c51:4c3f:9541:841e:5ff:fea9:3053])
 by smtp.gmail.com with ESMTPSA id
 i6-20020aa78d86000000b006414289ab69sm4828615pfr.52.2023.05.22.20.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 20:58:33 -0700 (PDT)
From: Christopher Snowhill <kode54@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 22 May 2023 20:58:00 -0700
Message-Id: <20230523035808.635175-1-kode54@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/8] Scheduler changes for upstreaming
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

From: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>

First 8 patches of the follow series /w comments addressed:
https://patchwork.freedesktop.org/series/117156/

A follow up with submit a GuC doorbell series and a GPUVA series.

Revised-by: Christopher Snowhill <kode54@gmail.com>

Matthew Brost (8):
  fixup! drm/sched: Convert drm scheduler to use a work queue rather
    than kthread
  drm/sched: Move schedule policy to scheduler
  drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
  drm/xe: Use DRM_SCHED_POLICY_SINGLE_ENTITY mode
  drm/xe: Long running job update
  drm/xe: Ensure LR engines are not persistent
  drm/xe: Only try to lock external BOs in VM bind
  drm/xe: VM LRU bulk move

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  3 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c    |  5 +-
 drivers/gpu/drm/lima/lima_sched.c          |  5 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c       |  5 +-
 drivers/gpu/drm/panfrost/panfrost_job.c    |  5 +-
 drivers/gpu/drm/scheduler/sched_entity.c   | 87 +++++++++++++++----
 drivers/gpu/drm/scheduler/sched_fence.c    |  2 +-
 drivers/gpu/drm/scheduler/sched_main.c     | 88 ++++++++++++++++---
 drivers/gpu/drm/v3d/v3d_sched.c            | 25 +++---
 drivers/gpu/drm/xe/xe_bo.c                 | 32 ++++++-
 drivers/gpu/drm/xe/xe_bo.h                 |  4 +-
 drivers/gpu/drm/xe/xe_devcoredump_types.h  |  1 +
 drivers/gpu/drm/xe/xe_dma_buf.c            |  2 +-
 drivers/gpu/drm/xe/xe_engine.c             | 36 +++++++-
 drivers/gpu/drm/xe/xe_engine.h             |  4 +
 drivers/gpu/drm/xe/xe_exec.c               | 14 +++
 drivers/gpu/drm/xe/xe_execlist.c           |  3 +-
 drivers/gpu/drm/xe/xe_guc_engine_types.h   |  2 +
 drivers/gpu/drm/xe/xe_guc_submit.c         | 99 +++++++++++++++++++---
 drivers/gpu/drm/xe/xe_trace.h              |  5 ++
 drivers/gpu/drm/xe/xe_vm.c                 | 12 ++-
 drivers/gpu/drm/xe/xe_vm_types.h           |  3 +
 include/drm/gpu_scheduler.h                | 29 +++++--
 23 files changed, 391 insertions(+), 80 deletions(-)

-- 
2.40.1

