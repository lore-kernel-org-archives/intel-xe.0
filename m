Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3EA2C9832F
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 09:30:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F92910E4FC;
	Mon, 28 Sep 2026 09:30:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XKwDSEPW";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A7B310E4FC
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 09:30:53 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 3A65F43BC0;
 Mon, 28 Sep 2026 09:30:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F01D91F000FF;
 Mon, 28 Sep 2026 09:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790587853;
 bh=CnmQ1/Hfdds1ol5swl5Pg9U94NUh57+jxa3VQbipnLc=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=XKwDSEPWiZ0zyf8hiapquFNxck4SWrgBFFOgExkHz97WK++bW8uQodGDS7rx2cCOw
 AKpaw3ouR3J3hCUL50AIJpPhDHuFUWF70Xc/JrS7jpc1xmEJfv9UWnkK+SPxtJSw8W
 g+QpoG+T0wNdjZWcHEJLBfteNDORl9CyQn7Votf2ZzrC7bPDGwa/rB43HhrD7g5YPQ
 g1XL12+WrEc7w5wxP1w8AsSB+26klTzyTcdw5X8mSoy7Hp+PyK0elwrfZra97z5cAr
 6jskQHUMQbs4AYrf4Umtv16z0y5Oc54EUgw7BK3DLo5SuQLjSxgN9EjXYMHoHV+Czw
 9WYocsDveNCaQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 05/12] drm/xe/memirq: Report errors using structured
 xe_log API
To: "Dnyaneshwar Bhadane" <dnyaneshwar.bhadane@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260928092114.1610203-6-dnyaneshwar.bhadane@intel.com>
References: <20260928092114.1610203-1-dnyaneshwar.bhadane@intel.com>
 <20260928092114.1610203-6-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 09:30:52 +0000
Message-Id: <20260928093052.F01D91F000FF@smtp.kernel.org>
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
- [Low] drm/xe: unused memirq_err() macro definition
--

commit 8ccc9e0c71be92f53616abc0b65b5b3ec006d967
Author: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

drm/xe/memirq: Report errors using structured xe_log API

Replace memirq_err() calls with xe_log_err() using the MEMIRQ
component tag for memory-based IRQ failures.

> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memir=
q.c
> index 9dfe965cb46ec..32b9f87a10ecf 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.c
> +++ b/drivers/gpu/drm/xe/xe_memirq.c

[ ... ]

> @@ -370,8 +371,8 @@ int xe_memirq_init_guc(struct xe_memirq *memirq, stru=
ct xe_guc *guc)
>  	return 0;
> =20
>  failed:
> -	memirq_err(memirq, "Failed to setup report pages in %s (%pe)\n",
> -		   guc_name(guc), ERR_PTR(err));
> +	xe_log_err(memirq_to_tile(memirq), MEMIRQ, err,
> +		   "Failed to setup report pages in %s\n", guc_name(guc));
>  	return err;
>  }

[Severity: Low]
Does this leave the memirq_err macro definition as unused dead code?

The macro definition in drivers/gpu/drm/xe/xe_memirq.c:

#define memirq_err(m, _fmt, ...)	memirq_printk(m, err, _fmt, ##__VA_ARGS__)

was not removed in this patch despite all of its call sites being replaced.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928092114.1610=
203-1-dnyaneshwar.bhadane@intel.com?part=3D5
