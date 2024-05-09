Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269C2C25B10
	for <intel-xe@archiver.kernel.org>; Thu,  9 May 2024 21:04:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D86C210EF45;
	Thu,  9 May 2024 21:04:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k5Et9FFp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 909E410E5AD
 for <intel-xe@lists.freedesktop.org>; Thu,  9 May 2024 21:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715288659; x=1746824659;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=bKHXiRVpt3+3SwZsYvSX7aZ8bQjFnei6Of4p24yhOC8=;
 b=k5Et9FFpnllDeoVEMQKDH2YUjW310qP7malXnfWZJdnb/q3faTyZ6MgV
 C4gPDcWMGmHjDFK1n5b+tGkeGY9wA7QQtJnrlXvjEYEK8jWUQn0euetq6
 CG6MQJmOZUjJcynUMvzB6K2RaQMHeHyAPql1yF+o10r4j4oNZVUdafJz3
 HyE55P1ZjFV+hKRNW/wAznfvL6nmF2rl3AvKn01ptKeWpTxYoLNbp96nT
 pr5PIXYRk16g1fMVpnvFXsXC/aYtLdAa6SLQu7RebXVr5JBUCBfpQxGB5
 eftYWFSoTCjaILYS50OzjorXL0wikXfrmqx+Nr25JbCc9IsMlw1+tHOd7 Q==;
X-CSE-ConnectionGUID: +T28j3piSAiW9alP2/HlXg==
X-CSE-MsgGUID: 3uDP8krhTwO6SZZ8YXEgkw==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11082971"
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; d="scan'208";a="11082971"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 14:04:19 -0700
X-CSE-ConnectionGUID: lqbvgAO3TqGEYIr4t9IWPg==
X-CSE-MsgGUID: jt0TTTOeSwCT0XJEj6DY8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; d="scan'208";a="66820809"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 May 2024 14:04:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 14:04:17 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 9 May 2024 14:04:17 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 9 May 2024 14:04:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aaMTyLM8CfCN7LjbU1ew27wAmV055CzkPkE377AKUjI0Z18my43tajZAdnzAFqpjHutkdguphd4YUqCvaKjUxRHq8zFD6+exQrSbXFTM1mgqnaTLioS8hiY+gaSZ6+rbvW1JvwnZddKGxIwAHwzEx+cqv3PNwvd9odJiKRIKeAKEntnYZhPwfQ0tbZmWxjNsGT41ddY+uof0vKKe2iSdR9nOCWZD8QzzSi7FjVVycH82ScbAs/OTrbGNk5lsgZPcBj/D1skBKAPWFookqVb3uIk1CvHSeqYlkGxyzt+fGOj3wUqPxHFZgd4nOeqcI0/NmQ+BxgF37cwj5X2/Z0lh4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S2S/nwKtZLnVkKVZ6Mr2ru8KpMnXJMY/vGX2Ikf9h8g=;
 b=FKcYCAVqPwbqvoRlNeM1gmyt2cvlA7TvBHW5+HZQY/12TTmKrL0YUpQe0Y9brbLFyxwPP09B1h33zGa72EzgfY/6FecxVJhz5crS8nGqMXSEr2PRjL099+fcEGrK3si8eKO1zGiz0BS9WM81aRLvJtbfiBZF9L+TtqxPI+OI53j70CwbiRTdkQtUsDDCApPPudIbEuhfpFTPePT2sjOIgd0YtRl2SzxdFEgrgRIukBmeia7kKm/JGg/yRuSfb4Xl5+D19QB+UffCCFxZ+ibNZNGd2EkMs0kxmNOwT5kg0JeT+5ZrQeI7g9ZZCGvwatIZh8z0N4oo99Wa7eouqiwsvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH0PR11MB8141.namprd11.prod.outlook.com (2603:10b6:610:18a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Thu, 9 May
 2024 21:04:15 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.047; Thu, 9 May 2024
 21:04:15 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 4/4] tests/intel/xe_pm: Convert mmap tests to use existing d3
 helpers
