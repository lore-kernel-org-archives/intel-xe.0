Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37493E9B24E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 10:50:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE44A10E26E;
	Tue, 24 Feb 2026 10:50:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FQSa2ju6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF3B010E26E
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 10:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771930204; x=1803466204;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=83IWhIdaSLCa0s1FPgp1COeUV4VkpPvPU6UI11hGGTI=;
 b=FQSa2ju6WU3GG2SX2cCp4IPrJos3qIfd8qny7vftH0Pr+QqfBgc76a1k
 ZRfPrat0sfAa9MvJNpiw6U1kmTGWQLj19dl8GSVJEbNP/Q7CTuCGK1BHl
 5icCzP/85AITLFDLXtrhyTVFCMvY5cZC2nBfPCcW+dua8yFKC1HJA1km+
 pNnHkSRRVmwq0LocGY1eqmPQX2rjUgdk0rknHjhSMTEqFQYJYT10SHD8c
 vWiHO03b8h+hLXRg7tsAO/zomyfVLD8Dk7tIvMUUCKAnPMkODZ9hUcOXU
 1TWgeXcbrJg+8yP+JnMBai0hDKy2cgeXvPRYRiGZaOHUUoxnumpHBDZbi A==;
X-CSE-ConnectionGUID: FzgDgIpFTDeovM929/qSGg==
X-CSE-MsgGUID: H9Z+9sD1QzGnTnMKQ2nfxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72914384"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="72914384"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 02:50:03 -0800
X-CSE-ConnectionGUID: 4mb8EEvNSWG2MKFiZuUA5A==
X-CSE-MsgGUID: eqmWpBKpQ5amiunWkixlbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="238849118"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.148])
 ([10.245.244.148])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 02:50:02 -0800
Message-ID: <2d3c01e8f75f050a9831c4f6802d9d109327a4f9.camel@linux.intel.com>
Subject: Re: [PATCH v5 1/9] drm/xe/uapi: Add UAPI support for purgeable
 buffer objects
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com, 
 pallavi.mishra@intel.com
Date: Tue, 24 Feb 2026 11:50:00 +0100
In-Reply-To: <20260211152644.1661165-2-arvind.yadav@intel.com>
References: <20260211152644.1661165-1-arvind.yadav@intel.com>
 <20260211152644.1661165-2-arvind.yadav@intel.com>
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

On Wed, 2026-02-11 at 20:56 +0530, Arvind Yadav wrote:
> From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>=20
> Extend the DRM_XE_MADVISE ioctl to support purgeable buffer object
> management by adding DRM_XE_VMA_ATTR_PURGEABLE_STATE attribute type.
>=20
> This allows userspace applications to provide memory usage hints to
> the kernel for better memory management under pressure:
>=20
> - WILLNEED: Buffer is needed and should not be purged. If the BO was
> =C2=A0 previously purged, retained field returns 0 indicating backing
> store
> =C2=A0 was lost (once purged, always purged semantics matching i915).
>=20
> - DONTNEED: Buffer is not currently needed and may be purged by the
> =C2=A0 kernel under memory pressure to free resources. Only applies to
> =C2=A0 non-shared BOs.
>=20
> The implementation includes a 'retained' output field (matching
> i915's
> drm_i915_gem_madvise.retained) that indicates whether the BO's
> backing
> store still exists (1) or has been purged (0).
>=20
> v2:
> =C2=A0 - Add PURGED state for read-only status, change ioctl to DRM_IOWR,
> =C2=A0=C2=A0=C2=A0 add retained field for i915 compatibility
>=20
> v3:
> =C2=A0 - UAPI rule should not be changed (Matthew Brost)
> =C2=A0 - Make 'retained' a userptr (Matthew Brost)
>=20
> v4:
> =C2=A0 - You cannot make this part of the union (purge_state_val) larger
> =C2=A0=C2=A0=C2=A0 than the existing union (16 bytes). So just drop the '=
__u64
> reserved'
> =C2=A0=C2=A0=C2=A0 field. (Matt)
>=20
> v5:
> =C2=A0 - Update UAPI documentation to clarify retained must be initialize=
d
> =C2=A0=C2=A0=C2=A0 to 0(Thomas)
>=20
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray
> <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
> =C2=A0include/uapi/drm/xe_drm.h | 44
> +++++++++++++++++++++++++++++++++++++++
> =C2=A01 file changed, 44 insertions(+)
>=20
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 077e66a682e2..3e2f145e7f8f 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -2099,6 +2099,7 @@ struct drm_xe_madvise {
> =C2=A0#define DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC	0
> =C2=A0#define DRM_XE_MEM_RANGE_ATTR_ATOMIC		1
> =C2=A0#define DRM_XE_MEM_RANGE_ATTR_PAT		2
> +#define DRM_XE_VMA_ATTR_PURGEABLE_STATE		3
> =C2=A0	/** @type: type of attribute */
> =C2=A0	__u32 type;
> =C2=A0
> @@ -2189,6 +2190,49 @@ struct drm_xe_madvise {
> =C2=A0			/** @pat_index.reserved: Reserved */
> =C2=A0			__u64 reserved;
> =C2=A0		} pat_index;
> +
> +		/**
> +		 * @purge_state_val: Purgeable state configuration
> +		 *
> +		 * Used when @type =3D=3D
> DRM_XE_VMA_ATTR_PURGEABLE_STATE.
> +		 *
> +		 * Configures the purgeable state of buffer objects
> in the specified
> +		 * virtual address range. This allows applications
> to hint to the kernel
> +		 * about bo's usage patterns for better memory
> management.
> +		 *
> +		 * Supported values for @purge_state_val.val:
> +		 *=C2=A0 - DRM_XE_VMA_PURGEABLE_STATE_WILLNEED (0): Marks
> BO as needed.
> +		 *=C2=A0=C2=A0=C2=A0 If BO was purged, returns retained=3D0 (backing
> store lost).
> +		 *
> +		 *=C2=A0 - DRM_XE_VMA_PURGEABLE_STATE_DONTNEED (1): Hints
> that BO is not
> +		 *=C2=A0=C2=A0=C2=A0 currently needed. Kernel may purge it under
> memory pressure.
> +		 *=C2=A0=C2=A0=C2=A0 Only applies to non-shared BOs. Returns
> retained=3D1 if not purged.
> +		 */
> +		struct {
> +#define DRM_XE_VMA_PURGEABLE_STATE_WILLNEED	0
> +#define DRM_XE_VMA_PURGEABLE_STATE_DONTNEED	1
> +			/** @purge_state_val.val: value for
> DRM_XE_VMA_ATTR_PURGEABLE_STATE */
> +			__u32 val;
> +
> +			/* @purge_state_val.pad */
> +			__u32 pad;
> +			/**
> +			 * @purge_state_val.retained: Pointer to
> output field for backing
> +			 * store status.
> +			 *
> +			 * Userspace must initialize this field to 0
> before the
> +			 * ioctl. Kernel writes to it after the
> operation:
> +			 * - 1 if backing store exists (not purged)
> +			 * - 0 if backing store was purged
> +			 *
> +			 * If userspace fails to initialize to 0,
> ioctl returns -EINVAL.
> +			 * This ensures a safe default (0 =3D assume
> purged) if kernel
> +			 * cannot write the result.
> +			 *
> +			 * Similar to i915's
> drm_i915_gem_madvise.retained field.
> +			 */
> +			__u64 retained;
> +		} purge_state_val;
> =C2=A0	};
> =C2=A0
> =C2=A0	/** @reserved: Reserved */

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
