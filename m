Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE1EDCD11DF
	for <intel-xe@archiver.kernel.org>; Tue, 26 Mar 2024 20:59:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD2ED10F311;
	Tue, 26 Mar 2024 20:59:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kxbdu63g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A482510F311
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Mar 2024 20:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711486758; x=1743022758;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LYiqc5hvSgwljPqy0iTQZ4mjdbp7o3Guus1TKk++TZ4=;
 b=kxbdu63gmTsgNki/4TmnTQDuDjI9YULoyMd9X7T0fqAxFvxqUsUhf0Nf
 +EJO34J63GMLSiWX11+YgmV2H6JLcBQtrUuqDfFERNaoZywmjl3VDMxEq
 8dZgMLIzkkxQQ1OuPNkJvlhBSZY3xHctRP2C8HdEdvaQjpe2hOLyd/Jv2
 Dz6bpzMcZLjIt8mb8N/Y0YyWXPdjukeHU2Gslm8Cp3gUv+jXJ75fEvmUy
 nyByieQaQikGci8lXK9mfyhSUL7jEHjYyFcQ2qIn6tC5DoWauTNV2W+Sf
 dol11HTB6JW7Z2gGJIbLxZIysgZViJXPGfPKGSTlELKzljSim5DIE9Sdd w==;
X-CSE-ConnectionGUID: a9wvubAyRCicz/sOx8HNFQ==
X-CSE-MsgGUID: ghGi2pKwTPumA9wAy4X3/g==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6428950"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="6428950"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 13:59:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; d="scan'208";a="47261139"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2024 13:59:17 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 13:59:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 13:59:16 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Mar 2024 13:59:16 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Mar 2024 13:59:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YuooSuXfduuE7g4Wrz46jNEVG5285b4oy6nUfO3QcvJdaBnoKeiqHfHqv7Z3kiYjkyJlVnqJbN9WsedmJuRqu4AH/yPE9leP4YOLOJS+glE0Ev7KUTNsJjYe68+kMJH2MKT4HgRGok3NQObB18cQUzRfpulokhG+pCGgeE6urJQ8IJdjKHmdUwVvicJgrNDLsRmxOlZiHeIxU5RmezMBeHknGqWBIO7jTyd611sCqzZPRyujequqff11A0EApT4yi2whxqtGbbQnvrNaMLt+cnMxYTittSBqO2yhE94cdtW1mJRS9/4X1j4f58yvDs5ZXQPncZ6joc0QIgDfrCnlYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kIr57XJPCBV/rcRAw03MT0E2fOS8Z1KAi7CRFuJnv1o=;
 b=RxW4CtluWpCVmEnkbQtAJky37rOp7TUs1pVRaa9TJlhjJzWmA4Aiq8E5aPo5OvHpbquTQ/IO15IzVTLfgVafHf3oL6sGgEcqT1VvIunifM43CAUL7yyWcMb0McPpHxqyQFHaOQjTVXovoQa/ntmBsO7+/G105iPCL0OuigxL1jjAs8nCFiskk77mttVtZ3uw3a7DPiHYK1wChD3pIQicsE6+Z5xWcYD4ihZTQAgxl3ZAqTaYGYMswaKjwiXyZyQQIg/SlPtMDN7wFTo9sBcFkgwoku/ixElnW3q50Lt+s7AIoWaOSldGQ80H3w9uXDqXp12n9QSz++RkRCQgRa8MwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by BN9PR11MB5228.namprd11.prod.outlook.com (2603:10b6:408:135::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Tue, 26 Mar
 2024 20:59:14 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Tue, 26 Mar 2024
 20:59:14 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v4 13/30] drm/xe: Move ufence add to
 vm_bind_ioctl_ops_install_fences
Thread-Topic: [PATCH v4 13/30] drm/xe: Move ufence add to
 vm_bind_ioctl_ops_install_fences
