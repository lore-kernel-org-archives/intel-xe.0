Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDB8EB64D9
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jul 2023 06:05:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDEF510E12C;
	Mon, 10 Jul 2023 06:05:21 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD95B10E0FE
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jul 2023 06:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688969118; x=1720505118;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ouIy4YgvgcigfXeNvAnNmQs3X2QPyk1L2O5uYyKf9h4=;
 b=Gc1uX6vyf1xc0GStJOe/uW9ugfxs5syye8Oh13SGAHFLXfpmBTSitdaD
 9+fpl7+fFaYtRxMA4t8yaJNkqL54VOKPR7S62qLDR10hMZKgRY1ypZpwF
 YesyHB2/Vz0fqPch5lTkJK71ToU6Br531G7+xI7LEeuCUIjJ0pAmKmX1t
 GK3PeuMFY1M1BvyIetdiPLBwN/1tHb1FixUkOgxwnusZ3m2gBmvLpOEGA
 JcpWs8I5dQJn9oTnyB+/rlM6XpjUyIM+uS94qKF4iIrC2RgUANRgl8eOd
 UJ0QUL4YI3Te/vWD/xfvfR17OMfhoChUUzo1JRsNdaoDSpvhyuXIHtVxv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="450622990"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="450622990"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2023 23:05:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="894665964"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="894665964"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 09 Jul 2023 23:05:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 9 Jul 2023 23:05:17 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sun, 9 Jul 2023 23:05:17 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sun, 9 Jul 2023 23:05:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XbPSuy4hNnWzumNsy/YrhrI1heoWRdAixw6mg/uuK8eleivCFroGTltxZnDP7RugMwp7xYFFpJtjESCDtXyIkEF/Oa5XgvBaQHYDWk9i1wn+s4LJEm5KleDFXONMOq3SqVcwOCAZwiNOuf2YPIugGBulOUPXRNy1kTVtZYo/lyhh4QzF3VPYJ3ViIq7LXEsIItuLB6W+COJspJG+0AIUC6bqKP3LUDWNwCw3tBpMYHKEjQeDD4MQ2MXV0A0Bod3/7tlW0g/dJ3I1BLIR811gARKL16YllNeN8T1Cc7mwFmwGaTY/nZbupBWhM1RumBge4y0rqyIwxeWmPFPghqOtpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0mS/x7rAR+WpCed6em9WHm8DD5HqE0sX94OooTB9HKQ=;
 b=AnQ6gJfV26K0OhZ+PdpU3iXtGxDmMqU4CfAAxAvi3mpE7JvNCeEYdbnJBH9335ep5OYsKe3sDNczFTeL/oqDw089p1eo5vqKCyk0B4PSjqTSsATjoPabw1d+0Ma+Qieq4V1NE8+N8wxNSeeggKR6KV3V3ohkdl8jvVu1ck4hgCYxSBRgwobek7vurf9Z5lC4v1FuHEBr6VtVawissNTOLJfQTmjrih/X1QQu1A11wWr1UjrK5O4yeysEHpL5LbbfNYVpdwWjlVQReIw9FxMWS+0M3viTnh9wQLmhAa4lgqo+LSco8tptfd55k6YcO0x9PhbxDxKtsRHeBsweOvmrkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by IA0PR11MB8399.namprd11.prod.outlook.com (2603:10b6:208:48d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.15; Mon, 10 Jul
 2023 06:05:15 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::2ead:623d:b273:bd8f]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::2ead:623d:b273:bd8f%4]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 06:05:15 +0000
Message-ID: <953a6abf-5e07-ef87-667a-57ceef40369f@intel.com>
Date: Mon, 10 Jul 2023 11:35:05 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230627122113.1472532-1-aravind.iddamsetty@intel.com>
 <20230627122113.1472532-3-aravind.iddamsetty@intel.com>
 <87mt09daqu.wl-ashutosh.dixit@intel.com>
 <a6fbb435-6383-772c-703d-183f26a8144e@intel.com>
 <87a5w8cvmr.wl-ashutosh.dixit@intel.com>
 <04ae6811-9bc1-c66d-6cb8-640bfd8a9c7b@intel.com>
 <878rbsckzf.wl-ashutosh.dixit@intel.com>
 <3c4bec6c-7af0-ade7-91bc-bbd3bfa46357@intel.com>
 <877crbct36.wl-ashutosh.dixit@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <877crbct36.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0117.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::32) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|IA0PR11MB8399:EE_
