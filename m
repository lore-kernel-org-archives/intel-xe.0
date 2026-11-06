Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE05606A326
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 14:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MoBJXGaF
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41E9D10F202;
	Fri,  6 Nov 2026 14:59:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2060010F202;
 Fri,  6 Nov 2026 14:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793977141; x=1825513141;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=yAMRKQdaqvBVDNNs/6nOpVo1aEWWIIROZum/fiAJv/M=;
 b=MoBJXGaFClcDdaMk5nWCZpnm5n8ERod2oExVDbgS8P2ENENq/ROtAj8V
 nSglkN4tsFcO2YsWVAaLURQVJuR7wRk32hHz8CbOUAvH8bqfpXn+QNqSe
 32sXaCLaDBnk+n/tp2O/5q7Po+rPc0zwcMmfM5EF+Q++xNopnIglfvqtA
 TZScB0I3S4+eFSsLytW6wtuEul2r10PiL/QpsVh2oGiXRZnOUMilK/uPi
 /E15J6BkznrRKzjbtcF6f1sWXxXfh2Z6JNDRKddaNXkUG6laVfQGzuMD6
 dnOJ9sxfz52wY1knu+q5XKf7jEdm6/Bxj3AWiH67anoUSDEfo18PsRu10 Q==;
X-CSE-ConnectionGUID: q9rYrzkYTw2uK85XnjWGaQ==
X-CSE-MsgGUID: 4uB092zDT3yxFU5oj8zU2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2891314"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2891314"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 06:59:00 -0800
X-CSE-ConnectionGUID: 06Qjt/wlSJmkYWUfcs0Y2Q==
X-CSE-MsgGUID: cJiSiCxMTpGZdAjde/WRgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7190402"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.101])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 06:58:59 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 6/9] drm/i915/uncore: Don't meddle with mmio debug upon
 user forcewake
In-Reply-To: <20261104221842.18799-7-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261104221842.18799-1-ville.syrjala@linux.intel.com>
 <20261104221842.18799-7-ville.syrjala@linux.intel.com>
Date: Fri, 06 Nov 2026 16:58:56 +0200
Message-ID: <f8a0ccccfd1929ef7d845507f2cb8eb960d9fcad@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 05 Nov 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Currently when userspace takes the forcewake via debugfs, the
> kernel will stop looking for unclaimed mmio accesses. That link
> is kinda weird since forcewake is for GT stuff and unclaimed
> mmio detection is for display stuff.
>
> Just kill the mmio debug suspend/resume upon user forcewake.
> One should almost always use IGT_NO_FORCEWAKE=3D1 when poking
> at display register from userspace anyway so as to not
> perturb the rest of the system.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/intel_uncore.c | 46 ++---------------------------
>  drivers/gpu/drm/i915/intel_uncore.h |  2 --
>  2 files changed, 2 insertions(+), 46 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/i=
ntel_uncore.c
> index e360e4f9d9a2..abd695e880c1 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.c
> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> @@ -65,41 +65,6 @@ intel_uncore_mmio_debug_init_early(struct drm_i915_pri=
vate *i915)
>  	i915->uncore.debug =3D &i915->mmio_debug;
>  }
>=20=20
> -static void mmio_debug_suspend(struct intel_uncore *uncore)
> -{
> -	if (!uncore->debug)
> -		return;
> -
> -	spin_lock(&uncore->debug->lock);
> -
> -	/* Save and disable mmio debugging for the user bypass */
> -	if (!uncore->debug->suspend_count++) {
> -		uncore->debug->saved_mmio_check =3D uncore->debug->unclaimed_mmio_chec=
k;
> -		uncore->debug->unclaimed_mmio_check =3D 0;
> -	}
> -
> -	spin_unlock(&uncore->debug->lock);
> -}
> -
> -static bool check_for_unclaimed_mmio(struct intel_uncore *uncore);
> -
> -static void mmio_debug_resume(struct intel_uncore *uncore)
> -{
> -	if (!uncore->debug)
> -		return;
> -
> -	spin_lock(&uncore->debug->lock);
> -
> -	if (!--uncore->debug->suspend_count)
> -		uncore->debug->unclaimed_mmio_check =3D uncore->debug->saved_mmio_chec=
k;
> -
> -	if (check_for_unclaimed_mmio(uncore))
> -		drm_info(&uncore->i915->drm,
> -			 "Invalid mmio detected during user access\n");
> -
> -	spin_unlock(&uncore->debug->lock);
> -}
> -
>  static const char * const forcewake_domain_names[] =3D {
>  	"render",
>  	"gt",
> @@ -598,9 +563,6 @@ check_for_unclaimed_mmio(struct intel_uncore *uncore)
>=20=20
>  	lockdep_assert_held(&uncore->debug->lock);
>=20=20
> -	if (uncore->debug->suspend_count)
> -		return false;
> -
>  	if (intel_uncore_has_fpga_dbg_unclaimed(uncore))
>  		ret |=3D fpga_check_for_unclaimed_mmio(uncore);
>=20=20
> @@ -733,10 +695,8 @@ void intel_uncore_forcewake_get(struct intel_uncore =
*uncore,
>  void intel_uncore_forcewake_user_get(struct intel_uncore *uncore)
>  {
>  	spin_lock_irq(&uncore->lock);
> -	if (!uncore->user_forcewake_count++) {
> +	if (!uncore->user_forcewake_count++)
>  		intel_uncore_forcewake_get__locked(uncore, FORCEWAKE_ALL);
> -		mmio_debug_suspend(uncore);
> -	}
>  	spin_unlock_irq(&uncore->lock);
>  }
>=20=20
> @@ -750,10 +710,8 @@ void intel_uncore_forcewake_user_get(struct intel_un=
core *uncore)
>  void intel_uncore_forcewake_user_put(struct intel_uncore *uncore)
>  {
>  	spin_lock_irq(&uncore->lock);
> -	if (!--uncore->user_forcewake_count) {
> -		mmio_debug_resume(uncore);
> +	if (!--uncore->user_forcewake_count)
>  		intel_uncore_forcewake_put__locked(uncore, FORCEWAKE_ALL);
> -	}
>  	spin_unlock_irq(&uncore->lock);
>  }
>=20=20
> diff --git a/drivers/gpu/drm/i915/intel_uncore.h b/drivers/gpu/drm/i915/i=
ntel_uncore.h
> index fafc2ca9a237..4ec7c545d04e 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.h
> +++ b/drivers/gpu/drm/i915/intel_uncore.h
> @@ -42,8 +42,6 @@ struct intel_gt;
>  struct intel_uncore_mmio_debug {
>  	spinlock_t lock; /** lock is also taken in irq contexts. */
>  	int unclaimed_mmio_check;
> -	int saved_mmio_check;
> -	u32 suspend_count;
>  };
>=20=20
>  enum forcewake_domain_id {

--=20
Jani Nikula, Intel
