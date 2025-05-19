Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF3C8C3DA6D
	for <intel-xe@archiver.kernel.org>; Mon, 19 May 2025 08:14:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7908E10E40C;
	Mon, 19 May 2025 08:14:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="rqE69NxZ";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 194D510E403
 for <intel-xe@lists.freedesktop.org>; Mon, 19 May 2025 08:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PUFBnBqW4yW5Stz0jWmYcPJELbEF3EA513IPYLfd4cg=; b=rqE69NxZsWxsezt7lpJ/E5Zkm5
 yeueX2H9HY+gPimg9IR4z5i1DcMQkUAgX+JdyQ7WMTqyvHJ233nlLnmBXe22cd2Mjl8tWXFf1mNoL
 /wdrGj1C+TV1X7kPXKGEuDj3QB9m3n3IaaubIcQ4aJzgZ9PQH4q55wKnofnMVRwS9DeE9oxiW8yTs
 nCPQBJ1gKCS8NzEECPhDh+6KwoZmFxR7KprOU8AkrDo4YKBK9VPXRMLBfWsyiFudH43vvBu0ZQmzX
 ZmU6jzGZX6jp93EvO5vk66DT7ZXQO1h/TVdLtIoOhnSZvGNxvrLv8wsAoCEgRINTcI7BXrEyRnV5f
 zxQp9ygg==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uGve7-00A9I0-58; Mon, 19 May 2025 10:14:51 +0200
Message-ID: <2eca6a64-cc92-4223-8314-12f4a818fd9c@igalia.com>
Date: Mon, 19 May 2025 09:14:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/xelp: Add Wa_18022495364
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com,
 lionel.g.landwerlin@intel.com
References: <20250516074412.46863-1-tvrtko.ursulin@igalia.com>
 <20250516074412.46863-4-tvrtko.ursulin@igalia.com>
 <20250516190650.GM5080@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250516190650.GM5080@mdroper-desk1.amr.corp.intel.com>
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


On 16/05/2025 20:06, Matt Roper wrote:
> On Fri, May 16, 2025 at 08:44:12AM +0100, Tvrtko Ursulin wrote:
>> Add Wa_18022495364 as a context indirect workaround.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_engine_regs.h |  3 +++
>>   drivers/gpu/drm/xe/xe_lrc.c              | 12 ++++++++++++
>>   drivers/gpu/drm/xe/xe_wa_oob.rules       |  1 +
>>   3 files changed, 16 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> index d1d2592e010d..94d778d5425d 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> @@ -112,6 +112,9 @@
>>   #define   PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS	REG_BIT(14)
>>   #define   CS_PRIORITY_MEM_READ			REG_BIT(7)
>>   
>> +#define CS_DEBUG_MODE2(base)			XE_REG((base) + 0xd8, XE_REG_OPTION_MASKED)
>> +#define   INSTRUCTION_STATE_CACHE_INVALIDATE	REG_BIT(6)
>> +
>>   #define FF_SLICE_CS_CHICKEN1(base)		XE_REG((base) + 0xe0, XE_REG_OPTION_MASKED)
>>   #define   FFSC_PERCTX_PREEMPT_CTRL		REG_BIT(14)
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>> index 6022068ce6b6..9a07fc6d78ab 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>> @@ -1028,6 +1028,15 @@ xelp_emit_cmd_buf_wa(struct xe_lrc *lrc, u32 *cmd)
>>   	return cmd;
>>   }
>>   
>> +static u32 *xelp_invalidate_state_cache(u32 *cmd)
>> +{
>> +	*cmd++ = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1);
>> +	*cmd++ = CS_DEBUG_MODE1(0).addr;
>> +	*cmd++ = _MASKED_BIT_ENABLE(INSTRUCTION_STATE_CACHE_INVALIDATE);
>> +
>> +	return cmd;
>> +}
>> +
>>   static u32 *
>>   xelp_setup_indirect_ctx_rcs(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>>   			    u32 *cmd)
>> @@ -1037,6 +1046,9 @@ xelp_setup_indirect_ctx_rcs(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>>   	cmd = xelp_emit_cmd_buf_wa(lrc, cmd);
>>   	cmd = xelp_emit_restore_scratch(lrc, cmd);
>>   
>> +	if (XE_WA(lrc->gt, 18022495364))
>> +		cmd = xelp_invalidate_state_cache(cmd);
> 
> This is another one where the official workaround description asks us to
> use the per-context workaround bb rather than the indirect context
> workaround bb.  This register is already part of the LRC, so which batch
> buffer gets used determines whether this extra write will happen before
> or after the standard write that would have been part of the LRC
> restore; I'm not sure if that matters or not from a functional
> perspective.

Interesting. I will change it over and try to remember to raise an i915 
issue to fix it up there too.

Also looping in Lionel in case he could have a feeling if some Mesa bugs 
could be cause by 18022495364 being potentially not correctly 
implemented. I *think* I saw this WA mentioned in one recent issue 
discussing push constants or something like that.

Regards,

Tvrtko

>> +
>>   	return cmd;
>>   }
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> index 9efc5accd43d..a32f5ee9e917 100644
>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> @@ -1,4 +1,5 @@
>>   1607983814	GRAPHICS_VERSION_RANGE(1200, 1210)
>> +18022495364	GRAPHICS_VERSION_RANGE(1200, 1210)
>>   22012773006	GRAPHICS_VERSION_RANGE(1200, 1250)
>>   14014475959	GRAPHICS_VERSION_RANGE(1270, 1271), GRAPHICS_STEP(A0, B0)
>>   		PLATFORM(DG2)
>> -- 
>> 2.48.0
>>
> 

