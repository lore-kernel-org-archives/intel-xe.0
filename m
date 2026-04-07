Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFADEDB7CA
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 07:58:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9171610E345;
	Tue,  7 Apr 2026 07:58:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TSPJL4OK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69CFA10E35B
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 07:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775548712; x=1807084712;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3Lj/11rR9poAOPrvV4+f82vn/5R/wkBfMGYMLtdjrOM=;
 b=TSPJL4OK1aG6z2IPDXSDbeyuL+ckl7RavmiiZTNKKfLWxJhSMWqHPlgd
 5aQJeoMXr5NUldPL+6MVoIZI07Qrm1FmH/B6k22dsHmJt7SwCB5zw5Cby
 ujyPJRqPYDOx0/beW447s4xoTGbPUJSwSXJBKyus8Rvgy0AdprfCf1wux
 Db4ELD0fvUNInCw7OvrPz1snAPPHaiK7OkBO9hE8P4/EOw/3jXSOnnEef
 W00p3ltmumSVU141pkGZoslv0Nl/pT2nSicM7M2FwiipBauWCzagTLEh9
 bNeMT/s0DkCjmTcV+0AYcEuw9s1dp8tqQSzhZLM8Bj6GX3l1hEwlH4t8e Q==;
X-CSE-ConnectionGUID: hiSdl19sSbuvEDtEfLliww==
X-CSE-MsgGUID: /IA0ewsKTZ6UVqc3mjb2Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="64051479"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="64051479"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 00:58:31 -0700
X-CSE-ConnectionGUID: zMMHE6MsTJCKKDRN44z5hg==
X-CSE-MsgGUID: vG2kefyjT2mDEB/vANyNsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="232976022"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 00:58:31 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 00:58:30 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 7 Apr 2026 00:58:30 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.5) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 00:58:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bJPUA6zgO8PVskMjJ6LULViBOzY2xyhDE3k7n077mbvTtPQfTWX3OrfvKBV7zc6zbQ3+kuFhfHex9eV9/d1Y35o80xU3IajP+H0zkYAgr6QFq7ralUY1+dVBixgHxkhw5yCKm672h1eLlnevtqu87ncINXxGX4zuOi24pRBtgrPSp3rNscBTIRJ21osb2PYkzIY9VoTX7Jeee1AopMHOfEDqBoTMqemaRHLPg+JYQCdxDSHXvw1yVFB6/bU7u+kc7mVRzJlfIP3VtOG3Mr4nOFI3OWPV8/OPdUa0gxilI08QvqseAkPXI5fVgM/S6Q8hHykerGqb5Z3sAV2zc5x9XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WUHWXOEz6UKKZBmLMttodpZWY3+bEA6FRsf/qrLfbh4=;
 b=nXB0615f64u9TZWRMBTobEuceEQTw88GweZSCDYPZtEZR34avGo946srs13FSkvDvCSZ+5Vkeqyh0Tl/F/gXisrp4bltwdTTd9kkuptxNLL0gWHh/1iz8xE8Zsk6xKaOsnzeVR3u07u8uRk+y7PNOS+Q2KhchNmUVFKRyZAzczikR77QIvVvV3ppQrCt3NMxbZ+Zfj1f9caOqEHI6qTgeRPS66stVKZBXX0Ze+bTq60P7yiSCH7NHfrdWB6o410HYiMB8u2TM0pUzcbL7BsCMr8Od2ao+Id1EeJ8RJd1WN/9B2Q0XTXRg49KblwkOpZK+VenJdIWyD5S6Z7aFBt8cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA3PR11MB7434.namprd11.prod.outlook.com (2603:10b6:806:306::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.14; Tue, 7 Apr
 2026 07:58:28 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9769.016; Tue, 7 Apr 2026
 07:58:28 +0000
Message-ID: <4e78f363-7577-49ba-9652-68cb81a5fd4f@intel.com>
Date: Tue, 7 Apr 2026 13:28:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] drm/xe/xe_ras: Add structures and commands for get
 counter
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>
References: <20260320102607.1017511-1-riana.tauro@intel.com>
 <20260320102607.1017511-5-riana.tauro@intel.com>
 <aczQQLhRCPdifEpA@black.igk.intel.com>
 <bf1fe076-deee-47b2-ba0a-682a664173d1@intel.com>
 <adS2D9Ea2DQZ-YdG@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <adS2D9Ea2DQZ-YdG@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0097.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::15) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA3PR11MB7434:EE_
