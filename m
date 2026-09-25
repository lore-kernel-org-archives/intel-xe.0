Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BFE6C9830D
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 10:24:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A6C10F9C1;
	Fri, 25 Sep 2026 10:24:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="aU2MEIfC";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 184F910F9C1
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 10:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790331840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nqSQfDrdpDYW051eAGtg8LkmO5WsRJfyGEnYEAE/NaQ=;
 b=aU2MEIfCt45e51szoZQauZoqm0l4KroNY454TAr3TQICdAHWoP0goDBKpsZ59u+kfP5bCF
 JZjiNU8/YFUEIPpr6O4Tb72Kc8YgtHzRVr9jirYB0mluBcgFtQmoHBOOnxFDskoN8B4yEv
 0zMDA+cBadNDa6v8cESkQfWWBGOaFok=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-6yQ2iKL1N9iojvuk4ll78g-1; Fri, 25 Sep 2026 06:23:56 -0400
X-MC-Unique: 6yQ2iKL1N9iojvuk4ll78g-1
X-Mimecast-MFC-AGG-ID: 6yQ2iKL1N9iojvuk4ll78g_1790331835
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-3a6529ad9f5so1562031fa.3
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 03:23:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790331835; x=1790936635;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=nqSQfDrdpDYW051eAGtg8LkmO5WsRJfyGEnYEAE/NaQ=;
 b=e1KsZ5rYWaT1mFOPLz9b+BanPZeQTRs9jyYaJ1mKad8eCdv3yMKXviVb8/uToIsKhs
 mhWRwKIaukbzCWfR7y/6YyAlyXvph1TkHTsvr5soeMP5RqKtE+kImSPjARQ6z8IW8edT
 JdF1G6lDNkzNcpSy5kC7RDFc3HYEjq3hYEEQKjLzJ4KhopEHsaEeIgImuAFH9bqk4orC
 gBSLQsg7n1OsAy2Xkp7wkRXw0zelwxAeb8qd75nc9bSC8PNHjzccTIkpCHOSYTa7Q2Bb
 75zoWuWe4Be/4zM2CBvz/6Yqvx9MtXNLnVjeM+hq7YVrBG0fkYX7nRjQbtcp0/asOqWm
 /MNQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwWEChC2kaxVhf2VJtz83cfF/DC7OG8RLeCr7PnNxp5y6Tfl6vIVPbzsAXcZcI3mJsOomntjXRiKg==@lists.freedesktop.org
X-Gm-Message-State: AFuF++n5QTioXmqTn3NQKRY0vzr2RtOZoRu1GY//8xpkrACza+/ve1Lj
 okcm8Cwf9AU5w+JGiYMjVDZ8K2eOcVS1L9f4FS7amHGKuiBeCimA+n7kPG9uwo5OEC3QsFmwtOh
 A1USMBZ9/fEq4N7IVzP/0J/FJbHepD7VS6woS6IhHA7BHsiJzs1n7Ixt7MU2kBf3Itu8aHSggHS
 vRbA==
X-Gm-Gg: AYBFou1TloQa3XDHgw0J8b6BOQYWKLCarJ/OkN1VLU0iNEebYVsSvGBCZLzy+4qhY2u
 9trrVe4OvwK5h2xfA90LfhSOmdTlPDBoNj7vnQzGMbuLeKZg3ieLJzk2sAeQX5mSQwsUKiYeBoo
 IpW1UKXCDRtpCRErSj2iLQKUt5+efTtcJgWrq5XHtyHNkSVpBT4aUioy1LiP3QeAhLXRYrHuJ5e
 x4XR29bTp+UbTnCaXXtWmBSO/xiUQIDa81cAMQxY6VmC27HiaovT1Poahf0fmCYt3KWhGd7lPuc
 ALWyWawp+25zHSBzVXD7Bd2dA9sSvAWsQksBhOl5ZgPQrTQVdo4L2Tk2/XHJU+3etXoLLZmoSqQ
 ySS0lmFeoX85QEUKPCacHEBquZXnqGk0=
X-Received: by 2002:a05:651c:b0a:b0:3a5:dfd3:41b6 with SMTP id
 38308e7fff4ca-3a63bdbaf2amr14482461fa.0.1790331834959; 
 Fri, 25 Sep 2026 03:23:54 -0700 (PDT)
X-Received: by 2002:a05:651c:b0a:b0:3a5:dfd3:41b6 with SMTP id
 38308e7fff4ca-3a63bdbaf2amr14482331fa.0.1790331834509; 
 Fri, 25 Sep 2026 03:23:54 -0700 (PDT)
Received: from [192.168.1.86] (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3a64c2ea5d2sm4507651fa.18.2026.09.25.03.23.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Sep 2026 03:23:53 -0700 (PDT)
Message-ID: <65c5c412-56a7-46a9-b22b-22077a8e9727@redhat.com>
Date: Fri, 25 Sep 2026 13:23:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 00/11] migrate on fault for device pages
To: Christoph Hellwig <hch@infradead.org>
Cc: linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 David Hildenbrand <david@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Leon Romanovsky <leonro@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, Zi Yan <ziy@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
References: <20260924065313.899730-1-mpenttil@redhat.com>
 <arY5zKsLuf7f_EYw@infradead.org>
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <arY5zKsLuf7f_EYw@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _Xekmn3SAz-LAKd3p7rnXOjrTExqdQRYDstA84BiB2I_1790331835
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


On 9/25/26 12:07, Christoph Hellwig wrote:
> Who is going to use this? The series seems to lack an actual user for it.

Two users:

For one, existing migrate_vma_setup() callers, unchanged. The series
reworks migrate_vma_setup() to collect via hmm_range_fault() internally
(it sets HMM_PFN_REQ_MIGRATE and calls migrate_hmm_range_setup(),
mm/migrate_device.c). So every in-tree migrate_vma consumer — nouveau,
amdgpu/amdkfd, drm/xe via drm_pagemap, lib/test_hmm — runs on the new path.

Second, the point is to fault-in and migrate in a single page-table walk
instead of the 2–3 walks drivers do today . It can be driven by
hmm_range_fault() directly instead of ping-ponging between hmm fault and
migrate_vma interfaces, and lib/test_hmm exercises it. migrate.vma is
also populated now for free on fault path. These are aimed at SVM like
migrate-on-fault, and is motivated by Alistair Popple's experiments
with  current interfaces, where the redundant-walk overhead showed up
clearly in perf traces. The unified page table walker also avoids some
limitations in current collecting interfaces that can crash when raced
with unmap.

So this is a building block for migrate-on-fault but delivers immediate
in-tree effects by unifying, refactoring and more robust collecting.

--Mika


