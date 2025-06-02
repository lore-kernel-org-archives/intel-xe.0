Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B966DC5B549
	for <intel-xe@archiver.kernel.org>; Mon,  2 Jun 2025 14:46:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E9610E545;
	Mon,  2 Jun 2025 14:46:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="fKsN0rbe";
	dkim-atps=neutral
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C60710E545
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Jun 2025 14:46:05 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3a35c894313so4124668f8f.2
 for <intel-xe@lists.freedesktop.org>; Mon, 02 Jun 2025 07:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1748875564; x=1749480364; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8EMxM7tpyWA0lyd9k41Yq4Dz6TvpMgz4VTQoCcui0Wg=;
 b=fKsN0rbegyFyFvnPIYD3nDtfeCcDzEhnJwozxZTI98pebcX2HavfTGvfPlQaCXiFSz
 Jw1bAiY242TsBL2BoiqYrfDUG+ms2nrUA2KxDLS+7OB+sLB2pwqyW69TG9Obheep9E+8
 UU/Vy+06RA6B7zFhVOhmJ7GwN31e8at5U4LBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748875564; x=1749480364;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8EMxM7tpyWA0lyd9k41Yq4Dz6TvpMgz4VTQoCcui0Wg=;
 b=g3aUSsheP0T3gx9/WKhLeOupRV3ZRs2lgm28mC4GxlHWomUkLx3byLe7hHWG7a/uyT
 spk3XeVnbfAAgzqpT0qLlwm3XLCdfn6ozr5bEdHo/DpfzTy46UmKpN/GXzLIySydq5KN
 T8FIaLnePtHU/vb2ntOi7xLnM71ES+iL68pFr0DIWQyJ6RH2NqMFFgcGxD+HJIoleExs
 b6qljioH6ycaW5msuLPB97vZjz07mZT0wkDGlxPo6rJLd3Wf4ROUACOT5iA4m1LmxJUS
 4HP6aH7SED+K1hJ3bRkAcWqyuzzVvw5Th/cbReFU4EhNB8kKjqHHCfDV4R80t3IKwWSX
 Nvkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMzpUUWPXAJUkiVSwmJVbRxLWpmye4dezZZoqGdpS0aMJH1Tv70CediPBGUwVWo7SI9VX+zfONeg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWvWGWJBVdDleg5Bczc4oMNhWQ8tGOekAox6jNeuEzmfxgqrPE
 +WkiUSqehwIYeAZRN9462P3xofiKZEacZPt5Ue+N3S14oU1TXsDQK+FwfShbaYtIJOQ=
X-Gm-Gg: ASbGncsRHhYSS1W+feFnyKIT/WDe2vK2hwDkT/pYEMb77Kse0punYCw0Ek2EE+BwEdg
 DwYKumWa8A2OPMQ0ZL1lv7wyBlr0tLOckxOVf5trjm+xSDbw9z6uNDZFqD+moztBBQ4tJhpKVMc
 50DhT4kbQcLzEEOHKM0EGZVJNiFufG62z+GxqDfmcB57GnVj4J5Qkb+2xYl0ZL+LVTeqv+UXFOk
 gTiUpIFjCA9P485KlnIGeeS3GyUqniQxtoPQBo6xAgtYZHQI6pQw7ZWUqE/c+HZNWekriYljdeF
 W3h+qEk+SzGN5JD14GXgr2ng5ds/IcRNIOBqeJw9YNAvidZkaZgOkVzm6LavtkhrZLFMdkk14A=
 =
X-Google-Smtp-Source: AGHT+IGum4W1lJaHwGIa42aYpFR40MKqv6scV6QL4i0d4+cg0ds5HiGniHEXQz5DlfGyXRuGOt4XTw==
X-Received: by 2002:a05:6000:2081:b0:3a4:db49:94aa with SMTP id
 ffacd0b85a97d-3a4fe17945bmr6857588f8f.21.1748875563537; 
 Mon, 02 Jun 2025 07:46:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4efe5b7f8sm14865216f8f.3.2025.06.02.07.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 07:46:03 -0700 (PDT)