X-MS-Office365-Filtering-Correlation-Id: a9e898e2-a6d1-4123-9d39-08de947b73a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: Do5YkuZV3EStM6vZUuURGXCCjWWng1lEBHHDRGsdIRTcq5z0nPOGQNfqmtE6pEKEBB7jUO8UisYSe+Z8HIksvqo6Ng9cMS+L3LOEfTwp/htqFnenc0mcDjYImtw9FZKCGAwX/PdVczyC2z60jVvQ68P2AsDZBzAs1CfIyot2JUyZBgRece0Y6o8rI9med5arFnLhBDixFKW4e00Cf8sB+wq17mlvZDQz4Vj46G0N/7AI0fw9xu5/j6EPqQs+owbkgKiLdbTCBGWnbHa0ZPqxSSyTeHKOBtfKbNLcKLyZYCILfISfjrjgKllT0eVnIDvW2ttWkfDLFm0YQkfVbGMF3LcQXQwzQZxxgIGXxBhRg/jOUTltU3pusrnegdR4/n+oIpwBXIYVjEUDud0eLaNsfnUERLBH/MPLCO100XzKFBa+c9j41ygfxtT6jH00qzCMYkBHcQNkuN7pY/EVlLgaM8R9FwR3MLwIWwNphH/zsNCcSLjA7QKVL9B2r8w6cb7dZulE6IZH7ZxuT8v5rJp+AOGphP1movWcCkWv9nDMR85Q09nKxb8SsG0SGkF+6xf6GOwi9nfPO1m5KPeHAsif4zMSyiFPkdaxxArKmZbWjLuVBgVFLcENVwqBea0GYWFuBap14EmRBcB8HNLVat+ZKL0+GqfsM2aw/HJp6+Cg0RA4yrDTZQXiQo81PhrvQHvHxBJT3XhJUDagD/In9NJXOQ6pAqXnx7GJk+Lhq4b/3r4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkhQVTdhRXA0b3VDY1hsdXNGY1hkUmRaa1VrMUVldVJUY1hzU1prY1JGZldj?=
 =?utf-8?B?K3hkYmIrdzI1b0dvNEsrdk9yV0pPc0dUWHBTUDlKTHVVb0NsVEhCVUZiaDFT?=
 =?utf-8?B?L3pDd3ZGTDhaNUlGc3dKMFVvVHJmNTUySk8vUVIwbCs3bVZHMmdHOXNzTDE3?=
 =?utf-8?B?dUJBRk1rU254YjJnK2kybnd0VzViQjdJS21wOW1WY0ZnTUkzQVVkejZYeTR2?=
 =?utf-8?B?M09rZUFsRVRBbWdZRUE3aGNYRVR6MXI3T3hDdkFnRHRoa0szMG1UdnFteFFT?=
 =?utf-8?B?VnZuQTJLMTBobVkvVk9GVmt6TTMrc3JQSjZvQVBYTnBqQ0ZCZFdOdy8xSGhk?=
 =?utf-8?B?Zlc3dG1ueDllMEk5dFRyVWZVSlg3R1JwTm05UEdLZzQvTHlpR1NVZEVNM2Fy?=
 =?utf-8?B?bVd6MWFpNVRaaDJXS0t2N1M5UUp6bnU4VmVVbFpOcWgvbTdWMUMyM3RaVm5K?=
 =?utf-8?B?TkpvNkZhaHk3SmVBemtaaVVDSWpYbVFIazkzc0hISDlGTUtMU1VlZ3pnUlQx?=
 =?utf-8?B?M0Fnb2xmYjJmZ3MvdUNzR2lqNm1pZkFxY3k3MkxyMU5uMmduOHRERHpWVnlS?=
 =?utf-8?B?aUw5d2lTM3ZvR2Yxb2RDdTNSOUxNSGE5Z3pvWUgyOUpUOEZnY1IyNVlWcFdL?=
 =?utf-8?B?cUFpMlBxSFMvTjQxN1VaV0tPQ1NpdVlwZ3Z1dDdiQUY0cCtzQTdoYndVdytV?=
 =?utf-8?B?OE9KMDQxNS8wOXIwYWxWRVNxejJwZjRFcm5xejUzenQvZmY1cHI3NFZlMVZJ?=
 =?utf-8?B?RmNXbkJPZW5ONGxpMjdIQVZKdE10TmlPUjJIeGVBNFpNV1czdmFSRVFJaW8v?=
 =?utf-8?B?czhlUEl6U2N0N2dRL0tZb0RuNlYzMDc3M3g3ZzBvWmczc1Q5ZlUwd1JuUGFL?=
 =?utf-8?B?WHhlb1MzWVc4YUI4cHdwNkVSa0RxcGR1dXdReDVkQUVxSzRleHF6TWEvaGxx?=
 =?utf-8?B?TllSUnlWVTh3VUkxd1lOR2FvWlFsNXU4THNSSVBEN0s2eUUzbDF0Yi9YR0hX?=
 =?utf-8?B?TEtWLzQyeHU5SE01VmlLZUI1RFJrNGduenBOZnRaNmpFMEd2anVOZm4wNGFk?=
 =?utf-8?B?S3pqalFrb0h6QWxHRzJtSWxLNTdUcTRGZysvQ1FYeWZWVll1WGxjNE5kZ0tH?=
 =?utf-8?B?NndVV0U3ek5ZdFF6VXNLRjRucnlmaEU0bUhMY3cxQ2oxR3E4OFZvRnpvMlF2?=
 =?utf-8?B?UXI4cG5XSnpqS2R5YS9pNGhFRTFMZUwrcnFrMm1DVjNsV2xqeGFqMkVPVkZq?=
 =?utf-8?B?Vy9Wa3BPSU4wdUsrbkhxNjdnMktCUmJwdmRwWlJvRlFSc3Q2Ty9CUTdnbFZn?=
 =?utf-8?B?TVM5dlZhY2N0TVhUcjI0ZElTTXdQK1Q2d1V5Q2l3WWhOV1FLT3VkcG1WakFq?=
 =?utf-8?B?Q3VGNWFVaE42Q1p4OEsxZkFybTFiY1c1SlhWaU8xZGx0SFd4aG9aR2sxS0Ri?=
 =?utf-8?B?NHA3d1luWEtuc0ZwMFJZRERlTVJ0MjFtWExoQkt0R0JMT25uOHM0VmNCMFFQ?=
 =?utf-8?B?WjVJeVpxMUZTMjFKc3ZCRFRya1F2eTh6bUJOd2g5OHFDUEl5VUZibFZaaXQ2?=
 =?utf-8?B?ZHEvQzJ1Z1JkaHkrV2ZVT0w5SGNOS3NsdmhnVldrYzdiK08vc0lDZGdXdGZi?=
 =?utf-8?B?N2piSGRwcEpmT2RQVUozeGRZWHduWHhaZXpCTzU1MDlKWUI2N2taNUxxZGVn?=
 =?utf-8?B?MzZKRHducUlMTXMxTHppQjY1dXR3NkVUMWFXYlRZNDFkL3VaVDVwa01XYUh2?=
 =?utf-8?B?UWJUakNVZVZaVEhJZzFQSm9SK01kOWUvSENxa1NjL2xwSytiMERQZFBJQU1s?=
 =?utf-8?B?Z2lGK3doVFZJTU1SRS9SaDQ0K1VlYWJibXVQejJ5ZEV5Qjc3UW5mRndIYWE0?=
 =?utf-8?B?ZUtMNEdHMW1YSU9RUlYrVnNFSER0VytiUFFabldpTW1tQXZFalZUOThkUi9X?=
 =?utf-8?B?V3NSZGdOYlhxQ3NwNU9aMmQzcUtKcEFiSWFKYzNvbDhodmx0cXRocms0SDFh?=
 =?utf-8?B?TnVuczJEVzQ1TGRyMmFrU0NONVRwUVNVQVRQVnVrY2lDQ0Y2RW1rQUJsRU1x?=
 =?utf-8?B?LytLSWZMUHpZS2VjWkY0S0tSSzRZMVk5VWRzNDRuRy9ScEtyTUxyOWMzYXZz?=
 =?utf-8?B?UGYzZkpLdjhoRnRTcHBGMTBkZUErNjBwSWgxRXJpUFNSU2JadEZBQlNsdXR0?=
 =?utf-8?B?U3BSYmFGVlFsNkd0N2dQSlJXdlZMaFVBbHFoMEhWTEcrSmhsSEpvS2F5ZkZm?=
 =?utf-8?B?eGNGRHBQclF6ZEd0OWkxUGNFczZCdTlBR1E1M2ZYdzVlTzlhNnF4QVU3aWxp?=
 =?utf-8?B?L0g5L20rRks1S0dlV2tEbEMxcjFRRm5mbnFRUURCVUNWZThFQk5pdz09?=
