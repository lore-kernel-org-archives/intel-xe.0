Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59813C001DE
	for <intel-xe@archiver.kernel.org>; Wed, 16 Aug 2023 02:15:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91AFC10E067;
	Wed, 16 Aug 2023 02:15:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B666910E067
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Aug 2023 02:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692152118; x=1723688118;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ay3qn+pBGWz5SQXxNVYaKhYB4wDVa3V4uXe06+xh5RE=;
 b=MOUC6LU/av1uCGma2wFf6e5NjU24RDZNb6/qL12Rsm8GjHgtpnmQw7yw
 FhXDJ1Vh6VGD81HcP0WJ1nL+fnlkS1BVHs2HpuwlSwaQ70HfQeUNUk3B0
 9Bg1pE9NGj4ZSRtF05jgzQvUCOJ7BfNDJt5N+owX4Ac0UDZKOeeuFQg+m
 8on162JAjsHZDIWkpu1laZqGrpy5IGmEjhdNBsTeKVmY4ewK01SJoGvBd
 3UXjNW6n+GOiyJVTJvJ072QKiHhUTq8eYGJt4u4pCLTS6VaUnQas6EcRY
 4HwGXTMY3nwiWb231fotozf6L7l5WRNwmKOmpZjFJ7auYIrvmPy4rFblQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="357397329"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; d="scan'208";a="357397329"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 19:15:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="848295598"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; d="scan'208";a="848295598"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP; 15 Aug 2023 19:15:17 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 15 Aug 2023 19:15:16 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 15 Aug 2023 19:15:16 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 15 Aug 2023 19:15:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lot52GhTEuH3mGYjn71wfaKCS5lP1dzhovVs4bcBFebie4iYBku5JFvtk7M7bcZtv2AJHu3Iev5aTDh8qXo0FlmIbU+Vf6bwCCwJZ0JctnjhB+1cWipZhxaKEsU6GV8pKQ8PXulEHewP/9LMa6qaFbvWw/xSJ9AG0uC2CJKA1U8VUn67loo7sq73/NcKed9xh9ap5S/TgsHPbLelyeDFAiUvpNaItTz8CARbdJU3wDgbuthnRwLI9hs7V6RpPkDdh91HzNds6ZbWsXE7KrolygykB1W5xiPpzhqlX5CJnn5nv7iCafnFdPEoZ2BVzdVeEI4qC2oO+G/TDma014V2zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NwVzXQTLIxQ7N+ZIW6c6JDog1B37FBV4w7qcViW4u0Y=;
 b=SCj1Q+1v8GduTpI6y7scuKvC/fjKN1VzsSX5MLfRiCRdDuV9e+dYeNwzowT7v6UEVL0lc1Pe6tW+5ptSZI3st7mnbQvw1Vb61eU/mJTm2yPDXU0/FKAi8/2qV2XZ1ZU2aw+IqvqBrx4NH2JIY5M65qWZxeFmOMMmQWhAGGC04XESnU5N0Kyv/n2V/NH0k6Dbi4z8+dSSp6gO6ADmVkxejjbWY3ZxsltzTgBTTa2EEATWvb3zeWKz6qtsVdBhphmjQGHWdBmAT1UtWzHMQ/c32JHXnQzBazC6LXsZ1PTr1sZ3rjBXpExh5BPBfJ21OHw3FSB5NOaA+LuBcAgYtB2h1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 SA2PR11MB5097.namprd11.prod.outlook.com (2603:10b6:806:11a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 02:15:05 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::5f98:c6b:6aa8:4a8d]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::5f98:c6b:6aa8:4a8d%2]) with mapi id 15.20.6678.025; Wed, 16 Aug 2023
 02:15:05 +0000
