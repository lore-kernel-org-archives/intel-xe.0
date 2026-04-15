Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC0EF419A2
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 13:00:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 630CC10E6DB;
	Wed, 15 Apr 2026 13:00:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="syJkDXSQ";
	dkim-atps=neutral
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3A0910E6BB
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Apr 2026 10:51:01 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-488a041eae5so49167005e9.1
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Apr 2026 03:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776250260; x=1776855060; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5Oujqv/8qNyc28E1yGSP7HjqXoiuQysuTJR8y6BvpzU=;
 b=syJkDXSQODWJFXCKVEImeo8sYVSM3Cj6iGQZHOsrECAWz7EvZi6iVRFFbKvm//ARvI
 Be5ZatTj8kVDW1Z0bQULhhu0Kzu99uXTzix1rSXfOOTE1asmaTQI7rn2bjcJ1UkbuwO/
 UCxqVz5WHaVBArLS9uvnJVxbQGk9ZiqhX7Wtv45vkD30bJHbcFQu85dsZN5Q53qOk0SW
 x4L2IZaCJLRR5zgVQPUgAiDrwJGE3SfLWsIqLE1TxVxIfaAsBKVBhv929SdaJz13Pufc
 +p1MpPG42SzUNSz0TFM6ibki9+BsWRRJSKL3YlHyk9OiOssxuazMwvq4yrajsASCZA+d
 r1hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776250260; x=1776855060;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5Oujqv/8qNyc28E1yGSP7HjqXoiuQysuTJR8y6BvpzU=;
 b=nPxxth93VbEr5MXQLvj1Wnc8kIlDU1l9glGtALcnZJzJ6U1BJnUj7fNCqHbwBaLVkB
 IiZ6qQ1kLXsNSxLMR7UGQdOKKnzjgkJaLOpb+0/lkYnO2jftFKeDJNpL40hO2R99gMRb
 GYYt44gp6OQFlQjwvW0ZxMdwFyrXeXBv+hg0031eG9l5ec5BMFVfaKNdy2EFGr0rKBQx
 cCwHiD0Qxij+m5Cpi0jID6uTBGO6FimchpNq5waHfN6M9IrkpsjfGK30J4u2BfoeHLKg
 BMcELjJLgc65rPxi2OAi/LhU4+2NNJG3sTFHjWtXrjHtQypIfqfZVLdhqaQhpxcW5m8v
 KaUA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9iZs0aRky7wV7kbYie/46TpCeOqY+pK4liHnDTrs5ALScrYLeQYT4pZdiu88c7XpwnJ1wf2q4BSw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/7b8wEwQMebbpSNOiyGnqMuif0f9saWlf7/yqjnO8+2Nx1JgA
 gAPbeIn/rj/PCv7W/VgYx8uoGSmnmMtBYjv5K3WuLAnwqgLzW/lp0/zz
X-Gm-Gg: AeBDiesXELs5E1wqGwg2uIY73bL82u7iJv7GEXjdbUimTDIsoD6hBgw52IOTfo5eHPg
 CMfjOKIw5DcDVU8cS6o+tAFK/FLcSLrrLoZJeigsAsuzJym1l4+1WwAhnYClRqC7Rt3ErnYEHMI
 BcBT3OuOGg/GTju63Kf+YRt7jes60dVnnrzunXHM6CIZKYGV58QQJyiakd2LjABugnzUd9Cwffk
 o5AFGPiocjc66DJkdZjvcWLDFfhZGAYXmV7rnTuQeFr46QxrA7bALMxSn3iq5UIn4lUoc5rECFN
 StrLkq9wqJpQsvctvCCGSTFBjZ6mQdeXaEmy4DlMkMQzvmFBQ9G/Dvfk/vXwIP+VhFc9eJaMXct
 21dSr5Cy7TY3cNtv4qYCby0YLbVDt7OL4hBBumftbI0VMy5JzDENR9XN/IyuytOQYsYiE/9+nm9
 +ga2BnK1AbiCB9VN3bSPIj5QkMFTs4oN70QM2934OrMe3zWGwKPxe9zLHGtTVqtEHM/Uj5cvrWk
 hVvaZhTFhMqK81a49ZfBr5P6G8=
X-Received: by 2002:a05:600c:a109:b0:488:b239:77ec with SMTP id
 5b1f17b1804b1-488d683d510mr208028525e9.17.1776250260014; 
 Wed, 15 Apr 2026 03:51:00 -0700 (PDT)
Received: from [192.168.1.191] (host-2-101-228-96.as13285.net. [2.101.228.96])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488f1deb9besm41283005e9.6.2026.04.15.03.50.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Apr 2026 03:50:59 -0700 (PDT)
Message-ID: <2a94d80f-a148-47b3-8373-b7a38ff8b9f4@gmail.com>
Date: Wed, 15 Apr 2026 11:50:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/bo: Cache vram_region_gpu_offset in struct xe_bo
To: Matthew Brost <matthew.brost@intel.com>,
 Yuri Martins <yurimartins2004@hotmail.com>
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Auld <matthew.auld@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <CP9P284MB3908AC9B3875FD63E955D139A055A@CP9P284MB3908.BRAP284.PROD.OUTLOOK.COM>
 <10289571cccff20ba52f224080754705c606ccfe.camel@linux.intel.com>
 <CP9P284MB3908EA888D29440A8129DD62A050A@CP9P284MB3908.BRAP284.PROD.OUTLOOK.COM>
 <acyWeZ+n2D8wE1cd@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: Yicong Hui <yiconghui@gmail.com>
In-Reply-To: <acyWeZ+n2D8wE1cd@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 15 Apr 2026 13:00:14 +0000
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

On 01/04/2026 04:52, Matthew Brost wrote:
> On Wed, Apr 01, 2026 at 02:53:17AM +0000, Yuri Martins wrote:
>> Hi Thomas,
>>
>> Thanks for the review and the detailed feedback on the move_notify pattern.
>>
>> You're right to ask for performance data, I don't have any. My hardware
>> (Core Ultra 7 258V) is integrated-only, so vram_region_gpu_offset() returns
>> 0 and the path this targets was never exercised. I should have realized
>> that before submitting.
> All good — we should probably just delete this XXX, as it was an early
> comment from me back when I still had the i915 micro-optimization
> mindset. I agree with Thomas that a change like this has little to no
> impact, given that binds (where this code is typically used) are orders
> of magnitude slower than clearing or moving memory. Plus, binds really
> only end up in the critical path during page faults — and even there,
> we’re usually moving memory first, so a little pointer chasing isn’t
> going to show up.
>
> As someone who has done quite a bit of perf work, here are the areas we
> should focus on cleaning up:
>
> - Time-complexity reduction (e.g., if we can go from O(N²) to O(N log N),
>    etc.)
> - Reduce unnecessary context switches (e.g., don’t call queue_work()
>    blindly when it has nothing to do)
> - Memory placement improvements (e.g., move CPU-read buffers to system
>    memory; move GPU-read buffers to VRAM)
> - Use the hardware correctly (e.g., reduce GPU context switches for
>    common kernel operations, etc.)
>
> Matt
>
>> Withdrawing this patch.
>>
>> Thanks,
>> Yuri
Hi Matthew,

I'm new to kernel development, and I was reading mailing list archives 
and was interested by your comment - I want to try exploring your 
suggestions for performance-improvement patches, particularly in 
reducing time complexity. Do you know of any areas of code within the xe 
drivers that I could potentially try to work on? My personal machine 
runs a Core Ultra processor.

Thank you for your time!
Yicong

