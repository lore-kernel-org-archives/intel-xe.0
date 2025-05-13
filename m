Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92ADCC3ABC3
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 17:17:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A8310E20A;
	Tue, 13 May 2025 17:17:10 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2379910E203;
 Tue, 13 May 2025 17:17:07 +0000 (UTC)
Received: from 91-155-254-65.elisa-laajakaista.fi ([91.155.254.65]
 helo=[192.168.100.137])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1uEtFP-00000007NA3-3OQb; Tue, 13 May 2025 20:17:04 +0300
Message-ID: <082b25c27076a2b4a27847246cf948583dffd4cb.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, 
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Luca Coelho <luciano.coelho@intel.com>
Date: Tue, 13 May 2025 20:16:54 +0300
In-Reply-To: <20250513134229.19017-1-ville.syrjala@linux.intel.com>
References: <20250512103358.15724-3-ville.syrjala@linux.intel.com>
 <20250513134229.19017-1-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/7] drm/i915: Hook up PIPEDMC interrupts
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

On Tue, 2025-05-13 at 16:42 +0300, Ville Syrjala wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>=20
> Hook up PIPEDMC interrupts. We'll need these for:
> - flip queue signalling
> - GTT/ATS faults on LNL+
> - random errors
>=20
> On LNL+ we get a new level of interrupts registers PIPEDMC_INTERRUPT*.
> On earlier platforms we only have the INT_VECTOR field in the
> PIPEDMC_STATUS registers, whose values are defined by the firmware.
>=20
> For now we'll enable the interrupts on LNL+ only. For earlier platforms
> it's not clear that there is any use for these interrupts, and some
> ADL machines have exhibited spurious DE_PIPE interrupts with the
> PIPEDMC interrupts unmasked/enabled. We can revisit enabling these
> for earlier platforms in the future.
>=20
> Similar to DSB interrupt registers, the unused bits in
> PIPEDMC_INTERRUPT* seem to act like randomg r/w bits (instead
> of being hardwired to 0 like one would expect), and so we'll try
> to avoid setting them so that we don't mistake them for real
> interrupts.
>=20
> v2: Only enable/unmask for LNL+
>     Keep the flip queue interrupt masked off for now since
>     we don't have a use for it yet
>=20
> Reviewed-by: Luca Coelho <luciano.coelho@intel.com> #v1
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---

Renewing my r-b.

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
