Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55891CDB479
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jun 2026 16:16:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D251B10E0A7;
	Wed, 24 Jun 2026 16:16:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ICBTdcO4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A18F10E0A7
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jun 2026 16:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782317795; x=1813853795;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NK7GvcSPiwA5xKgrM8OCIlYF0jTLo7g2M/Y+DtifErw=;
 b=ICBTdcO46LSj7pAQxh/f5c4uIdMrg6gzmQ0cDl48izbVrdkCSO2v1+Oy
 tXuGfQK5OSAM918NvSdqbtEoXWfrB1Xk+Vr/6u8r+w/ITwJHup3jsozVA
 k+TiEJRE2jNDXJlwe/wy5jd+zCnEjpWJAA+CanK/gNV0U+KREu59hcRCu
 JbcsfzzLAuGPDIznjGWDmaWx0Lh9SbBgknsmP5tobrhUJM6nSWpqdL00s
 93TMxJUcQkNLKr7rmDhLh8chyYuoX1SqyPaKjtCjhOYPDW9gb8cLL12Oq
 GU2xRriVQWbzWEaFR+MrzONNA1POOPlGd2//6UdXVFiQj/JxaI/TUmQzw w==;
X-CSE-ConnectionGUID: +cQlNU+HTDu1S927+lIWzg==
X-CSE-MsgGUID: sC0AKGBKQUWF4eY7r57FZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="108632958"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="108632958"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 09:16:34 -0700
X-CSE-ConnectionGUID: +r0BS/dzTD6luHTPpcvciQ==
X-CSE-MsgGUID: MPgqz/f6T3il36D5sfddOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="246994526"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 09:16:34 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 09:16:34 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 09:16:34 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.11) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 09:16:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LZoygp1BMPVV0xKBj8RNDm7pF6kPFPCmZlJEoB2frEJ8UxrVF3eMBTQKaII4IF8jP0hNxvxqnKsOLb9Li8a3P3qkAftarmto3Jo8mY1pSoNOVUqfAzo5pPP4BLorbBg9zyMy8f0CJPNuCHT2MFkReJr7rqxbMYlizOrj2rkcI/sps2R6WDvr9VKA7Dg4SSJeWgFQSNOqYsFlqdg1/N1jbU1q0wdaMQ4NjLxzSUViBBA1i5sS9ev//T/pUCQN+iKhu0a2kb7BDUjuIexsxAjLwYNuFdgZZDfqZNOVL8/N6GQWpahBobFoyn5uZfigLIZodN+p6Mb4j3iH4K0ZBNV/qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I1jfAgLXY9Sqs/wCVc92JCs8O3ZPTkSezN77ecjhvo0=;
 b=PLK6jYssaRrkhm1BCr9zjMRfM9JocPbvIXJKveHJeF3GOGeLE/6nhKO7G89HY1n7aD5R2KGufgRD1Iv3GRkHkc4BQiuo11wfVvBjidIjOjpjaoMwIzOghpnyXI5f4X4xVbS5PsPYjrIlY6EEAdR+YoLKvskuA6Hz88tKaYhDl2NDswXDAeci1tpCLCUu9JcuHCySmIb5sh/IJruhe1a3iiKKZyCvbivyThPEz1hnQEYgUwCVZ8FTF89+6/Ld5MiVK83/dyvjXLhTvUoXyl4WyIIPmnwEtl25Kuo7rYTucfkFOeDtSWJlV9xmC7Un8j/PGt1XNQRJkawbmysTcefvTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by LV3PR11MB8506.namprd11.prod.outlook.com (2603:10b6:408:1bb::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Wed, 24 Jun
 2026 16:16:25 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0159.012; Wed, 24 Jun 2026
 16:16:25 +0000
Message-ID: <15152125-aed3-4066-b4d5-aaabc807cf39@intel.com>
Date: Wed, 24 Jun 2026 21:46:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 3/3] drm/xe: use XE_RAS_WEDGED macro in
 xe_device_declare_wedged
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>
References: <20260617104711.79646-5-mallesh.koujalagi@intel.com>
 <20260617104711.79646-8-mallesh.koujalagi@intel.com>
 <8309b56e-19cb-4464-a72f-37f748b1d4cd@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <8309b56e-19cb-4464-a72f-37f748b1d4cd@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0097.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::14) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|LV3PR11MB8506:EE_
