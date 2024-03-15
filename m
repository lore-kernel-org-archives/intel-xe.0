Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C45C54E67
	for <intel-xe@archiver.kernel.org>; Fri, 15 Mar 2024 11:16:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1492011218C;
	Fri, 15 Mar 2024 11:16:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hCLwbIbH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F11911218E
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Mar 2024 11:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710501385; x=1742037385;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=s9CC9CRcGCLhnCnc29MG5NNq3T7piMR7pqhWnHHnKi8=;
 b=hCLwbIbHQhYnwT13rl425qQBkwMVmHVsnf9HRkhhObqz69JMpQHYEElN
 V7Kic98E4XUtyT/TbJSF+u0ERi15gwwSJ5ivnN0mXdvdEH4A5aSKWMPI4
 68FbjNS5uEi4AjGFRs3JcQawzys8rGQSa2XFOB6I0obvWKQezE09iUuqf
 AXaDqhAfHM7bzDA13i96qD0yJjMayqvNnUsRWGyTHpeu6KkbqkIhkmzAZ
 oTUOPjitCk73BqezTYGYBoZKnw3Nz0i7x4XI97IHeEfDkzF4wHgiWYBKk
 6gtir2OCMWEoaJ1be8aa9NnnYHFbv2va+bgyIP5vGReTDAj0EUwEr7l/Z w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5497336"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="5497336"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 04:16:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208";a="12697712"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Mar 2024 04:16:24 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Mar 2024 04:16:23 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Mar 2024 04:16:23 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Mar 2024 04:16:23 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Mar 2024 04:16:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hx52L5lVgeSg7e17+/4D3pplRWfrForeiiT7BjOvt2MZ6aH2tB72V0Ss9ugYUXjhaEXgy3DqMbs7yYMsJFpLmUCTG/dY9oym1Gr3ek1NjT/odiYQ/8lj9e2u3hmvqs/p7oiUYvregv1fQgEaP2ci9EMHSIckkQjBUAHNgC5yiJFAebFLz4iOq+YPR1F28QaFUNYgGMwQUSOKMreMqUSK4iV1dw4sZhnmBo4Hv3pgTA5+qZZ+317Nvzq0iiWZLMb8z2H2Q4EcoHouRrODRQrw9d47RJtziBy1SLLpQqY/SXeEwReHtIu8inLK4/akYsnS5yOJI4CmNvPoRdjghunXTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bdtcNFWB604wy+9GEucK7i8gCgtHait5zei08uDOw7I=;
 b=JvXiXpE9JBBhyW6Xpf+zypuw54M0V6+UN+salK8jcS9XZ+CwK10Z8Bz0WHr4cQT/yKYn1XPiVjUpUXLGIrJZmhwnCynBbsb+GwefT4tej/rybnSAgn/tKFQoG5jR7ymNBx0LCQaeuowEoffYxT/Bwsvun85DbB0ieCfzjg5tAEeKL6RqtPy9il2tYiDQnUvBcug9vx5p4qFiLziLPfkmuO4uRgXv8oEbwVMhwXBKdRKCCz8T8o18NSzxkMf0iOT9PoxNyXBLdVr+IoM6KO03b+jgAQxzO2u8MjKW6iQGIAvTG4IrU4fsMvIheLDaLg/doVhO+S8t20EAKj3c0kIxNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH7PR11MB8552.namprd11.prod.outlook.com (2603:10b6:510:2fe::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.23; Fri, 15 Mar
 2024 11:16:21 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a%7]) with mapi id 15.20.7386.017; Fri, 15 Mar 2024
 11:16:21 +0000
