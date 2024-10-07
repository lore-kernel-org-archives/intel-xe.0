Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC1ACFB449
	for <intel-xe@archiver.kernel.org>; Mon,  7 Oct 2024 16:28:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E75C10E3D4;
	Mon,  7 Oct 2024 16:28:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C1mBUduM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A2BC10E3D4
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Oct 2024 16:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728318486; x=1759854486;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ANa6zwFPZMJLJ0RtqoBvOZi98hhgaDqV7undp9I1r8o=;
 b=C1mBUduMvp8044nZDBtkM4kLBJ/2HO90TcYUeTtMdjuTrfaVbuh0WTNW
 +EwW5sdfE9G+CkE6GM7I4v64aOi82FS7SFiTeZQa7IoLy0JooLx1+krFt
 hbPm+wrIcGUhqx7ldRiRZyE1jEBFfiyiHu06ddmC5PmuOtl3abG5Tq0G0
 ihC2La7cZHiWdDkqHxsMw9L4ctqV1Zi/Sitm1VRrfI/vHCe59klQj0r0d
 a9/fSgGoC3Ocy5L/DkIx16qWVO4Wnq88OeFq9VjFqFqTrlnVAA3xrdOSz
 7y5XWrQNXgXhY26SDMzsiqwwv+oAd/nN35Bq1pRze71XGlOTcszCxlGEK Q==;
X-CSE-ConnectionGUID: Q5Z6hMakTuerciQjyLdYaQ==
X-CSE-MsgGUID: edOom+QDSTyGYjcY7Hfaxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="38605876"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="38605876"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 09:28:06 -0700
X-CSE-ConnectionGUID: CqWCgbg7S8CKwTeW84tshw==
X-CSE-MsgGUID: S5XvXyUETYW2tWL2osTlJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="75484993"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Oct 2024 09:28:06 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 09:28:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 09:28:05 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 7 Oct 2024 09:28:05 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 7 Oct 2024 09:28:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RF7RutdpvpvDeTDjGR+lGwXz1DZwlnXP19qCi5KhvfogjlS+n91S/w++EA1QC0+AA6H4OqwkxDQBhyl/maRyOMd0LjPpDG1qTRb5TaByuw9UeodQR12T89z8BkFhn6kbupr+dHKlo3VqR3eq9vj32HRvMprFOpQ/L/9CnKmph3XYQ6TLKHgEnd3rBexFJoakTPGwK5xsgl2gEhWrvi91aRG7psgjElYbeYNcja4zSruICZJovzq2IeSYMmEugLWqTGZpI+LzP9nOr9jPOdcjPTPfyw0hzeQ1MgNrZBhFUBk9USc6DgmoxSUB0GNAuiNqfeowRlQsbofbNyLsVnIwqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KiDLy/ahUsa09DxcRm3mxyvEM1PR5lETcmiPLxslHhc=;
 b=t44PHKj4Vrm5DC8+FwupIZ6St125u2urgNwcyrdkhI1vIs8pupOFgSLn64bg9C4kWWIx6vR11ltwz0r5QmoPrW/pGktTZE8CS+P2cY7ZibajB8CfndpsZx0MoXFGRG3mjOS3IqWQmFhnMUppt7V6rA92kPTYuoR3jCI7xdH4GvWdl5Jl6EJE54MNUOJf2s3neFV6AreOARkh7x9Kt/qqsv84toXiBU/B7yrWFuiaOqjzHBaC+ucnejH7N0bZNsZWMxpdd3RiFlZMIe8Mcwq3sHehqnDMqtSpj0tCPmqe9CR7FtnSLRh+5dnx8nDPHAkK5KMqBQr7AyD5EBVC/UJvmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5445.namprd11.prod.outlook.com (2603:10b6:208:30b::7)
 by PH0PR11MB4870.namprd11.prod.outlook.com (2603:10b6:510:34::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Mon, 7 Oct
 2024 16:28:01 +0000
Received: from BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::b1a1:c6a6:403:8161]) by BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::b1a1:c6a6:403:8161%7]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 16:28:01 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Chauhan,
 Shekhar" <shekhar.chauhan@intel.com>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Atwood, Matthew S"
 <matthew.s.atwood@intel.com>, "Sousa, Gustavo" <gustavo.sousa@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v2] drm/xe/ptl: L3bank mask is not available on the media
 GT
Thread-Topic: [PATCH v2] drm/xe/ptl: L3bank mask is not available on the media
 GT
