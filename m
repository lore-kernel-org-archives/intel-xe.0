Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E2E7CA5FA1
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 16:08:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A46B10E134;
	Mon, 28 Sep 2026 16:08:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VcIlDwmw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94CFB10E134
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 16:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790611725; x=1822147725;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qiu39ARDZI+BovFjj5n1SIGiM/TMthajD5xqBvapTgY=;
 b=VcIlDwmwECtpsWAtqSq5Q1S6bxDvvNySNgIh7OiLjFOBXhFI4P3l+jqy
 rMCusEEYscYxkBc4917+Ux6A5eqnA4uKdF3gapfRVqqJ9kwGwDN06dSSB
 zDa+StJR9cv6BNLbgDPm7YneHI4EQQUTCITDY5728SUl77yN9KyVlWKCl
 s9g9T2Fnafo20SLGysy6DppCOw/8Whb7N4yhxPckt4xzhuCTrBcVBGdF6
 ut4G+NTfpNMcLwSwGifVeLP9ZzQ4P1b8s+jx9BbW1yhENjr71VyLZTz1n
 8YlTkTG3daJCY+3nHwiNPUllD93ENzrcQ+fbCVLfTfwgS/z6aL04sHAsk w==;
X-CSE-ConnectionGUID: nQgWWtY+QRWMHVqkB2asOg==
X-CSE-MsgGUID: gPe8u5/TR9m/jm6802YlzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="101885155"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="101885155"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 09:08:44 -0700
X-CSE-ConnectionGUID: 2NDIEVygRQiPeN8kGZMXYw==
X-CSE-MsgGUID: K5fAMiW5Ts+Eykx/0ikZUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="283181581"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 09:08:44 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 09:08:43 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 09:08:43 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.23) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 09:08:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rb0/UpDHlELNg9yQKDQ5/WDqzcERwO68zBI1S04OvPl5sLr3vIbSDbt0RbGy7w/gItV2GuDcvKE0oAWckPixDNUeFdnhXeXUvPpD9SVetZXFKvwwTlFsppm15/ynfIH1ZAoxFUV/rbIScSVMbwDddCvw/5DOY820T+r5CJS0ymCxyYiSTkK4qvRdZ60oni71bWQqX+CLxtry1IkiJ3LdmBBqP1J+OZ7VNytH1dE/WgCpwbZy8VspxV6aoHsu+YO9FmOBkjzFTT3DGZuk4tEXlp3XnPfLsPjktTsLOX/ZTKcit8VI2ahtkS7IDq5nJbFH3x2y2mkI1Q3N3lDS8LAEfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bc7iqZyjhKSVvwqFCxuJHFkmYXl8m8lVodNXukoE0NI=;
 b=sxjKNGCPTU7dI3xuhZkZ9rZOTzRttEyAHzZfPwidsvgck9PufGyVcIURcTecyUfMH0KBeMxfqYeRD+llc1Ta9mF+fB4eLrpS33Z/oAhk/FMv9RKrWWY2GtfNPDfTpKhVnW2U6zsnZ1xcBFDn3ZtIlTKLqI6BVvpOVuAat2iQS7nFELJp3jErGUuac4wzA0fL25BefQmcFpa+2fGFA+2uP6r9VNv/78ArZUr40EBqJa23/9Jr5s+GpwzYPtgSzbchGYLy3ByYfZ6IeM7pRAPWpGGMF64xjRM6sLCoI7sSDKXm83c6kHTraHCrsvTTVhXcv83gsh5P9IT4CdC+XbTfEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by PH7PR11MB8456.namprd11.prod.outlook.com (2603:10b6:510:2fe::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 16:08:40 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 16:08:40 +0000
Date: Mon, 28 Sep 2026 12:08:21 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH v6 05/13] drm/xe/hwmon: Handle unavailable memory
 controller sensors
Message-ID: <arqQ9c2CWouiOFIR@intel.com>
References: <20260924205429.2846256-1-karthik.poosa@intel.com>
 <20260924205429.2846256-6-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260924205429.2846256-6-karthik.poosa@intel.com>
X-ClientProxiedBy: SG2PR04CA0199.apcprd04.prod.outlook.com
 (2603:1096:4:187::13) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|PH7PR11MB8456:EE_
