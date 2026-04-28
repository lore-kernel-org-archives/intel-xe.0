Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9842FF8868
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 09:41:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E71510EABE;
	Tue, 28 Apr 2026 09:41:43 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A9910EABD;
 Tue, 28 Apr 2026 09:41:42 +0000 (UTC)
Received: from 37-219-152-235.nat.bb.dnainternet.fi ([37.219.152.235]
 helo=[192.168.101.111])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1wHewi-00000004f2U-14ID; Tue, 28 Apr 2026 12:41:38 +0300
Message-ID: <984eda0c91a24f209660676266288464a154ccaa.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Jani Nikula <jani.nikula@linux.intel.com>, Luca Coelho
 <luciano.coelho@intel.com>, intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, ville.syrjala@linux.intel.com
Date: Tue, 28 Apr 2026 12:41:34 +0300
In-Reply-To: <6cd074a68c151a55c5b689b8dcc4e8f10f089f0e@intel.com>
References: <20260420202252.3846880-1-luciano.coelho@intel.com>
 <6cd074a68c151a55c5b689b8dcc4e8f10f089f0e@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/8] drm/i915: move more display dependencies from i915
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

On Mon, 2026-04-27 at 13:06 +0300, Jani Nikula wrote:
> On Mon, 20 Apr 2026, Luca Coelho <luciano.coelho@intel.com> wrote:
> > This series continues my work of refactoring the clock gating
> > initialization, so that i915 doesn't do display-specific stuff.
> >=20
> > With this, all register dependencies should be gone.
> >=20
> > Changes in v4:
> > 	* Explain why HAS_LLC() is not needed anymore (Jani);
> > 	* Replace intel_display_core.h include with intel_pch.h (Jani);
> >=20
> > Please review.
>=20
> There's the one omission in patch 5 that I pointed out that needs to be
> fixed.
>=20
> Other than that, this is
>=20
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Thanks for the review!


> I do have a nagging feeling that further refactoring will be needed, as
> this introduces a plethora of new display interfaces i915 core needs to
> call, and we should work to minimize that surface. However, this is good
> stuff for moving the display stuff out of i915 core, so let's roll with
> this.

Yeah, the main problem is that the calls to platform specific things
were all over, sometimes in the beginning, sometimes in the middle and
sometimes in the end of the flows.  Ville already mentioned that most
of these are probably not order-sensitive, so we could generalize the
implementation and reduce the number of interfaces.

I didn't want to change the order of these workarounds in this series.
Now that the functions are inside the display code, we can start make
some functional changes in a more isolated way.


> A minor nit for further reference. If you can, please try to avoid
> combining code movement and other changes. Reviewing pure code movement
> with 'git show --color-moved' is quick. Reviewing other mechanical
> changes with 'git show --color-words' is also quick. Unfortunately,
> having code movement and other inline changes in one breaks both
> approaches, and you have to fall back to more manual review.

Sorry for that.  I've been nagging about the same thing many times in
the past myself, so it's silly I've done it too.  I've been moving this
code forth and back quite a few times, and ended up mixing moves from
actual changes. :(

--
Cheers,
Luca.