Thread-Index: AQHbGM97jvNzvFrsT0GJ2VhEqlXk+7J7eSMg
Date: Mon, 7 Oct 2024 16:28:01 +0000
Message-ID: <BL1PR11MB5445B96208AA2B83BAEC46EEE57D2@BL1PR11MB5445.namprd11.prod.outlook.com>
References: <20241007154143.2021124-2-matthew.d.roper@intel.com>
In-Reply-To: <20241007154143.2021124-2-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5445:EE_|PH0PR11MB4870:EE_
x-ms-office365-filtering-correlation-id: 34e0c7d3-5dcf-4dae-3f34-08dce6ed0319
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?qjJW5VWpzKX98yXPVEh65JTbKYWVULxhpZAmw/0yoNeij8l2hUY6+0sjDLas?=
 =?us-ascii?Q?Kop+3EoAZOHggepGVuclP6kFHrsjpgtI9ltLQgVE8nZkrVzNoSedmCBFBq2V?=
 =?us-ascii?Q?rXAMtwGEWvqpu8EOzMhwPBIH3CUEZ8a0KnOak2BIbho+NJvp326RFxoL1Q5o?=
 =?us-ascii?Q?7X0x9UKhNLM/dtZhRsKyReZdrJOwWTeSO2Zuzc3kxE3CUBeexxV8cDGH4xQR?=
 =?us-ascii?Q?kuHqnEBMuesGgtGho2le6Q1a/gyhGE7YoAnT0fcLy7bXWNX97mGuwDaT1M3r?=
 =?us-ascii?Q?BPYFDuETaf79kBFWRL8n9zU4UwODqitkzD2DH6c01SVWPXW+YuGYUBOlTG1+?=
 =?us-ascii?Q?/crvfdjNoz0vVUySkVOv739sl4cWxbNBFoq22h4cl/RZ2JOM17aPbQflAbMd?=
 =?us-ascii?Q?eGX+iHL8k3jFND0sqlwP3QmZqMFSvqc9JnAGD/ObfKEl13t1STCVPpYqAK80?=
 =?us-ascii?Q?SJA/7PEbZVjX9wlKHdXHqoIVYMyLFrTjJaZ7nYaTPdoyHPXFwso73XodXtPn?=
 =?us-ascii?Q?mIjBXE5g1mbPh2s6n0gXGFHBzoRej9z62K1SiHITMVqOtdiNLhOVfUdRi7IY?=
 =?us-ascii?Q?55buTsjTAT/nbP/fOtEXf8zQENqvHVf5UxyjkrqUriOAiwtJbeVFkaF42J3Q?=
 =?us-ascii?Q?Nrha5BdB5VDUbOZR/IHSaCKi9kZEAA9tLYe/g0vwyHfiWaTZaWkZcr6WbwIM?=
 =?us-ascii?Q?tEovcm9hnKbS4mwZh1slJbnSIVWqOvu1KFyv8pXMfTKtxCntakUneTUKja/q?=
 =?us-ascii?Q?WkdTE97FvhHXZSrui5lzPTi8lys08narjs7kffco0sSEjmMVtA+b7C5y+6st?=
 =?us-ascii?Q?KRTaDvSyybRgVO7aoxhtMMxvUifwKafEXxF7vYfksK0xb8zUrVPcw0DdHcU5?=
 =?us-ascii?Q?bnyopOp9yHUiC2zcG+cix4Htiy0u/6XNxlLd1cLpPHhQM1KNxfkqGMgyyNTZ?=
 =?us-ascii?Q?o81SdpwhBKBk+6ZxWrGn3Tfky0IrQgZvHXFGs8pSiWGiy8iqY24TwLGb8nJd?=
 =?us-ascii?Q?P8m9Enpv8nAXNI6DSzMh6lBp3iw3kEPUa0TXnkyfi9frjIH/hhIMEkJwH4s2?=
 =?us-ascii?Q?1qmNYaJoAvdKCJYtbiYi0eZh48U1qyVMHXFy+Chpfju24hv4khspgFBfFbzS?=
 =?us-ascii?Q?o3UUEEd74wBbeRykmNptfhWUPoG1zusDY9S6rEAkCDu/2XQQQLece/0vaYTO?=
 =?us-ascii?Q?UbvlE7aEe6hbcQB1FK/RIlOh9zYP7GyqVfm9w1mImFFpziMOc2sWsuEpo37m?=
 =?us-ascii?Q?6YEaK/9e+bbyEK/YoJpkMC0H7cm3eVRnSNEaONIQzDfbS6J0/t2emSVT/oWa?=
 =?us-ascii?Q?dfC4QTy2e013Tz4Ndvb1VnPDPI0k6bEqW/5dUgHsxov3iQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5445.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JHP3RvOwci287SYyaVUavH8LFZ/MixfRECLD4UOLERXp1w5lOCDmBO1VWaU7?=
 =?us-ascii?Q?heDW2vqYvJJ/lv8wClckraocD8+YAzG8HbiSi9U1BmhrGZBWFby2ycTEyLQa?=
 =?us-ascii?Q?GzGsHp8nLRBWH4zbOxsPkOyCgVbmOFq7MTTZtk2/NP32/xQdE+kZ69hPhiCU?=
 =?us-ascii?Q?jE22HMGC/K63VZTH0WpGJRM9XVTvb9WgGcI0MvktpH6AUxTLtpe6Hu0GG/0+?=
 =?us-ascii?Q?lGgP9WXCvLw1CqjDTqwHRDL4iZIpt5G4QrGWiamHJeWUoFEMGdK7JIXrZN/l?=
 =?us-ascii?Q?IsN1ljPkOO0+wNtRIdutCcVwjZ5yomXVSSo17072KvXDyRywLXbGD8IuaFP2?=
 =?us-ascii?Q?sCU51Oc+yNwRsFD77pK5tE/VUmMxHs+XYJ3oxQYmX5XYKgbylUf1U4gdbYzP?=
 =?us-ascii?Q?V0evCyPy14YwPH+d71hfNFqnMLNU421CX0T8Ds7sAcJ98gE9oRyCl/TU123z?=
 =?us-ascii?Q?315VGIGDbky4dnDZU5BH9A5G8xnrdD8VcJl5OC+qPr/H3DACnkasa4+ZsxC8?=
 =?us-ascii?Q?ddykgymviYrCjuk2+fYBpjXgZ5CLEtiI6sRnRiHRE4hVmAuYOS/AXXoHmy1j?=
 =?us-ascii?Q?LSGwQKw4em/wsg996A7lecUPT5dX+ke0IpyKaPRzT68jXANIvxjuo8NpjdNG?=
 =?us-ascii?Q?Lrq/oHEoDXTfiuBlrRxZdKcDhmHO8s4h8PlSw107XAy9UXsodx8LO5YcaEBN?=
 =?us-ascii?Q?1VLsGJuQMIJbYQ5zWOrOxf3ilpcb/KAyVpfIN/ePhhCywfzxGcoFQVqF8tMr?=
 =?us-ascii?Q?KLB6zW/S+B6O+MoxDXTkeRHhKmK3/ZxLnH9ZZvBJXgFC2QXpwSCeJ89lrCKC?=
 =?us-ascii?Q?BJkAGJ6Fum37bAP19s8HPyqyI1meUDsKTcI3UPDH/SRwW7AQrsggdywrnJHg?=
 =?us-ascii?Q?qsAp2YEXU7zX6ZRlyeNubDFW4Rr7aj15UHipLlDWdrKNISZM+hrHkFwMXkV3?=
 =?us-ascii?Q?v+2SWs+iRH5j1WtuQQQjCpihgtkGBcD6iXP5aLOEAuV73gE7gnQ9lsEQdOvr?=
 =?us-ascii?Q?yVqI8InbaULr0BODEhrf2gWZkjjv6sdm4rn6fkVDes/YjJorOKqTJ19QkZwB?=
 =?us-ascii?Q?busSP45a/wqayWfX5zQ2Q/8p3g81wTqUt5P02XRL+CGMlgpFASe5SUEmGVHI?=
 =?us-ascii?Q?rX070GupEiYaXkjPWMxFoISZuOG8zVjpYYXFxBMPuOB/i4kk/kGAmWPiuHfh?=
 =?us-ascii?Q?EY92GfjetP5ygo+YZS9FKyw9GI8azFI8GWC/tXDbCZOD+gRB2yV8Kr+HHsGP?=
 =?us-ascii?Q?/cYKAG4Y3lHrroYd3z4R4AbTpl8wiGj/kWTlYjITC/VBaWy352bP+km7R7PA?=
 =?us-ascii?Q?Ge59k86392OR//WmU6Cf8S3TWJoXIbBs+U0tJ8PVy9E340x/Lw4Qa53F7FhY?=
 =?us-ascii?Q?JZSJV4dmQxR3ZShaHjZThzSvED/2ZJr8m8CSNG1ViVeSDALtekSypqXV38mu?=
 =?us-ascii?Q?0ygkOh3hvLJc1gdVqVQFgUS25FmtXIYZysRcmr4ExqZhJ1epxKjjfsGuYIgA?=
 =?us-ascii?Q?RFuPEzZd902WbQ09Ggw/W+RDtKYX6jB3s60bHHuuSK1IYZLLD22DuwrdUKnW?=
 =?us-ascii?Q?MPaa+fMY0GZnmbxsJjGaBZ/EK3kGa/j6+qzMqpxl?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5445.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34e0c7d3-5dcf-4dae-3f34-08dce6ed0319
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2024 16:28:01.3351 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uB+hFNWKSj9QsTSUxDlSJSH/Dnjan97qaSqOTDFQSgZG21adPwfxpNQji6Ok798Kol2PrUnamU7fZuNx1dPBWAczqEQ7j3n7aXlOoNBVetI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4870
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matt R=
oper
Sent: Monday, October 7, 2024 8:42 AM
To: intel-xe@lists.freedesktop.org
Cc: Roper, Matthew D <matthew.d.roper@intel.com>; Chauhan, Shekhar <shekhar=
.chauhan@intel.com>; Atwood, Matthew S <matthew.s.atwood@intel.com>; Sousa,=
 Gustavo <gustavo.sousa@intel.com>