Message-ID: <6961d753-007f-48ad-b70d-1add093ae61a@intel.com>
Date: Fri, 15 Mar 2024 16:46:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe: declare busted upon GuC load failure
Content-Language: en-US
To: <intel-xe@lists.freedesktop.org>
References: <20240315010317.193756-1-rodrigo.vivi@intel.com>
 <20240315010317.193756-2-rodrigo.vivi@intel.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240315010317.193756-2-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0246.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:21a::16) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|PH7PR11MB8552:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a8d599c-9ce5-46e5-9c29-08dc44e157e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kKRdjKPiaysNZQ5Sx/wMxOZAtu/oSn4GxaVGpMSND+QPvEPWgttUYBZ7Vl+HJefbVKUnFt7ftaMv1uT+ia3AVtQy/g+suioigrhOkkCI41CyqaUO1FoRwn3xFfRUtAvZVIHNQ8IT0zt8jxz1kfWirjE+Spnu+gF+0+Vr/uNSaIGvCfavYrDpI4DCniW1da0+OPUUEzn8ddIKsfx1Nrnczh7qhqq8FmAxfgCeaROX12nuMaKSJLiGPipZV6+E5b/8dEWbcnAL18lvfPSTWLDMbwZHg48JjGhO/orngNgFIQSju0IvOSHevkqkfbVJY8+KTwHDt12hWDFmnHWqhF5mhnsNvPyzJPkwBou+tKkhrfw8vL0NVzisd9MHbc/vZvfsTL4R4YroN5NUV0G2hhKmHsiRVtU3tmilVx+EDquircN+st1YKAXVpDriVD3z4xPmVvr+DhJM2SrRywE51Qfs2qP2Ojk0b8lC7Zkgc5yWHAl5uwUtJ7rbbLnHQl5mo3sVMnjLP6siXA4jzmQCyHb4mx7Zl/ngDQHDm2VyuwGFSYciSniOa9e1teDBQDZKmlr5qowOREhItJSqcr44li9Go+b+TSvygn35PFTtAiQq39SoL9xDPXafJsIaDVFcB41AzBHs59PMV082uBx1PFoPEG1+Qn3ZrttH2+s3tXZomk8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlhGRXFRTzRTVnNydDh4S1N4YTdYbThLVGNDdTlqdzZieEg0MGFzMzNjNmRH?=
 =?utf-8?B?YmhWcDQ5VVNqRzhVYm02dWdvTmNjeU9VMllMMXhPNFYvTFA0aHQrejQ4SjBv?=
 =?utf-8?B?QkdQUm1OTnZ4eHFHSDJaMUZOVVo0Wnova0txY3U3VXVablN3RFRkT0gxNDZ0?=
 =?utf-8?B?d1p4OW51QlQzQ3J3ZUg4VXl1S2RGQThWbTBwanFqWFkyZnZycXk4SlVsY0xa?=
 =?utf-8?B?NWt0NjFEclVMenA4bGdPSDhaS2QrR2hQcXdEcnlaS1ljanl3SFdSY0dpcllR?=
 =?utf-8?B?ZW5BUXN6WC9iY0JsVk5Sb28ra1YwZzY5WlJWdzhjOGw5ZFEzczhMcTR0WmUz?=
 =?utf-8?B?WlhwVzN6WVhtN09Tc01BL3FNYmNZdlNvZWVTL2dzUVh5RExXanFQZ2RqNk1Z?=
 =?utf-8?B?ZmxPeHNQbWVsRnJWc0FEQzl2MFQ4Si9WWjBXakJoQTd3Vm1Ib2UyRVA1bVdM?=
 =?utf-8?B?SUhFYUhtNVVNRVZEUjl5STNNdHVIS1pLNnJRNDgwa0tET011bnBDS1JyZmQ1?=
 =?utf-8?B?TTh1aFJ3LzdIc2VYTnYvb3dZZHpmOFJENVBlVjZCZ0tHcktYN29za0sxSG5L?=
 =?utf-8?B?YlZCRW9MeW5LbE5SODVBZ3RHenh0K3MvMUhrWm1SVkFPSEJ2RmFDOWM5Wk5v?=
 =?utf-8?B?SW9ncUVZWjNvS3dqS3ZTWW5RazFPV0VzdCtMZzFrSEEvK3FFYWZwd1NxdGk1?=
 =?utf-8?B?MHdjR2dSbnQ2NlFSb1k3WXJzS1N4a21ScGdVRzA1a0tNZGhzaktaYnoraVQ2?=
 =?utf-8?B?aVhlTGhiZjBpVGxUR3lCNFZlM3ZIYk1zTkNodjVPelhWbjZIRDhPVnpSMk9r?=
 =?utf-8?B?dnBYL1p6bDFMTVR1Y2h2RmtNbHg1ZVVGZ1Vwbmt4bVJJR3ZUQ0VaOHFTaHJX?=
 =?utf-8?B?UG80V0p6MnZjMytCdEVMVmFPcy9pb2tyYksrZG9SOGtLR09hNnpMZE5LRzNG?=
 =?utf-8?B?MUlPQldGM3dTQksyMGNGbHg2SWJKL3ZEdmtObTVpMFBLaktoN1Q5MFlKWFpO?=
 =?utf-8?B?aFJuSE9qSHpsS0kwektYNnlCd1gzK2wwR2hnWXdSeDA1VFFqUW1YNEt5RGky?=
 =?utf-8?B?YkRxSVlUbHlNRmFaeGpDY0RUUDQyaUM5eFprME9BaEIrZ28vdDdxZElyc1Fu?=
 =?utf-8?B?eHR3aE5qRHJ1OC9XYy9SYzlwYmxtSTNlM09YK1dpeDZZYlNDQUdQeFJxaS9k?=
 =?utf-8?B?RjFsSG1BQllueVM5WGwxY2RTT1Z0S0RpbHpLNGJGR1oxMG1TQzRPTHRXeVBO?=
 =?utf-8?B?cUkvZW1Eb3c5ek5BeTIwR3VZVkVMQy9BaCs3L0tvWkFzblFnUDU4eUVUOEJi?=
 =?utf-8?B?WGlVZ3dkb1k5YklIZldCOVo0Q093UWNYbXU0d0dyMXgyOWg1TDJzdi9vbEY1?=
 =?utf-8?B?MmRWekd0aTdoeWY1VmRTT3RMOGIzZFJBQzVrcWdvc0pGZ09ZTisyVWErY2Jj?=
 =?utf-8?B?YTZZQUErRmc4T090cUUreWFiM2oyYjJ5V0NHRmR3eHdqU3Jya1BvS1puWVJQ?=
 =?utf-8?B?Z3NZM1ZKSWxNZEIrbHpTNjFBY0d6YllrdDd5M2w3aTJ5N29uUEZiUmI0ZmFO?=
 =?utf-8?B?NzRQUURINEZwUGEvRThVVXZ3RytHaWRzdFdLQXV6TkFhYmUrZzJqcTNKYnpG?=
 =?utf-8?B?WGU5WmorL0xQTHFYYVVmd0gzZnJhZnQzbjBuL3VwLzJET2p5V1NrYnltZjJp?=
 =?utf-8?B?aFcrRjY5eEp6WU13RU1qMVBDTzNFQ0lzNWszWUgzVnMvS1RySTBKd2szR1RE?=
 =?utf-8?B?SHU4dldJdkZGdGczMGIyUm5wVmFHNnBZZEV2Z1lXVEJBZzlaUFhPSnRnMm9s?=
 =?utf-8?B?dEhoYW1uOGZ1dktUTmg1WVdKWWhqVE55OGs3TUdGMWlzdzJwTlRjVUVDTDNS?=
 =?utf-8?B?Z3VLV2pabGRUNVlieEtlV3kvRjJBRHlnWFhaSW5XWGNmT0Voc2RtM3Uwem5t?=
 =?utf-8?B?SzdERTQwbng0MmJYcXg5WXlFejY3cjJxc3dpRlNDS1p4L1J1WldqMkFiM2JR?=
 =?utf-8?B?d0EwblVBOURWVnZJa0FDb1dxa1JJMXFEY3Q4d3dOZ09WTk5jT2wwYzF0VHZ3?=
 =?utf-8?B?cmcwWVgzT2hHV0tmMFYxcFlOWHFiVzgrTjUyamtoU1FmKy9ZeGo3OXRvd2N0?=
 =?utf-8?B?VjNPNjlqSHhDam9acHB2UVpKNGxEYzd1MTNwVmgwbEZpNFVHeGs1ZGRFc0dC?=
 =?utf-8?B?dXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a8d599c-9ce5-46e5-9c29-08dc44e157e1
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 11:16:21.5401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B+EPLfUcKfnrRR4/40Ap2J5iLVKiU7hKNGNXKTrIwAQ/q8UFsjPp61KP4x2FixmK86C4w4LD7HiQsnI1hgpXJzQ21+KH5NChA43BYsNCwIA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8552
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


