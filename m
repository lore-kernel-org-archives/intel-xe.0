Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087A5C7619A
	for <intel-xe@archiver.kernel.org>; Tue, 11 Apr 2023 19:03:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBAB810E06D;
	Tue, 11 Apr 2023 19:03:31 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E0C510E06D
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Apr 2023 19:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681239809; x=1712775809;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WoJmmzHoQHnMreNXL7dFLo5fALdAVElCsC9TxVhZNX0=;
 b=BBOygO890yeSZtiICVAouXFg21TTqC+4KcS59McYceteO9+JUNg9owk8
 ZxfhOs5b16o7MAl0luEf5WPPaFj5eDx3Ee9wgthz4hogy2657Ch/cFBsI
 jwrXfqEjb5O9otAQOAzLdi7uPY5NZZj+msKYcbUpD8NIZv9ng3vsDJDjD
 pNw8d3Lq7i6Xl8jbJqrNn61CUEAIZYTUEUyd207ENiRnNgviGPOI/S5Pj
 bXeUrykv4TM6+IqJtInbHx8T5xNAlF5Cvj20rUNHRFjWPT1Wuh2f71IQX
 hDUHoIu2HJN+qdBbL9xYSsNpMKIsPRpDo4LNRfbVUtBu6wqrooaSpMNgG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="342470379"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="342470379"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2023 12:03:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="934834679"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="934834679"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga006.fm.intel.com with ESMTP; 11 Apr 2023 12:03:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 11 Apr 2023 12:03:28 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 11 Apr 2023 12:03:28 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 11 Apr 2023 12:03:28 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 11 Apr 2023 12:03:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IjwipUzAIezYgPQaO9tr4r8YLGRT3CkxpFurn4Fm2+ADakRFQbxjiIUW3QwftVoktYPUK7Tew6JiEtFshMyR+WIMXCnWj/QQ7C4ZqvDqRe04O5iVwt3OUV4pkaYgeZ2cr1WkefqtAOBD+SHpl1rKAi5jVkUG/pID9P4RKGfmUQR88PUn0WkuBWdBjDt20AxgwYmbfIw3t7VFY3WIE3jfc7KZtX/LhAxrHyFaqU8+2otU1C7ukkq6wswrTRvtfgz0p3PlH6gKQ1CKrL3T3zF11UB5LomdJ0syJJSMjgxi+8Eo04il0/mzhZa2y/ZcOd2N8X+O8QbAGi14hvge936HYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o8uD1N88gcbLsaQg2llHFwUOabAOHNC8umB8Ridopz0=;
 b=VAulfhavmdAVrN9vD8ovbs98O7lCt+bsH2yFe/69L5b6GistIJB6QEaf5VDRi2syvP9zuLgysz3tY+kgRwwj7hmhZPudUSIpCFgMLqsjUGz+sW1rYh+GylrPU6gvf+G14oEnoXWPTp06RgjA5HCZJBJDnXkb9XTF+7h+8N2ZaO2DRBISH6hzenPyYYa21LFL3hgzN2LVEvmIrq3kflBbt0V0w7g8AMMeRS7GL5UKypz1d1iI81eL+yGTylZIFe3tNecpX1kv4vWfTpeukXu1D2mY5BOR3MR8QYomtFppVLUYfzbdcirJ7yHVf9HWijoBvbXdco7Ieoi/7e9KDt05Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2SPRMB0011.namprd11.prod.outlook.com (2603:10b6:a03:4f2::15)
 by SJ0PR11MB6719.namprd11.prod.outlook.com (2603:10b6:a03:478::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.29; Tue, 11 Apr
 2023 19:03:25 +0000
Received: from SJ2SPRMB0011.namprd11.prod.outlook.com
 ([fe80::3d20:2a50:2d79:574c]) by SJ2SPRMB0011.namprd11.prod.outlook.com
 ([fe80::3d20:2a50:2d79:574c%6]) with mapi id 15.20.6277.038; Tue, 11 Apr 2023
 19:03:25 +0000
From: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Thread-Topic: [Intel-xe] [PATCH] drm/xe: Add Rocketlake device info
Thread-Index: AQHZa9b631j58/XoZkKNWuSaEhtm9q8k31AAgAACKQCAAWjqQIAABMmAgAApWMA=
Date: Tue, 11 Apr 2023 19:03:25 +0000
Message-ID: <SJ2SPRMB001131EF83AB12531CF016E6F89A9@SJ2SPRMB0011.namprd11.prod.outlook.com>
References: <20230410180504.2706189-1-anusha.srivatsa@intel.com>
 <20230410183726.r7hsj55yuqaouuyq@ldmartin-desk2.lan>
 <20230410184510.GV4085390@mdroper-desk1.amr.corp.intel.com>
 <SJ2SPRMB0011023861F6CB95DBF1A334F89A9@SJ2SPRMB0011.namprd11.prod.outlook.com>
 <20230411163403.ahqonzymovlw4ujd@ldmartin-desk2.lan>
In-Reply-To: <20230411163403.ahqonzymovlw4ujd@ldmartin-desk2.lan>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: lucas.demarchi@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2SPRMB0011:EE_|SJ0PR11MB6719:EE_
x-ms-office365-filtering-correlation-id: 54dd37c4-b472-4dd0-5fa1-08db3abf6d5c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aS7IbISg0fqXnv3QDzXtirQtw2a2C18IT+DTmzCuvqhN1p3VRWqgrs9bE386v+NpOzCJxVSGXZZs6emZUbiBn5uVS6pOa+q74k/rIo6YDfi5PuG6MdmSgATbGUxEna+JcZkhTPvvm4fcT1BKVGv1OM7yo3RMHHROtPpYPXDZgodR1Z3bDsoPp9UtJjqX/u9kHzHr/MJQdL0yUjZ7X1UT/Wh8hNKyVnM6ZHObVWZqnRaSpzVxNdAZRRqoLhcIYgYIXoHtUjIrFLjbBqviNizKoH4W21MdEY+XMilRuUNwjdg/KjOQroreGiLhqYskSNKjz+zT2vBHEofG4N9Cy68B1nSI7k1UJUS9LEJRWi+T+EQNyFs5dT4sDXvP6kPbUx6gDC5pPND1WP5HdEoAJSQSyBna9Gaoqt8QgY378KBsEU5F9drv3A0TU879omsJQC/A7VSxR3So1A8WUzZ3GL4k7L/QOY7zSFGSDAIAiyOX5VYkV5KUtBjfeqFcdVrZCg6dw9ci8WwTpHkQiX4j6Pq5phGFsMG4RocQA5DVPoGe7s5ZnKCVQxYoD3bQjtI/9Ao6T23HjXuSm7ym0MOnnQ0S1L9m8AfLtPIlsYid/XU1V/tshXdNp5aqneJlyg1qicHDgORukJqUt6oaglXH3EyUMkILbM2EHlPhjODMQ2n7xsU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2SPRMB0011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(376002)(136003)(39860400002)(366004)(451199021)(8676002)(52536014)(38070700005)(82960400001)(76116006)(316002)(41300700001)(66476007)(64756008)(66446008)(66556008)(122000001)(54906003)(66946007)(6862004)(6636002)(8936002)(38100700002)(4326008)(478600001)(86362001)(5660300002)(2906002)(71200400001)(7696005)(53546011)(55016003)(33656002)(26005)(9686003)(6506007)(186003)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8OLRLAu2IorLapw6+pe3CTAsK7KtE/yYzYYqcBWXUDXJDafUAB8PDTQeyzbR?=
 =?us-ascii?Q?kz1TloyGcxLKuQKBa5j1Zfnxs8pbGz0WYUZ63LX/uDF4Vi5zEVLOMllgo5ko?=
 =?us-ascii?Q?0NIm0dEG6sciU+BhrK5lisdjx52TvMIAZOG/WpKXUIGJ7LA4pfpW4MD9iw+P?=
 =?us-ascii?Q?cU2Yu0V+iDjeusmdrVGUDt23QXcqiVH3WmgtQl9ZpO1jntuPTZ89wVx1zr06?=
 =?us-ascii?Q?B+mT2Mh4oj7zO2AwuC7yAzNP3Uj+SqJdUiaz+gHuNLuSIOEOUDCw7towuJb5?=
 =?us-ascii?Q?3+TPmQnTUToLHHxBSDO4bvrvjUCkTB8yptYA4/0AF9+iNMBKkr3qvvcTE0VG?=
 =?us-ascii?Q?1AaCw3ChpMRLXqogBBQak+PlIFDvZxp2B+uVHgKM0R9gFQvqxge2KkPmMAA3?=
 =?us-ascii?Q?jsAiKKPQhNb/CnN5oHoVZsI4tlUJcyhOMn9Kdv0MJ1Y0Nnv1Q8GsXqg4HShP?=
 =?us-ascii?Q?9pavJgV2ebllDpVMXtqVRBvJtu2BeJ1tt8LJ4jeXT1ug124dCp1hhoh0Vsy6?=
 =?us-ascii?Q?ZxGY9gF6IKq9SkEe012vDUluoicU6kitd3T1oMI2nfsvWzdmn2Xwj/A/0uhn?=
 =?us-ascii?Q?lQlPYNm2frhKwnCYN8MsRzZC4VJqj8VTeAOGA0GLpKvv8YhG5alcgfVrbDMH?=
 =?us-ascii?Q?l/SxYJPk8nHQgkuQcxIglQjbt2L8ncMj25oifImHh6v0o9HwINq4TxjUodAU?=
 =?us-ascii?Q?TdMmMDtHwNYi9gOYVH+VTCa0+XIGTndVwTPSlhl3exNhyMZcXQUg3i8mbyar?=
 =?us-ascii?Q?ZahJpiBGRkxLvmjiyYF/9wQXiIgd9rFGe6UEsVN2sD3EPILLVHlEgVqWQIfK?=
 =?us-ascii?Q?7rxo6XEUFWPtSAWAJhABrnnTWTQ6OczzsaKrJiiFbjt0X8PRb90UDOS+m6bZ?=
 =?us-ascii?Q?qpZjwhl/s8qZtO2mqYuytFnBIW2EZeZ+KGX9taA64HJ8V3frtxU5TAZ+HmVy?=
 =?us-ascii?Q?oB8VodgcKWz0ZAP12+7qRvO+b/xSZ9fGXLgx4WR8fdEUXaZU/MYkkgoxedke?=
 =?us-ascii?Q?KL3EbchV3OeGA5uNaVFf9xcC8fS5YSiszzcaiLSLM7O7yYY0z0D+ea27QBD/?=
 =?us-ascii?Q?KPmImrsgEYUs0AtPUEB9GDsZq6cYFXuNCDgHa5EGqnJS7h5ADXqV0CI8CLi2?=
 =?us-ascii?Q?eWS1uph9TvE3m0pi8f5Rr/fVKzvyntivL+3QQM9GGy0v7AuIVqMwWMFcasXy?=
 =?us-ascii?Q?HKcAYqr5N3jViP/x467Aa20j+HLej0LIZxfZyChdq19h7jD0GYuhYpFJ5uZo?=
 =?us-ascii?Q?VGBM+ScjRhJoVHxfW7yf/sPl+Pt+/zSwVSwmn4HjIIhtU/xiuOjKbbJSv0cN?=
 =?us-ascii?Q?nP0R1o/C6CVSX8y1p+DEXI//G0pxJLIBoY36rToDsU6ggI/ajCCDuXos3hD9?=
 =?us-ascii?Q?naOOcDtpfHOAWMUxjpgb9NIVaQfePk/pAcGq5i+B+IwZh7x6GfuyM3FcnyPo?=
 =?us-ascii?Q?4bzITSPyJlIAvujxKpP6Q7lyDxWuoe78FvyeMvlbXiV5Vb4XiLl+SDHWuouO?=
 =?us-ascii?Q?T++8OrOST0VHTwDKI4hGnzXo+sa4WFWa1TgWNUl1SlHMVGKkphbaWMHCn5J/?=
 =?us-ascii?Q?MKvy5hNxk/z2X0cvQCt+5OlhlM+y40hp9etHudl6wC14bleZm8OZkftjMYl4?=
 =?us-ascii?Q?EQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2SPRMB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54dd37c4-b472-4dd0-5fa1-08db3abf6d5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2023 19:03:25.0880 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9wJK9YcR3anxHn0Gr9fSh3UnCm9JyFERnLUM9eZZqoZwpP1Tzk4CQixyFlRHPN8XwIF61ltjfpOKkuNF6YVt+8KgtC3UkRWGb5Gd1A4KIRE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6719
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Add Rocketlake device info
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> Sent: Tuesday, April 11, 2023 9:34 AM
> To: Srivatsa, Anusha <anusha.srivatsa@intel.com>
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>; intel-
> xe@lists.freedesktop.org
> Subject: Re: [Intel-xe] [PATCH] drm/xe: Add Rocketlake device info
>=20
> On Tue, Apr 11, 2023 at 04:23:02PM +0000, Anusha Srivatsa wrote:
> >
> >
> >> -----Original Message-----
> >> From: Roper, Matthew D <matthew.d.roper@intel.com>
> >> Sent: Monday, April 10, 2023 11:45 AM
> >> To: De Marchi, Lucas <lucas.demarchi@intel.com>
> >> Cc: Srivatsa, Anusha <anusha.srivatsa@intel.com>; intel-
> >> xe@lists.freedesktop.org
> >> Subject: Re: [Intel-xe] [PATCH] drm/xe: Add Rocketlake device info
> >>
> >> On Mon, Apr 10, 2023 at 11:37:26AM -0700, Lucas De Marchi wrote:
> >> > On Mon, Apr 10, 2023 at 11:05:04AM -0700, Anusha Srivatsa wrote:
> >> > > Add missing device info for Rocketlake.
> >> > >
> >> > > v2: Also add abox_mask to the device info(lucas)
> >> > > v3: rebase
> >> > >
> >> > > Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
> >> > > Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>(v2)
> >> > > ---
> >> > > drivers/gpu/drm/xe/xe_display.c | 11 +++++++++++
> >> > > drivers/gpu/drm/xe/xe_pci.c     |  8 ++++++++
> >> > > 2 files changed, 19 insertions(+)
> >> > >
> >> > > diff --git a/drivers/gpu/drm/xe/xe_display.c
> >> > > b/drivers/gpu/drm/xe/xe_display.c index
> >> > > 5fab5b9fbde0..44697c0f7fb5
> >> > > 100644
> >> > > --- a/drivers/gpu/drm/xe/xe_display.c
> >> > > +++ b/drivers/gpu/drm/xe/xe_display.c
> >> > > @@ -488,6 +488,17 @@ void xe_display_info_init(struct xe_device *x=
e)
> >> > > 	case XE_DG1:
> >> > > 		xe->info.display =3D (struct xe_device_display_info) {
> >> GEN12_DISPLAY };
> >> > > 		break;
> >> > > +	case XE_ROCKETLAKE:
> >> > > +		xe->info.display =3D (struct xe_device_display_info) {
> >> > > +			GEN12_DISPLAY,
> >> > > +			.abox_mask =3D BIT(0),
> >> > > +			.has_hti =3D 1,
> >> > > +			.has_psr_hw_tracking =3D 0,
> >> > > +			.cpu_transcoder_mask =3D
> >> > > +				BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |
> >> > > +				BIT(TRANSCODER_C),
> >> > > +		};
> >> > > +		break;
> >> > > 	case XE_ALDERLAKE_S:
> >> > > 		xe->info.display =3D (struct xe_device_display_info) {
> >> > > 			GEN12_DISPLAY,
> >> > > diff --git a/drivers/gpu/drm/xe/xe_pci.c
> >> > > b/drivers/gpu/drm/xe/xe_pci.c index b92d8b5a391e..a81427019d02
> >> > > 100644
> >> > > --- a/drivers/gpu/drm/xe/xe_pci.c
> >> > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> >> > > @@ -179,6 +179,13 @@ static const struct xe_device_desc tgl_desc =
=3D {
> >> > > 	.require_force_probe =3D true,
> >> > > };
> >> > >
> >> > > +static const struct xe_device_desc rkl_desc =3D {
> >> > > +	.graphics =3D &graphics_xelp,
> >> > > +	.media =3D &media_xem,
> >> >
> >> > now it will have VCS2 as a possible engine. Not sure if the fusing
> >> > will handle this correctly or if we should create a different
> >> > xe_media_desc for rkl.  Matt?
> >>
> >> We should double check to be sure, but in theory the fuse readout
> >> should handle this properly.
> >
> >Hmm went ahead with the assumption that the fusing will handle the
> >engines properly. I will add a check in read_media_fuses()
>=20
> this is more a question than a direction to add more checks. If this is t=
ested in a
> RKL machine and confirmed the fusing for VCS2 is read correctly, then we =
can
> keep it simple and not bother with additional checks in read_media_fuses(=
). If it
> is, you should be seeing this in
> dmesg:
>=20
> 	drm_info(&xe->drm, "vcs%u fused off\n", j);

@De Marchi, Lucas Seeing this:
[  100.628861] xe 0000:00:02.0: [drm] vcs2 fused off

Anusha
>=20
>=20
> Lucas De Marchi
>=20
> >
> >Thanks,
> >Anusha
> >>
> >> Matt
> >>
> >> >
> >> > Lucas De Marchi
> >> >
> >> > > +	PLATFORM(XE_ROCKETLAKE),
> >> > > +	.require_force_probe =3D true,
> >> > > +};
> >> > > +
> >> > > static const struct xe_device_desc adl_s_desc =3D {
> >> > > 	.graphics =3D &graphics_xelp,
> >> > > 	.media =3D &media_xem,
> >> > > @@ -301,6 +308,7 @@ static struct gmdid_map media_ip_map[] =3D {
> >> > > */ static const struct pci_device_id pciidlist[] =3D {
> >> > > 	XE_TGL_IDS(INTEL_VGA_DEVICE, &tgl_desc),
> >> > > +	XE_RKL_IDS(INTEL_VGA_DEVICE, &rkl_desc),
> >> > > 	XE_ADLS_IDS(INTEL_VGA_DEVICE, &adl_s_desc),
> >> > > 	XE_ADLP_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
> >> > > 	XE_DG1_IDS(INTEL_VGA_DEVICE, &dg1_desc),
> >> > > --
> >> > > 2.25.1
> >> > >
> >>
> >> --
> >> Matt Roper
> >> Graphics Software Engineer
> >> Linux GPU Platform Enablement
> >> Intel Corporation
