Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4168BC47DA2
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 12:40:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B845810E067;
	Wed, 17 Jan 2024 12:40:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84FDE10E067
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jan 2024 12:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705495201; x=1737031201;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=jxlW/CT6T92F8AWl+WoIL7X/bOYvFJNbI0WBhgJNkec=;
 b=kxdf85f5veCERX58Y+PBODTjvAyQ6Lr7CxIxJfNNjrn87e18JBaoHoPH
 Xbsi9qbnIWweb2lFVXXGm2+A20fLCWp7l6WEjxa11xOQXA1wJdGj16Agh
 mSpddpQzoJWReeAZcPvi1fIP2EhTBEZEkNFP0ab1qR81EpIKCACMcgGiD
 OfZfxcVi9QbZCkiGuoOlcpHlhI/1Us3+7RJl2t9SVNBafVdN+YdN7sB67
 3GwF0i/hg9uAdTl8vJFG/QZroIZN9dbKV+8daAwEyDW+H+kGTW6phyl60
 D8+2GU5zSoNio7K0yCkbmWvoh4ot6mbRvTyd7hsk5qNZfnZ3xklvOLOQv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="7247821"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="7247821"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 04:40:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="957534597"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="957534597"
Received: from clanggaa-mobl.ger.corp.intel.com (HELO [10.249.254.57])
 ([10.249.254.57])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 04:39:59 -0800
Message-ID: <7316b3ea943c37eb70ee2d568f30c01627a78c12.camel@linux.intel.com>
Subject: Re: [PATCH 5/5] drm/xe: constify engine class sysfs attributes
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>, intel-xe@lists.freedesktop.org
Date: Wed, 17 Jan 2024 13:39:57 +0100
In-Reply-To: <20240117122044.1544174-5-jani.nikula@intel.com>
References: <20240117122044.1544174-1-jani.nikula@intel.com>
 <20240117122044.1544174-5-jani.nikula@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
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

