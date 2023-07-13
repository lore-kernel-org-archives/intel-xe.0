Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD567EB64DD
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 05:10:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F22410E06F;
	Thu, 13 Jul 2023 05:10:49 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD7C510E06F
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jul 2023 05:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689225047; x=1720761047;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kD617t3fnwWCN5pETP3uSt6bG7Cdx6KIEaDpl4XbrnU=;
 b=jlQGqFJT1+WTQll343dLOp7BmVrigWoaPH5inBBCHQA0jA80aF0O0QMM
 gfchAX1C9oeVMa9nP4MkRFHLOxPtlT5Jf1vQkmb/U/pilRONrvXLqJr+E
 af3uiBo0mMBJ/VIxxEqfwWkPjva8yxsgODZiOOYvWBGd7iFhU8Lf7YXKj
 pSIvvkYS5tcDJegfUMlEbdPlRuwSoxbMFG2vf9Nu6fU6ZS7b/x6/Qk9su
 0SjFlavaGjbBcyJaUR/CmspC+YXO1LknuzfJ4Q5x0NHnvHjPqNKhAh2lK
 /e8Iky2/Htl2ztZvA7jChekG9z/mBMoyNF0GYPFn0AnM2BuBo4RMd7Yga Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="431239461"
X-IronPort-AV: E=Sophos;i="6.01,201,1684825200"; d="scan'208";a="431239461"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 22:10:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="791893983"
X-IronPort-AV: E=Sophos;i="6.01,201,1684825200"; d="scan'208";a="791893983"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP; 12 Jul 2023 22:10:46 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 12 Jul 2023 22:10:45 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 12 Jul 2023 22:10:45 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 12 Jul 2023 22:10:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oAs63ZRTgcvv2IsPT9osn46oPxe7oR2fo/rfVmnbKLSj8CKtaha8SqqDrlw6dF70yv+O5jl0diAP8wTyLEJdHshCGNKbvUlBjEqG1Y/7rKOqdREy1U8LacfrLzXtKZdOFGsjq/9aBdzAd8XoaPYikRRz2oYhT+icZvFZP+1osvXZ3S/6Suf3YNqFiwz16kmOYxzS8o/bOhBeAntffRbxZLIA/EVbJUkWXoAsHDv9fvg6PQQ8vWdy3Yw+mUiTSpNTP52YcSBJ0p5E90t3uaipJlCP7om/l20ZOTNezVqA18NCnYuatrDseYF68NF4KKY9YNscBrMkIPrEhMBtyqVH5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hqB2LuskyWbOEVBhEU46Ci7r6XFfZVZtjkYuZ006Jlo=;
 b=lYfVLQOy+LrtC+78fJAWWEUCyG3l5FIwRGN6aCoqUQECgTsN+8GUngaVYu/NpmKtJDPgGXfAsqPEHNdXZrpgywaie6P69H2Dz6whpTLxsknyCrrt8c0bdk8BsPvEpjE+JmZ4XaDxGrgQSRbEgbZeJEeaZXwOT+V4L2FR4Tp3s1V6sXrtJ3xTtJkDoVB6UhljpSpnkuL8DcZK5Ng7dcZESsrlojglx7zS7sXxpK2wq9zOfYcLJsosDqDsOFc9M/V5jL/CVmuBc0FgFiWaXCa1HijHKU2UoBMJLjJDPOEc54b5CNtchW94XyfQ+0KaeK0rOY5sqVtJqDuuAv7mZuDLfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4569.namprd11.prod.outlook.com (2603:10b6:303:54::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24; Thu, 13 Jul
 2023 05:10:44 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5%4]) with mapi id 15.20.6565.028; Thu, 13 Jul 2023
 05:10:44 +0000