Thread-Index: AQHacRarMl9lFUYHdUCbnWN/MknG6rFJCULQgAFykQCAACK+4A==
Date: Tue, 26 Mar 2024 20:59:13 +0000
Message-ID: <SA1PR11MB699122EB886EB323AA2DF75D92352@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240308050806.577176-1-matthew.brost@intel.com>
 <20240308050806.577176-14-matthew.brost@intel.com>
 <SA1PR11MB6991931E0535678F8640623F92362@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ZgMZ2DsPwtd8lynK@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZgMZ2DsPwtd8lynK@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|BN9PR11MB5228:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +p2FlO0DGRp4BlCkrFuuvJZYolCtwwH8LX08eDBFPzJ5m4Rz65CojaTV9vFajRgstLLv+nbIw1UWOhKFGqsLMrlMKYCGwCoqb4I6y00d4pJzcpqZLe10LppbOmYZVO7dyw8d/KAOyB8IQw3eF61Z2cxijx6EkqGZC00AFd1xsZblI5r+WWRueEQroNu7nw4sqAhE/6GDWPQWnKwd/nejA7FCaoDiWNQ20e7nrFZrhKtib+DZrVlHLk1CWVGtpW7tl+5jXoTygCsjXKmc8D4yO1RQR11STieyMtyV0STiQvq17xrVkEx+zbHNDVLQ4Cz9gONYnTlD0Fs1LKYXxlEGQ0m92z3C6dIRcQ/XBQx9H42K0jZf/2xpaFxFsN19Atclo9bTRmrf9lHHaHv4jZhVTrrNZo9cggxKFuEaoehlnDztDdN+/rQXGfcTdOfRvtYUJzWn2SNuDJCBYbuM4BNqzKWMyEfsP8tuDtH6itZb8dEhLaQJ8XjYquC1jAtPaKodtIk0XoKIdME1rE35NAyTNuUjnfExnYNUdpm93pyz81IZAu7Se058AvblrNlyiFfzDYyxY0x7DVoTfZ9y4PxswVOAm8jICjMY8ayIng9HxT/coCSHSdm5MRShs0IFslgvoHLBzk9mTS1QWJq/nFQZiGm0atOk2zGkBpkyYOtX8oI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nN2HpzeRyhEwVs5OpGeaBT1TTiBht+LSpNQGYYolglB4ION5diYn81PyOxWN?=
 =?us-ascii?Q?hVUpboVu8LGoetDsEyrTqe9XaUPFln7i1C09Bc/tiJNY/gR1e5Zmefrb7bLM?=
 =?us-ascii?Q?QgE/0nUFeNd5yoErZ91MoRNbFyZgeIqJDInyMdO1+k4ojCA7ORxELfzBp86S?=
 =?us-ascii?Q?29Sn4YspWoSRhkqkDM2ho7AQrVPwSC+3Iw7GErNTa8MGfNspBWkSm3m54axR?=
 =?us-ascii?Q?vJXgiidmv4hHyY+8vNtTg5l3A38TYwnOwpZJ4rJeP4zq+Hhsaw+YkuFKnGHC?=
 =?us-ascii?Q?mKHJgm53V2Sjx1J5EznCGzPRv3N5tGz6MW3RrEbbWXxm2nMb5vxY3TTOwwVV?=
 =?us-ascii?Q?v5jB5cjTHRVxF2TL2Tc5BjeTxI2hVQTgvqyl5dHyLinnQ95w7PY9jRHvnar6?=
 =?us-ascii?Q?QmtB1Q8Ll/rqnVYP5UhnVEoPWe1Ljd69aF+zxkojxWumLeY7+i9/90Zw5Po5?=
 =?us-ascii?Q?ji8TAWgy0vo1X063QHWZvK/RpnoIOlyMhm0cfOABn3iPikDAkNdPdbErqHJw?=
 =?us-ascii?Q?mARzqzMZir/A3S0T7p1xpCNZurM/NhR6EVYJ8DSt1O16WYvEMyGvsnLTW1t6?=
 =?us-ascii?Q?1hbrOfawmQ9gzXiTd1IsVCNfUcLpGDZnTtb4X9CiXDBd4xYgkdpcvC9etsu3?=
 =?us-ascii?Q?xQB0IboOltBrJ509X3BAXGdVTOPa/EXRQuX+PBjQm/7SFD3D5iIWzbOE/H5D?=
 =?us-ascii?Q?8xzRmOJHOEOLQD6pk44rVkiETzL2quA1jw3bOU3G0T1doF4mww43TZR/FNVp?=
 =?us-ascii?Q?zkMVBXdICRyc8SeEonxBzp/8KapObsf4lN9Gvxs1fVE9ZMY00RzVWP7pPMWq?=
 =?us-ascii?Q?obz47Uakkzbve/BoPGxTCeAvyU9++LMZFNZHrf3JrJXuHrn3A5+81pcndjaj?=
 =?us-ascii?Q?gX4FbOKFb6HPGIOm5fUKrVCr1PAuiyVT2f6aPWu/DxoVZ7rWAXgi9T16W1+G?=
 =?us-ascii?Q?ZXEaNq2pUnbCWnL5x4PUFrZqdLAfqRcjFnYRXX4+Kllq2K58OamQl9KGghsb?=
 =?us-ascii?Q?O07uVM+9VRJSa7FF5mIm7B7tMiLuH5Jby1UGD5xBjDjd2H7Ml2ckTwoT+BdE?=
 =?us-ascii?Q?gUZa/CcjDFWBrMnF62XPuJfdCxPU9nsEkL4wkvKmrzOpzan9gxrvqd9gqMIV?=
 =?us-ascii?Q?gXgjPHakstZWvdbE9hDHdEUnaIaM+aB/7Gnc2L6K9cPNL17C8AKut3uAelYd?=
 =?us-ascii?Q?ZcTigeyNWccoJ5fwgxOVCqBSzarma/txcKbzC91gM+uYjGPz1XjDenqG9FQW?=
 =?us-ascii?Q?pUAl6uS9wudP8DPvj2XLdv0blwQR1jmawDlDG7P3t3WArgOSlOg6gAG4agrp?=
 =?us-ascii?Q?3wGDTM3kbawyVd+oB0jBp6XVpOP2USdlxRIp+xb63afNFJGFqxpR/HxfcV2U?=
 =?us-ascii?Q?1ugfBCCSeUeUH0gtPFJgVCXul91+rST9eHoqIVRQR+yQM4a+eqiXHuF6hBi9?=
 =?us-ascii?Q?Sky3E+pzo2iqGl6wazKBMXCS3X3NvFttTR++O62ekeKy5C60qiUCF6P40E/R?=
 =?us-ascii?Q?5kjTgnV6w3E3RGclvR3z83WW/g5GP3lQq9M/PdnCbxFGGVo6SjG9dul48psv?=
 =?us-ascii?Q?iknZbAOnEDvP0GoCV1U=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68b72a11-680c-4ddc-212d-08dc4dd797cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2024 20:59:13.9233 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9ZZAkFiK7NuI3KDnpu8mYG/BdPqC04jVVlDRSX2S4KYtwb8BnaMOGFuzePZDkNe2xQr6TDiB8czzuspuU2SujQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5228
