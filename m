Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF9CCCD193
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 15:13:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 113C310E468;
	Mon, 20 Oct 2025 15:13:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="heKHoyRK";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1A3310E468
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 15:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pVBgZeQ8NPiPL/fnCWfzGyGWGLtQVVgDK7aVxMny80U=; b=heKHoyRK9LJuAju8jAPUs+vO7c
 CL9ANaNqsJmE/ouJU6DagL0HZJWsm/D85+t4ha3n/Y9WIRTtLbUsO+VcI2AGsPfa6OLRQW7we1GOM
 Nca76k1R7kSbqPwpumaIYYc0VywYm6s1gXnluQySadDrfY7Z3JBPW069Z7bDWGHPF2gozJj/KSLJU
 utLklwyYTXRg9Ttc4h7/Jwcj9l2Y7a/vOdJIhDDblkTAGRsUVFKu/8wCr8mzHW7mageHvXjwT9dnZ
 nH63A9zoheSmnnHfiMtG5ElAZH5WsIRPnkgj6zaRknw75PR8IrBOh37bvugaxOUUIpJO5tVckv7+t
 +79TYAfQ==;
Received: from [90.242.12.242] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vArZP-00C9RJ-L7; Mon, 20 Oct 2025 17:13:11 +0200
Message-ID: <328e531b-e0cc-480a-a3a1-4ebf27f0c5a5@igalia.com>
Date: Mon, 20 Oct 2025 16:13:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 08/12] drm/xe/xelp: Add AuxCCS invalidation to the
 indirect context workarounds
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com
References: <20251020075831.32818-1-tvrtko.ursulin@igalia.com>
 <20251020075831.32818-9-tvrtko.ursulin@igalia.com>
 <aPYdlzzeMLg4bQuJ@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <aPYdlzzeMLg4bQuJ@intel.com>
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


On 20/10/2025 12:31, Ville Syrjälä wrote:
> On Mon, Oct 20, 2025 at 08:58:26AM +0100, Tvrtko Ursulin wrote:
>> Following from the i915 reference implementation, we add the AuxCCS
>> invalidation to the indirect context workarounds page.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> ---
>>   drivers/gpu/drm/xe/xe_lrc.c | 38 +++++++++++++++++++++++++++++++++++++
>>   1 file changed, 38 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>> index b5083c99dd50..c77a166a2742 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>> @@ -27,6 +27,7 @@
>>   #include "xe_map.h"
>>   #include "xe_memirq.h"
>>   #include "xe_mmio.h"
>> +#include "xe_ring_ops.h"
>>   #include "xe_sriov.h"
>>   #include "xe_trace_lrc.h"
>>   #include "xe_vm.h"
>> @@ -88,6 +89,16 @@ gt_engine_needs_indirect_ctx(struct xe_gt *gt, enum xe_engine_class class)
>>   					       class, NULL))
>>   		return true;
>>   
>> +	/* AuxCCS invalidation */
>> +	if (GRAPHICS_VERx100(xe) >= 1200 &&
>> +	    GRAPHICS_VERx100(xe) <= 1210 &&
>> +	    (class == XE_ENGINE_CLASS_RENDER ||
>> +	     class == XE_ENGINE_CLASS_COMPUTE ||
>> +	     class == XE_ENGINE_CLASS_COPY ||
>> +	     class == XE_ENGINE_CLASS_VIDEO_DECODE ||
>> +	     class == XE_ENGINE_CLASS_VIDEO_ENHANCE))
>> +		return true;
>> +
>>   	return false;
>>   }
>>   
>> @@ -1188,6 +1199,31 @@ static ssize_t setup_invalidate_state_cache_wa(struct xe_lrc *lrc,
>>   	return cmd - batch;
>>   }
>>   
>> +static ssize_t setup_invalidate_auxccs_wa(struct xe_lrc *lrc,
>> +					  struct xe_hw_engine *hwe,
>> +					  u32 *batch, size_t max_len)
>> +{
>> +	struct xe_gt *gt = lrc->gt;
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	const unsigned int class = hwe->class;
>> +	u32 *cmd;
>> +
>> +	if (GRAPHICS_VERx100(xe) < 1200 || GRAPHICS_VERx100(xe) > 1210 ||
>> +	    !(class == XE_ENGINE_CLASS_RENDER ||
>> +	      class == XE_ENGINE_CLASS_COMPUTE ||
>> +	      class == XE_ENGINE_CLASS_COPY ||
>> +	      class == XE_ENGINE_CLASS_VIDEO_DECODE ||
>> +	      class == XE_ENGINE_CLASS_VIDEO_ENHANCE))
>> +		return 0;
> 
> I would extract that into a function instead of repeating it twice.

Indeed, thanks! I consolidated it locally as:

	if (xe_engine_supports_auxccs(xe, class))
		return true;

And:

	if (!xe_engine_supports_auxccs(xe, class))
		return 0;

Waiting on more feedback or CI to get better before I send out the respin.

Regards,

Tvrtko

> 
>> +
>> +	if (xe_gt_WARN_ON(gt, max_len < 8))
>> +		return -ENOSPC;
>> +
>> +	cmd = xe_emit_aux_table_inv(hwe, batch);
>> +
>> +	return cmd - batch;
>> +}
>> +
>>   struct bo_setup {
>>   	ssize_t (*setup)(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>>   			 u32 *batch, size_t max_size);
>> @@ -1320,9 +1356,11 @@ setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>>   {
>>   	static const struct bo_setup rcs_funcs[] = {
>>   		{ .setup = setup_timestamp_wa },
>> +		{ .setup = setup_invalidate_auxccs_wa },
>>   		{ .setup = setup_configfs_mid_ctx_restore_bb },
>>   	};
>>   	static const struct bo_setup xcs_funcs[] = {
>> +		{ .setup = setup_invalidate_auxccs_wa },
>>   		{ .setup = setup_configfs_mid_ctx_restore_bb },
>>   	};
>>   	struct bo_setup_state state = {
>> -- 
>> 2.48.0
> 

