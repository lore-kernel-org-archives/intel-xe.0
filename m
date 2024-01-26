Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87EB8C47422
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 17:14:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F9410FC6C;
	Fri, 26 Jan 2024 17:14:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3312210FC30
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 17:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706289295; x=1737825295;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AlhAlinnnWwegqYBLli8qZrCGNgMfLU7ic9UWQ+GtOE=;
 b=iv0MR5tt/bVONaKay8z+0/UY1zSAod5Rnj0tRSRXRfj+/ej9NNfu+znw
 O1zdHRDPm5xt5i+XD+Soyr0RJJ+wRA/E05buh0XlraNpymbUyKQr4l6or
 A6KGy6Ak/BNXdS9HN26wCaYAkijqMz7lnysH6Z7nj3uAutYfvjqKp4zm0
 LLZi1Bw64bFi2A5mYXxC6o6cQmvZGWGR7h3jvTgdO5nbttb13EmSsm6jl
 FvJSrQQDNm7L+hFgkFqozL2Rpx2pB+yR0guonf7FCS2cDa5vhUqkkqASC
 e8Khuye2r98Levk+AGl+rpS9Adas4LboAnlhwC9eASwv05YmOXsf3mpdd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9183068"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9183068"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 09:14:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="910391334"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="910391334"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 09:14:53 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 09:14:52 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 09:14:51 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 09:14:51 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 09:14:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CeyF7Svu95w+ouuJMcmHLxfTjrLAAiqKc+3/RAGZ4gxoVX6CeMzYPS7edIKrRnHIi5PD/xlsD/RH5vbDmDD1fP7je2Rsrv9ZgPQ2ukcz/7FMeN0TWtz53azpdmn4gy5uDjosfccpRRyVaO4HzOxkhqxJdIGn4/hUK+aBZ2UgjU5z7AXyMP7LDt/2b1werlTTNt/L/UGUrepL/XMyVYOU8M+N3PSN8Bo0R1XdEGYL9Pcz11nGoJV6ym00lvtN9kC2kjsPNQRrGjpt8hdAljWxm5i+lIC9g/hEJzuZYwsNJquKZs+U9aGloMLq4qYGDyFCBT16xlhOB4LK4+hF5UWaYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vTpmtunplH2/joEAnlLkG3PZ8vbWQu0whRzb6YYRPXA=;
 b=ZR1nugk78NYET/NWJ2wZeaPElfBASZ76jV6dHeBpbZ/WYFy2EIY5LnOkxD2aWmQZRzzXaX0hPaYUd+FATibNOuZABdcF0J8HBGXlkPMQzpwACjpCgfF4oUJaqPm812Qtk97K3m2QgVX7JxdMMmlbxx/zCxjJEFTgi+ZfGS3MhfhY5tpKzT6kwGMh0FfNMwGIaYYlm7BdauomyOm1v6Uf4k0WvE466Q+qZAbckB24nn8YcTxX7387CSi1sbtNEj3p66LfroCQOaP/+8qV8zG4DSgf5Cl0AavrMSrxlnbzZPKOnRDyhQpiq44UyEv1Hu5XjXHeY0xZMHZHv32fEaY1vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH0PR11MB7635.namprd11.prod.outlook.com (2603:10b6:510:28e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Fri, 26 Jan
 2024 17:14:48 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7202.035; Fri, 26 Jan 2024
 17:14:48 +0000
Date: Fri, 26 Jan 2024 09:14:45 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH] drm/xe: Add L3 bank and node masks to topology query
Message-ID: <20240126171445.GF5506@mdroper-desk1.amr.corp.intel.com>
References: <20240126153840.7-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240126153840.7-1-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR03CA0096.namprd03.prod.outlook.com
 (2603:10b6:a03:333::11) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH0PR11MB7635:EE_
