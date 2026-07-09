Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE1AEC43458
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jul 2026 20:42:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE93510F699;
	Thu,  9 Jul 2026 20:42:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EgG/evYq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDFC610F699
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Jul 2026 20:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783629723; x=1815165723;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FgLMshRfs7CfLgulVpNDKZEKlMJfuPNNQ8p4GdkmbFM=;
 b=EgG/evYqy+eGwDOViuk/3jGEqk/oFnABOkwHhgAA5+alhAhBLXAP46dO
 DeitEcSKD0SRzoAFjSgoC7wMSrNoR/pMNABX/rrXaFMoclLYHfWvkYUM4
 5MUJE8nnH5UNzvathEeadMzHrLvyfe3kHOO/CJuJBuLcNSOMfI1A3Y5g4
 oIpztP07A54OcWvVfEzvx3RS2a1O0Z1ILxZXhYFpn1XiZ4BL8uJDnVVZO
 HGru/pZTQCZP/t05va8PIFvi3sFU7rfJgUKDjyy9adsMkzbB3FskAI5w5
 4pxE1D7qttF1I1DUNURjdhJOzJIbQ0AwH+Acd7XCH1Z+Gwxk+kfydydtH g==;
X-CSE-ConnectionGUID: 9tIr4rGuQraSLN6H7haJPA==
X-CSE-MsgGUID: Z6s+Bf8HRwmxpf3lGYVx+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88012146"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="88012146"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 13:42:02 -0700
X-CSE-ConnectionGUID: xn76el4/QfKYsYiB5RNODg==
X-CSE-MsgGUID: O83cMrm4QqKRFl/yZ8U08Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="277929022"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 13:42:02 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 13:42:01 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 9 Jul 2026 13:42:01 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.55) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 13:42:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O+49I3umPObyH/e9p+PRnq3KD67ebcWWe6O54zqjiw1igLSteYaeefX5G39wJkPo7ZEs2p4VkTZvCvE+xQeewInW5/rjHYp1WNU25gfZ5Vidh/yuuGNMsL9TGH9B8CHCkFyhalUhG/Lz/2z54cwSaH6tSRRZPLPmuSZNJ2IVZc5mD9vlgN7AK+aedczif1LZx8cSDAFGTcqZZXoadEg0WCyg8C3IJ4VECNbkuu1up8Rw/V2cttucZOncDwQmGlyiA3ItePThNP29vwjeBzxcLJNMG08iC0Xy/WaWYBAaymC4IBhlYzcgb1Oz92pq1PQ4Fi9/0mq/6Q9qBl4FofoE2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BdmIBKJEp+aGO7XENU5n7K5gsISrn0wkXvVrcRbTwp0=;
 b=apgLlepPD11QeKcWKIg8lrjW0mHY3IGGmLWwc4PMUc+M4t/Fcin7LRnN6Gk9cpwo3wvhXDio6GprdgIQ/1bNJY5P0tdHfSqdwhRU9MtuI4r/XKwKwQfGF5CHrmkvN2M2sP0TuJSCNQxkmSm3vEkuHTFalHxOBDd0csJD1rD2WhIkVAXd8V5tWx30Q18JsyFIRRBkQ0k/01eXjIYXx809Hccym9gOm/sH9k03OS0RIXzchZ9rlu2OqDMLG3VNxuNymD9vQDUZZ4vYckMZp49TICDAo2CZOVdgIuSilAgp/Edyan8JLW/+QFuJvDisBjZoozyG01PuLIaPQUZ/63W4Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DM4PR11MB6359.namprd11.prod.outlook.com (2603:10b6:8:b9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 9 Jul 2026
 20:41:56 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.21.0181.009; Thu, 9 Jul 2026
 20:41:56 +0000
Date: Thu, 9 Jul 2026 13:41:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 4/5] drm/xe/guc: Add suspend refcount to exec queue ops
Message-ID: <alAHkBxV6KOZtqoE@gsse-cloud1.jf.intel.com>
References: <20260701050730.1776476-7-niranjana.vishwanathapura@intel.com>
 <20260701050730.1776476-11-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260701050730.1776476-11-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR03CA0211.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::6) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DM4PR11MB6359:EE_