Date: Mon, 2 Jun 2025 16:46:01 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: =?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 intel-xe@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Simona Vetter <simona.vetter@intel.com>
Subject: Re: [PATCH 3/8] drm/panthor: Fix UAF in
 panthor_gem_create_with_handle() debugfs code
Message-ID: <aD25KVnitkhn6blT@phenom.ffwll.local>
References: <20250528091307.1894940-1-simona.vetter@ffwll.ch>
 <20250528091307.1894940-4-simona.vetter@ffwll.ch>
 <jq6d2nxsp7g6sq2uo4bknqgfod7ssdoqyvtlorpq2xij2ikgjc@6y64ebpjeq7p>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <jq6d2nxsp7g6sq2uo4bknqgfod7ssdoqyvtlorpq2xij2ikgjc@6y64ebpjeq7p>
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

On Sun, Jun 01, 2025 at 03:06:15PM +0100, Adrián Larumbe wrote:
> Hi Simona,
> 
> On 28.05.2025 11:13, Simona Vetter wrote:
> > The object is potentially already gone after the drm_gem_object_put().
> > In general the object should be fully constructed before calling
> > drm_gem_handle_create(), except the debugfs tracking uses a separate
> > lock and list and separate flag to denotate whether the object is
> > actually initilized.
> >
> > Since I'm touching this all anyway simplify this by only adding the
> > object to the debugfs when it's ready for that, which allows us to
> > delete that separate flag. panthor_gem_debugfs_bo_rm() already checks
> > whether we've actually been added to the list or this is some error
> > path cleanup.
> >
> > Fixes: a3707f53eb3f ("drm/panthor: show device-wide list of DRM GEM objects over DebugFS")
> > Cc: Adrián Larumbe <adrian.larumbe@collabora.com>
> > Cc: Boris Brezillon <boris.brezillon@collabora.com>
> > Cc: Steven Price <steven.price@arm.com>
> > Cc: Liviu Dudau <liviu.dudau@arm.com>
> > Signed-off-by: Simona Vetter <simona.vetter@intel.com>
> > Signed-off-by: Simona Vetter <simona.vetter@ffwll.ch>
> > ---
> >  drivers/gpu/drm/panthor/panthor_gem.c | 31 +++++++++++++--------------
> >  drivers/gpu/drm/panthor/panthor_gem.h |  3 ---
> >  2 files changed, 15 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> > index 7c00fd77758b..f334444cb5df 100644
> > --- a/drivers/gpu/drm/panthor/panthor_gem.c
> > +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> > @@ -16,9 +16,11 @@
> >  #include "panthor_mmu.h"
> >
> >  #ifdef CONFIG_DEBUG_FS
> > -static void panthor_gem_debugfs_bo_add(struct panthor_device *ptdev,
> > -				       struct panthor_gem_object *bo)
> > +static void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo)
> >  {
> > +	struct panthor_device *ptdev = container_of(bo->base.base.dev,
> > +						    struct panthor_device, base);
> > +
> >  	INIT_LIST_HEAD(&bo->debugfs.node);
> >
> >  	bo->debugfs.creator.tgid = current->group_leader->pid;
> > @@ -44,12 +46,10 @@ static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo)
> >
> >  static void panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, u32 usage_flags)
> >  {
> > -	bo->debugfs.flags = usage_flags | PANTHOR_DEBUGFS_GEM_USAGE_FLAG_INITIALIZED;
> > +	bo->debugfs.flags = usage_flags;
> > +	panthor_gem_debugfs_bo_add(bo);
> >  }
> >  #else
> > -static void panthor_gem_debugfs_bo_add(struct panthor_device *ptdev,
> > -				       struct panthor_gem_object *bo)
> > -{}
> >  static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo) {}
> >  static void panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, u32 usage_flags) {}
> >  #endif
> > @@ -246,7 +246,7 @@ struct drm_gem_object *panthor_gem_create_object(struct drm_device *ddev, size_t
> >  	drm_gem_gpuva_set_lock(&obj->base.base, &obj->gpuva_list_lock);
> >  	mutex_init(&obj->label.lock);
> >
> > -	panthor_gem_debugfs_bo_add(ptdev, obj);
> > +	INIT_LIST_HEAD(&obj->debugfs.node);
> 
> This is going to break builds with no DebugFS support.

Oops, forgot to build-test this. Note that runtime testing would be good,
I don't have the hw for that. Or can some CI pick this up somewhere?

> >  	return &obj->base.base;
> >  }
> > @@ -285,6 +285,12 @@ panthor_gem_create_with_handle(struct drm_file *file,
> >  		bo->base.base.resv = bo->exclusive_vm_root_gem->resv;
> >  	}
> >
> > +	/*
> > +	 * No explicit flags are needed in the call below, since the
> > +	 * function internally sets the INITIALIZED bit for us.
> > +	 */
> 
> If we got rid of the INITIALIZED usage flag, then this comment should also be reworded.

