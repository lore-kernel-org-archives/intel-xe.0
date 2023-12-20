Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D0FEC3DA6E
	for <intel-xe@archiver.kernel.org>; Wed, 20 Dec 2023 16:49:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5524C10E5E9;
	Wed, 20 Dec 2023 16:49:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7489110E5EA
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Dec 2023 16:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703090956; x=1734626956;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8iq6HK56irF3bZ1R0gmcnP0C20lQKBlI+fATHBTWBgw=;
 b=nP2aTy60b4b2Sp6ZZB8XPHGcPTBnC7l+g1Szz7TL7Qgj4kESWXYfzdkP
 TSzrbYvs4zS4NYWZ9MWSIexDlrG5pTtdvto3JzKgmXcMSA/wLcsFeq7wf
 AT6qDwH89VrumtxZdhBdWMrdLgZW7xHAlIOEXUPFuTrbqU/1nY6dDWCnn
 x6VZxUFljlp2CNMOgnCcL3UratrDZLlji3Z7gTdBNE6VmNbKCYeYTyghD
 wjZr3MkkwfFBp1ZXMetWi5GyAO3z2xk1ZKQLFEy8ATSXbTsf47Yr9h+rC
 fCKnjGmMklsS6Ckr9UmlaLiCL0iH2LLMHF8iFRDyQaVBBGSfsT2nKBp3C A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="14530485"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; d="scan'208";a="14530485"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 08:49:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="726135103"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; d="scan'208";a="726135103"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2023 08:49:15 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Dec 2023 08:49:15 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Dec 2023 08:49:15 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Dec 2023 08:49:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=brCxTYSKVzVD8TShssqX7YuWWiJ1rU3Tn0zJa5Q1QXx2oM14IR2cHjYxFgEzrNdFBW1CkDmeLxybMTFZrUdWShX+PS7op7agkAGzO9uaQCBz6CIT0QK2MPkoC+6wgchyDIJX3m1Z0RIvt20INGV4ZZIWHaWvXKt3KaS6klkei6IjlvfLuiKyPzzFiXs09EfXNaManDvf02M70mjMRlgeeA8anMFOjoM7MjRtzUT4zgkhudFjckGxV6quCcDjAWzCBgJXWVc/hzVfzvXXLy2RDUIXtIaTz/qIdGG8uCwRCtflAeyVuQtzDw2BzYCCkBYG6iCC1UGDnJePjnNfVk8WuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T2O4vNba84ZpAzuSh3JQhsRrIqxdZlHwwhXgTpIgZ1s=;
 b=ApXIGWvwPLciWJR+Q4KVlT1ARux2qbaO2PJb1WTn05fzIhYyUIamMs89wYYvmO3I2VfBpM/0W8iyaVpcsXJWt/tW32bBCEaLOow4osnS4BP+kmbh1ycQjAD0ZVwoZuZlrkktgjPVdL6m4hfMAvCkhiHOna84bdQc32ixUs9e6/TSHnRGKDJzIgve/C5zu3UNv9ib6UQogfLURj3S8ig5/vrM0eQqqehkaqKfc5p/kA6/ffrisFnZpWB4UAMkd3MVVcVxZ63nTXhzI03x8lhFhZUoTW7oLVtDCeeJXbfgTe3lq/1oHg44b+NA9JwPt2L9mHwnytcyX/uzhY5N4hpYOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB6743.namprd11.prod.outlook.com (2603:10b6:a03:47c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Wed, 20 Dec
 2023 16:49:12 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7091.034; Wed, 20 Dec 2023
 16:49:10 +0000
Date: Wed, 20 Dec 2023 11:49:06 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Subject: Re: [v5 1/3] drm/xe: Add vram frequency sysfs attributes
Message-ID: <ZYMbAvUzYlbuNq0d@intel.com>
References: <20231219100711.645011-1-sujaritha.sundaresan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231219100711.645011-1-sujaritha.sundaresan@intel.com>
X-ClientProxiedBy: SJ0PR05CA0093.namprd05.prod.outlook.com
 (2603:10b6:a03:334::8) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB6743:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e10442c-1f9f-4cb2-8c59-08dc017b96de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sy63U2DzWrx9ahoiDYQTJT6hDSPHnQ5n8rWSeFQy/0d3IPC9caRWkVRpTzQOIbT+pPksQjL4E76kHt7jWGGwoIaemngQvA8PfD8wmpio8mAezsp89g6LAba25s/rzbQmRA9tGUkw+RRC6Y9OxoCvrRLWRFJptCPqyGe/48wRrsy39bMDY+DNBVCATu6jRaRYvmY/d92TKliLuVY7tz84HmMJInenY91Nz4kSQf7j0AVO7y6rrPARHJPNgTbqlqVcj5pqRb4dTiVjz3cc97JIbCuhfE74hp3Tqep2vHUyCnHuhk5LnMK1BYwikGGOjrAS+x1wrm11DsA2M3HVxTjsLwaOJ25cM1+15ZRjZRaKnr8IZwmsWBPVY0LHNZFNY9K8101iqzSZXK/qdg4YmK4g7YHR5BWimWq/5oir+29AAo4XLZpgN3lqKAFVAnvR1yARo1WnRcSL2YXA0h30SX4KGQSs8OFa24ZeH9eU5wytB2to/O60790HYb9nENa3tMIfKDMlDxf1x6+SQ0TDM/ACC5LkHVfAAChPnqnQq4tt4vh8GEFyUKsWMMTco4zM8OHi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(376002)(396003)(39860400002)(136003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(2616005)(6512007)(26005)(38100700002)(83380400001)(6862004)(4326008)(8936002)(316002)(8676002)(6486002)(2906002)(44832011)(37006003)(5660300002)(6506007)(41300700001)(6636002)(6666004)(478600001)(66476007)(66556008)(66946007)(36756003)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ACLUqkuT/e6d3w68ffgZa24ScRf9ftGVHJ2hOMwLFH3AmcEVI3u9UI/a4sKU?=
 =?us-ascii?Q?oGcczRdVR+cgUy+7EPTUQCa0NqjxRGkBjjm/kERe2d1aGyXYV6Xv6rJJDnX0?=
 =?us-ascii?Q?7rU5GTqZTdTBgPoOITb8cq9YiupiHeNgv+7eqNs9rfkllQaYYwGS8wOxRzvB?=
 =?us-ascii?Q?2L2CDk7KiUZblFoy6OPhw+5SqrQ0ypE/utUI0/jYUsSBq4di/Q7/KQz4gxkP?=
 =?us-ascii?Q?OabFvEjfUUklmaO+yfKLGYDtIlkHY/YkM2w3CZQ40X0DyOhHc5NxSn2IcPv1?=
 =?us-ascii?Q?d6GL4xdkSLAHJV5z3UvwEYyIyXo4Ymba+CPf9n/lP6AVVSZxKaPWTC07UIl5?=
 =?us-ascii?Q?8aj6BiF87ebXCAROluTcc6C9ToMzc1ed50dAIRxciGu48H2L3CmaXdpqIPNp?=
 =?us-ascii?Q?F8xcblJUCmruL79QiGoxvsjIMyLhCmyw//APfYTgzx5P+Y4jQAj0GLarUjFH?=
 =?us-ascii?Q?+y6RYewTrzqMFb7D/BFiFFr3u5ShI2C/dMnCJy/C7nIR/LS7cHURX6cCjXhZ?=
 =?us-ascii?Q?VIx02J4Fh3NR1CK1p5ZdMHJdYHmlgeKHdKz0tCIs3gVi2tEupeCvqVhaUsaR?=
 =?us-ascii?Q?ncWx2ZZuXGG2b8PunGJbzzm5HwFUANhNzrVXOWdRFvgusGFyd2kllP+MaJ3z?=
 =?us-ascii?Q?Vpn6GbKnDghi6a9rpgseAU098N6hwtVdDFVsUhUesZHey5SAkwL4TXnruzlm?=
 =?us-ascii?Q?2JwwQh15SRCdBlyKfh8yjb6i5MdQ9mlRrG4Tj9qhm+c7FlQKxC0SqQyu6ANF?=
 =?us-ascii?Q?/U8puVUeuOWrxyr5+a83NX1Nd1yrs5dhaFGIfmCWM4yMFvm3CNPfihYPhcwk?=
 =?us-ascii?Q?w4kGWqYp2SoTX/3nzwpCapJuScM7uIjkmNx94kaHe91KUm81RBSMpJJWrk9+?=
 =?us-ascii?Q?fxsZ03O5sMbB//R8c6AnzRm9md3F7ERcIJlggMhOWUVejCRL0sDCtlG5m43z?=
 =?us-ascii?Q?6Uy/U81/YRlUyjfnv/WxvvvqT4ethMQR5L2Ghii5ZEdP2Qb3vZloeKF8y+23?=
 =?us-ascii?Q?uJm8jmIGfRGHEPOB/SRye16g5lLTnZ/FKQfkQRRuxOCpqx8R/jfs/y+RcNT9?=
 =?us-ascii?Q?PKlIIxpAZv+4u2q8nZ1ju/oq4cA0PLogs6iIEbrm7dyXC22my6djBbg9diAA?=
 =?us-ascii?Q?mZseAl+JJzv3YWDcq6xaMltGrjkD5yORKcC2GBQ0XQjRcZ3Q3kq31GBV/ech?=
 =?us-ascii?Q?WU/AJ0cIVAtjKxet3dMhLpltLK6RtpUCWZG7bsDE0rIMLmVp+McBFGhz6eMM?=
 =?us-ascii?Q?rFlF6ZU0F+84PDwGke8U8SPp7yt5NAKVSKPBpeLZsW5Flq4bIjrCdRzAulQX?=
 =?us-ascii?Q?h3MUKqxAUQKgFj8uoDgKROzygIV4OmqjmqtAfFuHVakJcRCGivMj0z1Xar/q?=
 =?us-ascii?Q?zDsj+Np+jkic474IL0cGl+dsW119m2ZonbEnR7f0BjZNR9z7acL6jxxhY/Zp?=
 =?us-ascii?Q?uO3YwSqujDjh6/xg79OGslocjxizg5dZaGUB895XAp5bugVafGOuCqCKdiy5?=
 =?us-ascii?Q?vzLEeX41oHRRqwAR1hilXZNUPdHtt4hNmg30Zop0c4Em+Sew37r9r886TFX0?=
 =?us-ascii?Q?JMHoQH7lS9mYR+igCEchTCprgoqFpGx1aDVcHt3B?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e10442c-1f9f-4cb2-8c59-08dc017b96de
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2023 16:49:10.6666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cbd/eFaBahJWIjMl4DPLRU4vkcIjLO6TyonXkCXy2VpQ/dZKH3yl+7avwPvDHOWh+VpHXEr94ca3WOaAK7iu5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6743
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

On Tue, Dec 19, 2023 at 03:37:09PM +0530, Sujaritha Sundaresan wrote:
> Add vram frequency sysfs attributes under the below hierarchy;
> 
> /device/tile#/memory/freq0
> 			|-rp0_freq
> 			|-rpn_freq
> 
> v2: Drop "vram" from attribute names (Rodrigo)
> 
> v3: Add documentation for new sysfs (Riana)
>     Drop prefix from XEHP_PCODE_FREQUENCY_CONFIG (Riana)
> 
> v4: Create sysfs under tile#/freq0 after removal of
>     physical_memsize attrbute
> 
> v5: Revert back to creating sysfs under tile#/memory/freq0
>     Remove definition of GT_FREQUENCY_MULTIPLIER (Rodrigo)
> 
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pcode_api.h  |  8 +++
>  drivers/gpu/drm/xe/xe_tile_sysfs.c | 86 ++++++++++++++++++++++++++++++
>  2 files changed, 94 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 5935cfe30204..4076a4e9daf3 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -42,6 +42,14 @@
>  #define	    POWER_SETUP_I1_SHIFT		6	/* 10.6 fixed point format */
>  #define	    POWER_SETUP_I1_DATA_MASK		REG_GENMASK(15, 0)
>  
> +#define   PCODE_FREQUENCY_CONFIG		0x6e
> +/* PCODE_FREQUENCY_CONFIG sub-commands (param1) */
> +#define     PCODE_MBOX_FC_SC_READ_FUSED_P0	0x0
> +#define     PCODE_MBOX_FC_SC_READ_FUSED_PN	0x1
> +/* PCODE_MBOX_DOMAIN_* - mailbox domain IDs */
> +/* PCODE_FREQUENCY_CONFIG param2 */

let's keep some consistency here.
probably a single like like

/* Frequency Config Sub Commands (param1) */
above

and

/* Domain IDs (param2) */
here

> +#define     PCODE_MBOX_DOMAIN_HBM		0x2
> +
>  struct pcode_err_decode {
>  	int errno;
>  	const char *str;
> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> index 0f8d3e7fce46..1d34912e6184 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> @@ -7,9 +7,21 @@
>  #include <linux/sysfs.h>
>  #include <drm/drm_managed.h>
>  
> +#include "xe_gt_types.h"
> +#include "xe_pcode.h"
> +#include "xe_pcode_api.h"
>  #include "xe_tile.h"
>  #include "xe_tile_sysfs.h"
>  
> +/**
> + * DOC: Xe Tile sysfs
> + *
> + * Provides sysfs entries for frequency in tile
> + *
> + * device/tile#/memory/freq0/rp0_freq - The Render Performance 0 level, which is the maximum one.
> + * device/tile#/memory/freq0/rpn_freq - The Render Performance N level, which is the minimal one.
> + */
> +
>  static void xe_tile_sysfs_kobj_release(struct kobject *kobj)
>  {
>  	kfree(kobj);
> @@ -20,6 +32,65 @@ static const struct kobj_type xe_tile_sysfs_kobj_type = {
>  	.sysfs_ops = &kobj_sysfs_ops,
>  };
>  
> +static ssize_t rp0_freq_show(struct device *kdev, struct device_attribute *attr,
> +			     char *buf)
> +{
> +	struct kobject *kobj = &kdev->kobj;
> +	struct xe_tile *tile = kobj_to_tile(kobj->parent);
> +	struct xe_gt *gt = tile->primary_gt;
> +	u32 val, mbox;
> +	int err;
> +
> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_FREQUENCY_CONFIG)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_FC_SC_READ_FUSED_P0)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_HBM);
> +
> +	err = xe_pcode_read(gt, mbox, &val, NULL);
> +	if (err)
> +		return err;
> +
> +	/* data_out - Fused P0 for domain ID in units of 50 MHz */
> +	val *= 50;
> +
> +	return sysfs_emit(buf, "%u\n", val);
> +}
> +static DEVICE_ATTR_RO(rp0_freq);
> +
> +static ssize_t rpn_freq_show(struct device *kdev, struct device_attribute *attr,
> +			     char *buf)
> +{
> +	struct kobject *kobj = &kdev->kobj;
> +	struct xe_tile *tile = kobj_to_tile(kobj->parent);
> +	struct xe_gt *gt = tile->primary_gt;
> +	u32 val, mbox;
> +	int err;
> +
> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_FREQUENCY_CONFIG)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_FC_SC_READ_FUSED_PN)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_HBM);
> +
> +	err = xe_pcode_read(gt, mbox, &val, NULL);
> +	if (err)
> +		return err;
> +
> +	/* data_out - Fused Pn for domain ID in units of 50 MHz */
> +	val *= 50;
> +
> +	return sysfs_emit(buf, "%u\n", val);
> +}
> +static DEVICE_ATTR_RO(rpn_freq);
> +
> +static struct attribute *freq_attrs[] = {
> +	&dev_attr_rp0_freq.attr,
> +	&dev_attr_rpn_freq.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group freq_group_attrs = {
> +	.name = "freq0",
> +	.attrs = freq_attrs,
> +};
> +
>  static void tile_sysfs_fini(struct drm_device *drm, void *arg)
>  {
>  	struct xe_tile *tile = arg;
> @@ -32,6 +103,7 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>  	struct xe_device *xe = tile_to_xe(tile);
>  	struct device *dev = xe->drm.dev;
>  	struct kobj_tile *kt;
> +	struct kobject *kobj;
>  	int err;
>  
>  	kt = kzalloc(sizeof(*kt), GFP_KERNEL);
> @@ -50,6 +122,20 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>  
>  	tile->sysfs = &kt->base;
>  
> +	if (xe->info.platform == XE_PVC) {
> +		kobj = kobject_create_and_add("memory", tile->sysfs);
> +		if (!kobj)
> +			drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);

Please do not make up the error here. If it is a single error return by
the function we should probably do something like
 drm_warn(&xe->drm, "failed to add Tile memory directory\n");

> +	}
> +
> +	if (kobj && xe->info.platform == XE_PVC) {
> +		err = sysfs_create_group(kobj, &freq_group_attrs);
> +		if (err) {
> +			drm_warn(&xe->drm, "failed to register vram freq sysfs, err: %d\n", err);
> +			return;
> +		}
> +	}
> +
>  	err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
>  	if (err)
>  		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
> -- 
> 2.25.1
> 
