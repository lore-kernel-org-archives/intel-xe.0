Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C00CCFA04
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 17:06:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08E5410E451;
	Mon,  3 Nov 2025 17:06:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="aVwcBHhz";
	dkim-atps=neutral
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC2110E448
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 17:06:18 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4771b03267bso31238815e9.0
 for <intel-xe@lists.freedesktop.org>; Mon, 03 Nov 2025 09:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1762189577; x=1762794377; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0GOfKt62NngZqZbp/cL7xKq9Fj6qCjeL7NUgIdEHh5M=;
 b=aVwcBHhzOcWU8wMY6tCFFIYxmsAwPUvqKlbzzU0dTwHyU5HtONhkyjoLgjO8zhZFC0
 24ULTbeAVde164KHEd3K6qauM/+yMwzLQT4o6tCgkGtePFmeYCXKSrWZ09C4deV5s4Go
 IZicZgtgQc4U7JdIpQcs3GYaid7pSdgYntuzUZ07cRGkN5hr1/e47HfFFyAcoU7IRGi8
 Kbl1UHEv4WfETX7rO38q/QINbHm0yGGVhBU+tpNEF+JxO+I+nxYgW4StMkMnFuk29WLg
 Fk4vXU1juRIDKC8BEacxwnRUpt6F/P4SHETeis0cDJnGWbd1kF1JaK/W7382FqCGyl92
 3IHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762189577; x=1762794377;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0GOfKt62NngZqZbp/cL7xKq9Fj6qCjeL7NUgIdEHh5M=;
 b=Gvmozp29uA8MubhcBxWmc4mNKJKRhEetsh+B8vj82zl/2N2nJR1UYX4rJfOq0tq9GT
 jSYDXVXMjNxxXQ1Re2z9iiYQTOIQaDNBYUyrZXenXC6jzJ5u2S9X7ujoJuYT9BnXhcHP
 PdHcCMAfTMVbYE9tvOrn+aLcXJPsoML132xfAryePtwKf5yL1kGltUcjdCG537JcERSZ
 VNskfAqdJwbDxbj7WpbP8k7wmZDOG1hHxwAfqoQStbpG6F763Oefw2DiRuwEuyVIH9pZ
 JbQh7CkpJKdj7QSrEbFXk7TwAuy44wHW4hB7ZsngftdC10H59hRcasXX7w7p7tqX8mYb
 ROkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzhp0luXccG038G7PumxcKQ6lKITcMo4aUpQVRgVP8/BP88e5sXOJ4mz7A4UwMB4iuukXa3NOQTQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxaO+7bqLUep+EPLUPDoZMZt+RmcvjP96W9Od8KSo8NJqWtLdVZ
 C7XIaxq36hXaso2kMeA2f45OOCUI3rAqIooasxToAeu5egjFolXdz0Gw3cn0wbTr7vg=
X-Gm-Gg: ASbGnctFzTt+iZHLOCjS7kP6ztIDsKMiJSCUGbQYpZ7OwERYQVko19VsNEyFLDma00P
 njywLTHddjbJcchYkmHWzeEoHOa/W+htjWR5yB7t7KHEj6JEoDkrP4fBcsNfsM0oSMb8v4T9ln6
 go+87mnlVTGMxwr9AF10l91Fdy6lU7ztOoUdlI/ioXHcKELlRvxYzPKIDBzZZi5g0YbfLfxH2BM
 K9TRwEXRgDAqZaKhyR7x+2eHFnL+07j39OIcE1vW2Msot9iFoGnX1afkTY4Ny8UGGQ5LYQPRps6
 iF89sVYBG18Uc1mK4ZYZQBtG+3mqXQqDr4Rq4PhVMQRt7lt2V/80IZ0WNIHdwXt3ESAQxs7UC+4
 x+HFgWcRX04Did5uNLRf5q76ZYLws6JWgepIIxLqFABha5sfmzilCIqALHQ5ZuVsh+8459eG12v
 FW9UjP4fl9nGuI4cvkWFUQYAjyzc2IcavvOwFEJUbSQA7B6Q==
X-Google-Smtp-Source: AGHT+IHS8Qrqk4wb0RBUS4KE1K98X0engVur3nZE1XsUogokU8LVC28F9cBYglCJbJ9kw5feZmAX1g==
X-Received: by 2002:a05:600d:8399:b0:477:1709:1f2f with SMTP id
 5b1f17b1804b1-477328727d7mr77486185e9.5.1762189577025; 
 Mon, 03 Nov 2025 09:06:17 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4772fc524ddsm89799895e9.7.2025.11.03.09.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 09:06:16 -0800 (PST)
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
Subject: [PATCH v2 1/2] drm/xe: replace use of system_unbound_wq with
 system_dfl_wq
Date: Mon,  3 Nov 2025 18:06:03 +0100
Message-ID: <20251103170604.310895-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251103170604.310895-1-marco.crivellari@suse.com>
References: <20251103170604.310895-1-marco.crivellari@suse.com>
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

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistency cannot be addressed without refactoring the API.

The above change to the Workqueue API has been introduced by:

commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")

system_unbound_wq should be the default workqueue so as not to enforce
locality constraints for random work whenever it's not required.

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
index 63c65e3d207b..d3a0e0231cd1 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1064,7 +1064,7 @@ static void vma_destroy_cb(struct dma_fence *fence,
 	struct xe_vma *vma = container_of(cb, struct xe_vma, destroy_cb);
 
 	INIT_WORK(&vma->destroy_work, vma_destroy_work_func);
-	queue_work(system_unbound_wq, &vma->destroy_work);
+	queue_work(system_dfl_wq, &vma->destroy_work);
 }
 
 static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
@@ -1823,7 +1823,7 @@ static void xe_vm_free(struct drm_gpuvm *gpuvm)
 	struct xe_vm *vm = container_of(gpuvm, struct xe_vm, gpuvm);
 
 	/* To destroy the VM we need to be able to sleep */
-	queue_work(system_unbound_wq, &vm->destroy_work);
+	queue_work(system_dfl_wq, &vm->destroy_work);
 }
 
 struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id)
-- 
2.51.1

