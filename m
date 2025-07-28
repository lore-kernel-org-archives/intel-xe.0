Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2085EC87FCB
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 11:19:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB67210E4E0;
	Mon, 28 Jul 2025 11:19:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PK5wL2V3";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D695A10E4E0
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Jul 2025 11:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1753701567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=knoW5hXdYfxlMfaIaGdm6JpvBEpBbVPIky2WIJsx7bU=;
 b=PK5wL2V3jUtETv7arVhWZsV1b41Xr3EZeATE8kwrw3/V9SVAw00S/Xuf194PQ+winstPiY
 jhJH6lvP7rLFY/ZeNhBaiUFXCMBpM4el9D4OyFoE/1KrXl99v6V2RcASyMlzjiW8jNiM22
 yMwIYz2uBmdpN51qfp4A1YGS6gfH0TI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-28-lB_kxIEyP0q1AJWg5JJgvw-1; Mon, 28 Jul 2025 07:19:23 -0400
X-MC-Unique: lB_kxIEyP0q1AJWg5JJgvw-1
X-Mimecast-MFC-AGG-ID: lB_kxIEyP0q1AJWg5JJgvw_1753701563
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3b7886bfc16so564728f8f.1
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Jul 2025 04:19:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753701562; x=1754306362;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=knoW5hXdYfxlMfaIaGdm6JpvBEpBbVPIky2WIJsx7bU=;
 b=XtVrfp0keae0uulVHntLDJXNlv2dQ8mlqyC7hAlunon89ve2bVb3KFa9nsGiNPD5U4
 UXNaWsDuEgVngsu7laT1LvahZls2HSDzRykylJ8QoULvufk9nC894JsHZ0Q+MMAaFhOA
 nvYQq2pjpnfT6rMBf81CQgyIVfFyal5e4fzxWd32RxYD/hcplbi6mUzoHbrB0J+u02bZ
 Ws4F6K2AWYRp11MGT9Swf+RIVNKQc25zxywqrbmx2pvACpndzDUwLjIZgzXxIRDgweL0
 y7sQyesJYDfVhJvZlOxjF+HgPbpmuUQFN8r3ige3o+EWMmRgITs1c41ghjtZ4xsmpZ/y
 DesQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoQQ5jsPuvVoyZcbMuvpm/vOgugFtWShIRMnpRalEGqPi8vAMUxIKtgnuRo4NC7O2aosI2wYHqWA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyuaudmF/UUk6zAbaRV/cxL44HSlaKIi+DJ4Xq4Al7A/SRdrZHy
 rP27fkyQuKIezZ6HY0zF7TMnRzwSt6u4EpHa6Z1Hyp78LLbCmxdkNBIHTSiqBJfN9P5btaOtglK
 mcoQ6iS5HJoPcRn5X0TXPwUA+eNmVWHAMbXUxrAW+ZBpdsmG3v7icUJhRGJr6z5wfN9JY
X-Gm-Gg: ASbGncteOQDjiLyKAkOSe47SdU2ZupyxDUCXUS2j7HRX3rVPjdOnF0UZnriPoajbszq
 5u9qdfPCIJSPEisIOGyFfvyE5ViJ3jEwW7o/PbI87KG4zRdHcRQDE8PBNR6QkYq102b+x/Khhzz
 E7RGqBQSMV3rpvOAQJjABqgd/fUXpIHb/QtQMTSroCKlcENwrhK80XkDRIAAcQzheZ0QWLwAGUm
 HKhQOFT+RzwwBeXNXvBx77wzF1rR1Y6sgKccS/bjOGVAu3MD/TOavXCF7qCSHWg7OvKEGtXxLGh
 K3zwXHGldEcCoIG10qkG4V01osKqaeAbhAzwUOckTkTq4x4QKDm9UshmLhWDUmxr3UTk7fUcqJl
 5htM=
X-Received: by 2002:a05:6000:188e:b0:3b7:6d95:56d2 with SMTP id
 ffacd0b85a97d-3b776726a56mr8486693f8f.7.1753701562461; 
 Mon, 28 Jul 2025 04:19:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuXibLYD4lVfKwwNJUe9jSKZO7qPSJvy9uo0aYNRx6AYDFqEJHDqBJXZr+qlT8lrhUVJX5RA==
X-Received: by 2002:a05:6000:188e:b0:3b7:6d95:56d2 with SMTP id
 ffacd0b85a97d-3b776726a56mr8486656f8f.7.1753701561737; 
 Mon, 28 Jul 2025 04:19:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:d252:5640:545:41db?
 ([2a01:e0a:d5:a000:d252:5640:545:41db])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4587ac5816dsm94919535e9.17.2025.07.28.04.19.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 04:19:21 -0700 (PDT)
