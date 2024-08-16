Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CBEEC531DF
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 15:03:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08FEE10E7E1;
	Fri, 16 Aug 2024 15:03:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HEWi4hNs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B48FE10E039
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 15:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723820587; x=1755356587;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=VzSiYljYX8AgmHFI5CtXv7iZUSwOmiaQTnAkCiaKuv0=;
 b=HEWi4hNsxArVely8KZ5MGGocRC0cpRThlsv+uROA26E6LAWVYqoTs8wG
 BDsBTOYHb7yirjRu4oW/w7Xt5eC95v0K/+Tj3UgXsqA5SX84HJ4kzeIpW
 J5IRIq/TyJvZEc5QsfSLzZOi36yyBR2g0fzQdlWuSXKx2kbldZokhyc+2
 eO7d1flZ0+/Rd3LN/BMeR0wE5AAb+JlYMtQY66/CpJDtxCLL/wU9rRD9q
 VYOC7o+GD2vnFxZWIjQjn9qKFcBQpZNOHmC+G2TZOYp0haYNBkHTN4u2Y
 zraROmY5I26e4rNYvjJCiLe7Dk636JD1j3euFtuGW7IAf9ETw0Sq18CPS w==;
X-CSE-ConnectionGUID: etkTGjr1RNCUQAQjnCUyGw==
X-CSE-MsgGUID: mQrjgyGfSDCXT9nTCsJS0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="13054377"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="13054377"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 08:03:07 -0700
X-CSE-ConnectionGUID: w+CyCofpSDWJr/vt7V4PoA==
X-CSE-MsgGUID: hohvYYatQqOwyWqYfGWCzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="59384105"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Aug 2024 08:03:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 08:03:06 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 16 Aug 2024 08:03:06 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 16 Aug 2024 08:03:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e9paBql3xxREmsC8bFXKZNlkedwD9x8CqRY1xyMYQEv2IboY8xcaYo7DNfdPdPfo5qz/yQ9I5Qv0+T8x1UBIEofAJ1+YfQiNyAQh8h3dGj2TUl2zHg161Qmzx3nTGzHzXU7IJGI1HVCivMNg09azG2MKh+AuzEyQ1Asc7EeJ0KPtngDXpJ056ub1iT+r0swecjQzxUiP1IX4BWSQr+IMQvYFeRPbUKh4l9wB4Td0o4UYEk+E8eCw5pnkUM9c8oFRTApYp4wCS+RWwKPxcdYD47joNdJGZYZY7C6veFh2db8OW7TRg/q0EkO/r0hEntDQTNd5ojhYyTPjB3pa1Yn/mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sVJCjNogDncuDE4OuwLFEzLj8N0KMbBT5xInlRdCffo=;
 b=i7ZLx29iwV7qLdZzeAyTuNP9NSjZwwQcM3Nrn0vAbLOJzJ3UhwNE05+f49L+LF+w6XfSjYW7I6Vs2FRGHtz0Z2XKCklBxLtiQkmQuQYmbI8/Ms54yAiTHFpr/9bpWihJFkxAppPW37lxcGV9X6BgaIsBXKyiJ09MGs2FVX2L6szgepiBY19XlhvkuYBzP6iCUdaKo/p01XZspUT2YLXnWXJOUDRjqogAqVPC2KdhXGRXbU5xx8z65tt84ncy1xWAveJAlQ8lbYvCYK4MvgTtHR38i/8xUwbwGsO5AycBo1lIttRAN483yVPPFSKzREoqF0NTqYAiBCxcSgsZwFZbvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by LV3PR11MB8554.namprd11.prod.outlook.com (2603:10b6:408:1bb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Fri, 16 Aug
 2024 15:02:56 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7828.023; Fri, 16 Aug 2024
 15:02:56 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, <jose.souza@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH 04/12] drm/{i915,
 xe}: Avoid direct inspection of dpt_vma from outside dpt
