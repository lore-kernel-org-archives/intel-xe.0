Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 108FAFD4F07
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 17:22:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B7F10E2C0;
	Tue, 10 Mar 2026 17:22:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="iqGPIKV8";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Cr2cC6vq";
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0240E10E102;
 Tue, 10 Mar 2026 17:22:17 +0000 (UTC)
Date: Tue, 10 Mar 2026 18:22:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1773163335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9rlAkP9P0KSXMmYUb0eCXaD1B1J7ht0IpfsTAmtgL2s=;
 b=iqGPIKV8oPnaqVCpIEIk5Ch7i1C4F+RTKXmRTSTNMclVMVqVVUeOaRfiE1IpLqdT1W/I1h
 JDJjFtNSaLd0+D0jZnDO/gd8FHTWS/xIS0VS9R1+RIKElGFrYfJ8WM8gk0p744XNFpSFub
 hzT/tPLmAgPageLzekOONQgZ5f76A0RHgPDfyxvuGqnoRnnQG1OQ5xlNgj2lmVh2Jy+ZjR
 OC3yZW565aBY2MHuV5PYhm4ty12+3U6JePXNcobzm7iBK10P6XcdNztvBmYed1ouKdf65y
 XmPGqEbkTe/XkOVvXeyLFKbUbQKpN2CLUHDslfnFh8zgpeQLyXsZeyERy9ApdQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1773163335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9rlAkP9P0KSXMmYUb0eCXaD1B1J7ht0IpfsTAmtgL2s=;
 b=Cr2cC6vqPelEfqCo//LcJpkop1erzRAM3ghNceX30wXEJ6OFAdKzBNxuZREk3pEP0haEVV
 VV6eL4aQ9Py86SDQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v7 26/26] drm/i915/gt: Add a spinlock to prevent
 starvation of irq_work.
Message-ID: <20260310172214.4lEOgGOl@linutronix.de>
References: <20260310115709.2276203-1-dev@lankhorst.se>
 <20260310115709.2276203-27-dev@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260310115709.2276203-27-dev@lankhorst.se>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 2026-03-10 12:57:08 [+0100], Maarten Lankhorst wrote:
> --- a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
> @@ -487,8 +490,11 @@ void intel_context_remove_breadcrumbs(struct intel_context *ce,
>  	if (release)
>  		intel_context_put(ce);
>  
> -	while (atomic_read(&b->signaler_active))
> +	while (atomic_read(&b->signaler_active)) {
> +		spin_lock(&b->signaler_active_sync);
> +		spin_unlock(&b->signaler_active_sync);
>  		cpu_relax();

Forgot to mention: This is fine on PREEMPT_RT but on !RT you might need

               spin_lock_irqsave(&b->signaler_active_sync, flags);
               spin_unlock_irqrestore(&b->signaler_active_sync, flags);

if the function can be called from !IRQ context which might be the case
due to the irqsave() earlier in this function.

> +	}
>  }

Sebastian
