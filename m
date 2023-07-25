Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57B7C0015E
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 11:39:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C6DF10E00F;
	Tue, 25 Jul 2023 11:39:06 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A816410E00F
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jul 2023 11:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690285144; x=1721821144;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tNGuqIf3i1PO3vBdZAxjEci2A3TAgSIhXh/n6x/jRUw=;
 b=ZZoI2HkveEshw7yIo2GZKZYZIHSBDzZdG8gYLq/4GqSl92RakF4XSH2+
 aW55IjpGYFam34t1uv6QqA6HWXWs393+LFIZIdEPETNlRp9cvYfi8dZyk
 MoBzR9gu8CtmUGdY4gTzxCcryRznA9kZc42HuX54+sWOQSqlHO8e/irHk
 OLy6aTl5NI2XRyHZFfN96UhaUiwFYqstxujWxuLWLFA15zcDa/i0lgEVf
 /Ax6x2LiLjdPoyKmFTr8pk5puhAfLLrkW6g+w1cueA8qJsxFH18q5TeG6
 3U9pp4LlUK5WZ2S6O7qkDdlvNuDjTL6eGVLnoxcRBZ/FCRhxrxDATysse w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="365157224"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="365157224"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 04:39:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="720029045"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="720029045"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP; 25 Jul 2023 04:39:03 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 04:39:03 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 04:39:03 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 25 Jul 2023 04:39:03 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 25 Jul 2023 04:39:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VVgrAFD38uYOHPYLcmXwiBm0evMXtElM2fRQwpXoPxMqtpsafj9wQCU0bI/IX5bX31p1REhuQNmcWbx7Ao1qRHYgf8GGVJhgP8yUmCboJpvM9q0jTasgSy4Vte8NXSemdXq1of9dUHpNbr5yGKO4cpeHULQDDcn8JOZmPNkvxEG5nYQBrtJN/oJlsFwZvTdrCxf6VsTMmO1nNAvhqmvqMKK0BOXqfdY1H0UHpIE5jWNJSpXwkFIqELkMnCiZxgeuX00ErBX2Qwq2dS+uFRoG1aIhZUPJ75yGwXpaTXu19uEA221VBYkrjN0/MW8G63yRZMoNc44KvQtnq0mjIbeq8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTEFJWS7vOECvqNWAHNZS2DeLxcer8dwAIefeTx/Rbs=;
 b=HJDcXLqx4RNf4UrGdjv5ycnA4zVtw3uUreZaPgxjwquo+AeR/HzDTe1yB6LZH7GjI988FYBVBTri1xZeXQKkmYDT6Hkz8cHMWXRQK3S4AhwJhvmXzvsmrkCfNM4CJNVwGLRqGW0kKGBlvwTaOaQ1UgIL+yybrTeqJk69Ab5gVjlbsiSXFqohV2/yhymvjtmhN00Pg1EH0JnfiyaM2h9wVDXr4WzRriV0iHSbtUd5UMGDnlQtpnq4s0Q2zCYyuZ0YMWX/piZEzRtDw1hseuIIBQ32iAs+ay2fw3HvCIPguxTO4zXV6rOfWc96wr0qkHC/jWnT+vIQeaqomTANmsrOuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by PH0PR11MB4823.namprd11.prod.outlook.com (2603:10b6:510:43::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 11:38:56 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::a581:e6a4:d186:c153]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::a581:e6a4:d186:c153%7]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 11:38:56 +0000
Message-ID: <500331df-d95b-d447-18e6-d0f198570072@intel.com>
Date: Tue, 25 Jul 2023 17:08:45 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230627122113.1472532-1-aravind.iddamsetty@intel.com>
 <20230627122113.1472532-3-aravind.iddamsetty@intel.com>
 <87cz0mqdpi.wl-ashutosh.dixit@intel.com>
 <f4f6c8f9-a97d-6072-cf0c-4122b3d4f93f@intel.com>
 <877cqsrg65.wl-ashutosh.dixit@intel.com>
 <875y6cqy6p.wl-ashutosh.dixit@intel.com>
 <8fd9bc04-b737-0acd-a0c9-4f163c1a117c@intel.com>
 <87351dqpcr.wl-ashutosh.dixit@intel.com>
 <42bb140d-2faf-43d3-a027-fe430b3682e5@intel.com>
 <87zg3lp8y5.wl-ashutosh.dixit@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <87zg3lp8y5.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0197.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::6) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|PH0PR11MB4823:EE_
