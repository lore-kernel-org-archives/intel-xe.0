Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331CEC4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 09:20:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB49F10EE25;
	Wed, 17 Apr 2024 09:20:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ITtXi0pQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC49E10EE25
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Apr 2024 09:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713345651; x=1744881651;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=ZCr6opfjQDkianW7xzZhrOeDIQAi1m4PpvfDQrroG1o=;
 b=ITtXi0pQKGdYLfYZt93Wg9XvJ4jxY9FqWlZTY/enLIwHvWwgJaLb2nr8
 OJn6Qq1eic6AsILQp+WkgYLburkfOu5Jv4lIrjQKw30LvjT0o1tUNfbZh
 8VLT+Im17j2rn5QetN76eB8Gn4SeYYC290VwzbOEekfiq515UNhxJgLwU
 v3XT6qeBeyEJFy+sWjR51mmW14MEx9tpHHe+IK9n7rbsagk+AMWcztEIH
 sC2vy/tenG+EB8rmFMrO5+KqTT8j9P2tCjRMhvsbn81uGbZcgvEBPId5Y
 CXPTAz2b0I+Ossx25YCGW76daYu3e0YEU6SxCL54XJuBD1dCHFxMPdVZN g==;
X-CSE-ConnectionGUID: jYIKSKA+RneH+T9RQFLkiw==
X-CSE-MsgGUID: 8KTtYXjlSGyfuwPRLQ0vFg==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8688218"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; d="scan'208,217";a="8688218"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 02:19:02 -0700
X-CSE-ConnectionGUID: 81lQAkmhRxm0Z/Vq2mAjiA==
X-CSE-MsgGUID: O3ygQKrpThSVCiq9QTrcEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; d="scan'208,217";a="27350829"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Apr 2024 02:19:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 02:19:01 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Apr 2024 02:19:01 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 02:19:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R2mCNqm7VlR/xYIME2H2G0ByI3iw72tUP+iya1UDnTBexZIScPGYhMf2wbGc+t4Ir7jcThOw6Z8wBwlI9KB+gjDbrvFNtGmKbedropRLpnYF4eHLVpiEXLsvo8BNnmHEh+tgw1y2VRBlT8sci7M9lpW90i/31SrmY/KlEPS8z45nAGGIY9yauCsryGUwuQibtkx5HidSeKvybrNmaorYckjW3EMGlhHnlwOFRZQvLvm8n/7mesC0ZDmqi09mbdbnokGTF9gFfYqiPtnSjZUPwNawc0XOQawlzN7f7S6DyLuHfBxXpoqxZkCAjHjWnnXOk4U4VVxRXv4jlrkxRytzNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yavl1yTjiuPhC+aD50xSUsMf7tLytbU90zboGQTVxdI=;
 b=ctULnmf/n++HipgsAAWb3LQLAny8GGFcabKS7xdFvU68e1weCoWx2XFUKCHWopj+uKiI9h4VNwsYw7lg99/QN6vBW67Xdhpa46r3mOqT3fGrCGswO4M9HxviHI4mhjjEWdT8vQjrGr8B9QKt+y9gK7SoGeGSRrOpVoY5NWnjw+lZsNy6TYiIK9qx4J7yDvdkgiTsmN78rkXCKnz2W5MMPgboaQO2DH7ZlDY6J3F3Hk9Ap9A6zyKG9TVIft/USHL/eNKJr6rj3+Uovg/GwYyQisC2xa/zQdwjDZyzyV30ckXfZJlemzAOr8cDBs+z4gkrOtMi7PxxhjNinFWyqlp5Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SJ0PR11MB6765.namprd11.prod.outlook.com (2603:10b6:a03:47b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Wed, 17 Apr
 2024 09:18:54 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7472.037; Wed, 17 Apr 2024
 09:18:54 +0000
Content-Type: multipart/alternative;
 boundary="------------MxEkdLBiB0m7v0NRC2riRc9n"
Message-ID: <64f86d4f-bb70-4bb1-b0f7-3341e5b7d52c@intel.com>
Date: Wed, 17 Apr 2024 14:48:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/xe: Extract xe_gt_idle() helper
To: <intel-xe@lists.freedesktop.org>
References: <20240417084145.242480-1-aravind.iddamsetty@linux.intel.com>
 <20240417084145.242480-4-aravind.iddamsetty@linux.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240417084145.242480-4-aravind.iddamsetty@linux.intel.com>
X-ClientProxiedBy: SI2PR04CA0006.apcprd04.prod.outlook.com
 (2603:1096:4:197::13) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SJ0PR11MB6765:EE_
X-MS-Office365-Filtering-Correlation-Id: e80ca896-7c32-41fd-6480-08dc5ebf66e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +MVDTFFroKop+YbhuxeZigDrKIquv6xvcSgjkRjOIjGJeo7cY1eSBzfoGcskt+EPThMn2RxV/ijv+vM3jmEPFnvo7LyeUCk/lzMEc1WmC7DTA57Sd2se9iXO1VHk/UZQWhE0JUVV+QgS6q/m+A6Iy6sC0+4A1E92Tq5zMWi9ynP9b5Pw7/CPR2NPseGy+YolliPFuXIjkCHd//qJZ47xsGSTnrScZrJDIeJdzuA7lh1zFv2J8FxsOZ3gqv1D72seTwE3of9oSQeQ/vUeVwPpPvbYA0pOL3oqQzIaKBw1Ydi9TRQGuo0wfOnWpZB0SyCbcr3rNYMnc48yPOoy01V4CHgj5SutfQSVh655tdjf2RS+8bzCidsSPpAA1LAsU+CogE3DTFXTiZErE2PxBwopyeayBHIeg+CUB0g1UfZPhjMM27T3MyNNP+7qC7FFcyekfxrz7f02BTvwaxBFM4P3fND4OdWMGyKsdoE5nI3yGe3tZ68UEUtLCFpkH/nek9kdVxFizxUKd3iuD26FDHq/w5PqgGYWhzWK/MpiYwL/a/0GjHOV418j5xkuMDSPixAMiGoViJSqP5dUv1zLRfP80PeLxCibNV/6yvukJkYHai4H0ryceW8SUZ0OeYlC9rqBalxkQZFuMlKO2xDSFP+U7NshzTk1FM+/ks7UY75D13s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0xiYkFtYjRkdE1mVlVPYldDT0V4NTlKbDhaamNLYjE2L2xxL1VuR2ZQa1NV?=
 =?utf-8?B?Q25GbHNmQUVMeG9zbmo0aFkrbWNlSjZMaFlBbXcwN3hZc0dxOGhyK2QzRHlo?=
 =?utf-8?B?VzdUdUNsajFlSzc2TWZjNE40eWFMSSsxdWNoWkNlQnE3MFZDQ010bUc4L0w1?=
 =?utf-8?B?Y0JkaE1iampUUndyclpiSlNxdytCRTc1TEl3T3ZhbEViOW5JQnR1MjdvV0Vl?=
 =?utf-8?B?alRleW5PanI3L0xXZ2pOcjA3YmcwM1RxOVVuSGFGdXNMYU54SUt6SVRMUmJt?=
 =?utf-8?B?WGFoR3F4YlRsL3A3RFFqY0lrdkcxOG5Dbk1zTGhMRlc3bU9aa0k5TmNUTjV3?=
 =?utf-8?B?U2xEajJpS29jd1gvTmVmUGVTdzVLMW9HWXRwYkw4Qlc4M3pQY2ZTb0lLdGxE?=
 =?utf-8?B?TDl6RHkyanA0eW91ZjJBTlJ1K2hNVjNoMDVwYVlQOGxDcUFLN3RLZmx1LzNo?=
 =?utf-8?B?NHVRY2RCYmlzVzhvSS9ZWVlCU2owL1lLT0FVM2dDYUVVSXh6bnoxM1ZzRGhx?=
 =?utf-8?B?Z0xtU2lJUW5ZSzNJbDA1SEdKMFJQVmpQZGRWYVVVOWhTMHErbEVJdWtkSkFJ?=
 =?utf-8?B?SGh5OWNiczc0aUpXQUlTL1ZaYkRBZkljY2xacFdyT3lNWEd4bVdONnc5RXpu?=
 =?utf-8?B?OFMyM2VtRFhDeHJKWVp1WkNmOEJKSFJwZTA0MFRVdE91a1l2Z2loYXRHOEdE?=
 =?utf-8?B?RXZkZ2JxU2dWY1FKcWJsOTJWNENTUHV2dk5jZmh2WFBzUFljNkxkbHUvckV0?=
 =?utf-8?B?Ynd3ejlsMUlWUTlOTWZ0cGozOUxZdk5hV2xTekJvZExCd3FFZ1NFNW41aUVK?=
 =?utf-8?B?Nlp3UjBtV08yV3F1VW5xSXA3dElzaEwveVVhbVI2RkJZeU1VNy9wQk9LaTRK?=
 =?utf-8?B?Sk1PaURLdE5YTzdBRlJ0T3dXWUd2a282eFBETnBZMDM0NmZFZncwVGh0MS9U?=
 =?utf-8?B?d01kbEpwQjdYQmtHU01LTVJxR3czNTRuNm55TUh1WURIVStNR2lvQ0xJNDdP?=
 =?utf-8?B?ZVE4ZHVhZ2RocC81WTJhbTQ2ZThxRTdwRmgzR1lvd09BaWlTalk5WWRRcTBh?=
 =?utf-8?B?V2NiME9uUURjQkdQRnBWc3lLRzBvd29oVlZrY01lSVppNzU4MDE2Qi80YUpY?=
 =?utf-8?B?WCtwWFFERDdwSDhONklLRnFCcUZWbGFsNUhrWC9lcTFuc2tVdy9BUUdrRzZ2?=
 =?utf-8?B?VkpqcmtZaVp3RjkzNUNXZXlJM21XMk11ajJKb2lKaTI5Qmh2Z25qQXg3cVcx?=
 =?utf-8?B?OHBsTUwyNXE0eFNNT29qemhVdzUrTDNLLzhCTy9MejV2RnpVMEF5OXBablJH?=
 =?utf-8?B?Rjk3VDBlcDN0NGhxRnpPbFVCTXBjTmdCMWs4SFNBM3VPVnhCbGE1UEt4SnhD?=
 =?utf-8?B?emlrb0NqSHZSdmw0bjlyVEhtVWFXUXJkcUozaW9IRmxVQlY0c0hPbWlXQjk5?=
 =?utf-8?B?d05KY1dHWG5iV0xWVmdTUmtITTk3MGdCNjQrL2xrT3BVYlcwbkFnSnNOSHVK?=
 =?utf-8?B?eVorWVpsSlVDdzJTQmozRGh2aGJMZ2w0SGVTNzNnbDZNbXNUekF0S3VjdHAr?=
 =?utf-8?B?b3NvOXUycGs3Z1JIeTE1enloc2h2RUJSRjl1bW16UW9RL1YvZ2lUVFpvcUlt?=
 =?utf-8?B?eGV2Kzh2NEUzNjBoTWFjaWVnSVkxTjFCVWx0SU1oZ1Q2Z1BHUURQWXhwZHU5?=
 =?utf-8?B?R2J5aW8ycG9hY0tOakJUTWRya2Y0R0diTGlCZnoxVmJicS9UUkxqcUduaURL?=
 =?utf-8?B?eGhmb2h1WWZYYUI4c0RJM1c0dkFIN1BOZm5VeTJBS3Fham84WmVFRVloTW1t?=
 =?utf-8?B?MUFXVnM3UlpPSXpLT3lmUW5nUmkyaVpGWTRwVDg3L216TnhBWDVmejU5KzVy?=
 =?utf-8?B?U3JLZDFXWnljT3p6bTFBRE1SZDBXMkErK3JlMUN3NXlKU09kZmdnNXBFOHE4?=
 =?utf-8?B?TURwWWhXYUJsVHBMWkJQSVFPR1J0bEFiV3hvQktYZkUzd0lGV1hQaFpMZ05v?=
 =?utf-8?B?eng0cysvY3FIczZSemZVK1Nndi9zQzFteWZxQzhIbE5iZkZqaG1GckVheDZR?=
 =?utf-8?B?NHMxcWZPQnI4alQvQkRjN2F4TlI4dVRZUWYzSldCWE1kTS9vc2NFQXU3SFVD?=
 =?utf-8?B?b2Urd2psdFRtbmJTUlFjUUhtSlZxYjhlUStUQUdyeEN5N1VWZ2RpRnFZQk1a?=
 =?utf-8?B?SGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e80ca896-7c32-41fd-6480-08dc5ebf66e2
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 09:18:53.9994 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YDV55v5TZS85brnPjakNdTkn+PXgDDz/VjBl5/3Ocz+8J+Ea1XRNDoXOSPJVXA3Y9RBJnurwC9GS0bll/WvdId4Lu37xLrRl8v12QD+KHRs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6765
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

--------------MxEkdLBiB0m7v0NRC2riRc9n
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 17-04-2024 14:11, Aravind Iddamsetty wrote:
> This would be used in other places outside of gt_reset path.
>
> Cc: Lucas De Marchi<lucas.demarchi@intel.com>
>
> Reviewed-by: Rodrigo Vivi<rodrigo.vivi@intel.com>
> Signed-off-by: Aravind Iddamsetty<aravind.iddamsetty@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt.c | 31 +++++++++++++++++++++----------
>   drivers/gpu/drm/xe/xe_gt.h |  1 +
>   2 files changed, 22 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index cfa5da900461..59f497d575ad 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -629,6 +629,26 @@ static int do_gt_restart(struct xe_gt *gt)
>   	return 0;
>   }
>   
> +/* Idle the GT */
> +int xe_gt_idle(struct xe_gt *gt)
> +{
> +	int err;
> +
> +	xe_gt_sanitize(gt);
> +
> +	xe_uc_gucrc_disable(&gt->uc);
> +	xe_uc_stop_prepare(&gt->uc);
> +	xe_gt_pagefault_reset(gt);
> +
> +	err = xe_uc_stop(&gt->uc);
> +	if (err)
> +		return err;
> +
> +	xe_gt_tlb_invalidation_reset(gt);
> +
> +	return err;
> +}
> +
>   static int gt_reset(struct xe_gt *gt)
>   {
>   	int err;
> @@ -645,21 +665,12 @@ static int gt_reset(struct xe_gt *gt)
>   	}
>   
>   	xe_pm_runtime_get(gt_to_xe(gt));
> -	xe_gt_sanitize(gt);
>   
>   	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>   	if (err)
>   		goto err_msg;
>   
> -	xe_uc_gucrc_disable(&gt->uc);
> -	xe_uc_stop_prepare(&gt->uc);
> -	xe_gt_pagefault_reset(gt);
> -
> -	err = xe_uc_stop(&gt->uc);
> -	if (err)
> -		goto err_out;
> -
> -	xe_gt_tlb_invalidation_reset(gt);
> +	xe_gt_idle(gt);


