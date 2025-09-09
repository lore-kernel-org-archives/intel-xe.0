Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B71F7CAC583
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 15:27:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7934110E7B5;
	Tue,  9 Sep 2025 15:27:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FR3BSXIj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBBA010E7AF
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 15:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757431637; x=1788967637;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zp+VvzceZfAd8Yy7E4sBWfYXU/IFMaZUx9h4EjjAha4=;
 b=FR3BSXIjVd+zvxu/4RaQyVmiKmM8RGFS5BOUDNhRpZeoUS3YCm7WI5PC
 1lJBOpjKXROvs53gYu2MtXnYPVmhWRxEJWIaNe0W/cfvTQe0dTVnh7AMY
 h7a60RJ7p2nPnQNS5tq3Jx02vfYyezaCt/Q/RAqCZQhf5ex4Xp/X7HCtr
 maie7YBnWuGRbEbbjTs/SwF4N+JLqVm07IvU296zjPP52xkhF4+ssWML6
 aRcKdEr6lz3f+G9+fehYdLopakW6Cf82qd5AFW6lbYaMkJqKq2pDVat/p
 Qf3quwC2wPmGcBSXV9ji6IvMiIkPLbOqowcUyCk440wKQ1OjSj0g1LgCs g==;
X-CSE-ConnectionGUID: BVjXZsD7RdeV8Ua23TGXlw==
X-CSE-MsgGUID: txbNrauLR1u4VxKgCReVKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59672360"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59672360"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 08:27:17 -0700
X-CSE-ConnectionGUID: VUbHy2aTRGidzlgTxZ0rrA==
X-CSE-MsgGUID: eekstCLLT5axK1PBkc4Rcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="173510044"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 08:27:16 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 08:27:15 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 9 Sep 2025 08:27:15 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.54) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 08:27:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ikrod8G3J0Xhx519l23qCWF7TPUC+W25xmDwiGoWUC+XoftGcuHqkOL/hNjDNUNvVBI2pzo47hYpPTAZxdsZBmj5TK8ABVVS/oBlNcAeUJBvHQYN/O0zlgKS6mlQo01LMroYYLfSq+rJU3v8J6j7voZmQweOHU/eCyoU5uxeahdXsOc9R36M+4uCLnvPPuNP0i6xG5+s0kWl0sp+x0xxPEmwfJBlcGeTlZ50Yk6780qqiHftVAN+Z9tZz301vviqbff2ZGkA7lcjXg2INhfn3ldW9IO2Vr6ZLEHZla5UnUl4JJcRzc505vbpUTILj+JI+4k+KpYq1M1KXWVjSZBz5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q4hKZrxX8eulNAB6d/b6LcgHaCk/LMEnbOrXGPgFD6c=;
 b=ynCTW7ZFzwPx1+n2q5XQmwdOKI7vkl2XDVTYVCM2LAteu1OfcVZMl+taCgnmBx47o/hQnhxjKg8eTrYDUSKhhv4AlWrdYoqD5BqdnySOcaL8n/BhZdhc13r0wJPBQIVDgAd6n8BegsPURYJaxZbTFbgVzweWZyq6AYOzzymIIGMb47c55vGVpcUsI60tVBpJzu867sSjCG8oeXFH7q8fsSpkOh6Mam8erkRQAHtRF3GkNihFajD0FSnjjUnflSq3nl/kUPwzr7gM8cSq6OU5/dfx0w4WyxCEkNQ5VP7BwGCUQzkMM4vQv5L710ZTLTBpdBR5v8LPYvf0FLRiSGOJJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by SJ0PR11MB5165.namprd11.prod.outlook.com (2603:10b6:a03:2ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 15:27:07 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%2]) with mapi id 15.20.9094.018; Tue, 9 Sep 2025
 15:27:07 +0000
Message-ID: <6fca9227-ae78-4464-8dfc-3b0b90cad9cf@intel.com>
Date: Tue, 9 Sep 2025 08:27:04 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/guc: Set RCS/CCS yield policy
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, John Harrison
 <John.C.Harrison@Intel.com>
References: <20250905235632.3333247-2-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20250905235632.3333247-2-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR10CA0030.namprd10.prod.outlook.com
 (2603:10b6:a03:255::35) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|SJ0PR11MB5165:EE_
