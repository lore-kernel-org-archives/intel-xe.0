Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC67FC04A6A
	for <intel-xe@archiver.kernel.org>; Wed, 16 Aug 2023 15:58:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA53A10E385;
	Wed, 16 Aug 2023 15:58:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB71210E385
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Aug 2023 15:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692201478; x=1723737478;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SQKl8A54BXMiV/MjMgjbV9k3ml/g4boXeKG6KNu+WXg=;
 b=ZxapApQXmCHh2dQ1uhNXRWIVb9GJG1to9mZKRGqugE9DR3CBxyJxgftz
 oHFlMvaBMKRbYOV+qIJTbHtNjyJshEqxFFXKdxYlmYyzY0YDJP5p7J4yH
 WGLPmHFfPS57Hvv0lUioeFToutHXHiYkmZH4vIKlQiFpIjZXQAj4l3urA
 OjaoTsg3miISqmMuM2I5HyMw1W+gwjX9SCHn3KCa8cHpZgdeGQYpqSvCD
 lODhU6pGnzacaIwPoNV38ZhGshfbARxozBk6Ox//79WyeD40yEAKFVnUK
 kWGsd7neyNDLVCp5dfCN2pvKz57A7rnTAZ5a+sLGFueQdt8n4w9HpPWqi w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="376298112"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; d="scan'208";a="376298112"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 08:57:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="848530191"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; d="scan'208";a="848530191"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP; 16 Aug 2023 08:57:57 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 08:57:57 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 16 Aug 2023 08:57:57 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 16 Aug 2023 08:57:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GbLQe4Mh+YihIkGgh/+eM5ZalcdouC7k9la3WeJjSWDq1ag0+vlftV7UGKidrArrpkFsWscL4SzEMUqQESEXG/WrA/Rvkm+fl1EftQZJ/GDY4NUBN2hcDowaKU7CmXl9/vDPFpZOM6TM5RtkNCbKq21sQnDM5vnLlEQSQDPD7zfLrU8prpsZH4XlyrPpCkuIrunI/8YjlwQvhtOIla/ZhDXYToihVIdT3LLNKG5i9ODOGa7xfCC1f1uXBim3HIz+24vPv4b4JvEQEYStL82/McZEFJ4xLX9XiTm1Cvxnroqp4O7C8CbXQcEdGl8FGAcZrXwudjOh4xOVs7kAzZRrMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CwPXx2Xe7OueBESEXUMk3zTMo9aGXw8yQnqK63HemX4=;
 b=br4dR59OGSgb0C0DXwWlDvFTCTrZ7AsYikYiiPmySPsWPHRyIpGfw5WkzBBF01ZDQHiL1AVyz06kcLJK2eibydqeOh0A+Opp/c6Fxocq1EMtcuOjhsrsuaE+Q/h7C9Tx7AfvOCaK3r62zr/1xwuhQb88yGXCNh+ZH6y3Pf1Rv/zP1hTKS8wsRhm6RP2HZBuIJM8EkSfzECjA6HSv0k/FuQEQp+Cdtmqf7WUjxpHw4bsdTgi/65nzJVSAqudt3DrsvzyeCho0J5jZJ1KlRX2BPGZAN2m7lHzZSS84iNAWW7MWVZrE/s/ZMTnOuKzTUvBDCvysfe754cmVPpVf7xfz2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by PH8PR11MB6778.namprd11.prod.outlook.com (2603:10b6:510:1c9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.30; Wed, 16 Aug
 2023 15:57:55 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::f7ed:4327:5d1a:b8fc]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::f7ed:4327:5d1a:b8fc%4]) with mapi id 15.20.6678.025; Wed, 16 Aug 2023
 15:57:55 +0000
Date: Wed, 16 Aug 2023 08:57:51 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Message-ID: <ZNzx/8KeURxfO8ue@nvishwa1-DESK>
References: <20230816115238.2340-1-niranjana.vishwanathapura@intel.com>
 <20230816115238.2340-3-niranjana.vishwanathapura@intel.com>
 <439234fc-4dcc-4f60-b71e-32e1be96d1b5@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <439234fc-4dcc-4f60-b71e-32e1be96d1b5@intel.com>
