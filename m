Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ABCAC5DF60
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 17:41:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFB1610F0C8;
	Wed, 12 Aug 2026 17:41:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IyilsgXO";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F258B10E3A7
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 00:04:32 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id F2FD8600E2;
 Wed, 12 Aug 2026 00:04:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 813A91F000E9;
 Wed, 12 Aug 2026 00:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786493071;
 bh=m0ECAVUU3qiMZeZ5HNh5E9naz1Mf2ibt7FFQQ+282Gc=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=IyilsgXOH+j+b73/4siBwIDbXDMDCVYe7lAXK2CyieI2lw7kzplYyarn0o6Yywlip
 JjQQsmNEB8MEoZalvkszYmDWw/L7FQmIkQ9wWCLOsbmaCHoVRNkyhaztM1HjwIbrj1
 QwxChEWxUJjQKGFrd3PwUJKy32nmlKR9dHZlgINL7lRitDvX3u8JUJg8YgZtv912s4
 ybANqZXciV6t4koNVkhajjHkSCyBam8tUWddkh/ppG3uMK825rbKACRhuULr5BEVa9
 /l80D+2iUnj84/C85t6iJYWollkXW490JRoD4buK/1ttRgzCF5XvMsBcqWw6vavY6U
 nC6ADglvnkhoQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] drm/xe/pcode: Use int instead of u32 for mailbox
 status
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260811235254.153783-8-umesh.nerlige.ramappa@intel.com>
References: <20260811235254.153783-6-umesh.nerlige.ramappa@intel.com>
 <20260811235254.153783-8-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 00:04:31 +0000
Message-Id: <20260812000431.813A91F000E9@smtp.kernel.org>
X-Mailman-Approved-At: Wed, 12 Aug 2026 17:41:20 +0000
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

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The patch causes an incompatible pointer type build warning/error =
because it fails to update the caller `xe_pcode_ready()`.

Pre-existing issues:
- [High] The polling loop in `pcode_try_request()` corrupts the original re=
quest payload by overwriting it with the hardware reply.
- [High] Uncapped exponential backoff causes massively oversized `usleep_ra=
nge` and illegal `udelay` values.
--

--- Patch [2]: [PATCH 2/4] drm/xe/pcode: Use int instead of u32 for mailbox=
 status ---
commit 4ff550781bd5498e3e5ce5f24fbf2a211b0938c1
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

drm/xe/pcode: Use int instead of u32 for mailbox status

This commit changes the status parameter in pcode_try_request() and
xe_pcode_request() from u32 to int. Mailbox status is of type int,
and using u32 was likely a typo.

> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index ccc3bdeed6bb2..e9125341481b7 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -149,7 +149,7 @@ int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32=
 *val, u32 *val1)
> =20
>  static int pcode_try_request(struct xe_tile *tile, u32 mbox,
>  			     u32 request, u32 reply_mask, u32 reply,
> -			     u32 *status, bool atomic, int timeout_us, bool locked)
> +			     int *status, bool atomic, int timeout_us, bool locked)

[Severity: High]
Does this change cause a compile failure? In xe_pcode_ready(), status is
still defined as a u32 and passed as an argument to pcode_try_request():

xe_pcode_ready() {
	u32 status, request =3D DGFX_GET_INIT_STATUS;
	...
	ret =3D pcode_try_request(tile, DGFX_PCODE_STATUS, request,
				DGFX_INIT_STATUS_COMPLETE,
				DGFX_INIT_STATUS_COMPLETE,
				&status, false, timeout_us, locked);
	...
}

This results in passing a u32 pointer where an int pointer is expected.

[Severity: High]
This is a pre-existing issue, but does the polling loop in
pcode_try_request() corrupt the original request payload by overwriting it
with the hardware reply?

In pcode_try_request(), the request parameter is passed by reference to
__pcode_mailbox_rw() (and pcode_mailbox_rw()):

	*status =3D __pcode_mailbox_rw(tile, mbox, &request, NULL, 1, true,
				     atomic);

If the initial hardware poll fails, since return_data=3Dtrue, the function
overwrites the request variable with the data read from PCODE_DATA0. On
subsequent loop iterations, corrupted data will be sent to the PCODE
hardware instead of the original request.

[Severity: High]
This is also a pre-existing issue, but does the uncapped exponential backoff
in pcode_try_request() cause oversized usleep_range() and illegal udelay()
values?

In the polling loop:

	if (atomic)
		udelay(wait);
	else
		usleep_range(wait, wait << 1);
	wait <<=3D 1;

The wait variable unconditionally doubles without an upper bound. When
called from xe_pcode_ready() with a 3-minute timeout, wait grows to over
83 million, causing usleep_range() to sleep for up to 167 seconds at a
time. When called from xe_pcode_request() with atomic=3Dtrue and a 50ms
timeout, wait reaches 20,480, resulting in udelay(20480), which violates
kernel latency guidelines for atomic contexts.

>  {
>  	int slept, wait =3D 10;
> =20

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260811235254.1537=
83-6-umesh.nerlige.ramappa@intel.com?part=3D2
