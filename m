Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93280C624DB
	for <intel-xe@archiver.kernel.org>; Sat,  5 Sep 2026 13:59:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F6010E1F6;
	Sat,  5 Sep 2026 13:59:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NBrmU47i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA36B10E1F6
 for <intel-xe@lists.freedesktop.org>; Sat,  5 Sep 2026 13:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788616742; x=1820152742;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=gnyxvvd6H9ZYjoq8yOFEOorKDZjpgEmrjkaCY2QA2tA=;
 b=NBrmU47ilmMqxj6RfL4OsAGKBxzUpUfvC2NF4QWnEh3Td7aGR+9YtOqX
 6fajPOVZ3HzhQmuqrhB2UthqJLTwhr8rXuojr0WMnPHy5QlfTAJihbT19
 a6wtCpiMoPIGql/a8X1vmPCV06ggqLDetkWYhDsRhNZLoV46naz38f0/q
 grBkvEHkkxQ+XkX+DJDiehL4I1omEsPtb7/YDf2Z3DbxQzI6WSlmAxVql
 nV2MEgOPoxdKyadWCyve9UWkZBCDcTV6MGXTotlnWQV4MFXMmw62iGuVG
 xkx+P1fzBBF+reXgi1hXpoguQAnZkZB7eK+j/kzGQYpXyyjUUdVCmEupg A==;
X-CSE-ConnectionGUID: 25Dq2tIcRRySQ1OjTD3Hhg==
X-CSE-MsgGUID: nJAkWRZLSaecnGVzrvXOKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="89147907"
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; d="scan'208";a="89147907"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2026 06:59:01 -0700
X-CSE-ConnectionGUID: 8myi3IV+R0e/wslo7qXpCA==
X-CSE-MsgGUID: NB0Dfmi4Q0eM+7+DWRXFTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; d="scan'208";a="272243106"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2026 06:59:01 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sat, 5 Sep 2026 06:59:00 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sat, 5 Sep 2026 06:59:00 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.17) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sat, 5 Sep 2026 06:59:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kn39g/OaKyhNLkeP92FpWj13vubb4Xz2lIm5OEnrQDSLnq8sh7QM6qP5BKuXGtGzYdF+bZMnU5eZ8/3Spx86B8IGBP0AQXN/xga8+v9MOHJ0noU86yhFXxEvPIXGIm31ek+TavVJLa4ebycQMz8L+8RcHMpFb4mnoEcizeVrbTKG0M6BGVDUKOQz0mxqdIMqCtTeybsv8y0PdaXLXUDiaByzyKjR1CWuGsBHiNiMeAkhDPcR1TWCfe5iUoOxbt1n3ePuBJHitd6FCApprogQxBjwi128dV2zk8bFr+wXblkJDjjfn28j8Ydavg4B9cTvq+7JJ1suDynF1hJdJw334g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u78KZkgsD0LRbu8zMg0ZUzpCa8jZXozHF84FlV53qrU=;
 b=zAwrqCFLSYotv1Pt9VskMo4kCS75xQ60AJHh4bM/O6bkNo7CdJ5txtDnO5E0pdRdXnsFn+OuP83Zo+iXUwJk34fj56Clcc5hvbTzPKmt2X5ys+XrUdspvbunJ2Xhciz9yt0bzDdAXB2SlPNl+/+mVzdW0OgnjWEHBNzrqybJrXERxPwR7fz47O9tC1yMkFDfLSX3eRkgun3ax7wyo0hFbrHY/q3HjuYpYpOw2AalG3drvBKVQA6yhTFRTm8M5HcjP5S85oqANwA/0hXsHATXgDrqskF81fOssbhK97LqfIsvMduqdGUhsPD6Fbfe+77Wy7Kcm539P9jqgUF3tqGa9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA2PR11MB5177.namprd11.prod.outlook.com (2603:10b6:806:11c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Sat, 5 Sep
 2026 13:58:58 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%4]) with mapi id 15.21.0360.008; Sat, 5 Sep 2026
 13:58:58 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH 5/6] drm/xe: Drop redundant parameter from xe_probe_info
 and friends
