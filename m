Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B7EFC44502
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 09:01:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3947210E71A;
	Wed, 21 Jan 2026 09:01:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="yPmgongE";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3u+yUQlg";
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFAA810E2BD;
 Wed, 21 Jan 2026 09:01:57 +0000 (UTC)
Date: Wed, 21 Jan 2026 10:01:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1768986115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xZk9739avFDrhfcz7WUKfli/kaNXuUlJFH1muW4n2/c=;
 b=yPmgongEOfJYQEIvAyCpLfiHV9im/LIW8PlB30aQNIK4vbObW+o8T+5eHwBNRrtpmoUUxV
 RGgyIEIiAf4XTc+mt2xuQJjtlBXFZdIIz5GT6mNBCNdTxoggR1BUAsZlWXdWSeTY3WtJB7
 NRWQaY9L5OsbdE1T/x5XY5SPZIjOv8KI+cVt3GyNOpduBn3qF1KInHFJExL3HpngfXAL+Z
 3xqFohxYDnsgYGfDAgqk6c6YFHVWHFiSh3ZknIgsjqkHT7s2SrRiIyves4J5HMGzJdfnF/
 JAJpBhuJYbRdg1VdgoEFnR+mBo8H+HooYx/Yjcyy7KScAiHFMZTcAQBa6ArfKQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1768986115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xZk9739avFDrhfcz7WUKfli/kaNXuUlJFH1muW4n2/c=;
 b=3u+yUQlgc5fTUKKo8P3STY6vg9Se34uHWfVyncRQE0bSYBOz9484nyxXLoNkPdsYbgdKw6
 Lgst3HNVs+GFJJCQ==
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
Message-ID: <20260121090154.Lpaj9hrr@linutronix.de>
References: <555f1c56-0f74-41bf-8bd2-6217e0aab0c6@intel.com>
 <20260121075348.5MyqcHFB@linutronix.de>
 <89de03a5-e5da-4d2e-8547-8e54ad73b324@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <89de03a5-e5da-4d2e-8547-8e54ad73b324@intel.com>
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

On 2026-01-21 13:59:38 [+0530], Borah, Chaitanya Kumar wrote:
> 
> Looks like it.
>   9:          1          0  IO-APIC   9-fasteoi   acpi, INT0002

Does the following help?

diff --git a/drivers/platform/x86/intel/int0002_vgpio.c b/drivers/platform/x86/intel/int0002_vgpio.c
index 6f5629dc3f8db..562e880256436 100644
--- a/drivers/platform/x86/intel/int0002_vgpio.c
+++ b/drivers/platform/x86/intel/int0002_vgpio.c
@@ -206,8 +206,8 @@ static int int0002_probe(struct platform_device *pdev)
 	 * FIXME: augment this if we managed to pull handling of shared
 	 * IRQs into gpiolib.
 	 */
-	ret = devm_request_irq(dev, irq, int0002_irq,
-			       IRQF_ONESHOT | IRQF_SHARED, "INT0002", chip);
+	ret = devm_request_irq(dev, irq, int0002_irq, IRQF_SHARED, "INT0002",
+			       chip);
 	if (ret) {
 		dev_err(dev, "Error requesting IRQ %d: %d\n", irq, ret);
 		return ret;
diff --git a/include/linux/interrupt.h b/include/linux/interrupt.h
index 266f2b39213a0..b2bb878abd113 100644
--- a/include/linux/interrupt.h
+++ b/include/linux/interrupt.h
@@ -228,7 +228,7 @@ static inline int __must_check
 devm_request_irq(struct device *dev, unsigned int irq, irq_handler_t handler,
 		 unsigned long irqflags, const char *devname, void *dev_id)
 {
-	return devm_request_threaded_irq(dev, irq, handler, NULL, irqflags,
+	return devm_request_threaded_irq(dev, irq, handler, NULL, irqflags | IRQF_COND_ONESHOT,
 					 devname, dev_id);
 }
 
My guess would be that the int0002_vgpio.c results in a warning without
requesting the interrupt while the interrupt.h change should fix it and
the warning should be gone.

> ==
> Chaitanya

Sebastian
