Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDB2606A320
	for <intel-xe@archiver.kernel.org>; Sun, 22 Nov 2026 05:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=C/dh0Fxv
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB33210E3AE;
	Sun, 22 Nov 2026 05:55:51 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2DCF10E3B5
 for <intel-xe@lists.freedesktop.org>; Sun, 22 Nov 2026 05:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1795326943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e5Q0HhQjroZ+Rc/PnGI9kGFEaaiyFgbKCtvuSXxJJDA=;
 b=C/dh0FxvvhWNCVPzrwJnxjd7/RDWFiHWJBlBbUrSKkR6Uo6TPqOoy6DGN8NN7BOYn5rJ+0
 gmf0pZRDvIEfl3AO09+Immz8Z8moHWw/UtbcSeJMjexc41c3qAhFxELVVjcPUoj2M2BbPC
 L6RB8I0TR76ytgKTN5tx5LIlq8vYC/g=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-340-rV_8BxXSMNCulLv_xRKSrg-1; Sun, 22 Nov 2026 05:55:41 +0000
X-MC-Unique: rV_8BxXSMNCulLv_xRKSrg-1
X-Mimecast-MFC-AGG-ID: rV_8BxXSMNCulLv_xRKSrg_1795326940
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-5bfd95238e3so1366467e87.0
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Nov 2026 21:55:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795326940; x=1795931740;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=e5Q0HhQjroZ+Rc/PnGI9kGFEaaiyFgbKCtvuSXxJJDA=;
 b=fTCRfcy8z99dOhTt+C2X1ncyb+uYM0SW53Ea65TJ/k6ckVp+NnU1IIVUAATD6/w33N
 H3/MmfoXb8BCKtwEVdieRiBjvjKaGBStLk7sfEXZCYYTlZT7jrywqHHtGjQK/xqCbxNZ
 3gBSAi30TOU4P0zMoAOtmcwyXE82VY0itKNHCRUPGrYw+Pw/U4UPsyyTABELA8BQ5JB6
 pCUbgXX/z3uugQByHiMm7UmVMZ5pVbHPGoI28nJxNcLS5383QvXBR4kWpIKmx7tHIBYh
 EWfUvo5IdOif50efn00Vgo7c5zw6OjFQ8nMZllW3gV+VUqCHilQqoqFp3yXYSyA3F3DW
 dZyQ==
X-Forwarded-Encrypted: i=1;
 AL+hErGAT9RiTs+4rd00Dz1NutOTwFX8K1B+1PlnsFYsRTeCcTyWkOxTqNTE5lclCAzXzekG897ezupvrA==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z9cBlwDIJ+zr2eiSz/HvVsANJgHIQZxHzz6eve9cWR/v4u4zr++
 o0vy15nrbYC3on+Ypz6MllcC1IzjysqhGFFdr5hQMvXdhPzqhgOFkWLxHaVT3oCHUI9SYrYzhh5
 ghk2sR4yR7wtDeob1PYFa2F+LtBuUBsSLQqa/R+SPF/aeq+XRe28kP+w/kjlJhkr6YSQURMFINc
 gA7g==
X-Gm-Gg: AZFdTZcMLRgeRgGeGhNrp/61jZk3LxvWOb4brkMxGsbgFbNVSo+hhzUU2jPuayfPuXT
 KMzvgsSAu8g3oHyQ6nktdMlr6MDO6aLgf+b0vEIQfBhQbIXWKZY5aYOU7uL7HRJKyL8DPGH5fOY
 o+NIPC2KMWMpQ2yOVQkNPI8bgPLpwL/3ePgHdKZo0H33Ff953vtuKnBhuXXiUXiZC10XQJaFzs0
 gjZi///FpMKtMMBz0P+bxwAG10cFmNnXBtGr6al7DBs3e8Qyo1ujECPvVGVaj39y11AiU4en4Yz
 QMMAT5w1t9p4597w+/nCMHi4VXj+39AO6TZlm8b77wXIqmokGP2gM4QQwXrROqQVZ081KnrIJld
 XdZKgYdbjg2MWEAiCWBZFdNhiMLmZsILc5GQImDMjqca1xEnDHbT1wihwlTJWHA/uqTNtjDzSB0
 dyXIqO
