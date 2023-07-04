Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF70EB64D9
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jul 2023 10:14:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F9DF10E2C7;
	Tue,  4 Jul 2023 10:14:44 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1786E10E2C7
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jul 2023 10:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688465683; x=1720001683;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=1r8Oi2MSCSa7+lZAMnlmlvMuAG+XVc0+VSAO42MoWrI=;
 b=K+9v6oTr6rk3v5UpamVxHSFaPTkA8z/LT5aMASp/wnPRuD57DILDj1QU
 F1eIGuMS0krvzand1MDJU0nHzqT1L7C/z8l8zQXkzqUSudan51DoboIAF
 5MO8ELCIxdLfX9s8SBjiH06YHQOvCQLoo7J37OMKRtS8/5ajmxQQNEpkI
 8kaJ9fQelp7XJaiuZY4XlJkd2TC3nCeWWvH1X1OysMvrD6WBezOYxV8iC
 gx+27TEbg6yQz0uv6JkZ/rYvJZlGzdTu8P1+tbs5TaW18aRCM8Yy/plEX
 G/B6IlD6tBjfo2LEPPE/zpK58NBtIJt9m2qFbfL5QjtudObh8nIJrz01N w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="449458742"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="449458742"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 03:14:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="892825535"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="892825535"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP; 04 Jul 2023 03:14:41 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 4 Jul 2023 03:14:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 4 Jul 2023 03:14:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 4 Jul 2023 03:14:40 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 4 Jul 2023 03:14:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cp5ZqiHllMuKg5lwQ3ukEyVBYbHecmKqdpBbfR565ecGrFlxKALLtp0rGagXUieIXme2KWxg6aHgiQZ7nbWigbkSF8RkxrwgEuI7JhDD2brGAQs8xEscJcBeDlQIDUlSXK6sn8b4c2T8zz0C9nAwsOXYb1R+tKd55YlZEpwg9qybncQHEBw73Qttab9WzyM5OwLeDcPNiENlyIr4pnFx2ZJx8K2kqV5D+JRKMphpsHoZnRSIo/Ww2Zhme/hCausnboN+z0csmUm5+lmK0BdvCxDu/UXXo/9F3Bg6uKBagNg18weXlZE3Uth2OMvuU8nHuUmOzgzC25ekLSzp2UqpFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7SDKExY1m7QBGuWv7UzJEy3aCea3lP8Mio7pO7wbHws=;
 b=GcA1PP/RodGeDHmSiaXou5rS/nwsMt8MrBWpBTleqt8k7gS/TCc/Fy/BTPbHaxed3EuMIfvf3lkhIgh8lWwnDZLiJfSMpJt3OaHPQVLT+1QOIiPjel/fE2S6I7kEed1ODXxBEmjX8Lk67yVgFcipA7A2OliZIN00wBBr4zeifgpC4NCH6HlsbPL8BGoplvHw3oKSCl+IXo1B7v+2yeQ/35b+dXqOrpOlnX1G00V1otdXy/FKIIZ4ghPiPDqJmfaBcPy0yY+Z91/h5cW+tw+sbo1U5AAobIbYt5PFOTchH0Qh6YBl2bTbcyWtCNuokwSTgH7O6nCkiwd40XzVCb1Ajg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DM6PR11MB4609.namprd11.prod.outlook.com (2603:10b6:5:28f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Tue, 4 Jul
 2023 10:14:36 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::2bfb:7d63:f348:1a4]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::2bfb:7d63:f348:1a4%5]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 10:14:36 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH v2 1/2] drm/xe: Get GT clock to nanosecs
Thread-Index: AQHZqPFost5vpmNLc02Segh5wgRTCK+pYVNwgAANDvA=
Date: Tue, 4 Jul 2023 10:14:36 +0000
Message-ID: <SJ1PR11MB6204B29030FCE47C8201AE26812EA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230627122113.1472532-1-aravind.iddamsetty@intel.com>
 <20230627122113.1472532-2-aravind.iddamsetty@intel.com>
 <SJ1PR11MB62049A616B9C44D0F8708F2F812EA@SJ1PR11MB6204.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB62049A616B9C44D0F8708F2F812EA@SJ1PR11MB6204.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DM6PR11MB4609:EE_
