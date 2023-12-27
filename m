Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00EC0C46CD4
	for <intel-xe@archiver.kernel.org>; Wed, 27 Dec 2023 22:25:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9507910E15A;
	Wed, 27 Dec 2023 22:25:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E02A810E15A
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Dec 2023 22:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703715935; x=1735251935;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=g+8b2a/C2Swnrlqq04PGicPyygAZ/mDH31j7Q3ME5kY=;
 b=VnW/0TcOn3XXniIhcYOR78CtJDlLW3/7NRbNgwWYt0XXHHPpxxyiC2AP
 RPMhLifi3eVjOemb3yiS9iN1tljQelMWRVDoeVSQsnrOZMlJy2dIHynTK
 uFcejFj0sMgfUNycDxG6m6kz4ITekf3JXImOyCqYlK0dLihTYOVpnkula
 aWaJU+KvfoSUStgMkayYKvpXegX4MWfeJPPACANrQxmzYvn1NVFgl4vt7
 UH4Vurq541Cnjk/DSzYkd3CQPP+04qaHDgOkVVVgM8AwCqxW3yRdkQ401
 qgo5er5lNGxFgIdKLn3OpPZDs+7V973Er6zsGTIvpAxTgpVT7XbH98kk9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="395378538"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="395378538"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 14:25:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="868964312"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="868964312"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Dec 2023 14:25:29 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 14:25:28 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Dec 2023 14:25:28 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Dec 2023 14:25:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BdbpaAKvSrILrnMcrgw9yuKLiIjcLiH5N8m4XW7R+1ZVsWgCgcDU8rqsUZOmmldC8QvJX4VovgNHoyj8XU1bUIu6G1XZaoiwHgxoLkE36/6PCm79H+JJu0ASmnpxqhiLN8J9nZB3wTMmi5wO/c1Qur+K0M0NCVb13aCBFYO4X4h76OjJZEu1014HKr/eGBDTRyeERizb4QxX6cZooIVGBLFXgFUimIm8BSnwrg1WZJoK/jmirSw9AlJcStZSVIsbXbDECQc7hqW0tp8tkCJwExkEennd5vlqDrJeiobkjq387o8HuRT4aM8QHz5UwApJI0/Lq8DszUNGLJSCXYR3fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yf3nbyf/6FvKyZcxZ+dpNyWM3cyD4TDeomYTVIq2L3M=;
 b=gt0OqH6kbd7X/ycjPEXfX/GC++nsRFXJ3odsPereRWuBImiJJl2umUQ4oDYcqbZiGXPA5efMsxnFtahgnf0tdFMVW261JtEWlGHMJhc9qk2xObuhxangya4dnxq3BPYIg2Bxxb1jbfNZSUsENoijlg3vKWq1HOtIPygahespJYK18583jcDedIkfRke7E+I+RoD8pslxZ6YOUBJ5Dt2vT4z+huvDxJoWfmgM2MURh+gi7B/k943IAwBdmKrzShUVM//JT0QldK+BG6o5cIertX1/Zr72uGmopgWziZxr3ICTvJBeI+8qOy/pCricQpX1csK2kX2d9BsStWgSzQe/cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DS0PR11MB7803.namprd11.prod.outlook.com (2603:10b6:8:f5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Wed, 27 Dec
 2023 22:25:24 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::73d0:f907:41e4:4a34]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::73d0:f907:41e4:4a34%4]) with mapi id 15.20.7113.027; Wed, 27 Dec 2023
 22:25:24 +0000
Message-ID: <fb0d767a-16ca-4937-9a75-d98513250d19@intel.com>
Date: Wed, 27 Dec 2023 14:25:21 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Add more GuC CT states
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
References: <20231219172824.832873-1-matthew.brost@intel.com>
 <6af59573-3925-4af4-abb4-ad7e1f40b920@intel.com>
 <ZYUi5ZdXQV+r6J7C@DUT025-TGLU.fm.intel.com>
 <c777b06d-4323-4bf4-84fd-b06334c97484@intel.com>
 <ZYydV0poSZ0fc7nZ@DUT025-TGLU.fm.intel.com>
 <15300684-55e6-48ff-85fb-fc7d3acae3b9@intel.com>
