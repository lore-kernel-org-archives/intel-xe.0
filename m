Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2524BC54E58
	for <intel-xe@archiver.kernel.org>; Tue, 26 Mar 2024 00:17:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD53D10E1F1;
	Tue, 26 Mar 2024 00:17:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bwgf5eeu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C26D110E1F1
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Mar 2024 00:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711412268; x=1742948268;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZE3mJzSNMInFzl6hKBT7ZPnuMbc4iNlXqqwNuDJqd4o=;
 b=bwgf5eeu0efZKvWJbJODPu1iWFuFgSZxEg8phvTtz813k0cWdXW03K/1
 RiuMH43OFPvIeE2AhoeRbLWAUPCkuNo2Ctu0tIKOhUZjtW8UqZsflV6hy
 hXZ90JTzxWITieI1q7CFbpMAWddmdkP8/4SMrv4QnNB3Dc5qMGYyFrkuf
 yL72ENWUaNNv01SeynWsuTldPv2vkfisIi+P+zGfh970+xR+oxv6/mGq9
 6TfbwSrweQ7hW1osuoLhv8CfaF/bzWFRE3ZaveJ9NLkxg8e5TKlgkJLXH
 oiGuJmDvExhFx8WMzvSqVUcJmERbnIegO/zMSdLJmF+6ORemCupMvEk3e g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="31881537"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; d="scan'208";a="31881537"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 17:17:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; d="scan'208";a="15743440"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2024 17:17:47 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 17:17:46 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 17:17:46 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 17:17:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cl2zFDkp2u1zaj0d3zmCbIOHNRTEtSMmP1aa9lJ/fcnHwxkpkQhZ1nMy1L2bETkJQ+BjmCFseBL8gIpZ4p6d/KpbgI1n20CxYbBgFOSyi4fU8h77XOOPdFi1o/74QgdlioAEqnyNsYoQQOqiCjFgY9zIi1QAZ03S5fdV/psX1bUy30BDpYm8KnXV3Wh6KhnyjGX3+yo4uApE1dGKhz3A6JsdfAvteKFcLK7f8u9JzqGQuA3PQ3H4d943O7hkluTz9k9PTazS7Dolx0Sk7x+oYi6PiJIc+Kmk7BIDxOGT3hkKRsaGGh8caH3HrYRdxu0bfEjjQjhqHOkUIQxmm0I1ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KBh052XtejV+/zzQ11lteT1ihWdbnHCj7g+x+48SULA=;
 b=dJ1/tnPjMAt6PVrLcVXXLhG73FJZRK1nGFKQ6+7HzwLVYWaByCMGnDfMfZo9TAElL28fNtsciKyCDdGpCD92bL4OF0zARJDd/vJPF3RY6DEIcXDY4TSgufFdLHRsA9bYkZUTx1Q2wVqhAwamYRDg1z5YvbJCDnLfJxrBwaOxDnYZdrgVpG/8pzCzIS7ELFJonUqe4nsayWyAhC8KWni/eG/WHNDceQu9/j1msw/BOWSCb26yaYX2A5nZiDLi6V6aKwH+wL4SKAshZLckoMdPsNCSvOLSvTM2ivKNg+fvZQN0ujXyGz6I7CzBUeqCG8bN49W5mPrA5WwS+Nj4PeLCqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY8PR11MB7033.namprd11.prod.outlook.com (2603:10b6:930:53::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Tue, 26 Mar
 2024 00:17:44 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7409.028; Tue, 26 Mar 2024
 00:17:44 +0000
Date: Mon, 25 Mar 2024 17:17:41 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>, Robert Krzemien <robert.krzemien@intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v5 2/2] drm/xe/uapi: Add L3 bank mask to topology query
Message-ID: <20240326001720.GB718896@mdroper-desk1.amr.corp.intel.com>
References: <20240325111439.7-1-francois.dugast@intel.com>
 <20240325111439.7-2-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240325111439.7-2-francois.dugast@intel.com>