Message-ID: <a7ada116-5613-4518-a151-7c8db9874ede@redhat.com>
Date: Mon, 28 Jul 2025 13:19:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 03/10] drm/i915/display/i9xx: Add a disable_tiling()
 for i9xx planes
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Christian Koenig
 <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250618094011.238154-1-jfalempe@redhat.com>
 <20250618094011.238154-4-jfalempe@redhat.com> <aHviiKb0EnQbNksL@intel.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <aHviiKb0EnQbNksL@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _iJZ_F38l_dHL01PacbWx-prf_yGnXNv0__T89kUSNM_1753701563
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

On 19/07/2025 20:23, Ville Syrjälä wrote:
> On Wed, Jun 18, 2025 at 11:31:21AM +0200, Jocelyn Falempe wrote:
>> drm_panic draws in linear framebuffer, so it's easier to re-use the
>> current framebuffer, and disable tiling in the panic handler, to show
>> the panic screen.
>> This assumes that the alignment restriction is always smaller in
>> linear than in tiled.
>> It also assumes that the linear framebuffer size is always smaller
>> than the tiled.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>
>> v7:
>>   * Reword commit message about alignment/size when disabling tiling (Ville Syrjälä)
>>
>>   drivers/gpu/drm/i915/display/i9xx_plane.c     | 23 +++++++++++++++++++
>>   .../drm/i915/display/intel_display_types.h    |  2 ++
>>   2 files changed, 25 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c b/drivers/gpu/drm/i915/display/i9xx_plane.c
>> index 8f15333a4b07..0807fae12450 100644
>> --- a/drivers/gpu/drm/i915/display/i9xx_plane.c
>> +++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
>> @@ -905,6 +905,27 @@ static const struct drm_plane_funcs i8xx_plane_funcs = {
>>   	.format_mod_supported_async = intel_plane_format_mod_supported_async,
>>   };
>>   
>> +static void i9xx_disable_tiling(struct intel_plane *plane)
>> +{
>> +	struct intel_display *display = to_intel_display(plane);
>> +	enum i9xx_plane_id i9xx_plane = plane->i9xx_plane;
>> +	u32 dspcntr;
>> +	u32 reg;
>> +
>> +	dspcntr = intel_de_read_fw(display, DSPCNTR(display, i9xx_plane));
>> +	dspcntr &= ~DISP_TILED;
>> +	intel_de_write_fw(display, DSPCNTR(display, i9xx_plane), dspcntr);
>> +
>> +	if (DISPLAY_VER(display) >= 4) {
>> +		reg = intel_de_read_fw(display, DSPSURF(display, i9xx_plane));
>> +		intel_de_write_fw(display, DSPSURF(display, i9xx_plane), reg);
>> +
>> +	} else {
>> +		reg = intel_de_read_fw(display, DSPADDR(display, i9xx_plane));
>> +		intel_de_write_fw(display, DSPADDR(display, i9xx_plane), reg);
>> +	}
>> +}
> 
> I thought I already shot this down before, but apparently this
> got merged now :(

Sorry for that. I replied to that thread, but I didn't get answer [1]

> 
> Just to reiterate why we don't want these 'disable tiling' hacks:
> - different tiling formats have different stride/alignment/watermark
>    requirements so one can't safely change from one tiling to another

I agree that going from one tiling format to another is not safe. But 
from my understanding, going from tiling to linear should be possible.
Do you have an example, where the stride/alignment/watermark requirement 
in tiled would be incompatible in Linear (for the same resolution)?

> - this completely fails to account for the TILEOFF vs. LINOFF stuff

Pardon my ignorance, can you explain what it is, and how it can break or 
make the output unreadable?

> - etc.
> 
> So IMO these hacks must be removed and instead the code must learn how
> to propetly write the tiled data. igt has all the code for that btw
> (twice over IIRC) so shouldn't be that hard.

Regarding the tiling format, I usually test on hardware to check that 
the image is correct. But I have only a few of them, and as the format 
is platform dependent, and sometime also depends on the memory 
configuration. For me it looks very hard to get it right.
I've done it only for Y-tile and 4-tile, but only when DPT is enabled 
(which means it's only the few latest generations).

> 
> I suppose the only hack we need to keep is to disable compression,
> mainly because (IIRC) on flat CCS systems the CPU doesn't have access
> to the AUX data to clear it manually.
> 
> I also wonder if there are actual igts for this? I think what is needed
> is a test that sets random things (different panning, rotation, pixel
> foramts, etc.) and triggers the dumper. Not quite sure how the test
> could validate that the output is correct though. CRCs might be a bit
> tricky since you need an identical reference image.

No, I didn't write igts for this yet. I test by triggering a kernel 
panic, as it's the only way to make sure it works.
Also I didn't consider rotation yet, I think if the panic screen is not 
rotated, it's still useful.

> 
> /me off to summer vacation. Good luck
> 

Sorry for that, my goal is just to have drm panic working on intel GPU.
Enjoy your vacation, and let's find a solution when you're back.

[1] 
https://lore.kernel.org/intel-gfx/72fa1da6-caaa-41c9-aef1-4e780bde6acf@redhat.com/

Best regards,

-- 

Jocelyn

