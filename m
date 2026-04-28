Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4824FF8868
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 09:14:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64FFE10EAA0;
	Tue, 28 Apr 2026 09:14:22 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCDCD10EA9E;
 Tue, 28 Apr 2026 09:14:20 +0000 (UTC)
Received: from 37-219-152-235.nat.bb.dnainternet.fi ([37.219.152.235]
 helo=[192.168.101.111])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1wHeW8-00000004ezX-4BzQ; Tue, 28 Apr 2026 12:14:17 +0300
Message-ID: <ff971c40ee8dd8969e8f1d0fd59060d7a304cc8f.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Jani Nikula <jani.nikula@linux.intel.com>, Luca Coelho
 <luciano.coelho@intel.com>, intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, ville.syrjala@linux.intel.com
Date: Tue, 28 Apr 2026 12:14:07 +0300
In-Reply-To: <c4cea3b1fe889f18692508d7795d07b2a42b686e@intel.com>
References: <20260420202252.3846880-1-luciano.coelho@intel.com>
 <20260420202252.3846880-6-luciano.coelho@intel.com>
 <c4cea3b1fe889f18692508d7795d07b2a42b686e@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
Subject: Re: [PATCH v4 5/8] drm/i915/display: move GLK clock gating init to
 display
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

On Mon, 2026-04-27 at 12:50 +0300, Jani Nikula wrote:
> On Mon, 20 Apr 2026, Luca Coelho <luciano.coelho@intel.com> wrote:
> > Move the GLK-specific display clock gating programming into display
> > intel_display_clock_gating.c, to remove more dependencies from i915 to
> > display registers.
> >=20
> > Now that all remaining Gen9-family callers moved into display, we can
> > move the shared Gen9 display clock gating helper into display and
> > remove the old local helper from intel_clock_gating.c.
> >=20
> > Additionally, the SKL_DE_COMPRESSED_HASH_MODE programming was
> > protected by HAS_LLC(), but that's incidental, because in Gen9
> > platforms, only SKL and KBL, for which this workaround applies, have
> > LLC().  In order not to use HAS_LLC() in display code, we can simply
> > remove this check from the generic Gen9 function and move the
> > SKL_DE_COMPRESSED_HASH_MODE programming to the KBL and SKL specific
> > functions.
>=20
> The macros in i915_pci.c are hard to read, but basically for gen 9 you
> have GEN9_FEATURES and GEN9_LP_FEATURES.
>=20
> GEN9_FEATURES "inherits" .has_llc =3D 1 through GEN7_FEATURES ->
> G75_FEATURES -> GEN8_FEATURES -> GEN9_FEATURES. GEN9_LP_FEATURES does
> not have it.
>=20
> SKL, KBL, CFL, and CML use GEN9_FEATURES i.e. have LLC.
>=20
> BXT, GLK use GEN9_LP_FEATURES i.e. don't have LLC.
>=20
> CML and CFL share the functions, so this is a long-winded way of saying
> that intel_display_cfl_init_clock_gating() also needs the
> SKL_DE_COMPRESSED_HASH_MODE programming.

Okay, makes sense.  The comment for the workaround only mentions skl
and kbl, so I guess the comment needs to be modified slightly too.

But I wonder if this was a mistake in the implementation (using
HAS_LLC() and not checking the platform), or in the specification for
the workaround, which apparently only says SKL and KBL...

In any case, the goal of this series is not to change anything
functionally, so if doing this for CFL/CML is a bug, my series won't
change that.

--
Cheers,
Luca.