X-MS-Office365-Filtering-Correlation-Id: 93c5e6bb-156d-4ab3-e014-08ddefb5563f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RVl5VVAxZGh0ZjdkWmkvUEtuREprbjlPWDdITFltVDdOTFp5cGxXbGJJaktM?=
 =?utf-8?B?WlhQNTlrUytjV0U1YXM3NVFJYTdYK2pXNmZvc3RmZ1hjSzBjYWM2OE9BTEor?=
 =?utf-8?B?ZGRHdkFJbVV5aE0vc1ZOWWFMSzlwckFPazVVdEJzazVyYS9KV05IbGlKMUQ4?=
 =?utf-8?B?Tlppam5iOTFVckZ6aE1MdnpvRmEveXQwVVZGK3pqcEZubjFoWVNCM1ZCOUwz?=
 =?utf-8?B?L1htTm1iSWI1WS95d0hQYjIvUUpRbEhvTkVOZGdKQ1cyd3JJVkJLcVlqUHpp?=
 =?utf-8?B?SWM2WVhHdGtib0RnUHBsSm1ON2lHczNsb0tVVVJOQ2lGZmliemU3dVFaRVh2?=
 =?utf-8?B?OW5Fd0NReDZVTmdpbkFIYkFKZEV3MEE3aHJSR1AzdklqQ3NXd1A4cG5FblZ6?=
 =?utf-8?B?Q1NqRHcyUWM0Uy9JSlc4ZUdJd2xXaUNkSFlhY2crKzFkNksxQi9pamdhTjlr?=
 =?utf-8?B?VjdLMHVsWE45TGM3L3R1bWh2VXVCZHZGQ1dCZXZPYUNKeERWNFlKdVYvdGtx?=
 =?utf-8?B?eEhBS21jU1dTdndHai81MGE1ZmVMbzFGWTMzd3RtZ2ZDR2dVRnovWnBlSzMr?=
 =?utf-8?B?L1VvVVBFUVJDOEFDdlZaWHpHV0R2V1ZyNStlZjlVWVRKL1prMDJoa2dObzhj?=
 =?utf-8?B?NElRMkJMeTJ3UU16M0tsS3NtVGpSa1dPd1BibEVlRUg3YVlMd3ljUXNhdXVV?=
 =?utf-8?B?d0tMZ0g1bHljQjNnRnE5S1JzRnhyMkQrKzZ6UE9jWEcrbWQzTzdLa3pDTEdz?=
 =?utf-8?B?MnQ3UHlNQmJHSDFzREZvWGFoQUVJTEhEeTd2VjlISExML0k1T094ckJhdWVM?=
 =?utf-8?B?bENlMnJxbTNpeml0Um1pWEl4VDJuOXJaR0tWQjBCQncvNXVIYXllTUxIcmFh?=
 =?utf-8?B?RGJTbnVPOUVwK09tQUd5OGQ0VFIzNnpuY1g2Y0toWWJWdHNWWkJMR24wU1JN?=
 =?utf-8?B?bFlQTGVxVXNWTkY2Y3FLUVdIb3FTWnVDdm42VDNydmp4UzF4T2VWZFJSNmxx?=
 =?utf-8?B?L1l1VWU0YXZOOGU3eFJ1ZmlVaEV5bTJMaEJmZEo2dVpKYUpCb25ESUZ5QjdH?=
 =?utf-8?B?Wk56RS9mdzdNOVBESHd0b0VMUzBWUFFFZEUxcjRyaEdpVDVNOWZWZjJrZFRF?=
 =?utf-8?B?M3Z4V0dlL2U5bVRJN2dUQzhzT0pUOHNZNmM3aDBtYTQ3VDQxZTlQSzlpT1B3?=
 =?utf-8?B?WU1yNmpodjJTMnRqSEVQeVJNQXVsN0w2TzI4KzIrZnlabmVxYnVnYXNkZ1JD?=
 =?utf-8?B?WnNjb3BUVFpzb2VnY2hVSktkR0oxR0FzcmRSejdNVEwvNk85S0k5aTh1VTl6?=
 =?utf-8?B?NlFSanZBQW1OTEtjZnF2U3BSTlNMV0ltQzBubnRXQ3FDUlJNak91U1p1SS9x?=
 =?utf-8?B?eFI3Y1kwOCtPVVIwd1FTV1F0MWI4UERRUmRucE1wNHRzQW5BY3JYQllpcm1r?=
 =?utf-8?B?VlZtZGVqU2ZEVzBOczQ5VFJGTnQ1YmJqeVpFS2ZHeWFidzFiako2SzJOUUsz?=
 =?utf-8?B?RjFpd29pTW1iNnZVTkx2ZWdaamFqZWQzWkdQanNsbDdaQ0wvbGc3UWhzYjVH?=
 =?utf-8?B?NStYcW5hQ0hNUGNvL0REN1FxUlYvSUhIaG9yN2RyM2xYS2xLdlRRYUQ4dzho?=
 =?utf-8?B?ajRwcGRoNVFPUmllOXZWbjVpSjdPS2EzeWVBaTNtUktRL3R3VUgzWWF3ZUpV?=
 =?utf-8?B?NWx4VThHQWVBU2h6MEFRSithd0NYL0xCbVY1S1hha3ZER1RycVJnNGZlYWVC?=
 =?utf-8?B?WEo2VDVOMThaK2FDYlg3a0lWa1JkOWtrT3J2Smx5b0I5MSswZ2VYQXVRa1lu?=
 =?utf-8?B?cnZXODd1Z0t4WnJseG9adGQ2UytFdVFBMzZad20vN1dlaEhWY2tnMFljQlU5?=
 =?utf-8?B?SU04Q2lNa2lScDlHM1hZL3dhNE9ycitCVkZVckpVbGVrRWEvOVBhNnZrU1BF?=
 =?utf-8?Q?VIWM+13itXs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OU5RaUpNSUhVbFZFNXZWTW9tSEZWb2UvQXdIY0FCZVBWZE44c1oycmlzaVZj?=
 =?utf-8?B?bTlwMW15VlVjN0R6OUVOVDVyOVd0eFMzU21HemJOd1MvMGtsUFJyNmxuQkVj?=
 =?utf-8?B?QVJMeG90SzE3aHJ0WVNrbEhrZFdza3lsT2dQeVN3a2ptT3pmVWo1Y0Fielcr?=
 =?utf-8?B?VkZWWWpqQ3RjOXVNQUJqK1dtSTVMbDRtZ25iV0V1NGpEQXhwcUpqUG5UMXRE?=
 =?utf-8?B?VG4yQWdCOXRNeVhzekIxdEVWTkJCa0pWeGRzOUxZRVUrUkEwdEEvOW5pUmU0?=
 =?utf-8?B?UjJ0YnZzUUhhS0VyZEtWcVZWM0xrbzROYkk0NnR2dm04ZW1FSWVSZ3R0bm9n?=
 =?utf-8?B?bXVYUEpodUEzNzA0WFFjMWtKbStBclRneGdPSTdnWHhueTI5MFRiMmVad1o4?=
 =?utf-8?B?OWdiS0tYU1g0cW9QajNZZWVxRmRxSXlvUW5sZXo2WGswYjFKYmlBNDZ5RVRk?=
 =?utf-8?B?K0ZiYzFTeUxpYTJVQ0VJV01sNUtUQzVjeDBDa1dYdnlXR0FvVkMxUk52TWpl?=
 =?utf-8?B?QWxES2RMbGZqZU9vKzdNdHprZ2RjTHEyNDE2TDdQNWM3MnRqTkJYL1RkM1NS?=
 =?utf-8?B?b1VkK2tNZkx1ZnBQZjE4V29hblk5T0lKSnpOMm9RSVBJd3pkc3ZERkRTNHdo?=
 =?utf-8?B?MDZjWGI2MnJ4RlBRa3FVbW8zODhJNjdraW5QZVpDdEhheXNjeUhLbEN2Rzlm?=
 =?utf-8?B?STd4V1JZOW5DN0p0d2x6U3JvTmlBNUhpeGNKNmdlWmF3QWlkTnpZbVRJUmwz?=
 =?utf-8?B?QXBsQnpyTHFnbWlFdWw4d2txSEhXOE5BVDhkTG5vK2RDNEF0THdlNDBKdmVF?=
 =?utf-8?B?WnNQVXd4c0lyditMS1EwUlhudDdzM0xZWHRxL0dXeWJVd3AxK2Qwako5Yi85?=
 =?utf-8?B?eno1YTMyeEpvdFRZb2RIU0FpeWVtcnFUblJqS3BiREZtMUE2YmJlaVlISjRF?=
 =?utf-8?B?b1cxZkViUHhrQnhiTGdTNGV4ZnROM1k2cFFQZjZpeGdkTnEweTBWalUyS0dv?=
 =?utf-8?B?STNQVmN6MXNBTGQ2ZXlMMW5ldTllUUY3Y0ZSenpQbEpRMWQzeFlBc3lkUGlF?=
 =?utf-8?B?WExydkZUbHBvS3hmQzBVREphQzFJenMvUHBackxXbnBYOC9FTmV6NzlycUw0?=
 =?utf-8?B?QUozdjBDcG5UeVIyMjM5alF5Tzg3dlFrenluVjB0ZnZ6K0xYMGVRWEpDYlNw?=
 =?utf-8?B?M1NQY0ZpVUpMcmROWmNuNVphb2JCOGZEZjl3QWMramwyQ09xbkFNdE5vQ1B1?=
 =?utf-8?B?Wm5STk1RQ0dERTF2dnBkaEI0NTVVeVFZRE5GME0zUnVvZjhRc29BQ3VLOHZa?=
 =?utf-8?B?K205NGVXM0dubXpGUW15K3hLUmV4aTVpY1ZZS2NYWDluVjMvdUpVeCtkb1pM?=
 =?utf-8?B?alNYazhyQXU5YWxjRXVrdkhrV0JNU2lyQzVjWk1BNVY5N1VQejdHVXBuUit5?=
 =?utf-8?B?REpjWnFReDloUTRnM0tyUjhWV3pISFliOTNXTUROWFNpYTFPb3JZdlpnOE5W?=
 =?utf-8?B?eG9TeDRwQzhQWS9ibUZQM0NmRjBZUVpGSUxXdnVMbXpyQm9CMzBVZXpVaVkv?=
 =?utf-8?B?amVUZTNaTEpheDNsNVd4MzBpUWl5TmJyQVlFeENNNXFyYVFyWWQ0eTRLNHlR?=
 =?utf-8?B?cS9HQWI2SHZwaWdZTk9LdmNTQUdzSmJLVkhaMVVnYmJvcWd1N0VQVnR2OG9F?=
 =?utf-8?B?MWUwV0tqTWJ3UU50cDNKWkM4bjVJNkRxSVRxM1FNUkkwb0JnWVVVVzRRaERh?=
 =?utf-8?B?NHY0U1Rha3BNUGl0R0FuTW5uRDVsNmlScUQvV3NwNHR5VEZKcXo2eGVQOFlm?=
 =?utf-8?B?TnZXdXN5Uk9naGdwcjJOTGhYcFVKZVl4aUJXTm9DZENLNTh5TWhsQ1NJWW5M?=
 =?utf-8?B?RVBWMkhPZWRPNVZUYUlxYnZ4OVJ3WFNlRldXZlE1RVRBQmI0Vm9BWkF6SWdF?=
 =?utf-8?B?OWFsY0NqSHNQbElrS0hTYUdoOG9HZGkzUmdHN1hwNFZsWWpBb1F5a1dZWUMy?=
 =?utf-8?B?MHFjNStKL3IxMnNOK0lhYUpsbmhVNElRa0V2d3RCSlM3VjB0VG8ya2VkcWdO?=
 =?utf-8?B?Z1pqS2JscXhoTFBCbHdTeDRwNm5pTitsZlBVS1gvN3VlWUc2QnEvb1NtTUdv?=
 =?utf-8?B?bk9ndmRJWkZBd1crVkRabW9WN09xajVzNjVCRi9tbllWcldJZGU1d0xKR0hV?=
 =?utf-8?B?Zmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93c5e6bb-156d-4ab3-e014-08ddefb5563f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 15:27:07.4904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aN9RnCtc78VtpBKTgO6sG2ynCcCVxS2HwVcZrNgTlvTUQ0IYmfEDSl+x7yyrUSg3KjtsJxO5BvBBt/xyDBPsQ2XOrzkVBhrw2+v24hO/Ong=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5165
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