In-Reply-To: <15300684-55e6-48ff-85fb-fc7d3acae3b9@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ2PR07CA0023.namprd07.prod.outlook.com
 (2603:10b6:a03:505::9) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DS0PR11MB7803:EE_
X-MS-Office365-Filtering-Correlation-Id: edbadf23-c1ff-49d4-9f7b-08dc072ab857
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: irYl7U8bvcGTDe4qGKQcvIhJmW4HWiYBcC2UZtmKu/q9mMFHeZGJEyewrcWGFUK9ab7tG0IFAn7HWxIyya7C8W15QK7KaPKWj+7jnyJvSFEgzmbH0QSdC1bdPudT+AyPYNnU9LEqpmE/0xw19bkH1TNGAC4IF0H/B4PJ8XmZtNVndMVDtvXsr6kXjfgf8y3h9ewVbqTyGon2yf+xOZ35EpnLQGLaW8kPsZrMnsha4D+KDzDNHMwWJ1YuamK37m8rjzDlb2PmQsj3tklKnlCwO03u3QL+QyZBI9fzLWbbOiixXdwFLdfFqZlJ3zZevc3rHrM/n1IAgpo/rQSy1B00mliqMx5k8C/tza6xKOYryrlUV0AfCGhP3CN2PZ0aM54SXl/30YB/B99hED1/qGLjUxB5QHonEqCyGb3X92ax2HDpaCGuOB1O5gN/GV/B7NzWKPM/dAkkifuAHmLEk5jT56DtF+MwLPRtwmT8iln5SHH9Y0u42YLGWiHsXi+db2F4C79kymcxOx6lhZ24uYyxjGLVARCVMvZoDjFmz0qdfmjlSyoLPQVi8E8/1uiZxP7IuVDY+ih+ZZUs64mAID8lzjUXtTrcwwTyjEVQJYuKbNz9JmxyIvydie0EfIX/E8YYQhmraGp8qW0At2eqU0i4eE57Lk0FY2Z904w/iV03UIU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(396003)(376002)(366004)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(83380400001)(41300700001)(2616005)(82960400001)(38100700002)(6512007)(6862004)(4326008)(8676002)(37006003)(316002)(478600001)(8936002)(5660300002)(2906002)(30864003)(26005)(53546011)(6506007)(6666004)(66476007)(66556008)(966005)(6486002)(66946007)(6636002)(31696002)(86362001)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aitWdE5JNEhyblFmQjBsanJ6cldEb0FHYmhqNkd3Y2NINW1uY0Rkd1RGY05h?=
 =?utf-8?B?Zk0vRk9xcmtnK3BXRXpBNWo4Y2Q2MWxWOWVaZ3RqMmtSL0QrRE9ka2wzSURM?=
 =?utf-8?B?UUpJWENqYUdDQzdyNXVkaURCcFJjQWhwMXg1NTMraUlLQ3docGRkZDBuNmI1?=
 =?utf-8?B?OUJGUVB0dDJZR2xIS3BiRlJyWTFhUFpkUytKMHAvdGtqcDIxR0VPeDB1ZGRj?=
 =?utf-8?B?cDV3ZGFNanBXWjRkNEdxVU81OHcxVjcxZ2h4TDhabGwyVm5HUTFwRXpScS92?=
 =?utf-8?B?TVRlN0xUZ0VpVER5eUptZG15d200R1c2V3U5bzhXTE9jMmxlbWhSSmpFeWhR?=
 =?utf-8?B?aHRKY1lDQnkzMWI4Z3NQcU9Ja3J2WHpad1pxMjNyN2c3ZDJlQmxyeHhRMGxB?=
 =?utf-8?B?RmY5NW5wcXhmWEN6TWxNZlQya3hnYWFyRWVJVmR5MmZrTUtwRVpzT2hEVXlz?=
 =?utf-8?B?SGRJSXJndjdFZ2djSWFkVFo3ay92Zk0xdGhBdGdTWXkzM25YQmsxb3JyVWZL?=
 =?utf-8?B?M3V4TFFJdW9UT0Jkd1MzZm9DaExwSjBOOVVlaEwyZHN3cThaMWt4OS9SWWxJ?=
 =?utf-8?B?QXpyMGV1SmlNdzI0cFlmcVFvL0ZEb2p2R2hmbHVjVFZIN2dIVDNoTmpPMjZ5?=
 =?utf-8?B?NUpSNm9aUm1qL2Y5KzI0MW1FQUcxaWtIdG5ua0dmQ1RacjRJbk5HV011b2ta?=
 =?utf-8?B?QzlzTVgzdXVpSkx6OXVHeEtPeHFQZUlzS1FBR3Q2dzh6SUdTL3hnZUdXdkkx?=
 =?utf-8?B?UkVrNnIrM1RKdjREcEhyMHVkRHZHVjBqTTZFdXNKMFc2UmErenNGUGxqM3hi?=
 =?utf-8?B?VkNoRFBIZmxqbHAyT3hrQk5RdWc4NFY1dUJnNmcwYksxMHJ1cktFdUdqZ2JL?=
 =?utf-8?B?NkM1UUVlbWRDd3lkdHd1cmFVZm0vL0JSUkQ2WDZSM2wyanRZckE3ekwwa2pp?=
 =?utf-8?B?WE9JOTUwRk1qK3h1bzYvbzZmaXE1VW5zV2JWTWFkcXlxK2lmMEFFODBrUlk0?=
 =?utf-8?B?M2tRVmZFTy9TcDZyei9id1hwcHE2d3laUjdaTENvN0diTDdSVllBT2pUNWRH?=
 =?utf-8?B?Z0R1ZmZiNDY0YnBXbEFtMmE3dDdTd2EvUGhDQUhaSUpyWGJNMitPYTFzWWda?=
 =?utf-8?B?OGM4bzlGV1RrYTNtTGJxWUtDMFdzNlZWL05xeFBVRllURy9FNXZtcWRpQ1F5?=
 =?utf-8?B?TndKRTVib3h5cmZycmxzNjYvbUpqbUxGcVBPMk5iOUJHMlJVVTdTam1zTndI?=
 =?utf-8?B?VnI0NERxR2Z4ajRHTnFvVWh0ampsTi8xcENwZkk2b1NFVDdKeHFoN3dwVGNh?=
 =?utf-8?B?c0wxc1hxcjdTcEtPWG15R0RUcStLRlNhWG1tUEltUW5DU1hwM09hSU5UL0g0?=
 =?utf-8?B?VGVwb2srcnE4dENYeDZaaTBaTFdURTB3cmtGMHVyQmtianF4cGRSTzlIaWpL?=
 =?utf-8?B?S0hRSHZLelEwSHB6Uk5YMXdvY2hnTUNMa1FNempNelNsbXphdFBqUjdTRlhK?=
 =?utf-8?B?OFVTdG0xM2FxL3JPek1FK1ZrZUwxQ3dZMTNhQWRkcGczTE9OV1BmRnhsQWtW?=
 =?utf-8?B?ajFURmpDMUpaQ0xRWHRTT2xMMlJtUk9qRXdETFFLS3l5MDlKUnR6NlN2VlQr?=
 =?utf-8?B?QTVjSjlKd3A4ZmN5VlN6WDVDSkFxOXM2WWswRDZiL21RcWJja3dQSmlYdmhI?=
 =?utf-8?B?Sy9wdGNiSjJKQ2dnd3JlOFlvYXFlSVVaTm4walhzQlBFZFBKdTVqeWtLYS9G?=
 =?utf-8?B?emo5bUFxMnpYbkZib3YzdjRTL0ZrZ0NsVnoxMTdRd2N4ZUsxTkMvdzM1bFZU?=
 =?utf-8?B?ejFmSU9jZ0VLajAzaU9HM0o0OGViMnhyUU1hMnIyZVFFc0orOUJXY3dVOVBO?=
 =?utf-8?B?aXp5Q1F4V2Rna3E3Rm5LM2ZWRVllNUJ0ZCtFelB6akhVZ2NBTk9haFN1bkF3?=
 =?utf-8?B?TUFIOXlFd3EvQ2locTJLSWs2SlpQOE9lS29rRmVQQ2xKdjNGRFNrVENZNVd4?=
 =?utf-8?B?OVpKb21LR0VFVS9BODV5aCt2TUd0c3N1Mm9YSXVMNklwTmFtWTdvMHBJNUVI?=
 =?utf-8?B?WERyQkVhMmV4NFRzekNEKzBrWm9kMUVubWhjQjRqUVQzaUxsSFVvdXJwWG80?=
 =?utf-8?B?dkdMeXFpRDN5LzZpTURYTDJma0lNVWp5ZTRoNStSSnMrbGgwSlp3eVpKc0l4?=
 =?utf-8?B?SVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: edbadf23-c1ff-49d4-9f7b-08dc072ab857
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2023 22:25:24.3813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i9fdg4qDQrU7WIQ6CQ5lmjIiNpKxO87UgtIg8A+lIB0PaSj0lWdtSf5PFETrA2fmtqxlXwkQ3DFUXji0F8hNwIQLnIe+cTDEYOm+PJColyo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7803
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 12/27/2023 2:20 PM, Daniele Ceraolo Spurio wrote:
>
>
> On 12/27/2023 1:55 PM, Matthew Brost wrote:
>> On Fri, Dec 22, 2023 at 11:36:28AM -0800, Daniele Ceraolo Spurio wrote:
>>>
>>> On 12/21/2023 9:47 PM, Matthew Brost wrote:
>>>> On Thu, Dec 21, 2023 at 01:56:33PM -0800, Daniele Ceraolo Spurio 
>>>> wrote:
>>>>> On 12/19/2023 9:28 AM, Matthew Brost wrote:
>>>>>> The Guc CT has more than enabled / disables states rather it has 
>>>>>> 4. The
>>>>>> 4 states are not initialized, disabled, drop messages, and enabled.
>>>>>> Change the code to reflect this. These states will enable proper 
>>>>>> return
>>>>>> codes from functions and therefore enable proper error messages.
>>>>> Can you explain a bit more in which situation we expect to drop 
>>>>> messages and
>>>>> handle it? AFAICS not all callers waiting for a G2H reply can cope 
>>>>> with the
>>>> Anything that requires a G2H reply must be able to cope with it 
>>>> getting
>>>> dropped as the GuC can hang at any moment. Certainly all of submission
>>>> is designed this way, so is TLB invalidations. More on that below. 
>>>> With
>>>> everything being able to cope with lost G2H their is not a point to
>>>> continue to process G2H once a reset has started (or send H2G either).
>>>>
>>>>> reply not coming; e.g. it looks like xe_gt_tlb_invalidation_wait() 
>>>>> will
>>>> During a GT reset xe_gt_tlb_invalidation_reset() is called which will
>>>> signal all waiters for invalidations avoiding timeouts.
>>>>
>>>> So the flow roughly is:
>>>>
>>>> Set CT channel to drop messages
>>>> Stop all submissions
>>>> Do reset
>>>> Signal TLB invalidation waiters.
>>> Thanks for clarifying
>>>
>>>>> timeout and throw an error (which IMO is already an issue, because 
>>>>> the reply
>>>>> might be lost due to reset). I know that currently in all cases in 
>>>>> which we
>>>>> stop communication we do a reset, so the situation ends up ok, but 
>>>>> there is
>>>>> a pending series to remove the reset in the runtime suspend/resume 
>>>>> scenario
>>>>> (https://patchwork.freedesktop.org/series/122772/) in which case 
>>>>> IMO we
>>>> This path we would want to put the GuC communication into a state 
>>>> where
>>>> if messages send / recv this triggers an error. (-ENODEV). We don't
>>>> expect to suspend the device and then send / recv messages. That is 
>>>> the
>>>> point of this patch - it is fine drop messages during a reset, not if
>>>> during suspend or if CT has not yet been initialized.
>>> AFAIU one of the reasons behind this patch (internal report 53093) 
>>> is an
>>> issue around the suspend path, so we do already receive messages 
>>> after we
>>> started suspending. If I understand this patch correctly, we would 
>>> put the
>>> CT in DROP_MESSAGES state on suspend, via the following chain:
>>>
>>> gt_suspend
>>>          uc_suspend
>>>                  uc_stop
>>>                          guc_stop
>>>                                  guc_ct_drop_messages
>>>
>>> Are you saying this is fine for now, because we always do a reset on 
>>> resume,
>>> and that we'll need a new state when we stop doing such a reset? (not a
>>> complaint, just making sure I understood your reply).
>>>
>> I missed this path.... This is slightly different as here we do not call
>> xe_gt_tlb_invalidation_reset() but I think this does indeed current work
>> but that may change based on some work Rodrigo is doing related to finer
>> grained PM.
>>
>> This is turning into a larger discussion as it relates to reset /
>> suspend flows. I see 3 different flows, lets talk these through.
>>
>> 1. Reset flow (discussed above in my reply)
>>
>> Rough flow should be:
>> - Set CT channel to drop messages
>> - Stop all submissions
>> - Signal TLB invalidation waiters (this would be a change in location)
>> - Do reset
>> - Do restart (entails cleaning up any lost submission G2H, enable 
>> CTs, starting submission)
>>
>> In this case we drop all pending H2G / G2H and the reset flow ensures we
>> recover properly. No fluhing needed.
>>
>> 2. Suspend flow (discussed above in Daniele's reply)
>>
>> Rough flow should be for suspend:
>> - Set CT channel to drop messages
>> - Stop all submissions
>> - Flush G2H handler (just ensure worker is not running to race with 
>> next step, this step is missing)
>> - Set CT channel to disallow messages
>>
>> Rough flow should be for resume:
>> - Do reset
>> - Do restart (entails cleaning up any lost submission G2H, enable 
>> CTs, starting submission)
>>
>> In this case, between setting the CT channel to drop messages and 
>> stopping
>> submissions, teardowns of exec queues could be happening as this action
>> likely doesn't take a PM ref that prevents turning off the device (e.g.
>> user destroying an exec queue). It is safe to just drop these H2G / G2H
>> as the GuC will be reloaded. We don't except submissions here though as
>> those should have a PM ref. Not sure we have a way to enforce this yet
>> but could add something if needed. After submissions are stopped and G2H
>> handler fluhed we toggle the channel to disallow any further messages.
>>
>> Also notice we don't signal TLB waiters here. I am thinking if a TLB
>> invalidation is in flight we likely don't power down the device. We
>> ensure this via PM ref counting somehow. That being said, if the device
>> is powered off and we try issue a new TLB invalidation we likely
>> shouldn't issue the invalidation (this is an optimization that is not
>> required).
>
> Preamble: PM is not something I am too knowledgeable about, so there 
> might be errors in what I'm saying below. Please correct me if I'm wrong.
>
> The PCI subsystem might not power down the device if we have a rpm 
> ref, but we might still go through the pm_suspend call (as AFAIU that 
> is not tied to the rpm refcount) and thus disable the CT 
> communication. In i915 we have waiters in the S3 suspend flow to make 
> sure everything is properly flushed out without relying on the rpm 
> ref. Also note that we don't know if the device actually lost power, 
> only that we got ready for it (not sure if there is a way to tell on 
> the resume side), so if the device stayed awake we might end up having 
> to actually do the TLB invalidation (and not just signal the waiters) 
> given that, unlike i915, in Xe we don't do a full GT reset in the 
> resume path. IMO just easier to make sure all the pending TLB invals 
> have gone through before we complete the suspend flow.

