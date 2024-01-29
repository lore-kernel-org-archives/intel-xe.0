Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B92FC47422
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jan 2024 11:07:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF54A1128A4;
	Mon, 29 Jan 2024 11:07:41 +0000 (UTC)
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [195.130.132.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB94F1128A0
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jan 2024 11:07:39 +0000 (UTC)
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by cantor.telenet-ops.be (Postfix) with ESMTPS id 4TNlrN01d1z4x3Py
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jan 2024 12:07:32 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:3b5f:c6ad:b5fc:a0f3])
 by laurent.telenet-ops.be with bizsmtp
 id gb6X2B0022ZPkuY01b6XDK; Mon, 29 Jan 2024 12:06:31 +0100
Received: from geert (helo=localhost)
 by ramsan.of.borg with local-esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1rUPTC-00GgzQ-W5;
 Mon, 29 Jan 2024 12:06:31 +0100
Date: Mon, 29 Jan 2024 12:06:30 +0100 (CET)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: linux-kernel@vger.kernel.org
Subject: Re: Build regressions/improvements in v6.8-rc2
In-Reply-To: <20240129104954.1778339-1-geert@linux-m68k.org>
Message-ID: <8ea40b3-adde-acb5-5e46-fe1fd395daf@linux-m68k.org>
References: <CAHk-=wgxzm+Oc1ywuNGxb1R1=ZEC85LJi776R2QEpk6=_2Qfdw@mail.gmail.com>
 <20240129104954.1778339-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
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
Cc: sparclinux@vger.kernel.org, linux-hwmon@vger.kernel.org,
 intel-xe@lists.freedesktop.org, linux-parisc@vger.kernel.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, 29 Jan 2024, Geert Uytterhoeven wrote:
> JFYI, when comparing v6.8-rc2[1] to v6.8-rc1[3], the summaries are:
>  - build errors: +26/-14


   + /kisskb/src/arch/sparc/kernel/setup_64.c: error: no previous prototype for 'alloc_irqstack_bootmem' [-Werror=missing-prototypes]:  => 602:13

sparc64-gcc{5,1[123]}/sparc64-{allno,def}config

   + /kisskb/src/drivers/gpu/drm/nouveau/nvif/object.c: error: 'memcpy' specified bound between 4294967240 and 4294967263 exceeds maximum object size 2147483647 [-Werror=stringop-overflow=]:  => 298:17
   + /kisskb/src/drivers/gpu/drm/nouveau/nvif/object.c: error: 'memcpy' specified bound between 4294967264 and 4294967287 exceeds maximum object size 2147483647 [-Werror=stringop-overflow=]:  => 161:9

parisc-gcc1[23]/generic-32bit_defconfig
parisc-gcc1[23]/parisc-{allmod,def}config

   + /kisskb/src/drivers/hwmon/pc87360.c: error: writing 1 byte into a region of size 0 [-Werror=stringop-overflow=]:  => 383:51

arm64-gcc12/arm64-allmodconfig
parisc-gcc12/parisc-allmodconfig

   + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_1045' declared with attribute error: FIELD_GET: mask is not constant:  => 435:38
   + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_1065' declared with attribute error: FIELD_PREP: mask is not constant:  => 435:38
   + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_1084' declared with attribute error: FIELD_GET: mask is not constant:  => 435:38
   + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_1095' declared with attribute error: FIELD_GET: mask is not constant:  => 435:38
   + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_1137' declared with attribute error: FIELD_GET: mask is not constant:  => 435:38
   + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_1139' declared with attribute error: FIELD_GET: mask is not constant:  => 435:38
   + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_1148' declared with attribute error: FIELD_GET: mask is not constant:  => 435:38
   + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_1150' declared with attribute error: FIELD_GET: mask is not constant:  => 435:38
   + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_924' declared with attribute error: FIELD_GET: mask is not constant:  => 435:38
   + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_935' declared with attribute error: FIELD_GET: mask is not constant:  => 435:38

in drivers/gpu/drm/xe/xe_guc_ct.c:526
arm64-gcc5/arm64-allmodconfig
powerpc-gcc5/powerpc-all{mod,yes}config
powerpc-gcc5/ppc{32,64le,64_book3e}_allmodconfig
(seen before in v6.8-rc1, with different assertion numbers)

   + /kisskb/src/include/linux/fortify-string.h: error: writing 16 bytes into a region of size 0 [-Werror=stringop-overflow=]:  => 57:33

in drivers/gpu/drm/xe/xe_gt_pagefault.c:340
arm64-gcc13/arm64-allmodconfig
s390x-gcc13/s390-all{mod,yes}config

   + {standard input}: Error: displacement to undefined symbol .L101 overflows 8-bit field :  => 593
   + {standard input}: Error: displacement to undefined symbol .L104 overflows 8-bit field :  => 588
   + {standard input}: Error: displacement to undefined symbol .L139 overflows 8-bit field :  => 606
   + {standard input}: Error: displacement to undefined symbol .L73 overflows 12-bit field:  => 594
   + {standard input}: Error: displacement to undefined symbol .L74 overflows 8-bit field :  => 585
   + {standard input}: Error: displacement to undefined symbol .L75 overflows 12-bit field: 606, 586 => 589, 606, 586
   + {standard input}: Error: displacement to undefined symbol .L76 overflows 8-bit field : 577 => 580, 577
   + {standard input}: Error: displacement to undefined symbol .L80 overflows 8-bit field : 601 => 601, 607
   + {standard input}: Error: displacement to undefined symbol .L81 overflows 8-bit field : 606, 604 => 604, 610, 606
   + {standard input}: Error: displacement to undefined symbol .L96 overflows 12-bit field:  => 602
   + {standard input}: Error: displacement to undefined symbol .L99 overflows 12-bit field:  => 607

The usual SH ICE crickets.

> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/41bccc98fb7931d63d03f326a746ac4d429c1dd3/ (all 239 configs)
> [3] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/6613476e225e090cc9aad49be7fa504e290dd33d/ (all 239 configs)

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
