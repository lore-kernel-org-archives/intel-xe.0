Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316A9CD4851
	for <intel-xe@archiver.kernel.org>; Thu, 14 May 2026 16:13:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB20B10E3BF;
	Thu, 14 May 2026 16:13:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gh3OpGCc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A85010E3BF
 for <intel-xe@lists.freedesktop.org>; Thu, 14 May 2026 16:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778775197; x=1810311197;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QQGaYGLQ4gqQMlxQZnm2EOpnionagM+n3Op2Ay8TnUM=;
 b=gh3OpGCcjmTix9Blgj1fNRO3uRQsH+34IIkAzN6F7vP2+oHw5fXwmxx4
 zE8+MVI9wsQc3mT9EqfNdEu6ckdvSn7O51KYkQgnn/TDo7XlMez+E/Al0
 3b61GL7Azoum0Q2dZoA260izdDgGgWbrs2KHM+tCHVxIQFUedla/ziOI8
 mGach0jczmcXShLmdq2i4zlF9Ca04oCuTLPUiKClZb3m5/lMwgHptSRTr
 HBplHTZxADTv/nY4n0ldID0Lwr7hdJH74+kdsvnmPFbBsm6QHmiXXNdJT
 gPZIjHrnlelj9Syft2oHxMM0YoL7QDtgbVbYP3wo6wiwGwWGH7LuIpDT9 g==;
