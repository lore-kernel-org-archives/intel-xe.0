Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FA0CAC5B0
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 07:43:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5018D10E3A8;
	Mon, 29 Sep 2025 07:43:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RcIDJm8r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D8F10E3A8
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 07:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759131785; x=1790667785;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=HqDnXbVfQhJPmBe9cXshXgLQpSJBsYXvZBa+3JLb1BM=;
 b=RcIDJm8r38ROSBP2FHUekzhjpXKKpKglYCsmor8zZLozfmu5YK0dYq/e
 xr/ml2cIj3ULINZdSS+4IbXzw+bYwuZ7SJEryjt3qKD1ZBoaGf8MfgbKp
 wwAJ/rQNDjydm+pPRfQo8x+PQLomMxqzl5xiErRtIRDDK0573kVDcipbe
 8ELEJ9ru/EpGoXfDkJTrEJCqRtLAL97zYukxxzB4xXdMW1xLOoVchTFar
 HiiqnC3IgR0THpVEHm0ljpWoEW9JjgiCprsGWxEN2WoKQQo1VwzheAFVE
 bw+63DxlTfgM3pplfZgJnGORdlcE3Y/sArQ72OmpsSlpv2ilbacXgSJ72 w==;
X-CSE-ConnectionGUID: 4GcknnLMTe+Tk1WqPjknnA==
X-CSE-MsgGUID: YmZhgj73S+KiwxSQeFOYaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="71614109"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="71614109"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 00:43:04 -0700
X-CSE-ConnectionGUID: W77yO6sYQuKFuTAfrciG7Q==
X-CSE-MsgGUID: hr7BBpKqRtqIrj0U8ZAqYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="178593518"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 00:43:03 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 00:43:02 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 00:43:02 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.31) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 00:43:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y7+Z0TPJ4XYm3D/CD4oACfC11Ff91iHDImtGIEVaE3sVlryhVoekhNPTxGkRGRPPsVs1oK/P+aXTnpJZjf+P7j4flGWV2ft24xELf6VVlWP3qVRN9ZZbHkxS9j3NL1Xhd/SAIfYkqFDuoxqpUUMo56XZH9I7rJhOBZddPHZBiCPpnqE+ViJPnVmnJVCxqFKDUNBCiJBTeQyojZ65NnmgMPbBYu8uYtmm4E5vjQ9U8Gd/SmXtqgtAPy8yMAAXtX6uGc4RrTFu4LJeqJaphvtoc310ee4Dni2OEGKQ0piZy8hB5plnIXeOSC1/sFXaP4g7/8vKl1DrcdaZYz/JffAXLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oCke1KUmA+w9hA1PpLlqo2WymDQmk99bL0eBnXBRm1Y=;
 b=MSMr5+6BD2aNyz91FnEY+NYyUnLF5bCpzxf+5360nLF3nEtP+S+feos/yFZsOhyk39zEpq6iR4pKDmqxGhHdI9pWkMt6fHU6mYo4fh1DTZJeWBzQt4pvjawtuup9790oLtxhBCQzQhcWrpC2QZ4hRDu2Gy2PUxZu3xhEucOs/EyWJCYGT0NwkSV1jf1dizUNP6RMGHX0OUV+kl2zXLrmhYVmKhuhipBiqKF/lpsSQz7RpM0JjKIKejvSWnkSlB8HB5jFcuqqStQlLnJqX7Aj9oq3KHzLwBeGSM+0dyBYmdu5DM4FcrsR4FqOAeYw7t4WZ8wjYKxjqwQeGkfxFg2/Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CY8PR11MB6891.namprd11.prod.outlook.com (2603:10b6:930:5c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.15; Mon, 29 Sep
 2025 07:43:00 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 07:43:00 +0000
Message-ID: <ff5ee0cb-05fe-4e82-9994-589bf279d302@intel.com>
Date: Mon, 29 Sep 2025 09:42:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/36] drm/xe/vf: Lock querying GGTT config during
 driver init
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
 <20250929025542.1486303-3-matthew.brost@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250929025542.1486303-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0009.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::6) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CY8PR11MB6891:EE_
