Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 396F6FD8FE4
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 17:49:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8E2610E97D;
	Thu, 26 Feb 2026 17:49:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a6KloDEl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E05BA10E97D
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 17:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772128189; x=1803664189;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qa+4EurAZNkIsDCXC4MQoA86bswsrDk0S8gR7HCoJkc=;
 b=a6KloDEluuUPgs5/wLIh7eslN3J54OIS+pf5zWsge0pKIMFYLZgsgzav
 sqKZOIkUI2GIE8pVBKhNWxGGHNzFEUh3XR5y0WOCc7/UoyafYmCpu5uGi
 XqnDrZxgTAGzaJp9di+5P3fYgGElM9CBDf9oQWDoB5X8QCWB4zi/ToABT
 NbldATrMt22kJhPjgfKfr0E421ogO+n4OenenLrGisiDpQ7DlUrblSCmz
 MNrjLfkqOv/K33anrS90FXeVUIE1IOv9zWL4D9+yf/+JOxcaYToSXhuJv
 bC/Tcz9JTn54ipZGvdjoekGm0izIVRnK8V+ghSFVrARkF3COm+dA3MMre Q==;
X-CSE-ConnectionGUID: krVsDSAwTgS7LyjINSogJg==
X-CSE-MsgGUID: A9pms7qRReGzDPwsTYhBHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73108106"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="73108106"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 09:49:48 -0800
X-CSE-ConnectionGUID: ZX331GaKSE6xFy8jISH7RA==
X-CSE-MsgGUID: qYG39SVVTbW5wBu26lWkwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="215339874"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 09:49:47 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 09:49:46 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 09:49:46 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.60) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 09:49:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OvI5M2Gr3M/QhJqW7vGqtL9owrcgkOHxGV3B0EAN9mKUSssdpRJChFlz9UDiL3LKAp56GREGLP0XaDTsNjQYMReqRuCfr20KI4EZeMU0l2dxuB1O1mO3WO23YdNF0/7laSA+y33PQuez/ywnbQ0ku4l7F4E327muvwd3CVwRh0VFl7Z82PRPUsKJvMDk5WsQLkWvuvyDm21R4CadrSSUPCoOLGonkqQwbuPePn732R+mn+YA9PNT0rYYij61MM7D4ovtQBKY2yJ9nrkqY/pxmPn3cwg5pWNLbXWN3OZS8QNyOUEqiwTLdgcR+0iQkrlkaWJKsMzbDSSVeguP/2Na5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ewLSL05Df5Z4LSB7uXsr2UWbgqpZ87XWZfwf2Av/Wq0=;
 b=rhb+HW521gA2fNsYVfRW9MhTOkJi9r322FY8jeB3GLmtQQs4qkKjdLSnoYs1/M9Hqg5FR9KkLHvo/9QcNgoPCIN2LYZBTAp3L1tieXaM+wAP6KEKKv87iA3dkbC4NHi4bl3dTCXXbfsjo13W4RYnU3Xa2DbV6Z2KQdvM9oacF+YoBP072gpAtG4YsLplawDqV2B0Gr9mLA2ZgxWeNabOyOkGkMeNToNUp3Os7kaCOMcREKHaxfowXts5Im+3/9y6iEvigFNxxy2ex1NthtbmNrJKRtQAay7dOe3eeowS/qNKXk8hCqjE4q3HfiIoPCdVrgYq6mZF7pr8RjUEWvSL1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DS7PR11MB7737.namprd11.prod.outlook.com (2603:10b6:8:e1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 17:49:44 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%6]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 17:49:43 +0000
