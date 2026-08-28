Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59FD5C61DBD
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 10:16:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D4910F333;
	Fri, 28 Aug 2026 10:16:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mHWb8nYp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B6C10F333;
 Fri, 28 Aug 2026 10:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787912164; x=1819448164;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DFim3MqiTrhp5KQm/0PeIwZ7/AcxR5FTNCuAtah3nWE=;
 b=mHWb8nYpxlecYMv3WBFDfmQx/hsDKeQeQvyV7tkYAcV+R8dt8cp2/GTt
 oSyFElf/NTnCoATwfR9nAMZUvLP9f3xlHAv4CE733Z81CJrtOYRXhLgUY
 KoguBpYZ7Ep3MC/1BTFBVCHNhWQ9FhX1qjfKJuYfPYGdh1tfF90t/VPDn
 R0YQeVt2pCY0fOMR73KrwTQkGHV5Ox4NyegkLBzmMkjwyIie+UnuSw35p
 /dczs/4M83uFHuqpGQl/xuyS/amthCE1MvQzGHxgWnv+8ExxF23xdDdWF
 CTnAp+N3Aoo1GD8bdQHat9z3UdSpzPAhPq9yWhiWtAjNPckzy8AMWISGh Q==;
X-CSE-ConnectionGUID: qqfvaRDARGuJ2WLJG2TJUQ==
X-CSE-MsgGUID: JeSvpZ22QkadRlc6hX1NLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="105792603"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="105792603"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 03:16:03 -0700
X-CSE-ConnectionGUID: OsqPFBkTR1+dLl1pkSHJmQ==
X-CSE-MsgGUID: EiNydf1/TAOLivmsoOjcSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="268143849"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 03:16:04 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 03:16:03 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 28 Aug 2026 03:16:03 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.12) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 03:16:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aXFwecaeYypT7uC3C0ctY38BWCo3VdHMWDRIkiOLaFrg81Fvl0EvFCLj3muGwtQiosLXgCMrPfHyah44wl+9KxQ0/dliQ2ITzE3kVL3yyOlRkVWgAcx/1bqGc44OAVaIFS8YcA7YizBLAN51DW5FSAN2JdSVZ95QgT7nkS15PtsKSArrr7icybQb5N08BvtuH0h6xj6orzfmw8qjdkLHFMtuia1sllbOWb/MKjOvwOCqkwdSxBq1mlkTqA/XnuO/0zBNPoQZZw8fwAQoC+lMJO1feEtC1czpy0IQBtqkbb4k6u7bvCJY9eSDtNjGEeYdaU4RZikP/eJd6Fv5wjwLWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T1fwFt134drhWOm+cHKTQxVYY7Vle28ETncELd7gyF4=;
 b=X0z89RZBwuM4nA7K1Q/Luw/Zjye2lNoQoH38CClFc5Mkqodx3wST8DdI9GNkkQtVoet2UJM2QHYKz/iAX88f6MLAa0QG1NQu1IVS1O+TAPa5AoU9UfZUvH4acbb1mjyDuWX2AfvRp9GbfGR/RHRfR6VoFrYR3lGtI/hk6WAd8vcV1IReKILgy/7ubIotYwvHIkv5+1sC7Zq4Sne7UOowmedfwQgrq/dirkAPe7XD8vrMpxbGWHmAaHjLSf20t/rFpEQRrh21GR+bDxfJ65spDlkNS8KeBvnwYsV0KJEiPAEvFV9D13otkkYfAQNW6vs8W3Lr7Xm9oMsWSJWALoQQKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by SA2PR11MB5081.namprd11.prod.outlook.com (2603:10b6:806:118::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 10:15:59 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 10:15:59 +0000
Message-ID: <23a0819e-35b9-4061-ba87-288601f9fbeb@intel.com>
Date: Fri, 28 Aug 2026 15:45:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/i915/display: Add command line param for DC balance
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, <ankit.k.nautiyal@intel.com>
References: <20260828085037.1430881-1-mitulkumar.ajitkumar.golani@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260828085037.1430881-1-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0229.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::9) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|SA2PR11MB5081:EE_
X-MS-Office365-Filtering-Correlation-Id: 114fca38-e6a9-46ed-e863-08df04ed5b07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 8sms688hvmL8KGpDy2pZtdBt8lczaIaneAAzpqyNZC2COueD9tF0N9WPYub+5/dTeIVPa00mCFxbrrtI3MGPMHre/rRcLR0Axvfx2RjHOp7hBNAmRAQO4AG1r4w5ka0Ijm+CLYfmAr2gPcrqXCKDtgG0ZPZ/LYJxWllnFfqc3FuhIhAfi0vdCO3SnZIfO/Gx71uhHrhaNgGKqOLSNLNE8aSqPVqXHNEh4dvKKKr224NlgSAoenZC6iMrlDbdhyAdEqP08Y0Drgj5kXxTLOnIn+tztal38hUakmjcxHkUx9bF+IGH6VRGpN7VNiHVJpddscRKgbV4rI73kH5lFlSJCYyjaJlAJzwnZtiki0wlW9VtQUKUS86LnwoTcHC+PwJazUL3vELYKedMZZ83GXQtb5IN8/w/Cb/uwbRR5nAIeqafWj4CpZr759+ykbar0G+ZGFDvgtR6S8nlP0TVf0Vvr7R+5MJjL15QClSJamz8F44g1Y9zDuJG8uausAdt5ZDkKTkkqmDCa2zo+9qgf+ks4UoO7iIGFZ864GNWYN3VVUU+jWDlnVns6ScAp9kSuJ0FEcDFYUzLySrW8WOkxLivnQkfN+9qb+UfQ2vCk3JZ4/m19c+V/KV4sV91imMOpejHfbsfg9CwKyAtk3nXaahHZS920+X1OqTPqSNxJ/u3mdY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a085VkZ2YWhZNDQ2RVozb0s2RU1sVEdvRXVkY0Uzb09NejcyUURoWGUxWW5k?=
 =?utf-8?B?QnBubGZxdDBjd2w5dllHa0hJNzByTmp2cXcvTWZ2S3dFVzdUN2xpS1dXK1Z5?=
 =?utf-8?B?UnVmZUtLeWErRTlFWXJPdUIzQVlmd2tvN1NYT21pZHFIK09zZVVhYU9xbTJE?=
 =?utf-8?B?ckY3NGxVN2RBbE1LU1NNekdqcnAzUWlpSUwwTDQ2Z1lsZ2o0WHFaUlREK0ts?=
 =?utf-8?B?NEQ2UWhoVWdldWRYVzVVNWxBK0IyNE9LM3JLQ01hM2ZiNEpwdHQyRllpaDRM?=
 =?utf-8?B?d3F2Vm1aelJlV2swSWk3TzlOdFNLYUY2bWM5dGZrUjBFKzB1ZlVTa0IxNkND?=
 =?utf-8?B?TmNaL1NxYW9aa01YdEQreHhQZTJYN0lndkhMTTArV28wdXFORi8zWmhLSlJu?=
 =?utf-8?B?ZXBkNVUzem1RMThTWlJaTXZRWktadWEveGxaSituV3grcjRmQzFkci9qWXM2?=
 =?utf-8?B?QnM3bWRjVis5RWRVYW53em80RXMrWFN1NFVyNDFqTWlrM0hMcGduRHlHOTFi?=
 =?utf-8?B?ZGZKTGhGN0FkWWk5RHBycjhScUZZUWtUOGhEdThheUVPdHBGQmhnZWtEdk42?=
 =?utf-8?B?TEhSYUtIczZTZzdweGNyVzlPWENBSTZmRFh6VDExZTRaZWo2MVdWdTVJa0NG?=
 =?utf-8?B?QkpWTDNUcDRFVkp3a1d6YWFRZzRPampTZnc4dm1oSVhoM1hxSk5ZblY3YXNW?=
 =?utf-8?B?UjVrOW9NYnNtVEdjOXhYSE1mZFlJZVFWaVYzdFppVThVd2Zqb1dEanB2RmFj?=
 =?utf-8?B?MnZwMVJDVElIb1dBbytSUWJsenEvQ09NNXVxMlRJTm1wNUpWNCthanlqbFpo?=
 =?utf-8?B?aGQxckVVV3EySkhvclphK0Z2eVNma0J1RnBZYkxqNnZoWGRLYlN3N1NLbTBp?=
 =?utf-8?B?NGlzd0pPUVhRTjRXWmIzTnZZbDNGZkZHeEtMWGJyMDVwYjcva0JOOW9GbW1V?=
 =?utf-8?B?OUxZZ2Y5bll2SHJLV0lzYlpDSmtuMkRyTzZkTGU4ZURFcy9jbE9kVGVia2Qr?=
 =?utf-8?B?MUxCZDFaTmx6QVJaVGtXaVJlSnhSblRWbVZ5anFWbXpIdVpCbGExc2ROckVJ?=
 =?utf-8?B?cWJYdHZxZS9QcjZpVUpPVThNNjdQVlhSdk5zMkg4TzVNOWVFU3ZKRldENW96?=
 =?utf-8?B?WmUyVEI4SWMvKzV3MjdOWG9FZHRHUzk0RTg4U1IyQUI2UU9iMGd6RG1ra092?=
 =?utf-8?B?RUN1UzAvTHFXSkFuVFUrbXBXV1N1SU9mVDA3WENuWDlBMjhHa3NPcVhDTVJs?=
 =?utf-8?B?dlJrWWpYd3Rzc0tJMEd3dzJmWUg2d0VMS21lTkhxZEluZThVdGY0SjBOZmdQ?=
 =?utf-8?B?YVhhSXBxYXN1ZmRQS0x2WWFXVlMrTS9EV29IN2N0NVYrVnIxdDNBTm4yMW9a?=
 =?utf-8?B?elNSWVpVVkVFSjVJOHVhOE5FYUk0NThMclhzcWlMVlNJdkc2RnljNmhsbXpU?=
 =?utf-8?B?MnFmcGgvdm9YVDI2NElZMTNobFFrMFFvOWNTZ2xZV2k2V1RzZUFlV3lVbm9x?=
 =?utf-8?B?d0k5N3hEUEs5YVB0VHlMUEd5bFR3MEQvWmJncEFZUE9seS9aYVlLb0VLQnli?=
 =?utf-8?B?cHdWdFVZd1RTYUVuYnRseHo0amJlQ0VOaHRpMU5sWmg0SDEvNmcrSDRQTU4x?=
 =?utf-8?B?MVZSZnRYd1JjQlBsYUV2bUc3Z2pZWHYwRUtVRG0xbUZJeTdZYXhxc0toOUxi?=
 =?utf-8?B?QitweW9nbXFDVmhlZGlic0J6dGN6YSs2MDkyYjU5dHk4Ky9wcFpGNU9UekJO?=
 =?utf-8?B?ZVFCR1pEb3ZaeWM1b3ZhL3FxUHMzMGRWaW5OV0FicXQ5V2tUWlhMME8vODFP?=
 =?utf-8?B?Q3NlTkJyenFpV3NEZ0E4SzgrVEE4VVBLVFRXSjNyc3JXSEk5WFk5OFh4NXA5?=
 =?utf-8?B?T3ppMXZLZnlyTEtORlJpNUNMYTloVGw0K0Y2M1JLeEVuVVVnQ3pNM2VLczlQ?=
 =?utf-8?B?WGRGZWN2Y3JYdUhBK3E3T3Bka3RBbzM1ZHlpeVg2ZkZaYWpObFhMWU5lbWtB?=
 =?utf-8?B?Y213SFg3N3ExVjZRcFJqLzhuMGtaLzU5MVFDakZmNmUrWU9Uc3BLWkQ3SUVz?=
 =?utf-8?B?Qnh4Z0tNYU8rODk2RHJmekQxMzhsV3FZTlYyRGRlTmdReVVoN2lNTlpjdUVD?=
 =?utf-8?B?OVVSL0crZXYxV25BSTN0YjRybm1pWW40dWx4N1hKR0hwMVpiU3o5KzY2d1B6?=
 =?utf-8?B?eUhXQjg2S2Q1SjlKNmZLMWRGTElHUTQwTVpCdC9oNVowS0g5cU9ISzhoaDU5?=
 =?utf-8?B?YlBWSmgxNk85ZS9LQm8vTU92RFk3ZjJhOVl1OHFWeGhhb0JJcjNjM29mQStq?=
 =?utf-8?B?NWEwaXFQMjlxZG15THB1czltMVNNV3JKdzhxaEthOURNK01JZk5XQlgvenpJ?=
 =?utf-8?Q?0Nqf8MDa5OmTNMYU=3D?=
