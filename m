Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83936C36002
	for <intel-xe@archiver.kernel.org>; Tue, 25 Mar 2025 02:38:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4203D10E06A;
	Tue, 25 Mar 2025 02:38:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="feGCuhxU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 576FE10E06A
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Mar 2025 02:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742870290; x=1774406290;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3+mWokhKKkqOHqspp/cCSIhhyily45wsSOqPoV6uH5s=;
 b=feGCuhxUZIlV2REeTUtVCByV0ABhh7/RyeuDW6PR9/r13DXbI0D6rvKK
 X7LSkPeN2n+b6Dg1jGTzd2M1ZVZOV72zW2OP1geN7y7Ip1Qi1lDxTMozA
 MmGiQo66twkOtO/w4ZVOGhBfylDH/WXrZ1rUQrT9UBDObLDy5AIOJ1V4W
 8Y7LPGPigQ9nXQ5ny1b1iEfvWFb1IWrm2OSsHj7BkogyDzVG8Bh772xiD
 DLO4TcwPNfKmRIIIOx8PD/Warq8e41NyUTonjYRqXU9P+Fb8NqOaGTmmx
 b8bgR5Jp9GhTabw0mtSPyaJT+wVQtxaCzi5ca5z3iCDAtp8HiYw9Upak0 w==;
X-CSE-ConnectionGUID: Y49nDyVtSqW2EBgulOZR+Q==
X-CSE-MsgGUID: 0bz5oXInRdy4jXQq/wsPlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="43990755"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="43990755"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 19:38:08 -0700
X-CSE-ConnectionGUID: BPHka0f4SImLnBsyjcIBhA==
X-CSE-MsgGUID: BLA2YkffQ76bYBtmRLFOtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="124694038"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Mar 2025 19:38:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 24 Mar 2025 19:38:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Mar 2025 19:38:06 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Mar 2025 19:38:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UKgAR8708fXm8jBQJjrV6lHswBjm54NeMZ1KHcakfGFZXT7g7ArvU95DIGHvBssbwUnO67ryXB48H19/77FYaLDDlGIpn9rl6y/uYNYl+ssaYTexDRYrywWafgxjXMC0kh3cHr+RjVWNXQdGrP2B8ORosWpE3Vf8yydVd/uMO31gtHYa+n3tpoLQ88yIa/DTIuwSzRxKeGTZ8qoqQEUNORllTlwwgAM3IeY5PKvm2Zhd4jtJFF8FE1z5tpLpkAdmP4LC6zQlmW0r4I5P8Ni7xd/MLoxfjqonADZpV/yxkjDGMTx+FtKWCx02ggsjqt4JWl2JLMr+P0x9E4F7K+aGnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c15ZUcGYdkNy/KsKffpvot7eY6X/SPCenJadObJUvCw=;
 b=yJXSQQpmUiBlMO6wkUvd4YR0x1Xsgeb4zSEkgOJY9zckw8V7SZWy/+Tr95qAHkQQ2vi2LvQzS1nzXiRyVCZU7Saza6EF5UcmVwiDvxHGeiJ7YlRmPm2lb84c+Npx7YEtJaEMb2A9aR1qrmHiBQ4ZJ214C2uV5uzVN8AntfCjTHyVIKM3v23Lkd+VLInOW9m29Nom+FR7gdGJ1s3kUQWc8RGLiVAJDHACYZNNN7clL0BVv9BXeULa01Bcf1n5Q5qCGwyVKXNcXNHI/ei7Qq1qLYo3ec/40yVyAJxe9hOprft24WUkJYho8L0N35c2PoOMDgSuU2uE4dJf7UYR8R8PiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 02:37:34 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%3]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 02:37:34 +0000
