Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064C8C624C6
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 13:59:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8FEC10E902;
	Mon, 31 Aug 2026 13:59:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m7TV76cQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6155610E902
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 13:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788184790; x=1819720790;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=w4y0J0eynYmdtHzWYCSBBScF6RNuBjvEphCZty5Kk78=;
 b=m7TV76cQDfLpcX+rhPFa0xfWlFMrIoq9Prw2Uz+6+PRnow1L6buB48ND
 aYABaOSy0x1Ivgo86Zkkv0ufXCBPjcOVdKI5hgL4BT58GhAOwINHKVDW/
 awsFrVdFBciKeRo8zeyeOvQjX4vGbCqhbqUKXMFRPJOHfmlUrqAtvWp4r
 rx2g0aVTGpQVPOBacxe4VtNmJCwkvC2NCsNvIa77/SXgjVmdo7YzmlcoC
 1mwkQzyxuaR63Qhmi1WK87M7vHpKw3r1vmAsTn4SxYwjWyYbvTlkvhccy
 OlQ6irp9MQhw9XA/6OTvHzgKakMuICVcE+7dVH/qhW8uErt00z5ZkTHK4 g==;
X-CSE-ConnectionGUID: aYakQdKiTBmNgb3wg8dYYw==
X-CSE-MsgGUID: v9fiz9xvQA+Xs20WiPrrmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88603568"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="88603568"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 06:59:50 -0700
X-CSE-ConnectionGUID: uAjwcBl+RnmMRpoqjC5qwg==
X-CSE-MsgGUID: x7Zbv/AmQF62gJh/rz2jRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="268845663"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 06:59:50 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 06:59:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 31 Aug 2026 06:59:49 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.14) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 06:59:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eaxb85kT/TuXiYP4XKTCBvI28UrFe6DHHEmDH99ludP1AeUHPNO6qd1v16qqxKys6RAIqFIuiZS4z7ySynJl5WxFRB0hZHEVOEUwSmUJgm5M1PW3Yi5HKpP2b37rbmsUgqCcbhwQy7dtwMKDjAbV2DwwX5n9MYCjgagXcgrcsIXvGqAbPMjq0SsF10nTCCth0sFTms2zgNcYVV49EqGDFVNP4xURLvOJSjCJgtdOsIedMySmFGQrqO9NGS6YkKjAPuGOzrE0WUmbbub2WiDl4opA1UqOyqc/tgrtIELgiD7I/hVGqrMvwUtVXalkRSog1p6mRgvoLTQ45ar4zg29CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tcpbt+aQiKhq+zQKwVSCmfvpHoIj3JX3BLEft78FUo4=;
 b=nHAPKDwOI63fucW4MW50ZcAtXzbRB7oxjxzsQfKPnwEW8qdLVgTU/5/jUQBA9AErRxj7iAQuoXhAyhI/jOhAaR/gBUIjXNZYKj7xQ326+vdigI1boFx16S+bG1hxUgNrQowK9vvSRGGc5eogwwuVZK5meodhfe2mpeJP4nGRNeZ/4YBqVwSmVfLFjkU8i8oeja/Ji1lKuUEMRXDLA/BeQhRHo+Y242iqk22vsrO2ia315lzK5Ql5GSZNlOGu5IFxXEKe/i9bh2Y2cFU2WBOsLdDX/j13NuhPHx6gvB/XNUg7q3Jdth0nuEyCh0DJ+Xdr2Ny2aR7guhfU+CcrwYJ4QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by MW3PR11MB4763.namprd11.prod.outlook.com (2603:10b6:303:2c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 13:59:47 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 13:59:47 +0000
Date: Mon, 31 Aug 2026 09:59:42 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/hwmon: Increase timeout for mailbox power
 limits
Message-ID: <apWIzqpwcDeDxbwq@intel.com>
References: <20260729171546.3368457-1-karthik.poosa@intel.com>
 <20260729171546.3368457-3-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260729171546.3368457-3-karthik.poosa@intel.com>
X-ClientProxiedBy: BY3PR05CA0047.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::22) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|MW3PR11MB4763:EE_
X-MS-Office365-Filtering-Correlation-Id: f88d3b59-ba42-4ef6-8c3f-08df07681dab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|4143699003|10067099003|11063799006|18002099003|22082099003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info: nKfFOOpsvghi8mm2nWNxJGHoGypN+deLyFxe2Fca47wdYR1cGpG7MQdRYB56ZysYzohoC18koB6oJax2z862Ve2Cpc1Bi9HwAST7SvofgaGFksiS4dIvgxlEeIK3THHydA3wFqzhzqx4iU66kFM6PGzPHdPLwu1YwfUVtSUbdqpRwVHDUuZ7cJDgxXYH+53lcCxWe1GRutmsWo4Q6kuAPeThSS6afU0NknZQr8RMjtZAw7AIZxhBVjNtPs9XNuIRB/nFdZ5eyMuGnjfXgsEIfIldkV7QZ8JBil+U7SK9QWWrXN2n1EJCe3tYgij7vTfC1HSRIEgeNic5JRZOt8x4OPe7yBexNu4WEj3K1HcrqMEaC92rmsk+j7mxDkuODwxInyRccgI3D+S4M5KJi0Z2cuaajrrOJf7ttfluLmR/Fn/AU9v6WJe4jTCm3xNsjVRiyQIepnUhnlGkni12TdNx5Ybf29BngF4D/8pBSmnDY3KxyGd0wr6VdUB1Hu/5vu/qCU+vQQw2sU7N7XoNU9+yNeN6MCGrth9MPFyLRHWH9mZpUcy+cIMD2aTTI0kZYg+VINt+Bkae20CPJqWmwOe4onUcY6oASgiTthSswQKkJ7/Qk4iXMInxbICC1vmqMWWu5FDH4Is/DdYCL5qazSEIkBNRQAHioDk4Lo5am7kssaI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(4143699003)(10067099003)(11063799006)(18002099003)(22082099003)(3023799007)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?idDujgvH40dYniOcbJCQSo8vtJCXP1vFATwITylPAlCcRqFm1yx6ibDuRBnH?=
 =?us-ascii?Q?UhNML7oTHYBDwNon6adkgcLCUQkNiISjG/DsyT2kA995lOiQajP/MSEQpbjy?=
 =?us-ascii?Q?psMLIW0ZVoejpXs5prf7B2ItfVNE89CVMDIrdBFuzIs8oHYSV2oQA8YOxgHq?=
 =?us-ascii?Q?jAWHQp60nL5mH2pm8DM+1iDWerm8GL0fFELeMVfAVpZA5zrD74UqZXOEm4Ju?=
 =?us-ascii?Q?09HlrMU3Tw/Xaev84ZjWO4z7VWWEsqP3TxpbDx1PnuQSKzmg0z4XzxIqG3vF?=
 =?us-ascii?Q?S5/RtEe7EKzxHTO5HRBof3rNrOWGMQTGFHCD/gm3v6R14CqzKbxqdb1Rf8fS?=
 =?us-ascii?Q?ZoG5uz5NAMR40SxMw/ushUiozSTuehTbm7UIrZK7pfVdBWb4O/D+xSLF9160?=
 =?us-ascii?Q?IJ57Pp766sw8dSRaldkRdcgCsxzhiLvgXxt/32uH6B3U+NfPe4v2On7Rzwxe?=
 =?us-ascii?Q?n2O9qF2UZg+X0bNiBUSnvuRzwAWZ68iDYcg0YICTUVnsdwa3IwSgVH9dL9kx?=
 =?us-ascii?Q?Lj3tJ/+O8Ip8+qcqnAfDXazHbe9jMDF9g6TeriWU8RcmNTlfWsEQBlM8Kx/w?=
 =?us-ascii?Q?sHhsnIdAqiqtKEA19bYJ2Wb/ZvbGuYouQEDuOQTX5tQDZc8va1Yqsbgu6FkU?=
 =?us-ascii?Q?Js22ExR5JVmJw2ioHwCtsadk3nkIwu2Kn4aGsMo8PO4wVrITNSJNsjLWI48o?=
 =?us-ascii?Q?nL3XcKd/GRCXpWfjMToonNGVdR2o5xHuZU8VPd0BRhHJ2WCRyYUR4gLrIwDO?=
 =?us-ascii?Q?1loAjIZeQxr3GERlOuGMtlRx7t5hGULpI0GU6wADgi8pw9AJ3DrWiFCNIaFU?=
 =?us-ascii?Q?yoQVcru8+gGWHDphHzcOSVle2s5895fNlBuYARhMrCjFzP34rcm/uEecw0dF?=
 =?us-ascii?Q?r6P3yNvTta3x63QGZChcvOZbBc2YjKbYyS2tgjpukGRCo6ckwx9N7v7XrtC/?=
 =?us-ascii?Q?fp5w0RR60ZTpmJHA36AqX/7hz9c7dTAM517WEZ/+jFAIAtb4DZUvzlnt509g?=
 =?us-ascii?Q?K8OBL9zmQ+BNH1oaviDU+Adl0yMinHB2zIUiYmh0W8K3NKRnSpTjNVfL71U6?=
 =?us-ascii?Q?IAQIuv3D2EZHvSX/lm4lxJ5FMgnqdAoqlXw7+UvaQ1KdWrh+VsizWB8XhCdL?=
 =?us-ascii?Q?kexHrjzM6Q9d0HDiNkQqUrrHLgdCkpyCRyVDZz3Lj8VS3IO63Ff6gD8siUoP?=
 =?us-ascii?Q?brA4GME0xHsQvKGr9fdhgGTJpckiT97Wta0apyFg/Tk9lfn/3cOfF6/4rltT?=
 =?us-ascii?Q?olUflnZXF/dZQsXUDzl9dBn+/RpVv+fc6bsASOm3BY669Zzcrt8Sg7O3d0Y6?=
 =?us-ascii?Q?MaAXrqOQhSVVfL30mAbLZmzlkErOzwydGbgyVN72Q3X1jlHVeOFbha3E21Wr?=
 =?us-ascii?Q?k2YQX6+uz5vlgcydvdtrX8UC7uVK20hAXE1LQfcpoqvkOcJiTx0wKtgCIFab?=
 =?us-ascii?Q?YpOeBUtrMeA+2g9OPID8LVpxOsJCzuZ72Eufz8uJORL0qK2apCGZKDT+WcP/?=
 =?us-ascii?Q?NkLsvBingDX7WSUk+ZrNPzryNPOCYYQZx5UDUrIYDBNKkVs8qzE8a0a56VjI?=
 =?us-ascii?Q?cSnPPUwBQzsx0rgidfv16FejfLNaXrKc9D2EP16q26fZWXqMLDvosJwUXBtR?=
 =?us-ascii?Q?smuBy+xYaKp8nbucIXp7zbNXufgFqb9HYm5PncrregYIVJpzELipjVAVs3Ru?=
 =?us-ascii?Q?4KMFdUzkRaIOC5PKs6OOqpVxWwzx35whKCNpk5/WnF5+cdPBNKin/sEVX5DH?=
 =?us-ascii?Q?hEq/+nkZqw=3D=3D?=
