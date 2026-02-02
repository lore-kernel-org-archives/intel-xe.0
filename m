Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FF7E73153
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 10:38:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8E6E10E417;
	Mon,  2 Feb 2026 10:38:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="ZB/dNUGw";
	dkim-atps=neutral
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3138D10E41C
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Feb 2026 10:38:08 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-47edd6111b4so45380765e9.1
 for <intel-xe@lists.freedesktop.org>; Mon, 02 Feb 2026 02:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1770028687; x=1770633487; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hq4ly7B9JVWbvt72cIbU5rFsb4y323EjInZyEw1Av+0=;
 b=ZB/dNUGw3DEipkqzM5axcnCz7i6ZpL15ooNh69Xmv/1n4nizA+CxQzJUu6Xjj4/omp
 6kmZ3PPeS9DkYkYHZOeBT64unxgxMghZfdIOIjPXIdrqt6nLsbpa/ky1pBDFBM8dbwKi
 HSyUzMO/fyXJjTvqyXEecasnCUesls5+OEJxMnhRaZ3O2jQ9bCmK8MK2ZaU1Oqc5FAyn
 BLVEHrT9DnbCpwStMdnYazKfmKLFH7UzvDCUDUdOMCBf7AK+LpjNyAlIfhv0RgH74iUH
 EBgcBVl6FuKE0yNuNeWeXC/hRZ8vLHthlIcRMRnxomfwYGASUp1a+69jFNhvd5Fp1Thm
 giHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770028687; x=1770633487;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Hq4ly7B9JVWbvt72cIbU5rFsb4y323EjInZyEw1Av+0=;
 b=oVfGx5LWIp06LQLvRFG19bWCnKUptfZk8F9jcfx5wUi40gW+AU7LtcGsLmff7MfYYP
 ztnS5cJh86jhkH2BR8ND2gbgUVuNgDTrw54j3BN569iNz7/9ykFLiTbplB2V8mEQP5GP
 ZoTnInCDEe36kpGvfXeqwGS3CdPP+/KW1Tt1B4Fd7HF+UIztyPjuOWHlYv5Az6DpQUP0
 mWj01QpcPYkWQt3xSQ3DgcXbHoEUn9j+xeVkqk2HGqqOQIUEyVYYL1OABIbPdzrKrMNm
 Xxn17rSBsDWvA+IDO+RH3XFhncWk/jRhluV5rKuJFbugTtbCpQ66DiQyiMiGuRyjL+31
 ne0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuRRcKHkDDlOhesLDj8b871jXkME9minU8GxYFn5ExCJ3fs4oJoR3Y3bYFYbeuf9DW8LH7Je6R8Q==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YysFgXnSTMA10AwdN6XoQ1WSoUWLwkPnCnXqHd4SorU9OXjsNRk
 BLjtIb/ucmF8AFrnWh4zZBRZU6fPq0yF6RqZ7FJ81+YPoCc/Zltz8fek6q3HK67voPY=
X-Gm-Gg: AZuq6aLLBrBg6dA64HKRx3pmqQ2d0cFgLa5soZQOoGq9Z0YuUUVJJXXd59TREoA6hpB
 U/gYbjez4SbSVanMXyqC1LoxwvP9jbh8wyZuSCk9sY2vxb1Wpiin6wypCpDIlRQjLYEhm3kcQyl
 d1xId7GM/mQci3wBOKWvpxIfS7Vb+uTgG83rPsAOmKWc/ph4D1AfDfsxeBomxJ8xjMLHM1dnpFT
 tgTt2MwjaM5M0Qd+XYdI26ihFwwLtNvzWBYaLwzb95C9n4GeJNBsndO57IR0z0ivDXzl7VZVUtJ
 jBFalrbj4XdDkeq9EUITQh2SjzrLbIOA0hznh/F2VbfTwzdKcavo32bvn0Qz9yxpykUwfS9Mil2
 9U/qOOGuA7s4eNdxpXwEH8DHmJZT856s8WEHzj27LwrF6saOz8HFBIbsXwAQQp5XiUZYACj0HHU
 MUA1zJpOpJvgJguA==
X-Received: by 2002:a05:600c:628b:b0:477:9ce2:a0d8 with SMTP id
 5b1f17b1804b1-482db013172mr151015275e9.0.1770028686690; 
 Mon, 02 Feb 2026 02:38:06 -0800 (PST)
Received: from linux ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e1354d43sm47020132f8f.43.2026.02.02.02.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 02:38:06 -0800 (PST)
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
Subject: [PATCH v4 1/2] drm/xe: replace use of system_unbound_wq with
 system_dfl_wq
Date: Mon,  2 Feb 2026 11:37:55 +0100
Message-ID: <20260202103756.62138-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202103756.62138-1-marco.crivellari@suse.com>
References: <20260202103756.62138-1-marco.crivellari@suse.com>
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
index cf41bb6d2172..558a1a9841a0 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -356,7 +356,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 
 	xe_engine_snapshot_capture_for_queue(q);
 
-	queue_work(system_unbound_wq, &ss->work);
+	queue_work(system_dfl_wq, &ss->work);
 
 	dma_fence_end_signalling(cookie);
 }
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 005a5b2c36fe..dc25caf47813 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -421,7 +421,7 @@ static void execlist_exec_queue_kill(struct xe_exec_queue *q)
 static void execlist_exec_queue_destroy(struct xe_exec_queue *q)
 {
 	INIT_WORK(&q->execlist->destroy_async, execlist_exec_queue_destroy_async);
-	queue_work(system_unbound_wq, &q->execlist->destroy_async);
+	queue_work(system_dfl_wq, &q->execlist->destroy_async);
 }
 
 static int execlist_exec_queue_set_priority(struct xe_exec_queue *q,
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index dfbf76037b04..a0498f36bd74 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -643,7 +643,7 @@ static int __xe_guc_ct_start(struct xe_guc_ct *ct, bool needs_register)
 	spin_lock_irq(&ct->dead.lock);
 	if (ct->dead.reason) {
 		ct->dead.reason |= (1 << CT_DEAD_STATE_REARM);
-		queue_work(system_unbound_wq, &ct->dead.worker);
+		queue_work(system_dfl_wq, &ct->dead.worker);
 	}
 	spin_unlock_irq(&ct->dead.lock);
 #endif
@@ -2165,7 +2165,7 @@ static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reaso
 
 	spin_unlock_irqrestore(&ct->dead.lock, flags);
 
-	queue_work(system_unbound_wq, &(ct)->dead.worker);
+	queue_work(system_dfl_wq, &(ct)->dead.worker);
 }
 
 static void ct_dead_print(struct xe_dead_ct *dead)
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index abf87fe0b345..8b37e49f639f 100644
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
index 293b92ed2fdd..e6cfa5dc7f62 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1112,7 +1112,7 @@ static void vma_destroy_cb(struct dma_fence *fence,
 	struct xe_vma *vma = container_of(cb, struct xe_vma, destroy_cb);
 
 	INIT_WORK(&vma->destroy_work, vma_destroy_work_func);
-	queue_work(system_unbound_wq, &vma->destroy_work);
+	queue_work(system_dfl_wq, &vma->destroy_work);
 }
 
 static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
@@ -1894,7 +1894,7 @@ static void xe_vm_free(struct drm_gpuvm *gpuvm)
 	struct xe_vm *vm = container_of(gpuvm, struct xe_vm, gpuvm);
 
 	/* To destroy the VM we need to be able to sleep */
-	queue_work(system_unbound_wq, &vm->destroy_work);
+	queue_work(system_dfl_wq, &vm->destroy_work);
 }
 
 struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id)
-- 
2.52.0

