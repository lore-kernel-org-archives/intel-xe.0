Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8EEAC47258
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 23:43:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B98D10E903;
	Wed, 17 Jan 2024 23:43:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A448410E903
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jan 2024 23:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705535020; x=1737071020;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=khvWnlYkY3bdochBJZSrtoXG2kgc0/zgU0VJAHgaMks=;
 b=ET4P+Xjr8THZWx4xsTgtPA+wTUZjcT/xRBas3RS5QcMqiPjqtkDUr6FW
 pOFwi6+KWXG/slOEVG26d0GfOWKj0mP6UTgP2zbNeV/qe2Qw9YGB6Q6Yc
 xJwTKPxkFal5LI6z3hzhCRFmpFBL0QT07pq++H6UZlo12xF5BEtQAZwPn
 BIhslO5o1IhRCofNibtcIK+jTjrf/XZGk5xr8009buveWBG/5fOR31NiB
 dfH/1mBpa72mraPjIcr3GYqRgVjCA8AgK5PSvxKl5WiYTv4+YSQAzXeKV
 fiYm9ozlj68IyfTqFY/xKxCAdmd36edY+Y9bqwB4J2okn7nnsL3D6ATho A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="197096"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="197096"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 15:43:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="777570687"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="777570687"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jan 2024 15:43:40 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Jan 2024 15:43:39 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Jan 2024 15:43:39 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Jan 2024 15:43:39 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Jan 2024 15:43:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qu2laa0X2pXwbQA8xBXfriiJqLNPlSdoK2dusbo+spqo7tN47OgfoEvqy9imv1SGvH+fEmdKRIvPkMxDyL0NOvP4gKRL1rMrD/usaIWOfFa8UkKny5rVN3Md1+uCbMYDUNDeWNSUfjfNX5r4Ds+uVjFXOjs/q7lwjHEJXGVhuq8LCHMYtG4UPCsyEsTo39FJRSD6PJd1gyUSUtidJj+HR39lxYfcmaQTWH7EgXObB7MTkVFkZvmv3lw0Jc6OhNX2QuAi9wGvbzOKg5Jb+Jlg6KryPkVmWnCMZ4UJHNoiPPXf42o8JjZMiG7BKOlhEkFxoyeey/XMgYQqyW2SJUwfJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0WOjGNbfUwBKOs0onjYLbVnjZxMczchAN+Lr7k3gYG0=;
 b=BuYoT6c6NiOVNOEwxLG/G2REqnjxW16zI093QH6/fk8k+pTDzGGIn20hMNbrpQVXBnW4gXGQBwjktSzfVHixMQVq/zuNO1l3Bgome4mhrXJ35J/smmnXrgl57jVVMrY0kOSC6dTf4z7BuiKnxMKQQuoCpHu2mAI+L/K8YbOPA7IONAs5LsGE9izWp60evOVqgvc3OVqwwR2k53mvZr8y8B2Br1CsdYV5z6IpIf//BE5S1x/7cAK51oVVcfP5TwP/cST+t/IqqthTZiCR61OLzz+Y/kWGTNVm4jDdhWq2/WStkf2fl86U99piSRd9lPnSpNZWb1pGRIhLL5nPNOfaCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB8175.namprd11.prod.outlook.com (2603:10b6:208:44f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Wed, 17 Jan
 2024 23:43:36 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7202.024; Wed, 17 Jan 2024
 23:43:36 +0000
