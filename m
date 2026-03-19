Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1D51090225
	for <intel-xe@archiver.kernel.org>; Thu, 19 Mar 2026 13:36:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1356C10E908;
	Thu, 19 Mar 2026 13:36:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L2XxJ1A0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1837410E907;
 Thu, 19 Mar 2026 13:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773927384; x=1805463384;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=jlxC/P1UFJfYH+XHMBbBMA0Cy5kj+IA9nFp1vl4JQbQ=;
 b=L2XxJ1A0Jmqy2QzYHv92g8y8UFOHHMW6rDwSz94ATVdSU811IPI7SfDU
 B60UVzgoNNefwSIWMAUTt7DYbBNNZfr4u3tPYlJrvZUFiHnK2GzHeoO0o
 0IKGcxVGQuNp43vyu6YiUKtETei/8ERuabHOfT7Y+K21B3av/YyVJ6GF2
 Mz9ZzAE+4LQ4OZDv+iBB/J8URP3YLS10ChOKYuWAxxGIn5x/Fv+bXbfVl
 ++xvHAP6wwN5cU5fFybgsbbAqTs8b4SEQvluJ89YVcVJ5gVPMCZUXBf6U
 Dq2ZqcC7VbRRsJkGNjci29eL1VR74WiqzsXD9Hco78QEonFv9qSKviSRn w==;
X-CSE-ConnectionGUID: Rs+8nrt4QM6XI9l+45FoPg==
X-CSE-MsgGUID: lpe9u7LuTWuoZkYP5KZyPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="75030397"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="75030397"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 06:36:23 -0700
X-CSE-ConnectionGUID: 6xYLkYjSRX6w4Gil/WVvlQ==
X-CSE-MsgGUID: N4rM3ntcTOOMZucZ2AozCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="227452368"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.152])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 06:36:22 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 6/9] drm/i915/wm:
 s/skl_print_plane_changes()/skl_print_plane_wm_changes()/
In-Reply-To: <20260319114034.7093-7-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260319114034.7093-1-ville.syrjala@linux.intel.com>
 <20260319114034.7093-7-ville.syrjala@linux.intel.com>
Date: Thu, 19 Mar 2026 15:36:17 +0200
Message-ID: <057b689ab7aded187884f8e5bd78fa23e78019da@intel.com>
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

On Thu, 19 Mar 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Rename skl_print_plane_changes() to skl_print_plane_wm_changes()
> to better reflect what it does.

Could also go for skl_wm_* naming, but *shrug* for static functions.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/skl_watermark.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/d=
rm/i915/display/skl_watermark.c
> index 8b1b371fbfab..6c8dab847ae2 100644
> --- a/drivers/gpu/drm/i915/display/skl_watermark.c
> +++ b/drivers/gpu/drm/i915/display/skl_watermark.c
> @@ -2602,11 +2602,12 @@ static char enast(bool enable)
>  }
>=20=20
>  static noinline_for_stack void
> -skl_print_plane_changes(struct intel_display *display,
> -			struct intel_plane *plane,
> -			const struct skl_plane_wm *old_wm,
> -			const struct skl_plane_wm *new_wm)
> +skl_print_plane_wm_changes(struct intel_plane *plane,
> +			   const struct skl_plane_wm *old_wm,
> +			   const struct skl_plane_wm *new_wm)
>  {
> +	struct intel_display *display =3D to_intel_display(plane);
> +
>  	drm_dbg_kms(display->drm,
>  		    "[PLANE:%d:%s]   level %cwm0,%cwm1,%cwm2,%cwm3,%cwm4,%cwm5,%cwm6,%=
cwm7,%ctwm,%cswm,%cstwm"
>  		    " -> %cwm0,%cwm1,%cwm2,%cwm3,%cwm4,%cwm5,%cwm6,%cwm7,%ctwm,%cswm,%=
cstwm\n",
> @@ -2738,7 +2739,7 @@ skl_print_wm_changes(struct intel_atomic_state *sta=
te)
>  			if (skl_plane_wm_equals(display, old_wm, new_wm))
>  				continue;
>=20=20
> -			skl_print_plane_changes(display, plane, old_wm, new_wm);
> +			skl_print_plane_wm_changes(plane, old_wm, new_wm);
>  		}
>  	}
>  }

--=20
Jani Nikula, Intel
