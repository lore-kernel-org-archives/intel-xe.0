Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B0BBE7717F
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 09:06:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D959A10EF73;
	Fri, 13 Dec 2024 09:06:54 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA1510EF71;
 Fri, 13 Dec 2024 09:06:53 +0000 (UTC)
Received: from 91-155-254-135.elisa-laajakaista.fi ([91.155.254.135]
 helo=[192.168.100.137])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1tM1dL-00000002t0d-0moW; Fri, 13 Dec 2024 11:06:51 +0200
Message-ID: <5f6e1f648442cb08fc516b997271416018cbcaaa.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Date: Fri, 13 Dec 2024 11:06:50 +0200
In-Reply-To: <39e99b765b8c1a05d001659c39686a661ac268e2.1732104170.git.jani.nikula@intel.com>
References: <cover.1732104170.git.jani.nikula@intel.com>
 <39e99b765b8c1a05d001659c39686a661ac268e2.1732104170.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1-1 
MIME-Version: 1.0
Subject: Re: [RESEND 3/6] drm/i915/display: add intel_display_conversion.c
 to hide stuff better
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

On Wed, 2024-11-20 at 14:03 +0200, Jani Nikula wrote:
> The __to_intel_display() generics require the definition of struct
> drm_i915_private i.e. inclusion of i915_drv.h. Add
> intel_display_conversion.c with a __i915_to_display() function to do the
> conversion without the intel_display_conversion.h having an implicit
> dependency on i915_drv.h.
>=20
> The long term goal is to remove __to_intel_display() and the
> intel_display_conversion.[ch] files altoghether, and this is merely a
> transitional step to make the dependencies on i915_drv.h explicit.
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
