Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34776CDB47E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 20:55:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFDEB10E552;
	Thu, 12 Oct 2023 20:55:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63B7010E552
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 20:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697144153; x=1728680153;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uG+QNypTW+s0D7cy3/UJVQfZcMQc0zSGEKsBwQl6Tz0=;
 b=WTRd+Pj6kGvdYx2gD1lg+AzBnM8BidGWMYhUXgAuG+uzBAKvSd3lQzfl
 1QjbnS+6ugaCVAfgphX2Xm4Ywjb4w3S+Ls1c7HDAB3HpnLNTnJQKxnL0m
 OBAP15kKE7w+GJUS3TgpP3AAy+H9gwgKxHdR2KiA8xG8aLGDhAN/QCFmU
 QIAAp5DG/JHD+WO7TZiGPi1Xz8Xfb7zf+e/Pcvttqf3/HfoMTIDduHZdp
 CKWgw6QeInOUQMV68UAhflVQUXgjNwCLSdqP7AZ2Co/RJrwZ/4M9iLpyQ
 evkvuBT6f/qbhtu5pakg3OYtvZo8ODyR2n98R7MXI3hkwny7v6ENLuQKm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="375388485"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="375388485"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 13:55:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="824759337"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="824759337"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Oct 2023 13:55:51 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 13:55:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 13:55:48 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 12 Oct 2023 13:55:48 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 12 Oct 2023 13:55:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U2pMnaOfy8xVgFz1OVWeFYSQ97X6uZOO2PCwsKZV+at/Vjf46eCvCBNsnl/QS5wZEaqzzZzuZkAaRI5lEri5ZRZVDbnkQKsxkTSAp30QJHCq/5XybuhNOOXrFwHCZ/FhaqcD0t2Pi2I49KNlzHnfNo4G8dAT79lmkivk3XaxCaLABqDFIoD1x77+2C8hni/ZfkEuvQVxOIm5b/VLm1qWdGF5yrJW0ulDDUVxlR4ddJt4pE4ix+tlmdCbf1zmj1El2nhnkwVjnrlpuCWjDsFQl5BsL3Ybc7tH6p0tZc+A0DY2Tex52KMFEdwQK+zXdF4yQlYMYzEGBkQFTIBOpJJNhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JgiYgn9EZ8N58ELVqo/GCX4C4188e502mZN98rxx4x0=;
 b=OTnq9yXxa6ikMAywGEdryJ13QQSwCkNHIaFCIo7kI8ugb0vTOnOOUH8izO+cBeNqEsDIXcyZzUT2fNerdra82JKogpYY3DqBZv0HIyVwWsajNcbsQHocrSY/15AqxSl6FLT54SO5ndP+gR7l0BlQ6TRw2Etv4cbdTGwA/keKXlAv1MAub7Qa/ys3xFX+SZRMjNcO8qNW4NYpRylcVi7coSvBZdxUZhXev2mzy4n95dYIN47Rjdsgb3ufQW6h56fAtoHPSJAPLPrgEKTALLnp+sU4DZv3CEi2SxhNBQJ8T6fVxNYat8U2bNSkzST0ViZZTpP/jikyVsxFZKgDexS3YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH8PR11MB8105.namprd11.prod.outlook.com (2603:10b6:510:254::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Thu, 12 Oct
 2023 20:55:45 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::cf65:94e6:cdd3:cfe]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::cf65:94e6:cdd3:cfe%7]) with mapi id 15.20.6863.032; Thu, 12 Oct 2023
 20:55:44 +0000
Date: Thu, 12 Oct 2023 15:55:41 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <pyuuzeqdal4ynnudiz5thlssext67qaxuxz7fu2ho6fi2y3li4@mw6lo2vdr4pz>
References: <20231011230957.463381-8-matthew.d.roper@intel.com>
 <20231011230957.463381-10-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231011230957.463381-10-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR05CA0198.namprd05.prod.outlook.com
 (2603:10b6:a03:330::23) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH8PR11MB8105:EE_
