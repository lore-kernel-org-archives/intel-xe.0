Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C59F0C67861
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 18:15:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AAF810E436;
	Fri,  5 Apr 2024 18:15:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D3Lec3Df";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA3410E074;
 Fri,  5 Apr 2024 18:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712340923; x=1743876923;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=GOr2GxES2W6s5kXbmf7IJfBEWLOJcS/KGTNFOkfzi1w=;
 b=D3Lec3DfZEPLpJN9kl+n9Nqx3o/N0Irb7w6AQ112XhWifMRQt6MEumQj
 uIhmo5A96u7GK1AJ3N1IWpu/FDYVjKMtPaqmWN69tQJhSQDehKmuuosw/
 SDKAxsoiUhJ5nz6Ur1loQpEjxitSOy7V/MkveMjEuLWnwLnrM5RYVMY25
 I4sGt9/VYcKYuNVdR+c9afTHhxpTfRFjnM0zdX9W+EwhS5TLgDG+kRwiU
 fLSuzxAlJAIleHfnUvGPNBYAUiKc8kjtVxhaIBRLOTq8PMjaxbn/IAkyo
 g75r0hr/sBSeauTU8JcFLMppEAzNcGHSTY3nJPTbc0ARN1EIlWDGkVeuM g==;
X-CSE-ConnectionGUID: HLbtlcyESwKxtIoJ9loZaQ==
X-CSE-MsgGUID: vdpav0V8RjWcecpvwJqEkA==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="7534824"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208,217";a="7534824"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 11:15:23 -0700
X-CSE-ConnectionGUID: HZkrBGk+TDKqB0xNTfk+gQ==
X-CSE-MsgGUID: Cm3HK2AGTKq5PmKq3dDOug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208,217";a="23969063"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Apr 2024 11:15:22 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Apr 2024 11:15:21 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 5 Apr 2024 11:15:21 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 5 Apr 2024 11:15:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XOMGx+GOhFE75sIY4Bx1TKrxhqe+oa3X5OjnASd1bXH914T9rNA1hkCiHBCAgzIddzciDwMO1mMNjco7gd+y5g7x0q2MoA61gg6Zsb482gMyuiZVzb4DhjX2KezRkB68S+SPph8BcSwhQfy5ju5DU7wcPTybvJr6wy8qzhmG4FQNB0V5iRFVTXrljrAceem8gSEWm6422Xz3XChdY979rDPFJXM1H8NYW0OP0hu3xNhvfBZ88l0lNGlQSMEODhooKqjmJzE+mVcX55xLibpTDq2rXww0PF4lqF30vNsG53MkJi7hDvAgC1ylwFAL4EVjRdLADod+vcJjRx2g4WNuPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0YGnnMdxP0z/wh3E9rN03NH+5bSmgPSNesXn06lhSfw=;
 b=gkf9Ta1P12oJQytGFVNYBpYxVGVrOHBkIcDyoO3pKkEWA0MYoYTpaLSuwrjWC8/3QEZM9+Lc8keT7gDaFZQni55CKrsToM0VedxCanEbW2CcTBKftVC7Ahw+aui1nNr9nkXONTl/WQXvUiY4qDIwXSNdAs9b5DM1EJ2edYmbs/q4Aym9ghGkUISy0NxvJ7ye+dcALj0XidiWOWhfoquuiUdKzF/CNKq+ZV8CBzzGhBUJ0QSGOo0GENqaeSuhEx1SV+EzW1yFrHanaHo9udE43DF088uqvJdw6GXh4f9gfOw1pd2KaFqxlX7h0++lmm/bakI2voeHqLMWHA/gx6UePw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SN7PR11MB6799.namprd11.prod.outlook.com (2603:10b6:806:261::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Fri, 5 Apr
 2024 18:15:18 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b%4]) with mapi id 15.20.7452.019; Fri, 5 Apr 2024
 18:15:18 +0000
Content-Type: multipart/alternative;
 boundary="------------rek0wkfZJxJR1KAL001gjXwh"
