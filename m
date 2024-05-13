Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39EB7C25B10
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 21:35:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D062C10E641;
	Mon, 13 May 2024 21:35:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OPa8196F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C799010E641
 for <intel-xe@lists.freedesktop.org>; Mon, 13 May 2024 21:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715636139; x=1747172139;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Q8y0MKpipY79cWZYNTh0yZMM2ilMgLXcRJVOb55fdB8=;
 b=OPa8196Foz30hH197t6hBFouDQtWJ8cXEo6BqgNyZA8uwi0afGzKLXlG
 0Rgp9/sV4wUsrUWDZSaBfNIkqgzxPGXYeeGesUIydrv5f0xBBy7ZZi08R
 V+bOQw5k8NBw5LobYB1/02wYEPjCAdfYi+duXIVIbfjYa9UT/nPH+cDIw
 Qk7iXKs7UnhRdLYvQYDJVx4sd7zXRJp9MOevzs4ZIXt37uGSpOGXZCGB2
 LMdEqRv5bqgUTTKCxN6twZTeUEgv/8mMdiwtHfEMGOzBsStsnM4HxO60a
 tdUGprWyCYVDlfFCfgGnqKVZulg0KRRmedA7L2NCy5Uk/ZNihUyy4Df6l w==;
X-CSE-ConnectionGUID: LR3q32fkRQCk4znF2eXSlQ==
X-CSE-MsgGUID: bBjWOvICS0SDTED9uVKBgA==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11725595"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11725595"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 14:35:38 -0700
X-CSE-ConnectionGUID: KzusuXgbT3Csa5zrIpUL2g==
X-CSE-MsgGUID: ZxrbPCzWS2+nbi1lkJ/J8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="30588100"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 May 2024 14:35:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 14:35:37 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 13 May 2024 14:35:37 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 13 May 2024 14:35:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZVEPOz2o/NQwVIWiyFJrlK1Ox4f1Ufrj2vs1diV2LT8Q5na5obiyHsX7m/gakjKveH++G5/tHawElPBp+ERrbDl3nNaboujf4fI1lkrHoqdJj0GONS84HGCBmp6bFpou7ZrZUQOLARcvG80K1zM5kuitrX5c2MMw+YNNQrCMm6oB/ruvq7Y/gPeqkPMa6FfLF6OWZgKIr5h35zkGp/2B9/ReWDIxz8TyhYMpkSnfy9Bk/YSXVO4zmkZPnSVlNNVD/zvpimHapcJg3Ukh3DCcptvUYevqZiTElL1zI4MP71n8gmSKZp8pV456KPRWguCPBQ8V8YtMcMu67c4UxirWOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6oqDFHZ6QNKeoR9OvEQkOQPY8K3ZnIiqP87dWk8+1ug=;
 b=dsRJGO3FIl7iUSX3bQBqjiMphNzbqG2EJILZBBrv94jrkOHRRhfxAWyM8yTZibZoq8cBUrYzkQXnV7IPi6nC6MeQ1reci1krJVZYp/bUZJ1WByQ+XSrRaItB1ScJAwOFvRn46mJuFFUXMd/B6sY4A0edURj45jLzZ86CTQGQg5yVZIF4C/QJ40qfxBXL08PWaiQ2gkVZ5eZGPELJzJYDDihDC7UC+5QiWuYR4z0I7lyrvoEwz9Vf1BwI4+Y9kGJW8ijpN3H+Rahg3f8HrYMhq203tOTVn2O/h6eTU9r50fu+Jp5yw9aq+AhxonZEztKd9MrJd7ugkRfJ/wbfAi3zig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB8425.namprd11.prod.outlook.com (2603:10b6:806:385::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.46; Mon, 13 May
 2024 21:35:35 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 21:35:35 +0000
Date: Mon, 13 May 2024 16:35:31 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <vinay.belgaumkar@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 <michal.winiarski@intel.com>, <matthew.brost@intel.com>
Subject: Re: [PATCH 1/5] drm/xe: Drop __engine_mask
Message-ID: <77amteukxppdiwas4uhyi734ateqj6qi7qmu7q5evrljh3fepn@yq4jfb6chvty>
References: <20240425182410.2705061-1-lucas.demarchi@intel.com>
 <20240425182410.2705061-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240425182410.2705061-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR04CA0335.namprd04.prod.outlook.com
 (2603:10b6:303:8a::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB8425:EE_
X-MS-Office365-Filtering-Correlation-Id: 69b4a397-08e3-4a83-6565-08dc73949fab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4viydZ+kXFjQpshha3FP5KdxUCrW3JVlUE69GMfBtnEHrDlSUNsfALQjxcpa?=
 =?us-ascii?Q?BJdqttkBxcwnknJrkprSK8/w3tAqRsxmpBQxH6Ng45Kh9cAZh92CRZIZvdVx?=
 =?us-ascii?Q?lBl2Whkrd1QezPp44oEmI40/Afv7HAMWYd6z9c4d2gVDLRzAbEKL8CocJTtO?=
 =?us-ascii?Q?CP6GSwhvuVPndIKTl9fjBbkYDDtvROOznqom4TnbxRthey+X7xg3ENh4tHE6?=
 =?us-ascii?Q?hxGiivqHeYP0nBiLKrQM7FyFvLUzcRkH6EorvkY9frQejtjniNbq87V8k9R1?=
 =?us-ascii?Q?s+JWzQHt12moqgD3otvxGbNi4s0YFrAiA6V0IE+okU2JhFn54RJup3bMDwP6?=
 =?us-ascii?Q?h2uC0cXMzanC3YlWQ8SfxKsd/LbEL0f+N6b4FR6bp2Dym7Ce8JURiTqsC4F6?=
 =?us-ascii?Q?WkSTyAYvSdaeEJDR3CavajSSoe2B0vCWDF5u8lxFbuv4bYJ6V2vhRQ8WkWNx?=
 =?us-ascii?Q?CYrSBDcP08wrYdBTD61cjNl5rTLtePIqPMPOPWMoJZmKTwm+uP7HmvLBtzon?=
 =?us-ascii?Q?N1V0zHz6DkxFjLtW2eEfCvzU125gUzBL/OML2PmNy2Tm/1YUdmOpVApwDnko?=
 =?us-ascii?Q?O3zoeH7AP8i+83HSBZwTHb3KQkySxEfCVIcgrNvPXPhtIECj77KBbYK4eXeu?=
 =?us-ascii?Q?EtAP2gewEc+2x41T3QHHz/EZwkFvtuaqySdVQwKGyvNOVL0KbUriB/K+kJYE?=
 =?us-ascii?Q?apI3him8AslXkzUkicUM8OBxUxc2mVgr7SxtV5rq+iFzT9VjMdvwrT0d/Uyv?=
 =?us-ascii?Q?eWEegQXrGUk5CcfFGB4AERavCmierLhJGIz9GcVM+0yTpI2xh9a4yfaKqrX5?=
 =?us-ascii?Q?2MyrUw9CY53xL2DJxtwKqqBtheWEiisfOMQJ8IS3e3SldU1QH1IDEhczqKxA?=
 =?us-ascii?Q?lWj6P0imG8XNdwqC5aN4voMhsTD5wHaBeQ60cqcVuYLLmzX1FCBy8PGTL0jv?=
 =?us-ascii?Q?UAlE3+1axeI6nUE1Fna6w22PylPbASRsn5nrjjDCcqY+fqRIyxjGiQ3xWOzd?=
 =?us-ascii?Q?P49kNGOksEZ/u4BpdVT/6jiNM/bdLE0ESNstgHQITkKEeNZoIkY9EU90IdAU?=
 =?us-ascii?Q?ULIq9KNWpa9uEG6IU/50E6i4RtJP+1bdWj5HpX7WidWk/P9Sz8riNaIEfbVf?=
 =?us-ascii?Q?haGQ7KRMvKN+tbsq2wjt6SmnBUXFmbb/poQX26VpGKGzZQSJBloA3C+R+5bc?=
 =?us-ascii?Q?IyyVgiMNQGMBbUcSTyetA4IqpiLhlhQO9YGLTMRS+6McGM8lmQ5CVfO5YAl7?=
 =?us-ascii?Q?2l37fH4qQzSRoRsKFNig3pkVYU4ImG8iyC3FkXistA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dgXCC9nqTW7hMv039cRR1mc7cA24qiadHC8NkdtpSZmVHQcviL9dJeapd4qN?=
 =?us-ascii?Q?TzC1zfAf6VTuq+Yvi2RinS+tgS9xgpncwBcoaFEsmcUv3h31/93oUOAOtFO9?=
 =?us-ascii?Q?daYoKSfjRXDnmfd51x+HMtGTh/Tkw5zWzy5MlRLmTg9VWOF22VgNGOpURnY7?=
 =?us-ascii?Q?/8pWth2eXN/GFl/xBJvHOaLN2LDk+vRW5iH+oxiI5cyNPrdTYTM9SBtntVg4?=
 =?us-ascii?Q?8IhH7zqurzqxc+SqIV7gKrGeihHhQJCQKul1zPJee/SkFTftHd5U+JROOhc6?=
 =?us-ascii?Q?xfaN2Fi4P7+Xem18xektobFPwGfYZjaFVyJkVg//ZSRl504wf/hm4QD0H5VO?=
 =?us-ascii?Q?JO4WGs7vXdqJcUfIFpGpixQdrZ8zbYWgVBG1oHYldo7v9KjsuojNoXEEXUWX?=
 =?us-ascii?Q?BA2Qu9PlLs8V2JIlt9KbqcRWTWCBM4jmaiLPY00dbqCrPC2omWxkVxHUPVe9?=
 =?us-ascii?Q?lG/ywwbx41UQvPExZh5p+A5UiAU9g6StgfMgIftANN+czGrXZPZyBiMvlgIk?=
 =?us-ascii?Q?ORW8hx2VYDxmKqJPVbSijB/NAjzKqd+jv03PPXg3TahfWmB453o5S68tlF1Y?=
 =?us-ascii?Q?FzMXHMwvw2JM0oaMiwNC97Dtuj6GZzzBnI+6kCEoGQCIqmlLyB4Y5+0LhWOs?=
 =?us-ascii?Q?OdzpGCORfdj/1706uHyV18H0oQ7Pe2c6lG5qO5u2gO/gu132vp+0oLSmqxVa?=
 =?us-ascii?Q?Bq+hMkshtryTuTwKvE1rnMMAPQiL58/ebFacL9xkuxfhAzYWPHzWdglr9pbg?=
 =?us-ascii?Q?g6uzE8NEIM/M8fuO8oDTOraIIvtO1Gl6BQx5YdpM586v7xIENZZlbZO043sk?=
 =?us-ascii?Q?UdQfJ2QkXD61O5DGLiu+SGg500PXvutYPkVJXz5mOaBX45bidVCFKFY8/+7S?=
 =?us-ascii?Q?ibw2us6OwtAmX/n1q83BMyvqBUyAkWdTlRC7x5vCif1ovf9hfNS3RTOTGAyH?=
 =?us-ascii?Q?APBvUHb7db4iH8aG8XZIjDH/+cWDm3uCXIkjli5Lw0I8oFgoMr8SCssj0Rk/?=
 =?us-ascii?Q?tQPKTdoPFVQim5hhMk+vniy7RwVoBBT0G8DK3xJOjAZuKz7tWIOm7dsQoB27?=
 =?us-ascii?Q?I/y24oD/Q43QDpseDQO5rFC0GVTGc+K/fCJSNR53ScvKmwkaDf14G/FNNi6V?=
 =?us-ascii?Q?pkXFAN/m3+WP9nhgHNW6MdEBlf+jeK+p4yN5pOskatEwCwD0cFt9A9CHGjIs?=
 =?us-ascii?Q?zotcogfbudeK+lBj91ZqmqM8c4xlT+7bxBCji9+1CJIOVKkT0epu2fPkpDnG?=
 =?us-ascii?Q?HhNx66e2zukR7bj5XmKoU5syYbplRysGb3BpjqtWNQAFgfcB+kwXruAuiarm?=
 =?us-ascii?Q?7Eukwt3MotWw4itKs2exQHdYfnamOJBr0Dg1EWm5mA0v+ptX0/HGQxK8cggQ?=
 =?us-ascii?Q?GCKkTIas49ntkERNIt2uf1kmlVlXEqXCwKR6/gmlTjxfKWntXGHAqae+Sifv?=
 =?us-ascii?Q?NI5LsTNpmR8heZH3CPEYlmnxm3VTZL7RumEndpHyoN7/dOThs+CG2iCmLqFo?=
 =?us-ascii?Q?DjHPZeMghgIgju38Wvf8xcVdolagVxgGAs95jenHLpVWSmovLBTK8JxQTXUx?=
 =?us-ascii?Q?t7rpnJ+eXW6vY+hkc6AMLv0pbia6d2mfyTPQTIlRHnMF3WQCCGbbjnckKxS5?=
 =?us-ascii?Q?ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 69b4a397-08e3-4a83-6565-08dc73949fab
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 21:35:35.2874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v1FZMIzZdcd378IMeYnz+R/kartOCNkdLLhDarEPaL7K5pJtFWSwS1SgW25CRU3wdVNZmHjeJtmqdQImHWVbYzI+0Z56xWMP/gAxGaVv98U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8425
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

On Thu, Apr 25, 2024 at 11:24:06AM GMT, Lucas De Marchi wrote:
>Not really used, it's just a copy of engine_mask, which already reads
>the fuses to mark engines as available/not-available.
>
>While at it, use XE_HW_ENGINE_BCS_MASK to span all copy engines.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt.c       | 3 ---
> drivers/gpu/drm/xe/xe_gt_types.h | 6 ------
> drivers/gpu/drm/xe/xe_migrate.c  | 3 +--
> drivers/gpu/drm/xe/xe_pci.c      | 6 +++---
> 4 files changed, 4 insertions(+), 14 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index e922e77f5010..00a22cf2f5b5 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -515,9 +515,6 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
> 	if (err)
> 		goto out_fw;
>
>-	/* XXX: Fake that we pull the engine mask from hwconfig blob */
>-	gt->info.engine_mask = gt->info.__engine_mask;
>-
> out_fw:
> 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> out:
>diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>index cfdc761ff7f4..72568414fb7d 100644
>--- a/drivers/gpu/drm/xe/xe_gt_types.h
>+++ b/drivers/gpu/drm/xe/xe_gt_types.h
>@@ -116,12 +116,6 @@ struct xe_gt {
> 		u32 reference_clock;
> 		/** @info.engine_mask: mask of engines present on GT */
> 		u64 engine_mask;
>-		/**
>-		 * @info.__engine_mask: mask of engines present on GT read from
>-		 * xe_pci.c, used to fake reading the engine_mask from the
>-		 * hwconfig blob.
>-		 */
>-		u64 __engine_mask;
> 		/** @info.gmdid: raw GMD_ID value from hardware */
> 		u32 gmdid;
> 	} info;
>diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>index 9f6e9b7f11c8..59a3f24d31e6 100644
>--- a/drivers/gpu/drm/xe/xe_migrate.c
>+++ b/drivers/gpu/drm/xe/xe_migrate.c
>@@ -936,8 +936,7 @@ static bool has_service_copy_support(struct xe_gt *gt)
> 	 * all of the actual service copy engines (BCS1-BCS8) have been fused
> 	 * off.
> 	 */
>-	return gt->info.__engine_mask & GENMASK(XE_HW_ENGINE_BCS8,
>-						XE_HW_ENGINE_BCS1);
>+	return gt->info.engine_mask & XE_HW_ENGINE_BCS_MASK;

oh well, stupid me

has_service_copy_support() means bcs1 to bcs8, not bcs0.

Lucas De Marchi
