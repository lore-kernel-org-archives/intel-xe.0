Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1C6C77B73
	for <intel-xe@archiver.kernel.org>; Wed, 31 May 2023 08:46:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D21B110E1B8;
	Wed, 31 May 2023 08:46:37 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E84A010E1B8
 for <intel-xe@lists.freedesktop.org>; Wed, 31 May 2023 08:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685522796; x=1717058796;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=057s+Cc+KVxKJYEM4+LAPlLYMw0K9G6hZRP5EOSLRRI=;
 b=QY+v0E9OCXCDYvwULogfP95ZlzjiXHh1g4ZIdEQs4xoHbxFDm4I42O6p
 wA4YEQp4295OGBRGxgbdkgPUNszI26HyIHOfuQzpxXCnNv7U1I1oa3U6N
 JI74rgd5dss/l7yPsuClqqI5LY9ITgpqRxPk54WlBt4FR6A2ciG1vShIp
 3v2jIgYnu369GSdmvaVwp0nBADOkz9WQ7pnIESYP53BQGxBL7/7Xvd+9O
 n0ELex90UlGzTN8lq7zTxu5JwAEmVZvkxxtomylTRWFqsZvDP3YuAv7ew
 MWMVxdYI0D18ZaLM35UcbsDGbJxfXasDQNS5aDmikPG60Pyq9U8pPymof g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="420942821"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="420942821"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 01:46:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="819202145"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="819202145"
Received: from yuyingfa-mobl.ccr.corp.intel.com (HELO [10.249.254.139])
 ([10.249.254.139])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 01:46:22 -0700
Message-ID: <2aee91cb-d377-476d-dd82-65236a7ac9c7@linux.intel.com>
Date: Wed, 31 May 2023 10:46:20 +0200
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
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <faf59c70a4e046654d734fa77629971595dd7331.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Add missing TLB invalidation to
 emit_pipe_invalidate()
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


On 5/30/23 20:40, Souza, Jose wrote:
> On Mon, 2023-05-29 at 17:07 +0200, Thomas Hellström wrote:
>> On 5/29/23 16:56, Thomas Hellström wrote:
>>> On 5/29/23 16:48, Souza, Jose wrote:
>>>> On Mon, 2023-05-29 at 11:08 +0200, Thomas Hellström wrote:
>>>>> On Fri, 2023-05-26 at 12:06 -0700, José Roberto de Souza wrote:
>>>>>> i915 invalidates TLB before emit BB start, so doing the same in Xe.
>>>>> Hi, José,
>>>>>
>>>>> Do you see an issue because of missing TLB flushes? In that case that
>>>>> needs to be added to the commit message. We do TLB flushes on unbind,
>>>>> but not sure if we do them on rebind, so if that's the issue we need to
>>>>> figure out whether we should do them also on rebind or, like in this
>>>>> patch, on each exec.
>>>> I have a group of tests that results flips randomly. It fails when
>>>> the rendered buffer is compared to expected result.
>>>> Anything that add a bit of delay after the exec fixes those tests so
>>>> I was looking for any missing flush in Xe KMD and Mesa.
>>>>
>>>> This one did not fixed it but as i915 was doing it I thought would be
>>>> good to do in Xe too.
>>> I think missing TLB invalidations are more likely to cause random
>>> overwrites of freed memory. Let me do a quick check on these. But the
>>> problem you're describing indeed sounds more like a missing render
>>> cache flush.
>>>
>> It indeed looks like we're doing proper TLB invalidation on both rebind
>> and unbind, so this patch shouldn't really be needed.
>>
>> (look for "invalidation_fence_init()")
> With this patch + PIPE_CONTROL flush at the end of batch buffer in Mesa, fixed the groups of the tests that were flipping results.
> Do a XE_GUC_ACTION_TLB_INVALIDATION is the same as a PIPE_CONTROL_TLB_INVALIDATE?

I would think so, yes, except that the GUC TLB invalidation is GT-wide 
and I'm not sure whether PIPE_CONTROL_TLB_INVALIDATE is per hw engine or 
per-GT.
But given this really has an impact, it might be that we need to 
invalidate TLB also after a bind where we previously pointed to the 
scratch page.

If that's indeed the culprit we should look at issuing a 
PIPE_CONTROL_TLB_INVALIDATE on the exec following a bind or rebind, and 
leave the GuC TLB invalidations for unbinds, and then this patch makes 
sense as a start.


>
> Do you see any PIPE_CONTROL flush at the end of batch buffers that i915 does but Xe don't?

The emit_fini_breadcrumb() called from __i915_request_submit() indeed 
seems to emit the flushes needed, whereas the corresponding
emit_pipe_imm_ggtt() in xe doesn't.

/Thomas


>
>> /Thomas
>>
>>> /Thomas
>>>
>>>>> Thanks,
>>>>> Thomas
>>>>>
>>>>>
>>>>>> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
>>>>>> ---
>>>>>>    drivers/gpu/drm/xe/regs/xe_gpu_commands.h | 1 +
>>>>>>    drivers/gpu/drm/xe/xe_ring_ops.c          | 6 ++++--
>>>>>>    2 files changed, 5 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>>>>>> b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>>>>>> index 0f9c5b0b8a3ba..7c7320efea739 100644
>>>>>> --- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>>>>>> +++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>>>>>> @@ -73,6 +73,7 @@
>>>>>>    #define
>>>>>> PIPE_CONTROL_STORE_DATA_INDEX                        (1<<21)
>>>>>>    #define
>>>>>> PIPE_CONTROL_CS_STALL                                (1<<20)
>>>>>>    #define PIPE_CONTROL_GLOBAL_SNAPSHOT_RESET           (1<<19)
>>>>>> +#define PIPE_CONTROL_TLB_INVALIDATE                  (1<<18)
>>>>>>    #define
>>>>>> PIPE_CONTROL_PSD_SYNC                                (1<<17)
>>>>>>    #define
>>>>>> PIPE_CONTROL_QW_WRITE                                (1<<14)
>>>>>>    #define PIPE_CONTROL_DEPTH_STALL                     (1<<13)
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c
>>>>>> b/drivers/gpu/drm/xe/xe_ring_ops.c
>>>>>> index d2fa0b4c8bcc0..4f3ef39109b9b 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>>>>>> @@ -37,7 +37,8 @@
>>>>>>                   PIPE_CONTROL_INDIRECT_STATE_DISABLE | \
>>>>>>                   PIPE_CONTROL_FLUSH_ENABLE | \
>>>>>>                   PIPE_CONTROL_TEXTURE_CACHE_INVALIDATE | \
>>>>>> -               PIPE_CONTROL_DC_FLUSH_ENABLE)
>>>>>> +               PIPE_CONTROL_DC_FLUSH_ENABLE | \
>>>>>> +               PIPE_CONTROL_TLB_INVALIDATE)
>>>>>>      static u32 preparser_disable(bool state)
>>>>>>    {
>>>>>> @@ -117,7 +118,8 @@ static int emit_pipe_invalidate(u32 mask_flags,
>>>>>> u32 *dw, int i)
>>>>>>                   PIPE_CONTROL_CONST_CACHE_INVALIDATE |
>>>>>>                   PIPE_CONTROL_STATE_CACHE_INVALIDATE |
>>>>>>                   PIPE_CONTROL_QW_WRITE |
>>>>>> -               PIPE_CONTROL_STORE_DATA_INDEX;
>>>>>> +               PIPE_CONTROL_STORE_DATA_INDEX |
>>>>>> +               PIPE_CONTROL_TLB_INVALIDATE;
>>>>>>             flags &= ~mask_flags;
