Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B30C88E53
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 05:42:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5377510E1CB;
	Tue, 15 Sep 2026 05:42:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YSJ6MCin";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C430310E042;
 Tue, 15 Sep 2026 05:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789450962; x=1820986962;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VZS7LU4Vlhw+AVsCGBh2dIwE+RHpQN3hKNAJr/R/Qgo=;
 b=YSJ6MCinbJKBxCdjxEuLxRHakull31udT2RJ2m/klZKnCf0XzflUlfzw
 YdEL5OaojudjcbkW7QOeuQoe/nkPb+IkhJmpnCnip2/Iku1FS9xGys26A
 2MJ87aaexlMpYWaGUOxFx7zs4L0rCI0dG067kzJLVrqGU1Gf7OXUtQGwA
 uTbZ/KMmBb15o/hclva0vGsv4xucIW/aIyGpE9911inA36ihCc2zQ1Zr0
 ND30WYO0q0xpjQ1DmlGydyUgwIXQp3X50mmRr8PuKBqYtWZPpXRCoC7S8
 13AklrqTUsRnI9jB2wmjRUQZh6RjER8vdMx7oSu68SWkDxXP7sLhvZyDg g==;
X-CSE-ConnectionGUID: nFLpCkSCTPamsZ4DnRuBRQ==
X-CSE-MsgGUID: Pf8KqgdLR/Kg5f37LeFqUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101324209"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="101324209"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 22:42:41 -0700
X-CSE-ConnectionGUID: 9Q213ac3SkWNncQaVidRng==
X-CSE-MsgGUID: T8VijslqRfKOyy00V0CsvA==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 22:42:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 22:42:39 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 22:42:39 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.3) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 22:42:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lWE+c8gUGqPY7FhRGgvYYV8vpJyvMtoRbGl1dAHnIGLaUioC6fixA+hoRhZs+/w/9xI8nl336NnSseCVFzVc6/O0E688Eh32Tg+PIzkRY3xBTW8UHOXqB1A4nNBdoYuda8yAeOY/ajOkvKwvYEObOztSev6GV+e4afR279TGDJHPrJq10dzoeaU3/NGpBc1Nb5cqS3YdaLu7R31sFCaUEOzeFwz2hDHyoLlLqjVk29vNJ6HJZiN3itn/De9MyKNbLO9iXP3u0Xtp7bsvblSPV/dgExG5Uk9uUMFpjdYNrlD7euyIciKeBQVEz4m/6FEDVePs0Q5ZQYOiqv5+BiUW0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TD/Khmcvi+dFYmcdGVmvpYSbE1RK7yCTX20BSnV46Qk=;
 b=xPaNU+NHmffKVJg6UeC8jhgy9J1eqBMdp0WAp3EayznSLp+8RVx1OMjptY2XF2BIALGu5JPZffJRuvXm2kjTp4E+1wTHYZpQy1gHHHxtWsrZlq6/U9D0SXUKLg0/g33p0ZoBNagz22Vlz8DgyuA0hOhrmUEF6pmdHQ2mzJFC8H6ekYmX/xlMA6GOJaaTHB8QRDXKnRvaG9UhoZ07qk284s5Eq8nIYLekwupKZp6T8lcjvfZYhjkigZYZk0FWQ74iQXWWXOvIOFxM7S3oAWSLBnaoQb/DzuzO6b8GlTtvu97bkypHBM96YPhL0DfgVEwPKoIYlu24jv73v3NF9aznAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6348.namprd11.prod.outlook.com (2603:10b6:208:3af::16)
 by LV3PR11MB8726.namprd11.prod.outlook.com (2603:10b6:408:21a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 05:42:36 +0000
Received: from IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::5a70:4005:6905:8e31]) by IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::5a70:4005:6905:8e31%7]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 05:42:36 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, "Borah, Chaitanya Kumar"
 <chaitanya.kumar.borah@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH v1] drm/i915/display: Add command line param for DC balance
