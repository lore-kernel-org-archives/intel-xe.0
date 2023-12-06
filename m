Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F046DC4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 14:55:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D1DA10E737;
	Wed,  6 Dec 2023 14:55:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F2910E737
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 14:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701874547; x=1733410547;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NFWosxg5PrnM7PRpFfptNPhk3N1v8oK9ZPtzqzRnOug=;
 b=F5W7+yyXMdGxZvBRltw9wib1da4eh086K8PeCbW3ryBse7MfYhpld2r4
 oyrETDC4yALhiCgMElMI/vgyJKYwSfu4jSE9kpQR+2dUjGSrzkoIBRvZb
 Ze8fD9t6+2fGQYt91tYV4X10ya0ARKoTKepIT22nt0YelozjnGhThsbW5
 YcebdS7sut9WbJBucDMKn1X4PX400tBYpxHWI7MjXvy8gm6xV6O7YkFCi
 8Ct547clHofRpG6vgQuLg78LtBzE91oM2psy0H/hQmY8W6ypxsNFSnErF
 qmlI9uxlh2pYns904ZiBnt7zFJRZy8O/bIrhVZ5ytmg6jmdyOt123Z8KK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1138894"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="1138894"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 06:55:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="771328322"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="771328322"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 06:55:47 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 06:55:46 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 06:55:46 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 06:55:46 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 06:55:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f77YuJnFWIGs2tj7mLaInBN7HAn0FCxgkNLsOFqH3xQh/Y1Hts3gjHEe5OhJp+ImTd3oRo4g6pFbu5OuOSWd1lOYC80ybgh+KYjRy0iFu9PE4D9psOTQ5KbvdZr2nHjdmtNp89XdIYNdZO9USXkZGZvc9e48HGzBG8vYcnWYieLN+Kt3Q96K+SBaY4GWQVOrbwMFGBU2f0WTA8mxCqZ4UoQ03Y7qcW6JCy5Fvba0uHcxqSB80IHQwbpMxS3was+sugvZUcmxiSa2wOcgIH9Vq1QKeuzlu+dZ/HAG31V3gYkZG+oM6UzA3cv4ktICMGV5E9Mj5VcGNvhKMt8nJHsLGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rF1U2AhTwGepqQsze0R/lCetRQJjn7ETQ+2b09tUcNU=;
 b=flnkT/iK6a7u9tu7RDjDSOnSYPCW/NZx7MUQVHTL4whaaGl7pYTTzDVCvAABQsCZ6hc80HoInrwWlJ4c4yVRAVVNw9rOhv9++T1XhHVchmB8YHz0iWI7THZyIWM30UWWgxQKtMHtgOmHgcIdqzyDwgHPAXiF8/etLKYplpUtWtE+3cd6m9SWFv29NrUGn8GhjvjKLhNbnSrXJfUkyo2wYndoJokfrH6IuGSnKZLT/wCXDG8KjynWoTqlHEtSEAgPwBKv6i7VV8vhyDUuh+yjNfhHSQrGcQlA4uGVMACo4UmzIU2NpRpnkUhisFOE0J/ZvtziGPr3oy4tZIPacORmSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by CH3PR11MB7763.namprd11.prod.outlook.com (2603:10b6:610:145::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Wed, 6 Dec
 2023 14:55:43 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::7d36:1951:b896:cb37]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::7d36:1951:b896:cb37%7]) with mapi id 15.20.7046.034; Wed, 6 Dec 2023
 14:55:43 +0000
Date: Wed, 6 Dec 2023 15:55:36 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Message-ID: <ZXCLaNuy3fG9Od_V@fdugast-desk.home>
References: <20231206034130.7897-1-krishnaiah.bommu@intel.com>
 <20231206034130.7897-2-krishnaiah.bommu@intel.com>
 <ZXBA1CJ85aUwaPvB@fdugast-desk.home>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZXBA1CJ85aUwaPvB@fdugast-desk.home>
