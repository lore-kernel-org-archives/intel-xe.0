Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE91D26D67
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 15:57:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2416C10E8F4;
	Fri,  9 Jan 2026 15:57:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="aa2hNuja";
	dkim-atps=neutral
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C923F10E90A
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jan 2026 15:57:31 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-477bf34f5f5so34533875e9.0
 for <intel-xe@lists.freedesktop.org>; Fri, 09 Jan 2026 07:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1767974250; x=1768579050; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2ix+9G0m0BaEgIthBMoGEcz3Z84BedH0qPmTYz4OloA=;
 b=aa2hNuja+vskdKajU2Fezc0FWlniUCioTFNyszaDHaNwWPbD6ogQRu+UOQru4MTmKi
 c7L+xaXx02Vz4u4yXVmSuwg4DgOT6kai8/Y2bLrxQmhqMK+7nqHPyAxj1AKUzO7jfqBc
 WD3oWUL01tB7dtofZu8v3InAMeibUGdq3fG2AVuFN/bPlpbenibK8qyTwztFzcCq6zw4
 eAaq/BWszvJjQldsqcRGKQT7IflGP7V7/oJcZO6p3dfSXqTHEO/Fwhk22B3J6YjDgdRM
 jV5UCzhUVwg1OdXJxd8Tz2EW0XAqlLm4O241+cGuOMf5g2ZsE2B73ftoYcVcRYTPw4K4
 5CtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767974250; x=1768579050;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2ix+9G0m0BaEgIthBMoGEcz3Z84BedH0qPmTYz4OloA=;
 b=pmC/mxEGRFo3f0Cbhuu4AfJogt436ZtZsR2oY4OLFl4T5e+DICv/vcuvlUkWF1AG+Y
 oSivFaI95NTVnB0w3uFu0LhBNFiSNT1iQV/yMcPkZb0uZ6j1cS4+57y4C3ucvMl8COFx
 EKgFYEvMhk2XeYJIIq1CbW+hZU9sEAHizigbFB9nT1tqQpi46Fb6JU6jgsbPNU0L2j4X
 E020br1qSlQfceH8iKl3FcaJLFD6kvDOvq9a/6Ebj5amX+36gIEDXd52oTRx3KoG5EQ9
 HwCiU3o/p9IVrs3Ov84tMzhoqrHmRIu0u+D/HPquo7QMr9Snno/zRzFBNPVS20PRMtOD
 6Gkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAPFaGBFj2xFiVFiPBrM5nReR4dDcfM5YBV38AGRfmxP+ccggBW5eBt9zIeRJOnFeEyYFUWXlEfQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywm7krt8iurz5Mk9yKXw9D0mCmmNrKV3IaQhNU0o5VEAknOdmMb
 1/yPMjYCDzuMcjcYp0p9AO/way6AGhPJxswuuP26Xek9ABrEZN30HxcP9WlQ6qmXsP0=
X-Gm-Gg: AY/fxX7t73rL7h0gV2V31lsws9A78yTgQYzaMwncbLsvSS+kBjLKWhWOUIUfz0XbuG3
 jnbt5ioq1xpD0GfcSgKDSWxJ6ZOD+rnzj4z6FnGRvOweuGvBoM6ViV5KhaztFatTUFIcs4uIkeo
 xOE/AvSh27bnKiQwJZXdncxgug0o8GJBU9D6Bp8W/XhR+GAX/qPbGWituSiCnAfBDLensLcHEtu
 nAVe/br3NJKKrMMhdS+ZTHx3nboTwcA+XddJRCNfoKpwaM+LGLnSLXzEcbFaSV3M/9hLPYPX0F1
 88luEqc1E6kwtA+YDI96aY7qF83MmTdEVVj3/s6WJ4D9B2uBp8J6km9r0obSDzs69aSyWf+Hn15
 s7fQpKwLLvENMUvcxi/eO91C+q1pAHKoFPjdyNTBwFWb8yS5K7+cpfSqNOUdT+FWFn+YwmrlYQ7
 lRjTXu5wdfkgf6yQ==
