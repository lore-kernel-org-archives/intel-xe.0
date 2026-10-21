Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE44606A319
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 08:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R8Ftrnix
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB4410E093;
	Wed, 21 Oct 2026 08:12:00 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B258010E093
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 08:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1792570313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x9nlbn0Kjji4QycL/33Denq/qFQLa7BpbrMZy29ygbI=;
 b=R8FtrnixmJfx7YT5jQNxeY4qw4NSSxeW3645PxFJunc5J9wqR0vpTy4iMjqN3N2BOi/yKn
 +HmbW/J9t3y+PO/Wm9c5ebc1B9JrP+AArA4vuOHCdmovkFlG1oLSbskKOncIgztLg+DXMW
 QbYCsNbXD+dsQZ9+ovborl7qZvo/klg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-Bae2ehjaNs2fCGfdymqtaw-1; Wed, 21 Oct 2026 08:11:52 +0000
X-MC-Unique: Bae2ehjaNs2fCGfdymqtaw-1
X-Mimecast-MFC-AGG-ID: Bae2ehjaNs2fCGfdymqtaw_1792570311
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4a1e6ae710bso2915845e9.0
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 01:11:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792570311; x=1793175111;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=x9nlbn0Kjji4QycL/33Denq/qFQLa7BpbrMZy29ygbI=;
 b=PTv0ZGGKUry/IkalYgN/kxmUpLaHTxrYUTRIMoMEQmOL1CszGsDRQEhiyUkBvoTaQ0
 D5cYjsYFEI5REE2PDugaqNJwsEcD5hdi6Z4teHiw9H/0ewLjEaNIYcxY6npSKvdCvx3j
 kzVbN9tJ+eX3dbO0E+82PFQKp94u2LZlxjOmoawshxDo8jvcZXh+d0h+jLhom4aowxsz
 5gn4Hf+PWiHkb+tXwp9t0OcQc1tXD67LlPuu67mW9Nue4cpT5H8+2u8jzVdBkpXOomk3
 BiO7kvrpbxxnxyFLZjK4WYtLJEfJ6SDFq0VcUK7Wo5kIKZ3bCrxXpEq3/G5QyrEE4ctc
 4PcQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwiuleMJWkPCKDgJfq777YrPW2MEchY/nsSfb5Y0dE77rlwKzNeShaBqNh/cVk6aFh6lOxgqKbIwA==@lists.freedesktop.org
X-Gm-Message-State: AFq9FYL4dis52VnqSVa627yvi5DFhxIBxrk7DF+0wHE+GyRghCaWyWt6
 Khs8j+VQaVDG9HgJBUwsZQqWBpgiY26Gm+AH4b/rvIWbHMRpCxjw57NIe5+ILd2RRA0aJ/eL55f
 YSJED6Zs3U9IHokgU7VU+PT9ylayYFOqe2f+l08s3fFqrJH7LdOWFi/ARa/MwvWMHOdo=
X-Gm-Gg: AYBFou1+X+s9lIo2x8B0mV/KAOcjzHJYKY7dCdYLtWR9ozUmyDn35eE8Y+72B7rmMHJ
 uvSKUFKoeGD5GGObobTbHeneAZKP7UqE8WTVUdcXkvW4x/2OD9kiI4CqlVjg5ahL5PMv1TiCMQd
 L4OIMfi65fAvLbugDITKIJak8JHmYWof9KU2QenNpZshZ8OD26sYjzF3ywAiT2bX7l1QreuJH0Q
 9TIlCUgDBNVjh30lSkfVHGd3PhDfvEmNGL1Vq4Vahy3Bo1fI2UE/CUMe/kQG1HOuImiL2CCi5qk
 NdkB5BnrFsd1Qbw9LuKH1MJzFoskMw8tJb5gNl5VYwnzeIFSc8iK5zTb3fsaTyMNPEhFSLlD991
 z+wBd/WE1071XqefqQd/66lrfuUxw17Q=
X-Received: by 2002:a05:600c:1d21:b0:4a1:cef3:fb3a with SMTP id
 5b1f17b1804b1-4a1fdb1d85amr25860915e9.9.1792570310866; 
 Wed, 21 Oct 2026 01:11:50 -0700 (PDT)