X-ClientProxiedBy: BYAPR07CA0019.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::32) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY8PR11MB7033:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2FqIz4HQzOzNFz79vqf7gBORssbBcPjE7MIVSQ7rCgKrH+u8znckK2p0qLivJZCnmXZ8+k+0GEE9xNBbTVJzti7H2+AgutV3XN855f2LrICGv2XgWEMUvjX4NzQp7vFlxlb5Kc79Bk1CGY9PDnYwGIPEc15z3NvhPrASLed/GEpAq3+ch0dcOmGDmGN2YdeMleYmxAITubP4Y72VAb80922C/PH7GJIJ2mSRdPxE0qzi/udFBB3CXwu2GbS/lnMAjLlckSe1sREHke2sytwOaYzzcD+Umx4rQIcqXSnvu/F/9llRaqrJURJas1rBJ0ouchyIAhJaANFbJz1dRvfUBCZRHbHL6InSxq1DcxAZBa66kcboTvHdN4Cxn6gLo9ceQerO5w1IzExbiTu+8W7tlsEuhGhMMZrTHHN7ij0Fi+61we7Fa1Da3zIb5qTqSNv5w719Hxknp0tEemCNaWsI/hPoTSy2P1vpUTZdTWLLAAywBkNFm+BIvpeSM4K5GYgtHe/9x3Y7RWWkIQ2qHfaCKdMkhn2N/FFobNUr2ccwcOIMG0fSINn/MmxC+BBB84UudtzwHyMBC8C/NQgowXvBm1MK/WOpoHJ9pQhnYiD+vn2LMeohW6OtZ1ZXcnJHURrNiKtGEMwMymdkQ0WUhDyzrzs+r+Z6hdkrz+5Xhi4U0bs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+mgHY4Taysz+QvEUTYzWqSS8BEthtOmYWkF8dIU+TC406FvNaMTgWgnnXF2B?=
 =?us-ascii?Q?/yH14HZME0V9W6x8H7C3iRRRFXzZUAegn8RRaBYRB48aVYWMTPlf2S4KEJZD?=
 =?us-ascii?Q?acHxaXu9viMXz2LRAYqjM7ZL+YuJ7qmy054zQspyxOTYEANXnQhVE+Ch0o9I?=
 =?us-ascii?Q?TrLd8wzEhEDuASx9MgrKicX4MO8JAabTDqB9XU1SCrzQo33jTf0oseVuwXCg?=
 =?us-ascii?Q?y5Xm+RWvf28TB58BkzgXKPM6y72CfD4Uc4/yBleAZreObVpvy3Cmpfme06i8?=
 =?us-ascii?Q?fk1VBcOnV9T4wKC0xdJO1tfJmvl8Dp0GZNM5P+KhsEgIKvHyQ1K+07GbxE8O?=
 =?us-ascii?Q?N9MQ+G+8HNPxUwZaJnxpRcQkSIzr7LVAH5KqQfUPLCCwSGQhUw5QLudtdA5y?=
 =?us-ascii?Q?QQEs87Wg22/5IggqaAAxcmvEqPwu9U8luB6jkjecwD8gYrDhBXYrW64Zh0NW?=
 =?us-ascii?Q?/s28vlW3DoDgvZtQ+06VximLeTlhdRuWMkZtzgNfh8qdo1eVzvzfaPcwYA5r?=
 =?us-ascii?Q?qiUQFImNP8KObNRjFzfXYXP/n+Pr1MRuYACUveRoKGiW+x6usq8bH8D7QRkF?=
 =?us-ascii?Q?jZ5jhmaIRwODDLOsoSS/vhMSKyvpaHVEwkozX3aWVADkZ4J6s/exrjw9WF7j?=
 =?us-ascii?Q?QVeNK1Scak9tcRYf9N0kBJuuxfQ4DoGZWhX1QabNo0B9rr3L/dpCRyevlZZl?=
 =?us-ascii?Q?/XpJEfqelQBFPtQz/hp4DLLNn3KqN45cxgThkDmlcd5bK8UxVovEVLfDYHkI?=
 =?us-ascii?Q?l++DPJ3jEhWHjjBSEMkUAFdVOenXz7iSWMDASy/M+hi68apaGKkuUgGiBFBz?=
 =?us-ascii?Q?O8MJKynEXa2KVEvu8OEdaoNRNgmOKxaO8lb8lLDVbt39WRoFUB4FpcIgw8P/?=
 =?us-ascii?Q?iT2av/tQljKvVMWbLPP70gSzyQfEMaLSi6wfJ5C9xHhxQF8oCefrfehrjiPc?=
 =?us-ascii?Q?JnqNv230nr7PcENV5lYd7KZKGCkTcn8tvIpCItoX0EsFJFtWAqW4RxLUzhLT?=
 =?us-ascii?Q?xgmUwyjtbYgP94feKdrimWQC2ZVh0mqDKgrO7mvfyZ9dk444aFC6RIIAXI2p?=
 =?us-ascii?Q?xVbr4drt9d0XHTryrYY1ab9r5U0PGqGwYp4FSPfHTCQa16eLkT6yhRzn8vo3?=
 =?us-ascii?Q?X7c4eKfhmq/UcQ50iHzSV22sowjRntj527t77oJ1Wck1z/j6hwwGksdDrcXB?=
 =?us-ascii?Q?OG4nayGCDCzwpdkID9W2CoPYpSbpxrtGzRP4gHOMMVzQVUu4FdgkXmKbMBQy?=
 =?us-ascii?Q?6bUBzEu8sMk1Vd8QTVYPNWzXEU0v/TCcnYjqi47xSDjrxC8u8GroGiEaCcR3?=
 =?us-ascii?Q?VfwMQLRwikms2L3Tsr1cdsMCKgq0cuzAniW1pz2EBefngir+lnQWq4zuvz4h?=
 =?us-ascii?Q?TnNrVHAS/a+by9b3/1SvrCkqYKUnBAflGtY1d0rrLXuUO7iogi/jt4Oj/oOl?=
 =?us-ascii?Q?zB01X5Jxbb0Jfa9COPW/iS0wHHotOvDD55JGjqb9h7UQkybMjoFC6D+ojZW6?=
 =?us-ascii?Q?/5OwyYjRMNipI0wBTsAKoJc1GW6it3ZIKdCMwW9PulKBmhSTfcZ+aeKDuO65?=
 =?us-ascii?Q?SlViShJQd/TYZ562CmL7ObD5DSg/IwUC+QqLrtOy0l4yYAtH+j1jKcQQ7wsO?=
 =?us-ascii?Q?+g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eaf5e86-4661-4c3e-0126-08dc4d2a2861
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 00:17:44.2505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aDXBV6IuoWCx6wZ6R7fYp6wlUOceLgFNhHO1Wg8+7Tz6EwuUNF4tFrI5pRHg2CiL5OOwE88JVHi3hL/q6wAvlFFJslzftE4CX3bSZIdiyiw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7033
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

