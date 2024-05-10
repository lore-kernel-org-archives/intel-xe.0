Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 061B2C25B10
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 12:22:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0EB810E06E;
	Fri, 10 May 2024 12:22:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i4jD0jC0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87CE810E06E;
 Fri, 10 May 2024 12:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715343765; x=1746879765;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=Nf0E2eNEgRxieQV7xqepIa95PmLECYAj9AdvNP5H1MQ=;
 b=i4jD0jC0zI8uzzSloKSAe2dCdHFWsbJe0vS8LFwLeFHyENXIG4+MQheq
 Y/y6rLT0rR3YPJtGj02qTUGRD8vDskkzaMX/CaDDkeHw1NSpG9vWmtWu7
 5ACJqZAh+co5ebXKeD26JcXK/PmoN26eCEKZTgkRp9ayi1yUNHdvNnFIt
 bqirONKPO7klB/g727mnsvrfnCHYRjwR51JEv6DFy6IRCjSJJeUOuDHTz
 n0Jp3a/KZmqHZ3jAZowLNXIQ5n2KE943sqKEyQkfMQcSHDIPWR9QJjKSN
 rq81aSTC2mXqKSSJ4q1WGluocyqhk0il5qvCWKi7ZXIx3yCl/yigcK28I w==;
X-CSE-ConnectionGUID: 03uifWzKRi2galgq368F0Q==
X-CSE-MsgGUID: UI/SNq8+TaGWhNqymLk4zg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11158153"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="11158153"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 05:22:44 -0700
X-CSE-ConnectionGUID: GtuuCs0xSVa4jSz2LCuzmg==
X-CSE-MsgGUID: h0m4APGoR9qnFVnSKhbETg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="60451555"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 May 2024 05:22:44 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 10 May 2024 05:22:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 10 May 2024 05:22:44 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 10 May 2024 05:22:44 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 10 May 2024 05:22:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hKI5PPwWJAXEHVsG0fy20Ml7Cr4wtecqJnZehg8OQaKb9L9CHSL4Bx9lFieW9+hFLTXGJsEC5Hk83X291w96SurfGdrr3knkYoObcRRoxnXA0fh38zTm5JTsZwfbkcOvsSo4HzZM3qEIr96rPZTKkwHDjNxeepBXaFSKm6AZgbMkTHt1kB0NrkNY719dNhfzDLDI1c60hRs4Qf6tdwtU0QgALIOT2V4hoi+ufpm4UAWhIXZr2KL+oCtrM+lfj2aam/OyFTBvfiQyp5FzlNyj5+p7bZ2Xg++KhZCRj1Vwc813ADnr26HqT2vZGoEefICkplbjQkiH/a94X/ZOxHVcog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02csHniVS/NtOlQeLaSaSQSiiB2ZSrR0YCjWh5ybe18=;
 b=iYORyCS2zYITL+aR7k9aS4G66+GmRY66B6+RPL6QEi7tCakmaVBC/E6TEn0QcSFP8d3LQlJEhMW7gbtyTR9aXtxRJoBtcuUL5YK1GdnoojdzTdFOGzysResSJKDEE8+gBCc9nG4522Qpbf7pVVFtiTCug2MLdXcrgeT975IOlursXKni78QBJsyi1/MKfOiRsRhF4ISRb+iifkJ8RzFC8TVPKzjrL01n9dSswiKEvSG61a5Mjylp0/jDltAxD2bmrGV9hy9uScsE1MBmrSnW1NMSTq/J3kp47yax72bulPJJ8XITSvs/vxe0thoQaO3LH1sRumSHOdKOvAGX9ALvaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB4901.namprd11.prod.outlook.com (2603:10b6:510:3a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.48; Fri, 10 May
 2024 12:22:35 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.047; Fri, 10 May 2024
 12:22:35 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t 1/4] tests/intel/xe_pm: Update runtime pm conditions
