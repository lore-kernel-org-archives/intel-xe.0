Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A757CCD6E57
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jun 2026 18:37:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6133610F4B3;
	Tue,  2 Jun 2026 18:37:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FM6wpgxs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D309A10F4B3
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jun 2026 18:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780425456; x=1811961456;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=4ONYk1abo1A9x4noWAJRSMPTBzKL9wc5fI25JEwgQMY=;
 b=FM6wpgxsHR7qRZaAXiuFwALVknq4vf1qS4rjxC4YTbcI9uPrtg0+9UXV
 WvxBIE0mluQTt8Vo4HB5Yp0wJ3kNkqBiELTCG8naGUSEZRsIW2KTL33GT
 /cmfE6yvBO3EneFoqUPeIpFw6paLdj+MK/mrjy1DFWqMktZgDheBgHDJ6
 20eAk0T2Cn99X6L41279XarFsNvN2LnNpPdr37Mai/gX6y5b5lMpl0TE1
 qVprqlE0NABnNzhjl25PYkcHy84+HNUnWVoDUETXIb/vQwefpfF5MCsW2
 Vydlx2XE07LMcfTGWgT4XodVq2ao7C/1s9JAmWj49ZEONA33wOu4RwIaL g==;
X-CSE-ConnectionGUID: BnhxQDjsSPCE8GaXhxm8oA==
X-CSE-MsgGUID: robRSMv1RwuyXjVHx9ReUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="92602608"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="92602608"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 11:37:36 -0700
X-CSE-ConnectionGUID: qlfiDG0RQBaF+Sqj/o1TBQ==
X-CSE-MsgGUID: Q4O5qU1LRI2MsReU0TdDYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="245795937"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 11:37:35 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 2 Jun 2026 11:37:34 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 2 Jun 2026 11:37:34 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.20) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 2 Jun 2026 11:37:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P4B0IGeFbL8YVjNb7mGl4WkfYCjisG/5hBcb2ZqdY9FVJmUDjzt9pcuV0SqMoG9TAlHLaRjR4dcz+z3kzdE+YXXXriE5v/elsurY3QzqvjMCaPFMTTR3NYjWYXQ9Wv1N9wbfYZP3gY3CpeS7egaXdA65IwzQ6VqeipZLFRKyGO5AG0YbVqvK9roiBttgdpYH6pRK7spaHf6Z8+oQC93wEN+uNYQ6CDbroXrOdcxF46zprLD5kCQXIgQgiW97gYrWbB+/KDoNjz7l70LOQi3fxYZVBoDdcI/ZA9U3Xt+nCHKV/U9eMQjHuWR29FwBIVWiPwFWPxN7spd1/mCMQ04RhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LzDmUZcN/u12r4te8LxYYgIUqwciS/SKq4FtgC0Ii+g=;
 b=av5k5uDhkof38+Pvi0hp5fPb9/2J+0U87R/L7PQHzFHzFObBZcyR51q4G5AR4QRjTYPRvFU0QiHZwz1dPhunY8qyZd3ChKWEI8NYtKf5N3Q4rV109kLGytowCx+sLri/t/xmspABNz29yqqFYBAaxXAAqyDiSD6o1lBR5PXWzbJNDgdT8H7WRN9iVyMVEBvTgJfA4c+84Z0Cie1W+TDolIXWglhyoPwA29SydFP8jYXgDRF+3zv6lLpD0qk7oPz2If8K4QIlC2Tig7qbiUNmee/jBKVKbqVN8Eszbi/fPx8rSemlAzKvRI8hMLOX3YM9Hoi87f9vW2aFL3aN5RBPMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by DS0PR11MB8071.namprd11.prod.outlook.com (2603:10b6:8:12e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 18:37:28 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::e0e6:a2f:a53b:4414]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::e0e6:a2f:a53b:4414%4]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 18:37:28 +0000
Message-ID: <2258e06e-5938-459f-b590-0ac4d9243d1f@intel.com>
Date: Tue, 2 Jun 2026 14:37:25 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/xe/guc: Reduce GuC log size from 8MB to 2MB
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260511194924.2016315-1-zhanjun.dong@intel.com>
 <20260511194924.2016315-4-zhanjun.dong@intel.com>
 <cf526083-efe8-4e99-98a2-7c35206c9d74@intel.com>
 <66dafe9c-fb46-445d-b8ed-f5e9075294c5@intel.com>
 <058112cd-cad3-4cf2-b810-c85308d3a0d2@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <058112cd-cad3-4cf2-b810-c85308d3a0d2@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0074.namprd05.prod.outlook.com
 (2603:10b6:a03:332::19) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|DS0PR11MB8071:EE_
