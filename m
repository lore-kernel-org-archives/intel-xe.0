Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D89CCDB465
	for <intel-xe@archiver.kernel.org>; Thu, 19 Oct 2023 08:43:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0153110E4A2;
	Thu, 19 Oct 2023 08:43:18 +0000 (UTC)
Received: from coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B17010E4B9
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Oct 2023 08:43:16 +0000 (UTC)
Received: from 91-155-254-243.elisa-laajakaista.fi ([91.155.254.243]
 helo=[192.168.100.137])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97-RC1) (envelope-from <luca@coelho.fi>)
 id 1qtOca-000000005Ak-0pN4; Thu, 19 Oct 2023 11:43:13 +0300
Message-ID: <53c4b27aeb2aa333c288b3c0c867a04035b72ee8.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
Date: Thu, 19 Oct 2023 11:43:10 +0300
In-Reply-To: <ZS6kWW9oULDTRPjY@intel.com>
References: <ZSRtavVCM2lqbV5y@intel.com>
 <f8c1a6a39300f01b6affc5ecee7b4486dbcb6baa.camel@coelho.fi>
 <ZShRTTLRD7ltDGSS@intel.com>
 <f352c534f049f7068cef667b4faa88d7cca9b8fd.camel@coelho.fi>
 <ZS18QYFnoxZBRAtl@intel.com>
 <cfac5572e3d1ea7e0363cc58d4230ce7135b10d0.camel@coelho.fi>
 <ZS2YMf+umJSSYkh3@intel.com>
 <eeb0a65118c80a61c8cd1e301ad3c28592cfde40.camel@coelho.fi>
 <ZS20xlCm8DMTH4bQ@intel.com>
 <20231017005841.GB1327160@mdroper-desk1.amr.corp.intel.com>
 <ZS6kWW9oULDTRPjY@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Subject: Re: [Intel-xe] [RFC] drm/xe: A minimal assert for some forcewake
 domain on xe_mmio.
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
Cc: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 2023-10-17 at 11:12 -0400, Rodrigo Vivi wrote:
> On Mon, Oct 16, 2023 at 05:58:41PM -0700, Matt Roper wrote:
> > On Mon, Oct 16, 2023 at 06:10:14PM -0400, Rodrigo Vivi wrote:
> > > On Tue, Oct 17, 2023 at 12:33:39AM +0300, Luca Coelho wrote:
> > >=20
> > > > But maybe I misunderstood the proposal.  And, if this is not the pl=
an,
> > > > then the only way to do it is to add the "wakelock" logic to the
> > > > display orthogonally to the general MMIO access operations, which I
> > > > wanted to avoid.
> > >=20
> > > well, let's have it inside intel_de_ and we have only one implementat=
ion.
> > > no port needed. Regardless of the future of the xe_mmio or the future
> > > of xe_forcewake.
> >=20
> > Implementing it solely at the intel_de layer sounds reasonable to me as
> > well.
>=20
> yeap, they appear to be orthogonal discussions. Even going with the
> intrinsic forcewake inside xe_mmio, I still believe that the right place
> for this wakelock is inside intel_de anyway.

Thanks for all the comments and helping me understand this a bit
better.  The way I saw it was that Xe would be where underlying HW
access is implemented, so to me it would make sense to have this HW
access restriction (regardless of being used only by the display)
there.  I don't think it's a "display thing", but a HW limitation that
affects only the display.

In any case, doing it entirely in intel_de is probably the easiest
thing to do, so let's go with that.

--
Cheers,
Luca.
