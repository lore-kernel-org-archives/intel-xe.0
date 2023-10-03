Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0009E75459
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 18:15:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D47310E02A;
	Tue,  3 Oct 2023 18:15:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA5210E02A
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Oct 2023 18:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696356917; x=1727892917;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2cvee0KaOXf2U48G/9gLjyoxfAs2h+umgs9JFTH80Ng=;
 b=djXvPidLz2PLHpWb9V5IA194kNtFjbzno4A2Miyf8KtrtKBJDCwguZKw
 yx67rs9EjgOMaTUQS0lGY3HVfLk+/hWWzyonnsguhkAEJTq3SC4Rbt23h
 8dssoJdJjJ2UhOFI5CkZXlE71+sxIkLB37U4/iFz9o/BnIJ+AXMioXxgB
 RIs0kpZ2NuLLT72oggekjYbc01pWwX1qLYkrLfcYPkAJsAjV5VzvHs+70
 URjtik8bzam6Fv/jQBFAQHG1MfXVsKDQ81P4PjlrKmid+OU7Ww96r8C/d
 9vLhMvy3zDN0aoSiD/A9i9lj9MxLwwjopHLkFK0UZ9m5RpVO2+cfGPJAm g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="380220360"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; d="scan'208";a="380220360"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 11:15:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="700799066"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; d="scan'208";a="700799066"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Oct 2023 11:15:14 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 3 Oct 2023 11:15:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 3 Oct 2023 11:15:13 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 3 Oct 2023 11:15:13 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 3 Oct 2023 11:15:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DVW0TVMSccjaglzEiRq7UF5Ol3MU9RoRfcxWCbCmHMcTw30goUkr7niL2nteBt8e1JpkzZs4LON2EA0Q8cAvX754iy16O7Sv5HHw/Ka688RnnGkp5jhWVLPveWwy97zr+h9Z6uAeF8NFj81CzuJnyUvPyY5MPKV3BJhvNbfSaoOaTl5zXYUkC/mj5I23yAHZr3XhzKiaaRL2cN4K7tCshnmss94M4apbmqn0EjOxXWezNj8nY/iG2BpmHLBjfQ/cGTIg23qWIzphGRUdvo8dEnpcAek1TfSH7WJmHVXKyOLPPuwEZH2o00awvEB8y3ngJ0RHjn0oxF9JTkZ89OCrcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=myyBnGkqcFtR/vDkN4JD+PGZmmisPdqbOibgAccK3fA=;
 b=H+eAb1CaSoZj2q8LIjIUQo3OG3oURL6Zn03AfeVJ/7/DURkYBQv7ztLmCTKASH85OmPcfSYwdDOm0bgXD9A77D0/jc8a2Xq4gyJN8kvHbwsYuRHkq3gFtAy1Z8BnVIBaOV1VF2zmyF1mhmYXqQx0e6+ZAb+RgRmgaUfBJ7gdiK2Vnd6wcOYPlHza6LlufOLCiXLc9a4sVGCRQSYY2McnWoc44sgMuKEFEvUlGBuaTusjyaVo3AAlHSNacuoCfgbBaVlD6UmiCrVkfCOJ1RZWvn/rJ/p84d4wPByQej+kUHHiAJFYfiwyx8kbj2hGJJ/FfHuvyVDcgKMPvIK1bIVejw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 SN7PR11MB7090.namprd11.prod.outlook.com (2603:10b6:806:299::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.29; Tue, 3 Oct
 2023 18:15:11 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::8d1:d53c:a9f7:852b]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::8d1:d53c:a9f7:852b%3]) with mapi id 15.20.6838.033; Tue, 3 Oct 2023
 18:15:11 +0000
Date: Tue, 3 Oct 2023 11:15:00 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <ZRxaJFgF1Qoqtoey@unerlige-ril>
References: <20230926125540.7-1-francois.dugast@intel.com>
 <20230926125540.7-27-francois.dugast@intel.com>
 <ZRYcFy97svJ8Z4NS@unerlige-ril>
 <ZRaTrQ6qqa9wIO9n@fdugast-desk.home>
 <ZRb0uavwuieKeqVy@unerlige-ril>
 <4bb2a25702832a21263c3e5780644b979697998b.camel@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <4bb2a25702832a21263c3e5780644b979697998b.camel@intel.com>
