Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE3E8D262B2
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 08:00:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF2810E6D9;
	Wed, 21 Jan 2026 08:00:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="d4kCt325";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0+oMVAel";
	dkim-atps=neutral
X-Greylist: delayed 415 seconds by postgrey-1.36 at gabe;
 Wed, 21 Jan 2026 08:00:47 UTC
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C9910E6D7;
 Wed, 21 Jan 2026 08:00:47 +0000 (UTC)
Date: Wed, 21 Jan 2026 08:53:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1768982030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L2q8M3UrjydVqdDqxNGy9BOk1w9FNNPzwD677+fHY+I=;
 b=d4kCt325DYPw0em7fsICBVjO9HzFxGIr+z8RYkEbepqy0r6WtWhehG9sFc08bCVdVQRty4
 zYo/awKVT6iipvx7KGWrhFWvrXoPCRF2QAmaCS/8p70LEQnSX/szukrPTgLU0lOhi/+b8+
 J88TtrvVC9hJYyeaApJNJE0YXn3zSbRXMGIehVt19255IGthfD6DA7blw6GXUpsd1d4EFG
 Rx4FCMw8kjuvT/nOLKKNYOhCsLsDFBmDyCK65/oXUtbSB7ic5TT4DZGT/whpCmM61x2ZMz
 1Z87rTO6+F92JC0RJyqbTgTtI/OgLIrEb0hPLPxJjiDagNKKAjzyxhKhauq19g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1768982030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L2q8M3UrjydVqdDqxNGy9BOk1w9FNNPzwD677+fHY+I=;
 b=0+oMVAelr4theE4TX5E2r+mfr10029bnGW7Mt00xpEpQoMgJod/RCMzx3WMznszzSqvXDN
 PatAUuf0C8Q9JwAQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Cc: hansg@kernel.org, "Kurmi, Suresh Kumar" <suresh.kumar.kurmi@intel.com>,
 "Saarinen, Jani" <jani.saarinen@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
 sfr@canb.auug.org.au, ilpo.jarvinen@linux.intel.com,
 regressions@leemhuis.info
Subject: Re: REGRESSION on linux-next (next-20260115)
Message-ID: <20260121075348.5MyqcHFB@linutronix.de>
References: <555f1c56-0f74-41bf-8bd2-6217e0aab0c6@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <555f1c56-0f74-41bf-8bd2-6217e0aab0c6@intel.com>
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

On 2026-01-21 12:42:16 [+0530], Borah, Chaitanya Kumar wrote:
> commit aef30c8d569c0f31715447525640044c74feb26f
> Author: Sebastian Andrzej Siewior bigeasy@linutronix.de
> Date:   Mon Jan 12 14:40:13 2026 +0100
> 
> 
>     genirq: Warn about using IRQF_ONESHOT without a threaded handler
> `````````````````````````````````````````````````````````````````````````````````````````````````````````
> 
> Looking at the irq register code in int0002_vgpio.c, it seems the warning
> comes from
> 
>         ret = devm_request_irq(dev, irq, int0002_irq,
>                                IRQF_ONESHOT | IRQF_SHARED, "INT0002", chip);
> 
> Looking at the history, this flag was added by the Commit 8f812373d195
> ("platform/x86: intel: int0002_vgpio: Pass IRQF_ONESHOT to request_irq()")
> to resolve another issue.
> 
> Any proposals for solving the WARN_ON?

Do you have the ACPI interrupt also on the same interrupt on the board
in question?

Sebastian
