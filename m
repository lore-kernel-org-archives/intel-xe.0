Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0833FCD4F21
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 11:55:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3DAD10E5A0;
	Tue, 12 May 2026 11:55:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TaQtoSRt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B29410E07D
 for <intel-xe@lists.freedesktop.org>; Tue, 12 May 2026 11:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778586941; x=1810122941;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ssfo+/iDyXUDvUerkbtwYKb7/X7dXsvlhs9tmPEfo3g=;
 b=TaQtoSRtP1nNVZg54SmhvMe1fC5HH+Y7RCJTZCKVZ+wMxXpLsRSHQwnH
 YgWAaZMCWkaa0eI+iqXaIDKui75eWxDouNVNUrFs1+D/nvt9ZsITlqxHa
 3BUMx05emeOY7haM/AL7MgCYHRWr/qwQZL6254NzKh/dx08Kq1I35LOcw
 YQIXd1vI4hT8FBxEcXXxgyTKXmuNNnr9GsiuubS4J6Ryy/oZNn24eav+7
 0j8BT1I+KTDbyGMP1jP/gEroc5RSJ1rzF3qkDs1dqKmFcH7nDpYchRuSV
 kN2n5X6BiQ0qkuo1vr0MpXzlY/xJbXqLkIQToCSodwCvTttOiKQGICJBA g==;
