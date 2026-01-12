Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D43D232D7
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 09:44:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F93E10E094;
	Mon, 12 Jan 2026 09:44:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="dB72UUaE";
	dkim-atps=neutral
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAB0E10E035
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jan 2026 09:44:16 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-47d5e021a53so44818655e9.3
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jan 2026 01:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1768211055; x=1768815855; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Nw6JgxEvUK1B1sbKyu1+Uffm1p7eWghGzg3C2Jww0Ws=;
 b=dB72UUaE5ZCe+5uQ9PDsPXEaRs/1uBOWxnpRPvnAFA2GyL4PeT2jHvm9yotMAFrjmd
 vx7IbGbxsnaGjlj9MHLh+eJ5LEDSU5vmKdXRIk1qLp7fqoxuGypdy5QBy1qQgWWlmWNI
 gY4nhEB8gS6AvdIO0AJBj9Vk26SzYy1eBR02vtyKrT3d1ZsfHJ/bZoP2uZ48K4zNPh3c
 iRd2YY6hr6yFFeAhwQYKgRZd21gpmonA4Z7s1RaDexRrpTlS30FkNl/9BVmTKXzMmCTK
 QfDSCZzA+c7iU1CqdO51lOuA7f8LludKNrfyE1hVX29xMtnnoWLzWLDSIvgQRe22HdIM
 Niyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768211055; x=1768815855;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nw6JgxEvUK1B1sbKyu1+Uffm1p7eWghGzg3C2Jww0Ws=;
 b=H1KevrGd/S9zHt3OKppMed2brgJLn15zrT6/AwxAymtlMmuqRQ4nNIIIhvkMDM50Sy
 FslPz73tGUahPtQ8q3NloFqKntxuw5knk7FGQVM5JNdqQ+0hVeP+NTvSzBvWm6FJT9Ag
 kkBI2AMxM70fyl1oy4qylGMYxj6lU7h3gcDPqpPsj3QFmbq89tal42BUgZdXaBeCG8wc
 kyTAL2jB7Ks0clVbH20AR4yL5zqnrtTykwR4WJBwSUWMOEgBVEVzJFC7fEu6OdTnINPc
 krRZK1LKJLMXcRgjazHRRumseJSL0r2bhxpofLHN/ynvpAnfk+97TImCbyd4We43tiDC
 dbEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEkYgBgv4k1MO2GEK2B2v4cx7WUqK/+j7aUQU1cLkdQMRoLv9nf39nWXNCT01w5U/MM0aWRvZEMA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwytUTYIIlXSPkvwlKiHBISENPDRwbaI1ht7cuFsiWrsoAJxRN7
 B8b5Q4Z7DXuxgWhk+aw+qR//pZQPWphq3C3sbuujA7wlTsMYS+Qz8Fy/RXjF+C8ImtY=
X-Gm-Gg: AY/fxX5cBFCozVrqeVH8N3Us2c2JdKQBkoCceXO3IMdF/YLjtu0t7NF/iqjmKKfCKL3
 tw/Hs61quc7XKUSeKB5p8t+0W27IH7UpIksNAB7xkdxlogPAmBAhAU4CyU3c1H8X9hFu3H93ucq
 Wov/xOQRwNb+zOZ4vPMHEEeW/edwt9BmoOjYigqMRR+hPiSQNan8O8HZI8GIvi1f0UNS/yqSY10
 O2cJPAv6r80qDb6+PeFfw0vW8GgQCLzeyjCuCWCW5c5YIfBC+FHLl1oUKmSGmzg3VbMvQk955x6
 jPfENr8zz/EtbTTpeahqAloCmGnrBthN0xr3ptmMO4avT3Vv0O8qHgvtSc0hvpwhz7haw/rzhSY
 mZB9+NNmvXoVRwPnEbKJaKWHi0QOv7oOqd3hMdn64tzPgPP9YiU8Xndz4NvJr37fZ/wH/ZZRwou
 IAaR+fhM62Pwf32Pj3wRV6QZzopDuzwtOiKbY=
