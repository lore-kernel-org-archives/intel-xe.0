Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 925C7C00A8F
	for <intel-xe@archiver.kernel.org>; Tue, 24 Oct 2023 10:50:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60ACC10E093;
	Tue, 24 Oct 2023 10:50:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B842A10E093
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Oct 2023 10:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698144626; x=1729680626;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=XAhrnctgNT5pwAP2jnhCGg2X8/3qx9pXGm95MflaAYQ=;
 b=mz0xp2ZjOGOyk46Topl9IIZUp9grQkZUSUMuf2Ghblv3+yK9+uwTVJfm
 UhyrD/pgXotHWyq5FKweuDYZKzGIoQQFKveDoC0qy64ZkygNmiaR0uW5x
 nitr3TfwwwCmM8L0dEkNLSCE24Xl/fwa31QMNCuIjulEfL7qm+4VJoOP+
 AZ4qn1NlX0GqV3YFens/4//hoy9lAgGY10T7WJ017rwv9MAMq5xHb9b1S
 DsyfugrWDCC3xzsB+j3plN86JmCWFX25V82suUMj5LCAfRA23TaFl50I2
 7YXJ2FnjK7/1KZX2gy7Dv6Q6P0uFTXS6kD6EF17eDlvWfLZ82/Nr4zJvT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="377407340"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; d="scan'208";a="377407340"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2023 03:50:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="708242744"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; d="scan'208";a="708242744"
Received: from goepfrim-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.48.28])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2023 03:50:24 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20231018115826.3908905-3-michal.winiarski@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231018115826.3908905-1-michal.winiarski@intel.com>
 <20231018115826.3908905-3-michal.winiarski@intel.com>
Date: Tue, 24 Oct 2023 13:50:21 +0300
Message-ID: <87v8aw9tw2.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH 2/3] drm/i915: Fix uninitialized variable
 warning
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
Cc: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, 18 Oct 2023, Micha=C5=82 Winiarski <michal.winiarski@intel.com> wro=
te:
> When used with Xe, "val" uses as function argument name clashes with
> "val" used inside iosys_map_* macro causing the build to fail with:
>
> drivers/gpu/drm/i915/display/intel_dsb.c:87:46: error: variable 'val' is =
uninitialized when used within its own initialization [-Werror,-Wuninitiali=
zed]

Whatever the outcome of the discussion, this patch must *not* be applied
to drm-xe-next. It needs to go to upstream i915 first.

BR,
Jani.

>
> Signed-off-by: Micha=C5=82 Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dsb.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i=
915/display/intel_dsb.c
> index 796b1b36dc598..8d89c8f700d68 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsb.c
> +++ b/drivers/gpu/drm/i915/display/intel_dsb.c
> @@ -79,12 +79,12 @@ static u32 dsb_ggtt_offset(struct intel_dsb *dsb)
>  #endif
>  }
>=20=20
> -static void dsb_write(struct intel_dsb *dsb, u32 idx, u32 val)
> +static void dsb_write(struct intel_dsb *dsb, u32 idx, u32 value)
>  {
>  #ifdef I915
> -	dsb->cmd_buf[idx] =3D val;
> +	dsb->cmd_buf[idx] =3D value;
>  #else
> -	iosys_map_wr(&dsb->obj->vmap, idx * 4, u32, val);
> +	iosys_map_wr(&dsb->obj->vmap, idx * 4, u32, value);
>  #endif
>  }
>=20=20
> @@ -97,12 +97,12 @@ static u32 dsb_read(struct intel_dsb *dsb, u32 idx)
>  #endif
>  }
>=20=20
> -static void dsb_memset(struct intel_dsb *dsb, u32 idx, u32 val, u32 sz)
> +static void dsb_memset(struct intel_dsb *dsb, u32 idx, u32 value, u32 sz)
>  {
>  #ifdef I915
> -	memset(&dsb->cmd_buf[idx], val, sz);
> +	memset(&dsb->cmd_buf[idx], value, sz);
>  #else
> -	iosys_map_memset(&dsb->obj->vmap, idx * 4, val, sz);
> +	iosys_map_memset(&dsb->obj->vmap, idx * 4, value, sz);
>  #endif
>  }

--=20
Jani Nikula, Intel