On Mon, Mar 25, 2024 at 11:14:39AM +0000, Francois Dugast wrote:
> The Metrics Discovery Application Programming Interface (MDAPI) exposes
> disaggregated metrics only for available instances of hardware, therefore
> it needs to know exactly which L3 banks are enabled on the device. The L3
> count is not sufficient information as in some configurations the L3
> banks might be individually enabled or disabled. This is why the topology
> query is here extended to provide the L3 bank mask.
> 
> v2:
> - Remove "Fixes" and make uAPI change explicit in commit message
>   (Lucas De Marchi and Matt Roper)
> - Add separate conditions for Xe2 and for PVC (Matt Roper)
> - Return the L3 bank mask instead of the L3 node mask and the L3
>   banks per node mask, as the node mask can be derived from the
>   bank mask by user space, just like slice masks are derived from
>   subslice masks today (Francois Dugast)
> 
> v3: Use TOPO_NUMBER_OF_MASKS for the number of masks (Zhanjun Dong)
> 
> v4: Detail the user space need in commit message (Lucas De Marchi)
> 
> Bspec: 52545, 52546, 62482
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Robert Krzemien <robert.krzemien@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Zhanjun Dong <zhanjun.dong@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Link: https://github.com/intel/metrics-discovery
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 ++
>  drivers/gpu/drm/xe/xe_gt_topology.c  | 72 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_types.h     | 14 ++++--
>  drivers/gpu/drm/xe/xe_query.c        | 12 ++++-
>  include/uapi/drm/xe_drm.h            |  1 +
>  5 files changed, 96 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 65af9fe95db5..03388c69af1b 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -156,7 +156,10 @@
>  #define	MIRROR_FUSE3				XE_REG(0x9118)
>  #define   XE2_NODE_ENABLE_MASK			REG_GENMASK(31, 16)
>  #define   L3BANK_PAIR_COUNT			4
> +#define   XEHPC_GT_L3_MODE_MASK			REG_GENMASK(7, 4)
> +#define   XE2_GT_L3_MODE_MASK			REG_GENMASK(7, 4)
>  #define   L3BANK_MASK				REG_GENMASK(3, 0)
> +#define   XELP_GT_L3_MODE_MASK			REG_GENMASK(7, 0)
>  /* on Xe_HP the same fuses indicates mslices instead of L3 banks */
>  #define   MAX_MSLICES				4
>  #define   MEML3_EN_MASK				REG_GENMASK(3, 0)
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index f5773a14f3c8..8920426332dd 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -59,6 +59,75 @@ load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask)
>  	bitmap_from_arr32(mask, &val, XE_MAX_EU_FUSE_BITS);
>  }
>  
> +static void
> +load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u64 node_mask, bank_mask = 0;
> +	u64 banks_per_node_fuse, banks_per_node_mask = 0;
> +	int i;
> +
> +	if (GRAPHICS_VER(xe) >= 20) {
> +		node_mask =
> +			REG_FIELD_GET(XE2_NODE_ENABLE_MASK,
> +				      xe_mmio_read32(gt, MIRROR_FUSE3));
> +		banks_per_node_mask =
> +			REG_FIELD_GET(XE2_GT_L3_MODE_MASK,
> +				      xe_mmio_read32(gt, MIRROR_FUSE3));
> +		for (i = 0; i < fls(node_mask); i++)
> +			if (node_mask & BIT(i))
> +				bank_mask |= banks_per_node_mask << 4 * i;
> +	} else if (GRAPHICS_VERx100(xe) >= 1270) {
> +		node_mask =
> +			REG_FIELD_GET(MEML3_EN_MASK,
> +				      xe_mmio_read32(gt, MIRROR_FUSE3));
> +		banks_per_node_fuse =
> +			REG_FIELD_GET(GT_L3_EXC_MASK,
> +				      xe_mmio_read32(gt, XEHP_FUSE4));
> +		/* Each bit represents 2 banks in the node. */
> +		for (i = 0; i < fls(banks_per_node_fuse); i++)
> +			if (banks_per_node_fuse & BIT(i))
> +				banks_per_node_mask |= 0x3 << 2 * i;
> +		for (i = 0; i < fls(node_mask); i++)
> +			if (node_mask & BIT(i))
> +				bank_mask |= banks_per_node_mask << 4 * i;
> +	} else if (xe->info.platform == XE_PVC) {
> +		node_mask =
> +			REG_FIELD_GET(MEML3_EN_MASK,
> +				      xe_mmio_read32(gt, MIRROR_FUSE3));
> +		banks_per_node_fuse =
> +			REG_FIELD_GET(XEHPC_GT_L3_MODE_MASK,
> +				      xe_mmio_read32(gt, MIRROR_FUSE3));
> +		/* Each bit represents 4 banks in the node. */
> +		for (i = 0; i < fls(banks_per_node_fuse); i++)
> +			if (banks_per_node_fuse & BIT(i))
> +				banks_per_node_mask |= 0xf << 4 * i;
> +		for (i = 0; i < fls(node_mask); i++)
> +			if (node_mask & BIT(i))
> +				bank_mask |= banks_per_node_mask << 16 * i;
> +	} else if (xe->info.platform == XE_DG2) {
> +		node_mask =
> +			REG_FIELD_GET(MEML3_EN_MASK,
> +				      xe_mmio_read32(gt, MIRROR_FUSE3));
> +		/*
> +		 * In this case, if a node is present then all 8 banks inside of
> +		 * it are present.
> +		 */
> +		for (i = 0; i < fls(node_mask); i++)
> +			if (node_mask & BIT(i))
> +				bank_mask |= 0xfful << 8 * i;
> +	} else {
> +		/*
> +		 * Here the mask logic is reversed: a bit is set if the bank is
> +		 * disabled.
> +		 */
> +		bank_mask = REG_FIELD_GET(XELP_GT_L3_MODE_MASK,
> +					  ~xe_mmio_read32(gt, MIRROR_FUSE3));
> +	}
> +
> +	bitmap_from_arr64(l3_bank_mask, &bank_mask, XE_MAX_L3_BANK_FUSE_BITS);

