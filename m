Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25988C54E68
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 14:28:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D04B510EB11;
	Thu, 21 Mar 2024 14:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B5tpfzb4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F279A10EB11
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 14:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711031299; x=1742567299;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UWY6eayqr6uGP0LyW9v5g215OU5mquDi9VVNEfQ8cMg=;
 b=B5tpfzb4RD+6F/uVKgKf8w6S9fNXJFgXmCBhclYC7A10ngEKHv2cSNY4
 oO1AOwdv/4j5JRe4Umlx8bvWQcmpYAL15mVfbUuA5S6dkzZw/Q33TM4wM
 XH1HRODTLS8X4IxN6kT8HJT67kh/nXdrtMhdY8mochgD0RT73GD6kcS9N
 bOi41A3Guv3/eDj1n4Vlju/jd1JfjJ5/QNEgSxT0bw1Nvai/YiAOLdXF/
 pYg1ECLL6RLtWt7nj8HW9TBhsI5ydKyQnBR/eUioCjKCRY4g31rbzHMt/
 gmmCJjpROuRf3lrRpTBN+QyZPvdXzdjvRCXh1p1/tn0xsR3sy4vtgcL14 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="5915859"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="5915859"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 07:28:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="19172754"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Mar 2024 07:28:18 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 07:28:17 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 07:28:17 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Mar 2024 07:28:17 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Mar 2024 07:28:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JT+Zy+7sV7ewg0TA6BIa/nY4FSG4KgqCqoAZ8F5SF2FwlFZfFhxJqg8iRJanKhHEGhyl+GwypjOMe/3DQFObFdZSIdHeeGvl/NVx0LIcgS2XFjKtNPou7+3Nvxw5LpcMtSSEBlqlA/AHZyO7PPwtKv5+TyYSOQuH4v6l8ccx7OzVdT8Y/KGjAQVdhEO98dVQXIi5GrZhfS2ICcSfxQBMkKuNZ1YDlxCAvSX6dz81nenkgmpwfDiNslwxaTsFYnC3VJfcRt/LaKM3EO1Qpe6SKC6dOYXGu3DvUiq7A6/8lmpbCzX1lQSCzaQ9TKRWVGhPnnblo0rO4Bjai+H4T2JuXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FuXFY+xsltwdvsidv6pk5At6oHtjCQpiYPlYXrMZPkc=;
 b=AkKHuYGMd9Q6TMzRSHh+S9IKNDzqNYuKPg873/EhAYK8RxO8l+G03XuBas7CKnhr1qOeWTlI5Xq0IScgzBafayE/kpPq7CiuSgnC6s7seWpOY5lMAbzTl8Wd/OiJVUFrNJFFBlipb5t1R+k3j3lDKtLDBChWHXP9pf1wPRKhRRi8PXbYOF1CzXfCUg5NJLMqVyYDiHuC9WQIl+dRGaMtaV0Nq6pMJCYeODvbuqqoU0WP2tVW8KR53kM2k+LRfe9ifPwmpeyvJAMsbu+RsR+oqDuaxIKwLq+Z9p8hdCYHeBLnaBZIHcAXbfAFcz+aIdqpCYUTbpz/iq2ZpEjftkibXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA1PR11MB7110.namprd11.prod.outlook.com (2603:10b6:806:2b3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Thu, 21 Mar
 2024 14:28:14 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::602d:c299:6d13:7e5a]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::602d:c299:6d13:7e5a%3]) with mapi id 15.20.7409.022; Thu, 21 Mar 2024
 14:28:14 +0000
Date: Thu, 21 Mar 2024 15:28:10 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Jonathan Cavitt <jonathan.cavitt@intel.com>, Robert Krzemien
 <robert.krzemien@intel.com>, Matt Roper <matthew.d.roper@intel.com>, "Zhanjun
 Dong" <zhanjun.dong@intel.com>
Subject: Re: [PATCH v3 2/2] drm/xe/uapi: Add L3 bank mask to topology query
Message-ID: <ZfxD-vymph-WePfC@fdugast-desk.home>
References: <20240321142154.7-1-francois.dugast@intel.com>
 <20240321142154.7-2-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240321142154.7-2-francois.dugast@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: MI1P293CA0019.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::16) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA1PR11MB7110:EE_
