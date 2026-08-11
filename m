Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A704FC5CFCF
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 09:43:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FF8A10E2D0;
	Tue, 11 Aug 2026 09:43:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="exuP8sUA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07BB710E2D0
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Aug 2026 09:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786441412; x=1817977412;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=GCOejk1ED0xeV6XbbvbbTKFtqBPD93D1+06SE/daXmw=;
 b=exuP8sUAaZvs6FxrTs1AZFZHVzI0x9qXrsjPniG/swdBH3hPNzM+CDpG
 Ur20sHTW7GYNg9M7YZPSOQzH5Hvvs0OugNVaJcgmwL3D6HrmqDVkI7ba6
 yfM4jd+dvE+YeCeOp7H7X3cZb/WU+UrwHkBaqh8a0KPI2/J68BQZC/nLb
 18zfbD4fFQzk3DGwnnAhPCUStecrhd/DPPPVGs1gA7gN9qnN8vP13wzIN
 nznP5/x73W8FifGFk/ZQtRgECg5kmLoACwtJmkjpP/zb9jR0XwG5tEnOK
 UjyC5sEEsgajEFGogmR+hlvmmrPCCTsQLzkMVt4TVtZQ1B+T2LU7KO7Ja A==;
X-CSE-ConnectionGUID: iZm/a9VtRZS/53gn/MxNKA==
X-CSE-MsgGUID: kxxXv81hQPWm62x7wqVzmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="112513539"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="112513539"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 02:43:14 -0700
X-CSE-ConnectionGUID: G6h/e44cSBOO5FOwJw9kLg==
X-CSE-MsgGUID: 0izisp0YQWOagkvLZuJORQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="301513636"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 02:43:14 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 02:43:13 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 02:43:13 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.66) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 02:43:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=boxrJacF7tfKVPRVHK00fqyVGCJUjLbYWKuZwEruYYzGetCPOReHmevjMN7irbRaGR6JURR7taVGwCExSB3+6a4AN0KVm/VMyH6xZIe+qlRAAXydvXwKgdr2OD5/tBmuw3jZK6kOgg/GDXo92cgU6esV7ogjPKCumqCYwgEkwC4SZ3lJ0q4kKuOsIJtH1WwVuASyxPjaWRvpZ0t5jSdzJ9uQNg6JwsCr7Q/QLSo6wvMZqyaPv3rVYrkL21omp618mYfGd0Dp8AIokePUZmdxF30zKPzQ7/EYaSq5AtgUidwDUB3UXCX5TU39TKcj/P3SFO6I2ckAGvUsWW6MUo6waA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5LB7MR3oKwrvFHMRxO+5CZO+PkWPFbGr+nnTKLuWkkI=;
 b=hpoOJnaVX7D/3U9GgW26LJ2rM+O3GS7Zz6euVkgE3HAF2PJkwoGa+We4LQyoDojUGuZX0GiivnOeQAVwnOKsiT+WRoxCPSOyeDDh1vBMQmPx0g7xv9UimZAuB7U+Ul7YoUdd161LoenK6U2oKyP6SS3AV9ha+eSmajDrEKZGONfWOUHtnEw80BWKL0mi2vleYwHq+jeFX+1VmyhrV1DdV9tuX6Q1eeQVcW+vlQo2j5BksY8ATPmId7unNgi4OU3+7DaI0OB/BTGiXf0dVgaalQllGeen8iwSg2hLATBYPcW/E9ateVTWTHVeZO6NmTPCFGUVMR8j411IUAWkPMndDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CHAPR11MB9654.namprd11.prod.outlook.com (2603:10b6:610:302::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 09:43:10 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 09:43:10 +0000
Message-ID: <c76294a8-539f-44de-9051-02969ddb773b@intel.com>
Date: Tue, 11 Aug 2026 11:43:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] drm/xe/vf: Add bounds checking for queried GGTT
 base and size
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260810101428.1009573-8-satyanarayana.k.v.p@intel.com>
 <20260810101428.1009573-12-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260810101428.1009573-12-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR03CA0045.eurprd03.prod.outlook.com
 (2603:10a6:803:118::34) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CHAPR11MB9654:EE_
