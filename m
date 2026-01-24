Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B491D715EC
	for <intel-xe@archiver.kernel.org>; Sat, 24 Jan 2026 14:54:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2EF810E339;
	Sat, 24 Jan 2026 14:54:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="WQ1igFLj";
	dkim-atps=neutral
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C8310E2C6
 for <intel-xe@lists.freedesktop.org>; Sat, 24 Jan 2026 14:54:37 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-4359228b7c6so1962831f8f.2
 for <intel-xe@lists.freedesktop.org>; Sat, 24 Jan 2026 06:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1769266476; x=1769871276; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GcLRdckqL2bDQQnlnn9F4YkmRBDwOQT2WMgK3WpAXVM=;
 b=WQ1igFLjJWy8BFkt/n0IBIgiN+z4P5NS966WyVmCRLIQOAzFpoAMGkvKBT3orldQ62
 H2LgjkMndWjlQuVPPt2gqVUzcRA5muN5HcOFr4P7Id53aibpVgJBgeE0fqAts8FvFkSf
 TF3n4jrigUdP9eX8xSdq4BVICKHojHlq1Tu3z6PnOMhcwjMSbgLQNuN1d08p03kKWJ0f
 X5DaSU/i2p/TMD2IIuVXE7sWeGce4FEzrS38dcqFHjnwFOvpVPzbezVcSi8HBzAXXEgS
 RGotaluxG3zDxOuwmscFUnaU/tQsDCAklFRHbIghIgTwuOe2rYkh1uROTIVDeNV2gckX
 E69A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769266476; x=1769871276;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GcLRdckqL2bDQQnlnn9F4YkmRBDwOQT2WMgK3WpAXVM=;
 b=FxZLxgVxEzuiBYj5dgXrhIELbVpdF18+RgUl0Fc3P80eGvmj1y6GyXHZuaJbaaxVNV
 CvlAKVRt15ZJWIHwdk0Patryd7TbqcgMAN/UWGT0JUbwtP0mIdo0vhhO74hLuxwtzNPW
 b9Y59e8L4iiL0utsFr43iZyS8a1j/rV5qeZ4NM9KT+jfYUQjTxu2nv3ec/FLthMxEc9m
 oAtMMKOnB3i0r/oAZfso55Loqbkts8K2jIfGYRxLVrZXbZN5a//afEnHet/VTqKxw7G3
 wu1lmbI/0kHH0A1nXxVVZ/v7fP0tRmNn62lfzEfRAi2cmc9CcEHi3aqBtbj8GolF9Ans
 GwXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUT5bKPrSCM/d//jTKIAXbh5B6L+b7+/Gl/OD5kYYCgM2a+W8CMEHKYXLNI/sY+TR0xcuUx7pZmvA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw65yXOJWGPmnKEGb91VDV4nTg/3D65gSfql1Fkfuch2t5Lk/1E
 e9f/Ev7HchYBfutwdBYoEXlEAU1+B+DcYxjw8OphkVXPdd1EEmCWSch8BtBWlxxM0HY=
X-Gm-Gg: AZuq6aLEMOdJhQ+dmwKC/onCvdS3t3I54ncDVhnSSt8a6nENF5pzG31rTQerGpJtJ4U
 unujT883HftOYxcOiwHloFdTjXzuRZLorW2gBc/+kKBvbJXKcrZoJdnX2sc7LIem0JHmsJ7EoB8
 OBCrWJ9fwgnctRRHoaZUM6DKyeGgqIveJd6oobJrwL3gLOJpk5P8DJKcfTeJKdGjRjILc+3yDNg
 JAcul62KXmSy6a6mST6VN/+xQ/d/T4Owv/yUO23Oy32AUctdCNYS6RcEEcId3CuYwE8/oM9aS+W
 pQ/y/kG/ojcFw/9Qv36MItC6HbCLsyjY16GyUuG1elj6sXgapEZdgTG0IdrI7LubQI8+acmwXFM
 qTbhO9EivJFdq2KQCTtLuOiPbLAm1bt+Ve95urY9tvLebwITbxXJNX5b9U95WHF6I6RcnNuXjfL
 mbshxGYtS16WA9oQ==
X-Received: by 2002:a05:6000:2504:b0:431:488:b9bc with SMTP id
 ffacd0b85a97d-435b1591276mr10891979f8f.10.1769266475901; 
 Sat, 24 Jan 2026 06:54:35 -0800 (PST)
Received: from linux ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1f73855sm14846241f8f.29.2026.01.24.06.54.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jan 2026 06:54:35 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@suse.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v3 1/2] drm/xe: replace use of system_unbound_wq with
 system_dfl_wq