Message-ID: <b46fbbd0-ee96-4f00-9f6f-a00115feb32d@intel.com>
Date: Mon, 24 Mar 2025 19:37:32 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/xe/pmu: Add GT frequency events
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
References: <20250324232402.46481-1-vinay.belgaumkar@intel.com>
 <87jz8e9d3h.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <87jz8e9d3h.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR13CA0010.namprd13.prod.outlook.com
 (2603:10b6:a03:180::23) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|CY5PR11MB6392:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cc7db43-7da8-4e29-d73e-08dd6b45ffa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bWdURnNMRHF4Z1ErTElPdkZoMjBDYnkyWlFzUlEyQ1JwR1ZQQmUvamoyMklm?=
 =?utf-8?B?M0htUEdlcld6N1JJcm9ibGJodHAvUTJUbU1za3RDVXNUeG1nV1ZKRHNFTUVX?=
 =?utf-8?B?QlRLL2twT0Y5M3dCOUFmd2RpNjhndTVnRnlMMytPdkRnTTgzNmFCVWZQQ1Zr?=
 =?utf-8?B?ODdvb1o1clNrZmErcjdRMW1DZUZTZ0hMY2pKL3JaZTk2K2hHUlNocDhRQmJI?=
 =?utf-8?B?QjhlejU4azg0QUdVS1FwMDJMZDd6NXJyNEZEUE1hWExIc0RIMCtOZk9TVEdv?=
 =?utf-8?B?Q0Rzb3R5S1duZkdJTEpIZkZOWHozNzVTMUNpWmhOVVdzYzRzTnFpanVxL1Rp?=
 =?utf-8?B?dGtpWDJSUE9uZFJmVDVEeDgwWVd1SzlLaEVDVkNqWGlpYXpTcytmNkpvdDRB?=
 =?utf-8?B?VnFOcTZMNDRzVk9aVVdqOExNdlBrcy9uMHNIUzVFZkhaQVdOT2RTU1R2MFl2?=
 =?utf-8?B?UU1TTUYvY0pIeGtrRVBmd2ovWElGSTdUYXZyUVN0UU8vN1dHNFlQdkVvY28x?=
 =?utf-8?B?K3Y0UmRXb3dmOVRUU1ZZYnc3U09WYU10RnlTSktmUjByYzNQZDZSZUhseHBT?=
 =?utf-8?B?dEdSV0Y4Y3BITFN2c2FQYlJRc2lvYnhoR0ZhTDRGdXpRVFArcW1NdThZTHcv?=
 =?utf-8?B?cGsxSU5RbFhaZ1p0UDlHSTUvSzdXNUhJR3FIR2Y2c3NaUUViQTJLaGY5M01w?=
 =?utf-8?B?Y1RwWjgvTkpDYTQrUzVIeVNKd0EyZWMybHY4VWhneWd2VDJLMHozdkE0aW41?=
 =?utf-8?B?dkxrTDEwbkRRdE9SNTJKK1M5MGxhR3lHa3c1LzV1TFBUcTdZS3lJdW1HUDY4?=
 =?utf-8?B?eW84RlpKZGRHU2N0UGxORFh3RWZNN2EwRVJoeC83bHh4ellyUFY1dVJneVdG?=
 =?utf-8?B?RWtYeW56VjNpcVJIcE9qeFRwQ2JRSjhnOUt4L1paSWlPVlZveC9Md2Z1NWpw?=
 =?utf-8?B?S1pwcndzaHpkOUcxTnZTbERhLzFEamxyUStOZjU0Yzg2dk95MkpVYmZGT0Y4?=
 =?utf-8?B?MmRwRVdsRDRlaGdCd1dHLzN3K0FTUGpCbjZ0NFl4cjFQa1lFV1FPRVVoWFJQ?=
 =?utf-8?B?UmswLzBsVmpDNW5JK3Y2dDNVVDRrcksxVzhMaFNGN0c0RXl0emFTMm4zOU5N?=
 =?utf-8?B?ZGdQZ01qbitXbTJlck5USnk1dTNaSTNSc1ord0c0WVhjZElaSGZYTjNuZ3VQ?=
 =?utf-8?B?c1VNQzd4UWtXU2c2dW05WWNkKzlEdUdVRDJxZVkybkJRY1RQZVBlUlkyUDd4?=
 =?utf-8?B?SUZhMjZ2WWhZNk94SmlaeURPUUg4cTRBSEZxMHBOcW9zUUhaT0ZPS2xKcjM1?=
 =?utf-8?B?ZERkWUlSbTZzZmRLMjNtOHRiZnQ1N3VDTkFmak9hQk9TTEdRd0tReUpTRXVq?=
 =?utf-8?B?TVRXdzhkeS9kVWRwVkVZak9qSTREMUk2RmZYeE5ROFlYeGx5MExCV2JWbHRv?=
 =?utf-8?B?TmhQM1NXUE42TWFuRUFjN0RrRjFkeU1HN2ptbmVVOVpscGVyZjM0UTRwT1VM?=
 =?utf-8?B?NUNFRlhPbkdUMzg5QTEzaUVTVkVVd1JIdHc1eTZvR3U0M0pBRnZuZTNJTnZw?=
 =?utf-8?B?aVBITTM3dUpUcThqTWZxUEMza1ZSYmVMT0c5d3JaeEtNVWdWUVZQeVlISTA2?=
 =?utf-8?B?a012cjllNmhkZlM5bzlYUklIc0h0dUdseWlpR3lXQmU1WVFhYU5RUGoxUGpG?=
 =?utf-8?B?azhpbVgrM1p5SWxvc0tUVDRhWFVwNFdBY2dMZmZ3OENWa3d6bEJhT3FINHZ0?=
 =?utf-8?B?d1lVNUFzMFZFaCtRRDBDU2Z3Qm10UHpJZjMwNDUzblAyVkpCMys5YUN2TE43?=
 =?utf-8?B?NUV4aFovMWVUdkF2ZTNCUVJvdXFKanpyTFZQTjErMThNNlNGMnNaWkRUYVNh?=
 =?utf-8?Q?DmKmoYp3gBO69?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmxobGJKMGJocEZQa1o0dkhTK2dsUXRqQzNhY0I5azBBbUZuMzhDNG81WUZ0?=
 =?utf-8?B?dmxucnNkemtaMG1nZHBVWHBIK0tkL2RvN0dTd0lFdUNYM0FLNmlkc1JXcjh4?=
 =?utf-8?B?anY0VjVWS2hQM245ZEdOOXRQeFViSkdFQUJhbCtIbk0wcDd1L05heDdrNXNx?=
 =?utf-8?B?MGpENW82M2piNC9vaXpudEo0NmlWbURQa1BLN0htMWZBeHdjdk0xQTZUMzFE?=
 =?utf-8?B?eEMzZkY1ajZSYWtSYWZlSjVTQi9tVGZYWDBYYWE2V0dZOHdlTXFxYWRjckcw?=
 =?utf-8?B?OGI5NCtRdDd5NUptYlhwd2VkMWd6cittbERFaUwyTzNKK29va2pZRExydmo4?=
 =?utf-8?B?OXZ1U2pTSW9ySVo2N3ArVm52ZjVFZ0pmRk5FTC9vWjlKUGVKTXFuSWxMY2Zl?=
 =?utf-8?B?R0RIYmc1TUl6MVRvZnpCVjhxL0VzZDZ2QUpGa0hpdkpkNW9oa2pRNlcybmE1?=
 =?utf-8?B?SGdGcUVqNGtRSm9mV2dqN3lUNGNHd0dMVGpwTlBjaC9zWkhDQ29PcDZwTGZy?=
 =?utf-8?B?SGlUT21XN1lXakZreWpKUEtYV2ZSYjdLUHk3UVE0UHBpUjBoS2NSSllxWWMr?=
 =?utf-8?B?STl1TWhJVm1EeFE5dnZDZGJaQ21MVko3SlNkZndmM1lYcFB3RG1MUDJaVE5p?=
 =?utf-8?B?eGZPMnNGYnNDVjVUTFd6MDc3RjNkMGthMVk5RGs1cGM2Y1VIYjI4OXJ3eHIv?=
 =?utf-8?B?VVFXc2wyc3BnTFhwWXNLYkQxU2hHZlRXUGZLYndiUG9YcU9WS2ZLdGIyWjN0?=
 =?utf-8?B?MEZQK0l1RFRlU2dFamtDTXozV0R3b2JyMUZCR1Ara3hidUhhNVBOekp0UnB4?=
 =?utf-8?B?L2phS3JqNEJlNDNjbVgzdS9xZlFLamphUTMvN2c2Y2ZMcFcxU0FVb0d1Q1hZ?=
 =?utf-8?B?ZXVaR2ZuQXdXMVhmb201M0xoRkxMdTYvVVdRSUVRTXZsOFF0RitDYzVteDZY?=
 =?utf-8?B?MEF1RGk3aUdKcnZSVkZydEhVSXVTUnQrYWJyL29OQTNBaW9JMkNGazhpcW42?=
 =?utf-8?B?L1BmR1dyQ3E1TWdRc3U1SUNjazBzYk1ONGszT2VVdSthUDZQbVp1WGRCbENp?=
 =?utf-8?B?ZG5qeVpXcWpFMTVlenljNkRPQjgzdXVhQ1Q5VXlOb3QvUWU5cytDdnFVQXVO?=
 =?utf-8?B?Y2dMSkFLU2ZNaVptS2FXL0hrMkxHZlVpRk5rUEQ0TExzSW83U1dJSWZOMHU2?=
 =?utf-8?B?VFZCVzVLOFladFZ5UDdiWXJ3Zk1lNHFmQnd4VmJscGt6MnIxK2Jma0xPMjVr?=
 =?utf-8?B?alQ1YXJzdit1VU1xcXlrYnkyZUw2UndpUGR6aGxkc01pbWpFSmRWSFhZeExS?=
 =?utf-8?B?bEhuNGY4SU9jeHlJaUtwOW00MVR3UVBTNy85aG9MUmNtWjFvY3YwbFo0cXlY?=
 =?utf-8?B?aHkwZTZRWWVrUkM1QUhpSkpCUnk2WVBUb0VQcldWUmNIMzk1blZQZUJ5eCtm?=
 =?utf-8?B?d1R4bFVvblI5dUMwaks2RG00R3JMejdTODRVUUNwSjErMjZYaVBmY0d3Q0pa?=
 =?utf-8?B?ajZXU0k2eFRITmlMQ21PMGI4M3IwcWJtUDZqR3JaYTFXZzRKOFIycGZ0SVBa?=
 =?utf-8?B?ekJsRTEwb1haYk5IRE9uRkhBMkUvWGlpZWJUQ0ZjMzFNUmliVFZMdVRNZ1Vv?=
 =?utf-8?B?REErZ2hvSXpab0phN2wwWGswOCtRQ3NEdm5JczhtWFFyWGJrNFlZRmxoU3dS?=
 =?utf-8?B?RDdwdDdVcjNIQWE5UXlYdnBuL0FzdFJIWFh2c0VlOXZkSlQzWlNpUUorL3lq?=
 =?utf-8?B?N3RVcllBTXAyNzNIeHd4bmoxUWxoWUtPbERXRE80bXNxNnBybXVsOHNyclBv?=
 =?utf-8?B?SzBXczgxN3EweU11dy8yU29OOFg3SmE1dERSYTZoUUV3ZExlUm1tbnJBa1RT?=
 =?utf-8?B?RHMxcUFqcTA2NDdSUjlKeTg5bjJ6bXVsWjNGQkYrL3IrSlZQQkhPdXdoOEVR?=
 =?utf-8?B?RDBpOUFxWGVzZWpUN2o0aDQ3bmVId0YrVUwxZFcxaHBHTlF1eTZwTEFacTBU?=
 =?utf-8?B?Q216SVcxNUl3MDVQSURST3JxbnZPOWhSNXQ5d0hkN2dZeWUrL1VxbnZFemEr?=
 =?utf-8?B?a2dqRUVrV0xLcWl4QTlJR3ZRQjhyYURmcTAxb0VDd01DOXpWZlR1MXE1Z3o0?=
 =?utf-8?B?Y1o2STJwenVSVXZPK0prYlZ4ckYwMUpRVmszbUdtWG1YYmJOeXlyMU8zTVVq?=
 =?utf-8?B?cFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cc7db43-7da8-4e29-d73e-08dd6b45ffa8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 02:37:34.3971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fq5hcu2t3VsvLS608+HgSdoCKEC5Oeul4VilaX85VHQE59qnlZXI0cJ1B4SfdKVRHaiS+9h/cuE/FbTZlHt/2GkEtJ4TtlPe+ly/Z7oHIwY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6392
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


