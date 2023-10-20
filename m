Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1441ECDB47E
	for <intel-xe@archiver.kernel.org>; Fri, 20 Oct 2023 07:52:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB3C10E58F;
	Fri, 20 Oct 2023 07:52:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F0C882D0
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Oct 2023 07:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697788339; x=1729324339;
 h=message-id:date:subject:from:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=3FepqNmQMfXl1LemtoHExnck72nn2YFZbYsg6auZ6fk=;
 b=AXwLpxXvCDmDNC06mJwm0A94N6me7MM417hSgHMnQLkFSdbDh7UvA9b4
 oxMugJKkFIgHJ65OdkFEXBHznr8sDHjSA8usLEgZvvk/Z96B6dMWMFHX3
 Deezac5XhPiI4PliRRd2xOGqP6L86mmHmUKnvoou9xZVzC3YQA91gQ8FE
 IYJnBV0H3YE/wfzbXw2NHPp+nwlcksdlMt3uKsrKaaiFc7PmX7csIPkEc
 jYNd8DUkMip5F54TanhqBeVrbRcz3R0uCLzHCw7wDhnMruUfwP7rLx3Bw
 GeSFyyNakFgy5jgTvjl9IVw31eFWSfzJDNNntrY0AiMJMqA9L9/T82CK8 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="8015464"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="8015464"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 00:52:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="5305528"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Oct 2023 00:52:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 20 Oct 2023 00:52:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 20 Oct 2023 00:52:09 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 20 Oct 2023 00:52:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k4nnkimYbsYP5GmBYNOEWNfKrUkbqiRi//wTbSBdN+s+KH79SKegnlEXad1e7nx90B8MjjOYUO3wgzh1dgtOlGC++52XMt95JYvpNExiyLjtX64S1pbE1KMb5BHjkupZVFrYG+F4HPjZpA/x8E2PUyv+xF59wohcUZkQB1G7O5D8RwR6gMoAyKDaD13LcUvIHxkzOMAFRxY3OZZHU9PDrEp289m6NIcTMEJ4TPiziAZdEw/okHWf2Wd/FkwzIYFbzsd1n+68gOE84ALtEC63iLUvUgMUNoAyOwEXGfpbJ2acIlCbg41J5xw2H3NXc/3EZZjbb/BWEcFefGOd63E4DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oqPOJxMOK3ciy0okylmLUdkUkkMWXuSvncmho8wgY7c=;
 b=McMHC9+tPp4Hfm1+orMi0J3m9c2ZVefOZT0jY/TzP1XhPs/tFbEejBaunW46rEXd9cFjnwQGigGkEjysJyZT+uDK+WkGatjk0ZlNmKLaWhxzKwttR+4ViWLma03668KW0Uu1Mjfnl05UTGdm6KG8cgKCIjSNM48RXGAvciRjVsgrFUptA9D2Wk0GmvW78Ulhy53BwkkY97/w9p8xzcRDRvVKWsIlsMuwd8/FxcmvfAQAK9A+M1FlhPE5v6Jiy1fVNUg25BKIx0/VcUS07P/0jvS5sN61pRY7gJiyIaG+Y6FAlX8ImMtnTh6Qii+6AolVKtfsljtbfMYHLlWqCeLVuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 by DM4PR11MB5376.namprd11.prod.outlook.com (2603:10b6:5:397::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Fri, 20 Oct
 2023 07:52:02 +0000
Received: from MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::1e05:8d6e:fa94:9f7c]) by MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::1e05:8d6e:fa94:9f7c%3]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 07:52:02 +0000
Message-ID: <ea455ebb-cc48-4184-8f5b-d9d44d673ab1@intel.com>
Date: Fri, 20 Oct 2023 10:52:17 +0300
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
 <c14e2f76-9201-400f-ae50-a66651a473fa@intel.com>
