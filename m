Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92226FF60EE
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 09:19:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CED310EA1F;
	Tue, 31 Mar 2026 09:19:50 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F7310EA1F
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Mar 2026 09:19:49 +0000 (UTC)
Received: from 87-93-178-238.bb.dnainternet.fi ([87.93.178.238]
 helo=[192.168.101.111])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1w7VGD-00000003pja-3hnH; Tue, 31 Mar 2026 12:19:47 +0300
Message-ID: <fa931fdb5ea381ebb40232a421188cde3710779a.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: luciano.coelho@intel.com, cc=uma.shankar@intel.com, imre.deak@intel.com
Date: Tue, 31 Mar 2026 12:19:44 +0300
In-Reply-To: <b9fa5d36-0541-4b92-828d-c90c4346051f@intel.com>
References: <20260313124157.2889931-1-dibin.moolakadan.subrahmanian@intel.com>
 <b9fa5d36-0541-4b92-828d-c90c4346051f@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
Subject: Re: [PATCH] drm/i915/dmc: RFC: Reduce wakelock hold time
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

On Tue, 2026-03-31 at 11:59 +0530, Dibin Moolakadan Subrahmanian wrote:
> On 13-03-2026 18:11, Dibin Moolakadan Subrahmanian wrote:
> > The __intel_dmc_wl_release() schedules a delayed workqueue which
> > releases the wakelock after a fixed timeout of 50 ms. Until the
> > delayed work runs, the wakelock remains held and prevents entry
> > into deeper DC states.
> >=20
> > Reduce DMC_WAKELOCK_HOLD_TIME from 50 ms to 5 ms to evaluate
> > whether the delay can be shortened and allow earlier DC-state
> > entry after wakelock release.
> >=20
> > This is an RFC to collect feedback and verify that reducing
> > the hold time does not introduce regressions.
>=20
>  From the code, it looks like the delayed work mechanism
> is intended to address two separate concerns:
>=20
> 1.Avoid blocking the MMIO caller context: The actual wakelock release cle=
ars
> DMC_WAKELOCK_CTL_REQ and then waits for DMC_WAKELOCK_CTL_ACK to deassert,
> with a timeout of DMC_WAKELOCK_CTL_TIMEOUT_US (up to 5ms).
> Deferring this sequence to a workqueue avoids potentially long polling
> from the intel_dmc_wl_put() / intel_de_*() call paths.
>=20
> 2. Provide a debounce/guard window: DMC_WAKELOCK_HOLD_TIME adds a delay b=
efore scheduling
> the release work, effectively keeping the wakelock held for 50ms after th=
e last MMIO access.
> This likely helps avoid unnecessary DC state entry/exit attempts.
>=20
> With this interpretation, reducing DMC_WAKELOCK_HOLD_TIME from 50ms to 5m=
s
> only shortens the debounce/guard window in (2),while the deferred release
> mechanism in (1) remains unchanged.
>=20
> This should allow the system to enter deeper DC states sooner once the MM=
IO activity
> settles down.
>=20
> Please correct me if I=E2=80=99m missing any original rationale behind th=
e design.

This is correct and describes the design as intended.  There shouldn't
be any side-effect on the control timeout if the hold time is changed.
Reducing the hold time is correct, we just need to find the right
amount of time to use.

If this patch has not broken anything in CI, I believe it's good to go.

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
