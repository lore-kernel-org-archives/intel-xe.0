Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F47CC072A2
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 17:02:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB12410E56E;
	Wed, 15 Nov 2023 17:02:26 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D8F10E0F6
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 17:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700067743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8+K02y8E63N7Hl8bfWpAm+o723A4RMPADnx/bCpWAh0=;
 b=XXqTWg2L50diEQohYgsigYPdGsrN5gKSklC5u+wI42xR64YkbrptZtsQqIuG2wpfogwqrS
 wfRvUk9gwEJWxirW3WddrFNDoMzfve+qtIwKylshjtjBXQByECJAsTUxF67lWb5BWRpDqH
 xrMqwewJMITZgm7iqYpuh/y2NM820y4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-398-OBOxpF1TPui53RVL0vU8mA-1; Wed, 15 Nov 2023 12:02:21 -0500
X-MC-Unique: OBOxpF1TPui53RVL0vU8mA-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-9e644d94d85so139480166b.0
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 09:02:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700067740; x=1700672540;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8+K02y8E63N7Hl8bfWpAm+o723A4RMPADnx/bCpWAh0=;
 b=daYSyDmUH4hkDTm+DzfKTlPQkBJV1q8VWqSLzjtQXYjW8NOggMzLftwp3M/kH5TrOn
 6C108V2+CTpHH5Bcp/nOw2UevUsS+Mt0cL4mme6H+BmKr53/T79tenq+07HNlZUW6a9W
 rV8LjumM1LclZPEy/CwlKnSEgGxFhG7PG51N2vq5dtex7QUAgBkAmQ9XESCdOI7QdhsE
 saQNJrL8m6184RfYQdwCoCwwP33G96L00cK7zBWjgF38W1E5rYnDk3z/+vkMvPuPzSRN
 c1VUcdAdHWJuUKEQpYJqbI3/reeJjg2lfiyBM3Opmdh9yTFpTgcp5fd6De7v1XI/V3WS
 x3lA==
X-Gm-Message-State: AOJu0YwpNZ31kaqmITwVnPUx3SMpBhIFvOLK2KJ10EfV3HiaqGBQOvxK
 iurLP+hy7R/Lo7K/tcycjeqvRnP9Ulf4AwEfbFgav2LxSeHY39sJFGpMfzmnZNQMWJ0RnfrR3RH
 rupxCtuCZKYmw4u++nmv46tfnhsM=
X-Received: by 2002:a17:906:7693:b0:9e5:2b00:506f with SMTP id
 o19-20020a170906769300b009e52b00506fmr5192449ejm.15.1700067740238; 
 Wed, 15 Nov 2023 09:02:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmyLGRL3GwYsNwyV1gH7JktmROiYMN6I3Eellr851VhdnrwoZiNzuZ1mX4o6IaWOpV/CLtUA==
X-Received: by 2002:a17:906:7693:b0:9e5:2b00:506f with SMTP id
 o19-20020a170906769300b009e52b00506fmr5192406ejm.15.1700067739689; 
 Wed, 15 Nov 2023 09:02:19 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a1709061b0900b0099bcf9c2ec6sm7283726ejg.75.2023.11.15.09.02.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Nov 2023 09:02:19 -0800 (PST)
Message-ID: <05cf6199-3884-4e46-90ac-0b8df7420af7@redhat.com>
Date: Wed, 15 Nov 2023 18:02:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20231115124937.6740-1-thomas.hellstrom@linux.intel.com>
 <ZVTfmbDz1HGqt4Ef@pollux>
 <62cdf31f6dbbb3a114755affc89d22fde875c3ff.camel@linux.intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <62cdf31f6dbbb3a114755affc89d22fde875c3ff.camel@linux.intel.com>
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
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 11/15/23 17:04, Thomas Hellström wrote:
> Hi, Danilo,
> 
> On Wed, 2023-11-15 at 16:11 +0100, Danilo Krummrich wrote:
>> On Wed, Nov 15, 2023 at 01:49:37PM +0100, Thomas Hellström wrote:
>>> Add the first version of the VM_BIND locking document which is
>>> intended to be part of the xe driver upstreaming agreement.
>>>
>>> The document describes and discuss the locking used during exec-
>>> functions, evicton and for userptr gpu-vmas. Intention is to be
>>> using the
>>> same nomenclature as the drm-vm-bind-async.rst.
>>>
> 
> Thanks for reviewing. I'll update the document accordingly except for
> the s/an rwsem/a rwsem/g, I think it's "an rwsem" similarly to "an r".

I read it as "read-write-sem". Would you read it as "ar-double-u-sem"
then I guess?

> 
> /Thomas
> 

