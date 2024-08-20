Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC9B8C3DA4A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 20:26:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9715510E2D9;
	Tue, 20 Aug 2024 20:26:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jcfccalr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C429310E2D3
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 20:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724185566; x=1755721566;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=BQaxiUQrnHTl6PZVyxE/MB5hiNoXOzvrqVPXtohhsDY=;
 b=JcfccalrFiW/o1oGk2Wuz4yWSr8mGynEJcCKSxfM20lEyRlvahc0bSKN
 nbHH5xYgCfL2Pg+XCe6ru+JrDxEN67R3dZqBNEPNtHsBNSeymysRzBMc8
 uAxc+XTzF25DMQjaETBDubpZ/QtU86zUgmvv1cAtYa7vV6TZkzoYX0pts
 IsBXlcKZ/OxwWW9no8qrePszJnhvJPJLpFOxzuhTOGxJFvB02qHz5783B
 VwyghZ8T5A4VunJGCn+jZkW+A9brdWhse3SDr+hDrkK/MZ023v5/gDZsf
 9NckH6vNTcLSSYTzRzRfpz4YaCUENnTl2nXkOtxLPo35zKbXNxENFvXc8 w==;
X-CSE-ConnectionGUID: YOSJDi0QQBuih/Q7o4FULg==
X-CSE-MsgGUID: O4HB3uwDRoyHVYrKhz1BLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22648297"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="22648297"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 13:26:04 -0700
X-CSE-ConnectionGUID: 73avHWCQRTu+Pkg5h42Tpw==
X-CSE-MsgGUID: Ar7B0sbRRf+XeKup0rPT7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="84039359"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Aug 2024 13:26:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 13:26:03 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 13:26:03 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 13:26:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hErHkamSFGBAcmpYqtIsTEGJHz1HzdoLmSegw5nCTYaY1irDhzw37CXwx2PjVLhcVJ9ljkUYI52tUDbQvFpXbj8sFEOXx1gamz1i2OpzkxvB393H27WPOOk0EAr9Oef2bteDusBJxI41ek7zqMRjtfKQUrEUzdlOhHpggqUZ82VPJGIHfk3mjG/YqJRY1dvjTPFgRuVn4zh6hRQLn4aZEXia5pUf1zQDQvkO7+hq/YsSLBhxrEycdp6Raulyj8ScGPtAgnlyNriWWlOoaOyY1E7qBAE/c08Nv2+TAC+4gN68UKZnYlwCVZHTI5DI54ueOI5v1NQi0RtDn6X5jlg+yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b6iMCiSar7gNdDutJ8vMo30fSM/LwtQI3mH6Iz+FVLw=;
 b=y3vbOrETvVTdhpqF/wh00y2hdiDA0k6uGh5vNKKDhO1K49HUqOzttVVWG6VUfmruCGjPW4PuHCc55gK+U5foCGP1twF0B0hVUgaTUVvFnJSwrICneFMCb2NauLiMHCbuXcoDmsM3ILn0OLX/0ldE+oPgv6ZKdsP/ktxBz1bpbkxAROEHBvay/y0alyXGSYVyDHHH/gFbvK4mfRMcswvbfplClqd8IW7mgApIGunuz0u8y7yGI/s6EdDfKMvZ7maDisFKUGGRtqpqbtl4n+GQNHTEd/nYkpWb0hd0IiWh8rXsWAW3GSc/veITNES/DAas2tOLnRVeQ1gXjm276QWyqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH7PR11MB6029.namprd11.prod.outlook.com (2603:10b6:510:1d0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 20:26:00 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 20:26:00 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "Matthew Brost" <matthew.brost@intel.com>
Subject: [PATCH 05/12] drm/xe: Encapsulate drm_mm_node inside xe_ggtt_node
Date: Tue, 20 Aug 2024 16:25:40 -0400
Message-ID: <20240820202547.300257-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240820202547.300257-1-rodrigo.vivi@intel.com>
References: <20240820202547.300257-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0182.namprd05.prod.outlook.com
 (2603:10b6:a03:330::7) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH7PR11MB6029:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dd8b89b-bea8-492c-5078-08dcc1564e04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3sihgEgcuY0VAsM1StN1GB4LWvwoSQSNYB5PF5YAN8rCEBmDcB2phRXMt+TF?=
 =?us-ascii?Q?QP9dz/+QiUW5fTxPP48kH+OW6Zt81Jl1V9R02ojV1MRc4BoOBiyqHsFpoqvM?=
 =?us-ascii?Q?qYPDcoe/8uyLs30QiRM8/vEemK9qfYGxYBh8VUCnCw7hNBPYo6nDo/UVZA/I?=
 =?us-ascii?Q?8tmXzXv7xUJY8E5OBHHl1SFqoCVh3wi4VwE01hdlNgAbghAtRJkirO3BSGFk?=
 =?us-ascii?Q?DQ6WSJ2Cr61/AWYptUstJJcws60iIGnQHKjIgbtt8rfUp9sZftkCumwwRqIK?=
 =?us-ascii?Q?6EW6jOiAXuHyqh4aVe7Or1GOkxhzIKrvWl6F9ziLnsnZtaFzxPKG0RHzKLGy?=
 =?us-ascii?Q?zfIUPL0dDbv+iueds1V5aA7KYqMYtHN/hY6TtXjkbWDiGNeVIzoTA6IOuxPT?=
 =?us-ascii?Q?Y7CH6BLXytrARjS/R2lmTb5GRFDJTWZMa6NrZhES17MUgbWSiPyVk2R+/VNB?=
 =?us-ascii?Q?ZRvBsXHrILyJs+3GB+kkkJorK7zDSKc496U2KT2c/KkFtoG4+qAymXUh0RnF?=
 =?us-ascii?Q?bvnmnggDVfBfEJNtfd73tbHSmg6IzbSe9R/HXw8bIOkvVu4VZOjBDat9oaID?=
 =?us-ascii?Q?481NaYxnAEY07omUdDDstxJ9OPnMoLPA6xifwYYgqElRc9uKZ25pgr+dvFjv?=
 =?us-ascii?Q?g2YvqqqyrgcyNmn9rlM+7Wb2DCFm95pao/EfevsiOO1w6SEpnUr6s+Xh6jec?=
 =?us-ascii?Q?FHiBh9SrESmdZt5kxbTd/MWXIzyALXD6EASGj/C75ShWQwphxjhT3816gHGC?=
 =?us-ascii?Q?4d0IcX58yMFa6iFAcLua3dfgkS5xogheQr4xfdE+uDMIOlHzOXayu0LzhcRM?=
 =?us-ascii?Q?K473uWQ7i+qV+nb5hgeMiDhxfpPlAgnoOtvj2XJw/qVAcpJjaDIxHw0JSasu?=
 =?us-ascii?Q?QBdSXxrWGmecNV8L2v5aGOWPGeMNLn+0YaZVuSepCJ5hcVomYsvOUCN+16K/?=
 =?us-ascii?Q?5uL6qPCh0VgyswSs3h6bvV/N4KLWkv3P0QQ4n/SuWgsly0CFKS9IgY/fOmS/?=
 =?us-ascii?Q?0T5M9J6M2hOZCAQKYdJ7YBhwcEj05c6K03wsKZnJKWfiFSO4eetTR638t7z3?=
 =?us-ascii?Q?R+Td50IOxkHgRgh4OMdBD8YxuX2X6bThycKMwmZspYA2gdY6CFSC3TEcPUZS?=
 =?us-ascii?Q?f9pfyXD7MhwDmOLeJCfW1dDYeRMyLjtzAZ5ITzZxzwGNk2Efy4Br5WyfkcDi?=
 =?us-ascii?Q?2lNgSHp8dcFa3r0RdyeHbnhyRdC/0js1dz7oBGzCIc89zM1dGXN0vFOe5qnE?=
 =?us-ascii?Q?6/8XNoPIWgnipeL6ZN9XKSwiojfU4mbAhy/pbJ7ja739+tvdrdYjrc5f35zR?=
 =?us-ascii?Q?j38ZNIdtAZU4gSciKbFH9B1McahOsOU7UVdsV5ez/5ezjg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ULUPE6lpHJve7hToD3EFe+dwwtJ5ardPa9xTLcPS+pJTuaV6/a1NANtvJxs4?=
 =?us-ascii?Q?KW2fopeeWYNa+Aygr7Gr0qRN4tU1m4vBQj+bnTcGnC5qsmyPAZxp/ZoyOhma?=
 =?us-ascii?Q?hx6JS9WiSsMPH7E6ME0dqO2DadYHxDdu9JYcGi6k7lGLzIse/vbdYb5ba5r8?=
 =?us-ascii?Q?ylyvJK+JVfk99roiAULOkdez54CwqC6JA1BcyJJCNNVprBVT42o4fjEsCHbL?=
 =?us-ascii?Q?ujyc4GUQ9JXcppecgykoWczwzmEkHbaTXJiqwVDaUy0cWMh/IJU4ZWEkAQzu?=
 =?us-ascii?Q?nbEnLS8KorfyqL5uZyYH1FYHSY+kIWyt9jNra5ncbpsIp/QaSSuorRv/XYuV?=
 =?us-ascii?Q?WTWRjgS6tujFRc4Mo9cEn6tYNTiM2T6k22FAKrxNYqgTpOyWrL7HXFwOB/f9?=
 =?us-ascii?Q?3rRt424wfTiEi4hkH/YxgoMbUevKI7KoBmM5qykmzTdmX4aPXOCNnSmZXC69?=
 =?us-ascii?Q?sczLDL+/ZhNBhpuD4F2t9XxI5KxljQ0SsHL+TWnMJnRFzLLTxDInztqiLe4B?=
 =?us-ascii?Q?GR0ss9jWjK37GCNXrJ42pYDVcGwL47npjq73TZjADQszRtIuqAPFpnDDBmFR?=
 =?us-ascii?Q?jtRNZ6L+uaNr2o6S72ODbO62YwO+RuFspPP4jXNIpNYNfQxYWWI6/VbwhdHE?=
 =?us-ascii?Q?p6/9ZSRRIt2o3NfdRjahbf6AzV06HcWSZ//8Oo1r+Bn+r3HTAZ5lEZs9kKgq?=
 =?us-ascii?Q?5i/okMttFwkHxRrxxdUWyXFAsA0UeF5SxW0UpSfSeLimxLneIb3dM74QPBn7?=
 =?us-ascii?Q?7v9XANt+yEXJiRiV1iezHpQ7YnyWMc6wECX2IBKzy0ezTOlMH1v+LdzMwABB?=
 =?us-ascii?Q?+lJWi8bfYpRynbQMtWepC9WgSMzCG1ZAycLcuSG/QRm9KLzVc/9KRwYYncuD?=
 =?us-ascii?Q?FB28BV/4NILklPVFrQHaPxQTkvABWnMcaY+7Ew9kz8MvLRzgOkIp3kEXj3hM?=
 =?us-ascii?Q?/MyNdSEquvGqs3dfgID0c8CD33MbWuP0UwaeYMqXVGBuvo9tcHxNkLQ5jCwc?=
 =?us-ascii?Q?8CHogXowjjPppkDeku3emPbm3xF/O7sqUcGRX+CtVD1vgblgAoZTqf67sVIE?=
 =?us-ascii?Q?B77S3Vv4pgCJGZlnmVlxMemybhznuxIbH99bzVEIs0N78MwclPxwImWSpYyP?=
 =?us-ascii?Q?8gZWXzXHFTzZFe871/PqOtfFyFIJn3l9ivZST2Vmp9yPwGbMhCvH5io5vfIb?=
 =?us-ascii?Q?+v7q16ItAocNum0JHGns7pBb7Xezp7zl2hvUCZpRR+RwemttgAc+whMGwfgs?=
 =?us-ascii?Q?HNAvEA4COBKv9ekfZHgPhoDufRlB41RH6DHkprtXCibvddw5eTEGlpnp9Q8J?=
 =?us-ascii?Q?Vd7SXVl54Z36XPP+vXZ1p9QCDsPBQ1t4w7PdDbYi4ocWRxyCy4/52NSXl39q?=
 =?us-ascii?Q?4+IBBBbP79p5YTaue93WZWoXnq45u4y3R4/AoivTBU+R8LNAdDZfnXfTXkPp?=
 =?us-ascii?Q?gCvOxrldlyzjKgrJHDHG7O/JGMFaCSoNLi9TR4l3iYdofxrQ/Gres8XkxZcz?=
 =?us-ascii?Q?61uv1uQr8ev5SVylbY07reeJREA4ECs+UgBJ3nSAZuihpIV4X1rcHGaF8ha+?=
 =?us-ascii?Q?Rd28Qh/ejXoSUjZ1fRk8sVNF7JodO2gc4ppsIHxM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dd8b89b-bea8-492c-5078-08dcc1564e04
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 20:26:00.2740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uWcjubv37Ll3X3Pg41cDgKCGVZCA0MUH5pUZ4H7AkDYpvMcgWqlzLspjBviS/SgD9NXUzl5TGUP93jUxYoYKOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6029
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

The xe_ggtt component uses drm_mm to manage the GGTT.
The drm_mm_node is just a node inside drm_mm, but in Xe we use that
only in the GGTT context. So, this patch encapsulates the drm_mm_node
into a xe_ggtt's new struct.

This is the first step towards limiting all the drm_mm access
through xe_ggtt. The ultimate goal is to have a better control of
the node insertion and removal, so the removal can be delegated
to a delayed workqueue.

v2: Fix includes and typos (Michal and Brost)

Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 .../gpu/drm/xe/compat-i915-headers/i915_vma.h |  7 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c        | 10 +--
 drivers/gpu/drm/xe/xe_bo.c                    |  2 +-
 drivers/gpu/drm/xe/xe_bo.h                    |  6 +-
 drivers/gpu/drm/xe/xe_bo_types.h              |  5 +-
 drivers/gpu/drm/xe/xe_device_types.h          |  2 +-
 drivers/gpu/drm/xe/xe_ggtt.c                  | 72 +++++++++----------
 drivers/gpu/drm/xe/xe_ggtt.h                  | 12 ++--
 drivers/gpu/drm/xe/xe_ggtt_types.h            |  8 +++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 39 +++++-----
 .../gpu/drm/xe/xe_gt_sriov_pf_config_types.h  |  5 +-
 11 files changed, 90 insertions(+), 78 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
index a20d2638ea7a..3028ac1ba72f 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
@@ -7,7 +7,8 @@
 #define I915_VMA_H
 
 #include <uapi/drm/i915_drm.h>
-#include <drm/drm_mm.h>
+
+#include "xe_ggtt_types.h"
 
 /* We don't want these from i915_drm.h in case of Xe */
 #undef I915_TILING_X
@@ -19,7 +20,7 @@ struct xe_bo;
 
 struct i915_vma {
 	struct xe_bo *bo, *dpt;
-	struct drm_mm_node node;
+	struct xe_ggtt_node node;
 };
 
 #define i915_ggtt_clear_scanout(bo) do { } while (0)
@@ -28,7 +29,7 @@ struct i915_vma {
 
 static inline u32 i915_ggtt_offset(const struct i915_vma *vma)
 {
-	return vma->node.start;
+	return vma->node.base.start;
 }
 
 #endif
diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 42d431ff14e7..a93923fb8721 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -204,7 +204,7 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
 		align = max_t(u32, align, SZ_64K);
 
-	if (bo->ggtt_node.size && view->type == I915_GTT_VIEW_NORMAL) {
+	if (bo->ggtt_node.base.size && view->type == I915_GTT_VIEW_NORMAL) {
 		vma->node = bo->ggtt_node;
 	} else if (view->type == I915_GTT_VIEW_NORMAL) {
 		u32 x, size = bo->ttm.base.size;
@@ -218,7 +218,7 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, x,
 							      xe->pat.idx[XE_CACHE_NONE]);
 
-			ggtt->pt_ops->ggtt_set_pte(ggtt, vma->node.start + x, pte);
+			ggtt->pt_ops->ggtt_set_pte(ggtt, vma->node.base.start + x, pte);
 		}
 	} else {
 		u32 i, ggtt_ofs;
@@ -232,7 +232,7 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 		if (ret)
 			goto out_unlock;
 
-		ggtt_ofs = vma->node.start;
+		ggtt_ofs = vma->node.base.start;
 
 		for (i = 0; i < ARRAY_SIZE(rot_info->plane); i++)
 			write_ggtt_rotated(bo, ggtt, &ggtt_ofs,
@@ -325,8 +325,8 @@ static void __xe_unpin_fb_vma(struct i915_vma *vma)
 
 	if (vma->dpt)
 		xe_bo_unpin_map_no_vm(vma->dpt);
-	else if (!drm_mm_node_allocated(&vma->bo->ggtt_node) ||
-		 vma->bo->ggtt_node.start != vma->node.start)
+	else if (!drm_mm_node_allocated(&vma->bo->ggtt_node.base) ||
+		 vma->bo->ggtt_node.base.start != vma->node.base.start)
 		xe_ggtt_remove_node(ggtt, &vma->node, false);
 
 	ttm_bo_reserve(&vma->bo->ttm, false, false, NULL);
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 6ed0e1955215..1faef9903b87 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1120,7 +1120,7 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
 
 	xe_assert(xe, list_empty(&ttm_bo->base.gpuva.list));
 
-	if (bo->ggtt_node.size)
+	if (bo->ggtt_node.base.size)
 		xe_ggtt_remove_bo(bo->tile->mem.ggtt, bo);
 
 #ifdef CONFIG_PROC_FS
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 935a94279026..9904b410be37 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -194,9 +194,9 @@ xe_bo_main_addr(struct xe_bo *bo, size_t page_size)
 static inline u32
 xe_bo_ggtt_addr(struct xe_bo *bo)
 {
-	XE_WARN_ON(bo->ggtt_node.size > bo->size);
-	XE_WARN_ON(bo->ggtt_node.start + bo->ggtt_node.size > (1ull << 32));
-	return bo->ggtt_node.start;
+	XE_WARN_ON(bo->ggtt_node.base.size > bo->size);
+	XE_WARN_ON(bo->ggtt_node.base.start + bo->ggtt_node.base.size > (1ull << 32));
+	return bo->ggtt_node.base.start;
 }
 
 int xe_bo_vmap(struct xe_bo *bo);
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index ebc8abf7930a..4b1de9f5be00 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -8,12 +8,13 @@
 
 #include <linux/iosys-map.h>
 
-#include <drm/drm_mm.h>
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_device.h>
 #include <drm/ttm/ttm_execbuf_util.h>
 #include <drm/ttm/ttm_placement.h>
 
+#include "xe_ggtt_types.h"
+
 struct xe_device;
 struct xe_vm;
 
@@ -39,7 +40,7 @@ struct xe_bo {
 	/** @placement: current placement for this BO */
 	struct ttm_placement placement;
 	/** @ggtt_node: GGTT node if this BO is mapped in the GGTT */
-	struct drm_mm_node ggtt_node;
+	struct xe_ggtt_node ggtt_node;
 	/** @vmap: iosys map of this buffer */
 	struct iosys_map vmap;
 	/** @ttm_kmap: TTM bo kmap object for internal use only. Keep off. */
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index cb60bc5ec21b..9f7d46a3260c 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -204,7 +204,7 @@ struct xe_tile {
 			struct xe_memirq memirq;
 
 			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
-			struct drm_mm_node ggtt_balloon[2];
+			struct xe_ggtt_node ggtt_balloon[2];
 		} vf;
 	} sriov;
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index dd5cd0df705c..1cf682d15253 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -351,61 +351,61 @@ static void xe_ggtt_dump_node(struct xe_ggtt *ggtt,
  * @ggtt: the &xe_ggtt where we want to make reservation
  * @start: the starting GGTT address of the reserved region
  * @end: then end GGTT address of the reserved region
- * @node: the &drm_mm_node to hold reserved GGTT node
+ * @node: the &xe_ggtt_node to hold reserved GGTT node
  *
  * Use xe_ggtt_deballoon() to release a reserved GGTT node.
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 end, struct drm_mm_node *node)
+int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 end, struct xe_ggtt_node *node)
 {
 	int err;
 
 	xe_tile_assert(ggtt->tile, start < end);
 	xe_tile_assert(ggtt->tile, IS_ALIGNED(start, XE_PAGE_SIZE));
 	xe_tile_assert(ggtt->tile, IS_ALIGNED(end, XE_PAGE_SIZE));
-	xe_tile_assert(ggtt->tile, !drm_mm_node_allocated(node));
+	xe_tile_assert(ggtt->tile, !drm_mm_node_allocated(&node->base));
 
-	node->color = 0;
-	node->start = start;
-	node->size = end - start;
+	node->base.color = 0;
+	node->base.start = start;
+	node->base.size = end - start;
 
 	mutex_lock(&ggtt->lock);
-	err = drm_mm_reserve_node(&ggtt->mm, node);
+	err = drm_mm_reserve_node(&ggtt->mm, &node->base);
 	mutex_unlock(&ggtt->lock);
 
 	if (xe_gt_WARN(ggtt->tile->primary_gt, err,
 		       "Failed to balloon GGTT %#llx-%#llx (%pe)\n",
-		       node->start, node->start + node->size, ERR_PTR(err)))
+		       node->base.start, node->base.start + node->base.size, ERR_PTR(err)))
 		return err;
 
-	xe_ggtt_dump_node(ggtt, node, "balloon");
+	xe_ggtt_dump_node(ggtt, &node->base, "balloon");
 	return 0;
 }
 
 /**
  * xe_ggtt_deballoon - release a reserved GGTT region
  * @ggtt: the &xe_ggtt where reserved node belongs
- * @node: the &drm_mm_node with reserved GGTT region
+ * @node: the &xe_ggtt_node with reserved GGTT region
  *
  * See xe_ggtt_balloon() for details.
  */
