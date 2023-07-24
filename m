Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0916C0015E
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jul 2023 09:39:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A6810E087;
	Mon, 24 Jul 2023 09:39:17 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3981910E087
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Jul 2023 09:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690191555; x=1721727555;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Zamvcg8dLWi3ceg1vF3lOQV8KGcD3EiqZqS9M5kl5XM=;
 b=Ej1IhB+kxP3A9kVBGSVrG6Te5X9gZuHzeYOOvUCeiSeQ2TzfNmckVl6K
 Xpfuys2yY0hNdYmS77s7Ru4g1KRMw1kzwZzXYdTVYNHDgZC/WWylc4M4t
 anY7ap/3f0sFJp4OKOBfRtD4RZl2nFaQWJGPXt2Ll+mqP9jW33ISs2QU/
 E1zQ5N9nyrYJN5UJUtULFqeLBB2O19wQfPfqsMow/G4L/7Cs5u/6E0KHt
 lHjdIvi4Cj+i10vwBDgiiDfA+4Z3oOYRt9wkdrPiWZofvLpcfc1AIpfq0
 VYPqsm0Ppxo6xcY3C7DN0CHsf9Co2J4/CuFgoJP+HrY0ngXRj3O+xmAmy Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="352293654"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="352293654"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 02:39:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="972200161"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="972200161"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 24 Jul 2023 02:39:13 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 02:39:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 02:39:12 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 24 Jul 2023 02:39:12 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 24 Jul 2023 02:39:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RiLDLRS7XjRFHGiqBdppE3znm7ZIDPivb7BnRsP5DcOozU/b+lZF2iC1wtyKxqcSEQ/TGSt8fLRtZj3wWM8QKnOwWTea4h79mryIQomJleXPsDCJbvGTT32OYLIEVWp6E2n+O1PJ3aNr/WqvO228gK00HO0xtPa8ZaJyKVbHhWCH1Bzx/qDDBv0ZWRD7TX98SkG1qyyEuZnmBuI1fVXl/6ctobuVwl4HxTz5tqCYIXdKLpJAzmfD2TmXwZww93j9fR2KyKpldRxtX7MT1MYIdsH83HX2wZGSe2CfqTo5ycpet5QcgquCdxoIvu2y9USX4/KEMZ3E/FtNtHfOBev14g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O0DWpudpHDfkkxljqRtyaD7UFag3+RY1wD+Umc+cC8U=;
 b=kQXitccrk8UJThFQHICmOYKbXe73xC5HARUGY9CJfdfBXVfEAz/zyCWkIoVUL2mi+7SF/O9rjb0QptHkDNa5Odto5Bl75tgMBLfff0uKIn8g+6aNoYlXiubu5o4Foh0Sgkui70WHFXzpCYHYrpdb1/AYDjiW2BqHIzPmCVV37TzBBu7nvAUZsOvTLLSkReiH++zC0C6WP6NE0LSM6f9vv1RwwVc1R0ASi264HzNK6zfOL/Bda38GyVjrlBgUuAtcAYiFscGiOcNrrwcfkrAceuLrUXEd4m3wn6sAr3OgNfzirvQkVUC8byoNJLh1q/rVPAHcS2OBcgplUgB5MRelDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by SJ2PR11MB7474.namprd11.prod.outlook.com (2603:10b6:a03:4ca::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Mon, 24 Jul
 2023 09:39:10 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::a581:e6a4:d186:c153]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::a581:e6a4:d186:c153%7]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 09:39:09 +0000
