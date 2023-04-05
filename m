Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC61C7619A
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 22:04:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8776910E562;
	Wed,  5 Apr 2023 22:04:30 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4106710E562
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 22:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680732268; x=1712268268;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YL3M/PwddbmeyQwpT/Aln0kLvJm0qPNKas1re8EAKYs=;
 b=DqtXVCWPZuftXEf5jHpEajllXfy2PKaZTxjp/hwdSj7/WrNX5Ca7OckI
 H1nn/WBRb38w7wk9X8qcvLABHqKGNRmZZNeW9UEi9k/s3cF5OoApw+pm1
 M6Zaq3zCkf7/LSrrnW7i31z/sGY2nQoQTA/M2g7mrjXDCh55mj1To4+Ay
 8CmKfwYScnBlQFMp7sR9tucj5vmqjzMyo4jaMl+xzIjFuryZDjnXXGl5g
 L8G5iIdrNCtVCapiqHIuXMvh6hyC35aBQXZBchJSjl1d0bt2RczZgJmSE
 /lvACKE9dgeVSFrVVKkK8fPwvztAZxYe81+I7zPI8kZ3tpwYNuReKDd13 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="407671706"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="407671706"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 15:04:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="680441322"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="680441322"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP; 05 Apr 2023 15:04:27 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 15:04:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 15:04:26 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 5 Apr 2023 15:04:26 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 5 Apr 2023 15:04:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ajNcTspjz1f46yDbWRGaTjF5ZomAgm3rEMYdIM00+OZjVABP7KqY0/wnNwQ6iX0eeB3N7eaMevhbGJIQZIHImtDPzppHDePOMMrGeHIZGc0Rirt++XhkggqdJQ/mgRbhKf2QUUqZNpOhdKTD1Cc5SPoJUlMEVDLoYHGmGWjVRlkHFFFac3HWP6SR55Uon4NF7oDoi4cEGep+TCMOE3PGbIz3EdKTm6aMMHYbRjKr2YPKyjGcGO2IsopOZWN5TiLjiKFgqvkxWOMWV246nmi0QUGjmNv4dmEEsbBAh8Qbjiu0VElcg0ikMLz2IN+j1rW6gb7Q16YbET7ZlAbzAluBuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bwBQL5+GOF7m8wnU0+sUewpPdt89KoW5DN1NDrs6RSw=;
 b=cfDtmxomHf6JRV3l+P0e6vUOvI3vc9vZmjLk0BicKkZNcses0c10yFJTb5zKXNUqns0e4TkjdeyHmAs8JEIMRJSPyP0wYxFpUJhomP/V8BCkhVfmRJU29XxgTvAYVPerWi+TNny7q+clKFshzqq1MJBT0q02MXmQOvh01re6iM8XYaz35ZOWYyq+UXWWt09ViESS9oRxGxIDmD8Ha9xlkiZpkCmohRPfnBLh+E46O01qL4N8aMoS3k1lW1LMHt+eIbegy+jLbzc3sKmQcqirjqM9ITVzGs31cBxpAx+UkC84GLBL+2VqDbAgVYuLML3JGACHG5BCaeOKLC83AXXU9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB8379.namprd11.prod.outlook.com (2603:10b6:208:488::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.30; Wed, 5 Apr
 2023 22:04:25 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%6]) with mapi id 15.20.6277.030; Wed, 5 Apr 2023
 22:04:25 +0000
