Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0696C61DE2
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 11:00:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7462D10E05E;
	Mon, 31 Aug 2026 11:00:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="b5XW89xf";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0042310E05E
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 11:00:55 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 7897060213;
 Mon, 31 Aug 2026 11:00:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EA331F000E9;
 Mon, 31 Aug 2026 11:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788174055;
 bh=bb37+TQUxpT+T84OHeSxbwic9yClatv+2eAQTraFEdg=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=b5XW89xfCpP4uLmwQSO+W3FOQc+r/0bklJIBNEzpQi5Nw/PeVuhozdVuE2ZchDjT1
 Sj/OVwyO9CMLQDF1sNXE91b1Zqs+HnWJLc72SLkculwj/gxH1mHHBvgD7qrQSn2y4o
 fVROmKEzwwJKBJhBeu9WMtF5NPJEp+JQa3n+ur6MFJnRfOB/AG+3IftugP5JONKzHx
 ZhoOX9K/un7mnGm95CT9zTOl/b5S5IsV7XHTRVwbxt1+wB5vXyyN0Uli+Z5Q+s/xjS
 cnlnYLg8OAvwIlk3aJxOyD4Y5HAEtMGqkmwxXBaiMENDXbFfGwc5JcWwNett94t85m
 Gan49BC/+IkLQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 7/9] drm/xe/sysctrl: Improve firmware response error
 logging
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260831104456.1770605-18-mallesh.koujalagi@intel.com>
References: <20260831104456.1770605-11-mallesh.koujalagi@intel.com>
 <20260831104456.1770605-18-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 11:00:54 +0000
Message-Id: <20260831110055.0EA331F000E9@smtp.kernel.org>
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
- [Low] The patch introduces calls to an undefined function/macro `xe_log_e=
rr()` and relies on an undeclared identifier `SYSCTRL`. Furthermore, it dep=
ends on a header file (`xe_log.h`) that is missing from the repository tree=
, resulting in an immediate build failure.
--

commit d3ef42ba91500c22f5afaa468dbb619c680583f3
Author: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

drm/xe/sysctrl: Improve firmware response error logging

This commit replaces xe_err() with xe_log_err() to include additional detai=
ls=20
when a response header mismatch occurs.

> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe=
/xe_sysctrl_mailbox.c
> index 3aa868f60b386..87e6568202795 100644
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
> +			   le32_to_cpu(hdr->data), le32_to_cpu(req->data));

[Severity: Low]
Does this code cause a build failure? It appears that xe_log_err() and SYSC=
TRL
are not defined, and the requisite header (such as xe_log.h) is missing from
the source tree.

>  		return -EPROTO;
>  	}
> =20
>  	if (XE_SYSCTRL_HDR_RESULT(hdr) !=3D 0) {
> -		xe_err(xe, "sysctrl: Firmware error: 0x%02lx\n",
> -		       XE_SYSCTRL_HDR_RESULT(hdr));
> +		xe_log_err(xe, SYSCTRL, -EIO, "Firmware error: %#04x\n",
> +			   XE_SYSCTRL_HDR_RESULT(hdr));

[Severity: Low]
Is this another location where the undefined identifiers will break the bui=
ld?

>  		return -EIO;
>  	}
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831104456.1770=
605-11-mallesh.koujalagi@intel.com?part=3D7