Date: Thu, 13 Jul 2023 05:09:59 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Welty <brian.welty@intel.com>
Message-ID: <ZK+HJ7YG3N8uvg8B@DUT025-TGLU.fm.intel.com>
References: <20230713020105.21570-1-brian.welty@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230713020105.21570-1-brian.welty@intel.com>
X-ClientProxiedBy: SJ0PR03CA0053.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4569:EE_
X-MS-Office365-Filtering-Correlation-Id: bb816e7d-c1a3-4c41-324b-08db835f8295
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kmehcp19yoD0891mQosQT7nutjWmpYpU2zB2Rw9AXTE2stH8BYU+E1LKMPLVQzxTx8oYPr0PjDiOlGlqNQ06YYFHW41Q53IzoGwJfyE6DR0sAtjE3WcwlQJ4hYG8Z8b7TkV1aePpyK43FNFnF78uj89rBtqNn1nCTydxQcxkcfM9SdNNLDs69cf9/Luaf4fwVekr5bapqzaSBLg1gpKtvYF14ZgNQhRYa94BRhEE+gqNyYrrAWMijnytgwyRgNh9xA575RW9Hfhf9E991JTqaSOY525XVT604NiEC8+jHH3cHb74/nQRbECiEX1q1ty1FDplz/9sR+NvXnr62sU2ATpZBB34pYiQZApk9ZzyKPRWPy/ODKKCIE1lWoSIJGVF6V23uNcreMe3bXDYOI4lHbEy06VgnUT3D0oy2dgnL4Hoj7ILo9tKmkjjuZQ+9W/yMJGAjEfIwZxKs8zWfNYs4sVOA4VvUYHb8tjBaA3cwU1diwb6R6/oB7hVbunGFmyjveACHzMUD36SDO+9B+0Uj/zfqUqTPpv/7G0HfGYSaV9MWKnAb48uz8XBK2mXiX4s9P8aF1PEmAcwKoR/d4OfyyHF2DSvVk8D4NcfXB1vfUk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(39860400002)(346002)(366004)(136003)(451199021)(44832011)(5660300002)(8936002)(66556008)(8676002)(4326008)(41300700001)(6636002)(66476007)(2906002)(316002)(66946007)(6666004)(6486002)(6862004)(6512007)(6506007)(26005)(186003)(83380400001)(86362001)(38100700002)(478600001)(82960400001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xWwifII3R1lRenM5RNM1m9fXJXvhwcTeTWYR5A0HTtPsx4Rw11RFR/8Qtr+i?=
 =?us-ascii?Q?mbZUV49m8qwlmGRoE+EVggTijdq+Wk0By1etjPuDP923vtAiO2aOPybLnEmg?=
 =?us-ascii?Q?0XHNe51PPn/m+dWvqNRy76rPkn967c8eMIh5pGnieEs3Nig8UcYNmDT5MCM7?=
 =?us-ascii?Q?PHZEZbLWnz4XpZIDWpgJA0ldXK/gX2/sxL0eBJ65qy/n+GXGeIN0p9EsRWaQ?=
 =?us-ascii?Q?p5KdlgGqlGgT9twExW3a74O1DjJJ/QFIr0xH2i5tKBLshmn8USKB00LmpmNe?=
 =?us-ascii?Q?HOwFpTvv5FnkVNsSvNGU2WUOZSJDg0Jg3swyAe8IIIF2532S765nj3JG2NbK?=
 =?us-ascii?Q?kYnfOB204w8oR2h3qAcKyoBocFHuBui4Y3D0FzKpoZCdY8ENeNc/r5/Wk3DV?=
 =?us-ascii?Q?+FfG+XPGVGMN0P591OS5uG3xL3ZqHFzv+tR1eCrwsOpGOiyTNiJDkUcbyZv1?=
 =?us-ascii?Q?wNOiGfopel0G0HgKXd45ywI2dx+eh1RKo+K3JAS2pmTH4O0qgczBwxjj4X9d?=
 =?us-ascii?Q?G3DscoQtDz5dIRQ+wWg1M1H/AvdHSqXRRlpJREOYZ9g+JRCKA+d2EnhAmpH1?=
 =?us-ascii?Q?e3OqbK3zGhYrdrwRGIXsCLMH5OqInnuisZftZ/lRC8cXZ7F/pDAKCagyOmyQ?=
 =?us-ascii?Q?yRp9mjy/JClmyEu22AuayMjkEOPDyc7l3YU6zgMrqS5zQgrkpkDJ7jEKvnme?=
 =?us-ascii?Q?pLLzbUKPWGmHu9onf5m4Nr7fvaj6Nn24IBDDWj9KdfIz8X8mfECzUd1B6mfX?=
 =?us-ascii?Q?IbhyyBOQtrB/iJ0m50PJ2brUp7eVtB4hUKi+QcI3EUIA1Ogx+yZJnj3VdV94?=
 =?us-ascii?Q?v3PEZybC0D1Mh73RpgoiTma39ceVOUjrzP9gSyQ/zqLe+AhtqVmYcpb7FBUl?=
 =?us-ascii?Q?cSWmnvpW8Uux9vkIEc6f7VXcaVDGHjShYLRYVU8MXxPs+fJ7hOmGz0msJ/RG?=
 =?us-ascii?Q?H02sYygcH7gMKotHO65OKYZ2fFHla47TSho3piB2VoLoeCut9mtUDV64tY2e?=
 =?us-ascii?Q?zAeRQGqf7Q0sdsPBWnMP3HXjOCZdU7maJpOHmTSlpOd+UX/Js+ztdgJvjlSE?=
 =?us-ascii?Q?cnljXlnPKe7eb+35WpOArOAWde/pQM4X0orjyoBnk6InByHwHf6cI43fjOb7?=
 =?us-ascii?Q?v3Ktd2dEGedDnlztQcG6itWQnb8XsYkAZnaoazoR/M7ZU/Wu1ScdvspBd0tS?=
 =?us-ascii?Q?h7l8Ej+2cpxvWSccngzCzVJ/hDGswj4IcPNnes33+h9rYQ/LCHMSSiQyxJ0r?=
 =?us-ascii?Q?NbqMKVsQWNotuZrS+xYZASulgRfXSYaPs1NkjeP3EAp0MmWHBKBOEZwO/jZP?=
 =?us-ascii?Q?NQW5Y7eoKZxs7IIw46mOo1yDrYiEnEItb6lY7SiGIqR7U5g/sC3/4lcEEzsZ?=
 =?us-ascii?Q?yg2qyeLvenhvNczoQWbgphAkygqI2SWBGGseKBaSdTQz3Zsu8M3EM6o2ciBX?=
 =?us-ascii?Q?OVYxGd7rh6svVzKViBghqjCA9xGJPz4zRp9gLris/kRYhqO4USK0dLfoWPGE?=
 =?us-ascii?Q?IoAoJfcxJRt5+0kj99HcHGsIishbzAOMZ2oRNZnPwhufwiwkKs6VrOgMqs8j?=
 =?us-ascii?Q?mO5xxK0CceYEkI6tFhyBHKAVoqAQ9CMgjLNAjYaFpB0ah8YQ/YZ5VKTyvv7I?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb816e7d-c1a3-4c41-324b-08db835f8295
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 05:10:44.0310 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4nP0AV9sXEOSxHrJlmep9cEdHeK5HZxymI/bhecVI2JjwzcabOPlsf9aiBf9cEzEzXDOGi9mEDP+JE2aVqhZ5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4569
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix lockdep warning from
 xe_vm_madvise
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

On Wed, Jul 12, 2023 at 07:01:05PM -0700, Brian Welty wrote:
> We need to hold vm->lock before the xe_vm_is_closed_or_banned().
> 
> Else we get this splat:
> [  802.555227] ------------[ cut here ]------------
> [  802.555234] WARNING: CPU: 33 PID: 3122 at drivers/gpu/drm/xe/xe_vm.h:60 xe_vm_madvise_ioctl+0x2de/0x440 [xe]
> [  802.555515] CPU: 33 PID: 3122 Comm: xe_exec_fault_m Tainted: G        W          6.4.0-xe+ #16
> ...
> [  802.555709] Call Trace:
> [  802.555714]  <TASK>
> [  802.555720]  ? __warn+0x81/0x170
> [  802.555737]  ? xe_vm_madvise_ioctl+0x2de/0x440 [xe]
> 
> Fixes: 627d78b9d038 ("drm/xe: Ban a VM if rebind worker hits an error")
> Signed-off-by: Brian Welty <brian.welty@intel.com>

Thanks for the fix. LGTM.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vm_madvise.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index d6e3b76bf590..7532a60a24f0 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -267,11 +267,6 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
>  	if (XE_IOCTL_ERR(xe, !vm))
>  		return -EINVAL;
>  
> -	if (XE_IOCTL_ERR(xe, xe_vm_is_closed_or_banned(vm))) {
> -		err = -ENOENT;
> -		goto put_vm;
> -	}
> -
>  	if (XE_IOCTL_ERR(xe, !xe_vm_in_fault_mode(vm))) {
>  		err = -EINVAL;
>  		goto put_vm;
> @@ -279,6 +274,11 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
>  
>  	down_read(&vm->lock);
>  
> +	if (XE_IOCTL_ERR(xe, xe_vm_is_closed_or_banned(vm))) {
> +		err = -ENOENT;
> +		goto unlock_vm;
> +	}
> +
>  	vmas = get_vmas(vm, &num_vmas, args->addr, args->range);
>  	if (XE_IOCTL_ERR(xe, err))
>  		goto unlock_vm;
> -- 
> 2.38.0
> 
