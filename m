Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5480FC76196
	for <intel-xe@archiver.kernel.org>; Fri, 31 Mar 2023 22:28:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6AE210E2AD;
	Fri, 31 Mar 2023 22:28:22 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B9A110E2AD
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Mar 2023 22:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680301699; x=1711837699;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SPYWizZrJvA9Q1PCuyl1QWbCqeWSHiBUo0zrPOX1nk0=;
 b=iqauB9ETX8kIpl93ThGuTSpBXrNRpmDWmrJZLIqEIdVg1J3zSevZWLnR
 ODKtqEXXC0gYsr1UOHN+vOGFBzXCQfiUzRiVlkv1LTVACXNADAq8LZQKH
 gzmIhrLmZsnFG0WUTr4/AI0YC0cID17aEehWYaIMrWrPHRBjxLh3/9Dg8
 ej2mv/+/0KdriWgdzbMxaSOcJFUQBY/izGNxZGkFqgup4thlcv6X+qQ8Y
 RZXV5XI/cdckmIxk0brvUmy9oGErhglmIdenXp6fyHxQxUPmVc6ZbK4yJ
 1+/vYl0fk3OTHiaQhhS8cqbNCzldHd5WeRJP4I5DphYRKsSD2i5tn7gn0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="339065323"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="339065323"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 15:28:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="685254639"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="685254639"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 31 Mar 2023 15:28:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 31 Mar 2023 15:28:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 31 Mar 2023 15:28:18 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 31 Mar 2023 15:28:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n3WnKBvLEPMLT/HYRkGbsi+TmjkeBI/lZuhL+vEqx2A7lqBiMwdcIjx9fhCXSNd1rA12TFeWkXjnEbh+wkBYDZCL8f8vQXGITfEwvy7LZPY0MMWywr8Whm4yfI1KakiSoUF1SWDy5CNQnhqj55wDD7vu+QGl9aajMJU9PAKfzgBPsktn6FbiM/cwGRuRhh2OBrc1yKqs8NRp3R1tadJUS9jGwNnpN8nN5yf/rO9wua+sRFojEXW6kb4A0wmpnbFnE04YGQ+2dYtag7H145ZnvOSY0cVau9FQLrzgrMDsssI3DFEsinpsb1e4j7TtEipVXZho89SpTrneKr7dIOjmOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z3pxI8pVOhsqDXi09HOltSS1HQi0ee+i+JAtIaa8ojY=;
 b=hciG8WSboUofUrSW4abkYnQ5JZpUck5P9W9DP2BI4RPzNILr0M3o0nzoqoWcOjICyZvprZB/Vvoyvxt1yuKx/yedkFf4hrEJk5+ZcORE+vfug5T+74nRTDQvRegmJIL4lz3jbVy71frEm3QEng+Wxkcssm1zXMnvfgenN8D6mPFbB5MKiwq3D9fbn8oWsetJp8cXW7cSiqEHI+hisdI2NgdAAGpsYNra2Ip/qqh6vdy7JU27vytFh5+yhvdzdFI+0dWcOHeQuARzVeV7XOJknNDJMAkz4D842mAvT1SXzRC/zn9qk8eguNqgXTfrvvXw58NDAu/AvbnZoVnShJ4ybA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB7954.namprd11.prod.outlook.com (2603:10b6:208:40e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22; Fri, 31 Mar
 2023 22:28:16 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%5]) with mapi id 15.20.6254.022; Fri, 31 Mar 2023
 22:28:15 +0000
Date: Fri, 31 Mar 2023 15:28:13 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230331222813.riepjldvnk2wy7hx@ldmartin-desk2.lan>
References: <20230330182405.43993-1-matthew.d.roper@intel.com>
 <20230330182405.43993-8-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230330182405.43993-8-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR13CA0011.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB7954:EE_