X-MS-Office365-Filtering-Correlation-Id: faae43b1-c847-4585-4716-08db8d03ba6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WywJUws8FAli1c2DneFrsTS/6Ax9jvdsQ8JqougkeXhG593ey4ZefQY+Ncvm0e4EVNS982NgmJ3nlRrYrdDyz20JXPteQHN82csQPOUdeBdkQx1T3tGabQSmZZ0kop7uHAEVeJ5CDoU802Mn6JwMBLwN4rHHCoa+A67nTu/26bq8lVbj3rpdBJdIMTvNabr2NOevfyByO/qLk5f+P002PsqSCDdGnRFU5m6oAy972E53XpXhbqJLNWdzebFB441vIfTqv1UE47vhYL/+Plani+tFSAa5YiatR5a5lnP2+EdKNZGlP0NSk0B9Ea6OdTXR+2LqTAvC25CTsG0BGv24ct4MtIjiwD2/VwXA1EzxhbbFYSZD8M/4lgOjfDX4KDNKkGXKiKRhqdwrJOEmSXKQnHe8TaPI4Csj/PZtdBk+IP/HD0ctxbIEcTFOLfygr/Nyes54qnB0W8APS9pF8L00bIyYAYLeFPrGoyKkauidwJ1HzFrS7+eQICyXPOaGs6ZE1f3U6BD5R8hYqNcSIxPuHRzCeLqF8u+D9frocVmEijSNuF7TRQxbDD4EROVlUpKqYXwGQukEYwT4XlLtxBgUCrzclQm7105zzmdfyRmQXxppxq8qNEmLaEFJys8SJxurqmuZAvvzEXv891ioIgu+7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(346002)(396003)(39860400002)(366004)(451199021)(31686004)(107886003)(53546011)(478600001)(86362001)(31696002)(6862004)(8936002)(8676002)(41300700001)(5660300002)(54906003)(37006003)(6636002)(4326008)(316002)(6512007)(66476007)(6486002)(66946007)(6666004)(66556008)(82960400001)(6506007)(186003)(38100700002)(2616005)(2906002)(26005)(36756003)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1FGa21FUGJmZnpjMU8vRkNZUGgxRmVGcnl5RE1zYVl4WG0xeXlKUEo5dnY3?=
 =?utf-8?B?SHc2VTV0MDJCK1dCckpJQWlmc0ZBNXFrRmw1K0xvZFQ3aDVMSHRQMXNyWGNG?=
 =?utf-8?B?NEFQcjEzRGhpaVpmWkhKSXpHWVFiZ2R2S0MwSzBwTmhHQ0pOb1ZmY2FEVHho?=
 =?utf-8?B?MVk0b3Rab1hHOTlYYjRKZnBFVlQ5MzB6Tms0eDU4S2ZNR3Rweld3L0lxM2ds?=
 =?utf-8?B?UXlVamVJdXBWbDJDVmRoKzVQMUpZY2o0ZlJmU3JqN0NDNXRqV1NLcTF6N0hX?=
 =?utf-8?B?NUFBMjVWdEt5WGRXMG5NdU9PZjRTYXBjWWk1QzFsZmRGUExmTVNVSDYwL3hz?=
 =?utf-8?B?b1RhSlliTzk2dzRiZDVPTWlaY1crWmM4Tlc1UHF2Y1MyVWQwVHVjQmpiZHhk?=
 =?utf-8?B?OGUzODVtQml5Q1J4Y2tpN2gyc1d1dGIxVHhQY1l1bmJkQ2p4bWYzekhmR0Jt?=
 =?utf-8?B?K1o3U3FWVEhNYjRWNHhQVUFaOXNqTTNFaTFTbHJONGVLeTNuRTVxTERuRi9j?=
 =?utf-8?B?QmVaTzIrUlBsSllKMjJpZGwwenhCREJlWWxzV1JzMW81VkxmU3l4dnhnUlBS?=
 =?utf-8?B?bTllS1N2a3EzRnd6azNyTzQ5YThrZjQwaXVJTWJtdy9qV3M2QWZWRUJvcmtV?=
 =?utf-8?B?bXB5TllBTVBNdHdYakxTclFpNTB2R3dIdDJhVUk1QytMT2lZOVM1TFFiM29K?=
 =?utf-8?B?SEpleVpzTWxsKzdwVGVpbjlQY1p1UTZiQzlSMFFzQkRQeDh3enl0Z05aK3Vl?=
 =?utf-8?B?T0o2KzB1K05PSlgvdTZHaW9TclRDdTZvRStUNGFvSUpOMVdQb1VRN2wzeG5r?=
 =?utf-8?B?cXNrUVExWmIrMU5Fdm5aWU5ScVBsbzQ3K2dTRDVCMC9pMzN6aGZ6NXhROVZE?=
 =?utf-8?B?WSt0NzdxbXJrd2l4L3pyZEQ1aGttVndkcndMM21lY0xpdkNIYWFaNWxUWW5V?=
 =?utf-8?B?eVIzNjdMcUovL09BeDMxWHZzUEdJME9yR1ZvSFZuQzROUkhLc0Via2l4bVJX?=
 =?utf-8?B?QlRtRDRsMDJ0Q25jVnJLYzJOSFYrckZVWStzcEN2d0xWaUpsRkZnWmJkTW1Y?=
 =?utf-8?B?aUhEZjJsLzgyanFxTUxhYmNCZjEza1p3dlZJMWMxNFRoeEo2elNta3BOUER6?=
 =?utf-8?B?UTBrT1Iwd1NJcDZyYi9CNE1CaU9FcXJwRlc0K0EwOFY2N1BlVU9jZ2JrcVVy?=
 =?utf-8?B?RmxTTTRJb2IvakJEeDc3YmYxa3ZubkN1YUpZTGNaTWQxRDUvS0VsdnFXL200?=
 =?utf-8?B?WExlazk5Mmo3cDFzWTRHZE1XR2E3UjZSWWFQUTJWcFRCTTdKWDY0b0ZFRVpJ?=
 =?utf-8?B?OVNVUUpqY0NOaDJ1NGpRalVndzFhcDBRNnJON1pORHdhRU9iZHUxM0pYQW5G?=
 =?utf-8?B?cFR3dWZhemtwNUR1Z0x6QW9ERlo3M1RNUG5XTVo3OXkzdmFtUERTMDVNRHpa?=
 =?utf-8?B?SlBhWkVNajJMY3Z4blJ3a3haWUFUT0E5OC9rMTV5MnM3TlI5SUhWdDdpNndM?=
 =?utf-8?B?YmVHTHMzLzExWjNyRUY2NnBNM0ZzUFErWnE5azhieXc5UHArd0Fyb3Q1Tnp4?=
 =?utf-8?B?cmo2dkRpd3Q2VCtydloxWW8xU1RSL0pqTyt6S3p1MlYycmozUW4yc0NrN0JS?=
 =?utf-8?B?ZkY0eUNsVi9oV0pZZUVxR25IbGFzdkdtVEQybWJ0S3lreWVwanc2d3NEbGxF?=
 =?utf-8?B?MTd5TFZIR1ppVTVOOFIyNFlaWkpKN2dLVWtFd0lqMzBXRFl0MDBsQXJubEpS?=
 =?utf-8?B?OG85Vkc5VGdyUWdSRFQvcmVNd09rSWUrWGdRL0Jpbll4VWpUUG5waDZhT2RE?=
 =?utf-8?B?aTlrdWVxakVXT3NjVTNTc1E4dFN1MzBlVEc1Yi80QmNkazgzOXdoNEdNbnVW?=
 =?utf-8?B?bjc5R2tBellBeFZ0bFZQTzVoTGVVcStuUUozeFRUejc1MURPaHNIYmx0N1lu?=
 =?utf-8?B?bHVqdGlid1FpQ0RmamVDSGVydHVJQkVDdUhhWWZKTExkeTc3dm9EV3NmMjJG?=
 =?utf-8?B?Nnk3Sko5TEh0UXZSMjJyNC9GVnBtZmZWelh5QW1qS2pHSDNRbDdiQ1NiQU1m?=
 =?utf-8?B?SmczU3FIdzY0bGhiTVpDRHdLazdidG5SY2E0b1VVczZ2cFYrcmY0MHQ5THEy?=
 =?utf-8?B?dEg4R2ZQUkdmRmJYQTkzVGxWSDdQZDgwWWloUFFEeG8yZGI0aWxWMjFKSTUr?=
 =?utf-8?B?NlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: faae43b1-c847-4585-4716-08db8d03ba6a
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 11:38:55.9972 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WZuX2N+2ZR1jfr7+TPbIRrx2Ef9KBb91NgMgsIOcmX/d6mSyusvO7fTS0KoaL0FbaTE94tZOXEk2of5/njsvIkP5mJF8Ut3owmHRq8An9mE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4823
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe/pmu: Enable PMU interface
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
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 intel-xe@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 24-07-2023 22:01, Dixit, Ashutosh wrote:
> On Mon, 24 Jul 2023 09:05:53 -0700, Iddamsetty, Aravind wrote:
>>
>> On 24-07-2023 21:22, Dixit, Ashutosh wrote:
>> Hi Ashutosh,
>>
>>> On Mon, 24 Jul 2023 01:03:23 -0700, Iddamsetty, Aravind wrote:
>>>
>>> Hi Aravind,
>>>
>>>> On 22-07-2023 11:34, Dixit, Ashutosh wrote:
>>>>>> On Fri, 21 Jul 2023 16:36:02 -0700, Dixit, Ashutosh wrote:
>>>>>> On Fri, 21 Jul 2023 04:51:09 -0700, Iddamsetty, Aravind wrote:
>>>>>>>>> +void engine_group_busyness_store(struct xe_gt *gt)
>>>>>>>>> +{
>>>>>>>>> +	struct xe_pmu *pmu = &gt->tile->xe->pmu;
>>>>>>>>> +	unsigned int gt_id = gt->info.id;
>>>>>>>>> +	unsigned long flags;
>>>>>>>>> +
>>>>>>>>> +	spin_lock_irqsave(&pmu->lock, flags);
>>>>>>>>> +
>>>>>>>>> +	store_sample(pmu, gt_id, __XE_SAMPLE_RENDER_GROUP_BUSY,
>>>>>>>>> +		     __engine_group_busyness_read(gt, XE_PMU_RENDER_GROUP_BUSY(0)));
>>>>>>>>> +	store_sample(pmu, gt_id, __XE_SAMPLE_COPY_GROUP_BUSY,
>>>>>>>>> +		     __engine_group_busyness_read(gt, XE_PMU_COPY_GROUP_BUSY(0)));
>>>>>>>>> +	store_sample(pmu, gt_id, __XE_SAMPLE_MEDIA_GROUP_BUSY,
>>>>>>>>> +		     __engine_group_busyness_read(gt, XE_PMU_MEDIA_GROUP_BUSY(0)));
>>>>>>>>> +	store_sample(pmu, gt_id, __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY,
>>>>>>>>> +		     __engine_group_busyness_read(gt, XE_PMU_ANY_ENGINE_GROUP_BUSY(0)));
>>>>>
>>>>> Here why should we store everything, we should store only those events
>>>>> which are enabled?
>>>>
>>>> The events are enabled only when they are opened which can happen after
>>>> the device is suspended hence we need to store all. As in the present
>>>> case device is put to suspend immediately after probe and event is
>>>> opened post driver load is done.
>>>
>>> I don't think we can justify doing expensive PCIe reads and increasing the
>>> time to go into runtime suspend, when PMU might not being used at all.
>>>
>>> If we store only enabled samples and start storing them only after they are
>>> enabled, what would be the consequence of this? The first non-zero sample
>>> seen by the perf tool would be wrong and later samples will be fine?
>>
>> Why do you say it is wrong perf reports relative from the time an event
>> is opened.
> 
> I am asking you what is the consequence. Initial values will all be zero
> and then there is some activity and we get a non zero value but this will
> include all the previous activity so the first difference we send to perf
> will be large/wrong I think.

correct if we just store the enabled events in suspend, any other event
will have 0 initial value and when we read the register later it will
have all the accumulation and since past value we have is 0 we would end
up reporting the entire value which is wrong.

> 
>>
>>>
>>> If there is a consequence, we might have to go back to what I was saying
>>> earlier about waking the device up and reading the enabled counter when
>>> xe_pmu_event_start happens, to initialize the counter values. I am assuming
>>> this will work?
>>
>> xe_pmu_event_start can be called when device is in suspend so we shall
>> not wake up the device i.e event being enabled when in suspend, so if we
>> do not store while going to suspend we will not have any value to
>> consider when event is enabled after suspend as we need to present
>> relative value.
> 
> That is why I am saying wake up the device and initialize the counters in
> xe_pmu_event_start.

Afaik since PMU doesn't take DRM reference we shall not wake up the
device. if we were allowed to wake up the device why do we even need to
store during suspend. when ever PMU event is opened we could wake up the
device and read the register directly.

Thanks,
Aravind.
> 
>>>
>>> Doing this IMO would be better than always doing these PCIe reads on
>>> runtime suspend even when PMU is not being used
>>
>> we have been doing these in i915 not sure if it affected any timing
>> requirements for runtime suspend.
> 
> Hmm i915 indeed seems to be reading the RC6 residency in __gt_park even
> when RC6 event is not enabled or PMU might not be used.
> 
> @Tvrtko, any comments here?
> 
> Thanks.
> --
> Ashutosh
