Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E7CCF9C6F
	for <intel-xe@archiver.kernel.org>; Mon, 23 Sep 2024 08:22:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2933F10E3A7;
	Mon, 23 Sep 2024 08:22:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HxlCCSod";
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B174810E3A7
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Sep 2024 08:22:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4EA7A5C54F4;
 Mon, 23 Sep 2024 08:22:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F83FC4CECF;
 Mon, 23 Sep 2024 08:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727079747;
 bh=zcLF7pP3zJiQHS9/BBDdc+4gqBSMtSceYk5BWhK5hsE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HxlCCSod5GUIlkY0vVqwOwzWwtjALEG1f44lHh5SAAZmhtyssr4OmdXDF8Ot4zXiJ
 zrpsrIkvjDyw9/QI9m8L/Oyab1bJ/i/g25m97Y9oYJ4O3V4mEfbCuyih9dSjwGSLup
 DLkT9tACaCT8k50mucEbTmcKj1QIb2f6Wo79Kn+c+V8lm7yQ/Qkj4fRGWdgVIBeENC
 z9Lb3bZPFCm/v8Z9r+PpKv+5EN7+ioWh1JiloTND2ZNyQNBWS0OeVbTFRRcj7PvQm+
 d3oME+16ZQ2EpZB1qjBIOUm3j/eVtH9tApyFYOilKkCB1Rri8nxzMu3GsLKGwpSnRD
 YCOaUz/a2odTA==
Message-ID: <cbf61ca5-870f-4617-839f-3e7a66fe7f1a@kernel.org>
Date: Mon, 23 Sep 2024 10:22:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gpuvm: merge adjacent gpuva range during a map
 operation
To: "Zeng, Oak" <oak.zeng@intel.com>
Cc: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20240918164740.3955915-1-oak.zeng@intel.com>
 <ZuseA6s2nip+PbTC@DUT025-TGLU.fm.intel.com>
 <BYAPR11MB315944FFB3DE254952FE298592632@BYAPR11MB3159.namprd11.prod.outlook.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <BYAPR11MB315944FFB3DE254952FE298592632@BYAPR11MB3159.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 9/19/24 5:09 PM, Zeng, Oak wrote:
> 
> 
>> -----Original Message-----
>> From: Brost, Matthew <matthew.brost@intel.com>
>> Sent: Wednesday, September 18, 2024 2:38 PM
>> To: Zeng, Oak <oak.zeng@intel.com>
>> Cc: intel-xe@lists.freedesktop.org; dakr@redhat.com
>> Subject: Re: [PATCH] drm/gpuvm: merge adjacent gpuva range during
>> a map operation
>>
>> On Wed, Sep 18, 2024 at 12:47:40PM -0400, Oak Zeng wrote:
>>
>> Please sent patches which touch common code to dri-devel.
>>
>>> Considder this example. Before a map operation, the gpuva ranges
>>> in a vm looks like below:
>>>
>>>   VAs | start              | range              | end                | object             |
>> object offset
>>> -----------------------------------------------------------------------------------
>> --------------------------
>>>       | 0x0000000000000000 | 0x00007ffff5cd0000 | 0x00007ffff5cd0000
>> | 0x0000000000000000 | 0x0000000000000000
>>>       | 0x00007ffff5cf0000 | 0x00000000000c7000 | 0x00007ffff5db7000
>> | 0x0000000000000000 | 0x0000000000000000
>>>
>>> Now user want to map range [0x00007ffff5cd0000 -
>> 0x00007ffff5cf0000).
>>> With existing codes, the range walking in __drm_gpuvm_sm_map
>> won't
>>> find any range, so we end up a single map operation for range
>>> [0x00007ffff5cd0000 - 0x00007ffff5cf0000). This result in:
>>>
>>>   VAs | start              | range              | end                | object             |
>> object offset
>>> -----------------------------------------------------------------------------------
>> --------------------------
>>>       | 0x0000000000000000 | 0x00007ffff5cd0000 | 0x00007ffff5cd0000
>> | 0x0000000000000000 | 0x0000000000000000
>>>       | 0x00007ffff5cd0000 | 0x0000000000020000 | 0x00007ffff5cf0000
>> | 0x0000000000000000 | 0x0000000000000000
>>>       | 0x00007ffff5cf0000 | 0x00000000000c7000 | 0x00007ffff5db7000
>> | 0x0000000000000000 | 0x0000000000000000
>>>
>>> The correct behavior is to merge those 3 ranges. So
>> __drm_gpuvm_sm_map
>>
>> Danilo - correct me if I'm wrong, but I believe early in gpuvm you had
>> similar code to this which could optionally be used. I was of the
>> thinking Xe didn't want this behavior and eventually this behavior was
>> ripped out prior to merging.
>>
>>> is slightly modified to handle this corner case. The walker is changed
>>> to find the range just before or after the mapping request, and
>> merge
>>> adjacent ranges using unmap and map operations. with this change,
>> the
>>
>> This would problematic in Xe for several reasons.
>>
>> 1. This would create a window in which previously valid mappings are
>> unmapped by our bind code implementation which could result in a
>> fault.
>> Remap operations can create a similar window but it is handled by
>> either
>> only unmapping the required range or using dma-resv slots to close
>> this
>> window ensuring nothing is running on the GPU while valid mappings
>> are
>> unmapped. A series of UNMAP, UNMAP, and MAP ops currently
>> doesn't detect
>> the problematic window. If we wanted to do something like this, we'd
>> probably need to a new op like MERGE or something to help detect
>> this
>> window.
>>
>> 2. Consider this case.
>>
>> 0x0000000000000000-0x00007ffff5cd0000 VMA[A]
>> 0x00007ffff5cf0000-0x00000000000c7000 VMA[B]
>> 0x00007ffff5cd0000-0x0000000000020000 VMA[C]
>>
>> What is VMA[A], VMA[B], and VMA[C] are all setup with different
>> driver
>> specific implmentation properties (e.g. pat_index). These VMAs
>> cannot be
>> merged. GPUVM has no visablity to this. If we wanted to do this I
>> think
>> we'd need a gpuvm vfunc that calls into the driver to determine if we
>> can merge VMAs.
> 
> #1, #2 are all reasonable to me. Agree if we want this merge behavior, more work is needed.
> 
>>
>> 3. What is the ROI of this? Slightly reducing the VMA count? Perhaps
>> allowing larger GPU is very specific corner cases? Give 1), 2) I'd say
>> just leave GPUVM as is rather than add this complexity and then
>> make all
>> driver use GPUVM absorb this behavior change.
> 
> This patch is an old one in my back log. I roughly remember I ran into a situation where there were two duplicated VMAs covering
> Same virtual address range are kept in gpuvm's RB-tree. One VMA was actually already destroyed. This further caused issues as
> The destroyed VMA was found during a GPUVM RB-tree walk. This triggered me to look into the gpuvm merge split logic and end
> Up with this patch. This patch did fix that issue.

