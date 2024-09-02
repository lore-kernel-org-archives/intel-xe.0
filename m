Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C83BECD13CF
	for <intel-xe@archiver.kernel.org>; Mon,  2 Sep 2024 12:49:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F69210E2E3;
	Mon,  2 Sep 2024 12:49:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="VzCKvxP5";
	dkim-atps=neutral
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B57BF10E2E5
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Sep 2024 12:48:59 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-371941bbfb0so2691704f8f.0
 for <intel-xe@lists.freedesktop.org>; Mon, 02 Sep 2024 05:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1725281338; x=1725886138; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ErQZ1ZYa/JAJ1daIyV4+AfPZVqbtHRlp6FTcAbn6s0s=;
 b=VzCKvxP5ibgrSPp89HDUdM8KzfZSQTFCQ7356QTr0Avx2DrKmwivOi2/WQmELSgZM6
 sQ+GXvFufSggwklQDxNX47UjvVQXo0N3nc9/hQ1PD4TfZPIRN5TXpQomyq9wSKltfuAF
 5Pvu+B+oyTYlQQACgDtoiIJU6sHy3M+OqiJVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725281338; x=1725886138;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ErQZ1ZYa/JAJ1daIyV4+AfPZVqbtHRlp6FTcAbn6s0s=;
 b=SRKanhU+jWO9sFjaR/ewP6v/dL9qZ2s17LMh/knXaWaQATM+qEg2sBiJkqFUQ7wZJj
 LaFSni+NAoXsAopG+Ajz2qD6ZuCjg0KSGToakmRGxG+j92Q8fF7FgautTqwUgfnptgZU
 IpSdgZiNHLnXM1f3xVMjuzn+l6W7oXd5MfpxvIJ4XW8KNa8G/1+g2+bOuf4I15cvqriW
 087Y53uAaXN1TwRVUB08cw3SorBWNAuhICU7USp6w95uv7+PqJIdnazKLzxTnLS4o3g1
 WUAAHQW6l9HwVlw216kj3He4/6xr0L8VNYk5/FOf1rhtzkTWjIraC94hIeA9+h6UPcBA
 mUfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcQ/jxP7seljgI0lIJKHE70G+pckUlPxlpR2IDACuBRZjuP2a2Q2JuOWXQlPll253IbiJ3YuQG0g==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YylJThrx3aqpmuwJPrqA89BnoPOGd/ogP+Trr3Tjt9MLHvjnBEn
 UwMB3zG7TLPJKNhS1GF/hCicQPVw0ecfzZPXUK4Rlr4zvQ8P+WGVu9oWfrL/6cg=
X-Google-Smtp-Source: AGHT+IEM6PzYLJOU76ykdtKVIXuo1akwIiiEQPwQvZJ/qQjWYklqTCX5OWrJCZ7wWGM7X6g7AiGVGA==
X-Received: by 2002:a5d:6043:0:b0:374:c79b:ca5f with SMTP id
 ffacd0b85a97d-374c79bcc0amr2389073f8f.46.1725281337813; 
 Mon, 02 Sep 2024 05:48:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374c39eacdfsm5238367f8f.42.2024.09.02.05.48.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 05:48:57 -0700 (PDT)
Date: Mon, 2 Sep 2024 14:48:55 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, matthew.auld@intel.com, daniel@ffwll.ch,
 "Paneer Selvam, Arunpravin" <Arunpravin.PaneerSelvam@amd.com>
Subject: Re: [RFC PATCH 23/28] drm/xe: Add SVM VRAM migration
Message-ID: <ZtW0N_p4KtiosN4J@phenom.ffwll.local>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
 <20240828024901.2582335-24-matthew.brost@intel.com>
 <Zs9LF-jnNrd9ZlxW@phenom.ffwll.local>
 <cbe8aebe-fcad-4ff0-8f56-146628183fd3@amd.com>
 <368ee71bd5e39d4e26947de9cc417f4abe8d1f3b.camel@linux.intel.com>
 <ZtBVXjNf1xAQOHHR@phenom.ffwll.local>
 <ZtDyZceN6asCzSHT@DUT025-TGLU.fm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZtDyZceN6asCzSHT@DUT025-TGLU.fm.intel.com>
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