X-MS-Office365-Filtering-Correlation-Id: df874e4f-8711-4908-9715-08deddfa83be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: 9sw17bORuZGLXJlGn7HDMQ+I7aGAUc08wXhM2mq35dSQKFk9GP4bnkFP+rw8xU5PVSni3jGzoxMZgMp1ELHwzOTQy4iC36+OF5m9/652oKvnZYfKA8U18sIwAGRhv8LKMhUrSDk+SVFTPmJ5Wb/AAUqHIul4OLHzM2rw5h3LP8vOH88QTSU7HgkrAGKx64oYItckSTAArz2cCptMOZ557Lueo2SE6yyMiYwJldoZP4900cDV+mRzlQucbE9bzo0htPjZAohluxGB33Su2/kT517iWzuhehyDvKYrvUDJCfos2WKWgBmCTVRlaRMhEYOYDsMzIL0P3O56reZRR/uaeFqrM/ujZpldlnYhzsW5Y9+dwv4F044zkYUtdcyFALGGKpWM2ciAtPW0RUEqEvh2OvH39wEgElUyAYsRo/JYHLFaFqY9qhAd9jmyVQBB1ncODkCSPDVW0Tyozry84OdG3+bJac9008x1/w/fc6HZRzQXQ8V0BZx+pDW68U/BAaIGYLQVs6AB1Bg+oZksdmKnSuPIL4OpJfwwPNSB4PqdIcZm5/o7bL2Xz74hgWa2inMwQSjd7MVJkXcCgksfJ0OA4IvVb0tESi1yeOq6XbKtBIM70f9VHmSfpGK159/EA95FojfY5MudHJzN6EpQu9g0sGlplBfi08qTeRJlY5+7/N0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?GVpK3ICk5PX5DEkBgnYF91+A1e5nIYd0+Nr4Qoot6XC5D0xpwcFfGkdXCl?=
 =?iso-8859-1?Q?irru1XRLxFeiyNTbfQ0dqN5Z3FBw4u5pJO637GlK7Gmtkzm7Bf6e2rC6r4?=
 =?iso-8859-1?Q?JbjZyZodqVJvp+XAChdBILVYURm9XGxzxW8ET9kXEnRZwSKyYPPz1vKwTh?=
 =?iso-8859-1?Q?T0RbDrnlpFK6h1/7vYnH8iCLCsrzmzwZDojG9/fw2j/f+pCjWJ5DfLFBPX?=
 =?iso-8859-1?Q?3+IYMxO4hgPJWkRPwlBNQCDGdHnCuMpdNf6xhceEOKlmd6GBPipt6PtfZz?=
 =?iso-8859-1?Q?ZCcVRk7/LMML1EWdJn3/OJX8CL2v36fHDAsfc1c1FiysLs9e9oNa6p47Qe?=
 =?iso-8859-1?Q?RHnUlVdeMGap+aP6KXbE5o5QdKeKPJCm8i3stm4a+E5l09PJra4t5NC/1Z?=
 =?iso-8859-1?Q?y6rWJroMNMve4TXAJIbJGtrekapTsBWIKrj/HCSRY01iragsSoiTiFXAU2?=
 =?iso-8859-1?Q?hUkk/PMHH4THTsqpm1OCydQnlo/rWPsyt5k8aX5zwHb6uKnp3kuIhUv7Eh?=
 =?iso-8859-1?Q?gcPoLNm+37gS3eHqsbJspXf8nUSFGecZ1XPy1qDvgWnFHFQ47kYuv35daw?=
 =?iso-8859-1?Q?VCNztnBCkr5MUeXR7wm22omjBKLi/k7f6ZTImDFx7SpApip+b3wKPz/typ?=
 =?iso-8859-1?Q?+nef1bRqjrmI8PBFAGH3GmwHMYl6I/1y4RJVhEFj9l1C1mR0602/Frj5p9?=
 =?iso-8859-1?Q?/8m54uxqyaBjzmt+J2fmdjLDQm3h4FCyi2Q6C5G99gcoiE6LnULwDlB/E+?=
 =?iso-8859-1?Q?7WjctZdLAKgXvJlU+hGr1zTahUyVMTcbJXiNTmdnuY6817W+b/Yoh6dnoP?=
 =?iso-8859-1?Q?i+6E2+dZkltrfbBnM84X5rnQEDj91ACR/efSyqR98e8rIa/qEG2ErNq/fi?=
 =?iso-8859-1?Q?p5PbIxAivhWgeOzyQRIWfiFDVS++Cg1hhBh/foEZVKe0J2zYnkQMrGZYiZ?=
 =?iso-8859-1?Q?Bb+lWNDVWw6ANYEOzpS+5r/378oAbz9nyi1pk72IJN++jFLkr0xy9d6b8A?=
 =?iso-8859-1?Q?N9jkvLGal70FmCxWqDnLUigbzCXm6d00uYi0pcwStx4LPHWOnUSiVClqAx?=
 =?iso-8859-1?Q?qHZJgtUeaJEJKqLXTOzs47CkHVAJQwkpvhtHC9YWBZkcOAbRxWW6Kx/WUn?=
 =?iso-8859-1?Q?hIs2dmToJz1hRWYxpvSdyzYyvw8SR0MqBzngIKENACu3pus47wglO0JvGR?=
 =?iso-8859-1?Q?3e9Ctuc2oEOj64atlKq0OISRjAXoThWgjnFjcKE6FHbPAZxy6w7sp48NrX?=
 =?iso-8859-1?Q?wtfnlfnTU4Y813/QywxfGcmJ2zS7KE/FSDD2YIDk6ToSHFbsO0g6285j8b?=
 =?iso-8859-1?Q?uptBWJ3p9lNwiiT/vZLfur7n6j/zDXgX/HZZQlNZTXYtAiYAxbgdtroUHV?=
 =?iso-8859-1?Q?sWm0p3GqKKzUc2UT43MYrht0X0oc+2WnJmzHX9DkTWz8EU88rOwzbo7rXP?=
 =?iso-8859-1?Q?BeTe1WklAcpipHyap5jFhj4g7cFrteJ0S6/8zxEyj/CjyKcKbn2kzQQ8n1?=
 =?iso-8859-1?Q?E9SD+sg449IjhIbHO9KLuw/7qd4OrLdI7pN5YGRSQDPO5Zt/QdhEwJrEPI?=
 =?iso-8859-1?Q?lXFYpCr+YmS7wllmABJoP6Zm6+E8oek8bj+LiSnms+q/b+KQtqykKO5xdf?=
 =?iso-8859-1?Q?ypjWhQDTXgGq+DnTw7DKglz3ctGeoVQy+bYE+E7ouHx/83g3o3ypj/ur8I?=
 =?iso-8859-1?Q?u3urlaKMbkgGUJISkk1E40uDwSFW5GHNLmr+QcZ0ERKQ1k9VhibkDSu6Cf?=
 =?iso-8859-1?Q?OG27FGX2hAbR3Umr36imk3Y4EuBIXgOD3SzvImOnpLVqUjiwsnVM/tmAe4?=
 =?iso-8859-1?Q?D2Tvs/y0ZYQVdzs/zGmpiIedkVpCjHs=3D?=
