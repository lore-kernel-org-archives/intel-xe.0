Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F7CBC4332F
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 23:12:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBC9510E52D;
	Mon, 11 Dec 2023 23:12:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A94CD10E528
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 23:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702336364; x=1733872364;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=0jfjVs3KoyfC+6CW2fcaPdeBuYLBB3VMTIFBvxitMRw=;
 b=AgCRmjNKolc8c4cJy1wU1WbQSgz4SD45jjmSoM3cIOtRrax0A/k1z4+A
 VTGkCzCivj6fZrg+Roa8O/YqBi8veTN26stvjY/fN+VLfb9EoC3Oe17vP
 4pAW5e488yfZ4hS+gSk1UlKx6KWFbKWOCHtD9dR9w/qgqK5+9iVv4i8AD
 Ce0NGzuQkOlJfI+UbexFeafH0PGVqdNb0gwdAK687Jmq2NHqroChCeqEg
 bczCABwOSJwgzYbWPMr7H5RuuJM846pyNuUbl+XgCilLUX60KK5RIssPm
 Ijbc64McUrG9YF8X3M2L4S1L3RVGIK/0940l/KXL+lsCKUT1ga7CyvSmn Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="8085929"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="8085929"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 15:12:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="802223405"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="802223405"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 15:12:43 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 15:12:42 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 15:12:42 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 15:12:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m1ULVUPZ1xjVcAYHam/PLBW/bsYTKrjrQxxaB3XQUb+14FpNvlGcvv0vqQQBG77+rDQ357UUUX8gOl8vkIV/v9ii+y8z2c94JTumLdRcE/Vh2tZtXbC6HGhBKdO7s01yo/1b58TFR19C8zJK85DqqFvTt1cD9Pfy6kMilqVmuNsfIBFccvBbCBPV3gOvR1e43BL9ek5a0ypQMK96PYnKu+mZ1Rb1TLxgZpugftUZbPHAT/PcQnGlUyjw205PgDg0xtc+ndHeLkQMebg1hGlsN+PmmUzHy8ncTgSLaqYPC/Cq1cjlLd4IN+TJWqE3iZ7l6HDrM9T+ESBu7CUgYp0bWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ovCpJPKdDpmwJhNI8yjZXiOAPfcsf6AY9CmDvG/X1wI=;
 b=QOUM+fJ51U7HGdOzg7KTDCrjFeQYNSNa7DoWOMQX8I0FHTB2nqDqWiym+tqhYb84sVQpIhhjEZ3SH6f/tATQ0jPkNj19t4eSBuU/N1pZaIEYaQL0AWGeEWpqI1rQrdAY3713tSt6Rwrg5nk82nvpD2m81obYHNRBgsCMAoK4679H7DmUdSj5XccuOdRi2lujGfbMgSdYbxX+i4G4mEhj9hYo562XTTHeNjsT3+kzlZJpim4+k8nCD0hTniPTXxyqFZ2Uc8HS79i9dm17zNIwe+vAzG+e8NSMsvM3BV1RSUqMDM+53CwxewrMYdvO7IdDq8DmKEsdw60bwCUniIaN3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB6882.namprd11.prod.outlook.com (2603:10b6:510:201::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 23:12:35 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7068.033; Mon, 11 Dec 2023
 23:12:35 +0000
Date: Mon, 11 Dec 2023 15:12:33 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v7 01/10] drm/xe/xe2: Determine bios enablement for flat
 ccs on igfx
Message-ID: <20231211231233.GB1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231211134356.1645973-1-himal.prasad.ghimiray@intel.com>
 <20231211134356.1645973-2-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231211134356.1645973-2-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: BY5PR13CA0005.namprd13.prod.outlook.com
 (2603:10b6:a03:180::18) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB6882:EE_
