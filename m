Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF292C25B76
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 13:06:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6609710E641;
	Tue, 11 Jun 2024 13:06:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="zvNqtS6a";
	dkim-atps=neutral
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ABFC10E635
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jun 2024 13:06:03 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-356c4e926a3so1179395f8f.1
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jun 2024 06:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1718111162; x=1718715962;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3SD2wtmek1HGb1XF4QLoRYKm3DzXn6QzOUC0m41QRZI=;
 b=zvNqtS6a0AMaWaeqK9XIEdG2fJ7sMGeHXvCCQQKL4B+NxbLwTT94e4JEhyisQ82je9
 d+8f+IDiqTEU0Xbm0wJfaeiVTp9dm8tvuv7yqe24NvmEmex8Z1fNYrRNNTtKvAWZ7V8F
 PuYo+OfD0fktT+CODSgYjCFycEN4DWmyVz5zcSxo2SPHCUnENKH7DlM91vBZJNQ38mZD
 dq+Oj6+tXp8Z8XTF1dEH2wMnIRKZs2QLW2CImsF2i3lliwzaoiz85MWTPsczYYrAQwD2
 O+urMtQ8KW3FFhMeBojckUrz29hZM9aCl6vq/YG6cja8kGGV/Mgf9E7eBOrrY+sIBd9E
 t2XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718111162; x=1718715962;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3SD2wtmek1HGb1XF4QLoRYKm3DzXn6QzOUC0m41QRZI=;
 b=UHBM84LEUFZRuIpeCKMRoxlA+Wd5iDpwaWvdt4jzTq3gYzvtCnaP0lB6UzCronwfCu
 PcsiPEnEKZU4MdpWuiOXYm3fqv2HaZij5PLcitpIJ86oHmet5f3ziiONaR0VvFPvdcNT
 UMrOCULKNAo8NezCUkioWiZX9iLfFMuNCTujLUjXUS6M9A3U1ykUispznOfRKHQVHTMp
 P5YvGj12YRryHgR6rllS3Fys5wsOw4zovCoaujB4h0ll5foc7brm8UcASTSGDMjMJLKy
 l0jvqKrMUXtcvFqqdizrygMSBhBRZ7nBGNY9XXqC0SpMnPaXT1T5X7zCQR+AVCfZi11K
 esAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpR96wXY+urO1SckfkMZeNaIyswGLvBj+Gw4qE8Y43Yi8bbd8dbRiLUYmg8HvObdkDAIK8UhdvjnV6C4K3w+tBLGu4oQYmRflZgMobRrQ=
X-Gm-Message-State: AOJu0Yy0zO0fVq6M3WgU+L+5y3LxX3D36vQBOBgIqN8yZ9YYbkGzK0/l
 TM9qxyZkN5zNz8BAMXmZ6ibZGhyc5iDDmc7RwrcNj0f0H5aZe1Vw6pbZZeoswU3d9eoDPH9NqDg
 To5QBjQ==
X-Google-Smtp-Source: AGHT+IFz6EJ9JzEssp0dkXZ2EofBOvB0qN3mlLIS4/BUXa40HdFqJO3LL8cLvhT9SfHR3EiOEPSPCw==
X-Received: by 2002:a05:6000:18a1:b0:35f:27b3:1d99 with SMTP id
 ffacd0b85a97d-35f27b31e8amr3670910f8f.31.1718111161605; 
 Tue, 11 Jun 2024 06:06:01 -0700 (PDT)
Received: from [192.168.0.101] ([84.69.19.168])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35f29116506sm3796546f8f.60.2024.06.11.06.06.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jun 2024 06:06:01 -0700 (PDT)
Message-ID: <4228aef4-1d26-4a92-ab4c-5d6b96284b4b@ursulin.net>
Date: Tue, 11 Jun 2024 14:06:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] drm/i915: PREEMPT_RT related fixups.
Content-Language: en-GB
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
References: <20240405142737.920626-1-bigeasy@linutronix.de>
 <20240605100152.4q1jSMuI@linutronix.de>
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20240605100152.4q1jSMuI@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


Hi Sebastian,

On 05/06/2024 11:01, Sebastian Andrzej Siewior wrote:
> On 2024-04-05 16:18:18 [+0200], To intel-gfx@lists.freedesktop.org wrote:
> Hi,
> 
>> The following patches are from the PREEMPT_RT queue.  It is mostly about
>> disabling interrupts/preemption which leads to problems. Unfortunately
> …
> 
> Could I please get some feedback? I didn't receive anything but
> automated mails from bots and I can't tell if this is a problem or not.
> 
> As of -rc2 I noticed that I can drop
> 	[PATCH 06/10] drm/i915/gt: Queue and wait for the irq_work item.
> 
> from the series.

Previous CI results have unfortunately expired by now. I have tried 
re-queuing it but it also does not apply any longer so I'm afraid you 
will have to respin before anyone can see the results.

And this is not to say that I can promise someone will look at it or 
when. Maybe Jani you could ask for volunteers regarding the display 
related patches (head of the series) and Rodrigo you about the GuC 
change in 9/10?

Regards,

Tvrtko
