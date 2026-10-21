Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD989606A319
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 05:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=by3GG+6V
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97C2D10E02A;
	Wed, 21 Oct 2026 05:09:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EBAE10E02A;
 Wed, 21 Oct 2026 05:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792559360; x=1824095360;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gM93FnnroosOB2hn3ReLVSsHKEZLUFoD7R3VEFjg3M0=;
 b=by3GG+6Vvcqmva4h7LXRyzgiLPClqYa81YfjoyduVQv/Ty7I/OU3FINq
 qzUsjz+izn9PAw3zL5tNfmRJKop4jfT2uF7u3RTybAmq8wiQv1RyxYHGB
 NP4y7JQR9sn8kbjRwHtHS98P8kX/oB57/X0qL0Jbew1XOMiVWhuueP/Fr
 dr5Ib9XJCN+Q47WGf4VluzA4UZjxqWkViXxH60fg9dwFIEwY73HkE4FrO
 h1zFC1fwD7FZ0BefKw4rGFmuHoDNcGlNFGD2X/FgqaVr3ja6VlralG/0v
 86UvjjDlpVLLd5U6nPjnFo9ckax2ITfvMMtUfrK5vxBloI/EMCJCE0U4R w==;
X-CSE-ConnectionGUID: qJleU1xLQCWrvWKGrhF/+w==
X-CSE-MsgGUID: X32uprwZT3OCGiWxlPYB/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1154171"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1154171"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 22:09:19 -0700
X-CSE-ConnectionGUID: jShc0YO0Q92QoscH1F6nrw==
X-CSE-MsgGUID: FRJ1dy7dSBqNr62ppV9IBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="2996705"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 22:09:19 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 22:09:18 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 20 Oct 2026 22:09:18 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.33) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 22:09:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MHo+7kLCjJi8apXOgkdQDcAvwEHQbjnRkPzRS5CN7EbngZt57IymkEF6BDknPcNuTGEttz56CN1yyhqWHhI9E4ayrGE7IGBZW6yMxc8XmTWnPPkloXr6jD8r5jDOsKm4dTzEmdeJzf699/OW2SYynK8YnD3WuAvFNhFGACW8GOa1DKsYt1Gd/1rT0iJsi1nrnW7LSKGe5nH9eAY8uxed00wbnh9kVBIKxFS65s8qB71jFfFaCr7U9iDlEPga/5WyPvfY8MzYdcTHN93uGH4ZPl1mnXgIApICKHR7t+nRan4RNXpGQk9K0ZKNAyPUyYpZGdlwK6+xHIBxkxmso5EB9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7cPYyW4ZAO/HUuv1WO8tI5DYCtZwwRetLO6dUE9psAg=;
 b=QvK7fCM52+4Q3VZe/4vlwq2buRCPoB/QgZuKy1C98PuHg+XIC0HB1qDA7xRg1PJZzg/zVrhUvEqTCYauZl7hAvMK+zGuoG9fwZ4fuHRrdJ9juLxGRULejfOwy+gN4JgPonQvE9FY6imiboifU3NNRNjqO/cPdDvN7RlZDe1/+jfNXC6qD79yXZdocW6rBEZRn+bqlzdpY7OWig5fNlV7hoKoZBFaKHJB2rziG9HHqZLo2snUiNO2mlBTZ6WHUHdsompNjMnKDFVQrpSCVk7rQa7JYiCJlyojYtmeJ2jKUzEAMNRTqn4g+19CFXGS1dshZT5Gahgu7ebtz1Ls9NUn9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Wed, 21 Oct
 2026 05:09:10 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff%8]) with mapi id 15.21.0522.012; Wed, 21 Oct 2026
 05:09:10 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>
Subject: RE: [PATCH v4 03/10] drm/i915/dp_mst: Limit M/N ratio for MST
Thread-Topic: [PATCH v4 03/10] drm/i915/dp_mst: Limit M/N ratio for MST
Thread-Index: AQHdRmJ8mY+S5reF1kSEMNM7vWLURbb/CI8AgAieuIA=
Date: Wed, 21 Oct 2026 05:09:10 +0000
Message-ID: <DS4PPFE901A304F44A3DDE4BCCEDD9ED758E3662@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260917050649.871960-1-suraj.kandpal@intel.com>
 <20260917050649.871960-4-suraj.kandpal@intel.com>
 <BYAPR11MB37839CAA76DDB9487E2B50BDB29C2@BYAPR11MB3783.namprd11.prod.outlook.com>