X-MS-Office365-Filtering-Correlation-Id: ee1597f0-6d80-4c39-21d8-08dbfa9ea916
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CG/qHu6osHQh4oAqpnpyfzaxbumNEpsLYPc2kBFNUqWgIaGzlYmiO/9/l5GzcYEz1oN6AQXG3+cjzI28kuhF3HhjabDxEKhBR9X4ZgXMmDdQ3zQa1VpAnEVOXsYTnFGr05znkm8tspPbmbpEbBidzvIfL9kDMxOrEJ19YH8yoSw2QgBmbLq6gm0fjFfWW3F+YZHwYHi//RUK7mjIe/8M5mJaXIf2NJDxRU5VQeLptXE6quNIuHj0DHwkmvw2ENahx2M6LiCcPClgO2s9su8N9o0uzhVMzqorX6Tucd3f+x5erBwTE6lLPyHn4ovRxD8QOpZLzRBQL1Qg/HdR1RolYD7NW0g/nI+lDdXeNQn5NsU7hervnTM5rjHdN1ZrRrN2MGTVyBjXlcEwWryoczqxX0XPg7YY1DSf1X47x7/yCmpXit7K1hFTRLhGWsR7azbyuqQh9luSKJRvAo9tqZLsMHO6et+AnYuihqhwNkTr1kHH4MwKBT83yeee35TC0hwNp+3GPdTo4Y09cdY4lZDZA6QgM1ysso7JWYpQ7EBqYaIDQdTbHOYHgpOQ9su3POSG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(376002)(39860400002)(396003)(366004)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(41300700001)(66574015)(1076003)(26005)(83380400001)(82960400001)(33656002)(86362001)(38100700002)(5660300002)(316002)(8936002)(8676002)(6862004)(4326008)(2906002)(6512007)(6506007)(6636002)(66476007)(66946007)(66556008)(478600001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?DCEtomx7XMC0khpGaXdz/lxQ1b0eiGpijL6Mf6V854uAlqdu2hUR0bMm3i?=
 =?iso-8859-1?Q?qEw+rmdL6zCkvsz1+uurBRBsvo25yn71c6B5GUw8OuC8JF5kJ2vPO94NeX?=
 =?iso-8859-1?Q?1XRVuZUPaImu0pTsS8uunJBD1vMnzDCeoxT3i7Vd3zhO2IqkDfGZFL4wUn?=
 =?iso-8859-1?Q?44B2+ad6vklujIHmjzHfXtkfo+ezy69YLeEABn7TMIQZyj8pH1h+X4IVWQ?=
 =?iso-8859-1?Q?HJT6VmSDpI/g1FwgS6c4EV/eGi6FrICvrcdrw59eIGSyFi34r6NzwpwRLE?=
 =?iso-8859-1?Q?cTEAOIz7QIcj/jHDh7Km8TW2VbAfOcZeGnMtPTsO8kjPLE6KnH691iM1Df?=
 =?iso-8859-1?Q?hd5OpspDNf48gFkA1nyYUh7d1Z2KGZq1EuIWMVBYZt9pSIVYDlIi2e+VXZ?=
 =?iso-8859-1?Q?E9hYWPIG9crQIa+uF0MoCg0L561xqKgWedqEs+7RYdKK4L0x+Z4HlzXKPJ?=
 =?iso-8859-1?Q?ISfh8e/+6xWJw0jndSUfafV6MrhUoxKkdpPKlOjOpOenxI5HwyJcDVZpMM?=
 =?iso-8859-1?Q?QoB+d234N8Fh2VHdlZMOOG8dU9J4/jqHXvYZbtlgyeeZPTmX3xGe5tHK47?=
 =?iso-8859-1?Q?wQs+bhlzurii0hf8BZgJljv/j6Sih4kilIk8BUVGeauYZz3lnHBNfcXAdf?=
 =?iso-8859-1?Q?17WyacRBtUtOTcdFstEWJkRGZ39+spyyyZLwwvxNb54b+l2Yy5oeT1mGdt?=
 =?iso-8859-1?Q?tyQpdG1TuRcIUv9zcz4EZjpNTNdDXwgNQtmfPJF1AChWOVN2F6w/epAREA?=
 =?iso-8859-1?Q?KCqYGqSKetUZKv37rSZhUGjWZD0hsKLoJfoiOtCB6oZbQ1SbFsrpffZ8vv?=
 =?iso-8859-1?Q?535EraRE9K3SIny9TmG0FN8MkEgNbxucJ39sDQc/iHZa0nCCGUACI71WKM?=
 =?iso-8859-1?Q?KakO7eG8vbZHzGIlUZqhytM9OVutqQJNL7/GlgwR1Q5jOpkZUQnxLnWXBB?=
 =?iso-8859-1?Q?IXHrkdNDpv+3RZ7ZY+4N6RBjRY9QSc2xEivb076fh8doYMRk2qhuL8Yc21?=
 =?iso-8859-1?Q?tO62D/HJRIGH/QXuFLfWFKWDSDz9ZQOV9O51ptYHQNuaYV4+MJEa/SNMBJ?=
 =?iso-8859-1?Q?2kVaUSDCKRa/sUT5CBhz+MMwmARYW8Q1smpJAmUaPt66b2galVo3EvDpTT?=
 =?iso-8859-1?Q?BaQytSVG1FbIHdLo8M6UtJY15XcmlaJgADZlj/XH8dvV1HVM4cOLwxFZ4W?=
 =?iso-8859-1?Q?lhm/jkv//pMVchUlBBdfIKVroxhhxGiyCzDWIbs5cPk/tY3MQ1+704NG18?=
 =?iso-8859-1?Q?9Duu6HKxt6sKvpbsQGO/zMuEv7jsecoyzAwifGEHpV93RCJTEV1R8YcznS?=
 =?iso-8859-1?Q?nkVHZTSvq/zLTKgua4Xjxu1s3I7MwKZD+5qshWoHWQ4xjP/tImrUz7snkE?=
 =?iso-8859-1?Q?LI5enpEMk1DT2pBnFV1doGsmJvE+wnlGoF4wXxhZxcWUFbsWv+yv6n007k?=
 =?iso-8859-1?Q?RlThYgYNoTQ1gqz6hfIrEVa7banbMAquavCfNJ0OwBCFWYtkyBA8ApWKuV?=
 =?iso-8859-1?Q?DU8lhKDds0tuZT50++kZf1MPSXJufwQWGtVG2FR6EVicTX/RHsnnTfv6bx?=
 =?iso-8859-1?Q?wO4pGEou+teoQqZzdwGbQaLy6m8NKcBYRCP4aPtt1F+Pf5nvosuvJaWW+w?=
 =?iso-8859-1?Q?TxWTovinF/df4wJ6kSo0CBz/dlrW4lSaOO3SI2G58LwJfMwC24vS4h9w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee1597f0-6d80-4c39-21d8-08dbfa9ea916
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 23:12:35.3063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RCflnzyt60u1HEnViCTJ+WbUsKBdH9MAuV0xvscLjd/xODT3vZyg0hIQ49VtBdnP0sEi5us75QC7BqJLKjVrDALXGgpCRsUP6QjwziegNtg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6882
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

