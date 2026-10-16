Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA93CC6B38
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 07:36:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35DDE11265B;
	Fri, 16 Oct 2026 07:36:17 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06554112656
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 07:36:11 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id CCDA541B33;
 Fri, 16 Oct 2026 07:36:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F2AA1F000C4;
 Fri, 16 Oct 2026 07:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792136170;
 bh=/sew9A8EYvMEZx+Y0pYjc1pTT5h99Pt1XwJXePPihlo=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=FkyHWeZcgnZaTcQUHWc170D1q+rLtO7Y+AtXGSQbHhz3aCv9XUmsZQ2GnyC6PI1Jc
 A5ql425MKhYi2XMpHyIG4ANbRmqGhsMMrJP64HhegeVRfsYCO9HRXVSxRRg93aVzOx
 4wJjAlqwiSpVEkNnmDX3hZOQxsFW9u3XEOiWdKLdnvTu8mo5RbbjeR7xILOO93PB0Z
 hRG8YRYfiEqe7bXsL6IhMz6BpJADddFKiJkKygzjQEEVSxVifBrNixmjfZAla3gSUe
 +Ivibkyw4iw3EcM9Jl73mUbVgUDxims3PzqQ5vLpWLvnIyStYGqqrqU/cHAq6nrKbM
 WunVJrBte70AA==
Message-ID: <sashiko-outbox-173941@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 7/9] drm/xe/amc: Guard xe_amc_work() with runtime PM
To: "Raag Jadav" <raag.jadav@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261016072623.457392-8-raag.jadav@intel.com>
References: <20261016072623.457392-1-raag.jadav@intel.com>
 <20261016072623.457392-8-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 07:36:10 +0000
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
- [Medium] cleanup: Mixing goto-based error handling with guard() cleanup
- [Low] build: undeclared identifier 'xe' in xe_amc_work()
--

commit 151af4bf3e553f2ab553af055075b9c228711e6e
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/amc: Guard xe_amc_work() with runtime PM

This commit adds a runtime PM guard to xe_amc_work() to ensure a runtime
PM reference is held for xe_device_declare_wedged() callers.

> diff --git a/drivers/gpu/drm/xe/xe_amc.c b/drivers/gpu/drm/xe/xe_amc.c
> index 9459c63bc3ca2..662aec6c86a72 100644
> --- a/drivers/gpu/drm/xe/xe_amc.c
> +++ b/drivers/gpu/drm/xe/xe_amc.c
> @@ -113,6 +113,8 @@ static void xe_amc_work(struct work_struct *work)
>  	struct i2c_client *client;
>  	int ret;
> =20
> +	guard(xe_pm_runtime)(xe);

[Severity: Low]
Is the variable xe declared in this scope? It looks like this introduces
a compilation failure because xe is passed to the guard macro without being
defined anywhere within xe_amc_work().

[Severity: Medium]
According to the cleanup subsystem guidelines, is it acceptable to mix
goto-based error handling and scope-based cleanup in the same function?

The newly added guard is placed in a function that still uses traditional
goto-based error handling on failure paths, as seen directly below.
Mixing these paradigms creates confusing ownership semantics that can lead
to resource leaks or double-free bugs during future refactoring.

> +
>  	client =3D amc->i2c->client[XE_I2C_CLIENT_AMC];
>  	if (IS_ERR_OR_NULL(client))
>  		goto out_reassert_interrupt;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016072623.4573=
92-1-raag.jadav@intel.com?part=3D7
