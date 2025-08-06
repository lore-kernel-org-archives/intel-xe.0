Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EEA6C87FD1
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 08:27:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24B0B10E739;
	Wed,  6 Aug 2025 08:27:47 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F57410E3CA;
 Wed,  6 Aug 2025 08:27:46 +0000 (UTC)
Received: from 91-155-254-205.elisa-laajakaista.fi ([91.155.254.205]
 helo=[192.168.100.137])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1ujZUt-00000009VFl-2m8s; Wed, 06 Aug 2025 11:27:44 +0300
Message-ID: <0ca49257031e62eff87221c4d9c9d08e3d4a973d.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Date: Wed, 06 Aug 2025 11:27:42 +0300
In-Reply-To: <2c74fa7f2b7d5ecf8247aa5bff05d104ad60cf9e.1753953530.git.jani.nikula@intel.com>
References: <cover.1753953530.git.jani.nikula@intel.com>
 <2c74fa7f2b7d5ecf8247aa5bff05d104ad60cf9e.1753953530.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] drm/i915/display: keep forward declarations together
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

On Thu, 2025-07-31 at 12:19 +0300, Jani Nikula wrote:
> Adhere to prevalent style.
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_global_state.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_global_state.h b/drivers/=
gpu/drm/i915/display/intel_global_state.h
> index 4f304e2c47e0..e1efa530cc86 100644
> --- a/drivers/gpu/drm/i915/display/intel_global_state.h
> +++ b/drivers/gpu/drm/i915/display/intel_global_state.h
> @@ -11,6 +11,7 @@
> =20
>  struct intel_atomic_state;
>  struct intel_display;
> +struct intel_global_commit;
>  struct intel_global_obj;
>  struct intel_global_state;
> =20
> @@ -26,8 +27,6 @@ struct intel_global_obj {
>  	const struct intel_global_state_funcs *funcs;
>  };
> =20
> -struct intel_global_commit;
> -
>  struct intel_global_state {
>  	struct intel_global_obj *obj;
>  	struct intel_atomic_state *state;

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
