Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53964C7EE25
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jun 2023 17:35:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F4010E603;
	Thu,  8 Jun 2023 17:35:39 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 229E710E5FF
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jun 2023 17:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686245737; x=1717781737;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2+F2B99oiSH36DprAoFxobVFGzrSQcULIWxDe1o+LvI=;
 b=JF8nWa4RFUs66V2dHZVLIofjt9mt95PEOMn/KgabZBnSmdd9y2sgtFzJ
 8Y3okoFibeDYj4lTC9SbmDp/JCYYPHbeKqx7TMB2GfGdlm9+YcYtA3YII
 eCDkhxpb/HSfD5enMYEFTnVV760iT4Lkfb3JC2MdAiLrh6XD2dukuSaVG
 NAULbSo8jWwgM/lLt3kBK9WBb3pWQ92DtI5y9Ri372ggNM5g+5+eNuQqy
 kW1w+naMXLiUL+wCW+Ne6Zpbp9GoeahqpggI8yigw/WO/7d4WaWyxJBai
 E2DIJiDYcwtPz/rnYWFApePMbDmBkfwUKBYKHhP5MNvgD1K7lMedpbf4k w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="423252648"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="423252648"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 10:35:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="713192233"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="713192233"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP; 08 Jun 2023 10:35:35 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 8 Jun 2023 10:35:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 8 Jun 2023 10:35:34 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 8 Jun 2023 10:35:34 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 8 Jun 2023 10:35:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eTlAfFN4AOeTlG9o5KlyqbSZ/hmvdm3fpzYDxAfQcSuFnFVcOhjpJfY+aLmoPRVsDcnbZ+R1Lt51Vx/tOdPcVY5bGwidyqsOTWnuX6kFQ7anrnoIfecpVYz8SyigNj1O/sKe+IAm3LUFLntKXJIzf1IeUUIp4aAaiB9qEde8NJlV8+jLUYKJJl711gLfN6jB0q18Xo8ay7ZhuYsCfFiSW5Fp4OVb9jiUOLIDsWH/9uDkbE2/1ElzAV7AAwygFOgK/SLgH1cIfeKbIimd36lmgj98XyUFk++Q9PwHzz0DqvTD1dMxE11pEDUTlHrHMDuPFqOnO7Gvv+xj8rtBPWPiMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=54oSH43emVBYzxwHe0VG/xKdKBFXZ6bbbSoK/CK4YBU=;
 b=bQSw44gizKh13vEV1Oue0rRbbuoaQxMrRMxO/u9u6a2LDq2E/+viMj0zKpszxWZUIF/iQ4pOtyavabi7Vp1yGZccaqILs3JUzoxUoFLuv3uH9nT0bwPzCJF/I9+9bHWGhBgyVJhJiPobrowZ0aFYQJi5/F183EWZCPOv5ozflAPXjQLazY7ukxUurubH5zSgUkI30w13inatXD7h+dyHZNdtYhfn9+KaZXGKPQQenqUvh/3iUKiRcvPKBOWvr9TwCfWUB2ZHafbZpYoElxPldoWcoZEjD0A8WjEyLgijvr973xN5Od1p/9d52TZ6NNE4yiJCfNLvta5HT9PVLGzKfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB7861.namprd11.prod.outlook.com (2603:10b6:208:3de::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.39; Thu, 8 Jun
 2023 17:35:33 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%6]) with mapi id 15.20.6455.037; Thu, 8 Jun 2023
 17:35:33 +0000
Date: Thu, 8 Jun 2023 10:35:29 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <qcsuilqdccvku4qoa36a5m3mhdr75akwpba77oisjk6e4kvkrm@6u5tr3dfmf5v>
References: <20230602142501.6-1-francois.dugast@intel.com>
 <20230602142501.6-2-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230602142501.6-2-francois.dugast@intel.com>
