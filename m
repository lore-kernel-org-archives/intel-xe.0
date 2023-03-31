Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6170AC6FD18
	for <intel-xe@archiver.kernel.org>; Fri, 31 Mar 2023 11:49:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A118410F1FA;
	Fri, 31 Mar 2023 11:49:07 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B1110F1FA
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Mar 2023 11:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680263346; x=1711799346;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=+fss///RnpkXovS069KdkMUPel3qnX9c9EyUjPIr8PY=;
 b=Lv56BXXNGskzeyuRO1GAD/Wn/dNbxdAvbClwL2SXmN2snNHGQfK/pbVz
 SVsJDxtq6aPE3nL+uRaktFRmJP8E81pcYnljrI+BBNi1IBPd+8QdbUmxq
 O3tPNeQwqoRv3y1njBG+Wwx5wv4MYuxsXjI5NQbN77MLApnSRYWgMTElJ
 piOStrKpSv6ts4ehTTpOnFMYV6jajIBX+7k81w1WhT5MBXym16cKHdUY0
 1O7csFO4Ddh/eQZ8H+VxQ26F6wMlnDG3AP2L9eFN7CoyquDTe2ePTTm9/
 nGYkd1CcP6yp+yqARivMWiiQOwwS7AUbu7uXDVTpYeE5UebhfPkWwCdZi g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="338928884"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="338928884"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 04:49:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="809007806"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="809007806"
Received: from bachaue1-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.41.110])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 04:49:03 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20230331102419.521392-6-maarten.lankhorst@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230331102419.521392-1-maarten.lankhorst@linux.intel.com>
 <20230331102419.521392-6-maarten.lankhorst@linux.intel.com>
Date: Fri, 31 Mar 2023 14:49:00 +0300
Message-ID: <874jq12lar.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH 5/6] drm/xe: Build soc files directly
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