On Wed, 2024-01-17 at 14:20 +0200, Jani Nikula wrote:
> All of the attributes, as well as the array of attributes, can be
> const
> and placed in rodata.
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 38 +++++++++-------=
-
> --
> =C2=A01 file changed, 19 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> index e49bc14f0ecf..2345fb42fa39 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> @@ -73,7 +73,7 @@ static ssize_t job_timeout_max_show(struct kobject
> *kobj,
> =C2=A0	return sprintf(buf, "%u\n", eclass-
> >sched_props.job_timeout_max);
> =C2=A0}
> =C2=A0
> -static struct kobj_attribute job_timeout_max_attr =3D
> +static const struct kobj_attribute job_timeout_max_attr =3D
> =C2=A0__ATTR(job_timeout_max, 0644, job_timeout_max_show,
> job_timeout_max_store);
> =C2=A0
> =C2=A0static ssize_t job_timeout_min_store(struct kobject *kobj,
> @@ -109,7 +109,7 @@ static ssize_t job_timeout_min_show(struct
> kobject *kobj,
> =C2=A0	return sprintf(buf, "%u\n", eclass-
> >sched_props.job_timeout_min);
> =C2=A0}
> =C2=A0
> -static struct kobj_attribute job_timeout_min_attr =3D
> +static const struct kobj_attribute job_timeout_min_attr =3D
> =C2=A0__ATTR(job_timeout_min, 0644, job_timeout_min_show,
> job_timeout_min_store);
> =C2=A0
> =C2=A0static ssize_t job_timeout_store(struct kobject *kobj,
> @@ -142,7 +142,7 @@ static ssize_t job_timeout_show(struct kobject
> *kobj,
> =C2=A0	return sprintf(buf, "%u\n", eclass-
> >sched_props.job_timeout_ms);
> =C2=A0}
> =C2=A0
> -static struct kobj_attribute job_timeout_attr =3D
> +static const struct kobj_attribute job_timeout_attr =3D
> =C2=A0__ATTR(job_timeout_ms, 0644, job_timeout_show, job_timeout_store);
> =C2=A0
> =C2=A0static ssize_t job_timeout_default(struct kobject *kobj,
> @@ -153,7 +153,7 @@ static ssize_t job_timeout_default(struct kobject
> *kobj,
> =C2=A0	return sprintf(buf, "%u\n", eclass-
> >defaults.job_timeout_ms);
> =C2=A0}
> =C2=A0
> -static struct kobj_attribute job_timeout_def =3D
> +static const struct kobj_attribute job_timeout_def =3D
> =C2=A0__ATTR(job_timeout_ms, 0444, job_timeout_default, NULL);
> =C2=A0
> =C2=A0static ssize_t job_timeout_min_default(struct kobject *kobj,
> @@ -164,7 +164,7 @@ static ssize_t job_timeout_min_default(struct
> kobject *kobj,
> =C2=A0	return sprintf(buf, "%u\n", eclass-
> >defaults.job_timeout_min);
> =C2=A0}
> =C2=A0
> -static struct kobj_attribute job_timeout_min_def =3D
> +static const struct kobj_attribute job_timeout_min_def =3D
> =C2=A0__ATTR(job_timeout_min, 0444, job_timeout_min_default, NULL);
> =C2=A0
> =C2=A0static ssize_t job_timeout_max_default(struct kobject *kobj,
> @@ -175,7 +175,7 @@ static ssize_t job_timeout_max_default(struct
> kobject *kobj,
> =C2=A0	return sprintf(buf, "%u\n", eclass-
> >defaults.job_timeout_max);
> =C2=A0}
> =C2=A0
> -static struct kobj_attribute job_timeout_max_def =3D
> +static const struct kobj_attribute job_timeout_max_def =3D
> =C2=A0__ATTR(job_timeout_max, 0444, job_timeout_max_default, NULL);
> =C2=A0
> =C2=A0static ssize_t timeslice_duration_store(struct kobject *kobj,
> @@ -234,7 +234,7 @@ static ssize_t timeslice_duration_max_show(struct
> kobject *kobj,
> =C2=A0	return sprintf(buf, "%u\n", eclass-
> >sched_props.timeslice_max);
> =C2=A0}
> =C2=A0
> -static struct kobj_attribute timeslice_duration_max_attr =3D
> +static const struct kobj_attribute timeslice_duration_max_attr =3D
> =C2=A0	__ATTR(timeslice_duration_max, 0644,
> timeslice_duration_max_show,
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 timeslice_duration_max_store)=
;
> =C2=A0
> @@ -272,7 +272,7 @@ static ssize_t timeslice_duration_min_show(struct
> kobject *kobj,
> =C2=A0	return sprintf(buf, "%u\n", eclass-
> >sched_props.timeslice_min);
> =C2=A0}
> =C2=A0
> -static struct kobj_attribute timeslice_duration_min_attr =3D
> +static const struct kobj_attribute timeslice_duration_min_attr =3D
> =C2=A0	__ATTR(timeslice_duration_min, 0644,
> timeslice_duration_min_show,
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 timeslice_duration_min_store)=
;
> =C2=A0
> @@ -284,7 +284,7 @@ static ssize_t timeslice_duration_show(struct
> kobject *kobj,
> =C2=A0	return sprintf(buf, "%u\n", eclass-
> >sched_props.timeslice_us);
> =C2=A0}
> =C2=A0
> -static struct kobj_attribute timeslice_duration_attr =3D
> +static const struct kobj_attribute timeslice_duration_attr =3D
> =C2=A0	__ATTR(timeslice_duration_us, 0644, timeslice_duration_show,
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 timeslice_duration_store);
> =C2=A0
> @@ -296,7 +296,7 @@ static ssize_t timeslice_default(struct kobject
> *kobj,
> =C2=A0	return sprintf(buf, "%u\n", eclass->defaults.timeslice_us);
> =C2=A0}
> =C2=A0
> -static struct kobj_attribute timeslice_duration_def =3D
> +static const struct kobj_attribute timeslice_duration_def =3D
> =C2=A0__ATTR(timeslice_duration_us, 0444, timeslice_default, NULL);
> =C2=A0
> =C2=A0static ssize_t timeslice_min_default(struct kobject *kobj,
> @@ -307,7 +307,7 @@ static ssize_t timeslice_min_default(struct
> kobject *kobj,
> =C2=A0	return sprintf(buf, "%u\n", eclass->defaults.timeslice_min);
> =C2=A0}
> =C2=A0
> -static struct kobj_attribute timeslice_duration_min_def =3D
> +static const struct kobj_attribute timeslice_duration_min_def =3D
> =C2=A0__ATTR(timeslice_duration_min, 0444, timeslice_min_default, NULL);
> =C2=A0
> =C2=A0static ssize_t timeslice_max_default(struct kobject *kobj,
> @@ -318,7 +318,7 @@ static ssize_t timeslice_max_default(struct
> kobject *kobj,
> =C2=A0	return sprintf(buf, "%u\n", eclass->defaults.timeslice_max);
> =C2=A0}
> =C2=A0
> -static struct kobj_attribute timeslice_duration_max_def =3D
> +static const struct kobj_attribute timeslice_duration_max_def =3D
> =C2=A0__ATTR(timeslice_duration_max, 0444, timeslice_max_default, NULL);
> =C2=A0
> =C2=A0static ssize_t preempt_timeout_store(struct kobject *kobj,
> @@ -351,7 +351,7 @@ static ssize_t preempt_timeout_show(struct
> kobject *kobj,
> =C2=A0	return sprintf(buf, "%u\n", eclass-
> >sched_props.preempt_timeout_us);
> =C2=A0}
> =C2=A0
> -static struct kobj_attribute preempt_timeout_attr =3D
> +static const struct kobj_attribute preempt_timeout_attr =3D
> =C2=A0__ATTR(preempt_timeout_us, 0644, preempt_timeout_show,
> preempt_timeout_store);
> =C2=A0
> =C2=A0static ssize_t preempt_timeout_default(struct kobject *kobj,
> @@ -363,7 +363,7 @@ static ssize_t preempt_timeout_default(struct
> kobject *kobj,
> =C2=A0	return sprintf(buf, "%u\n", eclass-
> >defaults.preempt_timeout_us);
> =C2=A0}
> =C2=A0
> -static struct kobj_attribute preempt_timeout_def =3D
> +static const struct kobj_attribute preempt_timeout_def =3D
> =C2=A0__ATTR(preempt_timeout_us, 0444, preempt_timeout_default, NULL);
> =C2=A0
> =C2=A0static ssize_t preempt_timeout_min_default(struct kobject *kobj,
> @@ -375,7 +375,7 @@ static ssize_t preempt_timeout_min_default(struct
> kobject *kobj,
> =C2=A0	return sprintf(buf, "%u\n", eclass-
> >defaults.preempt_timeout_min);
> =C2=A0}
> =C2=A0
> -static struct kobj_attribute preempt_timeout_min_def =3D
> +static const struct kobj_attribute preempt_timeout_min_def =3D
> =C2=A0__ATTR(preempt_timeout_min, 0444, preempt_timeout_min_default,
> NULL);
> =C2=A0
> =C2=A0static ssize_t preempt_timeout_max_default(struct kobject *kobj,
> @@ -387,7 +387,7 @@ static ssize_t preempt_timeout_max_default(struct
> kobject *kobj,
> =C2=A0	return sprintf(buf, "%u\n", eclass-
> >defaults.preempt_timeout_max);
> =C2=A0}
> =C2=A0
> -static struct kobj_attribute preempt_timeout_max_def =3D
> +static const struct kobj_attribute preempt_timeout_max_def =3D
> =C2=A0__ATTR(preempt_timeout_max, 0444, preempt_timeout_max_default,
> NULL);
> =C2=A0
> =C2=A0static ssize_t preempt_timeout_max_store(struct kobject *kobj,
> @@ -423,7 +423,7 @@ static ssize_t preempt_timeout_max_show(struct
> kobject *kobj,
> =C2=A0	return sprintf(buf, "%u\n", eclass-
> >sched_props.preempt_timeout_max);
> =C2=A0}
> =C2=A0
> -static struct kobj_attribute preempt_timeout_max_attr =3D
> +static const struct kobj_attribute preempt_timeout_max_attr =3D
> =C2=A0	__ATTR(preempt_timeout_max, 0644, preempt_timeout_max_show,
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 preempt_timeout_max_store);
> =C2=A0
> @@ -460,7 +460,7 @@ static ssize_t preempt_timeout_min_show(struct
> kobject *kobj,
> =C2=A0	return sprintf(buf, "%u\n", eclass-
> >sched_props.preempt_timeout_min);
> =C2=A0}
> =C2=A0
> -static struct kobj_attribute preempt_timeout_min_attr =3D
> +static const struct kobj_attribute preempt_timeout_min_attr =3D
> =C2=A0	__ATTR(preempt_timeout_min, 0644, preempt_timeout_min_show,
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 preempt_timeout_min_store);
> =C2=A0
> @@ -477,7 +477,7 @@ static const struct attribute *defaults[] =3D {
> =C2=A0	NULL
> =C2=A0};
> =C2=A0
> -static const struct attribute *files[] =3D {
> +static const struct attribute * const files[] =3D {
> =C2=A0	&job_timeout_attr.attr,
> =C2=A0	&job_timeout_min_attr.attr,
> =C2=A0	&job_timeout_max_attr.attr,