Date: Thu, 9 May 2024 17:04:01 -0400
Message-ID: <20240509210401.519062-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240509210401.519062-1-rodrigo.vivi@intel.com>
References: <20240509210401.519062-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0080.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::21) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH0PR11MB8141:EE_
X-MS-Office365-Filtering-Correlation-Id: 9691f92e-0168-411a-b957-08dc706b9589
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xzdT8fS5vBrXON7b+vTOdrh5rqEGWBPywfGzyBuP9H7F1t3mq29Vy/7zFFtD?=
 =?us-ascii?Q?ryteFMJ0v2zLIgR97v+DpyZxhZyKOtEyS2KWzaQMN9Gxy0jeUPnGPl6iMV07?=
 =?us-ascii?Q?rKZEiblarzt21C/B4RU5Yi6WmSDbebEJo2BibmSO+08onHkkwHfHJWzmtoFG?=
 =?us-ascii?Q?13PI0ixatJb+9WbCMs35VWKaWcDZcqvuwJhHUzYpH1Ysx1+WUnCCWGMeQDsz?=
 =?us-ascii?Q?lat3kBmmXSOpA5SQzt5QhyZmoPf2oJQLjtcqdOgaVcVbK/UUv84oLW+mFY26?=
 =?us-ascii?Q?hV2bzXxf0JpnpGGY9xdH1OnSKroBDciheg6fLfnbGNjiFau4sIi2Gs0hZzcl?=
 =?us-ascii?Q?UX3dhZ35sLV8fxgXHItjzwrWLDpDcgXNZAbrZpKZyUMbMGmbrJ+acy7qfsBj?=
 =?us-ascii?Q?OLyEHoN4QOPro8s4YGOVgE7JPak+xlukcytfX6Bbkk3OEwcVBn7kwfUviOQd?=
 =?us-ascii?Q?o5MORQW4Px3M5kvnDKg91pz9i3b31fA4zA6ZZxi6PE3mqApOegUNxKuzOS5D?=
 =?us-ascii?Q?UD/Vdy8rCr2itiSfX73hRhl7l9YGvcCyJ/Q0IR+0/oPxOz8r+2ry3FOC5isM?=
 =?us-ascii?Q?a6lZ1Z246nJ5j9Lr3IpX3a8td1Yhzj4Aaemb5ZF+7vsVb1DknBqBVbrwf79P?=
 =?us-ascii?Q?Xf9gUtdWkPtzSEHx0CVslcTpOgKklpanKL8WppBJm8+V/LpNYDsyzZHGTU6s?=
 =?us-ascii?Q?l4CArwqscTwwLLP/kAHrXZCGfFEiRYUDnv5Fu1BlFSPiLFXcSk4LumEgVjLg?=
 =?us-ascii?Q?NtYNC6FoIErn/evlJfd520/cIsUX/8uA9pDX811jWZqvBl1F+1Z7vL+6e3qv?=
 =?us-ascii?Q?nS1e1TS6+mtKiC2ljXFaJYuaJXeMIBdFyjMktPslHJzJFHd2xoumuDb63vPk?=
 =?us-ascii?Q?Aza+BOv3cxr+HWTdroyLYbdd4PCrngvpQNqbe+LHwQpDW9KKVAZNI9mXK9Z7?=
 =?us-ascii?Q?Jo1ikbCrhcaNgKQvKVpFnFF94s6Gpm+eHfdFUuzpcvephI5HsVW6fkneiM77?=
 =?us-ascii?Q?4qLbD/EuGfUp9v71q7SCE9cLeyZ/I69VG7Wk5Hsn/K+PBjUULYDgs7BRQNBb?=
 =?us-ascii?Q?PAUixXRKIjwa/mBfxTcn4KEYKXqKN8+5Y545RhmEIzgjzoPfvaYCmC1K4vNe?=
 =?us-ascii?Q?yHm2mI/zdEbPKtTt33fttkO0EtIQCTLrdT15ZuTca0wGz4aMgZci5GPeDBAn?=
 =?us-ascii?Q?ZFF0DhUiCEJiLqnUKfU8LNy/Dqh0NeSKMqVMbTgtOeeajAC0njyOpldQX/1t?=
 =?us-ascii?Q?qnZgNU2wzqfHdmhCUnAg5tNHoZXae74yen650yIV8Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Dw8WD7Dopa2E2LYA9CX99qt9oceMB6TgDjArYyvENGNdHa0p4YIoqwEXBjoD?=
 =?us-ascii?Q?vLtE3WPv+rbw+IB3W04/MOL4pUuXhAjjKjljyciS5u/BU7gz7ECsr/GqXRUT?=
 =?us-ascii?Q?aOnn+8YS8y/SWFODhn1tZFbhNg55liOzi0OcXlGCBqlsuDDHsQT2LI0UA8Lg?=
 =?us-ascii?Q?MCwAe5soc1Y+hW4JRv3s6IHBC00zkppwtpta8onFCPuCy1D6CovBVf9jC1iz?=
 =?us-ascii?Q?kUbDETkPcsCFz+RdkViCSMSVBluYqSyXBLa5qBuYdjW77XE+RBvtNNGExgco?=
 =?us-ascii?Q?Blpy76xbUttwJpR83OFed2FdcOougEJAIcqLXN8j4dprA03yR03vHJR4koCe?=
 =?us-ascii?Q?VzG2CX/uWs1ycINiL/uQ3HSKpCpF+y4c2qezj1wOmpo77mfNJwekEAD1wSme?=
 =?us-ascii?Q?cZpMTbArBWRyousynG1Zs9c7AvgvEg+pQs2fYPjxyCaVqVMIAv1/LieSUrEp?=
 =?us-ascii?Q?v/p1PVyAFPzOrtjlGfLNSuRj5jaoEEUZPC5iM2X97OeOiobaE+WNo6+1oRFV?=
 =?us-ascii?Q?lD+gL6EVsrcFD3/avI4WOv3xxd6AoDWMkWlENGHmx4CRQAHTTlUR4Lv1Zt8g?=
 =?us-ascii?Q?kiiREtlJUgZeRi5hFwzkGcT5lp0R5LpW2v3C/JgMTrwGJNa4WCnWca7mikIp?=
 =?us-ascii?Q?GSUXrLkWwGewrWBXV+riH/wmvNAro1wAlGFyXgsNLkuX8nhQOXbxECqcFhvE?=
 =?us-ascii?Q?z6PKcViXc8AvLWGUBWeQ5ro31XDSoGBZFSEP5bXRPXFcpdcOwpGY8xjx9Q+K?=
 =?us-ascii?Q?xBSuGVjLm84mYW1zvU7rkpq1hLQk7R+0qKnIjAL+HdEZG6Pn73CgagVX941a?=
 =?us-ascii?Q?e/lIIG/QLdUx+4F8RdkpnLl8ahyo9KMaJ0q/U3Q1v3R9u0zIEGmv+hydQT4S?=
 =?us-ascii?Q?AGRONSlK9Vd3SFxpukt2eUAO5506pDFYjn90Cv2NflIm/kig9AQoJMK4fj07?=
 =?us-ascii?Q?ipwLcvYYBDQ4UDP5ximYp15PKnto8FrNF0WYUy+kSJ/NKzuDE027GDe1B5KY?=
 =?us-ascii?Q?fxDVKr7VCOPXyFxd9r+kIoDmtNKK5+IkPTAFWDRRVnw5RGEdYVcDcCTeE55G?=
 =?us-ascii?Q?1I7fWqKtErfLE+cjodQJBv/19718GfU43t/Z6kHByd5KK6WOne1X25ESh7iO?=
 =?us-ascii?Q?azTgvcXNeyyfPpkZwCuHBrRtGhvj0gGqVGls006vF9qbmB1HrGgaItO5O8Yy?=
 =?us-ascii?Q?h/z21DR/n/17wFXiqDIQMx8939fOmMJmHnFJX/7Ldnr/qI5bNHtkx9NKpDnj?=
 =?us-ascii?Q?HlPsRhVaNwi8HybhcZPHWbLww68ysDgJf42Uz7WJCXpho9rAcGRbFhRaIfDL?=
 =?us-ascii?Q?9fB4WZSs+yMTMUsElL5re0j4QvvNkIWxIL1eHygfaPQBipfrk4gUp1b+3liy?=
 =?us-ascii?Q?Sy6TvH1oYux3w9kKEFdwox2wFg3OYIyVAUMR9bdZ02U1GcqAaqdCr0Yes/ex?=
 =?us-ascii?Q?xM5VS/sHp73tYJ2s0ZmpI6zvInZ6KxcLYKK+TJGYfu1cPXmkPeQWfxufZtb3?=
 =?us-ascii?Q?DW2sgMmH0P7D2XgUoBZWrRvsSscofeVTokvjJmtbeSPg5qMHy4l9E84syNKM?=
 =?us-ascii?Q?lkgKxiqYxukg84ybg32qIWJvVgqcy48cjvTTsE5IWvGfquGo3wI/34QdLnWZ?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9691f92e-0168-411a-b957-08dc706b9589
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 21:04:15.4099 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gaGDmuHljNBU5O1KHIegCNQyRuG+g/NTR617s/plp4HHgrFfCncpPKWt7o3JWI8UwCRizdlbBaTUdFRN8WHBbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8141
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

