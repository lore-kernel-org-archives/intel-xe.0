Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FCCE92729
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 18:56:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D6410E484;
	Thu,  5 Oct 2023 18:56:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A3DD10E483
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 18:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696532198; x=1728068198;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=5lyBUZIBGbpM7vD31dp8bxHQmb7Qu4+glW+nCGPE+vI=;
 b=g5QpTLlJYoDkQ1If0eTeXeY1MsZ0DDe3TwapVoTjBlumlPD+FFtCOI0r
 i2el1zR3nGPeclXzrIjK1wFg5i6/W53u3LRezhuoQuw+bjnfscQduOo9D
 Cd92RM585WmPR7VfNiRt7RhECqKcZKuSs9bJ+sM37nWTTeQG4JBZPtOYc
 AmFZ4zgjqQ5ndgKKzEAUmdv0FThqGb2d0fObstOx7syamILCUqgTZMf6B
 EJRbjUeJcDnRsf4D6ovjecsk/60m0+SZ7hCoA2CVMDJQkXFUuOjBTAK7D
 vfqjv3xc5pGgPfchiLYcuVsYXnPbhqDx8pcjymKeJFG/bwoGiR2S2sVVE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="447776863"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="447776863"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 11:56:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="817721519"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="817721519"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Oct 2023 11:56:37 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 11:56:37 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 5 Oct 2023 11:56:37 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 5 Oct 2023 11:56:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R8KNDUOnmSZVd/xplrCc6RPVNO48ZozXrg/4Iy/bTvW6i/uQNcNnLot4AkMa9v+gdKSdO1KoytLYVwlADeg8qCKd/y2SMc4FYRSffugRH2bzaanysZUD6WdOeXEemCqCf/b7uJgJ3phj0yEriQBw+F2VnMMfF1+cp7JGVAkzZ04PML1Y648Hn2WqkOOnP/UkA7fGZ3R5YTxCgogzcplnMCVaXL0KQbTatWE9gnTQ4UcSrQabiXidKJ5HXr25PufTxEQ0PiVYDgoqusYTdvM+HS6u3lNaUtKaTlI031sSGVKULu8jlwqDlAHzqjN8NtaWcfZ2YLxM2HMhSR3a0Q7QHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=al8FBRuPvUpANxH8wcqaYNABuC7xZ838BhE4cIVvFj8=;
 b=T553RQecIAdLYsZpN3SVDt88F0pMTVLl+9UP8pVjMOTA+hEmK/CIDgk63EXLoSPMD2zE9lCqYShymMGNkKikhXkbUTt9IHjnHdfeFM8Q+SXy7Vfa0IierkNAv4g1LxkLIBNgyQ93Eg8VAXdG+nY/v8M4m/fmDoCf+aSCnaROJmhu6UqeRUuLEzJv/FOi5Cbri3iSdpCzAkseXigX9daFfx1N9423jKKQlFJTQlxErcQPrIPpgPYW/nuCqEVzDPTQKT0Tty1pppUoN3+dOx1vGEumj4uycqz8jCYj6SkznWRt/3m77usdzi8dKd/7ZJr8QGVf3jw15cyQVf2tFfOMdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by SJ2PR11MB7617.namprd11.prod.outlook.com (2603:10b6:a03:4cb::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30; Thu, 5 Oct
 2023 18:56:33 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::bff0:69bb:b4e7:dacb]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::bff0:69bb:b4e7:dacb%4]) with mapi id 15.20.6813.017; Thu, 5 Oct 2023
 18:56:33 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH v3 3/3] drm/xe/display: Don't try to use vram
 if not available
Thread-Index: AQHZ97qY8F7Ep2GAOEKgUSDdC4kGtrA7iL5w
Date: Thu, 5 Oct 2023 18:56:33 +0000
Message-ID: <IA1PR11MB6418356D73CC092531E3D8BAC1CAA@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20231005183404.324835-1-juhapekka.heikkila@gmail.com>
 <20231005183404.324835-4-juhapekka.heikkila@gmail.com>