Date: Fri, 10 May 2024 08:22:27 -0400
Message-ID: <20240510122230.724229-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0090.namprd03.prod.outlook.com
 (2603:10b6:303:b6::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB4901:EE_
X-MS-Office365-Filtering-Correlation-Id: bdc3293d-3600-4515-2fe5-08dc70ebdfdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hO1oIR20hWxPOTBzplu9MwCK5MN2CCG2lExOl0GWJLcFBpUApstG9lzBg40S?=
 =?us-ascii?Q?ItRXx6Nz77CoOT8URloj4B9QqpZLQs0DietuzwQVN4hfRmEFq4m5Ym1RwWCt?=
 =?us-ascii?Q?TW/nAqedSA/b7JJm5iUJfOEKrJLX+x2Qet2OZDhDAK5Mw4vTNsoOGP4nyR1L?=
 =?us-ascii?Q?DRrcvj84BqK0LgUoeNoYELrXyjMrgbUA5Y3d4e8mri9niuXuykjqqolw8rnb?=
 =?us-ascii?Q?4TRW/ICVlYHn3XcRjrp9te9X5efZeLDRngn2KNwJ4JXFb2jd9xGzmWK69BHA?=
 =?us-ascii?Q?85FkDWrRE9tKyvU8j4SwHIWN0ZaW5ZnscRrfuTYr36rZm3ebEhqe1clWWr1P?=
 =?us-ascii?Q?NMfEj+nkvsExNqXHnoXbb+1TaXGiVz/INMyKOLyJKsYlospVf9mE+YnRffIH?=
 =?us-ascii?Q?iX3tqyiAsv226lztKSF1wZz/1RQOXkk1wPDf8wIg5Qwacg4PjEMxflXoyXio?=
 =?us-ascii?Q?c5408lNX1luNwFQvhZwWANA+SiDg+/KbPshLV1pCwe7lz+JMPVQKNBMxqVmY?=
 =?us-ascii?Q?1rX3rgqUSnm6V337szGWl8VdOKMubbcY/PP4Q4tBEsIdtELjoqXi1AHvbkzq?=
 =?us-ascii?Q?oKAUJAQno47IenmuzQuDm8YFZzCfokGIiBSiIrKJ+ITiaJQ6YQ2KtvR8Ax1/?=
 =?us-ascii?Q?bIiywkk4+uRmjhfT39YpIE3hpbNwbwShLjDk4pFDlqf0p7RzNIibuR2PHhog?=
 =?us-ascii?Q?kDCZ6AGTaYrLnDdmbzL+MUrc4TsQXKrCWY1neJReJ+yppLeDJgKyqe/1b4e5?=
 =?us-ascii?Q?d0VRbE1tXjm0bW1ddK+9qjeEk3gM13jvOizveb8rIExASSF7ijp61fotuSon?=
 =?us-ascii?Q?HzAqH4lfNW2j3kuqZz8LmGlK3nJSXT+AuEqzMGWgL8qfBFMcHc6fxmb9ekgO?=
 =?us-ascii?Q?/4t6cUlj88yTRCBRKzPIp9c4rqSU5youalRFZAFm2Y1+dHCjH00SOhUYGUdi?=
 =?us-ascii?Q?lH4th8Kp5SIKIGBLxk02+zHL6B3ocg9vkSDFkOFcyg09nHlkHSZF8YZSibif?=
 =?us-ascii?Q?jv/IEjQkFGwVRo9bOGrkKUUTZx74alNOuz7PwbHYdb2RxQfGWaDMsDy4decx?=
 =?us-ascii?Q?4ji+pyd9+FlNEKieXuFVRY6JH2SWZusGpnR8A9zQne3MS/GrA08EC4SuwDL1?=
 =?us-ascii?Q?uBVdIEb0ToFNcwYXF4d5wY3S0TxtafiYS2RkqCwvltDkdtviLIOJPWfxTAuo?=
 =?us-ascii?Q?vzVV/TXC3FjIX3vHn612SqLZCIVfKrY2qXlwDbF6gR2gwg8X7dkIWTgfLQgr?=
 =?us-ascii?Q?fBLbzwvHolMRE3amA+ylDbVN8Rsbrwr3AleZioATag=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r1LvDirRq4SDvKxtHdgYZGkOM+w6uNofoc34MXAMpL9EALyfufN8fQ75vCTJ?=
 =?us-ascii?Q?goKR5otW3eMW1T3FaAAWYHc8Jh6p31zQGLYNwcXt7dWDKs+PPcpYfQYy/SY0?=
 =?us-ascii?Q?s9imaWwu43ETi2jQTPp1NMBhk7a1Fr1D2vWCdNhy7kXOMBvDqfpJIDGEK+y5?=
 =?us-ascii?Q?cusXBfxnJO/PErJ9mA4Du9I45LYY6dr9KQqDA2h4OEIUBwyn1BvhEkPZ3lHT?=
 =?us-ascii?Q?irlFKUju0L5Cw/MvbTEoD3X8a8GakK3BECReSLIXl3XRaVSilutejQ39tCmF?=
 =?us-ascii?Q?OJhH9fZNzb1IWECkfKihysi5NRukUTt4obT2WW+KipProuNdyDI7+3KYOUy5?=
 =?us-ascii?Q?r6yqHSXHh3GXMw5IFyOfmb+mrHdb/XlRCyXP5Mms+GI6uud4jxc726pAM7qa?=
 =?us-ascii?Q?TI3Sh28JHFbGbcMc003flJymnKA/YBq8WE+wvG/N6B1WnDb5GHnEmZElrFun?=
 =?us-ascii?Q?Wopa3RXKBZ1SmmLcdUktB2vmuhYsiQ7rTiKOhSZtDp52Ude6eWgtrG4Av+MQ?=
 =?us-ascii?Q?Ud1N1vlegXaaCNL1dIfIDe//ytVd3fn9wTqoclhtXI7z+KrxxCbDWNWGOCG2?=
 =?us-ascii?Q?VbpLcpy1pn+1sApBoCRieltte3+7PCoGxp1No/dkgwHjAlsv90lkjtkda1U0?=
 =?us-ascii?Q?itUZFXt4oNx5hLBrYOqsohOmPlxU0TxvkdrsOZJSWpiPxAXfCVyGXeE7QlAd?=
 =?us-ascii?Q?QYJHTVqQinG39cN9tZgukMdzFvLbknueJFuETxtu8rmQDDE1tyB91bxSqFVW?=
 =?us-ascii?Q?9ssiIcczTlCGUsjYh611aHsgt18Eg446bV73FkNo3tRZ33VU+3uGYCSoQtF2?=
 =?us-ascii?Q?kJDnFyC7sJS+VI4ngyGkweBSFl9CUpplDdr2aU88JcJhlILsbOKj7pt+4SgK?=
 =?us-ascii?Q?Q1RxlAMd+QsyLn/RwiQNu6UNtv0O0ul16YXhQp/ZJUcsYfIvO5jcp414h+O1?=
 =?us-ascii?Q?2YPcnMp/7FVRM8zCfNpNWQ2rLYzUlWhqmP8lC7y1WF1DXK+0s+MSEkag9vHX?=
 =?us-ascii?Q?BFFAeBykazPjvGibuVLEVmib3dKhTC2jmbmVDYYCypATgVVkm53kmYSIs6qy?=
 =?us-ascii?Q?ayHTMpbQkmTC9KcWDZPTkteUfKuCha/r5wAl0I+idTByftITWmU4AIA/7Qrp?=
 =?us-ascii?Q?eIzzdTgO8qWWM8avC2sOMDSyiBz39//du1bF835MsMb+YGJNc494yDYAj4g1?=
 =?us-ascii?Q?W1JUTv99WP5cgT1SoTfMevbT9LCJCNUQNsmNwqNc1weBTCfg/2JRjzPkK0xY?=
 =?us-ascii?Q?R2nijoxdkBN3R+KsvO+c/XCcfEPKWBxnUvM5OG4soIEM6qnEDyhU+2GwSE7u?=
 =?us-ascii?Q?T+DLowzqDZg88cuSOvm8uGEKKp41lpVlnDekV01xnzoI4r8LCUmFP65R9c08?=
 =?us-ascii?Q?W2Y+h1KuE3BDR9gH4YrpKU8vJJLepQT6FF3BukyKYXH4o0uhK1jQoi3p1SIa?=
 =?us-ascii?Q?HFMbrKIsI/GOcF4RZNV66KPB3/eMagO7NZLCyVFEP7MYsmGEFbCxGGwj8ofF?=
 =?us-ascii?Q?YYEdwHCeFhI7VqthuZwSVT1yjpVdMWMP4LCwHiauN4Y8KlN1dNzZvWtuOP+v?=
 =?us-ascii?Q?lkMMZaqZR9cJW0dpP8zf/tv9lBr0kTYQVsiDPKFdDcgPpj73Z2JnngbvoEbZ?=
 =?us-ascii?Q?AA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bdc3293d-3600-4515-2fe5-08dc70ebdfdf
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2024 12:22:35.7928 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ITYekSZbUY4cXf+lpFcossYWiAYoHz3jGOVkdpucUOysfZkaJLEJERaEgEBxAZLXtMg2wyZGKkKjmFPYvPPlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4901
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

Xe is no longer holding a runtime pm reference for the life
of a VM or exec_queue.

Also, IGT changes autosuspend time to a minimal time, so we
cannot guarantee that rpm is still suspended after the execution
has finished.

So, the reference usage is not a reliable reference.

Hence, start using runtime_active_time as the indicator
that runtime_pm resumed upon our actions.

v2: Usage of runtime_active_pm and inclusion of mmap tests.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/igt_pm.c        | 18 +++++++++++
 lib/igt_pm.h        |  1 +
 tests/intel/xe_pm.c | 77 +++++++++++++++++----------------------------
 3 files changed, 47 insertions(+), 49 deletions(-)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index fe7692960..98cc8d969 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -1412,6 +1412,24 @@ int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev)
 	return -1;
 }
 