X-MS-Office365-Filtering-Correlation-Id: f2ea3954-8bf3-4063-4911-08dc1e924ca8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NF62wjY0w0zzFHSWcyvk5RV+qLpZGkU2dG5bWs9/TTOK1YGLQ9yFmcuQdn/OhdKoCWyxpDYukDi4v9iWaVmUN4VaAnCHW3t/9Ezd6B2PEEAoX+mAHNCeM7LsizX8IOEhRPQo98/QhCIUQ3b6zeLtP4Bo+wZZgPGJRrmnLQX9WxEi3KjqeDlrlAI6Yb+zXFRYFAxWAat9ocsaK2LGiOtsfjx2WVsNkB3irwcDXny32AsJAi2i72A6Ig+de4SYqM5e7xadRMwpCZCuRBQbvJtmJOUEmAEWWOTJMyRf0H34lS9dy0SDzjx8PYQbTZ8hONgsoM7+QCMb15DdQZCBI0KIdqAz9Ohv3KpmqkGu9yEmjjRlC1/CSG8ildfxjJcJLclY1wKAQYnvPR0+SZSRS+eUOVy//Mt2c3oZxypT5hiGDr8vMFBNEozp9fNQbbwxQtKhwJblhkMxkdNq5xxEyefWOv2oLPv/403yNaTxE3/OIvQoxv9P1FgrWUGp6wF2eLN62Mgg0q5GStkG7+U40ZENjWlNFgVJWWXc4BvBPvntK3DKNl4cHD3YROqSH3AfwtOt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(396003)(136003)(346002)(376002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(6512007)(38100700002)(6506007)(6486002)(1076003)(107886003)(6666004)(83380400001)(82960400001)(478600001)(26005)(316002)(54906003)(6636002)(66556008)(4326008)(8936002)(66946007)(6862004)(8676002)(66476007)(41300700001)(33656002)(5660300002)(86362001)(2906002)(15650500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1C9EXCHk4P997kQpFPfLPIvd9Fq7JMMDeSBL4JvZkIiZgzg3IF+tjG432NAC?=
 =?us-ascii?Q?zjBtouEX+hnCa5U2s1FOsSsrXpV9txWWPGzYMEJtj6ELoeKY22dpCEaGQh3L?=
 =?us-ascii?Q?xEWPg58RThBvMbTuyFW5NSi+znJMGgk9Nmm9Q/lveFEejAYamgMZPnZ3GTH0?=
 =?us-ascii?Q?MkNlWl2A2yHAk6O/jLxmI+8mR/EpcnywSsv3vyAsrxni1yg29wdcLD5s3Buq?=
 =?us-ascii?Q?q1eNZvmIhkdWQXsKOslG8sK+j2UkYr6wVYFSabbjnaEIcxJ2jnW2J/g38Kqf?=
 =?us-ascii?Q?LDFdJec3GONyae8+bL+x5lxAYzGAvJ2VUV9yvLnmPMvMGBWZpbkCNVD6f+rA?=
 =?us-ascii?Q?WKf0KHIlxQup09Wur0ZvSh7p9FSiYqBhFE4CmTsbX4bdfMeAinNPgHK/fL3p?=
 =?us-ascii?Q?mgpC6zRjHYAhijroVTRm8pwAMEn2PRXU12lJFPZWFTV3FM910Bl7q7A6ii9a?=
 =?us-ascii?Q?MIUxqlPgmtFfd4h+W3Uu6ftjGbdTFkJBiEYAQ5yvGYJLjszEh2l87E7RcXXS?=
 =?us-ascii?Q?uCCCzXCKWZwxQ0zNL2wGxQIAEOzq2Y3OiNFO7QeL8l3RNE4nkhqEYk6FHwZc?=
 =?us-ascii?Q?LJIeubw+sc+QNL/xsosp/9Nol/J85a3cvn9vm/QJHO5knUWM5RI9L3Q6oGuh?=
 =?us-ascii?Q?oT93h8YejrGEki2sMWdS3JjelL3+veiUnTgDJhMWdSTCcn+6C97Tovhp8vy/?=
 =?us-ascii?Q?B3WmWNup+/9pAitz4FVGMyWFIf5xHQBBvB8D8a070RhxcC3SmFRjWNAHqHtn?=
 =?us-ascii?Q?98dwQfKRikEYzLEt3WiMRGCUj/myrTOGke6Xf10zMFByzuSqriviCec+Hvm4?=
 =?us-ascii?Q?ygAi+okWB99aavNq9Vg6jlb786HKB/3f/YonyC2vr2gVxOl9ibw4DDJjAgEY?=
 =?us-ascii?Q?a35i0kZseF6y0Ul7u2pdm6/FNkoBOvlsTSLh7lKQM7dI+eyNhNSyWjwoXDzj?=
 =?us-ascii?Q?DKgakzCM08VsdAlo4biFydDsUhHeQr+Hi8p8WVtFyeoCqmUJE4C3JnexseNn?=
 =?us-ascii?Q?rZdtEeGpEJtxUFI62SGWi8Et2Du1QHuLkAUEWlIshs/ILd9q49dLX6xwng72?=
 =?us-ascii?Q?4dM9GSo1oialx/4QKYSFfoNAqL7Hwwva+XiggMO7umFJAG7Rem4I7sB51Zue?=
 =?us-ascii?Q?r2k2zDXRUvMPNV1uFk0nr4eunIJ9b2jjE/CjrZhKs0sNPOadxqXItzfA0Dlv?=
 =?us-ascii?Q?VCJtCe6OYD7opqt//HkS8zWer9OFJ/rTW4/on7Rvhnr3aFqldB4Tdvj8/zDh?=
 =?us-ascii?Q?lzkxYPTIYvpTdGdI5uuPpouBcSpxQNnU+j3NjHVZI/xiOMRJp7w7sKZcFuS2?=
 =?us-ascii?Q?WJiUdvivJx/47x36iNdAvEEavM5v9s/G3/Vc4+leYH9AY/hLI4M9SJcvlCmg?=
 =?us-ascii?Q?GXJpK3Mi/Hpo+OMmBj7Ln5mvo6dKDsWM3mpZOzptzzbUi151cvbvLnyoDuxj?=
 =?us-ascii?Q?2xIuywu64BhRTtcCAXAZrBNW6HB38bpi8VdGUDUAl+WttC/FgHonCF1Qx41W?=
 =?us-ascii?Q?daog85vTMgY1vnWKdTyRpGDxjomGuA/0uCZ4csHYh62yATVGUtZiDIiT7ZiA?=
 =?us-ascii?Q?nmtpsvkQSVF0+GVxJJ8QtROnuUV6vsW56OE0Id6+DmsYR4Q9uLMEoZkxfuV+?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f2ea3954-8bf3-4063-4911-08dc1e924ca8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 17:14:48.1084 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8T0RGR9CL0UMBlWJcsASlvLjFeCBXNvGDM+qD2eYKryEgFaz5IB5BZJHElksvwylh/lnDohvK2kog8MlGqCtKOhTMDYRYdY/0KAJuuoyZJU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7635
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
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>, intel-xe@lists.freedesktop.org,
 Robert Krzemien <robert.krzemien@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jan 26, 2024 at 03:38:40PM +0000, Francois Dugast wrote:
