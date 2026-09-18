Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B78C982D8
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 16:08:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA1710E936;
	Fri, 18 Sep 2026 16:08:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JwXuF92z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E7310E936
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 16:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789747718; x=1821283718;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bzWOsvP7ZHoL1DhnYmLEwEBivto43n+RVeqqNZutT7A=;
 b=JwXuF92z6pQuyFw4tLhomaXvIH9cXrxiaHSsL9sBTaxYsiDIRhQ7mpr+
 X+yRzDGe4vlGVjX/hHn0ENLWcmZ1pDdhbnaYynuJE5eBBD036ipZkQutY
 BRfWcDaY9EHBqEr28Odn9JMvtZa50q/kDnnl2KWxkmbQp1ZlkIHflCzze
 GTHjq2vnL38LkE/zwhNcdKEzF1vrKB3bJunKhUMXbj7hqDwu3s/+2i70X
 X461uflpBNLytx0qQJlq/OO207A5PpPC/lrLphASXs3vGyEtm+glwI1v2
 A3k8SNn/BoJSJoiLSDUVet5xibBwTcOjG/xvZR4OPSoWDpFYSxSXoroXC w==;
X-CSE-ConnectionGUID: 4CnEs3lRROOa15Tm+mW5+g==
X-CSE-MsgGUID: iwsZvOvzTh+vZ/Yo9EWpRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="764514"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="764514"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 09:08:37 -0700
X-CSE-ConnectionGUID: 2JLYrIfbR+y70tGjxAYAPg==
X-CSE-MsgGUID: gbvikKLGR0mmOsEM12KO3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="297920628"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 09:08:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 09:08:36 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 18 Sep 2026 09:08:36 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.9) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 09:08:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BZU5xXzY+0nYxMY7kaqicoTNsithAQQxE3SDyKMiWSxVA39VNMXaTMzk7CgLDlW6GcZdZpGwX+GVrQsgaTZKDCLyZ1/2EFiQJISgIGPy0Tfqq+j2pzr5ouL8IYR4rJzZJcGcH8F/WgLrFTXjaOrIl+fN+K5PeSxNE7CNWjl9q+U37vP8nxB4UCsTXGRAp/vecn6QtTXmPMU61btY6t96dq7hrQvuz8o8Nx4OHPlGEg3v2s812R78tU4cC4LhXp9w6htnWJ/KhKFcBiPOYxfTT1V+1W3/g4AnzvKF9UuTGEPa9xdPydxOgJ3xRhfkKG6uWLvN9A/X3uxqbluWM/JO4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/+nyyNtyAz4r/dsoGhaxpHIrzDX5eVM3M4xlvnR+YRg=;
 b=Jjm39Rg1l9oirA7e5FZ+GGEeO5D5Odm+O1IcKWhNzFzfyqZbMUst6dzaW1KiB81Boz1QHio/dWU/VbJzHFQ3BkNMTM3lU0hN4mw2+nuj32/yg1oIYJy1pe/hwHX62Mo0PxO0RXDf6GTtpk1sqKWojPBR7CeruV51DDD4tgFVvSIXgxhk3MK0lpSVZX1OYOQp7afz8keao4obkZ8LLTS/kKlJKykYUXHcCK86G1iEWeYdRdt+ETSHSuaOALtnpO/C4M1XL8U59PRtYRzvRTZWxiqIm7BDJgjT9+fe5Lb+oAB2jEQepPZ9xAQVKegifsRJijw81RxkRD37hV7L4Qblgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by MW5PR11MB5882.namprd11.prod.outlook.com (2603:10b6:303:19e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 16:08:31 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 16:08:31 +0000
Date: Fri, 18 Sep 2026 12:08:15 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
 <matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <david.e.box@linux.intel.com>,
 <anoop.c.vijay@intel.com>, <badal.nilawar@intel.com>,
 <matthew.d.roper@intel.com>, <james.ausmus@intel.com>,
 <karthik.poosa@intel.com>
Subject: Re: [PATCH v10 07/20] drm/xe/vsec: Correct locking order
Message-ID: <aq1h77wzNPpxlNrn@intel.com>
References: <20260918131751.2408883-22-michael.j.ruhl@intel.com>
 <20260918131751.2408883-29-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260918131751.2408883-29-michael.j.ruhl@intel.com>
X-ClientProxiedBy: SI2PR01CA0004.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::22) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|MW5PR11MB5882:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a8cf421-aec6-43cb-001e-08df159f1527
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|22082099003|18002099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 0kaOlNq4vfh6+Pu/1zZxQwZcDeB2X1EmFlT965BBKogZ5hVoU5YVe5a6171+KQN6VmXc+wrBavlNtgjKgnR3aUjHG0kwPN7OiaezcIWtibzljYYbQYLAIu80U9nvautIju7nKfPiyQIukyHYzF7bCrg6ma0NoeL+rlxGVUqt/VjEJwbSToiHLJ1LDWuLGLON48MWfUlf0Avxj11MRHpZZsv7ggK/Wpdnd4apr2JPSFgtvqVaCkdMfUbaeJuorXLCjX3e6B+7Z3Vvuy010kTAZWUfUwOCvaedo7F5+QOUikHg/cA8CZJJNzf8KtmzlfYokBxpD5EiBg8tCsIOLJl3q8D7UiyqNSC2JCfanSeeIH/3h4zcIRod2QyvBLkGIKxUVp2gLaIwg4v86oNG7k2rPPLDQ9mZ5/P9+tZmq/3B/tnimKIK9qQf4EoBdUBvWuup0ActokDJW3nY8iZfqjcIXMpdr4jFmz8k3J3vMC1dxsY1IwboAN/fKBO37XNMYaBnHVxZLHyp/SgWg2t3CykAJDxAo3BYH243Rbs3oLU5TyNuGe7d9EqWbi3QTOtsQXKCAOqBBLcKQWMccgMFbwVKkYsi0F/XQMsYEYzAIFz4w6l1+hKmeBQSMDBMdTcHJ5A6H+TIozcITweYR4sL+xMyG19pyxTssxbFlbZJGPu5ico=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Rh9/0/clk9IRMC9rYOxBjn9IVacLrTHRfIWDIBjL8LIqemzSejXLaO6SJoYh?=
 =?us-ascii?Q?O+ltlbvt98GgtkOPQSvXJCI7VXjcRBdEQU1F0CTI9kQg4y16w/uvWlzkjjow?=
 =?us-ascii?Q?L344gqyFB8ywJ/gG4Q8kwwB51IW7bP1W9XjDZlQ9HcNaVt0JokIjP+Jn29Hn?=
 =?us-ascii?Q?UyyFfxfvONWCtL5wWy0XYMxbbjpgeOKj8BUi3aBCcRPnPt7/WatWe6XIii8J?=
 =?us-ascii?Q?SxbHlQX1sqH9BwFwjZJFa48o8KUvFYIpIG6vnBlfoMJlLrc4hhrm+jsK4AZf?=
 =?us-ascii?Q?+asZkWzUIeQxFt7R+Ak5QcwOwfi08OewhFqjTVQx+QIlx/um6PpcOcYr8KMG?=
 =?us-ascii?Q?1r+sepqXNU7JNSQMXbSe8aBLsfTmH/IHc2CAgbEUuWPtu5z/hFg/8Zf3UMx5?=
 =?us-ascii?Q?FTBXhFs4ExzLBZOXnM48WY/Mkw6Iq75RG9M4cctk+VhCtW0l17GIGQT1kPE6?=
 =?us-ascii?Q?XkauT3xtMg3eB3WnKqCPhZ2YSmpCmWCN0cZ70Fmjhr3mldbgqfbAn4EVHDVY?=
 =?us-ascii?Q?TTzrND85SRPpJXdCiR++Enbp8bdM5u2BIqFE2tu3TPSK7LqJYDclmnOdwHsX?=
 =?us-ascii?Q?JEvhB+wmmX0cK4Ii/DhcQF/Cqku6WSVgXP/1aZR/54uUmKTsLA1HHs34RWz8?=
 =?us-ascii?Q?qKX1n7TZPaJugoQjYpLQOgiv/7KZARQu4Yf1n3xVrXlCp1eBrX8oYd0x2Ha9?=
 =?us-ascii?Q?L2MgqrTiDlF9IcAePqk/wY3UJ9aWq6rHC7cJVXYsR+o1uKW7ikccotLyCHhy?=
 =?us-ascii?Q?pR7epIdS0ilJDwj5F66sIvzy65ttsE78k62SLYyQBaqM50JY3QG8OLOLN6zY?=
 =?us-ascii?Q?l5rqqyFDavvmZzkYYTygHwOrZ/eNgZ+W4XS/NfxFR3WakOG+NKpbZgP1cgvC?=
 =?us-ascii?Q?3MnVCw2+VKWRgRc/EWZFkqrr7dlg1f+6X1WRLbLTw/RL2s957vTSg5RWU+2F?=
 =?us-ascii?Q?h2b2VSk4MDR/pJAPbaty1B4NZHTF7FCsqXzXOMvkZs3Ehi+Y8HJo8viorzzZ?=
 =?us-ascii?Q?ixwGOpMSeEMVjKuhzeFvFmvMX/6Lz6Us3IRlfOtJfcqik4IzOQpW5j2JmgDy?=
 =?us-ascii?Q?tEHOjKA8l07v2EOWO59uHtjoxm/drJ/SJsKekEGUpY0H1XYONLlOxDiLZ1if?=
 =?us-ascii?Q?Dyyzd12ySXAcjVSbOmfwKjJ7dXuiXsuFNVY+quFgesR84naycwGt0J1S8zWJ?=
 =?us-ascii?Q?nXpO6AR6NZmmRxtYhAuNLYLmVvwOHUhMHic6zTUt84xq7iwDfckb3lwvWFx7?=
 =?us-ascii?Q?hWiDTmL9u6r8tj6p3DE738faGypQJisvygd1Km5DABUWRWpoO8NALznoieZJ?=
 =?us-ascii?Q?CzJ9LPlJgKozXyZ99iCDFoYAawZ56B4PsxZ6MY7V7k3ehbc5FzLUej4KCETO?=
 =?us-ascii?Q?1S6PMr1u5oZVD73vldPUORGdkudV7HFapM6XfxIXhL9FEM4E43dFmOaEL1E/?=
 =?us-ascii?Q?hBYRS4nLd9iIgwwoQ8vWtXVleDklTKPb/nDFC0RumdT2owlXg1w5/x0bGoFN?=
 =?us-ascii?Q?F7ePp5PxmL5rPv/pAmmkWfT6m0WhNp9k035JmSW3zWGCC32DAjGGLOI/tDGS?=
 =?us-ascii?Q?cAk132Y8E2jUU4q4LMCIX9saxcvrcIBvhzLZA9jWVFob2/qTq8zUCVEpkQHp?=
 =?us-ascii?Q?tmqOsbqrsgCCQi1dM5rj70kya9V5O1ZCfK7YrskA6pPqKWYIuzSQgN2KqB66?=
 =?us-ascii?Q?C1d0kTE5KrNc7u+yr11ZeyDyNClVejB48ya9e5tBTiHOyMP+tyhjo8yrzdCs?=
 =?us-ascii?Q?igpzga7DXg=3D=3D?=
