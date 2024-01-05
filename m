Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1DC5C47077
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jan 2024 17:11:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F0110E65F;
	Fri,  5 Jan 2024 17:11:05 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B4F10E5F2
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jan 2024 12:20:52 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40d60c49ee7so15389595e9.0
 for <intel-xe@lists.freedesktop.org>; Fri, 05 Jan 2024 04:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704457251; x=1705062051; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TdWvi7V/uZtXCKkztPHaEVwsHEBdM0O/htD24ciXgWs=;
 b=LoTFnyL7ua2OnglrPyZp63KocrSM++B3seCrpYgmLNj3MjufeUZDYuZtAbmQU4L1+s
 sgOnnE+3BKYU0/yS93/ax71hMXuJ98pEXuRSp7eEO1PVkAUpRf2oOur+34yhMIow+ekj
 oBnDBXPhnQIJPMnRT323GqIYsTMEOc2qNh2pPii7xPkDsewXgdV/wS2m0aHHyKZVwv5c
 mOaSd5CfdiXp1PvLWTuNPKcoBFMeU29/OGoKlO8TWKPFZsp4npcpIHc999dDx+DaLpX+
 lFKNwdzYt7eQggL2y8mkpxPXkQ262CfyKI9H5aSL67eciCAoBXG1+UUyjWecFPvHSO7C
 sQIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704457251; x=1705062051;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TdWvi7V/uZtXCKkztPHaEVwsHEBdM0O/htD24ciXgWs=;
 b=RB7El9pG3PbAEPLqA7ojpUq8YzgEGqU48+EldJHxHmapWYE0zJRzu3p8tPW7D5nlBo
 Aao76uzlREpptCtCg6Gmx3VdEyoLnuV5UsngHy3ZJ4Bskzq4mkSpSEdeQBE3q9JYsmD4
 oITzlK/T2CRFw9iPwfcuQwo+nD1f+cjoQe1ZcnZuXdUN/iVWR/bINDXSzlk645QPYx8z
 wlf091sWuo06+b7b12ubZfBHTe5XvXTuqFqvlvjc3nkzZpbP+W6tzydh8Ty7j9anUlKO
 UHw42LAzfrbKZ8ipX9YyMDVzwTPPrLet2bWKA+G2/hb2Tymt4f5ywmATUahsbmdLXQ9S
 IndQ==
X-Gm-Message-State: AOJu0Yyw2x5lRzp+E3LtdcsB/lwXbb9jOWuDbgwvk8XllJ9JCznsJ5sZ
 YObV2nH0kZgfoYDejyXn/HVYV3nVFNPwPV9Dicmr7ur9/0A=
X-Google-Smtp-Source: AGHT+IEj5w5HYyjjjp7bnZPKhFoqEcMSdjd9OrOuXjpHpb8/yrG2PINsAuFpx6Z7MTRWcsfd6KHTFg==
X-Received: by 2002:a05:600c:35c3:b0:40e:3505:32e5 with SMTP id
 r3-20020a05600c35c300b0040e350532e5mr1129553wmq.108.1704457251216; 
 Fri, 05 Jan 2024 04:20:51 -0800 (PST)
Received: from localhost ([102.140.209.237]) by smtp.gmail.com with ESMTPSA id
 l42-20020a05600c1d2a00b004030e8ff964sm1428951wms.34.2024.01.05.04.20.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 04:20:50 -0800 (PST)
Date: Fri, 5 Jan 2024 15:20:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: matthew.brost@intel.com
Subject: [bug report] drm/xe: error pointer dereferences in test/xe_migrate.c
Message-ID: <f78cee14-5635-4a50-91bf-536cff5e3bed@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Fri, 05 Jan 2024 17:11:05 +0000
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hello Matthew Brost,

The patch dd08ebf6c352: "drm/xe: Introduce a new DRM driver for Intel
GPUs" from Mar 30, 2023 (linux-next), leads to the following Smatch
static checker warning:

drivers/gpu/drm/xe/tests/xe_migrate.c:147 test_copy() warn: passing error pointer 'fence' to dma_fence_put()
drivers/gpu/drm/xe/tests/xe_migrate.c:165 test_copy() warn: passing error pointer 'fence' to dma_fence_put()
drivers/gpu/drm/xe/tests/xe_migrate.c:182 test_copy() warn: passing error pointer 'fence' to dma_fence_put()

drivers/gpu/drm/xe/tests/xe_migrate.c
    135 
    136         xe_map_memset(xe, &remote->vmap, 0, 0xd0, remote->size);
    137         fence = xe_migrate_clear(m, remote, remote->ttm.resource);

Btw, xe_migrate_clear() can return both error pointers and NULL but
there is no documentation what the NULL means and returning NULL looks
like a bug.

    138         if (!sanity_fence_failed(xe, fence, big ? "Clearing remote big bo" :
    139                                  "Clearing remote small bo", test)) {
    140                 retval = xe_map_rd(xe, &remote->vmap, 0, u64);
    141                 check(retval, expected, "remote first offset should be cleared",
    142                       test);
    143                 retval = xe_map_rd(xe, &remote->vmap, remote->size - 8, u64);
    144                 check(retval, expected, "remote last offset should be cleared",
    145                       test);
    146         }
--> 147         dma_fence_put(fence);
                              ^^^^^
This will crash with an error pointer dereference.

    148 
    149         /* Try to copy 0xc0 from remote to vram with 2MB or 64KiB/4KiB pages */
    150         xe_map_memset(xe, &remote->vmap, 0, 0xc0, remote->size);
    151         xe_map_memset(xe, &bo->vmap, 0, 0xd0, bo->size);

regards,
dan carpenter
