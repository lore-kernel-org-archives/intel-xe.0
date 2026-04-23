Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA3CFDEE50
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 21:32:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0662F10F2C8;
	Thu, 23 Apr 2026 21:32:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O4eFKpHD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED9210F2C8
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Apr 2026 21:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776979928; x=1808515928;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MIg7bI+7LXh7x3AkcjTBw9cbYpJzLuEmNVQqxJgAphM=;
 b=O4eFKpHDYDmZ1andADPw/xTkEqMN2tN8nnRO+8AU7pYjgnJJLuvaBtiG
 L0gn7yUKTrewE51OPqMy1o5+1OaOd0ySBd1zFy0xuUYrIvotsnih5nWJ8
 aUtwt1gOkAXjmu4gLOI5TvJFEOFrUb7XjpEgG5XsMbXHaRKFOB6z69c/r
 hcHTAOCF79cGBd5IGaan/slT3yGcT6r26GYnBX6xt96SArEU+pfv7lZo8
 MMRvrFFbT+9qoUk0ISlo3U6A7QvvSz6gh7OpX53ieMXMESkSdm+rqCnyp
 V2b3x2yfDYK6E8pnYdMaOBx/wGEcLseae2N5ScFf1FuiUGJQQaJ564Fio w==;
X-CSE-ConnectionGUID: 0KTgkoa7RW2TUPpITTTjpQ==
X-CSE-MsgGUID: GvEwFwtcRJmVAd8yVquK0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="76990737"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="76990737"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 14:32:08 -0700
X-CSE-ConnectionGUID: QUwsi08GQDulVgNYW6CMzg==
X-CSE-MsgGUID: 0wfiwwAzSwurSRDQeizdZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="228445061"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 14:32:08 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 23 Apr 2026 14:32:07 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 23 Apr 2026 14:32:07 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.2) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 23 Apr 2026 14:32:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jSLJd8jsVZ3K6eCjM2qncvVHAEe98LcmO5RJ+WZMdLrwjlFTHYeg2zj5JxPrHrDWRrsma4ujrydo/O8DsqJRd3cbQWoSyh04i6DYhGaoc4pBLa+E6qDFocxITfNFqOfAP3KcJDz0BG7MKQMeefAUzjShyHc4ngqSAmIuL9mGyWX4tahe3VJlcL2T7IoDkNa20FpefkID60Td5pyXMTaRebt5+KN+tZgRylA4Ei2fzSpir9j0eNHIdKiSmZzntsYR6FvC5DEN6Z7HlaEpkpHVA6CVwfTtqfRXnDu4Vs37+63DpsQ/hDoPRUjkazYo0Lq5Pg05eqOflOoUQ27TGxODWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/MqJGHeq+YoNOMEIGcedvdo6JlrU7TmzXDqAGIf49kQ=;
 b=naILPmVJacigPTrdqkoHcrG/uZ2lgmiZDYqmWdxh+aJlsiKTz0e3IKNOiPuThQ6dCsYlRpg3LGYJhcmQX2wO7FyJCOUINPveFf75gLtvzZnDe5KPeWiO3vlOeIaKt+2SphdrEhrom1AxaeicHx+3cVAk2XUi28yWoc0tuk8GhxJKkFBVnbwTn0N8F1wwJS+/r3xot4dJslszw/qdbCckAUSLP4NA2kxt0ldLpYGYXYo7pfQ20qMRhufgAoJg6SerXGXgFGgUHWrYXMjYINJ8e+011zJVJ9OsPY8KIby71KIK6honzFivn90Kg3vrLEQr/nwVXAdQgSLTBSAVkw+zlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS4PPFEC77118F8.namprd11.prod.outlook.com (2603:10b6:f:fc02::5e)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Thu, 23 Apr
 2026 21:32:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%7]) with mapi id 15.20.9846.021; Thu, 23 Apr 2026
 21:32:05 +0000
Date: Thu, 23 Apr 2026 14:32:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC 2/4] drm/xe/multi_queue: Refactor CGP_SYNC send path
Message-ID: <aeqP01OXUXVRiDou@gsse-cloud1.jf.intel.com>
References: <20260423024954.1665095-6-niranjana.vishwanathapura@intel.com>
 <20260423024954.1665095-8-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260423024954.1665095-8-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR13CA0006.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS4PPFEC77118F8:EE_
