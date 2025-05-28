Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D418C3ABB2
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 09:22:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A61810E5BB;
	Wed, 28 May 2025 09:22:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Fr0ooEIM";
	dkim-atps=neutral
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E04610E5D1
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 09:22:14 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3a4d33f971aso2547287f8f.1
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 02:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1748424133; x=1749028933; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zO+owTbI7AwSyY1EJNJe4E1/RlH7PIREOgvq6bjCeoE=;
 b=Fr0ooEIMGE3JiMgzbGam57FKJpBv3X9kZdC7s6Z54BXSrX0wE94/UIQWmbd8NRgxDm
 +kqawRvX8DH4Nxfxrd6kOQOzgAgOxcAUibKB+B/O+73EQaR6OD+WnK/uGd/GWnG6YXWY
 yJP9OYJsYYGcstNM2AT5yED3euaU0Hu+BKet8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748424133; x=1749028933;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zO+owTbI7AwSyY1EJNJe4E1/RlH7PIREOgvq6bjCeoE=;
 b=qgGbrIhU0gPKvrhPjNwfbB7Tk3LvaZJKwuteMHsUK8QiURVV9Mt7pk2otvGiH+ztg8
 a6gnD10u/+m+5xE8O3h5lDkUB4PicAPdUbYYSk+p1w4lu2kEsyXNzI2odjDSjFCB2AI0
 XznBszVxPdQYlwLgjP145MDkAwhOe8jz/2YKq754vTXKtukjOSvLJ3OZ01I3//tweS5U
 2Zl3H/T3vIK9sktZ724TQPJkYak1pi3IX2/9pJ0nzQVdcCohwBtP7PnwIQXCjhJ9JAyK
 IG6h7WFdVUSN+Hs9VkdVsoBfvniNrqHJkJUahfhYrRlQJy9lTuuoWVKGi/0FiVydpZ/b
 yk7w==
X-Gm-Message-State: AOJu0YyOLGAYIbmDqwyT7pZPzu63pkruNcGKjpiGf7HNQJ/7M0Ka3s0+
 zYnY6mPmCDb/WSECF9cnBWlnx7rLw+E3s/eHcekSFzhrfmvdV6xQRua9aks1a336Oik=
X-Gm-Gg: ASbGncv/U406eEHOdYpfX+jUhhp5wiBAyL2jA/eWfkc1Eyb+j5LrKlsaT2rKsPHEr85
 M1ORfAzSN5vI4Fq+v1fVjNVRsDdwUOGlTF9PV708CLdMLp/HfUItAmcoSA+HIcokfC3PQNqwRRW
 y/nH0N3PQzBEQ9fhXSyuhN/cy5g+gfb70/MdFfO6GjajLnmBwQwvcAqfwWpqQEj69QcvhM11yQ8
 xTRX2fZlDXIGviqCoOaFRffFazdK0zRiO4A43uzmUbCxRkswZXIDGlkiVr+a2Gs1p2KIOJnUY7E
 DNzXF39/c3K0dxngjhhcIAIuSVk9ARmjI3Zp0FBjnDxcKspPMxZDmsZo6OjfKDY/EB4DqoWcDw=
 =
X-Google-Smtp-Source: AGHT+IFHkUgBJ3MDpGmc55Df2jnO4O7GDDWk04es2D4qvl9vkrointO9bgr3vdSybyJfzVBW7+QH2A==
X-Received: by 2002:a05:6000:381:b0:3a4:cfbf:51a0 with SMTP id
 ffacd0b85a97d-3a4e943c6a1mr1299117f8f.21.1748424133000; 
 Wed, 28 May 2025 02:22:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4eace3283sm919873f8f.89.2025.05.28.02.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 02:22:12 -0700 (PDT)
Date: Wed, 28 May 2025 11:22:10 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: intel-xe@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>,
 Rob Clark <robdclark@chromium.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, stable@vger.kernel.org,
 Simona Vetter <simona.vetter@intel.com>
Subject: Re: [PATCH 2/8] drm/fdinfo: Switch to idr_for_each() in
 drm_show_memory_stats()
Message-ID: <aDbVwo6W8zq6H9Qq@phenom.ffwll.local>
References: <20250528091307.1894940-1-simona.vetter@ffwll.ch>
 <20250528091307.1894940-3-simona.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528091307.1894940-3-simona.vetter@ffwll.ch>
X-Operating-System: Linux phenom 6.12.25-amd64 
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

