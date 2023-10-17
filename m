Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 394C8CDB474
	for <intel-xe@archiver.kernel.org>; Tue, 17 Oct 2023 14:07:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E10B010E2FE;
	Tue, 17 Oct 2023 14:07:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF38F10E2FE
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Oct 2023 14:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697551660; x=1729087660;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=S49yf0m9XovjYr5TBWixIB7m7PtJFi3dCYSDyWqqJNM=;
 b=P1SC5DkgnZIEv1Y2Oi+tDjCE/WnW7bMHeag5EKRjcvn9mSkLTDNieUlg
 aycFBqSNJv6+/mMvZc7lGa121Kq0T4o1HDd2ZQhN4eVviaQY6J78mp2w9
 fDwrdMIR7hbT/KKQ5qGZG5szoDIMkRbBBI8exKF9frvhUTkTSpcCld+8T
 WOyj+TuJ6cbseA5Sr2VSGdn8ETSgDt0l1s7qdDJJVkDY8dwTQYp71FDxf
 YCv9j48wFJ002ZOKzr6M8kjy1tBG1QTwfdpWoYuVYSwLlbWD7BkFw74iF
 t7sBkq6xT+endguZh+UfdP8m+5erNIwV1zDTomDR/at9R8/Xk1xL3NM/V Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="416870903"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; d="scan'208";a="416870903"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 07:07:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="846836785"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; d="scan'208";a="846836785"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2023 07:07:30 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 17 Oct 2023 07:07:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 17 Oct 2023 07:07:29 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 17 Oct 2023 07:07:29 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 17 Oct 2023 07:07:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eQyVE4ovqe/yIiRxpM5XzZf2mPyiqtQ4TUNp0atfsu1BIk7SjJJP77/Te6eKp3VBpJyXpmL9WUfBpC47plUHvSdcPGlKxTxifWof7+YHiF5LnTo6DxFVgUHguA2gVdWD1sxihNbJZ9O0rEyyOr1i/PPpxVJoJffIUjzJA6ra9xk4mImTwogwKQl/j9g0j9+muwPbAkzEUTYPQrhFx2e5ELn1Z3SjU2aspQQdvqQhoaqAeM0XNE3p10Y4gERSHZKIU3sSShkX5JTD0vjQkuF+R5vPmnTMoPodzos9N2FtY6YsyDRfynd3ZLK4HtgN5becM0zzJI2PCdFtfIF/rASZcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UgaHE+wPhFyKiYN+54Q5PYdCh5U8ooPGx0xqh3Q4hdQ=;
 b=bmSFrF0STtCWUYmIHJdavcQfGlknhZBDscK9yFqpzeLh2Muz3D5Q5i3fdRqalTHamo3JEB1/iyk200nty80gDEl+0ic5ilRSzlu9UX97fvhzU9B5E4APHRZz0tRQJCdef0On6jw9s4LrREQlqmvXyRydSP2nit9JPhMmZQShz4xqZ4u+EeY4nPcW74Jon2oW4vQxaZD9hxu89R5dby4LfHVHqu4jVvzyuC/R+iAQM+Umctxr6c2lr0opFlulJ/4svnekxCUO/pDurAL4dr8rZTADmqXiiEGHIRCz9+6HWtJg0Eo6fTYRxXfohRc/evhpDU77k144XIttT1ZODl+avA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by CYYPR11MB8308.namprd11.prod.outlook.com (2603:10b6:930:b9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Tue, 17 Oct
 2023 14:07:24 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::547b:6763:164a:4283]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::547b:6763:164a:4283%6]) with mapi id 15.20.6907.021; Tue, 17 Oct 2023
 14:07:24 +0000
