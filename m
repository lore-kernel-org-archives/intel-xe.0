Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159EFCCD185
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 21:49:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB52210E16D;
	Wed, 15 Oct 2025 21:49:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BV9Q3TX9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D85E510E8FD
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 21:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760564958; x=1792100958;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UaeI43br2h4erpj13tkBP3gHulkMAfxneQnkn1A4UT4=;
 b=BV9Q3TX9RMy2HyY/yMt27HhSOxOihJ+V6lSuToSKCR4WAwopNibBdOT2
 AMcsu9Bxgi9W20wQezD01ZN8ksCOHHONm4/qCfs6HusVmgv9p86kEK6O1
 9c9HrbpUR1fmkDoaXIUr2msp13baAWcCoaOdjrk2qJ0JNXckhTdoVz/Z9
 nayjjWTs0U++MqJkSTKdZYeHWLGiRu7EM3hWtv5QmqbTIe+pArVkrxSwU
 QN3GU2M+alk9cXFPHhwYeDTlpzU7Lo0RvNdbMLMLoBA+EZZnC7VVS7RwA
 7b1WdHGfh3kNFAyeIqifFO7cD8qkCpwFRcWgObkzq/Cijf5aYvxtV2wr+ Q==;
X-CSE-ConnectionGUID: o2Mn9au9TsydePRR61k0Kg==
X-CSE-MsgGUID: mtjo4S5kTfCWd+rqEHFjTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="73028993"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="73028993"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 14:49:18 -0700
X-CSE-ConnectionGUID: c25FyiZHSOO10IsROkgkmA==
X-CSE-MsgGUID: tqEpiV+GQTq23hqaInJzzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="182073484"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 14:49:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 14:49:17 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 14:49:17 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.1) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 14:49:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WNeIZuTxoH1zS6jNz4MBnI93cmmwJjU1+3VSLDOY2gv0BK9h5qgwHFdMJxaB51xDTWQQWbqjTl4aqX49F9XtI1qb1W8ZDz5n2pjWFQ+sI8mb6tbVN8WsV9M32SyUvYnAV92Pi2Hivya1fzj3ixINJNW20gHeosfj0R2+BSA04E3h83UN6BjzdWP4Gv/G80rT+suAJ11Gl855pgTSL1RyDzISfBUnjnyx5HQzZ3Jd88VApsJ7FLwCjNvFqTNtky/PvKAAePlucZyaDFAsn7GqC8azgKJRZackxE1hAB11pipsaXgF2emFKYL7LiyU/YYK46ZyYBpIimdGU78DRqTWrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ykk7blGOSX7yaP6zZj2sgH2AYPbgmZy+XWgkrCgMuQk=;
 b=GYYIEjMZYaWdhJX3ZTkaER7fyaK+c+0MkMpDGiF6Hr4o4nZVLBCqy72OxkA7XnmZNy9EdOzC6S4Any3YqZoEmfZh0JoS1FQkclESFfMwHnlUMM575XvHFQBxnulBzKRdCTiG+QCgvhVOFykBnu3k6ATiveIxWOFQ8SCxsAs5yXUutqEyeU+ic3UTLpq5ukNXWG2smdGbgeLi+sBiZMi0qPW3J1TIY2tKVLebRZBKDa7lRMarPFrkkrpIPBfL8vMtuCAauBhjJXD0WDDP5YPVDCKwglNIqzCEP5RZF8eLnPlaW0TY5b4WpYnBfdbEgADsRU6Cm1CIwsIi09VAHEprbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB4998.namprd11.prod.outlook.com (2603:10b6:510:32::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 21:49:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 21:49:14 +0000
Date: Wed, 15 Oct 2025 14:49:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v7 03/12] drm/xe: Add xe_ggtt_node_addr() to avoid
 dereferencing xe_ggtt_node
Message-ID: <aPAW2H5JAyOFXl69@lstrano-desk.jf.intel.com>
References: <20251015074708.1654014-14-dev@lankhorst.se>
 <20251015074708.1654014-17-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251015074708.1654014-17-dev@lankhorst.se>
