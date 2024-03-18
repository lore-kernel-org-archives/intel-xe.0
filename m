Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26CDEC54E58
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 11:36:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0E1B10ED9F;
	Mon, 18 Mar 2024 11:36:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k3bTRP9K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4369A10ED9F
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 11:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710761817; x=1742297817;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=HjvRGrpE0sw2lNF35yhyHDhN0tgzd+Rh14XiP9GRGDw=;
 b=k3bTRP9KLmerfaN8gsQeB+MxrXw4Y3OU02E4Zu0jTIau2FavFIkn4URy
 90+6pPQxDruxMuq1KG+KBMhERMuK+as8jndtpmWpMyqsibcfQoeF+pIXf
 ssZYUSs6hfjvTDvQCddtnb1JjHWEABqlMJ0LjVCdce3IZPRHwWvbDonBu
 oZzIRLxoiL2S/NzIKzYdEaALNR4EZlBlQ2+rNgiRRD0hM+WuD8KKcmN5a
 MjDNn1P1XAYG/4reZmIIj8CyeLRjhyd0Jm1duslz+PPUy10O9TH6WoCgm
 PYNqmDGj515bKWTOguHSALlmBzDLM35zIScCMU78YDpc8XMyHUYJ0482j Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="5698084"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="5698084"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 04:36:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="50873838"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2024 04:36:56 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 04:36:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 04:36:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Mar 2024 04:36:55 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Mar 2024 04:36:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WG6PzHqVbNN5Pk5AQ7XauWoNe+Quhgcu9xK6Wg/iNxPFh1lMLffyB2sYqDjkpEqRF/PvVIREm6YelkDHwInCxt10tv8FfePP+oYwtmPQDftKvU3wRhhwNEEdQSx/fmB8Sc/TVSniR/JSfDsSeFGXdXX2S8IipDhjzZ3L4Sw5S7yLjjFJl35v/MbBnBJjJuFaL91R3I7QoQZism6sXWd1cq0BuNcp3okgNFwe7QYOXzmmrSJM09REzst1oWxu/6GA7ZAFr68QtdgwM8v8W6uERuadPIefvc1PvHkgYQBK/UxWGvR44b2xUzld3tDAaCYVYKDCzQ55V7RnARMy9cgPkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Imzg4UiZRQNQWsfas/zUu4GlBMjwEVK/E6zmYRBWE8Q=;
 b=SgodStGymSdIOTCCynShBgF9I+RHprHOG/EI2lK+YQPmq5k3rvAD0Gz7Brgfcmfio0am1NAjCNbJ58qHn8IHM+QR4glD1aDlcZqixxuBEsyGaH9vtUd3B4CSaYC6j/PUyjjEuJ8daayqH73teArc84JyDbeZFSpfQKJSv19Zial8pdglVwMsOPQFgfvO8cwSQSAzdOy3A5qh9LwRzymqlDJn4zdYGagfnrWDKBYEyZvE9ULmDSoaFLThUXJ8oxK2kz2KWeASfsyYMXwEhj9WLDRlTl0VusiJiPboRatCAi/1L8aQAVr7FHzrbwg0RNf5ilqPO5T1Kr1WWFBHCpfrSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by IA1PR11MB6348.namprd11.prod.outlook.com (2603:10b6:208:3af::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.10; Mon, 18 Mar
 2024 11:36:51 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a%7]) with mapi id 15.20.7409.010; Mon, 18 Mar 2024
 11:36:50 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe/gt: Remove continue statement which has no effect
