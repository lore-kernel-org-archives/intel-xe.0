Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E73C5DF8C
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 20:42:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9378410E327;
	Fri, 21 Aug 2026 20:42:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TMyIBy7R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD4DF10E327
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 20:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787344959; x=1818880959;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YQ/SeLtsHKy29xsflB8sDuSPLYWdcf3e6MDSr5hsYss=;
 b=TMyIBy7RtX4IFOaM8WtZ+8F1clP1D+jS8LPaD2RQUnVtkCtmJZDafvCo
 kknHZ5OKLfkPnabK910WaMlS+xEn6AX30tV+VDrvRWNfTg9tjiJyh9naj
 yxx78RyCIk85M+dxYhP/kUhHfaMXYanDDo0o0H5ycfqu7+EGVReyp72zk
 epUIOEaHhYzEVY5ZHS1idQFG6kJPA3xGDKdtgBdeE9P5pYE9EJeRwuyN+
 YEzXo9fBTErPJviQil/QrXZkVFduy7BDFCrJtISZOeEofCVx5SGTswTWF
 uxDyzrUv1RWM/mLBQrPFHnwyPPXNNqUszrlwDIbajxmZfzeaCLMAlsKTd g==;
X-CSE-ConnectionGUID: dXCMWqBxSIS/znG3YTN9ag==
X-CSE-MsgGUID: G+FQpFPpT3GnCtF9fOmIcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="87757669"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="87757669"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 13:42:38 -0700
X-CSE-ConnectionGUID: Z4BSW0z9SpWcjviQCoJRog==
X-CSE-MsgGUID: om6bgcrFQgeKYka2j7ZsXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="304645639"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 13:42:36 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 13:42:37 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 21 Aug 2026 13:42:37 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.51)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 13:42:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xBh+3m5V8cAr83Zlk3rKm+A5o62LpQVQvybNgPhw+Z06n/DItjXmHqN2+BoNrH6dnnN1h/ZkfV6lX447O9r11hb4grVzutwYxI2XcvT7ccR14yIYhKQtFW52/UA1XeUkxKxSxOQkOeVJVxO9Bn/ENolbXxEpXVQ3gdEleAUWh6QrCW+3z0Djxaqnz2Q1/5j2n1vISlU5rOFlygZz/Vuxd46X40OCLrFcPymomJwL2mOLsiJ+t6JQSZ4SRJyhJh8TgdFQ1kikUI79YR3hgoqXj+E7D2gFAXT/7BpGQbNJXCSYy1QH95hPzjHk9Vx5lnPwHRqqrrkzupkeagSSz0m4OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tiVhFg8io0edmMvUEkqHtK53y24fvrYJIxvyUsjcvwE=;
 b=FS8q6xr06NdoeCLRifY2gAM5mLi1bY/OnU225JEYRLb/eanEonRVI7lsKDbHRG4GV2pFAdbk0ml7sz/5zc0yX1t/Z7LN1A7JaRBdIhZ0DJs6qf+gD8aQ0Dp48MlFQlRP85JZ+wojkBzyjHhXx1myyWzOFVdOKad5BZWzehT1yyURaIN09zxPIt8Zka9dOOxI2+MybOypAVJmfKxNuxgnzyetpd23GjCeW/Q114dhmZn8WAQQog1YReP8aSwXcZ+iPeunivEWAQIcUidlwm+xvQHmSlgzN5+g8r7ZU8u5RPznaeP6ZiKrqoeaiBZ5v9unocsWPLpTksCY91EVpF1Q0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB5293.namprd11.prod.outlook.com (2603:10b6:5:390::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 20:42:35 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0339.010; Fri, 21 Aug 2026
 20:42:35 +0000
Date: Fri, 21 Aug 2026 13:42:16 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <Michal.Wajdeczko@intel.com>, <daniele.ceraolospurio@intel.com>,
 <shuicheng.lin@intel.com>
Subject: Re: [PATCH 01/10] drm/xe: Guard configfs attribute reads in getters
Message-ID: <20260821204216.GB422236@mdroper-desk1.amr.corp.intel.com>
References: <20260820210639.107524-12-stuart.summers@intel.com>
 <20260820210639.107524-13-stuart.summers@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260820210639.107524-13-stuart.summers@intel.com>
X-ClientProxiedBy: SJ0PR03CA0166.namprd03.prod.outlook.com
 (2603:10b6:a03:338::21) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB5293:EE_
X-MS-Office365-Filtering-Correlation-Id: c12516f4-4121-4df3-a4eb-08deffc4bafc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: wfwUxYP4L5nz6aqJFpNcYkRNL/VXdq8AGyuPx92r6+anlKBOLGKT8kqzTR2W2qaoaoKnt1Imcng1AfVba8Wx+MPC+j6mLqORVAJwAQqroWmcExISV1/2N71MofM/ykCNVe8eO74ibYn8/nBv20XGHQars0zWBapI+bSUhpiJugW1Kqm0vSxOz7sktq4X1TE4y3ascgG1G+WUC0ckQaBlwRwBBcQK93028YAW5yqkvuPddeCU4bgClJcVLMzjIjg8YGnxZh8oE1pykov+aBH+nYTwH13QWmwX7J1IhVTrMxDNA0GZ7Xlo6jbxb0bVHUq2/HUWtJhD0yaI+QNwNKB8NoH1praNFtSmAf+PjOmSTXAh3olZg/twe3P9dTCiSnC1zaEUaGgWT3d7bg3TtoGXRZjxE9tOZMGeaTkE5fNY14RqXd7bQwWQ3gypC5XG4hvLGXQlbtvSon9xjNr2dmjvVnN7HyLktc3xUtx7i0oRJQ5asVFMeg8+MEi+pudSfzsV/qM94xP2DEveex+4XEa1qPt+HwRAhPkh9MSfboC2JKyb7UHOPhJVDAKHvu/iKwd0aPgNreRLrWfgsoB/etsCW2KPYQX4iV+no+pXqWjMHEbzQT8DcalD1vpL5M8Ul8MZj7tN/ADb9IhrrlrIW1uDZ7mVER51wmp5BvCs74Dt6K0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?stKqNVJY78lZE6rcQiQ7ROEgvjdb+7kIDzrEonIbImQwSkwPZZ88/+XG2qJ1?=
 =?us-ascii?Q?NQ6UW7nNJkwkPCw0pRrSeummWPLhGxy9jPmhWI/R8G8ncsXETLAJm44vhxd4?=
 =?us-ascii?Q?m264rFVJasTJBUrT2cd703OJaBncUuTKWVHVutOUweaqRcc1nDb6eGqpOauN?=
 =?us-ascii?Q?4xVU4PumXIvd3j+76r5fPeLNbgQT7+bXb8up/til2jwgb/GBl4qkirNa+vPB?=
 =?us-ascii?Q?XgynI8aTBBRzHsixFFshXEMu94I6Ftyi1ZKe++O16LVGzQ8Py6g9NPKW+lLp?=
 =?us-ascii?Q?YkoIDfQqT2MfG5ZhI8nvGIeiwm5FCWcJesfryuXp6QbT5X4PxSw29zfrxk0E?=
 =?us-ascii?Q?VAQVkAbdA/TFlNWqImnALaprA6MkEsEzY2dLiHGQTwPTQ17gtmNqBNSz6PzY?=
 =?us-ascii?Q?NgO9JFebU2ou9pNeFnuPxbv0TZRdmvZAa7T0tkgwHicWMMGZI3jJws+U2hu4?=
 =?us-ascii?Q?XsKZHmMoJc3kZQRdBYKLYKFDf480ScDwG3SgkhW+wUKVy+k/jc9tzWdUyVSB?=
 =?us-ascii?Q?2qNE11p7+UM3M123+JaBWtDA5GBkyYsjPgjNM29fOlq4nH7XF0Ge/ZcX/E+g?=
 =?us-ascii?Q?eMhs1uaN5CAiLcEYJFh5EUnI6lcbTwbqHnOwjilEX9PGo1n22dOpBrZS0ykD?=
 =?us-ascii?Q?Bu22Cf3uih/kRds6hYzD2g+FxemK39iWSHzyqEP7poiY9XWpnOVJeD5S3svh?=
 =?us-ascii?Q?4f2JymvFmamSFOGxZy2dNWNmFDurwpF+Kvj7Kahg7gYfkHNmbOQSiDmClX7a?=
 =?us-ascii?Q?7sEFOHWI38MvtBlyKLXjoDQSBhkUlwviX38zyd+kgP3Dop7ZL5iElC6Y1cCJ?=
 =?us-ascii?Q?7ZvxD6hHKNLu+oW1iJhAuKfh0Oyv4kVlFSnOQQOE2Is1l/1QzQEq+epggQF0?=
 =?us-ascii?Q?M8ba7jUhDeTB1WUuymeJjwb+lgNYo8j7cJPzLhvJbJZR+/N4pwiYRhnYIlXw?=
 =?us-ascii?Q?gky6TMxG/9Mna+dQZzboIsa6Yvr4V8B3uZ/ZzBhKgC1bbNpeGvPDKzylqcuV?=
 =?us-ascii?Q?3kYC11xO7b7c8w+w58QnfN3am+jzi4i/NgfwybpEIW+C69DhKrQcw52Fd/lF?=
 =?us-ascii?Q?SGK8e7mknxjV5FDrRALPMWEYAGP+MAqlbIsG2nX0zCZFUArtt4Uz0RlUCvmp?=
 =?us-ascii?Q?gAeYLT31qZ0pqPWtVdNGptneCDT+Lt/Fc8sNZ3WyoE45m3FjWojNJ4eC4Bfh?=
 =?us-ascii?Q?nxz++9zEZ/xwhj5gJnTN0iyhCDCaNcN2euQH1vjLawxyWKgOkMFgaXoUHBaT?=
 =?us-ascii?Q?qw2kE65EVb0HM47zioCfcfSEGjhJQ4L18rn4msePZP5l9lbk6+3QZwiFHben?=
 =?us-ascii?Q?DZi9QfQeoNdq9JIra3Oc7Ko8+0YLRsJpDxmp4Rb6fYNz/jf8J3GUO9eFqoPI?=
 =?us-ascii?Q?xkJ/sLfWbCud/Vu+lC6tf2p/g97W9F5rLGL5Qvzrkfikvpxb7EIHyx7Uc6C2?=
 =?us-ascii?Q?Eni1ZBHUlV+lS8V6/TFrtVBbiG6GhZpwHxG1Kxn0oI5rmg7e/LKV0ZZ134kL?=
 =?us-ascii?Q?ay3SQbWZWOqUjoy4zsZQFA9OwQ/Ue/F60lEpBoRJ+5GGcIxgCRbmwMB4y8kM?=
 =?us-ascii?Q?GudEMIOuq6vO5Y/ax5jv6jTCf8dUovp0YQqYz3Qw7TYMkI+gikrItMMlW9qG?=
 =?us-ascii?Q?aqtc4oc6KLuBeSROSWvseVJNO/CT0G/kKfihMny5MSsYgpV7hBL3fZfd8Z5i?=
 =?us-ascii?Q?+PjLq0bIU5chRCff0N0f/FPU9n1yr4pO3Lv/6CB9YenYok9BpXTj6pkZPnCZ?=
 =?us-ascii?Q?5HRfuM05iFL7X0xp9uo11++7v7UNXJI=3D?=
X-Exchange-RoutingPolicyChecked: BU83bOGI+Sm0gnbvdN0NW/jovL8fakKQ4bbkZAs3TbxQG5p1kVfyNbZ5tHwssSS7G5Xfw1iMVobmTZg/TPmvNOkEF8NtD3x+z0iVFHcnRwoZWgNHLefd/7lrcBSxRkF88eKbfQULLWD8LUY3tIlc4JHVdWzMlcZEn8fJ/F486HcKeyFOEJvoZBv2Fj9PsA4dkcHwTbWMzeiG2jo1aG7NGSokc8rkO2Fne0I20ocjS/xfOmAJ/A7dlQWImcGuXuTC2sD16BxXbbBy6PDqq22Pp9khw8pEKdnT6bBHFntVq5Grerary3wNROm3E5b00kOxzgdpjtwO2P4xU5K5FVYi1g==
X-MS-Exchange-CrossTenant-Network-Message-Id: c12516f4-4121-4df3-a4eb-08deffc4bafc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 20:42:35.2040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ouZ0+Gbhik24E36+Fy6EM1V2H/Pc9jjKYPcqQubV9CyVX/Nl6PmGgNFXXfpO7vq69dgdvMtbJ4tHQ/IIPoeCVquHy1N3CqKr2rwT6XSb6Go=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5293
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

On Thu, Aug 20, 2026 at 09:06:40PM +0000, Stuart Summers wrote:
> The configfs getters read dev->config members without holding dev->lock,
> so a concurrent store can tear the value being returned. The store paths
> and a few of the getters already take the lock; make it consistent by
> wrapping every read of dev->config in the getters with a scoped_guard(),
> covering the surrounding checks that consume those values as well.
> 
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> Assisted-by: Copilot:claude-opus-5

I don't think the locking is terribly important for most of these
configfs interfaces, but it certainly doesn't hurt anything and is good
for consistency.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 29 +++++++++++++++++++----------
>  1 file changed, 19 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 052cce962161..0a85043a9dd0 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -1185,7 +1185,8 @@ bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
>  	if (!dev)
>  		return device_defaults.survivability_mode;
>  
> -	mode = dev->config.survivability_mode;
> +	scoped_guard(mutex, &dev->lock)
> +		mode = dev->config.survivability_mode;
>  	config_group_put(&dev->group);
>  
>  	return mode;
> @@ -1199,7 +1200,8 @@ static u64 get_gt_types_allowed(struct pci_dev *pdev)
>  	if (!dev)
>  		return device_defaults.gt_types_allowed;
>  
> -	mask = dev->config.gt_types_allowed;
> +	scoped_guard(mutex, &dev->lock)
> +		mask = dev->config.gt_types_allowed;
>  	config_group_put(&dev->group);
>  
>  	return mask;
> @@ -1243,7 +1245,8 @@ u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev)
>  	if (!dev)
>  		return device_defaults.engines_allowed;
>  
> -	engines_allowed = dev->config.engines_allowed;
> +	scoped_guard(mutex, &dev->lock)
> +		engines_allowed = dev->config.engines_allowed;
>  	config_group_put(&dev->group);
>  
>  	return engines_allowed;
> @@ -1263,7 +1266,8 @@ bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev)
>  	if (!dev)
>  		return false;
>  
> -	ret = dev->config.enable_psmi;
> +	scoped_guard(mutex, &dev->lock)
> +		ret = dev->config.enable_psmi;
>  	config_group_put(&dev->group);
>  
>  	return ret;
> @@ -1284,7 +1288,8 @@ bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev)
>  	if (!dev)
>  		return true;
>  
> -	ret = dev->config.enable_multi_queue;
> +	scoped_guard(mutex, &dev->lock)
> +		ret = dev->config.enable_multi_queue;
>  	config_group_put(&dev->group);
>  
>  	return ret;
> @@ -1308,10 +1313,12 @@ u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
>  	if (!dev)
>  		return 0;
>  
> -	if (cs)
> -		*cs = dev->config.ctx_restore_mid_bb[class].cs;
> +	scoped_guard(mutex, &dev->lock) {
> +		if (cs)
> +			*cs = dev->config.ctx_restore_mid_bb[class].cs;
>  
> -	len = dev->config.ctx_restore_mid_bb[class].len;
> +		len = dev->config.ctx_restore_mid_bb[class].len;
> +	}
>  	config_group_put(&dev->group);
>  
>  	return len;
> @@ -1335,8 +1342,10 @@ u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
>  	if (!dev)
>  		return 0;
>  
> -	*cs = dev->config.ctx_restore_post_bb[class].cs;
> -	len = dev->config.ctx_restore_post_bb[class].len;
> +	scoped_guard(mutex, &dev->lock) {
> +		*cs = dev->config.ctx_restore_post_bb[class].cs;
> +		len = dev->config.ctx_restore_post_bb[class].len;
> +	}
>  	config_group_put(&dev->group);
>  
>  	return len;
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
