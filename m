Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A12C52D7C
	for <intel-xe@archiver.kernel.org>; Fri, 23 Aug 2024 05:30:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C03410EC24;
	Fri, 23 Aug 2024 05:30:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hang7ACH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEE3210EC24
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Aug 2024 05:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724391026; x=1755927026;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QgQ+FH4bhBdGCeVC+tYH5/iRA7I7MWOGmYucK3ZM1rE=;
 b=Hang7ACHcAkfiE0+/RBHXzZtBosZ2ivPIx4LfNmi170dIBm9MRC0TPvX
 SpgB8ab9l4V9lY21O0uUw5OWJ0U5UYWdQbplpRZnXjzYraD5F/CxhjXDi
 Kfvx776K+dscuR+CZIXs/ar4IwA2qtju81aPP4A+WIPoeARy05qxBkGOr
 jP2+t0HpMKzoO6jGg1u8LT3ltzLYPEc/IiZtMUbEW/LndefhUsJ9KgG1v
 AI/lVSU0xeVAPuDWY6GPs+jI8PrlAg+2y3HimkeFMfnzq06ZF5PgBvlFs
 gQBJErRm8fBcfA23nc3OgMIKkJLJuKguJmkq8kaeLAqe3FvVCFS3BmfLL w==;
X-CSE-ConnectionGUID: rdr3f3nOScWGTIFF8wamxQ==
X-CSE-MsgGUID: Bl5/e5uRRYWyFOxbjOGn5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="26595550"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; d="scan'208";a="26595550"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 22:30:21 -0700
X-CSE-ConnectionGUID: sK/+LeZMSkux3sIqSvXDPA==
X-CSE-MsgGUID: XC+DD+dgQi+5KLln1vYbLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; d="scan'208";a="66021885"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Aug 2024 22:30:21 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 22 Aug 2024 22:30:20 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 22 Aug 2024 22:30:20 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 22 Aug 2024 22:30:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rs6Lh0+Mqo+UIbp9YH0yfGF8bOqETvLVePKPB+U7epKM/sGHtmp8kAjCXj4pvwYnA+LvW4aGT29bneVeE1jWOXxuwp6HZbFuUmZ7NlsBckDDpwIC2Lj6fTmLeWl0M7eXcEmMHcKZrOcHrNj3x3NO4cqJ2Gygn80DmTmwphwf0By20HFrx7oD/Cb19XZcB0K9G3CHItQzqyMAtqqmArnP0Z3AvfQ7jSdJbOMzruiNn/WP3Da+ifOJ7fkjYTMYXzhPFe2zZyR4osn2/CyNat8Kt5CwhWa1/NrpBAc3UD2OyUu+NBg0J+h6437NOFvDj2mddYiShjJq8hw0qefSfSObbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tVrHbWQg++LrgeGCs3LspmWzqZ3vbns3G7pd7BSX6B0=;
 b=mJ/s1DUYUdaw1zwuz5T+Yo8v7E/40/s0+qOrexnOwGM951ZLtndNcoJWVUn2Qth+Bs/QQwjN9t8lnDH0Zjd+l0h4AYsnT9xVNFvgoRpBM5xU4ZStS6TcLsncRrTPv68QvD+yqoh92p0VNIev040/OWXnr6glKggSBXq3pcgopF6OIXRWFUIx6sTm/l6yHSewJr7Kcnv6k/WGTOniVXxfdSXLDtsssjpBInpSy0rsk5Z1uhI439Ki3aA2GuS45VTG2rrJkuXiLsXenqkgq6sOE654rHS3oFlCfuFeGeAPSVWWASGEQareI/GOPQtyBZkOwON+DcPInh7hONocByViwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by MW5PR11MB5787.namprd11.prod.outlook.com (2603:10b6:303:192::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Fri, 23 Aug
 2024 05:30:18 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%3]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 05:30:18 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Deak, Imre" <imre.deak@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>,
 "ville.syrala@intel.com" <ville.syrala@intel.com>
Subject: RE: [PATCH v3 3/3] drm/xe/display: handle HPD polling in display
 runtime suspend/resume