X-CSE-ConnectionGUID: 35Pyp9OkQqeTwsn0xzI2GQ==
X-CSE-MsgGUID: GdNBy9w1RTCXm3XqEX+c3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="78639228"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="78639228"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 04:55:41 -0700
X-CSE-ConnectionGUID: BpnwEYCUS0m1XowCnizxnQ==
X-CSE-MsgGUID: WUBvOIKSTX6IP3dUrQDkKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="235083340"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 04:55:41 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 04:55:40 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 12 May 2026 04:55:40 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.50) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 04:55:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z0rxC4/mQUq6VSUrH+IVRaqHW5HisPK0TOCeofGuaWvxB2r7mImq/VUG8dsQVCetcZea6tbF5WQGlPlty0DRKz22HS2snuScnxNyNBMDxUQ/DmNGGtaBuVqgetgygQ+qMZ42G1NOf3FD9yCn3ePRT3YxFwfMK73xwvo7HBVdQGyI91Dsq/WQ2qLsTm0bM9Y88lX4NXJWqDv8PU6g2JYWU6B6oYC5Rpf7G7YLc9zrJU0H4dbuPefisf7+wzUJ83Ta5duCFAzDi1WL/syloYH37A1KlVNlmjX/dtUOUPZeTV0mwwo5BHmtTxujS2ur4fMg9hiHNfJGtgf4iIYXq7rUdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3SJC7VwxP/Wk8VfX8Y7M9RvMgLlAX3EOd0RXlorc4+Y=;
 b=VoA9OQ/7ngkA4l59PQVxuy6Jv7amshbBiHKUqVOKXtve2zNNaajDUlcBOnR5Ub8e2dnucqXJK894R82EOSQb8BnM23cfOBvx6klyYF0EvFECpPpLsvqZfPIeMWhWnHV7O3BB/++OlUfz8r93EcLDBtmhYO9tv1Tn773DieqJPbC3o7Tlg21mNq110141f4CknWA4h4RDdxguFbb8NQ2OayU2K6cS8nMgEObNXz38TGbG1fCylVKAwB2KUAFpsQQNavMJc+mdaKOEa2arkyEH3GY3sj7qBa0WRlHJKwIUY0ukkvKOYKDPTCbGDrwwAhL221D4uAu3iyZy79FkIb8/rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM3PPF1CFCD9AEC.namprd11.prod.outlook.com (2603:10b6:f:fc00::f11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 11:55:38 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.20.9891.020; Tue, 12 May 2026
 11:55:38 +0000
Message-ID: <37b6a12c-2d30-43ef-a4d8-2e73a9adac48@intel.com>
Date: Tue, 12 May 2026 13:55:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Check for dead config space on reading all 1s
To: Arun R Murthy <arun.r.murthy@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <lucas.demarchi@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
References: <20260512060128.209698-1-arun.r.murthy@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260512060128.209698-1-arun.r.murthy@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0293.eurprd07.prod.outlook.com
 (2603:10a6:800:130::21) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM3PPF1CFCD9AEC:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d5897c1-ed03-4b51-6534-08deb01d61c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info: du3VzzLt02AbLY7iQ3K9rc06OIPEtygU+ILRu5cEWqKPg1Dw17HYB3HdzDW03HOG4yEncltVeTccEcOyBYJKE0GDwmuMreE1iwptdYcTx8NkaHYZEMqS9wYfRy2xHBQ4oASHQ7QInueMm0jKNXqvUs4UpOgKXDD6E182Sm7Tnm7vyYnR8AsqwlWVMEy5owf1wlMuYEA94RXIFXCc6t9jecw5HinyxRshRh4iLJfu7YzDY0s0vF6jNrMzO8EOWAefOB4hM2e7t4lzUWTyk7n/dzyKffH7JmzmCLB6anK6LSwihv0UeFUx9Q6IwTA123mc+w28roU8F4jO66FSNPDKpqWp8hnlwRli4BonSNXvHmMcSHBGBG4GasNs9wBKrUpoGC3a7ZU2YgGIOBCmVYUKJIDAR99DECdMEgsNLYNbTB+rUsRjeC+I7dyt5n5mnB3QiV50JYPblBVg6vLoh8R+CVajJ0wT0RJzMXWSMYVLju0V2clYL8gSZXvjkE/DXJqHcPOzjLB5GS0f1vVuTWoW5LwgVvx9O04AvOncZ+ldbQBoPN9/Lz3lDNJFzxQ/fNST4mBqnfhIH8dEwd5LeltGO+cxfUawdxx/Ln616WqX7a9igeMS85GwwRvjMtW3tzPX6GbC/BTuJJmPuiIOTuUojw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDA2ckpvZFN2WC9BOFlKazdRa1BGaFRDbnpzZTJ2Syt5RXE1SHBaeVVoQ1h6?=
 =?utf-8?B?WFhoM0gxc3BCRnk1aGNCc3JkLzl1K1F2NFJRUXdIQ0t2bTRKc3lNV3V1WUp0?=
 =?utf-8?B?UDNuTHFNQ3V6STkzUUZhWkhweGh4V1pNTFdhSjJaVzVYR09zVWRLR2FEeG1q?=
 =?utf-8?B?Zk5zVTVJT291Ri81Q0czbzR3VWdHc201Z2JSVUI4TkdEbzdqcG5PYTF5ZDZO?=
 =?utf-8?B?d0xWMm8wZ0VlTXhxb1Y3d01Id0ZvbXVhSWxUMzZqQ1JEeXFFY3BQd0xKSzVq?=
 =?utf-8?B?RlRUUEtKUHU4VWRmTlFEMGhIaHJ1MysraXBrVXpHOXVKcEh6TTlzRmRmZkpw?=
 =?utf-8?B?eDdtNXZDWm4rMzNIcThhMFY3U3NlSFRhMXVnTkVCQ2lBeHRRdVdrc1lzQ2FI?=
 =?utf-8?B?bGltS2Y4bXcwd2Ezc3ZldzJ2Z0p1M1Y1ZjlhdjlsZTcyd2VISG1LamM0ZVA4?=
 =?utf-8?B?TDVwRU40QUJ5OXNzZHcrY280UUpiNmtxa2pPOFlVWndXeDlVaEVka3poUWtn?=
 =?utf-8?B?THBDNXJTQWVYOGhRNGR5Z2Nla1Z0clpFVFBoTHlEc05hcG9rNDlKeEtkUzI2?=
 =?utf-8?B?NkFubTd6VUVJVkVKamtvTnI4TnNxWTJ4VXBEbmhleWx3NTdFaTFnNVdHSm85?=
 =?utf-8?B?Ynk3QWtLVTZQSjJCM2hMQVVhdzhRUmZuaFlnbkhuSHBYOXNOUGRrWTIvemZp?=
 =?utf-8?B?aWQ4ZWR2QUhxL2M5M0NkTFZsZkVNMnZ5cjhvU0VTNzBrMHhrYm5Uc0IyanFE?=
 =?utf-8?B?OE5lR1hmbzhZbktzTU1KZG1HeGhZc3Bnd3Nhb1BPaTZwbTdTOGtJWHNNQ2w1?=
 =?utf-8?B?Sk1uQTRiZy9ZWUlrTjd0YnlXdlVNL2JJNjZHMVV1V2FKdkJnSlpwWGpQWWlZ?=
 =?utf-8?B?eVNCMTd3ZlladzJGS0JaOEVFcE1RZzNvclpXYmowNnBSTTBIc05pNE1EQlZY?=
 =?utf-8?B?Q0FIYzF5M2M0ODI3OUN4N0VnWHRIdTNtdzVZY2NqUGxKTHZOZFpxaG11Ym5R?=
 =?utf-8?B?VEhUNHdEeFhhQ2FUSUs1MmpPbXo5Wm9wVFlUMFVGdVNtZ1JvYnJ3b1F6R2hp?=
 =?utf-8?B?SVJRYkc5WGZ0Tkd6dTRFa2ZaZ0YweWJGZjB2N1lrSnY0WnAxajVTWkxXZE9y?=
 =?utf-8?B?VHFGR2Jwd1JmRlFqaGZ0ZnJzWE52MmdGblFmOC9LeHdYTm4wTGpycUJuUWt1?=
 =?utf-8?B?clpxejVEVkFTOUVlUHZwL0JaTG4zaFVZS3hwSU15US9uSXN6elUxVTJ5cWxM?=
 =?utf-8?B?ODJRYUlNUzQ2WUViZVo0aFVva0hCNy82clNFeWphZE9GY1hXTC83WmRaVmpN?=
 =?utf-8?B?SzVvOTNDbmEyTU9jN0pmencvU3NHS3BlOVRtZExrVW9BN3dESFc0MWtYc2Ey?=
 =?utf-8?B?by91L2FnSTcyemxLQkJST0NkVVNUVlQyaHNBV255Y1Y5Q2hhT3JlQzBTRnVD?=
 =?utf-8?B?ck5yMU8zcXhyc0cvcXBOWmVDZzhmK3JOZHNIdUFCOTM2UGxrZVdHWGlQQU5S?=
 =?utf-8?B?RVlnOWFrYTU3TmdwdC96YlN5d2tJaWc0YUZTZzc1SVplSG1tY05IcHpadVAv?=
 =?utf-8?B?M2hXclh2SmRybmxZUTNxNU1kLzI1T3NmajdsSWpndEM1RytsMng0dXJwOUU0?=
 =?utf-8?B?TnBhbUNyUE1BY3dZQU5kSWZGdFdaUVh1K3phWW1odTJhbEtpZ1ppS28zb1hl?=
 =?utf-8?B?WUswMXpWdDNFcDQwajhiUE5xcC9mYmhRK2J0NnJ5eEpPMkVyTGpwQ1ZuZXZP?=
 =?utf-8?B?cHlnT3pvRVpudmRZWThxZzFTRTIrQXl4ZkVHMG1IYmc1RWRlWTJDdWd6WmRT?=
 =?utf-8?B?a1VTY2huYnFVN0Z4Q3hEcW1hZDZKLzh1c2cvaDZ5MjJFcUx1aC82QjFtbTV1?=
 =?utf-8?B?L0dLK1Roa3NzQnd4bmpGdVpuUnJjd1RJckZvcnYwdFZDckhna0l4cWJtRUh2?=
 =?utf-8?B?TktrRzhCTkNNaFBhd0JqeG84M2ttWHBMQ3dML3h4K3RGZThxd2dNTHhsM0Rl?=
 =?utf-8?B?WE1ZaUFIb0pRZ0dnK1RiSHR6UWtiTGFNbkR3MDBUUkZEb2tsdnNROWNTQVZa?=
 =?utf-8?B?bzRIdHVTR1lZZXZycS90amY0c25vNWJ5QlVpdFh3eUZudnRPTWorSnpjUGF2?=
 =?utf-8?B?ZWIyczhtMVFncDByblRITGMxTFVURGVmR0VDemRnL2gyNVcwVE43emY0MnpJ?=
 =?utf-8?B?RnRKdHB4MkZhMGd2UW0vWTh2R2pVdGlzUUtNejFrNkozNVpYR0NteXpTbjVl?=
 =?utf-8?B?eU40c3NCVTQxMkFWZlp1eWFiOFIzNno4UlNnWVo2N3hVVVZvZXYxOWt6UmRl?=
 =?utf-8?B?d1UwTWR0bkl1Q0U0d3FRMzdnUm1oZk9GbUdnUkJGTXlrOWx3ZURtbjFKU1NF?=
 =?utf-8?Q?2A5JRmq9xa+7Eq1k=3D?=
X-Exchange-RoutingPolicyChecked: r2sxwFU7DIOnOveq7zO/ErqvghObaxDt7D9U3n4/Jt77mlkfiE1N6oPWb9uwEBVA8QR2PjqDwD1LgSQTPyMapwK1veYnGS/VsHOj+DRwkXLqfKL4RpE3+lTkORNetsu+QPqCr/Dc3ny/q7Ckxie3uo76DCCq/FB+F2nqtkqS5C8/7qaevHm6kdLs6nuj3BIWSmf47wJ7ry1DkJ2Kyd9etjW8+F4ma3SOOFo8ilJ6k7pgkvgBT11vJGiujfoD/aOT5eCKyVjefvgLE/eqZf3Bjk/nUSugJTmQD36De/MTUxCB7J2wj/UPNgMvpiqQ8OkfCWZljbsCIY+Qa5+atVHB4g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d5897c1-ed03-4b51-6534-08deb01d61c1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 11:55:37.9375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2NVkGXzeV8TsWObtmuMcl7+rQMrqUHLOX/nwKEbsF0yaoNHhsTOfbRBwt26pkq3arGCX+ERDnN/Pm7Y3llNQDVRkSxx10MdyQ9ukN5TZMGc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF1CFCD9AEC
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



On 5/12/2026 8:01 AM, Arun R Murthy wrote:
> Reading the VF_CAP returns all 1s when the config space is dead leading
> to missdetection of VF and confusing the GuC.
> Check for all 1s and pci device detect can act as a sanity.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7941
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sriov.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
> index f3835867fce5..40e142d78924 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_sriov.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <linux/fault-inject.h>
> +#include <linux/pci.h>
>  
>  #include <drm/drm_managed.h>
>  
> @@ -39,8 +40,21 @@ const char *xe_sriov_mode_to_string(enum xe_sriov_mode mode)
>  
>  static bool test_is_vf(struct xe_device *xe)
>  {
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	u32 value = xe_mmio_read32(xe_root_tile_mmio(xe), VF_CAP_REG);
>  
> +	/*
> +	 * If the device is inaccessible (e.g. parent bridge stuck in D3cold,
> +	 * fatal AER Errors) MMIO reads returns all-ones, 0xffff.
> +	 * VF_CAP would appear set and would misdetect as VF mode.
> +	 * Sanity check PCI presence before trusting the read.
> +	 */

can we have this sanity check elsewhere please?
this is not a SR-IOV specific problem and we will not be here when info.has_sriov is not set

some attempts to show the problem were already done on both i915 and xe, see:

[1] https://elixir.bootlin.com/linux/v7.1-rc1/source/drivers/gpu/drm/i915/intel_uncore.c#L559
[2] https://elixir.bootlin.com/linux/v7.1-rc1/source/drivers/gpu/drm/xe/xe_force_wake.c#L121

so maybe we should just extend our xe_mmio_probe_early() and do some sanity checks there?
then any error will be correctly propagated to abort the probe sooner than today.

also likely similar sanity checks shall be done on the resume paths

Michal


> +	if (value == U32_MAX && !pci_device_is_present(pdev)) {
> +		drm_err(&xe->drm,

nit: we can use xe_err(xe, ...)

> +			"VF_CAP_REG returned all 1s, config space looks to be dead, skipping SR-IOV mode detection\n");

nit: this is still misleading, we will continue as PF/native
and likely we will see just different set of random errors
without realizing that PCI/MMIO is dead ...


> +		return false;
> +	}
> +
>  	return value & VF_CAP;
>  }
>  