Thread-Topic: [PATCH v1] drm/i915/display: Add command line param for DC
 balance
Thread-Index: AQHdNsvGSZRRVPFRI0mXYOec3HZDkrazPtKAgAq23OCAAC/SgIARFrVQ
Date: Tue, 15 Sep 2026 05:42:36 +0000
Message-ID: <IA1PR11MB6348AD5D307182C040FEDBE0B2BA2@IA1PR11MB6348.namprd11.prod.outlook.com>
References: <20260828085037.1430881-1-mitulkumar.ajitkumar.golani@intel.com>
 <23a0819e-35b9-4061-ba87-288601f9fbeb@intel.com>
 <IA1PR11MB6348B33BDBECAB92F9E5F87EB2B52@IA1PR11MB6348.namprd11.prod.outlook.com>
 <9d5bd09bf9446fd8142804271d52dbc5964e5e72@intel.com>
In-Reply-To: <9d5bd09bf9446fd8142804271d52dbc5964e5e72@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6348:EE_|LV3PR11MB8726:EE_
x-ms-office365-filtering-correlation-id: c413b59e-49a2-4ad7-6a39-08df12ec25e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|38070700021|56012099006|4143699003|11063799006|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: ofWMwk9P+PWcR5EP8uM1guneGUiI7OnhhNbFVkMZA+Eb8ZaxI9IFF/BBnXcL2J0RxZPP0rXFwL4txYjbDzkDU5oRNoyp1OuZ3oHAB/5+/Ssk9adAr1w008RO06KdAAxF46XKRcfdALQ6LLepxP8hviN8D1ERy2CGbRWdvz7KsGTfXb/7Zp1923qeCU4/gMZ8QB5eSVOEJJvkxStI8R6jqUojY720nKrQzLh0qZ7cmrcD8eiz+yFXj5F/wtYxXGlyffG55forguCoK7jQ6NcMk16YujRj3FfC1s2I9/YxEFwhtv85+36Q+trrwi/2yQeE0w+hEfXgexeovxVTMTOwfUwfjivLW0IJyOP/rzc7fPQBsp1dI6m0ljYP0eeGmHDpbZ3LNjdoVP1k4Q3BICbJmccPi31zobAUHhnvVZ/kCjA8AhsnQiXrUQdD19sVvfQ0EErZ7ayxTrn6JV2N8XM1Oq5u3COWZfACryr+5jOLNjF5jhuBxy7tICgRGFoODDow4A0wDBtIVIxLRbIhU9BYo67TLEelbHHZQc03aHiI6VYlZ6g3VhrpAlnzkADH0nUgFPGVnPnU7diOV0KtfK10NQKce/v1uhJKKB3mw3ERBK3R5VSyeQw7rjB/lhBnBqbMqcbXQZ77s67FHsU/g+BidC8megF+fvz1rDhxh0Yi7xkyvkwJhRIVR93Mp2MVjldg94wqwh+0OrW9tJZVFu/CqN/1iD9BqY5YEr5fONsc2Ks=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6348.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(38070700021)(56012099006)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IPtkcB9eWPsgqayCX3ba7Y5xO0I8ehlP1Q2WsnIzvDwUOwYg9/exDaHM1LZH?=
 =?us-ascii?Q?1luKOsIp4MrMF89XXLoEnVjfef5oPxncXW1IqWOV7cRgsE8XHAPCVfnknUjm?=
 =?us-ascii?Q?XcAb7TAr2YZYfyegSrmKDvBdHcEENE/0d/U/EvsBJZ1C+JU1sa8Ud2H2xUXz?=
 =?us-ascii?Q?wao/ZsNmOAChRRmUfy5ER7GX4rxqsRklbm1gSbDAxpZrB1VSjGz9P7f7qBPf?=
 =?us-ascii?Q?8ht5Pbh/Hc/fkLo2CaUo34h3h9L0Pie1t7Z2vEDaaFJBYhfdl3VAgvlIhIJg?=
 =?us-ascii?Q?IHvUvk3fOcmaHZ0vQd3/1Zu7geGK2TVgjQSLyqUOnF8eD81TCpkCRwTs+gFp?=
 =?us-ascii?Q?6EI+3r4up8/TJzDpn3h0HirONmeFxQ2Ue4ufBRtZugfJZZs6oECCsLfhYr+n?=
 =?us-ascii?Q?oIWU529weTlqWGdJsbRWQze8SCQUFQlti9DTTpuawcN3o38tSaqRhsY9b9Wm?=
 =?us-ascii?Q?ArXzHv5/oOgxEa1nqfU1LvoYahRbcVC1qYz3Sxd3ZcH3RSwxDVeMAgD2Ymdt?=
 =?us-ascii?Q?ITLEoVeUrZY22L6B3tLw2QEco5jhfJ79NISAiL/wHRqy0MVSPZ+QJaXgpj26?=
 =?us-ascii?Q?l+hl79yLQW0GoCpAFq2i1uEjiGVFz7fsB2vBHQAPx2pUIhNnhXatP+EakIBo?=
 =?us-ascii?Q?/g6X1zySogC84P+4O7d6DRwFI01nAKo/dMWrK+ivgOn9Tp7NK6Z3ItGVk3La?=
 =?us-ascii?Q?vWk0MBu/N5fIWsKkdIEDFznLIATSLXIk6ohmFeAvJP/i2DrH9y2OZZPDI8Ac?=
 =?us-ascii?Q?Y0RJc1vVEFC2wOIPJ9AJ7II0WwYutcpw86S7NRC2DisvIwxpVmnbLMDihIz0?=
 =?us-ascii?Q?wuvVhxWPLIIspoSdKFmauXp0JJsWtobK/RgSwt0ZT9eS5g/biIhWag2oDqC+?=
 =?us-ascii?Q?W1a5N3Fqzj/ofEz99ICWdggtvugs4S2bQVqUtgH9bet5xwudQWZ2SZUMnk2P?=
 =?us-ascii?Q?2nBg5HSNDte0Kaf/B4JAQMeJwd5LBaqd8HGmVG5o4RstTbSm59ao1zYvP69l?=
 =?us-ascii?Q?XtizDaYHjfr26X3jhyEeWATKUkWHBxmvYcFSehSrudBITZ5wL6z4mPPesHkK?=
 =?us-ascii?Q?HaNqNl9hG6xLbKmWkW2ggBYtO7lx1uf1tSL8S6AsjOjOVMqkAG7xZ/UDwboa?=
 =?us-ascii?Q?HuQS+aRQxdqtdb/YnJan3wBN2K4ZtREzqgyiVfbnHVMTBjp0VB60XVsHNXYX?=
 =?us-ascii?Q?JoAV/r7YjjLdQLw2gbipL4Vxh+krCBYcv3VHWxWljUH1SDrjYej3CpiojErd?=
 =?us-ascii?Q?eiLCVRBJoccAE1ORhD2CpFbQJDBxKSKpNY42VNhECNcxavh11kcd/dpjyjd0?=
 =?us-ascii?Q?oImAPLkrMgqQdkEVJ+TE/KQt83PP2dtsIWLMEQt68zHrN2C9hDHWJ4dGiSXG?=
 =?us-ascii?Q?khi41tS36bMgxlcx3NV3dmVOo8pmsWJCsLg2FYcMYOD6LkDQWalBrpwP9/nY?=
 =?us-ascii?Q?IJpZVgkH2uQnGW2j0BhSx9TqEEbL6dD950tPInn9/3MpT8lCaDF/lAZjr2/X?=
 =?us-ascii?Q?qIc3YJOHVs6oBEJgL5VmioBysUFWEbj+bdlWOayZnDsNjmJYsv4Jep0HBUqD?=
 =?us-ascii?Q?cME4nwHR0gzEF72A2UmEGaaZ1gBSp+KQtiDY07xwbSffwHR9ZWsLclZhhpDp?=
 =?us-ascii?Q?Wds3f1tWXjA2uqX9HU8xdDvXYqJKMipbPN5lWoxJ2t0i9Vgo3OgJtmKZv4+0?=
 =?us-ascii?Q?nN0VmAH0ZKKO4kP8uFTDKFf3ckiFTtcPXIacKEjfS7DxjFSIJcTlY4WHx4ja?=
 =?us-ascii?Q?DFNDgRua6yM1nrIfCa5nkXGQbtOGKwo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: f8Uw41/UNk5ghRhZa91Lc4ysSyDbrZvK+F85Ve2fEcHN56ssn5MLvReS9nGSZ9FKgDOfZW5MAsMFx+waqFia19ZVHfnd9uyFRwFcUQpxinOF7A/B2HSHwvuOYHYVCraZyYjrA8lwRiSeaIMiIKYIer4UXomsMoVGpwpNojjVoHPhngTny8NO2sF61ac3pKb5p4Mge8rj4ULErD3RRMBlX2hlwuT4UJa5DIqoXNYTeBTnCeeeO6Xcp6JHVwPm4DcWtGvjBCtoUYUKpEzA22IprGNzNxOPCbqQ2pxBATl4urbtT1QnAUDgqUEBW/HGA9guLD+T2mRy765NWXRX3RaISg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c413b59e-49a2-4ad7-6a39-08df12ec25e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2026 05:42:36.6709 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K/dlvGHbh4LxybQZQkZlK1Pg5zUdGqIdb5WTrwXxnDLcQkroEawQpTpSvgut1dZRS3iBZwlaTnDDTHOXauOnLMhRMCXZm5IjZJxKxiX0G+V/Uc5Cvwx8gHYArx54XBJ3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8726
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
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: 04 September 2026 14:14
> To: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
> Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; intel-
> gfx@lists.freedesktop.org
> Cc: intel-xe@lists.freedesktop.org; Nautiyal, Ankit K
> <ankit.k.nautiyal@intel.com>
> Subject: RE: [PATCH v1] drm/i915/display: Add command line param for DC
> balance
>=20
> On Fri, 04 Sep 2026, "Golani, Mitulkumar Ajitkumar"
> <mitulkumar.ajitkumar.golani@intel.com> wrote:
> >> -----Original Message-----
> >> From: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
> >> Sent: 28 August 2026 15:46
> >> To: Golani, Mitulkumar Ajitkumar
> >> <mitulkumar.ajitkumar.golani@intel.com>;
> >> intel-gfx@lists.freedesktop.org
> >> Cc: intel-xe@lists.freedesktop.org; Nautiyal, Ankit K
> >> <ankit.k.nautiyal@intel.com>
> >> Subject: Re: [PATCH v1] drm/i915/display: Add command line param for
> >> DC balance
> >>
> >>
> >>
> >> On 8/28/2026 2:20 PM, Mitul Golani wrote:
> >> > Add a new module parameter 'enable_dc_balance' to allow enabling or
> >> > disabling the VRR DC balance feature at runtime. The DC balance
> >> > computation in intel_vrr_dc_balance_compute_config() now honours
> >> > this parameter, so the feature can be toggled without recompiling.
> >> >
> >> > Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> >> > ---
> >> >   drivers/gpu/drm/i915/display/intel_display_params.c | 3 +++
> >> >   drivers/gpu/drm/i915/display/intel_display_params.h | 1 +
> >> >   drivers/gpu/drm/i915/display/intel_vrr.c            | 4 +++-
> >> >   3 files changed, 7 insertions(+), 1 deletion(-)
> >> >
> >> > diff --git a/drivers/gpu/drm/i915/display/intel_display_params.c
> >> > b/drivers/gpu/drm/i915/display/intel_display_params.c
> >> > index 2aed110c5b09..ed3aa84c5d43 100644
> >> > --- a/drivers/gpu/drm/i915/display/intel_display_params.c
> >> > +++ b/drivers/gpu/drm/i915/display/intel_display_params.c
> >> > @@ -120,6 +120,9 @@ intel_display_param_named_unsafe(enable_psr,
> >> > int,
> >> 0400,
> >> >   	"(0=3Ddisabled, 1=3Denable up to PSR1, 2=3Denable up to PSR2) "
> >> >   	"Default: -1 (use per-chip default)");
> >> >
> >> > +intel_display_param_named_unsafe(enable_dc_balance, int, 0400,
> >> > +	"Enable DC Balance (0=3Ddisabled, 1=3Denable). Default: 1 (use
> >> > +per-chip default)");
> >> > +
> >> >   intel_display_param_named_unsafe(enable_panel_replay, int, 0400,
> >> >   	"Enable Panel Replay (0=3Ddisabled, 1=3Denabled). Default: -1 (us=
e
> >> > per-chip default)");
> >> >
> >> > diff --git a/drivers/gpu/drm/i915/display/intel_display_params.h
> >> > b/drivers/gpu/drm/i915/display/intel_display_params.h
> >> > index b95ecf728daa..8c28c27e2c46 100644
> >> > --- a/drivers/gpu/drm/i915/display/intel_display_params.h
> >> > +++ b/drivers/gpu/drm/i915/display/intel_display_params.h
> >> > @@ -46,6 +46,7 @@ struct drm_printer;
> >> >   	param(bool, enable_dp_mst, true, 0600) \
> >> >   	param(int, enable_fbc, -1, 0600) \
> >> >   	param(int, enable_psr, -1, 0600) \
> >> > +	param(int, enable_dc_balance, false, 0600) \
> >>
> >> You mean true?
> >
> > Yes should be true by default. I will update in next revision.
>=20
> My comment on the rationale of the whole module parameter is more
> important, but if we end up with this, the parameter types and values nee=
d to
> match, i.e. int and integers, bool and true/false.
>=20
> BR,
> Jani.

