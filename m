Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 052D6C77B7A
	for <intel-xe@archiver.kernel.org>; Thu, 18 May 2023 18:33:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B65B610E53E;
	Thu, 18 May 2023 18:33:51 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C3E510E53E
 for <intel-xe@lists.freedesktop.org>; Thu, 18 May 2023 18:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684434829; x=1715970829;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hdhdVLwOEedXQdwOCzC1YrPvHHEqswPCpn+INk9457g=;
 b=QWn+RwLYfq2+xFo7nz256VNQx7T9WH67wjs1w6uD5tfOZ5ZNsqDslnpr
 TD+yKkqNKnBC5WZ2U3Nc+rhG8bDVIRCz+uAGvvxBzazhc5uWbfDU282nh
 c2V2VS2TN2jm3Kc2sDdiTKofkVKM8h8Psa6FuptC0HkZvDNaAABjS+PrG
 /J/DPwgUBqbK31vAR0InsSguF/nhSj6N6PLFePWBHJ2D7vbiRAVgfqKdj
 cbTDn3bsDM4kb6V9JLYm9QgjhAH/vnOU7Lk8fP7J3LBugb6cB7nmW49pX
 +2isLJaEfyXSesjnjEvyJfUaKSJYuxMjJNcYuy/UY4qLjhXpVmrlat+mm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="380369716"
