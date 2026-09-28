Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65BCDC9832F
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 09:31:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B51910E4FC;
	Mon, 28 Sep 2026 09:31:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oywdqLOV";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51AE210E4FC
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 09:31:49 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 392D341AF7;
 Mon, 28 Sep 2026 09:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E564C1F000FF;
 Mon, 28 Sep 2026 09:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790587909;
 bh=LyJXMRrZM9wN/xQQFPBigTUkHPnSo//RULz2b82ia2Q=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=oywdqLOV2FraBzyfj5Vcxf/2i1nUe8kgVn6NodXLhGJAJOV4aCFe9c+f4UAeG68Nq
 Wc1Bu1q9ezc8kiTd846ogzNHWTFLS/EzqmY6XXjjss1Gj9Dib5m3Zxosg0syIms9Tw
 R5qo4P6tdwWdIaGLKkS+nWh9pFC81cZ/dwTc/Xz0ft1e9KpDVVKq0KpJfYFyUX9ajF
 altIYNqdXVUzWYj0loDgJlMxRnSGVDIGhk0fosf+p1FJMiS4k9JMJcF6EzT25cIBEa
 D1T8j5EUpK8GHjEIoHwGvk1sB2IguKLiTTIxEG2LaTc7nXibjEf7V/OYeoO+pp0FiY
 hkYMkHk5EKaIQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 06/12] drm/xe/reg_sr: Report save-restore errors
 using structured xe_log API
To: "Dnyaneshwar Bhadane" <dnyaneshwar.bhadane@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260928092114.1610203-7-dnyaneshwar.bhadane@intel.com>
References: <20260928092114.1610203-1-dnyaneshwar.bhadane@intel.com>
 <20260928092114.1610203-7-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 09:31:48 +0000
Message-Id: <20260928093148.E564C1F000FF@smtp.kernel.org>
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
- [Medium] xe_reg_sr: incomplete log API transition vs commit message
--

commit 4c8922a6ada2b08bcb96cfb27ef3430f71c97d7c
Author: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

drm/xe/reg_sr: Report save-restore errors using structured xe_log API

This commit replaces older xe_gt_notice() and xe_gt_err() logging calls with
the newer structured xe_log_info() and xe_log_err() API for register
save and restore operations.

> Replace xe_gt_notice() and xe_gt_err() calls with xe_log_info() and
> xe_log_err() using the REGS and RTP component tag for register save-resto=
re
> operations:
>=20
>   - Failed to add register to save-restore list

[Severity: Medium]
The commit message states that the error log for failing to add a register
to the save-restore list is replaced. However, this update appears to be
missing from the patch. Was this change unintentionally dropped during a
rebase?

For reference, xe_reg_sr_add() still contains the old call:

fail:
	xe_gt_err(gt,
		  "discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s,=
 mcr: %s): ret=3D%d\n",
		  idx, e->clr_bits, e->set_bits,
		  str_yes_no(e->reg.masked),
		  str_yes_no(e->reg.mcr),
		  ret);

[ ... ]

> v3:
>  - Drop config mismatch log (Michal)

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_s=
r.c
> index e328f50725572..eab84a528d122 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c

[ ... ]

> @@ -87,15 +88,15 @@ static struct xe_reg sanitize_mcr(struct xe_reg_sr *s=
r,
> =20
>  	if (is_mcr && !reg.mcr) {
>  		reg.mcr =3D 1;
> -		xe_gt_notice(gt, "xe_reg_sr_entry using non-MCR register for address 0=
x%x, forcing MCR\n",
> -			     reg.addr);
> +		xe_log_info(gt, RTP, "xe_reg_sr_entry using non-MCR register for addre=
ss 0x%x, forcing MCR\n",
> +			    reg.addr);
>  		reg_sr_inc_error(sr);
>  	}
> =20
>  	if (!is_mcr && reg.mcr) {
>  		reg.mcr =3D 0;
> -		xe_gt_notice(gt, "xe_reg_sr_entry using MCR register for address 0x%x,=
 forcing non-MCR\n",
> -			     reg.addr);
> +		xe_log_info(gt, RTP, "xe_reg_sr_entry using MCR register for address 0=
x%x, forcing non-MCR\n",
> +			    reg.addr);
>  		reg_sr_inc_error(sr);
>  	}

[Severity: Medium]
The v3 changelog explicitly mentions dropping the config mismatch log, but
this patch updates the mismatch logs in sanitize_mcr() instead. Should these
hunks have been omitted to align with the v3 changelog?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928092114.1610=
203-1-dnyaneshwar.bhadane@intel.com?part=3D6
