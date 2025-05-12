Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D46C3ABC3
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 22:11:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ED2010E048;
	Mon, 12 May 2025 22:11:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BRVlXWmW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A76F110E048
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 22:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747087867; x=1778623867;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fnqvXHlC27z8vZ3TCst75VoNRAhbBe66ffn4pzV0jDo=;
 b=BRVlXWmWBJN8CGG1lJcGXDH2dsOYC1phoXRgog2xnQbd2QQQ9Z9SOAYv
 yNR06On4K4Yb/8TptDg+qoUUFuv4OjdfXtpmi2qq5dwOgSTWpFzD6M0EU
 K4VX+34yK+MgAsSOwu1DRi/9S5n1Die/cMaH2Wy3+I+76z45oB5gGCirk
 +VQJFPWVtcbKRvOC45CrwGLTWG4wHfAOOknQtxQij1ZjbpbJaxAkBZlC6
 BTslWqrCY1yDpwDSWQF5qcquEu0IwdbQvgty9zESqrtBNfNO+5nVPP/CF
 +erlz6aOsoSpTCccM7xx660GXoaFxxOqF4INuTs8xcPY7dkRrHv6LW82j w==;
X-CSE-ConnectionGUID: 2rd09qSsREC7prdaG7WNtw==
X-CSE-MsgGUID: tWOwNG9TTqyPJ/XuvWdMTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="49055754"
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; d="scan'208";a="49055754"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 15:11:06 -0700
X-CSE-ConnectionGUID: qMi9PONeTRGwbU6mr5+PVg==
X-CSE-MsgGUID: 44gAtaZ1SduvNYG/v1ihOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; d="scan'208";a="137977290"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 15:11:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 12 May 2025 15:11:05 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 12 May 2025 15:11:05 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 12 May 2025 15:11:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n+O0wmOwbcVZlgytjeN2shkiEKCoa0+JjsBAJrcTz8b5GFRcWI4ZVNT9gh+wz8EKsaXtY8lIhT8Tx6YpCWKX/lovPZzCHK78jP4rPXzwxPFuQmztlcyzlcFfV2NqfW2joS7e28CfhONkToTHNAnF55Tx/muU1y9NXU3IDcqQ0VxZDxFd/I4lg6f2BohnKbRuW+WzNVTbDSCAYNh8VNmuFQSxItsS3cTsEGcff8GBUTmw581lDEzEyCra9iwN8FzeGoKSlvjTrlPWEMT/nHTyOdrKZuPqpGU52SUcwSUacLFbrx0LmVQoW5Z/RyA0vHcW+bPuukdHoFrFy8GXKn06OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7LXFbA326K2QA8Qqxi+Cx5FtecQXJpXDF62w+08g6k=;
 b=FA5fnNBjOyzzKOqv8dQCEG2tKS/D3zsE6R/RHCyHcx3WGh64cj2gUHaAvivewjQuqzlsI7W5ssLcnw6IqbNqp4riIpu/kPV6sS7RV8TrGXjdsBHjDPZNXvgkaWFpMJo/vy56tXH9KNy9zavlyXLKrFktBjoM+rVhzC5eJDDEuQA9GyByh/xfBLSA997PDBNHKGMC5kgmjOXUeRDUlqHkm8W9mnkqeA+w8PvauRbuVJ396OOCfj2VcQ92cNQEViBbRyy8F4iYXFGv7COz7XkZntZJei8T0UFs/plEmTKzHg/wMOKmenXX7rXLUmkdEPCLFWr/QXjpdghRAg4K9hfoSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 22:11:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Mon, 12 May 2025
 22:11:03 +0000
Date: Mon, 12 May 2025 15:12:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, John Harrison
 <John.C.Harrison@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/guc: Don't allocate managed BO for each
 policy change
Message-ID: <aCJyTuVdtGImhSUq@lstrano-desk.jf.intel.com>
References: <20250512220018.172-1-michal.wajdeczko@intel.com>
 <20250512220018.172-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250512220018.172-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4P222CA0004.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ1PR11MB6129:EE_
