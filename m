Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BCDC5AE59
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 09:13:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C32BE10E5BB;
	Wed, 28 May 2025 09:13:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Q0L42pDc";
	dkim-atps=neutral
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 058EE10E57B
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 09:13:26 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-450cb2ddd46so1272935e9.2
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 02:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1748423604; x=1749028404; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+rUNx2qLvPxlyA1uIjktFx0p0uHzbMXbhqe0Zofo8lM=;
 b=Q0L42pDcTVVaUNHX8VWbLxUsiiJrFBckd6OvBP2T0G+HUb6icaOba7YhpyRsrrT7kR
 JeDF48FpH45QYjUUNvGdo6XHbaERqXkhBtyrvthnoDLbman1oe5YFMGqNNkttPtjjBLi
 Ad6z/nKAOU3C6LAFC4U45vSV6/rYbAtk7OhK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748423604; x=1749028404;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+rUNx2qLvPxlyA1uIjktFx0p0uHzbMXbhqe0Zofo8lM=;
 b=faG7f63GexEOsV1L5xJSUmvcu6de/Vbayd6oIbNjjF1yrexMCMrBOy22AoH4/ODr3V
 gxKuDRSbezn9K/6BdoRYjaPiB6ENbMbHYdPrLqnrW9tyD7VpHAQkCXe633fk1svuASub
 6QyWEjhbpOwupKcA0Eb1kGlURblaJJn2rGVyibE+p8Rk7ZZeNg+CMiZ5j27xDOqiJXdU
 LgJnFHDj6Ik1JEtTiJuk2DW2VS1muurJqm68OkWNesJ7NF+L5mPlmaYzBVmds33i/9fx
 WvrbC0GPHl1Woz+ps3J43Z0cXnSkKF6Q3MtLWfbP2wmx9ioGztAC5LaS40uWzXIa+hng
 wmVw==
X-Gm-Message-State: AOJu0Yxd2UqAEmUrDsSoRJILweXZKkOaFxE7JoIOFASursQbjlkz+VFz
 YI7pGytOgqgbADolmeM0RYS3DBOtLCIzdhehF29NRwVnngrvs9ugraBoN7SLF3fUmAU=
X-Gm-Gg: ASbGnctcePmXFBDugB2MNmMjf+scLhhMqw8K3I1PJ+2jIxOMdw1TOF7H+h493GkeDIk
 1nGh7W8jpOQCaxzlc4f4aAmqevaAFB7UY81Hke1qBeikemt70OK6RaaMpOE9DdXwn3mpmFSNn0z
 wYUQWQVWwN1DttRPpSkw7qhE4CYjxWd/8HnTBw+iwgaAWvXslDuE4kPunlOZ3lIYSbWpz10gFud
 R7Iy+U9shmgUQrxqqUb7evmIeQ/4BYUmgeYzFVmp4+RI23xX1cUYC8fmksXGzs7Q2oZTTS7AoCS
 UJQnnIJrE80VmfMCuy+7Y9/dJJu2RnCJxNtIJV5PpNr1ms8xoPnng7DRcDzmhxM=
X-Google-Smtp-Source: AGHT+IFZkApOHN9sH0BUqdg15pZy112PVQjbkz64sKp26gJaeulIgTUAHu2/9z9Dg6eHy8aNy2Dh3A==
X-Received: by 2002:a05:600c:6214:b0:43c:e467:d6ce with SMTP id
 5b1f17b1804b1-44cc05358b3mr154675735e9.4.1748423604488; 
 Wed, 28 May 2025 02:13:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4500e1d85b5sm14811715e9.32.2025.05.28.02.13.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 02:13:24 -0700 (PDT)
From: Simona Vetter <simona.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: intel-xe@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>,
 Felix Kuehling <Felix.Kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
 Simona Vetter <simona.vetter@intel.com>
Subject: [PATCH 5/8] drm/amd/kfd: Add comment about possible
 drm_gem_handle_create() race
Date: Wed, 28 May 2025 11:13:03 +0200
Message-ID: <20250528091307.1894940-6-simona.vetter@ffwll.ch>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528091307.1894940-1-simona.vetter@ffwll.ch>
References: <20250528091307.1894940-1-simona.vetter@ffwll.ch>
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

I've long ago stopped trying to fully understand all the locking in
amdkfd, so maybe this is safe for a contrived reason. It's definitely
not how this should be done. Considers this more a request for a
proper patch.

Cc: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Signed-off-by: Simona Vetter <simona.vetter@intel.com>
Signed-off-by: Simona Vetter <simona.vetter@ffwll.ch>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 260165bbe373..aa51930a012b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -1774,6 +1774,8 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 	ret = drm_gem_handle_create(adev->kfd.client.file, gobj, &(*mem)->gem_handle);
 	if (ret)
 		goto err_gem_handle_create;
+	/* FIXME: Thou shall completely initialize the bo before calling
+	 * drm_gem_handle_create. Or explain why this is safe. */
 	bo = gem_to_amdgpu_bo(gobj);
 	if (bo_type == ttm_bo_type_sg) {
 		bo->tbo.sg = sg;
-- 
2.49.0

