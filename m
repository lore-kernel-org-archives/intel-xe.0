Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8659FCC9DE
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 08:31:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F2610E689;
	Tue, 10 Mar 2026 08:31:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KcuXoqop";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9304410E68B
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Mar 2026 08:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773131490; x=1804667490;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=cg3l156jvPQoomcBQfSgPJaBrnWo6EpAS9QZrExFr1g=;
 b=KcuXoqop/Pt3r5fWyJXA6Iq98HLchylDIqNY7TOdlrwd7TKwe2x3GcN3
 J31q7c3c2qD8QcNfCx014PqO2DqKtlYZY+OEJhEouPZBIuF3koFS+HCMZ
 SrF7/R+m9aupLAMVA5t++tWrvWC0KkOcJSHo8LEnGZcrMqFCnUgBPA5AG
 stOBHmwU1x+UPzoj0N1UKYoMumw+tLo6DYpEC2fl7PJtN10NNShpKcWBk
 13RTetKroYjGq5SuxVHTflbrYS+VuyARUOAVo3KbLOSrRauyjBdYYVqMc
 ETajvFC7S4b66qrDcLn/TkLSniTMZzcCwSAIwpO2UBTcWV3xe+EvrEmj8 w==;
X-CSE-ConnectionGUID: PrwBgrFKR4O3vL0LOKYj3w==
X-CSE-MsgGUID: 86ddCzcUShyTHEj5DwJvlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="85259828"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="85259828"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 01:31:30 -0700
X-CSE-ConnectionGUID: mNC3e2fFQZ64ptq75G9eXQ==
X-CSE-MsgGUID: xCa6tb0cTEOrAH72FB1y/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="243054603"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.39])
 ([10.245.244.39])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 01:31:28 -0700
Message-ID: <eb2263b1eac45e018d26bacdca65337e5120aff4.camel@linux.intel.com>
Subject: Re: [PATCH v6 01/12] drm/xe/uapi: Add UAPI support for purgeable
 buffer objects
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com, 
 pallavi.mishra@intel.com, Jose Souze <jose.souza@intel.com>
Date: Tue, 10 Mar 2026 09:31:26 +0100
In-Reply-To: <20260303152015.3499248-2-arvind.yadav@intel.com>
References: <20260303152015.3499248-1-arvind.yadav@intel.com>
 <20260303152015.3499248-2-arvind.yadav@intel.com>
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

On Tue, 2026-03-03 at 20:49 +0530, Arvind Yadav wrote:
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
> =C2=A0 To prevent undefined behavior, the following operations are blocke=
d
> =C2=A0 while a BO is in DONTNEED state:
> =C2=A0 - New mmap() operations return -EBUSY
> =C2=A0 - VM_BIND operations return -EBUSY
> =C2=A0 - New dma-buf exports return -EBUSY
> =C2=A0 - CPU page faults return SIGBUS
> =C2=A0 - GPU page faults fail with -EACCES
>=20
> =C2=A0 This ensures applications cannot use a BO while marked as DONTNEED=
,
> =C2=A0 preventing erratic behavior when the kernel purges the backing
> store.
>=20
> The implementation includes a 'retained' output field (matching
> i915's
> drm_i915_gem_madvise.retained) that indicates whether the BO's
> backing
> store still exists (1) or has been purged (0).
>=20
> Added DRM_XE_QUERY_CONFIG_FLAG_HAS_PURGING_SUPPORT flag to allow
> userspace to detect kernel support for purgeable buffer objects
> before attempting to use the feature.
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
> v6:
> =C2=A0 - Document DONTNEED BO access blocking behavior to prevent
> undefined
> =C2=A0=C2=A0=C2=A0 behavior and clarify uAPI contract (Thomas, Matt)
> =C2=A0 - Add query flag DRM_XE_QUERY_CONFIG_FLAG_HAS_PURGING_SUPPORT for
> =C2=A0=C2=A0=C2=A0 feature detection. (Jose)
> =C2=A0 - Rename retained to retained_ptr. (Jose)
>=20
> Cc: Jose Souze <jose.souza@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray
> <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


