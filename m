Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9438E9B26C
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 14:15:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 476F910E58E;
	Tue, 24 Feb 2026 14:15:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="O+8vHw3G";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SmxFH0D4";
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2156410E300;
 Tue, 24 Feb 2026 14:15:46 +0000 (UTC)
Date: Tue, 24 Feb 2026 15:15:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1771942544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dNjYeM6hGv29WKg9kWtLMN+jylLCTcklCbR6s8aADa4=;
 b=O+8vHw3Gs8uRydlSqYfu9x2XLKlANTrfVM1Q/H2ZyTV0vrs2DFan+nNsqofOL/LmqJLXAM
 1yrRFVImChO6kNDkVxwLhXmAusOaNjJk7wFN7OE2S/puHKCYWb+zEK/WbqLbDYBVjPSR7L
 o1J7QLgzh+I5kObHcEtTkbA7+hLxNxLzKzDH9+4HdqUSDFF/n6r/mYgW+2hMKxtmDcPgub
 uSyTiNRkalGS0CzzSY6aKt1m6ziaZi61jFYUEnknUNOga0nPq4NwepUacda4KX+MoJzHQK
 fhjj6XhabvPIWaejFSv/ctdH3rfDO5t4qCdKXX/NPDfaJaXKHUqDwz9hjdV4Xg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1771942544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dNjYeM6hGv29WKg9kWtLMN+jylLCTcklCbR6s8aADa4=;
 b=SmxFH0D4T4i5DkM1Skr6VX9HCGXcn+1/b1CcRsM9dVfwNt/7OU9p0T4SyCv7c7Skdedqcj
 Grq9uKXvgF4VRTBg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-rt-devel@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [i915-rt v6 24/24] FOR-CI: bump MAX_STACK_TRACE_ENTRIES
Message-ID: <20260224141542.cDL_xEWb@linutronix.de>
References: <20260220083657.28815-26-dev@lankhorst.se>
 <20260220083657.28815-50-dev@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260220083657.28815-50-dev@lankhorst.se>
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

On 2026-02-20 09:37:22 [+0100], Maarten Lankhorst wrote:
> We're hitting a bug in CI where MAX_STACK_TRACE_ENTRIES is set too low.
> My guess is the repeated loading/unloading is creating multiples of the
> same entries. As a hack just reset lockdep. This might only be necessary
> for CI + PREEMPT_RT.

spinlock_t on PREEMPT_RT uses the rtmutex which from lockdep's point of
view counts twice: The "logical" lock and the inner wait lock. That
makes twice as many locks. I hope it is this and not some accounting
error=E2=80=A6

> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

Sebastian