> Expose the masks of L3 banks and of L3 nodes to user space. L3 count is not
> sufficient because in some configuration not all banks are enabled, so user
> space needs to know which ones.
> 
> Bspec: 52545, 52546, 62482
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")

As Lucas noted, this patch isn't fixing anything, just adding a new
optional feature.

We should probably label this patch more clearly as being a uapi patch
too.

> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Robert Krzemien <robert.krzemien@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
>  drivers/gpu/drm/xe/xe_gt_topology.c  | 38 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_types.h     | 14 ++++++++--
>  drivers/gpu/drm/xe/xe_query.c        | 20 +++++++++++++--
>  include/uapi/drm/xe_drm.h            |  2 ++
>  5 files changed, 71 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index cd27480f6486..f8606649d1e2 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -156,6 +156,7 @@
>  #define	MIRROR_FUSE3				XE_REG(0x9118)
>  #define   XE2_NODE_ENABLE_MASK			REG_GENMASK(31, 16)
>  #define   L3BANK_PAIR_COUNT			4
> +#define   L3MODE_MASK				REG_GENMASK(7, 4)

This definition is only correct for Xe_HPC platforms; we should probably
have an XEHPC_ prefix so that we can have different field definitions
for other IPs.

>  #define   L3BANK_MASK				REG_GENMASK(3, 0)
>  /* on Xe_HP the same fuses indicates mslices instead of L3 banks */
>  #define   MAX_MSLICES				4
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index a8d7f272c30a..6f4cf147a7aa 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -13,6 +13,8 @@
>  
>  #define XE_MAX_DSS_FUSE_BITS (32 * XE_MAX_DSS_FUSE_REGS)
>  #define XE_MAX_EU_FUSE_BITS (32 * XE_MAX_EU_FUSE_REGS)
> +#define XE_MAX_L3_BANK_FUSE_BITS (32 * XE_MAX_L3_BANK_FUSE_REGS)
> +#define XE_MAX_L3_NODE_FUSE_BITS (32 * XE_MAX_L3_NODE_FUSE_REGS)

We don't really need these definitions; if multi-register masks show up
in the future we'll need different logic below anyway.

