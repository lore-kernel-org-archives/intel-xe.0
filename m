Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B026CCF9FA
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 07:58:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DFA010E917;
	Thu, 30 Oct 2025 07:58:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f5AUXmke";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E0910E92A
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 07:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761811137; x=1793347137;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=Q7zy0Ka+OGsZpLnxr8cp+3QVmtM66jOLLhin5EDYgA8=;
 b=f5AUXmkeBe+XiE0pcAntMimASCE/xDQ1fKT8d6VCOiW2hCQPdJfH+fyv
 +woE0XW0f5XJtDXulh09SW4mdG2l8blgSENVay1IzU2rmSPMYgMFGIx69
 fRJE4pJzyEneIY+bBRZcNKKHVFVgq4SfTrGT47ahBAWLA63w6FkVtWSQU
 g1bcdrBxh6krmOKcUW5EsAtqk2/mvMC9miVJRMVeDDSUXOjGXreN7kIuD
 BXnzpclTv4bLKVLAF3EAt4q+qDCu+9Z2saiD0YuRXee9r1oCRkcGBxyeV
 S84Q1RxO9Ksd0wwIhsaujrOQdXMTUv0zxk0pdZPDUmYAR1Rxz4UwR+WQJ A==;
X-CSE-ConnectionGUID: mdTr/V/xTquD5wJBrqFScg==
X-CSE-MsgGUID: dLWSmLCmTYeSV8Z2mz1/0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="51517109"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="51517109"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 00:58:57 -0700
X-CSE-ConnectionGUID: kNI/QEi4QuqL9LjKBqBm5w==
X-CSE-MsgGUID: IbxxRBQHQ1aeks956DHpWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="223107457"
Received: from opintica-mobl1 (HELO [10.245.245.172]) ([10.245.245.172])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 00:58:56 -0700
Message-ID: <f647296ae0d8150745852b439da169529aa47e4d.camel@linux.intel.com>
Subject: Re: [PATCH v5 1/6] drm/xe: Enforce correct user fence signaling
 order using drm_syncobjs
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Date: Thu, 30 Oct 2025 08:58:53 +0100
In-Reply-To: <20251029205719.2746501-2-matthew.brost@intel.com>
References: <20251029205719.2746501-1-matthew.brost@intel.com>
 <20251029205719.2746501-2-matthew.brost@intel.com>
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

On Wed, 2025-10-29 at 13:57 -0700, Matthew Brost wrote:
> Prevent application hangs caused by out-of-order fence signaling when
> user fences are attached. Use drm_syncobj (via dma-fence-chain) to
> guarantee that each user fence signals in order, regardless of the
> signaling order of the attached fences. Ensure user fence writebacks
> to
> user space occur in the correct sequence.

Perhaps describe exactly what the signalling order is supposed to be?
Like calling order per exec_queue etc. (strictly I guess it's the
grabbing order of a certain lock, like the vm resv?)

Do we need a Fixes: for this?
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

