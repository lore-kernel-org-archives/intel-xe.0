Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C998DC25B10
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 12:12:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D8A710E06E;
	Fri, 10 May 2024 12:12:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PEQuxmj5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2ADA10E06E
 for <intel-xe@lists.freedesktop.org>; Fri, 10 May 2024 12:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715343154; x=1746879154;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=bKHXiRVpt3+3SwZsYvSX7aZ8bQjFnei6Of4p24yhOC8=;
 b=PEQuxmj5V9mjo5wc5UVYxVz79qweLytM365fnZ747HWBoLLoi/jn937X
 /zo93ATUvKUr8zw7VCVRZyyMnSW3/9Ebf4TyBL5aATGERcZ/7MPPjkCQ+
 lDhP0fvQfJzjtaTa43djGEcZ3P87akQWJbT9yNFOyKR+wHCvVcu6ER8xA
 MkXeUyMfSYDu7bzRrpWflQCS4NbvWgqCetSq2LjGeG++QWZLeDyoYDdQg
 AZvCNAfkEZu4/+eU+jL8TfBzHGjYtOGUP0jaIQ2Ch7co6xAcQo3Dse4M0
 2bIqpnuFDDXGkSHtGfyEN7204r0XfxcysSaClfxWP4v/WKzAisbkxNldJ g==;
X-CSE-ConnectionGUID: o/NbYmwMQBClIZUHUQtH5A==
X-CSE-MsgGUID: nvByCEY0QPy5JDbhgtTvcw==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="22726526"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="22726526"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 05:12:21 -0700
X-CSE-ConnectionGUID: s1oP6rtXTbGJWXr02zaL1Q==
X-CSE-MsgGUID: ofbnj54dSye/QwxmnZLMXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="67076745"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 May 2024 05:12:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 10 May 2024 05:12:20 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 10 May 2024 05:12:20 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 10 May 2024 05:12:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IPSgJEKWqCMmHvApo0xpzVFKVlw7XJpATw/vIpkn//2FYccK/3NZKMQ6896BKbI8KL97d9+BkXeM5OFLNQIZlENxrqb57so+sdQO/jO5TccZ4H9YAGLuHCLII3CI5/VRw6LA2j891FunwSJDfai2pD85jAGIM/AGcHfi0gLK391Nb+5UBTCY3MBz/bBS5Lod0Csff6gFf+raX1zzggWDXmAI1pTL6JBbmO6lqDmFBh3NzdfVpYlI9NoBPyeea5OFd4mjLYZtHQbIZpVv9/aVHyx/EQLIqsMNzjAUTg8Anh8a5Bm3yHYjpr0UcybruUrSEROWY9cza7Zx4OAiw1giZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S2S/nwKtZLnVkKVZ6Mr2ru8KpMnXJMY/vGX2Ikf9h8g=;
 b=KoIbnbXGYBg4Yn4LN00miN29N55yrkufwiBJBARSYAAMepbMZbSEqxvxitWfdR8fnRGYIipZPGDgCBqwFZ2QeUqCwGM63xd5VGQw8sB+rUgud3sZCYMCjQRhIXRwtx4Vjyqlc5azLzPqUbNifu3VGthYSiuRwP38hukNJ7Oe170MvA9K5O1tQF61a3kkvGbuf2VkEDWrIj1xxh3z84gXB/gY5HCVAkQwhUp8q4BZsU47cbGMxw2HuUJY+Ro+lJfQlZCqsWiUfFrVg+/ejmA2fvQD+wB28PG/uHj+Dz9fuVfdMY1gdECpLVpR8635Al5JGC89I6YblgkIOJiCDsXBwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CYYPR11MB8307.namprd11.prod.outlook.com (2603:10b6:930:ba::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.51; Fri, 10 May
 2024 12:12:18 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.047; Fri, 10 May 2024
 12:12:18 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 4/4] tests/intel/xe_pm: Convert mmap tests to use existing d3
 helpers
Date: Fri, 10 May 2024 08:12:01 -0400
Message-ID: <20240510121201.723602-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240510121201.723602-1-rodrigo.vivi@intel.com>
References: <20240510121201.723602-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0084.namprd03.prod.outlook.com
 (2603:10b6:303:b6::29) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CYYPR11MB8307:EE_
