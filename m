Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1986AF8D753
	for <intel-xe@archiver.kernel.org>; Thu, 16 Apr 2026 15:49:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A569610E8DB;
	Thu, 16 Apr 2026 15:49:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jExgGEzF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48EC010E8DB;
 Thu, 16 Apr 2026 15:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776354591; x=1807890591;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=PZ7+GYIw10azDLpVlNsr9y2SvYWNvqak14NQPLTInik=;
 b=jExgGEzFy3pP+c0IbikFX+FZtSB+T7n0StmqmTLY1vSMI5AQsnnWj3cd
 ICI1fXGyh0dJGD0Y/WastIwWAIYqmzR+m5bHAu/4Fb3FKgvIOGGHNsPLd
 GRUtLJFcNNxHoL3cpuCozHajvwjwUq5OMdhOyatQXqqrSZmHfWzx3RwdQ
 /hb6lW1scQ2enbE+6eZ7HE/8XJREDxCXoescvtNDhQLUWGpdH/LfErE+C
 c4EgpjMwdmKRtxTsSBfImIJOz8cPXF2V/J3DqlIKWQQNckLpkMmA/Rsmr
 zl6NBrqGxYYyf7ONDyV5ZpF+guVeY0q37di11YvEDdenCaEjYQZn1rcyp w==;
X-CSE-ConnectionGUID: 7dVNwaz/T2KuH3NUOL6s4Q==
X-CSE-MsgGUID: 673n9UPsS76/w2i7p/fSXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="102817120"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="102817120"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 08:49:50 -0700
X-CSE-ConnectionGUID: JUCMBTs0QCGpKOfFBVZ+GQ==
X-CSE-MsgGUID: GTm9XAJ3SfShhoMI5m586w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="229935632"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.108])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 08:49:48 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Jouni =?utf-8?Q?H=C3=B6gander?=
 <jouni.hogander@intel.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v3 2/7] drm/xe: Clear xe->display when no longer valid
In-Reply-To: <20260415210411.24750-3-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260415210411.24750-1-ville.syrjala@linux.intel.com>
 <20260415210411.24750-3-ville.syrjala@linux.intel.com>
Date: Thu, 16 Apr 2026 18:49:45 +0300
Message-ID: <7f49ab83c01ce7976a6ae8fb58e8636c36a8d7d3@intel.com>
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

On Thu, 16 Apr 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Don't leave a stale xe->display pointer hanging around after
> the display driver has been torn down.
>
> While xe shouldn't hit the display reset related issue that
> affects i915, leaving stale pointer floating around still
> seems like a bad idea.
>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Jouni H=C3=B6gander <jouni.hogander@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/xe/display/xe_display.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe=
/display/xe_display.c
> index 00dfa68af29a..0747044f7c2a 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -520,9 +520,10 @@ void xe_display_pm_runtime_resume(struct xe_device *=
xe)
>=20=20
>  static void display_device_remove(struct drm_device *dev, void *arg)
>  {
> -	struct intel_display *display =3D arg;
> +	struct xe_device *xe =3D arg;
>=20=20
> -	intel_display_device_remove(display);
> +	intel_display_device_remove(xe->display);
> +	xe->display =3D NULL;
>  }
>=20=20
>  static bool irq_enabled(struct drm_device *drm)
> @@ -587,12 +588,12 @@ int xe_display_probe(struct xe_device *xe)
>  	if (IS_ERR(display))
>  		return PTR_ERR(display);
>=20=20
> -	err =3D drmm_add_action_or_reset(&xe->drm, display_device_remove, displ=
ay);
> -	if (err)
> -		return err;
> -
>  	xe->display =3D display;
>=20=20
> +	err =3D drmm_add_action_or_reset(&xe->drm, display_device_remove, xe);
> +	if (err)
> +		return err;
> +
>  	if (intel_display_device_present(display))
>  		return 0;

--=20
Jani Nikula, Intel