Subject: [PATCH v2] drm/xe/ptl: L3bank mask is not available on the media G=
T
>=20
> From: Shekhar Chauhan <shekhar.chauhan@intel.com>
>=20
> On PTL platforms with media version 30.00, the fuse registers for
> reporting L3 bank availability to the GT just read out as ~0 and do not
> provide proper values.  Xe does not use the L3 bank mask for anything
> internally; it only passes the mask through to userspace via the GT
> topology query.
>=20
> Since we don't have any way to get the real L3 bank mask, we don't want
> to pass garbage to userspace.  Passing a zeroed mask or a copy of the
> primary GT's L3 bank mask would also be inaccurate and likely to cause
> confusion for userspace.  The best approach is to simply not include L3
> in the list of masks returned by the topology query in cases where we
> aren't able to provide a meaningful value.  This won't change the
> behavior for any existing platforms (where we can always obtain L3 masks
> successfully for all GTs), it will only prevent us from mis-reporting
> bad information on upcoming platform(s).
>=20
> There's a good chance this will become a formal workaround in the
> future, but for now we don't have a lineage number so "no_media_l3" is
> used in place of a lineage as the OOB workaround descriptor.
>=20
> v2:
>  - Re-calculate query size to properly match data returned. (Gustavo)
>  - Update kerneldoc to clarify that the L3bank mask may not be included
>    in the query results if the hardware doesn't make it available.
>    (Gustavo)
>=20
> Cc: Matt Atwood <matthew.s.atwood@intel.com>
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> Co-developed-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_gt_topology.c | 14 ++++++++++
>  drivers/gpu/drm/xe/xe_query.c       | 42 +++++++++++++++++++++--------
>  drivers/gpu/drm/xe/xe_wa_oob.rules  |  1 +
>  include/uapi/drm/xe_drm.h           |  4 ++-
>  4 files changed, 49 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_=
gt_topology.c
> index 651ba53623e5..df2042db7ee6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -5,6 +5,7 @@
> =20
>  #include "xe_gt_topology.h"
> =20
> +#include <generated/xe_wa_oob.h>
>  #include <linux/bitmap.h>
>  #include <linux/compiler.h>
> =20
> @@ -12,6 +13,7 @@
>  #include "xe_assert.h"
>  #include "xe_gt.h"
>  #include "xe_mmio.h"
> +#include "xe_wa.h"
> =20
>  static void
>  load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
> @@ -129,6 +131,18 @@ load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_=
t l3_bank_mask)
>  	struct xe_device *xe =3D gt_to_xe(gt);
>  	u32 fuse3 =3D xe_mmio_read32(&gt->mmio, MIRROR_FUSE3);
> =20
> +	/*
> +	 * PTL platforms with media version 30.00 do not provide proper values
> +	 * for the media GT's L3 bank registers.  Skip the readout since we
> +	 * don't have any way to obtain real values.
> +	 *
> +	 * This may get re-described as an official workaround in the future,
> +	 * but there's no tracking number assigned yet so we use a custom
> +	 * OOB workaround descriptor.
> +	 */
> +	if (XE_WA(gt, no_media_l3))
> +		return;
> +
>  	if (GRAPHICS_VER(xe) >=3D 20) {
>  		xe_l3_bank_mask_t per_node =3D {};
>  		u32 meml3_en =3D REG_FIELD_GET(XE2_NODE_ENABLE_MASK, fuse3);
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.=
c
> index 5246a4a2740e..158629971eab 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -9,6 +9,7 @@
>  #include <linux/sched/clock.h>
> =20
>  #include <drm/ttm/ttm_placement.h>
> +#include <generated/xe_wa_oob.h>
>  #include <uapi/drm/xe_drm.h>
> =20
>  #include "regs/xe_engine_regs.h"
> @@ -23,6 +24,7 @@
>  #include "xe_macros.h"
>  #include "xe_mmio.h"
>  #include "xe_ttm_vram_mgr.h"
> +#include "xe_wa.h"
> =20
>  static const u16 xe_to_user_engine_class[] =3D {
>  	[XE_ENGINE_CLASS_RENDER] =3D DRM_XE_ENGINE_CLASS_RENDER,
> @@ -455,12 +457,23 @@ static int query_hwconfig(struct xe_device *xe,
> =20
>  static size_t calc_topo_query_size(struct xe_device *xe)
>  {
> -	return xe->info.gt_count *
> -		(4 * sizeof(struct drm_xe_query_topology_mask) +
> -		 sizeof_field(struct xe_gt, fuse_topo.g_dss_mask) +
> -		 sizeof_field(struct xe_gt, fuse_topo.c_dss_mask) +
> -		 sizeof_field(struct xe_gt, fuse_topo.l3_bank_mask) +
> -		 sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss));
> +	struct xe_gt *gt;
> +	size_t query_size =3D 0;
> +	int id;
> +
> +	for_each_gt(gt, xe, id) {
> +		query_size +=3D 3 * sizeof(struct drm_xe_query_topology_mask) +
> +			sizeof_field(struct xe_gt, fuse_topo.g_dss_mask) +
> +			sizeof_field(struct xe_gt, fuse_topo.c_dss_mask) +
> +			sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss);
> +
> +		/* L3bank mask may not be available for some GTs */
> +		if (!XE_WA(gt, no_media_l3))
> +			query_size +=3D sizeof(struct drm_xe_query_topology_mask) +
> +				sizeof_field(struct xe_gt, fuse_topo.l3_bank_mask);
> +	}
> +
> +	return query_size;
>  }
> =20
>  static int copy_mask(void __user **ptr,
> @@ -513,11 +526,18 @@ static int query_gt_topology(struct xe_device *xe,
>  		if (err)
>  			return err;
> =20
> -		topo.type =3D DRM_XE_TOPO_L3_BANK;
> -		err =3D copy_mask(&query_ptr, &topo, gt->fuse_topo.l3_bank_mask,
> -				sizeof(gt->fuse_topo.l3_bank_mask));
> -		if (err)
> -			return err;
> +		/*
> +		 * If the kernel doesn't have a way to obtain a correct L3bank
> +		 * mask, then it's better to omit L3 from the query rather than
> +		 * reporting bogus or zeroed information to userspace.
> +		 */
> +		if (!XE_WA(gt, no_media_l3)) {
> +			topo.type =3D DRM_XE_TOPO_L3_BANK;
> +			err =3D copy_mask(&query_ptr, &topo, gt->fuse_topo.l3_bank_mask,
> +					sizeof(gt->fuse_topo.l3_bank_mask));
> +			if (err)
> +				return err;
> +		}
> =20
>  		topo.type =3D gt->fuse_topo.eu_type =3D=3D XE_GT_EU_TYPE_SIMD16 ?
>  			DRM_XE_TOPO_SIMD16_EU_PER_DSS :
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_w=
a_oob.rules
> index 920ca5060146..0154fbe154e9 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -37,3 +37,4 @@
>  16023588340	GRAPHICS_VERSION(2001)
>  14019789679	GRAPHICS_VERSION(1255)
>  		GRAPHICS_VERSION_RANGE(1270, 2004)
> +no_media_l3	MEDIA_VERSION(3000)
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index b6fbe4988f2e..c4182e95a619 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -512,7 +512,9 @@ struct drm_xe_query_gt_list {
>   *    containing the following in mask:
>   *    ``DSS_COMPUTE    ff ff ff ff 00 00 00 00``
>   *    means 32 DSS are available for compute.
> - *  - %DRM_XE_TOPO_L3_BANK - To query the mask of enabled L3 banks
> + *  - %DRM_XE_TOPO_L3_BANK - To query the mask of enabled L3 banks.  Thi=
s type
> + *    may be omitted if the driver is unable to query the mask from the
> + *    hardware.
>   *  - %DRM_XE_TOPO_EU_PER_DSS - To query the mask of Execution Units (EU=
)
>   *    available per Dual Sub Slices (DSS). For example a query response
>   *    containing the following in mask:
> --=20
> 2.46.2
>=20
>=20
