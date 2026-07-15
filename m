Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45473C44526
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jul 2026 21:05:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF77C10F618;
	Fri, 17 Jul 2026 21:05:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="rmUMAKGZ";
	dkim-atps=neutral
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDE7A10F12B
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jul 2026 18:16:32 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2cacf197759so40564695ad.2
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jul 2026 11:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784139392; x=1784744192; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:mime-version:user-agent
 :references:in-reply-to:message-id:date:cc:to:from:subject:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=4IcjMhwypTXX14WXh1GVYxiUX1ayGU/csb6g5Y2UiV8=;
 b=rmUMAKGZRAIFQsIeT8yjt6wWzuwzlqMJRcL0sDoxltpVKp/hTBLzkDtN8S7E/o/KLW
 NS41/J5+7zjc0AX0J1P0B3s4UC3l14JcRTLCrvqwChuQWsrU6EEEbBZJgehl9rh/Xo9O
 6R1Cxr4mukJyszkS75j6PuaSYtx5bMY1N60GOAszlWGaPdQ3z1MdgafHOlVcHMkOMpfo
 6PzdB1LrQ44QQpijs0haPuGIuKmzjXFXhTzDYzUyqtMGn78DAYkz4s3zaWivhHPZsxSy
 gtYEepyeVbCJJjwWUnLwMuJ9nGHRXT2V7wFKK1FVdSGXenbvghR5EqC6sSCGP0zAXftj
 rOoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784139392; x=1784744192;
 h=content-transfer-encoding:content-type:mime-version:user-agent
 :references:in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=4IcjMhwypTXX14WXh1GVYxiUX1ayGU/csb6g5Y2UiV8=;
 b=cx93zvCmF6LUzSKz1vUt/asHGrLSWa7ImcB2SFP/KgpvQTPIIsaZRqmU2ndFDwSgY0
 NaG6LZkxVnPL9DI3L/korVidsWVBBSfWFHD1rmkUP8OsA5ypMB7rh1cGVsDLHGsCuxR1
 8So3+FbVAe6+zCp2aYZfDftuaHVs5J5yjzlb5rtex445FRHUiw0LBayNYKoLLrjWRTtl
 UFHVUuI3vJYp6IouTED13G9c2kNln7XHxrcz+3IxB7P9XTz5cGzHcF7THu3qoVHOUQgW
 Z8v48l4Pmph8zI+h/ozHhq1NU2Sk7CTRAB+jbuSJidsCvlmmX0lAQhhfPlz5okGH6n3c
 WC6A==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr00E1lcMxDI3hs14rdontrq0ATgmGJCTyIXcrbG/MU7a6V8oQzfBdeLfN5nOyzRA8sUzLz7pLd4w==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+miUvc3yuwsO0OI0+fWFOZf0eFgvtkNAAzOmifi6DwXA3NJa9
 8s23MsOI8IyAKguvAIMwFVUnO8lGMDyMko+GjHysf+KIjPG8qGWSwA/h
X-Gm-Gg: AfdE7clJG9j8PJM9w9UrID/EMdqSS0//TfKc7Ric516ZfGajDDXHOJvm2ff6NC/Qhdb
 ZSx65E1JdHrbP0dOIY07f2fOlegtJfqm4PRbWW4XTNOsKxRAud99ynaLs/RQ6EtHXFZ8pNPU2on
 2uVO8Bc3RInRuA45Ob3og1eD3qkQPKtl0leK0STl5IpSXcSXYNv06K/hrBtxA9XatW+qaiyYUx1
 KM9xfBMHl5f9aOC4s5HhNGGnBhFmcbLH041FbrOvtJvfiX4bmh8QaXyZtPePIM3U/GeNXtZT1mH
 RLn97dIbXUefaQBoUZ5KOLIBhdNU/OD8YS2Cm0i1yPE2T4FCDGzXFYQp3BNLP/SRnnA0MQS0pcS
 JqOAYDuo2McwTkmlNQDLaGAN7xy131B2VAzcZ4T6ejp7qKchGK++ydyrb9/rLNMlrc1Bt+lxqqW
 RUkLl2WxOSRSBsROUb6ui1Le4fL28DEGJ7v5U3JPZBse6rjlU0vmJwL0JQI2w=