On Fri, 31 Mar 2023, Maarten Lankhorst <maarten.lankhorst@linux.intel.com> =
wrote:
> Instead of making a copy that is hard to keep up to date, build the
> source directly.
>
> Add a rule for soc_* files, and use those to build i915.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/soc/intel_dram.c         |  30 +-
>  drivers/gpu/drm/xe/Makefile                   |   8 +-
>  .../gpu/drm/xe/compat-i915-headers/i915_drv.h |   2 +-
>  .../soc}/intel_dram.h                         |   1 -
>  .../soc}/intel_pch.h                          |   0
>  drivers/gpu/drm/xe/display/ext/intel_dram.c   | 495 ------------------
>  drivers/gpu/drm/xe/display/ext/intel_pch.c    | 157 ------
>  drivers/gpu/drm/xe/xe_device_types.h          |   2 +-
>  drivers/gpu/drm/xe/xe_display.c               |   2 +-
>  9 files changed, 28 insertions(+), 669 deletions(-)
>  rename drivers/gpu/drm/xe/{display/ext =3D> compat-i915-headers/soc}/int=
el_dram.h (80%)
>  rename drivers/gpu/drm/xe/{display/ext =3D> compat-i915-headers/soc}/int=
el_pch.h (100%)
>  delete mode 100644 drivers/gpu/drm/xe/display/ext/intel_dram.c
>  delete mode 100644 drivers/gpu/drm/xe/display/ext/intel_pch.c
>
> diff --git a/drivers/gpu/drm/i915/soc/intel_dram.c b/drivers/gpu/drm/i915=
/soc/intel_dram.c
> index 9649051ed8ed..13fe18a9372f 100644
> --- a/drivers/gpu/drm/i915/soc/intel_dram.c
> +++ b/drivers/gpu/drm/i915/soc/intel_dram.c
> @@ -9,8 +9,12 @@
>  #include "i915_reg.h"
>  #include "intel_dram.h"
>  #include "intel_mchbar_regs.h"
> -#include "intel_pcode.h"
> +#ifdef I915
>  #include "vlv_sideband.h"
> +#include "display/intel_de.h"
> +#else
> +#include "xe_de.h"
> +#endif
>=20=20
>  struct dram_dimm_info {
>  	u16 size;
> @@ -43,6 +47,8 @@ static const char *intel_dram_type_str(enum intel_dram_=
type type)
>=20=20
>  #undef DRAM_TYPE_STR
>=20=20
> +#ifdef I915
> +
>  static void pnv_detect_mem_freq(struct drm_i915_private *dev_priv)
>  {
>  	u32 tmp;
> @@ -191,6 +197,9 @@ static void detect_mem_freq(struct drm_i915_private *=
i915)
>  	if (i915->mem_freq)
>  		drm_dbg(&i915->drm, "DDR speed: %d MHz\n", i915->mem_freq);
>  }
> +#else
> +#define detect_mem_freq(i915) do { } while (0)
> +#endif
>=20=20
>  static int intel_dimm_num_devices(const struct dram_dimm_info *dimm)
>  {
> @@ -339,14 +348,12 @@ skl_dram_get_channels_info(struct drm_i915_private =
*i915)
>  	u32 val;
>  	int ret;
>=20=20
> -	val =3D intel_uncore_read(&i915->uncore,
> -				SKL_MAD_DIMM_CH0_0_0_0_MCHBAR_MCMAIN);
> +	val =3D intel_de_read(i915, SKL_MAD_DIMM_CH0_0_0_0_MCHBAR_MCMAIN);

This isn't great, because those aren't DE registers. So this won't fly
upstream.

BR,
Jani.


>  	ret =3D skl_dram_get_channel_info(i915, &ch0, 0, val);
>  	if (ret =3D=3D 0)
>  		dram_info->num_channels++;
>=20=20
> -	val =3D intel_uncore_read(&i915->uncore,
> -				SKL_MAD_DIMM_CH1_0_0_0_MCHBAR_MCMAIN);
> +	val =3D intel_de_read(i915, SKL_MAD_DIMM_CH1_0_0_0_MCHBAR_MCMAIN);
>  	ret =3D skl_dram_get_channel_info(i915, &ch1, 1, val);
>  	if (ret =3D=3D 0)
>  		dram_info->num_channels++;
> @@ -376,8 +383,7 @@ skl_get_dram_type(struct drm_i915_private *i915)
>  {
>  	u32 val;
>=20=20
> -	val =3D intel_uncore_read(&i915->uncore,
> -				SKL_MAD_INTER_CHANNEL_0_0_0_MCHBAR_MCMAIN);
> +	val =3D intel_de_read(i915, SKL_MAD_INTER_CHANNEL_0_0_0_MCHBAR_MCMAIN);
>=20=20
>  	switch (val & SKL_DRAM_DDR_TYPE_MASK) {
>  	case SKL_DRAM_DDR_TYPE_DDR3:
> @@ -503,7 +509,7 @@ static int bxt_get_dram_info(struct drm_i915_private =
*i915)
>  		struct dram_dimm_info dimm;
>  		enum intel_dram_type type;
>=20=20
> -		val =3D intel_uncore_read(&i915->uncore, BXT_D_CR_DRP0_DUNIT(i));
> +		val =3D intel_de_read(i915, BXT_D_CR_DRP0_DUNIT(i));
>  		if (val =3D=3D 0xFFFFFFFF)
>  			continue;
>=20=20
> @@ -543,8 +549,8 @@ static int icl_pcode_read_mem_global_info(struct drm_=
i915_private *dev_priv)
>  	u32 val =3D 0;
>  	int ret;
>=20=20
> -	ret =3D snb_pcode_read(&dev_priv->uncore, ICL_PCODE_MEM_SUBSYSYSTEM_INF=
O |
> -			     ICL_PCODE_MEM_SS_READ_GLOBAL_INFO, &val, NULL);
> +	ret =3D intel_de_pcode_read(dev_priv, ICL_PCODE_MEM_SUBSYSYSTEM_INFO |
> +				  ICL_PCODE_MEM_SS_READ_GLOBAL_INFO, &val, NULL);
>  	if (ret)
>  		return ret;
>=20=20
> @@ -618,7 +624,7 @@ static int gen12_get_dram_info(struct drm_i915_privat=
e *i915)
>=20=20
>  static int xelpdp_get_dram_info(struct drm_i915_private *i915)
>  {
> -	u32 val =3D intel_uncore_read(&i915->uncore, MTL_MEM_SS_INFO_GLOBAL);
> +	u32 val =3D intel_de_read(i915, MTL_MEM_SS_INFO_GLOBAL);
>  	struct dram_info *dram_info =3D &i915->dram_info;
>=20=20
>  	switch (REG_FIELD_GET(MTL_DDR_TYPE_MASK, val)) {
> @@ -687,6 +693,7 @@ void intel_dram_detect(struct drm_i915_private *i915)
>  		    str_yes_no(dram_info->wm_lv_0_adjust_needed));
>  }
>=20=20
> +#ifdef I915
>  static u32 gen9_edram_size_mb(struct drm_i915_private *i915, u32 cap)
>  {
>  	static const u8 ways[8] =3D { 4, 8, 12, 16, 16, 16, 16, 16 };
> @@ -722,3 +729,4 @@ void intel_dram_edram_detect(struct drm_i915_private =
*i915)
>=20=20
>  	drm_info(&i915->drm, "Found %uMB of eDRAM\n", i915->edram_size_mb);
>  }
> +#endif
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 669c7b6f552c..3ebef784445e 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -124,6 +124,10 @@ $(obj)/display/intel_%.o: $(srctree)/drivers/gpu/drm=
/i915/display/intel_%.c FORC
>  	$(call cmd,force_checksrc)
>  	$(call if_changed_rule,cc_o_c)
>=20=20
> +$(obj)/display/soc_%.o: $(srctree)/drivers/gpu/drm/i915/soc/%.c FORCE
> +	$(call cmd,force_checksrc)
> +	$(call if_changed_rule,cc_o_c)
> +
>  # Display..
>  xe-$(CONFIG_DRM_XE_DISPLAY) +=3D \
>  	xe_display.o \
> @@ -204,8 +208,8 @@ xe-$(CONFIG_DRM_XE_DISPLAY) +=3D \
>  	display/ext/i915_irq.o \
>  	display/ext/i9xx_wm.o \
>  	display/ext/intel_device_info.o \
> -	display/ext/intel_dram.o \
> -	display/ext/intel_pch.o \
> +	display/soc_intel_dram.o \
> +	display/soc_intel_pch.o \
>  	display/ext/intel_pm.o
>=20=20
>  ifeq ($(CONFIG_ACPI),y)
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/=
gpu/drm/xe/compat-i915-headers/i915_drv.h
> index 92dfbb8b3ca4..fa8c53e91bce 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> @@ -15,7 +15,7 @@
>  #include "xe_pm.h"
>  #include "xe_step.h"
>  #include "i915_reg_defs.h"
> -#include "intel_pch.h"
> +#include "soc/intel_pch.h"
>  #include "i915_utils.h"
>  #include <linux/pm_runtime.h>
>=20=20
> diff --git a/drivers/gpu/drm/xe/display/ext/intel_dram.h b/drivers/gpu/dr=
m/xe/compat-i915-headers/soc/intel_dram.h
> similarity index 80%
> rename from drivers/gpu/drm/xe/display/ext/intel_dram.h
> rename to drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h
> index 4ba13c13162c..7ed5b6e1f805 100644
> --- a/drivers/gpu/drm/xe/display/ext/intel_dram.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h
> @@ -8,7 +8,6 @@
>=20=20
>  struct drm_i915_private;
>=20=20
> -void intel_dram_edram_detect(struct drm_i915_private *i915);
>  void intel_dram_detect(struct drm_i915_private *i915);
>=20=20
>  #endif /* __INTEL_DRAM_H__ */
> diff --git a/drivers/gpu/drm/xe/display/ext/intel_pch.h b/drivers/gpu/drm=
/xe/compat-i915-headers/soc/intel_pch.h
> similarity index 100%
> rename from drivers/gpu/drm/xe/display/ext/intel_pch.h
> rename to drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h
> diff --git a/drivers/gpu/drm/xe/display/ext/intel_dram.c b/drivers/gpu/dr=
m/xe/display/ext/intel_dram.c
> deleted file mode 100644
> index a2df0c502c34..000000000000
> --- a/drivers/gpu/drm/xe/display/ext/intel_dram.c
> +++ /dev/null
> @@ -1,495 +0,0 @@
> -// SPDX-License-Identifier: MIT
> -/*
> - * Copyright =C2=A9 2020 Intel Corporation
> - */
> -
> -#include <linux/string_helpers.h>
> -
> -#include "i915_drv.h"
> -#include "i915_reg.h"
> -#include "intel_de.h"
> -#include "intel_dram.h"
> -#include "intel_mchbar_regs.h"
> -
> -struct dram_dimm_info {
> -	u16 size;
> -	u8 width, ranks;
> -};
> -
> -struct dram_channel_info {
> -	struct dram_dimm_info dimm_l, dimm_s;
> -	u8 ranks;
> -	bool is_16gb_dimm;
> -};
> -
> -#define DRAM_TYPE_STR(type) [INTEL_DRAM_ ## type] =3D #type
> -
> -static const char *intel_dram_type_str(enum intel_dram_type type)
> -{
> -	static const char * const str[] =3D {
> -		DRAM_TYPE_STR(UNKNOWN),
> -		DRAM_TYPE_STR(DDR3),
> -		DRAM_TYPE_STR(DDR4),
> -		DRAM_TYPE_STR(LPDDR3),
> -		DRAM_TYPE_STR(LPDDR4),
> -	};
> -
> -	if (type >=3D ARRAY_SIZE(str))
> -		type =3D INTEL_DRAM_UNKNOWN;
> -
> -	return str[type];
> -}
> -
> -#undef DRAM_TYPE_STR
> -
> -static int intel_dimm_num_devices(const struct dram_dimm_info *dimm)
> -{
> -	return dimm->ranks * 64 / (dimm->width ?: 1);
> -}
> -
> -/* Returns total Gb for the whole DIMM */
> -static int skl_get_dimm_size(u16 val)
> -{
> -	return (val & SKL_DRAM_SIZE_MASK) * 8;
> -}
> -
> -static int skl_get_dimm_width(u16 val)
> -{
> -	if (skl_get_dimm_size(val) =3D=3D 0)
> -		return 0;
> -
> -	switch (val & SKL_DRAM_WIDTH_MASK) {
> -	case SKL_DRAM_WIDTH_X8:
> -	case SKL_DRAM_WIDTH_X16:
> -	case SKL_DRAM_WIDTH_X32:
> -		val =3D (val & SKL_DRAM_WIDTH_MASK) >> SKL_DRAM_WIDTH_SHIFT;
> -		return 8 << val;
> -	default:
> -		MISSING_CASE(val);
> -		return 0;
> -	}
> -}
> -
> -static int skl_get_dimm_ranks(u16 val)
> -{
> -	if (skl_get_dimm_size(val) =3D=3D 0)
> -		return 0;
> -
> -	val =3D (val & SKL_DRAM_RANK_MASK) >> SKL_DRAM_RANK_SHIFT;
> -
> -	return val + 1;
> -}
> -
> -/* Returns total Gb for the whole DIMM */
> -static int icl_get_dimm_size(u16 val)
> -{
> -	return (val & ICL_DRAM_SIZE_MASK) * 8 / 2;
> -}
> -
> -static int icl_get_dimm_width(u16 val)
> -{
> -	if (icl_get_dimm_size(val) =3D=3D 0)
> -		return 0;
> -
> -	switch (val & ICL_DRAM_WIDTH_MASK) {
> -	case ICL_DRAM_WIDTH_X8:
> -	case ICL_DRAM_WIDTH_X16:
> -	case ICL_DRAM_WIDTH_X32:
> -		val =3D (val & ICL_DRAM_WIDTH_MASK) >> ICL_DRAM_WIDTH_SHIFT;
> -		return 8 << val;
> -	default:
> -		MISSING_CASE(val);
> -		return 0;
> -	}
> -}
> -
> -static int icl_get_dimm_ranks(u16 val)
> -{
> -	if (icl_get_dimm_size(val) =3D=3D 0)
> -		return 0;
> -
> -	val =3D (val & ICL_DRAM_RANK_MASK) >> ICL_DRAM_RANK_SHIFT;
> -
> -	return val + 1;
> -}
> -
> -static bool
> -skl_is_16gb_dimm(const struct dram_dimm_info *dimm)
> -{
> -	/* Convert total Gb to Gb per DRAM device */
> -	return dimm->size / (intel_dimm_num_devices(dimm) ?: 1) =3D=3D 16;
> -}
> -
> -static void
> -skl_dram_get_dimm_info(struct drm_i915_private *i915,
> -		       struct dram_dimm_info *dimm,
> -		       int channel, char dimm_name, u16 val)
> -{
> -	if (GRAPHICS_VER(i915) >=3D 11) {
> -		dimm->size =3D icl_get_dimm_size(val);
> -		dimm->width =3D icl_get_dimm_width(val);
> -		dimm->ranks =3D icl_get_dimm_ranks(val);
> -	} else {
> -		dimm->size =3D skl_get_dimm_size(val);
> -		dimm->width =3D skl_get_dimm_width(val);
> -		dimm->ranks =3D skl_get_dimm_ranks(val);
> -	}
> -
> -	drm_dbg_kms(&i915->drm,
> -		    "CH%u DIMM %c size: %u Gb, width: X%u, ranks: %u, 16Gb DIMMs: %s\n=
",
> -		    channel, dimm_name, dimm->size, dimm->width, dimm->ranks,
> -		    str_yes_no(skl_is_16gb_dimm(dimm)));
> -}
> -
> -static int
> -skl_dram_get_channel_info(struct drm_i915_private *i915,
> -			  struct dram_channel_info *ch,
> -			  int channel, u32 val)
> -{
> -	skl_dram_get_dimm_info(i915, &ch->dimm_l,
> -			       channel, 'L', val & 0xffff);
> -	skl_dram_get_dimm_info(i915, &ch->dimm_s,
> -			       channel, 'S', val >> 16);
> -
> -	if (ch->dimm_l.size =3D=3D 0 && ch->dimm_s.size =3D=3D 0) {
> -		drm_dbg_kms(&i915->drm, "CH%u not populated\n", channel);
> -		return -EINVAL;
> -	}
> -
> -	if (ch->dimm_l.ranks =3D=3D 2 || ch->dimm_s.ranks =3D=3D 2)
> -		ch->ranks =3D 2;
> -	else if (ch->dimm_l.ranks =3D=3D 1 && ch->dimm_s.ranks =3D=3D 1)
> -		ch->ranks =3D 2;
> -	else
> -		ch->ranks =3D 1;
> -
> -	ch->is_16gb_dimm =3D skl_is_16gb_dimm(&ch->dimm_l) ||
> -		skl_is_16gb_dimm(&ch->dimm_s);
> -
> -	drm_dbg_kms(&i915->drm, "CH%u ranks: %u, 16Gb DIMMs: %s\n",
> -		    channel, ch->ranks, str_yes_no(ch->is_16gb_dimm));
> -
> -	return 0;
> -}
> -
> -static bool
> -intel_is_dram_symmetric(const struct dram_channel_info *ch0,
> -			const struct dram_channel_info *ch1)
> -{
> -	return !memcmp(ch0, ch1, sizeof(*ch0)) &&
> -		(ch0->dimm_s.size =3D=3D 0 ||
> -		 !memcmp(&ch0->dimm_l, &ch0->dimm_s, sizeof(ch0->dimm_l)));
> -}
> -
> -static int
> -skl_dram_get_channels_info(struct drm_i915_private *i915)
> -{
> -	struct dram_info *dram_info =3D &i915->dram_info;
> -	struct dram_channel_info ch0 =3D {}, ch1 =3D {};
> -	u32 val;
> -	int ret;
> -
> -	val =3D intel_de_read(i915, SKL_MAD_DIMM_CH0_0_0_0_MCHBAR_MCMAIN);
> -	ret =3D skl_dram_get_channel_info(i915, &ch0, 0, val);
> -	if (ret =3D=3D 0)
> -		dram_info->num_channels++;
> -
> -	val =3D intel_de_read(i915, SKL_MAD_DIMM_CH1_0_0_0_MCHBAR_MCMAIN);
> -	ret =3D skl_dram_get_channel_info(i915, &ch1, 1, val);
> -	if (ret =3D=3D 0)
> -		dram_info->num_channels++;
> -
> -	if (dram_info->num_channels =3D=3D 0) {
> -		drm_info(&i915->drm, "Number of memory channels is zero\n");
> -		return -EINVAL;
> -	}
> -
> -	if (ch0.ranks =3D=3D 0 && ch1.ranks =3D=3D 0) {
> -		drm_info(&i915->drm, "couldn't get memory rank information\n");
> -		return -EINVAL;
> -	}
> -
> -	dram_info->wm_lv_0_adjust_needed =3D ch0.is_16gb_dimm || ch1.is_16gb_di=
mm;
> -
> -	dram_info->symmetric_memory =3D intel_is_dram_symmetric(&ch0, &ch1);
> -
> -	drm_dbg_kms(&i915->drm, "Memory configuration is symmetric? %s\n",
> -		    str_yes_no(dram_info->symmetric_memory));
> -
> -	return 0;
> -}
> -
> -static enum intel_dram_type
> -skl_get_dram_type(struct drm_i915_private *i915)
> -{
> -	u32 val;
> -
> -	val =3D intel_de_read(i915, SKL_MAD_INTER_CHANNEL_0_0_0_MCHBAR_MCMAIN);
> -
> -	switch (val & SKL_DRAM_DDR_TYPE_MASK) {
> -	case SKL_DRAM_DDR_TYPE_DDR3:
> -		return INTEL_DRAM_DDR3;
> -	case SKL_DRAM_DDR_TYPE_DDR4:
> -		return INTEL_DRAM_DDR4;
> -	case SKL_DRAM_DDR_TYPE_LPDDR3:
> -		return INTEL_DRAM_LPDDR3;
> -	case SKL_DRAM_DDR_TYPE_LPDDR4:
> -		return INTEL_DRAM_LPDDR4;
> -	default:
> -		MISSING_CASE(val);
> -		return INTEL_DRAM_UNKNOWN;
> -	}
> -}
> -
> -static int
> -skl_get_dram_info(struct drm_i915_private *i915)
> -{
> -	struct dram_info *dram_info =3D &i915->dram_info;
> -	int ret;
> -
> -	dram_info->type =3D skl_get_dram_type(i915);
> -	drm_dbg_kms(&i915->drm, "DRAM type: %s\n",
> -		    intel_dram_type_str(dram_info->type));
> -
> -	ret =3D skl_dram_get_channels_info(i915);
> -	if (ret)
> -		return ret;
> -
> -	return 0;
> -}
> -
> -/* Returns Gb per DRAM device */
> -static int bxt_get_dimm_size(u32 val)
> -{
> -	switch (val & BXT_DRAM_SIZE_MASK) {
> -	case BXT_DRAM_SIZE_4GBIT:
> -		return 4;
> -	case BXT_DRAM_SIZE_6GBIT:
> -		return 6;
> -	case BXT_DRAM_SIZE_8GBIT:
> -		return 8;
> -	case BXT_DRAM_SIZE_12GBIT:
> -		return 12;
> -	case BXT_DRAM_SIZE_16GBIT:
> -		return 16;
> -	default:
> -		MISSING_CASE(val);
> -		return 0;
> -	}
> -}
> -
> -static int bxt_get_dimm_width(u32 val)
> -{
> -	if (!bxt_get_dimm_size(val))
> -		return 0;
> -
> -	val =3D (val & BXT_DRAM_WIDTH_MASK) >> BXT_DRAM_WIDTH_SHIFT;
> -
> -	return 8 << val;
> -}
> -
> -static int bxt_get_dimm_ranks(u32 val)
> -{
> -	if (!bxt_get_dimm_size(val))
> -		return 0;
> -
> -	switch (val & BXT_DRAM_RANK_MASK) {
> -	case BXT_DRAM_RANK_SINGLE:
> -		return 1;
> -	case BXT_DRAM_RANK_DUAL:
> -		return 2;
> -	default:
> -		MISSING_CASE(val);
> -		return 0;
> -	}
> -}
> -
> -static enum intel_dram_type bxt_get_dimm_type(u32 val)
> -{
> -	if (!bxt_get_dimm_size(val))
> -		return INTEL_DRAM_UNKNOWN;
> -
> -	switch (val & BXT_DRAM_TYPE_MASK) {
> -	case BXT_DRAM_TYPE_DDR3:
> -		return INTEL_DRAM_DDR3;
> -	case BXT_DRAM_TYPE_LPDDR3:
> -		return INTEL_DRAM_LPDDR3;
> -	case BXT_DRAM_TYPE_DDR4:
> -		return INTEL_DRAM_DDR4;
> -	case BXT_DRAM_TYPE_LPDDR4:
> -		return INTEL_DRAM_LPDDR4;
> -	default:
> -		MISSING_CASE(val);
> -		return INTEL_DRAM_UNKNOWN;
> -	}
> -}
> -
> -static void bxt_get_dimm_info(struct dram_dimm_info *dimm, u32 val)
> -{
> -	dimm->width =3D bxt_get_dimm_width(val);
> -	dimm->ranks =3D bxt_get_dimm_ranks(val);
> -
> -	/*
> -	 * Size in register is Gb per DRAM device. Convert to total
> -	 * Gb to match the way we report this for non-LP platforms.
> -	 */
> -	dimm->size =3D bxt_get_dimm_size(val) * intel_dimm_num_devices(dimm);
> -}
> -
> -static int bxt_get_dram_info(struct drm_i915_private *i915)
> -{
> -	struct dram_info *dram_info =3D &i915->dram_info;
> -	u32 val;
> -	u8 valid_ranks =3D 0;
> -	int i;
> -
> -	/*
> -	 * Now read each DUNIT8/9/10/11 to check the rank of each dimms.
> -	 */
> -	for (i =3D BXT_D_CR_DRP0_DUNIT_START; i <=3D BXT_D_CR_DRP0_DUNIT_END; i=
++) {
> -		struct dram_dimm_info dimm;
> -		enum intel_dram_type type;
> -
> -		val =3D intel_de_read(i915, BXT_D_CR_DRP0_DUNIT(i));
> -		if (val =3D=3D 0xFFFFFFFF)
> -			continue;
> -
> -		dram_info->num_channels++;
> -
> -		bxt_get_dimm_info(&dimm, val);
> -		type =3D bxt_get_dimm_type(val);
> -
> -		drm_WARN_ON(&i915->drm, type !=3D INTEL_DRAM_UNKNOWN &&
> -			    dram_info->type !=3D INTEL_DRAM_UNKNOWN &&
> -			    dram_info->type !=3D type);
> -
> -		drm_dbg_kms(&i915->drm,
> -			    "CH%u DIMM size: %u Gb, width: X%u, ranks: %u, type: %s\n",
> -			    i - BXT_D_CR_DRP0_DUNIT_START,
> -			    dimm.size, dimm.width, dimm.ranks,
> -			    intel_dram_type_str(type));
> -
> -		if (valid_ranks =3D=3D 0)
> -			valid_ranks =3D dimm.ranks;
> -
> -		if (type !=3D INTEL_DRAM_UNKNOWN)
> -			dram_info->type =3D type;
> -	}
> -
> -	if (dram_info->type =3D=3D INTEL_DRAM_UNKNOWN || valid_ranks =3D=3D 0) {
> -		drm_info(&i915->drm, "couldn't get memory information\n");
> -		return -EINVAL;
> -	}
> -
> -	return 0;
> -}
> -
> -static int icl_pcode_read_mem_global_info(struct drm_i915_private *dev_p=
riv)
> -{
> -	struct dram_info *dram_info =3D &dev_priv->dram_info;
> -	u32 val =3D 0;
> -	int ret;
> -
> -	ret =3D intel_de_pcode_read(dev_priv, ICL_PCODE_MEM_SUBSYSYSTEM_INFO |
> -			     ICL_PCODE_MEM_SS_READ_GLOBAL_INFO, &val, NULL);
> -	if (ret)
> -		return ret;
> -
> -	if (GRAPHICS_VER(dev_priv) >=3D 12) {
> -		switch (val & 0xf) {
> -		case 0:
> -			dram_info->type =3D INTEL_DRAM_DDR4;
> -			break;
> -		case 1:
> -			dram_info->type =3D INTEL_DRAM_DDR5;
> -			break;
> -		case 2:
> -			dram_info->type =3D INTEL_DRAM_LPDDR5;
> -			break;
> -		case 3:
> -			dram_info->type =3D INTEL_DRAM_LPDDR4;
> -			break;
> -		case 4:
> -			dram_info->type =3D INTEL_DRAM_DDR3;
> -			break;
> -		case 5:
> -			dram_info->type =3D INTEL_DRAM_LPDDR3;
> -			break;
> -		default:
> -			MISSING_CASE(val & 0xf);
> -			return -EINVAL;
> -		}
> -	} else {
> -		switch (val & 0xf) {
> -		case 0:
> -			dram_info->type =3D INTEL_DRAM_DDR4;
> -			break;
> -		case 1:
> -			dram_info->type =3D INTEL_DRAM_DDR3;
> -			break;
> -		case 2:
> -			dram_info->type =3D INTEL_DRAM_LPDDR3;
> -			break;
> -		case 3:
> -			dram_info->type =3D INTEL_DRAM_LPDDR4;
> -			break;
> -		default:
> -			MISSING_CASE(val & 0xf);
> -			return -EINVAL;
> -		}
> -	}
> -
> -	dram_info->num_channels =3D (val & 0xf0) >> 4;
> -	dram_info->num_qgv_points =3D (val & 0xf00) >> 8;
> -	dram_info->num_psf_gv_points =3D (val & 0x3000) >> 12;
> -
> -	return 0;
> -}
> -
> -static int gen11_get_dram_info(struct drm_i915_private *i915)
> -{
> -	int ret =3D skl_get_dram_info(i915);
> -
> -	if (ret)
> -		return ret;
> -
> -	return icl_pcode_read_mem_global_info(i915);
> -}
> -
> -static int gen12_get_dram_info(struct drm_i915_private *i915)
> -{
> -	i915->dram_info.wm_lv_0_adjust_needed =3D false;
> -
> -	return icl_pcode_read_mem_global_info(i915);
> -}
> -
> -void intel_dram_detect(struct drm_i915_private *i915)
> -{
> -	struct dram_info *dram_info =3D &i915->dram_info;
> -	int ret;
> -
> -	if (GRAPHICS_VER(i915) < 9 || IS_DG2(i915) || !HAS_DISPLAY(i915))
> -		return;
> -
> -	/*
> -	 * Assume level 0 watermark latency adjustment is needed until proven
> -	 * otherwise, this w/a is not needed by bxt/glk.
> -	 */
> -	dram_info->wm_lv_0_adjust_needed =3D !IS_GEN9_LP(i915);
> -
> -	if (GRAPHICS_VER(i915) >=3D 12)
> -		ret =3D gen12_get_dram_info(i915);
> -	else if (GRAPHICS_VER(i915) >=3D 11)
> -		ret =3D gen11_get_dram_info(i915);
> -	else if (IS_GEN9_LP(i915))
> -		ret =3D bxt_get_dram_info(i915);
> -	else
> -		ret =3D skl_get_dram_info(i915);
> -	if (ret)
> -		return;
> -
> -	drm_dbg_kms(&i915->drm, "DRAM channels: %u\n", dram_info->num_channels);
> -
> -	drm_dbg_kms(&i915->drm, "Watermark level 0 adjustment needed: %s\n",
> -		    str_yes_no(dram_info->wm_lv_0_adjust_needed));
> -}
> diff --git a/drivers/gpu/drm/xe/display/ext/intel_pch.c b/drivers/gpu/drm=
/xe/display/ext/intel_pch.c
> deleted file mode 100644
> index dc2b15b5c4be..000000000000
> --- a/drivers/gpu/drm/xe/display/ext/intel_pch.c
> +++ /dev/null
> @@ -1,157 +0,0 @@
> -// SPDX-License-Identifier: MIT
> -/*
> - * Copyright 2019 Intel Corporation.
> - */
> -
> -#include "i915_drv.h"
> -#include "i915_utils.h"
> -#include "intel_pch.h"
> -
> -/* Map PCH device id to PCH type, or PCH_NONE if unknown. */
> -static enum intel_pch
> -intel_pch_type(const struct drm_i915_private *dev_priv, unsigned short i=
d)
> -{
> -	switch (id) {
> -	case INTEL_PCH_MCC_DEVICE_ID_TYPE:
> -		drm_dbg_kms(&dev_priv->drm, "Found Mule Creek Canyon PCH\n");
> -		drm_WARN_ON(&dev_priv->drm, !IS_JSL_EHL(dev_priv));
> -		/* MCC is TGP compatible */
> -		return PCH_TGP;
> -	case INTEL_PCH_TGP_DEVICE_ID_TYPE:
> -	case INTEL_PCH_TGP2_DEVICE_ID_TYPE:
> -		drm_dbg_kms(&dev_priv->drm, "Found Tiger Lake LP PCH\n");
> -		drm_WARN_ON(&dev_priv->drm, !IS_TIGERLAKE(dev_priv) &&
> -			    !IS_ROCKETLAKE(dev_priv) &&
> -			    !IS_GEN9_BC(dev_priv));
> -		return PCH_TGP;
> -	case INTEL_PCH_ADP_DEVICE_ID_TYPE:
> -	case INTEL_PCH_ADP2_DEVICE_ID_TYPE:
> -	case INTEL_PCH_ADP3_DEVICE_ID_TYPE:
> -	case INTEL_PCH_ADP4_DEVICE_ID_TYPE:
> -		drm_dbg_kms(&dev_priv->drm, "Found Alder Lake PCH\n");
> -		drm_WARN_ON(&dev_priv->drm, !IS_ALDERLAKE_S(dev_priv) &&
> -			    !IS_ALDERLAKE_P(dev_priv));
> -		return PCH_ADP;
> -	case INTEL_PCH_MTP_DEVICE_ID_TYPE:
> -	case INTEL_PCH_MTP2_DEVICE_ID_TYPE:
> -		drm_dbg_kms(&dev_priv->drm, "Found Meteor Lake PCH\n");
> -		drm_WARN_ON(&dev_priv->drm, !IS_METEORLAKE(dev_priv));
> -		return PCH_MTP;
> -	default:
> -		return PCH_NONE;
> -	}
> -}
> -
> -static bool intel_is_virt_pch(unsigned short id,
> -			      unsigned short svendor, unsigned short sdevice)
> -{
> -	return (id =3D=3D INTEL_PCH_P2X_DEVICE_ID_TYPE ||
> -		id =3D=3D INTEL_PCH_P3X_DEVICE_ID_TYPE ||
> -		(id =3D=3D INTEL_PCH_QEMU_DEVICE_ID_TYPE &&
> -		 svendor =3D=3D PCI_SUBVENDOR_ID_REDHAT_QUMRANET &&
> -		 sdevice =3D=3D PCI_SUBDEVICE_ID_QEMU));
> -}
> -
> -static void
> -intel_virt_detect_pch(const struct drm_i915_private *dev_priv,
> -		      unsigned short *pch_id, enum intel_pch *pch_type)
> -{
> -	unsigned short id =3D 0;
> -
> -	/*
> -	 * In a virtualized passthrough environment we can be in a
> -	 * setup where the ISA bridge is not able to be passed through.
> -	 * In this case, a south bridge can be emulated and we have to
> -	 * make an educated guess as to which PCH is really there.
> -	 */
> -
> -	if (IS_METEORLAKE(dev_priv))
> -		id =3D INTEL_PCH_MTP_DEVICE_ID_TYPE;
> -	else if (IS_ALDERLAKE_S(dev_priv) || IS_ALDERLAKE_P(dev_priv))
> -		id =3D INTEL_PCH_ADP_DEVICE_ID_TYPE;
> -	else if (IS_TIGERLAKE(dev_priv) || IS_ROCKETLAKE(dev_priv))
> -		id =3D INTEL_PCH_TGP_DEVICE_ID_TYPE;
> -	else BUG_ON(1);
> -
> -	if (id)
> -		drm_dbg_kms(&dev_priv->drm, "Assuming PCH ID %04x\n", id);
> -	else
> -		drm_dbg_kms(&dev_priv->drm, "Assuming no PCH\n");
> -
> -	*pch_type =3D intel_pch_type(dev_priv, id);
> -
> -	/* Sanity check virtual PCH id */
> -	if (drm_WARN_ON(&dev_priv->drm,
> -			id && *pch_type =3D=3D PCH_NONE))
> -		id =3D 0;
> -
> -	*pch_id =3D id;
> -}
> -
> -void intel_detect_pch(struct drm_i915_private *dev_priv)
> -{
> -	struct pci_dev *pch =3D NULL;
> -	unsigned short id;
> -	enum intel_pch pch_type;
> -
> -	/* DG1 has south engine display on the same PCI device */
> -	if (IS_DG1(dev_priv)) {
> -		dev_priv->pch_type =3D PCH_DG1;
> -		return;
> -	} else if (IS_DG2(dev_priv)) {
> -		dev_priv->pch_type =3D PCH_DG2;
> -		return;
> -	}
> -
> -	/*
> -	 * The reason to probe ISA bridge instead of Dev31:Fun0 is to
> -	 * make graphics device passthrough work easy for VMM, that only
> -	 * need to expose ISA bridge to let driver know the real hardware
> -	 * underneath. This is a requirement from virtualization team.
> -	 *
> -	 * In some virtualized environments (e.g. XEN), there is irrelevant
> -	 * ISA bridge in the system. To work reliably, we should scan trhough
> -	 * all the ISA bridge devices and check for the first match, instead
> -	 * of only checking the first one.
> -	 */
> -	while ((pch =3D pci_get_class(PCI_CLASS_BRIDGE_ISA << 8, pch))) {
> -		if (pch->vendor !=3D PCI_VENDOR_ID_INTEL)
> -			continue;
> -
> -		id =3D pch->device & INTEL_PCH_DEVICE_ID_MASK;
> -
> -		pch_type =3D intel_pch_type(dev_priv, id);
> -		if (pch_type !=3D PCH_NONE) {
> -			dev_priv->pch_type =3D pch_type;
> -			dev_priv->pch_id =3D id;
> -			break;
> -		} else if (intel_is_virt_pch(id, pch->subsystem_vendor,
> -					     pch->subsystem_device)) {
> -			intel_virt_detect_pch(dev_priv, &id, &pch_type);
> -			dev_priv->pch_type =3D pch_type;
> -			dev_priv->pch_id =3D id;
> -			break;
> -		}
> -	}
> -
> -	/*
> -	 * Use PCH_NOP (PCH but no South Display) for PCH platforms without
> -	 * display.
> -	 */
> -	if (pch && !HAS_DISPLAY(dev_priv)) {
> -		drm_dbg_kms(&dev_priv->drm,
> -			    "Display disabled, reverting to NOP PCH\n");
> -		dev_priv->pch_type =3D PCH_NOP;
> -		dev_priv->pch_id =3D 0;
> -	} else if (!pch) {
> -		if (i915_run_as_guest() && HAS_DISPLAY(dev_priv)) {
> -			intel_virt_detect_pch(dev_priv, &id, &pch_type);
> -			dev_priv->pch_type =3D pch_type;
> -			dev_priv->pch_id =3D id;
> -		} else {
> -			drm_dbg_kms(&dev_priv->drm, "No PCH found.\n");
> -		}
> -	}
> -
> -	pci_dev_put(pch);
> -}
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe=
_device_types.h
> index 88f863edc41c..54de3229553b 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -18,7 +18,7 @@
>=20=20
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>  #include "ext/intel_device_info.h"
> -#include "ext/intel_pch.h"
> +#include "soc/intel_pch.h"
>  #include "intel_display_core.h"
>  #endif
>=20=20
> diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_disp=
lay.c
> index 64e65b29d8de..35dee29da832 100644
> --- a/drivers/gpu/drm/xe/xe_display.c
> +++ b/drivers/gpu/drm/xe/xe_display.c
> @@ -16,8 +16,8 @@
>  #include <drm/xe_drm.h>
>=20=20
>  #include "ext/i915_irq.h"
> -#include "ext/intel_dram.h"
>  #include "ext/intel_pm.h"
> +#include "soc/intel_dram.h"
>  #include "intel_acpi.h"
>  #include "intel_audio.h"
>  #include "intel_bw.h"

--=20
Jani Nikula, Intel Open Source Graphics Center