Thread-Topic: [PATCH] drm/xe/gt: Remove continue statement which has no effect
Thread-Index: AQHaeSdgbD5arGVw20ilLz7mlcb5rLE9Xnww
Date: Mon, 18 Mar 2024 11:36:50 +0000
Message-ID: <MW4PR11MB7056B562D9013AE4D9BE0497B32D2@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20240318114057.3831274-1-tejas.upadhyay@intel.com>
In-Reply-To: <20240318114057.3831274-1-tejas.upadhyay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|IA1PR11MB6348:EE_
x-ms-office365-filtering-correlation-id: 54d0b2b8-bc43-4e05-d534-08dc473fb410
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SFuO+mbvvDmulMjaqcCxaN1DiVHYNeTL7XYIs3Bp7Pz/WjYwPnYoaI4M6Fmf8eoHUlMk64N10nKp/BhBoWOwvoIgjGNtkm4jhZHjge+TWBCUvfcmTS14rrctZyGdz/AuztOPnKJF1/7UWGBJK30SpTuQHxWDUjSGxi8A5Lbou2w/QA0i3qiVWWPakckDBd4st5cKrgKh1yTcIoUSo0oy9C0+WqWkmqEtOU6Xw655oosOD0omY0Mj0JXnz/xqNjlW4AhXcY0o2emxxVrYK/lAUZeqEfi8WeKoBm2lFIhrqTxwJIFiQRzwCexpTip6mqO3mfhob8g2NWt7YmAdB2F6ggUW7MwibgnVkVZXZdKZfFKewAxuWL4esbv+gAc9WdjqfzTkTGccNm1c+WZsWhuTbFwja/i2alXhC5B+ZhgxJCJp40KUp//q/NOr+BlJqUgILtxuCPWxA5I+A6HIZ1XSV737EzY4fcFcpVKV2YbHIQzjZQgbWf9JpwOfmQhMk/TQRTgr3ZTH91OfQ8zS+s38GQ91uOJC7ojElix2sUXbGk99l/9fcJSaQPhJnvDpIoLsbSMT6ngM5JH3ShZ3/M90LQ4b8wNsKQhQUBSP7NwNI8O2hyxVlgoU1dGER9NJliY7kvb3zvhUnDYRPg8bdE80MxDLLFhcYJcnttwjxHc560bjS2EEP7dJxt9YdHzcPB7KfrKDnWRNfWZp6BxublsAKq9T6gx6gJ1HGjfcrPHDFzs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xqQQO+OTZ6bs2oMl3TpMFI8QnLe9l3gj5OZrbIYvEoibOjo5L1dtlNRj8dMx?=
 =?us-ascii?Q?D6VPU6/t1kiKV3S7DFcT1mnLCYO4/MceSilHMF09c9uVOjiojgIoB/YQDto2?=
 =?us-ascii?Q?o5vO7kdn00oXtfQcHjKDnWjZ6yHhdn+Tfj0ZaYb0aN5vn5OT0zt8A4e+NuSU?=
 =?us-ascii?Q?68rF/JyIhRBuS3/UUmMoCKrug6KA+TslvTRrdC3kp+W29jvk+EyjG3FFg2NC?=
 =?us-ascii?Q?NZ2CgX9rZu8dz49Ob+TnS3Aoee4vbBqALK3rLFpU2dmDeYGZnsV/yqVwP92m?=
 =?us-ascii?Q?YnwWkDMyNSOqRChrkbn7tNf8aZKgLM+gnqce7PKx2HGOqe7/aWeJy6wsC18Z?=
 =?us-ascii?Q?6w5Yde1M7NYOIH4rrn3Xr1aO8tF1D553M9Yl77W6dlHbvOB6AwDGdrr40mqd?=
 =?us-ascii?Q?rGwzl7EgUzXoZi2JcaDTAtI10qRzzSwHz8NlVZUUnGKViMSmNG1w9yOSX9tN?=
 =?us-ascii?Q?S3ECBy7Ub/d5OEgTnCUhDCe1jEtRwQNZWjs5jiQ2qFjNMlWC+7qRr8kw/uQ/?=
 =?us-ascii?Q?FaDG0Nqs+a4rhT+g0466NSZ7ovpTXYnvPaY4Tr8bomF6SuxcIlNnFwwPGB4T?=
 =?us-ascii?Q?eLbkOy32PqOsKso6Ft84qEBFoizmAcgH4ItxyUyU0LqQ5H6LrVsMdfIYZJcU?=
 =?us-ascii?Q?WDKy32rep00WmNCz/PgIrju9S7wdCGV9RqHfdJ66llNOXDKqr6a7dfncy847?=
 =?us-ascii?Q?Me1rZADKvqG55FP3j4HkdU3Uq+beKMKpiuuFRSZgkoPzwmtu2eruJleNPRCb?=
 =?us-ascii?Q?xYs5Etshz5IQtpYuQtI9+yZEvMcKeA4wZz/Qb6lsjf0mDH5+okvXa8u+gtKO?=
 =?us-ascii?Q?r27yB+/YD7MjWe7AUY4utdHGiBS5iBpYH0MLXBaRJekCX58h7ppamy20zkKc?=
 =?us-ascii?Q?w43F5Bx3XWyJrOXCMUtS7KEA7iq4BcDLiW4s0uW02J8okfHszQTZMrbPZIkQ?=
 =?us-ascii?Q?8FNHKXusPAF7CYLddYzahBMBHTxQLbmC5oOABCDEmZeFEhjG1dH8SWO00kQa?=
 =?us-ascii?Q?IAPozOaO2CD+wxU2SJuktZ+IEpjgtsSekH3NX7LfbAL+WYMvB15yDrcwf1wq?=
 =?us-ascii?Q?RelorxhU2HsX2SMkUUKb6losIH9kjWMFvoI7M/hjBYsUd9DIY5O46vveV2C3?=
 =?us-ascii?Q?owRd57BbkC5nkxsJFnyoM6eSB6dEAGt9vgZMci0Z49p9T3K/bTnTcoNLeUUQ?=
 =?us-ascii?Q?M3sl52PvIN3FVbqOrRW2irlPWxuWi5l1/895q/GX2J6DtAfHl6VpDmdPVay2?=
 =?us-ascii?Q?+tDVQQGz2gkrV/BcQRCCoomGVqBNYM7XzmXHMfefBlyVwZMOtkZP7AD6Z3Hx?=
 =?us-ascii?Q?RBcRKnaAWukdpVuCKduG8LmgRjEx93vq7jKcwIg8Gs0frtez2KqZqrhQQxFn?=
 =?us-ascii?Q?OWQfgXxz+32tCV+3SoAEMECoJf0IHvwbpSSW7ilb99J38gwM9ZDtblfUimsn?=
 =?us-ascii?Q?yw25QHZZEWyyegLMgJEw0NpK1/aTJE0jaV7hFU94RUZZ3qw9qFKCHT/+mJ45?=
 =?us-ascii?Q?rwHcdfK3thZMdWlgJ8n+U3jM224sQCZlJLR8LlW//dMV84PAqsxRFVKGIu3Y?=
 =?us-ascii?Q?KCS9V7EctVXEqDkmvyQeUSE4Tih16jW0O9rsxgQEszvwaNt8dhs+Srt//3Qd?=
 =?us-ascii?Q?9w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54d0b2b8-bc43-4e05-d534-08dc473fb410
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2024 11:36:50.9231 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FRH9FfMHcUDmCBSVh3hSdsM2TkblgJ8g89/3I+BGWmhYsJ/K1bhit/m3CojirFiN2aKmd4mXScHyDF61LH1zefB2zbaiQPPc5mXbvmqazpc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6348
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
> From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Sent: 18 March 2024 17:11
> To: intel-xe@lists.freedesktop.org
> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Upadhyay,
> Tejas <tejas.upadhyay@intel.com>
> Subject: [PATCH] drm/xe/gt: Remove continue statement which has no effect
>=20
> Remove continue statement which does not have real effect as no actions
> are to be taken post continue.
>=20
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_irq.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 2275ca35a3c7..996806353171 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -326,7 +326,6 @@ static void gt_irq_handler(struct xe_tile *tile,
>  					xe_heci_gsc_irq_handler(xe,
> intr_vec);
>  				else
>  					gt_other_irq_handler(engine_gt,
> instance, intr_vec);
> -				continue;
LGTM.
Reviewed-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
>  			}
>  		}
>  	}
> --
> 2.25.1

