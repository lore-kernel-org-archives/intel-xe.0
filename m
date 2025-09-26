Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39893CAC5B8
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 16:55:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE99D10E058;
	Fri, 26 Sep 2025 16:55:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IIRDscQv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54CC610E058
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 16:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758905747; x=1790441747;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gneD5Ol8IZPJhColQzvY9Jd9td/yqb4kaVfrcG7SnTY=;
 b=IIRDscQvzxHQBte3rfrF9RlaP4YgkwExli/3+dJI3h+xrhkEDOArb7uH
 wiT/of6fd7YklxHneR20Jmtv3TfEGuU1vnbC5xN3tA3iYSO+mNgiVrshQ
 wuUeEiLTxIsxVOlPo0oH/SFwzcPZ1of5JYHtjKy16A0MoAzKRWfJrsAHj
 ThysiHpurhSAukb2IB+UbHldEQf2awCDGp4wYiK/qe5OgWhLfqaLLsbvm
 4tLtZcUKjzKcv3cGgEMOjBtpT25ftyS5txaPzev4c5DZ26EgyJBb+Fclp
 RtJXbW5OyWlNZH9CMXNFO6xNMnlyiQpsgdK1bXGCqBtVgJGPUUL6G3J+C A==;
X-CSE-ConnectionGUID: UdM/dxkjQIu4AqGzE8xzfA==
X-CSE-MsgGUID: kiyTg+JdS1KqthqThJ/a/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="61132018"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="61132018"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 09:55:46 -0700
X-CSE-ConnectionGUID: TjYo5efVQUW+Its+8mg3vg==
X-CSE-MsgGUID: lG+Sr1kOQl60EO30V6oNmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="201353480"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 09:55:46 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 09:55:45 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 09:55:45 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.6) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 09:55:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fLSg89uTZZisKS0ioafNW47f9oSOigF8/zvWB+2meF7/buj8LKgUgudEzf+S4p0cG6g1TFhdQukdHECLn16JmgAtrFf6xMzKutYOPOvvhedPPYE43SrePYeXYU36BvQv3vwIWjVxpnnq016/EuIUyGurVYpB/aLVMFdk11BLg5+fOn6EDdypAjgHAVRdTV0/3RKGJRyIDZ4wA5ANad8j28wePdbwLE3c1axcIUBJm2IVXzx4lsE9IbezZ37RE/mugEm4x7jpn+gz7IEiyJYHmko4qwsTwpDOv5CNIoInuFydjTIZuhurmPDAZ6eeS9Bvh5JJGcjOc4iZrNuPY4hQdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VALlt7c0bgyvkxhi4Ze4xsAh3wyw9TweM3wf/quLOVQ=;
 b=KWhTVUoh5XHWxoMAC1rQs73xXwwSJdtzsrbEv1wAFtkOSZ5owBV15n7BD0hw06/I7ifSJrlZ9Nm+34n+MPlMC9PYYRvVoVgW1JghOpIB3JmejuWOgk4pv0w2ByN7wdN9Z+F0CgvFlM3tAKibbnDofJZs8kjPzTGjTR7+HOtTtQE3xzdoTR8Z/a+ocrNQOjRyAR3tmx/vvipourBk/VZmiI9mGQPvddeLz4IXmjH4eJFJqvPg68Goj/XVTU6Ox9nT53ycNz444OJXDDZ9prG5fj+OhlTYZAP774ZzRxU954FMrrjIxQSr34imADgku22H6gUkccwIeClb2BBOX3d3KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7580.namprd11.prod.outlook.com (2603:10b6:8:148::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 16:55:42 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 16:55:42 +0000
Date: Fri, 26 Sep 2025 11:55:40 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 07/22] drm/xe: Move primary GT allocation from
 xe_tile_init_early to xe_tile_init
Message-ID: <ogkznftkc2nobvkepiiszhtqsz3ulybw65n7ye6tj57hiorrry@ns65qktzjkpy>
References: <20250925234628.2112163-24-matthew.d.roper@intel.com>
 <20250925234628.2112163-31-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250925234628.2112163-31-matthew.d.roper@intel.com>
