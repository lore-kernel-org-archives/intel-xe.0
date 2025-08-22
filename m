Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D85CA0EEB
	for <intel-xe@archiver.kernel.org>; Fri, 22 Aug 2025 16:27:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E88F810EB6C;
	Fri, 22 Aug 2025 16:27:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XGpMLsvF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72C6810EB6C
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Aug 2025 16:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755880021; x=1787416021;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0yDW+FQhuOPr1OIe0uDiQ45OxsgmH/GIlbTMtImEmB4=;
 b=XGpMLsvF0WkPFnLOHNMWu5fsiwBbAc+BDnpnJl+Zcwc6+C4WdbFQtHah
 0G8QVbe/Fq9gV2S5FxKjQHLS+OpeNK6ARxWpkJ5FfyHu1rIlLm4Pbg2b3
 JX3Y8A1x3kz+y9PJRTJ9ycMw0RTOgL9155aKLX+WDmms4y25upU937nt+
 OV7WF3NB3tChL3O3y6QT/fjTDlFSMaEj55Pq8Pk2IXzywL34iFjXXcrtn
 hnop/suJTBMTH02OMHlvb2exzC30qBKXgIfpTkEph7hBfLcBYa47V2wrL
 /iZAU3fQY99sm7DNZ7RI4WNsXk43ed8cHbrIzeUF/vY0ROSpHYhkEDzm9 g==;
