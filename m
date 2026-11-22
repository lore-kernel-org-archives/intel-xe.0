Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CF0606A32A
	for <intel-xe@archiver.kernel.org>; Sun, 22 Nov 2026 17:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HqjAVRcA
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A4610E718;
	Sun, 22 Nov 2026 17:37:26 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A068010E72D
 for <intel-xe@lists.freedesktop.org>; Sun, 22 Nov 2026 17:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1795369039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3khkEbh3+4+UW9EqZNzFj2fkzRmCDGkNMhSbTs+zklo=;
 b=HqjAVRcAc5ZPh7rkewVCMDRv6W8cTnJ/zFn46Ve6prck8KZ4nm+tsVm9n8KCfDkEg+kXUV
 n/qKw/1hWyBoYkHOmN3vvtD9JiH4+K1c3TdPP/hhCloVG44QavKdcW+MoQZsN5HB3tXUc9
 fkyQFDst4xcS3AowsU/JAYEiQY8e9q4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-328-cTCfvc2fMmmQ5oeQtvT8hQ-1; Sun, 22 Nov 2026 17:37:15 +0000
X-MC-Unique: cTCfvc2fMmmQ5oeQtvT8hQ-1
X-Mimecast-MFC-AGG-ID: cTCfvc2fMmmQ5oeQtvT8hQ_1795369033
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4bb9379a835so5643205e9.3
 for <intel-xe@lists.freedesktop.org>; Sun, 22 Nov 2026 09:37:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795369033; x=1795973833;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3khkEbh3+4+UW9EqZNzFj2fkzRmCDGkNMhSbTs+zklo=;
 b=jlJX3du9L2vzG8t9AV3z4Dtl/3OaD6VwMKeJWLtmlEcf26IVQwPVxBvHV6L4MQ2FNp
 ue/e2jBNgrm18OoumsbQ5oILqzlRJIhFLRwTSNyDrKiSZziU0XOZ3L6dow9e17/fsRT5
 Jz1GlQsiDTep/5OKsG5l5yYFevdlDXvJ0PgCq3mBFgeg56k1wTTWrw8BLSdDik7xuHlz
 WPCnA54L0snpNlftj8Fat/Dmm8LQ3celms+wrkEa3FmIGX3SzTFFyoT9x4dzjKGE1yvK
 3/iKIqL6OogSAsEcE8P817to56G0/lnzYlkfI9Y8n9LhX7cdSrTzH3rVqDZttm1OZbLQ
 kgdw==
X-Forwarded-Encrypted: i=1;
 AL+hErHT3vfvoCin3usKZz7KZb1qWyW838dVciTZrd7/MKEd8S/pmf/PpwqbTX2uDlh+BMGSHBxrvj+mMA==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z/AQ6RBrLR84QFZs9PrEprwkzN+LOgG77qDBpTMojQDtIWq9y/O
 Y17zdEL4f3tdfzRHGEPFNCio8+FL8W3NSPrcT1kzSS5IJ08kAND5ra8qJ2jUPsnRKO54rsTDI2y
 kh88jEgvpKWdmwaJeFlb1UXkl2q0NtrPwS8oIbHQ5tIzFQ5IG+cIk9u0GV/NIeZdp9/0=
X-Gm-Gg: AZFdTZfgYrE9qc3ohWuTGcnI6EUkeC9aEqOvOgUpX5NEsGHiYBdNCTiNoIwcUZ5naqx
 7jxQ8x0rITJqBu19G+WJVaNcIFwhGVT1SlpqgFHbaC/LjiS/WJFieVwrb6W52Zh196riRj3VJwo
 aJwoHOGX0fbli82xec+fbettBP/oYSQmutEhV68cjOPGuCGKU5BzXgmFjlEXf5CfT73qIaoIdrt
 v/2N158AnEytp3LaT6a6KA6srv8fXoygldcUUW+0s0zJkK8r9gcMD81WlXl8PoAle/LjGURy7IY
 Nt+fV7KjrDwG08OyuuzD5dAsaRRyOrhyscAU4NnZE7kNouretK2oEEmtEyqc3wySSz0m4n4U30k
 Y70nQvPDqtvCwfERRLlpI53JJ3tXmBgLxlXz5OlSdmY6q06/eMJ+OAm77822Wa8B4ZKo1qt4a5P
 QxSJoR
