Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAAD8C982CF
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 12:15:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD9B10EE67;
	Thu, 17 Sep 2026 12:15:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="DqqdrmP9";
	dkim-atps=neutral
Received: from mail-ua2-f29.google.com (mail-ua2-f29.google.com
 [74.125.226.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F0D610E09F
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Sep 2026 21:44:18 +0000 (UTC)
Received: by mail-ua2-f29.google.com with SMTP id
 a1e0cc1a2514c-97e80579b7dso49671241.1
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Sep 2026 14:44:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789595057; cv=none;
 d=google.com; s=arc-20260327;
 b=IHpSUwDKLNLLsu9yTYN1auOHNRCVWISdQlPuezElqr2QbESskchQzS0OimZ86lYHpS
 G9u25kJi7bqpcbyJFVAIzgRxUOjWIIEtfW77nm+NI4oOng+io1cv+5E5dIfuq7wBsvgJ
 3pYnuyhJ3TuP30mEwFDYrJthzXebIfCOdJ3Q1gNXXRrlSn/CJVCVODc0v/Z91Zc8FG7g
 BrK+HQk/AvIcnXYlff5vZoWiyTahvSf7cyLi3/Acx/H6kjmnoouXV6wAcZLeuGy3jXuw
 Ycg7bo/cwe1cIfgcrYPzVGhe5we+/8ou1Ymvnlr1hRiDcffZqKcJVBoR0ZQGbBAYtpgj
 0WIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=+TMWi8xF1c/GpLGSJWBDMGttEHh102/5Ofx0+5TAWdU=;
 fh=c2eAtzgbR452HYwZyVRONxLWXFQI/RKI2lfhkBqVV44=;
 b=ROqfq9oJngpKSsMoTMQT6I/3aCZzHQrJCk9tirVtxj0+sl2Gv7Vmz6JWOlepp4N7Dy
 QSOLcvluc+xd6JtlEElGLejV7lQxEj0bezUfWjCg80hr87LMlJB4EAtCBIask1TvZy2Q
 6pNbf1lXG5GYY+2h3h3D9jWXLVeGMRAc4LfB7dC1QBtrD+th7RZ7/zMIWgGt03pNSYSd
 p/Sq48MJmLXPVo6OXd+w6OOio8vdx3mhh8L3+jIEAa6zNZ0fs9xDOWyV1MU79PkHuoZw
 b4IoHae175qkiEy/n870w5t4eGs1lJQXuHGtVwXARe9AnsqkuKPAv5UX/2TInJKQS0hY
 aoxw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1789595057; x=1790199857;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=+TMWi8xF1c/GpLGSJWBDMGttEHh102/5Ofx0+5TAWdU=;
 b=DqqdrmP9gAmiAVvj2NjHTFHVeBcv8CgrTKqE41p4bZ+yUh1SYNTSduUS4eFKYqYlo7
 BDZccIOIgMw4lNV9VE9nfY2zcdz4+Dddn5e/oSmEgm9BrIIDZ0F1gvpDlfayToI69mAg
 ACb42Ce49NiWW0GlXxgObfd4k6QPriivgrxUH6EFU7Hmt6uneTa3eTHMlv6SzLecOUDX
 rhBXSD2EW+g1lN0rkbaUQi0ywxlcYfKSAUlHZ+h3LCxFM4ExdcVqhHo5EeRDnIGfIWnI
 UNeXi6XeW0gcQZyyc9YRsZWK001ZIRsRRGmI7t4J0wGoH/uUUjs9Bu/iCyQKf2JWeNZD
 s9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789595057; x=1790199857;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=+TMWi8xF1c/GpLGSJWBDMGttEHh102/5Ofx0+5TAWdU=;
 b=FvgkP3kbxzB5S6fE3T+B/90QOYOURRdrfldcGo9Q7iSuoPJXwUx7QdG+C3RSFnCR4N
 ++2BA4dCN6TApXvtKpOfIORX+QSmSW9a/AfvbTbM6RUeWnGKTlo2TGkML0ODj28LIFxc
 MoY5Q+ba5rT6j+Lv7AMreZByRDufeM+LV7Yf4az/sD6B/pEwLxMSGPVLawctHKWPMUzW
 jjaS81jmmTpT1uL6eEwji+KuQjXVey/V/VsYN3Lm1Ny4FqBfAlhm4ebFi/DnKiNGI1jB
 zHW74NWHwsDHQTaZqJdkckhP3AJOPtSS5rxZ9byueVGYnZvnSRR/h7KVDPo1/N8iAyQx
 iweQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxjsuOkAAN/h+LLnL7njTynBFvedxmnFpODEXvtmeLuiwK0jDROROw0SUDxvGxLP/Tfc7HqBsSA+Q==@lists.freedesktop.org
X-Gm-Message-State: AFuF++nLXTeRh5ROTDSmRJbLOVRed0BHj9IoQTgBJR861us4J+JA/4jx
 MgsgS7KlysrR962D8MKoINF5Hu+8gDBGkB8r6EJzYBF+9NR8t0SZX0O60Z0w1x79n+N4xDi7JvG
 RqRqHisy4iiAXPnS615pJnqT9+ZsJ+zwtjj4KZK0=
X-Gm-Gg: AYBFou2sHoyYK3V0V1iUMlimcSTjaPehNtYaaExNmvFnJr2CyUVrL4+f6/zHkIJU3EI
 NOlELnOx/EqsfAl6etK9btwO1XkoGW9Af8UNymmAAOtQRDkEvHr/ixiT/D+Jjstgoo+dWkuKxYN
 +J2tgIskyEi9xDbx4nByWEsDsksBrbTUyi40YyRXd2PqFjo4SapkH0vkOO6POk1KpZ5I8ZTsnq8
 Dat3G21eJ3UWVzNm+gu6ichwVrdi8sM3T2FlsOKAI9R7y73haEwHK85YYicn+W2SPfrRAVHzK2n
 lTWHpL+oPc/ofBAMQHSRn06hNInKPBx5v3jwrQWJ27HCjvTO0UM6J77oCkwRgDK5EPwyxe0g8Aj
 3T7P9/jlderLXhuYMtTt+
X-Received: by 2002:a05:6102:a85:b0:7a2:2a6b:e7b4 with SMTP id
 ada2fe7eead31-7a22a6be8efmr62586137.2.1789595055938; Wed, 16 Sep 2026
 14:44:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260915081910.4142719-1-morbo@google.com>
 <20260915081910.4142719-26-morbo@google.com>
 <202609151258.5FC01072@keescook>
 <20260916010945.GEaqnsWSZ-DTMyTO25@fat_crate.local>
In-Reply-To: <20260916010945.GEaqnsWSZ-DTMyTO25@fat_crate.local>
From: Bill Wendling <morbo@google.com>
Date: Wed, 16 Sep 2026 14:43:59 -0700
X-Gm-Features: AcwNN1XbboPOY3deKY79Gty15vkSErYIT9HTgeQdVXaDzFhBvm8_kiOA449bIqU
Message-ID: <CAGG=3QVZRCJ94+DOfSsSDhsrXVYf-ec01NZBy299nYiCAYfXKg@mail.gmail.com>
Subject: Re: [PATCH 25/28] EDAC/thunderx: Replace strlcat() with seq_buf
To: Borislav Petkov <bp@alien8.de>
Cc: Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
 codemender-patching+linux@google.com, Russell King <linux@armlinux.org.uk>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
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
X-Mailman-Approved-At: Thu, 17 Sep 2026 12:15:25 +0000
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

On Tue, Sep 15, 2026 at 6:11=E2=80=AFPM Borislav Petkov <bp@alien8.de> wrot=
e:
>
> On Tue, Sep 15, 2026 at 01:00:00PM -0700, Kees Cook wrote:
> > Seems like seq_buf would be better her? But yes, at the very least, thi=
s
> > needs to be scnprintf, not snprintf (or add the checks as you have
> > here).
> >
> > The rest of the seq_buf conversions look right.
>
> This driver has been an orphan for a while now (we just made it official)=
 so
> I'd prefer it if we don't do anything here.
>
I'll remove those changes from future emails.

> And yes, that mega CC list is just gross.
>
Apologies. :-(

-bw