Organization: Intel Corporation
X-ClientProxiedBy: FR0P281CA0203.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::9) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|CH3PR11MB7763:EE_
X-MS-Office365-Filtering-Correlation-Id: 94037696-b6c0-445f-d707-08dbf66b6b56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tu3VpiNjyjEoaHylTbc0k2ajBw4cWr/PPOat52HqkGXhXGZtQfeACePtmU9f8vCBbb38OQnO9PZriCAkxTx7Xz2g28NlJe3pCLnoQsFZAgEla+O4F88BiMV9H0FuHCYj5efNGWnWycdVW1EZm0x6NkgoWR4lh3H9GjeBoWXS3phhDSi55FLRmo3fasXScf0pVFAHBQ8b+gJLTNlXoegc2o+nVqubqR7+ibcb1Qg8qD3wW81XRfA3LmmH7M7OmLQ9YBa1sTqghGCmoSLHu2YIiZji4PfL5mpIpaJTfmDgVdb9x+Vg1VLRV7ZCrEBm+dQMmhfAmJlSfZ+ugW+awH9DsRyPF6daiqUNjoBdSfrFPLJZYWpS6+bXKJhJOajHz+Ncpm6lfOqfjqbz+M2ot12HDTTEDxQ91fZg0BNrIKcms68PSKLkRqeOPFflW7esxqK+F/PBRayPSdEq2QdhUXpvASph5H/Xu6t5d5elVCQ1s3oyOFNcCqXkw8N0Wwc7zJFKpvXJ0kd0srM9GuJqg1ybKycux5BnKLRzswb63ICI9N0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(39860400002)(396003)(346002)(136003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(2906002)(5660300002)(44832011)(36756003)(41300700001)(86362001)(4326008)(6862004)(8936002)(8676002)(316002)(6636002)(66476007)(66556008)(66946007)(38100700002)(82960400001)(966005)(6486002)(478600001)(36916002)(83380400001)(6666004)(107886003)(6506007)(26005)(9686003)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9Q+HGA6XVn784H2PxwqF6NAwC6yXMDP1Z8FGuxvHIz6lQBgtiICIM3nyf9h6?=
 =?us-ascii?Q?1Nxm0iMY6wa+vXO8kQy7wnIxMqRguD0Tjo9fYGqhYBqhmX0JOWwSdqtPoluy?=
 =?us-ascii?Q?QJPI8YDbbaG6rGcHybpowLybQiWz9Pd6wC/rtP8LmTX6YkGGzf1KofPXfpW6?=
 =?us-ascii?Q?phEXosTQo2ndD7bJO7OXhl2OOoW2n6fjf7ZpSJRkQAzGC3Kk9ZAovHa6GJgq?=
 =?us-ascii?Q?k9mkAMHhgT85Z/7f2wirVVp08bFCkkgpIHoOFeDY4p/oyDNiK02O/NyOv/f/?=
 =?us-ascii?Q?JoanikhFAFauPh47hh7DYA+ED3Yd8CTNIO+IqViEdtosBd/L6Wf4otNNUe/8?=
 =?us-ascii?Q?2pBljR524BPkIr956okTwdl3lAVQXkP98omfOhOyILpRhtZ3FKj/Cxdxin11?=
 =?us-ascii?Q?e42cefht64uHn6N5DYUmXRBrP4knnJSHchLFy+itMSSm8VGNYtnjbJg/z5WN?=
 =?us-ascii?Q?j2vj/O18G+g/xr8Kf+I0RaXpCnhQIPzviIeDVOdbI3GY+w0VXjwJ31j3JXgH?=
 =?us-ascii?Q?WdsRelA9Yqz1Q6RhIUWmeUkKZ+NYjfD4Jy4xVWS6jE5IUF1VzM6bz2yyqZHS?=
 =?us-ascii?Q?yRqp2mQLco/FiS3GEokmUqPnulknwK9Al1tiGYtNQlaNaIQoj3crJrpUi6aw?=
 =?us-ascii?Q?EaGSLx/VwNwD1Bne8EMWs4bMKD274jtHAkqUrmboh5XJy24q4dYLaN6TLo5Z?=
 =?us-ascii?Q?y8rAptgZResLvG3UHF8EYsupJsmaKaaii1ZS4UE8g5M8/UvzA8edgP7FUw+m?=
 =?us-ascii?Q?pUfsx8xAmn07M9RQau+rn45yTm7z+qqsoC5HD6WeYKHKOMKg8SgLFC7/S3Ig?=
 =?us-ascii?Q?tnwlKJZU3cAcicE6twRzVIATuky2mudkzyHo+TVhMLXXhyj6RjN47i+R1/OH?=
 =?us-ascii?Q?tLP2lpkGAVV1xj/EQT8Ua/+L+3fO2WuxL35oFpib/KiLP3+gg0IgbM1I4EIZ?=
 =?us-ascii?Q?L9+GTjBLfCY1XexG7TA/CbsUlrl22Rgt8IUWkrCbxLOtfLcc62A9eoy3DhHT?=
 =?us-ascii?Q?YMH44pOwXKs6EqWR3b6RkCH8n8tFz0RMqblgCRCbB+9RaEEoh7YxSiXJnITv?=
 =?us-ascii?Q?NJJHJih7a3oMqP0Br+T1nTmjVav/iuafCydrcGZHYqoaALx4yeXmUx+ejCsG?=
 =?us-ascii?Q?EzYSpB9yDFqAoGRFLtUEXVKztnt12SRpr2Dv/+Bbtvys/id6eJ0W7bPV4yGG?=
 =?us-ascii?Q?wGrOksU2pEISoazcSOrvlIC5MEKOwpM1YD52UmfP1hZMrfdOi8bICB8ClIR+?=
 =?us-ascii?Q?vW9ON++0vxoMIiXj2fpfasGd2aIhNoUJOrVSgtfyTdgl4Nrh41Efy15bb3WY?=
 =?us-ascii?Q?pMdBPGfJDHdvWFGORXnWV33ndhWqgHdnyNazVBdke6FvTkflDR2z0BDfBdmg?=
 =?us-ascii?Q?OnFf3uY1QiRABxKzvlFNqS+Tn/TTk3ZQjC+nbQIP7HvF7EHZSkXt7GmOvrCC?=
 =?us-ascii?Q?7eo4SkDbkcTaGElGPzxFhhZ6LLJ0T6rrWka8NQQWurGqANLU0+DJYyr2wVwO?=
 =?us-ascii?Q?gt77bNiwtor5pwU8Sa7opJa8QIJSWDffDjrj4xBwS0dCkZzGiFX9Mvnv9zH8?=
 =?us-ascii?Q?fOR3zY5NI4/ld7sOnPvRKfVj/empFfFVcA1BlR9ZlmRpPajcVwHiLcX9qZ1T?=
 =?us-ascii?Q?pQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94037696-b6c0-445f-d707-08dbf66b6b56
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 14:55:42.8716 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AqkQUty9sHjEDD/r3/O8Xy6GxTlymqlmXCPXyBOG7UP1iFDaxoIOHxLPgP4+0BJo5i50Ec5gQrOZuyZHOzENZPnkmmDg595Zrukz8dGaA9I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7763
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 1/2] drm/xe/uapi: add exec_queue_id member
 to drm_xe_wait_user_fence structure
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

