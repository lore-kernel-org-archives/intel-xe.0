Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABAE2D637C1
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 21:00:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7970B10E104;
	Wed, 13 Nov 2024 21:00:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TtGDKiq3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E20310E104
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Nov 2024 21:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731531637; x=1763067637;
 h=message-id:subject:from:reply-to:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Xa8vXkYuB2gzl5Wzizwrpm84idlCtRPAebQKhZ06i9U=;
 b=TtGDKiq3Q2AX9ZTU583hq0piWNOEOWwilY60RZR1Tm/RKTj4xeCZL47p
 tKki2Hejwda1WPoktGqK1r2YMyau+DxZ7ntg2GzeP6g5m0XGfwcng+Go5
 fVRzngjqartePyCtbzeeaFSfSl2nO6lSDopVSRR9dcbMmuL41Du9RaIxx
 Y85/s+/pIK4aWroVzIQWqHq+P/DYfvo0qId6qBvZQkeNn67V23aTuhYku
 VVMlnzhzbfN04T25aOwIuy5NQCW4nANm28yY/Bk6hMjInwhsHxdWiotFc
 LP4XzotP/3jTy4fWJKjWM8O0GK8RVuoW6Tjvzh4z19/hkxXx2Ojl8YVDc w==;
X-CSE-ConnectionGUID: kRE8M8YgSHebACSEkESlIQ==
X-CSE-MsgGUID: cifDFTbxR5SC6aB+OOFzgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="34311864"
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; d="scan'208";a="34311864"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 13:00:37 -0800
X-CSE-ConnectionGUID: RHhyXDJnSOyKM/lmOCJg7w==
X-CSE-MsgGUID: NAxxrEDQRquarRhtlX2stg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; d="scan'208";a="92931374"
Received: from dnelso2-mobl.amr.corp.intel.com ([10.125.111.242])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 13:00:36 -0800
Message-ID: <f3c58d79544ac162a65bc35a88f3dc8429f7b33c.camel@linux.intel.com>
Subject: Re: [PATCH v2 0/2] Support BMG PMT features for Xe
From: "David E. Box" <david.e.box@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 intel-xe@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,  Hans
 de Goede <hdegoede@redhat.com>, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com
Date: Wed, 13 Nov 2024 13:00:36 -0800
In-Reply-To: <ZzT2-R2uiXn_cHRT@smile.fi.intel.com>
References: <20241112163035.2282499-1-michael.j.ruhl@intel.com>
 <ZzSBpq2IakMrvV6h@smile.fi.intel.com>
 <23fe9eca-ebd3-4098-22ab-d21434026273@linux.intel.com>
 <7e22fc28bd8d81d42c75166b8792eaf0d856a413.camel@linux.intel.com>
 <ZzT2-R2uiXn_cHRT@smile.fi.intel.com>
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

On Wed, 2024-11-13 at 20:59 +0200, Andy Shevchenko wrote:
> On Wed, Nov 13, 2024 at 10:40:42AM -0800, David E. Box wrote:
> > On Wed, 2024-11-13 at 15:52 +0200, Ilpo J=C3=A4rvinen wrote:
> > > On Wed, 13 Nov 2024, Andy Shevchenko wrote:
> > > > On Tue, Nov 12, 2024 at 11:30:33AM -0500, Michael J. Ruhl wrote:
> > > > > Updates for PMT to support user offsets from the sysfs API.
> > > > >=20
> > > > > Addressed review comments for the Xe driver udpates.
> > > >=20
> > > > FWIW,
> > > > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > >=20
> > > > If you have wish and time, there are problems with the drivers of
> > > > different
> > > > severities (from "fine as is" to "good to be fixed, but okay as is"=
) I
> > > > have
> > > > noticed so far:
> > > > - it uses s*printf() instead of sysfs_emit*()
> > > > - it most likely never tested the corner cases. e.g.,
> > > >=20
> > > > 	if (disc_res->start >=3D pci_resource_start(pci_dev, i) &&
> > > > 	=C2=A0=C2=A0=C2=A0 (disc_res->start <=3D pci_resource_end(pci_dev,=
 i))) {
> > > >=20
> > > > =C2=A0 what is this supposed to mean? Probably someone wanted
> > > > resource_contains()
> > > > or
> > > > =C2=A0 alike to be called here.
> >=20
> > This is a corner case that occurs for devices that are non-compliant, i=
n
> > this
> > case meaning devices that don't follow our PMT spec convention of speci=
fying
> > which BAR an address belongs to. Without this information, we have to d=
educe
> > the
> > BAR manually to access other needed registers that are offset from the =
base
> > of
> > that BAR.
>=20
> What I am pointing out is that we compare start address (and only start!)=
 to
> both, start _and_ end of the given resource. So currently the second chec=
k is
> redundant and that looks suspicious. I believe one wanted to have
>=20
> 	if (disc_res->start >=3D pci_resource_start(pci_dev, i) &&
> 	=C2=A0=C2=A0=C2=A0 (disc_res->end <=3D pci_resource_end(pci_dev, i))) {

I see. The assumption was that the device didn't provide us an address rang=
e
that crosses BARs, so testing that the start address is within a BAR would =
be
enough. But the above is a better check in case that's not true which would=
 be a
hardware bug.

David

>=20
> (note end!) and if using helpers, this would never happened :-)
>=20
> > I can change this to use resource_contains().
>=20
> Please, will clarify the above confusion..
>=20
> > > > - slightly above the above piece the for-loop
> > > >=20
> > > > 	for (i =3D 0; i < 6; i++)
> > > >=20
> > > > =C2=A0 which probably want to use PCI_STD_RESOURCE_END)
> > >=20
> > > While both work, in practice PCI_STD_NUM_BARS is way more common than=
=20
> > > PCI_STD_RESOURCE_END.
> >=20
> > Will change this too. Thanks.
>=20
> You are welcome!
>=20

