Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F09CF6D3C
	for <intel-xe@archiver.kernel.org>; Wed,  2 Oct 2024 16:25:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9627810E0E7;
	Wed,  2 Oct 2024 16:25:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="Oe9i/uiB";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Pjf08CcE";
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 385ED10E0E7;
 Wed,  2 Oct 2024 16:25:46 +0000 (UTC)
Date: Wed, 2 Oct 2024 18:25:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1727886344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zFdo3CQMWpewcEIaCdKavpOo/VitX3uLCH8wPUOkd3o=;
 b=Oe9i/uiBc0PHFwjsLqJ6hpGaJOij9nF6WsP2b0pPvc0xsMz+lzx4NVnjjxrGIvZ3DyAnxX
 L5RiWfpe8XK+CEkMkeTtNLOzAEb+4dKze7YEMehoOLv2IlvhebblArUe3ErS0h047bDaz2
 BUxpRsZVnCnnC/j5x1piXPsxR8sOjABuifmfJ1BZYto57pSb9z2ms1DKUx5Ew7dj3Mb4y8
 mfw8uqN7I81G8GoURfAuTEpeaIHcwJm2xRvfgPxDDTlF7KIw70TMdk0lShUvqWZ334Ve9U
 PLZQmCwl+Tz6wiaivwDQ+oTy0tLt265wuaXS+FZFItfxds8vkCB5s+86EEiAqw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1727886344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zFdo3CQMWpewcEIaCdKavpOo/VitX3uLCH8wPUOkd3o=;
 b=Pjf08CcEhGwnQCHkCQ3uYFYCAxbutqJCnoYfRdNHMe5n5In04C/D+xpWNYD2syxEHB5pUx
 2wfTXC6yz50x5nAw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH v3 0/8] drm/i915: PREEMPT_RT related fixups.
Message-ID: <20241002162543.TKbd-8g0@linutronix.de>
References: <20240628130601.1772849-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240628130601.1772849-1-bigeasy@linutronix.de>
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

On 2024-06-28 14:57:59 [+0200], To intel-gfx@lists.freedesktop.org wrote:
Hi,

> The following patches are from the PREEMPT_RT queue.  It is mostly about
> disabling interrupts/preemption which leads to problems. Unfortunately
> DRM_I915_LOW_LEVEL_TRACEPOINTS had to be disabled because it acquires locks
> from within trace points. Making the lock a raw_spinlock_t led to higher
> latencies during video playback
>   https://lore.kernel.org/all/20211006164628.s2mtsdd2jdbfyf7g@linutronix.de/
> 
> and I'm not sure if I hit the worse case here.
> I tested it on a SandyBridge with built-in i915 by using X, OpenGL and
> playing videos without noticing any warnings. However, some code paths
> were not entered.
> I carry them for some time now and most issues were reported by other
> people and they reported that things work for them since.

These patches were not picked. Did I forget something or was this just
overseen?

Sebastian
