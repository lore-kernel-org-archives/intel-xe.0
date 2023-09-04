Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9738EC83F33
	for <intel-xe@archiver.kernel.org>; Mon,  4 Sep 2023 21:32:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F8BE10E409;
	Mon,  4 Sep 2023 21:32:37 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C5D010E408
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Sep 2023 21:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693863154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nhRkXMoYCNeo8HGCMD9oHKpY5o3vL1RRFO5aL/xHKUM=;
 b=ZwpD57dyANJMDVRgebqvU/NlDOzpZ7OO/R2wqjkuh9JXekJ+0hNcHO0cweKy9v2QAya0xr
 o89Qu8b+c3sBULPVOYvVcaihVfgh+gc9wgS8+KghrVbkjcBLEIoZIXgkRZS2nwIYDg/oeM
 DOE+sHekT2SjWG0xFS+b5kDZAsFpeq4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-6-GdvZcvD4MUec9AVCtK-Vng-1; Mon, 04 Sep 2023 17:32:33 -0400
X-MC-Unique: GdvZcvD4MUec9AVCtK-Vng-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-997c891a88dso134655866b.3
 for <intel-xe@lists.freedesktop.org>; Mon, 04 Sep 2023 14:32:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693863152; x=1694467952;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nhRkXMoYCNeo8HGCMD9oHKpY5o3vL1RRFO5aL/xHKUM=;
 b=XZxRwfWkvSp53qeAM73FcxRlxJtJWOQ5KkCklEJc8Ert1DoqkHWJh42eASs1XTsnuk
 sFp2oQduGGosq7eGQKPXrA7Nxza6lEpKArOUMyJj1jghBrqIvahqShREbOCceAYlpbNA
 +UzNv1dUW4voJwDaVz2kd9I0F4V0llSs7+6b5Ff/q8Ltp0kqxtiDmIM4cz15voMJJ/B3
 j2YRBtNOJbDDr7h5Aw31m1nyW6H9EZ1moMsL8Q86Eo3AsKZErA7BfDSvHY7EyaMVNDBk
 J3+lxbOHQpKz2EiEgowgPwPzuy16iBdnRTSKdWcE8x3Y/CvSKYZxSgEGD+Maf0e2tYRj
 apEw==
X-Gm-Message-State: AOJu0YyZ+G/gB/gJOXqYLf1+7HPIJAw8jJR+LJ0281wCON7gPSQAG6Rk
 Bs757zmZjT7L4oFpDn8gaQ5ASZYCmqsQI4/1a7vPKuReI26ofMk3NN1n79qff9NNATlzESJlL/b
 YpMAOQfO+JXlLJ8qRPo0Mp9UIaR4=
X-Received: by 2002:a17:907:58d:b0:9a2:1b6d:eeca with SMTP id
 vw13-20020a170907058d00b009a21b6deecamr7313652ejb.44.1693863152337; 
 Mon, 04 Sep 2023 14:32:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGW2eQ4JT/dEoni0dG2C3NUm3hs7HkAMf8+zXF8J0LTw7OR14+5DGuYh1v0QOlZNmrfwfOApQ==
X-Received: by 2002:a17:907:58d:b0:9a2:1b6d:eeca with SMTP id
 vw13-20020a170907058d00b009a21b6deecamr7313643ejb.44.1693863151982; 
 Mon, 04 Sep 2023 14:32:31 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a1709066d9200b0099b5a71b0bfsm6697809ejt.94.2023.09.04.14.32.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Sep 2023 14:32:31 -0700 (PDT)
Message-ID: <8d38c7a4-03de-a9ed-13a2-3044352392e9@redhat.com>
Date: Mon, 4 Sep 2023 23:32:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org
References: <20230829163005.54067-1-rodrigo.vivi@intel.com>
 <20230829163005.54067-3-rodrigo.vivi@intel.com> <ZPDlqqBghH3FE4HE@intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <ZPDlqqBghH3FE4HE@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 3/4] drm/doc/rfc: Mark DRM_VM_BIND as
 complete.
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
Cc: daniel.vetter@ffwll.ch, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Rodrigo,

