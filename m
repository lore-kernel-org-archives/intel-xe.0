Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82BCAD3EE67
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 13:32:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4659810E031;
	Thu, 22 Jan 2026 13:32:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZtPssngU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F1B610E031
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jan 2026 13:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769088771; x=1800624771;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=INhbbEKICsRAM7G3EBZ65UvbjdM/MWVVYb+vPF/4D00=;
 b=ZtPssngUp66DBxL/F4/tkYlWhVMn1WoGRzM0e9j7C3oFHy0bu6WbFf3V
 Jdpt0BuQiVEtTUYGl+sQLGg+FywLxoDzJPjv+a5SqFCr9U5UF6codi/Wn
 3sPNC2wHl0u0Yhny6goxf6pYOZqC20sHyQUmlsjusSiT2AM/7UPh/v7Ob
 wnl978Hp8pM8ZhHoF8B8rz94pYhrMiIQ2hl4nCq08cPflae22hoEgvnmW
 s9UgaP5gZxQRUkuoRUQr22htSaTeJ9CGIXPfzZP/+19pI8sLt8Fl8bLe8
 YOaYP3+ALryXtog6D1MNXdS8DGI0alYMhnQ4RHZfDqWzwKdO57qctc75K A==;
X-CSE-ConnectionGUID: Z7lRoiDdSQe4jDdNpW0VTQ==
X-CSE-MsgGUID: 5RGmGan3RUOnSrX8ltNe6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70300884"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="70300884"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 05:32:50 -0800
X-CSE-ConnectionGUID: bsqCtgA3Q+u0Qh0Pmi2F4g==
X-CSE-MsgGUID: rQ+M1P9GRsmVif6Pts2eYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="210874760"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.245.235])
 ([10.245.245.235])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 05:32:49 -0800
Message-ID: <dcdf3a9d9ad37189f62ddf92d9637ebe9e221641.camel@linux.intel.com>
Subject: Re: [RFC v3 1/8] drm/xe/uapi: Add UAPI support for purgeable buffer
 objects
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: "Yadav, Arvind" <arvind.yadav@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, himal.prasad.ghimiray@intel.com, 
 pallavi.mishra@intel.com
Date: Thu, 22 Jan 2026 14:32:45 +0100
In-Reply-To: <f656edf3-2555-4062-8d01-1df972ce5e9c@intel.com>
References: <20251210043112.3267620-1-arvind.yadav@intel.com>
 <20251210043112.3267620-2-arvind.yadav@intel.com>
 <aTkGIoPSL5xOWQ7R@lstrano-desk.jf.intel.com>
 <f656edf3-2555-4062-8d01-1df972ce5e9c@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
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

