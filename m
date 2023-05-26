Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 510DFC77B7C
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 22:20:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7DB210E0DB;
	Fri, 26 May 2023 22:20:15 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098E110E0DB
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 22:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685139614; x=1716675614;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Dr06EYvJty1D3Oj4yWT7NoXd7DdvaHu7EKJfMrcN2Lk=;
 b=crSv8RP2wugjfjdFoCPqvVuN92DNnIWfU1TPx1XJ5nkS+lnD/g9wlEED
 5eMqDrzpO+cOfs2QIcI7P8GIMF2zU+bnxvDv4+54zrBRd9Oe/lmNqnmIf
 3UQkKv/nvZnDbsB9eOxnYyoiIRjhGhybzd3rh/6716coopkdxQO4+sNIO
 G2GaPqF5Fys5692sieZsIqWp0iIs9Xliw3RmGd/T9NNx+arPmlwQbQee4
 4h0R7TSe4mQ7hOGIhtS797Q13TPe6MOkJ0PyJAyflu9afJgZi68b8dekB
 uWrp67ikCpq9fSsAEWn+hgZdzsFlT70IOSuS46PRWVbfEbDFj1eUpDj7e w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="357568735"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="357568735"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 15:20:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="775221441"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="775221441"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP; 26 May 2023 15:20:12 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 26 May 2023 15:20:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 26 May 2023 15:20:11 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 26 May 2023 15:20:11 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 26 May 2023 15:20:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dh0XqBq+JcnAaX9rrLykK4pIfcrFE8MP1gyOkalW6YK8Qs3MiKgs5AzKklQaluRwgtg+UzRiZ/eFORuxIyNWqw5bxMgmux7QQKwJGZ3wcPpwGxle4vwCkOey/ASjykl74Aa8i/MWE8IJJAmPVjwOlsf+5q2BgAMLa6kr4sYUbTnqOvHXD65VwXANQjK+ZVhDA5VD2RyLt780uvm9FRbZN/b9SkFtS4Cvm6BhGyW4ynswP8lAarOdroR8edarKMqVKZTfrckveinN7/40V9TRwHmYHwrhQdcLqGjWGfWuzM/iZIssafXloQMwGjejKcQHp0CwCia3e3lVIGt2tnvaEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z50eRPgVt26RHjQSDUwnaUmTl5wrI15hBrTR+T32KLE=;
 b=kxXz0Wm+G7YWuit5pWrVo+Jm7sebdYDKNT+5zw7RV/WukuvI6ZxB+X/baxjPUAguQPqPaJWsYMK3dQ+qJ9aUKl5R+NJ/8X3LX/+GS5dn9o2fHzhqL74Qi/NTNSXSyWi7sC4/Hy4WzaZh0DzyarZc35e6zhJ44RfWqGMeMPdTlXnDyesg+LzkDkMKcBcn9SWQtSh5Ao8Y0KBwET3ZnzaUXPfoPKllp+2tkQrBQBoZx9oujJNWg4X15tFIBgzXt1dyNxQ2wVR/7x2Q8ADoPYPTqrM/X7KexGCIkAFw96DK7jGNr2C20vNhI9iOnebp/6r7CCKblBKXlF4gbg2lRY3hBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH0PR11MB8165.namprd11.prod.outlook.com (2603:10b6:610:18e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Fri, 26 May
 2023 22:20:03 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6433.017; Fri, 26 May 2023
 22:20:03 +0000
Date: Fri, 26 May 2023 15:20:00 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <riqaqrg4hghadk742envrgmacgzt7wyte4jmz6ydpkutaghesk@fylqptggd3qt>
References: <20230519231827.3572452-1-matthew.d.roper@intel.com>
 <20230519231827.3572452-25-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230519231827.3572452-25-matthew.d.roper@intel.com>
X-ClientProxiedBy: BYAPR07CA0035.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::48) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH0PR11MB8165:EE_
X-MS-Office365-Filtering-Correlation-Id: 35cff9d5-7c34-4849-0d5d-08db5e375a06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hQYR6H//DcAe7pueS0UT3uR3ARYsgR7Eg7IA1n7k/BjTqPYodPF1E+9l7Ry6wRpkfRrpePGaTOB7/5FWKuOKmE+eU/K0w9DFe0kgUNW4qUy/jE1GfYLK9dn1mpCA238+gdCf9gEc5jxadDchRA25Xcjd4mNr0JsnS7mIcE+BCMvcIhEmMyTDOtnGdE18O4qkSLGNDxuyL0crf015qts9Nv3qVHQuwtFB7gY8z7TF6Q+OZT4K8J4RLrOrrWOKddS7vGvKvKeKQK6CZxpoCxrLXMY6Z/N4qCFaXExNc/rd4rL7O/hnLa26H7AmMYjGz65Q6BRQ7sj8qeUayid21mff7yXi6GZ/Sf/U7ih9XRe6a8lok7Uf44idg4YJrQc6DNvJHxmCQbLdSTqLSHKTrITNzpl0lixsNXnKbIpaWH1lf6Y4lsNRBBR0hdtlryYmv/jTjTYfWhRKRKG494Xz67MN5mreo3Nfce5VsyYMtZLu9uVn+Cum24JWc1F8sSsWh5ywAjcek9sVRyYXuqh1rUO3/uZtB75Fvc8c9zCF4sYEN22vUdJz7KG2n96BVnr5jcpx54qZu+B60ZYL3C4Z7fPaHgHz/e2gWpQxcVmzxQ0iOY8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(366004)(396003)(376002)(136003)(346002)(451199021)(2906002)(5660300002)(6862004)(8936002)(8676002)(6486002)(6636002)(41300700001)(66946007)(66476007)(316002)(478600001)(4326008)(66556008)(33716001)(38100700002)(6506007)(6512007)(86362001)(9686003)(26005)(186003)(83380400001)(82960400001)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TfHwhOry3n331kPOVcffaEJu60yijfe0QlkR+Brzma/DzwdnHGKok4C9jKvo?=
 =?us-ascii?Q?l8vkvXQX4qqMvWOx9FVvhmSXgQpKqDmAasDBtEc7oS4jeswjQ/17br279E6A?=
 =?us-ascii?Q?EEHtJJXV+HAAnoApMRFAvdzIS+XItd9RiPK2nfbWL8r0LhyDhFs7BPOhL5Za?=
 =?us-ascii?Q?VpbuuHHj96d3cvaGy9efs4N45dP3x1PeqTwj3yXe1+2anvbqAUqd74dD7hYt?=
 =?us-ascii?Q?O+xDM74Fq9s/P+Kk2hqqovoxmu5WovkOXerz7kV6MIK8n0wOL3XDTBzpOsgE?=
 =?us-ascii?Q?0Fd1/21SGkk8xpAB0mp+L84IRUAE+JgjmPLmA/EErIGxm5/LyWMYQ1dIDC7P?=
 =?us-ascii?Q?J6NcGfmJOG/4FXMbapy8hQle3Wve+WcY745JGTIkNAPl2RUsjuFc8oXr2gN/?=
 =?us-ascii?Q?3m4txIDxxlgLK62gdQR1Cb5nMhJX1m79I744l82oqWxuf1IBu1J7lYEqQotR?=
 =?us-ascii?Q?f5gILqtu/TM3rzuj4KvpEf0R1DH00uCxXHLPImmdXBTsnKzxGLZTrun0v5OC?=
 =?us-ascii?Q?2VbhKmbfRQ5dOFQXbnTPmBzLITaqR/hFj1Izv7WwsVufMYnqaby8asFr40CP?=
 =?us-ascii?Q?JRG+UYIhTrNeZPConJvT1knzqQNMcgTSYANL2xhlPOsQPq9W1Z+AtoQ5xO+A?=
 =?us-ascii?Q?UuHAzALhFZ03uTT0jszXsF1cOQ4IhbfxCp1anxTfzaEegLLPYnFPDeTLaPzD?=
 =?us-ascii?Q?vFpWFQliLXV8sOUbb3Mwf8t1mMieeLmSF82FQdbMn8qCxnAHbzkY0ciIG14Y?=
 =?us-ascii?Q?qKMZQ1tFE6O1EtbulFi6Vr6AsrSwvW+xcdddFhl1wmM/A1ptQgiH+/m3CaYt?=
 =?us-ascii?Q?KqiTGaNeFO51oqrAGmy3KW5BPSGYmbfrVb1sz+8MqYLY7h7ry3TOOsUhJbp1?=
 =?us-ascii?Q?E3R2MYG5x6Zvot0lYvNhLUbdRYLFrLIgnXf/c9jiJXKS1tivge8lIyMR5Rfl?=
 =?us-ascii?Q?6TxVXxCGegKo9AIMIKCZH4aK2MOurmubMNDXp97ZQ1LrKfux1NM77R18q01M?=
 =?us-ascii?Q?N8KceZUQ34+Cy8KCHsKiOUoCRVotNtYo5ZytaI9WaanrHN+SEgkQ4S85VcuZ?=
 =?us-ascii?Q?ploFNwp9o43gZV5V/mqOlAw2ccyF9arMb7XaeF0EJ/q8/K9NqOD4IM0d/9Sn?=
 =?us-ascii?Q?pjfg1aaa/MIZQTXjpGKx86NKSRzInG6EVkmYyTetEmRnxh/IV8oni7sZHagk?=
 =?us-ascii?Q?AZuoWezDq3WAAOe3hECXDXFLL7hUhn8sFLGp4MPFqJV+bdv25yoAGokF0soa?=
 =?us-ascii?Q?ln4Nw001xAZOIgYcuKKehgSLyrEhnFyiewIRTG6xvdUZ4P6VkTXCDNTs3zbe?=
 =?us-ascii?Q?NnrGh7NGxWowq3HHGhXAsQOzCY56D+Qi+us0NsNTcdzghpAWI9WiyHf42SxJ?=
 =?us-ascii?Q?CgKRdVbZBIME2a3mG+Ow7Af/1n5afz+7d7pgukQ7hBTReYQZ+ep8FbthKuE8?=
 =?us-ascii?Q?q6iBlUttHnHlMsgWlPQww3qEjIgCyFSIDOj0N9TmeafL4SI5w7lwrcT+ZFj+?=
 =?us-ascii?Q?ox1qRYEHa2o/4mM88EQFt0i01xhQwRuMrSJqMW47YtihvkqWbg5j5b9HBTfp?=
 =?us-ascii?Q?0c24jPgN4Gp4PZ3NZt/c0XhxSiRtjh0xZPLNjJvNHSxMM5Ep1VqhVJzV8Cc+?=
 =?us-ascii?Q?kQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35cff9d5-7c34-4849-0d5d-08db5e375a06
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2023 22:20:03.1917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QookUBMHVH7HNoVBYhPfxKVH6Hy32XUXOr8RescQ15kBlzYVXVfJrM1B8jMuxp93nCncg0laMw4EcKEEb+ROkLAyY5klVyU4bKUYNltCtxw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8165
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 24/30] drm/xe: Replace
 xe_gt_irq_postinstall with xe_irq_enable_hwe
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

