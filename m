Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA82C531DF
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 10:35:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 363D810E701;
	Tue, 20 Aug 2024 10:35:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H8605yeL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE5E510E701
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 10:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724150110; x=1755686110;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=f3GNCObXPeJheGZVymkFwvNp2EBluRvb1atJcyTrjyg=;
 b=H8605yeLBjH0nNKrg0ePi9Yk3Q1Ibh7ngLvRe8ILMlVHCTOtljbG93zE
 5onrhJ+arzgI9hTaaNwd0t3FvgfFuWEDuGLlHs95dJvo3wKZ6CeQJJEj8
 H1c0/4HHjhIOPRpEsYo8URqSylAX11JKY/zi/cDgIxI5Kby2R1T4qFqj3
 KiQMmVdOLF87/icE04b2Deha3xNrBEqKRnPCkRKlGPJYX/ZoPEIzWzNJS
 rY307+KlvsBmc8qGpWnNjFkSbSa8cLoJzVHtTgIwdLDdzd7S2Z+jMQpIc
 dUrviO1vk4nCpNH9tzP3J6yTAWMslmEGcrWQKdIU+4DhuiXhzf4nObIty w==;
X-CSE-ConnectionGUID: C4jUH26hT5OYeo8pg/4cWQ==
X-CSE-MsgGUID: xTyKFIqsR7ynE1imtCVPnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="33594800"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="33594800"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 03:35:08 -0700
X-CSE-ConnectionGUID: gVgfqkbvTlm68wVmg1ZALA==
X-CSE-MsgGUID: q1aeIqYSRiGdqUQLBwqVVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="64872365"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Aug 2024 03:35:07 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 03:35:07 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 03:35:07 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 03:35:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Omgpu/XQnF/O6QNoe6g5oQnmLhLEbv1i1BTt1Nm00z7Yggy6SDjwvYbMbFcOmcwVyIUAMlXwrr1Kr5B09WJKe33UKvq9FK4TBbDo8UCu03ycyz6+luM6r+yoHguyTRbZZFpmcwRObjvfEcQ6O0nVRxHUp192wYE53DXPqfAt4YvVFSBDjN8eKx1nEO6FTUjFQ6v62DwSDPAQMqYWTg6O0nfKZ+VMvk3NvESvXPVDvtK76VFBWy/NaodCC18+JhFDfA8Z/uC1K5sw5vygXH28zQjn98S1/DbI1LQzdAqNAVN4jPkX491AAhXKlRTViwTY5ABOV9ppjrbmqX9GVh8eLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TOnGisUOGL50l7Ct6VM7b9zDDFu/S4NMYtiG4GyKMgI=;
 b=f/FIENetBnIxkcEd1Stpt1NXgLUB8VkMrny0oOTRZHxRrMwHnNcFgdXBv/7ms4ZIzMI/zSez46wPsGRrM2i1Wx4KBJDjQgC76uLy7QwNbuoCW5PnMeP+tpmh4f/JacBvqMv4sRGFO+ZoxueydBGKkQqzefe3HmV0LcnFPR0PxDc4DWGOH+JcexxNUh1U7ZaHl5SNVLlJIoNnrxnLG+SIcYBh3/xbuLwfaMUi+ZqKX6KA6nmT/NoQfjlZsV/a8wwm12QZMRHYKmWMc44+PjNB6y4hgwmcKlgiSJD42LMN37hI5WZULh/0UgFSQCsuLfjRoetE7zenbQjdW2DsFjH8Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH0PR11MB5032.namprd11.prod.outlook.com (2603:10b6:510:3a::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.21; Tue, 20 Aug 2024 10:35:04 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%5]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 10:35:04 +0000
Message-ID: <2281f0bf-6b84-426f-8484-2f93d31f166b@intel.com>
Date: Tue, 20 Aug 2024 16:04:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe/xe_gt_idle: add debugfs entry for
 powergating info
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <matthew.d.roper@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
References: <20240801095305.1209046-1-riana.tauro@intel.com>
 <20240801095305.1209046-3-riana.tauro@intel.com>
 <8f3bb44d-fdd7-45ae-8b46-2a41fb5ed45d@intel.com>
 <bd7dfd17-0052-4176-8977-5b2b3bacbfad@intel.com>
 <b57ef7fc-999e-4622-bdef-5cf6c1ca3391@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <b57ef7fc-999e-4622-bdef-5cf6c1ca3391@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0114.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::12) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH0PR11MB5032:EE_