X-ClientProxiedBy: SJ0PR05CA0161.namprd05.prod.outlook.com
 (2603:10b6:a03:339::16) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|PH8PR11MB6778:EE_
X-MS-Office365-Filtering-Correlation-Id: 64fce3db-7204-4ec4-d8bf-08db9e718de0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IIiG2bHpvytzOiBihrOwQEK541W1m64VFbNoyHj2u/eZN4QZ5vjD8mN6mPfGDKQsqdu1HintKy+KylMlZNnVRKQ+QNAR6y9ORfa1GAFTm92bJhYUHQ7dwiw2u+sfmV6/FHiqOTcpdyBmUCd6tNxLcAiJmRHsEKJPSfzhm86lreheHtrvFvx/U5uxP3WcSKUd66FdP4LhslcL8MGZY+FzQGN8PQJCv7rK08Fjr1CMijgBBEDKQ9vN/sx3EALBqU+Pa5JuDgVxmgBQ6z4B4C2lFv8ykver3auDn3DJ6kfqcukiv3Mb3C/ZinJblfuuKmenshJfKyrkQoXldDwMYYakgY9GNc+7uYj7MM4WdjYa9WUeAsR1DKHqcEN3ABoUjv2sWJh5CI9NjW7H52Yto1II3SNwt5l+eUjcU74RNwWKAmm3V6JrFArghNCl6V5BYWmfOskgS7zSPhkPSPMMGLU/7yatcOfr1u3Ba7p8FLvh/r/VtGCFhAsRDJKTQR6xSf5AiJBVhcxGHJNkWtTULxUZsDRm3Kn+fl+I8eFmPMVG0+pZQKFQNpRwOIbi0i7cmUtC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(39860400002)(396003)(136003)(366004)(346002)(1800799009)(186009)(451199024)(38100700002)(66946007)(66556008)(66476007)(6636002)(82960400001)(316002)(478600001)(2906002)(41300700001)(8936002)(8676002)(6862004)(4326008)(83380400001)(5660300002)(6512007)(9686003)(6486002)(6666004)(6506007)(53546011)(26005)(44832011)(86362001)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xTeJwWKG5xbZ9ckvpsr5PDkH4hiuy7EqnonxDnVqlgmiqwf1yhf/FxVhqNEN?=
 =?us-ascii?Q?oJHM7kCUz28LDTHDlVjo9SY5hrN3Wt7LwoWCG/Hxek/UAQzR4DWguNaZ1BKA?=
 =?us-ascii?Q?nTFAjOIMU0LUxWbFFw9sSORyksK3ONjs4Ft8qryiE0mbsfIHs/9wBF9HfTz8?=
 =?us-ascii?Q?U04XnkHq//sjQ5fb+pFNtounMUYtxyInBME/7SlwfnLZgHpVjfiW3znQpSLt?=
 =?us-ascii?Q?xBSUDDRiFIdJwzlyjsvvbrlz+pwfZoN6UmuY/QXEYlMu18BBu/OcVJ630Ota?=
 =?us-ascii?Q?X6LlSGA1Xs6zrPqYuwpphARszuXhg6zQ1w51QHSwN89FEG+4avaayaIvIXHj?=
 =?us-ascii?Q?eT8pBQWyw6hhCi7ZP3XTw1t1Bi7yDPd4ZZmbBlUiEcvERvVOaqd8TsCLjtTD?=
 =?us-ascii?Q?unoosRVCgfLFrnCnTG47uXZBP40xGFbjLkZqJRVwCuHXl8tE8BbRSQ7utmBa?=
 =?us-ascii?Q?brftRzWGyWMyIz6/iK12+riLBe1zKJgP9bkuUORwHv9Iopgi7C4rYVFZE8bA?=
 =?us-ascii?Q?JDeVTcMgbkIUcdkzHhsWkbMu4vwPBtyC4D2D67qzPhQUnGR0KrH3qWLf9xNn?=
 =?us-ascii?Q?G95+hFBFaaEZ408JSAXOKX2bQDwqA5U5r/x84Am+k2dPr73xR6ER38Jrs+aV?=
 =?us-ascii?Q?vLJ6tN98JYVhhgY/iH62Hpz2z2z6NU2/yIdAnFsjYXjIm6AsyxuWjEat/8Kx?=
 =?us-ascii?Q?dafTB8iT0xQByro66roxb9wC7BbMyhJwv4UE3kxfUlvU5Xp5EViM4T/rP3zY?=
 =?us-ascii?Q?I88gEakYJLBuymO3orbJUy1e6QcDdSqMzuqY/ln0dG6RxU8dTfMkUYtrjChU?=
 =?us-ascii?Q?so9dpjKwKqs4exJtt5gm8Vi4Ai1xDBiqVhFUZE4sCPFU6So8SPduJEMqO6vS?=
 =?us-ascii?Q?FxaOO98hkifpHTVvRfB3034n88YHRbJDJHeJ60UZNVX9Tr0rmLUNiSN1jnOM?=
 =?us-ascii?Q?4uAxuNnSszM58M6nwEbL8HL3nTAqlnkijv5opNNel+GdA7NUJ/eYnVgk2He+?=
 =?us-ascii?Q?Ud2NU9wckpdLTgbG7HKwdWBslCW9LBUYno3ZNpTPJK/8p1b2Dx1jOsP3+rdR?=
 =?us-ascii?Q?fmmqlzwFUFnBPI1ONyv0NpLKgxt4qokys6I0Sz83y1bGamhyGApFwBQ1ff1D?=
 =?us-ascii?Q?RPAfdw0lpgPRTFqptcHHdP1b/omEBIS75xjHnMfbbR9b6ugGSCx0Mm3lNgp1?=
 =?us-ascii?Q?Rv3zXJOmfhiihUhIS1zUxnt5D/OMuba6HInUdXHQH8k962dQsAwWEGmJfydQ?=
 =?us-ascii?Q?EtYT2u23e+lY0Rs3w085IkNxMuvPvDU/WA5J4GE7Gs3L4VI4yxxeO93OGFBT?=
 =?us-ascii?Q?cq+M9ySs67H0ZCearhgDvVnVRFA4ER0+X+NyGt+vZhWM6pj8xXdLWi/xFyWo?=
 =?us-ascii?Q?nSBOV/pdHtfNZvEDESOtCK+j5oijeD4/F/UadsX3yOVszM8PYNd6vSoPOJX9?=
 =?us-ascii?Q?ZvK7Um3Z4h38uSPtsPZtIhSZ3W3vYxp8QegIMeJoOH54jACHScXUregn0Atl?=
 =?us-ascii?Q?GGiRUuvWqrsulf57SCuIBhMEr2ZkIh2IgSgLYbU+NnSoS8Y2HT5tJIfc80NI?=
 =?us-ascii?Q?4B4I0mDH2DpoRTgKn0T9/eCbpxXMzRmA188GLI14N5Y+lxH7wmkTAWRYpLrC?=
 =?us-ascii?Q?qkjQThSaa/0zv1qXs/QvzX0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64fce3db-7204-4ec4-d8bf-08db9e718de0
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 15:57:55.3028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0wH9PzmWJANZfmnfoh2E9tC4c5GzyNB46tShRGKYrLp+PAgSEWxYUWJ2UPViSEuX+g1y57FTgkhKAeOAuFbAdWxgGOZAliXd8BkCgM+RODVattQNnrqM21/QLztAyoUq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6778
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 2/2] drm/xe: Add
 CONFIG_DRM_XE_PREEMPT_TIMEOUT
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

