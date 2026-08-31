Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4345C61DE2
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 11:07:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3624110E040;
	Mon, 31 Aug 2026 11:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ME025xWi";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B640610E040
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 11:07:41 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 6BE0F40477;
 Mon, 31 Aug 2026 11:07:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C3781F000E9;
 Mon, 31 Aug 2026 11:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788174461;
 bh=flc/HgQNdXOLn2yJ9b3Lf4qML6OJeIedWT1UqR9cbDw=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=ME025xWip+nrR5LC+MjdE0aXfxU0OYIFlnuKreoerBxdiRo+uTXoj30KhtXiLhDx4
 e/Q1Yep6dADWcsyJRZ8X9QIgoU8JBvPohFDBm/yQD8ad7sP6fc0dy5opS0d8Z0M783
 ci+W/+FbcDw3ySu3MbSx2K9aZPejK2m8KlVlZxRVfO7z8S9JtqWoOM25PG2tmiFzKh
 JJTmVJ8UWeE7LgmvxiVNpwEfBW2nRQDA5EJzBFVhOmWVYHttel4vkF6g2DnWo95ZQs
 izpmjhmIg70al1P0UkQ28XjIcOoMj3UZH/PovB8UJVrh80GnFIs/rNNgF9Jo6jAjHB
 Fdc9IboFXDJfg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 6/9] drm/xe/sysctrl: Replace FIELD_GET() with
 REG_FIELD_GET()
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260831104456.1770605-17-mallesh.koujalagi@intel.com>
References: <20260831104456.1770605-11-mallesh.koujalagi@intel.com>
 <20260831104456.1770605-17-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 11:07:40 +0000
Message-Id: <20260831110741.2C3781F000E9@smtp.kernel.org>
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
- [Low] Incomplete migration to REG_FIELD_PREP() leaves packing logic incon=
sistent.

Pre-existing issues:
- [High] Hardware mailbox state machine lockup on oversized firmware respon=
se.
- [High] Endianness corruption on Big Endian architectures due to memcpy fo=
llowed by writel.
--

commit 44f13e369dbf9b94796ecb4d99fe19420e2a9d18
Author: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

drm/xe/sysctrl: Replace FIELD_GET() with REG_FIELD_GET()

Use REG_FIELD_GET() when extracting fields from SysCtrl and
application headers. This better reflects that the masks
represent register-style bitfields and improves consistency.

> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe=
/xe_sysctrl_mailbox.c
> index 50bbdab072de6..3aa868f60b386 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> @@ -24,16 +24,16 @@ struct xe_sysctrl_mailbox_msg_hdr {
>  } __packed;
> =20
>  #define XE_SYSCTRL_HDR_GROUP_ID(hdr) \
> -	FIELD_GET(SYSCTRL_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
> +	REG_FIELD_GET(SYSCTRL_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))

[Severity: Low]
Does this migration leave the packing logic inconsistent?

In sysctrl_prepare_command(), the code continues to use FIELD_PREP() despite
the getters being migrated to REG_FIELD_GET():

	hdr->data =3D cpu_to_le32(FIELD_PREP(SYSCTRL_HDR_GROUP_ID_MASK, group_id) |
				     FIELD_PREP(SYSCTRL_HDR_COMMAND_MASK, command));

Should this be updated to REG_FIELD_PREP() for a complete migration?

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe=
/xe_sysctrl_mailbox.h
> index f0d5e3d7f5e31..5a3dd14e3a110 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> @@ -15,13 +15,13 @@ struct xe_sysctrl;
>  struct xe_sysctrl_mailbox_command;
> =20
>  #define XE_SYSCTRL_APP_HDR_GROUP_ID(hdr) \
> -	FIELD_GET(APP_HDR_GROUP_ID_MASK, (hdr)->data)
> +	REG_FIELD_GET(APP_HDR_GROUP_ID_MASK, (hdr)->data)

[Severity: Low]
Does this incomplete migration leave xe_sysctrl_create_command() inconsiste=
nt?

While the getters in the header are updated to REG_FIELD_GET(), the packing
logic in xe_sysctrl_create_command() continues to use FIELD_PREP() for these
same masks:

	header.data =3D FIELD_PREP(APP_HDR_GROUP_ID_MASK, group_id) |
		      FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_id);

Should this be updated to REG_FIELD_PREP() as well?

[ ... ]

[Severity: High]
This is a pre-existing issue, but does sysctrl_receive_frames() leave the
hardware mailbox state machine wedged if the firmware response is oversized?

Looking at sysctrl_receive_frames() in drivers/gpu/drm/xe/xe_sysctrl_mailbo=
x.c:

	while (!done && remain) {
		frame_size =3D min_t(size_t, remain, XE_SYSCTRL_MB_FRAME_SIZE);

		ret =3D sysctrl_process_frame(sc, out, frame_size, timeout_ms,
					    &done);
		if (ret)
			return ret;

		remain -=3D frame_size;
		out +=3D frame_size;
	}

	hdr =3D (struct xe_sysctrl_mailbox_msg_hdr *)buffer;

	if (!XE_SYSCTRL_HDR_IS_RESPONSE(hdr) ||
	    XE_SYSCTRL_HDR_GROUP_ID(hdr) !=3D XE_SYSCTRL_HDR_GROUP_ID(req) ||
	    XE_SYSCTRL_HDR_COMMAND(hdr) !=3D XE_SYSCTRL_HDR_COMMAND(req)) {

If the firmware sends a response larger than expected, the loop exits when
remain reaches 0 even though the firmware indicates more frames are pending
(done =3D=3D false).

The function then evaluates the header and returns without draining the
remaining frames from the hardware.

Does this leave the firmware stuck waiting for the host to clear
SYSCTRL_MB_CTRL_RUN_BUSY_OUT, preventing any subsequent mailbox communicati=
on?

[Severity: High]
This is a pre-existing issue, but can this cause endianness corruption on
Big Endian architectures?

In sysctrl_write_frame() in drivers/gpu/drm/xe/xe_sysctrl_mailbox.c:

	memcpy(val, frame, len);

	for (i =3D 0; i < dw; i++)
		xe_mmio_write32(sc->mmio, regs[i], val[i]);

A little-endian byte array is copied into a u32 array with memcpy() and then
written with an endian-swapping MMIO accessor.

On Big Endian platforms, the u32 value constructed via memcpy evaluates with
its bytes logically reversed.

When this is passed to xe_mmio_write32() (which performs a cpu_to_le32()
conversion), the value is byte-swapped again, writing the bytes in reversed
order.

The same issue exists in reverse in sysctrl_read_frame():

	for (i =3D 0; i < dw; i++)
		val[i] =3D xe_mmio_read32(sc->mmio, regs[i]);

	memcpy(frame, val, len);

Does this endian-swapped MMIO read being copied directly into a byte buffer
via memcpy corrupt the response byte order on Big Endian?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831104456.1770=
605-11-mallesh.koujalagi@intel.com?part=3D6
