Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 687121091910
	for <intel-xe@archiver.kernel.org>; Thu, 19 Mar 2026 19:25:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1544C10E09E;
	Thu, 19 Mar 2026 19:25:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="k9V1Yqdc";
	dkim-atps=neutral
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CC7610E072
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Mar 2026 19:25:29 +0000 (UTC)
Received: by mail-dl1-f46.google.com with SMTP id
 a92af1059eb24-128b9b7e3edso1961109c88.0
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Mar 2026 12:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773948329; x=1774553129; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=poRUHSD6rTCFS1gx0Ihn5EiVXgymtADueoMvkmlPFWQ=;
 b=k9V1Yqdc0/MXe4gsoM4542ina5cUSq7eQZypFdXm1JUEAdncgn2DJFKREkCIUkDXKI
 dOeYhGpDEsOF3g8yOkCvyNRyuFk+21OnGeyNBvc/zNlsfcnAqb2esiglH7tPiYJXJDNs
 fzOQoZMpcDZD/doFsFSoDVHtl5JmB9BoMJPW7BZAppn1dGsPbXBtkeFA2xN8ZVXXZv60
 fo1DkHstEwpzBHzZVJZBUQhBbrgcWbO5Nlq77HnLtZOxa1YcX98VYBhv3Uh66k1HzVYb
 Ajum+0sh/MFp0nXEkyP8TqkdgZ2xo04p9Q9oGGP/3zSKash3IaeNaTRG9dtI6bk5+dx0
 VvKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773948329; x=1774553129;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=poRUHSD6rTCFS1gx0Ihn5EiVXgymtADueoMvkmlPFWQ=;
 b=qq35sNcAAJ41njUBUw8HIn3Tdp5rM4AAQiCcyFO0qgZcVYUEHUQpEO3R6TlmSEbQke
 XdNh2R8LnCQtqaJ1lnK48A94E5xRwomo05juXphG8pqIssnOC7iQyKTXUs20PAQSv/gF
 HlENvfdzh95dI76Pcz7FT1Zxhislr1jPVg17mPA+MBaTJtDgtQKgmEataT+VIEC8B1RV
 gop9fZ1ft4yrrA1w/ufk9A+ePasx4jGyomeLtL5nTpVk1S6+vY7DvUPNu7a8hogMLc3E
 GzHqhQVkalUSGATClp192Ob9rdiM0TcYIcNCIV9UWpvNyqYijcrphFiHjkmYzin0umKy
 EAbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5/1q1xo6NFOiPc1iSaEkqCdbm5VHnKAv7NyH+K+laCNctO6RJv9GrSVvCYkDHnjuW0K8KN67jcw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxs2daleGA/2cYtPV5FLupOwigY5Cau2xi3mOmC/SqHXDB7knAK
 p6/dZEYuC/EzRJMq4gCoK+Ee1xrH1360ZNRZNGj/gUEcaLHau5mTZkuj
X-Gm-Gg: ATEYQzxM4uMlCLwby9gDDSqBnqwpSarRFzWhle1qUEg7rS328KRBZLHt9zxzA7WXcHd
 HIFeDOJJFfXWTObolLmtcBykwAorgSYiQ5xatGXFEQx4CPYim4NkxFHzbbdEIsdyu3oICOSkVuh
 qibe2RV1/WLKrbHAB8hRWhYbAxxt1FhX9ajCIzYpy0JOb73jro+WwlKBWiNoYtoNRVpwk9d0Lpg
 mDJ5IPdt8vYzNlbSFTyTV2zaxvH7Kp/WnQO+MxsCo/Gx1dl8WbwDp1HxlpC22IBMZngfFeq4c+a
 tbQk5Q1PMxRl5NinXLoMS/sFL89wkUDCMXI5uVQrB6vZp/PWHjefbRyQOZc7f9A233wMFFdVZkD
 UuWgleY2VmIZ83oBf/229dLKKx0nxryDfNnh6rpyU9jyqvXMDM8+Xchk4s8qk1odg5/2YDGHOeo
 Z4oZWGRaQWYOOxnYsS4JZxvWSnkmVhFn8d5ufgHnySJYQTV/lU+FHu4X8diWa/kJNAvNPDrUF9
