Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12CCFE6B240
	for <intel-xe@archiver.kernel.org>; Fri,  1 Nov 2024 11:18:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEF2310E9A3;
	Fri,  1 Nov 2024 11:18:30 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5241210E1EB;
 Fri,  1 Nov 2024 11:18:29 +0000 (UTC)
Received: from 91-155-254-188.elisa-laajakaista.fi ([91.155.254.188]
 helo=[192.168.100.133])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1t6pfe-00000001EOk-48mg; Fri, 01 Nov 2024 13:18:27 +0200
Message-ID: <e15bc818cd22a66cea506aaba83a755719e79806.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Gustavo Sousa <gustavo.sousa@intel.com>,
 intel-gfx@lists.freedesktop.org, 	intel-xe@lists.freedesktop.org
Cc: Luca Coelho <luciano.coelho@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Date: Fri, 01 Nov 2024 13:18:25 +0200
In-Reply-To: <20241021222744.294371-3-gustavo.sousa@intel.com>
References: <20241021222744.294371-1-gustavo.sousa@intel.com>
 <20241021222744.294371-3-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1-1 
MIME-Version: 1.0
Subject: Re: [PATCH 02/13] drm/i915/dmc_wl: Use non-sleeping variant of MMIO
 wait
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

On Mon, 2024-10-21 at 19:27 -0300, Gustavo Sousa wrote:
> Some display MMIO transactions for offsets in the range that requires
> the DMC wakelock happen in atomic context (this has been confirmed
> during tests on PTL). That means that we need to use a non-sleeping
> variant of MMIO waiting function.
>=20
> Implement __intel_de_wait_for_register_atomic_nowl() and use it when
> waiting for acknowledgment of acquire/release.
>=20
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_de.h     | 11 +++++++++++
>  drivers/gpu/drm/i915/display/intel_dmc_wl.c | 20 ++++++++++++--------
>  2 files changed, 23 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i9=
15/display/intel_de.h
> index e017cd4a8168..4116783a62dd 100644
> --- a/drivers/gpu/drm/i915/display/intel_de.h
> +++ b/drivers/gpu/drm/i915/display/intel_de.h
> @@ -121,6 +121,17 @@ ____intel_de_wait_for_register_nowl(struct intel_dis=
play *display,
>  }
>  #define __intel_de_wait_for_register_nowl(p,...) ____intel_de_wait_for_r=
egister_nowl(__to_intel_display(p), __VA_ARGS__)
> =20
> +static inline int
> +____intel_de_wait_for_register_atomic_nowl(struct intel_display *display=
,
> +					   i915_reg_t reg,
> +					   u32 mask, u32 value,
> +					   unsigned int fast_timeout_us)
> +{
> +	return __intel_wait_for_register(__to_uncore(display), reg, mask,
> +					 value, fast_timeout_us, 0, NULL);
> +}
> +#define __intel_de_wait_for_register_atomic_nowl(p,...) ____intel_de_wai=
t_for_register_atomic_nowl(__to_intel_display(p), __VA_ARGS__)
> +
>  static inline int
>  __intel_de_wait(struct intel_display *display, i915_reg_t reg,
>  		u32 mask, u32 value, unsigned int timeout)
> diff --git a/drivers/gpu/drm/i915/display/intel_dmc_wl.c b/drivers/gpu/dr=
m/i915/display/intel_dmc_wl.c
> index 5634ff07269d..8056a3c8666c 100644
> --- a/drivers/gpu/drm/i915/display/intel_dmc_wl.c
> +++ b/drivers/gpu/drm/i915/display/intel_dmc_wl.c
> @@ -39,7 +39,7 @@
>   * potential future use.
>   */
> =20
> -#define DMC_WAKELOCK_CTL_TIMEOUT 5
> +#define DMC_WAKELOCK_CTL_TIMEOUT_US 5000

Maybe this deserves a small explanation in the commit message saying
that you need to use the microsecond variant (fast_timeout_us) because
that makes it atomic further down the call chain?

--
Cheers,
Luca.