In-Reply-To: <c14e2f76-9201-400f-ae50-a66651a473fa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0399.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::8) To MN6PR11MB8146.namprd11.prod.outlook.com
 (2603:10b6:208:470::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8146:EE_|DM4PR11MB5376:EE_
X-MS-Office365-Filtering-Correlation-Id: 246a2814-7cd4-4b45-4cd9-08dbd14171d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1yxP63EVVyy8UlbAg6B19K06T3j90s4P0lST7y4aibgO6BZKparFLPQ2/4EWb5NMZVBPefPl+TE2I4X5l6F2wELBpmJM+j8/kRieKK0kcv5v9YRIpk8+miH6lafPGISgyLiwcKAwkRJ+K5bVGuCJnO6keYGEqlWPn9hsOla+x5ducXK0+qmAov5pQ5SsuZ41AqSmR/Hx9OMcMTsJVu5z2UeTPrZVlSWYgd84dsVpg1FDSsxCDD2bogZDAwViK7Hu0QUfo4aht+dfsIiApSyPfZabEksPI90OgTDKOS0/mWj/0Kr4ew3kk74R9GevS2phhlw4s3EadNJMkdjc24dyOKg886zryr076EH/wTG734Dl34Wsz8O8scCNBaO2vP7k3oul6PvSw5oA/QvhA8vlGINOm73UqmTYj3k3o9JXzvIsebSxjdADbGkPnTBVvrUczMillA0hQqWS2TuPhShbZ5/kG7wnt12o0cGwpjLVUvAOg+66/1YS1rsHN5l4dEkp9ENOynk0fPwNEKp3FRCtqncCQTgvmosAiSIOwfeX+l8DmzVSrNgFO8J5X3P25RdBNOJ1ZgGsZYcNFM0Ag3SYvbrnO5N8YhfRjj3h+QJ9GmoGLVVMRXZzCQdaf1xvQc4/V5kG5SHpWmbLcyWULmDianVe4+gWBMCB/i2GvSlXFDY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8146.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(366004)(136003)(376002)(346002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(31686004)(31696002)(36756003)(38100700002)(2616005)(2906002)(82960400001)(86362001)(83380400001)(6512007)(26005)(53546011)(6506007)(66476007)(6486002)(5660300002)(41300700001)(8676002)(478600001)(316002)(66946007)(8936002)(966005)(6666004)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnQ5cUdsdnpBbm5yLzYwNWJKblJkY1J2R3ZaOFVzM2o2NG9YUkNwejNlcDI5?=
 =?utf-8?B?UWVweGZPODAwcmc4bkhCdjA3TXJ3NWpYSENsS1ozMEYydU44a3hzTzV6YTg1?=
 =?utf-8?B?bXZoOWo2NzhocVBxdDlBdUhKb05PSU56V0JYL1J5c0phLzVSeU9qWTQwU0V0?=
 =?utf-8?B?cFMrTXZhcDBtaC92SVJCcEpOekk1NlZ6TWtaZVdUZ05pVGZyM1Nkb2htSHRL?=
 =?utf-8?B?NnFMWDdLVzV5MEF4SGt5OXpCa2lSb29hTktHOWZRNEN1S2N0YTF5Snd5V3Az?=
 =?utf-8?B?eVJvd1FCdXRxbFJ0TmoyV3dnUFNoZWwwS0U2R1p6cm83MXhZQ0xBNFRwY1Bu?=
 =?utf-8?B?UThhODRLRHAvTGthVFV0T1YwTUJEc1UyWGpoYUV1U2h1RmNNRUxiUmRsa2o5?=
 =?utf-8?B?STQ3UVpxSC8rOUdwbjFKU1Y1c2JDcHc3ajdNeWZVU3FBT1ZSMWp5RUhLV1Iz?=
 =?utf-8?B?NEVhR2htS09ObkpEREJtemlEZUwvc0lHdUpUNW9jM2tPVnVHMU9nTVFFckxH?=
 =?utf-8?B?eXBIRVNBaFpFdU1MbjdJTTZ2TndTb3kyWjl5b3NQcEZ1MjgvbU1tYnRCMjVh?=
 =?utf-8?B?c3ZKOWlCbzV3L3VDRVlDM1gwSm5LRDJHQWI0YWRBUWlIN0wvVlhBbGpFTE1V?=
 =?utf-8?B?UXphRmZPRGpXOWR5SmIzZ1B4WGtGcmE3MXlBMC9heHpJZkdyM2tDNmt3QXVt?=
 =?utf-8?B?LzBiZTZYcDBtUWV2L1pyWkZ5cUFXeUFMV05CeTcva01veDc1UG42Sy9uV2pz?=
 =?utf-8?B?WHY2azh1UGFyVDNUT2ZhVHNSTllvVEs0ZGZLc2ZEdjBBZDdOVzZoM29ib0VV?=
 =?utf-8?B?aE5ybDRnbHdITmVMeU15ZU15am95b1pGeTRsSzV0eWdtNURTTVVDek1JUTdL?=
 =?utf-8?B?NWlIWFFzbkxPeTgraTZMT2lrenQrdGQvUDhIY0hEU0lFSUwwYXRWL0l0YlFt?=
 =?utf-8?B?MERNUWxDRmkyRkEralJmcTFLS2d1Z3g5c3daaEorUnhPNmdaVUdTNWtDS2xR?=
 =?utf-8?B?SThVbnhHaUYyMjNsbFdRVTF1YkpPQ2M0UklTQ29OcDNjWFN4TzJHYXhNdjNk?=
 =?utf-8?B?L0lQaDMwZGRTMUZFVUZNamdRQ0IyQjMzVEpiOXNXU2hOZkdrc2g4aW5nU1JI?=
 =?utf-8?B?V3FlMWNpNjZlVXNvUDd3ZUVtWnBpdzd3emRFS1RFMGl3djNrV3VaWlpiRWlR?=
 =?utf-8?B?YzZlSlk3L3RlOG8rK0pKaGJERUVLR0J1YitmWXBqd3hkdU5aYnoxaVdQMmVK?=
 =?utf-8?B?emF1aTI3bDRQbGlEZkRCbDJOT3VaTUsrTWsrQ3pxZlVTZm1OQzhxT01wUVg4?=
 =?utf-8?B?ZTlLb2xnUFkwQ1QxMVhUK1RRd2xPM1pWSUFsUEFCYmxoNTdwK1B4MS9FS3ZH?=
 =?utf-8?B?RFBkWGJGRVdSdkVEQytCUU41N1NEMUZyQ3lldTRCSHZMMG1UTEYvTVVTcnNR?=
 =?utf-8?B?SWNLYlVrOEZsOEVHdGl2NmJjaFNLYmlYeithU01maTBXdjdMS2lVNW04emNM?=
 =?utf-8?B?VnFnN29FTENkRDIzV0ZVTnFHeWpzT2lHQ012bzJRSktabktxd2ZyV0psNXdk?=
 =?utf-8?B?clU2T2pGYVdvemNxVVVKQzNxNXZ6dmdFU24ra2thZ3EwblJNc1gyamFsRG1F?=
 =?utf-8?B?Z3R5aklBOTIzdk1kb3dTNnJiL0UvLzZUTHRhWUQwakhpUHNMeS9RSk9OdzdZ?=
 =?utf-8?B?OHRHOFBvU0pjMnBqZnN6dGQzb01RNXZ4R0s0dFNkRDB6WkE0Nnc1cktxM2ow?=
 =?utf-8?B?RFp5UGs2dkM2Y0N6eGs4aURpNVZYWll3dDF6Wlp6Z2MyRFF0UWRYQmFMZU5S?=
 =?utf-8?B?Z2gweEdlZzAyZU5UdjFOZ0FRVHBwWTI4dGhQN0JuWDFYZ3djMFdyOWE3Nk9S?=
 =?utf-8?B?VEtvVk96N3VmV3JOYWlqWS95SmNrbEdMc3JYS0JDSEFJRDFXcWVHbmZBQk9U?=
 =?utf-8?B?T2hOL2VvT3ZXYTZzZE5xSUZ2S1JyTXM2TVpJc1B1dkhHaGcxc3o3dlpBRnNM?=
 =?utf-8?B?OEhRdmUvSXNpVUdWSUFaL0hmS250N2EwR0xSWWFlT0dPYUNKM2lWelFxdXo3?=
 =?utf-8?B?QWhWYllYV05sT1FkK0tSelgwbHRtc3JMMXNYNTFLK2M2Sm53YnlyclhyZXA0?=
 =?utf-8?B?ZnlPNE9YWnhPZXgxWE04YlNxRFgyZ0dDdjdjR25zd1p0NGMya0hHdldFRktQ?=
 =?utf-8?Q?Lqc4O/bll4r0DnZhYoz0+Us=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 246a2814-7cd4-4b45-4cd9-08dbd14171d9
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8146.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 07:52:02.6268 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rKJng4FHXSymPoG/3SmlNQxxC9N+oyXmrVeXGiKD6Ll/MK7UmDTMOD2aZHd4l0BTXCSb4l9lwainK/PsNVSa61M54bX7StGk2z0qOzhW0KQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5376
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 00/21] Add OA functionality to Xe
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

On 20/10/2023 10:44, Lionel Landwerlin wrote:
> On 19/09/2023 19:10, Ashutosh Dixit wrote:
>> This patchset is the initial port of i915 perf/OA functionality to 
>> the XE
>> driver. The following features in i915 have not been ported and will be
>> added (as new patches) if/as they are needed:
>>
>> * Inline batch submission on stream exec_queue/hw_engine
>
> If you give us a syncobj to wait on for the NOA reconfiguration this 
> won't be necessary
>
>> * NOA wait
>
> This is kind of required, otherwise we start reading reports from the 
> OA buffer and the values are garbage


Actually thinking about it, we could use the syncobj you give us and do 
the wait in a userspace batch.


-Lionel


>
>> * GuC ctx id (guc_sw_ctx_id)
>
> This is probably fine. On Gfx8 we always consider using OA a 
> privileged operation, if we keep it like that then it's okay.
>
>> * CTX_R_PWR_CLK_STATE/GEN8_R_PWR_CLK_STATE
> I think if we never care about Gfx11 that's fine.
>> * hold_preemption (DRM_XE_OA_PROP_HOLD_PREEMPTION)
>
> Without this, we can't implement perf queries in userspace.
>
> Maybe that's okay?
>
>> * sseu_config (DRM_XE_OA_PROP_GLOBAL_SSEU)
> Without Gfx11 probably fine.
>> * MTL bios_c6_setup
>> * ratelimits
>> * compat ioctl
>
>
>
>
>>
>> I am providing the following additional HAX patch (not part of this 
>> series)
>> to help review these patches:
>>
>> https://patchwork.freedesktop.org/patch/551683/?series=120100&rev=4
>>
>> The commit message in the above patch explains how it can be useful for
>> reviewing this series.
>>
>> This series is also available at:
>> https://gitlab.freedesktop.org/adixit/kernel/-/tree/xe-oa
>>
>> The series has been tested against this IGT series:
>> https://gitlab.freedesktop.org/adixit/igt-gpu-tools/-/tree/xe-oa
>>
>> v2: Fix build
>> v3: Rebase, due to s/xe_engine/xe_exec_queue/
>> v4: Re-run for testing
>> v5: Address review comments, new patches 11 through 17
>> v6: New patches 18 through 21
>>
>> Ashutosh Dixit (21):
>>    drm/xe/uapi: Introduce OA (observability architecture) uapi
>>    drm/xe/oa: Add OA types
>>    drm/xe/oa: Add registers and GPU commands used by OA
>>    drm/xe/oa: Module init/exit and probe/remove
>>    drm/xe/oa: Add/remove config ioctl's
>>    drm/xe/oa: Start implementing OA stream open ioctl
>>    drm/xe/oa: OA stream initialization
>>    drm/xe/oa: Expose OA stream fd
>>    drm/xe/oa: Read file_operation
>>    drm/xe/oa: Implement queries
>>    drm/xe/oa: Override GuC RC with OA on PVC
>>    drm/xe/uapi: "Perf" layer to support multiple perf counter stream
>>      types
>>    drm/xe/uapi: Multiplex PERF ops through a single PERF ioctl
>>    drm/xe/uapi: Simplify OA configs in uapi
>>    drm/xe/uapi: Remove OA format names from OA uapi
>>    drm/xe/oa: Make xe_oa_timestamp_frequency per gt
>>    drm/xe/oa: Remove filtering reports on context id
>>    drm/xe/uapi: More OA uapi fixes/additions
>>    drm/xe/uapi: Drop OA_IOCTL_VERSION
>>    drm/xe/uapi: Use OA unit id to identify OA unit
>>    drm/xe/uapi: Convert OA property key/value pairs to a struct
>>
>>   drivers/gpu/drm/xe/Makefile               |    2 +
>>   drivers/gpu/drm/xe/regs/xe_engine_regs.h  |    2 +
>>   drivers/gpu/drm/xe/regs/xe_gpu_commands.h |   13 +
>>   drivers/gpu/drm/xe/regs/xe_oa_regs.h      |  173 ++
>>   drivers/gpu/drm/xe/xe_device.c            |   13 +
>>   drivers/gpu/drm/xe/xe_device_types.h      |    4 +
>>   drivers/gpu/drm/xe/xe_gt_types.h          |    4 +
>>   drivers/gpu/drm/xe/xe_guc_pc.c            |   60 +
>>   drivers/gpu/drm/xe/xe_guc_pc.h            |    3 +
>>   drivers/gpu/drm/xe/xe_hw_engine_types.h   |    2 +
>>   drivers/gpu/drm/xe/xe_module.c            |    5 +
>>   drivers/gpu/drm/xe/xe_oa.c                | 2314 +++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_oa.h                |   27 +
>>   drivers/gpu/drm/xe/xe_oa_types.h          |  307 +++
>>   drivers/gpu/drm/xe/xe_perf.c              |   36 +
>>   drivers/gpu/drm/xe/xe_perf.h              |   16 +
>>   drivers/gpu/drm/xe/xe_query.c             |    5 +-
>>   include/uapi/drm/xe_drm.h                 |  288 ++-
>>   18 files changed, 3272 insertions(+), 2 deletions(-)
>>   create mode 100644 drivers/gpu/drm/xe/regs/xe_oa_regs.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_oa.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_oa.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_oa_types.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_perf.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_perf.h
>>
>