On Wed, May 28, 2025 at 11:13:00AM +0200, Simona Vetter wrote:
> Unlike idr_for_each_entry(), which terminates on the first NULL entry,
> idr_for_each passes them through. This fixes potential issues with the
> idr walk terminating prematurely due to transient NULL entries the
> exist when creating and destroying a handle.
> 
> Note that transient NULL pointers in drm_file.object_idr have been a
> thing since f6cd7daecff5 ("drm: Release driver references to handle
> before making it available again"), this is a really old issue.
> 
> Aside from temporarily inconsistent fdinfo statistic there's no other
> impact of this issue.
> 
> Fixes: 686b21b5f6ca ("drm: Add fdinfo memory stats")
> Cc: Rob Clark <robdclark@chromium.org>
> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: <stable@vger.kernel.org> # v6.5+
> Signed-off-by: Simona Vetter <simona.vetter@intel.com>
> Signed-off-by: Simona Vetter <simona.vetter@ffwll.ch>

Ok I screwed up reading idr_for_each_entry() respectively
idr_get_next_ul() big time, it already copes with NULL entries entirely
fine.

Mea culpa.
-Sima

> ---
>  drivers/gpu/drm/drm_file.c | 95 ++++++++++++++++++++++----------------
>  1 file changed, 55 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 246cf845e2c9..428a4eb85e94 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -892,6 +892,58 @@ void drm_print_memory_stats(struct drm_printer *p,
>  }
>  EXPORT_SYMBOL(drm_print_memory_stats);
>  
> +struct drm_bo_print_data {
> +	struct drm_memory_stats status;
> +	enum drm_gem_object_status supported_status;
> +};
> +
> +static int
> +drm_bo_memory_stats(int id, void *ptr, void *data)
> +{
> +	struct drm_bo_print_data *drm_data;
> +	struct drm_gem_object *obj = ptr;
> +	enum drm_gem_object_status s = 0;
> +	size_t add_size;
> +
> +	if (!obj)
> +		return 0;
> +
> +	add_size = (obj->funcs && obj->funcs->rss) ?
> +		obj->funcs->rss(obj) : obj->size;
> +
> +	if (obj->funcs && obj->funcs->status) {
> +		s = obj->funcs->status(obj);
> +		drm_data->supported_status |= s;
> +	}
> +
> +	if (drm_gem_object_is_shared_for_memory_stats(obj))
> +		drm_data->status.shared += obj->size;
> +	else
> +		drm_data->status.private += obj->size;
> +
> +	if (s & DRM_GEM_OBJECT_RESIDENT) {
> +		drm_data->status.resident += add_size;
> +	} else {
> +		/* If already purged or not yet backed by pages, don't
> +		 * count it as purgeable:
> +		 */
> +		s &= ~DRM_GEM_OBJECT_PURGEABLE;
> +	}
> +
> +	if (!dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(true))) {
> +		drm_data->status.active += add_size;
> +		drm_data->supported_status |= DRM_GEM_OBJECT_ACTIVE;
> +
> +		/* If still active, don't count as purgeable: */
> +		s &= ~DRM_GEM_OBJECT_PURGEABLE;
> +	}
> +
> +	if (s & DRM_GEM_OBJECT_PURGEABLE)
> +		drm_data->status.purgeable += add_size;
> +
> +	return 0;
> +}
> +
>  /**
>   * drm_show_memory_stats - Helper to collect and show standard fdinfo memory stats
>   * @p: the printer to print output to
> @@ -902,50 +954,13 @@ EXPORT_SYMBOL(drm_print_memory_stats);
>   */
>  void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
>  {
> -	struct drm_gem_object *obj;
> -	struct drm_memory_stats status = {};
> -	enum drm_gem_object_status supported_status = 0;
> -	int id;
> +	struct drm_bo_print_data data = {};
>  
>  	spin_lock(&file->table_lock);
> -	idr_for_each_entry (&file->object_idr, obj, id) {
> -		enum drm_gem_object_status s = 0;
> -		size_t add_size = (obj->funcs && obj->funcs->rss) ?
> -			obj->funcs->rss(obj) : obj->size;
> -
> -		if (obj->funcs && obj->funcs->status) {
> -			s = obj->funcs->status(obj);
> -			supported_status |= s;
> -		}
> -
> -		if (drm_gem_object_is_shared_for_memory_stats(obj))
> -			status.shared += obj->size;
> -		else
> -			status.private += obj->size;
> -
> -		if (s & DRM_GEM_OBJECT_RESIDENT) {
> -			status.resident += add_size;
> -		} else {
> -			/* If already purged or not yet backed by pages, don't
> -			 * count it as purgeable:
> -			 */
> -			s &= ~DRM_GEM_OBJECT_PURGEABLE;
> -		}
> -
> -		if (!dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(true))) {
> -			status.active += add_size;
> -			supported_status |= DRM_GEM_OBJECT_ACTIVE;
> -
> -			/* If still active, don't count as purgeable: */
> -			s &= ~DRM_GEM_OBJECT_PURGEABLE;
> -		}
> -
> -		if (s & DRM_GEM_OBJECT_PURGEABLE)
> -			status.purgeable += add_size;
> -	}
> +	idr_for_each(&file->object_idr, &drm_bo_memory_stats, &data);
>  	spin_unlock(&file->table_lock);
>  
> -	drm_print_memory_stats(p, &status, supported_status, "memory");
> +	drm_print_memory_stats(p, &data.status, data.supported_status, "memory");
>  }
>  EXPORT_SYMBOL(drm_show_memory_stats);
>  
> -- 
> 2.49.0
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