On Wed, Aug 16, 2023 at 09:18:12PM +0530, Ghimiray, Himal Prasad wrote:
>   Hi Niranjana,
>
>   On 16-08-2023 17:22, Niranjana Vishwanathapura wrote:
>
> Allow preemption timeout to be specified as a config option.
>
> v2: Change unit to microseconds (Tejas)
> v3: Remove get_default_preempt_timeout()
>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/Kconfig.profile | 11 +++++++++++
>  drivers/gpu/drm/xe/xe_hw_engine.c  |  5 ++++-
>  drivers/gpu/drm/xe/xe_hw_engine.h  |  5 +++++
>  3 files changed, 20 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/Kconfig.profile b/drivers/gpu/drm/xe/Kconfig.profile
> index 9ad487647ca1..a3655ee6978e 100644
> --- a/drivers/gpu/drm/xe/Kconfig.profile
> +++ b/drivers/gpu/drm/xe/Kconfig.profile
> @@ -22,6 +22,17 @@ config DRM_XE_TIMESLICE_MIN
>         help
>           Configures the default min timeslice duration between multiple
>           contexts by guc scheduling.
> +config DRM_XE_PREEMPT_TIMEOUT
> +       int "Preempt timeout (us, jiffy granularity)"
> +       default 640000 # microseconds
> +       help
> +         How long to wait (in microseconds) for a preemption event to occur
> +         when submitting a new context. If the current context does not hit
> +         an arbitration point and yield to HW before the timer expires, the
> +         HW will be reset to allow the more important context to execute.
> +
> +         Value should be within the DRM_XE_PREEMPT_TIMEOUT_MIN/MAX limits.
>
>   Is there plan to make this config dependent on
>   CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN/CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX ?
>