On Fri, May 19, 2023 at 04:18:21PM -0700, Matt Roper wrote:
>The majority of xe_gt_irq_postinstall() is really focused on the
>hardware engine interrupts; other GT-related interrupts such as the GuC
>are enabled/disabled independently.  Renaming the function and making it
>truly GT-specific will make it more clear what the intended focus is.
>
>Disabling/masking of other interrupts (such as GuC interrupts) is
>unnecessary since that has already happened during the irq_reset stage,
>and doing so will become harmful once the media GT is re-enabled since
>calls to xe_gt_irq_postinstall during media GT initialization would
>incorrectly disable the primary GT's GuC interrupts.
>
>Also, since this function is called from gt_fw_domain_init(), it's not
>necessary to also call it earlier during xe_irq_postinstall; just
>xe_irq_resume to handle runtime resume should be sufficient.
>
>v2:
> - Drop unnecessary !gt check.  (Lucas)
> - Reword some comments about enable/unmask for clarity.  (Lucas)
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_gt.c        |  4 +-
> drivers/gpu/drm/xe/xe_hw_engine.c |  1 +
> drivers/gpu/drm/xe/xe_irq.c       | 87 +++++++++++++++----------------
> drivers/gpu/drm/xe/xe_irq.h       |  3 +-
> 4 files changed, 48 insertions(+), 47 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 290935e46059..b7bf8c01b4fe 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -303,8 +303,8 @@ static int gt_fw_domain_init(struct xe_gt *gt)
> 	/* XXX: Fake that we pull the engine mask from hwconfig blob */
> 	gt->info.engine_mask = gt->info.__engine_mask;
>
>-	/* Enables per hw engine IRQs */
>-	xe_gt_irq_postinstall(gt_to_tile(gt));
>+	/* Enable per hw engine IRQs */
>+	xe_irq_enable_hwe(gt);
>
> 	/* Rerun MCR init as we now have hw engine list */
> 	xe_gt_mcr_init(gt);
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>index ab25513b753c..5a345b24b9a2 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>@@ -17,6 +17,7 @@
> #include "xe_gt.h"
> #include "xe_gt_topology.h"
> #include "xe_hw_fence.h"
>+#include "xe_irq.h"
> #include "xe_lrc.h"
> #include "xe_macros.h"
> #include "xe_mmio.h"
>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>index 85bb9bd6b6be..b4ed1e4a3388 100644
>--- a/drivers/gpu/drm/xe/xe_irq.c
>+++ b/drivers/gpu/drm/xe/xe_irq.c
>@@ -122,13 +122,12 @@ static inline void xelp_intr_enable(struct xe_device *xe, bool stall)
> 		xe_mmio_read32(mmio, GFX_MSTR_IRQ);
> }
>
>-void xe_gt_irq_postinstall(struct xe_tile *tile)
>+/* Enable/unmask the HWE interrupts for a specific GT's engines. */
>+void xe_irq_enable_hwe(struct xe_gt *gt)
> {
>-	struct xe_device *xe = tile_to_xe(tile);
>-	struct xe_gt *mmio = tile->primary_gt;
>+	struct xe_device *xe = gt_to_xe(gt);
>+	u32 ccs_mask, bcs_mask;
> 	u32 irqs, dmask, smask;
>-	u32 ccs_mask = xe_hw_engine_mask_per_class(tile->primary_gt, XE_ENGINE_CLASS_COMPUTE);
>-	u32 bcs_mask = xe_hw_engine_mask_per_class(tile->primary_gt, XE_ENGINE_CLASS_COPY);
>
> 	if (xe_device_guc_submission_enabled(xe)) {
> 		irqs = GT_RENDER_USER_INTERRUPT |
>@@ -140,45 +139,44 @@ void xe_gt_irq_postinstall(struct xe_tile *tile)
> 		       GT_WAIT_SEMAPHORE_INTERRUPT;
> 	}
>
>+	ccs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COMPUTE);
>+	bcs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COPY);
>+
> 	dmask = irqs << 16 | irqs;
> 	smask = irqs << 16;
>
>-	/* Enable RCS, BCS, VCS and VECS class interrupts. */
>-	xe_mmio_write32(mmio, RENDER_COPY_INTR_ENABLE, dmask);
>-	xe_mmio_write32(mmio, VCS_VECS_INTR_ENABLE, dmask);
>-	if (ccs_mask)
>-		xe_mmio_write32(mmio, CCS_RSVD_INTR_ENABLE, smask);
>+	if (!xe_gt_is_media_type(gt)) {
>+		/* Enable interrupts for each engine class */
>+		xe_mmio_write32(gt, RENDER_COPY_INTR_ENABLE, dmask);
>+		if (ccs_mask)
>+			xe_mmio_write32(gt, CCS_RSVD_INTR_ENABLE, smask);
>
>-	/* Unmask irqs on RCS, BCS, VCS and VECS engines. */
>-	xe_mmio_write32(mmio, RCS0_RSVD_INTR_MASK, ~smask);
>-	xe_mmio_write32(mmio, BCS_RSVD_INTR_MASK, ~smask);
>-	if (bcs_mask & (BIT(1)|BIT(2)))
>-		xe_mmio_write32(mmio, XEHPC_BCS1_BCS2_INTR_MASK, ~dmask);
>-	if (bcs_mask & (BIT(3)|BIT(4)))
>-		xe_mmio_write32(mmio, XEHPC_BCS3_BCS4_INTR_MASK, ~dmask);
>-	if (bcs_mask & (BIT(5)|BIT(6)))
>-		xe_mmio_write32(mmio, XEHPC_BCS5_BCS6_INTR_MASK, ~dmask);
>-	if (bcs_mask & (BIT(7)|BIT(8)))
>-		xe_mmio_write32(mmio, XEHPC_BCS7_BCS8_INTR_MASK, ~dmask);
>-	xe_mmio_write32(mmio, VCS0_VCS1_INTR_MASK, ~dmask);
>-	xe_mmio_write32(mmio, VCS2_VCS3_INTR_MASK, ~dmask);
>-	xe_mmio_write32(mmio, VECS0_VECS1_INTR_MASK, ~dmask);
>-	if (ccs_mask & (BIT(0)|BIT(1)))
>-		xe_mmio_write32(mmio, CCS0_CCS1_INTR_MASK, ~dmask);
>-	if (ccs_mask & (BIT(2)|BIT(3)))
>-		xe_mmio_write32(mmio,  CCS2_CCS3_INTR_MASK, ~dmask);
>+		/* Unmask interrupts for each engine instance */
>+		xe_mmio_write32(gt, RCS0_RSVD_INTR_MASK, ~smask);
>+		xe_mmio_write32(gt, BCS_RSVD_INTR_MASK, ~smask);
>+		if (bcs_mask & (BIT(1)|BIT(2)))
>+			xe_mmio_write32(gt, XEHPC_BCS1_BCS2_INTR_MASK, ~dmask);
>+		if (bcs_mask & (BIT(3)|BIT(4)))
>+			xe_mmio_write32(gt, XEHPC_BCS3_BCS4_INTR_MASK, ~dmask);
>+		if (bcs_mask & (BIT(5)|BIT(6)))
>+			xe_mmio_write32(gt, XEHPC_BCS5_BCS6_INTR_MASK, ~dmask);
>+		if (bcs_mask & (BIT(7)|BIT(8)))
>+			xe_mmio_write32(gt, XEHPC_BCS7_BCS8_INTR_MASK, ~dmask);
>+		if (ccs_mask & (BIT(0)|BIT(1)))
>+			xe_mmio_write32(gt, CCS0_CCS1_INTR_MASK, ~dmask);
>+		if (ccs_mask & (BIT(2)|BIT(3)))
>+			xe_mmio_write32(gt,  CCS2_CCS3_INTR_MASK, ~dmask);
>+	}
>
>-	/*
>-	 * RPS interrupts will get enabled/disabled on demand when RPS itself
>-	 * is enabled/disabled.
>-	 */
>-	/* TODO: gt->pm_ier, gt->pm_imr */
>-	xe_mmio_write32(mmio, GPM_WGBOXPERF_INTR_ENABLE, 0);
>-	xe_mmio_write32(mmio, GPM_WGBOXPERF_INTR_MASK,  ~0);
>+	if (xe_gt_is_media_type(gt) || MEDIA_VER(xe) < 13) {
>+		/* Enable interrupts for each engine class */
>+		xe_mmio_write32(gt, VCS_VECS_INTR_ENABLE, dmask);
>
>-	/* Same thing for GuC interrupts */
>-	xe_mmio_write32(mmio, GUC_SG_INTR_ENABLE, 0);
>-	xe_mmio_write32(mmio, GUC_SG_INTR_MASK,  ~0);
>+		/* Unmask interrupts for each engine instance */
>+		xe_mmio_write32(gt, VCS0_VCS1_INTR_MASK, ~dmask);
>+		xe_mmio_write32(gt, VCS2_VCS3_INTR_MASK, ~dmask);
>+		xe_mmio_write32(gt, VECS0_VECS1_INTR_MASK, ~dmask);
>+	}
> }
>
> static u32
>@@ -497,12 +495,6 @@ static void xe_irq_reset(struct xe_device *xe)
>
> static void xe_irq_postinstall(struct xe_device *xe)
> {
>-	struct xe_tile *tile;
>-	u8 id;
>-
>-	for_each_tile(tile, xe, id)
>-		xe_gt_irq_postinstall(tile);
>-
> 	xe_display_irq_postinstall(xe, xe_root_mmio_gt(xe));
>
> 	/*
>@@ -591,9 +583,16 @@ void xe_irq_suspend(struct xe_device *xe)
>
> void xe_irq_resume(struct xe_device *xe)
> {
>+	struct xe_gt *gt;
>+	int id;
>+
> 	spin_lock_irq(&xe->irq.lock);
> 	xe->irq.enabled = true;
> 	xe_irq_reset(xe);
> 	xe_irq_postinstall(xe);
>+
>+	for_each_gt(gt, xe, id)
>+		xe_irq_enable_hwe(gt);
>+
> 	spin_unlock_irq(&xe->irq.lock);
> }
>diff --git a/drivers/gpu/drm/xe/xe_irq.h b/drivers/gpu/drm/xe/xe_irq.h
>index 69113c21e1cd..bc42bc90d967 100644
>--- a/drivers/gpu/drm/xe/xe_irq.h
>+++ b/drivers/gpu/drm/xe/xe_irq.h
>@@ -8,11 +8,12 @@
>
> struct xe_device;
> struct xe_tile;
>+struct xe_gt;
>
> int xe_irq_install(struct xe_device *xe);
>-void xe_gt_irq_postinstall(struct xe_tile *tile);
> void xe_irq_shutdown(struct xe_device *xe);
> void xe_irq_suspend(struct xe_device *xe);
> void xe_irq_resume(struct xe_device *xe);
>+void xe_irq_enable_hwe(struct xe_gt *gt);
>
> #endif
>-- 
>2.40.0
>