Date: Wed, 5 Apr 2023 15:04:23 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230405220423.lgwzycxgzb7oce4f@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230403201702.996400-1-matthew.d.roper@intel.com>
 <20230403201702.996400-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230403201702.996400-2-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR05CA0184.namprd05.prod.outlook.com
 (2603:10b6:a03:330::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB8379:EE_
X-MS-Office365-Filtering-Correlation-Id: fb373d0b-57b2-4271-bcf5-08db3621b780
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UFWf3uJHKgJmktpGXy+VRiC92j3epVJEPAjbDZuYAvk4+rvgOwKgeog/iUHYU7IqzOlDrr85V2z8TGB8TBK5Bb4f7ouO7/iBLAxZIz0P4FbouwPCojWdeQ9L4RrxH+RA41Y7Dcz3CNxc/NHlsCTGelurZZS6Ss7g7BNtKXCq+LEQYFG3QArlCvjbsHXTBy1T35yevmIqjGxEBxL8n0q/6D8VjSqQKJBCuALhroL7r9OlPhRCJI51F0pD0Z6GeIfijSgNq+eeT7/RMEDDcyiO54bZRhptDUYI8buiioXfvJNnDWE3IH9sOekQjbasAV87zSsbFPU8Dqn3LJx/CwjXUxWdNqCPR4NU7gUt6wHnSGu2H4OZ+VjYd5NiICp/lmXlGXQOATb7LvFLiqDXXbYaQZ+OoYh7OvKF2peQB8t5/T2JwdsjUUTl0Z0m2ObIVAsHoKKWGlvWK35d+ZC8pNAyOR9xkJQDS58BB644KS/ZrlfLTwDQ+/M0Mc7do+W3nc4MnDxJot5ro7ZLBEmv01UIefJ6V0WqyQ5W8R51KVv8xlEPIO5cVYRKd6XcO+Mjm2uT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(346002)(376002)(39860400002)(366004)(451199021)(186003)(36756003)(86362001)(6512007)(9686003)(6506007)(1076003)(26005)(5660300002)(6636002)(6862004)(8936002)(316002)(478600001)(82960400001)(8676002)(4326008)(66476007)(66946007)(66556008)(38100700002)(41300700001)(2906002)(83380400001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HbskzlRyP2kIo3DbwElyYQZFiEcDZVvjFmWF/ytQe5ksgvqaY6pgLMSobykr?=
 =?us-ascii?Q?SGk/JzGS2O98WY4/nGHcQTdUcLSVNKwFhukkcswSu2mJ9UK218JjYxPOAo3n?=
 =?us-ascii?Q?i6neuKK/IFByhZD7KVUvRJyaalVBF0L7RsAZkUQkoeQbr3geci5u1e2d2wAU?=
 =?us-ascii?Q?AENIp9zYwoWKiehAQL64JfGtgaWii6wbBgqISGyM5vo+YkZEY2jb9N1cg8q5?=
 =?us-ascii?Q?ulW5NqQ8vHKfNXSinLernSzJyjf9aOjUf6TKc0NQT3vs7Bz2z6snf8wyuSMZ?=
 =?us-ascii?Q?dI5bCnsjS+bs8eHVpaSYeD7UMxt8lNtvrcbyqN7lR+/cWmkcmAvn8NWtCsJU?=
 =?us-ascii?Q?d3trZrKaG1mp01O9B0K9mFGZxfCO4eRTHIUiyD8634ag93dPU063RItLLpsg?=
 =?us-ascii?Q?OMxa8dikgevLQ5wspHUsj62l2S5ysiulpV/90Zu5QU91MJdddLtSr8ldfFJu?=
 =?us-ascii?Q?t+UKcLPVxUkjZ0gPcNCICzPvKHJDUaUsmRsN6deA3gbFmZ7dXMBmfM0OyvdW?=
 =?us-ascii?Q?PyWn+37ZBDnarwACSpzOsuIE5fcwWRqvjUxVSTAcwzk28xO6qRb4St8DX16F?=
 =?us-ascii?Q?TxH5VneG5wCzC4g3dT7Joj4E2BuLe+X2SN9T0Fu6oqjlNDMVjYlyyL1KjEac?=
 =?us-ascii?Q?DEAt9Arn+FPkEpI8gbVv+itK+tnwFdXFTPGmZFwvedCjYKKiArDUBEAACYw0?=
 =?us-ascii?Q?EfcCvCH1qDMIMyf++vijSTmfbCuLyT31Fhusxx0iVfNz7rNKq09NhuqbvY9o?=
 =?us-ascii?Q?3Jd2FuAl508jcpRrxBuj5oy/9ua4Hv0z2huw2mK2Dw/cznXGETf7/337mAfc?=
 =?us-ascii?Q?6BYj6K7hY0dAsnLpithM250JXFWNOQMStgM1nLMM2oKbqWCgwJz0p6DQG8ax?=
 =?us-ascii?Q?H24TX+Hz2HcnxEgYR3SfCs6s8hN1PtZuHor2ebKykiQi1WocZkj3a2+wTU6l?=
 =?us-ascii?Q?SQIDJBeMFUALJ+r2bOmABCrMkzg0dFMZRKgbN7dtJZFvY4l5Fueae9tyY0ua?=
 =?us-ascii?Q?XqlKUnHvMsV2Q0WZonPf8LLGmOYdnU1g09MrVp8XlEij7VCSENc9VYBlhviA?=
 =?us-ascii?Q?hdowwFkS0PMMhF0QRx81P9pZevJ0oEwi9PtxRQwULsJIeMzoZOmsOgKgoXyT?=
 =?us-ascii?Q?F4vstyZMSj0wvKewGyxZWMNMw9SnLV4YluV0IulAFsliDaM8W1sTpEHKMPdq?=
 =?us-ascii?Q?bQ3F6G6lBt3ZgzV6LjGuzhdPm4dFYO4EwGzDj4lyazNb7kl0KHVrDOm6Zoaa?=
 =?us-ascii?Q?WwK4ihJ/cy2fnzqp6Z8jXeE4ZL6X1VBzd8g4LLTXhGoE1tWrXgm2aGgcfxwh?=
 =?us-ascii?Q?wVFuTfvu3h49mQuGEcQvq7GaJQM1mPiGJIkGr1s/0gpj7xHw/9xanlMVX9Om?=
 =?us-ascii?Q?tqf+CDbm6Okt58Ky6wmrtxGckx7FMsAklgrqmDD7iaHPFvVe3/L27JyVoAez?=
 =?us-ascii?Q?vITSSCZwvRO8BRU5ne9R/O7pmE3qVCWL/Z7cjyOPS8hDL4EDGHZFelMuou7u?=
 =?us-ascii?Q?4ZfEgRBlnluDovTsHPnAAXVztBDr+8Y75KGujTudkHokVYRaYqoUNYcybOV1?=
 =?us-ascii?Q?wBhJTVhV6/dIJYkVARDswl/jVuMtZE3gF4sehJS8atnziQVSWI4kk3w/0tjO?=
 =?us-ascii?Q?lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb373d0b-57b2-4271-bcf5-08db3621b780
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 22:04:24.6218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yeue5Z4LSEgoWdjVp1KOjkshC++tsSwXVVk5UsBPxumOzyg99tQKV4simhhnSTjzUjjoYDz5NqblfB3C5kMugWr8kksdLpglVvfy/CLXR60=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8379
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/6] drm/xe: Start splitting xe_device_desc
 into graphics/media structures
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

On Mon, Apr 03, 2023 at 01:16:57PM -0700, Matt Roper wrote:
>Rather than storing all characteristics for an entire platform in the
>xe_device_desc structure, create secondary graphics and media structures
>to hold traits and feature flags specific to those IPs.  This will
>eventually allow us to assign the graphics and media characteristics at
>runtime based on the contents of the relevant GMD_ID registers.
>
>For now, just move the IP versions into the new structures to keep
>things simple.  Other IP-specific fields will migrate to these
>structures in future patches.
>
>Note that there's one functional change introduced by this:  previously
>PVC was recognized as media version 12.60.  That's technically true, but
>in practice the media engines are fused off on all production hardware.
>By simply not assigning a media IP structure to PVC it will effectively
>be treated as IP version 0.0 now (which the rest of the driver should
>treat as non-existent media).
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_pci.c | 103 ++++++++++++++++++++++++++----------
> 1 file changed, 74 insertions(+), 29 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 91fed9d3105e..bfc2c61fdb99 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -42,11 +42,19 @@ struct xe_gt_desc {
> 	u32 mmio_adj_offset;
> };
>
>+struct xe_graphics_desc {
>+	u8 ver;
>+	u8 rel;
>+};
>+
>+struct xe_media_desc {
>+	u8 ver;
>+	u8 rel;
>+};
>+
> struct xe_device_desc {
>-	u8 graphics_ver;
>-	u8 graphics_rel;
>-	u8 media_ver;
>-	u8 media_rel;
>+	const struct xe_graphics_desc *graphics;
>+	const struct xe_media_desc *media;
>
> 	u64 platform_engine_mask; /* Engines supported by the HW */
>
>@@ -84,17 +92,57 @@ __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
>
> #define NOP(x)	x
>
>+static const struct xe_graphics_desc graphics_xelp = {
>+	.ver = 12,
>+	.rel = 0,
>+};
>+
>+static const struct xe_graphics_desc graphics_xelpp = {
>+	.ver = 12,
>+	.rel = 10,
>+};
>+
>+static const struct xe_graphics_desc graphics_xehpg = {
>+	.ver = 12,
>+	.rel = 55,
>+};
>+
>+static const struct xe_graphics_desc graphics_xehpc = {
>+	.ver = 12,
>+	.rel = 60,
>+};
>+
>+static const struct xe_graphics_desc graphics_xelpg = {
>+	.ver = 12,
>+	.rel = 70,
>+};
>+
>+static const struct xe_media_desc media_xelp = {
>+	.ver = 12,
>+	.rel = 0,
>+};
>+
>+static const struct xe_media_desc media_xehpm = {
>+	.ver = 12,
>+	.rel = 55,
>+};
>+
>+static const struct xe_media_desc media_xelpmp = {
>+	.ver = 13,
>+	.rel = 0,
>+};

I'm thinking if this isn't overly verbose with one letter different on
each of them :(. Not very happy with the direction here, but it seems
to be correct

	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>+
> /* Keep in gen based order, and chronological order within a gen */
> #define GEN12_FEATURES \
> 	.require_force_probe = true, \
>-	.graphics_ver = 12, \
>-	.media_ver = 12, \
> 	.dma_mask_size = 39, \
> 	.max_tiles = 1, \
> 	.vm_max_level = 3, \
> 	.vram_flags = 0
>
> static const struct xe_device_desc tgl_desc = {
>+	.graphics = &graphics_xelp,
>+	.media = &media_xelp,
> 	GEN12_FEATURES,
> 	PLATFORM(XE_TIGERLAKE),
> 	.platform_engine_mask =
>@@ -104,6 +152,8 @@ static const struct xe_device_desc tgl_desc = {
> };
>
> static const struct xe_device_desc adl_s_desc = {
>+	.graphics = &graphics_xelp,
>+	.media = &media_xelp,
> 	GEN12_FEATURES,
> 	PLATFORM(XE_ALDERLAKE_S),
> 	.platform_engine_mask =
>@@ -115,6 +165,8 @@ static const struct xe_device_desc adl_s_desc = {
> static const u16 adlp_rplu_ids[] = { XE_RPLU_IDS(NOP), 0 };
>
> static const struct xe_device_desc adl_p_desc = {
>+	.graphics = &graphics_xelp,
>+	.media = &media_xelp,
> 	GEN12_FEATURES,
> 	PLATFORM(XE_ALDERLAKE_P),
> 	.platform_engine_mask =
>@@ -131,9 +183,10 @@ static const struct xe_device_desc adl_p_desc = {
> 	.is_dgfx = 1
>
> static const struct xe_device_desc dg1_desc = {
>+	.graphics = &graphics_xelpp,
>+	.media = &media_xelp,
> 	GEN12_FEATURES,
> 	DGFX_FEATURES,
>-	.graphics_rel = 10,
> 	PLATFORM(XE_DG1),
> 	.platform_engine_mask =
> 		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
>@@ -143,26 +196,18 @@ static const struct xe_device_desc dg1_desc = {
>
> #define XE_HP_FEATURES \
> 	.require_force_probe = true, \
>-	.graphics_ver = 12, \
>-	.graphics_rel = 50, \
> 	.has_range_tlb_invalidation = true, \
> 	.has_flat_ccs = true, \
> 	.dma_mask_size = 46, \
> 	.max_tiles = 1, \
> 	.vm_max_level = 3
>
>-#define XE_HPM_FEATURES \
>-	.media_ver = 12, \
>-	.media_rel = 50
>-
> static const u16 dg2_g10_ids[] = { XE_DG2_G10_IDS(NOP), XE_ATS_M150_IDS(NOP), 0 };
> static const u16 dg2_g11_ids[] = { XE_DG2_G11_IDS(NOP), XE_ATS_M75_IDS(NOP), 0 };
> static const u16 dg2_g12_ids[] = { XE_DG2_G12_IDS(NOP), 0 };
>
> #define DG2_FEATURES \
> 	DGFX_FEATURES, \
>-	.graphics_rel = 55, \
>-	.media_rel = 55, \
> 	PLATFORM(XE_DG2), \
> 	.subplatforms = (const struct xe_subplatform_desc[]) { \
> 		{ XE_SUBPLATFORM_DG2_G10, "G10", dg2_g10_ids }, \
>@@ -181,15 +226,17 @@ static const u16 dg2_g12_ids[] = { XE_DG2_G12_IDS(NOP), 0 };
> 	.has_4tile = 1
>
> static const struct xe_device_desc ats_m_desc = {
>+	.graphics = &graphics_xehpg,
>+	.media = &media_xehpm,
> 	XE_HP_FEATURES,
>-	XE_HPM_FEATURES,
>
> 	DG2_FEATURES,
> };
>
> static const struct xe_device_desc dg2_desc = {
>+	.graphics = &graphics_xehpg,
>+	.media = &media_xehpm,
> 	XE_HP_FEATURES,
>-	XE_HPM_FEATURES,
>
> 	DG2_FEATURES,
> };
>@@ -216,14 +263,12 @@ static const struct xe_gt_desc pvc_gts[] = {
> };
>
> static const struct xe_device_desc pvc_desc = {
>+	.graphics = &graphics_xehpc,
> 	XE_HP_FEATURES,
>-	XE_HPM_FEATURES,
> 	DGFX_FEATURES,
> 	PLATFORM(XE_PVC),
> 	.extra_gts = pvc_gts,
>-	.graphics_rel = 60,
> 	.has_flat_ccs = 0,
>-	.media_rel = 60,
> 	.platform_engine_mask = PVC_ENGINES,
> 	.vram_flags = XE_VRAM_FLAGS_NEED64K,
> 	.dma_mask_size = 52,
>@@ -254,16 +299,15 @@ static const struct xe_gt_desc xelpmp_gts[] = {
>
> static const struct xe_device_desc mtl_desc = {
> 	/*
>-	 * Real graphics IP version will be obtained from hardware GMD_ID
>-	 * register.  Value provided here is just for sanity checking.
>+	 * FIXME:  Real graphics/media IP will be mapped from hardware
>+	 * GMD_ID register.  Hardcoded assignments here will go away soon.
> 	 */
>+	.graphics = &graphics_xelpg,
>+	.media = &media_xelpmp,
> 	.require_force_probe = true,
>-	.graphics_ver = 12,
>-	.graphics_rel = 70,
> 	.dma_mask_size = 46,
> 	.max_tiles = 2,
> 	.vm_max_level = 3,
>-	.media_ver = 13,
> 	.has_range_tlb_invalidation = true,
> 	PLATFORM(XE_METEORLAKE),
> 	.extra_gts = xelpmp_gts,
>@@ -406,10 +450,11 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> 	if (IS_ERR(xe))
> 		return PTR_ERR(xe);
>
>-	xe->info.graphics_verx100 = desc->graphics_ver * 100 +
>-				    desc->graphics_rel;
>-	xe->info.media_verx100 = desc->media_ver * 100 +
>-				 desc->media_rel;
>+	xe->info.graphics_verx100 = desc->graphics->ver * 100 +
>+				    desc->graphics->rel;
>+	if (desc->media)
>+		xe->info.media_verx100 = desc->media->ver * 100 +
>+					 desc->media->rel;
> 	xe->info.is_dgfx = desc->is_dgfx;
> 	xe->info.platform = desc->platform;
> 	xe->info.dma_mask_size = desc->dma_mask_size;
>-- 
>2.39.2
>
