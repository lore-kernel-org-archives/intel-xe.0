Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08484606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 06:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NymD1f9N
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF55110F973;
	Wed, 21 Oct 2026 06:31:03 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08CB210F973
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 06:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1792564256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tRPKYkaZWE3FxBj2IxPUzKLdAP5rCGDFaBUV6kgkyzE=;
 b=NymD1f9N+NQhj4alNvmfmISsNMi5zNI6pqpUlhGqJRvpiOUZs3mUdEKU04XC8qcPOQjPRQ
 0uNIY8ji+jpV0RABZ+TEYIXiI39gBEVw9cDG3zOGWhOyZ/8mR9tw7DHVmKDiThVWu30cTs
 pf79wXXgU6ksKtB2z4Y7FZsUuM28Xns=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-K3vGtTSNOFCnhUIjpU0kTg-1; Wed, 21 Oct 2026 06:30:53 +0000
X-MC-Unique: K3vGtTSNOFCnhUIjpU0kTg-1
X-Mimecast-MFC-AGG-ID: K3vGtTSNOFCnhUIjpU0kTg_1792564253
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-48e0389d6f9so164749f8f.1
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Oct 2026 23:30:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792564252; x=1793169052;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tRPKYkaZWE3FxBj2IxPUzKLdAP5rCGDFaBUV6kgkyzE=;
 b=SvPmmteItgZoq0ZJDlm1pLVTGvYtuF8HMesqP6USw1uEOeb02CCOf6F9vbR9F4Y2n7
 Ri1OuXhkDVWB23+3JZWwEfKUJzih0PaNatV3kM8ILQPHycpp5uKY72tnBbffnzR03Lby
 nm9XO+9j/3aTfgIIG5ooL0hIf5UTt5rFZzu1HIpYZniCMOf9eqdqSU3QS84+FNzQIma6
 2rsTAI6jzZlrwhfOj3QaoC1gIp3Ukgg6ARhPAgZUbZVU2zwAigXrffz6xUXPC/rshJ9j
 1VEMFQZZOL5dieqPw8EZS+9MD8eGiBmxKGVixcnYZKIC25NJ4PsGq30oxoUVqgzt2LHX
 1QVg==
X-Forwarded-Encrypted: i=1;
 AKwUvByjxdSDTVO1uyJko7turizvrA6wYwitCS7hsok8oTdpk47ETRN3z2AYy4P07CYrTjpgU5U2zal65A==@lists.freedesktop.org
X-Gm-Message-State: AFq9FYLWt0V4f3W/EqDoKqX0IGeN46xUgWK29DJ5wHzF2W5RDtVpvlOB
 oPCDNtSVfHR8qCXglBrEjFHsqQ5bwwT/yC2ReeO/mwySSjP+WFtEYyDo+updsg0VJslA5T2IwDJ
 az6hInewnTa69WLYQKSvLjGjj3SgDDoU5TERtctjgH6Wi7WUdUOTdvBMjyAmPLSfk6t4=
X-Gm-Gg: AYBFou2tCc/Rf2hKFYF7Ce+V68HWqOgRExouLGSpGtg1nCVAqYKON18ODsD+c8fe0Ou
 xq9ArlnCQn0PAUBerfDuLFY+2wXf6CxjijNYRjq6mqx7UHVD8LL1KFhr1eMHIPo6Isv7vyoz7x2
 cm8zBz7j/b/g4CRrHMyveyVSQGUNaKGyPIZckjZckWpFr46fkquW7YZRZ+6Le6L0v8UHj+3M2Rv
 mW1n0sHhRPQ3gypL1vNMMqQA6qw3C8esKb1sVvNesNRUF+r3av/CLgjHxBmPmS/zouOGdR/cpTH
 6ojfel5tNZX+G7aE5pq0XixeQRxxWnHymMkXlO6fLeBhnF+gLA1ceCz6XFIIn3xEkJHxdmcwdw6
 7gLMWEQeYHhhvFmN5Et2bIrL577sHdro=
X-Received: by 2002:a05:6000:40db:b0:488:8ab9:f74c with SMTP id
 ffacd0b85a97d-48e2644ef10mr2173423f8f.3.1792564252721; 
 Tue, 20 Oct 2026 23:30:52 -0700 (PDT)
X-Received: by 2002:a05:6000:40db:b0:488:8ab9:f74c with SMTP id
 ffacd0b85a97d-48e2644ef10mr2173368f8f.3.1792564252246; 
 Tue, 20 Oct 2026 23:30:52 -0700 (PDT)
Received: from [192.168.1.86] (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e25828e72sm3174366f8f.26.2026.10.20.23.30.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Oct 2026 23:30:51 -0700 (PDT)
Message-ID: <7b534ff3-699a-4c38-b6d5-b044383d956e@redhat.com>
Date: Wed, 21 Oct 2026 09:30:49 +0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 09/12] mm: enable device page migration from HMM
 pagewalk
To: Balbir Singh <balbirs@nvidia.com>, linux-mm@kvack.org
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Hildenbrand <david@kernel.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leonro@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Zi Yan <ziy@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>
References: <20261021060506.2377545-1-mpenttil@redhat.com>
 <20261021060506.2377545-10-mpenttil@redhat.com>
 <7c8c663f-cf31-40ff-bce4-784726f42a0b@nvidia.com>
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <7c8c663f-cf31-40ff-bce4-784726f42a0b@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2_QezAm_8XlNKTdqr_os9X37BLh9jxVUbhZPnQ7labI_1792564253
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
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 10/21/26 09:19, Balbir Singh wrote:

> On 10/21/26 5:05 PM, mpenttil@redhat.com wrote:
>> From: Mika Penttilä <mpenttil@redhat.com>
>>
>> HMM pagewalk has now the machinery to do the first phase of
>> device page migration, collecting the pfns and installing
>> migration ptes.
>>
>> Enable migration in hmm_range_fault(), and change migrate_vma_setup()
>> to use HMM pagewalk path. Two new flags, MIGRATE_VMA_FAULT and
>> MIGRATE_VMA_WRITE are introduced for migrate_vma_setup(),
>> to request for faulting missing pages, and requesting write
>> access.
>>
>> Also, the migrate_vma_collect*() based paths are now unused,
>> so delete them.
>>
>> Cc: David Hildenbrand <david@kernel.org>
>> Cc: Jason Gunthorpe <jgg@nvidia.com>
>> Cc: Leon Romanovsky <leonro@nvidia.com>
>> Cc: Alistair Popple <apopple@nvidia.com>
>> Cc: Balbir Singh <balbirs@nvidia.com>
>> Cc: Zi Yan <ziy@nvidia.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Suggested-by: Alistair Popple <apopple@nvidia.com>
>> Signed-off-by: Mika Penttilä <mpenttil@redhat.com>
>> ---
>>  include/linux/migrate.h |  10 +-
>>  mm/hmm.c                |  33 ++-
>>  mm/migrate_device.c     | 562 ++++------------------------------------
>>  3 files changed, 83 insertions(+), 522 deletions(-)
>>
> I got a conflict applying this patch on the latest mm-everything with
> mm: avoid use of VMA_SPECIAL_FLAGS in migrate_vma_setup(), quite a simple fixup
>
> Balbir

Ah okay - yes this is on drm-tip

--Mika

