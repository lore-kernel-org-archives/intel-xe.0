Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417BDC77B61
	for <intel-xe@archiver.kernel.org>; Thu, 27 Apr 2023 20:59:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F03310E12E;
	Thu, 27 Apr 2023 20:59:55 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4DD410E12E
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Apr 2023 20:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682629193; x=1714165193;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=U2p33gle4O9l1ehtFCt/izDyWKiw0mtbp31CCMX8eWc=;
 b=Bkog9RuxaQ7jGRiuZdhvZqwyUtR4AsLYAzkKv4NTAOnNsBJjkW3m86Wx
 zj3aPpB9JspQDmC4bcbTipbWnQbXfonCxpFvtQ99lAvcgsaKEGRulhpUo
 2W4epvkbsne1ClCanBUhpQUkxl71/TdRmWcSO2meXkSYJ9Bnu0efGB9U5
 POp3Va/ZLKF1WA2cs6PEyoHNsJfropfaFX2IFHC1S7U9NkmIyU8qMQwMr
 ni9/amyxl/8KgnMdOc1FBjFOLNB+Wa7E2mm8wqN/ifEls7CPtucQORmzv
 nddxtYqLSSmpw6y5q9whSlfaoAKhIXwQdaEO4JqRWc6s2vP5QTxqQeM1z A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="433850146"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; d="scan'208";a="433850146"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 13:59:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="759311518"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; d="scan'208";a="759311518"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 27 Apr 2023 13:59:51 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 27 Apr 2023 13:59:51 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 27 Apr 2023 13:59:50 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 27 Apr 2023 13:59:50 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 27 Apr 2023 13:59:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gRBs4rZlNCl01J49x7QvWR7xmNxigAeisT3z1o49yVTbnhpIW/vht8YByWNcBNGDC+uzaJhpPRxbh7GC5EevIHJhgeco/nwJ8KxYIZ+ZL2RCKjTwfnbCfDmtKZExWAeMAjGogQ3jC+35REKQhVtxoZKuWJkh1D4okVEqx6ktMBsWKn3h1T2WMnF2qScstup+wbJeS/pRmbnoFn6crqLu2mjk4OpL7QEUxllxmKjL3C1XP0N4g+H0VpG1FXGY4hGM41J3RiVIpnxvzKHIWDx8HK7pzgWSccIudTCrGfXj+LYT4plJooTBpeWeVSfmu+/UHK5dUs90N5WKsyDpd5/Z4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bn8xyKkk511rWXWU0OASvEcOaLfDQTwsmocgCmeuRRM=;
 b=L7c9bda11YYpsNTgbo1OSE65dNFKYVsn5yCLLtIOiPYwx45nx3BWx+xZYuVVjbIMYXqJdl2u5CvdQCCDpFmBBktoZxPkhb+oKmYmgO4krGKGUGATUPy72Oue2MRwhDdpcYmrs0G9YZWEse0GiOatHqdPwNl+gOTzqAQE9horUgJpwzy6EjMqq7MH+UnQuY+f+/0AsQgR/8lsp5l9k9eG2kSic+a4Bnp4jwVEfx5bM1hqtTBme4mLIpORf+ZIxyGNl/TrW2WcdnLQ57IleBJwj5z8HlRyy62uQh5bcuJnoVa5J9ArPP8C/a5Ny+oF3b2fo3R6mMJE7hEguwxsaGSLTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA0PR11MB4543.namprd11.prod.outlook.com (2603:10b6:806:99::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Thu, 27 Apr
 2023 20:59:38 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6340.022; Thu, 27 Apr 2023
 20:59:37 +0000
Date: Thu, 27 Apr 2023 13:59:35 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Message-ID: <6tt6hywifiyllgyuxa5k4csyuxh6sflenlzdr53t37ghbjpgnh@fhx63zqahrkv>
X-Patchwork-Hint: comment
References: <20230427195213.3958260-1-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230427195213.3958260-1-michael.j.ruhl@intel.com>
X-ClientProxiedBy: BY5PR04CA0013.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA0PR11MB4543:EE_
X-MS-Office365-Filtering-Correlation-Id: fc67ae05-1197-4d44-6fe7-08db47624fc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O6n93XyDZgSlBMkwa1z3fARQQl0o2MZuDGBfSor+JtBzftP7xlq36QTwseO0vrJ4VCHPAMyHwd+DQkXPbewjZQhLD6LfU5PjouwWGA0B6zjvzsiFPgK3+R/8eeotidd3Apip6gqiDX4WBsUqpYcsuVBl23QK2CdanQIcgpkJgMJKUcJ8Hm8TK4tMzm2fkt7GGHuN0vGqnpU8OI/iojLvoUB7puIM8hA63IY416Ut49DPKgZqP/dERz8cK68XYk3sYksMnRQMuhREIhus/GUXoyuj7W9Dul2ie06kjfXNQiaj1FIFPrdzLwGUrBoKHVzyxuSpO7Sy5LucwtueVVCZvj4rYT2MX7Ap5wTrhFRwbIGnamwYCPNb5VWgIp/2us7o6hXn5Y9gUYVBk+khwEjGaNJbcILG0Yb/8ZDaAlmfpEtMNKm+aCAPvItBLyajFQbkA6RXCed8/mCw6jinM9yaZt13RKVR9tQYTwCB7Ne2UxI1KTFTd07w9deMhSIoeYnsJmabBThDWNiHoq3l4OGAxvZ6xeeLyVBu0Qko5c/CpE46mRtzSyhOQAArHHxZF/wo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(346002)(366004)(396003)(39860400002)(376002)(451199021)(2906002)(316002)(33716001)(38100700002)(83380400001)(30864003)(82960400001)(107886003)(6862004)(5660300002)(8936002)(8676002)(6506007)(478600001)(9686003)(26005)(6512007)(86362001)(41300700001)(186003)(6486002)(66476007)(66556008)(4326008)(6636002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?GVN9hy9UwGTmKQwI0So8msTrPmdOkXsF2+cdTKGPmwi/7DVBzp/4nJPLmj?=
 =?iso-8859-1?Q?mpLGmghtJ2vgUOnPJfB6Z5XNCAPL1mdcr0/NNMF9DMb/LfRmqFyMNlLIhy?=
 =?iso-8859-1?Q?nnkU9IeT7p1ALNTlAYMjNihk4v7Ns1q7Ws7g6sQE5m1fNN3tKlPiVsGEic?=
 =?iso-8859-1?Q?ENwfQJ43r55CgndXwlePou4B1wZp/JwjqsNCeGXkxWnP4ZzpksDJI2emwq?=
 =?iso-8859-1?Q?PT6UG4P+vtmrnhW3EyWotl20VGRT9CPkh07IJhRXBTk6Dmd5bOQ4Wqwd6E?=
 =?iso-8859-1?Q?v0WkdngsHbzxD3IHid/VutmMZ3MMYmxewzRYZRIUJNLbyBI+OG2f9shIGD?=
 =?iso-8859-1?Q?jW4LhxV3F+e40i6d4IgRlrUcwsOBNEdSe52K1foZCC15lOzu6Dpesy/5rx?=
 =?iso-8859-1?Q?S4XzZFz2JxUZhur7i9J6cbZMbaJrbhqVSs92/ebR4vGbPuPqX9fUzP2skF?=
 =?iso-8859-1?Q?GGM2c7WDQUY25ZAJkvgg7z4o3IYD6vjk6Yk7BPbcMX29VtJny4GV5XHW2P?=
 =?iso-8859-1?Q?9KoeBttFpTUguh5ecaGfwe8In0Ug6mcb9ML4LyrENXkiCE6rmB8v5Im7Ma?=
 =?iso-8859-1?Q?jw2IypWnzf0WGK9u3MJLBa4kaYHQ4/oI8jOUvDj6qEwFt23yMy+X+lqWul?=
 =?iso-8859-1?Q?9hU2PHoynYcriUufH4DrATMe65LwUyYgTkdRzxH4QLBuc7QUkwyDzf2X1V?=
 =?iso-8859-1?Q?4qUb6DuUWnarsU0BWFDw3/xm+p64Do0iq/zBpv9lZdF0QXFR9dt2lsfRuG?=
 =?iso-8859-1?Q?fVCMlWiOpiGqjiRb9YVZw/7GVF9/8ztamVGlX6Hw1vfMMvV71AY1MnKm+s?=
 =?iso-8859-1?Q?AQVT9uurwIo2hvIxdvmIIgY15bbglJkbSHmY9onjlpbFpHFDrojPcpbdqy?=
 =?iso-8859-1?Q?W2FfZiG/IebrRnBh4bw1wbJ8je/oeydXzEksqqEWUoGdjNYqzNgTO8vV5i?=
 =?iso-8859-1?Q?nNhbfB0JmF3oFGCUdNJQfPE7iz+MGp0tztI7zyd1jvTXB7wuIPPtqRwsVr?=
 =?iso-8859-1?Q?vSmCfA/pUG5781LOqFu2JuD9+vwE8lZ9SBneVdZ3QR7aWPPOt+UthjTZXS?=
 =?iso-8859-1?Q?7kIZL0S/CATLgNcF7tmOfcR3mkou5IZ/UoeuyD3ZgZZXYMAtBrZ6dmo+VT?=
 =?iso-8859-1?Q?Xwjh/vgmWfjLFAqqtiRsa3qyf/Z+Nlg5YdyzkV4POB26iVzIePZYxDk4/w?=
 =?iso-8859-1?Q?INsJq9RyuU2x8vHh035nqeQ4/5ck9rgWh3Hw6bFu2E/zZWq4xzwX5oXWU8?=
 =?iso-8859-1?Q?M+bHJxuqnosqVXsAd13uYiM8J+J9CygAUyyQo34rEHE1nFDcfXjGjvZEeF?=
 =?iso-8859-1?Q?c4bkYwKbZt/9ZMFqpZZmuKDXuyS3lK78da2TAPdZ0tfW9xbnG+KkSvkAQS?=
 =?iso-8859-1?Q?3NpD6QM5p1NJruz0NU+h0FZ09kBgNUQiByMBjo92ZM1RoCL7jcKqa3FFci?=
 =?iso-8859-1?Q?lNGQgnLe+TE/gCZkztJV8S7Ny6FG6gBRc60rOyo7IASEZjv8ZaTkZlknAq?=
 =?iso-8859-1?Q?8syoc0Iz42dBeS4VC8GsYUssbXOUBr8Z4Xz2H5WZzVzgADiF9J8HmlACAm?=
 =?iso-8859-1?Q?IiFVz+nvlhNyW6Fe/iFhGDynQUzntGyoo956pVbHbKDc/hwvOLOIdMCRpp?=
 =?iso-8859-1?Q?kcOIdnaUxDTXTmpPlfBSfPrKenGp6m1Kir2y0dx/kVD5fB0aNslbo3rg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc67ae05-1197-4d44-6fe7-08db47624fc1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2023 20:59:37.6832 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HhKrnk+r+ID9XMFqOtbKrNfG/li7vUAN+yWyNuAUwgLMhIS20eTpBd+1pfNz1CWyB9dfiz/7T+1tLC8gSdlvxXZKd/Xc7mrSv3uBzSannBA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4543
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe: Simplify rebar sizing
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
Cc: himal.prasad.ghimiray@intel.com, intel-xe@lists.freedesktop.org,
 matthew.auld@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Apr 27, 2023 at 03:52:11PM -0400, Michael J. Ruhl wrote:
>"Right sizing" the PCI BAR is not necessary.  If rebar is needed
>size to the maximum available.
>
>Allow for specific sizing as well.

Instead of bullets, maybe convert to freeform text? Here it took me a
while to figure out this info doens't contradict the first one about
right sizing. Suggestion: "the behavior for force_vram_bar_size is still
preserved though, allowing to test with arbitrary BAR values".

>
>Update associated code for consistency.
>
>Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>---
> drivers/gpu/drm/xe/xe_device_types.h   |  12 +--
> drivers/gpu/drm/xe/xe_migrate.c        |   2 +-
> drivers/gpu/drm/xe/xe_mmio.c           | 130 +++++++++++--------------
> drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c |  16 +--
> 4 files changed, 69 insertions(+), 91 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 1cb404e48aaa..24dc5d2e9e05 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -194,14 +194,14 @@ struct xe_device {
> 			 * @io_size: IO size of VRAM.
> 			 *
> 			 * This represents how much of VRAM we can access via
>-			 * the CPU through the VRAM BAR. This can be smaller
>-			 * than @size, in which case only part of VRAM is CPU
>-			 * accessible (typically the first 256M). This
>-			 * configuration is known as small-bar.
>+			 * the CPU through the VRAM BAR.

the via + through here read odd. Maybe something like:

			* This represents how much of VRAM the CPU can access via
			* the VRAM BAR. ....

>+			 * On systems that do not support large BAR IO space,
>+			 * this can be smaller than the actual memory size, in
>+			 * which case only part of VRAM is CPU accessible
>+			 * (typically the first 256M).  This configuration is
>+			 * known as small-bar.
> 			 */
> 			resource_size_t io_size;
>-			/** @size: Total size of VRAM */
>-			resource_size_t size;
> 			/** @mapping: pointer to VRAM mappable space */
> 			void *__iomem mapping;
> 		} vram;
>diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>index f40f47ccb76f..a1d507db0098 100644
>--- a/drivers/gpu/drm/xe/xe_migrate.c
>+++ b/drivers/gpu/drm/xe/xe_migrate.c
>@@ -270,7 +270,7 @@ static int xe_migrate_prepare_vm(struct xe_gt *gt, struct xe_migrate *m,
> 		 * Use 1GB pages, it shouldn't matter the physical amount of
> 		 * vram is less, when we don't access it.
> 		 */
>-		for (pos = 0; pos < xe->mem.vram.size; pos += SZ_1G, ofs += 8)
>+		for (pos = 0; pos < xe->mem.vram.io_size; pos += SZ_1G, ofs += 8)
> 			xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
> 	}
>
>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>index 5536f84682c0..6c1591a4f43e 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -1,6 +1,6 @@
> // SPDX-License-Identifier: MIT
> /*
>- * Copyright © 2021 Intel Corporation
>+ * Copyright © 2021-2023 Intel Corporation
>  */
>
> #include "xe_mmio.h"
>@@ -21,6 +21,8 @@
> #define TILE_COUNT		REG_GENMASK(15, 8)
> #define GEN12_LMEM_BAR		2
>
>+#define BAR_SIZE_SHIFT 20


I had to look at include/linux/pci.h:pci_rebar_bytes_to_size()
to understand what this is about. Not a requirement for this patch, but
since it's something from the resizable BAR specification, maybe it
could deserve a define in include/linux/pci.h rather than hardcoding
in the drivers?

>+
> static int xe_set_dma_info(struct xe_device *xe)
> {
> 	unsigned int mask_size = xe->info.dma_mask_size;
>@@ -61,50 +63,65 @@ _resize_bar(struct xe_device *xe, int resno, resource_size_t size)
> 	if (ret) {
> 		drm_info(&xe->drm, "Failed to resize BAR%d to %dM (%pe). Consider enabling 'Resizable BAR' support in your BIOS\n",
> 			 resno, 1 << bar_size, ERR_PTR(ret));
>-		return -1;
>+		return ret;
> 	}
>
> 	drm_info(&xe->drm, "BAR%d resized to %dM\n", resno, 1 << bar_size);
>-	return 1;
>+	return ret;
> }
>
>-static int xe_resize_vram_bar(struct xe_device *xe, resource_size_t vram_size)
>+/*
>+ * if force_vram_bar_size is set, attempt to set to the requested size
>+ * else set to maximum possible size
>+ */
>+static int xe_resize_vram_bar(struct xe_device *xe)
> {
>+	u64 force_vram_bar_size = xe_force_vram_bar_size;
> 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> 	struct pci_bus *root = pdev->bus;
>-	struct resource *root_res;
>-	resource_size_t rebar_size;
> 	resource_size_t current_size;
>+	resource_size_t rebar_size;
>+	struct resource *root_res;
>+	u32 bar_sizes;
> 	u32 pci_cmd;
> 	int i;
> 	int ret;
>-	u64 force_vram_bar_size = xe_force_vram_bar_size;
>
>-	current_size = roundup_pow_of_two(pci_resource_len(pdev, GEN12_LMEM_BAR));
>+	/* gather some relevant info */
>+	current_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
>+	bar_sizes = pci_rebar_get_possible_sizes(pdev, GEN12_LMEM_BAR);


presumably this already has the >> 20 to return it in "BAR size"
quantity.

>+
>+	if (!bar_sizes)
>+		return 0;
>
>+	/* set to a specific size? */
> 	if (force_vram_bar_size) {
>-		u32 bar_sizes;
>+		u32 bar_size;
>
> 		rebar_size = force_vram_bar_size * (resource_size_t)SZ_1M;
>-		bar_sizes = pci_rebar_get_possible_sizes(pdev, GEN12_LMEM_BAR);
>
>-		if (rebar_size == current_size)
>-			return 0;
>+		bar_size = bar_sizes & BIT(pci_rebar_bytes_to_size(rebar_size));

but then why you add BIT() here?

Supposing bar_sizes is 0x3 (i.e. valid bar sizes in bytes are 2097152
and 4194304) and rebar_size is 2097152, shouldn't this be

		bar_size = bar_sizes & pci_rebar_bytes_to_size(rebar_size);
?

/me confused. Maybe rename the variables that are measurable in bytes to
avoid some of the confusion?


Lucas De Marchi

>
>-		if (!(bar_sizes & BIT(pci_rebar_bytes_to_size(rebar_size))) ||
>-		    rebar_size >= roundup_pow_of_two(vram_size)) {
>-			rebar_size = vram_size;
>+		if (!bar_size) {
> 			drm_info(&xe->drm,
>-				 "Given bar size is not within supported size, setting it to default: %lluMiB\n",
>-				 (u64)vram_size >> 20);
>+				 "Requested size: 0x%llx is not supported by rebar sizes: 0x%x. Leaving default: 0x%llx\n",
>+				 (u64)rebar_size >> 2, bar_sizes, (u64)current_size >> 20);
>+			return 0;
> 		}
>+
>+		rebar_size = 1ULL << (bar_size + BAR_SIZE_SHIFT);
>+
>+		if (rebar_size == current_size)
>+			return 0;
> 	} else {
>-		rebar_size = current_size;
>+		rebar_size = 1ULL << (__fls(bar_sizes) + BAR_SIZE_SHIFT);
>
>-		if (rebar_size != roundup_pow_of_two(vram_size))
>-			rebar_size = vram_size;
>-		else
>+		/* only resize if larger than current */
>+		if (rebar_size <= current_size) {
>+			drm_info(&xe->drm, "Rebar size: 0x%llx vs. actual size: 0x%llx\n",
>+				 rebar_size, current_size);
> 			return 0;
>+		}
> 	}
>
> 	drm_info(&xe->drm, "Resizing bar from %lluMiB -> %lluMiB\n",
>@@ -148,49 +165,39 @@ static bool xe_pci_resource_valid(struct pci_dev *pdev, int bar)
> 	return true;
> }
>
>-int xe_mmio_total_vram_size(struct xe_device *xe, u64 *vram_size, u64 *usable_size)
>+int xe_determine_lmem_bar_size(struct xe_device *xe)
> {
>-	struct xe_gt *gt = xe_device_get_gt(xe, 0);
> 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> 	int err;
>-	u32 reg;
>
>-	if (!xe->info.has_flat_ccs)  {
>-		*vram_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
>-		if (usable_size)
>-			*usable_size = min(*vram_size, xe_mmio_read64(gt, GEN12_GSMBASE.reg));
>-		return 0;
>+	if (!xe_pci_resource_valid(pdev, GEN12_LMEM_BAR)) {
>+		drm_err(&xe->drm, "pci resource is not valid\n");
>+		return -ENXIO;
> 	}
>
>-	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>+	err = xe_resize_vram_bar(xe);
> 	if (err)
> 		return err;
>
>-	reg = xe_gt_mcr_unicast_read_any(gt, XEHP_TILE0_ADDR_RANGE);
>-	*vram_size = (u64)REG_FIELD_GET(GENMASK(14, 8), reg) * SZ_1G;
>-	if (usable_size) {
>-		reg = xe_gt_mcr_unicast_read_any(gt, XEHP_FLAT_CCS_BASE_ADDR);
>-		*usable_size = (u64)REG_FIELD_GET(GENMASK(31, 8), reg) * SZ_64K;
>-		drm_info(&xe->drm, "vram_size: 0x%llx usable_size: 0x%llx\n",
>-			 *vram_size, *usable_size);
>-	}
>+	xe->mem.vram.io_start = pci_resource_start(pdev, GEN12_LMEM_BAR);
>+	xe->mem.vram.io_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
>+	if (!xe->mem.vram.io_size)
>+		return -EIO;
>+
>+	/* set up a map to the total memory area. */
>+	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.io_size);
>
>-	return xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>+	return 0;
> }
>
> int xe_mmio_probe_vram(struct xe_device *xe)
> {
>-	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> 	struct xe_gt *gt;
>-	u8 id;
>-	u64 vram_size;
>-	u64 original_size;
>-	u64 usable_size;
> 	int err;
>+	u8 id;
>
> 	if (!IS_DGFX(xe)) {
> 		xe->mem.vram.mapping = 0;
>-		xe->mem.vram.size = 0;
> 		xe->mem.vram.io_start = 0;
> 		xe->mem.vram.io_size = 0;
>
>@@ -203,35 +210,12 @@ int xe_mmio_probe_vram(struct xe_device *xe)
> 		return 0;
> 	}
>
>-	if (!xe_pci_resource_valid(pdev, GEN12_LMEM_BAR)) {
>-		drm_err(&xe->drm, "pci resource is not valid\n");
>-		return -ENXIO;
>-	}
>-
>-	gt = xe_device_get_gt(xe, 0);
>-	original_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
>-
>-	err = xe_mmio_total_vram_size(xe, &vram_size, &usable_size);
>+	err = xe_determine_lmem_bar_size(xe);
> 	if (err)
> 		return err;
>
>-	xe_resize_vram_bar(xe, vram_size);
>-	xe->mem.vram.io_start = pci_resource_start(pdev, GEN12_LMEM_BAR);
>-	xe->mem.vram.io_size = min(usable_size,
>-				   pci_resource_len(pdev, GEN12_LMEM_BAR));
>-	xe->mem.vram.size = xe->mem.vram.io_size;
>-
>-	if (!xe->mem.vram.size)
>-		return -EIO;
>-
>-	if (usable_size > xe->mem.vram.io_size)
>-		drm_warn(&xe->drm, "Restricting VRAM size to PCI resource size (%lluMiB->%lluMiB)\n",
>-			 (u64)usable_size >> 20, (u64)xe->mem.vram.io_size >> 20);
>-
>-	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.io_size);
>-	xe->mem.vram.size = min_t(u64, xe->mem.vram.size, usable_size);
>-
>-	drm_info(&xe->drm, "TOTAL VRAM: %pa, %pa\n", &xe->mem.vram.io_start, &xe->mem.vram.size);
>+	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
>+		 &xe->mem.vram.io_size);
>
> 	/* FIXME: Assuming equally partitioned VRAM, incorrect */
> 	if (xe->info.tile_count > 1) {
>@@ -244,7 +228,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>
> 		XE_BUG_ON(!adj_tile_count);
>
>-		size = xe->mem.vram.size / adj_tile_count;
>+		size = xe->mem.vram.io_size / adj_tile_count;
> 		io_start = xe->mem.vram.io_start;
> 		io_size = xe->mem.vram.io_size;
>
>@@ -277,7 +261,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
> 				 &gt->mem.vram.size);
> 		}
> 	} else {
>-		gt->mem.vram.size = xe->mem.vram.size;
>+		gt->mem.vram.size = xe->mem.vram.io_size;
> 		gt->mem.vram.io_start = xe->mem.vram.io_start;
> 		gt->mem.vram.io_size = xe->mem.vram.io_size;
> 		gt->mem.vram.mapping = xe->mem.vram.mapping;
>diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>index 31887fec1073..9136c035db0e 100644
>--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>@@ -53,25 +53,19 @@ bool xe_ttm_stolen_cpu_access_needs_ggtt(struct xe_device *xe)
>
> static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
> {
>-	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>-	struct xe_gt *gt = to_gt(xe);
> 	u64 vram_size, stolen_size;
>-	int err;
>
>-	err = xe_mmio_total_vram_size(xe, &vram_size, NULL);
>-	if (err) {
>-		drm_info(&xe->drm, "Querying total vram size failed\n");
>-		return 0;
>-	}
>+	vram_size = xe->mem.vram.io_size;
>
> 	/* Use DSM base address instead for stolen memory */
>-	mgr->stolen_base = xe_mmio_read64(gt, GEN12_DSMBASE.reg) & GEN12_BDSM_MASK;
>+	mgr->stolen_base = xe_mmio_read64(to_gt(xe), GEN12_DSMBASE.reg) & GEN12_BDSM_MASK;
> 	if (drm_WARN_ON(&xe->drm, vram_size < mgr->stolen_base))
> 		return 0;
>
> 	stolen_size = vram_size - mgr->stolen_base;
>-	if (mgr->stolen_base + stolen_size <= pci_resource_len(pdev, 2))
>-		mgr->io_base = pci_resource_start(pdev, 2) + mgr->stolen_base;
>+
>+	if (mgr->stolen_base + stolen_size <= vram_size)
>+		mgr->io_base = xe->mem.vram.io_start + mgr->stolen_base;
>
> 	/*
> 	 * There may be few KB of platform dependent reserved memory at the end
>-- 
>2.39.2
>
