Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA14CD343B
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 06:31:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E18D10EF76;
	Thu,  7 May 2026 06:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bShL6kkY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF45510EF76
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 06:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778135506; x=1809671506;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=RYmcnkXdP8SDw3AKhAxZBvjc1xfPWqzXEdvyvujwoC4=;
 b=bShL6kkYfe3TV977jeAc1vq27XzBJoHUOGwEGnzqvpPJMgx+J4sTKR6O
 AnxNBvI2Rmpy8hGpQ84wYyzxD2kxcp3/HoAE2a5x1fO4r0OyF66uoRXYG
 29XBPteDK0iilqbHCTpKjK1QFnEFigr7GsBoYGRzK5ZeTU4uKY9Trb8Z4
 6B1n+Xo9NUdhvtWvPsmnv4+kPuqVz7xJjlAyGiaHv61bBB0uBD/Zi9Z28
 3CDlaVHKDTiYI1lbsFkZBp4Te5UDNJfM9QqONgpKPOaH3Ek0n+5ek52+O
 fOxV6zHCi+XE9KXMrtxr8AnBXQYzSE8SWN/zMVzV2U/O4ZY0CYLomk4Dl w==;
X-CSE-ConnectionGUID: 9HQOL8suQzGf3LnMbGggUw==
X-CSE-MsgGUID: 0WvQXJnUSPqy827Jn0kGCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="90455073"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="90455073"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 23:31:45 -0700
X-CSE-ConnectionGUID: cp43u5yqQrW/QSpuZn2daw==
X-CSE-MsgGUID: Qk/p/9ZjS/qfmmdTifxozQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="235375465"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.245.94])
 ([10.245.245.94])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 23:31:44 -0700
Message-ID: <7977ff722a61b0e235e3c8007d474ffb2e7b9506.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Add bounds check for num_binds to prevent
 memory exhaustion
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, Ramesh Adhikari
 <adhikari.resume@gmail.com>
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com, 
 stable@vger.kernel.org
Date: Thu, 07 May 2026 08:31:40 +0200
In-Reply-To: <afuWYH88a4UaABXs@gsse-cloud1.jf.intel.com>
References: <20260506180636.23771-1-adhikari.resume@gmail.com>
 <afuWYH88a4UaABXs@gsse-cloud1.jf.intel.com>
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

On Wed, 2026-05-06 at 12:28 -0700, Matthew Brost wrote:
> On Wed, May 06, 2026 at 11:36:36PM +0530, Ramesh Adhikari wrote:
> > The xe_vm_bind_ioctl function accepts user-controlled num_binds
> > without
> >=20
> > bounds checking, allowing arbitrarily large memory allocations.
> > This
> >=20
> > follows the same vulnerability pattern that was fixed for num_syncs
> > in
> >=20
> > commit 8e461304009d ("drm/xe: Limit num_syncs to prevent huge
> > allocations").
> >=20
>=20
> The difference here is we issues kvmalloc (2G) vs kmalloc (4M) in the
> sync case. So still possible a user triggers kvmalloc over 2G...
>=20
> > Add DRM_XE_MAX_BINDS (1024) limit and validate num_binds before
> > allocation,
> >=20
> > matching the num_syncs fix pattern.
> >=20
> > Similar unbounded allocations exist for num_mem_ranges and OA
> > n_regs,
> >=20
> > which should be addressed in follow-up patches.
> >=20
> > Cc: stable@vger.kernel.org
> >=20
> > Signed-off-by: Ramesh <adhikari.resume@gmail.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_vm.c | 5 +++++
> > =C2=A0include/uapi/drm/xe_drm.h=C2=A0 | 1 +
> > =C2=A02 files changed, 6 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > b/drivers/gpu/drm/xe/xe_vm.c
> > index a717a2b8dea..1ff66874f43 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -3841,6 +3841,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> > void *data, struct drm_file *file)
> > =C2=A0		return -EINVAL;
> > =C2=A0
> > =C2=A0	err =3D vm_bind_ioctl_check_args(xe, vm, args, &bind_ops);
> > +
> > +	if (XE_IOCTL_DBG(xe, args->num_binds > DRM_XE_MAX_BINDS))
> > {
> > +		err =3D -EINVAL;kvmalloc
> > +		goto put_vm;
> > +	}
>=20
> We had something like this early Xe, IIRC, the max was 512 but we
> found
> for Vk / Mesa they will a huge number in an array of binds. So 1k
> likely
> isn't enough and this patch would be considered uAPI regression, so
> this
> as is a no go. Maybe we can figure out some reasonable upper bound
> (64k,
> 128k), idk.

IIRC we debated this back and forth. The challenging argument was that
if we consume all memory we'd get an error back, which is sort of true
but then we should've really made sure that all memory allocated was
also accounted against the cgroup, with __GFP_ACCOUNT. We only did that
for one large allocation.

But I think we made sure to avoid future regressions (functional, not
performance) by requiring UMD to handle -ENOBUFS, meaning "split the
array bind and retry". So whatever limit we come up with we should not
return -EINVAL but -ENOBUFS.=20

Thanks,
Thomas



>=20
> Matt
>=20
> > =C2=A0	if (err)
> > =C2=A0		goto put_vm;
> > =C2=A0
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index ae2fda23ce7..804ccb23b11 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -1606,6 +1606,7 @@ struct drm_xe_exec {
> > =C2=A0	__u32 exec_queue_id;
> > =C2=A0
> > =C2=A0#define DRM_XE_MAX_SYNCS 1024
> > +#define DRM_XE_MAX_BINDS 1024
> > =C2=A0	/** @num_syncs: Amount of struct drm_xe_sync in array. */
> > =C2=A0	__u32 num_syncs;
> > =C2=A0
> > --=20
> > 2.43.0
> >=20
