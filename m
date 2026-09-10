Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AAC3C79FBF
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 18:05:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3904010E298;
	Thu, 10 Sep 2026 18:05:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="E0NghZPp";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6FAB10E298
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 18:05:19 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 0FD87601F1;
 Thu, 10 Sep 2026 18:05:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99E9A1F000FF;
 Thu, 10 Sep 2026 18:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789063518;
 bh=pBQ9p8bo7LLq5TJ9Y8hxeFOS/Ffe0rHwOmJEh1E+vAg=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=E0NghZPplU3f2hwT55IJwBPRRLKM1uUT9okFTfpyvi5DOHnQJzB8SELMieJU7c/zi
 XdC0pBMGs4pzs/vVU8cQkB/0/YrOsbXRfudT+dyRNfAsbaaZUObrBl+DUmr6XOP7rC
 +ft9nzHEZU0E0CgKIxqWura7FojpMbouo02mQl7cFX59IR5qMAp3CRmfJT2C4SGVbR
 zyqtOvvuS99jCz4prqrNM32meIl0fMJ/cstHsIgQpIj/Bnv3bzEDMI2wtG83ERH3VJ
 t9tf1Mm2xT3PNCd+5WCUE6Jlq7cVZMK0PQfPn4g7MbDZdOojAwxjw0AOcI2RVW78OU
 J8F54+ugudAnw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/3] drm/xe/sysctrl: Add RAS error injection debugfs
 interface
To: =?utf-8?b?QW5vb3AsIFZpamF5?= <anoop.c.vijay@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260910175619.3176089-7-anoop.c.vijay@intel.com>
References: <20260910175619.3176089-5-anoop.c.vijay@intel.com>
 <20260910175619.3176089-7-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 18:05:18 +0000
Message-Id: <20260910180518.99E9A1F000FF@smtp.kernel.org>
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
- [Low] Mixing goto-based error handling with __free() cleanup
--

commit 01e12f57d2e93b431867d35f4fa17e53a8f8f916
Author: Anoop Vijay <anoop.c.vijay@intel.com>

drm/xe/sysctrl: Add RAS error injection debugfs interface

This commit adds a debugfs interface for exercising the System Controller's
RAS error injection command. It is used to validate RAS error detection and
recovery paths.

> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c b/drivers/gpu/drm/xe=
/xe_sysctrl_debugfs.c
> index c0454c4c0ae07..0c537248b30d2 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
[ ... ]
> +static ssize_t xe_sysctrl_ras_error_inject_write(struct file *file, cons=
t char __user *ubuf,
> +						 size_t len, loff_t *offp)
> +{
> +	char *kbuf __free(kfree) =3D NULL;
[ ... ]
> +	while ((token =3D strsep(&tmp, " \t\n")) !=3D NULL) {
> +		if (*token =3D=3D '\0')
> +			continue;
> +
> +		if (kstrtoul(token, 0, &val))
> +			goto inval;

[Severity: Low]
Does this mix goto-based error handling with __free() cleanup declarations?

According to the coding style guidelines in include/linux/cleanup.h, there
is an expectation that goto and scope-based cleanups like __free or guard
should never be mixed in the same function.=20

While this specific instance appears to work correctly because the return
from the goto label properly unwinds the scope, mixing them creates confusi=
ng
ownership semantics that often lead to double-free or resource leak bugs
during future code modifications.

Could this be refactored to either return directly or use scope-based
cleanups exclusively?

[ ... ]
> +	return status ? status : len;
> +
> +inval:
> +	xe_err(xe, "sysctrl: invalid ras_error_inject token '%s'\n", token);
> +	return -EINVAL;
> +}
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910175619.3176=
089-5-anoop.c.vijay@intel.com?part=3D2