X-Received: by 2002:a17:902:f645:b0:2c9:fc14:588f with SMTP id
 d9443c01a7336-2ce9ec0f95fmr181359435ad.29.1784139392357; 
 Wed, 15 Jul 2026 11:16:32 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cf100e3946sm6817295ad.4.2026.07.15.11.16.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2026 11:16:31 -0700 (PDT)
Subject: [PATCH v9 5/8] drm/nouveau: Use hmm_range_fault_unlocked_timeout()
 for SVM faults
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: airlied@gmail.com, akhilesh@ee.iitb.ac.in, akpm@linux-foundation.org,
 corbet@lwn.net, dakr@kernel.org, david@kernel.org, decui@microsoft.com,
 haiyangz@microsoft.com, jgg@ziepe.ca, kees@kernel.org, kys@microsoft.com,
 leon@kernel.org, liam@infradead.org, lizhi.hou@amd.com, ljs@kernel.org,
 longli@microsoft.com, lyude@redhat.com, maarten.lankhorst@linux.intel.com,
 mamin506@gmail.com, mhocko@suse.com, mripard@kernel.org,
 nouveau@lists.freedesktop.org, ogabbay@kernel.org, oleg@redhat.com,
 rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
 skhan@linuxfoundation.org, skinsburskii@gmail.com, surenb@google.com,
 tzimmermann@suse.de, vbabka@kernel.org, wei.liu@kernel.org,
 skinsburskii@gmail.com
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-rdma@vger.kernel.org
Date: Wed, 15 Jul 2026 11:16:30 -0700
Message-ID: <178413939024.1155966.6246787744253724390.stgit@skinsburskii>
In-Reply-To: <178413903133.1155966.3904063656020521607.stgit@skinsburskii>
References: <178413903133.1155966.3904063656020521607.stgit@skinsburskii>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 17 Jul 2026 21:05:30 +0000
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

nouveau_range_fault() takes mmap_read_lock() only to call
hmm_range_fault(). It also keeps a single HMM_RANGE_DEFAULT_TIMEOUT
deadline across both HMM -EBUSY retries and post-fault
mmu_interval_read_retry() retries.

Use hmm_range_fault_unlocked_timeout() instead. The HMM helper now owns
the mmap lock and refreshes range->notifier_seq for its internal retries.
Nouveau keeps its existing absolute deadline in the outer loop and passes
the remaining jiffies to the helper for each fault attempt, so retries
caused by mmu_interval_read_retry() do not reset the overall retry budget.

Nouveau still validates the interval notifier sequence while holding
svmm->mutex before programming the GPU mapping.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c |   20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index dcc92131488e..58735446d783 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -678,20 +678,22 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
 	range.end = notifier->notifier.interval_tree.last + 1;
 
 	while (true) {
-		if (time_after(jiffies, timeout)) {
+		long remaining = timeout - jiffies;
+
+		/*
+		 * The HMM timeout only bounds retries while HMM is walking and
+		 * faulting the range. This fault is handled by a kernel worker,
+		 * so fatal signals from the faulting process cannot stop an
+		 * endless stream of invalidations here.
+		 */
+		if (time_after_eq(jiffies, timeout)) {
 			ret = -EBUSY;
 			goto out;
 		}
 
-		range.notifier_seq = mmu_interval_read_begin(range.notifier);
-		mmap_read_lock(mm);
-		ret = hmm_range_fault(&range);
-		mmap_read_unlock(mm);
-		if (ret) {
-			if (ret == -EBUSY)
-				continue;
+		ret = hmm_range_fault_unlocked_timeout(&range, remaining);
+		if (ret)
 			goto out;
-		}
 
 		mutex_lock(&svmm->mutex);
 		if (mmu_interval_read_retry(range.notifier,


