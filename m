Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271B8C5AD49
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 15:44:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE6DE10EAE5;
	Fri,  6 Jun 2025 15:44:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WXROx3Wc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C52410EAE4
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 15:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749224664; x=1780760664;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pXWU5g1I7ZNI/D4E9np73cJTyHoRafYILsFkCm5yOww=;
 b=WXROx3WciQzOBwI5rzvfAQyErcK0/h5T9HwQ16/WAVi6kla0P35NCUEs
 p1ZM5cl1AfLTuwNgQbE9+prq1gNkjS/RCqA8aO0c+PeujGxjihc17zGAk
 oid5se5p0fenlgF7Kd01ex7fmA43c6a0rPGil7TlVEpM86YBon0j+6Kdu
 qsFVALmwlBFzPETSPFDUGHgbc3wFlhnUtc9RsKb/G+JMYWjhCs1qDad/3
 1QUsJ2C0DvCbCIRxIloC4brlxEDYThwdQ5wutsom0g47cSGUTO/dXky9m
 nd2mP5Yve9PeoeVLkBWQcVwMs2vcWfoptuRW380RVhrv8BgqxSwBbHHHL w==;
X-CSE-ConnectionGUID: 1BzrfPdSTXCTH0FNK8pvvQ==
X-CSE-MsgGUID: ruZQSea4QlGfrT6LTEpjsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="73907752"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="73907752"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 08:44:23 -0700
X-CSE-ConnectionGUID: 4ynUIGw9TqGS+qwMDCg3UA==
X-CSE-MsgGUID: smJDcPxMS+yonVivPKJLJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="150732248"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 08:44:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 6 Jun 2025 08:44:21 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 6 Jun 2025 08:44:21 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.80)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 6 Jun 2025 08:44:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lRzQ95u7sNADUKNwTEAOXKbm4KD7IM7v8yppRYkuV4p3slslQ5EJF1yv8xRsjx84Ut3CbzpIQDhJt09GE/u/tFZRDP0fMQFb00Lh9oUvAY6b7i06Jr1vlgIAHY+H3Ko/R+mHq4l5o0VEVE8PfILJ4/PHsbdMqL4egKCnKSeEB2/I87FrjUMo0de4VtcOv4JBhkN8ffkyDbpbca1CKZdxOFMezLMozk5IZaMGzV4r8WAq+FwJ/CpqPLitb55yFW/XaBUkwpFxxgM8JjBMfSu4DDITkGEgUnVm98SOrERp8zLEvqsgrGhrZp8LK3jfMydKqux30VO7GkRmgmxvT5DuHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pPY1ozC4dYDJSkHq073kP+iYlGXKHGWytoyajAyI3PQ=;
 b=bfHHjF+9Hrr7Yam9+C+udnE67XR6XLNzGNA8zfsD+dm/6G0UFR3pi7PC0jUQ+r0S+bdkcPWcXMS369U2idkpoe0EvdxBJaqwQjyvVkBTp87zrhzkJkNmCkmwQAlNan/FTyK9+AnvfDZKJ5R6gyOtLlSvHuGcWqH2nSd2rTYBq3klsL/JX71W1zIlY0VqxTqJzojhicJXwAlKJqz8aWfroQ/ztHgA6iih66bTX7zTA3w+QKtGvzn4sQVNBinGun2/p8PKV6W3H60nnNh1/sUFQjqqNJjW/83ptsM7X/vUCaI8PlJqA31iRM1Fsyg+vnkKomvDVHNWifwVXF0pVu2IZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SN7PR11MB6775.namprd11.prod.outlook.com (2603:10b6:806:264::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Fri, 6 Jun
 2025 15:44:18 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8813.018; Fri, 6 Jun 2025
 15:44:18 +0000
Date: Fri, 6 Jun 2025 08:44:16 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe/topology: Use register array size instead
 magic number
Message-ID: <20250606154416.GJ5080@mdroper-desk1.amr.corp.intel.com>
References: <20250604202908.769-1-michal.wajdeczko@intel.com>
 <20250604202908.769-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250604202908.769-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0070.namprd03.prod.outlook.com
 (2603:10b6:a03:331::15) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SN7PR11MB6775:EE_
X-MS-Office365-Filtering-Correlation-Id: 8da1354d-7c9c-4918-bafd-08dda510ffd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5wYmqrc3Kgnlbf8UuEXWc1sHojiBzB4E3EEkNaCPszcaOukSPgG7v+Xi/h2l?=
 =?us-ascii?Q?ZKJ2L8OuDzA6VjAFoTOeZIocQKrgJJaRFIaF7UmmtS+qBbHfs1YEUOzvbnNE?=
 =?us-ascii?Q?bsoaaXGsYHW2LnyGPOD69y4UJmBm1PlS1JyJT2zDYJgj8LqLiLATygj7Ao23?=
 =?us-ascii?Q?8rjTi/btRoFenLZYWZ3+pz3ge7jC6tDZB51Nin1YTG1hS6k8qJyxt252bsFY?=
 =?us-ascii?Q?WfK3TuPeaXeW1fsy9JHVBqKjFekjFXuCzitwFGdOPiLhIIi89mH9soQXExQy?=
 =?us-ascii?Q?wbaIIGJ377mJnQ9tk1L1JRWIpQp7E0PRytCAT8SmOoD5mZ3pcDQ1rr4uXo1Q?=
 =?us-ascii?Q?xpWNf7dm64rZgC4evmBiJPcWZEaadGuqW0fRsY9iVsbvwkhYfdMXeB47B2wq?=
 =?us-ascii?Q?vBNz3wGUwyLuJDvsOnzPBi7lXRxokIt0VGdsxdxp+rG9Y79v9ddmEWcrvGr0?=
 =?us-ascii?Q?FWkoacN7IzG25SCDQLaA/ChhFNo8R09f8HYWGdIYJvBTrDf9bhtMfrdzMNth?=
 =?us-ascii?Q?8Rbnxb9CatEYNDpmK6HGXRoO4g6VvWcNJQRMqetL1TAoK5kgtmZ62+owNrEP?=
 =?us-ascii?Q?AQi42cFBLaOcDu6swDL7ztkW6/wNe25Nm+ewGlr9x/P8389zv82OrgtWdcYb?=
 =?us-ascii?Q?nGn9wrk13bLRrCkjDSRDyXXp8pSb81a8dtD0zRz2KeumQQ6tZ63PisqaPyWc?=
 =?us-ascii?Q?AUJ/RgkUqEw4jytl5QTbsg+kT5pbl2A7WSwD7EyxFmVKfxcOzlQ318GB1AR7?=
 =?us-ascii?Q?GdR6E0+Tz4wlDc5bIn8TzSnunnk3vpAthFS+o5o6hD3S2cG9eGqGusS/bo22?=
 =?us-ascii?Q?NlbAtKJiY18nfIBCMovxCYEih8bSHgGtm6hKIzqjXMuB9AvswF0W5B+7lXlP?=
 =?us-ascii?Q?AS5YTNPUZOvBNe2ELh+8d1Ojv+XbGcUtYvT3z/47yUC337rbkHinFv0XnbTB?=
 =?us-ascii?Q?224GPL0LtOu4SOSqO4ueAzdcnS5sF1Mm3fFAZCO0qpSw5UthwHxEsUcsVVkF?=
 =?us-ascii?Q?e6m1cH88DRvu8zPRbRJ0ISYkd8N1gTL5/e1IX3BonIJLwz3bpCQbJOECri9o?=
 =?us-ascii?Q?ZQzF9AiLz/7IE4viY/RxFWnM4CK13pkEIUkkN9+F631gqcJxOcPK52vPQMQo?=
 =?us-ascii?Q?3OUCEsnzwW989/RZAx6QKIomIFbug+9vb+D3PtAi4LeqjDimdhW3R3v6R8pd?=
 =?us-ascii?Q?Ru3ZpdbFLPNy++Tskrm2U4xx4FYQlvmUzh98AgZ/x4OWsJ51/1I159h/INDo?=
 =?us-ascii?Q?OpJQR2A36+BpMlwfINct7stzJMBPHpMM55GZQz9cQxyar8ZSvlOmWWBITnwC?=
 =?us-ascii?Q?bpeErhEoDrsGkNpSEoKUzvKh1XWlkSd7Fx0SvUc7vTnpvJMomIY0Y/Z3Ih82?=
 =?us-ascii?Q?66tmclJ+YsRoCpEoB3kcVOY9YUaALds+HuZghMQuCDiUuHTibWP10xVRcOc0?=
 =?us-ascii?Q?tKjfXgHwSzk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8Fgtd0WkV9kkbuNq7R4x5TANe6KICWfyNoO86RdJ921xMsjqTEAzVyrFVYuW?=
 =?us-ascii?Q?dcLAfpdAyvDIPx/MPey0q9chstUw8yvQvm1+J2lguA5sc0ZywiucywMaETdO?=
 =?us-ascii?Q?o1thipTW5nNmoiuMxsTD3LX0qi2otuUm6ly6JP3P2hMNk1StMEjygwRwYlA1?=
 =?us-ascii?Q?DH3IOHynrDiu1r4iTmfk/rjNlSH1CQ7fpYRC3DloRj5skQ5CximeNlJLuj89?=
 =?us-ascii?Q?hXB8SYga8nCVtKvnMw+im4cMCMDWqwoaLxlMES32YElGLoWQP1JEn84xDIVh?=
 =?us-ascii?Q?8Lc4MEJifSAfaqMBgNvuTMSvtPgwtj178W8dGfyeL9WaV9qchgz3hN42jFey?=
 =?us-ascii?Q?sAEgnvao46e41FKMAZdq+6OareT+I8exW3ONR1WlmisWHusq9fRjd8ZjDlyb?=
 =?us-ascii?Q?OnGewjGlJ9caAo6vOEzDD66BKHnaM0C56M1nshkg3VkvzwXls2+1ej2n1OcB?=
 =?us-ascii?Q?zXHP/PLijWm6ASigwbXDAJzG0yOgQ4ForzKqKgG5m5tKNSGZYXo9CWXJ1XYN?=
 =?us-ascii?Q?vBIfD6k5wgPu2TqNZz2+U4p0B9z4oyqkph8yQNeHKA59XR/W8jR88f4LZNID?=
 =?us-ascii?Q?+vHs9eAvv2V7dz4PSwEpSPM3E6W+CanLaap66RPjwsNbvaB10p5WTJwm9Cs/?=
 =?us-ascii?Q?McHBD0ZtoFtxh4A4xWH9pOpsRcHby3HIENTKVGf8tgKMQLvWcI6SXof1GpI9?=
 =?us-ascii?Q?44lNLLV3L6WV7iZHyKybfwc3mS4gN2bCw8xJUmE1c7nOR78x1+HbFBAOZadI?=
 =?us-ascii?Q?TIA6TbulBv4PM3ySxPbQLj7IMDNlf+IBUc0aIqbz+WiWNCx6b+C8iU+UGfTc?=
 =?us-ascii?Q?sMF78EW6dhTPLyB3/0HDPxPBCgrltGPGcAej4n/h48F62761l26JVlPE0JjV?=
 =?us-ascii?Q?ebpltrkuQ/AMzYjGaEwewzjcjYzXkZSMnpKmnqzeTfXM57WDzcbRKYE/TVuK?=
 =?us-ascii?Q?xXewBSYhtYcO2H+IByPRg13f1le9VJYmxHy53n4gRZ91Ml0FtyciRAXkVoHm?=
 =?us-ascii?Q?lq+/YwIg1peZ+JIgmAvUNPHMBvJAyfqPqpt6nclgm+WO3JnfCN6YAiwDEphx?=
 =?us-ascii?Q?M28BBxGaS2aAGSkrsPy+9FuJ2MXbjhXHGh03oIYOR5Ryrijbw4K+keZ/k1PZ?=
 =?us-ascii?Q?t0hHmVfZmTMX9mlFfXUO83X0b76IICzAtxKJn2xd3ZdcULsXqsxf0ba1cTMK?=
 =?us-ascii?Q?ez6SV2XvA/NYA+ijnjJmFJaLrixTg5BCjk8DI41MFdpFRyX5O5Nl8if+dnwG?=
 =?us-ascii?Q?6a8R2PMLL8pS2DU0w9tKIdDCAg8IBb1tHwv+3P4fo3leQaKwxNFuIlpbPvJh?=
 =?us-ascii?Q?ikakMKX6U/h0psCYrIJUHhd3Fr6B7CIKUfhwYmhg4YEHUTvkRYtE7WZexNd/?=
 =?us-ascii?Q?RJnVCTObqHHS0A7LaWaGDe6a+vFWakf3LET/YMbKyKh8qaLMfSF/Gf+tIBqk?=
 =?us-ascii?Q?GOhprwyOSkI/7PGIuheWy1BeQ6rgY4TfpSrhzgZ4oNQZGM+dk+X4ci9/22UF?=
 =?us-ascii?Q?nDNGUDpUbuFN5S9Oh6SB6i+wRIu8DF7RP01mm5IEL1y3J+Snw/MhvRkld8f+?=
 =?us-ascii?Q?/FgosV/YcTyDt0VUUquT8/PvmHTXugzLYbLD4DhwZVuFfR3vgtRm/lMG1iZl?=
 =?us-ascii?Q?Pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8da1354d-7c9c-4918-bafd-08dda510ffd0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 15:44:18.7509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wcQbGc4qS9EVdJGlFIVD8qAaBs/KHSIfZ9/X5LlnSCjOu+rjCoUJb6nQKZHzid0BLqwASQ+ZYz8o7fFgPL+SG297lv8HBS+Z22osUGJV1yk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6775
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

On Wed, Jun 04, 2025 at 10:29:07PM +0200, Michal Wajdeczko wrote:
> Since we keep registers in the array we can simply count them and
> stop relying on magic number when checking if didn't make mistake.
> 
> Also we can switch to use xe_gt_assert() since it could be just
> our programming mistake during platform bringup, no need to keep
> drm_WARN() in the production driver.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_topology.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index 62bfb6e1a166..048743913b36 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -236,8 +236,8 @@ xe_gt_topology_init(struct xe_gt *gt)
>  	 * Register counts returned shouldn't exceed the number of registers
>  	 * passed as parameters below.
>  	 */
> -	drm_WARN_ON(&xe->drm, num_geometry_regs > 3);
> -	drm_WARN_ON(&xe->drm, num_compute_regs > 3);
> +	xe_gt_assert(gt, num_geometry_regs <= ARRAY_SIZE(geometry_regs));
> +	xe_gt_assert(gt, num_compute_regs <= ARRAY_SIZE(compute_regs));
>  
>  	load_dss_mask(gt, gt->fuse_topo.g_dss_mask,
>  		      num_geometry_regs, geometry_regs);
> -- 
> 2.47.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
