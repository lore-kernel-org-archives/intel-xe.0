Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A56D637A6
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 18:40:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B969110E28A;
	Wed, 13 Nov 2024 18:40:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pc3abxcV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32EF710E28A
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Nov 2024 18:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731523243; x=1763059243;
 h=message-id:subject:from:reply-to:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=/aLAoab8zZ/hwUS1A5+RAugz7lXWkG8v6QZ80f/cbqc=;
 b=Pc3abxcVMPJtdUKiUubd/xKqMN9CCk3SHwmrqQWhzGWQs66lqDgHZ8UE
 g3ZOPT7AVIZJti15Ma3aWtdNC8u+3eoK7jdPopZ8mwcR5vx739k02Gj/I
 ExCi1HlTRWyIFLupruAadE5a/j/bh4vxZjUNGR+9JQgTCj526Ex3Z/0tv
 wlafboHMlCYOTXQN495ZWh212AFV2wBQBKtiIr0ot1MmbeufDzaXxR5kl
 Iy4RnH3BoOy8DjOxVI26dsiS+w/9jTk+1FNkDi6SUGujHOrhlYrQyi1PK
 JDderSXJO1E08UCYe5Qevw6n+TP47Wq4RI+1+op+DHGrIm9gAXnABDct8 w==;
X-CSE-ConnectionGUID: atZjxyHISyaE7rGszJPXfw==
X-CSE-MsgGUID: ee+mPfkAQg6FnDkOVnAbOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31398022"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31398022"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 10:40:43 -0800
X-CSE-ConnectionGUID: MKZGoaaqSn2tiGd7jRWfXA==
X-CSE-MsgGUID: 5bj9g0tmQJaImklWbHV9uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="125470038"
Received: from dnelso2-mobl.amr.corp.intel.com ([10.125.111.242])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 10:40:43 -0800
Message-ID: <7e22fc28bd8d81d42c75166b8792eaf0d856a413.camel@linux.intel.com>
Subject: Re: [PATCH v2 0/2] Support BMG PMT features for Xe
From: "David E. Box" <david.e.box@linux.intel.com>
To: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>, 
 intel-xe@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, Hans
 de Goede <hdegoede@redhat.com>, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com
Date: Wed, 13 Nov 2024 10:40:42 -0800
In-Reply-To: <23fe9eca-ebd3-4098-22ab-d21434026273@linux.intel.com>
References: <20241112163035.2282499-1-michael.j.ruhl@intel.com>
 <ZzSBpq2IakMrvV6h@smile.fi.intel.com>
 <23fe9eca-ebd3-4098-22ab-d21434026273@linux.intel.com>
Organization: David E. Box
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
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
Reply-To: david.e.box@linux.intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, 2024-11-13 at 15:52 +0200, Ilpo J=C3=A4rvinen wrote:
> On Wed, 13 Nov 2024, Andy Shevchenko wrote:
>=20
> > On Tue, Nov 12, 2024 at 11:30:33AM -0500, Michael J. Ruhl wrote:
> > > Updates for PMT to support user offsets from the sysfs API.
> > >=20
> > > Addressed review comments for the Xe driver udpates.
> >=20
> > FWIW,
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >=20
> > If you have wish and time, there are problems with the drivers of diffe=
rent
> > severities (from "fine as is" to "good to be fixed, but okay as is") I =
have
> > noticed so far:
> > - it uses s*printf() instead of sysfs_emit*()
> > - it most likely never tested the corner cases. e.g.,
> >=20
> > 	if (disc_res->start >=3D pci_resource_start(pci_dev, i) &&
> > 	=C2=A0=C2=A0=C2=A0 (disc_res->start <=3D pci_resource_end(pci_dev, i))=
) {
> >=20
> > =C2=A0 what is this supposed to mean? Probably someone wanted resource_=
contains()
> > or
> > =C2=A0 alike to be called here.

This is a corner case that occurs for devices that are non-compliant, in th=
is
case meaning devices that don't follow our PMT spec convention of specifyin=
g
which BAR an address belongs to. Without this information, we have to deduc=
e the
BAR manually to access other needed registers that are offset from the base=
 of
that BAR.

I can change this to use resource_contains().

> > - slightly above the above piece the for-loop
> >=20
> > 	for (i =3D 0; i < 6; i++)
> >=20
> > =C2=A0 which probably want to use PCI_STD_RESOURCE_END)
>=20
> While both work, in practice PCI_STD_NUM_BARS is way more common than=20
> PCI_STD_RESOURCE_END.
>=20

Will change this too. Thanks.

David
