Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77638606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 06:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fJToL+Ii
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F1D10E298;
	Mon, 26 Oct 2026 06:55:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0432310E298
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 06:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792997725; x=1824533725;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=iabbzaEBtBQnTjwnh5b7zClTN7O+jDuirG0Q3QkXCng=;
 b=fJToL+IiYSftRMfNkq+dh6lJXfXwsnJykBCBJOi6ueI0ydXItIpBtpL3
 ivGHKuYD5IQ/+7WwBtbQ7aMflCpYbkeUphljnjFUiBGi7SQ+WUkPXZQ98
 /1bnObQkbPPrFuELrlTQm22a9VHH8ebqgFGJluAT0RXFeTSm0U8bAKvTw
 O0PY5L7lnhIVKv84+b1pOapbiNgfwGtlFSEWjmj/4uKIpWmGR9tlY6oQG
 hw8h3K6GPumQteFt9D+FjTOCSFXwQNlu8yZ6r7v5TZ9hMQdI7RGaXz/+O
 ImgAx+4X/Rs0AWIUnpK7ADhR0M+erAbX+r8UCnd9iSk+/wVuvXLABL0Dy A==;
X-CSE-ConnectionGUID: uFaWzkGtSGucYtYytcbgPg==
X-CSE-MsgGUID: YGS1jeQ+Q2qN1bsESme3TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1555304"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1555304"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2026 23:55:25 -0700
X-CSE-ConnectionGUID: 7kz6PKHdRS2ufNMymHQxNg==
X-CSE-MsgGUID: 6Uy+p3MVTrqQyc8JMR0t0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4206542"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2026 23:55:24 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 25 Oct 2026 23:55:23 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sun, 25 Oct 2026 23:55:23 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.22) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 25 Oct 2026 23:55:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gPjfBKcU2c/6/upf2YGMXnUebYrbAWrqdajzqBHk7JQcjyJ7yCqPWvssEM8IFIsV4DL1f3cR3LJ21Ohqb+qu2Qbk4c9STQQVK5+6IDmCFgrjNQY4YzsG1PCLIdHH6AY0Nuwyxy+YhKTyHyTgc5hO1+bf/ADz+z2Wk54SlZt+k5JSD7ikH4xPZHusyhEa8/oU1NbmlhypUQG3Nh9vwkMkjLgG7oRbG+g11kCuipoC4RRrLMMujJ2m9/ur040jtIhDZqp8HDTeujCQRYaS/oBHP11uYmftx7wt2MWfryrXrzZd7rIEcaOrT7XeRZd9zME1Km7s3IDF5D8GnSL4vu9z1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RGCPp+bNUMjEtsmu9KxtS4FtIUyNi3zmnKpceQZaGLk=;
 b=uIT4ThDhLJIniF1CdTX9dDctHMNOB/Z+1HbXh8KsxLih85/JKDDnCu83JgKXKVORBigpPv4FyOueS15C03Il9uOS9Z+gtbVQZzc8T21RR+93cjPv/iEMXoQcYKVGAXsZE1ctXlfqrKTxs2rng1JLElMULs/0bKv6PRFTkG8B2TpvE8cWRHmVSn6xhP9Lun/djnCKMkDw3zs0QL/PmV7/9spYMa7vkPDUfe7hkSBsZy4MirZUaiGUoC5rxt1Yxid741fFG/xOnOGkYOlUjEZjzpOrFyiG3czj2gY293SSX7jasBqDjyTvJffQ7lFvozNtDD5xOXcV9rshZudMm5e38w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by SA1PR11MB7130.namprd11.prod.outlook.com (2603:10b6:806:29f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 06:55:20 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 06:55:20 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Kumar G, Naresh" <naresh.kumar.g@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v5 5/7] drm/xe/guc: add TDL, SLICE gfx registers to capture
 list
Thread-Topic: [PATCH v5 5/7] drm/xe/guc: add TDL,SLICE gfx registers to
 capture list
Thread-Index: AQHdYrTyrRaHRLb2r0C5ZDx8E5i7brcPaF8w
Date: Mon, 26 Oct 2026 06:55:19 +0000
Message-ID: <DS0PR11MB87186AC5A56ABE6374CCCAB181612@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20261023060554.2643515-1-naresh.kumar.g@intel.com>
 <20261023060554.2643515-6-naresh.kumar.g@intel.com>
In-Reply-To: <20261023060554.2643515-6-naresh.kumar.g@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|SA1PR11MB7130:EE_
x-ms-office365-filtering-correlation-id: c7c57ad7-7bc7-416f-b9bd-08df332e198a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|10070799003|1800799024|366016|18002099003|22082099003|56012099006|4143699003|11063799006|261021123027099003|10067099003|261009223027099003|261021121427099003|261022105027099003|38070700021;
x-microsoft-antispam-message-info: 6snMqyudrv2fZ18pKZGm+uK7h1f3BKeWTo2QLK008BSZHuDdPp0I+j0Dzz7/kqr3rDhnSX2F6bADwcw4s9w4lOh68sFFfwLhskKcUJcQM2+p8hp7BvlABD/FMS/vrNqzSZoCW1OGVeBopQNNDSprMRqhA54ckLP9Lfk72MZmSnEc/XZ3pejJS8JSPcBQqHjHkKTGXu+wiHvIlFdTaGVbZJvZZ4A6H2iK3IGqPzFT7odFAmKjFl3xHAUs3Jd6JS3QGsTv5A2BeLAj2THHtXcOWSSKhRCskoLclhPHwcUwOEzxUlERDWJv7kiyMi/bKeKt2Jc1LTrNH6P7RL4Z/DQaKb4r6FKU+zmc8hyLmHQb/OSb+/aAvpXPsZ/nUI3nOgD7bGr2nOo+i0YCOfJ97rwJH5jI/vY57nGMD8FmYrKl7d1IPLSwbmtlRe6fHrqYtKFiV+OJCPf//qr8Rs6SDt4RzGjFYj9GfXetsAUdAbu4fJrqhyLRK9Mtoo/Lwt3smixOTraiKfwz4/gVUuQMc5kneOGPB+m+zxPSY5Ysyb0zu8CqIO8Hypqo/8jYegpkd0W8kibsOX7My8bUbu3G9vgsjxT09esq9f12ExSnhNOincRXGC46l3sK41Qq6uDYOZj07v/GlCXPFJIHRk2Fw+9FFegTr5NsQ2BFksCpxCTwRCKrYcdJhpjAa1EsZTVETkpmBKbkCDxpgyNdUCWXviHR9PXuwv97jVdjA2pjFPgRVOw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(10070799003)(1800799024)(366016)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(261021123027099003)(10067099003)(261009223027099003)(261021121427099003)(261022105027099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BgBbvNrhPLgpaFYWpKA2Na8Hef23O1GsUkr4tHFUxLopiilQ0DtYzE3N4dBF?=
 =?us-ascii?Q?FlbKLG1GnmR+Jz2CK/U5Xs7iDfcvl6o4ubd3RqmblnDpm3BHQLoDScXCPd+K?=
 =?us-ascii?Q?/c1xeqFjA9Rzm6KedYAJzNaJnV+6iaMK/bqu1OvUHsBfKsMg2gX66gFVSrBa?=
 =?us-ascii?Q?//RZWfG18OYYVGWceqBeIeZGSulQIX5liJpCFwr2NK/OZTy7amw8GaxFsob2?=
 =?us-ascii?Q?+Q0jyMLM+1Otq27/qOwtA3AYfbTM3KVJ6NE9b9b4gHRNLaQAZs3WQUOGukUh?=
 =?us-ascii?Q?da/DpxoL8CAi7VrFU8/CZ8HxL/u7kb9/rOgP5wOe2Imd0pfe3LH8g4X2qeZf?=
 =?us-ascii?Q?H+LwCVeUBUKKfZEjdxCXEZSAhPu+wkEsmcmXIsbvVbEiStJzNy2aUps37/kM?=
 =?us-ascii?Q?AuorQ4CCDGs+fkuQenvdB4gkQ4pl/WrIpaXy0ZM0Z7+l7Kz2ilQSmPgrgDov?=
 =?us-ascii?Q?y0VSukS8XBylPqODpSyqkVH5vRyfcac7mavJrsFO53H3hBLk3JaokjK9YOjz?=
 =?us-ascii?Q?X+gNLyvy8cAcHUglo8caf+CN9Hrc/Unm3QdaVq5/ufUHOLEaqqDJhyhR+n17?=
 =?us-ascii?Q?9VxeiAZKZIDV7LXDE3DNh0HQhwwEOatHrXDRtpFL6lgdq3A9q83SBzYK/f7g?=
 =?us-ascii?Q?vEwGIFX41W9x0nNOnyDWKSjfiUGCQ79WMxeKcOwCIAN3zfWRbUKcmf+g8XWl?=
 =?us-ascii?Q?YtWUaj0Qj1zHOSkP8rkaSjXHhIFUw2ae4t1qBs3w4GoCcQf06eXjfxJ6COIp?=
 =?us-ascii?Q?zUfsHJQJ5mQx982pCHC8WC52SlbKZqEB2EU0weMqXGODzU6ZJM+p9NlRECke?=
 =?us-ascii?Q?7fkJxi3X1dxfSDVuBSBAP1cIawGFj0EaMSX2pIc1HHMJZPi3LOUM7axG8hJ0?=
 =?us-ascii?Q?rrK06l92TRO9Wni2G1hI7xq/KmMVVSNq4lNRe1iyzfLDGTMVTYmY6zknLFUR?=
 =?us-ascii?Q?n+oUbWQHmpl4S1A20+XEgjk+9UHMhxw/GWKBcgbsM7eHctgF+l9eabwkKiup?=
 =?us-ascii?Q?kZnEyPZw2K0guFS6LJD7uJ8U4wFjYedCEAtotDk/w7AGYBLZOYD9jYn2Uoar?=
 =?us-ascii?Q?OXnHkcX3r2pmlTos7l27YCSSE1ffIrrbPlKe29ZC378i4jB5Se3ubILmFea3?=
 =?us-ascii?Q?5wQqKTsI+83rHh8ywUOGZ8KUXhQriSSqJLu4huvDOnv2lUniUCt8c6YIpkyx?=
 =?us-ascii?Q?YQhnoD8dFJN4oMLa9KGiW9LfUWgv3CLzo2jDjSQlwF3u4wrU5D7pCdumkFKN?=
 =?us-ascii?Q?z9keGO75Ft2g4/IL7GmSzTGMobH1bq1+vEZihnow0GOeGe6lEOS54z60HpIq?=
 =?us-ascii?Q?VXxMSXpYJ/AngDIfKP9kryTzhRtMoUFryFCs7NZXM1PConx7Hq+d5h9+e11G?=
 =?us-ascii?Q?dRW7UHm8FVZSKRPStvrN116pWgCKM6o6dnPHVZoc5+g1z7FC2ineGWFK11Kw?=
 =?us-ascii?Q?NdphYOVDNxcOkE0t6nUVvXudCREh0YM59huR7TbKxchJKZLfazleCdRD3QHD?=
 =?us-ascii?Q?ymmRR2QWYhq9J+tsD3HFSAHF0rKNuFq57YLCs0mun0qmquCUUWG5ncg9C85k?=
 =?us-ascii?Q?AkFYTmzquGiotxJ58++DTV+dZDJZnSP7NfOGQK997XgJoovi2hpy7SMucnAl?=
 =?us-ascii?Q?c5n/nX62a9oI/dFG1CZM6OxlkGvArW6Sly+U4s2Rp5qD9vOnF7GefY9nKmVL?=
 =?us-ascii?Q?C/4EgVGaRIhv5tA6+ALtPOGTst6mvJV03/UsVICTY4KHzyN+kTO7w+VE/Ec6?=
 =?us-ascii?Q?xIbBueQTxoo3H3In3G69OH/UJQqDQGHJSgVYxcGHMGsAjZW4yNuisn9nUcR4?=
x-ms-exchange-antispam-messagedata-1: CVv+xNBaGvRTeg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: QkkXw1us3dTVSW2+O8xi3SeCR58FE6AENEeTurg7Y8tC0+/Iei8866VJzw7iGtdUEGzH/NETTROv36dDd96/viwktziItsBT5ej7XRSeb2R2D+6u1eUxFrv++2GkK9bd/X+SN3QA9sdg0f4HFsc6Wt0GugxdqrpHEYvPP/PdSyOcN1N1euz2NQ19V/5zejoOR6WXeb4gVPapxj7NUqWreWhBa5Q3GQzYwHfOrR7jSWJsUvOf+JVQFwUU4r5fBICgw5s6meOJ5YcSOZcGugR5utERUT9E16eQ+RH/DiuAXgerymqgaAdh1i+YW3HiiCn2PxMcPZaYqR7JsspNjx2Wrg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7c57ad7-7bc7-416f-b9bd-08df332e198a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2026 06:55:19.9533 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XYgxIG0rKMtH9P3QcUukSsCaaqN4UiYn4chPpGX6xSOXy1cFtu9+HGRzTjosbE+SeF4nTFBIqDDZ8rJbgNDb+jGyv0TNWZYIayMrc75mkI8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7130
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
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Kumar G, Naresh <naresh.kumar.g@intel.com>
> Sent: 23 October 2026 11:36
> To: intel-xe@lists.freedesktop.org
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; Kumar G, Naresh
> <naresh.kumar.g@intel.com>
> Subject: [PATCH v5 5/7] drm/xe/guc: add TDL,SLICE gfx registers to captur=
e list
>=20
> Add ROW_INSTDONE_TDL_GFX, SS_LSC_HDC_IDLE_TDL_GFX and
> SLICE_ARB_STATUS register definitions and include them in the XeHPG
> extended GuC capture register list.
>=20
> v2:(Sashiko)
> - Refactored ROW_INSTDONE_TDL_GFX to ROW_INSTDONE_TDL_GFX
> - Add SLICE_ARB_STATUS register to xeHP register list
> - Refactor commit message
>=20
> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>

With addressing register name comments, this LGTM :
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 5 +++++
> drivers/gpu/drm/xe/xe_guc_capture.c  | 5 ++++-
>  2 files changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index e9eb0bd04af1..2e4cb4957479 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -533,6 +533,8 @@
>  #define PAGE_FLTRPTQ_HEAD_GAMCTRL		XE_REG(0xcf90)
>  #define PAGE_FLTRPTQ_TAIL_GAMCTRL		XE_REG(0xcf94)
>=20
> +#define SLICE_ARB_STATUS			XE_REG_MCR(0xd814)
> +
>  #define HALF_SLICE_CHICKEN5			XE_REG_MCR(0xe188,
> XE_REG_OPTION_MASKED)
>  #define   DISABLE_SAMPLE_G_PERFORMANCE		REG_BIT(0)
>=20
> @@ -597,6 +599,9 @@
>  #define EU_SYSTOLIC_LIC_THROTTLE_CTL_WITH_LOCK
> 	XE_REG_MCR(0xe534)
>  #define   EU_SYSTOLIC_LIC_THROTTLE_CTL_LOCK_BIT	REG_BIT(31)
>=20
> +#define ROW_INSTDONE_TDL_GFX
> 	XE_REG_MCR(0xe580)
> +#define SS_LSC_HDC_IDLE_TDL_GFX
> 	XE_REG_MCR(0xe584)
> +
>  #define XEHP_HDC_CHICKEN0
> 	XE_REG_MCR(0xe5f0, XE_REG_OPTION_MASKED)
>  #define   LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK
> 	REG_GENMASK(13, 11)
>  #define   DIS_ATOMIC_CHAINING_TYPED_WRITES	REG_BIT(3)
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c
> b/drivers/gpu/drm/xe/xe_guc_capture.c
> index 3e99aef53b46..6a20eab0f820 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -376,7 +376,10 @@ static const struct __ext_steer_reg xehpg_extregs[]
> =3D {
>  	{"SC_INSTDONE",			XEHPG_SC_INSTDONE},
>  	{"SC_INSTDONE_EXTRA",
> 	XEHPG_SC_INSTDONE_EXTRA},
>  	{"SC_INSTDONE_EXTRA2",
> 	XEHPG_SC_INSTDONE_EXTRA2},
> -	{"INSTDONE_GEOM_SVGUNIT",
> 	XEHPG_INSTDONE_GEOM_SVGUNIT}
> +	{"INSTDONE_GEOM_SVGUNIT",
> 	XEHPG_INSTDONE_GEOM_SVGUNIT},
> +	{"ROW_INSTDONE_TDL_GFX",	ROW_INSTDONE_TDL_GFX},
> +	{"SS_LSC_HDC_IDLE_TDL_GFX",	SS_LSC_HDC_IDLE_TDL_GFX},
> +	{"SLICE_ARB_STATUS",		SLICE_ARB_STATUS}
>  };
>=20
>  static void __fill_ext_reg(struct __guc_mmio_reg_descr *ext,
> --
> 2.43.0