In-Reply-To: <20231005183404.324835-4-juhapekka.heikkila@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|SJ2PR11MB7617:EE_
x-ms-office365-filtering-correlation-id: b13c6eab-9cf5-4a1e-05d7-08dbc5d4cae8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7bwmw+IpJv7QvFUzOw3HJydrnjV6MnozeGaEDIb2JZX/54zkwy6jXiHcj8Ok9oOP2984UsCr5DS0ISmRpnIYlxTp9xc6bQoWgarRi85Jk2L3/5iXPMneM5u4b33P+cedLjLGDaIz4+cNut0xK/h1kFVTgg/H/uY3RXg9irk4sCJHOrpx59OaToyI24lTKhZcFDvy4UuioJUmEHuIotqFxvyo/BtMpaFvKvUvcLof0fFMS7dofyN7d+sPxB9j1VXRnSujexKGUWKL3OZvW+lAimHEQG4+JAPE0AiRThQrD+iMSFAt2LQjfk/SJl1GDESQphk/2fq/m9sAKxa5Wrn64ZxmOudcGYVTJDFJdpq1qaq6Kmas03Luva52NtGUOvPNj8MwM17fjgdGDeC+5bAR7dnVvHY464EFexyrNkn7XJ/GASdX7C70mElV6UZwKAZJffTRCVRPbT+HMBWPJ2oWPZsh7IV/xyNBVZVm9Mk/4O0PqMCoxSZ8Jlm5oE6R3HIV9XM4PuwQrVs7eroayYnitxXgW5noBSK+ODMRmA/p3lOn0/4MfjW98tv8NKmXafXZ3HtoSMWlan1J/ywt8+vB9ekgn/luGO6gT9QYMyPQnd7nlm8Zbi5URaDkQq4yzgyg
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(396003)(376002)(366004)(39860400002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(64756008)(33656002)(7696005)(6506007)(71200400001)(66556008)(83380400001)(5660300002)(26005)(8676002)(41300700001)(8936002)(52536014)(110136005)(76116006)(66446008)(66476007)(66946007)(2906002)(86362001)(478600001)(82960400001)(38070700005)(316002)(122000001)(38100700002)(9686003)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PdVhJBqzwnFoEJREq1tJjs/UYwqK3m3Iungg5FyEVRYMwAqrqr0UgcyV/+Gi?=
 =?us-ascii?Q?7HSgPqdzAvgqOG4lb/Rgn2nSWWcgk1Xim0rTbM4MDKmUmbDFng4p4vwsnnkc?=
 =?us-ascii?Q?HdPfDK/pOP8NiZttMRzRXZWTmquDKz8zJhcCfdEqy9thfLd+Mp6Bo19daftx?=
 =?us-ascii?Q?4LoE6nXjTu21V/CU31WBc/e3J83iQCNyXPqyYeXul+LaBClveL62zjnugrli?=
 =?us-ascii?Q?qMHHYqL9r2aHKSM2xaEE8cYz895Ew1Z50bVWfMSdG7VI+ntvQ2OCrWFCx+iL?=
 =?us-ascii?Q?lrIm6dN9dYubf3yw1MoGo6ACqIHHWqkTXVLz9IdlCKU7LRpUsSKHSdfRfgTg?=
 =?us-ascii?Q?kJxrib/03sIQogHFtpsHe/Q02iJj4NgkyYFb/pdoUS830P/3qFhcORk3oirF?=
 =?us-ascii?Q?em58IhTBgwMVOLt8JT3ByTKBURfBDfQNdTB5P/1QAA7K10QMKqcxOn6633JS?=
 =?us-ascii?Q?snhhCLTJ8HR7miF/E6XyxT/44GD+GkimKK+lzT2MVjbV/DbY9MTzpe/xrhjg?=
 =?us-ascii?Q?4w6PNygd4LADfW/m7CRnCDzAlK4D9xjcOok86PxUB0w3k+XQau7U74QpRxMw?=
 =?us-ascii?Q?yDasNxBFxrMMNxVeEvL1ndAKprVnp8qt4IWw/mQQwyPi+BPcOMooSFwoBHPr?=
 =?us-ascii?Q?SFTo7Z+KPpdmhfBUV1le1GwrTWYRSRZAzFNfTkSKsG6dUPkH5yrZfe9KHQ0I?=
 =?us-ascii?Q?kq5wZ+YyEP9/MJI96PlmbUYiXAXVyj53XjYNuVSSS9+nik1XRCu0Z2yR4Iye?=
 =?us-ascii?Q?56vNYHCqmJMfheoThDIbbng0VLWwLvE1xgFWRudSqf54RbRE206DRO3Mmfsp?=
 =?us-ascii?Q?PfoSp4oq5Di+MSRxHe5XT+VeoGwxxF0raJtJWQjicaZViWMQDmet5jj1nwbS?=
 =?us-ascii?Q?57CoV4DZNeZmk7xDkWL5vY33jay0UUU2WAVsbUAkwnBklkmCxFOrDk9Oji2y?=
 =?us-ascii?Q?YAHUgweGM49Gik9ZU5xb+PO5hMiZeJ0Rhk8zjKZVS0uH8FHFkPWcXYaA2hSg?=
 =?us-ascii?Q?jdf31v4qDhFKb/Yl2j0nlTv3j4r4ox+in3TOFntSVQpXqf5HbzJvdP5rpfOh?=
 =?us-ascii?Q?42vNsI+FYzT3/h7PtmDhO1RlKn2CLnaqqgtMcFYJ/sLtT50XrxOML6YcaIRS?=
 =?us-ascii?Q?DAQ9w5lqYKwrk0Qn80lPfl268lBYsKyCqMLoUohvQ49cfkv+vRFeM0biLLWt?=
 =?us-ascii?Q?KL0EsYYGL03GsZ22ykbrHNMf7jYYLYRwL416baVrh6TsR2sv92vjRTgCjDeL?=
 =?us-ascii?Q?v6llOVpbDlW3jEd8EeLwtHXu1JHmvItMA6nafJR9Q7J6YqA08X3OliIt/pYr?=
 =?us-ascii?Q?xcwTMczmzkhNc1UMoHCK6ckvRHMDl9Lmke1qaBiAQER1ReuNCeBpr+a7kc35?=
 =?us-ascii?Q?W5RyXIxRGjOuLH0SSa1BjQiLkvCFk/LiVP/ugWFKxytjs/YAFVRD5+rxPhbV?=
 =?us-ascii?Q?k4by8al4WB4dyhwt17mHcsUzU+LRFmLPp1ciUXelF8XCxWeD4E0FlN9aSb91?=
 =?us-ascii?Q?L0ijXeb9BRVRuGa3reVcpP+cfjx7y1thwRsse74/tGD7oFljQDEhYS6LEi4M?=
 =?us-ascii?Q?nJytzvrqwT62eupdS0JPjREYV8M5ECleNmNu0pAG?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b13c6eab-9cf5-4a1e-05d7-08dbc5d4cae8
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2023 18:56:33.0499 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LyJFxAZHM3KzwrF+0D5z9TGS/wp/VaUvBP8Sw+h7Bxi2xikBtLNqXhgkDmHTJ77uXpiu6HY3tsaNF4VihH9OefoVzUIQwPJNzhdHcgM4+ps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7617
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 3/3] drm/xe/display: Don't try to use vram
 if not available
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

