Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD00EFF8875
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 04:27:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C58B10E0A0;
	Thu, 30 Apr 2026 04:27:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bwNEGE33";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8413A10E0A0
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 04:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777523237; x=1809059237;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VtOPAYrEZ5r1+Mi9BP5cr+463UhxhEUbjk/RMCuHPjg=;
 b=bwNEGE33fLNBsg4SE7xLN2J/aS3VCVTde/2c4FBLqeSxx5cDCFlFmFz6
 rATB3mWNjBEvLVYfHIp1pUVjdvgJczHpHCaIhkjFg69hMNErCTFMiRahq
 eDZw2ZJGj32l8vEoyqUUj19ekbq+lw2q8366ETlnLuosrCnGFe2wRon8J
 ItlyA9HXI/wv3/wxpfjEIpR9NbIQPEnQeXLZd1KJyJq+UFCwPxibvfkAu
 Jc600QcU9bezAXlqMbVfShcxXE3s1xXggeef3oikKBQYhCORJDxzlqMJi
 t8KVw4EHoo4dVHUHDGeYMvxsy6z9bGg0RdSX25m8paO/iMfW+vHMkMSGL w==;
X-CSE-ConnectionGUID: wf0U1WjlTYSkc5ee9W/iTQ==
X-CSE-MsgGUID: ARfDjNtTRl+ssE8LNzzykw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="81038552"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="81038552"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 21:27:17 -0700
X-CSE-ConnectionGUID: FFC4vfSaTHSHK/JuAoHokA==
X-CSE-MsgGUID: P5zdo0VuR++npnhBNpamqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="239490808"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 21:27:17 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 21:27:16 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 21:27:16 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.31) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 21:27:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jwbrp1lNz0JpsITBfQHTLep/I65hKBx5NZZf7E0+8OYt3zLro5ckKUCU3AWEUOTfD1Ndo3thh8V4c2Y/ci+1TFa7YPZfJnT2NEi1kgE5vg9DxCB/9LgMy+aRwhJiHvvDpLMTZ/jgRCDwI7GA7PkeQRQi9ROfhFHfTIwibYXSbeNdkd5vrZncdbkNihIzyaHj1tP+xieCgA/Bdh/gM9b19Gs9cMQd92ammiD+fGkcymxuf7JsaPxYbH5uWb0X7UX2hv3M9/N/6t2jk4pVStvTN1YrVBcbCmGbS962da8dE+HuVqpix6xY02Ng3yrwcXHge/mPOj+BxNc72DJhSFSKZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wzJhh4vwnaJ9A3s09ZxjnmiPwIei2oPVpuJdyR2nB90=;
 b=Iv2fcD4xPG6e3tlX/2Qs+eHuOx3M5C7rBZmK4IHprNoFdB+SXEPk61JKs8A8zNaeaihNusuuCRYnAl3zDe0tkSvcKguRG43CkMXhVaTuo4rQ60mNYbWbDVvErBX5Ju4VsxS+Hl21pbHezmxwfb+JDvCrA0SQr6kejr4qbBvTAT2hVO3i13KsXirOYCEnXmu/CTxUcxfhfglhyqSdwa+cVM9yXneRTzpURGoAjLe/aRmFKr8iR0SeWtm8qfULDmMtji+oqOTE9wDy9w7YJxyXnX0RLCF/WGcDtohSt37DPee2LgUNpgOQDPkEu9mqfZftML0sdkTBk1uFq1IyjY3glA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by IA1PR11MB6539.namprd11.prod.outlook.com (2603:10b6:208:3a1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 04:27:01 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%5]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 04:27:01 +0000
Message-ID: <93cd8344-5311-425f-a6ac-9b04c066d784@intel.com>
Date: Thu, 30 Apr 2026 09:56:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/madvise: Track purgeability with BO-local counters
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <tejas.upadhyay@intel.com>
References: <20260429085214.1203334-1-arvind.yadav@intel.com>
 <afK6msQqV+IsgkF9@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <afK6msQqV+IsgkF9@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0010.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::19) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|IA1PR11MB6539:EE_
