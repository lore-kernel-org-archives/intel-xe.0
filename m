Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A26CD6E68
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 06:05:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BC3311268A;
	Thu,  4 Jun 2026 06:05:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XQWL+tHS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58ED111268A
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jun 2026 06:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780553119; x=1812089119;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=N56VgwYxOwQJ8jIaNnWHD4ZZxkVYICCke5TnfH9yIiU=;
 b=XQWL+tHSvmjR5a/cLNHjt3P5Yg9/KYYknpp/QE+35jg982SwSobTdJrZ
 m1yDtODtQnr2b8+fVjg6ptcvmITMPJje12JkmXTFTWrm9Tj2emeGWFGZ1
 KdP8nr9uAtsXFY3IjUjxbdjdE3YaFg+z6lR03Rf99Gz5CdfV9akAo47oW
 cg/lSl3/wxrKPMclyZ+TOoCkh1BSJgsNH1uHfZv2ISv85P6anjqehsrYD
 s2CpIvhxyhlgrBn92tHVgKNKY4V3CErE405S9Oo0HZXfQqFoLnMCqy6Au
 q398keLCahKH1HVcclOJ96g/wF9p0QSD+4OFYC5Z4F9apiXOcvMS6TAkj w==;
X-CSE-ConnectionGUID: UNl9NBzaSvOgxRauaoS/nA==
X-CSE-MsgGUID: NKtTtFRuR9CHLyPBf3sC5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="104034503"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="104034503"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 23:05:18 -0700
X-CSE-ConnectionGUID: END9K8LwQluXQzhs4KTepg==
X-CSE-MsgGUID: hUnrY67ESZC014sVN0lnew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="241948542"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 23:05:18 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 23:05:17 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 23:05:17 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.64) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 23:05:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JJZVtNl2iyLAb9tcj4y1pLImOWf+o/X6nQ1XxewLzGi+7/PMKSd/mTs8eB9hCW7kJ3sw4k6gNR0nouHcLwlWhR2rAp5+tKD3o79HD0rPZmLptzQrurcy0Ac829rwo/Op1OF0C25imUBMTYFbZTKSbQXQ2LlbW07reWRKX91AbgG6tWnWH3fWSy+9mvvzs8wUtVH7LyPelEuXDY9JnbcnmArnvjvH2biPWwfzM5hfeeFSI/hsuvZ1pCiAC+cx+2fCpvYUExQWDkLVUnUjD9btdjuicZFGXIDh9mP5ZAnmrbvSylXBbip0HWiKolv8Il6JHGRcdodl1vMIYasO35Vo3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A4S8TxoBNmZDw8hVzsPmnh7e+udfHsAU2HX44d5npdM=;
 b=Mf2oymB1CJgmNuEHbC3aPK4KuF5QSHSo5Ei7aAVbf9s84MybPqHLakkOYmIDVd6vOxvHIKFGHmgUZdlBR1YWdFXvCMiiehSjq9KXdBGxmNAJtn9JU5peskP1b4Ly1UvoywN2yumI3sb6DoR48kqU5ePg2qDswoJYHUC8icXAp8U3/Wo9njrDh/3S2haMs/3Rt6ZIUha1H0FCxTt4b0PTH7sf2fIJVX2gaWO8diLPk2Z7hxN9OLebx0AJEJltDqnNi+QLzt5qmDc+tWFwnOYeVdr/1ZVK/0686GAsLmrffYGF0rrJ0i+p+k8MphcqMz5yJ9qnnu720gPprxi1N0cTZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by SJ0PR11MB5893.namprd11.prod.outlook.com (2603:10b6:a03:429::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 06:05:11 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%5]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 06:05:11 +0000
Message-ID: <ddd79ed4-3312-4ac2-bc6d-b579828c280c@intel.com>
Date: Thu, 4 Jun 2026 11:35:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 7/7] drm/xe/svm: Correct memory attribute reset for
 partial unmap
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>
References: <20260406085830.1118431-1-arvind.yadav@intel.com>
 <20260406085830.1118431-8-arvind.yadav@intel.com>
 <afLieKDV/IA5Ftku@gsse-cloud1.jf.intel.com>
 <afLj4npzwjA+NRrH@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <afLj4npzwjA+NRrH@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0245.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::7) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|SJ0PR11MB5893:EE_
