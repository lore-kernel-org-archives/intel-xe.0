Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C813FC001B0
	for <intel-xe@archiver.kernel.org>; Mon, 14 Aug 2023 15:01:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B0710E052;
	Mon, 14 Aug 2023 15:01:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0162210E052
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Aug 2023 15:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692025315; x=1723561315;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OIPr5nP3asc8pzbZQiB95Dp7qEBrEd0yo89683ISBuU=;
 b=DhJHFr7bI0xkhSq/Ag/HcTKX8Cr80AkzgNBtZSIOOeMu1jA08VqOBUFt
 FazWjg/2rJkLDIZMdmf8VyhnRZJSofISeE3ALlpr8bwASyfyLN5Gwbz5U
 U7PeTC6fITDHEqSwuEr41ud1VNcYUoDG+xNGBKqAyY2NKmpwnse63S7Ad
 ieZJNsPfhGvw4pLAmhiqYrqCl9Rem9tfw3q49S0BV40zLNbzOdg6hYWc1
 Hp449j/S/+EGqw3j8j5P66bmoTU0d7R8GO2JfqLRugIfv9VRaBXRYoafJ
 drE/F1HJTQ6FoaVNOA9+hXxWEABJRRO8FZ7QhQby0zBqg7rty9kcjNzfo w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="351653097"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; d="scan'208";a="351653097"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 08:01:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="876964204"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP; 14 Aug 2023 08:01:28 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 14 Aug 2023 08:01:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 14 Aug 2023 08:01:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 14 Aug 2023 08:01:23 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 14 Aug 2023 08:01:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SbjNYPCDQTsvgmRiXl3S/71DYLhATZfU5+AB9H7ZwYSVI81gX5H6Xmu+LnbCI5FdNPOmX017xjaHVACG1ulI7eU++eR9SVM/k7QfA6yX/08qpZQAO4cytxXImrDP9f1Kt8W3Dd8zWmWPMpnjWppdqklWoO6NRIq2TDCahi8eNVHO9ng92eeV4jMPDFSva8G5WyaZwYKjDtiJed+gWDmVrgmSWGmS0BN6qSSlRBsF4PNOhZy7ITkbGZWi0pMBSBFTqxGQx7Z/Ve3NdzrOAx+zE8XeXC1IXwizXQwrrddDbyk1O8OzxJdORr5YepEIpQGrUg3gjk5Re6OdW0z2dULlyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5KM3TjdAwTkHBhmyTvJOs4M2B+8mDWyJcX809JwbjuM=;
 b=kplOXHbn84CPl5oaXtg9RFr0DDs4uGH0EK2hfaqnaMKk9BslA9xJW+1867UgsyxAhubYyZ6nrEucdRs/LcnnAEHme5v9Pw91rlMLdLEnSHVH5KMeKK2Ano7dgQkznLaiYqsNvy639xAeByNE8QtCqelN7UrkocuCb7EnpMUeOiy3XUTWkB/AiiREAanzLyzMeUKwdcnf8O4Zt4Yq9/kxQX9tyhP5oWyaFq5k5BrRarb4szrGT7C0bKLLgSO/Twyu+w0z6uJ07+umRF6dO+6pdwr9Phj6JSxiQHG+ABV8RaaZPESwoSGKXPsFkHab6Y5KPk0o5gsO7q9xoGYEPjL4tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by CY5PR11MB6533.namprd11.prod.outlook.com (2603:10b6:930:43::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.20; Mon, 14 Aug
 2023 15:01:17 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::f7ed:4327:5d1a:b8fc]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::f7ed:4327:5d1a:b8fc%4]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 15:01:16 +0000
Date: Mon, 14 Aug 2023 08:01:13 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Message-ID: <ZNpBuVWQWLTukMxm@nvishwa1-DESK>
References: <20230808182411.31354-1-niranjana.vishwanathapura@intel.com>
 <20230808182411.31354-3-niranjana.vishwanathapura@intel.com>
 <SJ1PR11MB62040FD4DDBB81A598E7E9678111A@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB62040FD4DDBB81A598E7E9678111A@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY3PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::26) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|CY5PR11MB6533:EE_