Message-ID: <76010aec-7937-4e5a-afd2-672b338df8df@intel.com>
Date: Fri, 5 Apr 2024 11:15:14 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 i-g-t] tests/xe_exec_threads: Make hang tests reset
 domain aware
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost,
 Matthew" <matthew.brost@intel.com>
References: <20240402122223.643413-1-tejas.upadhyay@intel.com>
 <20240402194017.GJ6574@mdroper-desk1.amr.corp.intel.com>
 <kss23fgx24bvhlarkvrivrvvh32pxugpvgavdo3tc4u55jmidf@rnr7terjza6w>
 <SJ1PR11MB62041F26676765342848070D813D2@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <7eac7b89-8c32-4261-b288-0cf2002b4e93@intel.com>
 <SJ1PR11MB6204AA1AFB30BFEF7EBAA3D281032@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <SJ1PR11MB6204AA1AFB30BFEF7EBAA3D281032@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0059.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::34) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SN7PR11MB6799:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +6fj59pAVqJxO15vlbM0NgABxaCNGhCuPzn4RU6BN01Ahw2w5fSuXk+H4QFMVMJyW2GZcJwssGOTz0NPazpz1GxnfXixabKR8Z5xeOodkvexVSkFb6/XcYt/r3TRqBpikidMvYrwr02A5HjalHK5z2SGi3U2xNbfER0STiRfdnXKsHnTzimpDbm8XqEQwv3rCOwOeZE4DoEEnf/QZpPvBaa1lWbU0N1Pa5XFIAyG441ZwGLJhCxnlcXEn2BsQlrlQFSeJShiXGju39u9fyn5UMQbH5YHzBJa3s21c46m+681pLqjWV7qty8vyQ2So42qdfkrAxoz2aeNmiWBz/HXsDulmdO4JKFkAjVW7utwb6I/c0sutD4kEEGiyOG9k9PPTVZktP4vvQneu8PCXF3gRs8wDTh+etmC63HPZurzAP49JHIneVn5emzX6Hv1KH/ecnvpIx9gZoMQd7frUNqnc5Aoy6yXvIrn3y4tCntDEzjGImQmUJaYwJEFoVjnmvtfYkJkRRqdd83OUxecjI+CC05kCGdMqVWoit434kQVIlL0hWuIG7mw1eetVNMwtkaJVCQs3uXjcikcZylaztKzx/XjkLqBTgH1EmbrtVGydrFcubHi/rS6eajE4qK6NOkaCVfWFU9I396IbhRqIkLg/8XzS9zNyykY63kamZzC6NU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UktNL0RPNzNIYkd1U2E2VldDREkzVG1EcDFSWXBrQk1iZ1JaVXBaeFJWd0pC?=
 =?utf-8?B?NXd4V21JUjZXcW5hd1VZSkFQR0N3YitlZHRuaU5QRW96REFaWkk5cVhsRGts?=
 =?utf-8?B?THBjbGV3bkNTTUhKRzZER2tkN0hyeDJveW5MOXNESTQraElLenZxazhQL1Zm?=
 =?utf-8?B?MHZyWU43YTlEejJYMU5vSVg0S2puOXVLMzVRRU91emZ6Q3FIUmp1ekh1NzhR?=
 =?utf-8?B?bnBZSUdTZnkzd3FvZHhsN1pocHVFdlRmZC9HbnhYMm5pUkMvOUN3L0J6NnB2?=
 =?utf-8?B?MHdiclJuM1F6ejRqTEV5V3FNcW0yeGt3WTJnZHdEdFlYU1dEYS9KZmZqeTNt?=
 =?utf-8?B?cWY1ZGN6ZmZPM01TUXdpbzdUeTM2RXZpRWZ5cXpNUktFeEtkOWU2K1BvbDF3?=
 =?utf-8?B?ZWI1NithTEtFSmI0SnM1V0w2M1E5YXpFYkpTZHJSMzB4L2F2ZzZIRVA5YTVq?=
 =?utf-8?B?QVh2eUE2N3JJcjdMbkRNMis1SWsrT0tPRGo5cTZvMDhOLzJBNzJEVXAyUU5z?=
 =?utf-8?B?ZjFKbWV5Z21qTzhMOFFTYTE2cFUra09nalBsUUlNWHE4YVpBTmFIT0MzT0g5?=
 =?utf-8?B?MGJLSktRWkV2R09PY2ZVLzdXQ3VzbHpoenQ5L0Z5L1RSQ3hLOVV1eHFsVnpR?=
 =?utf-8?B?VzNuNGhTWnFMVkZqekZZbXRNeERSaWxod3A5MUNYc0xUQW5LWmhQYjgxV3ZQ?=
 =?utf-8?B?aS9lRWpmWGZzOUFlYmR5b2JMY2dPRUpJdXM4Q2xFdTc4SG01bkxZdXJGaFN4?=
 =?utf-8?B?VHpSZEJ3R1FpTGVXWElRT1N4Mkx2RXRsZ1A5Q2dFaWw4QzVrNERsM3VxS1d3?=
 =?utf-8?B?SUNYa1RDL01xYXMzWnBMYUpqUGUzWU4wSTlCTVJ1Uzdwc25rMEJvTVI2R0d6?=
 =?utf-8?B?YlZqZmNxelYyV3V6YVphOTllL1h6UVAxU1k0QWpyWkdORVZjTTZKcERRWkU3?=
 =?utf-8?B?VWFYVmtlQnRHelJkMjdBc0N3b0tCVU9sK04yVjFmcUhIYmhnY1RlU3hoSFBS?=
 =?utf-8?B?UUVjWVUydk1XL1E2QkVWbklCbFBYTW9OMFJSQTVjZFRKdXRmUUJ6RjBLWmhS?=
 =?utf-8?B?ckpFS25PR1NQc09KaG9Lc28waW9mYndMN01QS0h2UHh2Z3cyMXB2OFFWS0Mw?=
 =?utf-8?B?WW4rN3ZRNFNWa29DZm4wWTJid01oWlVDNjBjUE1VZ3dmVTFEUlkrQjJZcWR5?=
 =?utf-8?B?S2lqeHdUV0ZlWUp5d0NlVXdOYTQ3SEsydkdRVjMxdDlhbTZ0elFkSHBNMWJh?=
 =?utf-8?B?blpyZGJxRmRyVlMxWVRSWThEcWZzS0xUWDE5cVJUK09PcE43TEFpS0pVaFhF?=
 =?utf-8?B?d3lkaU9QVGNYb01BMVpzQkZHWjJEcG5Qa2NNVDA4QUpzSXFMN0VLSWY2S2E2?=
 =?utf-8?B?Y1k5eWltMXh6eVJMMFJxbSs3ZjQ4M1JwRCtMTU03eHN0Y09OZ0gwSW1yeThy?=
 =?utf-8?B?QUhNeVptclpUYU1EaTZUZktsSlBaazJVaWZBUHFWM3pERjN1TlZiYTMrMGVr?=
 =?utf-8?B?Vm9mMk1kekM2czdmTVVJMmlabHFtdUhtcXZpbnVsNHlKK0I0VElvTi9wRDlz?=
 =?utf-8?B?UVJJYnI0YUVlWFpvcmNhbHdPTk81SWtUQ0tqbWhQbnVUVmxETUx2KzJNRVht?=
 =?utf-8?B?czR6RS9iVDkwSlRWMGZ6UGxHd3BtMitIdy81ZFJLdEx0MjJlZEFXLzBPYnlW?=
 =?utf-8?B?RVJSeXZLRHowK0o3KzU5bGwxeGNXNGNoVnlMUEdMOGRqSXU2cXNLZ21HMkwz?=
 =?utf-8?B?ckZBalVxaXpwMlc5VytsamtSdlc2eTVZNGJCSVFaeDhrNVBKdzhaQXZPYmJ0?=
 =?utf-8?B?WlJ1bEpPWC8reERWOEkrQ1k2dkozUXFNcmlER0J0NWxveW5ISjNmc0JwdjR1?=
 =?utf-8?B?WTExOW5KYjI3M0VVSkRKQzhPTmtTREpPWnhydDdUWE1GL3dzcHJHT1VSZDBy?=
 =?utf-8?B?NWpianpTN1RPWEhqbkZ1OFZxY3hScHBSUEVqRjBDRnhHRTlzd3JSMTFFZXlE?=
 =?utf-8?B?d0VKSUFSbGlkVk1pSm11Q3hSUE1GczVmOWFkb3B6dWRGM0xacHFVc2tHcitS?=
 =?utf-8?B?RFVXOW1JRXZuNzBoNTNyNzF5NENjZDVEcnc4RWlsMUtTS0RsYUZ6ZTFtaDJC?=
 =?utf-8?B?TUlWaVMxaU1rQUFJM1B5Z3JNNGpJUFNjY0hDYzJyZFN0NThKaVdseXVpcVJS?=
 =?utf-8?B?c2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 03648d87-e27f-4610-38f6-08dc559c5964
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2024 18:15:18.4249 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9QEAaMw8qPIjJy9j8G6LeT7QOpiWUSQ6mztDnTrOAdV6Wz5mQw4oq5d+5tQ3e5HA607FtLWbgfJ4hdbfnOCC7Zy0e6u0S/6ikMfrnVHWjNg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6799
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

