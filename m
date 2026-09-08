Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E3CC79F82
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 10:57:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FAE010E0D9;
	Tue,  8 Sep 2026 10:57:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WEio4nJF";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 470F510E0D9
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 10:57:06 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id E4AE04304A;
 Tue,  8 Sep 2026 10:57:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A85261F00A3A;
 Tue,  8 Sep 2026 10:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788865025;
 bh=zKMNz/TOApHM8AakMpBcwcsV+gUAZDJerEzmy6dkm/8=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=WEio4nJFC0xRGW6tKS0QwmFV1jWcjPER0hnPvvc2RFm6o/zftE9pER3T80Pjr63vl
 /lwBWOL2RKtQIRKAhkRkeExwz0yAkuLpZ7Knj320IVuXgkVgpjg8/wkYgdj+ELm88D
 NtNv15puBulMjbtmX6wNJ2ivm0oOCnIzXwAlB/C3WSvzy+omxTSF5fzCupDdF0S6oj
 VN5R4OwzymrdPP8GfbNS0ijztT+AubGRgsvUVV/xRVVVNbujhElEKZv9aIzi5ohAgW
 bWiY5GV0CyadSdysG3Eb9cUERUNjPuppitPlCFrenNO/PmG1K9CVEdVgc6OwNfTH6s
 vRIK13TlJOh1Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 02/13] drm/xe/ggtt: Report GGTT errors using
 structured logging
To: "Dnyaneshwar Bhadane" <dnyaneshwar.bhadane@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260908104550.1283933-3-dnyaneshwar.bhadane@intel.com>
References: <20260908104550.1283933-1-dnyaneshwar.bhadane@intel.com>
 <20260908104550.1283933-3-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 10:57:05 +0000
Message-Id: <20260908105705.A85261F00A3A@smtp.kernel.org>
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

Pre-existing issues:
- [High] Integer overflow in VF GGTT bounds check allows a compromised PF/G=
uC to cause out-of-bounds MMIO writes in the VF driver.
--

commit 835ff291efae84e92f4b4664f3d531bd0f480f5d
Author: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

drm/xe/ggtt: Report GGTT errors using structured logging

This commit replaces xe_tile_err() calls with xe_log_err_fatal() using
the GGTT component tag in GGTT initialization error paths.

> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 63e8bf1936058..773777afc68a2 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c

[ ... ]

> @@ -414,8 +416,9 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
> =20
>  		if (ggtt_start < wopcm ||
>  		    ggtt_start + ggtt_size > GUC_GGTT_TOP) {

[Severity: High]
This isn't a bug introduced by this patch, but is it possible for the
bounds check to be bypassed by an integer overflow?

If a compromised PF (host) or GuC firmware returns a maliciously crafted
ggtt_start and massive ggtt_size via the GuC KLV query, the addition of
ggtt_start + ggtt_size could overflow a 64-bit unsigned integer and wrap
around to a small value.

This would bypass the > GUC_GGTT_TOP check, allowing the unmodified
massive size to be passed to drm_mm_init() and could subsequently lead
to out-of-bounds MMIO writes in the guest kernel.

> -			xe_tile_err(ggtt->tile, "Invalid GGTT configuration: %#llx-%#llx\n",
> -				    ggtt_start, ggtt_start + ggtt_size - 1);
> +			xe_log_err_fatal(ggtt->tile, GGTT, -ERANGE,
> +					 "Invalid GGTT configuration: %#llx-%#llx\n",
> +					 ggtt_start, ggtt_start + ggtt_size - 1);
>  			return -ERANGE;
>  		}
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908104550.1283=
933-1-dnyaneshwar.bhadane@intel.com?part=3D2
