Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14B0C3DA6E
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jan 2024 13:11:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E6D10E0B9;
	Wed,  3 Jan 2024 13:11:19 +0000 (UTC)
X-Greylist: delayed 1328 seconds by postgrey-1.36 at gabe;
 Wed, 03 Jan 2024 13:11:18 UTC
Received: from coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03B6D10E0B9
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jan 2024 13:11:17 +0000 (UTC)
Received: from 91-155-254-243.elisa-laajakaista.fi ([91.155.254.243]
 helo=[192.168.100.137])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97-RC1) (envelope-from <luca@coelho.fi>)
 id 1rL0gD-000000012x5-3VuY; Wed, 03 Jan 2024 14:49:07 +0200
Message-ID: <f9132f4f958054ee2d90233c3a80c8f702503e49.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Jani Nikula
 <jani.nikula@intel.com>
Date: Wed, 03 Jan 2024 14:49:04 +0200
In-Reply-To: <b4oniygofj4a2dua3nn2ivic5v6yjlklxrxga3wipf47h7cmie@wayqwwwnpkqo>
References: <20231228110934.383623-1-luciano.coelho@intel.com>
 <d1025642c5e47fcf8338bda82d3d31930877848b.camel@intel.com>
 <877ckyk1l9.fsf@intel.com>
 <b4oniygofj4a2dua3nn2ivic5v6yjlklxrxga3wipf47h7cmie@wayqwwwnpkqo>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Subject: Re: [RFC] drm/i915/display: add support for DMC wakelocks
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, 2024-01-03 at 03:11 -0600, Lucas De Marchi wrote:
> On Thu, Dec 28, 2023 at 01:28:50PM +0200, Jani Nikula wrote:
> > On Thu, 28 Dec 2023, "Coelho, Luciano" <luciano.coelho@intel.com> wrote=
:
> > > For some strange reason, git-send-email didn't add Uma and Ville in C=
C,
> > > even though I specified it in the command line.
> >=20
> > Everything worked as expected, but it might seem a bit surprising. ;)
> >=20
> > Mailman has a personal setting on whether to filter your address from C=
c
> > in messages sent to the list. I have it disabled, while apparently Uma
> > and Ville have it enabled. You're probably looking at the copy of the
> > mail that you received via the mailing list. It only has me in Cc, and
> > Uma and Ville have been filtered. The copy I received directly has all
> > three of us in Cc.
>=20
> That "feature" should be considered a bug... I complained about it
> several times, but I'm not sure the proper channel to get that
> changed/fixed.
>=20
> It's terrible when you cross several mailing lists as then people
> getting the email from the mailing list will "drop" people from Cc. And
> they usually add other people (outside drm), which means now each thread
> has a different set of people Cc'ed=20

I totally agree that this is horrible.  If you CC someone, you want
that person to be included in all replies, but this way, it doesn't.=20
Maybe this is a "security feature" intended not to expose your email
address, but, more likely, people use it to avoid receiving the emails
twice (one from the list, one from CC).  But Mailman should be smart
enough to avoid sending two identical emails to the same address...

--
Cheers,
Luca.
