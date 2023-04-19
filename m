Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55776C77B73
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 16:17:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D0A510E9F3;
	Wed, 19 Apr 2023 16:17:23 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95FFE10E1C1
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 16:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681921040; x=1713457040;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=koCP0KBVjKqt9dmR9SmBEWauG8qulCyLvx4alWyVtj8=;
 b=Dm2PqrYxjPhAe7fLLaVTgW4OcyBubB6Eupc5lp8zCrnK3Q/ys2T/VFOO
 P/+hKznWFgdkz3YOBFjEg+XQZ3P8+Yl20eEbavoXq4XDqL+sbPhbS1nji
 mpVGQ5twm71H5KDmKeqa2qJzSWaCTULi39cMhqTIZnpaOWBJozXVxSjJp
 pNFPnNBbowz+y9NAhykDtqVrh0aM540ss1jmeODOYbnwq3cJXq2g3Qswi
 be8JfXuIshLkW/A3EXciNNsDZg45wbWsWG60VSwMabLxIF0pbVul18URz
 3+9j8wAlAWtrjUnF8G61mfawAJw3EvoAhhr6tjaInHmjWH5zXZN7FTK3o g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="373377149"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="373377149"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 09:17:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="835367518"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="835367518"
Received: from yedidyal-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.47.37])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 09:17:16 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20230419074440.4006398-18-lucas.demarchi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230419074440.4006398-1-lucas.demarchi@intel.com>
 <20230419074440.4006398-18-lucas.demarchi@intel.com>
Date: Wed, 19 Apr 2023 19:17:14 +0300
Message-ID: <875y9ryhh1.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH 17/17] drm/xe: Move helper macros to separate
 header
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, 19 Apr 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> The macros to handle the RTP tables are very scary, but shouldn't be
> used outside of the header adding the infra. Move it to a separate
> header and make sure it's only included when it can be.

I've wondered if the macros are more trouble than they're worth...

>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile            |  2 +-
>  drivers/gpu/drm/xe/tests/xe_rtp_test.c |  2 +-
>  drivers/gpu/drm/xe/xe_rtp.h            | 40 +++------------------
>  drivers/gpu/drm/xe/xe_rtp_helpers.h    | 48 ++++++++++++++++++++++++++
>  4 files changed, 55 insertions(+), 37 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_rtp_helpers.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index aceca651de57..f3c38815011e 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -225,7 +225,7 @@ endif
>=20=20
>  # header test
>  always-$(CONFIG_DRM_XE_WERROR) +=3D \
> -	$(patsubst %.h,%.hdrtest, $(shell cd $(srctree)/$(src) && find * -name =
'*.h' $(skipdisplay)))
> +	$(patsubst %.h,%.hdrtest, $(shell cd $(srctree)/$(src) && find * -name =
'*.h' -not -path xe_rtp_helpers.h $(skipdisplay)))
>=20=20
>  quiet_cmd_hdrtest =3D HDRTEST $(patsubst %.hdrtest,%.h,$@)
>        cmd_hdrtest =3D $(CC) -DHDRTEST $(filter-out $(CFLAGS_GCOV), $(c_f=
lags)) $(cflags-display) -S -o /dev/null -x c /dev/null -include $<; touch =
$@
> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/=
tests/xe_rtp_test.c
> index ad917638d088..a5ec9ae22156 100644
> --- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> @@ -57,7 +57,7 @@ static const struct rtp_test_case cases[] =3D {
>  		.entries =3D (const struct xe_rtp_entry[]) {
>  			{ XE_RTP_NAME("basic-1"),
>  			  XE_RTP_RULES(FUNC(match_yes)),
> -			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(1)))
> +			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))

Ah, this was changed earlier in the series.

