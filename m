Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51783EEAA51
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 15:38:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1388610E577;
	Thu, 14 Sep 2023 15:38:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF9510E578
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Sep 2023 15:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694705886; x=1726241886;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=q/YBZEIF/bcAG0b7jnAzUJu6yYB42xoSI8eUumKWzAY=;
 b=gx1jnQ0tBS4x0vSF08C0yjfYlWHuQdgWMQcZyKmhxecMzO/j2UexMqrP
 O7Zh3leh2vwWKxCvBqBvTtl869ZfBJmCHZmOPOLWZ/bX3iBNUVrwJYeCZ
 498UKzUS82U+FrrN76TV+tl/5QusV93ypTBRQNEwCxIpx8uKiqfJ1OtHP
 +3XTEnKaQx9XWGAOR8Tj2J9mUAqwPrtr4Vo7Rr3PypUEYmYbKraZtzveZ
 E5yKuJU8O1Qq2Qc5Zpzb+lQh2OLm+KGFvLsapBmWdNWqCblrQfFiKLFk1
 7Fh/6EPV+lbkYCkEiZ1jxzHJFusqM6dJFFSDpxPB7w6kjNKE76/Gy2ESP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="377897178"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="377897178"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 08:38:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="991441925"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="991441925"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Sep 2023 08:38:04 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 14 Sep 2023 08:38:03 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 14 Sep 2023 08:38:03 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 14 Sep 2023 08:38:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bg4w3oHC7Ss8uiqzcdGE+mL2WE5qWawb3oMn3b0oIacki5KWod9uhHmlne7CYBGCBGm0tQNo7A8sSlXmUQrROMFsR4ofxq0gwJfHJQI8nlHU1QwAeJjAjdMRXbQU2HKBrqr0B0DvBTh8NEO4n0anBItfW60przVeL/0yJlRk5erLrPsc2zLao+a0UO1rswXSi0NstPwXS31xL7cgb+3UmTzceR6xXSEYkfbyjgCfYXViJ+rUGB8Ya39K37cX8Ppza2tV5LSEH1HDYfWaDOtV4CsNiSG5Yg47jloTdcPHVC5INqcYlTVEmmNie+7WNo2PzzJVNM9zUjw9rGNf/RUs/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+F3r0Ej1flpFaCE6NgojQ3WO08pfoAth2YHwLUruQ3I=;
 b=mjfuUFv8mYOed9xYKkqLwH1Cgfgi35kwNM0fYOSZ5/MZIgx9TMLELK5Wrp+YlEGbZugmNLgF8DtAEGkXBFJmGn5/7yshWIlHfZM+yCNRrsdj9bifpQ4tPz6XLRQhqJrsp2zTjiSeTlGpNSh49CycPYMWu7HOY+40pkM/G2YnvSMSRaABdX/jgiEpb226MFcEsgTswUTGBQidyYFTwOD/Fd/3r/5glBU72ckzVgn7vj36zpU2hKHXIwZKvJHmRldVRLjhVy/Rvpw2DtIVWu270dkhyivDlFDPK1dGVuAwfEb8guneLcHTQy6rnqv3W3zu9PsqDF8HU3c9QLGcRR9pJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB8740.namprd11.prod.outlook.com (2603:10b6:8:1b4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.36; Thu, 14 Sep
 2023 15:38:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 15:38:00 +0000
Date: Thu, 14 Sep 2023 15:36:56 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <ZQMomOHzr7afzfuh@DUT025-TGLU.fm.intel.com>
References: <20230913232837.2811049-1-daniele.ceraolospurio@intel.com>
 <20230913232837.2811049-2-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230913232837.2811049-2-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: BYAPR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB8740:EE_
X-MS-Office365-Filtering-Correlation-Id: c1720a01-abd7-4fcf-30ce-08dbb53893df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zf8etyOjMCCcf2DIiEMPtsfAxEQAoIu12WxYUo6UY02ok96eoZaSTx1C4kn6is3MKIR8rE9yiEYi0pUfgCJaYyuah40G5r38LllR7AIuoDV9wdSL7D/L+WpkFwqsf5makUe8XTHz3Qmwk6vu/3grZfG+iVu2Xhvp4yzNHBgMi3Lm58o2ZSUnaUY+fqihyfOdbGp5/szPxTPFXljr5EaDR1mRqYiTFZSZxRL1GDkt4TK/C7oYv4QcccR1QYVC2thcI3HTQ0KdlHq6z1z1vN+5AV1N/+S8RuM3LujoxdxNgZASDlKUt4FwP/f/JHUDX5QHmycCxXIyCMa88GRBEWlghBsTTBgFWa7ayw+f6NmbY9rYFRG0HOMmTMCGTSjFIxBOglTBtFW9wnluS6rhvnAOrlFG4cWYADpiC7KmPB/+oP6MpGT7YRl4zrjn1Aasu5AF4fUGrJFESjkaAq1oYJzxNyCameo6jmpvQ5cazufvzEPjYKqjtN/qYj5FThfuWwXbVnnoQ2sH9nIIa73dXPOortlQmyv8kw0br18TGrc5V5ZeFf/5w4C4HWrW9wN6cV6r
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(396003)(366004)(39860400002)(136003)(1800799009)(451199024)(186009)(107886003)(86362001)(83380400001)(26005)(6666004)(6506007)(6486002)(82960400001)(38100700002)(6512007)(2906002)(478600001)(5660300002)(66556008)(6636002)(8676002)(6862004)(66476007)(4326008)(44832011)(8936002)(316002)(66946007)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wnSZyyyW7UZ7gZaD66THcEFzv3MElg/j3YZGgiXA/tKk+X0ZuQJJ/QJNxtcw?=
 =?us-ascii?Q?BjDbcO6KIUO1CVJJ/FV3ub6kldb/zp7vtfkaNIIeLZrDEvXxoGETqUclMDWf?=
 =?us-ascii?Q?U0uLVEdedcpMA6Xbxz1gPHp7hSq25ShVvizqWvt2+ipFg0lXLZ+qNefaRocl?=
 =?us-ascii?Q?ROCXjf4IttwdgL+m7scURvnGG36tH/Py1DsrgNZD5mMMMX8+TAVS3Zv6ZLHy?=
 =?us-ascii?Q?BWfrUfoqg2wIfJM3InR97g5ayAxEsKW80tOswjKrngpCk6rroKsLQtH1x/8I?=
 =?us-ascii?Q?VH67utS6bl7Cbfrb692M1GtwSr9HS3+2fCv3/aseaof2gktMcoYQL+zhL44E?=
 =?us-ascii?Q?7CbB/tHZktPnSOVmqF6Oi/JSzMSlKSIY03IKOu76s8rIF/Ce4+VE42UFroZ4?=
 =?us-ascii?Q?Ec6Ak6Ilzkp16UUUSSUS7hvQumTc536LyervOAz6vs8veIH1jJEtcFq+HQkn?=
 =?us-ascii?Q?d1GJ6amlV5lTez/sihleL+2s4mNiQfYIhtEym66QSow0JqCIOZqGPiVduJQt?=
 =?us-ascii?Q?1fyNUnzJqE4LtqpXmxAh+RbguMWemMlAlPD7q+c/FARf3LNVV5RkyzrWr8MA?=
 =?us-ascii?Q?/H2e0V7I+rrAjk/O8YLRRBFhhKahfrhwPKxkCMZ44+Wqt+s6u8w8qNc8SccJ?=
 =?us-ascii?Q?Sxu8qY9Eni3tL9mZhIMlnyy0t3GVIFkLd+O3XaG+UaWiQxNMCQtPz+coazrc?=
 =?us-ascii?Q?0KlQD9MRSRvvkAHS8U1ZqKWZaemwU/JxiceLKvsAc2PzFRCQOyzgXQn84aF4?=
 =?us-ascii?Q?n3Q2KlF0/kp7Nc0jsZwgE9eC3pilMwvYJs5Dh7xas17V6Vp+ThyTDoBFTDCx?=
 =?us-ascii?Q?3XBQP740VwuIZKMK0R1Mpt0CkL0SeyA8J5Zp0h4bv11rY7F0Uy8tmRZDUVib?=
 =?us-ascii?Q?MxYuMj694ekxEq0r537bOO7i1W03kF35uP5UIlE4v+OvTbsHJQX5B4usTZ6P?=
 =?us-ascii?Q?HC7hgWv2HYv5HGLEfz18NaaZATgGb2PnjW99biPpGAbxKobUx5u/OzLGQyh1?=
 =?us-ascii?Q?TuU/TRK/fS8NfZq8E3K6MPgVkTVToYVl7Z3f1UW4krhDtfs7kLCFw2Fc43Ew?=
 =?us-ascii?Q?Pe7s3fhkE4+VZqqDiWdKFBsuIfOzcvA8KATua4sXC2ZF2hkTSnkl62X+YIqB?=
 =?us-ascii?Q?3HLibRLRLCz9ITzpDvZfu05hVEBSb+cERjZXcwwLo/j9LFXt6IzW9NFcUYCZ?=
 =?us-ascii?Q?RCUfF3EAEEmAJHlUE25c9uF7VqZWYMavmkfPOqH21uhb46K9cBHop9+a87H0?=
 =?us-ascii?Q?K57ZAdx/LH/MpJYoPiYjrye9Y6droVI4eFM8L66jqMq3BfF1ZluyCD1tnjuY?=
 =?us-ascii?Q?O2bKQwti9JoDe2G8CZ7m4sGHUPDx+U+eHXYtZy72oDlsc5VtIlevW2gSXpX4?=
 =?us-ascii?Q?oz65Q55RoDXWQjDVa0QH1vdoe+evENYDrri8Yhe4hv8fVfBDsYQuEXmDbpz3?=
 =?us-ascii?Q?d9rYM1CHMpVOINtihjZCG9qMAh94Jk1knKCoQFqjClPQqBniFuyQwcF1vxKk?=
 =?us-ascii?Q?dta10ZlgH9sYzO6t52tzb2gEmwAp884Ww1fOG6xjdV3snoLnT48H4KWXT+mb?=
 =?us-ascii?Q?2KI+l9uth8t3AdkTKsYOWvPB1Dz4eAmB+M4hHVrokvIKP3LW1709rcYwv36E?=
 =?us-ascii?Q?Ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1720a01-abd7-4fcf-30ce-08dbb53893df
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 15:38:00.8527 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WNgn5XIuX3M0ATBec3ulfajvmD48uQNwhxyo77Qp9h167ImuV8S6TH8KkqgJXtAaRlnwv8GirjUjw39OAhVaHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8740
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 1/3] drm/xe/uc: Rename
 guc_submission_enabled() to uc_enabled()
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

