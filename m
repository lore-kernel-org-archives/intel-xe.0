Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F37CED74ED9
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 14:10:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C5110EAF9;
	Fri, 23 Jan 2026 14:10:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k7D5jdwM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 717C910EAF8;
 Fri, 23 Jan 2026 14:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769177408; x=1800713408;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lry5Uj69UaszXP+pvCo6pyUz2K+FEVihynfNVOPmVZ4=;
 b=k7D5jdwMRXGmYEfJEdvZM06G5UteEIn/TInk/vMn8pDQP3CqUw0ONlE/
 aQEMxWqtvmBxLU5p9NsAGgMfOhbXU/666eGgYyNR8IA0KFB2FbeMH29yL
 f0lkoN9xEpELCkoNo9ts4B09YEnsBsDjD087ziIbivahQULl1rFiRJbh7
 7aTv/VKkudjmXA6XrTwx6E3Zb7pWojMYGXqFwM1JvcGaFHii39b0WIPR1
 LgrL5lTpOdm6yLsFGFqz1craIKvDFegrptGwABOCiAq1JwHl0SEaA7+jE
 FrHrMfc4TivqL2oe2fcfT2/WyAI+9VCj3lGKjSBN78KdQjRHRysjEWpmo A==;
X-CSE-ConnectionGUID: /EddrusgSaiABnl7tww+1g==
X-CSE-MsgGUID: 4kzlD5d9RY6Ea90GjOAUIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70490460"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="70490460"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 06:10:08 -0800
X-CSE-ConnectionGUID: 04g/ksv5RVqRpbe9c31Zuw==
X-CSE-MsgGUID: A25+nd7iTieRnfFAR/kw3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="207378474"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.8])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 06:10:06 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH i-g-t 1/7] lib/igt_device_scan: Don't print fake link
 bandwidth attributes
Date: Fri, 23 Jan 2026 15:10:03 +0100
Message-ID: <13932403.uLZWGnKmhe@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <DFVX1OVYV0MD.35VZJM8STQSXN@intel.com>
References: <20260121114656.1970684-9-janusz.krzysztofik@linux.intel.com>
 <20260121114656.1970684-10-janusz.krzysztofik@linux.intel.com>
 <DFVX1OVYV0MD.35VZJM8STQSXN@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Hi Sebastian,

Thanks for looking at this.

On Friday, 23 January 2026 12:01:54 CET Sebastian Brzezinka wrote:
> On Wed Jan 21, 2026 at 12:42 PM CET, Janusz Krzysztofik wrote:
> > Users of Intel discrete graphics adapters are confused with fake
> > information on PCIe link bandwidth (speed and size) of their GPU devices
> > reported by tools like lspci or lsgpu.  That fake information is
> > unfortunately provided by hardware, Linux PCI subsystem just exposes it
> > untouched to upper layers, including userspace via sysfs, and userspace
> > tools just report those fake values.
> >
> > While we can't do much about the kernel side or general purpose userspa=
ce
> > tools like lspci, we can try to address the issue with our lsgpu utilit=
y.
> >
> > Correct link bandwidth attributes of a discrete GPU card can be obtained
> > from the kernel by looking not at the PCI device of the GPU itself, only
> > at a PCIe upstream port of the card's PCI bridge.  For integrity with
> > content of the sysfs and with output from the other tools, we are not
> > going to replace the fake information with that from the bridge upstream
> > port, only show that port and its attributes themselves while listing
> > devices.
> >
> > Since the tool uses our udev based igt_device_scan library for identify=
ing
> > GPU devices and printing their properties and attributes, modifications
> > that we need apply to that library.
> >
> > As a first step, exclude the fake data from being printed.
> >
> > Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10753
> > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > ---
> >  lib/igt_device_scan.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> > index abd8ca209e..7753262a53 100644
> > --- a/lib/igt_device_scan.c
> > +++ b/lib/igt_device_scan.c
> > @@ -613,6 +613,14 @@ static void dump_props_and_attrs(const struct igt_=
device *dev)
> > =20
> >  	printf("\n[attributes]\n");
> >  	igt_map_foreach(dev->attrs_map, entry) {
> > +		/* omit fake link bandwidth attributes */
> > +		if (dev->dev_type =3D=3D DEVTYPE_DISCRETE &&
> > +		    (!strcmp(entry->key, "max_link_speed") ||
> > +		     !strcmp(entry->key, "max_link_width") ||
> > +		     !strcmp(entry->key, "current_link_speed") ||
> > +		     !strcmp(entry->key, "current_link_width")))
> > +			continue;
> > +
> Nit: This might be a bit confusing now that the return value depends on D=
EVTYPE_DISCRETE,
> especially for a library. I know it=E2=80=99s extra work to keep it gener=
ic, but maybe we could
> move the check to its own function just to clean things up a bit?
>=20
>=20

OK, so you say it's not clear for someone reading this why the exclusion of=
=20
the fake data from print output is limited to discrete graphics adapter. =20
Simply because integrated graphics devices don't provide any fake values, t=
hey=20
respond with "unknown" which I see no reason to also remove from the output.

Since I don't understand how moving that piece of code to a separate functi=
on=20
could make things more clear, I think I'll better provide the missing detai=
ls=20
about acceptable behavior of integrated devices to my commit description an=
d,=20
still better, extend the in-line comment above that piece of code with that=
=20
information.  What do you think?

Thanks,
Janusz


