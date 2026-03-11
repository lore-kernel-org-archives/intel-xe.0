Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C36FD0655
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 08:25:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77ABF10E38F;
	Wed, 11 Mar 2026 08:25:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dkWBSPAF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DEEE10E38F
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Mar 2026 08:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773217508; x=1804753508;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=dUWZtX8ZFIOeNVRe6LNu9T/yEug2Wa0ei4846CwM2Zc=;
 b=dkWBSPAFBrk6iVLni6G45K2oss/zfncUoBLCMv+0JFvxHZ0beWjbl7/b
 +O3zK53gUyBr+kescY8WK8oL5r7dJVTWbxIoDvqqrUs7pkXfdYsnIbmHd
 ToHcJPi7djypr13Cg/fg9wAOJhdc5E3NYv93f+RxOwtnCbgsMk3FY5nXk
 829in9I2+w/LecMMCqHhhZDYdxFgWoyRnYnC3OmfKFkrNF6pw9q+vFPRB
 NDBWiHm7ppRyoqNcJSGjki0ihAAOOCeFlm3ca7to7LgUii7GLrYdGdptd
 CbgMzNJo05kIlUxUXKvmwhHdst4fZ9UAXHE2kfnRcJJ2H3IshYKA/3HRm Q==;
X-CSE-ConnectionGUID: K4zPvjuLQN6gMd+bsVh0Ig==
X-CSE-MsgGUID: 7JuJIKueRC6hY7iNXt0r6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74153893"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="74153893"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 01:25:07 -0700
X-CSE-ConnectionGUID: Ig8PIclDSDOBWXA7fKI3AQ==
X-CSE-MsgGUID: onN2yFYCRd+MmGAwDB6QsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="220426403"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.244.202])
 ([10.245.244.202])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 01:25:07 -0700
Message-ID: <68e7fbf84fe0a509db5a6de5a47d861b0cfcb5c1.camel@linux.intel.com>
Subject: Re: [PATCH v4 1/4] mm/mmu_notifier: Allow two-pass struct
 mmu_interval_notifiers
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 11 Mar 2026 09:25:03 +0100
In-Reply-To: <9986a822-c7e6-45ac-bf74-899ca1a9363f@kernel.org>
References: <20260305093909.43623-1-thomas.hellstrom@linux.intel.com>
 <20260305093909.43623-2-thomas.hellstrom@linux.intel.com>
 <1efba81b-d4e9-405b-8ad5-0a170237902f@kernel.org>
 <81917cd6035774c73cd40e638707e4148519b981.camel@linux.intel.com>
 <9986a822-c7e6-45ac-bf74-899ca1a9363f@kernel.org>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
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

Replying to list address for reference.

On Fri, 2026-03-06 at 14:11 +0100, David Hildenbrand (Arm) wrote:
> On 3/6/26 14:05, Thomas Hellstr=C3=B6m wrote:
> > On Thu, 2026-03-05 at 15:00 +0100, David Hildenbrand (Arm) wrote:
> > > On 3/5/26 10:39, Thomas Hellstr=C3=B6m wrote:
> > > > GPU use-cases for mmu_interval_notifiers with hmm often involve
> > > > starting a gpu operation and then waiting for it to complete.
> > > > These operations are typically context preemption or TLB
> > > > flushing.
> > > >=20
> > > > With single-pass notifiers per GPU this doesn't scale in
> > > > multi-gpu scenarios. In those scenarios we'd want to first
> > > > start
> > > > preemption- or TLB flushing on all GPUs and as a second pass
> > > > wait
> > > > for them to complete.
> > > >=20
> > > > One can do this on per-driver basis multiplexing per-driver
> > > > notifiers but that would mean sharing the notifier "user" lock
> > > > across all GPUs and that doesn't scale well either, so adding
> > > > support
> > > > for multi-pass in the core appears to be the right choice.
> > > >=20
> > > > Implement two-pass capability in the mmu_interval_notifier. Use
> > > > a
> > > > linked list for the final passes to minimize the impact for
> > > > use-cases that don't need the multi-pass functionality by
> > > > avoiding
> > > > a second interval tree walk, and to be able to easily pass data
> > > > between the two passes.
> > > >=20
> > > > v1:
> > > > - Restrict to two passes (Jason Gunthorpe)
> > > > - Improve on documentation (Jason Gunthorpe)
> > > > - Improve on function naming (Alistair Popple)
> > > > v2:
> > > > - Include the invalidate_finish() callback in the
> > > > =C2=A0 struct mmu_interval_notifier_ops.
> > > > - Update documentation (GitHub Copilot:claude-sonnet-4.6)
> > > > - Use lockless list for list management.
> > > > v3:
> > > > - Update kerneldoc for the struct
> > > > mmu_interval_notifier_finish::list member
> > > > =C2=A0 (Matthew Brost)
> > > > - Add a WARN_ON_ONCE() checking for NULL invalidate_finish() op
> > > > if
> > > > =C2=A0 if invalidate_start() is non-NULL. (Matthew Brost)
> > > > v4:
> > > > - Addressed documentation review comments by David Hildenbrand.
> > > >=20
> > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > Cc: David Hildenbrand <david@kernel.org>
> > > > Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > > Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
> > > > Cc: Vlastimil Babka <vbabka@kernel.org>
> > > > Cc: Mike Rapoport <rppt@kernel.org>
> > > > Cc: Suren Baghdasaryan <surenb@google.com>
> > > > Cc: Michal Hocko <mhocko@suse.com>
> > > > Cc: Jason Gunthorpe <jgg@ziepe.ca>
> > > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > > Cc: Simona Vetter <simona.vetter@ffwll.ch>
> > > > Cc: Dave Airlie <airlied@gmail.com>
> > > > Cc: Alistair Popple <apopple@nvidia.com>
> > > > Cc: <dri-devel@lists.freedesktop.org>
> > > > Cc: <linux-mm@kvack.org>
> > > > Cc: <linux-kernel@vger.kernel.org>
> > > >=20
> > > > Assisted-by: GitHub Copilot:claude-sonnet-4.6 # Documentation
> > > > only.
> > > > Signed-off-by: Thomas Hellstr=C3=B6m
> > > > <thomas.hellstrom@linux.intel.com>
> > > > ---
> > >=20
> > > LGTM, thanks!
> > >=20
> > > Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> >=20
> > Thanks, David.
> >=20
> > Ack to merge this through drm together with the drm/xe patches?
>=20
> Works for me, let me CC Andrew for awareness.
>=20
> >=20
> > If so, do I need an additional R-B in addition to any drm/xe
> > reviewers?
>=20
> Not from MM people :)
