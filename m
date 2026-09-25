Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D28C9830D
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 13:22:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2690E10FA8F;
	Fri, 25 Sep 2026 13:22:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fOKfPt2k";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A88E10FA9F
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 13:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790342544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mfp85Na3VIvxFepbe+2FVNLR998tfGijRwpOnXjXS0E=;
 b=fOKfPt2k/qkngRrNihgEPzV+PiFb3us9Y3/uhFjMZ1TdRd3BmG+M0oag/GpTFq7R6JyCkM
 nY45gWV1lPCbKIBOvDkm2/XSodcCTqlJLPz4K7ZHGOcU2wezsvP/3R90SlndcwzSHfwzSH
 tWy7KSCpXER0hwV0VpWlVtHWNBbQw6c=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-601-PC88VUtQPpaqP1KfeBKNhg-1; Fri, 25 Sep 2026 09:22:23 -0400
X-MC-Unique: PC88VUtQPpaqP1KfeBKNhg-1
X-Mimecast-MFC-AGG-ID: PC88VUtQPpaqP1KfeBKNhg_1790342541
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-5b5e279489dso596252e87.3
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 06:22:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790342541; x=1790947341;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Mfp85Na3VIvxFepbe+2FVNLR998tfGijRwpOnXjXS0E=;
 b=jMGVsF8ah1vFwWp2SRIoLcsTDeX5vA3Ud8dwy2X1KQY6jRwjhTCiOrUneSEdOLlr+i
 xbCRLTf5xZTO1oKqh6UXGESL7h+oRBKV+miAGfWowt2Av3SQhgVhxCXmhSuwx0cXfTe9
 N/HCnvka2MGFgIUbJZreHMnHvFU08faAGuxGjYnwDcWk6olruAQTG4XJfpXQ15zqq7Ol
 Ec1MASQ97sRPczqI5HIa4dDzIEQvFjblxgMbRHkIetBXHNxn/5ckP+SLueoQ69Yh6n43
 iZin3zc9KzlgFwTDqGeAwR3J1OZENIoABHoX/qMzO9Zq4LDLAbJke0ZwNcC3nAIGNFh6
 4uDw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxtto79iX0mianf3t3/DRIatPyef2dq/Dec+i2vxWElxe7lPYvua3n07qhQ5SWO65mJRnkBt3t7Tw==@lists.freedesktop.org
X-Gm-Message-State: AFuF++nMaZ4rSNl0PBAnvCUPktuKg9wfW/PwyN47uVwx82vgyrB2Jam8
 kNYbvVeDuEIbfMp0SQPa2952Vgp4kPNlUeeQdjIiRwyCmtlJDAHUldbyR0aIjcXTlMGdpemBQwF
 C8348aMZ/wwjkLwAV7zCeVrz8Bm9y01D7XAfnkdd0cc1+FMMdtgkIGMYxD3e9Z3sEzM4=
X-Gm-Gg: AYBFou3gIdthCl4Xzmbo6ALu9bI4rg3qecwynijh5C5jUY9bW+M3NGGN5JZuGwHIFK5
 P5aFqyzXIjzYZlXe58l9iGvAS0YJOBOXD+ZgOs59DxXAQI+BABxggx0l59ocz06LIdv+Whhdx9h
 rMaHqX/LZSz/GxPxOD8rnHqdR9HOfZ0S6Ek6FkrGtIOBqL94yXK4SORv3hFZJjwTM4GuME50aP9
 rNk4HS9to4OlnWz2Dl16snZ5x17pNSFapVZApQDxz+KRHK1rXbWvaDIuKx1aivdNa/7BnZKNU+a
 Ss0w9N2/HicOoMP+x2b72P/tYwl8n/ZSZDWK7uwvysGgeWQTnN5ZcBMTH3XWr6nOSlOIIrJI4tT
 VkjJYJQMtbZxhqHD5ogL0A/CjVc2W404=
X-Received: by 2002:a05:6512:3e10:b0:5b1:121e:56c2 with SMTP id
 2adb3069b0e04-5b8e6b36729mr733461e87.0.1790342541330; 
 Fri, 25 Sep 2026 06:22:21 -0700 (PDT)
X-Received: by 2002:a05:6512:3e10:b0:5b1:121e:56c2 with SMTP id
 2adb3069b0e04-5b8e6b36729mr733437e87.0.1790342540724; 
 Fri, 25 Sep 2026 06:22:20 -0700 (PDT)
Received: from [192.168.1.86] (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3a64c2ea5d2sm5510451fa.18.2026.09.25.06.22.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Sep 2026 06:22:18 -0700 (PDT)
Message-ID: <f7cc0ac3-729e-435e-9062-3317d0a6517b@redhat.com>
Date: Fri, 25 Sep 2026 16:22:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 00/11] migrate on fault for device pages
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Hildenbrand <david@kernel.org>,
 Leon Romanovsky <leonro@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, Zi Yan <ziy@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
References: <20260924065313.899730-1-mpenttil@redhat.com>
 <arY5zKsLuf7f_EYw@infradead.org>
 <65c5c412-56a7-46a9-b22b-22077a8e9727@redhat.com>
 <20260925124737.GL9354@nvidia.com>
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <20260925124737.GL9354@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ord_7D_daFS9RRTTL6bokebqPXDZ_M4MBQEu2ztPajk_1790342541
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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


On 9/25/26 15:47, Jason Gunthorpe wrote:
> On Fri, Sep 25, 2026 at 01:23:52PM +0300, Mika Penttilä wrote:
>> On 9/25/26 12:07, Christoph Hellwig wrote:
>>> Who is going to use this? The series seems to lack an actual user
>>> for it. 
>> Two users: For one, existing migrate_vma_setup() callers, unchanged.
>> The series reworks migrate_vma_setup() to collect via
>> hmm_range_fault() internally (it sets HMM_PFN_REQ_MIGRATE and calls
>> migrate_hmm_range_setup(), mm/migrate_device.c). So every in-tree
>> migrate_vma consumer — nouveau, amdgpu/amdkfd, drm/xe via
>> drm_pagemap, lib/test_hmm — runs on the new path. 
> So split the series so you don't add unused interfaces for now? Jason

I think we get the other for "free", migrate_vma_setup() ->
hmm_range_fault() is the now used. But if wanted you can drive the
migration initially from  hmm_range_fault()  also from fault handler. If
don't want that then it's removing 
EXPORT_SYMBOL(migrate_hmm_range_setup);

--Mika


