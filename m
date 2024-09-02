Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4427CD13CF
	for <intel-xe@archiver.kernel.org>; Mon,  2 Sep 2024 11:40:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FD2D10E266;
	Mon,  2 Sep 2024 11:40:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="ccd3lLhI";
	dkim-atps=neutral
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5348110E2A3
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Sep 2024 11:40:28 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-374c5bab490so736227f8f.1
 for <intel-xe@lists.freedesktop.org>; Mon, 02 Sep 2024 04:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1725277227; x=1725882027; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZGnlHGPYrpe1fJlfpZjBfM/NP54NsgjJJW5LKcprITg=;
 b=ccd3lLhIIufupkZnSpFbTaxLTLzXXFz5lyVZ0FjYNQHEzvRU8RYj52DPfSNmxvOzlH
 40CB6cmAj8bsX+u6D/23OxQ7+Fd+7GjMFHAeGBYElXyIwTjjF9rF9bRoD87ISqTiRDWU
 N55qRsfYZiO1TdQ8+NgdyFrm/0UDTXTuF+/yI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725277227; x=1725882027;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZGnlHGPYrpe1fJlfpZjBfM/NP54NsgjJJW5LKcprITg=;
 b=Yz/pPmyGwvLVFhdgPDc0aV7LdwssStqYX2N8a7V94S4riZnPVwDSF95suaAeynkl//
 rSPQafUDLwDfrthUuAfu0ptj37xHcI0D7BqRGmWNSj72+Ni1QZ79nEA5h+tSuDcHWRGc
 KS2i5xTX/R7vVhSl1JJfKUSl0xdPsQlEt2lrdY6CBhC3h+V8NV4cv+yJoWnd9jZ8mxs/
 BnOPmvlD2L8fb+QPGKRyi0YgeShPbvoJN98Q3cAl8zyb/d43sGhqC+NsIzENh9TJVO0S
 K+idm9yNm8y1hE+hMOmE4ugo7PEG0llw4dy+jwT3usREnh4wCf4FDfniIbvysgao+BDW
 ycPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVs3D6mp51GZgCt/eue33vxAagkiyCr6r8+Wo/DMvJoIIyuCiPuUbnz7eMysRJ3R8AlW89KPdkxeA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzfu4pzWgWJxQZlkw/P8B1LGO0n68vafyb0PeSHxhOqR9uGTK2B
 zaZSAi05RWKmL6ukJKmnh2RNKACpP5LMidC5E1SyAOBV2Uo/jJ6FMOXm1kEZgXHs7UR1GAccjaT
 A
X-Google-Smtp-Source: AGHT+IFs2OoGYftBdZbq+CHfZIxLm3nJ+N6u20RXRy630+91s6jbuRe1dPAZBBGs9MP7rWT9305suA==
X-Received: by 2002:a5d:4565:0:b0:374:c3e4:d6e3 with SMTP id
 ffacd0b85a97d-374c3e4d8a1mr2542075f8f.5.1725277226490; 
 Mon, 02 Sep 2024 04:40:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374c0f6f4c4sm5905185f8f.44.2024.09.02.04.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 04:40:25 -0700 (PDT)
Date: Mon, 2 Sep 2024 13:40:23 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, airlied@gmail.com,
 christian.koenig@amd.com, thomas.hellstrom@linux.intel.com,
 matthew.auld@intel.com, daniel@ffwll.ch
Subject: Re: [RFC PATCH 05/28] drm/gpusvm: Add support for GPU Shared Virtual
 Memory
Message-ID: <ZtWkJ8RRgj0JYVCM@phenom.ffwll.local>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
 <20240828024901.2582335-6-matthew.brost@intel.com>
 <Zs9xWiECsszs6nPR@phenom.ffwll.local>
 <ZtCmi3Hjk7K+Sk09@DUT025-TGLU.fm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZtCmi3Hjk7K+Sk09@DUT025-TGLU.fm.intel.com>
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

