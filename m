Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783B6EE4993
	for <intel-xe@archiver.kernel.org>; Mon, 21 Aug 2023 18:01:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CAEE10E29C;
	Mon, 21 Aug 2023 18:01:15 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8795A10E29C
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Aug 2023 18:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692640872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yVV1kGX81ZmlpfYVzB9J/H3Ptr9A/eP0Mc3RQX0BImM=;
 b=BejJWKR3k9gNFfEVVv9/R7RVGC3StnyxzQkArdmfTITdCT4Nt9OhYxwqB81V1OPLyuzu6t
 kF1Lhnc3SZw9y9FQqBKjjPtl3u40QvceFBe1TKRDyV7awJiGYuKK+Q2OJlQ7UWrr5gkZx3
 86XBdK6BEIss9HjBibmswekjen7B8GY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-255-b-whYUWoMwahMs2Omv4mVA-1; Mon, 21 Aug 2023 14:01:11 -0400
X-MC-Unique: b-whYUWoMwahMs2Omv4mVA-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-99cc5d18f78so237297066b.3
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Aug 2023 11:01:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692640870; x=1693245670;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yVV1kGX81ZmlpfYVzB9J/H3Ptr9A/eP0Mc3RQX0BImM=;
 b=GK2YKK6cJ1Agzh8+SYxLLkI8+W/hoA/cIxA4ZMkG5WrOcTu6fxTy+J63/AragJLPd1
 cHx2cXAhZZUix+GNIwiYOxg/7hqEMfcI6h1w4VPDSOtqC8OAJ6ubCa1nSEKaGMVoeJD/
 KCl8N3ClbYaYyGcOvr7JTFAgKaI6CgT6ZJvTE4DllYRE7hJ1QzB3bN4vF5qRTkroyeDv
 mJkjvAqjwAyi0gAVza6MeE5nG9ZwOF62pJVjbsfcWr4iAsdgbEd0TF+6R4IyDOqx0kaZ
 AJa8OrYDrONplMqTgQGe+cXLy9QmGYVI0ViEnknuQjO1ItWn4ZLGZl/y4ukqMUKNMJ7g
 JZLA==
X-Gm-Message-State: AOJu0YwkUcESXKjJUizREJnHa/8VOx/fmHsYcWSAbD/TULzZHvFu3I+Y
 RBPmZWovZJSRTOXq7JKzlvTK05HNj7O3q49KrkSYecJttbaVV6pyeWuPrKnipDDwiuGdRvLpgSV
 w3tjdEzMThNk8Wsbm900JXd6W6Bk=
X-Received: by 2002:a17:907:7718:b0:99d:f3d1:cd6f with SMTP id
 kw24-20020a170907771800b0099df3d1cd6fmr6378450ejc.19.1692640870412; 
 Mon, 21 Aug 2023 11:01:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSWlaovuqSD/fDWkhFGWPrxHXZRgx1CnBUO3KdLmu4wcXvWRk/Azygh1TK48ZqVhFPPgWUag==
X-Received: by 2002:a17:907:7718:b0:99d:f3d1:cd6f with SMTP id
 kw24-20020a170907771800b0099df3d1cd6fmr6378420ejc.19.1692640870022; 
 Mon, 21 Aug 2023 11:01:10 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 ce12-20020a170906b24c00b009a19701e7b5sm2431687ejb.96.2023.08.21.11.01.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Aug 2023 11:01:09 -0700 (PDT)
