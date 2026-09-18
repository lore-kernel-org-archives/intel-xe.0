Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 793B4C982DA
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 13:29:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E5AD10F3B5;
	Fri, 18 Sep 2026 13:29:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WXGL93X3";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A1B710F3B8
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 13:29:49 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 50760601EF;
 Fri, 18 Sep 2026 13:29:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB0831F000FF;
 Fri, 18 Sep 2026 13:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789738188;
 bh=MYx+5cP1+kv70s+Y9r0x3thqyNeSfojbTldw1TPzjhs=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=WXGL93X3HgKeg0kXeBhCQxWDP6gZHCP4nfrin1uWWTWPOP5BkTtAFl8ec7WGsORdh
 edJfZ0mYThgsb41t7V35KtmgmjeBsQprdyaVj7IPS3iQ3bepPzkutArpq+U+cyVQj2
 33/OSuqBG9naLnEc72TjM2SkHsxCSzxuNHwpFSHWCR4Z0PQJvPC/hZ2QhH+nCWuaLr
 gVTS2az0CG+fUhlhwfuuwxLOPcj8ilF5pdKwlVVnuHUwMAjZJg0caGsWZuWu1fWjRV
 UVU3kSZs315oZksyD9U0yEDHFt3YZoOPVOYgFnHSeacjQ8yaanUqiJHIH2A1tufmSb
 mITcAL/Dun4kQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 10/20] drm/xe/vsec: Support possible hotplug exit
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260918131751.2408883-32-michael.j.ruhl@intel.com>
References: <20260918131751.2408883-22-michael.j.ruhl@intel.com>
 <20260918131751.2408883-32-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 13:29:47 +0000
Message-Id: <20260918132947.DB0831F000FF@smtp.kernel.org>
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
- [Low] cleanup: mixing goto-based cleanup and scoped_guard violates guidel=
ines
--

commit c7e9d9c776cd4cd0e4508280573de2b886711d95
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>
Subject: drm/xe/vsec: Support possible hotplug exit

This commit introduces a check in the VSEC callback API to verify that the
device is valid in a hotplug context. It uses drm_dev_enter() and
drm_dev_exit() to safeguard accesses, introducing a goto-based dev_exit path
to handle early returns.

> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
[ ... ]
> @@ -188,11 +199,14 @@ int xe_pmt_telem_read(struct device *dev, u32 guid,=
 u64 *data, loff_t user_offse
>  		xe_pm_runtime_get(xe);
>  		break;
>  	case TELEMETRY:
> -		if (!xe_pm_runtime_get_if_active(xe))
> -			return -ENODATA;
> +		if (!xe_pm_runtime_get_if_active(xe)) {
> +			ret =3D -ENODATA;
> +			goto dev_exit;
> +		}
>  		break;
>  	case WATCHER:
> -		return -EINVAL;
> +		ret =3D -EINVAL;
> +		goto dev_exit;
>  	}
> =20
>  	scoped_guard(mutex, &xe->pmt.lock) {

[Severity: Low]
Does introducing goto-based cleanup (goto dev_exit) in xe_pmt_telem_read()
conflict with the pre-existing use of scoped_guard() in the same function?

The kernel cleanup guidelines in include/linux/cleanup.h state that mixing
goto-based cleanup and __free()/guard() declarations within the same
function should be avoided. Mixing these patterns can create confusing
ownership semantics and increases the risk of double-free or resource leak
bugs during future modifications.

Could the drm_dev_enter()/drm_dev_exit() pairing be handled by a cleanup
guard instead, or should the scoped_guard() be converted to standard
lock/unlock calls to maintain a single cleanup style in this function?

>  		/* set SoC re-mapper index register based on GUID memory region */
>  		xe->soc_remapper.set_telem_region(xe, mem_region);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918131751.2408=
883-22-michael.j.ruhl@intel.com?part=3D10