X-ClientProxiedBy: MW4PR04CA0064.namprd04.prod.outlook.com
 (2603:10b6:303:6b::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB4998:EE_
X-MS-Office365-Filtering-Correlation-Id: 466be6e0-e38c-4950-8656-08de0c34af0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3KBXEqai7YGyz/ZwBJa/ty6GUOpl81BiHx0oaY4X9mRJP5STCkWOza2h+r+s?=
 =?us-ascii?Q?3+ea5xbS5wxLroUkeZ1ppBSRWM3ewp+j4zLzu5XNLUDxDe6oL66Es7Gj/3sT?=
 =?us-ascii?Q?YQRovNa+XX8RClApsipvts2uiLGbJ9k1xGloPiGQngi60Q6JaRP2D0buDEoK?=
 =?us-ascii?Q?/hq2S6kM8YfgT/kSjucvnhu8y+i+qU3cZDurdKyFVVaeNfU/UFV2fbQtzn/j?=
 =?us-ascii?Q?28F9Xxfg9rRcXj2hhiQK/xApujSoGdxo0PlRq1yZqjTGvl82eIkT5m7yMLUV?=
 =?us-ascii?Q?HTWoYkU/zrPRNM4yuvwi70Q+rDrjeOUa9ESWLR9s3wWNv3AF3REDbnFXeVFS?=
 =?us-ascii?Q?BKvzkZxZHgFr0/MsZUmixUsrMxNw6cPiPBN4Dco2fejaXaWQBcK5g61RM7s6?=
 =?us-ascii?Q?adwkjnr40lJB3JvuLicnpZQ6bvo6ZMffo6UD5V7vxluNPQ8luXY7sgVXYjZG?=
 =?us-ascii?Q?CABuG6E1F8876P/CuFtVZZHQmw498Br4BMWXG4a8Ylbuy/c5Dv7hbutQ5bRW?=
 =?us-ascii?Q?hzPlClbgdMcg0mwzxlcBwzTpX/h21kUd01y4AzxVOhSquuk717cYUQuM/a8y?=
 =?us-ascii?Q?d6pDjMuSE9OYEtuv7ORCBPk1V2dHUvjGqw2bsN3BtOoNKdaYbOGjuHjeehyr?=
 =?us-ascii?Q?uQ9bzQJifYiyzLtVsufeNhfyiLv6HDHTrmfiISxtmlJ8GFwipAlXOMY871k7?=
 =?us-ascii?Q?CknHIkSS+b5/iHmJ6KFbZueSx2+WAAOtqomRHtmi8f9EHmuiM4B6ajcs+1h/?=
 =?us-ascii?Q?1J6IGd8vWpNNrZRtZDtAq2qa7c/8y8/mvAVUteWTE7ZW7AhLlBfY2i1z8mWJ?=
 =?us-ascii?Q?jN08/hmnViWnTkk2SXCs1di9WZnVYpuCSTKEHW08llQZ2aDjmvC8Lmb5vefE?=
 =?us-ascii?Q?nenzA7d+Os345T/GQSDX+sSvRoztXW1lkQC6bVJVGoqZUFZFh77WA2wBK3ne?=
 =?us-ascii?Q?GsKT7We0qsOxPw4gR7ERoirKNZKoGDMy00vQ3PbDDMB/37Xej7Mz0cMVOcmN?=
 =?us-ascii?Q?fCsejVIlmJvb/0zAf96tY1m8DHtg6qA8PX9af/23mu5I6zO5Wazuj3TuOWQ8?=
 =?us-ascii?Q?9Abnm8pm54K0VIIjBA27weNA4LTk+1g05I+kAa6iRqkDi5EqoWcRCMHVOLZe?=
 =?us-ascii?Q?BOyFChCBfIX9C6epHtWMeZShvhkiQ1RzWLZvAfo6b/qhxNwVibNvZRJzIvat?=
 =?us-ascii?Q?OgKT/fsmWGJOky64QYb/EEiKXR+p+7ZD8Ivr8FwJQ8JajqKvzWC/kBMMfMe3?=
 =?us-ascii?Q?Z2GehMNQP7Jd9hiiIsFILdzpRQfCHYkTFR1jhcli+qeXbwLeymrKVLsg3IpD?=
 =?us-ascii?Q?Lc7GDTt6pXWU4oltHr1/y5pGmOAe8iyV8Sn7vmd96f2I6qHgacpG1KVhAUC8?=
 =?us-ascii?Q?w16OzISS5OAJOdOK/FwDlY4ps3RHzMynJE3vu22k03Ju5OTz+tRgPcxPEtM/?=
 =?us-ascii?Q?EbiArAM/NErnJRzS3MoaqcZdQqI7LuJy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6J33AaLktug9OPz27IOJajRwglxaIhBhdABhXmSNqd5sFvzGZAY/UDqK/lpJ?=
 =?us-ascii?Q?SeFlO+F1pngSQ2DXzAhEbjcu9aey+TWkkPcGbXUZPdgTjsuox48aJE+utNO9?=
 =?us-ascii?Q?ZfS11BJAIB5O3RErZIbcyT5PO4sUFOAGK5aSgexM1dO5apwcFxuhDTFCkofx?=
 =?us-ascii?Q?6qEYWty5tBuiMtO0FF2+ITSf4lqS0qD1UAp/xNVemqvjggiRsyUCF4EI7tIa?=
 =?us-ascii?Q?p2XOa3CQcj2+uJCq3J4jAYyCrvAwnEhe+gHUaJrgPPs/s52fXz2q+EoTr2zX?=
 =?us-ascii?Q?ljagiwmpKo2XZtOL/t3tNWAiQORClhoylZTnyNlzozTvvyjssyOzGUndIpzy?=
 =?us-ascii?Q?+K3KWxTcB8c35XWzQ2Eqk5r/hvKYhYxm0O28KihhpMr6JkuToSaeqqdHpvbc?=
 =?us-ascii?Q?gGLEMkOeOQhHXZGWjA07YFOnK0w98VePtS3mHzluSz0FgLk8BIIrfEePrs+D?=
 =?us-ascii?Q?RCkmFGprfW/70HfOGt+LsXIe7AKVB2xZw7AzrMROLIaiJ+NPF7zXkE2bgXsQ?=
 =?us-ascii?Q?TmdD1AHTuLCPWBDHNnkdgUwbERNKr5Vhab7Qf1SnydkhYN0uofoxGJ6LiB53?=
 =?us-ascii?Q?odZoSGPqjZ7TMv77ciwaGzLWHj825I/K76nVdcX+OmS9RbdJ8+B8asIlCdad?=
 =?us-ascii?Q?ZuhJHSdEXXvz4gOpnB40OY+H0dF+XZ/tCTd2JkKNAal5ytDNxhy4Ive96o7i?=
 =?us-ascii?Q?gOXuuIBTceT3ZIzhmE5K2o52H77d+JdegkCAKaioU8qjDmpm8jhT5/KytqZq?=
 =?us-ascii?Q?+wwiCdpfnORpuurBZNsczOkmVeni2552+aLiqzu+KK0/vWMl4ojY9275hps2?=
 =?us-ascii?Q?0R1o0y33y5HEax/je86bwLB49V6dRNSwhp5WqWowd7boHFl7gfnaTlesQswH?=
 =?us-ascii?Q?ebEj4RjtlXd1X+N7oMuaPFlvQhHWC8TuQPbwzrb+SFYKNx7+67bANzWITDB8?=
 =?us-ascii?Q?Xv7mOkwdl/HPloLWANAibmI23fm0K//ZVyhqOVfifNhVzgPpfwbRyQFXvth1?=
 =?us-ascii?Q?CJPFc3j6E1ghe6xAOwala+KlGrUY56O668zArf/4JTii4YxBoupcnEH7o0lk?=
 =?us-ascii?Q?uZ8+U+4IGyR9JW2BpiOli+TFpUg4vojKyJ5j/6io7LmLjhl8IIVXhRuNZEXS?=
 =?us-ascii?Q?+sAGqxsUkbmoSqfAJOwOABjFzYBp6bu4U9fKCSJ7cRc9dX1UVNzhibtpfo8+?=
 =?us-ascii?Q?7w3R5m7+hMgO3t06GLedbVAAcqOA31iINU6p68q6+Uv9CDmnw1+NVqEKM+0L?=
 =?us-ascii?Q?fBChVTBdz4ngkoTF+QN1s85u2GrV/UV40fRVkLOebgM++H5jYT8RHSJIA9hr?=
 =?us-ascii?Q?dlhH01sghOQrwOg5jo1UivYx2LtSMg0dTxjIraCmuBfEZdFPk7TMGV+ae4ph?=
 =?us-ascii?Q?iRRqeRThWEZOo3GvGkpDxbBD8PuK1r+pwI7g1xxzW/dK5g8M9MZnIxb49qKy?=
 =?us-ascii?Q?+ZXHN6A4DrrOJ/IFDe2YyzTZTDDkw0UirqIsFtHlevwPi83N9LZ4uGc03fIM?=
 =?us-ascii?Q?D5QE5wtzbvyw6n6R1+aA7mjK/SkU5fOLABCisyHe90zMhemtzeC+R4Utzb+m?=
 =?us-ascii?Q?anVcQ0YWy2WOaXyJR/2dWrEC7Rm3g0wzs/qcc5VgLhRopmlZ1AK1rbYKjKNx?=
 =?us-ascii?Q?gA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 466be6e0-e38c-4950-8656-08de0c34af0d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 21:49:14.8957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fQe/SIq+L6IU6xVTw+W7C6bAnFJk+zQOJl32D7NTnZfhFD/2b3DBH3p7xYPPk6AzD57VxpC0KuKLp3+2nnKyaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4998
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

On Wed, Oct 15, 2025 at 09:47:12AM +0200, Maarten Lankhorst wrote:
> This function makes it possible to add an offset that is applied to
> all xe_ggtt_node's, and hides the internals from all its users.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/xe_bo.h   |  8 +++++---
>  drivers/gpu/drm/xe/xe_ggtt.c | 11 +++++++++++
>  drivers/gpu/drm/xe/xe_ggtt.h |  2 ++
>  3 files changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 353d607d301da..dd67a6f40a16d 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -9,6 +9,7 @@
>  #include <drm/ttm/ttm_tt.h>
>  
>  #include "xe_bo_types.h"
> +#include "xe_ggtt.h"
>  #include "xe_macros.h"
>  #include "xe_validation.h"
>  #include "xe_vm_types.h"
> @@ -251,13 +252,14 @@ static inline u32
>  __xe_bo_ggtt_addr(struct xe_bo *bo, u8 tile_id)
>  {
>  	struct xe_ggtt_node *ggtt_node = bo->ggtt_node[tile_id];
> +	u64 offset;
>  
>  	if (XE_WARN_ON(!ggtt_node))
>  		return 0;
>  
> -	XE_WARN_ON(ggtt_node->base.size > xe_bo_size(bo));

Is there any reason this warning was dropped? It's not immediately
obvious to me why it would be.

Matt

> -	XE_WARN_ON(ggtt_node->base.start + ggtt_node->base.size > (1ull << 32));
> -	return ggtt_node->base.start;
> +	offset = xe_ggtt_node_addr(ggtt_node);
> +	XE_WARN_ON(offset + xe_bo_size(bo) > (1ull << 32));
> +	return offset;
>  }
>  
>  static inline u32
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 42e3caa3a6d9c..05515037e2d6a 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -1079,3 +1079,14 @@ u64 xe_ggtt_read_pte(struct xe_ggtt *ggtt, u64 offset)
>  {
>  	return ioread64(ggtt->gsm + (offset / XE_PAGE_SIZE));
>  }
> +
> +/**
> + * xe_ggtt_node_addr - Get @node offset in GGTT.
> + * @node: &xe_ggtt_node
> + *
> + * Get the GGTT offset for allocated node.
> + */
> +u64 xe_ggtt_node_addr(const struct xe_ggtt_node *node)
> +{
> +	return node->base.start;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index d54a2ae2b4aa8..4a8ef1b824156 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -58,4 +58,6 @@ void xe_ggtt_might_lock(struct xe_ggtt *ggtt);
>  u64 xe_ggtt_encode_pte_flags(struct xe_ggtt *ggtt, struct xe_bo *bo, u16 pat_index);
>  u64 xe_ggtt_read_pte(struct xe_ggtt *ggtt, u64 offset);
>  
> +u64 xe_ggtt_node_addr(const struct xe_ggtt_node *node);
> +
>  #endif
> -- 
> 2.51.0
> 
