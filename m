Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1754CAC581
	for <intel-xe@archiver.kernel.org>; Mon,  8 Sep 2025 12:55:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BAD610E516;
	Mon,  8 Sep 2025 12:55:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XizVfR6R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FBB010E515;
 Mon,  8 Sep 2025 12:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757336123; x=1788872123;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=LjvrZmL6Y6fmSwZC/fek6DJdXKSocuGB/gVFarDecmk=;
 b=XizVfR6Rt2Wta1k5JuSL2qQnAShZCZs7T/Ena7Rrv9wvfSGlMFjYz/Aq
 UKD4CAlZAFC3EZEpPs5jZbTeCvElGkDIOgZOK73+Hppd4UcjnuSqqHLmC
 ltCYFbLNOv33kVTTLmTBPeiOTWPYgMRtAFfBngl58t3wkzCl7hdttSkXF
 YXvhf14Az+DDRuu2birJdL3BXe86s/mVDT6onaB9doxJtJ3/+ibX0PM1H
 9cNxQTo0DfVnNxpII3hxmskJrwos9xpHeBSDoNyC2upHkQBHM11LC4My2
 D1ewWTuzVagei9gHFWRp81nen1FAzpsysl3NzE8TSPgX6O9J9TKLFOR6H Q==;
X-CSE-ConnectionGUID: AfE0xMIaSMOCDorHiD0JjQ==
X-CSE-MsgGUID: 1gjvGmy3TWuzNWWMnAY43Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="58630332"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="58630332"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 05:55:23 -0700
X-CSE-ConnectionGUID: NM2+lZwZTNSucih6xoiJyg==
X-CSE-MsgGUID: 7/595eG0ShaQbDYLcHOwtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="172707068"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.204])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 05:55:21 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, Maarten
 Lankhorst <dev@lankhorst.se>
Subject: Re: [PATCH 2/9] drm/{i915, xe}/fbdev: add intel_fbdev_fb_pitch_align()
In-Reply-To: <aLqsC87Ol_zCXOkN@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1756931441.git.jani.nikula@intel.com>
 <ae51d1e224048bdc87bf7a56d8f5ebd0fbb6a383.1756931441.git.jani.nikula@intel.com>
 <aLqsC87Ol_zCXOkN@intel.com>