X-ClientProxiedBy: MW4PR03CA0102.namprd03.prod.outlook.com
 (2603:10b6:303:b7::17) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|SN7PR11MB7090:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e46798f-96e6-4d79-309b-08dbc43cae6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DhHhHUUlawofXKDDAlSwh/0LPriZ/e5OGKmCphzRoK//rV+54skP0+sCdVaPeL2dBskqonq4+QNJ0+B++GvBFmlFI3LzuGQsDSMp/N3ilY7uacqDJdVQ7x6gbTC8ZlVm6khh3FBoA2J1lEk/+QD1Qm7hrTTqg+4onDCPGYX0ltJUtdMa+8xR4CA5x3Pr7orcuwCG0sM6h2hH5CFr41ZTuy8SALV39nOdvHmOJRc8piYJCT1vR3lcDpVsvgVdCg+kxQYncjchWQ03PElLfIPU7CVNL6xkW0n4Jmj0/XXParKDyjwLJh9mEBUPa8FeQayzCee0HzilSzaDW4ZUDprQqIWkXttLq3w6zEw9SYOcaydKS0mQy2gJyryCeHNjWzmZEN3/jZcz0Zkqhhw61YzQ72+CgFfloiYx4UaolxHybHMhD4zgAZsmBAPC1OoxCL9buR20ny3UUQm+C9+f+b9HiOQ1kAnGToRLVWN672YWEKF6KnfnECv/DRsY3xsDUqcdGASARr32rlue+7JWZAbMUhPsKCwfE9OOAQSBrsUSFr+Rk6j6q+aq0dO7h+vaTmCa35rrb7lAFxJjAv4Tfk7GIQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(366004)(376002)(346002)(136003)(39860400002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(966005)(2906002)(66946007)(8936002)(6862004)(54906003)(5660300002)(6636002)(4326008)(66476007)(66556008)(8676002)(41300700001)(6486002)(6512007)(9686003)(478600001)(6666004)(6506007)(26005)(33716001)(316002)(83380400001)(82960400001)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MU00Sm44OFpwTnAxNzNPaExnaXVNMVl5U2FGODcrOUp1TFh2WkxmZ083TTJi?=
 =?utf-8?B?SGJub2FIcFk2NlNWbGJNUlhWbEdZM2ZtbVU2OG9qVkdKUURrR3ozVmQxNmxW?=
 =?utf-8?B?YW9ZcVVHRVB0YkZ3b2dDN0ZqcDNvT0NqYzdHdDZ3a3U1NGdzVitOOHhtdDUz?=
 =?utf-8?B?SGl4Mkg5aHV5WmFFNFhVcE9PS01SVExJQVA4MWVtdGhBSFN3S2c2WWNhMmdR?=
 =?utf-8?B?ei85UTRpRXZjcTNFN3haZ3o3alI3VGc5b3Z5dWtaOExlKzhEUUVmY3NIenpB?=
 =?utf-8?B?aWhDVkdzelJVRlphNG5PaXZIUDh4Y0ZySW9xTG4xbGVEOGQwSkczV2gwbjJx?=
 =?utf-8?B?cERzOFY3VU9kUUtDUGQrc0RNaERXVWhuekpWMmNQNmZqeW93QVB3TG1tWVFh?=
 =?utf-8?B?RGNmdmh6UW91NkhNaWJiWTFqcjVGOXZKdnU3OGlCWkhrZ1p5VGJaVUlwQm5o?=
 =?utf-8?B?NWRSZkZHRkdkb3dqV2loSHV0VzJjWTN1WEI1eEw1VEtBTldTVjEzZ2ZDNHVU?=
 =?utf-8?B?L1krcEtXczdCcTBOWTZOSURlYWxIMkxoR05DM3E4SEg5NXhuRHFWQzNid2gz?=
 =?utf-8?B?Qi8zVk5hY2xvcjlBVytMU0lHZ2RqR2xUc0lLRXVBMkdHY3QxNHNIeHpZZWh3?=
 =?utf-8?B?SjJoWkhWQml4U09UQXZWblZoaUtNRm5FNnI1bmtFT0MzY2NnV2JVdExKQ3pk?=
 =?utf-8?B?UzZRSnByNzlra1B4SUJHZ1A2a1EyT3hxNHFZTFpqOERnRXgycnJBcFpqM1hq?=
 =?utf-8?B?UkN2UnJSc1gxYUFUQmNsQ3VuRVJhTWh4UisvbWx2M21uOGlGOWFZRG16d292?=
 =?utf-8?B?TGxDZmFnWTNGeHJrVThVcVB1MUs0eWtXY0JlRmRPTlBLOXRCblljNTBGRDcr?=
 =?utf-8?B?Z0xjWHZqYkhWVUNzeVFnendNdUR6S3BUY3lMdDFib0lRc2xiMDk4WW9Gcksx?=
 =?utf-8?B?d3IxNk1EM3ZEQU9kZVlIUFBuM2dpa2dQdmFUOStKSjBFb25aVUYvdUF0MHhT?=
 =?utf-8?B?VXRUZXFCalprdDVMdkVyemtmT0gzK2tvb0xwMFB3aXo0NFAvektmNEZUU3Q4?=
 =?utf-8?B?R01oZG1vRno3ZEdyYXh3RmhnOEo1NnNydFRqWCtFc3ZoV2cvV0pDS0RJWDZy?=
 =?utf-8?B?YzlUQ1lwZkNUUFNOSVJPa0lwaGh3elZPcDBpZC9OeExaa2JTTUwwS1UydUt5?=
 =?utf-8?B?eEcxckV4dWRwNHZKQU15V3NoQkVWS0pTZjlkT3dRSDhucGRFT2N6QnpoRVZa?=
 =?utf-8?B?WERHVkx1ZmFTbm5nNjhmQVlBL0RTMFpEQis5cFhpYVMxS2NtTjEwUllNNi9Z?=
 =?utf-8?B?MmZOWktCdDhVVEVYSG51eURnTzVQQ0N5RnYzUHdRTHZPNmpqa0dXa0dMUDNr?=
 =?utf-8?B?VWNHbkpGUTJ4U0k3Yk8rYmZPY3E4NkxvM0VLMUR5WFFzZkRFbThncW5HZ3oz?=
 =?utf-8?B?QzRHMnlMYWVRSGthN3lIOVM5RWtScmJ6U0tqWjF4eWliRFBiSlNDYTR6NXJB?=
 =?utf-8?B?NGlzL2xOR2YyS1lWT3RCN1hKeGRZSTdnS0JiWVlJbW83Uk1IQkZhWHRQSFVz?=
 =?utf-8?B?eWJoN2lWazJZRDlaSWRqdUo5dTh6SkJiRTlPOGhKb2o0d2J1aDVXTkRWMFZj?=
 =?utf-8?B?OUk0d1BzMGFyV0ZiaUZWSkt3czJqL21ybVprNmJvYTl5TmpXc0NHellqb2Nw?=
 =?utf-8?B?Rk5JbWFKbUFpckVCK25leWdYRWl0WS9ZcHlWbEIyaklHRHgyT2xvWFpNRFps?=
 =?utf-8?B?QmZtMGlQdmtIOHU5NDB3M3J1NlFhZ2dRR2hXKzJqSXNGc1dYb0JOYU1nS0FU?=
 =?utf-8?B?QVRZTFZVcUo3UVBQazJRaDNia3pOTkxLWjByRng4R0t3bHRCbVE1R2htT0VE?=
 =?utf-8?B?S1FnTWFCTlZTUERWY1BQd05ZeEVGTXF4SExxSGdSMDViU1NQanUrdkxHNFNQ?=
 =?utf-8?B?RVRRdHY1eTJLbTJPdm5SRFYwU3EwbGY0ODhzekRXaXBYanhmcjlXSDc5RzA0?=
 =?utf-8?B?d0JOR01WaHExejFOb2lxdTU1aWliOFVleEt3eFdpL1ZEQ0tIN0luTGhsc3or?=
 =?utf-8?B?ZzN3dk9YK09oKy9YcEowckE0U3FlN2UyS0dpZXZrRTdBekNEeHM4RnlmU0RE?=
 =?utf-8?B?VDFCZk1UYTUwVDY4Q2owb0tVdlJCbVpOeWV2YXl1MXJSclZIWEZ1T3c5TjFM?=
 =?utf-8?Q?Qpe18DJxZskPqJIqwEi0HKc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e46798f-96e6-4d79-309b-08dbc43cae6a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2023 18:15:10.8325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DFoCdbai/2MNmnSZJxnVeeuJO+qLtzHnky+ylsfTGc4V8mZUbbCVjXoOmXdmpVSQjXhRBrM1pjjMZbBcHXV4DRoycoTp/a8m389FCvJTgbM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7090
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 26/30] drm/xe/uapi: Add pad to
 drm_xe_engine_class_instance
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
Cc: "Dugast, Francois" <francois.dugast@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Sep 29, 2023 at 09:45:35AM -0700, Souza, Jose wrote:
>On Fri, 2023-09-29 at 09:00 -0700, Umesh Nerlige Ramappa wrote:
>> On Fri, Sep 29, 2023 at 11:06:53AM +0200, Francois Dugast wrote:
>> > Hi Umesh,
>> >
>> > On Thu, Sep 28, 2023 at 05:36:39PM -0700, Umesh Nerlige Ramappa wrote:
>> > > On Tue, Sep 26, 2023 at 12:55:36PM +0000, Francois Dugast wrote:
>> > > > Add pad to reserve space for future uses such as special configurations
>> > > > for media.
>> > > >
>> > > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>> > >
>> > > I saw a comment in v4 that you dropped the patches that are not reviewed, so
>> > > this is:
>> > >
>> > > Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> > >
>> > > Hoping this will be part of the final series that you merge since the
>> > > ENGINE_CYCLES query is using this structure and relies on this padding.
>> >
>> > Actually using your original submission [1] this patch should not longer
>> > be necessary, right? It includes:
>> >
>> >   __u16 rsvd;
>> >
>> > [1] https://lore.kernel.org/intel-xe/20230814223734.375449-5-umesh.nerlige.ramappa@intel.com/
>>
>> Hmmm, I failed to notice that earlier. My bad. v4 looks good, you can
>> ignore this.
>
>It is named as rsvd but it should be a pad.
>
>We can't leave as reserved to be future used to return media engine capabilities because drm_xe_engine_class_instance is also used as input to other
>uAPIs and that is useless information after initialization that UMDs should not need to carry around.
>
>Instead DRM_XE_DEVICE_QUERY_ENGINES should return something like
>
>struct drm_xe_engine_info {
>	struct drm_xe_engine_class_instance instance;
>	__u32 rsvd;/* future could be __u16 capabilities; __u16 rsvd; */
>};
>
>This can be fixed in uAPI take 2.