X-MS-Office365-Filtering-Correlation-Id: 13db2972-db66-4853-cfdf-08dbcb659a36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yI4QEdc6rM7qN2HQF6rYChuHUAsd1XKt2FmlITekwgw1wQxvR1nPLruuJn0Oug8XyJJdBAU6Z7RY6l1uia7+ufne3ha3JVvBOatxOmN79pt4so+6GFme+6IzpFmn9PPh9UiJYmtHxXXAyp5grEzNI4doDEngkD51smgSIK5wkwNyzoke3hJpDxQ2A9if1WtodN/ny1Y9wwPyOIyu0n8DXyW10Myw8tsmClIXhtA24pGvPMmGJQv/g/n8p/OQBs8MWZ68qaSMsInuczd+FIAtoI7Qgb3SfqKMe8WlkorkgTOfOMkrlXh3P6nMqIE1V7TIVL/G3ox1oUUNBFogo2VjjnQ9g3tVC1WW3RucerAnQ632WJ4swGYttwTMtmsQY15Os9c2Q/f5n2QI7z2A/o2oeYlDFI/VnY+KixQkVUWkafZpr7yAPRqW26leG96Pe3qXZDskrYaTikc5BU4H0Oxf/MnX8xzA2CoVD76pdThmA897UKNcqrNfEADpMJFDKN8ttne7ExdeZKF7TqujsNBfLEHUh+RHwQSZv7FJ4WgeiFek20UgJO7xzNW/r+xIrkcA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(396003)(366004)(346002)(39860400002)(376002)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(86362001)(33716001)(2906002)(6512007)(9686003)(6486002)(66476007)(5660300002)(66946007)(316002)(6636002)(41300700001)(66556008)(6666004)(6506007)(478600001)(26005)(4326008)(83380400001)(82960400001)(6862004)(38100700002)(8676002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GqgJMs4DCV2cfBe3yNjf2Mx7jiSjTJsl+o3dK6VmsGiaXRcU3nMiIlcxJ8go?=
 =?us-ascii?Q?QgOoge+mErnmrkenV4ykxpQYlEsqsi3JXNQ//KiXaKNb6l1CU+XXqSj8FP4q?=
 =?us-ascii?Q?X++yheVENEPzsw/jZpKqFgqVDYiDm4g4oVZoJXKrLRfkXlfvR/Iu/Kppr9Ga?=
 =?us-ascii?Q?cKwgupZtXsh/YxKp/AJyFuzwpSayMg/P5nq1SgqHzB4yYLiKB5HFMd7slo2u?=
 =?us-ascii?Q?VcmQ4E/34LWICa+zHETiSq4wPi6s24esSEbIRo6Tsg2aQLk/Byl80t/hw6MM?=
 =?us-ascii?Q?5VuI6jMSj/HGSRLQzRt12fwaLFAHraLuPIp6SlxH1GjaJJiYy5ta15aIFJpA?=
 =?us-ascii?Q?9rOhI82pLkVUpixemhwbW7g+k/+eUUrUEJWLnyh1jF1bRP/XoVE57kfJWlAP?=
 =?us-ascii?Q?pqxOBRQ8dRrGEZlrwm3BEU19/Rz7PA7Fnb4wI+Ip7u99Z8SqjocS/smiHPoD?=
 =?us-ascii?Q?uTEqNa9h1UWBl4mVns81gyHUYk82a3nXymJQYpz64U3XCdrhtBZRnE7G3z01?=
 =?us-ascii?Q?GKGT6aIaSim67R7bah8DcoJ7MA9iqGn3Yi8y8CJVulCjJCVFeQNufF+DA6gd?=
 =?us-ascii?Q?tjM7Fwnx5+4lVcbZtxUItSrLb7Uhtz3DxoLvFAmx5oCMfjzCaG1OHDARs0pS?=
 =?us-ascii?Q?fMsxSZ8iPjUuFRrGhpOeG0h0BQpfv/fDr2KbBqG1QIPXzIb6BfYG+otW2CBa?=
 =?us-ascii?Q?+PVTCtZecuYKque92rwu69kUaZehAeQ3sM3Km+g3/jAqjWaGDkFQdAYQY6Hd?=
 =?us-ascii?Q?FbEl4XLgN1A6U39T/XCMxJCR+wxbC9zD43giSWsAnHCJsDB/v5uU/4FEcXtA?=
 =?us-ascii?Q?/bzwMbXwi9sYbfsdxdKbfpzRn6Tnqy82FCWFtkweLJN/+a5vt+uyx3INrMZs?=
 =?us-ascii?Q?501qtpOTygrxWqe6vRSDB6exFW4xH/dpwGjJL3ARS3ULuXQowbAQwGkuBEte?=
 =?us-ascii?Q?JTzCWJZHmwRVIL8YcIPyiyoIW1vxCHKjZZ3F4KpACZeVzCV7EUn0/sVUzE2R?=
 =?us-ascii?Q?SqgXlvKgO0jtVa++bfTYuraC7M6Dil3fTqEq6UGPSgDSc3Fg+uKffeVk1MQu?=
 =?us-ascii?Q?OfMDpXoIcYwUyIPpEfZG01SeI998dsjWmS0pH03HibMo5Bo+JkA4wgLrX+M6?=
 =?us-ascii?Q?O8Z5f7YAw38UdQqapV1t/XQmhcydp5cfx0FuQHOhFi2B1ZIcwQRwbtVZam7P?=
 =?us-ascii?Q?n2QX9ZLK3b4QmcLlKVwNwl3RSi/s2JC8+E8YDnQX5E5ij/HR2PUYHhX93CbC?=
 =?us-ascii?Q?1DkBztltKYmOp3RuGyxREescWrt0Guaw+UYFFY5kWuHRv2rVtBHBsHsEJ4x3?=
 =?us-ascii?Q?nZGXxj34b/4tB95nOsdrFVcBXgcG5HjOfKan/bGvftV4C8qMqHCcTgld8705?=
 =?us-ascii?Q?zLniPdW9pzDn3zHa+KNNQ6fuyGKED59nenj0wdriZPk5tQtPm9ozAKNbJzmO?=
 =?us-ascii?Q?RKtwalZ2WcfyrM9nB4cLgduY2J6cf5RKr8Tb7d5FfYB3HoJigrhZuoZ57mBv?=
 =?us-ascii?Q?Afd0d5SDPK85pX1n0kd2YCqlsrmhXMCtDThM4qURw6zv8XtHY6IU442vB9Sx?=
 =?us-ascii?Q?N0rJdLnAV5gnq+H4gWf+kfaYdc8DKZYHLnc/U9gBBaYAKLDXX4bVYiGxW2bO?=
 =?us-ascii?Q?5Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13db2972-db66-4853-cfdf-08dbcb659a36
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 20:55:44.8740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jp5iJcglhmakpg6Bo7rzf1BxmlYwmzuhmierBfqojJavPPl8sWo5MWDDGh+/fxnlbQKaMH3B8Q9xi4HaNnp8s7hS75lyYEAiWTwU+Gy9qg4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8105
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/6] drm/xe: Separate number of registers
 from MI_LRI opcode
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

