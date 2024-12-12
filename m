Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F42E7717D
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 03:09:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E0DE10ECA4;
	Thu, 12 Dec 2024 03:09:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Akr7Sqzp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6946910ECA4
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 03:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733972957; x=1765508957;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=U8RhdK+tCNhtwbMKNxReH1FeQBYmsaS+2TdX2rq9nkM=;
 b=Akr7SqzpBgIyWTYa32laLVv68L8xq1ohE6irg2oGvrbupAuiNwDYuXaN
 o4DyiEm/eV8ZWyUu/eoP3kaaQIpsBt40RmS++t3Lw4WbugIxIjeZe7SXe
 HrbrvKyw/j/yD+KPcphoHiTCeFNCcf90gby4n1E8AIVPdbNRObDCASuOF
 +2N70x3FY415fqPEb77lXRKBBlQ0CJ/KY6rZ2lTju+KIl65RmW0AoKzAb
 nJ2tBrFf/b0L9b2mm9+XVaJQzhSSJzn0tL4Ynj+lU3O3ekLPe0gATXrYr
 nyCxks9BbVV9JVrbr9KFv8xB+tg8HmwBXQ8R1LwK0+AO9m69XD6efI3nY Q==;
X-CSE-ConnectionGUID: 6Fb4FYiFTZmVQsWd2LCTcg==
X-CSE-MsgGUID: nEKSHxj4S7mbwgwFnwufZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="33705862"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="33705862"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 19:09:17 -0800
X-CSE-ConnectionGUID: HJX4I1gqQPup2W3B80rT8A==
X-CSE-MsgGUID: O7umwqebSKy0WLMsj2fj8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="96590074"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2024 19:09:16 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Dec 2024 19:09:16 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Dec 2024 19:09:16 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 19:09:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=klJJOj8EGxY+hVf2CHplNL4l3oWfMJWhrdIflDTFt+DYY095TkX9udJq7Dz46q4QuHUrBWJoJiIeJbRaawNzDpK3TRWhDd7F1Z/gRj0nWErZ69/Q9j0/Tqe2gDCfQ9d85b0Qb4EyIc261mWbCJyh7A3A8yNyoMCDS7lFxjE00cLeQ222gtu7FRYW/3IlqKkV4kGDbrR+g5hDFaNkPRSgnHhaDhftU9uFjILLsKDLQKEwbb6ArW3YqUgwk1GCQa8OprE0TKXpkpTry1Z6bBsFiJ3ONsS/fdr+i8VBpI6ZWc1v1o97HdgCvUM9LcmqVMogXZ0xaQABYc8ogaj9/8AfGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rdhKiMSYJhhNTUihA/yhmS/h/s+uNEc6/M5qsKaVkpA=;
 b=N7237yfbwttGjq1Aw+KcZuQFVIuRlXaCSi+GgP61sv4SPvf1NFi5HaWM4mim6HDleUskmtJTWkxIE6z4RDH6jW8rmI/1/c52zQaza4WF2nFSMeeCFTOZB0m11fmLjIDRqL/uq36uNhEQbgJPg+2QDHPTcryAlO4ARLfdb732yPNQ3H0hIMkXWT+G07MKke4NRl5S4Z+HP3WluUmVOEYZT0mexaNVJa+PwhydBfsB16WKujb3kcS80dixigAy5QkbVNimyGhe9VokQ1fx7PYWtfcDEWIk8MBqDaChmCpOqX46txBbR1e0Un/xESu8dfJlI26pmCF3fvpWbQllMtPj6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH8PR11MB6755.namprd11.prod.outlook.com (2603:10b6:510:1ca::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Thu, 12 Dec
 2024 03:09:10 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%6]) with mapi id 15.20.8230.016; Thu, 12 Dec 2024
 03:09:10 +0000
