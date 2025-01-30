Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7734EC0218A
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 09:28:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D3E10E908;
	Thu, 30 Jan 2025 09:28:10 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74BE510E912;
 Thu, 30 Jan 2025 09:28:10 +0000 (UTC)
Received: from 91-155-255-183.elisa-laajakaista.fi ([91.155.255.183]
 helo=[192.168.100.137])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1tdQqF-00000004F5L-02iP; Thu, 30 Jan 2025 11:28:08 +0200
Message-ID: <1ec91901f71d102e34b1e92dfb522e4db4de26f1.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Gustavo Sousa <gustavo.sousa@intel.com>,
 intel-gfx@lists.freedesktop.org, 	intel-xe@lists.freedesktop.org
Date: Thu, 30 Jan 2025 11:28:05 +0200
In-Reply-To: <173764862050.34727.8876808159559449431@intel.com>
References: <20250117220747.87927-1-gustavo.sousa@intel.com>
 <20250117220747.87927-5-gustavo.sousa@intel.com>
 <08e1dba99b68f2bfc575585ba9f22ee0d1daf852.camel@coelho.fi>
 <173764862050.34727.8876808159559449431@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3-1 
MIME-Version: 1.0
Subject: Re: [PATCH 4/4] drm/i915/dmc_wl: Enable the debugfs only with
 enable_dmc_wl_debugfs=1
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

On Thu, 2025-01-23 at 13:10 -0300, Gustavo Sousa wrote:
> Quoting Luca Coelho (2025-01-22 07:24:43-03:00)
> > On Fri, 2025-01-17 at 19:06 -0300, Gustavo Sousa wrote:
> > > We use a spinlock to protect DMC wakelock debugfs data, since it is a=
lso
> > > accessed by the core DMC wakelock logic. Taking the spinlock when the
> > > debugfs is not in use introduces a small but unnecessary penalty.
> > >=20
> > > Since the debugfs functionality is only expected to be used for, uh,
> > > debugging sessions, let's protect it behind a module parameter
> > > enable_dmc_wl_debugfs. That way, we only take the lock if the feature
> > > was enabled in the first place.
> > >=20
> > > Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> > > ---
> >=20
> > Looks good.  With a small optional nitpick below.
> >=20
> > Reviewed-by: Luca Coelho <luciano.coelho@intel.com>
> >=20
> > [...]
> > > diff --git a/drivers/gpu/drm/i915/display/intel_display_params.c b/dr=
ivers/gpu/drm/i915/display/intel_display_params.c
> > > index c4f1ab43fc0c..bc36d1b0ef87 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_display_params.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_display_params.c
> > > @@ -479,9 +488,14 @@ void intel_dmc_wl_debugfs_log_untracked(struct i=
ntel_display *display, u32 offse
> > >  bool intel_dmc_wl_debugfs_offset_in_extra_ranges(struct intel_displa=
y *display, u32 offset)
> > >  {
> > >          struct intel_dmc_wl_dbg *dbg =3D &display->wl.dbg;
> > > -        bool ret =3D false;
> > > +        bool ret;
> >=20
> > Why not keep this as it was...
>=20
> Yeah, I suppose that's fine... I think the compiler is going to optimize
> it. I can send a v2 with this change.
>=20
> >=20
> > >          unsigned long flags;
> > > =20
> > > +        if (!display->params.enable_dmc_wl_debugfs)
> > > +                return false;
> > > +
> > > +        ret =3D false;
> > > +
> >=20
> > ...then you don't need to set it here, and can return ret in the if
> > above for consistency.
>=20
> In the if above, I guess I prefer the "return false" because it is
> explicit.

Yeah, fair enough.  It's a matter of preference.

--
Cheers,
Luca.
