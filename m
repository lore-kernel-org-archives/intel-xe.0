Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F20D73EB1
	for <intel-xe@archiver.kernel.org>; Sat, 31 Jan 2026 03:01:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 633ED10E1CF;
	Sat, 31 Jan 2026 03:01:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WOeYPAN4";
	dkim-atps=neutral
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD65010E0CA
 for <intel-xe@lists.freedesktop.org>; Sat, 31 Jan 2026 03:01:11 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-894674a4c4aso51546156d6.3
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jan 2026 19:01:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769828470; cv=none;
 d=google.com; s=arc-20240605;
 b=PYbwbUk7EM2NVXGtfl8Elc+f1jydQkh+bX0lZWT6jVQq0jDK64IL+RhrXHKDih9Ey+
 nAHE/Uf9k320DfQ06Iz6aUkp3rl87vPzKT2CLDv+IshLLVOJ6kW6jTD1KYYToQiTf/d5
 wOm4mrUr3OKMBtMm3cGlvEA4GSePMnUeqSws8I9DVXg24gljy15DrP/rCuj0dqhgYjUf
 YA+aM2WwtVwL6bSJnSUe0XxuaQrpHS1S5LfSO2G0RCjkUSkloYnGBA6V+G6/XW9hQUtv
 I+Cejrb2Jn4B74ZqFN0ge4IG/eaW5Ayh8h1i5zych0UdrcIEiMsEB4iW8jasemHGoCGD
 6Mkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=0dP1zizuvb+YCTfhetz0ht1UJLaJiSW38KjUpELCixc=;
 fh=SRFiul4pfEsvJd2NC5ZAu3pbqkcgB2cZxlnbsv5MLqE=;
 b=cUKh2/AgY6tu9qD0+vy+kdl1QyOTD+XmwtZHcx3zJVMCEVLe+SwchXbGOOaFYORjb2
 PbtjpK3dYphgXqAKI9qGEjFJhwnhgpbCJHSbpPXSdyzTNRvc3fKN7Pfyn5wM8vNK7g4I
 vJknpsKqSw2s6fMBcWqGKwVsKeRbT0owvGv1UYJjU0V7teXG88pEMoQSflqRFjnDpahS
 CrJ+14oglO/eZCIWGAvBWeDgwu04r1scn/FXn8P8yQ/q237K5jtaesNEO7GQlM7MId3K
 /F4nBZPcqPsH/PVRvmDMEg2xArbjqKH2aFddb5a2KUGcMc9Fw5iWVajAChcKDlYxq9Y7
 tcGQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769828470; x=1770433270; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0dP1zizuvb+YCTfhetz0ht1UJLaJiSW38KjUpELCixc=;
 b=WOeYPAN4YP5WeM3wWxdkGE6XdrMugWpXBW6j+zzOaz0BMj1EqTPyR3Rc2vo57O2xSq
 UxUFGG5ecB+xKaQZ25Xry2WuyhvMIDnC3aC1QEysqvbs4bQbCZ3RzKg71kDNCyvDmC5L
 D0u9YFRVx5XpKZMlvq4AmQH9wNfAWIfD+GWxt4Cq8f2PYy8CGqZWXwyBI6NW9puMh4ex
 njYDHfJ8U7Xz7K2hSrCgIRA+k2LULUyQ2te1Kvy9AasHqFBM90jUn/Fr6TqpqBj1F5ij
 rR0xrN7CXHg+sjxwchU2FaGQinkjc+lrwfAyukP7n8ANBFlEkppXZEND0eVF7yDBhyf8
 zkwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769828470; x=1770433270;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0dP1zizuvb+YCTfhetz0ht1UJLaJiSW38KjUpELCixc=;
 b=nV0Rdu8SbLHjkffsHMhOr6WZP/DeexynK6Wz/z53TCRINkY1xvk/MMggYubyhAGQXJ
 XBH/pGqDeNwT3GXrvY0pDEfjL7uc6saeFJ94ud+DzR9XXmboH3dLr/6ZkSw9rLFxoI4m
 P3Cctgb062LAfYUmHPft6Lof5L2amzZ/Tdnn8fhEAfIjoCb5+XS43FiMf4VsOyFDmVeL
 qAWD90qggRtVXJpf2+Mwxqku7vShDB4uurmvze/WRB1gyx7Jm7qo/b8Tqp646Auw2Igq
 r2VoEIOdntdLNcBGWo6rOjoCCU8nkmH+l4Ac+/R91WMjdJmJEpee4bgtG1POCzFZ5EIq
 sskQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYhme41CJhtPIJVY/OmTOS6HpRxJrISa6fgIxRfay/ZazelRV/EtpVbHNzGsz4EeFwU3jISepV8Q==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyfz0hn/qaAIfGku5F0PqxFq4AB2Y/yGEULJPu0hhWks1d4iKtD
 XHkK9BvO+KceY2qhhgA8FVBobQXRBakkSnqVRslmBG47gcBvn/CEI88dL+YgdJzpPPZMYzfG5KE
 TGmDm8SPQaWw4b0aVmCxQEb5aHNSmfnw=
X-Gm-Gg: AZuq6aIbnK8PGHB5/iD/np2XubqkYqvD95glDfpP3qNnkLrqP9xEykFHUH4YEH6DVy2
 TgzagVr2blj7fd7QPYdkUIdwbeOzEdfgYzXhANg4ZY9Cnp4Kjdv+d2s85dLLiDEbpKZW5jdmQzv
 /dmlv+CZnxZQ+b3lCzJAHSPLIfBQ5FWvD/FR7NywAFYbBjJ+wVQIL5OxFMz8pmUgmt4L2MG6p4I
 FxmSpYslaO4r6EmG/iqUT+3zU+qeHtr3vkS+snvekeiNg6AfqW5VDZ41WKNpafeirOcBfFTGRZo
 iO1mDQdaewxA5EL00JSkX2w71fc8z0btatGk1EnTJTZB1yYZvegb1Os=
