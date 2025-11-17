Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F1BECE8D6B
	for <intel-xe@archiver.kernel.org>; Mon, 17 Nov 2025 08:44:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E0CB10E2FB;
	Mon, 17 Nov 2025 08:44:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xw7iKKWz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CBAC10E2FB
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Nov 2025 08:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763369067; x=1794905067;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Zn5JItHoi0r8fL9c/OG1OpUosnNcW/xIOOTSa4Qq2N0=;
 b=Xw7iKKWzETF7iAmqpxTX14Y7CSPNWSDG+JVA5vmDTP+Lt8WGiKsd9VhG
 SY5c9AjpBJ888lmUCYPh+fA09t/7KOg7IWFbni0MJUGIq0fw37E3MaEs1
 a1kblwsSTGpn6cDUbAb6lra0Rbec7+A+4l0X8qxYrMX82rZUS6sH/5H8T
 pwtv0JUgHMq7WJQ6g4KEshXma0DzFmmRbS3+YvIHy7TKCaVl+Dz765ZP7
 +PKwPxXgxITmcLiTZAq+NQ3HNFt4kyUsiA4WaSV4870Q3eLoX3rRqZw4t
 t+dU7j6m9zkYw9JlyYvH3dVWxK5mko084fNqngpaqxSNJNiary34Sc1x5 g==;
X-CSE-ConnectionGUID: dhBU4wgYQIqllwqZlLGRBg==
X-CSE-MsgGUID: qpwWY7uFQcSCHKjku2DljQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="64566713"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="64566713"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 00:44:27 -0800
X-CSE-ConnectionGUID: HN5Xn9uBQYa2zAEQfv4LKA==
X-CSE-MsgGUID: P09YGihSTF+BnUqJB4cZaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="190833297"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.42])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 00:44:24 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Xin Wang <x.wang@intel.com>, intel-xe@lists.freedesktop.org
Cc: shuicheng.lin@intel.com, alex.zuo@intel.com, Xin Wang
 <x.wang@intel.com>, Matt Roper <matthew.d.roper@intel.com>, Jonathan
 Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH v3] drm/xe: expose PAT software table via debugfs
In-Reply-To: <20251114224055.242690-1-x.wang@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251114224055.242690-1-x.wang@intel.com>
Date: Mon, 17 Nov 2025 10:44:21 +0200
Message-ID: <9dd34cf0bf99d084ce3f573731e84feb33fc4c1e@intel.com>
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

On Fri, 14 Nov 2025, Xin Wang <x.wang@intel.com> wrote:
> The existing "pat" debugfs node dumps the live PAT registers. Under SR-IOV
> the VF cannot touch those registers, so the file vanishes and users lose
> all PAT visibility. Add a VF-safe "pat_sw_config" entry to the VF-safe
> debugfs list. It prints the cached PAT table the driver programmed, rather
> than poking HW, so PF and VF instances present the same view.
>
> This lets IGT and other tools query the PAT configuration without carrying
> platform-specific tables or mirroring kernel logic.
>
> v2: (Jonathan)
> - Only append "(* =3D reserved entry)" to the PAT table header on Xe2+
> platforms where it actually applies.
> - Deduplicate the PTA/ATS mode printing by introducing the small
> drm_printf_pat_mode() helper macro.
>
> v3: (Matt)
> - Print IDX[XE_CACHE_NONE_COMPRESSION] on every Xe2+ platform so the dump
> always reflects the value the driver might use (even if it defaults to 0)
> and future IP revisions don=E2=80=99t need extra condition tweaks.
>
> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_debugfs.c |  1 +
>  drivers/gpu/drm/xe/xe_pat.c        | 87 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pat.h        |  1 +
>  3 files changed, 89 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_g=
t_debugfs.c
> index e4fd632f43cf..ec279f005b10 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -220,6 +220,7 @@ static const struct drm_info_list vf_safe_debugfs_lis=
t[] =3D {
>  	{ "default_lrc_vcs", .show =3D xe_gt_debugfs_show_with_rpm, .data =3D v=
cs_default_lrc },
>  	{ "default_lrc_vecs", .show =3D xe_gt_debugfs_show_with_rpm, .data =3D =
vecs_default_lrc },
>  	{ "hwconfig", .show =3D xe_gt_debugfs_show_with_rpm, .data =3D hwconfig=
 },
> +	{ "pat_sw_config", .show =3D xe_gt_debugfs_simple_show, .data =3D xe_pa=
t_dump_sw_config },
>  };
>=20=20
>  /* everything else should be added here */
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 68171cceea18..e16ee7132dfc 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -578,3 +578,90 @@ int xe_pat_dump(struct xe_gt *gt, struct drm_printer=
 *p)
>=20=20
>  	return xe->pat.ops->dump(gt, p);
>  }
> +
> +#define drm_printf_pat_mode(p, name, pat) \

Please don't use the drm_printf "namespace" prefix. This is *not* about
drm_printf, this is about xe_pat_something_something.

