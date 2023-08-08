Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BD3C001DB
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 13:45:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E15410E08E;
	Tue,  8 Aug 2023 13:45:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B2310E08E
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Aug 2023 13:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691502352; x=1723038352;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5s6agP+akoorzGw8fJJ2O36NrwDI30AAMMCrxE5BYAk=;
 b=IT2J/nOaZ1oZQ67/yBdCwqhCbSjiEkj58oBXKURMVEVJZZgsCN835t/8
 muZX8Tfg7kZoUK8k/iyDnoojmJXIi7OMp8/tRR3MkYYu+CbBA2BZk7CIH
 CdXe2lHq0HEwLEdxWfGFJn/O6++QJWN0blEJS/GCskaQtqnNb01yDlH7o
 e6AGqLPCrdhrHc8ih+rcGChqfDnmBsbR3012Bn1fT3YFRFkuwlA4SAde+
 gNAnSt+2G8bxkMvaq41r8HuWaA4XMwQQhPR9A8lVmcGAXVhRfoqjdrsya
 7KqynX5x1cFb++69a/+wNBdTdCG/UzTw/Sfz/ykdyKFLe6HzlXt2PQZDw A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="401786183"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; d="scan'208";a="401786183"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 06:45:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="1062025794"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; d="scan'208";a="1062025794"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP; 08 Aug 2023 06:45:51 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 06:45:51 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 8 Aug 2023 06:45:51 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 8 Aug 2023 06:45:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CMupUO1FwTE7lCk4ddf3Fqf0id2aYoINQkkRKhukq5F2kyYZ1aSXZP5WJdMIbjRcOSy9cS9EwizIACsDWVdTprgtNNrx0qBLHv/1up1rL5xvJAnAmhmed+lOkxwZ1f4yz08T4rebTb1WYZrKc49/jQOwNeWcp4tgbvlPz/lfUoOAIAKApFwrDDt6Nut11/JCnB6IUonhrnELnhh54qO+pTcycdWuf3FbCfnPPZov1809/aFkwEkC/5GPoQHDQo/7VnxyIxOh609BCqt8feTJQfAeNauuDNj536JGOQ0/dbupksilf1YdnpN5DNls7LArhfFv7ibotCYJcdR8e0kktA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p+wB0WeSo9ZJZkpSXtrdMBAbAiXdBwguHX5s0MOomLo=;
 b=FlumLFmTW6Yk/e04RXulBnLaMSRbuXcusf7P0FnUMjI6/ypMmsGvySSPPp6vMH3efaD/Fb7+hqYlsj6R+2Z7meo3YbcJ+os1eTkVIIIW57TnaD0ukjSbgQCfURnO7BQY7SSppVbd35tWXJZLsJRaEqw4cxzoTTzszDkaoVjdlxHjayVhXBRwdMDZnCu/leil5e9zMKyzoWOlZH1nZDChiTlMbY7LmBrP7QwTkasBNvBX6QXbrLK6QppH0JZ6op9hPnqY6iYOn/FaDce78CgnNv6vPuHLfuI4dZCvWSkzgpHGBCrQ21dOYVGPBumbaQq6Yh7NxZ5VDx+GvUvmXlrsLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by PH7PR11MB6881.namprd11.prod.outlook.com (2603:10b6:510:200::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.25; Tue, 8 Aug
 2023 13:45:48 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::a581:e6a4:d186:c153]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::a581:e6a4:d186:c153%7]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 13:45:47 +0000
