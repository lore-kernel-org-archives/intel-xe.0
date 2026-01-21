Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01CADD3EE6A
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 13:38:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A157F10E9B2;
	Thu, 22 Jan 2026 13:38:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="i79p2adC";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC5A10E10C;
 Wed, 21 Jan 2026 10:20:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 295A060053;
 Wed, 21 Jan 2026 10:20:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAE77C116D0;
 Wed, 21 Jan 2026 10:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768990857;
 bh=13ZO07wCiJVv+RdE9V2/uwg5zktyFxMIq5IM164EO2A=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=i79p2adClM9Iw4AIa6a4W7gkgWYAZYdsDphk21EZ/5TmHz887yOPZRs9aSg4axksz
 5O3mF3TkkszefLlTJKqSLFg09sdopCuw1sQdiw2kfrahCkXhYqiieGseGm4++Xv3E4
 RPMpmssDMLKlnRQUgC+1Gj5g9ioblwpmdV0SLc8SaAnqzdpD6zIqsS3klKN3em6/tG
 gFidlt9u9wSRq+/QO7Sz7tjIMNzJ+sgveevzC+oAUAsQwhntNv1qabU9TPQrWCA6za
 ipDcdR9QeEKVfNpSpXm3uw9fgGVU/WNoIxwSt9mFoFcaNPeyp3YVRRfBQBCLi/1arD
 zGTUBTwdCaPag==
Message-ID: <1a68f6d5-6541-4b04-8628-397001cb1e55@kernel.org>
Date: Wed, 21 Jan 2026 11:20:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: REGRESSION on linux-next (next-20260115)
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Cc: "Kurmi, Suresh Kumar" <suresh.kumar.kurmi@intel.com>,
 "Saarinen, Jani" <jani.saarinen@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
 sfr@canb.auug.org.au, ilpo.jarvinen@linux.intel.com,
 regressions@leemhuis.info
References: <555f1c56-0f74-41bf-8bd2-6217e0aab0c6@intel.com>
 <20260121075348.5MyqcHFB@linutronix.de>
 <89de03a5-e5da-4d2e-8547-8e54ad73b324@intel.com>
 <20260121090154.Lpaj9hrr@linutronix.de>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260121090154.Lpaj9hrr@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 22 Jan 2026 13:38:39 +0000
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

Hi,

On 21-Jan-26 10:01, Sebastian Andrzej Siewior wrote:
> On 2026-01-21 13:59:38 [+0530], Borah, Chaitanya Kumar wrote:
>>
>> Looks like it.
>>   9:          1          0  IO-APIC   9-fasteoi   acpi, INT0002
> 
> Does the following help?
> 
> diff --git a/drivers/platform/x86/intel/int0002_vgpio.c b/drivers/platform/x86/intel/int0002_vgpio.c
> index 6f5629dc3f8db..562e880256436 100644
> --- a/drivers/platform/x86/intel/int0002_vgpio.c
> +++ b/drivers/platform/x86/intel/int0002_vgpio.c
> @@ -206,8 +206,8 @@ static int int0002_probe(struct platform_device *pdev)
>  	 * FIXME: augment this if we managed to pull handling of shared
>  	 * IRQs into gpiolib.
>  	 */
> -	ret = devm_request_irq(dev, irq, int0002_irq,
> -			       IRQF_ONESHOT | IRQF_SHARED, "INT0002", chip);
> +	ret = devm_request_irq(dev, irq, int0002_irq, IRQF_SHARED, "INT0002",
> +			       chip);
>  	if (ret) {
>  		dev_err(dev, "Error requesting IRQ %d: %d\n", irq, ret);
>  		return ret;
> diff --git a/include/linux/interrupt.h b/include/linux/interrupt.h
> index 266f2b39213a0..b2bb878abd113 100644
> --- a/include/linux/interrupt.h
> +++ b/include/linux/interrupt.h
> @@ -228,7 +228,7 @@ static inline int __must_check
>  devm_request_irq(struct device *dev, unsigned int irq, irq_handler_t handler,
>  		 unsigned long irqflags, const char *devname, void *dev_id)
>  {
> -	return devm_request_threaded_irq(dev, irq, handler, NULL, irqflags,
> +	return devm_request_threaded_irq(dev, irq, handler, NULL, irqflags | IRQF_COND_ONESHOT,
>  					 devname, dev_id);
>  }
>  
> My guess would be that the int0002_vgpio.c results in a warning without
> requesting the interrupt while the interrupt.h change should fix it and
> the warning should be gone.

Right, so as the commit message of commit 8f812373d195 ("platform/x86: intel:
int0002_vgpio: Pass IRQF_ONESHOT to request_irq()") explains
the int0002_vgpio driver *must* use the same flags to request
the IRQ as the ACPI core does, which is why it passes IRQF_ONESHOT
even though it does not have a threaded handler.

This worked fine until commit aef30c8d569c ("genirq: Warn about using
IRQF_ONESHOT without a threaded handler") as Chaitanya's bisect
pointed out.

Sebastian as I agree that switching to IRQF_COND_ONESHOT on
the int0002_vgpio.c side is a good way to fix this.

But If I'm reading your proposed changes correct then your suggestion
is to drop IRQF_ONESHOT from int0002_vgpio.c and then instead of
replacing it with IRQF_COND_ONESHOT you want to always pass
IRQF_COND_ONESHOT when using the non-threaded request_irq functions?

I'm not objecting against this, just making sure I understand
correctly.

Note in that case you should also add this to the non devm_
prefixed version.

Regards,

Hans