X-Received: by 2002:a05:7022:628c:b0:128:cf5c:5352 with SMTP id
 a92af1059eb24-12a7266f502mr176456c88.4.1773948328573; 
 Thu, 19 Mar 2026 12:25:28 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5?
 ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-129b4127b7esm11628826c88.9.2026.03.19.12.25.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Mar 2026 12:25:28 -0700 (PDT)
Message-ID: <fdf45531-3a62-49ec-bcc7-fb6dbaa01b2f@roeck-us.net>
Date: Thu, 19 Mar 2026 12:25:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/2] PCI/IOV: Fix SR-IOV locking races and AB-BA
 deadlock
To: Niklas Schnelle <schnelle@linux.ibm.com>,
 "Ionut Nechita (Wind River)" <ionut.nechita@windriver.com>,
 linux-pci@vger.kernel.org, bhelgaas@google.com
Cc: helgaas@kernel.org, sebott@linux.ibm.com, bblock@linux.ibm.com,
 lkml@mageta.org, alifm@linux.ibm.com, julianr@linux.ibm.com,
 dtatulea@nvidia.com, mani@kernel.org, lukas@wunner.de, kbusch@kernel.org,
 ionut_n2001@yahoo.com, sunlightlinux@gmail.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 michal.wajdeczko@intel.com, piotr.piorkowski@intel.com
References: <20260318210316.61975-1-ionut.nechita@windriver.com>
 <f17b03652a84be73c1d3a2cfea8a016dab99f8e0.camel@linux.ibm.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <f17b03652a84be73c1d3a2cfea8a016dab99f8e0.camel@linux.ibm.com>
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

On 3/19/26 05:31, Niklas Schnelle wrote:
> On Wed, 2026-03-18 at 23:03 +0200, Ionut Nechita (Wind River) wrote:
>> From: Ionut Nechita <ionut.nechita@windriver.com>
>>
>> Hi Bjorn,
>>
>> This is v10 of the fix for the SR-IOV race between driver .remove()
>> and concurrent hotplug events.  v10 adds a second patch to fix the
>> AB-BA deadlock between device_lock and pci_rescan_remove_lock that
>> was reported by Guenter Roeck (via Google's AI review agent) and
>> confirmed by Benjamin Block.
>>
>> The AB-BA deadlock:
>>
>>    CPU0 (remove_store)               CPU1 (unbind_store)
>>    --------------------              --------------------
>>    pci_lock_rescan_remove()
>>                                      device_lock()
>>                                      driver .remove()
>>                                        sriov_del_vfs()
>>                                          pci_lock_rescan_remove()  <-- WAITS
>>    pci_stop_bus_device()
>>      device_release_driver()
>>        device_lock()                                               <-- WAITS
>>
>> Patch 2/2 fixes this by calling device_release_driver() in
>> remove_store() before pci_stop_and_remove_bus_device_locked(), so
>> that the driver is already unbound when pci_rescan_remove_lock is
>> acquired. Both paths then take locks in the same order: device_lock
>> first, then pci_rescan_remove_lock.
>>
>> Note: the concurrent unbind_store + hotplug-event case (where the
>> hotplug handler takes pci_rescan_remove_lock before device_lock)
>> remains a known limitation.  This is a pre-existing issue that
>> Benjamin Block is addressing separately in:
>>    https://lore.kernel.org/linux-pci/354b9e4a54ced67f3c89df198041df19434fe4c8.1773235561.git.bblock@linux.ibm.com/
>>
> --- snip ---
>>
>> Ionut Nechita (2):
>>    PCI/IOV: Make pci_lock_rescan_remove() reentrant and protect
>>      sriov_add_vfs/sriov_del_vfs
>>    PCI: Fix AB-BA deadlock between device_lock and
>>      pci_rescan_remove_lock in remove_store
>>
>>   drivers/pci/iov.c       |  9 +++++----
>>   drivers/pci/pci-sysfs.c | 20 +++++++++++++++++++-
>>   drivers/pci/probe.c     | 11 +++++++++--
>>   3 files changed, 33 insertions(+), 7 deletions(-)
>>
>> --
>> 2.43.0
> 
> Hi Ionut,
> 
> For your awareness, I saw that this series has some findings on
> Google's new Sashiko AI reviewing tool[0]. At a quick glance the
> findings seem like at least reasonable concerns to me. I'm still
> looking at this independently also of course.
> 

It is almost scary to see how many problems Sashiko is able to find.
The AB-BA deadlock that the second patch in the series tries to fix
was reported by a prototype version of it when running it on an LTS
backport.

Guenter