Either address the return error or modify the function to be void, given 
that it appears xe_uc_stop does not return anything aside from 0.

>   
>   	err = do_gt_reset(gt);
>   	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index ed6ea8057e35..d62af1725ff6 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -43,6 +43,7 @@ int xe_gt_resume(struct xe_gt *gt);
>   void xe_gt_reset_async(struct xe_gt *gt);
>   void xe_gt_sanitize(struct xe_gt *gt);
>   void xe_gt_remove(struct xe_gt *gt);
> +int xe_gt_idle(struct xe_gt *gt);
>   
>   /**
>    * xe_gt_any_hw_engine_by_reset_domain - scan the list of engines and return the
--------------MxEkdLBiB0m7v0NRC2riRc9n
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 17-04-2024 14:11, Aravind Iddamsetty
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240417084145.242480-4-aravind.iddamsetty@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">This would be used in other places outside of gt_reset path.

Cc: Lucas De Marchi <a class="moz-txt-link-rfc2396E" href="mailto:lucas.demarchi@intel.com">&lt;lucas.demarchi@intel.com&gt;</a>

Reviewed-by: Rodrigo Vivi <a class="moz-txt-link-rfc2396E" href="mailto:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>
Signed-off-by: Aravind Iddamsetty <a class="moz-txt-link-rfc2396E" href="mailto:aravind.iddamsetty@linux.intel.com">&lt;aravind.iddamsetty@linux.intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_gt.c | 31 +++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_gt.h |  1 +
 2 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index cfa5da900461..59f497d575ad 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -629,6 +629,26 @@ static int do_gt_restart(struct xe_gt *gt)
 	return 0;
 }
 
+/* Idle the GT */
+int xe_gt_idle(struct xe_gt *gt)
+{
+	int err;
+
+	xe_gt_sanitize(gt);
+
+	xe_uc_gucrc_disable(&amp;gt-&gt;uc);
+	xe_uc_stop_prepare(&amp;gt-&gt;uc);
+	xe_gt_pagefault_reset(gt);
+
+	err = xe_uc_stop(&amp;gt-&gt;uc);
+	if (err)
+		return err;
+
+	xe_gt_tlb_invalidation_reset(gt);
+
+	return err;
+}
+
 static int gt_reset(struct xe_gt *gt)
 {
 	int err;
@@ -645,21 +665,12 @@ static int gt_reset(struct xe_gt *gt)
 	}
 
 	xe_pm_runtime_get(gt_to_xe(gt));
