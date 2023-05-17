Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C45C77B7A
	for <intel-xe@archiver.kernel.org>; Wed, 17 May 2023 05:14:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FB5510E047;
	Wed, 17 May 2023 05:14:46 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9944610E047
 for <intel-xe@lists.freedesktop.org>; Wed, 17 May 2023 05:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684300483; x=1715836483;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aR9veeYg2G5iLxrwXNgvAFqMZP+FQ4/LUNagMamDyuc=;
 b=Y3QnKZ62p1HYSdkoaMWXkJ7PZYuSrdcyQhuwVs2gmtPWaO7yPYMsSzzM
 RoCn9o2kadYItls6iQeYX0JYhXxxDNijCvG/KQEBtKa+U2UPyTQXAniIH
 GbnQEmyWzknhp/Ohr9jyOqC5/y5gRkptf7CxA7hbeLh+/3S/fPplCYDcI
 tTsbrwpmvOiT8d7t35o8qyb6LYe+Dde82ggyJwnr3may22jaipN6RSz7p
 wbBP1gSFKlLkzizya+PHmFVyx+xcNIOarHt162VTHPLnUCQ/WNw01p3v7
 wrtsmbPKApnKJAQ3m/LOFMJeR2RMLUbpSz+YFU+1+X7r35KfmpjKsjoBj g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="332025860"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; d="scan'208";a="332025860"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 22:14:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="695730710"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; d="scan'208";a="695730710"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP; 16 May 2023 22:14:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 22:14:42 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 16 May 2023 22:14:42 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 16 May 2023 22:14:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cr4NzXC4wAGiW4rI+BDoC17I9YC57g9KNIgXGke8elonzQEelBSUL7vFj2Tc8juQPbawFjh7fYUjXsY2tavk+ZdcqQamRtXQKdvc/3EsS/zIMqgex26lhncAAYYxolkeBkFbQRviNH0CBtUeV/gLVszlNw8ls8hAxkPFwv/kA3/aW7gxIg+DKjU6ySQqY7ME4TdOs7ZoBvEBbzX56Nw0oldvEVUCWbRbQWg8XdtGPwBtsJXGIyoMbLEpMqBavzmE6uwkvMIbqET48LAySjp+xfCiDQuMpuDpl3BAYc1xOulbpWBI7BWJfQ+SJWEk6vjahc+C9to2cOvS5nyBlMh0wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RWXS7NgyelFO3b1L1XHS+dC78oSB0MUYsaeSWTg1kMY=;
 b=VDHl5jkvsZrV/kEQCQ3DmHTCC27S7RrTeJysxD84ir8fL6wG/vtJtZ8Xxo6tYaOq5bBAskBc/mJJAD/z54L/Cr1HCp2Vh2CPVvPldJSh9ndv2slXeX1djQuXj3OoGxF7y3ua/4Swck7iOxjLaAqGEyshEe38di2LTRFFCFQeNlH+YSo8oV+1c0/xJFF+9hSYsU0nsptOPFKTUw4dPSbTFRcsvX67GvMJNsolx+FAEhLJVhd4/8ADjIqVcfxhLH9cWUCQLVbrAMC6/mqOAMr0vRE+Dk8okTTE+w1GUE0Ee+2pbVeQTRZd3tAslTWTl6VDJ9i8H3zBCM488cSDYFFmYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY5PR11MB6233.namprd11.prod.outlook.com (2603:10b6:930:26::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Wed, 17 May
 2023 05:14:40 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6387.033; Wed, 17 May 2023
 05:14:39 +0000
Date: Tue, 16 May 2023 22:14:36 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <kumtxvmaruznyeroxksaf62ske2a52bftyoxug4lgtwsxbk5q7@z2xdcreh27xq>
X-Patchwork-Hint: comment
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
 <20230511034722.1929038-12-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230511034722.1929038-12-matthew.d.roper@intel.com>
X-ClientProxiedBy: BY5PR17CA0042.namprd17.prod.outlook.com
 (2603:10b6:a03:167::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY5PR11MB6233:EE_
X-MS-Office365-Filtering-Correlation-Id: 571e6d65-2b3b-411b-17d8-08db56959d58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KCO6vN3MQFxdITqtoZs83ZtNSIvZM788dwSEtKmiEbuH/2T+o9JOZ0NFW6am6NJqb+efcGV16aOH0mpnfDd/52XDl7+QEiTYGi3865fmU4yrSEOKDEQcoXY0L31K0E4ZuhtvJrw0bqv3ZCkMMLBpSpW1ZIB3NeQkEHn4XA5+rbs5KLZfvpGcvBA8Ft0a3I3vsAVkbuIQ8rS/xur7aaSzXBgCHSwf0dMxWi+2HqH01tXP/86lxC1jA8PLoXfjPbcrtCPsXtudiEYfO/eatvQZyle4RW7//SQDsDAxIjnNl4dP3zOIpxx44fN4+SgWKwFqkL3yOwC0mmKUE1bJG19o+73oZcB6aJIcfj1685/Dtv2t/TnzjTX1YtXWyN8TErsheA+5TxhSlQwxurVH/+QYBV0apikZh7X+SJH3VSFW07W80Al2RQ04YK4DEtL+gN2PbGFsauBnjDBJC5gRdcfBkYuFNWZg/nDzt8AZyP6GHXjMsAgGD7+dfMcjgVXwrbNuE3uICV5zZbxziXDTIKK7bC44Z8AL4K7tgI2GI4moTEKcfLWZ7Q9d5fFov45Fd+Bc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(366004)(396003)(136003)(39860400002)(346002)(451199021)(6486002)(4326008)(6636002)(66946007)(66476007)(478600001)(66556008)(316002)(86362001)(83380400001)(6506007)(26005)(186003)(9686003)(6512007)(8936002)(6862004)(5660300002)(41300700001)(8676002)(2906002)(33716001)(82960400001)(38100700002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8BTx9cm/8CZDq4v1nNK2+Q8d02hUVcBMAtQHaQdEOHCXDHX9oGNogf3Lw8Cc?=
 =?us-ascii?Q?RrazeNUK0BxOZ5Ky93kknIh4mdTzB3q2Wza5MzB2+C14+dUKJM7JjOGLUHSZ?=
 =?us-ascii?Q?D5+EadVBJ80G+VPu3JZ0pVS05B/SRMUe7Is4yg+YRtSJB+pPQyfxOqQE1pjb?=
 =?us-ascii?Q?1APRSL6OCpI4nVwXQFedwaqnOHVyfh4+8uYL/yLtyygk61IwtCTfaGZdsWgn?=
 =?us-ascii?Q?9qPKJlETJEHXYB0HUJlkgQ5HKDrDAWNBUqrpGI2RNiags0tOFtAz03gwaz8g?=
 =?us-ascii?Q?Vo4RoJmEcZyBGzNE4qzCCh7sUa9CxJoJ/u4WsaQLGR62AALy5pxMIUnX1xfA?=
 =?us-ascii?Q?OxJFX5slhR9OqyD75Si9GvzTsCpBOLykmvesaLtI95/w/wMgomLhCR1/QOaN?=
 =?us-ascii?Q?UkS4aLPoX3WHAW/qbxCZ317Ph5WYkVRDCYy6z6jPalSx8K94zAvzaacw6zN+?=
 =?us-ascii?Q?x9SD8mgpacsJ4XFDQImnQsP0d/MAn+GOo97qfmZMSlw/QVcJ0RGTdohMILmt?=
 =?us-ascii?Q?+XB1ETRsEmYrQbWwPJwjbJUOEIQCfmt/yV8kCwzCSWvYexcSIK84u/lWt6VI?=
 =?us-ascii?Q?DjgcuhskN+6euEafCXr5Srst3zVW41+ZCpm1fvHmgv2ru+CQKgDVWYV+axSp?=
 =?us-ascii?Q?eCTm2ZbjnSTaXmSapGBZ+8F163tsDS8q6YBEF4SGDjCi7tz/uGA8ml2cfsjF?=
 =?us-ascii?Q?XjLoB1aHH3IPcqiUOnKPqzvvLMkrAi5JP07+DBqR036oLr6zYFM+/IDli5k0?=
 =?us-ascii?Q?O3BT4igKjcSzwEKhiW7nhmJGCE+G+6dwoUmYB9lbWn/NPhvgu8qP2Bwk+1zM?=
 =?us-ascii?Q?uuV+Ji4drf1FgvFQ+TfT+eC8aixBWdiw3725IznFIug9gE4eHEOOMx6kOFN4?=
 =?us-ascii?Q?G+9uaYQx4PkjGxug7SZV2aw680UA3Jz749CBsDOxpRT5+5GJ9ElJx6xoMlqR?=
 =?us-ascii?Q?bd7KhDQ+ZnIstn0PTO78pHYkQiVo1vJnqJlSduh/luVoNR4CjoN1S+KRfGLl?=
 =?us-ascii?Q?1Qm93r1YNtC1TnQB8nBAN7DsQTkYwBzOyx34rt7X+EPXfmJuRnNgHsL91wAE?=
 =?us-ascii?Q?tGZG0CvTGdcDaUbDsLU4DwOnMq6XTpfZtwlmF4SR/QmIdRYnNdWrvUM7YS0f?=
 =?us-ascii?Q?CKz4Pfef5KoPAFpNTZMiFKTZ99qemT4m5rwh63ZCBf1DSQXzPnkflpbzWghi?=
 =?us-ascii?Q?Vtlb/kLAEGASlEJcsirxJwGVOPdvmFe17pvtxh1DinjFtYTDQW4QXnXy5F3K?=
 =?us-ascii?Q?d/cCr4fLghjpCoLtLe3v8OE+P99pyvP+Uz9InWh7P/1ugDW2vsGklwZVnicj?=
 =?us-ascii?Q?VDUi9s2gACdVhSDIHAzxMeMoZQ93eD6bJ12ZsFrKNVnjIyF71tZGz8zu97z0?=
 =?us-ascii?Q?YUBjhvzgCaO6eNsjzkDh9EWKjU6n41ecRyxnf0NlvHDewW/AXKmcV5tm8VU+?=
 =?us-ascii?Q?qW4RNiP7g9zyVPFe0iIVwly+ekkA3TcUkl4RkARgpX4EuAwDu/TJUEvaoQk6?=
 =?us-ascii?Q?VYCRjYuHStxCxv5LG+U2glMzmfIO6oKOMMMeTB2iWOynKUPrA+jSHPGtMoVb?=
 =?us-ascii?Q?0ZEgk1v3njn15xX5RuDjJ5RgmP4gAQTOYJqGL3pugQTgXGCtEMNFPtcxtwQ8?=
 =?us-ascii?Q?oA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 571e6d65-2b3b-411b-17d8-08db56959d58
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 05:14:39.4771 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VynUR2phbRfbQKoep2GVkLyhCrQPNytZlT7Z0vJj0apV1rpNyXDofNJFEHVOabNvYas9EMZFbGvbPFs18sq6jMIIHEvPk8FOmI3kYntqrSU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6233
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 11/26] drm/xe: Drop extra_gts[] declarations
 and XE_GT_TYPE_REMOTE
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

On Wed, May 10, 2023 at 08:47:07PM -0700, Matt Roper wrote:
>Now that tiles and GTs are handled separately, extra_gts[] doesn't
>really provide any useful information that we can't just infer directly.
>The primary GT of the root tile and the remote tiles behave the same way

				     ^ missing a "of"?

>and don't need independent handling.
>
>When we re-add support for media GTs in a future patch, the presence of
>media can be determined from MEDIA_VER() (i.e., >= 13) and media's GSI
>offset handling is expected to remain constant for all forseeable future
>platforms, so it won't need to be provided in a definition structure
>either.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_gt_types.h |  1 -
> drivers/gpu/drm/xe/xe_pci.c      | 37 ++++++--------------------------
> 2 files changed, 7 insertions(+), 31 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>index 8a5f9122ba80..5e0bfb21ae1c 100644
>--- a/drivers/gpu/drm/xe/xe_gt_types.h
>+++ b/drivers/gpu/drm/xe/xe_gt_types.h
>@@ -20,7 +20,6 @@ struct xe_ring_ops;
> enum xe_gt_type {
> 	XE_GT_TYPE_UNINITIALIZED,
> 	XE_GT_TYPE_MAIN,
>-	XE_GT_TYPE_REMOTE,
> 	XE_GT_TYPE_MEDIA,
> };
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 0f3508c72c79..bfdc9563e54f 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -46,7 +46,6 @@ struct xe_device_desc {
>
> 	const char *platform_name;
> 	const struct xe_subplatform_desc *subplatforms;
>-	const struct xe_gt_desc *extra_gts;
>
> 	enum xe_platform platform;
>
>@@ -254,20 +253,11 @@ static const struct xe_device_desc dg2_desc = {
> 	DG2_FEATURES,
> };
>
>-static const struct xe_gt_desc pvc_gts[] = {
>-	{
>-		.type = XE_GT_TYPE_REMOTE,
>-		.mmio_adj_limit = 0,
>-		.mmio_adj_offset = 0,
>-	},
>-};
>-
> static const struct xe_device_desc pvc_desc = {
> 	.graphics = &graphics_xehpc,
> 	DGFX_FEATURES,
> 	PLATFORM(XE_PVC),
> 	.require_force_probe = true,
>-	.extra_gts = pvc_gts,
> };
>
> static const struct xe_device_desc mtl_desc = {
>@@ -531,26 +521,13 @@ static int xe_info_init(struct xe_device *xe,
> 		gt->info.id = id;
> 		gt->tile = tile;
>
>-		gt->info.id = id;
>-		if (id == 0) {
>-			gt->info.type = XE_GT_TYPE_MAIN;
>-
>-			gt->info.__engine_mask = graphics_desc->hw_engine_mask;
>-			if (MEDIA_VER(xe) < 13 && media_desc)
>-				gt->info.__engine_mask |= media_desc->hw_engine_mask;
>-
>-			gt->mmio.adj_limit = 0;
>-			gt->mmio.adj_offset = 0;
>-		} else {
>-			gt->info.type = desc->extra_gts[id - 1].type;
>-			gt->info.__engine_mask = xe_gt_is_media_type(gt) ?
>-				media_desc->hw_engine_mask :
>-				graphics_desc->hw_engine_mask;
>-			gt->mmio.adj_limit =
>-				desc->extra_gts[id - 1].mmio_adj_limit;
>-			gt->mmio.adj_offset =
>-				desc->extra_gts[id - 1].mmio_adj_offset;
>-		}
>+		gt->info.id = id;	/* FIXME: Determine sensible numbering */
>+		gt->info.type = XE_GT_TYPE_MAIN;
>+		gt->info.__engine_mask = graphics_desc->hw_engine_mask;
>+		if (MEDIA_VER(xe) < 13 && media_desc)
>+			gt->info.__engine_mask |= media_desc->hw_engine_mask;
>+
>+		/* TODO: Init media GT, if present */
> 	}
>
> 	return 0;
>-- 
>2.40.0
>
