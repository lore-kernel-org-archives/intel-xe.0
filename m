Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A989FEB64D9
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jul 2023 09:29:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F8AE10E2C1;
	Tue,  4 Jul 2023 09:29:26 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F86B10E2C1
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jul 2023 09:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688462964; x=1719998964;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=RjEFbHGjNctBKP/IDr+UO0u7xsu9wTjHw99U00CgI3Q=;
 b=UBqtWHQPzDfhVaIrK8w7X8XA096IsrHsZaGiOT8EgTBvYi4s6jfI46Y2
 7JSqJdVtUbuIO4RNfL3veomVfWBJGaxDfbJaCR6aX/8RUkunETAH96OtJ
 tncsywlsWC7LqMSClPcu9+iS4sTmuaS1UoPQgCXELoeo0NfHy74nywYFX
 mejkmNJvFucep3bAPcmsKuxEuGZ8NS+/9pW69rVWLtWqT7sjt/X94FLSQ
 YN82SKL3SWVrtoZyHPgKMvZZxjnVP9Q6WRhUeM9Ukjm9atgM5+lD5i8Pl
 meDLx7EvuYTyuq+r5qP3ZLwTMR/YyDrs2Uziq7dYAvZgOJ+8aZracJuI5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="347873597"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="347873597"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 02:29:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="892810283"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="892810283"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP; 04 Jul 2023 02:29:21 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 4 Jul 2023 02:29:20 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 4 Jul 2023 02:29:20 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 4 Jul 2023 02:29:20 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 4 Jul 2023 02:29:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n7ucXXVth8UwZld2giEWSkHj9rvetsY3QbwREzA4+ehwZ1BGpiCWSLjWF6VpruPz60/HBqyOa98glv+8p4BOrw/4Xw/+SbJ7dDYDkAMV9JmIjLBIgsyiamHgJ1BBoF9VZr7uJw6mjXtTTglUXvVaf/fXMNH6+etDGIJkkuSftN+xiYNgWoxCzpJYSH3SNSULiIY5yOr925lj+ptyy/GPg2S/TOKg+C0Ds7V38AJ0yQwpo5VFG6gDJDZJlX9f7uF3Ro1A671vK7WBtAJLpDXKFZTDcMru5HDnNmsUtLb2QBAJJGcINqkX27WA2R/OmW6bkG+HssMmSNURrveEiLICow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EMwOEA96ljICtvmej2HQUXbTaYCYEdjzGR5UknmfTeA=;
 b=amEvCaXlDh7s9ccLGs02FIFunVhQsakpDI3twzabMkslxT2oVVhVg8THCfs6E24gHxH7vJKopZL62IFctPHNO3GQ0DuD4MCkxdvG5BsstGkc0H52+4VKSwUWf5z5zSOeaL0RhaTmswHgc5Yb/3hi1a3MFX1k3EWozvns1Bj1dvic/OUE4F5Zg8T6w/KKvC3dND9JM8PCveRKhCf+wVH/uVq6vdboJSVbnIx6yD289NDt8/3kgLa8AMoKEqBWS3f9q3pZkhtWCWwPEYeNdfwH2aC/v1EgiODurgyzirnKphzK9xga53gQzLzAgvj4E5UcPMcfFme2rBs2xgKe671T3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DS0PR11MB8116.namprd11.prod.outlook.com (2603:10b6:8:12b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.38; Tue, 4 Jul
 2023 09:29:18 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::2bfb:7d63:f348:1a4]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::2bfb:7d63:f348:1a4%5]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 09:29:18 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH v2 1/2] drm/xe: Get GT clock to nanosecs
Thread-Index: AQHZqPFost5vpmNLc02Segh5wgRTCK+pYVNw
Date: Tue, 4 Jul 2023 09:29:17 +0000
Message-ID: <SJ1PR11MB62049A616B9C44D0F8708F2F812EA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230627122113.1472532-1-aravind.iddamsetty@intel.com>
 <20230627122113.1472532-2-aravind.iddamsetty@intel.com>