Or we can add a GT reset in the resume flow, which will guarantee that 
the TLBs (and other HW units) are always clean so we can safely drop 
messages in the suspend path.

Daniele

>
>>
>> 3. Runtime suspend (relates to 
>> https://patchwork.freedesktop.org/series/122772/)
>>
>> Rough flow should be for suspend:
>> - Stop all submissions
>> - Wait for all pending G2H to complete naturally
>> - Set CT channel to disallow messages
>>
>> Rough flow should be for resume:
>> - Enable CTs
>> - Start all submissions
>>
>> Rather than flushing G2H, we have to waiting for any pending G2H dance
>> to complete before disallowing messages as the GuC will not be 
>> reloaded so
>> we need to ensure the GuC is in a known state.
>>
>> Here we'd have to wake the device on any new TLB invalidation too.
>
> This looks good to me.
>
> Daniele
>
>>
>> Does this seem correct and make sense?
>>
>> Matt
>>
>>>> Proper error messages will added based on these new states.
>>>>
>>>>> don't want to drop messages but do a flush instead.
>>>>>
>>>> See above. Also unsure what you mean by flush here? Do you mean the 
>>>> G2H
>>>> worker? I think that creates some dma-fencing (or lockdep) 
>>>> nightmares if
>>>> we do that.
>>> I meant the G2H, yes. We've had a ton of problem on the i915 side with
>>> worker threads running parallel to the suspend code and trying to 
>>> talk to
>>> the GuC (latest of which is
>>> https://patchwork.freedesktop.org/series/121916/), so I am kind of 
>>> worried
>>> something similar could happen here.
>>>
>>> Daniele
>>>
>>>> Matt
>>>>
>>>>> Daniele
>>>>>
>>>>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/xe/xe_guc.c          |  4 +-
>>>>>>     drivers/gpu/drm/xe/xe_guc_ct.c       | 55 
>>>>>> ++++++++++++++++++++--------
>>>>>>     drivers/gpu/drm/xe/xe_guc_ct.h       |  8 +++-
>>>>>>     drivers/gpu/drm/xe/xe_guc_ct_types.h | 18 ++++++++-
>>>>>>     4 files changed, 64 insertions(+), 21 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c 
>>>>>> b/drivers/gpu/drm/xe/xe_guc.c
>>>>>> index 482cb0df9f15..9b0fa8b1eb48 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>>>>> @@ -645,7 +645,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, 
>>>>>> const u32 *request,
>>>>>>         BUILD_BUG_ON(VF_SW_FLAG_COUNT != MED_VF_SW_FLAG_COUNT);
>>>>>> -    xe_assert(xe, !guc->ct.enabled);
>>>>>> +    xe_assert(xe, !xe_guc_ct_enabled(&guc->ct));
>>>>>>         xe_assert(xe, len);
>>>>>>         xe_assert(xe, len <= VF_SW_FLAG_COUNT);
>>>>>>         xe_assert(xe, len <= MED_VF_SW_FLAG_COUNT);
>>>>>> @@ -827,7 +827,7 @@ int xe_guc_stop(struct xe_guc *guc)
>>>>>>     {
>>>>>>         int ret;
>>>>>> -    xe_guc_ct_disable(&guc->ct);
>>>>>> +    xe_guc_ct_drop_messages(&guc->ct);
>>>>>>         ret = xe_guc_submit_stop(guc);
>>>>>>         if (ret)
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c 
>>>>>> b/drivers/gpu/drm/xe/xe_guc_ct.c
>>>>>> index 24a33fa36496..22d655a8bf9a 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>>>>> @@ -278,12 +278,25 @@ static int guc_ct_control_toggle(struct 
>>>>>> xe_guc_ct *ct, bool enable)
>>>>>>         return ret > 0 ? -EPROTO : ret;
>>>>>>     }
>>>>>> +static void xe_guc_ct_set_state(struct xe_guc_ct *ct,
>>>>>> +                enum xe_guc_ct_state state)
>>>>>> +{
>>>>>> +    mutex_lock(&ct->lock);        /* Serialise dequeue_one_g2h() */
>>>>>> +    spin_lock_irq(&ct->fast_lock);    /* Serialise CT fast-path */
>>>>>> +
>>>>>> +    ct->g2h_outstanding = 0;
>>>>>> +    ct->state = state;
>>>>>> +
>>>>>> +    spin_unlock_irq(&ct->fast_lock);
>>>>>> +    mutex_unlock(&ct->lock);
>>>>>> +}
>>>>>> +
>>>>>>     int xe_guc_ct_enable(struct xe_guc_ct *ct)
>>>>>>     {
>>>>>>         struct xe_device *xe = ct_to_xe(ct);
>>>>>>         int err;
>>>>>> -    xe_assert(xe, !ct->enabled);
>>>>>> +    xe_assert(xe, !xe_guc_ct_enabled(ct));
>>>>>>         guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
>>>>>>         guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
>>>>>> @@ -300,12 +313,7 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>>>>>>         if (err)
>>>>>>             goto err_out;
>>>>>> -    mutex_lock(&ct->lock);
>>>>>> -    spin_lock_irq(&ct->fast_lock);
>>>>>> -    ct->g2h_outstanding = 0;
>>>>>> -    ct->enabled = true;
>>>>>> -    spin_unlock_irq(&ct->fast_lock);
>>>>>> -    mutex_unlock(&ct->lock);
>>>>>> +    xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_ENABLED);
>>>>>>         smp_mb();
>>>>>>         wake_up_all(&ct->wq);
>>>>>> @@ -321,12 +329,12 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>>>>>>     void xe_guc_ct_disable(struct xe_guc_ct *ct)
>>>>>>     {
>>>>>> -    mutex_lock(&ct->lock); /* Serialise dequeue_one_g2h() */
>>>>>> -    spin_lock_irq(&ct->fast_lock); /* Serialise CT fast-path */
>>>>>> -    ct->enabled = false; /* Finally disable CT communication */
>>>>>> -    spin_unlock_irq(&ct->fast_lock);
>>>>>> -    mutex_unlock(&ct->lock);
>>>>>> +    xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_DISABLED);
>>>>>> +}
>>>>>> +void xe_guc_ct_drop_messages(struct xe_guc_ct *ct)
>>>>>> +{
>>>>>> +    xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_DROP_MESSAGES);
>>>>>>         xa_destroy(&ct->fence_lookup);
>>>>>>     }
>>>>>> @@ -493,11 +501,19 @@ static int __guc_ct_send_locked(struct 
>>>>>> xe_guc_ct *ct, const u32 *action,
>>>>>>             goto out;
>>>>>>         }
>>>>>> -    if (unlikely(!ct->enabled)) {
>>>>>> +    if (ct->state == XE_GUC_CT_STATE_NOT_INITIALIZED ||
>>>>>> +        ct->state == XE_GUC_CT_STATE_DISABLED) {
>>>>>>             ret = -ENODEV;
>>>>>>             goto out;
>>>>>>         }
>>>>>> +    if (ct->state == XE_GUC_CT_STATE_DROP_MESSAGES) {
>>>>>> +        ret = -ECANCELED;
>>>>>> +        goto out;
>>>>>> +    }
>>>>>> +
>>>>>> +    xe_assert(xe, xe_guc_ct_enabled(ct));
>>>>>> +
>>>>>>         if (g2h_fence) {
>>>>>>             g2h_len = GUC_CTB_HXG_MSG_MAX_LEN;
>>>>>>             num_g2h = 1;
>>>>>> @@ -682,7 +698,8 @@ static bool retry_failure(struct xe_guc_ct 
>>>>>> *ct, int ret)
>>>>>>             return false;
>>>>>>     #define ct_alive(ct)    \
>>>>>> -    (ct->enabled && !ct->ctbs.h2g.info.broken && 
>>>>>> !ct->ctbs.g2h.info.broken)
>>>>>> +    (xe_guc_ct_enabled(ct) && !ct->ctbs.h2g.info.broken && \
>>>>>> +     !ct->ctbs.g2h.info.broken)
>>>>>>         if (!wait_event_interruptible_timeout(ct->wq, 
>>>>>> ct_alive(ct),  HZ * 5))
>>>>>>             return false;
>>>>>>     #undef ct_alive
>>>>>> @@ -941,12 +958,18 @@ static int g2h_read(struct xe_guc_ct *ct, 
>>>>>> u32 *msg, bool fast_path)
>>>>>>         lockdep_assert_held(&ct->fast_lock);
>>>>>> -    if (!ct->enabled)
>>>>>> +    if (ct->state == XE_GUC_CT_STATE_NOT_INITIALIZED ||
>>>>>> +        ct->state == XE_GUC_CT_STATE_DISABLED)
>>>>>>             return -ENODEV;
>>>>>> +    if (ct->state == XE_GUC_CT_STATE_DROP_MESSAGES)
>>>>>> +        return -ECANCELED;
>>>>>> +
>>>>>>         if (g2h->info.broken)
>>>>>>             return -EPIPE;
>>>>>> +    xe_assert(xe, xe_guc_ct_enabled(ct));
>>>>>> +
>>>>>>         /* Calculate DW available to read */
>>>>>>         tail = desc_read(xe, g2h, tail);
>>>>>>         avail = tail - g2h->info.head;
>>>>>> @@ -1245,7 +1268,7 @@ struct xe_guc_ct_snapshot 
>>>>>> *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct,
>>>>>>             return NULL;
>>>>>>         }
>>>>>> -    if (ct->enabled) {
>>>>>> +    if (xe_guc_ct_enabled(ct)) {
>>>>>>             snapshot->ct_enabled = true;
>>>>>>             snapshot->g2h_outstanding = 
>>>>>> READ_ONCE(ct->g2h_outstanding);
>>>>>>             guc_ctb_snapshot_capture(xe, &ct->ctbs.h2g,
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h 
>>>>>> b/drivers/gpu/drm/xe/xe_guc_ct.h
>>>>>> index f15f8a4857e0..214a6a357519 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
>>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
>>>>>> @@ -13,6 +13,7 @@ struct drm_printer;
>>>>>>     int xe_guc_ct_init(struct xe_guc_ct *ct);
>>>>>>     int xe_guc_ct_enable(struct xe_guc_ct *ct);
>>>>>>     void xe_guc_ct_disable(struct xe_guc_ct *ct);
>>>>>> +void xe_guc_ct_drop_messages(struct xe_guc_ct *ct);
>>>>>>     void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
>>>>>>     struct xe_guc_ct_snapshot *
>>>>>> @@ -22,10 +23,15 @@ void xe_guc_ct_snapshot_print(struct 
>>>>>> xe_guc_ct_snapshot *snapshot,
>>>>>>     void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot 
>>>>>> *snapshot);
>>>>>>     void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer 
>>>>>> *p, bool atomic);
>>>>>> +static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
>>>>>> +{
>>>>>> +    return ct->state == XE_GUC_CT_STATE_ENABLED;
>>>>>> +}
>>>>>> +
>>>>>>     static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
>>>>>>     {
>>>>>>         wake_up_all(&ct->wq);
>>>>>> -    if (ct->enabled)
>>>>>> +    if (xe_guc_ct_enabled(ct))
>>>>>>             queue_work(system_unbound_wq, &ct->g2h_worker);
>>>>>>         xe_guc_ct_fast_path(ct);
>>>>>>     }
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h 
>>>>>> b/drivers/gpu/drm/xe/xe_guc_ct_types.h
>>>>>> index d814d4ee3fc6..e36c7029dffe 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
>>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
>>>>>> @@ -72,6 +72,20 @@ struct xe_guc_ct_snapshot {
>>>>>>         struct guc_ctb_snapshot h2g;
>>>>>>     };
>>>>>> +/**
>>>>>> + * enum xe_guc_ct_state - CT state
>>>>>> + * @XE_GUC_CT_STATE_NOT_INITIALIZED: CT suspended, messages not 
>>>>>> expected in this state
>>>>>> + * @XE_GUC_CT_STATE_DISABLED: CT disabled, messages not expected 
>>>>>> in this state
>>>>>> + * @XE_GUC_CT_STATE_DROP_MESSAGES: CT drops messages without errors
>>>>>> + * @XE_GUC_CT_STATE_ENABLED: CT enabled, messages sent / 
>>>>>> recieved in this state
>>>>>> + */
>>>>>> +enum xe_guc_ct_state {
>>>>>> +    XE_GUC_CT_STATE_NOT_INITIALIZED = 0,
>>>>>> +    XE_GUC_CT_STATE_DISABLED,
>>>>>> +    XE_GUC_CT_STATE_DROP_MESSAGES,
>>>>>> +    XE_GUC_CT_STATE_ENABLED,
>>>>>> +};
>>>>>> +
>>>>>>     /**
>>>>>>      * struct xe_guc_ct - GuC command transport (CT) layer
>>>>>>      *
>>>>>> @@ -96,8 +110,8 @@ struct xe_guc_ct {
>>>>>>         u32 g2h_outstanding;
>>>>>>         /** @g2h_worker: worker to process G2H messages */
>>>>>>         struct work_struct g2h_worker;
>>>>>> -    /** @enabled: CT enabled */
>>>>>> -    bool enabled;
>>>>>> +    /** @state: CT state */
>>>>>> +    enum xe_guc_ct_state state;;
>>>>>>         /** @fence_seqno: G2H fence seqno - 16 bits used by CT */
>>>>>>         u32 fence_seqno;
>>>>>>         /** @fence_lookup: G2H fence lookup */
>