X-MS-Office365-Filtering-Correlation-Id: d3cc02a2-dc10-4465-583f-08dc70ea6fcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lcZ+p6HWVPA5ouT8E4gE3unDoTqzYBmzXaoARx3w6A979LxMr9r4rmh03EhJ?=
 =?us-ascii?Q?nKJ+vmW+L8vuKbAK1Qcpg6JcD92mu5S2y+1iXmydHo7H4ttNPiir0q2NeaIN?=
 =?us-ascii?Q?CnKKcwYeylLznNnyVyzwUhzc4wBTvZGFb/yGIRKYMOtxlCdQV/SCYTOKoCkH?=
 =?us-ascii?Q?YvChvJynYxb+RyIl5kWt27ReGX6Ip/j4IQLAC8tXYfb6WydhvkEJhFLmIFLQ?=
 =?us-ascii?Q?AJPNhFmO49i+N5UCcClaLwkhgsi43kX6x/YKlOOkr8p1xZ5jRpuZzzX7CriL?=
 =?us-ascii?Q?nNquXfeHv0iprsoZBdQtRUqtIHsoMSIS/gh2OdkFAXEDqcIN9rtUQRPIQoVr?=
 =?us-ascii?Q?Xg7Qik0TxRmQRrbOsTgzxKl92oCc8LotG/gr1vu+xSA92pHSnLlSCGJNYIb+?=
 =?us-ascii?Q?iEWRSEF4gHgzb0oJkJU1MTekHysJT9794kI9kSAl1IJgN0GYqTwoDE0W0O/l?=
 =?us-ascii?Q?OLlNSw0jkCVYGXE/TlCSlDntSRutZQdxPPOg7AMvZ3pL98TtzyHI+N/0m9BM?=
 =?us-ascii?Q?s9BNq59oR9kLQ9QN4FH4IxI+s/juGaBxQjaI41xp7NypogRBmZ3/kbtXwUVr?=
 =?us-ascii?Q?buQWf3UwmzvXbQRT3P8xVHo7GHMQzW+DIBtMgJgevID+HBRz80IahNercGSe?=
 =?us-ascii?Q?81I04kiMyftTDAu4lxxEBENazM9FTOnYkr4xgffdG+cGMg6Qw9DJZml6qhMV?=
 =?us-ascii?Q?08qCVSithaVvvy2/75MZ71IcxdSroFQxWVpP0PcNhK068dCtVNSO4hGIu5t0?=
 =?us-ascii?Q?wXSSQ/e+XP/H+1NHHPr4DK1+YQMMO/wrG7RDXPH11KJ1nRp6rvSXkMHydKIw?=
 =?us-ascii?Q?wTrGq1xJTSgEF4P3S3wGt76yWnUN3foH5cSidq9tIOLyKcmeqGa3BlUhAhiO?=
 =?us-ascii?Q?ZE8Kn9tZmzswhzEcPfXLldNlZNJowk+mjy7s67X3MUQprBTxKQ/LY8KTH3c1?=
 =?us-ascii?Q?uSe+bVYwY4CeN4sABQFTAQLf/rgVFp+o5ELptSyz5VcU8VyDA5XGhpl2nC8g?=
 =?us-ascii?Q?1hX3EzW7VS5US/X8vfuOs20+zXi8QfNeS6toPC1SkYzNfhp5FhKwfYrOKAna?=
 =?us-ascii?Q?0/V9J6tq5AHcjDaBaFxPZTnE2s12BjpUwIAso/F4nl4YUdRENPzy3Q0Wr+B0?=
 =?us-ascii?Q?AxUXWqvFFyyuRgxveQPJahNBBXebVJo5yNvwrCgm6qfHMkV08/NwoEfXyq84?=
 =?us-ascii?Q?GrFY5lG5XlJzlIoKVsjvIg3crsgv5Zkvbw9gp0GJOHsiewtIQP0zkKEkawdB?=
 =?us-ascii?Q?AKUAcEbIGVmjFL8eCG9J2+PElzI+/vwUx07RwExFkw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4t0wa9riB25yPjEfhDGQZk04lCCzfniU+NXYKuB0NVLMAoS3KD5TxPMKjYpc?=
 =?us-ascii?Q?3hmZMulMeD708anMtZ1iimiFmNiHfpWwuRDBfP7IWAW4bH7PYshqYL4s8jaE?=
 =?us-ascii?Q?K0k2HngFRYnPwA0ISGqRxhCvKC52DZp2IpKSotKVNdlM1y4OWoBgiOld2S3k?=
 =?us-ascii?Q?sYfqUgRjFgcDfQeFn2Pw21ZUS7M9sTPyTiD8Mx7ZeaZGd/iYmqmZetuoHj87?=
 =?us-ascii?Q?7dwW3Dxyr6a3TcmC9i10GSwrGfHC9UFB8mjkRWZXzkrbkACpwCo47G1NdsXO?=
 =?us-ascii?Q?oaozd6WvlqRjBI9JM5a7O6GR21FuAqGW09uayYj1V+Fa//+LBAJiaFBTrddr?=
 =?us-ascii?Q?2FIwo0uY2JXAXmQ8jQp3KImitgevEAww6mqI77odm4ENJq3ycB6h2BTT0hoD?=
 =?us-ascii?Q?gYmUK/DT1B+3OveuL0X4kl4wSmVZiZbYhJBjNS/y2zB8r1tXF8hIWNqkZPcy?=
 =?us-ascii?Q?rewvt7Lt2JiADOqR3YL2JpdHZLJG+RKszm+XwS0YuScuAQjrfP1kad10ZYV/?=
 =?us-ascii?Q?hx9TS48Kw3YU5/ooFthtiWlAt9wTePsmnLSr/mEQpDxomY7Ti7hs7AyZh+pG?=
 =?us-ascii?Q?8KH7B5JZQhcQiXdH+NcdtCaBJLk6chKyQi0mNw70s0XRyc9wowRlPa8BGTB2?=
 =?us-ascii?Q?xmycb0cHfI/+yo4+o5uQ+/7y6hi/wmsBKGxVZq/5ZVhZ/i8ZXfwlI4yFU0re?=
 =?us-ascii?Q?a/xejnUAuQDOyCaZ9CgGFQ1OZ9KI7dmhDe0AgDdS5yUQqbL1eRtHcoVI3FMv?=
 =?us-ascii?Q?FcLm4cfkOgLpuLribbSI7IHQyU21ckqcuKiqRqm43jxA91Izc2cPNDHBbkE0?=
 =?us-ascii?Q?EsBl49NtWAWuQXAfNeiJTxXlTsZ9KkEGkiIyDtDdOHfuTW4EpyB4PBQGybQb?=
 =?us-ascii?Q?hSFjNE6/ZjRaW6D15yseV2T1HClqksLiAzgBF4FYt5BKIQIiCvGCz4u3ttK+?=
 =?us-ascii?Q?xivpBxBBZ3HszpzzKbq58DBnX14b2Iul+hiRh0XNzlonM2aCIhO8cD3G7I6G?=
 =?us-ascii?Q?J+Mjwihw8topgwr947rDY//6dGowLapjDzlCVZwQo5KuI1exBJWcbOA7MbC/?=
 =?us-ascii?Q?775kfL30ueteVrD8+P4N53K+YX8Y6zjXVrclK9fzd6Q4h2qOz+jp+LFylwCi?=
 =?us-ascii?Q?VysNDBX92/CKhInFwFCGh77yFj9+msCiuwKRDzmNnAROcoSAL/lW4Ieyh8+P?=
 =?us-ascii?Q?/d8XKjT+EC3hO/3DCxb8I+7jFDhyKzhnkeXQ0WU8ygULaZ9Po4sXbehbcSLD?=
 =?us-ascii?Q?+t047XmVTzgCllwozka8tvloFu/C01HiNtO40iIS0bT+whazF42Q/vY19PPc?=
 =?us-ascii?Q?sUDMWP6U7pY0JI9JIu/NsOA4SiA0YP8tyE7LcA6A4mvlsG2s4WTOL84KpOcD?=
 =?us-ascii?Q?u5dNN/jTH927I6gKjWiOz607MSFNo7qAImG94JEJl4RiNm8s3H2HBF/bwebV?=
 =?us-ascii?Q?SD14vulyZd1h7GdOMWzg/A61SUw33fQuDXLyCEn82/jo+GJT51ak7S/4Ddts?=
 =?us-ascii?Q?MVVd0o4Zaz8FehWKKkNg9c1IR/EuL1rFNZpLi54tKe66mmNBhTv5O8/b0dPp?=
 =?us-ascii?Q?Hj6e1B+W0lByCS/mfxt3Gx0uvkZnmCWUmzTm+Ctety9cljSkOhyyO1S4XHT5?=
 =?us-ascii?Q?uQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3cc02a2-dc10-4465-583f-08dc70ea6fcb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2024 12:12:18.2465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Bh+MJXd8xA/kwdeYl0f9pXFERIaW146FL1A8E2Qn/S6SdMR71mrcH7zRxvDj8JCIcMFz+PIPu+68stc/t4qFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8307
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

