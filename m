Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6710BEE4993
	for <intel-xe@archiver.kernel.org>; Tue, 22 Aug 2023 14:02:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31ABC10E379;
	Tue, 22 Aug 2023 14:02:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2118810E379
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Aug 2023 14:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692712973; x=1724248973;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=G/sn5VFEMV3HvvocspFZuP0jPomPNptafWURx+AM1A0=;
 b=aTBtZY8pbAZqfDhSMrkRXXU8yZ10hQYrBxSCY7jsXI4Z+XjfeG+2tOkU
 ex7AtFZiITdakuN0r+k4hRxrJXIYySspjkcMt2SIqRJlyv+j+EUXiiSD4
 jOAJG3Dk8iTx8AQF/wi+LFGUpzVvfJo6E6y0MRl8v+ZxOMm/pYAW6ThG4
 1/MooKWMMomQJljsf87MrW6akCR/Js2S1kX8Pu9IMxivTFfae2/BMMsMU
 6JjyZCNvGOvxxqoIpFZheBc+Sm0RYMmTU/sr8Wg+wIqhIfq/tpjRfrw8i
 HVoD6YAi/D8niQgRrBu7xK0pfjtizOEbFWFB9vdTyTiXlOaBe2WgKtSes w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="437807082"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="437807082"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 07:02:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="859926719"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="859926719"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP; 22 Aug 2023 07:02:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 22 Aug 2023 07:02:27 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 22 Aug 2023 07:02:27 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 22 Aug 2023 07:02:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z4NWp0u91L7wNUR5VVbLAzP/nM+uMQRfZ51qWDvmyeFlXiePVCQeQcvdOVndMBsB45eJBE1vMwFP62GwknKuWT6367fIftV7L17uAkO1ACV4ns5fDxisZUcs+HLfmlARe0FKY5P54B6ZRlabV5eiS2PhHqghYW40XN/IKX0VnSbW5Qgb5ccD/afsOQklmPgaBg/fakMCODFX9s/MCJspdwdR9ERbUoa1rXqt36K/KKkNKCbx5MXT/vEzQ4D7PuAaYzwU87T688OqBHkmlpX6ZQJf7Fw+DsMU9uPvOLNYp4grhfbBu0Kv5EfHt/Sy8I9AkMLBJFdx1ylBn9yt+ULOxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YT/JcM2TbioVhuYqZRC8az3nTKOyn3GBMRVpaTj5zqM=;
 b=dGsOK8rYKIwOx2Jjd+1nWmNExCladvyfVT76AirmCHDRCuTWPjf+eC/DrbJvQrp8k9nAQg//6kxjs1yGBLx6SU17gYKlpOedJAnUDTT7bNK8rMGkj1k/Ff+Y3TPO40PQf6L/SLmlJP+aeE2FhtoX0XASJS2gU4X1KwBYhTmKDdg91Ny4a/uNbndem1xGD3Sn50rLHt/HyttZyrSdTEsDfAkn6QqS1Wx/C9bhMMAHIR+5DnTgiuBtdKn/6FBT3NnxNtmxaOdJ58c/YDryV6jHamxzWWwwGCXpqI7RBp1ydXCJ6rrPjUznTXtv43+4USasDZGUsbGOH8TAz2RGcsg+Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB5969.namprd11.prod.outlook.com (2603:10b6:8:5c::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.24; Tue, 22 Aug 2023 14:02:20 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 14:02:19 +0000
Date: Tue, 22 Aug 2023 07:02:17 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <3tylii4hqgc3eorcmcbrh2cr62xycyahbz6sllk4fvjydkkz5m@cnehupokqdum>
References: <20230821234322.758689-3-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230821234322.758689-3-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR03CA0271.namprd03.prod.outlook.com
 (2603:10b6:303:b5::6) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB5969:EE_
