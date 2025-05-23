Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E77C3DA6D
	for <intel-xe@archiver.kernel.org>; Fri, 23 May 2025 12:32:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F131610E7E4;
	Fri, 23 May 2025 12:32:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="iVbSSHze";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9150210E1FF
 for <intel-xe@lists.freedesktop.org>; Fri, 23 May 2025 12:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748003522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JcvksgI45S/8E1WUYGj2/F8s3tMa9vH57sxKYk6s7xg=;
 b=iVbSSHzeoRNl/VsNZl3LFSfg34pZGfXruLTe0hEPfSLjY893wh4DRCAwAdEfi4eveeuXo9
 rqdjBg1wqiEdqBiTJGB/F1OgTxuGn8hE0g6SgfV0ENsbGEP5SkLNe6M5tkjXhK/WXzQnNx
 C6D/XiWtjDmEP9Y+W+05E4AC5Q94kMs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-413-iLhXGY8fPUWY8v8EWfDK5w-1; Fri, 23 May 2025 08:32:01 -0400
X-MC-Unique: iLhXGY8fPUWY8v8EWfDK5w-1
X-Mimecast-MFC-AGG-ID: iLhXGY8fPUWY8v8EWfDK5w_1748003520
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3a364394fa8so3517161f8f.0
 for <intel-xe@lists.freedesktop.org>; Fri, 23 May 2025 05:32:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748003520; x=1748608320;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JcvksgI45S/8E1WUYGj2/F8s3tMa9vH57sxKYk6s7xg=;
 b=d7ChHfZlhTYzn4YBuGr43doW0Q/adbOi2Bo6VC+XK1zXCYfrZY5t1Gn1mSboaGvxMT
 Lw5T6ieYshu0hiW6cwQ/8+7xwfkpTdTAOdQAjG9u3yyuRPEygQpFz6kEl9sZ+tjnBc+g
 OdfqPq0QIakB56GRjN6juvfn0SlCwDBKwB8x+u/3sH/0L5fFl23b5Pyu6dzTgKQLTLBN
 UpOJMtydIXyhGs3HhGGskEgwwVZ5rw0icUG+66ioRJBIhrFBgBSBORQHw0Xk+zPl0C4w
 z7HBQEig4v966Xtj1XVPNuNTkzWWO6JQBhkYFrZAJTFxOAoweG+POpXGdco02AZk7/cQ
 A3cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVu3462fWKU8QaEme5SrhfNWGb0nO4zmOHwgXK99hC7A02XGqfAhvqK1U7dxjpxEhkyK4BpZ+IUQg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIHnRagTm04WVCIKDSpCSwWKZiS9WDo83StdQXHHWs6/92GI/z
 iXSTY/xNx45oX4ODJiktrswBlTh+6JDIkKhURNIOQ5XWOzeWRXzVTxOacsjfz/lQ66Yws0mU+4C
 njJDAnOYT1aNqc77YDjh+065FDvC5b6qaKVKGP5UYtGaWjrzA3p4F6436BayMJdKhxOD3
X-Gm-Gg: ASbGnctA5puodWytWO2MWP5buPlf+S7VxBHNRJ6cpsSn3w74iW1UJOYWMQWRhxwU12L
 g9PsGqjnIhE5vqEpYkcbO4kvdEwt76BvcjMQyr2V87u05yIxz1PVnltUhDa8sk6pyBL10nNv0WR
 AVG/bj2jz56NVt4XvSEAV0bK52Wk7rBxFGXbb+n82nihhF/wmxLHCIANaD3ZW6v4VxIu7jJDUzw
 RJ2OY6J46Nr7I0eh/DagnXcLILGjkOqDT+/RRZlp2WFgx4YAeNjedYre4iRPRsWiNYzrwc39eb5
 DuWa3yS+9JxowYPXA3AFmGIC51QO2cIDwIUIEPTwSdT91+IC4U4=
X-Received: by 2002:a5d:5850:0:b0:3a3:671f:3b8d with SMTP id
 ffacd0b85a97d-3a3671f3bdbmr20822202f8f.24.1748003519831; 
 Fri, 23 May 2025 05:31:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENe0zYjJCdhmq6TU5dk0Zz1XOk+XjQUKGqMTA/fbZa5Ytp2n9rDy/yn9zLGJCZSh2INWr/jw==
