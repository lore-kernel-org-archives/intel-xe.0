Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 047C8C47DD9
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 09:40:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C9B10F026;
	Fri, 22 Mar 2024 09:40:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HCwAN7rl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 508A010F026
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 09:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711100419; x=1742636419;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=jd7vtQBFL3W6r4PB8JOPzaoVdmsL5FeqDiyB5aGKBKA=;
 b=HCwAN7rldx2ekVW7D5cMivCqXi5sKggdW7dTRHmxxKDn17/NLcUC0dpu
 wWvpbuuUBUxBIjkEV31bB23HVSQmv6pcB8ih/Nntf2DzwmNo8rM7ZEJNb
 GykIT5j7eUB5KAQcYRuQGrLLcVTLUQe7j5iAaXmaJ3PjCGW1MpRE4d0es
 gqk7hty5tFg4gqbRQ9nNyMs/Zru41V9cXCksoLiay7wg0dS1DieQ8CAzT
 ilQTa6fUfVJpx/WSHWUabmOIcXo5O4fZ6AcaFfN1jTwKoPl0wkZPFwDTM
 N1Ujmoq5Qzz/hrzk5PGu7Jlb83VgdloVxwd0lcaq+z6lS8zQhwPAbkKNM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6748053"
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; 
   d="scan'208";a="6748053"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 02:40:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; d="scan'208";a="19321531"
Received: from ghoshsu1-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.6])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 02:40:16 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v2] drm/xe : avoid the risky function sprintf
In-Reply-To: <20231206214903.46065-1-krishnaiah.bommu@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231206214903.46065-1-krishnaiah.bommu@intel.com>
Date: Fri, 22 Mar 2024 11:40:11 +0200
Message-ID: <87plvmli4k.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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


drm/xe : avoid the risky function sprintf
      ^

Please don't add a space there in the subject.

On Thu, 07 Dec 2023, Bommu Krishnaiah <krishnaiah.bommu@intel.com> wrote:
> These errors were highlighted by Static analyzer. Used snprintf instead o=
f sprint.
>
> Static analyzer Reported "Calling risky function (DC.STRING_BUFFER)=E2=80=
=9D
>
> v2: Removed hard coded values abd used sizeof()
>
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c               |  2 +-
>  drivers/gpu/drm/xe/xe_exec_queue.c            | 12 +++----
>  drivers/gpu/drm/xe/xe_gt_debugfs.c            |  2 +-
>  drivers/gpu/drm/xe/xe_gt_idle.c               |  4 +--
>  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 36 +++++++++----------
>  drivers/gpu/drm/xe/xe_hw_fence.c              |  2 +-
>  6 files changed, 29 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debu=
gfs.c
> index 8abdf3c17e1d..70532d67eb99 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -129,7 +129,7 @@ void xe_debugfs_register(struct xe_device *xe)
>  		if (man) {
>  			char name[16];
>=20=20
> -			sprintf(name, "vram%d_mm", mem_type - XE_PL_VRAM0);
> +			snprintf(name, 16, "vram%d_mm", mem_type - XE_PL_VRAM0);

Please never use magic values like this when you can use
e.g. sizeof(name).

>  			ttm_resource_manager_create_debugfs(man, root, name);
>  		}
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_e=
xec_queue.c
> index 730eb7d2a639..14d6c1d6e434 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -225,22 +225,22 @@ void xe_exec_queue_assign_name(struct xe_exec_queue=
 *q, u32 instance)
