Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E2FEC83F09
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 04:03:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E64F910E1EF;
	Wed,  9 Jul 2025 04:03:10 +0000 (UTC)
Received: from psionic.psi5.com (unknown [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A87310E1EF
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 04:03:10 +0000 (UTC)
Received: from dummy.faircode.eu (om126194119059.10.openmobile.ne.jp
 [126.194.119.59])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id EDC053F1DF;
 Wed,  9 Jul 2025 06:02:57 +0200 (CEST)
Date: Wed, 9 Jul 2025 13:02:48 +0900 (GMT+09:00)
From: Simon.Richter@hogyros.de
To: jeffbai@aosc.io
Cc: intel-xe@lists.freedesktop.org
Message-ID: <ffe4cf3f-7f4c-4d24-85cb-b1d80266797f@hogyros.de>
In-Reply-To: <20250613-upstream-xe-non-4k-v2-v2-0-934f82249f8a@aosc.io>
References: <20250613-upstream-xe-non-4k-v2-v2-0-934f82249f8a@aosc.io>
Subject: Re: [PATCH v2 0/5] drm/xe: enable driver usage on non-4KiB kernels
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_5_146550880.1752033768406"
X-Correlation-ID: <ffe4cf3f-7f4c-4d24-85cb-b1d80266797f@hogyros.de>
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

------=_Part_5_146550880.1752033768406
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

this needs to be rebased after the abolition of bo->size =E2=80=94 that is =
either trivial or needs an adjustment in how the size in the parent BO is s=
et.

=C2=A0=C2=A0 Simon

------=_Part_5_146550880.1752033768406
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
 <head>
  <meta name=3D"viewport" content=3D"width=3Ddevice-width, initial-scale=3D=
1.0">
 </head>
 <body>
  <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">Hi,</span>
  <br>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">this needs=
 to be rebased after the abolition of bo-&gt;size =E2=80=94 that is either =
trivial or needs an adjustment in how the size in the parent BO is set.</sp=
an>
  <br>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&nbsp;&nbs=
p; Simon</span>
  <br>
 </body>
</html>
------=_Part_5_146550880.1752033768406--
