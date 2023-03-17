Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0199C6FD1F
	for <intel-xe@archiver.kernel.org>; Fri, 17 Mar 2023 00:47:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CE9310E239;
	Fri, 17 Mar 2023 00:47:31 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5966E10E239
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Mar 2023 00:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679014049; x=1710550049;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LsfIY/ZdWmbpEidREnLcs6BcP25MK/gXGb2Qy00bd4Y=;
 b=oGr9lj6CEGvzFQ9TTWQMfeSvGnBKzwKcUIFzwaXjhrdTNCGy+GxDaFR8
 aN6bwauYs3ylw9a+m1MCQ82ZU0S2AiJ7MAF741WEV/kzbyfOIBweFPxTe
 +sUDp46MBKmbz01aHjvZTSV1w7C9i5tCFNsxOrw5aFiHGGqhAB5b7Dv5N
 zkqb4I6q8X4sS5BkxFz8BdDK4gQ0hn9qr34/y6cbULW9c68M3KbWDS6Yr
 dIkXa3ZbY/fM8bD47Quu9VoIDlGRCRFeUFwTaabvPlrya6xAJSy++JfCB
 pllhU8mtTRTYVMvTesGrOj2bTmIoUA7RDAVpA366OQmmJ/UZROCjAqKrS A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="336840862"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400"; d="scan'208";a="336840862"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 17:47:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="925957614"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400"; d="scan'208";a="925957614"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 16 Mar 2023 17:47:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 16 Mar 2023 17:47:28 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 16 Mar 2023 17:47:28 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 16 Mar 2023 17:47:28 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 16 Mar 2023 17:47:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bCh8jxdUNnFLuPIyksBXsgEetzSN8jD6Mjvq+u5zX0RzzGEvcBfQQcGdFXd8G56ZIQ4+ASTdKdmnNcEIwni2zdwHmux6PqssyHEJHS2Qh3cOUVJT2OgTvBDdzbGZCUottQgmtQ8s8aipgAAW0NkBcTXDb4NzDqBE3Q9asBqQDw25vpDNOWjmPAk5FbyduauWadNYce3muGYTeDeGbA+Pls1z6ooG8+7SW6LycJl0GcJC1pKUJEhm08mxGLGzDvW+dKqeIVyhK0M5Pc2mNgz2F+OMDQGySfNugoP+K/ROCUZEZyBbgY/dacTXEa7tO8xnONXF5KEOV9Svt4Uxf7uOng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=22GQ85vxffnC+aaC0rLluJcZ4xBqMs6RqsBU0DBztA4=;
 b=bGiROCWNP2QuUwOXbQ+52Yu+tF92e2uKHQgFmQCLB4qzBMBU/KeKr/F8MGsioqs7j6AmAysue3Vw0YbtWN9k9ynjMvrui8HPyR0YDtjI0mJqUApZ5uc4Jg0rXeq2UkGR4YottnoV/4dilrH4DoP24DWks+HMHjKcNtjxzTPopt1RzwnOAq9PydyiaPSPpE7t4ETwXvV7Oz4McnmCIzOipHMNvZAXOEJd+dU4tXtIBJZbx+6fxEFYBCXQG6n3T/HqIRhlq+MW2OJ2TrfWUQ7xsIWeMbiEY0sCEOf3ZQJTYZyVdW8/wVEe4tCfag2Ous6vlwYj1UR7PT8Se8zNed6n5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6501.namprd11.prod.outlook.com (2603:10b6:8:88::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.31; Fri, 17 Mar 2023 00:47:25 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%4]) with mapi id 15.20.6178.017; Fri, 17 Mar 2023
 00:47:25 +0000