X-MS-Office365-Filtering-Correlation-Id: c9976ad8-b603-405b-7dd5-08def78cf49f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|18002099003|22082099003|11063799006|4143699003|56012099006|10067099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: qf/mqKaTvxIQSIj1EtgeZzhKgCIWD2LQyJkEXu8wbBr5IgyEeMmLSXp7gpVVE+PrRTPsTjBim+B6nHvgYLitzu1KdvPHC62XCT5zAomAx2FyaqZT8kN1si+n3p0QSaExdFgWNEADSRmDT+1xcKppK70+YyKRMwTqwR+/GD7r9SjLhN5iGZU/Kk/BbQoS1R4IwAINySv1X0LKSKo4e7Ev87s+9comijRZs2hEf86EJ602bvu7ir7fICcy7xqFeNkWyUCbu6nXwwcU0lj/q87QQhZMIOj+IKedScpSQv7JRn29CxxQ/L+HLDOMTabZ4hDVGpVuoitCpY82aFpoN2VFZzvBo6VcNGZZxCdet0DCdV6eJ73M1KHB42agA5tmkXmaobf3awaaq2MiiMeea1fOxzaG4RSAkCiIZnIAt27M9xEGPnPvh7Ko9LxX6h+nesRwjoyGQ9EKuCPt0gQPIRdr3riyo+uDtkjql4cY+dAAXNaqLbOS4yIv6c4HwDKRNMQLjUzeWesg1pZKURnJNJgltrXX63YYeM3mXAoLIpTx/M0575r2k8ZTGXFlrnXb0SnbAHGeVP2PispjZ9axKoyXH4hTbswjSrkDgIlcXI50MqPVz16uBSUppyoHXqVZ+Pe/lB9eB1m5s5O4mmUipJuDA2bwIPOHps3M7WxCMhwDuBA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006)(10067099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFgzMWpHNmVNcXB2amlnYlVBa1BzZWQrdHA4SEZYOXNROENFWS9VYnozc3B4?=
 =?utf-8?B?aGpCQTMvcE93QXIzTHMzaWpWODBVamNpNHZwM2NNQUVvaE4weGJ3UjBYSjFJ?=
 =?utf-8?B?QzcrWlZFSFIrOE9DZmtlbld5MC80a0NZVmEzTTF3VUdJVm5QczR2Nm1qenFL?=
 =?utf-8?B?dTRRS1BWVEFmalZnYjRONkdPdmJVS2RsbWtkZWVNSldmTFlwNHVQWUF6NEpH?=
 =?utf-8?B?UXgyWThYVWVSRmd6ZjZodzF4ZlpJQlYxNzVkSHIvaU5Qcmthd0ZUU3I2VTll?=
 =?utf-8?B?Q21GRXVUdE9panBRcnVSUWExaVVZamFRY1pDVDZFMEJoRXBtY0xPakFrbmh3?=
 =?utf-8?B?L2RUK1RMNkVOb2hMWVZuTVdlL00wRmJZVEI4MXlOSmxwQjhIL0hGT0VKTEFp?=
 =?utf-8?B?OC9yNG9manY1RWJ3a0hBbEdQQ0gvVWhKc21HT0FZS2tsNFRrUmJOam4ybzFB?=
 =?utf-8?B?bVNDUUZBY2JMS0tUVXo0dW1mOHorZGFSb2lobS9wb051Z1FEK1FYcXZhZXF4?=
 =?utf-8?B?VktyQU1pdmNzU0hPUlkyV0NCS1NaSHlkMkRBL0g0TStTU1dhcUJOVGFhSDNL?=
 =?utf-8?B?NFZGYlNHallldGx0SjJhNmhVeHoyZ2JWRndXdmFMa1V4RHE0dGhDSTQwMXRB?=
 =?utf-8?B?SitBMVRkSW1kK2NBTC9pelF6UkNQd3Z1aVBPeVJ6ZWhEOUFQUHJuRHU4U2Fx?=
 =?utf-8?B?WEJSbVREQlhvUEczNDd1bS9wNkp2eW1lTXM1UTdpQjhRM3dwaEhTT1phZ2l2?=
 =?utf-8?B?RUJEL2VaaUJibzc5c2tZR2IyWXN5WllpT3ZHd0tlZStIZjU5L2hURW15VE9h?=
 =?utf-8?B?UVdLRW5SNVdlOUVkOG15NjRudHZSRllxUDBIWHhJSTE3QVk1L1lZazBYblJh?=
 =?utf-8?B?bGM2SnRER0F3VDBMUGd0a2ZPM1lDVTZaNmFvQ2ltdy94WDI1eVhXdW9vRTUw?=
 =?utf-8?B?b0NzbU9hYmZPZjF1bGhhQ05YS1llK0NwTHR4TTd5aWZaeWFGd1lyMXlLREp3?=
 =?utf-8?B?NGlHeFFBRkdvSksxQVJuYWNDWEhyNXh3NUMwSDRLREdSQUNVVFR1OUJzcEtO?=
 =?utf-8?B?OFlxYXhnK3g2ejVCUzVnUmN6M2pMRFRZVzJSamVnR0NiN1ZyUnRwa3piYjda?=
 =?utf-8?B?TVl5RHJCTmxrRkVMVnh6NXhzbkxMTGtBam02VHc1ejc2RjNXRlM0MXBlNGpL?=
 =?utf-8?B?R0xHSE9ML1pXN3Y4LzBDT2U4YXNWYnBHc1M4K1NCRW9ZaEtnRWRhUTUrdkZC?=
 =?utf-8?B?SkFjejZSY0xCQ2hkYWExd2NoN1JVQ0tyaGZ1cmpMTDBZK1ZmOTBIRWR6MXgz?=
 =?utf-8?B?ZkxuZmhiUHJXeTZDcjAxTmcxVkJrZFdRdzcvVkd3aS8yODVoMVk3Mnh0R3Nx?=
 =?utf-8?B?N1FnQ3BCb054T0ZIVnFyYTFDM3hQMjBJRytOalNSVFpFVEE5SGhLVkdackpH?=
 =?utf-8?B?SzVoUVBjbXlxVllaREp6SmtRemZVVjBRNEQxc3ZEUW1EZ2xXU2xWc0JRMFJS?=
 =?utf-8?B?YkhIUEF6bnk5ZmhiNGRsTUx2SzgrWTNQSkd2UkFTSmJKU0ErOCtTcEZ1UVIw?=
 =?utf-8?B?UDVlV3RsVElYUEdUZDF0RGVBcWY5TDRTVjRsajVabGVCNDFKaU9MZTB3TDNk?=
 =?utf-8?B?MVZWR2hqQ01BTExlUmZVZHFDcG41ZG9QVlJaNDBJNUMwb1NoaE05UDRpV1Zr?=
 =?utf-8?B?Uk9EbTg4anNiTmgxZlU4YnhhdGZ5R2syZkx5dmJHSlo1Wkl6bjBsdGFXSnRw?=
 =?utf-8?B?SUE4ZklzRWp2RkdmSmVYcmcwYnEva1k2K1dra0YxUHBWZlQ2V1cwMGVqUmQ2?=
 =?utf-8?B?enlXa21oVWQ0TjhJL2ZDN1o3cHJkM2JyS1JGdlZvNUo1YnhTVHdpMDB5c1JU?=
 =?utf-8?B?TktGYTJTV3E0MEpGWWpteXd1Zk1mVERyQnRLanBKMUNQNVFMNTdBcGZNYXhQ?=
 =?utf-8?B?ckJRNXc0b1JSN3NNbGVVUGRnUjR2elgwY3BqaHpTMHJhT2JkcjVMSWVtNkRu?=
 =?utf-8?B?aWl6V09jcjZmTE9hN0txaE1HcEVKeTIvaFRsWTRtVWN5Y05rbTFuRjZCdk5Y?=
 =?utf-8?B?TE1LRC9DaW1GeTIwaG1hNUU2bENmWGlmQk0ydHhGU1hlK015TUVEZm9tdzl6?=
 =?utf-8?B?c2RoK2IrOGxicTBKMy9za0lhc3M4bFU4ZEtKK2xUVVJYNlF0MVZ6dm8xTG5H?=
 =?utf-8?B?UjR0cmd5R1dqVGtBeGR1bTBrdFdUbVduZlBwamJOMFFNRUVrY01sVnNGSUNW?=
 =?utf-8?B?dWFQVFlyeitNZTZQeEZiUGxYQ2NBOXlZMzhHYWtydlJyMzdORCtvN1pGNWNi?=
 =?utf-8?B?UkdWS1ZvYmtTMitZVng4N0dLdFNWbk9jbysvbWZ0TE5CZnllK0UwTlcwS2Z3?=
 =?utf-8?Q?/CsQMA28hZQ5vVVI=3D?=
X-Exchange-RoutingPolicyChecked: C2L067kvOyeUFtWUXX8S+YU5uWcZbwx0CfaLx/ZpYiWLICNBQsVWwqScaAiTZ1Y0fjQ5oHdZWFdxw0vyL4LyhHjvY/zFnfF2FqIgYa0AxYX4YmMXqwPXHuuMH7wUlZPyf8/W7A8r/kxFF/DRUZR/v5T9+NFZdTm5SAjUjlEmqmikjvPO/VtKA43GIAWpGIYHptQgXxLHXjyEopSFQdxfxtNdzeCNzqxbjddSkhghBVOf11c1IiZtSGV5kyoXzs+xbVdNVj+yiyb2AiPymhIy90G9j9z+XnOYRqV2/d5HTLnx2Pu6wSsOm22W+AVkCQyEdP4cG8gAXfNOzIwzrNACOw==
X-MS-Exchange-CrossTenant-Network-Message-Id: c9976ad8-b603-405b-7dd5-08def78cf49f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 09:43:10.5940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kR1I5aCsOndlCCrEq0JW/iNbOsqJ3u3NF6hfnp3iQGGS5ZektCZifDT9waIru6IiILHWvHUhSVZH3nDfdFY37bo76i6OIwkaOIo6o3qyBto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHAPR11MB9654
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



On 8/10/2026 12:14 PM, Satyanarayana K V P wrote:
> Add explicit bounds checks for GGTT base and size which can detect
> and reject invalid configuration data from a misconfigured or
> malfunctioning PF, preventing protocol violations and protecting VF
> initialization.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> V4 -> V5:
> - New commit.
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 81d68fe5ad7c..65e48f135801 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -486,8 +486,16 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt)
>  	return value;
>  }
>  
> +static u64 vf_get_ggtt_alignment(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	return IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
> +}