Message-ID: <6a0ef5d5-c772-e04f-fb74-ca59e26b27c7@intel.com>
Date: Mon, 24 Jul 2023 15:08:58 +0530
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
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <875y6cqy6p.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0080.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::25) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|SJ2PR11MB7474:EE_
X-MS-Office365-Filtering-Correlation-Id: 875c4dda-3aa4-4783-542b-08db8c29d450
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AozSdhw5DqeZGtWPMUVhKx05TDDwrepSeprguV3/NkP97+Gi6LKWaBiBzAujg7LQxIQ3JA0gDFXLroEFTV8QfNRtvhN3++ZGPg02Ipr50ae7AydE28CQb6jiLq+xzzNmgWm9WW9d7ELOeMNC6qkV0fHg9759uUfzM5+LHC13ixTXwPbGgrQwp623F3/+1ukXHngnVeKRzSkH3pC1RUhsXoJvP0ak9CWRO+cVCuawlTTOs5aiGsFwmOqmd+TpaUIdarZ/c6frwPBmt3X8p6Zi3UViZcFtQRLpWYbv88riMxfxi6QsyKgzsPzA7lMb+QWp5nDanjKTz6DFe8e7rjX6KwZ2PyRlZb9jzZM3pdZqaQ4opt/YGDFSp3UhmAYAuT1zw75+ZtlwP2ZQSjdtPUIXmJBGzHSbG6B5ep2g56GxYdsMbVn+iKyiVOf9klWin1tvUePF/Ur4K5HNydJ9bPQRfgSDFe4QHXWqBoB1I2HzicSuGUvdJfXTJt0l+fG/SY7y+BxyJeMe4E8p7QBUQMakfPbX/xDgiox3fG4OWOf1KfMJstu9LY4aJ1jzLSue+147s2o9Hejgx+Hlbu3gZwRP8ZeJ6IBCWQ1QM87ksYUlya1UOggOkLsthLzMxJdJLZPc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(376002)(366004)(136003)(346002)(451199021)(2906002)(66946007)(66476007)(66556008)(4326008)(6486002)(6666004)(478600001)(6512007)(31696002)(966005)(83380400001)(54906003)(86362001)(37006003)(36756003)(186003)(82960400001)(2616005)(26005)(107886003)(53546011)(6506007)(38100700002)(6636002)(5660300002)(6862004)(8936002)(41300700001)(8676002)(316002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akxRYzFkNG9mZW0wR0drRk9kK2w4Tk50NUhZTnhJY3ZkUkJJT0FOcFdWYzZY?=
 =?utf-8?B?c295SXF3cDdITTBXVFdCeng5WTBza0Z6ZUFoUlBET3RiK3orc1Zzb3cvU1Fo?=
 =?utf-8?B?ZmNDZ2pPSHAzSFhqMTFHUDFVRy9lODRtcXF1Zi9GVXJSY24zSXJwYlY2WmRl?=
 =?utf-8?B?V1N2YVpRRG5mTk1Hc3lWd1lHNkZxT2Q3Q3ZxWUlzMUtxSStQcElxelRqU3Fq?=
 =?utf-8?B?Wmw5RFlWVkkwcXkvYVQ0MmNOUjZGY21KZTZBVDIwRU1BVWViNmFNNCtRblRt?=
 =?utf-8?B?R252czkwUmUwSk5CUXVRSkl1bnYrOStibzNWZmdPazI0allRVEs0ZGhOSUxh?=
 =?utf-8?B?eE9XZDRrWXdud3h2QUZrKzlnYW4wdy9GbUxlOU5wSU1LU1hZZFdvZDNrQnFT?=
 =?utf-8?B?N3Rndk4xR0ExeG5xSmVZRVMyTSttbldWbTNrQURXRHJlaDgyTXBaSkFRMDhR?=
 =?utf-8?B?Y29MNmtwMWxqT09xMWRKaGVjaGgxdk1ueHZWSFFQTENJWXpML2VpQlZKTFY4?=
 =?utf-8?B?UXV0QmRieTh3ZVNjenJDS29xZEhuQ1lJMy8yNlJvdUlrUTNBRk5abzFqWVV3?=
 =?utf-8?B?VFlGOURLTkJIVEhSaHRPQjRTMnc2VVpSRGpLeDlyd1lCMnRvT0l6YzRiOFpC?=
 =?utf-8?B?eVUxa3lyWnBNZDU1MnBoZkszTnFhYVFvNUVRbjFnVytsNHFRaUdLOFRWWkJV?=
 =?utf-8?B?d2IwRXp4RVgvQ0k3TE5OMi9vdUN3YUNrNC85K20xNmpqbzFWUDRPU1pHSUsw?=
 =?utf-8?B?ZlJyaW1KSmh2OUxUZ0xKU3owWEVrRWh0YloyRXova2k3QWRBdngrY2tTdGg2?=
 =?utf-8?B?UTlaYjJsd3I5b1hQalVnc2RqNU9OdGI5SVBjSFZjc3J6TGxGTjUzSW14REpF?=
 =?utf-8?B?dFFTVTgya0RuMTZTUDkwWmFraWdqUEZkLzJWQ1RnbnZIaFRwWEdmaTJwOW9i?=
 =?utf-8?B?amVPRHFPclAwTkZ5QXdlTlN4dVE2aXVETVFiYXBKUmN0RXRXQ2dLVDdSWFNX?=
 =?utf-8?B?REtpaTZWQUJzQXFkV1I2V0t2SlQyRzBLRExxZS9lbDZjU3lKcW1wR3VGM1VF?=
 =?utf-8?B?TUJTcTRRQzNxUGx4M3M5QUpkUmFqVG9zWG5LWGZPRkNyeVNTRGVTSlk2aTFH?=
 =?utf-8?B?Q0xDeUxUMXRSSjZ5QUFqT1V3K00rV01lQVVqUzlJOU9vdWljWlBMbUlSZGsy?=
 =?utf-8?B?U1NxandFWGFOaTZCQ2p5cDd1Ymo3TkhWTGRaQnF3VmR3STA5bzI1TGlOc29t?=
 =?utf-8?B?Qk9DSGdLdHR3MUxpYWFBdUZEckhkVDZ5SkU3dXBDaVRvOUtQSEN1WmM1YUJL?=
 =?utf-8?B?L1ptNk1yUjVpT0hmSFRkVThSaktibzVvZGhCdU41anFrc0pISDFjOW4zNmYz?=
 =?utf-8?B?bXFZQWxFYzluRVluUXJMeDZvRGpoL1J5VHY1NGlkOXVham45RDBYU3FDblQ1?=
 =?utf-8?B?VXZRZm5Lb09XUFVOMG1CakpYc1R1Wlp5YUJkVmdzSmVSV0pLSVplYUJxMHFS?=
 =?utf-8?B?VGR1cUx2c1hja09WcUFYVnlNcTM2N2llTHpIMEpMVk1PczI3QjBkNGp3eEUr?=
 =?utf-8?B?OXJZTTRvOU1aSlpkTWNzWndrR0hwb0RDbFVDd0xTTVJ0MDAwWmFtUlVRTUJN?=
 =?utf-8?B?T0wraGVmakt2Y2pXK0wxb2kxUHYxOUwzNm1GVm1LRk8ya0RTYUFibW9pcG1E?=
 =?utf-8?B?cjYybVo5RUVnY3ZISmdrWmVFbnZpT0lZRU1Wdzl1YU8xc1NBZXZiK2YzMnFU?=
 =?utf-8?B?dTZRdFVyOFFoSk5PWGw2K29lZk16UWc3clJoazhSWTBGM3lVQ3F4OVlFVHJU?=
 =?utf-8?B?eDVwN2RMVnMzV0pIU0w0L2hPYmZTQVZHcEdEQWNIMm04c1BHTjNoRlBIdWh1?=
 =?utf-8?B?Z2ZUM1dwaHl0ZURLVXVaQjFlcUZKUWNDOWhJczFaeUluelN3c3IrREJmVjRp?=
 =?utf-8?B?S01LcmY3R1h2aFJOOUtTV0N4ZG5aMXdMWDd3Wno0cWFyU2diVEdXenVwT0Fa?=
 =?utf-8?B?Mzg3SE90SVgwL3puWGYwVC9xMllKZTJIcGNHUXlIeTUySlR6L1ZjazljclFX?=
 =?utf-8?B?cGk5Mk02dEY1cXJLK3M2TUxiRFV6NWhHU0FKWk5nd0g4bHVXeWVLOU9PaWZK?=
 =?utf-8?B?cTNtN2dPNlU3WE9nSkxVZzV3WTFYSU5SQjhaZ2dhbUJyR3pHYkNhb3UyVzho?=
 =?utf-8?B?VlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 875c4dda-3aa4-4783-542b-08db8c29d450
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 09:39:09.0633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kkPlhaYrGQtCVV2Nr3rdo+wsR+NRDiyl1LMYZtDrkorFLPsDZgVjD8GRd8FmwIX612K6ECGvuk3aiaoFGPPiYN9neK0Z16jqU7z+qrnFx2E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7474
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



On 22-07-2023 11:34, Dixit, Ashutosh wrote:
> On Fri, 21 Jul 2023 16:36:02 -0700, Dixit, Ashutosh wrote:
>>
>> On Fri, 21 Jul 2023 04:51:09 -0700, Iddamsetty, Aravind wrote:
>>>
>> Hi Aravind,
>>
>>> On 21-07-2023 06:32, Dixit, Ashutosh wrote:
>>>> On Tue, 27 Jun 2023 05:21:13 -0700, Aravind Iddamsetty wrote:
>>>>>
>>>> More stuff to mull over. You can ignore comments starting with "OK", those
>>>> are just notes to myself.
>>>>
>>>> Also, maybe some time we can add a basic IGT which reads these exposed
>>>> counters and verifies that we can read them and they are monotonically
>>>> increasing?
>>>
>>> this is the IGT https://patchwork.freedesktop.org/series/119936/ series
>>> using these counters posted by Venkat.
>>>
>>>>
>>>>> There are a set of engine group busyness counters provided by HW which are
>>>>> perfect fit to be exposed via PMU perf events.
>>>>>
>>>>> BSPEC: 46559, 46560, 46722, 46729
>>>>
>>>> Also add these Bspec entries: 71028, 52071
>>>
>>> OK.
>>>
>>>>
>>>>>
>>>>> events can be listed using:
>>>>> perf list
>>>>>   xe_0000_03_00.0/any-engine-group-busy-gt0/         [Kernel PMU event]
>>>>>   xe_0000_03_00.0/copy-group-busy-gt0/               [Kernel PMU event]
>>>>>   xe_0000_03_00.0/interrupts/                        [Kernel PMU event]
>>>>>   xe_0000_03_00.0/media-group-busy-gt0/              [Kernel PMU event]
>>>>>   xe_0000_03_00.0/render-group-busy-gt0/             [Kernel PMU event]
>>>>>
>>>>> and can be read using:
>>>>>
>>>>> perf stat -e "xe_0000_8c_00.0/render-group-busy-gt0/" -I 1000
>>>>>            time             counts unit events
>>>>>      1.001139062                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>>>>      2.003294678                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>>>>      3.005199582                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>>>>      4.007076497                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>>>>      5.008553068                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>>>>      6.010531563              43520 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>>>>      7.012468029              44800 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>>>>      8.013463515                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>>>>      9.015300183                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>>>>     10.017233010                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>>>>     10.971934120                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>>>>
>>>>> The pmu base implementation is taken from i915.
>>>>>
>>>>> v2:
>>>>> Store last known value when device is awake return that while the GT is
>>>>> suspended and then update the driver copy when read during awake.
>>>>>
>>>>> Co-developed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>> Co-developed-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
>>>>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>>>> ---
>>>>>  drivers/gpu/drm/xe/Makefile          |   2 +
>>>>>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |   5 +
>>>>>  drivers/gpu/drm/xe/xe_device.c       |   2 +
>>>>>  drivers/gpu/drm/xe/xe_device_types.h |   4 +
>>>>>  drivers/gpu/drm/xe/xe_gt.c           |   2 +
>>>>>  drivers/gpu/drm/xe/xe_irq.c          |  22 +
>>>>>  drivers/gpu/drm/xe/xe_module.c       |   5 +
>>>>>  drivers/gpu/drm/xe/xe_pmu.c          | 739 +++++++++++++++++++++++++++
>>>>>  drivers/gpu/drm/xe/xe_pmu.h          |  25 +
>>>>>  drivers/gpu/drm/xe/xe_pmu_types.h    |  80 +++
>>>>>  include/uapi/drm/xe_drm.h            |  16 +
>>>>>  11 files changed, 902 insertions(+)
>>>>>  create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
>>>>>  create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
>>>>>  create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h
>>>>>
<snip>
>>>>> +
>>>>> +void engine_group_busyness_store(struct xe_gt *gt)
>>>>> +{
>>>>> +	struct xe_pmu *pmu = &gt->tile->xe->pmu;
>>>>> +	unsigned int gt_id = gt->info.id;
>>>>> +	unsigned long flags;
>>>>> +
>>>>> +	spin_lock_irqsave(&pmu->lock, flags);
>>>>> +
>>>>> +	store_sample(pmu, gt_id, __XE_SAMPLE_RENDER_GROUP_BUSY,
>>>>> +		     __engine_group_busyness_read(gt, XE_PMU_RENDER_GROUP_BUSY(0)));
>>>>> +	store_sample(pmu, gt_id, __XE_SAMPLE_COPY_GROUP_BUSY,
>>>>> +		     __engine_group_busyness_read(gt, XE_PMU_COPY_GROUP_BUSY(0)));
>>>>> +	store_sample(pmu, gt_id, __XE_SAMPLE_MEDIA_GROUP_BUSY,
>>>>> +		     __engine_group_busyness_read(gt, XE_PMU_MEDIA_GROUP_BUSY(0)));
>>>>> +	store_sample(pmu, gt_id, __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY,
>>>>> +		     __engine_group_busyness_read(gt, XE_PMU_ANY_ENGINE_GROUP_BUSY(0)));
> 
> Here why should we store everything, we should store only those events
> which are enabled?
> 
> Also it would good if the above can be done in a loop somehow. 4 is fine
> but if we add events later, a loop will be nice, if possible.

i got your point. i could do something like this

for (i = __XE_SAMPLE_RENDER_GROUP_BUSY; i < __XE_NUM_PMU_SAMPLERS; i++) {

  val = __engine_group_busyness_read(gt, i);
  pmu->sample[gt_id][i] = val;
}

Thanks,
Aravind.
