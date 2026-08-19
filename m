Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60740C5DF81
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 18:29:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07A7A10E12C;
	Wed, 19 Aug 2026 18:29:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rze2QAqQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED6510E12C
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 18:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787164159; x=1818700159;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kzkUTzmgcu3hhIubCr3MxpzIUrCEdAWRu9XZMKB3+7U=;
 b=Rze2QAqQWQPzH5/Sq0/TQPZZygBAqRNrdaX9LeYkTfcs6WZ+AL6iC6P0
 hxe4AmMLmyIapw+kRdEaEYww7mHjDJfZK4dJPm7mud1/S0R7BGzdyJUIP
 5EMYJXkHjFcoODpg5FDMnarqg6MxWB2cAGCRV/14ACCXCcyaY4t4jraLB
 5hpS0CCW+Aq4PWyLu85vCRJCxX6HwUyrR6hJx7eennqaX7VWLNglMvOWA
 kK3dBx8ErO0ZlknSjwyWqw6D5bZg0eTq3KINkiOquG1X35IC05BW6kr4z
 GdSmNZz0bzO/Y1JRW+Twjk5kavJjBQICgRU5wcptwEdwCrd3R351In/eV w==;
X-CSE-ConnectionGUID: MM9LB5oNT6uc4air+JJwug==
X-CSE-MsgGUID: OJpHCLZ7RPeU3WxXEEsbDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="99216133"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="99216133"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 11:29:18 -0700
X-CSE-ConnectionGUID: eIQzI8+NR/WQJGl+q4LsrA==
X-CSE-MsgGUID: CwG9Yl8JQyCg5cQl9UZHag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="266242914"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 11:29:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 11:29:17 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 19 Aug 2026 11:29:17 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.5) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 11:29:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RS9CAaZArftVpqaSE9gUh77Smu3UpLCQP+tLTgzn50MuGvXGk4GhdWpelcUm2c/5oQiDX4bMaYsV8yYvM1GGK+neqtE7IlP6wAWgW/wQMvSGhRvQo42hOW3aUBFV5LYu61+dWG2/RVgESopKVt3DUWBUy2+C76i58JHuYpBvxptmo4PIn5FIkfrr9zfThKdEriaTY7JDGOQuZ3A+4DKwjYfNgq/EzYzwqBsMifBPhuU08Qc8tW5Vg0/E6lGrtNSuJczrUP5NOBuLW9zFnql3YkpxL4cNsZQtsSADgLIruDfuvwBJRkR0gvrrkFkDXC3Kj/T2VennDlGkbWYaVTUoWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Nd9DqKr8lOaA+OJdC5LC3N89RrH4kqn4UnJGiKVXpk=;
 b=vE0iuIuh5CNS559JIVwyeXPTXWfI6kX7nwigLcjBUu7SmsaCYY2IqQmeAfDc/fUJWrskkT4rQPtJOETniQuV3/y9ROa0nEVo4JEEY7NL1DY+UdbmUOzfHgT5hdfwUg8OoYQUu9gMU3LDWjr9PAW3s3dI7R7kyD9Xqy0VK8JyWFv67JKhGNj0rABwa0IAl2qMHH9TlbuTgbLv6fBOwPAwlMmdtpLn2HE5mpkkd/2XE0ooJ3OxaNG2lEwHLrPr9KIB7fIXYCm169ykuEnVYD/+tKQbgh7i9L9AAXZhDA6Z2WlbBHGFK9zHXHrfSIyPEKxu5ai0A4/BpvoK77DewkmJQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB8040.namprd11.prod.outlook.com (2603:10b6:510:238::11)
 by PH8PR11MB7141.namprd11.prod.outlook.com (2603:10b6:510:22f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 18:29:11 +0000
Received: from PH8PR11MB8040.namprd11.prod.outlook.com
 ([fe80::89bf:2274:1371:50c5]) by PH8PR11MB8040.namprd11.prod.outlook.com
 ([fe80::89bf:2274:1371:50c5%3]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 18:29:04 +0000
From: "Yao, Jia" <jia.yao@intel.com>
To: "Bai, Zongyao" <zongyao.bai@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH v5 1/4] drm/xe/forcewake: synchronize engine-cycle access
 with unplug
Thread-Topic: [PATCH v5 1/4] drm/xe/forcewake: synchronize engine-cycle access
 with unplug
Thread-Index: AQHdKreyJouxSVdE00SVnPaUSGAe57alu6mg
Date: Wed, 19 Aug 2026 18:29:03 +0000
Message-ID: <PH8PR11MB8040D32B1161E482F064C06FF4A52@PH8PR11MB8040.namprd11.prod.outlook.com>
References: <20260601213804.707256-1-zongyao.bai@intel.com>
 <20260813000654.2712317-1-zongyao.bai@intel.com>
 <20260813000654.2712317-2-zongyao.bai@intel.com>
In-Reply-To: <20260813000654.2712317-2-zongyao.bai@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB8040:EE_|PH8PR11MB7141:EE_
x-ms-office365-filtering-correlation-id: 1d6175d0-425e-4713-2277-08defe1fbf46
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|42112799006|38070700021|56012099006|10067099003|4143699003|22082099003|11063799006|18002099003;
x-microsoft-antispam-message-info: j3iY0ixroPjMQciCHZzvOOxp9zs1rV7G4BnboGZj5ZbxeO60jRqmB01SiuwwJJhs3wL7QHsKJ+EEmQx8wTh9LOVIpSQcSa576XNQAdUdGG5HXHprGKJ8Wnv0c0NDEsr+o2IH+wgMQFceY3PSEd55SkyQP4AwYuNilsDymnEKXNUWJXYE1PE+GXbNfK/9d5hbAS+Wq5BKFr3IQPvhPizOWDaxCNfg3M1wQMWGoTASch8kLBOwwyHoLnNfSLZGiBYoZJ6S64W0KnYeDjvIWo8Fl9TD+x7rGw02BszrnWonO4TYOhzxzDrpfqzof8HCecHtO0RQ3sLJfADBhjDnVppqD/yerkijtL4Y9qMwmNUtoD785/EuVsfeuLWpgdnwXQLoQSdaTEKdltv/xgyrfPm2KGLRUUKh18ACFLFxp1jO1xRE1JDHPW1nJ96Ce6ImXFBu6GkwbYyBlknzvKel9rpNhhiCeSJx5stQfmY5LNsuWTP0fzfDPohNftjXnP3DgDnCt//mUC31BBczCyZ10tKS/jK0l07bZECh0rLJULZrIyNGWpm0AAYd59W7cYRy7xjBFMGQsL1fA8pTqaRwxcK+3/R5B5vYruYCU4YTRMkXOEwB0SitIVohpYjPIkmo5dpfAWUUFWyL0iiit0zso6WNdxvKGoJaxQJ5IvEy6fyC5xMI/rcQaL5+zvqnSKjCDQoWtkjQiZ9GUfG96OtW1BJH56ROp9Lt6PXJSTO1c8YGjEM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8040.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(42112799006)(38070700021)(56012099006)(10067099003)(4143699003)(22082099003)(11063799006)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UQVNqd3B8iR5nJwjCUWA+yA7nMo+Tech1suKV1EN+pQhfFIg5ABrDlifm72e?=
 =?us-ascii?Q?hS0pPQPD75FnJez6flG7ObUMDmtscpKStZJ52Ke0tiyz4OqZ3vjS3rMVe9Q8?=
 =?us-ascii?Q?TvePqMM+q8ZuXqGAsL5pY1HaPB9SVdEa7oK8CKgLSqlFO73uYedTpd6SNkMw?=
 =?us-ascii?Q?EUyMHYsWmwhoY5TvkVH0HV59tidOrct29TXZfqXW/OymjZ1G0Hlec8ECub6D?=
 =?us-ascii?Q?sESVxME8oeyWB/QfU1qKMgRiDv/8bk9DHQkqxH0J+WKo9pzKjVhUbeYkUBS/?=
 =?us-ascii?Q?tMqU7zEWs7NjUHOQUjTF79NOPtais23tNNiR/g+d+FhZKLzye2fTM1ZaGxuR?=
 =?us-ascii?Q?AZ1WIvwXFuCTJdPQ4UIP3uhdRZQU+RKyKfSe+BbO82TyLK1v3CyPG71DFlHU?=
 =?us-ascii?Q?Pl4SfvFq+aJxJ9MtoIH5+0mqqa78zzkpC1eVgQVy2DldR531JTjJQPb6mIhy?=
 =?us-ascii?Q?dKgf0YD/VUMj6Lbi0SSOFzcWpMdE10FNS+ppkKP4XdyqvkwQD5+mdkz2w0Vk?=
 =?us-ascii?Q?pKSpt6KoM5yTRMsT10ZdP0lJ2m9Z1cMRcBkBqLyFQ4tfCX8TFRZ4/HPe+/Wh?=
 =?us-ascii?Q?tBq1aYSa9ePi/994KDsf1hsUWOUve65n0gwKaKymgf5zxfJFuHoWfNAKEl2O?=
 =?us-ascii?Q?PLLSxErojwuHKmOKO8qii1kr08VOJMMZQpD/Aksx+0PhqA0ivIFAnZ3h0xg9?=
 =?us-ascii?Q?UHGaF5JSb9ayK589F5Mx7cquBPrhhjKCYIm0TyqAqp2GD4YbpqYbxBKRJcIV?=
 =?us-ascii?Q?1BQ57+6qm3UFiaf9w4YD799SqZbNNyrVS1+Ky40EGSLaUQPnbLledo99gwDU?=
 =?us-ascii?Q?je7nI1eJ69zOb8ZotCmnBadxLGoUtsjVhLv9yZQMYLyJXS9AiNa1a3cAYLz8?=
 =?us-ascii?Q?6rznzE5qR0CEJiOAIdAejotNAr2oU8liVKibR+bjZnjUb3KeeVdsN7ndggkz?=
 =?us-ascii?Q?Q5X1/CSPmgxw9Cq3RjV20NJ2ooS+mBt80NNMW2sLG76DJDO5x9P3w3vOhVQg?=
 =?us-ascii?Q?nYt9CBiclGQVwOEIAJf3nm4avtJX6KHE58nfsD3sYNuZViTjrWdPNJb8BrdY?=
 =?us-ascii?Q?guJjen0AKCc8MRuDTWd3ZC6hZ5WOlItPjSb7U1eCMSeHK4ZOyJkwDCTBOTG9?=
 =?us-ascii?Q?mkp9aS1VyuWuVZSQJ4TzbK/XZXz5C8F2pqhfOhNb78ggUq+5L0cl3aJ/XvMU?=
 =?us-ascii?Q?RXVCiKZ55kuG7mO8a93crpGzh9XZ57dqAPcGYqeArqMhbPjyuWWK8iVkuDOe?=
 =?us-ascii?Q?aaYfuvI/43M8kf1xRtolGTpfZSaqdOn+o5pxTK2//rPS8xhGmul5RDjI9uGL?=
 =?us-ascii?Q?riS35dbhQhL2obozIf6eEBnGvQDZ7r/4Ix/3GyRNa0Ns8ea5wLBta6VAqMsG?=
 =?us-ascii?Q?IB4DDYexAG5dIGVifNCEn4vDwfjmXHbPH0fmA5kYDSxynAeGdkdX25EUucot?=
 =?us-ascii?Q?9aHF1yBHiIsp20tfP8bueQGB9HN/G7xKAciU0ePt509SjtBsOUazmVfaJvQw?=
 =?us-ascii?Q?hoUxjr2yAOFGbblnKOUO7iwGA8blopG9Z8/gJmXf1OqI7XbY+y/qzacJILe8?=
 =?us-ascii?Q?anQNXlxZQoJxamRlJTbukGq4fv+lAXSk9lL1xIYoqaHwgj7F3WxIjbcwYHCq?=
 =?us-ascii?Q?qZOHWqxoWH1JPUeCdYltEC6TTMElyq48tAu9JrLN1B8viC0ju4C/qDl3QAaO?=
 =?us-ascii?Q?/M39i8+pg6RblE7gWx7aqGcVgPSTEva4XcosucrNHiXR1Gcq?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ZMjZQqTT2+mu+/bfCqFGq7cxDgVkBxv6SPOnbIjfc3m+K+JDa2tqP9LMx1uNH3Ele6mv4EDcxipen6X2bk9F40lCYd/Wfhzz1O8971pDi1fKVg8ITZzyoZHEdqpwVa7ooP/SIrTPL/SAoG/ldYBgoM8R6SXUxSv3qdET3564rEX0u3yxciOB5SWYZslTTDps54d4ZxyMvjf6G2eY2I0mrmrGWosHYwJVSzwNs6EpecINK4TFGo3NPf4a2EIiDHl3Ph6SrGWVW8QZZS1/XgEuYfZv9tH320As4tE5iEOnXfNuMKdubcloBI8P7UUTVDdGQMbtkGgyheaq6r6fSbzUOg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8040.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d6175d0-425e-4713-2277-08defe1fbf46
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2026 18:29:03.9635 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1c5WhQZlzqLw13h6bA/n/GjeLxDpwm1QM3Ja1jzuwx+vLcxkrue33YUUBgucb0K/YupMN5Me8123BCojPSpG7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7141
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

Reviewed-by: Jia Yao <jia.yao@intel.com>

> -----Original Message-----
> From: Bai, Zongyao <zongyao.bai@intel.com>
> Sent: Wednesday, August 12, 2026 5:07 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Yao, Jia <jia.yao@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>; Bai, Zongyao <zongyao.bai@intel.com>
> Subject: [PATCH v5 1/4] drm/xe/forcewake: synchronize engine-cycle access
> with unplug
>=20
> Prepare engine-cycle queries for delayed forcewake release by protecting =
their
> forcewake and MMIO section with drm_dev_enter(). This lets unplug wait fo=
r
> admitted queries before flushing delayed-release timers.
>=20
> Use drm_dev_unplug() on post-registration probe failure to provide the sa=
me
> synchronization before teardown.
>=20
> Assisted-by: GitHub-Copilot:gpt-5.6-sol
> Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c |  2 +-
>  drivers/gpu/drm/xe/xe_query.c  | 34 ++++++++++++++++++++++++++-------
> -
>  2 files changed, 27 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 71111ad32465..81b31325e581 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1166,7 +1166,7 @@ int xe_device_probe(struct xe_device *xe)
>=20
>  err_unregister_display:
>  	xe_display_unregister(xe);
> -	drm_dev_unregister(&xe->drm);
> +	drm_dev_unplug(&xe->drm);
>=20
>  	return err;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.=
c
> index dc975f595368..3c356bc48e2a 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -8,6 +8,7 @@
>  #include <linux/nospec.h>
>  #include <linux/sched/clock.h>
>=20
> +#include <drm/drm_drv.h>
>  #include <drm/ttm/ttm_placement.h>
>  #include <generated/xe_wa_oob.h>
>  #include <uapi/drm/xe_drm.h>
> @@ -123,6 +124,7 @@ query_engine_cycles(struct xe_device *xe,
>  	__ktime_func_t cpu_clock;
>  	struct xe_hw_engine *hwe;
>  	struct xe_gt *gt;
> +	int dev_idx, err =3D 0;
>=20
>  	if (IS_SRIOV_VF(xe))
>  		return -EOPNOTSUPP;
> @@ -143,28 +145,44 @@ query_engine_cycles(struct xe_device *xe,
>  		return -EINVAL;
>=20
>  	eci =3D &resp.eci;
> +	if (!drm_dev_enter(&xe->drm, &dev_idx))
> +		return -ENODEV;
> +
>  	gt =3D xe_device_get_gt(xe, eci->gt_id);
> -	if (!gt)
> -		return -EINVAL;
> +	if (!gt) {
> +		err =3D -EINVAL;
> +		goto out;
> +	}
>=20
> -	if (eci->engine_class >=3D ARRAY_SIZE(user_to_xe_engine_class))
> -		return -EINVAL;
> +	if (eci->engine_class >=3D ARRAY_SIZE(user_to_xe_engine_class)) {
> +		err =3D -EINVAL;
> +		goto out;
> +	}
>=20
>  	hwe =3D xe_gt_hw_engine(gt, user_to_xe_engine_class[eci-
> >engine_class],
>  			      eci->engine_instance, true);
> -	if (!hwe)
> -		return -EINVAL;
> +	if (!hwe) {
> +		err =3D -EINVAL;
> +		goto out;
> +	}
>=20
>  	fw_domain =3D xe_hw_engine_to_fw_domain(hwe);
>=20
>  	xe_with_force_wake(fw_ref, gt_to_fw(gt), fw_domain) {
> -		if (!xe_force_wake_ref_has_domain(fw_ref.domains,
> fw_domain))
> -			return -EIO;
> +		if (!xe_force_wake_ref_has_domain(fw_ref.domains,
> fw_domain)) {
> +			err =3D -EIO;
> +			goto out;
> +		}
>=20
>  		hwe_read_timestamp(hwe, &resp.engine_cycles,
> &resp.cpu_timestamp,
>  				   &resp.cpu_delta, cpu_clock);
>  	}
>=20
> +out:
> +	drm_dev_exit(dev_idx);
> +	if (err)
> +		return err;
> +
>  	if (GRAPHICS_VER(xe) >=3D 20)
>  		resp.width =3D 64;
>  	else
> --
> 2.43.0

