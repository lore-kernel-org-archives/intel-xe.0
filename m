Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE330C77B7C
	for <intel-xe@archiver.kernel.org>; Mon,  1 May 2023 19:03:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA3F10E2E4;
	Mon,  1 May 2023 19:03:32 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C8F10E2E4
 for <intel-xe@lists.freedesktop.org>; Mon,  1 May 2023 19:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682967810; x=1714503810;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=bF0RkbtkZKvyi5HY5W1MOITMeg2y2lsLbWYS4+vasfA=;
 b=hgyA0/JQzTfR05nqLBqF+79j97tg2WJ8GKsL4REd2T+PFU13HujMNeGR
 yz36tu+tNuNlGx81pI6tTg2Xd0j9dYo0B6gUaFlzsUX9AZurTNIz+faLT
 BJSK1YnEd8VKRirFCDW0ZOegrEYZheabQW50ST5rcS9eObjb+dit5Js3B
 Ap09n+UK/DC5Lhlb4G8X37a0A6+hFcUKuFS8gF1LUPmwraSI7pwIzF0ZB
 l4qyjkuOU1RNF99CmHgJOTwK0Nj7FFaZvjRwnYM2t6WShI5kfcV6FBnRj
 cC9kI7/mY9GXctHYFBYF8NtDj9X3x3XniNviFidBnZaF8ZFyQo6vs+YF+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="347025349"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; d="scan'208";a="347025349"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 12:03:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="673310385"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; d="scan'208";a="673310385"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP; 01 May 2023 12:03:29 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 1 May 2023 12:03:28 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 1 May 2023 12:03:28 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 1 May 2023 12:03:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UEkYe12xGsI8iYhlia710ElYDYL6jkyRYKq7nkJgwrJrYRVybuADvPTgsgXLyQJXFQ9IommtlsjnNeRkYl7s4GNZR9ZIgg9Dd6dmehL6J+KlHc3DdLYb67Sg+a0mVTPFse0bTFm9BGDH398A3q0kOUdCLbsLg21eBCJ1z7qiBVqjrF3n/InrDnR+nRDMrHJQj8agZVwT0r0Y/YV2VqsaHNlH/t178yF1ynWCfBGZjwAHmvXzVGv8j8IujajlfF1hKx/5QlSZkFs3NGcJ9ItbjsZ24ff/0RuHREAfs2lNEuU3bz74+wEA8pyHnLxF78DxNIsK0/AlfsmLU7mDgWCGZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8r3Uy+rg5Sd76U/VZrRS1P/IjYS0gmZ7pvTiuiCoNQ8=;
 b=n/nNb3JApV04zs4ltITYO6DDC9X0Lu+h5yEXR02/v9ZrPdvXXkLbJUXA6ijU8k4eno2eY0CKQMmNK9b233kL6YgAtFw82X11uspOI7KKf8EmINpPrG4joRn5D1F3LtI+OpvoeG9GT6cbNhHF3nOcsm46uZkPDmZK/UPtEtMQRsHqjGRGFUdv4LCJdEC5cWHlfZiKcc/wG2ZPY4AMAHSxdFCPMXDsSOx3r2jEpTpuvLSsy6oyFQHNsQHL5iZTpZ7vycqwmDCLyU8ojBZ+wWIsIbUp1xQpM+eJ2GfUvWWv0rEamEtV60uQJeYEOYNKiHJcrh8DFSmPEOaNnu2kiKcYGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH8PR11MB7094.namprd11.prod.outlook.com (2603:10b6:510:216::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Mon, 1 May
 2023 19:03:24 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6340.030; Mon, 1 May 2023
 19:03:24 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 1 May 2023 15:03:13 -0400
Message-ID: <20230501190314.609261-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501190314.609261-1-rodrigo.vivi@intel.com>
References: <20230501190314.609261-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR11CA0079.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH8PR11MB7094:EE_
X-MS-Office365-Filtering-Correlation-Id: fc339724-f7fb-4d6b-0e1e-08db4a76bcbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QySYFfqRPYoXje0/N0RCZj74x1uJ6zRIqu7ADdPMBb2b063gDPFrwmrQ3ZsuEBvCDqPCn99Ceyf730rrAwHeLdFLJEPlBjgd0fdA6jU2FHnaSNkIWYLDzZWYgEATMOkc1PpK5DaxM/+6BIL2OPciA5F+B8I6N79OEtIYWgr/1WrS3tT7QqpuN4PFi8mVTHiB8x9ErRk1RPGGmz2KDpTZsB6mLqvg7hmTSq8PI1QtW/7VoXPeLjYdPCJdiShS9CmnI80k39lrAIGYBhMRt7FHts5PSFh2lTRZeSZ4SXZ8lxlpD3h3qDtVkmgYY0bDzS31BbNLtt8TgU/uPC+j3xsRpaVzyms5p79at/JVnDERAK9JJQloMHCzu+bYmgro3WSAOQxj5+skbxQFt73peSxBF0RrKVgLzDhENudAN6OfU5yeQQHgp3A0Fv4yry4cW2nZA6CwluXLWhF5uoBTS82ruJN3/clJD0vP9yFiCrDcxM11wd+qLrju1p/VgktVrr5+sjvxrWkBg4yMXUCRX1w9r/wo3zQpN34Lak1XleS4Rjf9KsLcZorP3RXkIIJ7ZyeN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(376002)(39860400002)(136003)(366004)(451199021)(83380400001)(38100700002)(41300700001)(8676002)(2616005)(8936002)(82960400001)(316002)(36756003)(186003)(66556008)(66476007)(66946007)(6916009)(5660300002)(4326008)(1076003)(26005)(6512007)(6506007)(478600001)(86362001)(107886003)(44832011)(2906002)(30864003)(6486002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDBuc2FYQ3QrelBwbGNvWWJMZTZVeWtDb3liVVg0SmpxTGF4WkQrYndtWk92?=
 =?utf-8?B?R3VKVFE5SnpEWitBMkJRci81dmZoZUVZSzE4Z3k0bEQ5SVdkL3R6SWNkOExF?=
 =?utf-8?B?QUJEeFlyNmRLQjI0cmlsMG5INHdnWDNuaEI4WDFOYkMvT3o3UUNDb2Y4TlQ1?=
 =?utf-8?B?VDNaeWtmOHhJcU5QZnB3VW5vNnV4UlRSajFlK05VNW9MZExTUTA2aGI5YVll?=
 =?utf-8?B?L1YzWlBSa3pzeE4yZFlVRi9KR3VZZExPUVpibFZjSmUzb3FuczNFUmFTalFx?=
 =?utf-8?B?bGtGZXNRN0JGVC9leURHZUwxR3lkNzNlUXFteEN5YW1JVGlWSkZIVVJnaFRW?=
 =?utf-8?B?dmlOWVp6eUpXVHh0R25xS2x6WjI3SWhVUlNadEhGVWhTUjl4Tk5ybGFLeERr?=
 =?utf-8?B?RDl1eVlIQTZTd0I5ZHVHMVYyR0Z1QWhiSVk0bW1SQjRoTFY1dFA1SEhkM0RU?=
 =?utf-8?B?bFBhaW16Mm1XemU4STVxMkRjT08vUEE3QTl5cXpuSHVIUldXSGVXQVlKdUFN?=
 =?utf-8?B?OGIwbmNsL1cyVVJON1lZbzMvTXJTKzI3Q3l2U1VoTFZ5cVFMYkxhYUhoWkJV?=
 =?utf-8?B?L1oxcEpnTE9CQkQ2ZFU4c3BuaTFJdFBXSGRHNTVndG1iVXZzdzlDZmZNTW41?=
 =?utf-8?B?cTQ3ZDB5VkxUK0NiOXcrL3duRElYenZKSG1IbEc1SWVQbDF6K1RvVW5zUkdP?=
 =?utf-8?B?NEd3QmpINHQzbzBkUDlFdmpZdlY3VlRTVy9yQXNXc0M2R01tUGxRVGxyS016?=
 =?utf-8?B?WFNnK2pMa0kxZE94Rjh1VzM5emNZdW80VC9SbWN4czl2M3hzUjA0ZC81N3Jn?=
 =?utf-8?B?Zm1GalA5bkRvSUc4L0V6WVZxY3FiUkdEdWNaUldqeEs2a2ZoS2lmL2x6VUNm?=
 =?utf-8?B?UkY5VTB0S0REdThnWE9tcnBnSlZIazN0dnNmMUNyWkZ1T3NrOHBSano1OUVR?=
 =?utf-8?B?dFZWanhHcnRiZllTaE45MldFSkVnQ1FiL2RHTkRuWVJyaHRaeFhKRjg4REM0?=
 =?utf-8?B?cERSWDdwZnExUFZEQ3hMcURaUGlrdHhmbnFUMHIxSDBLcDdnSWhHcFJwMUZv?=
 =?utf-8?B?V2dNNEZRLzlLYzlnMzZ2SE9FWUw0TUVhQzhsWnhUa0VxR2FCOEFjaGo4RWdQ?=
 =?utf-8?B?WjZqL2grK0Fnd3JSMjJEZStrN2NUVUxoZmlDRUpwK0tpYS9iTjd5UmRMMnZD?=
 =?utf-8?B?TnhYaG1sekoxSUNHWjM0WlhDT2tWTW5GSUFtR3JqZUZFbnVZS2JLdnBsbVps?=
 =?utf-8?B?MGc4SEQ4MmlZeTB2RFUzTkJhbk5TUEpVZi8wVk1RRjZDTVF6emU5U0NxNVFo?=
 =?utf-8?B?VUFyUFVqcmk2Zm4ySzNnRTNyWG9MQmFkaU40SlNZZFZER3M5UUNPSFJHNVFU?=
 =?utf-8?B?VklXek5DRi80ZytMTEkwOFR4UDJjRWtSOGpxNkQzcUtSVWpzY1Jvbnhpb21V?=
 =?utf-8?B?WWkwUjg4OXlwb1IxYjd6eDRabG9PRTllV3pyTmFOaWVlSHlmelZWUko5alhI?=
 =?utf-8?B?RXJ5OTAzaXZyR0tuRGZvZUUwelNnTmVkeGNDR1FoRWhWQ3pMQ3dpNGZvRUZk?=
 =?utf-8?B?NFkzMElZLytMTkJIVisvRUJuaDdYa2NkODdacjd5Ni90SUZsMVczMXlqZ0h3?=
 =?utf-8?B?SjFocEw4MkFDcy9lQmRPS0VZNnJIZmp0ZFE0WUtpNEhtbldGUXNuSnRsLzli?=
 =?utf-8?B?YnM5Umx4Sm1FV2tiYTh4SnFnK05lbW9hY2hMN3BTVGpFY3ZEeklkN1JrSTJj?=
 =?utf-8?B?WCtqMkxpSmZ2cTFETTJKRmtHblJ6cGZBQ1F2eUYwNG1OajBkdGIzNlJvd2lS?=
 =?utf-8?B?NHlLNjdjU1pLS2U0UVNydWpJc2kycE1mQnpxZ2pERkllcGowOWhuaFhUeEJX?=
 =?utf-8?B?U3ZXcFprSE10cVZuZEJIYWtiOWdndlNNb0srYllwS1RWN1JWQW1wYlozT2dG?=
 =?utf-8?B?TU5BellFMzJtaDNSNVUwR0pDaTd0RnQ3RnFlSDB1SW9NM0dRTGNLRyt5aWp6?=
 =?utf-8?B?aGoyWjNlaEZRTzhsczBxaE1iVC81VTRpZ3RLeVZoZWtEUzZGMjZoRklCV1J1?=
 =?utf-8?B?SFl0cm5kLytSZitLZnM5aER0clNnZDlRaisyNGV1NEpxNmpQeDVLT3ROWEha?=
 =?utf-8?Q?lPXmckGxv9G9r0NZOU39CwWPM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc339724-f7fb-4d6b-0e1e-08db4a76bcbf
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 19:03:23.9365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aLm3VCs+hNLWniEUPlvuUgOXza8fNQvbFr6pax/1vQZlYjDp2mfjpQTgDo8y37xjkPf/cm+RXi4i2mrPAvWxWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7094
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 1/2] Revert "drm: Add a gpu page-table walker
 helper"
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This reverts commit 500e50fde9938fdc16c05caf5468db9ab2e69156.
---
 drivers/gpu/drm/Makefile      |   1 -
 drivers/gpu/drm/drm_pt_walk.c | 159 ---------------------------------
 include/drm/drm_pt_walk.h     | 161 ----------------------------------
 3 files changed, 321 deletions(-)
 delete mode 100644 drivers/gpu/drm/drm_pt_walk.c
 delete mode 100644 include/drm/drm_pt_walk.h

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 66dd2c48944a..795abcc0ca7e 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -39,7 +39,6 @@ drm-y := \
 	drm_prime.o \
 	drm_print.o \
 	drm_property.o \
-	drm_pt_walk.o \
 	drm_syncobj.o \
 	drm_sysfs.o \
 	drm_trace_points.o \
diff --git a/drivers/gpu/drm/drm_pt_walk.c b/drivers/gpu/drm/drm_pt_walk.c
deleted file mode 100644
index 1a0b147a3acc..000000000000
--- a/drivers/gpu/drm/drm_pt_walk.c
+++ /dev/null
@@ -1,159 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Copyright © 2022 Intel Corporation
- */
-#include <drm/drm_pt_walk.h>
-
-/**
- * DOC: GPU page-table tree walking.
- * The utilities in this file are similar to the CPU page-table walk
- * utilities in mm/pagewalk.c. The main difference is that we distinguish
- * the various levels of a page-table tree with an unsigned integer rather
- * than by name. 0 is the lowest level, and page-tables with level 0 can
- * not be directories pointing to lower levels, whereas all other levels
- * can. The user of the utilities determines the highest level.
- *
- * Nomenclature:
- * Each struct drm_pt, regardless of level is referred to as a page table, and
- * multiple page tables typically form a page table tree with page tables at
- * intermediate levels being page directories pointing at page tables at lower
- * levels. A shared page table for a given address range is a page-table which
- * is neither fully within nor fully outside the address range and that can
- * thus be shared by two or more address ranges.
- */
-static u64 drm_pt_addr_end(u64 addr, u64 end, unsigned int level,
-			   const struct drm_pt_walk *walk)
-{
-	u64 size = 1ull << walk->shifts[level];
-	u64 tmp = round_up(addr + 1, size);
-
-	return min_t(u64, tmp, end);
-}
-
-static bool drm_pt_next(pgoff_t *offset, u64 *addr, u64 next, u64 end,
-			unsigned int level, const struct drm_pt_walk *walk)
-{
-	pgoff_t step = 1;
-
-	/* Shared pt walk skips to the last pagetable */
-	if (unlikely(walk->shared_pt_mode)) {
-		unsigned int shift = walk->shifts[level];
-		u64 skip_to = round_down(end, 1ull << shift);
-
-		if (skip_to > next) {
-			step += (skip_to - next) >> shift;
-			next = skip_to;
-		}
-	}
-
-	*addr = next;
-	*offset += step;
-
-	return next != end;
-}
-
-/**
- * drm_pt_walk_range() - Walk a range of a gpu page table tree with callbacks
- * for each page-table entry in all levels.
- * @parent: The root page table for walk start.
- * @level: The root page table level.
- * @addr: Virtual address start.
- * @end: Virtual address end + 1.
- * @walk: Walk info.
- *
- * Similar to the CPU page-table walker, this is a helper to walk
- * a gpu page table and call a provided callback function for each entry.
- *
- * Return: 0 on success, negative error code on error. The error is
- * propagated from the callback and on error the walk is terminated.
- */
-int drm_pt_walk_range(struct drm_pt *parent, unsigned int level,
-		      u64 addr, u64 end, struct drm_pt_walk *walk)
-{
-	pgoff_t offset = drm_pt_offset(addr, level, walk);
-	struct drm_pt **entries = parent->dir ? parent->dir->entries : NULL;
-	const struct drm_pt_walk_ops *ops = walk->ops;
-	enum page_walk_action action;
-	struct drm_pt *child;
-	int err = 0;
-	u64 next;
-
-	do {
-		next = drm_pt_addr_end(addr, end, level, walk);
-		if (walk->shared_pt_mode && drm_pt_covers(addr, next, level,
-							  walk))
-			continue;
-again:
-		action = ACTION_SUBTREE;
-		child = entries ? entries[offset] : NULL;
-		err = ops->pt_entry(parent, offset, level, addr, next,
-				    &child, &action, walk);
-		if (err)
-			break;
-
-		/* Probably not needed yet for gpu pagetable walk. */
-		if (unlikely(action == ACTION_AGAIN))
-			goto again;
-
-		if (likely(!level || !child || action == ACTION_CONTINUE))
-			continue;
-
-		err = drm_pt_walk_range(child, level - 1, addr, next, walk);
-
-		if (!err && ops->pt_post_descend)
-			err = ops->pt_post_descend(parent, offset, level, addr,
-						   next, &child, &action, walk);
-		if (err)
-			break;
-
-	} while (drm_pt_next(&offset, &addr, next, end, level, walk));
-
-	return err;
-}
-EXPORT_SYMBOL(drm_pt_walk_range);
-
-/**
- * drm_pt_walk_shared() - Walk shared page tables of a page-table tree.
- * @parent: Root page table directory.
- * @level: Level of the root.
- * @addr: Start address.
- * @end: Last address + 1.
- * @walk: Walk info.
- *
- * This function is similar to drm_pt_walk_range() but it skips page tables
- * that are private to the range. Since the root (or @parent) page table is
- * typically also a shared page table this function is different in that it
- * calls the pt_entry callback and the post_descend callback also for the
- * root. The root can be detected in the callbacks by checking whether
- * parent == *child.
- * Walking only the shared page tables is common for unbind-type operations
- * where the page-table entries for an address range are cleared or detached
- * from the main page-table tree.
- *
- * Return: 0 on success, negative error code on error: If a callback
- * returns an error, the walk will be terminated and the error returned by
- * this function.
- */
-int drm_pt_walk_shared(struct drm_pt *parent, unsigned int level,
-		       u64 addr, u64 end, struct drm_pt_walk *walk)
-{
-	const struct drm_pt_walk_ops *ops = walk->ops;
-	enum page_walk_action action = ACTION_SUBTREE;
-	struct drm_pt *child = parent;
-	int err;
-
-	walk->shared_pt_mode = true;
-	err = walk->ops->pt_entry(parent, 0, level + 1, addr, end,
-				  &child, &action, walk);
-
-	if (err || action != ACTION_SUBTREE)
-		return err;
-
-	err = drm_pt_walk_range(parent, level, addr, end, walk);
-	if (!err && ops->pt_post_descend) {
-		err = ops->pt_post_descend(parent, 0, level + 1, addr, end,
-					   &child, &action, walk);
-	}
-	return err;
-}
-EXPORT_SYMBOL(drm_pt_walk_shared);
diff --git a/include/drm/drm_pt_walk.h b/include/drm/drm_pt_walk.h
deleted file mode 100644
index 64e7a418217c..000000000000
--- a/include/drm/drm_pt_walk.h
+++ /dev/null
@@ -1,161 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright © 2022 Intel Corporation
- */
-#ifndef __DRM_PT_WALK__
-#define __DRM_PT_WALK__
-
-#include <linux/pagewalk.h>
-#include <linux/types.h>
-
-struct drm_pt_dir;
-
-/**
- * struct drm_pt - base class for driver pagetable subclassing.
- * @dir: Pointer to an array of children if any.
- *
- * Drivers could subclass this, and if it's a page-directory, typically
- * embed the drm_pt_dir::entries array in the same allocation.
- */
-struct drm_pt {
-	struct drm_pt_dir *dir;
-};
-
-/**
- * struct drm_pt_dir - page directory structure
- * @entries: Array holding page directory children.
- *
- * It is the responsibility of the user to ensure @entries is
- * correctly sized.
- */
-struct drm_pt_dir {
-	struct drm_pt *entries[0];
-};
-
-/**
- * struct drm_pt_walk - Embeddable struct for walk parameters
- */
-struct drm_pt_walk {
-	/** @ops: The walk ops used for the pagewalk */
-	const struct drm_pt_walk_ops *ops;
-	/**
-	 * @shifts: Array of page-table entry shifts used for the
-	 * different levels, starting out with the leaf level 0
-	 * page-shift as the first entry. It's legal for this pointer to be
-	 * changed during the walk.
-	 */
-	const u64 *shifts;
-	/** @max_level: Highest populated level in @sizes */
-	unsigned int max_level;
-	/**
-	 * @shared_pt_mode: Whether to skip all entries that are private
-	 * to the address range and called only for entries that are
-	 * shared with other address ranges. Such entries are referred to
-	 * as shared pagetables.
-	 */
-	bool shared_pt_mode;
-};
-
-/**
- * typedef drm_pt_entry_fn - gpu page-table-walk callback-function
- * @parent: The parent page.table.
- * @offset: The offset (number of entries) into the page table.
- * @level: The level of @parent.
- * @addr: The virtual address.
- * @next: The virtual address for the next call, or end address.
- * @child: Pointer to pointer to child page-table at this @offset. The
- * function may modify the value pointed to if, for example, allocating a
- * child page table.
- * @action: The walk action to take upon return. See <linux/pagewalk.h>.
- * @walk: The walk parameters.
- */
-typedef int (*drm_pt_entry_fn)(struct drm_pt *parent, pgoff_t offset,
-			       unsigned int level, u64 addr, u64 next,
-			       struct drm_pt **child,
-			       enum page_walk_action *action,
-			       struct drm_pt_walk *walk);
-
-/**
- * struct drm_pt_walk_ops - Walk callbacks.
- */
-struct drm_pt_walk_ops {
-	/**
-	 * @pt_entry: Callback to be called for each page table entry prior
-	 * to descending to the next level. The returned value of the action
-	 * function parameter is honored.
-	 */
-	drm_pt_entry_fn pt_entry;
-	/**
-	 * @pt_post_descend: Callback to be called for each page table entry
-	 * after return from descending to the next level. The returned value
-	 * of the action function parameter is ignored.
-	 */
-	drm_pt_entry_fn pt_post_descend;
-};
-
-int drm_pt_walk_range(struct drm_pt *parent, unsigned int level,
-		      u64 addr, u64 end, struct drm_pt_walk *walk);
-
-int drm_pt_walk_shared(struct drm_pt *parent, unsigned int level,
-		       u64 addr, u64 end, struct drm_pt_walk *walk);
-
-/**
- * drm_pt_covers - Whether the address range covers an entire entry in @level
- * @addr: Start of the range.
- * @end: End of range + 1.
- * @level: Page table level.
- * @walk: Page table walk info.
- *
- * This function is a helper to aid in determining whether a leaf page table
- * entry can be inserted at this @level.
- *
- * Return: Whether the range provided covers exactly an entry at this level.
- */
-static inline bool drm_pt_covers(u64 addr, u64 end, unsigned int level,
-				 const struct drm_pt_walk *walk)
-{
-	u64 pt_size = 1ull << walk->shifts[level];
-
-	return end - addr == pt_size && IS_ALIGNED(addr, pt_size);
-}
-
-/**
- * drm_pt_num_entries: Number of page-table entries of a given range at this
- * level
- * @addr: Start address.
- * @end: End address.
- * @level: Page table level.
- * @walk: Walk info.
- *
- * Return: The number of page table entries at this level between @start and
- * @end.
- */
-static inline pgoff_t
-drm_pt_num_entries(u64 addr, u64 end, unsigned int level,
-		   const struct drm_pt_walk *walk)
-{
-	u64 pt_size = 1ull << walk->shifts[level];
-
-	return (round_up(end, pt_size) - round_down(addr, pt_size)) >>
-		walk->shifts[level];
-}
-
-/**
- * drm_pt_offset: Offset of the page-table entry for a given address.
- * @addr: The address.
- * @level: Page table level.
- * @walk: Walk info.
- *
- * Return: The page table entry offset for the given address in a
- * page table with size indicated by @level.
- */
-static inline pgoff_t
-drm_pt_offset(u64 addr, unsigned int level, const struct drm_pt_walk *walk)
-{
-	if (level < walk->max_level)
-		addr &= ((1ull << walk->shifts[level + 1]) - 1);
-
-	return addr >> walk->shifts[level];
-}
-
-#endif
-- 
2.39.2

