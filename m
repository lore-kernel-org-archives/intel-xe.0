Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E87CCD18D
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 17:54:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8326C10E4AC;
	Mon, 13 Oct 2025 17:54:37 +0000 (UTC)
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1621310E4AC
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 17:54:35 +0000 (UTC)
Message-ID: <a5b00e69-40d0-4753-9379-271567935ec8@lankhorst.se>
Date: Mon, 13 Oct 2025 19:54:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/6] drm/xe: Move struct xe_ggtt to xe_ggtt.c
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20251010120655.1046007-8-dev@lankhorst.se>
 <20251010120655.1046007-14-dev@lankhorst.se>
 <effaed91-6b8a-4445-8a13-63ff3b9bff8d@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <effaed91-6b8a-4445-8a13-63ff3b9bff8d@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hey,

Den 2025-10-10 kl. 17:05, skrev Michal Wajdeczko:
> 
> 
> On 10/10/2025 2:07 PM, Maarten Lankhorst wrote:
>> From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>
>> No users left outside of xe_ggtt.c, so we can make the struct private.
>>
>> This prevents us from accidentally touching it before init.
>>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>> ---
>>  drivers/gpu/drm/xe/xe_ggtt.c       | 52 ++++++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_ggtt_types.h | 51 -----------------------------
>>  2 files changed, 52 insertions(+), 51 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>> index 25f931e4b73a4..6118278c0b59b 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.c
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
>> @@ -67,6 +67,58 @@
>>   * give us the correct placement for free.
>>   */
>>  
>> +/**
>> + * struct xe_ggtt_pt_ops - GGTT Page table operations
>> + * Which can vary from platform to platform.
>> + */
>> +struct xe_ggtt_pt_ops {
>> +	/** @pte_encode_flags: Encode PTE flags for a given BO */
>> +	u64 (*pte_encode_flags)(struct xe_bo *bo, u16 pat_index);
>> +
>> +	/** @ggtt_set_pte: Directly write into GGTT's PTE */
>> +	xe_ggtt_set_pte_fn ggtt_set_pte;
>> +};
>> +
>> +/**
>> + * struct xe_ggtt - Main GGTT struct
>> + *
>> + * In general, each tile can contains its own Global Graphics Translation Table
>> + * (GGTT) instance.
>> + */
>> +struct xe_ggtt {
>> +	/** @tile: Back pointer to tile where this GGTT belongs */
>> +	struct xe_tile *tile;
>> +        /** @start: Start offset of GGTT */
>> +	u64 start;
>> +	/** @size: Total usable size of this GGTT */
>> +	u64 size;
>> +
>> +#define XE_GGTT_FLAGS_64K BIT(0)
>> +	/**
>> +	 * @flags: Flags for this GGTT
>> +	 * Acceptable flags:
>> +	 * - %XE_GGTT_FLAGS_64K - if PTE size is 64K. Otherwise, regular is 4K.
>> +	 */
>> +	unsigned int flags;
>> +	/** @scratch: Internal object allocation used as a scratch page */
>> +	struct xe_bo *scratch;
>> +	/** @lock: Mutex lock to protect GGTT data */
>> +	struct mutex lock;
>> +	/**
>> +	 *  @gsm: The iomem pointer to the actual location of the translation
>> +	 * table located in the GSM for easy PTE manipulation
>> +	 */
>> +	u64 __iomem *gsm;
>> +	/** @pt_ops: Page Table operations per platform */
>> +	const struct xe_ggtt_pt_ops *pt_ops;
>> +	/** @mm: The memory manager used to manage individual GGTT allocations */
>> +	struct drm_mm mm;
>> +	/** @access_count: counts GGTT writes */
>> +	unsigned int access_count;
>> +	/** @wq: Dedicated unordered work queue to process node removals */
>> +	struct workqueue_struct *wq;
>> +};
>> +
>>  static u64 xelp_ggtt_pte_flags(struct xe_bo *bo, u16 pat_index)
>>  {
>>  	u64 pte = XE_PAGE_PRESENT;
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
>> index ef26e7ce5064e..715b7cc4cfcdb 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
>> @@ -13,46 +13,6 @@
>>  struct xe_bo;
>>  struct xe_gt;
>>  
>> -/**
>> - * struct xe_ggtt - Main GGTT struct
>> - *
>> - * In general, each tile can contains its own Global Graphics Translation Table
>> - * (GGTT) instance.
>> - */
>> -struct xe_ggtt {
>> -	/** @tile: Back pointer to tile where this GGTT belongs */
>> -	struct xe_tile *tile;
>> -	/** @start: Start offset of GGTT */
>> -	u64 start;
>> -	/** @size: Total usable size of this GGTT */
>> -	u64 size;
>> -
>> -#define XE_GGTT_FLAGS_64K BIT(0)
>> -	/**
>> -	 * @flags: Flags for this GGTT
>> -	 * Acceptable flags:
>> -	 * - %XE_GGTT_FLAGS_64K - if PTE size is 64K. Otherwise, regular is 4K.
>> -	 */
>> -	unsigned int flags;
>> -	/** @scratch: Internal object allocation used as a scratch page */
>> -	struct xe_bo *scratch;
>> -	/** @lock: Mutex lock to protect GGTT data */
>> -	struct mutex lock;
>> -	/**
>> -	 *  @gsm: The iomem pointer to the actual location of the translation
>> -	 * table located in the GSM for easy PTE manipulation
>> -	 */
>> -	u64 __iomem *gsm;
>> -	/** @pt_ops: Page Table operations per platform */
>> -	const struct xe_ggtt_pt_ops *pt_ops;
>> -	/** @mm: The memory manager used to manage individual GGTT allocations */
>> -	struct drm_mm mm;
>> -	/** @access_count: counts GGTT writes */
>> -	unsigned int access_count;
>> -	/** @wq: Dedicated unordered work queue to process node removals */
>> -	struct workqueue_struct *wq;
>> -};
>> -
>>  /**
>>   * struct xe_ggtt_node - A node in GGTT.
> 
> hmm, leaving xe_ggtt_node here is surprising as initial work was about hiding its implementation details
> 
> shouldn't we start with finishing the cleanup of any users who are still accessing xe_ggtt_node directly ?
> 
> and then we can just make sure that ggtt_types.h in *only* included from ggtt.c 

I'm working on improving this now. Looks like it's mostly trivial except xe_gt_sriov_pf.c is not using the xe_bo_ggtt_addr. Will try to fix this in a bit.
Hoping the next version will not need to expose xe_ggtt_node, and then trivially not need to have the offset applied on each node separately.

Kind regards,
~Maarten Lankhorst
