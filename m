Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4649CC25B67
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 16:29:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F96710E835;
	Thu, 26 Oct 2023 16:29:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2AFD10E835
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Oct 2023 16:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698337760; x=1729873760;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=m1xThF2iVYXMWsP3ZI652XH5CIYYh1348X7xjYrwofY=;
 b=TmtWH7NO0pnF5KzgSlx8zLgC+q5Yhc6vkY94a9P5qo8MCljYIPcY/Qnn
 47xhTMCrOk3XoB5zibxRvSubSMdTJrARHoK+SLbmlNS75dLPtnw68TOCY
 eTRuEVCQ8YH8jBmG1jeAttrxdFQs6neGhStTqh+pu2nh3O/icwSAmTSYf
 qLmXUG8sWnrJrzYqiPHIXB3zLUbgPa8OSVvuWEyokSoUzvt42Ff7Zwlv+
 uVyBqcGWj/5LemOlrDJroT6b7eBN56G3wUZitss/ZL1djCapvwH2wyCEd
 csWXKM7L2LUSBgST9eKZl9uVatL/W4W9YdV2uEiapq26ri4viEZNztawj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="387412941"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; d="scan'208";a="387412941"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 09:29:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="849982984"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; d="scan'208";a="849982984"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Oct 2023 09:29:16 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 26 Oct 2023 09:29:15 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 26 Oct 2023 09:29:15 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 26 Oct 2023 09:29:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KvHPu0ul7W1wcE6SBqDQ75okVm/M0Eusj47EmhmbQKjbR96yPwtKBkBRK6UFr+yYOewCwClWKBgQzZw2EaizMCXCkLKaXDZYIPFLplz0nTYFJn/hC1XgZeRh3H/KDuysxcA4voWzlFQi8WaYAwNJHsFXP3nawsU7J7gLH5WgZw4/okEJfa69vK6VVsXfMlLTqxWCeSYYyQZlSBSAnskc1BjzFyY8frfvmooZwuI10R7u77luujWIuv4gJR9woBJkQxk4mvH9zWO9zl/IANNXoHTKRKEfhM+FDDx6fMLeVGv342yUV7Q0vuGGY3OaIoRQfEaT4ZkD1bPUUmrYS7ePgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dGnaC1cjahC2EJ7aEsm4XESFG+XQO1vC3YxVUNJcBKo=;
 b=XddeKng8nDJYBftOKZmDbkw7QmD7ULLIarQS4uPa5sVKUmDhXzv61GoRWSUw06ulvaYYNR696V/sdyji8oYYTrFkxnofeHV5ikShl4I9WeJp16zdOpHIdffOjw+xrnbqNY3Iv5S5EZRi/GTNamTXnPvrKEoThz3IhzD2f7thBpPfl1DWq7op+LJSXahgKPhy/qriJCbfQ0DNtNhZOxATPrDHgQMVT4L/a4/MFB3UTaNCa+XbcFGbMrC6GswQFeiZzykFbwqX8Cw6JwLqWbN1d6SlnZotLQ+ZMQxOa+XU5zwmwqpBKiNXQETgAzwqSiSJMJd3O5GCHimTuFDrHXeuOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DM4PR11MB7758.namprd11.prod.outlook.com (2603:10b6:8:101::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.19; Thu, 26 Oct 2023 16:29:12 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f723:f4d9:c12a:5b62]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f723:f4d9:c12a:5b62%4]) with mapi id 15.20.6907.028; Thu, 26 Oct 2023
 16:29:11 +0000
Date: Thu, 26 Oct 2023 09:29:09 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Message-ID: <20231026162909.GY5757@mdroper-desk1.amr.corp.intel.com>
References: <20231024220739.224251-1-lucas.demarchi@intel.com>
 <20231024220739.224251-3-lucas.demarchi@intel.com>
 <169832941486.1500.12082880042818649394@gjsousa-mobl2>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <169832941486.1500.12082880042818649394@gjsousa-mobl2>
