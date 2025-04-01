Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC9EC36008
	for <intel-xe@archiver.kernel.org>; Tue,  1 Apr 2025 05:56:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25FCE10E29C;
	Tue,  1 Apr 2025 05:56:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lGSvVXXQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47DC310E29C
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Apr 2025 05:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743486962; x=1775022962;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rQhawNYgW7HIDZSudKgpRyWP8j4h7jcBo/g/5FwmUVM=;
 b=lGSvVXXQJDiF5ueT6E7071a6JHJ1jEJrYT9CUTtCZjvpX3CsNT/TbVUV
 33+5xYmkLpRC0ZIIKG7inYDD7DJMwDi5tw0Lp3VTKPg6/JNvOSM/19Qij
 zOWlTvFtPvHnnPfUdJn+st1Uj3GZi7dfcfZ8DiMIe9ULRaVrphE+rtnCv
 ZTIWcLtqf7TUR46safPhuXiZHGkhnCXohlI+/iRILiMRXdgxNL3rnyVF1
 TDgMKwb/P+/ch9p1JZfYifE6400bKKOZMB4ro4sgYF71aFV/qj8UQki8d
 DzpMVP7C3thEnGgdTdL1FqTmOHvqruqgvttAhoSn4RQtX6YDAVF3UyGo8 w==;
