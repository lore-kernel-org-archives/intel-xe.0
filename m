Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA746C6FA99
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 01:28:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8921E10E14C;
	Wed,  8 Mar 2023 01:28:41 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7257B10E14C
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Mar 2023 01:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678238920; x=1709774920;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iPhqODiH+NZogud8BQwyixQ3aNsWHIjY6jA8iLvSXvM=;
 b=WnKEZN+aV9XWjFwMQpUfESTVO1KB1P3TeJ/e5uOeshFBfi/ElxlhhQ0g
 sdJG/vWw9kmDnG5C43S9IUqleQdws602cTvuWTaUZKFbnERAeBwpKl/n+
 0tIF4VJsKIYmA1D5VlmiNwBP8W6I18veAtgoivJk4N2sIunBcl6roR1gO
 uIQkNSLVSfvdhg4bAZUn2qUyxNdUurRWTSdxGksPZdW3f/wlx7OBnH4G5
 EWcChE2tkulRlE/9OeIzwGY7cIaQISVWDe3IZt3cmuVt9bL89rpk/slgt
 +Pser2hWM9KLuHHgiXAAATyMo74vK3WEU8i2FIs68Ec7yAYXiCNGVD4Gw Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="319853776"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; d="scan'208";a="319853776"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 17:28:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="1006116538"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; d="scan'208";a="1006116538"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP; 07 Mar 2023 17:28:35 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 7 Mar 2023 17:28:34 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 7 Mar 2023 17:28:34 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 7 Mar 2023 17:28:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HRJHDU+xcLS1/MQuEPVUoho7uHNL897N5M5j50a4M34QdZ5RxSTfHYk7vFBbkDRDNUeFr261yrPCj4qUV23RwoqRi3J0xu+UY+FMIWd+iDzJSshFREAiK2R3iz2+OSNaEJtOoSJv2bDCr1kEixU6XTr8obWhrU2RC0qkuIDPuM1evINKF9bFKy3fwPI2p4fJJhdEvBQl9hLj4pCeBb+55t5YstLDarMr4E8U3CnZSfwFrje+ffQTf+QY58GoU7rt7Jvjzm9no2TvPING3pn9MaXN4JvGUeBaz2iQyI9dz968UF8NsYNMv4oXzi0+hzUxweH1d/Qlz3V/0m3txRMrpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ScfNGOFBUc3Vy83DEnVNe+eOpBcwDQIloT5fYSUF0bo=;
 b=VUmRoawo/r3y5qZI01/f5lCBIxCD0gPLqekisBch/6zkqlaIotkeIAmKaDS7KUUQkFhwz285bxosX8Ba6mw0xRGprPO8bKAPYTyX9vdGThLsqBwSlPv4H/Ui8AcVF8paeFwVOIdTJQ+3lUoUy4v0sLrH0RlD/Mm/n6QuZwVmXmozCizP1jrRZdAIxpD3B2kspT2yebULqeIk/uWXPtszoiuKoClkI4L7dGl0IkWuZzG3t7MWNA9zU/nZgdu2S/Ei6eFYDXWrsoOSQt7ySKzLNhhjweMuiEnNQuLgXuM5yCvVv6gsDbjiK4onoSuRoIZlbIgOYKc0CxWtVzyurzVeuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SN7PR11MB6849.namprd11.prod.outlook.com (2603:10b6:806:2a1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Wed, 8 Mar
 2023 01:28:27 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::e59c:fb1f:1b37:3412]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::e59c:fb1f:1b37:3412%3]) with mapi id 15.20.6156.029; Wed, 8 Mar 2023
 01:28:27 +0000