Date: Fri, 16 Aug 2024 11:02:35 -0400
Message-ID: <20240816150243.87596-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240816150243.87596-1-rodrigo.vivi@intel.com>
References: <20240816150243.87596-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0035.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::48) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|LV3PR11MB8554:EE_
X-MS-Office365-Filtering-Correlation-Id: 279e5fad-7978-4e6d-6062-08dcbe0482f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Efmh6Unks4J6N2k9O1E4rZ455tVK9akhwaZWqRxjkzBvF8uADz5rGhAYsUYx?=
 =?us-ascii?Q?NJScmMmErbbyEFHORhH0hLhx6Z+Ti5wghTzHeRl0Veh8KJd7Mf/A8ulaodC0?=
 =?us-ascii?Q?Ywi/zaXHK3zwLGkA12DiZR1d03WwWA4jKOSuLX7suCq9LJ+gQKzc5qoMgqEe?=
 =?us-ascii?Q?UG49fJZVV23YoP5h4bl5cXl8aIzpWFJ20g4jJMw0DQ2V7NUFZTGCWfGV9Mju?=
 =?us-ascii?Q?4urxlEbpTkkC05cZ0v7iCRIS3uBDMgVAkHaiBTmqYYHrGzh/HfObwHRtYOrE?=
 =?us-ascii?Q?QlPkehPo7JwQLwmWWkThF2lk88K8g1IjbwJgUcfll9FLNJ7GiN1+RC+WXvRo?=
 =?us-ascii?Q?nXixDBPEYFGxlTGEggKd1WhOppkgbJ2xlFOvfvRysRlWBtIjrpfj63i/6IhH?=
 =?us-ascii?Q?K3hzKmqfL9J/PnhOaRZB/Rf/fqH02iARPwiStErDg+upAey7jzpoYiPHZ8Ck?=
 =?us-ascii?Q?ad93cx3OQPrZ6a585lvNiCDoWYlbKE9CHTtYAm4TLHj1wUIAAK0kpMo4q6HC?=
 =?us-ascii?Q?ztsIUdzFTUM1SHhTkYaJLCNAZNPv75X+wkG6LFHtYJ4wbi6WXqVC7qrOz+kh?=
 =?us-ascii?Q?Ucj13D+0i7E4U/wXhTzHyGMICLkAN/7I3MF0Zi8JJgCSpIPJ0o21FWh1BNgq?=
 =?us-ascii?Q?I4770y0D7gzRfZqhi05u969M4yAFTHQm+BLcLoubPsY4fwaxBTXgn2BN/2Eq?=
 =?us-ascii?Q?AIDulShkHHzPXzdcfNY2GO27gHNHi4YQFZCwUNnXTmjfNgDb5aSSYnl4/7Zb?=
 =?us-ascii?Q?7pLOfZjrm9z1ea+VuW+2BIk2ZMyVk2MGi0iJlDZUKZS4FIfhQsbdOyk4M/NA?=
 =?us-ascii?Q?/gWPOzyWk4BSFSg7t6FNVsQTYm3YOsBHO7fjwkh3kJmKo4gaOyqX7EcWJuz/?=
 =?us-ascii?Q?97yYiYPC08QSViUi8EZsxPoly3712WHuZbbbzNmmkf7vlbKrVwQAEjb3ltEX?=
 =?us-ascii?Q?zibZEYEYdt6/Z+Mhv7xGPXgE6jv9f75rJp+GpCY6uX+uI+b/s6zRtsLaWAv3?=
 =?us-ascii?Q?GDlJfLfWLI/ukBMs0mEImhC8UGTGoiMY2uz47Fc/EUcraT6QYMDSSP771XyA?=
 =?us-ascii?Q?lxHAGxWZZt70bJj23UP6Zgy3RYiP2hn73rNtTDWewj1kXgkAFE69RTY66Vko?=
 =?us-ascii?Q?UiojRktgxklbaLawRSYCCQwkHC97OiWuaJ6idq2nk86LwC3zwnLrctWQDgqo?=
 =?us-ascii?Q?JNJmhQ6ws/vHK2xV4sETeOV/7eo2RCe6rKmBAKctc7JAXLgCCMied6FXJP8O?=
 =?us-ascii?Q?IZHM33AW9zP+DXmRmC//F4FOYhSMlvfKRfsYnpIzBUphzCzyTKbkMp94z9HO?=
 =?us-ascii?Q?5ZT633+I22tgsd8FfrrTN1yyPGg4hnMB5rL7d791RQCeoA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fhklo8CY3A0TUPHYrLSytmSEhK1QJtpmX9Oqw+thNvd0EAVh7vH6OB5I3d05?=
 =?us-ascii?Q?voGoOV/HOjZpi/SgRWcWtNZP7LZ+hecOQSuzWReAaZnxpprfWDIkJglKegf1?=
 =?us-ascii?Q?ebVHI3R3ZvdQbHcAEsR3Cz/rJwtuboquDLO36/Py1mEZDlQl+fx8Z80qihmd?=
 =?us-ascii?Q?pF4+qSVZjAkOIRhRzDeKszZG0c17xGVSN0AxXN2k6KZH2sTqiV8hcZ/3JWnJ?=
 =?us-ascii?Q?xE3Dp0z1o+eT9J0/5BuftmhlEUk02bkUwrOpDIpL9mGfy4PVvoFY8eYRvBV3?=
 =?us-ascii?Q?wc5vX2PdxzJ/ZGvU6xMJaEB5SHGGUVINT661skcte2LIrfy781JSWeJELHbJ?=
 =?us-ascii?Q?fSxnHtdDHKhhyPEH1RYMzaEYIt9A5+ii37ytHiW+tpytMYkJNN6S4NLaeVle?=
 =?us-ascii?Q?1E6Hg6+nuH9sfCFX9f8vvPWBGkOk2+zQfY5nJ24h6/ic2P94JxgK9DSrQ9/z?=
 =?us-ascii?Q?Wj5LOVp0YLRK4uKAgr3lizMqxrTnoO7b5YaRk9gXPrwOra/OXwO6gQ/nP/oh?=
 =?us-ascii?Q?Pfb3bw8NIYSFtywoTJVlUpooH0RktqW1fmNIz/RJf+Eo6I3iwDjroEgQa5tV?=
 =?us-ascii?Q?EsuvyxfUNr1pKqKCfQu+QN0kITf4C/Mtw/a/EtvF435OJST7ewEv2GKP2yle?=
 =?us-ascii?Q?2I9oPHngM3yxavsUCvPl/sV1cuDxCxGWDtgkR6OlhTB+zwnPcAlO6hGv3Anq?=
 =?us-ascii?Q?Jd2Al2SoyjKx2obBmLU4MrYIhopsCzFovYC2aQVkByaqmSvphRSU2wc343HY?=
 =?us-ascii?Q?awQigFpjI0M/pTYv/AGMRdmcMaSsBRk8/VQ9WR7s5eBso98OeZ/Cv3YAPTUR?=
 =?us-ascii?Q?SOIT5qtiMd+CZlytQ8P0A21pXxdfFzixKjkjk+gb/EXHTVgXAEfwaeqFEfIj?=
 =?us-ascii?Q?jR+Z9xe4JX1no7Db0n9g/YTndfCA0LjaZ99yaxuraJ+s7uK0Yi34M36aj7g5?=
 =?us-ascii?Q?3HNQF1kWzR4+pLg9g3AAlWkgvFnpICnrg8h+zrb4hsut0wRunuxrMQY+oPGk?=
 =?us-ascii?Q?CqaKFjIBMV6sS/TSa+tGvIM5YaWxGfOGvU1xXXG0feHpsAIZ22kZiTwMsYLm?=
 =?us-ascii?Q?WwWfGwiLLxBwK/9vd9EwJT9wWO6nY+qKDZBwsN0y18KH/z6ugecJxOztvpGZ?=
 =?us-ascii?Q?9Qj07ju1i5PqxkQqmb1Ir4iVYNJrCZS+dmN25mAhAXJTh5Yg+RKOVrtEP2Nr?=
 =?us-ascii?Q?hh6hBJeNXxSrGDje5mqtqJWQCQkOdMTNkoN6iXaDW69Luwm3hK1Ubbnht7F8?=
 =?us-ascii?Q?dfbXKMsQ/wQMiXeQAGnfa8NVUyX4OMVII4BJ9VVpsNELyqUbAckkXsuCOXzQ?=
 =?us-ascii?Q?dyb/VDl3o+UbxWeGiBg7ZGk+anvMRzz4w4sdxt7GsTVuRkByuRNNqwbBZmJD?=
 =?us-ascii?Q?rGUske4griw35QFXvE1ow1AjSN6ZAGkmaaE2Hg9r1xbP/3XIJaVRita3i2m+?=
 =?us-ascii?Q?zx/LA6gi/8fP2fGHvDuRDaod60uho2B1wQpSTtqgwaR5NWTn4f83c78dFUuT?=
 =?us-ascii?Q?Dr0YzhEP9zvo6FEoZoZACSfgZ/Jiuqg7LpZyaGmYenbSbXX/s/7ITD/Lxaft?=
 =?us-ascii?Q?PTQg4O/+UeEF9you/fXhjezv2LJmJDX2Ij2mBKkcjEHXT3feDCoxQN/1+kYk?=
 =?us-ascii?Q?EA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 279e5fad-7978-4e6d-6062-08dcbe0482f0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 15:02:56.7421 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: axD+xJclH5z2z4lj5oKR59oSmafyGSQFS9kPsb7pB7pTMoikTgPT1VrWDIYyZJhfRZP4+dAQOrIjP2ohfdMpiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8554
