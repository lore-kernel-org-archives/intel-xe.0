Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F97CC83F2C
	for <intel-xe@archiver.kernel.org>; Mon,  4 Sep 2023 21:40:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B9910E40A;
	Mon,  4 Sep 2023 21:40:03 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55F9510E409
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Sep 2023 21:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693863599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9K10tiG8Z3KF4U0DbRTHBaM7zSpmW9U1K994PJo61Gg=;
 b=P6RJRXjrRWd0H3CzBLk/bB8gDyN57tFNRzsj/dY7NR0E+k71lkS/jiCGJoYuP5pSZzz2eb
 6YLqVeCD0aLa4f5x5pNVgXCpa+VWgloR45xvxx15T3/+aD1E1JJIDry7jpXJN4pDnHUlm3
 ZolJqft5JDe3PZdg44q70zw7mDOVi3I=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-yQhSIRsLP9GoDWeVb2CL9g-1; Mon, 04 Sep 2023 17:39:58 -0400
X-MC-Unique: yQhSIRsLP9GoDWeVb2CL9g-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-99c0bd2ca23so122785866b.2
 for <intel-xe@lists.freedesktop.org>; Mon, 04 Sep 2023 14:39:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693863597; x=1694468397;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9K10tiG8Z3KF4U0DbRTHBaM7zSpmW9U1K994PJo61Gg=;
 b=PXVSyRpJ5Qn0t3q49cNpuxN+CIRtJANDuae2AH5+NqUJxRJvf43CRYKTXtGGYUT/RO
 zpz8qOm2sV3wrrw8rOEtikOs7R1dcoK2WRjCGO8PXc3ZM3OKllw9Kq2TtlVMI81Hom5K
 TYcCTTqiAvRaYI1nIqPmkb2rIlNQ95RKybLIpPcY4ro++1n8pNA0EZU+ffm8He9qc2Ri
 n3bMOPczi1y3zDZcHJeE2h0/IU2TH27+7aOOp6TKTyZP1h/FxDucbI17bD4X5ebaBM17
 1olARXHnSYGppt/FOaTWL0lYt/qqHfHqAthwpsvesUDM7vyeHLuWmRMIk1cnmRbfc71n
 dLeg==
X-Gm-Message-State: AOJu0Yyx0BKw4MyjtMRsYnUoL1RvCio1pD8C57VC1yDXxvQG+IVV8Kwb
 wP40Hxw10bQrup41ADin9fjWUVQizfA1+B5663xUtVau57PEv/glbl1yaNERw3NR2h9whc35NBB
 a9deFR+82YhAkDSZJBZQnxh/E4NA=
X-Received: by 2002:a17:907:77d3:b0:9a1:fbfb:4d11 with SMTP id
 kz19-20020a17090777d300b009a1fbfb4d11mr8280357ejc.73.1693863597098; 
 Mon, 04 Sep 2023 14:39:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvnr+De3X6WB/1IpKxJXg+ik97aG4VgZLycMs/UcmRmvtoqRJv4dtDWh4eyUQOb5c5x4mP0g==
X-Received: by 2002:a17:907:77d3:b0:9a1:fbfb:4d11 with SMTP id
 kz19-20020a17090777d300b009a1fbfb4d11mr8280351ejc.73.1693863596739; 
 Mon, 04 Sep 2023 14:39:56 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 l14-20020a170906938e00b00992e94bcfabsm6658074ejx.167.2023.09.04.14.39.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Sep 2023 14:39:56 -0700 (PDT)
