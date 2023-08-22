Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55046EE49A3
	for <intel-xe@archiver.kernel.org>; Tue, 22 Aug 2023 05:00:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AB1210E2E2;
	Tue, 22 Aug 2023 05:00:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C101310E14E
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Aug 2023 05:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692680411; x=1724216411;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=MdKJdO9wUv/CqFvavVxjqT/bquO7yYCjslBJAso6SnU=;
 b=Z6EiFpJAbA9cWNu9rqv0eIY+LvgFvCZT0Sn1dlpy9hga4qauzZ0VyTu+
 JS7l0L4l35KY/Gi8zOjS5eiE1mQ2GMhR5SAvpLInxxQFM/aeKPj4cgdOm
 RsQfch1xJBAwTRe6T6dMw1FyB7QXg9C3XFyWbcvCdklnKernfZUo+WQu5
 iFQ7xcQU7YwjYv2eDA4q4MSXK4fp+SIwyCeW465o4+BGlY3vXM/ha2bnc
 VcpIhxsHL2rQXKCYuaAq8lTIMTEwi65pTdRXj0hy/i9fq7mZoosxOyCbx
 +qvLNJ0tbWfvnNl+2gqZCfMUmAw3jAZm6/+h3i9NEROTby1JnMxWkibcZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="371206172"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; d="scan'208";a="371206172"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 22:00:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="771222562"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; d="scan'208";a="771222562"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 21 Aug 2023 22:00:10 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 22:00:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 22:00:09 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 21 Aug 2023 22:00:09 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 21 Aug 2023 22:00:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L1TaW1Z9ruFKCwS59W4frjuXUDyqvv4TQt3wXvZd9DWQpybgVdO0lud7d4fWDSRMFdkwZIJuyVVYuIFT6OnLXbx40oosSLzp93TpR0v7hxrqmePQvfC9fmHowMhaB0B8lVBBqdKnBTSjQxGT76/ZXpUlISjZfKBT2ipq9sOqBjFhGZarxsdIZyH2+RQKRFOdP4tkkn5LdmtVBBrBAlJkvKMkqT16AM9SUO7oE5/QhEczrbVW/CvLsXitHr6vYKJkRT3ZVh18MCsoaZ+JkdEVe3FyzVyihl+yIwoe/7hyhfd5S1UCcTznRxxtIkixYVnQM538HjcHCsIzyfo+1+P8iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p1AUwJpeu3Ix9/kn2ZLO4+2ntovzwsUk2DG0Ku/CFyI=;
 b=ZKCSU0JRVYeA9lEwpbgEHkUreqHAkU/foVU/MFZr2C0BgxQBJfhROn9SIz/V2m/fNvL1n6JRbZ9mF6L5kHRz07BSbKHPDslB8pk0gJOHWhaysh4W3Yn0te79f71XFRZwXWdRuRmju8wFv+gIWpFZqyk+k2UV0nU8H3YmCOWnvomy9Tedy7460SuJz1mzCABvIDZrbv/DRaJMxm/2RGb489sxSmIIJOIPHlEgVVm4NS7yl6RpCAW5uwCtrsPZDgPNnrV+nj4Js1JVyhflNS7dwPI1RkHLYN2fx+v/FSuyhOe6vC2tyMn0Mpg/7vbpl5hE6oHIhyefg/BqFaP6wyk3eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 CH3PR11MB7769.namprd11.prod.outlook.com (2603:10b6:610:123::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 05:00:05 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::3382:a13a:ef37:f584]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::3382:a13a:ef37:f584%5]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 05:00:05 +0000