X-Exchange-RoutingPolicyChecked: Mg1xvKAj4MAz0dfAhscTdWKcQ+4rSb14YGK5EmZw+N8ESvcQ0R8esvRe/y0z4V/CFm9XzmoRQVcViqz7o9qf5kI8WczEGeeA0zT0Cpfj1ef+jmSgskFanXjt2uoGlQqXeV/AiSbD8Ofqr3fpv5wreIcVXRUCNDVQLuYWqNfn83UPIcMZVTVAhohpKjgq8V0e7if10homkYeWSENsG3hNO3qKjkEaZLyMAQVaO4li1SAtesfFUUiXyD12fH+mR8NzJo7kyK2XqM1n4jTaKKyNbG9j1+ejC9tWJjeZlx9dC79Cf8TyUBwzBjTySlgiymvnYf55K90khZ5AeB0PXbNN/g==
X-MS-Exchange-CrossTenant-Network-Message-Id: df874e4f-8711-4908-9715-08deddfa83be
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 20:41:55.9698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gD2h8UEH/6L73SJwtdxj4sjnII+JXQcOApKwfPfDFMl2wuMi02SmDUtpXVjTQG72UZTNYzDKRABgyFHHQCqjng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6359
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

On Tue, Jun 30, 2026 at 10:07:32PM -0700, Niranjana Vishwanathapura wrote:
> From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> With the lr.suspended flag a consumer already pairs its own suspend()
> and resume() correctly, and no current path issues overlapping suspends
> on the same queue.
> 
> Add a reference count to the exec queue suspend operations, as a small
> self-contained building block for callers that can genuinely overlap.
> A queue stays suspended as long as any caller holds a suspend and only
> resumes once the last caller releases it, so each caller pairs its own
> suspend/resume without needing to know about the others. This is what
> the upcoming multi-queue support needs, where queues in a group share
> a primary and may be suspended concurrently.
> 
> Assisted-by: GitHub_Copilot:claude-sonnet-4.6
> Co-authored-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