-	xe_gt_sanitize(gt);
 
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (err)
 		goto err_msg;
 
-	xe_uc_gucrc_disable(&amp;gt-&gt;uc);
-	xe_uc_stop_prepare(&amp;gt-&gt;uc);
-	xe_gt_pagefault_reset(gt);
-
-	err = xe_uc_stop(&amp;gt-&gt;uc);
-	if (err)
-		goto err_out;
-
-	xe_gt_tlb_invalidation_reset(gt);
+	xe_gt_idle(gt);</pre>
    </blockquote>
    <p><br>
    </p>
    <p><span style="color: rgb(13, 13, 13); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Either address the return error or modify the function to be void, given that it appears xe_uc_stop does not return anything aside from 0.</span></p>
    <p><span style="color: rgb(13, 13, 13); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">
</span></p>
    <blockquote type="cite" cite="mid:20240417084145.242480-4-aravind.iddamsetty@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">
 
 	err = do_gt_reset(gt);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index ed6ea8057e35..d62af1725ff6 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -43,6 +43,7 @@ int xe_gt_resume(struct xe_gt *gt);
 void xe_gt_reset_async(struct xe_gt *gt);
 void xe_gt_sanitize(struct xe_gt *gt);
 void xe_gt_remove(struct xe_gt *gt);
+int xe_gt_idle(struct xe_gt *gt);
 
 /**
  * xe_gt_any_hw_engine_by_reset_domain - scan the list of engines and return the
</pre>
    </blockquote>
  </body>
</html>

--------------MxEkdLBiB0m7v0NRC2riRc9n--
