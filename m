Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9845EB64DD
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jul 2023 04:47:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D7F510E12C;
	Wed,  5 Jul 2023 04:47:15 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC9C10E12C
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jul 2023 04:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688532433; x=1720068433;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=7YpF8/7FFpmykP1VflbKjkQvvld0Z8Oz3rOEVdWRhlw=;
 b=n//Sy9COa5jYbwQ8aRnG+HzrMk2ifWWNG5SmAhVY5nSdVDXeigyCSX/Q
 FFnj9QEMUJ3+dOS4zvkpQb835uDSkrsbc7m9j1ujP141HLlOGoRhTTY3Z
 wN8WBzEiX5FVgjIvKKJ0TNQS+FvcV62+FlQO8PIU7BpQLmVAmPSD3rGaf
 biMBPiXpcMAAv49UfM7nFRu7JqAbCqcVOwgAWbvTqZAjn6ZgAnqwcOBVU
 3Ah4M/OU3XgTQyCg+S+XCtMF/lq0H8VAiDXe9Ctoj2McRq+WsgEq9vu6d
 bcbvzksff0UVSAx4/GG4kisaIF5Mb83DogVFTnVEVdl9Dq5Ndy299d+7F Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="449615866"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; d="scan'208";a="449615866"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 21:47:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="669266245"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; d="scan'208";a="669266245"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP; 04 Jul 2023 21:47:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 4 Jul 2023 21:47:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 4 Jul 2023 21:47:10 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 4 Jul 2023 21:47:10 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 4 Jul 2023 21:47:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MT6s/rTmhUZycKfD5su1f/uEpoBccvil0UYaTLQblVEen7fKjwam1MRWjOskO5/mSxl3nM5B8B03s3rwyFfxvhPtqCVPTrvOUVjeixxZrBxqVZVEsZAQ4rrxlfFluNtOW1RecJqtUV5ZcFhQF5dGGD0s7w/DYFjDqLQxkBNEIuvfEV6v2CxxzDGiyH1Z/TkYTLu71cjMRZqlnkJHXrH3Y/X1RJTd3JwQ6yf+SYacT+bLbcDcDCt5MO9CdQ6paFGiXxr1NKVnvlvjKyJZvl+fyLww7hfasibPtOS8SKlw7tfy6157YfPiIlS6vnBm5ohcHpf1Rihb9e4UiNhSxaoscQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OzglUPEfOFpiv8rSqwnBcLTFXPEDLH8HrJGLBPJKlWI=;
 b=KJoCYsmfyAx89oKKJvQ8gh3IC54zmSb0YJyHK/zOsxXGTpig0P23JNiV5qvL4JlN7cZ1TithkzZWvQUNQq1FoVP0TmiRTuTU6oV+WFl6Gw1NNdyn//2Q2JOj2UzT4jzgI72m5EIocRJvM3oPLtKlk8Mrx6bSBF3nqzO04dMkhimTDJHmpQg7hJkHF9oyQbQ+ox8defeBTydGqe85WmTxTkDOLxJtWCSSkTt5u6YOtDQqbUHglKxFwugbUEfw32wqQZJD+5zKcConfxE1kNmPigd1bMFrCHcc/qO+CEAGXNkxmCkGx8Ire3Xcl1tRnemeBpISjLlBxMS4jZvqR6iv2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by IA1PR11MB7774.namprd11.prod.outlook.com (2603:10b6:208:3f2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 04:47:08 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::6082:8da2:e39:aeff]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::6082:8da2:e39:aeff%4]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 04:47:08 +0000
