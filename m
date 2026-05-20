Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E698CD4F54
	for <intel-xe@archiver.kernel.org>; Wed, 20 May 2026 03:52:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2E6110E02B;
	Wed, 20 May 2026 03:52:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FeujW9W3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D130E10E02B
 for <intel-xe@lists.freedesktop.org>; Wed, 20 May 2026 03:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779249137; x=1810785137;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vMVblVQ2bDFUH+7Do7QLQvLx9kqChm3onXqQ4SVceBs=;
 b=FeujW9W3QYiyTPC5sZ/qHS6cFv9HEGQtbTVjrn3+qQMLb/YU9k7tXk8y
 ohXt1FfQATimP/r0Zb1zj0/R0y8BdGpwv59qlIU0SuMKvOWVfPX/0df+F
 G41m1VtbmCIysAT/EP4V9kWVG+nG+1BCY/KTlrhX28jGxTRr4WtRM1Ein
 WQlBZsGK/goE1Fw25RlfVCvAu1NlfGMopYg0zAUn9b6eBDaRtfiAxF9bR
 bT2Jexjuvq3dJ6oE8fjj9j9Za7KBKFQ2xxAH51dq9Koku4F5BC37n5fVu
 dlQwubIl1uT0q/nQQiJtsGgq/lPaiTyWA287wc/16z0hEKAFCGSy1gT2Q w==;
X-CSE-ConnectionGUID: CX0GZEBAQvSFkdr3tFxvmg==
X-CSE-MsgGUID: qWlYgfVxRaWqgVJQHkXUug==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="83758153"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="83758153"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 20:52:17 -0700
X-CSE-ConnectionGUID: EXfrn+omS8OSMpXszoRIYw==
X-CSE-MsgGUID: 6cp6CrqfRHGrmbr4Gi6lkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="244287867"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 20:52:16 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 19 May 2026 20:52:15 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 19 May 2026 20:52:15 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.7) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 19 May 2026 20:52:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fzQP7l5/N5hCYAzSiGSAGKCBvvwre2ZWGCpqma9ncjhGh3OpdmRmbTzrRAeqIE1lzbojuYwcTRKVVcFCbzBVr8uH59pppC2OsNr0lpHIVsjAivUVRqwuJ3MWs9L46xGPViBQlzp9VypN5p6TAdGTRBuSbx8gcFVQFYIGrToJ+q4TZflXx5p6T80fvQpKjOgb34Sdlo4iytlblvAye6pYGTbWLuxqgXOSz3lBG/6wbn2TYJQAV9AtzcG9cmHms1WSU6nRsYLBptvAKH+Fx9sugfhc77UUtJ1VPilR7L72RzwkKB5dHlOqzbF1lt+SpKhEvti3rrdyYYBVtCMhpaBOyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+PiC2kk3yiVikF2xCptsn1IdyMN213PicLHu8Rr3GY=;
 b=G2kLM5trXu/IhBqL19FNLSa+G71ikXlKV9Oo3PAEYlNyoXJRrYxWN0algzdkc8OVk7uJOOebclT0glu79Ey+RPmXDVRCTOzUH2X17/khaUTvfD/d89K3j/WuVwA/FhLzsSIRxth1vTvO5QcjPxAOu1gnQcmadJGsKt/bFtqGF6/ez1xegonhNwjkrhCdIbOyDTmXQCNQTnzLgK6eYQNy/FjmBgqouy6D0kKLmw5hJyaGplXeWLqoCl2D/so0jh6AJp0vY//OAL0+1scNTHhP4TCvSiAnpg3PeA+tJfrRsR8tfj/CE3TQGNIsr0fhHSqPfQwkNkS2t0W7TenEKdEGVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by BN9PR11MB5241.namprd11.prod.outlook.com (2603:10b6:408:132::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 03:52:13 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7%2]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 03:52:12 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Jadav, Raag" <raag.jadav@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Wajdeczko, Michal" <michal.wajdeczko@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "Nilawar, Badal" <badal.nilawar@intel.com>
Subject: RE: [PATCHv2] drm/xe: Check for dead config space on reading all 1s
Thread-Topic: [PATCHv2] drm/xe: Check for dead config space on reading all 1s
Thread-Index: AQHc50Adahfj7t4fZU+Jf7gOmxxfV7YVVykAgADxsQA=
Date: Wed, 20 May 2026 03:52:12 +0000
Message-ID: <IA0PR11MB730703D8856CF6930EC729BABA012@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20260512060128.209698-1-arun.r.murthy@intel.com>
 <20260519033104.480503-1-arun.r.murthy@intel.com>
 <agxkkgXMMpLtELLN@black.igk.intel.com>