Message-ID: <9072642e-f4f6-4ff1-e11f-9bda8730750c@redhat.com>
Date: Mon, 21 Aug 2023 20:01:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-2-matthew.brost@intel.com>
 <69b648f8-c6b3-5846-0d03-05a380d010d8@redhat.com>
 <069e6cd0-abd3-fdd9-217d-173e8f8e1d29@amd.com>
 <b9a6493c-243b-1078-afbc-d9270cac904a@redhat.com>
 <982800c1-e7d3-f276-51d0-1a431f92eacb@amd.com>
 <5fdf7d59-3323-24b5-a35a-bd60b06b4ce5@redhat.com>
 <0bf839df-db7f-41fa-8b34-59792d2ba8be@amd.com>
 <e8fa305a-0ac8-ece7-efeb-f9cec2892d44@redhat.com>
 <ef4d2c78-6927-3d3b-7aac-27d013af7ea6@amd.com>
 <a80be2c1-132e-5ee1-4278-47655916494a@redhat.com>
 <0d5af79a-ba3a-d4be-938f-81627db65b50@amd.com>
 <a3937c17-eaa5-e0e9-e0ac-1610e0652982@redhat.com>
 <1820cb54-5f1e-d2e6-38fa-7161465ed061@amd.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <1820cb54-5f1e-d2e6-38fa-7161465ed061@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v2 1/9] drm/sched: Convert drm scheduler to
 use a work queue rather than kthread
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
Cc: robdclark@chromium.org, sarah.walker@imgtec.com, ketil.johnsen@arm.com,
 lina@asahilina.net, Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org,
 luben.tuikov@amd.com, donald.robson@imgtec.com, boris.brezillon@collabora.com,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 8/21/23 16:07, Christian König wrote:
> Am 18.08.23 um 13:58 schrieb Danilo Krummrich:
>> [SNIP]
>>> I only see two possible outcomes:
>>> 1. You return -EBUSY (or similar) error code indicating the the hw 
>>> can't receive more commands.
>>> 2. Wait on previously pushed commands to be executed.
>>> (3. Your driver crash because you accidentally overwrite stuff in the 
>>> ring buffer which is still executed. I just assume that's prevented).
>>>
>>> Resolution #1 with -EBUSY is actually something the UAPI should not 
>>> do, because your UAPI then depends on the specific timing of 
>>> submissions which is a really bad idea.
>>>
>>> Resolution #2 is usually bad because it forces the hw to run dry 
>>> between submission and so degrade performance.
>>
>> I agree, that is a good reason for at least limiting the maximum job 
>> size to half of the ring size.
>>
>> However, there could still be cases where two subsequent jobs are 
>> submitted with just a single IB, which as is would still block 
>> subsequent jobs to be pushed to the ring although there is still 
>> plenty of space. Depending on the (CPU) scheduler latency, such a case 
>> can let the HW run dry as well.
> 
> Yeah, that was intentionally not done as well. The crux here is that the 
> more you push to the hw the worse the scheduling granularity becomes. 
> It's just that neither Xe nor Nouveau relies that much on the scheduling 
> granularity at all (because of hw queues).
> 
> But Xe doesn't seem to need that feature and I would still try to avoid 
> it because the more you have pushed to the hw the harder it is to get 
> going again after a reset.
> 
>>
>> Surely, we could just continue decrease the maximum job size even 
>> further, but this would result in further overhead on user and kernel 
>> for larger IB counts. Tracking the actual job size seems to be the 
>> better solution for drivers where the job size can vary over a rather 
>> huge range.
> 
> I strongly disagree on that. A larger ring buffer is trivial to allocate 

That sounds like a workaround to me. The problem, in the case above, 
isn't that the ring buffer does not have enough space, the problem is 
that we account for the maximum job size although the actual job size is 
much smaller. And enabling the scheduler to track the actual job size is 
trivial as well.

> and if userspace submissions are so small that the scheduler can't keep 
> up submitting them then your ring buffer size is your smallest problem.
> 
> In other words the submission overhead will completely kill your 
> performance and you should probably consider stuffing more into a single 
> submission.

I fully agree and that is also the reason why I want to keep the maximum 
job size as large as possible.

However, afaik with Vulkan it's the applications themselves deciding 
when and with how many command buffers a queue is submitted (@Faith: 
please correct me if I'm wrong). Hence, why not optimize for this case 
as well? It's not that it would make another case worse, right?

- Danilo

> 
> Regards,
> Christian.
> 
>>
>> - Danilo
> 

