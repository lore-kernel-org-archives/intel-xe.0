Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA9F9105A58D
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 11:35:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5FDC10E9C3;
	Thu, 12 Mar 2026 11:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="S+A6If4D";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VJbIvelA";
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C0DE10E9B9;
 Thu, 12 Mar 2026 11:35:11 +0000 (UTC)
Date: Thu, 12 Mar 2026 12:35:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1773315309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kxPKAMMGsnIniCCQt8FVuGGitmXq9bLkHDjrWLMUJAw=;
 b=S+A6If4DTvg87flcqA89S8NUl+xLGvUjrwokJWONA85exMcv2ZPhwpEtfTfNNNdj2WrI3+
 nuK9hSq6ByN+EHOeXYeaTClYCh2etkRFUDPOwAhydShTaCVSBmLkgRDHqMeT+a0007+/9x
 gnuq41BoZFUwkx+LCUsdCLnjOvAIFvYkP91J+taxumTBBLdzaiS+3HBD8HTeE+s1rIeYO7
 GLh8xp06Nj0xB2WHwhTEDbhBMkXVcZoxAbfIV83p3D7ONY1FAfp0KM+H6IZA4n5YiOSzTE
 VjlsAJQMSzxevUVBovVQFvJ4Hzdt8DzahOC4OlRA7wLHm6HIaf/fMfXFmPxgzA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1773315309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kxPKAMMGsnIniCCQt8FVuGGitmXq9bLkHDjrWLMUJAw=;
 b=VJbIvelAe2aJGHIUDjIDVI679lnZOcmR49ej+4vnv3t0QMZwohNoHLwx/+itzUt4eSYOAY
 NiFrbEc+OwApxSCg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v7 26/26] drm/i915/gt: Add a spinlock to prevent
 starvation of irq_work.
Message-ID: <20260312113508.y_l5voIx@linutronix.de>
References: <20260310115709.2276203-1-dev@lankhorst.se>
 <20260310115709.2276203-27-dev@lankhorst.se>
 <20260310170413.5rCjlTce@linutronix.de>
 <64617f61-6c91-4739-a545-b0109f8dc87e@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <64617f61-6c91-4739-a545-b0109f8dc87e@lankhorst.se>
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

On 2026-03-10 19:14:18 [+0100], Maarten Lankhorst wrote:
> Hey,
Hi,

>=20
> Otherwise things are looking good! Have you uncovered anything else?

I would swap the ordering 23 <-> 26 in
| =E2=94=9C=E2=94=80>[PATCH v7 23/26] Revert "drm/i915: Depend on !PREEMPT_=
RT."
| =E2=94=9C=E2=94=80>[PATCH v7 26/26] drm/i915/gt: Add a spinlock to preven=
t starvation of irq_work.

but other than that it all looks good. I tested it by using it on my two
boxes with i915 compatible hw and didn't notice anything.
I've been using -next + this series.

> Kind regards,
> ~Maarten Lankhorst

Sebastian
