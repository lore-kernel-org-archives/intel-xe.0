Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EDB1C61DBD
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 11:21:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF6310E033;
	Tue, 25 Aug 2026 11:21:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="l0DVE/vw";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4244F10E033
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 11:21:35 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 1A4A140608;
 Tue, 25 Aug 2026 11:21:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4C3C1F000E9;
 Tue, 25 Aug 2026 11:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787656895;
 bh=ZsujHulqV8ZzNoyH2tJccIEtWCjtXFTgmF2xmZpY7M0=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=l0DVE/vw1l3aLq1NiPz+GuMtyzXYyXXmVYoOjuQyDAXuFkqC2bMOXojHb7HEbS7M5
 DotvCsgu2Qp65TQXDJgBk/nenv2+Kn0KYtTe1TJS4GA82hmUue49zts80OmuU107Jg
 /uWBQ+3ETuPHRLKpvPdbzv+i80xO5aYRdXRADWOtnhKOmD1ye4yg2hj0BkibkWheuD
 giF1OnHDmC+S3V99b987W/KUOprcj0IlUMYcuKPyP9M8H7AU1r0zq5MdxsxCHTOPEg
 Cq3XJkeyTrkVyGo/dA8rJ1ZsRVpYYn9lEIOLNYYcBlKqX3mDrTjcdOXDA0b/lie6JN
 QiTlN4g0LRZdA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 6/7] drm/xe/sysctrl: Log group and command ID on
 mailbox failure
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260825110542.1359776-15-mallesh.koujalagi@intel.com>
References: <20260825110542.1359776-9-mallesh.koujalagi@intel.com>
 <20260825110542.1359776-15-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 11:21:34 +0000
Message-Id: <20260825112134.C4C3C1F000E9@smtp.kernel.org>
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
- [Low] Undeclared macro xe_log_err and missing xe_log.h cause a build fail=
ure.
- [Low] Missing include for REG_FIELD_GET in header file.

Pre-existing issues:
- [High] Incorrect endianness conversion in mailbox frame read and write fu=
nctions on big-endian architectures.
--

--- Patch [6]: [PATCH v5 6/7] drm/xe/sysctrl: Log group and command ID on m=
ailbox failure ---
commit 1b3f6de8bafa26d44086972155e85f862cc56e97
Author: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

drm/xe/sysctrl: Log group and command ID on mailbox failure

Include the mailbox group ID and command code in error logs
for command preparation and execution failures.

> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe=
/xe_sysctrl_mailbox.c
> index 5032d766b3142..f55f72fce9946 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> @@ -373,7 +373,8 @@ int xe_sysctrl_send_command(struct xe_sysctrl *sc,
>  				      cmd->data_in, cmd->data_in_len,
>  				      &mbox_cmd, &cmd_size);
>  	if (ret) {
> -		xe_err(xe, "sysctrl: Failed to prepare command: %pe\n", ERR_PTR(ret));
> +		xe_log_err(xe, SYSCTRL, ret, "Failed to prepare command %#x.%#x\n",
> +			   group_id, command_code);

[Severity: Low]
Does this cause a build failure? I couldn't find the definition for the
xe_log_err macro or the xe_log.h header in the tree.

>  		return ret;
>  	}
> =20

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe=
/xe_sysctrl_mailbox.h
> index fb434cc165b2a..df7dfe3b39e24 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> @@ -15,13 +15,13 @@ struct xe_sysctrl;
>  struct xe_sysctrl_mailbox_command;
> =20
>  #define XE_SYSCTRL_APP_HDR_GROUP_ID(hdr) \
> -	FIELD_GET(APP_HDR_GROUP_ID_MASK, (hdr)->data)
> +	REG_FIELD_GET(APP_HDR_GROUP_ID_MASK, (hdr)->data)

[Severity: Low]
Is a #include <drm/intel/reg_bits.h> missing here? Any file including this
header might fail to build if it doesn't already include the definition
for REG_FIELD_GET.

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but does the endianness conversi=
on
in the mailbox frame read and write functions work correctly on big-endian
architectures?

In sysctrl_write_frame(), the byte stream is copied into a host-endian u32
array and then written to the little-endian MMIO register:

	memcpy(val, frame, len);

	for (i =3D 0; i < dw; i++)
		xe_mmio_write32(sc->mmio, regs[i], val[i]);

Similarly, in sysctrl_read_frame(), the register is read as little-endian
into a host-endian u32 array and then copied to a byte stream:

	for (i =3D 0; i < dw; i++)
		val[i] =3D xe_mmio_read32(sc->mmio, regs[i]);

	memcpy(frame, val, len);

This might cause the bytes to be reversed again by xe_mmio_write32() and
xe_mmio_read32() on big-endian systems, potentially leading to firmware
communication failures.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825110542.1359=
776-9-mallesh.koujalagi@intel.com?part=3D6
