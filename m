Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE477C4345F
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 08:08:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65605112222;
	Mon,  6 May 2024 08:08:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iu3MH4T1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2685112224
 for <intel-xe@lists.freedesktop.org>; Mon,  6 May 2024 08:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714982880; x=1746518880;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=uv+8sT1YcRyGfDDzOH6SzhkW15/Urj/fY3qqiQL1Tgw=;
 b=iu3MH4T1I8cTVz5pz8O18ZVzWIzLH6bf3Lil7L0kqqbLXp+94onmjjU/
 n/s00IdDIDSl3DSDt6IjmlYECBvh9wSZsrAcHF7NRZA5kgQ+vIImNY2p9
 vA6WLfcK50vo17E80rV50Jp8myyXGDvPEUObwL+3qPla9Dh76gnNkfih8
 9ClrpgrnAYep+8uA1JKclJXc/k10B5KF2g90bY1cyG2wgXrjuD4kzh9fO
 7gQKW9vbP97x5C++Fq9usMryDjq5AOexEPLZBjFavz3b4YJaTYFyqyB2e
 974gzA308zdCaoyHxtDvHStJ2BqLenNdzE9NrH0n57GsLvc3VbY+LQ0NZ A==;
X-CSE-ConnectionGUID: 9urVdDx9SPq4aRxnxPwmqA==
X-CSE-MsgGUID: YkovytEtQ2u9X1ZYM6ERTA==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="21330734"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; d="scan'208";a="21330734"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 01:07:59 -0700
X-CSE-ConnectionGUID: WHvnlnxKTRWLW6JxfhBWAQ==
X-CSE-MsgGUID: W498Z1XjQcyjxVdUzf2xlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; d="scan'208";a="28181021"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.246.30.61])
 ([10.246.30.61])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 01:07:58 -0700
Message-ID: <ac4a0c6b-4d87-4bde-b104-be158fa138fc@intel.com>
Date: Mon, 6 May 2024 10:07:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] drm/xe: covert sysfs over to devm
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240429121436.33013-9-matthew.auld@intel.com>
 <20240429121436.33013-10-matthew.auld@intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240429121436.33013-10-matthew.auld@intel.com>
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

On 29.04.2024 14:14, Matthew Auld wrote:
> Hotunplugging the device seems to result in stuff like:
> 
> kobject_add_internal failed for tile0 with -EEXIST, don't try to
> register things with the same name in the same directory.
> 
> We only remove the sysfs as part of drmm, however that is tied to the
> lifetime of the driver instance and not the device underneath. Attempt
> to fix by using devm for all of the remaining sysfs stuff related to the
> device.
> 
> Closes: https://gitlab.freedesktop.org/dt srm/xe/kernel/-/issues/1667
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

