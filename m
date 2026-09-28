Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A2DC9832F
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 00:12:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C8E10E4C5;
	Mon, 28 Sep 2026 00:12:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EuHDwb7E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15BD510E4C5
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 00:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790554341; x=1822090341;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LErkZ8pGxwZ2NJCgI6GfqHubx8gNhXRciJXs1+gx6/Y=;
 b=EuHDwb7Emft2p5WS2zZ6DL/kO2Q4N0uqQfaPt/48uhl/TfhsKCRlSdVD
 S27RxuGdW83xf8pO1BBxYbtwe+wuTN04tFCHZZYmLfB2aw41vKWEJqDJu
 qinzTW+hZAoVAbZw3aJxCk8sCsVuqm27my37NZeQSlsaGch/gqGAE6RN2
 r70UqFMkxiHDIuvIOB37nNs7VGkXGVDbwGOy5xQuimpTf7nQMMNcXugy9
 sXPvsKY2JNVXiLdRBA5rbNag7cYb240wZur73cWbKAc8lnI2wPGl2J/hH
 ZMJ3i/+gRfuViokIb4Ggu9o5FJCvrqlKd/39JwVuiyyRhqN9RsvpvZpkk Q==;
X-CSE-ConnectionGUID: S0KVXCnxQqKsslOpJovmrg==
X-CSE-MsgGUID: FCBXsrJ7QfGjxI2ObIY+LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="102620930"
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; d="scan'208";a="102620930"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2026 17:12:20 -0700
X-CSE-ConnectionGUID: YIW2POyBSJisp4ZulrwFBQ==
X-CSE-MsgGUID: c56tglJRTh+ZFprjM+PPjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; d="scan'208";a="274124529"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2026 17:12:21 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 27 Sep 2026 17:12:20 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 27 Sep 2026 17:12:20 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.42) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 27 Sep 2026 17:12:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y+IaHbR0zMdz35T8LI7ezbtyGjiPZCZsn0FvvdEsAU3KIrP6XopkZmPyhZuPi7GsdAY48ewyjBsc1d7p/pElOxpL+Bpf2MTxJaKqEazLBrVNKeCB3eabwiC+l3tAC08wPo1t3ky6aDmuuPtgfJyEofcNOHwYnM5PdiZhvrIlnLexj54KXzva+Tmp+P0kIK/y/NOsTszdzbnw1hRzZy4zdotVaJl6CLbJ1nz0IDfo1XXXNn4d2UWS49BOBFUP7F/Ane4ofwMNX6P+TSWCdn4PPIpMBGe/OlFoZQHpnqscSiabXyZLdbU0/aUy7Zt0uE4Ie58LWftIeQ6pzE8J67c1Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=odacdKiS1+kSaUzCVCspGMc9Jk6s+9KziZl8i468qHI=;
 b=o4Jaj6On/7Djn9dokxyQ04MaNv8L1KXzVwri9uy23vEDMiyhxrLbiccM1QFoHunBCSrTzKOy6hfVzSrIlylMCuonft3yBQ8S2KxZh0uPS0WifXL2pmuWcxaUuE10SXhT2sa/mVL3enu+YvTy9U0+f8P+ZW3yh6SJD2mzT7JdD2naAU/RrJ5+uI1BEDpG37t2vyvEUXEiRrjxv0jGdij2k6OPc5xuISCZ7lvVgSoz7yhYD47jplUGgiZPWkfhQvcGyT0qMPzf/bAiR3cURAEm2flFSz+TsWPwwL+9h2Gs/I8t6gu0/P5Turv98PMu8kgBZCu+cBkKX414Xr4P2GioFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by LV2PR11MB096109.namprd11.prod.outlook.com (2603:10b6:408:422::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 00:12:16 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 00:12:16 +0000
Date: Sun, 27 Sep 2026 20:11:59 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH v6 01/13] drm/xe/hwmon: Handle pcode read failures of
 xe_hwmon_pcode_rmw_power_limit
