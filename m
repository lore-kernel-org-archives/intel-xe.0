Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD64C98302
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 05:29:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DCD410EEA9;
	Wed, 23 Sep 2026 05:29:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="e+1vUWUJ";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E5E10E7F2
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Sep 2026 05:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790141390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w2vrYuRJ8qL5kWsy9Tz/qOHqUgXc8+IhHfJ0Nm3O5oI=;
 b=e+1vUWUJzuXaZZOaj+ck6I4B8IkNdBLNwCKHCyuuWSQwx/OMMf790TE1UmDH+sawY1ciBO
 1Kk4cpwnBmL56dfJQdFv/xGXbKCrLyIMkNPsLo5rgxDJe651N4hj32KgQk+BF4GlH4nf66
 GEFnOE8Mp24Bhy5DYU7yrXZwrAlgw5w=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-W7bUDJYLMICkROBmhzmDyQ-1; Wed, 23 Sep 2026 01:29:38 -0400
X-MC-Unique: W7bUDJYLMICkROBmhzmDyQ-1
X-Mimecast-MFC-AGG-ID: W7bUDJYLMICkROBmhzmDyQ_1790141377
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-3a5a3189b6fso2129661fa.3
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Sep 2026 22:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790141377; x=1790746177;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=w2vrYuRJ8qL5kWsy9Tz/qOHqUgXc8+IhHfJ0Nm3O5oI=;
 b=caSxFGe7eObUxVwS7p6RfJyqkTihXFeFbcTDG89qKFJEdLkvLMNchGiGd8z+MnslT/
 CAhxJVyEV6Vu+yPn9PwEUjlE/DRMdWnBwwYKCERtL2xzs63FQQfrI6MtU9uBg92+IPaL
 9HeNarTxwNGWlgi1MrIQqRVkPDG6VnTQC0UJMZ1fJOpk+r9GDLHdYrsPVgJJRTCP3ItI
 qYjX68BIfH13DOIx/JEiTvxRwEmL34+uLKLd5Rte2UyRwOEBfU/o4gS7eZ4AgzgikNmg
 daybJk2T69V9wDoFFBunw7zSVxqc8KHe7R6TzaJIy2PXyb0Lmgp6x4F4p3Juo6TWnqFq
 0SHw==
X-Forwarded-Encrypted: i=1;
 AKwUvBw5lhT3THQDGAhegeb7EdcCruT7HoaTiQE9EIr5bQS1lho/yK9lwv8hUPIQ7TNU0nipYYRJ+rCBdA==@lists.freedesktop.org
X-Gm-Message-State: AFuF++nvf4dzFdtPfDNU3Fj8kZYkI/3i9NOALGYWnWZol5mtqKzP3bnu
 HCh7OLurkSUSdi5lfysRWKkWvLieFoMscLZmrIIBPWC6M2ukbwhW1xNaHGR9zzvq65wXZuEEacD
 yJyjXKx/cDiaM30o8MpAt/vJEejiMlUoML71UURNNFpaLB51wsmSF0xCANbmvBopZLCQ=
X-Gm-Gg: AYBFou0hP3frzp93h9EuctVR6ulA4s59fimw65kM3wE+QO/i6r/y6cwmnIOacyfWCoC
 PcDzpIPBQP/FPhkGU7G9sL80RvBbkhrjn9NCs0b+Gs4EJ6/PYt/e8YGZh87hRzVaB3rkAFdMTvz
 2c7pKqP9/DZctA25K22HdlIYPvXCPTao0A05F9xKyCiwirR2paP/Cstw5C1pWZC9pCVuDpXCVZx
 zkoJQWGJanNZUGXjI22ZP5F1ufSSL7iNWx0aHHuKIWhfJvUgR91Fs6i3/8SV4f0d4V0IBTwF+ZB
 jj7Myl70LqIZDafEH0N+SYXluUyGg2ZhzhTbCTFNIzSF1qi/BN67Pltl4r4PPNFtdWbdsDSLrTq
 WwG+IjwqUCYi+BSr1Pzynsdju++ZMu6w=
