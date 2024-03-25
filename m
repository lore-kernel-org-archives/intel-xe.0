Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1CA6CD11DD
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 04:15:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 263E810E585;
	Mon, 25 Mar 2024 04:15:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G4ahUt2Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BCC710E585
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 04:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711340127; x=1742876127;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=9MfLnHOdd9gHL7AND9m8qIZR+TOOuBV3GEkaEhblJso=;
 b=G4ahUt2YQBk2wNbR+IdYaoqkwquzY0aI5tD/3ySGlRRIdouuepyIMRVO
 EfV+9r5sFgwvpuNnBcfNCqHURwns+pjAIRuCgBYB/2cvYHpL61xyDltw+
 E5mmWaUnwUl5VXSIKMe6mnNFmrNJNXW25dDPUFjc6X1Rd8G4/FnMTBgF4
 aF3T1LS0SX6YBHZKM1lrCI1Cf9+i7eg21esYIJ8icDyOUXGqhmn7YmI9u
 DYr3KzwYfMhgh9n1Cvuqr9oMItkcH5sLEM7X3uANYlVT5Yqi+0jm0l5IU
 K5x2jAyy+F5QMRaiUbP/Z5M61rwOsOZHNStHK4ClIA/C98L2LsID2zHIR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6152905"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; d="scan'208,217";a="6152905"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2024 21:15:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; d="scan'208,217";a="15924653"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Mar 2024 21:15:26 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 24 Mar 2024 21:15:25 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 24 Mar 2024 21:15:25 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 24 Mar 2024 21:15:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eAypK3mJm5k2tIBIX3FVsHE7q+dowxGBNnjumHt6H/VXhxkbKy5s1RE8TSe6iK0rMVCgQ5QDpjlWhvUmeAOJTmdcT6Mxf1D9SSUz9USHN4xn9KooHfIIZ9zlXA8Qudvfb4yo+auiB2jqoWuiXaIvnRhT6KgMxvpQzvEJ5OMbn8gw1L1IzxbR/3wWre2y4w6JIkV9sAHQSk4ficv494MCQWNMO9GZavj71Gd1MR6F7TSGsy+z04q9l1XLNAXOjkhmHViNWOWH112HoMwd6X5j6c1xjTq/8+J96Qi9s491kcp7CqhywoEwiUiDgYkhJYd2lH1eifpFMZBWsq8wkfbeBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t+G4iqC0YjrZ0VvPwi61Hn6Qgj/LcJsRI0Y/N7LBWOI=;
 b=Tqq0KmnIaFy/AsttMWO76IX+F1NWISpfcATxTl/jFHJjeNjcd1bIEX4gzk+t7So9ertcFJwRX0sJOmLnllJTuJ1+v7hrWtsDbW76xU0WQ7P6H7hJl9Xg9aeS+IDNO3TB6Sb3vsIHEXPm1MCKeQLu22xtKfWyozMcx6rFhN7PhSo6tEwLQpeSnVcyiSxRKJbvTDGMZEusw16+eDR/9BW+1BRlmKS8+45S6saeNZobgtTzBVK5HJf7qYjn8oLx/ook6QjOE/VCKhJhSb6EcO7Sb95FIBJ3ytwi45iAPAJo2a5nnO7xNShPOn2ctmS/aCIrMIyZL4uOl1yuMvdy4KFjNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by MN0PR11MB6157.namprd11.prod.outlook.com (2603:10b6:208:3cb::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 04:15:23 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a%7]) with mapi id 15.20.7409.028; Mon, 25 Mar 2024
 04:15:23 +0000
Content-Type: multipart/alternative;
 boundary="------------sUQF48uh0RqwVnEZ3n2ihk1a"
Message-ID: <263c52ef-7bb0-456d-b0b6-a5cbfcb2d714@intel.com>
Date: Mon, 25 Mar 2024 09:45:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe_migrate: Fix potential overflows expression
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20240320101835.3266429-1-himal.prasad.ghimiray@intel.com>
 <ZftN0eDAtRN1YnsG@intel.com> <2bb36b66-8931-4adc-9f94-5e37958a5f25@intel.com>
 <Zf3d8niX22_zfvZy@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <Zf3d8niX22_zfvZy@intel.com>
