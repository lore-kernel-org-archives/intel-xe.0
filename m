Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD94C83F18
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 08:53:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D8410E360;
	Thu, 10 Jul 2025 08:53:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="UOQZkEwu";
	dkim-atps=neutral
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3ED710E360
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 08:53:26 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-45363645a8eso4895415e9.1
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 01:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1752137605; x=1752742405; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=bI3z0Oq6UdCGu+l64Y4sC3Ay12fSdA5BvbdbsWZucl4=;
 b=UOQZkEwuwsbtldTpeOa5MaCDMz9pzDdLVGE02NE/HuFRQdPVfC0iHgfTvr64jDIUXp
 c+w3WX7c571hkAum16/ZCV4m0LAA6HCo4EaviWrrLK1+w7TWqTgloG4v0qAs61AWrAXT
 K/1iEVAvzNOFWnOclK0gaKx6+fKjVH+vqlyn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752137605; x=1752742405;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bI3z0Oq6UdCGu+l64Y4sC3Ay12fSdA5BvbdbsWZucl4=;
 b=G7QTQvYVo5GiQHV9Um0jLHU3CDoEygM+lYVokouRfcfgt4na7dOcKHTFuB7e9JpPqr
 Vfanm9Yxi48S7H6Qr7y35tLSuiwe7jnl6oVEznqvrPskPdJCQgqaO9+Rd7I1OQE3pXXG
 kYQt18B1/aTEQXObRq/CNgKBn76p0cKh6zYrZX6ghc5wMrJmZ2j7Dhs6vbWQHW6wyttR
 82C2Uf/scMrRYYX6XYZhjj6DKRaqsmTCftiwEFJ2XSGK5p5cFyxAGVIiZu3nLo8aSABa
 iPX9ATpOw9q6Cjf7KUcngT6FTneZy8Twe45599fDC8lu6k+QDn76SNkf5LeJyvpjbwXZ
 kSCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqDR8aEyDosRVwxJJb1ecd6YM8fAttO6R7mztm1Ey7FURGT1lq7eZkHVVdOt/9tGLbQntUrNoUKQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmpF3w+tnkqbvoqtqUdeBNR59IKLAIoDFnOzil8GiWdnDunZaY
 dcAqe8yc7uEn5pe4g3uz5gqzN8/mkxbHIJMjpui8tx9MeXoCuH3XcWdo0uljYrz5HnA=
X-Gm-Gg: ASbGnctPpFW0ciHDkbquzpaJYFsPuk7qC6QtGlgPw5MxArCwUtOEtaA1X0xWmeSOC7o
 A4E9Xia1cJObXF16nXpQcczp6oK5wGn33rBA4r5OpjrGe4yXl4pSQzNptS/9ycspRXiFsWE3uiN
 K9LsYThFmf5Q08+u2EOd3HU7MGA7EsoHiaAVvCSfXNYVwr2HFnVUgokC2sbDjYtlBKgIl0OYR66
 JCLgl4WeiOlf2QZomGbeuc21noDbjolfWxquSuPOjtf4ADHVeohIZiU0u+9UeTRNdb6VHk4ONlV
 hat2ZFC25Tka67my3FzhcGhnLvhOnFchYac7SbhCzSVP78WIT2zADviexVxxyo0Zw+x2pOzkIQ=
 =
X-Google-Smtp-Source: AGHT+IGumW1vKk+sUdmaIEJA5Pxk4iIlbPBXmQm14Qlq9nDBUb8Kl7rKelJIT6CJvjeNYiHEMQOhGQ==
X-Received: by 2002:a05:600c:46c5:b0:450:d019:263 with SMTP id
 5b1f17b1804b1-454dbeee3aamr26919285e9.18.1752137604699; 
 Thu, 10 Jul 2025 01:53:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454dd541167sm12956315e9.30.2025.07.10.01.53.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 01:53:24 -0700 (PDT)
Date: Thu, 10 Jul 2025 10:53:22 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Steven Price <steven.price@arm.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Xe Development <intel-xe@lists.freedesktop.org>,
 =?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Simona Vetter <simona.vetter@intel.com>
