Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F080606A323
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 16:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LiPCrDRB
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A0510FD99;
	Wed, 25 Nov 2026 16:43:52 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB85110FDA3;
 Wed, 25 Nov 2026 16:43:45 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 69A9840B80;
 Wed, 25 Nov 2026 16:43:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D9B41F000C6;
 Wed, 25 Nov 2026 16:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795625025;
 bh=A9udLbN9//dFN5UhBICMCossv6E2WsFacptmj1hzcMg=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=LiPCrDRBVL+Tg2Q2HmaKrci+oBNtyqYnwRhRvYBhvHtRB/9jJpzMnoqcPiUuZ7GMw
 D0M5Q4fUWFXxy1g5QbIq7SBZw6qL9e1Y+7stXX94TQZdoUJAckdi3y49yA/MdF2nVu
 kjjPg+YQ60M+tP86C+pwbLokOyHYiU/YMr1i1dwOWHdYWDijuAi9NnEHCUWg0xEnYZ
 kaTKnlMIqG95zQJCyA236/u+apdSVgSqya+5HJfEykkjD4ubkJcZA47hxc50HfrM3M
 Olmb3ekxmjw61GvGoyNzZK7Waz5jWmRU29Q2ABcRtcQRo5PNHDfUO6a9Nv3yD8FNcP
 mkTfeLPHoKVcw==
Message-ID: <sashiko-outbox-233772@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/i915/de: Convert mmio.lock to raw spinlock
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261125155831.17395-1-ville.syrjala@linux.intel.com>
References: <20261125155831.17395-1-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 16:43:44 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] drm/i915/vblank: IRQ-unsafe raw_spin_lock() in
  intel_vblank_section_enter()
--

commit 8b5f59599d9077ae92b9dc93f4c4413fb415a8c7
Author: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

drm/i915/de: Convert mmio.lock to raw spinlock

This commit converts display->mmio.lock from a spinlock_t to a
raw_spinlock_t so that display register accesses can be performed from
non-sleepable contexts such as tracepoints on PREEMPT_RT kernels.

> diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/dr=
m/i915/display/intel_vblank.c
> index 114ff43381b53..a9be8d4ad2dfe 100644
> --- a/drivers/gpu/drm/i915/display/intel_vblank.c
> +++ b/drivers/gpu/drm/i915/display/intel_vblank.c
> @@ -290,13 +290,13 @@ static int __intel_get_crtc_scanline(struct intel_c=
rtc *crtc)
>  static void intel_vblank_section_enter(struct intel_display *display)
>  	__acquires(display->mmio.lock)
>  {
> -	spin_lock(&display->mmio.lock);
> +	raw_spin_lock(&display->mmio.lock);
>  }
> =20
>  static void intel_vblank_section_exit(struct intel_display *display)
>  	__releases(display->mmio.lock)
>  {
> -	spin_unlock(&display->mmio.lock);
> +	raw_spin_unlock(&display->mmio.lock);
>  }
>  #else
>  static void intel_vblank_section_enter(struct intel_display *display)

[Severity: High]
Can intel_vblank_section_enter() acquire display->mmio.lock with hardware
interrupts enabled on PREEMPT_RT?

Unlike i915_get_crtc_scanoutpos() and intel_get_crtc_scanline(), which
call local_irq_save() before intel_vblank_section_enter(),
intel_crtc_update_active_timings() only acquires vblank_time_lock:

drivers/gpu/drm/i915/display/intel_vblank.c:intel_crtc_update_active_timing=
s() {
	...
	spin_lock_irqsave(&display->drm->vblank_time_lock, irqflags);
	intel_vblank_section_enter(display);
	...
}

Because vblank_time_lock is a sleeping spinlock_t on PREEMPT_RT,
spin_lock_irqsave() does not disable local interrupts.  Acquiring the raw
display->mmio.lock without masking interrupts triggers a lockdep irq-usage
inversion warning and can self-deadlock if a hardirq or tracepoint on the
same CPU also takes display->mmio.lock.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125155831.1739=
5-1-ville.syrjala@linux.intel.com?part=3D1
