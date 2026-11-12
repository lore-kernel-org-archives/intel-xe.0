Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB5B606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 14:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R9FMzlXD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EE4689BE8;
	Thu, 12 Nov 2026 14:47:59 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD15789BE8
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 14:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1794494872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zZkO3ck5ylqqxi0UIrlQRRScttZ5TDTGZ/TrwmDCCvM=;
 b=R9FMzlXDIvRr8XH+8axpIw+WHDRE+9oLLs4qTPzYDW1bDYuTG7LN87zB4XMv1sXkVKsk+L
 Hp4K24kQg4zr1UEzXuADdVI9r5A7Jg4f+97WE7ipqSOkcwyF4z2kuLUO/A6qUyTyFIMTBm
 lGwLjhEo9mpHVb1BP2kVu7YganZ6YYE=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-499-sbjPe9HMOR-2QdPpdvTtfA-1; Thu, 12 Nov 2026 09:47:47 -0500
X-MC-Unique: sbjPe9HMOR-2QdPpdvTtfA-1
X-Mimecast-MFC-AGG-ID: sbjPe9HMOR-2QdPpdvTtfA_1794494866
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-5c14d60d336so2486604e87.3
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 06:47:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794494866; x=1795099666;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zZkO3ck5ylqqxi0UIrlQRRScttZ5TDTGZ/TrwmDCCvM=;
 b=oFW9X9/Att4rBkQ2rKEvvHPVKBBuaFCp1ZMauMI0NuPYUJ/OHfd8Pxfg8EAJ5HC4G8
 Io6/DKAgUiVVHLke0v5NSJhNpspeV8Gt7jPhZSxef5vV5gft/f2nYnU8klavtDNWyyAS
 EWVL/M15N8NiP5bgCZNXGjaP+6r1+ASNiB8kI5R/pMiED5X4wAcTdiSfc3F8WBjFIuUW
 DfUrxli6YwvCKOgULQIaOM3bG7pcP19ww5v+lcjaEONDw5h53tJ+TmcU+Yrhdt5ua3dQ
 0p8wN7ujzr0MjyBBmXHdYW9S027uxQUoV5J57mr252tEc6gu7lCBSn1Up9tCybFt7Uxe
 hB0w==
X-Forwarded-Encrypted: i=1;
 AL+hErGRtrc2IQj2/NMOI6gzYY6cj4JlwlwzBLTmaDXSfCPNmhAB2wzNrjKnNl5RFHbyQO7FSF4KwWnkmw==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z9U+pHrdFBdZrGsX2bLILRyBmRpcRZREd8B/wqgBfPLPIQW9sSd
 X4meuxiKkHFu//41mKrKzlctf5liTvsUtJoa3m9Y1wDV5B5nY1r2Syriz6sJ9jFwW+x6z5d/DJ3
 cFO8VsXNwWCYMw/4ee9biggb1cyllQNX2RltB1OMa9NKtzpCNRF+PS3S++DyihvDHnvM=
X-Gm-Gg: AYBFou3cYCHlCWRxcjfbCw+0wJNdf4u3w1lLA6TYKSKMwmp4rNwUO3GknaPrkPO3KeO
 RCDBq8ggXY9+HB7F4HgRcThk5S/WzEjPhCtVGyQltrmS1wZTgVpz4zP7vx0mHDddENZNTqXknFo
 TWwgIiI0arOefLC5qE8hgih+wu6XGlD7oTPo7/pwy1nPIjOYrDwYUIIli/OrpQtaGJ74gr9dJfJ
 NOhlJ743HbCbgdPZNidoxXzYoz9J+XODbyyNZw18SXjARXWe8cQ84ZckqzaBFFm/8siVVXiLk1K
 T5QYKyw2KpHn9PvxfTBanAlKwkYkFMk6QI9ZzH3FfZz1tyhkqSWWTsNWxPlfXoSxlGtKhhBX1Kg
 i6w0Pl9acK6tO9Ahqo9OQhVMZzs0jjy+vCUfO+lkN1vf0tsk1aSGX3ZyfaHhvdcfMC+oi6JN8e6
 dLGXZ+
X-Received: by 2002:a05:6512:2524:b0:5c1:57ee:1887 with SMTP id
 2adb3069b0e04-5c15d62c702mr2219384e87.13.1794494866126; 
 Thu, 12 Nov 2026 06:47:46 -0800 (PST)
X-Received: by 2002:a05:6512:2524:b0:5c1:57ee:1887 with SMTP id
 2adb3069b0e04-5c15d62c702mr2219357e87.13.1794494865616; 
 Thu, 12 Nov 2026 06:47:45 -0800 (PST)