>  			},
>  			{ XE_RTP_NAME("basic-2"),
>  			  XE_RTP_RULES(FUNC(match_yes)),
> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> index ca458e4b0d3c..7242342f4971 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.h
> +++ b/drivers/gpu/drm/xe/xe_rtp.h
> @@ -9,8 +9,13 @@
>  #include <linux/types.h>
>  #include <linux/xarray.h>
>=20=20
> +#define _XE_RTP_INCLUDE_PRIVATE_HELPERS
> +
> +#include "xe_rtp_helpers.h"
>  #include "xe_rtp_types.h"
>=20=20
> +#undef _XE_RTP_INCLUDE_PRIVATE_HELPERS
> +
>  /*
>   * Register table poke infrastructure
>   */
> @@ -19,41 +24,6 @@ struct xe_hw_engine;
>  struct xe_gt;
>  struct xe_reg_sr;
>=20=20
> -/*
> - * Helper macros - not to be used outside this header.
> - */
> -#define _XE_ESC(...) __VA_ARGS__
> -#define _XE_COUNT_ARGS(...) _XE_ESC(__XE_COUNT_ARGS(__VA_ARGS__,5,4,3,2,=
1,))
> -#define __XE_COUNT_ARGS(_,_5,_4,_3,_2,X_,...) X_
> -
> -#define _XE_CONCAT(a, b) __XE_CONCAT(a, b)
> -#define __XE_CONCAT(a, b) a ## b
> -
> -#define _XE_FIRST(...) _XE_ESC(__XE_FIRST(__VA_ARGS__,))
> -#define __XE_FIRST(x_,...) x_
> -#define _XE_TUPLE_TAIL(...) _XE_ESC(__XE_TUPLE_TAIL(__VA_ARGS__))
> -#define __XE_TUPLE_TAIL(x_,...) (__VA_ARGS__)
> -
> -#define __XE_PASTE_SEP_COMMA		,
> -#define __XE_PASTE_SEP_BITWISE_OR		|
> -#define __XE_PASTE(prefix_, sep_, args_) _XE_ESC(_XE_CONCAT(__XE_PASTE_,=
_XE_COUNT_ARGS args_)(prefix_, sep_, args_))
> -#define __XE_PASTE_1(prefix_, sep_, args_) prefix_ args_
> -#define __XE_PASTE_2(prefix_, sep_, args_) prefix_(_XE_FIRST args_) __XE=
_PASTE_SEP_ ## sep_ __XE_PASTE_1(prefix_, sep_, _XE_TUPLE_TAIL args_)
> -#define __XE_PASTE_3(prefix_, sep_, args_) prefix_(_XE_FIRST args_) __XE=
_PASTE_SEP_ ## sep_ __XE_PASTE_2(prefix_, sep_, _XE_TUPLE_TAIL args_)
> -#define __XE_PASTE_4(prefix_, sep_, args_) prefix_(_XE_FIRST args_) __XE=
_PASTE_SEP_ ## sep_ __XE_PASTE_3(prefix_, sep_, _XE_TUPLE_TAIL args_)
> -
> -#define _XE_DROP_FIRST(x_, ...)	__VA_ARGS__
> -#define _XE_DROP_CAST(...)	_XE_ESC(_XE_DROP_FIRST _XE_ESC __VA_ARGS__)
> -
> -/*
> - * Helper macros for concatenating prefix - do not use them directly out=
side
> - * this header
> - */
> -#define __XE_PASTE_XE_RTP_ENTRY_FLAG_(x_)	_XE_CONCAT(XE_RTP_ENTRY_FLAG_,=
 x_)
