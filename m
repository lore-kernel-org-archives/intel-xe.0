Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE38AC982F0
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 13:12:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FCC710E7C1;
	Mon, 21 Sep 2026 13:12:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jEFlME0t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C712910E7C1
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 13:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789996372; x=1821532372;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=0hO6MyBybrDPtyoOBrBugyMFYHPEDAF3giciQcGrFRE=;
 b=jEFlME0tOr145rFq4EHD86Abc11ft63k8jNR4id7EMnIFekDBPp49wrf
 SGu2xZYnAG55QpWtWgydAx+QEB79gq0rV1masFxbOuQvdcWDu8KmhLYmx
 9DCAdoGwf7afNisy25NWWnO0/GIN/EHKm59Z2kkq9s9dzD4cuSEsa6aVm
 NAQ9cKd/hzFuBm2wkLEQMs0ptuwH1lq6sZ/fDPuJLgPhmSAmz7fsOJuKO
 kR4LeESr1+G3lsKW85ZnENOdsNTYGsmXw4wjzoPgEcsdOZiEo5mmNy3oH
 hqoSgQqud7Qxhw7IbHnHYrx1MnBA28It6Qu1Ny6OyNnKTyTFSsyQ25alW g==;
X-CSE-ConnectionGUID: GChUBAI+SzOxMEx78bxpOQ==
X-CSE-MsgGUID: CjEN/qE5Q06by5N1FY7I7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="101856483"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="101856483"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 06:12:52 -0700
X-CSE-ConnectionGUID: Lc8M6Wr7TMWIMEYttDTyvQ==
X-CSE-MsgGUID: Wl1kfv5jQkSm1d605h3WQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="271165062"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 06:12:52 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 06:12:52 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 21 Sep 2026 06:12:52 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.70) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 06:12:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vkqB8o/vv/oISMZRKRiIGE43zRaicOwGMP6JjIkXwSZF3ISinuVcQ5lBtpcNTUlIH5bBLfIAn01djRJkqDux3cVVPnMNO2Y/8sRRrhiRzryFibTYHvdO1QM6ayTHCPDOzclTLJxnu8lP6+Suk7NHFHrDWqVeIp2ic+UPbxRXFccmtGsk8gIPiLwVkTt7JvihbRKzUgnxfFIMbb21NJv/M0Zs8z4KR++2xo9SVqJCxzmp2UtrzUS3dYh0Jfw6nifItj6b3AEAmpOI91rt7lO/zpJi/M3gvzWVjfaNTFnCr0NW77KHWGLTTpuxFjPTJk+cSxKTVerkez7NX+CqOCZoPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47ZyHyN5mbsTuqjrF5mszlVSyz43kbpGRc0MsPSoztg=;
 b=ZUsWv89TuGDLHx1qikKSjNce8C7EYyIXoSjwxwVBghuTvfsQJoC5d1sJYy5SR1I2pAQo1yrP5FCigaSrY2FFAw1hD4OYKqmmkA9in04jt/Kxmyp16fgl65pjj0mOZsjX5k8YOL2t4LyoLZmKadEjiHqsbO0j0UxELlkk116BaKr1ruYzbRVZYGXxfskTQk6igzDHtU8Vh1A7vGa/dlED3ckIf72s80yD8spwmntGvpdBKNXL7A3DKzSdTuzfHWyY3LEoM/exvyUmXS36pce0S53KzSeFGAWVqUF2YgV/nf2UdmgxPJISyJ900h0q4+UA7cX0Lm3j+rKQjbqwCm4Q2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by MN7PR11MB735815.namprd11.prod.outlook.com
 (2603:10b6:208:5f3::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 13:12:45 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 13:12:45 +0000
Message-ID: <32d645f0-472f-4300-aef3-e4988c595a86@intel.com>
Date: Mon, 21 Sep 2026 18:42:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/24] drm/xe: Don't use migrate exec queue for page
 fault binds
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
 <20260904211613.3934307-13-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260904211613.3934307-13-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0194.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::7) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|MN7PR11MB735815:EE_