X-MS-Office365-Filtering-Correlation-Id: ad15821e-a302-48e0-4baa-08dd91a1e28a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MU9zEbSQhaUdWQLGbC3l09tTynlKRiDV8NCkL/kNwPAbp1ntDpdsYd5PUFvd?=
 =?us-ascii?Q?egg1tX7OcKJFdacbVOhJlt0AsGtKvTVMMRzTD4jEClA9izj3po1hxlZwiPjl?=
 =?us-ascii?Q?iofsLzX+41FLqMHqHZitEOEA3JqL6p/Xr0KYoed4cRvvajFla0Ac/caqipXw?=
 =?us-ascii?Q?qVmyvIyYj5i7fTlQ+CE9MM1HQc4mRjXAbsnlBfdTanbu5rpePWpC4EOoskZv?=
 =?us-ascii?Q?zZQ1BK/fk8ZzUKWR6xPqHgxi5LjdlQBJjPJRrm3Oh7Rid9B/OVQrfVIgj3NT?=
 =?us-ascii?Q?Nm6ti758QOX2CaSLOExsPTH1bwO2Q+fqtA2gVvHnI4veFQ4rTVGxKN2OC8i3?=
 =?us-ascii?Q?U6vE5ldN917HmHRjW2zBFPp9bYQDd8SIMLJzT46nH+j4IO1XRhbZEEsmtyxk?=
 =?us-ascii?Q?C7gJpsimBnMtqYgFk8JXpx+8mPsxQnRFlnNrzmYVccBQpIi40xC+fbk8/mDz?=
 =?us-ascii?Q?TFxV6fQnA6VhbcQjUSJMwWs4X7u4peKXXc8NB6sUZdBh0YvvPALA4Icyrrkp?=
 =?us-ascii?Q?UED9bD5K4yUEHlpJwxDWlFitB+OOZVaxdqfoOwLnoZnkk4qIdZrYHPdY71Io?=
 =?us-ascii?Q?nEHReH4EphUeadw+zaXFlBq00vJWAFNBNDEsSodX4rNL8NXRrahgoVheAu7g?=
 =?us-ascii?Q?W8i/NQhWG0TucBjiBaP4nLNt5s+XGsRUyWoX74t7GUhG4C4NKu0Edi2yWDPG?=
 =?us-ascii?Q?9O60GgxIuYue3oL8Vu7QeJRcpJXuHlT8lX5eptn8wdMucZuM450qq8cJxFVQ?=
 =?us-ascii?Q?Z+X35yRT05+3cTQfSyFtKRpG9pp8tpdOc5EeiWLs21adPcDOdv+6w/S3m6tu?=
 =?us-ascii?Q?tP8HhT2rsU0wevS+fYGdSJcRJ0c8X7brbMD4p6L7jKfIvjGkUlHwS5EhsWxj?=
 =?us-ascii?Q?YigEtpnbwUJ90xuR2g+k9S59D5O3sMg6sYNFlqzh2k5wLcRFjK7vBNGrCYoc?=
 =?us-ascii?Q?K7z4owWJtW0HTfJgetvNBq3qhGq9Rr8EOpJX57W+Vpd8fhjre6p8YsqXj2h4?=
 =?us-ascii?Q?2DnjphNbPpQXeikGyvsGGSntEVIfUuqp7ORp8DcrRajxCO4cY4XM0jFDrjYy?=
 =?us-ascii?Q?wPUyfVaUL3cpX/QknfvbgptJy1/IEr20LTD7iGgFL7Ks6j1g0klS4vkCGIro?=
 =?us-ascii?Q?sARrn+4Ky52FlL5YA0zrYgM/H6UjmmMiIVRsjEZRJxtJvYnQkeVCtt22KEN8?=
 =?us-ascii?Q?kC8kB+Qsnk70t/rNkjNIlJoorwmch4+loFR2eKxI/utq5FVzkndmv05Vyru8?=
 =?us-ascii?Q?kqGDekoBkn0cDJKbD+Xv/XnQqmQG3lNqb7n/aKeHJbD5/tVJ5cHHz9DCHaZe?=
 =?us-ascii?Q?Uf1ATDTbZ1Q7cM4zJPNPNjJAOF0+cXpCjGmmOa8PRl5cJWapH0N2zh+ce0vQ?=
 =?us-ascii?Q?oFZwb7egnyEL4QOuMvNGG+XEevlGDesto3GJmuGXr8hhX8qFrpQp/n8GRuLN?=
 =?us-ascii?Q?bYCm+FewNyM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mndrQW7Thqyc1xTLk6BffvkplPPniKEDk6GgaHUuS3XDF5MX4U2FVIP4Nruf?=
 =?us-ascii?Q?D9hNrXFT9EC3WZERNWOJm4qIx5b908EYLaKD0BSxeT43RGk7SOnNTbY67LXw?=
 =?us-ascii?Q?1jmpAWEYGaaPWY1b+YdK8HVBMqY7DePlzmvlr6T7bIA4B6rshBjmPfOagJ3O?=
 =?us-ascii?Q?w+7TBkY7BFp+aETaYl1fFFyP5ohRP0uEwKURsdPHFASGFSihAmMeAeDKx5jX?=
 =?us-ascii?Q?onuXYRZ/iKTxZYWHBsdgghlpk9nVA0rEL+2WQTmrqzJJH0wjPpnel6GkdiF2?=
 =?us-ascii?Q?zF58qihsfTpo7/og1zJsXdjQJhqGgcB4JtkXh/MS4P5pf+x56YrPt+fiba02?=
 =?us-ascii?Q?/ZPu4PkI/eb+SyAJJapvKcgECc96sb+/g00yhLrL3kcnXLB/QdsNO4WuJYxt?=
 =?us-ascii?Q?0kQIndoG73sB/v6/ffZQkH4NIpVnU64kcF6LmoGQxlhlC5NinHbOMxltW7dv?=
 =?us-ascii?Q?mOxKsaj3xbbAw96qV5kceJjY++gMhaH+mnKlBslBen0M1NKUDlLbfJkJHnB3?=
 =?us-ascii?Q?SE8lsb7kbcEvKJjn9Jh/8xTd+6odojiBer2DbCe51o1vENQj0yD42kfuxZHA?=
 =?us-ascii?Q?Vxmue93cfWUD5iAW0UXp/E6CoMRy2tfXM2CKpyj+gSF1+ZaOeFhpBy7YIGwL?=
 =?us-ascii?Q?/lFe8hzO5gqgn/QZxtnl9bNKd7JrlAlGqjdLTCtc8TKhA0AVJHUQ5X+tIKlN?=
 =?us-ascii?Q?85volkdybV+3la+WmySH/qWKunu8vmsM7q/j6ribGaNzCg/xtUGIncnEEn0V?=
 =?us-ascii?Q?oz1mPQGM2SfiNlw6LShCn9IER2zw1TO9kXJrW5Q02LsOPHxIhb8DlcBucebS?=
 =?us-ascii?Q?tD1iOx/jefg/8aCEj/iqM1PzoCxbJSajuimRaVA8pv5U4KhQNdxkTeLUY5MM?=
 =?us-ascii?Q?cWhR5eVTOWaGVc7KXXsA2pdUQGlA0Pe+aU7T78nz2JNApb0MXl4nk+jWb3f8?=
 =?us-ascii?Q?4ZeGAgx7JgXSF6Tf9BKqmDsM9tmTk+XufZB0da4Ish3FNQ4csYDfP9GMhQQl?=
 =?us-ascii?Q?z2dWsTdY00awXGRe1vLRUcjgJ/RA+BT4QO0RllQ/H9pqLRAdsyoG6k939olV?=
 =?us-ascii?Q?9Fm99WOfHIXqrVboMr9ZnfGhuMu+tnf+tCtqBR9E+0JLHyXVRjFtAggk6CRM?=
 =?us-ascii?Q?TIxs74t3d4dTsNGMUb2w9WWyFz36ag17R4TFOp/Mg0rHeE2bwz1aAy8lK1mW?=
 =?us-ascii?Q?d+cvyx6TemZBGMuMzURFjdARqcWbnZAooGgCQgiJ1TtMepTwEkt2160Jeg1z?=
 =?us-ascii?Q?YGTpkhmY+QBnmjjFKqAtZsoNOJPwrhVR8D498wRcNlrFFR7ybvUxnFuaIjoR?=
 =?us-ascii?Q?0uPXdvHvO6S3gbIPdwAxn+KQkNIaGVcCjhCjJcgOVbxh4gr7L/Piu69EImCN?=
 =?us-ascii?Q?MNCMk8vP3sSEweRrxXC02az0zMtonOUl5F0bAb+0Tjrp0bM3ftI9WXHuS5tn?=
 =?us-ascii?Q?4dY5RTfEuIZmhqDOh3EvGDRSUal84N2WMtav22BDXChquOToCCwAR0Mkbsv0?=
 =?us-ascii?Q?qVaXyJ5RNr5eOJSQR7fe2f5L866a730PGihuFaBHjbG2ZlaWn6ETSnkNFZuf?=
 =?us-ascii?Q?zSFksFqY1aA2xtndT/zY54M4KChMcNZyfnEPK/+X6S1zABngCxlE30YlCBnM?=
 =?us-ascii?Q?Ug=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad15821e-a302-48e0-4baa-08dd91a1e28a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 22:11:03.4825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8GwJLxeAeeqN2uM8mvTS/IHtc5kHaWZBpigEtWb4bBV2Xcpzy+w7YY2ReoHC3LMyj9eMymekC2gel6D8ieQOTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6129
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

