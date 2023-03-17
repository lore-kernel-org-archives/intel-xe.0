Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709E8C6FD1D
	for <intel-xe@archiver.kernel.org>; Fri, 17 Mar 2023 16:25:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3573C10E3C6;
	Fri, 17 Mar 2023 16:25:26 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE41910E3DC
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Mar 2023 16:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679070324; x=1710606324;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xTDXi1b/8uJ21QPKSU7BPmu1p99xTXl8s67du2UG5Y0=;
 b=kC0a2CczopVH0EiRTccZPO6Xx7K7Wx2RWW774FOtghIN7w2kEyuTkbCB
 WZpvbEx8nBun3twkS1q8dnD5+70gmb6ABIZa+f0CAdrYWF9mxqNSl6lD3
 QX/Oz2dd17KJHS5ZSkKNCKEfoyqsehnjUTtqi15QFQpOodT2c5yaOJdRx
 NPChEdT6je9NELkCYLppgr0Pb0YtRI5byOGPFW2MyabZprAnxk69Zdmdq
 mWQqWEw6Ta3r7AZMsx58eYVLDWgD3Vh4RkAl7utefPLfZbz9X99DK4BMJ
 te9Ioa7QADEbEZqrVQY/kFS1Wn+6UK4WDTElPuDzEH+cDLUYUcqBknxbR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="335796171"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="335796171"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 09:14:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="1009684063"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="1009684063"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 17 Mar 2023 09:13:26 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 17 Mar 2023 09:13:26 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 17 Mar 2023 09:13:26 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 17 Mar 2023 09:13:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fyvI7WGsbaONBKkHkRyHGsJc5tWdw/3HJD6uwbGLY97B5M+rmfDpDeQlMOU5sXyjkdK2csPfMM2ihfsy5msmWtD++vhnZJ+rXDvPuppPInTrUtJopirDLTaZosQsXwguVE7tB9HAjOZA0d62V4nlcluNdtCijSDwpMG4TE5f0iPqMPIy+ybc1tTYg4+7RO7p34ZBGgH1nurItTE0+0r4ed+gXy10nUKhnQQltt2ygU42wTC3BawiIrotZ6idsx52+zdtzhtoFpjxoOje1f55AwePNTqVecUc5CsMSjWi/IgbhSb+xbSUN8Lj/np71sxqJRCRsvSo7yJ3IDCQWjxeuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qMMZUuFg/eXi1zKZLzCZyPVV5DYMgbc0V2+sDDI8WOw=;
 b=C5y71Sx2MbDP8w29bb6AIMnwuFphbcgxnr4JG+ragxeigMAyYL7TtnaGAMNAw8H/Jn/qb/qV1wH6ayU2YUWY+EDXeWukWTmgBMXE70wtH8DFddm68KQIl8lgUKz/ZzJYNhIt1XQgDbGRaD+FIzTM47LIVXu7bNwU6p7NPZtAvnqpGlNQPaKkhJdO6mDYNcVXPmbNXqfQFrz3C2lIQjcgC0t2pzLZ4bzvC6us3mEJyAKEWLloUeGbNMkorITvhmcQZ5PeAgoVSYJLqO230B5vQKZPJs670slPTHPt9oosQ8w54nEUN2ZFVg0WyJZYpdLeyHHr9RUjx2/pyrWC+Czx8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB4885.namprd11.prod.outlook.com (2603:10b6:510:35::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Fri, 17 Mar
 2023 16:13:23 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%4]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 16:13:22 +0000
