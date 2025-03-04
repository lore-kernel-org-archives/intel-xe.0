Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F8C4C282C6
	for <intel-xe@archiver.kernel.org>; Tue,  4 Mar 2025 14:23:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDCBB10E5F0;
	Tue,  4 Mar 2025 14:23:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="VUrKepe9";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E0710E5F0
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Mar 2025 14:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EWorq7Y0Icz4z0g7fWt2kY2FFXFe3u4RMkai9laGpkE=; b=VUrKepe9/GQeeu27dBlJWcUeWb
 DXdfXrWAFiMbvXEIboLxvKuJSrSArU1hadbYpsP0jqhXBUyJ3k/20WyVhpuTUqmlbULJObncQaduh
 PodNeUdYS+Y6hkRkYLPezwlm519VnIgmlFX+IbLsWb00UsYqQGRDv8XpXbkWrAoNrC57ZdLE9ywxq
 oJpYfK9cOUzpfxqKX6WHIXQTUqOx5MytuPR4xu3nR2ezO2pKqCUqlmAbMVJ+dUiWYExBqAXzaIesR
 m3V8/WfsWEcy/Whd0cUcCSolMtNuPnP1tySAbfkvIzUiPYIgMKYDb8QQZfQTG9Y0AlqzLjW9sAKOW
 dSQnNzlA==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tpTAe-003kbA-J4; Tue, 04 Mar 2025 15:23:02 +0100
Message-ID: <9b4a014f-4e7d-454f-aa3a-df3a35538314@igalia.com>
Date: Tue, 4 Mar 2025 14:23:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/12] drm/xe: Flush GGTT writes after populating DPT
To: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@intel.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250221101736.78986-1-tvrtko.ursulin@igalia.com>
 <20250221101736.78986-9-tvrtko.ursulin@igalia.com>
 <Z8IOFqUyFba9YENc@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <Z8IOFqUyFba9YENc@intel.com>
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


On 28/02/2025 19:27, Rodrigo Vivi wrote:
> On Fri, Feb 21, 2025 at 10:17:27AM +0000, Tvrtko Ursulin wrote:
>> When DPT is placed in stolen it is populated using ioremap_wc() via GGTT.
>>
>> I915 has established that on modern platforms a small flush and delay is
>> required for those writes to reliably land so lets add the same logic
>> (simplified by removing impossible platforms) to xe as well.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> on this as well...
> 
>> ---
>>   drivers/gpu/drm/xe/display/xe_fb_pin.c | 45 ++++++++++++++++++++++++++
>>   1 file changed, 45 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> index 6c85e03dfd79..8f559b19e8ab 100644
>> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> @@ -10,9 +10,11 @@
>>   #include "intel_fb.h"
>>   #include "intel_fb_pin.h"
>>   #include "intel_fbdev.h"
>> +#include "regs/xe_engine_regs.h"
>>   #include "xe_bo.h"
>>   #include "xe_device.h"
>>   #include "xe_ggtt.h"
>> +#include "xe_mmio.h"
>>   #include "xe_pm.h"
>>   
>>   static void
>> @@ -78,6 +80,46 @@ write_dpt_remapped(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs,
>>   	*dpt_ofs = ALIGN(*dpt_ofs, 4096);
>>   }
>>   
>> +static void gt_flush_ggtt_writes(struct xe_gt *gt)
>> +{
>> +	if (!gt)
>> +		return;
>> +
>> +	xe_mmio_read32(&gt->mmio, RING_TAIL(RENDER_RING_BASE));
>> +}
>> +
>> +static void ggtt_flush_writes(struct xe_ggtt *ggtt)
>> +{
>> +	struct xe_device *xe = tile_to_xe(ggtt->tile);
>> +
>> +	/*
>> +	 * No actual flushing is required for the GTT write domain for reads
>> +	 * from the GTT domain. Writes to it "immediately" go to main memory
>> +	 * as far as we know, so there's no chipset flush. It also doesn't
>> +	 * land in the GPU render cache.
>> +	 *
>> +	 * However, we do have to enforce the order so that all writes through
>> +	 * the GTT land before any writes to the device, such as updates to
>> +	 * the GATT itself.
>> +	 *
>> +	 * We also have to wait a bit for the writes to land from the GTT.
>> +	 * An uncached read (i.e. mmio) seems to be ideal for the round-trip
>> +	 * timing. This issue has only been observed when switching quickly
>> +	 * between GTT writes and CPU reads from inside the kernel on recent hw,
>> +	 * and it appears to only affect discrete GTT blocks (i.e. on LLC
>> +	 * system agents we cannot reproduce this behaviour, until Cannonlake
>> +	 * that was!).
>> +	 */
>> +
>> +	wmb();
>> +
>> +	if (xe_pm_runtime_get_if_active(xe)) {
>> +		gt_flush_ggtt_writes(ggtt->tile->primary_gt);
>> +		gt_flush_ggtt_writes(ggtt->tile->media_gt);
>> +		xe_pm_runtime_put(xe);
>> +	}
>> +}
>> +
>>   static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
>>   			       const struct i915_gtt_view *view,
>>   			       struct i915_vma *vma,
>> @@ -161,6 +203,9 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
>>   					  rot_info->plane[i].dst_stride);
>>   	}
>>   
>> +	if (dpt->vmap.is_iomem)
>> +		ggtt_flush_writes(tile0->mem.ggtt);

I think I should add && !xe_bo_is_vram to this condition. Since then 
writes are not going via GGTT. But I wait for more comments on the patch 
first.

Regards,

Tvrtko

>> +
>>   	vma->dpt = dpt;
>>   	vma->node = dpt->ggtt_node[tile0->id];
>>   	return 0;
>> -- 
>> 2.48.0
>>