On Thu, Aug 29, 2024 at 04:49:15PM +0000, Matthew Brost wrote:
> On Wed, Aug 28, 2024 at 08:50:02PM +0200, Daniel Vetter wrote:
> > On Tue, Aug 27, 2024 at 07:48:38PM -0700, Matthew Brost wrote:
> > > +int drm_gpusvm_migrate_to_sram(struct drm_gpusvm *gpusvm,
> > > +			       struct drm_gpusvm_range *range,
> > > +			       const struct drm_gpusvm_ctx *ctx)
> > > +{
> > > +	u64 start = range->va.start, end = range->va.end;
> > > +	struct mm_struct *mm = gpusvm->mm;
> > > +	struct vm_area_struct *vas;
> > > +	int err;
> > > +	bool retry = false;
> > > +
> > > +	if (!ctx->mmap_locked) {
> > > +		if (!mmget_not_zero(mm)) {
> > > +			err = -EFAULT;
> > > +			goto err_out;
> > > +		}
> > > +		if (ctx->trylock_mmap) {
> > > +			if (!mmap_read_trylock(mm))  {
> > > +				err = drm_gpusvm_evict_to_sram(gpusvm, range);
> > > +				goto err_mmput;
> > > +			}
> > > +		} else {
> > > +			mmap_read_lock(mm);
> > > +		}
> > > +	}
> > > +
> > > +	mmap_assert_locked(mm);
> > > +
> > > +	/*
> > > +	 * Loop required to find all VMA area structs for the corner case when
> > > +	 * VRAM backing has been partially unmapped from MM's address space.
> > > +	 */
> > > +again:
> > > +	vas = find_vma(mm, start);
> > 
> > So a hiliarous case that amdkfd gets a bit better but still not entirely
> > is that the original vma might entirely gone. Even when you can still get
> > at the mm of that process. This happens with cow (or shared too I think)
> > mappings in forked child processes, or also if you play fun mremap games.
> > 
> > I think that outside of the ->migrate_to_ram callback migration/eviction
> > to sram cannot assume there's any reasonable vma around and has to
> > unconditionally go with the drm_gpusvm_evict_to_sram path.
> > 
> 
> See my response here [1]. Let me drop the whole trylock thing and
> convert to an 'evict' flag which calls drm_gpusvm_evict_to_sram in
> places where Xe needs to evict VRAM. Or maybe just export that function
> and call it directly. That way the only place the VMA is looked up for
> SRAM -> VRAM is upon CPU page fault.

Yeah I think a dedicated path for migrate_to_ram hook that goes directly
into your evict_to_sram path is the design-clean approach here imo.

> [1] https://patchwork.freedesktop.org/patch/610955/?series=137870&rev=1#comment_1111164
> 
> > Also in the migrate_to_ram case the vma is essentially nothing else that
> > informational about which ranges we might need if we prefault a bit (in
> > case the child changed the vma compared to the original one). So it's good
> > to as parameter for migrate_vma_setup, but absolutely nothing else.
> > 
> > amdkfd almost gets this right by being entirely based on their svm_range
> > structures, except they still have the lingering check that the orignal mm
> > is still alive. Of course you cannot ever use that memory on the gpu
> > anymore, but the child process could get very pissed if their memory is
> > suddenly gone. Also the eviction code has the same issue as yours and
> > limits itself to vma that still exist in the original mm, leaving anything
> > that's orphaned in children or remaps stuck in vram. At least that's my
> > understanding, I might very well be wrong.
> > 
> > So probably want a bunch of these testcases too to make sure that all
> > works, and we're not stuck with memory allocations in vram that we can't
> > move out.
> 
> When writing some additional test cases, let me add hooks in my IGTs to
> be able to verify we are not orphaning VRAM too.

So maybe apply caution, I'm honestly not sure whether core mm makes any
guarantees about not orphaning stuff, at least for a little bit.

Over the w/e my brain tossed me the "so are we sure we can tear down our
zone_device data, the page array specifically" brain teaser. And I think
the answer is that we have to wait until all page references disappear,
which might take a long time. Core mm makes no guarantee about elevated
page references disappearing in a timely manner, at least as far as I
know. Which is also why migration is a best effort thing only.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
