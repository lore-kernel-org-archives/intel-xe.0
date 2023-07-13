Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B12A0C001DC
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 20:08:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B10210E025;
	Thu, 13 Jul 2023 20:08:11 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5697C10E025
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jul 2023 20:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689278889; x=1720814889;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=kijyuCEIMZphdyH3xumyOj1WoLYUdiJZH+wNTcA2uaA=;
 b=W+KOBrbqwBCQD3LOleiVE67vnNvq9MjgTZ5JcsZ/HZWV3Ll04Syf58OG
 //URTJOB503jrG8qZt8oGgw6AqHHOqyh7XjSAfsbIR2Hqz4P5GE2dM0eN
 dg6C6ITZDwdH3QxogCiP1w8oMwr0dlx/tdiqdh5la2wljxNB/uPsRe3Wl
 BpgHTJOZZZ0UJ1WLqSAz1duDEm7VGI5+OXy7pom/VE0thIn4fecfzNMo3
 cmfpbwg9RP6gPfROJuX45UQce6zmkb5QvCU1nTIZlb0+FKfDE0AX+4TJe
 RukH+KRMeFUwVeqfALT7vqX10SWXIw+waqehLsNZB6G706LN6BzrJRx0B w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="364178080"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="364178080"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 13:08:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="787593364"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="787593364"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga008.fm.intel.com with SMTP; 13 Jul 2023 13:08:05 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 13 Jul 2023 23:08:04 +0300
