Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1AADC02183
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jan 2025 14:39:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97A1F10E310;
	Fri, 17 Jan 2025 14:39:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i4Wnepso";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 890FB10E310
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Jan 2025 14:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737124756; x=1768660756;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=e9EVh2f+q5fHRIMB3dzsTlFRXheOw1+ikD4q3BAhZF4=;
 b=i4WnepsoM0UQ4J6tJOiS74l2noCtnyX6hzr9XjSofMFDi++ROfrooFlH
 G1TeuN10j8nJuQdoLsXExP9kf+hKHkJUEywsNouOTYDWcmK8oYsRdKiP/
 Qvl49XTI3DTesIXDWz4JmAyL72PtDEg+wqc7vl8H2IDHH9OKnC8iCPIBE
 Q/es1flavu0ikwBBk8ISWEui9+lZc094KsxYMlLp4czsIdaA7kjZb4J3o
 E5Pl7h56C1W1pPPFltWxgyr17acaG75rN/oALbC0cyAPHjnPUDf4/D9Nv
 hfXvSlWr6JI07xr7iPWltd82R+bdCdFM/r3Y5ldnmY+raNprbuScUZ8Vx Q==;
X-CSE-ConnectionGUID: S+DZSJzZR3aQMCgmvxYHqA==
X-CSE-MsgGUID: dHG4YerIRj2T7IAOOl9QBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="60029898"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; d="scan'208";a="60029898"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 06:39:16 -0800
X-CSE-ConnectionGUID: lN+g3wfKTmW2dRXAh84TVg==
X-CSE-MsgGUID: 2wrWlbPSTRuFdx2P9oM94A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; d="scan'208";a="106378702"
Received: from kcaccard-desk.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.109.133])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 06:37:51 -0800
Date: Fri, 17 Jan 2025 08:37:46 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Aradhya Bhatia <aradhya.bhatia@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>, 
 Intel XE List <intel-xe@lists.freedesktop.org>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>, 
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe/oa: Refactor Wa_18013179988 and
 Wa_14015568240
Message-ID: <k5vjdlci2l3lmxtdjcxwo7ma7imxa3ikfigvdc5atxmjrb3rde@v4mwzb3rx4bn>
References: <20250116091004.3060996-1-aradhya.bhatia@intel.com>
 <20250116091004.3060996-3-aradhya.bhatia@intel.com>
 <x7cjfk55rcwjwp7arncmalvnyt73w3z66kwfwgnlm5srzxg4gq@qkbpezds7gtc>
 <59d2b86f-cc4a-4a1c-9b74-6012f05661db@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <59d2b86f-cc4a-4a1c-9b74-6012f05661db@intel.com>
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

