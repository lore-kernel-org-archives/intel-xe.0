Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58251C79FB7
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 16:34:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1538210F223;
	Wed,  9 Sep 2026 16:34:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gdl/E96f";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 890DB10F21E;
 Wed,  9 Sep 2026 16:34:50 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 4779E42A69;
 Wed,  9 Sep 2026 16:34:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 000EE1F00898;
 Wed,  9 Sep 2026 16:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788971690;
 bh=65NxpK4aAjHY4erwa0huEmvlMddwj01kuPWOjahOQEM=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=gdl/E96fZ5yoOsbocU+eJ0fmdN0EjHb2ryVc+my3+TXRG93x8BcgbWYA0ZR0LOCaU
 HGKzv3TS/qL30b1PrFm+FW1mA67VZ7cbZS2Sppl3Di4BUIE+BBSqdAKi0+73gPIotH
 t/F9YWkOikcVsvC7hVvLIuO1s1BC978dIAcFvAhtooMOqDRe+B/SX8ToKwjcIwDZF0
 e+R/fn/ZqnVHz05GG2MOBdLkLHHNHGBzO32IYrc+t/3ew8xlQoImy7AdPT0fX4+rxt
 lMsFo2+UXyoQLfMDPWIZDMipqb+Tx9lDeNud2kxuma47Nq1wvFHz6ZQE0vRh3XY2fE
 30oCjpvKXzb6A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 12/13] drm/i915/dsb: Add tracepoints for DSB commit
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260909161730.12969-13-ville.syrjala@linux.intel.com>
References: <20260909161730.12969-1-ville.syrjala@linux.intel.com>
 <20260909161730.12969-13-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 16:34:49 +0000
Message-Id: <20260909163450.000EE1F00898@smtp.kernel.org>
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
- [High] Calling `intel_get_crtc_scanline()` inside the tracepoint's `TP_fa=
st_assign` block acquires a sleeping lock while in atomic context, causing =
a kernel panic on PREEMPT_RT.
- [Medium] The `intel_dsb_done` tracepoint is conditionally called only whe=
n a userspace vblank event is present, leading to unbalanced commit/done tr=
ace events for background updates.
--

commit b6804a525207ea31e82f537e553534efcdaa5b8f
Author: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

drm/i915/dsb: Add tracepoints for DSB commit
   =20
This commit adds new tracepoints intel_dsb_commit and intel_dsb_done to tra=
ck
when the display state buffer performs operations on the hardware.

> diff --git a/drivers/gpu/drm/i915/display/intel_display_trace.h b/drivers=
/gpu/drm/i915/display/intel_display_trace.h
> index 504d105935bc0..06cf662931fe3 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_trace.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_trace.h
[ ... ]
> @@ -681,6 +682,56 @@ TRACE_EVENT(intel_fbc_nuke,
>  		      __entry->frame, __entry->scanline)
>  );
> =20
> +TRACE_EVENT(intel_dsb_commit,
> +	    TP_PROTO(struct intel_crtc *crtc, enum intel_dsb_id dsb_id),
> +	    TP_ARGS(crtc, dsb_id),
> +
> +	    TP_STRUCT__entry(
> +			     __string(dev, __dev_name_kms(crtc))
> +			     __field(char, pipe_name)
> +			     __field(u32, dsb_id)
> +			     __field(u32, frame)
> +			     __field(u32, scanline)
> +			     ),
> +
> +	    TP_fast_assign(
> +			   __assign_str(dev);
> +			   __entry->pipe_name =3D pipe_name(crtc->pipe);
> +			   __entry->dsb_id =3D dsb_id;
> +			   __entry->frame =3D intel_crtc_get_vblank_counter(crtc);
> +			   __entry->scanline =3D intel_get_crtc_scanline(crtc);

[Severity: High]
Does calling intel_get_crtc_scanline() from within a TP_fast_assign block
cause issues on preempt-rt kernels?

When this tracepoint is active, TP_fast_assign executes in an atomic
context (RCU read-side critical section with preemption disabled).
intel_get_crtc_scanline() eventually acquires uncore->lock:

intel_get_crtc_scanline()
  intel_vblank_section_enter()
    uncore->lock (spinlock_t)

On preempt-rt, spinlock_t becomes a sleepable rt_mutex, which will cause a
scheduling while atomic panic.

> +			   ),
> +
> +	    TP_printk("dev %s, pipe %c, DSB %d, frame=3D%u, scanline=3D%u",
> +		      __get_str(dev), __entry->pipe_name, __entry->dsb_id,
> +		      __entry->frame, __entry->scanline)
> +);
> +
> +TRACE_EVENT(intel_dsb_done,
> +	    TP_PROTO(struct intel_crtc *crtc, enum intel_dsb_id dsb_id),
> +	    TP_ARGS(crtc, dsb_id),
> +
> +	    TP_STRUCT__entry(
> +			     __string(dev, __dev_name_kms(crtc))
> +			     __field(char, pipe_name)
> +			     __field(u32, dsb_id)
> +			     __field(u32, frame)
> +			     __field(u32, scanline)
> +			     ),
> +
> +	    TP_fast_assign(
> +			   __assign_str(dev);
> +			   __entry->pipe_name =3D pipe_name(crtc->pipe);
> +			   __entry->dsb_id =3D dsb_id;
> +			   __entry->frame =3D intel_crtc_get_vblank_counter(crtc);
> +			   __entry->scanline =3D intel_get_crtc_scanline(crtc);

[Severity: High]
This appears to have the same preempt-rt issue as the intel_dsb_commit
tracepoint where it acquires a sleeping lock while in atomic context.

> +			   ),
> +
> +	    TP_printk("dev %s, pipe %c, DSB %d, frame=3D%u, scanline=3D%u",
> +		      __get_str(dev), __entry->pipe_name, __entry->dsb_id,
> +		      __entry->frame, __entry->scanline)
> +);
> +
[ ... ]
> diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i=
915/display/intel_dsb.c
> index 8e01e1eed291e..299d778520a22 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsb.c
> +++ b/drivers/gpu/drm/i915/display/intel_dsb.c
[ ... ]
> @@ -1124,6 +1127,8 @@ void intel_dsb_irq_handler(struct intel_display *di=
splay,
>  		spin_lock(&display->drm->event_lock);
> =20
>  		if (crtc->dsb_event) {
> +			trace_intel_dsb_done(crtc, dsb_id);
> +

[Severity: Medium]
Will this lead to unbalanced commit/done trace events for background update=
s?

The trace_intel_dsb_done() tracepoint is conditionally called only when a
userspace vblank event is present. If a commit completes in hardware
without an associated vblank event, the irq handler will skip emitting the
completion tracepoint.

>  			/*
>  			 * Update vblank counter/timestamp in case it
>  			 * hasn't been done yet for this frame.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909161730.1296=
9-1-ville.syrjala@linux.intel.com?part=3D12
