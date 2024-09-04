Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE930CD3431
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 10:28:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBF6D10E749;
	Wed,  4 Sep 2024 10:28:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="RWGqDc1L";
	dkim-atps=neutral
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 340FE10E749
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 10:28:51 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-42bbe908380so41025945e9.2
 for <intel-xe@lists.freedesktop.org>; Wed, 04 Sep 2024 03:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1725445729; x=1726050529; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zPJiFAcl5x5vycVvyRldxs9lOdY8OZh4Vl0gB8H8YYc=;
 b=RWGqDc1LgaseotVquK05tzSP1BuDLstDng6HwRo8E1q61n90B5TIz6CsOuWEo7+hEW
 usRLvDM7s8kZti0NQ5vepkYNlepvAVBgLaBFYGo+vqqI73mzP9YYpap+9qfGe39pF5lc
 T2aDFNcKpdH3++myxaGTM0k+bzJcecZSmORps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725445729; x=1726050529;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zPJiFAcl5x5vycVvyRldxs9lOdY8OZh4Vl0gB8H8YYc=;
 b=wmajUAoDbQ9GtG6HhWWnbY0svxVwiDBQ7T59Hq16A/XwT8Cla3JdDS7K5Eci3YUVr2
 u+mD/0P2g3xmJZ/LfMMv8MVtTbqMBEdLo01oYHmTQ4RWvWPjTqVX2qQJueGchE3EBMcv
 WMZZ2fnJzShvVy1XJdO9XiF4WRnSy7bIBk1R5BOESVnJV8BNJOQZO4ZwQxjdv+q9libC
 MDj6oBnPDrsplCjoRXqDN7FdeaX9walizc8SdJUxIPQxWN7uKO7kIYibQTFDYESbymQs
 gFUBi9en1x16BgIoiksAXlKTjOWWWBxzzmL4pArPLUgdCINQJbwCzPcU6FUKnQf+Ve/e
 Qvog==
X-Gm-Message-State: AOJu0YxqlR0DvivU/eYyCoVRPjGODTO0Zu2umm7xkI7umwjR3llNDD3J
 BCKxEnThQmnqKuZMRahOtSra5KL6ys+/6W9u4+S6TNGqkeGT0tihRQO4BzklTi5DtUymvUd+Iqq
 d
X-Google-Smtp-Source: AGHT+IGIiHLbuqisDkM97dN/kO3RwvYJ7xoN8RkHVvDfxohgC7ZF5Z1qXot0l6Xp9x+OT3Xg+QCTPw==
X-Received: by 2002:a05:600c:5124:b0:42a:a70e:30fb with SMTP id
 5b1f17b1804b1-42bdc633480mr112277245e9.15.1725445729296; 
 Wed, 04 Sep 2024 03:28:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6df0a4dsm198550895e9.12.2024.09.04.03.28.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 03:28:48 -0700 (PDT)
Date: Wed, 4 Sep 2024 12:28:47 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [Intel-xe] [PATCH v2 3/3] drm/xe: Avoid any races around
 ccs_mode update
Message-ID: <Ztg2X0CpZockAe9w@phenom.ffwll.local>
References: <20231129025716.9094-1-niranjana.vishwanathapura@intel.com>
 <20231129025716.9094-4-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129025716.9094-4-niranjana.vishwanathapura@intel.com>
X-Operating-System: Linux phenom 6.9.12-amd64 
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