X-MS-Office365-Filtering-Correlation-Id: c229405e-bf85-4054-2bbf-08dea670b989
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: cUsvfICVYTYk4BFvRs3o4QXJLcdG+nNfXXq87Ed+MDDKddz9SnDVsMeEDRQOXLl1DSdA3hafMHARFXRoZT5QwN5da8ld7J8QaRfqtvh2cJDYLl8LHZc/o60dgUw+wtMbOgyPC+qt/Uvy+et3AcbQSJ7cn7xn5ewzWRpaC3MngoOmB2AKAHBNbsH8ri58wgBka+zHrFFUONa0JxES7RdrkQydVoy30uOQsg95KL0eKnj8l8Kr1f4LNnb2tExppm3m1da3y4EU15ioRVOlWVNoUc0oZODfMIs+4n4mxA/b16Y7cvwb03bCIK+o1cNKI/+9JXj4t2F+MgN9IRbaYPGD6LjkBGtuRqWA8d0Kmlai0fts+CAvFyPyEqLjp0cl42yy+mWn76gF0c1zgLE+20zrUUMUgBMjZMZ6P9HSJTiSvdLhY0RXvTJjxW3FrDPtjvSZrJ5100w9IgfaNiFdylKTa8LN2t/y+Q0Nv7KEf5/M4IVBAxlcwq3mvOpA0JGAfag//oxC/USK6RPFFWg31ushP77WLiej/DkUr5HMfc43rPe0axPabHwWcPFe6vhk0pGd0p4kefmNDZS7WHO0pBYuzb5cCwA0Pb+zPTv2m1tYpQv9Ai6yVnm3qgCofqfbJNKrVNLYI3olMVgAj6/ADE1otwj5jaX/JP3VZAKJNafvYBGWogjNjmHu4gvOpnhaj8GsKhjxqLrpymtsUX0vMuXONvj9nFcmiG8W5hyeC9+YwyI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c252R0NJb0wvYUtBMEN6eUQwQlFSWWxOWGt1MGttUXljYkhuQjZVdVpCclhs?=
 =?utf-8?B?OUF5R0FCSkRLcUZYeTNGZlBaNE1QMG5tSElLM1U0UmE3b2U3SmRIaW93cWFh?=
 =?utf-8?B?MnViWlVucEVUczdRUDRXZnVVWU5mTEtPbERBV3JQak8rRGQ4a3duQTgxQ0Ey?=
 =?utf-8?B?OWVzUmZBZkd0Q0RoNEZmNHZVWDJrV2FiWjZuakxNdXh0bjhXRkJRS3htMlZm?=
 =?utf-8?B?TVMxQi8yeGpNNXQxSGxGOW8xL3JmUFhvZjIwZS93SmlZcTdza0NKRnFzYkMw?=
 =?utf-8?B?UCtKb0I4SmYwODBTRjVZYmdJSGlJMU54bzRlMUhmRUNTMTJjWm0xRWljcW94?=
 =?utf-8?B?TnkzVmhncjh2YnpnNUFPWUdUTENRaURFUExwQ1lqWXRjLzE2VVFsSWhaZEp4?=
 =?utf-8?B?ZFc4VWRSQVhJK2VFeVovL0E3VWp0Z0gwYUcyL0dCRmUyaTUvMFUvZDVwUWRD?=
 =?utf-8?B?YktlL1Z0Nzd6eXFYamFQNkJPR2pobnkxMjNHc0J0WVFRZVkvQXpna3FLOWVZ?=
 =?utf-8?B?QVRMQ1daVHV4aXdNa2pDMXk3RmVaSDJJZTd1S3JsbEV2bnp1U1J6b1lpSVZD?=
 =?utf-8?B?RXlwMTFMTitDSDNiTzBnYk5EU2ZmcVFZVE5jemI3S3pUcCtnazBlQUN6aUFt?=
 =?utf-8?B?MGtyVG1meDQ4WVduNXpqL1AxL0N6UHZ0VVRtUkxIWi9FcTEyVUhxUDhQeVJE?=
 =?utf-8?B?QUs5eU1kYXp4dmtlN3ZaeGo5TmwzUXkrbWo4TmdsZGRQMUljb2NSYk5FeHZE?=
 =?utf-8?B?SmxuZ3dibGFMSFphTVJwUHY0MXgyQTdqYUd4VXNGRGJSc3h6Ti95R2ZJZzI2?=
 =?utf-8?B?dWhUMkxDamVXdFk0a25Bb3FBdVI5RlJSYk1VQVFmbmxyWFRhaUwwa01iN1NS?=
 =?utf-8?B?cHJVT3oyR3dSeGVjcFhKRFE3WHE4Sm1LUHU4OEpPWWllOHpOUlE2K2V6TVF6?=
 =?utf-8?B?QkN5ZWJWVkNqbjgwOVJtS2lXMWV0eCswUVNET2oxdU1PWTIvWkNZQVNWNUgy?=
 =?utf-8?B?UDhVdnNOSlBzQm9rMHhJbWNxd2NkdFU0Z2ErZnFzdUNiaVF1amtuTmVOZkVz?=
 =?utf-8?B?djJyeWQzL2FaYjJhUG9oM1dxblYzWjcvL084WE1pbGNvd1hTY1pjdTRDR1Jz?=
 =?utf-8?B?OHJJMk1jVmVZM01uYWF3c3lXS0ZhVGdub0F3cW84VGliQzdESmhib05nYTB1?=
 =?utf-8?B?SkJ5d2dNNlJPUWdlckYzbVBNczErSk1kQmUvd09uWEE3QkhKVjhrbTFMbVJ0?=
 =?utf-8?B?bXdta2NIdUJSREUwNGU0OFFpMWlsK0tNSHdKeVZpcEgxWjNWenU0L3JtWnBs?=
 =?utf-8?B?REM3aUphSC9DRW9xMldYTjZNS2NOQUJMUVRueG9KREJPV0VEY0RMTlFOcUlt?=
 =?utf-8?B?TmlUSXZqL0M4cm0rRS9mb0JkS1RwSUpvS3oxQTJ2TXRGcW1sbGZUWHNqMHAy?=
 =?utf-8?B?SmZITVUvVGVwZ0hQa29UWkpEZzRhbkRnNzZaWWROODlySkRHOHpVaCtmUU95?=
 =?utf-8?B?Q1JtSEthcjNrYXNuYlVZVmlyZGN2TUV1UGwzL29NL1BiSDNXVm5FWGUzeERw?=
 =?utf-8?B?ayttZXlVUTI5YWhqLzEwTGFnZ3lXemxxWFJGcmR0b1RoRXRhLzNBTU5wMk1M?=
 =?utf-8?B?aGIrM1Jjbll1MnpJZDNKWDlWM3cxMVFtV1RKanZTVTY3WDlKZ3dQREFhdUpU?=
 =?utf-8?B?S1dhaDhyS3g1WnVlcjZFek5zbmZBM2VXVWdrMWhGeDloZUJnRG9RamFHY0cx?=
 =?utf-8?B?TU9RcTNJVWg3WjlrdDg0VlNRbVJlWGJncTcvQWFtZncvc1NWWlc0SjVBWFgy?=
 =?utf-8?B?NTNMek1VUitIeFpmNE5iK1Y0VE1mUU04WHE2b0NvZUxOOGVNbmE4OGx3T2dH?=
 =?utf-8?B?clZ5MW1XRnYySDlUZ29MZSsvU0JUaHZlcms3KzhIWENNa1dvTFFuSXhsTWZm?=
 =?utf-8?B?ZkRkVnhCUVpNRVlwUDZVcTdCaUJUa0EwVTVtRXBSV0tmUWZDZklac3Y0VXdH?=
 =?utf-8?B?WmcveEZRVjI2TjZKQ3FRL0NPbHpGUmJ1ZGZqUVJwYnowUkVzVUxoNFZPTUU0?=
 =?utf-8?B?WVQxMllSckM0Si9EOE14V2hZQ1FDREZlUEFnSHUxdnhXa2FkYWpUd2FKeElH?=
 =?utf-8?B?WWFnYWE1bDRDaDNnV2dlTUhlTG5Ia1A3WmRGVTVqSW5XaURVRGUvMStDWVFm?=
 =?utf-8?B?TmhLNk91aE9xWDVLMzN4MmRxRUt2SDVoR0lYdFMySDZXeGR3bUxtdHFtNUE3?=
 =?utf-8?B?eU5GS0hqQTdMUXB2bkdkUWppU3BYYS9Bdk92ZHFxRnlNNmZ0Tnp5eTEvazJx?=
 =?utf-8?B?ckMrNU1hdFJyQ1o0cTJDM1JiV3B3UGZkU01kTUhKVXNiVkJFcjFPQT09?=
