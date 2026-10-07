Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2945CA6004
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 21:23:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8021410E517;
	Wed,  7 Oct 2026 21:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SRKW0cs5";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D19F910E517
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Oct 2026 21:23:35 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id A2C2D43DAC;
 Wed,  7 Oct 2026 21:23:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 653021F000FF;
 Wed,  7 Oct 2026 21:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791408215;
 bh=PLu6ja3VfmMjOCv9NzeyY5QBoP6bhW4Ow/u265+aYSM=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=SRKW0cs5nt3HRKRaiJMI9tzJl2HpTRhIUVHbDxbf/iJzHhLzpPmuQDPx+URzKP2Ef
 MV5yUJgUrvgmsQQvXwncE/qZDaFZx/LYfY1EZLmwb5Ov5ArxKZtJ0Gbcs1uf+EZ2+a
 NG297HZJctyCX8BJmYH4FefrI6CE40JchTwWnatVeCSsUNzJ3Zn+lTK+0ystkMNnIm
 yG+/5+oBs7udvyKpUR9lI8dYOVLfERcZjqijqLoEqJWh8HX4Hmu1xKomh+idZPrQV3
 NqOOn+p9WLa77Vf5lfFIKWAFqsJOVfogivDEzJkQcIL21vvycjCHa/oGfFERpfDVyJ
 xRSFkh6gSL7Hg==
Message-ID: <sashiko-outbox-163394@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 06/12] drm/xe/reg_sr: Report save-restore errors
 using structured xe_log API
To: "Dnyaneshwar Bhadane" <dnyaneshwar.bhadane@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261007211417.2093611-7-dnyaneshwar.bhadane@intel.com>
References: <20261007211417.2093611-1-dnyaneshwar.bhadane@intel.com>
 <20261007211417.2093611-7-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 21:23:34 +0000
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
- [Medium] drm/xe: missed replacement of xe_gt_err() in xe_reg_sr_add() err=
or path
--

commit 124cf83eac965648c51da3c76c991dd6be76e259
Author: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

drm/xe/reg_sr: Report save-restore errors using structured xe_log API

Replace xe_gt_notice() and xe_gt_err() calls with xe_log_info() and
xe_log_err() using the RTP and REGS component tags for register
save-restore operations.

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

[Severity: Medium]
Was the xe_gt_err() call in the failure path of xe_reg_sr_add() missed
during this refactoring?

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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007211417.2093=
611-1-dnyaneshwar.bhadane@intel.com?part=3D6
