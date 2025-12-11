Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85711D41C09
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 09:48:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4977010E0EF;
	Thu, 11 Dec 2025 09:48:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="LIb9tvl3";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A7A10E0EF;
 Thu, 11 Dec 2025 09:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1765446512;
 bh=5DoQj4TKBqO7bp0JBAA/Kr0VGIysyAeqTkEDShTzYNw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LIb9tvl3Pte0QsssDpmDLTj+nFrYMqs1ODqDKb5oy5Sg/Kze5wtGzCexbrzlMRGmq
 Dwom8dtMy2HtWi9yTQH6Sp0r9YqIlmkDKgHr66DHs8UmsDutB2i0qfv210WYp0qmDq
 i0Wrx52sWkbTdszsBuQm++GaPubA4dIKGBU8wS2D3+XEOrO/6mLv4YAo1SovnycpkD
 UEtdHdjOQqN7DAz2vJhvya5QWZimjMp+08XY592lceNyuMzXK9IsbpP0lmTYB2ceNe
 12QW55GSlJbNSEPpSZyYCoz0aewsyfqAYm5HjrxefO6B3Eti0epPaxfUusIcSDtXU8
 vJiIcF72kj3uA==
Message-ID: <f90ea54d-b46d-497b-bed0-f6469660b8a0@lankhorst.se>
Date: Thu, 11 Dec 2025 10:48:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/i915/display: Fix intel_lpe_audio_irq_handler for
 PREEMPT-RT
To: Jani Nikula <jani.nikula@linux.intel.com>, intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Junxiao Chang <junxiao.chang@intel.com>
References: <20251209151319.494640-3-dev@lankhorst.se>
 <20251209151319.494640-4-dev@lankhorst.se>
 <f9641fa9298cf52efbde5d41014470f2355e3551@intel.com>
 <cb0c9201-74f9-43c5-8177-5b5b77851973@lankhorst.se>
 <e0ba6a112e0150731a23934109e1419d07e526e2@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <e0ba6a112e0150731a23934109e1419d07e526e2@intel.com>
Content-Type: text/plain; charset=UTF-8
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

Yeah,

what about this, paraphrasing Junxia Chang's commit for the similar issue on Xe?

"
The LPE audio interrupt comes from the i915 interrupt handler. It
should be in irq disabled context.
    
With PREEMPT_RT enabled, the IRQ handler is threaded.
Because intel_lpe_audio_irq_handler() may be called in threaded IRQ context,
generic_handle_irq_safe API disables the interrupts before calling LPE's
interrupt top half handler.
    
This fixes braswell audio issues with RT enabled.
"

Kind regards,
~Maarten Lankhorst

Den 2025-12-11 kl. 09:47, skrev Jani Nikula:
> On Wed, 10 Dec 2025, Maarten Lankhorst <dev@lankhorst.se> wrote:
>> Hey,
>>
>> Just needs a typo fixed, Matthew Brost also commented that the second I915 here should be PREEMPT-RT instead.
> 
> The commit message does not say what is being done here, and why.
> 
> "no need for backporting"?
> 
> "this is only useful for i915"?
> 
> *what* "doesn't compile with PREEMPT-RT enabled"?
> 
> Nobody's going to understand what any of this means if a bisect/blame
> lands here a couple of years from now, even if it's an apparently simple
> change.
> 
> BR,
> Jani.
> 
>>
>> Den 2025-12-10 kl. 09:56, skrev Jani Nikula:
>>> On Tue, 09 Dec 2025, Maarten Lankhorst <dev@lankhorst.se> wrote:
>>>> No need for backporting, this is only useful for i915,
>>>> and it doesn't compile with I915 enabled.
>>>
>>> Please elaborate. There's just riddles here.
>>>
>>> BR,
>>> Jani.
>>>
>>>>
>>>> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>>>> ---
>>>>  drivers/gpu/drm/i915/display/intel_lpe_audio.c | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/display/intel_lpe_audio.c b/drivers/gpu/drm/i915/display/intel_lpe_audio.c
>>>> index 5b41abe1c64d5..172c0062237eb 100644
>>>> --- a/drivers/gpu/drm/i915/display/intel_lpe_audio.c
>>>> +++ b/drivers/gpu/drm/i915/display/intel_lpe_audio.c
>>>> @@ -262,7 +262,7 @@ void intel_lpe_audio_irq_handler(struct intel_display *display)
>>>>  	if (!HAS_LPE_AUDIO(display))
>>>>  		return;
>>>>  
>>>> -	ret = generic_handle_irq(display->audio.lpe.irq);
>>>> +	ret = generic_handle_irq_safe(display->audio.lpe.irq);
>>>>  	if (ret)
>>>>  		drm_err_ratelimited(display->drm,
>>>>  				    "error handling LPE audio irq: %d\n", ret);
>>>
>>
> 