X-Exchange-RoutingPolicyChecked: ZNrSRk4r90h5oTI5g8EDLCzF832Iel25TUoipGduaaI4mUldIXlVU8ogvZP/zvCc4a6E9mmGBo3FPy1RTfDB3JiJK/yr1G/ADSalTTnOnh97jRQMBXmb1r4Fn2NdXHgKO+TjULcz+hsV3rRxGFg/6qH57YP2bwZnVxDaszhOer/zfqIS/8dqIUDvjBwv1Z/t9lgEv+xVLzZtb9j5KetmUN5mzqHhJ7lmWYdlG3V4suWJ8Sq1LxJvhYQLAWnBx+pWocXkWtPlplikpw3H5Zy+Dkfk6x596t4/PuGP47Hyt/las3CPQxQQUutdAORvFg9Fh3Snqlzs3lOfGnSgvtpIUQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c229405e-bf85-4054-2bbf-08dea670b989
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 04:27:01.3724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QWEVznoLesiz6iJhgbeaodcg4U785N004PF/NmlMtbU3mtlnnTx1R2qumdmi4xNxSvNtt90fyFDTAapHnMosfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6539
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


On 30-04-2026 07:42, Matthew Brost wrote:
> On Wed, Apr 29, 2026 at 02:22:14PM +0530, Arvind Yadav wrote:
>
> Nice cleanup. A few non-blocking suggestions below.