X-MS-Office365-Filtering-Correlation-Id: f9794a22-b22f-42d6-eabe-08db32373876
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H1NkEOoz6y2FOXWNgtt+wit1q166gVsxysZ2xuMxcFn0AB3kNFuxbfGyE0WUw2plN2r+88HxFKqcxHePpPWNXcXVXcTU+uPsMYoLr2j/7LJnFCAaoiz4ajp6Aa3v85W+UfQH2jIKZsvujiP+x/fbCQpa7W/O2lgRmKLDrfBKtvZttlZDkIZBODBVLetCf/rAu84n2oU7BV47ec8qrqYYXku9D0opSuqUwye1Yfahi24zFJmmV6I60m/AVUUDzU8u2NM+VHPX0unCwkAd7Kp8gqqY7pEM4NvgU93O+173H3yrmcK0FtmZviL+lxtyqeRoGxgvCz8GJoR1UXtJNx+voyqf8jdTs4rIoLNxltdjwLDfwtOTBk5xrxFgBns99QGBw8951okyoFdwhLe2ysPBTTWnzzTbIgvqLuYeNoqDgV1L4x9rOJpD+6cnz1Z0njwBn7CKdlmM6rMR0s10kEvHY2Ub0BdPqDM5jBdBRr+JT132mKAHvUmZbTu4GFdZMEqq07J6Y71UtRonXSZdGGhrejtrNUKseui3XpAmNQ3RKbUSQlgAD5unsyQQyBDOzqmP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(136003)(366004)(346002)(396003)(451199021)(6486002)(83380400001)(6636002)(186003)(1076003)(316002)(6512007)(26005)(2906002)(6506007)(478600001)(9686003)(66556008)(8936002)(6862004)(38100700002)(66946007)(41300700001)(82960400001)(8676002)(66476007)(4326008)(5660300002)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Y39PS/4lVGZ7/Z7iNfg8a0WFZ5iGkC37qt6uWVN5fqjWzEo4f+ILgx7NzedK?=
 =?us-ascii?Q?EVjCp5POsYWDgIaG+QBd+9gNMiTpuCGOBOVcWiVZ4T3ZPaedsjBBf5Y14+Yc?=
 =?us-ascii?Q?lO174R5bzz82XARbGEA1yNdARBw0a/yLM3ui6o+0xL9F82NPgjXbJVECEifg?=
 =?us-ascii?Q?asfIbCuIDb3w/bakjRxbJxjwdz0Qe3KlPCXdNj0/vRh258GvVDH7MiRntw3d?=
 =?us-ascii?Q?dZJ46CoBEcu9OaWINFyCmieW98PF2tTPfnoywd3jS6MvEi7Sm2vFJKtN6zr/?=
 =?us-ascii?Q?cy0vCIpoIDkjz9dZad1ZLrIu3LRcUAl2cHJ5DynHaa32N4C/mxkK0nTqIQiB?=
 =?us-ascii?Q?mOuXBd2bd6zTIaQMsPoXpeDelYdbkMENNnNcNhggfkFIvCedSWtgtXc7ZN0F?=
 =?us-ascii?Q?u38TQThvp6FvZIVjacB9u33d+65rc24IvdbniQq1QC3P8TAzT15KAr0WVdVs?=
 =?us-ascii?Q?MUZ+vU2VEzKXO6qRYbmtmP9GgkFuZaps2RL6EMbjzVbSTiyBY1T9n3PMcVPY?=
 =?us-ascii?Q?3UlJt2VerZyM9Zs2pEUUgaCymD9EU6qhAlW6x0e05Z/jLRnw7D+boPTF2PsR?=
 =?us-ascii?Q?9WV2cZK9lrkS0tEUUJHeSskxhUTmggrtdMozczKkKIODy+2l6cpRcbMYYU2J?=
 =?us-ascii?Q?zDMEl+p9glK56LGJRMddvMxeJxsa81k9xoRhJZBag5syNOh1TTsLgH0kUFWB?=
 =?us-ascii?Q?BQYLoH/ikfgYmYKPAsdKT3qD4s5zYkGaK9Z2TVlmjz5QxGVLb/OA70LxxWRW?=
 =?us-ascii?Q?WtaawAaeHWvVsm0BH2q0oTJutsw70ShfEvJK0/YOSocjAk4NsAPoDzN5C9eD?=
 =?us-ascii?Q?FVshFO9++Xyn5j+IbGY8Tjexp8q3QZtmE0gp6afA6Hpp96F+AEJrorBLWnjH?=
 =?us-ascii?Q?IfkllPDEDD4k/Fiq0UmhW5AUynEg27GXu15F42hvvaDW80pJ4pCYUzI542Ca?=
 =?us-ascii?Q?B74aEtBg9OzDabQvOd8BYymAclOfj89BVYiPRkKmxXAhA1H0NobG1AJQw7hm?=
 =?us-ascii?Q?8YnIhDxij4pMth/C9MumLI+D0eXSUZ24YudTXJk6N5xdHnZFCaeNWtnRB09d?=
 =?us-ascii?Q?JZn9Ct0VYZJodB5qdtohWSNB3zifVQavQjBCV87Bkw0TMnwHW2pDoeDtVB3m?=
 =?us-ascii?Q?9GDrGZz/Xik2SScrorS4/GnzKX4wtR5MiysJTfoKkN8b36wq4lFCALzvKv2x?=
 =?us-ascii?Q?trmBlp7SI1gBwIhc4Wab2ScxBlUvTOO3XhG464cX5GHoSOmk0fzHrxzzk7DY?=
 =?us-ascii?Q?v1makjt1w/HNk+Dyz5j/Jm6mjoXArEhtyZUDEgKYeAjhBZHiCtdLBdPTM2Zo?=
 =?us-ascii?Q?xJy48SpxWtEOiwERJHmL3sagMmmW6+rnc+HSms6q3pKroCL+ANpGatpxg15h?=
 =?us-ascii?Q?qtqmbnvykZxUdhp3WRptcNLJtxG32m0yBw0c5WgdjYRk5kjYYSFu5M82DSJy?=
 =?us-ascii?Q?2LTviQIy6qAq31dSvyvA1yPEmjEIt+2wh6Mj2Rnb9AOb46ynUEDksShV78n3?=
 =?us-ascii?Q?BTAfmgmigd+scPGmDMBLQL0SoOHJyq8nYra5SiMyFpTz3gelSWuF5QOvjTPR?=
 =?us-ascii?Q?XDJjbfKMLPvUxY1IEl2Wvh87n4Xkpenw7wY1ek4Q5Nrd3PFgGai5VLujDU5w?=
 =?us-ascii?Q?2w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9794a22-b22f-42d6-eabe-08db32373876
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 22:28:15.7293 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ojJn2xa4BQf/dyDvadFXFy4G/fwat4t3qiN0BuVgdA1r4/658zwI5jCoedPI8Z1z9AwOMP72QSIyBiWDZZLNP3gKMETYXxWJmox0lSiCkOI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7954
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 7/8] drm/xe/irq: Drop commented-out code for
 non-existent media engines
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Mar 30, 2023 at 11:24:04AM -0700, Matt Roper wrote:
>Although the hardware team has set aside some register bits for extra
>media engines, no platform supported by the Xe driver today has VCS4-7
>or VECS2-3.  Drop the corresponding code (which was already commented
>out); we can bring it back easily enough if such engines show up on a
>future platform.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_irq.c | 12 ------------
> 1 file changed, 12 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>index 9fac03b63e7e..02292e60e52c 100644
>--- a/drivers/gpu/drm/xe/xe_irq.c
>+++ b/drivers/gpu/drm/xe/xe_irq.c
>@@ -143,13 +143,7 @@ static void gt_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
> 		xe_mmio_write32(gt, XEHPC_BCS7_BCS8_INTR_MASK.reg, ~dmask);
> 	xe_mmio_write32(gt, VCS0_VCS1_INTR_MASK.reg, ~dmask);
> 	xe_mmio_write32(gt, VCS2_VCS3_INTR_MASK.reg, ~dmask);
>-	//if (HAS_ENGINE(gt, VCS4) || HAS_ENGINE(gt, VCS5))
>-	//	intel_uncore_write(uncore, VCS4_VCS5_INTR_MASK, ~dmask);
>-	//if (HAS_ENGINE(gt, VCS6) || HAS_ENGINE(gt, VCS7))
>-	//	intel_uncore_write(uncore, VCS6_VCS7_INTR_MASK, ~dmask);
> 	xe_mmio_write32(gt, VECS0_VECS1_INTR_MASK.reg, ~dmask);
>-	//if (HAS_ENGINE(gt, VECS2) || HAS_ENGINE(gt, VECS3))
>-	//	intel_uncore_write(uncore, VECS2_VECS3_INTR_MASK, ~dmask);
> 	if (ccs_mask & (BIT(0)|BIT(1)))
> 		xe_mmio_write32(gt, CCS0_CCS1_INTR_MASK.reg, ~dmask);
> 	if (ccs_mask & (BIT(2)|BIT(3)))
>@@ -424,13 +418,7 @@ static void gt_irq_reset(struct xe_gt *gt)
> 		xe_mmio_write32(gt, XEHPC_BCS7_BCS8_INTR_MASK.reg, ~0);
> 	xe_mmio_write32(gt, VCS0_VCS1_INTR_MASK.reg,	~0);
> 	xe_mmio_write32(gt, VCS2_VCS3_INTR_MASK.reg,	~0);
>-//	if (HAS_ENGINE(gt, VCS4) || HAS_ENGINE(gt, VCS5))
>-//		xe_mmio_write32(xe, VCS4_VCS5_INTR_MASK.reg,   ~0);
>-//	if (HAS_ENGINE(gt, VCS6) || HAS_ENGINE(gt, VCS7))
>-//		xe_mmio_write32(xe, VCS6_VCS7_INTR_MASK.reg,   ~0);
> 	xe_mmio_write32(gt, VECS0_VECS1_INTR_MASK.reg,	~0);
>-//	if (HAS_ENGINE(gt, VECS2) || HAS_ENGINE(gt, VECS3))
>-//		xe_mmio_write32(xe, VECS2_VECS3_INTR_MASK.reg, ~0);
> 	if (ccs_mask & (BIT(0)|BIT(1)))
> 		xe_mmio_write32(gt, CCS0_CCS1_INTR_MASK.reg, ~0);
> 	if (ccs_mask & (BIT(2)|BIT(3)))
>-- 
>2.39.2
>