That would indeed be a big issue. As Matt suggests, is there a reproducer?

Either way, adding merge support can't be the fix for this, we need a separate
one, that's back-portable.

Also, can we move this on DRI-devel please?

- Danilo

> 
> But I don't remember the details now. I need to go back to it to find more details.
> 
>  From design perspective, I think merging adjacent contiguous ranges is a cleaner design. Merging for some use cases (I am not sure
> We do merge for some cases, just guess from the function name _sm_) but not merging for other use cases creates a design hole and
> Eventually such behavior can potentially mess things up. Maybe xekmd today doesn't have such use cases, but people may run into
> Situation where they want a merge behavior.
> 
> If we decide only merge for some case but not for other cases, we need a clear documentation of the behavior.
> 
> Oak
> 
>>
>> Matt
>>
>>> end result of above example is as below:
>>>
>>>   VAs | start              | range              | end                | object             |
>> object offset
>>> -----------------------------------------------------------------------------------
>> --------------------------
>>>       | 0x0000000000000000 | 0x00007ffff5db7000 |
>> 0x00007ffff5db7000 | 0x0000000000000000 | 0x0000000000000000
>>>
>>> Even though this fixes a real problem, the codes looks a little ugly.
>>> So I welcome any better fix or suggestion.
>>>
>>> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
>>> ---
>>>   drivers/gpu/drm/drm_gpuvm.c | 62
>> +++++++++++++++++++++++++------------
>>>   1 file changed, 43 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_gpuvm.c
>> b/drivers/gpu/drm/drm_gpuvm.c
>>> index 4b6fcaea635e..51825c794bdc 100644
>>> --- a/drivers/gpu/drm/drm_gpuvm.c
>>> +++ b/drivers/gpu/drm/drm_gpuvm.c
>>> @@ -2104,28 +2104,30 @@ __drm_gpuvm_sm_map(struct
>> drm_gpuvm *gpuvm,
>>>   {
>>>   	struct drm_gpuva *va, *next;
>>>   	u64 req_end = req_addr + req_range;
>>> +	u64 merged_req_addr = req_addr;
>>> +	u64 merged_req_end = req_end;
>>>   	int ret;
>>>
>>>   	if (unlikely(!drm_gpuvm_range_valid(gpuvm, req_addr,
>> req_range)))
>>>   		return -EINVAL;
>>>
>>> -	drm_gpuvm_for_each_va_range_safe(va, next, gpuvm,
>> req_addr, req_end) {
>>> +	drm_gpuvm_for_each_va_range_safe(va, next, gpuvm,
>> req_addr - 1, req_end + 1) {
>>>   		struct drm_gem_object *obj = va->gem.obj;
>>>   		u64 offset = va->gem.offset;
>>>   		u64 addr = va->va.addr;
>>>   		u64 range = va->va.range;
>>>   		u64 end = addr + range;
>>> -		bool merge = !!va->gem.obj;
>>> +		bool merge;
>>>
>>>   		if (addr == req_addr) {
>>> -			merge &= obj == req_obj &&
>>> +			merge = obj == req_obj &&
>>>   				 offset == req_offset;
>>>
>>>   			if (end == req_end) {
>>>   				ret = op_unmap_cb(ops, priv, va,
>> merge);
>>>   				if (ret)
>>>   					return ret;
>>> -				break;
>>> +				continue;
>>>   			}
>>>
>>>   			if (end < req_end) {
>>> @@ -2162,22 +2164,33 @@ __drm_gpuvm_sm_map(struct
>> drm_gpuvm *gpuvm,
>>>   			};
>>>   			struct drm_gpuva_op_unmap u = { .va = va };
>>>
>>> -			merge &= obj == req_obj &&
>>> -				 offset + ls_range == req_offset;
>>> +			merge = (obj && obj == req_obj &&
>>> +				 offset + ls_range == req_offset) ||
>>> +				 (!obj && !req_obj);
>>>   			u.keep = merge;
>>>
>>>   			if (end == req_end) {
>>>   				ret = op_remap_cb(ops, priv, &p,
>> NULL, &u);
>>>   				if (ret)
>>>   					return ret;
>>> -				break;
>>> +				continue;
>>>   			}
>>>
>>>   			if (end < req_end) {
>>> -				ret = op_remap_cb(ops, priv, &p,
>> NULL, &u);
>>> -				if (ret)
>>> -					return ret;
>>> -				continue;
>>> +				if (end == req_addr) {
>>> +					if (merge) {
>>> +						ret =
>> op_unmap_cb(ops, priv, va, merge);
>>> +						if (ret)
>>> +							return ret;
>>> +						merged_req_addr =
>> addr;
>>> +						continue;
>>> +					}
>>> +				} else {
>>> +					ret = op_remap_cb(ops, priv,
>> &p, NULL, &u);
>>> +					if (ret)
>>> +						return ret;
>>> +					continue;
>>> +				}
>>>   			}
>>>
>>>   			if (end > req_end) {
>>> @@ -2195,15 +2208,16 @@ __drm_gpuvm_sm_map(struct
>> drm_gpuvm *gpuvm,
>>>   				break;
>>>   			}
>>>   		} else if (addr > req_addr) {
>>> -			merge &= obj == req_obj &&
>>> +			merge = (obj && obj == req_obj &&
>>>   				 offset == req_offset +
>>> -					   (addr - req_addr);
>>> +					   (addr - req_addr)) ||
>>> +				 (!obj && !req_obj);
>>>
>>>   			if (end == req_end) {
>>>   				ret = op_unmap_cb(ops, priv, va,
>> merge);
>>>   				if (ret)
>>>   					return ret;
>>> -				break;
>>> +				continue;
>>>   			}
>>>
>>>   			if (end < req_end) {
>>> @@ -2225,16 +2239,26 @@ __drm_gpuvm_sm_map(struct
>> drm_gpuvm *gpuvm,
>>>   					.keep = merge,
>>>   				};
>>>
>>> -				ret = op_remap_cb(ops, priv, NULL,
>> &n, &u);
>>> -				if (ret)
>>> -					return ret;
>>> -				break;
>>> +				if (addr == req_end) {
>>> +					if (merge) {
>>> +						ret =
>> op_unmap_cb(ops, priv, va, merge);
>>> +						if (ret)
>>> +							return ret;
>>> +						merged_req_end =
>> end;
>>> +						break;
>>> +					}
>>> +				} else {
>>> +					ret = op_remap_cb(ops, priv,
>> NULL, &n, &u);
>>> +					if (ret)
>>> +						return ret;
>>> +					break;
>>> +				}
>>>   			}
>>>   		}
>>>   	}
>>>
>>>   	return op_map_cb(ops, priv,
>>> -			 req_addr, req_range,
>>> +			 merged_req_addr, merged_req_end -
>> merged_req_addr,
>>>   			 req_obj, req_offset);
>>>   }
>>>
>>> --
>>> 2.26.3
>>>
> 

