Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B8DBC55196
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 19:20:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA75810E786;
	Mon,  3 Aug 2026 19:20:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ng7O0tGV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D4C010E783
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Aug 2026 19:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785784823; x=1817320823;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aV8ITp02NJBl6jezwKbigqIOuYH+IO27tyMgxbtAfl8=;
 b=ng7O0tGV+uKLzgJjmLJX5Onu45kOuuoXYLFCAD51lMVmYo6j3yCfr6AO
 70ziGvv86ykKUKXZLV37Dkzry8wJVdZo+bZM+IxP7ztwuzSlKIr3MK11L
 agvPGg/F2hv2MIrM+brG05yTKSCP0a1mSTmfVtQqMjVEbDAO4nByvn/JN
 FTrtu159QxjbOTiotUqolOxJOc3eawsXxjnUyq3sJ2gZC7l/N2+VQP9ki
 hPNras87r3N8Xvq1DwKY7PFsDr+p/XKBtMdf3E54S9QLw/z9ZRdBljR+9
 /w3xpP8/B/ttCCg5hzrW5JLL8DLCCZ0HXGyLFAU4FLK0wRd2uUNWeFOyx A==;
X-CSE-ConnectionGUID: VR4MYXr2QJGITwOgQVu06w==
X-CSE-MsgGUID: ZD1nHboAQJu7j1UnLkncwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86451353"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="86451353"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 12:20:23 -0700
X-CSE-ConnectionGUID: 9UICpNtWTYiJEoeDyZR6VA==
X-CSE-MsgGUID: rXmNX59HTjes9C8CJFuYZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="258637743"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 12:20:23 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 12:20:22 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 3 Aug 2026 12:20:22 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.17) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 12:20:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SLZcGYRpedKg7xDj/McHK1xNeYKoHd+9eeUCd8gPI8uD9pi89JgbkKNZp9Q8ttL0lfLFvm6KapIn8kXVsyIydcxFL+fQlmnD1vcFFTYr43Ixj2B3kz+nr4zlkM2ZybI8S9GTWd8E+8iUZKj2hGHNj2CQXVty3wmnIYCzNU0BZSwnP4GfmYPYeCe+2qnV2ZAjjRWpNApAy/y++4C0Lwb+TCsLqCOnnixG2PeuH+n6zZ5yco9VCDca/tuwug2ljUosQWJTKDrxL/o3CiG5hzGwEtDbU9KSHixTPf28XFL+vMYU2zTioaAP2bC2edHr4bHp9nVTCx/s4W4Pis92/XLQow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Stg2mZmZIHLv5umpeNc8NBTu4FXyLYwDOGksz6cP7M=;
 b=yUsJrEq7FrsBhZtUrtMFv9ca2fGI4fTeF/cSD+XiHl998zQhdc5GIx5fQNtJpS7kOoyWMpSCbfe4Ot8uOlb9pKIPc8QXenodTmuYMnc5abjm8ZnqeTndREtQawtzIRGpyP/3ZCG8IbrNCfUWnr9t428HzA+gEAp5hFdyvg2J+PVXExqq+ltkOjpwmeJEdGqOXkXK5jmHlsWHUX68whui1/O08AfI3yfm2NPktvuT0GWrqaHviNiaVOA85hEbb18Wq5672t02ZfiPVPgL8u9ZptX9Szii70sdyLwadtR7WLY/Km8UBpUNKwSmsLz4tF1pfum+q61uBWFcGYT5kgRo+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5125.namprd11.prod.outlook.com (2603:10b6:510:3e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 19:20:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 19:20:19 +0000
Date: Mon, 3 Aug 2026 12:20:17 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 4/4] drm/xe/multi_queue: replay dynamic CGP updates
 lost during VF migration
Message-ID: <anDp8bCCV4S0qAMy@gsse-cloud1.jf.intel.com>
References: <20260731232625.3313657-6-niranjana.vishwanathapura@intel.com>
 <20260731232625.3313657-10-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260731232625.3313657-10-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ2P220CA0005.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5da::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5125:EE_
