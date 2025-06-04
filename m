Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA3AC5B543
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 15:30:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 748A310E752;
	Wed,  4 Jun 2025 15:30:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e12uEv8G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35CC310E696
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 15:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749051020; x=1780587020;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ci6s7PenJ+dtLr4AIM+qVA3vKGYl1MxHQxSvAQqgmTg=;
 b=e12uEv8GijWWcPGFsz1ivo0eB/GIxyXHnmFJjrl/buBjlhXBlvmrqE6u
 X4oZA4kE8wmr9ogKuguPHGK67HnfPzvT1ACx6LrzDvO9PTORiXA0oG5sG
 TlVClCa2k0dk5D8/LQyVwdopl0QhF6HmHDSsuSqwpcefniQ5/3TDisOtR
 ILBhCIqVRUNohJAS9xaFBEjuT0g8UFstjoji2k16/QnmcPZytLJNTiVRJ
 WrSoPRTVuC7F9qVc4coeGR5r2Il3IkdXBspXA3r6MxDefbKK82chlemBb
 PdC9a+3szuR2Fr3Dva4fbzBizuBMUQvTmBylHFF8w5R4kZMAHnZuOQZvB A==;
X-CSE-ConnectionGUID: jKChBq96TDWhRPwFjne33Q==
X-CSE-MsgGUID: bRYf/uunR3aBoAAQ6EvQmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="68577700"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="68577700"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 08:30:20 -0700
X-CSE-ConnectionGUID: dhXLD2n2Q6OkO1mSTzhc8g==
X-CSE-MsgGUID: 2Kly2jH9SB6nKjvpGTR8kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="150501246"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.121])
 ([10.245.245.121])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 08:30:18 -0700
Message-ID: <739ca984c2f60e5ddd5c06de1e435ac82ce66f57.camel@linux.intel.com>
Subject: Re: VM madvise semantics
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Date: Wed, 04 Jun 2025 17:30:16 +0200
In-Reply-To: <aEBY9hLSlgNJM5GH@phenom.ffwll.local>
References: <0e5a09490934b1332e13829c705af98026372300.camel@linux.intel.com>
 <aEBY9hLSlgNJM5GH@phenom.ffwll.local>
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

On Wed, 2025-06-04 at 16:32 +0200, Simona Vetter wrote:
> On Wed, Jun 04, 2025 at 02:57:50PM +0200, Thomas Hellstr=C3=B6m wrote:
> > Hi!
> >=20
> > I'm starting an email thread to move forward the questions Himal
> > had on
> > the madvise semantics:
> >=20
> > 1) Whether to support an array of ops?=20
> >=20
> > IMO the VM_BIND implementation got very complicated due to this and
> > the
> > needed rollback support. Perhaps due to single op splitting turning
> > to
> > multiple ops it would've been hard to avoid that. Can we avoid
> > supporting an array of ops for madvise? If so I'd vote for single
> > op.
>=20
> Just seen this fly by and wondering why you even want rollback
> support?
>=20
> Looking at core mm and the various m* syscalls that manipulate vma,
> they
> just bail out if things fail halfway through. Or at least don't make
> any
> guarantees, userspace gets to keep the pieces.
>=20
> And I think that's the semantics we want, because making global
> promises
> around rollback means we need atomicity, which means fine-grained
> locking
> is out. And that doesn't sound like the right way to design this
> stuff to
> me?
>=20
> Or is there some userspace requirement that wants rollback for some
> strange reason?

So the rollback was in the context of submitting an array of multiple
VM_BINDs in a single IOCTL, and the nth one failed. That makes it
troublesome for user-space to recover. And in particular in the
situation where there was a signal delivery and the IOCTL is supposed
to be restartable without any user-space-modification of the arguments.

At that time after long discussions and looking at how, for example the
write() syscall behaves, when -EINTR happens, no write is done and the
syscall can be restarted from scratch. Following that we decided that
if that multiple-bind hit an -EINTR, we'd need to roll back, and since
we already had a rollback we'd do the same for all errors. IIRC
blocking signals wasn't an option. But agreed this puts us in a
situation where fine-grained locking is out with that interface, at
least with multiple binds or ops that generate multiple sub-operations.

So my suggestion here is to avoid the array for madvise, also avoiding
rollbacks if possible.

/Thomas



>=20
> Cheers, Sima
>=20
> > 2) Purgeability. If it's not implemented yet we shouldn't merge an
> > uapi
> > for it, but ensure that it would at least be possible moving
> > forward.=20
> >=20
> > 3) Multi-device. In the spirit of the above I guess it makes sense
> > if
> > UMD wants to select between VRAM and SRAM now to merge an interface
> > that supports *only* that. When we add multi-device support we
> > could
> > perhaps add another op, or an extension to support agreed multi-
> > device
> > semantics. Even if this means rolling back to Himal's original
> > suggestion of a preferred placement UAPI.
> >=20
> > Thoughts?
> >=20
> > Thomas
> >=20
>=20

