Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60336CD4F3C
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 09:20:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA6610E5B6;
	Mon, 18 May 2026 09:20:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lLE8sg/v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9687E10E5B6
 for <intel-xe@lists.freedesktop.org>; Mon, 18 May 2026 09:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779096021; x=1810632021;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tSF3nyyLqjlC5mbf3s1jaZ2R6bUY8Ses+2EmD7MQgDY=;
 b=lLE8sg/v5a5tiosrTFbXXNCST/8oPRp8ntLhhkymgxKz7XrcK4PDYIwt
 vKkJuUdUPlLxJDmTnypAX65LWVV4RAjtT4S6FQ7uYtPmtNdqRV1d2OKdh
 knx6kX3BYa5ldOttlv70Uk0i2Q+RpRxSIX8qMxgy3FredLMHUSZMjLhel
 nBqkYA7S4kD3/9Z88MgNkQ4OCMRmhFSlRX68a4LQelpdqXWdf3u7FGfDY
 KSOEb6TY4U8QO8z3lIPENuwxQhwSKPVqvv7uf941kLBMueAbMkm3OGCZa
 sbzwXvjbNvXwV8VaxTfARVea1ZiW/OVy89Qcqm2UJlYt0cLKFBeRKq6IH g==;
X-CSE-ConnectionGUID: j48BQgjXTrO3fu40ZN8Bzw==
X-CSE-MsgGUID: QYX2wftSTu6uu+Nt1jZJOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="82509441"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="82509441"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 02:20:21 -0700
X-CSE-ConnectionGUID: VOX2VwCuSsOhoNG+nk9hIg==
X-CSE-MsgGUID: l3y98X0cQr2iFBDYFCFLAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="238490716"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 02:20:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 02:20:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 18 May 2026 02:20:20 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.62) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 02:20:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bkLwjm3jj65ZYIdhPfUyL/RQvoo3zqKQko0cnk3LecYG3TnYfqyZbfOBviQl+by7dc7nCTCmzEj2im27WkmWDskZqNxSciLzNq+VTykkE6r84CNlCWV1gpKCEGe2cAjyO3nADjqiHe6iPuLi/Z3IBH9kUKcAc/23+A7mBL4xOyXG/F77OUKVqvseuSnAjVS7Ygrov77SHGdYJrdzYwP8kTi7IqWC894ZMgUQEw6TkMoLqeDooZfpVCxKl9kxdyqDUNN+L5AJfd2BLQ0d0kmwdP/K7C1U5dPE+CKh+Qu1a2x2DVNZEBZcC3i2oowZfMv/GQz6BNgoWU0nUHYaXx+1AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9kM5Lj3fgKJINXMgrsRzLF997HWjxsvj5UjaokJvn6A=;
 b=gIgBBOtWmMPOhC9rTMxYnvhfqsWlbjtwwj3r3/lEFiJtXvhlMZyLfdo4UeYt35WAYV/6WHW8oug2kNH2AX+kHzBKm7xLjsVAUnCTW9YqvtqK6RYK9ve6hr5r+v08uI/nSHTwf1bJnePG3nKWpbwH12txXu25QnczEgTOhBIBCqz9jYpjyO+RKRa+XcL4gTTZWQbN9cWmxafJwZ7XknnH45915D6Rmsu9PfWdAaQ1pCGCYJd/X/DD3Vz0zgx5WHExeqVa9iVtCCVsZohhsCcWIYl5xpXMIHgePcWv909J1BsocRCIDltFd61qQkjKNqr17EXjCZo7BCjOhr97R4SI8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by DS4PPF708A6BB3E.namprd11.prod.outlook.com (2603:10b6:f:fc02::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 18 May
 2026 09:20:18 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 09:20:17 +0000
Message-ID: <78042236-560f-4f37-95da-45daf6d5cc9d@intel.com>
Date: Mon, 18 May 2026 14:50:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/14] drm/xe/xe_ras: Add support to query device
 memory errors
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <soham.purkait@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>, "Himal
 Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
References: <20260511172908.1122252-16-riana.tauro@intel.com>
 <20260511172908.1122252-25-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260511172908.1122252-25-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0236.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::10) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|DS4PPF708A6BB3E:EE_