On Wed, 2025-12-10 at 12:46 +0530, Yadav, Arvind wrote:
>=20
> On 10-12-2025 11:03, Matthew Brost wrote:
> > On Wed, Dec 10, 2025 at 10:00:45AM +0530, Arvind Yadav wrote:
> > > From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > >=20
> > > Extend the DRM_XE_MADVISE ioctl to support purgeable buffer
> > > object
> > > management by adding DRM_XE_VMA_ATTR_PURGEABLE_STATE attribute
> > > type.
> > >=20
> > > This allows userspace applications to provide memory usage hints
> > > to
> > > the kernel for better memory management under pressure:
> > >=20
> > > This allows userspace applications to provide memory usage hints
> > > to
> > > the kernel for better memory management under pressure:
> > >=20
> > > - WILLNEED: Buffer is needed and should not be purged. If the BO
> > > was
> > > =C2=A0=C2=A0 previously purged, retained field returns 0 indicating b=
acking
> > > store
> > > =C2=A0=C2=A0 was lost (once purged, always purged semantics matching =
i915).
> > >=20
> > > - DONTNEED: Buffer is not currently needed and may be purged by
> > > the
> > > =C2=A0=C2=A0 kernel under memory pressure to free resources. Only app=
lies
> > > to
> > > =C2=A0=C2=A0 non-shared BOs.
> > >=20
> > > The implementation includes a 'retained' output field (matching
> > > i915's
> > > drm_i915_gem_madvise.retained) that indicates whether the BO's
> > > backing
> > > store still exists (1) or has been purged (0).
> > >=20
> > > v2:
> > > =C2=A0=C2=A0 - Add PURGED state for read-only status, change ioctl to
> > > DRM_IOWR,
> > > =C2=A0=C2=A0=C2=A0=C2=A0 add retained field for i915 compatibility
> > >=20
> > > v3:
> > > =C2=A0=C2=A0 - UAPI rule should not be changed (Matthew Brost)
> > > =C2=A0=C2=A0 - Make 'retained' a userptr (Matthew Brost)
> > >=20
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > > Signed-off-by: Himal Prasad Ghimiray
> > > <himal.prasad.ghimiray@intel.com>
> > > Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> > > ---
> > > =C2=A0 include/uapi/drm/xe_drm.h | 39
> > > +++++++++++++++++++++++++++++++++++++++
> > > =C2=A0 1 file changed, 39 insertions(+)
> > >=20
> > > diff --git a/include/uapi/drm/xe_drm.h
> > > b/include/uapi/drm/xe_drm.h
> > > index 876a076fa6c0..fc0dada62dd0 100644
> > > --- a/include/uapi/drm/xe_drm.h
> > > +++ b/include/uapi/drm/xe_drm.h
> > > @@ -2079,6 +2079,7 @@ struct drm_xe_madvise {
> > > =C2=A0 #define DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC	0
> > > =C2=A0 #define DRM_XE_MEM_RANGE_ATTR_ATOMIC		1
> > > =C2=A0 #define DRM_XE_MEM_RANGE_ATTR_PAT		2
> > > +#define DRM_XE_VMA_ATTR_PURGEABLE_STATE		3
> > > =C2=A0=C2=A0	/** @type: type of attribute */
> > > =C2=A0=C2=A0	__u32 type;
> > > =C2=A0=20
> > > @@ -2157,6 +2158,44 @@ struct drm_xe_madvise {
> > > =C2=A0=C2=A0			/** @pat_index.reserved: Reserved */
> > > =C2=A0=C2=A0			__u64 reserved;
> > > =C2=A0=C2=A0		} pat_index;
> > > +
> > > +		/**
> > > +		 * @purge_state_val: Purgeable state
> > > configuration
> > > +		 *
> > > +		 * Used when @type =3D=3D
> > > DRM_XE_VMA_ATTR_PURGEABLE_STATE.
> > > +		 *
> > > +		 * Configures the purgeable state of buffer
> > > objects in the specified
> > > +		 * virtual address range. This allows
> > > applications to hint to the kernel
> > > +		 * about bo's usage patterns for better memory
> > > management.
> > > +		 *
> > > +		 * Supported values for @purge_state_val.val:
> > > +		 *=C2=A0 - DRM_XE_VMA_PURGEABLE_STATE_WILLNEED (0):
> > > Marks BO as needed.
> > > +		 *=C2=A0=C2=A0=C2=A0 If BO was purged, returns retained=3D0
> > > (backing store lost).
> > > +		 *
> > > +		 *=C2=A0 - DRM_XE_VMA_PURGEABLE_STATE_DONTNEED (1):
> > > Hints that BO is not
> > > +		 *=C2=A0=C2=A0=C2=A0 currently needed. Kernel may purge it
> > > under memory pressure.
> > > +		 *=C2=A0=C2=A0=C2=A0 Only applies to non-shared BOs. Returns
> > > retained=3D1 if not purged.
> > > +		 */
> > > +		struct {
> > > +#define DRM_XE_VMA_PURGEABLE_STATE_WILLNEED	0
> > > +#define DRM_XE_VMA_PURGEABLE_STATE_DONTNEED	1
> > > +			/** @purge_state_val.val: value for
> > > DRM_XE_VMA_ATTR_PURGEABLE_STATE */
> > > +			__u32 val;
> > > +
> > > +			/* @purge_state_val.pad */
> > > +			__u32 pad;
> > > +			/**
> > > +			 * @purge_state_val.retained: Pointer to
> > > output field for backing
> > > +			 * store status.
> > > +			 *
> > > +			 * Userspace provides a pointer to u32.
> > > Kernel writes to it:
> > > +			 * 1 if backing store exists, 0 if
> > > purged.
> > > +			 * Similar to i915's
> > > drm_i915_gem_madvise.retained field.
> > > +			 */
> > > +			__u64 retained;
> > > +			/** @purge_state_val.reserved: Reserved
> > > */
> > > +			__u64 reserved;
> > You cannot make this part of the union (purge_state_val) larger
> > than the
> > existing union (16 bytes) or the bit layout of the IOCTL changes
> > and the
> > uAPI breaks.
> >=20
> > So just drop the '__u64 reserved' field.
> Noted.
> >=20
> > I'll also follow up if we can change an IOCTL from DRM_IOW to
> > DRM_IOWR
> > too. I honestly don't know if that is allowed or not.
>=20
>=20
> Noted. Please update us once you have clarity on whether changing
> from=20
> DRM_IOW to DRM_IOWR is allowed, for future reference.

I think it is allowed, since AFAICT changing DRM_IOW to DRM_IOWR does
not change KMD code, only UMD code. So problem might occur only if a
UMD assumes one or the other.

/Thomas

>=20
> ~Arvind
>=20
> >=20
> > Matt
> >=20
> > > +		} purge_state_val;
> > > =C2=A0=C2=A0	};
> > > =C2=A0=20
> > > =C2=A0=C2=A0	/** @reserved: Reserved */
> > > --=20
> > > 2.43.0
> > >=20