X-MS-Office365-Filtering-Correlation-Id: 96bcc081-91fd-4566-b68d-08df1d7ac268
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|56012099006|3023799007|6133799003|10067099003|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: GLHpiNKU0Efm8DAmGrubITrSN7CLhaHAukV3k3CYjGd78xvTJHmxv0nhRaQqHOi0yZSqRJwIT7ZOWpOFYcWqnCqr1AA7qFyapE/xqPmR03ffT0mQx8AEwyooZAN4CTK3/RZhMjqJRrtt170caBr/B8kMR7ocbR+3sKCJpKetDwKxWaH2WZVTZRwOs6/n2gAZEpeytGUPhHyokanQ/s9CDhmlms6t5qdPjmgVOnQHuSdNSowHIQ52vJDnuBYTeehMs67xg2QlEWpcKWUHpADdwntDmn15AK/tkqBiJ9IOOf4s4DQRc4IVC+5c9iyK2G4801Z5z1boOnUWaQ7+XABW9GJShR3f97sEX0QHI96AQAlZjEbv8HQ+xVZOSwVk9Q1iHMNdYUWTzNnISE/CGQqyEgjdqrBAGa8sK9Yj4w+2Z49sVAMuM7JOnYzsgNMtOD6kFwRh1eIui6RghNKCIun2k0CNPA63quhPmXJLqzSsoJvpKa5ULk3uKXsEevk6yNq/Zwj7C8RTFgRCXwwW2QI/A3sQHysbUeawDtU8y9Jf2cVjg385zMFCRj6GC5IKGUVNEjSZmqUXB4TuQx+J/RFmy0yuB0SfL27uZ7X1z7nxhnMTVR10/DUG7oJT+BSmbrj7uFT3WfRV6LjGkT6b49iqRImK9y/JbTu2HYaX0Xbl/Cc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(3023799007)(6133799003)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jUihJBdJHBBlII71fGAJPGTzKMb0S6IpckIGprGXT4f/OAz2TKvpuJhtGloF?=
 =?us-ascii?Q?ML4Nyr97QXdBdr6LkkLSPNxwMDuxI/yNNcjchBJU67JeNA2yV1zfP6w8j1YE?=
 =?us-ascii?Q?/32il6lzLTrfeo7jZOhw4RJ/lKDZVUzITJovqQXJ/BEoRucUrcTmceD604G+?=
 =?us-ascii?Q?6p/ASw3Xs/bIdeZdkwC7MbU2KNGH5iUR8IgQLufOoB2AM+/Th2yh/1/+d/YD?=
 =?us-ascii?Q?vC/wR48L58lYV1FyKFJO5KWwnw/WkXGoqMulfUKakUgkYGXT2h72RCF2dsX3?=
 =?us-ascii?Q?gDv1NVArNyZN8vfcexQio9u+pFVoCc99Afa3xRQTY75ooMd3mHW+OidoVAuF?=
 =?us-ascii?Q?fJtKsviojUzULqG1ihteiXP9hpUj553krv83OC2yV0zh50JYXFQrMBekznps?=
 =?us-ascii?Q?4GgbQPuOtXxEac3/stbYLmT2gIRzn0z52gVL0eaNYAKlWndBQ7lkgee4O8Qi?=
 =?us-ascii?Q?2cWUFY3pRNMpBYRM8BRqnn2gc2lo+Ce+svvXGrdKKV1Na3oYKGN+xm3h6uFK?=
 =?us-ascii?Q?O/dKn4PCw7lyNWyV/cprv0aUdyklK0TYQ7wQGfXT947Gp+0XMwOcvZEOjn6x?=
 =?us-ascii?Q?DC9hQCWA6b43pmCLPtqZcVVZHmW2IUUjE5Dr4E6/VhLMCxdnJRiEudeuJWRj?=
 =?us-ascii?Q?wiWqEV0MQ8O8evLyu5dXXHkqM9OArgbIE7djSjXtF8E9tXrzjmEG6jIgDye9?=
 =?us-ascii?Q?VK2KSTOUNiKGVN4pw20cBOGAJfa8rfzyvfCushES9AHqqJFfcQFDsIEfQ4Yq?=
 =?us-ascii?Q?oDNvUiW0TtkdYLkEJalLOQ62WalShjVuY9RdEQQrnayVsN1ZO7f9tBM+GOVB?=
 =?us-ascii?Q?3oaiyc68N9QRNp1Fm3WhSCwHNxxXTFb5MzPsVnAb7aMQQs3JCzUQWcE77sCM?=
 =?us-ascii?Q?65D0G84T4W9A9vnvpP3nU1gL0INEab+kXOSTqHg3n+RveyQx/L23uUcp5nmy?=
 =?us-ascii?Q?8JYL+KfK00QWtB7r5207PfHt79Yx9YbRsHXB+00rTZsC0Np2jWuZ2HvIPiFM?=
 =?us-ascii?Q?2lBJYGlX7lNQMagutcCAi0KWWtPl99AOgSn/4sHMqPC7Ei2wwN+bqJXAo98O?=
 =?us-ascii?Q?zZSD9tcRjBneiRQQCa777rboTrwkp9BJ+GUSvCQSw/BkNXU78OH0xIvM3LxM?=
 =?us-ascii?Q?KytCrE+G4KwNsiCmqSQmyujm3fs7lSGX58PHDLeX9MXJ8ugJ8HpxTkRF7vwy?=
 =?us-ascii?Q?9s75/OP9DQ73b11DbsrdJKxeIlidS/4oIG6ACVGQImE/gC0A4P7zqrXKvobK?=
 =?us-ascii?Q?g4iSTiAp+foOr6A+2coVxwxGHo5lrqHEqUrCxM3rE8gL/+MQXeQf4Cl+GKYj?=
 =?us-ascii?Q?x/94+vOVj2QJET1W9dKS1yFN6aqmgXx0L1t4YhWkQHHcaMnOCdrXbxDgV2Vz?=
 =?us-ascii?Q?gUM+MVBIu1uPTv/EMK5aMWbCIpNYz+RCUjzQoXcWR2Xkr9RU8ivdkrS1SHii?=
 =?us-ascii?Q?oeCUsXDts+GbxhLgv63O+P2T2JEfj8XaG4H9pGn8e+7oW9Vrb4TkBwmngMAE?=
 =?us-ascii?Q?VAzxpTRWYtml/e053Itmjp8839NRdbVEwGcCEsJZiS75sgpATHs1hK70Qp4R?=
 =?us-ascii?Q?1vPNeUbz4N+tDUgEumFYsCRZ4zCLUdG+ttuf8e8VsdTs09Nlfa1Ff4Z3UPtS?=
 =?us-ascii?Q?UNh4Lqs3t3hVVP5w15HS85mUb4Gb1jCM3pSx30lM8o2lZ2If3In83qCvMx4K?=
 =?us-ascii?Q?vdIizvqvcdkIpmZXVES9rNx8/lDSeqCMFSv9zG/vlLwx8h1LC1ZIokQcrRND?=
 =?us-ascii?Q?0lyrJPPdUCygXxXUskse+tIqQV8fJWQ=3D?=
