Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E36C678D4
	for <intel-xe@archiver.kernel.org>; Thu,  2 Mar 2023 11:51:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0285810E111;
	Thu,  2 Mar 2023 11:51:31 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98D9D10E111
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Mar 2023 11:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677757889; x=1709293889;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=bR/F0+9SY2yhJLtEKDg5cb68oaIEXXw7V6Ibsyh2Slw=;
 b=B6JnD2udFMDOPYpbGIuozSb1ekkuCPeuk4vNc9TEMo3RalpBBu5MI6nS
 mY/1+gIrLYWCwyXCaWsoWMEUPBG3uioe//jBIp3rYJW9Mq4urVbZtne+C
 4H3YVraLCh0kx0C44xvNKAGQpePYpQxVCJSy2rrdy+GiauSeVaqwu0nww
 Q3YbP+CW04zkT7/xwNhfEXyI7wObvH44cto8kCDy+XUlG4GsLj5eJufR/
 8HFapRcYCJoOX2WMB/U9nrZSH1ncFIWy8X4CftXDMseMNAkT0FcURzX+N
 ZUW+xNKeHqt4LmpibDwnfGGmvS0rb0K49PZCR+BhIsXCuz42xV9+0y/+e Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="420960601"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; d="scan'208";a="420960601"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 03:51:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="707390869"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; d="scan'208";a="707390869"
Received: from ygaydayc-mobl.ger.corp.intel.com (HELO [10.251.217.60])
 ([10.251.217.60])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 03:51:27 -0800
Message-ID: <696ec136-70ac-e443-c41c-9e595f6666b3@linux.intel.com>
Date: Thu, 2 Mar 2023 12:51:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
References: <20230228104137.80965-1-matthew.auld@intel.com>
 <20230228104137.80965-13-matthew.auld@intel.com>
 <057c2d66-5aff-ae5e-0b9b-c63bf2aaa213@lankhorst.se>
 <fbe2b091-3d7a-349e-433f-93787af5be2f@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <fbe2b091-3d7a-349e-433f-93787af5be2f@intel.com>
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

Hey,

On 2023-02-28 16:20, Matthew Auld wrote:
> On 28/02/2023 14:48, Maarten Lankhorst wrote:
>> Hey,
>>
>> On 2023-02-28 11:41, Matthew Auld wrote:
>>> The display code wants to read the clear color value from the buffer.
>>> However if the buffer is the non-mappable part of lmem then we fail the
>>> kmap. The simplest solution is to just mark the buffer with
>>> XE_BO_NEEDS_CPU_ACCESS, which will either allocate the buffer in the
>>> mappable part of lmem, or migrate it there.
>>>
>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/display/xe_fb_pin.c | 8 ++++++++
>>>   1 file changed, 8 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c 
>>> b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>> index 65c0bc28a3d1..66e1309e21d8 100644
>>> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>> @@ -203,6 +203,14 @@ static struct i915_vma *__xe_pin_fb_vma(struct 
>>> intel_framebuffer *fb,
>>>       if (ret)
>>>           goto err;
>>> +    /*
>>> +     * For this type of buffer we need to able to read from the CPU 
>>> the
>>> +     * clear color value found in the buffer. This doesn't do 
>>> anything on
>>> +     * non small-bar devices.
>>> +     */
>>> +    if (intel_fb_rc_ccs_cc_plane(&fb->base) >= 0)
>>> +        bo->flags |= XE_BO_NEEDS_CPU_ACCESS;
>>
>> While we do need a change, do we need to do this inside pinning? We 
>> could also require userspace to create VRAM BO's with CPU_ACCESS, and 
>> reject CCS here.
>
> Do you mean reject CCS if CPU_ACCESS is not set? The trouble is that 
> CPU_ACCESS also requires system memory as a spill option when 
> specifying the placements, which then prevents using CCS. Or at least 
> that's how it was in i915.
We should be able to handle it without moving to sysmem, if that's what 
we need.
>>
>> Of course we should probably also add a UAPI to allow setting the 
>> SCANOUT flag on externally imported DMA-BUF bo's, i don't think we 
>> require CPU_ACCESS flag for that as it's not our BO.
>
> Hmm, maybe if SCANOUT then internally use the mappable part of lmem by 
> default? For dumb buffers I think it does something like that. And 
> keep the above as a fallback?
For dumb bo's, it is expected they are mapped, so we can set the 
CPU_ACCESS flag. I don't know if we need it all the time, so for VRAM 
bo's it could be specified as a separate flag, which is ignored for sysmem.
>
>>
>> Might require some more thinking on how we want to handle this.
>>
>> Other patches look good, except for the comments I had:
>>
>> Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>