X-IronPort-AV: E=Sophos;i="6.00,174,1681196400"; d="scan'208";a="380369716"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 11:33:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="876531540"
X-IronPort-AV: E=Sophos;i="6.00,174,1681196400"; d="scan'208";a="876531540"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP; 18 May 2023 11:33:47 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 18 May 2023 11:33:47 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 18 May 2023 11:33:47 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 18 May 2023 11:33:47 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 18 May 2023 11:33:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ejre6Vx5FEkcNRhy4rnlPLPYRCF4CbfiC+Be4XNRp88UD5b5E94+d7KV9MOgB2RJF6uSTpMi2paqCWZPU7WdDwux2uxE/5490JpPBaC9Pa20lwJQqrSo9KPc5q0EUiLVAPF03x3cLKGzMENmQUgDQQ7fZZ1BCPEK9nEKyArQsHVlzheBeMod7d8fmrUV1pcaUtHHhlJZ+i/k0YPtbt4zhcqVMD9LTDEC/VYHZHQKso6ktSF0lDyRI/bEk0vRUugxdE4KOng3seGldIfD4S822hqTfPgU+zxgzMWKJCl7WAIepbjowh7ZwWvwKbpyCKK24fUf+f6w4PkTS8njnHxzvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q3BeKxDTO6wFh6bRC1Ma5o1xnejHX00GsZUoPAoVu+M=;
 b=htaiXCCU+Wek08LUxXD4lUKsoRQUjUExqvs31w4CGgJ5uJ5vsK3EjqcZqkBEcvYga3e+4clZWVyVU3b7CUHGNr7DnHFb3en1uBFROVzK3Cec8z3qIRzt7sujA2qxZQdIi50ctFDfSxvQ9F568YakXPI13LtqJOBrgwdba3+dXugJAzZnC61hwrLpLTYPFJSE8elyKhsV4N4DRyYoU2VSz9owx0M9nxpGkDLXqxGysOwQZxhDJMAqe3LRlXVy0/TmvI1u85NroepOxyOaVXiYoCnMVH9t5MCV6VXCjDCLC/9e43gId1mHKgx4qR/5eOLuiTwz8KCcmaZYUGGiDpaJCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB6710.namprd11.prod.outlook.com (2603:10b6:806:25a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Thu, 18 May
 2023 18:33:44 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6387.033; Thu, 18 May 2023
 18:33:44 +0000
Date: Thu, 18 May 2023 11:33:41 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <xviwo4psbuel2k32oq6olbekf36q3h6oq6py3ibxeb6ufb4bcp@qcyj24goewpr>
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
 <20230511034722.1929038-17-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230511034722.1929038-17-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR05CA0075.namprd05.prod.outlook.com
 (2603:10b6:a03:332::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB6710:EE_
X-MS-Office365-Filtering-Correlation-Id: feb9d131-be78-47f3-3ad6-08db57ce692b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xv5ixrZwSL+siLKVMHUKWUw/h5yqHscv7B7tHM8s3g7oWHMXRbTVvHaJLXCm3m1d3+PZlvKdbmcAi1EnXryRmAT3AAs/Wf73owHZ5nytvBiIDou9Yyf5qTQFXb9Uq1/ys/4THl7O4Vldm4h0mJL4KR3fFsjRZgGSW16nZ3ONQK8Vi27UARu3atDX++hS6PBBalsXuFWkjaxvHVEomiHDQ7n6rfGg7oVjDsO3xy/ElK/u+604etAdRN7mzL0Gu0g6HeJ2y6mUu9hkAhx5g2LjHybhcLTj+OQAzTJwHu4qBXkyVbOd0KrG4oGyPHTzJj3qBd6GIRyyApOJZqnZ69XZLKgpKNj4S4f4VFSoyvS6BH+4OkLzTDGRCCxPXDNslAlW5fNkpu47Y7hDFbqaaN8FoD5K1pspRh/OlPNr05qC08P1JGmn33dtkCtFYU52yRoyPDIY/ipDcEpgIsQHEQFFCsLN7CLXNzqr6L1ucFfEqCbMiG+qOMQHVOp5ICJ0dVeOAU6jA80Rim+MjNfqJkSr2TZdesi53OclX+vwz3VLJpuWgUzUh9R93j5wax+UcTM7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(346002)(39860400002)(396003)(366004)(136003)(451199021)(6862004)(6506007)(6666004)(478600001)(9686003)(6486002)(6512007)(86362001)(2906002)(83380400001)(6636002)(26005)(186003)(316002)(4326008)(66556008)(66946007)(82960400001)(8936002)(41300700001)(38100700002)(33716001)(66476007)(8676002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ckEjmU1mFiHv+EWZQzT2XF3TKn6bHeaRvgN0pqV1S/jjQZ4WlZFM69nJbPYw?=
 =?us-ascii?Q?Nx2SLAeN+c1Mq7WrDRAICrw2UaYTBVpmay8mUj+06XV/D5jXlE8H1QhPFKhZ?=
 =?us-ascii?Q?vmMsxuW7dMd8DiPOkpsSX0r4Nv/r9+Vf3YjOtcTmxA+rgXsY8kNve95RitFy?=
 =?us-ascii?Q?uLVNrrHng/EyCp9EKSL+G3+mehF5Vg+9hqInZ/dQ7W7mExHW9M35RiW2Ujkp?=
 =?us-ascii?Q?fnu9WV9yiRlZHZzxCPChYaAA6Pv+4NhWcaM3qBeIuIv2DyeEiegDFaoChuj6?=
 =?us-ascii?Q?NSPvqwbFd05PPDKt0SrXpgaaP96W4rgbN6/f6y/6e2QpZH9x87f6JSipX09x?=
 =?us-ascii?Q?L+it2MLD5OXxC/Yxxv2aO2OGIEy6XY4UlOO+0bPFpJMmeWmBMn+8l/HG0p0z?=
 =?us-ascii?Q?G7xGOk+LVnMfYULDU4YEZeIn18d3zgxTGnwOF3am4m/MSxTZZQBziyBTeXYn?=
 =?us-ascii?Q?uCOGpEtW1UbiPhNe2JmrjccUDECAhJolN7GtiySBOuVGvFoN81840sVNQpyY?=
 =?us-ascii?Q?IH9F3+BMlUjgz81c051MAiawJuwBJDAy+nWdW0JPlWC+O3UXbobl3OeehvAt?=
 =?us-ascii?Q?cqO7h0U1hJyEasaWfgOjMfMynWSJQNdtYl9WiMrGWhXZ1EfPTbxMNmHuO0zk?=
 =?us-ascii?Q?TY001PrxC5yX/7AqPFLIz+91zOPAVo0+yXmI+LkDgGOuD03I+XXw3pU4vNhP?=
 =?us-ascii?Q?D6IwZl0K3GBXQKtIvPUpnysZarMkPr0dhvMuSZ30CLHiFjsTzN5kGz5GXZZi?=
 =?us-ascii?Q?WAVI6uliPOQZECcwDPHXpoYr/HOJXrF/0sjGMLDYHYA4apopWuZs7odl4FJ8?=
 =?us-ascii?Q?V9pCPHrCNnAf8FLXNMtOheleiCgWmPXGfb60G0EfY9+OyF3GFZzBtW4lkPcM?=
 =?us-ascii?Q?Btnuri4Co4wk8XTUFwwwi1N/CRAR07AHlA4Bfz1j8U60/rP/ALHdk+g1bH2n?=
 =?us-ascii?Q?OBDBdkWLijJlLqSXEPNbkADwBl0ct0/cWLKgsuUvmyIW0FPVRKpcCJstel8L?=
 =?us-ascii?Q?1zCxpF1elRluJetjXi+LiLeEvkiweeYsOVFaoPQIi54vJV7WUZeZfTzsUAy8?=
 =?us-ascii?Q?K1G9uDjfIFuIsqrxlw1d9KQ3LeXcYruqA9EXvPZT98bEAH1J8qYjB2q+2jYc?=
 =?us-ascii?Q?fJsl//FbgK5bNJm5cseFyIVY7u/YyHEAABOdV57zy8+hkZuRdc/CavdNQAib?=
 =?us-ascii?Q?m+3tcQ4X8lIlPbTmXpwQAPv4JWaO3Po1u4jwpAcTAn+m+FePNNrQMB3Gz24K?=
 =?us-ascii?Q?Q1h1MhgBbkiImkmkXSw8adBdjo9ktRrlDEX1erDuIGmyVCYVThxa4wGBYS7K?=
 =?us-ascii?Q?mN3pBnA00KTy8KSF+lBCpNn7Vi2WCLPUPbV419c6rEcg8a8vXsugsJIuVhoU?=
 =?us-ascii?Q?XcfXeUgDdGWha5yNhP2ZPVizhVc3ZoFvkD2soAJsm2dk/K1MAPkXjck47Bqw?=
 =?us-ascii?Q?X39WjfpGSEjDYcziNl8KQlmbYFRQ5KSzNugc0Fw2VK26YnY+MPuJdU+QRlOh?=
 =?us-ascii?Q?1gBkEmocPBZOEm3Qyi+1Ri4MrlMya0ghKw8IbiCFJSHGLS9LXeNRdCZeauG0?=
 =?us-ascii?Q?frfVeUFvPOzfvsB8x60qpByQltMLBNZ4zjCMJXDu4FFQTWm8FMF2EihA3sZC?=
 =?us-ascii?Q?nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: feb9d131-be78-47f3-3ad6-08db57ce692b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 18:33:44.4587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7LxQ6+auxef5CGNvr7TYQXcquNKWLMALPg7HyTR/kFF2VgGRXhxeRnmuKVWSqwBrOzikoSvjGtS2ETgP+l3235/jhCZY13Mz/NMHCPpXj/I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6710
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 16/26] drm/xe/irq: Handle ASLE backlight
 interrupts at same time as display
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

On Wed, May 10, 2023 at 08:47:12PM -0700, Matt Roper wrote:
>Our only use of GUnit interrupts is to handle ASLE backlight operations
>that are reported as GUnit GSE interrupts.  Move the enable/disable of
>these interrupts adjacent to display interrupts.
>
>In the future we may want to even move these inside the
>xe_display_irq_*() functions.  But since these rely on xe_irq static
>functions like mask_and_disable() it's easier to keep them separate for
>now.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_irq.c | 15 +++++++++------
> 1 file changed, 9 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>index fa7d04ba23c0..02f44b58ce3e 100644
>--- a/drivers/gpu/drm/xe/xe_irq.c
>+++ b/drivers/gpu/drm/xe/xe_irq.c
>@@ -187,8 +187,6 @@ static void xelp_irq_postinstall(struct xe_device *xe, struct xe_tile *tile)
>
> 	gt_irq_postinstall(tile);
>
>-	unmask_and_enable(tile, GU_MISC_IRQ_OFFSET, GU_MISC_GSE);
>-
> 	xelp_intr_enable(xe, true);
> }
>
>@@ -372,8 +370,6 @@ static void dg1_irq_postinstall(struct xe_device *xe, struct xe_tile *tile)
> {
> 	gt_irq_postinstall(tile);
>
>-	unmask_and_enable(tile, GU_MISC_IRQ_OFFSET, GU_MISC_GSE);
>-
> 	if (tile->id == 0)
> 		dg1_intr_enable(xe, true);
> }
>@@ -486,7 +482,6 @@ static void xelp_irq_reset(struct xe_tile *tile)
>
> 	gt_irq_reset(tile);
>
>-	mask_and_disable(tile, GU_MISC_IRQ_OFFSET);
> 	mask_and_disable(tile, PCU_IRQ_OFFSET);
> }
>
>@@ -497,7 +492,6 @@ static void dg1_irq_reset(struct xe_tile *tile)
>
> 	gt_irq_reset(tile);
>
>-	mask_and_disable(tile, GU_MISC_IRQ_OFFSET);
> 	mask_and_disable(tile, PCU_IRQ_OFFSET);
> }
>
>@@ -513,6 +507,8 @@ static void xe_irq_reset(struct xe_device *xe)
> 			xelp_irq_reset(tile);
> 	}
>
>+	tile = xe_device_get_root_tile(xe);
>+	mask_and_disable(tile, GU_MISC_IRQ_OFFSET);
> 	xe_display_irq_reset(xe);
> }
>
>@@ -535,6 +531,13 @@ static void xe_irq_postinstall(struct xe_device *xe)
> 		xe_gt_irq_postinstall(tile);
>
> 	xe_display_irq_postinstall(xe, xe_primary_mmio_gt(xe));
>+
>+	/*
>+	 * ASLE backlight operations are reported via GUnit GSE interrupts
>+	 * on the root tile.
>+	 */
>+	unmask_and_enable(xe_device_get_root_tile(xe),
>+			  GU_MISC_IRQ_OFFSET, GU_MISC_GSE);
> }
>
> static irq_handler_t xe_irq_handler(struct xe_device *xe)
>-- 
>2.40.0
>
