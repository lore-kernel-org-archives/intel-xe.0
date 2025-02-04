Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E076FC02194
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 16:07:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9300010E36A;
	Tue,  4 Feb 2025 16:07:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="ZpuIwjtA";
	dkim-atps=neutral
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 161E710E6B8
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Feb 2025 16:07:13 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-385e27c75f4so4835003f8f.2
 for <intel-xe@lists.freedesktop.org>; Tue, 04 Feb 2025 08:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1738685231; x=1739290031;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QuZCM0aBVEoFpvqXCTbZQIkyAuB2IqK5u2buHv3s34Y=;
 b=ZpuIwjtAdy7pcxJyPoANvf4UAdOQ6nKQULQcobip7AoXmxkoGCY9GSYOy+tZ8PWXfd
 Y/4TV/jzuohimQgovyP+vvbRsUMn2rL8QBYiRYNxy8SCZ0klxVQRaB01NREuMF7DWLdx
 RI71wf6tPREt66Lt6oqpCc10NvJTNNfsYuyg9FFN6phR9uUvvej2NZZcFzbtOtt9ybgJ
 qacJ70CYKPOH0hC91VNJ+r6TUHpoj9BMmK76it59F5N0HbMQC13/2D7t52jZUEbYGo3j
 VV9Y6fvEwrM+ed8/QqIEHp3rQMY+RzpwHUkrG6fOmoD3lOXsnZ06EgTXMBK6P9HUnaOU
 zDnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738685231; x=1739290031;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QuZCM0aBVEoFpvqXCTbZQIkyAuB2IqK5u2buHv3s34Y=;
 b=QZBcxoc4G8yodtNRqdLnukknnoARZASOb182AlfnAA09m/z0clhO8cekHtlAzPrGmO
 BWfmy0iGAvlQv2gVe8/r/EwhsDd13FmurFA47RUqkwGqp9vFykGmhisvoTHUGc95CYQs
 dWUHdEQhJ3HIq7Um8YFuxyHHPuBp4w1w8+1otco2dt8hvvKiJKPgfbfjCb/2puA5D51C
 hxPGtlYcyyVmfyqXyl2jXmY2AVjrYXklDNhLDd1pVCMn28kEtjHBtgGkRXhcUqqZztmL
 IjV0pUitUoLaBPZX9JJcGTl4WIFVwGYTINH3Fk8eK3cHFl0CbfcHunH+IWpXlh5jWXXL
 SwVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbW1KjTwRgqZXb7AK3SYjtZBwf0vWJSgdK7G6pwdY9bbXzBvaAOF5Dj6WsGWWAE8Tp+QKckkY9Mw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCG5K2zKrGmrsrmjMi8wV8W51u7046M+ExLMoiEte2OsX7/WMH
 7xHuRgE2+gM8UDIVuxYxNuIiAesKKRFVH2ohEWMJ58OuNJZsbXgDIrPD5W7BMFg=
X-Gm-Gg: ASbGncu78Tbb5dis44QHDzm957oeBrfVAD66KMBwZV703/oAeAE/LKbIGMYmyM3AlST
 HuEsLXCW5OE8gATMPUBoJ1x7oULP6oiHDAIwg4dJcvCEEZAGcL591r40oTQPwLKBTlfXhk0DFrj
 HKwE+Z8BF7fJSiNJ8hmRJSmHJgHhqR8+5QKNEXVt2zQyRZ5D+NnpmDLHafwlpKqPp7BJr8MyckF
 26Xpv5LlmcCij0aUu+rcn1SQC9htJVx8VFrOdEcfJrj2/XOJZP+yev7OdgthTgDiCdnAz4IZgwI
 CG/ageaEPQ1uRK5YYes0EbPZ+Afq6TQ=
X-Google-Smtp-Source: AGHT+IGrJsUfzAH7gZedqmC3rYz+XOs918ccvSFpECXxatXuSAIAeUiXQ2UnECkhHnyTQ18j0Kd+Lg==
X-Received: by 2002:a5d:588e:0:b0:385:f16d:48b4 with SMTP id
 ffacd0b85a97d-38c5209715fmr24148581f8f.40.1738685230910; 
 Tue, 04 Feb 2025 08:07:10 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e23e6181sm193039015e9.18.2025.02.04.08.07.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 08:07:10 -0800 (PST)