Message-ID: <0d8f2c26-e2e0-4de8-a788-2859344ccd40@intel.com>
Date: Thu, 26 Feb 2026 09:49:41 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Do not preempt fence signaling CS instructions
To: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Carlos Santa <carlos.santa@intel.com>
References: <20260115004546.58060-1-matthew.brost@intel.com>
 <q4f6zwko4q6337m3ap244j6q3lfqqrkmlxq2l5ojgcbensliaf@yj7ndeqnrvuz>
 <aWqn/eXaw2t9j4fY@lstrano-desk.jf.intel.com>
 <5nddlxy5z2naxxoz7jnyhpwpv3pofv57fuhflcjjwhxell5ozg@xmrhis4b7hhf>
 <aW/vdvCw/3DZwfpt@lstrano-desk.jf.intel.com>
 <ftzvlqcyj74d4bh25mreg64f647jintfteo7apctrnrsjgqbjs@k2ulohn2ycsg>
 <3ropzjiwoal64zajsgyba3nefzmntbvsk6oxp3pv2li4nfobiz@3gsjuhsuhkhn>
 <aXkc+DtEtRWSRAyk@lstrano-desk.jf.intel.com>
 <aaCEfObwLbCrN/3W@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <aaCEfObwLbCrN/3W@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::11) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DS7PR11MB7737:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a032bf6-14d4-4fa2-4915-08de755f6c8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 0fkA/CeujvMCPPgojvvo+654arNjsv7ZZFfK164fLy7RtMk6LUpUlv03vdCF6l9kEDtkZjIrPq/kBBPAIuSCWEH7nQ/nUmcrG+wiD3J4UsNiRHwmJyNaf2trJQb09m47N0SiZKqDTgfwhKjbjVkQMEncTCkVXnIU/vjenNmOZE5sZ2cGhtoZCmtx9yYwYEafKzx28QL4LzYBx/5WbGXn9WQM5TIaYnHYGN+0B9QLZ7j2CylKlU1EUdNz3yJ97f7puiK30wVMCekVpJP6ReArwep/7DH8+scRAFh2lQraT3x/F8Uab3xh8FM47E5tVCsb5h5m7ijQITIC0aM/yPHhzDVOS6kslMdxG4iMJPFmja3nPhPyL8M9x13RQSLvqDS6iIJnW6uZUsKvyf8zsIXxhdEuOzORBHUa4PcbQ5njiImfiMJYqSz1BjdSgBd/DwUaTEmAOXi0sfUSETh81tC7GxcqumnlXFQne9zIzpS+aM8SupSTz8h9trfHYW+ynTVPEl6x2ufIZoBEr52kCzVwt1XQmSKciGvtCHQ9MSYFQ/ust658vAgVS3cfV5o5cefZMxALqceS9u6/jEKTNY91vVJl8yBkwKKxqLZzfZBuzrWjkdXxPaI0BnA4trC1Zho004N6iWEItYlimPX0W+PcFOePXxE0eOdkMSOfQIiATJmBot9JYchq2KMWLLbRS7aL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1NONkFpYUdlaVBLa011ZUlvRVBjbjRHM0hHNmN5citibWJJSEpOOEtaakoz?=
 =?utf-8?B?Y0liVkZ4d3VwTmRLUk5nT2w2bXZOYzMzQm1QSVA1SEdaYnAyRTEzT3lMaFN5?=
 =?utf-8?B?aFVGL2ZxVDM3VytndklMY2JCcHVEVi9UbDVDMFpnU3pRaTBzY2I2SHQrOXkv?=
 =?utf-8?B?cHhNM3h1aHFHYm9xdWZ5d2RLUldUL2ZxcXg3aEswUm1VSHI4RTRMWWFKS1Aw?=
 =?utf-8?B?cnhFK0lGclQxRzBwYkpHNTVDM2dBckJYZDY3NUpNdEErVm5ZbEttSWE3YzNO?=
 =?utf-8?B?emF1OE9xMVpxQ0M4OHlIelVkUFgxd2pHeWZqMlRBcmVaQ0JFYjI0aUU5eFAw?=
 =?utf-8?B?RXJzS1UyL3UzeFRmT1krbGdpYnhFUk5iRTZIeXdjQXJjY1VaVkdJYUJpenVF?=
 =?utf-8?B?TW93d1pSemNTSytSTEs2cXFKMHQ1V2ZUai84eFZxenlqMzlIU3BYSnVBcVpv?=
 =?utf-8?B?aXRxUndlU0kwQlE4WWR4cTQ5d3IvcW42eU1VcVdLbDBKcWtqV1ZMWFJjUDRm?=
 =?utf-8?B?VWVzUE5EcG1TK0Y5Q1ZHUHBoUm8remhEbFRCVkVaRnl5bHhNdmhrUTFldUdV?=
 =?utf-8?B?cVJrS0Z1WDFQT3l3Ri9TdkFqM0pYOVB2akpna014a0RGRmZhWVFqVTlpRlF2?=
 =?utf-8?B?Y0pVaDVpUExMV2VVd294L3QyS1RvbFViNHBuNmtyd2VRTWhqUXhKNjhTZzZi?=
 =?utf-8?B?U2x4cnJlVGMwNFgySTg1S2xvUzdoRHVETTE0RWRNOVZlQzQvblB5TDQ1WElr?=
 =?utf-8?B?Z05DRXJGMmF6ZGJXRFZycWUzdDFlcXBUL0cwQmJnaDlVR1prOHFUYXN1UTFx?=
 =?utf-8?B?eWV2RlJZL3J2aFBzbldYOVBIQUF1TEk2MEJzUktQMHZsQk1Mcko5UW9hWEVT?=
 =?utf-8?B?WUVUbWtkWWZyZFpvNTZPbFZpNGhSUlk2TjhBTzJZeEZoelplcFpNaERrVVdD?=
 =?utf-8?B?UDRlMndic1ZwcXNGQnVUUnNIa2tKMVNza2ttTWI4WlFueFQ5a0NXd3Z4WDNq?=
 =?utf-8?B?ZGdTZk9vTTRiK1BNVUlVaE1tQXo0OCtGV3VnTWZ3TmZBQzkxSFNxZFQ2N0ps?=
 =?utf-8?B?cnd1aE5qZnFxU2lwRmFkYWlzd2lYK1Y5LytnOWRBQkVtZC9WR1llSGZob1Zx?=
 =?utf-8?B?U0J0ak5oQVNwdFlKQ0gzc2hqUEZ4ckdoMTRDMmZFR2ZTdjdnZ0FlZE1UM2JK?=
 =?utf-8?B?Rm9XdklxUFpOeXMvbHQxWDk3bE9FeHk1UlVTektpMUM4dWxGSlRLVkJWMnhJ?=
 =?utf-8?B?NmhvU04rNlBhdmNEVjNOU1p6M0dsYTQxQTBGaFd3MGZCMm9paTB6aGRRWW0y?=
 =?utf-8?B?VThkUlZ5a3BENlErTEhRc1orRWhQYjE0OUpMVjIvU0dxSEJxZFlyYnE4aTUy?=
 =?utf-8?B?MjZhTXlpSUtsQnpqY05Wa3Nia3F3YkVTZzV0RlRtWlRDLzIyendDYm9DWmV4?=
 =?utf-8?B?UVVzNHMrVDMxTWpjbGRnUXJNL0RvY21kb0hxN291R202b3RDa2hsMytsMk5x?=
 =?utf-8?B?cnIwK0NZV3FQUzhwdDA4cklYUjVnV001V2hqbkNjM3FyTjBYVGdOeXZzWkNJ?=
 =?utf-8?B?K242aDdNNzlld2ZYb3BpSFVHYjdxbjlpSVNnTlJWc1p6RGpNOC9zL3ZTUlhr?=
 =?utf-8?B?TW9MM0kyOXVBUlBDbjFmNGZuYnN6dzQ0di95S28rTllweEFWN1llRWFnM2Zn?=
 =?utf-8?B?R25KL0g1c1NyYTFULzFDamNQcVJEa0tVMUpLUmsrb3ZGRCtDSWx1Szg0UGFL?=
 =?utf-8?B?SjJQbHN2K2lxRS9HZWwybi81RXpUTXhUdXdpendVZmp6bzNQZjNjVDNITjlR?=
 =?utf-8?B?ZU10dm51QWpRSjJCa2FlMmlRSGYvK2ZRWGNvVGNaOXpBVjltd040UHlvM1pL?=
 =?utf-8?B?Tzc0NjU4RVpra202empFUmczaC9oaUhpbDZLQWgxQ2Rpck5NSFMwVllpUkYv?=
 =?utf-8?B?TnZXdnhiMDgrQjIvektyb0M5OHBkODZXWlVLNi9EZm9zRWJIdndiSjhtYmxC?=
 =?utf-8?B?VjQvY0k2QXdLVGpEbFN5Wm9RMVh4MDlWYW5XY2lBb3g1Umk5aGREazl6UkpF?=
 =?utf-8?B?b2R2L0RIakdLV2Jmc0pHL0V4OTh4QjIvV1VFTHJHUE81SGZYYVF5OTNYdS9i?=
 =?utf-8?B?VThyb0tWS3E0azl6V0pqUUlIalNhZGRRR0kwb2lSeGZNek8zWU9ZUlRHZG9q?=
 =?utf-8?B?bnZpdWVqa0lwSkF0dXhEVThwS0plQnVvK0M0elBHbVQ4VmRJUTNiL1VnenNq?=
 =?utf-8?B?VzRZTFJPNk95LytNaU1WV3BVMFNDcGMxeCtiZEtFRisrNEhSVlVuKzNlVGVK?=
 =?utf-8?B?U0FMQUYwSXRmZ3FVV0JsREJUanRadUhzMFNROXpWWEhkcUlYdFhyTHd6WWt3?=
 =?utf-8?Q?fRsTOrhRTlbiiHxw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a032bf6-14d4-4fa2-4915-08de755f6c8d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 17:49:43.7967 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cm4P7GL8HquttbaMybXS9fbqwu93d/JrsnfW4ClsTTRuWgKObCzx4wdcm2G5H3gd/RYwP3GlYJl3KJn84DnQEt6DeiLpqQ1nujYNfbfQl5M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7737
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



