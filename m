Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E8EC79FBF
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 17:31:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05FBB10E157;
	Thu, 10 Sep 2026 17:31:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JPsYzORr";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6693A10E157
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 17:31:53 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 3386E437BC;
 Thu, 10 Sep 2026 17:31:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1BBB1F00893;
 Thu, 10 Sep 2026 17:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789061513;
 bh=/3tuB0bHzlEd6LmsFg6Ay48Ecwl+JwtTiI5ZmDO1INY=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=JPsYzORr1YdsA0FeNCch5gat0DxvTAb5Qt5AU1QJVdA/wNnUY90f7a6EJiIFzX2vn
 aoUn3s2V4K6+e4l1i8GxHO7iY/74ZTukMu+kOEPW9vb5obqOA3IMQT4cRQF0e8bkIL
 6+I2A93EUvwDnWA9LPOhu/ZZLCVRLRMmd/lT1ZPXVCsPR2reOaC42MOD0nVxYFplsB
 gOFTFizEsDRG+JtGHWmKxqI3OAI3WWkbizonl9UGT0QKZqJkxxwCLi8sqxiy7TiYr2
 gZv9xhFr8nps0/VCWdQ6iW5J3Lf7zWANVxKihduRLdQXsNvzwKvVOg+liDVm3ugYJO
 lEF/AFX35TPiw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] drm/xe/debugfs: Expose per-engine idle status
To: "Sk Anirban" <sk.anirban@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260910165855.1124574-2-sk.anirban@intel.com>
References: <20260910165855.1124574-2-sk.anirban@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 17:31:52 +0000
Message-Id: <20260910173152.E1BBB1F00893@smtp.kernel.org>
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
- [Medium] Incorrect forcewake request status extraction due to missing val=
idity mask.

Pre-existing issues:
- [High] Lockless linked list corruption and data race on singleton `devcor=
edump->snapshot.matched_node`.
--

commit c7dd6ed41cdd66751c9be14d4fb0545f7cd9337b
Author: Sk Anirban <sk.anirban@intel.com>

drm/xe/debugfs: Expose per-engine idle status

This commit extends the hw_engines debugfs to iterate over hardware engines
and dump their idle state, including whether the engine pipe is idle or bus=
y,
if C6 entry is allowed, and the forcewake request status.

> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_g=
t_debugfs.c
> index bb09e70ee44c0..405cc076d8431 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
[ ... ]
> @@ -126,9 +158,27 @@ static int hw_engines(struct xe_gt *gt, struct drm_p=
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
This is a pre-existing issue, but does exposing this in the hw_engines
debugfs risk triggering a lockless list corruption or data race?

Multiple concurrent reads to the hw_engines debugfs file will call into
xe_hw_engine_print(), which can eventually call xe_engine_manual_capture():

xe_hw_engine_print()
  ...
  -> xe_engine_manual_capture()
       -> guc_capture_get_prealloc_node()
          list_del() // on cachelist locklessly

xe_engine_manual_capture() also locklessly mutates outlist and overwrites
the shared devcoredump->snapshot.matched_node without synchronization:

    guc_capture_add_node_to_outlist(guc->capture, new);
    devcoredump->snapshot.matched_node =3D new;

Could this lead to a kernel panic via linked list corruption or
use-after-free if userspace reads this debugfs file concurrently?

> =20
> +		val =3D xe_mmio_read32(&gt->mmio, reg);
> +
> +		if (msg_idle_reg[id].has_fw)
> +			drm_printf(p, "\tpipe %s, C6 %s, fw_req 0x%02x\n",
> +				   val & MSG_IDLE_INDICATION ? "idle" : "busy",
> +				   val & MSG_IDLE_C6_ALLOWED ? "allowed" : "not allowed",
> +				   REG_FIELD_GET(MSG_IDLE_FW_REQ, val));

[Severity: Medium]
Does this correctly extract the forcewake request status without applying
the required hardware validity mask?

The hardware uses the upper 16 bits of the register as validity indicators
for the lower bits. Ignoring them and directly reading the MSG_IDLE_FW_REQ
field (bits 13:9) might result in reading potentially garbage or stale stat=
e.

Should this check the upper 16-bit validity mask (bits 29:25) before
extracting the lower bits for the debugfs output?

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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910165855.1124=
574-2-sk.anirban@intel.com?part=3D1