I guess it's time to extract this logic to some common helper
(maybe in xe_ggtt.c or xe_device.c) as we repeat that in:


xe_gt_sriov_pf_config.c:446:
	return IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;

xe_ggtt.c:423:
	if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
		ggtt->flags |= XE_GGTT_FLAGS_64K;

display/xe_initial_plane.c:48:
	u64 page_size = xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;


xe_bo.c-4057-
	u32 page_size = max_t(u32, PAGE_SIZE,
		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K);

xe_query.c-291
	mem_regions->mem_regions[mem_regions->num_mem_regions].min_page_size =
			xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ?
			SZ_64K : PAGE_SIZE;

xe_query.c-357-
	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;

...


> +
>  static int vf_get_ggtt_info(struct xe_gt *gt)
>  {
> +	u64 alignment = vf_get_ggtt_alignment(gt);
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	struct xe_guc *guc = &gt->uc.guc;
>  	u64 start, size, ggtt_size;
> @@ -526,6 +534,18 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>  		return -EREMCHG;
>  	}
>  
> +	if (size % alignment) {

IS_ALIGNED(size, alignment)

> +		xe_gt_sriov_err(gt, "Unexpected GGTT alignment for size: %llu != %llu\n",

	"Unaligned GGTT size (%llu != %llu)"
or
	"Unaligned GGTT size %llu, expected %llu"

> +				size, (size / alignment) * alignment);

size, ALIGN(size, alignment)

> +		return -EREMCHG;
> +	}
> +
> +	if (start % alignment) {
> +		xe_gt_sriov_err(gt, "Unexpected GGTT alignment for base: %llu != %llu\n",
> +				start, (start / alignment) * alignment);
> +		return -EREMCHG;

ditto

and maybe check base first?

> +	}
> +
>  	xe_gt_sriov_dbg_verbose(gt, "GGTT %#llx-%#llx = %lluK\n",
>  				start, start + size - 1, size / SZ_1K);
>  