Message-ID: <24e70864-ce64-f2c3-4a09-6f252a1c6080@redhat.com>
Date: Mon, 4 Sep 2023 23:39:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org
References: <20230829163005.54067-1-rodrigo.vivi@intel.com>
 <20230829163005.54067-4-rodrigo.vivi@intel.com> <ZPDnT72UCgOyY/YC@intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <ZPDnT72UCgOyY/YC@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 4/4] drm/doc/rfc: Mark GPU VA as complete.
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
Cc: daniel.vetter@ffwll.ch, airlied@gmail.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 8/31/23 21:17, Rodrigo Vivi wrote:
> On Tue, Aug 29, 2023 at 12:30:04PM -0400, Rodrigo Vivi wrote:
>> Nouveau has landed the GPU VA helpers, support and documentation
>> already and Xe is already using the upstream GPU VA.
> 
> Danilo, although this is more on the Xe side and I wouldn't ask you
> to review our code entirely, I'd like to get your ack here as Daniel
> recommended. Meaning that we are aligned there and not creating any
> change on top of GPU VA. Xe is currently using GPU VA directly without
> any customization.
> 
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/commit/ea4ae69e66b2940107e74f240ecb9dae87bf1ff1
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/commits/drm-xe-next?ref_type=heads

Acked-by: Danilo Krummrich <dakr@redhat.com>

Just one note: If we end up to agree on [1] few more adjustments are needed.

Otherwise, same as the other commit, where is the paragraph going?

- Danilo

[1] https://lore.kernel.org/dri-devel/202308221050.kTj8uFMA-lkp@intel.com/T/#m7f3b5a7ff70723332adeea32671578cb95c62f7c

> 
>>
>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>   Documentation/gpu/rfc/xe.rst | 36 ++++++++++++++++++------------------
>>   1 file changed, 18 insertions(+), 18 deletions(-)
>>
>> diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
>> index a115526c03e0..b67f8e6a1825 100644
>> --- a/Documentation/gpu/rfc/xe.rst
>> +++ b/Documentation/gpu/rfc/xe.rst
>> @@ -88,24 +88,6 @@ depend on any other patch touching drm_scheduler itself that was not yet merged
>>   through drm-misc. This, by itself, already includes the reach of an agreement for
>>   uniform 1 to 1 relationship implementation / usage across drivers.
>>   
>> -GPU VA
>> -------
>> -Two main goals of Xe are meeting together here:
>> -
>> -1) Have an uAPI that aligns with modern UMD needs.
>> -
>> -2) Early upstream engagement.
>> -
>> -RedHat engineers working on Nouveau proposed a new DRM feature to handle keeping
>> -track of GPU virtual address mappings. This is still not merged upstream, but
>> -this aligns very well with our goals and with our VM_BIND. The engagement with
>> -upstream and the port of Xe towards GPUVA is already ongoing.
>> -
>> -As a key measurable result, Xe needs to be aligned with the GPU VA and working in
>> -our tree. Missing Nouveau patches should *not* block Xe and any needed GPUVA
>> -related patch should be independent and present on dri-devel or acked by
>> -maintainers to go along with the first Xe pull request towards drm-next.
>> -
>>   ASYNC VM_BIND
>>   -------------
>>   Although having a common DRM level IOCTL for VM_BIND is not a requirement to get
>> @@ -230,3 +212,21 @@ Xe merged, it is mandatory to enforce the overall locking scheme for all major
>>   structs and list (so vm and vma). So, a consensus is needed, and possibly some
>>   common helpers. If helpers are needed, they should be also documented in this
>>   document.
>> +
>> +GPU VA
>> +------
>> +Two main goals of Xe are meeting together here:
>> +
>> +1) Have an uAPI that aligns with modern UMD needs.
>> +
>> +2) Early upstream engagement.
>> +
>> +RedHat engineers working on Nouveau proposed a new DRM feature to handle keeping
>> +track of GPU virtual address mappings. This is still not merged upstream, but
>> +this aligns very well with our goals and with our VM_BIND. The engagement with
>> +upstream and the port of Xe towards GPUVA is already ongoing.
>> +
>> +As a key measurable result, Xe needs to be aligned with the GPU VA and working in
>> +our tree. Missing Nouveau patches should *not* block Xe and any needed GPUVA
>> +related patch should be independent and present on dri-devel or acked by
>> +maintainers to go along with the first Xe pull request towards drm-next.
>> -- 
>> 2.41.0
>>
> 

