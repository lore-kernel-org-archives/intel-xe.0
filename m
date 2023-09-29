Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D087E743ED
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 06:09:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56BD210E0E0;
	Fri, 29 Sep 2023 06:09:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DA3610E0E0
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 06:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695967753; x=1727503753;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rng0gg6bKgjk3OTWI0b5GxZB/S0NgGisKNg/+GNp148=;
 b=mg3NiAjfI6ZXGRN5HplfDo5uLA3jTZhUuQ9+aMWy5VH29TkXuHZoyW4I
 +UQeIJnv+DTLnU9wIWBzbd/YPw6QAqswDH0Um65RcFl7/VFEFT8we9nml
 Y324UR6SZg9qY6Q9D1ucGUAybeDtWKw5u6sYQGMGJPwBPzFjSXgCjdH7b
 fBgsCWALLkcKpKkMu9mnJHry381LgfJJfsuMw8bFKEFLXt8GXH25DAU7h
 RWYCJBQCSQIYAPOC8p8fmeK1bZ9yaIbUM/5xTKskh6ey4HhS8JpESXWBK
 MKTJAYuPhV3v070l9NTQhaRh/sz19lfo0tfnqbGtR31OiY+sn0ln0Qvym g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="448733767"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="448733767"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 23:09:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="749871815"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="749871815"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Sep 2023 23:09:12 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 28 Sep 2023 23:09:11 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 28 Sep 2023 23:09:11 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 28 Sep 2023 23:09:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I00+qGu56MRzLeAMWQeNgHX0JJ2BbGWENCPNam9ZhnTP+K+Su3+vk//92tvEsmQ7rHFKju7CA5u00SgymE3bTguEz8RyQvCL/ySQHHe+HuzRLNRvZs2xKcKy6otPr9A0WKSV8Y+eR1OKZ5MOkESz1a9pUnDd81RxJhE0AE3rUp7RS+7yDOG8RHvBxgD6aBUWjp9WP8ma3XLYW1BNIi3pvmw9G20nXSxUWbY4bx2sf8vg4wJKyqmS9fmH3LVsnROZIP+MOQ8bg4mO8jl09e6uLt5xp3NIjBbZBU3IumnoE5Q/4mILqHF+ASkZMUjsz4wGEvF/v7Pb8ZkGMVGKZO6nYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JLjFU8Y88BhShVYWPBeh0IBYlVTMTzTZGNS/6VLnuKM=;
 b=GD9jlpMXDxJHIvS+fwKyqcbp6sBb9f88VsiWBL+VATvD9NMQI3lTsCd/GGotBMZpZt+xm26KEPZhbQXUtD4eWRt9DNkiGfnZkIedCZ9EEK788scZoK/VzXGLxiNh4tdRIp3Pzz2bXbMvHTmz9x0aTHJWJlCPqmpAS5uXn0rdGu8ArSlXoCjXxjtsfEF3XTMU/nmr/Y8NqinzgJYXIzxx5cGY69JofqiQm4+i+sEJtBADL5Di4Qqvmj0Qfwqlaz/qNbskg0Rmce6XTHzU0//5J2/3fZ7p04mitfFra9vPvd9n4HY16Dci83P498QMe+1vk9cyAP+1GcHZ5ebFKs8S+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 BY1PR11MB8125.namprd11.prod.outlook.com (2603:10b6:a03:528::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21; Fri, 29 Sep
 2023 06:09:09 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::c5ac:9134:7e53:b45c]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::c5ac:9134:7e53:b45c%7]) with mapi id 15.20.6838.024; Fri, 29 Sep 2023
 06:09:09 +0000
Message-ID: <ac98a948-ced5-16e1-4280-98d30bdf674e@intel.com>
Date: Fri, 29 Sep 2023 11:38:59 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
References: <20230926144120.334009-1-sujaritha.sundaresan@intel.com>
 <20230926144120.334009-3-sujaritha.sundaresan@intel.com>
 <ZRMVda8E+xLJbDJp@intel.com> <5325c63c-07cb-8395-e95a-25d86febe29c@intel.com>
 <b85295d5-e5c9-39de-16e4-10a10f91de0f@intel.com>