Date: Mon, 08 Sep 2025 15:55:18 +0300
Message-ID: <48e0a14d67ba84d64f6589bbdd0090e86be4fd4f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Fri, 05 Sep 2025, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Wed, Sep 03, 2025 at 11:31:59PM +0300, Jani Nikula wrote:
>> Add new helper intel_fbdev_fb_pitch_align() in preparation for further
>> refactoring. The alignment is different for i915 and xe.
>>=20
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/i915/display/intel_fbdev_fb.c | 8 ++++++--
>>  drivers/gpu/drm/i915/display/intel_fbdev_fb.h | 3 +++
>>  drivers/gpu/drm/xe/display/intel_fbdev_fb.c   | 8 ++++++--
>>  3 files changed, 15 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev_fb.c b/drivers/gpu=
/drm/i915/display/intel_fbdev_fb.c
>> index 9c557917d781..d1c03d7b9bdc 100644
>> --- a/drivers/gpu/drm/i915/display/intel_fbdev_fb.c
>> +++ b/drivers/gpu/drm/i915/display/intel_fbdev_fb.c
>> @@ -13,6 +13,11 @@
>>  #include "intel_fb.h"
>>  #include "intel_fbdev_fb.h"
>>=20=20
>> +u32 intel_fbdev_fb_pitch_align(u32 stride)
>> +{
>> +	return ALIGN(stride, 64);
>> +}
>> +
>>  struct intel_framebuffer *intel_fbdev_fb_alloc(struct drm_device *drm,
>>  					       struct drm_fb_helper_surface_size *sizes)
>>  {
>> @@ -30,8 +35,7 @@ struct intel_framebuffer *intel_fbdev_fb_alloc(struct =
drm_device *drm,
>>  	mode_cmd.width =3D sizes->surface_width;
>>  	mode_cmd.height =3D sizes->surface_height;
>>=20=20
>> -	mode_cmd.pitches[0] =3D ALIGN(mode_cmd.width *
>> -				    DIV_ROUND_UP(sizes->surface_bpp, 8), 64);
>> +	mode_cmd.pitches[0] =3D intel_fbdev_fb_pitch_align(mode_cmd.width * DI=
V_ROUND_UP(sizes->surface_bpp, 8));
>>  	mode_cmd.pixel_format =3D drm_mode_legacy_fb_format(sizes->surface_bpp,
>>  							  sizes->surface_depth);
>>=20=20
>> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev_fb.h b/drivers/gpu=
/drm/i915/display/intel_fbdev_fb.h
>> index 668ae355f5e5..caeb543d5efc 100644
>> --- a/drivers/gpu/drm/i915/display/intel_fbdev_fb.h
>> +++ b/drivers/gpu/drm/i915/display/intel_fbdev_fb.h
>> @@ -6,6 +6,8 @@
>>  #ifndef __INTEL_FBDEV_FB_H__
>>  #define __INTEL_FBDEV_FB_H__
>>=20=20
>> +#include <linux/types.h>
>> +
>>  struct drm_device;
>>  struct drm_fb_helper_surface_size;
>>  struct drm_gem_object;
>> @@ -13,6 +15,7 @@ struct fb_info;
>>  struct i915_vma;
>>  struct intel_display;
>>=20=20
>> +u32 intel_fbdev_fb_pitch_align(u32 stride);
>>  struct intel_framebuffer *intel_fbdev_fb_alloc(struct drm_device *drm,
>>  					       struct drm_fb_helper_surface_size *sizes);
>>  int intel_fbdev_fb_fill_info(struct intel_display *display, struct fb_i=
nfo *info,
>> diff --git a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c b/drivers/gpu/d=
rm/xe/display/intel_fbdev_fb.c
>> index bafca1059a40..fd2c40020eea 100644
>> --- a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
>> +++ b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
>> @@ -15,6 +15,11 @@
>>=20=20
>>  #include <generated/xe_wa_oob.h>
>>=20=20
>> +u32 intel_fbdev_fb_pitch_align(u32 stride)
>> +{
>> +	return ALIGN(stride, XE_PAGE_SIZE);
>
> I think someone needs to explain what the heck this extra alignment
> is trying to achieve? I suspect it just needs to get nuked.

That would indeed be great, and allow even further cleanup. I'm just
trying to find the common parts here, and not so much dig into every
little detail that differs.

I did git blame this while writing the patch, and it's all in the big xe
driver enabling commit. I'm not sure where it comes from.

Cc: Maarten, any ideas?

BR,
Jani.

>
>> +}
>> +
>>  struct intel_framebuffer *intel_fbdev_fb_alloc(struct drm_device *drm,
>>  					       struct drm_fb_helper_surface_size *sizes)
>>  {
>> @@ -31,8 +36,7 @@ struct intel_framebuffer *intel_fbdev_fb_alloc(struct =
drm_device *drm,
>>  	mode_cmd.width =3D sizes->surface_width;
>>  	mode_cmd.height =3D sizes->surface_height;
>>=20=20
>> -	mode_cmd.pitches[0] =3D ALIGN(mode_cmd.width *
>> -				    DIV_ROUND_UP(sizes->surface_bpp, 8), XE_PAGE_SIZE);
>> +	mode_cmd.pitches[0] =3D intel_fbdev_fb_pitch_align(mode_cmd.width * DI=
V_ROUND_UP(sizes->surface_bpp, 8));
>>  	mode_cmd.pixel_format =3D drm_mode_legacy_fb_format(sizes->surface_bpp,
>>  							  sizes->surface_depth);
>>=20=20
>> --=20
>> 2.47.2

--=20
Jani Nikula, Intel