X-OriginatorOrg: intel.com
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DPT code is so dependent on i915 vma implementation and it is not
ported yet to Xe.

This patch limits inspection to DPT's VMA struct to intel_dpt
component only, so the Xe GGTT code can evolve.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dpt.c           | 4 ++++
 drivers/gpu/drm/i915/display/intel_dpt.h           | 3 +++
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 3 ++-
 drivers/gpu/drm/xe/display/xe_fb_pin.c             | 9 +++++++--
 4 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c b/drivers/gpu/drm/i915/display/intel_dpt.c
index 73a1918e2537..3a6d99044828 100644
--- a/drivers/gpu/drm/i915/display/intel_dpt.c
+++ b/drivers/gpu/drm/i915/display/intel_dpt.c
@@ -317,3 +317,7 @@ void intel_dpt_destroy(struct i915_address_space *vm)
 	i915_vm_put(&dpt->vm);
 }
 
+u64 intel_dpt_offset(struct i915_vma *dpt_vma)
+{
+	return dpt_vma->node.start;
+}
diff --git a/drivers/gpu/drm/i915/display/intel_dpt.h b/drivers/gpu/drm/i915/display/intel_dpt.h
index ff18a525bfbe..1f88b0ee17e7 100644
--- a/drivers/gpu/drm/i915/display/intel_dpt.h
+++ b/drivers/gpu/drm/i915/display/intel_dpt.h
@@ -6,6 +6,8 @@
 #ifndef __INTEL_DPT_H__
 #define __INTEL_DPT_H__
 