+int igt_pm_get_runtime_active_time(struct pci_device *pci_dev)
+{
+	char time_str[64];
+	int time, time_fd;
+
+	time_fd = igt_pm_get_power_attr_fd_rdonly(pci_dev, "runtime_active_time");
+	if (igt_pm_read_power_attr(time_fd, time_str, 64, false)) {
+		igt_assert(sscanf(time_str, "%d", &time) > 0);
+
+		igt_debug("runtime active time for PCI '%04x:%02x:%02x.%01x' = %d\n",
+			  pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func, time);
+
+		return time;
+	}
+
+	return -1;
+}
+
 /**
  * igt_pm_get_runtime_usage:
  * @pci_dev: pci device
diff --git a/lib/igt_pm.h b/lib/igt_pm.h
index 91ee05cd1..b71f7c440 100644
--- a/lib/igt_pm.h
+++ b/lib/igt_pm.h
@@ -94,6 +94,7 @@ void igt_pm_print_pci_card_runtime_status(void);
 bool i915_is_slpc_enabled_gt(int drm_fd, int gt);
 bool i915_is_slpc_enabled(int drm_fd);
 int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev);
+int igt_pm_get_runtime_active_time(struct pci_device *pci_dev);
 int igt_pm_get_runtime_usage(struct pci_device *pci_dev);
 void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val);
 
diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index e81a75d88..3f963bd9b 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -184,34 +184,6 @@ static bool in_d3(device_t device, enum igt_acpi_d_state state)
 	return true;
 }
 
-static bool out_of_d3(device_t device, enum igt_acpi_d_state state)
-{
-	uint16_t val;
-
-	/* Runtime resume needs to be immediate action without any wait */
-	if (runtime_usage_available(device.pci_xe) &&
-	    igt_pm_get_runtime_usage(device.pci_xe) <= 0)
-		return false;
-
-	if (igt_get_runtime_pm_status() != IGT_RUNTIME_PM_STATUS_ACTIVE)
-		return false;
-
-	switch (state) {
-	case IGT_ACPI_D3Hot:
-		igt_assert_eq(pci_device_cfg_read_u16(device.pci_xe,
-						      &val, 0xd4), 0);
-		return (val & 0x3) == 0;
-	case IGT_ACPI_D3Cold:
-		return igt_pm_get_acpi_real_d_state(device.pci_root) ==
-			IGT_ACPI_D0;
-	default:
-		igt_info("Invalid D3 State\n");
-		igt_assert(0);
-	}
-
-	return true;
-}
-
 static void close_fw_handle(int sig)
 {
 	if (fw_handle < 0)
@@ -326,27 +298,27 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 		uint64_t pad;
 		uint32_t data;
 	} *data;
