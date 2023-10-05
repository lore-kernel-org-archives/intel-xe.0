Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE1CE9370C
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 20:31:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36DBE10E482;
	Thu,  5 Oct 2023 20:31:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDAD410E482
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 20:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696537903; x=1728073903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=6nHPKKgwnmpvLB1v338TKG6FQ4sgf5MfUTECilScLHg=;
 b=H6vu6qdiMY5fEBOMLPoFeshjRThye2j5n6OiJrb5x5iq1/tfU3+vUx3z
 gBy0FaDEw/mp5mwTTMVgFO1uxiIN3SFs5ThseD64lfkePCMLsyXv5G/pC
 cffT9n2i9oKPIhH3XliHXVfI9cyhaj1iEdzLV/05AQiBcOhGxauY2bhmI
 /gMmrPUq1ESDrOpmjrDOUWHQhMAfncqHGr3yRgT6g4oRiEGJg5RAkcERb
 FOSAXaGdzbAb8JYbNfl2dT5SoRM52djJhW6mI8XbasaiFgMea8tgk9JGf
 k+0WGDMXCqNlFe7P7eUnd6ozms5+sAq3K0ebiPD7GOVdsiEG8IZhzUUOC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="5169651"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="5169651"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 13:31:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="842557817"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="842557817"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Oct 2023 13:31:42 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 13:31:42 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 13:31:41 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 5 Oct 2023 13:31:41 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 5 Oct 2023 13:31:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BCrhGXQUHHUHP81fk/q9KwDc4R8GKAHqRfwqD488rx5jz52m4ZxVzAb3lxtIwJPktMyMFgIkiIWKL8Syw1nNbfWTn3oHlLBBwFJzPDjnBitI8sic14pEuw8ZB/TVbD63WLOB6//SIWepIuHuZjvKviEJ3teYzjwnjUokKe/vwkFqINJ58yjZa9bm/gARUfNEaM/aS27an0ZxOY93SDGMG0uMkNLed0Tnegr0tGIKzEvv1snPtVQYRt23KW7UXPVJQyp4VN4I71xQjSqfqorEPRdXrWK0dfcHAx26gktA3XYWAgwjBMzV98hLPnj2lAOKkySuTRaaqNszjPOhj+5kLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5XI8XE63WWXsVNW3BhNswUsUXW9VXdhyyIe2EapNaoA=;
 b=CQpWHkqHehnh707oqbpxVapxoBzljJ/FXVA7LEGlW7aaBj12eynvJNnrx0eal0nHYU9AhOBWrrLCsmst1tYz3Pjr3qmTPlljHtffLJszsKkpsyzQVnfvDFYCCn9mQUBCTU2PE4Sbm5Of5BhS6j7nfBWGsTUoEa6UWe0869L4taARFURq7YgbtH5hpKS16NclVu2VLDSY7g0aknHht29No917aE6gkCeAJqyGdtoESimCkYFTwn6izK//mfyobPWUL6MET24wqeeUBsV/p3vR5CgKusrJRczoSkxazyIJiruZ2+BJLX3L3zPPlNsMGz5fMdlMlvj5/KZSUiy7vZ9VoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6318.namprd11.prod.outlook.com (2603:10b6:930:3e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Thu, 5 Oct
 2023 20:30:52 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 20:30:51 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 5 Oct 2023 16:30:28 -0400
