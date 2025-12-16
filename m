Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8235ED609CE
	for <intel-xe@archiver.kernel.org>; Tue, 16 Dec 2025 16:57:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42FBF10E239;
	Tue, 16 Dec 2025 16:57:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ADlAnNrF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8742E10E239;
 Tue, 16 Dec 2025 16:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765904273; x=1797440273;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=U4dv8SX+OrYLbNRCnDhZknWVsE7jyL7lyrULFDaPg44=;
 b=ADlAnNrFjmD1ferUGmzkG5Whd9WEBzmWssNUBXBPFaq+Rji1lSYwWvUY
 pA24UQw7NrFpiV0YFlpabUp1WohupivlaWSIXMS+igV7dAFkPsnKoHYqK
 TL0sL72mCCTQvov8jE3OIstKwOj39KLigsL1VE7Qv3JsZiIOpRrJ/efzD
 y8WE5wW9u3umUOe5bqPjRKvPTFkVQhkXWvo9aId4DQil8ivcdQCp0+HHy
 Xt8xzK2H+SoXPoCcUzeFji6AIgYS0X2EHQbS7Oj9dkhLlf+A9+SzZpLWw
 L3/lCG+M+OIhG5aET/pfdV7hB2ZXEeACc4IBMiMeR8HwVEiMd2y0hCkCi Q==;
X-CSE-ConnectionGUID: 6rfHnJFPRwqJoI5CoNxrvg==
X-CSE-MsgGUID: 4SvMdryIQ46Dv05CIJZuUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="78466858"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="78466858"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 08:57:53 -0800
X-CSE-ConnectionGUID: xjyi3gLoRk+tmvTqLMLmTg==
X-CSE-MsgGUID: vVAIJ7n+Qq6TooHJnadVtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="198059783"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.153])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 08:57:51 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/i915/display: Allow async flip when Selective Fetch
 is enabled
In-Reply-To: <20251216130351.2799110-1-jouni.hogander@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251216130351.2799110-1-jouni.hogander@intel.com>
Date: Tue, 16 Dec 2025 18:57:47 +0200
Message-ID: <4c23bcd7bf3b1f70e77e917d62f490775ad0dd95@intel.com>
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

On Tue, 16 Dec 2025, Jouni H=C3=B6gander <jouni.hogander@intel.com> wrote:
> Fix silent conflict during drm-next backmerge causing async flips being
> rejected when Selective Fetch is enabled.
>
> Fixes: b8304863a399 ("Merge drm/drm-next into drm-intel-next")
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Jouni H=C3=B6gander <jouni.hogander@intel.com>

Acked-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index 9c6d3ecdb589e..d5947cc9b94c5 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -6026,14 +6026,6 @@ static int intel_async_flip_check_uapi(struct inte=
l_atomic_state *state,
>  		return -EINVAL;
>  	}
>=20=20
> -	/* FIXME: selective fetch should be disabled for async flips */
> -	if (new_crtc_state->enable_psr2_sel_fetch) {
> -		drm_dbg_kms(display->drm,
> -			    "[CRTC:%d:%s] async flip disallowed with PSR2 selective fetch\n",
> -			    crtc->base.base.id, crtc->base.name);
> -		return -EINVAL;
> -	}
> -
>  	for_each_oldnew_intel_plane_in_state(state, plane, old_plane_state,
>  					     new_plane_state, i) {
>  		if (plane->pipe !=3D crtc->pipe)

--=20
Jani Nikula, Intel