X-Received: by 2002:a05:6512:1192:b0:5c1:a96d:911e with SMTP id
 2adb3069b0e04-5c1b79fccd9mr2415300e87.5.1795326939890; 
 Sat, 21 Nov 2026 21:55:39 -0800 (PST)
X-Received: by 2002:a05:6512:1192:b0:5c1:a96d:911e with SMTP id
 2adb3069b0e04-5c1b79fccd9mr2415274e87.5.1795326939399; 
 Sat, 21 Nov 2026 21:55:39 -0800 (PST)
Received: from [192.168.1.86] (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5c1bd03bcdcsm1951038e87.45.2026.11.21.21.55.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Nov 2026 21:55:38 -0800 (PST)
Message-ID: <36be0904-168d-4813-82ff-27ecced464e3@redhat.com>
Date: Sun, 22 Nov 2026 07:55:37 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/hmm: account for subpage offsets in device-private PMDs
To: Andrew Morton <akpm@linux-foundation.org>,
 Aveline Noir <jm5905938@gmail.com>
Cc: jgg@nvidia.com, leonro@nvidia.com, airlied@gmail.com, apopple@nvidia.com, 
 balbirs@nvidia.com, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, Francois Dugast
 <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org, jgg@ziepe.ca,
 leon@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Matthew Brost <matthew.brost@intel.com>, mm-commits@vger.kernel.org,
 Patchwork <patchwork@emeril.freedesktop.org>, SeongJae Park <sj@kernel.org>,
 thomas.hellstrom@linux.intel.com, Vlastimil Babka <vbabka@suse.cz>,
 ziy@nvidia.com
References: <179342234355.4.16705453209886955762@gmail.com>
 <20261121160037.1a479f3c8b4e860bc23c106d@linux-foundation.org>
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <20261121160037.1a479f3c8b4e860bc23c106d@linux-foundation.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Hy7K_1O__5_LHQvA2LDLR8J2m9q4nkAQ-gQZI_subAA_1795326940
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/22/26 02:00, Andrew Morton wrote:
> On Sat, 31 Oct 2026 15:07:58 +1100 Aveline Noir <jm5905938@gmail.com> wrote:
>
>> When a query starts inside a device-private PMD owned by
>> range->dev_private_owner, hmm_vma_handle_absent_pmd() still fills the PFN
>> array from the folio's first page. The returned PFNs therefore refer to
>> earlier pages rather than the requested subrange.
>>
>> Add the query's PMD-relative page offset to the initial PFN, as the
>> present PMD path already does.
>>
>> Fixes: 10b9feee2d0d ("mm/hmm: populate PFNs from PMD swap entry")
>> Signed-off-by: Aveline Noir <jm5905938@gmail.com>
>>
>> ---
>> Found during a synthetic test_hmm check of device-private THP handling.
>> Tested PMD-aligned and non-aligned subranges, PMD boundaries, split
>> PTEs and fake-device data accesses with test_hmm in QEMU TCG; all
>> executed tests passed with the fix. No real GPU testing was performed.
> Thanks.  It appears that the changelog somewhat understates the
> seriousness of this so I came up with a more assertive one, below. 
> Please check that.
>
> I fed this through LLM-driven QEMU-based runtime testing and it looks
> like it pretty much replicated your testing:
>
> : I tested "mm/hmm: account for subpage offsets in device-private
> : PMDs" on matched x86-64 guest kernels. An unprivileged process
> : (UID 65534) migrated an anonymous 2 MiB THP to the test_hmm
> : device. A second open of the device read pages inside the PMD
> : while the first remained open. A snapshot confirmed a
> : device-private PMD, and temporary kernel log messages confirmed
> : that the reads reached hmm_vma_handle_absent_pmd().
> : 
> : Without the patch, requests for pages 1, 7, 255 and 511 returned
> : page 0. A request for pages 31-33 returned pages 0-2. With the
> : patch, all seven pages returned the requested contents. Page 0
> : read correctly on both kernels. Thus an unprivileged device user
> : can receive data from the wrong pages.
> :
> : The fake device needed an identical temporary backing-page
> : correction on both kernels to make this read path work. That
> : change was removed after testing. This exercises the HMM path
> : through test_hmm; I did not test GPU hardware.
>
> So it accidentally found a bug in lib/test_hmm.c on the way.  "The QEMU
> run exposed a real test_hmm bug: a second open of /dev/hmm_dmirror0 can
> put a device-private page into its page table, then dmirror_do_read()
> tries to copy from that non-CPU-accessible page and oopses".  I'll prep
> a fix for that separately.

I noticed that also and will make changes around it in my series.

>
>
>
> I'll queue the below in mm.git's mm-hotfixes queue and shall await
> maintainer input (please).
>
>
> From: Aveline Noir <jm5905938@gmail.com>
> Subject: mm/hmm: account for subpage offsets in device-private PMDs
> Date: Sat, 31 Oct 2026 15:07:58 +1100
>
> When a query starts inside a device-private PMD owned by
> range->dev_private_owner, hmm_vma_handle_absent_pmd() still fills the PFN
> array from the folio's first page.  The returned PFNs therefore refer to
> earlier pages rather than the requested subrange.
>
> Nouveau's GPU fault path can query one page of a device-private PMD at a
> time.  Xe's SVM fault, prefetch and userptr mapping paths can also query
> subranges of their own device-private PMDs.  An unprivileged process with
> access to the GPU render node can reach these paths on hardware supporting
> device-private THP migration.  Xe can read the wrong application data or
> silently overwrite earlier pages of the same process's device-private
> folio.
>
> Nouveau aligns a one-page GPU fault to the PMD head by subtracting the
> fault offset from the returned page.  The faulty HMM PFN already refers to
> the head, so this subtraction can select a page before the folio.  If the
> preceding page belongs to another allocation, GPU access can expose or
> overwrite unrelated userspace data; an invalid page can also fault the
> kernel during its address conversion.  This worst case follows from the
> source, but has not been demonstrated on a real GPU.
>
> Add the query's PMD-relative page offset to the initial PFN, as the
> present PMD path already does.
>
> The device-private PMD migration machinery first shipped in 6.19. 
> Backport this fix to the maintained 7.3.y stable series; the HMM path
> exists in 6.18.y but cannot be reached through an in-tree PMD-producing
> device-private migration path there.
>
> Link: https://patch.msgid.link/179342234355.4.16705453209886955762@gmail.com
> Fixes: 10b9feee2d0d ("mm/hmm: populate PFNs from PMD swap entry")
> Signed-off-by: Aveline Noir <jm5905938@gmail.com>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Leon Romanovsky <leon@kernel.org>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Lorenzo Stoakes <ljs@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Patchwork <patchwork@emeril.freedesktop.org>
> Cc: SJ Park <sj@kernel.org>
> Cc: Vlastimil Babka <vbabka@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: Balbir Singh <balbirs@nvidia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Mika Penttilä <mpenttil@redhat.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: <stable@vger.kernel.org>
>
>  mm/hmm.c |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> --- a/mm/hmm.c~mm-hmm-account-for-subpage-offsets-in-device-private-pmds
> +++ a/mm/hmm.c
> @@ -355,7 +355,8 @@ static int hmm_vma_handle_absent_pmd(str
>  	    range->dev_private_owner) {
>  		unsigned long cpu_flags = HMM_PFN_VALID |
>  			hmm_pfn_flags_order(PMD_SHIFT - PAGE_SHIFT);
> -		unsigned long pfn = softleaf_to_pfn(entry);
> +		unsigned long pfn = softleaf_to_pfn(entry) +
> +			((start & ~PMD_MASK) >> PAGE_SHIFT);
>  		unsigned long i;
>  
>  		if (softleaf_is_device_private_write(entry))
> _

For this change:

Reviewed-by: Mika Penttilä <mpenttil@redhat.com>