X-MS-Office365-Filtering-Correlation-Id: dbc4347e-6d5c-4e20-8fcd-08ddff2bd03b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZkJyNlRYMVZWcXB5ZndBNkcweGpLN1RITTJiUCszL2hzM0VtVjNiNVdQNmkw?=
 =?utf-8?B?emJURXRvemNKMjc4by9BVkl2RnppbkNnMUZPeFlDNDFwUWhsRlpCdWsrYkRU?=
 =?utf-8?B?cFJLM3Qvd2M4S21Wd0NZVE04alJrQi8xSmxmNUVldm45OU1ud1F3cU1oQkc2?=
 =?utf-8?B?Z3ZpTTdlcmpzOXZjOWkybUd1LzJNaGtuU29nMXQ5NHRYdjBXa3VqRm05cXZC?=
 =?utf-8?B?Z0gxT29NUHBwcjRQSVYyWkhXWm5vUk01cmlnekJBVEdseHQ0WVdzaEVrRXgw?=
 =?utf-8?B?ZDBKVFlLS1cwVTJKQncxSUtKOXZ2d0hsR1dkVW9tOEVkVWZ2YjRra3JQcmNX?=
 =?utf-8?B?YUJJVkE4UVg1WmgyMHNaSVZiMVZLVGNPeDI1STRkRWNjTi9mdTMvR2VmVlQ4?=
 =?utf-8?B?MXhJTHprQXpmNjdhbXVUbTBqMGgrWUpXdTNPeUlmcUM2bWpIaXhra0lmdlpm?=
 =?utf-8?B?VzJKUW9tbElHU1hvazIwSTc0bS9FY2s3R1p3UjdaSVdGYzZ3d3JBRW9NRjhX?=
 =?utf-8?B?dk05TklRanZ2empkbjc5ZU9QUS9hdzVrVWdEcTFUckM0MkRBc1JoYjBBdGJo?=
 =?utf-8?B?NzFyaDZTN3ZCQmcwNXZjalFMYjVsVHhieExRdVBMdk5EN0IwemxSUTV1MHpR?=
 =?utf-8?B?RWxuOE40Sk04UWNCUmVsRFFCaytwOWdZeE1TQndZWW5WQnpCRGFxUVF5QkVt?=
 =?utf-8?B?V1cwNFNxeVBwRVlDbVdXTWlGVTNzcHY2WngydG9uaXV6WnBmczZpd2dQazY1?=
 =?utf-8?B?V0g5c1RLL2o3bHF3TmRxNllrZ1VVRXpZNmkwQnNHT0RZL1F2dGE5SjBDQmdF?=
 =?utf-8?B?RHhIOENweFFDVGxaZyt0MkdDdGh1ZnlNbmV0VEpUMnRQOFRnN01HUThVTUlD?=
 =?utf-8?B?VENreExWenFBVXlqQTZHZ3JHSUlzUklMME5jTUlacTVmei9pOVoxbEc0SDJX?=
 =?utf-8?B?Z3BkTEg5SnhMWGtuWnhvcDFqSVZhcERqU3E2MXZ5cnlIa2tiand0L0tOWDhY?=
 =?utf-8?B?SSt1a2pSaG1PZWtMeStyNStzdXJacGJkZnRTRU9hV0lacUtua0FpOW5SVHFC?=
 =?utf-8?B?VGgrRm1SS3JXcS9JRWdyS2tSK3FNTnRnS2RKU0pkcUJ5Ym9UaHlxcTBQMVZ6?=
 =?utf-8?B?eWVUQ1d2Z3B0WnJWUkNUWHRyL1BBbWlWTUpzbGMySDBOMDJVZkRTeEs1Znc4?=
 =?utf-8?B?L2FKS3I5SU9xeFlWaU9qSFZUM0haelhGWEw2Qi95Z3ZBUFpmeWdkK243ek5p?=
 =?utf-8?B?VVIzdTNPZW5KWk5Ma25XclRhK0xudzlHSzJRdGgxbjE3bHpibDNEZm54M3VP?=
 =?utf-8?B?OEtLMURsbExuVVJTWVJDTzBvU01qV1VOek1hRHdtZ1kwS2s4YnczQThkTFFM?=
 =?utf-8?B?aUV6SHNQRFErZmpMR2JoYmpYWjNsb3RDemNaeXVWZXdYc1huSzg4eW45c2ZW?=
 =?utf-8?B?MjBkclJsaTZsSjl6NUI2TjJmWWJnNmhlSEgzMHBVZkRPd2xZWnBWTHdQUVVT?=
 =?utf-8?B?ZDR6MzRvVTBzOW5SOUFNYUFBZlBydFV4bHZDK1U1OU1NZWw5NE9DeWRHeG5M?=
 =?utf-8?B?U1VjZmdrUkZGd1F6d2c5UmNsUHZWZDBRbWZhTVRPUUdxTUttVGlaY1JGdUE3?=
 =?utf-8?B?SDdZVzVEZDVwNVAxQ3BBdXJLQjNObXpvanZPMXZ5Z3VXR29FS3dic00vaUlJ?=
 =?utf-8?B?OEJjbmtoL3diMXV2c3FidXVvSmlyaDVnYm5ZNzhNNDdTV2hBSEQ0N2JkLy9p?=
 =?utf-8?B?anhkQlVHZmlrTDNxOU9DTHJkS1lGQk5JNmVzTnJGR0VNbkFKdkV3YjNWUDFy?=
 =?utf-8?B?Ukk0Mkx6Y1pnanhPelRNenBGdktwWXJSRE0rWEFsRHRrc2pxSmRwc3BsbWgw?=
 =?utf-8?B?cmFMRkVnRWZZK2U2Mkd2YW5ET3Y2SEJoMnUzeDVEWGtTMGc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TW11bWVjWk4xT0ZqYlUxcG0rUnJnVmR4eklVR2hWNVRCenpReEgxYWVGSGo0?=
 =?utf-8?B?S1R1Rlo1SkhRTTU5dnhsRW00Uk5ZOEJRZXhmSnkyZjNob0QrbWRKWEc3U1Mv?=
 =?utf-8?B?MFNCQitrblh0VDlzdTdLcVpCVWRxMzZhd09DNWMwRFd3OWRCSW95VEp3SGlY?=
 =?utf-8?B?THVpelZGcWdkUGMwV0tDQ3huMkhoL01QSmtqSTlWY0FsSlR2cEZ1Zm5LOVRz?=
 =?utf-8?B?dUdTMUpmNzlFTUorVmVTMy9KMVNHTE1aNVFOb21LZ3ZibTE5My9sNEZ5UnI3?=
 =?utf-8?B?L2NrU2hGYlFGZ0FQUzNGTVZXdGpOb0ZhQVU1TDBGNGdiSmRicmVwZi9OdnZJ?=
 =?utf-8?B?R1ZmZ0FFdFdyaytFWk1tY2FmUUpDZC9Ra0JnY2YybUVyS0VDcmlEeGFBNndF?=
 =?utf-8?B?L0h2eCt4cnMxWFVwSkdLL21pVko3aFFWT1QzbnB4M2l6QllLOTMrZm1GNVpa?=
 =?utf-8?B?VnlOOW5yamFGbXZEY1NxempiWVZ0RXI3d3ovbEJJR3crcGRVVzd1aHB5a1FO?=
 =?utf-8?B?b0JJdkF5cTJZVjMwbHVwNEs4Tm9jTkFRbDgyTGJReU8vWE1GeW9qa2c0YTBV?=
 =?utf-8?B?TWVGSURBSFI5YnQxM2RYZEoxUVZ1bExhZVJmaThNZ05lSDltdGVORWlteDUr?=
 =?utf-8?B?eGV4d1JVSmhzUEpuNHJ6QkVFQ1JUQWlld0s5ZE1oSXdOblpwaHhTcXVTaG10?=
 =?utf-8?B?R1d4VUpKWTlzd0dudzd4WFBmMUZDR1ZteXlJUVlwOExwYnJzaXR0VElmRyt0?=
 =?utf-8?B?QVo4YW9jY1lidEM0MVFSQnpRd0ZhYVc1aWFDcDRveDNtSDJnM09aR0U0SzYw?=
 =?utf-8?B?Wm1yQVhid3NtMEV1ZjNvMEpNTFBuOUhLVzl5MGlmcS9LSDJudFE5VWFlRHht?=
 =?utf-8?B?VEtrVWVSQXE0M3l6dkNLaVR2SkF1TXAvdmFNTXIvbmlPa2Z5dDlOOWx1STFp?=
 =?utf-8?B?MGF2WENJdTBsWnQrZ1VKSElIWjlTQ3FQTlBFMkNhaHAxcHNqS1BxL3IwUXoz?=
 =?utf-8?B?cVkzM0dTbU5WaXlqcGNPMkJHdi9nd3c5NWxyMTBlaGk3TUhxbkUyUkFnNU5S?=
 =?utf-8?B?c0dhNzB6cE9ZRGJWdE1QNlUxbk1LV0cyQWp2QUhmS2JDMFN6eHdUa3F6Q1Ax?=
 =?utf-8?B?UDhiQ1dRdVZCZlpqbTVndk9BWC84ZHdxRVp5MnBBcExtWHcvNU5uTDkwZUVC?=
 =?utf-8?B?YWhYUmIrbk50Y0doT1hwd0Z0WGhGMGlOVHdHb1R0UVJtRlJtOTBSTThmanZa?=
 =?utf-8?B?aVEzVHQ5VGVIMjMrZmpYS3phZnR6Tk9VV1VXM040QldFTjh5U0FZY3ZKSTdB?=
 =?utf-8?B?OG9rVU1CeXU0Ylh0MVFrSXJ6K1EzVXlrRENMVWRpTXdtZCs1d25YUmY3OEM3?=
 =?utf-8?B?d1djU0pxbzdlUllHMDlpMUMrL3V5aGJmbWRVbDYvQ0VCWnNLekZ5MGkzWFo2?=
 =?utf-8?B?Z1dzK1lkUithQjNTN0gyV0V3a2RzR1greElBVWlQTCticC9MbDQ2SFhuN284?=
 =?utf-8?B?cnlwZXozZllldE1zd2ZXTXFIVDhESGl4M1Qra0tqSkg5SlJkSzJTVDVpdGdr?=
 =?utf-8?B?U0Z4UzRQdVlkMmFydDdReG5VQ3J3RWpEcVA1cXNPa1ZmeVJDVDdyQzdZTUtH?=
 =?utf-8?B?ZmM4V0dBS0lqYW84cmFVcXQvOG5aRWx0M0lCS2NRWmNmaHhOSDN3L29UcGJn?=
 =?utf-8?B?aGdLYjhReDUvVUpiSHFKbjhuNGdtMlZlZlZQSnEzUjZlVmo5RXpaVkphakpZ?=
 =?utf-8?B?M1YvZlZJdkZkMkR3WHpYOGk3S05ZYnVZZHV5NGRZV2ZPbUJJVkJoQUludUV4?=
 =?utf-8?B?S1IyRzhMQVZHeHBpNGRjbmdrRkxDNWE0NStjN0M2anY4K0M3Ujl4bTRYTzhP?=
 =?utf-8?B?RmwrZmJPaFV2Y2YvQVpHK0czTFQvOXRGK1M2K0xQMEtRK3RjS1RtMWtXaTU0?=
 =?utf-8?B?RmYvSXNqeFRSQmlYR0xDNGRjc0YweHpQQnVxUnp0ekNJeGtKY2NySm5qWTgw?=
 =?utf-8?B?dFFQaXdybmJOTXNCQmJaVUNMTHVuVlhCd0Z4MWZiOWFUa2hQUjVCemkrdG5q?=
 =?utf-8?B?RjlwZzF5K25TUVYveTNyNXFzVjVwdmwwRzR5Y1RaeXZ4dFZ3N3VMM21RRjFF?=
 =?utf-8?B?TkdkdmdaclJDV1c0ZkN0cjVaNUVrVVp0TndBOTBDNDZjUzRoaEFXMkx6dHUy?=
 =?utf-8?B?d2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dbc4347e-6d5c-4e20-8fcd-08ddff2bd03b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 07:43:00.0807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gVfPdZ7xMCeT7G0iHTGIlw+SDknqMGqKtXcwUW3X09iLnIay14ia5WfU/ZuOfR8eKANO42ujdTZGPsJigLLCbq8XUEfgVqoGcPurVBd+ibY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6891
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