As mentioned in prev comment, it could be merged with the prev patch.

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>   drivers/gpu/drm/xe/xe_gt_ccs_mode.c           |  4 ++--
>   drivers/gpu/drm/xe/xe_gt_freq.c               |  4 ++--
>   drivers/gpu/drm/xe/xe_gt_idle.c               |  4 ++--
>   drivers/gpu/drm/xe/xe_gt_sysfs.c              |  4 ++--
>   drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c     |  4 ++--
>   drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 12 ++++++------
>   drivers/gpu/drm/xe/xe_tile_sysfs.c            |  4 ++--
>   drivers/gpu/drm/xe/xe_vram_freq.c             |  4 ++--
>   8 files changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> index 396aeb5b9924..890da8870b0d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> @@ -150,7 +150,7 @@ static const struct attribute *gt_ccs_mode_attrs[] = {
>   	NULL,
>   };
>   
> -static void xe_gt_ccs_mode_sysfs_fini(struct drm_device *drm, void *arg)
> +static void xe_gt_ccs_mode_sysfs_fini(void *arg)
>   {
>   	struct xe_gt *gt = arg;
>   
> @@ -182,5 +182,5 @@ int xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt)
>   	if (err)
>   		return err;
>   
> -	return drmm_add_action_or_reset(&xe->drm, xe_gt_ccs_mode_sysfs_fini, gt);
> +	return devm_add_action_or_reset(xe->drm.dev, xe_gt_ccs_mode_sysfs_fini, gt);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
> index 855de40e40ea..e0305942644c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
> @@ -209,7 +209,7 @@ static const struct attribute *freq_attrs[] = {
>   	NULL
>   };
>   
> -static void freq_fini(struct drm_device *drm, void *arg)
> +static void freq_fini(void *arg)
>   {
>   	struct kobject *kobj = arg;
>   
> @@ -237,7 +237,7 @@ int xe_gt_freq_init(struct xe_gt *gt)
>   	if (!gt->freq)
>   		return -ENOMEM;
>   
> -	err = drmm_add_action_or_reset(&xe->drm, freq_fini, gt->freq);
> +	err = devm_add_action(xe->drm.dev, freq_fini, gt->freq);
>   	if (err)
>   		return err;
>   
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index 8fc0f3f6ecc5..9e907033f32b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -144,7 +144,7 @@ static const struct attribute *gt_idle_attrs[] = {
>   	NULL,
>   };
>   
> -static void gt_idle_sysfs_fini(struct drm_device *drm, void *arg)
> +static void gt_idle_sysfs_fini(void *arg)
>   {
>   	struct kobject *kobj = arg;
>   
> @@ -181,7 +181,7 @@ int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
>   		return err;
>   	}
>   
> -	return drmm_add_action_or_reset(&xe->drm, gt_idle_sysfs_fini, kobj);
> +	return devm_add_action_or_reset(xe->drm.dev, gt_idle_sysfs_fini, kobj);
>   }
>   
>   void xe_gt_idle_enable_c6(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> index 1e5971072bc8..a05c3699e8b9 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> @@ -22,7 +22,7 @@ static const struct kobj_type xe_gt_sysfs_kobj_type = {
>   	.sysfs_ops = &kobj_sysfs_ops,
>   };
>   
> -static void gt_sysfs_fini(struct drm_device *drm, void *arg)
> +static void gt_sysfs_fini(void *arg)
>   {
>   	struct xe_gt *gt = arg;
>   
> @@ -51,5 +51,5 @@ int xe_gt_sysfs_init(struct xe_gt *gt)
>   
>   	gt->sysfs = &kg->base;
>   
> -	return drmm_add_action_or_reset(&xe->drm, gt_sysfs_fini, gt);
> +	return devm_add_action(xe->drm.dev, gt_sysfs_fini, gt);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
> index fbe21a8599ca..c9e04151286d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
> @@ -229,7 +229,7 @@ static const struct attribute_group throttle_group_attrs = {
>   	.attrs = throttle_attrs,
>   };
>   
> -static void gt_throttle_sysfs_fini(struct drm_device *drm, void *arg)
> +static void gt_throttle_sysfs_fini(void *arg)
>   {
>   	struct xe_gt *gt = arg;
>   
> @@ -245,5 +245,5 @@ int xe_gt_throttle_sysfs_init(struct xe_gt *gt)
>   	if (err)
>   		return err;
>   
> -	return drmm_add_action_or_reset(&xe->drm, gt_throttle_sysfs_fini, gt);
> +	return devm_add_action_or_reset(xe->drm.dev, gt_throttle_sysfs_fini, gt);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> index 844ec68cbbb8..258078a6b461 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> @@ -492,7 +492,7 @@ static const struct attribute * const files[] = {
>   	NULL
>   };
>   
> -static void kobj_xe_hw_engine_class_fini(struct drm_device *drm, void *arg)
> +static void kobj_xe_hw_engine_class_fini(void *arg)
>   {
>   	struct kobject *kobj = arg;
>   
> @@ -517,7 +517,7 @@ kobj_xe_hw_engine_class(struct xe_device *xe, struct kobject *parent, const char
>   	}
>   	keclass->xe = xe;
>   
> -	err = drmm_add_action_or_reset(&xe->drm, kobj_xe_hw_engine_class_fini,
> +	err = devm_add_action_or_reset(xe->drm.dev, kobj_xe_hw_engine_class_fini,
>   				       &keclass->base);
>   	if (err)
>   		return NULL;
> @@ -525,7 +525,7 @@ kobj_xe_hw_engine_class(struct xe_device *xe, struct kobject *parent, const char
>   	return keclass;
>   }
>   
> -static void hw_engine_class_defaults_fini(struct drm_device *drm, void *arg)
> +static void hw_engine_class_defaults_fini(void *arg)
>   {
>   	struct kobject *kobj = arg;
>   
> @@ -552,7 +552,7 @@ static int xe_add_hw_engine_class_defaults(struct xe_device *xe,
>   	if (err)
>   		goto err_object;
>   
> -	return drmm_add_action_or_reset(&xe->drm, hw_engine_class_defaults_fini, kobj);
> +	return devm_add_action_or_reset(xe->drm.dev, hw_engine_class_defaults_fini, kobj);
>   
>   err_object:
>   	kobject_put(kobj);
> @@ -611,7 +611,7 @@ static const struct kobj_type xe_hw_engine_sysfs_kobj_type = {
>   	.sysfs_ops = &xe_hw_engine_class_sysfs_ops,
>   };
>   
> -static void hw_engine_class_sysfs_fini(struct drm_device *drm, void *arg)
> +static void hw_engine_class_sysfs_fini(void *arg)
>   {
>   	struct kobject *kobj = arg;
>   
> @@ -698,7 +698,7 @@ int xe_hw_engine_class_sysfs_init(struct xe_gt *gt)
>   			goto err_object;
>   	}
>   
> -	return drmm_add_action_or_reset(&xe->drm, hw_engine_class_sysfs_fini, kobj);
> +	return devm_add_action_or_reset(xe->drm.dev, hw_engine_class_sysfs_fini, kobj);
>   
>   err_object:
>   	kobject_put(kobj);
> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> index 64661403afcd..b804234a6551 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> @@ -22,7 +22,7 @@ static const struct kobj_type xe_tile_sysfs_kobj_type = {
>   	.sysfs_ops = &kobj_sysfs_ops,
>   };
>   
> -static void tile_sysfs_fini(struct drm_device *drm, void *arg)
> +static void tile_sysfs_fini(void *arg)
>   {
>   	struct xe_tile *tile = arg;
>   
> @@ -55,5 +55,5 @@ int xe_tile_sysfs_init(struct xe_tile *tile)
>   	if (err)
>   		return err;
>   
> -	return drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
> +	return devm_add_action_or_reset(xe->drm.dev, tile_sysfs_fini, tile);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_vram_freq.c b/drivers/gpu/drm/xe/xe_vram_freq.c
> index 3e21ddc6e60c..99ff95e408e0 100644
> --- a/drivers/gpu/drm/xe/xe_vram_freq.c
> +++ b/drivers/gpu/drm/xe/xe_vram_freq.c
> @@ -87,7 +87,7 @@ static const struct attribute_group freq_group_attrs = {
>   	.attrs = freq_attrs,
>   };
>   
> -static void vram_freq_sysfs_fini(struct drm_device *drm, void *arg)
> +static void vram_freq_sysfs_fini(void *arg)
>   {
>   	struct kobject *kobj = arg;
>   
> @@ -122,5 +122,5 @@ int xe_vram_freq_sysfs_init(struct xe_tile *tile)
>   		return err;
>   	}
>   
> -	return drmm_add_action_or_reset(&xe->drm, vram_freq_sysfs_fini, kobj);
> +	return devm_add_action_or_reset(xe->drm.dev, vram_freq_sysfs_fini, kobj);
>   }