Message-ID: <d2c664b8-f7de-1c66-4f5b-42358fa322d7@intel.com>
Date: Tue, 8 Aug 2023 19:15:36 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.14.0
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
 <500331df-d95b-d447-18e6-d0f198570072@intel.com>
 <87o7jiy2lw.wl-ashutosh.dixit@intel.com>
 <87msz2xzky.wl-ashutosh.dixit@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <87msz2xzky.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0174.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::29) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|PH7PR11MB6881:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fd149ad-03fc-4f04-d858-08db9815c537
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x2NJL57I1RskOG+1p8I4fkJ+D9GQtXQXDDmwIFl4i4JpKjjqVzQ913Ai8oXphVdTJtb+ngP1sUxZg1UfnEvFzuN9anigDtXUYD9aFRnpQU5dZKGCq/naZiD0QqmUMatGJ9XbjhviXRpsL+SZvfiCETQPd97j9fKdgX2ykj5aXd8iH3IO9mCZx4DDg7gGCS0hndt6Qcl678ZlHEZrhyV7JpUyvAbfEMekrQQwlgzeqHrI5Z4a1fN8IjSGslwKLSKs5kTasmtcJWNqUfiHAbRIQq9PgCxjqr6puLReBxvcuVrfQxiq1ddXOvm/MytTeW/sGKN1/roXvxDGT5u42yiy1pgTUW75jlCqFBf00qI7oUJn4marNK6ShgTVFowIfDkg0FhnMnHeNFQj6QuOOksLIIpQXJQbVYwbWbqZDTq0rJ4AXQttfn49Q80AXKyBoG7S4CgGNqHaWtF2sx4/0U3lZ2L0NCHOUfyqY7B0LG0LAADQrZaP/FEh4ADAHmFlalkHfFOuw1pcccK7Y1e9BdkMuxubOD1XcTOdJ5pa41TLZTsfvn2Y126XrGM+fnaQCjxEEj68GTXlnYXrcEkXPvCRksxZTEEu/ZQzkLKAYBn48GbShMqR3VOPiIxcD88m+lUkOXpVGoTNAnJeyUvJ5Gm3cg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(346002)(136003)(39860400002)(396003)(1800799003)(186006)(451199021)(83380400001)(66899021)(31686004)(2616005)(37006003)(38100700002)(41300700001)(2906002)(4326008)(5660300002)(6862004)(316002)(8676002)(8936002)(66476007)(66946007)(66556008)(6512007)(478600001)(86362001)(82960400001)(31696002)(6666004)(6486002)(54906003)(6636002)(107886003)(6506007)(36756003)(26005)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlRYQVVkcTdSQ3lITFA4bmgxWDdTVGlCRjliSU9ua0tLa01tVXdudHpVUHJS?=
 =?utf-8?B?aGRjdWcyZXBTSDU0N0Vqcjc1YTZlTURHcy9hZlRCMFFoTXl5YWJRYldsSWR0?=
 =?utf-8?B?TllMcVoySUtwRHVFbmhaK2tteUJuM1YrUUNobWZKRlN6V25JYlRuWTJnZ05m?=
 =?utf-8?B?UDJucG9uNEJVK2tjNUFMNWt5K1RxWTAzMDJJNnY1a2FGODB2ZEx2WldUTmFn?=
 =?utf-8?B?Um4yaVZYODJTaGZ6bFZxaXFqOVN4Q2xTVS9lSFY2Sk1RTU9acGI3S0o4VGZm?=
 =?utf-8?B?YmlvVTZwYS92bUZBWWpuYjlOWm4wUjk1QUVoaTNRVXRFa0ZrSmdLeVMycjZm?=
 =?utf-8?B?MDJnckpnVXl5dnJKUEVpM2doU01wRFZWZGx2YWdFYVd1KzN4d0YrdlBydVFZ?=
 =?utf-8?B?UmlzWEQ2M09nak80QkRyV2g0RzhpUFRUT1ovenJ6aWIybm5DTjVpN0pSclo5?=
 =?utf-8?B?Qy9IbTJrM0ZtdTVQc2d2WDRYRzhUeEg2OXpFbC9XZ1FzejZTR1RXaWxsYjh5?=
 =?utf-8?B?dFFhb0dreHBJVjNqd2Fnbm1KMmpBbGlHTjlJY1k4Q3pOeW9UWnd2L3JsbGx4?=
 =?utf-8?B?MmMwb0luSSt6RFAwSVpxcThDNmdkaUFaN29LdGdKQVB1NlB1aTMrMWN2RExR?=
 =?utf-8?B?eVRjY2VxVmgrWVVzL3NFOU1vOGs5TGEwMko3VjZaVXZFd0VzSmJTUG8ycjlH?=
 =?utf-8?B?Mkp0U1d6LzdSNzhMa1huYjBEQkNlWXhSUlRyWTByZC84UzdPajBrNDIvVDl2?=
 =?utf-8?B?MTVQanhTbi8xZjk3Tnl2VTNQeTVxQWdFaGg3cHU4cWhjeVdZWjJMMC94SVBu?=
 =?utf-8?B?MkhTRDd1MFkwOUhXVld4aGRlcWdhV3V0emJocldmZzRZNU8vTGdHVlQyWE4x?=
 =?utf-8?B?TTdQczlZdUIwMGROSlNoV3c4Q1dJT0dvSHVPdDI0RS9PV1RRT1ozVFZkdzBh?=
 =?utf-8?B?TnFCNERDN2pjaWpudjEvd2tBb0xnVjVxdUxnTEptQUI5VUFyQ2xjb2JGWVlo?=
 =?utf-8?B?dVlmcGJwQldZWUd0eWZoSXdxUU1HWjhzVUV1NnZDbzNOeFM0REZVWE9YTE4v?=
 =?utf-8?B?aTdJVitOeSs3eUxjRnlYMUx4Zk1EMEhhVkIyVU5qYXZZTnh0YUo5MWEvdWdq?=
 =?utf-8?B?RHpPQjBYbWZIaEZwQjVoRDQ0c0RBUUJjNE5maERlQ3ZtWkhKQmNteUJKUzFI?=
 =?utf-8?B?R1c3bGl4ODRPeUpvRmtvbWNJT0E2SUVCZ05uM3dMV2sxS05wQ3VzMzNjUHpD?=
 =?utf-8?B?ZXpmSHRTcU90UFZlQkQ5cktsWDNuTXh6dlM1b1JBWWVINTY5MGJvVkpHTDZ0?=
 =?utf-8?B?dDFmaExFOWJDUmUxQkRjdm1Ta1pLcU9zSCtpUTducmJMWTd0bk42a2xjUWJv?=
 =?utf-8?B?b1ZoUlJyUkZEQWVDcFJqcE9vejY2V0cwcm84c3VzWExISUtBSGY3aFo4eFQ0?=
 =?utf-8?B?QlIwYzZpVGZETW5HekpDdjUycG1tMXUxUEMvakJIeVkrMCs0a1NJYm0yQlRL?=
 =?utf-8?B?cWV2YUpESW90YVZvc3lrNVkrUXFjcWVjdTNFTkZuTFVVSXJ6NlBaUVhIdE5S?=
 =?utf-8?B?Q3ZsczdrdGw0Sml1K0dqRy9OSWpxNTlFbmd2OXRkYU0xUWZDNjdlc2FLL2or?=
 =?utf-8?B?a1N3OXZaWkdnTjYzMmdBakdiY1dUNzJOd0JwU2pkc09GUVVPU0g2UkJsN0Y5?=
 =?utf-8?B?YnFaTVNhSHMzamFiQTNUa0M3SVVWajdidHROaStsbXlaOWJ1STZlYU9KN2Jw?=
 =?utf-8?B?SytnZlFwOGdMd0ZuQitHL2RIMFI0eEtzNCs3NFhRb0R5RVBXbDBDUDlGTnRn?=
 =?utf-8?B?MnFpa1o0MFVaMWVzamtVbzNUc3pFWUNvOVBmNmxHR2xMbFRycTlMSi9MQS9M?=
 =?utf-8?B?cVc5OUkzL0ZyTHdaUlBNd0ZjTFcxWVpCUXgxeml3YTVQZkRrYzFHYUFUU2dT?=
 =?utf-8?B?eWdUUTMrRHVXN1d0YUNDb1UxM0lCd05hTCtpS2daSEdrQXlTazNBeTQzKzBW?=
 =?utf-8?B?R1d0WUpUR1NmYm1zajd3WTR4RjB2bVQ3Q3YwdXJ3UVRVZmdIM0xkVEZ5Wk0v?=
 =?utf-8?B?bk1LVm1UL2tkVHk4YUgwTU9XSDIvc2lQbmZLM0F3TjhKTGdwcU1NRjY4QSsz?=
 =?utf-8?B?eTdudCtVbVI1V3lIL0J0R3JXNFQ5UmJweFQ1RWszTUJEUm1XdTEzTWx1UUJB?=
 =?utf-8?B?K2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fd149ad-03fc-4f04-d858-08db9815c537
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 13:45:47.8112 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wt3xfM4DdK+NOVkLRNpmsE9omAumxqxRSoUxILY3IPf9P12Ez4OkApioi8x7iB+r3DMb72k/0EKvWetflfjWQk/4Ym0V6gwNeibtAVnB0lw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6881
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



