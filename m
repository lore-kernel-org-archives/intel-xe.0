Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7F3C982EA
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 08:50:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 761F510E878;
	Wed, 23 Sep 2026 08:50:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j/PKruQI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 788DD10E878
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Sep 2026 08:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790153453; x=1821689453;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=3BYAkwWXjMIGp4m/kfhrH4Zq5/MkTIdGAQ318MC8rz0=;
 b=j/PKruQISK1AJiQn4djYo5YjLALwrLRAfTfC0bcD+Zfaf5x8gzNPPPDP
 QC7Jahz0tNxaqLSSIRQIqTMD7S1NZgwtjD5BEb+sZU5CTIMoT4GArX4ZJ
 14qdbaNDgV+oVwqhr/gH6VwxIarho18f0Lb9azSxmR2jEgYBqg1RyVUnN
 wj4HxaKUCL3kIG2+BdMcLGbuujeJLe+orNwdL4e5E9vZTNV8M5i9Mc6Sj
 rrumxxsOBVOWfPza1n5Z/tq7TvZC8tL+dSEOgSW9IrPs246kzJr8iu09T
 HrinVpcESTYtzLGOL8yVlP5F2RxBij8jt2UnvXh2qvyXrKIAVlNdpyRbc Q==;
X-CSE-ConnectionGUID: wIOGXgWcSh+Q0FXeS5qH9A==
X-CSE-MsgGUID: MRfe3Oz3R7qNp6HjrNDiXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="94646993"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="94646993"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 01:50:02 -0700
X-CSE-ConnectionGUID: HyqW6FFrTiqrF3ZGw6Clww==
X-CSE-MsgGUID: GKLybyI+SUq5SDaW9pgLCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="4576383"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 01:50:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 01:50:01 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 23 Sep 2026 01:50:01 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.52)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 01:49:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UNBH/jowf/z7CHdEOXsmki18cQI0l0E+wjyS91FoeZ9l03IVsPSrZIa0bEjEiCYFGCIT6znhU1KL3TeN1I2GI9BnNxIHZSrSD0kW2UsN7dQC4JlgvyKTJpcZ1G3Q1dnR4zRrm7+BqW9VATvcpdCxf557MK75TfX3/Qn/FZd1+2Bdf5Rw+BHKZAmbmzk4iuMweRJjsjlMMSJMmszctg0x16TfTH4yHWDWY9if+fdwx8iZVS8Atbt0kNmeZkgoXv+ztveIcyQ6RazDpSMeRU7/9O2KQH37Oau9pnTWYgqfL8pPixJNzQhfFaTp3bkf9IQ3BCkT5J/QvQw3y7uIzIGrnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Bn5GkA1mVCKzp0AGkCSfNcU+6ir2R9nfRHA1w4SqSI=;
 b=WPCEHtjHdjeYKzBymxGHw6QQyYRdDT5/Y8BXHRPB3wHttbv5av9XxmzM1CfTEs6BSHaxQDaK3xtsggdFZK8XbPRfGvnrCC829D4JzjDSl+56iT3d3wHtwQc49U9loaYRbKHUZwAc7PE3G0I/qDYRVP6rv+du3bkRAcAfPp/Ba0UCGrIdG/QmUHIPx3HclM9lQMkNXQ3iaodJyFaaCtIRzsYiwzTuEPcIiqZRkyK1ZzbyJ3D2kxbgGDMLgWHsrpVAzxvbjoBwy1VALWWDzaGQ5U4Lz3eKiRgPwXU0PWtNNmbILkoTsM3GG0Gymf5M29f6A3dTd0jnimZUaiB1nzPt6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.16; Wed, 23 Sep
 2026 08:49:30 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 08:49:30 +0000
Message-ID: <4b712e60-ed9a-4137-b0f1-4cd92dcf9c24@intel.com>
Date: Wed, 23 Sep 2026 14:19:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 21/24] drm/xe: Add ULLS migration job support to GuC
 submission
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
 <20260904211613.3934307-22-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260904211613.3934307-22-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0049.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::12) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|DS4PPFE901A304F:EE_