-void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct drm_mm_node *node)
+void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node)
 {
-	if (!drm_mm_node_allocated(node))
+	if (!drm_mm_node_allocated(&node->base))
 		return;
 
-	xe_ggtt_dump_node(ggtt, node, "deballoon");
+	xe_ggtt_dump_node(ggtt, &node->base, "deballoon");
 
 	mutex_lock(&ggtt->lock);
-	drm_mm_remove_node(node);
+	drm_mm_remove_node(&node->base);
 	mutex_unlock(&ggtt->lock);
 }
 
 /**
- * xe_ggtt_insert_special_node_locked - Locked version to insert a &drm_mm_node into the GGTT
+ * xe_ggtt_insert_special_node_locked - Locked version to insert a &xe_ggtt_node into the GGTT
  * @ggtt: the &xe_ggtt where node will be inserted
- * @node: the &drm_mm_node to be inserted
+ * @node: the &xe_ggtt_node to be inserted
  * @size: size of the node
  * @align: alignment constrain of the node
  * @mm_flags: flags to control the node behavior
@@ -414,23 +414,23 @@ void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct drm_mm_node *node)
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt, struct drm_mm_node *node,
+int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 				       u32 size, u32 align, u32 mm_flags)
 {
-	return drm_mm_insert_node_generic(&ggtt->mm, node, size, align, 0,
+	return drm_mm_insert_node_generic(&ggtt->mm, &node->base, size, align, 0,
 					  mm_flags);
 }
 
 /**
- * xe_ggtt_insert_special_node - Insert a &drm_mm_node into the GGTT
+ * xe_ggtt_insert_special_node - Insert a &xe_ggtt_node into the GGTT
  * @ggtt: the &xe_ggtt where node will be inserted
- * @node: the &drm_mm_node to be inserted
+ * @node: the &xe_ggtt_node to be inserted
  * @size: size of the node
  * @align: alignment constrain of the node
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
+int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 				u32 size, u32 align)
 {
 	int ret;
@@ -452,7 +452,7 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
 	u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
 	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[cache_mode];
-	u64 start = bo->ggtt_node.start;
+	u64 start = bo->ggtt_node.base.start;
 	u64 offset, pte;
 
 	for (offset = 0; offset < bo->size; offset += XE_PAGE_SIZE) {
@@ -470,9 +470,9 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
 		alignment = SZ_64K;
 
-	if (XE_WARN_ON(bo->ggtt_node.size)) {
+	if (XE_WARN_ON(bo->ggtt_node.base.size)) {
 		/* Someone's already inserted this BO in the GGTT */
