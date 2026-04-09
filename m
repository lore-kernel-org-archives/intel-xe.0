Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 255EDF364C1
	for <intel-xe@archiver.kernel.org>; Thu,  9 Apr 2026 22:01:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD4DD10E07F;
	Thu,  9 Apr 2026 22:01:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mIF8h+Or";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E42E10E07F
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Apr 2026 22:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775772064; x=1807308064;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vgYAS2SAJCzNka29ZYx0dXAIH/e85pvgFrf9j4zcc3k=;
 b=mIF8h+OrenO0rnjMBa/gCmCkC9pfUk0FYI6N26Qcx2snArO+cjn5WiD+
 WkOvF2vniQJjPZ0dHFhwIBgb8vDlEWdIi7aPmRPWKJsZ6pkIgtxPnqWgT
 pB2jHWWw69OfkDCnsAj+bKMjeqF5cWlvGu9FvNo39WQlB+Sy2LSp6xCLV
 AWFFoLsGvbRPCBHKSaDV5NInSYJ4omfdpGoDcFCo5+dDlSMb9nlPsrDa2
 +7prw+QYPdXmrTtCtlfwQyCDXYM7LsF4Hk815uq74OT5oyDDX4F9luOjG
 Ly6qYU6ctBynBVWimlabI8eFYhozhHoXMCm7pCN6eOOY3K8yq/2I17gQ/ A==;
X-CSE-ConnectionGUID: 3MYrYX30S026ak6q6LN79g==
X-CSE-MsgGUID: QHzl9exhSt+yx+9zkksyXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76972931"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; d="scan'208";a="76972931"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 15:01:03 -0700
X-CSE-ConnectionGUID: CQSD72aAQUOGNQGpmIjkFA==
X-CSE-MsgGUID: N4VxCGuuQfGlbWw/ohQzuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; d="scan'208";a="252251083"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 15:01:02 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 15:01:02 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 9 Apr 2026 15:01:02 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.51) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 15:01:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SAsZ7sFqFWyywASgIrFPQFwWP38Y1sORfqPJyWnBui2JELeIWJgUcRToykJKxVXiGH69RuSeLDnglY/mErIEVltgZycqSX3LQS8n0PrkDo09eghgsRU84P2hmxBi7lSYK1B4UqVoy99VppQf91tzNI+NyGL4YV/nvd/8ewIN2CWfBVoz0ioXKdDjooK4xxvKgk+20fEWdx8K3iKpitcbBVva8o/zq5LV3862tlfkYI5gUu0Vt3vlE9izPqCL3Gqknld1/xFLfEgKaVIJk5IgL4an7CTaGVjlemt599rXrtZb2F8qbTyyxs/4v0Sc/rLvrL4grWd6WdgHRtQW4CGbFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3OFbaX6Pd3mg3YzAM9aVrKtKC/QZXdTWxeuoB0V6j3M=;
 b=UK9TY5m7G0G0FFDfrrrckE0Uh24i6DD0XdxGuKf0hD6Z4e1MfEgaoPmguhshHpM+HDkQLS6Oqdqy1NhUlSm3ORyzsAaMWRXZwrU+BzBTfAKH5VKBsLvJo78s39JdmLfnKgMAwohPOvDDJJhx4IyeK2sg19llLxdaHVbLDW2TkewGru0AyaruOAWhzYjKhLAtkTf4BM2GAhr8chUnp6VgE7ZdUJqekzsLGO2aLLd5mS6TqcatBaHFH7HGrXeLTkQTZ4hJKU4wZW4N4i0NTZe1XNhyw4paSQA7GsFP4S/Xeyg6154Wn0w/AF5AZDS5IenpJsSupzOdg4nqoKW+RquZOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SA1PR11MB7112.namprd11.prod.outlook.com (2603:10b6:806:2b7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Thu, 9 Apr
 2026 22:00:54 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.016; Thu, 9 Apr 2026
 22:00:53 +0000
Date: Thu, 9 Apr 2026 15:00:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH 3/5] drm/xe/multi_queue: Capture queue run times for
 active queues
