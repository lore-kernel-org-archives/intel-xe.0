Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 959C2CF042D
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 01:27:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F1AE10E270;
	Wed,  9 Oct 2024 01:27:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ld++pR8h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF69810E270
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 01:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728437273; x=1759973273;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=qEnvG0AeDKgLg7TCJIISpOQ7z09NhCfN6EBqT6He1+E=;
 b=Ld++pR8hjekfI72201ESZr5dgBYak/wTF0Nz8m5UP6dYoikXTP8vhrM4
 XehfutJh4c5e2Xn1NlMGXDngCzWQH/WxgrXVcohTWkeVDGNMoCTn7qEZF
 aUzsHEb89ybVCtATWmx4UqsqDp6aWx7fFhqHCI2lo2Q4eemTKyJ7papiP
 i5u99RodQuEBvAzhVa+7PeDyWuEmDo8BC4CoqbUwoSawWqjUu3OpeFcDA
 Pep8CzjBh0XFTtpoCPsGIj/jf9gHhFupzBjY7tOZXg0Nzp3Z415/U+qSc
 vXFbN2+F5A9O0tuW0Tlgft7Tsmmtqd5hvWXQD5nOj2K66bzgJToxyHvxR g==;
X-CSE-ConnectionGUID: z7qgDvdXTemnfppUBGrYXQ==
X-CSE-MsgGUID: pbm32hL5SIWA3kKaNpH8dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="39095998"
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="39095998"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 18:27:53 -0700
X-CSE-ConnectionGUID: kdAd1WaCR/Ge/2AqeyJq+A==
X-CSE-MsgGUID: fpvp0RIsTZGYx1FlhXL+sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="81086944"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 18:27:52 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 18:27:52 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 18:27:52 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 18:27:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rj4rctmqKW67DR4yyRN3WPg9CsMKQVw5oJGeMiK7JUTYxThH9nLw2pYJmaGuuL7LBncVRnNu1/lyx9pfETp1FoXvl4YjCCABxbFnq+OVlnrWe9QgtlEE9HJC5Je+ONtbXjklHdwyXevWkd83wnSLL7nmciGcYHkmEoqvY0i6+JJkH4kzKBggi+/DjX6QjYEq+yHz8RTIWHN+HKKuRyJw+A8pOhhqHQdLldO0uOu/21rr8KZWYNuEUfXc3Kxw3kdkKdzk7RAWMQQEcN4qKdgUUp7HVfyDgL6V1jgVtPhzmZbDeFJBMOoit6UblhsOW50mxCqmaXW919ZqhvWnpmplaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5i3xdCUKXQbxrPHu8Th2L7tQLDDISxEd8lZgHI5W/H8=;
 b=L0SJ1HMitDG9pb5XMq3vLVIo5hFQRxlwfngIzboxVEfsrEjEbSDCUSaS9nitm9edSLBzwjlaKg/chRRsDGKOEs3StRSk2jaG+BfaD5rTbT9Ry0TboR3mwQMZ1YlhuL9d1CmYp5PEgMMN80nF5wc5mXpLCw5fTS4Z3tb7iaffKxhbvUkbvoNo0HQOv7Ya+SOYXPN+IKbbkfoyzXFqb0QVQn1tVllo6tZORW3qNDFm4aQlTpTOc6Y4nH4Oe/mRhNIyhTy1SGaD3zfk1TKlU5j8yovWAx8/KkpUKV+aqk72C4GLa+93LOrDSwv4ozt/3NW/ZynhZCl+eBm7/RGhzbFpvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by IA1PR11MB6489.namprd11.prod.outlook.com (2603:10b6:208:3a7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Wed, 9 Oct
 2024 01:27:47 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8048.013; Wed, 9 Oct 2024
 01:27:47 +0000
Message-ID: <78f1d814-d1a9-4869-81da-2ee124d392b2@intel.com>
Date: Tue, 8 Oct 2024 18:27:44 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/12] drm/xe/pxp: Enable PXP for MTL and LNL
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240816190024.2176976-1-daniele.ceraolospurio@intel.com>
 <20240816190024.2176976-13-daniele.ceraolospurio@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240816190024.2176976-13-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR02CA0012.namprd02.prod.outlook.com
 (2603:10b6:303:16d::35) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|IA1PR11MB6489:EE_