Date: Sat, 24 Jan 2026 15:54:00 +0100
Message-ID: <20260124145401.44992-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260124145401.44992-1-marco.crivellari@suse.com>
References: <20260124145401.44992-1-marco.crivellari@suse.com>
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

This patch continues the effort to refactor workqueue APIs, which has begun
with the changes introducing new workqueues and a new alloc_workqueue flag:

   commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
   commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

The point of the refactoring is to eventually alter the default behavior of
workqueues to become unbound by default so that their workload placement is
optimized by the scheduler.

Before that to happen, workqueue users must be converted to the better named
new workqueues with no intended behaviour changes:

   system_wq -> system_percpu_wq
   system_unbound_wq -> system_dfl_wq

This way the old obsolete workqueues (system_wq, system_unbound_wq) can be
removed in the future.

Link: https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de/
Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 2 +-
 drivers/gpu/drm/xe/xe_execlist.c    | 2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c      | 4 ++--
 drivers/gpu/drm/xe/xe_oa.c          | 2 +-
 drivers/gpu/drm/xe/xe_vm.c          | 4 ++--
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index d444eda65ca6..6b47aaf8cc9f 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -362,7 +362,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 
 	xe_engine_snapshot_capture_for_queue(q);
 
-	queue_work(system_unbound_wq, &ss->work);
+	queue_work(system_dfl_wq, &ss->work);
 
 	xe_force_wake_put(gt_to_fw(q->gt), fw_ref);
 	dma_fence_end_signalling(cookie);
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 769d05517f93..730b600a5803 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -422,7 +422,7 @@ static void execlist_exec_queue_kill(struct xe_exec_queue *q)
 static void execlist_exec_queue_destroy(struct xe_exec_queue *q)
 {
 	INIT_WORK(&q->execlist->destroy_async, execlist_exec_queue_destroy_async);
-	queue_work(system_unbound_wq, &q->execlist->destroy_async);
+	queue_work(system_dfl_wq, &q->execlist->destroy_async);
 }
 
 static int execlist_exec_queue_set_priority(struct xe_exec_queue *q,
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index a5019d1e741b..351c9986f6cf 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -558,7 +558,7 @@ static int __xe_guc_ct_start(struct xe_guc_ct *ct, bool needs_register)
 	spin_lock_irq(&ct->dead.lock);
 	if (ct->dead.reason) {
 		ct->dead.reason |= (1 << CT_DEAD_STATE_REARM);
-		queue_work(system_unbound_wq, &ct->dead.worker);
+		queue_work(system_dfl_wq, &ct->dead.worker);
 	}
 	spin_unlock_irq(&ct->dead.lock);
 #endif
@@ -2093,7 +2093,7 @@ static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reaso
 
 	spin_unlock_irqrestore(&ct->dead.lock, flags);
 
-	queue_work(system_unbound_wq, &(ct)->dead.worker);
+	queue_work(system_dfl_wq, &(ct)->dead.worker);
 }
 
 static void ct_dead_print(struct xe_dead_ct *dead)
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index f8bb28ab8124..c8e65e38081c 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -969,7 +969,7 @@ static void xe_oa_config_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
 	struct xe_oa_fence *ofence = container_of(cb, typeof(*ofence), cb);
 
 	INIT_DELAYED_WORK(&ofence->work, xe_oa_fence_work_fn);
-	queue_delayed_work(system_unbound_wq, &ofence->work,
+	queue_delayed_work(system_dfl_wq, &ofence->work,
 			   usecs_to_jiffies(NOA_PROGRAM_ADDITIONAL_DELAY_US));
 	dma_fence_put(fence);
 }
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 095bb197e8b0..ddf0a9567614 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1091,7 +1091,7 @@ static void vma_destroy_cb(struct dma_fence *fence,
 	struct xe_vma *vma = container_of(cb, struct xe_vma, destroy_cb);
 
 	INIT_WORK(&vma->destroy_work, vma_destroy_work_func);
-	queue_work(system_unbound_wq, &vma->destroy_work);
+	queue_work(system_dfl_wq, &vma->destroy_work);
 }
 
 static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
@@ -1854,7 +1854,7 @@ static void xe_vm_free(struct drm_gpuvm *gpuvm)
 	struct xe_vm *vm = container_of(gpuvm, struct xe_vm, gpuvm);
 
 	/* To destroy the VM we need to be able to sleep */
-	queue_work(system_unbound_wq, &vm->destroy_work);
+	queue_work(system_dfl_wq, &vm->destroy_work);
 }
 
 struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id)
-- 
2.52.0