Date: Wed, 11 Dec 2024 19:09:52 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 04/13] drm/xe/sa: Drop useless is_iomem member
Message-ID: <Z1pUAL6Nh5Jp+3Rd@lstrano-desk.jf.intel.com>
References: <20241212010141.389-1-michal.wajdeczko@intel.com>
 <20241212010141.389-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241212010141.389-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR05CA0053.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::28) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH8PR11MB6755:EE_
X-MS-Office365-Filtering-Correlation-Id: 597a8765-376d-4f44-1879-08dd1a5a5957
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0NYrQxiUteOnklqtfp12rvR1Ebu24V+AbRFExQRFLDNA75mPQVjzHNsQsymV?=
 =?us-ascii?Q?JPTg4qFxfF2TZkpuJ/NkdhUP3Xt0iSvLj+cc5gzeeVXVUJFFOMqme4e4fHgd?=
 =?us-ascii?Q?bqIToQApjGthcVJ4x5G5j6+h8PKiYNGvESPcKTnjHqMHBtLnkrMBbPTb2L3w?=
 =?us-ascii?Q?ud4vhrgPTUSS2dT3IlSYXLh+k9Yuof1+BzFCHTP67nvLmVT/wIAsf5e/RaAW?=
 =?us-ascii?Q?D7/Xjzy7Q6FS6ju6dL/U5uIEKfb9HPK6mhJlrfeJe/TZrPsxcBmTa5F1vDXu?=
 =?us-ascii?Q?wmfHrhzdOnte7DLc/9OHz7hCl6kR+x7HCUFpbOJWywtGCILZvMGu7WvrU7m2?=
 =?us-ascii?Q?tijIM+vxS6BVulEimMtcA2KDZTe3yc+gsTy0BZaniX+yVUeoyDCb+GBxeQea?=
 =?us-ascii?Q?FcpV5RlKEjJqeU6MKiD+3tVRKuthK4RgFeGVvuP3ZfC8LGshkLKuRqi2KNs1?=
 =?us-ascii?Q?U9/Rj5PikNqaA22ecP+KaoEXbsYSLumqvNl5ASKlbGsqF1Kiy5olaeSOU9DR?=
 =?us-ascii?Q?Y2jpBmepA+kAuQQGM6A+mFnTLu0bI5wOKZfGnTBZ5NL3hUJk0rgzfwxFujQk?=
 =?us-ascii?Q?3BNN6NJlCj6jkyjUzQhQLo4ZBv/mfaAO75DPC7nrElJ9A5TerY0uGkBEzf9E?=
 =?us-ascii?Q?c88ax8axCPI3rM4niGMjTUiqnEfCK1ZJiQH80FWcHZxvdCQT9DoseebbgzEW?=
 =?us-ascii?Q?AO0NAeeXOOlGCTwRvyt5qQ8LQvSTTzxrhaWX4bZCgMsf1g/gzWRDX3ssDT9Q?=
 =?us-ascii?Q?NYDrbA+W/Q0lQhNy87ji1/aMuLJ0UDQio7yqu8M/ETifnHrD5K9n70UB4IoE?=
 =?us-ascii?Q?3Uk/tYcGdOzlN0HEye90kGaKkepQD1n8NFsedpirprRYe/R5z5aJC+bHGAkt?=
 =?us-ascii?Q?6tFUEMZlwxXLi2RTKkHKbPftPLDVQ/6choKncitxjnUOAH7VBcHPKC9SuSxY?=
 =?us-ascii?Q?aofGAHvMDO78j1DinhbVHT0dsDykY4UaZtRxg6eQ0RGg4WWm8JxzxE2eto69?=
 =?us-ascii?Q?iKDsPed4Z/k7FrFH7MBzmWbx9b+u6u3M/+79UWP5TV4EoQKlyDA78tLG+wdE?=
 =?us-ascii?Q?6EKot7vrOfX0cL6keO8F8lP8Yl6gr9/V9TqsMs5vc6Nh3GHbQWeEwO5z7/TY?=
 =?us-ascii?Q?hoY9NlDSkSrAklnU+mCCn4ZVnz5KCAkfc5lknPbYq8sUeDZK6WOgD+PrsgUH?=
 =?us-ascii?Q?EUmQaQsG3yzR2fHvTZyMZyRP1t0U5MovRJrfmGTUoyvAu3i8xfnGWaYHb/Gs?=
 =?us-ascii?Q?HEp/KpdoFjELz7yan/aFZkitA+GTmA4TyBuzWBUNN+ayJ2tILpXU/hsao3lF?=
 =?us-ascii?Q?5pnCM7Vh5XZ8mOtIAyOzngrfDhZYPH3vfqVJDCqeSol9RQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k113PMdoo1s2lMHKhx7Rh8ODcGys0kAYG1wgNFSQ1yx+6Q5d4a9XvO7pwdrk?=
 =?us-ascii?Q?Ma1taqmn0HSJRcFdvz5NXvMlvW3a4X85yQA7x0y8rWYfRIQEyt8Ab2tDldm2?=
 =?us-ascii?Q?b9nRVlkZq7Il7Efy892ZKuXJu9sKmVkrCsRZsGtHVPWS7jHXz04Kgp6nm5Du?=
 =?us-ascii?Q?AnB9fRrbCsL6hQSYd0Sj0d4Y9RmuHDeg7qtjx9AP/ZBDdyK2LRbj4Xt+YnZu?=
 =?us-ascii?Q?UBSqDJIFSusVGgTWZNm9QueL97DwzYETql+t+FpSh9G+zX7JD6xBgqMb5/mb?=
 =?us-ascii?Q?bKxs//6Mns2rcB1ms0d71/H+l74jw4y9IPPWXH3+6FOLwSSc811vHK/aqRMs?=
 =?us-ascii?Q?bxfWdMItut3lnnWapG5Mwb/a8zOOL/DrCNrwBaQLm8Bwpwh5l4RYpU0kL9j0?=
 =?us-ascii?Q?XGsLmYtUQWd7y/AVr9wAHUS+8iWOrH08AVmLvwXdIXTWArdaWENyijDVhD4s?=
 =?us-ascii?Q?nq8ABLg6o5PVWjJkpjMYT0a60IkTrmSSLriWiNKpeS6slC5csceUe5dVRHXt?=
 =?us-ascii?Q?2l2LjuaVHXVGtMq5RCwYLWVlf+6EOEM7XI5DnzTYsCLXawjlThVjGK9Ic48Z?=
 =?us-ascii?Q?oCfCgg/SlMszrzgnnCBYhiETrQQPEwGL0xpcfqz5D8CK54I1mt6fi8A+04Xr?=
 =?us-ascii?Q?PpGUrVEjq8RlblHjDIXvdnVgKADp/YG2xRjSjhFTKxtMkTnYKcx37XNmwCcX?=
 =?us-ascii?Q?5sMvCDBgXmBlywJXAZkBENLEC3x8BX2CErBbOEBwK0DisE5rbNKZhBhfZE+f?=
 =?us-ascii?Q?nxUT2fjdgQXmgw2IR54o7i+pllBPAMbWX+crC3kUEkBHRv6crMASmf5PZzG3?=
 =?us-ascii?Q?y6v5PpBt4Owe+LnzxKElAKr0cAQzbdTBUiH1mtQVnYoGfD/sT6ogQoqxOBjS?=
 =?us-ascii?Q?kObP/4yNP2xVFM6YSFz/ke5NejVKs9iq4q29vhbRYF6ibqdRDhWvR53xogsW?=
 =?us-ascii?Q?PGe3EzMrqTGHdQ+ojMac8ClS2aFHB3cF2QTuV0m+jSsWpuoN6k5OCfx2nIZg?=
 =?us-ascii?Q?9jtEaAYLEuyHZEysQySSnbxsu6kg7WCw+9rjHm6zha3iBJ5b7Taj5PwBfwQJ?=
 =?us-ascii?Q?wiKA+QHQyLoMp8HuAzJbL/vGG3co1FLhQBCI0DInfae2tJF65G7yRiRhHbSu?=
 =?us-ascii?Q?71rnNfQUnU9w4qEMEW5r+UEr5xgRHa9lFeMYpAeE2b7/e/9+0H/ZWqaaJ3zy?=
 =?us-ascii?Q?WE6ffKRzIa8MMkEob5VBuWRjAFKhaATjoY5dKQQg7DpSRZTRBAKNYKffGlDV?=
 =?us-ascii?Q?wB6Ti43kRT9DHqq2RxvO68DUCeZ3Re6ABSjjgBqphxkw7u4jydlmLmaj0gX1?=
 =?us-ascii?Q?H48oI1J+a2Jr8IH8Ck98/rW5eJQHtJLeVKBW7l19ORAW5EaKvhqpuzFA3Wn3?=
 =?us-ascii?Q?W1GbviZTUz150M2Q4lN2mjFr36skDr9SOcD81Yw1iq5hU23t02tR2bPTgyeK?=
 =?us-ascii?Q?VzvCJtKfzH4D7b7yh2WLcNTOmi+YGVXc8s2jshnYEky+zvdXtpT8bwaBKv5i?=
 =?us-ascii?Q?6ZD0cYfzG+w2g4a7m7+FJSrVpCIBp58MFdTGUbcrXmoG8/fGJ147RV2rcvkX?=
 =?us-ascii?Q?LMtR2jTketP8cgBvQA1fpAw98/yFgb/d8g5sntrmKbwOv09fQm5xrHfnl0KH?=
 =?us-ascii?Q?mA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 597a8765-376d-4f44-1879-08dd1a5a5957
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 03:09:10.6329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gZ7OetaAtP4qYnFvktJJ8Zvb5K5w+2kOPVjZyZ+KYzWf7XmzWHTvGoVrtdlUW74mS4976XvsPB2NMIfN3GYS3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6755
X-OriginatorOrg: intel.com
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