X-MS-Office365-Filtering-Correlation-Id: a5d67fe2-f74f-4f5b-5782-08df17e20667
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|10067099003|56012099006|6133799003|22082099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: PIILX/+6thAC7ZCcNHVnuCuIiiizQ/JImkdyMgEkE4+ylOrQHdIpWSCwivRxNdWpf0Qf8xsTFCLijYQXlrxO3ke+2OKiCONwSWYBeX2PtoEImzSLkoco/ZJI84IjtltyqRY8Yz5TwjuVcyYNbhOFmYtlyPpNBkdLk4xl7hAEkOyyDwpb7jt1M+LnqkLOuykEXztnrCfuSmm1UCUPOAA1y2qfmMrZ1l1Jh7coQ5UOuh79G2qOkGSCBitqB5udwvOBZeEafrwAgzSQ33ohieizhzn5yYR52pt6+UphWCooGXh3sf64m5bsMNQscyd4Hyz5zUs6i0qiVqjlkXoMRr3Z/u7dx40oa9iA7wNGtkzwJbwUl48g1vI5PMTEjY8lykcc4WYkLvnIWS4OQdsYG0RRVZq+nKJa7HPyRkgjKxuQWLSDkQXAefnBmVh/ibg+1brShil2dwB1PmJUNZA/BVgMdnuVVvGMa8xu5QUTxpVK2l2vjPFJv7Gh1zE2I7znjLVEBW1p3uhSpNQ9g1/W06j1sgjxgTtDhixnGQuRME4ygAchysbVHstOvtLrp2uvAfMMPqjvd4lMj9hwmnJOMcFtmgFcdK98I/Q6Z0cigqkG+Fwz9OkFnNAEOfyWVfaPN+Nb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDVmTHg2WGVyVjVJVGV0Q3ZLZFdGVUJzY2lSN090MENoaXNBZExQd3g5clBk?=
 =?utf-8?B?eTE0VmpOWC9MU25ZVktZaHVydFdyTE5nd2xCTEQ3ZW0rdHZtS2gvK2ZLRmZq?=
 =?utf-8?B?RDVXNVlSTVg2NCtUM00xbEZCZjllb2ZoeWhleFJuaFhland6QTJEcEtPMWty?=
 =?utf-8?B?WUU5VlZPWjF6RnAxdEFXQ1p3NHl3Z1FWbjZLdDlidzVwUGdGRzJ5WHgxSHND?=
 =?utf-8?B?VzFzN1M1ckR4bFFibm1sTmFkNCtOSTIwWFNsRHl0L1pYZ2ZPaEplcmtxc2hU?=
 =?utf-8?B?dmp0R2dnWXk3eGZPdU1WWHg2TDNQeHI4VlQ4NDFFcWlFTzRKZ0ZEK2dObDJp?=
 =?utf-8?B?RmxSelVmYUVxL1hicnZzVGs2bjY2eHdFNEFyRzRINW5DbHlRQ0xXbXg0Sk51?=
 =?utf-8?B?bGd1TTlzV052RjlzOUhtd2wwZFduWFZ0K2FvSk9rSWdNR1VReW9qNEZVYnVN?=
 =?utf-8?B?U3RiY2x4VzJRZEY0ekxLYmdFU21ZblY0TEdlZWlId05PVDkzL0h0Y25nNWow?=
 =?utf-8?B?elFXek9JemUvR3NQTTRvdmtYaUozNnRGQU5YYUovZm5UWWhEYXV5T3Vlelht?=
 =?utf-8?B?NmI2aFFkaWpiNUNSUENhZzdiUEJzV1I1SFdIeTJwZnBIY0o3YWZkWUhsbEUx?=
 =?utf-8?B?d0JwSlRiaDBObkYwUFc4Z05UbUgwd3U5UmZldHlwb0M2a1lIa1gvTy91bUVo?=
 =?utf-8?B?Sk8vUmh6bXVYekNaOE1Id3NjdE1ndE0zTDFBWHA5K0dsVmdCUSsxVHFiMXlP?=
 =?utf-8?B?aGY4dUE0Mzl4MHl0MUhxSlE5UURWZGpraWUwVk1lQmJVQW1NNFc4OHRma3Y5?=
 =?utf-8?B?S0x6ZEt3R0ZIZCttOWJiay8xUGJ4VDlnbXE5TFFyd2U1RVFPY1hCamZ2dHVs?=
 =?utf-8?B?RjdXSmt4YWY5amlia3RlTkZ0T1UyZjFUdk45Uy8xeFlENTBocytweGtRMXVF?=
 =?utf-8?B?RW1tditNQzJ3NUo3V1p4TDVLY1p4L04veWpnUkxzQ2V5SHZJRHNsN2hwZTdY?=
 =?utf-8?B?SU9yZFp2OElSZSs5dml4QXdkM2h2ejRhZVFBQkxmcFptdkJrbnBON0JlVS9M?=
 =?utf-8?B?SDQ0RTlzRXFUY2RkaU1acVB3SGlnRVIwS2I1Q3hTeWl4VEdSazd5NmFFZUZk?=
 =?utf-8?B?dERzalh3QkxNSE92dXhTL3Y0d3Q1OHR5R3NHeWpQQjVMUVlYVldoZzVoYVlU?=
 =?utf-8?B?SlllSXpUTUdyUlFDOGFPZm5SdW1TcE84MWkybk5pTmk0V3gwS0dPcFJ0QmhX?=
 =?utf-8?B?djJHSjFnbk1OK3ljak5hRDcraGd6RTNscnEvbEVMZGhhMFpNdXY4RWlmenlQ?=
 =?utf-8?B?RXJWaW1hVXNyMjJIZGdUMHRMN2JJak9qQWpIMUhvNmlkNUIrRUhVWTB2T2tF?=
 =?utf-8?B?WDdHTDNZbWU0TzZMRnpySjRkMmEzemZMc3hLcjdCWWtMdWc4U0NPS1g2WVNi?=
 =?utf-8?B?SkRvckgya2l5dGpBVE15ZkpKT2xZaTdxeDNscmQycDRlL3FHREJkTFRnRGM1?=
 =?utf-8?B?U0xJUTlZMEZzZ2xGN0tMSFJwV0pvdHptR2JIL3FSanRIZEV0NUh2akYwYWUz?=
 =?utf-8?B?VVVWVStMeGV4d1BLOS94Q3ZwRUJmMkJsVlAya2FYT3pRK1ZMSEhLNE9JYWcw?=
 =?utf-8?B?UTlOeGxJZk1wcGg3QTBNNktMSFdORktwZ2hvenpmY3BCYTRtTEpnbXovbC9O?=
 =?utf-8?B?VjRsa3F3dkJMMzhnazZEck5CRFJjUjF1eGF3RjlqdHgyZjMrREs1MGliRldU?=
 =?utf-8?B?TUVUc3V4UmtYVmhVenp2R3Z5MHhZRVMvY2NCYk4wNzNqMGgyMk04TzFrdkR0?=
 =?utf-8?B?c3FkQnFqNVA4dmVURkZ0VXBBU09nVU1WVndhMTZGTUh1SXpnOGYrL2cyeXl3?=
 =?utf-8?B?QmZhUWdUaitZYmRjclUvQmpudGx0WXBFWDlOZ2d6UXh6MUNPTXZpb0FXT2I4?=
 =?utf-8?B?a0wxNjM3Ui9VOUM5cDZQZ1phQTV0ZUJQdFlDMHkvYnFvNTRwUk93UXBiWmZU?=
 =?utf-8?B?U2dDWlR2bkZZRkoxdXlFT04reTZLbmJ4Z3FMeS9IOVVtTHJCamNQaTVCVDNK?=
 =?utf-8?B?aWhSNWU1OHZVRk1OdjFxOUlqaTJCSnlYN05hUzRCM0FDUHg2UXlqN1dSYkUy?=
 =?utf-8?B?cUlMLzV2eGFqZnhDbkRBTnh4Tk55N0ZEUnFyS3AxUC80U3ViS25ObERseTFq?=
 =?utf-8?B?OUNiZFBoMUt6cFVmZ2VwUUNGS0ZRRlBOTXNObWVXY2RnK2M0UmtvbER3Vmdk?=
 =?utf-8?B?RWhZSmFDQmtKV1QwZlFEWkpaRk1ISytCWWNPTXBJRnloYS96eTZhaWhud3ky?=
 =?utf-8?B?L1paYzNCcWNZNUlDOTFrTS9PUWE2UXB0UHlqUWE1SExYdkpHR2E1eGZpSzhn?=
 =?utf-8?Q?uFJCWLATbqBA2xHM=3D?=
