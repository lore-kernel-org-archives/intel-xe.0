Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23652C61DBE
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 11:22:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4D8810E033;
	Tue, 25 Aug 2026 11:22:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TYYea52c";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1246410E033
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 11:22:47 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 1BC5C6011F;
 Tue, 25 Aug 2026 11:22:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B11A81F000E9;
 Tue, 25 Aug 2026 11:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787656965;
 bh=PUXEEvQ5HpWR5wy5Bj3BUkpc9W1hKvFOdOe2CNtEcfM=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=TYYea52cZlFGnKJiBLZvyB4J0GADjy0l2M9cFo/ud+b6gCWpRYKe0RK6k51JXBgDp
 GpfaY0vwVDKbzVOW1lMiGfHePbahbApSMytgRul9mMLbiui6ybjXiYw59oSuaBWN1k
 IajKt09A7agk+1451znmX2e2m3mwyD5WUQIkyf0HwKhabOn0GgEJ6xdwViCQwfCTki
 Vp4xVu8eOEh+KARMcpNbqLfNixXziAtjXstePU0Hmz5znldAbSRUO3luFP3vG27YDu
 UZ1BRE1TCwj/a4anbEe65CXNNouvPQTmT0SqsI7oUvsReUWsIU3KmlbNd2ks5RvJfC
 SMKZhqHwVdL8g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/7] drm/xe/sysctrl: Improve firmware response error
 logging
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260825110542.1359776-14-mallesh.koujalagi@intel.com>
References: <20260825110542.1359776-9-mallesh.koujalagi@intel.com>
 <20260825110542.1359776-14-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 11:22:45 +0000
Message-Id: <20260825112245.B11A81F000E9@smtp.kernel.org>
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
- [Low] Build failure due to missing `xe_log.h` and undeclared `xe_log_err`=
 function.

Pre-existing issues:
- [High] Endianness bug in MMIO data transfer causes hardware state machine=
 corruption on big-endian hosts.
- [High] Mailbox response reader truncates oversized responses without drai=
ning the mailbox, leading to hardware state machine corruption.
--

--- Patch [5]: [PATCH v5 5/7] drm/xe/sysctrl: Improve firmware response err=
or logging ---
commit aca0eba486b26ff6a9ae8a95c07e0dfce167281d
Author: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

drm/xe/sysctrl: Improve firmware response error logging

Use xe_log_err() helper and include additional details when a
response header mismatch occurs.

> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe=
/xe_sysctrl_mailbox.c
> index f8b518dcafa24..5032d766b3142 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
[ ... ]
> @@ -237,13 +237,17 @@ static int sysctrl_receive_frames(struct xe_sysctrl=
 *sc,
>  	if (!XE_SYSCTRL_HDR_IS_RESPONSE(hdr) ||
>  	    XE_SYSCTRL_HDR_GROUP_ID(hdr) !=3D XE_SYSCTRL_HDR_GROUP_ID(req) ||
>  	    XE_SYSCTRL_HDR_COMMAND(hdr) !=3D XE_SYSCTRL_HDR_COMMAND(req)) {
> -		xe_err(xe, "sysctrl: Response header mismatch\n");
> +		xe_log_err(xe, SYSCTRL, -EPROTO,
> +			   "Response header mismatch: got group=3D%#x cmd=3D%#x is_resp=3D%u,=
 expected group=3D%#x cmd=3D%#x\n",
> +			   XE_SYSCTRL_HDR_GROUP_ID(hdr), XE_SYSCTRL_HDR_COMMAND(hdr),
> +			   XE_SYSCTRL_HDR_IS_RESPONSE(hdr),
> +			   XE_SYSCTRL_HDR_GROUP_ID(req), XE_SYSCTRL_HDR_COMMAND(req));

[Severity: Low]
Does this code fail to compile? It looks like xe_log.h is missing from the
source tree, meaning xe_log_err and SYSCTRL might be undeclared identifiers.

>  		return -EPROTO;
>  	}
> =20
>  	if (XE_SYSCTRL_HDR_RESULT(hdr) !=3D 0) {
> -		xe_err(xe, "sysctrl: Firmware error: 0x%02lx\n",
> -		       XE_SYSCTRL_HDR_RESULT(hdr));
> +		xe_log_err(xe, SYSCTRL, -EIO, "Firmware error: %#04x\n",
> +			   XE_SYSCTRL_HDR_RESULT(hdr));
>  		return -EIO;
>  	}

[Severity: High]
This is a pre-existing issue, but does this loop truncate oversized respons=
es
without draining the mailbox?

drivers/gpu/drm/xe/xe_sysctrl_mailbox.c:sysctrl_receive_frames() {
	...
	while (!done && remain) {
		frame_size =3D min_t(size_t, remain, XE_SYSCTRL_MB_FRAME_SIZE);

		ret =3D sysctrl_process_frame(sc, out, frame_size, timeout_ms,
					    &done);
		if (ret)
			return ret;

		remain -=3D frame_size;
		out +=3D frame_size;
	}
	...
}

If the firmware sends more frames than expected by data_out_len, remain
becomes 0 before done is set to true. The loop exits silently and returns
success, leaving the unread frames in the mailbox.=20

Will subsequent mailbox commands write to the control register while it is
still busy, potentially corrupting the hardware state machine?

[Severity: High]
This is a pre-existing issue, but is there an endianness mismatch in the MM=
IO
data transfers here?

drivers/gpu/drm/xe/xe_sysctrl_mailbox.c:sysctrl_write_frame() {
	...
	memcpy(val, frame, len);

	for (i =3D 0; i < dw; i++)
		xe_mmio_write32(sc->mmio, regs[i], val[i]);
	...
}

And similarly:

drivers/gpu/drm/xe/xe_sysctrl_mailbox.c:sysctrl_read_frame() {
	...
	for (i =3D 0; i < dw; i++)
		val[i] =3D xe_mmio_read32(sc->mmio, regs[i]);

	memcpy(frame, val, len);
	...
}

When little-endian bytes are copied into native CPU-endian u32 arrays, won't
this result in an incorrect byte order on big-endian hosts?=20

The bytes could be placed in the wrong order inside the CPU-endian u32
values, and when the MMIO accessors byte-swap these values again, the
resulting byte stream on the wire might be reversed compared to the
intended payload.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825110542.1359=
776-9-mallesh.koujalagi@intel.com?part=3D5