In-Reply-To: <b85295d5-e5c9-39de-16e4-10a10f91de0f@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0104.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::6) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|BY1PR11MB8125:EE_
X-MS-Office365-Filtering-Correlation-Id: e732aafe-c737-4ef2-295f-08dbc0b297d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: prm0ndbtCJA3zf5uVJAqhB5yEW0JU66l0gbQhmi9dAWIFU9WgHXb45V+dnGyiS3t0rI8ZVzDCxx9sdVA+1e2teTWvyFp31foVXLvVOK58Lhi8yIl17Isff8sc84VSeBFO602fxyKjJACGE3GEUXW8v+r63ym2qmvCWhgPib9e8kBgP+zlP4JUmGACQajlY0pLc1JgJ1QoHRuhnMVwVq6CVGXTvOPfErzIGPnThWRzIFAiTntN/HWwkE4ZF04WUrejxw8Dk2W2EAlfvb5qAaUo8eYpUE3/s88wnL5pDqxhim7aDjDIOD/8wlmMKH2KkTymh6kgC8cbWSKdJsFJDFZZPxvNgEwrT30tQx7ko2NS71RZpQSgbpBFccn9kaS6IxSzQR/wK8kM4L3NxuEmnUmSISpalExfdwxRrPcAC4uUaUHjzCui4Jken7UcxK15YDb3LVGYHPNEXvpiS+Ac2xYjubbdKxucigjCoVyzDCQHJ4dAH5+S9/+alde5OnMSsWJD7tdwCHGv4zMKuI7LCtdqMVMJZOLvFiRkbITwQKLALj1exugEBKbf8Go9zQyin/Zvpy376h4wRGGQfn9gOM8BYf1Pdi6NT/zsxbAFnHABBSQQIvKFPV40VxmCpPtTg+TYbJowl6EttVGunT7VxcA0Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(396003)(346002)(136003)(39860400002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(6486002)(107886003)(2616005)(26005)(6506007)(53546011)(6512007)(86362001)(36756003)(38100700002)(82960400001)(31696002)(83380400001)(2906002)(30864003)(8936002)(5660300002)(37006003)(6636002)(66946007)(316002)(6862004)(41300700001)(66476007)(66556008)(4326008)(8676002)(6666004)(478600001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVJHWS9iSGt2OXEyekpieWlvWlRPam5yWGExR0hVdjFMN1l5cXRlMXJ5VE1N?=
 =?utf-8?B?ZkVPVWJjSzQzZ2ZjajRCSmg0T3FzK3JlMk12RTl5VjhDUGtsOVJ4Q1M4QUFZ?=
 =?utf-8?B?ZHJYMUMzZFdoUVRLZVFtdi8xY1lWV0dtUGdvaDhYQ2w4QXdGWHpDTmRNM09Y?=
 =?utf-8?B?Mk9hait2Z2FKSWYyNnFoaG1xY3hiOWpUTWg3bEgvbDZ0WjVmekc2ZW5lSjlr?=
 =?utf-8?B?OXZHS2pROVlWUWxCcjQ0SXp4aUVqMGUwUTFMMXJqNGdhTEgybjRwR2JIcmNj?=
 =?utf-8?B?bWJpZ1RMUzluMHd1ZHBvRmdIV1cwUnZTUVpnbFdyekZBc2RpdFV6UnlmOVBi?=
 =?utf-8?B?N2NZOS9TeHR6TDFQN28wUXFYSWl5ZkpmN2x4RHliRXJiOWZNdUdFNVFtQ3lt?=
 =?utf-8?B?Qy81Y2pjSTkwNjlxellqRmJxSGU3RmhFc1F0TENtcmxmaDQzdS9yckJMb1Rh?=
 =?utf-8?B?SDlEZTZMYVFuaVNLeXRNaGdQNHRIZWc3aHI4blFhR0hSYmxMNDJSamlDNHIv?=
 =?utf-8?B?RTBTUUV2bHBlcS9CZWgzUmVoZE1nYTV0d3JMaTFVWFVkc2JhdC9QcEUxc3h2?=
 =?utf-8?B?bldXM3JqUTk5aVhzM2dzb1BTQ2tyaWVmQTBlOG05NHcvZ1Z5dXoydmFUNlRy?=
 =?utf-8?B?WnFwNVovUUNNK0hxN05DekJLaEFDVUh4dGlOY0FtK00zb0pCZ2hnSlNXeXdL?=
 =?utf-8?B?Ync1cEhmdHB2d0psN3N1OFV2ZitadFd3cjJVcHo5a25FRStWdG15clhmdVNG?=
 =?utf-8?B?SVlRTzI2SHI4YW05cytib29xUGJoL01kNFdsY2FUTnQ4SXF0TElGdkNmU3h1?=
 =?utf-8?B?U2w3V2pLU3pkUldzcnJVdVhhUTFaelhDSXZsSlRIWXBXUlA2QjZIUWtQWUkz?=
 =?utf-8?B?WHdtN3BuL3YrWVdZZHoxMzVsRDZJTnVGaFhBZkZlSFVUOVhmb1N1K1c2Nk1X?=
 =?utf-8?B?dUZqelVXVkkzcDcwSnhaTEJCWGNDdlhFWWl5OWRvYTFoWW10cHhUMitMeU5z?=
 =?utf-8?B?bGpSOTZ5WXNSYmwzMG9MbStldWlralhvY0k4NXVneG00RWRma3VMQ3RmbXA5?=
 =?utf-8?B?elFkZW5qelU1SzUvb09xU0V5eUU3N2l6b3JtakM3eGhaYXEyQzB3N0F2amlv?=
 =?utf-8?B?VUtqT3BlRE1YK2Vwc2dpTFdkdjdiN1V3UGlTQXdmM1hmY0RIRmV4SEpQdFdk?=
 =?utf-8?B?NnA5b0xPNWt4aHlJWDA1OU45d2l2b01tenFVNGxVT0Q0eUJHUExwc2Q0REVZ?=
 =?utf-8?B?NFB6QUhLaTNXK3hRM2lWMlBYSzI3QXR1QnlsT2pBVWkzWDgwMW1UcyttS2Fh?=
 =?utf-8?B?RDYwK2RJUW8yd0xqOU5WOElXeVMvUHZvQkZiSVJaajc0N2cxeFJYVWdjV3FS?=
 =?utf-8?B?WUYybmtSckduZ0F5Q3Ixb0VCNFZVNVRiWHdDSUs1dUlwWTMwU0JWUWZOdW02?=
 =?utf-8?B?emF4S29CVTI0VnBuQU51VEsxeldocml3U1o1blYvRjZnbFNxSkdnUVdZSVBu?=
 =?utf-8?B?V2RIZTdMcDh4Z0VDcEdNU1MzN1phRGtPVTlIWk02WEVzbUhpeHJzalViSFh1?=
 =?utf-8?B?MlBJZWNidi8rQ3pMV25Qcm9lTExDeWtHc2xFTm1qQTlUK0FhZmpRNWRJOHNT?=
 =?utf-8?B?SGs1aG1TYm5jSzNhSjRpMDEwd2hjZzZONmNJRm02T2lGbzZML1ZtNVVCS1Qx?=
 =?utf-8?B?RVllL0NLVHNjWTJzT1gvK3pzbUNDeHBWNXdUTERrZWl4N3QxUzl2Rm5BcXFW?=
 =?utf-8?B?LzBvUTNYTXdNNit1eFdBMXptYWZBSGw5ZFIxNldnZnB2bUFZU3F4SXhUMHNL?=
 =?utf-8?B?MXZuZ2J3Q3RocHJlRnF4YzZ3VExZbUdLa2UxMytNeERjK2JEM1Z2MUd3bjdo?=
 =?utf-8?B?eVZ5czFwMEVPQ1dKbTFjQ3kzOEVDYXRMcHJWUUQ5Sk1uNWYyMmRjTnRrWnRQ?=
 =?utf-8?B?V2dEK3BiNTNwd0JOMDFBVS81UlB5NUZVVkVSbzhPU0kyRGoxUTZRdWExWjlS?=
 =?utf-8?B?VW1keW1TNHErTHVaTU9uVGpZUVdnQjlXUWNFcm1rUG1EeFRFZDl3NFFHbHl2?=
 =?utf-8?B?SjFyV3g5bWw3WkRMUTVuc2I1RXFaYnpUMzlyU1BxZ0EzNnVteExLRXZKMzFC?=
 =?utf-8?B?M253QkplbksvQ3dsS3RlL0NrN1BWdzFpcjRmT1J4UEtaT2c0WTVxWmNKY20v?=
 =?utf-8?Q?SmjzLRgSi+L6Dhtf8yzoe2k=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e732aafe-c737-4ef2-295f-08dbc0b297d7
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 06:09:09.0695 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z+a6nPGoGKFlFmmr/lwlg8nu6jXDaSg3Zg6IHhbDN7oLkTyP3s1vN68rWukdGS6e+GUh0nJN3Mi0LEsOZdKjw41JE3Z9mlIBkDnqU0xofXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8125
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe: Add base performance and vram
 frequency sysfs attributes
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 9/29/2023 11:33 AM, Sundaresan, Sujaritha wrote:
>
> On 9/29/2023 11:09 AM, Riana Tauro wrote:
>> Hi Suja
>>
>> Could you add the folder structure in commit message
>>
>> On 9/26/2023 11:01 PM, Rodrigo Vivi wrote:
>>> On Tue, Sep 26, 2023 at 08:11:20PM +0530, Sujaritha Sundaresan wrote:
>>>> This patch adds base performace attributes as well as vram frequency
>>>> attributes.
>>>
>> %/performace/performance
> Sure will do.
>>> Is vram freq tied to the gt or tied to the tile?
>>>
>>>>
>>>> v2: Create a separate performance directory for attributes.
>>>>
>>>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/Makefile           |   1 +
>>>>   drivers/gpu/drm/xe/xe_gt_freq_sysfs.c | 218 
>>>> ++++++++++++++++++++++++++
>>>>   drivers/gpu/drm/xe/xe_gt_freq_sysfs.h |  16 ++
>>>>   drivers/gpu/drm/xe/xe_gt_sysfs.c      |   3 +
>>>>   drivers/gpu/drm/xe/xe_pcode_api.h     |  19 +++
>>>>   5 files changed, 257 insertions(+)
>>>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_freq_sysfs.c
>>>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_freq_sysfs.h
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>>> index b1681d1416eb..bdd9922d3db5 100644
>>>> --- a/drivers/gpu/drm/xe/Makefile
>>>> +++ b/drivers/gpu/drm/xe/Makefile
>>>> @@ -60,6 +60,7 @@ xe-y += xe_bb.o \
>>>>       xe_gt.o \
>>>>       xe_gt_clock.o \
>>>>       xe_gt_debugfs.o \
>>>> +    xe_gt_freq_sysfs.o \
>>>>       xe_gt_idle_sysfs.o \
>>>>       xe_gt_mcr.o \
>>>>       xe_gt_pagefault.o \
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_freq_sysfs.c 
>>>> b/drivers/gpu/drm/xe/xe_gt_freq_sysfs.c
>> There are few attributes under tile, few under gt.
>> Should this have a common name instead of gt prefix?
> Yes I'm planning on changing that. gt seems like a misnomer is this case.
>>>> new file mode 100644
>>>> index 000000000000..6017d09eeca2
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_freq_sysfs.c
>>>> @@ -0,0 +1,218 @@
>>>> +// SPDX-License-Identifier: MIT
>>>> +/*
>>>> + * Copyright © 2023 Intel Corporation
>>>> + */
>>>> +
>>>> +#include <drm/drm_managed.h>
>>>> +
>>>> +#include <regs/xe_gt_regs.h>
>>>> +#include "xe_device.h"
>>>> +#include "xe_gt.h"
>>>> +#include "xe_gt_freq_sysfs.h"
>>>> +#include "xe_gt_sysfs.h"
>>>> +#include "xe_pcode.h"
>>>> +#include "xe_pcode_api.h"
>>>> +
>>>> +#define GT_FREQUENCY_MULTIPLIER    50
>>>> +
>>>> +#define U8_8_VAL_MASK           0xffff
>>>> +#define U8_8_SCALE_TO_VALUE     "0.00390625"
>>>> +
>>>> +static ssize_t freq_factor_scale_show(struct device *dev,
>>>> +                      struct device_attribute *attr,
>>>> +                      char *buff)
>>>> +{
>>>> +    return sysfs_emit(buff, "%s\n", U8_8_SCALE_TO_VALUE);
>>>> +}
>>>> +
>>>> +static ssize_t base_freq_factor_show(struct device *dev,
>>>> +                     struct device_attribute *attr,
>>>> +                     char *buff)
>>>> +{
>>>> +    struct kobject *kobj = &dev->kobj;
>>>> +    struct xe_gt *gt = kobj_to_gt(kobj);
>>>> +    u32 val;
>>>> +    int err;
>>>> +
>>>> +    err = xe_gt_pcode_read(gt, PVC_PCODE_QOS_MULTIPLIER_GET,
>>>> +                PCODE_MBOX_DOMAIN_CHIPLET,
>>>> +                PCODE_MBOX_DOMAIN_BASE, &val);
>>>> +    if (err)
>>>> +        return err;
>>>> +
>>>> +    val &= U8_8_VAL_MASK;
>>>> +
>>>> +    return sysfs_emit(buff, "%u\n", val);
>>>> +}
>>>> +
>>>> +static ssize_t base_freq_factor_store(struct device *dev,
>>>> +                      struct device_attribute *attr,
>>>> +                      const char *buff, size_t count)
>>>> +{
>>>> +    struct kobject *kobj = &dev->kobj;
>>>> +    struct xe_gt *gt = kobj_to_gt(kobj);
>>>> +    u32 val;
>>>> +    int err;
>>>> +
>>>> +    err = kstrtou32(buff, 0, &val);
>>>> +    if (err)
>>>> +        return err;
>>>> +
>>>> +    if (val > U8_8_VAL_MASK)
>>>> +        return -EINVAL;
>>>> +
>>>> +    err = xe_gt_pcode_write(gt, PVC_PCODE_QOS_MULTIPLIER_SET,
>>>> +                PCODE_MBOX_DOMAIN_CHIPLET,
>>>> +                PCODE_MBOX_DOMAIN_BASE, val);
>>>> +    if (err)
>>>> +        return err;
>>>> +
>>>> +    return count;
>>>> +}
>>>> +
>>>> +static DEVICE_ATTR_RW(base_freq_factor);
>>>> +static struct device_attribute dev_attr_base_freq_factor_scale =
>>>> +    __ATTR(base_freq_factor.scale, 0444, freq_factor_scale_show, 
>>>> NULL);
>>>> +
>>>> +
>>>> +static ssize_t base_freq_rp0_show(struct device *dev, struct 
>>>> device_attribute *attr,
>>>> +                  char *buff)
>>>> +{
>>>> +    struct kobject *kobj = &dev->kobj;
>>>> +    struct xe_gt *gt = kobj_to_gt(kobj);
>>>> +    u32 val;
>>>> +    int err;
>>>> +
>>>> +    err = xe_gt_pcode_read(gt, XEHP_PCODE_FREQUENCY_CONFIG,
>>>> +                PCODE_MBOX_FC_SC_READ_FUSED_P0,
>>>> +                PCODE_MBOX_DOMAIN_BASE, &val);
>>>> +    if (err)
>>>> +        return err;
>>>> +
>>>> +    /* data_out - Fused P0 for domain ID in units of 50 MHz */
>>>> +    val *= GT_FREQUENCY_MULTIPLIER;
>>>> +
>>>> +    return sysfs_emit(buff, "%u\n", val);
>>>> +}
>>>> +static DEVICE_ATTR_RO(base_freq_rp0);
>>>> +
>>>> +static ssize_t base_freq_rpn_show(struct device *dev, struct 
>>>> device_attribute *attr,
>>>> +                  char *buff)
>>>> +{
>>>> +    struct kobject *kobj = &dev->kobj;
>>>> +    struct xe_gt *gt = kobj_to_gt(kobj);
>>>> +    u32 val;
>>>> +    int err;
>>>> +
>>>> +    err = xe_gt_pcode_read(gt, XEHP_PCODE_FREQUENCY_CONFIG,
>>>> +                PCODE_MBOX_FC_SC_READ_FUSED_PN,
>>>> +                PCODE_MBOX_DOMAIN_BASE, &val);
>>>> +    if (err)
>>>> +        return err;
>>>> +
>>>> +    /* data_out - Fused Pn for domain ID in units of 50 MHz */
>>>> +    val *= GT_FREQUENCY_MULTIPLIER;
>>>> +
>>>> +    return sysfs_emit(buff, "%u\n", val);
>>>> +}
>>>> +static DEVICE_ATTR_RO(base_freq_rpn);
>>>> +
>>>> +static const struct attribute *perf_power_attrs[] = {
>>>> +    &dev_attr_base_freq_factor.attr,
>>>> +    &dev_attr_base_freq_factor_scale.attr,
>>>> +    &dev_attr_base_freq_rp0.attr,
>>>> +    &dev_attr_base_freq_rpn.attr,
>>>> +    NULL
>>>> +};
>>>> +
>>>> +static ssize_t freq_vram_rp0_show(struct device *dev, struct 
>>>> device_attribute *attr,
>>>> +                  char *buff)
>>>> +{
>>>> +    struct kobject *kobj = &dev->kobj;
>>>> +    struct xe_gt *gt = kobj_to_gt(kobj);
>>>> +    u32 val;
>>>> +    int err;
>>>> +
>>>> +    err = xe_gt_pcode_read(gt, XEHP_PCODE_FREQUENCY_CONFIG,
>>>> +                PCODE_MBOX_FC_SC_READ_FUSED_P0,
>>>> +                PCODE_MBOX_DOMAIN_HBM, &val);
>>>> +    if (err)
>>>> +        return err;
>>>> +
>>>> +    /* data_out - Fused P0 for domain ID in units of 50 MHz */
>>>> +    val *= GT_FREQUENCY_MULTIPLIER;
>>>> +
>>>> +    return sysfs_emit(buff, "%u\n", val);
>>>> +}
>>>> +static DEVICE_ATTR_RO(freq_vram_rp0);
>>>> +
>>>> +static ssize_t freq_vram_rpn_show(struct device *dev, struct 
>>>> device_attribute *attr,
>>>> +                  char *buff)
>>>> +{
>>>> +    struct kobject *kobj = &dev->kobj;
>>>> +    struct xe_gt *gt = kobj_to_gt(kobj);
>>>> +    u32 val;
>>>> +    int err;
>>>> +
>>>> +    err = xe_gt_pcode_read(gt, XEHP_PCODE_FREQUENCY_CONFIG,
>>>> +                PCODE_MBOX_FC_SC_READ_FUSED_PN,
>>>> +                PCODE_MBOX_DOMAIN_HBM, &val);
>>>> +    if (err)
>>>> +        return err;
>>>> +
>>>> +    /* data_out - Fused P0 for domain ID in units of 50 MHz */
>>>> +    val *= GT_FREQUENCY_MULTIPLIER;
>>>> +
>>>> +    return sysfs_emit(buff, "%u\n", val);
>>>> +}
>>>> +static DEVICE_ATTR_RO(freq_vram_rpn);
>>>> +
>>>> +static const struct attribute *vram_freq_attrs[] = {
>>>> +    &dev_attr_freq_vram_rp0.attr,
>>>> +    &dev_attr_freq_vram_rpn.attr,
>>>> +    NULL
>>>> +};
>>>> +
>>>> +static void gt_freq_sysfs_fini(struct drm_device *drm, void *arg)
>>>> +{
>>>> +    struct kobject *kobj = arg;
>>>> +
>>>> +    sysfs_remove_files(kobj, perf_power_attrs);
>>>> +    kobject_put(kobj);
>>>> +}
>>>> +
>>>> +void xe_gt_freq_sysfs_init(struct xe_gt *gt)
>>>> +{
>>>> +    struct xe_tile *tile = gt_to_tile(gt);
>>>> +    struct xe_device *xe = gt_to_xe(gt);
>>>> +    struct kobject *kobj;
>>>> +    int err;
>>>> +
>>>> +    kobj = kobject_create_and_add("performance", gt->sysfs);
>>>> +    if (!kobj) {
>>>> +        drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, 
>>>> -ENOMEM);
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    err = sysfs_create_files(kobj, perf_power_attrs);
>>>> +    if (err) {
>>>> +        kobject_put(kobj);
>>>> +        drm_warn(&xe->drm, "failed to register performance power 
>>>> sysfs, err: %d\n", err);
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    if (xe->info.platform == XE_PVC) {
>>>> +        err = sysfs_create_files(tile->sysfs, vram_freq_attrs);
>>>> +        if (err) {
>>>> +            kobject_put(kobj);
>>>> +            drm_warn(&xe->drm, "failed to register vram freq 
>>>> sysfs, err: %d\n", err);
>>>> +            return;
>>>> +        }
>>>> +
>>>> +    }
>> I'm seeing PVC prefix for perf_power_attrs above but you have added 
>> vram_freq_attrs under pvc. Shouldn't it be the other way?
> No. technically vram is expected to work only for PVC. But I should 
> change the name for the perf attrs to an agnostic one.
Looking at it, will move base to PVC only as well. Media can be the 
agnostic one.
>>>> +
>>>> +    err = drmm_add_action_or_reset(&xe->drm, gt_freq_sysfs_fini, 
>>>> kobj);
>>>> +    if (err)
>>>> +        drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, 
>>>> err: %d\n",
>>>> +             __func__, err);
>>>> +}
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_freq_sysfs.h 
>>>> b/drivers/gpu/drm/xe/xe_gt_freq_sysfs.h
>>>> new file mode 100644
>>>> index 000000000000..7b76c4670632
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_freq_sysfs.h
>>>> @@ -0,0 +1,16 @@
>>>> +/* SPDX-License-Identifier: MIT */
>>>> +/*
>>>> + * Copyright © 2023 Intel Corporation
>>>> + */
>>>> +
>>>> +#ifndef _XE_GT_FREQ_SYSFS_H_
>>>> +#define _XE_GT_FREQ_SYSFS_H_
>>>> +
>>>> +#include <drm/drm_managed.h>
>>>> +
>>>> +#include "xe_device.h"
>>>> +#include "xe_gt.h"
>>>> +
>>>> +void xe_gt_freq_sysfs_init(struct xe_gt *gt);
>>>> +
>>>> +#endif /* _XE_GT_FREQ_SYSFS_H_ */
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c 
>>>> b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>>>> index c69d2e8a0fe1..3b6316ce10ed 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>>>> @@ -11,6 +11,7 @@
>>>>   #include <drm/drm_managed.h>
>>>>     #include "xe_gt.h"
>>>> +#include "xe_gt_freq_sysfs.h"
>>>>     static void xe_gt_sysfs_kobj_release(struct kobject *kobj)
>>>>   {
>>>> @@ -52,6 +53,8 @@ void xe_gt_sysfs_init(struct xe_gt *gt)
>>>>         gt->sysfs = &kg->base;
>>>>   +    xe_gt_freq_sysfs_init(gt);
>>>> +
>>>>       err = drmm_add_action_or_reset(&xe->drm, gt_sysfs_fini, gt);
>>>>       if (err) {
>>>>           drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, 
>>>> err: %d\n",
>>>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h 
>>>> b/drivers/gpu/drm/xe/xe_pcode_api.h
>>>> index 837ff7c71280..da4114bfaa7a 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>>>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>>>> @@ -30,6 +30,25 @@
>>>>   #define   PCODE_READ_MIN_FREQ_TABLE    0x9
>>>>   #define   PCODE_FREQ_RING_RATIO_SHIFT    16
>>>>   +#define   XEHP_PCODE_FREQUENCY_CONFIG            0x6e /* xehp, 
>>>> pvc */
>>>> +/* XEHP_PCODE_FREQUENCY_CONFIG sub-commands (param1) */
>>>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_P0        0x0
>>>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_PN        0x1
>>>> +/* PCODE_MBOX_DOMAIN_* - mailbox domain IDs */
>>>> +/* XEHP_PCODE_FREQUENCY_CONFIG param2 */
>>>> +#define     PCODE_MBOX_DOMAIN_NONE            0x0
>>>> +#define     PCODE_MBOX_DOMAIN_GT            0x1
>>>> +#define     PCODE_MBOX_DOMAIN_HBM            0x2
>>>> +#define     PCODE_MBOX_DOMAIN_MEDIAFF            0x3
>>>> +#define     PCODE_MBOX_DOMAIN_MEDIA_SAMPLER        0x4
>>>> +#define     PCODE_MBOX_DOMAIN_SYSTOLIC_ARRAY        0x5
>>>> +#define     PCODE_MBOX_DOMAIN_CHIPLET            0x6
>>>> +#define     PCODE_MBOX_DOMAIN_BASE_CHIPLET_LINK        0x7
>>>> +#define     PCODE_MBOX_DOMAIN_BASE            0x8
>>>> +#define   PVC_PCODE_QOS_MULTIPLIER_SET            0x67
>> Add only the mailboxes that are being used.
>>
>> Thanks
>> Riana Tauro
> Sure.
>>>> +/* See PCODE_MBOX_DOMAIN_* - mailbox domain IDs - param1 and 2 */
>>>> +#define   PVC_PCODE_QOS_MULTIPLIER_GET            0x66
>>>> +
>>>>   /* PCODE Init */
>>>>   #define   DGFX_PCODE_STATUS        0x7E
>>>>   #define     DGFX_GET_INIT_STATUS    0x0
>>>> -- 
>>>> 2.25.1
>>>>