X-OriginatorOrg: intel.com
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



> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Tuesday, March 26, 2024 2:54 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [PATCH v4 13/30] drm/xe: Move ufence add to
> vm_bind_ioctl_ops_install_fences
>=20
> On Mon, Mar 25, 2024 at 02:54:44PM -0600, Zeng, Oak wrote:
> > This patch makes sense to me. See two nit-pick inline
> >
> > > -----Original Message-----
> > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Matthew
> > > Brost
> > > Sent: Friday, March 8, 2024 12:08 AM
> > > To: intel-xe@lists.freedesktop.org
> > > Cc: Brost, Matthew <matthew.brost@intel.com>
> > > Subject: [PATCH v4 13/30] drm/xe: Move ufence add to
> > > vm_bind_ioctl_ops_install_fences
> > >
> > > Rather than adding a ufence to a VMA in the bind function, add the
> > > ufence to all VMAs in the IOCTL that require binds in
> > > vm_bind_ioctl_ops_install_fences. This will help with the transition =
to
> > > job 1 per VM bind IOCTL.
> > >
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_sync.c | 15 ++++++++++++
> > >  drivers/gpu/drm/xe/xe_sync.h |  1 +
> > >  drivers/gpu/drm/xe/xe_vm.c   | 44 ++++++++++++++++++++++++++++++--
> ----
> > >  3 files changed, 53 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_syn=
c.c
> > > index 02c9577fe418..07aa65d9bcab 100644
> > > --- a/drivers/gpu/drm/xe/xe_sync.c
> > > +++ b/drivers/gpu/drm/xe/xe_sync.c
> > > @@ -343,6 +343,21 @@ xe_sync_in_fence_get(struct xe_sync_entry *sync,
> int
> > > num_sync,
> > >  	return ERR_PTR(-ENOMEM);
> > >  }
> > >
> > > +/**
> > > + * __xe_sync_ufence_get() - Get user fence from user fence
> > > + * @ufence: input user fence
> > > + *
> > > + * Get a user fence reference from user fence
> > > + *
> > > + * Return: xe_user_fence pointer with reference
> > > + */
> > > +struct xe_user_fence *__xe_sync_ufence_get(struct xe_user_fence
> *ufence)
> > > +{
> > > +	user_fence_get(ufence);
> > > +
> > > +	return ufence;
> > > +}
> >
> > I wonder why this is made part of xe_sync. Isn't just a ufence get func=
tion? Can
> we drop _sync_ from the function name?
> >
> >
>=20
> Typically exported functions should have a prefix matching the header
> file name.
>=20
> e.g.
>=20
> xe_sync.h -> all functions should start with xe_sync_*
>=20
> In this case struct xe_user_fence is private date member to xe_sync.c
> (only define in that C file) and just an opaque pointer to the rest of
> the driver.


