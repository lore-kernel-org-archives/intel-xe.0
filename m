Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3FBBC001DF
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jul 2023 16:06:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71DC610E339;
	Mon, 24 Jul 2023 16:06:54 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 976CC10E339
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Jul 2023 16:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690214812; x=1721750812;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=E5RxpE/LnLzLfPqqx0KTlS46AlVE0fI3/G52xZZaZic=;
 b=gpgfZgb9bmQnjO7frXM4Z1zSoz3nLGiP9Ifzc4Og9QKqosbI5zEu/72C
 V3AE/ux3ErqTA3tCezfZBw32RHkuvNzS3wvkf6l3BJF0WVPrqbTsywgCc
 t+FJ7kMj58UXZrSJ8WhmcAwO9PGmUABeAcc2NUNdOeCHQPFr9m+uQ2iZ8
 V2wzVgtB+IUidXpyO9a7vhyGp9erFVur3g3WgqKb6gMN+wTHp2ulcycOT
 7Nie6a0kzbx5yGS0z6/Wrj3L+MbWjh0pLccMM+aRlsrfBUp7IT8U3aS5c
 M1S0vy0Te6EqWMjGw+8043/8kqrtYzsOYPKqJoqJrN+cdPN4thLRxvPhX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="364943237"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="364943237"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 09:06:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="702947215"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="702947215"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 24 Jul 2023 09:06:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 09:06:11 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 24 Jul 2023 09:06:11 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 24 Jul 2023 09:06:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NCMeEf9h2EuA4R/mgKrY7cHD2LO8alkkaAXjX6b/dq4Orml8ff+hNOJkZGgUevu95DBoG+A6DrWHXO4HacaGahY5ucPgZ+afVpI+gMFFipvNFAmVU1EYIq3Go2FNbiLowNJoEVe/wAR8YMZkDeWJ+vXHNH/E7HQwe9Uol+F3RB0wQqti+XY7AjY99ujG5kca3Ks84qMxqPufPq57CEwaMWBifDdUOeNfwGc0+LSqaqO47UO+zs2jifatcwY58sCCjeD3K5MUdZIkBFsLtboF5hITlgZoJKDYmafo//SdF+Tb+XuieWTQxUVY6exwIJQ5ahyu+rMBFecnXPH35zMNPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yUREM6d+MPlunrv2HskKeIjq7P22n1hmALficRTwA9M=;
 b=PUOFR6QQAq4jQOd6kIuHehz07SpGrzoXZek407KM9YDc5VZxn3TYQVBVttfArFcyV7KVskyCHRqrQr2NBsbc6X5FIqiAiyJ1Wo8ZN4t34hfSAEHXe3iWuibqkhCT8ywZUG5G4ZdmPPgeu8VEpJjG2lfNiz8lgHg6wDhzl9RtGTSSrgbB3QfkR/Oa4/pxPUoZO+ZZ+AUwo0SJKA7c2BjY0Q407QlnyZEsYOaPGTrxR0fkewYf4ehoGMPb6CQ/flKZPSooHosmg6qALouotcQ4Odmv6rXPzMCNlwjv7ExKGHz7MG6f0/TcEZkqFIkX+slkfPVUnK25kE2+axZsEO3Tsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by SJ0PR11MB5134.namprd11.prod.outlook.com (2603:10b6:a03:2de::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Mon, 24 Jul
 2023 16:06:04 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::a581:e6a4:d186:c153]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::a581:e6a4:d186:c153%7]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 16:06:03 +0000