X-CSE-ConnectionGUID: zK2TBHEiRSqlfi25mi1cXQ==
X-CSE-MsgGUID: uSrPHkUVStGb4pGl3hKCqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58118168"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58118168"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 09:27:01 -0700
X-CSE-ConnectionGUID: dEMnAH5cTVelr2SHY4Rc4w==
X-CSE-MsgGUID: AjHfaIz8TtSoj4m9w+Fhxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="192406666"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 09:27:01 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 09:27:00 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 22 Aug 2025 09:27:00 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.87)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 09:27:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K6ONLfknjvaLaWujHT7MsV+C/e1gUMQOzWn4WyXv3/KZYgP0Gvy+viXPUAe8+z/BuwENtaheUYeXKhUJXPFE3HeWJ9U4y7TXIR2g4Ma4S9WQD7OSEZdCnEo6utuLqKUY6b7P0lYslaWDJnBDnauqu3FyOGoLsIsUONIDAbTjhWRNy5UhWbJoG+TAogrBH7OnAJOjW4eQePVmo3uzLLCmGHx0SGJyXjBUvdZROuBmlqTpw07putQH6CJ4Z3aeIBtTrpKneJavSOon4bYJJEIajB0GDKQ2xXFwFjNmnyN635XANaniEBrkAkfdHkqJnpTLtC7acfranxop46cLezqjTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6nnQeRhm9WWF+ijbyBnEi5GU2XOOgBo4HXmnyWh44vE=;
 b=OhtEZQFomVdHGs+BvxngHamRwemu3A8GsK0G0BWHLYo41YvqDb9oXqi3ITAgkwAdl8ZSuPo+eFbuvuljCwLlJ3t+HapLI16O8D/cZkXRHYetlGh2ONKDGRmvsWximnug+qox8E7UvX1wkVQg/+RA5+KxyaJ+IEHvlSzuAmBgCAxQ/SoXCVs0zPjECK8hSHSxWKgxuCcrkTLHsyBqIRS2PyxPSaqboP1gkS6/Kn88PihKTnd1B/yZhjUzEkfn0r6cWQO1WlZ3+RUOtc4GVP8G7TYPAsIKXOrshH8AHnVxt1cJoW0C3spFRYipA3wPHm2rcZakuA8ukjgGy79uW2Kj9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MW3PR11MB4713.namprd11.prod.outlook.com (2603:10b6:303:2f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Fri, 22 Aug
 2025 16:26:58 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9052.013; Fri, 22 Aug 2025
 16:26:58 +0000
Date: Fri, 22 Aug 2025 12:26:54 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <raag.jadav@intel.com>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH] drm/xe/pcode: Initialize data0 for pcode read routine
Message-ID: <aKiaTuU_BxfkjI2k@intel.com>
References: <20250819201054.393220-1-stuart.summers@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250819201054.393220-1-stuart.summers@intel.com>
X-ClientProxiedBy: BYAPR11CA0107.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::48) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MW3PR11MB4713:EE_
X-MS-Office365-Filtering-Correlation-Id: ca0abbe3-877d-4dd9-bab9-08dde198b725
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EBbz9BF1PfUHLnizEAmqGph7Lrf9ll21IWclKyO+7K/Tc2EzaZoBCwPNDcBS?=
 =?us-ascii?Q?lAokGh1d2BL4piWHyxZsaQ/jtqObORhisoYg8In/5b958UM+2ZLTpxsMFrJr?=
 =?us-ascii?Q?vQw+vK/UO8WDIBbQz/l4yFrK0MCOEzV9MmlRkkvqJ93l6wogyDTS4kcsoIVk?=
 =?us-ascii?Q?D6jHzQ/Lro1JEq87d1OHrbGDabcRHaiG/976agUzWp+DYQ71wio2to4K88RW?=
 =?us-ascii?Q?dvr98RPM/y1ZmR29e5DxKBsUJAfis1UvoM1wdrlcIZ6HPdhfnovwvFuUoSm1?=
 =?us-ascii?Q?7L+90d30BNWxwJFdQ5uIeAPrwK3zOhnuA4/i5gkuFpmr9Hxx+0gD7pht1ObJ?=
 =?us-ascii?Q?1eiSuSOssLAeXrjoUIPdKb4otFGDXAZKi/iKR8jJ2m0WYECxufvqVhn5tSf6?=
 =?us-ascii?Q?JFP93GxmEs691/g/J2Q9UkRBCDioHQZ7v7qjgVx9ZeL0D++6YwJ0PvflfuOX?=
 =?us-ascii?Q?J9yTkPkmuDFLHKI839+7lLN7WvoKvNHjU4T7+ECigxnLgRx3lq2ETZ9huf/5?=
 =?us-ascii?Q?A/deTGOj+Fd3+EDb+ymxXhXqGIBi78Gegor0AEAMSZ72rz96Ih05ifo2bW64?=
 =?us-ascii?Q?a66fS5U9m48GSyV6j1fP6uSvqDQTeDRIuZts344Y3Q8OKVhfQsvIWUvPnoRF?=
 =?us-ascii?Q?+UGugeZyzZENGr5l9NwDGY7lQ//uvYxa/XbZEPbJleM0DEtHhsOVTG+7dMb8?=
 =?us-ascii?Q?+0eg/ZdEb9l1r4Ud8fO84TznX/5q3WCAq+xX3kQC7e+KZZIzHmkjr9MLQJBB?=
 =?us-ascii?Q?dkVQLiXUWaHRLL/uVFYM00d8U4x34GhExqUJVBlOSnOOvJaau/tnSrVBdMJ5?=
 =?us-ascii?Q?XPo71rZ/59gWBGRat53oQLmOcZcDtCngRDGI/JeHujLXYUGWjFn+UnwsNJFX?=
 =?us-ascii?Q?UDUVvQVuPg9KQhEcZceV60zWLAUQnVtWpLt9W9ecKnYZwcvg1fn6Wnw6bM9O?=
 =?us-ascii?Q?YZzQidNls+tlMvALZbOoOjPttsj9vbGu7gffbi7mVOD9GBaJe/HrVVk3zEsR?=
 =?us-ascii?Q?n7V6Uf+UtND0vRb41rKSzhxUi1trlV0+JLLy2iYCF2hAzBh/YVLq3/v57Xec?=
 =?us-ascii?Q?4WDizIuWDmOCQvv46mhe0UuEfn6YWATNGgFSOjkvTBr9c+lVmjle5V9HcvMV?=
 =?us-ascii?Q?s6eZpKzP1P+oj1PY3cj0psWxx9k1SxLikPWiLDmLfZP9qlRcN1o9jgYWZ+q8?=
 =?us-ascii?Q?bt7izspPJEYnjcD7lwI/fsqcY7seFbdcqKa1o3W6Z2gyFVhZKDgm4R3YrESU?=
 =?us-ascii?Q?QsrZ5Wo/zL8lJsiR9fDv2RDPq315FKn2LqO2bGZzzGGoyUR+CywPNFvIz2BO?=
 =?us-ascii?Q?w7xXFYW4j0Ct94KPX8KCloNBQKOeTD7bGTmIqci9M7KPvkgU2F/r1EsBriZZ?=
 =?us-ascii?Q?4ZK37OY3qrmYeEp71E7DC+3HjaLxW3XUM/HgZvGGtBoCLUBC9VcQpBVrWQCe?=
 =?us-ascii?Q?yylVKSVJg4Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cM1PtLA2EPna5wPeX/3Er12QeT0S8HN/0Nfh+IPVAIBuoM81jwZOBTvrbSww?=
 =?us-ascii?Q?ZLRIBcd7Czf9Q04j7Wo6K/4Nsu6i+m2qHn2Jl3SB6NlXoEBtp3S8hvwwV4jC?=
 =?us-ascii?Q?xzPaE24gNTwyCLWK8J/O/LgU3iMrwf62aBhrqhlcN8lUo5h2p7QJbCLmMadu?=
 =?us-ascii?Q?gmCZ+ez3r4TN76l0u9Z/J3RcyrRgpZ/uW8F0h6npYMuuW68ZNUdiLYTcXdKa?=
 =?us-ascii?Q?+u8ifgzK3sZxO+Niod5ciDPugK0BSrI80ctACKobxAnTEv+A+UQyrLUk/JXQ?=
 =?us-ascii?Q?6eM3RN+KUmsnGnpZGZqzaosrBo2dkbIGAPnaixuTR3PrnwHn+kVGGiY3Xa6Q?=
 =?us-ascii?Q?eCckkJqKbzwmkEdfClYx6EzUEzEQNo2GxEAZ3PR8aZOKrG4R5VgWkgNMdAew?=
 =?us-ascii?Q?iKRpxlyJsOX0SK7cEnVdpC+6cY1XDy45SP46PuXgtJT/XEBFhEs6WrdIKjt9?=
 =?us-ascii?Q?94rP4ghTUTy3DwwwZSxvhfTcO5bMU2HzvCDbAUFSV3Scjl5tr/zPXCFxxUHS?=
 =?us-ascii?Q?y0411a6JOSP79Qi8wTRkZlgMvJmjgPO+Bb+vJg5ZehQQ9ZvANRBVJlF78pOj?=
 =?us-ascii?Q?BW+PtgAY26NWps7yQ4QFKpHzVfkfSiqFISUjp1igvwJLQ1xbypJvOE3P7voG?=
 =?us-ascii?Q?lQS3K2hoZ5rqDOqJhLL1Ejcpd/b5QXn5ZBTPqNqscGTl6FQ9HYki4hMYm6RT?=
 =?us-ascii?Q?rP66bSvHcSRR4MS2xtKJFXhe/9K/CurcfiQd1R32V6ScArxq1060/cqnH//L?=
 =?us-ascii?Q?j0h5+6H0IAYcST/n1Z8aTTd06Z8i9/lsJUb1HHnVXAB0BQpMIfQbLlEPlWav?=
 =?us-ascii?Q?Ec6DmuhrJxWBaGF/PT8v9WuwoHNsonqeLnB6nO8mym+hJ/TAwEIsT4C9YVG/?=
 =?us-ascii?Q?DVC3LmTaPQM15sr1/A4mCSbPVMJ30tIYl1v52iJrbrTSDFG+3Bn89PGOchsX?=
 =?us-ascii?Q?E31rktnVU6kj3kJQm8MZ7DG101Vhzyb6igMe1ehZ+llOWvsqv5n6yBk9c2Yt?=
 =?us-ascii?Q?xY3PSH7WKV3dx1vjiGKRDiWwnCONwsGDpkPGOAAUswn5TrnWjPVLWCYmdA/1?=
 =?us-ascii?Q?Kve2yjs9IvjJdWjdKHrRmsZqt60LaZOucbTfEB/W8sHuDVaVywfFQxG5b5SQ?=
 =?us-ascii?Q?+bxfIWWDw0ajjxKWfyQ1pSGqZAkfP//8PX/fxCVEUOs3Xh/yI5m4jCB0nm8q?=
 =?us-ascii?Q?dUh3gw9snzbwMTwEHAWl4VybvaUCWaLN3xqd0D6/jB4Zy6NIAdJ2wg4X6out?=
 =?us-ascii?Q?Wr1p/xGwS0+Wahs3rTl3swXZVIKCsRmiymbHjbl03IRhD5NyTgfFOvN6xdJj?=
 =?us-ascii?Q?6Lwlx0yi7wxxJBSp7VcICfmBVBnSO+zLpTdxI6b2ZizNkFn30TMPQQEusJDc?=
 =?us-ascii?Q?5LyXw1cHBgz1d+lH6HFXezbjgEF5/SiXHi5hOeFnexppucvYyK8rpfm3J9WN?=
 =?us-ascii?Q?qCiNyY3CI4BMp+1guXQ1OqbeNRiBb6OSeb1K5t/TGhLYV+PYjj3/kl2X84sW?=
 =?us-ascii?Q?EYyBrxOV/wDO4QtvwrTnV+ChS1I+Uhh4W8zf5sLMYSxnn2Y4pulP7Tyt97h7?=
 =?us-ascii?Q?37eimqbb3AHTtlzQrjdcPDiOjKaQyBuy+CqDAy2D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca0abbe3-877d-4dd9-bab9-08dde198b725
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 16:26:58.3020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JLS/v9Z7UsVo4cLe7RPGZZYt+rDDoc7kngzidJvFs7ug2YlwvStquePb0GeMIqNvTtpIRt9XUdZbaGGDgzaIkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4713
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