X-Google-Smtp-Source: AGHT+IHhiEtlHK1jzbZPbQ/fSMYsaHD3izE9MDeZzbbONDKCc+xdVbegLsillSKVmJA/ym3qIMPwjw==
X-Received: by 2002:a05:600c:3493:b0:477:333a:f71f with SMTP id
 5b1f17b1804b1-47d84b3471fmr191689965e9.17.1768211055269; 
 Mon, 12 Jan 2026 01:44:15 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d8719d057sm125389655e9.16.2026.01.12.01.44.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 01:44:14 -0800 (PST)
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
Subject: [PATCH v3] drm/xe: Replace use of system_wq with tlb_inval->timeout_wq
Date: Mon, 12 Jan 2026 10:44:06 +0100
Message-ID: <20260112094406.82641-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.52.0
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

After a carefully evaluation, because this is the fence signaling path, we
changed the code in order to use one of the Xe's workqueue.

So, a new workqueue named 'timeout_wq' has been added to
'struct xe_tlb_inval' and has been initialized with 'gt->ordered_wq'
changing the system_wq uses with tlb_inval->timeout_wq.

Link: https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de/
Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
Changes in v3:
- refactoring workqueue name from fence_signal_wq to timeout_wq.

- rebased on v6.19-rc5.

Changes in v2:
- added 'fence_signal_wq', initialized with 'gt->ordered_wq' in order to use
  it in the fence signaling path, instead of system_wq.

- rebased on v6.19-rc4.


 drivers/gpu/drm/xe/xe_tlb_inval.c       | 10 +++++++---
 drivers/gpu/drm/xe/xe_tlb_inval_types.h |  2 ++
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
index 918a59e686ea..084d996b818d 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
@@ -94,7 +94,7 @@ static void xe_tlb_inval_fence_timeout(struct work_struct *work)
 		xe_tlb_inval_fence_signal(fence);
 	}
 	if (!list_empty(&tlb_inval->pending_fences))
-		queue_delayed_work(system_wq, &tlb_inval->fence_tdr,
+		queue_delayed_work(tlb_inval->timeout_wq, &tlb_inval->fence_tdr,
 				   timeout_delay);
 	spin_unlock_irq(&tlb_inval->pending_lock);
 }
@@ -146,6 +146,10 @@ int xe_gt_tlb_inval_init_early(struct xe_gt *gt)
 	if (IS_ERR(tlb_inval->job_wq))
 		return PTR_ERR(tlb_inval->job_wq);
 
+	tlb_inval->timeout_wq = gt->ordered_wq;
+	if (IS_ERR(tlb_inval->timeout_wq))
+		return PTR_ERR(tlb_inval->timeout_wq);
+
 	/* XXX: Blindly setting up backend to GuC */
 	xe_guc_tlb_inval_init_early(&gt->uc.guc, tlb_inval);
 
@@ -226,7 +230,7 @@ static void xe_tlb_inval_fence_prep(struct xe_tlb_inval_fence *fence)
 	list_add_tail(&fence->link, &tlb_inval->pending_fences);
 
 	if (list_is_singular(&tlb_inval->pending_fences))
-		queue_delayed_work(system_wq, &tlb_inval->fence_tdr,
+		queue_delayed_work(tlb_inval->timeout_wq, &tlb_inval->fence_tdr,
 				   tlb_inval->ops->timeout_delay(tlb_inval));
 	spin_unlock_irq(&tlb_inval->pending_lock);
 
@@ -378,7 +382,7 @@ void xe_tlb_inval_done_handler(struct xe_tlb_inval *tlb_inval, int seqno)
 	}
 
 	if (!list_empty(&tlb_inval->pending_fences))
-		mod_delayed_work(system_wq,
+		mod_delayed_work(tlb_inval->timeout_wq,
 				 &tlb_inval->fence_tdr,
 				 tlb_inval->ops->timeout_delay(tlb_inval));
 	else
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_types.h b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
index 8f8b060e9005..e5ff35226826 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
+++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
@@ -106,6 +106,8 @@ struct xe_tlb_inval {
 	struct workqueue_struct *job_wq;
 	/** @tlb_inval.lock: protects TLB invalidation fences */
 	spinlock_t lock;
+	/** @timeout_wq: schedules TLB invalidation fence timeouts */
+	struct workqueue_struct *timeout_wq;
 };
 
 /**
-- 
2.52.0