In-Reply-To: <20230627122113.1472532-2-aravind.iddamsetty@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DS0PR11MB8116:EE_
x-ms-office365-filtering-correlation-id: 702bc0a1-7c42-44d4-da4e-08db7c7123e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5pqTSm4FI27smN9Uvuxn64U02wO6iFllNHrRsMTXucooogyYBET7oMiVKkW567utNOONu3a0ut4/hGPxHuQK73RU1CJPxHb7N3L7M/wnu+ZdhwpCRenAc6RaNqDgR4kjSIn1PjIBEWEw20tn1IAPpGfb2ViXhbWRGtB3sKmTb3oaaEDhJajbFRxCQqOqQjLCLFwjtoxVA+B8kJDuTkF405kJLQmOlW+G9WeCja8Y/Y2fDGDJcpxaGhDSwUTRrlPXsfvZRmptW8yXlmQTQ1nbsJcdXQ5LxfNQEO3TWsvm87MwIYEIPUqQ9alpfOzNE2BVNHzYcIMue2GdyfyuPjYtocofO6k7TLJyCvPXkOrgbyd+DBFHy4lfQsjyVzoVWrtSLl1WaBmd6u/LcGTzlyt05qBxp2suIa8NAIsoFMS5p29N6mN9LM3jW8xuxrP9D73jkWYzvMa3vxQMVdl/dVxAOwuOAFMyMG6O8c0eNMiHRKvLVTB4I3mOM6oS6HsFzlfBFXAcHJ+ZhYMkPjlRBagSeivNQ5noIR+OMxFAWJ2+yj6wlw57PSFe6jOIB0UPX/byroGjyO1ZxffmX+D5C9pafx8MriVI+EX1BHE1jRFw1sb4b2qjfweMoeMz9FKkBPJX
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(396003)(366004)(39860400002)(346002)(451199021)(38070700005)(83380400001)(5660300002)(6506007)(9686003)(41300700001)(53546011)(26005)(2906002)(52536014)(8936002)(8676002)(55016003)(186003)(33656002)(71200400001)(316002)(86362001)(7696005)(82960400001)(110136005)(76116006)(66556008)(66446008)(66946007)(38100700002)(64756008)(66476007)(122000001)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lD3c3A9Fu1uhrox6ilhcVxiEJSS/qPqZeV+2izateHYq0+jJGZhUKneX0pbB?=
 =?us-ascii?Q?fSX4V2q/ATmPdb60aJS6eQpt6rTHBHv8Noy5kHT7WVhkAmlQ7UN3y0MJiZx6?=
 =?us-ascii?Q?eou+dpRNfBmhwBlDuQSj2cRZ4+JtXRlIosisYJduj3ncJBVoS2jOzo16bwkU?=
 =?us-ascii?Q?nJV6L0oWGhKAkHiTqlo/Hrv+D0zHEAv8skTJ5xJjjv3jv/1Uu/Gefs7kYrPn?=
 =?us-ascii?Q?CVFx++nlrvXx200tq2m8roxyvdfN7uIEDFw3rr3shagyyBk2QcLnjuzCmXKp?=
 =?us-ascii?Q?cPSGg4SK994VNZHgYbMo4urJ4QDOA/NvwfbJK3i2mFWamvj75bFhGTanERfh?=
 =?us-ascii?Q?rMYl4+xV7Z13InUgQuBaybhZcb/N4B3TZWyVlRZ1y7xuysPZqEhrn2p3Pal3?=
 =?us-ascii?Q?KPRCG2YUussqf0m7pkMXCKDxdrWWmbiS0MAYHhcIwmyVcW6OUTKsdsaKaADi?=
 =?us-ascii?Q?vAQNh1oochVtdrp6zyrI1O6MYKd2ChxG1Ch3QYEtDqNwTjOwkg5Qu1LrlyIi?=
 =?us-ascii?Q?GsWK6RkZKhRJvMHwcUbzPcrI1h+3ESmjiP9553/3Bxo7RdTCYQRJdrnRCrQD?=
 =?us-ascii?Q?QLsZf/MKTEKG4+WeCBfPdKritaq9yMqUIHzi5CnZ5/dCPau+ceqaskSgrDvT?=
 =?us-ascii?Q?D5xKIg3dGOUQW2sAR+pozrNUIfiLzg/qRSc11L43aM5ZhE8xKtUvLPyhkH+J?=
 =?us-ascii?Q?xdwyZJP6PO5W8Jvf920/VI4Ov9DXE0Ug7hBgsvn4UWCFwREUa9k/wIkf8jLl?=
 =?us-ascii?Q?XePRY7xZrAuwMLUkRe+S3K3kiD37oZVsjr+W6OxEkNK8y8R6VfjRFVQxnj7w?=
 =?us-ascii?Q?wVLTY5c60IKDpp0G97FL0PMIMTKD7DfA4FHUQ1mZG8nD2kVecDSPTIr1+sbA?=
 =?us-ascii?Q?kyybTicmb0/5xuw+ebGoBuvUFR+O37hSznAX4uszvinypzr8mD1HacZ92T3d?=
 =?us-ascii?Q?MCeOipRNq+Otr9KQiOBz+KsV0nMkX0n0SWg/84OD2PVuwlsUrDcwgzU4oCTS?=
 =?us-ascii?Q?6zPt1zb5M1MCM/IMxThpkcSm9Wt9l00TtLDGlrLNCtCWh+2IIgNLkTCN5+FV?=
 =?us-ascii?Q?5HmiVdjQTN8r93+hk6E1IouGakvw7JGrqJv4cM5OsNjJdAKAywvAbDCW8mNL?=
 =?us-ascii?Q?w+/IDSqvzo38cCgN9gF/kfsKMnc4RMM4jZsrGe1zN9Scoj4bO7yFGHkAp7Px?=
 =?us-ascii?Q?Jba8dluygcpptVsEDKmtNnGjpxUVD9PFNEQyt/EA/9WTSAgnzvvgZtZPDzJL?=
 =?us-ascii?Q?F6ueLu5sEepL+VBuOn1rsIF33NRz/n7PCs0Yz9rsakjl8ELvdjWy5GK5ClNx?=
 =?us-ascii?Q?dDskLkyuKkMefSrKwgOkmrODszthGNB+oVbKtk4NGrzELKfA8+mrB3xyu5V0?=
 =?us-ascii?Q?wBqV9A7YnAnm0iSAg4DRnhJk8E3MOnjzFYog0K9w7Hdslj654db+bc5wV8MP?=
 =?us-ascii?Q?4ZnpeQgKuZUjF0ksg26op0HqzlDGv+d8dt77IlwnMlfBqJvixfu0wwmUn5xF?=
 =?us-ascii?Q?phxH/ggSUueDxWAyGKgDsUAYEjGM+ZSjjKqjb0gfot+VnrxzFEAwE5GinLkU?=
 =?us-ascii?Q?IP3ITNOQo4GIWw100eiUGHY7S9ER4Oblqtr8iv+x?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 702bc0a1-7c42-44d4-da4e-08db7c7123e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2023 09:29:17.8310 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x27G1l3yj9814jL/5nzeWI0zvuJVCjW4EUYFwMD07mpolnlD+dSJxIbhFmMfrPHXvVFXsMkY4nRaAga3Y5PUnrBR3VqsnNXqceXNyFsYrF8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8116
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Aravind Iddamsetty
> Sent: Tuesday, June 27, 2023 5:51 PM
> To: intel-xe@lists.freedesktop.org
> Subject: [Intel-xe] [PATCH v2 1/2] drm/xe: Get GT clock to nanosecs
>=20
> Helpers to get GT clock to nanosecs
>=20
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_clock.c | 10 ++++++++++
> drivers/gpu/drm/xe/xe_gt_clock.h |  4 +++-
>  2 files changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c
> b/drivers/gpu/drm/xe/xe_gt_clock.c
> index 7cf11078ff57..3689c7d5cf53 100644
> --- a/drivers/gpu/drm/xe/xe_gt_clock.c
> +++ b/drivers/gpu/drm/xe/xe_gt_clock.c
> @@ -78,3 +78,13 @@ int xe_gt_clock_init(struct xe_gt *gt)
>  	gt->info.clock_freq =3D freq;
>  	return 0;
>  }
> +
> +static u64 div_u64_roundup(u64 nom, u32 den) {
> +	return div_u64(nom + den - 1, den);
> +}
> +
> +u64 xe_gt_clock_interval_to_ns(const struct xe_gt *gt, u64 count) {
> +	return div_u64_roundup(count * NSEC_PER_SEC, gt-
> >info.clock_freq); }
> diff --git a/drivers/gpu/drm/xe/xe_gt_clock.h
> b/drivers/gpu/drm/xe/xe_gt_clock.h
> index 511923afd224..91fc9b7e83f5 100644
> --- a/drivers/gpu/drm/xe/xe_gt_clock.h
> +++ b/drivers/gpu/drm/xe/xe_gt_clock.h
> @@ -6,8 +6,10 @@
>  #ifndef _XE_GT_CLOCK_H_
>  #define _XE_GT_CLOCK_H_
>=20
> +#include <linux/types.h>
> +
>  struct xe_gt;
>=20
>  int xe_gt_clock_init(struct xe_gt *gt);
> -
> +u64 xe_gt_clock_interval_to_ns(const struct xe_gt *gt, u64 count);
>  #endif

Looks ok to me,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

> --
> 2.25.1