X-MS-Office365-Filtering-Correlation-Id: 108e0b37-74af-4c99-f3ab-08dcc103c092
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RHB1OG1QdjdoWU1XbmtlK0UveEo3MUlMcWwycHBIMlhPb2RKczhaeWFvbkc1?=
 =?utf-8?B?cFZCMldmTU8xb3FtSjFaNUY5QU1obnkvWDhmNkJrWkkyTHZNRk4vR1pabERO?=
 =?utf-8?B?SzhRVVJpV0JMVUd2TUtGWW94bnJTdVFWbWR3NTdUWWR2ZklxOHRQb0dRenNR?=
 =?utf-8?B?eHFlcmZuclREQWlvZXBIRVJrakkweVo5QVBuU1dWZUxIWnRvMWhsdkNWelNJ?=
 =?utf-8?B?TzlmUmJqWmQ2MmVBNWgzYzdFdVJ1VUcrYXhoYU92b0hiR0EvbFFpbEFSK016?=
 =?utf-8?B?ZnVON2NZR1dkVmZ5ZmNEMDYvSllWbkVzOTRUS1BCQk03ai9RT0ppR3kxcDR6?=
 =?utf-8?B?Z2R5SkhNcitEUFd1ano5d29zNEdUYlJXUjRXbXpiZEtIWXZHOGJxWlRtOXVx?=
 =?utf-8?B?SzZ5TGhUeFdPbmxKSHpOMkQ1WlhibWozZTJYeVowVFI0VzRJaEwyNEdYcDdj?=
 =?utf-8?B?Y3NrbkxVdS9nanMxUlQwaWh2S3pOdVBabTl6QWNhdkYxMjVOZFhGUUFIME9h?=
 =?utf-8?B?eEN6bGY4d0tSRTViQ29Eb0UxYW91VFFGbkh3SEF6eFhpR1VrSjBEeURqNXN5?=
 =?utf-8?B?cjBjWWNjUzU2TUlLVUJ0b2k4UUMySlN4bDJYRzY1Sk1OaDBHVEswOGErYUxQ?=
 =?utf-8?B?bTZkZVBBRmJTcXJHNVBiWEhDVytaUXdQNkp6REpWbUVXUmFmc0tkT3kxVWFG?=
 =?utf-8?B?UGhiOVU4NVo2WmUyRURZU0ZWUFlTdFZnQjRqZlphL0orUDd6R3pZVVF2Tjd5?=
 =?utf-8?B?UmFiV0FlNFFxN1RIL3RGMlFwZXNTUmltaE9hNmw0b1BST2UwUkNuRStRY3hE?=
 =?utf-8?B?MnBvVWhrdlkzNkZlb2dOeUprdU9JclVpRzRVN3h6WE45K3h4MTBOVjVncm9l?=
 =?utf-8?B?bUFzL1Z2SnU2ZzNhcGNhL3lPZzRCekw1RW9hN2hndFJ0ektCYllpWEJhQWJ1?=
 =?utf-8?B?aEU5b1NaSzJyeXhINXI5RHdQblRZQ3I5YUh3YzgvQUM3bDNHUnBtbGVPekdh?=
 =?utf-8?B?WUY3U3hPazNRRDRiSGVNNDZZTC8waFBkVjRxNE5KaFp6MEZUTU93Smg0SHJZ?=
 =?utf-8?B?Y3pPQVVVVTJtMXkwWVBsV0VpNUx6aXZpMXY0VVh3TUNNT1FiSTR6YVpWeXdS?=
 =?utf-8?B?SG5LcjJBSzlyWldqRk54cTNBL20ySDV0OTh6clF4bUpyUjhRNUYrUThuVGN5?=
 =?utf-8?B?ZDNOUWcxMUYwd2UyUFo4aEVkZVkrWm02N0xZNjNtdmZySkNmRGpIKy9QRlBo?=
 =?utf-8?B?K2p0aHhHTHNwUVArd0t6eU5ha2h2NFhLMUxuWDJuSFdBL2xvYVpPeUpSZ1NE?=
 =?utf-8?B?NDFzOEdETDBSUm1ERnI0ejZSM2FQZHhCVm1tTnRvWUNMNmI2QzVLWGhIN1BL?=
 =?utf-8?B?dDdBNUFuY2t5MFMzUWVwZlpndi9uZDN1WmwvZS9heThSeVlBdXlMZWJ5Nmxx?=
 =?utf-8?B?dENjNWFuWUdrN0hCeGlZSGtRWGZacmowRnp4eWlHUThpbUwvczNxZlNBNURL?=
 =?utf-8?B?ZWpVdlE1L0xVUkhMNE5YSVE4emJZZ2c3R0x2V1dtTXl0dS81WWlneVJjcXlO?=
 =?utf-8?B?OUJQdTVEZzRKS3N2aWkrMGlWTW0zM2tkalJuOFhISkZmeTMrMEZBNlFhcHlD?=
 =?utf-8?B?T0l1QjNZakhaQ2IrdlQzd0VvVS9sNVQ1L3hVdmltZDVuL0UreXRzQlZRNEZL?=
 =?utf-8?B?UDlFRVcyUEt4b3ZwVnB3NytsYnZxcisrU2xGL3VhNk9tVmFFRG1GSHZPSENi?=
 =?utf-8?Q?uJcm6di1xI4oAIlf5Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEQyQ3ZPV3dBUlZ5NVFMYm9zaUVPakMvWjNEck8weTJyQzhRbW9qY1pFVXZF?=
 =?utf-8?B?S3E5dVR1Q0FEclZLNzVsU2JxVlVEcktTQ0hZV21nUWtIUnlENzB5TWVMWlR5?=
 =?utf-8?B?NmlHN1hOQTR0Umxoc1Zsa3FpQ1NhQTZPdWtqSElBbHRFbmZDOS9rNVBDa2hw?=
 =?utf-8?B?OVB3c0Nic3hING5lK2FLd0x2VjJsMFRmRW02SDZ1U1BvanVTdDA3anEzUXlU?=
 =?utf-8?B?Q1VWUnFyb0Y4bTZoL3g2ZE9JWHZveThiR09ucTBwVkNIeFJVUDJUb1d4VVNj?=
 =?utf-8?B?T0hwTXFoYmg5UnkxTlpTZC9uUEVhTXgwR2MyWldHbHJTUnYvWHNvaGZSWkZV?=
 =?utf-8?B?ZGRLU3pzVnZKLy93M1UrRjkvcGtlbEZ3eGZuVmJEakN6dUgwTmZZLzE3czdh?=
 =?utf-8?B?Nllxa1dHdlYyZ2JhYndTWUJmSHdGYm0zWGk4UlRyNTd2cFRGbGEzdUhpOFF5?=
 =?utf-8?B?V0lRUUJwd1ZUTGlZVWJhaE91eHRPUEdwalB2cWhZS2VJQy9wclJQNnJXdUZQ?=
 =?utf-8?B?WU0yOGlGSzdJNC90N0ZmOHR0aVRzQjBuQi9Sd1VIa2lmRXN1RFMzNnJlU3NB?=
 =?utf-8?B?Ym8vcHJ5QkxpWjFZZjNlTU5nZlgyNlNTUHd2N3NnY09ZSVdpZHN5RGxqOENV?=
 =?utf-8?B?Z2Zhd3IwUVlYNi9sNENuei9hK3UzNFdzcll4eHFYaFhRVTRlMjlzZmxJZk1i?=
 =?utf-8?B?OW9BcnlOYlBSL0hSQWNZOXp3Q3ZtR2t2U0pkQmhsTnNEVjhYVzl0RnFFdVlZ?=
 =?utf-8?B?U25NbHExa2Q0T3gzYkppZzBGVUt5a1l4MjhaemN3cFVWR3hiYnU3akxZRHVv?=
 =?utf-8?B?SzBIaGRoYmZWQ0RqYWk3empkd2N1VG1QVGt6cnF5YzJaTVV3b21lVmY0dVpY?=
 =?utf-8?B?Z3FYdWx5dm5CeDJaSnlieGgxaEVVc1YrSm1VVG1SUStMdlFBbnUvQjR1b3JZ?=
 =?utf-8?B?WTAxekdQcTNnZGgxa0dXQlBuRUh2bDM3RnZlQjA0VmhNTHVxK2haampFeDl6?=
 =?utf-8?B?QlorOWcxcDlUazVhL0xZKzJodjZFNVVVK25uK0pKNmRkK3R0WExuWUpNaHN5?=
 =?utf-8?B?Q0l6VzNXY1E2MllqSUx1dlNQVTUvUGZaeERvanhYK2svSDJZb2JvZVpkRFFO?=
 =?utf-8?B?UmpaUi9rVm5hV3habzFSSXl6L0FDeTNzSkYxL2JyZEZBenpUWjg0aFI5SW1T?=
 =?utf-8?B?eDExKzNJN3VUZUlLUDZYeFBOZ3c0WERIRVNVcXkzZ0Q5THNXY3dFZ1huUEJ4?=
 =?utf-8?B?bGhxK0xzRmVaUDJmcVgxNDVGN3pFQ3FaOW5zTzFQS3FoWmRWY0RKdDNFOXdH?=
 =?utf-8?B?TFVHbXA0Sk80RE1sY0dzb1NGU25CZ040L2NubEdQNm0rSGo1RHUyUWNaTUFS?=
 =?utf-8?B?a2tzcnFnMjBBd1JYSUx3VGJnd2ozOTZpbzFWMlFlRFoxeE56L1BEaWFSbE94?=
 =?utf-8?B?YVJQaCtIWjJLaUoxNHNXVUFmdkZUK2hMSW9RVWtobXVEMGpCeFFPcjFJMld2?=
 =?utf-8?B?SHlVS3JuNXFzRDlSUmlIY29JWXFnYllNMG0rb3dWWVcrL25XdWkzZUxCa0FU?=
 =?utf-8?B?VzQzMTZwWFBqU29UbEZBYnU5WEtSejNKdndPYTdaUEs1RWJIYnRSY2RVbEJv?=
 =?utf-8?B?em53WXJqejA4U1g0SXR0eFRiY3IxU2VFZE5sdzNjb0hvUkYwdnFZdTJudE55?=
 =?utf-8?B?c2sxa0JYUFRFc3gxR3hLOGMremtTN0R1Q2FSTXhBbGZyaWt2dGExcC9qTDJO?=
 =?utf-8?B?NmwydTc2bTVjQ0gyOElqTG1pVGJzWVZJUzlBQTJpTmxRMlEvYlA5cDBESkpu?=
 =?utf-8?B?NWJ0N2RKZ05QdlpmWnRaT2ExWXdFYVdSZmExYitNWWhMOHhZMWJGUVI2anFL?=
 =?utf-8?B?R0hIMHlsQzRyRUd1cU8zaGFpOHpTaHgzb05lQllMZnBmM0VqZnhXWlkwa05K?=
 =?utf-8?B?dUpob2ZTWXFIZFJGdnF5NWIwQURjSTg0WURidDRScHlsZGZoZXpLdHZxdm5y?=
 =?utf-8?B?QUp5cFFEb2Z2enQ1SlFBdkV6NE52Sm5UbFI1MkhIWlQ5L2N4K3lmSTVUWHcz?=
 =?utf-8?B?a215U09WRDBRT0pIOFJZOEYxQzlHanpjQ1lJN1VoQ1JaNk85QXRYY3djbHY4?=
 =?utf-8?Q?Uz63eg7qdIZp0o3F0HapNzH7A?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 108e0b37-74af-4c99-f3ab-08dcc103c092
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 10:35:04.3219 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: idyrv+pdO/LSmYZG6vbAVrrCYzio1WQvZQxx2z1IYmHOlFPuTpzCy3NMXvusdM6qMRQypVMjUOd+na29Vz6erQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5032
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


