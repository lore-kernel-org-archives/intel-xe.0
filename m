Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30473C36017
	for <intel-xe@archiver.kernel.org>; Tue,  1 Apr 2025 22:15:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD74810E0CC;
	Tue,  1 Apr 2025 22:15:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="X5CYl9Am";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D2210E0CC
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Apr 2025 22:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743545719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gCnG0w61xeNP3N9rmjlU9KIs4JUt9rduykjEWBDPfjI=;
 b=X5CYl9AmRYYyeC43ZcuYYbia6vKEMn4sg12eeN6bnCreTL8ue2U09XJVTCbtpaZ9kzEmKk
 exdFgq71n8dnyfKwVjaohe/S4uzmaREF/2SYWMprjKSIoBDXhxfo8/i2ASpKaDpea6yoOh
 LhXYetioMKwvIZyMPtAvDa/MJl2kXvM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-e6Bx6_6TPtaNyQczrZTFKQ-1; Tue, 01 Apr 2025 18:15:16 -0400
X-MC-Unique: e6Bx6_6TPtaNyQczrZTFKQ-1
X-Mimecast-MFC-AGG-ID: e6Bx6_6TPtaNyQczrZTFKQ_1743545715
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-39130f02631so2073243f8f.2
 for <intel-xe@lists.freedesktop.org>; Tue, 01 Apr 2025 15:15:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743545715; x=1744150515;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gCnG0w61xeNP3N9rmjlU9KIs4JUt9rduykjEWBDPfjI=;
 b=wGLFVJdVnIpV1OoxyBtHsRMalxHIlvbJCb6gZ4cihS0dBkuftNcDGzdw4OdgIf2Lkz
 Zg1b+LthYmCn0XX1uhE+AD5nQ2pYhSf9IiewEEzB6mgtfshde5RrqkfMrOfC/YX2RwGk
 m7WhKDM4gWClfT1MFSrUnUQ5qPJqog6Q8+xPGtDuVCc7C1yf6RosAfA3XfsEwQZwzhD+
 cOmdYHW9+kdLfmqx71NBmFZgOmoTwnhQbXnuh1OLpsW3y2jMBzg3G6WsCiPNigItHWYq
 qVoXTWIBTu9FCQwiXmbCMV6KLmaTE63s1j4fADGazC+SyFX8EjTJiBtQCutInZPB80Cj
 RgwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuET2wngpijgoEN10a4meZ/Pko320x0ZO7wf830VcsOuPO9/QYShk9/ER3alLh127VvEvoY6Xyyw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHUd3dCEw4XcKGEo2jord3yCVJ/TMM8+eF7AE8I1PKnNQDYwyi
 fyywQnR80yJU+I6a/V6/PtuLCnYlapDn5nhZeuH/G7bRjCKeh840o6tThEkAKNm19S77sNipttA
 yCc7LYNUOd84b+S1257pzWwg8ULW+fYAjQUJo1Mp+FETu9ksVJNuPawQoIZL6iDS8
X-Gm-Gg: ASbGncvlZb9KQ0DbesqqqpUht6ZCE47KE9pwp62qkHKDX/XjnTtYnn2q+pIxGfOIiP3
 swFQzsk4TO9CdNhRkDukc8uhVZDjPPRonwWOKdnBxIJeYUPZ/yIbtrti+ayJi+8MnX7d78z+rUX
 lGTV8AkmkfI+6oQU4XuA9X2JwChshs77Bjc+CCM80Zis8/ilbJse9wfBSTZMFqJ4DGzxme5TTKN
 9dngmqXfuaV9sLaIkjHWkXvXc0o0kaG6YVLcgPRD+nPl4/fWZifQicxaiBX24HOyjHnxQ0GYG57
 4/h96Fp83/8LHI16I78tg4LsDnYHQpU7+2mJw2ZcJif7qOzgOmu0o3Q=
