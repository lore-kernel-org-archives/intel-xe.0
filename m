Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2118BC6FD18
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 22:17:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D97BE10EB34;
	Wed, 19 Apr 2023 22:17:25 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2449310EB34
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 22:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681942643; x=1713478643;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=fwJ735nzOgW3vDK3zXpCMaIQizgnu9orIRrF9/cWwfw=;
 b=O+yqZ0eAq95oY2QymrDOaF4GVjUqJtnQ36iUrlmtrn437QunwGuedgv0
 k6mz0H9RSkDwmd4QLlDazaFn5IGYKgX8sNavXeZ3AuPazZXaMu1jFZYg8
 jQGYUktChuuom2TOVZcR6yddaGNBg9kAco8ltZHFG6HpxvO9nSHyI1kWs
 /HDUSHJSjXwgVCw4IlkBJzLrQnXJxZTkWKdLlk+b0ldgwRaf28ni37iHX
 GJpP2LDtTcrGlxPuIjI7BS7cGnZif5Ir5DDPyFONy5HbHxc3pHKfEGR7k
 jFUIX3qW3DFnKzlgEHZwi4iZekdIYna9iWlhKAJzFCeAC4+9DMv3yJG9x w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="373462957"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="373462957"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 15:11:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="685115628"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="685115628"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.249.35.30])
 ([10.249.35.30])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 15:11:55 -0700
Message-ID: <d8e7ec5d-13af-5003-8f34-94b7fa8ee4db@linux.intel.com>
Date: Thu, 20 Apr 2023 00:11:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
References: <20230419213703.3993439-1-matthew.d.roper@intel.com>
 <20230419213703.3993439-2-matthew.d.roper@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20230419213703.3993439-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe/adln: Enable ADL-N
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

Hi Matt,

