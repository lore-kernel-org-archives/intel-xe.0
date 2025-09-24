Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E10D0CAC5A5
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 13:09:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A190689048;
	Wed, 24 Sep 2025 13:09:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ADM9g/vF";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6338189048
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 13:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vAxI5sS/ahY1dry2BMdy/lqOZDPrR8PwqAPRKLqRvQ4=; b=ADM9g/vFneWFgKqOi8fRQep4Fv
 Q2ikgmMk7FJyN7NES+Dl+V1vckM7nMshJL6B1bbIy7g5nBbVlyHVOv+hR/mIGZCIWIuYeFDvY7Hca
 2cWpVd9jaGdhsZSnW+5sr2FxPvTLk3cOS0+5kBO0r9Rx3L9ig2bBDri0exLRASeHW6YWKo79mw9yA
 yTijixTgE/jEa0kCccpOOCD46QCH62cBy3AudJv0O6V1d8swqW/SnCDyc6Oq8ie30Pq5WU1qG784t
 LtVB6G4sczFBblsuBgCCRnCp5mXsIRDUA9AGZKOLnAM/GRh7/Z8QppyEBQtUHXCTIMfwoFCYXNQVH
 vWAKTcyA==;
Received: from [84.66.36.92] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1v1PFe-00GtJl-N5; Wed, 24 Sep 2025 15:09:42 +0200
Message-ID: <e2cb2159-367b-4f43-babc-a5250fc9914d@igalia.com>
Date: Wed, 24 Sep 2025 14:09:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 11/13] drm/xe: Force flush system memory AuxCCS
 framebuffers before scan out
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250923100812.88257-1-tvrtko.ursulin@igalia.com>
 <20250923100812.88257-12-tvrtko.ursulin@igalia.com>
 <aNJ0Pw9tvFA3jWDr@intel.com>
 <8bec1692-1bec-45ff-a552-10ff8c7420b5@igalia.com>
 <aNKMKSIGSPfmPBEc@intel.com>
 <afd72823-2b19-4d15-b87e-bd879568ad02@igalia.com>
 <aNKer6J7Op2gGmtC@intel.com>
 <f0fbf72f-4791-4aff-a4cb-299bf9ef265f@igalia.com>
 <aNK0E7KMBW5iOzSo@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <aNK0E7KMBW5iOzSo@intel.com>
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


