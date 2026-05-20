Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA78CD4F54
	for <intel-xe@archiver.kernel.org>; Wed, 20 May 2026 04:42:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B125410EEDB;
	Wed, 20 May 2026 04:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LXSpgHyM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E659A10EED9
 for <intel-xe@lists.freedesktop.org>; Wed, 20 May 2026 04:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779252163; x=1810788163;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QtynSjn4zdKbM4zFi96AkhAqBoY7SBd9fganU87lki0=;
 b=LXSpgHyM/c4DDTWsU8tqC/3oyVN9DfuYWBvlVtfoPL3ZYyhAgEsjpu2t
 IVGyStEr38DyLtopKowsUtESrhUaCFF9VLZAy/0SHs3a0x2h8j9zD8T/e
 jmANzShjMZ2pYFWhW+kNO8dVmTrlHYBK4hdmdgmBe/fNeKj93DTv6p0Il
 vT6G510KTJDWCEiDbmpkAG/Gazxe64MStgusXohVlubNy5kHlmPxc29iR
 vwly4pIUBVCF+xsfd906K1qSYheRieFZFKQPrQAO574KUss2BtlQNhjx4
 RLsTJa8toF4nSIyj3I2Mb7d+E9iKoKSOGIRZtCNGGP32zLZfYKbhZQlH+ A==;
X-CSE-ConnectionGUID: 8hVvCmcFT3mmA/2fO8N6Sg==
X-CSE-MsgGUID: 41YKal+xR66E9Ti+dp2zxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="91247801"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="91247801"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 21:42:43 -0700
X-CSE-ConnectionGUID: yK6VqXcQRg29BSusADpW+g==
X-CSE-MsgGUID: +ARllZH6R5e4wlAAHB/bag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="241838047"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 21:42:42 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 19 May 2026 21:42:41 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 19 May 2026 21:42:41 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.29) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 19 May 2026 21:42:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YQAEAlB69GAqc7uQm2b6T7crGwxqR66+qF1MV++5PLuGXmG525OwiWZQqg/eSUn+zTL9yrOfFJrF0MkSHN1u9vKHIg/K82ysafYj3yPmdU8qlDoDhCUIlFL2ODAVmYU/ClSmk2VtETbMhxqE1J54t1TKl90uUVcUqbiBOBEmIUVoeFDFMvIeHIQa/pDtRVC4e0ZqtLXD6yKGo9NbOOu+eA+1+SdA3edFcWEmZEkeD0VkR5Q/mIKSGMPhHpCqApW8tRLykfpovHDwDXfjmtdxE18X7XMyQAajRJRIVRcPhQhh+uhdFIgLf2QKFZLtWACdAPM+JLcz3/3422xYBQHpGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZAOZhMsaT+7O6GKbm26j5BLRFNq2wrcAuu0fSG3krSs=;
 b=CQ83MhZ+GaWLhSD4S1FdIjp+lQnauta6Z60gZJCC24+mQ8X0z6mHwbvmJ6S4NiL5Ff6QjHwMdcHpSGchLeqFqHcpkHJIs7jBx+nLq0IbF2EnFoBnL31/tn9LM1zl61qwVHmvgV0FWWxgLjZwD78mYjAnQYrOZAi2tFETrqhalq3OBMptut4S/oKmn/48fHyQXg/a3d1QFaktLVcGQWZB341hPfIjsYIF7C2SSGUshmdrKFIIQvcn2kz22nqUK/HRiWmfam8HYdPV8GEsrXbYHubKpMBYt8o5p8QM6WjNaYIQRjp9bOl5A3WfsbjWleKG81MYjIU/79rAnGIfYRNrXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by MW3PR11MB4698.namprd11.prod.outlook.com (2603:10b6:303:5a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Wed, 20 May
 2026 04:42:37 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7%2]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 04:42:36 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Wajdeczko, Michal" <michal.wajdeczko@intel.com>
