Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C8A4E93715
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 20:31:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 063F610E496;
	Thu,  5 Oct 2023 20:31:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4897710E180
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 20:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696537901; x=1728073901;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=xG67Ke86i/OalNJ9LIYbI+EkjzYehS3iyy4UMIjrcx4=;
 b=blb/qECe4PzPcXogN5T9T88k1Fkx7cFbZ/Kx0JSwxI8Ch4B7ndZsiAq4
 7HWIcy6tBEyFHPnef3gtvPikeCOiqoLtg45ypXTJK6Ur06j8R/t8amb2E
 VeQsk0z+GFYhKi3o6rnUvOvfPoJDwKa7YK+lswUjlMAL2ETA8VBxOeCzQ
 t83yKV4EkmU1peTKOSu4pwu9VRmsiTSfpiTYop6ddvPXU7cZSlHIaQ3l0
 mSiBnlUedWjFWox+1+J6cY0n5NowzUbbN2ZAbNIk+WhzzS/fkQgWQ/lbQ
 jZiyiLtKoN+ldMCj+nNT24ZwKcAhtHRS+ssvCES0b+Wse50OKZjNSqkoC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="383505750"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="383505750"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 13:31:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="755610005"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="755610005"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Oct 2023 13:31:41 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 13:31:40 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 5 Oct 2023 13:31:40 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 5 Oct 2023 13:31:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZL1aaKICuyy7qTO4+bj4/P/xf5nEvGY8yIFFH7ZCPoTgiUecrDBIPCK7XijaTgDQYr6WKjdacXP5wQrK2Qw3T64Ex79ZDvEDStXNZZaBg2scA6hCvzbwC/I2XB8YPPLHQjiy5Swp+ycWXEmlCyYQu1+TuZnQBsu06AT+Hnwl/dFYWYQcttr19vMjPMeYqtJ8ib+6TFS87iZEv68vaxPJcKwMswTAMANPVB2ujY+hcz1gp3nfDOmXPJuw67bujA5eLzZjbc4R5mbyZ/2UzPcuBUR0GmdnMF7ojp2HYms9us5xVYjQik71iPa0vOkmz9Fe6o+9bPKb/UTpUyKdXbLRHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aaPro6p+ltIqX+eJrhe1Hy3Gr+UsZqTssxwf2TBMwDs=;
 b=gD0QTJhDMtcBFPh81Y5UETAcG4HRApbqFKvNbUjZybO3qltrqF7SBlcbWiG50EIvPmTGyKlH5nQNlD7A+6UmfZxXVGcBbBjHu/mOfDfYzNLlPwqOViXJ2Dg3I1eo+X6Ysuw3pjFcPtMBdn6GAoFIWa/xYdT2S4vm5GrzTm+tmg0waeBuwDjAIKQSOAM7OyZhTUrPjRYegBHskDp6ah8mNP1kmcnzAdAcTxqxQci4qPyrvbrW7jpq0bbzT1zZDG+x4mIsHTFIVhGn/+j2uneqY8a1pG6uXIlkR3/zl5JKjnJvWIZjzXCxEqdTrXohskMkcqtupaoaEV3zgRDig8lgtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6318.namprd11.prod.outlook.com (2603:10b6:930:3e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Thu, 5 Oct
 2023 20:30:47 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 20:30:47 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 5 Oct 2023 16:30:27 -0400
Message-ID: <20231005203029.14849-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231005203029.14849-1-rodrigo.vivi@intel.com>
References: <20231005203029.14849-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:a03:254::31) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY5PR11MB6318:EE_
X-MS-Office365-Filtering-Correlation-Id: c6d20d59-35d7-4915-f4d7-08dbc5e1f511
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rif4XOJVqwSnI92x6Sa36wCufF5KLEbMBe0yN7m1pI2LGI/9Qor7Wp3y3/us6Ea0i670ccCdp/TOEGvslnrgklhGt+jcoOpyB5WqXM2KttrHbgX3HE11KoyEPpl2WyLOq1rT30vP4TOdxVbre27jgwjcjZE4j2fXDxyg53B4mJgDalhpJLzesn9T1OurThWZUdW4WQD1A7/XzOY7F78lBe1btgTMpror1En8SEAAtWodE1cbz6nTBnK6JSoktsr79OYzr//bV70gU6WaLl7m9iuGYXNtL0kRjQPDuYvha8oXHrXr6YVnoLeUNhVqlzeR/m1WGRTIfjYLMtwl/yyUtLCcMJ3swIJjfSz8YpzzjXeabqIU3BX7VLVKk6WFjuRQK+MPoEBkrFIslTtro8mZ55A1AHgYYftPH4iU0T/XEYtzFtUHzqCZzPFuTO/z0cp8FmpmcBe5fUwnxfg162hwmj8SKxQLArjeoCDwgk6dbz8d4GUglVMmqBaVUatZNLZ2GGbjEBsJ+irh29YoqWe8/gxJQnj3J43pV/DWgdbdy2h/mOFl81+ofEkjHvT8/gJV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(376002)(396003)(136003)(366004)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(107886003)(1076003)(6486002)(2616005)(316002)(6506007)(6512007)(41300700001)(66946007)(6916009)(54906003)(66476007)(66556008)(44832011)(8676002)(8936002)(4326008)(5660300002)(26005)(6666004)(478600001)(83380400001)(2906002)(36756003)(82960400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EOqhJxSKze1gvhXXEnFptailMVWlMXE2MJzJCL3MTGJrypUCXXiQPmCKurFg?=
 =?us-ascii?Q?GjRJE1fW8i6jgQS6RCNf8CbrO3igrpAyGk8U1ok3xmTBJx1t+/RY/9lL7V0Q?=
 =?us-ascii?Q?E0n6EpXkiopjJSnSSA9BdxBvRGItXpEw8mY9ObG059IAxrdvy+/bdl8iK6ki?=
 =?us-ascii?Q?zIOWTLMFRoVGeV9QptKIz4TsUBpE1jq4BUyPYYmw4UXiBO5VdHoF4jq4L3Qh?=
 =?us-ascii?Q?FwfWrsNh1zNylCl2J4NO6hDY+VmjJ4Uv3g5BKnjoXVaZbo+8r5JYCPYn/icS?=
 =?us-ascii?Q?RnjOfN9BglqkoaIGOuTwXCZf4FWeB6IXVa3gVVX6/mk9+HzmNOWi/aSJoh7p?=
 =?us-ascii?Q?9WHLGlTObc6WBNcQElfHMMMi1n9ab6cwwDpy/Jt9Ff/rwrP1F5r6vM/AnLXr?=
 =?us-ascii?Q?FJjLJr3D8CW06Fz7xL7fq3yrDHsfAlj2kkmizEuchJZelZxsuyigOVKWKLWh?=
 =?us-ascii?Q?NKc84LyBls7BrpzPMv/PZWz95wfpGTnyU1rU9JTAr7PwzVUWTlpzBlSAXUDA?=
 =?us-ascii?Q?vgN32wI7Fcw09HIJ8BDdbGX8URT4MEykOo7DxnHotisfOtwwx/AO15AQAnxZ?=
 =?us-ascii?Q?WCkINL0clNKNFBVAcyBrU/p43i7bopT7kzSaY+FoxHu+NWSQoXz1veDVc5LN?=
 =?us-ascii?Q?+eTLIRQ4Wx/QSuoRtdgFji88EYi8h0Xy9v8AD3s0LtTtm1r3V/gKWHusQMR2?=
 =?us-ascii?Q?Q2hUSI0ytNUmYIAuHDuMQRPLWomJ1+SPy8jU8D7CsuGihghB7h+HAzKr0LUQ?=
 =?us-ascii?Q?qrm1XAFtgHig49LxrJDsa4LIvF6NpTOjbuBUPJu3fAvDpUVSawZKNQgDF3G6?=
 =?us-ascii?Q?GEDSgsR60E77fRhgKmL0Gk74TiXmDSywFyWwwFDvh/1gWG1Awv98wT8YdD+y?=
 =?us-ascii?Q?H56qZXXIGrm5guy+9SmPK8nCjAkewJMqeAynS7KF+IP0kcZP7QcFYhYu5DNV?=
 =?us-ascii?Q?uOh9uN17Ra1RyaAzADAYmd3+L5wNkoLo80BGThf7n+F4XzkVGUVu8lU9MLO+?=
 =?us-ascii?Q?ZqXooxFMTaVX+wb3IjNzGwzvsyFU6mdJpmmx4sS/fNQlrQHa6E55sH5oLGIy?=
 =?us-ascii?Q?ugPcfq5ieM7/E3a0kjxA9V2Gq9SUvRTXDSrEBQHMeKP/IcE9p4WYCCaIwPTC?=
 =?us-ascii?Q?Sn5Vwxye4VE51QZdLDd5jLR0+a+5P4gr5crRxIo9R5Ft8Dj4f91CTad0owj7?=
 =?us-ascii?Q?J/atdS4M6uLo3htTt+eZrRNf44VWbIPwc403yKfzxnj5SojnQCmYv7LGlVek?=
 =?us-ascii?Q?yDoUPqv2IJPMcPRLKxOeGgvzWoYM4SpqIUREyIHdy3W7X844rHlQs3Yw0TGC?=
 =?us-ascii?Q?7kt305+F++FPOIwlXFlQcqDsFiB7GN2vZ3J2gkUQLzLycuY9vWSlAFCP43vY?=
 =?us-ascii?Q?+/uE6aSDQuEPiFM1jriY6W39SMkW74ICb0tgT/TPoCoJcuGataKNbqwmtBc0?=
 =?us-ascii?Q?b/ehsTnq1VkrzVPcqYqMVXjSiwrSQvG2oCsTBjzbBH59wi4FlI72fzo86jIi?=
 =?us-ascii?Q?3svyhBbOggXfwldciUucVm3IY7CtMT7UKAdYrAwyh8J4mdoOrSj7B6uLFbQc?=
 =?us-ascii?Q?Xp7c0I+zpRL/SjdFpCi3/CaMeeXskfOzauy9yspPWYRmIdvdocfoHFVCLk83?=
 =?us-ascii?Q?lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c6d20d59-35d7-4915-f4d7-08dbc5e1f511
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 20:30:47.5714 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UsjcQqw9BI2mulN9UjQhH7HXlffUcjZfGOcCRDy3wZ+vAoijDMzX9E6wChSQb1Nsd6k2eG94wKBAMS/pKlJX0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6318
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
index bbc8296e9f13..0efa7a1d2188 100644
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

