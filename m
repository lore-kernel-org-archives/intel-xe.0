Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F91C25B6B
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 09:35:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D6C10E124;
	Thu, 26 Oct 2023 09:35:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87A8210E124
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Oct 2023 09:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698312943; x=1729848943;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+6XtwmdaO0KHJ5lIfPnyEZsL7reG0f/1lZ6MTq1fzYI=;
 b=hTsoAgbLT53TWrzeIfF0oUdb7x+u7RQdSrLbblAlRWYR7HimxfgtUcPX
 HriYPFWSOjHzpw7CjE10DeG5ZuNEXwQ6hCCkc1u019ZrNgA1wlCf84gXm
 twPC/ETzOpV+vWAuC7IR9VOc5GvC9d+3T0zk00umT7PBc0ji4BflK1FGO
 RxmKg0vai/bZdwMIWgoY89yMPcSf3VChlO40nfVRdpKwvgnz5VsgOX68u
 KWIB8Qt5wH23tcO2BZyG589n1VVTBqTCmVjKVQjyXPxv0mp57vsf9YF2d
 PMgRxAW/5W03llLuTc/Udj4XbhsY8avtYC94tzZNa6BbCBl5xlxPMOD1q g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="367712157"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; d="scan'208";a="367712157"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 02:35:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="902832924"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; d="scan'208";a="902832924"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Oct 2023 02:33:16 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 26 Oct 2023 02:35:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 26 Oct 2023 02:35:38 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 26 Oct 2023 02:35:38 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 26 Oct 2023 02:35:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lcL/aX17FpZSMM22PSbqbU2xyNarBw/Sx7jDef5dslK5Y9ipO5PgJ9U1uosk7cTZk3UtYQQ/uiGx5VQJTGhc8uAbSeJjauqeAaT1aEpXrsvm+8lIX2MtL7EsQHTEu5ZC0CQ4OAdaiwsDkIkYnItDQ/AaTSbgu9WEu3CLlV8gwz/974U5r0Eiaf7O7ZhKC2xbX6uDscGV2hhpIUilnBArTilHHU+V+MjRqaTpDPPB/pCl85kx2pOUPhhKZWJuqIOQ1nlCErqaUim3YPt9u35y5F1rovT1Xy/skegeSJlSOAGaTUmpTFSb40I2cOGcL/sQcOCgKavkDdRfwTXP1IL1pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ir1JrO2TYmafN2yTEofgg4nWGUgU3vZ+fAE/PFwWRd0=;
 b=Z1RiCTWscPDnsIFWCLuZTgsNGOo3QUPMVKCT4HsYM+F3W4g1ER/rsO7NQU1c3ujqmBlA2ZDuerfNbFOsESooKXsaUskhTyTSYhkFTTKbvnlaKoYeyH/xsZiDDF5QAMTCAo34InYG8xDj+SOrhq0KrqIkChmhJMWi93Mmf24W9ClGxOCJXxUS/HIP0x1kkG6bsNLIb2OYRJuX18OOZIXXi6Zj5ZlBqbFHd+gNo/UWdoGKUPLvN3+72Q58HU5jr7F42jrkMy+xMD5da2Lwa3cbxeaOuynAP40ycJ6RzvOx+2xSOck2zbkcB9a8EoMRT3GCtXU3Xl8SuYIg0/RSkLwZCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by CO6PR11MB5634.namprd11.prod.outlook.com (2603:10b6:5:35d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Thu, 26 Oct
 2023 09:35:31 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::413:a622:bff4:bdd6]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::413:a622:bff4:bdd6%4]) with mapi id 15.20.6907.025; Thu, 26 Oct 2023
 09:35:31 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH] drm/xe: Extend rpX values extraction for future platforms
