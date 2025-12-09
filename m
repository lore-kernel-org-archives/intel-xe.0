Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C6DD3B7F8
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 11:14:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F5310E515;
	Tue,  9 Dec 2025 11:14:20 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5F4E10E1CF;
 Tue,  9 Dec 2025 11:14:18 +0000 (UTC)
Received: from mobile-access-5d6aa7-235.dhcp.inet.fi ([93.106.167.235]
 helo=[192.168.8.139])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1vSvfa-00000000ggh-1BCQ; Tue, 09 Dec 2025 13:14:16 +0200
Message-ID: <3a330b829308ca2ec6de8cffac890ee6e3cd95e7.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: imre.deak@intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Date: Tue, 09 Dec 2025 13:14:13 +0200
In-Reply-To: <aTfxqfQ72KLZLGnz@ideak-desk>
References: <20251127175023.1522538-1-imre.deak@intel.com>
 <20251127175023.1522538-4-imre.deak@intel.com>
 <a1dff2ea30fe3d2f25bab96da1963e8a308eb3c0.camel@coelho.fi>
 <aTfxqfQ72KLZLGnz@ideak-desk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-7 
MIME-Version: 1.0
Subject: Re: [PATCH 03/50] drm/i915/dp: Fix DSC sink's slice count
 capability check
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

On Tue, 2025-12-09 at 11:53 +0200, Imre Deak wrote:
> On Tue, Dec 09, 2025 at 10:51:10AM +0200, Luca Coelho wrote:
> > On Thu, 2025-11-27 at 19:49 +0200, Imre Deak wrote:
> > > A DSC sink supporting DSC slice count N, not necessarily supports sli=
ce
> > > counts less than N. Hence the driver should check the sink's support =
for
> > > a particular slice count before using that slice count, fix
> > > intel_dp_dsc_get_slice_count() accordingly.
> > >=20
> > > Cc: dri-devel@lists.freedesktop.org
> > > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/display/intel_dp.c | 18 +++++++++++++-----
> > >  1 file changed, 13 insertions(+), 5 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/dr=
m/i915/display/intel_dp.c
> > > index 0ec82fcbcf48e..6d232c15a0b5a 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > > @@ -1013,6 +1013,8 @@ u8 intel_dp_dsc_get_slice_count(const struct in=
tel_connector *connector,
> > >  				int num_joined_pipes)
> > >  {
> > >  	struct intel_display *display =3D to_intel_display(connector);
> > > +	u32 sink_slice_count_mask =3D
> > > +		drm_dp_dsc_sink_slice_count_mask(connector->dp.dsc_dpcd, false);
> > >  	u8 min_slice_count, i;
> > >  	int max_slice_width;
> > >  	int tp_rgb_yuv444;
> > > @@ -1084,9 +1086,9 @@ u8 intel_dp_dsc_get_slice_count(const struct in=
tel_connector *connector,
> > >  		    (!HAS_DSC_3ENGINES(display) || num_joined_pipes !=3D 4))
> > >  			continue;
> > > =20
> > > -		if (test_slice_count >
> > > -		    drm_dp_dsc_sink_max_slice_count(connector->dp.dsc_dpcd, false)=
)
> > > -			break;
> > > +		if (!(drm_dp_dsc_slice_count_to_mask(test_slice_count) &
> > > +		      sink_slice_count_mask))
> > > +			continue;
> > > =20
> > >  		 /*
> > >  		  * Bigjoiner needs small joiner to be enabled.
> > > @@ -1103,8 +1105,14 @@ u8 intel_dp_dsc_get_slice_count(const struct i=
ntel_connector *connector,
> > >  			return test_slice_count;
> > >  	}
> > > =20
> > > -	drm_dbg_kms(display->drm, "Unsupported Slice Count %d\n",
> > > -		    min_slice_count);
> > > +	/* Print slice count 1,2,4,..24 if bit#0,1,3,..23 is set in the mas=
k. */
> > > +	sink_slice_count_mask <<=3D 1;
> > > +	drm_dbg_kms(display->drm,
> > > +		    "[CONNECTOR:%d:%s] Unsupported slice count (min: %d, sink supp=
orted: %*pbl)\n",
> > > +		    connector->base.base.id, connector->base.name,
> > > +		    min_slice_count,
> > > +		    (int)BITS_PER_TYPE(sink_slice_count_mask), &sink_slice_count_m=
ask);
> > > +
> > >  	return 0;
> > >  }
> > >=20
> >=20
> > I think this patch could be squashed into the previous one.  IMHO it
> > makes it a bit easier to see how those functions defined in the
> > previous patch would be used.
>=20
> The practice I follow is to keep the DRM core and driver changes in
> separate patches. At least one reason for that is that the DRM core
> patches may need to be applied to the DRM core trees separately.

Oh, of course, makes 100% sense.  I overlooked this point.

--
Cheers,
Luca.
