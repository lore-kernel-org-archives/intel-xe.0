Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1CAE93713
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 20:30:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18AE010E180;
	Thu,  5 Oct 2023 20:30:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C9010E180
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 20:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696537843; x=1728073843;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=/MqGAUGluhBpNdtRVhVnL+8AHsovc1cSDznXF2QRJOk=;
 b=cRX479EvXDjT8YPKbv1/u0BqsKYYE3Sr4gXev9UdMLWUI2jVOWNIBSC/
 R8Hnl6qOSEz0d58m+/BORJEx6+Wbs4R4avOX1hzZsYi1cmWR3UNMu0A0e
 PG/KMaxd3ufG/K77VhVP0IF3Xb6qFI51JoWsqd+evtH1t51IGUCtt+HvC
 VotXWPfNuAHF6xOAwCvzIuOzTHfyKP3neQ/rO8vvEGdgMENCz4fInQPwI
 hH10mUzi4k7ASIaRhWf7s3yyBVfLJt4LOZd/N76eVuBTUF9l27LPZGXnP
 pb7vVkIqm4G9duyh6ZKxGCoz0Ve5mtuGCPq/zK91ZOdfwrAgVb5Ymeea0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="2212052"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="2212052"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 13:30:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="842557211"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="842557211"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Oct 2023 13:30:42 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 13:30:42 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 5 Oct 2023 13:30:42 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 5 Oct 2023 13:30:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SD1kh5Kje1horQsfggNggqb9Xb/pJ2iijPMCAbmwrYgOTOyBPf4tPc7dnpESWohMx2IOtvolryUCbKTjJ7fandsn5u1ZWCDgSwGAW1amgFOWw3wGQ1yNQU7sTld9Wi3lKYSIpe7sjq6LzEjF6DSqkssNpLjBo38viScWKnLNiP4qhZbKrFlKYwQlHRUzYRRd9KSIjzF8z5JIwp7UPCpnkJixrV7Wm5qYQN/u+tMcSMZ7T3uaEGYfqOnRASzPrM0TiIoQye6eikzBfJFIUE94GiJ44YSuj17BLSLOZT7rkw5V+GUGfoNlxGmc/0jGLUinRI+qcWb8wNENqdtNWu//XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2swDduIqnjf7cEjXW+HPoXIXgxbBFjt7NDhB4otFRNk=;
 b=LFLoIud76knU2FtGK1iH+jMcEdfEqCDHOmkEjKuH8z+vk6aYSgxfb2rSGENvVwZg0FBfbXd6b13FyU/Wx3oI33+tSrE6AuJ0fRk3Sxf3o6ggHD2qqZBhksx9sz6jAJEM1V8LR3c51D+LOMvRZRQLmW5D0oyp0vusDRPIguOgno988PM+4u6Ae2uWvr0Sz2SZc4qAlQcaN6OclY+1c2nATlv6+jhjg9zOouAkirVbydms/Lk5rupwVk18rRpaxIf9P+AljRCP89f8FOQ3Ptnh/DOzmOUnOH18ZPiUJnlgxJO7kHs6bHZeHn3VI97D772Z+EJtLs8UXHFFJ+ycC6+GFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6318.namprd11.prod.outlook.com (2603:10b6:930:3e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Thu, 5 Oct
 2023 20:30:35 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 20:30:35 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 5 Oct 2023 16:30:24 -0400
Message-ID: <20231005203029.14849-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0111.namprd05.prod.outlook.com
 (2603:10b6:a03:334::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY5PR11MB6318:EE_
X-MS-Office365-Filtering-Correlation-Id: d0fefd65-ef9f-493e-2d56-08dbc5e1ed9a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: II70tajW//Y6orTJEBMYy5WA99uQj6Kcd0y79D95VmvpjZbLZpQjh0XBicbXnwnXbbSWHB6o21ZXbjfF/06s2Yp63bOP4f6M8Ivx7GNtymO9SD2R91FNoaJjk3gCPY1eQlc4optW8+twOyG0KHMtFsaLW0ov4pwMaTDb2ndALc6CiM3e5KIw+90a/aRIEMUXLeBIIPxUy0zzPQar2y7Sd6P+Epm4RslyLYm2WkKqfkTJ126PVj24KCgKkQ+GUyzAkPbeywH/ArgPEBRX95+V3sZhhR4GdgA1G3qI+LiMQKXw1tZ4WxU2VfIcru60amy3B2wio/flKz1ZAXPHQERalHo55XaOD+lmMtYNQlc2zkFR5vcBf8TreLLKQuYziJWA6nMzGd1huCsWm3YKa/adcTudL1nZXet23xPCjs7IBEdIIBySGFi+SGxn51UULzOEQ58rjiNl37FlPU5ZIEN9Jzi+jME1IDW/hFLBAGKK1CpI5ZlP4qg+Z143R7lGoPj6/ULeL8io19rQzX3mL1Nm6DUo9YZBt39fCKKWSIZ83IDPDWatzdZ4KUwNB65lnM41
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(376002)(396003)(136003)(366004)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(107886003)(1076003)(6486002)(2616005)(316002)(6506007)(6512007)(41300700001)(66946007)(6916009)(54906003)(66476007)(66556008)(44832011)(8676002)(8936002)(4326008)(5660300002)(26005)(6666004)(478600001)(83380400001)(2906002)(36756003)(82960400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xGdPE6lss4/y6Wl6rwlc3d2ZLcaZv7GpwxU1m0MSWb//pGWRdRSEysiIL/lS?=
 =?us-ascii?Q?V3eCSM/XljNsDf7eVbi77P5CNqHt/CpWqv/43FWDphC/gEo1vwdrqZGo1AcG?=
 =?us-ascii?Q?3itice+XWi0Hw2QxztKZSb+axNOKHhF32cAgv07nB2DhsdUT/rHFjiuZYetv?=
 =?us-ascii?Q?F/1WoXX2rN4c+udzGapSAPwDCaBBsiIF4u0UR13mDx2c1xWnU8HCWxkO1RQU?=
 =?us-ascii?Q?bHOIQz5YmBhHAV0sw+NljZGnx47k9/5Gkv4N6SkPJRF3QR1qZWCsooz1PPdL?=
 =?us-ascii?Q?c7P1uaF30QqKJP9/ydpFkoq3x51qkBTRypolvTbcmiymeC6wJN3TpqOXR0h3?=
 =?us-ascii?Q?+1OBAIBuPU0Eg9l/7S2L4Y/vTU3ycc9A++zkg1HkA0jB8RO/4VAoliEC6Zut?=
 =?us-ascii?Q?mCCSskvUlQlKuksoQNlk3kuTW0N5BRvH8/y/L+CMIcRsVM9YvHSFmLnhxL7u?=
 =?us-ascii?Q?NMOF4orxwKaoOvxBVlSw8V0e+JzYkHL6OpHw79JCPunQNo4e59g5Fu1sUmAh?=
 =?us-ascii?Q?A3WXx0hXQjiaw4JWi8KRWdHFex38+Rx+kzT7ZPDWuoEHBoaujkdhoHA7xYZX?=
 =?us-ascii?Q?kxcXEvOnGr1RyXnaFRdBAa9lBCUk1CJGhcOWe12cswStksROD3hJ6DJfXlFM?=
 =?us-ascii?Q?KiToBWqr8Q16J/WUPp7/eJqE1mOe+FX7kMrqy/Dt6Kauvyeb6vDHiMbAZHX9?=
 =?us-ascii?Q?nrvt6JeFpf8Ieg2Mqxprfxa4o5tRCx52y5+7wc4XkH8WSoI/VGR8xBIYs4OQ?=
 =?us-ascii?Q?l1E3trED9jAzpfGGwDaYcr+BQsN7A34jjVTlJ8u35S88vKsKnYE1aWUuGjC5?=
 =?us-ascii?Q?iiR4J/1BRK/OhE7SV5mt8E8Jj5VypyMq32g7UA9KE+/IpMpPckq7f0FlSSpP?=
 =?us-ascii?Q?0PyBlX+pgJXgM8ab4sFl5HVZYMHHgRWXp4K+jJzIkCX4G0pGY8wnZ/GWiivn?=
 =?us-ascii?Q?UqDk0KPB6OceXEA0WvysKDKePLiQAksCd+6beVHgjdt2WvM5xWTVHL2omM3r?=
 =?us-ascii?Q?KZydMsGC76zH6yH1mt9pATIFtot+RXYMy5ObljhiQxGV34Zmnu3IN/wJ4jdw?=
 =?us-ascii?Q?Mlhto40WU2mrW+94gD2KyjidXqxjJOKABSJB0NkCmc3boTUA5lq+Pw4ZgZ1x?=
 =?us-ascii?Q?rSv7b+mQ5mArM+iMBEy30M7LxCFRKzjkIPfuu1ILIFRbo23loWhZxGEJMfzq?=
 =?us-ascii?Q?6OY+9gjd6NZLTJoA54I/KdIZO8xM91yifcDFl1xH1PebE/+GeNltZwr/sAnH?=
 =?us-ascii?Q?ZnejKh/9QSNOWBAi8m7vLrzG3jS6SZF5aTJH1YKKg8sQr6qJPjVrT65wumXq?=
 =?us-ascii?Q?kj41/Y8+8y3ykya4wSI42vValBT/PFUcCugD3w/z7hLzHwYop/AnK2Rs16tV?=
 =?us-ascii?Q?Sesz6mRaM/d3Vb1DFFkgdcKd1VktyMiZ1g1IKPTIvV8KSaMebIJ7qjGX9Q8k?=
 =?us-ascii?Q?WOJu2/oFHmXQBIxSwSsyDNOalz9vR+yteIHzpl0UAHogIhrI4cRGoU06m5Tz?=
 =?us-ascii?Q?7cfVlmIc4JeX/2pYutTbvGl2Zq/fKVeiuI7bymezaGkBer7wJJ2lMLFxcwya?=
 =?us-ascii?Q?xOdn+RBQa26Ut80jQqBBadCI2WU6xz/JZTX5/9IrdZW+21yvDsBIhh7RNBrN?=
 =?us-ascii?Q?gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d0fefd65-ef9f-493e-2d56-08dbc5e1ed9a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 20:30:35.2004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yGHZ7KWEKe2RIR8zAVW6+0P+ium2h+lhGRHrIc3tWu+QcqlvbvNYQ5Jw7YQjpsX9AWwiuGVLkLr4mI8mDG+fhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6318
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [CI 1/6] drm/xe: add 28-bit address support in struct
 xe_reg
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

Xe driver currently supports 22-bit addresses for MMIO access.
Future platforms will have additional MMIO extension with
larger address spaces, and to access them, the driver will
have to support wider address representation.
Please note that while the XE_REG macro is used for MMIO access,
XE_REG_EXT macro will be used for MMIO-extension access.

Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
Reviewed-by: Ofir Bitton <obitton@habana.ai>
Reviewed-by: Moti Haimovski <mhaimovski@habana.ai>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_reg_defs.h | 16 +++++++++++++++-
 drivers/gpu/drm/xe/xe_device_types.h  | 13 +++++++++++++
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
index 557a1cd65531..6e20fc2de9ff 100644
--- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
+++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
@@ -19,7 +19,7 @@ struct xe_reg {
 	union {
 		struct {
 			/** @addr: address */
-			u32 addr:22;
+			u32 addr:28;
 			/**
 			 * @masked: register is "masked", with upper 16bits used
 			 * to identify the bits that are updated on the lower
@@ -35,6 +35,10 @@ struct xe_reg {
 			 * value can inspect it.
 			 */
 			u32 mcr:1;
+			/**
+			 * @ext: access MMIO extension space for current register.
+			 */
+			u32 ext:1;
 		};
 		/** @raw: Raw value with both address and options */
 		u32 raw;
@@ -84,6 +88,16 @@ struct xe_reg_mcr {
  */
 #define XE_REG(r_, ...)		((const struct xe_reg)XE_REG_INITIALIZER(r_, ##__VA_ARGS__))
 
+/**
+ * XE_REG_EXT - Create a struct xe_reg from extension offset and additional
+ * flags
+ * @r_: Register extension offset
+ * @...: Additional options like access mode. See struct xe_reg for available
+ *       options.
+ */
+#define XE_REG_EXT(r_, ...)	\
+	((const struct xe_reg)XE_REG_INITIALIZER(r_, ##__VA_ARGS__, .ext = 1))
+
 /**
  * XE_REG_MCR - Create a struct xe_reg_mcr from offset and additional flags
  * @r_: Register offset
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 7abfab0261a8..335018d29829 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -146,6 +146,19 @@ struct xe_tile {
 		void *regs;
 	} mmio;
 
+	/**
+	 * @mmio_ext: MMIO-extension info for a tile.
+	 *
+	 * Each tile has its own additional 256MB (28-bit) MMIO-extension space.
+	 */
+	struct {
+		/** @size: size of tile's additional MMIO-extension space */
+		size_t size;
+
+		/** @regs: pointer to tile's additional MMIO-extension space */
+		void *regs;
+	} mmio_ext;
+
 	/** @mem: memory management info for tile */
 	struct {
 		/**
-- 
2.41.0