> ---
> =C2=A0include/uapi/drm/xe_drm.h | 60
> +++++++++++++++++++++++++++++++++++++++
> =C2=A01 file changed, 60 insertions(+)
>=20
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index ef2565048bdf..42aedd30189d 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -425,6 +425,7 @@ struct drm_xe_query_config {
> =C2=A0	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1
> << 1)
> =C2=A0	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR	(1
> << 2)
> =C2=A0	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT (1
> << 3)
> +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_PURGING_SUPPORT	(1
> << 4)
> =C2=A0#define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
> =C2=A0#define DRM_XE_QUERY_CONFIG_VA_BITS			3
> =C2=A0#define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
> @@ -2067,6 +2068,7 @@ struct drm_xe_query_eu_stall {
> =C2=A0 *=C2=A0 - DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC: Set preferred memor=
y
> location.
> =C2=A0 *=C2=A0 - DRM_XE_MEM_RANGE_ATTR_ATOMIC: Set atomic access policy.
> =C2=A0 *=C2=A0 - DRM_XE_MEM_RANGE_ATTR_PAT: Set page attribute table inde=
x.
> + *=C2=A0 - DRM_XE_VMA_ATTR_PURGEABLE_STATE: Set purgeable state for BOs.
> =C2=A0 *
> =C2=A0 * Example:
> =C2=A0 *
> @@ -2099,6 +2101,7 @@ struct drm_xe_madvise {
> =C2=A0#define DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC	0
> =C2=A0#define DRM_XE_MEM_RANGE_ATTR_ATOMIC		1
> =C2=A0#define DRM_XE_MEM_RANGE_ATTR_PAT		2
> +#define DRM_XE_VMA_ATTR_PURGEABLE_STATE		3
> =C2=A0	/** @type: type of attribute */
> =C2=A0	__u32 type;
> =C2=A0
> @@ -2189,6 +2192,63 @@ struct drm_xe_madvise {
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
> +		 *=C2=A0=C2=A0=C2=A0 If BO was previously purged, returns
> retained=3D0 (backing store lost).
> +		 *
> +		 *=C2=A0 - DRM_XE_VMA_PURGEABLE_STATE_DONTNEED (1): Marks
> BO as not currently
> +		 *=C2=A0=C2=A0=C2=A0 needed. Kernel may purge it under memory
> pressure to reclaim memory.
> +		 *=C2=A0=C2=A0=C2=A0 Only applies to non-shared BOs. Returns
> retained=3D1 if not purged yet.
> +		 *
> +		 *=C2=A0=C2=A0=C2=A0 Important: Once marked as DONTNEED, touching
> the BO's memory
> +		 *=C2=A0=C2=A0=C2=A0 is undefined behavior. It may succeed
> temporarily (before the
> +		 *=C2=A0=C2=A0=C2=A0 kernel purges the backing store) but will
> suddenly fail once
> +		 *=C2=A0=C2=A0=C2=A0 the BO transitions to PURGED state.
> +		 *
> +		 *=C2=A0=C2=A0=C2=A0 The following operations are blocked in
> DONTNEED state to
> +		 *=C2=A0=C2=A0=C2=A0 prevent the BO from being re-mapped after
> madvise:
> +		 *=C2=A0=C2=A0=C2=A0 - New mmap() calls: Fail with -EBUSY
> +		 *=C2=A0=C2=A0=C2=A0 - VM_BIND operations: Fail with -EBUSY
> +		 *=C2=A0=C2=A0=C2=A0 - New dma-buf exports: Fail with -EBUSY
> +		 *=C2=A0=C2=A0=C2=A0 - CPU page faults (existing mmap): Fail with
> SIGBUS
> +		 *=C2=A0=C2=A0=C2=A0 - GPU page faults (fault-mode VMs): Fail with
> -EACCES
> +		 */
> +		struct {
> +#define DRM_XE_VMA_PURGEABLE_STATE_WILLNEED	0
> +#define DRM_XE_VMA_PURGEABLE_STATE_DONTNEED	1
> +			/** @purge_state_val.val: value for
> DRM_XE_VMA_ATTR_PURGEABLE_STATE */
> +			__u32 val;
> +
> +			/** @purge_state_val.pad: MBZ */
> +			__u32 pad;
> +			/**
> +			 * @purge_state_val.retained_ptr: Pointer to
> a __u32 output
> +			 * field for backing store status.
> +			 *
> +			 * Userspace must initialize the __u32 value
> at this address
> +			 * to 0 before the ioctl. Kernel writes a
> __u32 after the
> +			 * operation:
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
> +			__u64 retained_ptr;
> +		} purge_state_val;
> =C2=A0	};
> =C2=A0
> =C2=A0	/** @reserved: Reserved */