Message-ID: <47df15ae-6554-4fca-9608-718033200e04@intel.com>
Date: Tue, 17 Oct 2023 19:37:13 +0530
User-Agent: Mozilla Thunderbird
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20231013121633.1038322-1-tejas.upadhyay@intel.com>
 <20231013121633.1038322-3-tejas.upadhyay@intel.com>
 <03a59d7c-f0ae-41af-b615-4c7e6df08567@intel.com>
 <SJ1PR11MB6204D9CBD1F3A5B49E5076AA81D7A@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <d77424a2-5527-47ab-ba9b-f2f18a78c1c5@intel.com>
 <SJ1PR11MB6204571056FAF62ABD031A0281D6A@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <SJ1PR11MB6204571056FAF62ABD031A0281D6A@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0211.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::6) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|CYYPR11MB8308:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a51cf3b-15c8-4c2c-e2a6-08dbcf1a62b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8khEGxWrxT+ADr0lSH0K9GzCGK3fBqMebun1121iM9/+FgpX5OI5UuhicT6R/T7CmEpByeODacbIDPfTY3NQw2l4ze7xH7KMuR+cIxbDiQHZULU2BkmbXBxTnKWIoU1er70Yczjkzo987A+qzyUhXoctLIGiUkuS1rAB6ec0s7cjMBvmGleOtuKmoZ5QajqFSio/ompSeOI612yS5hbB5dwLbu/w0Q9mpu67b439It+gWgVFoiJPkfbaWzx5dhTddNeSoRFUoeA3BjLvOzL2xbnTQp/of/py4pAFvEaJDupgokAkhuZP2TBaleYgAOP6aWZqUh07y4ZHcyYssb42Kb6Xupe2C0YgQsisKqREhisB1i/77PUI0PFnPd0SOk7ohJc4BhkoglyfBXqfwM4f2KeoDoSCDmQlkEEHddD3Cb5bmK5mmGF0UThAieUnjhhf9YeEAMPwubV2EmrulAMFv2WkDTlKMmUWL4frKGl4MaDtEpWX5gvzhqTrpyGlFZ4WLR3n0e3DzLjLxOvJVeQPcsQD4ddpPdHzjfMpW/YOaxUxUyiEbaOEiDKJAGE83z0EZ+HKnUMEvr/orc3jUbjABhOLsYPbomPNPfU0Tn4Bg8jiCkubDtCw4MpyQFuoykaW6fbQvTinpb7V05yN8EZwgA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(376002)(346002)(396003)(366004)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(2616005)(26005)(6666004)(6506007)(8936002)(6512007)(53546011)(83380400001)(41300700001)(4326008)(8676002)(5660300002)(2906002)(30864003)(15650500001)(6486002)(478600001)(110136005)(66946007)(66556008)(316002)(66476007)(82960400001)(31696002)(38100700002)(86362001)(36756003)(31686004)(66899024)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTdBZmRCd3VXaUx3TjA3WHNFZmZlK21qQmh0Mm1Uc2JDa2wyc1IwRjNtWnlm?=
 =?utf-8?B?M29lTVY3TGtIVGRjVWxXYXFwNGhxclpoZFgyYU5sNm9NZG54eGMzMWVJcGJ6?=
 =?utf-8?B?aXZ0ZmpFOTRiNzhSaExZeHRSV0todytXV1FLUHVaU3BVQzZzc3l6cGMxYkdN?=
 =?utf-8?B?ZDk4MWdNcnYwNFRkRUR0WUQ4R1M0ZGF6dGpBQ0o5bHR2NVhudVJPZWV3dVIw?=
 =?utf-8?B?bFB2czNGam9xNDJDU2prZHBZTGJmWE9iVkIrQTUxRFEvWjEyNk1KRERjNHJG?=
 =?utf-8?B?cG9VaTBSZjZYVVI2SHRDdmdWWFdoWXp6VUNTVVZFWGRwNHk2UXg2UEtlTGJp?=
 =?utf-8?B?RzhUcEVKdTY4b0JJWSttN3p1TURkMHVFekJPTUJwbzU0MFI2bGV0ai9GVXNI?=
 =?utf-8?B?bXJEd0dFejNaODdrNmhmRFRleTJrczlSNTF2ckFvU04rQTVxSzhCbDFOQXdZ?=
 =?utf-8?B?UDhKYVBrMWdzTTZVWndUT2Q4VlphMERiUG12TE10R3BCQU5MVWVxcWczK2t5?=
 =?utf-8?B?cTFrRFkxaG54dEJXUXY1dlhDZ1p5ZVBiMGZLVURnWXVQQ0M4cUJCY1JxWVVD?=
 =?utf-8?B?bkQ0SzFFRXU1WmExWno1MERCd1NoTUd0VEVWamp2QU9STmJXUzl1TjUwQkVE?=
 =?utf-8?B?cUE0VWlTZnFlR0tsc0ZhemM5bWdFbzhTWFM2WHBtemkyUk5qSVZ1NVd2ZmRQ?=
 =?utf-8?B?Z0Ird1NpQmF2YUJBWnhYTmYvRkdBQkJoV0RkbFdYS3IwZjNjZDNZTVA5QUxB?=
 =?utf-8?B?cFR1Q1U2VjgxTzBheU9SaW56NzVtTkpHVWtGSG9VdEFVbzRqOXBJN2x3elB3?=
 =?utf-8?B?ZDBjZGtod3B1SEJNQ1p2eVZVTXNiWjh0M0JnWnE3Zld6U3E4UWY0aXphd3g5?=
 =?utf-8?B?TWR3TTZ2OUNWZktkYUxDMzh3ZTk3NXdXWXk3WnZ2WW1OcWFRcEYyN29FOHNs?=
 =?utf-8?B?a2s1bko4UjlaNEQzK0k0Y1JrWTVmVWQrT1VTeENZck1XbW5QTFpidUJTQzlh?=
 =?utf-8?B?dSt3bzdmNGo0WC92TndFaVp1QVpxZmpTaFdlanNmcS9CQWxEYXllNzBQQndC?=
 =?utf-8?B?MHo0Ti9JZlREVkhjZUFlYTlQUytqVmRhc0MxUHU1Yys0VCtrMXIyK0NGRG9F?=
 =?utf-8?B?TnpPVmVBYWZ0QU5QUlFqQ2N3OTF2WVlNMU1VNWxaUEVFMnI3VjgxcHp3MzU4?=
 =?utf-8?B?MXZDQTN5cHdIR2xzeE10UXg2Qld3Q1R2OUNkTEFtZGxIUVcwMjNONzdiNHhq?=
 =?utf-8?B?eDNaWVVKelBvZXdiUktmVmlvWDNEQWM3QTF1UVVvTzlxMjlLb2V1eUc3NEMw?=
 =?utf-8?B?a3ZHbGZQN3k4U01TY2w1a0V3anFEWlBtOVdOdS9sMVlDQmhXQk5DNklscXVF?=
 =?utf-8?B?S0diM29QRHF3WDVhSzd4SnB1bEdzSTF5WVJsSEVSUmFwQkNQRnNBMkxiQjhE?=
 =?utf-8?B?ejAwdGFWTExnSWhxdGh6RG9QaHhpMDNVcTdXVTI3VTMxSEdTRzN5bmZ1TytU?=
 =?utf-8?B?SnU5YzdPVU5zTG9ZeHFQNEhXeHRCR0pTck1mMXhWaDhIVVZYQjFBQmlWTlZw?=
 =?utf-8?B?SzJmaGNucDZJYWN6Wml3VXdqVHlDR3p4TnZWOEpRNkZqUVo2a2tqU2VNR1J4?=
 =?utf-8?B?T0YrRWVHUFpZd2RIdzRNQW5jdUhPZVdrVi9lTGVQNC9ONU1naVdBU05ram9L?=
 =?utf-8?B?V2h3NS8zSWEyR3JGN29IeEM1c0ZIakQ0WnlUZnBRdjI0VjV6andtNGhJQ0dX?=
 =?utf-8?B?VHJLSm5jeTM4VEVueitOOHhRblVGd2trYzVvcERTZDZDY2JCMzBVVnVQenRS?=
 =?utf-8?B?d1kzWFd5bEx1Y0lQaTc3bDdiaWNmS3Vvc0xCYXJzRm42cDk0V05rK3NaZm1L?=
 =?utf-8?B?ME5sdnNQdlM1eEJjRkZ5TTcrbG9vVGFWVEo4RGdtTTFMbUE4dlBFa2hyMWs5?=
 =?utf-8?B?akVCQVBweVlwcmxvTllMV3ZOdWgvOVlYcm1PYmxGZlY0TXpmd1dIVVRXNVJF?=
 =?utf-8?B?MjVDc0tubHU1bkptRWZia2JhYVAvS3M0YWpwK0dhOTB2dnhsSy9mUTVLM2FR?=
 =?utf-8?B?RVhUWkcrNStPM0Iza0R4MjJnNThlOExnQmRhdUtmc2w1NE9XL1diMnNCckZE?=
 =?utf-8?B?MVU3dkdPT1FOYUYzbHBvUkp6VkliSG9DT0hmZ2FaeGZGQTgxZmtqWHZqbENi?=
 =?utf-8?B?RXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a51cf3b-15c8-4c2c-e2a6-08dbcf1a62b3
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 14:07:23.8633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tdqDi+adMYwhrysLs6Z3pc8tvW8pyx2idM8FSdzO7aRD9yasQdb72KBJ0PYW1cDNKC+WV6s2h/K4tvF1uJ8l/zeR+ueNGAID34MjrMXyR7w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8308
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V6 2/2] drm/xe: Update counter for low level
 driver errors
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
Cc: "Vishwanathapura@freedesktop.org" <Vishwanathapura@freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 17-10-2023 18:10, Upadhyay, Tejas wrote:
> 
> 
>> -----Original Message-----
>> From: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
>> Sent: Monday, October 16, 2023 8:05 PM
>> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
>> xe@lists.freedesktop.org
>> Cc: Vishwanathapura@freedesktop.org; Iddamsetty, Aravind
>> <aravind.iddamsetty@intel.com>
>> Subject: Re: [Intel-xe] [PATCH V6 2/2] drm/xe: Update counter for low level
>> driver errors
>>
>>
>>
>> On 16.10.2023 14:36, Upadhyay, Tejas wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
>>>> Sent: Friday, October 13, 2023 8:43 PM
>>>> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
>>>> xe@lists.freedesktop.org
>>>> Cc: Vishwanathapura@freedesktop.org
>>>> Subject: Re: [Intel-xe] [PATCH V6 2/2] drm/xe: Update counter for low
>>>> level driver errors
>>>>
>>>>
>>>>
>>>> On 13.10.2023 14:16, Tejas Upadhyay wrote:
>>>>> we added a low level driver error counter and incrementing on each
>>>>> occurrance. Focus is on errors that are not functionally
>>>>
>>>> typo
>>>
>>> Sure
>>>
>>>>
>>>>> affecting the system and might otherwise go unnoticed and cause
>>>>> power/performance regressions, so checking for the error counters
>>>>> should help.
>>>>>
>>>>> Importantly the intention is not to go adding new error checks, but
>>>>> to make sure the existing important error conditions are propagated
>>>>> in terms of counter under respective categories like below :
>>>>> Under GT:
>>>>> gt_guc_communication,
>>>>> gt_engine_other,
>>>>> gt_other
>>>>>
>>>>> Under Tile:
>>>>> gtt,
>>>>> interrupt
>>>>>
>>>>> TODO: Currently this is just a counting of errors, later these
>>>>> counters will be reported through netlink interface when it is
>>>>> implemented and ready.
>>>>>
>>>>> V6:
>>>>>   - move drm_err to gt and tile specific err API - Aravind
>>>>>   - Use GTT naming instead of GGTT - Aravind/Niranjana
>>>>> V5:
>>>>>   - Dump err_type in string format
>>>>> V4:
>>>>>   - dump err_type in drm_err log - Himal
>>>>> V2:
>>>>>   - Use modified APIs
>>>>>
>>>>> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>>>> ---
>>>>>  drivers/gpu/drm/xe/xe_gt.c                  | 25 +++++++++++-
>>>>>  drivers/gpu/drm/xe/xe_gt.h                  |  4 +-
>>>>>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 13 +++---
>>>>>  drivers/gpu/drm/xe/xe_guc.c                 | 15 ++++---
>>>>>  drivers/gpu/drm/xe/xe_guc_ct.c              | 44 +++++++++++----------
>>>>>  drivers/gpu/drm/xe/xe_guc_pc.c              | 12 +++---
>>>>>  drivers/gpu/drm/xe/xe_guc_submit.c          | 39 ++++++++++--------
>>>>>  drivers/gpu/drm/xe/xe_irq.c                 |  6 ++-
>>>>>  drivers/gpu/drm/xe/xe_reg_sr.c              | 22 +++++------
>>>>>  drivers/gpu/drm/xe/xe_tile.c                | 26 +++++++++++-
>>>>>  drivers/gpu/drm/xe/xe_tile.h                |  4 +-
>>>>>  11 files changed, 139 insertions(+), 71 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>>>> index b81de3984626..6f875b3886fd 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_gt.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>>>> @@ -47,10 +47,18 @@
>>>>>  #include "xe_wa.h"
>>>>>  #include "xe_wopcm.h"
>>>>>
>>>>> +const char *const xe_gt_drv_err_to_str[] = {
>>>>> +	[XE_GT_DRV_ERR_GUC_COMM] = "GUC COMMUNICATION",
>>>>> +	[XE_GT_DRV_ERR_ENGINE] = "ENGINE OTHER",
>>>>> +	[XE_GT_DRV_ERR_OTHERS] = "GT OTHER"
>>>>> +};
>>>>
>>>> instead of exposing table, better BKM is to define public helper
>>>> function that converts enum to string, and keep such table as
>>>> implementation detail
>>>
>>> It always better and suggested upstream approach to statically bind values
>> in array like this above. Also having so many switch cases degrades code
>> execution. So in my opinion what we have above should work well.
>>
>> but you can still use table as map from enum to string my point is that
>> exposing a raw table (without guard code) may lead to bugs, while
>> encapsulating that inside a helper will be more robust
>>
>> also we don't expect these errors (and thus err strings) to happen frequently,
>> so function call cost could be ignored
>>
>>>
>>>>
>>>>> +
>>>>>  /**
>>>>>   * xe_gt_report_driver_error - Count driver error for gt
>>>>>   * @gt: GT to count error for
>>>>>   * @err: enum error type
>>>>> + * @fmt: debug message format to print error
>>>>> + * @...: variable args to print error
>>>>>   *
>>>>>   * Increment the driver error counter in respective error
>>>>>   * category for this GT.
>>>>> @@ -58,11 +66,26 @@
>>>>>   * Returns void.
>>>>>   */
>>>>>  void xe_gt_report_driver_error(struct xe_gt *gt,
>>>>> -			       const enum xe_gt_drv_err_type err)
>>>>> +			       const enum xe_gt_drv_err_type err,
>>>>> +			       const char *fmt, ...)
>>>>>  {
>>>>> +	struct va_format vaf;
>>>>> +	va_list args;
>>>>> +
>>>>>  	xe_gt_assert(gt, err >= ARRAY_SIZE(gt->drv_err_cnt));
>>>>>  	WRITE_ONCE(gt->drv_err_cnt[err],
>>>>>  		   READ_ONCE(gt->drv_err_cnt[err]) + 1);
>>>>> +
>>>>> +	va_start(args, fmt);
>>>>> +	vaf.fmt = fmt;
>>>>> +	vaf.va = &args;
>>>>> +
>>>>> +	BUILD_BUG_ON(ARRAY_SIZE(xe_gt_drv_err_to_str) !=
>>>>> +		     XE_GT_DRV_ERR_MAX);
>>>>> +
>>>>> +	drm_err(&gt_to_xe(gt)->drm, "GT%u [%s] %pV",
>>>>> +		gt->info.id, xe_gt_drv_err_to_str[err], &vaf);
>>>>
>>>> why not using existing xe_gt_err() which already adds "GT%u" prefix?
>>>
>>> Ok makes sense I will use xe_gt_err for GT error reporting.
>>>
>>>>
>>>> also if you want to include error type string here, then maybe its
>>>> worth to consider their shorter names ?
>>>>
>>>> 	"GUC COMMUNICATION" 	-> "GUC"
>>>> 	"ENGINE OTHER"		-> "ENGINE"
>>>> 	"GT OTHER"		-> "OTHER"
>>>
>>> No the names gives information that its GUC communication not GUC
>> loading failures that we are going to report here. Similar for engine we have
>> reset failures which we are not reporting instead we report other engine
>> performance related errors. Similarly for GT no reset errors, only GT perf
>> errors. So naming here is meaningful.
>>>
>>>>
>>>> as otherwise they will be quite long:
>>>>
>>>> [ ] xe 0000:b7:00.0: [drm] *ERROR* GT0: [GT OTHER] ...
>>>> [ ] xe 0000:b7:00.0: [drm] *ERROR* GT0: [GUC COMMUNICATION] ...
>>>>
>>>>> +	va_end(args);
>>>>>  }
>>>>>
>>>>>  struct xe_gt *xe_gt_alloc(struct xe_tile *tile) diff --git
>>>>> a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h index
>>>>> 9442d615042f..374c6946620b 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_gt.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_gt.h
>>>>> @@ -67,7 +67,9 @@ static inline bool xe_gt_is_usm_hwe(struct xe_gt
>>>>> *gt,
>>>> struct xe_hw_engine *hwe)
>>>>>  		hwe->instance == gt->usm.reserved_bcs_instance;  }
>>>>>
>>>>> +extern const char *const xe_gt_drv_err_to_str[];
>>>>>  void xe_gt_report_driver_error(struct xe_gt *gt,
>>>>> -			       const enum xe_gt_drv_err_type err);
>>>>> +			       const enum xe_gt_drv_err_type err,
>>>>> +			       const char *fmt, ...);
>>>>>
>>>>>  #endif
>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>>>> b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>>>> index bd6005b9d498..770ed7df8389 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>>>> @@ -9,6 +9,7 @@
>>>>>  #include "xe_gt.h"
>>>>>  #include "xe_guc.h"
>>>>>  #include "xe_guc_ct.h"
>>>>> +#include "xe_tile.h"
>>>>>  #include "xe_trace.h"
>>>>>
>>>>>  #define TLB_TIMEOUT	(HZ / 4)
>>>>> @@ -35,8 +36,10 @@ static void xe_gt_tlb_fence_timeout(struct
>>>> work_struct *work)
>>>>>  			break;
>>>>>
>>>>>  		trace_xe_gt_tlb_invalidation_fence_timeout(fence);
>>>>> -		drm_err(&gt_to_xe(gt)->drm, "gt%d: TLB invalidation fence
>>>> timeout, seqno=%d recv=%d",
>>>>> -			gt->info.id, fence->seqno, gt-
>>>>> tlb_invalidation.seqno_recv);
>>>>> +		xe_tile_report_driver_error(gt_to_tile(gt),
>>>> XE_TILE_DRV_ERR_GTT,
>>>>> +					    "gt%d: TLB invalidation fence
>>>> timeout, seqno=%d recv=%d",
>>>>
>>>> hmm, TLB invalidation code seems to be operating on the GT/GuC level,
>>>> and timeouts here will have origin in requests sent (but lost or
>>>> something) to GuC, so why suddenly we report this as a tile error ?
>>>>
>>>> note that this will also make message inconsistent:
>>>> 	gt%u here vs GT%u elsewhere
>>>
>>> GGTT  is per tile and PPGTT is per GT. I will make sure to see if further
>> categorization of GGTT vs PPGTT needed while reporting error here.
> 
> So I looked into this little in details, we come to this error reporting from two places,
> 1. xe_gt_init --> xe_gt_tlb_invalidation_init --> xe_gt_tlb_fence_timeout, so this could be per GT and considered as PPGTT.
> 2. xe_vm_invalidate_vma --> xe_gt_tlb_invalidation_wait --> this is getting called per tile and called from GGTT so can be considered GGTT.

both the above calls
(xe_gt_tlb_fence_timeout/xe_gt_tlb_invalidation_wait) can happen for
PPGTT or GGTT which you cannot identify at this level unless you
identify that in the caller and pass that info to these.

Also since the TLB invalidation is issued to a GUC which is per GT
atleast these errors shall be counted at GT level.

Thanks,
Aravind.
> 
> We can consider this categorization further.
> 
> Thanks,
> Tejas
>>>
>>>>
>>>>> +					    gt->info.id, fence->seqno,
>>>>> +					    gt->tlb_invalidation.seqno_recv);
>>>>>
>>>>>  		list_del(&fence->link);
>>>>>  		fence->base.error = -ETIME;
>>>>> @@ -317,7 +320,6 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
>>>>>   */
>>>>>  int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)  {
>>>>> -	struct xe_device *xe = gt_to_xe(gt);
>>>>>  	struct xe_guc *guc = &gt->uc.guc;
>>>>>  	int ret;
>>>>>
>>>>> @@ -329,8 +331,9 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt
>>>>> *gt, int
>>>> seqno)
>>>>>  				 tlb_invalidation_seqno_past(gt, seqno),
>>>>>  				 TLB_TIMEOUT);
>>>>>  	if (!ret) {
>>>>> -		drm_err(&xe->drm, "gt%d: TLB invalidation time'd out,
>>>> seqno=%d, recv=%d\n",
>>>>> -			gt->info.id, seqno, gt->tlb_invalidation.seqno_recv);
>>>>> +		xe_tile_report_driver_error(gt_to_tile(gt),
>>>> XE_TILE_DRV_ERR_GTT,
>>>>> +					    "gt%d: TLB invalidation time'd out,
>>>> seqno=%d, recv=%d\n",
>>>>> +					    gt->info.id, seqno, gt-
>>>>> tlb_invalidation.seqno_recv);
>>>>>  		return -ETIME;
>>>>>  	}
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c
>>>>> b/drivers/gpu/drm/xe/xe_guc.c index 84f0b5488783..c40d0cc46293
>>>>> 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>>>> @@ -663,8 +663,9 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc,
>>>> const u32 *request,
>>>>>  			     50000, &reply, false);
>>>>>  	if (ret) {
>>>>>  timeout:
>>>>> -		drm_err(&xe->drm, "mmio request %#x: no reply %#x\n",
>>>>> -			request[0], reply);
>>>>> +		xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_GUC_COMM,
>>>>> +					  "mmio request %#x: no reply
>>>> %#x\n",
>>>>> +					  request[0], reply);
>>>>
>>>> maybe it's worth to add helper:
>>>>
>>>> #define xe_guc_report_error(guc, fmt...) 	\
>>>> 	xe_gt_report_driver_error( 		\
>>>> 		guc_to_gt(guc),			\
>>>> 		XE_GT_DRV_ERR_GUC_COMM, fmt)
>>>
>>> I think its not needed, anyway we will call xe_gt_report_driver_error under
>> it. Also if there will be more such categories like "guc" then we will keep on
>> adding helpers.
>>>
>>>>
>>>>>  		return ret;
>>>>>  	}
>>>>>
>>>>> @@ -697,16 +698,18 @@ int xe_guc_mmio_send_recv(struct xe_guc
>> *guc,
>>>> const u32 *request,
>>>>>  		u32 hint = FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT,
>>>> header);
>>>>>  		u32 error = FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR,
>>>> header);
>>>>>
>>>>> -		drm_err(&xe->drm, "mmio request %#x: failure %#x/%#x\n",
>>>>> -			request[0], error, hint);
>>>>> +		xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_GUC_COMM,
>>>>> +					  "mmio request %#x: failure
>>>> %#x/%#x\n",
>>>>> +					  request[0], error, hint);
>>>>>  		return -ENXIO;
>>>>>  	}
>>>>>
>>>>>  	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) !=
>>>>>  	    GUC_HXG_TYPE_RESPONSE_SUCCESS) {
>>>>>  proto:
>>>>> -		drm_err(&xe->drm, "mmio request %#x: unexpected reply
>>>> %#x\n",
>>>>> -			request[0], header);
>>>>> +		xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_GUC_COMM,
>>>>> +					  "mmio request %#x: unexpected
>>>> reply %#x\n",
>>>>> +					  request[0], header);
>>>>>  		return -EPROTO;
>>>>>  	}
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c
>>>>> b/drivers/gpu/drm/xe/xe_guc_ct.c index 8b686c8b3339..1615f4e3c01e
>>>>> 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>>>> @@ -732,8 +732,9 @@ static int guc_ct_send_recv(struct xe_guc_ct
>>>>> *ct, const u32 *action, u32 len,
>>>>>
>>>>>  	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
>>>>>  	if (!ret) {
>>>>> -		drm_err(&xe->drm, "Timed out wait for G2H, fence %u,
>>>> action %04x",
>>>>> -			g2h_fence.seqno, action[0]);
>>>>> +		xe_gt_report_driver_error(ct_to_gt(ct),
>>>> XE_GT_DRV_ERR_GUC_COMM,
>>>>> +					  "Timed out wait for G2H, fence %u,
>>>> action %04x",
>>>>> +					  g2h_fence.seqno, action[0]);
>>>>>  		xa_erase_irq(&ct->fence_lookup, g2h_fence.seqno);
>>>>>  		return -ETIME;
>>>>>  	}
>>>>> @@ -744,8 +745,9 @@ static int guc_ct_send_recv(struct xe_guc_ct
>>>>> *ct,
>>>> const u32 *action, u32 len,
>>>>>  		goto retry;
>>>>>  	}
>>>>>  	if (g2h_fence.fail) {
>>>>> -		drm_err(&xe->drm, "Send failed, action 0x%04x, error %d,
>>>> hint %d",
>>>>> -			action[0], g2h_fence.error, g2h_fence.hint);
>>>>> +		xe_gt_report_driver_error(ct_to_gt(ct),
>>>> XE_GT_DRV_ERR_GUC_COMM,
>>>>> +					  "Send failed, action 0x%04x, error
>>>> %d, hint %d",
>>>>> +					  action[0], g2h_fence.error,
>>>> g2h_fence.hint);
>>>>>  		ret = -EIO;
>>>>>  	}
>>>>>
>>>>> @@ -829,7 +831,6 @@ static int parse_g2h_response(struct xe_guc_ct
>>>>> *ct, u32 *msg, u32 len)
>>>>>
>>>>>  static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)  {
>>>>> -	struct xe_device *xe = ct_to_xe(ct);
>>>>>  	u32 hxg, origin, type;
>>>>>  	int ret;
>>>>>
>>>>> @@ -839,9 +840,9 @@ static int parse_g2h_msg(struct xe_guc_ct *ct,
>>>>> u32 *msg, u32 len)
>>>>>
>>>>>  	origin = FIELD_GET(GUC_HXG_MSG_0_ORIGIN, hxg);
>>>>>  	if (unlikely(origin != GUC_HXG_ORIGIN_GUC)) {
>>>>> -		drm_err(&xe->drm,
>>>>> -			"G2H channel broken on read, origin=%d, reset
>>>> required\n",
>>>>> -			origin);
>>>>> +		xe_gt_report_driver_error(ct_to_gt(ct),
>>>> XE_GT_DRV_ERR_GUC_COMM,
>>>>> +					  "G2H channel broken on read,
>>>> origin=%d, reset required\n",
>>>>> +					  origin);
>>>>>  		ct->ctbs.g2h.info.broken = true;
>>>>>
>>>>>  		return -EPROTO;
>>>>> @@ -858,9 +859,9 @@ static int parse_g2h_msg(struct xe_guc_ct *ct,
>>>>> u32
>>>> *msg, u32 len)
>>>>>  		ret = parse_g2h_response(ct, msg, len);
>>>>>  		break;
>>>>>  	default:
>>>>> -		drm_err(&xe->drm,
>>>>> -			"G2H channel broken on read, type=%d, reset
>>>> required\n",
>>>>> -			type);
>>>>> +		xe_gt_report_driver_error(ct_to_gt(ct),
>>>> XE_GT_DRV_ERR_GUC_COMM,
>>>>> +					  "G2H channel broken on read,
>>>> type=%d, reset required\n",
>>>>> +					  type);
>>>>>  		ct->ctbs.g2h.info.broken = true;
>>>>>
>>>>>  		ret = -EOPNOTSUPP;
>>>>> @@ -871,7 +872,6 @@ static int parse_g2h_msg(struct xe_guc_ct *ct,
>>>>> u32 *msg, u32 len)
>>>>>
>>>>>  static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>>>> {
>>>>> -	struct xe_device *xe = ct_to_xe(ct);
>>>>>  	struct xe_guc *guc = ct_to_guc(ct);
>>>>>  	u32 action = FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, msg[1]);
>>>>>  	u32 *payload = msg + GUC_CTB_HXG_MSG_MIN_LEN; @@ -918,12
>>>> +918,15 @@
>>>>> static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>>>>  							   adj_len);
>>>>>  		break;
>>>>>  	default:
>>>>> -		drm_err(&xe->drm, "unexpected action 0x%04x\n", action);
>>>>> +		xe_gt_report_driver_error(ct_to_gt(ct),
>>>> XE_GT_DRV_ERR_GUC_COMM,
>>>>> +					  "unexpected action 0x%04x\n",
>>>>> +					  action);
>>>>>  	}
>>>>>
>>>>>  	if (ret)
>>>>> -		drm_err(&xe->drm, "action 0x%04x failed processing,
>>>> ret=%d\n",
>>>>> -			action, ret);
>>>>> +		xe_gt_report_driver_error(ct_to_gt(ct),
>>>> XE_GT_DRV_ERR_GUC_COMM,
>>>>> +					  "action 0x%04x failed processing,
>>>> ret=%d\n",
>>>>> +					  action, ret);
>>>>>
>>>>>  	return 0;
>>>>>  }
>>>>> @@ -957,9 +960,9 @@ static int g2h_read(struct xe_guc_ct *ct, u32
>>>>> *msg,
>>>> bool fast_path)
>>>>>  			   sizeof(u32));
>>>>>  	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) +
>>>> GUC_CTB_MSG_MIN_LEN;
>>>>>  	if (len > avail) {
>>>>> -		drm_err(&xe->drm,
>>>>> -			"G2H channel broken on read, avail=%d, len=%d,
>>>> reset required\n",
>>>>> -			avail, len);
>>>>> +		xe_gt_report_driver_error(ct_to_gt(ct),
>>>> XE_GT_DRV_ERR_GUC_COMM,
>>>>> +					  "G2H channel broken on read,
>>>> avail=%d, len=%d, reset required\n",
>>>>> +					  avail, len);
>>>>>  		g2h->info.broken = true;
>>>>>
>>>>>  		return -EPROTO;
>>>>> @@ -1027,8 +1030,9 @@ static void g2h_fast_path(struct xe_guc_ct
>>>>> *ct, u32
>>>> *msg, u32 len)
>>>>>  	}
>>>>>
>>>>>  	if (ret)
>>>>> -		drm_err(&xe->drm, "action 0x%04x failed processing,
>>>> ret=%d\n",
>>>>> -			action, ret);
>>>>> +		xe_gt_report_driver_error(ct_to_gt(ct),
>>>> XE_GT_DRV_ERR_GUC_COMM,
>>>>> +					  "action 0x%04x failed processing,
>>>> ret=%d\n",
>>>>> +					  action, ret);
>>>>>  }
>>>>>
>>>>>  /**
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
>>>>> b/drivers/gpu/drm/xe/xe_guc_pc.c index d9375d1d582f..1ee7b68a9fc4
>>>>> 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>>>>> @@ -197,9 +197,9 @@ static int pc_action_query_task_state(struct
>>>> xe_guc_pc *pc)
>>>>>  	/* Blocking here to ensure the results are ready before reading
>>>>> them
>>>> */
>>>>>  	ret = xe_guc_ct_send_block(ct, action, ARRAY_SIZE(action));
>>>>>  	if (ret)
>>>>> -		drm_err(&pc_to_xe(pc)->drm,
>>>>> -			"GuC PC query task state failed: %pe", ERR_PTR(ret));
>>>>> -
>>>>> +		xe_gt_report_driver_error(pc_to_gt(pc),
>>>> XE_GT_DRV_ERR_GUC_COMM,
>>>>> +					  "GuC PC query task state failed:
>>>> %pe",
>>>>> +					  ERR_PTR(ret));
>>>>
>>>> are we sure we want to count same problem several times?
>>>>
>>>> note that xe_guc_ct_send_block() will likely already report that as
>>>> "GUC COMM" error, should we do it again here ? or maybe this should
>>>> be different category/class ?
>>>
>>> I will double check if double counting is done here. Ideally I would make
>> sure that 1 counting happens at end for 1 path of error.
>>>
>>>>
>>>>>  	return ret;
>>>>>  }
>>>>>
>>>>> @@ -219,9 +219,9 @@ static int pc_action_set_param(struct xe_guc_pc
>>>>> *pc, u8 id, u32 value)
>>>>>
>>>>>  	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
>>>>>  	if (ret)
>>>>> -		drm_err(&pc_to_xe(pc)->drm, "GuC PC set param failed:
>>>> %pe",
>>>>> -			ERR_PTR(ret));
>>>>> -
>>>>> +		xe_gt_report_driver_error(pc_to_gt(pc),
>>>> XE_GT_DRV_ERR_GUC_COMM,
>>>>> +					  "GuC PC set param failed: %pe",
>>>>> +					  ERR_PTR(ret));
>>>>>  	return ret;
>>>>>  }
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
>>>>> b/drivers/gpu/drm/xe/xe_guc_submit.c
>>>>> index 870dc5c532fa..4b7fe6419d48 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>>>> @@ -1497,13 +1497,15 @@ g2h_exec_queue_lookup(struct xe_guc *guc,
>>>> u32 guc_id)
>>>>>  	struct xe_exec_queue *q;
>>>>>
>>>>>  	if (unlikely(guc_id >= GUC_ID_MAX)) {
>>>>> -		drm_err(&xe->drm, "Invalid guc_id %u", guc_id);
>>>>> +		xe_gt_report_driver_error(guc_to_gt(guc),
>>>> XE_GT_DRV_ERR_GUC_COMM,
>>>>> +					  "Invalid guc_id %u", guc_id);
>>>>>  		return NULL;
>>>>>  	}
>>>>>
>>>>>  	q = xa_load(&guc->submission_state.exec_queue_lookup, guc_id);
>>>>>  	if (unlikely(!q)) {
>>>>> -		drm_err(&xe->drm, "Not engine present for guc_id %u",
>>>> guc_id);
>>>>> +		xe_gt_report_driver_error(guc_to_gt(guc),
>>>> XE_GT_DRV_ERR_GUC_COMM,
>>>>> +					  "Not engine present for guc_id %u",
>>>> guc_id);
>>>>>  		return NULL;
>>>>>  	}
>>>>>
>>>>> @@ -1527,12 +1529,12 @@ static void deregister_exec_queue(struct
>>>>> xe_guc *guc, struct xe_exec_queue *q)
>>>>>
>>>>>  int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32
>>>>> len) {
>>>>> -	struct xe_device *xe = guc_to_xe(guc);
>>>>>  	struct xe_exec_queue *q;
>>>>>  	u32 guc_id = msg[0];
>>>>>
>>>>>  	if (unlikely(len < 2)) {
>>>>> -		drm_err(&xe->drm, "Invalid length %u", len);
>>>>> +		xe_gt_report_driver_error(guc_to_gt(guc),
>>>> XE_GT_DRV_ERR_GUC_COMM,
>>>>> +					  "Invalid length %u", len);
>>>>
>>>> nit: IMO such error messages are redundant as CTB will report failed
>>>> action anyway (including message dump, where invalid length could be
>>>> spotted)
>>>
>>> Can you please elaborate more here please?
>>
>> ok, so it looks that CTB implementation in Xe is less verbose than on i915,
>> where all errors were correctly propagated and related message was included
>> in the log
>>
>> on Xe this seems to be partially broken, as dequeue_one_g2h() always
>> returns 0 while g2h_worker_func() is prepared to kick reset on EPROTO:
>>
>> g2h_worker_func
>>   dequeue_one_g2h
>>     process_g2h_msg(msg, len)
>>       xe_guc_sched_done_handler(msg, len)
>>         drm_err(..."Invalid length
>>         return -EPROTO
>>     if (ret)
>>       drm_err("action 0x%04x failed processing, ret=%d\n",
>>     return 0;
>>
>> if (ret == -EPROTO...) {
>>   xe_guc_ct_print(ct, &p, false);
>>   kick_reset(ct);
>>
>> Note than once EPROTO errors will be correctly propagated, then it will trigger
>> a reset, thus it will conflict with your statement above that this error tracking
>> does include only perf errors.
>>
>> "Similarly for GT no reset errors, only GT perf errors"
>>
>>>
>>>>
>>>>>  		return -EPROTO;
>>>>>  	}
>>>>>
>>>>> @@ -1542,8 +1544,9 @@ int xe_guc_sched_done_handler(struct xe_guc
>>>>> *guc, u32 *msg, u32 len)
>>>>>
>>>>>  	if (unlikely(!exec_queue_pending_enable(q) &&
>>>>>  		     !exec_queue_pending_disable(q))) {
>>>>> -		drm_err(&xe->drm, "Unexpected engine state 0x%04x",
>>>>> -			atomic_read(&q->guc->state));
>>>>> +		xe_gt_report_driver_error(guc_to_gt(guc),
>>>> XE_GT_DRV_ERR_GUC_COMM,
>>>>> +					  "Unexpected engine state 0x%04x",
>>>>> +					  atomic_read(&q->guc->state));
>>>>>  		return -EPROTO;
>>>>>  	}
>>>>>
>>>>> @@ -1572,12 +1575,12 @@ int xe_guc_sched_done_handler(struct
>> xe_guc
>>>>> *guc, u32 *msg, u32 len)
>>>>>
>>>>>  int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg,
>>>>> u32
>>>>> len)  {
>>>>> -	struct xe_device *xe = guc_to_xe(guc);
>>>>>  	struct xe_exec_queue *q;
>>>>>  	u32 guc_id = msg[0];
>>>>>
>>>>>  	if (unlikely(len < 1)) {
>>>>> -		drm_err(&xe->drm, "Invalid length %u", len);
>>>>> +		xe_gt_report_driver_error(guc_to_gt(guc),
>>>> XE_GT_DRV_ERR_GUC_COMM,
>>>>> +					  "Invalid length %u", len);
>>>>>  		return -EPROTO;
>>>>>  	}
>>>>>
>>>>> @@ -1587,8 +1590,9 @@ int xe_guc_deregister_done_handler(struct
>>>> xe_guc
>>>>> *guc, u32 *msg, u32 len)
>>>>>
>>>>>  	if (!exec_queue_destroyed(q) || exec_queue_pending_disable(q) ||
>>>>>  	    exec_queue_pending_enable(q) || exec_queue_enabled(q)) {
>>>>> -		drm_err(&xe->drm, "Unexpected engine state 0x%04x",
>>>>> -			atomic_read(&q->guc->state));
>>>>> +		xe_gt_report_driver_error(guc_to_gt(guc),
>>>> XE_GT_DRV_ERR_GUC_COMM,
>>>>> +					  "Unexpected engine state 0x%04x",
>>>>> +					  atomic_read(&q->guc->state));
>>>>>  		return -EPROTO;
>>>>>  	}
>>>>>
>>>>> @@ -1611,7 +1615,8 @@ int xe_guc_exec_queue_reset_handler(struct
>>>> xe_guc *guc, u32 *msg, u32 len)
>>>>>  	u32 guc_id = msg[0];
>>>>>
>>>>>  	if (unlikely(len < 1)) {
>>>>> -		drm_err(&xe->drm, "Invalid length %u", len);
>>>>> +		xe_gt_report_driver_error(guc_to_gt(guc),
>>>> XE_GT_DRV_ERR_GUC_COMM,
>>>>> +					  "Invalid length %u", len);
>>>>>  		return -EPROTO;
>>>>>  	}
>>>>>
>>>>> @@ -1646,7 +1651,8 @@ int
>>>> xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32
>>>> *msg,
>>>>>  	u32 guc_id = msg[0];
>>>>>
>>>>>  	if (unlikely(len < 1)) {
>>>>> -		drm_err(&xe->drm, "Invalid length %u", len);
>>>>> +		xe_gt_report_driver_error(guc_to_gt(guc),
>>>> XE_GT_DRV_ERR_GUC_COMM,
>>>>> +					  "Invalid length %u", len);
>>>>>  		return -EPROTO;
>>>>>  	}
>>>>>
>>>>> @@ -1667,12 +1673,12 @@ int
>>>>> xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32
>>>>> *msg,
>>>>>
>>>>>  int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32
>>>>> *msg, u32 len)  {
>>>>> -	struct xe_device *xe = guc_to_xe(guc);
>>>>>  	u8 guc_class, instance;
>>>>>  	u32 reason;
>>>>>
>>>>>  	if (unlikely(len != 3)) {
>>>>> -		drm_err(&xe->drm, "Invalid length %u", len);
>>>>> +		xe_gt_report_driver_error(guc_to_gt(guc),
>>>> XE_GT_DRV_ERR_GUC_COMM,
>>>>> +					  "Invalid length %u", len);
>>>>>  		return -EPROTO;
>>>>>  	}
>>>>>
>>>>> @@ -1681,8 +1687,9 @@ int
>>>> xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg,
>>>> u32 le
>>>>>  	reason = msg[2];
>>>>>
>>>>>  	/* Unexpected failure of a hardware feature, log an actual error */
>>>>> -	drm_err(&xe->drm, "GuC engine reset request failed on %d:%d
>>>> because 0x%08X",
>>>>> -		guc_class, instance, reason);
>>>>> +	xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_ENGINE,
>>>>> +				  "GuC engine reset request failed on %d:%d
>>>> because 0x%08X",
>>>>> +				  guc_class, instance, reason);
>>>>>
>>>>>  	xe_gt_reset_async(guc_to_gt(guc));
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_irq.c
>>>>> b/drivers/gpu/drm/xe/xe_irq.c index def9369eb488..2d00baf2c127
>>>>> 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_irq.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_irq.c
>>>>> @@ -18,6 +18,7 @@
>>>>>  #include "xe_guc.h"
>>>>>  #include "xe_hw_engine.h"
>>>>>  #include "xe_mmio.h"
>>>>> +#include "xe_tile.h"
>>>>>
>>>>>  /*
>>>>>   * Interrupt registers for a unit are always consecutive and
>>>>> ordered @@ -222,8 +223,9 @@ gt_engine_identity(struct xe_device *xe,
>>>>>  		 !time_after32(local_clock() >> 10, timeout_ts));
>>>>>
>>>>>  	if (unlikely(!(ident & INTR_DATA_VALID))) {
>>>>> -		drm_err(&xe->drm, "INTR_IDENTITY_REG%u:%u 0x%08x not
>>>> valid!\n",
>>>>> -			bank, bit, ident);
>>>>> +		xe_tile_report_driver_error(gt_to_tile(mmio),
>>>> XE_TILE_DRV_ERR_INTR,
>>>>> +					    "INTR_IDENTITY_REG%u:%u
>>>> 0x%08x not valid!\n",
>>>>> +					    bank, bit, ident);
>>>>>  		return 0;
>>>>>  	}
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c
>>>>> b/drivers/gpu/drm/xe/xe_reg_sr.c index 87adefb56024..9ee62ff209eb
>>>>> 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
>>>>> @@ -125,12 +125,12 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
>>>>>  	return 0;
>>>>>
>>>>>  fail:
>>>>> -	xe_gt_err(gt,
>>>>> -		  "discarding save-restore reg %04lx (clear: %08x, set: %08x,
>>>> masked: %s, mcr: %s): ret=%d\n",
>>>>> -		  idx, e->clr_bits, e->set_bits,
>>>>> -		  str_yes_no(e->reg.masked),
>>>>> -		  str_yes_no(e->reg.mcr),
>>>>> -		  ret);
>>>>> +	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS,
>>>>> +				  "discarding save-restore reg %04lx (clear:
>>>> %08x, set: %08x, masked: %s, mcr: %s): ret=%d\n",
>>>>> +				  idx, e->clr_bits, e->set_bits,
>>>>> +				  str_yes_no(e->reg.masked),
>>>>> +				  str_yes_no(e->reg.mcr),
>>>>> +				  ret);
>>>>>  	reg_sr_inc_error(sr);
>>>>>
>>>>>  	return ret;
>>>>> @@ -207,7 +207,7 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr,
>>>> struct xe_gt *gt)
>>>>>  	return;
>>>>>
>>>>>  err_force_wake:
>>>>> -	xe_gt_err(gt, "Failed to apply, err=%d\n", err);
>>>>> +	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS, "Failed to
>>>>> +apply, err=%d\n", err);
>>>>>  }
>>>>>
>>>>>  void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe) @@ -234,9
>>>>> +234,9 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
>>>>>  	p = drm_debug_printer(KBUILD_MODNAME);
>>>>>  	xa_for_each(&sr->xa, reg, entry) {
>>>>>  		if (slot == RING_MAX_NONPRIV_SLOTS) {
>>>>> -			xe_gt_err(gt,
>>>>> -				  "hwe %s: maximum register whitelist slots
>>>> (%d) reached, refusing to add more\n",
>>>>> -				  hwe->name, RING_MAX_NONPRIV_SLOTS);
>>>>> +			xe_gt_report_driver_error(gt,
>>>> XE_GT_DRV_ERR_ENGINE,
>>>>> +						  "hwe %s: maximum register
>>>> whitelist slots (%d) reached, refusing to add more\n",
>>>>> +						  hwe->name,
>>>> RING_MAX_NONPRIV_SLOTS);
>>>>>  			break;
>>>>>  		}
>>>>>
>>>>> @@ -259,7 +259,7 @@ void xe_reg_sr_apply_whitelist(struct
>>>>> xe_hw_engine
>>>> *hwe)
>>>>>  	return;
>>>>>
>>>>>  err_force_wake:
>>>>> -	drm_err(&xe->drm, "Failed to apply, err=%d\n", err);
>>>>> +	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS, "Failed to
>>>>> +apply, err=%d\n", err);
>>>>>  }
>>>>>
>>>>>  /**
>>>>> diff --git a/drivers/gpu/drm/xe/xe_tile.c
>>>>> b/drivers/gpu/drm/xe/xe_tile.c index 708dd385f2b1..0f0ec8f33a51
>>>>> 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_tile.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_tile.c
>>>>> @@ -71,10 +71,17 @@
>>>>>   *  - MOCS and PAT programming
>>>>>   */
>>>>>
>>>>> +const char *const xe_tile_drv_err_to_str[] = {
>>>>> +	[XE_TILE_DRV_ERR_GTT] = "GTT",
>>>>> +	[XE_TILE_DRV_ERR_INTR] = "INTERRUPT"
>>>>
>>>> "IRQ" ?
>>>
>>> These are furious reported interrupts errors which does not have handlers,
>> so naming is correct.
>>>
>>>>
>>>>> +};
>>>>> +
>>>>>  /**
>>>>>   * xe_tile_report_driver_error - Count driver error for tile
>>>>>   * @tile: Tile to count error for
>>>>> - * @err: enum error type
>>>>> + * @err: Enum error type
>>>>> + * @fmt: debug message format to print error
>>>>> + * @...: variable args to print error
>>>>>   *
>>>>>   * Increment the driver error counter in respective error
>>>>>   * category for this tile.
>>>>> @@ -82,11 +89,26 @@
>>>>>   * Returns void.
>>>
>>> I will check the documentation.
>>>
>>>>
>>>> nit: is this a proper way to document "void" functions ?
>>>>
>>>>>   */
>>>>>  void xe_tile_report_driver_error(struct xe_tile *tile,
>>>>> -				 const enum xe_tile_drv_err_type err)
>>>>> +				 const enum xe_tile_drv_err_type err,
>>>>> +				 const char *fmt, ...)
>>>>>  {
>>>>> +	struct va_format vaf;
>>>>> +	va_list args;
>>>>> +
>>>>>  	xe_assert(tile_to_xe(tile), err >= ARRAY_SIZE(tile->drv_err_cnt));
>>>>>  	WRITE_ONCE(tile->drv_err_cnt[err],
>>>>>  		   READ_ONCE(tile->drv_err_cnt[err]) + 1);
>>>>> +
>>>>> +	va_start(args, fmt);
>>>>> +	vaf.fmt = fmt;
>>>>> +	vaf.va = &args;
>>>>> +
>>>>> +	BUILD_BUG_ON(ARRAY_SIZE(xe_tile_drv_err_to_str) !=
>>>>> +		     XE_TILE_DRV_ERR_MAX);
>>>>
>>>> move to xe_tile_driver_error_to_string() instead
>>>
>>> Like said above, such API is not needed.
>>
>> so maybe at least make this xe_tile_drv_err_to_str[] static ?
>> it doesn't look to be used outside this function
>>
>> Michal
>>
>>>
>>> Thanks,
>>> Tejas
>>>>
>>>>> +
>>>>> +	drm_err(&tile->xe->drm, "TILE%u [%s] %pV",
>>>>> +		tile->id, xe_tile_drv_err_to_str[err], &vaf);
>>>>> +	va_end(args);
>>>>>  }
>>>>>
>>>>>  /**
>>>>> diff --git a/drivers/gpu/drm/xe/xe_tile.h
>>>>> b/drivers/gpu/drm/xe/xe_tile.h index 092a6b17a97e..1e23acdb9c81
>>>>> 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_tile.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_tile.h
>>>>> @@ -14,7 +14,9 @@ int xe_tile_alloc(struct xe_tile *tile);  int
>>>>> xe_tile_init_noalloc(struct xe_tile *tile);
>>>>>
>>>>>  void xe_tile_migrate_wait(struct xe_tile *tile);
>>>>> +extern const char *const xe_tile_drv_err_to_str[];
>>>>
>>>> don't expose it, hide in xe_tile_driver_error_to_string() if needed
>>>>
>>>>>  void xe_tile_report_driver_error(struct xe_tile *tile,
>>>>> -				 const enum xe_tile_drv_err_type err);
>>>>> +				 const enum xe_tile_drv_err_type err,
>>>>> +				 const char *fmt, ...);
>>>>>
>>>>>  #endif
