Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B34DCCF9F8
	for <intel-xe@archiver.kernel.org>; Sat,  1 Nov 2025 23:42:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A65B210E04D;
	Sat,  1 Nov 2025 23:42:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GAiKgt3n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB0C10E04D
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Nov 2025 23:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762040531; x=1793576531;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=swpWK7+pSIJyuP4hUT9St2/CL2/9ypf8wW/IkwHgzvU=;
 b=GAiKgt3njzeL7dYWJBQsprMTZVFlHZuzcUjcO9mQz3w1SIrQPr1eYAjh
 YEnY1nNyxIoXFOku/J99s5FiYQeufUTepfNHZIxC3Vp1kP7apbX9tVNVh
 DJe4CKz594NYCeUpVKsrtg5UD1F7nd8E03aj28+kNzsh9/LUOrgr0KX/1
 dl5OvcCO7zAbXtPJRWbt5lmNvZBndp+DNoZUlU+SGRhgrvhBRId0Fq1Pg
 oKnu826U13PdWRnSVTNGaZtnTHZMYCjkah3QO/9ahgQZFil4ZCPdDmQWn
 ARZ6x5WlrX+HkEn9MzTYoNB8vcszd4Sf6GEgC6Ibq9+yhGc7FYX1Z2ai2 w==;
X-CSE-ConnectionGUID: 7CugnAgRSu+2k6MAtLTuZQ==
X-CSE-MsgGUID: GOy/uSPMR/+nDEbfavkoog==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="64053102"
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; d="scan'208";a="64053102"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2025 16:42:10 -0700
X-CSE-ConnectionGUID: 0AEiBeM2SSyM0rJ5272ERg==
X-CSE-MsgGUID: JAGfOZlBTGOqfbULzkaDZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; d="scan'208";a="186419131"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2025 16:42:10 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 1 Nov 2025 16:42:09 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 1 Nov 2025 16:42:09 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.32) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 1 Nov 2025 16:42:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iMeaBJCIim/QWxjk34js58lf5EWFKiOyq1yam59OvlTPVUuPbFuGtxZe14kBMySv5ytcjLgGatsj9pWKL/2DBhoVvSP5ymcylESIoMbI6wrolCf+8eNUMWxpDU7LNRcvL/f6OvhJ8V+IYq0X1nPKFMBlJDyEe+lg/rVW/FobHLwAQzqu+73X5aV8MjirzYh+Z6Tal/87SEUsnDqlSSYBBKafUMj8CIRvMkL/knqoGQlzVIoJFaQjJLX/yFxkGdly5YDbrqoCuIItSxQj5ozYaPvOTs0VdvNiFlxN77PGkGOKPP1USxtSCF96TudPfaT06KJSPgieWIZ4H6/lc4Zp2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PHBG+hz1GZ3BXhqwEn565RRpncDPf6SBFOzDEobPE4Q=;
 b=U7fThERrwtyplygdviC/UNYu1eIoSrgw3+E2W0mFGgtfVDxSMN8+NTfjdHk/gzu9PMlVMrjqT8MLAvMNez7wXQbGapkpb9oXA7IQ0HiPNb4POaSC25JJ6i0EB+BqEArmvnOhBBQ+LqyGZuqIPpeTWPPqOVMp+fYixI+kaT7BqVUGJzK6+r9Tdil2Xdzh2ZajJWISA6vGYHDGp2tHkeBby/n1ZncXlieKm92SEHH8UqKzQt9sqvLURjiMnvpqB2J6PWxqmJtKlO3Za9lXH5TUxw3iAXjYLqfaMtVDYQumcAEJGssPWDYuW7vB10r37wJmqtPTu+oxUcuz+TOAAcmVhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8575.namprd11.prod.outlook.com (2603:10b6:806:3a9::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Sat, 1 Nov
 2025 23:42:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Sat, 1 Nov 2025
 23:42:01 +0000
Date: Sat, 1 Nov 2025 16:41:58 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 07/16] drm/xe/multi_queue: Add support for multi queue
 dynamic priority change
