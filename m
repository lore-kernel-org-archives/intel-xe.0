Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04096C7EE29
	for <intel-xe@archiver.kernel.org>; Mon, 29 May 2023 15:07:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C34CB10E2CA;
	Mon, 29 May 2023 15:07:55 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D51710E2CA
 for <intel-xe@lists.freedesktop.org>; Mon, 29 May 2023 15:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685372874; x=1716908874;
 h=message-id:date:mime-version:subject:from:to:references:
 in-reply-to:content-transfer-encoding;
 bh=p9oB7q0VHeX3f/UikvvugAhNOVEzO8mjXSj6yEzuhBA=;
 b=e5ZSmceCl7gLcma05sN8cYqm0zlH1JLy5zm+ltnTipWN27MRhAw34LjM
 1QIXUZrnTDgbUk+woPLuhUzb4Y4GHBT19cR2aZ4S0K+eApqTFuOYtsTyK
 tzfB7xNWtN9HcwisD2IY+viZm5br/laFWpijCoxC6KfA1r9SSYptcgQyM
 uB7uqFsigiI451mnMzkNDcKi35Me+gy5PMvuT1DhmvuAeUhca7DJmbGW2
 kdInHsE6YkUQW/mEKYgFF+MHNlTI6FlkvUXhvU5sg7M8HcVGxcFSE62ll
 qzsVREc7C7ElGuPMk/1hqwjCGNPetZsuzPxJE7kkGc3uZFzI2eTcyo20l w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="344222256"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="344222256"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 08:07:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="830421089"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="830421089"
Received: from yuyingfa-mobl.ccr.corp.intel.com (HELO [10.249.254.136])
 ([10.249.254.136])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 08:07:52 -0700
Message-ID: <41f697fa-97dc-50dd-e438-c62bb1190afe@linux.intel.com>
Date: Mon, 29 May 2023 17:07:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
To: "Souza, Jose" <jose.souza@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20230526190609.61529-1-jose.souza@intel.com>
 <20230526190609.61529-2-jose.souza@intel.com>
 <d03fef471646a9e6141231ab38c264ea46ba291c.camel@linux.intel.com>
 <5d211028d654a8d824e899a073fad9e530c13e95.camel@intel.com>
 <495e7460-cb03-f049-9eb1-43512669acb7@linux.intel.com>
In-Reply-To: <495e7460-cb03-f049-9eb1-43512669acb7@linux.intel.com>
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


On 5/29/23 16:56, Thomas Hellström wrote:
>
> On 5/29/23 16:48, Souza, Jose wrote:
>> On Mon, 2023-05-29 at 11:08 +0200, Thomas Hellström wrote:
>>> On Fri, 2023-05-26 at 12:06 -0700, José Roberto de Souza wrote:
>>>> i915 invalidates TLB before emit BB start, so doing the same in Xe.
>>> Hi, José,
>>>
>>> Do you see an issue because of missing TLB flushes? In that case that
>>> needs to be added to the commit message. We do TLB flushes on unbind,
>>> but not sure if we do them on rebind, so if that's the issue we need to
>>> figure out whether we should do them also on rebind or, like in this
>>> patch, on each exec.
>> I have a group of tests that results flips randomly. It fails when 
>> the rendered buffer is compared to expected result.
>> Anything that add a bit of delay after the exec fixes those tests so 
>> I was looking for any missing flush in Xe KMD and Mesa.
>>
>> This one did not fixed it but as i915 was doing it I thought would be 
>> good to do in Xe too.
>
> I think missing TLB invalidations are more likely to cause random 
> overwrites of freed memory. Let me do a quick check on these. But the 
> problem you're describing indeed sounds more like a missing render 
> cache flush.
>
It indeed looks like we're doing proper TLB invalidation on both rebind 
and unbind, so this patch shouldn't really be needed.

(look for "invalidation_fence_init()")

/Thomas

> /Thomas
>
>>
>>> Thanks,
>>> Thomas
>>>
>>>
>>>> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/regs/xe_gpu_commands.h | 1 +
>>>>   drivers/gpu/drm/xe/xe_ring_ops.c          | 6 ++++--
>>>>   2 files changed, 5 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>>>> b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>>>> index 0f9c5b0b8a3ba..7c7320efea739 100644
>>>> --- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>>>> +++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>>>> @@ -73,6 +73,7 @@
>>>>   #define
>>>> PIPE_CONTROL_STORE_DATA_INDEX                        (1<<21)
>>>>   #define
>>>> PIPE_CONTROL_CS_STALL                                (1<<20)
>>>>   #define PIPE_CONTROL_GLOBAL_SNAPSHOT_RESET           (1<<19)
>>>> +#define PIPE_CONTROL_TLB_INVALIDATE                  (1<<18)
>>>>   #define
>>>> PIPE_CONTROL_PSD_SYNC                                (1<<17)
>>>>   #define
>>>> PIPE_CONTROL_QW_WRITE                                (1<<14)
>>>>   #define PIPE_CONTROL_DEPTH_STALL                     (1<<13)
>>>> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c
>>>> b/drivers/gpu/drm/xe/xe_ring_ops.c
>>>> index d2fa0b4c8bcc0..4f3ef39109b9b 100644
>>>> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
>>>> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>>>> @@ -37,7 +37,8 @@
>>>>                  PIPE_CONTROL_INDIRECT_STATE_DISABLE | \
>>>>                  PIPE_CONTROL_FLUSH_ENABLE | \
>>>>                  PIPE_CONTROL_TEXTURE_CACHE_INVALIDATE | \
>>>> -               PIPE_CONTROL_DC_FLUSH_ENABLE)
>>>> +               PIPE_CONTROL_DC_FLUSH_ENABLE | \
>>>> +               PIPE_CONTROL_TLB_INVALIDATE)
>>>>     static u32 preparser_disable(bool state)
>>>>   {
>>>> @@ -117,7 +118,8 @@ static int emit_pipe_invalidate(u32 mask_flags,
>>>> u32 *dw, int i)
>>>>                  PIPE_CONTROL_CONST_CACHE_INVALIDATE |
>>>>                  PIPE_CONTROL_STATE_CACHE_INVALIDATE |
>>>>                  PIPE_CONTROL_QW_WRITE |
>>>> -               PIPE_CONTROL_STORE_DATA_INDEX;
>>>> +               PIPE_CONTROL_STORE_DATA_INDEX |
>>>> +               PIPE_CONTROL_TLB_INVALIDATE;
>>>>            flags &= ~mask_flags;