X-MS-Office365-Filtering-Correlation-Id: 02c08ad3-1a91-4641-f935-08db810ba0c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EigVeVkyUjKL6TwvhIptyJzi8m+WieFwTM+x4ci8xx8gdYtx35ViyZE9BoJ5DHMVI6KzFmzV0YEI2hbUj8g8M7tXw/Deiur7+iCVLhmOrUust6TGqHQiqwAWto50FMW6KMPTMFo+hKBxrfNlb3YM7Ckdx0tdXKD4FHJ2rnFAUm39As69f6jItegcubQX7106ucMhoagTEPdT4T1vDP5hH/KjsL2qgQSxaLAcIzlFFQor1VeX2Ro3iqUl8r4tRk5thbAIQEoesbn/QfzN1TzGUIyOG6ii+ZMQsoEoXJgxaYyW1lzM3oI0m+fE1YiAoH4wlELVzMYaGnj/vuP+b5kjSYbXbviqXquq8C2hLqQv1BmL4woDoy7QosZzOFsfPygHmSzNVD/wmdVRqH1PLIomddC7HomE/XamJIVr6GvHvssHqzwdZgKcQi7e+DsAVH+P3DHQt/vRUSUNwpXsMKZtb5d9O2SLG0Q9P3DYEcKBP0/sAwAvHgoNUa3mYndQBi9pc8R15rFa3pnq4Qi7ZpGIv0H2xM+1RLO/Kqeal7+QyV86TBqmkC9xAd8/ENn+uFusbQ6VH/oz+dEKaF4yEap3cYa7kZTjNoHN+kCF4fm/VzQNPWUMiAep+fu4oOoOMbbt3Rhx29ixFODJzDuHnxtSlTwbWVFCAPGhDXLW+KTBE6BH/dHe61rbiFHORVJH29Gf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(376002)(136003)(346002)(366004)(451199021)(6862004)(8936002)(8676002)(5660300002)(37006003)(41300700001)(54906003)(6666004)(6486002)(31686004)(2906002)(316002)(966005)(4326008)(6512007)(6636002)(66946007)(66556008)(66476007)(16799955002)(478600001)(36756003)(31696002)(107886003)(86362001)(38100700002)(186003)(2616005)(83380400001)(53546011)(6506007)(82960400001)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WE96VVl0cVlmUXNMMHVhWCtDeHNTQ3FoeWpmNnRjaUhIa056QjlsNmg2bmZl?=
 =?utf-8?B?SzZmeG13cGxXeWlueHRoeWtBT3hPTnVTdlRCSUhPaTBNRmpwb2ZZVnlFbm1Z?=
 =?utf-8?B?bjlyNkQxSFkwd3o0NitMaGFQbXVPNExsTXFTdUpJQzNkNlY3RlJDMHRIV1dv?=
 =?utf-8?B?SVJCdExiUjY3MnFpUnU3ZVllYnU2aDMxOTF4N1JCOUJubzJRSWNDdURBNkdQ?=
 =?utf-8?B?MkpDU1BZK09BaWthckJsdjB2bWhhTVp2NVVtNkNScEI4b1hHQ0NqQlEwNS9F?=
 =?utf-8?B?STFLYlNkSlpuSTk4Szh1Z3E1bzJNRkRXcnd1UG1NNm9KTjFUV2ZMNVh4R0Vj?=
 =?utf-8?B?Y1pGTzR5YzFTZ05zZGx4RDFJYlZ3WGkxWHp2S3piQmZSejNiQ1l6OTVWWkNH?=
 =?utf-8?B?emkzaFNWa1J2V0ZsOE5TZUhBVE9Ya09iekJKcGZrcTg0bENRdzVIRTFoRVlQ?=
 =?utf-8?B?YXlxMXBEUjdrbDErMTJrWWwzMmtwZU1YT1hjR2ZWM1M1QkxyNHBWckthYlcz?=
 =?utf-8?B?T1Z3YVBXSFU0QWdiY1A3OU5qQzVjQnRtaURqcUh0UDcvcTRha3Z0ZGZ0aXh3?=
 =?utf-8?B?QzBJeDRyYzNkUnh1Rjk4L1ZtbG5xeU5TVGo4czk4VDZIY2JjUDFFZFY3OFlu?=
 =?utf-8?B?VVhwTnlOa2JtbkZtYm5UcEQydGpQZUh3UCtCMU4zV3RWL1VqM252amx5TGdr?=
 =?utf-8?B?VG9sUUR4Zm1hbmIyVklNcDF0Mlp0akxFUFBjM3Z5MEdqWEh4N29uR3N5TVor?=
 =?utf-8?B?YVNya0Nocnc3UWxxRzFZYjlFblR4b2I1Vis5Y0FCRTlvSndVWnlsQUt1SU9T?=
 =?utf-8?B?bHJwcitORW1iV1RCSExwWklYR1JiSTJtMk1Bb2gyWjU0MkRucGhpU2hCZXdN?=
 =?utf-8?B?QVE1cWQwVFVJd0kxUk9YdzNDU01GM3UwRVdBUWQ1Zkw4ZklOUDVxeThhUHlr?=
 =?utf-8?B?OWZyTWZISzRWTm9UREhadWRIMFNPa0NRZjM3OERuQXQxRlNtbi9jZWZRb1Ry?=
 =?utf-8?B?NlVUNC9WMFpyZGJZQ1hzSmZZVUliZ3FtZm9oUEZkaTdKZ1BGV3NaNnJ4L2hH?=
 =?utf-8?B?ekJHYW9rYkYwOXdtVDdvUTJzYlFOVThzT1FBd0pCVVlrcjhBY21NRmhuV0to?=
 =?utf-8?B?WG96bWVDQTUyeTByU0liMmE2WUtFVU9UVElxckt0ZS9jbitGWlFSd0N2bFg4?=
 =?utf-8?B?Ky9yaFJnTis1WkRNOEhINXlMWkVmNTF2Tm1rQ2hJM2IxekFqQVY4YS9TRFVT?=
 =?utf-8?B?RVUwaTFIWHBGR21pLzU1elNXR0xYRTB5aUZiOHpzOVhoTlhWUmM1cDdRanRV?=
 =?utf-8?B?bkp4TGw1V1R6dzgxUTJEOW1qMXBEeUNhVGZmUDdhbGZkb2I5VjlxT1hVenJN?=
 =?utf-8?B?NGYzcWg0UnJoMWhWTkg4SlZYUTZvMlhyTmFFK3AxU2JySCt1VFNDWFUwUlRx?=
 =?utf-8?B?QkFtZXpFQ0ExREVWMFNIcmc4SWEzRG0xRVdqdm9mVERNY0JPck9aOTZBcnlq?=
 =?utf-8?B?Ni9EVHhZc1d3VGlUQlI5RGhvbk05OXkxd0JNWVB3ZnlnV0l6OGs1bXhIOXBT?=
 =?utf-8?B?RTdFdFpaV3JzUUtqZUZDSWRmRGJOS3FUZEhBWlM1bVZCZHNIUTUyNm9PN2g2?=
 =?utf-8?B?NHBTWHNhUys5MVJyQXMwakV2aUFJTHBTZFRLSzExTVJCcnJEMURKcW9tZ0x3?=
 =?utf-8?B?Q1BDRWtKU0E0TVVncmlwRmFkeW1tVkg1alJJR1JLV0ZvSVFpa1QzUm1penlz?=
 =?utf-8?B?MFpRVi9aL1pkVHhMODd1UnZ2SEg5R2pjTnZtVjJ1aXNjTGtHeEUrWnY0Q2Yw?=
 =?utf-8?B?YU5TNWZwQ0xDa25rTERtWEJ6ZWZyTGtaZk56OGt1M25YUVFWZGFaTmNobG9M?=
 =?utf-8?B?YVp2WFByemRmeXN3NlRpT2NoQmJKMDBYaEwvWk1URFB4VkpPRjI0SG91THoy?=
 =?utf-8?B?eW42em9yTkRRVEtxbkYvd0llRktmRkkxRVBCWUIxR1U0bXV0NUVWREI4ZGRj?=
 =?utf-8?B?ZGQzanloalJLOUxpcjhkSEZVNTRhaVJWaDJFOXppSXd3M2Z0NHg5TjVLbUxP?=
 =?utf-8?B?aUdmd0JJRVBmb2ZXbURuTUxmUXl5ZFlDV2hnN2htVVBkRDZLVUxXZ0Jja1lK?=
 =?utf-8?B?RS9BOVV0VFBnQ0NpWDQrcTVkNWQ4RVFjWXlMOHV2MGx1SW54Q3VTMVVBbFBO?=
 =?utf-8?B?d2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02c08ad3-1a91-4641-f935-08db810ba0c8
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 06:05:14.9849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C8HAYW7CvG7ImmAgtcqLy/4oWcPCM3l1iQeapCGkO05Ysyz1StGYPdVIo5XsBqH2rOTIdoiVusLptUQi6wk4IKpDUG6EgFed9L6QnIFwnz4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8399
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



