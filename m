Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C266C3DA7F
	for <intel-xe@archiver.kernel.org>; Sat, 10 Aug 2024 04:39:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 117D810E111;
	Sat, 10 Aug 2024 04:39:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RfhWzqPY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D2AD10E111
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Aug 2024 04:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723264756; x=1754800756;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WCeSRjYRVpfPwYKOvQGnwYmmEBwdBKbFLE+AagOq5Bw=;
 b=RfhWzqPYx5n/KiVNJXTBMriSDxYIeWef5ZJLf9TGoNrlnL9PeD6/0gdI
 I/H5NLg7LysNBJWW+y7I7cx7zvbTqxTZwjsL9EN/zP2hUgeH3M3r4S8vg
 a25fe8YVxE4YTirdD3n83JymAEiGNSsyeupIbE9aw/lwkJ9c3AEJTMyPh
 +Cqi10hCkEY0d7OEnrE5j0o5N/AYnp5TN0pmlV48FWLD+dNnDcnT/ff/5
 XFbEbA8Ag6YpaB942fps02hqHf1D9VmALO3QN8yZcVMLpLcXW8gc+EBzm
 nZag+B/3rx+bzJWv2LzzeHy/DwZfeUs25rnodH0yt9sRP3s3kxonIElaR Q==;
X-CSE-ConnectionGUID: hIOGlALPQKaZYaZku0qwEg==
X-CSE-MsgGUID: cdSJrXrOTBef6Cc5u149iQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21599372"
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; d="scan'208";a="21599372"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 21:39:15 -0700
X-CSE-ConnectionGUID: m8QpN7n4RzSrCblkHz3L0w==
X-CSE-MsgGUID: h1qJm6a+S8SznA2IuCrbcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; d="scan'208";a="95274330"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Aug 2024 21:39:14 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 21:39:14 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 9 Aug 2024 21:39:14 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 9 Aug 2024 21:39:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sTZuVQfy4QQNbDEib5dDxCAlJWSAGFrmICAEYEW0JpKfRBqH5fQEUaEdOtLnZJu9ZArF7X3LSmXafU1sxEfjWumemlma7j9LhQOQng157+OTXUIg2Do/n7yGz2a/8sj3Tj6NdoRvoJjhPEYxm0f9gPkNCx0VOyFR6UOlrquw+oC3LYpi54Gzh+skpeeyYXxUDnSMeUXpZdbrkzcFdIy0ntONEr9OrP68VamU/zAteM40PthBGb6oYvIhbFz8yxkGfT9gOjjQQg2TiNTNcEju2c8Gv/mpbTc/QQKcc0KQmga0ZQtgAah3V+cWlzwUi72t/QLrwSuOXh8lKIwaFUu1MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X458uaFjCkjocDqgJZj4Ps/kgoV94HnnRSMY6U8quGA=;
 b=O/LwEMitdEayCqSwk4KH2aQskT9mkA/LnFCPWuWHnqJ4jdGqLW3nw5qRaPV4VhKEr/zJCJMDav1XmdPN50RzIjbsX/irJCW5LjeGe6SQ3GEAIdHkQK6wqn5uG8XC6OlNjyC+OdKn/y5ITgOKFYjUhGvPrSTa3UJONAH4KPvAXGx7qAwjbZm3A13GFGj194zTmJ8MI3f0pv69XIS6Z9dGDc7ldHxYuWYAbSrLJRLF+KdznhqQ+fSAgY+IZb1z7JKjvuFPxv6S1x0Ao9G/oDuQ0o6OUEad1aGfoxPE2kLpo6OsJ3VJwbtRjuu3koP6pR5iR1j5bOWJxnQY/wQYxbP9zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB8044.namprd11.prod.outlook.com (2603:10b6:806:2ef::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.24; Sat, 10 Aug
 2024 04:39:12 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7828.023; Sat, 10 Aug 2024
 04:39:11 +0000
Date: Fri, 9 Aug 2024 23:39:11 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 1/3] drm/xe: use devm instead of drmm for managed bo
Message-ID: <37xmbersr54eodh5qcypqllye5sd4ybtj3gleop2tbcn5fta5i@vulj42yumhig>
References: <20240809231237.1503796-1-daniele.ceraolospurio@intel.com>
 <20240809231237.1503796-2-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240809231237.1503796-2-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: MW4PR04CA0136.namprd04.prod.outlook.com
 (2603:10b6:303:84::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB8044:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d706b40-c2bd-4bc7-80fc-08dcb8f66165
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3Gn5mXxdOUA+oRd+aAXm7zo66KW5NfmYrcZUIdV09R+3yMSok14ypiuYMnHS?=
 =?us-ascii?Q?sKzD+dm6SsP17FMYHv1gRzBOf9Zf4k9DZsA0l4ggJHBaXB5aiPgubXMugi2v?=
 =?us-ascii?Q?ImQTpDnIK3CgSE6lxqq2zE8PmHhLaRCeUJ+upusPP7qkNhfcNf10hN6/4jY0?=
 =?us-ascii?Q?4JIV5g8diWfkB8miVlrWTmgkA4q/GdsHtM/TOZY54ZDU8uzwgbAW248GwWtM?=
 =?us-ascii?Q?Z8A2v8iJMA7iw2AQkPzLlhyXEkG8ii60uQRoGr1iBOuz4Z66ystpdhdcqluw?=
 =?us-ascii?Q?KFfSTYtctb6kmEPdx42blThuhkOrkZHLV0EJmTRswDH9fFsmbJuDJN/WSeC8?=
 =?us-ascii?Q?z9g4Jf9mwOD7Q4uni0VZWtIQv3T3dfxdEqhOpHB9tG0raVSplhsYpYaL2jHD?=
 =?us-ascii?Q?3BA11c3z0hs7f73iofk3E5N1d6VddC47oWi2WtxM/2cld2N/FbaYJbXgUIre?=
 =?us-ascii?Q?0pIqHNG4rUdBSn9w84G/2/+NrQB8oz3m+qu+WN9/AeITnMAP28n5PEfjKbZ2?=
 =?us-ascii?Q?OEF8vrGeoTbW68VA3LhDevwVFZ/KKaxaWYVPv3o9ZSXROloCcttpw2hdsMFz?=
 =?us-ascii?Q?hW4KQaXp+4fZcVeyIGoMkx0QfdAahIOJ5/imJZGiMGxFid9SHyS1TwOVCH0s?=
 =?us-ascii?Q?+bnzrWiTl6YXl5yrPAgqPVIFBfLygOaR7ORtdZPZKVGKwcqvFQAEk42yeuLp?=
 =?us-ascii?Q?zrrqmkcg8EYwyXIQIliu3VczXcmDT53tbVSyRn21vQodyb4k+8HRLsOMfKvC?=
 =?us-ascii?Q?Dni/DmsffdiUnmlwbomiBphX9mPrv7+7NWKoZ7ewY0aiCK+xWZhaDxxyOA2a?=
 =?us-ascii?Q?Tc6iHYKDoWUWDekfNRenhyuBlyTIPmty2IjiqYrbOuytdrjywjTNSd8WIwNH?=
 =?us-ascii?Q?AkgW4M/L5lVghxCne669UHo/fEk8Nu9ub6nGNTROCyyy70lhpxafihpfrNOx?=
 =?us-ascii?Q?CL+DcdppC9C4H9KVDp2F8aNiX6pojlaAUjdCH9/ZN9rc0fmQHC9RfEj8YH4k?=
 =?us-ascii?Q?X6iAObmeLdTew+g0B7OUpG0/iyocSdt4UrgnJ4+rUvTHvx9QAyzlGLUv8fK1?=
 =?us-ascii?Q?iCC63p6gn3MwrrTtr+2PBAyHkEUWMEt65EP2XQN0/RM97ZwsliQQPgapCpXU?=
 =?us-ascii?Q?2en1MYymb3agXPQ5747E13p3GiWwUWkQnTyXPBFNN7TmleFKyNkXr8XIr60T?=
 =?us-ascii?Q?ouXlBGmRJK96UXlvxQrMKwBqKtzjU+ALVqWSOdyQzxs1xGk8zi58aod1xt3F?=
 =?us-ascii?Q?hubcqdhoJ99mZ5fgT4p35LzvlvZv1eQZfemltPSywpJgTvIOUZCYMGFqoBKy?=
 =?us-ascii?Q?c9E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iLDY2vHt5WC18/D9HTNH8/tAzezLUIpxuL3oMIY+t2pNwOHBP38gsWjyt7Fc?=
 =?us-ascii?Q?ka8mVjr4f2KJlq5jA5buf9odKOMJMmgSmasH+pOHO1PbVF7dOsbQfMxAaSWb?=
 =?us-ascii?Q?lHEnSo5br5Cgiijfdp77lrmVGPq42SVePBYe8GuTbNcPf22axAEqFjSzEeW1?=
 =?us-ascii?Q?WJtK4vShH1nQG7pL+e7lHrISN0h7jtoPs6gMz4n4KF8Wir9nPMhFfzxK0G1F?=
 =?us-ascii?Q?DHmXRYYi9uvR2tJ9OkeeQyYAdI1WYjYNWu8reJ6FSHwa75nB5ECaH9y86gMU?=
 =?us-ascii?Q?dx8V+zHSlDxvWCIA/w/ALwJuBbM2TCjPRnDRmrPJxh+lk/yCNHehD3M/iY9+?=
 =?us-ascii?Q?M+7TmC4dBIX4+VnLxj2m6xRYaHrf/0XJsmY/yZv/3Z16Fd48FmIymxv31GBm?=
 =?us-ascii?Q?58NK2TvcGT97w8d9ct8yMVKG9VxZv/XmHTw9cDQdnj6FlGvc/DEyHiblGoF/?=
 =?us-ascii?Q?bwzjFEqaWS592fyN6vn7fYgcj2uttwQ/OWwe72HweU2O9fMp9UCfb3JWzEB8?=
 =?us-ascii?Q?QA1O2f7Owau2bXdwQhuSqmWAgUA63sz9JS6i3PyaPt9jcjyiJN7ESrMSIXvs?=
 =?us-ascii?Q?kU3uSLpAN7R4nGXAyr6KtpMvFOK767Ni8TEpnnVYKKiKAHOUiQhU5VFgfAJD?=
 =?us-ascii?Q?uGM9yj7lAJYUBXycvRVzX6AtrlUFvxCwiUMQ8BFM5Dxtz4DujIpcjhl7letM?=
 =?us-ascii?Q?2h5cgCN848o9gUjfSONDI+Lgemta9zUAyvZC+YWqNYaEi53R3Ra05ySGNqC8?=
 =?us-ascii?Q?JtmA0nz3vtp3cCTey4Hm31R0ktD8wJFVSvOZX4AiixfTyXiaMeyoloSIJwji?=
 =?us-ascii?Q?6aUBZNJy+UCQ0YUIQZVUPTRZt6baQASOuOMgWdjSWM+oW6JK084zcRAYTd0m?=
 =?us-ascii?Q?qLbxCdzAUmv4ZkVbEJfNAYHuNM9oqSs3bY3/Mkhor/bB6ak67UtlURjAmAe1?=
 =?us-ascii?Q?wIuWhrIuyVpe1lDyUc/nctXAvgB461m555bWcZ5nX7KagAWgsK5w1js+hqCl?=
 =?us-ascii?Q?BS95zgxCuVqvYsBRk6a+6tsAsZ3R851nGFlHz44ji0Qapo1KFbq9Pf46ldNQ?=
 =?us-ascii?Q?fo4syP/S/bctPTwInMT/00acYGD0/1eBcsozLRVfxqJUAK7cQ23/A1o7REYb?=
 =?us-ascii?Q?yFhJbsJyNeEDgrpEqhMDMLgXki4CZI9/Gfy/2qmjL0MreC02fTnmsEQFxn8m?=
 =?us-ascii?Q?GAROB9Z54WleQpFw2a8j5bbkFqjCcr8Xtl0akKCRdytmydfWX/cK0GM6oL+e?=
 =?us-ascii?Q?41/qb3vxHxeTqx01gWDdmAVez+V2Eo+33gGe0zantxM74Nylj99V4MEKGhLz?=
 =?us-ascii?Q?t15r4pirFksSVZ2bNkUR8tMwG6qnOkeaY8HWpzQ1+dh6L/JNNxIxUS91iQ7M?=
 =?us-ascii?Q?FjijQ4ywkM2mt/bbRHWaN4/BDowrKQriG6Ndikc7P0nwHcRpVrxNu5wrzgz2?=
 =?us-ascii?Q?826Vykr0ayIup+FsatW6n9CQQi8N/qJ7b+Bwq9c/nc/uRXQc9NJjc7f/QNdu?=
 =?us-ascii?Q?hFbO16URdAugDD4JgL81Lskxe+3schXR4Lc42G6hT7E1vwxxX5HDNGudfzNU?=
 =?us-ascii?Q?hweufPTIsSaws6oJNySSSdZ/Gf03RRTdVUb8DSdxCStaZ+KAU9ltMmhUchkn?=
 =?us-ascii?Q?Pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d706b40-c2bd-4bc7-80fc-08dcb8f66165
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2024 04:39:11.6938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +cfQDdbckW6f477pdJjAQlPGwQwV0JaX/3YynAichff1EsqC45/61yhQBWfiQk0wMrWDhVcCUPgI+J+nwgQETUKDd84PJi/01Etnp1T76Jg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8044
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

On Fri, Aug 09, 2024 at 04:12:35PM GMT, Daniele Ceraolo Spurio wrote:
>The BO cleanup touches the GGTT and therefore requires the HW to be
>available, so we need to use devm instead of drmm.
>
>Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1160
>Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

this is an actual fix that we need to get in the current release. Since
the BO cleanup always touched the GGTT, I'd say:

// Fixes: 0e1a47fcabc8 ("drm/xe: Add a helper for DRM device-lifetime BO create")

Even though that patch didn't trigger any bug since it's just the helper
impl, using drmm was the wrong choice


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Matthew Auld <matthew.auld@intel.com>
>---
> drivers/gpu/drm/xe/xe_bo.c | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>index 3295bc92d7aa..45652d7e6fa6 100644
>--- a/drivers/gpu/drm/xe/xe_bo.c
>+++ b/drivers/gpu/drm/xe/xe_bo.c
>@@ -1576,7 +1576,7 @@ struct xe_bo *xe_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
> 	return bo;
> }
>
>-static void __xe_bo_unpin_map_no_vm(struct drm_device *drm, void *arg)
>+static void __xe_bo_unpin_map_no_vm(void *arg)
> {
> 	xe_bo_unpin_map_no_vm(arg);
> }
>@@ -1591,7 +1591,7 @@ struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile
> 	if (IS_ERR(bo))
> 		return bo;
>
>-	ret = drmm_add_action_or_reset(&xe->drm, __xe_bo_unpin_map_no_vm, bo);
>+	ret = devm_add_action_or_reset(xe->drm.dev, __xe_bo_unpin_map_no_vm, bo);
> 	if (ret)
> 		return ERR_PTR(ret);
>
>@@ -1639,7 +1639,7 @@ int xe_managed_bo_reinit_in_vram(struct xe_device *xe, struct xe_tile *tile, str
> 	if (IS_ERR(bo))
> 		return PTR_ERR(bo);
>
>-	drmm_release_action(&xe->drm, __xe_bo_unpin_map_no_vm, *src);
>+	devm_release_action(xe->drm.dev, __xe_bo_unpin_map_no_vm, *src);
> 	*src = bo;
>
> 	return 0;
>-- 
>2.43.0
>