Subject: RE: [PATCHv2] drm/xe: Check for dead config space on reading all 1s
Thread-Topic: [PATCHv2] drm/xe: Check for dead config space on reading all 1s
Thread-Index: AQHc50Adahfj7t4fZU+Jf7gOmxxfV7YVzQuAgAB8kpA=
Date: Wed, 20 May 2026 04:42:36 +0000
Message-ID: <IA0PR11MB7307AE528ACCF3DC54AA4072BA012@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20260512060128.209698-1-arun.r.murthy@intel.com>
 <20260519033104.480503-1-arun.r.murthy@intel.com>
 <20260519202629.GI3397116@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20260519202629.GI3397116@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|MW3PR11MB4698:EE_
x-ms-office365-filtering-correlation-id: e14d3649-c85a-442a-d5e7-08deb62a375f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003|38070700021|13003099007|11063799006|4143699003;
x-microsoft-antispam-message-info: NFkeDkquUYZ8xGk9cWkKvUyPzUBqQFLdmlnFC10zrvhlW4K/+cUohWqwBvi5BIgEWx3XMHefoomirA3+heSHEJMaob68cf485uPdLwZRyVptOutOV6+SDS7nrvKlnE6dMwWGzHbYggg6NJx40ygags9RB3257cF5Nf32KNpuZTmxk9oUQL5mC3YBGZ1NQaHisX6zZaMRRfdlbSHJLAqVgiGX8RcR/I3OKw4ZE+u2hleZlUZXEhvcNPbH4E8S8pfrFGBQe8+lux7JHPXrllMrCtFzYWXN8cE2oy7liCnMtFBSaC1I192E3afjx3Z01jhuMZwoyuHYBa2DOXJDraskOB2rpRYoRA4bu4tg+34EqfyWuRE04xcqz/JSr1Fi8AtouP+f8EfQchuLI7Nz0FgEqYK2pdEzYgSzueheVn9yKdYagy33lCqZYxd1+d6iwTlNwmfPueGbKs9U6yLuRq9e2ok/pbEh+pLNm8LQT/MspCYQCPjlfz/R45CXqAsORufi+0Ru9VO45KBxZ2hV24Sn1EplEOxM655akiOldFuDy/fY9oYhoJuAYiyPi3OOphuQPC+xNX1xjO7aspKV+QjSYa0p0qMv5r+15QTpaS50PeRoQxj92JlbOogbhPF6WPoXNwRRPX67/kotBRUGhCjqvAkB5oR2ZK4We1zxIqDH74hYIetOwNIYoH5Q/9zBlRXq0Zo8B4ot0xxAoL9IJXE67g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003)(38070700021)(13003099007)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RHMwr7OwgrnDd2vDS+j4odE70mWGs7NXX/PYdVLPLO2a/kQBg/cHxCOuqe8y?=
 =?us-ascii?Q?jnSfvICXBMOWtu1/oqdmZ+92BExDJj+KuPPFTYX9G1iRdFPxpcBSGVNB+uVq?=
 =?us-ascii?Q?gOZi/OvAgD3wpyLTH4zCsb1WUNS4dm+boRlP/+MFpLTB+RkOmVrei75y3x/s?=
 =?us-ascii?Q?j/+i4YUKyByzaEi2rQv9hoIwHHHewFjjPHC+UKnGNxjtdueRm2RasRPYqibO?=
 =?us-ascii?Q?W9mZRfur0JTeLLedb7d0rT8z4+AyqzbwkyrsJsVgkn0Ba15WE1nbSM8E8CvN?=
 =?us-ascii?Q?VYHKv8E+dLpAY6/TitjYbGOlZzKXQxcNJUFN8saGXbGyuUDkuzr3pMoPsWp3?=
 =?us-ascii?Q?g/6rlzpYReJ8nr1MNziz3CXJWJ6kgIOD5+OUdBUgqxo9+k3FEUYnHAZK7czP?=
 =?us-ascii?Q?iZy2y6vC/B8sjenN4ckJMNSo86sR9qWAKB1TbYn6dVDvfwAOf1hHnyTJ+5zy?=
 =?us-ascii?Q?Y3SfSAKF0OZFu1fJCqC2JGVzdaEOVsZDQUwLKZTn4VfgBtLzXrDdgTbsTxi8?=
 =?us-ascii?Q?wpRnVTGZsLKvzC1MR28/NrJSLgN3XeCYZWZyyTIuMeDZvmLZqULOjFTwolSo?=
 =?us-ascii?Q?P1S4TRrpFIEVqLMEVX/zRZCdpEFEzaNazbqOkyXGmlYYYrjIwJPcScH6KNHK?=
 =?us-ascii?Q?UL9FKrwI+kkgpV6dmjd4dpisHnaZlEWRnbMITf9fb1igBZKiHq4uHXW3W74o?=
 =?us-ascii?Q?lWxDvLYuA9tVeSDJ9kwkU8PsFhQ1fsd7Z2Cz/99+JSLpooeut4zoDNj+5wqh?=
 =?us-ascii?Q?OF5PloveCWSIijIVRlwd4V3WZb7TGWPYzzfjI6C28IbnmWnc8r6D1Bkm9YIL?=
 =?us-ascii?Q?/Mgp12VGL6+CQQLMPoBukn4YlDpws8Qxc4KJGqBGxDPohiWd4FYLb0upM/h0?=
 =?us-ascii?Q?dtZ4YkyUk47N7TqJAzxleJ8mszmpGZqXB99ETfU0ytxFGzvnUtRQs+1tfeI7?=
 =?us-ascii?Q?rGb3TiNBzUSOZPHvmRclVzSh9kGs5Sft7+YAY3PoLV12I8m8zK4CTqO+MPLN?=
 =?us-ascii?Q?g6ZANxYPFNid4atfxHStoJRuNBHN37m0J2ZFEYAZLB993Z/ZNchb0SEjEARa?=
 =?us-ascii?Q?wftakVCMyg4XD0Zy5qD96Qn4hTYYKnParpykAYKQm9gOmX6oeEJNhDRaaq7o?=
 =?us-ascii?Q?fh8KQ48740LKT8p7W+t90Ilbx+qrQeqieRlaKr6wXJsFuzzqr0ud3h1qWAwC?=
 =?us-ascii?Q?4uS9cS7VQTtgAAS+uwnLfqyK0MxBaHnBkEBDmPcd9uGcelCXjQN7gusxRTQY?=
 =?us-ascii?Q?Lj6DHXL1hm9B0Eu1ZUg39O5rHMC4Pj9sBdzA2Vt6T+GEV1VgipPM3Z9WScsc?=
 =?us-ascii?Q?uq/gbmXcC9wQwwgKxROIwqfoTq0Wt+CHCzf4K22ttycghB9+MgntF9z+M98A?=
 =?us-ascii?Q?qkUhPcmHqkYTKvgYDwFtfdlDJxrmaWuyBfMGlJr06d480V1uawhf5HOHSve/?=
 =?us-ascii?Q?P08xkmzrg1m/mEpXOzMlphPFPdVtMnctrrBup7XQMsr807Ma208ISbOOQtjN?=
 =?us-ascii?Q?12EXMO/xobQDBiYV0otwfFEx0ldk6Seia5e5Sm9UnFoEkm1OW0w1zrB/wtCg?=
 =?us-ascii?Q?sYlCSqhH82XqjSEbSQsUwA6w+fO3Xg3Aj/eBXdSVIwYfQJXxZc1UYY8I2wqH?=
 =?us-ascii?Q?IZdhnOVFy5FPX2dScSZxrOUS07A2kFJjTamqSuse0GM3mtuoLs5xXBNtxq+N?=
 =?us-ascii?Q?jrh/LC3hOOmI+kkl+bRc0p+Z2t2q6WEvYeIEpBvq404v30Siwc2DLY+rAqmM?=
 =?us-ascii?Q?qM7fgZxLXQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: XJUoHucW1xwi5+pq5+twVpAveDfJX13mZtLHQdD5lAoOMU3JSFCaZ4bi0fvGLcyNybStlBL+y6IPvpT8DhX4hwJD/KgpADBUvyUpZtr+LPb90jybROzCnzjPvEVCXJhdIX4wrM96Ss85noLPJHkIDqRnAEGVg8hfAHdUMEJFIV6EEk3MjanG5v3J5MBC7zgtvj12VbU79VdSg+KqDFTo4mqVRvHQN5/lo/N7gYDmjDGup1zWFaC462fboR+O5iQyMKyftj2gN98h2/S0cVa8/vwwDPIJ6nJBw9WFrbxDR180qnXTnFEjlc4+CcQ4teZ09LuY6wKjaMvqekglZKL9qg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e14d3649-c85a-442a-d5e7-08deb62a375f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2026 04:42:36.7054 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E4xjOEzo0wO+7BrvzLsWKpt4adPp9dRYH8f6xEBstXsm4xqfVj6Jx5sugfuxUjXHUmnL+5yzTap/VPRMLOZyRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4698
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
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: Wednesday, May 20, 2026 1:56 AM
> To: Murthy, Arun R <arun.r.murthy@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Wajdeczko, Michal
> <michal.wajdeczko@intel.com>
> Subject: Re: [PATCHv2] drm/xe: Check for dead config space on reading all=
 1s