On Tue, Nov 28, 2023 at 06:57:16PM -0800, Niranjana Vishwanathapura wrote:
> Ensure that there are no drm clients when changing CCS mode.
> Allow exec_queue creation only with enabled CCS engines.
> 
> v2: Rebase
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c       |  9 +++++++++
>  drivers/gpu/drm/xe/xe_device_types.h |  9 +++++++++
>  drivers/gpu/drm/xe/xe_gt_ccs_mode.c  | 10 ++++++++++
>  3 files changed, 28 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 54202623e255..c7134d377b4c 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -72,6 +72,10 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>  	mutex_init(&xef->exec_queue.lock);
>  	xa_init_flags(&xef->exec_queue.xa, XA_FLAGS_ALLOC1);
>  
> +	spin_lock(&xe->clients.lock);
> +	xe->clients.count++;
> +	spin_unlock(&xe->clients.lock);
> +
>  	file->driver_priv = xef;
>  	return 0;
>  }
> @@ -104,6 +108,10 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>  	xa_destroy(&xef->vm.xa);
>  	mutex_destroy(&xef->vm.lock);
>  
> +	spin_lock(&xe->clients.lock);
> +	xe->clients.count--;
> +	spin_unlock(&xe->clients.lock);
> +
>  	xe_drm_client_put(xef->client);
>  	kfree(xef);
>  }
> @@ -226,6 +234,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  	xe->info.force_execlist = xe_modparam.force_execlist;
>  
>  	spin_lock_init(&xe->irq.lock);
> +	spin_lock_init(&xe->clients.lock);
>  
>  	init_waitqueue_head(&xe->ufence_wq);
>  
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 2712905c7a91..12cb1caacda8 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -306,6 +306,15 @@ struct xe_device {
>  		enum xe_sriov_mode __mode;
>  	} sriov;
>  
> +	/** @clients: drm clients info */
> +	struct {
> +		/** @lock: Protects drm clients info */
> +		spinlock_t lock;
> +
> +		/** @count: number of drm clients */
> +		u64 count;
> +	} clients;
> +
>  	/** @usm: unified memory state */
>  	struct {
>  		/** @asid: convert a ASID to VM */
> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> index 0ad97383aedd..303ffb0761d8 100644
> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> @@ -90,6 +90,7 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>  	       const char *buff, size_t count)
>  {
>  	struct xe_gt *gt = kobj_to_gt(&kdev->kobj);
> +	struct xe_device *xe = gt_to_xe(gt);
>  	u32 num_engines, num_slices;
>  	int ret;
>  
> @@ -108,12 +109,21 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>  		return -EINVAL;
>  	}
>  
> +	/* CCS mode can only be updated when there are no drm clients */
> +	spin_lock(&xe->clients.lock);
> +	if (xe->clients.count) {
> +		spin_unlock(&xe->clients.lock);
> +		return -EBUSY;
> +	}
> +
>  	if (gt->ccs_mode.num_engines != num_engines) {
>  		xe_gt_info(gt, "Setting compute mode to %d\n", num_engines);
>  		gt->ccs_mode.num_engines = num_engines;
>  		xe_gt_reset_async(gt);
>  	}
>  
> +	spin_unlock(&xe->clients.lock);

I pinged Rodrigo on #xe irc, but I think better I also drop this in a mail
reply. I think the patch doesn't yet reach it's goal of closing all races
here:

- xe_gt_reset_async() doesn't schedule a reset if there's one pending, so
  I htink you have a race here where you want a function that waits for
  any pending reset to finish, and _then_ issues a new one.

- The reset code does not have any protection around reading ->ccs_mode,
  so might get different values at different times. That's no good. You
  need to make sure you're only reading this once, and then using it
  everywhere. Simplest fix would be a gt->ccs_mode.num_engines_stage,
  which you WRITE_ONCE here, and then at the top of the reset code you do

	gt->ccs_mode.num_engines = READ_ONCE(gt->ccs_mode.num_engines_stage);

  But if you go with this you need to wait for the reset to finish while
  holding the lock or there's new races.

- Because you use the ordered wq there's no need to flush anything that's
  already queued. I think it'd still be good to make sure that drm/sched
  absolutely does not reinsert anything, or some other assert to make sure
  it's all clean would imo be adequate paranoia levels.

- Also for paranoia I'd make this a mutex and just block for the reset to
  finish. It shouldn't cost and it will stop any potential issues if the
  reset is still ongoing. Shouldn't due to the ordered wq, but this is so
  race and fallout hard to catch I think it's better to be absolutely
  safe.

Cheers, Sima

> +
>  	return count;
>  }
>  
> -- 
> 2.21.0.rc0.32.g243a4c7e27
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
