Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1E2D5D695
	for <intel-xe@archiver.kernel.org>; Thu,  7 Nov 2024 22:15:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8722B10E8FC;
	Thu,  7 Nov 2024 22:15:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GSk6C8Te";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A346110E21E
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Nov 2024 22:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731017734; x=1762553734;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qduZiPF6c5ZFQO0TztWrO8WxVsUNaPPWQfblwVqtsk4=;
 b=GSk6C8Tew8+O23U+ZijR4TYxUzd+3v3K1twcRu/MWVtDqMz9x0jWnOec
 GTtL0IiWTGtZsaIW/UE7VKxnSuMWww9UxPPPo1F0tJ9YT1ietHWcgNROm
 gaRV+EJJoqFT6KdCoeFxZqwYgWCTiuABDzmb7OabUAZfTIrc//CGVvba2
 ZkM093ExK6RdrnVysaXsnEy96GksIoJrMNtAweCHmt8tqBfMxAWsh5CUM
 SmYlhAE7Ai9opuV0bqJGmpkn0bDhp6URwfSDcq240R+hI7gzxRaOQAIev
 pgyCiVVy+dU8nVT6OnY4V4IrwvYxLWUHD9mlPPm4Or4UAFeoOnqd8sH2Z w==;
X-CSE-ConnectionGUID: qAnVNTZnSwuGdaC4Xy7hHA==
X-CSE-MsgGUID: NWvrmD9bQkWCOL9bOXP0uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="31110903"
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; d="scan'208";a="31110903"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 14:15:32 -0800
X-CSE-ConnectionGUID: XnXHk0SHR2uBTa2HqP7UFQ==
X-CSE-MsgGUID: lM0rJD47QBeGE/FgA5XBXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; d="scan'208";a="85664255"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2024 14:15:26 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 7 Nov 2024 14:15:25 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 7 Nov 2024 14:15:25 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 7 Nov 2024 14:15:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nRZYvBTttLO00wfpcLVDLtCf1hqHbfAvNTH/kmvwCouiRZHYYOumt58DzboZk9TN06J9BXQ7UCA3vb8QdtSsHcTCax4ko38ZUJ+SNHDrjYH/qT8yT2nEuGSKlPQpX8fIEoSAdFZTYXYesHIIM/CpfWLfQ4a85TyWjx1FGqXnboMmJnUCuAH7KTX6Qy0W+9lXtIHc5+aHhp/ytJqJvdsiUGjTz/atJqr+whgM/6564HjaF/3RrBTtxlytrHATLuqV/QvUpOHSpdQ9BkU2D3WMW0XtjGL6BBpsU6KnhE/imyMst+TSusZEpERdO+fmRIG6ImeaZEAsAQhGkeeDqCd1GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LERAY6AwY47oUJYfY/Qj9cOInMmS513pUA9GOiThypo=;
 b=k8tL2vWOEEvuieAniDcWN+wSojwk+/8FJQ6wZB2YZSsdh+M7VO6nKi1EIO0U9DhqalEClUhrNYSkjP1zSOIZyDwFFOMLlILgNcecJR1lso5l5kU8HxQebYIr+1nU1byKlyLJIS1hVyYYb9JJJZbNJ9IVrdatqb/RvUlksTJ0RQGbusJYkLtlw7CJQqgFW6dqSuXthUGkyTxFqcHVOdHL9w2SUtKwhDPCsDaiEXBFrSqEqCmwUt2zTwokB4iKsnexgvqEHQajAEeaOlcNuaDjngV5IgXBDOBblZe1d/46XDI/cnHGj+IJJphOGfOdOEAlxmLZcDbYj6zBVmTIjUFXtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7724.namprd11.prod.outlook.com (2603:10b6:610:123::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20; Thu, 7 Nov
 2024 22:15:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8114.028; Thu, 7 Nov 2024
 22:15:19 +0000
Date: Thu, 7 Nov 2024 14:15:51 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe/guc: Prefer GT oriented asserts in submit code
Message-ID: <Zy08F1Qfc1TIovZX@lstrano-desk.jf.intel.com>
References: <20241107194741.2167-1-michal.wajdeczko@intel.com>
 <20241107194741.2167-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241107194741.2167-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW3PR06CA0017.namprd06.prod.outlook.com
 (2603:10b6:303:2a::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7724:EE_
X-MS-Office365-Filtering-Correlation-Id: 43d7da69-e656-4431-85be-08dcff79aa87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?foyLBV+UyYN2p6qHYj9FbcDWd7WjFA+EOw/B3Vbw4S/T5Qr+wHj8k/efsxPS?=
 =?us-ascii?Q?OX/OxcfJX5sl5ZVsXjKbzjZxG4B36MjK99zRKGJ4Rykiz+rBRQfCoJPIlu7S?=
 =?us-ascii?Q?bUSRSUlMEmXrT5pBwv09jBW0OU06MA1ufPrbnCZvDCSYMOHLx9oLPIXq5b+t?=
 =?us-ascii?Q?0tm/TfUxp9PkJHjtzsLUyiQNop2qeEXxr7Saehh3ZTJZ1UqgRhmoCInI/gJ/?=
 =?us-ascii?Q?n0USQ/L+LwgbV26TyPjK/H5Lgl2k3yEWDooczvWdn+gC92eFA9/NQ6QofNcK?=
 =?us-ascii?Q?x8RcZAPMChesNw4caTAGtPphgJhqPqiwyu86TyvxMKu3FfPaeUzBqcCoe68s?=
 =?us-ascii?Q?685agwZK5fwjBILsCEsr3uf408njciSvSqsoBWmkKmzUaym0XsN8y4/slAml?=
 =?us-ascii?Q?XDoE69PonL7sOHsm2JkzR6qQYDwlwXiwiBJgTTJzn2FAwMlbvPF8xBnnRPmx?=
 =?us-ascii?Q?Oaj6I+Oa4HnJs8X54AKqz6p1ReeXo+Jc+3qKkeTR4l5CnkYIkU2kgFy7G+AW?=
 =?us-ascii?Q?ivbE6atEEHEqNcXtP/Qf0dtk9VnVIBsWdva1pZ1h2w/fy29un7k1Q+oyWK+m?=
 =?us-ascii?Q?uWRJiELx4MUcO2ouVT3zipTwjbpe9wzIuMjMKxleIl84rrZh4z2p79Kjlb+Q?=
 =?us-ascii?Q?7sauuGL1YRMBU+fEQJ22Y+JqB65yZqnLxMaYCAuhbOwvpt+7vT3LxuUQM5tO?=
 =?us-ascii?Q?sGAAGsFT7BjimEukglvfDzLcaLh0cKqTjoFIzNwamTWNNcTCfRKunqVJwk1G?=
 =?us-ascii?Q?XQMU83iWfm6WgEmF+orvZtWBLGXAbUm+6s29phudOdI9niyVFwnZboqiv6xi?=
 =?us-ascii?Q?QcIi4JHcrXVbFVTiqV2I/SuMPQ2gBmJZSWv4eJX/1uJgjoccdf/peCiXY93U?=
 =?us-ascii?Q?cGQsV8Q4o97KusUoLxrhdTy8s3A23oCZZEqPg+2HxP1s3kxHNi/yiwds6YxP?=
 =?us-ascii?Q?McttEa2y7rsUNtjtFRD3L6FoskZLVSs4wVYCL04bgq+mp/1JUOc8yqv3uVne?=
 =?us-ascii?Q?vkpJdoTA/GNmdhkJAQkop2EDkbAJ27jL/OOYZ4kpU3eYHe89jR+Pr3tvonro?=
 =?us-ascii?Q?dISjqa6KIe1AuM0f23TUoSBeMlX0P9+46Eg7HI7JT9k3TP3H7XmNGZ0r6TpA?=
 =?us-ascii?Q?U0aqhn6vUh6QIVvSKGmkVy5FybWYoNj5HFRYB6prfSLdHcexFw1aAcVoyfwl?=
 =?us-ascii?Q?r2maUDkQ14bSqpebO98kXCKt6BHTtaXAcai8aTNw/9eFMkPnOnwHqRVDW6pq?=
 =?us-ascii?Q?njkgHu/FiTCIfp+0fjpd+lpmwiWq+MqwKae3v3CF/oKCodYT2AKlj6IxuXit?=
 =?us-ascii?Q?h8QV7jgOeITw4AU7MVx8XMUx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D8AMSVI/fv1VepAyETYSSVve2Ldvi7wohn1Rw1Bz8rahpTHIa5O5cduvL1ip?=
 =?us-ascii?Q?nKfo9a7XfNxmV67yodmmMmwfLzYkezzTkvfMJWqgu89AqEkd7fZB/saJG10a?=
 =?us-ascii?Q?w90kJBNzthx9Q1ZJs2FuXFUfnnWsRK/qVDiBI2oL+YzkHIHM3k3jZVviYH8d?=
 =?us-ascii?Q?tQzXFdQffIMZsuu2SiWMHdjouUe4RhEcUIPFN/WhTJSjG6JWRlsXVmKiqngm?=
 =?us-ascii?Q?lldCLgGOZfu2oIhqSbOQ5Nq8qVbIvyj/fxSqRDlOQRDuFBRmexQuFSZKFlTD?=
 =?us-ascii?Q?zLVN/Ke7S3/kXKPaWdcda9UU2LNp33bL6mFv6WyxXYyCKJsTSw2Bvtw3PtJz?=
 =?us-ascii?Q?rPJaQ3s7wUtdOpqzdmnXT8/Lkc0eOnDD723wlRuNWPq5ciFs6Epl9L7Lh5V7?=
 =?us-ascii?Q?xZzMtkecxR7c6Qa9QDqa4pqDDwV6TgNSH24CrOf5Q26CF7ktnzZ3CALg1imI?=
 =?us-ascii?Q?mEWcz1t0e2ZnOlDOwZiV96zk3BYBs+W7VlQEKEGLx4VZFiy+71v7m7cOs2wR?=
 =?us-ascii?Q?hndO7QlvxqlB73u/XDNC6DV5V98f7CYqQsFEUG4QHYekNT6Jv77ZP0R/gyjc?=
 =?us-ascii?Q?EWOtBF1Av7HZZLjQdDeiZ/eSys4nwnfuG4W0/JYvkAY1he0zRTYEBScN3va7?=
 =?us-ascii?Q?f6arVczoVCJq2DBIkx8VixLV0G4lShtbESfwjUUpidoYRlGcvMDebYv0sH7N?=
 =?us-ascii?Q?kiaQ0Ylif1AYApSHQNBr2qngI4yiUDzvUOu6n1hSK9R9bNDV/LgxTATBKOy2?=
 =?us-ascii?Q?Jwsga9gwV/vXRS3o765BCNsG6GU2TECxkTsGSrJ7HHg7+I0ZFYLr5SqG5NN+?=
 =?us-ascii?Q?xvhCergFQinSRno7ylbl7qpw/W3uPyPkSuvmDSnxqZgIka2d5wjh72YE5sxn?=
 =?us-ascii?Q?w9RI2F+kbBmd8WhjiIHhUsSzt0v7y15/gCemJbSm5q/Ru8QrLBDYsrLbzXTJ?=
 =?us-ascii?Q?6+DnGBAfl5vsZcvU+FkWYz4SqZ8KcCB/LMH1nrrljh6rZX0cLVvb/vu+UFdk?=
 =?us-ascii?Q?I6gXJ76AjmiXg92c28RVT1DiCGm5J+p4sYOgmppQWEovfRjY1BbsJPVutLxf?=
 =?us-ascii?Q?y2za0Ntw+E9DIsQgPXoBGz5kdSdaK9pHTGl/GQfBBPlA8u5lJ08fCEqmmpkD?=
 =?us-ascii?Q?WLcNxsyJjc7m1x6Rfm4krx71Y2q72Us3Rzz6P9q2h9ZUkI+RDY4+NK26unc+?=
 =?us-ascii?Q?UWFWP9ozzXnrwaz1E8trdb8RQCgQprKFnA/spKwKn7WrPKsCZijuKkXrC0Rt?=
 =?us-ascii?Q?pB27CMn5GUayUdNdbMIR8xZRq6tdxOyY8ye5C9GxB1t8kTqB5wlba7wXAYZg?=
 =?us-ascii?Q?DxOsPTY5PeXZ1ivuDbcwd4vzR49Z10owgWe62P/565l8Wd6qeMMw4CEtYhav?=
 =?us-ascii?Q?z8WqL6DvwJNZ0vEBLhw8Kq90Iz+wcLaew7h7FsjAWYSxv7HLYSeUNlnlemhB?=
 =?us-ascii?Q?dzna65F31UvY5koQbIsYo38JiXmF79Xs5jJreJmnrJfW+kAPhi2zadox+nOL?=
 =?us-ascii?Q?v7/oegPMYk8Q7DV+57CxIsFcCZTHAHlhYMltvqLtyZ6o4D3VPOL368No+q+r?=
 =?us-ascii?Q?bBMG+IxsEt68kCoOvMnGNETefZeg4ijs+u5xp5dY1SfIIpk+yBrb42iM+sYd?=
 =?us-ascii?Q?bA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 43d7da69-e656-4431-85be-08dcff79aa87
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 22:15:19.8254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U1kqvqrb0rUbIjoTtXEj5HVh9ZQEsB/Hi8YNWdTYyRW/NF10W4PqKExgD6R0sNIO/f74IWa/N6DvYf5N3QqHjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7724
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

On Thu, Nov 07, 2024 at 08:47:40PM +0100, Michal Wajdeczko wrote:
> For better diagnostics, use xe_gt_assert() instead of xe_assert().
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 52 ++++++++++++------------------
>  1 file changed, 21 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 9e0f86f3778b..0311d9e50d06 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -412,12 +412,11 @@ static const int xe_exec_queue_prio_to_guc[] = {
>  static void init_policies(struct xe_guc *guc, struct xe_exec_queue *q)
>  {
>  	struct exec_queue_policy policy;
> -	struct xe_device *xe = guc_to_xe(guc);
>  	enum xe_exec_queue_priority prio = q->sched_props.priority;
>  	u32 timeslice_us = q->sched_props.timeslice_us;
>  	u32 preempt_timeout_us = q->sched_props.preempt_timeout_us;
>  
> -	xe_assert(xe, exec_queue_registered(q));
> +	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
>  
>  	__guc_exec_queue_policy_start_klv(&policy, q->guc->id);
>  	__guc_exec_queue_policy_add_priority(&policy, xe_exec_queue_prio_to_guc[prio]);
> @@ -451,12 +450,11 @@ static void __register_mlrc_exec_queue(struct xe_guc *guc,
>  				       struct guc_ctxt_registration_info *info)
>  {
>  #define MAX_MLRC_REG_SIZE      (13 + XE_HW_ENGINE_MAX_INSTANCE * 2)
> -	struct xe_device *xe = guc_to_xe(guc);
>  	u32 action[MAX_MLRC_REG_SIZE];
>  	int len = 0;
>  	int i;
>  
> -	xe_assert(xe, xe_exec_queue_is_parallel(q));
> +	xe_gt_assert(guc_to_gt(guc), xe_exec_queue_is_parallel(q));
>  
>  	action[len++] = XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC;
>  	action[len++] = info->flags;
> @@ -479,7 +477,7 @@ static void __register_mlrc_exec_queue(struct xe_guc *guc,
>  		action[len++] = upper_32_bits(xe_lrc_descriptor(lrc));
>  	}
>  
> -	xe_assert(xe, len <= MAX_MLRC_REG_SIZE);
> +	xe_gt_assert(guc_to_gt(guc), len <= MAX_MLRC_REG_SIZE);
>  #undef MAX_MLRC_REG_SIZE
>  
>  	xe_guc_ct_send(&guc->ct, action, len, 0, 0);
> @@ -513,7 +511,7 @@ static void register_exec_queue(struct xe_exec_queue *q)
>  	struct xe_lrc *lrc = q->lrc[0];
>  	struct guc_ctxt_registration_info info;
>  
> -	xe_assert(xe, !exec_queue_registered(q));
> +	xe_gt_assert(guc_to_gt(guc), !exec_queue_registered(q));
>  
>  	memset(&info, 0, sizeof(info));
>  	info.context_idx = q->guc->id;
> @@ -603,7 +601,7 @@ static int wq_noop_append(struct xe_exec_queue *q)
>  	if (wq_wait_for_space(q, wq_space_until_wrap(q)))
>  		return -ENODEV;
>  
> -	xe_assert(xe, FIELD_FIT(WQ_LEN_MASK, len_dw));
> +	xe_gt_assert(guc_to_gt(guc), FIELD_FIT(WQ_LEN_MASK, len_dw));
>  
>  	parallel_write(xe, map, wq[q->guc->wqi_tail / sizeof(u32)],
>  		       FIELD_PREP(WQ_TYPE_MASK, WQ_TYPE_NOOP) |
> @@ -643,13 +641,13 @@ static void wq_item_append(struct xe_exec_queue *q)
>  		wqi[i++] = lrc->ring.tail / sizeof(u64);
>  	}
>  
> -	xe_assert(xe, i == wqi_size / sizeof(u32));
> +	xe_gt_assert(guc_to_gt(guc), i == wqi_size / sizeof(u32));
>  
>  	iosys_map_incr(&map, offsetof(struct guc_submit_parallel_scratch,
>  				      wq[q->guc->wqi_tail / sizeof(u32)]));
>  	xe_map_memcpy_to(xe, &map, 0, wqi, wqi_size);
>  	q->guc->wqi_tail += wqi_size;
> -	xe_assert(xe, q->guc->wqi_tail <= WQ_SIZE);
> +	xe_gt_assert(guc_to_gt(guc), q->guc->wqi_tail <= WQ_SIZE);
>  
>  	xe_device_wmb(xe);
>  
> @@ -661,7 +659,6 @@ static void wq_item_append(struct xe_exec_queue *q)
>  static void submit_exec_queue(struct xe_exec_queue *q)
>  {
>  	struct xe_guc *guc = exec_queue_to_guc(q);
> -	struct xe_device *xe = guc_to_xe(guc);
>  	struct xe_lrc *lrc = q->lrc[0];
>  	u32 action[3];
>  	u32 g2h_len = 0;
> @@ -669,7 +666,7 @@ static void submit_exec_queue(struct xe_exec_queue *q)
>  	int len = 0;
>  	bool extra_submit = false;
>  
> -	xe_assert(xe, exec_queue_registered(q));
> +	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
>  
>  	if (xe_exec_queue_is_parallel(q))
>  		wq_item_append(q);
> @@ -716,12 +713,11 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>  	struct xe_sched_job *job = to_xe_sched_job(drm_job);
>  	struct xe_exec_queue *q = job->q;
>  	struct xe_guc *guc = exec_queue_to_guc(q);
> -	struct xe_device *xe = guc_to_xe(guc);
>  	struct dma_fence *fence = NULL;
>  	bool lr = xe_exec_queue_is_lr(q);
>  
> -	xe_assert(xe, !(exec_queue_destroyed(q) || exec_queue_pending_disable(q)) ||
> -		  exec_queue_banned(q) || exec_queue_suspended(q));
> +	xe_gt_assert(guc_to_gt(guc), !(exec_queue_destroyed(q) || exec_queue_pending_disable(q)) ||
> +		     exec_queue_banned(q) || exec_queue_suspended(q));
>  
>  	trace_xe_sched_job_run(job);
>  
> @@ -867,7 +863,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>  	struct xe_gpu_scheduler *sched = &ge->sched;
>  	bool wedged;
>  
> -	xe_assert(xe, xe_exec_queue_is_lr(q));
> +	xe_gt_assert(guc_to_gt(guc), xe_exec_queue_is_lr(q));
>  	trace_xe_exec_queue_lr_cleanup(q);
>  
>  	wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
> @@ -1274,9 +1270,8 @@ static void __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg)
>  {
>  	struct xe_exec_queue *q = msg->private_data;
>  	struct xe_guc *guc = exec_queue_to_guc(q);
> -	struct xe_device *xe = guc_to_xe(guc);
>  
> -	xe_assert(xe, !(q->flags & EXEC_QUEUE_FLAG_PERMANENT));
> +	xe_gt_assert(guc_to_gt(guc), !(q->flags & EXEC_QUEUE_FLAG_PERMANENT));
>  	trace_xe_exec_queue_cleanup_entity(q);
>  
>  	if (exec_queue_registered(q))
> @@ -1312,11 +1307,10 @@ static void __suspend_fence_signal(struct xe_exec_queue *q)
>  static void suspend_fence_signal(struct xe_exec_queue *q)
>  {
>  	struct xe_guc *guc = exec_queue_to_guc(q);
> -	struct xe_device *xe = guc_to_xe(guc);
>  
> -	xe_assert(xe, exec_queue_suspended(q) || exec_queue_killed(q) ||
> -		  xe_guc_read_stopped(guc));
> -	xe_assert(xe, q->guc->suspend_pending);
> +	xe_gt_assert(guc_to_gt(guc), exec_queue_suspended(q) || exec_queue_killed(q) ||
> +		     xe_guc_read_stopped(guc));
> +	xe_gt_assert(guc_to_gt(guc), q->guc->suspend_pending);
>  
>  	__suspend_fence_signal(q);
>  }
> @@ -1412,12 +1406,11 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  {
>  	struct xe_gpu_scheduler *sched;
>  	struct xe_guc *guc = exec_queue_to_guc(q);
> -	struct xe_device *xe = guc_to_xe(guc);
>  	struct xe_guc_exec_queue *ge;
>  	long timeout;
>  	int err, i;
>  
> -	xe_assert(xe, xe_device_uc_enabled(guc_to_xe(guc)));
> +	xe_gt_assert(guc_to_gt(guc), xe_device_uc_enabled(guc_to_xe(guc)));
>  
>  	ge = kzalloc(sizeof(*ge), GFP_KERNEL);
>  	if (!ge)
> @@ -1630,9 +1623,8 @@ static void guc_exec_queue_resume(struct xe_exec_queue *q)
>  	struct xe_gpu_scheduler *sched = &q->guc->sched;
>  	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_RESUME;
>  	struct xe_guc *guc = exec_queue_to_guc(q);
> -	struct xe_device *xe = guc_to_xe(guc);
>  
> -	xe_assert(xe, !q->guc->suspend_pending);
> +	xe_gt_assert(guc_to_gt(guc), !q->guc->suspend_pending);
>  
>  	xe_sched_msg_lock(sched);
>  	guc_exec_queue_try_add_msg(q, msg, RESUME);
> @@ -1744,9 +1736,8 @@ void xe_guc_submit_stop(struct xe_guc *guc)
>  {
>  	struct xe_exec_queue *q;
>  	unsigned long index;
> -	struct xe_device *xe = guc_to_xe(guc);
>  
> -	xe_assert(xe, xe_guc_read_stopped(guc) == 1);
> +	xe_gt_assert(guc_to_gt(guc), xe_guc_read_stopped(guc) == 1);
>  
>  	mutex_lock(&guc->submission_state.lock);
>  
> @@ -1788,9 +1779,8 @@ int xe_guc_submit_start(struct xe_guc *guc)
>  {
>  	struct xe_exec_queue *q;
>  	unsigned long index;
> -	struct xe_device *xe = guc_to_xe(guc);
>  
> -	xe_assert(xe, xe_guc_read_stopped(guc) == 1);
> +	xe_gt_assert(guc_to_gt(guc), xe_guc_read_stopped(guc) == 1);
>  
>  	mutex_lock(&guc->submission_state.lock);
>  	atomic_dec(&guc->submission_state.stopped);
> @@ -1825,8 +1815,8 @@ g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
>  		return NULL;
>  	}
>  
> -	xe_assert(xe, guc_id >= q->guc->id);
> -	xe_assert(xe, guc_id < (q->guc->id + q->width));
> +	xe_gt_assert(guc_to_gt(guc), guc_id >= q->guc->id);
> +	xe_gt_assert(guc_to_gt(guc), guc_id < (q->guc->id + q->width));
>  
>  	return q;
>  }
> -- 
> 2.43.0
> 