X-MS-Office365-Filtering-Correlation-Id: 93cd6824-d4dc-4eee-fc0d-08def19441fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: xoWeEcqLzsFslWqNnetXxq8Uypey9jrhTeJRFFsoscxQNfo/yZl9YzUx70kJ6wwRvFM1H78wiopVeUXSWfRDloSxftA4F0Bty7oCvFojr+w2/zCyC9hh0IaAG5R3A0bC0pptJivTEv/nqdww93msOgpdR4WeX3jgnE16HMNMt9bCeo/X+cpHmGJLn0mPcLB9f8YiFjcKmmBoyHRveRaCo5zQ71kRIzrN3jkK3fgaj0Rl8QdzGXkHXrw4BqK/frAjM3PuGlrI0wMe35ZFVZcBUbOXmRjVTUHFzCrUvAOpZK0mRN5rRKYvi/W1zIgPJXlr8N1ZxfqeF0GT4wKkNndZwOjajb5bzlu1eYlm7IZ+7ifFCCTpphxyYAo0iqI880v67rbijsW849V/gf8WbRntGUOTO+YChQA/eEIGl6jZzpRZ8t+hK+xKQwWU15tMACRbWZU8FfmA3EBEzjDSr5KNM6O0TTdxGA9M/MGkiGyFE0eqS5Z6cOl9babC85zRpdraiaHE6NjXpGtQpYwtA2jtwgBIM6AHpbfF2x/LgVq+ecetjiVYFRj0zqsRRrZl4b6emWWQM/rbP6OE1ZOCp5EwKLlqIBSKWwVPBhSi4KbtlH86f9qXAkJRUk/A62FI1uGbjkHIvt8Chg1mhhiR2IQvCFikIiwaKH+Ftuc1LdDkVyU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bX19XL4crU66Ooq4UlRaXSGHuZ0Ory6uJXHP9+bIR/B0VBiebeHGLjgsRKbc?=
 =?us-ascii?Q?cBmM34zA2Cpe7GeLv6E/OncCUOixeBenLGXCp9k+qYYoH2s2Tn92X0AUkPXY?=
 =?us-ascii?Q?Jky2lZJdGIziv5/67qrZDnFbYtZq1fU3/ZtAaXw91PXWNHzX18LtEShYnKFQ?=
 =?us-ascii?Q?S7xxtcaMaEmyOg2SEfRu/1QUUb4thbeQtj5aMQbg9RB2NNrUq/bCQhgpbzYs?=
 =?us-ascii?Q?54N8JPNNV+z5L3LWS5PWSoR+vkJ5Jj/ItFQWWFEBhdOm+GmoQEZnqykhF0lj?=
 =?us-ascii?Q?eompSB3VsHAjoTu4U8TiiYYOWrysop0/3OHaXlHpcutHGsMPP2o99oEv731/?=
 =?us-ascii?Q?lmB+7LMx6/yX3mt0aMHNkdPKtMIqlT01HYgytH+pGdw5WAV7sRRYbOLJHY4g?=
 =?us-ascii?Q?4xyjuNXvZyg59sKvfqKUF4f9s11HDyR5NUMcvfaP1TLkEgh/ViK3A2Yb+9uq?=
 =?us-ascii?Q?D57dfTQh6D7A1BwRrqQ2TwOdkfokfSB0h0qmuUU6SEzc8F9Uv0FKM4Utt0gy?=
 =?us-ascii?Q?nz5Z9H/NnOpO/03Qgwp5qG1MGVW+ny/argQWHoqXY1thsMS6YiiEL6+pQ4zr?=
 =?us-ascii?Q?6d+Ieqo11XoBNDlctrIaSjQPyzXaT8GxazEtLKoY1RhU+1Sku/3Yajqe3+KW?=
 =?us-ascii?Q?G4YJfakkQh6VhZK3p3q8X+wYBl1N/EYG/24AJ8SGu6XBEhBfF39OaK0YqCo2?=
 =?us-ascii?Q?fqKpMxf8u7A4luj020hzhjH0eKNamfWcg70k0I0egjy2JZhBzsK2Lz4/arLn?=
 =?us-ascii?Q?JBBS/UcD+l2VSL/f49E+2+0+G50PROmz4eWQuNQywR+iUXWE6+zsdANgnV/f?=
 =?us-ascii?Q?Jx2p8rffqicEdtojteyZadPokd4tv8aMHaXn/w8CHaw/nqiNPtJhMbCD6dKO?=
 =?us-ascii?Q?guw0PDuTxR+CXmmIORdtKfvZhvQ3vzAKHHHVmaUCk9pmnEmG6JBj/WFItfMU?=
 =?us-ascii?Q?yJ5GD7t8xpaQE3aV2kdKZ10BVkN7NhM2KidmubUkxQ9qmW3/sKbW2OrFkUzm?=
 =?us-ascii?Q?CapSVffaQfSp9GC3VfrIvpgSzlbRunOyFk2TNnBJCO5vahB02H9xIf9oXbO7?=
 =?us-ascii?Q?F86MpRsR1zltNXXan3+QAO1qx7YX2qyWO8+xKqvtEj3DRx4Y8sXJntFfZspo?=
 =?us-ascii?Q?u3+SrnoKr3FKl7AaBnv6TQqTlh04MMziyt/AORtHWcmLoqlI/pkEWbAPNYjr?=
 =?us-ascii?Q?Ko4T/hbD3UumJQy3IjJdSpqGJtzknjZIY5/6vg1gqMPgXLdFh2MMW6bpn1nF?=
 =?us-ascii?Q?xqeZQxL4Fhzh20u2n/w4YDo7qLaM1C5wQZfU+OUJvDfp7o3LOiEZF6cCpLyq?=
 =?us-ascii?Q?AK9qbhgABGQirqj+RKsXeLrgdGiNR5q9Adv81pr5+Ju/XpR7wx6ncM4T1gY7?=
 =?us-ascii?Q?Nl0rfPhgwJR26vyMglPVZuU27BqpzYKBCn8F8pIC853EVvdblJnVJISfnZyp?=
 =?us-ascii?Q?LoTZEB+D5gq8eob+Ud/S15iIX/0mr3SJ9WbTaOD8f5LRxe+Qx9f0YU4eHN/D?=
 =?us-ascii?Q?3RCW4dkjiBJNDB98IHy3Quzvr9ZthT5fI/g+HVFbQ1yvl6f4RcveZjXPXaoK?=
 =?us-ascii?Q?vjcb9d3qhz7hBSrhILgk/fm9Ik13Gc79siQRl0VSi93F7VPWdy88ozKDOoO0?=
 =?us-ascii?Q?LCvTJ3miUVBrOXZgbg9QYPsiBr34oDcHHV6eHILlJjF1fgdjRDdSJxa72zCh?=
 =?us-ascii?Q?AltgB4AzOR9uXhM/aeyTeiExRRjvZK08H0qJeuZZtuKl+gWiYRF+n0LpaHC2?=
 =?us-ascii?Q?sxW3vj84/KeYsQcMVE46lU3YrKph/aQ=3D?=