Message-ID: <armwz_oryVE0CNa-@intel.com>
References: <20260924205429.2846256-1-karthik.poosa@intel.com>
 <20260924205429.2846256-2-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260924205429.2846256-2-karthik.poosa@intel.com>
X-ClientProxiedBy: SI2PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:4:194::10) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|LV2PR11MB096109:EE_
X-MS-Office365-Filtering-Correlation-Id: 08b3c099-4abc-4d14-f758-08df1cf526cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: TQEIGDOXb0tw2UB8CHjNBIQkWf8dA34MFLac2wUoH/in7F2eFiPVEtMV3dDj9LmNAyg7/lpJeg9FWccayeaMWaIxfGCJLwPgdE9I1AgckZYy0mk+SKvtb1NKsyL/zuQ2/qBhd5CCty6PgBKrv2cE3AWSudobKm7msJOKrODjN7/TV9I+eSjgpA4T4RsdjR2yDj+fuO5tPo8zKgfno773JA6PDS1QtLfJkLmLL9bzZbCBg387AvTkuV+4p2XYmG/a49e7HI1eM1kyPTSOiW7vlKB2b6n/UO2R+JifAdgtyzI0fN+PfAOUrsfXiHkmmBjNkFGquY+iSlLLoRYQx6iCg8wY0I1+KNwAGKW+MYtxE0KEcpdor1FrL+RmR2sTkDytHSCWKeVbDRfSvyZA0ldJR+e3+w3hZa9VIcg5EZuAcjt4Vann0LKiC6eIuCrLywdDyZDRPmGLG5HF0nQJhghXOgNgy0LTehUOU9wE910q5OWuOryeZGXwfiXHll0FVQJ6OSnBNGlt9T4nzM2/S1A27sTli4YtElgzOoNH/mou30RXL/JCYHFETqHewGbcJTIVoi+PnphfhChctt0Q2OYErKhyTI1qHIuo5bZohoniqt/ZXQ6gvfg8qTAacmTRcjIPv8sCiRz1NgG14o+8d0ZPZCc8DcTDRT2mY6miRkTpXcM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NdnYtU6XfXUGPh7831HT/H+DYEVsStuYVKvbkpE2mZx04HjimbpUZPCdEB1H?=
 =?us-ascii?Q?wITM/zjssn/vLN0B596iqG3+nNXmXnV0Y+DRSxcIGX1VEdxFRVlvwfYwnVU3?=
 =?us-ascii?Q?FJzUt90gK4yU2E2tpB8alk2sGEZneBClMEyigdwqXMIExf55rRymuz6MfUtI?=
 =?us-ascii?Q?LLpdA4ULFnzIp/tO9q2K30WiHzyyA5+Z27HcwWnHwQ6ETvXhxWipUiFfI+0G?=
 =?us-ascii?Q?flOE3+zGyzJhxeiXLp75GNt9ZzHfOuQhfgdDwQC35HqjsibbFIDC/zIWZVpE?=
 =?us-ascii?Q?CCeoW6ca2ZW4kFrbw3OHSjrrJFSKpB127GbTJ4xBgNKgjjUVBsBanl1Oh/EH?=
 =?us-ascii?Q?zvWKm5cIj1BwgCDpVzEDU3QmeHUw7v79DFr1hOmpwRaBXf2MilxOYk6zPXHF?=
 =?us-ascii?Q?U4F1Vwu7glOTePE6u7wVC6nIaxi3LAFQfJT8pLjXWmAYXm+jj/IqtBug3lpz?=
 =?us-ascii?Q?XRfiRQw3/5qIcKvpPsBaS2xdQtX0OREWA1hw7Id38pUIP4WvBHZ8BP3wFms7?=
 =?us-ascii?Q?W8NP+1FpLYdMSHHDTedjElRwGOIT7k4ebP+BbNfTbkciaWPvtr3blaWrFEl5?=
 =?us-ascii?Q?5GlSwys2POLsz02trYRBTNyGbPsR1wiKzISyxIrO/tNXkAk5TTZHyztdLnUe?=
 =?us-ascii?Q?zhCQD0nnz+bBm94zaEMFgRs5blHFzNDpckz8ofOTKUP1FJt5ddrdjQcsTtSB?=
 =?us-ascii?Q?t8gm8yp1J8z5nZJ0k/fkFmpyLoqWynvAugx6G8V+sxshPcO0D7SptveUYJ1o?=
 =?us-ascii?Q?OUoBbjPvETFE/xpGoxeomZpI9LMGhSM3HsYNTqPowMcCWLQwh/JmEWfU3Ov8?=
 =?us-ascii?Q?l98IPnUpsrOkuRiug/FxNUY7qq58l+Ign0Mvp4nW1ZWyUPI+c3yi3JMMTZ55?=
 =?us-ascii?Q?NSkbt9B4SbSjr/w/nUuCDVivk0OcILmaTHZlKF4hlHY0UjurbR5ExGVnd+hX?=
 =?us-ascii?Q?oksF6e0t7LrhkAR454M9Nqrtrq8sbw9/OHwK/yZlA4jP/P5kS4I+h4FJcL49?=
 =?us-ascii?Q?wEf7DqMHi7NAbF6NlaN3a0WwNBYRkHj9U9W0BRFO3KkybNCICIL7Kptw8jPY?=
 =?us-ascii?Q?S5OYV4sINtr+PamwrhiImazqGJqcrGKARB9fgmJ5mu59SJW1ngjd6kqkISbH?=
 =?us-ascii?Q?puGf11MseyQwdiCEyiaRIIjjQNy1wFke9Rl+Wq8k1d2qYNmcpeT8a09zc7CA?=
 =?us-ascii?Q?ibEOuYH+Xk2/0fjAeQHkhHa5Pa6XqG4+YcARJvKEnZb1/E57waXFIKZJFZMd?=
 =?us-ascii?Q?iKBzhGdYtmRVySYtCIaNokL/GmnOIB65FUodNmpZlWzL9ZOXIS8HQmsuXcw8?=
 =?us-ascii?Q?9CR60Ly5ch/lE52RNms9G8HRm+xotC3udDj3OtzyWdtpfkLsUXaFy6pzQTVw?=
 =?us-ascii?Q?lGJ5JGF9bwku/+SNhTaw/bVR6RHBwuhTZdiCaiR5mIlhxO1M3Mg8XhBhsonI?=
 =?us-ascii?Q?bSNWNCQtzuEOyJwISdUpEa1vfir02aaSiMzW3Htnoidb+Bfg17Hqvx5OJsnP?=
 =?us-ascii?Q?YNof0WMwMVppFfoj/lxxoSKY1r+3di/8XyU09IBZ0aPHpxi/9FPcwMCC58Vb?=
 =?us-ascii?Q?q48rXHXF4xKBOYiSWI1rELBgwJZEvm2XUJn8133RCB3/+IpVQnPJBY8GDyVj?=
 =?us-ascii?Q?oMPEoA6ZcZIJsC5rHJ2Itjm9XE+azSvclsMAaOo3ZEkm3bJBqNzrGYrz2YeT?=
 =?us-ascii?Q?uOCrsuI3ghEXS4wbicZUZ2wRYl3csrXomlaelVidYoFDNP2mVWd/NANg2WFE?=
 =?us-ascii?Q?MdaEea9WA9+bC42pQ9GIqxhxyx9JQfE=3D?=