X-ClientProxiedBy: BY3PR05CA0033.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7580:EE_
X-MS-Office365-Filtering-Correlation-Id: 0da9c0d6-9b1d-4c98-d13b-08ddfd1d8789
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JMi9hBhd2k3f+LRz8IoRm9VNRZtvZHJNFYh0//MJfAKSTxgG1+3y5GNUDlHV?=
 =?us-ascii?Q?L+iYS5rWPT7EMZw44vDznoDGK0BB5E6dXQeBqaWQfeskC5tmL+cUupDIEPEA?=
 =?us-ascii?Q?hxXYMGj5Vby3LVUNX0Nn38z4GVN+YUubgl5tQtULO2v86DCjhaHfg3KS+SK4?=
 =?us-ascii?Q?ZYKZWVtQqE19c0xgmOT69JygaYkUoxFwzmZCQZpHjGRcx2+KQ9ArEZXgAgFi?=
 =?us-ascii?Q?IB9ZeaG9ipfeDsXeogcFELsabYTx1yD7X8T5J23sASgjGBaBQ0ApEJHr1pUs?=
 =?us-ascii?Q?J1X0Yw5Nq60w4pFTi5rCM/UJnQf65KdD/Rp2AM043+b660Jz49UuwAfHnjfn?=
 =?us-ascii?Q?Kn6i3A+NLgHu3X/3e+xc5/4AUN05pN19SwZ9Myg0a3gbC+D4k8W2vo0nqQRh?=
 =?us-ascii?Q?E9Pq+p0d0Uj3EJUvoEqCorRYtSi6ZSOvvAHrJXxR+Av0auNiOa3n0owbxlaf?=
 =?us-ascii?Q?iEFwGkXXplLiLHyE+dXI1Ue/lCdUuPsONDgereke72m6Vj5g+TNH91m4gBsF?=
 =?us-ascii?Q?iix9v82zC/2rTeMhZbc6tpLHUx4mWlo0do4rFKU12MKN2WWTrdLPXdzyWXFI?=
 =?us-ascii?Q?bdh6CyJTLVL1t11zQkawTgk4aNHHtcnjMUfPMxIV7Uga9g9W4LJhoxUuqo5Z?=
 =?us-ascii?Q?BUDIJXFZct1Xlsa+rqTrWvomif2Qm7pEKgb7bwjXzSZ2WlNDgmCTquS4wqa7?=
 =?us-ascii?Q?gXBc8ZZKFvTzp65FRJtQEmmbIxQYEhY771sLoX0sfgDHp1gDoWDMV7FItGm2?=
 =?us-ascii?Q?CkrjC1IC4rWoxxVow9Fhaej6MWuIgrB6MfFeoZWHBrbQBIlnZ/lJDX9hw82S?=
 =?us-ascii?Q?fbRo8z/TUsTeqUBLWViDXr/nEeRhLMBPaduN7cP/9fFjhgH8u8hbeG+osSgu?=
 =?us-ascii?Q?qYAyE56EZQMd7rEP4hqd0HpybVvpKfkhzlODqGzMlwiTDeU5fHQdDEY6veIA?=
 =?us-ascii?Q?KH1jdpH030fDjHPNPffI7YiAoi/mbbgQly+sMLF0AzrwgDiX14xopicNE6Bq?=
 =?us-ascii?Q?tAUpfsGLdr3VYCU67rjDgqCyjr7LZx9BeTxIsO7TrBlElJ/9vjv/j52OsO3h?=
 =?us-ascii?Q?vdt3Rr+Eja7ZlxPVOR7llzsiMp5Q/CGbQkC5yjkGH1QaGce/pPkWtcoFRRn4?=
 =?us-ascii?Q?lnXCD7pYf2Bzl8MhnReKlApDHPh31RmWfAyFBRAHiujlc1wF/aqEB2caJCXu?=
 =?us-ascii?Q?jTIvRAKkR27bian6k/gSWJa9OOJgHWuhSxCq4GulkxnkTaEF4c2MB0DLTvsE?=
 =?us-ascii?Q?wXhq23IE0oDeImxLKTW7dgIMzYODY7kVfj8VlIVrurSdxhh5PHiLKDdK4KrN?=
 =?us-ascii?Q?NJ/yqzbEIIOoYZxl2/nvCIxe44JZAuUEHBADzCXC8iveuST/t+fqbKtEAPmz?=
 =?us-ascii?Q?mAZw7hOeXGuDJVEdRoBqFMZ2J+GpOa9zmC3la0c4PEBd48k1l2Jb3zHxiPSh?=
 =?us-ascii?Q?Z6mrGAxFbPOPAPqeD2Y5/jB5/zyt17F7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iBiUPzpIWbFslq1XWsH8A4f7n7h3E+iYZL9nhFHGfKF7HH857ee+S2o2UxaO?=
 =?us-ascii?Q?KFVmuSHUQlRJ/p41g95fL2jtc8FJxH7OrcPBgp5248EHowvOeNC9ckQnIO+l?=
 =?us-ascii?Q?Ga/dIoNpDj+owslfLsOq0/z2IVFxFECA+jdnDKpCXmPjX9z12lNJaDcXHyeZ?=
 =?us-ascii?Q?57d0+iP2iaBZwz4Dj53iOR4x9WthcNpqcOZv1KXXMN5P2JLgVzQwlnXCjNEo?=
 =?us-ascii?Q?BZaZZ72wgJ7QpynbNkQtQEfDhHJTTQwYCP2u6fYFUxWcxr4XWchz80SF0akM?=
 =?us-ascii?Q?SbKZGjHToDxQKIlAJWtvAtGpgU90Wn9/bf42AYsvDIhP5pVGvSFfUKJVdFUE?=
 =?us-ascii?Q?2IBdxD031UvSa+VE8QQtUF4csTmL8uFPyALyKxcwqDEgajE2IXVbJ0Mk9tBY?=
 =?us-ascii?Q?o04JolPLTbcp5Iojv/SxCvetsEtpTE8BG2Qj3ro0QjJ4dxo+1kyCXKqe/N9s?=
 =?us-ascii?Q?eWCpKzUApAD4JjVCF0zMomkzdL9s2AXzWyN6t2n6AkyAnWl6ewvx0kd4lkiA?=
 =?us-ascii?Q?Xit9qAIMK2CiNAkDba/z4UBw4ioi7NPelRYNla0k9W5lMJ49nj3K9Mg4Ktjm?=
 =?us-ascii?Q?XwaWS3cklcEhfhM8mZMMmWw6tfl1Hd7U39HN1gtmh7i5h4mkLxKG9l19OWdE?=
 =?us-ascii?Q?Y00QdJmEyGaOwsZxwBYcdq7Kpsws4CRPceUAf4ICC2AhviGWM0YCHi/9rjgU?=
 =?us-ascii?Q?/d5LladuppadOsYnOeqME0JIT6+AHLaxF48+Luny1MI15C0hoG91XfYmB3Hc?=
 =?us-ascii?Q?ahd1NT5vCIwh37ugE5PH3+IZRd+bt0bzfBkV3vbIA8F7UteBVMrCSWJjjvV6?=
 =?us-ascii?Q?pRev9+34txdEd+Joe9IYh6iAnhCB0M22s8XhBQCEgNfhdvRavCPIELwyGxbd?=
 =?us-ascii?Q?CLDkAI3z4Fvzf+O8L8aIErjLNwtzCEb2/gk2+1165AjQgSIUDszdtSY/9vI0?=
 =?us-ascii?Q?+8dbKrRNKqoE6SahT4CVpOQTa+h3psKBlU5W4za/7Pm13lucoDw4+Hp1vCp0?=
 =?us-ascii?Q?JAZUXCUa5zj/wp7SbApc8YX6ot6+ARVxkPH/e9r5izowlBYxqsGXntErFtKL?=
 =?us-ascii?Q?SziMSb8QCqLJpyJNq07v0iClxxFTPN68oUOka88f0NZkdtKuYYNyon2Pbimz?=
 =?us-ascii?Q?eujBrD0cbFXvbAixWEPWy3xmwAlIGU/wpU+nPbGh59sJsP93TqnRGH2aJmne?=
 =?us-ascii?Q?eGrhlDTXkVDLKbpQKJESIVnEhfyY4/FdrcZxhlsASx+16miH1VErlYnQmJeF?=
 =?us-ascii?Q?xExyXlK9YJE/CgreCqYc5qzZkP7RNLw1knj/DtJmQDWYHv8TK8BjXo/lLwnS?=
 =?us-ascii?Q?fWka/ICJGfpUCqhQsbwM9aFTxzfTRqubjZG2cJGQlWOMxMv7KBdBbehujhKH?=
 =?us-ascii?Q?ypmlwHV9+P0H0hTHSwNFASAWO0q/lndxPv60CKkJQwMIxtqp6elzTLHJcgEE?=
 =?us-ascii?Q?c1n3tEXflV6latXQ5bTLC7hRWjmS8Av6YDK+vx+GcI3dJTyBSPRNc8OxApHH?=
 =?us-ascii?Q?Y/C4hFAUj/EtHzYrM9PlY4fbTUGGrhu77/3qWkQvdF7vFMeSMPhA7oCZ2qCP?=
 =?us-ascii?Q?NrH3CCoOo9RQgae8shbR5KOu5olyRCwnwrM1THNcnWPv9LALhl3oV0YQZs32?=
 =?us-ascii?Q?uA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0da9c0d6-9b1d-4c98-d13b-08ddfd1d8789
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 16:55:42.8095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q8ByrNAoLgDmL9SdMgtbG9WQkEYjzw0IStIffg+YYODB2CmwEdB7tlwBuYv6GSl7MjAQV4K7hUWfPzv2+fXhPoPCF824MC5TpV6zpvjtyY4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7580
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