X-ClientProxiedBy: PN2PR01CA0185.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::12) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|MN0PR11MB6157:EE_
X-MS-Office365-Filtering-Correlation-Id: b0fe519f-0e12-4d52-8059-08dc4c8230f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PjtkpKhZfLgMTcp2FCENXnI73liwYl0hOE8iZec1Q1VttPjdBhaDkapniRT6vYaaKOCYnxMWj/4o+GFWrjj0dvnGPWrN+3CvnOD+7UpZQ8qv6NodrYQivL5H5VtpKw9i0B9Q3e7dXTTUsWJ5wzWv1kIywE/epIH1NmSqjvO1lZDtGZ2bIrd4GNS83FHi5LkQlHd3UUabJ/uth9j0iXwaSLdQ+7xmaO6Q5WFUhwA3YpXA/904/xJoFQ39uFFd2qpmZp5mQMvv1pGsD4eTV8B26WD/hqq+u54sJFzoydlRXOSLInwto97qee5xwsjW0v2AemEH8fOyE7G5F7m5vDH2wzlurb59FIWYBs/moF0TEgKWb0KOeSONnrNCepIullpxA+ZAygXr1QQSFlzW//vOD+KDstWIOTindWYvkuG/Z6GP0lS4vWX8Nf016JtKOJZkJm1lkVzwClg31TUO8C/i59UekjN2Dc6wf/ynA4EX3rZ6StOsuztJNARFwhUKCcXorx+4CCrkRR6MKjAfYA/mTXsqQEOQ+8WV6orbSX0lONOSYm9PWCDSXUnjp3VdQxR2CnYM2BDS2B7xiYCj6wHu+e7HUrOjXV0rgYRIWaVG/ZbAT8x2J3+AFgw9vE7POz8rM1ORivj5WS7+nb6RfykCfiA1azQTS996ZKNtA+Xz+zA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUovVGh4RUR6bEtPZ0g5QWVhTG5NMmtkLzZKb20zSHJ6dDVnanowUW1rOGNm?=
 =?utf-8?B?Mlh2WEYyZVZ0amlLeG9UblNBelFQK1R2Y3RqalRLVk1uRHkyTnJQUmQ2QVNE?=
 =?utf-8?B?VmRnTEtjTzJKclMwNWM1TExIcG9vMUp6VU1TY2ZQOEhUbmV6dGxqaWNoRnBO?=
 =?utf-8?B?d2tVUE9FNWJGRWM5WVUydGJ2L1M1ejFOMFRhWURVZkxJcDV5WEQxZmxvUC9I?=
 =?utf-8?B?QmpzMFVwSDVrbi9laDc1ZHo5cEowYVF2Y3pCU1h0NEVPRjEvYXNpTXFBb0o3?=
 =?utf-8?B?UmoyN1FUN05xMVo1SDJjM1d1bnlMVTlqcnVQUHVmc3F5Vk02OENxdDFwUXZO?=
 =?utf-8?B?dEEyeHlaellYNkY1TjVKdVVEQkZVMGg2elM3RTFlN0p2OTIrdVdrcjFjeEIz?=
 =?utf-8?B?Z3k0OUpKbzA1Slk4TnQxb210dFUwSG5xMmV5WWhoa1hnM3d1Z0IzQ2NPeGEr?=
 =?utf-8?B?Vm9uQ2Q0Q09NODdxTkpld3FmV2ZLUUp2azZYVEJkbjV2LzY2NnpER0hQdTFr?=
 =?utf-8?B?c0hRVVl6S0xFc3BtMkRacWZ1Ri9PMlRUaHc2NVI1eUdMc0krOHZUOFUwZ1dW?=
 =?utf-8?B?WVZtTTdTTld3USszR3RnTXBDanE2Z0JUSElEMzl3TmxhbVFkWWc2OTVhdGhI?=
 =?utf-8?B?bVlmNUJkbzJ2eWFEREhOK3dLNy8zSU5JbGJWU1JRS0IwaE5OUG10RVk1N2Fz?=
 =?utf-8?B?UDQ1ekxsVTd3MC9vUEpDdXFJM3JPRmQvcktSSTM3WDZib2hmbnlWaFRRcVJ3?=
 =?utf-8?B?TXFjYUM0dFpiT29rdXNOcUNQVmF5bUMrZWJKRXNNQ3hrMXA0cFk0ay9ORmlV?=
 =?utf-8?B?ODNYOEd4WDVjdFhJN3ZXWXpJQnI0WDJKMlNZMUtGZUZQa1lwWDlRTG9wQkFB?=
 =?utf-8?B?UnpHSE55ak92TEg5UXRSZms0SzJ2L1AyT01hQ0pnaEtJUk55ZnZKanhDeEo4?=
 =?utf-8?B?TGUzSGQ1bk54WlgzYmQ4Vjhtbm5OVEZCRDRocThNaklwSEpudGVpYkJMNGFw?=
 =?utf-8?B?WXh3ZXlyWUxCY2RQaDBkQlNDNEtrZUVMWkNZREI3cEQ3L3ZUa0xmY3VzbytG?=
 =?utf-8?B?SG9TT2RmbWJMR0RLcXlNWVlYTUhxOVVSamlGbS9kWVBETnJ3cUtJcWpBU0pM?=
 =?utf-8?B?NGtkblJ3SDUzcnQ0OXlXTXliMXdDT1hFcVN1MzBDQlpuSnZ6aWxkMS9XdXVX?=
 =?utf-8?B?UUxvOU83VEVjSXZaaFA5MGRFNUcvcGQzS25ZSk4wRWtPbGhYcDVKbUp6Ylgv?=
 =?utf-8?B?cVIvUlJPS0RhOGx3Z3cxZ3NWaVlZeTdUWXJhTUNqalVla20ycDd6TWZxOHZo?=
 =?utf-8?B?RXQ0dEdodmJXTllwNzlSZzREbm9wWWhpNHNKZ0lmcnBqSnVNM2Z6K2t5cWZm?=
 =?utf-8?B?VWpKNGpzLzBxNktUS2hLcDMyRU95YlpTSTNEZUkrZ00xcDJuWDNjTkNuclJW?=
 =?utf-8?B?QWpFTWpGazM4TlgvZjNyNm53cTJyMWZHalViZHZ0TXZHUU9xb09vT21tZ21P?=
 =?utf-8?B?UGRweFo4WnVOVFZObnJUSFZVM0NuQnNtSzIwQjNrT2NsNHJxUnRmRWZseHNt?=
 =?utf-8?B?eDVZa0U4S1EzZ0E2NkRoQVBVV1Q1cWtRYVNnNXozdEF0dXFmQkRJeGRhcktE?=
 =?utf-8?B?NWdWSGRabGU4QkZ5bkJMUUs0TUNLQUZCU1pHUSs2WEw1cVlCdEI0ZHIyYlFZ?=
 =?utf-8?B?bXg0cHI5Z2RWSWwrZDlSZmdHdzJHdUMrc3FtN21hVzFtOS9VWElJbUJraG9K?=
 =?utf-8?B?M0lTK0RwMCsrblpydXBkVGdKdG1GMG9JcU9zOThHM21xbUNjMVFkZ2c2Zmtl?=
 =?utf-8?B?c2hNMFA5WXpVN0JQays3SVJIbUtEd2hyaFJqeFJVVG1pUDBYUE01SWZVdHBz?=
 =?utf-8?B?NWFMdjZFTi93QlV6Mi9sZHczYmY5d05WV2NtZ0lMTy81V2ROZmp5RVp3M2U2?=
 =?utf-8?B?SFM1cytPSzFIOHNCTWZSNWJEK2p6SEcyRUQwVCt0d0Z2bDB6ZmtIOEt4SEtj?=
 =?utf-8?B?bDVpYnZ2KzBJeTI0TDFvVUJpSjRuUWN5WXdOTmFWTi9UbTB3L3JUL2FWYUxF?=
 =?utf-8?B?c0h3dFZBdzhYMlVnMEJ6LzJRRk1lUVgrNzFwYjZmNVVPTDhOUW9iQ2dRM1BQ?=
 =?utf-8?B?b3NmNXhNc0RHc3o2UW5PMldCYXZ3NjBjeHlxc2FncGNCVWVMQUJxSHQvZUND?=
 =?utf-8?B?SEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0fe519f-0e12-4d52-8059-08dc4c8230f1
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 04:15:23.3355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y6oj3RTooRFLjTHKLeIXt2Sf1tOprzD5L5p5vrhbYM0PXA6l/lWABWpUYmoTcblHZdwj5jDTHMS5leCodxeKgAZZnzSZGWASIQv4bNmLI5A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6157
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

