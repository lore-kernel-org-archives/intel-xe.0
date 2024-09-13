Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6125FFA372B
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 08:34:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28FC110ECC3;
	Fri, 13 Sep 2024 08:34:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="q6WtlUCb";
	dkim-atps=neutral
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D571610ECC3
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Sep 2024 08:34:56 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-535be093a43so2511571e87.3
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Sep 2024 01:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726216495; x=1726821295; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HdQNk7WlolSBC0SnkZxS6Qmm7m0gZkM/c9SaYxRAkc4=;
 b=q6WtlUCbFep62lrzve2UF+LP+bShqcYUwyT7kIh2kWR+Bw8lfNYyn9ZcZPSPLIgS/5
 Z4xEWUxh0ltbqYC1uXxQf4l/ECiBi7mblLp9ziqdUxJVdiQIPXErKStZOUt4uTPkdyRQ
 wZvFvXWDuLrmMJWiGwbLBZPgyTzR7Uqy2sofwWS/o4RI2l9VhmeqbMnOJuVg/x3D7KF9
 Xz3L+dyomYR+RDJ4hD1e3etpiws7yZtbPFFM3Gq/En5CZCENPiy/ilS0jpoV+FyxLfDq
 12XK5H1HgtIsDOqmjFIabPhkYGxiUHvlOcWZgnviuiXCq87JpBvzGZP6Fv3uzzIXQM5t
 lsWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726216495; x=1726821295;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HdQNk7WlolSBC0SnkZxS6Qmm7m0gZkM/c9SaYxRAkc4=;
 b=ksbI9EVxBjurCUsaSdaQNJCR1t+nMScXWUg/Z8Rx2R8MT/lH86AT2NLRaAoRxRJunx
 lomquACQZF3xCQ4auyA/jjgs9IdyJh1Jzye8Nhzm8Z4NGnUc0llal1+VxaYTtlPoWQEh
 zn/nRUvbSSAYQnmBq7icNVhhGAZkbcEEJ4WHa6wcS70Gp+q5H/7+RiEV0c05BlkeOwIS
 6QawutjsQhZ+vpHR+2/Htq72k1DJbWe5kDcMuMLedfvXdmwaX8hbzIYMHd4g8RtnLsS6
 jMhmIo6yI5trhwgRbW3wI82AO92cIAof6lT6H98wjCKgq8fktHg+WsQu/BxTJYrHH9fA
 HXdQ==
X-Gm-Message-State: AOJu0Yz2M3AbyCR0eFGNyZl7zn5F6k64Ye3pE9np4v2xw1D/csifEGv4
 Dkmnoh+5N3WiUBmNkeBwWGEJmYHfjGA+gKtT6hc3Ci+xl82E8gwppThZ+NcpNYw=
X-Google-Smtp-Source: AGHT+IFMZnrzpyuwmpr2NaUAkdm+dX+oBE6GxaU8ObSTVcV8KiUHU47ojCoAYhBLT05AEdcRebJcKw==
X-Received: by 2002:a05:6512:ac8:b0:52c:c032:538d with SMTP id
 2adb3069b0e04-53678fc857bmr3037968e87.27.1726216494458; 
 Fri, 13 Sep 2024 01:34:54 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd5214fsm7348259a12.54.2024.09.13.01.34.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 01:34:53 -0700 (PDT)
Date: Fri, 13 Sep 2024 11:34:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [bug report] drm/xe: Add a xe_bo subtest for shrinking / swapping
Message-ID: <49084e6a-a2f3-42e2-8bb5-8744694ea411@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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

Hello Thomas Hellström,