>  
>  static void
>  load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
> @@ -62,6 +64,36 @@ load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask)
>  	bitmap_from_arr32(mask, &val, XE_MAX_EU_FUSE_BITS);
>  }
>  
> +static void
> +load_l3_masks(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask,
> +	      xe_l3_node_mask_t l3_node_mask)
> +{
> +	u32 bank, node;
> +
> +	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270) {

We need a separate condition for Xe2 as well since it doesn't match
Xe_LPG.

> +		node = REG_FIELD_GET(MEML3_EN_MASK,
> +				     xe_mmio_read32(gt, MIRROR_FUSE3));
> +		bank = REG_FIELD_GET(GT_L3_EXC_MASK,
> +				     xe_mmio_read32(gt, XEHP_FUSE4));

This one isn't correct; the bits here aren't a mask of the banks but
rather a mask of half-nodes.  I.e., 011 means all four banks in the
mslice are enabled.  001 means only the lower two banks are enabled.
And 010 means only the upper two banks are enabled.

> +	} else if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1250) {

You're missing a condition for Xe_HPC here.  On PVC some of the l3 banks
are inside bslices and some are inside rambo's, so I'm not sure how you
want to express that.

> +		node = REG_FIELD_GET(MEML3_EN_MASK,
> +				     xe_mmio_read32(gt, MIRROR_FUSE3));
> +		bank = REG_FIELD_GET(L3MODE_MASK,
> +				     xe_mmio_read32(gt, MIRROR_FUSE3));

This one isn't correct; Xe_HP platforms don't have a field at [7:4].
The only thing provided by fusing is the mslice mask (which is
effectively what you're calling "nodes") here.  If a node is present
then all 8 banks inside of it are present.  So assuming your "bank" mask
here is actually a "banks per node" mask, you just want a hardcoded
0xFF.

> +	} else {
> +		/*
> +		 * Here the mask logic is reversed: a bit is set if the bank is
> +		 * disabled.
> +		 */
> +		bank = REG_FIELD_GET(L3BANK_MASK,
> +				     ~xe_mmio_read32(gt, MIRROR_FUSE3));

For gen12 (and older platforms supported by i915 too), the L3 bank mask
is technically 8 bits ([7:0]), but bits [7:4] are guaranteed to match
[3:0] since the hardware always enables/disables the banks in pairs.  So
this is only going to give you half the actual bank mask.  

It's probably best to just just define an XELP_GT_L3_MODE_MASK as [7:0]
since that gives the entire bank mask.  In fact we can go ahead and
delete L3BANK_MASK completely and just use XELP_GT_L3_MODE_MASK in
init_steering_l3bank() too.  We only wind up using the __ffs() of that
value for steering purposes so it doesn't matter at all whether we
include the replicated upper bits or not in the logic there.

> +		node = 0; /* Unused */

Since the cases above are giving a "bank per node" mask, it might be
more consistent to provide a hardcoded "1" here instead.  I.e., these
platforms effectively organize all of their L3 banks into a single
always-present node.

> +	}
> +
> +	bitmap_from_arr32(l3_bank_mask, &bank, XE_MAX_L3_BANK_FUSE_BITS);
> +	bitmap_from_arr32(l3_node_mask, &node, XE_MAX_L3_NODE_FUSE_BITS);
> +}
> +
>  static void
>  get_num_dss_regs(struct xe_device *xe, int *geometry_regs, int *compute_regs)
>  {
> @@ -106,6 +138,8 @@ xe_gt_topology_init(struct xe_gt *gt)
>  		      XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,
>  		      XE2_GT_COMPUTE_DSS_2);
>  	load_eu_mask(gt, gt->fuse_topo.eu_mask_per_dss);
> +	load_l3_masks(gt, gt->fuse_topo.l3_bank_mask,
> +		      gt->fuse_topo.l3_node_mask);
>  
>  	xe_gt_topology_dump(gt, &p);
>  }
> @@ -121,6 +155,10 @@ xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
>  	drm_printf(p, "EU mask per DSS:     %*pb\n", XE_MAX_EU_FUSE_BITS,
>  		   gt->fuse_topo.eu_mask_per_dss);
>  
> +	drm_printf(p, "L3 bank mask:        %*pb\n", XE_MAX_L3_BANK_FUSE_BITS,
> +		   gt->fuse_topo.l3_bank_mask);
> +	drm_printf(p, "L3 node mask:        %*pb\n", XE_MAX_L3_NODE_FUSE_BITS,
> +		   gt->fuse_topo.l3_node_mask);
>  }
>  
>  /*
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 70c615dd1498..adb1de613e77 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -24,11 +24,15 @@ enum xe_gt_type {
>  	XE_GT_TYPE_MEDIA,
>  };
>  
> -#define XE_MAX_DSS_FUSE_REGS	3
> -#define XE_MAX_EU_FUSE_REGS	1
> +#define XE_MAX_DSS_FUSE_REGS		3
> +#define XE_MAX_EU_FUSE_REGS		1
> +#define XE_MAX_L3_BANK_FUSE_REGS	1
> +#define XE_MAX_L3_NODE_FUSE_REGS	1
>  
>  typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(32 * XE_MAX_DSS_FUSE_REGS)];
>  typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(32 * XE_MAX_EU_FUSE_REGS)];
> +typedef unsigned long xe_l3_bank_mask_t[BITS_TO_LONGS(32 * XE_MAX_L3_BANK_FUSE_REGS)];
> +typedef unsigned long xe_l3_node_mask_t[BITS_TO_LONGS(32 * XE_MAX_L3_NODE_FUSE_REGS)];
>  
>  struct xe_mmio_range {
>  	u32 start;
> @@ -332,6 +336,12 @@ struct xe_gt {
>  
>  		/** @fuse_topo.eu_mask_per_dss: EU mask per DSS*/
>  		xe_eu_mask_t eu_mask_per_dss;
> +
> +		/** @l3_bank_mask: L3 bank mask */
> +		xe_l3_bank_mask_t l3_bank_mask;