On Tue, May 13, 2025 at 12:00:18AM +0200, Michal Wajdeczko wrote:
> We shouldn't use xe_managed_bo_create_from_data() to allocate
> temporary BO, as it will be released only on unload and every
> change in wedge_mode policy will consume resources (including
> precious GGTT). Instead just switchover to GuC buffer cache.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Same as previous patch - do you want fixes here for backporting?

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_ads.c | 27 +++++++++++++--------------
>  1 file changed, 13 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 44c1fa2fe7c8..07a027755627 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -20,6 +20,7 @@
>  #include "xe_gt_ccs_mode.h"
>  #include "xe_gt_printk.h"
>  #include "xe_guc.h"
> +#include "xe_guc_buf.h"
>  #include "xe_guc_capture.h"
>  #include "xe_guc_ct.h"
>  #include "xe_hw_engine.h"
> @@ -994,6 +995,16 @@ static int guc_ads_action_update_policies(struct xe_guc_ads *ads, u32 policy_off
>  	return xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
>  }
>  
> +static int guc_ads_update_policies(struct xe_guc_ads *ads, const struct guc_policies *policies)
> +{
> +	CLASS(xe_guc_buf_from_data, buf)(&ads_to_guc(ads)->buf, policies, sizeof(*policies));
> +
> +	if (!xe_guc_buf_is_valid(buf))
> +		return -ENOBUFS;
> +
> +	return guc_ads_action_update_policies(ads, xe_guc_buf_flush(buf));
> +}
> +
>  /**
>   * xe_guc_ads_scheduler_policy_toggle_reset - Toggle reset policy
>   * @ads: Additional data structures object
> @@ -1005,11 +1016,8 @@ static int guc_ads_action_update_policies(struct xe_guc_ads *ads, u32 policy_off
>  int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
>  {
>  	struct xe_device *xe = ads_to_xe(ads);
> -	struct xe_gt *gt = ads_to_gt(ads);
> -	struct xe_tile *tile = gt_to_tile(gt);
>  	struct guc_policies *policies;
> -	struct xe_bo *bo;
> -	int ret = 0;
> +	int ret;
>  
>  	policies = kmalloc(sizeof(*policies), GFP_KERNEL);
>  	if (!policies)
> @@ -1023,16 +1031,7 @@ int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
>  	else
>  		policies->global_flags &= ~GLOBAL_POLICY_DISABLE_ENGINE_RESET;
>  
> -	bo = xe_managed_bo_create_from_data(xe, tile, policies, sizeof(struct guc_policies),
> -					    XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> -					    XE_BO_FLAG_GGTT);
> -	if (IS_ERR(bo)) {
> -		ret = PTR_ERR(bo);
> -		goto out;
> -	}
> -
> -	ret = guc_ads_action_update_policies(ads, xe_bo_ggtt_addr(bo));
> -out:
> +	ret = guc_ads_update_policies(ads, policies);
>  	kfree(policies);
>  	return ret;
>  }
> -- 
> 2.47.1
> 
