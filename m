Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DAABC7EE30
	for <intel-xe@archiver.kernel.org>; Fri,  3 Mar 2023 12:58:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62DC910E045;
	Fri,  3 Mar 2023 12:58:24 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D887E10E045
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Mar 2023 12:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677848301; x=1709384301;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=fr+X9ILmoJYe2txHoNdB1ohIw6bJ2xUZX2GW+OYjUqg=;
 b=N2qFiGbikunX0xHdumX0JmIRSKRsbjUuZ9LP5zU2iAqXTfB7dKseqxvI
 AQMs9kTxslV3Pd83JBzRhETiSyUpPbd0m4iJIpptzMUUNJiKWLa861A92
 tH+wImdw1dRmUahurkxNymrHwWv08WqwdL8XJNTPlKdqXXYiIytbaSnnH
 7oltV41AV33ZW9ffY1+H7nCoDgzvt3HO9nVhRPOdfgYl/pt1MjfnrGln4
 qaYNNK4fnOIS8POHDTyU8y5Xh1N2iswbSLMq9OGfRB/aNfrIhpj9JGShq
 6ur3oCA87+50b1RU+5ZMTxIOVC41AYh9VrLA8/wePk9zYwRAwaCAjLR6D w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="336553907"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="336553907"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 04:58:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="764407802"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="764407802"
Received: from ehenriet-mobl.ger.corp.intel.com (HELO [10.249.42.106])
 ([10.249.42.106])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 04:58:17 -0800
Message-ID: <fed12cec-8e43-9f0e-9c30-9131a9fd3234@linux.intel.com>
Date: Fri, 3 Mar 2023 13:58:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
References: <20230228104137.80965-1-matthew.auld@intel.com>
 <20230228104137.80965-13-matthew.auld@intel.com>
 <057c2d66-5aff-ae5e-0b9b-c63bf2aaa213@lankhorst.se>
 <fbe2b091-3d7a-349e-433f-93787af5be2f@intel.com>
 <696ec136-70ac-e443-c41c-9e595f6666b3@linux.intel.com>
 <c74f5db7-241c-564d-f8cd-73e8e9ee6c7a@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <c74f5db7-241c-564d-f8cd-73e8e9ee6c7a@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v2 12/14] drm/xe/display: annotate CC buffers
 with NEEDS_CPU_ACCESS
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 2023-03-03 13:12, Matthew Auld wrote:
> On 02/03/2023 11:51, Maarten Lankhorst wrote:
>> Hey,
>>
>> On 2023-02-28 16:20, Matthew Auld wrote:
>>> On 28/02/2023 14:48, Maarten Lankhorst wrote:
>>>> Hey,
>>>>
>>>> On 2023-02-28 11:41, Matthew Auld wrote:
>>>>> The display code wants to read the clear color value from the buffer.
>>>>> However if the buffer is the non-mappable part of lmem then we 
>>>>> fail the
>>>>> kmap. The simplest solution is to just mark the buffer with
>>>>> XE_BO_NEEDS_CPU_ACCESS, which will either allocate the buffer in the
>>>>> mappable part of lmem, or migrate it there.
>>>>>
>>>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>> ---
>>>>>   drivers/gpu/drm/xe/display/xe_fb_pin.c | 8 ++++++++
>>>>>   1 file changed, 8 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c 
>>>>> b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>>> index 65c0bc28a3d1..66e1309e21d8 100644
>>>>> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>>> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>>> @@ -203,6 +203,14 @@ static struct i915_vma 
>>>>> *__xe_pin_fb_vma(struct intel_framebuffer *fb,
>>>>>       if (ret)
>>>>>           goto err;
>>>>> +    /*
>>>>> +     * For this type of buffer we need to able to read from the 
>>>>> CPU the
>>>>> +     * clear color value found in the buffer. This doesn't do 
>>>>> anything on
>>>>> +     * non small-bar devices.
>>>>> +     */
>>>>> +    if (intel_fb_rc_ccs_cc_plane(&fb->base) >= 0)
>>>>> +        bo->flags |= XE_BO_NEEDS_CPU_ACCESS;
>>>>
>>>> While we do need a change, do we need to do this inside pinning? We 
>>>> could also require userspace to create VRAM BO's with CPU_ACCESS, 
>>>> and reject CCS here.
>>>
>>> Do you mean reject CCS if CPU_ACCESS is not set? The trouble is that 
>>> CPU_ACCESS also requires system memory as a spill option when 
>>> specifying the placements, which then prevents using CCS. Or at 
>>> least that's how it was in i915.
>> We should be able to handle it without moving to sysmem, if that's 
>> what we need.
>
> Ok, so maybe drop NEEDS_CPU_ACCESS, and just have NEEDS_VISIBLE_VRAM 
> instead, and to get the old behaviour the user can just attach system 
> memory as an extra placement? And then for clear color stuff they can 
> use VISIBLE_VRAM by itself, and we can enforce that here?
You can't put a FB In sysmem anyway, so we need to pass a flag to put it 
in visible VRAM.
>>>>
>>>> Of course we should probably also add a UAPI to allow setting the 
>>>> SCANOUT flag on externally imported DMA-BUF bo's, i don't think we 
>>>> require CPU_ACCESS flag for that as it's not our BO.
>
> For discrete specifically, can you have externally imported dma-buf 
> for display (not originating from the same device)? The scanout needs 
> vram local to the device, right?
I don't think it's currently possible, I have no idea whether external 
VRAM is possible, I think it would depend on the hardware, but if it was 
supported, I would imagine sysmem would also have been.
>>>
>>> Hmm, maybe if SCANOUT then internally use the mappable part of lmem 
>>> by default? For dumb buffers I think it does something like that. 
>>> And keep the above as a fallback?
>> For dumb bo's, it is expected they are mapped, so we can set the 
>> CPU_ACCESS flag. I don't know if we need it all the time, so for VRAM 
>> bo's it could be specified as a separate flag, which is ignored for 
>> sysmem.
>>>
>>>>
>>>> Might require some more thinking on how we want to handle this.
>>>>
>>>> Other patches look good, except for the comments I had:
>>>>
>>>> Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>>
~Maarten