Date: Thu, 13 Jul 2023 23:08:04 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jouni =?iso-8859-1?Q?H=F6gander?= <jouni.hogander@intel.com>
Message-ID: <ZLBZpHgWf1eH_RGV@intel.com>
References: <20230510121152.736148-1-jouni.hogander@intel.com>
 <20230510121152.736148-23-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230510121152.736148-23-jouni.hogander@intel.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-xe] [RFC PATCH v2 22/23] drm/i915: Handle dma fences in
 dirtyfb callback
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
Cc: jani.nikula@intel.com, rodrigo.vivi@kernel.org,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, May 10, 2023 at 03:11:51PM +0300, Jouni Högander wrote:
> Take into account dma fences in dirtyfb callback. If there is no
> unsignaled dma fences perform flush immediately. If there are
> unsignaled dma fences perform invalidate and add callback which will
> queue flush when the fence gets signaled.
> 
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_fb.c | 55 +++++++++++++++++++++++--
>  1 file changed, 52 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
> index fa4464d433b7..fc325f2299a4 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb.c
> +++ b/drivers/gpu/drm/i915/display/intel_fb.c
> @@ -8,6 +8,9 @@
>  #include <drm/drm_framebuffer.h>
>  #include <drm/drm_modeset_helper.h>
>  
> +#include <linux/dma-fence.h>
> +#include <linux/dma-resv.h>
> +
>  #include "i915_drv.h"
>  #include "intel_display.h"
>  #include "intel_display_types.h"
> @@ -1888,6 +1891,20 @@ static int intel_user_framebuffer_create_handle(struct drm_framebuffer *fb,
>  }
>  
>  #ifdef I915
> +struct frontbuffer_fence_cb {
> +	struct dma_fence_cb base;
> +	struct intel_frontbuffer *front;
> +};
> +
> +static void intel_user_framebuffer_fence_wake(struct dma_fence *dma,
> +					      struct dma_fence_cb *data)
> +{
> +	struct frontbuffer_fence_cb *cb = container_of(data, typeof(*cb), base);
> +
> +	intel_frontbuffer_queue_flush(cb->front);
> +	kfree(cb);
> +}
> +
>  static int intel_user_framebuffer_dirty(struct drm_framebuffer *fb,
>  					struct drm_file *file,
>  					unsigned int flags, unsigned int color,
> @@ -1895,11 +1912,43 @@ static int intel_user_framebuffer_dirty(struct drm_framebuffer *fb,
>  					unsigned int num_clips)
>  {
>  	struct drm_i915_gem_object *obj = intel_fb_obj(fb);
> +	struct intel_frontbuffer *front = to_intel_frontbuffer(fb);
> +	struct dma_resv_iter cursor;
> +	struct dma_fence *fence;
> +	int ret;
> +
> +	if (dma_resv_test_signaled(intel_bo_to_drm_bo(obj).resv, dma_resv_usage_rw(false))) {
> +		intel_bo_flush_if_display(obj);
> +		intel_frontbuffer_flush(front, ORIGIN_DIRTYFB);
> +		return 0;
> +	}
>  
> -	intel_bo_flush_if_display(obj);
> -	intel_frontbuffer_flush(to_intel_frontbuffer(fb), ORIGIN_DIRTYFB);
> +	intel_frontbuffer_invalidate(front, ORIGIN_DIRTYFB);
>  
> -	return 0;
> +	dma_resv_iter_begin(&cursor, intel_bo_to_drm_bo(obj).resv,
> +			    dma_resv_usage_rw(false));
> +	dma_resv_for_each_fence_unlocked(&cursor, fence) {
> +		struct frontbuffer_fence_cb *cb =
> +			kmalloc(sizeof(struct frontbuffer_fence_cb), GFP_KERNEL);
> +		if (!cb) {
> +			ret = -ENOMEM;
> +			break;
> +		}
> +		cb->front = front;
> +
> +		ret = dma_fence_add_callback(fence, &cb->base,
> +					     intel_user_framebuffer_fence_wake);
> +		if (ret) {
> +			intel_user_framebuffer_fence_wake(fence, &cb->base);
> +			if (ret == -ENOENT)
> +				ret = 0;
> +			else
> +				break;
> +		}
> +	}
> +	dma_resv_iter_end(&cursor);

AFAICS we could use dma_resv_get_singleton() here to get just a
single callback once all the included fences have signalled. It
might also reduce the amount of kmallocs() a bit, though
dma_resv_get_singleton() does seem to end up doing multiple
allocations as well, but perhaps it could be optimized further.

The other thing dma_resv_get_singleton() does is is reference
counting of the fences. But I'm not sure that's needed here.
Ie. I'm not sure what the lifetime rules are.


I was also pondering what kind of scenarios we might hit here that might
be a bit problematic. This is what I came up with:

* scenario 1:

 flip(PLANE A):
  -> FB A.bits=PLANE A
 set fence(FB A):
  -> FB A.fence = fence 1
 dirtyfb(FB A):
  -> fence 1 !signalled -> invalidate FB A.bits==PLANE A
  -> fence 1 queue cb
 flip(PLANE A):
  -> FB A.bits = 0
  -> FB B.bits = PLANE A
 fence 1 cb -> flush FB A.bits=0

 In the end tracking is left in invalidated state, at least for
 FBC AFAICS. Possible fix would be to clear FBC busy_bits on flip [1]?
 DRRS is fine I think since every flip already clears busy_bits.
 Not sure what PSR does.


[1]
@@ -1299,11 +1299,9 @@ static void __intel_fbc_post_update(struct intel_fbc *fbc)
        lockdep_assert_held(&fbc->lock);

        fbc->flip_pending = false;
+       fbc->busy_bits = 0;

-       if (!fbc->busy_bits)
-               intel_fbc_activate(fbc);
-       else
-               intel_fbc_deactivate(fbc, "frontbuffer write");
+       intel_fbc_activate(fbc);
 }


* scenario 2:

 flip(PLANE A):
  -> FB A.bits=PLANE A
 set fence(FB A):
  -> FB A.fence = fence 1
 dirtyfb(FB A):
  -> fence 1 !signalled -> invalidate FB A.bits==PLANE A
  -> fence 1 queue cb
 set fence(FB A):
  -> FB A.fence = fence 2
 dirtyfb(FB A):
  -> fence 2 !signalled -> invalidate FB A.bits==PLANE A
  -> fence 2 queue cb
 fence 1 cb -> flush FB A.bits==PLANE A
  -> frontbuffer tracking flushed before fence 2 has signalled
 ...
 fence 2 cb -> flush FB A.bits==PLANE A

 Perhaps we should keep track of how many fences are actually pending,
 and only do the frontbuffer flush when the count drops to zero?
 OTOH the final flush should still guarantee some kind of correctness
 in the end, so not sure this is really a big problem.

> +
> +	return ret;
>  }
>  #endif
>  
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
