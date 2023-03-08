Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC51C742A7
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 17:07:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16B0810E0AB;
	Wed,  8 Mar 2023 17:07:43 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F14710E0AB
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Mar 2023 17:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678295261; x=1709831261;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ffetbW5Hcx6h4i9O/2RWlHQgjPDJYO3/4HkOEDKgJCk=;
 b=lorYjcvE6KSG5FuC2JTQN2I8JMP7X8hlhxfNQxUWCklFzjoYsCfTrRr4
 VPqw+C1ccod4pwsGSfgrxBG7ZQ+myxZD8LwoYEvdmRtDtFeHAMHRRo9CQ
 UznOmkxnMUjQfC77DwZcPsG/PCqQj0IeeikIMsliyTHSbVGvVwet6kBOV
 Wy31Ux/slUF3eN6MDr+h5oiM1HwygsF0brlPT6MCzvGatTBcQO+OBuE4V
 XDrX/KFSRzYwHE0pjAAd77wdrK6QFH/NmDm8pxYnQ5+HhNA10oNGnC8qH
 wpwt7lHPK7H2AogmBxOCCzeL77n54CdgurdZ3qsLGQir8JpYihHk8yOoT g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="338543326"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="338543326"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 09:04:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="800833719"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="800833719"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 08 Mar 2023 09:04:01 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 09:04:01 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 09:04:00 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 8 Mar 2023 09:04:00 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 8 Mar 2023 09:04:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mHMDQ+TaqvoJXLcU0oJgBUmBiQmkq/iuW1uDBgsuJeJgeHEg4AQowROE9guh8q7yPQ+h99gSixm5liVNFWV6Die5Ge8AW9dKOtpJSGxKlBcQdJcg10wqlb4rC/ND8DY8IeGMg0dOb4HCYEEDiXl+P0BjKwuChsF3GCX3PQUgAH7FgljqW1D8/zW3PiLajhBYyfcyoPiJH7ZE7CjHu2C50q4w6kgoE6A7zN+EcDXO6Lw8ZBE6r4fVF1GZOJKa0rwMtDzDbT8jD+gkzsKRhUZ3sMKwDdp2dSGAfr42OFi17q8AGobCB75kbZ8Bx2QcePbSYgJwvzZc7f6OA8Df1fWtpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WvMavvRrB0RXprKBjrAEMKhl+v6SaH684vbLxBOfrPs=;
 b=IT9/7M1ks0VvSUCU4Ea5+q4S7rCSM4pCAgo/aBxz4k4mHpWX5N57DUssu2OwikZQDdli5Frl6s89AJ10LzVebVyOq/03WXJBh32fbJ2/2cUd0+lLbr4GBBl7me0p9R6neqrbVsdNP57lBqIobvPyIz8H2UzjZVErTYYWtFA3A8FFazWL4JY1ZpNqVsvPKuq5aq3xPK+EuIK5arbi8sj3Z7tBs+vjRfnvYzk183pyZ5fDbWDYnPQld4JbgtrmA/H/byhdBaMv5A1tQOp273iK5uRrI9pgCwe5lf7nMPjj8QwzjexnN8+YgSSvCB72DnLsMPKrn6DN1Nbh2coLqd1FlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB6945.namprd11.prod.outlook.com (2603:10b6:806:2a8::19)
 by DS7PR11MB6014.namprd11.prod.outlook.com (2603:10b6:8:73::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Wed, 8 Mar
 2023 17:03:59 +0000
Received: from SN7PR11MB6945.namprd11.prod.outlook.com
 ([fe80::ffdc:9508:42f:2868]) by SN7PR11MB6945.namprd11.prod.outlook.com
 ([fe80::ffdc:9508:42f:2868%5]) with mapi id 15.20.6156.028; Wed, 8 Mar 2023
 17:03:59 +0000
Date: Wed, 8 Mar 2023 09:03:55 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Message-ID: <ZAi/+1LtBXQ/JVK6@nvishwa1-DESK>
References: <20230308074059.202044-1-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230308074059.202044-1-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: SJ0PR03CA0060.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::35) To SN7PR11MB6945.namprd11.prod.outlook.com
 (2603:10b6:806:2a8::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6945:EE_|DS7PR11MB6014:EE_
X-MS-Office365-Filtering-Correlation-Id: c4c903c3-968b-4cf5-640d-08db1ff71bd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2EVcsj/iHvOlLvxSKmem9YIL7TbsHgcaWLy7syr3sNZ2xUc8HmYVvSbwllu8pf9HdPKj3Lwlg+4tEy5TJqn9IyVC8c117nvQ/4uXZPscgSd06mGOOVUrFdyRzJ/Jr7+WAXmpv5itzwj4wC00X6QHEslfsDKlKJm86DpKZoa3ug0j8hgi6TK8NbtBZhxs4Fqk6MKBj3m/2d2cVgcPwFIsTDuhXFSZKaZiHIE6KzXU7PIKtBu5y3jdD9d6drD6zCx9HEjr/WzhG14K18WnvhPGXHjP6z1dLF623RBbPjt47uevrBgw2yHeucu2v/MmzCx5touTAs2UXBEth6UeUGgcrQA76B+IKLIuU4UsLT88P7/JMsKDdGUeye0c1o73EH4Ez0mZQjsVHR/Pg1WLKVp2DmUsF/3fOvD8LbzGJ7DyuDJ9OxTZMLB59wMpw8AjAvF61CJ55IgViI4euNo10lsCeIK9qkaIFgaQYohGtyyEfdRQDhy1EGj1973aAHr7PmJOnViCA6tCjVRVpEha6Xi4PXsyoasKQg/p4lhGptap5MXtxmER1VvS/TWmodiLNsAVkaIBWOX1KMkRJLohlAgQq4zGToTMPkfpwPGzRdO6QvePKvSd0np7HPg6PQ4hatX9Gf1y94YW5XMgXSRhcnPWjQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6945.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(366004)(39860400002)(346002)(396003)(376002)(136003)(451199018)(6506007)(9686003)(86362001)(6512007)(26005)(33716001)(186003)(83380400001)(82960400001)(38100700002)(41300700001)(4326008)(66476007)(66946007)(8676002)(2906002)(44832011)(5660300002)(6862004)(6486002)(8936002)(6666004)(66556008)(316002)(6636002)(478600001)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gP2ZERe7R8IVXbq7yaTN5e3OYWj4hYdVqKC27TwIRoIofUE38IgL4VquZRUG?=
 =?us-ascii?Q?svsB7wrqeuHCHHYcbWj8b6HL4inkeUCzsAQTyORf2KgKGzypECREU6jCpo8E?=
 =?us-ascii?Q?A+oG5Ealq81tQJrlBrL8gjt/P8trdh/ZqgeQTbKc9W5OgtET7Nu689bOTzFO?=
 =?us-ascii?Q?sXwihECIEkv2MthL5kQAgWDOsU7hISRajmUReuZQpbyxuasy5bD3RHFHXgr6?=
 =?us-ascii?Q?yiIeZbvKlSuGEG63p5I2c153Oei7GNn0ew/Jykp44KELWVF+dPIfZXHxQCMg?=
 =?us-ascii?Q?jmKWZpmI+C/YsQTSRnLj9eVFJ+VdN3eSFazgWOUcpWaqT6zR/pNbZ1oxov17?=
 =?us-ascii?Q?Hrrx0o9mRNkv6lGSLcPs7B6/l2YCIYYn0aIFVvPjdhw6DrFkxpjuVtqbuuXp?=
 =?us-ascii?Q?hXlz4A7F4ja1+osqyQfdUAz6Dm4UmSeIBinCEeTHlwRpCR0Dxr8FJP3yzfYk?=
 =?us-ascii?Q?6Mh0aHUfFKaZUxTDPA+krwJZk7o6Go3aSyonob5KtWTcTrngBrCtp9No+jSs?=
 =?us-ascii?Q?ONTMTmaE0JtQeKF5sh0aSkIqHkJNEU8CAOIL0dhPzI6E6yre0alEV6AZo2vU?=
 =?us-ascii?Q?waRP29wsFcrhfVDkNRHZIXqGgAmqS60t3jOCLaxWdT42MWq+TZ0WtblXEche?=
 =?us-ascii?Q?VocKLq5dg/IoirtGn7RapBzW8vPjtbhk9+mco3k+eTk3IwvwVS0+eXNTS2qS?=
 =?us-ascii?Q?n3hsdevSRNxQLYx7t78lQhlCkgtQi+aTQWTF90jraQEp+Xg4opINkmZChVie?=
 =?us-ascii?Q?7qR8Cf9ITr2l3KPlaiPb5H2iDK5cXEqaJ2MjkoicpgoVWPLyFpFx5T9NiYrL?=
 =?us-ascii?Q?l/o/96eN/yxS6Qw4z7Uvc8BPhKx+DkM0MRPoyenglpQeS72+gQDwfOarGYcH?=
 =?us-ascii?Q?dRnbhypCjMsQJL8EthtZ4A4ZN/B9gtTcJERPVyHuEnBfN3OnM7XzW5fe8jG7?=
 =?us-ascii?Q?N/ZUI2ABRoDrj5bvZ0PzGGKZRxcUOoGDR65JzVxlWmaMptZc32bj6Ij4sySK?=
 =?us-ascii?Q?VTpKJbGSHg6VSnaKXA/jT91pccgVlKF3Qro+tByIvs35cyPl0gtS4KNw2ZGf?=
 =?us-ascii?Q?9mq/NTL5IMSorXLj/Io73M51l4Ot1HF+cts/kbkpF+Dx5f0MenwanxBEOV8b?=
 =?us-ascii?Q?MgRukZYaYWq+jCW+2Q83Y3sXeAP3aqHPIEtn7cDwAGLFEmQd2Qa/blIUpTqM?=
 =?us-ascii?Q?1I1nBHhP94XOcjOl/oF+tt/qUe2FuNdYPhOON6YPEmpsX1AnL98jPjEISVfQ?=
 =?us-ascii?Q?C32sN79xdDsLs+2tcICZZXck3VhUJwRi5LYRwlx5Z9LbHk02SEEaqUdM7bRh?=
 =?us-ascii?Q?sgcc6l5uW+3TfQ+e27VYepyjNc76lkli0efV6X5Dp8Agr1D0a2ULt13WmBIL?=
 =?us-ascii?Q?upFTIFWNRY44pjv97kvipJFOx+8VF2uICizxLMawQzc3EiAsWKvfGzIdTC6/?=
 =?us-ascii?Q?771RUCNA1N9vMqcBn4SKX70GDY6BvUAhaKHeOqyw1fnGXJogo4S9hNOgjGv8?=
 =?us-ascii?Q?WSCULPgqMe+a8IVYFAmWLx84a4ftECdsTy3C9dJgtPvBwrUrE3auTRDKfQ+Z?=
 =?us-ascii?Q?zoUy4chhhQzMfKgjMN3d13SzPio0JH8LG1X0gSZNKVlz8AU2zSqlWKJPmdmD?=
 =?us-ascii?Q?BH2mKitQfIdq3otTfIpo/Q8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4c903c3-968b-4cf5-640d-08db1ff71bd5
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6945.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 17:03:58.8972 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5NuN0SwApeXRrtjRu0c08lyjlmcZ78nkB7BSjAFzGiGaoSyG9ExXxRCx907/YCmpYuco7t4l1ddcef6RN2RcbjwZ+4jF+tOOwDBG93+YVGAJk7ia/0RJymxqXm5pdiyo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6014
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3] drm/xe: Skip XY_FAST_COLOR instruction on
 link copy engines
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Mar 08, 2023 at 01:10:59PM +0530, Balasubramani Vivekanandan wrote:
>Link copy engines doesn't support the XY_FAST_COLOR instruction.
>Currently this instruction is used only at one place to clear a ttm
>resource while migrating a BO.
>A new device_info member is created to know if a platform has link copy
>engine. If it supports, then instead of using XY_FAST_COLOR instruction,
>MEM_SET is used which is available both in main and link copy engines.
>
>BSpec: 68433
>
>v3:
>  - bitmask definitions reorder with most significant bit first (Lucas)
>  - s/GRAPHICS_VERx100(gt->xe)/GRAPHICS_VERx100(xe) (Niranjana)
>
>Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  9 ++++
> drivers/gpu/drm/xe/xe_device_types.h      |  2 +
> drivers/gpu/drm/xe/xe_migrate.c           | 65 ++++++++++++++++-------
> drivers/gpu/drm/xe/xe_pci.c               |  4 ++
> 4 files changed, 61 insertions(+), 19 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>index 288576035ce3..e60372a82723 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>@@ -6,6 +6,8 @@
> #ifndef _XE_GPU_COMMANDS_H_
> #define _XE_GPU_COMMANDS_H_
>
>+#include "regs/xe_reg_defs.h"
>+
> #define INSTR_CLIENT_SHIFT      29
> #define   INSTR_MI_CLIENT       0x0
> #define __INSTR(client) ((client) << INSTR_CLIENT_SHIFT)
>@@ -56,6 +58,13 @@
> #define GEN9_XY_FAST_COPY_BLT_CMD	(2 << 29 | 0x42 << 22)
> #define   BLT_DEPTH_32			(3<<24)
>
>+#define	PVC_MEM_SET_CMD		(2 << 29 | 0x5b << 22)
>+#define   PVC_MEM_SET_CMD_LEN_DW	7
>+#define   PVC_MS_MATRIX			REG_BIT(17)
>+#define   PVC_MS_DATA_FIELD		GENMASK(31, 24)
>+/* Bspec lists field as [6:0], but index alone is from [6:1] */
>+#define   PVC_MS_MOCS_INDEX_MASK	GENMASK(6, 1)
>+
> #define GFX_OP_PIPE_CONTROL(len)	((0x3<<29)|(0x3<<27)|(0x2<<24)|((len)-2))
> #define   PIPE_CONTROL_TILE_CACHE_FLUSH			(1<<28)
> #define   PIPE_CONTROL_AMFS_FLUSH			(1<<25)
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 034e0956f4ea..46cf37224090 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -95,6 +95,8 @@ struct xe_device {
> 		bool has_4tile;
> 		/** @has_range_tlb_invalidation: Has range based TLB invalidations */
> 		bool has_range_tlb_invalidation;
>+		/** @has_link_copy_engines: Whether the platform has link copy engines */
>+		bool has_link_copy_engine;
> 		/** @enable_display: display enabled */
> 		bool enable_display;
>
>diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>index bc69ec17d5ad..75dadd7e3b58 100644
>--- a/drivers/gpu/drm/xe/xe_migrate.c
>+++ b/drivers/gpu/drm/xe/xe_migrate.c
>@@ -750,32 +750,59 @@ static int emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
> 		      u32 size, u32 pitch, u32 value, bool is_vram)
> {
> 	u32 *cs = bb->cs + bb->len;
>-	u32 len = XY_FAST_COLOR_BLT_DW;
>+	u32 len;
> 	u32 mocs = xe_mocs_index_to_value(gt->mocs.uc_index);
>+	struct xe_device *xe = gt_to_xe(gt);
>
>-	if (GRAPHICS_VERx100(gt->xe) < 1250)
>-		len = 11;
>+	if (xe->info.has_link_copy_engine) {
>
>-	*cs++ = XY_FAST_COLOR_BLT_CMD | XY_FAST_COLOR_BLT_DEPTH_32 |
>-		(len - 2);
>-	*cs++ = FIELD_PREP(XY_FAST_COLOR_BLT_MOCS_MASK, mocs) |
>-		(pitch - 1);
>-	*cs++ = 0;
>-	*cs++ = (size / pitch) << 16 | pitch / 4;
>-	*cs++ = lower_32_bits(src_ofs);
>-	*cs++ = upper_32_bits(src_ofs);
>-	*cs++ = (is_vram ? 0x0 : 0x1) <<  XY_FAST_COLOR_BLT_MEM_TYPE_SHIFT;
>-	*cs++ = value;
>-	*cs++ = 0;
>-	*cs++ = 0;
>-	*cs++ = 0;
>-
>-	if (len > 11) {
>-		*cs++ = 0;
>+		/* MEM_SET command supports setting only 8-bit value.
>+		 * This function is currently used only to clear the address
>+		 * range.  So the value agrument is not really used. Need to
>+		 * have a better handling when there is a need to actually set
>+		 * a value. Print a warning if a value bigger than 8-bit is
>+		 * passed
>+		 */
>+		XE_WARN_ON(value > U8_MAX);

This patch must go with corresponding changes in xe_migrate_sanity_kunit
test.

Niranjana

>+
>+		len = PVC_MEM_SET_CMD_LEN_DW;
>+
>+		*cs++ = PVC_MEM_SET_CMD | PVC_MS_MATRIX |
>+				(PVC_MEM_SET_CMD_LEN_DW - 2);
>+		*cs++ = pitch - 1;
>+		*cs++ = (size / pitch) - 1;
>+		*cs++ = pitch - 1;
>+		*cs++ = lower_32_bits(src_ofs);
>+		*cs++ = upper_32_bits(src_ofs);
>+		*cs++ = FIELD_PREP(PVC_MS_DATA_FIELD, value) |
>+				FIELD_PREP(PVC_MS_MOCS_INDEX_MASK, mocs);
>+	} else {
>+
>+		len = XY_FAST_COLOR_BLT_DW;
>+		if (GRAPHICS_VERx100(xe) < 1250)
>+			len = 11;
>+
>+		*cs++ = XY_FAST_COLOR_BLT_CMD | XY_FAST_COLOR_BLT_DEPTH_32 |
>+			(len - 2);
>+		*cs++ = FIELD_PREP(XY_FAST_COLOR_BLT_MOCS_MASK, mocs) |
>+			(pitch - 1);
> 		*cs++ = 0;
>+		*cs++ = (size / pitch) << 16 | pitch / 4;
>+		*cs++ = lower_32_bits(src_ofs);
>+		*cs++ = upper_32_bits(src_ofs);
>+		*cs++ = (is_vram ? 0x0 : 0x1) <<  XY_FAST_COLOR_BLT_MEM_TYPE_SHIFT;
>+		*cs++ = value;
> 		*cs++ = 0;
> 		*cs++ = 0;
> 		*cs++ = 0;
>+
>+		if (len > 11) {
>+			*cs++ = 0;
>+			*cs++ = 0;
>+			*cs++ = 0;
>+			*cs++ = 0;
>+			*cs++ = 0;
>+		}
> 	}
>
> 	XE_BUG_ON(cs - bb->cs != len + bb->len);
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index c4d9fd2e7b2b..e555f13395ab 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -72,6 +72,8 @@ struct xe_device_desc {
> 	bool has_4tile;
> 	bool has_range_tlb_invalidation;
> 	bool has_asid;
>+
>+	bool has_link_copy_engine;
> };
>
> __diag_push();
>@@ -224,6 +226,7 @@ static const struct xe_device_desc pvc_desc = {
> 	.vm_max_level = 4,
> 	.supports_usm = true,
> 	.has_asid = true,
>+	.has_link_copy_engine = true,
> };
>
> #define MTL_MEDIA_ENGINES \
>@@ -413,6 +416,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> 	xe->info.has_flat_ccs = desc->has_flat_ccs;
> 	xe->info.has_4tile = desc->has_4tile;
> 	xe->info.has_range_tlb_invalidation = desc->has_range_tlb_invalidation;
>+	xe->info.has_link_copy_engine = desc->has_link_copy_engine;
>
> 	spd = subplatform_get(xe, desc);
> 	xe->info.subplatform = spd ? spd->subplatform : XE_SUBPLATFORM_NONE;
>-- 
>2.34.1
>