>=20
> Signed-of-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_exec.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +-
> =C2=A0drivers/gpu/drm/xe/xe_exec_queue.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 13 +++++++
> =C2=A0drivers/gpu/drm/xe/xe_exec_queue_types.h |=C2=A0 7 ++++
> =C2=A0drivers/gpu/drm/xe/xe_oa.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 45 ++++++++++++++++------
> --
> =C2=A0drivers/gpu/drm/xe/xe_oa_types.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 8 +++++
> =C2=A0drivers/gpu/drm/xe/xe_sync.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 17 +++++++--
> =C2=A0drivers/gpu/drm/xe/xe_sync.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++
> =C2=A0drivers/gpu/drm/xe/xe_sync_types.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 3 ++
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +++
> =C2=A09 files changed, 85 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_exec.c
> b/drivers/gpu/drm/xe/xe_exec.c
> index 0dc27476832b..f7b9d8715053 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -166,7 +166,8 @@ int xe_exec_ioctl(struct drm_device *dev, void
> *data, struct drm_file *file)
> =C2=A0
> =C2=A0	for (num_syncs =3D 0; num_syncs < args->num_syncs;
> num_syncs++) {
> =C2=A0		err =3D xe_sync_entry_parse(xe, xef,
> &syncs[num_syncs],
> -					=C2=A0 &syncs_user[num_syncs],
> SYNC_PARSE_FLAG_EXEC |
> +					=C2=A0 &syncs_user[num_syncs],
> NULL, 0,
> +					=C2=A0 SYNC_PARSE_FLAG_EXEC |
> =C2=A0					=C2=A0 (xe_vm_in_lr_mode(vm) ?
> =C2=A0					=C2=A0=C2=A0 SYNC_PARSE_FLAG_LR_MODE :
> 0));
> =C2=A0		if (err)
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 90cbc95f8e2e..6e168efbac65 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -10,6 +10,7 @@
> =C2=A0#include <drm/drm_device.h>
> =C2=A0#include <drm/drm_drv.h>
> =C2=A0#include <drm/drm_file.h>
> +#include <drm/drm_syncobj.h>
> =C2=A0#include <uapi/drm/xe_drm.h>
> =C2=A0
> =C2=A0#include "xe_dep_scheduler.h"
> @@ -345,6 +346,7 @@ struct xe_exec_queue
> *xe_exec_queue_create_bind(struct xe_device *xe,
> =C2=A0	struct xe_gt *gt =3D tile->primary_gt;
> =C2=A0	struct xe_exec_queue *q;
> =C2=A0	struct xe_vm *migrate_vm;
> +	int err;
> =C2=A0
> =C2=A0	migrate_vm =3D xe_migrate_get_vm(tile->migrate);
> =C2=A0	if (xe->info.has_usm) {
> @@ -368,6 +370,14 @@ struct xe_exec_queue
> *xe_exec_queue_create_bind(struct xe_device *xe,
> =C2=A0	}
> =C2=A0	xe_vm_put(migrate_vm);
> =C2=A0
> +	err =3D drm_syncobj_create(&q->ufence_syncobj,
> +				 DRM_SYNCOBJ_CREATE_SIGNALED,
> +				 NULL);
> +	if (err) {
> +		xe_exec_queue_put(q);
> +		return ERR_PTR(err);
> +	}
> +
> =C2=A0	return q;
> =C2=A0}
> =C2=A0ALLOW_ERROR_INJECTION(xe_exec_queue_create_bind, ERRNO);
> @@ -377,6 +387,9 @@ void xe_exec_queue_destroy(struct kref *ref)
> =C2=A0	struct xe_exec_queue *q =3D container_of(ref, struct
> xe_exec_queue, refcount);
> =C2=A0	struct xe_exec_queue *eq, *next;
> =C2=A0
> +	if (q->ufence_syncobj)
> +		drm_syncobj_put(q->ufence_syncobj);
> +
> =C2=A0	if (xe_exec_queue_uses_pxp(q))
> =C2=A0		xe_pxp_exec_queue_remove(gt_to_xe(q->gt)->pxp, q);
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 282505fa1377..838266c3914b 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -15,6 +15,7 @@
> =C2=A0#include "xe_hw_fence_types.h"
> =C2=A0#include "xe_lrc_types.h"
> =C2=A0
> +struct drm_syncobj;
> =C2=A0struct xe_execlist_exec_queue;
> =C2=A0struct xe_gt;
> =C2=A0struct xe_guc_exec_queue;
> @@ -155,6 +156,12 @@ struct xe_exec_queue {
> =C2=A0		struct list_head link;
> =C2=A0	} pxp;
> =C2=A0
> +	/** @ufence_syncobj: User fence syncobj */
> +	struct drm_syncobj *ufence_syncobj;
> +
> +	/** @ufence_timeline_value: User fence timeline value */
> +	u64 ufence_timeline_value;
> +
> =C2=A0	/** @ops: submission backend exec queue operations */
> =C2=A0	const struct xe_exec_queue_ops *ops;
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index f901ba52b403..7a13a7bd99a6 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -10,6 +10,7 @@
> =C2=A0
> =C2=A0#include <drm/drm_drv.h>
> =C2=A0#include <drm/drm_managed.h>
> +#include <drm/drm_syncobj.h>
> =C2=A0#include <uapi/drm/xe_drm.h>
> =C2=A0
> =C2=A0#include <generated/xe_wa_oob.h>
> @@ -1390,7 +1391,9 @@ static int xe_oa_user_extensions(struct xe_oa
> *oa, enum xe_oa_user_extn_from fro
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> -static int xe_oa_parse_syncs(struct xe_oa *oa, struct
> xe_oa_open_param *param)
> +static int xe_oa_parse_syncs(struct xe_oa *oa,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_oa_stream *stream,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_oa_open_param *param)
> =C2=A0{
> =C2=A0	int ret, num_syncs, num_ufence =3D 0;
> =C2=A0
> @@ -1410,7 +1413,9 @@ static int xe_oa_parse_syncs(struct xe_oa *oa,
> struct xe_oa_open_param *param)
> =C2=A0
> =C2=A0	for (num_syncs =3D 0; num_syncs < param->num_syncs;
> num_syncs++) {
> =C2=A0		ret =3D xe_sync_entry_parse(oa->xe, param->xef,
> &param->syncs[num_syncs],
> -					=C2=A0 &param-
> >syncs_user[num_syncs], 0);
> +					=C2=A0 &param-
> >syncs_user[num_syncs],
> +					=C2=A0 stream->ufence_syncobj,
> +					=C2=A0 ++stream-
> >ufence_timeline_value, 0);
> =C2=A0		if (ret)
> =C2=A0			goto err_syncs;
> =C2=A0
> @@ -1540,7 +1545,7 @@ static long xe_oa_config_locked(struct
> xe_oa_stream *stream, u64 arg)
> =C2=A0		return -ENODEV;
> =C2=A0
> =C2=A0	param.xef =3D stream->xef;
> -	err =3D xe_oa_parse_syncs(stream->oa, &param);
> +	err =3D xe_oa_parse_syncs(stream->oa, stream, &param);
> =C2=A0	if (err)
> =C2=A0		goto err_config_put;
> =C2=A0
> @@ -1636,6 +1641,7 @@ static void xe_oa_destroy_locked(struct
> xe_oa_stream *stream)
> =C2=A0	if (stream->exec_q)
> =C2=A0		xe_exec_queue_put(stream->exec_q);
> =C2=A0
> +	drm_syncobj_put(stream->ufence_syncobj);
> =C2=A0	kfree(stream);
> =C2=A0}
> =C2=A0
> @@ -1827,6 +1833,7 @@ static int
> xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
> =C2=A0					=C2=A0 struct xe_oa_open_param
> *param)
> =C2=A0{
> =C2=A0	struct xe_oa_stream *stream;
> +	struct drm_syncobj *ufence_syncobj;
> =C2=A0	int stream_fd;
> =C2=A0	int ret;
> =C2=A0
> @@ -1837,17 +1844,31 @@ static int
> xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
> =C2=A0		goto exit;
> =C2=A0	}
> =C2=A0
> +	ret =3D drm_syncobj_create(&ufence_syncobj,
> DRM_SYNCOBJ_CREATE_SIGNALED,
> +				 NULL);
> +	if (ret)
> +		goto exit;
> +
> =C2=A0	stream =3D kzalloc(sizeof(*stream), GFP_KERNEL);
> =C2=A0	if (!stream) {
> =C2=A0		ret =3D -ENOMEM;
> -		goto exit;
> +		goto err_syncobj;
> =C2=A0	}
> -
> +	stream->ufence_syncobj =3D ufence_syncobj;
> =C2=A0	stream->oa =3D oa;
> -	ret =3D xe_oa_stream_init(stream, param);
> +
> +	ret =3D xe_oa_parse_syncs(oa, stream, param);
> =C2=A0	if (ret)
> =C2=A0		goto err_free;
> =C2=A0
> +	ret =3D xe_oa_stream_init(stream, param);
> +	if (ret) {
> +		while (param->num_syncs--)
> +			xe_sync_entry_cleanup(&param->syncs[param-
> >num_syncs]);
> +		kfree(param->syncs);
> +		goto err_free;
> +	}
> +
> =C2=A0	if (!param->disabled) {
> =C2=A0		ret =3D xe_oa_enable_locked(stream);
> =C2=A0		if (ret)
> @@ -1871,6 +1892,8 @@ static int
> xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
> =C2=A0	xe_oa_stream_destroy(stream);
> =C2=A0err_free:
> =C2=A0	kfree(stream);
> +err_syncobj:
> +	drm_syncobj_put(ufence_syncobj);
> =C2=A0exit:
> =C2=A0	return ret;
> =C2=A0}
> @@ -2084,22 +2107,14 @@ int xe_oa_stream_open_ioctl(struct drm_device
> *dev, u64 data, struct drm_file *f
> =C2=A0		goto err_exec_q;
> =C2=A0	}
> =C2=A0
> -	ret =3D xe_oa_parse_syncs(oa, &param);
> -	if (ret)
> -		goto err_exec_q;
> -
> =C2=A0	mutex_lock(&param.hwe->gt->oa.gt_lock);
> =C2=A0	ret =3D xe_oa_stream_open_ioctl_locked(oa, &param);
> =C2=A0	mutex_unlock(&param.hwe->gt->oa.gt_lock);
> =C2=A0	if (ret < 0)
> -		goto err_sync_cleanup;
> +		goto err_exec_q;
> =C2=A0
> =C2=A0	return ret;
> =C2=A0
> -err_sync_cleanup:
> -	while (param.num_syncs--)
> -
> 		xe_sync_entry_cleanup(&param.syncs[param.num_syncs]);
> -	kfree(param.syncs);
> =C2=A0err_exec_q:
> =C2=A0	if (param.exec_q)
> =C2=A0		xe_exec_queue_put(param.exec_q);
> diff --git a/drivers/gpu/drm/xe/xe_oa_types.h
> b/drivers/gpu/drm/xe/xe_oa_types.h
> index 2628f78c4e8d..daf701b5d48b 100644
> --- a/drivers/gpu/drm/xe/xe_oa_types.h
> +++ b/drivers/gpu/drm/xe/xe_oa_types.h
> @@ -15,6 +15,8 @@
> =C2=A0#include "regs/xe_reg_defs.h"
> =C2=A0#include "xe_hw_engine_types.h"
> =C2=A0
> +struct drm_syncobj;
> +
> =C2=A0#define DEFAULT_XE_OA_BUFFER_SIZE SZ_16M
> =C2=A0
> =C2=A0enum xe_oa_report_header {
> @@ -248,6 +250,12 @@ struct xe_oa_stream {
> =C2=A0	/** @xef: xe_file with which the stream was opened */
> =C2=A0	struct xe_file *xef;
> =C2=A0
> +	/** @ufence_syncobj: User fence syncobj */
> +	struct drm_syncobj *ufence_syncobj;
> +
> +	/** @ufence_timeline_value: User fence timeline value */
> +	u64 ufence_timeline_value;
> +
> =C2=A0	/** @last_fence: fence to use in stream destroy when needed
> */
> =C2=A0	struct dma_fence *last_fence;
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_sync.c
> b/drivers/gpu/drm/xe/xe_sync.c
> index 82872a51f098..d48ab7b32ca5 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -113,6 +113,8 @@ static void user_fence_cb(struct dma_fence
> *fence, struct dma_fence_cb *cb)
> =C2=A0int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
> =C2=A0			struct xe_sync_entry *sync,
> =C2=A0			struct drm_xe_sync __user *sync_user,
> +			struct drm_syncobj *ufence_syncobj,
> +			u64 ufence_timeline_value,
> =C2=A0			unsigned int flags)
> =C2=A0{
> =C2=A0	struct drm_xe_sync sync_in;
> @@ -192,10 +194,15 @@ int xe_sync_entry_parse(struct xe_device *xe,
> struct xe_file *xef,
> =C2=A0		if (exec) {
> =C2=A0			sync->addr =3D sync_in.addr;
> =C2=A0		} else {
> +			sync->ufence_timeline_value =3D
> ufence_timeline_value;
> =C2=A0			sync->ufence =3D user_fence_create(xe,
> sync_in.addr,
> =C2=A0						=09
> sync_in.timeline_value);
> =C2=A0			if (XE_IOCTL_DBG(xe, IS_ERR(sync->ufence)))
> =C2=A0				return PTR_ERR(sync->ufence);
> +			sync->ufence_chain_fence =3D
> dma_fence_chain_alloc();
> +			if (!sync->ufence_chain_fence)
> +				return -ENOMEM;
> +			sync->ufence_syncobj =3D ufence_syncobj;
> =C2=A0		}
> =C2=A0
> =C2=A0		break;
> @@ -239,7 +246,12 @@ void xe_sync_entry_signal(struct xe_sync_entry
> *sync, struct dma_fence *fence)
> =C2=A0	} else if (sync->ufence) {
> =C2=A0		int err;
> =C2=A0
> -		dma_fence_get(fence);
> +		drm_syncobj_add_point(sync->ufence_syncobj,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sync->ufence_chain_fence,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fence, sync-
> >ufence_timeline_value);
> +		sync->ufence_chain_fence =3D NULL;
> +
> +		fence =3D drm_syncobj_fence_get(sync->ufence_syncobj);
> =C2=A0		user_fence_get(sync->ufence);
> =C2=A0		err =3D dma_fence_add_callback(fence, &sync->ufence-
> >cb,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 user_fence_cb);
> @@ -259,7 +271,8 @@ void xe_sync_entry_cleanup(struct xe_sync_entry
> *sync)
> =C2=A0		drm_syncobj_put(sync->syncobj);
> =C2=A0	dma_fence_put(sync->fence);
> =C2=A0	dma_fence_chain_free(sync->chain_fence);
> -	if (sync->ufence)
> +	dma_fence_chain_free(sync->ufence_chain_fence);
> +	if (!IS_ERR_OR_NULL(sync->ufence))
> =C2=A0		user_fence_put(sync->ufence);
> =C2=A0}
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_sync.h
> b/drivers/gpu/drm/xe/xe_sync.h
> index 256ffc1e54dc..51f2d803e977 100644
> --- a/drivers/gpu/drm/xe/xe_sync.h
> +++ b/drivers/gpu/drm/xe/xe_sync.h
> @@ -8,6 +8,7 @@
> =C2=A0
> =C2=A0#include "xe_sync_types.h"
> =C2=A0
> +struct drm_syncobj;
> =C2=A0struct xe_device;
> =C2=A0struct xe_exec_queue;
> =C2=A0struct xe_file;
> @@ -21,6 +22,8 @@ struct xe_vm;
> =C2=A0int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
> =C2=A0			struct xe_sync_entry *sync,
> =C2=A0			struct drm_xe_sync __user *sync_user,
> +			struct drm_syncobj *ufence_syncobj,
> +			u64 ufence_timeline_value,
> =C2=A0			unsigned int flags);
> =C2=A0int xe_sync_entry_add_deps(struct xe_sync_entry *sync,
> =C2=A0			=C2=A0=C2=A0 struct xe_sched_job *job);
> diff --git a/drivers/gpu/drm/xe/xe_sync_types.h
> b/drivers/gpu/drm/xe/xe_sync_types.h
> index 30ac3f51993b..b88f1833e28c 100644
> --- a/drivers/gpu/drm/xe/xe_sync_types.h
> +++ b/drivers/gpu/drm/xe/xe_sync_types.h
> @@ -18,9 +18,12 @@ struct xe_sync_entry {
> =C2=A0	struct drm_syncobj *syncobj;
> =C2=A0	struct dma_fence *fence;
> =C2=A0	struct dma_fence_chain *chain_fence;
> +	struct dma_fence_chain *ufence_chain_fence;
> +	struct drm_syncobj *ufence_syncobj;
> =C2=A0	struct xe_user_fence *ufence;
> =C2=A0	u64 addr;
> =C2=A0	u64 timeline_value;
> +	u64 ufence_timeline_value;
> =C2=A0	u32 type;
> =C2=A0	u32 flags;
> =C2=A0};
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 10d77666a425..4058c476aa2d 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3633,8 +3633,12 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> void *data, struct drm_file *file)
> =C2=A0
> =C2=A0	syncs_user =3D u64_to_user_ptr(args->syncs);
> =C2=A0	for (num_syncs =3D 0; num_syncs < args->num_syncs;
> num_syncs++) {
> +		struct xe_exec_queue *__q =3D q ?: vm->q[0];
> +
> =C2=A0		err =3D xe_sync_entry_parse(xe, xef,
> &syncs[num_syncs],
> =C2=A0					=C2=A0 &syncs_user[num_syncs],
> +					=C2=A0 __q->ufence_syncobj,
> +					=C2=A0 ++__q-
> >ufence_timeline_value,
> =C2=A0					=C2=A0 (xe_vm_in_lr_mode(vm) ?
> =C2=A0					=C2=A0=C2=A0 SYNC_PARSE_FLAG_LR_MODE :
> 0) |
> =C2=A0					=C2=A0 (!args->num_binds ?

