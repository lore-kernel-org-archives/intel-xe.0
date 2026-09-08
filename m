Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C71EDC79F99
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 06:29:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7482710E08F;
	Tue,  8 Sep 2026 06:29:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ymr0CEqF";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B51710E08F
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 06:29:54 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 96EF7601F9;
 Tue,  8 Sep 2026 06:29:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24D2E1F00A3A;
 Tue,  8 Sep 2026 06:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788848993;
 bh=xmx9yTV+TeB5KYCYue+PM7kTPD1T1YurhfkthrG93HQ=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Ymr0CEqF2Gnmk7Wf9MWNTNzzS0C7XmGgoMklr7pt3kkWdPu+KfodeoEWvftukMmwd
 VeXSXv7bSdWo8nRoskQpmW1vaXFWhoCtdVSsyjLI00/jb5EP0st7dK4bB/B9QOwkCo
 L6RIs4LosHPqi+g6RA4bkXeH2/EpePukgoQ+NqoG8jLdr5pnAEUOg7Z+1WUqvzGA09
 Dwgqx2FS8nS1ef1UZB3DJpscIQDzBZn7oWq+/h+2E4FuJeMU243pGA2P2Rmwpxr+We
 52gnDKz/rQtrGEYLJf7U9fSbpIq6ZfYwIu1FBBD2+te2ptdawOISV/M5z031QQecNm
 H/mfNyuhNcrPg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] drm/xe/debugfs: Expose per-engine idle status
To: "Sk Anirban" <sk.anirban@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260908060103.999079-2-sk.anirban@intel.com>
References: <20260908060103.999079-2-sk.anirban@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 06:29:52 +0000
Message-Id: <20260908062953.24D2E1F00A3A@smtp.kernel.org>
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

New issues:
- [Medium] Debugfs output misinterprets fw_req status by ignoring validity =
mask bits in MSG_IDLE registers.

Pre-existing issues:
- [High] Concurrent execution of `hw_engines` debugfs read corrupts the glo=
bal device coredump state `devcoredump->snapshot.matched_node`.
--

commit d11426316eb2739da991f6532a22c6e266b48954
Author: Sk Anirban <sk.anirban@intel.com>

drm/xe/debugfs: Expose per-engine idle status
   =20
Extend the existing "hw_engines" debugfs to iterate over all hardware
engines and dump their idle state: whether the engine pipe is idle or
busy, whether C6 entry is allowed, and (where available) the forcewake
request status.

> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_g=
t_debugfs.c
> index 361a70234d1f1..27ee20b03d4ae 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
[ ... ]
> @@ -124,9 +156,27 @@ static int hw_engines(struct xe_gt *gt, struct drm_p=
rinter *p)
>  	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL))
>  		return -ETIMEDOUT;
> =20
> -	for_each_hw_engine(hwe, gt, id)
> +	for_each_hw_engine(hwe, gt, id) {
> +		struct xe_reg reg =3D msg_idle_reg[id].reg;
> +		u32 val;
> +
>  		xe_hw_engine_print(hwe, p);

[Severity: High]
This isn't a bug introduced by this patch, but can this debugfs read corrupt
the global device coredump state?

When hw_engines() calls xe_hw_engine_print(), it captures an engine
snapshot via xe_engine_manual_capture(). This unconditionally assigns
devcoredump->snapshot.matched_node =3D new globally without taking the
&devcoredump->lock.

Afterward, it calls xe_hw_engine_snapshot_free(), which explicitly frees
devcoredump->snapshot.matched_node and nullifies it. If a legitimate GPU
hang triggers xe_devcoredump() concurrently, could its matched_node be
overwritten or freed out from under it?

> +		val =3D xe_mmio_read32(&gt->mmio, reg);
> +
> +		if (msg_idle_reg[id].has_fw)
> +			drm_printf(p, "\tpipe %s, C6 %s, fw_req 0x%02x\n",
> +				   val & MSG_IDLE_INDICATION ? "idle" : "busy",
> +				   val & MSG_IDLE_C6_ALLOWED ? "allowed" : "not allowed",
> +				   REG_FIELD_GET(MSG_IDLE_FW_STATUS, val));

[Severity: Medium]
Does this field extraction read stale data by ignoring the validity mask?

The MSG_IDLE registers extract the forcewake status bits [13:9] using
REG_FIELD_GET(MSG_IDLE_FW_STATUS, val). However, the hardware design uses
bits [29:25] (val >> 16) as a validity mask for these status bits.

Without validating the status against its corresponding mask bit, could the
output reflect stale or invalid data left over in the register?

> +		else
> +			drm_printf(p, "\tpipe %s, C6 %s\n",
> +				   val & MSG_IDLE_INDICATION ? "idle" : "busy",
> +				   val & MSG_IDLE_C6_ALLOWED ? "allowed" : "not allowed");
> +
> +		drm_puts(p, "\n");
> +	}
> +
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908060103.9990=
79-2-sk.anirban@intel.com?part=3D1