-		xe_tile_assert(ggtt->tile, bo->ggtt_node.size == bo->size);
+		xe_tile_assert(ggtt->tile, bo->ggtt_node.base.size == bo->size);
 		return 0;
 	}
 
@@ -482,7 +482,7 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 
 	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
 	mutex_lock(&ggtt->lock);
-	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node, bo->size,
+	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node.base, bo->size,
 					  alignment, 0, start, end, 0);
 	if (!err)
 		xe_ggtt_map_bo(ggtt, bo);
@@ -523,12 +523,12 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 }
 
 /**
- * xe_ggtt_remove_node - Remove a &drm_mm_node from the GGTT
+ * xe_ggtt_remove_node - Remove a &xe_ggtt_node from the GGTT
  * @ggtt: the &xe_ggtt where node will be removed
- * @node: the &drm_mm_node to be removed
+ * @node: the &xe_ggtt_node to be removed
  * @invalidate: if node needs invalidation upon removal
  */
-void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
+void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 			 bool invalidate)
 {
 	struct xe_device *xe = tile_to_xe(ggtt->tile);
@@ -541,9 +541,9 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 
 	mutex_lock(&ggtt->lock);
 	if (bound)
-		xe_ggtt_clear(ggtt, node->start, node->size);
-	drm_mm_remove_node(node);
-	node->size = 0;
+		xe_ggtt_clear(ggtt, node->base.start, node->base.size);
+	drm_mm_remove_node(&node->base);
+	node->base.size = 0;
 	mutex_unlock(&ggtt->lock);
 
 	if (!bound)
@@ -563,11 +563,11 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
  */
 void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
-	if (XE_WARN_ON(!bo->ggtt_node.size))
+	if (XE_WARN_ON(!bo->ggtt_node.base.size))
 		return;
 
 	/* This BO is not currently in the GGTT */
-	xe_tile_assert(ggtt->tile, bo->ggtt_node.size == bo->size);
+	xe_tile_assert(ggtt->tile, bo->ggtt_node.base.size == bo->size);
 
 	xe_ggtt_remove_node(ggtt, &bo->ggtt_node,
 			    bo->flags & XE_BO_FLAG_GGTT_INVALIDATE);
@@ -602,17 +602,17 @@ static void xe_ggtt_assign_locked(struct xe_ggtt *ggtt, const struct drm_mm_node
 /**
  * xe_ggtt_assign - assign a GGTT region to the VF
  * @ggtt: the &xe_ggtt where the node belongs
- * @node: the &drm_mm_node to update
+ * @node: the &xe_ggtt_node to update
  * @vfid: the VF identifier
  *
  * This function is used by the PF driver to assign a GGTT region to the VF.
  * In addition to PTE's VFID bits 11:2 also PRESENT bit 0 is set as on some
  * platforms VFs can't modify that either.
  */
-void xe_ggtt_assign(struct xe_ggtt *ggtt, const struct drm_mm_node *node, u16 vfid)
+void xe_ggtt_assign(struct xe_ggtt *ggtt, const struct xe_ggtt_node *node, u16 vfid)
 {
 	mutex_lock(&ggtt->lock);
-	xe_ggtt_assign_locked(ggtt, node, vfid);
+	xe_ggtt_assign_locked(ggtt, &node->base, vfid);
 	mutex_unlock(&ggtt->lock);
 }
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 2546bab97507..30a521f7b075 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -13,15 +13,15 @@ struct drm_printer;
 int xe_ggtt_init_early(struct xe_ggtt *ggtt);
 int xe_ggtt_init(struct xe_ggtt *ggtt);
 
-int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 size, struct drm_mm_node *node);
-void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct drm_mm_node *node);
+int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 size, struct xe_ggtt_node *node);
+void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node);
 
