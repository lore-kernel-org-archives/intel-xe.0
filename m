Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8187606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 01:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=appMNZ8H
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FCC510F2B8;
	Tue, 24 Nov 2026 01:41:55 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F80F10F2B8
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 01:41:49 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-9213e130a16so22210396d6.1
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 17:41:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795484508; cv=none;
 d=google.com; s=arc-20260327;
 b=sfVr0VEQDwl5t7G8KG41+3ufP7hYFP6h8KsM1xjyhIDLq8OL+1S5Hf1VJ3+RsUnl6Z
 oj+/MM7UGvnSmDaZqspVNTwgX5FxTSk3QBPAo+kChNiOjlNrVcQuplepFDQ0vyVFYcB6
 0DvdVORy3l63/5t+xw4lIusLJL58/3kQRWPwSpvh8mtvY33ze8+a0FLNhGfM+oK5KbBO
 BO3lzOJLx9EOKkDrK/L+lIsWIUtlyAK5dQYSjvNi8DQR/LUu6g7GSBBMFVSokIbZ3oBk
 L99s1gpxse8bWvcoWa/IosBI2OUKTxUtsl6jm2q9CxtquXsQ62XQT8sP1QcRToKH0OR9
 LWzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=1nyS5zQ3JA24VIPo3NXdZD11p5Dc6cnKOuQvmzCMlI0=;
 fh=f+axdefZtyU3VXmDYDGpl3+wQCWbKSih/wEFLJZiyR8=;
 b=YBPB8SmeA+Bbr2fmNxJBJgZsfoOR8ErDjjjH/YwXzlMkRlahwP5u2zx1u8oNoDJZJB
 aWlVQM6m14bYYkzPNABAH6E3STQjzCfufKwQ+7DlRnrFB3SEv/5mQgpwyyU75PGkKq7Z
 SoStxRNLDyP/1HtOQ3C3DsqraCgaDS6dmoBDZMYfYk/HhiUOZgKFZpTyFmvyp3SE/mNH
 0Wq7zm0GNQeGu2jdSjAzG6+dLnqsYwqpASAzO7nRr+eQpvjAWyY1zYLpAVlloQ76J0mV
 7zjnfbuFV28ijhmhrQlI660Rx55qMTnWcYTRyuBFIqdtJWWEiza5xQxLEO8L5fzqQTd8
 UOzA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795484508; x=1796089308; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=1nyS5zQ3JA24VIPo3NXdZD11p5Dc6cnKOuQvmzCMlI0=;
 b=appMNZ8Hnac/gIVbZfNqhmjC2kwWE7FqfLEfPAFs4Qd6D2QzcNfXVQYnWDPhoW01+T
 EfpOeQwM4Y1HebXiNHzXBUQgdkx9vJ3Kzp0phEysBCzHnmCavOLTAjnrxxmMuGTxRZw8
 BKv/mFjysmlZsH+crIJ/8XWDbNaMu5I6/x533RoXOh/Hlfvdx+msL9rl0G2KpEhM/Q1Z
 dX2Rly//v7jbXrB7mnui6MJrZXNHSFK9PKG3paBSIpl8KNlyFUkjUNTvghUioCX2cVkf
 YgVBJ1TtIacErkPyVcXvZM2QfjsL6mUQ9qgTWqjGSJmZc+A5YOZCqT1B6xNIWNvm/jLh
 4bLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795484508; x=1796089308;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=1nyS5zQ3JA24VIPo3NXdZD11p5Dc6cnKOuQvmzCMlI0=;
 b=qu0Te6dsJDzXvQbyJP90LNJ7OcRjnFeyD8OEs6PH0kaVIaw/zruFFGNblAyc67ID5m
 Bm3z85ZfkD9tHIC9gEqtWhv3i/L9T5fjfOSMaft8NxCCMoO79kFXGvtxd3xIe1j7EUHf
 bL9NW2rgK7ICYL/Tar+mVOPJVuQBoxHWOTZmQh11x3kf9ajmLeqRVd1Ens+Gv/4dN2Sf
 67rwE3bj7dxUTx6ulgCj9uuvMGYZt/ewNAoFWAjincezPGKxDjvvs8hXbxLV8EMulXY0
 UJ8YRoeHp5fuovA3qbxtY2Z5uBddGKcg1x3sQI7N7wBQxrnUQkMmGdO5W92ZS25Bfmna
 fRmg==
X-Forwarded-Encrypted: i=1;
 AL+hErFMs4csP6KXI1xioQbi26+KwobcJF9SWzzeY3WjkDP9cFZpwJTFO7TsGEFWvFDH+Tgj38Nvs+pbZw==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z90dzMcWK7DSxxmTkrJtS41rVaA9kxcm46mXtFAAtZEy050utvs
 CPG+vaA5KW8DdXXNbZ4YD4HIj9FWtBOOr5apW1KhBEnkbx78xXbk/CRFSH5cBluqIoZCMAAxAmE
 fwGI48SLB6FlSHcKT0yF05p5Mtupabic=