On Tue, Aug 19, 2025 at 08:10:54PM +0000, Stuart Summers wrote:
> There are two registers filled in when reading data from
> pcode besides the mailbox itself. Currently, we allow a NULL
> value for the second of these two (data1) and assume the first
> is defined. However, many of the routines that are calling
> this function assume that pcode will ignore the value being
> passed in and so leave that first value (data0) defined but
> uninitialized. To be safe, make sure this value is always
> initialized to something (0 generally) in the event pcode
> behavior changes and starts using this value.
> 
> v2: Fix sob/author

pushed to drm-xe-next. Thank you all

> 
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_sysfs.c | 8 ++++----
>  drivers/gpu/drm/xe/xe_hwmon.c        | 8 ++++----
>  drivers/gpu/drm/xe/xe_vram_freq.c    | 4 ++--
>  3 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> index bd9015761aa0..6ee422594b56 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> @@ -76,7 +76,7 @@ lb_fan_control_version_show(struct device *dev, struct device_attribute *attr, c
>  {
>  	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
>  	struct xe_tile *root = xe_device_get_root_tile(xe);
> -	u32 cap, ver_low = FAN_TABLE, ver_high = FAN_TABLE;
> +	u32 cap = 0, ver_low = FAN_TABLE, ver_high = FAN_TABLE;
>  	u16 major = 0, minor = 0, hotfix = 0, build = 0;
>  	int ret;
>  
> @@ -115,7 +115,7 @@ lb_voltage_regulator_version_show(struct device *dev, struct device_attribute *a
>  {
>  	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
>  	struct xe_tile *root = xe_device_get_root_tile(xe);
> -	u32 cap, ver_low = VR_CONFIG, ver_high = VR_CONFIG;
> +	u32 cap = 0, ver_low = VR_CONFIG, ver_high = VR_CONFIG;
>  	u16 major = 0, minor = 0, hotfix = 0, build = 0;
>  	int ret;
>  
> @@ -153,7 +153,7 @@ static int late_bind_create_files(struct device *dev)
>  {
>  	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
>  	struct xe_tile *root = xe_device_get_root_tile(xe);
> -	u32 cap;
> +	u32 cap = 0;
>  	int ret;
>  
>  	xe_pm_runtime_get(xe);
> @@ -186,7 +186,7 @@ static void late_bind_remove_files(struct device *dev)
>  {
>  	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
>  	struct xe_tile *root = xe_device_get_root_tile(xe);
> -	u32 cap;
> +	u32 cap = 0;
>  	int ret;
>  
>  	xe_pm_runtime_get(xe);
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index c17ed1ae8649..32a76ae6e9dc 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -179,7 +179,7 @@ static int xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon *hwmon, u32 attr
>  					  u32 clr, u32 set)
>  {
>  	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> -	u32 val0, val1;
> +	u32 val0 = 0, val1 = 0;
>  	int ret = 0;
>  
>  	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
> @@ -734,7 +734,7 @@ static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, int channel,
>  					 long *value, u32 scale_factor)
>  {
>  	int ret;
> -	u32 uval;
> +	u32 uval = 0;
>  
>  	mutex_lock(&hwmon->hwmon_lock);
>  
> @@ -918,7 +918,7 @@ xe_hwmon_power_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
>  static umode_t
>  xe_hwmon_curr_is_visible(const struct xe_hwmon *hwmon, u32 attr, int channel)
>  {
> -	u32 uval;
> +	u32 uval = 0;
>  
>  	/* hwmon sysfs attribute of current available only for package */
>  	if (channel != CHANNEL_PKG)
> @@ -1020,7 +1020,7 @@ xe_hwmon_energy_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>  static umode_t
>  xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  {
> -	u32 uval;
> +	u32 uval = 0;
>  
>  	if (!hwmon->xe->info.has_fan_control)
>  		return 0;
> diff --git a/drivers/gpu/drm/xe/xe_vram_freq.c b/drivers/gpu/drm/xe/xe_vram_freq.c
> index b26e26d73dae..17bc84da4cdc 100644
> --- a/drivers/gpu/drm/xe/xe_vram_freq.c
> +++ b/drivers/gpu/drm/xe/xe_vram_freq.c
> @@ -34,7 +34,7 @@ static ssize_t max_freq_show(struct device *dev, struct device_attribute *attr,
>  			     char *buf)
>  {
>  	struct xe_tile *tile = dev_to_tile(dev);
> -	u32 val, mbox;
> +	u32 val = 0, mbox;
>  	int err;
>  
>  	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_FREQUENCY_CONFIG)
> @@ -56,7 +56,7 @@ static ssize_t min_freq_show(struct device *dev, struct device_attribute *attr,
>  			     char *buf)
>  {
>  	struct xe_tile *tile = dev_to_tile(dev);
> -	u32 val, mbox;
> +	u32 val = 0, mbox;
>  	int err;
>  
>  	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_FREQUENCY_CONFIG)
> -- 
> 2.34.1
> 
