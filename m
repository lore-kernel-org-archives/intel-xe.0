Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9325AD29C43
	for <intel-xe@archiver.kernel.org>; Mon, 19 Jan 2026 16:57:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 531D410E012;
	Mon, 19 Jan 2026 16:57:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AEKHE0EN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C14E10E012
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Jan 2026 16:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768841854; x=1800377854;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=5e3hfBlFaTP27slT12zkQtaw4CqfnAOhP5exvxflgiY=;
 b=AEKHE0EN1/ime8ZqTgBIYr3DAYrGGMkVU6FhHmzMRq5S8nE2GkhiqAsN
 tdLmp4SoR36fbAGHMPj4OAiKhJPxSSq9D1R/1YoYa3P4LxrWdsToahd5c
 MC+NvIVfa25Z+l84CVmV5sMDWuHVcuLmGf1rM1nq5vVPzOG0wYo3bj5ex
 /rZEw96aIgm57QHlh2/UWxSXxva7RxtS0hK7+KqQ/XbhkGi/DisW9Piak
 7wOT+hQAiON0qoJFkzyE3Cr6GmbXLYxATU6HKi6YPCrrS2a95qXsTncjD
 Vcz7+xtg+LmqJqgbdZ7+22saorRjOT0H1IMf0J+qkZ/282kNhswuJiW/9 A==;
X-CSE-ConnectionGUID: E8jo3ZrNQ02T/gyx71zieA==
X-CSE-MsgGUID: pGrisPTFQRKdFSo6iD3KLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="72642803"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="72642803"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 08:57:33 -0800
X-CSE-ConnectionGUID: 9sFXa2/DSiqCSbbo2xQIaA==
X-CSE-MsgGUID: T0toBJhGR+20yC2eiCJaBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="205061614"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.32])
 ([10.245.244.32])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 08:57:32 -0800
Message-ID: <dc27df4f5351345d6925db872390f3b290909fb5.camel@linux.intel.com>
Subject: Re: [PATCH v6 06/17] drm/xe/multi_queue: Add exec_queue
 set_property ioctl support
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>, 
 intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, matthew.d.roper@intel.com
Date: Mon, 19 Jan 2026 17:57:29 +0100
In-Reply-To: <20251211010249.1647839-25-niranjana.vishwanathapura@intel.com>
References: <20251211010249.1647839-19-niranjana.vishwanathapura@intel.com>
 <20251211010249.1647839-25-niranjana.vishwanathapura@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
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

Hi,

On Wed, 2025-12-10 at 17:02 -0800, Niranjana Vishwanathapura wrote:
> This patch adds support for exec_queue set_property ioctl.
> It is derived from the original work which is part of
> https://patchwork.freedesktop.org/series/112188/
>=20
> Currently only DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY
> property can be dynamically set.
>=20
> v2: Check for and update kernel-doc which property this ioctl
> =C2=A0=C2=A0=C2=A0 supports (Matt Brost)
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
> Signed-off-by: Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Two questions on this patch:

1) I don't see any locking to protect the exec-queue / lrc state.
Perhaps I missed it, but couldn't this blow up if someone runs two
set_property ioctls in parallel on the same exec-queue? Looks like at
least the set_priority is doing non-atomic RMW assignments?

2) Do we really need this to be mutable? In i915 assuming that lrc /
context configuration could change created horrendous locking
constructs that were later fixed by making it immutable at first
command sumbission. I don't exactly remember the details but do we need
to change properties after first submission? If not I suggest blocking
that.

Thanks,
Thomas