--------------sUQF48uh0RqwVnEZ3n2ihk1a
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 23-03-2024 01:07, Rodrigo Vivi wrote:
> On Fri, Mar 22, 2024 at 03:00:17PM +0530, Ghimiray, Himal Prasad wrote:
>>     On 21-03-2024 02:27, Rodrigo Vivi wrote:
>>                                                                                  
>>     On Wed, Mar 20, 2024 at 03:48:35PM +0530, Himal Prasad Ghimiray wrote:
>>                                                                                  
>>     >Cast to proper datatypes to avoid overflows.
>>                                                                                  
>>     I'm afraid that the cast wont prevent the overflow, but mask it.
>>     probably safer to move the multiplication to some of the helpers
>>     in linux/math64.h ?!
>>                                                                                  
>>     Hi Rodrigo,
>>     Thank you for your response. The modifications are inspired by the inline
>>     u64 mul_u32_u32(u32 a, u32 b)
>>     function defined in linux/math64.h. Initially, I considered using the same
>>     approach.
>>     However, I discovered an architecture-specific implementation for
>>     mul_u32_u32.
>>     To prevent ambiguity, I opted for casting, which I observed is a standard
>>     practice throughout Linux code.
> afaik the cast just tells compilers and static analyzer tools that we know
> what we are doing and we know that that math on the right won't exceed
> the cast size. But it doesn't prevent overflow. You need to take care
> and be sure that you are not overflowing the bits you have available. Always.

Apologies for the oversight. I realize now that I should have been 
clearer in the commit message regarding the specific overflows I aimed 
to address.

In this context, we are performing multiplication of two 32-bit operands 
and expecting the result as a |u64|. However, not all compilers or 
platforms are guaranteed to use a |u64| for the intermediate result of 
multiplication in this scenario. Some might opt for a |u32| for storing 
the intermediate result of multiplication before widening it to |u64|.

By explicitly casting one of the operands to |u64|, we ensure that the 
multiplication will be carried out with a |u64| as the intermediate 
result. This casting mitigates the risk of overflow that might occur due 
to the multiplication of two lower precision (|u32|) operands before 
widening the result to higher precision (|u64|).

This patch does not aim to address overflow if the result itself 
overflows |u64|, but rather focuses on addressing overflow that might 
occur due to the multiplication of two lower precision (|u32|) operands 
before widening the result to higher precision (|u64|).

>
> I doubled checked all the cases below and I'm sure we don't have any
> overflow issue there. So you need to at least adjust the commit message.

Will modify the commit message to:

