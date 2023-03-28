Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FED5C6FD18
	for <intel-xe@archiver.kernel.org>; Tue, 28 Mar 2023 18:27:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF9910E4A4;
	Tue, 28 Mar 2023 18:27:31 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3F1010E4A4
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Mar 2023 18:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680028049; x=1711564049;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1X8cNDNjZYzOWuFVWceoln7GZtPwMq4kh72zgJMOA0c=;
 b=VYYfEWP/a6KPY/Mr8mgVa8KI5NDfVZ0MnYHJFuLGEGE3vCgDwgMLGj5+
 RIEno/NsKdDQg+ZCLF0f3+SdEMjuUMK2C+kHpgnThwGlPy8zKvXpDr+gN
 m25eN8hzDeln0yrjV/WFkqOUkxltddYIUtLpOX/d2AtC68Cbe4SShxFyx
 Y5j6ivFmWurnKi7vHVWJZtF+Nvci6txzgeIqKoM3miN/5nPVSPGSnRsox
 gZuuhxbos9GyOIJsjAFtwe0khucJcTvOZldHuN6Uo8Fj7fmsFW6YKjbjJ
 ztEzpovoyb1AlTq1LvSxsA0ktkvAzI6TUBE2tzYkC+uHXO2nK1QPyWQsU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="321057038"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="321057038"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 11:27:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="661282898"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="661282898"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 28 Mar 2023 11:27:28 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 28 Mar 2023 11:27:28 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 28 Mar 2023 11:27:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 28 Mar 2023 11:27:27 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 28 Mar 2023 11:27:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9hlTFEPU3e9nwIYjLy6VobMHte5hm0evcdPHSdXMtzDmsCGYwGUmo+VrWNjC9QaxzKjPN9rwf8OljWtnlSdAJXMyb+d8urRTIN9FidaMw+pAyMJ3Fogf1PTwBXcl7IMcS2DLmmhb75a7X5MFcwBjWOCZE4/x4B3psKb4okY5Th5UUfpK1ELw5NLakIzuEpHaxzWrdQDsL0A5ifg5ULbUF3I9qVFcrxMVr3b6+DH3xDwTruLx6W7JN843DRELxbomZ7KLP0Dj6MEdQGwzOEl8M6k3/dUbefbY3fAkrF4YSChW/WkZbtoroCnlwBgPW4lftsTYWnc/pX+y1QcM1gryA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1+AN6qRes04+R2KJGeoVJ7KZS4s1iqeX+KGFVytWVB0=;
 b=mKZDZj+LvJnmEyj9Yr12dvCMV1srgnig9/4wH/PJO7IwxKeLmeWqQ32PzqPS9bIHR9ZnhYZ1tTfcvTDEo82P/533tSPEauBsGTkcT5pMBlyZyBMkgfY14xl/LtWyo8Ag74A0jL8EqTs2amS+8myNS9pU5VhVM4VqZjV5cMYDiBG06O1gK9D8iw+yInb2NtoLAINnJFZDWEjLbRqBKvYkPUZEyw59R4zdUxhWzlN01WVgeyPe0rm+h+6IOhy1hRm2yFcgAB/6S+vkwbQAotF9AbkCPFfafXjt4Tu99sn6cnal+WyLnZSkJpfrXCbxwS6esO1IxXqRkKOW6R8yajCUWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB7447.namprd11.prod.outlook.com (2603:10b6:510:28b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Tue, 28 Mar
 2023 18:27:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::2ceb:afd:8ee7:4cc]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::2ceb:afd:8ee7:4cc%5]) with mapi id 15.20.6222.033; Tue, 28 Mar 2023
 18:27:25 +0000
