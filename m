Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 178A8CD4855
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 14:41:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF51A10E7CA;
	Mon, 11 May 2026 14:41:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="sF8wjz9T";
	dkim-atps=neutral
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C09C610E197
 for <intel-xe@lists.freedesktop.org>; Sat,  9 May 2026 15:43:08 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-837c09d2268so1288502b3a.0
 for <intel-xe@lists.freedesktop.org>; Sat, 09 May 2026 08:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778341388; x=1778946188; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2yXJqhcLXVF2p4UTzna8YZIe4V2LsKcR1MgCwvWlSaE=;
 b=sF8wjz9TFn5YiV8pz6IvMcUoG5BUAqBOKeXzQxhKcp5sl2LX8PsJdFT9DA6qpHpico
 MVA3I4zdrYyEEoeXnAlIT+ynduET6m43aXgUqbvi1vJYQ0sNKRqWaiMdXeZaExdS/J24
 JjP2bmTg19wCkv8N+sDtKtc0M59IskMVkQLZUS3XGY4KGuWEpgmi+qzdekPuLJf3wNyQ
 Q93iG3N+v3uYcj6ZByb9CzUvNA/3PfhqbApSuHZt2l6ELKASN3dkIVD63iKF/25r5yeg
 +1l/tjc7cAppeMddMwdXds2/8jTbIkLtO7ib+E7ZwNz/vpwqH9eJddwiPx9fXewKEv9X
 lFBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778341388; x=1778946188;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2yXJqhcLXVF2p4UTzna8YZIe4V2LsKcR1MgCwvWlSaE=;
 b=SAzDAh6k6MgXMNnt43ax/WI4XOv9n5kEZj/59p+UI9wpBQ07qhK6X40FUyRdEvDGW4
 P1z7PMo/LHz9q+5pSUmXu5Snx6qaOl1m4NnNCi9atLyC9Z/YvurXme8/2SEJ4YLD9xJ9
 k0dBkDg0kOw1FUIvYfFEfEIbywjk9+m6JKVNAis3GsP4VXuLV4g/1n/qpgzOfOTFbGMF
 4kwhMdRza+7PlQC/592dEdTiPewuMc13TV04c7LTT5+llPGKLWqNWwYoBHmRoVVBwoBO
 wS4U52FIMo1duScKedfshlUijHVJNrgInPok3X2mXpV9rVgKEhVpB70tjY/vOG4pQHv7
 I+vA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+UVPuo52gAa8yooM+FleH7iVF1HlER4XaS94Xmvv7Tg9c0+xUavp77kG/0VuFqH6VaI8OGcBiY5g==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrfzdlTque3slXEoWADRjKH/ZR48OezkzqGeHz3UHaYNY7UFDr
 jKMugS/p3iXnPVc6TVnkTWaKtsNOcUnGKTin611/yf7oxnhUE4mIvxQ=
X-Gm-Gg: Acq92OFd2QRBIYg+yHN+8M0usJZWl1iXCSWyF7ZUkqXJOTOGzNA3BAQuy2b2Q1PCA/a
 PsQ7Jg40xROdKXFCp8o/PWrQC2YpeXqyfeRTNn+u+sC/dsQmdR9jkons1+rBxtMlU26FL5nDTO+
 gWXMPY1iCPBzQfQUh6XYXlJsWFWpaNq8AO10djzpQlfu44BpuRQuCL2U1y5qrPz7HMVShHzCYvI
 mVFyeyYD111ick2gQMft1WBIbqUmPucQ1nUw8XDe4gGFNLGhJEd2EqICfuzbPQWH/zrgePwYQeY
 wrI2Ofvv9GD2WCkTiove/wwhnJ2v4LdC7v90oWMrDzBe9VGZri9UYJZitkVXtOgBmxDWqGtyVFe
 Oy3EdGLRW5NXzt3oGGOXpGdoBA9vrEHTlaFhULWhArAOba05QHPSAgPkfGmo6wwgv2bNfhR73ZM
 mYnpUkjf0vS0xVIJrJd0WK8MWLFWCXBeZ8qwu8ME/TSrCiTZAaW2r09D4ajAm1t7HyMrzxko8d7
 Ig=
X-Received: by 2002:a05:6a00:2442:b0:829:8942:2ca4 with SMTP id
 d2e1a72fcca58-83a5badbf5fmr16448655b3a.19.1778341387775; 
 Sat, 09 May 2026 08:43:07 -0700 (PDT)
Received: from coe.tail83f5bd.ts.net ([125.19.217.182])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-83965a3e3ecsm15848028b3a.19.2026.05.09.08.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 May 2026 08:43:06 -0700 (PDT)
From: Ramesh Adhikari <adhikari.resume@gmail.com>
To: matthew.brost@intel.com
Cc: thomas.hellstrom@linux.intel.com, intel-xe@lists.freedesktop.org,
 rodrigo.vivi@intel.com, stable@vger.kernel.org
Subject: Re: [PATCH v2] drm/xe: Add bounds check for num_binds to prevent
 memory exhaustion
Date: Sat,  9 May 2026 21:12:37 +0530
Message-ID: <20260509154237.57082-1-adhikari.resume@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507055352.61017-1-adhikari.resume@gmail.com>
References: <20260507055352.61017-1-adhikari.resume@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 11 May 2026 14:41:03 +0000
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

I apologize if you're receiving this message multiple times - I've tried 
sending replies twice before but they don't appear in the mailing list 
archives or on Patchwork, so I'm not sure if they reached you. I also 
attempted to send a v3 patch which similarly didn't appear. If you did 
receive my previous emails, I sincerely apologize for the duplicate messages.

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
