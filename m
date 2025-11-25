Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936D1D0EE13
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 19:47:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A66910E450;
	Tue, 25 Nov 2025 19:47:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oJWMTfC7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F6B10E450
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 19:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764100078; x=1795636078;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=EHlc2XIV6K10o8MXssor7PU0cJe7FyHamekWWu3fmjw=;
 b=oJWMTfC7J+0xZDUloH1oNV9LYc/xykEF7YZot0WHplrIfyRn+LOXxn4X
 nLokTt+vEQEI9QyT/X0F6jeHqchxAb4EfCWXs+BynHAQ9ubaXjkuYq8Rd
 8s4K/IDKk5q5U0sV6A4A6TFns1hfqE94Un3z+ktXNp1ZkNk63ava4cwUw
 qLyyDcG8BZWZ3lOOYE6QinHSd73YpL6FqvBNVuB1pFmdRmSpulFVCDGJc
 Hv/S0NfsKHEaOe1MtM+XHlKRRExGh7+nXAvTfdWAMtZv/MRcINm55xFay
 8OqJVD9Yhr9hH0FoOv9gu62xmuUkXCTrGZRmOzvEcANGDLkuT0TpxGQol w==;
X-CSE-ConnectionGUID: AqcpIeUPQ2OVsVpT78PqTA==
X-CSE-MsgGUID: 0H/744aES52rRa4XdzAMxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="65129278"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="65129278"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 11:47:57 -0800
X-CSE-ConnectionGUID: laanCybDR+u1rIyD0Ct8Rg==
X-CSE-MsgGUID: iNOcsSR8Qdu9pPX3pZEmCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="197048768"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 11:47:57 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 11:47:57 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 11:47:57 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.57) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 11:47:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yxGSbV16/f+fFD+YZ6pFBsXOSG7xN04rKpccdYjyPDe/v8c43RCQv01LtFZCvTmTMZ/Kc63g/UcLcc8PXD8opuraB6X/hLxEQjnAM6vg60BU4Ci05BqzA09BHekNtjtnYJDI8uNTn8HWb2u5QAxJ7Zp8j08g5IVSmm7Rym8bQWbyvxPVwqkbQPERu1d+eiJnLQ2iteVmxcMgtaVL2ZOOeNLDXgMK6riqMh7jYpN/8TN1rk/5gocHWKmR8i+75AD1mce6gtcU5SCR8NcLwTUyHgCUeQkW4I7QiVNtI8c2S+rCP0/xlRmww/Sm+E5DUyBIibIywUiyetRIAHNryCK1+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EHlc2XIV6K10o8MXssor7PU0cJe7FyHamekWWu3fmjw=;
 b=ak1Yl5p84DRqQYDRxBUsc1sZsNpg/W0zgqmdD1MKduMJEWhAjESPhZFTJ9lsqzAb76abtfFJ7drQreKeLMFWkOx0i6eI5j0NV5fyvS7u+1dU0Qhrdd5U7aqoy4y5E0ZlZsj13tQF7NOfRt37PvljpHhGUBALhb1P2+xwsP6HkbV5Xblz5gr3+7dL2hOtt3rRnnEWRNB1UyfDB4AQLN+bP9RpP84oKsyXbiml99ZrIW5vPOa846x8uxlAxQC3V3W1Ml2feImZyGMlNA5V7CR/510RbCYLmRRemaB2uh0rk15TdlzCGscsNYGTjefBfFOHDucdTx0yD/SZtKyXvp3NiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by MW3PR11MB4602.namprd11.prod.outlook.com (2603:10b6:303:52::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.18; Tue, 25 Nov
 2025 19:47:55 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%6]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 19:47:54 +0000
Message-ID: <6541bb0b-f5d0-4143-bb80-decae2dbc173@intel.com>
Date: Tue, 25 Nov 2025 11:47:52 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/6] drm/xe/guc: Add GuC log init config in LFD format
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250828174159.1232994-1-zhanjun.dong@intel.com>
 <20250828174159.1232994-4-zhanjun.dong@intel.com>
 <98cbe993-463d-448b-8c76-7b109d008673@intel.com>
 <3d139b75-0fb2-4d4c-9b6c-eaf0a167b084@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <3d139b75-0fb2-4d4c-9b6c-eaf0a167b084@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0101.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::42) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|MW3PR11MB4602:EE_
