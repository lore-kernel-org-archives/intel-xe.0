Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB14E92707
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 15:07:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A4E810E41E;
	Thu,  5 Oct 2023 15:07:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5409610E150
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 15:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696518459; x=1728054459;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=2dJ+DebT/pszrUEOeYayuPVFHCJ6OLIPKYcjdfXYTG4=;
 b=jkg0bF6NiGQ9M+sXY3o4tEfS6g77zshaJ1sOLbHsCFtElXiD1AnVGPgi
 qq7hQCwryH51LFcnNnn7UuELKrd/cc42H2xV47ST90i8FGO5wPhvUEeIE
 MEQCP0rMLr+OWMNZvoZQAZ9arQBPl/Z29+F4mQPZcpjJ6OxyBJOuMVR+y
 Eaiu0+Yc+MRf5LwMo9zHPhvIQrz/9o38h2NyZOdo3loKvRqYMEVoE/nLP
 fdxTLDvFhdVdp9y59dAiJZazX2WRReQ6tB9tjWhCE1TH5bxHZvC/+lsqm
 +lSv8RO8V2IJ5B60l8fkSsdWOQtsqVozRzU+Cny9mkqLe7s215ybFGz7E w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="380802949"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="380802949"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 08:06:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="781282977"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="781282977"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Oct 2023 08:06:31 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 08:06:31 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 08:06:31 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 5 Oct 2023 08:06:31 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 5 Oct 2023 08:06:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BDcb19DULbOGlRY+gUburidRcFT1hg32xRWTmdM7XaJBq/F9K4YX+ovwWqZMmStOhcA9CTuPKbZu/gyy6BGG1ub9qGWxo8NusAB7dleZuIFCKojk2uiTpaSnsaOk2/M8BRyxqC52xawfHLzc2/TvlPrBlZOMKpqYjU/lZeBo14mXYReiAdTkUUsss31U91xIjxooymkY/jrc9djymZZm5o7i73lupt5E2HwXeMIIM5puwOp8dX6759YEVZjkJyasnEOhBBRHIw5eDGbV/XHe+V0gFboY1hbKc24+pkReTYsxbk2YfNp2ROOKSAN68YMi0b6idgax2G30R3g7CMC08w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EXX56heWCDf56kl3CdNUg2qonFF1mGYct9umzB/xWaw=;
 b=T8xkwx7on+60PJN0eACY00iAlgFjIDCvCEksS8oFC/9eopYuB6qm7kphgNoqyxPJ5nDL21/GHqHMF2Ot5v6iLTMqY4RhyiHkpg/1jaiEte/BS7LA4fmEVK2G7RF3RijCoIbbv+A9vFjYecwiet59RrnH8uH/UOcrVxZXUR1TG5sbfay4zX8eD38GEIR/Zr0c8kHTxEyQPjI4BRw2GHZvlP6h/7acfKdG+X/MUfq3UV+YmetMymhFMcDRMb8gBKkRQISTYkInpT9beyaApnHsEKEs+7jjSVGjVMHusHpLTfaP8driSto/y64O9skyk5bukVpvnqbIi3qixhIU2y8D+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ2PR11MB7576.namprd11.prod.outlook.com (2603:10b6:a03:4c9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.31; Thu, 5 Oct
 2023 15:06:28 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 15:06:28 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 5 Oct 2023 11:06:14 -0400
Message-ID: <20231005150619.9521-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0133.namprd04.prod.outlook.com
 (2603:10b6:303:84::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ2PR11MB7576:EE_
X-MS-Office365-Filtering-Correlation-Id: 237556b1-1db9-429d-8e03-08dbc5b4a627
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jz7YjPwl99FnOUYnuGRYTrlD/ZD2hj/ssm6No0y9kq8INY7Qbd9Udr3c5HdNr+dY8C+Qv7uORVOhduql2q1fe0kdjj8NALm8/s/1RxkyUO0DQ8PEa/OdzaTVzIIUwM4QeoflT+uLVYI0wPH6hADjc38ZSEh0MOC1OwlbITmbXNUKa0ativ2/mZKs/xlKuuL6ulSDEFsLce02pVJS6Z4ReFb2af3fLkrlfrOt6RbEAsdTuuqwUy4Ca1J/FJdLDsmD0dK7iUsGdTfL+5o5vTQ2vJS8QSxagtPOrYgn9tKomu7uYjdLatV12nBHpLpufxbpNdkxDgHY2WGX9ntaCCYhoa3rOlaSntah3XlktJ/VPPemp9P14Txukhdb9U0tIF82drRwZ6vNvAbAmL3Uv62we6LgRU/M1v9eFHP7+kQU8k5LCd/X+//ynfQNg8nDz058NCIYbCUlB7DYTda383bchvo0zEbOTrg9rDOdoSP/Tcr6VmkK+7W6xIf9R3QAoEBCZRjKR15zKmxOp0Xukz/gi2tH3D8aCkb7cN0PtMXGJK00eC7AomLQHkKKNkBrb8iE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(39860400002)(366004)(346002)(396003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(83380400001)(66476007)(6916009)(66556008)(316002)(1076003)(107886003)(54906003)(26005)(66946007)(6666004)(6512007)(36756003)(2616005)(6506007)(38100700002)(86362001)(82960400001)(478600001)(6486002)(2906002)(8676002)(41300700001)(8936002)(4326008)(44832011)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IFpK9b6JoP4SVWypNigrsWzd3jkp0fFG61dlrT1Wm+w0S+vx/N9J1KEB74Vs?=
 =?us-ascii?Q?CyOyHZGVQTSzQHaVT3rly3OI3IZE3aDgjGqiQtYRTCkdrgqlF6R9RGSIa9w8?=
 =?us-ascii?Q?9roLnRPypQOlds+Baafh/7pa0QfXUvKxJT/cNwL3jn2/HlpIROn4zvIT3XxX?=
 =?us-ascii?Q?SmjoU7TUV2rYzeFAhFjlAh+sJQLvisL2o/7MzLo8QN6Bi1gOvVU6buuzqyXh?=
 =?us-ascii?Q?CFZJWRZznNvEqAjqgCTYnwkRlcw0U77Kx0BWSf7cxNnC/gvo1mddWRZSSAAm?=
 =?us-ascii?Q?ZIfP4Oqmn9dVeZCjs429hliIwhsacDOuDmuDy/8HtGXFefVmktVsijNs5Y0f?=
 =?us-ascii?Q?hXXZrxoCiGdgIx0vUdfZQ2loE0u7k2wpKgpIRi3UHlCqckBuRxNVecXtTy1T?=
 =?us-ascii?Q?rUweEoeP/eQwXku9CvAirwLuP1i3N/vkem+Q42f7YTB40l6bYuD3C99FSNGP?=
 =?us-ascii?Q?ozL5K29NEuftMIpNCpGoxKuCDmh0xFnuzDN4pOkRWAp4y4+vDg3QcNbvt1NI?=
 =?us-ascii?Q?AjT4teuz5xEPhJfVCpmTeSpCvTa1DVLP+taJ+XD1UxMQqx+lGuw1M/zfmnjU?=
 =?us-ascii?Q?s5hyqyIGcjZCrd6HBYkaquFMH6ZO3hvQBKJIw0/exbab0PyP3VHXjig6EpHU?=
 =?us-ascii?Q?ygI9PfTHFi75z7ENyYTymEWRkJs9N597I0UUai7hQWkMwWXVdiWE2q0xspLB?=
 =?us-ascii?Q?CviwOA3dps0DVF4rEIn+A4hO9DPyVcyWBOwUmQnav0Mck6PU0vuXGYnIOcPa?=
 =?us-ascii?Q?5PuPOkjLy1IukjAiVT8IpXzegvqOxZW0ZDFgq2D9xCZVJdTIBb+/dUgEBWqq?=
 =?us-ascii?Q?xkXdQqvjDv6u7A86YwBmxHslcCHk9Z5uK8rpZ6gQGu0C5w/vlTFipvHquHhQ?=
 =?us-ascii?Q?DV0hbm65n838Vgvy6WMln+hoyZMuuyxc1J2uoJoiUdcBCtdhfQHiPiRKweMb?=
 =?us-ascii?Q?eC1DrIylOoiA4JYhBwrRW93DuUyLIeg1v7iMbxWQa9tXsraamH0G2RbYLP+4?=
 =?us-ascii?Q?YRZ0WPOTuspv07KqtUv4cpd4F3jnKPe/Rp6gzEgz74dYemHzKJGMimdL8naT?=
 =?us-ascii?Q?aGf+H8klZu7N6xv9wezbEZL/YgPIQwQ/r/zCHDqdUh2sZDW55rf1Es+m4R/a?=
 =?us-ascii?Q?RczP6mlTNTp85hqwXWIBrDGXdnilEYhmk8tHaeS/kPf6cg+3ZeIx3HXp6lRp?=
 =?us-ascii?Q?hVdPSDV5KhycepfQgM6E4aF324NoMp38nAP8p/uV6hiHcrSUKh+fcQSFj9NL?=
 =?us-ascii?Q?IYNMnzH6kRhyekLmdoLzPS4NThN8s1+Qr6erltURRICnCktz0ZZCSBnjIepK?=
 =?us-ascii?Q?HjXRZoG7z0+D4royxLn7gOcWrFCPgeq4g/ZGppd0LZhT03m57j3SeiRrGLPW?=
 =?us-ascii?Q?htb920W5raJFOrmxl9IfhAj4uhRAaXeFZibNGUsyt+NWZ95VcTgbHrzYmfBu?=
 =?us-ascii?Q?lckDIBma7rKI1EMiiJJHQty/btTUJppgfjj2Lu3O3B8KXeEl7McCFgwjKK9z?=
 =?us-ascii?Q?jf714zFBsWMtH4d3q2KVymXvladhWIl+qou7aM+rWM0gVo8Bd5K51+gltHud?=
 =?us-ascii?Q?zhycFY/xWSELKMTIm6KaSnYLTvwai1xcU37ZhRnAZFSDPRRccSnSjAERrP4I?=
 =?us-ascii?Q?7w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 237556b1-1db9-429d-8e03-08dbc5b4a627
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 15:06:28.0751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1BdTo+CJZJkLwYxu2iUiUJzVAw+IKrYr1yUWKPnx23N+Wd5B1d/Vf7ZgXYjjW6a9Kd1HGJOU/nkzu7JzopKzcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7576
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
index fd87fbb6306f..d1f360f17ef2 100644
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