On 8/31/23 21:10, Rodrigo Vivi wrote:
> On Tue, Aug 29, 2023 at 12:30:03PM -0400, Rodrigo Vivi wrote:
>> The consensus is for individual drivers VM_BIND uapis with
>> the GPUVA helpers that are already implemented and merged
>> upstream.
>>
>> The merged GPUVA documentation also establish some overall
>> rules for the locking to be followed by the drivers.
> 
> Danilo, do you agree with this?
> if nothing is missing on that front, could you please ack this patch?

I agree with the above, hence:

Acked-by: Danilo Krummrich <dakr@redhat.com>

However, the documentation below seems to be more about a common DRM_VM_BIND IOCTL?
I guess your commit refers to the end where it talks about common VM_BIND helpers.

Otherwise the patch is moving the "DRM_VM_BIND" paragraph somewhere below the
"Dev_coredump"paragraph. Is there some kind of "Done-Section" I'm missing?

- Danilo

> 
>>
>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>   Documentation/gpu/rfc/xe.rst | 34 +++++++++++++++++-----------------
>>   1 file changed, 17 insertions(+), 17 deletions(-)
>>
>> diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
>> index bf60c5c82d0e..a115526c03e0 100644
>> --- a/Documentation/gpu/rfc/xe.rst
>> +++ b/Documentation/gpu/rfc/xe.rst
>> @@ -106,23 +106,6 @@ our tree. Missing Nouveau patches should *not* block Xe and any needed GPUVA
>>   related patch should be independent and present on dri-devel or acked by
>>   maintainers to go along with the first Xe pull request towards drm-next.
>>   
>> -DRM_VM_BIND
>> ------------
>> -Nouveau, and Xe are all implementing ‘VM_BIND’ and new ‘Exec’ uAPIs in order to
>> -fulfill the needs of the modern uAPI. Xe merge should *not* be blocked on the
>> -development of a common new drm_infrastructure. However, the Xe team needs to
>> -engage with the community to explore the options of a common API.
>> -
>> -As a key measurable result, the DRM_VM_BIND needs to be documented in this file
>> -below, or this entire block deleted if the consensus is for independent drivers
>> -vm_bind ioctls.
>> -
>> -Although having a common DRM level IOCTL for VM_BIND is not a requirement to get
>> -Xe merged, it is mandatory to enforce the overall locking scheme for all major
>> -structs and list (so vm and vma). So, a consensus is needed, and possibly some
>> -common helpers. If helpers are needed, they should be also documented in this
>> -document.
>> -
>>   ASYNC VM_BIND
>>   -------------
>>   Although having a common DRM level IOCTL for VM_BIND is not a requirement to get
>> @@ -230,3 +213,20 @@ Later, when we are in-tree, the goal is to collaborate with devcoredump
>>   infrastructure with overall possible improvements, like multiple file support
>>   for better organization of the dumps, snapshot support, dmesg extra print,
>>   and whatever may make sense and help the overall infrastructure.
>> +
>> +DRM_VM_BIND
>> +-----------
>> +Nouveau, and Xe are all implementing ‘VM_BIND’ and new ‘Exec’ uAPIs in order to
>> +fulfill the needs of the modern uAPI. Xe merge should *not* be blocked on the
>> +development of a common new drm_infrastructure. However, the Xe team needs to
>> +engage with the community to explore the options of a common API.
>> +
>> +As a key measurable result, the DRM_VM_BIND needs to be documented in this file
>> +below, or this entire block deleted if the consensus is for independent drivers
>> +vm_bind ioctls.
>> +
>> +Although having a common DRM level IOCTL for VM_BIND is not a requirement to get
>> +Xe merged, it is mandatory to enforce the overall locking scheme for all major
>> +structs and list (so vm and vma). So, a consensus is needed, and possibly some
>> +common helpers. If helpers are needed, they should be also documented in this
>> +document.
>> -- 
>> 2.41.0
>>
> 

