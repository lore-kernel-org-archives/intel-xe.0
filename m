Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F487C0218A
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 09:32:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB2F510E908;
	Thu, 30 Jan 2025 09:32:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="AZpZfMBr";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2EE410E908
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jan 2025 09:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3XoOqwemVmEO1o6hdvlMvnzb+HM6plT/U+8xj2rB1pM=; b=AZpZfMBr5OMr99o3MtNO0t1od+
 2TNi0+I2HZz9ojDdB7kpUxExWY7FSGgZ5PAEpqP0gAUMdJSqDarHd8nDUPVKTRuLc2nqV5dHzUFYo
 yvKost2tii+opIj0QafxG44FywuRyAvuSuZzxEPFIIUIjHLKbPmo4+8agpOu3RimyCPUlF6/XWj3z
 GzZHYpuIBh6Xm/veIPHUOV8R53NYzEMoyfRoj3Xn7IA05kzoZk8Ol7FnoDy0rcBDgVCSfF4ujXbyW
 Y08ZbwihieyxkakhnvQCimN9kYPHiPTujvAZLcLKw2P8XLAg1+OdQkeS6H6fRMdxeiTxRr0/gdvAC
 LUs9PNzQ==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tdQu8-000yGs-KI; Thu, 30 Jan 2025 10:32:14 +0100
Message-ID: <0ff0719b-5b3b-4977-8a2c-0d7e8756f5c9@igalia.com>
Date: Thu, 30 Jan 2025 09:32:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] drm/xe: Move a couple static workarounds/tunings to
 the static list
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com,
 Matt Roper <matthew.d.roper@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
References: <20250129155627.93827-1-tvrtko.ursulin@igalia.com>
 <20250129155627.93827-6-tvrtko.ursulin@igalia.com>
 <rbkdanimsdvosq3ew3x5c6kutwlhpdduxx54uqeisbgnhi3kad@gok7pmvgfs2x>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <rbkdanimsdvosq3ew3x5c6kutwlhpdduxx54uqeisbgnhi3kad@gok7pmvgfs2x>
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


On 29/01/2025 18:51, Lucas De Marchi wrote:
> On Wed, Jan 29, 2025 at 03:56:27PM +0000, Tvrtko Ursulin wrote:
>> One workaround and one tuning are completely static so can be moved to 
>> the
>> respective static lists in xe_wa.c and xa_tunings.c respectively.
> 
> We can enable the tracker to make them show up in debugfs if needed, but
> that wouldn't be in the WA file. See more details below.

Crossed my mind if that would be possible but the lists are local to the 
functions so looked hard. Anyway, also lets go below..