X-Google-Smtp-Source: AGHT+IEjcgfZoQVHawjXdqV+0cp6ZHCBWOVI5xiLde3MW66VrT17DHgkEYqNw8U2z8x2ia/O7TtWMQ==
X-Received: by 2002:a05:600d:103:b0:47d:403e:9cd5 with SMTP id
 5b1f17b1804b1-47d84b1fce2mr89769945e9.11.1767974250006; 
 Fri, 09 Jan 2026 07:57:30 -0800 (PST)
Received: from linux ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f390a69sm214567355e9.0.2026.01.09.07.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jan 2026 07:57:29 -0800 (PST)
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
Subject: [PATCH v2] drm/xe: Replace use of system_wq with
 tlb_inval->fence_signal_wq
Date: Fri,  9 Jan 2026 16:57:17 +0100
Message-ID: <20260109155717.269221-1-marco.crivellari@suse.com>
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

So, a new workqueue named 'fence_signal_wq' has been added to
'struct xe_tlb_inval' and has been initialized with 'gt->ordered_wq'
changing the system_wq uses with tlb_inval->fence_signal_wq.

Link: https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de/
Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
Changes in v2:
- added 'fence_signal_wq', initialized with 'gt->ordered_wq' in order to use
  it in the fence signaling path, instead of system_wq.

- rebased on v6.19-rc4


 drivers/gpu/drm/xe/xe_tlb_inval.c       | 10 +++++++---
 drivers/gpu/drm/xe/xe_tlb_inval_types.h |  2 ++
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
index 918a59e686ea..2e98f407c59d 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
@@ -94,7 +94,7 @@ static void xe_tlb_inval_fence_timeout(struct work_struct *work)
 		xe_tlb_inval_fence_signal(fence);
 	}
 	if (!list_empty(&tlb_inval->pending_fences))
-		queue_delayed_work(system_wq, &tlb_inval->fence_tdr,
+		queue_delayed_work(tlb_inval->fence_signal_wq, &tlb_inval->fence_tdr,
 				   timeout_delay);
 	spin_unlock_irq(&tlb_inval->pending_lock);
 }
@@ -146,6 +146,10 @@ int xe_gt_tlb_inval_init_early(struct xe_gt *gt)
 	if (IS_ERR(tlb_inval->job_wq))
 		return PTR_ERR(tlb_inval->job_wq);
 
+	tlb_inval->fence_signal_wq = gt->ordered_wq;
+	if (IS_ERR(tlb_inval->fence_signal_wq))
+		return PTR_ERR(tlb_inval->fence_signal_wq);
+
 	/* XXX: Blindly setting up backend to GuC */
 	xe_guc_tlb_inval_init_early(&gt->uc.guc, tlb_inval);
 
@@ -226,7 +230,7 @@ static void xe_tlb_inval_fence_prep(struct xe_tlb_inval_fence *fence)
 	list_add_tail(&fence->link, &tlb_inval->pending_fences);
 
 	if (list_is_singular(&tlb_inval->pending_fences))
-		queue_delayed_work(system_wq, &tlb_inval->fence_tdr,
+		queue_delayed_work(tlb_inval->fence_signal_wq, &tlb_inval->fence_tdr,
 				   tlb_inval->ops->timeout_delay(tlb_inval));
 	spin_unlock_irq(&tlb_inval->pending_lock);
 
@@ -378,7 +382,7 @@ void xe_tlb_inval_done_handler(struct xe_tlb_inval *tlb_inval, int seqno)
 	}
 
 	if (!list_empty(&tlb_inval->pending_fences))
-		mod_delayed_work(system_wq,
+		mod_delayed_work(tlb_inval->fence_signal_wq,
 				 &tlb_inval->fence_tdr,
 				 tlb_inval->ops->timeout_delay(tlb_inval));
 	else
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_types.h b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
index 8f8b060e9005..1a3e239ea3a7 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
+++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
@@ -106,6 +106,8 @@ struct xe_tlb_inval {
 	struct workqueue_struct *job_wq;
 	/** @tlb_inval.lock: protects TLB invalidation fences */
 	spinlock_t lock;
+	/** @fence_signal_wq: schedule fence signaling path jobs  */
+	struct workqueue_struct *fence_signal_wq;
 };
 
 /**
-- 
2.52.0