Message-ID: <c131b308-72ec-70cd-cf3c-b44f9255cc7e@intel.com>
Date: Tue, 22 Aug 2023 10:29:54 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20230821120728.3871527-1-sujaritha.sundaresan@intel.com>
 <CY5PR11MB62112CF2D7047C7BBC7232F5951EA@CY5PR11MB6211.namprd11.prod.outlook.com>
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <CY5PR11MB62112CF2D7047C7BBC7232F5951EA@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0153.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::18) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|CH3PR11MB7769:EE_
X-MS-Office365-Filtering-Correlation-Id: cefbeaef-a128-4f82-9522-08dba2cca5f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hd9fziX3AIsSgOffcKmmC5fO/n4be4AIZ78mAYh7D/eS42ZECOx96w8EChnxaMNkTH9WYyULCoYkHkBYjyFXNF7dksw4K7UX5Yn/4i2m2pwPRRUOtWKr0aaRA91ALsC6/NSU4MVKVXuBQgS9Tc8/vP9oxByfCjkltXW9XcG57p5dcq9sqD/cbe7O6FvWjHUi+9FuBcYQAhzozR+2uuZBnzCcmUFXoUP3IJEib/bJ3b7jhCeLOmEvbJJRdobB863VewN/vZIpKIrflkthoQfNcN9zul5yViGk5yvXWMFLW+uCcTjvoRFsgLmeASTwz3JRTDtzoTj2NJMemY5BQgWe/UzyynJU4kTfAVuC9kUog3in+90A6n1z+sC3/c6T+Pl6xUK9MT8Tj3WeySnYst+Los0dnUosyLuRXqmvFPZEwg6H5mRy9vyR1mO8B+H36/3nHvraLg/g/JF6n5/yC5AWCuqPZTwtCCyAtTZahAqeYoezyynqxGfz8VuAisBLPigTEKNh8KgTSOqUT1UuJJczXFW5HkvqUbh21T0Lgi0TnTkvXWw0nbtzr5E5efpI5tRVwRDXPSYmEpu7h4l9TuapcqYajjJyOyhlTbSGx0qe5Bw5ZyO6QzUTjaOdTrf6KFJ0rZVfER9IdjTBLjY8NWDeWQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(376002)(136003)(396003)(39860400002)(451199024)(1800799009)(186009)(2906002)(53546011)(38100700002)(6486002)(6506007)(83380400001)(5660300002)(26005)(86362001)(31686004)(31696002)(8676002)(2616005)(8936002)(316002)(66946007)(6512007)(66556008)(66476007)(110136005)(82960400001)(478600001)(6666004)(36756003)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjBTZWp5RWdBa2lDVWtjSTdrNDVFVndqbkJhNVJoeG5NWXNMRE9YTjNmT2dl?=
 =?utf-8?B?V05UeWhyTDdUOSszNk1oUURjcm9Ud3JmaXJxOTJ6enBJYnMvRkEvanU2WGl3?=
 =?utf-8?B?MVkwVnQwaEJXMXY2ZmdhUmpmWG9oeTRTVHIwTmNvQVd1M1JrNm1BSUxxdUk1?=
 =?utf-8?B?b3VqMGIycXZIRFlzU3VFRWFXdXhwc2NsTDZjWkNoZGVMOENrMjVEMkVXTFlG?=
 =?utf-8?B?TU5TdTF1Q0dSS3k1ZFB6OE4yV1R4L2RpOHMxamFmdzZxRFZIbjR0T1U2Vk9t?=
 =?utf-8?B?OHR0UlpDYUp6K3JlRlZTNlR4OElxTjBHZHFuMndmZHdhMGc5L0FId0FkZFlF?=
 =?utf-8?B?TGI1UnlMNTFBcU43QU5USVVHcFcvUUZpTlNVM3JMN3dPSFRlaGU1RzVERzNz?=
 =?utf-8?B?dFhrRFpLTUxmNVNpeURKcFlDSGZFYlZVbTd2WlFDUVNMTzFoSXRrMUFFaks4?=
 =?utf-8?B?ckYybFU3bUFmOEo4cFN1SklDZHl4WWI1LzFkZmJJVWU5UVRjS3ZpNmdYb2FF?=
 =?utf-8?B?QW43SjBITVA2WFptSEVQeWhNNFNDSVQ5c1RmYk5IMllGK09rd3gwQyszRDB1?=
 =?utf-8?B?TXVLL01nb00xblhNazVadm1MU1ZzalpMeVRJUnBsUXdlcDRSbnVJU2MyUUdy?=
 =?utf-8?B?ZGtrNlVQMTd0M2VHUUYveXZ3d1pMdjJFaC9FY3hPTTJXYjdOZmlhbXo1RTVQ?=
 =?utf-8?B?eHQ1NFdSNU92dlFzWDh2NTJXRU9mQ1lXQ1hrUWxtWVY0ZlJnOHZNNUNaNzFF?=
 =?utf-8?B?TlpDeGZhMi84U2dDRHg0MGJqaDNDdkZtTCtCTVVONVovcWV4aTlsbzNXYnJZ?=
 =?utf-8?B?amVFSk9qZ1I5UERJbmNtV0JwSGt1WnRFU1c2TkZVd21iL3lGcmYvSkhxb2tx?=
 =?utf-8?B?ZVlVeHB6TWo1Y1RUSXQzYUx0Y2pDSHo2d2Q3WVozSS9rcUk1VUd5WmJIeWJC?=
 =?utf-8?B?R0tZQ0dxVytaZ3ovdXh1YnQvcGxiczlyc21oMmpkSjA0TERYekRYL3FMUTY0?=
 =?utf-8?B?QjcrMktuSmRBQ1N4akhPTTA5SEJ2QjQ1ZHUvaFhBVkw5R3RXZE9BcW4xZSt1?=
 =?utf-8?B?MEFrMkRMMVNKdzFZNHByc0wrWWdmUko1RzdwVXZRZEcyaU41Slc0Nm5McUtG?=
 =?utf-8?B?Q2IxTlJEZnRLMkgwWGdaZWpwSnJuVU5oRHEzeithY1NoYTRPd0xLZ0NyZkZY?=
 =?utf-8?B?cFVlb3ZHdWNBWXMzU2NkL21OcGM5ZW1oMHRGbms2TGpNeGhWK2YxejU3T2RT?=
 =?utf-8?B?UjYvdVFhdnVnRVZ2a1oreFRKN3V3RGJ0RnFlMGFoZE5hWlVndlQ2d1lXdUZU?=
 =?utf-8?B?MVRUOWRrTDJOUUtoYVB5eVFsUWdsRTJ0bXpUenJ0eEJmYjU2NWE1TkNlK3o2?=
 =?utf-8?B?MjBXSXEwbElHUm9CWU13OVdnRTk1L2w4a1ZEV2crZDk5YlMzTGZNT290WHJB?=
 =?utf-8?B?aUdLVlo2alM4R1o0TnBMUXdJWjY4TE1tWnBwb3JKUElVYUo2ZnNHQWJsNmNY?=
 =?utf-8?B?d1BTYVo0Rkkrd0h2Nk5EY05CUzYrWHloellQUVNZQU9yay9rWW9vM3pIVEZB?=
 =?utf-8?B?M3V1Z24wS2VIVVNEbGNOT3dHUzFqUnBnYXBLc05qTElkK0VYZDJiSjQrSmFx?=
 =?utf-8?B?RWdaSndaL0liRVhIVzhBcndXWVRvVWdvbnVISWVIM3JFK0swM0xuZFV5TWlR?=
 =?utf-8?B?QnZ2RmlTRzJjOWFaSHg0UTNtbVhTSnk4TW9jL1JZT1FCM2QrTFRiTmwzd3Zq?=
 =?utf-8?B?RFAxUHprQmJTSXkzS3VNbWNZN2RKWkp5K3ptNHVCUGp1NHZDdEJKcHpNbEZn?=
 =?utf-8?B?aFRYRnhqMnZKTjh5TGJxM2Vvb3U2U1lmMm9QMjZ5TFcxVXVRMnhjUFdwellE?=
 =?utf-8?B?R1pxMGFvck4wdTBqWG9TRktWNDFRMEkwdHh1eVhscEUzdDRJdk5BZVpOS2JS?=
 =?utf-8?B?VDZOTWNaQ3ZiUmVCVjk5TGpsZjFlZGFHRFJDL3ZnRG0yVEVsTkI4NDdXSFdC?=
 =?utf-8?B?QVAvS0VpUHNGZmJQT3NQSWVxUjFsVlRzcjRjSlBySHJKRVRmZFVpTGVVWEg2?=
 =?utf-8?B?R2NnVWlmcDFJM2s4MGZPWElyOWdNRTZUNXpXbkdTc0pRZThTdDVjVTRFOFlo?=
 =?utf-8?B?QVpJampKY1NCNGRiS2l4UG5KVnFIZmpMRXRJYStsOUZDUThCVDRIcXVoejlj?=
 =?utf-8?Q?iNbKGNCS/LhBw7EUJaNB8lQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cefbeaef-a128-4f82-9522-08dba2cca5f6
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 05:00:04.8118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vfgzpaZJLR7EXkiEd220dzDPXOFMUaPZB0eD9+qh/Hi1XimJgAtoCsqG+7/4HVK7RjaqKYMQMUj3bn9qNYTtbGofrPwR3zkayPdIu9ofHYE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7769
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC][PATCH 0/2] Add vram frequency sysfs attributes
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


On 8/21/2023 6:39 PM, Gupta, Anshuman wrote:
>
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
>> Sujaritha Sundaresan
>> Sent: Monday, August 21, 2023 5:37 PM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
>> Subject: [Intel-xe] [RFC][PATCH 0/2] Add vram frequency sysfs attributes
>>
>> Adding vram frequency sysfs along with pcode helpers required
> Why this series is partially RFC ?
> Thanks,
> Anshuman Gupta.
Not sure what happened there. It wasn't intended to be RFC. Will fix it 
in the next revision.
>> Sujaritha Sundaresan (2):
>>    drm/xe: Add a couple of pcode helpers
>>    drm/xe: Sysfs entries to query vram fused min, max frequency
>>
>>   drivers/gpu/drm/xe/xe_guc_pc.c    | 55
>> +++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_pcode.c     | 28 ++++++++++++++++
>>   drivers/gpu/drm/xe/xe_pcode.h     |  3 ++
>>   drivers/gpu/drm/xe/xe_pcode_api.h |  8 +++++
>>   4 files changed, 94 insertions(+)
>>
>> --
>> 2.25.1