This is going to cause us a lot of pain down the road as soon as we hit
a platform where the size of the mask can exceed a single u64.  Then
we'll have to go back and change all of these if/else branches.

It might be best to just build the bitmap directly in each branch now
rather than doing this in a way that we know we'll need to change later.
We can add some static helper functions to do common stuff like
replicate a submask according to the bits of a different mask.  Hard to
explain in text, but something like the following (completely untested):


  /* For each set bit in @mask, replicate @pattern into a corresponding
     slot of @dst (where slot size = @maskbits) */
  static void replicate_by_mask(xe_l3_bank_mask_t dst,
                                xe_l3_bank_mask_t pattern,
                                u32 mask,
                                int maskbits)
  {
     unsigned long nextbit;
  
     xe_assert(fls(mask) <= maskbits);
     for_each_set_bit(nextbit, &mask, 32) {
         xe_l3_bank_mask_t shifted_pattern = {};

         bitmap_shift_left(shifted_pattern, pattern, nextbit * maskbits, MAXSIZE);
         bitmap_or(dst, dst, shifted_pattern, MAXSIZE);
     }
  }

  static void
  load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask) {
        ...
        fuse3 = xe_mmio_read32(gt, MIRROR_FUSE3);

        ...
        } else if (xe->info.platform == XE_PVC) {
                xe_l3_bank_mask_t per_node = {};
                u32 meml3_en = REG_FIELD_GET(MEML3_EN_MASK, fuse3);
                u32 bank_val = REG_FIELD_GET(XEHPC_GT_L3_MODE_MASK, fuse3);

                bitmap_from_arr32(per_node, &bank_val, 32);
                replicate_by_mask(l3_bank_mask, per_node, meml3_en, 4);
        } else if (xe->info.platform == XE_DG2) {
                xe_l3_bank_mask_t bit0 = {};
                u32 mask = REG_FIELD_GET(MEML3_EN_MASK, fuse3);

                bitmap_fill(bit0, 8);
                replicate_by_mask(l3_bank_mask, bit0, mask, 8);
        } else {
                /* 1:1 register bit to mask bit (inverted register bits) */
                u32 mask = REG_FIELD_GET(XELP_GT_L3_MODE_MASK, ~fuse3));
                bitmap_from_arr32(l3_bank_mask, &mask, 32);
        }
  }