On 08-07-2023 02:55, Dixit, Ashutosh wrote:
> On Fri, 07 Jul 2023 03:42:36 -0700, Iddamsetty, Aravind wrote:
>>
> 
> Hi Aravind,
> 
>> On 07-07-2023 11:38, Dixit, Ashutosh wrote:
>>> On Thu, 06 Jul 2023 20:53:47 -0700, Iddamsetty, Aravind wrote:
>>> I will look at the timing stuff later but one further question about the
>>> requirement:
>>>
>>>>> Also, could you please explain where the requirement to expose these OAG
>>>>> group busy/free registers via the PMU is coming from? Since these are OA
>>>>> registers presumably they can be collected using the OA subsystem.
>>>>
>>>> L0 sysman needs this
>>>> https://spec.oneapi.io/level-zero/latest/sysman/api.html#zes-engine-properties-t
>>>> and xpumanager uses this
>>>> https://github.com/intel/xpumanager/blob/master/core/src/device/gpu/gpu_device.cpp
>>>
>>> So fine these are UMD requirements, but why do these quantities (everything
>>> in this patch) have to exposed via PMU? I could just create sysfs or an
>>> ioctl to provide these to userland, right?
>>
>> PMU is enhanced interface to present the metrics, it provides low
>> latency reads compared to sysfs
> 
> Why lower latency compared to sysfs? In both cases we have user to kernel
> transitions and then register reads etc.

