Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96323606AB1A
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 16:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=etbSi3Ma
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 475B5112203;
	Thu, 12 Nov 2026 16:35:40 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC12B112207
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 16:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1794501332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zidr50P/tGTG0fyue72d2UJbI2Rv5djOGtCARdBGkgo=;
 b=etbSi3MaBKlhM2H6U1bFd6byZAOcdmMUnrFPq/YTRuWRbxQgFEFw4G1zldn7iLorC2LLfy
 BIk8t3PLGvMI1XjiP82BuHFwk8qb7Di7i+lR8CD1pASAvI6x2+xnX8UAPSOmZbzCrEJbHz
 uiTS2dxAW7S42S0y4bkf9X/IoghziW0=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-523-zuOOwsOxNXSejVV-mIzNxQ-1; Thu, 12 Nov 2026 11:35:29 -0500
X-MC-Unique: zuOOwsOxNXSejVV-mIzNxQ-1
X-Mimecast-MFC-AGG-ID: zuOOwsOxNXSejVV-mIzNxQ_1794501328
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-5c159755becso1604300e87.3
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 08:35:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794501328; x=1795106128;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zidr50P/tGTG0fyue72d2UJbI2Rv5djOGtCARdBGkgo=;
 b=G6VIje3PQ8uZGApkbOc2HsvSZr9Ls2yrbRjlIeyC1fKPSs8prbGwSfdYizH36FNN+s
 QZlEXBVQ9jZCzsBvq5OCdMd2PwjQgkWC9Hyjw3jCAOeg0E80z5h53uvticzFWvn8pID+
 dl+exCi8Pg/+2IPFwQCiF1TUpML9s+9yzq4UgD4pw81MYuWN99afcSHyq+nvchrSEQtc
 VRjsVaGLHEO+9ANL1OuqvG2sR5qSOdbyRuRIwOyNj46D2rikan4YkgEVsEDBvBzRPM1A
 ILnqaIKB89WnstKAwoP8qIaHVk0In8LeBcezTa5ofLMk4qJaHoyLH1fmZtRarwE2F2uk
 o8Bg==
X-Forwarded-Encrypted: i=1;
 AL+hErHi4Mb73qaYP0SyE/o0xEOr5ovMaKVtT4wJEb1Xc5jkoGpf9TnAIW3xBPRdJOH3+NFyjpFIh8dEfw==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z9K+3neILZnF4CdkRCLHvKOLULIUx7Zk+c+KdFB52kxvsoa+/qf
 dj9kkhDf8a8BcaMs00lfwHqXp6QPYAJowpmR5FFzoMFHYwwxQL0CKfGqQODuyIPnTc6kyrvVYB0
 jJISe747uDWcKfZQa3FRSPrrJCSI3wNDUZEe0aGnqga/U4F3OA+qpq8f1W4sf7YhulxU=
X-Gm-Gg: AYBFou3UQ2wEGf6i0CfAmOM8YcbrEePctxxesv6vGu9sFw3m8nqEOblX99gjiEdoSOG
 WM5pjl3MMvppOLT49INF4u8F0iRtQlrhM0JpVi6c+jTNtua5f1YvELDyUuI6WcbW+D8Mu9p/NEo
 QOy7hfX90VTDgOuQIl7/U8OgizyleEpebhcKHoAAtAfCfRNQzYaC2zm/oVeX/bjWMgbRkbP8toA
 J4DCjcA6oNn1qqmmEhNzs2/aMWH11fK7uwQ9G3Okof9nscGAgzqSDzD6il49Ja24eH3vOdwPUuR
 ULK3Y3ZUST5x1bVl3xRkaG6B+8RPiJsmNQkE+79T1+Tm/qjlRWOU9Q0cHlFqvxGoNvVYiPFmedF
 eT6rpg7Z6fXTaq31SpuzpwQrl+0IIii612ExKScwe8dyvAc4qKPXqkFhEuZyD78cdp9R3KYCSlZ
 +aP6sC
X-Received: by 2002:a05:6512:402a:b0:5c1:5be5:a543 with SMTP id
 2adb3069b0e04-5c15d5a80b2mr2335295e87.9.1794501327769; 
 Thu, 12 Nov 2026 08:35:27 -0800 (PST)
X-Received: by 2002:a05:6512:402a:b0:5c1:5be5:a543 with SMTP id
 2adb3069b0e04-5c15d5a80b2mr2335272e87.9.1794501327252; 
 Thu, 12 Nov 2026 08:35:27 -0800 (PST)
Received: from [192.168.1.86] (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5c157bab721sm1785202e87.40.2026.11.12.08.35.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2026 08:35:26 -0800 (PST)
Message-ID: <968f4667-ace0-49bf-a628-845c5fd577e4@redhat.com>
Date: Thu, 12 Nov 2026 18:35:25 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 00/12] migrate on fault for device pages
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
 <avXoJSGh5xjGFgod@raptor>
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <avXoJSGh5xjGFgod@raptor>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 26TigPifV6-EjkPTbIZiuK1fQRVFetmSSpLWcWWDh5A_1794501328
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


On 11/12/26 18:24, Alexandru Elisei wrote:
> Hi Mika,
>
> On Thu, Nov 12, 2026 at 04:00:09PM +0200, Mika Penttilä wrote:
>> Hi Alexandru!
>>
>> On 11/12/26 13:56, Alexandru Elisei wrote:
>>> Hi Mika,
>>>
>>> I want to help getting this series merged, and I've been familiarizing myself
>>> with hmm and device migration, please bare with me if the questions I'm asking
>>> are obvious or downright silly.
>> Thanks for the interest and willing to help! I am preparing a v18 of the
>> series and plan to post it early next week.
> The series is big, and as far as I can tell the MM people are hard at work
> reviewing bug fixes. It might be better to wait a while, to give people a
> chance to have a look? I know that if I see a series being reposted often,
> I am less inclined to review the patches since probably a new iteration
> will be posted soon. But I can only speak for myself, you know best.
True, my motivation for quickish repost is to address sashiko concerns,
and after that give time to reviewers.
>
>> I try to answer your questions, there are quite a bunch of them!
> Thanks for your replies, it's going to take me a while to digest them.
> Despite the silence, I'm working on it!
Appreciate it!
>
> Thanks,


Thanks,
--Mika


> Alex
>