X-CSE-ConnectionGUID: brw6pdo3StKsTLakyPhOqw==
X-CSE-MsgGUID: 92CuaZ/LQROmZpA3vxjuPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="97294262"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="97294262"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 09:13:17 -0700
X-CSE-ConnectionGUID: DLF2bJtBQLGCX5KaoDmzVQ==
X-CSE-MsgGUID: aDHRJeesRouSbBTwE1UuEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="233986543"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 09:13:16 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 09:13:16 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 14 May 2026 09:13:16 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.4) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 09:13:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j5jCyOvnjVX3HQw+hQD0BHyKCObrfmny+m1ah/guoiP2lGWc4bZ+a+3UImz6l33oB0ukIQ70UHpKG9aTQ5KCHTryaHxnYmcuVD1fKUR5lUrriXZJ9jDnQkqQuNKis1w6l0bFa/Op5XKJ0zG7816bM17msfuBLGlRleXas1dZCsy+gT8ct3SA6V0u033ApB6tZtjBLW/qCZ7e/0kqqGQHbex+bpd2IZOGWYGOVm8LtWNbwNouaD+cbRzImD8oXLrO+ygUtv93Mc3JMIDrCbTA2taf8pDcBoWojODPl6SYHNzW84pXWEY2h2eM/LTC7Hez+yOvQwvqoL2PgRgUf+auew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B8+JyDSE3pw1yZiT1jQvpezbnMt2qYtH6Rz8c4MX8UU=;
 b=NZYrrZDGwsh80Ect0JAN4RjaquTzr9YohMy9b/MyYd/6d4u+1OmnAUm1NApXt5au33ybMhWjpXUB/ZDpOF78vwf9vQXgSE8dmwlEH175qheEs8kUaZtFowNCAoS4PByN+i7QL5C15BtmFAzzjWSVqgDuGaKp4aH60oM51FmWGXUIPQuxdAW0RuPgn4jbQwN4Ot7DxDhPa6iXb6pr1VG1VMyjVgOkseFDmAi4dSUi+VOhuCYTIWnUnPyEOOkGrrlA0JVTfW6M1ebZMKkFOExNkK0zIylpJmtiQ8gmbNCabAd6ltjHjeftPkq5vnAewu0XT4xAnZG5rtWy2IMGl2OmwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ0PR11MB6669.namprd11.prod.outlook.com (2603:10b6:a03:449::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 16:13:09 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 16:13:05 +0000
Message-ID: <36005118-217b-45e1-83d0-a7503e0b51b5@intel.com>
Date: Thu, 14 May 2026 18:13:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pf: Fix CFI failure in debugfs access
To: "Meenakshisundaram, Mohanram" <mohanram.meenakshisundaram@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>
References: <20260514090352.1554803-1-mohanram.meenakshisundaram@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260514090352.1554803-1-mohanram.meenakshisundaram@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0112.eurprd04.prod.outlook.com
 (2603:10a6:803:64::47) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ0PR11MB6669:EE_
X-MS-Office365-Filtering-Correlation-Id: 9231c54b-3092-4060-a8f4-08deb1d3ae40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info: v0GAkcLuL3Qli9Uw1K2rc57uWQ3Np/NLFqT86dDAbxAldOprsNzGITFmjhK9NZSIeaGmiT5B3kI7ImkiMTJ9uVH1gR7/D8YUriQBm92FYGPdNhfxhJ/Yu5Ew4FMY1yhtzLVuZ1r50cavrlXzoBh/jdp5ISpwWBqZ/c0vlULpfyuxrIuvYJNncOTJ26hzVwHB2wAJUAgQlBk/qZwQNhwE1B5MP7+5itwy70yXAUidezmuplLA+WeA+w/TmtKcnic+TxABXFgsmDbZ7KUPjSr4/mFVYaKlG9sMHbkQ/Q36LHFLITrvOvQNZiOHwRivdezwosgSUBvdHnTjDu5hhfQ6HBS+2Eu7P0V+F6wNSGIbCLXtjIGn8yMylSynXvdUn6ZRiG53ZrhxhDy07Yg7RJ2XQujnoShjRYx0bAbLg7o6Bhu/Kf8ioIpDbu3p/Cgxzts8sa3i5RemYsN9RoHT5yOLQFU/WFjl9X5jM4w70ERw8Banh3KbX/1Pct+QoQmTzLgGPHRnT11xnpQh2cq/J+6rewPvxet5XOCvJ0yKLxpx+JtFvbinPiajMLQbcgf/WJ5iUF9Im72Xm95g6Cac7OEWz+v+EHHEUz0Dgy8rjTGl8ypbVPAr+sOp2UnPuIN84/iA5YEf2NPSci61vuN8AROqTw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWs3aWxKZWNySEp0VHNnYU9KMjlOU3J2WTJIcXdNV2xPUUFkVUtOdzh6T0lB?=
 =?utf-8?B?N3BPOFQ2dUM4NXE2SWdBWmF3bEMvL0V1QW01Mll2R3ZHRW1EYlZ0S3Bxc25n?=
 =?utf-8?B?NU9wUE5UQTZlRytNNGFSTHNKSHArQXJ5UE5kUHJFcm5kSFZKamFvRmY1aUxO?=
 =?utf-8?B?bURod0hwVDhZd09FVGNaRkVuRTg1SngxdTI1Rmd1c28zblJXMUdBTUJseEN3?=
 =?utf-8?B?SWVVODdqVlF2NTgvRWEzcEpUSVdYdTBrbUJnaXFYZkhlRnNnTnJ3czRPVzVy?=
 =?utf-8?B?aGlVMXNEK0w3cnRBTEFYd1VPcnJHSmdDRlIyMGsyODRFWkVzNUVMbWZjY0Y2?=
 =?utf-8?B?d1ZUdGRTS1BpazNXeDdackxyU25yMWlWdVprS3RwVWZMcWtBOVdadENDZjJv?=
 =?utf-8?B?RzNWVEZnSERJdkd2eGdQSXBuZGlpUXlVczYraUZVMU1FaVYxOUlCeHUwK3ZS?=
 =?utf-8?B?N2h2TFVHYzluU1Z4L1JGcHdrUDQyU2l1V05maUdrS011UXBtWEVSK1NmUllN?=
 =?utf-8?B?UUlPUlhHdmhnek5WSUZ1K2ZkTi9zckUxWUhibWxyelhva1FvUHF1UndndnBP?=
 =?utf-8?B?Ymh4Y3o3c0ZNWDVndWZ0OE9xdytEYXRaVG5OTElJUEdFL3JMOExrU0RoY0ZF?=
 =?utf-8?B?TDVtaU0rcFdCaVVsN2l2bG5uQlJOeE1FVmp3VExCd3NzaFU4bVdWM3VRc1dB?=
 =?utf-8?B?eDhKcGNJSjgzejUvQXVQZ2hyV3h3dzhJN1F4RnRrbkt0bkd1cmMrMURrYldP?=
 =?utf-8?B?Y1dGRXc0NEd3Y1lJWVFmRVliZ21YM29OdnVRZ29ENnZRNHVqUlYxWTR1dkV5?=
 =?utf-8?B?WWlCUkIwQXUzMDRBRlFEY0VFSmc5S3JWVW9UZWVoY0R4MWhDSlVQUGRrb3JS?=
 =?utf-8?B?am9YUHljdytNUDh1Qk8yblhEOXlMTFFIaDhwdzlCd1lCS1ByRElHK3JBQlRh?=
 =?utf-8?B?MTlIZmJ5OFIrZVRHK0VydlhlRHp3VkZHOERTbWg4ZVhhWUhYZjdQSjJKWDJl?=
 =?utf-8?B?ZXVDK3VCZ0I4OEhPeFFNSTZVeE5qVnhuU25pUHV3ZlhPNExnUjRmWnBkZDEv?=
 =?utf-8?B?L3hUaUwvU3llbm9tVWpVbDV6S0tIbWdpcllwR3d4dkl2S0EwOWJjbjNsVVBS?=
 =?utf-8?B?aVlYaW1Kb0F5bkNiZ3ZwV25vcGsvdDk0NXpWRnFmS28zM1F6WXQ4YnorbTZ0?=
 =?utf-8?B?WjRXUWNvQ3ExSGJWQmRDalJzd21YNW5qdnJ6eGZjVVovT1VYWFhaWkR5MTZr?=
 =?utf-8?B?VkVscVRqVmlzdkxWUFpnYVF5Y2tSVHlveW1GdkNVUjB2enRobW12SDFhMkdC?=
 =?utf-8?B?Rkxvc2JZbDduWU5teXZZbGt4b1h1WnNOSjJndTlMRlBmbHMzQ3NVY1lxOHRJ?=
 =?utf-8?B?M3RwS05IZDRERmE4R2N5c0N2ejdmbnJxWXJFZWY0SExTTDhKK08zYmNFdGd6?=
 =?utf-8?B?VWl0YVZaTEVpWEgwYzRQQ1M0d0Q1MDBmRHdYUjBhQlREc1Z3cUhMSUNIMmtB?=
 =?utf-8?B?ZGw3STd2UDhWUTNibWNETXdyS056Y2JFckIrSFN1UnJIU1ByTjZTbERzOUN2?=
 =?utf-8?B?L0JlVDE5QVJjNXk2dmJmczdZeC84MG9jWXRmb0FBOHZhVDBXbW9ySXFvMWRj?=
 =?utf-8?B?YlpXamI4cDlHR3J6ZTZveXRyU0FmQnN3d3BOQnU3VGF3a0R3QnRIWUNrVEdl?=
 =?utf-8?B?WjdQNmkxMFVSWElkUWhoLzdIdlEzd3UxL3czNVhjTGVGcmkwV2RBbGlra3Ix?=
 =?utf-8?B?SFU1aXVhZnd5UzN2VHRTSXcrNmU0VzhJT3RLWDVyM1RyZm5JeUtFSForcjJC?=
 =?utf-8?B?aS82MENydElLN1Zxc3N1dFB0SVdGVDhlcXVBMndqcWtZcjRaTWc5ODhFVGlC?=
 =?utf-8?B?bW5aZGEvejJHNGptbHJCWFdkclR6a092ZERGQW1VZC90YnZyT2creHN6SkQy?=
 =?utf-8?B?cXZORVJleHNkRWx5bHk3QSt2NXd1NFUxSS9pSTU2ZUR6VXhnSTBuR3FlVzdu?=
 =?utf-8?B?VEwzSDNWbHFIeXhHYU9oQlpHaWZmTC9rV1JjdVNlcWZuWklpclhtWmp5S0pH?=
 =?utf-8?B?QStoWGg4L2UrVnRUU2IzQk14ZCtLTFpvMmFseVNFakJFbHVrQktISkdiRW5O?=
 =?utf-8?B?Z0dmdTc4ZTBqdWU2bVArYm9uY3JlYmZ3VUdVaTMrUVQ0Z2gyTUJoVW9mWkxR?=
 =?utf-8?B?Q0VuK3pVY01OdExYRU9QenpZY0toZURJRnJiWWpQZ3hmWC9OZVFSK0xXVTRP?=
 =?utf-8?B?Q0dsT2lhdUVtUVNDd1R0YTIyaTBWZFBJbUtCMGxXZG11Zk5oTnJoTExCeUJ5?=
 =?utf-8?B?VE83NFI5MU1IRHBSbnNDNU1TeW9sTDZpejRLb3EyRzJiVEw2YkpNUFFFT1Qw?=
 =?utf-8?Q?pMg7rq2V3YBEfPxI=3D?=
X-Exchange-RoutingPolicyChecked: qgIdEwi4FC2faK0DxJQGtS3P1U0XHGSZf/SgtlJGRL/xUP8ylfVdk1rfXLLKvwUggo8qTF7yop6/5+rCuU4JDNOaF/4tP+uY3Kp1M3MGDM+VkomNG5MkUZOzBnXUolMgL/v5TwpEAQOWIBvxK5mYbxS0pIm8ec5LXLogYuFlW3JD5o58gKI8PDOd8OhXcMDh+x/F9r4bmcgTsboCxJ193ZeA+6AUX2HxyN96fyy6gU0Xb4O6+/c6gvwN+m9tY8jDEODs4+EC89X828ciZBwjIeaxbBwwuqcDXz9NcHXHo0v7vsRDDa2js5uGZeafXIRxVLSE7nqtgAVL4duq79IfGg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9231c54b-3092-4060-a8f4-08deb1d3ae40
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 16:13:05.4752 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H77Wvv4plqRecEs2HXciFQVOaxJLrxICfGfEazBDs1B//dHwtvMbH93odBOfl1fTKlGL3170qavkIBBRoZTtlGXflsDCy7/6s1aiwYl3VpA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6669
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



On 5/14/2026 11:03 AM, Meenakshisundaram, Mohanram wrote:
> Reading debugfs file (/sys/kernel/debug/dri/0/gt*/pf/adverse_events)
> with CFI (Control Flow Integrity) enabled, the kernel panics at
> xe_gt_debugfs_simple_show+0x82/0xc0.
> 
> xe_gt_debugfs_simple_show() declars a function pointer expecting int

typo: declars 

> return type, but xe_gt_sriov_pf_monitor_print_events() is void return
> type, leading to CFI failure and kernel panic.
> 
> [507620.973657] CFI failure at xe_gt_debugfs_simple_show+0x82/0xc0 [xe]
> (target: xe_gt_sriov_pf_monitor_print_events+0x0/0x130 [xe]; expected
> type: 0xd72c7139)
> [507620.975434] Oops: invalid opcode: 0000 [#1] SMP NOPTI
> [507620.976932] Tainted: [U]=USER, [O]=OOT_MODULE
> [507620.977871] RIP: 0010:xe_gt_debugfs_simple_show+0x82/0xc0 [xe]
> [507620.984760] Call Trace:
> [507620.985204]  ? __cfi___drm_printfn_seq_file+0x10/0x10
> [507620.985628]  ? __cfi___drm_puts_seq_file+0x10/0x10
> [507620.986008]  seq_read_iter+0x1de/0x550
> [507620.986323]  seq_read+0x134/0x170
> [507620.986608]  full_proxy_read+0x9a/0x150
> [507620.986939]  vfs_read+0xf0/0x390
> [507620.987228]  ksys_read+0x74/0x100
> [507620.987523]  do_syscall_64+0x61/0xf10
> [507620.987842]  ? arch_exit_to_user_mode_prepare+0x9/0xb0
> [507620.988243]  asm_fred_entrypoint_user+0x41/0x41
> [507620.988602] RIP: 0033:0x784a76af9d57

nit: likely we can trim (or remove) this splash

> 
> Fix xe_gt_sriov_pf_monitor_print_events() function by updating to return
> an int type.
> 
> Fixes: 335d62ade5fe ("drm/xe/pf: Track adverse events notifications from GuC")

maybe better is to use commit 1c99d3d3edab ("drm/xe/pf: Expose PF monitor details via debugfs")
as at that point this function was actually plugged into the debugfs

> 

remove extra line

> Signed-off-by: Meenakshisundaram, Mohanram <mohanram.meenakshisundaram@intel.com>

tools do not expect "," here
maybe try

  Signed-off-by: Mohanram Meenakshisundaram <mohanram.meenakshisundaram@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.c | 6 +++++-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.h | 2 +-
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.c
> index 7d532bded02a..49585d0d1dea 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.c
> @@ -114,8 +114,10 @@ int xe_gt_sriov_pf_monitor_process_guc2pf(struct xe_gt *gt, const u32 *msg, u32
>   * VFs with no events are not printed.
>   *
>   * This function can only be called on PF.
> + *
> + * Return: 0 on success

nit: "always 0" as currently there is no failure point

>   */
> -void xe_gt_sriov_pf_monitor_print_events(struct xe_gt *gt, struct drm_printer *p)
> +int xe_gt_sriov_pf_monitor_print_events(struct xe_gt *gt, struct drm_printer *p)
>  {
>  	unsigned int n, total_vfs = xe_gt_sriov_pf_get_totalvfs(gt);
>  	const struct xe_gt_sriov_monitor *data;
> @@ -144,4 +146,6 @@ void xe_gt_sriov_pf_monitor_print_events(struct xe_gt *gt, struct drm_printer *p
>  #undef __format
>  #undef __value
>  	}
> +
> +	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.h
> index 7ca9351a271b..0b8f088d3a16 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.h
> @@ -13,7 +13,7 @@ struct drm_printer;
>  struct xe_gt;
>  
>  void xe_gt_sriov_pf_monitor_flr(struct xe_gt *gt, u32 vfid);
> -void xe_gt_sriov_pf_monitor_print_events(struct xe_gt *gt, struct drm_printer *p);
> +int xe_gt_sriov_pf_monitor_print_events(struct xe_gt *gt, struct drm_printer *p);
>  
>  #ifdef CONFIG_PCI_IOV
>  int xe_gt_sriov_pf_monitor_process_guc2pf(struct xe_gt *gt, const u32 *msg, u32 len);

change itself looks good, thanks for fixing this!

Michal

Ps. it looks that some VF debugfs entries were also broken ;(
See https://patchwork.freedesktop.org/series/166583/