"Addressing potential overflow in result of  multiplication of two lower 
precision (|u32|) operands

  before widening it to higher precision (|u64|)."

>
>
> Btw, (map_ofs / XE_PAGE_SIZE - NUM_KERNEL_PDE) probably deserves a separate
> patch to make it to use some of the variants of DIV_ROUND macros...

To me this looks unnecessary.  But if you feel it is good to have or 
required it can be done.

BR
Himal Ghimiray

>
>
>>     BR
>>     Himal
>>                                                                                  
>>                                                                                  
>>                                                                                  
>>     >Cc: Matthew Auld [1]<matthew.auld@intel.com>                                 
>>     >Cc: Matthew Brost [2]<matthew.brost@intel.com>                               
>>     >Cc: Rodrigo Vivi [3]<rodrigo.vivi@intel.com>                                 
>>     >Signed-off-by: Himal Prasad Ghimiray [4]<himal.prasad.ghimiray@intel.com>    
>>     >---
>>     >These errors were highlighted by Coverity. I'm uncertain whether they
>>     >require attention or if it would be more appropriate to label them as
>>     >false positives within the tool.
>>                                                                                  
>>     >I've submitted this patch in case addressing the issues is necessary.
>>     >However, if reviewers determine that these issues should be marked as
>>     >false positives or ignored within the tool, that option is also
>>     >available
>>                                                                                  
>>     > drivers/gpu/drm/xe/xe_migrate.c | 8 ++++----
>>     > 1 file changed, 4 insertions(+), 4 deletions(-)
>>                                                                                  
>>     >diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>>     >index ee1bb938c493..2ba4fb9511f6 100644
>>     >--- a/drivers/gpu/drm/xe/xe_migrate.c
>>     >+++ b/drivers/gpu/drm/xe/xe_migrate.c
>>     >@@ -227,7 +227,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>>     >                if (vm->flags & XE_VM_FLAG_64K && level == 1)
>>     >                        flags = XE_PDE_64K;
>>     >
>>     >-               entry = vm->pt_ops->pde_encode_bo(bo, map_ofs + (level - 1) *
>>     >+               entry = vm->pt_ops->pde_encode_bo(bo, map_ofs + (u64)(level - 1) *
>>     >                                                  XE_PAGE_SIZE, pat_index);
>>     >                xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE * level, u64,
>>     >                          entry | flags);
>>     >@@ -235,7 +235,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>>     >
>>     >        /* Write PDE's that point to our BO. */
>>     >        for (i = 0; i < num_entries - num_level; i++) {
>>     >-               entry = vm->pt_ops->pde_encode_bo(bo, i * XE_PAGE_SIZE,
>>     >+               entry = vm->pt_ops->pde_encode_bo(bo, (u64)i * XE_PAGE_SIZE,
>>     >                                                  pat_index);
>>     >
>>     >                xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE +
>>     >@@ -291,7 +291,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>>     > #define VM_SA_UPDATE_UNIT_SIZE         (XE_PAGE_SIZE / NUM_VMUSA_UNIT_PER_PAGE)
>>     > #define NUM_VMUSA_WRITES_PER_UNIT      (VM_SA_UPDATE_UNIT_SIZE / sizeof(u64))
>>     >        drm_suballoc_manager_init(&m->vm_update_sa,
>>     >-                                 (map_ofs / XE_PAGE_SIZE - NUM_KERNEL_PDE) *
>>     >+                                 (size_t)(map_ofs / XE_PAGE_SIZE - NUM_KERNEL_PDE) *
>>     >                                  NUM_VMUSA_UNIT_PER_PAGE, 0);
>>     >
>>     >        m->pt_bo = bo;
>>     >@@ -490,7 +490,7 @@ static void emit_pte(struct xe_migrate *m,
>>     >        struct xe_vm *vm = m->q->vm;
>>     >        u16 pat_index;
>>     >        u32 ptes;
>>     >-       u64 ofs = at_pt * XE_PAGE_SIZE;
>>     >+       u64 ofs = (u64)at_pt * XE_PAGE_SIZE;
>>     >        u64 cur_ofs;
>>     >
>>     >        /* Indirect access needs compression enabled uncached PAT index */
>>     >--
>>     >2.25.1
>>
>> References
>>
>>     Visible links
>>     1.mailto:matthew.auld@intel.com
>>     2.mailto:matthew.brost@intel.com
>>     3.mailto:rodrigo.vivi@intel.com
>>     4.mailto:himal.prasad.ghimiray@intel.com
--------------sUQF48uh0RqwVnEZ3n2ihk1a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 23-03-2024 01:07, Rodrigo Vivi
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:Zf3d8niX22_zfvZy@intel.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Fri, Mar 22, 2024 at 03:00:=
17PM +0530, Ghimiray, Himal Prasad wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">   On 21-03-2024 02:27, Rodr=
igo Vivi wrote:                                    =20
                                                                           =
    =20
   On Wed, Mar 20, 2024 at 03:48:35PM +0530, Himal Prasad Ghimiray wrote:  =
    =20
                                                                           =
    =20
   &gt;Cast to proper datatypes to avoid overflows.                        =
       =20
                                                                           =
    =20
   I'm afraid that the cast wont prevent the overflow, but mask it.        =
    =20
   probably safer to move the multiplication to some of the helpers        =
    =20
   in linux/math64.h ?!                                                    =
    =20
                                                                           =
    =20
   Hi Rodrigo,                                                             =
    =20
   Thank you for your response. The modifications are inspired by the inlin=
e   =20
   u64 mul_u32_u32(u32 a, u32 b)                                           =
    =20
   function defined in linux/math64.h. Initially, I considered using the sa=
me  =20
   approach.                                                               =
    =20
   However, I discovered an architecture-specific implementation for       =
    =20
   mul_u32_u32.                                                            =
    =20
   To prevent ambiguity, I opted for casting, which I observed is a standar=
d   =20
   practice throughout Linux code.                                         =
    =20
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
afaik the cast just tells compilers and static analyzer tools that we know
what we are doing and we know that that math on the right won't exceed
the cast size. But it doesn't prevent overflow. You need to take care
and be sure that you are not overflowing the bits you have available. Alway=
s.</pre>
    </blockquote>
    <div class=3D"flex flex-grow flex-col max-w-full" style=3D"border: 0px =
solid rgb(227, 227, 227); box-sizing: border-box; --tw-border-spacing-x: 0;=
 --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-r=
otate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1;=
 --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness=
: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; -=
-tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numer=
ic-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-ins=
et: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-=
color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-r=
ing-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colo=
red: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw=
-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia=
: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; -=
-tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotat=
e: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturat=
e: ; --tw-backdrop-sepia: ; display: flex; max-width: 100%; flex-grow: 1; f=
lex-direction: column;">
      <div data-message-author-role=3D"assistant" data-message-id=3D"4f153a=
f1-eb3d-477a-a860-8408a1657b79" class=3D"min-h-[20px] text-message flex fle=
x-col items-start gap-3 whitespace-pre-wrap break-words [.text-message+&amp=
;]:mt-5 overflow-x-auto" style=3D"border: 0px solid rgb(227, 227, 227); box=
-sizing: border-box; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --=
tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --t=
w-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; =
--tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-fr=
om-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; -=
-tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spa=
cing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width:=
 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --=
tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; =
--tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-bl=
ur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate=
: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-=
backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw=
-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; =
--tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; d=
isplay: flex; min-height: 20px; flex-direction: column; align-items: flex-s=
tart; gap: 0.75rem; overflow-x: auto; white-space: pre-wrap; overflow-wrap:=
 break-word;"><div class=3D"markdown prose w-full break-words dark:prose-in=
vert light" style=3D"border: 0px solid rgb(227, 227, 227); box-sizing: bord=
er-box; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-=
x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; =
--tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zo=
om: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: =
; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: =
; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-=
numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ri=
ng-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offse=
t-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: =
0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-br=
ightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-inve=
rt: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur=
: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-gra=
yscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop=
-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; color: var(--t=
w-prose-body); max-width: none; --tw-prose-body: var(--text-primary); --tw-=
prose-headings: var(--text-primary); --tw-prose-lead: var(--text-primary); =
--tw-prose-links: var(--text-primary); --tw-prose-bold: var(--text-primary)=
; --tw-prose-counters: var(--text-tertiary); --tw-prose-bullets: var(--text=
-tertiary); --tw-prose-hr: var(--border-xheavy); --tw-prose-quotes: var(--t=
ext-primary); --tw-prose-quote-borders: #e5e7eb; --tw-prose-captions: var(-=
-text-secondary); --tw-prose-code: var(--text-primary); --tw-prose-pre-code=
: #e5e7eb; --tw-prose-pre-bg: #1f2937; --tw-prose-th-borders: #d1d5db; --tw=
-prose-td-borders: #e5e7eb; --tw-prose-invert-body: var(--text-primary); --=
tw-prose-invert-headings: var(--text-primary); --tw-prose-invert-lead: var(=
--text-primary); --tw-prose-invert-links: var(--text-primary); --tw-prose-i=
nvert-bold: var(--text-primary); --tw-prose-invert-counters: var(--text-ter=
tiary); --tw-prose-invert-bullets: var(--text-tertiary); --tw-prose-invert-=
hr: var(--border-xheavy); --tw-prose-invert-quotes: var(--text-primary); --=
tw-prose-invert-quote-borders: #374151; --tw-prose-invert-captions: var(--t=
ext-secondary); --tw-prose-invert-code: var(--text-primary); --tw-prose-inv=
ert-pre-code: #d1d5db; --tw-prose-invert-pre-bg: rgba(0,0,0,.5); --tw-prose=
-invert-th-borders: #4b5563; --tw-prose-invert-td-borders: #374151; font-si=
ze: 1rem; line-height: 1.75; width: 692px; overflow-wrap: break-word;"><p s=
tyle=3D"border: 0px solid rgb(227, 227, 227); box-sizing: border-box; --tw-=
border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-tr=
anslate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x:=
 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-sc=
roll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradie=
nt-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashe=
d-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fract=
ion: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-col=
or: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0=
 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transpare=
nt; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; -=
-tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-sa=
turate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-back=
drop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --t=
w-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; -=
-tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 1.25em 0px;">Apolog=
ies for the oversight. I realize now that I should have been clearer in the=
 commit message regarding the specific overflows I aimed to address.</p><p =
style=3D"border: 0px solid rgb(227, 227, 227); box-sizing: border-box; --tw=
-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-t=
ranslate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x=
: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-s=
croll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradi=
ent-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slash=
ed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-frac=
tion: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-co=
lor: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 =
0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transpar=
ent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; =
--tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-s=
aturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-bac=
kdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --=
tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; =
--tw-backdrop-saturate: ; --tw-backdrop-sepia: ; margin: 1.25em 0px;">In th=
is context, we are performing multiplication of two 32-bit operands and exp=
ecting the result as a <code style=3D"border: 0px solid rgb(227, 227, 227);=
 box-sizing: border-box; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0=
; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0;=
 --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y=
: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradien=
t-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position:=
 ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric=
-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-wi=
dth: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5)=
; --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transpare=
nt; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --t=
w-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-ro=
tate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; -=
-tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; =
--tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert=
: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia:=
 ; font-size: 0.875em; color: var(--tw-prose-code); font-weight: 600;">u64<=
