Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F4AC3ABAA
	for <intel-xe@archiver.kernel.org>; Fri,  2 May 2025 14:00:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A7C810E93D;
	Fri,  2 May 2025 14:00:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kOmPfFVS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8383110E1C8
 for <intel-xe@lists.freedesktop.org>; Fri,  2 May 2025 14:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746194409; x=1777730409;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=xDknG96bfjcCuEMXL7vtG9vw7PY7IPZLk+HtDfsYii8=;
 b=kOmPfFVSs6Hik5+g5tmdEnMzlsgljNys+N7GCWMh0xohiwD3u1jrLIg4
 cGCzdHf43lIO/rmOeyWKsLZ8qC1S322KV81wGyG69gtajL29mnL+6sewc
 +7MF0lAdKsxZAgN5dnstQKLIy4a4QsMyIE/JeCXef1kfsSkDhsCwsNSF9
 VA0I9tVajQcfPimC7iphgqi7+HOQjh+e7M6dAiO1LWLwkAxiIAssm7fcb
 D9Fen3R2L6BPmaYmoGgbH1RsJNOXcl9jUwYPjZrX77hVSR6z+6K7S8BWy
 j1U6XgDnUfaMaIKpcCufRb1E06x6mrU5bgVX72WZ5frq9OGf6yjOhh/43 g==;
X-CSE-ConnectionGUID: 5MRdGTZaTl6gyJcq+ec58Q==
X-CSE-MsgGUID: 81vYBwKTRbuIQ5VfaYSIcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="58083370"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; d="scan'208";a="58083370"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 07:00:09 -0700
X-CSE-ConnectionGUID: ASuXEJL6RquvNyvhTU9ErA==
X-CSE-MsgGUID: zWmuXugSQPm67K2KCIXunw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; d="scan'208";a="134956094"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO [10.245.246.151])
 ([10.245.246.151])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 07:00:06 -0700
Message-ID: <dfa4302fee599374c8bffee9e9ce8dcb1598a23d.camel@linux.intel.com>
Subject: Re: [PATCH v2 17/32] drm/xe/uapi: Add madvise interface
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>, 
 intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Date: Fri, 02 May 2025 16:00:04 +0200
In-Reply-To: <20250407101719.3350996-18-himal.prasad.ghimiray@intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-18-himal.prasad.ghimiray@intel.com>
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

On Mon, 2025-04-07 at 15:47 +0530, Himal Prasad Ghimiray wrote:
> This commit introduces a new madvise interface to support
> driver-specific ioctl operations. The madvise interface allows for
> more
> efficient memory management by providing hints to the driver about
> the
> expected memory usage and pte update policy for gpuvma.
>=20
> Signed-off-by: Himal Prasad Ghimiray
> <himal.prasad.ghimiray@intel.com>
> ---
> =C2=A0include/uapi/drm/xe_drm.h | 97
> +++++++++++++++++++++++++++++++++++++++
> =C2=A01 file changed, 97 insertions(+)
>=20
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 9c08738c3b91..aaf515df3a83 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -81,6 +81,7 @@ extern "C" {
> =C2=A0 *=C2=A0 - &DRM_IOCTL_XE_EXEC
> =C2=A0 *=C2=A0 - &DRM_IOCTL_XE_WAIT_USER_FENCE
> =C2=A0 *=C2=A0 - &DRM_IOCTL_XE_OBSERVATION
> + *=C2=A0 - &DRM_IOCTL_XE_MADVISE
> =C2=A0 */
> =C2=A0
> =C2=A0/*
> @@ -102,6 +103,7 @@ extern "C" {
> =C2=A0#define DRM_XE_EXEC			0x09
> =C2=A0#define DRM_XE_WAIT_USER_FENCE		0x0a
> =C2=A0#define DRM_XE_OBSERVATION		0x0b
> +#define DRM_XE_MADVISE			0x0c
> =C2=A0
> =C2=A0/* Must be kept compact -- no holes */
> =C2=A0
> @@ -117,6 +119,7 @@ extern "C" {
> =C2=A0#define
> DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe=
_exec)
> =C2=A0#define
> DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USE=
R_FENCE,structdrm_xe_wait_user_fence)
> =C2=A0#define
> DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION,s=
tructdrm_xe_observation_param)
> +#define
> DRM_IOCTL_XE_MADVISE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct=
drm_xe_madvise)
> =C2=A0
> =C2=A0/**
> =C2=A0 * DOC: Xe IOCTL Extensions
> @@ -1965,6 +1968,100 @@ struct drm_xe_query_eu_stall {
> =C2=A0	__u64 sampling_rates[];
> =C2=A0};
> =C2=A0
> +struct drm_xe_madvise_ops {

Suggest using extensions also for the ops, like for vm_bind, since we
might come up with complicated ops in the future that don't fit the
union + resvd below.

> +	/** @start: start of the virtual address range */
> +	__u64 start;
> +
> +	/** @size: size of the virtual address range */
> +	__u64 range;
> +
> +#define DRM_XE_VMA_ATTR_PREFERRED_LOC	0