Date: Tue, 15 Aug 2023 19:14:40 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Message-ID: <ZNwxENspCySSvfCB@orsosgc001.jf.intel.com>
References: <20230808013159.38811-1-ashutosh.dixit@intel.com>
 <20230808013159.38811-2-ashutosh.dixit@intel.com>
 <ZNLIzElZdEFY7J3h@orsosgc001.jf.intel.com>
 <87350kt87c.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <87350kt87c.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0146.namprd04.prod.outlook.com
 (2603:10b6:303:84::31) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|SA2PR11MB5097:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f239dbb-2d76-4609-8e87-08db9dfe9b3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MTsDWwyBoqvMzY5cZTFoT44zYqv401i50T0JX/Bfnw6g8fDlBVubSEKXRG1J9bwziryIzEiV+UQaHbWxw05dG0EBHut1BpbA90rhtDHUQYWlhlgzGsIw2TUoy9Z4O9yzn4PBUvC6aWcQoP1y2xeBlPKj/Fq8/5l6SStW1Sb/7m+XJuMuto5rskfo7pjAU3KxECq6ogO98PPjPr+dSHua8W+frRRUwN8/rE1GsYVW+u4ksGH0mF8kczKaB51yRvq7R7kNIGH3WTtopoM+bZ8F1vIpNCUatN2N35pf6LUA71yAfSUl9UuwTWzNZDcalBpAPTCSyMCxflDFe15fZVsSAOPg+F70ZOwG1wGy2tg+EJ9YBER9lRsGt50T9xO/EiwV/ZFQtbc9V6NWgTma4jd644qKYFbKvGh1qxg006mEQKu9vI56P5HI8Rv/aQZygaw8UXL48dEKGigTkwjB/tbp1/RNENEKsh+0zi5IAhsWsFtknEN1O1rA0QLbZV3rXa2wuk887Q5/oacJcZr489p/k0i/NPyR+5Abno/Cd0CKvgLi7w/3zgAAYR/BgSn9CAvL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(396003)(376002)(366004)(346002)(451199024)(186009)(1800799009)(66946007)(66556008)(2906002)(30864003)(83380400001)(86362001)(316002)(478600001)(4326008)(41300700001)(6512007)(38100700002)(6666004)(8936002)(26005)(6506007)(6862004)(8676002)(6636002)(82960400001)(5660300002)(6486002)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clBHaUk5RXF1QndRcVVvMnIzdUc5N0ZPUlVPdVpWSXVQRVc3UWJoR1R3ZmJD?=
 =?utf-8?B?amhWT3BQUjRFMzZ1aU5URmVIcG02K2ovSTlsWnlDUlRSSExmKzE4YmtqVXZT?=
 =?utf-8?B?UWJFL2tPVndoUTBLSlpEUnVnbDdtOFFtRkNWeVFrNHhqU1ovaVNORzk2MmZG?=
 =?utf-8?B?RUxaMGluNHR5VDBxODJXYXRBMFJTYkpHb2tLVjhrdW15MHBYRjVib3l4OUlF?=
 =?utf-8?B?a2R1REpqRVZ2TkxQSUt3S1QyS3pseENCRHZkWnE5Y3FzZnQ3bExsNUNrYVBz?=
 =?utf-8?B?WXB1ZThnVGs0d1plaHhzRHNFUHhyS0VXa1BRMTRTZTV3ZFlPeW1PcFlpMGt1?=
 =?utf-8?B?a3R2RkZQeXcwS0ZWQVpOMTFmS0xDMXRHN0hxSEc3a1R1WEZPaVJxZlkrQ1pj?=
 =?utf-8?B?bSt3WXB3YkFOQmtiNmI4T0V4U0NHS2pvbGxFRTdBaktXZWNJMUVwSUlnS1My?=
 =?utf-8?B?WDhHcFlPRjVVbkJNUE5CWHJUYTdIdXBvOThJZnJRVlBLZG8yL3JvWlh6U0pZ?=
 =?utf-8?B?V1RIb1Y4QWlFdExIQlFta3NmSHhzTkRCbFQ2bUJ0WFhuczlSQTMvV2RLbG5y?=
 =?utf-8?B?R2ZUY2FHMDhCZjNaS0RxL3NxY0UzUlJSMkpib3M1VGZFTCtuQTY3VGIrZWVM?=
 =?utf-8?B?R20rYXVJSHdnQkNUMEtTcXFPMzhpZEc3OXJxKzFGK3J4dGVySDhjcExiRXlT?=
 =?utf-8?B?ZlRLb3BGNGhiZFQxVUp0MEdKQlcrQWV4TXBDdWRJcEhQOEc4N2NaNXBiUTN3?=
 =?utf-8?B?WU1xby9qSzUvNVJBelZvZTZEbVJ0T3dxVU44bWNuaHF6RGkvSnJ3ZC9qV0VS?=
 =?utf-8?B?RXRjUnlsOTRldUtsYlk0UmtuR3J6bTZ5RmwxVjhPelRkNW9sdVVlM1hVMGlR?=
 =?utf-8?B?VEhXK0wyU2R2TGozUnNubStyaVhrRzNpZVM4ZnFad0dkR20yOVRvQnJlTXpp?=
 =?utf-8?B?MWJDdlBobVBpQTk3OFlzaEdGYUtpQkhZb0ZDYWFvMTF6dTVrRUlaeDJEU3J3?=
 =?utf-8?B?eWd4WGkvMmFaam95d0lad1dRNVJtNUxjWTFKclVvQm12WXk3Rlp2MFQrZVhV?=
 =?utf-8?B?WndySDY2RDFQcjFZY2pqUEgvWFc0MmdjMVJiVElQWDM5aC9PbVBlSkw1dUpG?=
 =?utf-8?B?OXpvWVAzdXFTLytJOFpWc2hGWFBpN2cvQ0hIV2UxcUUvRjBydnRGYnZZaEhI?=
 =?utf-8?B?RjRIRFh1YlkrTkYyMVQ3WWU3eE4zM0dyRStIb3dFd0FDVGgzUml2TENuaHdS?=
 =?utf-8?B?RzFVelZEYU9HUDF4QzdzV010K0p2aXJlK1ltc2xmRGFlK0NLeHFKV1J4dXJ6?=
 =?utf-8?B?TmxCVzA3TWE4UFhvK09ldlU5ampFb0xvalFlV0FDcWNaaXBIQUhraHRVZkts?=
 =?utf-8?B?Ukk3UUt0Vk5ZY1ZyTFV2cDlSa2VIOGdTbkFHWUlOYSt1ZmNFYWJsUEw5VTYw?=
 =?utf-8?B?eUlxUDhiMTNZakhZQkoraVdYU3RlZUpTOCsxTm9wWG5qL3JUSVl6NGl4aENU?=
 =?utf-8?B?QW8zcVo1QWJiWXQwYVZYZEJEOVZHOTFhcFY1QStKRmgxRS9hNm16aGNRN2hB?=
 =?utf-8?B?V3pWZkNqTk5ramZ1RkhqczFYTmNUV2I1aWs5NnFzUEtVaUxWekhmYU9hcTVm?=
 =?utf-8?B?RUVNV3dyTVZ5SSs4cnRHa1JSZTMrZmowSVVVQ3Y0ZGtuQmpiWUt6SFhhSm5y?=
 =?utf-8?B?bEY1RGtQRmZ0ZkFWZlBmRnA1K3NMN0ZuUm10bHhJNU9tZll0VkJsR0MxVVV4?=
 =?utf-8?B?REI1QzdWL1JhakhzSENoeVdnZS9yamlLSHM3bGZlb0kvOCtJUFVxczBZaElm?=
 =?utf-8?B?eWNLRFRIempFNlVFSWZhL3c2Q1BLVUJLdkhJZmZURmVCSFQvNlNXK1VrN1hJ?=
 =?utf-8?B?bUphT1RQaEVGZ1ZBZ3dJNnRTM3lhN3JIVjcwNU1FYXJGSTNROHdpUTRiaFZE?=
 =?utf-8?B?S20vOGQrdmRpSU1VUzZFUzdHOFZmVStHMzFBMExUelFvN1U5Q2FRTXA4dnQw?=
 =?utf-8?B?WUpMc25qSjUvT25HYlVHSFY2cFdYOWJIOFhoZjR3NTF3dlZpL0t4STBLSGFy?=
 =?utf-8?B?K3lYeTFXYndNVCtxVUlsRUlGVDZWNFBiRGY0SnFuWUxKNWpTWHZXd1k3M204?=
 =?utf-8?B?U0tJaUpGdmh3bWltaTVJdWVBUm1ucEVkMFNUZmkrTDZDeW1zM2ExN2ZETkZm?=
 =?utf-8?Q?zaPj9KJ7xkJIk3A2H4zj6sc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f239dbb-2d76-4609-8e87-08db9dfe9b3f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 02:15:05.7066 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IpzJhWJjaUxpdFH/w8GNP0NP1Vhhivay6nq24ISk4uAU4BFzvr/9XRInLTcQPAVQJb2AIS/ecpURW+WWR9lVbmgFokdJX7rBW8mQ6PyDhwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5097
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 01/10] drm/xe/oa: Introduce OA uapi
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Aug 15, 2023 at 12:29:59PM -0700, Dixit, Ashutosh wrote:
>On Tue, 08 Aug 2023 15:59:24 -0700, Umesh Nerlige Ramappa wrote:
>>
>
>Hi Umesh,
>
>> This looks good in terms of what existed in i915. I have some comments here
>> from an improvement perspective. Please let me know what you think.
>>
>> On Mon, Aug 07, 2023 at 06:31:50PM -0700, Ashutosh Dixit wrote:
>> > OA uapi allows userspace to:
>> > * Read streams of performance counters written by hardware
>> > * Configure (and reconfigure) which sets of perf counters are captured as
>> >  part of OA streams
>> > * Configure other properties (such as format and periodicity) of such
>> >  captures.
>> > * Query associated parameters such as OA unit timestamp freq, oa_unit_id's
>> >  for hw engines and OA ioctl version
>> >
>> > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> > ---
>> > include/uapi/drm/xe_drm.h | 257 +++++++++++++++++++++++++++++++++++++-
>> > 1 file changed, 256 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> > index 86f16d50e9ccc..b4ab07c285245 100644
>> > --- a/include/uapi/drm/xe_drm.h
>> > +++ b/include/uapi/drm/xe_drm.h
>> > @@ -111,6 +111,9 @@ struct xe_user_extension {
>> > #define DRM_XE_WAIT_USER_FENCE		0x0b
>> > #define DRM_XE_VM_MADVISE		0x0c
>> > #define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x0d
>> > +#define DRM_XE_OA_OPEN			0x36
>> > +#define DRM_XE_OA_ADD_CONFIG		0x37
>> > +#define DRM_XE_OA_REMOVE_CONFIG		0x38
>>
>> No holes in ioctl numbers above, as in use 0xe 0xf 0x10 instead of 0x36,
>> 0x37 and 0x38. Any reason you have left it same as i915?
>
>Just wanted to get the patches out on the mailing list soon, having the
>ioctl numbers same as i915 saves a bunch of IGT changes.
>
>Also, I am providing these patches to UMD's to test and the holes allow the
>ioctls to remain undisturbed even if new ioctls are introduced in non-oa.
>
>Even the oa_formats below are the same value as i915 :)
>
>But yes this will eventually have to be fixed before merging.

