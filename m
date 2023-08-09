Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC169C001B0
	for <intel-xe@archiver.kernel.org>; Wed,  9 Aug 2023 13:12:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE2110E43C;
	Wed,  9 Aug 2023 13:12:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED7CD10E43C
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Aug 2023 13:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691586723; x=1723122723;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iuqxBGUStdhEMNth1DlzJgIK/GxfFQIHLIXoNoxK6ZY=;
 b=aoFvF1Zj36FUSztjGovZNLcHHRadXS/Lsjnl2yG8ujFvQ46K3vlQU95J
 xZtkbGxLDUMvJw7QT7DpxYSvDmuuHFpevhGpy8m4BCJyMtRk0wRGvql3W
 WH80iGoUBoGUeQ4gjo+4YxP1dkllyfXJJJrSo3I+q31RH0t4q6lQJptio
 OP/e2LlxjRyelOX8i4qDdJ0MtO8viWak0Pp/psT/rG380X+Y1dUwV6/Fg
 5a8UlVuXpQVJ5Z/F5OhZD1R9veQwSbI0U7m0yVF77kgW+auHhTZBEeogJ
 0rjdPj0awGnRLkpcM3ES3UuGudJLKWu7nekCmAaGn25fSj2A6kqegrY0Q A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="374827397"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="374827397"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 06:12:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="735005116"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="735005116"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 09 Aug 2023 06:12:01 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 9 Aug 2023 06:12:01 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 9 Aug 2023 06:12:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 9 Aug 2023 06:12:00 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 9 Aug 2023 06:12:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dskXNL8rAlgBlzOcpe4CIoTtuOnnVe8ZjT7ep5MTInmJJ3UcxaB3tyJ8SNVUrx+ZlyO82mH9pESrw/0YRdh+hRXqy5L03t5GDITuiqj0xDksT6JDR9QTH0gqw4/bN0uZcg+mf3fCXkRShZ2c6IIpjY5D65FzQr/hk3e/qlU5QB8yiVrfiD4mic7d9hdrQ+x9v0OrhnkcCF1N86KHLibfbbhaSF8/JAbyb65i6OyVhGffTYonWPttcx5SAgwtFe6bjphRrAIfFvEzYwoTcQssYifBs+hVA6Wj2d7jKzr6eqgNZm3SQWwn10Ag7s9tLp4Gtgyz60TOyViMPIuce13k9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8QTRzOUwogZM5SfNqGEPVc5B2mEccUbYp3WcX9hfeXI=;
 b=P7HDakLyVs0w8XPPwOkaVOZSVqGKi77xG93E9tVcB7zHLTm+UXQAEdNi5RIO/jIBUGfepcpjNZHVgO+ERKF2VFEeVaDRmxoStdlB5KSM7nPGc6Y55qHJ0zUZEeSALWkPyjz0uZw4Lz67sj8Te356CoD0Y18Yun0TVVXwyQ3inLA2+aECfSj5Pma2CaUQ8iYV/XBMjRAogHCdb78K4Yc2nu38ssAuCySfVlKzUYEExiDsPb0xxi83TwLftnxlwnaHP5b+GG7qP83UfMX3Iw68080BzTdZHDI5HCh1g0Lw3FIx2rvm11p3T6d5Xl1/z+sSbA4R75Q/38Vqyhk+sbrnFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by MW4PR11MB6810.namprd11.prod.outlook.com (2603:10b6:303:207::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Wed, 9 Aug
 2023 13:11:59 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::a581:e6a4:d186:c153]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::a581:e6a4:d186:c153%7]) with mapi id 15.20.6652.028; Wed, 9 Aug 2023
 13:11:59 +0000
Message-ID: <cec5ddd7-e79f-c848-653f-81e21240f29a@intel.com>
Date: Wed, 9 Aug 2023 18:41:48 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.14.0
Content-Language: en-US
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230808115436.400611-1-aravind.iddamsetty@intel.com>
 <20230808115436.400611-3-aravind.iddamsetty@intel.com>
 <877cq4y8s3.wl-ashutosh.dixit@intel.com>
 <95750d7f-df24-a9c5-ab39-86db69767bac@intel.com>
 <b9496a4b-bea2-fa15-6ae1-5810baf70260@intel.com>