X-MS-Office365-Filtering-Correlation-Id: 949cf060-1e59-4f34-6b8c-08dea17fc3c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: xH3xBvM/ojSn3gT/AdxHC4GQvmGORYxUlMLM1WEql6dpvlWyOVdUPE4MBtsfkgjEDAjb+lVSzXliYjPKpIdXvtBIa//74isK2UnSXqb88fFfTZm5rfIpWqfUNwpl04Ss5vK9QRvzxTBxoK+oj+Agg1zmhA87hbek6gtgdwTlp7APQhyQHqJAqTx0+SafrHO9gzl8mJMjYVmu7B1MRjjteCgyy+e7uKRuEq67KpWW4CG6knOQcQ53SH9hqIDDbe6/pu9tXPF0dGGSryElHUSMWNjc3VTtzR6sR2+RizrME1159ow280oucvbyNR2IkrejVfDzGP5L2mHrnkOgxkzQCurOS6Dev5JQoKwOqK6RpxiBhvb/Wq4ArNQ3B9mNKejlOL9jafNCSAU8709cfGwvZrdIKLM8ewMf5jO6NU9Gqt9I8fE+sYmbZdKhUUXmg9ncS/e/UJE4RLEtswJFW7hXgIxR/hCk8kytZ6WPpV+H5qaxNPgGyqL6bFXV1c9dBrwqIEJvNWmDkczDPwY+NhS1hUd4ctLhIWMmVwcHZj0dWwfsrf6I6RWbXJyspZD8rcSJk4Fkv6pkKC4jo1sRI+yXoA0Axue9rzTrRmKr1ysX/8Id1D652j3PIlPT0Yx7eQ4Ostv8rbNeOn6oKocwKbmj2cVHBLq7l5Zfbx3wvOl3XQSMHu3BoC0qYx159IkG+qIJCkPOwXAEK9P5gLSyX2XSuQ+tEnd1sCdBd0mUdGrbF3E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QjByOI1wtoqb6YvCveWFptOvF+C8gLuAKXXtAF++UYINYg8LiU2pUeKt4aBE?=
 =?us-ascii?Q?/oo/b7QaSOsFyUqjSPNj2a+DxDLehXrjD8uOLJ0yHUw3BAOetBtbN0nGzg64?=
 =?us-ascii?Q?Pz6f29BDWspNeYO9WOUCnprj3VQizp6b+M8ZPf97HrFZ12rMjZBpQGQuNHL5?=
 =?us-ascii?Q?iYKJhaCbR3QWEZ6s3Si4e3Euvbehh1SRPhLuUrtLXOMU3ZtY/HSS1tQz9n2g?=
 =?us-ascii?Q?pvaDZ2/eIaoOwhlekA7VFIsmX5CDy5FVrcm7sJExwbaiQo33hqgc/u7dBGPg?=
 =?us-ascii?Q?+BGXTmS+Y/cu9N42MueOLqtKp4Mclog3dPTsrxgB2sylkHOsfETHPgVrYH6C?=
 =?us-ascii?Q?mDD+jIk6iPrUTsXUusACb8oQl33C8lR+7JW1XkRRE13irJrSxuIgNUCwONty?=
 =?us-ascii?Q?nphUssK4SLOiQdmkuWMnquo9G27c6Ivb/BOHhXdAf+SNdHyjG7qlMuMmcxy8?=
 =?us-ascii?Q?fkoThaAmoV5rk3aArkimDLT1FcCBA+4geUC/egRNTK9CdPd6Cc46ba1FrVR/?=
 =?us-ascii?Q?PszPCi3NRqig1RHL0NvEJm1Pm1U5gRJoB2UWS5vm2s1vnTgYWIcIJkHg6yet?=
 =?us-ascii?Q?9YCGmE4SXrCr//4/AoHd9+5HEroORMRd27PZQT+fHj9RcRNGTesCd2Tc3ED/?=
 =?us-ascii?Q?Tt6W682gqkTNWZ3rmpjT4WocRmDzdqtPP4RMkmskbLQkjKZMoxGtRSFHyPlv?=
 =?us-ascii?Q?ibVxTPs+MbjskXz5/vbVZKV77kXGlqawoTOJkZOkVzOUj+QiC456H70WJ9oF?=
 =?us-ascii?Q?EEfgLXoqd3G4uB6r+wxvI23KgcxNuhnb8OeOKwnE1/zE0JGYILUs156SmbmE?=
 =?us-ascii?Q?w91/rwGFwsQ4yLm/uYk16bBMqs3IgDQd9p3AYo29BWWC1r6y//lqnZHmk72Z?=
 =?us-ascii?Q?HYhHW4tj2zMIpHXJW3nRKNA0enjxqSccw4pcp0/fBTLm043ZZ5rP/1adhtnr?=
 =?us-ascii?Q?jmE0qFzrH4/eZiFLd2D9Frqfo5bPxcrH7OTaWWWZqXffmax+S2kEKd8i0QfT?=
 =?us-ascii?Q?5PD/RBZin8KGsRkwOeEq7icOWFl6nuNnPR571ODVvr1k5fsBrxiY6dXslymc?=
 =?us-ascii?Q?+ws0tmmLUe4TsziCTlFe28y1QmIgTYiD87HJtWNts+LtYK7PcAwFtglU32Xd?=
 =?us-ascii?Q?/w26D93qrehs49UUMXw00X3K7hwY0+pG3cltmjc6d9e9uKEfordGqIiZCHVk?=
 =?us-ascii?Q?vCUhaDUuUP+UOZfaLm+bWBbh/37W4o9awFPY5rsX4yDW6LwbEF3/gVp58NiE?=
 =?us-ascii?Q?L80nsKltlTxEePlTMf27vL1HoYvCrGLmAo5cdciHyYV1GaKfI8l3KVyR5SlN?=
 =?us-ascii?Q?mq4xuKjkpIp7+cp6/ZJEmr1bGeldUzVZxfITsdNmuhIqOGkDiEITAX6EXkng?=
 =?us-ascii?Q?BOiN8N3Agrwy+NCrp2WU7Soe2fFdi9ToyRm2mqi9DwVOqaV5YSyB+AY8SbjB?=
 =?us-ascii?Q?LlOqLMZpUX/Y2qsWb1ACrgbXTtgSDWoIvcvdowViamFx7180xPRpwa8c1LT3?=
 =?us-ascii?Q?eLOyumyKoMiAtjBn+IaBxa1urj7qTiShIbjl0MJ5tA/US7dJK8fU87Wq2gYc?=
 =?us-ascii?Q?mTtgMl42Wad908JtzN8eGgsIxl7c7G+39VzKij6p+b4FK6hvVIvswU1ZJhxi?=
 =?us-ascii?Q?+4U3Uv2uvKqiROZqXZXL3NJPdAGq7NIt0W+d8KvFrWqUyqcCIzzmL6TFlRsn?=
 =?us-ascii?Q?B7DyaNWBXgozdoFODByOSvRKnw6DncPMo3ixW3mja1PpONZFb1oFh4Kyg5M0?=
 =?us-ascii?Q?pqsPt8DjvZqkdRN/azGuDAVy6h/SvHs=3D?=
