Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1991BC5478C
	for <intel-xe@archiver.kernel.org>; Fri,  1 Mar 2024 18:38:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B17CF10EA84;
	Fri,  1 Mar 2024 18:38:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HYBv2a4B";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8623C10EA71
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Mar 2024 18:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709318329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=12w5fpeGc+D7KoB7397WHWHXMtnXg/VkOws4FVveYe4=;
 b=HYBv2a4BzOvFo2E3KI03dBRuP27ZGyi61MQe9u/+oTrGtW6bAO9+7Me/39G91YpjTySbOK
 honcyeEYH0SV/WcRj7yqHeBImskgPY1TriHT7hF7ht4VavCuRoiXLbO951PHpcUEvx6mfN
 hxNrF6bvXMhq7ca7MDeAvS/64Z9YCK8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-pbyxgdlqOGW-3sRDgUKk9w-1; Fri, 01 Mar 2024 13:38:48 -0500
X-MC-Unique: pbyxgdlqOGW-3sRDgUKk9w-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-56542d424cdso2036923a12.2
 for <intel-xe@lists.freedesktop.org>; Fri, 01 Mar 2024 10:38:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709318327; x=1709923127;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=12w5fpeGc+D7KoB7397WHWHXMtnXg/VkOws4FVveYe4=;
 b=E7Ymn36H65UT7bKEDvXZs5HIFW1DNg0QJefj65vRyh3fEwj5dO/0sg72tuc14EKxlI
 RbXynyex6yeF5vALcO0+mEvab0XoKsvmFFoVq0djjJ/240M5VJPzVlRp/xLECoIUws1+
 Lqa+ZCMqTF6XhD7wAtSg3VPOAT/efKQ2JrqyKkrMSkC7tTdgGdARlPyVpvZLnLrr/nGD
 U65IP7AbXTUXJE2JrqjdnSObrJyElvq9FMQ9HK654LEK/LQwt6GdBIyYq//6FhEP+tdq
 qis+BV2i6pFq9Y7RGeOjVLCYKLmYeCIuxa6rs5lWoX3fUPpdExa0XqRq2DhUm/VgAyzl
 xJ5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsVwN4gPIsRKAq6RtWRx1DbobTcdQqCBKmJPit0jyf1wf6MHCJB9seMY4wnfZ7qDgYh8DaXbAR3SRrrPHZVHQXsduYqt5k7YSRix2jiV4=
X-Gm-Message-State: AOJu0YxgmJo/phjWlYMpib5EeqpqGOd/c6IJAswxNaeLcL/d3LAVqTRZ
 Ru9HAgYiLg7SWe7Fc64KU6nf5WlSIt1+SttePbt75bRmAZVyjgFRjFz4AP/IzNzDcJdavEpOmIM
 9OsHIRCKAK/kz6Trxx7x8NuPkCGj0WZHgRdGmKj6MtJaMOgkNr9INKxnN0cnCQrfV
X-Received: by 2002:a50:d5d0:0:b0:566:ab2b:e1ce with SMTP id
 g16-20020a50d5d0000000b00566ab2be1cemr1857931edj.18.1709318326917; 
 Fri, 01 Mar 2024 10:38:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE1W/qKy2ovilQzJQF173gN2cb9wEOMSiSDAx37JJY7YF7WmuRQitQDacod2tVzBBIrF84mJQ==
X-Received: by 2002:a50:d5d0:0:b0:566:ab2b:e1ce with SMTP id
 g16-20020a50d5d0000000b00566ab2be1cemr1857922edj.18.1709318326586; 
 Fri, 01 Mar 2024 10:38:46 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 fj10-20020a0564022b8a00b00563f8233ba8sm1794236edb.7.2024.03.01.10.38.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Mar 2024 10:38:45 -0800 (PST)
Message-ID: <2e1ea7ec-13bd-4582-9052-5de8cb79401d@redhat.com>
Date: Fri, 1 Mar 2024 19:38:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the kvm tree with the drm-xe tree
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Oded Gabbay
 <ogabbay@kernel.org>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>,
 DRM XE List <intel-xe@lists.freedesktop.org>, KVM <kvm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Yury Norov <yury.norov@gmail.com>
References: <20240222145842.1714b195@canb.auug.org.au>
 <CABgObfaDQMxj9CZBzea+=1fcFQXEemAJoH5Jvc9+tfiC7NAvrQ@mail.gmail.com>
 <55pdgbv7ltrwnewhxz7ivugowczzomlm6yvco2nxfanxm4ffco@olkrf4wr65so>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <55pdgbv7ltrwnewhxz7ivugowczzomlm6yvco2nxfanxm4ffco@olkrf4wr65so>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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

On 3/1/24 19:17, Lucas De Marchi wrote:
> I'm surprised to see 3c7a8e190bc5 ("uapi: introduce uapi-friendly macros
> for GENMASK") with no acks from maintainer though.

The patch sat on the list for a couple months, then I went ahead and 
committed it.

The changes to include/linux/bits.h are just code movement from kernel 
to uapi header (plus the uglification of BITS_PER_LONG and 
BITS_PER_LONG_LONG per uapi rules) so I think that's fine.

But I'll drop an email to them to ask them if they want MAINTAINERS to 
include the new file.

> Btw, aren't you missing some includes in include/uapi/linux/bits.h?

Yeah, uapi/linux/const.h is needed to use the macros in bits.h.  I 
didn't notice because KVM headers include it anyway and, on the 
include/linux/ side, include/linux/bits.h gets it via include/linux/const.h.

Paolo