On 3/24/2025 5:18 PM, Dixit, Ashutosh wrote:
> On Mon, 24 Mar 2025 16:24:02 -0700, Vinay Belgaumkar wrote:
>> @@ -266,11 +274,24 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
>> 	case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
>> 	case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
>> 		return read_engine_events(gt, event);
>> +	case XE_PMU_EVENT_GT_ACTUAL_FREQUENCY:
>> +		return xe_guc_pc_get_act_freq(&gt->uc.guc.pc);
>> +	case XE_PMU_EVENT_GT_REQUESTED_FREQUENCY:
>> +		if (!xe_guc_pc_get_cur_freq(&gt->uc.guc.pc, &cur_gt_freq))
> This is unconditionally taking the forcewake and waking the card up just to
> get the sample. Do we really want to do that?
>
> So if we don't do that, both the actual and requested freq will be 0 if gt
> is in C6.

For actual frequency, the register(0xc60) does not belong to any fw domain -

GEN_FW_RANGE(0xc00, 0xfff, 0),

HW will report 0 when GT is in C6. The requested freq register is a 
shadowed register (0xa008), so that will not accrue fwake either.

static const struct i915_range mtl_shadowed_regs[] = {
         { .start =   0x2030, .end =   0x2030 },
         { .start =   0x2510, .end =   0x2550 },
         { .start =   0xA008, .end =   0xA00C },

Thanks,

Vinay.


>
>> +			return cur_gt_freq;