X-MS-Office365-Filtering-Correlation-Id: c3a36631-6789-474f-868b-08dc49b324cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ESKWqGg/6feCsXTs/PXc86fU0B8k8zUtbSM/CYra9HI7nJqs8m/xqKo/jkwD2GTPfB9UNeCUMGvnvls7F0+EiHIzoV52H8lZJvRtnd2V6xaZGWeAeyUmwLt03P/7zjapXrsz1Fm+0gd6678+++TdEsFaQlsDLlQI4C2iAbEjh/uyOzBcX3qF7pTUMSQE1nRzHMdsI2ryR0KZaGLaEqCjDZxOlNy3cUmb7K7kaD4UIno0Fan9GZ+wiip14Sem72Lcl7YVLHuXKBRTgov3Nk7VpSURu5zTWhHUnU1VLmuc1M56KMjnENpnsip6ggLnCHPMRofuxZw603dZ/nVwIaU/zYa1R3SlBFDv0lfToYs7WPIjNJgPCZtY1yXzFGDdaFIdyFVzAvJcU8JgaYl1VespuWOuuCuuSTluJ5PORENAESfyVy/Vkh9k8bPPnZbGnyDA3jM/qoXQinkLw+QDtj7sZ1vZDWyQP95Q3jtVOKyirE7J0N8YIy5RK34OmJWy3aPvE+CViaI7Ho/rgaGQCtlj38QnExMOCnFYBor7sn6sXrNZnZEWG9F244ugRIBkZuZPwpXLm49y6ZUGAN1w13PP+8OwLG/+NZRKRlEI9Qfy/DJzr/GVg/Q9DkikaPAyjBYtkzg4itvzZ61sRiZdaJNnETypE+547LpxBbAXdFdkKyY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KbGVUMAyQwG8hIPl4uU7PNNftfNvK1kjvkmta2wfuocbKxK5lzCF07EmapUT?=
 =?us-ascii?Q?7Vh0HfdVeXlqRMBYMGNpxlua2mcxUmqmj1fiRNg22KsRFixguwnj7iY4Aslq?=
 =?us-ascii?Q?1lnBpjYjnpB3WKC7p2hS3rMdik+r0BjhhEFqm/zsTbvREMCJTVepi5c8ttGn?=
 =?us-ascii?Q?vedllUGas802bmAJVZSxjkrDyXGQegkKf3B6MmPPZX4XjxOnFEA/4G6S+n0B?=
 =?us-ascii?Q?7EllTZosR7ykMTirp+TnwHqLBx7ELdmm8D9qHUIrrf86kq/NWRqA1+xnNxLO?=
 =?us-ascii?Q?sdBYWO8MrAYh7p2dh/jWLFjAQtRUItXxgzHcxOHyRWcD9eE37AacdsTEPGR3?=
 =?us-ascii?Q?hLomh76uIscBa6qSn9BYSyUTAr28k0DhXe2ffQZ7H/BkYW7s58lDNwlMRAmQ?=
 =?us-ascii?Q?lZbbuD2hBvCAwzgSkmsASJpMVxIJ0QM6PyhqRpaq1hHbJBVSi3Ffrp4rg377?=
 =?us-ascii?Q?/k0gnDpbapCYxhxlupDjw9wFwweAh9Lj4ikayAudA4IQxCBkoMzHe0wrMZVo?=
 =?us-ascii?Q?edbHGzleFkMXYY0XBfImJ5nALoBZ3ImO70aEx6jDaQZlnEKehjEbmaDp2EC7?=
 =?us-ascii?Q?7nzuQbw4hIz/+EfLA/2AsQvC0rrS+aGP3VV4hkldW+0nKgrD2Y8X7fniUnWt?=
 =?us-ascii?Q?yGraGi/cwNm5Exa+4rRh31Bk1Xa1bd6KmdNn9jjuUCqNxCJSjkQG3lCbtHDo?=
 =?us-ascii?Q?A+f/4CaNLwxPVwKtxoyYQCP1qLgvZRxTVkNUM4kwj2IneHDWbQL+uDeex7zu?=
 =?us-ascii?Q?Cjzb+9iTjpgkfVzvHwHotgV/pbpbcx64KGdTI2n2BdUGn2R73uIzVMrAY7lI?=
 =?us-ascii?Q?nCtw2YNauhTySbIWTrPlNdCo9A04f3FEG4H6OdJzsIcp28ne391uIXsOZng+?=
 =?us-ascii?Q?wswODtnYhITsUGRHm6lDaBn80Ut3iyYBLjLSsbfTCD9q49s6RW4jpUAOD27A?=
 =?us-ascii?Q?d9T3XiH3TSwADHrOY703YRMsixMI3CupkmQNW2SDBu5BBvgXc0R7RYOTrb1I?=
 =?us-ascii?Q?Htl56E4U/LruQWjOKjz2fjCUBqmAlRWfXl742SsaKFn7/vCiv9yTiC49bqyt?=
 =?us-ascii?Q?HtQGMqDnAWuC+QenxNQ7AwYtHB5m9aKCP76hfJHvbgzpldYozNfPRA0WQ7B7?=
 =?us-ascii?Q?k1BiiLpybOVsfsgXO6Ewz3ZYckpaC/go6B9Q2wET0xSZOYjF+PF/Nwn6ZOjb?=
 =?us-ascii?Q?iYeNZE6Ad3vdE957i/UqBDgvp/xQdgZyebRh4wiq1TJVIz0s9tlKJ6YUbAdH?=
 =?us-ascii?Q?REBLL2bQOjRKZQiIxMIfApISRW9I9l/i0Jq9/B9XhzJ7jedkmoz06z0MPaDD?=
 =?us-ascii?Q?AFooWm0I2Xw65m3EPgFoi0ArWZdWVi9MLB1tBU+RWdd9BDfZCCvhcH15dT47?=
 =?us-ascii?Q?BcruAPoJpVbphfy7kv07OuDIh7bC6PqniMfCYvSve5e83i5RjHZfuhLzW1As?=
 =?us-ascii?Q?6cISrcxXc/6mksmrXJBnENzJ0v2XOqeqbuJIRCZ12vPZCI6fa9uW8W3p4/Je?=
 =?us-ascii?Q?xDJrJi332U9FF1SQ7MmJjhADB1Hb0dQnDGbmusNQb+wMChjPWX5j1dht6jwP?=
 =?us-ascii?Q?5TIisD+0qVnujJJVx9X9LJ6at3jvwNrxW1nKgoQZAoty2J95Ig9EpccCeIW1?=
 =?us-ascii?Q?rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3a36631-6789-474f-868b-08dc49b324cb
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 14:28:14.7493 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n/y5k1FR3Z5qhZt9XpXViLp6LFauK9fSPjjscwWZHOrWwH/kZe/j/InFyfqJwGOcSKfAq+KzWL8aFW3JkM0MR7m2a90dJOGbEjHc2vmMX9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7110
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

