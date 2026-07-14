Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A9B8C44527
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jul 2026 21:05:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB89210F617;
	Fri, 17 Jul 2026 21:05:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DjUtYql7";
	dkim-atps=neutral
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87CA510E0D9
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 21:45:16 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-2ccf2360620so12383865ad.3
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 14:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784065516; x=1784670316; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:mime-version:user-agent
 :message-id:date:cc:to:from:subject:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=76ycW+rBxOZYacJ1Dbj+MtJGsoesj/kofKqPC3AXyqE=;
 b=DjUtYql7HCRwn7/CEQpU4n/PCycgq3HpOS0lJ7Ont5F4TQ/vr+c3DkCu8RApWL8psX
 uB1+oU88VGlFV1X0nd68zM9Spho3OQiL6GbP9hSYmmvkm293jdqjvi/Q+KmnMfsXLnvq
 Kzv970wah9rhIy9QXkNbcFVN+/PcnJ8qTM/OMdyQa7Gw7DGh5ZFMdU8FdoRHzzvpzs3r
 N62PYE4HeHQlr3znJJF5q/lW0HGxKKI5ZxgfLcDMY5n2VooBr54MMzvA8nNeTAElDowf
 2G9VS2Z6iRMzWz5fp14sm+e/00a5mLFshVWbRYePAgyYx7p3hWf9MLQIWZegnYZQtuac
 LlXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784065516; x=1784670316;
 h=content-transfer-encoding:content-type:mime-version:user-agent
 :message-id:date:cc:to:from:subject:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=76ycW+rBxOZYacJ1Dbj+MtJGsoesj/kofKqPC3AXyqE=;
 b=PCNj+7f1esHL4Hymm2wSqmrb7WIv9UH7DhL9dTdJxYMTgG61Xe7Vp5GVlHy3JAK8wG
 ZMZuzzkHvjmT2dTQ6lEh+1s9eljlopn0PiH+eUCMm+lIVa+RViDtRIKVUEjLRTMMLZB1
 VX7RY1ouvxWd4UtuZPqOf8OJj9WUB7JznAgckOl6sqo/53ApUtNROzH6AlTKumO/U1++
 V4lk8AEZdj778cqkOmcmoyeBIRDJJVumjf2DiPNzNLuDYcWb+ENALpw//vU3O3C4ZBpu
 znezKDgWLH5iliotm7A6C6MHb2lEgFE1O2yYBDF9mzwWBJWWaKvRUN+WVxIcGeolLcPm
 alWA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr2wJTXF3hjMHs+XkCBWfunqtOY5lrX/I7xdBm/7Xix5qw8IZnoKCyJUPcuVWxzH1+QFo8NrlX+xg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQvfeZDFpe/7mwZsNXA5yxpKpqn82ucEjh1jWUk+dvdb+JR6iJ
 R6rw9koaWth71TKGPDA6GKQCJmH18saR2ZfMb5OgsMwqFs1x9xri0G2w
X-Gm-Gg: AfdE7ckMkVvVihf6qo+SF+ZbgkDv0vbvgPW7T7KpG3SEK8uisJtvXgcPjuqzlAvwl6Y
 wMjG3rFnNETAh8YjLGTq1tCQF/kgeUUOufgmjvedS6zTONBs6oK4RW2LjIUfzRcHAm1mLDjr0ct
 0p21ltVnuWmu8sDbTOf78k+bs1TzTqovbQrJ+HMNuNPDm903vWIBNEtlj26OOhA5tDkauQreaR2
 SqpNYy6nsOw60kORGu2NSk6DIbfFvDRlHBM9nNIeKb7Sy3es/re8elwpzpaCiHUPzdnleCpEdz4
 5+o9wByHSsqI1bhnAXNS5QuK/UhOr5ADjQSSe6ePqCALb37c2Gwvqa2Kcy07zqsCpe75DAny0vC
 6Au5cFCHNn0l0EPxGUjjrbklRAi1/5t1ocrGN/3E1lyHeSHtHLAZ7Eb7AXXOcQHdSrUgjddFjwp
 Fjez0vw7Qb+07N+TkH4wwSENmfVv2hr6PZNZAL1H/A59P2FiHKk35OjFdsI9w=
X-Received: by 2002:a17:903:124c:b0:2ca:3e3f:4956 with SMTP id
 d9443c01a7336-2ce9f184054mr145126485ad.44.1784065515909; 
 Tue, 14 Jul 2026 14:45:15 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9d1e284sm123142975ad.40.2026.07.14.14.45.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2026 14:45:15 -0700 (PDT)
Subject: [PATCH] drm/gpusvm: Fix mm reference leak in range eviction
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 skinsburskii@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-xe@lists.freedesktop.org
Date: Tue, 14 Jul 2026 14:45:14 -0700
Message-ID: <178406551216.1092539.5238081578161393168.stgit@skinsburskii>
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

drm_gpusvm_range_evict() pins gpusvm->mm with mmget_not_zero() before
allocating the temporary HMM PFN array. If that allocation fails, the
function returns -ENOMEM directly and leaks the mm reference.

Route the allocation failure through the common mmput() path after
initializing err to -ENOMEM. This preserves the returned error while
balancing the mm reference acquired by mmget_not_zero().

Fixes: 99624bdff8670 ("drm/gpusvm: Add support for GPU Shared Virtual Memory")
Cc: stable@vger.kernel.org
Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 drivers/gpu/drm/drm_gpusvm.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 76e8a0028c7f..1a8bb83bd28d 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -1715,7 +1715,7 @@ int drm_gpusvm_range_evict(struct drm_gpusvm *gpusvm,
 	unsigned long *pfns;
 	unsigned long npages = npages_in_range(drm_gpusvm_range_start(range),
 					       drm_gpusvm_range_end(range));
-	int err = 0;
+	int err = -ENOMEM;
 	struct mm_struct *mm = gpusvm->mm;
 
 	if (!mmget_not_zero(mm))
@@ -1723,12 +1723,13 @@ int drm_gpusvm_range_evict(struct drm_gpusvm *gpusvm,
 
 	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
 	if (!pfns)
-		return -ENOMEM;
+		goto put_mm;
 
 	hmm_range.hmm_pfns = pfns;
 	err = hmm_range_fault_unlocked_timeout(&hmm_range, timeout);
 
 	kvfree(pfns);
+put_mm:
 	mmput(mm);
 
 	return err == -EBUSY ? -ETIME : err;