X-Exchange-RoutingPolicyChecked: mC58DrAi8jqGlvxasAfqiBrwfWooUn3LfahHqz2oG3D/jeH7vtSl2qm1iLSNBOlEo0iEkTobkLWsNEy0dRMJEHDxulMJlAoFpjMxTzotfabzRnlg7R4C/i7qnezXCHfYUOKsp+0A+7Nm8kJ3uJLOHX+7Er3RkbulQgajvGAZ8QZ8V0d9rOsIzfsCuBekyTQ5iyzaTemBY0cC0NNqbgTgfho/hFaVZcoAg+/uG7Yw6M/29ijXX8HHwAZzFWNDjZZnhucj+Xd+prdPhS+w0+xBVH+yXMXDc4GNNvJVKUH+2wYE8vmZRB8VuvWcMim6qccBcXZ/0e9ABjdzrbEN92CLqg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a8cf421-aec6-43cb-001e-08df159f1527
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 16:08:31.3780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iGYJ0YKBV4qSN8vjH6XdZtniJK5FU5ZyJB2ctgCS8zLVuYFnVGdh67HdejfzGmyIkblkdASE+0m11QN18u3VfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5882
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

On Fri, Sep 18, 2026 at 06:17:58AM -0700, Michael J. Ruhl wrote:
> Xe locking order is power state first, and then local locks.
> 
> Reorder locking for correct usage.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vsec.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 481bcbcc6372..1b88ac1d2448 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -157,16 +157,17 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
>  
>  	telem_addr += offset + user_offset;
>  
> -	guard(mutex)(&xe->pmt.lock);
> -
>  	/* indicate that we are not at an appropriate power level */
>  	if (!xe_pm_runtime_get_if_active(xe))
>  		return -ENODATA;
>  
> -	/* set SoC re-mapper index register based on GUID memory region */
> -	xe->soc_remapper.set_telem_region(xe, mem_region);
> +	scoped_guard(mutex, &xe->pmt.lock) {
> +		/* set SoC re-mapper index register based on GUID memory region */
> +		xe->soc_remapper.set_telem_region(xe, mem_region);
> +
> +		memcpy_fromio(data, telem_addr, count);
> +	}
>  
> -	memcpy_fromio(data, telem_addr, count);
>  	xe_pm_runtime_put(xe);
>  
>  	return count;
> -- 
> 2.43.0
> 