Date: Tue, 7 Mar 2023 17:28:18 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Message-ID: <ZAfksrEFkPxmQWA4@nvishwa1-DESK>
References: <20230307080916.275289-1-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230307080916.275289-1-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: BYAPR07CA0032.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::45) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SN7PR11MB6849:EE_
X-MS-Office365-Filtering-Correlation-Id: 84473a0c-563c-4a7d-f52e-08db1f746aea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kCEjGdqCSzdM1kC4W1d312Myeh/A6dUsDQIerZpNshNGHbgrCmk7KNxVYAEDm/w/QlvrQIRtAHE1MJisje8p3XdDfJwbHrDpj+R2qtoVU8KO7GfANehzNn7E1FIy55KfPHHjxgG7ytTBkioedMwXv4XjSKAfyAtUMWZuPPTwUeNJhWbRooCRvK8NOxC+CBQNa1ZhBQxpMcSFZHG0iFbx+tY15qRygh0G/v15xdHqhAG+4/acffgjGLY0k3YXKEztiUh1W1h58o+0JTFtcxYE7FrejgIJwHzpZ8H4A5saJ5tA9S9LwaUb/T86QAKnv/y4bt2vaVomTWMLl9ibF+D/fhevSxQ7/qsw+DOEvng0q7H+CzMJntP7NG2LvKTc3lJUr7IvFGP6CupJkzGr+tW/wlold/OVwr67Pd+f9Ox6/idB+YcEGMy6hz6a93YH9B3J1RRauBCcn9ZrkEhMjBun8af843xKqmeOZr1vJ1GU5+5g35+TBKw4wTjo98YDUmqx+/FUx7hiXS0HDrfuEmaAVPrw4SVYcXRXkx16OJCP2NDK1jlDp9aQgg3qu3HHlabC+EKLZMSixSEFsnbcAiCKvw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(346002)(366004)(39860400002)(396003)(136003)(376002)(451199018)(86362001)(38100700002)(82960400001)(66476007)(2906002)(6862004)(66946007)(5660300002)(41300700001)(8676002)(4326008)(8936002)(44832011)(66556008)(186003)(26005)(9686003)(6506007)(6512007)(83380400001)(54906003)(478600001)(6666004)(6486002)(966005)(6636002)(107886003)(316002)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jYgZJN1d6BWyNyODi0gRuTyydC194a0UuPQIDVb3bFfM48pT6AzWUSKttnO1?=
 =?us-ascii?Q?lF2QQddtkzKqKNdWkVGVDWOEqiRXaQWJylrQ9XDVfH1yb2H/UiCQRpW1wfSg?=
 =?us-ascii?Q?3qoudhbVCxpgTVB3jHIDZCPYzmIaeMk1xQ0AXfPzoWxtapCJuma3/w6cZloE?=
 =?us-ascii?Q?pQ3AO5lBujk03/FalVD+w7egdeKmcPuqWwzXd7DbWXplSGzhrAjvNVr3bAsh?=
 =?us-ascii?Q?DtD8vB4hw0BqkAdJ1rgqksIJ3GHTbhJN2hbwNnnhqoU9Hj9Rb1MUqZuVyw2i?=
 =?us-ascii?Q?nKa9kOGUfNkEyZbV206bPQrcChSM902iUb/DHvmr8mzVBHQ2/4JHakf9PhfM?=
 =?us-ascii?Q?ZxBVNeFiiYkZynB807vMjaLyPIJ+C+++BR/uz7UmBMH23EPET6TbOC77Bm5j?=
 =?us-ascii?Q?cVM9bdFQzMGzOEdREvNP/gKKZYeoZZWMhHYnMJF+uCxwa7tuJaNnNRor85NH?=
 =?us-ascii?Q?dN7jDTxb7HZ051bPNc0ySsPXM6pzZjVE9aCo2keCc1IuqyLG8SxJkbTu/p+Q?=
 =?us-ascii?Q?j8ul6q5ikyTOsVFfO9G61WhanSnXJ2sa8UZy3RiG9GRRhNS3pppsRK6lONc+?=
 =?us-ascii?Q?qetY6FTmMOrxK74PHC0FFtW2LbOPCayr8FdcT9XiciUu/JiTq0pSSwhwoTKY?=
 =?us-ascii?Q?fexrJVDDMGmIfBJa5+YI2PfhlowyMwsSXQ2p2DCqVXqSaTJd5q8P2Yi67p2/?=
 =?us-ascii?Q?2WFdK0P+urAbiqpMeXMTA6v5NxWog102lSxrdpz0ZMfFyjUzVX1Ao8dxZ525?=
 =?us-ascii?Q?RgB/QsRuXDbrfYD6v58N5ojbInQK3RqLY107bI2E6MSJ3FAg3xpQy3LK/dWK?=
 =?us-ascii?Q?iq9kF5GXWcfr/FUJMXLKlbfyx86zVuudKY7FaY7iT3z9SK038xtlPmCtUoNL?=
 =?us-ascii?Q?ILQ7I+wHfdk3t4DItAGfHuFCpV62GFVA7+zNzYbZPrPOpyyHo8MMfQf3HmY+?=
 =?us-ascii?Q?VS8sT1UDmtJ9BwIYKImhcUOXimGbr8dNDfSFZzPTMOrJrDIXZURqCJoJaI28?=
 =?us-ascii?Q?guqkSi50KDdUx79pIhyA7hcp4UnE77Hyd0tFyeRlKxiAeK1H4CgG9ypCNILx?=
 =?us-ascii?Q?z4kUwMu+g9GESDAroso29qOeUJsRz3imblczHO8c9RYy0xTCXKV63HH3tii5?=
 =?us-ascii?Q?Y8K/fy2vlHtQCIF79LlE7iavq/BBAffz0NWF8IvPntkP8Z+rk+nY/EAFG4AI?=
 =?us-ascii?Q?9CeRF8btVs6DDU/4VQpBqZNhRvp9ki2s2GHRJ+W1AAoyBj92f6oGuBb5MyNY?=
 =?us-ascii?Q?5JQ7Irbub1YqXEk1470oJaS/sqWq35v9pNQp3nzfNMo00nwIjLcJplCHROzZ?=
 =?us-ascii?Q?Y9MHDXtXX95q3TeIU/F13h0OGdyj2AFZrFqmRtgRKI7+ROOHwzSp8Bt1mzlA?=
 =?us-ascii?Q?SdKI2f/IW472pT40n2qfRCdPlvzVmUhs02ijLgdEpKxJ1XBSQj2EJoUTq1NA?=
 =?us-ascii?Q?bzenqGP2s+Qmd5cpuhd2ttqn3UbMRnC0+MavXPgJoPfcNafY748OkN70uxdq?=
 =?us-ascii?Q?TPRDbo9hBsBq0T7YxgS9QtFfa/LMIX8vzH21jyVP5pF37Vr2wkMZTpsLHr6A?=
 =?us-ascii?Q?wnq5ceDW0b7yLnsRoH04Rp7x0QD/YkShrkRhXM/Hen6UfmHHK7PJn+aFCqYh?=
 =?us-ascii?Q?gg1bvuqgO2lKU1mFHBAgNjE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 84473a0c-563c-4a7d-f52e-08db1f746aea
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 01:28:27.5226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oaTPGRaoZG7/JH0BoG3Gojq6gCZhip6ZdMdSrYS/5a1+6jJFmsd1d/wf7bCn65z3GaMGI7sGl/KK9cvKuQGi6x9opdyRuxAOGumYudt7s1IcBXiE82CD0p5npmKNpbss
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6849
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Skip XY_FAST_COLOR instruction on
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