X-Exchange-RoutingPolicyChecked: wD/vuPcBcxMQrXpRY8HO1mZgpPX5dZOOQfvrne9g0KBA+s00G1E/cxLKWsLXftutV0/tqUSdQ39kN6S5/RDjmQvMfDzXjPS5VLObv7+qY4Wj1mjIYSnCN1mqH3mmfeFJAMwWyF7YG6bqB8SrLpSH1OUXY6YkNA5V4dWqrEH+UatswVD+J7D+N3a+btQWvD1dQyNk5yWi+S6Yt+gxGMAKbyXCuZLjM6EHxcMKiNcePQpQKyIvm0sbhaJtYULG9wj69fyFhL6PWg1aFhFKTEqblmePfUzaUWIg/Hg+T3qh+PM2ToCG25+lffFcXKjgFqt0KDbbuozEPNO0IiF+z8ZiwQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: f88d3b59-ba42-4ef6-8c3f-08df07681dab
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 13:59:46.8112 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UDOZVPmfuw1qQ8oj47r2p9ZMuw8j/PrQ8ZYqF3I0a8Mc+usKz3/+L2R5ooupu/qimyAQxzuH1NTX7tUtJ7FqfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4763
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

On Wed, Jul 29, 2026 at 10:45:46PM +0530, Karthik Poosa wrote:
> Mailbox power limit operations can occasionally take longer than the
> current 1 ms timeout, causing sporadic failures.
> Increase the timeout to 10 ms and rename PL_WRITE_MBX_TIMEOUT_MS to
> PL_MBX_TIMEOUT_MS to better reflect its usage.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hwmon.c | 28 +++++++++++++++-------------
>  1 file changed, 15 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index de3f2aeffc3f..459ad953dfc8 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -102,9 +102,9 @@ enum sensor_attr_power {
>  #define PWR_ATTR_TO_STR(attr)	(((attr) == hwmon_power_max) ? "PL1" : "PL2")
>  
>  /*
> - * Timeout for power limit write mailbox command.
> + * Timeout for power limit mailbox commands.

while at it, please remove this useless comments all over.
I know it pre-dates AI, but it looks like AI code, commenting the obvious,
which is already clear in the define name...

>   */
> -#define PL_WRITE_MBX_TIMEOUT_MS	(1)
> +#define PL_MBX_TIMEOUT_MS	(10)
>  
>  /* Index of memory controller in READ_THERMAL_DATA output */
>  #define TEMP_INDEX_MCTRL	2
> @@ -199,11 +199,12 @@ static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 att
>  	u32 val0 = 0, val1 = 0;
>  	int ret = 0;
>  
> -	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
> -						  (channel == CHANNEL_CARD) ?
> -						  READ_PSYSGPU_POWER_LIMIT :
> -						  READ_PACKAGE_POWER_LIMIT,
> -						  prepare_power_limit_param2(hwmon)), &val0, &val1);
> +	ret = xe_pcode_read_timeout(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
> +							  (channel == CHANNEL_CARD) ?
> +							  READ_PSYSGPU_POWER_LIMIT :
> +							  READ_PACKAGE_POWER_LIMIT,
> +							  prepare_power_limit_param2(hwmon)),
> +							  &val0, &val1, PL_MBX_TIMEOUT_MS);
>  
>  	if (ret) {
>  		drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
> @@ -232,11 +233,12 @@ static int xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon *hwmon, u32 attr
>  	u32 val0 = 0, val1 = 0;
>  	int ret = 0;
>  
> -	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
> -						  (channel == CHANNEL_CARD) ?
> -						  READ_PSYSGPU_POWER_LIMIT :
> -						  READ_PACKAGE_POWER_LIMIT,
> -						  prepare_power_limit_param2(hwmon)), &val0, &val1);
> +	ret = xe_pcode_read_timeout(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
> +							  (channel == CHANNEL_CARD) ?
> +							  READ_PSYSGPU_POWER_LIMIT :
> +							  READ_PACKAGE_POWER_LIMIT,
> +							  prepare_power_limit_param2(hwmon)),
> +							  &val0, &val1, PL_MBX_TIMEOUT_MS);
>  	if (ret)
>  		drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
>  			channel, val0, val1, ret);
> @@ -252,7 +254,7 @@ static int xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon *hwmon, u32 attr
>  							     (channel == CHANNEL_CARD) ?
>  							     WRITE_PSYSGPU_POWER_LIMIT :
>  							     WRITE_PACKAGE_POWER_LIMIT, 0),
> -							     val0, val1, PL_WRITE_MBX_TIMEOUT_MS);
> +							     val0, val1, PL_MBX_TIMEOUT_MS);
>  	if (ret)
>  		drm_dbg(&hwmon->xe->drm, "write failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
>  			channel, val0, val1, ret);
> -- 
> 2.25.1
> 