+#include <linux/types.h>
+
 struct drm_i915_private;
 
 struct i915_address_space;
@@ -20,5 +22,6 @@ void intel_dpt_suspend(struct drm_i915_private *i915);
 void intel_dpt_resume(struct drm_i915_private *i915);
 struct i915_address_space *
 intel_dpt_create(struct intel_framebuffer *fb);
+u64 intel_dpt_offset(struct i915_vma *dpt_vma);
 
 #endif /* __INTEL_DPT_H__ */
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index ba5a628b4757..1cf1d5c8b9dc 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -14,6 +14,7 @@
 #include "intel_de.h"
 #include "intel_display_irq.h"
 #include "intel_display_types.h"
+#include "intel_dpt.h"
 #include "intel_fb.h"
 #include "intel_fbc.h"
 #include "intel_frontbuffer.h"
@@ -1162,7 +1163,7 @@ static u32 skl_surf_address(const struct intel_plane_state *plane_state,
 		 * within the DPT is always 0.
 		 */
 		drm_WARN_ON(&i915->drm, plane_state->dpt_vma &&
-			    plane_state->dpt_vma->node.start);
+			    intel_dpt_offset(plane_state->dpt_vma));
 		drm_WARN_ON(&i915->drm, offset & 0x1fffff);
 		return offset >> 9;
 	} else {
diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index d7db44e79eaf..42d431ff14e7 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -377,8 +377,8 @@ void intel_plane_unpin_fb(struct intel_plane_state *old_plane_state)
 }
 
 /*
- * For Xe introduce dummy intel_dpt_create which just return NULL and
- * intel_dpt_destroy which does nothing.
+ * For Xe introduce dummy intel_dpt_create which just return NULL,
+ * intel_dpt_destroy which does nothing, and fake intel_dpt_ofsset returning 0;
  */
 struct i915_address_space *intel_dpt_create(struct intel_framebuffer *fb)
 {
@@ -389,3 +389,8 @@ void intel_dpt_destroy(struct i915_address_space *vm)
 {
 	return;
 }
+
+u64 intel_dpt_offset(struct i915_vma *dpt_vma)
+{
+	return 0;
+}
-- 
2.46.0