X-Exchange-RoutingPolicyChecked: ETthiNfXDSzwpblKTtWaHVdlBvNVPXe8sZVJ4zGWvmCxWgvwp5XtDApd5daUxRRYhWz3wwvYaz2xuJVxN148WX57cEzq8J3UgiXy5hswosf3ehTKM3wD1+KipG2Lz88Ri5qOUt1WdVm6N/meN5E+eE/CBuwl20KMuha6Q0P3nOeDhnqxgoHWoE4dgAH3Mr8G9ynlBkxhSimxBd6SHK1PbtyatDHEqpE46XYhWbYtz/wHtDlsUr60H0qqA61+8gett/J33Ann9ReJ1MKzbivn9IZxW35owIHqsC/CmzNIfPQOeZ7hnVbvsb35kHVyy8YV09f4H43c66cIPnHPjYtO6w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 96bcc081-91fd-4566-b68d-08df1d7ac268
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 16:08:40.1077 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0goBG/9T0ZDx7uiZwp+8xUEk/Gjgaw4bI269OZPXjOMN30ReFpRdVtraJqrm2iGVC3h3YliU/4ahh1h7cX6bIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8456
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

On Fri, Sep 25, 2026 at 02:24:21AM +0530, Karthik Poosa wrote:
> Skip memory controller sensors that report invalid readings when
> computing the average temperature in get_mc_temp(). Return -ENXIO when
> no valid sensor data is available, and allow the helper to be used as
> an availability probe by making the output parameter optional.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Fixes: 3a0cb885e111 ("drm/xe/hwmon: Expose memory controller temperature")

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_hwmon.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 8a1dbe708828..83466b8d8d27 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -849,8 +849,8 @@ static int mbx_temp_decode(u8 value)
>  static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
>  {
>  	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> +	int ret, i, count = 0;
>  	s32 average = 0;
> -	int ret, i;
>  
>  	for (i = 0; i < DIV_ROUND_UP(hwmon->temp.count, sizeof(u32)); i++) {
>  		ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA, i),
> @@ -861,11 +861,23 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
>  			hwmon->temp.dword[i]);
>  	}
>  
> -	for (i = TEMP_INDEX_MCTRL; i < hwmon->temp.count - 1; i++)
> +	for (i = TEMP_INDEX_MCTRL; i < hwmon->temp.count - 1; i++) {
> +		if (!mbx_temp_valid(hwmon, hwmon->temp.value[i]))
> +			continue;
>  		average += mbx_temp_decode(hwmon->temp.value[i]);
> +		count++;
> +	}
> +
> +	if (!count) {
> +		drm_dbg(&hwmon->xe->drm, "Memory controller temperature unavailable!\n");
> +		return -ENXIO;
> +	}
> +
> +	average /= count;
> +
> +	if (val)
> +		*val = average * MILLIDEGREE_PER_DEGREE;
>  
> -	average /= (hwmon->temp.count - TEMP_INDEX_MCTRL - 1);
> -	*val = average * MILLIDEGREE_PER_DEGREE;
>  	return 0;
>  }
>  
> -- 
> 2.25.1
> 
