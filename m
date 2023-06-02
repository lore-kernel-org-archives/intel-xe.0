Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E973C7EE29
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jun 2023 08:36:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F8DA10E202;
	Fri,  2 Jun 2023 08:36:58 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA1C710E202
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Jun 2023 08:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685695016; x=1717231016;
 h=message-id:date:mime-version:subject:to:references:cc:
 from:in-reply-to:content-transfer-encoding;
 bh=vGQx0htGaLUPPAObisxea9COooWRHvS/ZIGiDx7A+4w=;
 b=aGmUZpuRbeHeamr4aEUGNeqe4SH+Uw7Fn599OkSXf9QxDF4hRuJAxD4l
 tVq5cZIXv3GEhKBTVETdGogUvn+riQLKhDLc58TCCc9qrAZg4R9uG69yx
 YiOJliC6qHpDt6BX3eLshecTeVVkf29A57nnbWHFbKP2M2d4Y484ELtc0
 Dg6DIzmqLoy+IRmCftYuznedpEy2WGvqlWcnq7gocv3P8b7md4rXbDpPm
 Q3F1V0KVcfL5tqvVzONS0Ub9B5pzQz9keegKbkqtSR0uIFLqgll12BvQd
 zZcL5rpRqr4HWueS+/igTXuQ6EMUTOBJlAqehN7oRCu5CnRENq01Hq+Na Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="354668344"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="354668344"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 01:36:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="777584018"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="777584018"
Received: from jpoulsen-mobl.ger.corp.intel.com (HELO [10.249.254.180])
 ([10.249.254.180])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 01:36:55 -0700
Message-ID: <91770f5e-062c-1831-a2c6-cd65e32eba49@linux.intel.com>
Date: Fri, 2 Jun 2023 10:36:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: "Souza, Jose" <jose.souza@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20230526190609.61529-1-jose.souza@intel.com>
 <20230526190609.61529-2-jose.souza@intel.com>
 <d03fef471646a9e6141231ab38c264ea46ba291c.camel@linux.intel.com>
 <5d211028d654a8d824e899a073fad9e530c13e95.camel@intel.com>
 <495e7460-cb03-f049-9eb1-43512669acb7@linux.intel.com>
 <41f697fa-97dc-50dd-e438-c62bb1190afe@linux.intel.com>
 <faf59c70a4e046654d734fa77629971595dd7331.camel@intel.com>
 <2aee91cb-d377-476d-dd82-65236a7ac9c7@linux.intel.com>
 <1ac84b94994b26ee20881de276d6349f16907716.camel@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <1ac84b94994b26ee20881de276d6349f16907716.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] Render cache flushes WAS drm/xe: Add missing TLB
 invalidation to emit_pipe_invalidate()
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Changing subject to avoid mixing it up with the potentially missing TLB 
flushes + adding MattB and MattR for additional input,

On 5/31/23 21:12, Souza, Jose wrote:
...
>
>>> Do you see any PIPE_CONTROL flush at the end of batch buffers that i915 does but Xe don't?
>> The emit_fini_breadcrumb() called from __i915_request_submit() indeed
>> seems to emit the flushes needed, whereas the corresponding
>> emit_pipe_imm_ggtt() in xe doesn't.
> Huum!
> What do you think? Xe should do it like i915 or UMDs should do it?

I would be inclined to favor UMDs should do this to avoid excessive 
unnecessary flushing, but then we'd encounter a problem in that the KMD 
needs to be able to ensure that a flush has been performed before 
swapping out / evicting data or freeing a used bo, So I'd say we *need* 
Xe to do it. If this in the future turns out to be a performance 
problem, there are ways to only trigger flushes when somebody starts 
waiting for a fence.

Anybody with another opinion here?

/Thomas


>
>> /Thomas
>>
>>
>>>> /Thomas
>>>>
>>>>> /Thomas
>>>>>
>>>>>>> Thanks,
>>>>>>> Thomas
>>>>>>>
>>>>>>>
>>>>>>>> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
>>>>>>>> ---
>>>>>>>>     drivers/gpu/drm/xe/regs/xe_gpu_commands.h | 1 +
>>>>>>>>     drivers/gpu/drm/xe/xe_ring_ops.c          | 6 ++++--
>>>>>>>>     2 files changed, 5 insertions(+), 2 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>>>>>>>> b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>>>>>>>> index 0f9c5b0b8a3ba..7c7320efea739 100644
>>>>>>>> --- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>>>>>>>> +++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>>>>>>>> @@ -73,6 +73,7 @@
>>>>>>>>     #define
>>>>>>>> PIPE_CONTROL_STORE_DATA_INDEX                        (1<<21)
>>>>>>>>     #define
>>>>>>>> PIPE_CONTROL_CS_STALL                                (1<<20)
>>>>>>>>     #define PIPE_CONTROL_GLOBAL_SNAPSHOT_RESET           (1<<19)
>>>>>>>> +#define PIPE_CONTROL_TLB_INVALIDATE                  (1<<18)
>>>>>>>>     #define
>>>>>>>> PIPE_CONTROL_PSD_SYNC                                (1<<17)
>>>>>>>>     #define
>>>>>>>> PIPE_CONTROL_QW_WRITE                                (1<<14)
>>>>>>>>     #define PIPE_CONTROL_DEPTH_STALL                     (1<<13)
>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c
>>>>>>>> b/drivers/gpu/drm/xe/xe_ring_ops.c
>>>>>>>> index d2fa0b4c8bcc0..4f3ef39109b9b 100644
>>>>>>>> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>>>>>>>> @@ -37,7 +37,8 @@
>>>>>>>>                    PIPE_CONTROL_INDIRECT_STATE_DISABLE | \
>>>>>>>>                    PIPE_CONTROL_FLUSH_ENABLE | \
>>>>>>>>                    PIPE_CONTROL_TEXTURE_CACHE_INVALIDATE | \
>>>>>>>> -               PIPE_CONTROL_DC_FLUSH_ENABLE)
>>>>>>>> +               PIPE_CONTROL_DC_FLUSH_ENABLE | \
>>>>>>>> +               PIPE_CONTROL_TLB_INVALIDATE)
>>>>>>>>       static u32 preparser_disable(bool state)
>>>>>>>>     {
>>>>>>>> @@ -117,7 +118,8 @@ static int emit_pipe_invalidate(u32 mask_flags,
>>>>>>>> u32 *dw, int i)
>>>>>>>>                    PIPE_CONTROL_CONST_CACHE_INVALIDATE |
>>>>>>>>                    PIPE_CONTROL_STATE_CACHE_INVALIDATE |
>>>>>>>>                    PIPE_CONTROL_QW_WRITE |
>>>>>>>> -               PIPE_CONTROL_STORE_DATA_INDEX;
>>>>>>>> +               PIPE_CONTROL_STORE_DATA_INDEX |
>>>>>>>> +               PIPE_CONTROL_TLB_INVALIDATE;
>>>>>>>>              flags &= ~mask_flags;