Hi Francois,

As per Jose's inputs, I posted a new version of my series here - 
https://patchwork.freedesktop.org/patch/560614/?series=124565&rev=1. 

Can you please pick up patch 3/3 from here. Note that just adding the 
pad does not resolve the issue I was mentioning in my original series.  
We also need to explicitly initialize the pad to 0 in this case. I have 
included that change as well in the above patch.

Thanks,
Umesh
>
>>
>> Thanks,
>> Umesh
>> >
>> > Francois
>> >
>> > >
>> > > Thanks,
>> > > Umesh
>> > > > ---
>> > > > include/uapi/drm/xe_drm.h | 2 ++
>> > > > 1 file changed, 2 insertions(+)
>> > > >
>> > > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> > > > index 79e47708d526..84091860c7d2 100644
>> > > > --- a/include/uapi/drm/xe_drm.h
>> > > > +++ b/include/uapi/drm/xe_drm.h
>> > > > @@ -143,6 +143,8 @@ struct drm_xe_engine_class_instance {
>> > > >
>> > > > 	__u16 engine_instance;
>> > > > 	__u16 gt_id;
>> > > > +	/** @pad: MBZ */
>> > > > +	__u32 pad;
>> > > > };
>> > > >
>> > > > /**
>> > > > --
>> > > > 2.34.1
>> > > >
>