Standardize d3 setup and ensure that it tests with D3cold and
D3hot.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_pm.c | 80 ++++++++++++++++++++++++---------------------
 1 file changed, 42 insertions(+), 38 deletions(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 81226a910..4aeddaea8 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -519,19 +519,25 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
 }
 
 /**
- * SUBTEST: d3-mmap-%s
+ * SUBTEST: %s-mmap-%s
  * Description:
  *	Validate mmap memory mapping with d3 state, for %arg[1] region,
  *	if supported by device.
+ *
  * arg[1]:
  *
+ * @d3hot:	d3hot
+ * @d3cold:	d3cold
+ *
+ * arg[2]:
+ *
  * @vram:	vram region
  * @system:	system region
  *
  * Functionality: pm-d3
  */
 static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
-		      enum mem_op first_op)
+		      enum mem_op first_op, enum igt_acpi_d_state d_state)
 {
 	size_t bo_size = 8192;
 	uint32_t *map = NULL;
@@ -540,7 +546,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
 
 	igt_require_f(placement, "Device doesn't support such memory region\n");
 
-	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	igt_assert(in_d3(device, d_state));
 	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
 
 	bo_size = ALIGN(bo_size, xe_get_default_alignment(device.fd_xe));
@@ -566,7 +572,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
 	close(fw_handle);
 	sleep(1);
 
-	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	igt_assert(in_d3(device, d_state));
 	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
 
 	for (i = 0; i < bo_size / sizeof(*map); i++) {
@@ -581,7 +587,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
 		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
 			   active_time);
 
-	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	igt_assert(in_d3(device, d_state));
 	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
 
 	for (i = 0; i < bo_size / sizeof(*map); i++) {
@@ -591,7 +597,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
 			igt_assert(map[i] == MAGIC_2);
 	}
 
-	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	igt_assert(in_d3(device, d_state));
 
 	/* Runtime resume and check the pattern */
 	fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
@@ -772,6 +778,36 @@ igt_main
 					  NO_SUSPEND, d->state, 0);
 			cleanup_d3(device);
 		}