Date: Tue, 28 Mar 2023 18:26:42 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZCMxYrcTnAAlsReb@DUT025-TGLU.fm.intel.com>
References: <20230328161021.669017-1-rodrigo.vivi@intel.com>
 <20230328161021.669017-4-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230328161021.669017-4-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0285.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB7447:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d7786dc-5f20-41bb-0474-08db2fba13e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VNXT6ztfoDXqMiwFB2eADsTfM4M4bn7EIaXt56MxGjo/OfzyFhJe17PQ+q69k84r2jv37yilPVG3DUsrMFSymmKYnldUHLaKt1lXmEYvTEsZDGTXMp+9sZy2Y2OJ7JsIXlgPOkGNqp58aD3MHYc+KCuZaTJJ7syhZxVmpAkrG8yyZ+X2mHgZ3wlnyDDaLyW+Ki4prpNt8izG5Y09ZqJ0R1SSG5tL8k3H3ZDyTfCk2dDEB8kHwIeJy7HPzzbYxcGKXPU01hWYqMUDiZEVcUT0Pqv1sidqTuUhGK+DDBffbOBE9hHxMYlhmG8pQ06xB3RbOjUxe/3gPrPNLVGsIQwmHnPeUhreHiP2ZpPeZNa3l/B3lq6CbKY7kUyHXgxFstCDLftt3odedcNKsv9Tloo8jM6CS6tGFjkxx4aCPq+VyGrBxS8uCmCqMUjbktixahkY98b53gPdSIerEw6Wyza41SB5MN0T0L+ixs1Y82t2ixyapK/4Htk7S5L3uW17pKsfIkzXuAhNlKkiFVojEIU1Xhx0ZMLiqTRiY3h6f5dHYOl7/7rE2LrU1dGD5qi73qltLnAHHUWp+BtvZ/WpiiSR2JdNQROlMiscjJBbbqk7Ecg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(376002)(366004)(396003)(136003)(451199021)(8936002)(6862004)(83380400001)(2906002)(41300700001)(44832011)(86362001)(38100700002)(5660300002)(6486002)(82960400001)(6636002)(478600001)(66946007)(66556008)(8676002)(66476007)(6512007)(4326008)(30864003)(6666004)(186003)(6506007)(316002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hj0bo8dNg0xm7R5TZWVZVIlTcM5QggjyLki/bM2p8kOJQ1zDifqpujjePipq?=
 =?us-ascii?Q?k0peztw4obGIdUSBDF+3rFMTP5qFVi1DCrSImeXSdym/MHDwUFI37QlmxkZX?=
 =?us-ascii?Q?0Pe6J6yZn4v9hKTnUwlOFbaP5njC51lIybO/g3j96xm4x5TuHabohGG28DsS?=
 =?us-ascii?Q?UYXcWd+cljy7y1ioiwhjHAsg/hmQFlBEO2+Shy8u/onPOiCuyObgd7y/28SL?=
 =?us-ascii?Q?fw7Aoi2fus5XicSIV7pCP7TZ+J+626WXjYBLmvZvGUIMCrFOyYNy0NsqmieY?=
 =?us-ascii?Q?2Sk3KW0aTjZ2WyOCn/s70aBVwUyY08HwkhsuETNi22YbFyQnyqAALgYImv5d?=
 =?us-ascii?Q?urq+P6SLCQIw+Jd8eYDEz+H/3ekeJ2bfA6Y4fIURgcp5iY0XwD0LjviMpv0c?=
 =?us-ascii?Q?kWq5AEylmfdpNyoF6vE5KiAwyj1EAXYfFW5pNuxWlyOkQYyz8UyDgol+OqIJ?=
 =?us-ascii?Q?kd6QIHDjvIbRqw0MpYvdbfu8xn1bfxqRpVHnXijKRNzs6Y5wa0kHF329LJUv?=
 =?us-ascii?Q?5YurYgvXuRjHf1UodZp9wlf6OVxCVYBosUKgIrUpgma0ikHX0+KH4btOhHTF?=
 =?us-ascii?Q?h1tHfzO4aUfT9hRy+3KNADzqKdJ1Yx2AlEmPFSWq6uGjG6aQ7mNMMLtxM9ID?=
 =?us-ascii?Q?K2C4TVr6uN9ytsJVVcx9fe4nLwW7AYX0kYCDmWLd40lgpu4rFAMAoprKSQy5?=
 =?us-ascii?Q?Wpjpl8FBoWK/8m8rL4KKla9KQIZ9Ck51yImzSjMVMQLuKQPbeRtahYLGkfYz?=
 =?us-ascii?Q?lvvlLJkgR6UlnAbxdrIvzEEwaLtSO5mTQxNpTekIKOd48JmvP7ajY7Mmzhr3?=
 =?us-ascii?Q?nKexCS7dILEC45dnz3fgrr+7CvXRveCXWufTmAr3ExDvlnRPz0UlXyN5adnp?=
 =?us-ascii?Q?6ZgJb4R2zmjPXTYLHdo1Q3/nliBtGPtPc8c2z2qFUHI8LX/BAkcojQdeA3AY?=
 =?us-ascii?Q?MqSWgQbXTZwGgm6P2Qgq+SytpqCEv5vbO9sw6JstSfk3B+cNjy+md4ocqxEc?=
 =?us-ascii?Q?mF6otAK+n3CfBdLnSHD6bGCyAXkWY4rxfrpNYZJbh84G3Mo863QtFqw26/LO?=
 =?us-ascii?Q?R8mCQGG7rWi5fP4SltFci/Jh8RLdiyCpWgkWl9fY3BjBr7IZBdyrsBUXfIkR?=
 =?us-ascii?Q?TJanNy/lhyM3SgVDc/L+Z7XJhtf0ACOPWOI3PvqdPPnOalmFGduqQQZRWYf+?=
 =?us-ascii?Q?9kt8HK2MxNsSg6Da/uuJDxY4u+ToXR8+z0qMSdTT1SBQcHs7zvmTtfvU8U7A?=
 =?us-ascii?Q?yGt+2LNYvu1I8AhLJLfcoHZZfBySlsyH15PHhETviKHCdd/kVRz3PoEn1+cg?=
 =?us-ascii?Q?Mm2Lt8j2hqHvTXYt5/KkKXj+TTPDDzzhwtiOSkI5XKICIX16I8+MFCoMaXS2?=
 =?us-ascii?Q?froXlOscjt/7N6an7FAg2oD0PHojaOfCBLs30ZLCxRmHv2RihSUPwiGVH7dG?=
 =?us-ascii?Q?qwsaO95ufuLtNafUl2l7HMsyZ3SZ36GWCl0CFqnwo1p0IVefTTfaojBYXfb1?=
 =?us-ascii?Q?fyEzGaN2gpEMLDgQ4GbZ6lvNw1LbkAab/9aGlNJZQGz5L5/byGY817XaiuwV?=
 =?us-ascii?Q?ZEsPY7mn5A9mrPyn1YXFbRLe+HbPamIqiV+A9D2jMhLcsMuZ5todDUHkJT1C?=
 =?us-ascii?Q?dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d7786dc-5f20-41bb-0474-08db2fba13e8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 18:27:24.9390 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rTTtcNm9pBWttd5FArw7acFocajCHisVvgqUZRF/LlGiOewx5rhoeI3uW9ZjLjNYzQNZSRfqW49vqUtTSc0dqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7447
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC 3/5] drm/xe: Remove useless XE_WARN_ON.
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

On Tue, Mar 28, 2023 at 12:10:19PM -0400, Rodrigo Vivi wrote:
> If that ever becomes useful for something we bring it
> back with some written reasoning.
> 

Isn't the idea that we hide XE_WARN_ON and XE_BUG_ON behind a Kconfig
option so these are only built in debug kernels? If we are doing that
then these are not useless.

Matt
 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c      |  2 +-