Hi Badal

On 8/6/2024 5:29 PM, Nilawar, Badal wrote:
> 
> 
> On 01-08-2024 18:46, Riana Tauro wrote:
>>
>>
>> On 8/1/2024 3:33 PM, Nilawar, Badal wrote:
>>>
>>>
>>> On 01-08-2024 15:23, Riana Tauro wrote:
>>>> Coarse Powergating is a power saving technique where Render and Media
>>>> can be power-gated independently irrespective of the rest of the GT.
>>>>
>>>> For debug purposes, it is useful to expose the powergating information.
>>>>
>>>> v2: move to debugfs
>>>>      add details to commit message
>>>>      add per-slice status for media
>>>>      define reg bits in descending order (Matt Roper)
>>>>
>>>> v3: fix return statement
>>>>      fix kernel-doc
>>>>      use loop for media slices
>>>>      use helper function for status (Michal)
>>>>
>>>> v4: add pg prefix
>>>>      do not wake GT if in C6 (Badal)
>>>>
>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h |  8 +++
>>>>   drivers/gpu/drm/xe/xe_gt_debugfs.c   | 13 ++++
>>>>   drivers/gpu/drm/xe/xe_gt_idle.c      | 91 
>>>> ++++++++++++++++++++++++++++
>>>>   drivers/gpu/drm/xe/xe_gt_idle.h      |  2 +
>>>>   4 files changed, 114 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h 
>>>> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>>> index 3b87f95f9ecf..279d862c306a 100644
>>>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>>> @@ -337,6 +337,14 @@
>>>>   #define   CTC_SOURCE_DIVIDE_LOGIC        REG_BIT(0)
>>>>   #define FORCEWAKE_RENDER            XE_REG(0xa278)
>>>> +
>>>> +#define POWERGATE_DOMAIN_STATUS            XE_REG(0xa2a0)
>>>> +#define   MEDIA_SLICE3_AWAKE_STATUS        REG_BIT(4)
>>>> +#define   MEDIA_SLICE2_AWAKE_STATUS        REG_BIT(3)
>>>> +#define   MEDIA_SLICE1_AWAKE_STATUS        REG_BIT(2)
>>>> +#define   RENDER_AWAKE_STATUS            REG_BIT(1)
>>>> +#define   MEDIA_SLICE0_AWAKE_STATUS        REG_BIT(0)
>>>> +
>>>>   #define FORCEWAKE_MEDIA_VDBOX(n)        XE_REG(0xa540 + (n) * 4)
>>>>   #define FORCEWAKE_MEDIA_VEBOX(n)        XE_REG(0xa560 + (n) * 4)
>>>>   #define FORCEWAKE_GSC                XE_REG(0xa618)
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c 
>>>> b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>>> index 5e7fd937917a..47e3a1ca2394 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>>> @@ -15,6 +15,7 @@
>>>>   #include "xe_ggtt.h"
>>>>   #include "xe_gt.h"
>>>>   #include "xe_gt_mcr.h"
>>>> +#include "xe_gt_idle.h"
>>>>   #include "xe_gt_sriov_pf_debugfs.h"
>>>>   #include "xe_gt_sriov_vf_debugfs.h"
>>>>   #include "xe_gt_topology.h"
>>>> @@ -107,6 +108,17 @@ static int hw_engines(struct xe_gt *gt, struct 
>>>> drm_printer *p)
>>>>       return 0;
>>>>   }
>>>> +static int powergate_info(struct xe_gt *gt, struct drm_printer *p)
>>>> +{
>>>> +    int ret;
>>>> +
>>>> +    xe_pm_runtime_get(gt_to_xe(gt));
>>> In suspend resume path I am seeing PG disabled and enabled. Will it 
>>> cause any race while this debugfs entry is being exercised?
>>
>> I checked the suspend cases and the enable_pg is called before the print. 
> Ok.
> But there might be a case where we check the idle_status and see
>>   C6 but before dumping it might be in C0, reporting wrong status
> Yes this can happen. The commit message indicates that the intention is 
> to view the PG status regardless of the GT status. 

The commit message was only to give a brief of what CPG means.
> Therefore, it doesn’t 
> make sense to force wake the GT when it is in C6.
Agreed. yeah the changes are added in the rev. Wanted to let you know
the above scenario regarding the race condition.
> However, if you believe we should always wake the GT regardless of its 
> state to check the PG status feel free to do that change and rephrase 
> the commit message accordingly.
> 
> Regards,
> Badal
>>
>>>> +    ret = xe_gt_idle_pg_print(gt, p);
>>>> +    xe_pm_runtime_put(gt_to_xe(gt));
>>>> +
>>>> +    return ret;
>>>> +}
>>>> +
>>>>   static int force_reset(struct xe_gt *gt, struct drm_printer *p)
>>>>   {
>>>>       xe_pm_runtime_get(gt_to_xe(gt));
>>>> @@ -277,6 +289,7 @@ static const struct drm_info_list debugfs_list[] 
>>>> = {
>>>>       {"topology", .show = xe_gt_debugfs_simple_show, .data = 
>>>> topology},
>>>>       {"steering", .show = xe_gt_debugfs_simple_show, .data = 
>>>> steering},
>>>>       {"ggtt", .show = xe_gt_debugfs_simple_show, .data = ggtt},
>>>> +    {"powergate_info", .show = xe_gt_debugfs_simple_show, .data = 
>>>> powergate_info},
>>>>       {"register-save-restore", .show = xe_gt_debugfs_simple_show, 
>>>> .data = register_save_restore},
>>>>       {"workarounds", .show = xe_gt_debugfs_simple_show, .data = 
>>>> workarounds},
>>>>       {"pat", .show = xe_gt_debugfs_simple_show, .data = pat},
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c 
>>>> b/drivers/gpu/drm/xe/xe_gt_idle.c
>>>> index 7188542aea43..2ab0eaafa7d7 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>>>> @@ -53,6 +53,11 @@ pc_to_xe(struct xe_guc_pc *pc)
>>>>       return gt_to_xe(gt);
>>>>   }
>>>> +static inline const char *str_up_down(bool v)
>>>> +{
>>>> +    return v ? "up" : "down";
>>>> +}
>>>> +
>>>>   static const char *gt_idle_state_to_string(enum xe_gt_idle_state 
>>>> state)
>>>>   {
>>>>       switch (state) {
>>>> @@ -147,6 +152,92 @@ void xe_gt_idle_disable_pg(struct xe_gt *gt)
>>>>       XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>>>>   }
>>>> +/**
>>>> + * xe_gt_idle_pg_print - Xe powergating info
>>>> + * @gt: GT object
>>>> + * @p: drm_printer.
>>>> + *
>>>> + * This function prints the powergating information
>>>> + *
>>>> + * Return: 0 on success, negative error code otherwise
>>>> + */
>>>> +int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
>>>> +{
>>>> +    struct xe_gt_idle *gtidle = &gt->gtidle;
>>>> +    struct xe_device *xe = gt_to_xe(gt);
>>>> +    enum xe_gt_idle_state state;
>>>> +    u32 pg_enabled, pg_status = 0;
>>>> +    u32 vcs_mask, vecs_mask;
>>>> +    int err, n;
>>>> +    /*
>>>> +     * Media Slices
>>>> +     *
>>>> +     * Slice 0: VCS0, VCS1, VECS0
>>>> +     * Slice 1: VCS2, VCS3, VECS1
>>>> +     * Slice 2: VCS4, VCS5, VECS2
>>>> +     * Slice 3: VCS6, VCS7, VECS3
>>>> +     */
>>>> +    static const struct {
>>>> +        u64 engines;
>>>> +        u32 status_bit;
>>>> +    } media_slices[] = {
>>>> +        {(BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS1) |
>>>> +          BIT(XE_HW_ENGINE_VECS0)), MEDIA_SLICE0_AWAKE_STATUS},
>>>> +
>>>> +        {(BIT(XE_HW_ENGINE_VCS2) | BIT(XE_HW_ENGINE_VCS3) |
>>>> +           BIT(XE_HW_ENGINE_VECS1)), MEDIA_SLICE1_AWAKE_STATUS},
>>>> +
>>>> +        {(BIT(XE_HW_ENGINE_VCS4) | BIT(XE_HW_ENGINE_VCS5) |
>>>> +           BIT(XE_HW_ENGINE_VECS2)), MEDIA_SLICE2_AWAKE_STATUS},
>>>> +
>>>> +        {(BIT(XE_HW_ENGINE_VCS6) | BIT(XE_HW_ENGINE_VCS7) |
>>>> +           BIT(XE_HW_ENGINE_VECS3)), MEDIA_SLICE3_AWAKE_STATUS},
>>>> +    };
>>>> +
>>>> +    if (xe->info.platform == XE_PVC) {
>>>> +        drm_printf(p, "Power Gating not supported\n");
>>>> +        return 0;
>>>> +    }
>>>> +
>>>> +    state = gtidle->idle_status(gtidle_to_pc(gtidle));
>>>> +    pg_enabled = gtidle->powergate_enable;
>>>> +
>>>> +    /* Do not wake the GT to read powergating status */
>>>> +    if (state != GT_IDLE_C6) {
>>> How about if (pg_enabled && state != GT_IDLE_C6) ?
>> Always enabled so would be unnecessary check
> If gt_resume fails the PG will not be reenabled.

If gt resume fails, the device will be in a bad state.
>>>> +        err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>>> +        if (err)
> I still think we should do force_wake_put here.
> Check the discussion here. 
> https://patchwork.freedesktop.org/patch/596760/?series=134121&rev=4
This patch was not merged with the suggested changes.
https://patchwork.freedesktop.org/patch/596933/?series=134437&rev=1 
still seems to be under discussion.

Will fix this once the approach is decided in another patch.
>>>> +            return err;
>>>> +
>>>> +        pg_enabled = xe_mmio_read32(gt, POWERGATE_ENABLE);
>>> Is this needed?
>> can remove this
Isn't it better to read this, the previous value would be saved
before the write.

Thanks
Riana Tauro
> Ok
> 
> Regards,
> Badal
>>
>> Thanks,
>> Riana
>>>
>>> Regards,
>>> Badal
>>>> +        pg_status = xe_mmio_read32(gt, POWERGATE_DOMAIN_STATUS);
>>>> +
>>>> +        XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>>>> +    }
>>>> +
>>>> +    if (gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK) {
>>>> +        drm_printf(p, "Render Power Gating Enabled: %s\n",
>>>> +               str_yes_no(pg_enabled & RENDER_POWERGATE_ENABLE));
>>>> +
>>>> +        drm_printf(p, "Render Power Gate Status: %s\n",
>>>> +               str_up_down(pg_status & RENDER_AWAKE_STATUS));
>>>> +    }
>>>> +
>>>> +    vcs_mask = xe_hw_engine_mask_per_class(gt, 
>>>> XE_ENGINE_CLASS_VIDEO_DECODE);
>>>> +    vecs_mask = xe_hw_engine_mask_per_class(gt, 
>>>> XE_ENGINE_CLASS_VIDEO_ENHANCE);
>>>> +
>>>> +    /* Print media CPG status only if media is present */
>>>> +    if (vcs_mask || vecs_mask) {
>>>> +        drm_printf(p, "Media Power Gating Enabled: %s\n",
>>>> +               str_yes_no(pg_enabled & MEDIA_POWERGATE_ENABLE));
>>>> +
>>>> +        for (n = 0; n < ARRAY_SIZE(media_slices); n++)
>>>> +            if (gt->info.engine_mask & media_slices[n].engines)
>>>> +                drm_printf(p, "Media Slice%d Power Gate Status: 
>>>> %s\n", n,
>>>> +                       str_up_down(pg_status & 
>>>> media_slices[n].status_bit));
>>>> +    }
>>>> +    return 0;
>>>> +}
>>>> +
>>>>   static ssize_t name_show(struct device *dev,
>>>>                struct device_attribute *attr, char *buff)
>>>>   {
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h 
>>>> b/drivers/gpu/drm/xe/xe_gt_idle.h
>>>> index 554447b5d46d..4455a6501cb0 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_idle.h
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
>>>> @@ -8,6 +8,7 @@
>>>>   #include "xe_gt_idle_types.h"
>>>> +struct drm_printer;
>>>>   struct xe_gt;
>>>>   int xe_gt_idle_init(struct xe_gt_idle *gtidle);
>>>> @@ -15,5 +16,6 @@ void xe_gt_idle_enable_c6(struct xe_gt *gt);
>>>>   void xe_gt_idle_disable_c6(struct xe_gt *gt);
>>>>   void xe_gt_idle_enable_pg(struct xe_gt *gt);
>>>>   void xe_gt_idle_disable_pg(struct xe_gt *gt);
>>>> +int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p);
>>>>   #endif /* _XE_GT_IDLE_H_ */