sounds good

>
>>
>> >
>> > /* Must be kept compact -- no holes */
>> > #define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
>> > @@ -127,6 +130,9 @@ struct xe_user_extension {
>> > #define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
>> > #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>> > #define DRM_IOCTL_XE_VM_MADVISE			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
>> > +#define DRM_IOCTL_XE_OA_OPEN			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OA_OPEN, struct drm_xe_oa_open_param)
>> > +#define DRM_IOCTL_XE_OA_ADD_CONFIG		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OA_ADD_CONFIG, struct drm_xe_oa_config)
>> > +#define DRM_IOCTL_XE_OA_REMOVE_CONFIG		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OA_REMOVE_CONFIG, __u64)
>> >
>> > /**
>> >  * enum drm_xe_memory_class - Supported memory classes.
>> > @@ -261,7 +267,8 @@ struct drm_xe_query_config {
>> > #define XE_QUERY_CONFIG_GT_COUNT		4
>> > #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
>> > #define XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY	6
>> > -#define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY + 1)
>> > +#define XE_QUERY_OA_IOCTL_VERSION		7
>>
>> I am thinking we should just have a query for oa_info where things like
>> revision, oa_timestamp_frequency and other OA specific info like supported
>> formats (spec - 52198) can be queried by the user.
>>
>> Also iirc, revision was just added as a way to determine new
>> extensions/features to OA, but I don't see that mechanism used by any other
>> interface here. Maybe we should see how other interfaces are adding
>> features and detecting their presence and use something similar.
>
>I believe that would be doing this using xe_user_extension's, both set and
>get. See exec_queue_set_property and exec_queue_get_property. Revision
>etc. won't be needed if done this way.
>
>>
>> > +#define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_OA_IOCTL_VERSION + 1)
>> >	/** @info: array of elements containing the config info */
>> >	__u64 info[];
>> > };
>> > @@ -298,6 +305,7 @@ struct drm_xe_query_gts {
>> >		__u64 native_mem_regions;	/* bit mask of instances from drm_xe_query_mem_usage */
>> >		__u64 slow_mem_regions;		/* bit mask of instances from drm_xe_query_mem_usage */
>> >		__u64 inaccessible_mem_regions;	/* bit mask of instances from drm_xe_query_mem_usage */
>> > +		__u64 oa_timestamp_freq;
>> >		__u64 reserved[8];
>> >	} gts[];
>> > };
>> > @@ -753,6 +761,7 @@ struct drm_xe_engine_class_instance {
>> >
>> >	__u16 engine_instance;
>> >	__u16 gt_id;
>> > +	__u16 oa_unit_id;
>> > };
>> >
>> > struct drm_xe_exec_queue_create {
>> > @@ -1056,6 +1065,252 @@ struct drm_xe_vm_madvise {
>> >	__u64 reserved[2];
>> > };
>> >
>> > +enum drm_xe_oa_format {
>> > +	XE_OA_FORMAT_C4_B8 = 7,
>> > +
>> > +	/* Gen8+ */
>> > +	XE_OA_FORMAT_A12,
>> > +	XE_OA_FORMAT_A12_B8_C8,
>> > +	XE_OA_FORMAT_A32u40_A4u32_B8_C8,
>> > +
>> > +	/* DG2 */
>> > +	XE_OAR_FORMAT_A32u40_A4u32_B8_C8,
>> > +	XE_OA_FORMAT_A24u40_A14u32_B8_C8,
>> > +
>> > +	/* MTL OAM */
>> > +	XE_OAM_FORMAT_MPEC8u64_B8_C8,
>> > +	XE_OAM_FORMAT_MPEC8u32_B8_C8,
>> > +
>> > +	XE_OA_FORMAT_MAX	    /* non-ABI */
>> > +};
>>
>> If we support a query to get the supported OA formats, we can do away with
>> this.
>
>OK, yeah get using user_ext's.
>
>> Also thinking if we can provide the format definition in such a way
>> that UMD can just decode the counters from it with some generic code. That
>> way, we don't have to constantly keep updating UMD code for every new
>> platforms (may be far-fetched, but could save us a lot of
>> time). Thoughts?
>
>Ok, but I am not sure how to do this.

Just a thought, we can ignore that for now.

>
>> > +enum drm_xe_oa_property_id {
>> > +	/**
>> > +	 * Open the stream for a specific exec queue id (as used with
>> > +	 * drm_xe_exec). A stream opened for a specific exec queue id this
>> > +	 * way won't typically require root privileges.
>> > +	 */
>> > +	DRM_XE_OA_PROP_EXEC_QUEUE_ID = 1,
>> > +
>> > +	/**
>> > +	 * A value of 1 requests the inclusion of raw OA unit reports as
>> > +	 * part of stream samples.
>> > +	 */
>> > +	DRM_XE_OA_PROP_SAMPLE_OA,
>> > +
>> > +	/**
>> > +	 * The value specifies which set of OA unit metrics should be
>> > +	 * configured, defining the contents of any OA unit reports.
>> > +	 */
>> > +	DRM_XE_OA_PROP_OA_METRICS_SET,
>> > +
>> > +	/**
>> > +	 * The value specifies the size and layout of OA unit reports.
>> > +	 */
>> > +	DRM_XE_OA_PROP_OA_FORMAT,
>> > +
>> > +	/**
>> > +	 * Specifying this property implicitly requests periodic OA unit
>> > +	 * sampling and (at least on Haswell) the sampling frequency is derived
>> > +	 * from this exponent as follows:
>> > +	 *
>> > +	 *   80ns * 2^(period_exponent + 1)
>> > +	 */
>> > +	DRM_XE_OA_PROP_OA_EXPONENT,
>> > +
>> > +	/**
>> > +	 * Specifying this property is only valid when specify a context to
>> > +	 * filter with DRM_XE_OA_PROP_ENGINE_ID. Specifying this property
>> > +	 * will hold preemption of the particular engine we want to gather
>> > +	 * performance data about.
>> > +	 */
>> > +	DRM_XE_OA_PROP_HOLD_PREEMPTION,
>> > +
>> > +	/**
>> > +	 * Specifying this pins all contexts to the specified SSEU power
>> > +	 * configuration for the duration of the recording.
>> > +	 *
>> > +	 * This parameter's value is a pointer to a struct
>> > +	 * drm_xe_gem_context_param_sseu (TBD).
>> > +	 */
>> > +	DRM_XE_OA_PROP_GLOBAL_SSEU,
>> > +
>> > +	/**
>> > +	 * This optional parameter specifies the timer interval in nanoseconds
>> > +	 * at which the xe driver will check the OA buffer for available data.
>> > +	 * Minimum allowed value is 100 microseconds. A default value is used by
>> > +	 * the driver if this parameter is not specified. Note that larger timer
>> > +	 * values will reduce cpu consumption during OA perf captures. However,
>> > +	 * excessively large values would potentially result in OA buffer
>> > +	 * overwrites as captures reach end of the OA buffer.
>> > +	 */
>> > +	DRM_XE_OA_PROP_POLL_OA_PERIOD,
>> > +
>> > +	/**
>> > +	 * Multiple engines may be mapped to the same OA unit. The OA unit is
>> > +	 * identified by class:instance of any engine mapped to it.
>> > +	 *
>> > +	 * This parameter specifies the engine class and must be passed along
>> > +	 * with DRM_XE_OA_PROP_OA_ENGINE_INSTANCE.
>> > +	 */
>> > +	DRM_XE_OA_PROP_OA_ENGINE_CLASS,
>> > +
>> > +	/**
>> > +	 * This parameter specifies the engine instance and must be passed along
>> > +	 * with DRM_XE_OA_PROP_OA_ENGINE_CLASS.
>> > +	 */
>> > +	DRM_XE_OA_PROP_OA_ENGINE_INSTANCE,
>> > +
>> > +	DRM_XE_OA_PROP_MAX /* non-ABI */
>> > +};
>>
>> Wish we could replace the prop-value interface here. Most ioctls just use a
>> struct.  We could do so with some room for additional rsvd params or some
>> room for extensions similar to other interfaces here.
>
>Yes again use user_ext's for these.
>
>>
>> > +
>> > +struct drm_xe_oa_open_param {
>> > +	__u32 flags;
>> > +#define XE_OA_FLAG_FD_CLOEXEC	BIT(0)
>> > +#define XE_OA_FLAG_FD_NONBLOCK	BIT(1)
>> > +#define XE_OA_FLAG_DISABLED	BIT(2)
>> > +
>> > +	/** The number of u64 (id, value) pairs */
>> > +	__u32 num_properties;
>> > +
>> > +	/**
>> > +	 * Pointer to array of u64 (id, value) pairs configuring the stream
>> > +	 * to open.
>> > +	 */
>> > +	__u64 properties_ptr;
>> > +};
>> > +
>> > +/*
>> > + * Enable data capture for a stream that was either opened in a disabled state
>> > + * via I915_PERF_FLAG_DISABLED or was later disabled via
>> > + * I915_PERF_IOCTL_DISABLE.
>> > + *
>> > + * It is intended to be cheaper to disable and enable a stream than it may be
>> > + * to close and re-open a stream with the same configuration.
>> > + *
>> > + * It's undefined whether any pending data for the stream will be lost.
>> > + */
>> > +#define XE_OA_IOCTL_ENABLE	_IO('i', 0x0)
>> > +
>> > +/*
>> > + * Disable data capture for a stream.
>> > + *
>> > + * It is an error to try and read a stream that is disabled.
>> > + */
>> > +#define XE_OA_IOCTL_DISABLE	_IO('i', 0x1)
>> > +
>> > +/*
>> > + * Change metrics_set captured by a stream.
>> > + *
>> > + * If the stream is bound to a specific context, the configuration change
>> > + * will performed inline with that context such that it takes effect before
>> > + * the next execbuf submission.
>> > + *
>> > + * Returns the previously bound metrics set id, or a negative error code.
>> > + */
>> > +#define XE_OA_IOCTL_CONFIG	_IO('i', 0x2)
>> > +
>> > +struct drm_xe_oa_record_header {
>> > +	__u32 type;
>> > +	__u16 pad;
>> > +	__u16 size;
>> > +};
>>
>> Note to myself to ensure we are adding the header per read call now and not
>> per report.
>>
>> > +
>> > +enum drm_xe_oa_record_type {
>> > +	/**
>> > +	 * Samples are the work horse record type whose contents are
>> > +	 * extensible and defined when opening an xe oa stream based on the
>> > +	 * given properties.
>> > +	 *
>> > +	 * Boolean properties following the naming convention
>> > +	 * DRM_XE_OA_SAMPLE_xyz_PROP request the inclusion of 'xyz' data in
>> > +	 * every sample.
>> > +	 *
>> > +	 * The order of these sample properties given by userspace has no
>> > +	 * affect on the ordering of data within a sample. The order is
>> > +	 * documented here.
>> > +	 *
>> > +	 * struct {
>> > +	 *     struct drm_xe_oa_record_header header;
>> > +	 *
>> > +	 *     { u32 oa_report[]; } && DRM_XE_OA_PROP_SAMPLE_OA
>> > +	 * };
>> > +	 */
>> > +	DRM_XE_OA_RECORD_SAMPLE = 1,
>> > +
>> > +	/**
>> > +	 * Indicates that one or more OA reports were not written by the
>> > +	 * hardware. This can happen for example if an MI_REPORT_PERF_COUNT
>> > +	 * command collides with periodic sampling - which would be more likely
>> > +	 * at higher sampling frequencies.
>> > +	 */
>> > +	DRM_XE_OA_RECORD_OA_REPORT_LOST = 2,
>> > +
>> > +	/**
>> > +	 * An error occurred that resulted in all pending OA reports being lost.
>> > +	 */
>> > +	DRM_XE_OA_RECORD_OA_BUFFER_LOST = 3,
>> > +
>> > +	DRM_XE_OA_RECORD_MAX /* non-ABI */
>> > +};
>> > +
>> > +struct drm_xe_oa_config {
>> > +	/**
>> > +	 * @uuid:
>> > +	 *
>> > +	 * String formatted like "%\08x-%\04x-%\04x-%\04x-%\012x"
>> > +	 */
>> > +	char uuid[36];
>> > +
>> > +	/**
>> > +	 * @n_mux_regs:
>> > +	 *
>> > +	 * Number of mux regs in &mux_regs_ptr.
>> > +	 */
>> > +	__u32 n_mux_regs;
>> > +
>> > +	/**
>> > +	 * @n_boolean_regs:
>> > +	 *
>> > +	 * Number of boolean regs in &boolean_regs_ptr.
>> > +	 */
>> > +	__u32 n_boolean_regs;
>> > +
>> > +	/**
>> > +	 * @n_flex_regs:
>> > +	 *
>> > +	 * Number of flex regs in &flex_regs_ptr.
>> > +	 */
>> > +	__u32 n_flex_regs;
>> > +
>> > +	/**
>> > +	 * @mux_regs_ptr:
>> > +	 *
>> > +	 * Pointer to tuples of u32 values (register address, value) for mux
>> > +	 * registers.  Expected length of buffer is (2 * sizeof(u32) *
>> > +	 * &n_mux_regs).
>> > +	 */
>> > +	__u64 mux_regs_ptr;
>> > +
>> > +	/**
>> > +	 * @boolean_regs_ptr:
>> > +	 *
>> > +	 * Pointer to tuples of u32 values (register address, value) for mux
>> > +	 * registers.  Expected length of buffer is (2 * sizeof(u32) *
>> > +	 * &n_boolean_regs).
>> > +	 */
>> > +	__u64 boolean_regs_ptr;
>> > +
>> > +	/**
>> > +	 * @flex_regs_ptr:
>> > +	 *
>> > +	 * Pointer to tuples of u32 values (register address, value) for mux
>> > +	 * registers.  Expected length of buffer is (2 * sizeof(u32) *
>> > +	 * &n_flex_regs).
>> > +	 */
>> > +	__u64 flex_regs_ptr;
>> > +};
>>
>> We could just have n_regs and regs_ptr for the above struct instead of
>> breaking this down into mux, b and flex. The kernel implementation does not
>> care because it only checks for these.
>
>But the kmd checks for separate addr ranges for mux, b and flex? How to
>handle that if have just n_regs and regs_ptr?

The per platform ranges will still exist, but the registers will be 
compared against all ranges (mux can be compared against b and flex 
ranges. We don't have too many ranges to be concerned about the 
comparison overhead.

Well.. any changes would impact metrics scripts, so we can leave it as 
is.

Thanks,
Umesh

>
>> The metrics XML processing may need to be tweaked though. Worth it if it
>> simplifies the KMD code.
>
>Thanks.
>--
>Ashutosh
