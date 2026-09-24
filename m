Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B05EC9830D
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 00:10:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CFAA10E4A4;
	Thu, 24 Sep 2026 00:10:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IYdpj11J";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65BCA10E4D5
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 00:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790208649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zQq8mahuuqrFopJghWcTwTNWIgqjB8mu7IEWM1TnLbs=;
 b=IYdpj11Jlb6NkP1oYpLkTcneXGzMc/pjKioFaaTs6ilZnosPz0KmoA0qljHa4kRYTYg6s5
 iMp1YBcxjBn3Sw48m1nB+m4ZU3nu9CtnBa/LnDAOuUpWzCcEzFp3DMVsAEMAem67kSDalo
 tiXQau2HMBIwUcJimp6IjD1f0kP0jaw=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-250-bIe2x0YpPLiIvYK3NjPylg-1; Wed, 23 Sep 2026 20:10:47 -0400
X-MC-Unique: bIe2x0YpPLiIvYK3NjPylg-1
X-Mimecast-MFC-AGG-ID: bIe2x0YpPLiIvYK3NjPylg_1790208646
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-5b4b009f0e7so897657e87.3
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Sep 2026 17:10:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790208646; x=1790813446;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zQq8mahuuqrFopJghWcTwTNWIgqjB8mu7IEWM1TnLbs=;
 b=MQlhVDMyLZ8v2RhWvosDqIT15VbFi92LwL5cVLQXhFjlOIc4rAjaT0p5gj44kflC+M
 NyymekZY6KqdBCVzA9k/OCFj4V7xhe8WdoUUAhH9PP49pk0oKRWj61xzIfAaUSECKk5W
 FETimlL3vJkFf5Wofu7tsJbWlHud1I+1R8w5Wun5bKCb6px11X+euGnhdSsgCBm8ZdYe
 xO9aEwIiQ62AScjQyL1780ZvCDTX/OGixUvx4fxuhOWAJzYBFHdgabWaeIgZM967aTTu
 eqbyAYEYNT8B39qEH+kgJO8+Mk7lpKqsexRqPgDgoUZs/m1kbhJY7PE4pP1hbadYcG0C
 4Jkg==
X-Forwarded-Encrypted: i=1;
 AKwUvByKv/y6d/XxLPIwlEkMml6OYWmwZVuNn60gp0QxAANHb+OyVfHX/orDPJz0nnzt+Z7GY71WQmZaxQ==@lists.freedesktop.org
X-Gm-Message-State: AFuF++lFs4Pn2Tceu7qtqO9H4f5jQuPQZ0qUrbTwGX2TSrULqDtZKwb6
 U23YaSGYYrsSoIyQmGsqCsOs2UkVW3/VOWFO76ktpFxveFmQJ+iSrQTOyZ+LzeaFYfMShKMZadv
 CId/iStRmBWa2c/8afHc/S2pq7BPpmqBPzosiJwwiWo3bm+ATmK40J5QXfFnYpcTEXBs=
X-Gm-Gg: AYBFou1uJRD798DWqgPyrNnF0zkRlkFlcFjhKmUO+20hDpSMzaptUmRfn6tSuMyWvDy
 wPIsg/R1A75xob87z0LkU3LtLUEFdU6tVqyuOje+Him0no4N6tBPzfozc1lfHPLyJynY2UwLeF/
 OFC+jNa8C0NdK2aJdNdKuM4r1b4hE6RcNS7Z/ZhEndlToQRBFgwIzw49XLDJX63X4f3vuoqWy6k
 bxXQc9ZkwfL/NEH2PivLKebjBkdlz9RuvHoRGUsyhrqPxO7j6+AuOPk69ZYh9t/w4/80wJ4YFlv
 AHcDdxDX6K3Gkjul3s/VObnhFoLWkZ/pun4fCsq8QWcQlpnL0pufz/OPUd50WC9qA+VisXUH4+5
 YGHq2szOUyeB0kCV0ZJFjrWngLf6aons=
X-Received: by 2002:a05:6512:6cf:b0:5b6:184c:7daa with SMTP id
 2adb3069b0e04-5b8df09deddmr250418e87.51.1790208646145; 
 Wed, 23 Sep 2026 17:10:46 -0700 (PDT)
X-Received: by 2002:a05:6512:6cf:b0:5b6:184c:7daa with SMTP id
 2adb3069b0e04-5b8df09deddmr250403e87.51.1790208645639; 
 Wed, 23 Sep 2026 17:10:45 -0700 (PDT)
Received: from [192.168.1.86] (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5b8d8552dafsm963966e87.7.2026.09.23.17.10.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2026 17:10:44 -0700 (PDT)
Message-ID: <63211ea4-9eae-4241-8926-9e81334c5f7a@redhat.com>
Date: Thu, 24 Sep 2026 03:10:43 +0300
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
 <5b1d0fa6-d183-446e-bc52-56e0afd3f398@redhat.com>
 <20260923141936.d1f9e5b85355f0bdc6a6ecd2@linux-foundation.org>
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <20260923141936.d1f9e5b85355f0bdc6a6ecd2@linux-foundation.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wAKPQQbxMdIgEAK2O8Z9jCPsBFSTlPY6wSpVoLLMFH0_1790208646
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


On 9/24/26 00:19, Andrew Morton wrote:

> On Wed, 23 Sep 2026 08:29:34 +0300 Mika Penttilä <mpenttil@redhat.com> wrote:
>
>>>> migration). It is also tricky to code correctly. One page table walk
>>>> could costs over 1000 cpu cycles on X86-64, which is a significant hit.
>>>>
>>>> We should be able to walk the page table once, faulting
>>>> pages in as required and replacing them with migration entries if
>>>> requested.
>>> Sounds sensible.
>>>
>>>> Tested in X86-64 VM with HMM test device, passing the selftests.
>>>> For performance, the migrate throughput tests from the selftests
>>>> show similar numbers (within error margin) as unmodified kernel.
>>> But no performance benefits are demonstrated?
>> There are no performance regressions for current tests.
>> Real benefits come if want to do migrate on fault.
>> For migrate on fault today missing pages are collected as not-present and
>> the caller has to fault them and re-run migrate_vma_setup(); folding 
>> HMM_PFN_REQ_FAULT into the collecting walk removes that extra
>> fault+retry round-trip, dropping two page table walks. Page table walks
>> are not cheap. Not to mention simplified implementation for driver.
>> Also, the vma looked up as part of the walk is readily available for
>> migration, eliminating the need for explicit vma lookup - one more
>> performance benefit. Net effect two saved page table walks and
>> one vma lookup.
> It certainly sounds that this series will result in performance
> improvements, but have those improvements been quantified?

Yes I think Alistair mentioned those walks showed clearly in perf traces
in his experiments, and that served as a motivation for this series


>
>> This series also addresses the vanished/reborn page table while
>> collecting problem which can crash current implementation.
> Oh.  I didn't get that message from the v14 changelogs, and crashes in
> the current implementation are not what we want.  In fact, addressing
> those is more important than speeding things up.
>
> Under what circumstances to these crashes occur?  Can/should we we fix
> those in a minimal -stable backportable fashion before moving on to speedups?

It is about races between concurrent MADV_DONTNEED and collecting, where the
collecting arrays overflow if page table is cleared, recycled and reinstantiated
as large page.
I am not sure if there is minimal fix to all the corner cases,
or would it be more like the approach in this series.

--Mika