On 9/29/2025 4:55 AM, Matthew Brost wrote:
> From: Tomasz Lis <tomasz.lis@intel.com>
> 
> Protect access to GGTT config as this is non-static information.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 96 ++++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  3 +
>  drivers/gpu/drm/xe/xe_sriov_vf.c          |  6 ++
>  3 files changed, 84 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 0461d5513487..016c867e5e2b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -440,18 +440,21 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  
> +	down_write(&config->lock);
> +

still didn't get answer to my earlier question [1]

[1] https://patchwork.freedesktop.org/patch/676375/?series=154627&rev=2#comment_1240924

>  	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_START_KEY, &start);
>  	if (unlikely(err))
> -		return err;
> +		goto out;
>  
>  	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_SIZE_KEY, &size);
>  	if (unlikely(err))
> -		return err;
> +		goto out;
>  
>  	if (config->ggtt_size && config->ggtt_size != size) {
>  		xe_gt_sriov_err(gt, "Unexpected GGTT reassignment: %lluK != %lluK\n",
>  				size / SZ_1K, config->ggtt_size / SZ_1K);
> -		return -EREMCHG;
> +		err = -EREMCHG;
> +		goto out;
>  	}
>  
>  	xe_gt_sriov_dbg_verbose(gt, "GGTT %#llx-%#llx = %lluK\n",
> @@ -460,8 +463,11 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>  	config->ggtt_shift = start - (s64)config->ggtt_base;
>  	config->ggtt_base = start;
>  	config->ggtt_size = size;
> +	err = config->ggtt_size ? 0 : -ENODATA;
>  
> -	return config->ggtt_size ? 0 : -ENODATA;
> +out:
> +	up_write(&config->lock);
> +	return err;
>  }
>  
>  static int vf_get_lmem_info(struct xe_gt *gt)
> @@ -474,22 +480,28 @@ static int vf_get_lmem_info(struct xe_gt *gt)
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  
> +	down_write(&config->lock);
> +