In-Reply-To: <agxkkgXMMpLtELLN@black.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|BN9PR11MB5241:EE_
x-ms-office365-filtering-correlation-id: 561cc629-a6ae-4b06-b847-08deb6232cce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|11063799006|4143699003|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: m262uyB1elMA/W5l3jK4ro1CX1YefUL0Tt1AhNvhoPu1pnfx9vATyf4GeARIBFUJ9H0inDIKmwNUKyf8w83AqokK2i8moT+vA5xddPhoX5CDfyHFACpbszuHP+kVr+xXBvm/U9e6i1mIsfj0FafaEHqBY61L8MfLxo+WjQz+LBJBoYwriCCuSNErIhMAbqVI1QRtPPFxZUYDPVGia2RD/xHNUFkWM9AL/qhKaBAwPbCCeTAwHkHvCFqzI3rruTJRjGcbg7EYmwtcxYWhiKI1bry/74f7SLZNZJPlSFhAWCuS9zGZSnEY5hG8eEsC4CC+UoSD6VYvB/DDPAaKF3h+ygVlvbGFKScbBHQ/olu949J2CnF15hkQNcsXX2t2C5XedB3am0q3m66mkUALVBUe/DK7XglPy9nEjoE7Pu2TizP7DGWwY+nNS/sIlem1W0TcVMXwrszfDZPWQvYaahhqdBJWrcdHEkdoxnDy6c+VvQqBz2BhP6lVcz2ox8BvjVOy9+3+0P8cum/JZ7+gH3q8EEylpXXRxT0YsKAoFdmm9hNN7JMKdp6BC1fALYFOcaD5qANA4On61Fub6HUe1jUHwqWVH3gGgnnXuxZWD6gVT3ynO1SIEQSboVsDUnucI/Bi7LJmXJy2WH9YnEQELkjW1BWeprVnBdoMe/Onqd+6Mzpa66PBtUlLaJF8hnUqwSVJNEU4upGcl+iNGh5whS+hjQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(11063799006)(4143699003)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0T7PwyeU8FDAGVX32A+1WDJo94q0OW0QtcTP6nYiT2QKP6wR1xjnLyIjyqSl?=
 =?us-ascii?Q?meNf55PSnqm3qmxidfxGmtEW0VaKuOGgOAMWAE94fJEP02k5+e3JXkiIkuXJ?=
 =?us-ascii?Q?jnS521+/+/rXj5qp8m4UeIfjqOyvXwHodv5T95TgRNBbL49jsljdtXdWqMK1?=
 =?us-ascii?Q?K5QvpOOFBSO2lFVB3r57uRQfgYckdvgy8A2YamtxusH+r+XcAGG4EYKY9keZ?=
 =?us-ascii?Q?OQ/NUBdwYBvTWIt47Lxv8PLbn/7Wlat6Z1EtuVENQT6qQGRMqqaZ54uyDE6z?=
 =?us-ascii?Q?y0ZYO7xrZzu5/Kcn1L4dP8A34/oRJCQcaMuEiXQR50aI6BAFRlWFd+Lf6v1t?=
 =?us-ascii?Q?lTWOwaDbHivclM0XoG27NXovaSQht4/2PdJfu3tS+Fkp+lhLnwCzkWGpmsvt?=
 =?us-ascii?Q?2/33x6hbvtQSvZngFcMSxdf1a5e9GXwJUoUoju92pS1TKoxXiDOQAFnSofL0?=
 =?us-ascii?Q?0WQY+nO3qelW1nwn1xsAkeCBJ8B4t+QTCkqf5dM9/mKSxGVv827mRTR7ApKl?=
 =?us-ascii?Q?Z3OPCCqZvnxKgPfw5ODLeuLayX1XSpsEVIgBLuE7viS9r9kF8FHTq6SvBVg2?=
 =?us-ascii?Q?JFY6HEPVoq5QWGkb0FmgoqsxHgTDdlxuKb8A5+NmnpK3xKAJqpFjLQVWytjN?=
 =?us-ascii?Q?PO0zNVxIPbpP7R9U2J94jeU7BTlkCiPhwhj4Ma2LJ0pUiZazlZWef7twHU3v?=
 =?us-ascii?Q?stYjICKiHy8KxhpTU2871vhjCXJSJ7zF83MwzVNe4x4KcZZozyfiVdobZNJl?=
 =?us-ascii?Q?0BB5ooT/j5RdkxaK66lWBh4GY8VXqWMLbbz2LQFavhVKb/RtTVPl6LjLn+9M?=
 =?us-ascii?Q?4Qc1b2rvsGb0wIzFNKCxN8RShN2/vlvdQZHWa22bxIdnyrmxvp+bhgID44hV?=
 =?us-ascii?Q?DsBSHCEZMcgrdQg2njfOJgp8qSWHzfSIL8f1brW1Sg7w/H3j+AmJdVg9izB3?=
 =?us-ascii?Q?B0/PtQVr+pRnT8DQ6xrNOtHVcycgwObDXCerqYn3knjcXYMkpSMhKbE1W9QU?=
 =?us-ascii?Q?Kr3xA58sNke3smyw4OOvNY1i3rrQumfl8rGr81XCp3e80qCklDihsvn/jls2?=
 =?us-ascii?Q?ix+mAwxZuWDlDi+Oh7foCa3yCjiDoczXr393aSZsumHDCM9aLgXmzAzP62DN?=
 =?us-ascii?Q?YfRk5cME1bXiVQgyf9hO5ueA8U+nDAu2CWz5z0YGQ/S8aiC51GXgeoINGrTt?=
 =?us-ascii?Q?cK9s0DrqvKjXnIaw8+FwW+PWYUt0Jc4Qt+I6ypE39XFkAJV4GjL1at8NdQnj?=
 =?us-ascii?Q?zrPwhgHmjsc2Ns+ah0yzXa8C/agMPoyrtcTWQzj1TmgFVi3ZlqDMZfLLq8DQ?=
 =?us-ascii?Q?BwnM9/M/jBthhxzDRyxmZLfhCzi0m4tJoW5WpnFfnrtlERobVryUX/Nv68JL?=
 =?us-ascii?Q?pGDU54+26Wfn4N/7RMDAE8ec4hHqervjfow6DgLVppWK354Ai7L8KhxHD8X5?=
 =?us-ascii?Q?3UbHw3rjU+EsbyUiSqmfw9cGc5zSePynHiSZMrq2CBTUTmtrUahl0o9H5Ocb?=
 =?us-ascii?Q?NJuMuNsJmMn7OM7CphK7oXQkrTnLzgIFN6eFPNg5p8Ym+20R4tn42EqgLmjI?=
 =?us-ascii?Q?AcFX7P0x4N8wshMQcAIHLgKdXk2fIWGv41l0TUtkuWFHgKZJvRZDZMHHSocu?=
 =?us-ascii?Q?75tynLku9ImCtBWPAsbErNyO005wZlBEm30PR9j4NP2d5hDjBgAjQETl6GPD?=
 =?us-ascii?Q?Pn3m3xQdwf6vW+d03Y7JnZAvds0l017xddW5t8PF1xkqN5gTsiKnF7PDQQup?=
 =?us-ascii?Q?x6memh8vSQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: RuHtSvCIgFbumP6ImeixzoyIhsiFxl2Hpdwfu3QnI8/fNw4ySBRwsuq878yhhoGEK1FE/o59Vu/LRb2KMJugYz4Jc9fHFRs1MysjpXfkuSIUFLdtarosP2NQS/bdwYpUiu2KWsad0fobNIk5m2JyeQG165BsZP7kJQ0M+3Wdz+aHFeyuWzI8yWCdMtaAV2ET6W5JwbhBgXvhpY/Gap9GcmwUPHQVR76Vx0E6fTYN9liEqy7qzoSDuzqm0fSMCyfUg+wGOGTV0vw4qN5t6wi9bn+VLCbh49Y9K3oaw81VyJP3Y6tbfTVtuYGQECuYwdzFSvFih2qLu1iPiAL4ofd/6A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 561cc629-a6ae-4b06-b847-08deb6232cce
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2026 03:52:12.3299 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: exAXgwIZg/F3ztQADVDbb7uCdIRdxg8zJ++qIvk17QYHF7Po2k2AIlYTkfyPMG+j+r8Dn1tvzYxY4g7XxUjaNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5241
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
> From: Jadav, Raag <raag.jadav@intel.com>
> Sent: Tuesday, May 19, 2026 6:55 PM
> To: Murthy, Arun R <arun.r.murthy@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Wajdeczko, Michal
> <michal.wajdeczko@intel.com>; Roper, Matthew D
> <matthew.d.roper@intel.com>; Nilawar, Badal <badal.nilawar@intel.com>
> Subject: Re: [PATCHv2] drm/xe: Check for dead config space on reading all=
 1s
>=20
> Cc: Badal
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
>=20
> So shouldn't this also be in PM path?
>=20
There exists one such check in xe_force_wake.c in function __domain_wait. T=
his is check for corrupt space during probe itself.

Thanks and Regards,
Arun R Murthy
-------------------
> Raag
>=20
> > +	 * fell off the bus, MMIO reads return all-ones. Detect that here
> > +	 * before any other subsystem (SR-IOV, GuC, pcode...) consumes a
> > +	 * bogus 0xFFFFFFFF.
> > +	 */
> > +	sanity =3D readl(xe->mmio.regs);
> > +	if (sanity =3D=3D U32_MAX && !pci_device_is_present(pdev)) {
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