> ---
> =C2=A0drivers/gpu/drm/xe/xe_device.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++
> =C2=A0drivers/gpu/drm/xe/xe_exec_queue.c | 35
> ++++++++++++++++++++++++++++++
> =C2=A0drivers/gpu/drm/xe/xe_exec_queue.h |=C2=A0 2 ++
> =C2=A0include/uapi/drm/xe_drm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 26 ++++++++++++++++++++++
> =C2=A04 files changed, 65 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c
> b/drivers/gpu/drm/xe/xe_device.c
> index 1197f914ef77..7a498c8db7b1 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -207,6 +207,8 @@ static const struct drm_ioctl_desc xe_ioctls[] =3D
> {
> =C2=A0	DRM_IOCTL_DEF_DRV(XE_MADVISE, xe_vm_madvise_ioctl,
> DRM_RENDER_ALLOW),
> =C2=A0	DRM_IOCTL_DEF_DRV(XE_VM_QUERY_MEM_RANGE_ATTRS,
> xe_vm_query_vmas_attrs_ioctl,
> =C2=A0			=C2=A0 DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(XE_EXEC_QUEUE_SET_PROPERTY,
> xe_exec_queue_set_property_ioctl,
> +			=C2=A0 DRM_RENDER_ALLOW),
> =C2=A0};
> =C2=A0
> =C2=A0static long xe_drm_ioctl(struct file *file, unsigned int cmd,
> unsigned long arg)
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> b/drivers/gpu/drm/xe/xe_exec_queue.c
> index d0082eb45a4a..d738a9fea1e1 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -790,6 +790,41 @@ static const xe_exec_queue_set_property_fn
> exec_queue_set_property_funcs[] =3D {
> =C2=A0							exec_queue_s
> et_multi_queue_priority,
> =C2=A0};
> =C2=A0
> +int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void
> *data,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_file *file)
> +{
> +	struct xe_device *xe =3D to_xe_device(dev);
> +	struct xe_file *xef =3D to_xe_file(file);
> +	struct drm_xe_exec_queue_set_property *args =3D data;
> +	struct xe_exec_queue *q;
> +	int ret;
> +	u32 idx;
> +
> +	if (XE_IOCTL_DBG(xe, args->reserved[0] || args-
> >reserved[1]))
> +		return -EINVAL;
> +
> +	if (XE_IOCTL_DBG(xe, args->property !=3D
> +		=09
> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY))
> +		return -EINVAL;
> +
> +	q =3D xe_exec_queue_lookup(xef, args->exec_queue_id);
> +	if (XE_IOCTL_DBG(xe, !q))
> +		return -ENOENT;
> +
> +	idx =3D array_index_nospec(args->property,
> +			=09
> ARRAY_SIZE(exec_queue_set_property_funcs));
> +	ret =3D exec_queue_set_property_funcs[idx](xe, q, args-
> >value);
> +	if (XE_IOCTL_DBG(xe, ret))
> +		goto err_post_lookup;
> +
> +	xe_exec_queue_put(q);
> +	return 0;
> +
> + err_post_lookup:
> +	xe_exec_queue_put(q);
> +	return ret;
> +}
> +
> =C2=A0static int exec_queue_user_ext_check(struct xe_exec_queue *q, u64
> properties)
> =C2=A0{
> =C2=A0	u64 secondary_queue_valid_props =3D
> BIT_ULL(DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP) |
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h
> b/drivers/gpu/drm/xe/xe_exec_queue.h
> index e6daa40003f2..ffcc1feb879e 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -125,6 +125,8 @@ int xe_exec_queue_destroy_ioctl(struct drm_device
> *dev, void *data,
> =C2=A0				struct drm_file *file);
> =C2=A0int xe_exec_queue_get_property_ioctl(struct drm_device *dev, void
> *data,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_file *file);
> +int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void
> *data,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_file *file);
> =C2=A0enum xe_exec_queue_priority
> xe_exec_queue_device_get_max_priority(struct xe_device *xe);
> =C2=A0
> =C2=A0void xe_exec_queue_last_fence_put(struct xe_exec_queue *e, struct
> xe_vm *vm);
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index fd79d78de2e9..705081bf0d81 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -106,6 +106,7 @@ extern "C" {
> =C2=A0#define DRM_XE_OBSERVATION		0x0b
> =C2=A0#define DRM_XE_MADVISE			0x0c
> =C2=A0#define DRM_XE_VM_QUERY_MEM_RANGE_ATTRS	0x0d
> +#define DRM_XE_EXEC_QUEUE_SET_PROPERTY	0x0e
> =C2=A0
> =C2=A0/* Must be kept compact -- no holes */
> =C2=A0
> @@ -123,6 +124,7 @@ extern "C" {
> =C2=A0#define
> DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION,s=
tructdrm_xe_observation_param)
> =C2=A0#define
> DRM_IOCTL_XE_MADVISE			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_MADVISE, structd=
rm_xe_madvise)
> =C2=A0#define
> DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_=
VM_QUERY_MEM_RANGE_ATTRS,structdrm_xe_vm_query_mem_range_attr)
> +#define
> DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EX=
EC_QUEUE_SET_PROPERTY,structdrm_xe_exec_queue_set_property)
> =C2=A0
> =C2=A0/**
> =C2=A0 * DOC: Xe IOCTL Extensions
> @@ -2315,6 +2317,30 @@ struct drm_xe_vm_query_mem_range_attr {
> =C2=A0
> =C2=A0};
> =C2=A0
> +/**
> + * struct drm_xe_exec_queue_set_property - exec queue set property
> + *
> + * Sets execution queue properties dynamically.
> + * Currently only
> %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY
> + * property can be dynamically set.
> + */
> +struct drm_xe_exec_queue_set_property {
> +	/** @extensions: Pointer to the first extension struct, if
> any */
> +	__u64 extensions;
> +
> +	/** @exec_queue_id: Exec queue ID */
> +	__u32 exec_queue_id;
> +
> +	/** @property: property to set */
> +	__u32 property;
> +
> +	/** @value: property value */
> +	__u64 value;
> +
> +	/** @reserved: Reserved */
> +	__u64 reserved[2];
> +};
> +
> =C2=A0#if defined(__cplusplus)
> =C2=A0}
> =C2=A0#endif