Thanks Jani for review

I have fixed with new revision v2, the parameter is now bool with a false d=
efault, so type and value match.

>=20
> >
> > Thanks
> >
> >>
> >> >   	param(int, enable_panel_replay, -1, 0600) \
> >> >   	param(bool, psr_safest_params, false, 0400) \
> >> >   	param(bool, enable_psr2_sel_fetch, true, 0400) \ diff --git
> >> > a/drivers/gpu/drm/i915/display/intel_vrr.c
> >> > b/drivers/gpu/drm/i915/display/intel_vrr.c
> >> > index e36db1174440..1698c54e258b 100644
> >> > --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> >> > +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> >> > @@ -439,10 +439,12 @@ static bool
> >> > intel_vrr_dc_balance_possible(const
> >> struct intel_crtc_state *crtc_st
> >> >   static void
> >> >   intel_vrr_dc_balance_compute_config(struct intel_crtc_state
> *crtc_state)
> >> >   {
> >> > +	struct intel_display *display =3D to_intel_display(crtc_state);
> >> >   	int guardband_usec, adjustment_usec;
> >> >   	struct drm_display_mode *adjusted_mode =3D
> >> > &crtc_state->hw.adjusted_mode;
> >> >
> >> > -	if (!intel_vrr_dc_balance_possible(crtc_state) || !crtc_state-
> >> >vrr.enable)
> >> > +	if (!intel_vrr_dc_balance_possible(crtc_state) ||
> >> > +	    !crtc_state->vrr.enable ||
> >> > +!display->params.enable_dc_balance)
> >> >   		return;
> >> >
> >> >   	crtc_state->vrr.dc_balance.vmax =3D crtc_state->vrr.vmax;
> >
>=20
> --
> Jani Nikula, Intel