>> Advantage being that they will be shown in debugfs as active, when 
>> active.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_hw_engine.c | 22 ----------------------
>> drivers/gpu/drm/xe/xe_tuning.c    |  8 ++++++++
>> drivers/gpu/drm/xe/xe_wa.c        | 16 ++++++++++++++++
>> 3 files changed, 24 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c 
>> b/drivers/gpu/drm/xe/xe_hw_engine.c
>> index fc447751fe78..423fb43a1a4a 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> @@ -437,28 +437,6 @@ hw_engine_setup_default_state(struct xe_hw_engine 
>> *hwe)
>>                        ring_cmd_cctl_val,
>>                        XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>>         },
>> -        /*
>> -         * To allow the GSC engine to go idle on MTL we need to enable
>> -         * idle messaging and set the hysteresis value (we use 0xA=5us
>> -         * as recommended in spec). On platforms after MTL this is
>> -         * enabled by default.
>> -         */
>> -        { XE_RTP_NAME("MTL GSCCS IDLE MSG enable"),
>> -          XE_RTP_RULES(MEDIA_VERSION(1300), ENGINE_CLASS(OTHER)),
>> -          XE_RTP_ACTIONS(CLR(RING_PSMI_CTL(0),
>> -                     IDLE_MSG_DISABLE,
>> -                     XE_RTP_ACTION_FLAG(ENGINE_BASE)),
>> -                 FIELD_SET(RING_PWRCTX_MAXCNT(0),
>> -                       IDLE_WAIT_TIME,
>> -                       0xA,
>> -                       XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>> -        },
>> -        /* Enable Priority Mem Read */
>> -        { XE_RTP_NAME("Priority_Mem_Read"),
>> -          XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 
>> XE_RTP_END_VERSION_UNDEFINED)),
>> -          XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0), CS_PRIORITY_MEM_READ,
>> -                     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>> -        },
>>         {}
>>     };
>>
>> diff --git a/drivers/gpu/drm/xe/xe_tuning.c 
>> b/drivers/gpu/drm/xe/xe_tuning.c
>> index c5c5a6fba406..f9d178ae0a73 100644
>> --- a/drivers/gpu/drm/xe/xe_tuning.c
>> +++ b/drivers/gpu/drm/xe/xe_tuning.c
>> @@ -10,6 +10,7 @@
>> #include <drm/drm_managed.h>
>>
>> #include "regs/xe_gt_regs.h"
>> +#include "regs/xe_engine_regs.h"
>> #include "xe_gt_types.h"
>> #include "xe_platform_types.h"
>> #include "xe_rtp.h"
>> @@ -95,6 +96,13 @@ static const struct xe_rtp_entry_sr 
>> engine_tunings[] = {
> 
> these will end up as a register for guc to save restore, not the same
> thing as setting up the default engine context, so there maybe side
> effects of this change.

Ok.

> 
>>                ENGINE_CLASS(RENDER)),
>>       XE_RTP_ACTIONS(SET(SAMPLER_MODE, 
>> INDIRECT_STATE_BASE_ADDR_OVERRIDE))
>>     },
>> +
>> +    { XE_RTP_NAME("Priority_Mem_Read"),
>> +      XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 
>> XE_RTP_END_VERSION_UNDEFINED)),
>> +      XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0), CS_PRIORITY_MEM_READ,
>> +                 XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>> +    },
>> +
>>     {}
>> };
>>
>> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>> index 744dba4fdb58..1380bcf17fac 100644
>> --- a/drivers/gpu/drm/xe/xe_wa.c
>> +++ b/drivers/gpu/drm/xe/xe_wa.c
>> @@ -458,6 +458,22 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>>                FUNC(xe_rtp_match_first_render_or_compute)),
>>       XE_RTP_ACTIONS(SET(ROW_CHICKEN2, DISABLE_TDL_SVHS_GATING))
>>     },
>> +    /*
>> +     * To allow the GSC engine to go idle on MTL we need to enable
>> +     * idle messaging and set the hysteresis value (we use 0xA=5us
>> +     * as recommended in spec). On platforms after MTL this is
>> +     * enabled by default.
>> +     */
>> +    { XE_RTP_NAME("MTL GSCCS IDLE MSG enable"),
> 
> tunning != WA... this table should only contains entries that are actual
> documented hw WAs.

I try to asses which one and was swayed by the "we need" above. Sounded 
like the thing is doing two things. One is "need", other is tuning the 
hysteresis. Anyway I'll drop this patch, there is bigger fish to fry.

Regards,

Tvrtko

> 
> there's a debugfs file to dump the default context, however it seems we
> are missing it for gsc.
> 
> 
> Lucas De Marchi
> 
>> +      XE_RTP_RULES(MEDIA_VERSION(1300), ENGINE_CLASS(OTHER)),
>> +      XE_RTP_ACTIONS(CLR(RING_PSMI_CTL(0),
>> +                 IDLE_MSG_DISABLE,
>> +                 XE_RTP_ACTION_FLAG(ENGINE_BASE)),
>> +             FIELD_SET(RING_PWRCTX_MAXCNT(0),
>> +                   IDLE_WAIT_TIME,
>> +                   0xA,
>> +                   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>> +    },
>>
>>     /* Xe2_LPG */
>>
>> -- 
>> 2.48.0
>>