On 15-03-2024 06:33, Rodrigo Vivi wrote:
> Let's block the device upon any GuC load failure.
> But let's continue with the probe so guc logs can be read
> from the debugfs.
>
> v2: - s/wedged/busted
>      - do not block probe or we lose guc_logs in debugfs (Matt)
>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc.c | 41 ++++++++++++++++---------------------
>   1 file changed, 18 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index caa86ccbe9e7..85edaaa734a5 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -461,7 +461,7 @@ static int guc_xfer_rsa(struct xe_guc *guc)
>   	return 0;
>   }
>   
> -static int guc_wait_ucode(struct xe_guc *guc)
> +static void guc_wait_ucode(struct xe_guc *guc)
>   {
>   	struct xe_device *xe = guc_to_xe(guc);
>   	u32 status;
> @@ -491,31 +491,28 @@ static int guc_wait_ucode(struct xe_guc *guc)
>   	if (ret) {
>   		struct drm_device *drm = &xe->drm;
>   
> -		drm_info(drm, "GuC load failed: status = 0x%08X\n", status);
> -		drm_info(drm, "GuC load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
> -			 REG_FIELD_GET(GS_MIA_IN_RESET, status),
> -			 REG_FIELD_GET(GS_BOOTROM_MASK, status),
> -			 REG_FIELD_GET(GS_UKERNEL_MASK, status),
> -			 REG_FIELD_GET(GS_MIA_MASK, status),
> -			 REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
> -
> -		if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED) {
> -			drm_info(drm, "GuC firmware signature verification failed\n");
> -			ret = -ENOEXEC;
> -		}
> +		drm_err(drm, "GuC load failed: status = 0x%08X\n", status);
> +		drm_err(drm, "GuC load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
> +			REG_FIELD_GET(GS_MIA_IN_RESET, status),
> +			REG_FIELD_GET(GS_BOOTROM_MASK, status),
> +			REG_FIELD_GET(GS_UKERNEL_MASK, status),
> +			REG_FIELD_GET(GS_MIA_MASK, status),
> +			REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
> +
> +		if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED)
> +			drm_err(drm, "GuC firmware signature verification failed\n");
>   
>   		if (REG_FIELD_GET(GS_UKERNEL_MASK, status) ==
>   		    XE_GUC_LOAD_STATUS_EXCEPTION) {
> -			drm_info(drm, "GuC firmware exception. EIP: %#x\n",
> -				 xe_mmio_read32(guc_to_gt(guc),
> -						SOFT_SCRATCH(13)));
> -			ret = -ENXIO;
> +			drm_err(drm, "GuC firmware exception. EIP: %#x\n",
> +				xe_mmio_read32(guc_to_gt(guc),
> +					       SOFT_SCRATCH(13)));
>   		}
> +
> +		xe_device_declare_busted(xe);
>   	} else {
>   		drm_dbg(&xe->drm, "GuC successfully loaded");
>   	}
> -
> -	return ret;
>   }
>   
>   static int __xe_guc_upload(struct xe_guc *guc)
> @@ -545,16 +542,14 @@ static int __xe_guc_upload(struct xe_guc *guc)
>   		goto out;
>   
>   	/* Wait for authentication */
> -	ret = guc_wait_ucode(guc);
> -	if (ret)
> -		goto out;
> +	guc_wait_ucode(guc);
>   
>   	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_RUNNING);
>   	return 0;
>   
>   out:
>   	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOAD_FAIL);
> -	return 0	/* FIXME: ret, don't want to stop load currently */;

This label is used for other failures too apart from guc_wait_ucode.

Dont we want to ignore ret and return 0 those failures too ?


BR

Himal Ghimiray

> +	return ret;
>   }
>   
>   /**
