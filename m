Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4996AC44501
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 12:56:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFA0410EF95;
	Wed,  1 Jul 2026 12:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NsA9lH1W";
	dkim-atps=neutral
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3412788FB2
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jun 2026 11:29:08 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-691c5776f95so1435856a12.3
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jun 2026 04:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782473346; x=1783078146; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YRuAe0RjhwEXrW/i/NoudbwVnvnG5VFmyAAGQ0HVJBo=;
 b=NsA9lH1WIYgV0u5/XHx0X27enaXy1s/dk8xiR8EHP66dpT8EmQhBpxEmIFuNP46siQ
 NyOhCEr/n3kn8j/B+MdFDfey9CrBtog1Kf3GL3IZlv5emijKMnHTRXXz1qBs8tl2EYYk
 6uPVQ0SrRPDE1Rl7gbnbH1gtsIIErAdhiMaU13eY4/jJ8EQdeQRWdSAnguNmrrIA94cu
 LhAopt/31ghFRXjLimkyFkFHDf+YiZDf91QgfEgt5jq/WOd4noKRJ7Xml6MBODOLzGOQ
 qmnQOUt484wRcUZF9HI7ciuqVYM/ZJGWqnbCR5anIgnC5jazySrW2+IF28SvXYJsL6mT
 Y7uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782473346; x=1783078146;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YRuAe0RjhwEXrW/i/NoudbwVnvnG5VFmyAAGQ0HVJBo=;
 b=mNKr/Sw6GBDMMDJy4dTezoc41PRLB0ph5iqKCsMvAdwopRH7qJbK9BulrqNOUC9K6B
 Wq5E2+0TPD+uZ9q2JwQArHzxJFkkhpLD5OvaPTKg8RRBjBD0PlpPf6n2fqKykTzFYXK1
 CvK6hAyUuNQ4lSfKiRR+EMR+TP/On7km6ee6gXCAi/wrcgUi7jWXnbgLQaO3kNcQciAe
 7SY9GAYEToh1pbt7Kw0DGKZ2CsCeYxs0MyAtDYOTXomtAHue8lhg+IyA9OhIpXzlAb3l
 2tAZOfCI4Ng8pD6FcN/jo/g1by2Yytsr8nNHrtqRbiWncwkfQfKVZiX6wXUZFwxaZeMD
 HUNw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpWfCNduBwpjoRGXKXCZnuOw1O6GA+5QW9dU8NFuNHra+efEiiuFN4CdwRR2HCEHjpEWZWFZiwM/w==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpXpV6EywYObK4tb0gmJm+9xmLJT4+p/wG1lHYiEyIlpHUn6gn
 0CUrEB7pkxNmFaHon9cqh2Ej5YL4m9J1wjpvY+MjAc/bDnek4OGQE4x5
X-Gm-Gg: AfdE7cnW8WRJM5Ej2vTS05SXjjWNkJ59UArS19gIlwW7geC3/Ui8t7BtnK36lezaKDu
 ziKRbJoCJ8mUZxGwXwtohk4ln8gMzMJgA/5b0wAeysgKGg8Q4tFdPS8SVoeNNEpfXdPQ5B6+bft
 EGfE3RYMTel+UPymoIJFb4TevipIY6Z20KpMA1iheyh4KYfYjTCYp0e7pf0o9KzmA/lOh/IzYY7
 zrxSj5fRrjpjh/lX+gSLJ0M1RyYuz5E6zjVU1dduJx/0u6f/r3t5TMsbw+y2VDRR7dgw75/qqtU
 E9eMgf9z8MaAtsiVo4gKK4vVfoKhnh6ef6uqjABQuvFCpe0S/b++vpXmcIcRvJAYkW71n+z+2FI
 rq4KyC3TL6s10ReeZwIsRddgxQGxVMRlVFwI2Qw7a0zbJpd0A3Pf7dVxOGt9Na5f3ow05UqVYIg
 Ve2BOonPulXMtCWAn6I1xO4BQW+vvGRCagwblbQ3L+PxMM/3tWnQa01By82GMmx+XkldIfneWtS
 SfHZFaM4J92z46/xQMOYdODabE9IlaVmw==
X-Received: by 2002:a17:907:1c8f:b0:c12:3112:e08b with SMTP id
 a640c23a62f3a-c123112e8c3mr41353966b.27.1782473346463; 
 Fri, 26 Jun 2026 04:29:06 -0700 (PDT)
Received: from fedora ([154.66.167.183]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c122176f39csm88811566b.21.2026.06.26.04.29.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 04:29:06 -0700 (PDT)
From: aquiles <achillezongo07@gmail.com>
To: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com
Cc: airlied@gmail.com, simona@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 aquiles <achillezongo07@gmail.com>
Subject: [PATCH 2/2] drm/xe: skip resv fence wait in xe_svm_invalidate if no
 ranges are bound
Date: Fri, 26 Jun 2026 11:26:38 +0000
Message-ID: <20260626112638.2042298-2-achillezongo07@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260626112638.2042298-1-achillezongo07@gmail.com>
References: <20260626112638.2042298-1-achillezongo07@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 01 Jul 2026 12:56:31 +0000
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

xe_svm_invalidate() waited on the VM's reservation object fences before
processing MMU notifier events, even when no range in the affected
address region had active GPU bindings (tile_present == 0).

Add a pre-scan over the affected ranges and skip dma_resv_wait_timeout()
entirely when none require invalidation. This avoids stalling CPU reclaim
for the common case where MMU notifier events fire on unbound SVM ranges,
which is frequent on UMA systems under memory pressure.

Signed-off-by: aquiles <achillezongo07@gmail.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index e1651e70c..5d071bab3 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -233,6 +233,7 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
 	ktime_t start = xe_gt_stats_ktime_get();
 	u64 adj_start = mmu_range->start, adj_end = mmu_range->end;
 	u8 tile_mask = 0, id;
+	bool needs_inval = false;
 	long err;
 
 	xe_svm_assert_in_notifier(vm);
@@ -258,11 +259,22 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
 	if (xe_vm_is_closed(vm))
 		goto range_notifier_event_end;
 
-	/*
-	 * XXX: Less than ideal to always wait on VM's resv slots if an
-	 * invalidation is not required. Could walk range list twice to figure
-	 * out if an invalidations is need, but also not ideal.
-	 */
+	/* Pre-scan: skip fence wait if no range has active GPU bindings. */
+
+	r = first;
+	drm_gpusvm_for_each_range(r, notifier, adj_start, adj_end) {
+		struct xe_svm_range *range = to_xe_range(r);
+
+		if (!range->base.pages.flags.unmapped && range->tile_present) {
+			needs_inval = true;
+			break;
+		}
+
+	}
+	if (!needs_inval)
+		goto range_notifier_event_end;
+
+
 	err = dma_resv_wait_timeout(xe_vm_resv(vm),
 				    DMA_RESV_USAGE_BOOKKEEP,
 				    false, MAX_SCHEDULE_TIMEOUT);
-- 
2.54.0

