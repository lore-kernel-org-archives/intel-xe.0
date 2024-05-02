Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50273C04FFE
	for <intel-xe@archiver.kernel.org>; Thu,  2 May 2024 08:04:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0213710E928;
	Thu,  2 May 2024 08:04:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="HNLixUBZ";
	dkim-atps=neutral
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F45310E928
 for <intel-xe@lists.freedesktop.org>; Thu,  2 May 2024 08:04:22 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-41bd8bdd065so4535755e9.3
 for <intel-xe@lists.freedesktop.org>; Thu, 02 May 2024 01:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1714637060; x=1715241860; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=l+O2B0ZdeV1GXX49oBt/YSppfbCEznO3E1w/D6uWlxg=;
 b=HNLixUBZ0DZCzaGO7VH9qAbXB7hu8hDTqkv/7Bln0P36tPjZ5FLxHelCE6W7ug4Q/Y
 C7pB9jy04/xcYYjc0PweXydM21+URPbVWEUQMUDUQmQosTb+Sm1voo8fkHYb6Aj+PGpi
 Yo13yOeUtapEsmPgYxCA91xSQfQMETnU1gMj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714637060; x=1715241860;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l+O2B0ZdeV1GXX49oBt/YSppfbCEznO3E1w/D6uWlxg=;
 b=pyI/hxtAFu8RPkbO6oaOmD0c6+RuBZ3FYIyJRgyo4RSXEX5l2hhMfn2JJp55/8TOeF
 hlMRXr/onqSzYhu29ES7Nof+JSGeH7iiTQKfySPxWOCZP0EVSWiR0eyikaw+2YujwDuy
 rNEVSTe5xVFsi51DVoTnoYodbn/YUS4/zSq7Rfciu6p/5nyPFJ/Tf4gbPadMKH///cpI
 YLdpVsMdgUN8wvnvGG35xIUEgBh6Oja4sR8YlM2hEg+jHPhwVMJgWK/PPS8UjeZyR4aM
 9/XEjdCbUDCiCEQscf6+OXE21ZA4hK+8I7qak7JOlNEiegyOe+nWENN/fl751i9yix9S
 5nCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeaROSFgIralWoapnFsRwQwoky4AlKmRd0juhsETTawFB4c7LqQvJi1yi7d77Z2N9SAOx3QPzGVz2hTqk8oYcx6svUHkC5TUGQSjsb2W4=
X-Gm-Message-State: AOJu0YxORNNReMNS2yR2i6/QErp/PamgPu6xIKHUYHlpMMgtinyvKib+
 08aY5OxU86sDZCu0L/hAhowz93U6Zis62drXejlcx5w1pPJI/YQ7a5+x1hnuzGE=
X-Google-Smtp-Source: AGHT+IGNJ+d7X2n/F+nQFzXJR94w4Tfj9tgrOCUUEgnZZ7JT7Eu/cHrzfPvhsigbpUUXVSLob590wQ==
X-Received: by 2002:a05:600c:1991:b0:41a:408c:579c with SMTP id
 t17-20020a05600c199100b0041a408c579cmr3447620wmq.1.1714637060099; 
 Thu, 02 May 2024 01:04:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 be11-20020a05600c1e8b00b00418f7605249sm1037909wmb.24.2024.05.02.01.04.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 01:04:19 -0700 (PDT)
Date: Thu, 2 May 2024 10:04:17 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Daniel Vetter <daniel@ffwll.ch>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 "Zeng, Oak" <oak.zeng@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 "Welty, Brian" <brian.welty@intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg table
 from hmm range
Message-ID: <ZjNJASw0JdXS6dTa@phenom.ffwll.local>
References: <SA1PR11MB699102978E72F21E6C803D6392102@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240425010520.GW941030@nvidia.com>
 <65cb3984309d377d6e7d57cb6567473c8a83ed78.camel@linux.intel.com>
 <20240426120047.GX941030@nvidia.com>
 <ad82f95ee29ada403459416d4c97c2b9083b5a0f.camel@linux.intel.com>
 <20240426163519.GZ941030@nvidia.com>
 <f938dc8f7309ae833e02ccdbc72134df0607dfa4.camel@linux.intel.com>
 <20240430173002.GV941030@nvidia.com>
 <ZjE_LJ7AFFQk0Eep@phenom.ffwll.local>
 <20240501000915.GY941030@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240501000915.GY941030@nvidia.com>