X-Received: by 2002:a05:600c:674f:b0:4bb:56bb:1196 with SMTP id
 5b1f17b1804b1-4bb8880fb9bmr195004165e9.23.1795369033356; 
 Sun, 22 Nov 2026 09:37:13 -0800 (PST)
X-Received: by 2002:a05:600c:674f:b0:4bb:56bb:1196 with SMTP id
 5b1f17b1804b1-4bb8880fb9bmr195003715e9.23.1795369032886; 
 Sun, 22 Nov 2026 09:37:12 -0800 (PST)
Received: from [192.168.1.86] (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb906cdcc1sm114828375e9.2.2026.11.22.09.37.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Nov 2026 09:37:12 -0800 (PST)
Message-ID: <2f60e148-f9ea-4b48-b8b9-3c524b6a8a2d@redhat.com>
Date: Sun, 22 Nov 2026 19:37:09 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/hmm: account for subpage offsets in device-private PMDs
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Aveline Noir <jm5905938@gmail.com>, airlied@gmail.com,
 apopple@nvidia.com, balbirs@nvidia.com, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, Francois Dugast
 <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org, jgg@nvidia.com,
 jgg@ziepe.ca, leon@kernel.org, leonro@nvidia.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Matthew Brost <matthew.brost@intel.com>, mm-commits@vger.kernel.org,
 Patchwork <patchwork@emeril.freedesktop.org>, Shuah Khan <shuah@kernel.org>,
 SeongJae Park <sj@kernel.org>, thomas.hellstrom@linux.intel.com,
 Vlastimil Babka <vbabka@suse.cz>, ziy@nvidia.com
References: <179342234355.4.16705453209886955762@gmail.com>
 <20261121160037.1a479f3c8b4e860bc23c106d@linux-foundation.org>
 <36be0904-168d-4813-82ff-27ecced464e3@redhat.com>
 <20261122015246.d8b6b98ff5a8157168156339@linux-foundation.org>
 <179535872126.34.4789080961796247940.b4-reply@b4>
 <af91d4a7-11ca-4f84-b8da-33ee1a585916@redhat.com>
 <20261122091419.f82e88761dbd12771fb6c976@linux-foundation.org>
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <20261122091419.f82e88761dbd12771fb6c976@linux-foundation.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Nz0h7SYE6Ft96bvQu2H7fjQy2ESXSMSGhQ-RCwhioEQ_1795369033
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


On 11/22/26 19:14, Andrew Morton wrote:
> On Sun, 22 Nov 2026 18:41:39 +0200 Mika Penttilä <mpenttil@redhat.com> wrote:
>
>> On 11/22/26 16:45, Aveline Noir wrote:
>>
>>> Hi Andrew,
>>>
>>> On Sun, 22 Nov 2026 01:52:46 -0800 Andrew Morton wrote:
>>>
>>>> Store the corresponding RAM backing page instead.
>>> This avoids the oops on the first read through the second descriptor,
>>> but leaves a stale backing page pointer after CPU faultback.
>>>
>>> Since the mirror XArray entries don't take a page reference, they rely
>>> on invalidation.  When the CPU later faults the page back to RAM,
>>> dmirror_interval_invalidate() skips MMU_NOTIFY_MIGRATE for the same
>>> mdevice, and dmirror_devmem_fault_alloc_and_copy() only clears the
>>> migrating descriptor's entry before the backing folio is freed.  The
>>> second descriptor still points to that freed backing page.
>>>
>>> Reading the same page again through the second descriptor in QEMU
>>> triggers a KASAN use-after-free in dmirror_do_read(), and the read
>>> returns the stale data instead of what the CPU wrote.
>> I think this is right, but a fairly artificial scenario: it needs two
>> descriptors open on the same test device in one test, a migration through one,
>> a read through the other, a CPU fault back, and then another read through
>> the second descriptor..
>>
>> The fix lets the device private page content be read without an oops
>> in the context of one fd which is an improvement. 
> May as well fix it.  I'll test this updated version.
>
> Mika, please feel free to take this over, perhaps integrate it (or
> something like it) into whatever you've got going on?  Or not, let me
> know ;)