-	int i, b, rpm_usage;
+	int i, b, active_time;
 	bool check_rpm = (d_state == IGT_ACPI_D3Hot ||
 			  d_state == IGT_ACPI_D3Cold);
 
 	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
 	igt_assert(n_execs > 0);
 
-	if (check_rpm)
+	if (check_rpm) {
 		igt_assert(in_d3(device, d_state));
+		active_time = igt_pm_get_runtime_active_time(device.pci_xe);
+	}
 
 	vm = xe_vm_create(device.fd_xe, 0, 0);
 
 	if (check_rpm)
-		igt_assert(out_of_d3(device, d_state));
+		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
+			   active_time);
 
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = xe_bb_size(device.fd_xe, bo_size);
 
-	if (check_rpm && runtime_usage_available(device.pci_xe))
-		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
-
 	if (flags & USERPTR) {
 		data = aligned_alloc(xe_get_default_alignment(device.fd_xe), bo_size);
 		memset(data, 0, bo_size);
@@ -384,8 +356,10 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 		xe_vm_prefetch_async(device.fd_xe, vm, bind_exec_queues[0], 0, addr,
 				     bo_size, sync, 1, 0);
 
-	if (check_rpm && runtime_usage_available(device.pci_xe))
-		igt_assert(igt_pm_get_runtime_usage(device.pci_xe) > rpm_usage);
+	if (check_rpm) {
+		igt_assert(in_d3(device, d_state));
+		active_time = igt_pm_get_runtime_active_time(device.pci_xe);
+	}
 
 	for (i = 0; i < n_execs; i++) {
 		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
@@ -429,9 +403,6 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 	igt_assert(syncobj_wait(device.fd_xe, &sync[0].handle, 1, INT64_MAX, 0,
 				NULL));
 
-	if (check_rpm && runtime_usage_available(device.pci_xe))
-		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
-
 	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 	if (n_vmas > 1)
 		xe_vm_unbind_all_async(device.fd_xe, vm, 0, bo, sync, 1);
@@ -459,15 +430,13 @@ NULL));
 		free(data);
 	}
 