The sysfs will have to go through filesystem which adds latency but here
i think the most important aspect is requirement of read timestamps.

> 
>> and one can read multiple events in a single shot
> 
> Yes, this PMU can do and sysfs can't, though ioctl's can do this.
> 
>> and it will give timestamps as well which sysfs cannot provide and which
>> is one of the requirements of UMD.
> 
> Ioctl's can do this if implement (counter, timestamp) pairs, but I agree
> this may look strange so PMU does seem to have an advantage here.
> 
> But are these timestamps needed? The spec talks about different timestamp
> bases but in this case we have already converted to ns and I am wondering
> if the UMD can use it's own timestamps (maybe average of the ioctl call and
> return from ioctl) if UMD needs timestamps.

here i'm talking about read timestamps not the counter itself and when
we already have an interface(PMU) which can give these details why to do
duplicate effort in ioctl
> 
>> Also UMDs/ observability tools do not want to have any open handles to
>> get these info so ioctl is dropped out.
> 
> Why? This also I don't follow. And UMD has an perf pmu fd open. See
> igt@perf_pmu@module-unload e.g. which tests that module unload should fail
> if the perf pmu fd is open (which takes a ref count on the module).

here I'm referring to drm fd, one need not open drm fd to read via pmu,
and typically UMDs do not want to open drm fd as it takes device
reference and might toggle the device state(eg: wake device) when we are
trying to read some stats which is not needed.

