Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2BA9C19F2E
	for <intel-xe@archiver.kernel.org>; Wed, 26 Feb 2025 15:13:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADB4A10E93B;
	Wed, 26 Feb 2025 15:13:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xc7EcUGO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D3810E93B
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Feb 2025 15:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740582833; x=1772118833;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=0zQiYfaq4lZWlUQ2eaLvoDUHyd2/HsJTYebUYiCVgtQ=;
 b=Xc7EcUGOtRG0uaao0fExzNq8oj5DwbuRqc8YwM7Cnndgwv8QUjkeYUYW
 k2QmvEMkYW8Ki+iRemC4/2yz4FjnTETlHVLWTC4b4O8fIqskuKcFwrrDG
 9Vk8ihawhpq6HktP3Qpmahmqo19EEhUZ46Icx5NcF3gujGBbaIa1qHcjO
 jfCuBxVkAruuL3juK67DrF3dyb02lU23pQAMlCybaLiaI/saAFpGXpzLj
 PGj9mxh/MtMFks8kOuvG8K6YxsDu3YeTR89PsgMjQk/ggihWGyHDsjTjn
 r+pdY78M1ZTCvw5N+pNJqrKiWTQtbUCCL5b2yFWaV3ioSyjSEFB0sC27S Q==;
X-CSE-ConnectionGUID: ElmK/NdETnysh4JOSZWvsg==
X-CSE-MsgGUID: oihMNzjlTy2sA9Ekofzr9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41686862"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; d="scan'208";a="41686862"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 07:13:53 -0800
X-CSE-ConnectionGUID: fAWQZiw4TS2w6SYBTUHcng==
X-CSE-MsgGUID: f6gj4s8tQ1mrNj1BWwN/5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; d="scan'208";a="139940490"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.246.81])
 ([10.245.246.81])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 07:13:52 -0800
Message-ID: <a01fc6c3fb193574879f9d401accaa1385d32529.camel@linux.intel.com>
Subject: Re: [PATCH v4 1/2] drm/xe: Userptr invalidation race with binds fixes
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, matthew.auld@intel.com
Date: Wed, 26 Feb 2025 16:13:49 +0100
In-Reply-To: <Z74iu8n7Xe/mz6Uh@lstrano-desk.jf.intel.com>
References: <20250224170109.3078314-1-matthew.brost@intel.com>
 <20250224170109.3078314-2-matthew.brost@intel.com>
 <7c58c04c73e217e5cdcb473876b368c47b60bc6f.camel@linux.intel.com>
 <Z74Bo0no06PmV87O@lstrano-desk.jf.intel.com>
 <4267074055afdb298914de6658b64f89e55136c5.camel@linux.intel.com>
 <Z74Yrv/yHUyooxHW@lstrano-desk.jf.intel.com>
 <Z74iu8n7Xe/mz6Uh@lstrano-desk.jf.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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

On Tue, 2025-02-25 at 12:06 -0800, Matthew Brost wrote:
> On Tue, Feb 25, 2025 at 11:23:26AM -0800, Matthew Brost wrote:
> > On Tue, Feb 25, 2025 at 07:56:36PM +0100, Thomas Hellstr=C3=B6m wrote:
> > > On Tue, 2025-02-25 at 09:45 -0800, Matthew Brost wrote:
> > > > On Tue, Feb 25, 2025 at 03:30:54PM +0100, Thomas Hellstr=C3=B6m
> > > > wrote:
> > > > > Hi, Matt,
> > > > >=20
> > > > > On Mon, 2025-02-24 at 09:01 -0800, Matthew Brost wrote:
> > > > > > Always wait on dma-resv bookkeep slots if userptr
> > > > > > invalidation
> > > > > > has
> > > > > > raced
> > > > > > with a bind ensuring PTEs temporally setup to invalidated
> > > > > > pages
> > > > > > are
> > > > > > never accessed.
> > > > > >=20
> > > > > > Fixup initial bind handling always add VMAs to invalidation
> > > > > > list
> > > > > > and
> > > > > > wait dma-resv bookkeep slots.
> > > > > >=20
> > > > > > Always hold notifier across TLB invalidation in notifier to
> > > > > > prevent a
> > > > > > UAF if an unbind races.
> > > > > >=20
> > > > > > Including all of the above changes for Fixes patch in hopes
> > > > > > of an
> > > > > > easier
> > > > > > backport which fix a single patch.
> > > > > >=20
> > > > > > v2:
> > > > > > =C2=A0- Wait dma-resv bookkeep before issuing PTE zap (Thomas)
> > > > > > =C2=A0- Support scratch page on invalidation (Thomas)
> > > > > > v3:
> > > > > > =C2=A0- Drop clear of PTEs (Thomas)
> > > > >=20
> > > > > This was what I actually meant.
> > > > >=20
> > > >=20
> > > > Ok, I presented this as option and it wasn't clear to me this
> > > > was
> > > > preferred.
> > >=20
> > > Well, I think the more special cases we can get rid of in the
> > > code, the
> >=20
> > Sure, not opposed this direction.
> >=20
> > > better? Or at least, like in this case, split out what's common
> > > with
> > > the vm notifier into an xe_vm function and call that, making it
> > > more
> > > clear to the reader that we force an invalidation.
> > >=20
> > > >=20
> > > > > https://patchwork.freedesktop.org/patch/639489/?series=3D145409&r=
ev=3D1
> > > > >=20
> > > >=20
> > > > This patch is doesn't work.
> > > > xe_vm.munmap-style-unbind-userptr-one-partial hangs due the
> > > > error
> > > > injection always firing on a single user bind, so we'd have to
> > > > fix
> > > > the
> > > > error injection too.
> > >=20
> > > I have a follow up patch that splits out a part of the notifier
> > > like
> > > described above and calls that for each inject, also invalidating
> > > the
> > > userptr's seqno, and that fixes the above problem, but then the
> > > code
> > > hangs in=20
> > >=20
> >=20
> > Ok, that sounds good.
> > =C2=A0
> > > xe_exec_fault_mode --r once-userptr-prefetch
> > >=20
> > > but that's a different failure mode. Apparently the prefetch code
> > > doesn't repin an invalid userptr and returns -EAGAIN forever...
> > >=20
> >=20
> > I see the issue, we only call xe_vma_userptr_pin_pages in new_vma
> > which
> > the prefetch code bypasses. If the error inject messes with userptr
> > seqno it makes sense this would start to show up. I suppose this
> > needs
> > fixing too.
> >=20
>=20
> Something like this shoud do the trick:
>=20
> @@ -2299,8 +2299,16 @@ static int vm_bind_ioctl_ops_parse(struct
> xe_vm *vm, struct drm_gpuva_ops *ops,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 }
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 case DRM_GPUVA_OP_UNMAP:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_vma_ops_inc=
r_pt_update_ops(vops, op-
> >tile_mask);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 case DRM_GPUVA_OP_PREFETCH:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* FIXME: Need=
 to skip some prefetch ops */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vma =3D gpuva_=
to_vma(op->base.prefetch.va);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (xe_vma_is_=
userptr(vma)) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D xe_vma_is_userptr(vma);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (err)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 return err;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_vma_o=
ps_incr_pt_update_ops(vops, op-
> >tile_mask);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 default:
>=20
> Matt
>=20
> > Matt=20

Yeah, I'll try to put something together based on this + your staging
tree patch.

/Thomas