X-ClientProxiedBy: SJ0PR13CA0191.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::16) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DM4PR11MB7758:EE_
X-MS-Office365-Filtering-Correlation-Id: 763cb698-ebb9-4cb3-efcb-08dbd640af97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +DcxLnwj8pxo5eMilLhxUpfu/E4b+gUc8JTrq63YKYDz8vuJ9+oXD2+8b697ARGHju9h0uJ4w0hAUHWXrP73GzgBGQH9A9a5m2jAob5+CDeWWekij+PqfrGiSCJSAxiAlTpLAxbBridIL8zOZrqAc+2WR+jnovgLiqaGe/bwG8oy5kC8a9GPF5LnRZXDfD0PE8+m7zlKfFztDaghdFNsR5PQ25MrrT2nFEymN++EXmNWZyYv5xm3+kwMPaef4ct9L5euf7+eQ1KPkIik6KtlHKjJDoh6qiHCGqW+FnQN2cFesj8g51bjcKmqX4BuJtPITrfrjicnzqZeQ6LS15bQEObC9lXYfSBj5P96UhTTx98yLlCtZXOBbHlJdNeHYjwxQEFCvIXjcmRFblyUf8M3TRhpiVYuBonpe5Ia6oCH1G09sC4fLHgN8u664C5XOWTnVqAs9yKWK/4HV1i4rjtSZ8B+WD38QneodZH0o9NewbEzd0gBA5RfBo9rO8VxJUrsM0xYIzNyQpDF05np45uqv1yeKETci1Za95TWCNUZW17mrxe5TFAAaKo4wVFbf77r
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(136003)(346002)(366004)(396003)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(66476007)(2906002)(5660300002)(4001150100001)(41300700001)(4326008)(8676002)(8936002)(6862004)(38100700002)(83380400001)(1076003)(66946007)(66556008)(316002)(6636002)(26005)(86362001)(6506007)(6512007)(82960400001)(33656002)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s32dJvTrrSJDAn447Z8VKQvZjXPT8EYiQmlPb8M2d5BxTHyzhRLox8zF1Fd2?=
 =?us-ascii?Q?0lb+WRgl3QVKeyChq399SFxFJ94ONOtkJLZ7D2j3hb2Q4zxCdpAXNhY548BL?=
 =?us-ascii?Q?qZJ5+oY5CYHzRvm9HakVyuKJa6mWKqKs/QCKCqCdphSjsnrzRlL0IFMeB8At?=
 =?us-ascii?Q?tNT2NcV965rX/gy/fRekuRENK11roAqyEmh4k2oKoTdHTSUkYROlS8HevgNa?=
 =?us-ascii?Q?uEh+Gfdp5jLplTIRvvjavYbH/8+uWmq8pbMyvmmk9yFfIjyvA90nouEvfTBJ?=
 =?us-ascii?Q?4YiPGezfN6o8WN9CS5zAPouvAIE7SVR7uoM//ISLk5E3EEwhLJFYtAPnDneL?=
 =?us-ascii?Q?7C9st3f744efXy9+SZhPD7Pg+GlNyyEE7grZ15L4Wv9f7RQRWUronO108KCU?=
 =?us-ascii?Q?QoFUchmujgfqvaQtx+QrYLg3TLZgGfraxkUODVGNouTAZEg5zIaIp2ZFcXiQ?=
 =?us-ascii?Q?p2JuozI85P+AqH8zykJJHXGhutHB3HMEoce+hCATavZqnmE/De/+plrXTiWn?=
 =?us-ascii?Q?1CRAg1iprBSV8p/5pB2iFbw8KdJQagKSzPcQ47FWkaTD7+2ivz0KTmfOLCua?=
 =?us-ascii?Q?a6rNlVjkhhD3tAOk7NpK34asI1HEkNYTeUfqsFQSTqv7cqPYLeBlwVdn2Jel?=
 =?us-ascii?Q?uNzWJywyRy0jiqWGpdsXxGy+JLHNcMuWIu7lNVVUvVk0TqgmSc4mBuZFVBpk?=
 =?us-ascii?Q?fc1H/yI6FTD9x/QmzZIvv6boRYxCxyoDBG+PIaejlnI2lVfGfl76IWrnavCq?=
 =?us-ascii?Q?UEcQW5VOxyOYSqpBrRnaiyVG9RoK9C6znVkC2BXfsXvtB3jimaWUiWEkg6B8?=
 =?us-ascii?Q?DOViSehrLxk8MAWIjYzCxiCfrfJk4hwbx6jzzYfjUvbDD8uSh+4kRB9njIQ+?=
 =?us-ascii?Q?VxRLfvQoiXSHnLaOtD5IAw3xXcQkZTSdgUreVyzBjOZibzKSa3TifYu/lTx3?=
 =?us-ascii?Q?JNvtJBAuuJgzLVL4G+92TOqla7mHZX+RmB7OPgVjzI5Q7mm7sU5DhCs2rrlC?=
 =?us-ascii?Q?HDX+R4MCam31oZBWCy/K20ax2C0gfmMnELREkiv6RsX9OYTU3XtlvajPxijW?=
 =?us-ascii?Q?MNKSqMs1TpCe8OZvk1THX9LI6xpwwcjbfpZqsPLu6xrCeugzPLXqHbnwoFrH?=
 =?us-ascii?Q?zEC9khhLsYUHXVI7EW2UTKBcjrq3JjlGN4PKzsAogpVwqsPyDkib1TCIVgav?=
 =?us-ascii?Q?9YSD2zbm76wtzI3KP2KgIospqFjB460zjkio0QJqGfe6lQxNWMwf6YAAZhMx?=
 =?us-ascii?Q?nS/K7MVSxCjVE0SmVFJFQO5BYScldkV3RM4dDva5CtnCGj6jRmN+5qGrxaa8?=
 =?us-ascii?Q?ravVw8hqx80d9pAs3pakZltIxkJGQKwI9LiuPsTxGOyKd12InIBsAdlTLyAk?=
 =?us-ascii?Q?nxoprfRbSB4E2+ecc3dk+2oqnD/TET738opDisu3i/nKe+jBgR2bowMmRt/M?=
 =?us-ascii?Q?wmfXSMwPqC7cURqZuiBXQeD0wQ37wHA7y/DAC6iUcGddqjGBXsB1z39ZfM4V?=
 =?us-ascii?Q?hulkjtmz9mVmOu1zDkwydr6QifhXUZhQdXmXshOElQPdg4kC8xb6/8jaVUOJ?=
 =?us-ascii?Q?pBz3xX868hD6VW/Yt4F3MDhndH5vLzVGxJrDuMMUFBMstHfbFfML4GKjROca?=
 =?us-ascii?Q?+w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 763cb698-ebb9-4cb3-efcb-08dbd640af97
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 16:29:11.6785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qmx97MwjfDyi/xo7kPiCMc8qPb29OebnuU11JuGaGagRrl4vYKpfH2ZN9llHUKXaXirQV5qB71ZMowNJ9CGIMXNTRuqctzKpyiJi+Q1wAJU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7758
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 3/3] drm/xe: Add Wa_14019821291
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Oct 26, 2023 at 11:10:14AM -0300, Gustavo Sousa wrote:
> Quoting Lucas De Marchi (2023-10-24 19:07:39-03:00)
> >From: Matt Roper <matthew.d.roper@intel.com>
> >
> >This workaround is primarily implemented by the BIOS.  However if the
> >BIOS applies the workaround it will reserve a small piece of our DSM
> >(which should be at the top, right below the WOPCM); we just need to
> >keep that region reserved so that nothing else attempts to re-use it.
> >
> >Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> >Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> >---
> > drivers/gpu/drm/xe/Makefile            |  2 +-
> > drivers/gpu/drm/xe/regs/xe_gt_regs.h   |  2 ++
> > drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 24 ++++++++++++++++++++++++
> > drivers/gpu/drm/xe/xe_wa_oob.rules     |  1 +
> > 4 files changed, 28 insertions(+), 1 deletion(-)
> >
> >diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> >index cee57681732d..ef9d954f5a75 100644
> >--- a/drivers/gpu/drm/xe/Makefile
> >+++ b/drivers/gpu/drm/xe/Makefile
> >@@ -37,7 +37,7 @@ quiet_cmd_wa_oob = GEN     $(notdir $(generated_oob))
> > $(generated_oob) &: $(obj)/xe_gen_wa_oob $(srctree)/$(src)/xe_wa_oob.rules
> >         $(call cmd,wa_oob)
> > 
> >-$(obj)/xe_guc.o $(obj)/xe_migrate.o $(obj)/xe_ring_ops.o $(obj)/xe_vm.o $(obj)/xe_wa.o: $(generated_oob)
> >+$(obj)/xe_guc.o $(obj)/xe_migrate.o $(obj)/xe_ring_ops.o $(obj)/xe_vm.o $(obj)/xe_wa.o $(obj)/xe_ttm_stolen_mgr.o: $(generated_oob)
> 
> Nitpick: It seems the list of targets is sorted. Maybe we should keep it
> that way.
> 
> On an unrelated note, I wonder if there is a way to have the dependency
> on the header automatically detected.
> 
> > 
> > # Please keep these build lists sorted!
> > 
> >diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> >index 55ceadfc30b0..d542a4e2e6fa 100644
> >--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> >+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> >@@ -155,6 +155,8 @@
> > #define XEHP_SQCM                                XE_REG_MCR(0x8724)
> > #define   EN_32B_ACCESS                                REG_BIT(30)
> > 
> >+#define GSCPSMI_BASE                                XE_REG(0x880c)
> >+
> > #define        MIRROR_FUSE3                                XE_REG(0x9118)
> > #define   XE2_NODE_ENABLE_MASK                        REG_GENMASK(31, 16)
> > #define   L3BANK_PAIR_COUNT                        4
> >diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> >index 79fbd74a3944..b23827534ab9 100644
> >--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> >+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> >@@ -11,6 +11,8 @@
> > #include <drm/ttm/ttm_placement.h>
> > #include <drm/ttm/ttm_range_manager.h>
> > 
> >+#include "generated/xe_wa_oob.h"
> >+#include "regs/xe_gt_regs.h"
> > #include "regs/xe_regs.h"
> > #include "xe_bo.h"
> > #include "xe_device.h"
> >@@ -19,6 +21,7 @@
> > #include "xe_res_cursor.h"
> > #include "xe_ttm_stolen_mgr.h"
> > #include "xe_ttm_vram_mgr.h"
> >+#include "xe_wa.h"
> > 
> > struct xe_ttm_stolen_mgr {
> >         struct xe_ttm_vram_mgr base;
> >@@ -112,6 +115,7 @@ static u32 get_wopcm_size(struct xe_device *xe)
> > static u32 detect_bar2_integrated(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
> > {
> >         struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> >+        struct xe_gt *media_gt = xe_device_get_root_tile(xe)->media_gt;
> >         u32 stolen_size, wopcm_size;
> >         u32 ggc, gms;
> > 
> >@@ -154,6 +158,26 @@ static u32 detect_bar2_integrated(struct xe_device *xe, struct xe_ttm_stolen_mgr
> > 
> >         stolen_size -= wopcm_size;
> > 
> >+        if (XE_WA(media_gt, 14019821291)) {
> 
> media_gt could be NULL here.
> 
> >+                u64 gscpsmi_base = xe_mmio_read64_2x32(media_gt, GSCPSMI_BASE);
> 
> By looking at the description for this register in the spec, it seems
> that only bits [5:0] contain bits that are not really part of the
> address. Shouldn't we take this into consideration?
> 
> In that case, I'm not sure how we should interpret the bits [31:6]. Are
> they the really lower part of the address (requiring "gscpsmi_base > 6")?
> Or do they map directly to the bits of the address and we should
> consider the lower [5:0] as zeros (requiring "gscpsmi_base & ~0x3f")?

This is a common pattern in the hardware --- when an address is
guaranteed to be page-aligned, they'll make reg[31:6] = addr[31:6] and
then potentially utilize the lowest 6 bits (which must be zero in the
address) to hold flags.  Usually the bspec has a "Format:" label on most
registers which makes it more clear when this is happening, but that
seems to be missing on this bspec page.

In this case, bits 5:1 of the register are reserved and guaranteed to
be 0 on all current platforms.  Bit 0 is the register's lock bit, which
the BIOS is supposed to leave at 0 if they're implementing this
workaround.  But it still wouldn't be a bad idea to mask off those lower
6 bits just to be safe, in case this workaround winds up carrying
forward to future platforms where the situation might be different.


Matt

> 
> The description for the BIOS workaround makes me think that it is the
> latter.
> 
> --
> Gustavo Sousa
> 
> >+
> >+                /*
> >+                 * This workaround is primarily implemented by the BIOS.  We
> >+                 * just need to figure out whether the BIOS has applied the
> >+                 * workaround (meaning the programmed address falls within
> >+                 * the DSM) and, if so, reserve that part of the DSM to
> >+                 * prevent accidental reuse.  The DSM location should be just
> >+                 * below the WOPCM.
> >+                 */
> >+                if (gscpsmi_base >= mgr->io_base &&
> >+                    gscpsmi_base < mgr->io_base + stolen_size) {
> >+                        xe_gt_dbg(media_gt,
> >+                                  "Reserving %llu bytes of DSM for Wa_14019821291\n",
> >+                                  mgr->io_base + stolen_size - gscpsmi_base);
> >+                        stolen_size = gscpsmi_base - mgr->io_base;
> >+                }
> >+        }
> >+
> >         if (drm_WARN_ON(&xe->drm, stolen_size + SZ_8M > pci_resource_len(pdev, 2)))
> >                 return 0;
> > 
> >diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> >index f3ff774dc4aa..752842d734be 100644
> >--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> >+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> >@@ -19,3 +19,4 @@
> >                 SUBPLATFORM(DG2, G12)
> > 16017236439        PLATFORM(PVC)
> > 22010954014        PLATFORM(DG2)
> >+14019821291        MEDIA_VERSION_RANGE(1300, 2000)
> >-- 
> >2.40.1
> >

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
