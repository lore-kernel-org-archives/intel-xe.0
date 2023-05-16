Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E2DC77B7A
	for <intel-xe@archiver.kernel.org>; Tue, 16 May 2023 12:29:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D7B10E0C6;
	Tue, 16 May 2023 12:29:46 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB04210E0C6
 for <intel-xe@lists.freedesktop.org>; Tue, 16 May 2023 12:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684240183; x=1715776183;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vzv1OLmkfhCu3cZ217PKUW6szFywUCRfryqB/wMnmDU=;
 b=k0/gRYaDcsCSUTJBuB3MCFIvpEEvb3mnLgY+z6oz4UW7KZDcWYF1OHgu
 BzVitgkqmP/gz5R230m/0NLISyE8w1FFrSJkIi0U38fi6wR7Rc9iJgx0P
 aTBqbCMmz+fS8HSM0NaV9JlCpFynJ3WP39rTqsoiBxCc6KTDf7CsvXsUe
 JZxTFIqAQ6Po9m7jNsTi8p+0mpDUM+SHSf5vEB99oAuC+5Biho+1lWTL6
 Uo/ooUSaWIDFWs2jeXHvB3gCIz3PWCddvB9LoxLbp+VvabwzQqHCigymn
 JxsfQRipg0GNwB2PFzJfBECdCBa+pMjl93+Qjk50/PpOLLzU7kjvLjYvQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="331825716"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="331825716"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 05:29:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="947836319"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="947836319"
Received: from dmarkey-mobl1.ger.corp.intel.com (HELO [10.252.19.120])
 ([10.252.19.120])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 05:29:41 -0700
Message-ID: <cbfad872-2394-08f9-72b5-7fd8ad75d878@intel.com>
Date: Tue, 16 May 2023 13:29:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Content-Language: en-GB
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20230515192628.1990279-1-michael.j.ruhl@intel.com>
 <20230515192628.1990279-4-michael.j.ruhl@intel.com>
 <0486d296-ecdf-715f-41b0-46e08a421a83@intel.com>
 <IA1PR11MB6418A9EEE3B11FDEBC725F98C1799@IA1PR11MB6418.namprd11.prod.outlook.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <IA1PR11MB6418A9EEE3B11FDEBC725F98C1799@IA1PR11MB6418.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 3/4] drm/xe: Size GT device memory correctly
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