Date: Thu, 16 Mar 2023 17:47:21 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Message-ID: <20230317004721.naedt6yhtjt4zoul@ldmartin-desk2.jf.intel.com>
X-Patchwork-Hint: comment
References: <20230315081500.608346-1-balasubramani.vivekanandan@intel.com>
 <20230315081500.608346-2-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230315081500.608346-2-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: SJ0PR03CA0157.namprd03.prod.outlook.com
 (2603:10b6:a03:338::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6501:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cd059a5-487e-4a46-8677-08db26812d4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MI2D08JfqJEv04xoe3hi9PnFkCoSQIGZip7KeDy0yAdj1cqX4dbRkS9v+ViF+czibYeBgpJWMGkxRuoSeIIBCSkkamyThNM47v6C96SzVy52CHYX4T+c1uASzEuTVvf2MPtqbMqyg27d9YFGY509++cTzBDj3TzYIRMABE7ygusjJ3BX/pDlPWyUsLF0eGrsRcN2KV/UAaMNcWOu0Y+FpYJXNEt3Onmlw/NlXkj0/UDAW4cYARAD+ukpsV/HlO84um1Ktp45kdWCkQDWNb0eGVGRKuscaJtg4ckrSi/NetOKTn5sNtnCLIJFBLfcef/GXRWAJsjMBD88rjrXCouzWryIsNhhW8uwguJ0S6Y7zHpKvj5ZArqAD/q9xcuwhmAmDedvfspOQCfOeaZB/zxvooXijX3umLJO0P8mLEYpNGPXM4DQSB+vVyWPxSdPJavLhLSrWJpXmiNp5SqRKBz1eh/TgZRnHMrDhu7cVqsQa+CxxhUqaBobfNNqFljqQy0n3CFqlVqmw71+Z1GeCO86TnJecdlgGLNCcYq2gIx8VFStrn5U7X5nvZbPXdTNTtoSrlVew0ex7ntTcagj4gAUBVPvMYiW4WoTywooEC1XD/FFurlWXg9ySx/F8yN5KlCdqR0TufhH53ZIJZLS1cq3KQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(366004)(376002)(39860400002)(396003)(346002)(451199018)(83380400001)(6486002)(86362001)(38100700002)(82960400001)(186003)(6506007)(26005)(1076003)(6512007)(107886003)(6666004)(478600001)(316002)(4326008)(6636002)(66476007)(66556008)(6862004)(66946007)(8676002)(8936002)(2906002)(5660300002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EiROBxr5LO5OdCA72Aq+6XM1bXnY9IAyNuatH5wibQfCVylPU02m5+v5k5i6?=
 =?us-ascii?Q?ERBRJ7xq+v5Ec6EmxZxgYh3jr0Mwgg4ALmu5LGcio5ROeiFOWuBQf+6aoPqs?=
 =?us-ascii?Q?4Ut9Jj2m/dggygKmsxfK5rQm8Svn1OFuFigMacN+kcTIEIn8WB38zlF1ViLj?=
 =?us-ascii?Q?4MX73u5GZrsJFFTtxWxRHMdWR6UP75RHQe9OYYxOKpVvTNp50nEzdefJ6SXE?=
 =?us-ascii?Q?GO3mxXhMbzhqVrgYI80cfffYw/W55Vosc7BkcgUX93npMNTOAx0fU4ZF7J2P?=
 =?us-ascii?Q?4Y2CAvS53dT422pCTmAZR6VOWqLz3j4MeZtGTgNwuj9NFBeoR5kV94k119mm?=
 =?us-ascii?Q?xIUUiDzk5dZ7f51vcvYHsdcyefBb4mGpP84bkCXzERbpCcsm0wVvMNVNy2ZS?=
 =?us-ascii?Q?23+tnZB5CX0Xth+MUWTGysjFYKa4MJOim2hqgiwTXmECqhonlxCZ2XWkbw7i?=
 =?us-ascii?Q?OXCqn2pdmYpEFOrlnOS2lCXAYcd6GNMx/oS4gMfQPqx1kpozX+d+oeDibLJ3?=
 =?us-ascii?Q?rhqlTPpVzbobE3pwa8fotsiOIzyCFPRdybMFqA56xKIC7/9t9cdyD9vARzKu?=
 =?us-ascii?Q?9QwJ7SuyMiw9OZmNIJq+c7CGL+OiukIni1vAYFo6zTrvkZq4j8Xkn8Y6zOgc?=
 =?us-ascii?Q?Bvb5k+9XOaLIKFTx47sBmfKXGhr+tb5gdZcOUspm4XQOAMtQ7OEJoHrZ5aPS?=
 =?us-ascii?Q?rEd9ZyYrU3NwocJ5bNuXngF1DNOpkkcykkO/RmmgKFJ62kTstLlHQrmwQZuE?=
 =?us-ascii?Q?X8BVUsFCz0M0DFwolMfT7csvg87uBMah1dwW2asHj3ywe+28XMo8ie1TtSYz?=
 =?us-ascii?Q?7uYQ9dWxwD15H3a5KgGIUSicY+A1F0dd/jy1T1AF81EufY+vxSMxLDvQkzfH?=
 =?us-ascii?Q?w2BM/v70bfD3PUm/ACYnjl4anIZOK9a/qHOLR94tpK0BPDCXSTTQtPuDFza1?=
 =?us-ascii?Q?0OIWebATo+ZNdSpmSQxMYH4E2W8DkgFCSDuLICF6QQDLvY1odqHuHYDTVI8L?=
 =?us-ascii?Q?jE0AN0jE5c/iT/M1kHVo0vd8nD/0iYTgfsBwdmOdNLxbsuz4Vuh8YZkNX8lU?=
 =?us-ascii?Q?gZAvAyXGK9GBnznD5Rra7YPqd8uVK3w5VH65gIgdkJSRncCiKcRjwD1MehiP?=
 =?us-ascii?Q?4cprGwOdhuAZTHvnRcVCR9DhOvbuqfU5oM/SEz6l4nu9cjlYGe+xJiVQtGxA?=
 =?us-ascii?Q?iJmGv2XInXGj4sdgMX04NdI5PEuAAZ2pimzeYdfQPKijy2z4yvqTxrfN5vHS?=
 =?us-ascii?Q?pr7aBoTt70vv7/AludlspxMrPiDLfRcD1V1pR4RZoaY4apxq67ydsEqWnWTj?=
 =?us-ascii?Q?5QBjwnaWFf29dh0rD8Xao3z3DHd2kfWmlXIZKo30u7HPWLCQrRKkE+02oMbk?=
 =?us-ascii?Q?0q8aS7yHqFb5BGXM+UrTIOIg4DHJGamcwTop1HYCkGvosizr9nHcU2GWA8rk?=
 =?us-ascii?Q?EglBbCj7owXBr4nMweSG3x1nYzI69JYSHsxeWD8LMM+ACoVgOHuSu2xbClQs?=
 =?us-ascii?Q?wyGFoz+QW/BqM5iHS58Inmd9wHh2hddKMiOJtxQqfbNSEpvjMk0i4wT8OmnW?=
 =?us-ascii?Q?pbzjQs9JvzJ+w/9TVv/mig+h6B4Kufs0XN8n6ngDA0SzU2EFtbIfgyVceGc9?=
 =?us-ascii?Q?cA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cd059a5-487e-4a46-8677-08db26812d4e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 00:47:25.7690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fe1otZqetVQlR07dIKHy15H7py9seY92En0EownOJKgz5tt1ylT64jJkOEqNuG+kfr/Jm2hzom+q9AQLxw23uSjv+IKS/4R8FcD1/OkzR7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6501
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 1/2] drm/xe: Skip XY_FAST_COLOR
 instruction on link copy engines
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Mar 15, 2023 at 01:44:59PM +0530, Balasubramani Vivekanandan wrote:
>Link copy engines doesn't support the XY_FAST_COLOR instruction.
>Currently this instruction is used only at one place to clear a ttm
>resource while migrating a BO.
>A new device_info member is created to know if a platform has link copy
>engine. If it supports, then instead of using XY_FAST_COLOR instruction,
>MEM_SET is used which is available both in main and link copy engines.
>
>Since MEM_SET only supports setting 8-bit value, to keep things simple
>emit_clear funciton is restricted only to clear memory address range
>when platform has link copy engine.
>
>BSpec: 68433
>
>Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  9 ++++
> drivers/gpu/drm/xe/xe_device_types.h      |  2 +
> drivers/gpu/drm/xe/xe_migrate.c           | 66 +++++++++++++++++++++--
> drivers/gpu/drm/xe/xe_pci.c               |  4 ++
> 4 files changed, 76 insertions(+), 5 deletions(-)
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
>index c0523d8fe944..44a4712f8c83 100644
>--- a/drivers/gpu/drm/xe/xe_migrate.c
>+++ b/drivers/gpu/drm/xe/xe_migrate.c
>@@ -746,14 +746,37 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
> 	return fence;
> }
>
>-static int emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>-		      u32 size, u32 pitch, u32 value, bool is_vram)
>+static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>+				 u32 size, u32 pitch)
>+{
>+	u32 *cs = bb->cs + bb->len;
>+	u32 mocs = xe_mocs_index_to_value(gt->mocs.uc_index);
>+	u32 len = PVC_MEM_SET_CMD_LEN_DW;
>+
>+	*cs++ = PVC_MEM_SET_CMD | PVC_MS_MATRIX | (len - 2);
>+	*cs++ = pitch - 1;
>+	*cs++ = (size / pitch) - 1;
>+	*cs++ = pitch - 1;
>+	*cs++ = lower_32_bits(src_ofs);
>+	*cs++ = upper_32_bits(src_ofs);
>+	*cs++ = FIELD_PREP(PVC_MS_MOCS_INDEX_MASK, mocs);
>+
>+	XE_BUG_ON(cs - bb->cs != len + bb->len);
>+
>+	bb->len += len;
>+}
>+
>+static void emit_clear_main_copy(struct xe_gt *gt, struct xe_bb *bb,
>+				 u64 src_ofs, u32 size, u32 pitch, u32 value,
>+				 bool is_vram)
> {
> 	u32 *cs = bb->cs + bb->len;
>-	u32 len = XY_FAST_COLOR_BLT_DW;
>+	u32 len;
> 	u32 mocs = xe_mocs_index_to_value(gt->mocs.uc_index);
>+	struct xe_device *xe = gt_to_xe(gt);
>
>-	if (GRAPHICS_VERx100(gt->xe) < 1250)
>+	len = XY_FAST_COLOR_BLT_DW;
>+	if (GRAPHICS_VERx100(xe) < 1250)
> 		len = 11;
>
> 	*cs++ = XY_FAST_COLOR_BLT_CMD | XY_FAST_COLOR_BLT_DEPTH_32 |
>@@ -779,7 +802,39 @@ static int emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
> 	}
>
> 	XE_BUG_ON(cs - bb->cs != len + bb->len);
>+
> 	bb->len += len;
>+}
>+
>+static u32 emit_clear_cmd_len(struct xe_device *xe)
>+{
>+	if (xe->info.has_link_copy_engine)
>+		return PVC_MEM_SET_CMD_LEN_DW;
>+	else
>+		return XY_FAST_COLOR_BLT_DW;
>+}
>+
>+static int emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>+		      u32 size, u32 pitch, u32 value, bool is_vram)
>+{
>+	struct xe_device *xe = gt_to_xe(gt);
>+
>+	if (xe->info.has_link_copy_engine) {
>+		/* MEM_SET command supports setting only 8-bit value. So it
>+		 * can't be used to set a 32-bit value. And emit_clear function
>+		 * is currently used only to clear the address range. Instead
>+		 * of limiting value argument to a 8-bit range, for platforms
>+		 * with link copy engines, lets not accept any value to set and
>+		 * use emit_clear to only clear the memory range.
>+		 */
>+		XE_WARN_ON(value);

since this patch comes first, this would create a warning on
uses of emit_clear() not changed in this patch.

Also, this is further exported by xe_migrate_clear(), which received
value as a paramenter. By doing what you are doing here you basically
require every caller of that function to know about the limitation.

Humn... options:

1) Would it be possible to make sure the migrate clear is executed on
the main copy engine?  I'm not sure there will be contention on using
that engine, but I think in i915 it was a possible option

2) Remove the value from xe_migrate_clear() and adjust the callers.
Document that this is being cleared with 0.

	2b) if there is a need outside of test (why would we test
	something that we are not making use of?), then add another
	function like xe_migrate_clear_with_val() that may be
	implemented differently for PVC or that just returns
	-ENOTSUPP. In which case it shoudl be documented that not
	all platforms support it.


Lucas De Marchi

>+		emit_clear_link_copy(gt, bb, src_ofs, size, pitch);
>+
>+	} else {
>+		emit_clear_main_copy(gt, bb, src_ofs, size, pitch, value,
>+				     is_vram);
>+	}
>+
>
> 	return 0;
> }
>@@ -836,7 +891,8 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> 		batch_size = 2 +
> 			pte_update_size(m, clear_vram, &src_it,
> 					&clear_L0, &clear_L0_ofs, &clear_L0_pt,
>-					XY_FAST_COLOR_BLT_DW, 0, NUM_PT_PER_BLIT);
>+					emit_clear_cmd_len(xe), 0,
>+					NUM_PT_PER_BLIT);
> 		if (xe_device_has_flat_ccs(xe) && clear_vram)
> 			batch_size += EMIT_COPY_CCS_DW;
>
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
>2.25.1
>