Message-ID: <42bb140d-2faf-43d3-a027-fe430b3682e5@intel.com>
Date: Mon, 24 Jul 2023 21:35:53 +0530
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
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <87351dqpcr.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXP287CA0011.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::21) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|SJ0PR11MB5134:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a1374a2-f1d4-47f5-9839-08db8c5fe168
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3EUfVwIHqgsdVRbGYT/M9hbC4xD5XhQGCNC+xBptQc6dEkWQfXAUJhogt+jRRnkJt/DJ8xTb9otkI7wtRWlXApk3LtfIOwKivR0JBj+QflnQy8yz4VbQQuVDwzawSN2pbDDKIdBr2MueSFfVGvRVDwvCunl5YyS4bpy0D5KUXwXDejVZg1qoPF0/HF9qqnuZydgM80t++Rg0u1DEz/qfJVYxtyokfaPN0NebhaMQu/U5RHeBJbIk9unieL8KD8i0ZmI7AEcm3UV2siUS+Cz8jGQs9O4ymBUx5G4I2eDaq7TUah0RDQDE+gub4FnMTY+VGoOjGxQF47CSju3AYRNK/ToQ9N4Pzvf8//ugrSLIO6tHtVH5ViX+8yJusJEYhMo4ts49PZzessajEb/3qgudbY9QWlpLdbxCRarTcar9jMvxt1gHLP8QPNT+SWrX43LqW9UEgaFeu9EV8rJ8dhGDXmnQbfjdxozd2XL7LqdLj8fAqOQ7jTBpkKqtAXYeWkyeRJQklGYhEAz1FqCmayMI+YfJ8CUFRcH4c0OkV3VuUI67EjK+Iagx9E7ToKXXDIfNKkN//yeHg7YGdjRb9RLAH2JToABENx6IzRmaLpNZ2bHaMzzgDl/gZt3FGZgoVP4O5XukVH2KWyghfsGRY6GRrA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(376002)(39860400002)(136003)(366004)(451199021)(38100700002)(107886003)(36756003)(53546011)(2616005)(83380400001)(8676002)(8936002)(5660300002)(478600001)(6862004)(54906003)(37006003)(316002)(66556008)(66476007)(4326008)(6636002)(66946007)(41300700001)(6486002)(26005)(186003)(6506007)(6512007)(6666004)(2906002)(31686004)(31696002)(86362001)(82960400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmMySmFDMlQvdFoyalFZYWpqVVNWWU13TkRMNk96SnRFRUxSWlpPYlVHYlBs?=
 =?utf-8?B?anpvaXZGVzlEcEZmcDJ6WUVEV2U2cGNpUG4vdlBPL2hEeGhka1FvL2NOcW5z?=
 =?utf-8?B?TEZUSURCTHVXTGw1L05yYzVSelZzN2xURHVVd3VVUStqd2cvUUxCSUtxdFhT?=
 =?utf-8?B?UVc1MkFRMjZEaVA2QlJWaGRpalYxTlYrYWdXTjRQQzBOTVlXMFJhZDBFR3dK?=
 =?utf-8?B?OGZaTFc3RlI2YlVpeSt1eTRyQWNSakt4Z3FkeUtwWnRydm96NkdNZHpETnRB?=
 =?utf-8?B?bGljaTIxdDdxM1h6ZjVhaUwwWXRmMTBYdU1sdDgxZFJ3blJoV2VtcnRsYXFT?=
 =?utf-8?B?SzBsUUhLM25iRkpIM3FBVzZzK3g2aVlXc2dNZytqeWI0S1NXNld4QWxDdHpU?=
 =?utf-8?B?N0tEZnpCUlhWbDJBMWJZU2NvQ25oZlNpMVlMcWhzL0FVTUIwbC9aMHZXcW1C?=
 =?utf-8?B?TTAxTmpzVWlvMWdCZUc5NGpnZ3ZrckNsblE3b3kzbkJNVlFHVC93UnpkQjdo?=
 =?utf-8?B?TFRwWlNiOUJObzYrVEpteEs2R1Z2R1Q3WkQydEZrcEkrN0YwOTlJajI2OWRX?=
 =?utf-8?B?QVgwWnF3dmZzUkdRaVA2TEhKZHdxc1pMYVpGNGVKNktzSFVZYXZ1YlJIQjhw?=
 =?utf-8?B?eGp1aElFZFNPaHJ0YVdyRENLMUNsY0RiTFUvSDd6OVhoWlV1WjlFYkw0NWtL?=
 =?utf-8?B?Rmx2VmhsMTdaU0QraGJPMjNHdmdibFJtb3FhR0ZqMFZpQ3RSSlNCdldhMFAr?=
 =?utf-8?B?d2hIdWZLT3NoTWdqNDk3RXdGd0JxYzB5WTlLTVBGY3h4eVpSWVRBU3hGeDl1?=
 =?utf-8?B?YThYQVhJVmVDMW9Kc1lNb1FScjVITHkyaStjOFBsZlhGU0dFREZNUEJLRklz?=
 =?utf-8?B?Ly9uRHRiY3lQRGtlUXBTL0E4SFRGN1NTRm5RazBVaVlJL2s1TndrMzE0UUdt?=
 =?utf-8?B?WGxZYkhnbVVBZEErNVNsODJIMHN3cTkvVnBqL0U2VGR6bTUxaVlwYkxrdmt0?=
 =?utf-8?B?UFFUSFowMWUzaWZMV3FKWVMzYm9WYkV0eUJsZDZyVGdNWThrMVNjQnB6UVM2?=
 =?utf-8?B?QWp4YnpXRTBIa0lmdWpqVmFjaFk5eDlJY0s1MFJ0QjBZQ3BKNlQ5dytpTEdr?=
 =?utf-8?B?V0cvNGgzMTJsTGdTTHhzOEpET3hMYmFuK3pRMVBKaGdVSFowN2tkMVlVZVNq?=
 =?utf-8?B?YUNDcHpMR0lqYXFyQnlKb3A4aFpoZWwzZjZtTGo1NjhZRnI0S0l2SzhFV2cx?=
 =?utf-8?B?cjU3c2VIWjBBWWxYakVMeThUdDdkZE94NXdhUjYzUmZpUWtvOVFDTnY4cklR?=
 =?utf-8?B?eDRBY0Mzc0UyMktoUUdxbFVzMm5ydmkxd255WmtCVUZBNTdEYWc5NUdDRzRz?=
 =?utf-8?B?SXhEK3czSDJUQUpuREs2dUFKakM4MG54ZVhNUXN2b3RBYUU4RXowTkZ4bS9J?=
 =?utf-8?B?L3pTZW9TalpGcHJNc1ZUT1UzK2E3dGxVdE1iN1pLVWxQU1R4YVp5UHlqejNz?=
 =?utf-8?B?clc5SFFMYjZZV3VXK3pXRE5UTVBjclBzMXd0OU8xVjhuQmlyRzNVU3UxS0JC?=
 =?utf-8?B?WERuNlhZMkxkMjVsUDhzcGdRa2h6VHQ5bW4zalJHblNrZUtMZkNXakFmc1NH?=
 =?utf-8?B?NGFFUExwNXQwM3B3Y1FKWExKWk1vdDB6VkVQSzlLZzh3ZVlYSUZvL211czRX?=
 =?utf-8?B?THU4QzRmdjJvQjhQaVg1dFJRUTRJSGx6S3RNTnRQUGV2QkJ2VkliVzI0Ujlk?=
 =?utf-8?B?MzdjdzFsVEpLa25vMnRYK2wzS3hNZUJZbEJ1djhJT1RuaDA0SFNqK0JKcUZ4?=
 =?utf-8?B?NWsrS05BZnh5elFFREl4THRGY0lDdEhwUEcvdzdYU3p0Qm80UUFQcW9FbWl3?=
 =?utf-8?B?TmYwbDR6QTNpV3NFMzQwRDk4TXR5YzZFb0I5TS90ek5MdHY5Tys2Y2pxQ1FC?=
 =?utf-8?B?aFRVWGpmWGJzdFBjRWYyU08yWEhZTVlmY01SWklLdHdQc3p3NmFwMDJERGJK?=
 =?utf-8?B?WHlZRHhpWkxyMWN1L2JLMFYwcUMrZlFJZ3NCTjVmZFNyMnQ2ZTVCaVVFc09u?=
 =?utf-8?B?bVRBb2hiNGZRTzZVenB2VGxWVVhwZHh2bXpVL1NPZ0hQckdhdTdpckx0MzVL?=
 =?utf-8?B?bFVTRkdQVDNWWUduR3UxUWVua3h1aGxzTFlpYVFtZHR6ZERmQnZlZUtHR01w?=
 =?utf-8?B?Vmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a1374a2-f1d4-47f5-9839-08db8c5fe168
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 16:06:03.8359 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eIRk4xn1Hmj+XyjLoJpP0VZiUdmqj9R69Ro8L/aPX5cf3t4PZZQywPngpuYLOsdCdd+0LmUhYGbUn9btJki6HE1U85VQD2YPsSWaovgg2/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5134
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