-	if (check_rpm && runtime_usage_available(device.pci_xe))
-		igt_assert(igt_pm_get_runtime_usage(device.pci_xe) < rpm_usage);
-	if (check_rpm)
-		igt_assert(out_of_d3(device, d_state));
-
 	xe_vm_destroy(device.fd_xe, vm);
 
-	if (check_rpm)
+	if (check_rpm) {
+		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
+			   active_time);
 		igt_assert(in_d3(device, d_state));
+	}
 }
 
 /**
@@ -561,10 +530,13 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
 	size_t bo_size = 8192;
 	uint32_t *map = NULL;
 	uint32_t bo;
-	int i;
+	int i, active_time;
 
 	igt_require_f(placement, "Device doesn't support such memory region\n");
 
+	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
+
 	bo_size = ALIGN(bo_size, xe_get_default_alignment(device.fd_xe));
 
 	bo = xe_bo_create(device.fd_xe, 0, bo_size, placement, flags);
@@ -575,7 +547,8 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
 	fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
 
 	igt_assert(fw_handle >= 0);
-	igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
+	igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
+		   active_time);
 
 	for (i = 0; i < bo_size / sizeof(*map); i++)
 		map[i] = MAGIC_1;
@@ -585,22 +558,28 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
 
 	/* Runtime suspend and validate the pattern and changed the pattern */
 	close(fw_handle);
+	sleep(1);
+
 	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
 
 	for (i = 0; i < bo_size / sizeof(*map); i++)
 		igt_assert(map[i] == MAGIC_1);
 
 	/* dgfx page-fault on mmaping should wake the gpu */
 	if (xe_has_vram(device.fd_xe) && flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)
-		igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
+		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
+			   active_time);
 
 	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
 
 	for (i = 0; i < bo_size / sizeof(*map); i++)
 		map[i] = MAGIC_2;
 
 	if (xe_has_vram(device.fd_xe) && flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)
-		igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
+		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
+			   active_time);
 
 	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
 
-- 
2.44.0

