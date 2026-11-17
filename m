Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7D8606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 15:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lankhorst.se header.i=@lankhorst.se header.a=rsa-sha256 header.s=default header.b=BLj4xPkp
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B186110EB97;
	Tue, 17 Nov 2026 15:56:49 +0000 (UTC)
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B32F10EB91;
 Tue, 17 Nov 2026 15:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1794931001;
 bh=lT1DStF0diOJrAhQojkKde1uSUXG5CvuzA/3fseiE6c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BLj4xPkpLuCIFqiNyedN0mXGwocAMQvk+kLCwzP46cifR9CF72AvdkItw3yzUd14+
 acRFDhr6qjgg2n1OkANzVwrzNOoxFvYbtDyYuKmvih2Ks20/Gu7j+sPAtYuT0sIj/R
 TvSqQKMUAPEtaQFf40fci8RHdDGHLLoMW0bzCCD39MMX+rpaWGM9hRlXWwdWSyLKUH
 zjzMKCkUWinpyXlHzauLzXaTB06fnSFqwBpaQdtEYPRFiEzXNn1eJm0Q8ArpqNA+ot
 suNckx5iG/4eETceaouhpwyvlMxjRyXDtjlYvI9b7PtmmK4h/ZgVJ0PgJrqZC+dw+P
 Yl6nimHfL94rQ==
Message-ID: <7fa6546b-9330-41f3-907c-9ac9fcae938e@lankhorst.se>
Date: Tue, 17 Nov 2026 16:57:56 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] drm/i915: Introduce
 intel_bo_fbdev_bios_fb_takeover()
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Uma Shankar <uma.shankar@intel.com>
References: <20261116131349.333818-7-dev@lankhorst.se>
 <20261116131349.333818-12-dev@lankhorst.se> <avsEcPjp0TdD1JDp@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <avsEcPjp0TdD1JDp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hey,

On 11/16/26 14:26, Ville Syrjälä wrote:
> On Mon, Nov 16, 2026 at 02:13:55PM +0100, Maarten Lankhorst wrote:
>> Pull the "do we want to use stolen for the BIOS FB?" checks into
>> a new intel_bo_fbdev_bios_fb_takeover() helper, and defer that
>> decision until we're ready to reallocate the fbdev FB. This way
>> even if we don't want to ultimately use the BIOS FB we'll keep
>> the plane enabled until the replacement FB is ready. Should
>> hopefully result in fewer display blinks during boot.
>>
>> Additionally, on some platforms this allows us to re-create the
>> framebuffer when stolen memory is not suitable, using the blitter
>> engine to copy the contents to system memory without causing
>> any flickering by not preserving the stolen memory allocation.
>>
>> This patch is a modification the original patch by Ville.
>> Originally only the decision to drop stolen fb was deferred.
>>
>> The modifications allow it to flip to a different fb that still
>> contains the contents of the previous framebuffer to preserve
>> the flicker free property of boot, even when the original stolen
>> framebuffer is dropped. Additionally, bios_fb_ok() was renamed
>> to bios_fb_takeover() with a different function signature.
>>
>> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
>> Reviewed-by: Uma Shankar <uma.shankar@intel.com>
>> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>> ---
>>  drivers/gpu/drm/i915/display/intel_bo.c       |  7 ++
>>  drivers/gpu/drm/i915/display/intel_bo.h       |  1 +
>>  drivers/gpu/drm/i915/display/intel_fbdev.c    | 68 ++++++++++++++++---
>>  drivers/gpu/drm/i915/i915_bo.c                | 14 +++-
>>  drivers/gpu/drm/i915/i915_bo.h                |  6 --
>>  drivers/gpu/drm/i915/i915_initial_plane.c     | 14 ----
>>  drivers/gpu/drm/xe/display/xe_display_bo.c    | 62 ++++++++++++++++-
>>  drivers/gpu/drm/xe/display/xe_display_bo.h    |  6 --
>>  drivers/gpu/drm/xe/display/xe_initial_plane.c | 10 +--
>>  include/drm/intel/display_parent_interface.h  |  1 +
>>  10 files changed, 141 insertions(+), 48 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_bo.c b/drivers/gpu/drm/i915/display/intel_bo.c
>> index 8ecdbb7e39f3d..878c62cb48b4f 100644
>> --- a/drivers/gpu/drm/i915/display/intel_bo.c
>> +++ b/drivers/gpu/drm/i915/display/intel_bo.c
>> @@ -92,6 +92,13 @@ u32 intel_bo_fbdev_pitch_align(struct intel_display *display, u32 stride)
>>  	return display->parent->bo->fbdev_pitch_align(stride);
>>  }
>>  
>> +struct drm_gem_object *intel_bo_fbdev_bios_fb_takeover(struct drm_gem_object *obj)
>> +{
>> +	struct intel_display *display = to_intel_display(obj->dev);
>> +
>> +	return display->parent->bo->fbdev_bios_fb_takeover(obj);
>> +}
>> +
>>  struct drm_gem_object *intel_bo_fbdev_create(struct intel_display *display, int size)
>>  {
>>  	return display->parent->bo->fbdev_create(display->drm, size);
>> diff --git a/drivers/gpu/drm/i915/display/intel_bo.h b/drivers/gpu/drm/i915/display/intel_bo.h
>> index 348f7fa669608..0410ee9c6d2e1 100644
>> --- a/drivers/gpu/drm/i915/display/intel_bo.h
>> +++ b/drivers/gpu/drm/i915/display/intel_bo.h
>> @@ -34,6 +34,7 @@ struct drm_gem_object *intel_bo_framebuffer_lookup(struct intel_display *display
>>  						   const struct drm_mode_fb_cmd2 *user_mode_cmd);
>>  
>>  u32 intel_bo_fbdev_pitch_align(struct intel_display *display, u32 stride);
>> +struct drm_gem_object *intel_bo_fbdev_bios_fb_takeover(struct drm_gem_object *obj);
>>  struct drm_gem_object *intel_bo_fbdev_create(struct intel_display *display, int size);
>>  void intel_bo_fbdev_destroy(struct drm_gem_object *obj);
>>  int intel_bo_fbdev_fill_info(struct drm_gem_object *obj, struct fb_info *info,
>> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
>> index c09246a9865cd..8ef522df7f172 100644
>> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
>> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
>> @@ -229,8 +229,8 @@ __intel_fbdev_fb_alloc(struct intel_display *display,
>>  		       struct drm_fb_helper_surface_size *sizes)
>>  {
>>  	struct drm_mode_fb_cmd2 mode_cmd = {};
>> -	struct drm_framebuffer *fb;
>>  	struct drm_gem_object *obj;
>> +	struct drm_framebuffer *fb;
>>  	int size;
>>  
>>  	intel_fbdev_fill_mode_cmd(display, sizes, &mode_cmd);
>> @@ -263,32 +263,68 @@ __intel_fbdev_fb_alloc(struct intel_display *display,
>>  
>>  }
>>  
>> -static bool bios_fb_ok(const struct intel_framebuffer *fb,
>> -		       const struct drm_fb_helper_surface_size *sizes)
> 
> You seem to have ignored my previous comments completely.
It seems I overlooked those!

I've spun a new version with the feedback.

Sashiko also had some comments about double unpin.

After looking carefully, the only times it can fail are with an invalid configuration.
Since we already created the framebuffer once, this failure path will not happen when
re-creating the fb.

Kind regards,
~Maarten Lankhorst