This doesn't match what you're calculating above.  Above it looks like
you're trying to return the "banks per node" mask, but this implies that
you're returning the actual L3 bank mask.

Also, it's not clear exactly how this mask should really be expressed.
Unlike stuff like DSS, L3 banks are organized in unusual ways and can
live on different dies.  E.g., some the base die, some on the rambo die.
Is that something that userspace cares about?  Do they expect the
different dies to be expressed in a specific order or anything?


Matt

> +
> +		/** @l3_node_mask: L3 node mask */
> +		xe_l3_node_mask_t l3_node_mask;
>  	} fuse_topo;
>  
>  	/** @steering: register steering for individual HW units */
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 9b35673b286c..fe3906e8f721 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -453,10 +453,12 @@ static int query_hwconfig(struct xe_device *xe,
>  static size_t calc_topo_query_size(struct xe_device *xe)
>  {
>  	return xe->info.gt_count *
> -		(3 * sizeof(struct drm_xe_query_topology_mask) +
> +		(5 * sizeof(struct drm_xe_query_topology_mask) +
>  		 sizeof_field(struct xe_gt, fuse_topo.g_dss_mask) +
>  		 sizeof_field(struct xe_gt, fuse_topo.c_dss_mask) +
> -		 sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss));
> +		 sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss) +
> +		 sizeof_field(struct xe_gt, fuse_topo.l3_bank_mask) +
> +		 sizeof_field(struct xe_gt, fuse_topo.l3_node_mask));
>  }
>  
>  static void __user *copy_mask(void __user *ptr,
> @@ -515,6 +517,20 @@ static int query_gt_topology(struct xe_device *xe,
>  				      sizeof(gt->fuse_topo.eu_mask_per_dss));
>  		if (IS_ERR(query_ptr))
>  			return PTR_ERR(query_ptr);
> +
> +		topo.type = DRM_XE_TOPO_L3_BANK;
> +		query_ptr = copy_mask(query_ptr, &topo,
> +				      gt->fuse_topo.l3_bank_mask,
> +				      sizeof(gt->fuse_topo.l3_bank_mask));
> +		if (IS_ERR(query_ptr))
> +			return PTR_ERR(query_ptr);
> +
> +		topo.type = DRM_XE_TOPO_L3_NODE;
> +		query_ptr = copy_mask(query_ptr, &topo,
> +				      gt->fuse_topo.l3_node_mask,
> +				      sizeof(gt->fuse_topo.l3_node_mask));
> +		if (IS_ERR(query_ptr))
> +			return PTR_ERR(query_ptr);
>  	}
>  
>  	return 0;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 50bbea0992d9..eca8f5f502c3 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -513,6 +513,8 @@ struct drm_xe_query_topology_mask {
>  #define DRM_XE_TOPO_DSS_GEOMETRY	(1 << 0)
>  #define DRM_XE_TOPO_DSS_COMPUTE		(1 << 1)
>  #define DRM_XE_TOPO_EU_PER_DSS		(1 << 2)
> +#define DRM_XE_TOPO_L3_BANK		(1 << 3)
> +#define DRM_XE_TOPO_L3_NODE		(1 << 4)
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