I can handle it in the context where it made difference for me.

>
> From: Andrew Morton <akpm@linux-foundation.org>
> Subject: lib/test_hmm: invalidate all mirrors on device-private migration
> Date: Sun, 22 Nov 2026 08:53:12 -0800
>
> When one open of the fake HMM device migrates a folio to device-private
> memory, a second open can fault the same address into its mirror page
> table. The second mirror then stores the inaccessible device page, which
> can oops the kernel when dmirror_do_read() copies from it. Store the
> corresponding RAM backing subpage instead.
>
> That conversion also makes the backing page's lifetime significant to
> the second mirror. migrate_vma_setup() notifies all mirrors before CPU
> faultback, but dmirror_interval_invalidate() skips the notification for
> every open on the same device. The faulting open clears only its own
> XArray entry. The other open can read or write the backing page after
> migrate_vma_finalize() frees it. Aveline reported a KASAN use-after-free
> and stale data through the second open.
>
> Handle migration invalidation for every mirror under its mutex. This
> clears pointers before faultback can free the backing pages and waits
> for an active mirror read or write. During system-to-device migration,
> the migrating open installs new entries after migration; other opens
> refault on their next access. Remove the now redundant XArray erase
> from the faultback copy loop.
>
> Extend the PMD migration selftest to read its last device-private
> subpage through a second open, then fault it back to RAM, change it,
> and read the new value through that open. The trigger is available to
> a process permitted to open /dev/hmm_dmirror* when CONFIG_TEST_HMM is
> enabled; it does not depend on physical GPU hardware.
>
> Link: https://lore.kernel.org/r/20261122015246.d8b6b98ff5a8157168156339@linux-foundation.org
> Link: https://lore.kernel.org/r/179535872126.34.4789080961796247940.b4-reply@b4
> Fixes: b2ef9f5a5cb3 ("mm/hmm/test: add selftest driver for HMM")
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> Reported-by: Aveline Noir <jm5905938@gmail.com>
> Cc: Ralph Campbell <rcampbell@nvidia.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Leon Romanovsky <leon@kernel.org>
> Cc: Mika Penttilä <mpenttil@redhat.com>
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Liam R. Howlett <liam@infradead.org>
> Cc: Vlastimil Babka <vbabka@kernel.org>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: <stable@vger.kernel.org>
>
>  lib/test_hmm.c                         |   20 +++++++-----------
>  tools/testing/selftests/mm/hmm-tests.c |   25 +++++++++++++++++++++++
>  2 files changed, 33 insertions(+), 12 deletions(-)
>
> --- a/lib/test_hmm.c~lib-test_hmm-invalidate-all-mirrors-on-device-private-migration
> +++ a/lib/test_hmm.c
> @@ -292,6 +292,12 @@ static int dmirror_do_fault(struct dmirr
>  		page = hmm_pfn_to_page(*pfns);
>  		WARN_ON(!page);
>  
> +		if (is_device_private_page(page)) {
> +			struct folio *folio = page_folio(page);
> +
> +			page = BACKING_PAGE(&folio->page) +
> +				folio_page_idx(folio, page);
> +		}
>  		entry = page;
>  		if (*pfns & HMM_PFN_WRITE)
>  			entry = xa_tag_pointer(entry, DPT_XA_TAG_WRITE);
> @@ -327,14 +333,6 @@ static bool dmirror_interval_invalidate(
>  {
>  	struct dmirror *dmirror = container_of(mni, struct dmirror, notifier);
>  
> -	/*
> -	 * Ignore invalidation callbacks for device private pages since
> -	 * the invalidation is handled as part of the migration process.
> -	 */
> -	if (range->event == MMU_NOTIFY_MIGRATE &&
> -	    range->owner == dmirror->mdevice)
> -		return true;
> -
>  	if (mmu_notifier_range_blockable(range))
>  		mutex_lock(&dmirror->mutex);
>  	else if (!mutex_trylock(&dmirror->mutex))
> @@ -1198,7 +1196,6 @@ static vm_fault_t dmirror_devmem_fault_a
>  
>  			src_page = pfn_to_page(page_to_pfn(spage) + i);
>  
> -			xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
>  			addr += PAGE_SIZE;
>  			copy_highpage(dst_page, src_page);
>  		}
> @@ -1822,9 +1819,8 @@ static vm_fault_t dmirror_devmem_fault(s
>  	}
>  	migrate_vma_pages(&args);
>  	/*
> -	 * No device finalize step is needed since
> -	 * dmirror_devmem_fault_alloc_and_copy() will have already
> -	 * invalidated the device page table.
> +	 * The migration notifier has invalidated all mirror page tables
> +	 * before the backing pages can be freed.
>  	 */
>  	migrate_vma_finalize(&args);
>  err:
> --- a/tools/testing/selftests/mm/hmm-tests.c~lib-test_hmm-invalidate-all-mirrors-on-device-private-migration
> +++ a/tools/testing/selftests/mm/hmm-tests.c
> @@ -2087,6 +2087,7 @@ TEST_F(hmm, migrate_anon_huge_fault)
>  	void *old_ptr;
>  	void *map;
>  	int pagemap_fd;
> +	int fd2 = -1;
>  	int *ptr;
>  	int ret;
>  
> @@ -2143,12 +2144,36 @@ TEST_F(hmm, migrate_anon_huge_fault)
>  		}
>  
>  		close(pagemap_fd);
> +
> +		/* Read a device-private subpage through another open. */
> +		fd2 = hmm_open(variant->device_number);
> +		ASSERT_GE(fd2, 0);
> +		buffer->ptr = (char *)map + (npages - 1) * self->page_size;
> +		ret = hmm_dmirror_cmd(fd2, HMM_DMIRROR_READ, buffer, 1);
> +		buffer->ptr = map;
> +		ASSERT_EQ(ret, 0);
> +		ASSERT_EQ(buffer->cpages, 1);
> +		ASSERT_EQ(*(int *)buffer->mirror,
> +			  (npages - 1) * self->page_size / sizeof(int));
>  	}
>  
>  	/* Fault pages back to system memory and check them. */
>  	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
>  		ASSERT_EQ(ptr[i], i);
>  
> +	if (fd2 >= 0) {
> +		/* This open must not retain the freed device backing page. */
> +		ptr[(npages - 1) * self->page_size / sizeof(*ptr)] = -1;
> +		buffer->ptr = (char *)map + (npages - 1) * self->page_size;
> +		ret = hmm_dmirror_cmd(fd2, HMM_DMIRROR_READ, buffer, 1);
> +		buffer->ptr = map;
> +		ASSERT_EQ(ret, 0);
> +		ASSERT_EQ(buffer->cpages, 1);
> +		ASSERT_EQ(buffer->faults, 1);
> +		ASSERT_EQ(*(int *)buffer->mirror, -1);
> +		ASSERT_EQ(close(fd2), 0);
> +	}
> +
>  	buffer->ptr = old_ptr;
>  	hmm_buffer_free(buffer);
>  }
> _

--Mika