On 9/5/2025 4:56 PM, Daniele Ceraolo Spurio wrote:
> All recent platforms (including all the ones officially supported by the
> Xe driver) do not allow concurrent execution of RCS and CCS workloads
> from different address spaces, with the HW blocking the context switch
> when it detects such a scenario.
> The DUAL_QUEUE flag helps with this, by causing the GuC to not submit a
> context it knows will not be able to execute. This, however, causes a new
> problem: if RCS and CCS queues have pending workloads from different
> address spaces, the GuC needs to choose from which of the 2 queues to
> pick the next workload to execute. By default, the GuC prioritizes RCS
> submissions over CCS ones, which can lead to CCS workloads being
> significantly (or completely) starved of execution time.
> The driver can tune this by setting a dedicated scheduling policy KLV;
> this KLV allows the driver to specify a quantum (in ms) and a ratio
> (percentage value between 0 and 100), and the GuC will prioritize the CCS
> for that percentage of each quantum.
> Given that we want to guarantee enough RCS throughput to avoid missing
> frames, we set the yield policy to 20% of each 80ms interval.
>
> v2: updated quantum and ratio, improved comment, use xe_guc_submit_disable
> in gt_sanitize
>
> Fixes: d9a1ae0d17bd ("drm/xe/guc: Enable WA_DUAL_QUEUE for newer platforms")
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Tested-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>   drivers/gpu/drm/xe/abi/guc_actions_abi.h |  1 +
>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h    | 25 +++++++++
>   drivers/gpu/drm/xe/xe_gt.c               |  2 +-
>   drivers/gpu/drm/xe/xe_guc.c              |  6 +--
>   drivers/gpu/drm/xe/xe_guc_submit.c       | 66 ++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_guc_submit.h       |  2 +
>   6 files changed, 97 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> index d8cf68a0516d..1baa969aaa7c 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> @@ -117,6 +117,7 @@ enum xe_guc_action {
>   	XE_GUC_ACTION_ENTER_S_STATE = 0x501,
>   	XE_GUC_ACTION_EXIT_S_STATE = 0x502,
>   	XE_GUC_ACTION_GLOBAL_SCHED_POLICY_CHANGE = 0x506,
> +	XE_GUC_ACTION_UPDATE_SCHEDULING_POLICIES_KLV = 0x509,
>   	XE_GUC_ACTION_SCHED_CONTEXT = 0x1000,
>   	XE_GUC_ACTION_SCHED_CONTEXT_MODE_SET = 0x1001,
>   	XE_GUC_ACTION_SCHED_CONTEXT_MODE_DONE = 0x1002,
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index 0e78351c6ef5..265a135e7061 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -17,6 +17,7 @@
>    *  | 0 | 31:16 | **KEY** - KLV key identifier                                 |
>    *  |   |       |   - `GuC Self Config KLVs`_                                  |
>    *  |   |       |   - `GuC Opt In Feature KLVs`_                               |
> + *  |   |       |   - `GuC Scheduling Policies KLVs`_                          |
>    *  |   |       |   - `GuC VGT Policy KLVs`_                                   |
>    *  |   |       |   - `GuC VF Configuration KLVs`_                             |
>    *  |   |       |                                                              |
> @@ -152,6 +153,30 @@ enum  {
>   #define GUC_KLV_OPT_IN_FEATURE_DYNAMIC_INHIBIT_CONTEXT_SWITCH_KEY 0x4003
>   #define GUC_KLV_OPT_IN_FEATURE_DYNAMIC_INHIBIT_CONTEXT_SWITCH_LEN 0u
>   
> +/**
> + * DOC: GuC Scheduling Policies KLVs
> + *
> + * `GuC KLV`_ keys available for use with UPDATE_SCHEDULING_POLICIES_KLV.
> + *
> + * _`GUC_KLV_SCHEDULING_POLICIES_RENDER_COMPUTE_YIELD` : 0x1001
> + *      Some platforms do not allow concurrent execution of RCS and CCS
> + *      workloads from different address spaces. By default, the GuC prioritizes
> + *      RCS submissions over CCS ones, which can lead to CCS workloads being
> + *      significantly (or completely) starved of execution time. This KLV allows
> + *      the driver to specify a quantum (in ms) and a ratio (percentage value
> + *      between 0 and 100), and the GuC will prioritize the CCS for that
> + *      percentage of each quantum. For example, specifying 100ms and 30% will
> + *      make the GuC prioritize the CCS for 30ms of every 100ms.
> + *      Note that this does not necessarly mean that RCS and CCS engines will
> + *      only be active for their percentage of the quantum, as the restriction
> + *      only kicks in if both classes are fully busy with non-compatible address
> + *      spaces; i.e., if one engine is idle or running the same address space,
> + *      a pending job on the other engine will still be submitted to the HW no
> + *      matter what the ratio is
> + */
> +#define GUC_KLV_SCHEDULING_POLICIES_RENDER_COMPUTE_YIELD_KEY	0x1001
> +#define GUC_KLV_SCHEDULING_POLICIES_RENDER_COMPUTE_YIELD_LEN	2u
> +
>   /**
>    * DOC: GuC VGT Policy KLVs
>    *
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 34505a6d93ed..3e0ad7e5b5df 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -98,7 +98,7 @@ void xe_gt_sanitize(struct xe_gt *gt)
>   	 * FIXME: if xe_uc_sanitize is called here, on TGL driver will not
>   	 * reload
>   	 */
> -	gt->uc.guc.submission_state.enabled = false;
> +	xe_guc_submit_disable(&gt->uc.guc);
>   }
>   
>   static void xe_gt_enable_host_l2_vram(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index b3a6408a5760..ab1cc11a208c 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -888,9 +888,7 @@ int xe_guc_post_load_init(struct xe_guc *guc)
>   			return ret;
>   	}
>   
> -	guc->submission_state.enabled = true;
> -
> -	return 0;
> +	return xe_guc_submit_enable(guc);
>   }
>   
>   int xe_guc_reset(struct xe_guc *guc)
> @@ -1602,7 +1600,7 @@ void xe_guc_sanitize(struct xe_guc *guc)
>   {
>   	xe_uc_fw_sanitize(&guc->fw);
>   	xe_guc_ct_disable(&guc->ct);
> -	guc->submission_state.enabled = false;
> +	xe_guc_submit_disable(guc);
>   }
>   
>   int xe_guc_reset_prepare(struct xe_guc *guc)
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index bfc061da8f93..e377ba3a39b3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -32,6 +32,7 @@
>   #include "xe_guc_ct.h"
>   #include "xe_guc_exec_queue_types.h"
>   #include "xe_guc_id_mgr.h"
> +#include "xe_guc_klv_helpers.h"
>   #include "xe_guc_submit_types.h"
>   #include "xe_hw_engine.h"
>   #include "xe_hw_fence.h"
> @@ -316,6 +317,71 @@ int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
>   	return drmm_add_action_or_reset(&xe->drm, guc_submit_fini, guc);
>   }
>   
> +/*
> + * Given that we want to guarantee enough RCS throughput to avoid missing
> + * frames, we set the yield policy to 20% of each 80ms interval.
> + */
> +#define RC_YIELD_DURATION	80	/* in ms */
> +#define RC_YIELD_RATIO		20	/* in percent */
> +static u32 *emit_render_compute_yield_klv(u32 *emit)
> +{
> +	*emit++ = PREP_GUC_KLV_TAG(SCHEDULING_POLICIES_RENDER_COMPUTE_YIELD);
> +	*emit++ = RC_YIELD_DURATION;
> +	*emit++ = RC_YIELD_RATIO;
> +
> +	return emit;
> +}
> +
> +#define SCHEDULING_POLICY_MAX_DWORDS 16
> +static int guc_init_global_schedule_policy(struct xe_guc *guc)
> +{
> +	u32 data[SCHEDULING_POLICY_MAX_DWORDS];
> +	u32 *emit = data;
> +	u32 count = 0;
> +	int ret;
> +
> +	if (GUC_SUBMIT_VER(guc) < MAKE_GUC_VER(1, 1, 0))
> +		return 0;
> +
> +	*emit++ = XE_GUC_ACTION_UPDATE_SCHEDULING_POLICIES_KLV;
> +
> +	if (CCS_MASK(guc_to_gt(guc)))
> +		emit = emit_render_compute_yield_klv(emit);
> +
> +	count = emit - data;
> +	if (count > 1) {
> +		xe_assert(guc_to_xe(guc), count <= SCHEDULING_POLICY_MAX_DWORDS);
> +
> +		ret = xe_guc_ct_send_block(&guc->ct, data, count);
> +		if (ret < 0) {
> +			xe_gt_err(guc_to_gt(guc),
> +				  "failed to enable GuC sheduling policies: %pe\n",
> +				  ERR_PTR(ret));
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +int xe_guc_submit_enable(struct xe_guc *guc)
> +{
> +	int ret;
> +
> +	ret = guc_init_global_schedule_policy(guc);
> +	if (ret)
> +		return ret;
> +
> +	guc->submission_state.enabled = true;
> +
> +	return 0;
> +}
> +
> +void xe_guc_submit_disable(struct xe_guc *guc)
> +{
> +	guc->submission_state.enabled = false;
> +}
> +
>   static void __release_guc_id(struct xe_guc *guc, struct xe_exec_queue *q, u32 xa_count)
>   {
>   	int i;
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index 6b5df5d0956b..e20ccafdfab5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -13,6 +13,8 @@ struct xe_exec_queue;
>   struct xe_guc;
>   
>   int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids);
> +int xe_guc_submit_enable(struct xe_guc *guc);
> +void xe_guc_submit_disable(struct xe_guc *guc);
>   
>   int xe_guc_submit_reset_prepare(struct xe_guc *guc);
>   void xe_guc_submit_reset_wait(struct xe_guc *guc);