Subject: Re: [PATCH] drm/panthor: Fix UAF in panthor_gem_create_with_handle()
 debugfs code
Message-ID: <aG9_gpFtFcLhBe4y@phenom.ffwll.local>
References: <20250707151814.603897-2-simona.vetter@ffwll.ch>
 <20250709135220.1428931-1-simona.vetter@ffwll.ch>
 <6fe2409f-b561-4546-92e1-dd7f8d45ef12@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6fe2409f-b561-4546-92e1-dd7f8d45ef12@arm.com>
X-Operating-System: Linux phenom 6.12.30-amd64 
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

On Wed, Jul 09, 2025 at 04:48:21PM +0100, Steven Price wrote:
> On 09/07/2025 14:52, Simona Vetter wrote:
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
> > v2: Fix build issues for !CONFIG_DEBUGFS (Adrián)
> > 
> > v3: Add linebreak and remove outdated comment (Liviu)
> > 
> > Fixes: a3707f53eb3f ("drm/panthor: show device-wide list of DRM GEM objects over DebugFS")
> > Cc: Adrián Larumbe <adrian.larumbe@collabora.com>
> > Cc: Boris Brezillon <boris.brezillon@collabora.com>
> > Cc: Steven Price <steven.price@arm.com>
> > Cc: Liviu Dudau <liviu.dudau@arm.com>
> > Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> > Signed-off-by: Simona Vetter <simona.vetter@intel.com>
> > Signed-off-by: Simona Vetter <simona.vetter@ffwll.ch>
> 
> Reviewed-by: Steven Price <steven.price@arm.com>

Thanks for the review!

> Although a nit on the email subject - you're missing the "v3" tag ;)

Yeah I often forget to set that, oops :-P

Will you or someone from the panthor team land this, or should I push it
to drm-misc-next myself?
-Sima

> 
> Steve
> 
> > ---
> >  drivers/gpu/drm/panthor/panthor_gem.c | 31 +++++++++++++--------------
> >  drivers/gpu/drm/panthor/panthor_gem.h |  3 ---
> >  2 files changed, 15 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> > index 7c00fd77758b..a123bc740ba1 100644
> > --- a/drivers/gpu/drm/panthor/panthor_gem.c
> > +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> > @@ -16,10 +16,15 @@
> >  #include "panthor_mmu.h"
> >  
> >  #ifdef CONFIG_DEBUG_FS
> > -static void panthor_gem_debugfs_bo_add(struct panthor_device *ptdev,
> > -				       struct panthor_gem_object *bo)
> > +static void panthor_gem_debugfs_bo_init(struct panthor_gem_object *bo)
> >  {
> >  	INIT_LIST_HEAD(&bo->debugfs.node);
> > +}
> > +
> > +static void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo)
> > +{
> > +	struct panthor_device *ptdev = container_of(bo->base.base.dev,
> > +						    struct panthor_device, base);
> >  
> >  	bo->debugfs.creator.tgid = current->group_leader->pid;
> >  	get_task_comm(bo->debugfs.creator.process_name, current->group_leader);
> > @@ -44,14 +49,13 @@ static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo)
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
> > +static void panthor_gem_debugfs_bo_init(struct panthor_gem_object *bo) {}
> >  #endif
> >  
> >  static void panthor_gem_free_object(struct drm_gem_object *obj)
> > @@ -246,7 +250,7 @@ struct drm_gem_object *panthor_gem_create_object(struct drm_device *ddev, size_t
> >  	drm_gem_gpuva_set_lock(&obj->base.base, &obj->gpuva_list_lock);
> >  	mutex_init(&obj->label.lock);
> >  
> > -	panthor_gem_debugfs_bo_add(ptdev, obj);
> > +	panthor_gem_debugfs_bo_init(obj);
> >  
> >  	return &obj->base.base;
> >  }
> > @@ -285,6 +289,8 @@ panthor_gem_create_with_handle(struct drm_file *file,
> >  		bo->base.base.resv = bo->exclusive_vm_root_gem->resv;
> >  	}
> >  
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
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