In-Reply-To: <b9496a4b-bea2-fa15-6ae1-5810baf70260@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0114.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::12) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|MW4PR11MB6810:EE_
X-MS-Office365-Filtering-Correlation-Id: d627b174-7dc1-4081-8630-08db98da367b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bfP/QLG7rQDMaS4RnEjBvM3VDIvaSCQ/UwAJZFvbuEczJ80Kx4oFVM/VUw6e87U97Fi7+uoPwsptAVcbJWtf37oygC0ds4DZZDScUhycZl0eXkmkajWqoNxf2e5lphKAOwlOJw6eYsnUloSzUM5aOLbvWPAYyV24F/hRoXo1e2tpGCcoX44nl8DD1XR4hMZYN1GSbM537qt3/8c7z15dDJgWMfkg62gMZlXi9Hde/K7q1zTRXtCSbgz8tQ2c1st1jfZ8pA96GQlIKYH4CvU5uwoysrq3BZ0+wBs7t+M9KzZU8SkU/3yZydvMqygi+2a0PEtMOabyKFQc8T6dXtCAIJGXc4CgHJDlwPpVyMoeCKfwYRDsuolimai5Ap6c3SvvCbMjGAcN6BjSgQRQcxsV05DdJGplcuN8LEqOar6qqOTZ9TyJ4JQPiGZQIta+30AYxJmgrbqXe9L/SX67sq9N9FyXF8wc4LwsGVqc7JPF6+Z+d58Z9P5+X2DFPHR4eeEV1NKx3UkVwHoKopXUhxNk46rkY/c9lbMd8CyVKcp6I1e2qPChhekfiJKaMmiijxCPMZjq/HJFJauTP+Hsb1EX2BMb8wVGTgGvBTzQvvU8T8w62OknofEdJdkC7UOFRBzsXfjaxVxOvxn0b/OnOjvS7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(39860400002)(396003)(136003)(366004)(186006)(1800799006)(451199021)(2616005)(6486002)(6666004)(54906003)(37006003)(6512007)(38100700002)(478600001)(82960400001)(2906002)(36756003)(6862004)(8936002)(41300700001)(8676002)(66556008)(31696002)(5660300002)(316002)(86362001)(4326008)(6636002)(66476007)(66946007)(26005)(6506007)(53546011)(107886003)(83380400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHNoeXlKb2RaU2lFYVRDU293QTZNNzRZTkZXUHdQQi9WbUJNUU9DOUNrMTdE?=
 =?utf-8?B?VHlWRENEMmtSUGM0UE9TZVBUUEtQUVFkSjVnMFd1TFZ3Q3hXODR6M2NkL2Ur?=
 =?utf-8?B?QlkySG03M3BsS0tFRU1sYmg5VXpNSjllTm9zcExDQ3JoQXZSSk0zYVhpNTlV?=
 =?utf-8?B?U0NUQStkNmJoTFplN25PWVFGT0FSQUpvZXA2OEdxb1BZdzZUd1hMdzRxSlpC?=
 =?utf-8?B?MkNEVW1xWWtQbzJvOTVodWFERnI0QnIxNHRzSWcrRE5BYytwekc3a2c5N0FO?=
 =?utf-8?B?WVFQOElFa3htRzY4eVh2a3M4VFlEUTR2RjNyZmVReU9vM0ZrcnpTbVA3OUdC?=
 =?utf-8?B?eW04alFvekU1eENLelpXbzA5MjRRZThZTFlFT3B0Q0tXNzVJeXFTd25pSUJZ?=
 =?utf-8?B?T2gyeTFRTnBiWFZvWFErM0F5RWNHRU5ucmZvRmJVSHhYbHhUTFRUekhBVTZD?=
 =?utf-8?B?VHYzc25HR1JRRWxiYXZXNDZoR2l6UlJaVnEyOEN3bGtnOStjR01pdGwwekUv?=
 =?utf-8?B?QWF6bXNPYXRhSzUxRUtUUXM1bm51MzhmWGdsZEtjVVVkTlhmME9ORUYwKzh1?=
 =?utf-8?B?QTRRTU9ZOFQ4SjZvMGVMNFVUZ01RVWdCQjFsNXJXRENBL3lGem9VR3JsTDhs?=
 =?utf-8?B?dkRmOWJLWlFiWnV6RHZleFpCejNweE1yZ2VRSEl1bm00OWZoZGtJVVNPM0RV?=
 =?utf-8?B?TzVFOUpmMU4vZnU2VXlwa2xSV0NrOC9QWklxVlJMWTl6RzlJT1ZWSW9seXho?=
 =?utf-8?B?VmsyUys1UGxFODdJY1hOdmE4eGVXbGhqODg4Z2lTNW1tTXFRdlpNMVNDUVdR?=
 =?utf-8?B?eHJUODl4ZVd1cElkaGlVeWR6NGlVbUZtdFoyRGFNRERBK3R5dzg0aWNReCtm?=
 =?utf-8?B?S3NHWm04amU2R1FKWERsY1BnSEhNRHdhSVVTeWlOcFp1ZVN2OEh5QlFUb3lW?=
 =?utf-8?B?cnBkRGwxS0lLYUdic1oxVnBPazY1KytHKzgrUzZXWE9jK0Vsc2VRem5mN3N3?=
 =?utf-8?B?VVpWMWhIY3d1VjREWUg5U2xnRGFNRGdRU0hXTCt5d2RtTW1DOHc4ZkQrazY3?=
 =?utf-8?B?Ulc1dVdHMk9BdWRIOUgrcTFvTE1VeVBBQytJSTNPNjZqR3JHY3FsU2NRZW9O?=
 =?utf-8?B?VHZKK0d1dDB5eUtxdzZTY21oZDZ6TFZxck4xU0p3Nnd4VUNBSXdtUmlxV2Qv?=
 =?utf-8?B?WlRYZG5walk5TExlbFdTQ0pMNURFZGtPa3o1eW9ZNm1KZ1dLZkJFWWlDNDkx?=
 =?utf-8?B?YjVKQyt0WllSeHZKVHVVMy9lWldxNHAyemc0NE43NkJiU00wSDZsZjVGeEZ4?=
 =?utf-8?B?QmtEY01PbmNieklac251TWcydHNvcktseXlmUU4rTWI2VldhTHEwQXdYbHhI?=
 =?utf-8?B?Y05zbkVXaTZXUWdWcEVES0JiNExYM3AxR1ZmbkpNZFNwaFZpdzNFZHNUQ0RW?=
 =?utf-8?B?WTIrVzRxR052UDcxck5LS2RjdW1XYlJKU2JYSFgwQkMzM3JvanBxcGtXTnFa?=
 =?utf-8?B?dmJOVUxiVnVCTk8zRERhN2JQNllPTGxIYUVjTEdMTnZ4RHVGcWNTYkJEazQw?=
 =?utf-8?B?Z2xrMjVvYU1iZkkyT2NTUE1lYnArY3prVTZOdDdRS210K2d3WENrTEdaMDF2?=
 =?utf-8?B?ck1ZL0EvamZDOU10Vk85elVWaUJMT3c5eElvTktxVCtCVTRPZzE1RWNkNFZ6?=
 =?utf-8?B?Z3VCNEJkbXlxSVBndWVFMlduQndXUlBGb1pVVU10bzdjdHNkVFJZTTNNZkdq?=
 =?utf-8?B?NGJzSURaMzUwZytlZHhXSUhQMWZFdGpSdGZDbGR5Y3ppUHYwYUVkMERFOHBD?=
 =?utf-8?B?Mk5tSHNoSm5mOStGck4rTENyWjcyS3V4bjN6WThWcTlrekp3TmxyeGx5bnZP?=
 =?utf-8?B?a3JkTHhMODBlNWNpT09zUSt5dkxBd0RyMkNsMkRHeEtKY2puMXBha3ZURnE0?=
 =?utf-8?B?Q3NHbVZqanl5d2hYU2dMTHBjRUtIeWZUSElKZ1BjbjFqRHZXMTVHZFJ5LzBu?=
 =?utf-8?B?a21qVTFaSjdlb25LREsyQjhKMnNWTGIxZE1FL01hbGxjSUJlWTYyckxSSVR0?=
 =?utf-8?B?VngyYzVKMGhYUCtaQmdBME8zS1Jqei9FQUtubTl5UUhoTm1kbk03cE5nck1I?=
 =?utf-8?B?RDdPcklsOUtLSy9nOUozWjVnQjJ6dTNxZUlxVExtK3NGbGRNOUk4Q3F5eDk4?=
 =?utf-8?B?eEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d627b174-7dc1-4081-8630-08db98da367b
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 13:11:59.1264 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S/lXgyvbVaEBRFwI3ZbM77PRJIwFibc5id2dKfJZf4epKbE3ncpND4SeVHRr3NK67w8D/CzqLyr1VsDJJrWC8Gw/zHTttWL62TY+2/uSrks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6810
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 2/2] drm/xe/pmu: Enable PMU interface
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



