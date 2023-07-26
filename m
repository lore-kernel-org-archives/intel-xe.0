Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33346C001DF
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 18:29:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073EB10E0A2;
	Wed, 26 Jul 2023 18:29:24 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3806110E0A2
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 18:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690396163; x=1721932163;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1V7++S8j0fuKSrsMYy7sNzSZPDRS6LeOCD6OjQJ1I30=;
 b=JW6gCd9GRBy3D6m0Da04T51FHKyV5ONZZNRte9QjUpZbEnKuD8f6kOe6
 aczgBOM8rHZnuEKfIo+2lj7SiPba8jj+3ycXuZy3ds0ZQoUm8EJgSgEKm
 ECnwT1O4u6otLkUsE9E5UAjgXc0/YBta1KuuaL0SgU0w0BGjxqHAyBSpw
 0UCjU6TwoO4Q5jcC8mCJlhQ5jp8Bb1Wry+1Q/KUhTpiM831bQTSCFUwWf
 Lly63Q5adiWm1H2rCUhjmFTquys0Y3obtOJbMKtDVZXqvmd5qSweiuHHC
 5nRcFlIFerO4GuzlZLBEiYoXeZWkZ4CU7PHX9FStgc+SnV3UVqnIOMFi8 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="353000535"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="353000535"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 11:29:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="816798339"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="816798339"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 26 Jul 2023 11:29:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 11:29:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 11:29:17 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 11:29:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bSgWcS2fPn62iLTzZeUbV4GvZecx/QQnOWt7BnO3CmGiGFi1CTzKbRi05RybquZ1+PbVvppCQOLHaYN2J7Zj8eub06eG6tRBwWFsrprJurMa6wllHOoAoWQVViZnucg8xBCdFg8k2MS65PApXcxO0da3arf9wQWW5PyozsWbRN9HzXyOYAkidGzJCiadm26Qgp692+WRNdjqXYCb/NwjWIEdl1yNU/RR5YSFxHqDImrY3F8Km9o9JWtNZW7sJHOzPc1d0uCs4KBS2PFtV5z4NuQZMQjoB1hcPCoAWv/6m4crfPL7jqlaLUlFwJX2MQd+McdlwJ9Vh/6WAlELBeGwcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iMZr0w3Y1jAm9gEHBXQiPeP+0VS/oRy/ANZCoF9FnX0=;
 b=RsjN6bKLbHfozKXCQ/pQ7BWYGJmnTMSIxMd0zn+gzMNKf+Vj1HIfQDViUzelxwmx923+bovc3bhnljXqbvMgELH/WqMeB6wwYbEiGqT15E328gLlpN0dWwa9Un9hzHbYQLUjMKWcSQKB7YV9ifUycTZJb9dtdFpqh1bZFWtLgHNEXpXkPf8SlbGApBITfMF8mqG+9xsZMLl9GIWml321d424H8GJqb+hgL2y/t+DKiglP0faQAAE7raFake3qQhlGLXkXrDKvE578j3RmTg3J2nWLDWrGRtLNpsTCs1ZthT0G+oB6pJMGDZENXJdIWmyjpeXrMRPy2up7CJcQLtOFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH0PR11MB8142.namprd11.prod.outlook.com (2603:10b6:610:18c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 18:29:10 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 18:29:09 +0000
Date: Wed, 26 Jul 2023 14:29:05 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZMFl8UZl2ZsfaTcH@intel.com>
References: <20230726092348.212488-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230726092348.212488-2-matthew.auld@intel.com>
X-ClientProxiedBy: BYAPR05CA0061.namprd05.prod.outlook.com
 (2603:10b6:a03:74::38) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH0PR11MB8142:EE_
X-MS-Office365-Filtering-Correlation-Id: 543dce23-79fe-4f52-8153-08db8e0633cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o979USy4Fc5eoelwIZOMAtg52xUISXZNZ4rlqiPLnNeQm3Z3sR28x9VD4vXYdnQYwkTWHJcI7+2ZqiipIisMQawzdlqSIF2WggCaNTsL518p48kzt+9YZEPwnqLdydHVtKCSbvMu5Ab8TF3Yf02QuRhUuZwETmTNrPlfx7DNK7XVFB85T6sKJWzT8L6V/IW3MQcGTYuL+Bp/spljM85zhHgvXJzUk7VKbYRpP988lOoqdLYltx4N1YleGrfhkjM8fp+e6IIxM0w5w1p6A+qV7U0QeOTb4v+ZwznGSm8kcmtrUr0dEb/FIhMwHe8d0u+5B/QAPPyUKiW1m2A53eKLJpqjYMdfYKNOI5qVciHTlRepOIH5fzKAfiyOImGvagBX9kT70xeAFy4KpHiMdeINUmiMiyijsIC6AtsyYuVFgUveHk2Llsss4l2PbsKRRiA7rJiGdL7xS/aolauqXGNSLitxzrJO0kT1+AL+e6D/NTFaIHdlE/b2YviUf2tlLYELboJwo+gEkdoCIqfNUTy7y4uK9y93f4jd7KK4VrkAmDi8tVb/iMGhbHknqavTWmQGOJX1KsLxDRv5YhOisi6z3Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(366004)(396003)(136003)(39860400002)(451199021)(316002)(6506007)(26005)(8936002)(41300700001)(66899021)(6862004)(8676002)(107886003)(37006003)(82960400001)(478600001)(966005)(66556008)(6512007)(6636002)(66946007)(4326008)(66476007)(6666004)(6486002)(38100700002)(36756003)(2616005)(2906002)(83380400001)(86362001)(44832011)(186003)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7YRdcjzAFWM7dQXbgt0vEEHZ9Knt/kiqTTwqmiKOku802kInvQbaOVfB25Rz?=
 =?us-ascii?Q?A0WEpNw2maiVSa+OVwEaf+p09mWl0vgKdNGEANDJ+SSCKU+mTb6rJyiJ3lAT?=
 =?us-ascii?Q?XmYK8bf2ypAxZyLf6QYw/GV9nFahmffyFnieVEMB2MOSHuFpiFHKcjKnnvAw?=
 =?us-ascii?Q?bL+Mw2X+IVWDXGb6Kd3+7Bts338u4CbDVbvJJr1oc8QO1IO1xTMj+o226Bku?=
 =?us-ascii?Q?31oXLpRE+qOSY8AjoG3m2clHeksiQ4hK97LfbouixgyvdVPRvLh14Ku1wsvA?=
 =?us-ascii?Q?p6xGOi4GJmxbELFpuB3k7ncSEkXDDelJt5CEKJYOj4aqXc54stYEeXtAX1Oy?=
 =?us-ascii?Q?0z1Ib9ABTB5lG5AxfhkL0FUOW5vBaofmoN5az9iV8HPCQNxuf0wYzEDnZmQj?=
 =?us-ascii?Q?Z9rMQZ6/OmB0NEU62f9qQ29763PEN1GDb2mPFdg12Pi/PMoaXNpKVhmAkwm+?=
 =?us-ascii?Q?+QdONPyPpTJpa0rITGej9UE7SRHLSg9bcbLQ8J7rA1hqpUH0S8udP2mVnGju?=
 =?us-ascii?Q?OuMxB5TqrD+YM90RzJNycumfHR7BPAu1ke/nm6+cURNhieynEKR0rvcEfk9z?=
 =?us-ascii?Q?Obs+OzV7ed+69w/k4kpv2diqnlP8TMLShWhLPjlSyws5voBVkIUdnV3j/ind?=
 =?us-ascii?Q?0xm1ZwSi85Wy0/+QR9Hh5D4zoJWp4q2MupWpL7k7jyFoJk+L2s1vjdjEy2Lk?=
 =?us-ascii?Q?SlIYN6mz+Mg043J+9VOCVgQKtRZ1isIIXTBIGZCbnC36F/zjsMUFpdUhusrW?=
 =?us-ascii?Q?SaERkXund2KA1gOL4m4MbssvggJ6N2WyksFeuUBwnddmYrLP7rrOYOT6S1DV?=
 =?us-ascii?Q?xeG1bLlP9IU6Ow2xWGSHLGswOqY6OpRvarfG9KD/bmfdAbBcHMHoPdjy0/fJ?=
 =?us-ascii?Q?FoYp/pH7p4buaKIsf3YsDNQzkxD5xeHEn7MwJTFLW2W7/a5fzlYrI2lK3Dn5?=
 =?us-ascii?Q?j/2jSgM5GHCob92iIQ+Fh01VZEq0eEBHDYCfNMKceymwGgwt6zDW0bVLnPhk?=
 =?us-ascii?Q?dOlhD5Aloo/6h3MgmbxeYi82gXX/gMipr8HjbDYuZc5HVL7L/MwZTE3etgIj?=
 =?us-ascii?Q?MI/Cjx8LFRDe5Uhas8nt9ihbEGyuTAamOzU2lvXI2STP21Jqi2jUQpkdHMCu?=
 =?us-ascii?Q?SdqTwpBrhrs6GYMgWdJJhI2U/lzDT6EyCSsRp1ZeiGQ/kQxCRrbB6aoEFbe+?=
 =?us-ascii?Q?OB54AFCm3jwR/aMN2AIMAZMZ+nw6O7RKcdf7iYoxflQnTtTPwE4qCaUAsK8n?=
 =?us-ascii?Q?CzGwNvPuFAP9GwLG7bT4KNxCw+9r2nGq54T7fN9hM1/CMApbf/hgCMz/wtOB?=
 =?us-ascii?Q?V4WtUkoFDYzGbERwBklNgJvrTzFQnYmdnugpNdI5uImQKrNaTpb/OA6QvpwM?=
 =?us-ascii?Q?/30OlI4epYyzimOVg+j8RnH6BQub1VK8fGuc3wtJZRq1wLldjesvRM9QLbTW?=
 =?us-ascii?Q?k7JGUVxQWwBwDQnHlzZciLBEvbxYv54vPFcBdASvfZePAkGci6AURLJUHGpP?=
 =?us-ascii?Q?k8FRB6QSN3Ix3ujSnbhROSUIg0ooa0y/iE5iothPdDoy4YLdOBxJhI0eOBku?=
 =?us-ascii?Q?r2/8LxbRvBW41ogOlwBdrNMdfouhW/ubbZK7N+J1x/Q+W42TMEVhoTP2L7Mc?=
 =?us-ascii?Q?Mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 543dce23-79fe-4f52-8153-08db8e0633cf
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 18:29:09.6760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vEQU9kxHmvWniFwCeW6RJMguAUtyGLYTuJdmU3uycmrxLdx737LPEhRQ6gbT9u5hObFmFSC4Id17U4dSNSzNcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8142
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe/engine: add missing rpm for bind
 engines
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

On Wed, Jul 26, 2023 at 10:23:49AM +0100, Matthew Auld wrote:
> Bind engines need to use the migration vm, however we don't have any rpm
> for such a vm, otherwise the kernel would prevent rpm suspend-resume.
> There are two issues here, first is the actual engine create which needs
> to touch the lrc, but since that is in VRAM we trigger loads of missing
> mem_access asserts. The second issue is when destroying the actual
> engine, which requires GuC CT to deregister the context.
> 
> v2 (Rodrigo):
>   - Just use ENGINE_FLAG_VM as the indicator that we need to hold an rpm
>     ref. This also handles the case in xe_vm_create() where we create
>     default bind engines.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/499
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/504
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_engine.c       | 19 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_engine_types.h |  1 +
>  2 files changed, 20 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
> index 0102dad16e29..c30810a687b1 100644
> --- a/drivers/gpu/drm/xe/xe_engine.c
> +++ b/drivers/gpu/drm/xe/xe_engine.c
> @@ -76,6 +76,17 @@ static struct xe_engine *__xe_engine_create(struct xe_device *xe,
>  	if (err)
>  		goto err_lrc;
>  
> +	/*
> +	 * Normally the user vm holds an rpm ref to keep the device
> +	 * awake, and the context holds a ref for the vm, however for
> +	 * some engines we use the kernels migrate vm underneath which
> +	 * offers no such rpm ref. Make sure we keep a ref here, so we
> +	 * can perform GuC CT actions when needed. Caller is expected to
> +	 * have already grabbed the rpm ref outside any sensitive locks.
> +	 */
> +	if (e->flags & ENGINE_FLAG_VM)
> +		drm_WARN_ON(&xe->drm, !xe_device_mem_access_get_if_ongoing(xe));
> +
>  	return e;
>  
>  err_lrc:
> @@ -152,6 +163,8 @@ void xe_engine_fini(struct xe_engine *e)
>  		xe_lrc_finish(e->lrc + i);
>  	if (e->vm)
>  		xe_vm_put(e->vm);
> +	if (e->flags & ENGINE_FLAG_VM)
> +		xe_device_mem_access_put(gt_to_xe(e->gt));
>  
>  	kfree(e);
>  }
> @@ -560,6 +573,9 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
>  			if (XE_IOCTL_DBG(xe, !hwe))
>  				return -EINVAL;
>  
> +			/* The migration vm doesn't hold rpm ref */
> +			xe_device_mem_access_get(xe);
> +
>  			migrate_vm = xe_migrate_get_vm(gt_to_tile(gt)->migrate);
>  			new = xe_engine_create(xe, migrate_vm, logical_mask,
>  					       args->width, hwe,
> @@ -568,6 +584,9 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
>  					       (id ?
>  					       ENGINE_FLAG_BIND_ENGINE_CHILD :
>  					       0));
> +
> +			xe_device_mem_access_put(xe); /* now held by engine */
> +
>  			xe_vm_put(migrate_vm);
>  			if (IS_ERR(new)) {
>  				err = PTR_ERR(new);
> diff --git a/drivers/gpu/drm/xe/xe_engine_types.h b/drivers/gpu/drm/xe/xe_engine_types.h
> index 36bfaeec23f4..7aa5d9ef7896 100644
> --- a/drivers/gpu/drm/xe/xe_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_engine_types.h
> @@ -56,6 +56,7 @@ struct xe_engine {
>  #define ENGINE_FLAG_KERNEL		BIT(1)
>  #define ENGINE_FLAG_PERSISTENT		BIT(2)
>  #define ENGINE_FLAG_COMPUTE_MODE	BIT(3)
> +/* Caller needs to hold rpm ref when creating engine with ENGINE_FLAG_VM */
>  #define ENGINE_FLAG_VM			BIT(4)
>  #define ENGINE_FLAG_BIND_ENGINE_CHILD	BIT(5)
>  #define ENGINE_FLAG_WA			BIT(6)
> -- 
> 2.41.0
> 