X-Exchange-RoutingPolicyChecked: C/xR5sGVAMBnLBd505qScnpx86D0OaX2AOzIweAuE/nvb3U8v9TZBaoFddMa7xqnqZ6G4BaibNfuiMfFP68VvUWrqwueqUQ3en4uDjXLzc6t8R5T3BIBNFa7HHE8c4A18/8zHRDz/ddB9RF6cnMEvnlDJ1CtcCVUv/tj+vp5LgOJlfJywsqTgK1kLuPjcIi9FH+LgjkqubKiZoAHbu5GHp14Ybs082HKR1fAvnHFxHWd0CVPik5BUmqR1O/yBDZS+6EdXD+Gol8CEqyp89LTOY3TmiOlT7l0UFXVF+oA6XXW7hKt/IgmnwWN/GVPRL9Q2ks3HMrXbQGbNxIr0vL7Hg==
X-MS-Exchange-CrossTenant-Network-Message-Id: a9e898e2-a6d1-4123-9d39-08de947b73a9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 07:58:27.9504 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TBYm7/RxvD5ZNyVsIxgPE1IyMH38hfivpGRrGdc5v+T+//C59Mpu41+WJU+V9WNYXsvI/F5D6H+jRS5xKCIGqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7434
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


On 4/7/2026 1:15 PM, Raag Jadav wrote:
> On Mon, Apr 06, 2026 at 10:53:13AM +0530, Tauro, Riana wrote:
>> On 4/1/2026 1:28 PM, Raag Jadav wrote:
>>> On Fri, Mar 20, 2026 at 03:55:59PM +0530, Riana Tauro wrote:
> ...
>
>>>> +	/** @flags: Info queue control flags */
>>>> +	u32 flags:8;
>>> Why not u8?
>> flags, compression type and reserved are part of u32.
>>
>> It's in-line with the firmware definition.
>>
>> Also it is not recommended to mix the types if the bit fields belong to the
>> same type.
> By who? I thought it was just matter of readability since we already have
> __packed in place? Anyway, I'll leave it upto you.
C specification

"An implementation may allocate any addressable storage unit large 
enough to hold a bit-field. If enough space remains, a bit-field that 
immediately follows another bit-field in a structure shall be packed 
into adjacent bits of the same unit.
If insufficient space remains, whether a bit-field that does not fit is 
put into the next unit or overlaps adjacent units is implementation-defined"

It says it is upto the compiler and is implementation defined.

Retaining this unless there is an issue.

Thanks
Riana
>
> Raag
>
>>>> +	/** @compression_type: Compression type used for this chunk */
>>>> +	u32 compression_type:4;
>>> Ditto.
>>>
>>>> +	/** @reserved: Reserved for future use */
>>>> +	u32 reserved:20;
>>>> +	/** @checksum: Checksum of the chunk data */
>>>> +	u32 checksum;
>>>> +} __packed;