X-MS-Office365-Filtering-Correlation-Id: e304a8aa-6950-446c-5ed2-08dec1ff3c51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: g0kmVWbnUN715UN6VNxAct6XV7TtwlQY9qMTb62LnfdpZvlNA+5F7b9NoMsh4QKXXtHIr5lncK3CrY9eLazLV5CfGb7kQCXuYisfFacHKDWVD7alTMSsiUCuTB01ajXW24DazR5ussXAQM8jqEaAEMjMRpO020qJkZnKB/bOJe3sz4WjIMJudZq/BzFRZ61bcYREVR79S5BZKeIaP6s3e7jh8PEiWIITSRNV1AqaAISwGSbObCs3fJRiI6bvJeUogUp7Wk73+s5tJ4tF+UuSMt3nGoK6HUwYnIwuwAcfMcCCLOpHU5p462YiMQE9agxn7Kxes/czzEz3+Cev/9bZQYkyEe9qTDiZVMubYndDhLCsQCTRZNATFEP985EpGHTnVjN0iJwDW/Rin9cp2tQdFcFDG8I7suoO/0jz8I9W46t/rOoPHQyRiWmhLod8Ys7Hk2nb0BGZGUpQ145hOiw7NoCpVXd2IFp761V6aPHnaEh2RwR3rd5yFBGvIggjRo8QX2dDheyNs9XcxuFZ01pg5xN57bIFI9mr8iw+BhHZ1q3OsXSRszJA5YHtEO+ig6urvjHYRCiZ2ai+1G05M3HiSJPMGbAOTiR1C0DwBHfs0LNQQlha0eWcp1TV5BzndZ74awIilBE1PMMCBjKmhE0fgtTtYiMbD0a8yyHrOjTZSYuAD9xX3Cx3kvGuUtbClEpD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmNGVUwxbHhNVFFaT0tLOFpOazBYOGdvTWNNQ05Xb1JWbnB2MHlhRlpmekZY?=
 =?utf-8?B?Sm15YUZwRmpIV2JHbTRYbG5uWFRWalZHSkhmZGU2VGJyNmhGeUNmcDFFSmwy?=
 =?utf-8?B?bmpMekFiL1RqOHM3NkZOcWUxS0h3TVI4cE55b0pKbldBWGUxTjhrd25zUkdJ?=
 =?utf-8?B?RmhkUXA4ZVZXQkkwYWRyL3hNcDN5TDhQSGJCNmpjay8yTFR5U2p6OGNUa21q?=
 =?utf-8?B?NklOMmo3bmpkRlRIUmI1KzJBMWdEakFGUXhSWVRWcTZYQmJWblFNT0xVUnRB?=
 =?utf-8?B?LzBoTFErOTZLSW0yejdEb0FKMWxNL2JoZUFLc0xDT0ZhRjQ3SDZZWkFmbkll?=
 =?utf-8?B?YWRSY0RwU1E2TENVRzZ0a01xZXNTaWE2Q0ZSMHd0T2tCNDZUaUNDb1ZNQzFF?=
 =?utf-8?B?MEZOaW9HNTNXcFJGUnNnZmJPTGtoUHFuMVhPNm9OampZaEdRQkpIK1FXVWs0?=
 =?utf-8?B?VUhyanZwUm0rSzR4SUxxU0hmaDgxYkxIZHBja0RHdTZFd3FhMEZ6cnZwbW5v?=
 =?utf-8?B?bG9ldjFvRmFaM0NBSkJ1RlVZRnlFWDA0Mml6ZWFFeWxhME5ZV200OEQrZERk?=
 =?utf-8?B?ZFdQWmpuNmJ0QVYza2tMUmI3VWVzelN4enBweENXeEZHaDRhT0cya2VDTHdx?=
 =?utf-8?B?SFZOR25xRlN5OVdDejQzeWxFNUxRQ3BCeW5FVnJ5Sy9OcnROYnZvKzZIUzNB?=
 =?utf-8?B?ZTg5TStlZmh1R3dZN1dxd3hFOForMEF4YXFKR00zSFNEVGNsNGppNUlCcGpL?=
 =?utf-8?B?ZGs0b0F4Yy9WVmFhbW5jVWlqTzVlVWxZYXpjOVZ1NDV6UXlkS2Z5cFZ0REtL?=
 =?utf-8?B?Y2poNS9BOWZFbjdHTmxPYVdZai8xVHdlQm1vS3JaTjdVcHBYL3h2eVRhMEI3?=
 =?utf-8?B?aWZhbHYzVTEzS2tLb2VXY003a3FYSVQ1Y3ByMEtnSlVqMWl3WHlFWnpkQU16?=
 =?utf-8?B?ZGtqNmUxTkFFVjM2bDdtWTNpK2dhMXJDOFhKOUNvZTVRWDdHVCtDSTBTN1BK?=
 =?utf-8?B?UWt5RERaUzR1RERjeFRaWGNySHdnNGpCYmYyMVNNZXVZb3kxTjVpZEpsV2wx?=
 =?utf-8?B?OStVYVhMeUxnczZDUWk4M0VBK0ZpR1RxKzU4TjYvZHlIM3lLQllPWGErSG00?=
 =?utf-8?B?MDc4VzVOekVaQnRzZHJIaGdqdTVOWnhhWElCb2tuYWlwWjZ4MThnVWZyUnNl?=
 =?utf-8?B?dlFHd0hib2dEYm9aTStzb1BtZDQ1VFBsU2FJcVNlU0RlekZsTnlmS2RFNWJJ?=
 =?utf-8?B?OGN6YWI1SXErSGV4YnFEZC8yMnlhUkdZRW9TSi9YYVRqV0I0aW9IM2tXL2pv?=
 =?utf-8?B?RVo5bnVlQzBtNGgveGtXWVpIaDZ1L0lIWExRVm1aYVZ3QkNFd1NxOURTT1Ro?=
 =?utf-8?B?SEYxM1hLN25uaFViV3luVi9aOFd4RXVzMHZuYkExQUxIRTdiREt1VWtUd3ZO?=
 =?utf-8?B?cGFibmk1QWhncGFPSjU4YVplMEhrU0NUSkF5UHpiaUtGRkJENWdGZndhSVRN?=
 =?utf-8?B?SEhhY2F2VW5SaVlkY1M5dXdZMlVBclQ0TU0xNENlOHN4bWlacXJTMTBHbXhC?=
 =?utf-8?B?L0F5Zkh3aGRWd25vNHlTd3FJS0ppMUZudGl3SzEyZ2oyMEh1RjNraFJ0RzVL?=
 =?utf-8?B?VFVCUWcvaTZBcEQvVkVZUC91dXZnaDEyR1ExZkFQV2VyalpIcm5XOVR2NVND?=
 =?utf-8?B?VS9qNVBJdm1UdWEzOG9HQTYwWEZyYU41TjZnbFJZd2kzUG1QRG5hK0hFZ2FX?=
 =?utf-8?B?RDMrNXAwaEttK3E2Zis3QWxiOEJXbXlSVHRVUkZ4cVRzUFhuYVJQc0FGb1Fm?=
 =?utf-8?B?Qi9vTURUZ2pUdzhPQ0RhUEEvRUR1MXNpbWpqYXFSWk56Z0dJUTlIeVoxdFBw?=
 =?utf-8?B?M3Rxb2NOZmRNRE9CRzdxdUxvenptSXY3SStrclVPSkFNZDdzUnRJT25lRXBY?=
 =?utf-8?B?aGsvYjBrWnZtMHU4NE5UN3c3b3lheWVLYk9aZURGcmN5Wm1kVjlNSElIYytZ?=
 =?utf-8?B?TWt0aDNBQ3djbGNSREkwLzN2WHhxNlNKS0QzVDIvbmg2QjFmYTZsbURQaFpy?=
 =?utf-8?B?b3FublYxSkNEQzN3RmNHWG16eHNQNUs0eWxlMlFwY3EvMjdWNjdFaXlMdjBF?=
 =?utf-8?B?YWNtaXVyMGNWbStDSVZWNHFSem53NnRheVRCS3lMNEw5M3FBVTlNWEJxNldh?=
 =?utf-8?B?enlQRUEySjQ5RFJjRGIvcGZvdzhkRGt4aG4ybWYxdWwwL0tHUG5aYVlyNnJR?=
 =?utf-8?B?RDlaRkxCL2dwckYzRVpBbVpvekI1TkFFc2IrLzhwT1gxbUY5NFREbzVJWlJG?=
 =?utf-8?B?ZEFaazNGRWs3cVh1Y2RkWGhLQWdxZWVsbllLUVVRRUdVRzdlNExwdz09?=
