Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E85D1CDC6
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 14:10:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE1CF10E5F3;
	Tue,  9 Dec 2025 14:10:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="dxAGSUjC";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD29D10E5F3
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Dec 2025 14:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SNbDh5yQi/AeGB2AmvBUjSxsZ8+wnF3bMi5wsNCojMI=; b=dxAGSUjC6RoxCPsR/mYDun6dxL
 mlKVpYwOZYJNSkbgIkcqg/Ieex7HHX+rdJ/0e6RBVdzUl4mGsUJ/OXMs2jWeMtURYWkIiRET8FbOL
 CsgSjMVnbm5nbt9CaFSisv+swdVlKQuJZSsCPOV5YgRKguo524mbYNM9SXr/C5QQki8y5VRINKvNx
 aDUeuqGHqklXSHs3VOsSVbaaJt13eRGyUEhdrJ/PYnnRUfug6l9Nqk0ioy2jIV0uKVONhy3C9GGQE
 Gs9o14dy+/V9oS1snVul/G4nROtMdGREDjw2QFhQXy7jLWVy7NIa0NbKrClqpOZMDG4Sd2Jvs5UiU
 0Id6n4ew==;
Received: from [86.33.28.86] (helo=[192.168.1.83])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vSyPk-00AXC6-51; Tue, 09 Dec 2025 15:10:04 +0100
Message-ID: <2b912c41-a03a-40cc-8bf0-f70558ffdafc@igalia.com>
Date: Tue, 9 Dec 2025 15:10:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 06/10] drm/xe: Handle DPT in system memory
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20251208191722.7194-1-tursulin@igalia.com>
 <20251208191722.7194-7-tursulin@igalia.com> <aTfxySrZ-O1Bplcm@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@igalia.com>
In-Reply-To: <aTfxySrZ-O1Bplcm@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 09/12/2025 10:54, Ville Syrjälä wrote:
> On Mon, Dec 08, 2025 at 08:17:17PM +0100, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>
>> If DPT is allocated from system memory it will be created in the default
>> write-back cached mode. This means we need to flush it after populating
>> otherwise nothing works.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>   drivers/gpu/drm/xe/display/xe_fb_pin.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> index a22a9182dadb..89ee68c40329 100644
>> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> @@ -3,6 +3,7 @@
>>    * Copyright © 2021 Intel Corporation
>>    */
>>   
>> +#include <drm/drm_cache.h>
>>   #include <drm/ttm/ttm_bo.h>
>>   
>>   #include "i915_vma.h"
>> @@ -162,6 +163,9 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
>>   					  rot_info->plane[i].dst_stride);
>>   	}
>>   
>> +	if (!xe_bo_is_vram(dpt) && !xe_bo_is_stolen(dpt))
>> +		drm_clflush_virt_range(dpt->vmap.vaddr, dpt_size);
> How is anything working currently if the DPT is being
> created with the wrong caching mode?

I suspect the stolen allocation never fails in practice (or almost 
never, or at least not in CI).
> Sounds like someone should fix the DPT creation to correctly
> ask for UC/WC. But I suppose someone should measure if WB+flush
> is actually faster...

I am not sure what is desired here. System memory buffers defaulting to 
cached is the xe default, so should DPT be an exception I do not know.

In any case AuxCCS seems to only work with DPT in system memory and this 
clflush. DPT in stolen with GTT access and GTT flushing (as i915 does 
it) does not seem to work for xe. I guess the entity doing the DPT reads 
is somehow special coherency wise.

Regards,

Tvrtko

>> +
>>   	vma->dpt = dpt;
>>   	vma->node = dpt->ggtt_node[tile0->id];
>>   
>> -- 
>> 2.52.0

