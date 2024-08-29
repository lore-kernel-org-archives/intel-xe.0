Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F19C8303B
	for <intel-xe@archiver.kernel.org>; Thu, 29 Aug 2024 11:03:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DADE110E61C;
	Thu, 29 Aug 2024 11:03:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="cNNsHaDS";
	dkim-atps=neutral
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5870510E618
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Aug 2024 11:02:59 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4280ca0791bso4892245e9.1
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Aug 2024 04:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1724929378; x=1725534178; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6mqsPp8bptpJDjAoZFo/p73HAkDP5w2aHLYLqUESpZk=;
 b=cNNsHaDSy653z34fmieknVNEeYsIa63y53ahLvEUN+04WYfIPAHoUTR6T3/pnb0M9D
 rsVTte2SXWxxuZPYJsfofShBNkn2R+dkr2OsdUp9EsbPwHtY7W+oUmw4z32yO+jmTXSB
 6GzSQrnTJAFz1egd/B6K1/R4KU2vfKr0bjucs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724929378; x=1725534178;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6mqsPp8bptpJDjAoZFo/p73HAkDP5w2aHLYLqUESpZk=;
 b=Cx7upSivrhcp7PXH3CtwruJBte72o1uSambZRBoEzhDeS3INZqBpvgUC+JZ4KTO40l
 Cov+z6R2HQ/StN17nW8mkMvEl+3REAKHlQBludr+A0nd5bKAHGFqWnOROMful2fDqEjV
 qJBp8RA1B7bcLa0HMj0Iy7Ky8TVh9ob370C1ypKXk0i8F9jK2nNuvMnHl1Rt1vdl/Q0k
 Y5KxfYOL8coEe0EZFfrGwjchM6r/vGusyliwmXxg30ff2bV0vuiWAeYIWKYsT3lFfBtj
 gDFrZbH/q7IsdoQJjhaOXB8jch1YzAQXa+efSYVCy38zQ5HGFWKruC3h1SCsRDcOhdpq
 GCow==
X-Forwarded-Encrypted: i=1;
 AJvYcCXn2dHE7oNTQlb8pJ4OE1i4ShUktWSSxS9eG5J0lVjYlCEk79bKp41Nv+OWsAWZQL+po8H7IbI4kw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQx+bRGAjUwg8H9UlCMCy7gu+kbnkbai1NP13EKzaFwWHk6Xx6
 qzEUWF2d4Jw3HATFLRXG/6oXvNvvmLNtpbBudMPNDtC74PvuIKkEUBkbjMashww=
X-Google-Smtp-Source: AGHT+IFMxT7ZEj7QsLBwZwGx4AoRT837fx6N1ZbdqOnqOykFMJF2sfesO4JGjNAKvpHE1V384OFUbQ==
X-Received: by 2002:a05:600c:1c18:b0:428:f0c2:ef4a with SMTP id
 5b1f17b1804b1-42bb01bac77mr17913345e9.13.1724929377396; 
 Thu, 29 Aug 2024 04:02:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee4a57bsm1137097f8f.20.2024.08.29.04.02.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 04:02:56 -0700 (PDT)
Date: Thu, 29 Aug 2024 13:02:54 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, matthew.auld@intel.com, daniel@ffwll.ch,
 "Paneer Selvam, Arunpravin" <Arunpravin.PaneerSelvam@amd.com>
Subject: Re: [RFC PATCH 23/28] drm/xe: Add SVM VRAM migration
Message-ID: <ZtBVXjNf1xAQOHHR@phenom.ffwll.local>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
 <20240828024901.2582335-24-matthew.brost@intel.com>
 <Zs9LF-jnNrd9ZlxW@phenom.ffwll.local>
 <cbe8aebe-fcad-4ff0-8f56-146628183fd3@amd.com>
 <368ee71bd5e39d4e26947de9cc417f4abe8d1f3b.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <368ee71bd5e39d4e26947de9cc417f4abe8d1f3b.camel@linux.intel.com>
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

On Thu, Aug 29, 2024 at 11:53:58AM +0200, Thomas Hellström wrote:
> But as Sima pointed out in private communication, exhaustive eviction
> is not really needed for faulting to make (crawling) progress.
> Watermarks and VRAM trylock shrinking should suffice, since we're
> strictly only required to service a single gpu page granule at a time.
> 
> However, ordinary bo-based jobs would still like to be able to
> completely evict SVM vram. Whether that is important enough to strive
> for is ofc up for discussion.

My take is that you don't win anything for exhaustive eviction by having
the dma_resv somewhere in there for svm allocations. Roughly for split lru
world, where svm ignores bo/dma_resv:

When evicting vram from the ttm side we'll fairly switch between selecting
bo and throwing out svm pages. With drm_exec/ww_acquire_ctx selecting bo
will eventually succeed in vacuuming up everything (with a few retries
perhaps, if we're not yet at the head of the ww ticket queue).

svm pages we need to try to evict anyway - there's no guarantee, becaue
the core mm might be holding temporary page references (which block
migration) or have the page locked (which also block the migration). But
as long as those two steps succeed, we'll win and get the pages. There
might be some thrashing against concurrent svm faults stealing them again,
but they have a disadvantage since they can't steal dma_resv_locked bo.
And if it's still too much we can stall them in the page allocator.

So it's not entirely reliable, but should be close enough.

Now for bo based svm the picture isn't any different, because holding
dma_resv is not actually enough to migrate svm mappings. We still need to
hope there's no temporary page references around, and we still need to
succeed at locking the page. And the migration code only does trylocks,
because that's it's deadlock prevent algorithm if different migrations
needing the same set of pages, but acquiring them in a different order. So
we win nothing.

Worse, if dma_resv does actually hold up svm migration and reclaim, then
we potentially deadlock because that lock is for a bigger range than
individual pages (or folios). And the core mm assumes that it can get out
of a deadlock bind by (at least stochastically) eventually succeeding in
acquiring/locking down a single page.

This means we cannot use dma_resv tricks to give the ttm world an
advantage in exhaustive eviction against concurrent svm faults. Or at
least not more than we can do without by just stalling svm faults that
need to allocate gpu memory (but that must happen without holding locks or
we're busted).

So the only benefit I'm seeing is the unified lru, which I'm not sure is
worth it. There's also a bit a lru design tension here, because for the bo
world we want objects that are locked to stay on the lru, so that the
competing processes can figure out who has the winning ww ticket. The core
mm design otoh does isolate pages and remove them from the lru when
they're acquired, so that they don't gunk up other processes from trying
to make forward progress and are better hidden. Which reduces temporary
page references (from lru walk) preventing migration and stuff like that.

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
