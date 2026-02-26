Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45737FCE086
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 14:19:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4FC810E05D;
	Thu, 26 Feb 2026 14:19:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="GH+gzUU1";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yQZDieke";
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC0410E05D;
 Thu, 26 Feb 2026 14:19:45 +0000 (UTC)
Date: Thu, 26 Feb 2026 15:19:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1772115583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8c6qu927upqGrJOJ8AKCa13ozE/2BqPliFAxWM7NElA=;
 b=GH+gzUU1lbjLRsng/FuN/Fu3I+jwaCcD22W7vEawvJ8Po2yl5PZiTSy3CpjhGgQHfRDMPo
 j4xaNZLn75rdIwSgTH7Q7zhwtbG3AMdXFSnNpCZ6kzGKut5mc29O3Hcpx+eBvreXcf4cGb
 kH91z632QP/PR3zenE/6s8HVEtGpjYtVadejKTAoXumR+xzm2Xx1IPJXZP4vR4S8igPYjs
 7WdHMVYa6261vHcBQgqskldUQl7GFyOBuJe8jWzkMa+cGLHMXpgE+QaPX7VD4DofTXPyr9
 5H2SAjItzm1baAkIN7TJH6NTOyc8Ve5QXs+YpkUUCrLYk/UFY+ds3ZuqAB1MtQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1772115583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8c6qu927upqGrJOJ8AKCa13ozE/2BqPliFAxWM7NElA=;
 b=yQZDiekecywbKqUoCZZYK7oOBD88Vt9mULxwq3YCQB20DASIXWF9BD5Dxv9KDDK1/OHyTo
 Bx4osZnrawsPlpAQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-rt-devel@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [i915-rt v6 00/24] drm/i915/display: All patches to make
 PREEMPT_RT work on i915 + xe.
Message-ID: <20260226141942.Z6vUrEQ3@linutronix.de>
References: <20260220083657.28815-26-dev@lankhorst.se>
 <20260224162703.Q_taYjEC@linutronix.de>
 <20260224165903.2mn24oQy@linutronix.de>
 <20260225075806.XNtXjZ5E@linutronix.de>
 <7ee8b784-a714-4329-aab2-a571f25c3baa@lankhorst.se>
 <20260226120715.6Ug1Qkse@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260226120715.6Ug1Qkse@linutronix.de>
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

On 2026-02-26 13:07:18 [+0100], To Maarten Lankhorst wrote:
> series somewhere I could pull and check. In meantime I would look what
> causes the lockup on i915.

I think I got it.

Sebastian