--------------rek0wkfZJxJR1KAL001gjXwh
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/4/2024 21:47, Upadhyay, Tejas wrote:
>> -----Original Message-----
>> From: Harrison, John C<john.c.harrison@intel.com>
>> Sent: Friday, April 5, 2024 4:53 AM
>> To: Upadhyay, Tejas<tejas.upadhyay@intel.com>; De Marchi, Lucas
>> <lucas.demarchi@intel.com>; Roper, Matthew D
>> <matthew.d.roper@intel.com>
>> Cc:igt-dev@lists.freedesktop.org;intel-xe@lists.freedesktop.org; Brost,
>> Matthew<matthew.brost@intel.com>
>> Subject: Re: [PATCH V2 i-g-t] tests/xe_exec_threads: Make hang tests reset
>> domain aware
>>
>> On 4/2/2024 22:35, Upadhyay, Tejas wrote:
>>>> -----Original Message-----
>>>> From: De Marchi, Lucas<lucas.demarchi@intel.com>
>>>> Sent: Wednesday, April 3, 2024 2:26 AM
>>>> To: Roper, Matthew D<matthew.d.roper@intel.com>
>>>> Cc: Upadhyay, Tejas<tejas.upadhyay@intel.com>; igt-
>>>> dev@lists.freedesktop.org;intel-xe@lists.freedesktop.org; Brost,
>>>> Matthew<matthew.brost@intel.com>
>>>> Subject: Re: [PATCH V2 i-g-t] tests/xe_exec_threads: Make hang tests
>>>> reset domain aware
>>>>
>>>> On Tue, Apr 02, 2024 at 12:40:17PM -0700, Matt Roper wrote:
>>>>> On Tue, Apr 02, 2024 at 05:52:23PM +0530, Tejas Upadhyay wrote:
>>>>>> RCS/CCS are dependent engines as they are sharing reset domain.
>>>>>> Whenever there is reset from CCS, all the exec queues running on
>>>>>> RCS are victimised mainly on Lunarlake.
>>>>>>
>>>>>> Lets skip parallel execution on CCS with RCS.
>>>>> I haven't really looked at this specific test in detail, but based
>>>>> on your explanation here, you're also going to run into problems
>>>>> with multiple CCS engines since they all share the same reset.  You
>>>>> won't see that on platforms like LNL that only have a single CCS,
>>>>> but platforms
>>>> but it is seen on LNL because of having both RCS and CCS.
>>>>
>>>>> like PVC, ATS-M, DG2, etc. can all have multiple CCS where a reset
>>>>> on one kills anything running on the others.
>>>>>
>>>>>
>>>>> Matt
>>>>>
>>>>>> It helps in fixing following errors:
>>>>>> 1. Test assertion failure function test_legacy_mode, file, Failed
>>>>>> assertion: data[i].data == 0xc0ffee
>>>>>>
>>>>>> 2.Test assertion failure function xe_exec, file
>>>>>> ../lib/xe/xe_ioctl.c, Failed assertion: __xe_exec(fd, exec) == 0,
>>>>>> error: -125 != 0
>>>>>>
>>>>>> Signed-off-by: Tejas Upadhyay<tejas.upadhyay@intel.com>
>>>>>> ---
>>>>>>    tests/intel/xe_exec_threads.c | 26 +++++++++++++++++++++++++-
>>>>>>    1 file changed, 25 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/tests/intel/xe_exec_threads.c
>>>>>> b/tests/intel/xe_exec_threads.c index 8083980f9..31af61dc9 100644
>>>>>> --- a/tests/intel/xe_exec_threads.c
>>>>>> +++ b/tests/intel/xe_exec_threads.c
>>>>>> @@ -710,6 +710,17 @@ static void *thread(void *data)
>>>>>>    	return NULL;
>>>>>>    }
>>>>>>
>>>>>> +static bool is_engine_contexts_victimized(int fd, unsigned int
>>>>>> +flags) {
>>>>>> +	if (!IS_LUNARLAKE(intel_get_drm_devid(fd)))
>>>>>> +		return false;
>>>> as above, I don't think we should add any platform check here. It's
>>>> impossible to keep it up to date and it's also testing the wrong thing.
>>>> AFAIU you don't want parallel submission on engines that share the
>>>> same reset domain. So, this is actually what should be tested.
>>> Platforms like  PVC, ATS-M, DG2, etc. have some kind of WA/noWA which
>> helps to run things parallelly on engines in same reset domain and apparently
>> BMG/LNL does not have that kind of support so applicable for LNL/BMG with
>> parallel submission on RCS/CCS only.
>>> @Harrison, John C please reply if you have any other input here.
>> I don't get what you mean by 'have some kind of WA/noWA'. All platforms
>> with compute engines have shared reset domains. That is all there is to it. I.e.
>> everything from TGL onwards. That includes RCS and all CCS engines. So RCS +
>> CCS, CCS0 + CCS1, RCS + CC0 + CCS1, etc. Any platform with multiple engines
>> that talk to EUs will reset all of those engines in parallel.
>>
>> There are w/a's which make the situation even worse. E.g. on DG2/MTL you
>> are not allowed to context switch one of those engines while another is busy.
>> Which means that if one hangs, they all hang - you cannot just wait for other
>> workloads to complete and/or pre-empt them off the engine prior to doing
>> the shared reset. But there is nothing that makes it better.
>>
>> I assume we are talking about GuC triggered engine resets here? As opposed
>> to driver triggered full GT resets?
>>
>> The GuC will attempt to idle all other connected engines first by pre-empting
>> out any executing contexts. If those contexts are pre-emptible then they will
>> survive - GuC will automatically restart them once the reset is complete. If
>> they are not (or at least not pre-emptible within the pre-emption timeout
>> limit) then they will be killed as collateral damage.
>>
>> What are the workloads being submitted by this test? Are the pre-emptible
>> spinners? If so, then they should survive (assuming you don't have the
>> DG2/MTL RCS/CCS w/a in effect). If they are non-preemptible spinners then
>> they are toast.
> Main question here was, if this fix should be applied to all platforms who has RCS and CCS both or just LNL/BMG. Reason to ask is, only LNL/BMG are hitting this issue, with same tests PVC and other platforms are not hitting issue which we are addressing here.
And the answer is that yes, shared reset domains are common to all 
platforms with compute engines. So if only LNL/BMG are failing then the 
problem is not understood. Which is not helped by this test code being 
extremely complex and having almost zero explanation in it at all :(.

As noted, PVC has multiple compute engines but no RCS engine. If any 
compute engine is reset then all are reset. So if the test is running 
correctly and passing on PVC then it cannot be failing on LNL/BMG purely 
due to shared domain resets.

Is the reset not happening on PVC? Is the test not actually running 
multiple contexts in parallel on PVC? Or are the spinners pre-emptible 
and are therefore supposed to survive the reset of a shared domain 
engine by being swapped out first? In which case LNL/BMG are broken 
because the killed contexts are not supposed to be killed even though 
the engine is reset?

John.

>
> Thanks,
> Tejas
>> John.
>>
>>
>>> Thanks,
>>> Tejas
>>>> Lucas De Marchi
>>>>
>>>>>> +
>>>>>> +	if (flags & HANG)
>>>>>> +		return true;
>>>>>> +
>>>>>> +	return false;
>>>>>> +}
>>>>>> +
>>>>>>    /**
>>>>>>     * SUBTEST: threads-%s
>>>>>>     * Description: Run threads %arg[1] test with multi threads @@
>>>>>> -955,9 +966,13 @@ static void threads(int fd, int flags)
>>>>>>    	bool go = false;
>>>>>>    	int n_threads = 0;
>>>>>>    	int gt;
>>>>>> +	bool has_rcs = false;
>>>>>>
>>>>>> -	xe_for_each_engine(fd, hwe)
>>>>>> +	xe_for_each_engine(fd, hwe) {
>>>>>> +		if (hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER)
>>>>>> +			has_rcs = true;
>>>>>>    		++n_engines;
>>>>>> +	}
>>>>>>
>>>>>>    	if (flags & BALANCER) {
>>>>>>    		xe_for_each_gt(fd, gt)
>>>>>> @@ -990,6 +1005,15 @@ static void threads(int fd, int flags)
>>>>>>    	}
>>>>>>
>>>>>>    	xe_for_each_engine(fd, hwe) {
>>>>>> +		/* RCS/CCS sharing reset domain hence dependent engines.
>>>>>> +		 * When CCS is doing reset, all the contexts of RCS are
>>>>>> +		 * victimized, so skip the compute engine avoiding
>>>>>> +		 * parallel execution with RCS
>>>>>> +		 */
>>>>>> +		if (has_rcs && hwe->engine_class ==
>>>> DRM_XE_ENGINE_CLASS_COMPUTE &&
>>>>>> +		    is_engine_contexts_victimized(fd, flags))
>>>>>> +			continue;
>>>>>> +
>>>>>>    		threads_data[i].mutex = &mutex;
>>>>>>    		threads_data[i].cond = &cond;
>>>>>>    #define ADDRESS_SHIFT	39
>>>>>> --
>>>>>> 2.25.1
>>>>>>
>>>>> --
>>>>> Matt Roper
>>>>> Graphics Software Engineer
>>>>> Linux GPU Platform Enablement
>>>>> Intel Corporation

--------------rek0wkfZJxJR1KAL001gjXwh
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    On 4/4/2024 21:47, Upadhyay, Tejas wrote:<span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:SJ1PR11MB6204AA1AFB30BFEF7EBAA3D281032@SJ1PR11MB6204.namprd11.prod.outlook.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">-----Original Message-----
From: Harrison, John C <a class="moz-txt-link-rfc2396E" href="mailto:john.c.harrison@intel.com">&lt;john.c.harrison@intel.com&gt;</a>
Sent: Friday, April 5, 2024 4:53 AM
To: Upadhyay, Tejas <a class="moz-txt-link-rfc2396E" href="mailto:tejas.upadhyay@intel.com">&lt;tejas.upadhyay@intel.com&gt;</a>; De Marchi, Lucas
<a class="moz-txt-link-rfc2396E" href="mailto:lucas.demarchi@intel.com">&lt;lucas.demarchi@intel.com&gt;</a>; Roper, Matthew D
<a class="moz-txt-link-rfc2396E" href="mailto:matthew.d.roper@intel.com">&lt;matthew.d.roper@intel.com&gt;</a>
Cc: <a class="moz-txt-link-abbreviated" href="mailto:igt-dev@lists.freedesktop.org">igt-dev@lists.freedesktop.org</a>; <a class="moz-txt-link-abbreviated" href="mailto:intel-xe@lists.freedesktop.org">intel-xe@lists.freedesktop.org</a>; Brost,
Matthew <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
Subject: Re: [PATCH V2 i-g-t] tests/xe_exec_threads: Make hang tests reset
domain aware

On 4/2/2024 22:35, Upadhyay, Tejas wrote:
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">-----Original Message-----
From: De Marchi, Lucas <a class="moz-txt-link-rfc2396E" href="mailto:lucas.demarchi@intel.com">&lt;lucas.demarchi@intel.com&gt;</a>
Sent: Wednesday, April 3, 2024 2:26 AM
To: Roper, Matthew D <a class="moz-txt-link-rfc2396E" href="mailto:matthew.d.roper@intel.com">&lt;matthew.d.roper@intel.com&gt;</a>
Cc: Upadhyay, Tejas <a class="moz-txt-link-rfc2396E" href="mailto:tejas.upadhyay@intel.com">&lt;tejas.upadhyay@intel.com&gt;</a>; igt-
<a class="moz-txt-link-abbreviated" href="mailto:dev@lists.freedesktop.org">dev@lists.freedesktop.org</a>; <a class="moz-txt-link-abbreviated" href="mailto:intel-xe@lists.freedesktop.org">intel-xe@lists.freedesktop.org</a>; Brost,
Matthew <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
Subject: Re: [PATCH V2 i-g-t] tests/xe_exec_threads: Make hang tests
reset domain aware

On Tue, Apr 02, 2024 at 12:40:17PM -0700, Matt Roper wrote:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">On Tue, Apr 02, 2024 at 05:52:23PM +0530, Tejas Upadhyay wrote:
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">RCS/CCS are dependent engines as they are sharing reset domain.
Whenever there is reset from CCS, all the exec queues running on
RCS are victimised mainly on Lunarlake.

Lets skip parallel execution on CCS with RCS.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">I haven't really looked at this specific test in detail, but based
on your explanation here, you're also going to run into problems
with multiple CCS engines since they all share the same reset.  You
won't see that on platforms like LNL that only have a single CCS,
but platforms
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">but it is seen on LNL because of having both RCS and CCS.

</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">like PVC, ATS-M, DG2, etc. can all have multiple CCS where a reset
on one kills anything running on the others.


Matt

</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">It helps in fixing following errors:
1. Test assertion failure function test_legacy_mode, file, Failed
assertion: data[i].data == 0xc0ffee

2.Test assertion failure function xe_exec, file
../lib/xe/xe_ioctl.c, Failed assertion: __xe_exec(fd, exec) == 0,
error: -125 != 0

Signed-off-by: Tejas Upadhyay <a class="moz-txt-link-rfc2396E" href="mailto:tejas.upadhyay@intel.com">&lt;tejas.upadhyay@intel.com&gt;</a>
---
  tests/intel/xe_exec_threads.c | 26 +++++++++++++++++++++++++-
  1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_threads.c
b/tests/intel/xe_exec_threads.c index 8083980f9..31af61dc9 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -710,6 +710,17 @@ static void *thread(void *data)
  	return NULL;
  }