X-ClientProxiedBy: SJ2PR07CA0017.namprd07.prod.outlook.com
 (2603:10b6:a03:505::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB7861:EE_
X-MS-Office365-Filtering-Correlation-Id: a931c134-51fe-48f8-c1e0-08db6846c31e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WlxeROmu+RSsIIGRFoHJl6qS1aPKWYOSAW1avb1CacJCLKhO7Y1KuTEr40/jKxMtcYMR+x3XRcCcgQm8D9WdteitJuW5uMeadn1WLhGp2wMkC0YiCPTbOl8FJ2ITYNVfwh76RcOj2v8KQprDaPtBj71llq+q2kJPkoceYZ24pK0YXW9n5++FL2YIbGb/X+IvO1k+ufJ+S4j5gFo6ITUuA+DHxiXyTKDXOLaiNOSBz9HjryScCU7N/Aa5jM5pvSQrhCHnalCMJMJehCpM1XKkgA+VXt47+BK5MngR/0VsekiCl8XTZHmwfW/kuPfV6lc+ycCBskoe8RA8OdOlEjh1QT9xVi/4uCaN4pAtRI2r9n5TOqPuigxkSZ5lFJ35yu6r4HVtQOrxjD7bpuS4RiyGoSK3fTIp1ucaSSfR2MoehDqG1vOmphxCtKQTud7d6dOTa6EsJ9A3tEmfFA8XlGZdTAtFJ1a+BRczQdUB5Pe8Mngd+OEpIfSS57Sm80owjQFESq+lPwUL3lb6rYbXBeUR8T1D+qegdE4FPAzLYpAcqgtgnuNCfbnqmdOPVAEq+swN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(136003)(346002)(366004)(396003)(376002)(451199021)(478600001)(82960400001)(6636002)(4326008)(66946007)(66556008)(66476007)(8676002)(6862004)(8936002)(86362001)(5660300002)(41300700001)(2906002)(316002)(83380400001)(38100700002)(26005)(6512007)(6506007)(107886003)(9686003)(33716001)(186003)(6486002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HFaS46b/3FIcQuGsTJc2gaJQ/ylV4frqas6gO1DFfqJh5t5gO8XLpL+WdoaZ?=
 =?us-ascii?Q?RcO49IlswOi6DSLSIhg30IH+TkKOANkqunwUpEvfDqCyRuaqRh/KN+z92VUh?=
 =?us-ascii?Q?e6mAHUoVhSSpLQdTu2EMIwJQ2Su+oOVJowIst0uE19rzY54i3lszn/DiV5Gv?=
 =?us-ascii?Q?lQlki2bs0tS8MNh10zX5q5fAroBo2l8d7L6A0JxPQFB5e3MT+JMA7ANiizYs?=
 =?us-ascii?Q?xLHXDV6t6fpU1rJC/MZ5dTwSxGCsyqrJjru8P8Ab9g/7Q4Xghq8zerxUfver?=
 =?us-ascii?Q?6jCntQl3MN7mbPYE3GviQvBm0a59ULeESUfgCRlNJLwb46tdrTrxl1TR6fzA?=
 =?us-ascii?Q?Htq2oR5AiCsCKbkT+NxSrne1Nbo6g6H82hR8Bt72JO9XDf6CU0jJ/s4QC5Jk?=
 =?us-ascii?Q?hmvFU12zV/w03T91vhMLkTa6nXxZzhB/g335TLVn3qXAsNghNgXAiDDdi5Mb?=
 =?us-ascii?Q?K1Y1Sp6XFFWRnDuf9B4zKIwx7yAH8hkaBYFDq9i6NrsBln4/kpDP2Upym8MG?=
 =?us-ascii?Q?e42B3ifyg9p4NGgIkIfW1XAZNKOBAHz7stOb4m+LDSJFU4cbjnJW1SZadaYv?=
 =?us-ascii?Q?hf/8EDZcgwDzBJWp8tysSN7dVfu3ZSTq3FhL5Se3zMl/ZBwN4hKXjyk+a9c2?=
 =?us-ascii?Q?6Ky4TTuYLc0g28j47J4UoPEfH2fSnSLH78djOiLQlR2DqqwROfjSmPGFzAIw?=
 =?us-ascii?Q?9FLB7iE4rroyH68D2mZa5DQW++85fdBT8Mc/V/R4XkTlfCDEeeOat4fopTa7?=
 =?us-ascii?Q?Ns1k9Rfgj2QRKWp4Arrpz6xwAxqLd0aaiz8fvk9FIjPvytoclg5qEXDVaPYL?=
 =?us-ascii?Q?Er9j6NEQwga70IGnBjMLBcJv3LihJeGDaWFkwArF/lFCb7iRBoo+1T2IuVZd?=
 =?us-ascii?Q?5e18I9fS8mUg5z1+TSZPlYgjVTFibU/EZjsb3oh2yeUXwz4XRp8C3neztBDX?=
 =?us-ascii?Q?mH9+d/NvPwlYMqktun5T32PZrRpJdih5YVaEBn1/PNHz3/m768/9co0sIfWG?=
 =?us-ascii?Q?3sm+balyyeaWoa7AvNWuFH02QJGKJuR35VmvAla5QMKgL/k/MfeZ14GFj/qB?=
 =?us-ascii?Q?kSJVx59UjiBJ6JUOJCFNm6LaPmzaki1L+hebGLLaE/wcTGT1qeA4B0SZNKbU?=
 =?us-ascii?Q?ZyRhkcFhNVN3sbu9IDRpptCJqHVTlRe5I/prYhOrCU7nbyt9f5Jc4WYqW7lY?=
 =?us-ascii?Q?zJHf4NEGYtSsW1W7JZVeYvRDOFXhGGl2B672QINr01QxAnojaYLvgo8+W0vz?=
 =?us-ascii?Q?WolQjYW2eG8ReLiNyrmPOvHnS3itPCy5wrUqOeyfjSFNwpiXVHFMGHx7NpN9?=
 =?us-ascii?Q?L4Ock+kiQBdtZgO6TeSMr5GceOf5Pts/jDdmhwF/Nls3RnqNT9tUunp/MpvC?=
 =?us-ascii?Q?hgYHJ0nBS2/8KmNMmcSPIdYGeAmIb8TWA+Tr5/fivbAATATVWZ8cY7ZDn8hW?=
 =?us-ascii?Q?PGgb/KhvrFVqWMkeJ6O+U17bMCgdnYch7bUnaCmSFPeWGjibkDDwjB1hTZRV?=
 =?us-ascii?Q?mQB9yIOuTE91I/j6pPbWEUsHylzIHmCOUM2D/TObqwlnGm9D8jM7XFZivC8O?=
 =?us-ascii?Q?D26RbJrOZYeyE9OYp43AOFwmVNsZ51Cc6Znz9TQ3qPfE15oVXFvWajFhkCdJ?=
 =?us-ascii?Q?7g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a931c134-51fe-48f8-c1e0-08db6846c31e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 17:35:33.7811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: az0Kk51Q01vLQlUblA1kDiLz1qn4AV+Pq2FW/wDBj/nKd9qxZQ661sRKvd5aFBFE5b44X7NgFqlz+O8tucTiPtB3DoVj35f0bBbWBxv727I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7861
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH 1/1] drm/xe: Introduce function pointers
 for MMIO functions
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
Cc: ofir1.bitton@intel.com, ohadshar@intel.com,
 Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jun 02, 2023 at 02:25:01PM +0000, Francois Dugast wrote:
>A local structure of function pointers is used as a minimal hardware
>abstraction layer to prepare for platform independent MMIO calls.
>
>Cc: Oded Gabbay <ogabbay@kernel.org>
>Cc: Ofir Bitton <ofir1.bitton@intel.com>
>Cc: Ohad Sharabi <ohadshar@intel.com>
>Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>---
> drivers/gpu/drm/xe/xe_device_types.h |  3 ++
> drivers/gpu/drm/xe/xe_mmio.c         | 81 ++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_mmio.h         | 35 ++++++------
> 3 files changed, 99 insertions(+), 20 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 17b6b1cc5adb..3f8fd0d8129b 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -378,6 +378,9 @@ struct xe_device {
> 	/** @d3cold_allowed: Indicates if d3cold is a valid device state */
> 	bool d3cold_allowed;
>
>+	/** @mmio_funcs: function pointers for MMIO related functions */
>+	const struct xe_mmio_funcs *mmio_funcs;
>+
> 	/* private: */
>
> #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>index 475b14fe4356..f3d08676a77a 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -25,6 +25,62 @@
>
> #define BAR_SIZE_SHIFT 20
>
>+static void xe_mmio_write32_device(struct xe_gt *gt,
>+				   struct xe_reg reg, u32 val);
>+static u32 xe_mmio_read32_device(struct xe_gt *gt, struct xe_reg reg);
>+static void xe_mmio_write64_device(struct xe_gt *gt,
>+				   struct xe_reg reg, u64 val);
>+static u64 xe_mmio_read64_device(struct xe_gt *gt, struct xe_reg reg);
>+
>+static const struct xe_mmio_funcs xe_mmio_funcs_device = {
>+	.write32 = xe_mmio_write32_device,
>+	.read32 = xe_mmio_read32_device,
>+	.write64 = xe_mmio_write64_device,
>+	.read64 = xe_mmio_read64_device,
>+};
>+
>+static inline void xe_mmio_write32_device(struct xe_gt *gt,
>+				   struct xe_reg reg, u32 val)
>+{
>+	struct xe_tile *tile = gt_to_tile(gt);
>+
>+	if (reg.addr < gt->mmio.adj_limit)
>+		reg.addr += gt->mmio.adj_offset;
>+
>+	writel(val, tile->mmio.regs + reg.addr);
>+}
>+
>+static inline u32 xe_mmio_read32_device(struct xe_gt *gt, struct xe_reg reg)
>+{
>+	struct xe_tile *tile = gt_to_tile(gt);
>+
>+	if (reg.addr < gt->mmio.adj_limit)
>+		reg.addr += gt->mmio.adj_offset;
>+
>+	return readl(tile->mmio.regs + reg.addr);
>+}
>+
>+static inline void xe_mmio_write64_device(struct xe_gt *gt,
>+				   struct xe_reg reg, u64 val)
>+{
>+	struct xe_tile *tile = gt_to_tile(gt);
>+
>+	if (reg.addr < gt->mmio.adj_limit)
>+		reg.addr += gt->mmio.adj_offset;
>+
>+	writeq(val, tile->mmio.regs + reg.addr);
>+}
>+
>+static inline u64 xe_mmio_read64_device(struct xe_gt *gt, struct xe_reg reg)
>+{
>+	struct xe_tile *tile = gt_to_tile(gt);
>+
>+	if (reg.addr < gt->mmio.adj_limit)
>+		reg.addr += gt->mmio.adj_offset;
>+
>+	return readq(tile->mmio.regs + reg.addr);
>+}
>+
> static int xe_set_dma_info(struct xe_device *xe)
> {
> 	unsigned int mask_size = xe->info.dma_mask_size;
>@@ -377,6 +433,29 @@ static void mmio_fini(struct drm_device *drm, void *arg)
> 		iounmap(xe->mem.vram.mapping);
> }
>
>+static void xe_mmio_set_funcs(struct xe_device *xe)
>+{
>+	/* For now all platforms use the set of MMIO functions for a
>+	 * physical device.
>+	 */


what is "device" in this context? that seems confusing as we always ever
just support reading/writing to a real device (physical here may also
add to the confusion when thinking about SR-IOV and VFs).
We shouldn't add abstractions that are then never used and all platforms
end up using the same. Unless it's a preparation for a follow up series
adding the different handling.

+Matt as there is still (at least) one refactor planned in this area,
since gt is not always the proper target for the MMIOs. He was saying in
his earlier series about having a mmio_view or such to abstract the
offset and other differences between each IO range. Not sure if this
series would go the rigth direction, maybe we need to think in both
cases together.


Lucas De Marchi

>+	switch (xe->info.platform) {
>+	case XE_TIGERLAKE:
>+	case XE_ROCKETLAKE:
>+	case XE_ALDERLAKE_S:
>+	case XE_ALDERLAKE_P:
>+	case XE_ALDERLAKE_N:
>+	case XE_DG1:
>+	case XE_DG2:
>+	case XE_PVC:
>+	case XE_METEORLAKE:
>+		xe->mmio_funcs = &xe_mmio_funcs_device;
>+		break;
>+	default:
>+		DRM_ERROR("Unsupported platform\n");
>+		break;
>+	}
>+}
>+
> int xe_mmio_init(struct xe_device *xe)
> {
> 	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
>@@ -384,6 +463,8 @@ int xe_mmio_init(struct xe_device *xe)
> 	const int mmio_bar = 0;
> 	int err;
>
>+	xe_mmio_set_funcs(xe);
>+
> 	/*
> 	 * Map the first 16MB of th BAR, which includes the registers (0-4MB),
> 	 * reserved space (4MB-8MB), and GGTT (8MB-16MB) for a single tile.
>diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>index 3c547d78afba..80ce9de7aac4 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.h
>+++ b/drivers/gpu/drm/xe/xe_mmio.h
>@@ -19,6 +19,13 @@ struct xe_device;
>
> #define GEN12_LMEM_BAR		2
>
>+struct xe_mmio_funcs {
>+	u32 (*read32)(struct xe_gt *gt, struct xe_reg reg);
>+	u64 (*read64)(struct xe_gt *gt, struct xe_reg reg);
>+	void (*write32)(struct xe_gt *gt, struct xe_reg reg, u32 val);
>+	void (*write64)(struct xe_gt *gt, struct xe_reg reg, u64 val);
>+};
>+
> int xe_mmio_init(struct xe_device *xe);
>
> static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
>@@ -34,22 +41,16 @@ static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
> static inline void xe_mmio_write32(struct xe_gt *gt,
> 				   struct xe_reg reg, u32 val)
> {
>-	struct xe_tile *tile = gt_to_tile(gt);
>-
>-	if (reg.addr < gt->mmio.adj_limit)
>-		reg.addr += gt->mmio.adj_offset;
>+	struct xe_device *xe = gt_to_xe(gt);
>
>-	writel(val, tile->mmio.regs + reg.addr);
>+	xe->mmio_funcs->write32(gt, reg, val);
> }
>
> static inline u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
> {
>-	struct xe_tile *tile = gt_to_tile(gt);
>-
>-	if (reg.addr < gt->mmio.adj_limit)
>-		reg.addr += gt->mmio.adj_offset;
>+	struct xe_device *xe = gt_to_xe(gt);
>
>-	return readl(tile->mmio.regs + reg.addr);
>+	return xe->mmio_funcs->read32(gt, reg);
> }
>
> static inline u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr,
>@@ -67,22 +68,16 @@ static inline u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr,
> static inline void xe_mmio_write64(struct xe_gt *gt,
> 				   struct xe_reg reg, u64 val)
> {
>-	struct xe_tile *tile = gt_to_tile(gt);
>-
>-	if (reg.addr < gt->mmio.adj_limit)
>-		reg.addr += gt->mmio.adj_offset;
>+	struct xe_device *xe = gt_to_xe(gt);
>
>-	writeq(val, tile->mmio.regs + reg.addr);
>+	xe->mmio_funcs->write64(gt, reg, val);
> }
>
> static inline u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg)
> {
>-	struct xe_tile *tile = gt_to_tile(gt);
>-
>-	if (reg.addr < gt->mmio.adj_limit)
>-		reg.addr += gt->mmio.adj_offset;
>+	struct xe_device *xe = gt_to_xe(gt);
>
>-	return readq(tile->mmio.regs + reg.addr);
>+	return xe->mmio_funcs->read64(gt, reg);
> }
>
> static inline int xe_mmio_write32_and_verify(struct xe_gt *gt,
>-- 
>2.34.1
>