X-Received: by 2002:a05:651c:2119:b0:3a1:980f:5907 with SMTP id
 38308e7fff4ca-3a63062bc97mr2957761fa.8.1790141376708; 
 Tue, 22 Sep 2026 22:29:36 -0700 (PDT)
X-Received: by 2002:a05:651c:2119:b0:3a1:980f:5907 with SMTP id
 38308e7fff4ca-3a63062bc97mr2957691fa.8.1790141376203; 
 Tue, 22 Sep 2026 22:29:36 -0700 (PDT)
Received: from [192.168.1.86] (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3a62f507e7bsm3916101fa.22.2026.09.22.22.29.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 22:29:35 -0700 (PDT)
Message-ID: <5b1d0fa6-d183-446e-bc52-56e0afd3f398@redhat.com>
Date: Wed, 23 Sep 2026 08:29:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] [PATCH v14 00/12] migrate on fault for device pages
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 David Hildenbrand <david@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Leon Romanovsky <leonro@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, Zi Yan <ziy@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
References: <20260922053421.4092027-1-mpenttil@redhat.com>
 <20260922192726.90dec3c4c77b8c9063dbf218@linux-foundation.org>
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <20260922192726.90dec3c4c77b8c9063dbf218@linux-foundation.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DZ_iYV5iIK9xqrCJOM-WPcBe_4tGTyot1mUFFNYTBTo_1790141377
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


On 9/23/26 05:27, Andrew Morton wrote:

> On Tue, 22 Sep 2026 08:34:09 +0300 mpenttil@redhat.com wrote:
>
>> From: Mika Penttilä <mpenttil@redhat.com>
>>
>> Currently, the way device page faulting and migration works
>> is not optimal, if you want to do both fault handling and
>> migration at once.
>>
>> Being able to migrate not present pages (or pages mapped with incorrect
>> permissions, eg. COW) to the GPU requires doing either of the
>> following sequences:
>>
>> 1. hmm_range_fault() - fault in non-present pages with correct permissions, etc.
>> 2. migrate_vma_*() - migrate the pages
>>
>> Or:
>>
>> 1. migrate_vma_*() - migrate present pages
>> 2. If non-present pages detected by migrate_vma_*():
>>    a) call hmm_range_fault() to fault pages in
>>    b) call migrate_vma_*() again to migrate now present pages
>>
>> The problem with the first sequence is that you always have to do two
>> page walks even when most of the time the pages are present or zero page
>> mappings so the common case takes a performance hit.
>>
>> The second sequence is better for the common case, but far worse if
>> pages aren't present because now you have to walk the page tables three
>> times (once to find the page is not present, once so hmm_range_fault()
>> can find a non-present page to fault in and once again to setup the
>> migration). It is also tricky to code correctly. One page table walk
>> could costs over 1000 cpu cycles on X86-64, which is a significant hit.
>>
>> We should be able to walk the page table once, faulting
>> pages in as required and replacing them with migration entries if
>> requested.
> Sounds sensible.
>
>> Tested in X86-64 VM with HMM test device, passing the selftests.
>> For performance, the migrate throughput tests from the selftests
>> show similar numbers (within error margin) as unmodified kernel.
> But no performance benefits are demonstrated?

There are no performance regressions for current tests.
Real benefits come if want to do migrate on fault.
For migrate on fault today missing pages are collected as not-present and
the caller has to fault them and re-run migrate_vma_setup(); folding 
HMM_PFN_REQ_FAULT into the collecting walk removes that extra
fault+retry round-trip, dropping two page table walks. Page table walks
are not cheap. Not to mention simplified implementation for driver.
Also, the vma looked up as part of the walk is readily available for
migration, eliminating the need for explicit vma lookup - one more
performance benefit. Net effect two saved page table walks and
one vma lookup.
This series also addresses the vanished/reborn page table while
collecting problem which can crash current implementation.

--Mika

