Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C657FC0015E
	for <intel-xe@archiver.kernel.org>; Sat, 12 Aug 2023 00:30:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9288210E153;
	Sat, 12 Aug 2023 00:30:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5DC210E138
 for <intel-xe@lists.freedesktop.org>; Sat, 12 Aug 2023 00:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691800239; x=1723336239;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=al6FX5u1/K8a19OBtwcq77NpL8QUYUP2+pAwCEheDdI=;
 b=Xt2WhwKN/gro8KhqsrhhKTVT3mEQeAjFRCcmxuES3nv6Q3IjFj5LO8IZ
 dXb5gq15YreBi11+gO3IiNg04XzLzZRw4QdxyJYbyOYObjgzqsaUinxm3
 0nIIDgDPooxSf8Qu3uKTYdDGECB8Q24vlC2eALGT926MWJYjpWlKapfwX
 P8VSyoZD2QlEOvOQY7uMcF2ZHy/M83/7GB+KqjHUAKJdxjltMPzwmMqUj
 3r1guQqgzsGePoL3ai74mj+6TWSxijiON6ql4bYrIMuPBoBIsEVsoUW1G
 h8HRfCOSrTBVvA+bD3Mhrz+94YEAT6quXCdGACfDOC5hmLlMaEdVOfjeY g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="402768281"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="402768281"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 17:30:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="709703116"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="709703116"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 11 Aug 2023 17:30:38 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 11 Aug 2023 17:30:38 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 11 Aug 2023 17:30:38 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 11 Aug 2023 17:30:38 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 11 Aug 2023 17:30:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mkekoUEIFj2eGM4a3rCKdT0nWkKqHNFIaPgLs90oeeJ5PQZJNBstkZZm+hUl6mHN2kk8S7x1MQ5Ub+QC6v5ta27qh2PezpH3t5c8hAu/TjDfH79Q5/61GgnZb1cFcWsjI8XsY2bNrViAscRN6wDP/5TK17P625K+fdVOUAIVIse4BaZhNKZRADBUyoM/w/KK5dWGe1jhJeW6+y7zuV5JRYxBtESwHWJwAGj5rj+UuIwsqoHg90+PgbQ03nJylIURZEViXDhW2VXksHSPMjt0xCTYOk+U+zcpguXoj6QubwBAmPztIpRpjTCitEUD1OOxSaIDcXS3Ll3r/sZTiA1wOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wjg0wOrpiTUj0QJKEKoy5j8IVBMoTrdODh16n14lo9U=;
 b=n821EsgfteVhk1Pgn4EJYRKCv7zEQvpwNtqG+ZQCQbNojWwpG2lwycKjL57coe0wswjlB7WO2qm4p5/VX0K/Ff4Ae9pf89zA5gVP1pvM/Aji0K85S12nwDUxK1EBMkOOhGa9EQ2MtT5OmXFpYVGynJheABCSY8y4KhLLQJ6lAP75cyjYPuQOECyrbIduj1iwtlW8EyYIUXbvSfR3pETqsnL48GlyO6CapBSS7Cd5YYr03bYsLrDRrwKeSr6JT/U9sCtGLdlIlQxOhzn0syPSpe6Wt2aKkkP/reeGPQTgu7xNudRJrdKB7P7C+Ps5V/A3EHbH5xFvalj5AgpConPn9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 DM4PR11MB6067.namprd11.prod.outlook.com (2603:10b6:8:63::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6652.30; Sat, 12 Aug 2023 00:30:30 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::439e:63f:b4f:f27e]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::439e:63f:b4f:f27e%4]) with mapi id 15.20.6652.029; Sat, 12 Aug 2023
 00:30:30 +0000
Date: Fri, 11 Aug 2023 17:30:18 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Message-ID: <ZNbSmrA4flUumeLg@orsosgc001.jf.intel.com>
References: <20230804213253.2381705-1-umesh.nerlige.ramappa@intel.com>
 <20230804213253.2381705-4-umesh.nerlige.ramappa@intel.com>
 <ZM1yD7udZeX7lg1l@orsosgc001.jf.intel.com>
 <87v8dlyx2n.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <87v8dlyx2n.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BY5PR13CA0014.namprd13.prod.outlook.com
 (2603:10b6:a03:180::27) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|DM4PR11MB6067:EE_
