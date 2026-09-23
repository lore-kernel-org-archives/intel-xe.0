Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A686C982EA
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 05:42:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AD2010EF09;
	Wed, 23 Sep 2026 05:42:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DbWlSziG";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88CF610EF09
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Sep 2026 05:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790142153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Owanqqlm2F+zzhHdgO4ILjDMn6+LQqunLulaO+aFb4U=;
 b=DbWlSziGQrXgrL459BxU0hmKggBnq70MGLsn5DAetOpdg60RGU2jK9NDGp9MIHC6D7qLFC
 Y+6owghp4UdvETppin9eaSi3v2HLdc37F6uaYCmfU2MNk33PzevRConLvWj0Xop3Cmn56q
 RbZ2xIzSsyeOFjIXdUWaQFHCMi/D1XY=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-2UeySExPN4mvPL2IdhWc3g-1; Wed, 23 Sep 2026 01:42:31 -0400
X-MC-Unique: 2UeySExPN4mvPL2IdhWc3g-1
X-Mimecast-MFC-AGG-ID: 2UeySExPN4mvPL2IdhWc3g_1790142150
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-39d93d95a21so3512461fa.0
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Sep 2026 22:42:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790142150; x=1790746950;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Owanqqlm2F+zzhHdgO4ILjDMn6+LQqunLulaO+aFb4U=;
 b=qFo9UvtXW+JY6bePft4TvaTxwzD8jTa80RhJwRR539lCe328bdYOFRh92aJvHHtxcT
 2g0DmbQy69KOdOw9NaxuMM/B1G3xKO4Q5LKbF+DNG/BnMNkzl2DL+rNCBP1vVOt8ZMc4
 0eRZc+MgxdayQakECM+FW9YG5kw0PdBXlKsn9ZVfcgH5/EmWMPxALCcX+UpbmD/AnaeI
 p/7bA7yT/tXg0IrV7ZxR7UNu7a7Sqx/WpjC8dXbNb7TLxfrBXFu8AHIBGWvkqG53Fmv4
 MneL4GhtXst1MAPN++7l/Z2o90gmahughDKf7VHFlj8AteYFQ8J2BBo6snXPLv8skxJ0
 TNgA==
X-Forwarded-Encrypted: i=1;
 AKwUvBy96yxxkPK7EqpuZDgovPphRu2L93Kb0X0/kaE1ArEaTb+pNA55IOSGzWrMh37ngVtrULAiMhPOrA==@lists.freedesktop.org
X-Gm-Message-State: AFuF++m5zRv0Rbe32ZpAfn/WcXNuvQxaJ6qtVMxsS3RHljJRntDKWLok
 wjFd4gzJ376NzRxaCyxmrw10KwZp36hrtDHc+77LT4xuM9EBGQuYmTy9Ex5/vvY6lXERAjKIPi0
 8GXchvvJlMcLogvALeAOGstyFKID1f/Sfljvs6ZV5g1Nf3o0H/Tg6We9Gs0+yO984RRA=
X-Gm-Gg: AYBFou3MkUllzM1eWniUAnOlhgQqmftzwJjmoDcVHgTorK/5avlDGRuTPcKj3faz6BC
 sZ3i99qegu0FBbHYvusrND+4u9kBTTF3Br07PD9xjNGlCo79E0ncyX4BGktDlOMY/4b4ZqqICR4
 iAjLdB9lK61ryH0q5PatL8oGN4IewIwKis84WT6CTL5CA6zNGvTJPuj2M2d70g4QFjTwB5G8VPZ
 H1314x3hty+iQM7dH4rzQteiM+YdaPWC9dsOT+OK3TxCdhXwvT8z6p8MKv2VLYPxI2OQycLMoKj
 HsZqw8G2le0jUIPgVxAZcVopaZj75+gbMSirlemk6BKECPkPZAMDPPEwL4DtIfIQ7/nXXp/WUxK
 YIo+PLcqPh3WX3yZMaOjkcIobRGjklCk=
X-Received: by 2002:a2e:bc0a:0:b0:3a5:e541:4205 with SMTP id
 38308e7fff4ca-3a630525d38mr3157981fa.0.1790142150007; 
 Tue, 22 Sep 2026 22:42:30 -0700 (PDT)
X-Received: by 2002:a2e:bc0a:0:b0:3a5:e541:4205 with SMTP id
 38308e7fff4ca-3a630525d38mr3157781fa.0.1790142149515; 
 Tue, 22 Sep 2026 22:42:29 -0700 (PDT)
Received: from [192.168.1.86] (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3a62f4f10b0sm3956141fa.8.2026.09.22.22.42.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 22:42:28 -0700 (PDT)
Message-ID: <8523ee92-04c1-4e52-a418-a3ab110bca38@redhat.com>
Date: Wed, 23 Sep 2026 08:42:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 01/12] mm/Kconfig: changes for migrate on fault for
 device pages
To: Balbir Singh <balbirs@nvidia.com>, linux-mm@kvack.org
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Hildenbrand <david@kernel.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leonro@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Zi Yan <ziy@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
References: <20260922053421.4092027-1-mpenttil@redhat.com>
 <20260922053421.4092027-2-mpenttil@redhat.com>
 <c2b28c18-3717-43d1-acba-05eaf9b1b9cf@nvidia.com>
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <c2b28c18-3717-43d1-acba-05eaf9b1b9cf@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 555R6kHJTGDNLdki6ik05hIpxKtYJpS161DZ_xLo6CM_1790142150
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


On 9/23/26 01:27, Balbir Singh wrote:

> On 9/22/26 3:34 PM, mpenttil@redhat.com wrote:
>> From: Mika Penttilä <mpenttil@redhat.com>
>>
>> HMM depends on MMU notifiers. With the unified HMM/migrate_device
>> page table walk migrate_device needs HMM enabled.
>> Enable them explicitly to avoid breaking random configs.
>>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: David Hildenbrand <david@kernel.org>
>> Cc: Lorenzo Stoakes <ljs@kernel.org>
>> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
>> Cc: Vlastimil Babka <vbabka@suse.cz>
>> Cc: Mike Rapoport <rppt@kernel.org>
>> Cc: Suren Baghdasaryan <surenb@google.com>
>> Cc: Michal Hocko <mhocko@suse.com>
>> Signed-off-by: Mika Penttilä <mpenttil@redhat.com>
>> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
>> ---
>>  mm/Kconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/mm/Kconfig b/mm/Kconfig
>> index 604c58199acb..b7a485beb9a7 100644
>> --- a/mm/Kconfig
>> +++ b/mm/Kconfig
>> @@ -687,6 +687,7 @@ config MIGRATION
>>  
>>  config DEVICE_MIGRATION
>>  	def_bool MIGRATION && ZONE_DEVICE
>> +	select HMM_MIRROR
>>  
>>  config ARCH_ENABLE_HUGEPAGE_MIGRATION
>>  	bool
>
> Acked-by: Balbir Singh <balbirs@nvidia.com>

Thanks Balbir!