Please ignore this revision.

Francois

On Thu, Mar 21, 2024 at 02:21:54PM +0000, Francois Dugast wrote:
> Extend the existing topology uAPI to expose the masks of L3 banks
> to user space. L3 count is not sufficient because in some configuration
> not all banks are enabled. User space needs to know which ones are
> enabled, in the context of OA.
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
> Bspec: 52545, 52546, 62482
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Robert Krzemien <robert.krzemien@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 ++
>  drivers/gpu/drm/xe/xe_gt_topology.c  | 72 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_types.h     | 14 ++++--
>  drivers/gpu/drm/xe/xe_query.c        | 10 +++-
>  include/uapi/drm/xe_drm.h            |  1 +
>  5 files changed, 95 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 95969935f58b..be5b4936eb53 100644
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
> index fa8de1a77b1e..b830eac7a621 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -459,7 +459,8 @@ static size_t calc_topo_query_size(struct xe_device *xe)
>  		 * sizeof(struct drm_xe_query_topology_mask) +
>  		 sizeof_field(struct xe_gt, fuse_topo.g_dss_mask) +
>  		 sizeof_field(struct xe_gt, fuse_topo.c_dss_mask) +
> -		 sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss));
> +		 sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss) +
> +		 sizeof_field(struct xe_gt, fuse_topo.l3_bank_mask));
>  }
>  
>  static int copy_mask(void __user **ptr,
> @@ -518,6 +519,13 @@ static int query_gt_topology(struct xe_device *xe,
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