X-MS-Office365-Filtering-Correlation-Id: 6318f6e9-6335-4fa6-917b-08db9cd74f29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J+w3mg5znsbZvEYbEYZK/VvvCE7di1iA4d6ZuA+UOcEaFYFfUlijQmnPpe8g17+88gMZKKEeJDjhDapBuo/oww1+0nu9OKwzQg9DMTUY05Fy+UZIur22/7c0tuDaw6nEecoOdY1BxN+5lqv1WVfEcicbqBPAMSIVQqbD3vtGU7ozSSk/pBKccWUIzRy739hNN8DlqQHp5IebnoauIyD4NOmTa2caAh1BjAr0MhYGGaMIjsJ8QD874M6zcRsbXercICuBDSayql8yKREe3y2G4TYZQe+T8TujOTIUxxn8MdQ46gj3KlVZ0PW56Xka3/BLg8mr2MburrrGdoe7Y39i/Q4bsPHVJre+SetRxMhQvi9T04XxfvPzJeQSNCXLV4vazAq0yyiqF0xeSGR7Rulna5gTbdMYtixIWqC3eyucC+m6m3fVOtobCGSKzxiqzHM8g5VRf+6COGCMd0JHH/NFXaoqA0RxKpMtlNKnggF6UjnYBiIaGmOeT5ne5Sx2lEBPBlwo8z6QsDzj68bi7C5MeWGkh8c+McNOn4kryfaPgAV3lWW/YFH+7xp0QBLKSeMz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(39860400002)(136003)(396003)(366004)(346002)(1800799006)(186006)(451199021)(83380400001)(66946007)(66476007)(9686003)(478600001)(86362001)(6506007)(54906003)(53546011)(316002)(2906002)(6636002)(26005)(66556008)(41300700001)(44832011)(6486002)(107886003)(5660300002)(6666004)(33716001)(6512007)(38100700002)(8936002)(82960400001)(6862004)(4326008)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1P+ZQe5GekZmEREx0gqUvik6BHCfqg8d4fQhsZfUEFenUDaQi69sPQCeaXbG?=
 =?us-ascii?Q?YSWLIr3cGR0dxAA8pPtm8SXwDoQ7qvJuCz2jSu98J8tyKYRRHd/8OcOMbKS0?=
 =?us-ascii?Q?fh1yrPUQ2p1/TNMy8Tdm+i0DOYHledfOvJmoxgoR4OaUgpN/bfoGSZE9Jm9J?=
 =?us-ascii?Q?s3pijnVhS2Q71LwtXtom8i6L491b4SJS7BNrE/jWPTF6XzTpjTxP3DIcV/9l?=
 =?us-ascii?Q?7me/b6p70XUasoCbnIzrBw4ZxAbNzEsAQcArlXWER5gTkFVsZKF7Ys+heDmL?=
 =?us-ascii?Q?PPOBblU8nviiLraD7nKXRlUwNUXo9b59dSFAGACuDPXOMkC7lJhzdYS3s7P2?=
 =?us-ascii?Q?zuutHJW2YZ+C3CFJerQ7NqiarDNuxmE0QIPER+ELx2/9E0Uy6TXUkK3AZMtb?=
 =?us-ascii?Q?OwPd4/Fego59Bm5ZQGV6WYFp40EvLHYLd1stGAbZNI9QIUO2x168LQ++9qLr?=
 =?us-ascii?Q?h+mH9HAnMRt9/+wDLAm2gxDCovPbf6cgdy3ZyRXcXB3DwjdcJHY143eZ/r3D?=
 =?us-ascii?Q?ZfBymtWfSjzuyWXHYj0Ya1aRq5ZQJwBqJTcoTcGHKryIumx58QezIoTqjsjP?=
 =?us-ascii?Q?FLofdgLGoNSnXrgGuO8Ueg06VgdFgdS5JB3/UTju69BGdthR9BbBD+GANFOB?=
 =?us-ascii?Q?zPhqFjyIkNnQ+trABtkxCRj6DGmvk1haqLZn8oDCCFz6APCu+XKf5mR+lLxL?=
 =?us-ascii?Q?d9QDNbfh8spDBkkJ8PgRzci+jRlxNQQ9qdfUDWARwA2YSMd/k47HGumMiaRU?=
 =?us-ascii?Q?cf9nhNNtO3pPK3OWVQtocYqQgAj616KP9A1IusSyt8QwPSC+KOi5YH4gZrDN?=
 =?us-ascii?Q?A03EnMhfL1Y3lSlNIGbT3e0MlixiI+ufu5E8Haf1qx+spkp0u89LUCBHBjql?=
 =?us-ascii?Q?Ty6FijZj47LhHUf8Dpw91BjS4ng3Y/Pgc6OHxF0VfpNuKZaMgW3CdvevtBQp?=
 =?us-ascii?Q?jmpnyReUPq9oA6H3grPQlygzghr/vLVaOlyo+rRuT/qGOeO6yX8jUGJlmPmy?=
 =?us-ascii?Q?t9nR0iroGwlhlEdBocgNRO6GntLfizQjcPp/FI8b4ohCcgfuIU/3T5l9FfQi?=
 =?us-ascii?Q?BK1vH6peqyJler2p2/nz37DzjxorMnJXLNhD6rH3PgBv15S5NvOQXH9UtWLY?=
 =?us-ascii?Q?mRX4G6w6TcDg6e/t9jMIakR1Ip0tvDZaBIiQlDv8lOAfF4cMBPGcw9ToMVp9?=
 =?us-ascii?Q?TMwZjJzt+HGqX0lelbY7j1WViSmiGmXwQle3dlHXoU4zdrX13UT7aaeTrzot?=
 =?us-ascii?Q?OwHal1rnK9IavWw67bhLgdlKJkr5Qn8GdTlxC07f1EIVKoPaYUef9WObkM02?=
 =?us-ascii?Q?0dxxbJuM2LGQBX+TP5E5or6oZ0EFqckGN8FLjdKImkTYsRYuYTaJ7Y70E8cP?=
 =?us-ascii?Q?0YlNXPybHJ2m56ZIjTRjFaodF6SJl2vILeXU0mA2+zOWNoMsgjmrMmtMI994?=
 =?us-ascii?Q?oOn6GLFAd/94QWFbJruVUvLmH2+L3usvZwzsmchpr84Pnc30bvR9f9QnuvUp?=
 =?us-ascii?Q?6JGs7w7elnlCMYe4Clc1cCJi8GdKsms0+uVa72jvsWj5TAKudEHygkfnYLfB?=
 =?us-ascii?Q?fCty1PAejkRyh59xRrNZLGEw/uxw6WfPvlLYiTrQWH+dwWs+/uEbP7m1Z9LB?=
 =?us-ascii?Q?oblxEV3dlUUubQKXea3nwOA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6318f6e9-6335-4fa6-917b-08db9cd74f29
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 15:01:16.4312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GU+w973xwXjAWtwJHpdWss3CcF4+WaNro7upOj65DkZR21wVMGdf9uCEnvj2NBqnPcgWJr/P8XK0abgsN3NjdjUPOKpiAep0iEPfUGlSwIJ7glIJekR45NiPaz/46RrR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6533
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/4] drm/xe: Add CONFIG_DRM_XE_PREEMPT_TIMEOUT
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Aug 11, 2023 at 11:57:31PM -0700, Upadhyay, Tejas wrote:
>
>
>> -----Original Message-----
>> From: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
>> Sent: Tuesday, August 8, 2023 11:54 PM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Harrison, John C <john.c.harrison@intel.com>; Upadhyay, Tejas
>> <tejas.upadhyay@intel.com>
>> Subject: [PATCH 2/4] drm/xe: Add CONFIG_DRM_XE_PREEMPT_TIMEOUT
>>
>> Allow preemption timeout to be specified as a config option.
>>
>> Signed-off-by: Niranjana Vishwanathapura
>> <niranjana.vishwanathapura@intel.com>
>> ---
>>  drivers/gpu/drm/xe/Kconfig.profile | 11 +++++++++++
>> drivers/gpu/drm/xe/xe_hw_engine.c  | 10 +++++++++-
>> drivers/gpu/drm/xe/xe_hw_engine.h  |  5 +++++
>>  3 files changed, 25 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/Kconfig.profile
>> b/drivers/gpu/drm/xe/Kconfig.profile
>> index 9ad487647ca1..06742e192206 100644
>> --- a/drivers/gpu/drm/xe/Kconfig.profile
>> +++ b/drivers/gpu/drm/xe/Kconfig.profile
>> @@ -22,6 +22,17 @@ config DRM_XE_TIMESLICE_MIN
>>  	help
>>  	  Configures the default min timeslice duration between multiple
>>  	  contexts by guc scheduling.
>> +config DRM_XE_PREEMPT_TIMEOUT
>> +	int "Preempt timeout (ms, jiffy granularity)"
>> +	default 640 # milliseconds
>
>Why cant we represent this in us unit? At least it keeps uniformity with other code.
>

