Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3E9606A324
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 19:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RNRkJVcW
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DCE210E46A;
	Tue, 27 Oct 2026 19:39:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E40B710E46A
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 19:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793129960; x=1824665960;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TMsg7DBGpOft0xxlGoNhKpTeawcAfqOjv7rc5lcpcjM=;
 b=RNRkJVcW9fHLvIttRwJ4xX01ANv6voJxibfvxedbFZzlwo9tJiysxKgM
 oxi1+q9D213U+k4gBnakA6uzSweUNlYsAG9O9PuCWl/+3zo30qIi/5197
 aNGj57A+9TDY2qnfn833iyTDQHGmQmSYxvrCN+TreWT2/82DGrSd0E6KH
 0/9p1UHUwrDBTsyKbdsOHRuEkK9cNlRdnpAmEkU/hWhrLwC6JAgBmTJDi
 jg9m7kMxzAPLzDAcRKvW3YhzGakuNobZwwNcEPE2WKLW+GThlMfSDKDxW
 lfb1GjeOkkWNJVcGRWRUxc0aAJX08nAhHjpLWGnT+mq3sQTkm6dDadSjp w==;
X-CSE-ConnectionGUID: I0Ba1zBeTJOD/ROQEfmrgA==
X-CSE-MsgGUID: cNjXIHrmR5S0HUp5phNq+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1855270"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1855270"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 12:39:19 -0700
X-CSE-ConnectionGUID: fqkXe3DwSFWMjc04ET7Z+Q==
X-CSE-MsgGUID: C9n45NdrTiaQ8IvqgeDkew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4766800"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 12:39:19 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 12:39:18 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 12:39:18 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.35) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 12:39:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F2h6TFJXd137Wuqo7Ld9XvsPmgYJrCFentD4Z3SkhFRs7gsBZwDIAuVoZdRTP8zEhquma0wC/3n2IP2Na5FFgsl5Ynl2F0FXmWsbKWGXSXzrOgvT9VbJJ+zmmdvOw3wlfiJ8ogVluNSKML27VA+BR1HCNsunl149DZO5pHm2ifDed4tomJRSvX30pgfHgeAQQCsJToYdhb/sHiouIpgqE5T7sDBTxeXyvoX89CV5dfdHXIS3GdgE8JWlQrEYLB0XTd7pkwgiJZwHdWGpjQg1sCKx7PKl7slWgfOTKvRlkdLU/fdLWWsEKabH12OOY/tbqbnFal63Eix11nZhEgAo9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jsgv3RySyFKGNJuWN6Yl6x2Qgwtfix3cD4S7XsrqTrA=;
 b=uGVs31yjiaI2L5NiR1x3qN1UmmlIgNE8cW/BmPCzhY1tCu7tAlBSQyqLtevr7/8pyn5OCri/oWYkdJa+h4tSWUvw3onuOhJgQgd3tmtwFdhf4crry7iO5izufJl77LUm0SH/wJGP03l8unJexnFIB3e/Fkoofh/qyoLFMT1LhtydIa5vxgsbm1zh9B/TIG+3wKpcDBI50gTBiNxX1hrpuk32CMuXFDEtgVMGONP8qaJkHupcX3A6FLAGMeuZH6CYFU6W1EAykWCjqWk8ESv1HfTCuUfzREnChKYsBWP+Wi/CCjT5s+PuRZPN8ZsIhCoGgPMv5q+fvT0oECFPuVpD5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e) by MW4PR11MB7152.namprd11.prod.outlook.com
 (2603:10b6:303:222::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 19:39:15 +0000
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::387e:6187:3626:ee07]) by SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::387e:6187:3626:ee07%2]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 19:39:15 +0000
Date: Tue, 27 Oct 2026 12:39:12 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 08/10] drm/xe/guc: Increment regset size for
 Wa_1607983814 inside hwe loop
Message-ID: <20261027193912.GG203565@msatwood-mobl>
References: <20261023-wa_16031259911-v1-0-b0453f79c4e1@intel.com>
 <20261023-wa_16031259911-v1-8-b0453f79c4e1@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261023-wa_16031259911-v1-8-b0453f79c4e1@intel.com>
X-ClientProxiedBy: SJ0PR03CA0075.namprd03.prod.outlook.com
 (2603:10b6:a03:331::20) To SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF89507EDE4:EE_|MW4PR11MB7152:EE_
