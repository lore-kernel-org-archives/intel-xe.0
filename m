Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787AFC282DE
	for <intel-xe@archiver.kernel.org>; Thu, 13 Mar 2025 05:33:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B974110E1C8;
	Thu, 13 Mar 2025 05:33:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZWVN+9oK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6777A10E1C8
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Mar 2025 05:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741843991; x=1773379991;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wluuVPIzJszbYW53wr6REuAIJy+QLsdw4xJ6DNXTeg4=;
 b=ZWVN+9oKldQNBkrVmLmjHT2UIK7R0X1WVkeTlvsfnt0wSGuvLwBjmGGt
 uQ2urPp9ahcCTJ5LlMUmAWIFVr5IGeFJmNUa83FzqJTtT8Kq7QGGYklyh
 7k6616ohji4jLW18XYxhUPg9RQ4iHDreFQXFMsHLGSJx+krLG1CltxIXB
 CF3sUsOpYxc9P/dZmRMHZnwMHjvstt3GOZTDgWO7HAMg/4BIu5/Ch3dNb
 xPsUScLLRU4czf6xrJhiYal+DbtPXM+tbelh6S+WSB2f70lkMS4c1PYGZ
 wS0+HuGxDCVuHPjQki74FOyANYEV+sw17oFEeN2H6PwF6M1xYYU/KFEoS w==;
X-CSE-ConnectionGUID: +apgptqxT56SJXljVWa/3w==
X-CSE-MsgGUID: +kooijj1RCC4owVR1G03ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="68300108"
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; d="scan'208";a="68300108"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 22:33:09 -0700
X-CSE-ConnectionGUID: oO7jXTg/TkS6VfSVHc6ayA==
X-CSE-MsgGUID: 5QOthvrxRgOC8DmUEPwP/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; d="scan'208";a="121549414"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Mar 2025 22:33:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Mar 2025 22:33:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Mar 2025 22:33:07 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Mar 2025 22:33:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XlkJ7DjOb4bIFfk+JtJdSjTPnXA1KeN0JG/MSmjd4dJKjC9Ma3xT4OGf4G3tqiSPVkoc+1D4cPZuAjgOUZN/RKeF9JXynPhnUFkf2pRWg9eLl7gncU0TxHcUR6mPh801jekVTBp6/QPLlEPQtEhrfUayTKZEAHjpbuyjmE9EawsLTqra9tmBQIMoa319iS7ayTxgjIV+/L1g6swToHneM7RpPG7/EaQR/1EGUCsx3568f3F0escEg2JUAeYwyE2s+8wHgzfkj/lHBpcEJXwnKX/GfxbgXaLtNzf69tKUyGXAIitLU6q9lLof1S7rWO5hEzxVh25O+gv/lMmpa5+viA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z28CqiWu2bmWYC9jI3N7JtystcW112PfAvpMaKhOfVA=;
 b=lN4jbskuteVBR6dEoT35/X9CI71rLL3bvTO+cGu2oneCC5TZCuzW5/48+zrkjJgrpqEXEHaw1Uox9wU/FSZvhuJccutA+qzLgI7NoC5BaVoRllEjfU+SY523+z4NuR9toMChxQq14cccOwrC7nCfv6h8Pyqc4+RDTScFLrWxcwKiz+VrgkRuXCQvpM98KCthAn5i1YKl3vhJUJKbCnef/UTKepz5E3hiWvGEJuJtzfloVuhIrpYpK8BXM9ExTwUioPmJhBWXI/34t2t4hbbbE9m1YJ9U4o7JuqHvCleEMOcPYYvAmJsWeT2BIify6Umgk865/W5wzX3AWWS1Ic4QRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH0PR11MB4886.namprd11.prod.outlook.com (2603:10b6:510:33::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.28; Thu, 13 Mar 2025 05:32:52 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 05:32:51 +0000
Message-ID: <584843db-78e0-45d2-b5a7-81b1b64a132c@intel.com>
Date: Thu, 13 Mar 2025 11:02:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] drm/xe: Set survivability mode before heci init
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe
 <intel-xe@lists.freedesktop.org>
CC: Francois Dugast <francois.dugast@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
References: <20250312-fix-survivability-v3-0-54620dbcbbd7@intel.com>
 <20250312-fix-survivability-v3-2-54620dbcbbd7@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250312-fix-survivability-v3-2-54620dbcbbd7@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0075.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::16) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH0PR11MB4886:EE_