X-Received: by 2002:a5d:47cb:0:b0:391:300f:749e with SMTP id
 ffacd0b85a97d-39c23646f8dmr4379866f8f.11.1743545714957; 
 Tue, 01 Apr 2025 15:15:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyd9uviVhrGUf1RSdE3DFAW69QVYjkJkLc0cnGUT2yI2qvwX6spAl3h5cUQ5Eklq6k0cX4nA==
X-Received: by 2002:a5d:47cb:0:b0:391:300f:749e with SMTP id
 ffacd0b85a97d-39c23646f8dmr4379847f8f.11.1743545714502; 
 Tue, 01 Apr 2025 15:15:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b7a4346sm15465228f8f.95.2025.04.01.15.15.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 15:15:13 -0700 (PDT)
Message-ID: <72fa1da6-caaa-41c9-aef1-4e780bde6acf@redhat.com>
Date: Wed, 2 Apr 2025 00:15:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/8] drm/i915/display/i9xx: Add a disable_tiling() for
 i9xx planes
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250401125818.333033-1-jfalempe@redhat.com>
 <20250401125818.333033-3-jfalempe@redhat.com> <Z-wkmdNgCM2-Ye7m@intel.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <Z-wkmdNgCM2-Ye7m@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kRxRaLOZrTbUf174CJmANJjEKpq223vHYvuqtMroXfM_1743545715
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

On 01/04/2025 19:38, Ville Syrjälä wrote:
> On Tue, Apr 01, 2025 at 02:51:08PM +0200, Jocelyn Falempe wrote:
>> drm_panic draws in linear framebuffer, so it's easier to re-use the
>> current framebuffer, and disable tiling in the panic handler, to show
>> the panic screen.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/i915/display/i9xx_plane.c     | 23 +++++++++++++++++++
>>   .../drm/i915/display/intel_display_types.h    |  2 ++
>>   2 files changed, 25 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c b/drivers/gpu/drm/i915/display/i9xx_plane.c
>> index 5e8344fdfc28..9c93d5ac7129 100644
>> --- a/drivers/gpu/drm/i915/display/i9xx_plane.c
>> +++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
>> @@ -908,6 +908,27 @@ static const struct drm_plane_funcs i8xx_plane_funcs = {
>>   	.format_mod_supported = i8xx_plane_format_mod_supported,
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
> 
> This fails to account all the different alignment/etc. restrictions
> between linear vs. tiled. I don't think we want hacks like this.

Thanks for taking a look.
I assumed that linear have always less alignment restrictions than 
tiled. I also assumed that the framebuffer size in linear is smaller 
than tiled (as we keep the same pixel format). So going from tiled to 
linear should be safe, the other way is not.

It's done this way in amdgpu [1], but I agree it might be different on 
Intel hardware

The alternative is to draw with tiling, which is what I have done for 
Y-tile and 4-tile format, so it's also a possibility, but more complex 
to maintain.

[1] 
https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/gpu/drm/amd/display/dc/core/dc_surface.c#L298

Best regards,

-- 

Jocelyn

> 
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
>> +
>>   struct intel_plane *
>>   intel_primary_plane_create(struct intel_display *display, enum pipe pipe)
>>   {
>> @@ -1050,6 +1071,8 @@ intel_primary_plane_create(struct intel_display *display, enum pipe pipe)
>>   		}
>>   	}
>>   
>> +	plane->disable_tiling = i9xx_disable_tiling;
>> +
>>   	modifiers = intel_fb_plane_get_modifiers(display, INTEL_PLANE_CAP_TILING_X);
>>   
>>   	if (DISPLAY_VER(display) >= 5 || display->platform.g4x)
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
>> index 367b53a9eae2..62d0785c9edf 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
>> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
>> @@ -1512,6 +1512,8 @@ struct intel_plane {
>>   			   bool async_flip);
>>   	void (*enable_flip_done)(struct intel_plane *plane);
>>   	void (*disable_flip_done)(struct intel_plane *plane);
>> +	/* For drm_panic */
>> +	void (*disable_tiling)(struct intel_plane *plane);
>>   };
>>   
>>   #define to_intel_atomic_state(x) container_of(x, struct intel_atomic_state, base)
>> -- 
>> 2.49.0
> 

