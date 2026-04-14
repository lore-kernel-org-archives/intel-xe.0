Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC258F9D0D6
	for <intel-xe@archiver.kernel.org>; Tue, 14 Apr 2026 15:56:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7961310E0AE;
	Tue, 14 Apr 2026 15:56:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ahlLXYE/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64F7E10E0AE;
 Tue, 14 Apr 2026 15:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776182185; x=1807718185;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=yY2keQ9jIEdRZZW9weUI0sIkTcYuDd6auo/j4HssSH8=;
 b=ahlLXYE/DIs7EIumt6cRMnV7VY8t27Zjrm/WoE3AQuwYvRmomicUP4Cj
 RCYHsCii9pGQHrVpcXw5sV7DRwYNOPehX2uIOPvI578D3XL4UiVS3oxpI
 hoKCLu6C6Ww/07ffm58c1JxknR+OTqxTV3UV/e4n8MtvJmMUq02bwsukd
 yro5NSxt3n8gwHEdnpO9Yi2l3O4XVP0sW/r6cnWNk5K3E7i/ondKIm4fu
 9o7I7Y5MXpD6aGLVrVli6ttU91fkWHDziwLWNPU4Lm6bIuAgHwvvS+pCU
 7VVwTzKlFO0wc34s1Z7UZKufL6msWTzlih8SxBtJ38qZGP2pYF6uu2S1A Q==;
X-CSE-ConnectionGUID: hj6qjCd8T5yaf2OnQ/zkJg==
X-CSE-MsgGUID: OAvn7I5sQmOXWvONI0OF+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="81007276"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="81007276"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 08:56:24 -0700
X-CSE-ConnectionGUID: /Sp4bi8KTsq7EsbwlYkKWA==
X-CSE-MsgGUID: uOgLh+VrQnWZF0YacV1FYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="230352657"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.238])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 08:56:22 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Jouni =?utf-8?Q?H=C3=B6gander?=
 <jouni.hogander@intel.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v2 5/5] drm/i915/reset: Disable execlist per-engine
 reset for display reset tests
In-Reply-To: <20260414142247.651-6-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260414142247.651-1-ville.syrjala@linux.intel.com>
 <20260414142247.651-6-ville.syrjala@linux.intel.com>
Date: Tue, 14 Apr 2026 18:56:19 +0300
Message-ID: <351084abb7388df170677da2d4ad1e85841521db@intel.com>
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

On Tue, 14 Apr 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> The display reset only happens from the full reset path. We must
> therefore force execlist submission to always take the full reset
> path and not the per-engine reset path. Currently the display
> reset tests are in fact not testing display resets at all on
> platforms using execlist submission. Ring submission and GuC
> submission always take the full path anyway.
>
> Also disable the engine reset inside __intel_gt_set_wedged() so
> that we simulate the intel_gt_gpu_reset_clobbers_display() behavior
> as closely as possible also when taking the full wedge path.
>
> The slight race between the separate intel_display_reset_test()
> calls in the overall reset path is harmless. kms_busy will keep
> the modparam fixed during the test, and even if someone were to
> fiddle with the modparam manually nothing bad should happen if
> the calls return different values.
>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Jouni H=C3=B6gander <jouni.hogander@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Not an expert here, but seems reasonable.

Acked-by: Jani Nikula <jani.nikula@intel.com>


> ---
>  drivers/gpu/drm/i915/gt/intel_reset.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915=
/gt/intel_reset.c
> index a1e6aaca8c9b..0b5f3fc58009 100644
> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
> @@ -967,6 +967,7 @@ static void nop_submit_request(struct i915_request *r=
equest)
>=20=20
>  static void __intel_gt_set_wedged(struct intel_gt *gt)
>  {
> +	struct intel_display *display =3D gt->i915->display;
>  	struct intel_engine_cs *engine;
>  	intel_engine_mask_t awake;
>  	enum intel_engine_id id;
> @@ -984,7 +985,8 @@ static void __intel_gt_set_wedged(struct intel_gt *gt)
>  	awake =3D reset_prepare(gt);
>=20=20
>  	/* Even if the GPU reset fails, it should still stop the engines */
> -	if (!intel_gt_gpu_reset_clobbers_display(gt))
> +	if (!intel_gt_gpu_reset_clobbers_display(gt) &&
> +	    !intel_display_reset_test(display))
>  		intel_gt_reset_all_engines(gt);
>=20=20
>  	for_each_engine(engine, gt, id)
> @@ -1506,9 +1508,10 @@ void intel_gt_handle_error(struct intel_gt *gt,
>=20=20
>  	/*
>  	 * Try engine reset when available. We fall back to full reset if
> -	 * single reset fails.
> +	 * single reset fails. Display reset test needs a full reset.
>  	 */
> -	if (!intel_uc_uses_guc_submission(&gt->uc) &&
> +	if (!intel_display_reset_test(gt->i915->display) &&
> +	    !intel_uc_uses_guc_submission(&gt->uc) &&
>  	    intel_has_reset_engine(gt) && !intel_gt_is_wedged(gt)) {
>  		local_bh_disable();
>  		for_each_engine_masked(engine, gt, engine_mask, tmp) {

--=20
Jani Nikula, Intel