Thank you for the review.

>
>> xe_bo_recompute_purgeable_state() walks all VMAs of a BO to determine
>> whether the BO can be made purgeable. This makes VMA create/destroy and
>> madvise updates O(n) in the number of mappings.
>>
>> Replace the walk with BO-local counters protected by the BO dma-resv
>> lock:
>>
>>    - vma_count tracks the number of VMAs mapping the BO.
>>    - willneed_count tracks active WILLNEED holders, including WILLNEED
>>      VMAs and active dma-buf exports for non-imported BOs.
>>
>> A DONTNEED BO is promoted back to WILLNEED on a 0->1 transition of
>> willneed_count. A BO is demoted to DONTNEED on a 1->0 transition only
>> when it still has VMAs, preserving the previous behaviour where a BO
>> with no mappings keeps its current madvise state.
>>
>> PURGED remains terminal, preserving the existing "once purged, always
>> purged" rule.
>>
>> Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.h         |  77 ++++++++++++++
>>   drivers/gpu/drm/xe/xe_bo_types.h   |  17 +++
>>   drivers/gpu/drm/xe/xe_dma_buf.c    |  28 ++++-
>>   drivers/gpu/drm/xe/xe_vm.c         |   9 +-
>>   drivers/gpu/drm/xe/xe_vm_madvise.c | 162 ++---------------------------
>>   drivers/gpu/drm/xe/xe_vm_madvise.h |   2 -
>>   6 files changed, 136 insertions(+), 159 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>> index 68dea7d25a6b..6fec80cac683 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.h
>> +++ b/drivers/gpu/drm/xe/xe_bo.h
>> @@ -273,6 +273,83 @@ static inline bool xe_bo_madv_is_dontneed(struct xe_bo *bo)
>>   
>>   void xe_bo_set_purgeable_state(struct xe_bo *bo, enum xe_madv_purgeable_state new_state);
>>   
>> +/**
>> + * xe_bo_willneed_get_locked() - Acquire a WILLNEED holder on a BO
>> + * @bo: Buffer object
>> + *
>> + * Increments willneed_count and, on a 0->1 transition, promotes the BO
>> + * from DONTNEED to WILLNEED. PURGED is terminal and is never modified.
>> + *
>> + * Caller must hold the BO's dma-resv lock.
>> + */
>> +static inline void xe_bo_willneed_get_locked(struct xe_bo *bo)
>> +{
>> +	xe_bo_assert_held(bo);
>> +	/* Imported BOs are owned externally; do not track purgeability. */
>> +	if (!drm_gem_is_imported(&bo->ttm.base)) {
> Nit: how about...
>
> if (drm_gem_is_imported(&bo->ttm.base))
> 	return;
>
> /* rest of function */
>
> Probably same in xe_bo_willneed_put_locked too avoid nesting.


Agreed, It will look more cleaner.


>
>> +		if (bo->willneed_count++ == 0 &&
>> +		    xe_bo_madv_is_dontneed(bo))
>> +			xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_WILLNEED);
>> +	}
>> +}
>> +
>> +/**
>> + * xe_bo_willneed_put_locked() - Release a WILLNEED holder on a BO
>> + * @bo: Buffer object
>> + *
>> + * Decrements willneed_count and, on a 1->0 transition, marks the BO
>> + * DONTNEED only if it still has VMAs. If the last VMA is being removed,
> 'DONTNEED only if it still has VMAs, implying all active VMAs are
> DONTNEED'
>
> ?


Agreed, I will update and this will be more clear.

>
>> + * preserve the current BO state to match the previous VMA-walk semantics.
>> + *
>> + * PURGED is terminal and the BO state is never modified.
>> + *
>> + * Caller must hold the BO's dma-resv lock.
>> + */
>> +static inline void xe_bo_willneed_put_locked(struct xe_bo *bo)
>> +{
>> +	xe_bo_assert_held(bo);
>> +	if (!drm_gem_is_imported(&bo->ttm.base)) {
>> +		xe_assert(xe_bo_device(bo), bo->willneed_count > 0);
>> +		if (--bo->willneed_count == 0 && bo->vma_count > 0 &&
>> +		    !xe_bo_is_purged(bo))
>> +			xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_DONTNEED);
>> +	}
>> +}
>> +
>> +/**
>> + * xe_bo_vma_count_inc_locked() - Account a new VMA on a BO
>> + * @bo: Buffer object
>> + *
>> + * Increments vma_count.
>> + *
>> + * Caller must hold the BO's dma-resv lock.
>> + */
>> +static inline void xe_bo_vma_count_inc_locked(struct xe_bo *bo)
>> +{
>> +	xe_bo_assert_held(bo);
>> +
>> +	if (!drm_gem_is_imported(&bo->ttm.base))
>> +		bo->vma_count++;
>> +}
>> +
>> +/**
>> + * xe_bo_vma_count_dec_locked() - Account a VMA removal on a BO
>> + * @bo: Buffer object
>> + *
>> + * Decrements vma_count.
>> + *
>> + * Caller must hold the BO's dma-resv lock.
>> + */
>> +static inline void xe_bo_vma_count_dec_locked(struct xe_bo *bo)
>> +{
>> +	xe_bo_assert_held(bo);
>> +
>> +	if (!drm_gem_is_imported(&bo->ttm.base)) {
>> +		xe_assert(xe_bo_device(bo), bo->vma_count > 0);
>> +		bo->vma_count--;
>> +	}
>> +}
>> +
>>   static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
>>   {
>>   	if (likely(bo)) {
>> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
>> index 9c199badd9b2..5d389396f3aa 100644
>> --- a/drivers/gpu/drm/xe/xe_bo_types.h
>> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
>> @@ -115,6 +115,23 @@ struct xe_bo {
>>   	 * by BO's dma-resv lock.
>>   	 */
>>   	u32 madv_purgeable;
>> +
>> +	/**
>> +	 * @vma_count: Number of VMAs currently mapping this BO.
>> +	 *
>> +	 * Protected by the BO dma-resv lock.
>> +	 */
>> +	u32 vma_count;
>> +
>> +	/**
>> +	 * @willneed_count: Number of active WILLNEED holders.
>> +	 *
>> +	 * Protected by the BO dma-resv lock. Counts WILLNEED VMAs plus active
>> +	 * dma-buf exports for non-imported BOs. The BO flips to DONTNEED on a
>> +	 * 1->0 transition only when VMAs still exist; if the last VMA is
>> +	 * removed, the previous BO state is preserved.
>> +	 */
>> +	u32 willneed_count;
> Should we scope madv_purgeable, vma_count, and willneed_count into a
> local struct name space?
>
> e.g...
>
> struct {
> 	u32 state;
> 	u32 vma_count;
> 	u32 willneed_count;
> } purgeable;


Noted, I will fold them into a sub-struct.


Thank You,
Arvind

> Matt
>
>>   };
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
>> index b9828da15897..855d32ba314d 100644
>> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
>> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
>> @@ -193,6 +193,18 @@ static int xe_dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
>>   	return 0;
>>   }
>>   
>> +static void xe_dma_buf_release(struct dma_buf *dmabuf)
>> +{
>> +	struct drm_gem_object *obj = dmabuf->priv;
>> +	struct xe_bo *bo = gem_to_xe_bo(obj);
>> +
>> +	xe_bo_lock(bo, false);
>> +	xe_bo_willneed_put_locked(bo);
>> +	xe_bo_unlock(bo);
>> +
>> +	drm_gem_dmabuf_release(dmabuf);
>> +}
>> +
>>   static const struct dma_buf_ops xe_dmabuf_ops = {
>>   	.attach = xe_dma_buf_attach,
>>   	.detach = xe_dma_buf_detach,
>> @@ -200,7 +212,7 @@ static const struct dma_buf_ops xe_dmabuf_ops = {
>>   	.unpin = xe_dma_buf_unpin,
>>   	.map_dma_buf = xe_dma_buf_map,
>>   	.unmap_dma_buf = xe_dma_buf_unmap,
>> -	.release = drm_gem_dmabuf_release,
>> +	.release = xe_dma_buf_release,
>>   	.begin_cpu_access = xe_dma_buf_begin_cpu_access,
>>   	.mmap = drm_gem_dmabuf_mmap,
>>   	.vmap = drm_gem_dmabuf_vmap,
>> @@ -241,18 +253,26 @@ struct dma_buf *xe_gem_prime_export(struct drm_gem_object *obj, int flags)
>>   		ret = -EINVAL;
>>   		goto out_unlock;
>>   	}
>> +
>> +	xe_bo_willneed_get_locked(bo);
>>   	xe_bo_unlock(bo);
>>   
>>   	ret = ttm_bo_setup_export(&bo->ttm, &ctx);
>>   	if (ret)
>> -		return ERR_PTR(ret);
>> +		goto out_put;
>>   
>>   	buf = drm_gem_prime_export(obj, flags);
>> -	if (!IS_ERR(buf))
>> -		buf->ops = &xe_dmabuf_ops;
>> +	if (IS_ERR(buf)) {
>> +		ret = PTR_ERR(buf);
>> +		goto out_put;
>> +	}
>>   
>> +	buf->ops = &xe_dmabuf_ops;
>>   	return buf;
>>   
>> +out_put:
>> +	xe_bo_lock(bo, false);
>> +	xe_bo_willneed_put_locked(bo);
>>   out_unlock:
>>   	xe_bo_unlock(bo);
>>   	return ERR_PTR(ret);
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index c3836f6eab35..12457173ba85 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -1131,6 +1131,10 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>>   		vma->gpuva.gem.offset = bo_offset_or_userptr;
>>   		drm_gpuva_link(&vma->gpuva, vm_bo);
>>   		drm_gpuvm_bo_put(vm_bo);
>> +
>> +		xe_bo_vma_count_inc_locked(bo);
>> +		if (vma->attr.purgeable_state == XE_MADV_PURGEABLE_WILLNEED)
>> +			xe_bo_willneed_get_locked(bo);
>>   	} else /* userptr or null */ {
>>   		if (!is_null && !is_cpu_addr_mirror) {
>>   			struct xe_userptr_vma *uvma = to_userptr_vma(vma);
>> @@ -1208,7 +1212,10 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
>>   		xe_bo_assert_held(bo);
>>   
>>   		drm_gpuva_unlink(&vma->gpuva);
>> -		xe_bo_recompute_purgeable_state(bo);
>> +
>> +		xe_bo_vma_count_dec_locked(bo);
>> +		if (vma->attr.purgeable_state == XE_MADV_PURGEABLE_WILLNEED)
>> +			xe_bo_willneed_put_locked(bo);
>>   	}
>>   
>>   	xe_vm_assert_held(vm);
>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> index c78906dea82b..c4fb29004195 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> @@ -185,147 +185,6 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
>>   	}
>>   }
>>   
>> -/**
>> - * xe_bo_is_dmabuf_shared() - Check if BO is shared via dma-buf
>> - * @bo: Buffer object
>> - *
>> - * Prevent marking imported or exported dma-bufs as purgeable.
>> - * For imported BOs, Xe doesn't own the backing store and cannot
>> - * safely reclaim pages (exporter or other devices may still be
>> - * using them). For exported BOs, external devices may have active
>> - * mappings we cannot track.
>> - *
>> - * Return: true if BO is imported or exported, false otherwise
>> - */
>> -static bool xe_bo_is_dmabuf_shared(struct xe_bo *bo)
>> -{
>> -	struct drm_gem_object *obj = &bo->ttm.base;
>> -
>> -	/* Imported: exporter owns backing store */
>> -	if (drm_gem_is_imported(obj))
>> -		return true;
>> -
>> -	/* Exported: external devices may be accessing */
>> -	if (obj->dma_buf)
>> -		return true;
>> -
>> -	return false;
>> -}
>> -
>> -/**
>> - * enum xe_bo_vmas_purge_state - VMA purgeable state aggregation
>> - *
>> - * Distinguishes whether a BO's VMAs are all DONTNEED, have at least
>> - * one WILLNEED, or have no VMAs at all.
>> - *
>> - * Enum values align with XE_MADV_PURGEABLE_* states for consistency.
>> - */
>> -enum xe_bo_vmas_purge_state {
>> -	/** @XE_BO_VMAS_STATE_WILLNEED: At least one VMA is WILLNEED */
>> -	XE_BO_VMAS_STATE_WILLNEED = 0,
>> -	/** @XE_BO_VMAS_STATE_DONTNEED: All VMAs are DONTNEED */
>> -	XE_BO_VMAS_STATE_DONTNEED = 1,
>> -	/** @XE_BO_VMAS_STATE_NO_VMAS: BO has no VMAs */
>> -	XE_BO_VMAS_STATE_NO_VMAS = 2,
>> -};
>> -
>> -/*
>> - * xe_bo_recompute_purgeable_state() casts between xe_bo_vmas_purge_state and
>> - * xe_madv_purgeable_state. Enforce that WILLNEED=0 and DONTNEED=1 match across
>> - * both enums so the single-line cast is always valid.
>> - */
>> -static_assert(XE_BO_VMAS_STATE_WILLNEED == (int)XE_MADV_PURGEABLE_WILLNEED,
>> -	      "VMA purge state WILLNEED must equal madv purgeable WILLNEED");
>> -static_assert(XE_BO_VMAS_STATE_DONTNEED == (int)XE_MADV_PURGEABLE_DONTNEED,
>> -	      "VMA purge state DONTNEED must equal madv purgeable DONTNEED");
>> -
>> -/**
>> - * xe_bo_all_vmas_dontneed() - Determine BO VMA purgeable state
>> - * @bo: Buffer object
>> - *
>> - * Check all VMAs across all VMs to determine aggregate purgeable state.
>> - * Shared BOs require unanimous DONTNEED state from all mappings.
>> - *
>> - * Caller must hold BO dma-resv lock.
>> - *
>> - * Return: XE_BO_VMAS_STATE_DONTNEED if all VMAs are DONTNEED,
>> - *         XE_BO_VMAS_STATE_WILLNEED if at least one VMA is not DONTNEED,
>> - *         XE_BO_VMAS_STATE_NO_VMAS if BO has no VMAs
>> - */
>> -static enum xe_bo_vmas_purge_state xe_bo_all_vmas_dontneed(struct xe_bo *bo)
>> -{
>> -	struct drm_gpuvm_bo *vm_bo;
>> -	struct drm_gpuva *gpuva;
>> -	struct drm_gem_object *obj = &bo->ttm.base;
>> -	bool has_vmas = false;
>> -
>> -	xe_bo_assert_held(bo);
>> -
>> -	/* Shared dma-bufs cannot be purgeable */
>> -	if (xe_bo_is_dmabuf_shared(bo))
>> -		return XE_BO_VMAS_STATE_WILLNEED;
>> -
>> -	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
>> -		drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
>> -			struct xe_vma *vma = gpuva_to_vma(gpuva);
>> -
>> -			has_vmas = true;
>> -
>> -			/* Any non-DONTNEED VMA prevents purging */
>> -			if (vma->attr.purgeable_state != XE_MADV_PURGEABLE_DONTNEED)
>> -				return XE_BO_VMAS_STATE_WILLNEED;
>> -		}
>> -	}
>> -
>> -	/*
>> -	 * No VMAs => preserve existing BO purgeable state.
>> -	 * Avoids incorrectly flipping DONTNEED -> WILLNEED when last VMA unmapped.
>> -	 */
>> -	if (!has_vmas)
>> -		return XE_BO_VMAS_STATE_NO_VMAS;
>> -
>> -	return XE_BO_VMAS_STATE_DONTNEED;
>> -}
>> -
>> -/**
>> - * xe_bo_recompute_purgeable_state() - Recompute BO purgeable state from VMAs
>> - * @bo: Buffer object
>> - *
>> - * Walk all VMAs to determine if BO should be purgeable or not.
>> - * Shared BOs require unanimous DONTNEED state from all mappings.
>> - * If the BO has no VMAs the existing state is preserved.
>> - *
>> - * Locking: Caller must hold BO dma-resv lock. When iterating GPUVM lists,
>> - * VM lock must also be held (write) to prevent concurrent VMA modifications.
>> - * This is satisfied at both call sites:
>> - * - xe_vma_destroy(): holds vm->lock write
>> - * - madvise_purgeable(): holds vm->lock write (from madvise ioctl path)
>> - *
>> - * Return: nothing
>> - */
>> -void xe_bo_recompute_purgeable_state(struct xe_bo *bo)
>> -{
>> -	enum xe_bo_vmas_purge_state vma_state;
>> -
>> -	if (!bo)
>> -		return;
>> -
>> -	xe_bo_assert_held(bo);
>> -
>> -	/*
>> -	 * Once purged, always purged. Cannot transition back to WILLNEED.
>> -	 * This matches i915 semantics where purged BOs are permanently invalid.
>> -	 */
>> -	if (bo->madv_purgeable == XE_MADV_PURGEABLE_PURGED)
>> -		return;
>> -
>> -	vma_state = xe_bo_all_vmas_dontneed(bo);
>> -
>> -	if (vma_state != (enum xe_bo_vmas_purge_state)bo->madv_purgeable &&
>> -	    vma_state != XE_BO_VMAS_STATE_NO_VMAS)
>> -		xe_bo_set_purgeable_state(bo, (enum xe_madv_purgeable_state)vma_state);
>> -}
>> -
>>   /**
>>    * madvise_purgeable - Handle purgeable buffer object advice
>>    * @xe: XE device
>> @@ -359,12 +218,6 @@ static void madvise_purgeable(struct xe_device *xe, struct xe_vm *vm,
>>   		/* BO must be locked before modifying madv state */
>>   		xe_bo_assert_held(bo);
>>   
>> -		/* Skip shared dma-bufs - no PTEs to zap */
>> -		if (xe_bo_is_dmabuf_shared(bo)) {
>> -			vmas[i]->skip_invalidation = true;
>> -			continue;
>> -		}
>> -
>>   		/*
>>   		 * Once purged, always purged. Cannot transition back to WILLNEED.
>>   		 * This matches i915 semantics where purged BOs are permanently invalid.
>> @@ -377,13 +230,14 @@ static void madvise_purgeable(struct xe_device *xe, struct xe_vm *vm,
>>   
>>   		switch (op->purge_state_val.val) {
>>   		case DRM_XE_VMA_PURGEABLE_STATE_WILLNEED:
>> -			vmas[i]->attr.purgeable_state = XE_MADV_PURGEABLE_WILLNEED;
>>   			vmas[i]->skip_invalidation = true;
>> -
>> -			xe_bo_recompute_purgeable_state(bo);
>> +			/* Only act on a real DONTNEED -> WILLNEED transition. */
>> +			if (vmas[i]->attr.purgeable_state == XE_MADV_PURGEABLE_DONTNEED) {
>> +				vmas[i]->attr.purgeable_state = XE_MADV_PURGEABLE_WILLNEED;
>> +				xe_bo_willneed_get_locked(bo);
>> +			}
>>   			break;
>>   		case DRM_XE_VMA_PURGEABLE_STATE_DONTNEED:
>> -			vmas[i]->attr.purgeable_state = XE_MADV_PURGEABLE_DONTNEED;
>>   			/*
>>   			 * Don't zap PTEs at DONTNEED time -- pages are still
>>   			 * alive. The zap happens in xe_bo_move_notify() right
>> @@ -391,7 +245,11 @@ static void madvise_purgeable(struct xe_device *xe, struct xe_vm *vm,
>>   			 */
>>   			vmas[i]->skip_invalidation = true;
>>   
>> -			xe_bo_recompute_purgeable_state(bo);
>> +			/* Only act on a real WILLNEED -> DONTNEED transition. */
>> +			if (vmas[i]->attr.purgeable_state == XE_MADV_PURGEABLE_WILLNEED) {
>> +				vmas[i]->attr.purgeable_state = XE_MADV_PURGEABLE_DONTNEED;
>> +				xe_bo_willneed_put_locked(bo);
>> +			}
>>   			break;
>>   		default:
>>   			/* Should never hit - values validated in madvise_args_are_sane() */
>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h b/drivers/gpu/drm/xe/xe_vm_madvise.h
>> index 39acd2689ca0..a3078f634c7e 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_madvise.h
>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
>> @@ -13,6 +13,4 @@ struct xe_bo;
>>   int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
>>   			struct drm_file *file);
>>   
>> -void xe_bo_recompute_purgeable_state(struct xe_bo *bo);
>> -
>>   #endif
>> -- 
>> 2.43.0
>>
