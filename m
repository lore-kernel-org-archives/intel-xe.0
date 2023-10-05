Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA22E92706
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 15:09:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF8A10E422;
	Thu,  5 Oct 2023 15:09:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F0B010E420
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 15:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696518555; x=1728054555;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=uyCYQvFuLdH/kFRLJ8v+EqpuWAl2fkLG3AcDl2fj2Iw=;
 b=NQxxtCUB/awc8ECCUlwvzW9uIle34e3HCG6O8z9KF+Z5LvLIQBf2pvEk
 rEqkLfWw/Lg9LuQj2CIY2xjr2eFrWaz1mX72PZ5AFgQMRd+9m4/b/6QIo
 9vwRsnmQzi/jl0lf2JpBOfHsj0qI7qVuNiRoIV1g7tjmlGJPQnBeZOZk+
 st6DmkpeJUwtHBJXhgz2m/6+qOWuC96kxqJewljVkLAxEKIrpt0qW4uRZ
 GdqjGJea0eeYOhL5qhNbqrj7hSBdESqpYEHKnA2dCw4jtUodDcH07nrzC
 rgFMpEFCD+gtM0CG5uLLtG4gJGoe0lfjWyhydHK5fBMpgsOuwV/dXr0kM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="386354143"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="386354143"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 08:06:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="875579257"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="875579257"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Oct 2023 08:06:48 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 08:06:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 08:06:47 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 5 Oct 2023 08:06:47 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 5 Oct 2023 08:06:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ib7d0NeT5HLJG2Vf4t0vI3oV+tV0UT533HhX7B7Ff/B+ff7yTZeM7dAsA2AVn6b4xJxZ0VXseG6oQYblEQd8E/VOtIpNQ6ku9jtFvAO5wqYVsa5kKtAntJgzSodj7mrPBmtl4d5gRZ3iqx4eaPDNxLIYRg/JZLQD8X/6JKwa5Ga4cgczRv168gX8fb1hMeOl2aP1oZoRrguSra/b9B8uUYXpTfF4mhVo0QEhMtOKYqK2UqPNUNS4ufqOSzO1uAZ8CthnkrstsRdpeyeCN09ZmccLM9hbDvk0vTjP+Zw1tFVEXY1KWmDQQ7RZmBHHUA21jMw7ZXBy4yMjXpQe4CxClQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pmlmA9ky/PfJC2C5hx9senhouC35SIrifWd6CMoTVzs=;
 b=D/vBS/hdwWjSfmkNqTjTjZo9peG9gTIQYkCRzPPM/4njevlOvHO9n7FMtTmKbIDLrLvREkGPqY5ulhe4x2yRVfNtg7HlqWsUca5PLvrkghV2vHV4Ax9fVPxcpECyNtnHtRwm/UWb/zcFtl/f9M8CQWV+pcb1t+gYAaLfrTvZ2EzhGGHJUbRtjkUca3UnnHQ8rxgXMFk7aCPKNd4rBT/NatbVUQOAPmGg8XTyyYI7GPRtst4lYFVAWFtNkR0SxHyl1NfipsE3K5/hPQNbHVURPkjydZVRFopdkJlvYgpuJxqJTIPb/jtjc9k4KDtpiLsxu1kBA7dpCW0+0nMrAbSZIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ2PR11MB7576.namprd11.prod.outlook.com (2603:10b6:a03:4c9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.31; Thu, 5 Oct
 2023 15:06:44 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 15:06:44 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 5 Oct 2023 11:06:17 -0400
Message-ID: <20231005150619.9521-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231005150619.9521-1-rodrigo.vivi@intel.com>
References: <20231005150619.9521-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0112.namprd04.prod.outlook.com
 (2603:10b6:303:83::27) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ2PR11MB7576:EE_
X-MS-Office365-Filtering-Correlation-Id: 086dee7e-c296-475e-5839-08dbc5b4b006
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mt28f6beYq8ac41AY5MJYRWVQ7tpMfPUKzHE2KwC1O2Sbxal641aWfd5juerYlmdCFNTO09sbTN9WtSuLdDCSxvc4xPghLheDzdT19OEYl5/1bIqNs4/Twc9SG8LeRzvWZYBUUg3Vuul66KnmtXhVRbU4m+ReWzV556HedGFexsMMY6HbpU69289+XPqNW8SgftDtqVnEPGMPqNBJ/TQxal23C3DoKZIZViMdVBXa3cCAqNoFsq2r7SmPmQv5jx3rsZ0QpCeC9kLkltzEufxnP0vBIO8nZ8+fUTZkmv7oQrZDpSckMXxEGgpbwnhdQPjDXRwjUG2W7luQV2nqW+7z21jnFZKiqIZwjymeBmKQxjAiKOGx4cno8WxcKe8ndndYLWx6+vmhLg3czlPaXwLIPjlvdbEFnIN/m3zybAIz6V9hx/JJVBgB7LUnZGIu1BuDtfDf5Ip6QKJXkpaI39+uJsg+DI2O9YkfjivjHLuKP0hNx95X4j6xBsFacJHFBEIxtn5WBY/wBRtD4Bv/jtzXS1+7FT2ky8NKoc6z3RLNrpFIv8LTSnxiagEp5euAcoj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(39860400002)(366004)(346002)(396003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(83380400001)(66476007)(6916009)(66556008)(316002)(1076003)(107886003)(54906003)(26005)(66946007)(6666004)(6512007)(36756003)(2616005)(6506007)(38100700002)(86362001)(82960400001)(478600001)(6486002)(2906002)(8676002)(41300700001)(8936002)(4326008)(44832011)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W4beU+jvV+qa9Eno4PWmTXY2uuWb2DZCZw1wNiZu8LIqJunMx/WRW7kCcyMB?=
 =?us-ascii?Q?ikRoGydbP3JPWyku3dsS37WUgV6FkxOkO5HABv0KjxNgJXn/EPOnjEIJMBPp?=
 =?us-ascii?Q?7GQTu+s14WHzkB4nQ7m/9Q/5XD47bL4vvBchDLGMGIp02fVTVmefzAd/jjzU?=
 =?us-ascii?Q?piA28aj+eFiQqt5z9qsHAFyvCXvj5lL41cSU56jG3mEwDuMNZmXC1aYjeyv5?=
 =?us-ascii?Q?7Ter2d0zY4G27nMsCPuyBQmCZAuNpSvGj+4Yc1B2FOKvuhjoxiSciYUd0apS?=
 =?us-ascii?Q?CdvorFwH6SWGFXPQbclzaX6mspmKm0cjtTU5OH5mIKPOwJ1DTKNq6c9kCpTT?=
 =?us-ascii?Q?YeqQoHaLzNNNq7aE4HhknKN8ioAYQdcBIb606S9QRqfNTPFDxIbp5TR1RxLv?=
 =?us-ascii?Q?ainY872DflL7D2b260Y0AswX9WuP0eEm9KpeUdC9wVv8g5fnyubkU9wiBuqj?=
 =?us-ascii?Q?dARBcOLI7XxADTEka5OuwVup+0t67cA7eOPpsDePiJtZiVxBhkj1okoXPBqb?=
 =?us-ascii?Q?+EB0gYcJg8hEuPkX2UVmrR9psSf9TT2GjuOsxGyH/3QApbzYP9lBioQ2sb4j?=
 =?us-ascii?Q?wVw5tM8wtGsizLqcurfqVlfFySkEYol4kwBu1QvQthf3hhJTODEklln9T/1J?=
 =?us-ascii?Q?dcuR5Tx05O83fACOLPOR9O8bpC821lSK70zpysUpdtjtTPJ/1HkZswK8/jZI?=
 =?us-ascii?Q?/JV2Uqw2KrpBkb328twFD8p6DWoF+Wck88BEcx2GBitUS8Acivq5Cl0cQf3p?=
 =?us-ascii?Q?M3YG9CcoPD2rDBGMqIUD92fYW8EuZ3MppMyw+XK6ggLjDvfrF0rGVxOazQ7Y?=
 =?us-ascii?Q?c3V9y2vJT4vkikF+qOgLgkhAoSk568+L1i615a2u4ys/wuXd+snwEnrX+mAQ?=
 =?us-ascii?Q?L3g5Miz0AB5FNU/mju7sg0kiDJ7nNz/GMX1enn9hqKpNmQJ+KN+5fId3bobi?=
 =?us-ascii?Q?+gPBn8QVvQ1aSSxlsR6IpIYAmXdOapqdYrkRlgNVyT/pSaW3EdFqwCf0LDyo?=
 =?us-ascii?Q?+iK2A9OA7TfMzxt3hazR+IGlMcHjctJNHn9qhuhsHLCB0G3bU17xd8GBbHIk?=
 =?us-ascii?Q?O5R3Ywxo1odw3egVdWysqoAOwK78o3KAL419WuzxfMFXpR8YqEnxYvRaWq7v?=
 =?us-ascii?Q?IkLBGdnof/PtwMyJX326RXWGNUqvgz0qxU7P1WoR6rV4xubr/tCChU6ZWOdO?=
 =?us-ascii?Q?vEExw7OIFby96mvclnvOdDf7/b5EGPXKil9Y7BTAJrDK4T9nR6noJ2gwa0oY?=
 =?us-ascii?Q?yk0zp57I8ZVktAvexgVI5WYIOommGC3WydbTeBOGLqTxVSWs9k2wDIndjigu?=
 =?us-ascii?Q?AxrBhrsh2umbdzSLlEy+e3vvgDRGkaB9ObI9kczObH0W3gJcXOK+ffQblQ+C?=
 =?us-ascii?Q?C/wg36PyTGE3+XnwFkTZwrjW2jXbvOicq9rQsiEdYJBVVxqVwgvWUNNOa+25?=
 =?us-ascii?Q?tWa3uE0sBQ1Tcq2wVZ2p/H1O2ANjXHIfeT2jRsxg1JD3dKmr84kvLwThHi5Z?=
 =?us-ascii?Q?S+NVOb38KLVCVix04NGfBgGXSEWHvbWktBxnG9Zu/rVAmw24dV6kwEZKmteP?=
 =?us-ascii?Q?jRD7Td4ij/CB5eROWlixVHh7qPT5sojjfqIdy05rnf8oIoul5cdS4tQGwPZ5?=
 =?us-ascii?Q?gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 086dee7e-c296-475e-5839-08dbc5b4b006
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 15:06:44.4205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8QZoCCrX0R0w2xGy/lE1bW/LNB6kxDoJrz7byT4xLQ0y2vRfJTh54yjPrHCcZjBnZdPDJoWjHmTkqPIoox1vgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7576
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [CI 4/6] drm/xe: add MMIO extension support flags
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
Cc: Moti
 Haimovski <mhaimovski@habana.ai>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Koby Elbaz <kelbaz@habana.ai>

Besides the regular MMIO space that exists by default, MMIO
extension support & MMIO extension tile size should both be
defined per device, and updated from the device's descriptor.

Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
Reviewed-by: Ofir Bitton <obitton@habana.ai>
Reviewed-by: Moti Haimovski <mhaimovski@habana.ai>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 4 ++++
 drivers/gpu/drm/xe/xe_pci.c          | 3 +++
 drivers/gpu/drm/xe/xe_pci_types.h    | 2 ++
 3 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 7d816a5df1fd..416009f4e80b 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -206,6 +206,8 @@ struct xe_device {
 		const char *graphics_name;
 		/** @media_name: media IP name */
 		const char *media_name;
+		/** @tile_mmio_ext_size: size of MMIO extension space, per-tile */
+		u32 tile_mmio_ext_size;
 		/** @graphics_verx100: graphics IP version */
 		u32 graphics_verx100;
 		/** @media_verx100: media IP version */
@@ -253,6 +255,8 @@ struct xe_device {
 		u8 enable_display:1;
 		/** @bypass_mtcfg: Bypass Multi-Tile configuration from MTCFG register */
 		u8 bypass_mtcfg:1;
+		/** @supports_mmio_ext: supports MMIO extension/s */
+		u8 supports_mmio_ext:1;
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 		const struct intel_display_device_info *display;
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 1a57bef75b6a..72f5f170b156 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -60,6 +60,7 @@ struct xe_device_desc {
 
 	u8 has_llc:1;
 	u8 bypass_mtcfg:1;
+	u8 supports_mmio_ext:1;
 };
 
 __diag_push();
@@ -566,6 +567,8 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.media_name = media_desc ? media_desc->name : "none";
 	xe->info.has_llc = desc->has_llc;
 	xe->info.bypass_mtcfg = desc->bypass_mtcfg;
+	xe->info.supports_mmio_ext = desc->supports_mmio_ext;
+	xe->info.tile_mmio_ext_size = graphics_desc->tile_mmio_ext_size;
 
 	xe->info.dma_mask_size = graphics_desc->dma_mask_size;
 	xe->info.vram_flags = graphics_desc->vram_flags;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index bd0b0d87413e..dd3546ba6f90 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -20,6 +20,8 @@ struct xe_graphics_desc {
 
 	u64 hw_engine_mask;	/* hardware engines provided by graphics IP */
 
+	u32 tile_mmio_ext_size; /* size of MMIO extension space, per-tile */
+
 	u8 max_remote_tiles:2;
 
 	u8 has_asid:1;
-- 
2.41.0