Message-ID: <adghk+3e1ZpvWhKX@gsse-cloud1.jf.intel.com>
References: <20260409203714.1887402-7-umesh.nerlige.ramappa@intel.com>
 <20260409203714.1887402-10-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260409203714.1887402-10-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: SJ0PR05CA0141.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::26) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SA1PR11MB7112:EE_
X-MS-Office365-Filtering-Correlation-Id: a86d819d-3630-4d10-c72a-08de96837856
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 5lER0//Z0+K4gWYZVJ/5+cnbfYzoDWBc69ElkhKsHS8A407v/cyRnA9uOcg6HZfumpKj0k6q6jC6Ey8MKq7uRNZNNjro84IKDNWAa8bMnjmmc9LauFIIi7YEokDSPSy/hRoWZ4uhZq7+dXb4znNWriDXOMTwDnCcmCAyp8v6TmQ3GDdtgE28/zs9KgyG3Iq1BcZltexCYvFWBYfmFEeiZNuzJ7sDiZCf5UYBx3lKmz7FByt5nXMAqoXEZbsWnmILJ+2jO3aCMJcK7aAznD7Bszm4omnh0CRYKdW229PXiTK8ESzIllCNIANISXOQOJFaK5sEOpfKFKe0KbZkKwUJDPzrYgMTwaqHwHT4FU7Tvh61pMPCDIYUQguh0z7sKMIyoxX4ulkGDKY0eQZAKBmDKq+1/QRSGcRIC1KIE7cGzx40Fxsc1BaCFiOGqmI12K3yxZnIyBr0KsQJpP22aOiS/yxpLwYBKmHpbith1Iw3i2vZBjIqhDozCO06PgEu9qb8olMk5RCXzTQjXNqTc18jan+QVc8jm2HeJoOwLy3ZTbW0hFmOAALR02OsHOkGStHls4kTjysxT5YaBQvb8TXUhw3LNCMgExe+nYhVwMmyGc7Gj9K/t8UFcmoaHv6B2DqAV/I7qrLmQrxkYPrdRPEuuVHYvyrECTvsnLEImcu3awHrgiFfZdXN9mCzYUfHLb45AF9ncJBnu7EmQn+GfPzXs+LZ3SNE8OshhSkX0oWA/Ds=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NHS8/c0ypua0YVeguRqj1J5qtiEvY+69S4KVu8c2G+OzyH1CJkD0/CyDypW9?=
 =?us-ascii?Q?fR/DmZfRMdYZ9EyZHlcxJTw1m/oqS/eMll8vlt3neU2UcUw9ni2bfnaUqbwY?=
 =?us-ascii?Q?xyQrOCqWhrlMQDbGIAD48rJNJ9eEfvRJMUOjrEKGhgd9pbeUvYUhPo0cV0Kv?=
 =?us-ascii?Q?/7DlPjMO+8UiVn0UbyLCe9uuFscfE5HRuyl9i9yF9A/lIcq6Ka5KQ6S9tFTS?=
 =?us-ascii?Q?1lFIEsoqh8B37spwRlbLuoT/wkduTqeDvsA6l6tvNhp6cX1US080NmFFMjHk?=
 =?us-ascii?Q?4+Eh1H1upW0BfMFB03pJszszhPKtG1k4cCrYGb8wiN5FWcFzQX/bq3YuQcGf?=
 =?us-ascii?Q?YFl9WFhDbRqXY9So501QbKz2OmJAE6wIiOq4P/o/AnWNJ+gyGVgqa/s2Z5O7?=
 =?us-ascii?Q?3TiqCXyTvwczTt40+wfVCuc2yXKF1FTJMFOvJQdAPSPZ8e79LgjJ1ZEeynI+?=
 =?us-ascii?Q?NrvLaP3UwxjxU3GEb1Y6fDg3bgq7LZyPy3raTB/nHPpRN5OaoOLhVO8b75nl?=
 =?us-ascii?Q?Y6BRf/2VgXz8RywP4l+mDDz4mmGVUKAhw/Z06DYkxq3o1daeU7VTgRvRYyBR?=
 =?us-ascii?Q?1KwKcJMhbJTQemsSYNfGFGrPEI5PKgGEfeBmwZyh1NDv55IOrY6AiEZpb/mG?=
 =?us-ascii?Q?uGTaruUaN8mAoptwmAFxBK35oS54vn+MtwYc4FRVeu3l9uYpdN11JCvaRSbP?=
 =?us-ascii?Q?g9vcTF0g+8Qtx1/Gl+SBKGe3bB8plFp9lBMhDnNY+7lw6Bw8K7F2j1xuh3pW?=
 =?us-ascii?Q?snzToI8feM+0J7wAJit35n4MZo+6BHVWrCLUV8V/hlmtxUuruEAC3007poJE?=
 =?us-ascii?Q?lsg9k35as2RSv5jIhSIpQEFU2MYbBSzRjdcyrR4JCkyaWimjPjjszCEOxROE?=
 =?us-ascii?Q?AcvRECg9dWEDS9xG2Y+faC5q/YsXbN997mG/88qNVdAvJ3zSR/uzkq6YK5LM?=
 =?us-ascii?Q?BrJQW6bIfhdVlleiMC+j0Vz7LHftwv+h0XNa+T70D3gHKW2rUEbObWR2ZrxD?=
 =?us-ascii?Q?qUBDMWuJTCbk2swFpWGh7ksmNI9A5v9UyXR0AUPKro1725VuZBbfOwBZEWkk?=
 =?us-ascii?Q?NY8tYtvPPHB6AS5Y2KbzrTRVZAMDqq+DXTwrapS8Ef0YWHTJGaurn9KaTgER?=
 =?us-ascii?Q?GguV7Q7A0ZTgnnTHDBbgFYk8lLGzhO5Ym0fVzD6TE1dec2X0PM3n4rt8vpls?=
 =?us-ascii?Q?y9fjJ/Vp4roSyWT6GaeKlxB8MChfrDQiJBqIYL9Y95voNNS9Zc//nsM7BQNo?=
 =?us-ascii?Q?Mhn214lhK7agkQpswdvSuPyvd/Pz+uWavBsh5l9XwGQbMj6fSkDNzYnyWCzA?=
 =?us-ascii?Q?/eBhD47ZmroDjgqXciXXviwSDPGOxJG5Hc74nP8FJ5aKV/wjH+Udh0PfrUVv?=
 =?us-ascii?Q?LPrlRsJ2UtfIcvahYJSYq57mHiIuc8sqa8GqV0ABqSfK20oPtS9H4mFltN1h?=
 =?us-ascii?Q?jNGm4cJR0rFuL4EuY+nblCFZn7Pg08/t2z1H3C+HsicTcgmD3as8IM+xKruj?=
 =?us-ascii?Q?WiLY64wRRh7sg5BnLIcyYbSqYvVXiryHZbxY8s3E/AZXmNgKocfpXRzRNZEA?=
 =?us-ascii?Q?MvwUbUlNpvDcyJYxFaCvwnUhmqLpuu8VLRPBt83bnptU1dckEHedP8VsMQgm?=
 =?us-ascii?Q?Ca+E2FnfzjRAHlYeHHSkCPlLNFPAIObUh9XDfqkyH0UjBQdthh1LLMuN9Q7q?=
 =?us-ascii?Q?HbkRL/gA3zSHsS5onwAGvKdOxeV7TjNZ36BvfVKhSOUpIZBnTxeE7+a4CIJJ?=
 =?us-ascii?Q?7t/zZCrBMUk9FDbgkH+dZ6gAaHfYFEo=3D?=
