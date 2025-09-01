Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B657ACA0FF0
	for <intel-xe@archiver.kernel.org>; Mon,  1 Sep 2025 12:25:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD4D10E436;
	Mon,  1 Sep 2025 12:25:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="KtnYb5uJ";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 896B710E433
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Sep 2025 12:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756729520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Ry3HTsvjDYn6ZhWkEuXZ7HIdFuNl7/b7zLeVSRNzby4=;
 b=KtnYb5uJNuYbVShR69/DjtZuclqjN2xx0tP7J9/fF3OrSWf8uHuvGdoxw6qcfmcrfFXF6E
 Q/6hZCafpuo74QZU2N1wq7yq+4MBYe/MXriIuyMmdItgrx6KzeftQn74GNS5uKtzQh7sAP
 ADnH9H725o1mu+ZZZcw2QMT6zSsZtzY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-446-ORCS8K3rMN-9XEG-WJXn6g-1; Mon, 01 Sep 2025 08:25:19 -0400
X-MC-Unique: ORCS8K3rMN-9XEG-WJXn6g-1
X-Mimecast-MFC-AGG-ID: ORCS8K3rMN-9XEG-WJXn6g_1756729517
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45b467f5173so41969445e9.3
 for <intel-xe@lists.freedesktop.org>; Mon, 01 Sep 2025 05:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756729517; x=1757334317;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ry3HTsvjDYn6ZhWkEuXZ7HIdFuNl7/b7zLeVSRNzby4=;
 b=hkseeID6Z0s8rGlmz+kaKPrFEHGxvExftK0C0PHi6cfjkRcWVGP+vLNuEP5Hc2YvpD
 4TrT95Ce2y8foc15Y03+Q0RAh6VcrsEmKzt89RmweKRoPwIteRdoUSyszDTYP+CCcqDS
 tNXNHAwVF0ZnT8q9/p/XVOhU9He4gahLdKCJSzYBVg/WKVfl271zcuk74hyRR+8lqUiB
 JZLTJosn1GIw2tPOYQMYMzxvjyjJ+NyuiUHWwXpTqIlGS59IWyBxpDBE42Xb/SuMz1HZ
 IU4o7KzojZVYBtJ9PvHeVMQDUnKhqwFokzg4Xv31pFlJpQiR4gnVv22GdyZpPgkP6tqM
 uKuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtmYNib2XlyZSWnRuZOtZCqkIU5MWEnsMb/7TJt3ISGC1XKhH/vI+sfH45ys3eaRPNgIKcRDyfEA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPQPd5Vcwcb7OWH/CVEvsvWJEZonbEP+7RQ69zSCWE1TgvkC7q
 QCxeNitKQgVpSSXFONQTBOOlpkuJdTB+49MzFq9d0YVS0QZhTt4CYUtK7IlpUeAJP+inmCNuE4Y
 30J4k93kRUKqK7+swsnU27PNu4Ypx5tHwz1YwTwZgJWaOEWzJbCngEfdx6ClP9uRDB2Kk
X-Gm-Gg: ASbGncsH6ADqTQTv4tVQ8BcF79oRdCmW1qrDMW+BUjZi1t7kK0kaYe8/dcvJOSzdypx
 UUtdtjYEWwIHjIVS1WbYT6VZCqj/WRZtzKYFld6u0ynmyi5OCwRcmtGjoTc7VFWDrD732iSMeTT
 Z3C5ESoxdLRawpLi3cg+SCwdJFFCBdtmigYKENNhjAb9TR/2QRDb2+Vh04KBZetltkaLWoPiUAE
 cEsC9SctRLSKvUKo/ydlMWJhTBJULoEXxoXA5iDxXCwKTSkQA1hRdf1OzzksA7bysLgcjsGD414
 QL3troNAxroWF/fw73y0ii82U44cj4S43Cq1GCewtZb6kbsJ5Q5TWe1uO8CKFcOFRqXS1YAal4F
 Zy8kVMAu3d4G/f7s7EFUoMd19kykZNt5R65HVorgunwBriimS4haGFSEnYMqYDmZmFQo=
X-Received: by 2002:a05:600c:1e89:b0:45b:88ed:9558 with SMTP id
 5b1f17b1804b1-45b88ed9bc3mr51982155e9.30.1756729517125; 
 Mon, 01 Sep 2025 05:25:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMGDtOgsZk0c5UDFaUJZJgP3BXCuLTMzz4/00ieMVST2ui2ccALyIM8NlgAkQyyG7Klnzysg==
X-Received: by 2002:a05:600c:1e89:b0:45b:88ed:9558 with SMTP id
 5b1f17b1804b1-45b88ed9bc3mr51981875e9.30.1756729516581; 
 Mon, 01 Sep 2025 05:25:16 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f37:2b00:948c:dd9f:29c8:73f4?
 (p200300d82f372b00948cdd9f29c873f4.dip0.t-ipconnect.de.
 [2003:d8:2f37:2b00:948c:dd9f:29c8:73f4])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6f0c6dc1sm237238175e9.1.2025.09.01.05.25.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 05:25:15 -0700 (PDT)
Message-ID: <dc21e54c-d7ae-4d7e-9acb-6a3fa573b20f@redhat.com>
Date: Mon, 1 Sep 2025 14:25:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/3] cgroups: Add support for pinned device memory
To: Maarten Lankhorst <dev@lankhorst.se>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?=27Thomas_Hellstr=C3=B6m=27?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 Natalie Vock <natalie.vock@gmx.de>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?=27Michal_Koutn=C3=BD=27?=
 <mkoutny@suse.com>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "'Liam R . Howlett'" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: Michal Hocko <mhocko@suse.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 cgroups@vger.kernel.org, linux-mm@kvack.org
References: <20250819114932.597600-5-dev@lankhorst.se>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20250819114932.597600-5-dev@lankhorst.se>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QJPS_Nyhsp4FFwTWgGbUDCd-oyTmC-9cHIdW0riHQkA_1756729517
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

On 19.08.25 13:49, Maarten Lankhorst wrote:
> When exporting dma-bufs to other devices, even when it is allowed to use
> move_notify in some drivers, performance will degrade severely when
> eviction happens.
> 
> A perticular example where this can happen is in a multi-card setup,
> where PCI-E peer-to-peer is used to prevent using access to system memory.
> 
> If the buffer is evicted to system memory, not only the evicting GPU wher
> the buffer resided is affected, but it will also stall the GPU that is
> waiting on the buffer.
> 
> It also makes sense for long running jobs not to be preempted by having
> its buffers evicted, so it will make sense to have the ability to pin
> from system memory too.
> 
> This is dependant on patches by Dave Airlie, so it's not part of this
> series yet. But I'm planning on extending pinning to the memory cgroup
> controller in the future to handle this case.
> 
> Implementation details:
> 
> For each cgroup up until the root cgroup, the 'min' limit is checked
> against currently effectively pinned value. If the value will go above
> 'min', the pinning attempt is rejected.
> 
> Pinned memory is handled slightly different and affects calculating
> effective min/low values. Pinned memory is subtracted from both,
> and needs to be added afterwards when calculating.

The term "pinning" is overloaded, and frequently we refer to 
pin_user_pages() and friends.

So I'm wondering if there is an alternative term to describe what you 
want to achieve.

Is it something like "unevictable" ?

-- 
Cheers

David / dhildenb