Is UMD currently really using and exercising PREFERRED_LOC? If not, I
suggest removing this op and invent a reasonable default behaviour
until multi-device is in place.

> +#define DRM_XE_VMA_ATTR_ATOMIC		1
> +#define DRM_XE_VMA_ATTR_PAT		2
> +#define DRM_XE_VMA_ATTR_PURGEABLE_STATE	3
> +	/** @type: type of attribute */
> +	__u32 type;
> +
> +	/** @pad: MBZ */
> +	__u32 pad;
> +
> +	union {
> +		struct {
> +#define DRM_XE_VMA_ATOMIC_UNDEFINED	0
> +#define DRM_XE_VMA_ATOMIC_DEVICE	1
> +#define DRM_XE_VMA_ATOMIC_GLOBAL	2
> +#define DRM_XE_VMA_ATOMIC_CPU		3
> +		/** @val: value of atomic operation*/
> +			__u32 val;
> +
> +		/** @reserved: Reserved */
> +			__u32 reserved;
> +		} atomic;
> +
> +		struct {
> +#define DRM_XE_VMA_PURGEABLE_STATE_WILLNEED	0
> +#define DRM_XE_VMA_PURGEABLE_STATE_DONTNEED	1
> +#define DRM_XE_VMA_PURGEABLE_STATE_PURGED	2

I think the purged state, at least on i915 was only known to the KMD
(so shouldn't really be visible in this header). Also we should
probably define the semantics here if

a) There are multiple gpu vms with conflicting purgeable state.
b) What happens if we call dontneed and the bo is deeply pipelined?
c) What if a willneed madvise fails due to the bo being purged? And
that op is embedded in an array of unrelated ops? Should it really fail
the whole IOCTL?

> +		/** @val: value for DRM_XE_VMA_ATTR_PURGEABLE_STATE
> */
> +			__u32 val;
> +
> +		/** @reserved: Reserved */
> +			__u32 reserved;
> +		} purge_state_val;
> +
> +		struct {
> +			/** @pat_index */
> +			__u32 val;
> +
> +			/** @reserved: Reserved */
> +			__u32 reserved;
> +		} pat_index;
> +
> +		/** @preferred_mem_loc: preferred memory location */
> +		struct {
> +			__u32 devmem_fd;
> +
> +#define MIGRATE_ALL_PAGES 0
> +#define MIGRATE_ONLY_SYSTEM_PAGES 1
> +			__u32 migration_policy;
> +		} preferred_mem_loc;
> +	};
> +
> +	/** @reserved: Reserved */
> +	__u64 reserved[2];
> +};
> +
> +/**
> + * struct drm_xe_madvise - Input of &DRM_IOCTL_XE_MADVISE
> + *
> + * Set memory attributes to a virtual address range
> + */
> +struct drm_xe_madvise {
> +	/** @extensions: Pointer to the first extension struct, if
> any */
> +	__u64 extensions;
> +
> +	/** @vm_id: vm_id of the virtual range */
> +	__u32 vm_id;
> +
> +	/** @num_ops: number of madvises in ioctl */
> +	__u32 num_ops;

Should we really support an array of ops here given the experience we
had with rollbacks on VM_bind? Also WRT this, also please see the
purgeable state above.




> +
> +	union {
> +		/** @ops: used if num_ops =3D=3D 1 */
> +		struct drm_xe_madvise_ops ops;
> +
> +		/**
> +		 * @vector_of_ops: userptr to array of struct
> +		 * drm_xe_vm_madvise_op if num_ops > 1
> +		 */
> +		__u64 vector_of_ops;
> +	};
> +
> +	/** @reserved: Reserved */
> +	__u64 reserved[2];
> +
> +};
> +
> =C2=A0#if defined(__cplusplus)
> =C2=A0}
> =C2=A0#endif

/Thomas

