Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E84EB64DA
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jul 2023 15:05:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D25610E0E3;
	Tue, 18 Jul 2023 15:05:37 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 372C810E0E3
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jul 2023 15:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689692735; x=1721228735;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=e+77n7ADg5ILlPzWngg04CEy+ZRhXZKcuUa0waLgvDA=;
 b=f3ze/nz4IklZsF43H/OFCTVLLn+55z5t6DtZWvudggsRA5HT8LL01w7R
 H1N9g6gKqvjz55CSXmQvrI5p7F1NS1yUZkRJnGRsQiDRoTHw2OV3c0py/
 kr3DcBv79rlkZLqfe6N2aK4nNrfaGX9FI9lErpNDCmrNncxplSYXtnpi9
 lg2iYeeGsfNCSjo5tCiVlBvnHKVka7x0bcJuvsYSuvXHSOiFrJA2W6f3n
 wGKc6F+3Y6/hthzsbJbF4rvcJ+O17PEkwFM3DVyW02fL6XhLCPbMdzenL
 EEoEb+TnQzLfXcbcAlS/YLk9XX9airb+Ql5xVL7uFUpGCU5wz/ECXyjz7 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="365108456"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="365108456"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 08:04:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="1054325710"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="1054325710"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP; 18 Jul 2023 08:04:32 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 18 Jul 2023 08:04:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 18 Jul 2023 08:04:31 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 18 Jul 2023 08:04:31 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 18 Jul 2023 08:04:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HfUvKqE5EkG/eBOOKUfudsTr1L2zbmlGmIgUrqKF2uQ5f/Vb4HO2s9j8z5vSnrXkPIprzVxzwBlpozLRiCiqFScby+DQ0sUx9MgbwSA1qhafNZ4vuY4Kgz06t8KkSLJHVCbsjvuTpW1mOLPBWwX03TbQSLHNNzaw2/vk09XZ3Br+OuXBqaCR6kdzx1CjtPo0VFlu0YezxdbGv6awvX+HBhUCCJQNAi4zuAovW3ArVcMfLOMonNrlY+ksp8wBxJg9AqBDm/wYlU7xlRdemlIazelbHOC/lbrGZlSkn7NLrOrbx00SxwL3RNjJxeFgNiv99mdrXMQOQ42gkmMiI/VTWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kNY/7hlaNQlf0ZYAWCTu2e+969TK25zx+VcGtKiqHII=;
 b=GPsOg3EOTKGMVhpw6iFLnbChDfuOM6+067rdjNVot3oW5JlMfzhaTPeUDBOV0Gj5qq52sagVh51iQx2uAFKy9l+F6Ut1ONKB5rneY0lmiF+Gk2KwGAPCeIJnhD6dNxJnyfFhnxsAKYgkC0YcNzy1Fz1Qd3Sc0WgIbf53PSYXN5mn6XmaMvalOjY2VHl0uFIv6EBJaq5zYLq4VSbR8wqQXucFHAHeotQ5gOLGrNkDQ/18XLizplimOGLBlDI63sbmjgT8+IIbO/fCaAglqL8rcewozlxl1DWVXx2cb6M8biFol53zoKwoPPp/ufWaBXPoAcUhqH9YKpMCYnrbzfCg+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO6PR11MB5650.namprd11.prod.outlook.com (2603:10b6:5:35a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 15:04:30 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164%7]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 15:04:30 +0000
