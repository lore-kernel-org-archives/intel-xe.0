Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 008E6D61037
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 11:09:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFC4410E99E;
	Fri, 30 Jan 2026 11:09:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jz+VofZd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EEF510E99D;
 Fri, 30 Jan 2026 11:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769771397; x=1801307397;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7vhIM5lUWBvdm4v0NzBoco8QyAyfN5ldfZCimTIhE8E=;
 b=jz+VofZdeJqlYtw+roj1Z7YEsJnE8sTuBIldn6knbImI/R+TCah7kR/k
 nd7ixg9O+hNGp8V7Nvd+Qpy6hO4lO+2Prm74CMWijrj1888Kc+wOFt3iW
 Vb+RD+5alSbGZX8mfHCatk+41sX55QTIUL15fp/LbzVE5QRmA8ohUoigc
 vbfemC8vI1m2xfCPbMeAyTyUYCEREUigod5WFPux+XiBUOJiAQs/1jvLu
 aOilMBJ8oiQ9IdJk1wVKjGb6nHUVn7jCRCuQezsb5w703XzV3HzygPN03
 WDp5YsoHbRVNVAhmIWl1fuppBnAb2MQPGZRfyFm2UwD1XjNZ6Pszgvjde w==;
X-CSE-ConnectionGUID: Cxezd0VzRLWUonGdPFpN8A==
X-CSE-MsgGUID: kF22CoI+Sb6f6kXn6lmEvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="71057604"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="71057604"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 03:09:57 -0800
X-CSE-ConnectionGUID: h/IC3LhxR4Knh74kkT6Euw==
X-CSE-MsgGUID: zYwRJu6uTuajNrpYGLtznA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="208073771"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.83])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 03:09:54 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH i-g-t v3 6/6] lib/igt_device_scan: Print GPU upstream port
 parent/child relations
Date: Fri, 30 Jan 2026 12:09:51 +0100
Message-ID: <4683807.8F6SAcFxjW@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <DG11TIYPUWHH.1SQKHOBSDKJEF@intel.com>
References: <20260128161041.225652-8-janusz.krzysztofik@linux.intel.com>
 <20260128161041.225652-14-janusz.krzysztofik@linux.intel.com>
 <DG11TIYPUWHH.1SQKHOBSDKJEF@intel.com>
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

On Thursday, 29 January 2026 12:49:39 CET Sebastian Brzezinka wrote:
> Hi Janusz,
>=20
> On Wed Jan 28, 2026 at 5:09 PM CET, Janusz Krzysztofik wrote:
> > In a short listing, lsgpu prints a sysfs path of a PCI GPU parent as a
> > local attribute of a DRM device.  However, if that's a discrete GPU and
> > its associated PCIe upstream bridge port has been identified, no
> > information on that bridge is listed among the GPU attributes.  Follow =
the
> > pattern used with DRM devices and also show a PCI slot of the bridge po=
rt
> > as a local attribute of the discrete GPU device.
> >
> > Moreover, in both short and detailed listings, local attributes intended
> > for providing device names of GPU associated DRM devices and the GPU
> > codename are also printed as attributes of related PCIe upstream bridge
> > port, however, the DRM device names are shown as (null), and the codena=
me
> > attribute provides raw vendor:device codes of the bridge itself.  Repla=
ce
> > those with PCI slot and codename of the GPU device.
> >
> > v2: Allocate memory to local attributes of a bridge for safety=20
(Sebastian),
> >   - merge with a formerly separate patch "lib/igt_device_scan: Don't pr=
int
> >     bridge not applicable attributes" (Sebastian),
> >   - no need for DEVTYPE_BRIDGE, just skip attributes if NULL.
> >
> > Cc: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > ---
> >  lib/igt_device_scan.c | 18 ++++++++++++++++--
> >  1 file changed, 16 insertions(+), 2 deletions(-)
> >
> > diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> > index f4d2eb6568..96bf0e359d 100644
> > --- a/lib/igt_device_scan.c
> > +++ b/lib/igt_device_scan.c
> > @@ -249,6 +249,8 @@ struct igt_device {
> >  	char *codename; /* For grouping by codename */
> >  	enum dev_type dev_type; /* For grouping by integrated/discrete */
> > =20
> > +	char *pci_gpu; /* Filled for upstream bridge ports */
> > +
> >  	struct igt_list_head link;
> >  };
> > =20
> > @@ -1063,6 +1065,9 @@ static void update_or_add_parent(struct udev *ude=
v,
> > =20
> >  	/* override DEVTYPE_INTEGRATED so link attributes won't be omitted=20
*/
> >  	bridge_idev->dev_type =3D DEVTYPE_ALL;
> > +	bridge_idev->pci_gpu =3D strdup(parent_idev->pci_slot_name);
> > +	bridge_idev->codename =3D strdup(parent_idev->codename);
> Releasing memory here is safer, but we must ensure
> igt_device_new_from_udev hasn't already filled the codename otherwise,
> the original pointer will be lost.

Indeed, it comes already populated, then I should release the old string=20
before overwriting.

>=20
> I=E2=80=99m thinking about how to refactor these functions to make them
> cleaner. They=E2=80=99re a bit cluttered right now since the 'find' and
> 'update' logic are merged together. This might be outside the scope
> of your current patches, but the memory management is becoming quite
> confusing. Unfortunately, there isn't an easy way to move this logic
> into igt_device_new_from_udev right now.
>=20
> > +	parent_idev->parent =3D bridge_idev;
> >  }
> > =20
> >  static struct igt_device *duplicate_device(struct igt_device *dev) {
> > @@ -1234,6 +1239,7 @@ static void igt_device_free(struct igt_device *de=
v)
> >  	free(dev->device);
> >  	free(dev->driver);
> >  	free(dev->pci_slot_name);
> > +	free(dev->pci_gpu);
> It could be unalocated memory.

Since igt_device_new() allocates memory with calloc(), it may be NULL, and=
=20
free(NULL) is safe, I believe.

Thanks,
Janusz

>=20
>=20




