Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567FEE82CBF
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 18:51:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B10E10E596;
	Wed, 27 Sep 2023 18:51:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A132610E596
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 18:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695840675; x=1727376675;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=25luQpskAAGbNpUbUnlBxrOM5hudnF9RFo3jAkCyYtE=;
 b=gNqmCtSOOzGQ2/j2zPCLoObZrB3XiWrNfXntOfzZIGHCK+sLJnYn/ZPC
 rDZl+pWBO/KU2ciYAB1RMv+prlx0s+zfQSgVMDNPNfq6qXMqtobvBsZHt
 pyJZX0y3LfaC7g04BnECWnZa5Yd6wv73FnDdqu81URkZ/yP/MN/vyfb9R
 jHPueWe6SQ+ZMFFkEENbwZZCaBWZd9ZlsMu3R1SZp66it0haguEqWRGK1
 cb9t4NnfXl9J+46AsSTZ+qYgI0jlPuSrjdM7cuXApwkJbCDjRkPFxtaTH
 1VFqAKh1/0CEL9x5DMlgXDkQV6zxDp69sNtrokfFg0DuLH5E9ttvcUs6w Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="384700831"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; d="scan'208";a="384700831"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 11:51:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="873012905"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; d="scan'208";a="873012905"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2023 11:51:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 11:51:14 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 27 Sep 2023 11:51:13 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 27 Sep 2023 11:51:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iVbQqoiz9qD8uTMU4WPk3M/Y3NIaLU2XmrSSVEBMtWkMccmjBi4eugfiS3huBurI/LwKmoyb2uBev3iD98wd+/LdAmAqVFFaEuHVoLqgak4zEE3ZNrMgkgnKwDNhviVAy2GMZgGhxJ53JR+zJylarDkaFHHMLuTTfoVTjOsr6z+wr9YN5phR1tMWWMmzhK7RNFuj1glO24i86flhVOjeY3b1ZGhewX7bs7SiZapGoTv2HC0i3Xy9wiPecM0/1U4Ii9cdfT8lFSB/aCvnb1PxuM85UXekXwhvx52lhB1TIi+cJmRM7tOXNNN63uZJanU1XKqdNOXR27ZggCcxaBbryA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B86mDMcNGyYJQfx/VpnbaW4aUVfcpaIda9wv0bhQPEo=;
 b=W1V5b3hTvrX4uDr3dfR8YZIMgadjZi6XtT9fC8VZvr8euaNQbNiXxg1fvjxoZZxzUA9+LlHh+j095BCQMLmFUUTxlHZwiCXuuKH9Z7656HXzdaynYDMEsPbxXqeEFP74dx77LOgn9wssKFZqeNADc2BKx7gafw9f/baxCZ1CBs87H77poJfivdnQHNG0xSy3g8+mD987XpF4J1m/I7MosDyS2qpLEWRmmDm68lJCvkbU19vNLBXtJggFF45ILOXFi/EbDJk06QUx94bfuwNP2STRgmME95FX+OCh04bbAsoylrLv1zFjzh4Byd5JhM2hw8hQ7EU3gfRkiGAJH06ZVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA0PR11MB4590.namprd11.prod.outlook.com (2603:10b6:806:96::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.32; Wed, 27 Sep
 2023 18:51:11 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%6]) with mapi id 15.20.6838.016; Wed, 27 Sep 2023
 18:51:11 +0000
Date: Wed, 27 Sep 2023 13:51:07 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <nw6jgxlpwp65wxuqiasp2lw6ehes34gbwwcyof56zvnzfug5tp@flpv4zur5zt3>
References: <20230926223631.2807873-1-lucas.demarchi@intel.com>
 <20230926223631.2807873-6-lucas.demarchi@intel.com>
 <20230926231747.GV2706891@mdroper-desk1.amr.corp.intel.com>
 <exgalkfrqi6c2chfh5pymcoehbp2ml4oqv7w5idcv2bhpkhh37@s74ydg3cpdmp>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <exgalkfrqi6c2chfh5pymcoehbp2ml4oqv7w5idcv2bhpkhh37@s74ydg3cpdmp>