On 4/19/2023 11:37 PM, Matt Roper wrote:
> ADL-N is pretty much the same as ADL-P (i.e., Xe_LP graphics + Xe_M
> media + Xe_LPD display).  However unlike ADL-P, there's no GuC hwconfig
> support so the "tgl" GuC firmware should be loaded (i.e., the same
> situation as ADL-S).
>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_display.c        | 1 +
>   drivers/gpu/drm/xe/xe_mocs.c           | 1 +
>   drivers/gpu/drm/xe/xe_pci.c            | 9 +++++++++
>   drivers/gpu/drm/xe/xe_platform_types.h | 1 +
>   drivers/gpu/drm/xe/xe_step.c           | 7 +++++++
>   drivers/gpu/drm/xe/xe_uc_fw.c          | 1 +
>   6 files changed, 20 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
> index aae362f27c77..9bd14ffc8f8d 100644
> --- a/drivers/gpu/drm/xe/xe_display.c
> +++ b/drivers/gpu/drm/xe/xe_display.c
> @@ -509,6 +509,7 @@ void xe_display_info_init(struct xe_device *xe)
>   		};
>   		break;
>   	case XE_ALDERLAKE_P:
> +	case XE_ALDERLAKE_N:
>   		xe->info.display = (struct xe_device_display_info) {
>   			XE_LPD,
>   			.has_cdclk_crawl = 1,
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> index e09c6242aafc..2d2e1c216db9 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -418,6 +418,7 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
>   	case XE_ROCKETLAKE:
>   	case XE_ALDERLAKE_S:
>   	case XE_ALDERLAKE_P:
> +	case XE_ALDERLAKE_N:
>   		info->size  = ARRAY_SIZE(gen12_mocs_desc);
>   		info->table = gen12_mocs_desc;
>   		info->n_entries = GEN9_NUM_MOCS_ENTRIES;
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index c92faffc838c..e96ea7b98f0b 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -210,6 +210,14 @@ static const struct xe_device_desc adl_p_desc = {
>   	},
>   };
>   
> +static const struct xe_device_desc adl_n_desc = {
> +	.graphics = &graphics_xelp,
> +	.media = &media_xem,
> +	PLATFORM(XE_ALDERLAKE_N),
> +	.has_llc = 1,


Shouldn't this be 0 as this is all atom core platform ?


Regards,

Nirmoy

> +	.require_force_probe = true,
> +};
> +
>   #define DGFX_FEATURES \
>   	.is_dgfx = 1
>   
> @@ -315,6 +323,7 @@ static const struct pci_device_id pciidlist[] = {
>   	XE_RKL_IDS(INTEL_VGA_DEVICE, &rkl_desc),
>   	XE_ADLS_IDS(INTEL_VGA_DEVICE, &adl_s_desc),
>   	XE_ADLP_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
> +	XE_ADLN_IDS(INTEL_VGA_DEVICE, &adl_n_desc),
>   	XE_DG1_IDS(INTEL_VGA_DEVICE, &dg1_desc),
>   	XE_ATS_M_IDS(INTEL_VGA_DEVICE, &ats_m_desc),
>   	XE_DG2_IDS(INTEL_VGA_DEVICE, &dg2_desc),
> diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/xe_platform_types.h
> index 80c19bffe79c..abbb8a1f29a8 100644
> --- a/drivers/gpu/drm/xe/xe_platform_types.h
> +++ b/drivers/gpu/drm/xe/xe_platform_types.h
> @@ -16,6 +16,7 @@ enum xe_platform {
>   	XE_ROCKETLAKE,
>   	XE_ALDERLAKE_S,
>   	XE_ALDERLAKE_P,
> +	XE_ALDERLAKE_N,
>   	XE_DG1,
>   	XE_DG2,
>   	XE_PVC,
> diff --git a/drivers/gpu/drm/xe/xe_step.c b/drivers/gpu/drm/xe/xe_step.c
> index bcdb4601c2f6..a443d9bd7bbb 100644
> --- a/drivers/gpu/drm/xe/xe_step.c
> +++ b/drivers/gpu/drm/xe/xe_step.c
> @@ -71,6 +71,10 @@ static const struct xe_step_info adlp_rpl_revids[] = {
>   	[0x4] = { COMMON_GT_MEDIA_STEP(C0), .display = STEP_E0 },
>   };
>   
> +static const struct xe_step_info adln_revids[] = {
> +	[0x0] = { COMMON_GT_MEDIA_STEP(A0), .display = STEP_D0 },
> +};
> +
>   static const struct xe_step_info dg2_g10_revid_step_tbl[] = {
>   	[0x0] = { COMMON_GT_MEDIA_STEP(A0), .display = STEP_A0 },
>   	[0x1] = { COMMON_GT_MEDIA_STEP(A1), .display = STEP_A0 },
> @@ -129,6 +133,9 @@ struct xe_step_info xe_step_get(struct xe_device *xe)
>   	} else if (xe->info.subplatform == XE_SUBPLATFORM_DG2_G12) {
>   		revids = dg2_g12_revid_step_tbl;
>   		size = ARRAY_SIZE(dg2_g12_revid_step_tbl);
> +	} else if (xe->info.platform == XE_ALDERLAKE_N) {
> +		revids = adln_revids;
> +		size = ARRAY_SIZE(adln_revids);
>   	} else if (xe->info.subplatform == XE_SUBPLATFORM_ADLP_RPLU) {
>   		revids = adlp_rpl_revids;
>   		size = ARRAY_SIZE(adlp_rpl_revids);
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 97328e441f0f..7b8547bbeaba 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -104,6 +104,7 @@ struct fw_blobs_by_type {
>   	fw_def(PVC,		mmp_ver(  xe,	guc,	pvc,	70, 6, 4))	\
>   	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 5))		\
>   	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 5))		\
> +	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 5))		\
>   	fw_def(ALDERLAKE_P,	major_ver(i915,	guc,	adlp,	70, 5))		\
>   	fw_def(ALDERLAKE_S,	major_ver(i915,	guc,	tgl,	70, 5))		\
>   	fw_def(ROCKETLAKE,	major_ver(i915,	guc,	tgl,	70, 5))		\