Thread-Topic: [PATCH v3 3/3] drm/xe/display: handle HPD polling in display
 runtime suspend/resume
Thread-Index: AQHa8yRy4pblfopRxEi1CK3tMNLg2LI0Mr2Q
Date: Fri, 23 Aug 2024 05:30:18 +0000
Message-ID: <IA0PR11MB7307BAFF0427160AD7CD3D4BBA882@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20240820171408.192309-1-vinod.govindapillai@intel.com>
 <20240820171408.192309-4-vinod.govindapillai@intel.com>
In-Reply-To: <20240820171408.192309-4-vinod.govindapillai@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|MW5PR11MB5787:EE_
x-ms-office365-filtering-correlation-id: 2aa9bdfe-1ffe-4bc8-2e95-08dcc334ac94
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?B14RQFNmyUduGVAhh88YCBJw5cXiFroKc8jhvgSHptYuLbfQ/K3wBj2gQqlX?=
 =?us-ascii?Q?kZacDa3jctGB91Jszioxn6Qfc2OAqN3Tlxmuptk9whsjnRlGh9yBvUVfol0r?=
 =?us-ascii?Q?JUzC8tsWzh5x/iG6xhDqjI6X+xJw8HgpFx6czGruTCDBiLO8HUQt0Mh0IQfN?=
 =?us-ascii?Q?ZEVuN/hGCvTaOmt0tnIlIXhFABIgFA1zzINPFW+dwTdFw9PWamFQTCKjRwGX?=
 =?us-ascii?Q?p2b09Foj88BkdYnQK5qzIXUsrjrG9g/6ZLI4mkAunVOgQueoVr0VtDPbobiX?=
 =?us-ascii?Q?NIxc32YiQ8mk3qLCWGhEH7RvkYD1cww/8hVULO51AuESwA6UZwuJD+74EZtf?=
 =?us-ascii?Q?a6fEUhMqzdLp26lSMm0zUe8jiZoY+ct/eLVXFqeXEUY+BPgZkCAdIDWmfT9L?=
 =?us-ascii?Q?2+xtT+27sXfaPToOykfUp2cLLhwkMRAx6XPh8WuvKbtqgNaovaO62QsrmFMa?=
 =?us-ascii?Q?F+DkfNVvNytFQWDdOxgJHokPJt4ozPLf53B0yhg3DLnu6XPMiCIQ4KuiR3rt?=
 =?us-ascii?Q?QLxb3lj0pwZ7Y3CMh3nKAdhmzSRXcP5ArK8KTq2WEZIOjLf5FyYf5PboYLvd?=
 =?us-ascii?Q?S5wCd0adQ1Rg7LjX9+6msbh5tm0MWqTVHCXnV5ZYNNi2SQtbUt51H79iWgtT?=
 =?us-ascii?Q?AlxTbDQcjWdVw/SBASV2coOxREyBjqT5X6ysk1GCFG3hx3Ws1FVappB4VOVz?=
 =?us-ascii?Q?L+RP1YK8poW1oT6x9A06ezWJ+FmvG7G387oAp5Rmg870L8xLbSvmqSEw33Xw?=
 =?us-ascii?Q?cXdUJ2/N1/nR6pASm0etAvfIb+cV4mka1rP3tmEEphMG+NbWAD0DbvIYumLp?=
 =?us-ascii?Q?b+ELqedAUZA802Skff0zF8/NuHzq5Ctu+f19fF0vNGcPRvDX0/M9eXrfQvRW?=
 =?us-ascii?Q?QFkYvacGRqRDcS9J+/z7+k+IiyxYBBml/RhQxaHL4KIcT+dIUtGYj0lEsPsI?=
 =?us-ascii?Q?i8DNd3nk79AOIY77rMoRDxPtj5zCrhv1/7c9KpYiLuZU1f6HuWlyFvWgiPQ9?=
 =?us-ascii?Q?DUQeFoEXmyYLwwy2ALY2jiCTX5HZPfXGpMUjOBVI6zKI9ve1xF/yG+2Lshtm?=
 =?us-ascii?Q?c0/gMkCjRrN5QRdZ7huY4ztHucTFfWU80xu6nnNgVIUbV70B+ajb4+XJq0pC?=
 =?us-ascii?Q?71e5oIp9Xf2ha7u8D4thVy1HzdcOdVcJq93ftCGFJyrvOzS7oR2r4Ud//9Q0?=
 =?us-ascii?Q?ScV3DG30vNvE9OzwrinNzGC26f7WOBEvGADu4XPwQ/Dc8h4DGzrULp3fM4BB?=
 =?us-ascii?Q?VhjQXkM5w/dCvN3YmDwTeUd+6aL3BqhYM5E8WOKeVRoQwbtS4xND7ZxJkgAd?=
 =?us-ascii?Q?3cEWp+D+W9bhdOpY8Rw04/XtLcxDgBoCV+++a4IeICUAoGfyhEIUluERRTVe?=
 =?us-ascii?Q?YWC+9YJ1rKKC7b+GKD/ROTv8x3F5hww1ggCyE9cDCBwtmqxtoA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GgreUE98gotC68MoFD5asaps02asx1iyD4SHFs3dABaQIhDdiqKKtMoPo/qA?=
 =?us-ascii?Q?3KkbIy82vI8umD9EWHIzqLv8hIgt2X1N1PQBWt5NHIm962TUHmVmo7CGxIrp?=
 =?us-ascii?Q?qhg8tnmFUauUC7gCbCUxhRFlBwALEWsoP1R3hwELTrYE+HTfCO0E6i5hCgHE?=
 =?us-ascii?Q?13pscup3xJWREAK5LRZ02y+BSJ/7Bo4L+zvtMkdvEoydaB9L13eJqsTKtOg5?=
 =?us-ascii?Q?FjJMKkLJnJqflw59nATzpVzL/JvbTQDmlGQo6PN6xOP8/VBZo0iVDoaS+laX?=
 =?us-ascii?Q?RHMFGkoazR/pdEOndaAwLcRm0YZ7bJlFFBG4N6BUz2OKEiU2McIFD1Xrhfd2?=
 =?us-ascii?Q?6t2I/m7Mujb3cVcMr5j1cMKDhJO9BpSVVomVWwMXAnW53jt5k9ltb0Y4Mg+2?=
 =?us-ascii?Q?EZ+sRcu55AVv5Y7ggWjW3SuNiZM52O9Hh1Asl1Mufq0V5fK8PnHs2vua31d9?=
 =?us-ascii?Q?8m2e+sVDYHvj4gugcO5H7GgcQ8/BjO0BLvkHj7OXhZDQy5ddB9F5gDBm6ye0?=
 =?us-ascii?Q?5vqfqZzY291SmkJp1dPkUnYarccegHn4ARqN8AXGJf5zGlyxWgoO/E+ISQ1F?=
 =?us-ascii?Q?bIbSUCDPSs6cceKQW5Xqv62hCWiaqyCeoSo8TvMveESrMNtlNw8PfHQdOKsZ?=
 =?us-ascii?Q?hjXWACMV4pF3aGJwF2H0k565NGQrYNIqfUsRlSeWKIpAFnZVYf9VxQ7Rs/Tf?=
 =?us-ascii?Q?ovoeSYrp7qyR1JChf9IqO7sIiVbHL6zCLLKx4DjfahB6ERX27wfmrfIkYkTP?=
 =?us-ascii?Q?NwB+vMbg645vVXEDLzryf46zYR8LTSuGQggRADFHGv0dclnyepSkbgsK7QMX?=
 =?us-ascii?Q?Us0ovqu8yiYNO2w2mAYsa/qvIxv20aihsvpsLWHfdDno55amN8m9jkobRFIR?=
 =?us-ascii?Q?wH8c8ZLKTlsbJEfe6m35tgjPtp8QqZWlHm+xjCbolBttiTVPFuZdqblCwYYm?=
 =?us-ascii?Q?A4axOqPTQKShjf8MGjgJuDm8mfFv5SJ76p5/EvvgWgi2aU5IaeH8YBHLPvuK?=
 =?us-ascii?Q?/+DJB2fahbCk8RCtS92WIy5iQhcIhIS3TWAXPY2oTBr9IQM0e2EGq6QhmLus?=
 =?us-ascii?Q?4wINGjP/DGPCM1ZyitqyRWgD5gasGJobOv00ODThVsww8T5zT7A7pNCGibD0?=
 =?us-ascii?Q?Wrvss8FI8KEjm/rhjgMR3NoN6ObBoSaE6VHTXRGpnI7UkbEs0yzXXod+XA87?=
 =?us-ascii?Q?5cTpeBWkt/jdM/nJQcTxUF0+UUqCyh40w2u4TdwipIz64k5Aip3VvYsNV3RW?=
 =?us-ascii?Q?GnJHC2FmmCzeWgQnVNTp0K8/lxZHjPV6S2hIloiE0w3dFrxNmw7J+42s74h9?=
 =?us-ascii?Q?Oph9nCEAUV4HAdWwVWYm4IIrkh+nq1uSu+qdzE22P7wLVUGND8xx6HoQ3bF5?=
 =?us-ascii?Q?Osa2UZUbySzHMsgRtP84Khq2zcYnhjOIoP+9dDSb32iyuFTKxcabzskNG8we?=
 =?us-ascii?Q?wUUpFdcSEBpUmh9muxQRfuXTojSuxMbOXHI6sNZ2MUpT6lqI2g8uF6MMkEis?=
 =?us-ascii?Q?ZN8Q5XvkwxZ9V/ox5OhZiFAL7e/6WWkB7ZZgICuQK0jKUVPeTHhOL7gUj3lF?=
 =?us-ascii?Q?x4mMhZxnFofOfN/qMDz9DsiB2wz669eKp3OjPoAX?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aa9bdfe-1ffe-4bc8-2e95-08dcc334ac94
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2024 05:30:18.0712 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oosTXMd1RRYw6UGI+PkmfrBT5sevlBdQFOx0gffcdDgsAyhUrOYcmp3zXJMZ4zqZHh04Ej5aAEKvCZ9QWaG+nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5787
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
> From: Govindapillai, Vinod <vinod.govindapillai@intel.com>
> Sent: Tuesday, August 20, 2024 10:44 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Govindapillai, Vinod <vinod.govindapillai@intel.com>; Deak, Imre
> <imre.deak@intel.com>; Murthy, Arun R <arun.r.murthy@intel.com>; Vivi,
> Rodrigo <rodrigo.vivi@intel.com>; Shankar, Uma <uma.shankar@intel.com>;
> ville.syrala@intel.com
> Subject: [PATCH v3 3/3] drm/xe/display: handle HPD polling in display run=
time
> suspend/resume
>=20
> In XE, display runtime suspend / resume routines are called only if d3col=
d is
> allowed. This makes the driver unable to detect any HPDs once the device =
goes
> into runtime suspend state in platforms like LNL. Update the display runt=
ime
> suspend / resume routines to include HPD polling regardless of d3cold sta=
tus.
>=20
> While xe_display_pm_suspend/resume() performs steps during runtime
> suspend/resume that shouldn't happen, like suspending MST and they are
> missing other steps like enabling DC9, this patchset is meant to keep the=
 current