X-MS-Office365-Filtering-Correlation-Id: f82d1682-d130-4468-4809-08dec0d5ff7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|6133799003|56012099006|11063799006|4143699003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: RK8NTC2+QVw2i55hu6gdbS/VFPRivmwIZP7COYrSGEVZmW29Jbb7iIGu2BMJaOounacPXXGL2Kc6Lw+woUycmopJxL8rzjGnDy2gdW4swAzJ7yjgEDDXDp3RaInpxh3St+MyHijXyayr5AedeGYsaqmoOZMWYGPc1veZwJQvceCOX3Ku1YVtN3zr4eNiH9TOr5lMU1VEnJMxoBb5uLVkswk5Zop7QwQsM7dqrrCv8nxFRUF+1PuGljdUb+jBH0lceAsMtzZpNIIsuUOCBSu+I2OfXSqO6W0YOby5EAVd4asxsqzfauGWn1qX4zTRJrKZmZREv2kq27nDrpBmEhFKkSG154Go/HIdOgVA/dl//3h40HIyY7TrFHWFas8a0VoGgu1eMUOyIxgM6eJpBnurL/tMyo+dcTdY4JXc0+eNJ0wxy5LvvS5yxXWxsMdmNLNpeScUdbQVMFXsrah1BSWV9R3o9UPDgTZwWZyg5DgWaiF2vgeIXxOo0HkKZ4iszOgiOv6Mg4SeJOKIl8XBB1AuDhgxWKYVNTB9yUMX0gHKU1a7SAQmq6QqQIRADEOzYPQ6H/UqCHb/lpLvJalvapVTVDCFWMPc0zDXswWzc948On5w8FjrQr5Y7o6refC2/qzU6govc0b24WqonVsoM9mxyGVqVHo7iToblUNLm788BHR36JWo4y4onMNK1pxWmjOV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(6133799003)(56012099006)(11063799006)(4143699003)(3023799007)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzhNQzFqTldnSzNPMFM2SU8xa1pqK211Z2FBL1psajFkVHlld050Ulovbi80?=
 =?utf-8?B?QzVWK1dSTzcwZmxHZmh5SFV6RmhoWUdLTGF1WjU5NTZGVVhaUmpyN25YWVA2?=
 =?utf-8?B?aGZvbTBTMCtOWUUrREJpc05PdEcxNGNVbWk3dlRwNnpMS05qU3pHV2ZDT2dX?=
 =?utf-8?B?a2IzVGNwSFFkV0F5VnJsMU9MQmJoUXFlNjRYOGZzVkF4ZHcyNHAwSEp2VFZO?=
 =?utf-8?B?blBETFFTeC82U1lRUlE0V0d1UllGUjk2Zno5ZG5ZclhhVzRPdDhrTUI2Qjc5?=
 =?utf-8?B?dGUvRkxteWdCZTd1ckU4dFBEK0s2alJtSzQ3QkhwRWk4SVhHS1REa1I1aDFO?=
 =?utf-8?B?SFA2cTJ4UWltelBqSVo0WDBXWEF4allZN2pBMExicU80LytjOWVNYmVqRU9t?=
 =?utf-8?B?c3VQTlZVVHZudWpON1NYcXRkcHRPL0xqVUlET05IZnNnVllKVXVIRGtQOEo1?=
 =?utf-8?B?LzJOT3R4VGVpb1NzTEZtbk5JbjJDMVhIdTF6NmZMQTJVbmR4RG9jL2dRZS9I?=
 =?utf-8?B?Zk4xMzdOTFg0WjY0cmZ5d0RZZzZUTnhBRWNvbWNDcTZvTENCYXhjanNkL2Rx?=
 =?utf-8?B?N3Z2NDJKSTI4cFdhUG4vQ3A1dkoxMDZIeGR3bHZhakIrL0lnNHVhc0pkQit4?=
 =?utf-8?B?d1NaM3FqUzNpK2d6b292dGxvNlE5MWVrelJSaGUxUGY3WndtL2N1R0hDVzgz?=
 =?utf-8?B?OVdHdnU0UnhCNmtsanFLTFVnREFOcndGUkkyN243eHcrc2pVQ3BCMEE2TE5i?=
 =?utf-8?B?RTk3K2lUYzc1NGEvSE9pdUJMTnAzY0Z1TjZFWGxTMFBKYjNmUkkrZ3h5V0Yz?=
 =?utf-8?B?dHFQeHYzK1E3UWNYS2NlRFJyTk1yUDFjWUd3SFl3RmJhcnpxV2V6a3J0MExN?=
 =?utf-8?B?NWQzWWlrbEdwdGE4TGJha3NOV1JJRS83Z2dDTFpYYzgxNUtCbkNNcXhXZFVY?=
 =?utf-8?B?d2Y0WjV6WHFvOWtkN1Y3TjlTUEdTZlYvOG4rRUV4TEhRRnljS3JjNDluaTI0?=
 =?utf-8?B?RndjdVF1d2VwVlVyR0oyOUdqOTNTeVNhOUh0Wjl6KzNBblZkTXcwR2g5azNo?=
 =?utf-8?B?REtIM0dsaUMwUEo1V2VFcjNubC9KTWhGRGoyK3MvNndmekduR2Z2bStjNUxX?=
 =?utf-8?B?ZUhybEdXb091dnhrWWJwNUMybk0xakZNYUtiNzJBZHoxNVhiQ3l2ejNMSnhx?=
 =?utf-8?B?WmUwYUg3ZmZudnlEOUJxYWtsUU5ia3o0R1dJcFlhVTVwYmZCUFU3TFBNUCty?=
 =?utf-8?B?aWNBczcxZ08xODgxUjF4VnZodS9WNDMwdkMrRkg1UG1KSTliNWJPckludU1O?=
 =?utf-8?B?NEVINlc1dlNhQ1JrWklraXVNcGp4ZTdqeDV1YUE5azBkbzY5aGNTem1NVkYr?=
 =?utf-8?B?MmNhMTNnbVc5N1l1OGFrRnV1SmFicHhPY1RuNllwSEwvNnBMaFpjS01yLzlJ?=
 =?utf-8?B?V1E0c1cwNUd3aGVoQXZoMUJDd2FpbHdleXlEOE1GN1JEYmtTNE1PMjZDVDVD?=
 =?utf-8?B?cytBNVUwREcwZGxHamdvZEdXT3ZvWmdEd09NN0Z5RjlxNXlxajBEZEZGcklv?=
 =?utf-8?B?Tld2djVCM3hVY3Y5MzM5YXlxVmxycjZUY1RSL294aWIybU1jeWJidjd5c0tV?=
 =?utf-8?B?a1NsanZvYUZnc004SlFXeXJXSlp5NDZ6UkcvVzR5RWs4Q2h4ZWpibC9LOWZZ?=
 =?utf-8?B?QitRUzAyTFNjOEFFVHpHaXZrT2NNRXBvQ0c2SlhBbiszZFpqTkdZaG1vQ3px?=
 =?utf-8?B?eENzWDVrckIzamw5bW9UVWJHaXFUUHp3ZllKSE0yQXVQYlNCenB3d2xwR3ZS?=
 =?utf-8?B?cUEydXpvRXZXVmhkT1RBUko1bnppc2hOdk9zRThLVThKTGlibzdTbThTQzNF?=
 =?utf-8?B?bWtud2ZNTnc2Y2IwOGxZclo2L1RMbUd3bXdVTXhNNW5NUUlSZ2Q0Qzd4ZEdo?=
 =?utf-8?B?TDVIeHRKcURic1NLMDMrblIwMllhU2NILzQzTzlSQUxxbnNJVG0rSkNXSGJN?=
 =?utf-8?B?WWxWeFZ6Ri9mUDlMdm5NRzUwSGYvRlpRTXp2RkViZnFaU1RlSHAybm1FZlVQ?=
 =?utf-8?B?ajBON1duR3V1Nkd3WnlWbWQza0NZcVBVV0NOVllYdE1nL2s2SzZpL2tHYkZn?=
 =?utf-8?B?Q0pSa1NYcUF4R3RtdUIxUUExQkdBWTVMQmZoRkU4Znk0L1RNYndFaVpCak40?=
 =?utf-8?B?S1VPdmJMdDFIcWxiV2w4WVFoekZBRjRPZitlWnFWajFSdE1zRGFSRUZPVFJC?=
 =?utf-8?B?Y1F4YytLampGM2ljenAzVGsyRGlQZ0g0bGNKMVNIZjVMWTRobWRlc0xYZU81?=
 =?utf-8?B?Zlp6MFZ4NWEyV2tVSHozWEFyV0M4b1R6U1YyNXNkSExOR1RTWnZIdDkydTVj?=
 =?utf-8?Q?rfowLqxezOqef7Sg=3D?=