Thread-Index: AQHaB1z3h2qHKRb6n0Gh7Sg2Qcm2a7BavheA
Date: Thu, 26 Oct 2023 09:35:30 +0000
Message-ID: <CY5PR11MB621180C091B9D1AC377325DF95DDA@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20231025161201.1031963-1-badal.nilawar@intel.com>
In-Reply-To: <20231025161201.1031963-1-badal.nilawar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|CO6PR11MB5634:EE_
x-ms-office365-filtering-correlation-id: 9c44166c-aa06-4492-cb5d-08dbd606e570
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PMP+G+xgrIyx1+a6btjQbJ6lyD/1wmEAkVC8yAMT0+fmHWEaz2Gae+lDMyQFtXNGu8WuqeHA8IP6ft4q2LR22k/mxsphDoCa9CDJ5DC/3PjAYRtVxM0LMQevWYi/r3wgwZDb+d4k1tHGkRdQiU69mY6itS0Ywhl+fjr+SkLYGiQpFp4zUZfTkU3jXnBDFYU00g7QldA5GjuDaWCa3J3Vez65yS4bs2v2rVSLpKLqE7TFhnqviMg8iwbjTj4YmUDQB9V14ygZB639DLzbCcHb5vKItBoVvckY5aHIQnENqB6oWLXxhvhjfIq/ulqfrLwleO+n8S5DzDEJNZ/Jq0wZ5XpIXjjfpxjzemAB9ilLFCQShlfl2Baw9Blar9CBXsOfk3JrzvhWKiAhHcK0cRFrd55YaL4iprp3s6m5XEfAs4CHNcLX4z7EUrkCPv1QqTbI/05SMZqChzLn7lyUK2hunQnuCXa47jp8H2Wd+uCHiMhSmv47JNLCRUwRWT2Bx5icU6MCLs+IynHsGXH0qOhxca2N1NRIYchqSOMTOatM+K7dg2C3q7C79TYJCgTIxOVr1nnaVWpXxvofoJzwD1O4B1oxA+ivpCiin22CEG2qXH+oRp+oKw48M4V58TmuXSBw
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(346002)(39860400002)(396003)(136003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(26005)(110136005)(478600001)(7696005)(76116006)(86362001)(316002)(6506007)(54906003)(66946007)(66476007)(66556008)(66446008)(64756008)(38100700002)(38070700009)(33656002)(107886003)(52536014)(2906002)(83380400001)(122000001)(71200400001)(8676002)(4326008)(8936002)(82960400001)(9686003)(5660300002)(41300700001)(55016003)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QvMgZ9j19DZqSbwE8Ubi/a9qgveBHelAolMoN7lG62W9VGbKzj9nvDnDGQea?=
 =?us-ascii?Q?pYJ/zv+ABTF5fnZeA1i26Qybke+aLES6khX2mmBS5ygQx5mOLqvlFeQ/x+6Q?=
 =?us-ascii?Q?DionwChEuWUfrioh9HzQeg0hgnJ9xz8trumGkWdBVgGePXEqYq8GQ10U9UpS?=
 =?us-ascii?Q?5sV3Fkxoqdv1k8fgXMqcNmpUkV5WnL+WX1r0/S3165W8wrp3mkU7rRxviAJe?=
 =?us-ascii?Q?OeOWrth/aZjb+xb1K7VxxERRPIaguakTC3pDmyQUDIm109mL7rRSMydTr1Po?=
 =?us-ascii?Q?l8Zj25MGCu4kVIZCkGOcw5mo3ZwgaS/yA1E+JzRtsccf6fTccwi5tXpOpUMv?=
 =?us-ascii?Q?YXD1eJ/WAryOiX2FWKKg1UIV8mgShG5dLsH1a8g/zdBbMhWrc53NYx/eq6s/?=
 =?us-ascii?Q?MJP8jhfe69reFPuzLWef4dIvVmlgEODcDHZ/cJt52ZnqiisYM3kLo71dp80p?=
 =?us-ascii?Q?0gZ0GJZugCWcjJtcoVJd2qSZfcoboNIb6lTOGDZ3axf9zLtGFmXkTLixnpKj?=
 =?us-ascii?Q?pB7QcYlZGbMAPZ2Pg9cqsmjKNp2vXKGFNSxdoktXu5SYwG9U73y8pO9DFvC0?=
 =?us-ascii?Q?ptbU3Kgd9PuJY6tWawW4/x1u/gJsptkdBbaRb56XnNPTLcZemej1IknohgeN?=
 =?us-ascii?Q?JMFaQZuZJ6G6BBdXcjnR8u3Ks2AXBgQJz5TJtUt6qlJyHMrHjgxpXWdsSh0q?=
 =?us-ascii?Q?ZY8udyX2nkrllawR8iqWdzQF30dpSFDW+vMjjTeBqLtTRMHpwifcFSGJsRqc?=
 =?us-ascii?Q?mXgwHfnRMpOBVrcbT7P+IOzn2OjKCfsZ/MeyEaxqyqFx4lBK2Jfv9e1H0PZN?=
 =?us-ascii?Q?09FpeM2Ll+mTk0S/aJAXcBTo+/doHeJCTFJ0c9z5/S2SPOVRJ1VyQv9k6R2U?=
 =?us-ascii?Q?ARuKNRu095i42/8ZxQDUAyKNrAYUEyaKfDZ5w3T97UajWNw++1IuOEUTpTWn?=
 =?us-ascii?Q?b+QUewZ72/QAAWgbzNqkcqdr8wNIEY7CMTjkpkVDL5UVpdz8gjad5QJPjuCk?=
 =?us-ascii?Q?ow/UxBNYB5uIsP09P+fRf6FoEa27HCwEhFkG02TSPHMVs5ZQ2QncosHleH9K?=
 =?us-ascii?Q?WKftrDCf7q7P6cXcQJtaJnSWV6rrjw2Rd0k3KmiGbXlkwBN5+rBHyVoQxltr?=
 =?us-ascii?Q?oYD72gK45EdaM+dmUZ1t+zj0IercSAQ7+fimYdiMKDK70xzN8fwTuIZtmCtY?=
 =?us-ascii?Q?CmvBOXUkH3e9ulahA3u/Maqi/APUsUZhpOJwObkgp7/pVKTey/QsRT4J28C3?=
 =?us-ascii?Q?E8cCuhHKoFsy6mw9aPyb9iT1JFOAfrfk9eVqsojKVDzUrJ4ccKZfdYwdpP2G?=
 =?us-ascii?Q?pMc371B12pZUj0t6swJNKx03761qChkW+1+8BoWw5GGjY6PlH/2dfkrtR9ZE?=
 =?us-ascii?Q?/rmdV9YMGZ+73UNdDf4sxUE1ru9iFEQE9sq4hKT5T2NrXYgqrwpElnbWOeVs?=
 =?us-ascii?Q?BnW5dMbfDUD0a7a8g3Lap/RoWMiInNmgJ/563u4XKH+MdvfReusLmM5Uk2bA?=
 =?us-ascii?Q?q82ngdemCRp96Oe5Bq4//zw1NesmsZc87ip2Fg7g5AKwnPg0/SumFyg5L1It?=
 =?us-ascii?Q?vQj2PEkHYfrS3JboMXp1igZ4P7t3oq6MRUG51E8D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c44166c-aa06-4492-cb5d-08dbd606e570
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2023 09:35:31.0074 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0fmiPfSHfuNiTK+TFJZ9k5aV/WVV8VH3eAMxK0mdzQDV5TuXZ/u9ThdDiHKNuzHvP55R5GXmhwmVLRfl7f9+3svE4O0djKxLTG51pp0y7+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5634
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Extend rpX values extraction for
 future platforms
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Nilawar, Badal <badal.nilawar@intel.com>
> Sent: Wednesday, October 25, 2023 9:42 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Tauro, Riana
> <riana.tauro@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>
> Subject: [PATCH] drm/xe: Extend rpX values extraction for future platform=
s
>=20
> In existing code flow for future platforms i.e. >1270, the rpX (rp0,rpn a=
nd rpe)
> fused values are read from gen 6 registers.
> Which is not correct. Unless specified gen 1270 regs should be valid for =
gen
> 1270+ platforms as well.
>=20
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_pc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
> b/drivers/gpu/drm/xe/xe_guc_pc.c index d9375d1d582f..74247e0d3674
> 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -340,7 +340,7 @@ static void pc_update_rp_values(struct xe_guc_pc
> *pc)
>  	struct xe_gt *gt =3D pc_to_gt(pc);
>  	struct xe_device *xe =3D gt_to_xe(gt);
>=20
> -	if (xe->info.platform =3D=3D XE_METEORLAKE)
> +	if (GRAPHICS_VERx100(xe) >=3D 1270)
>  		mtl_update_rpe_value(pc);
>  	else
>  		tgl_update_rpe_value(pc);
> @@ -365,7 +365,7 @@ static ssize_t freq_act_show(struct device *dev,
>  	xe_device_mem_access_get(gt_to_xe(gt));
>=20
>  	/* When in RC6, actual frequency reported will be 0. */
> -	if (xe->info.platform =3D=3D XE_METEORLAKE) {
> +	if (GRAPHICS_VERx100(xe) >=3D 1270) {
>  		freq =3D xe_mmio_read32(gt, MTL_MIRROR_TARGET_WP1);
>  		freq =3D REG_FIELD_GET(MTL_CAGF_MASK, freq);
>  	} else {
> @@ -680,7 +680,7 @@ static void pc_init_fused_rp_values(struct xe_guc_pc
> *pc)
>  	struct xe_gt *gt =3D pc_to_gt(pc);
>  	struct xe_device *xe =3D gt_to_xe(gt);
>=20
> -	if (xe->info.platform =3D=3D XE_METEORLAKE)
> +	if (GRAPHICS_VERx100(xe) >=3D 1270)
>  		mtl_init_fused_rp_values(pc);
>  	else
>  		tgl_init_fused_rp_values(pc);
> --
> 2.25.1

