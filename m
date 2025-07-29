Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D11A6C87FC9
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 21:41:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E64A10E2D3;
	Tue, 29 Jul 2025 21:41:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y74yQCjr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B5310E2D3
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 21:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753825296; x=1785361296;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1AwAgMrO/q6fq31IX0Bdw8rpPbF/D3y8XBjCYBQ0X1w=;
 b=Y74yQCjrteSTzeR9Xzj+Lu1TLGGMqIOMr9XumtkGeCNPawi6ezV9m832
 XKTxtJpC2Jss1jsl7cxvY4BL1SzKFDjY6DtjfoLvDCpeU9Iu4DNSYCYfj
 /tV6yQZdChi2h4lKyev4YE4TzPVHlFDm9yAPTn6/3sg2QZpnExs6wyg/q
 0LhFwFJwklk9FHw2h6XZLBwYPGcxQIb6tSRmimOC4BtX8T8382jxwjYzU
 gkZiTCHKnovTNF1c9BuGqZYOUZh5HsiHuPh/j+aNfPVZ2C9id2/s/awWb
 jNVa0ix2yTQrtTGWfdhdv4MgMSt6v+No736onsCBSDVsAs5q7494E1Dzc Q==;
X-CSE-ConnectionGUID: gTUgG9rYSPGREeSGvzniuQ==
X-CSE-MsgGUID: alNJBUt2RYWw1DvtbhByRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="56193113"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="56193113"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 14:41:36 -0700
X-CSE-ConnectionGUID: a5+FGkI1QpWoUrXyvL/aKA==
X-CSE-MsgGUID: LgChJlODSC6tMhVWdxiqww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="162843717"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 14:41:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 14:41:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 29 Jul 2025 14:41:35 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.71)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 14:41:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kn+su911UdLxRDFsuebMil+wgVHWtG7BkTZ9KlVidO6vDCvAp7xGymcTQgDE4YuT/tt9ShTzp4XuiV6vuxqYOINAwFY6vKWV/zxKHPimzFB8gLnPWP4lHJnONXhuWaGMU3AJGiDqJtinW/94qtru6FVQU7TxnkVKZ9aHJs1jYatshGlbXXYRkanjcs72mmcVOnTgtm4BaTGAlZFjYp1q3IB+4zghZYOO1MzmVXdzpsioeGFW2Vnz9wiaZVxtIo078Bp5xgN1nnY46irh0+AuihA1KlG46uL3H9Jv7ePRF64yH18JoVn8sVbwivKljeA3M7JcmUa6da33HB5pxhm4Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S4cJwQIdrMEFQbqorJ3pueZfSnCajZd1P+Zak9O389o=;
 b=d7JKSKFEmxvhvzoj82z3YTz7EGuBAUpV1YRdTcriE04G0MidIQNhzg9mL6ZxAdiZ4JLCN+PgObZL8L87J2q6lM0CdtOo3oIaCbiqLutbNq6YKND2dMKkPPGxkaLxcFKOcbs4nMMya+OoxDv/zddaJPflKXY8NeZrJs0ui5s8tmkkWCUb3LqnyUcSAgwD4HjUGsj1jCadxEyMfGFbqpygVtoOItmhZ3onRG9ZK5bg6h+xuoQ4CfKZS/0Asv+d5bu+XyQ6uAAHLcTRqgM4Zi9pL5xhj+AQGaZx41nIWOyfOJPkAj0x6nAxw8UIT1oFV3pqIyGihF/GAmS81gB+GxtN5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CH3PR11MB8518.namprd11.prod.outlook.com (2603:10b6:610:1b8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.27; Tue, 29 Jul
 2025 21:40:53 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8964.025; Tue, 29 Jul 2025
 21:40:53 +0000
Date: Tue, 29 Jul 2025 17:40:48 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v5 10/11] drm/xe/configfs: Only allow configurations for
 supported devices