X-Exchange-RoutingPolicyChecked: SAUCULF3055/jKn255dAOjNgaGoWPvalV4ep3wohNg1hdbjEdq1joC6saE4wnTZmFVQnVqiz8zOctjdRV7N8iWAfVZS9BJjq8rRjnAgh3UyORBxrv5gjBTe2QhKcBM7ZsHT2S86fweVT0OXvJBe0mUwzjAhpVn7IC8cUceOh3lPoKLsqhcvLYJKnCRx9zUkSjZunrgjI+cunc8PeYtdL1GT1a/EGuuhJtyAuT3JPlrQYXzccBf+E5Vg2ryz0S9CNah+PuLo7qLFwKVrmadxVldvxrDg0fKhUAWcb9s3edYVfiQ/3zII/VPzNfsUCwaF3846ZnbFmxurski/JnPrbmQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: f82d1682-d130-4468-4809-08dec0d5ff7a
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 18:37:28.2329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LQBMHL+/WgvXKitx+RhKEefTxRhzpX/8LRMSJGP7AJuFSVVdk7alHMg06JmBgZSKTpq9A4yA5oatyshCEsrXow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8071
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



On 2026-06-02 9:45 a.m., Michal Wajdeczko wrote:
> 
> 
> On 6/2/2026 1:20 AM, Dong, Zhanjun wrote:
>>
>>
>> On 2026-05-28 3:18 p.m., Michal Wajdeczko wrote:
>>>
>>>
>>> On 5/11/2026 9:49 PM, Zhanjun Dong wrote:
>>>> Reduce the default log buffer size to improve system responsiveness and
>>>
>>> default log size is SZ_64K and is not changed by this patch
>> Typo, here the log buffer size is for CONFIG_DRM_XE_DEBUG, to be updated in next rev.
>>
>> Meanwhile, you raised a good point, when CONFIG_DRM_XE_DEBUG is off, the log size is only 64K, looks like no need to do compression.>
>>>> readability. The previous 8MB threshold caused significant delays during
>>>
>>> 8MB size was used in CONFIG_DRM_XE_DEBUG
>>>
>>>> log output and imposed a heavy load when printing to dmesg.
>>>
>>> hmm, but that was on purpose, as any extra cost caused by such dump, which
>>> should be sporadic anyway, we were willing to take just to be sure to do not
>>> lost any information from the too small log
>> Agree, the heavy load is sporadic and expected.>
>>>>
>>>> By reducing the size to 2MB, we maintain a sufficient history while
>>>> ensuring faster flushing. With a typical 4:1 compression ratio, this 2MB
>>>> buffer will result in approximately 512KB of compressed data, providing an
>>>> efficient balance between log depth and system performance.
>>>
>>> hmm, such dumps should be very sporadic, already after HW/FW being broken
>>>
>>> so what do you mean by the 'system performance' here?
>> Sounds like I need to add more description. Looks like the wording "performance" here is not accurate, to be updated in next rev.
>>>
>>> and maybe it would be sufficient just to introduce compression without
>>> reducing the log size?
>> When MB data level to be dump to dmesg, it take long time,
> 
> but I assume we're dumping that on purpose, when there was a problem and we want to collect as much data as possible
> so even if this takes time it should be ok
Agree>
> 
>> if just add code to print log for debug purpose, test shown when dump > 8MB data, some task/thread timeout triggered,
> 
> but we should dump CTB due to an actual error, and as we already hit that error, some failures are expected, no?
> maybe the problem is that we trigger CTB dump too frequently without a good reason, or the timeouts are too short?
Exactly, sometimes when debugging, we might trigger dump too frequently. 
For timeout settings, it could be too short for debug purpose but looks 
good for production. These debugging things happens everyday, everywhere.>
>> those are noises not expected.
> 
> do you mean errors or dumps are noise?
Not the error dumps. The task/thread timeout is essentially noise, 
triggered by the heavy debug print load.

> 
> if the test triggers errors on purpose, then maybe such dumps are indeed unnecessary and could be viewed as noise
> but then we should rather introduce some mechanism to block such pointless dumps during tricky tests,
> but leave the full dump for other cases where they will be really needed and helpful ?
I agree with you, debug print is by purpose, if it is too much, the 
developer should consider the better approach(less frequency, reduce 
dump data amount, remove unnecessary dump, ...) and avoid the side 
effect, like timeout, etc.

Regards,
Zhanjun Dong

> 
>> By compress and reduce the size, we expect this kind of noise could be reduced.
>> If you think 2M is too small under some condition, let me know, now is a good time to change it.
>>
>> Regards,
>> Zhanjun Dong>
>>>>
>>>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_guc_log.h | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
>>>> index d231def50692..44e81a54681f 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_log.h
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_log.h
>>>> @@ -17,7 +17,7 @@ struct xe_device;
>>>>    #define XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE    SZ_1M
>>>>    #define XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE    SZ_2M
>>>>    #elif IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>>>> -#define XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE    SZ_8M
>>>> +#define XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE    SZ_2M
>>>>    #define XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE    SZ_1M
>>>>    #define XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE    SZ_1M
>>>>    #else
>>>
>>
> 

