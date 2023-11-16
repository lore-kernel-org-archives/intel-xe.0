Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E9DC197A0
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 14:02:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62A6D10E5DE;
	Thu, 16 Nov 2023 14:02:26 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DDE210E28C
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 14:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700143343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ify9Vvsur2tjiWibc1WjaPX2nLUPCNROFWZ7Gxf23VI=;
 b=S7bKyr7AkDNfsBCJ4WjHanCDCj1DdD11ijxwc2ZTLcnKdK0k5W2jGIcLZUZIUFOtZoxuLw
 ZHihQGEviF2JonQLCsLb9Ux3/UobRIJ3/R4/FxySlQMysrVe8lhrWdYsdiDm4MFQ6e6JvK
 KzEWRRFnVzcyb579TFx883KCelwJE/M=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-130-2bJIbqy6Nx6WYvyDM4mr8w-1; Thu, 16 Nov 2023 09:02:20 -0500
X-MC-Unique: 2bJIbqy6Nx6WYvyDM4mr8w-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-9e28d82339aso60423366b.2
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 06:02:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700143339; x=1700748139;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ify9Vvsur2tjiWibc1WjaPX2nLUPCNROFWZ7Gxf23VI=;
 b=r+P6eEB82DthE0LtB4hiSs8e8urfFzsjOTEBumWFoLB2Xdwavb4SLdIwkIDXrlI3OC
 d7BaYqxYWhWOesUEcAZY5A+EV3eqgNQ8dxtF3+4JpW5RTMo4/g4IZ627Hd1bZQIa4M/k
 y5LGpulS6S5rNdUmAJO6F/lJcG5jAQJyC/ToMr9rNcMQEJLRIENce0nkhoTAuTPVF/c0
 AOl+i4u+UQdsZB3z+uSyH6m1JmG4r8Z65RmDC5jl59CbMxuHyDcoprQxi+lcRLdVC1eT
 sA8pzNdbyNTPQebVpFZC20Qzpu7O36JQpnRfUXEZCyNrpD1jo7SghDBOLL/th61905uN
 wPcQ==
X-Gm-Message-State: AOJu0Yw6XU8ya/F2BoqbfMsioUN9ntX2jZ2mPZaFcp6CQYMrh6YEWa7E
 sBy5NoxDDWVYKB1p/ltDmKVZHIWx72Z8eh6tSBES2cqhHzrsqcljJG5mm2g77rZVn+YOG7vPnOi
 8gW0+Sy6ECd6UkgBuHK5hYLm9l+w=
X-Received: by 2002:a17:906:e20c:b0:9e0:4910:1665 with SMTP id
 gf12-20020a170906e20c00b009e049101665mr10183253ejb.29.1700143339105; 
 Thu, 16 Nov 2023 06:02:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH4pGsJb2OCA8cUb6M3QJESft2ul7MzFcR4nU6hjfBuLpwW0QUNLAHidXjV+1Rf6jlYCJQBRQ==
X-Received: by 2002:a17:906:e20c:b0:9e0:4910:1665 with SMTP id
 gf12-20020a170906e20c00b009e049101665mr10183242ejb.29.1700143338774; 
 Thu, 16 Nov 2023 06:02:18 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 mb8-20020a170906eb0800b009bf7a4d591csm8606474ejb.11.2023.11.16.06.02.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Nov 2023 06:02:18 -0800 (PST)
Message-ID: <c129fa94-6456-4746-9477-737a0fb61f96@redhat.com>
Date: Thu, 16 Nov 2023 15:02:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
References: <20231115124937.6740-1-thomas.hellstrom@linux.intel.com>
 <20231116104851.114bdb08@collabora.com>
 <0850281b667c4b88163dab60737dbc945ad742fd.camel@linux.intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <0850281b667c4b88163dab60737dbc945ad742fd.camel@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v4] Documentation/gpu: VM_BIND locking
 document
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
Cc: Francois Dugast <francois.dugast@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 11/16/23 12:48, Thomas Hellström wrote:

<snip>

>>> +Locks used and locking orders
>>> +=============================
>>> +
>>> +One of the benefits of VM_BIND is that local GEM objects share the
>>> gpu_vm's
>>> +dma_resv object and hence the dma_resv lock. So even with a huge
>>> +number of local GEM objects, only one lock is needed to make the
>>> exec
>>> +sequence atomic.
>>> +
>>> +The following locks and locking orders are used:
>>> +
>>> +* The ``gpu_vm->lock`` (optionally an rwsem). Protects how the
>>> gpu_vm is
>>> +  partitioned into gpu_vmas. It can also protect the gpu_vm's list
>>> of
>>> +  userptr gpu_vmas. With a CPU mm analogy this would correspond to
>>> the
>>> +  mmap_lock.
>>
>> I don't see any drm_gpuvm::lock field in Danilo's latest patchset,
>> so,
>> unless I missed one version, and this lock is actually provided by
>> drm_gpuvm, I would mention this is a driver-specific lock. This
>> comment
>> applies to all the locks you describe here actually (mention which
>> ones
>> are provided by drm_gpuvm, and which ones are driver-specific).
> 
> These will be needed also by gpuvm when implementing userptr vmas, so I
> can mention that drm_gpuvm is currently lacking a userptr
> implementation, so "the locks described below are to be considered
> driver-specific for now"

Since Xe already implements userptr support, are you guys maybe interested
in extending drm_gpuvm accordingly? :-)