X-CSE-ConnectionGUID: o5LZ/7r6Si2TIY1l1YV5/w==
X-CSE-MsgGUID: /fM6vXdISTeOH3+5jezjkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="44676745"
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; d="scan'208";a="44676745"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 22:56:01 -0700
X-CSE-ConnectionGUID: aG/Ji0dGS4aNQ4iKW3Vnww==
X-CSE-MsgGUID: gwZ66AytTaiu8eQDrf7YuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; d="scan'208";a="131143092"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 22:56:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 31 Mar 2025 22:56:01 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 22:56:01 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 22:56:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BTS5ESZzsq2P4V73eHBJSIHXYZ7Jo6UYVDHIfsVFAGbuake6afuNd/65kU9kmG/WbkJIrDgF5SzMA685lPaPK39ABP4lflXZXV4hVT1TiYpTjnYUopQe/quF8JR5ACGNsNfCnUain+Wr44AZljIgX5d++UVZIvcNfi/JuB2uChI9wjr4vyc1Qhwutg4+BpaCfDn0S1+wahOYKXlJDHsGlQHgpHVsLiycvl7umL3DZy+2eGChCkKryLr2w22E9zm5L98p26mlej0/z+HcSciHPSl+eS/Isq1EPg0xHbjftWX6yrKw84t0LLC5PGSbnxQYF5GKQ4UrZn7T002Dlxs8TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KVRqv9LSv+FHe/g2EmzEU3T4g7vzju4bHY3XdFrTsNA=;
 b=SnVy2sAwWlxA1kZOPMl6a0ATOmqu+PIc/ElvlVCsG9hBamjbbkqtO8vIOLKbChJBVgFSFW8OPsfebKzl/0U+qbb0lzc/9BlWelQY7/HKtSO1D0dNfEwPX1B86SbNJjeCw5vHvKJ3yLpAbC/IbwLfLMHyActWYU293LLdmHsv+rCVfNDhTtuCS2l6zsXeM7cscWJT3K3LEk1r1MCJZaN2lLqRJCYL8ioeCt9meNZ/1ATL9MTxUC+D0/E3rlbKT+V9zf/ObTKV8hiLmUHmR+3Il+4Gk60lFEtOXiVK1wlxk3fzQxxPbi3MhNZNAldda8S2rlP8ThEGcFyqWhHLSBZgzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CY8PR11MB7170.namprd11.prod.outlook.com (2603:10b6:930:91::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.47; Tue, 1 Apr 2025 05:55:58 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 05:55:58 +0000
Message-ID: <038f3959-d937-4b38-a15a-605b86143a9a@intel.com>
Date: Tue, 1 Apr 2025 11:25:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add configfs support for survivability mode
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <aravind.iddamsetty@linux.intel.com>
References: <20250327064204.459968-1-riana.tauro@intel.com>
 <zvdiclntjpojrpdzg6fehnecirfigza7vwir5f7go3rmzwee6a@fqazbweelg54>
 <Z-r40FFDDRVzI7wb@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <Z-r40FFDDRVzI7wb@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0015.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::10) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CY8PR11MB7170:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c1d165a-cc16-4ee8-f9b3-08dd70e1dfcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aElVYitmcXBTRUp6cXVZbUhzaEVHaXE2QWFEZlVRVUJ0eGU5MTZKdXpvNDQ1?=
 =?utf-8?B?aGZYV1JhMGxya25xSDFMZ3pRc0ZvWk9Ic1RUQTBYNnQwRlhqWExVeDdkdmVW?=
 =?utf-8?B?VUZ6aTU0MlpqZFE4VmtOOVV3UloxQTY1UzdBZExDdHdJN0RWNkY5bm96NUVa?=
 =?utf-8?B?UTZhS2ZURjlQb1dDbzJzbWhCUE92bGlaNmM3TStJMVFsZW4zcjB2Z1UwRnE0?=
 =?utf-8?B?QlBpRVRlWnl0d2RXOWIrQ24zZjgyVXdoNUFodTAxVkRQelA5K3R5SHRiZFAw?=
 =?utf-8?B?d2luUGpYUVdzZ3pnNElqaFhELy81SnVtc1lpK3dkSGtuZVJ1ZXJ1dlg3bDZS?=
 =?utf-8?B?WGNjVlNUS214TnRyajlwZHordjNGakNpQ0IxZldtYWtPdWN3U2hKaTF4S010?=
 =?utf-8?B?aWo4R1I5QVR4ZnlCYlN1WkVWdzF3eE1hdVUxbERsRklDbUt3emhHNWV2MHMy?=
 =?utf-8?B?YTZBTVA2eFlmaCtVWGI3Y2xQR1ZKbW1lcXVaUlJuREt5TC8ySEhOZUF1WUJ6?=
 =?utf-8?B?QnVwLzBRQkdqVmtUVWZSY25zVEp5NGVna0RjU2NLcmI3MXUzbGRpRktCa1Vx?=
 =?utf-8?B?MU5jMlNiM2M1aVlaWUZmNWovNk40OTJWV3ZYNzlZR25jMHlDR3p3a3oycXVO?=
 =?utf-8?B?dUZnOWNxN3cxelpKVC80eFlYRklNaGY4ekhlNE4yNmkwZXR0Tk1kMEcwK3ZM?=
 =?utf-8?B?bVhZSXdzNDdHQjdROTBVODdiRWpkczg3dW9vOFVRUS9tQkN6RENzRktVSVIz?=
 =?utf-8?B?QXNoOUZGdkdLQzN2NzhwR0xoUVM5ekxQL1VkWE1yV2d3cGlNMFl2TXA1L1U5?=
 =?utf-8?B?TTF2VkhNcFIvaDBTajdKQnkxQzVXbk5DNXovTXdTb2J5VitzUXBnR3FOanRr?=
 =?utf-8?B?QUtLcU4rRktzeDJkNUxYVXFzOTVpNTVQbzhMTVM2eS9qeUxDRkgyQURUcG96?=
 =?utf-8?B?VnRJSUl4S0taRXNZRms1T0hxQ3R0YTljUHZkY1ZXeVV6dzNMZDJSekdxTisr?=
 =?utf-8?B?UkM5YXpacVVUNkt3SVlUT1dYSUk0RVJCNEp6N0FBK3hHVXZRRHlLZU9aRmsv?=
 =?utf-8?B?WFFvb1pCeG15L3Z6Yys1K2xnWWV3ckFDbEJFcWNMREh3MmpZNzlTZ3dBZElO?=
 =?utf-8?B?YWJ5ZVM5RjVrV0ZxOE9jYjhlcm10SU95QnQxUHRiZkZoMURjTjV3NVcyUm10?=
 =?utf-8?B?OTFZcHQrOVgzTGNGc1pRMjhyMlpCb2N5aEw2U0FMZG5FRURJVVE1TTdsSldR?=
 =?utf-8?B?ZTRYbXY5bHFBTmFyZ05kTFJsSVdMOTJsMUkvN3A2dktkcENrNEJ2b3Rid0dj?=
 =?utf-8?B?NVBBZEY4RVVGSFczZzVmK2hBOFB3U3pQS1gxK2UrYkEvZTZ3Q1gvN1pMZHJI?=
 =?utf-8?B?NWdTellDVUZHYjg5WnA4QWhHc2prdm15d21COHFkeTJUeWVnb3RlWFZwQ3dj?=
 =?utf-8?B?VEYrdERWaFlzL0pvM0JmRXlJK3VaUkllS0NRL1kxcmlsMU5nTXcwVjJZQXZi?=
 =?utf-8?B?UlJuSS9xSkdiZjlERjVjcSthU0pFdXN1WDNEWExZTlZ4YlN1bHl4RmhhNWhu?=
 =?utf-8?B?RHZpM2hmK0tlNUVaOFduVU12YTR1UGdyanJDUmQxbFQzZWM0K2plYWU5bDBu?=
 =?utf-8?B?UUtuZ3Vla2dTRjJRY056NWtBelAxRFRGMFRZZk9EOVVQd2tQTnBCVDNmWFVa?=
 =?utf-8?B?SytSWXIrcUxvMnlVVS96N0VRY0Z3T2J4WVhYYmFDd0xIL04rS0M5YVBOdEpy?=
 =?utf-8?B?QkJkekpFR0kya0c3TnJWMFlnb2QrSWRQeFZKUWVtN1czaWNKT1ZCZ2FXa2Qw?=
 =?utf-8?B?b04vRU4rbkRVaHoxNHdvNm1ORGdSbGM1TDdUd3BFc0tQTGk0alhSbTgzNmU2?=
 =?utf-8?Q?Mvy3huklKAkxR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFhwYmZ3OU90RUN2dC96eHZPam9HLy9vRFE4SHZXNGdRZ3BYNkJwMzVaeEFC?=
 =?utf-8?B?SjJ4cWNNcmZFSkhubktjN3JUY0UreElRT29DeCsvNlBkcUxiKzkramRXWWdT?=
 =?utf-8?B?czlzcWNVdkE4ZVZJM0NaSWpTUFliSVhwTDh1Uk9maXplMTUySEpMcWVrWDFK?=
 =?utf-8?B?YWZSRHJKbFZORk0vcWwwc2RRZVNmeHZkZjVUNjlBUGl3em5TdWhReHFNSmow?=
 =?utf-8?B?dk93NEdpL3ZRNUVHRG1LZGZwdzJVTWI2UEE5V0xZMlB1QzZVaDNsL3pLaWQ2?=
 =?utf-8?B?N0RWNUVXTW5iVW9NMm1vZjBrZEYzcndCZEZvcFNpekVrRldUUE9sRWoyUDJx?=
 =?utf-8?B?M0FXOE03Y3FsTzZ1UU9pL1hyT2RPNVo3Q0dsdnV2UVcyLyttRGtTZHNva3lx?=
 =?utf-8?B?TDZSMDQ4T0FweGNBQTVZWm1hSlBMV0lHK0llaDR4M0ZHZTZsMzRTQXdJQk9G?=
 =?utf-8?B?MzN2KzM0R1hSYWRCK21kVitHSE14dXdodU9xWDVOY3RGUXVlbEFzeW9KTmlQ?=
 =?utf-8?B?RzV2ZVV2ODJ4cXhEZnh5ZHd1eUhud20vYk14aitFK2hqNXhKN0ltdEFDb1VS?=
 =?utf-8?B?REJZZXRKZ2NUMnZpNXgvaU1ESU5qMTQrM25JUnRzME5OcHJQTFU3R0FqY2Nr?=
 =?utf-8?B?T2YwY1Ixc3NFN3AxVUoxZDdMU3gwV3I4bm5INXcxbU0xUFg1SHZPcnBFM1NJ?=
 =?utf-8?B?VHBKSlJoTzNGZ2hNUkR2d2VzUDlXNlNROThCL2xRRXYxenhid2VXOTlnVWdz?=
 =?utf-8?B?WFRyVGVlc1lrMDhYMmVoMGJoZ0t3TVFqTHdWSlNRcDN6Y0lCUEdHbkducTRK?=
 =?utf-8?B?YW1leEFYNTA5VmQ4MWNtSXB3Qmc4M000KzNwaUx6N3ZCUVlaYko1SkE3VlZF?=
 =?utf-8?B?a2UyeGI5R050UnJPdDFYVXBybWtxNjFONWtqaEpmeXFlWkhzS2hjVStLYnZq?=
 =?utf-8?B?ZmhHNDhFM1o3cGtlZjB6SVRPNTVOMDg2UVZtZ1NCSHdWbHEvYTFmdG1URG1Y?=
 =?utf-8?B?V09iMUJkUjlBa2cyc0VxS2hPL0pHOTNsTjA2VTlxMVMwR0FxaTh0Z2czdWZY?=
 =?utf-8?B?Tlh5UWQ3ZW40ZzdSK3dUYmwvNE1yTWNScXlHc0hqdkpRMUZUbndpNkJubG5w?=
 =?utf-8?B?OGVJZlBWRHBmSFBuUjRNVGtWR0J3M3BWb2RPaGVIWVdqZ0pUNFJYQ2I5anJ0?=
 =?utf-8?B?azk2emF3TVplM2FQOHYzMGprS3RoWWtCWlJpU3lpMFcxWG4ySkdOUlNhelBx?=
 =?utf-8?B?SWNrWGYyVDRkeXR6aDFXWlQvWUlReGs4Y1J6NHdBdC9vOUVNYzA4Z2hHMkVs?=
 =?utf-8?B?YzFXUzZGZytFWHRFVzEwMmlhWkJYR0dZSXU4Zm1LUTlQNnpGNUtVL0ZxWjVY?=
 =?utf-8?B?VGxSOUpuRks0bnU0TTFQR2xEbkMzRWQ3cGxXTjVWeUduVTRNRnFSQVU5Q3RV?=
 =?utf-8?B?SldDRmIrSjBrVjVoUzF2TDRSK3h1MWRlakovQW1ZU1ZpOW5nTHM3dGRtYWs0?=
 =?utf-8?B?YkFVd2ZhZkllMGRhTXFtSFdhamlVL0ZOM05yank4VDJBanQrNGtmUmJBWGNi?=
 =?utf-8?B?WjlkZkNkN294cXJzd1I5ZmpGVjZpUDVSUnZQanNaanY0WHNHRkpIR2xZL3Fi?=
 =?utf-8?B?ekZKa2dqczRGWDJqdHpuNVYvMy9LbzdBYkV4YncvSy9HVjN0cGpyTVRuYTYz?=
 =?utf-8?B?RkNVMWtDYUJKRnRqTUVCTjFmSkVVRHVwRVZ4ZFFOUW1lRm1TeG16c1IrMTVW?=
 =?utf-8?B?bVB3bW1lNlBrRkw3WWo5cGVxQjFQN3V0NFJjMjVZNHNjMm1mQkhzSjhmWDVa?=
 =?utf-8?B?OTlGd2hSVVJ2NEFpVW1HUXVObWZKZCtDRDFQUkgrUVNTTlBqZGhObWNLTHVU?=
 =?utf-8?B?QTFXenI3dHRIWWhTZkV1SXBRbWwwcVlqZ3F5S3UrNTFpdW5DRkdNTXJlRlpn?=
 =?utf-8?B?a2tMWWhMNWd0OU03cE5yUUJlSUpjakxVd2V6cFhHWllhdjM1aTl5ZERWNHcx?=
 =?utf-8?B?RkZoSFU3MjRMOTAzdldPRit2dy9lb1BqZ1ZGQWhMVXBZM3IySDJNM0ZwNEpD?=
 =?utf-8?B?clRLNnF4bS9mY3Z5ZmJMYWI0V2RxckwxQWw3eE5zT3IzQUxZVWZJYUgvZytN?=
 =?utf-8?Q?b45FuRE8jrQC4emHdafTCK2eS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c1d165a-cc16-4ee8-f9b3-08dd70e1dfcd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 05:55:58.4975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UMvnMhL9Ig1o19XF7jOhtzabaZPlZw5lezWBvI6aCbJXh6pptcmn7vJZ1GWx4sLlHnFR+yR9G9PCu3obiWZ86A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7170
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