Message-ID: <aIk_4BBGSuIp19WQ@intel.com>
References: <20250729114215.177586-1-michal.wajdeczko@intel.com>
 <20250729114215.177586-11-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250729114215.177586-11-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0168.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::23) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CH3PR11MB8518:EE_
X-MS-Office365-Filtering-Correlation-Id: fb91a9c7-eacd-4cea-800b-08ddcee897bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LMJr6Z8Rd4fY5FsKtEMNavrHEgXcvxkYCrU9epvHkzq2H40emKBeiQPvFxxs?=
 =?us-ascii?Q?d1dodzzm2IkpuwPg5tfMFwjnO7RJRYWUDToMgoUbK2zR/EkyezAVRCeE6wX3?=
 =?us-ascii?Q?VAZMDWL6PNX/uZVTZ/pA3BB3QaUhlsYohGqO63s6V5+UDV3B6reBe8ZOHVvs?=
 =?us-ascii?Q?8qFMtdmjFT+YMFjgoFG1143KvzjFRGRHXsLUT+YR4scfNcjE6/m+X2QsFeSD?=
 =?us-ascii?Q?PabbqeCmTg19zZKgh3fmb/prGX7Pnup2rsFyPaBpyr1KDMlBrlzfpMmhJXS6?=
 =?us-ascii?Q?g0Z0MzP746gb8Z5Ph9eGRj3UlQ9Kd+fv8/hSwHPv1JsxpFxdjm5tT9PVcG1+?=
 =?us-ascii?Q?V3QCKVXPL8G+o02095crAts1cZhHO5Gq2UBSW7BLo2VaGG3mo/lI64drb7Qo?=
 =?us-ascii?Q?Xj5nVrB1mTJrBzLyUk9TjD+fGhnCMjmylkxSRC0a2JSo2FFGTgedcmFkvMHd?=
 =?us-ascii?Q?ftyvmIWiFeskNJABa5ojTEi+uGu5Pfv6g9Ulbk0xGmuJ0lzDPKaKBlyTxn+j?=
 =?us-ascii?Q?6KPJLFqkJrzI3LPeLv0JMmvilhbnEEFOxlza/FhufmUnrB8e72zp3mAt6XcK?=
 =?us-ascii?Q?5U6eQJvKmPtj49ihz3FrgK3USs7NpilfkbF5++BjnNFYafKZXOVOx2Jab1n9?=
 =?us-ascii?Q?r3fKVnYSN6Iu4RkFXo8MxjJdbT9C8lyv7KpmwuaBV+JCV+ip2tz+8GlUtoH/?=
 =?us-ascii?Q?U43wneiub57X/8zbWRM1ADewvo0xIIukcvcTMDq6HsmRaCl2pV4HJMZes0Sf?=
 =?us-ascii?Q?UPxNXFVKZU5nFrhDqsTIgCcN7+vz0yjfXvkHfswWbnWT75azAOBWPfYbqO2N?=
 =?us-ascii?Q?H/g4Ls4Rf2YYVd8VVjhGfWl56aDqOS0SHQ/yxdurzyNifuP0mTMx3Xr0HpXP?=
 =?us-ascii?Q?1MWBIqIQrszxdT5tw8PDwmtCPAAfXWL0VoC8iKBqmuW4TXcA7MfCquO7+nE1?=
 =?us-ascii?Q?iL3uAFTj2zogwUXlhr9fs/6KnQ+MltrU3i9EiWQgnN1FpWUgeprhqLzVbx/T?=
 =?us-ascii?Q?kdrWMRXHROvsUubd1CEjg1oYw+AJ9aN54UctAlrwpb43zcQquy7XQF1w4WGX?=
 =?us-ascii?Q?FgjKV6cWdQmbWtcg0LDt0EsVxDx6egHzd5kDVT84Yrnhl7iDUYN6PONbg6b+?=
 =?us-ascii?Q?97kQanXutGiW24S7+kQRXo+aTlNcrutKG1LQPRN34wjRWZKKGJEr7gbcm5pC?=
 =?us-ascii?Q?IbDtOXBpU6nMVvvxjmE0YWymRHJa7MTevID3JS4LagGedW4+54ssRWZmoMYv?=
 =?us-ascii?Q?3pey/rt5jycNMoE81fpbSjGrIL06/2HD1FnyDCY14X2SGSGx3BoWUJnb/D9J?=
 =?us-ascii?Q?nqw1hQuLXoQ3S77jw0wbS02PB9bPoraWrgHifB7ipYYBhSTvKAJRmmJef5Oo?=
 =?us-ascii?Q?4NSdkV88dyfGvrgT0uhm46Ksal6mhYb8zf/64B0fcgYSIWvHCA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VPyzBpT4C1jm1fgt2d0MlYXyCKRUujmjebNL2BoJTxfNZK10IdwAY5kwOnS3?=
 =?us-ascii?Q?/9S4uP/fYyOstkZ5Y/WYE4ZTAUvzkCDkjeDjNqvE2lyKhMBKJ+G8OA49JP/w?=
 =?us-ascii?Q?tBUrEKwQIcxJS5ucrnMQfLEfdJ28yroJRhQqme7DzOkWkKF5HPYAnezFM3cM?=
 =?us-ascii?Q?oSNtHefHdbBNRwZY6y+YPjrKvHZHagYi17hZK8IcTj7pHREh531IsCVkTYhu?=
 =?us-ascii?Q?kt8rxPRj9clAiF04nladLnaokeIOxZ4Czcm0XVESO8V73VpZ0AHpWf4LlQKk?=
 =?us-ascii?Q?tl7x6cEHRMxq8Z/cELKq6mIF7ERrfsjKJv0NUSAwIeVxMcplOKPiHSrZOWGA?=
 =?us-ascii?Q?kFM35WurTqo4tKn+8KZwjHjYE27EGPTMsXJuaSmWSuqGR5YCRHP/m+W72lGH?=
 =?us-ascii?Q?YFsvyyMeZ5n7aQt3sjE0MzWDpTvxRiL9ag7AuVwMfd4i/ElCRQ6/AtqYuEJc?=
 =?us-ascii?Q?gBNZjQHjQ9S7i1/kdq7GdiPSNPzbP4e3xRaZgiaf5amsR8JXScAGHEkEFrZC?=
 =?us-ascii?Q?+iMN+bSjUg/HtGPWSyxF+Dn6eydV8S6KRotEdrGQJ4zK8VmVX/0tODJcsGj4?=
 =?us-ascii?Q?fALVKsbyqmsIRpolREncMGli0iNXlMyDr/P0VdSotWZoSJwLQweHfRmPQZkd?=
 =?us-ascii?Q?i5PFrTvMzG/lVdphRT6q+N1qhxSsmZfgHkpfq2CgerQZKoPHwlT8ZHZ8sTVM?=
 =?us-ascii?Q?xWTSc9hzd1q+vowXx4KjxBgKPX3me+Mut1qUrBH9J1P25GrvRBA/q60MeYCd?=
 =?us-ascii?Q?bs4P4CvxQgzxhceAogA2ktP+Dj2MgcwcC8+2Bc8E3TcgYoTVgEnHsZ6tpEDv?=
 =?us-ascii?Q?+fMSs8aBWlHJ5Nv9ONdYayWBRw+zdQuz+CpGk4G8QqFOeHhHjDRx4I6L4ZQd?=
 =?us-ascii?Q?kKAyU2WYeBkWG8+z9GuRq+nS9sPjgJ27lNi7s1xgpgk0ald3tg+7dG4mZwzM?=
 =?us-ascii?Q?dVD49AwxWd05ybgIRrKeTWqxPplpnks5JfjwtWO3OSMSMOIKAyNlfkFCgGNc?=
 =?us-ascii?Q?vh5Yb16xlWFelX62cw+D7/dwK5u/V6/4K5K5V+Hgm5jenbNX3pgHPh5mjvmT?=
 =?us-ascii?Q?W+SkQPBkbJu+RxwWsWmmXSQzThEPxgOKt/M7fjFgLpPtn1vBOadjcodlZEPu?=
 =?us-ascii?Q?jgxvOkq1j3zNlm2c49sjhJzbzz8ST3tgKMF8U6tWNO+XlT8Yjbabn4TLxMFY?=
 =?us-ascii?Q?qu9VxgRdJeJT5xo8pdUT1fDe18KlFvtnaAeB0lJtLhoCmIJiD7kIlYn+PAYT?=
 =?us-ascii?Q?h+3jObSn7gnI2u2OlfO3cpjYsq66Rp7EwTuzJSv4Z0KqCX6L5dodU2ct8YSa?=
 =?us-ascii?Q?QNw9wBZB2kOdR+LGsmpXKfe/KpkCXiupUx8bOTsPHuuxqnGppbZXpR/gQNCm?=
 =?us-ascii?Q?3BVpCnEUg2C+SNNXLfRoTirsAMrcHb14DrCgJN91m1PfxbXHManbZLt4wl/Y?=
 =?us-ascii?Q?FzrI1pRujrztvUKSBw/mKAFF+JRds2QVgLb1jWoZJy2X9w2K2rz74oRC6MxK?=
 =?us-ascii?Q?SPT81SjYiboLvTn/7/5ochYdJQ1n/a7xxGBwlwCYIOerTUGzy5CzFttiqP6u?=
 =?us-ascii?Q?Q1dTMV5tKBS+zB0J/ZZhUtzbXhI6QsjNkj87q/uivmgh8F9Zm4BUfswJSU/B?=
 =?us-ascii?Q?kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb91a9c7-eacd-4cea-800b-08ddcee897bb
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 21:40:53.2158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U8XiFQbJrJggFZQiqHK7zbDmPe97M5+UiUqE0oqqAZcooc4R6fr0cmKKWH7Xg8hHRIe10CMRUroud6aa7lZk2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8518
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