On Thu, Aug 29, 2024 at 10:12:53PM +0000, Matthew Brost wrote:
> On Thu, Aug 29, 2024 at 01:02:54PM +0200, Daniel Vetter wrote:
> > On Thu, Aug 29, 2024 at 11:53:58AM +0200, Thomas Hellström wrote:
> > > But as Sima pointed out in private communication, exhaustive eviction
> > > is not really needed for faulting to make (crawling) progress.
> > > Watermarks and VRAM trylock shrinking should suffice, since we're
> > > strictly only required to service a single gpu page granule at a time.
> > > 
> > > However, ordinary bo-based jobs would still like to be able to
> > > completely evict SVM vram. Whether that is important enough to strive
> > > for is ofc up for discussion.
> > 
> > My take is that you don't win anything for exhaustive eviction by having
> > the dma_resv somewhere in there for svm allocations. Roughly for split lru
> > world, where svm ignores bo/dma_resv:
> > 
> > When evicting vram from the ttm side we'll fairly switch between selecting
> > bo and throwing out svm pages. With drm_exec/ww_acquire_ctx selecting bo
> > will eventually succeed in vacuuming up everything (with a few retries
> > perhaps, if we're not yet at the head of the ww ticket queue).
> > 
> > svm pages we need to try to evict anyway - there's no guarantee, becaue
> > the core mm might be holding temporary page references (which block
> 
> Yea, but think you can could kill the app then - not suggesting we
> should but could. To me this is akin to a CPU fault and not being able
> to migrate the device pages - the migration layer doc says when this
> happens kick this to user space and segfault the app.
> 
> My last patch in the series adds some asserts to see if this ever
> happens, thus far never. If it occurs we could gracefully handle it by
> aborting the migration I guess... I think the user really needs to
> something a bit crazy to trigger this condition - I don't think the core
> randomly grabs refs to device pages but could be wrong.

I think it does :-/

If you read do_swap_page around ->migrate_to_ram:


	get_page(vmf->page);
	pte_unmap_unlock(vmf->pte, vmf->ptl);
	ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
	put_page(vmf->page);

Also the migrate code itself does lock pages. So unless we toss in
additional locking on top of what core mm does (which I think should be
enough to cover migration), migrations will temporarily fail. And this is
just for multiple threads trying to get the same page back to sram, which
I think is a case we should support because the application did nothing
wrong.

> > migration) or have the page locked (which also block the migration). But
> > as long as those two steps succeed, we'll win and get the pages. There
> > might be some thrashing against concurrent svm faults stealing them again,
> > but they have a disadvantage since they can't steal dma_resv_locked bo.
> > And if it's still too much we can stall them in the page allocator.
> > 
> > So it's not entirely reliable, but should be close enough.
> > 
> > Now for bo based svm the picture isn't any different, because holding
> > dma_resv is not actually enough to migrate svm mappings. We still need to
> > hope there's no temporary page references around, and we still need to
> > succeed at locking the page. And the migration code only does trylocks,
> > because that's it's deadlock prevent algorithm if different migrations
> > needing the same set of pages, but acquiring them in a different order. So
> > we win nothing.
> 
> Ok, maybe my statement above is false...
> 
> Wouldn't be the only time this falls is if another migration is in
> flight (e.g. CPU fault) and they race? Then the eviction will naturally
> happen via refcount being dropped from the other migration. I guess I
> likely need to update my eviction code to not free the TTM resource if
> all pages are not migrated.

Yeah. And additionally core mm relies on some amount of Good Luck here,
plus the assumption that at least falling back to a single page/folio will
work out. At least eventually ...

The trouble is if your design assumes you can migrate an entire block,
because then if threads hammer that range in different orders you'll never
make forward progress. Because the core mm code doesn't have a fancy ww
locking scheme to get out of this, but only uses trylock, plus the
assumption that falling back to a single page will work out eventually.

Wrt TTM resource refcounting, I think that all looks ok. But maybe I
checked the wrong things.

> > Worse, if dma_resv does actually hold up svm migration and reclaim, then
> > we potentially deadlock because that lock is for a bigger range than
> > individual pages (or folios). And the core mm assumes that it can get out
> > of a deadlock bind by (at least stochastically) eventually succeeding in
> > acquiring/locking down a single page.
> > 
> > This means we cannot use dma_resv tricks to give the ttm world an
> > advantage in exhaustive eviction against concurrent svm faults. Or at
> > least not more than we can do without by just stalling svm faults that
> > need to allocate gpu memory (but that must happen without holding locks or
> > we're busted).
> > 
> 
> I'm a little lost here on the deadlock case. Do you mean when we try to
> evict SVM BO we trigger reclaim by allocating system pages and can
> deadlock? Doesn't TTM already have this dependency when evicting non-SVM
> BOs?

So you can have multiple cpu threads hammering a given svm range. And
thanks to the lols of mremap and fork each of them can have a different
view of that range (they are all obviously different processes from the
one that has created the gpusvm binding). And if you try to migrate, they
might all grab the pages in different orders, which can deadlock.

That's why there's so much retrying and also why core mm only does trylock
on pages if it grabs an entire pile.

Now if you have a lock that nests within the page lock you need to trylock
it, or it deadlocks. Which kinda defeats the point of having a bigger lock
and moving the entire bo as a unit.

But if that is outside of the page lock (like amdgpu), you still have the
issue of the elevated page reference from do_swap_page. Which also blocks
migration.

Note that neither is a hard deadlock, as in lockdep complaints, because
they're all retrying anyway. They're more like lifelocks, and the bigger
your pile of pages the more likely that you'll always have a failed page
and need to abort and retry. Which results in threads spinning forever.

> > So the only benefit I'm seeing is the unified lru, which I'm not sure is
> > worth it. There's also a bit a lru design tension here, because for the bo
> 
> Well also not rewriting the world...

Yeah it's tough. I'm still at the "understanding all the tradeoffs" stage,
just to make that clear.
-Sima

> Matt
> 
> > world we want objects that are locked to stay on the lru, so that the
> > competing processes can figure out who has the winning ww ticket. The core
> > mm design otoh does isolate pages and remove them from the lru when
> > they're acquired, so that they don't gunk up other processes from trying
> > to make forward progress and are better hidden. Which reduces temporary
> > page references (from lru walk) preventing migration and stuff like that.
> > 
> > Cheers, Sima
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