/code>. However, not all compilers or platforms are guaranteed to use a <co=
de style=3D"border: 0px solid rgb(227, 227, 227); box-sizing: border-box; -=
-tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --t=
w-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scal=
e-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --t=
w-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gr=
adient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-sl=
ashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-f=
raction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset=
-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow:=
 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 trans=
parent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness:=
 ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --t=
w-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-=
backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ;=
 --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity:=
 ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-size: 0.875em; col=
or: var(--tw-prose-code); font-weight: 600;">u64</code> for the intermediat=
e result of multiplication in this scenario. Some might opt for a <code sty=
le=3D"border: 0px solid rgb(227, 227, 227); box-sizing: border-box; --tw-bo=
rder-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-tran=
slate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1=
; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scro=
ll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient=
-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-=
zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fractio=
n: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color=
: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 t=
ransparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent=
; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --t=
w-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-satu=
rate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdr=
op-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-=
backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --t=
w-backdrop-saturate: ; --tw-backdrop-sepia: ; font-size: 0.875em; color: va=
r(--tw-prose-code); font-weight: 600;">u32</code> for storing the intermedi=
ate result of multiplication before widening it to <code style=3D"border: 0=
px solid rgb(227, 227, 227); box-sizing: border-box; --tw-border-spacing-x:=
 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --t=