> behavior wrt. these, leaving the corresponding updates for a follow-up
>=20
> v2: have a separate function for display runtime s/r (Rodrigo)
>=20
> v3: better streamlining of system s/r and runtime s/r calls (Imre)
>=20
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---

Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>

Thanks and Regards,
Arun R Murthy
--------------------

>  drivers/gpu/drm/xe/display/xe_display.c | 23 +++++++++++++++++++++++
> drivers/gpu/drm/xe/display/xe_display.h |  4 ++++
>  drivers/gpu/drm/xe/xe_pm.c              |  8 +++++---
>  3 files changed, 32 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c
> b/drivers/gpu/drm/xe/display/xe_display.c
> index b2a0b4b5c45c..3dc55edd390a 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -308,6 +308,18 @@ static void xe_display_flush_cleanup_work(struct
> xe_device *xe)
>  	}
>  }
>=20
> +/* TODO: System and runtime suspend/resume sequences will be sanitized
> +as a follow-up. */ void xe_display_pm_runtime_suspend(struct xe_device
> +*xe) {
> +	if (!xe->info.probe_display)
> +		return;
> +
> +	if (xe->d3cold.allowed)
> +		xe_display_pm_suspend(xe, true);
> +
> +	intel_hpd_poll_enable(xe);
> +}
> +
>  void xe_display_pm_suspend(struct xe_device *xe, bool runtime)  {
>  	struct intel_display *display =3D &xe->display; @@ -355,6 +367,17 @@
> void xe_display_pm_suspend_late(struct xe_device *xe)
>  	intel_display_power_suspend_late(xe);
>  }
>=20
> +void xe_display_pm_runtime_resume(struct xe_device *xe) {
> +	if (!xe->info.probe_display)
> +		return;
> +
> +	intel_hpd_poll_disable(xe);
> +
> +	if (xe->d3cold.allowed)
> +		xe_display_pm_resume(xe, true);
> +}
> +
>  void xe_display_pm_resume_early(struct xe_device *xe)  {
>  	if (!xe->info.probe_display)
> diff --git a/drivers/gpu/drm/xe/display/xe_display.h
> b/drivers/gpu/drm/xe/display/xe_display.h
> index 000fb5799df5..53d727fd792b 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.h
> +++ b/drivers/gpu/drm/xe/display/xe_display.h
> @@ -38,6 +38,8 @@ void xe_display_pm_suspend(struct xe_device *xe, bool
> runtime);  void xe_display_pm_suspend_late(struct xe_device *xe);  void
> xe_display_pm_resume_early(struct xe_device *xe);  void
> xe_display_pm_resume(struct xe_device *xe, bool runtime);
> +void xe_display_pm_runtime_suspend(struct xe_device *xe); void
> +xe_display_pm_runtime_resume(struct xe_device *xe);
>=20
>  #else
>=20
> @@ -67,6 +69,8 @@ static inline void xe_display_pm_suspend(struct xe_devi=
ce
> *xe, bool runtime) {}  static inline void xe_display_pm_suspend_late(stru=
ct
> xe_device *xe) {}  static inline void xe_display_pm_resume_early(struct
> xe_device *xe) {}  static inline void xe_display_pm_resume(struct xe_devi=
ce *xe,
> bool runtime) {}
> +static inline void xe_display_pm_runtime_suspend(struct xe_device *xe)
> +{} static inline void xe_display_pm_runtime_resume(struct xe_device
> +*xe) {}
>=20
>  #endif /* CONFIG_DRM_XE_DISPLAY */
>  #endif /* _XE_DISPLAY_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c inde=
x
> fcfb49af8c89..c247e1cb8aba 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -366,9 +366,9 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>  		xe_bo_runtime_pm_release_mmap_offset(bo);
>  	mutex_unlock(&xe->mem_access.vram_userfault.lock);
>=20
> -	if (xe->d3cold.allowed) {
> -		xe_display_pm_suspend(xe, true);
> +	xe_display_pm_runtime_suspend(xe);
>=20
> +	if (xe->d3cold.allowed) {
>  		err =3D xe_bo_evict_all(xe);
>  		if (err)
>  			goto out;
> @@ -431,12 +431,14 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  	for_each_gt(gt, xe, id)
>  		xe_gt_resume(gt);
>=20
> +	xe_display_pm_runtime_resume(xe);
> +
>  	if (xe->d3cold.allowed) {
> -		xe_display_pm_resume(xe, true);
>  		err =3D xe_bo_restore_user(xe);
>  		if (err)
>  			goto out;
>  	}
> +
>  out:
>  	lock_map_release(&xe_pm_runtime_lockdep_map);
>  	xe_pm_write_callback_task(xe, NULL);
> --
> 2.34.1