Message-ID: <39f1f244-0097-09d2-e72b-4c7d56eb65a2@intel.com>
Date: Wed, 5 Jul 2023 10:16:59 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
Content-Language: en-US
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20230627122113.1472532-1-aravind.iddamsetty@intel.com>
 <20230627122113.1472532-2-aravind.iddamsetty@intel.com>
 <SJ1PR11MB62049A616B9C44D0F8708F2F812EA@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <SJ1PR11MB6204B29030FCE47C8201AE26812EA@SJ1PR11MB6204.namprd11.prod.outlook.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <SJ1PR11MB6204B29030FCE47C8201AE26812EA@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0066.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::15) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|IA1PR11MB7774:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bf413b6-fa33-489a-d7ae-08db7d12e274
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ifkCiCJyoQMu9wre9KA/KMMWuhPT4OmU+DRs9SF69U1FTC1pRLjK+sSOocZKs0T4p6PG/c3VkdYzqSJiif7CUb3F/c6oFYXiNUFAhJhCkiSYOXK4glcJiM97RStBbpAcON78fPXahD7kHdB/z7MZIBl7IK5796Z0niPaYwBxxb25gF4CUl/1fJ9zGDg/6ynCrZS1XNhx+zrmlaCy6NGzzPF76Cl2vwGXL6vL6l8D5JOWq04qT7BZp2obtAera3IZ6CJ9R7hhSGvBBKf7/KA2ENH6h0jWM+uWa8vgPZMD+0KFhs6FJRpiEtM9L+xo99PkD/ESweTfaBRnibvxkFezWKrKB/kUKg7wXuLtCvloQ4uh80DaoHotzJWLX9mHpME178k4R77t4AAzUjqBZ50PvOtDPYym3pAY5LU7veHooEzcqy2Tc6O36I5utMDZlcc+fpXWTrOeFXiy9tA1XxGbXS5uy4vErVeafEBXIJMj4yAIWGNsUkrgZx4V/stR2Oeak2Q/D5p0pVE4gFH9Q+Cnm31rxutDIKSkTeulN54vBmxKu9eD0Gei7hTpbX2zJJvynOLABG24xtwqC8J2lkU+K8QBGFrvuL6Pp0dcvf9M2cRyJKlPVO6UjGRJIdL6Y+mN170/7OJRzkpbW37IkQPS7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(346002)(396003)(366004)(39860400002)(451199021)(478600001)(82960400001)(26005)(6666004)(31686004)(6512007)(6506007)(86362001)(31696002)(2616005)(186003)(38100700002)(66476007)(66946007)(66556008)(83380400001)(110136005)(53546011)(6486002)(316002)(5660300002)(8676002)(8936002)(41300700001)(2906002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVJ2ZXRHbWMwSzVIdEFueG9Ka2ZUMm03emNVNnJRNnVpRGQxZy9JZFpMakcy?=
 =?utf-8?B?QlJIVTViUzkwZnBucnNNYlpBdXM2cVo3SEpRQ0FNU3ZrZUlWRmdVbWtkRFFN?=
 =?utf-8?B?c2JuZjhnVXk2UVpScXZialdQbHZoNUl6cFdDTUZjR3NOOE5hdHZDb2xYTFgx?=
 =?utf-8?B?N3dJSnRnTEF0QkhZY2lCQVdpTHN2NnBEd2p5K2RPcTBOYjFUVU1lNmUxR1M1?=
 =?utf-8?B?MGN3clJWVWVISkFyMmRlSGJHSEZvMGpEM0xSMVhHcXBibVVoTVo5eHdTL0hi?=
 =?utf-8?B?Qk9hS2M0Ui85MHV6WUoxNzZoc2Y2U1lSYlRxNzdqUDJyRW9WT1NnUDlzMm5V?=
 =?utf-8?B?RVdxaVZJb0VZVXVmeitlSUtMVzNEWTlsdU9Ba1Q3eHBkWEp2ckdOODVDUE10?=
 =?utf-8?B?bFUwam4vQ0J3UnJpaVRmcExBcjEwSjlUQWxIb3BCcW1CQVlPYksxbXlLQlZi?=
 =?utf-8?B?MHF4VGNpL2tBeGo4REJkcFN4L1V2Rmg1UDdWUDN3MzZqeTdSQVhzdGNhL09n?=
 =?utf-8?B?SnJPUjRXUk8rN1A1dEVKa2ZZZTE0VXE0MVEyODJ1YW9qWTZUYytJdTBlWm9P?=
 =?utf-8?B?Rzg0NlIrRS96MFNMc25PZGhlaHkybDZlNnNZSm5FNzRvMlA2alc0Sk54bGVV?=
 =?utf-8?B?eVlHME9PZ1FqR3FhMUtRMGg2allxWmYxalpJd3UrKzJIcXdwRW9SL0M1V1RD?=
 =?utf-8?B?dDgxWVJzWEIyRjlaRkMxYWpSNzdIUTBjeG9zQ0Y3d0F0bmRKeXpmTTRyWldv?=
 =?utf-8?B?UkNKdjBYSW1mRi94L0FKV3dWdGFHNW5Ja3hteTdZd29FTnRkbFRDREtXY1pZ?=
 =?utf-8?B?R1VwclBva2JYU1h5NTRGN0pjNGROdUxzYWozdmtXelVrTGdZSDFtNUdYZDhi?=
 =?utf-8?B?d3Z5cjc0cmUrcnRhNnF1WmJkME51N0hOSGdjbzByNWtUR1VGS2VtRzFudnQ1?=
 =?utf-8?B?cVUxd2FtZ25KREgzMithUG9tTVluUGlBc0YzWlhmd0gvZHh2bmdPcjg0dzFt?=
 =?utf-8?B?QzNhMkxKb1JYZU8yak4xUHMzclJGckM0MElsQ292YWR0WUxwcFZ3WFBQK3RR?=
 =?utf-8?B?Yi80WTdDK0dtNThtazBwK2tYN1B3SDJyNDNzV3dkUlZrbjV2cjRNdmYvQndY?=
 =?utf-8?B?RjlCZ3JIVk5CdnM5Tnk2SWU3WUlmR1ZwbXFpNXVKdDhoWDF6VlRWWFBsSEdM?=
 =?utf-8?B?WHhXSWVJREVlNWh5ZHdBY0g0SWM3SlNHOFYxYU1Dc0VHRThFa2xTUWgxaThE?=
 =?utf-8?B?ZW0rV2k0UTczQTF1SlpIT2ZhajRRRHcxWFRFY2hKUklIUXV5Y2QrKysvby9y?=
 =?utf-8?B?Sy9mNGZTL3JSMTRmaHZURVQ1SXlMSGQrM2NQSUJrOHduUnptdUJNejBiWjhE?=
 =?utf-8?B?MnNYQUpqWEl2MTk5NVZTdGdMVzBWRWIxdnNpeGZVQWZKb0s0UVd1RnY1OWlh?=
 =?utf-8?B?d3ZGekhxZVlLNTY3NHdkRW5vV1piVStFNlRRNUVibHZCRzd1Yit2N2xQVUpE?=
 =?utf-8?B?TnhYdytjUnpoWTcwcHVvR1JKSUV6R0pKK0duVXpMUmlzZkxIL1FueHo5R0h1?=
 =?utf-8?B?U0V3bzBlVEFWL282MXZOQjRkdVZyTUpBNkJpV2J6c0lSNW00N2d1R3hvV25B?=
 =?utf-8?B?ajQ4djArbUgydGFwRC9yR21LMGNQcXk4Vkwyb1N5ZmRveHQrUkFCUExnZEFw?=
 =?utf-8?B?a2FyU1lObUpHVXpyMjNkeTh3OXZoejBRTWpZUVVNSUJEUmVXYllKb1o3eGV0?=
 =?utf-8?B?TnlLdUd6eXQrcEd6L1kzcVNHOHozaGhITTVZQzBRUDdiQXplVGVMVGx6VVJp?=
 =?utf-8?B?Y2ZnUkppT3YwK0RDSm9ZZmMvZGJkZzRHUWxVR1NMOVFPb3c5YUFyZUNieHpH?=
 =?utf-8?B?VGRRSFg4c1FiZlgxZEwyd01hUzhVNmJ5cHBzd09NaWl0U0ExT1MvaVM5WmpG?=
 =?utf-8?B?TFgvOUg3clhGM3lFL1BUUVAvRDdZdDVjeitwa1RaZTB2em1YUzkwd0JmNmVm?=
 =?utf-8?B?K045R3JIVDlVRldQN2s2QzQ5TW8yclFoaXFUQTBEVWxyZjRUcEc2L1J3cFlo?=
 =?utf-8?B?TC84NG1SN2tiSGlERHRRRXphdG1tdzVWeUZXK0NCWnhHTHNVSzlZcGpPNnZt?=
 =?utf-8?B?MzY3UzA5bTM3MERML0JVcVV4NEF1OXg3cGx4di90T2pJSWJzYXFTWDhHUjZk?=
 =?utf-8?B?aGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bf413b6-fa33-489a-d7ae-08db7d12e274
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 04:47:07.4815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gw1YA2J7o36fqt6CHN7AbbF/TikGqHGz7KovyyWfXs9QB1aH/ONRV0GBj3oO1MHCI5YKQ7dRbRBBebBLZ2OBem8/uEhFsbwn8medttzBnLc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7774
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/2] drm/xe: Get GT clock to nanosecs
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