> +}
> +
>  static void
>  get_num_dss_regs(struct xe_device *xe, int *geometry_regs, int *compute_regs)
>  {
> @@ -103,6 +172,7 @@ xe_gt_topology_init(struct xe_gt *gt)
>  		      XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,
>  		      XE2_GT_COMPUTE_DSS_2);
>  	load_eu_mask(gt, gt->fuse_topo.eu_mask_per_dss);
> +	load_l3_bank_mask(gt, gt->fuse_topo.l3_bank_mask);
>  
>  	p = drm_dbg_printer(&gt_to_xe(gt)->drm, DRM_UT_DRIVER, "GT topology");
>  
> @@ -120,6 +190,8 @@ xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
>  	drm_printf(p, "EU mask per DSS:     %*pb\n", XE_MAX_EU_FUSE_BITS,
>  		   gt->fuse_topo.eu_mask_per_dss);
>  
> +	drm_printf(p, "L3 bank mask:        %*pb\n", XE_MAX_L3_BANK_FUSE_BITS,
> +		   gt->fuse_topo.l3_bank_mask);
>  }
>  
>  /*
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index f6da2ad9719f..e1438a478f94 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -24,13 +24,16 @@ enum xe_gt_type {
>  	XE_GT_TYPE_MEDIA,
>  };
>  
> -#define XE_MAX_DSS_FUSE_REGS	3
> -#define XE_MAX_DSS_FUSE_BITS	(32 * XE_MAX_DSS_FUSE_REGS)
> -#define XE_MAX_EU_FUSE_REGS	1
> -#define XE_MAX_EU_FUSE_BITS	(32 * XE_MAX_EU_FUSE_REGS)
> +#define XE_MAX_DSS_FUSE_REGS		3
> +#define XE_MAX_DSS_FUSE_BITS		(32 * XE_MAX_DSS_FUSE_REGS)
> +#define XE_MAX_EU_FUSE_REGS		1
> +#define XE_MAX_EU_FUSE_BITS		(32 * XE_MAX_EU_FUSE_REGS)
> +#define XE_MAX_L3_BANK_FUSE_REGS	2
> +#define XE_MAX_L3_BANK_FUSE_BITS	(32 * XE_MAX_L3_BANK_FUSE_REGS)

This definition doesn't look right.  For DSS the hardware just splits
the actual mask (1 bit per DSS) across several 32-bit registers so
32*numregs expresses the maximum possible size of what the hardware can
provide.  But for L3 banks the rules are much more complicated and vary
by platform, so we can't use the same rules.


Matt

>  
>  typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(XE_MAX_DSS_FUSE_BITS)];
>  typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(XE_MAX_EU_FUSE_BITS)];
> +typedef unsigned long xe_l3_bank_mask_t[BITS_TO_LONGS(XE_MAX_L3_BANK_FUSE_BITS)];
>  
>  struct xe_mmio_range {
>  	u32 start;
> @@ -334,6 +337,9 @@ struct xe_gt {
>  
>  		/** @fuse_topo.eu_mask_per_dss: EU mask per DSS*/
>  		xe_eu_mask_t eu_mask_per_dss;
> +
> +		/** @l3_bank_mask: L3 bank mask */
> +		xe_l3_bank_mask_t l3_bank_mask;
>  	} fuse_topo;
>  
>  	/** @steering: register steering for individual HW units */
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 109a96212310..e026d993f246 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -23,7 +23,7 @@
>  #include "xe_mmio.h"
>  #include "xe_ttm_vram_mgr.h"
>  
> -#define TOPO_NUMBER_OF_MASKS   (3)
> +#define TOPO_NUMBER_OF_MASKS   (4)
>  
>  static const u16 xe_to_user_engine_class[] = {
>  	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
> @@ -460,7 +460,8 @@ static size_t calc_topo_query_size(struct xe_device *xe)
>  		 * sizeof(struct drm_xe_query_topology_mask) +
>  		 sizeof_field(struct xe_gt, fuse_topo.g_dss_mask) +
>  		 sizeof_field(struct xe_gt, fuse_topo.c_dss_mask) +
> -		 sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss));
> +		 sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss) +
> +		 sizeof_field(struct xe_gt, fuse_topo.l3_bank_mask));
>  }
>  
>  static int copy_mask(void __user **ptr,
> @@ -519,6 +520,13 @@ static int query_gt_topology(struct xe_device *xe,
>  				sizeof(gt->fuse_topo.eu_mask_per_dss));
>  		if (err)
>  			return err;
> +
> +		topo.type = DRM_XE_TOPO_L3_BANK;
> +		err = copy_mask(&query_ptr, &topo,
> +				gt->fuse_topo.l3_bank_mask,
> +				sizeof(gt->fuse_topo.l3_bank_mask));
> +		if (err)
> +			return err;
>  	}
>  
>  	return 0;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 808ad1c308ec..aa917308cdeb 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -521,6 +521,7 @@ struct drm_xe_query_topology_mask {
>  #define DRM_XE_TOPO_DSS_GEOMETRY	(1 << 0)
>  #define DRM_XE_TOPO_DSS_COMPUTE		(1 << 1)
>  #define DRM_XE_TOPO_EU_PER_DSS		(1 << 2)
> +#define DRM_XE_TOPO_L3_BANK		(1 << 3)
>  	/** @type: type of mask */
>  	__u16 type;
>  
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
