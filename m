Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7087CCD184
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 13:48:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A769610E5EC;
	Tue, 21 Oct 2025 13:48:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="D1AvzX2O";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1928910E5EC
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 13:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1761054490;
 bh=CaVPec/4MxOtBl4Jd2KuNpPoujiCPMhP7U5ngr4vLxc=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=D1AvzX2O9YgvlksPgfujjUmzfbIh6QL4kP5rP9PTuSj2zZ46aV4R3KOP3KrXOC7dt
 jyfDZmX1dW0I8K2G/HbfyWRFkak07zR++JEUyzNAQjbO+uuxtp8z9ELXL5q3yMKTMK
 dt8maG0MSf8dJFw76+1aDZzTP3jPsQ3Bazy5/cY/ysNoX+zZyjXlF3kNiSpybhTdxF
 cedpjpKCM/S1toAl/GI/Yz+pH/kiuR1vEcI3qUOhGSu/peanHjhCzkdnS0kqiXYQtA
 LTnVsWxSQ9SIDoc8PTJCW7MH0i7Jy7KV3GpHDlnYQaUK0xL/KWBa6/S4cEBq2S0XsC
 HMAiVFt2BgVRQ==
Message-ID: <d94ad92e-7f55-41af-8369-02a1bb1ad019@lankhorst.se>
Date: Tue, 21 Oct 2025 15:48:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] drm/xe: Add xe_ggtt_node_addr() to avoid
 dereferencing xe_ggtt_node
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20251021121814.2193153-9-dev@lankhorst.se>
 <20251021121814.2193153-12-dev@lankhorst.se>
 <15bc327f-275a-4b03-8ce9-e69e29237d82@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <15bc327f-275a-4b03-8ce9-e69e29237d82@intel.com>
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



Den 2025-10-21 kl. 15:15, skrev Michal Wajdeczko:
> 
> 
> On 10/21/2025 2:18 PM, Maarten Lankhorst wrote:
>> This function makes it possible to add an offset that is applied to
>> all xe_ggtt_node's, and hides the internals from all its users.
>>
>> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>> ---
>>  drivers/gpu/drm/xe/xe_bo.h   |  8 +++++---
>>  drivers/gpu/drm/xe/xe_ggtt.c | 11 +++++++++++
>>  drivers/gpu/drm/xe/xe_ggtt.h |  2 ++
>>  3 files changed, 18 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>> index 911d5b90461a2..9c3f0ebaa1554 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.h
>> +++ b/drivers/gpu/drm/xe/xe_bo.h
>> @@ -9,6 +9,7 @@
>>  #include <drm/ttm/ttm_tt.h>
>>  
>>  #include "xe_bo_types.h"
>> +#include "xe_ggtt.h"
>>  #include "xe_macros.h"
>>  #include "xe_validation.h"
>>  #include "xe_vm_types.h"
>> @@ -251,13 +252,14 @@ static inline u32
>>  __xe_bo_ggtt_addr(struct xe_bo *bo, u8 tile_id)
>>  {
>>  	struct xe_ggtt_node *ggtt_node = bo->ggtt_node[tile_id];
>> +	u64 offset;
>>  
>>  	if (XE_WARN_ON(!ggtt_node))
>>  		return 0;
>>  
>> -	XE_WARN_ON(ggtt_node->base.size > xe_bo_size(bo));
>> -	XE_WARN_ON(ggtt_node->base.start + ggtt_node->base.size > (1ull << 32));
>> -	return ggtt_node->base.start;
>> +	offset = xe_ggtt_node_addr(ggtt_node);
>> +	XE_WARN_ON(offset + xe_bo_size(bo) > (1ull << 32));
> 
> maybe better to use U32_MAX and convert to:
SZ_4G sounds good.

> 	xe_assert(xe_bo_device(bo), offset + xe_bo_size(bo) <= U32_MAX);
> 
> or at least to xe-oriented:
> 
> 	xe_WARN_ON(xe_bo_device(bo), offset + xe_bo_size(bo) > U32_MAX);
> 
> and what about checking bo_size vs node_size ?
> 
>> +	return offset;
>>  }
>>  
>>  static inline u32
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>> index 42e3caa3a6d9c..05515037e2d6a 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.c
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
>> @@ -1079,3 +1079,14 @@ u64 xe_ggtt_read_pte(struct xe_ggtt *ggtt, u64 offset)
>>  {
>>  	return ioread64(ggtt->gsm + (offset / XE_PAGE_SIZE));
>>  }
>> +
>> +/**
>> + * xe_ggtt_node_addr - Get @node offset in GGTT.
>> + * @node: &xe_ggtt_node
>> + *
>> + * Get the GGTT offset for allocated node.
>> + */
>> +u64 xe_ggtt_node_addr(const struct xe_ggtt_node *node)
>> +{
> 
> we can also have here:
> 
> 	xe_ggtt_assert_fit(node->ggtt, node->base.start, node->base.size);
> 
>> +	return node->base.start;
>> +}
As much as I love error checking, error checking here is too late. We never allocate more than a 4G sized GGTT, so all we need to ensure is to have a single warning in xe_ggtt_shift_nodes that shifted start + size <= SZ_4G after the full series.

I think this is the wrong place to put any error checking at all, any assertions should be triggered in xe_ggtt_init_early() or xe_ggtt_shift_nodes(). In the former we can bomb out in case of invalid parameters.

Kind regards,
~Maarten Lankhorst

>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
>> index d54a2ae2b4aa8..4a8ef1b824156 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.h
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
>> @@ -58,4 +58,6 @@ void xe_ggtt_might_lock(struct xe_ggtt *ggtt);
>>  u64 xe_ggtt_encode_pte_flags(struct xe_ggtt *ggtt, struct xe_bo *bo, u16 pat_index);
>>  u64 xe_ggtt_read_pte(struct xe_ggtt *ggtt, u64 offset);
>>  
>> +u64 xe_ggtt_node_addr(const struct xe_ggtt_node *node);
> 
> nit: shouldn't we keep "node" related functions together ?
> 
>> +
>>  #endif
> 