X-ClientProxiedBy: BYAPR07CA0081.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA0PR11MB4590:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e61cb73-ab7c-4fb8-fa7e-08dbbf8ab7f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UPuaQ+pBYEiM5G1IUGQrxbbyaAQEzVQSunldi6kO1T6EvMUJpEYCRchy1O9ADIf3GqWrW4HhosubjZX/kpu9ZrViNpmxh6DskqTqeME4Nns98b2Lp6hC8JDzH+b6L/iM/gsXdELelcfdaqpUSrRbn2DmovZb9XtHJ+HR8VPjKb8Rh+0zQc0GXO+Sd2WCqfINFA24n2DUeBC/+ZrttFKFoWpzb4aMiibqrJtRjvn9wKHlf4qQDPrwAY+orJmXSqIGK/oIGu4PIlr8uiXupb87ABmchTWenwldcdI/Yvgdz28pzlz0J/4JQAnA1HpC/llMweOhY1gnDJLoX0+v1X6aaoCiedS9sq/ooTv0YFy495F03eqsZwUr2PJnqe+WrO5QGWoiNPPi3PO4lcizVndQy7jeNrQnUyiFyMxtPj+13pbMcIHWPpnqcZgJwhFZeJSqHcBrAW/DiRBdUgSVsYqJEeRibQRTf58FFk1gCIK/eZ7aDqaXHtYZst60/DJ7n37bihu+lVHYYANqxGyH+qP7hza7gToVohB711sWsAIv7kG0FI6hy4VwSEtb/nc5Fkzf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(39860400002)(136003)(366004)(376002)(346002)(230922051799003)(451199024)(1800799009)(186009)(6862004)(8936002)(8676002)(4326008)(26005)(107886003)(33716001)(82960400001)(86362001)(38100700002)(2906002)(83380400001)(6512007)(9686003)(6486002)(6506007)(478600001)(6666004)(5660300002)(41300700001)(54906003)(66556008)(66476007)(6636002)(66946007)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FIKRtnr68GYsrggEC7oBy3f5MlO7R/CTN48Hc0voe6e8PFLF3OtxLsuKZCN5?=
 =?us-ascii?Q?4dNdO2c06HXT4B4xdJs5d+By7N+uX18/k4hsnIHpYViOfWeBe/upoqLTmaU7?=
 =?us-ascii?Q?CgYeHDUC3WxX7uXjo6jvxVaGX/LdPp62P5kvz2EwkHob50utaGroJiSe4yGN?=
 =?us-ascii?Q?RNQ+gbYiW1vVLe89rtH9c6QlkXjXO1oQxphDUwvptONbOlZU/WvRG72soyIt?=
 =?us-ascii?Q?5wvJ5oDeRplTeVZnOL4ucedWkOIIP+z9nc3nzzW+/mVMOudJKp9j3D8pI6b9?=
 =?us-ascii?Q?rY0WJG83lUvTeIsI9iRX1nh49GM5K2KVe8IcWdu4RC+EKXU9bOW2aqrmEQxv?=
 =?us-ascii?Q?oA2nQaw0di8Q0N7ylzV8ahS304b+E+DD2Hm1WgsBSIldbC5OkPCQVhd87FVG?=
 =?us-ascii?Q?tk7kheYEHq4PdVOLBU4h9hvXcREuht76WjBJY5qbfnuzFDL83QZYoN3gztws?=
 =?us-ascii?Q?NxSTRUWJNRMoWBIG5cmExgVfegOG7tROVrdkTlgFQKdWARdmWDqFwFCjXwnq?=
 =?us-ascii?Q?FdmZAZZJp5dfFkez9JezfE2KEr8CKg6YeOPRxfGjPyIaQOdYhYsTgOQ89A1X?=
 =?us-ascii?Q?4eK0PS0GZHra7/8vo2HYQQ0a5ckiEGNjKOe4ZbysV/1SAZRiDQUw38OKIQuN?=
 =?us-ascii?Q?NEXi9WP9CYdIQjv7VEli72x8+qg70R2OZjU0l2AKMygTXoYZCVm9TqexrUrS?=
 =?us-ascii?Q?hMljuZV4n0xzuVSiZj+0NTFXmvjzGPlYCw8kMR2WTonUsUTBiR2f56225qWm?=
 =?us-ascii?Q?RMB3DswXFW8mwyZAU7Hrv8FYQuHCYxULu3KhxLC1VjL76hlSh3nRHot/1bkH?=
 =?us-ascii?Q?Znt+Fmj3EAoM7eQZKICZbJzK3XkibMOxx4osgYYNUT3LvPQkaSIMRbhJ7MBg?=
 =?us-ascii?Q?5Oybv4/pYUtMeiXGt2Obo+HDWVJRAfUegFibtyQRU7WC3KFO1UK5MCSb0yQ/?=
 =?us-ascii?Q?4Q++rCKoHu79kVqSPtzQ4Hk5bmHMO3ehHRThBxUqTaE8OK54IXHNFo4ZSnB5?=
 =?us-ascii?Q?g/S/zn4wQ6MeetRFcVm2os+9SiQLOWVQ6d47ezyLLAP5Nc9rqKlxo+SQXnnv?=
 =?us-ascii?Q?txxe+2/9EzJaUFdWUUCB5SpbSiLzDOxEfuojuRZy5CiAdHEd20Bmbf8hYSfp?=
 =?us-ascii?Q?Em6Xs7vkLOwb8jdASD3hhr+kZ+N0WC30gWhMx5+kPkx/cUcJkzSSnU2PvS7Y?=
 =?us-ascii?Q?pjmtJSwQnpjIYySgQlqK9BO+ZxMxwdxEoceOFpFqUjmexfCju3hMV+tJCwNQ?=
 =?us-ascii?Q?GezLaaFIG07LLBBHUBsVJuEeEiWHqNDhRco931TbfJZLBRvQ67G7N0DHAaEE?=
 =?us-ascii?Q?++0ugg2RCb3I9XX6aVlhekDqRLmDWrFGtot04nmBvE0iR0VrisCKcOZG8kqC?=
 =?us-ascii?Q?AZKKNrn5HU47xpaLPoBnYCgWk6p9lu44JKgUtNK9PxAOXACdWZWX1pEEShvN?=
 =?us-ascii?Q?EgRjgy6DThj4bKBnrF8MSMKF9KCXk75YmQ5dj5GwQcx3Jw1ITtHupAtg7nyR?=
 =?us-ascii?Q?SlXtSyA0ccSIrpRnsKNLDunFujr9qJRuymD8pcQw2AO2J25MR48nooaTD+OB?=
 =?us-ascii?Q?0sReDg6eT1f6lH1X3J+esgQKQeHSyvTeGEgt2OLoUbXp6qdtO8Up91C8BnSj?=
 =?us-ascii?Q?+A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e61cb73-ab7c-4fb8-fa7e-08dbbf8ab7f0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 18:51:11.6986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UWgd+BcTeVfX5N9F0JAZ/57bLQtT5SKs7beP3pQxqdkKbAfTn+OHRa/02BpEA6dpbgZGxJwzcl1Ov+WsGcrWdUgqIuwK1qzAhk9bhFR1cio=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4590
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 05/11] drm/xe: Use vfunc to initialize PAT
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
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 26, 2023 at 10:30:34PM -0500, Lucas De Marchi wrote:
>On Tue, Sep 26, 2023 at 04:17:47PM -0700, Matt Roper wrote:
>>On Tue, Sep 26, 2023 at 03:36:25PM -0700, Lucas De Marchi wrote:
>>>Split the PAT initialization between SW-only and HW. The _early() only
>>>sets up the ops and data structure that are used later to program the
>>>tables. This allows the PAT to be easily extended to other platforms.
>>>
>>>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>---
>>> drivers/gpu/drm/xe/xe_device.c       |  3 ++
>>> drivers/gpu/drm/xe/xe_device_types.h | 13 ++++++
>>> drivers/gpu/drm/xe/xe_pat.c          | 59 +++++++++++++++++++++-------
>>> drivers/gpu/drm/xe/xe_pat.h          | 11 ++++++
>>> 4 files changed, 72 insertions(+), 14 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>>index 687dc3d79a66..046b7a087451 100644
>>>--- a/drivers/gpu/drm/xe/xe_device.c
>>>+++ b/drivers/gpu/drm/xe/xe_device.c
>>>@@ -26,6 +26,7 @@
>>> #include "xe_irq.h"
>>> #include "xe_mmio.h"
>>> #include "xe_module.h"
>>>+#include "xe_pat.h"
>>> #include "xe_pcode.h"
>>> #include "xe_pm.h"
>>> #include "xe_query.h"
>>>@@ -276,6 +277,8 @@ int xe_device_probe(struct xe_device *xe)
>>> 	int err;
>>> 	u8 id;
>>>
>>>+	xe_pat_init_early(xe);
>>>+
>>> 	xe->info.mem_region_mask = 1;
>>> 	err = xe_display_init_nommio(xe);
>>> 	if (err)
>>>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>>index 32ab0fea04ee..98835ee058f5 100644
>>>--- a/drivers/gpu/drm/xe/xe_device_types.h
>>>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>>>@@ -25,6 +25,7 @@
>>> #endif
>>>
>>> struct xe_ggtt;
>>>+struct xe_pat_ops;
>>>
>>> #define XE_BO_INVALID_OFFSET	LONG_MAX
>>>
>>>@@ -331,6 +332,18 @@ struct xe_device {
>>> 		atomic_t ref;
>>> 	} mem_access;
>>>
>>>+	/**
>>>+	 * @pat: Encapsulate PAT related stuff
>>>+	 */
>>>+	struct {
>>>+		/** Internal operations to abstract platforms */
>>>+		const struct xe_pat_ops *ops;
>>>+		/** PAT table to program in the HW */
>>>+		const u32 *table;
>>>+		/** Number of PAT entries */
>>>+		int n_entries;
>>>+	} pat;
>>>+
>>> 	/** @d3cold: Encapsulate d3cold related stuff */
>>> 	struct {
>>> 		/** capable: Indicates if root port is d3cold capable */
>>>diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
>>>index 71e0e047fff3..86386633e206 100644
>>>--- a/drivers/gpu/drm/xe/xe_pat.c
>>>+++ b/drivers/gpu/drm/xe/xe_pat.c
>>>@@ -32,6 +32,11 @@
>>> #define TGL_PAT_WC				REG_FIELD_PREP(TGL_MEM_TYPE_MASK, 1)
>>> #define TGL_PAT_UC				REG_FIELD_PREP(TGL_MEM_TYPE_MASK, 0)
>>>
>>>+struct xe_pat_ops {
>>>+	void (*program_graphics)(struct xe_gt *gt, const u32 table[], int n_entries);
>>>+	void (*program_media)(struct xe_gt *gt, const u32 table[], int n_entries);
>>>+};
>>>+
>>> static const u32 tgl_pat_table[] = {
>>> 	[0] = TGL_PAT_WB,
>>> 	[1] = TGL_PAT_WC,
>>>@@ -80,24 +85,37 @@ static void program_pat_mcr(struct xe_gt *gt, const u32 table[], int n_entries)
>>> 	}
>>> }
>>>
>>>-void xe_pat_init(struct xe_gt *gt)
>>>-{
>>>-	struct xe_device *xe = gt_to_xe(gt);
>>>+static const struct xe_pat_ops tgl_pat_ops = {
>>>+	.program_graphics = program_pat,
>>>+};
>>>+
>>>+static const struct xe_pat_ops pvc_pat_ops = {
>>>+	.program_graphics = program_pat_mcr,
>>>+};
>>>+
>>>+/*
>>>+ * SAMedia register offsets are adjusted by the write methods and they target
>>>+ * registers that are not MCR, while for normal GT they are MCR
>>>+ */
>>>+static const struct xe_pat_ops mtl_pat_ops = {
>>>+	.program_graphics = program_pat,
>>>+	.program_media = program_pat_mcr,
>>>+};
>>>
>>>+void xe_pat_init_early(struct xe_device *xe)
>>>+{
>>> 	if (xe->info.platform == XE_METEORLAKE) {
>>>-		/*
>>>-		 * SAMedia register offsets are adjusted by the write methods
>>>-		 * and they target registers that are not MCR, while for normal
>>>-		 * GT they are MCR
>>>-		 */
>>>-		if (xe_gt_is_media_type(gt))
>>>-			program_pat(gt, mtl_pat_table, ARRAY_SIZE(mtl_pat_table));
>>>-		else
>>>-			program_pat_mcr(gt, mtl_pat_table, ARRAY_SIZE(mtl_pat_table));
>>>+		xe->pat.ops = &mtl_pat_ops;
>>>+		xe->pat.table = mtl_pat_table;
>>>+		xe->pat.n_entries = ARRAY_SIZE(mtl_pat_table);
>>> 	} else if (xe->info.platform == XE_PVC || xe->info.platform == XE_DG2) {
>>>-		program_pat_mcr(gt, pvc_pat_table, ARRAY_SIZE(pvc_pat_table));
>>>+		xe->pat.ops = &pvc_pat_ops;
>>
>>Actually, to be more consistent with the rest of the driver we should
>>probably name this 'dg2_pat_ops' after the first platform that
>>introduced this.
>
>I was not very happy with the name neither, but naming it dg2 would be
>inconsistent with the pvc_pat_table.... or I would need to rename that
>in this same patch. But my final goal was to name it after the arch, so
>renaming it here would be pointless. See patch #7.

actually it seems naming it dg2_pat_ops makes more sense indeed as this
is the ops shared by DG2 and PVC. The table shouldn't be renamed, it
only points to the mistake that was here. I will updated this in v3.

thanks
Lucas De Marchi

>
>Lucas De Marchi
>
>>
>>
>>Matt
>>
>>>+		xe->pat.table = pvc_pat_table;
>>>+		xe->pat.n_entries = ARRAY_SIZE(pvc_pat_table);
>>> 	} else if (GRAPHICS_VERx100(xe) <= 1210) {
>>>-		program_pat(gt, tgl_pat_table, ARRAY_SIZE(tgl_pat_table));
>>>+		xe->pat.ops = &tgl_pat_ops;
>>>+		xe->pat.table = tgl_pat_table;
>>>+		xe->pat.n_entries = ARRAY_SIZE(tgl_pat_table);
>>> 	} else {
>>> 		/*
>>> 		 * Going forward we expect to need new PAT settings for most
>>>@@ -111,3 +129,16 @@ void xe_pat_init(struct xe_gt *gt)
>>> 			GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
>>> 	}
>>> }
>>>+
>>>+void xe_pat_init(struct xe_gt *gt)
>>>+{
>>>+	struct xe_device *xe = gt_to_xe(gt);
>>>+
>>>+	if (!xe->pat.ops)
>>>+		return;
>>>+
>>>+	if (xe_gt_is_media_type(gt))
>>>+		xe->pat.ops->program_media(gt, xe->pat.table, xe->pat.n_entries);
>>>+	else
>>>+		xe->pat.ops->program_graphics(gt, xe->pat.table, xe->pat.n_entries);
>>>+}
>>>diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
>>>index 659de4008131..744318cab69b 100644
>>>--- a/drivers/gpu/drm/xe/xe_pat.h
>>>+++ b/drivers/gpu/drm/xe/xe_pat.h
>>>@@ -7,7 +7,18 @@
>>> #define _XE_PAT_H_
>>>
>>> struct xe_gt;
>>>+struct xe_device;
>>>
>>>+/**
>>>+ * xe_pat_init_early - SW initialization, setting up data based on device
>>>+ * @xe: xe device
>>>+ */
>>>+void xe_pat_init_early(struct xe_device *xe);
>>>+
>>>+/**
>>>+ * xe_pat_init_early - Program HW PAT table
>>>+ * @gt: GT structure
>>>+ */
>>> void xe_pat_init(struct xe_gt *gt);
>>>
>>> #endif
>>>--
>>>2.40.1
>>>
>>
>>-- 
>>Matt Roper
>>Graphics Software Engineer
>>Linux GPU Platform Enablement
>>Intel Corporation
