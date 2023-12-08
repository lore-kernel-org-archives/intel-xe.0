Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24FE6C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 05:49:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF9D10E083;
	Fri,  8 Dec 2023 05:49:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9784C10E083
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 05:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702014566; x=1733550566;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+7Vl1VmUj5blQbfic7D9I4ej5OeCOthViGSmMP+EoDA=;
 b=SpW2GKDeyQHILQMCMWCwpLjaBjcR8aM8fzhbCsX9APA9/lcJP5zk+les
 VVOApLyOYgcmY8tCAkDYIQbv9Wv76y1u5PHS03cclr5POWot/2fnEzuYz
 51WVnloDWKMLr/YH86i2Ujhv+YY4IH7YiESrxFpiLa2i9vgJvRE8XMOCF
 uSt0syNcaz3UX1iUJLPGzpue1S/jvQioHccDyxa1hfup1/E8s1+xwqw1c
 wljT76XsczMdohpaQdDvgRCNR71wX9hsVQzFQyXhVIH6S0WqbE9cDtV1p
 WI96jQjA6siqOs5TEjE9YD9QYNTtSW3qKmMUh16kpL6QOFCoVnKRRjavk A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1185160"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; 
   d="scan'208";a="1185160"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 21:49:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="748226717"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; d="scan'208";a="748226717"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 21:49:24 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 21:49:24 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 21:49:24 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 21:49:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BcVrbFTgnRca9s4VYGPRZMmusk1NxRVPWrjAaWINQQnurJ9B0aYOiwhl2cstV1w0mLZv0k6k/nzZc4WtCsZCdf65WS6e0MtOlo4DyoNTetbQOeLorspGIIkwhxKGb+glHzcKUejvRcLRZf0MURHBRL5wyPg5+a8RfTscBjJuDgloPLAQEFQGH4xaaop3/bCJHwphMlQps6WqK7UlRbxBDkkN5ZuRXjML9dBcW+d5/V3BuXJVzZwbXEpZJ6bdHA18NHgW2bm5OK6r9GZtgjFZJZnfcvNBymYuLVEkPgpYGxGcZOUQpHbxgTeLcVnYIIe412k2MIHnbyE66h8t7FlUgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZuZns0EhmC3o32kBSTvlXZZ0J0QlZ2QWSVz6hldP82w=;
 b=PAM3pom3jI3PpdcFpEKwBDRXa1weQx4PuMDFWrzqxWFZs4x6vsv3vA6dKIwMbH48+jSuAQiO7JjjzieYNpVAU0Hub9VPQovFhR5BuaXfTIo4Y2FMc730iWwePPdE2UHno0UWFkULJqb/N/hDMHPcxLoBP3lkAcKq9EzysmJHi0/tq+Hz6PHB8bm3hHK5PQ+Y9pzNKADIkmEolukVks+8mnQk/+Xe034ZFh661Ywe5sV0NhDc59+rUaDr193PiJQXnA/XIDwMXxv9tVL88hcwZgCdP+0dXh4gR1Mm5cJWaFVwkNfsCQLiPxtKG7MhMWHlCYfXfakBMpg6mN9CdBDQTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW3PR11MB4748.namprd11.prod.outlook.com (2603:10b6:303:2e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 05:49:22 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 05:49:22 +0000
Date: Fri, 8 Dec 2023 00:49:18 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Subject: Re: [PATCH v5 2/2] drm/xe/uapi: Return correct error code for
 xe_wait_user_fence_ioctl
Message-ID: <ZXKuXgUUQGXpMHdR@intel.com>
References: <20231208041716.32369-1-krishnaiah.bommu@intel.com>
 <20231208041716.32369-3-krishnaiah.bommu@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231208041716.32369-3-krishnaiah.bommu@intel.com>
X-ClientProxiedBy: BY5PR04CA0023.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW3PR11MB4748:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e456d23-cbe7-41b3-ccf0-08dbf7b16d76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OLqt2wtbJJDpMDX1AGI+37DtXfwrCc2vx4vHZSJZ8rZX8GmFmlt5f48FoTcAue0IpSP6Gxw2/BYhdv5Q7hRpRKgoMnpUF/zCHEanKSYnJy4gBr+pjBMeHHUbGlleHwX8pL6BtH6+BXA4+QwVjxThBtw2xbzniYFN0w3m4C0sEqfgIfUddwadtfVb+gzXa5DRKHfAVPLRssQiRBVKM3iRoGy17VNiy7+VtZkXbzxtxlb/oyRAIeid8cY8SnA7Ht1ZZzFDZywR4fR0cMBB0FC5hCSzsHfJHrKUH9kTdB1fXSOdtPW9duYvzBfKebq2Z6Wn7o0POrrLjNOfhq/pb5JPQlDxsXobZjpWd3/Uho0sD53hW4DUaFYMS7MiYnXgi2V+YN7F1tlj7jTiLIMZhcCVDE+EhilWGdyduINYPchEMWsgKKO3SsX4z2Ax1Dsce2+aH/cm3y8ngPOORmLIjNBiQTnI6FTDVzD070yjS/CkaLBkrC/HhcThfOpJbXAA5CBy5QF0jz131qlO3OeFOcxSTrH9+iIlnjKUl/CU9Vhr+KjbIBdOOncbXdjGp1rnxs9k
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(396003)(136003)(39860400002)(346002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(6666004)(6506007)(6486002)(478600001)(36756003)(44832011)(5660300002)(66946007)(2906002)(66556008)(66476007)(6636002)(37006003)(316002)(4326008)(6862004)(8676002)(8936002)(83380400001)(82960400001)(2616005)(38100700002)(41300700001)(6512007)(26005)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y6rpWhOmZEZd+/wpD7wCrD22NpNszJVhcS4XDIhZ1lmlW58IhwLFS2/eB1B2?=
 =?us-ascii?Q?ciilJxzvtl2lklDblXEJaPdjZc8NMtXahHMiIcARTuNLIlrBDXdDDixklE4w?=
 =?us-ascii?Q?Pon+WLrvkAN8rzRymm+ixEamZg0vYFIOr3QCt5VQvF0ruzJLun3d7Q1A0j0/?=
 =?us-ascii?Q?mnwQWKI7zic5hMRmy3IblBYtQpMZgvg1k1U+F5CRDtTzSapfjBODpdMbi1Yx?=
 =?us-ascii?Q?xoWx+JBxbz6bbOlNx0bpY4CcMO4bzrwAJkXGz8IdHsNV/G+kasvwvj7Tq1kn?=
 =?us-ascii?Q?AEJZYDMgUXTodTiB8zMgH6CrFVYwhZtzHDxxOaP7EEpcNQorqLmyt/ENJKYl?=
 =?us-ascii?Q?S5wi9rApkIF76pLFVALvjMVVt7glDWmMD7vrSADA/Udhh1w2WMSQXNtbTYA/?=
 =?us-ascii?Q?ND5BnR1vSaOUqTs1RH7WlvpYkZjIya/noPBaw3M+HTmCA0zBnY7jLL26pwy6?=
 =?us-ascii?Q?5QJD9jY1qEGMfc8z5PVyn93ktyAe/OIUDH0jVpvdhXFeT5qsNTCJBVBUfHrW?=
 =?us-ascii?Q?CMB+5tdHHBN9pnNxEXCh+Mh1BlNV2BIwPLH6fk6N4rW3OSuXad3JKAuzjGVY?=
 =?us-ascii?Q?bDVOUrXa/+mf3B+DSCx/S3clb2agwtl+ktlwr8MVfqKnDmNNh0feCPyLhENA?=
 =?us-ascii?Q?3obFyjq3BWqiGd9wuwao/X4lE6PE8NC+8RSg3kU6BnRY51YtfMVYeBBXjpqf?=
 =?us-ascii?Q?ho6eGkJQ9zfWhI3J6cEkqdxbMwyfdlGDkJPpixdlFKga7vHfPQmkFLCExu61?=
 =?us-ascii?Q?wgY9It4euH2IQHZbjKXnGwU24RCsvULZRQ8zvtIlcZP383W9GJPzvOE6IvKU?=
 =?us-ascii?Q?Je+Qk7HIEo/AdJjiN5iyLP+PxubyidisDO+gP6DRjFvjyPUV12r+7kI7Tpfo?=
 =?us-ascii?Q?wdQcO+aBj6czGE5rmhT+7MUdYCecv00dxZtfj96UYHxVKQkrzW+Y7O8y0+Pq?=
 =?us-ascii?Q?WCaiTFxUV/MSULnBsTxs/Y9tkoX8vf1El5jRV9ceyZZ2WrlQEOYl3S6+n0r7?=
 =?us-ascii?Q?iEn2LFlixXHWueuyi7rckDcHhmcLT3d5GyrmlTaVuyqWjrCMX+F5qrLrguWj?=
 =?us-ascii?Q?dwnc5xhMQE1Tq0REGD+jtk6gin6rbohcvSIT4URuKO0OwVWTwuxcOTnUpu9U?=
 =?us-ascii?Q?a17DD5QTq/G4EhMK86usKElr2+OgrDLdHuUhS7BtRFzP2nkvinVIhk4VX/8i?=
 =?us-ascii?Q?+jesy/hVs+YqBPMT54C6fDcrxupiYD6i6qM6ngNr+fCbgBhQY30WgTNNjnso?=
 =?us-ascii?Q?/scj0Is7oSwx21zNGc7DqW98fa+aQhi0JIjoQ8t3ks4w4I9FbjwKZeL1KhTv?=
 =?us-ascii?Q?ftdwPmOypDVK3WB6+QjRUvqFRDqcu3m0UjS5lWH3wT0s8NYaX61O0fCEauoT?=
 =?us-ascii?Q?G4Fg//OOg1Lh6botsYcIsaqP7qOe95gUpjYyqhApFYYIQyLWKLd643Q8D6Je?=
 =?us-ascii?Q?quLr28GrGY4QeEa0qQbPCG7a/FsFbRrv86Sk0fkyJZ6gQHIVNy6izDS1Lajz?=
 =?us-ascii?Q?4OAsnYp7V5nQwm8QJ4GiQOogDncbb4BhzX54E3P5uTlztIxVQk1X0cnu6JDu?=
 =?us-ascii?Q?8ViXGA5ub3huonLnvzE1XNGTX+w+keY2f66nwaCLBA9wGYcPscgoCqKkdZYU?=
 =?us-ascii?Q?SA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e456d23-cbe7-41b3-ccf0-08dbf7b16d76
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 05:49:22.2994 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jfHtgWjWAy68XmupgsWXGJQTnk/ENleZwXP6oBKi+yunw9na5vtWsnJVa5Ad9PDRwshqiW/DKhiOJcpbqXZMUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4748
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Dec 08, 2023 at 09:47:16AM +0530, Bommu Krishnaiah wrote:
> Currently xe_wait_user_fence_ioctl is not checking exec_queue state
> and blocking until timeout, with this patch wakeup the blocking wait
> if exec_queue reset happen and returning proper error code
> 
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Oak Zeng <oak.zeng@intel.com>
> Cc: Kempczynski Zbigniew <Zbigniew.Kempczynski@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
>  drivers/gpu/drm/xe/xe_execlist.c         |  7 ++++++
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 10 ++++++++
>  drivers/gpu/drm/xe/xe_wait_user_fence.c  | 30 +++++++++++++++++++-----
>  4 files changed, 43 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 5ba47a5cfdbd..84ccf7242247 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -206,6 +206,8 @@ struct xe_exec_queue_ops {
>  	 * signalled when this function is called.
>  	 */
>  	void (*resume)(struct xe_exec_queue *q);
> +	/** @reset_status: check exec queue reset status */
> +	bool (*reset_status)(struct xe_exec_queue *q);
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index e8754adfc52a..dab41e99f3d3 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -446,6 +446,12 @@ static void execlist_exec_queue_resume(struct xe_exec_queue *q)
>  	/* NIY */
>  }
>  
> +static bool execlist_exec_queue_reset_status(struct xe_exec_queue *q)
> +{
> +	/* NIY */
> +	return false;
> +}
> +
>  static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
>  	.init = execlist_exec_queue_init,
>  	.kill = execlist_exec_queue_kill,
> @@ -457,6 +463,7 @@ static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
>  	.suspend = execlist_exec_queue_suspend,
>  	.suspend_wait = execlist_exec_queue_suspend_wait,
>  	.resume = execlist_exec_queue_resume,
> +	.reset_status = execlist_exec_queue_reset_status,
>  };
>  
>  int xe_execlist_init(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 46b132ee1d3a..a42c3574cbec 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -854,6 +854,10 @@ static void simple_error_capture(struct xe_exec_queue *q)
>  static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
>  {
>  	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct xe_device *xe = guc_to_xe(guc);
> +
> +	/** to wakeup xe_wait_user_fence ioctl if exec queue is reset */
> +	wake_up_all(&xe->ufence_wq);
>  
>  	if (xe_exec_queue_is_lr(q))
>  		queue_work(guc_to_gt(guc)->ordered_wq, &q->guc->lr_tdr);
> @@ -1394,6 +1398,11 @@ static void guc_exec_queue_resume(struct xe_exec_queue *q)
>  	guc_exec_queue_add_msg(q, msg, RESUME);
>  }
>  
> +static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
> +{
> +	return exec_queue_reset(q);
> +}
> +
>  /*
>   * All of these functions are an abstraction layer which other parts of XE can
>   * use to trap into the GuC backend. All of these functions, aside from init,
> @@ -1411,6 +1420,7 @@ static const struct xe_exec_queue_ops guc_exec_queue_ops = {
>  	.suspend = guc_exec_queue_suspend,
>  	.suspend_wait = guc_exec_queue_suspend_wait,
>  	.resume = guc_exec_queue_resume,
> +	.reset_status = guc_exec_queue_reset_status,
>  };
>  
>  static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
> diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> index 59af65b6ed89..b0a7896f7fcb 100644
> --- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
> +++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> @@ -13,6 +13,7 @@
>  #include "xe_device.h"
>  #include "xe_gt.h"
>  #include "xe_macros.h"
> +#include "xe_exec_queue.h"
>  
>  static int do_compare(u64 addr, u64 value, u64 mask, u16 op)
>  {
> @@ -100,10 +101,12 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>  			     struct drm_file *file)
>  {
>  	struct xe_device *xe = to_xe_device(dev);
> +	struct xe_file *xef = to_xe_file(file);
>  	DEFINE_WAIT_FUNC(w_wait, woken_wake_function);
>  	struct drm_xe_wait_user_fence *args = data;
> +	struct xe_exec_queue *q = NULL;
>  	u64 addr = args->addr;
> -	int err;
> +	int err = 0;
>  	long timeout;
>  	ktime_t start;
>  
> @@ -121,6 +124,12 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>  	if (XE_IOCTL_DBG(xe, addr & 0x7))
>  		return -EINVAL;
>  
> +	if (args->exec_queue_id) {
> +		q = xe_exec_queue_lookup(xef, args->exec_queue_id);
> +		if (XE_IOCTL_DBG(xe, !q))
> +			return -ENOENT;
> +	}
> +
>  	timeout = to_jiffies_timeout(xe, args);
>  
>  	start = ktime_get();
> @@ -136,6 +145,14 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>  			break;
>  		}
>  
> +		if (q) {
> +			if (q->ops->reset_status(q)) {
> +				drm_info(&xe->drm, "exec gueue reset detected\n");

typo... should be queue.

> +				err = -EIO;
> +				break;
> +			}
> +		}
> +
>  		if (!timeout) {
>  			err = -ETIME;
>  			break;
> @@ -151,10 +168,11 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>  			args->timeout = 0;
>  	}
>  
> -	if (XE_IOCTL_DBG(xe, err < 0))
> -		return err;
> -	else if (XE_IOCTL_DBG(xe, !timeout))
> -		return -ETIME;
> +	if (!timeout && !(err < 0))
> +		err = -ETIME;
> +
> +	if (q)
> +		xe_exec_queue_put(q);

I'd like to get an ack from Matt and Oak,
but the patch looks right to me

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


>  
> -	return 0;
> +	return err;
>  }
> -- 
> 2.25.1
> 