With the upper layer fixed in previous patches, this part LGTM.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  7 +++++
>  drivers/gpu/drm/xe/xe_guc_submit.c           | 30 ++++++++++++++------
>  2 files changed, 28 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> index e5e53b421f29..1207d51cf770 100644
> --- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> @@ -49,6 +49,13 @@ struct xe_guc_exec_queue {
>  	wait_queue_head_t suspend_wait;
>  	/** @suspend_pending: a suspend of the exec_queue is pending */
>  	bool suspend_pending;
> +	/**
> +	 * @suspend_count: Reference count of active suspend requests. The
> +	 * exec_queue remains suspended while this is non-zero, allowing
> +	 * multiple concurrent callers to independently hold a suspend without
> +	 * prematurely re-enabling the queue. Protected by @sched.msg_lock.
> +	 */
> +	int suspend_count;
>  	/**
>  	 * @needs_cleanup: Needs a cleanup message during VF post migration
>  	 * recovery.
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 3d9bdc22c89f..f7a3ff0d0b1d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2165,15 +2165,21 @@ static int guc_exec_queue_set_multi_queue_priority(struct xe_exec_queue *q,
>  
>  static int guc_exec_queue_suspend(struct xe_exec_queue *q)
>  {
> -	struct xe_gpu_scheduler *sched = &q->guc->sched;
> -	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_SUSPEND;
> +	struct xe_guc_exec_queue *ge = q->guc;
> +	struct xe_gpu_scheduler *sched = &ge->sched;
> +	struct xe_sched_msg *msg = ge->static_msgs + STATIC_MSG_SUSPEND;
>  
>  	if (exec_queue_killed_or_banned_or_wedged(q))
>  		return -EINVAL;
>  
>  	xe_sched_msg_lock(sched);
> -	if (guc_exec_queue_try_add_msg(q, msg, SUSPEND))
> -		q->guc->suspend_pending = true;
> +	if (++ge->suspend_count == 1) {
> +		bool added = guc_exec_queue_try_add_msg(q, msg, SUSPEND);
> +
> +		/* slot must be free at 0->1 */
> +		xe_gt_assert(guc_to_gt(exec_queue_to_guc(q)), added);
> +		ge->suspend_pending = true;
> +	}
>  	xe_sched_msg_unlock(sched);
>  
>  	return 0;
> @@ -2249,14 +2255,20 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
>  
>  static void guc_exec_queue_resume(struct xe_exec_queue *q)
>  {
> -	struct xe_gpu_scheduler *sched = &q->guc->sched;
> -	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_RESUME;
> +	struct xe_guc_exec_queue *ge = q->guc;
> +	struct xe_gpu_scheduler *sched = &ge->sched;
> +	struct xe_sched_msg *msg = ge->static_msgs + STATIC_MSG_RESUME;
>  	struct xe_guc *guc = exec_queue_to_guc(q);
>  
> -	xe_gt_assert(guc_to_gt(guc), !q->guc->suspend_pending);
> -
>  	xe_sched_msg_lock(sched);
> -	guc_exec_queue_try_add_msg(q, msg, RESUME);
> +	xe_gt_assert(guc_to_gt(guc), !ge->suspend_pending);
> +	xe_gt_assert(guc_to_gt(guc), ge->suspend_count > 0);
> +	if (--ge->suspend_count == 0) {
> +		bool added = guc_exec_queue_try_add_msg(q, msg, RESUME);
> +
> +		/* slot must be free at 1->0 */
> +		xe_gt_assert(guc_to_gt(guc), added);
> +	}
>  	xe_sched_msg_unlock(sched);
>  }
>  
> -- 
> 2.43.0
> 