On 24-07-2023 21:22, Dixit, Ashutosh wrote:
Hi Ashutosh,

> On Mon, 24 Jul 2023 01:03:23 -0700, Iddamsetty, Aravind wrote:
> 
> Hi Aravind,
> 
>> On 22-07-2023 11:34, Dixit, Ashutosh wrote:
>>>> On Fri, 21 Jul 2023 16:36:02 -0700, Dixit, Ashutosh wrote:
>>>> On Fri, 21 Jul 2023 04:51:09 -0700, Iddamsetty, Aravind wrote:
>>>>>>> +void engine_group_busyness_store(struct xe_gt *gt)
>>>>>>> +{
>>>>>>> +	struct xe_pmu *pmu = &gt->tile->xe->pmu;
>>>>>>> +	unsigned int gt_id = gt->info.id;
>>>>>>> +	unsigned long flags;
>>>>>>> +
>>>>>>> +	spin_lock_irqsave(&pmu->lock, flags);
>>>>>>> +
>>>>>>> +	store_sample(pmu, gt_id, __XE_SAMPLE_RENDER_GROUP_BUSY,
>>>>>>> +		     __engine_group_busyness_read(gt, XE_PMU_RENDER_GROUP_BUSY(0)));
>>>>>>> +	store_sample(pmu, gt_id, __XE_SAMPLE_COPY_GROUP_BUSY,
>>>>>>> +		     __engine_group_busyness_read(gt, XE_PMU_COPY_GROUP_BUSY(0)));
>>>>>>> +	store_sample(pmu, gt_id, __XE_SAMPLE_MEDIA_GROUP_BUSY,
>>>>>>> +		     __engine_group_busyness_read(gt, XE_PMU_MEDIA_GROUP_BUSY(0)));
>>>>>>> +	store_sample(pmu, gt_id, __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY,
>>>>>>> +		     __engine_group_busyness_read(gt, XE_PMU_ANY_ENGINE_GROUP_BUSY(0)));
>>>
>>> Here why should we store everything, we should store only those events
>>> which are enabled?
>>
>> The events are enabled only when they are opened which can happen after
>> the device is suspended hence we need to store all. As in the present
>> case device is put to suspend immediately after probe and event is
>> opened post driver load is done.
> 
> I don't think we can justify doing expensive PCIe reads and increasing the
> time to go into runtime suspend, when PMU might not being used at all.
> 
> If we store only enabled samples and start storing them only after they are
> enabled, what would be the consequence of this? The first non-zero sample
> seen by the perf tool would be wrong and later samples will be fine?

Why do you say it is wrong perf reports relative from the time an event
is opened.

> 
> If there is a consequence, we might have to go back to what I was saying
> earlier about waking the device up and reading the enabled counter when
> xe_pmu_event_start happens, to initialize the counter values. I am assuming
> this will work?

xe_pmu_event_start can be called when device is in suspend so we shall
not wake up the device i.e event being enabled when in suspend, so if we
do not store while going to suspend we will not have any value to
consider when event is enabled after suspend as we need to present
relative value.
> 
> Doing this IMO would be better than always doing these PCIe reads on
> runtime suspend even when PMU is not being used

we have been doing these in i915 not sure if it affected any timing
requirements for runtime suspend.

Thanks,
Aravind.
> 
> Thanks.
> --
> Ashutosh