>=20
> On Tue, May 19, 2026 at 09:01:04AM +0530, Arun R Murthy wrote:
> > After ioremap the BAR mapped address is read once as a sanity check
> > and if found to be all 1s then return avoiding the driver
> > initialization of a dead device.
> >
> > v2: Move the sanity check to mmio_probe_early() - Michal
> >
> > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7941
> > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_mmio.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_mmio.c
> > b/drivers/gpu/drm/xe/xe_mmio.c index 78adb303b663..d206e3720eed
> 100644
> > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > @@ -90,6 +90,7 @@ int xe_mmio_probe_early(struct xe_device *xe)  {
> >  	struct xe_tile *root_tile =3D xe_device_get_root_tile(xe);
> >  	struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev);
> > +	u32 sanity =3D 0;
> >
> >  	/*
> >  	 * Map the entire BAR.
> > @@ -103,6 +104,21 @@ int xe_mmio_probe_early(struct xe_device *xe)
> >  		return -EIO;
> >  	}
> >
> > +	/*
> > +	 * If the parent PCIe bridge failed to leave D3cold, or the device
> > +	 * fell off the bus, MMIO reads return all-ones. Detect that here
> > +	 * before any other subsystem (SR-IOV, GuC, pcode...) consumes a
> > +	 * bogus 0xFFFFFFFF.
> > +	 */
> > +	sanity =3D readl(xe->mmio.regs);
> > +	if (sanity =3D=3D U32_MAX && !pci_device_is_present(pdev)) {
>=20
> Was the && here intended or was that supposed to be an ||?  I think if th=
e
> device isn't "present" the read would _always_ be a failure and get termi=
nated
> with ~0?  For that matter, is this the right place to be checking this?  =
I guess
> there can be surprise device removal at absolultely any time, but the mos=
t
> common time this would come back as false would be if the device got remo=
ved
> during a system suspend; the code you're adding here only runs on probe a=
nd
> not on resume flows.  I think it would be pretty rare to see
> pci_device_is_present() already return false here in the probe path if we=
 just
> got a successful return from pci_enable_device()?
>=20
Sorry should have been ||
The reason for having this check over here in early probe is to detect the =
dead config space and return early.
This is the scenario that the user is observing in the issue https://gitlab=
.freedesktop.org/drm/xe/kernel/-/work_items/7941

> I don't think any platform has a register at offset 0, so if the device i=
s up
> properly, the bogus read should come back as 0 (and we can recognize devi=
ce
> errors via ~0 reads), but it still might be best to read a known-extant r=
egister
> offset just to guarantee there's no undocumented behavior.  Maybe GMD_ID
> would be a good candidate since it should be non-zero (and non ~0) on all=
 POR
> platforms, zero (and tested as such) on the non-POR Xe1 platforms, and is=
 a
> register that we need to read early in device init anyway (so we could st=
ash the
> value and save ourselves the read later).

Reading the PCI_VENDOR_ID should also help in finding dead config space

Thanks and Regards,
Arun R Murthy
--------------------
>=20
>=20
> Matt
>=20
> > +		drm_err(&xe->drm,
> > +			"MMIO reads all 1s and device not present; aborting
> probe\n");
> > +		pci_iounmap(pdev, xe->mmio.regs);
> > +		xe->mmio.regs =3D NULL;
> > +		return -ENODEV;
> > +	}
> > +
> >  	/* Setup first tile; other tiles (if present) will be setup later. */
> >  	xe_mmio_init(&root_tile->mmio, root_tile, xe->mmio.regs, SZ_4M);
> >
> > --
> > 2.25.1
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
