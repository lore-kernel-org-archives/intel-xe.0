Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45865C5DF81
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 23:21:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0295810E089;
	Tue, 18 Aug 2026 23:21:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="X+5kSKfu";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 482E010E089
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 23:21:05 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 71AAE601FB;
 Tue, 18 Aug 2026 23:21:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6F141F000E9;
 Tue, 18 Aug 2026 23:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787095264;
 bh=wNFiDfOGKQlZyecqBLUzqMIKboppeNfQA8Ld9hahjHk=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=X+5kSKfug0VJoRMrII7Pkurt9bNCDeQ/caJnzOjCM1sC/kTQ5KWXREcRGwoJQjgqT
 VA9Bds2GtCc4ZAxH2LtYm82Y7MR9zstQsepN8EV7K55vOMEgeBXew/1eybO68v0xBc
 AvSW38e79qf207GYi98FGOcod+OKQBiEVKWONh3Lc+En1l2umuq2uybft0r1Ty+WNi
 4tKeYxyyG0OIkN/7yhZQXNlbb4e1LfJtCA1dW1WVwqq5JETq/TH0C3iY9zEfUAADzv
 //vUqWajZXqt0YA9PWGBLmfU6dLcp9teiIWUGRz2F1uixR85DzSYhYYSyrq8N9WbaY
 d74Nx+czUcJHw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/xe/pcode: Use int instead of u32 for mailbox status
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260818231140.729887-2-umesh.nerlige.ramappa@intel.com>
References: <20260818231140.729887-2-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 23:21:03 +0000
Message-Id: <20260818232103.E6F141F000E9@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The PCODE polling loop in `pcode_try_request` overwrites its own `=
request` parameter with the hardware response, causing subsequent polling i=
terations to send corrupted/invalid commands.
- [High] The polling loop in `pcode_try_request` doubles its wait time inde=
finitely without an upper bound, leading to severe latency spikes and misus=
e of the `usleep_range` and `udelay` APIs.
--

--- Patch [1]: [PATCH] drm/xe/pcode: Use int instead of u32 for mailbox sta=
tus ---
commit d73e65e5c069900a41101231b929154ebfc4ed92
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

drm/xe/pcode: Use int instead of u32 for mailbox status
   =20
Mailbox status is returned as int, but some callers read it as u32
(likely a typo). Use int instead.

> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index e1b8062541a91..5f7fc61c9b97c 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -148,7 +148,7 @@ int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32=
 *val, u32 *val1)
> =20
>  static int pcode_try_request(struct xe_tile *tile, u32 mbox,
>  			     u32 request, u32 reply_mask, u32 reply,
> -			     u32 *status, bool atomic, int timeout_us, bool locked)
> +			     int *status, bool atomic, int timeout_us, bool locked)
>  {
>  	int slept, wait =3D 10;
> =20

[Severity: High]
This is a pre-existing issue, but does the polling loop in this function
overwrite its own request parameter with the hardware response?

Looking at pcode_try_request(), the request parameter is passed to
pcode_mailbox_rw():

	for (slept =3D 0; slept < timeout_us; slept +=3D wait) {
		if (locked)
			*status =3D pcode_mailbox_rw(tile, mbox, &request, NULL, 1, true,
						   atomic);
		else
			*status =3D __pcode_mailbox_rw(tile, mbox, &request, NULL, 1, true,
						     atomic);
		if ((*status =3D=3D 0) && ((request & reply_mask) =3D=3D reply))
			return 0;

Since pcode_mailbox_rw() unconditionally overwrites the memory pointed to by
&request with the hardware response when return_data is true, if the expect=
ed
condition is false and the loop continues, won't the next iteration send the
hardware's previous reply back as the new request command instead of the
original command?

[Severity: High]
This isn't a bug introduced by this patch, but does the wait time double
indefinitely without an upper bound?

Further down in the loop:

		if (atomic)
			udelay(wait);
		else
			usleep_range(wait, wait << 1);
		wait <<=3D 1;

When called from xe_pcode_ready(), timeout_us is 3 minutes (180,000,000 us).
The wait variable will grow geometrically up to ~134 million microseconds,
causing the loop to sleep for over 134 seconds in a single contiguous chunk.

Additionally, when called from xe_pcode_request() with preemption disabled
(atomic =3D true), timeout_us is 50,000. The wait variable doubles up to 40=
,960.
Calling udelay(40960) stalls the CPU for ~41ms with preemption disabled, wh=
ich
could trigger NMI watchdogs and cause system instability. Should there be a=
 cap
on the wait time?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818231140.7298=
87-2-umesh.nerlige.ramappa@intel.com?part=3D1
