Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47AD3C5CFEB
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 07:09:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F208C10F1C4;
	Thu, 13 Aug 2026 07:09:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="efkkXlRL";
	dkim-atps=neutral
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0395C10F1A0
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 07:09:53 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-51c05dcdf49so3983261cf.0
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 00:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786604993; x=1787209793; darn=lists.freedesktop.org;
 h=content-disposition:content-type:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=f3MaYnYHOPM8bGKboWFu46JR1KiOLz9Hc+Ei/xGBa9w=;
 b=efkkXlRLQKE7fNhRw80r6Csjy05BYhc98KDmJ6rlQ8Zypp8HNtSd4Ygumj2c/iGz2W
 HLbNTyQlJjSmb56opkQsQnR/vaMbHHgfiEcCcVpUMTZ4O0oWSRE9WQ1FXwWb6Aj3hpyV
 YeChgjL1kBrGrtRgXYLS/coctAoxVJJqTl+0y8baXjhxu3C462IcYy8xgKyehfjVp11t
 bpVR32lEq6EBNgu7FxdXhZN9vT8Cqy9ktk9mIS5NcjFQGx4c4Z7nRd01i1WMmFv99TH/
 Hc1/Xi1epTmmjJXnZCKZh/RXiodxLpef2wmAl7llqn17OIlTJhDaIZc+RD9ONo4+R6pt
 IhOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786604993; x=1787209793;
 h=content-disposition:content-type:mime-version:message-id:subject:cc
 :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=f3MaYnYHOPM8bGKboWFu46JR1KiOLz9Hc+Ei/xGBa9w=;
 b=r/7yOcDRfPiz4gdVYWg6FLv8DCH8b4V8uOQDuP7boKMPb2hRq2toAe9+3F2+6lWWeE
 /LJpLy2L5QkzKc1TaB+/5gxBDQZINMdN4+0OHDIInKHLzg2BnG/MLJ5w9BNhddPhRW7X
 t58XfCyCUC0rDJSbHec0249rusz9mnV0KYa1XC4l5JHcLuOOLVvMtr6KlJM0R4gNoE+I
 PuJLGAcDkHQou8TPiniTbbtR0qcFz+gzcFF96EZRC5gm3Wk/h2myV/9vdhmD84rzJh/L
 RXpFHoQndooS0gwywnfplqx+n7cHAKDZYgiNgkWSegTTt5QM05hoNK0r0bSSvFCicued
 CyUg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq+EB+8PLafXYo6UyV28gV9f6B324PJe6OWV3viz9zBBk3ud9vr7VWueN25r6NKfDzwunCUcD9Yjw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzISPBmeVSxfToKYVyvCxNTCpGKBl7why89fU7rNkdZvmf+dFGC
 kfV/woixFh+ISBcAe1BUU9uD5DR1Go4g4Ap/Qdo7hHz2++/rou2ptKYc
X-Gm-Gg: AR+sD11jqX6aflVX0Wko+/4VWdsiJ67BDDI/bScr8ekcGMUnjF6bJfaqsX77ta97nBt
 jGCamsFOfMwqLwiS9nkiOG4uQSc/2Fjpp+IkFgglRnVB/g5VC/85nxJownQdERaSj29l5tIh3/+
 8ufvL0oy4CkvTiRDTaZofwFwuu36CWg9MwDHSi+dKGWOgVGpJAMtsmGrJOgNUnBszVQJbMZ4NsF
 mznHpfayBfNZbFPWpaGbgp5IjnzvJ0iekCNEnzKA961nDPjtd/CoPfsND6XAdzpImiYuhCFo+Pf
 ggqVX7rCC9rLagr48uCKhH82x169Sn/ifTI4Krd54rV/+V8T3KdEtZ0qjnWpYcCG+q2xBlPHYIX
 WBu3vDAlScWAj1fSs3pC0COdpvdTNm1m+mR/yarrxGIspLsHJ/MhHqdQKoe1YO07349+0cwquNv
 q5Jtwxnwi/DOx2UmdKnSNpitRj3cQHrdf3oRHTQLGreprz6sxeOPLpAQ==
X-Received: by 2002:ac8:5a05:0:b0:517:2c1e:8b6 with SMTP id
 d75a77b69052e-52d73e3bda5mr35334591cf.38.1786604992962; 
 Thu, 13 Aug 2026 00:09:52 -0700 (PDT)
Received: from localhost ([37.19.206.57]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-52d73dfaec3sm11467541cf.1.2026.08.13.00.09.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2026 00:09:52 -0700 (PDT)
Date: Thu, 13 Aug 2026 10:09:47 +0300
From: Dan Carpenter <error27@gmail.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matt Roper <matthew.d.roper@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Xin Wang <x.wang@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/xe: tests: fix error message in xe_migrate_sanity_test()
Message-ID: <an1tu0z3T-qX1ogn@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

This is supposed to print the error code but there is a copy and
paste bug so it prints "bo" instead of "err".

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 3c1be809be82..f10d9513747b 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -198,8 +198,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test,
 
 	err = xe_bo_vmap(bo);
 	if (err) {
-		KUNIT_FAIL(test, "Failed to vmap our pagetables: %li\n",
-			   PTR_ERR(bo));
+		KUNIT_FAIL(test, "Failed to vmap our pagetables: %d\n", err);
 		return;
 	}
 
-- 
2.53.0

