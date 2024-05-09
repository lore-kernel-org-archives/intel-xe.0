Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC754C10F1A
	for <intel-xe@archiver.kernel.org>; Thu,  9 May 2024 19:17:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 848D010F0A4;
	Thu,  9 May 2024 19:17:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dxkHIvpf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96B3910F0A4
 for <intel-xe@lists.freedesktop.org>; Thu,  9 May 2024 19:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715282250; x=1746818250;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=3nNr7L+T8OSWCrJDVWVKQT9i4LrN+2tiHlF7pLOmI/0=;
 b=dxkHIvpftxNiicj8hdpn0uzIuAYHLr0V6J1NRAa4hSVaRJHesUXKDPXy
 46vWVdBY1gQPc1eNlefnCxhEjrAUKAUDyhUN8d0nVqQJNSZxrmZczCpLc
 KqzVYPsIrXke2WCyzGhlEKZIGDtF0kJ4XCPIkap2H3wYmpaA56nF1wYbC
 ioPAlnoA7XiksFd5pLprC5aZbg9ijoj3Z/Kdex/mZuEGKcp9zdBOLEC2S
 dW4oQfm0Yp7NrstlTqMrQT4jPP59OYdhU0ry1awtPe0HyzofbmTibKGjt
 15NraVMdvw7PjDdgVtuaCnS7zbqNjwr1MDqvofUFw5yCesLitcIAGP1Br w==;
