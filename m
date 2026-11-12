Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49791606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 17:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jL8iv7+F
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04BA7112243;
	Thu, 12 Nov 2026 17:02:41 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D9610E05B
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 17:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1794502951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DmDJ9JjueJiTO4ILc4vU5r+iyjWb6VUgLE0oIyUYePo=;
 b=jL8iv7+FtzPd+QNu4leD9INAbS4S+h9cYf105jtoeosnv1NTQy3AaG0ZKbJvLhZqgmmpsY
 FzonQbu8HY5BLvFs/4axEkAIjBjy/+SquxKdgx8yzDHjQT84gdARKjd4IRP4EzBTTKctI/
 oR47Za0+bKlb2UUKPj8z44+nkGDCUtc=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-371-Z1c12hVKPS2lNxw2LBtzXA-1; Thu, 12 Nov 2026 12:02:16 -0500
X-MC-Unique: Z1c12hVKPS2lNxw2LBtzXA-1
X-Mimecast-MFC-AGG-ID: Z1c12hVKPS2lNxw2LBtzXA_1794502921
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-5c00ca36371so15945e87.0
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 09:02:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794502920; x=1795107720;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=DmDJ9JjueJiTO4ILc4vU5r+iyjWb6VUgLE0oIyUYePo=;
 b=huTGtpwCSiyoh0xY+22ZqdlmZkVnU1yiRewk/p/JIvPDnunWjSlrhqVjZcdS5ZHsw/
 fpTQqFsYSvXN4MXl5APhEvbevF63+HgklDQAsGKGUmmUiahl12oe5MzN/LLaoZ0TGI4e
 u4j6CSMhc8STFup210CIQ375U6Xfj9y8dnvMiDyLet+I8qY5ZMYsSZuyMVvNuMbjovVf
 RhKYE3O0xoTRUh0GZXpJP0wvfKO2apY5Relgy2QiSu3zWjwdORjItRrRxIgbxFvRIkNP
 lRKN8olk3LCdsD10OvYhACxqoEBw0aHpAf70W46ELDF7wiB5fi/5NOHscuSgursf0VDZ
 iHPg==
X-Forwarded-Encrypted: i=1;
 AL+hErG7W+3g44KT9Zp7CfAbXOsucFZzHMyu4V7Dx3bqpobxDcYSuxCeh6hZwrgcx2pZ1gX+bNSAZ348Wg==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z/J8OTMp7VbVLVbKHgYRuMoSVdpRTAgndPrV/PWXMCbwU8Z/ick
 B8BuSyw62bfFjdQpkQeRuyOoXDpFguwZ7TfRk/YscVy63sVTv9/GZOcjjPcNJASpBglPEBOQDaS
 p8dA/BjFaOVf4PBSOCS25HpwBg4m4SzxT7o1yMd0wX9uJd9EcD1sFVGZyVF4qD5ylYlw=
X-Gm-Gg: AYBFou1+hEPZaUoVfyjzK7uK7J+EfwIBs0eQYESJ88pzEk+WZ54AXH7tAJOggAs5460
 O0RAZSQuWgfjU35U5UoyAQwXZwyzo03x9cgv7+I4Ca51GFWjmybHLw07TW2VNipTOI+zA4j86vY
 1Ri21mkEbBQFTlXqR0zj2gS7m2LnZTmi0RalJ5W6DG1c8k5cbwjyR2CeHGqTkJaCkqBnZE0YLe3
 C/PL5VcV9Q5bcrUEfS6qzVjWZXiRia93bAiiA7tT6P9A9nRwrYQJseDFw9zsznaE56Q+O4dWXgc
 agGcLFvtGepd+AQHr9JDh1Eiii4vQz/BKvdNrnJNXkHxLyHnTRUhChAUv81P3+BhCRKXcme092c
 09+YimrbBj5XoP34KIGys5YrA673NxzzAsLZWHoCCXag2MbTP0ejbqy6LiU/XcjFK3/36puxaUN
 M7tDhf
X-Received: by 2002:a05:6512:398b:b0:5c1:4e2d:58ea with SMTP id
 2adb3069b0e04-5c15d5f1e4emr2155725e87.53.1794502920594; 
 Thu, 12 Nov 2026 09:02:00 -0800 (PST)
X-Received: by 2002:a05:6512:398b:b0:5c1:4e2d:58ea with SMTP id
 2adb3069b0e04-5c15d5f1e4emr2155701e87.53.1794502920105; 
 Thu, 12 Nov 2026 09:02:00 -0800 (PST)
Received: from [192.168.1.86] (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5c157bab834sm1779330e87.45.2026.11.12.09.01.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2026 09:01:59 -0800 (PST)
Message-ID: <ec4431f1-e70d-477c-b09a-eedc35d97691@redhat.com>
Date: Thu, 12 Nov 2026 19:01:58 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 00/12] migrate on fault for device pages
To: Jason Gunthorpe <jgg@nvidia.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>
Cc: linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 David Hildenbrand <david@kernel.org>, Leon Romanovsky <leonro@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Balbir Singh <balbirs@nvidia.com>,
 Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@suse.cz>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>
References: <20261103061629.972669-1-mpenttil@redhat.com>
 <avWpWBl1nPcRVmpQ@raptor> <79f33ab0-2e43-4efb-94d0-addaf40745ec@redhat.com>
 <avXoJSGh5xjGFgod@raptor> <20261112164752.GA3692174@nvidia.com>
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <20261112164752.GA3692174@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6d7RM2XNCla3tT8dRw2sQ861xY4HuxpavYIaK7g6ZsY_1794502921
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


On 11/12/26 18:47, Jason Gunthorpe wrote:
> On Thu, Nov 12, 2026 at 04:24:05PM +0000, Alexandru Elisei wrote:
>> Hi Mika,
>>
>> On Thu, Nov 12, 2026 at 04:00:09PM +0200, Mika Penttilä wrote:
>>> Hi Alexandru!
>>>
>>> On 11/12/26 13:56, Alexandru Elisei wrote:
>>>> Hi Mika,
>>>>
>>>> I want to help getting this series merged, and I've been familiarizing myself
>>>> with hmm and device migration, please bare with me if the questions I'm asking
>>>> are obvious or downright silly.
>>> Thanks for the interest and willing to help! I am preparing a v18 of the
>>> series and plan to post it early next week.
>> The series is big, and as far as I can tell the MM people are hard at work
>> reviewing bug fixes. It might be better to wait a while, to give people a
>> chance to have a look? I know that if I see a series being reposted often,
>> I am less inclined to review the patches since probably a new iteration
>> will be posted soon. But I can only speak for myself, you know best.
> It is at v17 and it is still getting high severity sashiko errors
v14 was first that sashiko managed to review. There was a regression in
last posting, but also false potsitives, and sashiko reports same issue
then 3-4 times, so the reality is not that bad. 
>
> I've been ignoring it until this improves..
>
> You really need to run sashiko locally and not rely on the upstream one.
>
> Jason

--Mika