X-MS-Office365-Filtering-Correlation-Id: 40860ad0-56f6-4ba8-dfb4-08deb4beacb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|22082099003|18002099003|56012099003|11063799003|4143699003;
X-Microsoft-Antispam-Message-Info: mNJSKo0fKMwALvROjO8t/8RJHpXy+7BIayrMOSa3ME9QtgmbMhSp7nRU5HAgQVwqlzXNKhfyCz97d86yZz+NFNKAo1MUb0PyOdfiFH6b2SvGMcLl/F5hT/Ha4BnkLdKKTFumpVL7+inKpSzzfTuiVI8a0ghGP74Sir2/fPfP1l8RhTFdxBhlfS6Oz13Pd5y8ainw0sFpW81wGN1rxG/XzEeb5eqHCpmu/L2wFIOHl9L7ZbCodzK3JfmD7+JrgGKu/5U+sslitfzdUD3SxpF9O+QUN6CcP4AoKjSVgSB5ZReHHuEDy1IzVWqHex2vfPEFLqdddn1PCZc+OKX2H+UxU5lyv4s3JaE8hkV9PNVxmusVS/3Ueg2Q9vbCOfpEk2YNEJL1hpNPs2OIu10aXA9MXEuHATf7kVzCZwux57M8e/xb+Haq8JR2xcUhQgtVOqP6vfHcXG4UlmyWhIGv9BGRmUeHNIHfTLdffeVsvrbelAl0Su3Oa3Zq3pruV/Noex1q8EPh/TXkFKv+EP+N4haPMsoIiYs700Ir/dZk9H+tRh6EwcaStpnFwD24DMIQ8HBXpi98OKfXT6VzJpet9AsUc7QK1/b+K6ohZIirnRBhHn7ytlAgxLPqdKceJYK7E0AsQrRYP9zvCnzRIq8FQk0V2lMYG/a/uLPR+vFQ2TDUTC3wGFSHwD2RFcOc97SuWBET
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003)(11063799003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wi8xLzFNbE5xVmkycWVOelJXcE9jRVlSaWFZejRiR2xWSmMzYjVnTThUV1k4?=
 =?utf-8?B?NWdNcnl6UXdaWXM0a0ZYQmJhZjVSVHFIazVHbjJ1Wm5MdHBzL2pNQWw2Uytl?=
 =?utf-8?B?SGd4U0JOTnE2SXhPZHFkclp6YW1LYWY5VGYrV1kxck1VU1I1T3htMzVQVmpu?=
 =?utf-8?B?UXdha1duYmVJajhPQkhQRnZTbnJuVlQ0VnF3b2FUdXBsTDZDa0NaaDhiM3FY?=
 =?utf-8?B?QWhEWWxDRmVEcUgvUmVrcFU3MytkRmZYTFZHd2xYZWk4a2VOL0RiaDNFcENJ?=
 =?utf-8?B?ai84aE5iQWJZOTBmTmZudW5pcEVYYVNRN3NxaFA4emFELzRETnI1bThTSXRU?=
 =?utf-8?B?RHhQNW9pdVhnclpvY251bm13K1BLYUNxNDZGSUM3b3JpNDlFYVBGNG84YVNa?=
 =?utf-8?B?cDJBQlBxRFUrenNIWGhmQXNnL01nSTlsVDQ1anI2d0JJRHVXR1RJVXFtS05E?=
 =?utf-8?B?QW53ZlVHc1N2KzdSSTZRcUlVN0w3OVVsREJMRUlNOUhjRGthb2N2dTJvbmJO?=
 =?utf-8?B?RGlEUU9TMzAxaWFwdjRqUDV0Z3NoeXRxSGtaa1hzdm04VTE2V0NVa0RHYmlL?=
 =?utf-8?B?cmt5cGRLRUhkdzZWcTJZQXRhWmNLR3hHTTlZcHRCSTI0aEl2WFJtVzErb015?=
 =?utf-8?B?eXdTdUJrNXhFQ0ZJR09HQ0dtSFZPQTRIWndmN1VvMTMzNmtUVVIzYWJ4Ymx6?=
 =?utf-8?B?Z3g1eWU3WXpXUjVYUDFiU0RyVG5ZNHRjWlRlMXJaMjdvUnFVK3pUL2dzMVhW?=
 =?utf-8?B?dzgyRGVqY2hZQi9zVHJBcUtUcDhDc1Z4V1RvUllIelRDSE1BVHJvemJ5ZDJl?=
 =?utf-8?B?WW5DZ0RkVmVGcXdrSThuTzd5THF0d0FtWVB6a2dIT1AxdnRBeWlTU0trTUpW?=
 =?utf-8?B?dmcySVNqekkxdGZrd2lwVkNKLzlRZVF0d3BYKzVBVGF3WkFhY3FzSzRvMWZN?=
 =?utf-8?B?OEtqMkY0U3I0c0I0V2FJNDB0NWt1TjhZc0krcjBwcGZsaXVBK01Fc01GRC9l?=
 =?utf-8?B?Y1FEL0xBNTZuaXVEQXcrbzhPVStpM3hOVjFHNlY0amVJbSt5eVNFbXhpY1VO?=
 =?utf-8?B?TWtwSWZoQ0VUQ285WTl5Q01wd1pBd3cyREtiei9wK0Rqc3phZ2xpaUs2aGRX?=
 =?utf-8?B?NVdlRmVQZWg5LzVTbHlhS0paWFVQYmZTOTM2TXpmdXhZUm1qL1NOL0kwVHFR?=
 =?utf-8?B?NDB4cjZaV0FsTXZ6c2xsRXVOWEtOUE03ckl4Tko3RFpEckQrNXJIWk9QbWhZ?=
 =?utf-8?B?MFpzZ0tOVHZjSTczYUF4REJvR1pNUGJKTUh0Ykl0d0RKUUhyZnBaZDd5UHN0?=
 =?utf-8?B?N0t5Y0VaVDBoTUFKQjlXc2VTeS9UWlhrbmJORHFTdjlERVo3VlVlbit6MDha?=
 =?utf-8?B?ZTIvVlJqN2FVSlovMjduY04xazdwa0VidURrM2ovSGN1UmRxNjFvM0JSYWRT?=
 =?utf-8?B?S3paaE5QeitpSzlzU0pwLzBMVTFZRTdRQUlrMUx2bXRFU0F2UlB6ajJNdGpS?=
 =?utf-8?B?d0F1cjAxRElFeit3dnRVMVlxTmgxMWR4V2c2VnlDbHJKQjh0bzg3MXNqSWhx?=
 =?utf-8?B?aHZxOXA1UjVSdThuOTFyZnVEdmFRUkJKMlp5S2Y2Z0pkNTZCVXdxN2g4Y0l5?=
 =?utf-8?B?VUpwbDhrVktqbmJSbWlZRXFIUUlLRTdMcWd4RUNUT1JOY1JZZnZzL3FEV0pw?=
 =?utf-8?B?YUltRElEKzc2VDJHTGdoR1hhcmJxNFY3QVJSci9wQXZmaEtlcHBsTFd1cmhU?=
 =?utf-8?B?dFI3WkppRDV5VTcrVjhaSGdhZzh3TXQ1QzNSajFaVW5oQ0dxbk9NekFzUi9j?=
 =?utf-8?B?ZkZ0cFlGR1lhZTVmZ3p0RnRJS1FLM1MzNXVyUjcwVlpTa2VpYmpkTTNDc2wv?=
 =?utf-8?B?OVVyVUQrOXR2Wm43UkE1SVFqbHd4UWtTRUR2WHZjZHk0VkwrSHFDamgySzdu?=
 =?utf-8?B?ZEpUUkM2THcvQ01aY1ZJTzR6NG1RaEozbm0rc1FnZG5rT2ljc2l5VThwM0ZB?=
 =?utf-8?B?OUdGbWdDL1lrRDUvK3hiQmx6WWc1N045cDhDdWR3Sk5DV1ZLVW9jaThnN3Rr?=
 =?utf-8?B?VDAySEptUjlnR0poNmZxdk1iWEV2UFFiN2J6NkwxNDZFZjNvdy8yOHpGVlV4?=
 =?utf-8?B?S2ZPYnMySXhqeVlRd1A4VnU3MEFFYUpiSUtRWFNQdktlcVJCNFdTaXR2Y2pX?=
 =?utf-8?B?NmZpZnhXSGFBaHZNYThFbW1RT0ZDa2F3SFlLa3FMTVJsTDRJRzZOVFBQWWgw?=
 =?utf-8?B?SGFZVlFUakx5WXByclFxeStrVTdaUUNXNmRENUZpUHhoMXpEd04vbEJlNDdO?=
 =?utf-8?B?ck1mbHNLbFMrdUNHNkN1Y2hNNjU3bFZmZjhPRlJsKzd1TXFKNGxPYVg1Sm5q?=
 =?utf-8?Q?ol1CrwpK+Qgxfe/g=3D?=
X-Exchange-RoutingPolicyChecked: vnEzzhowSffaVU4NSGSp/GTSmZ0CRGnTURxbgBHr6QY0RUBEglnPlI6agc6Y4qLmBvGpxRVFNW8Qv7v90UI//Na7q1yBbFM9oxjj3dm5fo6VtPDMhyNMDBT31SUoTfBKh+LlJ5a3qTW9en3hH4+mAjwGI0DH69PJ2AFpFZc8wwXd/xCiQUTkEhpqn5NQhyCjYtTiA1aX+Uxc53oD8fAYVQkyDMwskhDKPyB+g96K1Korxs7BXubpM4qUgeFbDLU1klB3iptCGvQ4u6Z3sFokX0Mj9jI4DTuWgnYdUqEsxFkZ8BxtHOATq+qRizY35ffK+0Gh8xf7jBQPlPRmhw3pZw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 40860ad0-56f6-4ba8-dfb4-08deb4beacb5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 09:20:17.1307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bhxRKU4E56pIBR9DhK/JaWl9Qy0o2PEQg7pTpk+oUzY3dp3tlm85jYoj9/2T08OLrJ0VdGIu1gRg7xjcLI/BxW7wLHUp743DdOug1rMrPzU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF708A6BB3E
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


On 11-05-2026 10:59 pm, Riana Tauro wrote:
> Add initial support to query uncorrectable device memory errors from
> system controller. Double bit ECC (Error Correcting Code) errors will
> be handled using Page offlining in a later patch. The other device memory
> error categories require a Secondary Bus Reset (SBR) to recover.
>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: simplify structures
> ---
>   drivers/gpu/drm/xe/xe_ras.c       | 18 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ras_types.h | 17 +++++++++++++++++
>   2 files changed, 35 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 0d4e2116ef61..803f5fd204bd 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -153,6 +153,21 @@ static enum xe_ras_recovery_action handle_soc_internal_errors(struct xe_device *
>   	return XE_RAS_RECOVERY_ACTION_RESET;
>   }
>   
> +static enum xe_ras_recovery_action handle_device_memory_errors(struct xe_device *xe,
> +							       struct xe_ras_error_array *arr)
> +{
> +	struct xe_ras_memory_error *error_info = (struct xe_ras_memory_error *)arr->error_details;
> +
> +	if (error_info->category & XE_RAS_MEMORY_ECC) {
> +		xe_err(xe, "[RAS]: double-bit ECC error detected at sw address 0x%llx\n",
> +		       error_info->sw_address);
> +		/* TODO: page offline handling for double-bit ECC errors and return accordingly */
> +	}
> +
> +	/* Request a reset for other device memory error categories */
> +	return XE_RAS_RECOVERY_ACTION_RESET;
> +}
> +
>   void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>   				      struct xe_sysctrl_event_response *response)
>   {
> @@ -246,6 +261,9 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
>   			case XE_RAS_COMP_SOC_INTERNAL:
>   				action = handle_soc_internal_errors(xe, arr);
>   				break;
> +			case XE_RAS_COMP_DEVICE_MEMORY:
> +				action = handle_device_memory_errors(xe, arr);
> +				break;
>   			default:
>   				/* For any other component, reset */
>   				action = XE_RAS_RECOVERY_ACTION_RESET;
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index c5a283317d90..5999e7b4af1c 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -11,6 +11,7 @@
>   #define XE_RAS_NUM_ERROR_ARR			3
>   #define XE_RAS_NUM_COUNTERS			16
>   #define XE_RAS_SOC_IEH_PUNIT			BIT(1)
> +#define XE_RAS_MEMORY_ECC			BIT(1)
>   
>   /**
>    * enum xe_ras_recovery_action - RAS recovery actions
> @@ -175,4 +176,20 @@ struct xe_ras_ieh_error {
>   	/** @additional_info: Additional information */
>   	u32 additional_info[10];
>   } __packed;
> +
> +/**
> + * struct xe_ras_memory_error - Device memory error details
> + */
> +struct xe_ras_memory_error {
> +	/** @category: Device memory error category */
> +	u8 category;
> +	/** @reserved: Reserved for future use */
> +	u8 reserved[7];
> +	/** @hardware_address: Hardware physical address details */
> +	u64 hardware_address;
> +	/** @sw_address: Software address where error occurred */
> +	u64 sw_address;
> +	/** @reserved2: Reserved for future use */
> +	u32 reserved2[10];
> +} __packed;

nit:After fixing reserved field naming consistency.

Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

>   #endif