X-CSE-ConnectionGUID: ++tKWKMYRhCHyI6s7Zch4A==
X-CSE-MsgGUID: o5XlcxQLSBKd2T0jR+FnXA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15060726"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="15060726"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 12:17:30 -0700
X-CSE-ConnectionGUID: h5vPB9m7TZOzhCRaAk422A==
X-CSE-MsgGUID: GeiLCMR7Rnyw3dk0j4Tgfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="29339912"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 May 2024 12:17:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 12:17:29 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 9 May 2024 12:17:29 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 9 May 2024 12:17:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EydRKvm+QyFWTcptoSaIaUodtzSe91geZljpIFuCwtFTOBZMtraKOYj0NUuOYd/yck7/YHuT/mnEeY3IXIpcmiPSlUccazu9jzJjEiBG0dkJVeWn0wMpLnjxk6z4HrRqz0uI/Amft/5vzfcLXLRhLPDbs3iRDZu6Xh9Wp+3eHWKMTA5h97noL59vJJnt3dyMWNCKvwoYBIm54HaPJRqWJbEFy28auWEjCLVsyilDiCi4j1g8RfSc90gZyGezmzBuyBJlz2x2eEfyFlwccEcPMGvnh4csm19EGpG2orENOxS+j2H5EaciMMX6B+N41kArNLwbzExopoFAYSY6ESU6PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Pzm35NWCa/1KzZlTDhmZO8oBNpgLBrSBngwM2j5YWc=;
 b=jVyjlaucNzgZhVja2KxnE8Pwllw3/VXyrPyrMjeR/TudvReSBTcIGndQ5N0Whbc6XEMzj7/zIe+qPjI1ZpL3hj1kH0YhFo6J1sTGesW/6xbIgYF1qchsmR3Lvf1nq/pUH2EgUY5JDHxRWNH0qDshPosLAKmNM/Nd9iwK90kyQKrE3IFHxKoLSKXlZq++Y/4JsPQyRq87ZFsaEpXpFZ2IX6krVNx70ih6O3jLB1M0NsUNT2jVa/OnxukuyPQJt4u9yv/kWbcBvxA8l16y5/pxvIpORlgpHrOxlmq8fiXZuVqrQvM7+uXtZb6uAHi3CzcBO5GuUfc9rZKVxBM+Ap99bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB6602.namprd11.prod.outlook.com (2603:10b6:806:272::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.49; Thu, 9 May
 2024 19:17:22 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.047; Thu, 9 May 2024
 19:17:22 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Anshuman Gupta <anshuman.gupta@intel.com>
Subject: [PATCH 7/7] drm/xe: Enable D3Cold on 'low' VRAM utilization
Date: Thu, 9 May 2024 15:16:57 -0400
Message-ID: <20240509191657.504300-7-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240509191657.504300-1-rodrigo.vivi@intel.com>
References: <20240509191657.504300-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0320.namprd04.prod.outlook.com
 (2603:10b6:303:82::25) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB6602:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d2c047e-d038-41c5-11ba-08dc705ca717
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fsRv8Bkoj+e5t86l6OVtBj82kPSDtzuydj5Nlq3ChJ+RMi5xNJ5zr+ioTcw9?=
 =?us-ascii?Q?Ek76NxMQ6fuRYhKXXJlyFTbNRIfQ7dfE1vB4Enke42Ig8Lykkk5p635YKaTx?=
 =?us-ascii?Q?yUPazXlaiz2apTV4jcldX+6+NNeXIX0bCTd7eQj89C78K+BFm+PHYbRanxhq?=
 =?us-ascii?Q?9tM/ujOem0G5NIO0iX53+RXwsuZUisVmAERSDRmUkIam9jGyERQORpw10ECI?=
 =?us-ascii?Q?zTJMQfkPsh9QVZ5rOkxd3uuxBBWlWDRKGAXQTpDT/jIEKXsrEl6WLHbQhxe3?=
 =?us-ascii?Q?Op2Cd+3YVT1Y1qqetxzX6gmuvOYOpEOj/5pagC4oL+IDNaA9NuaJhT/lzrVp?=
 =?us-ascii?Q?I51f79k0n0e6iIIT6z1NxK5gNZquQPEnAQOCs4R9v8nIVtsSj7h7tTVG4JlA?=
 =?us-ascii?Q?YyZBXFrFEhmgJqe6evpzYw8RW5aW3aIaMlrUrZtj4urzPLs7rn3iLHJ6AARp?=
 =?us-ascii?Q?Be60hJ1PjVTzJwbGvLNoskqKLjOX8qSk9mQ63ewYZ+Y0/wu/nawXhAzHPUKV?=
 =?us-ascii?Q?5H4ZIXZhGIUDG9ovLkHExgGj8jfWR1gUfvNVSjaGnVZ36qVvW7WzdTKXPywF?=
 =?us-ascii?Q?vNpnIAqqJZcxiNNNxhBMGAQwBilZvXnhC9y+fQhhUBduJDBBK4hV2FcV1MI9?=
 =?us-ascii?Q?GRxLIxxhSzVdj7w1PAZ5Uv0bLuEZa6MEubHeXqNA47XoOzCad9qkZa/0mors?=
 =?us-ascii?Q?EG2KC28zOXMMf1+onfohGn65q9yt97XML/xyvN9XmeonWoHcnJvIh9Ep4UW3?=
 =?us-ascii?Q?rHJ3ouehEzHT0ZTrfOMT4xGstIpo694bWtfz3qtcXEh3wifJ9demCxY65R6x?=
 =?us-ascii?Q?VgOSVR2AIQ1nk2R8Wgb9S2CSlU2XLqrbAY4SfLYlLOgMLYJyYcExEgGAbryq?=
 =?us-ascii?Q?4JgaycC9bqf76HwPVM9enP6kLOedYfAq18NHz4fZqpRpgIrUOG6UEu0uOJEz?=
 =?us-ascii?Q?Qxk92ZZgJ8lLqd42icqyi1DumaJQKjsrqkSyqu/SRDr6TUEtLmwNgDOpTX07?=
 =?us-ascii?Q?NxQDYaVHa3JS0wEeFPsOutFI3xQDpO2ZZTurXVkLATC2mRA1GxztkhVhpgSh?=
 =?us-ascii?Q?KSJoWDrhJiJnVJvCQQOQUj6uZtExA0fa8HKf3eInpyfLke130z3FG2WLMXu8?=
 =?us-ascii?Q?dGf4MFRpFRFZK+XUrXlUe27sgJmP2LlV+pi111kWxx+XOsCDYCzAbh6exIaF?=
 =?us-ascii?Q?wbBvwUn+ByHjUyFER1j8qLbeeXnyuXVWMcijo1w7hwNzRwG2olUbnkwtOJsj?=
 =?us-ascii?Q?Ycj62rIMqgz/9n2fKF30OZjC6LJ4EWvVYAnLzdh0ng=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?idrdUSXtrgPOJ0k+QBRTa8gG3Tqfx0wCMTMvhIryiESEJmMtfVjHfmgJXciV?=
 =?us-ascii?Q?nsYOJbRPWfgTZYJbIP8qOG1tAf05FmBP/lWq6YW9WPtwjzMgsb6pM0e4EJKQ?=
 =?us-ascii?Q?P/Qz3GTwhV1DEoBFKIlkg/aBkmHCagS2yoy/i3TOxpIfYYeEtV/Lu97bzAu0?=
 =?us-ascii?Q?H7V94CzPjRB/xoPs/Ac5X4+hjqEYUHvjklC7DnGaAbVI4cRMENJWVSWCzc74?=
 =?us-ascii?Q?36oUoPsKc6yHgwKl4wXyDDF+A7wvt/TsLt/WEuI6Ald6QnSpvCpvN2P+4Ypd?=
 =?us-ascii?Q?qkyXHLklv8Yu68ATaMJnl4U7iRCOXeMD/oZJy+0MCVAeLrSaUyorilRUyOUK?=
 =?us-ascii?Q?zGiSgF+vJbVMmD+tRKKz9P70gTHJkKLL5DrnHgi6248tem/qD5b3e7QBETps?=
 =?us-ascii?Q?UAkqiHyeqRjZ/OyWsjV9wXSEAG5wJ2dGv2et9Fnm/5tWXmFNln7Btdn/nb7t?=
 =?us-ascii?Q?NEWqWAzQNxdWXxk3A7cIRRLr7i8Eb1+zThvv0hq+QiNLF+TJZE72h1McMNpP?=
 =?us-ascii?Q?VHCnTjjnGuo4C0tsapi19ebpGm9nth1TRSJxzl2Up/o87NfEi5G8CH6Uk0Wl?=
 =?us-ascii?Q?CyFojjNO71H184fcl6XxysYiBNaVpuMBB87sNb6k5H0PIaSgAbB3Wx1F+t0I?=
 =?us-ascii?Q?XEhgOFXHu0qSDO69HfZTON/VcEMegk7pRa9rNyZot+buHuORRveGUKSL3PLK?=
 =?us-ascii?Q?OZ7J/jMz5qImtLnxvpqbu7GdWwptK4Bz/mnLtKqlIcgNGdBJ13CqDuQJ3Rvn?=
 =?us-ascii?Q?q159gHCUetV9QelUL69hlvvlrev4B4msY2Q+l5CZVsPgBcOydqIUysDwgVfj?=
 =?us-ascii?Q?m8eOwwFZI/ARL1mPT41IL/DCSpQKW4P9cydNov6mlTN0Vwq4T42e8+d3QE0e?=
 =?us-ascii?Q?jvvQO5v3nx9IUHjKxLjL84f+5b2yMwwVJm4JL/rZ1rC0/QIPW0sPdLyS2kz4?=
 =?us-ascii?Q?cCUC0c8JUO2z5/5GsR9OyC6mCSN4V0P+yPEbVHJJd1WYLNfxsDWqFBNp5MCf?=
 =?us-ascii?Q?wG97Kb58yPfvJjRjCAoaolOJu+pct/o3rtBMIjk8T1CU1entJDPHcTZE2aOR?=
 =?us-ascii?Q?8NkGUaXEvkUrvPcmmNCZdKsVljBZt7paoPOpI7pvvgMy+/KgpMPiVJo/1ZsA?=
 =?us-ascii?Q?YpDNnBmmhbIbYraA1+MLwVUVHDDO96ZwVsaNscts1l+294/hty2Q1c/2d1Wy?=
 =?us-ascii?Q?Q0nKmiFOHAoCYveHKojd9mXS+D9H7mOBfVh4JPalg+q8EAJuHLDmF6NVdlnL?=
 =?us-ascii?Q?rOz5P49iinZ5E0B68dpkwZu50vIYfmPYxNc1XHclXRQRxJrBFV7C6GQCoKKn?=
 =?us-ascii?Q?9G7sEu+vHufRMABn7ywiTDImzY1H1VeXOGZWEQyG4Tzo76Y1h8ck7QDsgTiw?=
 =?us-ascii?Q?KgcnlHcmfbXckYAQCBu7DU5EZhJEYTnFLDjLdSL/LpuelLQTISBp4Vx1MW7p?=
 =?us-ascii?Q?LynOZBXjwmIFT+3EbPssWy3RRE9PrPQWd8CYWmPEh2mHUkcl71ffuFJx5Dp+?=
 =?us-ascii?Q?UsVOgKLCuY4qBa7jVN7Yl6vmWiPRJ748kuQlJm1NkDpS5+ep+45IONNwSxLU?=
 =?us-ascii?Q?Nl7UIP8C492sPBxCACRNQPp7ov5Xug1O9Qv684/m4Uw8hvdtwaUg5GGj0B4L?=
 =?us-ascii?Q?oQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d2c047e-d038-41c5-11ba-08dc705ca717
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 19:17:22.4429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yd+wXwIsqtiFKbejFqmy9ZOskg9ZqwEAcm7we5gblTmiTOErxFFdedNC22Bs2q5uRFeE/oDDZ9aH2qG1o4SvTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6602
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

Now that we eliminated all the mem_access get/put with its
locking issues from the inner calls of migration, we can
allow D3Cold.

Enable it when VRAM utilization is lower then 300Mb. On
higher utilization we only allow D3hot so we don't increase
so much the latency on runtime resume due to the memory
restoration.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.h | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index f694005db278..104a21ae6dfd 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -8,12 +8,7 @@
 
 #include <linux/pm_runtime.h>
 
-/*
- * TODO: Threshold = 0 will block D3Cold.
- *       Before we can move this to a higher value (like 300), we need to:
- *           1. rewrite the VRAM save / restore to avoid buffer object locks
- */
-#define DEFAULT_VRAM_THRESHOLD 0 /* in MB */
+#define DEFAULT_VRAM_THRESHOLD 300 /* in MB */
 
 struct xe_device;
 
-- 
2.44.0