On 04-07-2023 15:44, Upadhyay, Tejas wrote:
> 
> 
>> -----Original Message-----
>> From: Upadhyay, Tejas
>> Sent: Tuesday, July 4, 2023 2:59 PM
>> To: Aravind Iddamsetty <aravind.iddamsetty@intel.com>; intel-
>> xe@lists.freedesktop.org
>> Subject: RE: [Intel-xe] [PATCH v2 1/2] drm/xe: Get GT clock to nanosecs
>>
>>
>>
>>> -----Original Message-----
>>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
>>> Aravind Iddamsetty
>>> Sent: Tuesday, June 27, 2023 5:51 PM
>>> To: intel-xe@lists.freedesktop.org
>>> Subject: [Intel-xe] [PATCH v2 1/2] drm/xe: Get GT clock to nanosecs
>>>
>>> Helpers to get GT clock to nanosecs
>>>
>>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_gt_clock.c | 10 ++++++++++
>>> drivers/gpu/drm/xe/xe_gt_clock.h |  4 +++-
>>>  2 files changed, 13 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c
>>> b/drivers/gpu/drm/xe/xe_gt_clock.c
>>> index 7cf11078ff57..3689c7d5cf53 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_clock.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_clock.c
>>> @@ -78,3 +78,13 @@ int xe_gt_clock_init(struct xe_gt *gt)
>>>  	gt->info.clock_freq = freq;
>>>  	return 0;
>>>  }
>>> +
>>> +static u64 div_u64_roundup(u64 nom, u32 den) {
>>> +	return div_u64(nom + den - 1, den);
>>> +}
> 
> Also this API can be moved to more common place like, xe_drv.h for others to use when needed?

xe_drv.h is not the right place to move, atleast for now do not see any
use other than here so i let it stay here for now.

Thanks,
Aravind.
> 
>>> +
>>> +u64 xe_gt_clock_interval_to_ns(const struct xe_gt *gt, u64 count) {
>>> +	return div_u64_roundup(count * NSEC_PER_SEC, gt-
>>>> info.clock_freq); }
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_clock.h
>>> b/drivers/gpu/drm/xe/xe_gt_clock.h
>>> index 511923afd224..91fc9b7e83f5 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_clock.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt_clock.h
>>> @@ -6,8 +6,10 @@
>>>  #ifndef _XE_GT_CLOCK_H_
>>>  #define _XE_GT_CLOCK_H_
>>>
>>> +#include <linux/types.h>
>>> +
>>>  struct xe_gt;
>>>
>>>  int xe_gt_clock_init(struct xe_gt *gt);
>>> -
>>> +u64 xe_gt_clock_interval_to_ns(const struct xe_gt *gt, u64 count);
>>>  #endif
>>
>> Looks ok to me,
>> Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>
>>> --
>>> 2.25.1
> 