X-Exchange-RoutingPolicyChecked: QlikdwVolTlUO3UMEXUCyzl/UemRiukH6KOBhXhFPgHzrXUA3JA969XCY6P3Ig1i8LTBxTfUb8yVVvd8yzEW+kzF+s3f6lDBb5R12ufU4XxeUeAfsmcrymvZ1uxpBa+ljDv8IKSBqw5MjMUPENi2LQ6O/LgQLzehG0vgfXh6XtDe9IzLimatLVnoD1/RDia/wOFzkWQEGxfrIAOUs/sd1b1yb//mY2f7GvHwXk73nWg7MOOyfVMstIzdSVUA03xjo6gKdW6QGbuYLqzZqk8FdD4tWXip04LwXMrMXB/3+BI2CGq41My32Otm5n2BfYkbmXkX0++uPYw2YvWAenOg0g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 08b3c099-4abc-4d14-f758-08df1cf526cd
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 00:12:16.0268 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ff39OXg/EIJsIWL+iS8HoFVJGuJdLL5G15p+ciDEr4WMdfQ8/l/bqeWoDTQ64yhl5JPatciwPT8rP/Q5zW2nLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB096109
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

On Fri, Sep 25, 2026 at 02:24:17AM +0530, Karthik Poosa wrote:
> Return early when the pcode read operation fails in
> xe_hwmon_pcode_rmw_power_limit() and check the returned error in
> callers to avoid updating power limit settings with invalid data.
> 
> Fixes: 8aa7306631f0 ("drm/xe/hwmon: Fix xe_hwmon_power_max_write")
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
> v2: Address sashiko-bot@kernel.org review comments. Return -EIO instead of
>     0 on errors in the sysfs store callback to prevent potential userspace
>     infinite loops.
> 
>  drivers/gpu/drm/xe/xe_hwmon.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 5edeac961ec3..be3fb6733b6f 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -232,9 +232,11 @@ static int xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon *hwmon, u32 attr
>  						  READ_PSYSGPU_POWER_LIMIT :
>  						  READ_PACKAGE_POWER_LIMIT,
>  						  prepare_power_limit_param2(hwmon)), &val0, &val1);
> -	if (ret)
> -		drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
> +	if (ret) {
> +		drm_err(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
>  			channel, val0, val1, ret);
> +		return ret;
> +	}
>  
>  	if (attr == PL1_HWMON_ATTR)
>  		val0 = (val0 & ~clr) | set;
> @@ -394,7 +396,9 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channe
>  		if (hwmon->xe->info.has_mbx_power_limits) {
>  			drm_dbg(&hwmon->xe->drm, "disabling %s on channel %d\n",
>  				PWR_ATTR_TO_STR(attr), channel);
> -			xe_hwmon_pcode_rmw_power_limit(hwmon, attr, channel, PWR_LIM_EN, 0);
> +			ret = xe_hwmon_pcode_rmw_power_limit(hwmon, attr, channel, PWR_LIM_EN, 0);
> +			if (ret)
> +				goto unlock;
>  			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &reg_val);
>  		} else {
>  			reg_val = xe_mmio_rmw32(mmio, rapl_limit, PWR_LIM_EN, 0);
> @@ -679,11 +683,13 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
>  
>  	mutex_lock(&hwmon->hwmon_lock);
>  
> -	if (hwmon->xe->info.has_mbx_power_limits)
> -		xe_hwmon_pcode_rmw_power_limit(hwmon, power_attr, channel, PWR_LIM_TIME, rxy);
> -	else
> +	if (hwmon->xe->info.has_mbx_power_limits) {
> +		if (xe_hwmon_pcode_rmw_power_limit(hwmon, power_attr, channel, PWR_LIM_TIME, rxy))
> +			count = -EIO;

please use ret for this, not changing count...
and you may set ret = count earlier, or something like that...

> +	} else {
>  		r = xe_mmio_rmw32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel),
>  				  PWR_LIM_TIME, rxy);
> +	}
>  
>  	mutex_unlock(&hwmon->hwmon_lock);
>  
> -- 
> 2.25.1
> 