> 
>> the other motivation to use PMU in xe is the existing tools like
>> intel_gpu_top will work with just a minor change.
> 
> Not too concerned about userspace tools. They can be changed to use a
> different interface.
> 
> So I am still not convinced xe needs to expose a PMU interface with these
> sort of "software events/counters". So my question is why can't we just
> have an ioctl to expose these things, why PMU?

firstly, PMU satisfies all requirements of UMD, requiring read
timestamps, multiple event read. So as we already have a time tested
interface is kernel why should we try to duplicate. secondly, using
ioctl one has to open drm fd which umds do not want.
> 
> Incidentally if you look at amdgpu_pmu.c, they seem to exposing some
> hardware sort of events through the PMU, not our kind of software stuff.

the counters that I'm exposing in this series are hardware counters itself.

> 
> Another interesting thing is if we have ftrace statements they seem to
> automatically be exposed by PMU
> (https://perf.wiki.kernel.org/index.php/Tutorial), e.g.:
> 
>   i915:i915_request_add                              [Tracepoint event]
>   i915:i915_request_queue                            [Tracepoint event]
>   i915:i915_request_retire                           [Tracepoint event]
>   i915:i915_request_wait_begin                       [Tracepoint event]
>   i915:i915_request_wait_end                         [Tracepoint event]
> 
> So I am wondering if this might be an option?

i'm little confused here how ftrace will expose any counters as it is
mostly for profiling?

Thanks,
Aravind.
> 
> So anyway let's try to understand the need for the PMU interface a bit more
> before deciding on this. Once we introduce the interface (a) people will
> willy nilly start exposing random stuff through that inteface (b) same
> stuff will get exposed via multiple interfaces (e.g. frequency and rc6
> residency in i915) etc. I am speaking on the basis of what I saw in i915.
> 
> Let's see if Tvrtko responds, otherwise I will try to get him on irc or
> something. It will be good to have some input from maybe one of the
> architects too about this.
> 
> Thanks.
> --
> Ashutosh
> 
>>> I had this same question about i915 PMU which was never answered. i915 PMU
>>> IMO does truly strange things like sample freq's every 5 ms and provides
>>> software averages which I thought userspace can easily do.
>>
>> that is a different thing nothing to do with PMU interface
>>
>> Thanks,
>> Aravind.
>>>
>>> I don't think it's the timestamps, maybe there is some convention related
>>> to the cpu pmu (which I am not familiar with).
>>>
>>> Let's see, maybe Tvrtko can also answer why these things were exposed via
>>> i915 PMU.
>>>
>>> Thanks.
>>> --
>>> Ashutosh
>>>
>>>
>>>>>
>>>>> The i915 PMU I believe deduces busyness by sampling the RING_CTL register
>>>>> using a timer. So these registers look better since you can get these
>>>>> busyness values directly. On the other hand you can only get busyness for
>>>>> an engine group and things like compute seem to be missing?
>>>>
>>>> The per engine busyness is a different thing we still need that and it
>>>> has different implementation with GuC enabled, I believe Umesh is
>>>> looking into that.
>>>>
>>>> compute group will still be accounted in XE_OAG_RENDER_BUSY_FREE and
>>>> also under XE_OAG_RC0_ANY_ENGINE_BUSY_FREE.
>>>>>
>>>>> Also, would you know about plans to expose other kinds of busyness-es? I
>>>>> think we may be exposing per-VF and also per-client busyness via PMU. Not
>>>>> sure what else GuC can expose. Knowing all this we can better understand
>>>>> how these particular busyness values will be used.
>>>>
>>>> ya, that shall be coming next probably from Umesh but per client
>>>> busyness is through fdinfo.
