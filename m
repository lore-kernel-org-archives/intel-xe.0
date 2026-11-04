Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D0F606A331
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 15:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ue0Iyl6s
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7C7010FCA7;
	Wed,  4 Nov 2026 15:02:54 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA7210F2E2
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Nov 2026 09:00:22 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-8b315dd057bso1272497b3.1
 for <intel-xe@lists.freedesktop.org>; Wed, 04 Nov 2026 01:00:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793782821; cv=none;
 d=google.com; s=arc-20260327;
 b=GwgFknRcNLz/TSSuy/bRH2wmpH6AN0fwRBIdtiEDS1D8qxJ+BzOJZdcdz9+qqtEj1N
 1J1PM30s6nqyzMWVQTlc5GX+5VmoNvSmchUcqOBxi4bB4cbLFA1VXLR7UG0EoSHfaWvo
 Vzw2Y9BoufQm533IttEIJLi8D5qB0c2IrUwflzirdHPWLVTXoAWC6FUaqZ2TNa4C8s8d
 taYL/bZraORf/N/nAnr6/XH6SfO8QxzpJbcL1eSsPJnZrTuztL1MgTmoikWtk4RXsOlD
 nNx7Ry9uG628LjD2dKNTeGEdN6yNgS4QsBoQRk+x9aZi3wXVdPJuFOkE/e30s+nYXt3P
 E/9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=jTRnpEDN+KWb3ei+FUpJVOT/UTcJwtCB9oaH08vzv9M=;
 fh=rAGZer9TmBM3mQGeNNxZ+TMgZqXWYixcWdWJ69eCBXU=;
 b=H76BLoqFzmRux/80iv2rlxznGrjr9QU0h3x98ylSUgI2IAVOL+77uw4UJg7BWeLWUl
 mbeBG2Q66qI9xIKR1Wqw4XHRQAl8HiVvVzTK9Oryu3mQZTgZdGkI28eQQqIpoXzPD55H
 zcB7jByO67dXXNUn31+xTzJmtQ7PTnnpGXhRCUYBv+yMWaLPlpQ+LujxVRrTLrS0G2Zw
 DC4abuB58Jcebr53dE7m20FrMIsDC21qLME/TFJidiAyIb/JDXJZWXMRSzaSzkt/K5h0
 VMhOyxfMTwAZBVMm+TMAUrQIQvqzmZWWeKSdTouC4f2aVI3XPYWMkEeCMZwzfpLwz/jh
 KyBw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793782821; x=1794387621; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=jTRnpEDN+KWb3ei+FUpJVOT/UTcJwtCB9oaH08vzv9M=;
 b=ue0Iyl6sYIrYBoyQZx1C/1fR9H7cbpDdBFXCheHPpwGSk8Bjd8Z6Vd/gFS6bIIqJSx
 dJauAqQAMpGfdLPRlz799X7Pr7v4XvZliEcjgLuRLAv+qQ61j0Ddx1Dg64xe0n8NW1bw
 Xm71+T1UEUPT0dkMNXJzNd3vtvOgPT/p2bdawIbGSPQUxg9ToN802XRLXv7au2RKI/UH
 SzZHnUaFobQ+Ouy/uyW4UMPicVzW/9Kk69H4dlhYFA7zpF9bCvpCpJXpGAyuoGQTCu47
 mK+6tCpbSOh+V9a+4wkjCeQ1lcZhIamCKWkf3awTUxuSLbyWsCGmgAGKxNYVk7+ueVcQ
 dT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793782821; x=1794387621;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=jTRnpEDN+KWb3ei+FUpJVOT/UTcJwtCB9oaH08vzv9M=;
 b=gYk7JONXaVpN9C5X+bRKPjYZ9oPFIU+YF6JrNnh1c/3bYeEXUtp7+SeQFXsIKgUlIZ
 /qZo4yM/YS2/tsfiGmsLbHCxTvn423ID9cXUkthsZY71DoisGtMF1fpwXkJfKKWO8g6M
 z6yV++/E15sz319scg9mxPE2reeZvOP+oJGPIaJsxh0ln4CaFxJumYI4APP6HlPHQsr/
 IlpKYOQDsD4YLvUBaoXSQN1spf4kLZbZgEBfbtPPHtKKOv94DD7C0QXkkuQB4L8JT4jC
 cjCuVvKD32HIAJZ0w5XfAjMQ7w6+v8R5xzpCEbb2JzNti36oXZsVppLfTs3YjsPNQkNf
 WkhA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzv5wxg2i8PowAJLwoimo6MJvgq/UWuwy/uZTa+Ythq8KB0bw3z9ana/lg5Mlj/b92GSM2K+2B4zg==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z+YCx7V4MQH1T5jMl6AsP+OkC1b3ztMMCuEvYjuIGUxvs0OohI1
 LcEnNBm6k+ghpPQsVtXQDyM4P+ClIrvhWNAsUi5ec+tgK3rqkVqeUOFg6P8aN5eLHhqqH1Sk8Uo
 JLRXJkNHm3Dxssma6eeUeCZLOJXcZJhk=