Date: Wed, 17 Jan 2024 15:43:34 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 6/6] drm/xe: Make xe_mmio_read|write() functions non-inline
Message-ID: <20240117234334.GO45138@mdroper-desk1.amr.corp.intel.com>
References: <20240116145617.1177-1-michal.wajdeczko@intel.com>
 <20240116145617.1177-7-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240116145617.1177-7-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR21CA0022.namprd21.prod.outlook.com
 (2603:10b6:a03:114::32) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB8175:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a9623cd-0488-40c2-70c0-08dc17b61fb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +ftFISF4yOLW2QVri7Nl7QH63NFurXQcxipjU/NAzmci5JN2o5I1H7/4h0MqB6emwf3M3EKy/+ZjhrrJVMfDX+PSoVZoiOKMZKhv0mmYzYIswwwl8a16m/Sk2fnNTHT2jqcZ6XGDxs0/ugPgJ0CFbL7l1v/RdhCqiiiqS98q1VM1NezDK45NB0fWx/jifJaBLmYCTwRsxQ6rSUBNSXvKdtijEzFnTuXI7gBQQaeQA+DX/Iiw88dlHxZASfKjbWMXSfnqqstdBg57p9cF8J6R39hr2oC6F5YI1q5fxSPJJf1fhSD5ZRCxQwnRDyhburqHj1Z4D3acLQKUdmkOY6gHSGI9CGJBL/Pxx56CNZTsxEKz6ioUMF4oI2vSDJwFnPT/muo50b1LvjxGiLtY8jaMbEVVl5Mw0gclVFjt9nIZhUKq2tVyQdEvYQ4QPMKUb9Hfbf7K8by/B9Ak8c/UiQlo8DtdgP/NbsqNFl1+DxLz8wG0+rpoWzbVrHdo19acY0NxNQUGCWcpo99qOlb9Q90I1KAbMJ1Akb715Oi+NE59IuvEuyEvBbrU7W6bLwgM4e+Y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(136003)(366004)(39860400002)(376002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(8936002)(316002)(66476007)(478600001)(8676002)(66556008)(6636002)(66946007)(6512007)(26005)(6506007)(83380400001)(6486002)(6862004)(41300700001)(4326008)(2906002)(5660300002)(33656002)(38100700002)(82960400001)(1076003)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hKcN4iNmcQR4gVdP+93CAWQCntQwNsvVkk3eUopBl/S0u2oVIyowVzwn3hDH?=
 =?us-ascii?Q?5zITItRmPkCFbVc0nquSVOzsAWBmBE8X220+vm9NUB9XQQ+WT/ttdcfyjT20?=
 =?us-ascii?Q?MTILDEZjOdi4RZzeKQ+2IC0LNZjW9+woz6dBju6Pzw8gPglFHAp4k3duAE4e?=
 =?us-ascii?Q?twYSZR+6T5rwIqeOaRiDNHxTQw7HIFPhD5D4JVg9DlyVFOmSthf41DQ7ZfFa?=
 =?us-ascii?Q?mW0uTmo8bzF1DNZfAszu57fxOzcIRXzaPd2WRaTRWSHWUT/rQouiH/PLPHfU?=
 =?us-ascii?Q?FSJ54XJChCSbm9omIsbJ4o8JoGUcYXdNiPPl7BUIi6OGVGahKhY3oiViFFSo?=
 =?us-ascii?Q?RhGpQyEeZyMDfXgWfz+NBdoNpHtMUWq1ChAwDRjJycqUS9byHVPqXqnAyU/2?=
 =?us-ascii?Q?/olo8xYI0ud+pghWRPGFlALhqZBKGFzApym7og9VydlSoCpHla/zwu0hbd1T?=
 =?us-ascii?Q?wkxX9Yr7fzFnBFj9kxZrV4gtJgvXOlqzYm/MPXk4QoIYD6Pws9AZ+4psf8fx?=
 =?us-ascii?Q?rgOLV06Bs5zy82r4JS6DpeaovszAwQXkoV3ZvuXhVEpzmK+Z1V/9l42JkOq1?=
 =?us-ascii?Q?kNWuVLVawjsk/z033hLiKoJGl/yfXHbOt6+zGX9Z0dnRe7m/3StXwjPPOmUo?=
 =?us-ascii?Q?2S2yeUXcVIgOZupBorwvEjkUIaqg3jPb+LW5e7vROOboilkGCGBKxm3zjNY2?=
 =?us-ascii?Q?oeMdZlim00IMkRjC6bUWNTz73v+ggCeLrDhFcyFa6lPxshyFOjUEM8OJ1epJ?=
 =?us-ascii?Q?6Jmn8REV+HfTiNZCgwDUqEMwjCHKmQERMGrtPiDdXbZCi5D9aIZUOqB0iOuq?=
 =?us-ascii?Q?gg/F2nkoSyGTkH8jVfnZaQCKNhkVZC0Kyr+bW3pUqoixkiQjtU9vGEZjbY1x?=
 =?us-ascii?Q?G7zcZssykCbffT319DdXB0k5QlMq6BgvbNCvmu/zW6TPtJQuYN5ClhRTL7an?=
 =?us-ascii?Q?7ehS+FSwNZ4RVhSBNBUKNQcV0r2zvn1zwPTX8LhP1WzAUDnMLUN3gNeJmv7A?=
 =?us-ascii?Q?d4lUQgV0PU/GpZWTfiwzn3gLVxMDVdEWOmMUj8YUujISmfbKZgyayCF1jIbn?=
 =?us-ascii?Q?Hf0djWFODHWwyno8ez3vARguJl8+g30CXXCK8/FtVCrtkqfPmLkObw995OdM?=
 =?us-ascii?Q?xWYi+3To330+W3iX9eXC1pKJI5y8e0G00WE2UDrpikApp6d7upMoj/fV8wzs?=
 =?us-ascii?Q?PC0bJ9DC69Z/ck2KdRHW0qShBOPfXvTX51FwmTHBqxprp7U5tMrgsn1vsQSR?=
 =?us-ascii?Q?bkX7GtxUJF+2dkyvBX+9VK3re9jO0y6xtNT7DgwrW6YXHsmiRT9phym35gvS?=
 =?us-ascii?Q?IPS8gP8oTV4RB9kaVB4xsI3AuMAmnQNsSYRbLUiJ6Tg4pJOn6JlJP3UgtTfY?=
 =?us-ascii?Q?Zipf2WT5h6PqqiaoNNvTzfnMOAwKU+O/k9EAuhNKItB1k97R0K4VmUnt1fjj?=
 =?us-ascii?Q?bRpIh9NRWaCaE4m3Ztew81P2U/quNEu2EK8EbxiObhnQcZCKTT4pTvkNI0/B?=
 =?us-ascii?Q?OxEBCWvWDl6pQNSTpJ7ldpiav1872mDZ9yEpQzWvHQye7QaK+TIumf/X1CKx?=
 =?us-ascii?Q?2AvU0M3xnahER6IrjUBP0MXS8OYnj34J45Ne7od55zgsFqGUEThcHvqiaqcY?=
 =?us-ascii?Q?2g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a9623cd-0488-40c2-70c0-08dc17b61fb0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2024 23:43:36.4112 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lHwTAE5LCGnp+l4QmnIYwBUfsMn/7dkS3aFQxJiVk8jmyAdHRZJ+0a3kFNejDHVwSy10Tjl3hMhNxsLY4ckOS2D5t9M1N0rdcUosey45fR8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8175
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 16, 2024 at 03:56:17PM +0100, Michal Wajdeczko wrote:
> Shortly we will updating xe_mmio_read|write() functions with SR-IOV
> specific features making those functions less suitable for inline.
> Convert now those functions into regular ones, lowering driver
> footprint, according to scripts/bloat-o-meter, by 6%
> 
> add/remove: 18/18 grow/shrink: 31/603 up/down: 2719/-79663 (-76944)
> Function                                     old     new   delta
> Total: Before=1276633, After=1199689, chg -6.03%
> add/remove: 0/0 grow/shrink: 0/0 up/down: 0/0 (0)
> Data                                         old     new   delta
> Total: Before=48990, After=48990, chg +0.00%
> add/remove: 0/0 grow/shrink: 0/0 up/down: 0/0 (0)
> RO Data                                      old     new   delta
> Total: Before=115680, After=115680, chg +0.00%
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_mmio.c | 72 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_mmio.h | 81 ++++--------------------------------
>  2 files changed, 79 insertions(+), 74 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index c8c5d74b6e90..5a7f9a9d4624 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -413,6 +413,78 @@ int xe_mmio_root_tile_init(struct xe_device *xe)
>  	return 0;
>  }
>  
> +u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
> +{
> +	struct xe_tile *tile = gt_to_tile(gt);
> +
> +	if (reg.addr < gt->mmio.adj_limit)
> +		reg.addr += gt->mmio.adj_offset;
> +
> +	return readb((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg.addr);
> +}
> +
> +u16 xe_mmio_read16(struct xe_gt *gt, struct xe_reg reg)
> +{
> +	struct xe_tile *tile = gt_to_tile(gt);
> +
> +	if (reg.addr < gt->mmio.adj_limit)
> +		reg.addr += gt->mmio.adj_offset;
> +
> +	return readw((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg.addr);
> +}
> +
> +void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
> +{
> +	struct xe_tile *tile = gt_to_tile(gt);
> +
> +	if (reg.addr < gt->mmio.adj_limit)
> +		reg.addr += gt->mmio.adj_offset;
> +
> +	writel(val, (reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg.addr);
> +}
> +
> +u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
> +{
> +	struct xe_tile *tile = gt_to_tile(gt);
> +
> +	if (reg.addr < gt->mmio.adj_limit)
> +		reg.addr += gt->mmio.adj_offset;
> +
> +	return readl((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg.addr);
> +}
> +
> +u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr, u32 set)
> +{
> +	u32 old, reg_val;
> +
> +	old = xe_mmio_read32(gt, reg);
> +	reg_val = (old & ~clr) | set;
> +	xe_mmio_write32(gt, reg, reg_val);
> +
> +	return old;
> +}
> +
> +int xe_mmio_write32_and_verify(struct xe_gt *gt,
> +			       struct xe_reg reg, u32 val, u32 mask, u32 eval)
> +{
> +	u32 reg_val;
> +
> +	xe_mmio_write32(gt, reg, val);
> +	reg_val = xe_mmio_read32(gt, reg);
> +
> +	return (reg_val & mask) != eval ? -EINVAL : 0;
> +}
> +
> +bool xe_mmio_in_range(const struct xe_gt *gt,
> +		      const struct xe_mmio_range *range,
> +		      struct xe_reg reg)
> +{
> +	if (reg.addr < gt->mmio.adj_limit)
> +		reg.addr += gt->mmio.adj_offset;
> +
> +	return range && reg.addr >= range->start && reg.addr <= range->end;
> +}
> +
>  /**
>   * xe_mmio_read64_2x32() - Read a 64-bit register as two 32-bit reads
>   * @gt: MMIO target GT
> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> index 98de5c13c89b..67ead99f321b 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.h
> +++ b/drivers/gpu/drm/xe/xe_mmio.h
> @@ -24,80 +24,13 @@ int xe_mmio_init(struct xe_device *xe);
>  int xe_mmio_root_tile_init(struct xe_device *xe);
>  void xe_mmio_probe_tiles(struct xe_device *xe);
>  
> -static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
> -{
> -	struct xe_tile *tile = gt_to_tile(gt);
> -
> -	if (reg.addr < gt->mmio.adj_limit)
> -		reg.addr += gt->mmio.adj_offset;
> -
> -	return readb((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg.addr);
> -}
> -
> -static inline u16 xe_mmio_read16(struct xe_gt *gt, struct xe_reg reg)
> -{
> -	struct xe_tile *tile = gt_to_tile(gt);
> -
> -	if (reg.addr < gt->mmio.adj_limit)
> -		reg.addr += gt->mmio.adj_offset;
> -
> -	return readw((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg.addr);
> -}
> -
> -static inline void xe_mmio_write32(struct xe_gt *gt,
> -				   struct xe_reg reg, u32 val)
> -{
> -	struct xe_tile *tile = gt_to_tile(gt);
> -
> -	if (reg.addr < gt->mmio.adj_limit)
> -		reg.addr += gt->mmio.adj_offset;
> -
> -	writel(val, (reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg.addr);
> -}
> -
> -static inline u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
> -{
> -	struct xe_tile *tile = gt_to_tile(gt);
> -
> -	if (reg.addr < gt->mmio.adj_limit)
> -		reg.addr += gt->mmio.adj_offset;
> -
> -	return readl((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg.addr);
> -}
> -
> -static inline u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr,
> -				u32 set)
> -{
> -	u32 old, reg_val;
> -
> -	old = xe_mmio_read32(gt, reg);
> -	reg_val = (old & ~clr) | set;
> -	xe_mmio_write32(gt, reg, reg_val);
> -
> -	return old;
> -}
> -
> -static inline int xe_mmio_write32_and_verify(struct xe_gt *gt,
> -					     struct xe_reg reg, u32 val,
> -					     u32 mask, u32 eval)
> -{
> -	u32 reg_val;
> -
> -	xe_mmio_write32(gt, reg, val);
> -	reg_val = xe_mmio_read32(gt, reg);
> -
> -	return (reg_val & mask) != eval ? -EINVAL : 0;
> -}
> -
> -static inline bool xe_mmio_in_range(const struct xe_gt *gt,
> -				    const struct xe_mmio_range *range,
> -				    struct xe_reg reg)
> -{
> -	if (reg.addr < gt->mmio.adj_limit)
> -		reg.addr += gt->mmio.adj_offset;
> -
> -	return range && reg.addr >= range->start && reg.addr <= range->end;
> -}
> +u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg);
> +u16 xe_mmio_read16(struct xe_gt *gt, struct xe_reg reg);
> +void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
> +u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg);
> +u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr, u32 set);
> +int xe_mmio_write32_and_verify(struct xe_gt *gt, struct xe_reg reg, u32 val, u32 mask, u32 eval);
> +bool xe_mmio_in_range(const struct xe_gt *gt, const struct xe_mmio_range *range, struct xe_reg reg);
>  
>  int xe_mmio_probe_vram(struct xe_device *xe);
>  u64 xe_mmio_read64_2x32(struct xe_gt *gt, struct xe_reg reg);
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