Message-ID: <512fb5af-8a84-46e0-a1ef-fc8ab001cca4@ursulin.net>
Date: Tue, 4 Feb 2025 16:07:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/display: Move dpt allocation to helper
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20250114180403.896587-1-juhapekka.heikkila@gmail.com>
 <87o6zj6utf.fsf@intel.com>
 <xi5ybwn5vzqeoukafh2rbepe5emvotghbp64bz63ofgzhvb736@766j7qcwvis6>
 <87zfj2573g.fsf@intel.com>
 <iqfwraitkhmzhjiga2vfwwgqwlcawdbksmde2oqggh5rl5mzap@jrwrmzlk6x5b>
 <87ldul68zf.fsf@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <87ldul68zf.fsf@intel.com>
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


On 04/02/2025 15:11, Jani Nikula wrote:
> On Tue, 04 Feb 2025, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> On Tue, Feb 04, 2025 at 12:37:07PM +0200, Jani Nikula wrote:
>>> On Mon, 03 Feb 2025, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>>> On Mon, Feb 03, 2025 at 03:07:08PM +0200, Jani Nikula wrote:
>>>>> On Tue, 14 Jan 2025, Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com> wrote:
>>>>>> Simplify __xe_pin_fb_vma_dpt() by moving dpt allocation into helper.
>>>>>> This also fixes bug where dpt could have been allocated from system
>>>>>> memory when on dgfx.
>>>>
>>>> I'd also get the fix in place that will also be needed in stable for
>>>> platforms like BMG. Then the second patch to move it to this helper.
>>>
>>> Let me clarify, are you asking for changes before merging?
>>
>> the reply I gave was very confusing, sorry. What I meant is that there
>> are 2 things here:
>>
>> 1) A fix, so it doesn't try to to allocate dpt from system memory on
>> dgfx
>> 2) Move the code to a separate function.
>>
>> For backporting to stable we'd only need (1), which is trivial, rather
>> than also needing (2) which may have more conflicts.
>>
>> I'll leave that up to you to decide though.
> 
> Now there's also the conversation with Tvrtko, and I've lost track
> whether this should be merged at all. ;D

I don't mind 1/2, only 2/2 would be a bit in the way of adding AuxCSS 
support for ADL-P.

Regards,

Tvrtko