>-----Original Message-----
>From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Juha-
>Pekka Heikkila
>Sent: Thursday, October 5, 2023 2:34 PM
>To: intel-xe@lists.freedesktop.org
>Subject: [Intel-xe] [PATCH v3 3/3] drm/xe/display: Don't try to use vram i=
f not
>available
>
>Trying to get bo from vram when vram not available will cause
>WARN_ON() hence avoid touching vram if not available.
>
>Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>---
> drivers/gpu/drm/xe/display/xe_fb_pin.c | 11 ++++++-----
> 1 file changed, 6 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>index e8e38091c8e6..a79c2416579f 100644
>--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>@@ -83,7 +83,7 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer
>*fb,
> 	struct xe_device *xe =3D to_xe_device(fb->base.dev);
> 	struct xe_tile *tile0 =3D xe_device_get_root_tile(xe);
> 	struct xe_ggtt *ggtt =3D tile0->mem.ggtt;
>-	struct xe_bo *bo =3D intel_fb_obj(&fb->base), *dpt;
>+	struct xe_bo *bo =3D intel_fb_obj(&fb->base), *dpt =3D ERR_PTR(-EINVAL);
> 	u32 dpt_size, size =3D bo->ttm.base.size;
>
> 	if (view->type =3D=3D I915_GTT_VIEW_NORMAL)
>@@ -96,10 +96,11 @@ static int __xe_pin_fb_vma_dpt(struct
>intel_framebuffer *fb,
> 		dpt_size =3D ALIGN(intel_rotation_info_size(&view->rotated) * 8,
> 				 XE_PAGE_SIZE);
>
>-	dpt =3D xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
>-				  ttm_bo_type_kernel,
>-				  XE_BO_CREATE_VRAM0_BIT |
>-				  XE_BO_CREATE_GGTT_BIT);
>+	if (tile0->mem.vram.usable_size)
>+		dpt =3D xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
>+					   ttm_bo_type_kernel,
>+					   XE_BO_CREATE_VRAM0_BIT |
>+					   XE_BO_CREATE_GGTT_BIT);
> 	if (IS_ERR(dpt))

Hmm, seems like just 'else' here would be sufficient (if _size) vram0 else =
sysmem) ?

It also seems like maybe this check should be in the xe_bo_create_pin_map f=
unction?
I.e. validate that the requested region bit is valid before creating the bo=
?

That would let you keep the pattern for the IS_ERR without the init..

Just some thoughts.

M

> 		dpt =3D xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
> 					   ttm_bo_type_kernel,
>--
>2.25.1