> +	{ \
> +		drm_printf(p, name "=3D [ %u, %u, %u, %u, %u, %u ]  (%#8x)\n", \
> +		   !!(pat & XE2_NO_PROMOTE), \
> +		   !!(pat & XE2_COMP_EN), \
> +		   REG_FIELD_GET(XE2_L3_CLOS, pat), \
> +		   REG_FIELD_GET(XE2_L3_POLICY, pat), \
> +		   REG_FIELD_GET(XE2_L4_POLICY, pat), \
> +		   REG_FIELD_GET(XE2_COH_MODE, pat), \
> +		   pat); \
> +	}

There are no reasons to make this a macro. Please use a function.

BR,
Jani.

> +/**
> + * xe_pat_dump_sw_config() - Dump the software-configured GT PAT table i=
nto a drm printer.
> + * @gt: the &xe_gt
> + * @p: the &drm_printer
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	struct xe_device *xe =3D gt_to_xe(gt);
> +
> +	if (!xe->pat.table || !xe->pat.n_entries)
> +		return -EOPNOTSUPP;
> +
> +	drm_printf(p, "PAT table:%s\n", GRAPHICS_VER(xe) >=3D 20 ? " (* =3D res=
erved entry)" : "");
> +	for (u32 i =3D 0; i < xe->pat.n_entries; i++) {
> +		u32 pat =3D xe->pat.table[i].value;
> +
> +		if (GRAPHICS_VER(xe) >=3D 20) {
> +			drm_printf(p, "PAT[%2d] =3D [ %u, %u, %u, %u, %u, %u ]  (%#8x)%s\n", =
i,
> +				   !!(pat & XE2_NO_PROMOTE),
> +				   !!(pat & XE2_COMP_EN),
> +				   REG_FIELD_GET(XE2_L3_CLOS, pat),
> +				   REG_FIELD_GET(XE2_L3_POLICY, pat),
> +				   REG_FIELD_GET(XE2_L4_POLICY, pat),
> +				   REG_FIELD_GET(XE2_COH_MODE, pat),
> +				   pat, xe->pat.table[i].valid ? "" : " *");
> +		} else if (xe->info.platform =3D=3D XE_METEORLAKE) {
> +			drm_printf(p, "PAT[%2d] =3D [ %u, %u ] (%#8x)\n", i,
> +				   REG_FIELD_GET(XELPG_L4_POLICY_MASK, pat),
> +				   REG_FIELD_GET(XELPG_INDEX_COH_MODE_MASK, pat), pat);
> +		} else if (xe->info.platform =3D=3D XE_PVC) {
> +			drm_printf(p, "PAT[%2d] =3D [ %u, %u ] (%#8x)\n", i,
> +				   REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat),
> +				   REG_FIELD_GET(XEHPC_CLOS_LEVEL_MASK, pat), pat);
> +		} else if (xe->info.platform =3D=3D XE_DG2) {
> +			u8 mem_type =3D REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat);
> +
> +			drm_printf(p, "PAT[%2d] =3D %s (%#8x)\n", i,
> +				   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
> +		} else if (GRAPHICS_VERx100(xe) <=3D 1210) {
> +			u8 mem_type =3D REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat);
> +
> +			drm_printf(p, "PAT[%2d] =3D %s (%#8x)\n", i,
> +				   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
> +		} else {
> +			return -EOPNOTSUPP;
> +		}
> +	}
> +
> +	if (xe->pat.pat_pta) {
> +		u32 pat =3D xe->pat.pat_pta->value;
> +
> +		drm_printf(p, "Page Table Access:\n");
> +		drm_printf_pat_mode(p, "PTA_MODE", pat);
> +	}
> +
> +	if (xe->pat.pat_ats) {
> +		u32 pat =3D xe->pat.pat_ats->value;
> +
> +		drm_printf(p, "PCIe ATS response:\n");
> +		drm_printf_pat_mode(p, "ATS_MODE", pat);
> +	}
> +
> +	drm_printf(p, "Cache Level:\n");
> +	drm_printf(p, "IDX[XE_CACHE_NONE] =3D %d\n", xe->pat.idx[XE_CACHE_NONE]=
);
> +	drm_printf(p, "IDX[XE_CACHE_WT] =3D %d\n", xe->pat.idx[XE_CACHE_WT]);
> +	drm_printf(p, "IDX[XE_CACHE_WB] =3D %d\n", xe->pat.idx[XE_CACHE_WB]);
> +	if (GRAPHICS_VER(xe) >=3D 20) {
> +		drm_printf(p, "IDX[XE_CACHE_NONE_COMPRESSION] =3D %d\n",
> +			   xe->pat.idx[XE_CACHE_NONE_COMPRESSION]);
> +	}
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
> index 05dae03a5f54..4a3045f74bfe 100644
> --- a/drivers/gpu/drm/xe/xe_pat.h
> +++ b/drivers/gpu/drm/xe/xe_pat.h
> @@ -49,6 +49,7 @@ void xe_pat_init_early(struct xe_device *xe);
>  void xe_pat_init(struct xe_gt *gt);
>=20=20
>  int xe_pat_dump(struct xe_gt *gt, struct drm_printer *p);
> +int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p);
>=20=20
>  /**
>   * xe_pat_index_get_coh_mode - Extract the coherency mode for the given

--=20
Jani Nikula, Intel