Will also fix this for v2.

> 
> > +	panthor_gem_debugfs_set_usage_flags(bo, 0);
> > +
> >  	/*
> >  	 * Allocate an id of idr table where the obj is registered
> >  	 * and handle has the id what user can see.
> > @@ -296,12 +302,6 @@ panthor_gem_create_with_handle(struct drm_file *file,
> >  	/* drop reference from allocate - handle holds it now. */
> >  	drm_gem_object_put(&shmem->base);
> >
> > -	/*
> > -	 * No explicit flags are needed in the call below, since the
> > -	 * function internally sets the INITIALIZED bit for us.
> > -	 */
> > -	panthor_gem_debugfs_set_usage_flags(bo, 0);
> > -
> >  	return ret;
> >  }
> >
> > @@ -387,7 +387,7 @@ static void panthor_gem_debugfs_bo_print(struct panthor_gem_object *bo,
> >  	unsigned int refcount = kref_read(&bo->base.base.refcount);
> >  	char creator_info[32] = {};
> >  	size_t resident_size;
> > -	u32 gem_usage_flags = bo->debugfs.flags & (u32)~PANTHOR_DEBUGFS_GEM_USAGE_FLAG_INITIALIZED;
> > +	u32 gem_usage_flags = bo->debugfs.flags;
> >  	u32 gem_state_flags = 0;
> >
> >  	/* Skip BOs being destroyed. */
> > @@ -436,8 +436,7 @@ void panthor_gem_debugfs_print_bos(struct panthor_device *ptdev,
> >
> >  	scoped_guard(mutex, &ptdev->gems.lock) {
> >  		list_for_each_entry(bo, &ptdev->gems.node, debugfs.node) {
> > -			if (bo->debugfs.flags & PANTHOR_DEBUGFS_GEM_USAGE_FLAG_INITIALIZED)
> > -				panthor_gem_debugfs_bo_print(bo, m, &totals);
> > +			panthor_gem_debugfs_bo_print(bo, m, &totals);
> >  		}
> >  	}
> >
> > diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
> > index 4dd732dcd59f..8fc7215e9b90 100644
> > --- a/drivers/gpu/drm/panthor/panthor_gem.h
> > +++ b/drivers/gpu/drm/panthor/panthor_gem.h
> > @@ -35,9 +35,6 @@ enum panthor_debugfs_gem_usage_flags {
> >
> >  	/** @PANTHOR_DEBUGFS_GEM_USAGE_FLAG_FW_MAPPED: BO is mapped on the FW VM. */
> >  	PANTHOR_DEBUGFS_GEM_USAGE_FLAG_FW_MAPPED = BIT(PANTHOR_DEBUGFS_GEM_USAGE_FW_MAPPED_BIT),
> > -
> > -	/** @PANTHOR_DEBUGFS_GEM_USAGE_FLAG_INITIALIZED: BO is ready for DebugFS display. */
> > -	PANTHOR_DEBUGFS_GEM_USAGE_FLAG_INITIALIZED = BIT(31),
> >  };
> >
> >  /**
> > --
> > 2.49.0
> 
> There's a Panfrost port of the functionality this patch fixes pending merge into drm-misc,
> so I should probably ask either Boris or Steven to hold off on merging them till I've made
> sure there's no potential UAF in it.

The important part is to do all init before the call to gem_object_put(),
that prevents the UAF. Doing all init before handle_create() is just nice
on top, since that aligns with the core design and avoids the need for a
separate init flag (for which you're at least missing the right memory
barriers here).

Thanks for your comments.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
