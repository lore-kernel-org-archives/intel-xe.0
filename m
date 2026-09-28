Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B671EC9832F
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 09:37:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 704B710E0A8;
	Mon, 28 Sep 2026 09:37:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TjIB+vQt";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0BD710E0A8
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 09:36:59 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 86C5C41163;
 Mon, 28 Sep 2026 09:36:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A08F1F000FF;
 Mon, 28 Sep 2026 09:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790588219;
 bh=bSkQ7TvVwkL3V7PMZtRotEDXybM4I2KZib1/XB4QMuA=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=TjIB+vQtoVtaKYllYDtWS4BgKkJ5W3ATsJ1GKSmmT2v0yfTkrzIWKNSQqGuI8gVyu
 rrTDsv7OTZdT6gxKaHwV1zKOWGi9JyFE0o3iZbUoZmld2ulnmfa0BEiSr4LownvC7o
 9AhF5OTeQ6DAmlzjiJ2vPpRPwk0ajObSQohoNgXoem3IWs8ckowK49f/QsiRNq+Dy3
 NFpm7f5ZkKm1Kqn8qqeIFz0HN3RNXUwZ8wdFD5E2CGOlMEIwGuSHtjpcr8WNOf1m/H
 dHj5Tktx8nLyq3hh3pAaNhZ0eODNQmfPVqYG11qFBsif1RNnAT1YNjBjoAQXA6uGD8
 errv7U5gHZUPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 10/12] drm/xe/lmtt: Report invalidation errors using
 structured xe_log API
To: "Dnyaneshwar Bhadane" <dnyaneshwar.bhadane@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260928092114.1610203-11-dnyaneshwar.bhadane@intel.com>
References: <20260928092114.1610203-1-dnyaneshwar.bhadane@intel.com>
 <20260928092114.1610203-11-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 09:36:58 +0000
Message-Id: <20260928093659.4A08F1F000FF@smtp.kernel.org>
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
- [Low] xe_lmtt: missing newline in xe_log_err format string
--

commit d8b97ea5041b192b44dac80a8e9209e9058d6519
Author: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

drm/xe/lmtt: Report invalidation errors using structured xe_log API

This commit replaces xe_tile_sriov_err() with xe_log_err() using the LMTT
component tag for LMTT and MERT invalidation failures. It preserves the
SR-IOV prefix in the newly structured log messages.

> diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
> index 0c726eda93906..fe77b3ec06807 100644
> --- a/drivers/gpu/drm/xe/xe_lmtt.c
> +++ b/drivers/gpu/drm/xe/xe_lmtt.c

[ ... ]

> @@ -302,14 +303,15 @@ void xe_lmtt_invalidate_hw(struct xe_lmtt *lmtt)
> =20
>  	err =3D lmtt_invalidate_hw(lmtt);
>  	if (err)
> -		xe_tile_sriov_err(tile, "LMTT invalidation failed (%pe)",
> -				  ERR_PTR(err));
> +		xe_log_err(tile, LMTT, err, "%s invalidation failed.",
> +			   xe_sriov_printk_prefix(xe));

[Severity: Low]
Does this format string need a trailing newline?=20

Without a trailing '\n' in xe_log_err(), the kernel printk system might lea=
ve
the log line unterminated, potentially causing subsequent logs to be
concatenated to this line.=20

>  	if (xe_device_has_mert(xe) && xe_tile_is_root(tile)) {
>  		err =3D xe_mert_invalidate_lmtt(xe);
>  		if (err)
> -			xe_tile_sriov_err(tile, "MERT LMTT invalidation failed (%pe)",
> -					  ERR_PTR(err));
> +			xe_log_err(tile, LMTT, err,
> +				   "%s MERT invalidation failed.\n",
> +				   xe_sriov_printk_prefix(xe));
>  	}
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928092114.1610=
203-1-dnyaneshwar.bhadane@intel.com?part=3D10
