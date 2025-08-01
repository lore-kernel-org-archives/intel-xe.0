Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CFA2C87FD3
	for <intel-xe@archiver.kernel.org>; Fri,  1 Aug 2025 01:41:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C4D10E28A;
	Fri,  1 Aug 2025 01:41:12 +0000 (UTC)
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E69110E28A
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Aug 2025 01:41:10 +0000 (UTC)
Received: from dummy.faircode.eu (om126033123071.35.openmobile.ne.jp
 [126.33.123.71])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id 6F10D3F116;
 Fri,  1 Aug 2025 03:41:05 +0200 (CEST)
Date: Fri, 1 Aug 2025 10:40:54 +0900 (GMT+09:00)
From: Simon.Richter@hogyros.de
To: Mingcong Bai <jeffbai@aosc.io>
Cc: intel-xe@lists.freedesktop.org, Wenbin Fang <fangwenbin@vip.qq.com>,
 Haien Liang <27873200@qq.com>, Jianfeng Liu <liujianfeng1994@gmail.com>,
 Shirong Liu <lsr1024@qq.com>, Haofeng Wu <s2600cw2@126.com>,
 Shang Yatsen <429839446@qq.com>
Message-ID: <c1a44c6d-d947-44e0-8c24-90941c0507c0@hogyros.de>
In-Reply-To: <dcc218a7-bd02-4c21-9986-2c4c29fbc8db@aosc.io>
References: <20250723074540.2660-1-Simon.Richter@hogyros.de>
 <20250723074540.2660-2-Simon.Richter@hogyros.de>
 <0b4df78a-5740-415e-9939-b9c00ead84e7@aosc.io>
 <9cc7c5f9-2b1c-4b45-ad44-67923ed61757@hogyros.de>
 <dcc218a7-bd02-4c21-9986-2c4c29fbc8db@aosc.io>
Subject: Re: [PATCH v3 1/5] drm/xe/bo: fix alignment with non-4KiB kernel
 page sizes
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_7_77607888.1754012454532"
X-Correlation-ID: <c1a44c6d-d947-44e0-8c24-90941c0507c0@hogyros.de>
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

------=_Part_7_77607888.1754012454532
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

good point, thanks!

Rodrigo's idea of modifying "size" in-place would accidentally solve this a=
s well. I'm planning to do a revision where I pull the huge if statement th=
at determines the alignment apart.

I believe we can leave the query parameters as is, because the alignment fo=
r VRAM allocations that should not be host visible is still 4kB, and Mesa w=
ill round up all allocations otherwise. Longer term, there should probably =
be separate values (plus there is also some things that need to be 8kB alig=
ned?)

Unrelated to page size: can you check booting with the MEI GSC patches on o=
ther platforms? For me, it fails to allocate the IRQ, apparently because it=
 cannot find a routing.

=C2=A0=C2=A0 Simon

------=_Part_7_77607888.1754012454532
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
 <head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
 </head>
 <body>
  <span dir="ltr" style="margin-top:0; margin-bottom:0;">Hi,</span>
  <br>
  <br><span dir="ltr" style="margin-top:0; margin-bottom:0;">good point, thanks!</span>
  <br>
  <br><span dir="ltr" style="margin-top:0; margin-bottom:0;">Rodrigo's idea of modifying "size" in-place would accidentally solve this as well. I'm planning to do a revision where I pull the huge if statement that determines the alignment apart.</span>
  <br>
  <br><span dir="ltr" style="margin-top:0; margin-bottom:0;">I believe we can leave the query parameters as is, because the alignment for VRAM allocations that should not be host visible is still 4kB, and Mesa will round up all allocations otherwise. Longer term, there should probably be separate values (plus there is also some things that need to be 8kB aligned?)</span>
  <br>
  <br><span dir="ltr" style="margin-top:0; margin-bottom:0;">Unrelated to page size: can you check booting with the MEI GSC patches on other platforms? For me, it fails to allocate the IRQ, apparently because it cannot find a routing.</span>
  <br>
  <br><span dir="ltr" style="margin-top:0; margin-bottom:0;">&nbsp;&nbsp; Simon</span>
  <br>
 </body>
</html>
------=_Part_7_77607888.1754012454532--