Message-ID: <aQaaxtYCevkVoq4u@lstrano-desk.jf.intel.com>
References: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
 <20251031182936.1882062-8-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251031182936.1882062-8-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR03CA0210.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8575:EE_
X-MS-Office365-Filtering-Correlation-Id: fcdd81ea-704f-48ba-9c61-08de19a0410e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bZBchVnF6DzUCq0R/TsjkEOg3N1oiJjeqB6yLTCH76S+I2bJGmaapwJQT/Po?=
 =?us-ascii?Q?0fLmWk0csWmEG4p7Z/g3/dv2YFryTZvQggEmhlo+ZJ8NKFuU4z6CqyOziWeJ?=
 =?us-ascii?Q?xw/M+m2C9ZTDlV+PlmWf4Cy5aWyrJ+bmAHJt+wv8OZLOk97Dxlt9yQA332bs?=
 =?us-ascii?Q?WnUhHZfJS94vVsXxVha6PBHtwQmUDY7iwOi5rx9RFB4nYN6a6xaizuEWn2JW?=
 =?us-ascii?Q?EUXXFNcYc3f5M2ZwSCNNbiSrZ+lO12WfRtiXG19//hDWNMZStus1T3HDOaK3?=
 =?us-ascii?Q?41nvauw1TEHeh5KKiIgMGuCuEJdZGRgeuTG8CCWAiRL+dheNBrO8i1FkV8Tm?=
 =?us-ascii?Q?h4F4gLnER5O71iEYB5wi7JN95/iv3LBhmae7yzoVJNENem5t2lr94lXd12fe?=
 =?us-ascii?Q?qQcP9JEDCFRsZUWxrFRRybK87eB/uxm/Z+RH28uzGwkwLHEb5LO1Ls4hpBJV?=
 =?us-ascii?Q?xSGyAAM+GBuc6cAYyEZXUOPFWbR5zCChQOHoSTFu2Rk8l5kDQ5kTe0OJ2x8j?=
 =?us-ascii?Q?5ZMpkqMKtZ4ysUFF2vtYRp6Gfrym+OtMDP+Z7dn+YhrvBg9mXLKc8FUtCOup?=
 =?us-ascii?Q?5Gwyfi5CapQK9/xSAIhJp4VdDYIi9NHKN+1er1Z1xH9SpZhPpFm8fEH4FKeP?=
 =?us-ascii?Q?qv1dhH+O8Lbo+hiNFaXR8rBkRqLsq8tGJU89x+QN2Re62Qp0mtUtTFKVlGva?=
 =?us-ascii?Q?moKOi3MKYoFNf4E1zvRiThQsxOvTVos9Jf7S+1D7OfLLsTpCP6kxQitrIYJD?=
 =?us-ascii?Q?OjKy77Wo/5HhkfV/RnI7kD/rBw8J87aWp+1r8Ct9WC/VOcz8K4A1CYzaojoh?=
 =?us-ascii?Q?1ms8p5udo95L52yBRcLZhQ0lffjmZLJOaSuqWj37TaguCoS3TG7CohQVAa1p?=
 =?us-ascii?Q?UpvfYFa1LOTw/F6UXkqKaxET4CZkouJMY7aoAIdb4kDk2gtr7GmgffX/2dtM?=
 =?us-ascii?Q?GMVm9BiivcEao65j2i50Y2Qb0/0mnZL2GjDRjr7GpeJZxT4kOe7jMxK+3TLe?=
 =?us-ascii?Q?SZ9YJV9jBr6quJicZLG16+bPbBXVX43xvheZUo7e4QeBiBa1mehjll2exiFN?=
 =?us-ascii?Q?Gw6eJzoOwkLEVmKfvTA4JGTd8BlCf8HGP93tBOmNiE+9A+MXnhKBHkv5ZhFW?=
 =?us-ascii?Q?TZRWMH76D5pBJa1mSLjAPH0kNowJJ7ryBlU8+QGYeBwy42tMBSsBI6ZscF9K?=
 =?us-ascii?Q?LZASEDU3TxUUfP+KhLK6OgqKmbLK65zbTJbQ8jIWNyZzUftzQwRyBqz2eV6r?=
 =?us-ascii?Q?RmJNupbX+M9e4W01zTcwMlZAtkQCRZAgSMV7k3mcL2SYI/1I5dvktL1Dk+II?=
 =?us-ascii?Q?uOas129Jemqvn1FiOl5fm7hFeQRELyxUASRLvSYUNTf+sBzCj4/xb3jgpjVh?=
 =?us-ascii?Q?X2A99x7hERLT9qoPFs+7IHLNf9TRzgtkD83dwNbyOvEfabTuhAjWb3gJ+ZxH?=
 =?us-ascii?Q?tMu2TBujreXx2ks44ugxZuEkttZkKyR7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O/Kvnw6zh046vayMC8oduU+4QhCBTJJm9ZkqMHphvURkYQahx7zgBOlrn+3x?=
 =?us-ascii?Q?88w+HeArhjadn0sL9ucmyxwdZoUcDPpSEnhI/KBEeMo8ce634DoNXhVwIH9C?=
 =?us-ascii?Q?Dn8HOg642pC6q6JKmdgX96hN1iKwWmOgCf/xQxcB4vqG7tXNPy+p3IVUhhig?=
 =?us-ascii?Q?FTFjhhtSPrgQTG3PLK5cytCGT9RV+IhUDjffEZEMw78i6WUOfl05IA2UlkjM?=
 =?us-ascii?Q?LJWz3gewmlaG9N6XSQ8C9RPkMcOBwLVX80n9tbQbaCoZEEbPxZiRSZ2YyAXc?=
 =?us-ascii?Q?DgjrYByRUYv4kWIyaBmJ39yxDt3sEKZtltK01wPpYRdWsMwPbzxYCE6MKyvq?=
 =?us-ascii?Q?gI0o97/ReSqXvM3v1vosZQoST7+x3cqYsiqn306xQ5axrcFqvWw0r6o4xKJp?=
 =?us-ascii?Q?83lNXLhAW8PXW7bic4pKy4VOARjfIJ3yLWnzeyPyYEbQ23Q1zAYiQvQzWBbQ?=
 =?us-ascii?Q?QateHIPwDfeRLaW5iH1+SsnhHsUBUBLbFiFUcMXbfpz1mPL5Rj/6css8ObWH?=
 =?us-ascii?Q?5IxOWZiQ32l6EK86gYUbh6aDrqZYwuEm5HD2Ygg/bAkuWsREJecNXlTl8lmV?=
 =?us-ascii?Q?dwPj3QvLMrOB9NEbMjlF8M6VZgIKwT4zMnNfSUwwCkw2eHt0/gRBSIPsfpN5?=
 =?us-ascii?Q?TKRQQfCvTv0CT72es4y3oo6+4nDsSnXbNCUX8wKboKf3aOLbRMwHylh1dthB?=
 =?us-ascii?Q?lOaw25juIj+o1i4neBLSS4HHjlDUgfkb9iuoHrnlNBUIHKfzzz0Ap4Fn1W+e?=
 =?us-ascii?Q?HstlOax+xY4KrormIhg84Z7BLB4NgUNKDuM3OFE1VURCAUKR0XWYQLxHkv5u?=
 =?us-ascii?Q?A4uMS1cCL4swnXY8otyCWxmd8EXsvt0uxMa1wyu6UPgo6kfkwvv/j7FCPpM+?=
 =?us-ascii?Q?P1LvG6jTWVCQN/AwKcr5tIF9w2QLhgMnCA6LIV+5S/ywidok4PWX6JkfjL1t?=
 =?us-ascii?Q?ajMz68KJzlVn/PyLewtbxSy0bK4A6e6ZPP2qB6IdxMriZxW6nbIHTHiclyS3?=
 =?us-ascii?Q?1ahkWA0m9jTdizam6e5g6oNzaPVeZh4jYj8MAI6q67XJB87o3QKvYIfyjeZo?=
 =?us-ascii?Q?ce3eK4FO71WsYBX0EoiK6JoeG5p1PAXpbDjP9avAuTtP+4LUSd+KUAd3sNbi?=
 =?us-ascii?Q?Zi21wBzeakNMQVhiF5jAl5zxYHKTIlaHLc0mkXmNRZ4RKTxdhgkCQOj0NvoG?=
 =?us-ascii?Q?GnYr4kR0S0jctKTHyS7CeawBB2FRMv+Laz2zL8XNtN3MQPwgcRyaTPJXOFnl?=
 =?us-ascii?Q?ZoicnpBYIBmQZtKnEM5G0QRDrH+g+1B57JFVa5LR9LzqqSzzCACTpXu03O/T?=
 =?us-ascii?Q?ZcX4Ey3mrMyEv/POwK3pwH/khd7uwAmAI2VniKUWnbMBFcjbVvE+emhMgteG?=
 =?us-ascii?Q?KNEAIlGU443KSDlPfOp3Xv6Fu92EGlG5SYpSQsJk9KTsDbFFpZGEEXGwYZXD?=
 =?us-ascii?Q?GfB/c5S5A6RqNc1SsBQpBbFEo9lclkNWXuJR3fOFiQhXK9z4Frn8vlWAaH90?=
 =?us-ascii?Q?BAevpSEmJk1gsZ7xy1sytlYk6oGSvuElmSXNQJq4mW9MS9//tMQBQXjX0W8k?=
 =?us-ascii?Q?Fmew7OgQ/GWaMGSJ+Om1b3kpA6MlozIRsTlR+xJkNyUeqj0Y/EWTSQSQ9rr8?=
 =?us-ascii?Q?lQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fcdd81ea-704f-48ba-9c61-08de19a0410e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2025 23:42:01.1377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: neHsUW7tHG0YQUGWQMFgWPoAfY2eMKm8g+Gn/yhLzNEMInbVtPRAtvfPgiVqmdeKSlJ9qHffYgxk4aeVUQC1sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8575
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