X-Exchange-RoutingPolicyChecked: kdC4wzTaea6O5HKATmBx8HhCzPVSgk091Gw2QqL9H6+wUNb+IoMP3xVFE/p3F6KNBfvWF5UKkdhgoDTkRmRxu/2+0/IDb+zMrTXImK224DkPBZUTWCWv56/aTvTCi+GHgcey6zEp8YzmrbBECx4mD+hpYnNonZvHPWwO8UE3gVvackxLskXPzaZPQTeZwgzg/lI6Jw4Eusvp4Cn807fNEglZCpb1pr28o8kREbmMQX/s1ATiGWHw6K68LyON6yIt5Izu8XQUQS2SnnCt8QT8bwoEot5YdbIHRAZWHAPvqZwOoXLAG4dW9yXPmnxWwJNy8hOqemNaw9IQDxPyejN13g==
X-MS-Exchange-CrossTenant-Network-Message-Id: a86d819d-3630-4d10-c72a-08de96837856
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 22:00:53.8975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fwn5taRZLRzz2XEnwSYBKC8OuGUgtmTp3qPZue1Xih4FkVt0fzmFJ/ZQul80NWlXRzX5J/+bILKcUsK6UZRggQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7112
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

On Thu, Apr 09, 2026 at 01:37:18PM -0700, Umesh Nerlige Ramappa wrote:
> If a queue is currently active on the CS, query the QUEUE TIMESTAMP
> register to get an up to date value of the runtime. To do so, ensure
> that the primary queue is active and then check if the secondary queue
> is executing on the CS.
> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |   4 +
>  drivers/gpu/drm/xe/xe_lrc.c              | 122 +++++++++++++++++++----
>  drivers/gpu/drm/xe/xe_trace_lrc.h        |  27 +++++
>  3 files changed, 133 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 1b4a7e9a703d..af6af6f3f5e8 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -170,6 +170,10 @@
>  #define   GFX_MSIX_INTERRUPT_ENABLE		REG_BIT(13)
>  
>  #define RING_CSMQDEBUG(base)			XE_REG((base) + 0x2b0)
> +#define   CURRENT_ACTIVE_QUEUE_ID_MASK		REG_GENMASK(7, 0)
> +
> +#define RING_QUEUE_TIMESTAMP(base)		XE_REG((base) + 0x4c0)
> +#define RING_QUEUE_TIMESTAMP_UDW(base)		XE_REG((base) + 0x4c0 + 4)
>  
>  #define RING_TIMESTAMP(base)			XE_REG((base) + 0x358)
>  
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index be1030c74e21..1e407a761076 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -21,6 +21,7 @@
>  #include "xe_configfs.h"
>  #include "xe_device.h"
>  #include "xe_drm_client.h"
> +#include "xe_exec_queue.h"
>  #include "xe_exec_queue_types.h"
>  #include "xe_gt.h"
>  #include "xe_gt_printk.h"
> @@ -2638,17 +2639,72 @@ static int get_ctx_timestamp(struct xe_lrc *lrc, u32 engine_id, u64 *reg_ctx_ts)
>  	return 0;
>  }
>  
> -/**
> - * xe_lrc_timestamp() - Current ctx timestamp
> - * @lrc: Pointer to the lrc.
> - *
> - * Return latest ctx timestamp. With support for active contexts, the
> - * calculation may be slightly racy, so follow a read-again logic to ensure that
> - * the context is still active before returning the right timestamp.
> - *
> - * Returns: New ctx timestamp value
> - */
> -u64 xe_lrc_timestamp(struct xe_lrc *lrc)
> +static struct xe_hw_engine *get_hwe(struct xe_gt *gt, u32 engine_id)
> +{
> +	u16 class = REG_FIELD_GET(ENGINE_CLASS_ID, engine_id);
> +	u16 instance = REG_FIELD_GET(ENGINE_INSTANCE_ID, engine_id);
> +	struct xe_hw_engine *hwe = xe_gt_hw_engine(gt, class, instance, false);
> +
> +	if (xe_gt_WARN_ONCE(gt, !hwe || xe_hw_engine_is_reserved(hwe),
> +			    "Unexpected engine class:instance %d:%d for context utilization\n",
> +			    class, instance))
> +		return NULL;
> +
> +	return hwe;
> +}
> +
> +static u64 xe_lrc_multi_queue_timestamp(struct xe_lrc *lrc)