X-Gm-Gg: AZFdTZdGi0e/rza+7j/N79tXw0vxVaHBe/d6UFW8BLLRK0/GCTZSGH/5L/VZCitZLQ8
 6zxHVMhhKjrA2S23IbmYiZB8+PwE52Epr9uIQhAdMto/EtlURk4tuX/OTUeu7Fj1irhKT30m5tM
 EfNmYBwzuKSyR/tAVZMEPRVZaXDp0zVX/ecxd/o77OO0VnMmqQOsKeNnuLjNaHUbEe2JGnVpPGU
 AH3HYb4pBylmoZF3Cdpt9s/RJc3WFC0n08Ip00kyC74q0MEALxg3naZQDzbQoStdUlpczH/r6wO
 3nV709NMKChrkWlSY/rkxsPEZn45g9W7Fz/kGCrEkfUPEcgbxE+bI8i7Y6+2IcmRUTmJDh8fUaR
 h5T+VYRM+02gAa1jG7T5lPYC4q/FE+NJRGs2NmEqNHe5IA9nPtpzmTFy9x3FVhkud6s7lfAz/Z7
 zd5GugCi9w0Tgw/zXT5D3RrA==
X-Received: by 2002:a05:6214:5c06:b0:921:3f1a:ee86 with SMTP id
 6a1803df08f44-9213f1af746mr203910826d6.25.1795484507945; Mon, 23 Nov 2026
 17:41:47 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261124004312.3880264-1-michal.grzelak@linux.intel.com>
 <20261124004312.3880264-2-michal.grzelak@linux.intel.com>
In-Reply-To: <20261124004312.3880264-2-michal.grzelak@linux.intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 24 Nov 2026 11:41:35 +1000
X-Gm-Features: Aa3M54oVAKSZF4YJ0povn4IQXDaHqZqgbt-9vZWggXI9FtScVyM8m1lCO2fB4dQ
Message-ID: <CAPM=9tz_nwv4Cy5N_ihBqp6JS5rghETbJYiub4aVrJh=wy2-iQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] drm/ttm/tests: do not count pages after pool's
 teardown
To: =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Ian Forbes <ian.forbes@broadcom.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 24 Nov 2026 at 11:01, Micha=C5=82 Grzelak
<michal.grzelak@linux.intel.com> wrote:
>
> Currently ttm_pool_fini_basic() checks if page count of pool-type's lru
> list is zero after tearing down its pre-populated pool.
>
> After commit 5ffdc8f83613 ("ttm/pool: Don't leak LRU list on shutdown")
> this check causes NULL dereference because page's lru list is destroyed
> during pool's teardown which leads to KUnit's crash:
>
> [20:08:24] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] ttm_pool_alloc_basic_d=
ma_addr =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [20:08:24] [PASSED] ttm_pool_alloc_order_caching_match
> [20:08:24] [PASSED] ttm_pool_alloc_caching_mismatch
> [20:08:24] [PASSED] ttm_pool_alloc_order_mismatch
> [20:08:24] [PASSED] ttm_pool_free_dma_alloc
> [20:08:24] [PASSED] ttm_pool_free_no_dma_alloc
> [20:08:25] [ERROR] Test: ttm_pool: missing expected subtest!
> [20:08:25]
> [20:08:25] Pid: 80, comm: kunit_try_catch Tainted: G        W        N  7=
.4.0-rc4-g401a3e7b64d1
> [20:08:25] RIP: 0033:list_lru_count_node+0xe/0x20
> [20:08:25] RSP: 00000000a08dbef8  EFLAGS: 00010246
> [20:08:25] RAX: 0000000000000001 RBX: 00000000a0803c70 RCX: 0000000000000=
020
> [20:08:25] RDX: 0000000000000001 RSI: 0000000000000000 RDI: 0000000060853=
030
> [20:08:25] RBP: 0000000060853000 R08: 00000000a08dbe98 R09: 0000000060124=
6ac
> [20:08:25] R10: 000000009f227d00 R11: 0000000000000000 R12: 0000000060124=
640
> [20:08:25] R13: 0000000060853030 R14: 000000006047c950 R15: 00000000604c6=
488
> [20:08:25] Kernel panic - not syncing: Segfault with no mm
> [20:08:25] [CRASHED]
> [20:08:25] [ERROR] Test: ttm_pool: missing subtest result line!
> [20:08:25] # module: ttm_pool_test
> [20:08:25] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [=
CRASHED] ttm_pool =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> [20:08:25] [ERROR] Test: main: missing expected subtest!
> [20:08:25] [CRASHED]
> [20:08:25] [ERROR] Test: main: missing expected subtest!
> [20:08:25] [CRASHED]
> [20:08:25] [ERROR] Test: main: missing expected subtest!
> [20:08:25] [CRASHED]
> [20:08:25] [ERROR] Test: main: missing expected subtest!
> [20:08:25] [CRASHED]
> [20:08:25] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [20:08:25] Testing complete. Ran 28 tests: passed: 23, crashed: 5, errors=
: 6
>
> The crash in turn prevents Xe CI from running IGT.
>
> Drop the post-teardown assertion.
>
> Fixes: 5ffdc8f83613 ("ttm/pool: Don't leak LRU list on shutdown")
> Cc: Ian Forbes <ian.forbes@broadcom.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Signed-off-by: Micha=C5=82 Grzelak <michal.grzelak@linux.intel.com>

Reviewed-by: Dave Airlie <airlied@redhat.com>

Let's land this and unblock CI and if we need to revisit do it after.

Dave.
