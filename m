Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2034BC07D5B
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 19:55:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C589410E0BD;
	Mon, 27 Nov 2023 19:55:00 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD7E310E0AB
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 19:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701114895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+viejdGrXzmIzPjCsTE2dERIUwjgFpRXidRJ+El7Zb0=;
 b=BknhSvk1bgLbumk0hFUIZx6/dCZScvUq0ppNkgOP8+Kjoa4UndPU5ibEyDauHailES6FqK
 zJchlVl8npR7LM1NoLOr4AQzEmi8kZbyWDg17xMlGfToc82Xz5J9nkE543bFXSFVNLGvdk
 7IHLQnNLpU3z4TdjLAzZUiiPuV7qc1k=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-7wlVD1hYPVOhNzkePwBFEA-1; Mon, 27 Nov 2023 14:54:54 -0500
X-MC-Unique: 7wlVD1hYPVOhNzkePwBFEA-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-a01e91673ecso356276566b.1
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 11:54:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701114893; x=1701719693;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+viejdGrXzmIzPjCsTE2dERIUwjgFpRXidRJ+El7Zb0=;
 b=YS6vFtqVxf3GsxiOzosdHUQBzbM0PC4Pull1Ogcj6EQXDHi6bU1BlyecvD2IocvcX5
 4uL8r6OMrPWhkkvubQ3U5hUn+FKca20hJXi5Op6sR6/Ub1HiDrLmjtij3HTI1MUI62g8
 a7O2NJyok8ce2wYrbeky1edivbcUws0HSXzkURMxjrzFlXqVvfkRFFuEv7GDoKg3SYdl
 1IESQX14HkcH4g3jj4WJYLX2wR4pQ7fp0SE7jkvAKK9LBw9WQ+qR3tnd4EJBPOIbMXod
 z0XXaDRzbKYplFElRAIv+f02OyuuNwYuAzjxknCR5auZvhBPBqH0+xrT3IfE1q50zZa/
 W3UQ==
X-Gm-Message-State: AOJu0YzTU+x9ZuOhoKe1eIw5I7mB+JoR58sLprvTAXYmvOgUNcol2lhC
 57AmpyglWFDZz3+CH2EKXJU9VPUpfIkyhCiRuXoIDjs6Q9x+WI/alPVqG3OK/HAfqyb21C6xIGT
 vzAxI66iz60axhi0RH5sZhzFo9UtCWql7LcQ=
X-Received: by 2002:a17:907:c708:b0:9b2:d78c:afe9 with SMTP id
 ty8-20020a170907c70800b009b2d78cafe9mr12510222ejc.49.1701114893235; 
 Mon, 27 Nov 2023 11:54:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqsjQCsAPoPOd6g0Qn1BKTS65cz8ECHJlGNLkABKEDrEEApBu5Jji0dCbisefe04GfKIqPgw==
X-Received: by 2002:a17:907:c708:b0:9b2:d78c:afe9 with SMTP id
 ty8-20020a170907c70800b009b2d78cafe9mr12510207ejc.49.1701114892974; 
 Mon, 27 Nov 2023 11:54:52 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 e27-20020a1709062c1b00b009fda627abd9sm5988845ejh.79.2023.11.27.11.54.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Nov 2023 11:54:52 -0800 (PST)
Message-ID: <6a30b834-fa29-41aa-bf91-4ab887dc2a56@redhat.com>
Date: Mon, 27 Nov 2023 20:54:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
References: <20231121104046.3201-1-thomas.hellstrom@linux.intel.com>
 <20231121145619.7e7cb541@collabora.com>
 <574ec6bd-22ff-ec66-0bfe-35b51b7142f6@linux.intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <574ec6bd-22ff-ec66-0bfe-35b51b7142f6@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v5] Documentation/gpu: VM_BIND locking
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
Cc: Francois Dugast <francois.dugast@intel.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 11/22/23 08:49, Thomas Hellström wrote:
> 
> On 11/21/23 14:56, Boris Brezillon wrote:
>> On Tue, 21 Nov 2023 11:40:46 +0100
>> Thomas Hellström <thomas.hellstrom@linux.intel.com> wrote:
>>
>>> Add the first version of the VM_BIND locking document which is
>>> intended to be part of the xe driver upstreaming agreement.
>>>
>>> The document describes and discuss the locking used during exec-
>>> functions, evicton and for userptr gpu-vmas. Intention is to be using the
>>> same nomenclature as the drm-vm-bind-async.rst.
>>>
>>> v2:
>>> - s/gvm/gpu_vm/g (Rodrigo Vivi)
>>> - Clarify the userptr seqlock with a pointer to mm/mmu_notifier.c
>>>    (Rodrigo Vivi)
>>> - Adjust commit message accordingly.
>>> - Add SPDX license header.
>>>
>>> v3:
>>> - Large update to align with the drm_gpuvm manager locking
>>> - Add "Efficient userptr gpu_vma exec function iteration" section
>>> - Add "Locking at bind- and unbind time" section.
>>>
>>> v4:
>>> - Fix tabs vs space errors by untabifying (Rodrigo Vivi)
>>> - Minor style fixes and typos (Rodrigo Vivi)
>>> - Clarify situations where stale GPU mappings are occurring and how
>>>    access through these mappings are blocked. (Rodrigo Vivi)
>>> - Insert into the toctree in implementation_guidelines.rst
>>>
>>> v5:
>>> - Add a section about recoverable page-faults.
>>> - Use local references to other documentation where possible
>>>    (Bagas Sanjaya)
>>> - General documentation fixes and typos (Danilo Krummrich and
>>>    Boris Brezillon)
>>> - Improve the documentation around locks that need to be grabbed from the
>>>    dm-fence critical section (Boris Brezillon)
>>> - Add more references to the DRM GPUVM helpers (Danilo Krummrich and
>>>    Boriz Brezillon)
>>> - Update the rfc/xe.rst document.
>>>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Still have a few comments (see below), and in general, I find some
>> sentences very long, which has the tendency of confusing me (always
>> trying to figure out what was the main point, what the pronouns are
>> referring to, etc). Anyway, I think it's better to have something
>> imperfect than nothing at all, so here is my
>>
>> Reviewed-by: Boris Brezillon <boris.brezillon@collabora>
>>
>> Feel free to add it even if you decide to ignore my comments.
> 
> Thanks for reviewing, Boris!
> 
> I'll make a final version incorporating much of the comments and suggestions, much appreciated.
> 
> I still think, though, that in principle the referral between gpuvm and this document should be the other way around, or it should all sit in gpuvm. In any case this is an initial version and as more comments and suggestions land, we can certainly update.

I think if we agree that GPUVM should be the common component that we recommend
drivers to use, we should reference to GPUVM whenever possible. However, I'm not
sure whether we'd want to dedicate *all* documentation to GPUVM. Since the topic
is rather complex, I can see that it might be beneficial to do both, discuss it
from a more abstract point of view and document the corresponding common component.

Reviewed-by: Danilo Krummrich <dakr@redhat.com>

> 
> Thanks,
> 
> Thomas
> 

