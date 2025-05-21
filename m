Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A81B4C54E65
	for <intel-xe@archiver.kernel.org>; Wed, 21 May 2025 07:49:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59CEB89954;
	Wed, 21 May 2025 07:49:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="u4mG0xFG";
	dkim-atps=neutral
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A327210E6AE
 for <intel-xe@lists.freedesktop.org>; Wed, 21 May 2025 07:49:24 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3a363ccac20so4026308f8f.2
 for <intel-xe@lists.freedesktop.org>; Wed, 21 May 2025 00:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1747813763; x=1748418563;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DUIZb4bBTIya3zNe6MDht06hGXW80HHdX4W0ZRMtBIg=;
 b=u4mG0xFGEAw6F4IQciMfwm+4lL79JtuFCbul4Em9le8+ZBHs4Qh5JOTvTj1ZlUkI8e
 9zyY6Ggc3Y+MNtK6bFgpLc0C+wHaZWPoiLHdj0sI5rbhm7kOQsWHHitxWaGld4HwHV+p
 gXFNidjGNQb8FCaDRFKsatSZbp2TJj1KcUG/EfPlRgfl9N62lNjv2gnXAkQ8lTzJoovS
 c0SIBwzPT8w7OOKbXlTveGj/Rb0Mwh10qrED+w5Loxka3ygovwd1kWlZT3enI4J1xUqt
 28LFino/Gayse7rK8c8ryDilf51ZXY1dI12ABFORYYHVCYf4vyw/hJuRE2nRoV32i+7t
 iaWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747813763; x=1748418563;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DUIZb4bBTIya3zNe6MDht06hGXW80HHdX4W0ZRMtBIg=;
 b=jnY9QRIY8j0v6cRa6vrsn/oog4HyLXO/bLBV6kkrPcxLzd7I5D/OhJ4uZP5ZGpaX+M
 7D/cp0tdDiWp6lxFVnIHwyO6w25N3wvfSJutH0HpQ3FLdB8xoRmmqaW1scq/KKHVvVZL
 WOs4FXJ8/08RE4U8mt1s5gY/ccPvri71GEwq6qKhtoWdfGeWyq5GhGHVFb3J3D9YESuH
 OTAnCKQJwdwTgbUufjZFY4RTHqVn20O6E3FCdus9LKwctalqlX0dzOntbPeF3eC5+SQg
 WqAcgcdBGHy1pYnePHulVUvszmP8bdfFKoMsodmaQZui+yvKomTNWrGEtre9v2LfVw0L
 fl+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTBbRmK2q1NdwqPBjDYJ/xCgycG98DXgjIhvusDAdps1OsMU5k6eaq2IJLUW0XqhEvFP8bhjQ0Ug==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRXoR9xe1KB7rpownPD0/Eiy7oMz8Xpx/e8YisSezS3cYitLDR
 ysG3NXsPyU+s/jkrretArQQ3tUznp4/zi4E2o9JwyEHCqLftC4gcSebJbmkqpokkPyg=
X-Gm-Gg: ASbGncv1CM4WnSssnPC3s5LpOUwBmE8LMqrqEMUS19LDIFAn9IURp75hSvE2YaxjHbz
 c7MGsDjno70/8yMzIzQzyAUxIvSosB66mslDMnCIrfwZDYgZvJEzwQyYZtsOASRGUrT7pn9LMma
 VpJGTNS7dYgz9E3fwxcR0vfvWcvjXGKMmjPzu6mf28+cj/dZ2TTh5Xn2ZuPL5e13KSkom4NUTyi
 oT4Ti2X9CsQAcArjTRfUZzFHaYURmjKrcuULPalouD1xZZ2wym5PBQyr3qUPnuC9ZYKeZzevnCs
 rNlN8Z0jfQjevcvfN0GA4piu/4BCC/lsO1xYL8a3gNBXV8rAKVYfntT9mOOGQTvKsA==
