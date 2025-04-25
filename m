Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0681C369D1
	for <intel-xe@archiver.kernel.org>; Fri, 25 Apr 2025 14:21:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A83BE10E302;
	Fri, 25 Apr 2025 14:21:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XCtMvaor";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE3410E302
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Apr 2025 14:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745590872; x=1777126872;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bxZq9KCEM9jnKCX5owcuUfiqNHhC7mKGBm7ZR2JXwyo=;
 b=XCtMvaorZUkj17IpAUUXbliIPV0Io2dTbzAUMuaxD7FuLWhZmyZYNHHs
 qJluHNuoX8iZ8k8QDYksCO1XVLTfMvaribBTxOTjGldgbHRDV5nr8AZP/
 iuCcYibfVoB7y3w97tyHHLrMVvEsxcvuMLGECEJbnTxj6sl7cpWRt6Xxd
 sZc4SEok5AI4w6onvoGuI9Jbb/iIkEy5CZJhSld+kbIGTH/yFyp2tNPJV
 Xo7els9OBmaa9LaMo7TfHJoj3JzDa+oaQRjP9Jt5NsSYRH6LuaVU2ZK4l
 Itrb+omnon1RvfXSZowK0zX8i01a3+JWoS2Ml3I4U5bKJwIBTWJcZVgXU A==;
X-CSE-ConnectionGUID: SsHk1PbnQN+vgdpzNPSBiQ==
X-CSE-MsgGUID: ldEOrgG5R1CcDaJSez7CeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="51074954"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="51074954"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 07:21:11 -0700
X-CSE-ConnectionGUID: R9eo20VRSUu4cM9FQE34ZQ==
X-CSE-MsgGUID: lNDhvfRtSSq8VDkPq4nnNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="170131799"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 07:21:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 25 Apr 2025 07:21:10 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 25 Apr 2025 07:21:10 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 25 Apr 2025 07:21:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=st8HNdqbAT4lJdRNQS/tlyKy1y28KssXmPg3CzujlyT1/iFj5hqTibeTCJ76Q55hiBP27Hvp1E5r1YwxcC88jubpjI0lNPor5rs3Zmy6UQ2dyXhffSr29YsmqTFIiCzS+UcQeYXRQQH3G5ccFw2Mqt5GAupvlE8dfd6f4CyWPkzsKdMWTiAQPZjv8OiXPNOnWQI2mtbbQuhuqS827kUUzqzdxfetlCyAmrcElJaVTNFmP+I6+GKwDFZu3dLnW2TUtGfEOImaQydyLXDzvzJ4Z8rCwbBWJ9ZMUE6whNn8tnh4xtV/YjJaGTgYtuwQKMdxMW0w4cKdnxcVbAeL3E5SHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V3wQyXwq9PMmU57On3hVYJn7/MoHnrJtHy0xRjuloJs=;
 b=FtBH5x7IIRgmmGJ8jHy34CSxTqcn9NgSHpA2Alcf0WRq+0SGqniB5iYse/TysVmohCodTlKmdMw8kpbe30NiwDjfXEU1Mz1WEE6AMQOTHrAwSGRRL+H3ne7+JKDieDQACAFsrKGVvuNn0RTE46HKfqS2dTSvWolniUMSu12MUwUheLFK6x5ekrAl2sjj5oOPJ82vEQLBjrP94+/g++GuZLf5fWy3DRiJqgAxO56lZDyMH5PL7z/x9WkIvUMkCLbMz/ay6JP4KUCzHNZkOFdViIby11zT1ZDVi7V34BaeKaXVQioyhL7W3Ll663UAjKDDKIFj4nKEORiP9NGuJJICMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CH3PR11MB7371.namprd11.prod.outlook.com (2603:10b6:610:151::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 14:21:08 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 14:21:08 +0000
Date: Fri, 25 Apr 2025 10:21:05 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lukasz Laguna <lukasz.laguna@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 3/4] drm/xe/vf: Disallow setting wedged_mode=2
Message-ID: <aAuaUS1MTXzR68cH@intel.com>
References: <20250424143043.937-1-lukasz.laguna@intel.com>
 <20250424143043.937-4-lukasz.laguna@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250424143043.937-4-lukasz.laguna@intel.com>