X-Gm-Gg: AYBFou1lAzksao/SEcB2jU2xIgOpjQNNdWXSz8J1Nr2bf24gJYxZOOchpt/5EkkViM+
 spOUphnplYqaTEIwwnZ8RWjXKkcSOZscrUe360lloLbzs2FuHmPFjWV9kNl6Xa8yQuD/FG+RCAB
 pTgVkwYpxJd8rO7nMEGykb2xpxTaEwgUTyaaoU3AF/V7tn7A8fhVHH7NVqv6x42SEfnc/Kntn5c
 PDBIoIZUioQqrrhMIiuaPHZBjMp9rLOvDnghx4P41064WWV3ITU0GYciWwHT1q2nz6jeu3PVLH+
 nn1RfgudzHx8rPI6vZQHlWjUI6py74o5HRMVnr65MR3XwAvPJU6vlAQV/peBqSntuFVHn3ktid7
 Ov3tIK5eZAP/rpnINNx+XZ+eZxLZ6R8T+qpAJp+k44sr6dnKawozAqRvXRKQhQk7bCBLS
X-Received: by 2002:a05:690c:f05:b0:8a1:781f:4aa0 with SMTP id
 00721157ae682-8b2b67f1889mr109610237b3.56.1793782820885; Wed, 04 Nov 2026
 01:00:20 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261031-dp-tunnel-bwa-flag-v1-1-f94ed3179349@gmail.com>
 <20261102130145.GU158991@black.igk.intel.com>
In-Reply-To: <20261102130145.GU158991@black.igk.intel.com>
From: Diego C N <diego.sure@gmail.com>
Date: Wed, 4 Nov 2026 10:00:08 +0100
X-Gm-Features: AclHuK-KTLDrGi9C8ZMZKwzhArkycX_ZxWgS8iSAY08wiND5eYgccYF5_KZeB0A
Message-ID: <CACPnnOZHhdwOSDhsnG22SyPD1JsrcgM4Y26QYORd=xoUzhXuVw@mail.gmail.com>
Subject: Re: [PATCH RFC] drm/dp_tunnel: Allow BWA when the DP IN adapter does
 not advertise it
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Imre Deak <imre.deak@intel.com>, dri-devel@lists.freedesktop.org, 
 Uma Shankar <uma.shankar@intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Mika Westerberg <westeri@kernel.org>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 04 Nov 2026 15:02:42 +0000
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
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Mika,

Oh, I see. Well, thanks anyway for taking time to check this patch and
for answering it.
I'll keep it as my personal patch since it's been working very well
for the past weeks.

On Mon, Nov 2, 2026 at 2:02=E2=80=AFPM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Hi,
>
> On Sat, Oct 31, 2026 at 01:18:18AM +0100, Diego Nogu=C3=AAs via B4 Relay =
wrote:
> > From: Diego Nogu=C3=AAs <diego.sure@gmail.com>
> >
> > On an Alder Lake host (i7-1265U) with a Thunderbolt 4 dock (Dell WD22TB=
4,
> > Goshen Ridge) driving two 4K@60 monitors through two DP tunnels, the
> > monitor whose tunnel is created second is limited to 4K@30. Which monit=
or
> > is affected depends only on the order in which they are powered on.
> >
> > The thunderbolt driver enables the BW allocation mode (BWA) on both DP =
IN
> > adapters: it sets the CM BWA support (DP_USB4_DRIVER_BW_CAPABILITY), a
> > group ID and the estimated BW. The DP IN adapter, however, never sets
> > DP_IN_BW_ALLOCATION_MODE_SUPPORT in DP_TUNNELING_CAPABILITIES (0xe000d
> > reads 0x01), so tunnel_regs_are_valid() rejects the tunnel with:
>
> Alder Lake firmware really does not support this and by forcing it to be
> enabled you may end up in untested code paths and interesting behavior :)
> BWA was only officially supported starting from Meteor Lake.



--=20
Diego C. N.