X-Received: by 2002:a05:6214:260b:b0:880:51f0:5b93 with SMTP id
 6a1803df08f44-894e9fe6cbemr81159006d6.18.1769828470148; Fri, 30 Jan 2026
 19:01:10 -0800 (PST)
MIME-Version: 1.0
References: <97af2d85-a905-44d4-951f-e56a40f4312e@nvidia.com>
 <20260130015901.GA301119@joelbox2>
 <c064fbdc-9202-437d-80ff-6134d2a33778@nvidia.com>
 <70d88203-2fe1-4bde-b254-51e8107744eb@nvidia.com>
In-Reply-To: <70d88203-2fe1-4bde-b254-51e8107744eb@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 31 Jan 2026 13:00:58 +1000
X-Gm-Features: AZwV_QikuSqbC3QYogib7-81aPfnOToX57Ol8yNxSKEx4_hXbDFs8a3hQtETIYo
Message-ID: <CAPM=9twm1x9rH==uoGQLYa8b4feQMz=Ne14WPuhCPy9_H1u5Tw@mail.gmail.com>
Subject: Re: [PATCH RFC v6 05/26] nova-core: mm: Add support to use PRAMIN
 windows to write to VRAM
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Zhi Wang <zhiw@nvidia.com>, linux-kernel@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, 
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rui Huang <ray.huang@amd.com>, 
 Matthew Auld <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, 
 Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, Bjorn Roy Baron <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Alistair Popple <apopple@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, 
 Andy Ritger <aritger@nvidia.com>, Alexey Ivanov <alexeyi@nvidia.com>, 
 Balbir Singh <balbirs@nvidia.com>, Philipp Stanner <phasta@kernel.org>, 
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Sat, 31 Jan 2026 at 07:14, Joel Fernandes <joelagnelf@nvidia.com> wrote:
>
>
>
> On 1/29/2026 10:38 PM, John Hubbard wrote:
> > On 1/29/26 5:59 PM, Joel Fernandes wrote:
> >> On 1/29/26 8:12 PM, John Hubbard wrote:
> >>> On 1/29/26 4:26 PM, Joel Fernandes wrote:
> >>>> Based on the below discussion and research, I came up with some deadlock
> >>>> scenarios that we need to handle in the v6 series of these patches.
> >>>> [...]
> >>>> memory allocations under locks that we need in the dma-fence signaling
> >>>> critical path (when doing the virtual memory map/unmap)
> >>>
> >>> unmap? Are you seeing any allocations happening during unmap? I don't
> >>> immediately see any, but that sounds surprising.
> >>
> >> Not allocations but we are acquiring locks during unmap. My understanding
> >> is (at least some) unmaps have to also be done in the dma fence signaling
> >> critical path (the run stage), but Danilo/you can correct me if I am wrong
> >> on that. We cannot avoid all locking but those same locks cannot be held in
> >> any other paths which do a memory allocation (as mentioned in one of the
> >> deadlock scenarios), that is probably the main thing to check for unmap.
> >>
> >
> > Right, OK we are on the same page now: no allocations happening on unmap,
> > but it can still deadlock, because the driver is typically going to
> > use a single lock to protect calls both map and unmap-related calls
> > to the buddy allocator.
>
> Yes exactly!
>
> >
> > For the deadlock above, I think a good way to break that deadlock is
> > to not allow taking that lock in a fence signaling calling path.
> >
> > So during an unmap, instead of "lock, unmap/free, unlock" it should
> > move the item to a deferred-free list, which is processed separately.
> > Of course, this is a little complex, because the allocation and reclaim
> > has to be aware of such lists if they get large.
> Yes, also avoiding GFP_KERNEL allocations while holding any of these mm locks
> (whichever we take during map). The GPU buddy actually does GFP_KERNEL
> allocations internally which is problematic.
>
> Some solutions / next steps:
>
> 1. allocating (VRAM and system memory) outside mm locks just before acquiring them.
>
> 2. pre-allocating both VRAM and system memory needed, before the DMA fence
> critical paths (The issue is also to figure out how much memory to pre-allocate
> for the page table pages based on the VM_BIND request. I think we can analyze
> the page tables in the submit stage to make an estimate).
>
> 3. Unfortunately, I am using gpu-buddy when allocating a VA range in the Vmm
> (called virt_buddy), which itself does GFP_KERNEL memory allocations in the
> allocate path. I am not sure what do yet about this. ISTR the maple tree also
> has similar issues.
>
> 4. Using non-reclaimable memory allocations where pre-allocation or
> pre-allocated memory pools is not possible (I'd like to avoid this #4 so we
> don't fail allocations when memory is scarce).
>
> Will work on these issues for the v7. Thanks,

The way this works on nouveau at least (and I haven't yet read the
nova code in depth).

Is we have 4 stages of vmm page table mgmt.

ref - locked with a ref lock - can allocate/free memory - just makes
sure the page tables exist and are reference counted
map - locked with a map lock - cannot allocate memory - fill in the
PTEs in the page table
unmap - locked with a map lock - cannot allocate memory - removes
entries in PTEs
unref - locked with a ref lock - can allocate/free memory - just drops
references and frees (not sure if it ever merges).

So maps and unmaps can be in fence signalling paths, but unrefs are
done in free job from a workqueue.

Dave.
>
> --
> Joel Fernandes
>