In-Reply-To: <BYAPR11MB37839CAA76DDB9487E2B50BDB29C2@BYAPR11MB3783.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|IA1PR11MB8200:EE_
x-ms-office365-filtering-correlation-id: b49e66bf-4c2f-47bb-c01d-08df2f3170cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|10070799003|376014|38070700021|4143699003|11063799006|56012099006|10067099003|261009223027099003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info: taKC5yxiqmtJHM+FoEGjnzNC/6zCszSa3D09sUVP0oKPqB2XGXAsi84xgQw1TmoPvH0fxgba91bFlGFMpPvXnsUXOf7EXgIZxsdykcDWW43/YeSPr6j+b40JSSHLGDAqEtalk6k0CoEEUHz2YA6QEkFW1pyLhD/QAJtUdIZWO+ukUdAFnp/zrwZh0FH50HPFdGiVHEA/O8kC5QhSXzkVCTMpRvLsTaiMIQDfEXlPonasV2qQeobvzzJ/g7q+DjGSb2g3g8ZjYwmj7TbxtJFAdKjQioBvPOOArI3ijg1tAbtRxcAyHkPa/91X878DRQhiFqFA9Xbwhiq3rnfnVhgz/Ts9wTZoLdFAY9BhbvJVgdjj4R5yPSB280IEjnGfF5cSu9gewlWEKsgHj+d1lf+cVX54xtwjJd+lcs0aI60KaoxCl66msZOrFJv/c2so6LXNmLqa2UkmdzfjTlL+Bq8XsPe/ihKp7MHmMiTzVjOSnWTXmbl3U2nS+TohYL2mE/3HIXDldWiyQ9bE/5kl4zQQ0d9JWeOOaVIU0JUPHCG5m3D9e94hsfbo0AAY4OTpO/4g0sAAPyBQ9G4U1YGRUWWQqDeoeWFfa/xzJ0CGPpzGz2Pl0YTo1IaVyh5fpvO+ovvfka95LzbecwyTb0x7L89zcWMmgmwZ5+XaSdIoWlIXC97WN3z5CAXnSAoAxrMofZcrF4TiPjmT8OhgMxUv30AMZK7b9lLT/4OTYkinl5M4IeE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(10070799003)(376014)(38070700021)(4143699003)(11063799006)(56012099006)(10067099003)(261009223027099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QGNvLUKDXsgHmqCDroT99ZPRpvlVuWOIz3ERD+TcEqfwlN35S6hrajfuRT27?=
 =?us-ascii?Q?FbdzQ8bZMdzS9KPjcjVE9eGerKY9oisBhswx0dpLSLzmN+jgE7Dg8wM1hW+Z?=
 =?us-ascii?Q?igCZON1liUdv/D7EEZUXxc9znpkoHKz45tf7Zz9DGc9lS5vAXJqAGAv84k0D?=
 =?us-ascii?Q?aglNyAOnRsfKnCog9ogjMK3ql9Uf1MbDQZUVog1j2IG0Z7RSHSNchQ6pdJsi?=
 =?us-ascii?Q?omCognubTNGIiahRsOprjc/qxCtfVYdrEmxIQVIKVDNBCsnxCIDIzMTrWLv/?=
 =?us-ascii?Q?nBMZrytuanQrnrywxxv2Q3DGGg1N7XSHF/0Vih329cIva4dXKADW2nUcA/gi?=
 =?us-ascii?Q?C+XxexC40f4mYKkbotjNoW0LY/F7GcCB6Vjn8rwoWRsBfIU12SO+/iAmElIT?=
 =?us-ascii?Q?MPLKRjHTMkf9C84wze65HSgXm7IK8NFV6LteZ8Tt6HdfIq1fZDGgOAh3TqrS?=
 =?us-ascii?Q?CMQWTf83F9oOy9dMdQK/hTZLYwmg2bGr087y8Gqonrrx4h2UFV8WE/+zWDam?=
 =?us-ascii?Q?4QXZLGDDdHYJmWJ4ApOsQNRLlFN61rDvwJ84wrf8x0AYWKqlZ5HItDn2aoQK?=
 =?us-ascii?Q?pgOUAX8CREfReqLvXXuPinoQiEnH1CY0yZOwadXPGoRmg+QskIBWug2NBeyC?=
 =?us-ascii?Q?lR05EaHCN/z0YnGcddq0/zrgEjyhJ3UfoQa5Q284X7DmvpN9hU8sOIWvYkLH?=
 =?us-ascii?Q?C0u7AB77eEr3c3sRpmHLvN+G21WewVCn6mIC4Dr+TJPvMEVoQM9w0/iQnFz3?=
 =?us-ascii?Q?Mx6lzbqjbmQpkUHj6QW2kgZ6P86WhpmqBCwedWNWQ2yD1Tc41Ts6pgMDdnhN?=
 =?us-ascii?Q?Ac5zxnxyi6UH3NW8L1peBXPQ+f+ik7YfB+40u9s2Gv4ElAUdkrmEIcMh9YHY?=
 =?us-ascii?Q?2E9kBW/eEzGK9iRyJkfhkVjDDNLPfe6QXTor1rr+HAtlYvxy3ebkUpuFSNx8?=
 =?us-ascii?Q?mrxSx1iJm7zrgxDdX16pqT2iOI3Zi+6SU2mKTpKayPfsW51k0JTDCmY+GG4N?=
 =?us-ascii?Q?ZyN4YoexmOkA14Nmm+phnHKUgm5ISGKi6APg1FXixW2z27PirQ8AgoiXzOUk?=
 =?us-ascii?Q?up/pmrLHTIb2SkyhtIYdZ1KhCMnMFMtDwdvEHDOdN8qpdpV08jaq5yhVkeuI?=
 =?us-ascii?Q?dx9RpDrwdSWyliZh/g7+kAfmulTfbi0PDp0WPBFjgOj/+nkxlDo6Vkus9Nop?=
 =?us-ascii?Q?qINwmFukXTkQK+8t7kjqrbZzt4xbtaFxPcEUr/WOP2Vxfsq8UONQcYmU9wUt?=
 =?us-ascii?Q?MZPfLFg0uR7WrACSKhvSW7gVT12dRPK2XNMRa2PFISZbdq1xPjPOAiQUzOkd?=
 =?us-ascii?Q?70MCtv6wSZrHhyzCbtG16843HSrPj3n8OzYytgpKcW97xpMauXMYdLYI3Suy?=
 =?us-ascii?Q?KyXr6tvs/6MPW3RoGI4lNJVI++2VRjeF+sM5b693sfHmB54FY0uSUs0A3UOU?=
 =?us-ascii?Q?1dQowKtOx1SfZkUwzZ1NyAYVW/wDExe94mAqrwn6SRwi+TmyivNLxYxGQHRo?=
 =?us-ascii?Q?U9GlPgcEY/TGPop8owfU/Wa+xnv2Am1B0jEeT8DCzuu5r6mCV9F+DGSxt1e0?=
 =?us-ascii?Q?aer3IAOCKcO2qhOrmyXAP762kvUxTDqhkJjSgEVLyBQ2cttaDvXSQXeNzHTM?=
 =?us-ascii?Q?YOp2/7GQ+NhLvi//UNdSEpgJrvyXJa1y7VQzaa2CJ1X50av64J3h+t7Rm8S8?=
 =?us-ascii?Q?vH2CvDEiKcYJj6lUE2MzD+xEiO8AqxiZ7QdDgs+uuRmjr6cCe+Xz3J4TaPAk?=
 =?us-ascii?Q?pJgsNvMZ9UYPf5W806dIx3LfrhpvZYBBAdNPS75iykxNilnSoiH09KcR5BdP?=
x-ms-exchange-antispam-messagedata-1: jbKVhAU/E5lRTQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: nbiGF/gTts17nntmC8D9oWosaydvCbjMhco+MIa6++zku/y+xZGfQWQSynz3zVtsT+ppJ+4kuQzaMKi8mFS2FmSGxb/U7wd1io9TqRGUl3B2OEH8CasqbLgvL34gQlMYPKgbtdJU83dWo9rTcAOahPvWUyNoRU7XHvclAiiri7U+p+N5eBJGkZQiP0IbQolgSG2T7yzHj/2RHYjioskJKIzyAyBBatMuroon/6veYe+nix6RCTZCGACIMJV+D9nqIDL7ZCTkwqT54mNn88zueP11Ls8iHOr0bbhIggZrNvovPnqvqVnj9ORdE4GFY1Hv4NSnt/QB0rUobhoAoe12lA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b49e66bf-4c2f-47bb-c01d-08df2f3170cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2026 05:09:10.2184 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BtjTX1hv83WC2irNnOyrrA+9qBrSXQRs4z03DA8gmZwAejyghh3C5lNjblYAoCEHhFH6Bx4va8g7PtPRTmU2qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8200
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Golani, Mitulkumar Ajitkumar
> <mitulkumar.ajitkumar.golani@intel.com>
> Sent: 15 October 2026 22:59
> To: Kandpal, Suraj <suraj.kandpal@intel.com>; intel-xe@lists.freedesktop.=
org;
> intel-gfx@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> Subject: RE: [PATCH v4 03/10] drm/i915/dp_mst: Limit M/N ratio for MST
>=20
>=20
>=20
> > -----Original Message-----
> > From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of
> > Suraj Kandpal
> > Sent: 17 September 2026 10:37
> > To: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> > Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Murthy, Arun R
> > <arun.r.murthy@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> > Subject: [PATCH v4 03/10] drm/i915/dp_mst: Limit M/N ratio for MST
> >
> > From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> >
> > The hardware does not support DisplayPort configurations where the
> > ceiling of the Link M/Link N ratio exceeds the limit. Enforce this
> > constraint for MST as well.
> >
> > The compute config path needs no change: MST goes through
> > intel_dp_compute_config_limits() too, so the link config filter set up
> > there already excludes the configurations violating the ratio limit,
> > and MST fails there if none is left.
> >
> > What is still missing is pruning such modes, so add the check to
> > mst_connector_mode_valid_ctx(), reusing the helper the SST mode_valid
> > uses. It walks the link configurations and only rejects the mode if
> > none of them can satisfy the ratio, rather than evaluating it at a sing=
le link
> rate.
> >
> > v2:
> > -Drop the checks in the MST link config helpers, redundant now that
> > the constraint is applied while computing the link config limits.
> > (Imre) -Share the mode_valid helper with SST instead of evaluating the
> > ratio at one link rate, since the link symbol clock is not monotonic
> > in the link rate and there is no single best case configuration.
> > v3:
> > -Now that intel_dp_mode_valid_m_n checks for all configs just call
> > that
> > (Sashiko)
> >
> > Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_dp_mst.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > index 0c362784afe4..823fe99ca0a1 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > @@ -1565,6 +1565,11 @@ mst_connector_mode_valid_ctx(struct
> > drm_connector *_connector,
> >  					   min_link_bpp_x16,
> >  					   bw_overhead_flags);
> >
> > +	if (!intel_dp_mode_valid_m_n(intel_dp, mode->clock)) {
> > +		*status =3D MODE_CLOCK_HIGH;
> > +		return 0;
> > +	}
>=20
> Since MST appears to use only the max_bw_config for link configuration,
> should the M/N ratio check in mode_valid also be performed against that
> configuration's max_link_clock? Currently, intel_dp_mode_valid_m_n
> accepts the mode if any allowed config passes the ratio check.
>=20
> For example, on DG2 with a UHBR10 MST link, could a ~1.3 GHz stream pass
> the check using HBR3 but later fail during config computation because MST
> uses UHBR10, which does not satisfy the ratio limit? If so, should the
> validation use the same link configuration that MST will actually use?

Lets start with DG2 does not have UHBR to begin with.
Also compute doesn't actually use max_bw_config. MST goes through
intel_dp_compute_config_limits() too, so configs that fail the ratio are al=
ready
filtered out and it picks from what's left. In your example it'd just use H=
BR3 instead of failing (DG2 has no UHBR anyway).
For mode_valid I didn't want to check only max_bw_config, since the symbol =
clock
isn't monotonic in link rate and a lower rate can pass where the max one fa=
ils.
If something slips through, compute still does the exact check.

Regards,
Suraj Kandpal

>=20
> > +
> >  	/*
> >  	 * TODO:
> >  	 * - Also check if compression would allow for the mode
> > --
> > 2.34.1

