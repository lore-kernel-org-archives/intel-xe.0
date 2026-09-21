Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B30C982ED
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 11:41:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1C310E479;
	Mon, 21 Sep 2026 11:41:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kjgXHNkO";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A00B10E479
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 11:41:11 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 3B29C600C8;
 Mon, 21 Sep 2026 11:41:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD4301F000FF;
 Mon, 21 Sep 2026 11:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789990869;
 bh=iOM1sdEhQp6n/TrPdP8QZMHbn8j3NVVYys2iH6YFwcE=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=kjgXHNkOrgxPL7W0mWyKiQrUt68FHx4GhCs8mHNxcmAlvCiWtcKpavvlpH22wIdLY
 NSH2xJuy1y5J5xs6qP8lbP71G8QWORVXTU6lF57cXHKfOPr2F+UPI4L0ZeFxx2yKa/
 qQd84URJUf1EdG8hNy1uKIa3JUFgApGoCRhMv3B61v1kndP8zQ8JZvBgX+cIsOBIYo
 menkYmGN4bygwGvWDpIosDQwXX+u7SzkP1lRcg2GWJyRwv4txtN9E8h+FXx6hSKdBu
 E8LxtnPSHNHwF+i/P2TedBfoZ2IkowrTrGPwNptGE/V/eJZwYUCTZ8LSIXPTdj6yQ6
 Ou6oYTGUmejGg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1] drm/xe/sysctrl: Fix byte-order reversal in mailbox
 frame transport
To: =?utf-8?b?QW5vb3AsIFZpamF5?= <anoop.c.vijay@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260921113030.4075591-2-anoop.c.vijay@intel.com>
References: <20260921113030.4075591-2-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 11:41:09 +0000
Message-Id: <20260921114109.BD4301F000FF@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] drm/xe/sysctrl: transport fix breaks host-endian payload parsing o=
n BE systems
--

commit 017fa1e0d0cfc7a44d6ea80c21fb3e61c82f81e1
Author: Anoop Vijay <anoop.c.vijay@intel.com>
drm/xe/sysctrl: Fix byte-order reversal in mailbox frame transport

This commit fixes byte-swapping in the mailbox frame transport on
big-endian systems by using get_unaligned_le32() and put_unaligned_le32().
This preserves the little-endian wire format instead of treating the byte
stream as host-endian u32 values.

Link: https://patchwork.freedesktop.org/patch/751309/?series=3D172513&rev=
=3D5

> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe=
/xe_sysctrl_mailbox.c
> index 72baf1aa4b3ad..d5a34a24a0d60 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c

[ ... ]

> @@ -84,16 +85,16 @@ static int sysctrl_read_frame(struct xe_sysctrl *sc, =
void *frame,
>  		SYSCTRL_MB_DATA0, SYSCTRL_MB_DATA1, SYSCTRL_MB_DATA2, SYSCTRL_MB_DATA3
>  	};
>  	struct xe_device *xe =3D sc_to_xe(sc);
> -	u32 val[XE_SYSCTRL_MB_FRAME_SIZE / sizeof(u32)] =3D {0};
> +	u8 buf[XE_SYSCTRL_MB_FRAME_SIZE] =3D {};
>  	u32 dw =3D DIV_ROUND_UP(len, sizeof(u32));
>  	u32 i;
> =20
>  	xe_assert(xe, len > 0 && len <=3D XE_SYSCTRL_MB_FRAME_SIZE);
> =20
>  	for (i =3D 0; i < dw; i++)
> -		val[i] =3D xe_mmio_read32(sc->mmio, regs[i]);
> +		put_unaligned_le32(xe_mmio_read32(sc->mmio, regs[i]), buf + i * sizeof=
(u32));

[Severity: High]
Does this correctly enforce a strict little-endian byte stream in the
buffer, but inadvertently break host-endian payload parsing on big-endian
systems?

While this fixes the transport byte-order, application payload structures
like xe_sysctrl_app_status_resp and xe_ras_get_counter_response define
their fields as native host-endian u32 and u64. Because they are natively
accessed by callers, they will read byte-swapped, corrupted data on
big-endian architectures.

For example, in drivers/gpu/drm/xe/xe_sysctrl.c:xe_sysctrl_check_app_status=
():
    flags =3D resp.flags;

And in drivers/gpu/drm/xe/xe_ras.c:get_counter():
    *value =3D response.value;

Prior to this patch, readl()/writel() accidentally byte-swapped the entire
payload word-by-word on big-endian systems, which masked the fact that
payload struct fields weren't using __le32/__le64.

With this transport fix, will all sysctrl payload structs need to be updated
to use __le32/__le64 with explicit endianness conversions to prevent sysctrl
status checks and RAS counters from failing or reporting incorrect health
data?

> =20
> -	memcpy(frame, val, len);
> +	memcpy(frame, buf, len);
> =20
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921113030.4075=
591-2-anoop.c.vijay@intel.com?part=3D1