X-ClientProxiedBy: MW4PR04CA0252.namprd04.prod.outlook.com
 (2603:10b6:303:88::17) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CH3PR11MB7371:EE_
X-MS-Office365-Filtering-Correlation-Id: 86f6bed6-2edc-409f-8ee5-08dd84046be3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?r61hd0FishrbLmE0tc2FOsVzbuEntCWBS5F/DApUpvWjeui9egMN+0ap5i8I?=
 =?us-ascii?Q?MZJjvsrV0BlmcgRWf5bJE/kwKjs50jdKM/UD2EZyVBfgW7KnhcOjzmxcvE2e?=
 =?us-ascii?Q?TyiiZvdhNWhzHnDrS6zJNmwErSSYKX5ftJYtjvRoOES6NiVDqaxLx/CVRoyz?=
 =?us-ascii?Q?N2dilJedNINgYyVt6LZ0PTRbhiKIRYbhvSCnRU0/mRaEfAj2WspmY3Icwlg9?=
 =?us-ascii?Q?lpNY+EDZdNeYORKXMoHKDaCAUMVwHDIR4Ya3/9rgoO/3AKwOsaQolR19+6t8?=
 =?us-ascii?Q?JX+cr1czl0on5MtiAmrT5kPN7taALnecLbvH360o9e06H29eDDAgeDyiFwhH?=
 =?us-ascii?Q?Z5jm2Z3/KSNv/SlvotukaU2E4/8I9Yy84i1AART1fOBjrsdbvTc5+dYcIuaV?=
 =?us-ascii?Q?MA1UmaQfuy/jrwQ0NLSF6TsGY2cK/3d7T1Tbn9pF4BbWL+zyjum2PDgY0mqF?=
 =?us-ascii?Q?kX54DZSPEiefuJJ/ozF99nHUwgvOHtNCVWYmyIUcxyl2LsO07xoqHudGp029?=
 =?us-ascii?Q?Q6EWK9N9Eioq6yx1rS9a9ngYbRD0DHWOZNQH9+GGRfX3QStOCd8RPgpLbCaa?=
 =?us-ascii?Q?vfg+5Ti5SBBS8wtVxA4VWCcweebPNjOuRGEhRUO4bWZRY3IyE1R2n8McC/8n?=
 =?us-ascii?Q?Ti5tkMgbvqMteIVLOHZ3TeSZiMTyL20JtTNaA9gPHWkvIOoKb880f4dmKHP4?=
 =?us-ascii?Q?iAG1+IZ83QmOebhhwMNCOY3F8cSxTYqIcHmGRQKNSP0HB2X1OKUk2yzb3PNt?=
 =?us-ascii?Q?/i352VHfZO09maIj8/tt7FyEdByMYjKEgpEiOdFn/Y6V8SPqGHCG9BUk9Z60?=
 =?us-ascii?Q?/aE9ZVZI4u9PZLceHETMOuzR18F2ZRv5/FF8fhfzJcgIeTvF7cjaxdrJpZdQ?=
 =?us-ascii?Q?Ddq7+LadIfH/yYBYrSbaquG13yu2KZMmnmZjZU14Y4wjFgoUlxl+PkXnENoY?=
 =?us-ascii?Q?JVZqb6AVHbJJSaUETO+7tvdtarWpFM3RU2nPkE5zT8Tax205cbwFk5dJPrFI?=
 =?us-ascii?Q?yL7TUxoSObJd5gvcV5E6mOc5iazhOwu2pW9jyH2e3GtvGF9eim4ok+7yZ6I6?=
 =?us-ascii?Q?CMUDIMwopJbtyi2MaM3duDUPYOZBu0UCdEpTI/6G77pLCidS6oJn4gP2pRWD?=
 =?us-ascii?Q?jsGPPaH9ZR5me9A7+CNte4d4NE3fr4ts584ZlgJDG/76a7ERQB89v+52I19S?=
 =?us-ascii?Q?etjzfE4h9fdQEoMkiMlDeosUAYasqpvVbLB0pHC2wlgt1xPvE+hld6apimac?=
 =?us-ascii?Q?ce/tXtyteOuUxfzUepWUvjYIbtto+MhpoCOq/aGMpBBcpZeTGujlGVcm/EtU?=
 =?us-ascii?Q?pXMpK4e+XTONs2TI5mcDeLhqUdEDZI3xxjK97vKqeHqW/SYT/XcW1BvR6Tor?=
 =?us-ascii?Q?AmJzowe5cz7axkOQfNt1OP1c58I8bPvjGOSrqyJDdmOjTWrFPdnCflM1b2is?=
 =?us-ascii?Q?iuX4PQla+HY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?joSOM1cyg8J7v9j+ZSOX6mJ0k3gRq/KcrpTAe6EksUnh/o3/mj4V++59L5jp?=
 =?us-ascii?Q?WtOTsd9FYA/xAzIaZcViom9RFQH/5OUgJhubv7bRQF3hS0K+JqeC6OW9t1ui?=
 =?us-ascii?Q?ourayaZuaXy6w4Sp/x39kCqiMq3gqaz6k/u1RHaOeVz0fk+o30/xqa784zAC?=
 =?us-ascii?Q?g+aTCpTELIomCQkMKIHtV8XFV5r2cHdXK236XKx0msiXrZPRx3MqBxFlxVdW?=
 =?us-ascii?Q?Z0UhwpDC0xNSS0nFDvGf3TcVwYFHStt4Lwncvkl0EEawPLOkNaITsGxIeAik?=
 =?us-ascii?Q?Us7wDaO1JoyyI2oIpIyP8/M6ZHRsx4h/Kwxjyf3yA/4sX8OJHpgtfPmUn7fF?=
 =?us-ascii?Q?RoVBCmaE4SK8l/LGcMLx51/ZpVhNMSCP8Roj67QDCxm6JDLGns1yIll6BDeI?=
 =?us-ascii?Q?1JkRyeDX7UbfXKGVQ4NmW/Sk/Vrtyl2+2NpUR72ppPEeWREQXl8Nevl3Tat3?=
 =?us-ascii?Q?LoYOsP1ebP+pQLG5NSJwGeCPGeox/8AX8k1lHcZoQLwFcXdx/AmOp++iIPpx?=
 =?us-ascii?Q?yE+MBunpp+USvxzaQxtfaB35IPSVo1eOoyaKLPExDET7Qt9n6PgH2Uj9HqQj?=
 =?us-ascii?Q?SiQCKWZ+pCsyWVt7FBz/rAC0PBqcZY9OTZSboRTY1nY7q1pzPKefab+sF+Ac?=
 =?us-ascii?Q?jq5XDZOr1KIrSP/dMxwwWMVThD8wo3SgiGmfPB09FOvVVgUyXoUaAs1hDpan?=
 =?us-ascii?Q?BuW1C7G5DQNFnJPSJpm6F1q6hRP4f5rPOzNqE7D34NKBzk9HLTAbJtIaMcBc?=
 =?us-ascii?Q?8a29WfTctKGML3HtOo58R6ha4EIsEB6DeNmNn72OxtIUp+efh10D0Ci8Wq17?=
 =?us-ascii?Q?TqAgYiJgTT0MQfBhwyAb3zabM7lMpWM/FBZP+m7G0TPSS/hWohbC2jt7GOgc?=
 =?us-ascii?Q?CPizgvlAwmbHEdjpaBaQ1VmYDygTse804TWbmqp6SU8UsBe5IdTS5+Lt9JV0?=
 =?us-ascii?Q?rNxElqhUTxf0ipJaiY/OU9zA1pzkxZY8YgCPQNBVPUNavS4WG6wQ1rP0bFpj?=
 =?us-ascii?Q?64es9ex38pXT6jtn6vTPD3i/QaSgLIVOYnbp6QlsFmJFCT81OUt+Rf8v7dR1?=
 =?us-ascii?Q?nIjGEnNimyJElkZGtrCMb8dalJfaud7DkGfjRTEthOHa8/7UPmBRL8Wc8b0L?=
 =?us-ascii?Q?aQgvxLg4YU0iB6rZukKGJSLLaJTIQQMHfxpf9ByVq483MQBLrFV+d+REerZl?=
 =?us-ascii?Q?YH1uly51FjhTlqeUyFVB1cFKtGowFh7/mZ9HjWODvHIar5MR9PQ/rkkhlPw9?=
 =?us-ascii?Q?VwgOlfip7WjcdhYuvSsvO2yotQQmBRm70msACaLrbNOiA5fqfu6Nmmh/hPV3?=
 =?us-ascii?Q?VRFMbvoKqzeErHt9VYyou57yaYS5p3gHE/upItMByYO+xmMLoTLunHPFZCXN?=
 =?us-ascii?Q?8O2Pjkab/Y//tDHrbduxVBNf8w+3zJtGiTP/GPKcGjqXbFPJASrlL+Iammnn?=
 =?us-ascii?Q?24ZXhysAFiIJ/WJO+Nyb++lxigif24vMyqkiyMrPUB4iaRjy0A8oXUN6vjfJ?=
 =?us-ascii?Q?gIxSBZ/X2dHeZAHEDblfrWR6WjfR/QnKWaws1lzlYkENuibe4xiE2M7DAFRk?=
 =?us-ascii?Q?JLa8/tPld0VVBrmbEpVCeAWgbxtfH3oijvts8tOijnTuVAJ8f6GJbsoMQ7XG?=
 =?us-ascii?Q?9g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86f6bed6-2edc-409f-8ee5-08dd84046be3
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 14:21:08.3476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TYbL55AYx3XZ8uUq966vBykVQ0EXf6mw1PKLC5+w8Us3Z4xbaOhoUGMS7OxGgrnk07FZAPNiosBEXoHU/eOL4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7371
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

