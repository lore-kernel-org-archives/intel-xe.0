Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16106C982C4
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 12:48:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 810C310EAA4;
	Wed, 16 Sep 2026 12:48:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="mli8rRlV";
	dkim-atps=neutral
Received: from mail-ua2-f25.google.com (mail-ua2-f25.google.com
 [74.125.226.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8722A10E1C1
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Sep 2026 08:28:31 +0000 (UTC)
Received: by mail-ua2-f25.google.com with SMTP id
 a1e0cc1a2514c-982e8fa91d3so124378241.1
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Sep 2026 01:28:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789547310; cv=none;
 d=google.com; s=arc-20260327;
 b=FrwaD6+nW9QdrZglzfE2csQ6+0+Xcilz762V6xmLcmi5e9VtcttSCwmFS/T582FRIf
 xCXU7q8skq1dEMO50XSZbRDjQyMyfrYvSGakfz5OGpootB8aE5nNDKRcq+8qwtWpwkyG
 vWqQkUP6zzXub1cbIeJh6L1oABsVLqt8PK51yWFJFYHMYz3Bo7oZoFS3fhOQPTsx6tHq
 CDZ2v1CnR+Tqyq8nLzSfRJF9tPVZshr0THU83Vp2OiW/GybWH5CZeK2cteCSRKGK6oxu
 m0LczUFbH4NKaKgC8BxeQbohf+QfseJCknumuBO2MHI9LDTKHNK0bWZ4dUIlZwCg5hGc
 JqJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=MArIcxEq1DF3tM6gYQ8CgYvDf8FqlVp7SuT0GyZ8Xuo=;
 fh=SodzQjNrMGIAhypG41yQ9GHokabI3YuXK0v4jFugVsQ=;
 b=gjWNLxzCS2X2U+wSj47gOfm/M+cm/GOuWqff8nnZ8aJgElyDHTonyrOnYyDRpt24v2
 sXVENVr8QZfhr9LQ4qnLNXq0Tn0kHJCUGs/nlsQU04VC5Hj8YdPcNnJ43d8wBn21LEX2
 ymccSeiBP+z6CRYN422CuVNC72Zc0frsvXOJdZQkFku/I+GDv9+E9zje2dIGgXxRC0/b
 qj9mM84MQfbAvorcyj4Xt2p3V69nS+OAgcCZ17Y3D8qByAgYhMeqyK+vdkRexCTV9ga0
 BOrYQexnMyiLD6layCkRjoGCqwkt9GijXYG9xoDoG9vJPKEoMtn2mfGWRQiD4tP7qK42
 5f6Q==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1789547310; x=1790152110;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=MArIcxEq1DF3tM6gYQ8CgYvDf8FqlVp7SuT0GyZ8Xuo=;
 b=mli8rRlVjnWTElFDDUUEfdVDUxVkWbnV42XsRnm7EQgsWUArNCL+OwZj4DAgP3bBzu
 nzxNmLgbvDHoUckzfXi/SZIbmIoFjoEOjMvJkb5FxTN22U4yqNsNJ1VEMKcatwdr1V3m
 gCD2fxcPCAMBZL153nGhrBbGHd9IwNevlISXZ7OUYpXkzBmcKv0CF5cKxUETFAGE0OBO
 ubMO2DzZaZEHTu3qtAWbo6ByUfZBNKu9M7x7DgWoJdhUz87Fe5LR1p7GfJs2Eug2JrAj
 Ew67ORd58wgoOAZ0+J9LMoJjeiOR9xnMkODgqTR2Vr/CdFZHroHkLBEyxyWjYNqPP2fX
 nsUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789547310; x=1790152110;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=MArIcxEq1DF3tM6gYQ8CgYvDf8FqlVp7SuT0GyZ8Xuo=;
 b=c+k9ATyQ/WY1KoiBx/188sDLwaNckch4n8T5MegU1bPbDsr4ux5B6ndGmQBBNuFU9o
 BW+mx+6OHnqtDWG1FlHbo9RxfE8n1QOiirB7qWFMA7VktRyLuz/V5dSLjxlgsplSnAgr
 IktNDBDdw0cfaqFIIYD0q4LIjGhDUkGNP/qhojJqpNi2QTng3LcoIhyTAFHgQl3Nl6SZ
 cvn+vXBsidA6V4lRHaPSZMjqWc7hXljZ2F8EYGO7B/JfoOa/0OG3d6PoSQ3FXS3CMkJ0
 8qgypgbkglajqyljr64/v2k7WdKxdHFrOIeXq3f2vlonuD/zV+h+0QwNyEitdFlzHALU
 vXNg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxAMeydjUCfEn/4vUZbwFJWu8ywXJsrNyRvTRChSK2/yI/itOcgrwyZFSlPg33xUmbIZq1K/k95zA==@lists.freedesktop.org
X-Gm-Message-State: AFuF++ks9Ig3ZlsSDw1X+zGNpBd3m29AsnGDwUg6P3JCWngoCxVpPMWu
 00tXSp6RhaGqQx6a6k46SdrCVcU8Tn3W9QE8nMhQ2acFxaDGRKKeH9XIwniM76Kgf95UZFuRlRg
 wwPRgYndMs1OyDu0YaAKcoSPaGYjWlSXI1QHX/II=
X-Gm-Gg: AYBFou2Pb3rZHQYgamZ5rPZmXtc0ycVAPbWvPbwsuksxDDaNeEjJbm3srY7ufExiFqF
 bgPQhorN9JJZlCj3oRwr+8hnZL2pCRGVS+Ac8sC+FW9HSrFohIRc6NNVOoqXT1g0AKxKkjLwTVx
 FRAqjK3j+L3ZahXF9X8jzCN6+actnLIHg4z9FLX+SG8jz2XDDVw5y+V+GwT/UrXbLoSViq95swa
 xE0fB60LG7kF2CfoKN+MFkzTaE6gBI+v/aoqlbgrfk/KyDEAtTmsJkP54Gy6BoULnthgK47vAKz
 45LfkT4Kn6t8XdbRABUcLzqfReudW81T00QW/OWaiqNE9nHEZgtI6gt33iURmnYXUQJszp7uT/f
 SinjaSl+/CXCcybbOXueq
X-Received: by 2002:a05:6102:3712:b0:786:a11e:484d with SMTP id
 ada2fe7eead31-7a0522a8290mr540435137.6.1789547309631; Wed, 16 Sep 2026
 01:28:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260915081910.4142719-1-morbo@google.com>
 <20260915081910.4142719-4-morbo@google.com>
 <202609151155.CC22827@keescook>
In-Reply-To: <202609151155.CC22827@keescook>
From: Bill Wendling <morbo@google.com>
Date: Wed, 16 Sep 2026 01:28:13 -0700
X-Gm-Features: AcwNN1W06HBvxyPAyDNMWJbd-pZRzg8rOuNuZoGljznF0BEtCKl9YZ-3dIsOV-o
Message-ID: <CAGG=3QU2LxKLdqTOHse4U9AZ3sGAUe-C_wbDnBq4W1ncdsPVwg@mail.gmail.com>
Subject: Re: [PATCH 03/28] ARM: atags: Replace strlcat() with snprintf() for
 cmdline extend
To: Kees Cook <kees@kernel.org>
Cc: linux-kernel@vger.kernel.org, codemender-patching+linux@google.com, 
 Russell King <linux@armlinux.org.uk>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Ian Abbott <abbotti@mev.co.uk>, 
 H Hartley Sweeten <hsweeten@visionengravers.com>,
 Tony Luck <tony.luck@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Matthias Schwarzott <zzam@gentoo.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, 
 Arend van Spriel <arend.vanspriel@broadcom.com>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linusw@kernel.org>, 
 Anil Gurumurthy <anil.gurumurthy@qlogic.com>, 
 Sudarsana Kalluru <sudarsana.kalluru@qlogic.com>,
 "Martin K. Petersen" <mkp@kernel.org>, 
 Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, 
 Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>,
 Jiri Pirko <jiri@resnulli.us>, 
 Simon Horman <horms@kernel.org>, Chuck Lever <cel@kernel.org>,
 Jeff Layton <jlayton@kernel.org>, 
 NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>,
 Dai Ngo <Dai.Ngo@oracle.com>, 
 Tom Talpey <tom@talpey.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
 Kanglong Wang <wangkanglong@loongson.cn>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Qiang Ma <maqianga@uniontech.com>, Randy Dunlap <rdunlap@infradead.org>, 
 Pengpeng Hou <pengpeng@iscas.ac.cn>, Ard Biesheuvel <ardb@kernel.org>,
 Breno Leitao <leitao@debian.org>, Thorsten Blum <blum@kernel.org>,
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lyude Paul <lyude@redhat.com>,
 Ashutosh Desai <ashutoshdesai993@gmail.com>, Imre Deak <imre.deak@intel.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Johan Hovold <johan@kernel.org>, Johannes Berg <johannes.berg@intel.com>, 
 Miri Korenblit <miriam.rachel.korenblit@intel.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Cryolitia PukNgae <cryolitia@uniontech.com>,
 Jiaming Zhang <r772577952@gmail.com>, 
 Will Porter <mrwillporter@gmail.com>, Cen Zhang <zzzccc427@gmail.com>, 
 =?UTF-8?Q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>, 
 Rong Zhang <i@rong.moe>, Arun Raghavan <arunr@valvesoftware.com>, 
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 linux-edac@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-input@vger.kernel.org, 
 linux-media@vger.kernel.org, intel-wired-lan@lists.osuosl.org, 
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, 
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-nfs@vger.kernel.org, devel@lists.orangefs.org, 
 linux-hardening@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 16 Sep 2026 12:48:30 +0000
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

On Tue, Sep 15, 2026 at 12:00=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
> On Tue, Sep 15, 2026 at 08:18:20AM +0000, Bill Wendling wrote:
> > --- a/arch/arm/kernel/atags_parse.c
> > +++ b/arch/arm/kernel/atags_parse.c
> > @@ -121,9 +121,10 @@ __tagtable(ATAG_REVISION, parse_tag_revision);
> >  static int __init parse_tag_cmdline(const struct tag *tag)
> >  {
> >  #if defined(CONFIG_CMDLINE_EXTEND)
> > -     strlcat(default_command_line, " ", COMMAND_LINE_SIZE);
> > -     strlcat(default_command_line, tag->u.cmdline.cmdline,
> > -             COMMAND_LINE_SIZE);
> > +     size_t len =3D strlen(default_command_line);
> > +
> > +     snprintf(default_command_line + len, COMMAND_LINE_SIZE - len,
> > +              " %s", tag->u.cmdline.cmdline);
> >  #elif defined(CONFIG_CMDLINE_FORCE)
> >       pr_warn("Ignoring tag cmdline (using the default kernel command l=
ine)\n");
> >  #else
>
> It's pretty clear we have a pattern of "simple append" that is needed,
> and while strlcat() does that, it's horrible. I feel like we need an
> appending scnprintf(), and it needs to return like strscpy() does (i.e.
> -E2BIG on truncation).
>
> My goal would be:
>
> - don't open-code string length math
> - never leave the destination unterminated
> - allow for format strings
> - yes/no return indication for "did this truncate?"
>
> Initializing a whole seq_buf struct for these small cases is too much
> overhead...
>
> For both cases (small without seq_buf, large with seq_buf), it is also
> frequently needed to know the resulting strlen. seq_buf doesn't do this
> right today, and a strscpy-style return value also doesn't tell us. :(
>
Something like "llvm::Twine" would work well for this.

-bw