On Wed, Dec 06, 2023 at 10:37:24AM +0100, Francois Dugast wrote:
> Hi Bommu,
> 
> On Wed, Dec 06, 2023 at 09:11:29AM +0530, Bommu Krishnaiah wrote:
> > remove the num_engines/instances members from drm_xe_wait_user_fence
> > structure and add a exec_queue_id member
> > 
> > Right now this is only checking if the engine list is sane and nothing
> > else. In the end every operation with this IOCTL is a soft check.
> > So, let's formalize that and only use this IOCTL to wait on the fence.
> > 
> > exec_queue_id member will help to user space to get proper error code
> > from kernel while in exec_queue reset
> > 
> > Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > Acked-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_wait_user_fence.c | 64 +------------------------
> >  include/uapi/drm/xe_drm.h               | 16 ++-----
> >  2 files changed, 4 insertions(+), 76 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> > index 4d5c2555ce41..9f272bbaad95 100644
> > --- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
> > +++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> > @@ -50,37 +50,7 @@ static int do_compare(u64 addr, u64 value, u64 mask, u16 op)
> >  	return passed ? 0 : 1;
> >  }
> >  
> > -static const enum xe_engine_class user_to_xe_engine_class[] = {
> > -	[DRM_XE_ENGINE_CLASS_RENDER] = XE_ENGINE_CLASS_RENDER,
> > -	[DRM_XE_ENGINE_CLASS_COPY] = XE_ENGINE_CLASS_COPY,
> > -	[DRM_XE_ENGINE_CLASS_VIDEO_DECODE] = XE_ENGINE_CLASS_VIDEO_DECODE,
> > -	[DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE] = XE_ENGINE_CLASS_VIDEO_ENHANCE,
> > -	[DRM_XE_ENGINE_CLASS_COMPUTE] = XE_ENGINE_CLASS_COMPUTE,
> > -};
> > -
> > -static int check_hw_engines(struct xe_device *xe,
> > -			    struct drm_xe_engine_class_instance *eci,
> > -			    int num_engines)
> > -{
> > -	int i;
> > -
> > -	for (i = 0; i < num_engines; ++i) {
> > -		enum xe_engine_class user_class =
> > -			user_to_xe_engine_class[eci[i].engine_class];
> > -
> > -		if (eci[i].gt_id >= xe->info.tile_count)
> > -			return -EINVAL;
> > -
> > -		if (!xe_gt_hw_engine(xe_device_get_gt(xe, eci[i].gt_id),
> > -				     user_class, eci[i].engine_instance, true))
> > -			return -EINVAL;
> > -	}
> > -
> > -	return 0;
> > -}
> > -
> > -#define VALID_FLAGS	(DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP | \
> > -			 DRM_XE_UFENCE_WAIT_FLAG_ABSTIME)
> > +#define VALID_FLAGS	DRM_XE_UFENCE_WAIT_FLAG_ABSTIME
> >  #define MAX_OP		DRM_XE_UFENCE_WAIT_OP_LTE
> >  
> >  static long to_jiffies_timeout(struct xe_device *xe,
> > @@ -132,12 +102,8 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
> >  	struct xe_device *xe = to_xe_device(dev);
> >  	DEFINE_WAIT_FUNC(w_wait, woken_wake_function);
> >  	struct drm_xe_wait_user_fence *args = data;
> > -	struct drm_xe_engine_class_instance eci[XE_HW_ENGINE_MAX_INSTANCE];
> > -	struct drm_xe_engine_class_instance __user *user_eci =
> > -		u64_to_user_ptr(args->instances);
> >  	u64 addr = args->addr;
> >  	int err;
> > -	bool no_engines = args->flags & DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP;
> >  	long timeout;
> >  	ktime_t start;
> >  
> > @@ -151,41 +117,13 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
> >  	if (XE_IOCTL_DBG(xe, args->op > MAX_OP))
> >  		return -EINVAL;
> >  
> > -	if (XE_IOCTL_DBG(xe, no_engines &&
> > -			 (args->num_engines || args->instances)))
> > -		return -EINVAL;
> > -
> > -	if (XE_IOCTL_DBG(xe, !no_engines && !args->num_engines))
> > -		return -EINVAL;
> > -
> >  	if (XE_IOCTL_DBG(xe, addr & 0x7))
> >  		return -EINVAL;
> >  
> > -	if (XE_IOCTL_DBG(xe, args->num_engines > XE_HW_ENGINE_MAX_INSTANCE))
> > -		return -EINVAL;
> > -
> > -	if (!no_engines) {
> > -		err = copy_from_user(eci, user_eci,
> > -				     sizeof(struct drm_xe_engine_class_instance) *
> > -			     args->num_engines);
> > -		if (XE_IOCTL_DBG(xe, err))
> > -			return -EFAULT;
> > -
> > -		if (XE_IOCTL_DBG(xe, check_hw_engines(xe, eci,
> > -						      args->num_engines)))
> > -			return -EINVAL;
> > -	}
> > -
> >  	timeout = to_jiffies_timeout(xe, args);
> >  
> >  	start = ktime_get();
> >  
> > -	/*
> > -	 * FIXME: Very simple implementation at the moment, single wait queue
> > -	 * for everything. Could be optimized to have a wait queue for every
> > -	 * hardware engine. Open coding as 'do_compare' can sleep which doesn't
> > -	 * work with the wait_event_* macros.
> > -	 */
> >  	add_wait_queue(&xe->ufence_wq, &w_wait);
> >  	for (;;) {
> >  		err = do_compare(addr, args->value, args->mask, args->op);
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index eb03a49c17a1..d922641e11e8 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -1030,8 +1030,7 @@ struct drm_xe_wait_user_fence {
> >  	/** @op: wait operation (type of comparison) */
> >  	__u16 op;
> >  
> > -#define DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP	(1 << 0)	/* e.g. Wait on VM bind */
> > -#define DRM_XE_UFENCE_WAIT_FLAG_ABSTIME	(1 << 1)
> > +#define DRM_XE_UFENCE_WAIT_FLAG_ABSTIME	(1 << 0)
> >  	/** @flags: wait flags */
> >  	__u16 flags;
> >  
> > @@ -1064,17 +1063,8 @@ struct drm_xe_wait_user_fence {
> >  	 */
> >  	__s64 timeout;
> >  
> > -	/**
> > -	 * @num_engines: number of engine instances to wait on, must be zero
> > -	 * when DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP set
> > -	 */
> > -	__u64 num_engines;
> > -
> > -	/**
> > -	 * @instances: user pointer to array of drm_xe_engine_class_instance to
> > -	 * wait on, must be NULL when DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP set
> > -	 */
> > -	__u64 instances;
> > +	/** @exec_queue_id: exec_queue_id returned from xe_exec_queue_create_ioctl */
> > +	__u32 exec_queue_id;
> 
> This creates a misalignment. Please add a __u32 pad2. With this:
> 
>     Reviewed-by: Francois Dugast <francois.dugast@intel.com>
> 

The kernel doc in the header update in IGT seems incorrect:
https://patchwork.freedesktop.org/patch/570752/?series=127364&rev=3

Please make sure it matches the name pad2, so:

	/** @reserved: Reserved */
	__u32 pad2;

should be:

	/** @pad2: MBZ */
	__u32 pad2;

and just like for pad, pad2 must be zero and this must be checked:

    XE_IOCTL_DBG(xe, args->pad2)

Francois

> >  
> >  	/** @reserved: Reserved */
> >  	__u64 reserved[2];
> > -- 
> > 2.25.1
> > 