+static bool is_engine_contexts_victimized(int fd, unsigned int
+flags) {
+	if (!IS_LUNARLAKE(intel_get_drm_devid(fd)))
+		return false;
</pre>
              </blockquote>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">as above, I don't think we should add any platform check here. It's
impossible to keep it up to date and it's also testing the wrong thing.
AFAIU you don't want parallel submission on engines that share the
same reset domain. So, this is actually what should be tested.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Platforms like  PVC, ATS-M, DG2, etc. have some kind of WA/noWA which
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">helps to run things parallelly on engines in same reset domain and apparently
BMG/LNL does not have that kind of support so applicable for LNL/BMG with
parallel submission on RCS/CCS only.
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
@Harrison, John C please reply if you have any other input here.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">I don't get what you mean by 'have some kind of WA/noWA'. All platforms
with compute engines have shared reset domains. That is all there is to it. I.e.
everything from TGL onwards. That includes RCS and all CCS engines. So RCS +
CCS, CCS0 + CCS1, RCS + CC0 + CCS1, etc. Any platform with multiple engines
that talk to EUs will reset all of those engines in parallel.

There are w/a's which make the situation even worse. E.g. on DG2/MTL you
are not allowed to context switch one of those engines while another is busy.
Which means that if one hangs, they all hang - you cannot just wait for other
workloads to complete and/or pre-empt them off the engine prior to doing
the shared reset. But there is nothing that makes it better.

I assume we are talking about GuC triggered engine resets here? As opposed
to driver triggered full GT resets?

The GuC will attempt to idle all other connected engines first by pre-empting
out any executing contexts. If those contexts are pre-emptible then they will
survive - GuC will automatically restart them once the reset is complete. If
they are not (or at least not pre-emptible within the pre-emption timeout
limit) then they will be killed as collateral damage.

What are the workloads being submitted by this test? Are the pre-emptible
spinners? If so, then they should survive (assuming you don't have the
DG2/MTL RCS/CCS w/a in effect). If they are non-preemptible spinners then
they are toast.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Main question here was, if this fix should be applied to all platforms who has RCS and CCS both or just LNL/BMG. Reason to ask is, only LNL/BMG are hitting this issue, with same tests PVC and other platforms are not hitting issue which we are addressing here.</pre>
    </blockquote>
    And the answer is that yes, shared reset domains are common to all
    platforms with compute engines. So if only LNL/BMG are failing then
    the problem is not understood. Which is not helped by this test code
    being extremely complex and having almost zero explanation in it at
    all :(.<br>
    <br>
    As noted, PVC has multiple compute engines but no RCS engine. If any
    compute engine is reset then all are reset. So if the test is
    running correctly and passing on PVC then it cannot be failing on
    LNL/BMG purely due to shared domain resets.<br>
    <br>
    Is the reset not happening on PVC? Is the test not actually running
    multiple contexts in parallel on PVC? Or are the spinners
    pre-emptible and are therefore supposed to survive the reset of a
    shared domain engine by being swapped out first? In which case
    LNL/BMG are broken because the killed contexts are not supposed to
    be killed even though the engine is reset?<br>
    <br>
    John.<br>
    <br>
    <blockquote type="cite" cite="mid:SJ1PR11MB6204AA1AFB30BFEF7EBAA3D281032@SJ1PR11MB6204.namprd11.prod.outlook.com">
      <pre class="moz-quote-pre" wrap="">

Thanks,
Tejas
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
John.


</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
Thanks,
Tejas
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Lucas De Marchi

</pre>
            <blockquote type="cite">
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">+
+	if (flags &amp; HANG)
+		return true;
+
+	return false;
+}
+
  /**
   * SUBTEST: threads-%s
   * Description: Run threads %arg[1] test with multi threads @@
-955,9 +966,13 @@ static void threads(int fd, int flags)
  	bool go = false;
  	int n_threads = 0;
  	int gt;
+	bool has_rcs = false;

-	xe_for_each_engine(fd, hwe)
+	xe_for_each_engine(fd, hwe) {
+		if (hwe-&gt;engine_class == DRM_XE_ENGINE_CLASS_RENDER)
+			has_rcs = true;
  		++n_engines;
+	}

  	if (flags &amp; BALANCER) {
  		xe_for_each_gt(fd, gt)
@@ -990,6 +1005,15 @@ static void threads(int fd, int flags)
  	}

  	xe_for_each_engine(fd, hwe) {
+		/* RCS/CCS sharing reset domain hence dependent engines.
+		 * When CCS is doing reset, all the contexts of RCS are
+		 * victimized, so skip the compute engine avoiding
+		 * parallel execution with RCS
+		 */
+		if (has_rcs &amp;&amp; hwe-&gt;engine_class ==
</pre>
              </blockquote>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">DRM_XE_ENGINE_CLASS_COMPUTE &amp;&amp;
</pre>
            <blockquote type="cite">
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">+		    is_engine_contexts_victimized(fd, flags))
+			continue;
+
  		threads_data[i].mutex = &amp;mutex;
  		threads_data[i].cond = &amp;cond;
  #define ADDRESS_SHIFT	39
--
2.25.1

</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">--
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
</pre>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------rek0wkfZJxJR1KAL001gjXwh--