X-MS-Office365-Filtering-Correlation-Id: 48438ee1-72f5-4309-aac2-08ded20bf082
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|13003099007|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: GGf/SKIZYneg6Yv6Kp6vVaraLrkizfI+6HWAUNsPHOHaBvBpj9od2ISroXtY3abK0zhfDTNiXsbWAHD9e5CQj1BRRcVyOsQh/qRsJ3Vh6gmbPXZDBtREUxU7YErOUHKnEjbrpfXSOvxS9aP3yGIaQsYedFA6bsXdn721X7fk74Tf5wL8ONURoufn7P368IGVqqrj4JZx1cPqWvOCmDRQ0Ly67Nue4PNOKt8BkZDAUl/XXgbdjugfvnAVMyLXQKdeVpTpr4T17m9y4VtZn+mF6pcRfDPGmHAR8BCGxahPIgHFi+ifwZ4mOgq3ts9Ql8ePi29yCYsYXRVJ3ZA8RqzeOMPXUdRrm5P1KWE0/JALqtup9GIqWuJwsvrsqTJBMZqgkQvFncG1H3d0NMd9oXh3ehlbt9ZgdpoLOS15JBEPgbVkArQBwLDsav14U3x1Bc57nHDVmpiXU5clTy3LH+GfjsmP3Di0hFkS6WpoGNShZDnIcbOJfjsdADA3gxrMly4nHsPgHhHpRmE7IGl4VLZg6XGGYM0xkXADgSLAyuMjF2kRi68yZzxBOdNWDAkz9ZZ+jtBT2zDHlHgTI75+lxkyqTN7bsBxqMCWXMDfgi7/XIYQFAC9TFWSdRDlC893+gRF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(13003099007)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVpMc2xaOEVsZTJBa3laVWMvSEdwcHl0VGRWYzZ4RjFudmladkU2YnBwMzRj?=
 =?utf-8?B?dnVGcHRUZVFZUTJBT3pjbURVY3VyVUhnRXlkQkFIczZrRGRCa2FML3VNNU95?=
 =?utf-8?B?M2dXTk95TXA3czZxcVVWejU0M1RJYk5oVVZCeGlMV294SFBOZjZFYU5DQ1Zl?=
 =?utf-8?B?SUl2Yy9nWm4rWGNKdGVJSTA1R3lKaWZxbEVKRjNGb3IyR21oMHpnbHdGSjN0?=
 =?utf-8?B?cWp2c1V6OTgvTUxkR0VpV1Q0Zk5oRmxNTUpwRzFnOUs5M0dkTGlQSC81d2dH?=
 =?utf-8?B?Mmg3R3VHaldtQ2Y4dDdlZWJFWUVDNk0yME4wcVpYQ29jUmVYbVplUlJHa0lC?=
 =?utf-8?B?Smc5a3g0amZNU0xGc25Qd21JN2d5N3hFOXpOU3FHbFhZa2x3S3VPYmMwZ1p5?=
 =?utf-8?B?RDhOdkE2dmF4SGhYZ2dQOHpNU3d5dzVNZkVpVXRnRWpDWkgvRm8vcFdaSXAr?=
 =?utf-8?B?N1hTclpyVGFCdk5laUlnMk4vd2RodC83cElnaW1vMUJwQ3AvdU1xL3BrYVVy?=
 =?utf-8?B?MmdzUCtzdE9KZXR6TXBPb2d1RGVJTVBLZ1YzUURuRFVZS2QxWEptc1RVUnIy?=
 =?utf-8?B?SGhoWTBFZ0tzbjhwcEJBQ0hPWk9Rc1o2VkQ3Lzh2SE5BRUlQUlF0VllpVXVS?=
 =?utf-8?B?NmFuVEdiZzNZRmR3MFB3RGVlNklEaXl5U3ZZMVg2WXI0dVlPZW43K3hwU21Q?=
 =?utf-8?B?WFF6S2diWEFoQnhmY1o2RkFoVVY5U3A4UHYya0xibWJDYU1qTDZpSlBackFa?=
 =?utf-8?B?UUNBSkJNUWNDczV1ejN0VjJLTmZHRUhEd0Zla2dTNHhBdUVybzFXcVo1MTJ1?=
 =?utf-8?B?VlVqSGxEdmFZek5JZmdQbWk5dlVjc3dBSmtHQjQ1YStlV3ZGVXJKa2NiUDNa?=
 =?utf-8?B?cHp0cWZ1WVRqQ2pwbFM1Vjd1WXE1R2VNaDA5cmk3WUdOZ3d4bDZRSnFLcjdq?=
 =?utf-8?B?dmhBKzhFVDF6QVRxSDdYSjYwKzJuYktsYmc4WElCU05MLzdRcXZ0ZEYzaGpR?=
 =?utf-8?B?VnE4Tm16UHNGaHpKNm92cWhCeW1jczlHeWJpTG91cm5VWXhDN1kxdlNteGRI?=
 =?utf-8?B?ajRCSDA0YytFNVdiU3ZSY3YwVllnVGxnTnR1ZE04MDhBTkZUR2d1WmZlcHB4?=
 =?utf-8?B?b2l1Y0ZqaWcyU3pyMGlodzRXVDdDTTk2aEV0TlgzUklCNEthUWFYVmsvWTRS?=
 =?utf-8?B?UG5DZjg4VE1QRlhLYUdzRUZuWktLNFNDNTFtdDlkL1B6Yjl5RlZ1VEJqQzl3?=
 =?utf-8?B?VytHbFpGMlMwcHBqblBBalZQemw4dlZ3UzBLMU1sTEZRNkh2WVdSQ3QyMk5C?=
 =?utf-8?B?bWRCd3UzMStSOTZoZEs5dExwWVQvYzRqOVV6VE8xSUVibUJ5Y1V0WWRjaDZu?=
 =?utf-8?B?MW04dEk1L3JYeUNocDdJVXBlbVhUbS85SEVPUzRwdzlGd082S1E2aFI3WllY?=
 =?utf-8?B?djhldVYvR0M4NFF6UGQvRGtnOVAvbENlZGV0Y2pVZUUzb202dTF3M2dxVFRM?=
 =?utf-8?B?QjJBQzY5OXRtajlrc1Z0NGlldnRkZ3BKUVRlM0xqUDgwRlJjTWpIN0hGZEt2?=
 =?utf-8?B?OStnZ1NpZUcydmEvL3FIcjRLSGFnYlk5RXlhUmtNczdnQ0FkY0k4cXcvZTR3?=
 =?utf-8?B?NnI0R2NDZWpLQkdZOUhQNzV6d3FVakhPVWd0QmF3MWFGT1p0K1V5bWdLVzFt?=
 =?utf-8?B?ZG5ySTNWNC9ZcDR0WCtCQ3lMVjVBcnJRZ1hzOHJQL2tKL1czUDNxdElUWnN0?=
 =?utf-8?B?USs1aDRrcHgyK25RK2ZYSmcydmNPZFV0M0pJOXV2a0R4cFErVHgwUkpRaGg1?=
 =?utf-8?B?ME44M2FRZFZCUk5vdFFjWmtubEpZbnp1ZWx2cmxxVGhMeFpEWVlhNjY2c1VR?=
 =?utf-8?B?SWFWbUp5eDJMZU5seEpWQ2h0ZVF6eU9IWUkwcnFHSm8wYWt5VEQ2elh6QjZD?=
 =?utf-8?B?c1RNYXlNQlAxbnRlRjYrUXM3aC9rbFVrMXJlMkVLRTh3TWVvUVVhTjVBaStP?=
 =?utf-8?B?a0U1NjIrRk52ZUhzY1RldWdvTDNoaFJyZnVjaGVzZWRJSnVVVWFQNkc4Nm5I?=
 =?utf-8?B?MFg2WjNOYnlndFNRelByK2VHYW9pc0d1SFBiRW01YlVvaDJYaENIZEVrU0xY?=
 =?utf-8?B?Zys5bEpBYWljNm5Pc1RWTDhsS1AyNUpXTE90Mk41QnE2TFJrWGlXRlNZZnc0?=
 =?utf-8?B?dVd0SEYrUk11emdka1lxVDQyNFlvUXUwcGFGZDNhbytGYjJFTGQ3Y1dwUnFC?=
 =?utf-8?B?bHVQeEhLeG4zNWNyRzRNNlBjTXBKTkJPWVMwUjJ0NndGZDhtTFJrQ25tc2ti?=
 =?utf-8?B?VkJDSGFsTDF0UmpncGRHRzVkY0d3dUVmSm9kNmhUUEdhbWhPYTZYSm1xWFk2?=
 =?utf-8?Q?OKH9rQ4RfDuwWF4Q=3D?=