In-Reply-To: <20260904170531.516-6-michal.wajdeczko@intel.com>
References: <20260904170531.516-1-michal.wajdeczko@intel.com>
 <20260904170531.516-6-michal.wajdeczko@intel.com>
Date: Sat, 5 Sep 2026 10:58:54 -0300
Message-ID: <87se3n7qap.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0124.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::9) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA2PR11MB5177:EE_
X-MS-Office365-Filtering-Correlation-Id: 54367961-0931-4932-55f6-08df0b55d534
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|11063799006|56012099006|4143699003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: WyE6G9IKvtwPDEUPCqtRxcFry/pvNSOLNXBkrUaztR6fTAZqPt/aWGe/WqjhDELafn+eWisiu1RUQTx4EuHaH9dIL4VhP1Kuqten1q9VtyBWI61HMDpZPhppL1/vEK9ObY2+5btCUhpDZsUoBF2T+2gfMWV/snao4zg9ta4/vGBZ2JLOwr8oZTPHAItWv4mhA3xFk086J27h+/7HYNYcvASXy+zbUtmzgPMbWo3t/ZNd7wjZsGws18P8IFOIfX6GjfaO7bsAkvxsqgfwA8RN+51mO43bhIxhmF8bmincoasyFaS6jMV9+Cu5SYpMWs6O77HjkL6LVsOACZPTkvOcQUv8i2am0h7D/UlH3D1lvTmOEHn1VC7tQXHdYGivmDRkPIzatjHs6VeSPLqtRa4dHOawjf+8lLszgE6ySKmOHU8ckGMisMQFuqWnLlYuvI6rZEeghOiqTCkCtgrccqU1OzAX/RoB5sbZJmMpTqwVD3quDH/BXsiJcck5zZOo6GqMc9Hrh1ZzFiCJVaOwRrmyZtx0z5dLZwOZKvfwN2agM3jXvtipA/zV5SHe8e+x/llgDzxM4wtG7I7zdGB8nu2BHzBq0nzg9mQbK8ItnacqwRrvfQLotoElxvMANIYHpLIStpWMlUnftmodiuV7Qy4m3lVCeI/OI35a1CvSxG8bWoU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RDh5m2NcHfAP1fUxyqQ+ZlEIe4WyNuS84gwDMlUf6A77MMOMlZwCt2Da7lzX?=
 =?us-ascii?Q?lVRD9ksgB886scN3Qq/V/BDlnG7m+AhsUkl0CBpi2pE7UWv6GNBeIV9PrOFp?=
 =?us-ascii?Q?S66etu3t1AOqopun7CDQQ3y+jId/fCksgytPbmt8MJYi4XPuNIGd2CzBfYQ6?=
 =?us-ascii?Q?F7kbU1/F45bsYywjd5FZzHV+VPjAp56ihLnHKmyB848rHagbO+PXm4XnNiyB?=
 =?us-ascii?Q?2P+a343S/sJB3NlgRBfVlaJrw9ewUcQLFPpUerImFyvsyp/Ny7vOiGWMc/nS?=
 =?us-ascii?Q?W77CSdM9rPUWynjeuBbNceCUn74q+XUbZUN2aEZ3ph6xJ3JCSjXmCJrOKQeP?=
 =?us-ascii?Q?svbu4o1M2NlbQUMxybeMFEdEyaXZ9Z3rW7vfyc2kWI7Uefv09fi0oaknLt3A?=
 =?us-ascii?Q?YFmArqYaOpDoDriDkPJeJc+jtfCPSv19inz1Ic5EfM7oV29GuuicqZ/pgq8o?=
 =?us-ascii?Q?FlRwYy9DYSUzTuy3xnFh+RNdnEKqwyKRZyd4G2QKdAVtxIkeUIa88titO6U8?=
 =?us-ascii?Q?xqeaUMyt2hJOnfUhIRg877/Thw1RgrbWMQr4kzls1p40CDWrAF4g4fhQH2jr?=
 =?us-ascii?Q?PK12fM4eYmUl7Hzh6cywdaRUCETam57zoKC1q5Q3CbpeHx21yN10eAUGZbCj?=
 =?us-ascii?Q?Y1LaXNHhVsWqm3FpyNPB/EKh0LHBdy64zreSSewp39INMkPpvyDKS4O83jQk?=
 =?us-ascii?Q?1IR9pfuAiFLn5GxfRvBA9IFcMgZWmVUUo/tmNOkqGCDkqFa3b5CttCk5UGxR?=
 =?us-ascii?Q?swjvxGXsrLTPae1KIy6idAI62GO4N4YFJOeEqyh5I09wVJMvKuyWk8DW8gpT?=
 =?us-ascii?Q?G0LJC/GZ51Rn1VPYG1YqK60l21dvOUFHy96GTzZYFShOMR8PxUSWQAAtax1g?=
 =?us-ascii?Q?RgTS2IRYC2ECZq5KCQhpwDQo92aACaMJGCItjRfz6pSv11HIcXp8DhbuLRJg?=
 =?us-ascii?Q?TPlT4Dc/FHGKhxS3b3e9tJZkoJmFzGbUJTDD3LAbgP3IY+WKrjjxegmMoEOl?=
 =?us-ascii?Q?pcbDT7ioz2DSqf21oMwGD1Q6E+m0Hy9kRx4EPGSkKjqW71vAVDoxzd3UXvBg?=
 =?us-ascii?Q?wpFNbX732ihp0/S2PwkYhL9OwvRy14ed3AWDjSZRF6L4Jo/AtehSEDi7iAFC?=
 =?us-ascii?Q?AvsiMm2h0+HRx2qbII66O499tjsJCVG4h8UBQqm62Fb2TRVkjVZPflstvW5X?=
 =?us-ascii?Q?FAfOqvy1uTvtu0wBsmASkKgXsHcQMOmwNE8p2eBjYaYo5rl/x411fAa26u84?=
 =?us-ascii?Q?vGoKe11RfPrZMgxRsKLruJI8q0tQ+hvK6f8JcYWLALk5QFThJbNjTf08Khpl?=
 =?us-ascii?Q?QCGzZLK/vOb2X9UXk25sFEFRovHbCYvjTVv/njT5JERjCL5Bbu5ETrH0XQE9?=
 =?us-ascii?Q?2kdmgLDu0wm52/AYR27o+g9ulafgzTMsJMtexg4lxsxQINgVuMHTmwuhNrtK?=
 =?us-ascii?Q?DeqER0jg2a4pQ4swSVFlcW98Qb2KlSFI87bPAQfhQCOom4Xnvqy5RD+mkmbg?=
 =?us-ascii?Q?QWJJD7HNhqDjyJJFl0Er7KxJY1g3H1+giyx9b9Kt156a6fv+JzNN4oNRYUaQ?=
 =?us-ascii?Q?n2pmbXomSeqROJPjnomdGgMgUtLSrCzT3AdzEqAyd/mJPZHudr+5jdeA584+?=
 =?us-ascii?Q?BIHrs6yCjzYEI6C101teqaSxwhK7ZJTOaWTuUch2RWmmGJiLD2vx4IhVD7Po?=
 =?us-ascii?Q?9ln1KQjWE166c9YQ1SkU508pXqQducLXi2jWHQ0l+e1TBoIJuJBZt+hvfniR?=
 =?us-ascii?Q?XqFs+bd2xA=3D=3D?=