On Mon, Dec 11, 2023 at 07:13:47PM +0530, Himal Prasad Ghimiray wrote:
> If bios disables flat ccs on igfx make has_flat_ccs as 0 and notify
> via drm_info.

s/drm_info/drm_dbg/

> 
> Bspec:59255

I think I asked on an earlier revision, but if there's a more general
bspec page about FlatCCS handling, we should include that since this
register detail page doesn't give any meaningful information on its own.

For example, what's the difference between the enable bit in this
register (0x8800) and the one in XEHP_FLAT_CCS_BASE_ADDR (0x4910), which
is a register that the driver is already using on DG2 (and which still
exists on Xe2)?  In fact, is it pre-existing a driver bug that we
haven't been checking that CCS was enabled on DG2?


Matt

> 
> v2:
>  - Release forcewake.
>  - Add registers in order.
>  - drop dgfx condition and only add it back in the future
> when the support for an Xe2 dgpu will be added.
> - Use drm_dbg instead of drm_info. (Matt)
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 +++
>  drivers/gpu/drm/xe/xe_device.c       | 30 ++++++++++++++++++++++++++++
>  2 files changed, 33 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 5f5a72e9d0d8..f5bf4c6d1761 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -162,6 +162,9 @@
>  #define XEHP_SQCM				XE_REG_MCR(0x8724)
>  #define   EN_32B_ACCESS				REG_BIT(30)
>  
> +#define XE2_FLAT_CCS_BASE_RANGE_LOWER		XE_REG_MCR(0x8800)
> +#define   XE2_FLAT_CCS_ENABLE			REG_BIT(0)
> +
>  #define GSCPSMI_BASE				XE_REG(0x880c)
>  
>  #define	MIRROR_FUSE3				XE_REG(0x9118)
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 2e0b2e40d8f3..91f5807d2d20 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -16,6 +16,7 @@
>  #include <drm/xe_drm.h>
>  
>  #include "regs/xe_regs.h"
> +#include "regs/xe_gt_regs.h"
>  #include "xe_bo.h"
>  #include "xe_debugfs.h"
>  #include "xe_display.h"
> @@ -26,6 +27,7 @@
>  #include "xe_exec.h"
>  #include "xe_ggtt.h"
>  #include "xe_gt.h"
> +#include "xe_gt_mcr.h"
>  #include "xe_irq.h"
>  #include "xe_mmio.h"
>  #include "xe_module.h"
> @@ -401,6 +403,30 @@ int xe_device_probe_early(struct xe_device *xe)
>  	return 0;
>  }
>  
> +static int xe_device_set_has_flat_ccs(struct  xe_device *xe)
> +{
> +	u32 reg;
> +	int err;
> +
> +	if (GRAPHICS_VER(xe) < 20 || !xe->info.has_flat_ccs)
> +		return 0;
> +
> +	struct xe_gt *gt = xe_root_mmio_gt(xe);
> +
> +	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (err)
> +		return err;
> +
> +	reg = xe_gt_mcr_unicast_read_any(gt, XE2_FLAT_CCS_BASE_RANGE_LOWER);
> +	xe->info.has_flat_ccs = (reg & XE2_FLAT_CCS_ENABLE);
> +
> +	if (!xe->info.has_flat_ccs)
> +		drm_dbg(&xe->drm,
> +			 "Flat CCS has been disabled in bios, May lead to performance impact");
> +
> +	return xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +}
> +
>  int xe_device_probe(struct xe_device *xe)
>  {
>  	struct xe_tile *tile;
> @@ -456,6 +482,10 @@ int xe_device_probe(struct xe_device *xe)
>  			goto err_irq_shutdown;
>  	}
>  
> +	err = xe_device_set_has_flat_ccs(xe);
> +	if (err)
> +		return err;
> +
>  	err = xe_mmio_probe_vram(xe);
>  	if (err)
>  		goto err_irq_shutdown;
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
