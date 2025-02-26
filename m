Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB1FEC021B8
	for <intel-xe@archiver.kernel.org>; Wed, 26 Feb 2025 15:46:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79A3E10E943;
	Wed, 26 Feb 2025 15:46:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OygLUs35";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D0A810E943
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Feb 2025 15:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740584801; x=1772120801;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=AxaTEhM5IycwKCBxxWZYxXGGBG5GdFGZsmfJu1iszUo=;
 b=OygLUs35E/mer+cIdyDUGp1hIFHxR1/SqiJiquqj5ubpQsr77FBN7WwW
 E7VXEhgfOOa4nLGcsZTI9Z88H8Iq8AJ/smsGBy/0Ay61soZTe0+EuMdFo
 tI3OSTvrxpSdfLQp0zDWQliaio0xQQy9iRvdU4LJytQZU5WAsn5jOCl8A
 z+f/X/nt1EqcAO/wkC63ytPU3cY1cbmeeIVmFY374tzN3of6ywpB+rqxV
 yvZ2m0sFBJMF8UqT+G+5EXIfsJjnSJNx5V/9jQqocjilMUX9+2RYwGpfy
 S09m4XV66vxk/iBU+I+VZcha3bbOuKrA1xTaHxIOL6F4EkC43jF+01uYx w==;
X-CSE-ConnectionGUID: gdb0cEHVQvK5qr856t8jFA==
X-CSE-MsgGUID: skyLWsTKTj6i3XwyfGqt9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="40615619"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; d="scan'208";a="40615619"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 07:46:40 -0800
X-CSE-ConnectionGUID: oFAsXXbsS/2/Sj/r/Hovdw==
X-CSE-MsgGUID: C1M6vDwjRfKXnzNHRiB4IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117232269"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.246.81])
 ([10.245.246.81])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 07:46:39 -0800
Message-ID: <bdc202030ec807149fc8805461779d8c8b1d5fe0.camel@linux.intel.com>
Subject: Re: [PATCH 1/4] drm/xe/vm: Validate userptr during gpu vma prefetching
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, stable@vger.kernel.org
Date: Wed, 26 Feb 2025 16:46:36 +0100
In-Reply-To: <Z7811mqgky+kKypb@lstrano-desk.jf.intel.com>
References: <20250226153344.58175-1-thomas.hellstrom@linux.intel.com>
 <20250226153344.58175-2-thomas.hellstrom@linux.intel.com>
 <Z7811mqgky+kKypb@lstrano-desk.jf.intel.com>
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

On Wed, 2025-02-26 at 07:40 -0800, Matthew Brost wrote:
> On Wed, Feb 26, 2025 at 04:33:41PM +0100, Thomas Hellstr=C3=B6m wrote:
> > If a userptr vma subject to prefetching was already invalidated
> > or invalidated during the prefetch operation, the operation would
> > repeatedly return -EAGAIN which would typically cause an infinite
> > loop.
> >=20
> > Validate the userptr to ensure this doesn't happen.
> >=20
> > Fixes: 5bd24e78829a ("drm/xe/vm: Subclass userptr vmas")
> > Fixes: 617eebb9c480 ("drm/xe: Fix array of binds")
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: <stable@vger.kernel.org> # v6.9+
> > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_vm.c | 9 ++++++++-
> > =C2=A01 file changed, 8 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > b/drivers/gpu/drm/xe/xe_vm.c
> > index 996000f2424e..4c1ca47667ad 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -2307,7 +2307,14 @@ static int vm_bind_ioctl_ops_parse(struct
> > xe_vm *vm, struct drm_gpuva_ops *ops,
> > =C2=A0		}
> > =C2=A0		case DRM_GPUVA_OP_UNMAP:
> > =C2=A0		case DRM_GPUVA_OP_PREFETCH:
> > -			/* FIXME: Need to skip some prefetch ops
> > */
>=20
> The UNMAP case statement is falling through to pretech case which I
> believe is not the intent.
>=20
> So I think:
>=20
> case DRM_GPUVA_OP_UNMAP:
> 	xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
> 	break;
> case DRM_GPUVA_OP_PREFETCH:
> 	<new code>
>=20
> Matt

Right.
Will fix.

/Thomas

>=20
> > +			vma =3D gpuva_to_vma(op->base.prefetch.va);
> > +
> > +			if (xe_vma_is_userptr(vma)) {
> > +				err =3D
> > xe_vma_userptr_pin_pages(to_userptr_vma(vma));
> > +				if (err)
> > +					return err;
> > +			}
> > +
> > =C2=A0			xe_vma_ops_incr_pt_update_ops(vops, op-
> > >tile_mask);
> > =C2=A0			break;
> > =C2=A0		default:
> > --=20
> > 2.48.1
> >=20