X-Google-Smtp-Source: AGHT+IFTfvSfNjVjugzipAwZTsPDAnIocx+zpagK1U3o0pkLG0kFRIQS1Nj5+rgQMHjPeO2TrMsPGA==
X-Received: by 2002:a05:6000:420c:b0:3a3:7709:3038 with SMTP id
 ffacd0b85a97d-3a3770931fdmr6643161f8f.38.1747813762906; 
 Wed, 21 May 2025 00:49:22 -0700 (PDT)
Received: from [192.168.0.101] ([81.79.92.254])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca4d310sm19027003f8f.17.2025.05.21.00.49.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 May 2025 00:49:22 -0700 (PDT)
Message-ID: <91fd0d47-d875-4433-b0df-b27180b9423d@ursulin.net>
Date: Wed, 21 May 2025 08:49:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/bo: add GPU memory trace points
To: Juston Li <justonli@chromium.org>, intel-xe@lists.freedesktop.org
Cc: tvrtko.ursulin@igalia.com, zzyiwei@google.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250520171650.771258-1-justonli@chromium.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250520171650.771258-1-justonli@chromium.org>
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


On 20/05/2025 18:16, Juston Li wrote:
> Add tracepoints behind CONFIG_DRM_XE_GPU_MEM_TRACEPOINTS for tracking
> global and per-process GPU memory usage.
> 
> These are required by VSR on Android 12+ for reporting GPU driver memory
> allocations.

+ Maintainers