On 23/09/2025 15:52, Ville Syrjälä wrote:
> On Tue, Sep 23, 2025 at 03:40:55PM +0100, Tvrtko Ursulin wrote:
>>
>> On 23/09/2025 14:20, Ville Syrjälä wrote:
>>> On Tue, Sep 23, 2025 at 01:25:58PM +0100, Tvrtko Ursulin wrote:
>>>>
>>>> On 23/09/2025 13:01, Ville Syrjälä wrote:
>>>>> On Tue, Sep 23, 2025 at 11:48:59AM +0100, Tvrtko Ursulin wrote:
>>>>>>
>>>>>> On 23/09/2025 11:19, Ville Syrjälä wrote:
>>>>>>> On Tue, Sep 23, 2025 at 11:08:04AM +0100, Tvrtko Ursulin wrote:
>>>>>>>> Even though frame buffer objects are created as write-combined, in
>>>>>>>> practice, on top of all the ring buffer flushing, an additional clflush
>>>>>>>> seems to be needed before display engine can coherently scan out the
>>>>>>>> AuxCCS compressed data without transient artifacts.
>>>>>>>>
>>>>>>>> If for comparison we look at how i915 handles things (where AuxCCS works
>>>>>>>> fine), as it happens it has this same clflush before a frame buffer is
>>>>>>>> pinned for display for the first time, courtesy the dynamic tracking of
>>>>>>>> the buffer cache mode and setting the latter to uncached before handing
>>>>>>>> to display.
>>>>>>>>
>>>>>>>> Since xe considers the buffer object caching mode as static we can
>>>>>>>> implement the same approach by adding a flag telling us if the buffer
>>>>>>>> was ever pinned for display and flush on the first pin. Subsequent re-pins
>>>>>>>> will not repeat the clflush but so far I have not observed any glitching
>>>>>>>> after the first pin.
>>>>>>>>
>>>>>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>>>>>> ---
>>>>>>>>      drivers/gpu/drm/xe/display/xe_fb_pin.c | 14 +++++++++++++-
>>>>>>>>      drivers/gpu/drm/xe/xe_bo_types.h       | 14 +++++++++-----
>>>>>>>>      2 files changed, 22 insertions(+), 6 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>>>>>> index d8aa23b8cf14..f247c0da6b9e 100644
>>>>>>>> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>>>>>> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>>>>>> @@ -382,6 +382,7 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
>>>>>>>>      	struct xe_bo *bo = gem_to_xe_bo(obj);
>>>>>>>>      	struct xe_validation_ctx ctx;
>>>>>>>>      	struct drm_exec exec;
>>>>>>>> +	bool first_pin;
>>>>>>>>      	int ret = 0;
>>>>>>>>      
>>>>>>>>      	if (!vma)
>>>>>>>> @@ -422,8 +423,11 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
>>>>>>>>      			ret = xe_bo_validate(bo, NULL, true, &exec);
>>>>>>>>      		drm_exec_retry_on_contention(&exec);
>>>>>>>>      		xe_validation_retry_on_oom(&ctx, &ret);
>>>>>>>> -		if (!ret)
>>>>>>>> +		if (!ret) {
>>>>>>>>      			ttm_bo_pin(&bo->ttm);
>>>>>>>> +			first_pin = !bo->display_pin;
>>>>>>>> +			bo->display_pin = true;
>>>>>>>> +		}
>>>>>>>>      	}
>>>>>>>>      	if (ret)
>>>>>>>>      		goto err;
>>>>>>>> @@ -436,6 +440,14 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
>>>>>>>>      	if (ret)
>>>>>>>>      		goto err_unpin;
>>>>>>>>      
>>>>>>>> +	/*
>>>>>>>> +	 * Force flush frame buffer data for non-coherent display access when
>>>>>>>> +	 * AuxCCS formats are used.
>>>>>>>> +	 */
>>>>>>>> +	if (first_pin && !xe_bo_is_vram(bo) && !xe_bo_is_stolen(bo) &&
>>>>>>>> +	    intel_fb_is_ccs_modifier(fb->base.modifier))
>>>>>>>> +		drm_clflush_sg(xe_bo_sg(bo));
>>>>>>>
>>>>>>> You still haven't found the actual bug that causes the dirty cache?
>>>>>>
>>>>>> Sadly no. I cross referenced everything numerous times, including
>>>>>> workarounds, tried pretty much 1:1 i915 vs xe ring buffer programming,
>>>>>> but this extra flush always remains required. I also heard that how
>>>>>> flushing of the aux metadata works isn't documented anywhere and i915
>>>>>> does have this flush, by design or accident I don't know.
>>>>>
>>>>> i915 has the flush for the *whole* bo because it started out as
>>>>> cached. As soon as it undergoes a cached->uncached change (either
>>>>> due to set_caching ioctl or becoming a display scanout buffer) we
>>>>> clflush it and switch the GPU page tables from WB to UC. After
>>>>> that the bo stays uncached, and will need no further clflushes,
>>>>> assuming that everyone follows the rules:
>>>>>
>>>>> - CPU accesses via a WB mapping to an uncached bo will explicitly
>>>>>      clflush before (invalidate) and after (write-back) the access
>>>>> - userspace always sets the GPU to use use "consult the PTE" MOCS
>>>>>      setting for any potential scanout buffer. That way the GPU will
>>>>>      use WB as long as the bo is cached, and once it becomes
>>>>>      uncached the GPU also switches to UC accesses
>>>>>
>>>>> With xe I presume the BO should already start out as UC/WC with
>>>>> clean caches, and nothing should be dirtying the caches unless
>>>>> there is a real bug somewhere.
>>>>
>>>> Correct, it is all WC and MOCS are correctly set as WC.
>>>>
>>>> For example for the media compression flavour that was broken and needed
>>>> fixing in b412b144685f ("lib/intel/veboxcopy: Respect buffer MOCS
>>>> index"). (For the render compression flavour MOCS was already correct.)
>>>> But MOCS is not enough on its own for some reason.
>>>>
>>>> I also looked into the rendercopy surface state programming and that too
>>>> looks okay. In fact it is possible to see how using the wrong MOCS makes
>>>> things worse. But it also appears the surface state MOCS only applies to
>>>> the main surface, while the aux state is the one which appears to
>>>> contain cached/unflushed data.
>>>
>>> Are you saying that if you start scanning out a compressed buffer,
>>> then clean the caches, and then do frontbuffer rendering you get
>>> more cache dirt?
>>
>> Render with the GPU or CPU? Do you know of any tests or userspaces which
>> do that?
> 
> On the GPU.
> 
> Can't think of anything nice off the top of my head.
> 
> I'd probably just write a quick igt:
> 1. create a compressed fb
> 2. flip to it
> 3. manually clflush the whole thing to be sure it's clean
> 4. rendercopy some junk around, and keep an eye out for cache dirt

Looks the same dirt on i915 and xe, which would support the theory that 
MOCS settings do not apply to the aux surface.

If you look at these videos frame by frame you can see it:

https://people.igalia.com/tursulin/i915-ccs-cache-dirt.MOV
https://people.igalia.com/tursulin/xe-ccs-cache-dirt.MOV

Test "rendercopies" a square once a second so look just as each is 
appearing.

This is the test code if you are curious:

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index f42f3791780f..03ede3a6fa20 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2859,6 +2859,49 @@ static void copy_with_engine(struct 
fb_blit_upload *blit,
  	fini_buf(src);
  }

+static struct intel_buf *
+__create_buf(int fd,
+	     struct buf_ops *bops,
+	     const struct igt_fb *fb,
+	     const char *name)
+{
+	return igt_fb_create_intel_buf(fd, bops, fb, name);
+}
+
+void intel_fb_engine_blit(int fd,
+			  struct intel_bb *ibb,
+			  struct buf_ops *bops,
+			  const struct igt_fb *dst_fb,
+			  uint32_t dst_x, uint32_t dst_y,
+			  const struct igt_fb *src_fb,
+			  uint32_t src_x, uint32_t src_y,
+			  uint32_t width, uint32_t height)
+{
+	igt_render_copyfunc_t render_copy;
+	struct intel_buf *src, *dst;
+
+	igt_require(!use_vebox_copy(src_fb, dst_fb));
+
+	render_copy = igt_get_render_copyfunc(fd);
+	igt_require(render_copy);
+
+	igt_assert_eq(dst_fb->offsets[0], 0);
+	igt_assert_eq(src_fb->offsets[0], 0);
+
+	src = __create_buf(fd, bops, src_fb, "cairo enginecopy src");
+	dst = __create_buf(fd, bops, dst_fb, "cairo enginecopy dst");
+
+	render_copy(ibb,
+		    src,
+		    src_x, src_y,
+		    width, height,
+		    dst,
+		    dst_x, dst_y);
+
+	fini_buf(dst);
+	fini_buf(src);
+}
+
  static struct blt_copy_object *allocate_and_initialize_blt(const 
struct igt_fb *fb,
  							   uint32_t handle,
  							   uint32_t memregion,
diff --git a/lib/igt_fb.h b/lib/igt_fb.h
index d5aa1e88ad5d..b90b6bbd2032 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -236,5 +236,16 @@ int igt_fill_cts_color_square_framebuffer(uint32_t 
*pixmap,
  int igt_fb_get_fnv1a_crc(struct igt_fb *fb, igt_crc_t *crc);
  const char *igt_fb_modifier_name(uint64_t modifier);

+struct intel_bb;
+
+void intel_fb_engine_blit(int fd,
+			  struct intel_bb *ibb,
+			  struct buf_ops *bops,
+			  const struct igt_fb *dst_fb,
+			  uint32_t dst_x, uint32_t dst_y,
+			  const struct igt_fb *src_fb,
+			  uint32_t src_x, uint32_t src_y,
+			  uint32_t width, uint32_t height);
+
  #endif /* __IGT_FB_H__ */

diff --git a/tests/intel/kms_flip_tiling.c b/tests/intel/kms_flip_tiling.c
index ff9ad1229748..767c8051c85f 100644
--- a/tests/intel/kms_flip_tiling.c
+++ b/tests/intel/kms_flip_tiling.c
@@ -158,6 +158,92 @@ test_flip_tiling(data_t *data, enum pipe pipe, 
igt_output_t *output, uint64_t mo
  	igt_remove_fb(data->drm_fd, &data->old_fb[1]);
  }

+static void
+test_frontbuffer(data_t *data, enum pipe pipe, igt_output_t *output, 
uint64_t modifier[2])
+{
+	struct intel_bb *batch;
+	drmModeModeInfo *mode;
+	struct buf_ops *bops;
+	igt_plane_t *primary;
+	int fb_id;
+
+	memcpy(&data->old_fb, &data->fb, sizeof(data->fb));
+
+	bops = buf_ops_create(data->drm_fd);
+
+	mode = igt_output_get_mode(output);
+
+	primary = igt_output_get_plane(output, 0);
+
+	fb_id = igt_create_pattern_fb(data->drm_fd,
+				      mode->hdisplay, mode->vdisplay,
+				      data->testformat, modifier[0],
+				      &data->fb[0]);
+	igt_assert(fb_id);
+
+	fb_id = igt_create_color_pattern_fb(data->drm_fd,
+					    mode->hdisplay, mode->vdisplay,
+					    data->testformat, modifier[1],
+					    0.5, 0.5, 0.5, &data->fb[1]);
+	igt_assert(fb_id);
+
+	igt_plane_set_fb(primary, &data->fb[0]);
+	igt_require_f(try_commit(&data->display) == 0,
+		      "commit failed with " IGT_MODIFIER_FMT "\n",
+		      IGT_MODIFIER_ARGS(modifier[0]));
+
+	igt_until_timeout(60) {
+		const unsigned int w = 256;
+		const unsigned int h = 256;
+		unsigned int x = random() % (mode->hdisplay - w);
+		unsigned int y = random() % (mode->vdisplay - h);
+
+		usleep(1000000);
+
+		batch = intel_bb_create(data->drm_fd, 4096);
+		intel_fb_engine_blit(data->drm_fd,
+				     batch,
+				     bops,
+				     &data->fb[0],
+				     x, y,
+				     &data->fb[1],
+				     x, y,
+				     w, h);
+		intel_bb_destroy(batch);
+#if 0
+		igt_plane_set_fb(primary, &data->fb[1]);
+		igt_require_f(try_commit(&data->display) == 0,
+			      "commit failed with " IGT_MODIFIER_FMT "\n",
+			      IGT_MODIFIER_ARGS(modifier[0]));
+		igt_plane_set_fb(primary, &data->fb[0]);
+		igt_require_f(try_commit(&data->display) == 0,
+			      "commit failed with " IGT_MODIFIER_FMT "\n",
+			      IGT_MODIFIER_ARGS(modifier[0]));
+#endif
+	}
+
+	printf("press any key\n");
+	getchar();
+
+	igt_plane_set_fb(primary, &data->fb[1]);
+	igt_require_f(try_commit(&data->display) == 0,
+		      "commit failed with " IGT_MODIFIER_FMT "\n",
+		      IGT_MODIFIER_ARGS(modifier[0]));
+	igt_plane_set_fb(primary, &data->fb[0]);
+	igt_require_f(try_commit(&data->display) == 0,
+		      "commit failed with " IGT_MODIFIER_FMT "\n",
+		      IGT_MODIFIER_ARGS(modifier[0]));
+
+	printf("press any key\n");
+	getchar();
+
+
+	igt_remove_fb(data->drm_fd, &data->old_fb[0]);
+	igt_remove_fb(data->drm_fd, &data->old_fb[1]);
+
+	buf_ops_destroy(bops);
+}
+
  static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t 
*output)
  {
  	igt_plane_t *primary;
@@ -257,6 +343,49 @@ igt_main
  		}
  	}

+	igt_subtest_with_dynamic("frontbuffer-rendering") {
+		enum pipe pipe;
+
+		for_each_pipe_with_valid_output(&data.display, pipe, output) {
+			igt_plane_t *plane;
+
+			igt_display_reset(&data.display);
+			pipe_crc_free(&data);
+
+			igt_output_set_pipe(output, pipe);
+			if (!intel_pipe_output_combo_valid(&data.display))
+				continue;
+
+			plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+
+			for (int i = 0; i < plane->format_mod_count; i++) {
+				if (plane->formats[i] != data.testformat)
+					continue;
+
+				for (int j = 0; j < plane->format_mod_count; j++) {
+					uint64_t modifier[2] = {
+						plane->modifiers[i],
+						plane->modifiers[j],
+					};
+
+					if (plane->formats[j] != data.testformat)
+						continue;
+
+					igt_dynamic_f("frontbuffer-%s-%s-%s-to-%s",
+						      kmstest_pipe_name(pipe),
+						      igt_output_name(output),
+						      igt_fb_modifier_name(modifier[0]),
+						      igt_fb_modifier_name(modifier[1]))
+						test_frontbuffer(&data, pipe, output, modifier);
+
+					if (data.flipevent_in_queue)
+						handle_lost_event(&data);
+				}
+			}
+			test_cleanup(&data, pipe, output);
+		}
+	}
+
  	igt_fixture {
  		igt_display_fini(&data.display);
  		drm_close_driver(data.drm_fd);


Run it for example like this:

sudo tests/kms_flip_tiling --dynamic-subtest 
frontbuffer-A-eDP-1-y-rc-ccs-to-y-rc-ccs

Regards,

Tvrtko

