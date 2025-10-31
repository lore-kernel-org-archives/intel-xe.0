Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB539CCFA05
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 12:45:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 357FE10E3CC;
	Mon,  3 Nov 2025 12:45:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="KYdLJHoJ";
	dkim-atps=neutral
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8935C10EB31
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 10:59:55 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-429bccca1e8so653252f8f.0
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 03:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1761908394; x=1762513194; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=meReBaQ99dOF1c+7jSgsU4KTZxApPi6bDuZ+XPUjUx4=;
 b=KYdLJHoJh3ktdgT9emDn5nWorwevNpOC4vOtduHizzb9D72/MlBw6PoJwFoIw4iSoG
 77/t7MxZJUml+I6GY7dyZc4ACS2wYhmkxOQVp3+N+9duLn6rOdbOx2UfzSUKMTOlrMUV
 OJr2mC7KvAeeRM1GOTsrBFMzZXXl73FTTOxqzPENOIXsxpr5awDTD3v98YcUBMNTOd5H
 bpSPfkXztZFazVnuH8WTQzZbeaPE+0x0isBhM9A3rnFe4JOwe9r4sK+yvBJvDrIP+t22
 OmIWNew5BBZwC3lLdCDLx3m4fy+6yOApTEZWH14xPFJiD8ucNJveboSuI+jG2FXhMpkX
 zw2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761908394; x=1762513194;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=meReBaQ99dOF1c+7jSgsU4KTZxApPi6bDuZ+XPUjUx4=;
 b=g6Gj4/jgQN3vJnw2CiMovt4m8BguWJKOz8TTsrgwRe9n+yNRFdabhsZKT7oozI6BKu
 rDP7uwuU49DEKIE4hqFbK0JAsjIPV2KR3KucSSAvVUg2x7xZK9COJcDeX+WBC1OVGmxg
 wFIeXDnisSub9yAHSLMGFUJMqW2IvEzRYpMiB4keJApRal+J1pu6I3YNuflCrZRK1Bh2
 Ib++8AlxESV1f6jMv7/ShuveuvrBjUP2xbITvgS+glDJoIbnfJIHNcBfKHl3wDC4372c
 HzGj8FseHfi+qJwID/yUe5LVKg3vMDKbmnrapicfW0IqgQ9cMdL6SPwOOyx5z1tioLjy
 0rFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtK7c1HaaCsg7uJdsiRsHEjwTLs4uKy8QwrwoHJJ4cTpBzxDKwCTAqUDjPUCf/JNYWbYjt9KHERA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx81cOpZ1IyvdKUeo9BGulMvZ2lcdfpt4U/4cLEB/HZnqWxXu/r
 Z2TTN7vGzLNgXvtLzP+7JjZnfhbdbZS2a7BVi1friskQ0PjtXwkB4uLn2tsG7ryorxY=
X-Gm-Gg: ASbGncu+JK3JZvhGRmNcutQSaBg+AlgoLaIp0IKx5zGgtNn9y7pI50Xpkt4RXdBfQvp
 4KXyRYupy16IwCCHve7lHDLzcZdTFXQrnU0tRty2DZvy7ZTtmkafZOsfZFZsRyYP2vwDdn0IA8w
 5VdIf1IfUZAK0MGLiZHyJg/m768Dp0jTgYsqQ/Hxxpmebp7LWNM4xojkBtq34ufI7RK+qBDG2bN
 bJwxRdOfhXlSa+Jpb9clFdE1yrKYEEozH/J3K6DXRvOmZZVZR9z2IVi75dh4IElQfh19DC1gQ9j
 E6SUNlsjQ+SqgkbkCNeC9tKsMGxCq8YSL3NWjQ3L7LWFP6qcpsaXY8Ep1n3kPNfQ43/VlVP+GWS
 GvfO7h6gabYCMVhWpfABJJF0QpiK+j0ZeCSoTAILQqhKnvX/qx4QjrxTwhMK2bGBBZKj14/vAed
 rn/qcd1GnJALzV1jIo4YFsxdbO
