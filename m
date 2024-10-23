Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B505CF539E
	for <intel-xe@archiver.kernel.org>; Wed, 23 Oct 2024 15:26:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C3CB10E373;
	Wed, 23 Oct 2024 15:26:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ALF4GfAx";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C69F10E373
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Oct 2024 15:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729697175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sUh0g17SqyKPeTvfCPnxLjLxXG/Lptz+4Dsb0wobQHw=;
 b=ALF4GfAxMYSAwmb0MscpgT5ycslvdxMrN8zR3YIBd989d+t20P9u+9ZQvRpiXeGLpqEbPG
 UtKLkYUum/IXa+gkXDmtjM02sCaBEx17LhIUpOQDCG0BCzxl/+EK07JYvtjCbn/o7YKKK2
 m0y/UASML+vozj/yLuBPYK9EaLCcyaY=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-124-KM5dajSzP82vEc1vQNXo7Q-1; Wed, 23 Oct 2024 11:26:13 -0400
X-MC-Unique: KM5dajSzP82vEc1vQNXo7Q-1
Received: by mail-ot1-f72.google.com with SMTP id
 46e09a7af769-710cbc3ddfcso6602731a34.2
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Oct 2024 08:26:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729697173; x=1730301973;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:user-agent:mime-version:date:message-id:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sUh0g17SqyKPeTvfCPnxLjLxXG/Lptz+4Dsb0wobQHw=;
 b=gAgrWGhMnHsplQMlrR0HddRqvNPmRhPLJl3b6plj0z9L108kXaeY9EbyyICfnp0QZo
 RmmTuXnSFeFCaDsNsed4t82TQupWV15ZoQvYfLmwrcO53S/MHRsCzeJ1R1cNRK5OIQjj
 7pm9f+T+m9PLkufYlFrQOC/itWTGhtIn535O2WrsUKzWaPcpzrdUjBqHEhGjbHnEigyl
 R9nBKUHzNgrFz2ZwRPcI5uAk/oAY+hOpx+7j7Ke7mItSZc/yL82sYqpcfX3/XD4emXa4
 dp3ns5ZM5b2vq6v4YjbQ43emIKCiGjzrQa/l0oqAfILCKnihU8Prao+JN8uS7RTM09G8
 ijbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXVDJP8vWIPlxQLxGLK6iFIi0AP/g8CymLXewFhVsdFT77RAFkZCalh7B9cMqIN/EmwIiuK776SA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymFIaAHW7JCmCnBbp9i/PoGBy5ShABzyU3iEFU5lILL+lDqWil
 Wek9m2Bz1C6wRwRHYZnkhVxEeywONj4pUpMvH+m37ZFHtJE9K8cmnCe0YAaxHAsRk5b73w4jxPV
 sI3VAk8+bcZoG648Ls2v9kVGuXldkcgL2Bork6PRLsUiwQO0HYSWGex55qF+eGuUQ
X-Received: by 2002:a05:6830:4428:b0:718:119:ee15 with SMTP id
 46e09a7af769-7184b2d43abmr3322090a34.10.1729697173027; 
 Wed, 23 Oct 2024 08:26:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZ8HZNZZ1NdptD5eLWfYWIKUwYpZpDtDkhL+yfDSXkQRcv/wze/ury8WoK60x0GCFuj5xePQ==
X-Received: by 2002:a05:6830:4428:b0:718:119:ee15 with SMTP id
 46e09a7af769-7184b2d43abmr3322057a34.10.1729697172730; 
 Wed, 23 Oct 2024 08:26:12 -0700 (PDT)
Received: from ?IPV6:2601:188:ca00:a00:f844:fad5:7984:7bd7?
 ([2601:188:ca00:a00:f844:fad5:7984:7bd7])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6ce008fb5e0sm40518826d6.33.2024.10.23.08.26.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Oct 2024 08:26:12 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <813cc1d5-1648-4900-ae56-5405e52926df@redhat.com>
Date: Wed, 23 Oct 2024 11:26:10 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] kernel/cgroup: Add "dev" memory accounting cgroup
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>,
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Friedrich Vock <friedrich.vock@gmx.de>, cgroups@vger.kernel.org,
 linux-mm@kvack.org, Maxime Ripard <mripard@kernel.org>
References: <20241023075302.27194-1-maarten.lankhorst@linux.intel.com>
 <20241023075302.27194-2-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20241023075302.27194-2-maarten.lankhorst@linux.intel.com>
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

On 10/23/24 3:52 AM, Maarten Lankhorst wrote:
> The initial version was based roughly on the rdma and misc cgroup
> controllers, with a lot of the accounting code borrowed from rdma.
>
> The current version is a complete rewrite with page counter; it uses
> the same min/low/max semantics as the memory cgroup as a result.
>
> There's a small mismatch as TTM uses u64, and page_counter long pages.
> In practice it's not a problem. 32-bits systems don't really come with
>> =4GB cards and as long as we're consistently wrong with units, it's
> fine. The device page size may not be in the same units as kernel page
> size, and each region might also have a different page size (VRAM vs GART
> for example).
>
> The interface is simple:
> - populate dev_cgroup_try_charge->regions[..] name and size for each active
>    region, set num_regions accordingly.
> - Call (dev,drmm)_cgroup_register_device()
> - Use dev_cgroup_try_charge to check if you can allocate a chunk of memory,
>    use dev_cgroup__uncharge when freeing it. This may return an error code,
>    or -EAGAIN when the cgroup limit is reached. In that case a reference
>    to the limiting pool is returned.
> - The limiting cs can be used as compare function for
>    dev_cgroup_state_evict_valuable.
> - After having evicted enough, drop reference to limiting cs with
>    dev_cgroup_pool_state_put.
>
> This API allows you to limit device resources with cgroups.
> You can see the supported cards in /sys/fs/cgroup/dev.region.capacity
> You need to echo +dev to cgroup.subtree_control, and then you can
> partition memory.
>
> Co-developed-by: Friedrich Vock <friedrich.vock@gmx.de>
> Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
> Co-developed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>   Documentation/admin-guide/cgroup-v2.rst |  51 ++
>   Documentation/core-api/cgroup.rst       |   9 +
>   Documentation/core-api/index.rst        |   1 +
>   Documentation/gpu/drm-compute.rst       |  54 ++
>   include/linux/cgroup_dev.h              |  91 +++
>   include/linux/cgroup_subsys.h           |   4 +
>   include/linux/page_counter.h            |   2 +-
>   init/Kconfig                            |   7 +
>   kernel/cgroup/Makefile                  |   1 +
>   kernel/cgroup/dev.c                     | 893 ++++++++++++++++++++++++
>   mm/page_counter.c                       |   4 +-
>   11 files changed, 1114 insertions(+), 3 deletions(-)
>   create mode 100644 Documentation/core-api/cgroup.rst
>   create mode 100644 Documentation/gpu/drm-compute.rst
>   create mode 100644 include/linux/cgroup_dev.h
>   create mode 100644 kernel/cgroup/dev.c

Just a general comment.

Cgroup v1 has a legacy device controller in security/device_cgroup.c 
which is no longer available in cgroup v2. So if you use the name device 
controller, the documentation must be clear that it is completely 
different and have no relationship from the device controller in cgroup v1.

Cheers,
Longman