Date: Fri, 17 Mar 2023 09:13:17 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Message-ID: <20230317161317.4ne3lrardwuatv7g@ldmartin-desk2.jf.intel.com>
X-Patchwork-Hint: comment
References: <20230317153531.1011865-1-balasubramani.vivekanandan@intel.com>
 <20230317153531.1011865-3-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230317153531.1011865-3-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: SJ0PR03CA0108.namprd03.prod.outlook.com
 (2603:10b6:a03:333::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB4885:EE_
X-MS-Office365-Filtering-Correlation-Id: a710fa04-656c-4966-d5e5-08db270287d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qlPu7a7ITWSrdCcadeEIyO6xXyEnWEmNYWw2737iuCE9AiaCZvdkYHuibpbxbZbOxL7GwwUPPhr22BMcmMPv5yEFTo2Oz52+8CAlhzLwLDTMzHZqUylGFKUnCIIzdGJFQ8k4kGXMK6i9CEY3zparjF0xw7tUFQYVnCAvpyu5HMP2VZNiELLhrUNlt26DuMkZ3yUTCDmnLwEC+E2mla06C8GRe435HSh5HdDAjr1SYz3Cxn1LmIE13PUWGbZi1r0Y3xa6+irOKAV3OZCX5XUelrmn1vv+KemxrE6ZkvNVLrcOVh8iW+AUiNF4PH+Xm4CGN2EnZpmZCCuOihxcS3NfzccR+ns15VzjVp8e+3i8Ivr1UnTeqrGghCAdhFlK7Qw5jSmnDZY8OozZuiaZoi3qoTK8toq8Kbl148+2oHaaoJ1nlaprzdAVpsqOojm3QNBtlTP6TromYFR0/ezvR/7HgVz5IN2Wz7+EwSGxbCV48q+aoHJtXWbY0xiVvYobBUPDZhhKRarM7Qq7F+3P5j8MRujVLQoPQHCxWXJFRFc8I0eytuY/CjDtUctQN7ePY2eNdR5vy8EdvibwwON6fL4DlGKQycw/3qYTM3cTerrEUSOGhYM8VtyBSOXdYpqMYd8O7IibSbAICFFEFl4+NP43pA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(376002)(346002)(366004)(396003)(136003)(451199018)(4326008)(6486002)(26005)(1076003)(478600001)(6506007)(6512007)(83380400001)(66946007)(186003)(316002)(107886003)(6666004)(6636002)(66476007)(8676002)(66556008)(6862004)(8936002)(41300700001)(5660300002)(38100700002)(82960400001)(2906002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RH9xexBpFPpqaun9aWP1eOXA+FCEZKA4ADPL546gGToLxMF0Rpe+Bh5BgfOI?=
 =?us-ascii?Q?Sh6TgG2ZGX0gT/uWf6/eg+3Kv8GZSfJRuZjw1ElzP7dOkwtKw8BQF37XZA7v?=
 =?us-ascii?Q?yWQQTJP+nlEWScNT7yYYaDGm60OId+upLMmkUctvi0P00eSFgzpaLC6oZ+UX?=
 =?us-ascii?Q?Io+dvR0+ltspr2Fqf7XlYj4IBYv8ypvuSDUgqWFSPJfGg4o88KueCU8PfjMv?=
 =?us-ascii?Q?IGqvry3FHmVELHAq0eceTiC7iWXoFWs37Hq7u8i+tgccT6a0hDPA35JlxAk5?=
 =?us-ascii?Q?XzN+h5xgqB4A2Yx/EwTjzkkHe54mdDi+sELs+HI606VqdbpGVDSD5U2w7/8I?=
 =?us-ascii?Q?5clsfMrMxLn5hJ7GbZ0SKvDh5JPxabjsmf3k66ApTGArUb6gkg939Yldl8zW?=
 =?us-ascii?Q?Q0a/4g6e7EzXyw0WDTJ/09KSuLjAXVUa8vdOfFehHvldKiHH69E118Wf5lz1?=
 =?us-ascii?Q?QN5xhESP7U1JVfnyJ/bN1VAVK7gsyYl2d+R85csq1mv7fByj9t2NZOCi8jeb?=
 =?us-ascii?Q?ePgD4/LS4rrHnMm+7PDAWImZS/1dHWPA2quUCG04rX587lxzrPtnv7ycO2/4?=
 =?us-ascii?Q?Xm27RUi5nwy/A3gcVH/BeiBoJj77W+US5bwGlio9ZadMxfN3CeyFnZxeCEG1?=
 =?us-ascii?Q?xXptWqEIb01rGwGJ4A35pSOkQNMek/w2sJmK6zGumTT5leAnaX321Zgwr8H2?=
 =?us-ascii?Q?CQ6KmHDyGx3CO3p0lVsoHPfF43ok4nUkkTLvzqpT0aoKrReAXs+idogxe8+h?=
 =?us-ascii?Q?zfzX1rpfF0Boc8GVOuM5MyO4EqgdZ1jdxpHXAuSz6b2ap7V+ydS85TM5UJGM?=
 =?us-ascii?Q?lu5EwSNXPJmjWZqG7uzFrzP+m5HfSycVT4DfMLrVt15z5fsO9eV2BtuMT4rO?=
 =?us-ascii?Q?t5k4/picc1xBlOhsGP8Ghspu/Hg9W//U0JoeBVOrFOUjbg8Rz0L4ELmnjZT4?=
 =?us-ascii?Q?taGbAeNm54s1P2WSg5WmZ225kS2hsIOCakH7MuFbnAOl96Jes0PVeULtfxxF?=
 =?us-ascii?Q?UZSqoznpFNDTvkdOxNXso//2xDc/xkfuA2iQdo+fn4GtGOtGXekwVYihmsPM?=
 =?us-ascii?Q?5LqcyZ68hY3ygUpInEpRa5Hnr+kpxK5UrrWfRRbQCelOQ04KRLXVJrQzeWJu?=
 =?us-ascii?Q?Y4sPkBSxwYf9nXscyT7rr+68CXrE+a1cJCyTNbCwFthil9IuFff8ehGU9Ugf?=
 =?us-ascii?Q?IJjutLV3QCkVuj8tAf4eJN6bLcUiAqQDsXq9tSeIRgp8LJGxFzQhOyHGHEa7?=
 =?us-ascii?Q?BskOY6tL0rr36ngstn7VQYZIWklh9EzzLvJ2yjfYqsD2K9Xtq/zO40qi9p40?=
 =?us-ascii?Q?XkqESl9oiuXaBjR4bCsvzEW6ygWOkMU8EOim7mvLo0HC67iINYAkyOPqduyj?=
 =?us-ascii?Q?t0ELxzntjXzGrBHYhFrwHz4oslMMAw6uw3L6M/L/JdAS3BEihbLbMGSyQG6h?=
 =?us-ascii?Q?jq8jtdfJ3xfKZzaswPtEypcE/hdZEKm0DXhbCwSbAkdPXJlIDpsEVf61+PaJ?=
 =?us-ascii?Q?MCKimBPNMSTlFSw/jAQorhwJ64u7CFpaIViOZWIjT/j/LoqEv/S++5eBKbWo?=
 =?us-ascii?Q?qjTTK5GC0amj07q5UPk/BfO4TGQfV9CKvL3dCtQM1rKfN+06cyVj4RdEtfl8?=
 =?us-ascii?Q?wA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a710fa04-656c-4966-d5e5-08db270287d4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 16:13:22.7065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2OOxg9FPCM6K2U0hAqixQekCgRvJj816y8bQn1WUhzVkttqUFOtIYrsT2b566alRFutLhKl0s2rdsK0P5HUX/eLkYAs1y6W6EuVdttHjZOY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4885
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v5 2/2] drm/xe: Skip XY_FAST_COLOR
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

On Fri, Mar 17, 2023 at 09:05:31PM +0530, Balasubramani Vivekanandan wrote:
>Link copy engines doesn't support the XY_FAST_COLOR instruction.
>Currently this instruction is used only at one place to clear a ttm
>resource while migrating a BO.
>A new device_info member is created to know if a platform has link copy
>engine. If it supports, then instead of using XY_FAST_COLOR instruction,
>MEM_SET is used which is available both in main and link copy engines.
>
>BSpec: 68433
>
>Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  9 ++++
> drivers/gpu/drm/xe/xe_device_types.h      |  2 +
> drivers/gpu/drm/xe/xe_migrate.c           | 57 +++++++++++++++++++++--
> drivers/gpu/drm/xe/xe_pci.c               |  4 ++
> 4 files changed, 67 insertions(+), 5 deletions(-)
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
>index fdcbab31a418..1316614bff20 100644
>--- a/drivers/gpu/drm/xe/xe_migrate.c
>+++ b/drivers/gpu/drm/xe/xe_migrate.c
>@@ -746,14 +746,36 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
> 	return fence;
> }
>
>-static int emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>-		      u32 size, u32 pitch, bool is_vram)
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
>+				 u64 src_ofs, u32 size, u32 pitch, bool is_vram)
> {
> 	u32 *cs = bb->cs + bb->len;
>-	u32 len = XY_FAST_COLOR_BLT_DW;
>+	u32 len;
> 	u32 mocs = xe_mocs_index_to_value(gt->mocs.uc_index);
>+	struct xe_device *xe = gt_to_xe(gt);

nit: this is usually the first line in a function so other things can use it.

>
>-	if (GRAPHICS_VERx100(gt->xe) < 1250)
>+	len = XY_FAST_COLOR_BLT_DW;
>+	if (GRAPHICS_VERx100(xe) < 1250)
> 		len = 11;

there is no behavior change in this function, or am I missing anything?
Was it done just to match the style from another function?  I don't mind
the change.

>
> 	*cs++ = XY_FAST_COLOR_BLT_CMD | XY_FAST_COLOR_BLT_DEPTH_32 |
>@@ -779,7 +801,31 @@ static int emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
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
>+		      u32 size, u32 pitch, bool is_vram)
>+{
>+	struct xe_device *xe = gt_to_xe(gt);
>+
>+	if (xe->info.has_link_copy_engine) {
>+		emit_clear_link_copy(gt, bb, src_ofs, size, pitch);
>+
>+	} else {
>+		emit_clear_main_copy(gt, bb, src_ofs, size, pitch,
>+				     is_vram);
>+	}
>+

nit: stray newline

>
> 	return 0;
> }
>@@ -834,7 +880,8 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
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

nit: stray newline

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

mostly cosmetic issues. Feel free to add my

	
	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

when fixing those

thanks
Lucas De Marchi

>
> 	spd = subplatform_get(xe, desc);
> 	xe->info.subplatform = spd ? spd->subplatform : XE_SUBPLATFORM_NONE;
>-- 
>2.25.1
>