> -#define __XE_PASTE_XE_RTP_ACTION_FLAG_(x_)	_XE_CONCAT(XE_RTP_ACTION_FLAG=
_, x_)
> -#define __XE_PASTE_XE_RTP_ACTION_(x_)	_XE_CONCAT(XE_RTP_ACTION_, x_)
> -#define __XE_PASTE_XE_RTP_RULE_(x_)	_XE_CONCAT(XE_RTP_RULE_, x_)
> -
>  /*
>   * Macros to encode rules to match against platform, IP version, steppin=
g, etc.
>   * Shouldn't be used directly - see XE_RTP_RULES()
> diff --git a/drivers/gpu/drm/xe/xe_rtp_helpers.h b/drivers/gpu/drm/xe/xe_=
rtp_helpers.h
> new file mode 100644
> index 000000000000..0f0635692254
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_rtp_helpers.h
> @@ -0,0 +1,48 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_RTP_HELPERS_
> +#define _XE_RTP_HELPERS_
> +
> +#ifndef _XE_RTP_INCLUDE_PRIVATE_HELPERS
> +#error "This header is supposed to be included by xe_rtp.h only"
> +#endif
> +
> +/*
> + * Helper macros - not to be used outside xe_rtp.h/xe_rtp_helpers.h
> + */
> +#define _XE_ESC(...) __VA_ARGS__
> +#define _XE_COUNT_ARGS(...) _XE_ESC(__XE_COUNT_ARGS(__VA_ARGS__,5,4,3,2,=
1,))
> +#define __XE_COUNT_ARGS(_,_5,_4,_3,_2,X_,...) X_
> +
> +#define _XE_CONCAT(a, b) __XE_CONCAT(a, b)
> +#define __XE_CONCAT(a, b) a ## b
> +
> +#define _XE_FIRST(...) _XE_ESC(__XE_FIRST(__VA_ARGS__,))
> +#define __XE_FIRST(x_,...) x_
> +#define _XE_TUPLE_TAIL(...) _XE_ESC(__XE_TUPLE_TAIL(__VA_ARGS__))
> +#define __XE_TUPLE_TAIL(x_,...) (__VA_ARGS__)
> +
> +#define __XE_PASTE_SEP_COMMA		,
> +#define __XE_PASTE_SEP_BITWISE_OR		|
> +#define __XE_PASTE(prefix_, sep_, args_) _XE_ESC(_XE_CONCAT(__XE_PASTE_,=
_XE_COUNT_ARGS args_)(prefix_, sep_, args_))
> +#define __XE_PASTE_1(prefix_, sep_, args_) prefix_ args_
> +#define __XE_PASTE_2(prefix_, sep_, args_) prefix_(_XE_FIRST args_) __XE=
_PASTE_SEP_ ## sep_ __XE_PASTE_1(prefix_, sep_, _XE_TUPLE_TAIL args_)
> +#define __XE_PASTE_3(prefix_, sep_, args_) prefix_(_XE_FIRST args_) __XE=
_PASTE_SEP_ ## sep_ __XE_PASTE_2(prefix_, sep_, _XE_TUPLE_TAIL args_)
> +#define __XE_PASTE_4(prefix_, sep_, args_) prefix_(_XE_FIRST args_) __XE=
_PASTE_SEP_ ## sep_ __XE_PASTE_3(prefix_, sep_, _XE_TUPLE_TAIL args_)
> +
> +#define _XE_DROP_FIRST(x_, ...)	__VA_ARGS__
> +#define _XE_DROP_CAST(...)	_XE_ESC(_XE_DROP_FIRST _XE_ESC __VA_ARGS__)
> +
> +/*
> + * Helper macros for concatenating prefix - do not use them directly out=
side
> + * this header
> + */
> +#define __XE_PASTE_XE_RTP_ENTRY_FLAG_(x_)	_XE_CONCAT(XE_RTP_ENTRY_FLAG_,=
 x_)
> +#define __XE_PASTE_XE_RTP_ACTION_FLAG_(x_)	_XE_CONCAT(XE_RTP_ACTION_FLAG=
_, x_)
> +#define __XE_PASTE_XE_RTP_ACTION_(x_)	_XE_CONCAT(XE_RTP_ACTION_, x_)
> +#define __XE_PASTE_XE_RTP_RULE_(x_)	_XE_CONCAT(XE_RTP_RULE_, x_)
> +
> +#endif

--=20
Jani Nikula, Intel Open Source Graphics Center