-int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
+int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 				u32 size, u32 align);
 int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt,
-				       struct drm_mm_node *node,
+				       struct xe_ggtt_node *node,
 				       u32 size, u32 align, u32 mm_flags);
-void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
+void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 			 bool invalidate);
 void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
 int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
@@ -32,7 +32,7 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
 int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
 
 #ifdef CONFIG_PCI_IOV
-void xe_ggtt_assign(struct xe_ggtt *ggtt, const struct drm_mm_node *node, u16 vfid);
+void xe_ggtt_assign(struct xe_ggtt *ggtt, const struct xe_ggtt_node *node, u16 vfid);
 #endif
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index 154de298a4e3..af312a7d1031 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -49,6 +49,14 @@ struct xe_ggtt {
 	unsigned int access_count;
 };
 
+/**
+ * struct xe_ggtt_node - A node in GGTT
+ */
+struct xe_ggtt_node {
+	/** @base: A drm_mm_node */
+	struct drm_mm_node base;
+};
+
 /**
  * struct xe_ggtt_pt_ops - GGTT Page table operations
  * Which can vary from platform to platform.
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 227527785afd..f107ae550c0f 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -6,6 +6,9 @@
 #include <linux/string_choices.h>
 #include <linux/wordpart.h>
 
+/* FIXME: remove this after encapsulating all drm_mm_node access into xe_ggtt */
+#include <drm/drm_mm.h>
+
 #include "abi/guc_actions_sriov_abi.h"
 #include "abi/guc_klvs_abi.h"
 