w-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y:=
 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictn=
ess: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: =
; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-nu=
meric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-=
inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ri=
ng-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --t=
w-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-c=
olored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; -=
-tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-se=
pia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: =
; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-ro=
tate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-satu=
rate: ; --tw-backdrop-sepia: ; font-size: 0.875em; color: var(--tw-prose-co=
de); font-weight: 600;">u64</code>.</p><p style=3D"border: 0px solid rgb(22=
7, 227, 227); box-sizing: border-box; --tw-border-spacing-x: 0; --tw-border=
-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --=
tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x:=
 ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity;=
 --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient=
-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ;=
 --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-r=
ing-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(=
69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: =
0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 tra=
nsparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: =
; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-dro=
p-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop=
-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-ba=
ckdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-ba=
ckdrop-sepia: ; margin: 1.25em 0px;">By explicitly casting one of the opera=
nds to <code style=3D"border: 0px solid rgb(227, 227, 227); box-sizing: bor=
der-box; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate=
-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0;=
 --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-z=
oom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position:=
 ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal:=
 ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw=
-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-r=
ing-offset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offs=
et-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow:=
 0 0 transparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-b=
rightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-inv=
ert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blu=
r: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-gr=
ayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdro=
p-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-size: 0.=
875em; color: var(--tw-prose-code); font-weight: 600;">u64</code>, we ensur=
e that the multiplication will be carried out with a <code style=3D"border:=
 0px solid rgb(227, 227, 227); box-sizing: border-box; --tw-border-spacing-=
x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; -=
-tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-=
y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-stric=
tness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position=
: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-=
numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-rin=
g-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-=
ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; -=
-tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow=
-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ;=
 --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-=
sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness=
: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-=
rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-sa=
turate: ; --tw-backdrop-sepia: ; font-size: 0.875em; color: var(--tw-prose-=
code); font-weight: 600;">u64</code> as the intermediate result. This casti=
ng mitigates the risk of overflow that might occur due to the multiplicatio=
n of two lower precision (<code style=3D"border: 0px solid rgb(227, 227, 22=
7); box-sizing: border-box; --tw-border-spacing-x: 0; --tw-border-spacing-y=
: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x:=
 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pa=
n-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-grad=
ient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-positi=
on: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-nume=
ric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset=
-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,=
.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transp=
arent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; =
--tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue=
-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: =
; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast:=
 ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-inv=
ert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sep=
ia: ; font-size: 0.875em; color: var(--tw-prose-code); font-weight: 600;">u=
32</code>) operands before widening the result to higher precision (<code s=
tyle=3D"border: 0px solid rgb(227, 227, 227); box-sizing: border-box; --tw-=
border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-tr=
anslate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x:=
 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-sc=
roll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradie=
nt-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashe=
d-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fract=
ion: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-col=
or: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0=
 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transpare=
nt; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; -=
-tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-sa=
turate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-back=
drop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --t=
w-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; -=
-tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-size: 0.875em; color: =
var(--tw-prose-code); font-weight: 600;">u64</code>).</p><p style=3D"border=
: 0px solid rgb(227, 227, 227); box-sizing: border-box; --tw-border-spacing=
-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; =
--tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale=
-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-stri=
ctness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-positio=
n: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw=
-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ri=
ng-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw=
-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; =
--tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shado=
w-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: =
; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw=
-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightnes=
s: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue=
-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-s=
aturate: ; --tw-backdrop-sepia: ; margin: 1.25em 0px 0px;">This patch does =
not aim to address overflow if the result itself overflows <code style=3D"b=
order: 0px solid rgb(227, 227, 227); box-sizing: border-box; --tw-border-sp=
acing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y=
: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-=
scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap=
-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-po=
sition: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ;=
 --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --=
tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff;=
 --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transpar=
ent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-=
shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contr=
ast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ;=
 --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brig=
htness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdro=
p-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backd=
rop-saturate: ; --tw-backdrop-sepia: ; font-size: 0.875em; color: var(--tw-=
prose-code); font-weight: 600;">u64</code>, but rather focuses on addressin=
g overflow that might occur due to the multiplication of two lower precisio=
n (|u32|) operands before widening the result to higher precision (|u64|).<=
/p><span style=3D"color: rgb(13, 13, 13); font-family: S=C3=B6hne, ui-sans-=
serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cant=
arell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial=
, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI=
 Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: n=
ormal; font-variant-ligatures: normal; font-variant-caps: normal; font-weig=
ht: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent=
: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-str=
oke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255, 255)=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial; display: inline !important; float: none;"></span=
></div></div>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:Zf3d8niX22_zfvZy@intel.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