On 2/26/2026 9:35 AM, Matthew Brost wrote:
> On Tue, Jan 27, 2026 at 12:15:52PM -0800, Matthew Brost wrote:
>> On Tue, Jan 27, 2026 at 08:20:36AM +0100, Zbigniew Kempczyński wrote:
>>> On Thu, Jan 22, 2026 at 09:44:14AM +0100, Zbigniew Kempczyński wrote:
>>>> On Tue, Jan 20, 2026 at 01:11:18PM -0800, Matthew Brost wrote:
>>>>> On Mon, Jan 19, 2026 at 01:01:34PM +0100, Zbigniew Kempczyński wrote:
>>>>>> On Fri, Jan 16, 2026 at 01:05:01PM -0800, Matthew Brost wrote:
>>>>>>> On Fri, Jan 16, 2026 at 10:45:39AM +0100, Zbigniew Kempczyński wrote:
>>>>>>>> On Wed, Jan 14, 2026 at 04:45:46PM -0800, Matthew Brost wrote:
>>>>>>>>> If a batch buffer is complete, it makes little sense to preempt the
>>>>>>>>> fence signaling instructions in the ring, as the largest portion of the
>>>>>>>>> work (the batch buffer) is already done and fence signaling consists of
>>>>>>>>> only a few instructions. If these instructions are preempted, the GuC
>>>>>>>>> would need to perform a context switch just to signal the fence, which
>>>>>>>>> is costly and delays fence signaling. Avoid this scenario by disabling
>>>>>>>>> preemption immediately after the BB start instruction and re-enabling it
>>>>>>>>> after executing the fence signaling instructions.
>>>>>>>>>
>>>>>>>>> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>>>>>>>>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>>>>>>>> Cc: Carlos Santa <carlos.santa@intel.com>
>>>>>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>>>>>> ---
>>>>>>>>>   drivers/gpu/drm/xe/xe_ring_ops.c | 9 +++++++++
>>>>>>>>>   1 file changed, 9 insertions(+)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
>>>>>>>>> index a1fd99f2d539..cd645ee400b9 100644
>>>>>>>>> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
>>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>>>>>>>>> @@ -282,6 +282,9 @@ static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc
>>>>>>>>>   
>>>>>>>>>   	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
>>>>>>>>>   
>>>>>>>>> +	/* Don't preempt fence signaling */
>>>>>>>>> +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
>>>>>>>>> +
>>>>>>>>>   	if (job->user_fence.used) {
>>>>>>>>>   		i = emit_flush_dw(dw, i);
>>>>>>>>>   		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
>>>>>>>>> @@ -347,6 +350,9 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
>>>>>>>>>   
>>>>>>>>>   	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
>>>>>>>>>   
>>>>>>>>> +	/* Don't preempt fence signaling */
>>>>>>>>> +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
>>>>>>>>> +
>>>>>>>>>   	if (job->user_fence.used) {
>>>>>>>>>   		i = emit_flush_dw(dw, i);
>>>>>>>>>   		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
>>>>>>>>> @@ -399,6 +405,9 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>>>>>>>>>   
>>>>>>>>>   	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
>>>>>>>>>   
>>>>>>>>> +	/* Don't preempt fence signaling */
>>>>>>>>> +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
>>>>>>>>> +
>>>>>>>> IGT tests which calls compute-walker, then bbe are asynchronous (don't
>>>>>>>> wait for completion, pipe-control is necessary to wait on
>>>>>>>> compute-walker).
>>>>>>>>
>>>>>>> This asynchronous behavior may explain things. Is this a common use
>>>>>>> case?
>>>>>> Compute runtime if I'm not wrong uses pipe-control explicitely. IGT are
>>>>>> not doing this relying on kmd.
>>>>>>
>>>>> It would be good confirm this.
>>>>>
>>>>>>> Also do you know if render engines have similar asynchronous behaviors
>>>>>>> or is this specific to compute engines?
>>>>>> I don't know, I think Mesa folks may know the answer.
>>>>>>
>>>>> Let me ask around about this.
>>>>>   
>>>>>>> Lastly, the i915 disables preemption on both render / compute engines
>>>>>>> immediately after the BB before emitting the pipe control. Is this async
>>>>>>> behavior a new few feature in Xe2 parts which only the Xe driver
>>>>>>> supports? This might explain why the i915 works and Xe does not.
>>> We don't have platforms which supports WMTP in i915 driver. This imo explains why
>>> there're no issues observed there. I mean regardless preemption state
>>> disabled/enabled all instructions soon or later completes.
>>>
>>>>>> Test exercises WMTP and this is supported starting at Xe2+. Probably
>>>>>> what test is doing has a meaning in this case. First compute-walker
>>>>>> submits kernel which loops until it will observe some memory write.
>>>>>> Second job executes compute-walker with kernel which does some quick job.
>>>>>> But first occupies all EU's so second job can be preempted only when
>>>>>> preemption occurs and SIP will be executed. So if we disable preemption
>>>>>> immediately we submit compute-walker I think we have no change to enter
>>>>>> SIP and switch. Even if I add pipe-control to batch level according
>>>>>> to Daniele comment job it is still preemptable and we move pipe-control
>>>>>> location from kmd -> batch level..
>>>>> Does the test work with a pipe control in the batch? That would be a
>>>>> good data point - if let me know how I can change the test I can test
>>>>> out too.
>>>> I'm going to add appropriate pipe-control to pipeline and send the
>>>> patch.
>>> This change: https://patchwork.freedesktop.org/series/160484/
>>>
>>> along with your patch passes the test.
>>>
>> Thanks! Great data point. Now just need to test out Mesa / Compute. I
>> suspect they properly insert pipe controls in batches as preemption
>> points but need to confirm.
>>
> Both Mesa / Compute have completed CI runs with this patch and reported
> no regressions.
>
> Can I get an RB on this patch to merge?

I thought I had already given an r-b since I did review the patch when 
you posted it, but apparently I forgot in the midst of the discussion.

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

>
> Zbigniew - did you ever get the IGT change merged?
>
> Matt
>
>> Matt
>>
>>> --
>>> Zbigniew
>>>
>>>> --
>>>> Zbigniew
>>>>
>>>>> It is fine the batch preempts, we actually want that. Mid-batch
>>>>> preemption is not what we are trying to prevent - we are trying to
>>>>> prevent preemption of the fence signaling after the batch is done. As
>>>>> long as we don't regress any user applications we can safely make this
>>>>> change - it is fine to break IGTs which are not doing the right thing
>>>>> wrt to batch programming.
>>>>>
>>>>> Matt
>>>>>
>>>>>> --
>>>>>> Zbigniew
>>>>>>
>>>>>>> Matt
>>>>>>>
>>>>>>>> May you try to put arb disable after emit_render_cache_flush?
>>>>>>>>
>>>>>>>> --
>>>>>>>> Zbigniew
>>>>>>>>
>>>>>>>>>   	i = emit_render_cache_flush(job, dw, i);
>>>>>>>>>   
>>>>>>>>>   	if (job->user_fence.used)
>>>>>>>>> -- 
>>>>>>>>> 2.34.1
>>>>>>>>>