X-MS-Office365-Filtering-Correlation-Id: 81ea0a56-a786-4da9-dd4a-08dd61f07f68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QVRNbVA4cG4wdHJXV29aV0JlT043R2RUamhId3F0MHlaZ016M29uQkRhS3FP?=
 =?utf-8?B?aTVlUDhibmVQb1REOXBSa0dVTDNSdnVsd0loUG9EVTJCT2pON2VZanJZaXYx?=
 =?utf-8?B?ZmhZeUpDcHREd1oyYlhQTEx3L1pTUVB1bUUyeDZ2UDhkRnB4VjBUSFlkR3dV?=
 =?utf-8?B?ajFTSHNVS052bkNLUHRubmVwbVZEemljRUowcU15dFlYWnBNc2ZOdVdEZUhm?=
 =?utf-8?B?eEN5VkZ0NmFYUCtiUmJocHJQdVdwcm1KTk01anNFOUs5dDRoTFYvQWs4YVh3?=
 =?utf-8?B?aFFOYjA0M2FpSlUvckhDZ1Qvb0l3TXJrSGhUcEE1RlV5SDg5a3R5U1lrU1ow?=
 =?utf-8?B?Sy9jY2c4cVFmM2UrL2p1aE1DQ3FFNXM4cGZXOEdCRUpnZDJGMFhSdTBrbTNx?=
 =?utf-8?B?R0hvRDdHbjd5b2J4bm41RHNWWFh3M05IMkFPRHhFNS9lVDZHVDNvbkE2TGda?=
 =?utf-8?B?QnRYcXNuSHdEQ01pcVE4UncrdGRVVnh5Qjh2Wk1kREhjMmlSK3h0dGlMRkZo?=
 =?utf-8?B?YXZ0V0ZNK0h5RDZKa2NGQ2hSQkVwMmZIVUdXMXl1RG1YSjVYR3ZhNmNPbnkr?=
 =?utf-8?B?RllGcnFBM2VwNzE1eEVXRnRXVHB1aDVhUHUxQUdnY2dnY1RibVVFK082d1ow?=
 =?utf-8?B?Ukx0MW91SE56TWVXM0hiRGJPT2FSSVdxeGhGc2dBQlJsa0RuUThpS3IwTTAy?=
 =?utf-8?B?WGlZOG1UTjJXWTZzek8xOEFtd2lGYmZMUHVadkhqZHRzYUtvL2xRZXl2NVlO?=
 =?utf-8?B?MXJjSnRxNFlSN2swejF5Rm91QW0vN1UvajZEbkFNNXFJUGQ3ZXJic3QzMVR0?=
 =?utf-8?B?R0RMUG9KcktWWjJKdUJMbXNXaVRxaU9HaG1UV25LclVxTkhrVm91L2FsWTZV?=
 =?utf-8?B?R0N0U0pnTllaNHZoUWplQWEvVTg1OEZ0bVdEQU1xOEQ5ZHZreTVRQlc1clZM?=
 =?utf-8?B?Q0VKcUNnM0NjQXNTelVRWFNQV0RhZEpXbFVZWlhhYm85SWdYcmJzNGEwZUt0?=
 =?utf-8?B?b1RkTVJ2WnBaRlFYYngzVkR5ZHcvVm02TldIWHNjSTUvcGRVeDZRVno3U3dZ?=
 =?utf-8?B?dGhHR0RsV2NHYzhxdzZWQ0xyRW1sQStPRkd3S0tZMmNjY3lJbGlXakFEaEor?=
 =?utf-8?B?WWg1dlpQZWFOc3NtNExHWmZLMk9JOFFMbFpLOXJtVllCNlFIL1Y4eEl2elF0?=
 =?utf-8?B?OWIxMXBsY01qNTNUWDZ5OEF2cUczcTJ0N0Q2MjB2L2FlN2d3SXN3UndMbjdk?=
 =?utf-8?B?RlhGN0N0SGV6dnBBTVhYUG1ZREIxT0t3RWdBRFVQWjRrNjVHNzFzeHVVcVUx?=
 =?utf-8?B?aVhzRE9wM0tqR0tScEJKa0YwaUZ6eisyVzFvUFRFbll1bG9pVXFyZXJKZkVO?=
 =?utf-8?B?M28xNlhNbXk2MFp1R0ZwUW9xNVFiUFVjeEdKMFN0R0liRlNGVGNOT050Q1c1?=
 =?utf-8?B?SldEanlUNWIrM0xjRGxVVmg5cmphNUQxZkcycmJkVFBsUGY1bUxYZUY2dWEx?=
 =?utf-8?B?aW05Q1kybEVkYjlZblI0QU9GYkI3Sm43U1c3M2dLcWdSTGo5THN6cTIyeXdJ?=
 =?utf-8?B?b043TlpMZUtwSXROMG5MRllLTUorbTdYMjYxUVFEVVVqZ3ppcGRFQk0rWGNk?=
 =?utf-8?B?blpxaEZXT1JjNWdiYmpEZzB0dXJOcXd6TFJqWkw1ZHpCRCt0TDM1YkFkTC9a?=
 =?utf-8?B?allMMEZ5ZG03SnloY2pCTWhuUjJUbmZ4UndoNTNVWmI1UW1RWnRFM2VqT0Jy?=
 =?utf-8?B?WTNPUEpOandtMUJvVFNNTVdJS1kzOUdVVDFScnd5dnlMSlpXMVJoNEtHNjRs?=
 =?utf-8?B?SVB6c0xpUlpWTWNaRVRLdzVVR3VTWnc0YVFHWGpjUjltS1EyUWdWTmRXZ01P?=
 =?utf-8?Q?HPhyzSURkUAsx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2hZMFUwWnhvd0JacXplU0xXbWlZRjZBbGF0a3Y2NFBxTzVsVkJjUWVoZmdT?=
 =?utf-8?B?RStQTy9CaS9OWWhjdzJTOWZNdTFrWHkzNUIxQzhnTVZobWpuL0huREYySlQ1?=
 =?utf-8?B?QjI2ODBMTUtnLzVwb3NkT2EvMTQrV2ZTaG82aklmZEVuSGc3ZUNnMVlQYzFp?=
 =?utf-8?B?cUx4bERpVkkxT1RkVzk0bzlmK2xsU3dnd01PcmtSTmJVbVVzenpmMjBla1hJ?=
 =?utf-8?B?TkJvQVlsTlhGai9iOXVoS2JQTWliYnNMQTkxWjdWeFhINmdOb3VNNGM0RFRa?=
 =?utf-8?B?ZVFlTW1xQUh5WTVwUjVMZG9CUTUzS0t1K29uUkcwR0RCYzZGK3dLV0hLM1hm?=
 =?utf-8?B?WEI5MGpHQUFVUWs3bUtqNEZVZ0VBcHV0L0xsTGRNS1ViL1FYa0xieVpFVEZO?=
 =?utf-8?B?cGt0WHNpa29NdjNWYk9ySXpzTGZWTXlJb3REYWtaQW9zMmdtMUs1NzZyamZy?=
 =?utf-8?B?V3l2cmNZUG5HWWFqbkFtNkRGVlVpck0yOGFFYUNyNFF0UUtoQ3RvOGFaY05n?=
 =?utf-8?B?OWE5Y0tVb1lxNWtrUyt3R3E5TEl2cm5zM2hjdE42a1RWUzhEaHRBT3FrZ1Y4?=
 =?utf-8?B?SnBhQkZDZUJBTWthTGp6ZWxPY0FmcHozZ3p1ckIyTE5kblllQXFDZUM0WWt0?=
 =?utf-8?B?ekYxOGYxN1VuOWJudVRIZm1HOC9oR1pYZXpKWUZmc0NtZDU3TCsxWGtMMWhY?=
 =?utf-8?B?ZktaZE5OTUhyRC9pRTRtU0NMeFdVcHVLNEJMUEpab1lVSmRqdjNscmxXbmIr?=
 =?utf-8?B?UjU3VndpaE16OThzU04wQXliK0dMa2JxVVlvYmhwRVAwUzlBYTZKa2R4TWxs?=
 =?utf-8?B?TmNKS0dRVEZYdHcvRGE4UlhQVG5maFpuL3RlYVB6VjNvSk1QK3loUHBPeHhU?=
 =?utf-8?B?Yytqa1hmd1R3dXFMcVY0OTBwVE1yRFM1WHBvTExQNFlEMXVqWTYwUytwN2dr?=
 =?utf-8?B?c2ZYdmg0d1pIZUJDYlJFK1VuQjVQbHZqTVpuekdtZWt2ZmJ6eWJEblc1SG9q?=
 =?utf-8?B?K00zY3llc1R3QjdvekFRK1ZUUCsrcTk1OW1wd1VqZ2ZwQXM0Vi93bXc2U1lR?=
 =?utf-8?B?Qy8rQ0swUUVRc0FBa2hpa1UyQXVSL3hJckFUanhqYTl1czRQdy9pTThzNk1Z?=
 =?utf-8?B?b2p1Rlg1cGxTUmJrQ0s4ZDdYd2hVVXhzeG1IZGZPRUQ2bGFCcmFGeWlQa0ZS?=
 =?utf-8?B?ZFgrVDgxWjFUVGFqOU9sa21wb3JoKzVQQTFLR3U2WGQ3UDQ2Nnppa25GUTBt?=
 =?utf-8?B?T20zamlFQlc5OWJVby9sYXowdm5VbmVQWlF6NC94enBYdjBGSWJ2bnZZWFpU?=
 =?utf-8?B?bjUxSytNc29nQStNZXAyZ1RGMU9YM1RJTGl6bWV2QUZUWWpjZTZhOVZ2VEtz?=
 =?utf-8?B?NVpIRWZkc3MrQlExWS8rZ0ZDSlhYMWFGVm9UdlIrdENqNVBGT2NYTjE3LzdR?=
 =?utf-8?B?UWNZMWRVYm45UTcrek1XQjVES1Y1Smd0R1ZJZjRuK2ZoQStOSW8yOGtUMUFk?=
 =?utf-8?B?SXFSTEF0TUdDaExBRnBSQnJGcFFQRzFCNFFjUVY3MG9RYVpMbEFXVmlKUC9W?=
 =?utf-8?B?ZlBiZjNtd0lVOHZqVExPbGQ1QmhIc1JSTTNkTFNDTklVSTRuYzZHZTQ3Wm1V?=
 =?utf-8?B?ODRGS09xQit0S2ozdzVYZUNsaDV6bkZ2eFltZU1CRUFwbEg2NmNLTE9CeTcw?=
 =?utf-8?B?NUIwN3RhY2xXTjBrTzhaY0tqQzFnMHFEQ0d5N1MxcUN6MHp3a0VwYVRONmJC?=
 =?utf-8?B?MmZuSmNPR2xucVE1T3NqaHQrU09RVC82bmxmOG13M2dRUyt3VkVaanAzU3RF?=
 =?utf-8?B?cTlBT1JHUXZocm1OdFRqMCtMbjBXaVRLeXJaTVpiMHAyajVhS1RHems2d3Fa?=
 =?utf-8?B?SU9GYkRYK3ZiL3FNUUw2S2o5U1RYUklYNE5ISWQyUWVpWi90RXRtS3RaT1Jp?=
 =?utf-8?B?dHlibE8zNGROajdHbzdNREN6OXJXNHN5RUIzRnhLTHpYVHZYOUNmRkEyaFJ2?=
 =?utf-8?B?VVd5a3hmVjBDWG9mTnBwRE54ZC9CekQ4SXM0bmVCNjdtNlRPM3NJM0FwN2ZB?=
 =?utf-8?B?RVovdzZ2VnVpRTBkbm1tTFFQYUM0enY4cGpBSDhZUkFVNzQ0MXF2TDlKcHY4?=
 =?utf-8?Q?kxb6D8sLA7+JRTdMxKFN+lvrz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ea0a56-a786-4da9-dd4a-08dd61f07f68
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 05:32:51.7772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vsbb5iokzIfxjmiaf9M6KpUgA8Od3LwGeN9lcLD22eI4WdPbn7LmO1PshlLMW/N/kBS+bHRiDBmDPAH1ipxcFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4886
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