X-Exchange-RoutingPolicyChecked: C8peoFpnbYfB6v2DpGelGb+TsvI1XN6/pKNfJBCuwCljQO9Rp6l6uOGdIkt3HeL9pci9Y+kRIG3wwnXlGRGLzdUOaNP/zVD896VTFq5B/IH5GzFPEJjPlLvnfCaspB2zd/HPrSE4Gvnazj7QrmMxkT6eVydp1EvVP+6Yd4HIh2IwFozoB5duiKXJsAtAD78HPaaWNitSYjeHsXS2fYa6WQTfWTbljVBnie3gbD0ogEDdzdOkBIN8OirA9rOao4GfqpA3DpFAcf+UEy3Oaj9zjCpoV+/ZtNBSKYTfyOoPiPLY8TydEL0/tgzyKEdgfKe9utPOBpzzGDMTnCn8bCaOpg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 93cd6824-d4dc-4eee-fc0d-08def19441fc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 19:20:19.9125 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oDsJla2gLf5xdnWIJeyfqXZFFD0jgBx5ESs8y6f2p/uhvfRDnZCKUusHLK+5FzDLrovzfDj/OjdUfGMa/ARKYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5125
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

On Fri, Jul 31, 2026 at 04:26:27PM -0700, Niranjana Vishwanathapura wrote:
> When guc_exec_queue_revert_pending_state_change() sets needs_cgp_sync for
> a queue, replay that update during unpause by injecting a CGP_SYNC_MSG
> static message at the head of the scheduler queue.
> 
> The message handler __guc_exec_queue_process_msg_cgp_sync() calls
> guc_exec_queue_send_cgp_sync() which re-reads the current priority from
> q->multi_queue.priority and re-issues the CGP write + CGP_SYNC H2G, so
> the queue's CGP entry is restored to the correct value after migration.
> 
> Assisted-by: Github-Copilot:Claude-opus-4.8
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  2 +-
>  drivers/gpu/drm/xe/xe_guc_submit.c           | 28 ++++++++++++++++++++
>  2 files changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> index 573b920edb41..d27826b36649 100644
> --- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> @@ -36,7 +36,7 @@ struct xe_guc_exec_queue {
>  	 * a message needs to sent through the GPU scheduler but memory
>  	 * allocations are not allowed.
>  	 */
> -#define MAX_STATIC_MSG_TYPE	3
> +#define MAX_STATIC_MSG_TYPE	4
>  	struct xe_sched_msg static_msgs[MAX_STATIC_MSG_TYPE];
>  	/** @destroy_async: do final destroy async from this worker */
>  	struct work_struct destroy_async;
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index c018bc0d8d6f..9036f89dff7d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1960,11 +1960,25 @@ static void __guc_exec_queue_process_msg_set_multi_queue_priority(struct xe_sche
>  	kfree(msg);
>  }
>  
> +static void __guc_exec_queue_process_msg_cgp_sync(struct xe_sched_msg *msg)
> +{
> +	struct xe_exec_queue *q = msg->private_data;
> +
> +	/*
> +	 * Replay a dynamic CGP update lost across VF migration by re-issuing the
> +	 * CGP update + CGP_SYNC (re-applies the current priority from
> +	 * q->multi_queue.priority).
> +	 */
> +	if (guc_exec_queue_allowed_to_change_state(q))
> +		guc_exec_queue_send_cgp_sync(q, 0);
> +}
> +
>  #define CLEANUP				1	/* Non-zero values to catch uninitialized msg */
>  #define SET_SCHED_PROPS			2
>  #define SUSPEND				3
>  #define RESUME				4
>  #define SET_MULTI_QUEUE_PRIORITY	5
> +#define CGP_SYNC_MSG			6
>  #define OPCODE_MASK	0xf
>  #define MSG_LOCKED	BIT(8)
>  #define MSG_HEAD	BIT(9)
> @@ -1991,6 +2005,9 @@ static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
>  	case SET_MULTI_QUEUE_PRIORITY:
>  		__guc_exec_queue_process_msg_set_multi_queue_priority(msg);
>  		break;
> +	case CGP_SYNC_MSG:
> +		__guc_exec_queue_process_msg_cgp_sync(msg);
> +		break;
>  	default:
>  		XE_WARN_ON("Unknown message type");
>  	}
> @@ -2160,6 +2177,7 @@ static bool guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
>  #define STATIC_MSG_CLEANUP	0
>  #define STATIC_MSG_SUSPEND	1
>  #define STATIC_MSG_RESUME	2
> +#define STATIC_MSG_CGP_SYNC	3
>  static void guc_exec_queue_destroy(struct xe_exec_queue *q)
>  {
>  	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
> @@ -3024,6 +3042,16 @@ static void guc_exec_queue_replay_pending_state_change(struct xe_exec_queue *q)
>  	struct xe_gpu_scheduler *sched = &q->guc->sched;
>  	struct xe_sched_msg *msg;
>  
> +	if (q->guc->multi_queue.needs_cgp_sync) {
> +		msg = q->guc->static_msgs + STATIC_MSG_CGP_SYNC;
> +
> +		xe_sched_msg_lock(sched);
> +		guc_exec_queue_try_add_msg_head(q, msg, CGP_SYNC_MSG);
> +		xe_sched_msg_unlock(sched);
> +
> +		q->guc->multi_queue.needs_cgp_sync = false;
> +	}
> +
>  	if (q->guc->needs_cleanup) {
>  		msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
>  
> -- 
> 2.43.0
> 
