Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730C9FD45E8
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 20:06:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31B8C10E82F;
	Wed, 25 Feb 2026 20:06:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="KLcHkTGB";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E9DB10E827;
 Wed, 25 Feb 2026 20:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1772049966;
 bh=m0jI+91ZfLMP+Bf2OhJVOZYQ73gUlZTgUnjRJsTmi04=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KLcHkTGBMUGND86ai4aFWFeAjsLPti++nW7JDWlKH+BQNsiodRppa8+u0WdJZ0+l8
 bGko4om0ckOPqghTw7mAYTihVNP4aNHyfdLD5nEPI5+F3cqVZfSvTkAs8xcGlw5J7a
 plExoI4dFGc1uKlUL1d8r3LcXGPoNydB06w+QV9vMp/R+ui/tLvVvWrh8x4m4ksfYO
 de9JHs66rjkPRcFygnfusWlMwpkBQx1Xx9uRcF5/xS8BkcjVl0yhwEHfNXvEiR2VkL
 moKlYzmi4WY2zDPO3z0yRKaFtCcw3JgAnylFUERYYh8y9VGjPWbx5zMAADJ1wAELpI
 HW5uMgTVwflfg==
Message-ID: <7ee8b784-a714-4329-aab2-a571f25c3baa@lankhorst.se>
Date: Wed, 25 Feb 2026 21:06:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i915-rt v6 00/24] drm/i915/display: All patches to make
 PREEMPT_RT work on i915 + xe.
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-rt-devel@lists.linux.dev, dri-devel@lists.freedesktop.org
References: <20260220083657.28815-26-dev@lankhorst.se>
 <20260224162703.Q_taYjEC@linutronix.de>
 <20260224165903.2mn24oQy@linutronix.de>
 <20260225075806.XNtXjZ5E@linutronix.de>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <20260225075806.XNtXjZ5E@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hey,

Den 2026-02-25 kl. 08:58, skrev Sebastian Andrzej Siewior:
> On 2026-02-24 17:59:04 [+0100], To Maarten Lankhorst wrote:
> …
>> This one I can reproduce while opening a browser and surfing a bit. Let
>> me try step by step without lockdep, without RT and maybe just play
>> v7.0-rc1 to figure out where this is from…
> 
> It triggers without lockdep but takes longer. It does not trigger
> without RT so far. I will try to narrow it down later unless it is
> obvious where this is coming from.
>  
> Sebastian

After realizing the uncore lock only needed to be converted to a raw spinlock
because the testcase was broken, I tested the alternative fix of using
sleeping context only in the selftests:
https://patchwork.freedesktop.org/patch/707063/?series=162145&rev=1

With that the reset selftest works as expected.

But I do see some weird lockdep splats and aborts after that fixed the uncore lock testcases:
https://patchwork.freedesktop.org/series/162145/

I believe it could be a different instance of:
https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162145v1/bat-dg2-9/igt@gem_lmem_swapping@parallel-random-engines.html#dmesg-warnings904

Which is tracked under:

https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15759

Perhaps those are related to what you are seeing?

Also don't use that series for anything but CI results, I rather want to submit
a new version of this series.

Kind regards,
~Maarten Lankhorst