Commit 5a90b60db5e6 ("drm/xe: Add a xe_bo subtest for shrinking /
swapping") from Sep 9, 2024 (linux-next), leads to the following
Smatch static checker warning:

	drivers/gpu/drm/xe/tests/xe_bo.c:472 shrink_test_run_device()
	error: uninitialized symbol 'purgeable'.

drivers/gpu/drm/xe/tests/xe_bo.c
    437 static int shrink_test_run_device(struct xe_device *xe)
    438 {
    439         struct kunit *test = kunit_get_current_test();
    440         LIST_HEAD(bos);
    441         struct xe_bo_link *link, *next;
    442         struct sysinfo si;
    443         size_t ram, ram_and_swap, purgeable, alloced, to_alloc, limit;
    444         unsigned int interrupted = 0, successful = 0, count = 0;
    445         struct rnd_state prng;
    446         u64 rand_seed;
    447         bool failed = false;
    448 
    449         rand_seed = get_random_u64();
    450         prandom_seed_state(&prng, rand_seed);
    451         kunit_info(test, "Random seed is 0x%016llx.\n",
    452                    (unsigned long long)rand_seed);
    453 
    454         /* Skip if execution time is expected to be too long. */
    455 
    456         limit = SZ_32G;
    457         /* IGFX with flat CCS needs to copy when swapping / shrinking */
    458         if (!IS_DGFX(xe) && xe_device_has_flat_ccs(xe))
    459                 limit = SZ_16G;
    460 
    461         si_meminfo(&si);
    462         ram = (size_t)si.freeram * si.mem_unit;
    463         if (ram > limit) {
    464                 kunit_skip(test, "Too long expected execution time.\n");
    465                 return 0;
    466         }
    467         to_alloc = ram * 2;
    468 
    469         ram_and_swap = ram + get_nr_swap_pages() * PAGE_SIZE;
    470         if (to_alloc > ram_and_swap)
    471                 purgeable = to_alloc - ram_and_swap;

purgeable isn't initialized on the else path.  Also I think Sparse will complain
that there is another bool purgeable variable declared later in the function so
the name is potentially confusing.

regards,
dan carpenter

--> 472         purgeable += purgeable / 5;
    473 
    474         kunit_info(test, "Free ram is %lu bytes. Will allocate twice of that.\n",
    475                    (unsigned long)ram);
    476         for (alloced = 0; alloced < to_alloc; alloced += XE_BO_SHRINK_SIZE) {
    477                 struct xe_bo *bo;
    478                 unsigned int mem_type;
    479                 struct xe_ttm_tt *xe_tt;
    480 
    481                 link = kzalloc(sizeof(*link), GFP_KERNEL);
    482                 if (!link) {
    483                         KUNIT_FAIL(test, "Unexpected link allocation failure\n");
    484                         failed = true;
    485                         break;
    486                 }
    487 
    488                 INIT_LIST_HEAD(&link->link);
    489 
    490                 /* We can create bos using WC caching here. But it is slower. */
    491                 bo = xe_bo_create_user(xe, NULL, NULL, XE_BO_SHRINK_SIZE,
    492                                        DRM_XE_GEM_CPU_CACHING_WB,
    493                                        XE_BO_FLAG_SYSTEM);
    494                 if (IS_ERR(bo)) {
    495                         if (bo != ERR_PTR(-ENOMEM) && bo != ERR_PTR(-ENOSPC) &&
    496                             bo != ERR_PTR(-EINTR) && bo != ERR_PTR(-ERESTARTSYS))
    497                                 KUNIT_FAIL(test, "Error creating bo: %pe\n", bo);
    498                         kfree(link);
    499                         failed = true;
    500                         break;
    501                 }
    502                 xe_bo_lock(bo, false);
    503                 xe_tt = container_of(bo->ttm.ttm, typeof(*xe_tt), ttm);
    504 
    505                 /*
    506                  * Allocate purgeable bos first, because if we do it the
    507                  * other way around, they may not be subject to swapping...
    508                  */
    509                 if (alloced < purgeable) {
    510                         xe_tt->purgeable = true;
    511                         bo->ttm.priority = 0;
    512                 } else {
    513                         int ret = shrink_test_fill_random(bo, &prng, link);
    514 
    515                         if (ret) {
    516                                 xe_bo_unlock(bo);
    517                                 xe_bo_put(bo);
    518                                 KUNIT_FAIL(test, "Error filling bo with random data: %pe\n",
    519                                            ERR_PTR(ret));
    520                                 kfree(link);
    521                                 failed = true;
    522                                 break;
    523                         }
    524                 }
    525 
    526                 mem_type = bo->ttm.resource->mem_type;
    527                 xe_bo_unlock(bo);
    528                 link->bo = bo;
    529                 list_add_tail(&link->link, &bos);
    530 
    531                 if (mem_type != XE_PL_TT) {
    532                         KUNIT_FAIL(test, "Bo in incorrect memory type: %u\n",
    533                                    bo->ttm.resource->mem_type);
    534                         failed = true;
    535                 }
    536                 cond_resched();
    537                 if (signal_pending(current))
    538                         break;
    539         }
    540 
    541         /*
    542          * Read back and destroy bos. Reset the pseudo-random seed to get an
    543          * identical pseudo-random number sequence for readback.
    544          */
    545         prandom_seed_state(&prng, rand_seed);
    546         list_for_each_entry_safe(link, next, &bos, link) {
    547                 static struct ttm_operation_ctx ctx = {.interruptible = true};
    548                 struct xe_bo *bo = link->bo;
    549                 struct xe_ttm_tt *xe_tt;
    550                 int ret;
    551 
    552                 count++;
    553                 if (!signal_pending(current) && !failed) {
    554                         bool purgeable, intr = false;
    555 
    556                         xe_bo_lock(bo, NULL);
    557 
    558                         /* xe_tt->purgeable is cleared on validate. */
    559                         xe_tt = container_of(bo->ttm.ttm, typeof(*xe_tt), ttm);
    560                         purgeable = xe_tt->purgeable;
    561                         do {
    562                                 ret = ttm_bo_validate(&bo->ttm, &tt_placement, &ctx);
    563                                 if (ret == -EINTR)
    564                                         intr = true;
    565                         } while (ret == -EINTR && !signal_pending(current));
    566 
    567                         if (!ret && !purgeable)
    568                                 failed = shrink_test_verify(test, bo, count, &prng, link);
    569 
    570                         xe_bo_unlock(bo);
    571                         if (ret) {
    572                                 KUNIT_FAIL(test, "Validation failed: %pe\n",
    573                                            ERR_PTR(ret));
    574                                 failed = true;
    575                         } else if (intr) {
    576                                 interrupted++;
    577                         } else {
    578                                 successful++;
    579                         }
    580                 }
    581                 xe_bo_put(link->bo);
    582                 list_del(&link->link);
    583                 kfree(link);
    584         }
    585         kunit_info(test, "Readbacks interrupted: %u successful: %u\n",
    586                    interrupted, successful);
    587 
    588         return 0;
    589 }