X-MS-Office365-Filtering-Correlation-Id: 40cd14a3-4de3-44d0-9bb6-08df3461fbef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|10070799003|18002099003|22082099003|11063799006|56012099006|4143699003|261021121427099003|10067099003|261021123027099003|261009223027099003|261022105027099003|261026140227099003|260925021911599003|260925022911599003|260925021311599003;
X-Microsoft-Antispam-Message-Info: flnKoU3SFDrwFNS/8wUBrFNkuJWB2PWMQ59ZTqQeRd1UUTyXtFhQhLVqBcWowcwD4oWGTA+Hx3IsN1M+JTJ56bEGIGaCnWbhg0if39qN16Vgbcw22bHrASAoey3VQmW1Rt74T05jZ6N6x5HK0O6vQRhgg1Ma+ib1215hJtiL8DwbJVK15Xia1+h1PAvCulh4Lr/wFvT76troH9c8kzO7q6th9C/ZXjebDuQqWaddXp4a5lB0ka1GK8GD7RxpElzdwvMmusZ2O2uB4YntxsYSePiJ3dcmFp/MTL4JMmZMlztoIRSTCLBH/Yu1dyTv0ds4Dmdpt8aOZNI+PNrevYA1X9P01PNOrlMR5yC4MHjXinH1SDPd2PM9yHNE13CzAtoxxzhHFyrRtpKer/+amBZVt4BldHeWXKRa+7WbU2BxoZ2fjfL0h6+bYKqZ3/eOYdfWnWkLK5JwdvpyG5MREXb7j4o6vHUTCbgZ10X5jIWGNr/I52ZhFjsphpXkQ85ptWApfQya3k9BJ+K/wA7n4oFryiCm3xjEGKi0q2VqUosaDrKaY35UYva1+4TgyISOKHSSUHO82ABtRX9AIz+8dK12apaD9JNH6+YGXqRweJsNWu/rSSyV1z5IC7/oH8Hk5wWrwySUqlSBDcueGqm+Y0WxZIqO/ol5M13T6vosTvR6G2Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF89507EDE4.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10070799003)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003)(261021121427099003)(10067099003)(261021123027099003)(261009223027099003)(261022105027099003)(261026140227099003)(260925021911599003)(260925022911599003)(260925021311599003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Kz+yRHl3nO7ESrrev5Zan+mG/e+kNjYaRtfoiN9AxIrqLeLKn0bFPcLFsa8Q?=
 =?us-ascii?Q?oDVzIt4u+hB4ZE/VHsxx1/wOqWk+o7+1wWau9WCpParrTGUh4TFPSRePnwj8?=
 =?us-ascii?Q?o2nJc6eRLqSWD5A2J9mt1OhXNtoFfs7Dn+fXQSpes4Th09y9hctWoyTBqngI?=
 =?us-ascii?Q?Yxf43+/8C+HEhzrjo02hdOdeAZcCZZgvJJcVmRJd4wnX5ZCIVOPqN23f/BMD?=
 =?us-ascii?Q?57u1zLwqHrqFeUecEMvVQCdIUoO7cptgAdXS/VGr4Axh1RuEC69Pf8c6Seem?=
 =?us-ascii?Q?PVTqZqL4ixrTEkHbsZ/JZAG3RWoyngRx+BkkrqiFCw24YDu6qnb+4ulhMR3O?=
 =?us-ascii?Q?j8aGLWzSOpK3k9gX7BCqaKIYWobB+YN1SBUXiqi3HFhYpVDD0b6DizhZAAd+?=
 =?us-ascii?Q?3WjCBnpA0yVKDt8rz42FrbaVaNnah6JWtfVl8kMWYq7Krly1b799Oo3lRH0f?=
 =?us-ascii?Q?komG62aLymORyJukhX+cWUQ6isL183er4MK8q+DVf5pIeT9t6jSIgmzWow5D?=
 =?us-ascii?Q?TK9bqBe4NNbtRRsfQhEA+xZ1XUaupIIxXoqyOHzjwleBXaQvX4ukhgIZlYqg?=
 =?us-ascii?Q?zueYKWYexNLmQ+I6QqOVROKuWI+gkK5sSRdhN0YeAuF86v2HP0vE5ub5r5af?=
 =?us-ascii?Q?QamwI+NP0q8E3tUfe9e8Kd3U3aXFaIVJCECDioXwKGE8N95KeGCvN3+P9HRO?=
 =?us-ascii?Q?Lu2AjmT/dSE3mKWaoB0AOQRqvGOYtohynIB4KxpDavdhQPzMtO6Wklzublzl?=
 =?us-ascii?Q?xkI6G4p2mwNlXARSvd3fgxrPCKM3mgw+xp1rQJ0BEKKheUZ/Uwrh6yYe0Ycm?=
 =?us-ascii?Q?Yw4XDZVRagmmiMLGzSp6sGQ+1hFDJFFwiq3fzp1uKzIDgHEbG2zbHu+8AWe2?=
 =?us-ascii?Q?cDfo3pSpeoXvlzJt0RoQtIhRS1IIuyrDAr6dUymbRxeYbtQa54cbYYhWkkln?=
 =?us-ascii?Q?xcXm9rjgsf+K8CMgKL903YAhPbXuWjJDx+UVwpg/2fo5QBn5wYBOZ2Ssm0bG?=
 =?us-ascii?Q?dhHxZ8GUL6basWIVXSGQF2Zlq8R95JPocptsorPZUGD/FTeKB0GKnoOpU+1t?=
 =?us-ascii?Q?Em3IBskunZcv1yy4v8e9rXn8Yhw+VBXK0beHWUbUSEbLCImR1gT48gQy+6VU?=
 =?us-ascii?Q?1R9sP5FaP8WoJYxqth1+FOOGTOrPkRG0oRAW8yKmmSXrdlu4/5uJHdIKwv/z?=
 =?us-ascii?Q?J/NlIq1fa+sv7k8an7O33/6B5aYuFcK9xyeP5NuKOFYtJwvZ/K755O9aWpNC?=
 =?us-ascii?Q?GyldQzElmcaSQLMqIF97NA8Dks2/e/uAnNwirLw/Drw1w4CHPiQ9COoA0Qir?=
 =?us-ascii?Q?7uAOFQJiPzwe2SvhV1j9ZE4/GX877sIP3eSvquU4lyWLsyIAmgHTLMjpzxsZ?=
 =?us-ascii?Q?xCEghbk3FYr5uw8oX3TpXaVdAtPqc9vVI29ps2qKE6kyCM5Cpx4UnZerpjK2?=
 =?us-ascii?Q?9Wd9An4G9U8fL2B4s+mKachEzJ3tJi/Z4cawT3zJkXUHfbT4WsPT8kY1njEO?=
 =?us-ascii?Q?LuSc6pcseUxa6gBFbCinezSwtuAMdI2C7oMbBFZoxyGTKnTVw/m9yTHG5HDH?=
 =?us-ascii?Q?gz35slPjHBObnMzjVfkuTljdVG1BwdUhBbgIt//aoS7PF8drIt0W6mPpojt3?=
 =?us-ascii?Q?eGmdzUHBuoLFa9i9sJ0v+zb/16qxDq0Bb6YMfUeXWZcgY29PaOKulwc4wOda?=
 =?us-ascii?Q?3RR/+ALjsnjfCd6GGgUomeEQ12pKIVFzgP5JJgmiQM46gOLIK6UKhRwJbAdn?=
 =?us-ascii?Q?nZrbfit2e6yEAOBvjvso05hWkZRhSByisvyBi4elYhl/Kyz82kZ/v62aBVqp?=
X-MS-Exchange-AntiSpam-MessageData-1: t2N2THrai1tcFuzud73JWqQu9tmqJTSDQXE=
X-Exchange-RoutingPolicyChecked: CQzE9apVYKcgwH1+GwUC8Mpv1A3NpErSCt63GW+/UtcVij99SBijUASmeuPah981jyS7wUAU8edw016V48hllyj8mVzXwvYpbwo4O6LtPnelO3KB9aTlqz+oUwgphSmOQsfV9xH74VmrPRoidlMemM+e4f7IoUwXf3K8/ZcxQ20ttjSvtWTz2KIYlLyptZENcbIM8LLhrfesmG60FGTlZXg9fhsPqgzotKm7Iv/yet5rYpK76mZNHBbRBwHVj84teF/68CO6LqBYKo6c+u9YYxU51ugiJIiprNqUDAM0BOStKhu3gQzvH826blI1m3QvZSRCVm1V5HWrIJrW1vb9GA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 40cd14a3-4de3-44d0-9bb6-08df3461fbef
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF89507EDE4.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 19:39:15.4704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1yKw5/6ZRimEl21xjH1N2c8pDkHgXKXIX/VWgjy6XWEEkhvPN3gMFqM3KPZR1zHq7M2OwauyyM9dAsRIB+M+XE4wQK6t4wpcak+s9r9Wq1w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7152
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 06:09:36PM -0300, Gustavo Sousa wrote:
> The regset size increment for Wa_1607983814 is correct with today's
> hardware, because the maximum number RCS per GT is one.  That said, it
> is arguably more accurate to make that calculation inside the
> for_each_hw_engine() loop, where we can mimic the same conditions used
> by guc_mmio_regset_write().
> 
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ads.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 43a2951a66d6..a67d3405b10f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -220,14 +220,15 @@ static size_t calculate_regset_size(struct xe_gt *gt)
>  	enum xe_hw_engine_id id;
>  	unsigned int count = 0;
>  
> -	for_each_hw_engine(hwe, gt, id)
> +	for_each_hw_engine(hwe, gt, id) {
>  		xa_for_each(&hwe->reg_sr.xa, sr_idx, sr_entry)
>  			count++;
>  
> -	count += ADS_REGSET_EXTRA_MAX * XE_NUM_HW_ENGINES;
> +		if (XE_GT_WA(gt, 1607983814) && hwe->class == XE_ENGINE_CLASS_RENDER)
> +			count += LNCFCMOCS_REG_COUNT;
> +	}
>  
> -	if (XE_GT_WA(gt, 1607983814))
> -		count += LNCFCMOCS_REG_COUNT;
> +	count += ADS_REGSET_EXTRA_MAX * XE_NUM_HW_ENGINES;
>  
>  	return count * sizeof(struct guc_mmio_reg);
>  }
> 
> -- 
> 2.56.0
> 