That makes sense. Thanks for explaining.

Oak

>=20
> > > +
> > >  /**
> > >   * xe_sync_ufence_get() - Get user fence from sync
> > >   * @sync: input sync
> > > diff --git a/drivers/gpu/drm/xe/xe_sync.h b/drivers/gpu/drm/xe/xe_syn=
c.h
> > > index 0fd0d51208e6..26e9ec9de1a8 100644
> > > --- a/drivers/gpu/drm/xe/xe_sync.h
> > > +++ b/drivers/gpu/drm/xe/xe_sync.h
> > > @@ -38,6 +38,7 @@ static inline bool xe_sync_is_ufence(struct
> xe_sync_entry
> > > *sync)
> > >  	return !!sync->ufence;
> > >  }
> > >
> > > +struct xe_user_fence *__xe_sync_ufence_get(struct xe_user_fence
> *ufence);
> > >  struct xe_user_fence *xe_sync_ufence_get(struct xe_sync_entry *sync)=
;
> > >  void xe_sync_ufence_put(struct xe_user_fence *ufence);
> > >  int xe_sync_ufence_get_status(struct xe_user_fence *ufence);
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index 5767955529dd..5b93c71fc5e9 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -1810,17 +1810,10 @@ xe_vm_bind(struct xe_vm *vm, struct xe_vma
> *vma,
> > > struct xe_exec_queue *q,
> > >  {
> > >  	struct dma_fence *fence;
> > >  	struct xe_exec_queue *wait_exec_queue =3D to_wait_exec_queue(vm,
> > > q);
> > > -	struct xe_user_fence *ufence;
> > >
> > >  	xe_vm_assert_held(vm);
> > >  	xe_bo_assert_held(bo);
> > >
> > > -	ufence =3D find_ufence_get(syncs, num_syncs);
> > > -	if (vma->ufence && ufence)
> > > -		xe_sync_ufence_put(vma->ufence);
> > > -
> > > -	vma->ufence =3D ufence ?: vma->ufence;
> > > -
> > >  	if (immediate) {
> > >  		fence =3D xe_vm_bind_vma(vma, q, syncs, num_syncs, tile_mask,
> > >  				       first_op, last_op);
> > > @@ -2822,21 +2815,58 @@ struct dma_fence *xe_vm_ops_execute(struct
> > > xe_vm *vm, struct xe_vma_ops *vops)
> > >  	return fence;
> > >  }
> > >
> > > +static void vma_add_ufence(struct xe_vma *vma, struct xe_user_fence
> > > *ufence)
> > > +{
> > > +	if (vma->ufence)
> > > +		xe_sync_ufence_put(vma->ufence);
> >
> > Not sure where/when we introduced xe_sync_ufence_put, for me this can b=
e
> renamed to xe_ufence_put
> >
>=20
> See above, I think the naming is correct. All of this is a matter of
> opinion, we don't have any offical style guidelines for Xe but we might
> want to think about writing some up / fixing Xe to conform while the
> driver is still relatively small.
>=20
> Matt
>=20
> > Oak
> >
> > > +	vma->ufence =3D __xe_sync_ufence_get(ufence);
> > > +}
> > > +
> > > +static void op_add_ufence(struct xe_vm *vm, struct xe_vma_op *op,
> > > +			  struct xe_user_fence *ufence)
> > > +{
> > > +	switch (op->base.op) {
> > > +	case DRM_GPUVA_OP_MAP:
> > > +		vma_add_ufence(op->map.vma, ufence);
> > > +		break;
> > > +	case DRM_GPUVA_OP_REMAP:
> > > +		if (op->remap.prev)
> > > +			vma_add_ufence(op->remap.prev, ufence);
> > > +		if (op->remap.next)
> > > +			vma_add_ufence(op->remap.next, ufence);
> > > +		break;
> > > +	case DRM_GPUVA_OP_UNMAP:
> > > +		break;
> > > +	case DRM_GPUVA_OP_PREFETCH:
> > > +		vma_add_ufence(gpuva_to_vma(op->base.prefetch.va),
> > > ufence);
> > > +		break;
> > > +	default:
> > > +		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> > > +	}
> > > +}
> > > +
> > >  static void vm_bind_ioctl_ops_install_fences(struct xe_vm *vm,
> > >  					     struct xe_vma_ops *vops,
> > >  					     struct dma_fence *fence)
> > >  {
> > >  	struct xe_exec_queue *wait_exec_queue =3D to_wait_exec_queue(vm,
> > > vops->q);
> > > +	struct xe_user_fence *ufence;
> > >  	struct xe_vma_op *op;
> > >  	int i;
> > >
> > > +	ufence =3D find_ufence_get(vops->syncs, vops->num_syncs);
> > >  	list_for_each_entry(op, &vops->list, link) {
> > > +		if (ufence)
> > > +			op_add_ufence(vm, op, ufence);
> > > +
> > >  		if (op->base.op =3D=3D DRM_GPUVA_OP_UNMAP)
> > >  			xe_vma_destroy(gpuva_to_vma(op->base.unmap.va),
> > > fence);
> > >  		else if (op->base.op =3D=3D DRM_GPUVA_OP_REMAP)
> > >  			xe_vma_destroy(gpuva_to_vma(op-
> > > >base.remap.unmap->va),
> > >  				       fence);
> > >  	}
> > > +	if (ufence)
> > > +		xe_sync_ufence_put(ufence);
> > >  	for (i =3D 0; i < vops->num_syncs; i++)
> > >  		xe_sync_entry_signal(vops->syncs + i, NULL, fence);
> > >  	xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
> > > --
> > > 2.34.1
> >
