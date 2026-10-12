Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0FFCA9ED1
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 05:28:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B49010E220;
	Mon, 12 Oct 2026 05:28:52 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D9810E367
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 05:28:45 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 9B8C242DBA;
 Mon, 12 Oct 2026 05:28:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D4011F0089B;
 Mon, 12 Oct 2026 05:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791782925;
 bh=EfXAc+o5fXLLHDxzU7oYxcoXZXD63MikZUbeF3n59/A=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Jaa0ayhhSX7gFsFgj3xNG6y7cXzBmJ+ls9YtC4ro5zAhrhXMCdih3CDWTSIt4ujCG
 k1HlQdSHEqxSb6jEuRUWSvriKzITfW6cmhlZNzBSSn0Xb04CtE24IAtDQDFy23Yp94
 dpDV0ikHK6HusUc7I4hU/anj1V+2vuTjEYgaFXhcuURUiS5SY18ucZL5TwDBV+VHPg
 GXGTCwGjXzjSPDC9FhXWoosZJfLnV6IU5fqb1NWmHSXUYGXsRWNIi4zCSRNpPVww/J
 +zZVwC1IDuXLxmc/30FUGraE188bAfF3vaDNVTyoD48aJGXKYK2II/NXNoZsXI5F/O
 xuhd5R0fdAuGg==
Message-ID: <sashiko-outbox-167666@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 06/12] drm/xe/reg_sr: Report save-restore errors
 using structured xe_log API
To: "Dnyaneshwar Bhadane" <dnyaneshwar.bhadane@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261012051823.2201360-7-dnyaneshwar.bhadane@intel.com>
References: <20261012051823.2201360-1-dnyaneshwar.bhadane@intel.com>
 <20261012051823.2201360-7-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 05:28:44 +0000
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
- [Medium] drm/xe: incomplete refactoring missing xe_gt_err() replacement i=
n xe_reg_sr_add
--

commit 81903de8af1b2d3214fd6a5c1628dc2db69e9354
Author: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

drm/xe/reg_sr: Report save-restore errors using structured xe_log API

This commit replaces xe_gt_notice() and xe_gt_err() calls with xe_log_info()
and xe_log_err() for register save-restore operations.

> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_s=
r.c
> index e328f50725572..eab84a528d122 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c

[ ... ]

> @@ -219,7 +220,7 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struc=
t xe_gt *gt)
> =20
>  	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>  	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
> -		xe_gt_err(gt, "Failed to apply, err=3D-ETIMEDOUT\n");
> +		xe_log_err(gt, REGS, -ETIMEDOUT, "Failed to apply\n");
>  		return;
>  	}
> =20

[Severity: Medium]
Does this commit miss replacing the xe_gt_err() call in xe_reg_sr_add()?

If xe_reg_sr_add() fails (e.g., due to an incompatible entry or memory
allocation failure), it still calls the legacy macro instead of the new
xe_log_err() API:

drivers/gpu/drm/xe/xe_reg_sr.c:xe_reg_sr_add() {
    ...
fail:
	xe_gt_err(gt,
		  "discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s,=
 mcr: %s): ret=3D%d\n",
		  idx, e->clr_bits, e->set_bits,
		  str_yes_no(e->reg.masked),
		  str_yes_no(e->reg.mcr),
		  ret);
	reg_sr_inc_error(sr);

	return ret;
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012051823.2201=
360-1-dnyaneshwar.bhadane@intel.com?part=3D6