On Wed, Oct 11, 2023 at 04:10:00PM -0700, Matt Roper wrote:
>Keeping the number of registers to be loaded as a separate macro from
>the instruction opcode will simplify some upcoming LRC parsing code.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_gpu_commands.h | 4 +++-
> drivers/gpu/drm/xe/xe_gt.c                | 2 +-
> drivers/gpu/drm/xe/xe_lrc.c               | 2 +-
> drivers/gpu/drm/xe/xe_ring_ops.c          | 2 +-
> 4 files changed, 6 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>index 9432a960346b..ad1e5466671b 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>@@ -25,9 +25,11 @@
> #define MI_BATCH_BUFFER_END	MI_INSTR(0x0a, 0)
> #define MI_STORE_DATA_IMM	MI_INSTR(0x20, 0)
>
>-#define MI_LOAD_REGISTER_IMM(x)	MI_INSTR(0x22, 2*(x)-1)
>+#define MI_LOAD_REGISTER_IMM	MI_INSTR(0x22, 0)

since we are going to have a churn in the codebase due to this, maybe
it's worth going ahead and doing a s/LOAD_REGISTER_IMMEDIATE/LRI/ so all
the macros follow the same pattern?

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

> #define   MI_LRI_LRM_CS_MMIO		REG_BIT(19)
> #define   MI_LRI_MMIO_REMAP_EN		REG_BIT(17)
>+#define   MI_LRI_LENGTH			GENMASK(5, 0)
>+#define   MI_LRI_NUM_REGS(x)		REG_FIELD_PREP(MI_LRI_LENGTH, 2 * (x) - 1)
> #define   MI_LRI_FORCE_POSTED		(1<<12)
>
> #define MI_FLUSH_DW		MI_INSTR(0x26, 0)
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index c63e2e4750b1..a42ee3b9b8c7 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -145,7 +145,7 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
> 	if (count) {
> 		xe_gt_dbg(gt, "LRC WA %s save-restore batch\n", sr->name);
>
>-		bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM(count);
>+		bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(count);
>
> 		xa_for_each(&sr->xa, idx, entry) {
> 			struct xe_reg reg = entry->reg;
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index 35ae6e531d8a..81463bd5e490 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -111,7 +111,7 @@ static void set_offsets(u32 *regs,
> 		flags = *data >> 6;
> 		data++;
>
>-		*regs = MI_LOAD_REGISTER_IMM(count);
>+		*regs = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(count);
> 		if (flags & POSTED)
> 			*regs |= MI_LRI_FORCE_POSTED;
> 		*regs |= MI_LRI_LRM_CS_MMIO;
>diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
>index b95cc7713ff9..1e36b07d3e01 100644
>--- a/drivers/gpu/drm/xe/xe_ring_ops.c
>+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>@@ -50,7 +50,7 @@ static u32 preparser_disable(bool state)
> static int emit_aux_table_inv(struct xe_gt *gt, struct xe_reg reg,
> 			      u32 *dw, int i)
> {
>-	dw[i++] = MI_LOAD_REGISTER_IMM(1) | MI_LRI_MMIO_REMAP_EN;
>+	dw[i++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1) | MI_LRI_MMIO_REMAP_EN;
> 	dw[i++] = reg.addr + gt->mmio.adj_offset;
> 	dw[i++] = AUX_INV;
> 	dw[i++] = MI_NOOP;
>-- 
>2.41.0
>
