Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949FCC53200
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jul 2026 06:04:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE1B10E449;
	Wed, 29 Jul 2026 06:04:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sey7RZTV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3748310E449
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jul 2026 06:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785305062; x=1816841062;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=rDA1Qdk85/uG5RVreCmBZQhx3hx0XW1LTMTFrSR0Dr0=;
 b=Sey7RZTVFZwEi4lZEPEHjs/i3gqf9W0FcQFxgM+qBYOAoRfxcPHPWGEc
 pLcKbbLF283HsUeB7n9F6od+eroemcwlal2DQtVrpDE0ZcIiBumuIWfSZ
 ZcfFTIrvfWjhQbZ1w8d6aWNkBg1gYFAp2KJ0CwpkgnpzBSl2qpb9Pfc4b
 D21swIwpFqg2g51rr4RwSokRXR/btm0lsX93/GXKXEuHAG2TTyOp4E+I/
 4rpJjF7XwgidYwfG2M+121CBe28TQe0lsYQVxyXojq66BsSko1tzTgJ2U
 WaA+LT6Mcg3ubFHCPCPJcQ5/CKJ6e+f9JtUJoVEMYOd4ev0Qloql6R3a7 Q==;
X-CSE-ConnectionGUID: b5xV7Vw4SAOxWdFnDBRCdw==
X-CSE-MsgGUID: VF7CfeDSSLyde4gHbzT2Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103442092"
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; d="scan'208";a="103442092"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 23:04:16 -0700
X-CSE-ConnectionGUID: XVz2UuwqT2Oh2shd2vbOvA==
X-CSE-MsgGUID: dlNSJBHAQx+GskzlrM/WFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; d="scan'208";a="284459128"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 23:04:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 28 Jul 2026 23:04:14 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 28 Jul 2026 23:04:14 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.63) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 28 Jul 2026 23:03:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NwELPS82+bJOuEBOftYApNNqtmf4WHNRHoJVxQRjizTK76im/2suniG8xmUHAic9S0XmKXePonQagdP6LBvX5EuEQafeievzQ1+AhGVr7BPg3/GE24v1uHV702sAHIyEGjMoCo7tczXoKENIOORhUJOzXyOtCZtMar+A5MAgYc4Pp8Ckl4UCbq//DCbmebyGg96hcd7XeusbwmEpASFewzKkHMDVT1GLBaXkaSi+98L6c7EE0rp62EngxVIac3WiWQxMRaPj4xuqtDMXkgMr/HYnmV+FRvqrtRXkS+3MXD4TqCNxUNyMOFbDWmfiSdS44H6ZIKC+QoU+zOj3wKCYBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a8gn//tfi6mHNRsVPA0T/qn3u9aN9nh3gKV/4DjnEF4=;
 b=AUneVMNHiN0e0qqhN97c/rzWaHnclj6eKSiFvCxNOkETQcK4ORZkmZeE3nZ4RExC6M4ghsXvQHllzP6BxL/P+mZtLVdxbjVdiKLLZn1oVCqovYtmpb9xJMiM5vIE8+5koEofF3cJVVTMKHNm+nUSzCy05wYpnRp1qSi8i1kh42Yx63yVXWCgWqjVhEs1e7bZpwpcvoU/OEkHPJUKwx3Cog8Eu63DJtKzGhvYLNfPRMsn+8POCxO/tS2fisBPlaU0sj2B9J8y1pXZJPT4MW3QRgn5NnmqSWB6XVYj3xg7GMnol1MvL4HU/1JoCuvCFpC0m7De0eqe1VhMmxOsSqe7FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by CH3PR11MB616647.namprd11.prod.outlook.com (2603:10b6:610:365::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 06:03:26 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 06:03:26 +0000
Message-ID: <b924f990-c2bc-4b25-bc6e-0eae0a24d3db@intel.com>
Date: Wed, 29 Jul 2026 11:33:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/display: remove unnecessary includes
To: Jani Nikula <jani.nikula@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260728180053.624215-1-jani.nikula@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260728180053.624215-1-jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0144.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::16) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|CH3PR11MB616647:EE_
X-MS-Office365-Filtering-Correlation-Id: a2db2955-e133-454d-0e8c-08deed371abc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|22082099003|18002099003|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: JwCSWfcsuAE5tAgexMvN5V5aSbeOLAYrYiey7sREyUuvyOMC0rvwh7HrLqArVY3c20p+s8PXWzjln5onIxxgerElVYkIP4yjI3TbBZqqm99iCF7EDOaqha29yssXB5z0Gs2pQGs5C8OuhW5vosGaLCCA/kB953Sqzw5ctmEccbI9Dy7S5bm4vK+6Nl0teRJ1ycz4HIzl7yeMHDdIXQ6EMPbEqrXFZBr+8P2k38SHQkd6UcApwsnBpC0BeNn32N02lHx0O1Mjz+rG5Im4nQOwejPLsVHk2d0rPtyudI1MR2DeYYLsnRyB+rRo2EgVGl0/2Z/qPGzZDaGXlluPsEQbhpS2nQqs90ZfORwZShODODY0FbPJOKSMN1cED1SAWCJmFUILZ8iXhc1evBMoGpHJ07KqSrDH2vVQSEREVrNFGctSna2BqwLUNbVgRb80Q/+x1BusIpodNzSOOzUh99hLMcUV3MaUTSd/Z4lPX2ku0sS6Jb1j9dgnYfzhIOtddEjdnUwpVdjaMb3biSDH3/Iyb9imTSE7aELn+c9tc5beQMEKuRwBa2nd1uzUIbF3cahioVb/mgw5wbUGwdIj/bCxUbatEjvQ9Yg3cTpyL67EjzwBQlo+HY492Lhm1RK6xyZgvqxXdhpa3DR3L7mEuYl19jB93kb5wSJT5TjN07rPOvI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(22082099003)(18002099003)(11063799006)(10067099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTI1OC9WRndHSWZYS3dQOWtlb0ZzUkVNLys1aGIvdEl4a0s2S1JnZnZJSFZz?=
 =?utf-8?B?NWFPVm5WNktadTFxNFFPNXRHZVNlUzBnNEwxclpNdEUwZG9MckxkaENTRjBL?=
 =?utf-8?B?RDNKREhsYnlCTzB6M3dZaG10bitWaDdrU3ZSZnlINjEyRGF4d09xRkdwUVlN?=
 =?utf-8?B?N1lmaWVYQ043T1N4Uk5JY0UrUEpDRENoRVZNdWQ5cm51T1ZLWTVUWXN6dC9M?=
 =?utf-8?B?c3B1QVRuUUxYNHhpd293eXNLaHpPV3UwcjZpK3ZpTCtORFhacFlRRGJIRjRp?=
 =?utf-8?B?N3ExS1VtRHpUUnNzQ3kxdFc5THE3S0tJVE5GVzZnR2tvaHNuWUVpeDViZWp5?=
 =?utf-8?B?Rjl4L0pPU3dYb3ZGcEc3SkRvcHFZYk8wbVBwWDQ0aDBON3ZzNFlDK2QvcWlF?=
 =?utf-8?B?RFkvdmFqWGpCNXFnWVpad2o2NlI1SHNydDUwV1U5TDNBWjBiQVNhVXpJbXB5?=
 =?utf-8?B?SlBuNEc5eHEyR2wyWHRaek96NzRGQWZpcElvRjhPUzdiQXp3SkJZY0dTWUgz?=
 =?utf-8?B?R1QwSDRjSlFKQ0JMN3c1czBxQUhsbC9kMDhOdEE3QW1vOHBOY3U4T3FWWmpo?=
 =?utf-8?B?c1lRcXNxMndUYW8xZEpoWE5LOGlEV3R1UExZQ1pFSDJpY2J3NTVHbzY0T1NS?=
 =?utf-8?B?Y0FmMkZpVElvVzQ0TmpjUjVjeUhhWE4xcElHQmc4S205dlFJSFRqVDNCQmFP?=
 =?utf-8?B?SG1MZ1RqZUNLSjB6VkI5b0lMWWc2MnYrM1ZmSVhPeWxBL1hocjIrZzhIYjFC?=
 =?utf-8?B?SFJYYmZSWkIyNUpBZmtaRjBrOTNLMXEyM2VIc1F0aUdDTHlDS0Jad2tyNW9u?=
 =?utf-8?B?YnFOTERIbTd2dXg1ZW5SME56eTBUdkdxQnNrYjEwWjgzU01EdEtZVnZHbU9i?=
 =?utf-8?B?UEpMcG9qTjNkSzNjcjZZUnpEZzlwWWVYL1FiMis3NEJHdlVMcURkR1V5T1BW?=
 =?utf-8?B?SFE5U0loTjBFNHczdHlwL0U1U0l2NnNWaUtxVHVzNnpxUnM0aWlobWRPNDQ2?=
 =?utf-8?B?SFZIdkZiZk4vYTA2cTJpZXJMY3ZBalNRYXN0MndOMTdRUStsV0pYZloxcjZZ?=
 =?utf-8?B?cy8yNS85dWdtSHJ5VHROZ1R0L3F3SzhqS1RyUFpGck5mYVA5cU1UUDQwdjYr?=
 =?utf-8?B?bTlNZnBLL0ZhWE9IV25GcHFpSzlyczRUSEl5dDhibnJNcmttSVVOR1c4dkRO?=
 =?utf-8?B?SWZLZHdLNDJzSmc5VGdkY1hTaEs5OG1zOTcwTmZ5ZEFjQkg4YVFvWEd1TW5B?=
 =?utf-8?B?ZkdPbnRWZVd2bFRZbERjeElqNzlCTGpUMmpNejB0SkJIRVZSWEVqcG1DYnJH?=
 =?utf-8?B?VkI2cjZQaUtpSTZKL0RqWlVNMWJodjVLT0FVL2wwSkN4a28zL1QzaDFVOEZ3?=
 =?utf-8?B?T1V4Vmd1T0d1V3liRU42cHVEV0hwbFFsMU1mK0QwQUUyc0JoZm4xYU42UEtV?=
 =?utf-8?B?Q2wxQiszejc5cWFuUGNjY1JIdXFPRGp0VFpVMUtXa3kzT0xJakRmdnJmbjY1?=
 =?utf-8?B?ZmgzQ0wyanU5UWdHNTVnUTRraEFZazJBN0JuN21qeW1Ocko3YXVLejZBTVR3?=
 =?utf-8?B?MUx3cnBQMmdsTmxMTVhuRmQvVG4wdVFKdjVHQjkyWE04SzlUUlhtY21scGRY?=
 =?utf-8?B?UDRCZGFyTmVVOFNaMlJUL1pycHltZWxNdzJORExET3lLbDlMQ0ZaWlRCWkMx?=
 =?utf-8?B?aXJwTjhwbUVjaHNyOWJ5TEtRSVRxdndXdGxvL2duU2hQS25WbmovdVRTb0lp?=
 =?utf-8?B?aitSL2M5RUlpeDFFRHhqZUVlRlFwWmFJY2VaMkNEd2FweE1LWXlBZlhXYVZ3?=
 =?utf-8?B?QVdJWXdLSjlwS0VCNXkzeURONG0vR2JhQzVUWVdHb3lOQmh5T29WRHp5STlR?=
 =?utf-8?B?WXNzQXdiWStGdnVoM0pDVWMxSTlISXhqNG5LL2huMzVJeTA0Unl6NC9xOFlS?=
 =?utf-8?B?dnFqOFNOLzRkcjNBUlhVcnZuM29uaFhobFBZcXdtQWh6OFlKb1VSRHozMHlE?=
 =?utf-8?B?MGxIdEhaaWdaQXg2Sk80R3ZQMFdPQ3pvVERrNkUvNFBSS0pEOFlwMVVNQWF0?=
 =?utf-8?B?UFg2SXBySUVJS2lqZTI3NEF1YVJOSmRIRXczMFdKT1orVVQrR0lHdnZtUFNR?=
 =?utf-8?B?V2NzLytMbVJrK3dlL3loNzJZMks0TXBRd2YxWFFOMkhOamR0RWpPSHJDTlhy?=
 =?utf-8?B?ZytZMmNyTFFGbnUxRFVNWmt1Qlp4VGFreHkvZTB6U3lzbHgwU3phSmQ0ZVB5?=
 =?utf-8?B?TUU1Wm4rcFl1U09TYUtaTFhEOXF2TlBKWU56Z0NObnFDK0lnVWp4dVYyc3BY?=
 =?utf-8?B?YW90NW0xcllhYmo4QjE0YkpxU2h1VkJGMlp5NDF0VE9Yb2ZVVWN2WFh2M1lV?=
 =?utf-8?Q?JtSbPNR3z8NxbOZs=3D?=
X-Exchange-RoutingPolicyChecked: lqMB8AKNblnlA537FHw/W0iDJn+UrvVmVLcLeWPqMy22lvbVvCjO93Npk4xbXqQIzwCv5DuU6oygZ6/S923QqLA5lj5vjHU3WLtPu2LtM04XoN2Icm7oR5cVQ1f+80JRL8zVxE08u/XhKv4V5GXY/1xhNxFyrn1caYcYQyRb7R9qZLtshCbAaeVo+96pP89WiUIiP3vz8dCYmPpZHu7imUjX+suweUlBhAtvWrb9NWogb1WT0o4GeOcMGqb3/4K0GaCKlA3gQGvijbmNl6k6yXsko89lJndrthYmqemp48iYK4MbpavZ1jiVGdpdoCV36hJhkLhmzDYPD51TUrYD0A==
X-MS-Exchange-CrossTenant-Network-Message-Id: a2db2955-e133-454d-0e8c-08deed371abc
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 06:03:26.3948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OjvXcpQFUNllAxtC4mRti+tGpwYTzu/SVzzAmAjwq17+s7UQKF+fIp4Hus8cc+kTzZOMZi7fed+uz7S02EwnTE2E+lG/kEgPeWzStDrJ/Q0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB616647
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



On 7/28/2026 11:30 PM, Jani Nikula wrote:
> xe_display_rpm.c no longer needs the display includes, remove them.
> 

LGTM,

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/xe/display/xe_display_rpm.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_display_rpm.c b/drivers/gpu/drm/xe/display/xe_display_rpm.c
> index b3db40035499..548b503aa024 100644
> --- a/drivers/gpu/drm/xe/display/xe_display_rpm.c
> +++ b/drivers/gpu/drm/xe/display/xe_display_rpm.c
> @@ -3,8 +3,6 @@
>   
>   #include <drm/intel/display_parent_interface.h>
>   
> -#include "intel_display_core.h"
> -#include "intel_display_rpm.h"
>   #include "xe_device.h"
>   #include "xe_device_types.h"
>   #include "xe_pm.h"

