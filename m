Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94ABAFD5F98
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 08:50:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54E1110E59A;
	Wed,  8 Apr 2026 08:50:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ItbNMkQJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2533910E4A6;
 Wed,  8 Apr 2026 08:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775638241; x=1807174241;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=RX7UKq+xRS//sytyjaFc7mNowlV+cIdb07uHwEOYx+4=;
 b=ItbNMkQJ8B6aee0dL2YqFl0MvS4wcSDOMVLVRifZiU4zof4rXjZduElg
 zcKM/pP+mZDiDMu7qa/oNp4QF52Q2316pNe9d99XHZuIB8UApe0VIkn32
 BY9Fm5p64iN2zDabrsJiXXfThP873/a/3mRmb9IfnTM0aU9874Q9f7TQk
 pAqk+C/P/oYTn7TwwSLZ2v5z6VDv3LMG7Rd5APZTkN/+aXEA+f0TUlnJ5
 hAUk3Bc9xmy5FRnRNdbGpK5PMRRf9+sqoGmFVU4DtI46Yr1pWpD8qn/sl
 vPlwMRLyf5Txb9tvs/pOgQ9FsoNejwhNdw6Jv4QiaCrEBiYGjAn+niVGD g==;
X-CSE-ConnectionGUID: hmM51252RtW+xX7BpM53ZQ==
X-CSE-MsgGUID: ho4EVIOyQpeW4FUH0B0zHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="80209686"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="80209686"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 01:50:41 -0700
X-CSE-ConnectionGUID: d2DE84+ZSWmMXrv5pYQWOA==
X-CSE-MsgGUID: p15oUATGRkeuWaR9JcqIUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="232450060"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.32])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 01:50:38 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 07/12] drm/i915/vma: Add helpers to check GTT view type
In-Reply-To: <20260407155053.32156-8-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260407155053.32156-1-ville.syrjala@linux.intel.com>
 <20260407155053.32156-8-ville.syrjala@linux.intel.com>
Date: Wed, 08 Apr 2026 11:50:36 +0300
Message-ID: <97be0c2c2ac61e38db7d41254b7fe54610ef26a4@intel.com>
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

On Tue, 07 Apr 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> I915_GTT_VIEW_ROTATED is going away and being replaced by just
> I915_GTT_VIEW_REMAPPED, so we're going to need another way to
> determine if the view is rotated or not (since width/height
> will need to be swapped when operating on the destination
> coordinate space). Provide small helper functions to hide
> such implementation details from most of the code using GTT views.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Funny, I think I have these helpers in a branch somewhere too. :)

It's still not clear to me where we'll end up with this, since the file
is in i915 and used directly from xe core too, which is something we
want to get rid of. But seems like iterative improvement, so let's roll
with this.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/i915_gtt_view_types.h | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/i915_gtt_view_types.h b/drivers/gpu/drm=
/i915/i915_gtt_view_types.h
> index c084f67bc880..9c4f38db32ff 100644
> --- a/drivers/gpu/drm/i915/i915_gtt_view_types.h
> +++ b/drivers/gpu/drm/i915/i915_gtt_view_types.h
> @@ -56,4 +56,19 @@ struct i915_gtt_view {
>  	};
>  };
>=20=20
> +static inline bool i915_gtt_view_is_normal(const struct i915_gtt_view *v=
iew)
> +{
> +	return view->type =3D=3D I915_GTT_VIEW_NORMAL;
> +}
> +
> +static inline bool i915_gtt_view_is_remapped(const struct i915_gtt_view =
*view)
> +{
> +	return view->type =3D=3D I915_GTT_VIEW_REMAPPED;
> +}
> +
> +static inline bool i915_gtt_view_is_rotated(const struct i915_gtt_view *=
view)
> +{
> +	return view->type =3D=3D I915_GTT_VIEW_ROTATED;
> +}
> +
>  #endif /* __I915_GTT_VIEW_TYPES_H__ */

--=20
Jani Nikula, Intel