X-Operating-System: Linux phenom 6.6.15-amd64 
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

On Tue, Apr 30, 2024 at 09:09:15PM -0300, Jason Gunthorpe wrote:
> On Tue, Apr 30, 2024 at 08:57:48PM +0200, Daniel Vetter wrote:
> > On Tue, Apr 30, 2024 at 02:30:02PM -0300, Jason Gunthorpe wrote:
> > > On Mon, Apr 29, 2024 at 10:25:48AM +0200, Thomas Hellström wrote:
> > > 
> > > > > Yes there is another common scheme where you bind a window of CPU to
> > > > > a
> > > > > window on the device and mirror a fixed range, but this is a quite
> > > > > different thing. It is not SVA, it has a fixed range, and it is
> > > > > probably bound to a single GPU VMA in a multi-VMA device page table.
> > > > 
> > > > And this above here is exactly what we're implementing, and the GPU
> > > > page-tables are populated using device faults. Regions (large) of the
> > > > mirrored CPU mm need to coexist in the same GPU vm as traditional GPU
> > > > buffer objects.
> > > 
> > > Well, not really, if that was the case you'd have a single VMA over
> > > the entire bound range, not dynamically create them.
> > > 
> > > A single VMA that uses hmm_range_fault() to populate the VM is
> > > completely logical.
> > > 
> > > Having a hidden range of mm binding and then creating/destroying 2M
> > > VMAs dynamicaly is the thing that doesn't make alot of sense.
> > 
> > I only noticed this thread now but fyi I did dig around in the
> > implementation and it's summarily an absolute no-go imo for multiple
> > reasons. It starts with this approach of trying to mirror cpu vma (which I
> > think originated from amdkfd) leading to all kinds of locking fun, and
> > then it gets substantially worse when you dig into the details.
> 
> :(
> 
> Why does the DRM side struggle so much with hmm_range fault? I would
> have thought it should have a fairly straightforward and logical
> connection to the GPU page table.

Short summary is that traditionally gpu memory was managed with buffer
objects, and each individual buffer object owns the page tables for it's
va range.

For hmm you don't have that buffer object, and you want the pagetables to
be fairly independent (maybe even with their own locking like linux cpu
pagetables do) from any mapping/backing storage. Getting to that world is
a lot of reshuffling, and so thus far all the code went with the quick
hack route of creating ad-hoc ranges that look like buffer objects to the
rest of the driver code. This includes the merged amdkfd hmm code, and if
you dig around in that it results in some really annoying locking
inversions because that middle layer of fake buffer object lookalikes only
gets in the way and results in a fairly fundamental impendendence mismatch
with core linux mm locking.

> FWIW, it does make sense to have both a window and a full MM option
> for hmm_range_fault. ODP does both and it is fine..
> 
> > I think until something more solid shows up you can just ignore this. I do
> > fully agree that for sva the main mirroring primitive needs to be page
> > centric, so dma_map_sg. 
>               ^^^^^^^^^^
> 
> dma_map_page

Oops yes.

> > There's a bit a question around how to make the
> > necessary batching efficient and the locking/mmu_interval_notifier scale
> > enough, but I had some long chats with Thomas and I think there's enough
> > option to spawn pretty much any possible upstream consensus. So I'm not
> > worried.
> 
> Sure, the new DMA API will bring some more considerations to this as
> well. ODP uses a 512M granual scheme and it seems to be OK. By far the
> worst part of all this is the faulting performance. I've yet hear any
> complains about mmu notifier performance..

Yeah I don't expect there to be any need for performance improvements on
the mmu notifier side of things. All the concerns I've heard felt rather
theoretical, or where just fallout of that fake buffer object layer in the
middle.

At worst I guess the gpu pagetables need per-pgtable locking like the cpu
pagetables have, and then maybe keep track of mmu notifier sequence
numbers on a per-pgtable basis, so that invalidates and faults on
different va ranges have no impact on each another. But even that is most
likely way, way down the road.

> > But first this needs to be page-centric in the fundamental mirroring
> > approach.
> 
> Yes

Ok clarifying consensus on this was the main reason I replied, it felt a
bit like the thread was derailing in details that don't yet matter.

Thanks, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
