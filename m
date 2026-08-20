Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C729C5DF87
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 10:28:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CEF610EFB9;
	Thu, 20 Aug 2026 10:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dIjCOIfV";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE7E910EFB9
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 10:28:51 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id E0A3B60A5C;
 Thu, 20 Aug 2026 10:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 781A61F000E9;
 Thu, 20 Aug 2026 10:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787221730;
 bh=A4/F+2VqqpB5mI11hLPKvDvHJ6nVbn7nBdWrYA4pz9Y=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=dIjCOIfVI5qD3CF4yrpIP0whXZNBVXcqsMmpulvpfUU6hBbOV9dl535KrPLGsq6tN
 fVG48KIWSMQIJ3qVAxjlm/j8/L2W1iSIoyvFp9UTJ3JvHkdneGwaSHg32A6xjqnI/g
 7/mzay/DjLbcBa2xow/XcWPhT0Z5SRG+2vKJeHr1xuljqCKH1PIdxQpVJHxUGHbLnG
 d9Svia6oJ01+IcKkCZPAR+SHGVYU/lcgdaRf5l9ztVbVH+Ied615eB0EL7QTJohZxf
 X5Pfisvw5H28abq0WE7XlEcla7ZnqkCHlbnH6RacwQY31X0qudjcl4Qgisuo3xT89Q
 zCPBlzDxk6m1w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/7] drm/xe/sysctrl: Improve firmware response error
 logging
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260820101632.527214-14-mallesh.koujalagi@intel.com>
References: <20260820101632.527214-9-mallesh.koujalagi@intel.com>
 <20260820101632.527214-14-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 10:28:50 +0000
Message-Id: <20260820102850.781A61F000E9@smtp.kernel.org>
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
- [High] Failing to drain all response frames leaves the sysctrl mailbox in=
 an incomplete state.
- [High] Incorrect endianness conversion when reading/writing sysctrl mailb=
ox frames on big-endian systems.
--

--- Patch [5]: [PATCH v4 5/7] drm/xe/sysctrl: Improve firmware response err=
or logging ---
commit f799e2637d5118be81198e34aa2cb7d8ca6d55fc
Author: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

drm/xe/sysctrl: Improve firmware response error logging

This commit updates the sysctrl mailbox driver to use the xe_log_err helper
and includes additional details when a response header mismatch occurs.

[Severity: High]
This isn't a bug introduced by this patch, but does the frame processing
code handle endianness correctly on big-endian systems?

In sysctrl_read_frame():

	for (i =3D 0; i < dw; i++)
		val[i] =3D xe_mmio_read32(sc->mmio, regs[i]);

	memcpy(frame, val, len);

And in sysctrl_write_frame():

	memcpy(val, frame, len);

	for (i =3D 0; i < dw; i++)
		xe_mmio_write32(sc->mmio, regs[i], val[i]);

Since xe_mmio_read32 and xe_mmio_write32 handle CPU-endian u32 values,
won't using memcpy to move data between a little-endian byte stream and
a CPU-endian u32 array inadvertently byte-swap each 32-bit word on
big-endian architectures, resulting in corrupted headers and payloads?

> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe=
/xe_sysctrl_mailbox.c
> index c043b51cacc89..9d7915c9d4ae8 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> @@ -237,13 +237,17 @@ static int sysctrl_receive_frames(struct xe_sysctrl=
 *sc,

[Severity: High]
This is a pre-existing issue, but what happens if the firmware sends more
frames than expected?

Earlier in sysctrl_receive_frames(), the loop reads frames based on remain:

	while (!done && remain) {
		frame_size =3D min_t(size_t, remain, XE_SYSCTRL_MB_FRAME_SIZE);

		ret =3D sysctrl_process_frame(sc, out, frame_size, timeout_ms,
					    &done);
		if (ret)
			return ret;

		remain -=3D frame_size;
		out +=3D frame_size;
	}

If the caller provides a data_out_len that is smaller than the firmware's
actual response size, the driver will stop reading when remain drops to 0
while done is still false.

Will this return success while leaving the hardware waiting for the host to
read and acknowledge the remaining frames, potentially causing subsequent
sysctrl communications to fail with mailbox busy timeouts?

>  	if (!XE_SYSCTRL_HDR_IS_RESPONSE(hdr) ||
>  	    XE_SYSCTRL_HDR_GROUP_ID(hdr) !=3D XE_SYSCTRL_HDR_GROUP_ID(req) ||
>  	    XE_SYSCTRL_HDR_COMMAND(hdr) !=3D XE_SYSCTRL_HDR_COMMAND(req)) {
> -		xe_err(xe, "sysctrl: Response header mismatch\n");
> +		xe_log_err(xe, SYSCTRL, -EPROTO,
> +			   "Response header mismatch: got group=3D0x%02lx cmd=3D0x%02lx is_re=
sp=3D%lu, expected group=3D0x%02lx cmd=3D0x%02lx\n",
> +			   XE_SYSCTRL_HDR_GROUP_ID(hdr), XE_SYSCTRL_HDR_COMMAND(hdr),
> +			   XE_SYSCTRL_HDR_IS_RESPONSE(hdr),
> +			   XE_SYSCTRL_HDR_GROUP_ID(req), XE_SYSCTRL_HDR_COMMAND(req));
>  		return -EPROTO;
>  	}
> =20
>  	if (XE_SYSCTRL_HDR_RESULT(hdr) !=3D 0) {
> -		xe_err(xe, "sysctrl: Firmware error: 0x%02lx\n",
> -		       XE_SYSCTRL_HDR_RESULT(hdr));
> +		xe_log_err(xe, SYSCTRL, -EIO, "Firmware error: 0x%02lx\n",
> +			   XE_SYSCTRL_HDR_RESULT(hdr));
>  		return -EIO;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820101632.5272=
14-9-mallesh.koujalagi@intel.com?part=3D5