X-MS-Office365-Filtering-Correlation-Id: 116b8078-acf8-4900-933f-08dba3186650
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wweyMpgTg1HZeHOExW7zplaeQsjz0UMv53NQN3igkKy+JyihZCsBvyWBhvdqPoSfc2gN+stizlbTGNgDbh4FDYIEZobcvzdM6dhOfBQ5DxaYpCD5KmoCBJH7KHj/+j9Yy4qmuXt6LdDU7VSfKKVFNNkcw6DLEvEAr6c8Xg0fD0t3tX/uRpfsp+qMuDXaVxC7cm5ZSBxlaXJ622Ewb2xvr1UQeLhqGEv0jQebH6qekNoC/7rI7pxVUENU9YHQ4D2gFAgPSUQ44z1K30Ts2YybHG+Z1kLp3I6gu245v1LGF/1ih/JVbRknlJEM9qSv+PoeiqsuFYlOrGTPfIpayOU34WbdR90SM4JWg4uaH9Cy8VTBkjT5E5UY/C0lw8J0FIZTbD2cGD6wB/Y795X1OTVv3JGR2erNwY8IkjZRJxQ5JN14ga43ILtSQj8bSaWf+5DkxPDZk6+rvITznTspX+brDJdjaaKV1ANlM+wtt8QAsqhoQh7Bq9YCC+c7gzQHdvB/NjZt8b9EC2q3PKjBdsN0MsRGqedHmo779/D1BYiLY9Y/BAlT9q/88mc4q4+rKNvXNA+vdzpmE5S3vXXpn31gJHmyGuvAr3JJSxAQUoCcjhQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(136003)(376002)(39860400002)(346002)(366004)(1800799009)(186009)(451199024)(66476007)(66556008)(6512007)(6636002)(316002)(66946007)(9686003)(82960400001)(8676002)(8936002)(6862004)(4326008)(33716001)(41300700001)(478600001)(38100700002)(6486002)(6506007)(83380400001)(2906002)(86362001)(5660300002)(26005)(27246005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uD3FB13iCRTcZLQ8R+vJ6Tq7IKY0+2LUBRm5JDytHiAE6rnJSkL20jPbNC1N?=
 =?us-ascii?Q?l/883AfP+plrq6WsPjWeTNQcKQlr2fGoz3R+mujUS8vLBQ7AY73+2ZiTNNaa?=
 =?us-ascii?Q?NkBkXmocVW+irhY9bDCHLfIsBzjIsD1ScVc52RfBc41iH4lcf/VI26SI6NKg?=
 =?us-ascii?Q?/bK2COhAaFe05i9SJNPmo+0wfcgZMOsruyzWnwSfOOQ0EoW3A5HrH6J/K+KP?=
 =?us-ascii?Q?fyLTPNOVCEtvFhtfAuSzfRwRyarrj94SmpniU5TwxB6NQbFRiklo/ruvvVfB?=
 =?us-ascii?Q?K2rS6waPMBWAIcYez7cwcZ+RpHcIPq3bIVQRlJ2McDFG8gwBS0uvBXxVNJiZ?=
 =?us-ascii?Q?0nYYdCtdH+dOoMz7ry3ZVFRY4/siO4kr4+VyvJjoonYlXPvIzSH3+myB1y2I?=
 =?us-ascii?Q?NkeCo6eCFXxAv5vUsfmlueDUdGa5sPeVdlR4wFE9M5OBBJ2pXOxKfOiTKs3q?=
 =?us-ascii?Q?7ekD+8T9BWayBpzlkSlNpJDRaeskc/HG3KFbEDbz7OuUb6u57a3zDbumafum?=
 =?us-ascii?Q?6tRmgFGDqgBAY3r7OfRQGDLj2FsjZgX8QMBfn6yH+qagndqIJmIKwY01Om7D?=
 =?us-ascii?Q?exBBXZ4qj95N6104JF5dvIL9sj54AaTJlmITOqLjJLdhRS2y0ZnNb9tLAzs1?=
 =?us-ascii?Q?B8pHDHkanb/saRoQ3UkjhAf/2/Lhp9SWQ/3Ri479fy4fEUqb/PGd+BYDZHpj?=
 =?us-ascii?Q?LAm2Q4IkhNmdHWB+4Vdm3Bu5dWXWTmToA+MjyFxr4yl+Aw2ZpDGzpAmcb1jL?=
 =?us-ascii?Q?9EVJVud4QIIGr/RFfhez4kRv/b2y36mjbc+WsYo02OJZnDhIYCyoxrqLJyOW?=
 =?us-ascii?Q?1AttNuQ0BUJ9KDukxe+RaOqtbO7fMTwWCjxf0o8cdbmcuolIsZ2GcQNDEv5m?=
 =?us-ascii?Q?XE6DQ0vOie5LjlH5QUY7cqw03kehKtWZGRKf9la5NnONFrFiUICO9FQ+NuOL?=
 =?us-ascii?Q?bCO5qJNlrZmDUwt+lEsjD0Zh+5VTROvV6zj0A+vYPq0jH3Sj0Au99KZFhBJ9?=
 =?us-ascii?Q?UwtzJDhZHhO3wuFHyD1R2y9Dnf/hSIzTNvOgcVnWmnhkbtKZ9aWtoh7KLm9v?=
 =?us-ascii?Q?JEOfTLmwM+FMnTeVGCZnllRmfBdjRzTvO0/M7jWgyWJCwZk2G0hOTdds4gXW?=
 =?us-ascii?Q?e3N3J/dPyjkuE1N5OtsYxpkG7R1KQfgla1RrrlwEkNYFrCbzPL9nVfd+/EMz?=
 =?us-ascii?Q?jPb5gN6KqAnEUupCTQniESJ6rdaCO9ujGK5LLmgNmzXLpgINM35sd1RZXLTO?=
 =?us-ascii?Q?RhSZFinrcl0Vro9jDOb1r/73GzunkMwwGEdXXNh7kYEsv4ATTUUB6EWpmAqa?=
 =?us-ascii?Q?TxczBsRMsbJSP3WoeMB/QP1mh9q6wZAlx8QB3sav9I50xFhrdZgKQyIoGE5e?=
 =?us-ascii?Q?8iHekfsB3oso38NwTn1eOkiUCujykmI0aLBheUPf0FgAfQlQxXz5lnNz/bmf?=
 =?us-ascii?Q?P2ucu2E8Jp3CNcGEuxa9pcrE996mD4g0aAmcmfaJr4ANc1VKHNZ4z+Kbmf7/?=
 =?us-ascii?Q?GNg7ag+riuEEZw7lqE6KxjduD4yM89nTWBxhavUqG+z57Eq7CWKpOr6Fqw0C?=
 =?us-ascii?Q?CjWkxGoe7GimzQ/o0eyGEI47ZCHY4u4oUamOtvz34OxXN1csHImxQay2O1/O?=
 =?us-ascii?Q?fQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 116b8078-acf8-4900-933f-08dba3186650
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 14:02:19.7773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: El1+ATpB9OH2tXGbsWJ7T1eThHUaUbrPKFvi+doGLt5uRG84OEyB9D3lPHo4OCGfBeMZSFIPGQV6bfMKnr6dg6QOBm7A+AanLs9nqJE8cTQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5969
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Avoid 64-bit register reads
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

On Mon, Aug 21, 2023 at 04:43:23PM -0700, Matt Roper wrote:
>Intel hardware officially only supports GTTMMADR register accesses of
>32-bits or less (although 64-bit accesses to device memory and PTEs in
>the GSM are fine).  Even though we do usually seem to get back
>reasonable values when performing readq() operations on registers in
>BAR0, we shouldn't rely on this violation of the spec working
>consistently.  It's likely that even when we do get proper register
>values back the hardware is internally satisfying the request via a
>non-atomic sequence of two 32-bit reads, which can be problematic for
>timestamps and counters if rollover of the lower bits is not considered.
>
>Replace xe_mmio_read64() with xe_mmio_read64_2x32() that implements
>64-bit register reads as two 32-bit reads and attempts to ensure that
>the upper dword has stabilized to avoid problematic rollovers for
>counter and timestamp registers.
>
>Bspec: 60027
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_mmio.c           |  6 ++---
> drivers/gpu/drm/xe/xe_mmio.h           | 37 +++++++++++++++++++++++---
> drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c |  6 ++---
> 3 files changed, 39 insertions(+), 10 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>index bb6823db14d4..932aa4ca59c8 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -228,7 +228,7 @@ int xe_mmio_tile_vram_size(struct xe_tile *tile, u64 *vram_size, u64 *tile_size,
> 		reg = xe_gt_mcr_unicast_read_any(gt, XEHP_FLAT_CCS_BASE_ADDR);
> 		offset = (u64)REG_FIELD_GET(GENMASK(31, 8), reg) * SZ_64K;
> 	} else {
>-		offset = xe_mmio_read64(gt, GSMBASE);
>+		offset = xe_mmio_read64_2x32(gt, GSMBASE);
> 	}
>
> 	/* remove the tile offset so we have just the available size */
>@@ -326,7 +326,7 @@ static void xe_mmio_probe_tiles(struct xe_device *xe)
> 	if (xe->info.tile_count == 1)
> 		return;
>
>-	mtcfg = xe_mmio_read64(gt, XEHP_MTCFG_ADDR);
>+	mtcfg = xe_mmio_read64_2x32(gt, XEHP_MTCFG_ADDR);
> 	adj_tile_count = xe->info.tile_count =
> 		REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
>
>@@ -509,7 +509,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
> 			args->value = xe_mmio_read32(gt, reg);
> 			break;
> 		case DRM_XE_MMIO_64BIT:
>-			args->value = xe_mmio_read64(gt, reg);
>+			args->value = xe_mmio_read64_2x32(gt, reg);
> 			break;
> 		default:
> 			drm_dbg(&xe->drm, "Invalid MMIO bit size");
>diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>index d24badca8677..892e96e50463 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.h
>+++ b/drivers/gpu/drm/xe/xe_mmio.h
>@@ -11,6 +11,7 @@
>
> #include "regs/xe_reg_defs.h"
> #include "xe_device_types.h"
>+#include "xe_gt_printk.h"
> #include "xe_gt_types.h"
>
> struct drm_device;
>@@ -85,14 +86,42 @@ static inline void xe_mmio_write64(struct xe_gt *gt,
> 	writeq(val, tile->mmio.regs + reg.addr);
> }
>
>-static inline u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg)
>+/*
>+ * Intel hardware officially only supports GTTMMADR register reads of 32 bits
>+ * or smaller.  Although we often seem to get reasonable values back from a
>+ * readq of a register address, we shouldn't rely on this violation of the
>+ * spec.  Furthermore, when reading registers that may be changing (such as
>+ * counters), the hardware may not perform the read atomically, leading to
>+ * problems if the read happens while the lower dword is rolling over.
>+ *
>+ * Implement 64-bit register reads as a pair of 32-bit reads and ensure the
>+ * upper dword has stabilized before returning a value.

As an internal interface, should probably be kernel-doc? Another thing
to call out is that this function can't be used if there are side
effects on read.

Also, function seems a bit too big to be on the header.

$ ./scripts/bloat-o-meter build64/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.o.old build64/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.o
add/remove: 0/0 grow/shrink: 1/0 up/down: 514/0 (514)
Function                                     old     new   delta
xe_ttm_stolen_mgr_init                      1155    1669    +514
Total: Before=2340, After=2854, chg +21.97%

Let's move it to xe_mmio.c?


Aside from that, implementation and justification seem goo


	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi

>+ */
>+static inline u64 xe_mmio_read64_2x32(struct xe_gt *gt, struct xe_reg reg)
> {
>-	struct xe_tile *tile = gt_to_tile(gt);
>+	struct xe_reg reg_udw = { .addr = reg.addr + 0x4 };
>+	u32 ldw, udw, oldudw, retries;
>
>-	if (reg.addr < gt->mmio.adj_limit)
>+	if (reg.addr < gt->mmio.adj_limit) {
> 		reg.addr += gt->mmio.adj_offset;
>+		reg_udw.addr += gt->mmio.adj_offset;
>+	}
>
>-	return readq(tile->mmio.regs + reg.addr);
>+	oldudw = xe_mmio_read32(gt, reg_udw);
>+	for (retries = 5; retries; --retries) {
>+		ldw = xe_mmio_read32(gt, reg);
>+		udw = xe_mmio_read32(gt, reg_udw);
>+
>+		if (udw == oldudw)
>+			break;
>+
>+		oldudw = udw;
>+	}
>+
>+	xe_gt_WARN(gt, retries == 0,
>+		   "64-bit read of %#x did not stabilize\n", reg.addr);
>+
>+	return (u64)udw << 32 | ldw;
> }
>
> static inline int xe_mmio_write32_and_verify(struct xe_gt *gt,
>diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>index be0a25e23929..6ba6b1b7f34b 100644
>--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>@@ -67,7 +67,7 @@ static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
> 	}
>
> 	/* Use DSM base address instead for stolen memory */
>-	mgr->stolen_base = (xe_mmio_read64(mmio, DSMBASE) & BDSM_MASK) - tile_offset;
>+	mgr->stolen_base = (xe_mmio_read64_2x32(mmio, DSMBASE) & BDSM_MASK) - tile_offset;
> 	if (drm_WARN_ON(&xe->drm, tile_size < mgr->stolen_base))
> 		return 0;
>
>@@ -126,8 +126,8 @@ static u32 detect_bar2_integrated(struct xe_device *xe, struct xe_ttm_stolen_mgr
>
> 	/* Carve out the top of DSM as it contains the reserved WOPCM region */
> 	wopcm_size = REG_FIELD_GET64(WOPCM_SIZE_MASK,
>-				     xe_mmio_read64(xe_root_mmio_gt(xe),
>-						    STOLEN_RESERVED));
>+				     xe_mmio_read64_2x32(xe_root_mmio_gt(xe),
>+							 STOLEN_RESERVED));
> 	stolen_size -= (1U << wopcm_size) * SZ_1M;
>
> 	if (drm_WARN_ON(&xe->drm, stolen_size + SZ_8M > pci_resource_len(pdev, 2)))
>-- 
>2.41.0
>