On 09-08-2023 17:27, Iddamsetty, Aravind wrote:
> 
> 
> On 09-08-2023 15:25, Iddamsetty, Aravind wrote:
>>
>>
>> On 09-08-2023 12:58, Dixit, Ashutosh wrote:
>>
>> Hi Ashutosh,
>>
>>> On Tue, 08 Aug 2023 04:54:36 -0700, Aravind Iddamsetty wrote:
>>>>
>>>
>>> Hi Aravind,
>>>
>>> Spotted a few remaining things. See if it's possible to fix these up and
>>> send another version.
>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>>>> new file mode 100644
>>>> index 000000000000..9637f8283641
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>>>> @@ -0,0 +1,673 @@
>>
>> <snip>
>>>> +static u64 __engine_group_busyness_read(struct xe_gt *gt, int sample_type)
>>>> +{
>>>> +	u64 val = 0;
>>>> +
>>>
>>> What is the forcewake domain for these registers? Don't we need to get
>>> forcewake before reading these. Something like:
>>>
>>>         XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>>
>> based on  BSPEC:67609 these belong to GT power domain, so acquiring that
>> should be sufficient.
> 
> But if i understand correctly taking forcewake is not allowed here as it
> is an atomic context and forcewake can sleep and that is what I'm seeing
> as well, might also be the reason why i915 didn't do that as well.
> 
> [  899.114316] BUG: sleeping function called from invalid context at
> kernel/locking/mutex.c:580
> [  899.115768] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid:
> 290, name: kworker/27:1

that is the reason why in i915 we were doing similar thing of storing
the counter as we enter rc6, not sure how do we do that in xe.

Thanks,
Aravind.
> 
> 
> Thanks,
> Aravind.
>>>
>>>> +	switch (sample_type) {
>>>> +	case __XE_SAMPLE_RENDER_GROUP_BUSY:
>>>> +		val = xe_mmio_read32(gt, XE_OAG_RENDER_BUSY_FREE);
>>>> +		break;
>>>> +	case __XE_SAMPLE_COPY_GROUP_BUSY:
>>>> +		val = xe_mmio_read32(gt, XE_OAG_BLT_BUSY_FREE);
>>>> +		break;
>>>> +	case __XE_SAMPLE_MEDIA_GROUP_BUSY:
>>>> +		val = xe_mmio_read32(gt, XE_OAG_ANY_MEDIA_FF_BUSY_FREE);
>>>> +		break;
>>>> +	case __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY:
>>>> +		val = xe_mmio_read32(gt, XE_OAG_RC0_ANY_ENGINE_BUSY_FREE);
>>>> +		break;
>>>> +	default:
>>>> +		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>>>> +	}
>>>
>>> And similarly here:
>>>
>>>         XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>>>
>>
>> Thanks,
>> Aravind.
>>
>> <snip>
>>>
>>> Thanks.
>>> --
>>> Ashutosh