X-Exchange-RoutingPolicyChecked: sitdmaa7gNZ1ZQFyi5d0n2BZsmKq09arfua0lHwzdHT/LJJMXbh09muMakN03ZQriu6dJ1TEiHNh8PDT24qZmDWqZgl7/8EW9WJD/RD2QFGVldfumOdtIeBmi8HhTwkWmryuIwvqExeNMUii4xMoGLPzpXHxrR5RYWhmqm56JX1BdvHlkj9WuTXOxw6gqNJ2PwuYaChkHWrtDnSgOp9UKjUJRvLZijJCi3HuxRTW4dU8PUJKenXwLAU2YWC0JS31+aIC/m1V7PgWNJavGYp7m2SFauHQtI8iW76P4lXL5MbI0tCo+j3EYIGbVHckqvYgipzqs4mF82VBdnOV9lvWbw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a5d67fe2-f74f-4f5b-5782-08df17e20667
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 13:12:44.9372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w09nNkP9Y71Yzn9zYTvH4zsuQfje5XcQqB27I1mQ9Geon5jGOzO4bfuLV2XWXMLV2C3S5ExtZQ5RGY9vbtxbSpJfLhLRHFZwEpvBobRNz4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN7PR11MB735815
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
> Now that the CPU is always used for binds even in jobs, CPU bind jobs
> can pass GPU jobs in the same exec queue resulting dma-fences signaling
> out-of-order. Use a dedicated exec queue for binds issued from page
> faults to avoid ordering issues and avoid blocking kernel binds on
> unrelated copies / clears.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Link: https://patch.msgid.link/20260228013501.106680-13-matthew.brost@intel.com
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>   drivers/gpu/drm/xe/xe_migrate.c | 47 ++++++++++++++++++++++++++++++---
>   drivers/gpu/drm/xe/xe_migrate.h |  1 +
>   drivers/gpu/drm/xe/xe_vm.c      | 17 +++++++-----
>   3 files changed, 55 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 53160c2c35a6..ba8e195afcc8 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -51,6 +51,8 @@
>   struct xe_migrate {
>   	/** @q: Default exec queue used for migration */
>   	struct xe_exec_queue *q;
> +	/** @bind_q: Default exec queue used for binds */
> +	struct xe_exec_queue *bind_q;
>   	/** @tile: Backpointer to the tile this struct xe_migrate belongs to. */
>   	struct xe_tile *tile;
>   	/** @job_mutex: Timeline mutex for @eng. */
> @@ -115,6 +117,7 @@ static void xe_migrate_fini(void *arg)
>   	mutex_destroy(&m->job_mutex);
>   	xe_vm_close_and_put(m->q->vm);
>   	xe_exec_queue_put(m->q);
> +	xe_exec_queue_put(m->bind_q);
>   }
>   
>   static inline u16 xe_migrate_pat_index(struct xe_device *xe,
> @@ -504,6 +507,15 @@ int xe_migrate_init(struct xe_migrate *m)
>   			goto err_out;
>   		}
>   
> +		m->bind_q = xe_exec_queue_create(xe, vm, logical_mask, 1, hwe0,
> +						 EXEC_QUEUE_FLAG_KERNEL |
> +						 EXEC_QUEUE_FLAG_HIGH_PRIORITY |
> +						 EXEC_QUEUE_FLAG_MIGRATE, 0);
> +		if (IS_ERR(m->bind_q)) {
> +			err = PTR_ERR(m->bind_q);
> +			goto err_out;
> +		}
> +
>   		/*
>   		 * XXX: Currently only reserving 1 (likely slow) BCS instance on
>   		 * PVC, may want to revisit if performance is needed.
> @@ -514,6 +526,15 @@ int xe_migrate_init(struct xe_migrate *m)
>   					    EXEC_QUEUE_FLAG_MIGRATE |
>   					    EXEC_QUEUE_FLAG_LOW_LATENCY, 0);
>   	} else {
> +		m->bind_q = xe_exec_queue_create_class(xe, primary_gt, vm,
> +						       XE_ENGINE_CLASS_COPY,
> +						       EXEC_QUEUE_FLAG_KERNEL |
> +						       EXEC_QUEUE_FLAG_MIGRATE, 0);
> +		if (IS_ERR(m->bind_q)) {
> +			err = PTR_ERR(m->bind_q);
> +			goto err_out;
> +		}
> +
>   		m->q = xe_exec_queue_create_class(xe, primary_gt, vm,
>   						  XE_ENGINE_CLASS_COPY,
>   						  EXEC_QUEUE_FLAG_KERNEL |
> @@ -549,6 +570,8 @@ int xe_migrate_init(struct xe_migrate *m)
>   	return err;
>   
>   err_out:
> +	if (!IS_ERR_OR_NULL(m->bind_q))
> +		xe_exec_queue_put(m->bind_q);
>   	xe_vm_close_and_put(vm);
>   	return err;
>   
> @@ -1505,6 +1528,17 @@ static u32 blt_mem_set_cmd_len(struct xe_device *xe)
>   	return 7;
>   }
>   
> +/**
> + * xe_get_migrate_bind_queue() - Get the bind queue from migrate context.
> + * @migrate: Migrate context.
> + *
> + * Return: Pointer to bind queue on success, error on failure
> + */
> +struct xe_exec_queue *xe_migrate_bind_queue(struct xe_migrate *migrate)
> +{
> +	return migrate->bind_q;
> +}
> +
>   static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>   				 u32 size, u32 pitch)
>   {
> @@ -1892,6 +1926,11 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
>   	return dma_fence_get_stub();
>   }
>   
> +static bool is_migrate_queue(struct xe_migrate *m, struct xe_exec_queue *q)
> +{
> +	return m->bind_q == q;
> +}
> +
>   static struct dma_fence *
>   __xe_migrate_update_pgtables(struct xe_migrate *m,
>   			     struct xe_migrate_pt_update *pt_update,
> @@ -1909,7 +1948,7 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
>   	u32 num_updates = 0, current_update = 0;
>   	u64 addr;
>   	int err = 0;
> -	bool is_migrate = pt_update_ops->q == m->q;
> +	bool is_migrate = is_migrate_queue(m, pt_update_ops->q);
>   	bool usm = is_migrate && xe->info.has_usm;
>   
>   	for (i = 0; i < pt_update_ops->num_ops; ++i) {
> @@ -2631,7 +2670,7 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
>    */
>   void xe_migrate_job_lock(struct xe_migrate *m, struct xe_exec_queue *q)
>   {
> -	bool is_migrate = q == m->q;
> +	bool is_migrate = is_migrate_queue(m, q);
>   
>   	if (is_migrate)
>   		mutex_lock(&m->job_mutex);
> @@ -2649,7 +2688,7 @@ void xe_migrate_job_lock(struct xe_migrate *m, struct xe_exec_queue *q)
>    */
>   void xe_migrate_job_unlock(struct xe_migrate *m, struct xe_exec_queue *q)
>   {
> -	bool is_migrate = q == m->q;
> +	bool is_migrate = is_migrate_queue(m, q);
>   
>   	if (is_migrate)
>   		mutex_unlock(&m->job_mutex);
> @@ -2666,7 +2705,7 @@ void xe_migrate_job_lock_assert(struct xe_exec_queue *q)
>   {
>   	struct xe_migrate *m = gt_to_tile(q->gt)->migrate;
>   
> -	xe_gt_assert(q->gt, q == m->q);
> +	xe_gt_assert(q->gt, q == m->bind_q);
>   	lockdep_assert_held(&m->job_mutex);
>   }
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index 04ef20692b6a..7a824654cb72 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -146,6 +146,7 @@ void xe_migrate_ccs_rw_copy_clear(struct xe_bo *src_bo,
>   
>   struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate);
>   struct xe_exec_queue *xe_migrate_exec_queue(struct xe_migrate *migrate);
> +struct xe_exec_queue *xe_migrate_bind_queue(struct xe_migrate *migrate);
>   struct dma_fence *xe_migrate_vram_copy_chunk(struct xe_bo *vram_bo, u64 vram_offset,
>   					     struct xe_bo *sysmem_bo, u64 sysmem_offset,
>   					     u64 size, enum xe_migrate_copy_dir dir);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 2737bd25f39a..13e984ac4e4f 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -795,7 +795,9 @@ int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
>   	struct xe_vma *vma, *next;
>   	struct xe_vma_ops vops;
>   	struct xe_vma_op *op, *next_op;
> -	int err, i;
> +	struct xe_tile *tile;
> +	u8 id;
> +	int err;
>   
>   	lockdep_assert_held(&vm->lock);
>   	if ((xe_vm_in_lr_mode(vm) && !rebind_worker) ||
> @@ -803,8 +805,11 @@ int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
>   		return 0;
>   
>   	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
> -	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
> -		vops.pt_update_ops[i].wait_vm_bookkeep = true;
> +	for_each_tile(tile, vm->xe, id) {
> +		vops.pt_update_ops[id].wait_vm_bookkeep = true;
> +		vops.pt_update_ops[id].q =
> +			xe_migrate_bind_queue(tile->migrate);
> +	}
>   
>   	xe_vm_assert_held(vm);
>   	list_for_each_entry(vma, &vm->rebind_list, combined_links.rebind) {
> @@ -862,7 +867,7 @@ struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma, u8 tile_ma
>   	for_each_tile(tile, vm->xe, id) {
>   		vops.pt_update_ops[id].wait_vm_bookkeep = true;
>   		vops.pt_update_ops[tile->id].q =
> -			xe_migrate_exec_queue(tile->migrate);
> +			xe_migrate_bind_queue(tile->migrate);
>   	}
>   
>   	err = xe_vm_ops_add_rebind(&vops, vma, tile_mask);
> @@ -954,7 +959,7 @@ struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
>   	for_each_tile(tile, vm->xe, id) {
>   		vops.pt_update_ops[id].wait_vm_bookkeep = true;
>   		vops.pt_update_ops[tile->id].q =
> -			xe_migrate_exec_queue(tile->migrate);
> +			xe_migrate_bind_queue(tile->migrate);
>   	}
>   
>   	err = xe_vm_ops_add_range_rebind(&vops, vma, range, tile_mask);
> @@ -1038,7 +1043,7 @@ struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
>   	for_each_tile(tile, vm->xe, id) {
>   		vops.pt_update_ops[id].wait_vm_bookkeep = true;
>   		vops.pt_update_ops[tile->id].q =
> -			xe_migrate_exec_queue(tile->migrate);
> +			xe_migrate_bind_queue(tile->migrate);
>   	}

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>


>   
>   	err = xe_vm_ops_add_range_unbind(&vops, range);