On 16/05/2023 13:19, Ruhl, Michael J wrote:
>> -----Original Message-----
>> From: Auld, Matthew <matthew.auld@intel.com>
>> Sent: Tuesday, May 16, 2023 5:45 AM
>> To: Ruhl, Michael J <michael.j.ruhl@intel.com>; intel-
>> xe@lists.freedesktop.org
>> Cc: Brost, Matthew <matthew.brost@intel.com>; Kershner, David
>> <david.kershner@intel.com>; Ghimiray, Himal Prasad
>> <himal.prasad.ghimiray@intel.com>; Upadhyay, Tejas
>> <tejas.upadhyay@intel.com>
>> Subject: Re: [PATCH 3/4] drm/xe: Size GT device memory correctly
>>
>> On 15/05/2023 20:26, Michael J. Ruhl wrote:
>>> The current method of sizing GT device memory is not quite right.
>>>
>>> Update the algorithm to use the relevant HW information and offsets
>>> to set up the sizing correctly.
>>>
>>> Update the stolen memory sizing to reflect the changes, and to be
>>> GT specific.
>>>
>>> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_device_types.h |  2 +
>>>    drivers/gpu/drm/xe/xe_gt_types.h     |  2 +
>>>    drivers/gpu/drm/xe/xe_mmio.c         | 91 ++++++++++++++--------------
>>>    3 files changed, 49 insertions(+), 46 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
>> b/drivers/gpu/drm/xe/xe_device_types.h
>>> index a10ce67f11df..b00a23199492 100644
>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>> @@ -203,6 +203,8 @@ struct xe_device {
>>>    			resource_size_t io_size;
>>>    			/** @size: Total size of VRAM */
>>>    			resource_size_t size;
>>> +			/** @base: Offset to apply for Device Physical
>> Address control */
>>> +			resource_size_t base;
>>>    			/** @mapping: pointer to VRAM mappable space */
>>>    			void *__iomem mapping;
>>>    		} vram;
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h
>> b/drivers/gpu/drm/xe/xe_gt_types.h
>>> index 4b66e059ba9b..47f059bb8c6d 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>>> @@ -155,6 +155,8 @@ struct xe_gt {
>>>    			 * the first 256M). This configuration is known as small-
>> bar.
>>>    			 */
>>>    			resource_size_t io_size;
>>> +			/** @base: offset of VRAM starting base */
>>> +			resource_size_t base;
>>>    			/** @size: size of VRAM. */
>>>    			resource_size_t size;
>>>    			/** @mapping: pointer to VRAM mappable space */
>>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c
>> b/drivers/gpu/drm/xe/xe_mmio.c
>>> index c8b0eb5aab36..02fe2e71abe2 100644
>>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>>> @@ -185,6 +185,8 @@ static int xe_determine_lmem_bar_size(struct
>> xe_device *xe)
>>>    	if (!xe->mem.vram.io_size)
>>>    		return -EIO;
>>>
>>> +	xe->mem.vram.base = 0; /* DPA offset */
>>> +
>>>    	/* set up a map to the total memory area. */
>>>    	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe-
>>> mem.vram.io_size);
>>>
>>> @@ -246,6 +248,9 @@ int xe_mmio_tile_vram_size(struct xe_gt *gt, u64
>> *vram_size, u64 *tile_size, u64
>>>
>>>    int xe_mmio_probe_vram(struct xe_device *xe)
>>>    {
>>> +	resource_size_t io_size;
>>> +	u64 available_size = 0;
>>> +	u64 total_size = 0;
>>>    	struct xe_gt *gt;
>>>    	u64 tile_offset;
>>>    	u64 tile_size;
>>> @@ -271,64 +276,58 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>>>    		drm_warn(&xe->drm, "Restricting VRAM size to PCI resource
>> size (0x%llx->0x%llx)\n",
>>>    			 vram_size, (u64)xe->mem.vram.io_size);
>>>
>>> -	/* Limit size to available memory to account for the current memory
>> algorithm */
>>> -	xe->mem.vram.io_size = min_t(u64, xe->mem.vram.io_size,
>> vram_size);
>>> -	xe->mem.vram.size = xe->mem.vram.io_size;
>>> -
>>>    	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe-
>>> mem.vram.io_start,
>>>    		 &xe->mem.vram.io_size);
>>>
>>> -	/* FIXME: Assuming equally partitioned VRAM, incorrect */
>>> -	if (xe->info.tile_count > 1) {
>>> -		u8 adj_tile_count = xe->info.tile_count;
>>> -		resource_size_t size, io_start, io_size;
>>> +	io_size = xe->mem.vram.io_size;
>>>
>>> -		for_each_gt(gt, xe, id)
>>> -			if (xe_gt_is_media_type(gt))
>>> -				--adj_tile_count;
>>> +	/* gt specific ranges */
>>> +	for_each_gt(gt, xe, id) {
>>> +		if (xe_gt_is_media_type(gt))
>>> +			continue;
>>>
>>> -		XE_BUG_ON(!adj_tile_count);
>>> +		err = xe_mmio_tile_vram_size(gt, &vram_size, &tile_size,
>> &tile_offset);
>>> +		if (err)
>>> +			return err;
>>>
>>> -		size = xe->mem.vram.size / adj_tile_count;
>>> -		io_start = xe->mem.vram.io_start;
>>> -		io_size = xe->mem.vram.io_size;
>>> +		gt->mem.vram.io_start = xe->mem.vram.io_start +
>> tile_offset;
>>> +		gt->mem.vram.io_size = min_t(u64, vram_size, io_size);
>>>
>>> -		for_each_gt(gt, xe, id) {
>>> -			if (id && !xe_gt_is_media_type(gt)) {
>>> -				io_size -= min(io_size, size);
>>> -				io_start += io_size;
>>> -			}
>>> +		if (!gt->mem.vram.io_size) {
>>> +			drm_err(&xe->drm, "Tile without any CPU visible
>> VRAM. Aborting.\n");
>>> +			return -ENODEV;
>>> +		}
>>>
>>> -			gt->mem.vram.size = size;
>>> -
>>> -			/*
>>> -			 * XXX: multi-tile small-bar might be wild. Hopefully
>>> -			 * full tile without any mappable vram is not
>> something
>>> -			 * we care about.
>>> -			 */
>>> -
>>> -			gt->mem.vram.io_size = min(size, io_size);
>>> -			if (io_size) {
>>> -				gt->mem.vram.io_start = io_start;
>>> -				gt->mem.vram.mapping = xe-
>>> mem.vram.mapping +
>>> -					(io_start - xe->mem.vram.io_start);
>>> -			} else {
>>> -				drm_err(&xe->drm, "Tile without any CPU
>> visible VRAM. Aborting.\n");
>>> -				return -ENODEV;
>>> -			}
>>> +		gt->mem.vram.base = tile_offset;
>>> +		gt->mem.vram.size = vram_size;
>>
>> Here I think we need the min(io_size, vram_size) or similar. Otherwise
>> we will get crashes like:
> 
> Hmm the vram.io_size is limited like that...
> 
> Thought that the vram.size should be the "actual size".

It should be, but we first need those patches that support distinct 
io_size and vram_size. Without that our current best option is to just 
"clamp" to the io_size on small-bar systems.

> 
> This is disappointing.. I see what needs to get fixed.
> 
> Thanks,
> 
> M
> 
> 
>> [ 1724.144058] BUG: unable to handle page fault for address:
>> ffffc9032a000000
>> [ 1724.144062] #PF: supervisor write access in kernel mode
>> [ 1724.144064] #PF: error_code(0x0002) - not-present page
>> [ 1724.144066] PGD 100000067 P4D 100000067 PUD 0
>> [ 1724.144069] Oops: 0002 [#1] PREEMPT SMP NOPTI
>> [ 1724.144072] CPU: 8 PID: 6557 Comm: i915_module_loa Tainted: G     U
>>            6.3.0+ #27
>> [ 1724.144075] Hardware name: Intel Corporation Alder Lake Client
>> Platform/AlderLake-S ADP-S DDR5 UDIMM CRB, BIOS
>> ADLSFWI1.R00.3275.A00.2207010640 07/01/2022
>> [ 1724.144078] RIP: 0010:memset_erms+0x9/0x20
>> [ 1724.144083] Code: cc cc cc cc 66 66 2e 0f 1f 84 00 00 00 00 00 66 90
>> 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 49 89 f9 40 88 f0 48 89
>> d1 <f3> aa 4c 89 c8 c3 cc cc cc cc 66 66 2e 0f 1f 84 00 00 00 00 00 66
>> [ 1724.144087] RSP: 0018:ffffc90003a6bba0 EFLAGS: 00010202
>> [ 1724.144089] RAX: ffff88813e345000 RBX: ffff88812fff3b70 RCX:
>> 0000000000850000
>> [ 1724.144091] RDX: 0000000000850000 RSI: 0000000000000000 RDI:
>> ffffc9032a000000
>> [ 1724.144093] RBP: ffffc90003a6bbd0 R08: 0000000000850000 R09:
>> ffffc9032a000000
>> [ 1724.144095] R10: 0000000000000001 R11: 0000000000000001 R12:
>> 0000000000660000
>> [ 1724.144097] R13: ffff88812fff4958 R14: ffff88812fff2210 R15:
>> ffff88812fff3b20
>> [ 1724.144099] FS:  00007fa921a819c0(0000) GS:ffff88888b000000(0000)
>> knlGS:0000000000000000
>> [ 1724.144101] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [ 1724.144103] CR2: ffffc9032a000000 CR3: 000000012ef62006 CR4:
>> 0000000000770ee0
>> [ 1724.144105] PKRU: 55555554
>> [ 1724.144106] Call Trace:
>> [ 1724.144107]  <TASK>
>> [ 1724.144108]  xe_guc_ads_populate_minimal+0x195/0x1e0 [xe]
>> [ 1724.144164]  xe_guc_min_load_for_hwconfig+0xd/0x40 [xe]
>> [ 1724.144201]  xe_gt_init+0x182/0x3d0 [xe]
>> [ 1724.144236]  xe_device_probe+0x23b/0x2b0 [xe]
>> [ 1724.144270]  xe_pci_probe+0x4da/0x810 [xe]
>>
>> With that fixed everything seems fine when testing locally.
>>
>>> +		gt->mem.vram.mapping = xe->mem.vram.mapping +
>> tile_offset;
>>>
>>> -			drm_info(&xe->drm, "VRAM[%u, %u]: %pa, %pa\n",
>>> -				 id, gt->info.vram_id, &gt-
>>> mem.vram.io_start,
>>> -				 &gt->mem.vram.size);
>>> +		drm_info(&xe->drm, "VRAM[%u, %u]: %pa, %pa\n", id, gt-
>>> info.vram_id,
>>> +			 &gt->mem.vram.io_start, &gt->mem.vram.size);
>>> +
>>> +		if (gt->mem.vram.io_size < gt->mem.vram.size)
>>> +			drm_info(&xe->drm, "VRAM[%u, %u]: CPU access
>> limited to %pa\n", id,
>>> +				 gt->info.vram_id, &gt->mem.vram.io_size);
>>> +
>>> +		/* calculate total size using tile size to get the correct HW sizing
>> */
>>> +		total_size += tile_size;
>>> +		available_size += vram_size;
>>> +
>>> +		if (total_size > xe->mem.vram.io_size) {
>>> +			drm_warn(&xe->drm, "VRAM: %pa is larger than
>> resource %pa\n",
>>> +				 &total_size, &xe->mem.vram.io_size);
>>>    		}
>>> -	} else {
>>> -		gt->mem.vram.size = xe->mem.vram.size;
>>> -		gt->mem.vram.io_start = xe->mem.vram.io_start;
>>> -		gt->mem.vram.io_size = xe->mem.vram.io_size;
>>> -		gt->mem.vram.mapping = xe->mem.vram.mapping;
>>>
>>> -		drm_info(&xe->drm, "VRAM: %pa\n", &gt->mem.vram.size);
>>> +		io_size -= min_t(u64, tile_size, io_size);
>>>    	}
>>> +
>>> +	xe->mem.vram.size = total_size;
>>> +
>>> +	drm_info(&xe->drm, "Total VRAM: %pa, %pa\n", &xe-
>>> mem.vram.io_start,
>>> +		 &xe->mem.vram.size);
>>> +	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe-
>>> mem.vram.io_start,
>>> +		 &available_size);
>>> +
>>>    	return 0;
>>>    }
>>>