X-Exchange-RoutingPolicyChecked: frg716AwweMHcnkKdFiVzqWp3wb3rwDGFqpPKquIwaaDaV3TFWFVGmDWBMwT9BDUQUSmKJnC5kvQWvKSD0VyWwFFXy51YwYpJfnrr5ZQ693l8LFg51Yp74qC1HIaQtXsuoS5m5L46TwiFux5M+BSTw1D3WajjdiUgP6I85lfDo0wsv0QX079oryNtVw7NlGulqxIm5TgQ0dzbuM3NSILK1DYqLfzBuptqnnrcbu8edH+sPTOBwv5VlZAzBiIgPWT4Z7OUqay3aza/xbXUHjh2zb4Q52yDI8jFr8oEXuhNf6EfHOP1kbjotilAdsYzlUkOCJQP4DaF26Q/tly8e5DwQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 949cf060-1e59-4f34-6b8c-08dea17fc3c8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 21:32:05.3276 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ereSn7d7418HJBh6ukI2alSKnwHUMxeOyaIR9ssmVj3d4yMIGu8WRjMPTHW8ZzgMSp2Bz5YiA3pYSNZkwRJW8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFEC77118F8
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

On Wed, Apr 22, 2026 at 07:49:54PM -0700, Niranjana Vishwanathapura wrote:
> Factor the repeated CGP_SYNC action build-and-send sequence into a new
> helper guc_exec_queue_send_cgp_sync(). Drop the redundant guc parameter
> from __register_exec_queue_group() since it can be derived via
> exec_queue_to_guc(q). Remove xe_guc_exec_queue_group_add() which is now
> identical to the helper and replace its call site directly.
> 
> No functional change.
> 
> Assisted-by: GitHub Copilot:claude-sonnet-4.6
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 65 +++++++++++-------------------
>  1 file changed, 23 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 104e65913dff..4171eff4e8ad 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -852,10 +852,27 @@ static void xe_guc_exec_queue_group_cgp_sync(struct xe_guc *guc,
>  	xe_guc_ct_send(&guc->ct, action, len, G2H_LEN_DW_MULTI_QUEUE_CONTEXT, 1);
>  }
>  
> -static void __register_exec_queue_group(struct xe_guc *guc,
> -					struct xe_exec_queue *q,
> +static void guc_exec_queue_send_cgp_sync(struct xe_exec_queue *q)
> +{
> +#define MAX_MULTI_QUEUE_CGP_SYNC_SIZE	(2)
> +	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct xe_exec_queue_group *group = q->multi_queue.group;
> +	u32 action[MAX_MULTI_QUEUE_CGP_SYNC_SIZE];
> +	int len = 0;
> +
> +	action[len++] = XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC;
> +	action[len++] = group->primary->guc->id;
> +
> +	xe_gt_assert(guc_to_gt(guc), len <= MAX_MULTI_QUEUE_CGP_SYNC_SIZE);
> +#undef MAX_MULTI_QUEUE_CGP_SYNC_SIZE
> +
> +	xe_guc_exec_queue_group_cgp_sync(guc, q, action, len);
> +}
> +
> +static void __register_exec_queue_group(struct xe_exec_queue *q,
>  					struct guc_ctxt_registration_info *info)
>  {
> +	struct xe_guc *guc = exec_queue_to_guc(q);
>  #define MAX_MULTI_QUEUE_REG_SIZE	(8)
>  	u32 action[MAX_MULTI_QUEUE_REG_SIZE];
>  	int len = 0;
> @@ -880,29 +897,6 @@ static void __register_exec_queue_group(struct xe_guc *guc,
>  	xe_guc_exec_queue_group_cgp_sync(guc, q, action, len);
>  }
>  
> -static void xe_guc_exec_queue_group_add(struct xe_guc *guc,
> -					struct xe_exec_queue *q)
> -{
> -#define MAX_MULTI_QUEUE_CGP_SYNC_SIZE  (2)
> -	u32 action[MAX_MULTI_QUEUE_CGP_SYNC_SIZE];
> -	int len = 0;
> -
> -	xe_gt_assert(guc_to_gt(guc), xe_exec_queue_is_multi_queue_secondary(q));
> -
> -	action[len++] = XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC;
> -	action[len++] = q->multi_queue.group->primary->guc->id;
> -
> -	xe_gt_assert(guc_to_gt(guc), len <= MAX_MULTI_QUEUE_CGP_SYNC_SIZE);
> -#undef MAX_MULTI_QUEUE_CGP_SYNC_SIZE
> -
> -	/*
> -	 * The above XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC do expect a
> -	 * XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE response
> -	 * from guc.
> -	 */
> -	xe_guc_exec_queue_group_cgp_sync(guc, q, action, len);
> -}
> -
>  static void __register_mlrc_exec_queue(struct xe_guc *guc,
>  				       struct xe_exec_queue *q,
>  				       struct guc_ctxt_registration_info *info)
> @@ -1028,7 +1022,7 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
>  	set_exec_queue_registered(q);
>  	trace_xe_exec_queue_register(q);
>  	if (xe_exec_queue_is_multi_queue_primary(q))
> -		__register_exec_queue_group(guc, q, &info);
> +		__register_exec_queue_group(q, &info);
>  	else if (xe_exec_queue_is_parallel(q))
>  		__register_mlrc_exec_queue(guc, q, &info);
>  	else if (!xe_exec_queue_is_multi_queue_secondary(q))
> @@ -1038,7 +1032,7 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
>  		init_policies(guc, q);
>  
>  	if (xe_exec_queue_is_multi_queue_secondary(q))
> -		xe_guc_exec_queue_group_add(guc, q);
> +		guc_exec_queue_send_cgp_sync(q);
>  }
>  
>  static u32 wq_space_until_wrap(struct xe_exec_queue *q)
> @@ -1887,21 +1881,8 @@ static void __guc_exec_queue_process_msg_set_multi_queue_priority(struct xe_sche
>  {
>  	struct xe_exec_queue *q = msg->private_data;
>  
> -	if (guc_exec_queue_allowed_to_change_state(q)) {
> -#define MAX_MULTI_QUEUE_CGP_SYNC_SIZE        (2)
> -		struct xe_guc *guc = exec_queue_to_guc(q);
> -		struct xe_exec_queue_group *group = q->multi_queue.group;
> -		u32 action[MAX_MULTI_QUEUE_CGP_SYNC_SIZE];
> -		int len = 0;
> -
> -		action[len++] = XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC;
> -		action[len++] = group->primary->guc->id;
> -
> -		xe_gt_assert(guc_to_gt(guc), len <= MAX_MULTI_QUEUE_CGP_SYNC_SIZE);
> -#undef MAX_MULTI_QUEUE_CGP_SYNC_SIZE
> -
> -		xe_guc_exec_queue_group_cgp_sync(guc, q, action, len);
> -	}
> +	if (guc_exec_queue_allowed_to_change_state(q))
> +		guc_exec_queue_send_cgp_sync(q);
>  
>  	kfree(msg);
>  }
> -- 
> 2.43.0
> 
