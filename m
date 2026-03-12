Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E95105A589
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 11:38:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D36D510E9C3;
	Thu, 12 Mar 2026 11:38:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="17B65fO7";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IkMuyfzB";
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E84010E99F;
 Thu, 12 Mar 2026 11:38:28 +0000 (UTC)
Date: Thu, 12 Mar 2026 12:38:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1773315507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sB9f65l5Jdk60CA8NP/HMhEsJuKB0SLGppnHfM+zPPA=;
 b=17B65fO7eBCkHO7c1hV7kbrDauYuuvjqqjOsLHYUJ0LPI9lyMmYhBi+VAVCueu8bnLi0cj
 NuluPiyQi0zWQzOGNyVpCJCIVhOzvsIhqfIclLOX8lj4OxEQ/AbaMYUCx8zSsAPLesoy66
 uUwDtXObj1wKztMUruaWhFKOQ/40tP4ppoZCN24HyahjiWcNghpG1tOr6WnI/7BGvQV7yO
 Q/FjTM44JEPtBFe9BG2W8L6rwBEHr32x51zQj8qbqQUwDIlitTHeHalPVRVCECf1/e5AQN
 xvWVK75jp7CsmOgfrtO4jHkFhwtbx+T/jXMY/JbHOv6rfI5seHOnF+T4xuI+eg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1773315507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sB9f65l5Jdk60CA8NP/HMhEsJuKB0SLGppnHfM+zPPA=;
 b=IkMuyfzB5BNycFWjmQhXhqTGrxWlQqS4Z3J75y6pZizUakywKc/Bu7LTH2j+3DlWPOnPHA
 EXncDoZTD9LFXuAA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v7 26/26] drm/i915/gt: Add a spinlock to prevent
 starvation of irq_work.
Message-ID: <20260312113825.FuNFq5CM@linutronix.de>
References: <20260310115709.2276203-1-dev@lankhorst.se>
 <20260310115709.2276203-27-dev@lankhorst.se>
 <20260310172214.4lEOgGOl@linutronix.de>
 <7774bff2-e101-4e59-9cfb-9f200e1caef9@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7774bff2-e101-4e59-9cfb-9f200e1caef9@lankhorst.se>
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

On 2026-03-10 20:03:14 [+0100], Maarten Lankhorst wrote:
> Hey,
Hi,

> Den 2026-03-10 kl. 18:22, skrev Sebastian Andrzej Siewior:
> > On 2026-03-10 12:57:08 [+0100], Maarten Lankhorst wrote:
> >> --- a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
> >> +++ b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
> >> @@ -487,8 +490,11 @@ void intel_context_remove_breadcrumbs(struct intel_context *ce,
> >>  	if (release)
> >>  		intel_context_put(ce);
> >>  
> >> -	while (atomic_read(&b->signaler_active))
> >> +	while (atomic_read(&b->signaler_active)) {
> >> +		spin_lock(&b->signaler_active_sync);
> >> +		spin_unlock(&b->signaler_active_sync);
> >>  		cpu_relax();
> > 
> > Forgot to mention: This is fine on PREEMPT_RT but on !RT you might need
> > 
> >                spin_lock_irqsave(&b->signaler_active_sync, flags);
> >                spin_unlock_irqrestore(&b->signaler_active_sync, flags);
> > 
> > if the function can be called from !IRQ context which might be the case
> > due to the irqsave() earlier in this function.
> Yeah seems a bit of an oversight. I'll change it to use flags.
> 
> Is it correct to assume that irq_work disables interrupts on !RT?

Yes. It runs either directly as an interrupt or gets kicked from the
timer interrupt. Either way, interrupts are always disabled. Only on RT
interrupts are enabled unless the IRQ-work has been explicitly requested
to be run in interrupt context.

> Kind regards,
> ~Maarten Lankhorst

Sebastian