Hi Lucas

On 3/13/2025 2:41 AM, Lucas De Marchi wrote:
> Commit d40f275d96e8 ("drm/xe: Move survivability entirely to xe_pci")
> tried to follow the logic: initialize everything needed and if
> everything succeeds, set the flag that it's enabled. While it fixed some
> corner cases of those calls failing, it was wrong for setting the flag
> after the call to xe_heci_gsc_init(): that function does a different
> initialization for survivability mode.
> 
> Fix that and add comments about this being done on purpose.
> 
> Suggested-by: Riana Tauro <riana.tauro@intel.com>
> Fixes: d40f275d96e8 ("drm/xe: Move survivability entirely to xe_pci")
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Thank you for adding the patch in the series.
Looks good to me
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_survivability_mode.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index 0d57ad1596edf..359d5b961c750 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -155,13 +155,21 @@ static int enable_survivability_mode(struct pci_dev *pdev)
>   	if (ret)
>   		return ret;
>   
> +	/* Make sure xe_heci_gsc_init() knows about survivability mode */
> +	survivability->mode = true;
> +
>   	ret = xe_heci_gsc_init(xe);
> -	if (ret)
> +	if (ret) {
> +		/*
> +		 * But if it fails, device can't enter survivability
> +		 * so move it back for correct error handling
> +		 */
> +		survivability->mode = false;
>   		return ret;
> +	}
>   
>   	xe_vsec_init(xe);
>   
> -	survivability->mode = true;
>   	dev_err(dev, "In Survivability Mode\n");
>   
>   	return 0;
> 