Date: Tue, 18 Jul 2023 12:04:25 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <5qp4qvduutg4j4acvoyupsyt6mbz25j6ufraqhfq365nhyks7v@xdavr3mw3dqs>
References: <20230718071612.15929-1-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230718071612.15929-1-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: BY5PR04CA0028.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::38) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO6PR11MB5650:EE_
X-MS-Office365-Filtering-Correlation-Id: e64d9be7-71a5-42e3-7866-08db87a04941
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ipvJubLJsjK8Z8swjol0utxlXgZoKhcyTdfqp5th029OfID9vHs8ZaUUdvtE2yeCA3Z+wqS+hIT2j5Uln22qwGAkZPAipF6KHamIls96MJYoYcZfGZfQrwXT1QN75+r54dua35zhfP3smTMasnWOPIJqLifmU55Enu3lvRa+RXhat204nYltKynLX70dkFGLlH/+zanBMIKHs46oNhyA4p1PdjFCeBYJWIe1qS/trcthI2QdgKt+EmFfnbg0/v94uII1UenHOX5Rce9uj4msuPfvKt59ShF25oTms988kQ3MKzrSw11ve7wWUwSUtEzEljf6f6OaAnGyeiGoccOwAjt4SRnKrPF8eQD8GkUsMB3M4FU0t0WjJd7TMEkUiFInmitbsMMUXgBwVFgCBWFUCHc+8sMNuIl4vt8IPSZDaGSWsBtMg599PQG7ZQ31D7kkRXAfvAHj10OuCBTLHz/qEY42s5B1eZcmYQHHbUJLwDK3MIjgUsei7JVrBbyex9SmeTvEZiwOx+J+9pMz97XPHS8GjtGs3zoCOmo8bPAvyrBAFHAJrVb04u006jZV6Kc1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(346002)(366004)(136003)(376002)(39860400002)(451199021)(82960400001)(6506007)(83380400001)(38100700002)(186003)(26005)(33716001)(478600001)(6666004)(6486002)(66476007)(41300700001)(8676002)(6862004)(2906002)(8936002)(66556008)(66946007)(316002)(6636002)(4326008)(5660300002)(9686003)(6512007)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TXykxtvTfaDyDFdiM1gplWQrsc5gWTesPl/Mu0u1jj8Oq0ILDTliNKQygKij?=
 =?us-ascii?Q?K4UhmkCvig9SxTNU2709SXS3/taORrkB4iOCEHgePRBTu4+XIyEWnTVTQ8vo?=
 =?us-ascii?Q?Ls1EI7wS4s3UPtyJkSlfzPmJYuRt5ifnPc3hC75ctEZEXgj+CR0AaFNditA0?=
 =?us-ascii?Q?VkiqiU+oRJc/jqjfjVidZ3jPP16nsqbGx4mq025MLdM4W8zYGNrlzVEbp2mv?=
 =?us-ascii?Q?kbmGNMpAPoWFiHz50T0ozuQYGt39h8Yqsvo6P7Ey+0CKfvjJXwMk7jNLnHdr?=
 =?us-ascii?Q?h23rDiS2TRCh0O/ti2t78It6//3X9x1iUkXXQYG5zxfRHko4CWZiY5qHc5Qh?=
 =?us-ascii?Q?IShC6RCFTY+77+Z3c07x8nh/xFonfj4JHWL7qM3MCyWlcNCHL7FYwc08PTRU?=
 =?us-ascii?Q?BY+rwbPYEpokc1678MTQYIlWADiga6fQMXy3T2OciueYq3T61F0zaXEl/5Xu?=
 =?us-ascii?Q?usatTobF0zCHZYoqbrOuezC85j/7OMy8Mp4DMdo0XlrX1BxjyiYerlAunkwx?=
 =?us-ascii?Q?Ta5+uoUOAyZrv3dEaBYm3IWYXzYMwCsOCDiPGobikkEZ272XyCl9xsvNvFL6?=
 =?us-ascii?Q?yei3KdylwmHmX+9CD/Xz9u7Clu00edn4LAsGe7ROj3/DCWK3R05edNwk5ujJ?=
 =?us-ascii?Q?BetLxMSZaOIBkm7v/pS5R9FRPprazTmswpALcPluMHyQ7sGraqShE7kRio6a?=
 =?us-ascii?Q?MCoq5FDqf0pPH05bauH3VF1CS30kT55cX8XT7wvcv0cyIp41v8PRph1xGmPv?=
 =?us-ascii?Q?Lo9ngHAJ/fYFdwq+1eMPvCvKnsnAL3sDM6eV+yP/8VWezukSRczf9dDbnYUK?=
 =?us-ascii?Q?gqtI30CPSwKYVv2gSDaCUKwxfdk9uz/1yyJ+vC1k3jkeFOjwpa1cPlv8hd/H?=
 =?us-ascii?Q?O9/sQGRZKCrGzzxgd/1xl3Mh7SETDw2HB+OHdF1pOtNEba9QvCtNHB+pLyl7?=
 =?us-ascii?Q?noqKNJKE7vhA9IuAhZwQ/ZbYWa4JVCYZKVVW6G3nZNRxZKVzH+rz/vZMQeYS?=
 =?us-ascii?Q?cTwl3GSXq94qs4Q8wbJNGfkDFiUSbuQlbxLX26tjeFmphHo5hoGRX9tJ4Jwt?=
 =?us-ascii?Q?AR1TH8tmFLHfNRZeLeir+4i+nO3gi1nWgFWVLpOoFMdWuDFHmQQnVlfju5//?=
 =?us-ascii?Q?7UIr9YznLkcNYQxPBxOy/kJEIV/HuinPSDQEt6BOLIz89RA5mJRwvBhjxAIu?=
 =?us-ascii?Q?YQGb3+3iub1sE0/CQVTv2V3wYNv0OuUjkRxsrcFwtReHTfZJ9AYPlNAoW6Ie?=
 =?us-ascii?Q?hTU3/uDjUAHlA6QiIV/PFwxTH1rdrTqzGWSF1PWsG7clRQA6kVHsBvz76A3A?=
 =?us-ascii?Q?GzaASdq0GpgsUVl/R5fX3fVx6KTiY8vcudWM/0o6y/73VQkr2nqsG2NrUi7u?=
 =?us-ascii?Q?4qPDPq1D3g4rTuKbklWh7Yfk/T7E6vdZRVGW2yAAYqOVGqQMtDefpK8DsVoM?=
 =?us-ascii?Q?qOO5g0qzSB2yhlJ+a3ktRVPB2k0DWZ9bfTROsUCUc6cVydY4aISfKQYWY9EM?=
 =?us-ascii?Q?YdEElyb86y5CUI3VFZdZLbt++kL5eRImig14itkYn6EnO7gdQpfvnByIEb1i?=
 =?us-ascii?Q?H5dlAwkd3W1YKQSLQju5odkLQpjTbX+g7IhAq2tc01ubEhLatuYmzRrs7YfE?=
 =?us-ascii?Q?5g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e64d9be7-71a5-42e3-7866-08db87a04941
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 15:04:30.1907 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t8B9eBJjtPpKMLsyng3KBeLcgxy55X68/m3t9ue1zqT9laptJufEEARZmjY5ty58boiBogTmr3OA+wLOGVwTTGBizrktfYXuYeqKJCY026c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5650
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/pvc: Disable FPU Residue
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