>  {
>  	switch (q->class) {
>  	case XE_ENGINE_CLASS_RENDER:
> -		sprintf(q->name, "rcs%d", instance);
> +		snprintf(q->name, MAX_FENCE_NAME_LEN, "rcs%d", instance);

Like Himal suggested, please use sizeof.

>  		break;
>  	case XE_ENGINE_CLASS_VIDEO_DECODE:
> -		sprintf(q->name, "vcs%d", instance);
> +		snprintf(q->name, MAX_FENCE_NAME_LEN, "vcs%d", instance);
>  		break;
>  	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
> -		sprintf(q->name, "vecs%d", instance);
> +		snprintf(q->name, MAX_FENCE_NAME_LEN, "vecs%d", instance);
>  		break;
>  	case XE_ENGINE_CLASS_COPY:
> -		sprintf(q->name, "bcs%d", instance);
> +		snprintf(q->name, MAX_FENCE_NAME_LEN, "bcs%d", instance);
>  		break;
>  	case XE_ENGINE_CLASS_COMPUTE:
> -		sprintf(q->name, "ccs%d", instance);
> +		snprintf(q->name, MAX_FENCE_NAME_LEN, "ccs%d", instance);
>  		break;
>  	case XE_ENGINE_CLASS_OTHER:
> -		sprintf(q->name, "gsccs%d", instance);
> +		snprintf(q->name, MAX_FENCE_NAME_LEN, "gsccs%d", instance);
>  		break;
>  	default:
>  		XE_WARN_ON(q->class);
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_g=
t_debugfs.c
> index 6b4dc2927727..3af85b2f6625 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -261,7 +261,7 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>=20=20
>  	xe_gt_assert(gt, minor->debugfs_root);
>=20=20
> -	sprintf(name, "gt%d", gt->info.id);
> +	snprintf(name, sizeof(name), "gt%d", gt->info.id);
>  	root =3D debugfs_create_dir(name, minor->debugfs_root);
>  	if (IS_ERR(root)) {
>  		drm_warn(&xe->drm, "Create GT directory failed");
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_i=
dle.c
> index 2984680de3f9..bc1426f8d731 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -166,10 +166,10 @@ void xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidl=
e)
>  	}
>=20=20
>  	if (xe_gt_is_media_type(gt)) {
> -		sprintf(gtidle->name, "gt%d-mc", gt->info.id);
> +		snprintf(gtidle->name, sizeof(gtidle->name), "gt%d-mc", gt->info.id);
>  		gtidle->idle_residency =3D xe_guc_pc_mc6_residency;
>  	} else {
> -		sprintf(gtidle->name, "gt%d-rc", gt->info.id);
> +		snprintf(gtidle->name, sizeof(gtidle->name), "gt%d-rc", gt->info.id);
>  		gtidle->idle_residency =3D xe_guc_pc_rc6_residency;
>  	}
>=20=20
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/=
drm/xe/xe_hw_engine_class_sysfs.c
> index c17cce53f19d..f85a40d87829 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> @@ -71,7 +71,7 @@ static ssize_t job_timeout_max_show(struct kobject *kob=
j,
>  {
>  	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj);
>=20=20
> -	return sprintf(buf, "%u\n", eclass->sched_props.job_timeout_max);
> +	return snprintf(buf, PAGE_SIZE, "%u\n", eclass->sched_props.job_timeout=
_max);
>  }
>=20=20
>  static const struct kobj_attribute job_timeout_max_attr =3D
> @@ -107,7 +107,7 @@ static ssize_t job_timeout_min_show(struct kobject *k=
obj,
>  {
>  	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj);
>=20=20
> -	return sprintf(buf, "%u\n", eclass->sched_props.job_timeout_min);
> +	return snprintf(buf, PAGE_SIZE, "%u\n", eclass->sched_props.job_timeout=
_min);
>  }
>=20=20
>  static const struct kobj_attribute job_timeout_min_attr =3D
> @@ -140,7 +140,7 @@ static ssize_t job_timeout_show(struct kobject *kobj,
>  {
>  	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj);
>=20=20
> -	return sprintf(buf, "%u\n", eclass->sched_props.job_timeout_ms);
> +	return snprintf(buf, PAGE_SIZE, "%u\n", eclass->sched_props.job_timeout=
_ms);
>  }
>=20=20
>  static const struct kobj_attribute job_timeout_attr =3D
> @@ -151,7 +151,7 @@ static ssize_t job_timeout_default(struct kobject *ko=
bj,
>  {
>  	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj->parent);
>=20=20
> -	return sprintf(buf, "%u\n", eclass->defaults.job_timeout_ms);
> +	return snprintf(buf, PAGE_SIZE, "%u\n", eclass->defaults.job_timeout_ms=
);
>  }
>=20=20
>  static const struct kobj_attribute job_timeout_def =3D
> @@ -162,7 +162,7 @@ static ssize_t job_timeout_min_default(struct kobject=
 *kobj,
>  {
>  	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj->parent);
>=20=20
> -	return sprintf(buf, "%u\n", eclass->defaults.job_timeout_min);
> +	return snprintf(buf, PAGE_SIZE, "%u\n", eclass->defaults.job_timeout_mi=
n);
>  }
>=20=20
>  static const struct kobj_attribute job_timeout_min_def =3D
> @@ -173,7 +173,7 @@ static ssize_t job_timeout_max_default(struct kobject=
 *kobj,
>  {
>  	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj->parent);
>=20=20
> -	return sprintf(buf, "%u\n", eclass->defaults.job_timeout_max);
> +	return snprintf(buf, PAGE_SIZE, "%u\n", eclass->defaults.job_timeout_ma=
x);
>  }
>=20=20
>  static const struct kobj_attribute job_timeout_max_def =3D
> @@ -232,7 +232,7 @@ static ssize_t timeslice_duration_max_show(struct kob=
ject *kobj,
>  {
>  	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj);
>=20=20
> -	return sprintf(buf, "%u\n", eclass->sched_props.timeslice_max);
> +	return snprintf(buf, PAGE_SIZE, "%u\n", eclass->sched_props.timeslice_m=
ax);
>  }
>=20=20
>  static const struct kobj_attribute timeslice_duration_max_attr =3D
> @@ -270,7 +270,7 @@ static ssize_t timeslice_duration_min_show(struct kob=
ject *kobj,
>  {
>  	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj);
>=20=20
> -	return sprintf(buf, "%u\n", eclass->sched_props.timeslice_min);
> +	return snprintf(buf, PAGE_SIZE, "%u\n", eclass->sched_props.timeslice_m=
in);
>  }
>=20=20
>  static const struct kobj_attribute timeslice_duration_min_attr =3D
> @@ -282,7 +282,7 @@ static ssize_t timeslice_duration_show(struct kobject=
 *kobj,
>  {
>  	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj);
>=20=20
> -	return sprintf(buf, "%u\n", eclass->sched_props.timeslice_us);
> +	return snprintf(buf, PAGE_SIZE, "%u\n", eclass->sched_props.timeslice_u=
s);
>  }
>=20=20
>  static const struct kobj_attribute timeslice_duration_attr =3D
> @@ -294,7 +294,7 @@ static ssize_t timeslice_default(struct kobject *kobj,
>  {
>  	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj->parent);
>=20=20
> -	return sprintf(buf, "%u\n", eclass->defaults.timeslice_us);
> +	return snprintf(buf, PAGE_SIZE, "%u\n", eclass->defaults.timeslice_us);
>  }
>=20=20
>  static const struct kobj_attribute timeslice_duration_def =3D
> @@ -305,7 +305,7 @@ static ssize_t timeslice_min_default(struct kobject *=
kobj,
>  {
>  	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj->parent);
>=20=20
> -	return sprintf(buf, "%u\n", eclass->defaults.timeslice_min);
> +	return snprintf(buf, PAGE_SIZE, "%u\n", eclass->defaults.timeslice_min);
>  }
>=20=20
>  static const struct kobj_attribute timeslice_duration_min_def =3D
> @@ -316,7 +316,7 @@ static ssize_t timeslice_max_default(struct kobject *=
kobj,
>  {
>  	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj->parent);
>=20=20
> -	return sprintf(buf, "%u\n", eclass->defaults.timeslice_max);
> +	return snprintf(buf, PAGE_SIZE, "%u\n", eclass->defaults.timeslice_max);
>  }
>=20=20
>  static const struct kobj_attribute timeslice_duration_max_def =3D
> @@ -349,7 +349,7 @@ static ssize_t preempt_timeout_show(struct kobject *k=
obj,
>  {
>  	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj);
>=20=20
> -	return sprintf(buf, "%u\n", eclass->sched_props.preempt_timeout_us);
> +	return snprintf(buf, PAGE_SIZE, "%u\n", eclass->sched_props.preempt_tim=
eout_us);
>  }
>=20=20
>  static const struct kobj_attribute preempt_timeout_attr =3D
> @@ -361,7 +361,7 @@ static ssize_t preempt_timeout_default(struct kobject=
 *kobj,
>  {
>  	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj->parent);
>=20=20
> -	return sprintf(buf, "%u\n", eclass->defaults.preempt_timeout_us);
> +	return snprintf(buf, PAGE_SIZE, "%u\n", eclass->defaults.preempt_timeou=
t_us);
>  }
>=20=20
>  static const struct kobj_attribute preempt_timeout_def =3D
> @@ -373,7 +373,7 @@ static ssize_t preempt_timeout_min_default(struct kob=
ject *kobj,
>  {
>  	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj->parent);
>=20=20
> -	return sprintf(buf, "%u\n", eclass->defaults.preempt_timeout_min);
> +	return snprintf(buf, PAGE_SIZE, "%u\n", eclass->defaults.preempt_timeou=
t_min);
>  }
>=20=20
>  static const struct kobj_attribute preempt_timeout_min_def =3D
> @@ -385,7 +385,7 @@ static ssize_t preempt_timeout_max_default(struct kob=
ject *kobj,
>  {
>  	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj->parent);
>=20=20
> -	return sprintf(buf, "%u\n", eclass->defaults.preempt_timeout_max);
> +	return snprintf(buf, PAGE_SIZE, "%u\n", eclass->defaults.preempt_timeou=
t_max);
>  }
>=20=20
>  static const struct kobj_attribute preempt_timeout_max_def =3D
> @@ -421,7 +421,7 @@ static ssize_t preempt_timeout_max_show(struct kobjec=
t *kobj,
>  {
>  	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj);
>=20=20
> -	return sprintf(buf, "%u\n", eclass->sched_props.preempt_timeout_max);
> +	return snprintf(buf, PAGE_SIZE, "%u\n", eclass->sched_props.preempt_tim=
eout_max);
>  }
>=20=20
>  static const struct kobj_attribute preempt_timeout_max_attr =3D
> @@ -458,7 +458,7 @@ static ssize_t preempt_timeout_min_show(struct kobjec=
t *kobj,
>  {
>  	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj);
>=20=20
> -	return sprintf(buf, "%u\n", eclass->sched_props.preempt_timeout_min);
> +	return snprintf(buf, PAGE_SIZE, "%u\n", eclass->sched_props.preempt_tim=
eout_min);
>  }
>=20=20
>  static const struct kobj_attribute preempt_timeout_min_attr =3D
> diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_=
fence.c
> index a5de3e7b0bd6..91245002d965 100644
> --- a/drivers/gpu/drm/xe/xe_hw_fence.c
> +++ b/drivers/gpu/drm/xe/xe_hw_fence.c
> @@ -130,7 +130,7 @@ void xe_hw_fence_ctx_init(struct xe_hw_fence_ctx *ctx=
, struct xe_gt *gt,
>  	ctx->irq =3D irq;
>  	ctx->dma_fence_ctx =3D dma_fence_context_alloc(1);
>  	ctx->next_seqno =3D XE_FENCE_INITIAL_SEQNO;
> -	sprintf(ctx->name, "%s", name);
> +	snprintf(ctx->name, MAX_FENCE_NAME_LEN, "%s", name);

Again, sizeof.

>  }
>=20=20
>  void xe_hw_fence_ctx_finish(struct xe_hw_fence_ctx *ctx)

--=20
Jani Nikula, Intel