Hi Rodrigo

On 4/1/2025 1:49 AM, Rodrigo Vivi wrote:
> On Thu, Mar 27, 2025 at 09:40:39AM -0500, Lucas De Marchi wrote:
>> On Thu, Mar 27, 2025 at 12:12:00PM +0530, Riana Tauro wrote:
>>> This series proposes to expose attributes via xe configfs
>>> subsystem. Xe registers a configfs subsystem named 'xe'.
>>> Userspace can then create directories for the devices they
>>> want to configure and set appropriate attributes
>>>
>>> This is done by
>>>
>>> mount -t configfs none /config
>>> mkdir /config/xe/0000:03:00.0
>>>
>>
>> If we need a new version or to document anywhere in our docs, I'd add a
>> comment here:
>>
>> # If driver is already bound, unbind it as this configuration
>> # applies only when probing it
>>
>>> echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/unbind
>>> echo 1 > sys/kernel/config/xe/0000:03:00.0/survivability_mode
>>> echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind
>>>
>>> This is an alternative to introducing module param that causes
>>> all the connected and supported GPU cards to enter survivability mode.
>>> Manually entering survivability mode is useful when pcode does not
>>> report failure, in field repairs and validation
>>>
>>> Rev2: use config_groups (Lucas)
>>
>> Awesome. I have some other work pending that will make use of
>> it. I will play with these patches soon.
> 
> I really liked this new flow and I was giving it a try here right now.
> 
> However it didn't work. It didn't take me to the survivability mode,
This works only on BMG and after writing 1 to survivability mode> but 
also, I cannot unload the xe after creating this configfs file:only 
rmdir is supported to remove configfs . rm didn't work>
> sudo remove /sys/kernel/config/xe/0000\:0*
> rm: cannot remove '0000:00:02.0/survivability_mode': Operation not permitted
> rm: cannot remove '0000:03:00.0/survivability_mode': Operation not permitted>
> Tried to unbind and had the same failure.
unbind worked for me. rmmod without removing directories does not work 
as configfs takes reference count of module.

But shouldn't user be responsible to rmdir once created before unloading 
module. I haven't tried without the owner attribute but
according to code the registering subsystem might fail. Will try

Thanks
Riana>
> then with the configfs there we cannot remove the module:
> $ sudo rmmod xe
> rmmod: ERROR: Module xe is in use
> 
> 
> So, it looks we have some stuff to adjust here before we can move further,
> but so far things are looking promising indeed
> 
>>
>> thanks
>> Lucas De Marchi