On Thu, Sep 25, 2025 at 04:46:35PM -0700, Matt Roper wrote:
>During the early days of the Xe driver, there were cases where we
>accessed some fields in the primary GT's xe_gt structure before the GT
>itself was formally initialized; this required that the structure itself
>be allocated during xe_tile_init_early().  A lot of refactoring of the
>device probe has happened since that time and there's no longer a need
>to allocate the primary GT early.  Move the allocation into
>xe_tile_init() where GT initialization happens and where we're doing the

     ^^^^ typo? I think this should be xe_info_init()

with that,  Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi

>allocation of the media GT.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_pci.c  | 4 ++++
> drivers/gpu/drm/xe/xe_tile.c | 4 ----
> 2 files changed, 4 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 976002aae301..bd21940a6541 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -745,6 +745,10 @@ static int xe_info_init(struct xe_device *xe,
> 	for_each_tile(tile, xe, id) {
> 		int err;
>
>+		tile->primary_gt = xe_gt_alloc(tile);
>+		if (IS_ERR(tile->primary_gt))
>+			return PTR_ERR(tile->primary_gt);
>+
> 		gt = tile->primary_gt;
> 		gt->info.type = XE_GT_TYPE_MAIN;
> 		gt->info.id = tile->id * xe->info.max_gt_per_tile;
>diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
>index d49ba3401963..10545654f9eb 100644
>--- a/drivers/gpu/drm/xe/xe_tile.c
>+++ b/drivers/gpu/drm/xe/xe_tile.c
>@@ -149,10 +149,6 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
> 	if (err)
> 		return err;
>
>-	tile->primary_gt = xe_gt_alloc(tile);
>-	if (IS_ERR(tile->primary_gt))
>-		return PTR_ERR(tile->primary_gt);
>-
> 	xe_pcode_init(tile);
>
> 	return 0;
>-- 
>2.51.0
>