X-MS-Office365-Filtering-Correlation-Id: bf6f3b63-ac05-4d0b-1af2-08dce80194c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dmFhbXQ4c1JFczhnUS9nWG56ZExST3lwUjY4YnIvQU5xNUhsVjZldXNaQkxX?=
 =?utf-8?B?ZkdndEU5NkJZTGFYT29iWmtKSWxzYitFaDV6Z2UzUmliRFJlQkVKN2pWTEJE?=
 =?utf-8?B?eHk1V1hzWnBleGFYbHlYNTJUSS9BQUVUSkZhczEzMm5uM3h5cFJzMEtvbjJa?=
 =?utf-8?B?c0VIL3c0TzhCaVdOcXg5dlBFclAxcmNialltalVBM0lqV2RiVndLVnRBTkFJ?=
 =?utf-8?B?ZVhra2IvZG5sVGwvQUVINU9aUGpSbDUwNEZudHdvK2dHYVpKbTRlOHhyaU9E?=
 =?utf-8?B?YXB1MUZmOHJ2NlV6ZStLOWVxamF4WFlaY2hNR2ZqNzlYMlhWRmxFL01wT010?=
 =?utf-8?B?emtMOHA0a1NEN2lKMFdmcEtiQmx3RngxdzlRVjBLZWx5ZXloa3llVDNkQnB4?=
 =?utf-8?B?WW9nUit1Y21oUnQ0aEcwSlBmQUlPM2xHRTUyY2VnSk5yaHRHT1VYbER3N1h1?=
 =?utf-8?B?d2paVWJudXlmU1ZuVHc5VVVGbUtGWW1GMlhOZ0VTdFVxTW5PNzMzYi9WNmgw?=
 =?utf-8?B?RE9zTThSV1ZKNk1abjYvR2FrUTRnaUNGeXhEZ2FxaVJTZU5uUlNsLys5Smti?=
 =?utf-8?B?d1k5d0tSb0wxcEpvUmN2ejRWdkRtTUhYdXpwUWZQeU5QZ2ZvT1hhNjNHbnZ3?=
 =?utf-8?B?TWYxY1pndi9hdFVDTS9wenpzblBOUVJsUGFvdU1KZ2xycUhxaHU2eHd4RzVM?=
 =?utf-8?B?MXZrM1B0ZTRwdTZtK2twN1RHMUdZQUNDdFRrdmcrUHQySHVmUnpmdndEcmlC?=
 =?utf-8?B?RHZDeS9EY01oOG5LeUh3ckhSenNUamQ4a0RBc2NTNkJ2SG9aZjNXN3diaGsw?=
 =?utf-8?B?d3hHcDlDMUxlTXcxT01VUXdCVysyZm5CbllzN3VLSURmTVUrbWt3WlFiMDlt?=
 =?utf-8?B?ekYxOGZaZ0hiN0JLcERtK0ZiQTlybU9jWXRpd1VYWW1jTzd6REZQeEcwTnVt?=
 =?utf-8?B?RnhQOFk1MzkyaVo0aW5kc3lmUzRFd2NwYVZ3SjdIZ0xJOVRHWTg3N0dzU2M3?=
 =?utf-8?B?UmMvM3ZBckowc2ZuZUZwUjhvUGNyV2djQzRaR05KRTdBc3g4QkEyR0ZJKytO?=
 =?utf-8?B?NUVwQjhTL0UvbktQRzF4T0kwOGErMXVlcU1vSlhmdFp1c1p3ZkhRb1FjUkFo?=
 =?utf-8?B?MUhIUHZ3cG0xYklXV3VwOVQ1Y05FbkNpTGdJQ3FGcWdNSWlXcStORG4rOUVC?=
 =?utf-8?B?bXBMZzRiQmdSdWYwMkU2amlrS1JtWUJpN3ZFb2xpZjJEcTErZzZwTUlaYnc1?=
 =?utf-8?B?QW5XNnYzQW5HejZLdS94cmN4R1VyVnJJRnhKOWoxdkUvVjJrSWpYUHpaRTZM?=
 =?utf-8?B?dzBSdFhDOXJsRUgrdjRCUkxxY21KK3F3ZzM2N0kzT3MxOHZZazJDWDI1Q2M2?=
 =?utf-8?B?a0ZodUFzeHM3WmFlNFBJMDlobTF5bU1tdG5zQ3kzNlBjYi9WZHJpSXFmd0Qy?=
 =?utf-8?B?dnFZemdPditTVmh1czExSHk4VDRZV0YweGpaQy9DOHJybm1LamorVHRpUUpL?=
 =?utf-8?B?SWhLN2NGcXRaamdQUU00MENBYVlVa05YNFVPOFBFZUFDWWhpQ3cyNitqQ0ND?=
 =?utf-8?B?RkQxRkpRRUZsYVZxY1cwL2tMKzZlbXI0TUpTeENtNGlxdnlYZzgrdlNCVEtp?=
 =?utf-8?B?SkJNWm9JVjhxbURHZ0Q4QlkxcHZjTXI0b0tNbmd6VVRNVGk3aHE1dUtFZzR5?=
 =?utf-8?B?VmhBemVwd0tmVXlTdXA1M3FmSnBJTXlRWjNDY0svRktLL1k1ZUpLZEtnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1N4ZXpxTG9TOXJmUVdwSUdpcHNpbXNvZ1R3L2tEWFEzeVd5NnFlV1gwTTBE?=
 =?utf-8?B?RDY5T0RHRmg4K0QrQnVGUTZ6UytNMG15aVUrZWdoQmRmS1d5OFNVNzVGMVpm?=
 =?utf-8?B?a2lCalBkSTdLRUU0RURlWXVBQXVHc3VWdUZFcW9HVTI2ZS9sc0lIb2VyNjB0?=
 =?utf-8?B?LzNOc3hzZm5RMWxlWWNyMVNkVmVUMWIvaWZlMkw5eVZ6bVp2SDNpTXFMY1JE?=
 =?utf-8?B?emYrM2k5UlEwL3hWaHNCZDRjNlhHdUVaSFV1cDhDbUVyZHFDOXgvVmYvOFlE?=
 =?utf-8?B?eXZOZy9hNDZSbndYR1l6SXprN3ArU3RLSU1XMWxrSGlRd2RKeWxST1UwTEc5?=
 =?utf-8?B?MXBTcWM1NG80TVdvQkNmT2VzdHRvb21uYjdMSFRacW5QK25SZXBqanRlQ1J3?=
 =?utf-8?B?VHo5dC9EalVHWTJtTkxPVzZxaHRsdUNwbWZoT1VpZ1ZSaXJ2VEV3UnBKYlFF?=
 =?utf-8?B?c1RMd2RCQnVvT3lkQlBtSno2MVRhNFFoNVQ2dVl0ZHpaaGJWSXM5cFAxd0t4?=
 =?utf-8?B?NzVPMkEyWlpTVFZMMi8zSUVvbHd6QUlFNU5yTHJiVndSOEtadE5GREpCVmRR?=
 =?utf-8?B?enZRenpPZndUNXhRSU4ydXY3T3M0UFhqRVZybzg2dTJTY3ZyZHBLTjFXWWRD?=
 =?utf-8?B?UjJaanNySzczd3kvOHFNeGJCSWV4dEpna0htYUxyVUlIZFFEQ09NVE9nZDRJ?=
 =?utf-8?B?QjlzVkExVGJqNU4wUm1KelhCbmlaYzFEcStpNGhTTTdGQnkxZS9GNUNmakQ5?=
 =?utf-8?B?VmFSaWp4ak9tTStZS0IvWFZrdlFrRTNVTWd6SGV3UDhNSjVNNUptcnNJekQx?=
 =?utf-8?B?SFBrT0l6MGFDMi9FenQ5VzhURGFuYUNHb1ZLNUZLblZZbFNEUGI0T29XdVpD?=
 =?utf-8?B?Q3Zlc2RCdTZmcWptZEttaVkrczUyTWxmN3pxSzhzSTFDWndWS2xDa01tT2lN?=
 =?utf-8?B?ZXRaa1VWM2pJbW5sam1NMWFBbDlxalA1QkZJVDc1Snc0QVVma1hXSmtZdmQ2?=
 =?utf-8?B?U1JyY3g1bFg4TW8zUW5jOTJWRjMzK25kSDhkTVpOVkxaMC9FUE01cUlZRG9k?=
 =?utf-8?B?UjhLM3lzSXdhTjgwKzQrbTg4UzROWDBVcERjOVh1cHBRMzhXb3Zwam1DYWU0?=
 =?utf-8?B?blA5cDhrM0svZFRyT3RZdXYvNUxHRGQ3bUdMUUI5bWZrOTNDUGM4WFdkMnVx?=
 =?utf-8?B?anVZTFh0dGw0WENtZ3VXWEVZRWZOM3RidTZIZzBCUklaMy94d002SGRncjR3?=
 =?utf-8?B?elFZOXd5dEZSREJYYUJTb0U1djdQVGVic2pPVkdpSmw1c204ckNlY3ZWaStP?=
 =?utf-8?B?RnFibmt2TnVyUW1UakN0bXpydHJQZ0lxc2h3bXh3RXlKd3M3MzdNRGg4YlV5?=
 =?utf-8?B?bzVoclQ0YTRJZVpGUnBzU1JjVDhrUjFHZ3dQZkZhQWtFQ2dOb2hJTXNtMThR?=
 =?utf-8?B?NE5DaWVVcjMvcFBiU21VdXVBZExuNUR5bWhOWXVMTkZVL2VqUDVpd1Q4RDJQ?=
 =?utf-8?B?TFc1Yll3b3d0N1ExaDZLbkh0R0t5M1J4dzBBT2xoUk9rQTMxWWRmcVA5WlZD?=
 =?utf-8?B?dkhzN2JGb3VHcnN3M0Zsb25ocytpeURsV1NUc0lMeHltR3pFS1M0MG52OFhQ?=
 =?utf-8?B?THJBdHV2bUt6eG5QMHJPSGtwWXJjSTgvWUpubmF5c3JGTzVONE5YUk0wRnFN?=
 =?utf-8?B?OHVQV3BOYi9NNUNPcVIwbDQ4Qys0WFlDbCtFdDlpNGxTckhJRnRLYnN1WDN3?=
 =?utf-8?B?TXcyK1Y5N29BTGR0cDJYdHVLd2UrVG1ad0g5N1pENE9SOSt1VElpMmNlTjZW?=
 =?utf-8?B?eDg3S080R1Z0SmNtbVhZNHpQMzgvMkk2WHllY2FmRVMzSzJTMkVUYTBhN3pM?=
 =?utf-8?B?VWVMTUFsRDNXdlUyNXlPRTc3SndJTWE2V1k1SzI4NTVoVXdsK0JnN29hdDlN?=
 =?utf-8?B?QkZWRTFBRTA2Q3RZNmlXZnZaRUZiTTVzSWp3ZEs2cS9SRzJMQ0locFJRMk9S?=
 =?utf-8?B?andDVlNFNW5GSFBOYy84Ynp4L0x3SE5XMld2RGhMWlFNTlpNZEtBWk5pNUZy?=
 =?utf-8?B?V2R0eDAxUkNVSDNxd0o0bWJFMXlGYlVwQ1l0VnY2Z0FTR1VLSTlpMG9XRStK?=
 =?utf-8?B?WXV0VEF0THZUU1VQZFVEUGVCTVU4TmVVT2pYZUZnMnBsanRIRjJUajIrMldM?=
 =?utf-8?B?bEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf6f3b63-ac05-4d0b-1af2-08dce80194c9
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 01:27:46.9951 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oqv707HKYexDF+Qi/FSLXazVvywjzFcXo447gG+du0gL3zoTP3ouflYUgt2wZR9Y0lOy0O8Oy14V5rBtfSGvAvZnEabPmNBcKp4ets8CUWc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6489
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

On 8/16/2024 12:00, Daniele Ceraolo Spurio wrote:
> Now that are the pieces are there, we can turn the feature on.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/xe/xe_pci.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index d1453ba20dcd..0807e8a11585 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -338,11 +338,13 @@ static const struct xe_device_desc mtl_desc = {
>   	.require_force_probe = true,
>   	PLATFORM(METEORLAKE),
>   	.has_display = true,
> +	.has_pxp = true,
>   };
>   
>   static const struct xe_device_desc lnl_desc = {
>   	PLATFORM(LUNARLAKE),
>   	.has_display = true,
> +	.has_pxp = true,
>   	.require_force_probe = true,
>   };
>   