On Wed, Sep 13, 2023 at 04:28:35PM -0700, Daniele Ceraolo Spurio wrote:
> The guc_submission_enabled() function is being used as a boolean toggle
> for all firmwares and all related features, not just GuC submission. We
> could add additional flags/functions to distinguish and allow different
> use-cases (e.g. loading HuC but not using GuC submission), but given
> that not using GuC is a debug-only scenario having a global switch for
> all FWs is enough. However, we want to make it clear that this switch
> turns off everything, so rename it to uc_enabled().
> 
> v2: rebase on s/XE_WARN_ON/xe_assert
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.h     |  2 +-
>  drivers/gpu/drm/xe/xe_exec_queue.c |  2 +-
>  drivers/gpu/drm/xe/xe_execlist.c   |  6 +++---
>  drivers/gpu/drm/xe/xe_ggtt.c       |  2 +-
>  drivers/gpu/drm/xe/xe_gt.c         |  4 ++--
>  drivers/gpu/drm/xe/xe_guc_pc.c     |  2 +-
>  drivers/gpu/drm/xe/xe_guc_submit.c |  4 ++--
>  drivers/gpu/drm/xe/xe_hw_engine.c  |  4 ++--
>  drivers/gpu/drm/xe/xe_irq.c        |  2 +-
>  drivers/gpu/drm/xe/xe_uc.c         | 16 ++++++++--------
>  10 files changed, 22 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 71582094834c..c4232de40ae0 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -114,7 +114,7 @@ static inline struct xe_gt *xe_root_mmio_gt(struct xe_device *xe)
>  	return xe_device_get_root_tile(xe)->primary_gt;
>  }
>  
> -static inline bool xe_device_guc_submission_enabled(struct xe_device *xe)
> +static inline bool xe_device_uc_enabled(struct xe_device *xe)
>  {
>  	return !xe->info.force_execlist;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 6725157d8c1d..744be293fe37 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -585,7 +585,7 @@ static u32 calc_validate_logical_mask(struct xe_device *xe, struct xe_gt *gt,
>  	u16 gt_id;
>  	u32 return_mask = 0, prev_mask;
>  
> -	if (XE_IOCTL_DBG(xe, !xe_device_guc_submission_enabled(xe) &&
> +	if (XE_IOCTL_DBG(xe, !xe_device_uc_enabled(xe) &&
>  			 len > 1))
>  		return 0;
>  
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index ec33d57c60aa..5be7f53f023a 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -322,7 +322,7 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
>  	struct xe_device *xe = gt_to_xe(q->gt);
>  	int err;
>  
> -	xe_assert(xe, !xe_device_guc_submission_enabled(xe));
> +	xe_assert(xe, !xe_device_uc_enabled(xe));
>  
>  	drm_info(&xe->drm, "Enabling execlist submission (GuC submission disabled)\n");
>  
> @@ -373,7 +373,7 @@ static void execlist_exec_queue_fini_async(struct work_struct *w)
>  	struct xe_device *xe = gt_to_xe(q->gt);
>  	unsigned long flags;
>  
> -	xe_assert(xe, !xe_device_guc_submission_enabled(xe));
> +	xe_assert(xe, !xe_device_uc_enabled(xe));
>  
>  	spin_lock_irqsave(&exl->port->lock, flags);
>  	if (WARN_ON(exl->active_priority != DRM_SCHED_PRIORITY_UNSET))
> @@ -460,7 +460,7 @@ static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
>  int xe_execlist_init(struct xe_gt *gt)
>  {
>  	/* GuC submission enabled, nothing to do */
> -	if (xe_device_guc_submission_enabled(gt_to_xe(gt)))
> +	if (xe_device_uc_enabled(gt_to_xe(gt)))
>  		return 0;
>  
>  	gt->exec_queue_ops = &execlist_exec_queue_ops;
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 2f81aede1156..54baaffc7235 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -233,7 +233,7 @@ static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
>  		xe_gt_assert(gt, seqno > 0);
>  		if (seqno > 0)
>  			xe_gt_tlb_invalidation_wait(gt, seqno);
> -	} else if (xe_device_guc_submission_enabled(gt_to_xe(gt))) {
> +	} else if (xe_device_uc_enabled(gt_to_xe(gt))) {
>  		struct xe_device *xe = gt_to_xe(gt);
>  
>  		if (xe->info.platform == XE_PVC) {
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 5d86bb2bb94d..28b9a73d25e1 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -549,7 +549,7 @@ static int gt_reset(struct xe_gt *gt)
>  	int err;
>  
>  	/* We only support GT resets with GuC submission */
> -	if (!xe_device_guc_submission_enabled(gt_to_xe(gt)))
> +	if (!xe_device_uc_enabled(gt_to_xe(gt)))
>  		return -ENODEV;
>  
>  	xe_gt_info(gt, "reset started\n");
> @@ -642,7 +642,7 @@ int xe_gt_suspend(struct xe_gt *gt)
>  	int err;
>  
>  	/* For now suspend/resume is only allowed with GuC */
> -	if (!xe_device_guc_submission_enabled(gt_to_xe(gt)))
> +	if (!xe_device_uc_enabled(gt_to_xe(gt)))
>  		return -ENODEV;
>  
>  	xe_gt_sanitize(gt);
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 99d855680894..8a4d299d6cb0 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -816,7 +816,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>  	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
>  	int ret;
>  
> -	xe_gt_assert(gt, xe_device_guc_submission_enabled(xe));
> +	xe_gt_assert(gt, xe_device_uc_enabled(xe));
>  
>  	xe_device_mem_access_get(pc_to_xe(pc));
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index e928a20ba0cb..ac5fc2c797a7 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1135,7 +1135,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  	long timeout;
>  	int err;
>  
> -	xe_assert(xe, xe_device_guc_submission_enabled(guc_to_xe(guc)));
> +	xe_assert(xe, xe_device_uc_enabled(guc_to_xe(guc)));
>  
>  	ge = kzalloc(sizeof(*ge), GFP_KERNEL);
>  	if (!ge)
> @@ -1905,7 +1905,7 @@ void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p)
>  	struct xe_exec_queue *q;
>  	unsigned long index;
>  
> -	if (!xe_device_guc_submission_enabled(guc_to_xe(guc)))
> +	if (!xe_device_uc_enabled(guc_to_xe(guc)))
>  		return;
>  
>  	mutex_lock(&guc->submission_state.lock);
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 9c2e212fa4cf..a8681089fb60 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -434,7 +434,7 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  	if (err)
>  		goto err_hwsp;
>  
> -	if (!xe_device_guc_submission_enabled(xe)) {
> +	if (!xe_device_uc_enabled(xe)) {
>  		hwe->exl_port = xe_execlist_port_create(xe, hwe);
>  		if (IS_ERR(hwe->exl_port)) {
>  			err = PTR_ERR(hwe->exl_port);
> @@ -442,7 +442,7 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  		}
>  	}
>  
> -	if (xe_device_guc_submission_enabled(xe))
> +	if (xe_device_uc_enabled(xe))
>  		xe_hw_engine_enable_ring(hwe);
>  
>  	/* We reserve the highest BCS instance for USM */
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 1dee3e832eb5..ca98150a7dd1 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -129,7 +129,7 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
>  	u32 ccs_mask, bcs_mask;
>  	u32 irqs, dmask, smask;
>  
> -	if (xe_device_guc_submission_enabled(xe)) {
> +	if (xe_device_uc_enabled(xe)) {
>  		irqs = GT_RENDER_USER_INTERRUPT |
>  			GT_RENDER_PIPECTL_NOTIFY_INTERRUPT;
>  	} else {
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index a8ecb5c6e01a..5b7d6177c1c2 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -32,7 +32,7 @@ int xe_uc_init(struct xe_uc *uc)
>  	int ret;
>  
>  	/* GuC submission not enabled, nothing to do */
> -	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
>  		return 0;
>  
>  	ret = xe_guc_init(&uc->guc);
> @@ -66,7 +66,7 @@ int xe_uc_init(struct xe_uc *uc)
>  int xe_uc_init_post_hwconfig(struct xe_uc *uc)
>  {
>  	/* GuC submission not enabled, nothing to do */
> -	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
>  		return 0;
>  
>  	return xe_guc_init_post_hwconfig(&uc->guc);
> @@ -110,7 +110,7 @@ int xe_uc_init_hwconfig(struct xe_uc *uc)
>  	int ret;
>  
>  	/* GuC submission not enabled, nothing to do */
> -	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
>  		return 0;
>  
>  	ret = xe_guc_min_load_for_hwconfig(&uc->guc);
> @@ -129,7 +129,7 @@ int xe_uc_init_hw(struct xe_uc *uc)
>  	int ret;
>  
>  	/* GuC submission not enabled, nothing to do */
> -	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
>  		return 0;
>  
>  	ret = xe_uc_sanitize_reset(uc);
> @@ -175,7 +175,7 @@ int xe_uc_fini_hw(struct xe_uc *uc)
>  int xe_uc_reset_prepare(struct xe_uc *uc)
>  {
>  	/* GuC submission not enabled, nothing to do */
> -	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
>  		return 0;
>  
>  	return xe_guc_reset_prepare(&uc->guc);
> @@ -194,7 +194,7 @@ void xe_uc_stop_prepare(struct xe_uc *uc)
>  int xe_uc_stop(struct xe_uc *uc)
>  {
>  	/* GuC submission not enabled, nothing to do */
> -	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
>  		return 0;
>  
>  	return xe_guc_stop(&uc->guc);
> @@ -203,7 +203,7 @@ int xe_uc_stop(struct xe_uc *uc)
>  int xe_uc_start(struct xe_uc *uc)
>  {
>  	/* GuC submission not enabled, nothing to do */
> -	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
>  		return 0;
>  
>  	return xe_guc_start(&uc->guc);
> @@ -226,7 +226,7 @@ int xe_uc_suspend(struct xe_uc *uc)
>  	int ret;
>  
>  	/* GuC submission not enabled, nothing to do */
> -	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
>  		return 0;
>  
>  	uc_reset_wait(uc);
> -- 
> 2.41.0
> 