On Tue, Jul 18, 2023 at 12:16:12AM -0700, Niranjana Vishwanathapura wrote:
>To reduce the power consumption disable FPU residue on some specific
>devices if total EUs are 1024.
>
>v2: Minor cleanups (Matt)
>
>Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
> drivers/gpu/drm/xe/xe_gt_topology.c  |  3 ---
> drivers/gpu/drm/xe/xe_gt_types.h     |  3 +++
> drivers/gpu/drm/xe/xe_wa.c           | 34 ++++++++++++++++++++++++++++
> 4 files changed, 38 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>index d654f3311351..16405b16fddf 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>@@ -316,6 +316,7 @@
> #define   DIS_FIX_EOT1_FLUSH			REG_BIT(9)
>
> #define ROW_CHICKEN				XE_REG_MCR(0xe4f0, XE_REG_OPTION_MASKED)
>+#define   FPU_RESIDUE_DISABLE			REG_BIT(14)
> #define   UGM_BACKUP_MODE			REG_BIT(13)
> #define   MDQ_ARBITRATION_MODE			REG_BIT(12)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
>index d4bbd0a835c2..a2da443160ab 100644
>--- a/drivers/gpu/drm/xe/xe_gt_topology.c
>+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
>@@ -11,9 +11,6 @@
> #include "xe_gt.h"
> #include "xe_mmio.h"
>
>-#define XE_MAX_DSS_FUSE_BITS (32 * XE_MAX_DSS_FUSE_REGS)
>-#define XE_MAX_EU_FUSE_BITS (32 * XE_MAX_EU_FUSE_REGS)
>-
> static void
> load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
> {
>diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>index 78a9fe9f0bd3..76458169ec62 100644
>--- a/drivers/gpu/drm/xe/xe_gt_types.h
>+++ b/drivers/gpu/drm/xe/xe_gt_types.h
>@@ -25,7 +25,10 @@ enum xe_gt_type {
> };
>
> #define XE_MAX_DSS_FUSE_REGS	2
>+#define XE_MAX_DSS_FUSE_BITS (32 * XE_MAX_DSS_FUSE_REGS)
>+
> #define XE_MAX_EU_FUSE_REGS	1
>+#define XE_MAX_EU_FUSE_BITS (32 * XE_MAX_EU_FUSE_REGS)

this change and the one in xe_gt_topology.c should be a preparatory
patch on its own. Also, please match the style here: the value is
tab-aligned.

>
> typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(32 * XE_MAX_DSS_FUSE_REGS)];
> typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(32 * XE_MAX_EU_FUSE_REGS)];
>diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>index 21087f7a4609..10496ed09119 100644
>--- a/drivers/gpu/drm/xe/xe_wa.c
>+++ b/drivers/gpu/drm/xe/xe_wa.c
>@@ -13,6 +13,7 @@
> #include "regs/xe_engine_regs.h"
> #include "regs/xe_gt_regs.h"
> #include "regs/xe_regs.h"
>+#include "xe_device.h"
> #include "xe_device_types.h"
> #include "xe_force_wake.h"
> #include "xe_gt.h"
>@@ -256,6 +257,29 @@ static const struct xe_rtp_entry_sr gt_was[] = {
> 	{}
> };
>
>+static bool xe_wa_match_fpu_disable(const struct xe_gt *gt,
>+				    const struct xe_hw_engine *hwe)
>+{
>+	struct xe_device *xe = gt_to_xe(gt);
>+	u16 eu_count = 0;
>+	u8 gt_id;
>+
>+	/* FPU disabling is required for PVC 0x0BD6 device */
>+	if (xe->info.devid != 0x0BD6)
>+		return false;

this is very weird. Do we have a WA that matches per PCIID? That's not
how WAs are usuaally 

>+
>+	for_each_gt(gt, xe, gt_id) {
>+		u16 n_dss = bitmap_weight(gt->fuse_topo.c_dss_mask,
>+					  XE_MAX_DSS_FUSE_BITS);
>+		u16 n_eu = bitmap_weight(gt->fuse_topo.eu_mask_per_dss,
>+					 XE_MAX_EU_FUSE_BITS);
>+
>+		eu_count += n_dss * n_eu;
>+	}
>+
>+	return eu_count == 1024;
>+}
>+
> static const struct xe_rtp_entry_sr engine_was[] = {
> 	{ XE_RTP_NAME("22010931296, 18011464164, 14010919138"),
> 	  XE_RTP_RULES(GRAPHICS_VERSION(1200), ENGINE_CLASS(RENDER)),
>@@ -518,6 +542,16 @@ static const struct xe_rtp_entry_sr engine_was[] = {
> 		       GRAPHICS_STEP(B0, C0)),
> 	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS, DISABLE_ECC))
> 	},
>+	/*
>+	 * Not a workaround, but for tuning power.
>+	 * FPU residue disable will lower the power consumption.
>+	 */

So this is not the place. This table is specific for WAs.
We have xe_tunning.c for these tunings. Also please add the related
bspec in the commit message.

Lucas De Marchi

>+	{ XE_RTP_NAME("WaFPUResidueDisable"),
>+	  XE_RTP_RULES(PLATFORM(PVC),
>+		       FUNC(xe_rtp_match_first_render_or_compute),
>+		       FUNC(xe_wa_match_fpu_disable)),
>+	  XE_RTP_ACTIONS(SET(ROW_CHICKEN, FPU_RESIDUE_DISABLE)),
>+	},
>
> 	/* Xe_LPG */
> 	{ XE_RTP_NAME("14017856879"),
>-- 
>2.21.0.rc0.32.g243a4c7e27
>