On Fri, Oct 31, 2025 at 11:29:27AM -0700, Niranjana Vishwanathapura wrote:
> Support dynamic priority change for multi queue group queues via
> exec queue set_property ioctl. Issue CGP_SYNC command to GuC through
> the drm scheduler message interface for priority to take effect.
> 
> Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 12 ++++-
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  3 ++
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 56 ++++++++++++++++++++++--
>  3 files changed, 65 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 0264cab00fd4..98f8f1c7f13b 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -729,9 +729,13 @@ static int exec_queue_set_multi_queue_priority(struct xe_device *xe, struct xe_e
>  	if (XE_IOCTL_DBG(xe, value > XE_MULTI_QUEUE_PRIORITY_HIGH))
>  		return -EINVAL;
>  
> -	q->multi_queue.priority = value;
> +	/* For queue creation time (!q->xef) setting, just store the priority value */
> +	if (!q->xef) {
> +		q->multi_queue.priority = value;
> +		return 0;
> +	}

I also don't love this check here as if exec queue creation order
changes, this code breaks. I'm pretty sure you can just delete this and
send on the message to the backend given
guc_exec_queue_allowed_to_change_state check will change the backend op to
a NOP.

Matt

>  
> -	return 0;
> +	return q->ops->set_multi_queue_priority(q, value);
>  }
>  
>  typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
> @@ -760,6 +764,10 @@ int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void *data,
>  	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>  		return -EINVAL;
>  
> +	if (XE_IOCTL_DBG(xe, args->property !=
> +			 DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY))
> +		return -EINVAL;
> +
>  	q = xe_exec_queue_lookup(xef, args->exec_queue_id);
>  	if (XE_IOCTL_DBG(xe, !q))
>  		return -ENOENT;
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 964a0e6654c7..dcb55b069ed8 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -241,6 +241,9 @@ struct xe_exec_queue_ops {
>  	int (*set_timeslice)(struct xe_exec_queue *q, u32 timeslice_us);
>  	/** @set_preempt_timeout: Set preemption timeout for exec queue */
>  	int (*set_preempt_timeout)(struct xe_exec_queue *q, u32 preempt_timeout_us);
> +	/** @set_multi_queue_priority: Set multi queue priority */
> +	int (*set_multi_queue_priority)(struct xe_exec_queue *q,
> +					enum xe_multi_queue_priority priority);
>  	/**
>  	 * @suspend: Suspend exec queue from executing, allowed to be called
>  	 * multiple times in a row before resume with the caveat that
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 5ec144c1c2dc..426b64ef8d99 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1761,10 +1761,32 @@ static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
>  	}
>  }
>  
> -#define CLEANUP		1	/* Non-zero values to catch uninitialized msg */
> -#define SET_SCHED_PROPS	2
> -#define SUSPEND		3
> -#define RESUME		4
> +static void __guc_exec_queue_process_msg_set_multi_queue_priority(struct xe_sched_msg *msg)
> +{
> +	struct xe_exec_queue *q = msg->private_data;
> +
> +	if (guc_exec_queue_allowed_to_change_state(q)) {
> +#define MAX_MULTI_QUEUE_REG_SIZE        (2)
> +		struct xe_guc *guc = exec_queue_to_guc(q);
> +		struct xe_exec_queue_group *group = q->multi_queue.group;
> +		u32 action[MAX_MULTI_QUEUE_REG_SIZE];
> +		int len = 0;
> +
> +		action[len++] = XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC;
> +		action[len++] = group->primary->guc->id;
> +#undef MAX_MULTI_QUEUE_REG_SIZE
> +
> +		xe_guc_exec_queue_group_cgp_sync(guc, q, action, len);
> +	}
> +
> +	kfree(msg);
> +}
> +
> +#define CLEANUP				1	/* Non-zero values to catch uninitialized msg */
> +#define SET_SCHED_PROPS			2
> +#define SUSPEND				3
> +#define RESUME				4
> +#define SET_MULTI_QUEUE_PRIORITY	5
>  #define OPCODE_MASK	0xf
>  #define MSG_LOCKED	BIT(8)
>  #define MSG_HEAD	BIT(9)
> @@ -1788,6 +1810,9 @@ static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
>  	case RESUME:
>  		__guc_exec_queue_process_msg_resume(msg);
>  		break;
> +	case SET_MULTI_QUEUE_PRIORITY:
> +		__guc_exec_queue_process_msg_set_multi_queue_priority(msg);
> +		break;
>  	default:
>  		XE_WARN_ON("Unknown message type");
>  	}
> @@ -2004,6 +2029,28 @@ static int guc_exec_queue_set_preempt_timeout(struct xe_exec_queue *q,
>  	return 0;
>  }
>  
> +static int guc_exec_queue_set_multi_queue_priority(struct xe_exec_queue *q,
> +						   enum xe_multi_queue_priority priority)
> +{
> +	struct xe_sched_msg *msg;
> +
> +	if (!xe_exec_queue_is_multi_queue(q))
> +		return -EINVAL;
> +
> +	if (q->multi_queue.priority == priority ||
> +	    exec_queue_killed_or_banned_or_wedged(q))
> +		return 0;
> +
> +	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
> +	if (!msg)
> +		return -ENOMEM;
> +
> +	q->multi_queue.priority = priority;
> +	guc_exec_queue_add_msg(q, msg, SET_MULTI_QUEUE_PRIORITY);
> +
> +	return 0;
> +}
> +
>  static int guc_exec_queue_suspend(struct xe_exec_queue *q)
>  {
>  	struct xe_gpu_scheduler *sched = &q->guc->sched;
> @@ -2095,6 +2142,7 @@ static const struct xe_exec_queue_ops guc_exec_queue_ops = {
>  	.set_priority = guc_exec_queue_set_priority,
>  	.set_timeslice = guc_exec_queue_set_timeslice,
>  	.set_preempt_timeout = guc_exec_queue_set_preempt_timeout,
> +	.set_multi_queue_priority = guc_exec_queue_set_multi_queue_priority,
>  	.suspend = guc_exec_queue_suspend,
>  	.suspend_wait = guc_exec_queue_suspend_wait,
>  	.resume = guc_exec_queue_resume,
> -- 
> 2.43.0
> 