On Thu, Apr 24, 2025 at 04:30:42PM +0200, Lukasz Laguna wrote:
> In wedged_mode=2, engine resets need to be disabled, which requires
> changing the GuC reset policy. VFs are not permitted to do that.
> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_debugfs.c | 3 +++
>  drivers/gpu/drm/xe/xe_device.c  | 5 ++++-
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 2e6d8744003b..369bb2103e4c 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -169,6 +169,9 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
>  	if (xe->wedged.mode == wedged_mode)
>  		return size;
>  
> +	if (wedged_mode == 2 && IS_SRIOV_VF(xe))
> +		return -EPERM;
> +
>  	xe_pm_runtime_get(xe);
>  	for_each_gt(gt, xe, id) {
>  		ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads);
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index d2de6936cc20..13430538f861 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -731,9 +731,12 @@ int xe_device_probe_early(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> +	xe->wedged.mode = 1; /* default */
> +
>  	if (xe_modparam.wedged_mode > 2) {
>  		drm_dbg(&xe->drm, "Used wedged_mode value is invalid. Setting default (1)\n");
> -		xe->wedged.mode = 1; /* default */
> +	} else if (xe_modparam.wedged_mode == 2 && IS_SRIOV_VF(xe)) {
> +		drm_dbg(&xe->drm, "Can't set wedged_mode=2 when running as VF. Setting default (1)\n");
>  	} else {
>  		xe->wedged.mode = xe_modparam.wedged_mode;
>  	}
> -- 
> 2.40.0
> 