For reference, this is equivalent to 204226de27c3 ("drm/msm: Add GPU 
memory traces") and uses the same shared tracepoints and format.

Two small details below, with which fixed:

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

> Signed-off-by: Juston Li <justonli@chromium.org>
> ---
>   drivers/gpu/drm/xe/Kconfig.debug     | 12 +++++++
>   drivers/gpu/drm/xe/xe_bo.c           | 47 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_device_types.h | 15 +++++++++
>   3 files changed, 74 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
> index 01735c6ece8ba..e2ecc6df954ce 100644
> --- a/drivers/gpu/drm/xe/Kconfig.debug
> +++ b/drivers/gpu/drm/xe/Kconfig.debug
> @@ -111,3 +111,15 @@ config DRM_XE_USERPTR_INVAL_INJECT
>   
>   	 Recommended for driver developers only.
>   	 If in doubt, say "N".
> +
> +config CONFIG_DRM_XE_GPU_MEM_TRACEPOINTS
> +	bool "Enable Xe GPU memory usage tracepoints"
> +	default n
> +	select TRACE_GPU_MEM
> +	help
> +	  Choose this option to enable tracepoints for tracking
> +	  and per-process GPU memory usage.

Missing word:

..*global* and per-process..

> +	  Intended for performance profiling and required for
> +	  Android.
> +
> +	  If in doubt, say "N".
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index d99d91fe8aa98..f137d6ec5357d 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -19,6 +19,8 @@
>   
>   #include <kunit/static_stub.h>
>   
> +#include <trace/events/gpu_mem.h>
> +
>   #include "xe_device.h"
>   #include "xe_dma_buf.h"
>   #include "xe_drm_client.h"
> @@ -420,6 +422,35 @@ static void xe_ttm_tt_account_subtract(struct ttm_tt *tt)
>   		xe_shrinker_mod_pages(xe_tt->xe->mem.shrinker, -(long)tt->num_pages, 0);
>   }
>   
> +#if IS_ENABLED(CONFIG_DRM_XE_GPU_MEM_TRACEPOINTS)
> +static void update_global_total_pages(struct ttm_device *ttm_dev, long num_pages)
> +{
> +	struct xe_device *xe = ttm_to_xe_device(ttm_dev);
> +	uint64_t global_total_pages =
> +		atomic64_add_return(num_pages, &xe->global_total_pages);

Checkpatch reminds kernel should use u64 type. Here and one more just below.

Regards,

Tvrtko

> +
> +	trace_gpu_mem_total(0, 0, global_total_pages << PAGE_SHIFT);
> +}
> +
> +static void update_process_mem(struct drm_file *file, ssize_t size)
> +{
> +	struct xe_file *xef = to_xe_file(file);
> +	uint64_t process_mem = atomic64_add_return(size, &xef->process_mem);
> +
> +	rcu_read_lock(); /* Locks file->pid! */
> +	trace_gpu_mem_total(0, pid_nr(rcu_dereference(file->pid)), process_mem);
> +	rcu_read_unlock();
> +}
> +#else
> +static inline void update_global_total_pages(struct ttm_device *ttm_dev, long num_pages)
> +{
> +}
> +
> +static inline void update_process_mem(struct drm_file *file, ssize_t size)
> +{
> +}
> +#endif
> +
>   static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
>   				       u32 page_flags)
>   {
> @@ -528,6 +559,7 @@ static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct ttm_tt *tt,
>   
>   	xe_tt->purgeable = false;
>   	xe_ttm_tt_account_add(tt);
> +	update_global_total_pages(ttm_dev, tt->num_pages);
>   
>   	return 0;
>   }
> @@ -542,6 +574,7 @@ static void xe_ttm_tt_unpopulate(struct ttm_device *ttm_dev, struct ttm_tt *tt)
>   
>   	ttm_pool_free(&ttm_dev->pool, tt);
>   	xe_ttm_tt_account_subtract(tt);
> +	update_global_total_pages(ttm_dev, -(long)tt->num_pages);
>   }
>   
>   static void xe_ttm_tt_destroy(struct ttm_device *ttm_dev, struct ttm_tt *tt)
> @@ -1648,6 +1681,15 @@ static void xe_gem_object_free(struct drm_gem_object *obj)
>   	ttm_bo_put(container_of(obj, struct ttm_buffer_object, base));
>   }
>   
> +#if IS_ENABLED(CONFIG_DRM_XE_GPU_MEM_TRACEPOINTS)
> +static int xe_gem_object_open(struct drm_gem_object *obj,
> +			      struct drm_file *file_priv)
> +{
> +	update_process_mem(file_priv, obj->size);
> +	return 0;
> +}
> +#endif
> +
>   static void xe_gem_object_close(struct drm_gem_object *obj,
>   				struct drm_file *file_priv)
>   {
> @@ -1660,6 +1702,8 @@ static void xe_gem_object_close(struct drm_gem_object *obj,
>   		ttm_bo_set_bulk_move(&bo->ttm, NULL);
>   		xe_bo_unlock(bo);
>   	}
> +
> +	update_process_mem(file_priv, -obj->size);
>   }
>   
>   static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
> @@ -1757,6 +1801,9 @@ static const struct vm_operations_struct xe_gem_vm_ops = {
>   
>   static const struct drm_gem_object_funcs xe_gem_object_funcs = {
>   	.free = xe_gem_object_free,
> +#if IS_ENABLED(CONFIG_DRM_XE_GPU_MEM_TRACEPOINTS)
> +	.open = xe_gem_object_open,
> +#endif
>   	.close = xe_gem_object_close,
>   	.mmap = drm_gem_ttm_mmap,
>   	.export = xe_gem_prime_export,
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index f81be293b260e..5fb65f1c64cd6 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -639,6 +639,13 @@ struct xe_device {
>   		unsigned int fsb_freq, mem_freq, is_ddr3;
>   	};
>   #endif
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_GPU_MEM_TRACEPOINTS)
> +	/**
> +	 * @global_mem: global GPU pages usage tracked for gpu_mem tracepoints
> +	 */
> +	atomic64_t global_total_pages;
> +#endif
>   };
>   
>   /**
> @@ -700,6 +707,14 @@ struct xe_file {
>   
>   	/** @refcount: ref count of this xe file */
>   	struct kref refcount;
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_GPU_MEM_TRACEPOINTS)
> +	/**
> +	 * @process_mem: per-process GPU memory usage tracked for gpu_mem
> +	 * tracepoints
> +	 */
> +	atomic64_t process_mem;
> +#endif
>   };
>   
>   #endif

