Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0004C5B572
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 14:37:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D7AA10F382;
	Thu, 13 Aug 2026 14:37:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="J6SMIma8";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A51E10F382
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 14:37:12 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id B95B661884;
 Thu, 13 Aug 2026 14:37:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50E831F000E9;
 Thu, 13 Aug 2026 14:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786631822;
 bh=K1UiRLqBNq3NPpBJNphROZ2rMeX6CzbdUM5WSmYeHLQ=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=J6SMIma8PqwRXerTB1a1r6wbIsBe7xhPn8lpfa5TdUYGgliq1F7FUl0uvWBZvcCm0
 cHhv7yjvhVyz7xnrEhD7ZutsqhInci1XgCPZQ/fgszTj+qaVxvvlnGpCcJLK2KtrUc
 7RmhIPMmtu7s6Gw9HbXyJlaGYqtk7OaSx6VDvYQ+0vmAze9qVweK7yn6JFhmXWGAsB
 iNHFv3W6rwu6cFa3Cx/lySlmq6T2pxbam8onTMiSVGV+hKVhNkTWry/JHXRbaDlbwb
 DBNpdwwRxk2VLUtVHlLlTPrD7MDpDfb/aeJ30YyvWRy8DSPGvh3P52wC/YYXvqjUp0
 1RS2/pob1EXZw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/6] drm/xe: capture L3 node status registers in
 devcoredump
To: "Nareshkumar Gollakoti" <naresh.kumar.g@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260813133037.2912699-7-naresh.kumar.g@intel.com>
References: <20260813133037.2912699-1-naresh.kumar.g@intel.com>
 <20260813133037.2912699-7-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 14:37:01 +0000
Message-Id: <20260813143702.50E831F000E9@smtp.kernel.org>
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
- [High] Capturing MCR registers in the devcoredump snapshot triggers a ker=
nel assertion failure (BUG/WARN) when executed in an SR-IOV Virtual Functio=
n (VF) environment.
- [Medium] MCR registers are incorrectly defined as regular `XE_REG` instea=
d of `XE_REG_MCR`, bypassing the subsystem's compile-time type safety.
--

--- Patch [6]: [PATCH 6/6] drm/xe: capture L3 node status registers in devc=
oredump ---
commit a45fb5f7ed9065191b925af139e27c7fca72cb39
Author: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>

drm/xe: capture L3 node status registers in devcoredump

This commit adds L3_NODE_IDLE and L3STAT_LBCF_GFX register definitions
and includes them in the devcoredump node status section. It also
extends the register descriptor to mark MCR registers, allowing the
snapshot code to read them using xe_gt_mcr_unicast_read_any().

> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/re=
gs/xe_gt_regs.h
> index 8c55d766a5a63..fdd0817919617 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -430,6 +430,9 @@
>  #define   L3_ESC_MASK				REG_BIT(0)
>  #define   L3_ESC(value)				REG_FIELD_PREP(L3_ESC_MASK, value)
> =20
> +#define L3_NODE_IDLE				XE_REG(0xb0b0)
> +#define L3STAT_LBCF_GFX				XE_REG(0xb128)
> +

[Severity: Medium]
Should these registers be defined using XE_REG_MCR instead of XE_REG?

Defining them with XE_REG bypasses the compile-time type safety intended
for multicast/replicated registers.

>  #define XEHP_L3NODEARBCFG			XE_REG_MCR(0xb0b4)
>  #define   XEHP_LNESPARE				REG_BIT(19)

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_=
devcoredump.c
> index 6cc4e3969417e..ab8cd7d589646 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c

[ ... ]

> @@ -83,6 +84,8 @@ struct xe_reg_desc {
>  	struct xe_reg reg;
>  	/** @name: Name of the register */
>  	const char *name;
> +	/** @mcr: mcr type registers */
> +	bool mcr;
>  };

[Severity: Medium]
Does adding this boolean flag subvert the existing type safety architecture?

The struct xe_reg already contains an mcr bitfield which is automatically
populated when registers are correctly defined with XE_REG_MCR. Adding a
separate flag forces the code to manually cast the address back into an MCR
register at runtime, losing the intended compiler type checks.

[ ... ]

> @@ -156,7 +164,12 @@ xe_capture_reg_desc_list(struct xe_gt *gt,
> =20
>  	for (i =3D 0; i < count; i++) {
>  		dst[i].reg =3D src[i].reg;
> -		dst[i].value =3D xe_mmio_read32(&gt->mmio, src[i].reg);
> +		if (src[i].mcr)
> +			dst[i].value =3D xe_gt_mcr_unicast_read_any(gt,
> +								  XE_REG_MCR
> +								  (src[i].reg.addr));
> +		else
> +			dst[i].value =3D xe_mmio_read32(&gt->mmio, src[i].reg);
>  		dst[i].name =3D src[i].name;
>  	}
>  }

[Severity: High]
Can this path trigger a kernel assertion failure in an SR-IOV Virtual Funct=
ion
environment?

Looking at xe_gt_mcr_unicast_read_any, it contains an explicit guard against
execution in a VF:

xe_gt_mcr_unicast_read_any(struct xe_gt *gt, struct xe_reg_mcr reg_mcr)
{
    ...
    xe_gt_assert(gt, !IS_SRIOV_VF(gt_to_xe(gt)));
    ...
}

Because devcoredumps can be triggered by unprivileged VF workloads causing a
GPU hang, executing this read could lead to unauthorized attempts to access
privileged steering registers, potentially causing MMIO timeouts and undefi=
ned
driver behavior.

[ ... ]

> @@ -266,6 +279,19 @@ static struct xe_dbg_reg_snapshot *xe_gam_pf_report_=
capture(struct xe_gt *gt)
>  	return xe_dbg_reg_snapshot_capture(gt, &reg_list);
>  }
> =20
> +static struct xe_dbg_reg_snapshot *xe_node_status_capture(struct xe_gt *=
gt)
> +{
> +	struct xe_reg_desc_list reg_list;
> +
> +	if (!xe_dbg_reg_snapshot_is_supported(gt_to_xe(gt)))
> +		return NULL;
> +
> +	reg_list.regs =3D xe3p_l3_node_reglist;
> +	reg_list.num_regs =3D ARRAY_SIZE(xe3p_l3_node_reglist);
> +
> +	return xe_dbg_reg_snapshot_capture(gt, &reg_list);
> +}

[Severity: High]
Should this capture function include an early return guard for VFs?

Since capturing MCR registers is a PF-only operation, omitting an
IS_SRIOV_VF check here allows the snapshot code to unconditionally attempt
MCR reads, leading to the assertion failure mentioned above.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813133037.2912=
699-1-naresh.kumar.g@intel.com?part=3D6
