Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D51CC282DE
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 10:48:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E99C10E3F4;
	Mon, 10 Mar 2025 10:48:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UzzfUNn2";
	dkim-atps=neutral
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31CE310E3F4
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Mar 2025 10:48:06 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3913d129c1aso1041016f8f.0
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Mar 2025 03:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741603685; x=1742208485; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E0yircpCo/QVU3P+N7sKYScgPv6naVVovFtBRlbgD6Q=;
 b=UzzfUNn2h61lx78Lvd67li16jeAMAfcj7P91XCFhSKrhSoohUAH16TlJeIzwwv/kxb
 r/IKR3aA2gp7NCEqJ1xXKMXp+H6VBuofxUlwuPzLS1qAAJuorUsEFW0IYxE+JUAJcXnk
 SBeCQ7rjQbq2kT4YK+P5+UpLiKMRG5VI2wtcJkFVBsTHdvQ+Oi0Xr+dVYqh96eCQnMj8
 hW3dr00ffcAES5SiAxA2rY7ScRlnoj1kOdjCLBqSLKneRHi8biN92jFLlyEH19p+Bbqu
 C57Y5rqRVZOF7U204yAm/t6hW1a76aLjm3FTJO/gfBz3WFXCBU713I4C3s+0cCmSgOMe
 n3sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741603685; x=1742208485;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E0yircpCo/QVU3P+N7sKYScgPv6naVVovFtBRlbgD6Q=;
 b=Ms+Q3MTffInEVuuIFFmdzvHVAJ/fFDezQ7pSPvt6yGzkUSSvdD++BPz9kScJ7K6cV8
 gE38gaJJ7zNZ/6OjVL3ad4lCkLBnO6WPclnYE1Ij8Fd1frtTCqDI9X2iN7qPtwMRZiTB
 JgRRLPtPcMCFXdblBBvTs9merz6PfVmKe8PEQ2oD7PY1bHA/tQBrlu5Pek4gwdSUY09f
 SLhAENYH8EGJY/uprhMhuE4h4SRshbux9uCjjtJn49Xpq2gz/sh1UBkYw0yI8gmeE5yM
 LUbCmGhYwZqsmuAMnRCtYF/umxpGqmz7cMok6P10bmtXyfuCtwPusn7xHBMzxkrr78oJ
 X1tQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKzhGIUd46s2CUtuzCBKbF4FQWfzaChsiQDGoKCY3xwR+rlrtfrLNjVIa0v44jNSUgIQUnVk9rSw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydFGGRY9oDbEbuSQMHYgB0eUu0jJZcBQbEKyASHoveoVe4IQMb
 XEgPBoqR+LOJ/htOXtA8zxYdNcCjNct2psuCBVWVBW7uGkRCo1mFvqGN0y5sKrY=
X-Gm-Gg: ASbGncuUUKp+Eo1OuZ4GkzTpHnNu1ISmIhju+PRGl6HuyIfpoZOVvm0Cz3PWo/nCgMl
 NOhjgmEm6XWJFV+VZhX+QRuPJR6dn81ULgcPB8RvoO/o7DvkoortUs5lSFkDRA54sAcfbl35fzG
 nf/E3oLvONvGWnYYPu3lnET3ynf7o54BVbRd+4beiaDiOagZVNd8dnL9sdxIv9QxtsVfwtaMywu
 kLDSNqT1SdgI93POzqpwghMJa58TGGlVgzh7D4qiZw0zgvb1sO+/g4n4Zfiqwt/hV3vRSbTES7a
 46XxHD3TT1lZWzPkIrHyMaW1vSbeplOSh3PGvkBD/UzCzDLKHsMidVZ3mF3y
X-Google-Smtp-Source: AGHT+IFlBbMsdDkibGs+3E90ni36pDU1DtBtQx2GYLaxL8v3OUzQ9CG7PxwMtpFknCcyL00KBQQ92Q==
X-Received: by 2002:a5d:47cb:0:b0:390:df83:1f22 with SMTP id
 ffacd0b85a97d-3913af390a9mr5568803f8f.25.1741603684736; 
 Mon, 10 Mar 2025 03:48:04 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3912c0e2bb7sm14676793f8f.63.2025.03.10.03.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 03:48:04 -0700 (PDT)
Date: Mon, 10 Mar 2025 13:48:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/xe: Fix uninitialized variable in xe_vm_bind_ioctl()
Message-ID: <4a74b296-8b51-4dab-a2f1-69919da1ca62@stanley.mountain>
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

The error handling assumes that vm_bind_ioctl_check_args() will
initialize "bind_ops" but there are a couple early returns where that's
not true.  Initialize "bind_ops" to NULL from the start.

Fixes: b43e864af0d4 ("drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/xe/xe_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 22a26aff3a6e..d85759b958d0 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3287,7 +3287,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	struct xe_exec_queue *q = NULL;
 	u32 num_syncs, num_ufence = 0;
 	struct xe_sync_entry *syncs = NULL;
-	struct drm_xe_vm_bind_op *bind_ops;
+	struct drm_xe_vm_bind_op *bind_ops = NULL;
 	struct xe_vma_ops vops;
 	struct dma_fence *fence;
 	int err;
-- 
2.47.2

