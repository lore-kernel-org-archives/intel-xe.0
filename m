Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D541DC4451B
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jul 2026 21:06:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C2F10F62E;
	Fri, 17 Jul 2026 21:06:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cVhHrgaH";
	dkim-atps=neutral
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DFE110F123
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jul 2026 18:16:40 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2cad8076b01so69397095ad.2
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jul 2026 11:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784139400; x=1784744200; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:mime-version:user-agent
 :references:in-reply-to:message-id:date:cc:to:from:subject:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=xews/oLHPsdqsmPpn1oXU4/lUwRmc6mOTrGvCA27l7U=;
 b=cVhHrgaHhTNMpKyPxASD+efk7INLNPehfUrpBdOlYo06M+zQo0MT+XGbs4Yuaw2o4f
 JpMvn7qiWZZ0FRmkVAwZ3NZjTC3YgeuhI8leRDk1hB4qjMH3t/C5vco69z8OPAuV0kmj
 0C59Viyrq8/keiY95btqT2idXMc7bUwHkd2lNzPiZeGaiMdE0WlvUg8ab2JjulOEBaTV
 GZUiCUfxGM7EndgJcUeaJaku47X6EGojUdE5MfBZ6qX6yqG8RrZEAjk04DdJQvTwd1AE
 2kblR0X8jm2pr3mN2XxfM+RwI5ALtMVhSXthejitpslL7kx6LPuqTI5CvSXxY8TE95Uu
 PGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784139400; x=1784744200;
 h=content-transfer-encoding:content-type:mime-version:user-agent
 :references:in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=xews/oLHPsdqsmPpn1oXU4/lUwRmc6mOTrGvCA27l7U=;
 b=q9bh+gaHFAxbL8xAtlfHk3C0Ha9LQN1HGC575qZ+LOPUaZHDglCkkDY+iuAK4Tv6xv
 DmRXw3hhcg9aZAH+m6rjNFURYCKE5658PXD2arQRjCxvRe4BiGHyBKWLHkqDDtnCsheT
 hkVTHr71Ieqw2oVdZH51a8uz2t/SfxW3YxqiB2PjgR2WbntUmtIuHplvbCoGVKd67m59
 UBo52lTiIAcRiSxcEeI5BBuKvXRmoh4ffok3FaYf1LG1xnem1oI28Pf/4dR0kf1qT5bk
 NcKpbUIigoI94qY93d2QIxi9qFDBk7tQOK7dNs0dvhZ6kggKTU71wxuMfvf41iNANaqB
 nlKQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr2B4NekXIKaBpFFhnXEWGEm/x84z0qLF9ac5NTha6XI7gFvoZ8yfKx5TaRGGrgxBbq6jU3MpHV7w==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqLs44F+nQXhd4Xw3aGYp4FOjBpiUyyPpKbkYerNPA8jcCcKB7
 ZG9f3z5XT72qSWliAi6clUuepuaaPTUbvKiPOx4heAXiWatGAyHQVxCX
X-Gm-Gg: AfdE7clZTHuuVAIid7tfdPzoemQd7SQ1m43O39jOBjXXMeUhZvhLhIREDPVn6jXsbHl
 5KVrRuEZW3D86JFwYzKpsYlY+4936wkExJfyNQ6IbCXjW7JNvSlxVIouSk5iBKJnVqxxWWYPO0L
 H7wxrJWEgnxYf3972w98sRv31T+Lhp0LvmcXXzvPLbIHRcJRwVj96iVUgPRQgbjFd6SZtzuvNXJ
 XAl7MbYBEJKr8hOl07NZDszQ9zsdHeiuU97J7qO5NMhVyDsIUS4Et5ygjYfNAbFLA/l9u79rwnj
 Vmr6F6/M6ZvDz5kRchMqpqTwkJ1ZOKgIMPIALbzbBU4Ebv2sExmkMWJhYuLHNcByFHlfl5mZbaN
 aq3qxZZxDXYkYTUmreqD+L9pa4uW2v3gVtogfFsugbsA/2oPEXfgPWx3EkKj1jVqRd/ZQo/Yxyb
 mgTSlUqisiAPjLvpk/BL1qnRz2rB0wgxIYFrgpEftOVfLT/2V6cub+6Z0Sncc=
X-Received: by 2002:a17:902:ccd2:b0:2c8:4c29:afeb with SMTP id
 d9443c01a7336-2cee9a64cf7mr89372715ad.8.1784139399557; 
 Wed, 15 Jul 2026 11:16:39 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cf10592040sm6621985ad.55.2026.07.15.11.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2026 11:16:38 -0700 (PDT)
Subject: [PATCH v9 6/8] RDMA/umem: Use hmm_range_fault_unlocked_timeout() for
 ODP faults
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
Date: Wed, 15 Jul 2026 11:16:37 -0700
Message-ID: <178413939750.1155966.3639451690646685854.stgit@skinsburskii>
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

ib_umem_odp_map_dma_and_lock() takes mmap_read_lock() only around
hmm_range_fault(), then retries -EBUSY until HMM_RANGE_DEFAULT_TIMEOUT
expires.

Use hmm_range_fault_unlocked_timeout() instead. The HMM helper now owns
the mmap lock and refreshes range->notifier_seq for its internal retries.
ODP keeps using HMM_RANGE_DEFAULT_TIMEOUT for each HMM fault attempt,
while interval invalidation retries continue to be handled by the existing
outer loop.

ODP still validates the interval notifier sequence while holding umem_mutex
before DMA mapping pages.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 drivers/infiniband/core/umem_odp.c |   18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/infiniband/core/umem_odp.c b/drivers/infiniband/core/umem_odp.c
index 404fa1cc3254..9cc21cd762d9 100644
--- a/drivers/infiniband/core/umem_odp.c
+++ b/drivers/infiniband/core/umem_odp.c
@@ -329,7 +329,7 @@ int ib_umem_odp_map_dma_and_lock(struct ib_umem_odp *umem_odp, u64 user_virt,
 	struct mm_struct *owning_mm = umem_odp->umem.owning_mm;
 	int pfn_index, dma_index, ret = 0, start_idx;
 	unsigned int page_shift, hmm_order, pfn_start_idx;
-	unsigned long num_pfns, current_seq;
+	unsigned long num_pfns;
 	struct hmm_range range = {};
 	unsigned long timeout;
 
@@ -363,26 +363,18 @@ int ib_umem_odp_map_dma_and_lock(struct ib_umem_odp *umem_odp, u64 user_virt,
 	}
 
 	range.hmm_pfns = &(umem_odp->map.pfn_list[pfn_start_idx]);
-	timeout = jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	timeout = msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
 
 retry:
-	current_seq = range.notifier_seq =
-		mmu_interval_read_begin(&umem_odp->notifier);
-
-	mmap_read_lock(owning_mm);
-	ret = hmm_range_fault(&range);
-	mmap_read_unlock(owning_mm);
-	if (unlikely(ret)) {
-		if (ret == -EBUSY && !time_after(jiffies, timeout))
-			goto retry;
+	ret = hmm_range_fault_unlocked_timeout(&range, timeout);
+	if (unlikely(ret))
 		goto out_put_mm;
-	}
 
 	start_idx = (range.start - ib_umem_start(umem_odp)) >> page_shift;
 	dma_index = start_idx;
 
 	mutex_lock(&umem_odp->umem_mutex);
-	if (mmu_interval_read_retry(&umem_odp->notifier, current_seq)) {
+	if (mmu_interval_read_retry(&umem_odp->notifier, range.notifier_seq)) {
 		mutex_unlock(&umem_odp->umem_mutex);
 		goto retry;
 	}


