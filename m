Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A782EC3DA45
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 08:31:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D5210EC55;
	Fri, 12 Jul 2024 08:31:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VNz05sb7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D04A310EC55
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jul 2024 08:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720773077; x=1752309077;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=H4YZlVo8ItBsN1L3RTAmq0NS4QrDI7+JS4fvngV4QPA=;
 b=VNz05sb7rqaQeonVUuKBX7C9/AcYRs3sUN/HkcRUipIlnMr1a5d4NHjZ
 TxBpW7uBJpF2AgdH/xkTelQIlcYpCU1Czv/8Afp4DZtK1QBrRYijbDyr2
 CJnqBW7QSjxwuuOMEN9nsTLmCO0wkJhd0c35TVawvlqb+WnfE5+aixHl/
 2riPsL16c+tns15UVDg2tl8ON2UE8hts8J8uxxnta0izVyZaNNWYaPTas
 KR61Da/JeUkwfKaWUlX5zjChs4jP1ditCAweLHMxyLtPXR4ovPHfcUo/0
 kj4UjoxsdVr2qi5lEUxLcfp0ebShMi7Fs+kjRDUhdgmH+bDHaXstY/kAw Q==;
X-CSE-ConnectionGUID: gKiC6ZAeTqOSQLuBdaajOA==
X-CSE-MsgGUID: TfpiwplJRZSjKRpLe148zQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="35746784"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="35746784"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 01:31:17 -0700
X-CSE-ConnectionGUID: qffckUchSAqOBqOvbS0vxg==
X-CSE-MsgGUID: cNIXOdweSk24KVHvTPx3Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="53151132"
Received: from unknown (HELO localhost) ([10.245.247.129])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 01:31:15 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 12 Jul 2024 11:31:11 +0300 (EEST)
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, 
 "david.e.box@linux.intel.com" <david.e.box@linux.intel.com>, 
 "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH v6 5/6] platform/x86/intel/pmt: Add support for PMT base
 adjust
In-Reply-To: <IA1PR11MB64186499A6047EE3951BE8C4C1A52@IA1PR11MB6418.namprd11.prod.outlook.com>
Message-ID: <61965dbe-9ad4-edc0-e0f1-131916e1a9b2@linux.intel.com>
References: <20240710192249.3915396-1-michael.j.ruhl@intel.com>
 <20240710192249.3915396-6-michael.j.ruhl@intel.com>
 <b521ebe3-e7d2-6ca9-e626-ae9d3a455078@linux.intel.com>
 <IA1PR11MB64186499A6047EE3951BE8C4C1A52@IA1PR11MB6418.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1723152562-1720773071=:1010"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1723152562-1720773071=:1010
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 11 Jul 2024, Ruhl, Michael J wrote:
> >-----Original Message-----
> >From: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
> >Sent: Thursday, July 11, 2024 7:34 AM
> >To: Ruhl, Michael J <michael.j.ruhl@intel.com>
> >Cc: intel-xe@lists.freedesktop.org; platform-driver-x86@vger.kernel.org;
> >david.e.box@linux.intel.com; Brost, Matthew <matthew.brost@intel.com>
> >Subject: Re: [PATCH v6 5/6] platform/x86/intel/pmt: Add support for PMT
> >base adjust
> >
> >On Wed, 10 Jul 2024, Michael J. Ruhl wrote:
> >
> >> DVSEC offsets are based on the endpoint BAR.  If an endpoint is
> >> not avialable allow the offset information to be adjusted by the
> >
> >available
> >
> >> parent driver.
> >>
> >> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> >> ---
> >>  drivers/platform/x86/intel/pmt/class.h     | 1 +
> >>  drivers/platform/x86/intel/pmt/telemetry.c | 9 +++++++++
> >>  drivers/platform/x86/intel/vsec.c          | 1 +
> >>  include/linux/intel_vsec.h                 | 2 ++
> >>  4 files changed, 13 insertions(+)
> >>
> >> diff --git a/drivers/platform/x86/intel/pmt/class.h
> >b/drivers/platform/x86/intel/pmt/class.h
> >> index a267ac964423..984cd40ee814 100644
> >> --- a/drivers/platform/x86/intel/pmt/class.h
> >> +++ b/drivers/platform/x86/intel/pmt/class.h
> >> @@ -46,6 +46,7 @@ struct intel_pmt_entry {
> >>  =09void __iomem=09=09*base;
> >>  =09struct pmt_callbacks=09*cb;
> >>  =09unsigned long=09=09base_addr;
> >> +=09s32=09=09=09base_adjust;
> >>  =09size_t=09=09=09size;
> >>  =09u32=09=09=09guid;
> >>  =09int=09=09=09devid;
> >> diff --git a/drivers/platform/x86/intel/pmt/telemetry.c
> >b/drivers/platform/x86/intel/pmt/telemetry.c
> >> index c9feac859e57..5c44e500e8f6 100644
> >> --- a/drivers/platform/x86/intel/pmt/telemetry.c
> >> +++ b/drivers/platform/x86/intel/pmt/telemetry.c
> >> @@ -78,6 +78,13 @@ static int pmt_telem_header_decode(struct
> >intel_pmt_entry *entry,
> >>  =09header->access_type =3D TELEM_ACCESS(readl(disc_table));
> >>  =09header->guid =3D readl(disc_table + TELEM_GUID_OFFSET);
> >>  =09header->base_offset =3D readl(disc_table + TELEM_BASE_OFFSET);
> >> +=09if (entry->base_adjust) {
> >> +=09=09u32 new_base =3D header->base_offset + entry->base_adjust;
> >
> >The code setting ->base_adjust is responsible for avoiding stupid settin=
gs
> >that would lead to underflows and overflows?
>=20
> I would think so.  Since this driver is not aware of why the adjust is se=
t,
> it is not clear how it would validate it.
>=20
> Is this a request for documentation of the usage, or did you have a conce=
rn
> that we need to verify the value?

It's just that usually in-kernel interfaces too feature sanity checks but=
=20
perhaps you're right and the telemetry side just doesn't know enough to=20
even make a sanity check on the value. Let's just leave this as is for=20
now, it can be revisited later if there starts to be many usecases for=20
this.

--=20
 i.

--8323328-1723152562-1720773071=:1010--
