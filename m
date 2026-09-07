Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B46CEC79F99
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 11:03:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D90010E02F;
	Mon,  7 Sep 2026 11:03:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MRp0HKL7";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C82F110E02F
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 11:03:36 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 1C220601F9;
 Mon,  7 Sep 2026 11:03:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DA561F00A3D;
 Mon,  7 Sep 2026 11:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788779015;
 bh=82089Tky+/yYgkfd40sQcbwaqZ7bvAT/9vnrCTL5L28=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=MRp0HKL7S06KISfPYRo1kHqxmV7FBMA2meRSYRSN1pz8sC+dGfAFB6NRd2/aVPkJ7
 LmsbGcMiay3B+DvgBsw3FumvSRSIEAQ//ey4/IOeWyf7tGGZq61GNvxABT2LCJarFi
 +md+2lQMZm7RdM3t7BvO+321maXwxM/Bxqeq3WQQcuxhRf1lqObV61ulcbTgjgWpXu
 3a3oEeLJNZ9f1i7jWQ1atuQGzys9oEf0oY6wGVhqTbZAqpHxfO1nzsVUB4TlTg8URG
 day76GqyozdJBZfm9iLJAePty2EeS8sUhKyC8bOEf7tyVBDYh5crcZCpLpliRooDd8
 QztFqd/GpHTlA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 7/9] drm/xe/sysctrl: Improve firmware response error
 logging
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260907105313.2208003-18-mallesh.koujalagi@intel.com>
References: <20260907105313.2208003-11-mallesh.koujalagi@intel.com>
 <20260907105313.2208003-18-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 11:03:35 +0000
Message-Id: <20260907110335.9DA561F00A3D@smtp.kernel.org>
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
- [Low] Passing restricted `__le32` fields to the `%x` format specifier cau=
ses Sparse warnings and prints byte-swapped values on big-endian architectu=
res.
--

commit 76127f4976105bb1328499efbd66f71de155b1ba
Author: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

drm/xe/sysctrl: Improve firmware response error logging

This commit updates the error logging in sysctrl_receive_frames() to use
the xe_log_err() helper. It also includes additional details such as the
response header values when a firmware response mismatch occurs.

> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe=
/xe_sysctrl_mailbox.c
> index cdd929ebed4a6..94ed2d378b89a 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> @@ -233,13 +233,15 @@ static int sysctrl_receive_frames(struct xe_sysctrl=
 *sc,
>  	if (!XE_SYSCTRL_HDR_IS_RESPONSE(hdr) ||
>  	    XE_SYSCTRL_HDR_GROUP_ID(hdr) !=3D XE_SYSCTRL_HDR_GROUP_ID(req) ||
>  	    XE_SYSCTRL_HDR_COMMAND(hdr) !=3D XE_SYSCTRL_HDR_COMMAND(req)) {
> -		xe_err(xe, "sysctrl: Response header mismatch\n");
> +		xe_log_err(xe, SYSCTRL, -EPROTO,
> +			   "Response header mismatch: %#x !=3D %#x\n",
> +			   hdr->data, req->data);

[Severity: Low]
Does this code cause Sparse warnings and print byte-swapped values on big-e=
ndian
architectures?

In sysctrl_receive_frames() in xe_sysctrl_mailbox.c, hdr->data and req->data
appear to be restricted __le32 types (based on their use with le32_to_cpu()=
 in
the XE_SYSCTRL_HDR_* macros). Passing them directly to the %#x format speci=
fier
without endianness conversion or casting will cause Sparse to emit warnings
about type mismatches ("incorrect type in argument ... expected unsigned in=
t,
got restricted __le32").

On big-endian systems, they will be interpreted as native integers by the
format string parser, printing byte-swapped values.

While the v7 changelog notes that le32_to_cpu() was explicitly removed, a
(__force u32) cast might still be needed if the raw value is intended to be
printed without triggering Sparse warnings.

>  		return -EPROTO;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907105313.2208=
003-11-mallesh.koujalagi@intel.com?part=3D7