X-MS-Office365-Filtering-Correlation-Id: 953e513f-536d-4e21-f53d-08df194f94ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|11063799006|10067099003|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: qoCqUUXc6+3oA8IE+dmuXVWuF3FU5BpStOh1eLs5p886sBXaXp1T8R6rB77Hbn+YuloO/XoiNlxeFOr7rwAjyGr1p0yKgSmU8UHsZbXlQ8JSkEtUR3saOnkVCsW21lgzN7zIBXHzZ3eknQ+m5o2rE3h+kMzTpwulMnFqlE6yRnVHPMeXoZ1+/rwZ5HF3V1gZH0Cc/+9jzIFqfLsvGjj1mbEVeIkqB4pyYuG1latsY4FqGN+/7Gs2t0RlqZ87HKqAwP+L94nIsuEGspbkZOl7tCf4aOYZ5AA4nNAwbuVfabeHS3h1tQBtFYZm9jYm08Rh/FfxC0u/OPR7G8FIVPRppcL7+u/0hgEUVFLxqXdA4jOth7sHgn9ewLqEHVCpxOcTJPw8cHSIba1iheK4Bp7yvdeI5B0oNrgks2CZobZHSteaF/E3u4tGy+Fn/56qR0bN+BSgxyENUyjp2hrH+OxtUCO+PR8yDCqMPMxVQqMFgqVTr22vGg8jrfeFqUHRzEqXRgznFbIojRCnKEgcIrEqmyW4n20zoBvzWM6t2R2C36cd4PLCswGZIVqn740fdXiwjxjLyiF2NNZPrDCC7dXeYvh85SPnWtHlfHl04CDKt+4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(11063799006)(10067099003)(56012099006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlU1OXowTnl6TXF4T29hQmFVcUVwT01GY0sxSXpHQnFtNjJkMTRuNGkwcXAw?=
 =?utf-8?B?ODhRK25VRHNMdEpacEFQMTVaYkVkK2pqamJIbHErTWhGeE1tR1dzMlZMR3N6?=
 =?utf-8?B?Z2ZQSG9mM2xIM0hVRXRPcE5nRnFrZjE5ZFViVThlY2VoQTZZNVgrTFJNQ1F3?=
 =?utf-8?B?cG45QjdTVXlBM001OXFpL0RCVUc2Sks4RW1zK2hTcUIveTdJSDVvSWZLYkFI?=
 =?utf-8?B?ejUxaGg1UGxUSTJkZXVjbVdVVlZRZGF5QWNERENRN1pyZkZnZXpjSDZMVEJQ?=
 =?utf-8?B?K0xyeStpOU5ObE1XUlg2MGh3NS9nQ2I3ZXIvVjZmR1dXNi9GRjhPZlhobGtE?=
 =?utf-8?B?c0pWK3AzcTdsSm9vTW5NNlhpZkZHNHJhellJaFhVWDg1Nmc1emdNcTlpcjI5?=
 =?utf-8?B?ckcreG10UFhXU2tVVHVsRWlTVnBDZUFvb29idXd0Skc3bE84dEVzR24vVnQ3?=
 =?utf-8?B?czY5Uno5YzB6YzV1SWFyV1VHaFVlUjlHSFZ0c3JhK1A5TndRZFV6QUVVcXZn?=
 =?utf-8?B?c3M3UjQ2U3lKWmVCVUdwT0pMSFFsNGpsREhlckJkekpJTGpwTWNPSFJuMnEz?=
 =?utf-8?B?MXFKWkxHbXBubzU1YVlhcDBFRTVrd1FTZmd0QlRyRUNGVDZvbWNoWEYyaFV1?=
 =?utf-8?B?cFdmcjBjcERpbFo5VG5RSlNJbjQzTTJXNFRWWFBhdHBtVlNsVWJZMFNzNmxV?=
 =?utf-8?B?bW81ekN3c3ptT3pmd0RqOTRTNnNyK0ZYbEpqTk5Qa1pvajQraXFrbTkvTEpw?=
 =?utf-8?B?ZXIxOEtMSHhxQVZmT3Rkb1dBdi9tY3N6cXd5WFJmL3lDRzFCbWlPLzVTei9y?=
 =?utf-8?B?NUIvZFRobnlFMGtkUktUc0Y1YkpmK3VXN2hiTWFRTklpKzVPckZIQXdLTm9O?=
 =?utf-8?B?cGY0Mlo3MDdIT1JiR1o2cms0SDBSOU9LTkI0UmhCc1Vyc3RaWjloZjNkaHZM?=
 =?utf-8?B?ZXJZbHVXNGwrRVU2L2YzSDZYNDNRWXgrWkFEcFdLV1RmWTFFL1VmYjBoTVFP?=
 =?utf-8?B?OEl6NFdjSXJYeXZWaGRQWkVXN2VudkF6NGdPOUtSTCtDY25ndDZ0Y2hadUlR?=
 =?utf-8?B?WURReTdsWlZRSHlSQ212R0QyTlN0UTFhSDhnWmJmTXdpOUMwdGpwTHpIWUE3?=
 =?utf-8?B?aWJzR1M5MVQwRzVOYWJMeGFWWEFKTFJ5azErUWkwdFFoQllvY3BCcHU0UjN1?=
 =?utf-8?B?YjROaEVGRGRMbXA3YUJCL0Z0M0VQSDlwekJFMXd2VVNoMEYySFlsUXlqcEFP?=
 =?utf-8?B?NEp6a2w4MEVLQjcweGJDQTRwcThqMzZtRjNQRkwvb0gvdEpQVWVuTnVIRTdB?=
 =?utf-8?B?UXFqT3lJeURXWW1TK25wUGRld0FOcHZ4TkJoK3h1N0FQRzJEVmlwZCt1aldl?=
 =?utf-8?B?OFpydTVhbG4yWUFtUzVsdytPeXZmSTN4MjVTYnN3NTl5akJIcjd6VHovUndx?=
 =?utf-8?B?TFhrVGFTeGh0bjZSeFJ3MXljSWRjK0dpSGt2MkpsNXFnYmtaazFXY29FVHF6?=
 =?utf-8?B?Wm9PUVd5S0hKbDVzZlVRZkhndFQ0bTVNQ1p4Vm4rV1IrYTNHM2ZOUDh6Z2Jk?=
 =?utf-8?B?dDYxY2xFdytCNFpRMWtBd3BKRGs4dloyK1A5RXRDaXRXdkV1ZU5PTXZHRzF3?=
 =?utf-8?B?R3VFREJ5SHYyODdMN0xzSXpLRlBBNXpza0VrRXdMTWtoVERHNkhjY2NNV2xi?=
 =?utf-8?B?THhXVHp5cFFaazN2bTR5Rk1yS2NQbHRuZ09xQ05mQ2tsdjk0TmgvVmNaS1N5?=
 =?utf-8?B?UmthYjVSblVrRSt0T2V2Ny8wUFlyTFkrZWtoUkVlZjRvUGhqbVFsVDRIV0pE?=
 =?utf-8?B?YkZiZXY2ZFVyS1VTeDRSRURGa0J4TjV3Tnc2RFJHN1llUEJWa2U5STZyeXpq?=
 =?utf-8?B?dkR0YTQvaFR3VmdyWm1vY2VmQngveXVGYmYzN3pRdjJEdjhLUElVYVU2Z1ow?=
 =?utf-8?B?RC9pWmNXSlV2aGdaMXlDSGk3YUpnU1JsdFZTVWpYakNoc2FCaC94dGtXc1VU?=
 =?utf-8?B?aUU1T1VVYmpIUjNsN2l6eWE4VUtVK2pXUktacTVsZFhFcHJBWW1wV2NGamg0?=
 =?utf-8?B?WnAxQXVhN1ZRWEI0Y1JOaUhFVjR2UlQ5ZldJcFBicWVwYk1DMStBS1JmR2Fo?=
 =?utf-8?B?S3JmMzhUYmo1UWwzckp0MkZ4QXFNT3lYd0RKMHpjYkVENHptemp0Y2pFUE5X?=
 =?utf-8?B?enNHOUMwT2hnc1hWR2NDV3JwTkNMd0ZUc2tScXV4U1hsSy91L0JoNmVCR0Ns?=
 =?utf-8?B?MmtVb25BK3QwLzMvcXdNV2NNMEFvb25BN0VMV3pmWnhIWXlwamUya3Zwcjg1?=
 =?utf-8?B?dGc3Y0xlaSt5SWR5L1Z0VC90WnR6OUFUZ2MrVEZVM3g5cUpCRk1MQkhYUDZR?=
 =?utf-8?Q?uJFk1+vcm1UCausI=3D?=
X-Exchange-RoutingPolicyChecked: PTkd4XnWNHRtpq2vkGyHiet0y2miotKpf12DKs49+zazphoEezg1jio/1cBugrgaiWWVSYLhlviAVuZ5MkNJRZTnRNFma7tvb92NG3Gw+Xr2wXsSd737wvdGDXiV2Nwbf0CsP3VxmV3rDcJvLeaCHhq5Wr2llwCtpuynk9fkyPIlvfh5A8PTYNhECSzNgZJlKIlYpD/D05uGI3XdMHGrC1cygLcnMfdDKezvI6Hd5oUl8LLsZ6+EnJJqy87rW9FtPnz1UygT631G8HjuGS0iENHwBXmVA+szTIqi9a0fhdGsDd89/9gN0DwXELd7yqx6FRcoJi3mAxRgQHinyy7KBw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 953e513f-536d-4e21-f53d-08df194f94ec
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 08:49:30.5440 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fgeDISg6WJXZf6+ZbDNeVgBG9Aoe9UZC9yEZjhfvEULIQz/maiTa2kJryNywrjl3FivmAW5xfZXB6tHYc7SGXDWJnKNlozaN2pO/UhIyTAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFE901A304F
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



On 05-09-2026 02:46, Matthew Brost wrote:
> Add ULLS migration job support to GuC submission backend.
> 
> Changes required:
> - On migration queue, reduce max jobs to the number of ULLS semaphores
>    minus one
> - Skip writing the saved ring tail for ULLS jobs except for the first
>    ULLS job - the ring updates both the saved tail and the tail register
>    itself
> - Set ULLS sempahore for current job releasing last job except for first
>    ULLS job
> - Suppress submit H2G for ULLS except for first ULLS job
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Link: https://patch.msgid.link/20260228013501.106680-24-matthew.brost@intel.com
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 17 +++++++++++++----
>   1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 5e3e911a397b..a83360fcbbf3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1189,9 +1189,10 @@ static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
>   	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
>   
>   	if (!job->restore_replay || job->last_replay) {
> +		/* A ULLS job past the first publishes its own ring tail */
>   		if (xe_exec_queue_is_parallel(q))
>   			wq_item_append(q);
> -		else
> +		else if (!xe_sched_job_ulls_is_chained(job))
>   			xe_lrc_set_ring_tail(lrc, lrc->ring.tail);
>   		job->last_replay = false;
>   	}
> @@ -1208,6 +1209,9 @@ static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
>   	if (exec_queue_suspended(q))
>   		return;
>   
> +	if (xe_sched_job_ulls_is_chained(job))
> +		xe_lrc_set_ulls_semaphore(lrc, xe_sched_job_lrc_seqno(job));
> +
>   	if (!exec_queue_enabled(q)) {
>   		action[len++] = XE_GUC_ACTION_SCHED_CONTEXT_MODE_SET;
>   		action[len++] = q->guc->id;
> @@ -1221,13 +1225,14 @@ static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
>   		set_exec_queue_pending_enable(q);
>   		set_exec_queue_enabled(q);
>   		trace_xe_exec_queue_scheduling_enable(q);
> -	} else {
> +	} else if (!xe_sched_job_ulls_is_chained(job)) {
>   		action[len++] = XE_GUC_ACTION_SCHED_CONTEXT;
>   		action[len++] = q->guc->id;
>   		trace_xe_exec_queue_submit(q);
>   	}
>   
> -	xe_guc_ct_send(&guc->ct, action, len, g2h_len, num_g2h);
> +	if (!xe_sched_job_ulls_is_chained(job) || num_g2h)
> +		xe_guc_ct_send(&guc->ct, action, len, g2h_len, num_g2h);
>   
>   	if (extra_submit) {
>   		len = 0;
> @@ -2098,6 +2103,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>   	struct xe_guc_exec_queue *ge;
>   	long timeout;
>   	int err, i;
> +	int max_jobs = (xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES);
>   
>   	xe_gt_assert(guc_to_gt(guc), xe_device_uc_enabled(guc_to_xe(guc)));
>   
> @@ -2137,8 +2143,11 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>   		submit_wq = primary->guc->sched.base.submit_wq;
>   	}
>   
> +	if (q->vm && q->vm->flags & XE_VM_FLAG_MIGRATION)
> +		max_jobs = min(max_jobs, LRC_MIGRATION_ULLS_SEMAPHORE_COUNT - 1);
> +

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
> -			    submit_wq, xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES, 64,
> +			    submit_wq, max_jobs, 64,
>   			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
>   			    ge->name, gt_to_xe(q->gt)->drm.dev);
>   	if (err)