@@ -232,14 +235,14 @@ static u32 encode_config_ggtt(u32 *cfg, const struct xe_gt_sriov_config *config)
 {
 	u32 n = 0;
 
-	if (drm_mm_node_allocated(&config->ggtt_region)) {
+	if (drm_mm_node_allocated(&config->ggtt_region.base)) {
 		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_GGTT_START);
-		cfg[n++] = lower_32_bits(config->ggtt_region.start);
-		cfg[n++] = upper_32_bits(config->ggtt_region.start);
+		cfg[n++] = lower_32_bits(config->ggtt_region.base.start);
+		cfg[n++] = upper_32_bits(config->ggtt_region.base.start);
 
 		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_GGTT_SIZE);
-		cfg[n++] = lower_32_bits(config->ggtt_region.size);
-		cfg[n++] = upper_32_bits(config->ggtt_region.size);
+		cfg[n++] = lower_32_bits(config->ggtt_region.base.size);
+		cfg[n++] = upper_32_bits(config->ggtt_region.base.size);
 	}
 
 	return n;
@@ -369,11 +372,11 @@ static int pf_distribute_config_ggtt(struct xe_tile *tile, unsigned int vfid, u6
 	return err ?: err2;
 }
 
-static void pf_release_ggtt(struct xe_tile *tile, struct drm_mm_node *node)
+static void pf_release_ggtt(struct xe_tile *tile, struct xe_ggtt_node *node)
 {
 	struct xe_ggtt *ggtt = tile->mem.ggtt;
 
-	if (drm_mm_node_allocated(node)) {
+	if (drm_mm_node_allocated(&node->base)) {
 		/*
 		 * explicit GGTT PTE assignment to the PF using xe_ggtt_assign()
 		 * is redundant, as PTE will be implicitly re-assigned to PF by
@@ -391,7 +394,7 @@ static void pf_release_vf_config_ggtt(struct xe_gt *gt, struct xe_gt_sriov_confi
 static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
 {
 	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
-	struct drm_mm_node *node = &config->ggtt_region;
+	struct xe_ggtt_node *node = &config->ggtt_region;
 	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_ggtt *ggtt = tile->mem.ggtt;
 	u64 alignment = pf_get_ggtt_alignment(gt);
@@ -403,14 +406,14 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
 
 	size = round_up(size, alignment);
 
-	if (drm_mm_node_allocated(node)) {
+	if (drm_mm_node_allocated(&node->base)) {
 		err = pf_distribute_config_ggtt(tile, vfid, 0, 0);
 		if (unlikely(err))
 			return err;
 
 		pf_release_ggtt(tile, node);
 	}
-	xe_gt_assert(gt, !drm_mm_node_allocated(node));
+	xe_gt_assert(gt, !drm_mm_node_allocated(&node->base));
 
 	if (!size)
 		return 0;
@@ -421,9 +424,9 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
 
 	xe_ggtt_assign(ggtt, node, vfid);
 	xe_gt_sriov_dbg_verbose(gt, "VF%u assigned GGTT %llx-%llx\n",
-				vfid, node->start, node->start + node->size - 1);
+				vfid, node->base.start, node->base.start + node->base.size - 1);
 
-	err = pf_distribute_config_ggtt(gt->tile, vfid, node->start, node->size);
+	err = pf_distribute_config_ggtt(gt->tile, vfid, node->base.start, node->base.size);
 	if (unlikely(err))
 		return err;
 
@@ -433,10 +436,10 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
 static u64 pf_get_vf_config_ggtt(struct xe_gt *gt, unsigned int vfid)
 {
 	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
-	struct drm_mm_node *node = &config->ggtt_region;
+	struct xe_ggtt_node *node = &config->ggtt_region;
 
 	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
-	return drm_mm_node_allocated(node) ? node->size : 0;
+	return drm_mm_node_allocated(&node->base) ? node->base.size : 0;
 }
 
 /**
@@ -2025,13 +2028,13 @@ int xe_gt_sriov_pf_config_print_ggtt(struct xe_gt *gt, struct drm_printer *p)
 
 	for (n = 1; n <= total_vfs; n++) {
 		config = &gt->sriov.pf.vfs[n].config;
-		if (!drm_mm_node_allocated(&config->ggtt_region))
+		if (!drm_mm_node_allocated(&config->ggtt_region.base))
 			continue;
 
-		string_get_size(config->ggtt_region.size, 1, STRING_UNITS_2, buf, sizeof(buf));
+		string_get_size(config->ggtt_region.base.size, 1, STRING_UNITS_2, buf, sizeof(buf));
 		drm_printf(p, "VF%u:\t%#0llx-%#llx\t(%s)\n",
-			   n, config->ggtt_region.start,
-			   config->ggtt_region.start + config->ggtt_region.size - 1, buf);
+			   n, config->ggtt_region.base.start,
+			   config->ggtt_region.base.start + config->ggtt_region.base.size - 1, buf);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
index 7bc66656fcc7..a73d9a4b9e64 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
@@ -6,8 +6,7 @@
 #ifndef _XE_GT_SRIOV_PF_CONFIG_TYPES_H_
 #define _XE_GT_SRIOV_PF_CONFIG_TYPES_H_
 
-#include <drm/drm_mm.h>
-
+#include "xe_ggtt_types.h"
 #include "xe_guc_klv_thresholds_set_types.h"
 
 struct xe_bo;
@@ -19,7 +18,7 @@ struct xe_bo;
  */
 struct xe_gt_sriov_config {
 	/** @ggtt_region: GGTT region assigned to the VF. */
-	struct drm_mm_node ggtt_region;
+	struct xe_ggtt_node ggtt_region;
 	/** @lmem_obj: LMEM allocation for use by the VF. */
 	struct xe_bo *lmem_obj;
 	/** @num_ctxs: number of GuC contexts IDs.  */
-- 
2.46.0