Message-ID: <20231005203029.14849-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231005203029.14849-1-rodrigo.vivi@intel.com>
References: <20231005203029.14849-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0030.namprd10.prod.outlook.com
 (2603:10b6:a03:255::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY5PR11MB6318:EE_
X-MS-Office365-Filtering-Correlation-Id: 80bc83fd-53a8-4a4a-faa0-08dbc5e1f759
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p6LJiqrnBpVpmjhBjNiudrRHHfF3E+/fvE4D1dM/Q7meO6zPtvoAUMDhCryUNhfSakJ3ZFARwIfVAUrlJABo+GYE3Jo6zxR6OuzW60MDyrB/W9liaXzuuA2dsBIgjXPIGBg7bpWM0HubzFXOibmp+VjI3FAAKv02gnNyRtkS8o9/z2jcR0gPHuuOz6f3I8a68GygwQW4VrrJCl6k4P+TxyO/ecOajLfHQnBljpt2crd2DprSVU6aXdFiQ8blqRwQO7eCFz7F8x1wsZBPNu+QhSHX9MybkNeUMxiVZLDD1dcxMX+45y2ITl0g/jQyy6IQ+34Gq8fFvfw58/hLRUS61NMCo7y37UR11TgVb/r5w92m+CPKDgrH+N4obzgtMxpj3HCKJM0Pdm03KRfq5F1oRHRrJInSM1peNvOa4N5H5VESpCK99TRZ2NnmHIMmo++op5ZJxT62rCt7pGZ0DuUXIGXyrTgnnl6++edo2eiPd2F79lvh6mA5qBJ/AP1i+hSYvPkIMQsSe48+lWrbD4DATLJ4cOtiCPga6bNshf/frgnuHaQ/YHiau87VfLfUwY4e
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(376002)(396003)(136003)(366004)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(107886003)(1076003)(6486002)(2616005)(316002)(6506007)(6512007)(41300700001)(66946007)(6916009)(54906003)(66476007)(66556008)(44832011)(8676002)(8936002)(4326008)(5660300002)(26005)(6666004)(478600001)(83380400001)(2906002)(36756003)(82960400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?as3F3gdG03zaRL/buXbfe60HrW3tci2TYh0CMSZKBWcWi8KMsmDhBf1TNPLq?=
 =?us-ascii?Q?F9dUWSsIDJ0zP3JgRMmQLcaVjS0cS5Yt72WyamuWmj6wunjz9g78PEQV5OTv?=
 =?us-ascii?Q?ERtsYf9C9gONOpD0sZ1l9x8PIjE9F9567Ft6oDKj/yqSX4vHftz8YRePLuAY?=
 =?us-ascii?Q?pXQpJNVnydK4I4XsDr7fUg3BXczwXTqReNEt5q8swkHSeY6rjEJcpv6RO4WI?=
 =?us-ascii?Q?13HqHwDBAea+LxKWYXZuzk25BLhQWt36bDVrLCzwgwhY2oPzBI3Z9my6tsNo?=
 =?us-ascii?Q?ZhCt5TKYd5NmGuVHVXo3clARiZwd8993WOF+Iat9tF44A743jFdJ2H9Z2tMB?=
 =?us-ascii?Q?dS0btbVwhKDpxpv0esudMk03p8AzFxPQbrPN4lnS9ZdifVJv99h3uTyRz/7i?=
 =?us-ascii?Q?JPm1hQRzU8KrozVrZyRTCefeeI8BcH+t7ItGLAuBJI6zSObywBEIGwuF7xFD?=
 =?us-ascii?Q?KnBhIYlKC4Ie5bEIX+6Oz0H3bVXlvZ5Cl3mEZTIunpVm3aQfN1qLF6ySrABc?=
 =?us-ascii?Q?HluMA3tQWc33vPD8954+cLZfSckVIAmS5l7PK7svTqc00ONtNyiQZUMrNOYO?=
 =?us-ascii?Q?MmzaCVUdSAyZG4qmzUYX/nVl92qydNtCW+DjuiB4603WOjDf5v+dRYjPn4YB?=
 =?us-ascii?Q?zvhFAw0Wn6i2eqit3jASpeq5yC880+T4wlNz0lheo0fNhEuNlHezn22hPg1Z?=
 =?us-ascii?Q?T4SiZVyHE7YYfCXxyvW+UqghCrM/aZ5NpxqwD1HjSr6CqR6xvISx8rrLqV35?=
 =?us-ascii?Q?PFbnxKaX8iF2GfX2W2q+v4uP2pdbZy1OMztysBjNOVd1YCxL7D1q3YEYuWKP?=
 =?us-ascii?Q?xqaz87ElP/46X3+/DQ/wsfIIydSPUJB5PtcqVHvXprqpd7bQIvkHfuStj8am?=
 =?us-ascii?Q?tAnkQ0Y1TaaC6LJODpk/A+BXMoGkE4l/PyauS8ibFipP7lrZE19VCteWMRvF?=
 =?us-ascii?Q?TdqI5ruwsg/YlIfo8Lfy14q/wlR4jk5zKsido+eWaHC9usR2ANbJuSt71u0z?=
 =?us-ascii?Q?D3JRuUMKkm2T30eWz8on+bdhSh4BZnGhKVGxarqW9HztQp6kvJzrK+CyCCDM?=
 =?us-ascii?Q?mkKyMYhk5ooFvXpSeMj3Ap1mgzfvP26egiPPk3+Y2N8D6wMU5i/l/mGlgvYn?=
 =?us-ascii?Q?YHHj7Z4yKkj5j/eZB0KCZ/9jvn+ZoO4HLcXBzl75rMf9E/EOrWudKxjMoHVQ?=
 =?us-ascii?Q?BWvytds4u/ZORbmKq7iLjB/q3eHoiGIInPz5+IgTdFOcmPHfa6EspAYi1M/O?=
 =?us-ascii?Q?MlXcmQwzQYbUAsIUZbBjD4JMuhCC19wGCXonSgqaL661fYQ8m4nen+gsRMjJ?=
 =?us-ascii?Q?ICgfQS7cOant36RkRdlppy9Djeafm/ca2h4fBJBEEQ/UUUhh/uuhH3WJl/Bi?=
 =?us-ascii?Q?eSlPF0qgIfS2osfPKZ0f+0xoecPqHg5F0zFfG4foJKWdRhPCm55ezroTs59m?=
 =?us-ascii?Q?ERCQG0ZPXq5Rh6H9thTujGVXeRXNauPY693AzKYqslOm+0Rlp5BGZ2jQfa06?=
 =?us-ascii?Q?ZyxjhDEHY0des3LhmWMFcQYxebTWWl7cdqgqFV8xESEjjVS5sCMEpeNpfaHJ?=
 =?us-ascii?Q?iQhLtrMbTDrLmC/6alYF9Cb1fULQKq8w6CzwKQTrbJYsI/upxyriDv0MEfYU?=
 =?us-ascii?Q?4Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 80bc83fd-53a8-4a4a-faa0-08dbc5e1f759
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 20:30:51.3727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YNE+giv8Q3N21uPeVfyYlEX4P6zHXEKKT7zmmuxKQUSmcgIFd3sq6PmS2WzwvX6ijfOWjDGTHLqGpNHwFW+cLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6318
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [CI 5/6] drm/xe: map MMIO BAR according to the num of
 tiles in device desc
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

When MMIO BAR is initially mapped, the driver assumes a single tile device.
However, former memory allocations take all tiles into account.
First, a common standard for resource usage is needed here.
Second, with the next (6th) patch in this series, the MMIO BAR remapping
will be done only if a reduced-tile device is attached.

Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
Reviewed-by: Ofir Bitton <obitton@habana.ai>
Reviewed-by: Moti Haimovski <mhaimovski@habana.ai>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 054ad752303f..52e4572e3c4a 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -383,14 +383,13 @@ int xe_mmio_init(struct xe_device *xe)
 	int err;
 
 	/*
-	 * Map the first 16MB of th BAR, which includes the registers (0-4MB),
-	 * reserved space (4MB-8MB), and GGTT (8MB-16MB) for a single tile.
-	 * This will get remapped later if we determine that we're running
-	 * on a multi-tile system.
+	 * Map the maximum expected BAR size, which will get remapped later
+	 * if we determine that we're running on a reduced-tile system.
+	 * The first 16MB of the BAR, belong to the root tile, and include:
+	 * registers (0-4MB), reserved space (4MB-8MB) and GGTT (8MB-16MB).
 	 */
-	xe->mmio.size = SZ_16M;
-	xe->mmio.regs = pci_iomap(to_pci_dev(xe->drm.dev), mmio_bar,
-				  xe->mmio.size);
+	xe->mmio.size = (SZ_16M + xe->info.tile_mmio_ext_size) * xe->info.tile_count;
+	xe->mmio.regs = pci_iomap(to_pci_dev(xe->drm.dev), mmio_bar, xe->mmio.size);
 	if (xe->mmio.regs == NULL) {
 		drm_err(&xe->drm, "failed to map registers\n");
 		return -EIO;
-- 
2.41.0