x-ms-office365-filtering-correlation-id: 1e0f6874-c600-4283-5286-08db7c777877
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: F0ynzTBi5GrPKdbYKWi8LvltiaF/fgyfyaAwTNw2gk0ZLi7lGE3i9IckRc4FpL8CLUoalIguZKqZtpgsvhO3bUuEeL/91ve2lZpQzNeoc76YnsPdl4gQtoSAGTo+C91sbz8AHxvuJS5x/bFt55eVexTg6J1hhuLoPRtbD8JP3835yt9LR08snDlzkEmCd/bafiUbu2ohV28m44oaFZGEROCTK2Vjafx9lbrFu6eDas2ZfR+vRD24h+wvP/8CVZ1ppK5EnOoNQtZdugMR7V60PRlVYY/fKHMRa6JO3EePEPZdn2svzS8wl9tFhPYUq4xRDbslR19Z3M+o9x/nOyULCOx3a9jnUiG9vcNhDfLC7EQXjH7/v2eDQzjyeol92dt0Zj85CjhlhO2HVIhux0t3B79us/Hdv7RDhxgoW6U1u6BxWoS6JXI/hl+o4exLui+7pkLG6J+bnv/bDX2LgJHpeKWr4cj7FHuaelKWAVaPYOJp768aCrwQ+Fn+koNNfESvsTfR74g20XMBVU0Shz4/aLyRN/m3XHcQlaMsMwSSqfIxDOAo8ID32uNmPX7HK6+XZvTK2Ne/UBxFZ/Y+s+3MsrjfcZLduXpETYZNXIWQlEulHqt8gnlif8/9tgKnDl3+
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(396003)(376002)(366004)(346002)(451199021)(38100700002)(82960400001)(122000001)(186003)(38070700005)(2940100002)(26005)(6506007)(53546011)(55016003)(83380400001)(52536014)(5660300002)(41300700001)(8676002)(33656002)(8936002)(2906002)(86362001)(7696005)(71200400001)(9686003)(66946007)(76116006)(66476007)(316002)(66446008)(110136005)(66556008)(64756008)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7cSTHm12WjiD6h0CdXkOTmGlWapKXxOGY1My4LJgn4QbUm6nk6TH/PckFeyL?=
 =?us-ascii?Q?+KK8rxZ6T18J8X8GFAgInhIL6CJzmqlrzpQ+PxoKxbfeKVVbxHpObHv5s6Bc?=
 =?us-ascii?Q?qIyind1Kmca8rC5MX0M93ZdjETUkLY7ARo4EAnPePjnBjIUPBpIp/ZeqYQ6k?=
 =?us-ascii?Q?6yKpinEfFDRxqgN/A0mf1U6o+2LZ4bJuSpbytz7lSAJErAUmEQClI14vM/kF?=
 =?us-ascii?Q?balDrZ91u203dAEfEOGT0hWW0IK/1qJH4nqYSenvldbODr5e9Or4M8H8Mw/O?=
 =?us-ascii?Q?h+EH3S3kc4Bz6NXnWoxElXEqri5GDNOLuJg0KgaUUjBvUnfuhSmv7HYIKrL1?=
 =?us-ascii?Q?j880cmURKZvaCAbdmAq9snDT7X4Z3lkAsNqhEswwcSfIotD52UtecG+Q/6WT?=
 =?us-ascii?Q?TwaMQXuTSuhR7O969hWYFfShco4qSgECBIKIvYQEfbr5Pmm425ZpryksWV9G?=
 =?us-ascii?Q?7iaCUZf6LdjjMxCHqa+fb5K2gs3PUi22ChcHPsDKNhEjxADLBMdOfRrd7MHr?=
 =?us-ascii?Q?6bzDcKQFvqibOJXsUth+lRVal9/u/JlkUhSMKmNUslKWchW+Ocr0JjQnfAK1?=
 =?us-ascii?Q?mxnjF8OXiv0Ylnec8xGEdPO3p4WJcB1Y3wdDKllbO7cPLeVsSvP68N7Tn9rb?=
 =?us-ascii?Q?Iwyl/vWAnJlQdvmGV0+RFXgJ2g9wtvQOD9FgKTMsYfmL657e4lCE7PdlkEH0?=
 =?us-ascii?Q?3vUnl5yQpzKhdz8ikelnrlajKF858bJon8KkBE1lcHkF4LrI0ggs3WA/uDvo?=
 =?us-ascii?Q?Oj2Wtn8gN28GsA9R9IkdC8nrzMQEBXdVYCsETg1dB5bK7QYwFDQJbubdHVHw?=
 =?us-ascii?Q?LUX+MUSY3p8Q5nXuujuYzMHtdiYBfpB1lZn1Eh7adlIRExo1oaWfSX7XOAOc?=
 =?us-ascii?Q?jrFoRNZph+ur2nK7WZRIY7ni2E4rj+RKZQyXzMMtUPUMeiufbkx2DhzXiM0M?=
 =?us-ascii?Q?z3pBWa67eDp2sJPVidA1kBqRn07dj//+yv/uvv1PBqyF2YajFd6Vmg+8o3w7?=
 =?us-ascii?Q?pUvBRYW63j9HPML55Xit0oXbxammD4dfaTVjIt/cB3dpDa+Om9dEtXPfwH9M?=
 =?us-ascii?Q?OF2iFphHqrY2wljhHD9lihHXfVV37EHYYjfueypu4GNG7cMkUIteTaiL3YRN?=
 =?us-ascii?Q?o5kWXUZh/jE/XW6xsm1FG76t4uIWG/bbtUUA8A7pnJgk1uJcDVpUuwUgdBHy?=
 =?us-ascii?Q?gzlH+pnVvUztpMW1oozTDY6rW+II23glsmLCCr+gaRqOlR8GhdmKfqAZ+Z2T?=
 =?us-ascii?Q?3jmR/l/jq7uG7XWlGYFMWwYcyAWBLMwLMiYC8ITi1ZU8Z9riWgsGr5VSJ8Kq?=
 =?us-ascii?Q?nB6GvgmYU9C8Z9xU7CEamvmj4BNSHBGBI8CJsrFQGwrhxdMxUAD8UbyTgnD/?=
 =?us-ascii?Q?/7WJFADpeHGRSF3dTY5Qupaxy7HJUsZSw9u2a8DuQcU2e3tRNKLf16l8dnbU?=
 =?us-ascii?Q?vagprFiTHIlHjT4MevqlaUM5TWVsWyg29V3CVoGs5psDnVb5nzr5Q7CJCwV+?=
 =?us-ascii?Q?uZZvzYQCT4d4s2CJ0ejSd5oSI9FViZ7nZj8X2Ma4AjCIDXZLbG9KkE4reImz?=
 =?us-ascii?Q?8QFnMbMTzdve/cwTf+gOetjctFdeyC6O4944tjb8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e0f6874-c600-4283-5286-08db7c777877
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2023 10:14:36.7051 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2srt0NFchz2YOLExOi4hpeOs2jhXNLXE1bgQhMNkL/tkUtO3pGkftL2KMncUBstQay12MgM4S9OZT6Ntb4VlFg2TBPs+83SiFwmxB58B0ow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4609
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/2] drm/xe: Get GT clock to nanosecs
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
> From: Upadhyay, Tejas
> Sent: Tuesday, July 4, 2023 2:59 PM
> To: Aravind Iddamsetty <aravind.iddamsetty@intel.com>; intel-
> xe@lists.freedesktop.org
> Subject: RE: [Intel-xe] [PATCH v2 1/2] drm/xe: Get GT clock to nanosecs
>=20
>=20
>=20
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> > Aravind Iddamsetty
> > Sent: Tuesday, June 27, 2023 5:51 PM
> > To: intel-xe@lists.freedesktop.org
> > Subject: [Intel-xe] [PATCH v2 1/2] drm/xe: Get GT clock to nanosecs
> >
> > Helpers to get GT clock to nanosecs
> >
> > Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_clock.c | 10 ++++++++++
> > drivers/gpu/drm/xe/xe_gt_clock.h |  4 +++-
> >  2 files changed, 13 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c
> > b/drivers/gpu/drm/xe/xe_gt_clock.c
> > index 7cf11078ff57..3689c7d5cf53 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_clock.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_clock.c
> > @@ -78,3 +78,13 @@ int xe_gt_clock_init(struct xe_gt *gt)
> >  	gt->info.clock_freq =3D freq;
> >  	return 0;
> >  }
> > +
> > +static u64 div_u64_roundup(u64 nom, u32 den) {
> > +	return div_u64(nom + den - 1, den);
> > +}

Also this API can be moved to more common place like, xe_drv.h for others t=
o use when needed?

> > +
> > +u64 xe_gt_clock_interval_to_ns(const struct xe_gt *gt, u64 count) {
> > +	return div_u64_roundup(count * NSEC_PER_SEC, gt-
> > >info.clock_freq); }
> > diff --git a/drivers/gpu/drm/xe/xe_gt_clock.h
> > b/drivers/gpu/drm/xe/xe_gt_clock.h
> > index 511923afd224..91fc9b7e83f5 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_clock.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_clock.h
> > @@ -6,8 +6,10 @@
> >  #ifndef _XE_GT_CLOCK_H_
> >  #define _XE_GT_CLOCK_H_
> >
> > +#include <linux/types.h>
> > +
> >  struct xe_gt;
> >
> >  int xe_gt_clock_init(struct xe_gt *gt);
> > -
> > +u64 xe_gt_clock_interval_to_ns(const struct xe_gt *gt, u64 count);
> >  #endif
>=20
> Looks ok to me,
> Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>=20
> > --
> > 2.25.1