This function looks correct but it is little hard to follow.

Any change you can refactor this function so it more or less looks like
the original xe_lrc_timestamp, now xe_lrc_single_queue_timestamp?

e.g., A helper like get_ctx_timestamp -> get_queue_timestamp might this
easier to follow.

Matt

> +{
> +	struct xe_exec_queue *primary_q = lrc->multi_queue.primary;
> +	struct xe_lrc *primary_lrc;
> +	struct xe_hw_engine *hwe;
> +	struct xe_mmio *mmio;
> +	u32 engine_id, queue_id;
> +	u64 reg_ts = lrc->queue_timestamp;
> +
> +	/* Ensure we are PF, primary context is active */
> +	if (IS_SRIOV_VF(lrc_to_xe(lrc)) ||
> +	    !primary_q || !primary_q->lrc[0] ||
> +	    xe_lrc_ctx_timestamp(primary_q->lrc[0]) != CONTEXT_ACTIVE)
> +		return xe_lrc_queue_timestamp(lrc);
> +
> +	/* if primary queue is active, we have a valid engine id */
> +	primary_lrc = primary_q->lrc[0];
> +	engine_id = xe_lrc_engine_id(primary_lrc);
> +	hwe = get_hwe(primary_lrc->gt, engine_id);
> +	if (!hwe)
> +		return xe_lrc_queue_timestamp(lrc);
> +
> +	mmio = &hwe->gt->mmio;
> +	/* check if the queue is currently active and then read timestamp */
> +	queue_id = REG_FIELD_GET(CURRENT_ACTIVE_QUEUE_ID_MASK,
> +				 xe_mmio_read32(mmio, RING_CSMQDEBUG(hwe->mmio_base)));
> +	if (queue_id != lrc->multi_queue.pos)
> +		return xe_lrc_queue_timestamp(lrc);
> +
> +	reg_ts = xe_mmio_read64_2x32(mmio, RING_QUEUE_TIMESTAMP(hwe->mmio_base));
> +
> +	/* double check queue and primary queue are still active */
> +	queue_id = REG_FIELD_GET(CURRENT_ACTIVE_QUEUE_ID_MASK,
> +				 xe_mmio_read32(mmio, RING_CSMQDEBUG(hwe->mmio_base)));
> +	if (queue_id != lrc->multi_queue.pos ||
> +	    xe_lrc_ctx_timestamp(primary_q->lrc[0]) != CONTEXT_ACTIVE)
> +		return xe_lrc_queue_timestamp(lrc);
> +
> +	return reg_ts;
> +}
> +
> +static u64 xe_lrc_update_multi_queue_timestamp(struct xe_lrc *lrc, u64 *old_ts)
> +{
> +	*old_ts = lrc->queue_timestamp;
> +	lrc->queue_timestamp = xe_lrc_multi_queue_timestamp(lrc);
> +
> +	trace_xe_lrc_update_queue_timestamp(lrc, *old_ts);
> +
> +	return lrc->queue_timestamp;
> +}
> +
> +static u64 xe_lrc_single_queue_timestamp(struct xe_lrc *lrc)
>  {
>  	u64 lrc_ts, reg_ts, new_ts = lrc->ctx_timestamp;
>  	u32 engine_id;
> @@ -2680,24 +2736,50 @@ u64 xe_lrc_timestamp(struct xe_lrc *lrc)
>  	return new_ts;
>  }
>  
> +static u64 xe_lrc_update_ctx_timestamp(struct xe_lrc *lrc, u64 *old_ts)
> +{
> +	*old_ts = lrc->ctx_timestamp;
> +	lrc->ctx_timestamp = xe_lrc_single_queue_timestamp(lrc);
> +
> +	trace_xe_lrc_update_timestamp(lrc, *old_ts);
> +
> +	return lrc->ctx_timestamp;
> +}
> +
> +/**
> + * xe_lrc_timestamp() - Current lrc timestamp
> + * @lrc: Pointer to the lrc.
> + *
> + * Return latest lrc timestamp. With support for active contexts/queues, the
> + * calculation may be slightly racy, so follow a read-again logic to ensure that
> + * the context/queue is still active before returning the right timestamp.
> + *
> + * Returns: New lrc timestamp value
> + */
> +u64 xe_lrc_timestamp(struct xe_lrc *lrc)
> +{
> +	if (xe_lrc_is_multi_queue(lrc))
> +		return xe_lrc_multi_queue_timestamp(lrc);
> +	else
> +		return xe_lrc_single_queue_timestamp(lrc);
> +}
> +
>  /**
> - * xe_lrc_update_timestamp() - Update ctx timestamp
> + * xe_lrc_update_timestamp() - Update lrc timestamp
>   * @lrc: Pointer to the lrc.
>   * @old_ts: Old timestamp value
>   *
> - * Populate @old_ts current saved ctx timestamp, read new ctx timestamp and
> + * Populate @old_ts with current saved lrc timestamp, read new lrc timestamp and
>   * update saved value.
>   *
> - * Returns: New ctx timestamp value
> + * Returns: New lrc timestamp value
>   */
>  u64 xe_lrc_update_timestamp(struct xe_lrc *lrc, u64 *old_ts)
>  {
> -	*old_ts = lrc->ctx_timestamp;
> -	lrc->ctx_timestamp = xe_lrc_timestamp(lrc);
> -
> -	trace_xe_lrc_update_timestamp(lrc, *old_ts);
> -
> -	return lrc->ctx_timestamp;
> +	if (xe_lrc_is_multi_queue(lrc))
> +		return xe_lrc_update_multi_queue_timestamp(lrc, old_ts);
> +	else
> +		return xe_lrc_update_ctx_timestamp(lrc, old_ts);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_trace_lrc.h b/drivers/gpu/drm/xe/xe_trace_lrc.h
> index d525cbee1e34..988d360143dc 100644
> --- a/drivers/gpu/drm/xe/xe_trace_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_trace_lrc.h
> @@ -12,6 +12,7 @@
>  #include <linux/tracepoint.h>
>  #include <linux/types.h>
>  
> +#include "xe_exec_queue_types.h"
>  #include "xe_gt_types.h"
>  #include "xe_lrc.h"
>  #include "xe_lrc_types.h"
> @@ -42,6 +43,32 @@ TRACE_EVENT(xe_lrc_update_timestamp,
>  		      __get_str(device_id))
>  );
>  
> +TRACE_EVENT(xe_lrc_update_queue_timestamp,
> +	    TP_PROTO(struct xe_lrc *lrc, uint64_t old),
> +	    TP_ARGS(lrc, old),
> +	    TP_STRUCT__entry(
> +		     __field(struct xe_lrc *, lrc)
> +		     __field(u8, pos)
> +		     __field(u64, old)
> +		     __field(u64, new)
> +		     __string(name, lrc->fence_ctx.name)
> +		     __string(device_id, __dev_name_lrc(lrc))
> +	    ),
> +
> +	    TP_fast_assign(
> +		   __entry->lrc	= lrc;
> +		   __entry->pos = lrc->multi_queue.pos;
> +		   __entry->old = old;
> +		   __entry->new = lrc->queue_timestamp;
> +		   __assign_str(name);
> +		   __assign_str(device_id);
> +		   ),
> +	    TP_printk("lrc=:%p pos=%d lrc->name=%s old=%llu new=%llu device_id:%s",
> +		      __entry->lrc, __entry->pos, __get_str(name),
> +		      __entry->old, __entry->new,
> +		      __get_str(device_id))
> +);
> +
>  #endif
>  
>  /* This part must be outside protection */
> -- 
> 2.43.0
> 