On 08-08-2023 03:52, Dixit, Ashutosh wrote:
> On Mon, 07 Aug 2023 14:16:59 -0700, Dixit, Ashutosh wrote:
>>
> 
> Hi Aravind,

Hi Ashutosh,

I have sent a new revision, but commenting here for few comments.
> 
>> On Tue, 25 Jul 2023 04:38:45 -0700, Iddamsetty, Aravind wrote:
>>> On 24-07-2023 22:01, Dixit, Ashutosh wrote:
>>>> On Mon, 24 Jul 2023 09:05:53 -0700, Iddamsetty, Aravind wrote:
>>>>>
>>>>>>> On 22-07-2023 11:34, Dixit, Ashutosh wrote:
>>>>>>>>> On Fri, 21 Jul 2023 16:36:02 -0700, Dixit, Ashutosh wrote:
>>>>>>>>> On Fri, 21 Jul 2023 04:51:09 -0700, Iddamsetty, Aravind wrote:
>>>>>>>>>>>> +void engine_group_busyness_store(struct xe_gt *gt)
>>>>>>>>>>>> +{
>>>>>>>>>>>> +	struct xe_pmu *pmu = &gt->tile->xe->pmu;
>>>>>>>>>>>> +	unsigned int gt_id = gt->info.id;
>>>>>>>>>>>> +	unsigned long flags;
>>>>>>>>>>>> +
>>>>>>>>>>>> +	spin_lock_irqsave(&pmu->lock, flags);
>>>>>>>>>>>> +
>>>>>>>>>>>> +	store_sample(pmu, gt_id, __XE_SAMPLE_RENDER_GROUP_BUSY,
>>>>>>>>>>>> +		     __engine_group_busyness_read(gt, XE_PMU_RENDER_GROUP_BUSY(0)));
>>>>>>>>>>>> +	store_sample(pmu, gt_id, __XE_SAMPLE_COPY_GROUP_BUSY,
>>>>>>>>>>>> +		     __engine_group_busyness_read(gt, XE_PMU_COPY_GROUP_BUSY(0)));
>>>>>>>>>>>> +	store_sample(pmu, gt_id, __XE_SAMPLE_MEDIA_GROUP_BUSY,
>>>>>>>>>>>> +		     __engine_group_busyness_read(gt, XE_PMU_MEDIA_GROUP_BUSY(0)));
>>>>>>>>>>>> +	store_sample(pmu, gt_id, __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY,
>>>>>>>>>>>> +		     __engine_group_busyness_read(gt, XE_PMU_ANY_ENGINE_GROUP_BUSY(0)));
>>>>>>>>
>>>>>>>> Here why should we store everything, we should store only those events
>>>>>>>> which are enabled?
>>>>>>>
>>>>>>> The events are enabled only when they are opened which can happen after
>>>>>>> the device is suspended hence we need to store all. As in the present
>>>>>>> case device is put to suspend immediately after probe and event is
>>>>>>> opened post driver load is done.
>>>>>>
>>>>>> I don't think we can justify doing expensive PCIe reads and increasing the
>>>>>> time to go into runtime suspend, when PMU might not being used at all.
>>>>>>
>>>>>> If we store only enabled samples and start storing them only after they are
>>>>>> enabled, what would be the consequence of this? The first non-zero sample
>>>>>> seen by the perf tool would be wrong and later samples will be fine?
>>>>>
>>>>> Why do you say it is wrong perf reports relative from the time an event
>>>>> is opened.
>>>>
>>>> I am asking you what is the consequence. Initial values will all be zero
>>>> and then there is some activity and we get a non zero value but this will
>>>> include all the previous activity so the first difference we send to perf
>>>> will be large/wrong I think.
>>>
>>> correct if we just store the enabled events in suspend, any other event
>>> will have 0 initial value and when we read the register later it will
>>> have all the accumulation and since past value we have is 0 we would end
>>> up reporting the entire value which is wrong.
>>
>> Ok, agreed, so we need to do "something".
>>
>>>
>>>>
>>>>>
>>>>>>
>>>>>> If there is a consequence, we might have to go back to what I was saying
>>>>>> earlier about waking the device up and reading the enabled counter when
>>>>>> xe_pmu_event_start happens, to initialize the counter values. I am assuming
>>>>>> this will work?
>>>>>
>>>>> xe_pmu_event_start can be called when device is in suspend so we shall
>>>>> not wake up the device i.e event being enabled when in suspend, so if we
>>>>> do not store while going to suspend we will not have any value to
>>>>> consider when event is enabled after suspend as we need to present
>>>>> relative value.
>>>>
>>>> That is why I am saying wake up the device and initialize the counters in
>>>> xe_pmu_event_start.
>>>
>>> Afaik since PMU doesn't take DRM reference we shall not wake up the
>>> device.
>>
>> Not sure what you mean because PMU does do this:
>>
>> 	drm_dev_get(&xe->drm);

sorry it was my misunderstanding here, please ignore.

>>
>> Anyway I don't think it has anything to do with waking up the device since
>> that is done via xe_device_mem_access_get.
>>
>>> if we were allowed to wake up the device why do we even need to
>>> store during suspend. when ever PMU event is opened we could wake up the
>>> device and read the register directly.
>>
>> No. That is why we are saving the counters during suspend so we don't have
>> to wake up the device just to read the counters. So the issue is only how
>> to *initialize* the counters.
>>
>> You are saying we initialize by saving all counters during suspend, whether
>> or not they are enabled, which I don't agree with. I am saying we should
>> only read and store the counters which are enabled during normal
>> operation. And to initialize we wake the device up during
>> xe_pmu_event_start and store the counter value. Alternatively, we can zero
>> out the enabled counters during xe_pmu_event_start (the counters are RW)
>> but in any case that will also need waking up the device.

when the driver is initially loaded there might not be any users of
device and immediately it might enter suspend, so at the time of suspend
there no event enabled, but the pmu can be opened just after suspend
wihtout any actual work on device so device still resides in suspend, so
we should not be waking the device just to read the register in
event_start or any of the callbacks without any real workload or user of
the device.

so ideally if the device didn't enter suspend, the counter is
initialized in the first read when device is still awake.

Thanks,
Aravind.
>>
>> So this way we only wake up the device for initialization but not
>> afterwards.
>>
>> Since this is the "base" patch we should try to set up a good
>> infrastructure in this patch so that other stuff which is exposed via PMU
>> can be easily added later.
> 
> After thinking a bit more about this, though I think this needs to be done,
> I won't insist that we do this in this patch, we can review and do this in
> a subsequent patch (if no one else objects).
> 
> So let's skip this for now. So if you can generate a new version of the
> patch after addressing all of the other review comments, we can review that
> again and try to get it merged.
> 
> Thanks.
> --
> Ashutosh
> 
>>>>>>
>>>>>> Doing this IMO would be better than always doing these PCIe reads on
>>>>>> runtime suspend even when PMU is not being used
>>>>>
>>>>> we have been doing these in i915 not sure if it affected any timing
>>>>> requirements for runtime suspend.
>>>>
>>>> Hmm i915 indeed seems to be reading the RC6 residency in __gt_park even
>>>> when RC6 event is not enabled or PMU might not be used.
>>>>
>>>> @Tvrtko, any comments here?