>  drivers/gpu/drm/xe/xe_bo.c                  | 12 +++++-----
>  drivers/gpu/drm/xe/xe_debugfs.c             |  4 ++--
>  drivers/gpu/drm/xe/xe_device.c              |  4 ++--
>  drivers/gpu/drm/xe/xe_device.h              |  2 +-
>  drivers/gpu/drm/xe/xe_dma_buf.c             |  2 +-
>  drivers/gpu/drm/xe/xe_engine.c              |  2 +-
>  drivers/gpu/drm/xe/xe_execlist.c            |  2 +-
>  drivers/gpu/drm/xe/xe_ggtt.c                |  6 ++---
>  drivers/gpu/drm/xe/xe_gt.c                  | 24 +++++++++----------
>  drivers/gpu/drm/xe/xe_gt_debugfs.c          |  4 ++--
>  drivers/gpu/drm/xe/xe_gt_pagefault.c        |  2 +-
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  2 +-
>  drivers/gpu/drm/xe/xe_guc.c                 |  4 ++--
>  drivers/gpu/drm/xe/xe_guc.h                 |  2 +-
>  drivers/gpu/drm/xe/xe_guc_ads.c             |  2 +-
>  drivers/gpu/drm/xe/xe_guc_ct.c              |  6 ++---
>  drivers/gpu/drm/xe/xe_guc_debugfs.c         |  2 +-
>  drivers/gpu/drm/xe/xe_guc_pc.c              | 18 +++++++-------
>  drivers/gpu/drm/xe/xe_guc_submit.c          | 10 ++++----
>  drivers/gpu/drm/xe/xe_huc_debugfs.c         |  2 +-
>  drivers/gpu/drm/xe/xe_hw_fence.c            |  6 ++---
>  drivers/gpu/drm/xe/xe_macros.h              |  1 -
>  drivers/gpu/drm/xe/xe_migrate.c             |  2 +-
>  drivers/gpu/drm/xe/xe_mocs.c                |  4 ++--
>  drivers/gpu/drm/xe/xe_pt.c                  | 10 ++++----
>  drivers/gpu/drm/xe/xe_reg_sr.c              |  4 ++--
>  drivers/gpu/drm/xe/xe_res_cursor.h          |  2 +-
>  drivers/gpu/drm/xe/xe_rtp.c                 |  2 +-
>  drivers/gpu/drm/xe/xe_sync.c                |  4 ++--
>  drivers/gpu/drm/xe/xe_uc.c                  |  2 +-
>  drivers/gpu/drm/xe/xe_uc_debugfs.c          |  2 +-
>  drivers/gpu/drm/xe/xe_uc_fw.c               |  2 +-
>  drivers/gpu/drm/xe/xe_vm.c                  | 26 ++++++++++-----------
>  drivers/gpu/drm/xe/xe_vm_madvise.c          |  2 +-
>  35 files changed, 91 insertions(+), 92 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index 65c0bc28a3d1..ef37dc1e9a5c 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -190,7 +190,7 @@ static struct i915_vma *__xe_pin_fb_vma(struct intel_framebuffer *fb,
>  		return ERR_PTR(-ENODEV);
>  
>  	/* Remapped view is only required on ADL-P, which xe doesn't support. */
> -	if (XE_WARN_ON(view->type == I915_GTT_VIEW_REMAPPED)) {
> +	if (WARN_ON(view->type == I915_GTT_VIEW_REMAPPED)) {
>  		ret = -ENODEV;
>  		goto err;
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index e4d079b61d52..eb00b0a67abe 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -424,7 +424,7 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
>  							MAX_SCHEDULE_TIMEOUT);
>  			if (timeout > 0) {
>  				ret = xe_vm_invalidate_vma(vma);
> -				XE_WARN_ON(ret);
> +				WARN_ON(ret);
>  			} else if (!timeout) {
>  				ret = -ETIME;
>  			} else {
> @@ -661,7 +661,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  				void *new_addr = gt->mem.vram.mapping +
>  					(new_mem->start << PAGE_SHIFT);
>  
> -				if (XE_WARN_ON(new_mem->start == XE_BO_INVALID_OFFSET)) {
> +				if (WARN_ON(new_mem->start == XE_BO_INVALID_OFFSET)) {
>  					ret = -EINVAL;
>  					xe_device_mem_access_put(xe);
>  					goto out;
> @@ -721,7 +721,7 @@ static bool xe_ttm_bo_lock_in_destructor(struct ttm_buffer_object *ttm_bo)
>  {
>  	bool locked;
>  
> -	XE_WARN_ON(kref_read(&ttm_bo->kref));
> +	WARN_ON(kref_read(&ttm_bo->kref));
>  
>  	/*
>  	 * We can typically only race with TTM trylocking under the
> @@ -732,7 +732,7 @@ static bool xe_ttm_bo_lock_in_destructor(struct ttm_buffer_object *ttm_bo)
>  	spin_lock(&ttm_bo->bdev->lru_lock);
>  	locked = dma_resv_trylock(ttm_bo->base.resv);
>  	spin_unlock(&ttm_bo->bdev->lru_lock);
> -	XE_WARN_ON(!locked);
> +	WARN_ON(!locked);
>  
>  	return locked;
>  }
> @@ -748,7 +748,7 @@ static void xe_ttm_bo_release_notify(struct ttm_buffer_object *ttm_bo)
>  		return;
>  
>  	bo = ttm_to_xe_bo(ttm_bo);
> -	XE_WARN_ON(bo->created && kref_read(&ttm_bo->base.refcount));
> +	WARN_ON(bo->created && kref_read(&ttm_bo->base.refcount));
>  
>  	/*
>  	 * Corner case where TTM fails to allocate memory and this BOs resv
> @@ -966,7 +966,7 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>  	/* Only kernel objects should set GT */
>  	XE_BUG_ON(gt && type != ttm_bo_type_kernel);
>  
> -	if (XE_WARN_ON(!size))
> +	if (WARN_ON(!size))
>  		return ERR_PTR(-EINVAL);
>  
>  	if (!bo) {
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 7827a785b020..fc88ee32a006 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -71,7 +71,7 @@ static int forcewake_open(struct inode *inode, struct file *file)
>  	u8 id;
>  
>  	for_each_gt(gt, xe, id)
> -		XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +		WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>  
>  	return 0;
>  }
> @@ -83,7 +83,7 @@ static int forcewake_release(struct inode *inode, struct file *file)
>  	u8 id;
>  
>  	for_each_gt(gt, xe, id)
> -		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +		WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index a79f934e3d2d..49dec0b6516f 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -411,7 +411,7 @@ void xe_device_mem_access_get(struct xe_device *xe)
>  	if (resumed)
>  		xe_pm_runtime_put(xe);
>  
> -	XE_WARN_ON(ref == S32_MAX);
> +	WARN_ON(ref == S32_MAX);
>  }
>  
>  void xe_device_mem_access_put(struct xe_device *xe)
> @@ -422,5 +422,5 @@ void xe_device_mem_access_put(struct xe_device *xe)
>  	if (!ref && hold)
>  		xe_pm_runtime_put(xe);
>  
> -	XE_WARN_ON(ref < 0);
> +	WARN_ON(ref < 0);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index d277f8985f7b..5f725ed2ca6b 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -97,7 +97,7 @@ static inline bool xe_device_mem_access_ongoing(struct xe_device *xe)
>  
>  static inline void xe_device_assert_mem_access(struct xe_device *xe)
>  {
> -	XE_WARN_ON(!xe_device_mem_access_ongoing(xe));
> +	WARN_ON(!xe_device_mem_access_ongoing(xe));
>  }
>  
>  static inline bool xe_device_in_fault_mode(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> index 9b252cc782b7..485aa5ccbeca 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -219,7 +219,7 @@ static void xe_dma_buf_move_notify(struct dma_buf_attachment *attach)
>  	struct drm_gem_object *obj = attach->importer_priv;
>  	struct xe_bo *bo = gem_to_xe_bo(obj);
>  
> -	XE_WARN_ON(xe_bo_evict(bo, false));
> +	WARN_ON(xe_bo_evict(bo, false));
>  }
>  
>  static const struct dma_buf_attach_ops xe_dma_buf_attach_ops = {
> diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
> index 37209b13bcd6..cdd2349524d6 100644
> --- a/drivers/gpu/drm/xe/xe_engine.c
> +++ b/drivers/gpu/drm/xe/xe_engine.c
> @@ -705,7 +705,7 @@ static void engine_kill_compute(struct xe_engine *e)
>   */
>  bool xe_engine_is_idle(struct xe_engine *engine)
>  {
> -	if (XE_WARN_ON(xe_engine_is_parallel(engine)))
> +	if (WARN_ON(xe_engine_is_parallel(engine)))
>  		return false;
>  
>  	return xe_lrc_seqno(&engine->lrc[0]) ==
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index 02021457b1f0..127ca8c6e279 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -373,7 +373,7 @@ static int execlist_engine_init(struct xe_engine *e)
>  		sprintf(e->name, "ccs%d", ffs(e->logical_mask) - 1);
>  		break;
>  	default:
> -		XE_WARN_ON(e->class);
> +		WARN_ON(e->class);
>  	}
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index a430d1568890..bd079e823661 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -205,7 +205,7 @@ void xe_ggtt_invalidate(struct xe_gt *gt)
>  		int seqno;
>  
>  		seqno = xe_gt_tlb_invalidation_guc(gt);
> -		XE_WARN_ON(seqno <= 0);
> +		WARN_ON(seqno <= 0);
>  		if (seqno > 0)
>  			xe_gt_tlb_invalidation_wait(gt, seqno);
>  	} else if (xe_device_guc_submission_enabled(gt_to_xe(gt))) {
> @@ -294,7 +294,7 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>  	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
>  		alignment = SZ_64K;
>  
> -	if (XE_WARN_ON(bo->ggtt_node.size)) {
> +	if (WARN_ON(bo->ggtt_node.size)) {
>  		return 0;
>  	}
>  
> @@ -351,7 +351,7 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node)
>  
>  void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>  {
> -	if (XE_WARN_ON(!bo->ggtt_node.size))
> +	if (WARN_ON(!bo->ggtt_node.size))
>  		return;
>  
>  	xe_ggtt_remove_node(ggtt, &bo->ggtt_node);
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 6322e0689a9e..7d8b4cffcc2d 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -356,7 +356,7 @@ int xe_gt_init_noalloc(struct xe_gt *gt)
>  
>  err_force_wake:
>  	err2 = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> -	XE_WARN_ON(err2);
> +	WARN_ON(err2);
>  	xe_device_mem_access_put(gt_to_xe(gt));
>  err:
>  	return err;
> @@ -401,7 +401,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>  		goto err_force_wake;
>  
>  	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> -	XE_WARN_ON(err);
> +	WARN_ON(err);
>  	xe_device_mem_access_put(gt_to_xe(gt));
>  
>  	return 0;
> @@ -482,7 +482,7 @@ static int all_fw_domain_init(struct xe_gt *gt)
>  		goto err_force_wake;
>  
>  	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	XE_WARN_ON(err);
> +	WARN_ON(err);
>  	xe_device_mem_access_put(gt_to_xe(gt));
>  
>  	return 0;
> @@ -623,16 +623,16 @@ static int gt_reset(struct xe_gt *gt)
>  
>  	xe_device_mem_access_put(gt_to_xe(gt));
>  	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	XE_WARN_ON(err);
> +	WARN_ON(err);
>  
>  	drm_info(&xe->drm, "GT reset done\n");
>  
>  	return 0;
>  
>  err_out:
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +	WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>  err_msg:
> -	XE_WARN_ON(xe_uc_start(&gt->uc));
> +	WARN_ON(xe_uc_start(&gt->uc));
>  	xe_device_mem_access_put(gt_to_xe(gt));
>  	drm_err(&xe->drm, "GT reset failed, err=%d\n", err);
>  
> @@ -663,12 +663,12 @@ void xe_gt_reset_async(struct xe_gt *gt)
>  void xe_gt_suspend_prepare(struct xe_gt *gt)
>  {
>  	xe_device_mem_access_get(gt_to_xe(gt));
> -	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +	WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>  
>  	xe_uc_stop_prepare(&gt->uc);
>  
>  	xe_device_mem_access_put(gt_to_xe(gt));
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +	WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>  }
>  
>  int xe_gt_suspend(struct xe_gt *gt)
> @@ -692,13 +692,13 @@ int xe_gt_suspend(struct xe_gt *gt)
>  		goto err_force_wake;
>  
>  	xe_device_mem_access_put(gt_to_xe(gt));
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +	WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>  	drm_info(&xe->drm, "GT suspended\n");
>  
>  	return 0;
>  
>  err_force_wake:
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +	WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>  err_msg:
>  	xe_device_mem_access_put(gt_to_xe(gt));
>  	drm_err(&xe->drm, "GT suspend failed: %d\n", err);
> @@ -721,13 +721,13 @@ int xe_gt_resume(struct xe_gt *gt)
>  		goto err_force_wake;
>  
>  	xe_device_mem_access_put(gt_to_xe(gt));
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +	WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>  	drm_info(&xe->drm, "GT resumed\n");
>  
>  	return 0;
>  
>  err_force_wake:
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +	WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>  err_msg:
>  	xe_device_mem_access_put(gt_to_xe(gt));
>  	drm_err(&xe->drm, "GT resume failed: %d\n", err);
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 9fab8017490f..639b2486803b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -150,7 +150,7 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>  	sprintf(name, "gt%d", gt->info.id);
>  	root = debugfs_create_dir(name, minor->debugfs_root);
>  	if (IS_ERR(root)) {
> -		XE_WARN_ON("Create GT directory failed");
> +		WARN_ON("Create GT directory failed");
>  		return;
>  	}
>  
> @@ -162,7 +162,7 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>  #define DEBUGFS_SIZE	ARRAY_SIZE(debugfs_list) * sizeof(struct drm_info_list)
>  	local = drmm_kmalloc(&gt_to_xe(gt)->drm, DEBUGFS_SIZE, GFP_KERNEL);
>  	if (!local) {
> -		XE_WARN_ON("Couldn't allocate memory");
> +		WARN_ON("Couldn't allocate memory");
>  		return;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 1677640e1075..de0abd322fce 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -346,7 +346,7 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  		pf_queue->tail = (pf_queue->tail + len) % PF_QUEUE_NUM_DW;
>  		queue_work(gt->usm.pf_wq, &pf_queue->worker);
>  	} else {
> -		XE_WARN_ON("PF Queue full, shouldn't be possible");
> +		WARN_ON("PF Queue full, shouldn't be possible");
>  	}
>  	spin_unlock_irqrestore(&pf_queue->lock, flags);
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index f279e21300aa..6c9a96cf3d5f 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -319,7 +319,7 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  	/* Sanity check on seqno */
>  	expected_seqno = (gt->tlb_invalidation.seqno_recv + 1) %
>  		TLB_INVALIDATION_SEQNO_MAX;
> -	XE_WARN_ON(expected_seqno != msg[0]);
> +	WARN_ON(expected_seqno != msg[0]);
>  
>  	gt->tlb_invalidation.seqno_recv = msg[0];
>  	smp_wmb();
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 58b9841616e4..bccdfb914f08 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -805,7 +805,7 @@ void xe_guc_reset_wait(struct xe_guc *guc)
>  
>  void xe_guc_stop_prepare(struct xe_guc *guc)
>  {
> -	XE_WARN_ON(xe_guc_pc_stop(&guc->pc));
> +	WARN_ON(xe_guc_pc_stop(&guc->pc));
>  }
>  
>  int xe_guc_stop(struct xe_guc *guc)
> @@ -830,7 +830,7 @@ int xe_guc_start(struct xe_guc *guc)
>  		return ret;
>  
>  	ret = xe_guc_pc_start(&guc->pc);
> -	XE_WARN_ON(ret);
> +	WARN_ON(ret);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index 74a74051f354..903069a07ca4 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -51,7 +51,7 @@ static inline u16 xe_engine_class_to_guc_class(enum xe_engine_class class)
>  		return GUC_COMPUTE_CLASS;
>  	case XE_ENGINE_CLASS_OTHER:
>  	default:
> -		XE_WARN_ON(class);
> +		WARN_ON(class);
>  		return -1;
>  	}
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 304a9501b447..d5a089694f80 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -313,7 +313,7 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)
>  	ads->golden_lrc_size = calculate_golden_lrc_size(ads);
>  	ads->regset_size = calculate_regset_size(gt);
>  
> -	XE_WARN_ON(ads->golden_lrc_size +
> +	WARN_ON(ads->golden_lrc_size +
>  		   (ads->regset_size - prev_regset_size) >
>  		   MAX_GOLDEN_LRC_SIZE);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 5e00b75d3ca2..fec09ba412a8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -378,7 +378,7 @@ static void g2h_reserve_space(struct xe_guc_ct *ct, u32 g2h_len, u32 num_g2h)
>  static void __g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
>  {
>  	lockdep_assert_held(&ct->fast_lock);
> -	XE_WARN_ON(ct->ctbs.g2h.space + g2h_len >
> +	WARN_ON(ct->ctbs.g2h.space + g2h_len >
>  		   ct->ctbs.g2h.size - ct->ctbs.g2h.resv_space);
>  
>  	ct->ctbs.g2h.space += g2h_len;
> @@ -778,7 +778,7 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  		return 0;
>  	}
>  
> -	XE_WARN_ON(fence != g2h_fence->seqno);
> +	WARN_ON(fence != g2h_fence->seqno);
>  
>  	if (type == GUC_HXG_TYPE_RESPONSE_FAILURE) {
>  		g2h_fence->fail = true;
> @@ -1009,7 +1009,7 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  							   adj_len);
>  		break;
>  	default:
> -		XE_WARN_ON("NOT_POSSIBLE");
> +		WARN_ON("NOT_POSSIBLE");
>  	}
>  
>  	if (ret)
> diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
> index 6b72db4d5bb2..5ee500b8c3f1 100644
> --- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
> @@ -90,7 +90,7 @@ void xe_guc_debugfs_register(struct xe_guc *guc, struct dentry *parent)
>  #define DEBUGFS_SIZE	ARRAY_SIZE(debugfs_list) * sizeof(struct drm_info_list)
>  	local = drmm_kmalloc(&guc_to_xe(guc)->drm, DEBUGFS_SIZE, GFP_KERNEL);
>  	if (!local) {
> -		XE_WARN_ON("Couldn't allocate memory");
> +		WARN_ON("Couldn't allocate memory");
>  		return;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 5a8d827ba770..9160bcd83206 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -392,7 +392,7 @@ static ssize_t freq_act_show(struct device *dev,
>  
>  	ret = sysfs_emit(buf, "%d\n", decode_freq(freq));
>  
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +	WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>  	return ret;
>  }
>  static DEVICE_ATTR_RO(freq_act);
> @@ -420,7 +420,7 @@ static ssize_t freq_cur_show(struct device *dev,
>  	freq = REG_FIELD_GET(REQ_RATIO_MASK, freq);
>  	ret = sysfs_emit(buf, "%d\n", decode_freq(freq));
>  
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +	WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>  	return ret;
>  }
>  static DEVICE_ATTR_RO(freq_cur);
> @@ -483,7 +483,7 @@ static ssize_t freq_min_show(struct device *dev,
>  	ret = sysfs_emit(buf, "%d\n", pc_get_min_freq(pc));
>  
>  fw:
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +	WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>  out:
>  	mutex_unlock(&pc->freq_lock);
>  	xe_device_mem_access_put(pc_to_xe(pc));
> @@ -620,7 +620,7 @@ static ssize_t rc6_residency_show(struct device *dev,
>  
>  	ret = sysfs_emit(buff, "%u\n", reg);
>  
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +	WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>  	return ret;
>  }
>  static DEVICE_ATTR_RO(rc6_residency);
> @@ -749,7 +749,7 @@ static int pc_gucrc_disable(struct xe_guc_pc *pc)
>  	xe_mmio_write32(gt, GEN6_RC_CONTROL.reg, 0);
>  	xe_mmio_write32(gt, GEN6_RC_STATE.reg, 0);
>  
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +	WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>  	return 0;
>  }
>  
> @@ -758,7 +758,7 @@ static void pc_init_pcode_freq(struct xe_guc_pc *pc)
>  	u32 min = DIV_ROUND_CLOSEST(pc->rpn_freq, GT_FREQUENCY_MULTIPLIER);
>  	u32 max = DIV_ROUND_CLOSEST(pc->rp0_freq, GT_FREQUENCY_MULTIPLIER);
>  
> -	XE_WARN_ON(xe_pcode_init_min_freq_table(pc_to_gt(pc), min, max));
> +	WARN_ON(xe_pcode_init_min_freq_table(pc_to_gt(pc), min, max));
>  }
>  
>  static int pc_init_freqs(struct xe_guc_pc *pc)
> @@ -801,7 +801,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>  	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
>  	int ret;
>  
> -	XE_WARN_ON(!xe_device_guc_submission_enabled(xe));
> +	WARN_ON(!xe_device_guc_submission_enabled(xe));
>  
>  	xe_device_mem_access_get(pc_to_xe(pc));
>  
> @@ -836,7 +836,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>  
>  out:
>  	xe_device_mem_access_put(pc_to_xe(pc));
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +	WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>  	return ret;
>  }
>  
> @@ -876,7 +876,7 @@ static void pc_fini(struct drm_device *drm, void *arg)
>  {
>  	struct xe_guc_pc *pc = arg;
>  
> -	XE_WARN_ON(xe_guc_pc_stop(pc));
> +	WARN_ON(xe_guc_pc_stop(pc));
>  	sysfs_remove_files(pc_to_gt(pc)->sysfs, pc_attrs);
>  	xe_bo_unpin_map_no_vm(pc->bo);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index e857013070b9..8df5513796f1 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -715,7 +715,7 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
>  	if (!ret) {
>  		struct drm_gpu_scheduler *sched = &e->guc->sched;
>  
> -		XE_WARN_ON("Pending enable failed to respond");
> +		WARN_ON("Pending enable failed to respond");
>  		sched->timeout = MIN_SCHED_TIMEOUT;
>  		drm_sched_run_wq_start(sched);
>  		xe_gt_reset_async(e->gt);
> @@ -794,8 +794,8 @@ guc_engine_timedout_job(struct drm_sched_job *drm_job)
>  	int i = 0;
>  
>  	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags)) {
> -		XE_WARN_ON(e->flags & ENGINE_FLAG_KERNEL);
> -		XE_WARN_ON(e->flags & ENGINE_FLAG_VM && !engine_killed(e));
> +		WARN_ON(e->flags & ENGINE_FLAG_KERNEL);
> +		WARN_ON(e->flags & ENGINE_FLAG_VM && !engine_killed(e));
>  
>  		drm_warn(&xe->drm, "Timedout job: seqno=%u, guc_id=%d, flags=0x%lx",
>  			 xe_sched_job_seqno(job), e->guc->id, e->flags);
> @@ -847,7 +847,7 @@ guc_engine_timedout_job(struct drm_sched_job *drm_job)
>  					 !engine_pending_disable(e) ||
>  					 guc_read_stopped(guc), HZ * 5);
>  		if (!ret) {
> -			XE_WARN_ON("Schedule disable failed to respond");
> +			WARN_ON("Schedule disable failed to respond");
>  			sched->timeout = MIN_SCHED_TIMEOUT;
>  			list_add(&drm_job->list, &sched->pending_list);
>  			drm_sched_run_wq_start(sched);
> @@ -1124,7 +1124,7 @@ static int guc_engine_init(struct xe_engine *e)
>  		sprintf(e->name, "ccs%d", e->guc->id);
>  		break;
>  	default:
> -		XE_WARN_ON(e->class);
> +		WARN_ON(e->class);
>  	}
>  
>  	trace_xe_engine_create(e);
> diff --git a/drivers/gpu/drm/xe/xe_huc_debugfs.c b/drivers/gpu/drm/xe/xe_huc_debugfs.c
> index ee3d8315036a..b88076242fcf 100644
> --- a/drivers/gpu/drm/xe/xe_huc_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_huc_debugfs.c
> @@ -56,7 +56,7 @@ void xe_huc_debugfs_register(struct xe_huc *huc, struct dentry *parent)
>  #define DEBUGFS_SIZE	ARRAY_SIZE(debugfs_list) * sizeof(struct drm_info_list)
>  	local = drmm_kmalloc(&huc_to_xe(huc)->drm, DEBUGFS_SIZE, GFP_KERNEL);
>  	if (!local) {
> -		XE_WARN_ON("Couldn't allocate memory");
> +		WARN_ON("Couldn't allocate memory");
>  		return;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
> index ffe1a3992ef5..bbfce9f58cd6 100644
> --- a/drivers/gpu/drm/xe/xe_hw_fence.c
> +++ b/drivers/gpu/drm/xe/xe_hw_fence.c
> @@ -88,14 +88,14 @@ void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq)
>  	int err;
>  	bool tmp;
>  
> -	if (XE_WARN_ON(!list_empty(&irq->pending))) {
> +	if (WARN_ON(!list_empty(&irq->pending))) {
>  		tmp = dma_fence_begin_signalling();
>  		spin_lock_irqsave(&irq->lock, flags);
>  		list_for_each_entry_safe(fence, next, &irq->pending, irq_link) {
>  			list_del_init(&fence->irq_link);
>  			err = dma_fence_signal_locked(&fence->dma);
>  			dma_fence_put(&fence->dma);
> -			XE_WARN_ON(err);
> +			WARN_ON(err);
>  		}
>  		spin_unlock_irqrestore(&irq->lock, flags);
>  		dma_fence_end_signalling(tmp);
> @@ -202,7 +202,7 @@ static const struct dma_fence_ops xe_hw_fence_ops = {
>  
>  static struct xe_hw_fence *to_xe_hw_fence(struct dma_fence *fence)
>  {
> -	if (XE_WARN_ON(fence->ops != &xe_hw_fence_ops))
> +	if (WARN_ON(fence->ops != &xe_hw_fence_ops))
>  		return NULL;
>  
>  	return container_of(fence, struct xe_hw_fence, dma);
> diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
> index 0d24c124d202..0a42112eb247 100644
> --- a/drivers/gpu/drm/xe/xe_macros.h
> +++ b/drivers/gpu/drm/xe/xe_macros.h
> @@ -9,7 +9,6 @@
>  #include <linux/bug.h>
>  
>  #define XE_EXTRA_DEBUG 1
> -#define XE_WARN_ON WARN_ON
>  #define XE_BUG_ON BUG_ON
>  
>  #define XE_IOCTL_ERR(xe, cond) \
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 11c8af9c6c92..a98e4bad39bf 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -463,7 +463,7 @@ static void emit_pte(struct xe_migrate *m,
>  				/* Is this a 64K PTE entry? */
>  				if ((m->eng->vm->flags & XE_VM_FLAGS_64K) &&
>  				    !(cur_ofs & (16 * 8 - 1))) {
> -					XE_WARN_ON(!IS_ALIGNED(addr, SZ_64K));
> +					WARN_ON(!IS_ALIGNED(addr, SZ_64K));
>  					addr |= GEN12_PTE_PS64;
>  				}
>  
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> index e09c6242aafc..1f0d9772e6d9 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -437,9 +437,9 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
>  	 * is still 0 at this point, we'll assume that it was omitted by
>  	 * mistake in the switch statement above.
>  	 */
> -	XE_WARN_ON(info->unused_entries_index == 0);
> +	WARN_ON(info->unused_entries_index == 0);
>  
> -	if (XE_WARN_ON(info->size > info->n_entries)) {
> +	if (WARN_ON(info->size > info->n_entries)) {
>  		info->table = NULL;
>  		return 0;
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 6b2943efcdbc..ffb0e6d8f9f7 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -67,7 +67,7 @@ u64 gen8_pde_encode(struct xe_bo *bo, u64 bo_offset,
>  	pde = xe_bo_addr(bo, bo_offset, GEN8_PAGE_SIZE, &is_vram);
>  	pde |= GEN8_PAGE_PRESENT | GEN8_PAGE_RW;
>  
> -	XE_WARN_ON(IS_DGFX(xe_bo_device(bo)) && !is_vram);
> +	WARN_ON(IS_DGFX(xe_bo_device(bo)) && !is_vram);
>  
>  	/* FIXME: I don't think the PPAT handling is correct for MTL */
>  
> @@ -636,7 +636,7 @@ xe_pt_stage_bind_entry(struct drm_pt *parent, pgoff_t offset,
>  	if (level == 0 || xe_pt_hugepte_possible(addr, next, level, xe_walk)) {
>  		struct xe_res_cursor *curs = xe_walk->curs;
>  
> -		XE_WARN_ON(xe_walk->va_curs_start != addr);
> +		WARN_ON(xe_walk->va_curs_start != addr);
>  
>  		pte = __gen8_pte_encode(xe_res_dma(curs) + xe_walk->dma_offset,
>  					xe_walk->cache, xe_walk->pte_flags,
> @@ -650,7 +650,7 @@ xe_pt_stage_bind_entry(struct drm_pt *parent, pgoff_t offset,
>  		if (level == 0 && !xe_parent->is_compact) {
>  			if (xe_pt_is_pte_ps64K(addr, next, xe_walk))
>  				pte |= GEN12_PTE_PS64;
> -			else if (XE_WARN_ON(xe_walk->needs_64K))
> +			else if (WARN_ON(xe_walk->needs_64K))
>  				return -EINVAL;
>  		}
>  
> @@ -1248,7 +1248,7 @@ static int invalidation_fence_init(struct xe_gt *gt,
>  		dma_fence_put(&ifence->base.base);	/* Creation ref */
>  	}
>  
> -	XE_WARN_ON(ret && ret != -ENOENT);
> +	WARN_ON(ret && ret != -ENOENT);
>  
>  	return ret && ret != -ENOENT ? ret : 0;
>  }
> @@ -1677,7 +1677,7 @@ __xe_pt_unbind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
>  		list_del_init(&vma->rebind_link);
>  
>  	if (unbind_pt_update.locked) {
> -		XE_WARN_ON(!xe_vma_is_userptr(vma));
> +		WARN_ON(!xe_vma_is_userptr(vma));
>  
>  		if (!vma->gt_present) {
>  			spin_lock(&vm->userptr.invalidated_lock);
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index 9eaf1be27886..c1b240c4dba6 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -183,7 +183,7 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
>  		apply_one_mmio(gt, reg, entry);
>  
>  	err = xe_force_wake_put(&gt->mmio.fw, XE_FORCEWAKE_ALL);
> -	XE_WARN_ON(err);
> +	WARN_ON(err);
>  
>  	return;
>  
> @@ -224,7 +224,7 @@ void xe_reg_sr_apply_whitelist(struct xe_reg_sr *sr, u32 mmio_base,
>  				RING_NOPID(mmio_base).reg);
>  
>  	err = xe_force_wake_put(&gt->mmio.fw, XE_FORCEWAKE_ALL);
> -	XE_WARN_ON(err);
> +	WARN_ON(err);
>  
>  	return;
>  
> diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
> index 4e99fae26b4c..b34eb906dbb0 100644
> --- a/drivers/gpu/drm/xe/xe_res_cursor.h
> +++ b/drivers/gpu/drm/xe/xe_res_cursor.h
> @@ -129,7 +129,7 @@ static inline void xe_res_first(struct ttm_resource *res,
>  	cur->remaining = size;
>  	cur->node = NULL;
>  	cur->mem_type = XE_PL_TT;
> -	XE_WARN_ON(res && start + size > res->size);
> +	WARN_ON(res && start + size > res->size);
>  	return;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index cb9dd894547d..bcaa111fd63f 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -77,7 +77,7 @@ static bool rule_matches(struct xe_gt *gt,
>  			break;
>  
>  		default:
> -			XE_WARN_ON(r->match_type);
> +			WARN_ON(r->match_type);
>  		}
>  
>  		if (!match)
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index 99f1ed87196d..30a582c82689 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -75,7 +75,7 @@ static void user_fence_worker(struct work_struct *w)
>  	if (mmget_not_zero(ufence->mm)) {
>  		kthread_use_mm(ufence->mm);
>  		if (copy_to_user(ufence->addr, &ufence->value, sizeof(ufence->value)))
> -			XE_WARN_ON("Copy to user failed");
> +			WARN_ON("Copy to user failed");
>  		kthread_unuse_mm(ufence->mm);
>  		mmput(ufence->mm);
>  	}
> @@ -246,7 +246,7 @@ bool xe_sync_entry_signal(struct xe_sync_entry *sync, struct xe_sched_job *job,
>  		if (err == -ENOENT) {
>  			kick_ufence(sync->ufence, fence);
>  		} else if (err) {
> -			XE_WARN_ON("failed to add user fence");
> +			WARN_ON("failed to add user fence");
>  			user_fence_put(sync->ufence);
>  			dma_fence_put(fence);
>  		}
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 70eabf567156..cbc55ccc5918 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -162,7 +162,7 @@ int xe_uc_init_hw(struct xe_uc *uc)
>  
>  	/* We don't fail the driver load if HuC fails to auth, but let's warn */
>  	ret = xe_huc_auth(&uc->huc);
> -	XE_WARN_ON(ret);
> +	WARN_ON(ret);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_uc_debugfs.c b/drivers/gpu/drm/xe/xe_uc_debugfs.c
> index 0a39ec5a6e99..2248fc07ab3d 100644
> --- a/drivers/gpu/drm/xe/xe_uc_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_uc_debugfs.c
> @@ -17,7 +17,7 @@ void xe_uc_debugfs_register(struct xe_uc *uc, struct dentry *parent)
>  
>  	root = debugfs_create_dir("uc", parent);
>  	if (IS_ERR(root)) {
> -		XE_WARN_ON("Create UC directory failed");
> +		WARN_ON("Create UC directory failed");
>  		return;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index e9b30e620fd9..3ebe651b9a1b 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -202,7 +202,7 @@ static void guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
>  	struct xe_guc *guc = &gt->uc.guc;
>  
>  	XE_BUG_ON(uc_fw->type != XE_UC_FW_TYPE_GUC);
> -	XE_WARN_ON(uc_fw->major_ver_found < 70);
> +	WARN_ON(uc_fw->major_ver_found < 70);
>  
>  	if (uc_fw->minor_ver_found >= 6) {
>  		/* v70.6.0 adds CSS header support */
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index bdf82d34eb66..fb6b563378ea 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -501,7 +501,7 @@ void xe_vm_unlock_dma_resv(struct xe_vm *vm,
>  	 * and holding the dma_resv of an object is required for list
>  	 * addition, and we shouldn't add ourselves.
>  	 */
> -	XE_WARN_ON(!list_empty(&vm->notifier.rebind_list));
> +	WARN_ON(!list_empty(&vm->notifier.rebind_list));
>  
>  	ttm_eu_backoff_reservation(ww, objs);
>  	if (tv && tv != tv_onstack)
> @@ -641,7 +641,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
>  
>  	free_preempt_fences(&preempt_fences);
>  
> -	XE_WARN_ON(err < 0);	/* TODO: Kill VM or put in error state */
> +	WARN_ON(err < 0);	/* TODO: Kill VM or put in error state */
>  	trace_xe_vm_rebind_worker_exit(vm);
>  }
>  
> @@ -703,11 +703,11 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
>  	err = dma_resv_wait_timeout(&vm->resv,
>  				    DMA_RESV_USAGE_BOOKKEEP,
>  				    false, MAX_SCHEDULE_TIMEOUT);
> -	XE_WARN_ON(err <= 0);
> +	WARN_ON(err <= 0);
>  
>  	if (xe_vm_in_fault_mode(vm)) {
>  		err = xe_vm_invalidate_vma(vma);
> -		XE_WARN_ON(err);
> +		WARN_ON(err);
>  	}
>  
>  	trace_xe_vma_userptr_invalidate_complete(vma);
> @@ -797,7 +797,7 @@ struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
>  
>  	xe_vm_assert_held(vm);
>  	list_for_each_entry_safe(vma, next, &vm->rebind_list, rebind_link) {
> -		XE_WARN_ON(!vma->gt_present);
> +		WARN_ON(!vma->gt_present);
>  
>  		list_del_init(&vma->rebind_link);
>  		dma_fence_put(fence);
> @@ -948,7 +948,7 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
>  	XE_BUG_ON(!list_empty(&vma->unbind_link));
>  
>  	if (xe_vma_is_userptr(vma)) {
> -		XE_WARN_ON(!vma->destroyed);
> +		WARN_ON(!vma->destroyed);
>  		spin_lock(&vm->userptr.invalidated_lock);
>  		list_del_init(&vma->userptr.invalidate_link);
>  		spin_unlock(&vm->userptr.invalidated_lock);
> @@ -969,7 +969,7 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
>  						 vma_destroy_cb);
>  
>  		if (ret) {
> -			XE_WARN_ON(ret != -ENOENT);
> +			WARN_ON(ret != -ENOENT);
>  			xe_vma_destroy_late(vma);
>  		}
>  	} else {
> @@ -995,7 +995,7 @@ static void xe_vma_destroy_unlocked(struct xe_vma *vma)
>  		list_add(&tv[1].head, &objs);
>  	}
>  	err = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
> -	XE_WARN_ON(err);
> +	WARN_ON(err);
>  
>  	xe_vma_destroy(vma, NULL);
>  
> @@ -1271,7 +1271,7 @@ static void vm_error_capture(struct xe_vm *vm, int err,
>  	}
>  
>  	if (copy_to_user(address, &capture, sizeof(capture)))
> -		XE_WARN_ON("Copy to user failed");
> +		WARN_ON("Copy to user failed");
>  
>  	if (in_kthread) {
>  		kthread_unuse_mm(vm->async_ops.error_capture.mm);
> @@ -1366,7 +1366,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>  	if (vm->async_ops.error_capture.addr)
>  		wake_up_all(&vm->async_ops.error_capture.wq);
>  
> -	XE_WARN_ON(!list_empty(&vm->extobj.list));
> +	WARN_ON(!list_empty(&vm->extobj.list));
>  	up_write(&vm->lock);
>  
>  	mutex_lock(&xe->usm.lock);
> @@ -1390,7 +1390,7 @@ static void vm_destroy_work_func(struct work_struct *w)
>  	void *lookup;
>  
>  	/* xe_vm_close_and_put was not called? */
> -	XE_WARN_ON(vm->size);
> +	WARN_ON(vm->size);
>  
>  	if (!(vm->flags & XE_VM_FLAG_MIGRATION)) {
>  		xe_device_mem_access_put(xe);
> @@ -1399,7 +1399,7 @@ static void vm_destroy_work_func(struct work_struct *w)
>  		if (xe->info.has_asid) {
>  			mutex_lock(&xe->usm.lock);
>  			lookup = xa_erase(&xe->usm.asid_to_vm, vm->usm.asid);
> -			XE_WARN_ON(lookup != vm);
> +			WARN_ON(lookup != vm);
>  			mutex_unlock(&xe->usm.lock);
>  		}
>  	}
> @@ -1660,7 +1660,7 @@ static void add_async_op_fence_cb(struct xe_vm *vm,
>  		dma_fence_put(afence->wait_fence);
>  		dma_fence_put(&afence->fence);
>  	}
> -	XE_WARN_ON(ret && ret != -ENOENT);
> +	WARN_ON(ret && ret != -ENOENT);
>  }
>  
>  int xe_vm_async_fence_wait_start(struct dma_fence *fence)
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index 29815852985a..267f16dd969c 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -192,7 +192,7 @@ static int madvise_priority(struct xe_device *xe, struct xe_vm *vm,
>  static int madvise_pin(struct xe_device *xe, struct xe_vm *vm,
>  		       struct xe_vma **vmas, int num_vmas, u64 value)
>  {
> -	XE_WARN_ON("NIY");
> +	WARN_ON("NIY");
>  	return 0;
>  }
>  
> -- 
> 2.39.2
> 