On Tue, Mar 07, 2023 at 01:39:16PM +0530, Balasubramani Vivekanandan wrote:
>Link copy engines doesn't support the XY_FAST_COLOR instruction.
>Currently this instruction is used only at one place to clear a ttm
>resource while migrating a BO.

It is also used in xe_migrate_sanity_kunit test.

>A new device_info member is created to know if a platform has link copy
>engine. If it supports, then instead of using XY_FAST_COLOR instruction,
>MEM_SET is used which is available both in main and link copy engines.
>
>BSpec: 68433
>
>Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Thanks for the patch. I think this should fix some igt tests that were
failing due to LMEM BOs not being cleared upon creation.

>---
> drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  9 ++++
> drivers/gpu/drm/xe/xe_device_types.h      |  2 +
> drivers/gpu/drm/xe/xe_migrate.c           | 65 ++++++++++++++++-------
> drivers/gpu/drm/xe/xe_pci.c               |  4 ++
> 4 files changed, 60 insertions(+), 20 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>index 288576035ce3..df9ed4fbf2bf 100644
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
>+/* Bspec lists field as [6:0], but index alone is from [6:1] */
>+#define   PVC_MS_MOCS_INDEX_MASK	GENMASK(6, 1)
>+#define   PVC_MS_DATA_FIELD		GENMASK(31, 24)
>+
> #define GFX_OP_PIPE_CONTROL(len)	((0x3<<29)|(0x3<<27)|(0x2<<24)|((len)-2))
> #define   PIPE_CONTROL_TILE_CACHE_FLUSH			(1<<28)
> #define   PIPE_CONTROL_AMFS_FLUSH			(1<<25)
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 199bd37fce9a..a73c5e1d7503 100644
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
>index bc69ec17d5ad..59fd588a1faf 100644
>--- a/drivers/gpu/drm/xe/xe_migrate.c
>+++ b/drivers/gpu/drm/xe/xe_migrate.c
>@@ -750,32 +750,57 @@ static int emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
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
>-
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
>+	if (xe->info.has_link_copy_engine) {
>+		/* MEM_SET command supports setting only 8-bit value.
>+		 * This function is currently used only to clear the address
>+		 * range.  So the value agrument is not really used. Need to
>+		 * have a better handling when there is a need to actually set
>+		 * a value. Print a warning if a value bigger than 8-bit is
>+		 * passed
>+		 */

xe_migrate_sanity_kunit is using a 32-bit values and hence needs fixing.
I gave it a try and adjusted the expected values there and the kunit test passed!
Note that below patch is needed to get xe_migrate_sanity_kunit to work.
https://patchwork.freedesktop.org/series/114709/

>+		XE_WARN_ON(value > U8_MAX);

A value like 0x78787878 works. Caller can use those without having to
cast it to u8.

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
>+		len = XY_FAST_COLOR_BLT_DW;
>+		if (GRAPHICS_VERx100(gt->xe) < 1250)

s/gt->xe/xe

Niranjana

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
