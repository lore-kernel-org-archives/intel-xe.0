Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DAFCD37B6
	for <intel-xe@archiver.kernel.org>; Sat,  9 May 2026 17:15:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA05910E1BE;
	Sat,  9 May 2026 17:14:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XJtP60oc";
	dkim-atps=neutral
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C72D10E1BE
 for <intel-xe@lists.freedesktop.org>; Sat,  9 May 2026 17:14:58 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-2ba0fc8b1f0so18853415ad.3
 for <intel-xe@lists.freedesktop.org>; Sat, 09 May 2026 10:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778346898; x=1778951698; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vsm6iRbgrzXYFIwlQx5X50SIqM7IIVrJi5fl7hMYCB8=;
 b=XJtP60ocQ3GOApz3UAbZ3I1fxacZFhbRRR0BjVVFiy98DTi1acO56Sgx8nCc2wQ1cv
 tyLkGCOgDugpQj5iqGnXaEeHFbLQhjnjFz7AWutEwsMBlA3Z2Cyjbbd6SRSPv40XgKyN
 jC2r4sDfjvd1Q+n8+dm3ZJWvzpQ46PdOBD8ibRu4q0fLyoUAjiArmcmfIoEXMoZqPJm4
 9lOqGAua/yLoNPnGKdQ7cJyx8voonXmz+LIAOB7QdpqirJua2lfvykvIiAXtsEgvrNz6
 D6b+9pHrh1SaiqdU33kUDvc6LOiLQImGy7acPIeIDNZTOe9clrW0xTmTbMT8eWiwmGrH
 xHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778346898; x=1778951698;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vsm6iRbgrzXYFIwlQx5X50SIqM7IIVrJi5fl7hMYCB8=;
 b=AVW97cYB+P+ZZaCBzzhMcpPCt1Pup8H3RufW8CI8GWSDxQyvr+z8QXyjHcDhyeRxMz
 t0LxpOotzDqnVUqQtX2OO9p+ZHR6ib2VxsYx758J+AhB0B1BwdMqR21oSljnboJ60FzU
 uKJiEOW+88W136pLIlJTdK4t1VrvfCdq0S0JnjCmXWtrUOrJ8t5iCSZZ99e6Ez6DySmu
 jhYhGDAA/CdLz6Vrh+QxMjaJ6Mho867PC6o0GjB9AgVBbnOTFAfKyPgjQB3aFE6YwTCf
 Q6Z9XnGtlwABCKFCxRlGcxYI0Pi+ZbLlFfQVLqnCKVgijj2a3X6PuVf2eMIVA1EMQSkU
 M8CA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8Fae0OCkhncg+KdKP1RfpGBR3boq1/15YDeRjYJZy5/xsrPU0ZZLAUzz4Cw1TdNN6j/a9i0AQUpA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvK+hCxi4o49sB8n7Hk9qvgmmEwrai9qYKXDjDW9tUcmntu2QJ
 P9A2njLjOTm7I3qux9bFFBfGMviqbDguGbbLW+IhQ7SjffhueajyLTY=
X-Gm-Gg: Acq92OGGr7L664k3KZvtjVaqTKOm02YINMvNZ3g2a/yDcWbem7JSPMzRUhXA0Mis0Xq
 55vgbbw2bte7NALTTE4lTNZ/KAYVREif2ESwtwF/Es3sRaaIPjfS0a2PO+vXKIzzJow9HP1GLVY
 4gG+wNEQwvoBtf/xJuQaXMn3pwLltN8lx+8OrYUFRT8AMR1wlCIBPyl3VmiDzGj25OreUbAEHwo
 MzSAsdCwxFH9CNsJxNLRTzfNTguU7EaUgaa6jy0jwc77ybhRmZuNUhndX3+NithKxQKRoUwelDm
 a0IJBe6Y4OnLQutxiWzHb3urFvqrX9wpUDmalyY3Y0iV7vkYfhrxlBOGT5IoctgbOAn6nVlNENr
 iKt5MGrShuT+j0QzAV/jKA9n1jiKd14FHjkZy4UZOYO3Plu5AMJW68b7mxGiHC+PV04+fauMoEl
 9gn1p76do0/JTONuDpUYi2+Aoeh+r5vpqIGjZxNTFzGCle7c5gH00k3XP/vwU3PgHTGYy1pcrU1
 yOl/KaZVjX5vxg=
X-Received: by 2002:a17:903:1249:b0:2b2:4611:5dca with SMTP id
 d9443c01a7336-2ba793aee10mr175847495ad.24.1778346897463; 
 Sat, 09 May 2026 10:14:57 -0700 (PDT)
Received: from coe.tail83f5bd.ts.net ([202.177.225.148])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2baf1ebd0ddsm55098795ad.75.2026.05.09.10.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 May 2026 10:14:57 -0700 (PDT)
From: Ramesh Adhikari <adhikari.resume@gmail.com>
To: matthew.brost@intel.com
Cc: thomas.hellstrom@linux.intel.com, intel-xe@lists.freedesktop.org,
 rodrigo.vivi@intel.com, stable@vger.kernel.org
Subject: Re: [PATCH v2] drm/xe: Add bounds check for num_binds to prevent
 memory exhaustion
Date: Sat,  9 May 2026 22:44:43 +0530
Message-ID: <20260509171443.58152-1-adhikari.resume@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507055352.61017-1-adhikari.resume@gmail.com>
References: <20260507055352.61017-1-adhikari.resume@gmail.com>
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

Hi Matthew and Thomas,

I apologize if you receive this message multiple times - I had mailing list 
subscription issues that prevented my earlier replies from reaching the 
archives. I'm now properly subscribed and following up on the discussion.

When I was tracing through the code, I found that vm_bind_ioctl_ops_create
allocates about 160 bytes per bind (drm_gpuva_ops + xe_vma_op) in the loop,
and those allocations use GFP_KERNEL without __GFP_ACCOUNT. That's separate
from the main arrays you already have protected with __GFP_ACCOUNT.

At 2048 binds that's only 320KB unaccounted, which is why I thought it was
safe to start conservative. But you're right - at 64k binds it would still
only be about 10MB unaccounted, which is probably fine and won't force
unnecessary fallbacks.

Should I send a v4 with 64k? Or do you think the loop allocations I found
need a different approach?

Thanks,
Ramesh
