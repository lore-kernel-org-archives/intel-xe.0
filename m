Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157C7C982D8
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 15:47:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC09410E8B1;
	Fri, 18 Sep 2026 15:47:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lOd4AGAS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D998C10E8B1
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 15:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789746455; x=1821282455;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ITu2zbHjjFIy3cKPH2GQaApuAC+vw619Y7WWBX5WqOA=;
 b=lOd4AGAS0ESSZ5quZMCW83tE39uOw7qKCyQff1cvYxmb97lNy5pKMohA
 smEdaSUvVCx4WKyaxhS3BuBQLPKgnz5jfxOhubWwG82zl+XuVkp5nhDoj
 nQW173GLczi9njWXDOHhffUEDqoHMdxU335o/CV7+yDL+6yCz1urVu9bN
 THK8XnqiaIkON4gLVqVoe+DaC/wQds3OT8GUotrQdcTmnsaezUXiYhMO6
 RRqKIUOTVubl7QprKpHQ6tTB6Y9sQIDRDrpf2wYtr3XgSi5En5q3ifGjr
 OBWJXyWXqyY8OImMy5m9aimWiqLw8/FxXx2odz+RAqDCxklpI0f2ybWKF A==;
X-CSE-ConnectionGUID: /BoMGNoJT/O0Kd+mHsUddw==
X-CSE-MsgGUID: TjvsQOaqR3yKyRPKiotAbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="101613391"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="101613391"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 08:47:35 -0700
X-CSE-ConnectionGUID: WlIqTB93QI+t0zkPRUd6Qw==
X-CSE-MsgGUID: gopadgBdSQWoux1lpCHlGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="270158049"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 08:47:34 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 08:47:33 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 18 Sep 2026 08:47:33 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.14) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 08:47:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g1/0qWpZQesbSg7SofQBtM+qgOFCVb4E7RCEQ5OA3CuHsl/Utqr4F7Ug0WzhG8pbHOMSIa8BbEqBy6HsmjaAe2hIKzc7n0PmU0FW0FC+myzbqNfIwMuZN+0NSQQcRntS/6ZUw9gXg1vvT66rKL5Bvh6ZipAM6aF7BtRb+NBosBlVQjnOkHYKe52qs5eexmRvqqRHE+5GZ3Uux7Y3yK8anOVcHCGK9Upou7byJ1Em4NoyN0BE0cg+izeTvEh//G1Mc/JZcfTTdczwBwKAyatkLjQZpT3aGFQX8MBzYpCWm0B9gxjNYFhESs3UoXcVQv+qHBY1cB5V96RAE5cGDj9KvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q6D/Ykgi1bK/B2xdVVGNfDtx1yR0ctKRhU47702KF1s=;
 b=LG7PljFok0AT8nK0LcOSxB8o1ySHxgV9aRPxwgLTkjtrCXjkf3uPJfNu8y4eCdkhbu4Qe+vjN43of+LsmWhkhK88kJg4PPKUxSnybdXecqlpR4SVvwcHmBb+dM+LieDxdNAFVm6jMvJW/cSTnXdkmhWflKEKxdbx9peQu1ZX9RDBJq33M1CW0hHlzGDCDyrJJhj7dJJowL7lAsKExw+d3YtQTpNDkIpkW5PxAsXa3fUIACHZws2Uy7o2uqFm4LR9JSKLt+7G6TVlG64Sd4epr3sVV0MoJa+81plA5BbSrjAcbtM96c/Ai0MpnO1B0axF0txWkMP9HkwtjVsCxycpbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by CH0PR11MB5268.namprd11.prod.outlook.com (2603:10b6:610:e3::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 15:47:31 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 15:47:31 +0000
Date: Fri, 18 Sep 2026 11:47:20 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [PATCH v6] drm/xe: Poll GT for C6 before D3
Message-ID: <aq1dCB5wTa-qUHt9@intel.com>
References: <20260916190614.3047807-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260916190614.3047807-1-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: SI2PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:4:194::8) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|CH0PR11MB5268:EE_
X-MS-Office365-Filtering-Correlation-Id: ffa8788b-4ae3-4cbd-d045-08df159c25e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|56012099006|6133799003|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: p/7iRC7uWB6UER0c4grgvfeHgAt4H8s9F1/2JHy+k5FUEZWyiSa3cW/TnoiU4VilSRj09VZN5sc9fK7JdLBdI8eYWY35fS52hn+WYqG38UBDA3Jf9LXfWyqZdzzRjoEGAnTor2kjBSvddyIxVa5oD0QxkWXyIfr3nbJZ1rdQpgUNihodN2ANuI0MDYHFkbDlXZrP1qxufPdcD14kRrNhi7ybpNHh75tb9aLsVRWemfv4xN+FSsqge6EwXp8UvtkI8jofFGNKSOC2H9JEaEB1pkbxz3EPosUA8sTN9aKs5lePsPARzVXcXaFLq3eG05KlwJCTMG9HNtNFot/iZvqMnWzyRtFV1RKsCHdHy+ZUR0XIarHbMErXReDfRvouaKuoAitFgGy8N0WNdnk+UbTITbVVLs0ZKf3sKYTCmTeLmj5ML6qeJyZG/1e7uhaMadtGdwTA36mQX8qB2I3gbME7EGSTLBW4omNg+TLXQlYz+YixKRxhBW2Uhy3rVUk6/qdNo8TCsrez+E6bN9SM82Nj2ymBpV3uvsi2iCv9Mh8DgUsH/gzMlmW/GqGCQjb0mm9M74GaOy0wH9j971Gl6miRxCaPiELF4V+oOnR7EabC1BcRHeQGfLqbSAp8WRKp2EUPhHeZM8b2WK+WEEBYdj9SOIou0Ict+c60HkE78nh1ADk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(56012099006)(6133799003)(11063799006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RizemX3s4S4Xg7nl1Plb6bJ1uHSsm4wBS4fj5d8HG65MKHJqynkYDZHUSu9m?=
 =?us-ascii?Q?A7EgOTwocWp4uscDOSafkC4dwmrqnYlbmhuhyH+u47nRlOstRsmcpDmXbpbM?=
 =?us-ascii?Q?0DT6qJlyWCKjChTO3sGFQmQsMg8qzdCFFZT43rCyh1vUuu7I6cOc+NtgMiIh?=
 =?us-ascii?Q?muWYrpt9P6aW3UARgJgpVMlQl5YRm9QrJCzaz3FtvU+W0bcc/XqBzm9Amgzl?=
 =?us-ascii?Q?MEyKJ7uyKsA9tlf5LZoxfiaKdgyk2AukPdxIRUIDkVz2FekVCDsgh7XbHUnc?=
 =?us-ascii?Q?ySnmGYSD0o09eh9W+NjjCxRleWTWatgSeYrkK2QVgEwxNI5XWAWgP6Un194S?=
 =?us-ascii?Q?7ExRbpc5oT8G7xW99cKEjoOB32g2gAPmHZJlEqwBIg2khstAtQsx6IsT3tg1?=
 =?us-ascii?Q?mQITghtcIe35jKfdsMYOYvX48o6RiHD7fN5F/1XymRj43h56k0QvC4qB+Met?=
 =?us-ascii?Q?ulFWraXWW0gP7Cr+rlAt2McjYGs+DPK37Pha2HkbbhrG9Fb1fJimy23eNrnp?=
 =?us-ascii?Q?vEmDxueahbufQFN1v7D1EYkIVQ5ZYGIlvdevlb2AzNwP3zAFiqBuDLBEfYr+?=
 =?us-ascii?Q?Fv8sF0RG5ElMQwK06rTxIE0xRJoGIElIoSqzT5ttv2YBUxw+MI/De8FfC0tG?=
 =?us-ascii?Q?Pi3MGdk1NPRNzhR+1uIXmE5jvpQHpjGcKAYgA2ClzuWtU6Elpt/vedykK5nR?=
 =?us-ascii?Q?U8BVT8uWFNyBlIz6cjMAsAC6kOYrs1Eco+CL6KJP0TCMN2u+aKJI15fP2bQH?=
 =?us-ascii?Q?5wKFRmI+/C+7sP9MFzZPQxUMqyYCrqFrwJY4vp9b9/fE7tKDEuCH4eG5Zpzp?=
 =?us-ascii?Q?gDafVKfk6nljUaGo4g9bWRBPpD7cz/FauG4GTsvp88vK9WJmOcSWyJmG0vwC?=
 =?us-ascii?Q?Midg7gFXrSQPpeOsmGqcH85Lrhk5bjU0Ks4vlqTSi5vQouF+hFfbsq1d3mI1?=
 =?us-ascii?Q?yE93dHcN+kXSCBSECDQAc0MNbAgOGPi6DYMTYNFhWDfgs6WOoD6PyPopuyKw?=
 =?us-ascii?Q?L4l5MOS4OFqn1Xxa2Iz8OZieFJQm+GgBcDdY1crUqFXtpaQvRxFsA5YHFLMt?=
 =?us-ascii?Q?VvW+WNcAOcsMFncV33utXeB+NjCjhWlN7xi64A9CZBHy7jzm8xrdFqzYmmCp?=
 =?us-ascii?Q?yEXLczFZsObFdb7FOafjMOenzY7FuHEeuH9j2lF32soJ5t0l9lF+KIDsJ6JI?=
 =?us-ascii?Q?AhVcwplUn+SMY862kYCC49Qk6Xm5BvvJFp2yk9vbkq86pW+BRqHW7SG49Bta?=
 =?us-ascii?Q?5wAxkQDiZZT2XsrC54De0O78Q9pwi+QFbooObydh/cJWgGqRoYKQUY4xbcOT?=
 =?us-ascii?Q?Ie09Qzso0hM3BPbjiO5DloOJ+u8ztssjHYgklihOXqkgYYmHqiCCa0TUy12K?=
 =?us-ascii?Q?ikCKcFM4/x97iMEgcjGCzISg5u7rQBSJ3MVxgMAXWUD9cbGW1xEc/r5Uhv0H?=
 =?us-ascii?Q?TMNrGDra5JA1rrXtcrQ6PSAYtGCq9DWff+rAtU/a+t+D9RwsX8/4T2ir9aEW?=
 =?us-ascii?Q?uP01RFthSm4l6YCU/j7wZpNYCMwfgrgIw25UQNCNyIDiR2nz99JaifA9WvWP?=
 =?us-ascii?Q?reQCfZkU8uh4n++Fs4uEYfXapt10bxpP6XCwn/PvDk8O51yAs6GeUEMphr6A?=
 =?us-ascii?Q?JlFhPeWMps1Oo5jwCi1mdWeWgfO6MTjJFbU5RjvFn926hywAvpRHMsU9spwP?=
 =?us-ascii?Q?4cn3tslNUcmalyG//aZf57oJdzlvN2m+AneeiylKAx4Sl6P33z96JLWQbbN3?=
 =?us-ascii?Q?vB5JbSiGhw=3D=3D?=
X-Exchange-RoutingPolicyChecked: 4261jNu5Lmt4rhdslkwqqt4/K6hZq3gTXmflCeRH1fO2T6gLKS/3N/GP/eK8MohgfsjW9wfwLmCV1MfidCG61K70Po/9FCRsqj9BRP2A7aBJaToq8ilx++3L3fQrOGAM9IZIfgfiz0l4oV99aur3FT4f0V8ZzOSZjItUYgAIbqOlSKPRpIEkbsAV8GJDl5Ecd5slMVGG+m8rTMVs1bx7tnBLFpwGnEOkWyN4k5GKHvwzPONM6IdJ7zof9X0fTAGAOP68QZWzaDSAMHV6QNSby6ur5+gy9u28rVeUUndzBber64UXDsCL+MPw4/EnhYjj29lmBcuRgyw4ND57iDuGQg==
X-MS-Exchange-CrossTenant-Network-Message-Id: ffa8788b-4ae3-4cbd-d045-08df159c25e6
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 15:47:31.1171 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0h232t74BwEtAHUvDwrs+V/XZq9yyZ1376HzuUHfh/xnWIwKR75Gt59GPV4A56/WmSV66zDW7RLYvYLFuL3CSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5268
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

On Wed, Sep 16, 2026 at 12:06:14PM -0700, Vinay Belgaumkar wrote:
> Ensure GT C6 state before D3 transition in runtime suspend flow.
> This avoids the scenario where GT is being accessed after D3 state
> is programmed. If the check for C6 fails, resume the device so it is
> not stuck in an intermediate state.
> 
> v2: Force resume when we cancel suspend due to C6 check (Sashiko)
> v3: Abort the suspend properly when idle check fails (Sashiko)
> v4: Only check for C6 during suspend (Rodrigo). Have check in
> xe_pci_runtime_suspend() instead of xe_pci_suspend().
> v5: Don't checkfor PVC (Sashiko), rename function from_device_c6
> to _device_idle
> v6: Rename to _wait_all_c6 and move PVC check to gt_idle (Rodrigo)
> 
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

pushing soon. Thank you

> ---
>  drivers/gpu/drm/xe/xe_gt_idle.c | 39 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_idle.h |  1 +
>  drivers/gpu/drm/xe/xe_pci.c     | 13 ++++++++++-
>  drivers/gpu/drm/xe/xe_pm.c      | 18 +++++++++++++++
>  drivers/gpu/drm/xe/xe_pm.h      |  1 +
>  5 files changed, 71 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index c208d7563e36..2eefd62f8d59 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -8,10 +8,12 @@
>  #include <drm/drm_managed.h>
>  
>  #include <generated/xe_wa_oob.h>
> +#include <linux/iopoll.h>
>  #include "xe_force_wake.h"
>  #include "xe_device.h"
>  #include "xe_gt.h"
>  #include "xe_gt_idle.h"
> +#include "xe_gt_printk.h"
>  #include "xe_gt_sysfs.h"
>  #include "xe_guc_pc.h"
>  #include "regs/xe_gt_regs.h"
> @@ -451,3 +453,40 @@ int xe_gt_idle_disable_c6(struct xe_gt *gt)
>  
>  	return 0;
>  }
> +
> +static int wait_for_gt_c6_state(struct xe_gt *gt, u32 timeout_ms)
> +{
> +	struct xe_guc_pc *pc = &gt->uc.guc.pc;
> +	enum xe_gt_idle_state state;
> +
> +	return poll_timeout_us(state = gt->gtidle.idle_status(pc),
> +			       state == GT_IDLE_C6,
> +			       20,
> +			       timeout_ms * USEC_PER_MSEC,
> +			       false);
> +}
> +
> +/**
> + * xe_gt_idle_wait_for_c6 - Poll for GT C6
> + * @gt: GT object
> + * @timeout_ms: wait time in ms
> + *
> + * This function waits for GT to enter C6.
> + *
> + * Return: 0 on success, -EAGAIN otherwise
> + */
> +int xe_gt_idle_wait_for_c6(struct xe_gt *gt, u32 timeout_ms)
> +{
> +	if (IS_SRIOV_VF(gt_to_xe(gt)))
> +		return 0;
> +
> +	if (gt_to_xe(gt)->info.platform == XE_PVC)
> +		return 0;
> +
> +	if (wait_for_gt_c6_state(gt, timeout_ms)) {
> +		xe_gt_dbg(gt, "GT is not in C6\n");
> +		return -EAGAIN;
> +	}
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
> index 9c34a155e102..2c8e9adf4a68 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.h
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
> @@ -18,5 +18,6 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt);
>  void xe_gt_idle_disable_pg(struct xe_gt *gt);
>  int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p);
>  u64 xe_gt_idle_residency_msec(struct xe_gt_idle *gtidle);
> +int xe_gt_idle_wait_for_c6(struct xe_gt *gt, u32 timeout_ms);
>  
>  #endif /* _XE_GT_IDLE_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index ab4da1d9a9f1..1a1bae5b936d 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1381,7 +1381,7 @@ static int xe_pci_runtime_suspend(struct device *dev)
>  {
>  	struct pci_dev *pdev = to_pci_dev(dev);
>  	struct xe_device *xe = pdev_to_xe_device(pdev);
> -	int err;
> +	int err, ret;
>  
>  	/*
>  	 * We hold an additional reference to the runtime PM to keep PF in D0
> @@ -1396,6 +1396,17 @@ static int xe_pci_runtime_suspend(struct device *dev)
>  	if (err)
>  		return err;
>  
> +	err = xe_pm_wait_all_c6(xe);
> +	if (err) {
> +		drm_dbg(&xe->drm, "Resuming - GT C6 check failed!");
> +		ret = xe_pm_runtime_resume(xe);
> +		if (ret) {
> +			drm_err(&xe->drm, "Resume failed after suspend was canceled");
> +			return ret;
> +		}
> +		return err;
> +	}
> +
>  	pci_save_state(pdev);
>  
>  	if (xe->d3cold.allowed) {
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index f517bf453b54..4a745c3a933b 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -1030,6 +1030,24 @@ void xe_pm_d3cold_allowed_toggle(struct xe_device *xe)
>  	mutex_unlock(&xe->d3cold.lock);
>  }
>  
> +/**
> + * xe_pm_wait_all_c6() - Wait for all GTs to enter C6.
> + * @xe: xe device instance
> + *
> + * Return: 0 on success, -EAGAIN on failure
> + */
> +int xe_pm_wait_all_c6(struct xe_device *xe)
> +{
> +	struct xe_gt *gt;
> +	u8 id;
> +
> +	for_each_gt(gt, xe, id)
> +		if (xe_gt_idle_wait_for_c6(gt, 200))
> +			return -EAGAIN;
> +
> +	return 0;
> +}
> +
>  /**
>   * xe_pm_module_init() - Perform xe_pm specific module initialization.
>   *
> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> index 6d5ab09cb769..fd8b2eab5de9 100644
> --- a/drivers/gpu/drm/xe/xe_pm.h
> +++ b/drivers/gpu/drm/xe/xe_pm.h
> @@ -36,6 +36,7 @@ void xe_pm_d3cold_allowed_toggle(struct xe_device *xe);
>  bool xe_rpm_reclaim_safe(const struct xe_device *xe);
>  struct task_struct *xe_pm_read_callback_task(struct xe_device *xe);
>  int xe_pm_block_on_suspend(struct xe_device *xe);
> +int xe_pm_wait_all_c6(struct xe_device *xe);
>  void xe_pm_might_block_on_suspend(void);
>  int xe_pm_module_init(void);
>  
> -- 
> 2.38.1
> 