X-Received: by 2002:a5d:5850:0:b0:3a3:671f:3b8d with SMTP id
 ffacd0b85a97d-3a3671f3bdbmr20822173f8f.24.1748003519411; 
 Fri, 23 May 2025 05:31:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca4d2ddsm26133607f8f.7.2025.05.23.05.31.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 May 2025 05:31:59 -0700 (PDT)
Message-ID: <d269185e-64ad-49cb-8ef9-760feb1d80bb@redhat.com>
Date: Fri, 23 May 2025 14:31:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] iosys_map: embed the is_iomem bit into the pointer.
To: Lucas De Marchi <lucas.demarchi@intel.com>, Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 intel-xe@lists.freedesktop.org, Michal.Wajdeczko@intel.com
References: <20250522065519.318013-1-airlied@gmail.com>
 <20250522065519.318013-10-airlied@gmail.com>
 <wz6cduq6kh2n2pwxm3q75vjmrsht4rvnbjnch5t66kj773t2rj@kfk2bj7pewwm>
 <CAPM=9twLXMbaTNhr0y52aA90sytE2-zb_zC4eZ5xLC0CE1_1dg@mail.gmail.com>
 <vsyxybzdei2tgybmhwbt7fc2rerphe5zmgbvgh4uj4sr3onsru@bcq72ctoli7q>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <vsyxybzdei2tgybmhwbt7fc2rerphe5zmgbvgh4uj4sr3onsru@bcq72ctoli7q>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4IIjFrqecTr8yeXeG222dLa31wKkKMIZOGYd2truOKw_1748003520
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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

On 22/05/2025 23:05, Lucas De Marchi wrote:
> On Fri, May 23, 2025 at 06:32:43AM +1000, Dave Airlie wrote:
>> On Fri, 23 May 2025 at 01:10, Lucas De Marchi 
>> <lucas.demarchi@intel.com> wrote:
>>>
>>> On Thu, May 22, 2025 at 04:52:18PM +1000, Dave Airlie wrote:
>>> >From: Dave Airlie <airlied@redhat.com>
>>> >
>>> >This reduces this struct from 16 to 8 bytes, and it gets embedded
>>> >into a lot of things.
>>> >
>>> >Signed-off-by: Dave Airlie <airlied@redhat.com>
>>>
>>> Replied too early on cover. Chatting with Michal Wajdeczko today, this
>>> may break things as we then can't byte-address anymore. It seems
>>> particularly dangerous when using the iosys_map_wr/iosys_map_rd as
>>> there's nothing preventing an unaligned address and we increment the map
>>> with the sizeof() of a struct that could be __packed. Example: in
>>> xe_guc_ads.c we use it to write packed structs like guc_gt_system_info.
>>> In this particular case it doesn't give unaligned address, but we should
>>> probably then protect iosys_map from doing the wrong thing.
>>>
>>> So, if we are keeping this patch, we should probably protect
>>> initially-unaligned addresses and the iosys_map_incr() call?
>>
>> oh interesting, my thoughts was of course nobody would want to use
>> this for < 32-byte aligned ptrs :-)
>>
>> but I forgot about using the incr for stuff, I do wonder if the incr
>> could be modelled on a base + offset, as I do think for a lot of stuff
>> we'd want to retain the original vaddr for unmapping or other things,
> 
> for the parts of the code that want to update "inner blocks", the
> approach is to copy the struct and operate on that. Example from
> drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:guc_prep_golden_context:
> 
>      info_map = IOSYS_MAP_INIT_OFFSET(&guc->ads_map,
>                       offsetof(struct __guc_ads_blob, system_info));
> 
> then that function can manipulate its "local map" without affecting the
> one used for really mapping the memory.

Also drm_panic uses that to draw into the frame buffer:
https://elixir.bootlin.com/linux/v6.14.7/source/drivers/gpu/drm/drm_panic.c#L181

So in case of 16bits or 24bits pixel width, it might be unaligned.
As it is used only to save one argument to the "blit" function, I think 
saving 8 bytes in the iosys_map struct, and using an additional offset 
argument is doable.

It is also used the same way in drm_format_helper:
https://elixir.bootlin.com/linux/v6.14.7/source/drivers/gpu/drm/drm_format_helper.c#L290

Best regards,

-- 

Jocelyn

> 
>>
>> I'll play around a bit more next week with at least protecting against 
>> bad uses.
> 
> thanks
> Lucas De Marchi
> 
>>
>> Dave.
> 