X-Google-Smtp-Source: AGHT+IFdGTxG3bZ9hI1ZvBKqkA/ZCyuorhXgGNfQCxf182NXCKhTyNIAS3xqjvn2tp4aiso7n8hemw==
X-Received: by 2002:a05:6000:40ca:b0:426:d820:a3f9 with SMTP id
 ffacd0b85a97d-429bd5eea69mr2252061f8f.0.1761908393997; 
 Fri, 31 Oct 2025 03:59:53 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c110035esm2965528f8f.6.2025.10.31.03.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 03:59:53 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@suse.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 1/2] drm/xe: replace use of system_unbound_wq with
 system_dfl_wq
Date: Fri, 31 Oct 2025 11:59:38 +0100
Message-ID: <20251031105939.129200-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031105939.129200-1-marco.crivellari@suse.com>
References: <20251031105939.129200-1-marco.crivellari@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 03 Nov 2025 12:45:22 +0000
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

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistency cannot be addressed without refactoring the API.

system_unbound_wq should be the default workqueue so as not to enforce
locality constraints for random work whenever it's not required.

Adding system_dfl_wq to encourage its use when unbound work should be used.

The old system_unbound_wq will be kept for a few release cycles.

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
index 203e3038cc81..806335487021 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -362,7 +362,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 
 	xe_engine_snapshot_capture_for_queue(q);
 
-	queue_work(system_unbound_wq, &ss->work);
+	queue_work(system_dfl_wq, &ss->work);
 
 	xe_force_wake_put(gt_to_fw(q->gt), fw_ref);
 	dma_fence_end_signalling(cookie);
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index f83d421ac9d3..99010709f0d2 100644
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
index 18f6327bf552..bc2ec3603e7b 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -543,7 +543,7 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
 	spin_lock_irq(&ct->dead.lock);
 	if (ct->dead.reason) {
 		ct->dead.reason |= (1 << CT_DEAD_STATE_REARM);
-		queue_work(system_unbound_wq, &ct->dead.worker);
+		queue_work(system_dfl_wq, &ct->dead.worker);
 	}
 	spin_unlock_irq(&ct->dead.lock);
 #endif
@@ -2186,7 +2186,7 @@ static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reaso
 
 	spin_unlock_irqrestore(&ct->dead.lock, flags);
 
-	queue_work(system_unbound_wq, &(ct)->dead.worker);
+	queue_work(system_dfl_wq, &(ct)->dead.worker);
 }
 
 static void ct_dead_print(struct xe_dead_ct *dead)
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index a4894eb0d7f3..4e362cd43d51 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -967,7 +967,7 @@ static void xe_oa_config_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
 	struct xe_oa_fence *ofence = container_of(cb, typeof(*ofence), cb);
 
 	INIT_DELAYED_WORK(&ofence->work, xe_oa_fence_work_fn);
-	queue_delayed_work(system_unbound_wq, &ofence->work,
+	queue_delayed_work(system_dfl_wq, &ofence->work,
 			   usecs_to_jiffies(NOA_PROGRAM_ADDITIONAL_DELAY_US));
 	dma_fence_put(fence);
 }
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 027e6ce648c5..94827ca4b7dc 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1073,7 +1073,7 @@ static void vma_destroy_cb(struct dma_fence *fence,
 	struct xe_vma *vma = container_of(cb, struct xe_vma, destroy_cb);
 
 	INIT_WORK(&vma->destroy_work, vma_destroy_work_func);
-	queue_work(system_unbound_wq, &vma->destroy_work);
+	queue_work(system_dfl_wq, &vma->destroy_work);
 }
 
 static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
@@ -1832,7 +1832,7 @@ static void xe_vm_free(struct drm_gpuvm *gpuvm)
 	struct xe_vm *vm = container_of(gpuvm, struct xe_vm, gpuvm);
 
 	/* To destroy the VM we need to be able to sleep */
-	queue_work(system_unbound_wq, &vm->destroy_work);
+	queue_work(system_dfl_wq, &vm->destroy_work);
 }
 
 struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id)
-- 
2.51.0