>>>>>
>>>>> Cc: Rodrigo, Lucas, Maarten
>>>>>
>>>>> Should this be merged via drm-intel or drm-xe?
>>>>
>>>> I'd say.... if it's possible, through drm-intel since it's under
>>>> display/. However this only uses xe stuff and may have conflict if
>>>> drm-intel is not in sync, so it may need a backmerge from drm-next.
>>>>
>>>> Since it only deals with xe-stuff, landing it through drm-xe should be
>>>> good too.
>>>
>>> I'd generally err towards merging all of display through drm-intel, but
>>> just asking as a courtesy here because it only touches xe side of
>>> things.
>>
>> yeah, I think it makes sense to prefer drm-intel. Ack for that.
>>
>>
>> Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>>
>> Lucas De Marchi
>>
>>>
>>> BR,
>>> Jani.
>>>
>>>
>>>
>>>>
>>>> Lucas De Marchi
>>>>
>>>>>
>>>>>>
>>>>>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>>>>>> ---
>>>>>>   drivers/gpu/drm/xe/display/xe_fb_pin.c | 67 +++++++++++++++++---------
>>>>>>   1 file changed, 43 insertions(+), 24 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>>>> index 9fa51b84737c..c28885316986 100644
>>>>>> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>>>> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>>>> @@ -77,6 +77,47 @@ write_dpt_remapped(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs,
>>>>>>   	*dpt_ofs = ALIGN(*dpt_ofs, 4096);
>>>>>>   }
>>>>>>
>>>>>> +static struct xe_bo *xe_alloc_dpt_bo(struct xe_device *xe,
>>>>>> +				     struct xe_tile *tile0, u64 size,
>>>>>> +				     u64 physical_alignment)
>>>>>> +{
>>>>>> +	struct xe_bo *dpt;
>>>>>> +
>>>>>> +	/*
>>>>>> +	 * If DGFX: try VRAM0 only
>>>>>> +	 */
>>>>>> +	if (IS_DGFX(xe)) {
>>>>>> +		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
>>>>>> +						      size, ~0ull,
>>>>>> +						      ttm_bo_type_kernel,
>>>>>> +						      XE_BO_FLAG_VRAM0 |
>>>>>> +						      XE_BO_FLAG_GGTT |
>>>>>> +						      XE_BO_FLAG_PAGETABLE,
>>>>>> +						      physical_alignment);
>>>>>> +	} else {
>>>>>> +		/*
>>>>>> +		 * For IGFX: first try STOLEN. on fail try SYSTEM.
>>>>>> +		 */
>>>>>> +		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
>>>>>> +						      size, ~0ull,
>>>>>> +						      ttm_bo_type_kernel,
>>>>>> +						      XE_BO_FLAG_STOLEN |
>>>>>> +						      XE_BO_FLAG_GGTT |
>>>>>> +						      XE_BO_FLAG_PAGETABLE,
>>>>>> +						      physical_alignment);
>>>>>> +		if (IS_ERR(dpt)) {
>>>>>> +			dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
>>>>>> +							      size, ~0ull,
>>>>>> +							      ttm_bo_type_kernel,
>>>>>> +							      XE_BO_FLAG_SYSTEM |
>>>>>> +							      XE_BO_FLAG_GGTT |
>>>>>> +							      XE_BO_FLAG_PAGETABLE,
>>>>>> +							      physical_alignment);
>>>>>> +		}
>>>>>> +	}
>>>>>> +	return dpt;
>>>>>> +}
>>>>>> +
>>>>>>   static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
>>>>>>   			       const struct i915_gtt_view *view,
>>>>>>   			       struct i915_vma *vma,
>>>>>> @@ -99,30 +140,8 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
>>>>>>   		dpt_size = ALIGN(intel_rotation_info_size(&view->rotated) * 8,
>>>>>>   				 XE_PAGE_SIZE);
>>>>>>
>>>>>> -	if (IS_DGFX(xe))
>>>>>> -		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
>>>>>> -						      dpt_size, ~0ull,
>>>>>> -						      ttm_bo_type_kernel,
>>>>>> -						      XE_BO_FLAG_VRAM0 |
>>>>>> -						      XE_BO_FLAG_GGTT |
>>>>>> -						      XE_BO_FLAG_PAGETABLE,
>>>>>> -						      physical_alignment);
>>>>>> -	else
>>>>>> -		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
>>>>>> -						      dpt_size,  ~0ull,
>>>>>> -						      ttm_bo_type_kernel,
>>>>>> -						      XE_BO_FLAG_STOLEN |
>>>>>> -						      XE_BO_FLAG_GGTT |
>>>>>> -						      XE_BO_FLAG_PAGETABLE,
>>>>>> -						      physical_alignment);
>>>>>> -	if (IS_ERR(dpt))
>>>>>> -		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
>>>>>> -						      dpt_size,  ~0ull,
>>>>>> -						      ttm_bo_type_kernel,
>>>>>> -						      XE_BO_FLAG_SYSTEM |
>>>>>> -						      XE_BO_FLAG_GGTT |
>>>>>> -						      XE_BO_FLAG_PAGETABLE,
>>>>>> -						      physical_alignment);
>>>>>> +	dpt = xe_alloc_dpt_bo(xe, tile0, dpt_size, physical_alignment);
>>>>>> +
>>>>>>   	if (IS_ERR(dpt))
>>>>>>   		return PTR_ERR(dpt);
>>>>>
>>>>> --
>>>>> Jani Nikula, Intel
>>>
>>> -- 
>>> Jani Nikula, Intel
> 