X-MS-Office365-Filtering-Correlation-Id: 544e0a1d-e94c-40ee-4f0a-08de2c5b86af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YTd2SXZEUitkNWF4RGNQUGZUdWdrMkI3NzhWM1c3OXhXOHJ2MllYNXdHMnlj?=
 =?utf-8?B?MVI1RkczU3hHODltRUNRMUw3dEtPcTIyRTh5OGxXeUhKZHpmU0JsQXJNY0ln?=
 =?utf-8?B?R1B4QkpCQkU2WHlxOXo5dkVCS3NiRWt0UkRITzFPekpFbWJ6cnFidWtkZjJ6?=
 =?utf-8?B?NmtBNGZZUjJ5TzcvdG0xNEw2TGp3b2dxRWdoWUxXV3IyNkFzOUptaG5ua0VD?=
 =?utf-8?B?UkFzbWp2UkhqNHR3M0lqL04vUDBsK3BwbEZtWEtVZlhDRFpDd2pxbGo2ZUJv?=
 =?utf-8?B?RStxMk1CU0hmMkNKbzFNakF5ajVIYTQrbG5rcjVCQVFnNFdUTjlEbnUwTEtT?=
 =?utf-8?B?SDVsR28vTlM3RzhsNE5vSTNGMG5KdnY0QkRyNEhhSy8zdlpmRmlRcHY0ZXlv?=
 =?utf-8?B?SENvdFYzUEFIQzBPUVBlbnBsbEFUbGM3cExtWk03TTcyV0Q2V0xQSm5CQ1Fh?=
 =?utf-8?B?Y2Y3cExQWVd2ZmEzNW82M0QyRDE1Q2NtTjBpTXJ0SjBWTFExN1l3QUNWU25j?=
 =?utf-8?B?b1lwNlMwcUlNdUw0ampNUDkzSkNhWWNYSmUwY2tQcW55c3M1bmM1aW5MQ1p0?=
 =?utf-8?B?eXJqekphbmlXdU1FYzFPZE4zbjNrQm10NkFYTmJYR0RqS1dOcS93VllQRnR5?=
 =?utf-8?B?RDlBa3RRVWhXcnE3eXhFKzVHeWtqejhWY0FrTTliTlYrL1Z6czVGOGE0cnNQ?=
 =?utf-8?B?eDc0d3NmQnU0cHRpVU10ZHRmYVVTMEZSNmRoa0FYUGlLM0ZqbWtwL2cvbjRi?=
 =?utf-8?B?SGZIUUpZVTJFc1R2NXd6dkppaTN5VDNXNDV0bEhiNXU1WGdFRjRJTXFSY0xn?=
 =?utf-8?B?K1BBVkZyNFlsbHJPbjAvbC9nOUpNbktOQjVnTTZjUGpkaGM1RTJveTR1QWpS?=
 =?utf-8?B?bk5vK05tRHpIUDVyS1FBUDBZWE1TV25SbGJIYTBKYSttOWR5M09rSUR0NzEv?=
 =?utf-8?B?YlBMK2EyRmF0cVRhbS9rNjY3TzQrRmZlakNmMkJVbkVVbGJkMW1VR1JLVDZk?=
 =?utf-8?B?azBsV2xqK3hpL3NzRWNJZmcyZlkyTXplVVBvNkFEaXl6SnZoYStHRTdDN3B1?=
 =?utf-8?B?ZHhTaFdiZ2pRTVpOUGptb0dNTzA3SGFCRTRpWDc2RzJZYTJuZ3VqRkR6eG5X?=
 =?utf-8?B?Y2puU01NcEJ2dG9QZGV5S1BaWmFyc3Z2WFRDV1IvR0N1U0xvNExhWWdCeWZH?=
 =?utf-8?B?Njk3blNLT2swRUhqZ3NQNjN6Qm04VEtWZXlNeEt3NXA0Y3JLTXlwQUs5UE80?=
 =?utf-8?B?WCtPR0JJTHdpM0RYejZUbHFyUVBrN000L1VtNUY1NElUMnNSL0s3R20yOHBN?=
 =?utf-8?B?OUJ5c1hkeHVMbDdkNVdBNm0wWjl4Z2lGVVJ5cjhJR3hGTktPY0NJZ2VsYmdv?=
 =?utf-8?B?TGI5U2xGelZKNVd2YjJkY2QvNjdTWENYVWVITEs0MWQ1akswSmYvVS9oUWhX?=
 =?utf-8?B?azUvQWM1WHZuSlhzZTM2ZFNlL0RNWnZDS0pINUN6T3RZWEd3Q2ZjUW1RRXhX?=
 =?utf-8?B?MlM0UFpQT3g1YjYvK0hycld0ZWNqM3JoZTFTb3FNN0c5RjZnalBKUG44c2xV?=
 =?utf-8?B?ZE14K05qK1psYnhQazRMcHA5OU9qTWwyTHZHOU9ZNzF4Q3RCMDJNZ3YwVjZh?=
 =?utf-8?B?RjZoYzV2K3dCcmxnYzdRNXFHQjQvcEIyVDlLZ2l2a2xtQUUzaTNRRFgzVHNl?=
 =?utf-8?B?UEtmaTV1UG1ZcW0rNlhDUVhoRC9kM1Nrc1VQMzgwSjhoeXI2ajQ2dDUwTlVm?=
 =?utf-8?B?cUdIMHAra2poTHdzcnUvZjMyaXJlVGV6dFZ5SGVwYXhYSnJTRDJyNzZiaGdU?=
 =?utf-8?B?M2Z2SzVvNmVveWhqZXdHTFZPNGM4ajErMVJvRGxCQ0QzbWxHMkRkajlTY3R2?=
 =?utf-8?B?U2R1NTg4bG9wL0ZWQ2hnRFVkVW91bi9rdDlWbU56QTA4RmFucFhEQ1lnRzBm?=
 =?utf-8?Q?GmogtGQMMg3tyB+97BqCVyzIpcCdKUUU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTErYVowOGdNSnFxNDBzLzBlVFpBK3l0dDM5WmJzZjdSK2F4eERSRDQ1Mk04?=
 =?utf-8?B?Rm5EQUxFVi9VcUFqQVdlZ3N2a0FzRXdNTjR0QXZkMkIwQk5IS2FybnI1Tnpa?=
 =?utf-8?B?Zk1tYXVGZVd5MWJ6MGFZTTBDOFJTOGFwQkZxVnF2TkR6N0tyNTk5V3JOY0Qz?=
 =?utf-8?B?NDk1MVBBa2ZtbmExZSs2dmh0ekJqYkQxWXl4ajk0bFVTYVFycUd3YWM3WUF0?=
 =?utf-8?B?bmhtRGlwVlpoOHdKc0lvZGM4UjVoWVhYWUFMMDFmZTdtZUZOdkRCWUJ0TnBX?=
 =?utf-8?B?UlV0Um1ERURiVlkwSHYzMnFhWVdRVWUvNXZTNWx3am5ZWU9tZGQ4Uyt2K1dQ?=
 =?utf-8?B?ODk0OU1idC9ZQ1N2R3VXeUZ1YVFqdU1yakJHVS9LdHNQVXVhbDJidU1MVG9Q?=
 =?utf-8?B?bGtqM2xDeldoWnVQeW8wYlNiY3FIeVlPWFEvN0E5VFRxcEFXUUFHVjJBRGIr?=
 =?utf-8?B?UWhVSEdBMWc4NWljL0FraWdhME1TaFdERUkyeXkwS1NzSVpId3JtRFhZMHha?=
 =?utf-8?B?SGFaYUtCVTVDOVpEdENMRTJhMDNTUmpIZ2sydEppZFdWZCsrM2ZWMGdhNFlx?=
 =?utf-8?B?SVUwSHlrQUhydXhMT0xtd0l2bVNEZ2JJOGpwK3hjWEhJMTJoc24zcmZ3bUZY?=
 =?utf-8?B?ZlptQUI4RXMxbjN6U1hqTWgvWDFNa2dmMVRoS0l5WkJ4amNIMWZSbjdrWVBa?=
 =?utf-8?B?Sk00ano1KytNMndGSWY3YkxnUEJkWWF4TU5Ea21EN0g4Ti8xSDB5amJZNXQ2?=
 =?utf-8?B?eTh4ODQySTZCYnliTnhNT2NXZGx0c0paRXdRdTBYQlc3TUVKWGRsaW5TcEkr?=
 =?utf-8?B?aDRhanNiY1psRmhOdDBZYXRaem9pTXgwd3ZFcmtjdmg4bU85bnRRUkE0QXJN?=
 =?utf-8?B?Q0ptZ3N1VXV4cFhkams3Z202Y0V2dHM5STlSRmd4LzR1M3gzeEFvKzkrd3gy?=
 =?utf-8?B?ZGxCeS9PU1lXKzZET1RsVmRycUM1RFNHMloyWW4za2w5dTF4dVErM2RLUnlm?=
 =?utf-8?B?UUFJQjNBa1ppaE52Tmk2cVhYaSt0bVlIcTBjNUhDSFNNenVTVDIrZ0VlWDB2?=
 =?utf-8?B?NFE3Q3JBMDNtYWc3QVY3TzYrL1JDdCtIeVdibkRpTElQVFN4OEJUVzhjRFJ5?=
 =?utf-8?B?SlNKcnE4aWhPMUNURkpDbExDSFlWWlJoTVhIVjk4dTBJTmV6MVlqbVlzVGIw?=
 =?utf-8?B?aERxUGxXdW9JcEFFSHVqL04xdE4yVFh0YTRDUlpPbzFNdEJmVkdlTFlhRmR0?=
 =?utf-8?B?alJOd0hoVDYrLzdWbVJ1UFpEWW1zVGw5N0tsT2dMWlBRNzVBRk80ZzBidmxn?=
 =?utf-8?B?K3lhMmxMYitqNVlDTDZuSjQwTEpkWlF2OFBjMFNQcjNwK3lWeGlEZjZWcmhQ?=
 =?utf-8?B?RkpGellxNm5BUWlpL20yTm1KOGE5YWpvR0k1MkMzSXAzK1lydm1ZRVpqdDhq?=
 =?utf-8?B?aTlFcUxVbzZHN0tYWkhNR2NuTWtYOXVvdi9YK1duSEwvZ0NrQmlTVlJBanJk?=
 =?utf-8?B?ZXBoOW5IYTdNTlJuV29hNU9WRm1qZWE5WlJMQXY2N0VqdEVKdndRcDdxU2Yy?=
 =?utf-8?B?ZmNkRXlJMXdrWmZod01oeko1YU5keDVQRERuTnNrZDg1eWxZcTRVZ2FlcndD?=
 =?utf-8?B?eEE0VXBFUFZCV3d6OVRKVWJqUUFEdnRjUDlDdzI3VzBRdURWY1VvQ3JvMHN6?=
 =?utf-8?B?T1owQlEzejB6ZVg2cWRpS2gxMG1WVFlDb0prR2kwQjE0eTdGSGVFdXJDOXg5?=
 =?utf-8?B?UVRqUmhhdTNKWmdjbEJjcTlFK1J4bWdRQ0gxOUNxekJJVkpULytITGF1c1ha?=
 =?utf-8?B?Wk16eis4TmZuZkxuZktwM2lBc0lacmJzY2gzclNGMC96RHJ4ajgwTnI1bllq?=
 =?utf-8?B?TU9xVHl6M29acnF6ODBmMXR4cXBBek5oZjFZRVZOL25UaG1Nei9VODRnME1L?=
 =?utf-8?B?QUd1VXB2N0FNdDlhSWJKekc1eVkzY2tJTFVXMkVYSVZGWjJKbjFWMjlkdTVS?=
 =?utf-8?B?a0hBdTlySCs2ckN5WjArU0ptVHRsQitVamlRU255UCtZcktidzZQS3RrTTh6?=
 =?utf-8?B?N3dDNjNwd0hNcllScGcvT2dHTGI0eDF0cktjeXdtWlBIUjZRWlV1anM3OUQ2?=
 =?utf-8?B?WVpxNk5DVS9NamlQYUp1dVlZZjU5VUdCSHlCYkc0U25VZ1Y3WmZRTXQ1L1F1?=
 =?utf-8?B?TFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 544e0a1d-e94c-40ee-4f0a-08de2c5b86af
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 19:47:54.8808 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5+7zMaAJDFyPtdc01WLDdDFQuzTyLEmJcLQBsa1KkskDZH7yevCNK6cW7RCHwzfIVgEI9LQ5vgkxR5tx09tlbwYr57+6V8m2CvvorBObHBY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4602
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

LGTM

Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