X-Received: by 2002:a05:600c:1d21:b0:4a1:cef3:fb3a with SMTP id
 5b1f17b1804b1-4a1fdb1d85amr25860095e9.9.1792570310261; 
 Wed, 21 Oct 2026 01:11:50 -0700 (PDT)
Received: from [192.168.1.86] (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e25835247sm3779888f8f.41.2026.10.21.01.11.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Oct 2026 01:11:49 -0700 (PDT)
Message-ID: <8affcad2-7489-4f6a-aa64-3e5911073afb@redhat.com>
Date: Wed, 21 Oct 2026 11:11:47 +0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 03/12] mm/hmm: preparations for HMM to participate in
 migration
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
 <20261021060506.2377545-4-mpenttil@redhat.com>
 <017202b1-1c48-4fb1-a951-6d909fb30016@nvidia.com>
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <017202b1-1c48-4fb1-a951-6d909fb30016@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WsNkIIQ88RM-MlrFs79bAZ8FVjFlW2DneuM0c1qJISM_1792570311
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


On 10/21/26 10:17, Balbir Singh wrote:

> On 10/21/26 5:04 PM, mpenttil@redhat.com wrote:
>> From: Mika Penttilä <mpenttil@redhat.com>
>>
>> For migration to happen after hmm_range_fault(), the vma has to
>> retrieved. Luckily, pagewalk already resolves that for us, so
>> just have to save it for further use. For migration, mmap_lock
>> has to be hold for the whole operation, so vma stays stable.
>> In case lock-drop behavior is requested, return an error while
>> migrating. Also, rename some struct hmm_vma_walk fields to solve
>> namespace collisions, and we are later introducing more
>> xxlocked fields so be unambiguous.
>>
>> Take care also of firing the mmu_notifier when migrating.
>>
>> Also, prepare for differencies of how mm_struct * is retrieved
>> in fault and migrate_vma paths.
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
>>  include/linux/migrate.h |  50 +++++++++++++++++-
>>  lib/test_hmm.c          |   2 +-
>>  mm/hmm.c                | 110 ++++++++++++++++++++++++++++++++++------
>>  3 files changed, 145 insertions(+), 17 deletions(-)
>>
>> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
>> index 280ec9a866c7..dd7dd7ec6995 100644
>> --- a/include/linux/migrate.h
>> +++ b/include/linux/migrate.h
>> @@ -5,6 +5,7 @@
>>  #include <linux/mm.h>
>>  #include <linux/hmm.h>
>>  #include <linux/mempolicy.h>
>> +#include <linux/mmu_notifier.h>
>>  #include <linux/migrate_mode.h>
>>  #include <linux/hugetlb.h>
>>  
>> @@ -108,6 +109,29 @@ static inline void softleaf_entry_wait_on_locked(softleaf_t entry, spinlock_t *p
>>  	spin_unlock(ptl);
>>  }
>>  
>> +enum migrate_vma_info {
>> +	MIGRATE_VMA_SELECT_NONE = 0,
>> +	MIGRATE_VMA_SELECT_COMPOUND = MIGRATE_VMA_SELECT_NONE,
>> +};
>> +
>> +static inline enum migrate_vma_info hmm_select_migrate(struct hmm_range *range)
>> +{
>> +	return MIGRATE_VMA_SELECT_NONE;
>> +}
>> +
>> +static inline void hmm_fill_migrate_vma(struct hmm_range *range,
>> +					struct vm_area_struct *vma,
>> +					unsigned long start,
>> +					unsigned long end)
>> +{
>> +}
>> +
>> +#ifdef CONFIG_MMU_NOTIFIER
>> +static inline struct mm_struct *hmm_range_fault_mm(struct hmm_range *range)
>> +{
>> +	return range->notifier->mm;
>> +}
>> +#endif
>>  #endif /* CONFIG_MIGRATION */
>>  
>>  #ifdef CONFIG_NUMA_BALANCING
>> @@ -151,7 +175,8 @@ static inline unsigned long migrate_pfn(unsigned long pfn)
>>  	return (pfn << MIGRATE_PFN_SHIFT) | MIGRATE_PFN_VALID;
>>  }
>>  
>> -enum migrate_vma_direction {
>> +enum migrate_vma_info {
>> +	MIGRATE_VMA_SELECT_NONE = 0,
>>  	MIGRATE_VMA_SELECT_SYSTEM = 1 << 0,
>>  	MIGRATE_VMA_SELECT_DEVICE_PRIVATE = 1 << 1,
>>  	MIGRATE_VMA_SELECT_DEVICE_COHERENT = 1 << 2,
>> @@ -193,6 +218,29 @@ struct migrate_vma {
>>  	struct page		*fault_page;
>>  };
>>  
>> +// TODO: enable migration
>> +static inline enum migrate_vma_info hmm_select_migrate(struct hmm_range *range)
>> +{
>> +	return 0;
>> +}
>> +
>> +#ifdef CONFIG_MMU_NOTIFIER
>> +static inline struct mm_struct *hmm_range_fault_mm(struct hmm_range *range)
>> +{
>> +	return range->notifier ? range->notifier->mm : range->migrate->vma->vm_mm;
>> +}
>> +#endif
>> +
>> +static inline void hmm_fill_migrate_vma(struct hmm_range *range,
>> +					struct vm_area_struct *vma,
>> +					unsigned long start,
>> +					unsigned long end)
>> +{
>> +	range->migrate->vma   = vma;
>> +	range->migrate->start = start;
>> +	range->migrate->end   = end;
>> +}
>> +
>>  int migrate_vma_setup(struct migrate_vma *args);
>>  void migrate_vma_pages(struct migrate_vma *migrate);
>>  void migrate_vma_finalize(struct migrate_vma *migrate);
>> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
>> index 6911daa9f854..cd88e8177d0a 100644
>> --- a/lib/test_hmm.c
>> +++ b/lib/test_hmm.c
>> @@ -145,7 +145,7 @@ static bool dmirror_is_private_zone(struct dmirror_device *mdevice)
>>  		HMM_DMIRROR_MEMORY_DEVICE_PRIVATE);
>>  }
>>  
>> -static enum migrate_vma_direction
>> +static enum migrate_vma_info
>>  dmirror_select_device(struct dmirror *dmirror)
>>  {
>>  	return (dmirror->mdevice->zone_device_type ==
>> diff --git a/mm/hmm.c b/mm/hmm.c
>> index 2f1e98c6b644..4e9542aedc25 100644
>> --- a/mm/hmm.c
>> +++ b/mm/hmm.c
>> @@ -21,6 +21,7 @@
>>  #include <linux/pagemap.h>
>>  #include <linux/leafops.h>
>>  #include <linux/hugetlb.h>
>> +#include <linux/migrate.h>
>>  #include <linux/memremap.h>
>>  #include <linux/sched/mm.h>
>>  #include <linux/jump_label.h>
>> @@ -28,15 +29,23 @@
>>  #include <linux/pci-p2pdma.h>
>>  #include <linux/mmu_notifier.h>
>>  #include <linux/memory_hotplug.h>
>> +#include <asm/tlbflush.h>
>>  
>>  #include "internal.h"
>>  
>>  struct hmm_vma_walk {
>> -	struct hmm_range	*range;
>> -	bool			*locked;
>> -	unsigned long		last;
>> -	unsigned long		end;
>> -	unsigned int		required_fault;
>> +	struct mmu_notifier_range	mmu_range;
>> +	/* Set once mmu_range is armed with mmu_notifier_invalidate_range_start() */
>> +	bool				mmu_armed;
>> +	struct vm_area_struct		*vma;
>> +	struct hmm_range		*range;
>> +	unsigned long			start;
>> +	unsigned long			end;
>> +	unsigned long			last;
>> +	/* fault and lock drop related fields */
>> +	bool				*mmlocked;
>> +	unsigned long			fault_end;
>> +	unsigned int			required_fault;
>>  };
>>  
>>  /*
>> @@ -95,7 +104,7 @@ static int hmm_record_fault(unsigned long addr, unsigned long end,
>>  
>>  	WARN_ON_ONCE(!required_fault);
>>  	hmm_vma_walk->last = addr;
>> -	hmm_vma_walk->end = end;
>> +	hmm_vma_walk->fault_end = end;
>>  	hmm_vma_walk->required_fault = required_fault;
>>  	return HMM_FAULT_PENDING;
>>  }
>> @@ -400,6 +409,58 @@ static int hmm_vma_handle_absent_pmd(struct mm_walk *walk, unsigned long start,
>>  }
>>  #endif  /* CONFIG_ARCH_HAS_PMD_SOFTLEAVES */
>>  
>> +static int hmm_vma_capture_migrate_range(unsigned long start,
>> +					 unsigned long end,
>> +					 struct mm_walk *walk)
>> +{
>> +	struct hmm_vma_walk *hmm_vma_walk = walk->private;
>> +	struct hmm_range *range = hmm_vma_walk->range;
>> +
>> +	if (!hmm_select_migrate(range))
>> +		return 0;
>> +
>> +	if (hmm_vma_walk->vma && (hmm_vma_walk->vma != walk->vma))
>> +		return -ERANGE;
>> +
>> +	hmm_vma_walk->vma = walk->vma;
> I don't quite follow the check for -ERANGE, it checks for hmm_vma_walk->vma !=
> walk->vma, but then set's it later to be the same?

The intention is to catch a range that crosses a vma boundary. hmm_vma_walk lives across the restart loop in hmm_range_fault_locked(),
so test_walk can run again for the same vma after an -EBUSY re-walk. The first call records the vma, a re-walk of the same vma passes,
and a different vma means the range spans more than one vma, which migration doesn't support, so -ERANGE. 
The assignment only takes effect on the first call. I'll restructure it as "record if unset, else -ERANGE if different" and add a comment.

>
>> +
>> +	if (end - start > range->end - range->start)
>> +		return -ERANGE;
>> +
> Have we established that end > start and same for range->end > range->start?

Yes. walk_page_range() rejects start >= end before calling any callback, and hmm_range_fault_locked() walks from hmm_vma_walk.last 
(initially range->start) to range->end, so range->start < range->end holds whenever test_walk runs. 
The test_walk start/end are a sub-range of that walk clamped to the vma, so start < end too. 
That also means end - start can never exceed range->end - range->start, so the check is redundant. I'll drop it in v17.

>
>> +	if (!hmm_vma_walk->mmu_armed) {
>> +		hmm_vma_walk->start = start;
>> +		hmm_vma_walk->end = end;
> Does the walk range matter here?

The walk range is the caller's range clamped to the vma: with the caller's range inside a single vma the two are the same,
and the clamp keeps the walk range's end within the vma (migrate_vma needs that) if the caller's range extends past
the vma into a hole. The walk range is used as both the MMU_NOTIFY_MIGRATE invalidation range and the migrate_vma start/end,
and is set once on the first test_walk call. I'll also add a check that the walk range starts at range->start,
since migrate_vma indexes src[] from there.

>> +		mmu_notifier_range_init_owner(&hmm_vma_walk->mmu_range, MMU_NOTIFY_MIGRATE, 0,
>> +					      walk->vma->vm_mm, start, end,
>> +					      range->dev_private_owner);
>> +		mmu_notifier_invalidate_range_start(&hmm_vma_walk->mmu_range);
>> +		hmm_vma_walk->mmu_armed = true;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void hmm_vma_post_range_fault(struct hmm_vma_walk *hmm_vma_walk)
>> +{
>> +
>> +	struct hmm_range *range = hmm_vma_walk->range;
>> +
>> +	if (hmm_select_migrate(range) &&
>> +	    hmm_vma_walk->mmu_armed) {
>> +		/*
>> +		 *  The migrate_vma path has the following initialized,
>> +		 *  so take care of fault path below.
>> +		 */
>> +		if (range->notifier) {
>> +			hmm_fill_migrate_vma(range,
>> +					     hmm_vma_walk->vma,
>> +					     hmm_vma_walk->start,
>> +					     hmm_vma_walk->end);
>> +		}
>> +		mmu_notifier_invalidate_range_end(&hmm_vma_walk->mmu_range);
>> +	}
>> +}
>> +
>>  static int hmm_vma_walk_pmd(pmd_t *pmdp,
>>  			    unsigned long start,
>>  			    unsigned long end,
>> @@ -594,6 +655,11 @@ static int hmm_vma_walk_test(unsigned long start, unsigned long end,
>>  	struct hmm_vma_walk *hmm_vma_walk = walk->private;
>>  	struct hmm_range *range = hmm_vma_walk->range;
>>  	struct vm_area_struct *vma = walk->vma;
>> +	int r;
>> +
>> +	r = hmm_vma_capture_migrate_range(start, end, walk);
>> +	if (r)
>> +		return r;
>>  
>>  	if (!(vma->vm_flags & (VM_IO | VM_PFNMAP)) &&
>>  	    vma->vm_flags & VM_READ)
>> @@ -646,12 +712,12 @@ static int hmm_do_fault(struct mm_struct *mm,
>>  			struct hmm_vma_walk *hmm_vma_walk)
>>  {
>>  	unsigned long addr = hmm_vma_walk->last;
>> -	unsigned long end = hmm_vma_walk->end;
>> +	unsigned long end = hmm_vma_walk->fault_end;
>>  	unsigned int required_fault = hmm_vma_walk->required_fault;
>>  	unsigned int fault_flags = FAULT_FLAG_REMOTE;
>>  	struct vm_area_struct *vma;
>>  
>> -	if (hmm_vma_walk->locked)
>> +	if (hmm_vma_walk->mmlocked)
>>  		fault_flags |= FAULT_FLAG_ALLOW_RETRY | FAULT_FLAG_KILLABLE;
>>  
>>  	vma = vma_lookup(mm, addr);
>> @@ -670,8 +736,8 @@ static int hmm_do_fault(struct mm_struct *mm,
>>  		ret = handle_mm_fault(vma, addr, fault_flags, NULL);
>>  
>>  		if (ret & (VM_FAULT_COMPLETED | VM_FAULT_RETRY)) {
>> -			if (hmm_vma_walk->locked)    /* needed by sparse */
>> -				*hmm_vma_walk->locked = false;
>> +			if (hmm_vma_walk->mmlocked)    /* needed by sparse */
>> +				*hmm_vma_walk->mmlocked = false;
>>  			else
>>  				WARN_ON_ONCE(1);    /* broken fault handler */
>>  			return HMM_FAULT_UNLOCKED;
>> @@ -694,19 +760,31 @@ static int hmm_range_fault_locked(struct hmm_range *range, bool *locked)
>>  {
>>  	struct hmm_vma_walk hmm_vma_walk = {
>>  		.range = range,
>> -		.locked = locked,
>> +		.mmlocked = locked,
>>  		.last = range->start,
>>  	};
>> -	struct mm_struct *mm = range->notifier->mm;
>> +	/*
>> +	 *  Could be serving a device fault or come from migrate
>> +	 *  entry point. For the former we have not resolved the vma
>> +	 *  yet, and the latter we don't have a notifier (but have a vma).
>> +	 *
>> +	 */
>> +	struct mm_struct *mm = hmm_range_fault_mm(range);
>>  	int ret;
>>  
>> +	/* Migration is incompatible with mmap lock drop */
>> +	if (locked && hmm_select_migrate(range))
>> +		return -EINVAL;
>> +
>>  	mmap_assert_locked(mm);
>>  
>>  	do {
>>  		/* If range is no longer valid force retry. */
>> -		if (mmu_interval_check_retry(range->notifier,
>> -					     range->notifier_seq))
>> -			return -EBUSY;
>> +		if (range->notifier && mmu_interval_check_retry(range->notifier,
>> +								range->notifier_seq)) {
>> +			ret =  -EBUSY;
>> +			break;
>> +		}
>>  		ret = walk_page_range(mm, hmm_vma_walk.last, range->end,
>>  				      &hmm_walk_ops, &hmm_vma_walk);
>>  		/*
>> @@ -732,6 +810,8 @@ static int hmm_range_fault_locked(struct hmm_range *range, bool *locked)
>>  		 * output, and all >= are still at their input values.
>>  		 */
>>  	} while (ret == -EBUSY);
>> +
>> +	hmm_vma_post_range_fault(&hmm_vma_walk);
> Have you checked to see if we could end up with notifier start/end inbalance?
> For example if hmm_select_migrate returns false?

Yes. invalidate_range_start() is only called from hmm_vma_capture_migrate_range(), after the hmm_select_migrate()
check and only once (mmu_armed). invalidate_range_end() is only called from hmm_vma_post_range_fault() when mmu_armed
is set. hmm_select_migrate() doesn't change during the call, so if it returns false neither is called.
Every exit from the loop goes through hmm_vma_post_range_fault(); except after test for lock drop which happens before walks.

>
>>  	return ret;
>>  }
>>  

Thanks,
--Mika