X-Exchange-RoutingPolicyChecked: 5p3AdTMYLMoWSqTOVEMS4lDKYzpneb5oCzYN2tLaS2zR7M5MhMyf/RDshesVuVqVGYSsyCz/434tneKxZDipDbjo0GsltxYwMT3/YzcY92FgZ52YWOMVoCrssyLaYV1nlTEy15WGo0PYnHxtg8EynlUrnGCJGrxDDxhm0lmWqSO01JQkuE/5CCbmfx1cYN5Rn5ytwh73za7atDud7HdnETjKzABUGD8tYyr+KxIoeQCSX7aJe7YxZLpw5n/hNWZkOtUss+cJZJ6jwTrcDcpQZMqLGhgLtkcz7elLe8050c4f/9KulYfJRuFnx6TyZEn7UjooKWD0pycpdeuKAXp3Cg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 54367961-0931-4932-55f6-08df0b55d534
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2026 13:58:58.7743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CLlAtzPzPyIHgNE5HJpj1gdMwNUAOqyLAnp0F+y0brtyLjPhI7f/xxqMdPow83v19elxFc3QNA9LDNwhTmIMKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5177
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

Michal Wajdeczko <michal.wajdeczko@intel.com> writes:

> We can now obtain the const pointer to struct xe_device_desc directly
> from the xe, no need to pass it as explicit parameter.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_pci.c |  5 +++--
>  drivers/gpu/drm/xe/xe_pci.c       | 13 ++++++-------
>  2 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
> index c817692c0ce3..7712282308c4 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
> @@ -311,10 +311,11 @@ const void *xe_pci_id_gen_param(struct kunit *test, const void *prev, char *desc
>  EXPORT_SYMBOL_IF_KUNIT(xe_pci_id_gen_param);
>  
>  static int fake_probe_info(struct xe_device *xe,
> -			   const struct xe_device_desc *desc,
>  			   struct xe_pci_fake_data *data,
>  			   struct xe_probed_info *probed_info)
>  {
> +	const struct xe_device_desc *desc = xe->desc;
> +
>  	probed_info->tile_count = 1 + desc->max_remote_tiles;
>  
>  	if (!data || desc->pre_gmdid_graphics_ip) {
> @@ -379,7 +380,7 @@ int xe_pci_fake_device_init(struct xe_device *xe)
>  	xe->sriov.__mode = data && data->sriov_mode ?
>  			   data->sriov_mode : XE_SRIOV_MODE_NONE;
>  
> -	err = fake_probe_info(xe, desc, data, &probed_info);
> +	err = fake_probe_info(xe, data, &probed_info);
>  	if (err)
>  		return err;
>  
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 6ca1ec311a4b..c401c8803796 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -836,14 +836,13 @@ static int xe_info_init_early(struct xe_device *xe,
>  }
>  
>  static void xe_probe_tile_count(struct xe_device *xe,
> -				const struct xe_device_desc *desc,
>  				struct xe_probed_info *probed_info)
>  {
>  	struct xe_mmio *mmio;
>  	u8 tile_count;
>  	u32 mtcfg;
>  
> -	probed_info->tile_count = 1 + desc->max_remote_tiles;
> +	probed_info->tile_count = 1 + xe->desc->max_remote_tiles;
>  
>  	/*
>  	 * Probe for tile count only for platforms that support multiple
> @@ -946,9 +945,10 @@ static struct xe_gt *alloc_media_gt(struct xe_tile *tile,
>  }
>  
>  static int xe_probe_ips(struct xe_device *xe,
> -			const struct xe_device_desc *desc,
>  			struct xe_probed_info *probed_info)
>  {
> +	const struct xe_device_desc *desc = xe->desc;
> +
>  	/*
>  	 * If this platform supports GMD_ID, we'll detect the proper IP
>  	 * descriptor to use from hardware registers.
> @@ -989,14 +989,13 @@ static int xe_probe_ips(struct xe_device *xe,
>   * Probe from the hardware the info required by xe_info_init().
>   */
>  static int xe_probe_info(struct xe_device *xe,
> -			 const struct xe_device_desc *desc,
>  			 struct xe_probed_info *probed_info)
>  {
>  	int err;
>  
> -	xe_probe_tile_count(xe, desc, probed_info);
> +	xe_probe_tile_count(xe, probed_info);
>  
> -	err = xe_probe_ips(xe, desc, probed_info);
> +	err = xe_probe_ips(xe, probed_info);
>  	if (err)
>  		return err;
>  
> @@ -1240,7 +1239,7 @@ static int __xe_pci_probe(struct pci_dev *pdev, const struct xe_device_desc *des
>  	if (err)
>  		return err;
>  
> -	err = xe_probe_info(xe, desc, &probed_info);
> +	err = xe_probe_info(xe, &probed_info);
>  	if (err)
>  		return err;
>  
> -- 
> 2.47.1