+
+		igt_describe_f("Validate mmap memory mappings with system region,"
+			       "when device along with parent bridge in %s", d->name);
+		igt_subtest_f("%s-mmap-system", d->name) {
+			igt_assert(setup_d3(device, d->state));
+			test_mmap(device, system_memory(device.fd_xe), 0,
+				  READ, d->state);
+			test_mmap(device, system_memory(device.fd_xe), 0,
+				  WRITE, d->state);
+			cleanup_d3(device);
+		}
+
+		igt_describe_f("Validate mmap memory mappings with vram region,"
+			     "when device along with parent bridge in %s", d->name);
+		igt_subtest_f("%s-mmap-vram", d->name) {
+			int delay_ms = igt_pm_get_autosuspend_delay(device.pci_xe);
+
+			/* Give some auto suspend delay to validate rpm active during page fault */
+			igt_pm_set_autosuspend_delay(device.pci_xe, 1000);
+			igt_assert(setup_d3(device, d->state));
+			test_mmap(device, vram_memory(device.fd_xe, 0),
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+				  READ, d->state);
+			test_mmap(device, vram_memory(device.fd_xe, 0),
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+				  WRITE, d->state);
+			cleanup_d3(device);
+
+			igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
+		}
 	}
 
 	igt_subtest_group {
@@ -787,38 +823,6 @@ igt_main
 			test_vram_d3cold_threshold(device, sysfs_fd);
 		}
 
-		igt_describe("Validate mmap memory mappings with system region,"
-			     "when device along with parent bridge in d3");
-		igt_subtest("d3-mmap-system") {
-			dpms_on_off(device, DRM_MODE_DPMS_OFF);
-			test_mmap(device, system_memory(device.fd_xe), 0, READ);
-			test_mmap(device, system_memory(device.fd_xe), 0, WRITE);
-			dpms_on_off(device, DRM_MODE_DPMS_ON);
-		}
-
-		igt_describe("Validate mmap memory mappings with vram region,"
-			     "when device along with parent bridge in d3");
-		igt_subtest("d3-mmap-vram") {
-			int delay_ms;
-
-			if (device.pci_root != device.pci_xe) {
-				igt_pm_enable_pci_card_runtime_pm(device.pci_root, NULL);
-				igt_pm_set_d3cold_allowed(device.pci_slot_name, 1);
-			}
-
-			delay_ms = igt_pm_get_autosuspend_delay(device.pci_xe);
-
-			/* Give some auto suspend delay to validate rpm active during page fault */
-			igt_pm_set_autosuspend_delay(device.pci_xe, 1000);
-			dpms_on_off(device, DRM_MODE_DPMS_OFF);
-			test_mmap(device, vram_memory(device.fd_xe, 0),
-				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM, READ);
-			test_mmap(device, vram_memory(device.fd_xe, 0),
-				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM, WRITE);
-			dpms_on_off(device, DRM_MODE_DPMS_ON);
-			igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
-		}
-
 		igt_subtest("mocs_suspend_resume")
 			test_mocs_suspend_resume(device, 1, 0);
 	}
-- 
2.44.0