X-MS-Office365-Filtering-Correlation-Id: 95f82f35-306c-4953-cbe1-08db9acb5538
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yapoUnsfeTqgjUIlyd4LW0ma4o/rMHHwyJhtiOV46a15FRhNja6VU42c9npD77aNxSyibZxW/eRYwhZUypIbrI5rgC+kyByuvEMwcHzcKIG2V7BJ9kxwxi7ihBfqKX4r9uKzc9jLhCkpIvrujnOhuIDsua+syso1rD6TstS8IB9fnajfENpJLpQKOIwCJyGaUetau/No3EGgZNlbTS7AYjB9colRJItuN4GFPqyAQehlf+vDT/ws5tNX4LHcmv00MhrS+6aP9TgWCGRttU5ajAV9p6xksCC/utZi32go9VCjv7I46O1vlt05rl47KLg+QqRAHQbeSOKCrm6plNwmbfmFg3HHCCZTo8Gj8QExSyBkmjVyOH/nZ9Hyr55TPOOhOwC/8AnpJY5gk5cK0dgwFNQjgfw4V5L8PNAJLNlVTkQF+E2yPV8oCjKCeaLwwi/CYulx+MWYWp1G0hYi5qZrj0jBcI7yU5CsraatSgfmGe1gBJqkakeL9UA63oAwcDh3AONpMmt8qxWxERUVFA6fgv0hsvQQIkfwGzjup4wWRTEZVDPvyJsAm9nw0mRGw8Cz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(376002)(136003)(366004)(346002)(451199021)(1800799006)(186006)(86362001)(38100700002)(82960400001)(6666004)(6486002)(478600001)(5660300002)(6506007)(41300700001)(26005)(6512007)(8676002)(2906002)(66476007)(8936002)(66556008)(316002)(6636002)(4326008)(66946007)(6862004)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjhRaGxrOEF5c2U5WjdXOEV1dmw0Rlc1dk1wK3dJRWEzMEgxK2tUYlFXRjJ4?=
 =?utf-8?B?bjlpQUs5YU4yNW8rbHJtakJEQ1hLNm5lanlrdVZNQ3hZQlJlbERZc0MzL0Y4?=
 =?utf-8?B?SVVnMnVzREJwa0ZFQ2czN2lPMDF1VEFkeFlUNDR3cVdhWXhlYzVEWi9HN1Jq?=
 =?utf-8?B?UC9oZXUwWThtQ1dXay9nTUhETWJsaklaUVZvZlNjU0tBWmgzZWI0cSs4em1J?=
 =?utf-8?B?aDRxTUd3N2QwbzFib2hEWW1jY2hwU092T0hOaEZvRUQxRmxJQi9xN0xiMUg0?=
 =?utf-8?B?aVRvdWxzdzUyUWhBUUxBeitReE5VMjBTeVY0ZzZ2bi9BT3BjVzJXMVp3MUNs?=
 =?utf-8?B?ZlRvYk9VV0N0YTF0Z2pUSCt5WjUyL1lhR0FoMHlWbUoyUlplank1Z01RNGVH?=
 =?utf-8?B?R2RLY044djNvNlhzTXZiS1FnWUVrZFh4b0hHUkREUG1tNit3OGJmK0VtRmFa?=
 =?utf-8?B?TkNrZlQzWFBzTFR1b0tVYkw1MytXa1dkdzhTMnpCT1NUNjdkR091MG0rWlNZ?=
 =?utf-8?B?dDZjaE56OFJTZ2ZOOSs1SnRNWC9CNU4wZHRSVHEzbUc1RWJ3bFpVaTIzYm5h?=
 =?utf-8?B?ZklrUzZJNE1NRjJkbWhYV1NKM3kzbnBCOGYwQ1hpMTNXZFlMWHAwTDVjMzlQ?=
 =?utf-8?B?UkRSQ2NkaXNKa0duRUJ4T1JGOEpjMGUvNUg2UVloOEJsVW5GOGZOS0UrVW9a?=
 =?utf-8?B?emsvYmJMcGN0dHA4SlFKTkluVjZNVDNxRUFXK1pTa1VObldXY2tEYkM0WW1i?=
 =?utf-8?B?MDQwcW4yeSt6d0JjRHFkSzJyeTBsOFZHVzFsbXNQdGxJVEZpQ3NlRDN4ZkVT?=
 =?utf-8?B?NFFYRnV0b0duVllWUVJ2a1VBRkxmS3FCbE9YTUlkUXR1dTNRemFsSkhEN3Z3?=
 =?utf-8?B?WXFXNWZydDFjMWJaN05oVjFValo0Z1ZYNjc0a21qS2o2OExmQjM2T3F4SDNN?=
 =?utf-8?B?c0o5T2xDVFo1bjl2SldJK0RTalN5ZXg4bUtKb05wKzJxYWNrZjE2L3Bya2po?=
 =?utf-8?B?UWMrNk1rYmR3cVI1eWJ6TEx5TVAwVGJZMzh5MEZCZ0d4VTY3dDhHVlFPTlQx?=
 =?utf-8?B?TnBlRkVYTnFnM2drZE5zc1lKRW0zRFJkQ08rZWRWS0NIMzMxcExhNGkreGh0?=
 =?utf-8?B?SHBIUzZFZE9qQXd5MndkUEt2NmMzMFpvTEVhcWpMdFUwNEswRXFJSHB0QlND?=
 =?utf-8?B?dUM4TW9VbU5wZ2xvMDRSWmRkUWpONUljMkMrZjdBbFNBNGtMSE1WRkd1Q3Fn?=
 =?utf-8?B?dFZqalRQbkJWeVVyNE5SVkdZNkVNWDdNRnZwYkppanpEcklUZHFhYkRSTmx1?=
 =?utf-8?B?QTFvQzNYZ2xTTmpHQVV3OVhYOTJaZUQwRHJKMVljWmZnbXZzeDJoSmVSQ2Ey?=
 =?utf-8?B?eWJMZGJDMEptQ2VvQ0VaZ1VoNlRTM3dtSnNWdHJ0dzB4WXNvQWFCV2hZZU1m?=
 =?utf-8?B?c2ZxZ3IwVEk1cVFHTnNBV2QybFlhRWpzOFZzamZuWENhL2szN3VHekpHQ1NF?=
 =?utf-8?B?MEJOT3JFenVaQkt6bks5dzBZK1RRZ3ZnRnNsVnhEVEIrc0YyQWdVRWV6ckkx?=
 =?utf-8?B?K3lsZG43bzl1Q3gvWno0V2FJS01aMkhRRUdEVDBUQi9VWk5HSStnR1BUM2Za?=
 =?utf-8?B?ZmwyWWJ1bVh0d2djTDYzZHBvb3JnRmtjVUcvblg0eUh0V3JRQno4YldHcWwr?=
 =?utf-8?B?TWpOT3gvK0s0amhhZ1YzODUxeDREdElGWkhBUUFDbGJBWkFLUFh3WGdzNlVz?=
 =?utf-8?B?SURoRVZNVlVYK0ZGVno4dDlrZHZBQVBHWVBYeDlzM0M3eGVHYmR0bkx2WEtu?=
 =?utf-8?B?MitMVGgvNjUxV3NocFZmZXNMejNTTldYS3hsUUlpVEExQ0hNbXZvYlZlUDZm?=
 =?utf-8?B?QmVvSitSUTB5K0x2aUNmczZha21sbS80QjJCUjRkRXhHbysvRGtOdFBHRy93?=
 =?utf-8?B?V0l0NmY2WVNsaG1JY24zMXJXaCtHakhwMFVFRTRSaCtxZ0RRbzhHMUs4RmxF?=
 =?utf-8?B?WFppdGxIa1JLT3BrcStFQmQ3blFKZ2h2M2tLSjN5bm81YXd6NkNwamdMUFBz?=
 =?utf-8?B?Y212L3dnb1Q4L3gyZGxGL1V5NGM3Z2lJZ3lVY3dxVlU0d1VnVmQ2WllRcUtD?=
 =?utf-8?B?Q2VjOHNBMTJZQzRWb3JmYkhzanBUeCtjdVgwZE1uWTN1OEJPMmFud2lMNzRo?=
 =?utf-8?Q?ITQkVkWWVH7PgOFQIxS3LJI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 95f82f35-306c-4953-cbe1-08db9acb5538
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2023 00:30:30.7172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5/rt/LN5ciXrpmvFdQaG4suahw64zz2Oe7XzV99nLVHrIo0l4pXTR0QOluzIgoUscT14WXQBWkGEC/lymW8nNytBCF1oAKAXehSqQFbqd+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6067
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: Correlate engine and cpu
 timestamps with better accuracy
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
Cc: Lionel G Landwerlin <lionel.g.landwerlin@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Aug 11, 2023 at 04:32:32PM -0700, Dixit, Ashutosh wrote:
>On Fri, 04 Aug 2023 14:47:59 -0700, Umesh Nerlige Ramappa wrote:
>>
>
>Hi Umesh,
>
>> On Fri, Aug 04, 2023 at 02:32:53PM -0700, Umesh Nerlige Ramappa wrote:
>> > +/**
>> > + * struct drm_xe_query_cs_cycles - correlate CPU and GPU timestamps
>> > + *
>> > + * If a query is made with a struct drm_xe_device_query where .query
>> > + * is equal to DRM_XE_QUERY_CS_CYCLES, then the reply uses
>> > + * struct drm_xe_query_cs_cycles in .data.
>> > + *
>> > + * struct drm_xe_query_cs_cycles is allocated by the user and .data points to
>> > + * this allocated structure. The user must pass .eci and .clockid as inputs to
>> > + * this query. eci determines the engine and tile info required to fetch the
>> > + * relevant GPU timestamp. clockid is used to return the specific CPU
>> > + * timestamp.
>> > + *
>> > + * The query returns the command streamer cycles and the frequency that can
>> > + * be used to calculate the command streamer timestamp. In addition the
>> > + * query returns a set of cpu timestamps that indicate when the command
>> > + * streamer cycle count was captured.
>> > + */
>> > +struct drm_xe_query_cs_cycles {
>> > +	/** Engine for which command streamer cycles is queried. */
>> > +	struct drm_xe_engine_class_instance eci;
>> > +
>> > +	/** MBZ (pad eci to 64 bit) */
>> > +	__u16 rsvd;
>>
>> I need some inputs on the rsvd field here. Looks like struct
>> drm_xe_engine_class_instance may need padding (64 bit aligned) if used this
>> way.  Is this the right way to pad it? Should the padding be moved to
>> struct drm_xe_engine_class_instance? OR should struct
>> drm_xe_engine_class_instance be packed?
>
>Does it need to be 64 bit aligned? The next field can be an unaligned u64
>field, it should be ok, x86 at least should be able to handle it.

Then compiler would potentially insert a pad between eci and the next 
u64. The idea is to avoid an uninitialized padding.

>
>But yes, nice to have all struct's 64 bit aligned. IMO the right way to do
>it would be to pad 'struct drm_xe_engine_class_instance' to be 64 bit
>aligned. Because if 'struct drm_xe_engine_class_instance' changes, the
>above '__u16 rsvd' field might not work and is error prone and will also
>need to be modified. So better to pad 'struct drm_xe_engine_class_instance'
>to be 64 bit aligned.

Agree, padding drm_xe_engine_class_instance makes sense.

Thanks,
Umesh

>
>Thanks.
>--
>Ashutosh
>
>
>>
>> > +
>> > +	/**
>> > +	 * Command streamer cycles as read from the command streamer
>> > +	 * register at 0x358 offset.
>> > +	 */
>> > +	__u64 cs_cycles;
>> > +
>> > +	/** Frequency of the cs cycles in Hz. */
>> > +	__u64 cs_frequency;
>> > +
>> > +	/**
>> > +	 * CPU timestamp in ns. The timestamp is captured before reading the
>> > +	 * cs_cycles register using the reference clockid set by the user.
>> > +	 */
>> > +	__u64 cpu_timestamp;
>> > +
>> > +	/**
>> > +	 * Time delta in ns captured around reading the lower dword of the
>> > +	 * cs_cycles register.
>> > +	 */
>> > +	__u64 cpu_delta;
>> > +
>> > +	/**
>> > +	 * Reference clock id for CPU timestamp. For definition, see
>> > +	 * clock_gettime(2) and perf_event_open(2). Supported clock ids are
>> > +	 * CLOCK_MONOTONIC, CLOCK_MONOTONIC_RAW, CLOCK_REALTIME, CLOCK_BOOTTIME,
>> > +	 * CLOCK_TAI.
>> > +	 */
>> > +	__s32 clockid;
>> > +
>> > +	/** Width of the cs cycle counter in bits. */
>> > +	__u32 width;
>> > +};
>> > +
>> > /**
>> >  * struct drm_xe_query_mem_usage - describe memory regions and usage
>> >  *
>> > @@ -395,6 +471,7 @@ struct drm_xe_device_query {
>> > #define DRM_XE_DEVICE_QUERY_GTS		3
>> > #define DRM_XE_DEVICE_QUERY_HWCONFIG	4
>> > #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY	5
>> > +#define DRM_XE_QUERY_CS_CYCLES		6
>> >	/** @query: The type of data to query */
>> >	__u32 query;
>> >
>> > @@ -737,24 +814,6 @@ struct drm_xe_exec_queue_set_property {
>> >	__u64 reserved[2];
>> > };
>> >
>> > -/** struct drm_xe_engine_class_instance - instance of an engine class */
>> > -struct drm_xe_engine_class_instance {
>> > -#define DRM_XE_ENGINE_CLASS_RENDER		0
>> > -#define DRM_XE_ENGINE_CLASS_COPY		1
>> > -#define DRM_XE_ENGINE_CLASS_VIDEO_DECODE	2
>> > -#define DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE	3
>> > -#define DRM_XE_ENGINE_CLASS_COMPUTE		4
>> > -	/*
>> > -	 * Kernel only class (not actual hardware engine class). Used for
>> > -	 * creating ordered queues of VM bind operations.
>> > -	 */
>> > -#define DRM_XE_ENGINE_CLASS_VM_BIND		5
>> > -	__u16 engine_class;
>> > -
>> > -	__u16 engine_instance;
>> > -	__u16 gt_id;
>> > -};
>> > -
>> > struct drm_xe_exec_queue_create {
>> > #define XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY               0
>> >	/** @extensions: Pointer to the first extension struct, if any */
>> > --
>> > 2.38.1
>> >