X-Exchange-RoutingPolicyChecked: uYAhwdvRfReenEiRJZlDDH79OAr5Njd3Eta5IHW/jp4/n6fzEC8EqzJdyTNGlFndylsa7pHmy4w1gtYexYTIH0o2UXMgrXMrP1P7or9P0VpE4+nFLvJ4vY6I0zooE5fjujaaPFdeq7yPuVfjlT75kj6gJ2jvSgvdQa6TKJlbMsv4UzgVpkEhO7JxlQ5MTF2AmQrU+k2MrkjkXR/tU1ugCPQpCD6bcl/exS6Xo0OeqGTjvvB0JDPuvKqy6rrcWK3pBIQx2zKnJBkzQy/U8EWZPQSbbtvneafKPo2FKIE1NI0Y7bAA7g1zJPOY8jATmOOddw6dWjGDBVsVqnCjnyQlzQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 114fca38-e6a9-46ed-e863-08df04ed5b07
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 10:15:59.4473 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dsu5YUW5ozRUNZoVsg4yG9fIB6aICNj9x/+qzqVdUJ83LHIgy3h0HwIgN9LD7rzoK3LG9DXV65VToH2/PeOT+j6rSeKmHAXKdrzbuPe9it8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5081
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



On 8/28/2026 2:20 PM, Mitul Golani wrote:
> Add a new module parameter 'enable_dc_balance' to allow enabling or
> disabling the VRR DC balance feature at runtime. The DC balance
> computation in intel_vrr_dc_balance_compute_config() now honours this
> parameter, so the feature can be toggled without recompiling.
> 
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_display_params.c | 3 +++
>   drivers/gpu/drm/i915/display/intel_display_params.h | 1 +
>   drivers/gpu/drm/i915/display/intel_vrr.c            | 4 +++-
>   3 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_params.c b/drivers/gpu/drm/i915/display/intel_display_params.c
> index 2aed110c5b09..ed3aa84c5d43 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_params.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_params.c
> @@ -120,6 +120,9 @@ intel_display_param_named_unsafe(enable_psr, int, 0400,
>   	"(0=disabled, 1=enable up to PSR1, 2=enable up to PSR2) "
>   	"Default: -1 (use per-chip default)");
>   
> +intel_display_param_named_unsafe(enable_dc_balance, int, 0400,
> +	"Enable DC Balance (0=disabled, 1=enable). Default: 1 (use per-chip default)");
> +
>   intel_display_param_named_unsafe(enable_panel_replay, int, 0400,
>   	"Enable Panel Replay (0=disabled, 1=enabled). Default: -1 (use per-chip default)");
>   
> diff --git a/drivers/gpu/drm/i915/display/intel_display_params.h b/drivers/gpu/drm/i915/display/intel_display_params.h
> index b95ecf728daa..8c28c27e2c46 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_params.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_params.h
> @@ -46,6 +46,7 @@ struct drm_printer;
>   	param(bool, enable_dp_mst, true, 0600) \
>   	param(int, enable_fbc, -1, 0600) \
>   	param(int, enable_psr, -1, 0600) \
> +	param(int, enable_dc_balance, false, 0600) \

You mean true?

>   	param(int, enable_panel_replay, -1, 0600) \
>   	param(bool, psr_safest_params, false, 0400) \
>   	param(bool, enable_psr2_sel_fetch, true, 0400) \
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index e36db1174440..1698c54e258b 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -439,10 +439,12 @@ static bool intel_vrr_dc_balance_possible(const struct intel_crtc_state *crtc_st
>   static void
>   intel_vrr_dc_balance_compute_config(struct intel_crtc_state *crtc_state)
>   {
> +	struct intel_display *display = to_intel_display(crtc_state);
>   	int guardband_usec, adjustment_usec;
>   	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
>   
> -	if (!intel_vrr_dc_balance_possible(crtc_state) || !crtc_state->vrr.enable)
> +	if (!intel_vrr_dc_balance_possible(crtc_state) ||
> +	    !crtc_state->vrr.enable || !display->params.enable_dc_balance)
>   		return;
>   
>   	crtc_state->vrr.dc_balance.vmax = crtc_state->vrr.vmax;