On Fri, Jan 17, 2025 at 02:19:52PM +0530, Aradhya Bhatia wrote:
>Hi Lucas,
>
>Thank you for reviewing the patches, and catching the obvious range
>mistakes. They should have been correct from my end in the first place.
>
>I agree with all but one of them. More details inline.
>
>On 16-01-2025 20:31, Lucas De Marchi wrote:
>> On Thu, Jan 16, 2025 at 02:40:04PM +0530, Aradhya Bhatia wrote:
>>> Refactor Wa_18013179988 and Wa_14015568240, to use the cleaner and
>>> newer workaround-check implementation, and drop the use of the platform
>>> based switch selection.
>>>
>>> While at it, fix the lineage number for the MTL.
>>>
>>> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
>>> ---
>>> drivers/gpu/drm/xe/xe_oa.c         | 14 ++++++--------
>>> drivers/gpu/drm/xe/xe_wa_oob.rules |  3 +++
>>> 2 files changed, 9 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>>> index eeb96b5f49e2..3736e4cd10f7 100644
>>> --- a/drivers/gpu/drm/xe/xe_oa.c
>>> +++ b/drivers/gpu/drm/xe/xe_oa.c
>>> @@ -12,6 +12,8 @@
>>> #include <drm/drm_managed.h>
>>> #include <uapi/drm/xe_drm.h>
>>>
>>> +#include <generated/xe_wa_oob.h>
>>> +
>>> #include "abi/guc_actions_slpc_abi.h"
>>> #include "instructions/xe_mi_commands.h"
>>> #include "regs/xe_engine_regs.h"
>>> @@ -35,6 +37,7 @@
>>> #include "xe_sched_job.h"
>>> #include "xe_sriov.h"
>>> #include "xe_sync.h"
>>> +#include "xe_wa.h"
>>>
>>> #define DEFAULT_POLL_FREQUENCY_HZ 200
>>> #define DEFAULT_POLL_PERIOD_NS (NSEC_PER_SEC / DEFAULT_POLL_FREQUENCY_HZ)
>>> @@ -1854,22 +1857,17 @@ u32 xe_oa_timestamp_frequency(struct xe_gt *gt)
>>>     u32 reg, shift;
>>>
>>>     /*
>>> -     * Wa_18013179988:dg2
>>> +     * Wa_18013179988:dg2/mtl
>>>      * Wa_14015568240:pvc
>>> -     * Wa_14015846243:mtl
>>
>> this comment should just be dropped so it doesn't get out of sync again
>> with what the implementation is doing.
>
>Okay!
>
>>
>>>      */
>>> -    switch (gt_to_xe(gt)->info.platform) {
>>> -    case XE_DG2:
>>> -    case XE_PVC:
>>> -    case XE_METEORLAKE:
>>> +    if (XE_WA(gt, 18013179988) || XE_WA(gt, 14015568240)) {
>>>         xe_pm_runtime_get(gt_to_xe(gt));
>>>         reg = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
>>>         xe_pm_runtime_put(gt_to_xe(gt));
>>>
>>>         shift = REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, reg);
>>>         return gt->info.reference_clock << (3 - shift);
>>> -
>>> -    default:
>>> +    } else {
>>>         return gt->info.reference_clock;
>>>     }
>>> }
>>> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/
>>> xe_wa_oob.rules
>>> index 536b91cc4d3f..b79b78d5feba 100644
>>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>>> @@ -44,3 +44,6 @@ no_media_l3    MEDIA_VERSION(3000)
>>>         MEDIA_VERSION(3000), MEDIA_STEP(A0, B0)
>>> 16021333562    GRAPHICS_VERSION_RANGE(1200, 1300)
>>> 14016712196    GRAPHICS_VERSION_RANGE(1255, 1274)
>>> +14015568240    GRAPHICS_VERSION_RANGE(1255, 1260)
>>
>> why not 1274 as upper end?
>
>This is the one I couldn't follow. The wa db does not have 1274 filed in
>for this lineage number at all. Am I missing something else?

no, 1260 is right... I guess I looked in the wrong place while
reviewing.

Lucas De Marchi

>
>>
>>> +18013179988    GRAPHICS_VERSION(1255)
>>> +        GRAPHICS_VERSION_RANGE(1270, 1300)
>>
>> humn... I think you are missing the fact that the graphics/media
>> versions use **inclusive** ranges:
>>
>> /**                                                                                       
>>  * XE_RTP_RULE_GRAPHICS_VERSION_RANGE - Create rule matching a range of graphics version
>>  * @ver_start__: First graphics IP version to match
>>  * @ver_end__: Last graphics IP version to match
>>  *
>>  * Note that the range matching this rule is [ @ver_start__,
>> @ver_end__ ], i.e.
>>  * inclusive on both sides
>>  *
>>  * Refer to XE_RTP_RULES() for expected usage.
>>  */
>>
>> So assuming we want to drop 1260, this would be:
>>
>>
>> 18013179988    GRAPHICS_VERSION(1255)
>>         GRAPHICS_VERSION_RANGE(1270, 1274)
>
>Right, yes! This would indeed be the correct way. Will fix it up in v3.
>
>
>Regards
>Aradhya
>
>
