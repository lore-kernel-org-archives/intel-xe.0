Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11640FD3749
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 12:33:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B4B10E76E;
	Wed, 25 Feb 2026 12:33:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="F4V3LuGj";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6817210E76C;
 Wed, 25 Feb 2026 12:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1772022779;
 bh=JMqJdyv/tZPCdVSQBG9OTpQD8Nys7penXlEHC3gj99E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=F4V3LuGj9CGfwWjhAM/mbQsGlLtMt+t0S4Tk+NuwcKwsheVE8sv05fXOQ0RveS8LE
 oiRaIwgdPjxI/lKK+0Bw03W1Xj/KoI2Ty2ADmkjA95lJLnnAxzhhJfAtDsQtP9y7yW
 geXx+pgB5ZOmaIe2PHgLjRw9mCMsnRXMxppYTBRlRumPSDhuDLslxhOv3iYrJX2SIp
 jXlC9a7la+IEkfH/ZG6WjZ1OysBEXRfwAhzs2J/7immrXb/nCwb4KDncNtuvoV4nlw
 BCikZPMBt6SnayrsrL2TVEbsJ3rbhQEQeI8wcUPzYstcZ1DZaJ9JHfSmkYLk2+9y3f
 c/7yH1fXaHR1g==
Message-ID: <4aac9ace-4529-45b3-9ac6-065d7415699a@lankhorst.se>
Date: Wed, 25 Feb 2026 13:32:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i915-rt v6 24/24] FOR-CI: bump MAX_STACK_TRACE_ENTRIES
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-rt-devel@lists.linux.dev, dri-devel@lists.freedesktop.org
References: <20260220083657.28815-26-dev@lankhorst.se>
 <20260220083657.28815-50-dev@lankhorst.se>
 <20260224141542.cDL_xEWb@linutronix.de>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <20260224141542.cDL_xEWb@linutronix.de>
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

Den 2026-02-24 kl. 15:15, skrev Sebastian Andrzej Siewior:
> On 2026-02-20 09:37:22 [+0100], Maarten Lankhorst wrote:
>> We're hitting a bug in CI where MAX_STACK_TRACE_ENTRIES is set too low.
>> My guess is the repeated loading/unloading is creating multiples of the
>> same entries. As a hack just reset lockdep. This might only be necessary
>> for CI + PREEMPT_RT.
> 
> spinlock_t on PREEMPT_RT uses the rtmutex which from lockdep's point of
> view counts twice: The "logical" lock and the inner wait lock. That
> makes twice as many locks. I hope it is this and not some accounting
> error…

Yeah that will probably help explode the amount of entries, thanks for
the explanation.

I'm running out of entries with default PROVE_LOCKING settings on PREEMPT_RT
within a minute of booting.

Kind regards,
~Maarten Lankhorst