also, commit message says "Protect access to GGTT config "
while the patch seems to apply locking to the whole config ...

what's the rationale to extend this protection?
just unification?

>  	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_LMEM_SIZE_KEY, &size);
>  	if (unlikely(err))
> -		return err;
> +		goto out;
>  
>  	if (config->lmem_size && config->lmem_size != size) {
>  		xe_gt_sriov_err(gt, "Unexpected LMEM reassignment: %lluM != %lluM\n",
>  				size / SZ_1M, config->lmem_size / SZ_1M);
> -		return -EREMCHG;
> +		err = -EREMCHG;
> +		goto out;
>  	}
>  
>  	string_get_size(size, 1, STRING_UNITS_2, size_str, sizeof(size_str));
>  	xe_gt_sriov_dbg_verbose(gt, "LMEM %lluM %s\n", size / SZ_1M, size_str);
>  
>  	config->lmem_size = size;
> +	err = config->lmem_size ? 0 : -ENODATA;
>  
> -	return config->lmem_size ? 0 : -ENODATA;
> +out:
> +	up_write(&config->lock);
> +	return err;
>  }
>  
>  static int vf_get_submission_cfg(struct xe_gt *gt)
> @@ -501,23 +513,27 @@ static int vf_get_submission_cfg(struct xe_gt *gt)
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  
> +	down_write(&config->lock);
> +
>  	err = guc_action_query_single_klv32(guc, GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY, &num_ctxs);
>  	if (unlikely(err))
> -		return err;
> +		goto out;
>  
>  	err = guc_action_query_single_klv32(guc, GUC_KLV_VF_CFG_NUM_DOORBELLS_KEY, &num_dbs);
>  	if (unlikely(err))
> -		return err;
> +		goto out;
>  
>  	if (config->num_ctxs && config->num_ctxs != num_ctxs) {
>  		xe_gt_sriov_err(gt, "Unexpected CTXs reassignment: %u != %u\n",
>  				num_ctxs, config->num_ctxs);
> -		return -EREMCHG;
> +		err = -EREMCHG;
> +		goto out;
>  	}
>  	if (config->num_dbs && config->num_dbs != num_dbs) {
>  		xe_gt_sriov_err(gt, "Unexpected DBs reassignment: %u != %u\n",
>  				num_dbs, config->num_dbs);
> -		return -EREMCHG;
> +		err = -EREMCHG;
> +		goto out;
>  	}
>  
>  	xe_gt_sriov_dbg_verbose(gt, "CTXs %u DBs %u\n", num_ctxs, num_dbs);
> @@ -525,7 +541,11 @@ static int vf_get_submission_cfg(struct xe_gt *gt)
>  	config->num_ctxs = num_ctxs;
>  	config->num_dbs = num_dbs;
>  
> -	return config->num_ctxs ? 0 : -ENODATA;
> +	err = config->num_ctxs ? 0 : -ENODATA;
> +
> +out:
> +	up_write(&config->lock);
> +	return err;
>  }
>  
>  static void vf_cache_gmdid(struct xe_gt *gt)
> @@ -579,11 +599,18 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
>   */
>  u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
>  {
> +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> +	u16 val;
> +
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> -	xe_gt_assert(gt, gt->sriov.vf.self_config.num_ctxs);
>  
> -	return gt->sriov.vf.self_config.num_ctxs;
> +	down_read(&config->lock);
> +	xe_gt_assert(gt, config->num_ctxs);
> +	val = config->num_ctxs;
> +	up_read(&config->lock);
> +
> +	return val;
>  }
>  
>  /**
> @@ -596,11 +623,18 @@ u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
>   */
>  u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
>  {
> +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> +	u64 val;
> +
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> -	xe_gt_assert(gt, gt->sriov.vf.self_config.lmem_size);
>  
> -	return gt->sriov.vf.self_config.lmem_size;
> +	down_read(&config->lock);
> +	xe_gt_assert(gt, config->lmem_size);
> +	val = config->lmem_size;
> +	up_read(&config->lock);
> +
> +	return val;
>  }
>  
>  /**
> @@ -613,11 +647,17 @@ u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
>   */
>  u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt)
>  {
> +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> +	u64 val;
> +
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> -	xe_gt_assert(gt, gt->sriov.vf.self_config.ggtt_size);
>  
> -	return gt->sriov.vf.self_config.ggtt_size;
> +	down_read(&config->lock);
> +	val = config->ggtt_size;
> +	up_read(&config->lock);
> +
> +	return val;
>  }
>  
>  /**
> @@ -630,11 +670,18 @@ u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt)
>   */
>  u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt)
>  {
> +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> +	u64 val;
> +
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> -	xe_gt_assert(gt, gt->sriov.vf.self_config.ggtt_size);
>  
> -	return gt->sriov.vf.self_config.ggtt_base;
> +	down_read(&config->lock);
> +	xe_gt_assert(gt, config->ggtt_size);
> +	val = config->ggtt_base;
> +	up_read(&config->lock);
> +
> +	return val;
>  }
>  
>  /**
> @@ -648,11 +695,16 @@ u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt)
>  s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt)
>  {
>  	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> +	s64 val;
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  	xe_gt_assert(gt, xe_gt_is_main_type(gt));
>  
> -	return config->ggtt_shift;
> +	down_read(&config->lock);
> +	val = config->ggtt_shift;
> +	up_read(&config->lock);
> +
> +	return val;
>  }
>  
>  static int relay_action_handshake(struct xe_gt *gt, u32 *major, u32 *minor)
> @@ -1044,6 +1096,7 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  
> +	down_read(&config->lock);
>  	drm_printf(p, "GGTT range:\t%#llx-%#llx\n",
>  		   config->ggtt_base,
>  		   config->ggtt_base + config->ggtt_size - 1);
> @@ -1060,6 +1113,7 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
>  
>  	drm_printf(p, "GuC contexts:\t%u\n", config->num_ctxs);
>  	drm_printf(p, "GuC doorbells:\t%u\n", config->num_dbs);
> +	up_read(&config->lock);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index 298dedf4b009..d95857bd789b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -6,6 +6,7 @@
>  #ifndef _XE_GT_SRIOV_VF_TYPES_H_
>  #define _XE_GT_SRIOV_VF_TYPES_H_
>  
> +#include <linux/rwsem.h>
>  #include <linux/types.h>
>  #include "xe_uc_fw_types.h"
>  
> @@ -25,6 +26,8 @@ struct xe_gt_sriov_vf_selfconfig {
>  	u16 num_ctxs;
>  	/** @num_dbs: assigned number of GuC doorbells IDs. */
>  	u16 num_dbs;
> +	/** @lock: lock for protecting access to all selfconfig fields. */
> +	struct rw_semaphore lock;
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index cdd9f8e78b2a..d6e2ed9b9bbc 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -197,6 +197,12 @@ static void vf_migration_init_early(struct xe_device *xe)
>   */
>  void xe_sriov_vf_init_early(struct xe_device *xe)
>  {
> +	struct xe_gt *gt;
> +	unsigned int id;
> +
> +	for_each_gt(gt, xe, id)
> +		init_rwsem(&gt->sriov.vf.self_config.lock);

as before, this should be done in

	xe_gt_sriov_vf_init_early

> +
>  	vf_migration_init_early(xe);
>  }
>  