On Tue, Jul 29, 2025 at 01:42:14PM +0200, Michal Wajdeczko wrote:
> Since we already lookup for the real PCI device before we allow
> to create its directory config, we might also check if the found
> device matches our driver PCI ID list. This will prevent creation
> of the directory configs for the unsupported devices.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
> v2: rebased
> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 5f145ccdf535..766775772eef 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -275,11 +275,22 @@ static const struct config_item_type xe_config_device_type = {
>  	.ct_owner	= THIS_MODULE,
>  };
>  
> +static const struct xe_device_desc *xe_match_desc(struct pci_dev *pdev)
> +{
> +	struct device_driver *driver = driver_find("xe", &pci_bus_type);
> +	struct pci_driver *drv = to_pci_driver(driver);
> +	const struct pci_device_id *ids = drv ? drv->id_table : NULL;
> +	const struct pci_device_id *found = pci_match_id(ids, pdev);
> +
> +	return found ? (const void *)found->driver_data : NULL;
> +}
> +
>  static struct config_group *xe_config_make_device_group(struct config_group *group,
>  							const char *name)
>  {
>  	unsigned int domain, bus, slot, function;
>  	struct xe_config_group_device *dev;
> +	const struct xe_device_desc *match;
>  	struct pci_dev *pdev;
>  	char canonical[16];
>  	int ret;
> @@ -297,8 +308,14 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
>  	pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, function));
>  	if (!pdev)
>  		return ERR_PTR(-ENODEV);
> +
> +	match = xe_match_desc(pdev);
> +
>  	pci_dev_put(pdev);
>  
> +	if (!match)
> +		return ERR_PTR(-ECANCELED);

why ECANCELED instead of ENODEV?

> +
>  	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
>  	if (!dev)
>  		return ERR_PTR(-ENOMEM);
> -- 
> 2.47.1
> 