I doubled checked all the cases below and I'm sure we don't have any
overflow issue there. So you need to at least adjust the commit message.</p=
re>
    </blockquote>
    <p>Will modify the commit message to:</p>
    <p>&quot;Addressing potential overflow in result of&nbsp; multiplicatio=
n of
      two lower precision (<code style=3D"border: 0px solid rgb(227, 227, 2=
27); box-sizing: border-box; --tw-border-spacing-x: 0; --tw-border-spacing-=
y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x=
: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-p=
an-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gra=
dient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-posit=
ion: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-num=
eric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offse=
t-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164=
,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 trans=
parent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent;=
 --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hu=
e-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow:=
 ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast=
: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-in=
vert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-se=
pia: ; font-size: 0.875em; color: var(--tw-prose-code); font-weight: 600;">=
u32</code>)
      operands</p>
    <p>&nbsp;before widening it to higher precision (<code style=3D"border:=
 0px solid rgb(227, 227, 227); box-sizing: border-box; --tw-border-spacing-=
x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; -=
-tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-=
y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-stric=
tness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position=
: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-=
numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-rin=
g-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-=
ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; -=
-tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow=
-colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ;=
 --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-=
sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness=
: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-=
rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-sa=
turate: ; --tw-backdrop-sepia: ; font-size: 0.875em; color: var(--tw-prose-=
code); font-weight: 600;">u64</code>).&quot;</p>
    <blockquote type=3D"cite" cite=3D"mid:Zf3d8niX22_zfvZy@intel.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">


Btw, (map_ofs / XE_PAGE_SIZE - NUM_KERNEL_PDE) probably deserves a separate
patch to make it to use some of the variants of DIV_ROUND macros...</pre>
    </blockquote>
    <p>To me this looks unnecessary.&nbsp; But if you feel it is good to ha=
ve
      or required it can be done.</p>
    <p>BR<br>
      Himal Ghimiray<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:Zf3d8niX22_zfvZy@intel.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">


</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">   BR                       =
                                                   =20
   Himal                                                                   =
    =20
                                                                           =
    =20
                                                                           =
    =20
                                                                           =
    =20
   &gt;Cc: Matthew Auld [1]<a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>               =
                =20
   &gt;Cc: Matthew Brost [2]<a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>            =
                 =20
   &gt;Cc: Rodrigo Vivi [3]<a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>               =
                =20
   &gt;Signed-off-by: Himal Prasad Ghimiray [4]<a class=3D"moz-txt-link-rfc=
2396E" href=3D"mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghi=
miray@intel.com&gt;</a>  =20
   &gt;---                                                                 =
       =20
   &gt;These errors were highlighted by Coverity. I'm uncertain whether the=
y      =20
   &gt;require attention or if it would be more appropriate to label them a=
s      =20
   &gt;false positives within the tool.                                    =
       =20
                                                                           =
    =20
   &gt;I've submitted this patch in case addressing the issues is necessary=
.      =20
   &gt;However, if reviewers determine that these issues should be marked a=
s      =20
   &gt;false positives or ignored within the tool, that option is also     =
       =20
   &gt;available                                                           =
       =20
                                                                           =
    =20
   &gt; drivers/gpu/drm/xe/xe_migrate.c | 8 ++++----                       =
       =20
   &gt; 1 file changed, 4 insertions(+), 4 deletions(-)                    =
       =20
                                                                           =
    =20
   &gt;diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe=
_migrate.c
   &gt;index ee1bb938c493..2ba4fb9511f6 100644                             =
       =20
   &gt;--- a/drivers/gpu/drm/xe/xe_migrate.c                               =
       =20
   &gt;+++ b/drivers/gpu/drm/xe/xe_migrate.c                               =
       =20
   &gt;@@ -227,7 +227,7 @@ static int xe_migrate_prepare_vm(struct xe_tile =
*tile, struct xe_migrate *m,
   &gt;                if (vm-&gt;flags &amp; XE_VM_FLAG_64K &amp;&amp; lev=
el =3D=3D 1)              =20
   &gt;                        flags =3D XE_PDE_64K;                       =
         =20
   &gt;                                                                    =
       =20
   &gt;-               entry =3D vm-&gt;pt_ops-&gt;pde_encode_bo(bo, map_of=
s + (level - 1) *
   &gt;+               entry =3D vm-&gt;pt_ops-&gt;pde_encode_bo(bo, map_of=
s + (u64)(level - 1) *
   &gt;                                                  XE_PAGE_SIZE, pat_=
index);=20
   &gt;                xe_map_wr(xe, &amp;bo-&gt;vmap, map_ofs + XE_PAGE_SI=
ZE * level, u64,
   &gt;                          entry | flags);                           =
       =20
   &gt;@@ -235,7 +235,7 @@ static int xe_migrate_prepare_vm(struct xe_tile =
*tile, struct xe_migrate *m,
   &gt;                                                                    =
       =20
   &gt;        /* Write PDE's that point to our BO. */                     =
       =20
   &gt;        for (i =3D 0; i &lt; num_entries - num_level; i++) {        =
            =20
   &gt;-               entry =3D vm-&gt;pt_ops-&gt;pde_encode_bo(bo, i * XE=
_PAGE_SIZE,    =20
   &gt;+               entry =3D vm-&gt;pt_ops-&gt;pde_encode_bo(bo, (u64)i=
 * XE_PAGE_SIZE,
   &gt;                                                  pat_index);       =
       =20
   &gt;                                                                    =
       =20
   &gt;                xe_map_wr(xe, &amp;bo-&gt;vmap, map_ofs + XE_PAGE_SI=
ZE +          =20
   &gt;@@ -291,7 +291,7 @@ static int xe_migrate_prepare_vm(struct xe_tile =
*tile, struct xe_migrate *m,
   &gt; #define VM_SA_UPDATE_UNIT_SIZE         (XE_PAGE_SIZE / NUM_VMUSA_UN=
IT_PER_PAGE)
   &gt; #define NUM_VMUSA_WRITES_PER_UNIT      (VM_SA_UPDATE_UNIT_SIZE / si=
zeof(u64))
   &gt;        drm_suballoc_manager_init(&amp;m-&gt;vm_update_sa,          =
              =20
   &gt;-                                 (map_ofs / XE_PAGE_SIZE - NUM_KERN=
EL_PDE) *
   &gt;+                                 (size_t)(map_ofs / XE_PAGE_SIZE - =
NUM_KERNEL_PDE) *
   &gt;                                  NUM_VMUSA_UNIT_PER_PAGE, 0);      =
       =20
   &gt;                                                                    =
       =20
   &gt;        m-&gt;pt_bo =3D bo;                                         =
            =20
   &gt;@@ -490,7 +490,7 @@ static void emit_pte(struct xe_migrate *m,      =
       =20
   &gt;        struct xe_vm *vm =3D m-&gt;q-&gt;vm;                        =
               =20
   &gt;        u16 pat_index;                                              =
       =20
   &gt;        u32 ptes;                                                   =
       =20
   &gt;-       u64 ofs =3D at_pt * XE_PAGE_SIZE;                           =
         =20
   &gt;+       u64 ofs =3D (u64)at_pt * XE_PAGE_SIZE;                      =
         =20
   &gt;        u64 cur_ofs;                                                =
       =20
   &gt;                                                                    =
       =20
   &gt;        /* Indirect access needs compression enabled uncached PAT in=
dex */ =20
   &gt;--                                                                  =
       =20
   &gt;2.25.1                                                              =
       =20

References

   Visible links
   1. <a class=3D"moz-txt-link-freetext" href=3D"mailto:matthew.auld@intel.=
com">mailto:matthew.auld@intel.com</a>
   2. <a class=3D"moz-txt-link-freetext" href=3D"mailto:matthew.brost@intel=
.com">mailto:matthew.brost@intel.com</a>
   3. <a class=3D"moz-txt-link-freetext" href=3D"mailto:rodrigo.vivi@intel.=
com">mailto:rodrigo.vivi@intel.com</a>
   4. <a class=3D"moz-txt-link-freetext" href=3D"mailto:himal.prasad.ghimir=
ay@intel.com">mailto:himal.prasad.ghimiray@intel.com</a>
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------sUQF48uh0RqwVnEZ3n2ihk1a--