Thanks Tejas for the review.
Makes sense, will change.

>> +	help
>> +	  How long to wait (in milliseconds) for a preemption event to occur
>> +	  when submitting a new context. If the current context does not hit
>> +	  an arbitration point and yield to HW before the timer expires, the
>> +	  HW will be reset to allow the more important context to execute.
>> +
>> +	  Value should be within the
>> DRM_XE_PREEMPT_TIMEOUT_MIN/MAX limits.
>> +	  This is adjustable via
>> XE_ENGINE_SET_PROPERTY_PREEMPTION_TIMEOUT.
>>  config DRM_XE_PREEMPT_TIMEOUT_MAX
>>  	int "Default max  preempt timeout (us)"
>>  	default 10000000 # microseconds
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c
>> b/drivers/gpu/drm/xe/xe_hw_engine.c
>> index c44540684462..25bad007a85b 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> @@ -338,6 +338,11 @@ hw_engine_setup_default_state(struct
>> xe_hw_engine *hwe)
>>  	xe_rtp_process_to_sr(&ctx, engine_entries, &hwe->reg_sr);  }
>>
>> +static u32 get_default_preempt_timeout(struct xe_hw_engine *hwe) {
>> +	return XE_HW_ENGINE_PREEMPT_TIMEOUT;
>> +}
>> +
>>  static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>>  				 enum xe_hw_engine_id id)
>>  {
>> @@ -370,7 +375,7 @@ static void hw_engine_init_early(struct xe_gt *gt,
>> struct xe_hw_engine *hwe,
>>  		hwe->eclass->sched_props.timeslice_us = 1 * 1000;
>>  		hwe->eclass->sched_props.timeslice_min =
>> XE_HW_ENGINE_TIMESLICE_MIN;
>>  		hwe->eclass->sched_props.timeslice_max =
>> XE_HW_ENGINE_TIMESLICE_MAX;
>> -		hwe->eclass->sched_props.preempt_timeout_us = 640 *
>> 1000;
>> +		hwe->eclass->sched_props.preempt_timeout_us =
>> +get_default_preempt_timeout(hwe);
>
>I don't see purpose of using this API, also adding hwe argument does not seem to be any useful.
>

AFAIK, the norm followed in a patch series is to introduce required functions
early in the series so that there is no deletion of added code later in the
series. Also, it is a static function not an API. Will make it inline.

Niranjana

>Thanks,
>Tejas
>>  		hwe->eclass->sched_props.preempt_timeout_min =
>> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
>>  		hwe->eclass->sched_props.preempt_timeout_max =
>> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX;
>>  		/* Record default props */
>> @@ -562,6 +567,9 @@ int xe_hw_engines_init_early(struct xe_gt *gt)
>>  	read_copy_fuses(gt);
>>  	read_compute_fuses(gt);
>>
>> +	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT <
>> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
>> +	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT >
>> +XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX);
>> +
>>  	for (i = 0; i < ARRAY_SIZE(gt->hw_engines); i++)
>>  		hw_engine_init_early(gt, &gt->hw_engines[i], i);
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h
>> b/drivers/gpu/drm/xe/xe_hw_engine.h
>> index 3d37d6d44261..582be209355b 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
>> @@ -30,6 +30,11 @@ struct drm_printer;
>>  #else
>>  #define XE_HW_ENGINE_TIMESLICE_MAX (10 * 1000 * 1000)  #endif
>> +#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT
>> +#define XE_HW_ENGINE_PREEMPT_TIMEOUT
>> (CONFIG_DRM_XE_PREEMPT_TIMEOUT *
>> +1000) #else #define XE_HW_ENGINE_PREEMPT_TIMEOUT (640 * 1000)
>> #endif
>>  #ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN  #define
>> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN
>> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN  #else
>> --
>> 2.21.0.rc0.32.g243a4c7e27
>
