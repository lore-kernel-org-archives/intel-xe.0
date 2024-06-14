Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6819C27C79
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 12:19:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B0BB10E24F;
	Fri, 14 Jun 2024 12:19:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="HlH8RRq8";
	dkim-atps=neutral
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 736DC10E24F
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 12:19:29 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-35f0aeff7a8so1738659f8f.2
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 05:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1718367567; x=1718972367;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BtOVFjE7gxlKH3/WSl8BYOZN/5omBfi6w3Mm7iSj0co=;
 b=HlH8RRq8Z8Zf6jNI//D5YCrLvWGtQZP6i9uZHNVZlIOGjUjdQ+qCGdunDi+YRchVJB
 hyGs/TjFBuPED67z8vt+m0MEv6Bout9UVn54IfxVyaahnvVoZ7c/0I1SRvTza6KaVoq9
 2oJWcKElQTFEoJauXN83T1335tlevJFRK5Nlm6juWm8PSLlyNoV8MV+P/n2bkHc5/Vtm
 iVESiTFSon1ksUnjv98T0Lj5/R2C6QDcmhTGziaJO9Zroq5EeAAYJzNkoSolUrEjwJRf
 duSrOXiKabuBYiLRzwyRiicf97vees+ZYeLy0AR1FNpxuSyfrJJGh9LFWdoRpfKRX7qo
 wAPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718367567; x=1718972367;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BtOVFjE7gxlKH3/WSl8BYOZN/5omBfi6w3Mm7iSj0co=;
 b=fbFnELmbNoDR+acAUP+ERYPVrJXHbE/Lc29mDV5R0Om6Kcz2ke0hC8I+DqU+YBC/Tu
 W/UaEeDJ+9Uz8iN/hHdNk+zwEMnrIrSCwli3QPe8zOAwiHs2RKukml6BwWOYATq6zy9A
 8xQYxC9xde2PLLoBDYGxvUVoBC3Y5iSYAGJdcl522CjImR8SdiDYnfwm3FFcIbnqoHQY
 uPLhrELgE1e7M7wnfuSYG20tJAamVwnxEyJwQhZS3hOifiUSsVHJUzQ3YPLNKLgy4Ag7
 hM64+vIivacMU1Ao89IV0RbRQSY+hGUpjseqbx4USY36neiL5llCcPOr9n2CKrnH2LdZ
 K2eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPs6H81eqA3O1Fq25lqFpt620AEhFczrqhh/rn8uC+FAwZ7MdqLO921OZM9ZCMHb9lexZHYbzjc2pCn1CNcPNXFEs7L2y/J8bYIYX61Vc=
X-Gm-Message-State: AOJu0Yx8BHf4eAu/mIgkNFpJBs8QtUnIZ258+LfMpp0mDTMNNbq8+9h0
 dEYILWwPt2+uuP53PPXB6pJDEOg3e0OG9hVFF4sKsdpiBdS5qKuYpt0vacIFTCg=
X-Google-Smtp-Source: AGHT+IG/ob9iNNkFn0jYXrWVHLMfYh6pM9Z1fdorhs68L3rYxCHUSr8OyvPvv3bb/r59bWIE6wNE7g==
X-Received: by 2002:adf:f148:0:b0:360:86e3:4cd2 with SMTP id
 ffacd0b85a97d-36086e34da0mr13262f8f.58.1718367567001; 
 Fri, 14 Jun 2024 05:19:27 -0700 (PDT)
Received: from [192.168.0.101] ([84.69.19.168])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36075093531sm4253590f8f.15.2024.06.14.05.19.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jun 2024 05:19:26 -0700 (PDT)
Message-ID: <fa38f377-a00a-4e0c-b416-54a1c3f15d4d@ursulin.net>
Date: Fri, 14 Jun 2024 13:19:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] drm/i915: Don't check for atomic context on
 PREEMPT_RT
Content-Language: en-GB
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>
References: <20240613102818.4056866-1-bigeasy@linutronix.de>
 <20240613102818.4056866-4-bigeasy@linutronix.de>
 <94423591-adba-46d4-a9ba-f377dfab369f@ursulin.net>
 <20240614110548.m3lloBjv@linutronix.de>
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20240614110548.m3lloBjv@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 14/06/2024 12:05, Sebastian Andrzej Siewior wrote:
> On 2024-06-14 09:32:07 [+0100], Tvrtko Ursulin wrote:
>> I think this could be okay-ish in principle, but the commit text is not
>> entirely accurate because there is no direct coupling between the wait
>> helpers and the uncore lock. They can be used from any atomic context.
>>
>> Okay-ish in principle because there is sufficient testing in Intel's CI on
>> non-PREEMPT_RT kernels to catch any conceptual misuses.
> 
> You just avoid disabling preemption if you expect to be in atomic
> context to save a few cycles. It wouldn't hurt to disable it anyway. The
> only reason you need it is to remain on the same CPU while reading the
> clock because it is not guaranteed otherwise.

Ah no, that is not why. Reason for conditional disabling of preemption 
is to have an implementation for very short delays which does not run 
with preemption permanently disabled. So it is disabled only around time 
tracking.

> Delays > 50ms are detected at build time.

Right, point of that is to ask the contributor if they are sure this is 
what they want. Catching misuse of the short delay wait helper step one..

>> But see also the caller in skl_pcode_request. It is a bit harder to hit
>> since it is the fallback path. Or gen5_rps_enable which nests under a
>> different lock.
>>
>> Hmm would there be a different helper, or combination of helpers, which
>> could replace in_atomic() which would do the right thing on both kernels?
>> Something to tell us we are neither under a spin_lock, nor preempt_disable,
>> nor interrupts disabled, nor bottom-half. On either stock or PREEMPT_RT.
> 
> There is nothing that you can use to deduct that you are under a
> spin-lock. preemptible() works only if you have a preemption counter
> which is not mandatory. It can affect RCU but not in all configurations.
> 
>> WARN_ON_ONCE((ATOMIC) && !(!preemptible() || in_hardirq() ||
>> in_serving_softirq())
>>
>> Would this work?
> 
> Nope. None of this triggers if you acquire a spinlock_t. And I can't
> think of something that would always be true.

Bummer.

> So the question is why do you need to know if the context is atomic?
> The only impact is avoiding disabling preemption. Is it that important
> to avoid it?
> If so would cant_migrate() work? It requires CONFIG_DEBUG_ATOMIC_SLEEP=y
> to do the trick.

... catching misuse of atomic wait helpers step 2 - are you calling it 
from a non-atomic context without the real need. So should use the 
non-atomic helper instead.

When i915 development was very active and with a lot of contributors it 
was beneficial to catch these things which code review would easily miss.

Now that the pace is much, much slower, it is probably not very 
important. So this patch is acceptable for what I am concerned and:

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Actually please also add the PREEMPT_RT angle to the comment above 
_WAIT_FOR_ATOMIC_CHECK. Sometimes lines change and git blame makes it 
hard to find the commit text.

Regards,

Tvrtko

> 
>> Regards,
>>
>> Tvrtko
> 
> Sebastian