X-Exchange-RoutingPolicyChecked: eqmrqr7mL5v8OpdybtoHyHV3TdVKJEaKcwshO7E54sAlIN6XvV+2P48nu+uYZbeFE7cI50qcyftxKn91UajOEXg8Nlg3gzh1maqh9XU1Wbl2Ss/sFp2keh1yPjkqe7HztvgDA6OFTndqag8UVq3AcKCZC/p7+wMpe6dfg7qFjafKIy1ceR0QGGOOJBqADafQk0dX9+uw/czyFpl9sKePcXviHKH+IrxM584IMHJm0UyXWZwQfjK9eYHxqo/ykbDT86Sg+fMdG+1NAywqHSAYmlkaDIch7Ksktw4KpKLkDnLIbcpuDdjYO7wPdQHvauWvZt4c80AFeFGOIGCYmLvNUA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 48438ee1-72f5-4309-aac2-08ded20bf082
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 16:16:25.6574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0iecl1/0USaHrIYqX5jyP9HX5rGrP3j0AqRpyAVy/cefEMST9lzzUdCwhl2sH/jSou+MO6PaK/Fg+IWWcHiUBbETK6KM7wiXr4DIXojMmD0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8506
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


On 21-06-2026 01:09 am, Michal Wajdeczko wrote:
>
> On 6/17/2026 12:47 PM, Mallesh Koujalagi wrote:
>> Replace the open-coded drm_err() call with XE_RAS_WEDGED()
>> macro so that wedge events are reported through the unified
>> RAS/SIG logging path with a consistent format, CPER severity,
>> and errno.
>>
>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> ---
>> v2:
>> - Rebase.
>>
>> v3:
>> - Update message in xe_ras_log_wedged().
>> ---
>>   drivers/gpu/drm/xe/xe_device.c | 13 +++++++------
>>   1 file changed, 7 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 089872507bdd..8284578b9156 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -61,6 +61,7 @@
>>   #include "xe_psmi.h"
>>   #include "xe_pxp.h"
>>   #include "xe_query.h"
>> +#include "xe_ras_log.h"
>>   #include "xe_shrinker.h"
>>   #include "xe_soc_remapper.h"
>>   #include "xe_survivability_mode.h"
>> @@ -1424,12 +1425,12 @@ void xe_device_declare_wedged(struct xe_device *xe)
>>   	if (!atomic_xchg(&xe->wedged.flag, 1)) {
>>   		xe->needs_flr_on_fini = true;
>>   		xe_pm_runtime_get_noresume(xe);
>> -		drm_err(&xe->drm,
>> -			"CRITICAL: Xe has declared device %s as wedged.\n"
>> -			"IOCTLs and executions are blocked.\n"
>> -			"For recovery procedure, refer to https://docs.kernel.org/gpu/drm-uapi.html#device-wedging\n"
>> -			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
>> -			dev_name(xe->drm.dev));
>> +		xe_ras_log_wedged(xe, -EIO,
> who really cares about the errno if machine will only look at class and severity?
We need errno to encode the driver-side failure and same stuff need to 
update in cper/tracefs.
>
> if relevant for deep-dive analysis, it should be printed as part of the regular message
Yes, we need to print details since device is declared as wedged.
>
>> +				  "CRITICAL: Xe has declared device %s as wedged.\n"
> hmm, so now we will have all this in one log line:
>
> 	*ERROR*
> 	[xe-err]
> 	Severity = FATAL
> 	CRITICAL:
>
> and full message like:
>
> 	<3> [0.028976] xe 0000:03:00.0: [drm] *ERROR* [xe-err] SIG_ID = 2 Severity = FATAL Location = device Errno = -5  Xe driver declared device 0000:03:00.0 as wedged. ...
Yes, Arch team is inline with that format.
>
>> +				  "IOCTLs and executions are blocked.\n"
>> +				  "For recovery procedure, refer to https://docs.kernel.org/gpu/drm-uapi.html#device-wedging\n"
>> +				  "Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
>> +				  dev_name(xe->drm.dev));
> compare with:
>
> 	xe_err_fatal(xe, WEDGED, "Xe driver declared device as wedged. ...")
> and
> 	<3> [0.028976] xe 0000:03:00.0: [drm] *ERROR* [WEDGED] *FATAL* Xe driver declared device as wedged.
>
Since macro is based on severity what happen when we have PROBE has 
different severity? so we defined macro based on component.

Thanks,

-/Mallesh

>>   	}
>>   
>>   	for_each_gt(gt, xe, id)