X-Exchange-RoutingPolicyChecked: Ah3RSDS06mLjAK+ReI1cJ0JGL7GEYdYrY2cG5Fi3hqfVtXRX1NulCVjYcAg39QNhLrQ1Tuk5KF3FtoVHbljqSnFi1PBxUWz7gA8y/xY23cQkEf/cJK3irCEva9v+3UZy1o3xesLRZULhK24yp3M6PaDgGhyCpyXWZz6ORefzYN24FhE8M3yp1ajgDsaqtPHmLPlgk2TCZnFiQqGI8CWerh307y/iuhJIApmQyp4Gzdgqw3w0zDJBA5537D0Aja8qO9iFqQje9epfN+R9PvJwmRF7q7e+jXDQQ5M+iLxw/+Gia/+LA3CnXiN/KdjGHj9xNc5+TD6IQJ0hAscaN7PePA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e304a8aa-6950-446c-5ed2-08dec1ff3c51
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 06:05:10.9862 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yH8L3bNAIRSC89AtCn+NZFUYXkHVhTJWCZ6qviZVbsYj5wab6VL9kvVsJAK6hQ6Qzw+a3s3tPhs93J34QAZ6hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5893
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


On 30-04-2026 10:38, Matthew Brost wrote:
> On Wed, Apr 29, 2026 at 10:02:48PM -0700, Matthew Brost wrote:
>
> Sorry double reply...
>
>> On Mon, Apr 06, 2026 at 02:28:30PM +0530, Arvind Yadav wrote:
>>> From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>
>>> When performing a partial unmap of an SVM range, the memory attributes
>>> were being reset for the entire range instead of just the portion
>>> being unmapped. This could lead to unintended side effects and behaviour.
>>>
>>> Fix this by restricting the attribute reset to only the affected subrange
>>> that is being unmapped.
>>>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_svm.c | 56 +++++++++++++++++++++++++++----------
>>>   drivers/gpu/drm/xe/xe_svm.h | 10 +++++++
>>>   2 files changed, 52 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
>>> index 89668ada38ca..f533cddf4d2b 100644
>>> --- a/drivers/gpu/drm/xe/xe_svm.c
>>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>>> @@ -58,6 +58,8 @@ void *xe_svm_private_page_owner(struct xe_vm *vm, bool force_smem)
>>>   	return force_smem ? NULL : vm->svm.peer.owner;
>>>   }
>>>   
>>> +#define XE_SVM_ATTR_RETRY_MAX 3
>>> +
>>>   static bool xe_svm_range_in_vram(struct xe_svm_range *range)
>>>   {
>>>   	/*
>>> @@ -127,15 +129,23 @@ static void xe_svm_range_free(struct drm_gpusvm_range *range)
>>>   	kfree(range);
>>>   }
>>>   
>>> +static void xe_svm_range_set_unmapped(struct xe_svm_range *range,
>>> +				      const struct mmu_notifier_range *mmu_range)
>>> +{
>>> +	drm_gpusvm_range_set_unmapped(&range->base, mmu_range);
>>> +	if (range->base.pages.flags.partial_unmap) {
>>> +		range->partial_unmap.start = max(xe_svm_range_start(range), mmu_range->start);
>>> +		range->partial_unmap.end = min(xe_svm_range_end(range), mmu_range->end);
>>> +	}
>> Can you blindly set range->partial_unmap.start/end here? More below?


Agree, blind overwrite is not safe. This is handled under 
garbage_collector.lock, and any overlapping or adjacent ranges are 
merged together.

>>
>>> +}
>>> +
>>>   static void
>>>   xe_svm_garbage_collector_add_range(struct xe_vm *vm, struct xe_svm_range *range,
>>>   				   const struct mmu_notifier_range *mmu_range)
>>>   {
>>>   	struct xe_device *xe = vm->xe;
>>>   
>>> -	range_debug(range, "GARBAGE COLLECTOR ADD");
>> I don't think you should delete the above debug statement.


Noted, I will revert this.

>>
>>> -
>>> -	drm_gpusvm_range_set_unmapped(&range->base, mmu_range);
>>> +	xe_svm_range_set_unmapped(range, mmu_range);
>>>   
>>>   	spin_lock(&vm->svm.garbage_collector.lock);
>>>   	if (list_empty(&range->garbage_collector_link))
>>> @@ -380,9 +390,10 @@ static int xe_svm_range_set_default_attr(struct xe_vm *vm, u64 start, u64 end)
>>>   static int xe_svm_garbage_collector(struct xe_vm *vm)
>>>   {
>>>   	struct xe_svm_range *range;
>>> -	u64 range_start;
>>> -	u64 range_end;
>>> +	u64 unmap_start;
>>> +	u64 unmap_end;
>>>   	int err, ret = 0;
>>> +	int retry_count;
>>>   
>>>   	lockdep_assert_held_write(&vm->lock);
>>>   
>>> @@ -397,8 +408,13 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
>>>   		if (!range)
>>>   			break;
>>>   
>>> -		range_start = xe_svm_range_start(range);
>>> -		range_end = xe_svm_range_end(range);
>>> +		if (range->base.pages.flags.partial_unmap) {
>>> +			unmap_start = range->partial_unmap.start;
>>> +			unmap_end = range->partial_unmap.end;
>> Then here blindly use range->partial_unmap.start/end?


Agreed, It now checks that the saved partial range is valid before using 
it, otherwise it falls back to the full range.

>>
>> Matt
>>
>>> +		} else {
>>> +			unmap_start = xe_svm_range_start(range);
>>> +			unmap_end = xe_svm_range_end(range);
>>> +		}
>>>   
>>>   		list_del(&range->garbage_collector_link);
>>>   		spin_unlock(&vm->svm.garbage_collector.lock);
>>> @@ -412,13 +428,25 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
>>>   			return err;
>>>   		}
>>>   
>>> -		err = xe_svm_range_set_default_attr(vm, range_start, range_end);
>>> -		if (err) {
>>> -			if (err == -EAGAIN)
>>> -				ret = -EAGAIN;
>>> -			else
>>> -				return err;
>>> -		}
>>> +		/*
>>> +		 * Retry set_default_attr on -EAGAIN (VMA was recreated).
>>> +		 * Limit retries to prevent infinite loop.
>>> +		 */
>>> +		retry_count = 0;
>>> +
>>> +		do {
>>> +			err = xe_svm_range_set_default_attr(vm, unmap_start, unmap_end);
>>> +			if (err == -EAGAIN && ++retry_count > XE_SVM_ATTR_RETRY_MAX) {
>>> +				drm_err(&vm->xe->drm,
>>> +					"SET_ATTR retry limit exceeded for [0x%llx-0x%llx]\n",
>>> +					unmap_start, unmap_end);
>>> +				xe_vm_kill(vm, true);
>>> +				return -EIO;
>>> +			}
>>> +		} while (err == -EAGAIN);
>>> +
>>> +		if (err)
>>> +			return err;
>>>   	}
>>>   	spin_unlock(&vm->svm.garbage_collector.lock);
>>>   
>>> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
>>> index b7b8eeacf196..4651e044cf53 100644
>>> --- a/drivers/gpu/drm/xe/xe_svm.h
>>> +++ b/drivers/gpu/drm/xe/xe_svm.h
>>> @@ -46,6 +46,16 @@ struct xe_svm_range {
>>>   	 * range. Protected by GPU SVM notifier lock.
>>>   	 */
>>>   	u8 tile_invalidated;
>>> +	/**
>>> +	 * @partial_unmap: Structure to hold partial unmap range info.
>>> +	 * Valid only if partial unmap is in effect.
>>> +	 */
>>> +	struct {
>>> +		/** @start: Start address of the partial unmap range */
>>> +		u64 start;
>>> +		/** @end: End address of the partial unmap range */
>>> +		u64 end;
>>> +	} partial_unmap;
> Also it is a bit of shame to add 2 extra QWs in storage here...
>
> We likely can find some bits in drm_gpusvm_pages, drm_gpusvm_range which
> are no longer relavent after unmap to create a union with start / end.
>
> Below are two candiates which I believe after
> 'drm_gpusvm_range_set_unmapped' would be unused.
>
> 147 struct drm_gpusvm_pages {
> 148         struct drm_pagemap_addr *dma_addr;
> 149         struct drm_pagemap *dpagemap;
>
> This is micro-optimization thing so could be deferred but also perhaps
> makes sense to normalize partial unmaps now at gpusvm level.


Agreed, this can be improved.
For now, I kept the range handling explicit in xe to keep the partial 
unmap fix simple and easy to review. Using dma_addr / dpagemap as a 
union feels a bit risky since those fields are still managed by the 
generic gpusvm logic.
That said, a cleaner next step would be to handle partial unmap ranges 
at the gpusvm level, alongside the existing partial_unmap flag. Does 
that approach works?

Thanks,
Arvind

>
> Matt
>
>>>   };
>>>   
>>>   /**
>>> -- 
>>> 2.43.0
>>>