On Thu, Dec 12, 2024 at 02:01:32AM +0100, Michal Wajdeczko wrote:
> We can rely on the sa->bo->vmap.is_iomem instead as sa->bo is
> still available at this moment.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sa.c       | 3 +--
>  drivers/gpu/drm/xe/xe_sa_types.h | 1 -
>  2 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
> index a5e05237b646..b990bd8a49fd 100644
> --- a/drivers/gpu/drm/xe/xe_sa.c
> +++ b/drivers/gpu/drm/xe/xe_sa.c
> @@ -24,7 +24,7 @@ static void sa_bo_manager_fini_bo(void *arg)
>  {
>  	struct xe_sa_manager *sa_manager = arg;
>  
> -	if (sa_manager->is_iomem)
> +	if (sa_manager->bo->vmap.is_iomem)

If we do this anywhere else in the driver (e.g. check bo->vmap.is_iomem)
then maybe add a BO layer helper for this check. If not, fine with this
open coded here.

Anyways:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

>  		kvfree(sa_manager->cpu_ptr);
>  
>  	sa_manager->cpu_ptr = NULL;
> @@ -55,7 +55,6 @@ struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32
>  		return ERR_CAST(bo);
>  	}
>  	sa_manager->bo = bo;
> -	sa_manager->is_iomem = bo->vmap.is_iomem;
>  	sa_manager->gpu_addr = xe_bo_ggtt_addr(bo);
>  
>  	if (bo->vmap.is_iomem) {
> diff --git a/drivers/gpu/drm/xe/xe_sa_types.h b/drivers/gpu/drm/xe/xe_sa_types.h
> index 2b070ff1292e..2ef896aeca1d 100644
> --- a/drivers/gpu/drm/xe/xe_sa_types.h
> +++ b/drivers/gpu/drm/xe/xe_sa_types.h
> @@ -14,7 +14,6 @@ struct xe_sa_manager {
>  	struct xe_bo *bo;
>  	u64 gpu_addr;
>  	void *cpu_ptr;
> -	bool is_iomem;
>  };
>  
>  #endif
> -- 
> 2.47.1
> 