Received: from [192.168.1.86] (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5c157bab834sm1698450e87.45.2026.11.12.06.47.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2026 06:47:44 -0800 (PST)
Message-ID: <b3689045-d735-451b-8cda-a29d7e79fe63@redhat.com>
Date: Thu, 12 Nov 2026 16:47:43 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 00/12] migrate on fault for device pages
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 David Hildenbrand <david@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Leon Romanovsky <leonro@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, Zi Yan <ziy@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@suse.cz>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>
References: <20261103061629.972669-1-mpenttil@redhat.com>
 <avWpWBl1nPcRVmpQ@raptor> <79f33ab0-2e43-4efb-94d0-addaf40745ec@redhat.com>
In-Reply-To: <79f33ab0-2e43-4efb-94d0-addaf40745ec@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lzotxRfZhoyLV12SLMJDDfQ916YxYfEjqSpBrb1V_c8_1794494866
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/12/26 16:00, Mika Penttilä wrote:
> Hi Alexandru!
>
> On 11/12/26 13:56, Alexandru Elisei wrote:
>> Hi Mika,
>>
>> I want to help getting this series merged, and I've been familiarizing myself
>> with hmm and device migration, please bare with me if the questions I'm asking
>> are obvious or downright silly.
> Thanks for the interest and willing to help! I am preparing a v18 of the
> series and plan to post it early next week.
>
> I try to answer your questions, there are quite a bunch of them!
>
>> On Tue, Nov 03, 2026 at 08:16:17AM +0200, mpenttil@redhat.com wrote:
>>> From: Mika Penttilä <mpenttil@redhat.com>
>>>
>>> Currently, the way device page faulting and migration works
>>> is not optimal, if you want to do both fault handling and
>>> migration at once.
>>>
>>> Being able to migrate not present pages (or pages mapped with incorrect
>>> permissions, eg. COW) to the GPU requires doing either of the
>>> following sequences:
>>>
>>> 1. hmm_range_fault() - fault in non-present pages with correct permissions, etc.
>>> 2. migrate_vma_*() - migrate the pages
>>>
>>> Or:
>>>
>>> 1. migrate_vma_*() - migrate present pages
>>> 2. If non-present pages detected by migrate_vma_*():
>>>    a) call hmm_range_fault() to fault pages in
>>>    b) call migrate_vma_*() again to migrate now present pages
>> Regarding both sequences, I'm trying to get a better understanding of what
>> the issue is. I assume the caller wants to fault in system memory, and then
>> migrate it to the device. Is that correct?
> Yes that's the common thing to do.
>
>
>> In my analysis I'm also not going to refer to THPs, since that would make
>> things even more complicated than they are. I think we can come back to
>> THPs later if we think it would be useful.
>>
>> For the !pte_present() case:
>>
>> Sequence 1: hmm_range_fault() -> .. -> hmm_vma_handle_pte() handles
>> !pte_present() pages in two ways: faults in swap pages and device private
>> pages belonging to a different device, and waits on migration entries. Then
>> the migrate_vma_*() flow is used to migrate the range.
>>
>> Sequence 2: migrate_vma_setup() ignores !pte_present() page table entries
>> After this, the caller follows the same steps as in sequence 1 -
>> hmm_range_fault() faults in !pte_present() pages, and migrate_vma_*() is
>> called again to migrate the pages that were faulted in/waited on by
>> hmm_range_fault().
>>
>> Now, for the CoW case that you mentioned, I'm going to assume that the
>> caller wants write permissions otherwise nothing needs to be done:
>>
>> Sequence 1: hmm_range_fault() -> hmm_vma_handle_pte() records a fault
>> (hmm_pte_need_fault() returns HMM_NEED_FAULT | HMM_NEED_WRITE_FAULT),
>> handle_mm_fault() -> .. -> do_wp_page() breaks CoW and maps an exclusive
>> folio with write permissions, then the migrate_vma_* flow will take care of
>>
>> Sequence 2, migrate_vma_setup() installs migration entries for the page,
>> then migrate_vma_finalize() replaces the migration entries with device
>> private entries.
>>
>> Looks to me that for CoW pages, all that's needed is migrate_vma_*(), and
>> the subsequent calls to hmm_range_fault() and migrate_vma_*() are not
>> necessary. Is that your conclusion too?
> For  a device fault: the driver want the data in device memory with the
> permissions the device asked for. Your !pte_present() analysis matches;
> note that pte_none() in anonymous vmas and the zero page don't need
> hmm_range_fault() at all, migrate_vma_*() populates them directly.
> That's why the common case is cheap with sequence 2, and only swap
> entries, other devices private pages and migration entries need the
> extra walks.
> For cow with write intent migrate_vma_*() alone is enough.

Is *not* enough meant to say


--Mika