No, it can be independently set. The _MIN and _MAX can also be independently set.

>   If not, value should be within
>   XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN/XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX.
>

Yes, the patch includes a BUILD_BUG_ON() to ensure that.

> +         This is adjustable via XE_ENGINE_SET_PROPERTY_PREEMPTION_TIMEOUT.
>
>   If IIRC ioctl calls names are changed from XE_ENGINE_* to
>   XE_EXEC_QUUEUE_*. Please confirm.
>
>   And this statement seems misleading, ioctl call will set the properties
>   for specific exec_queue and config is meant to be for all exec_queues
>   unless changed by ioctl.
>
>   IMO better description will be "preemption property for exec_queue can be
>   adjusted by XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT" or we can skip
>   this
>
>   info altogether in kconfig because ioctl description might be already
>   covering it.
>

Yah, the for to change the name from Xe_ENGINE* to XE_EXEC_QUEUE.
Yah, makes sense to remove that line altogether. Will post a fixup patch.

Niranajna

>   BR
>
>   Himal Ghimiray
>
>  config DRM_XE_PREEMPT_TIMEOUT_MAX
>         int "Default max  preempt timeout (us)"
>         default 10000000 # microseconds
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index c44540684462..4c812d04e182 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -370,7 +370,7 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>                 hwe->eclass->sched_props.timeslice_us = 1 * 1000;
>                 hwe->eclass->sched_props.timeslice_min = XE_HW_ENGINE_TIMESLICE_MIN;
>                 hwe->eclass->sched_props.timeslice_max = XE_HW_ENGINE_TIMESLICE_MAX;
> -               hwe->eclass->sched_props.preempt_timeout_us = 640 * 1000;
> +               hwe->eclass->sched_props.preempt_timeout_us = XE_HW_ENGINE_PREEMPT_TIMEOUT;
>                 hwe->eclass->sched_props.preempt_timeout_min = XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
>                 hwe->eclass->sched_props.preempt_timeout_max = XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX;
>                 /* Record default props */
> @@ -562,6 +562,9 @@ int xe_hw_engines_init_early(struct xe_gt *gt)
>         read_copy_fuses(gt);
>         read_compute_fuses(gt);
> 
> +       BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT < XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
> +       BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT > XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX);
> +
>         for (i = 0; i < ARRAY_SIZE(gt->hw_engines); i++)
>                 hw_engine_init_early(gt, &gt->hw_engines[i], i);
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
> index 3d37d6d44261..71968ee2f600 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> @@ -30,6 +30,11 @@ struct drm_printer;
>  #else
>  #define XE_HW_ENGINE_TIMESLICE_MAX (10 * 1000 * 1000)
>  #endif
> +#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT
> +#define XE_HW_ENGINE_PREEMPT_TIMEOUT CONFIG_DRM_XE_PREEMPT_TIMEOUT
> +#else
> +#define XE_HW_ENGINE_PREEMPT_TIMEOUT (640 * 1000)
> +#endif
>  #ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
>  #define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
>  #else
