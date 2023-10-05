Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41745E92708
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 15:07:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0755B10E420;
	Thu,  5 Oct 2023 15:07:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E0B010E41F
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 15:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696518464; x=1728054464;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=6nHPKKgwnmpvLB1v338TKG6FQ4sgf5MfUTECilScLHg=;
 b=Xcrpxrqa1GLFc1MmyBJrj/8MVuS1hgd1eOr51M6lsnE16HLNNsNaBjud
 3JeyPWb38MMQaVY9cD7CV5uvsX05RjtGhmfsh0vyNo8AiKmEIostyTZjt
 fSVTnhq1chdrxC3JECFRWCD5LfvQwqr814XL7lBMvc3boj1nbEcnhp8mQ
 gc26loDS7UmZL0Z4hQkyxDi7WOrDNGWbUZZ4eHUErh+4ktcIn3lOp5BAS
 Vyfgs+vxzzP5mZXFjk9Ft6F0bo9koaL9UIbF6dsVSbOaJsNbgoDFObW8l
 gxK3/C2EcQtv4ZS/qlwBULPYEw7uymNaQ7CHClOwufzmJglQmZeLu4fDb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="447710148"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="447710148"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 08:06:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="701683326"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="701683326"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Oct 2023 08:06:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 08:06:51 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 5 Oct 2023 08:06:51 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 5 Oct 2023 08:06:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iiPraKR6j9uMqmN0MYNuPyHKJQLs+TCIM2lONkBrdzWFiYcMj8Nutpmt7milDYhmGdF7G/DausXXRjx5bxlHedCT5rpG5Ajpf1yGdYs+O7PPKyskxhmaZdH082hGyxfsU45X8mLE+E0Xgb4ORZVJAlwhZOAZSCY9YNjW6ZaaTo/c7u+fr3tCJqAJWFt0XPtCjtRWWgnx0FtsFYZ7DQzXCWM8xeCK7LNm2acmaaZJFYpOObrEUVhQc0EtDfHr/UeW99Qhld+OTHpwqN7+X2rlfe5T27Phpva/SI6ZSy6vyNLdul5hXuHQnjEKgOf/7uBE4A3RvEL/LFNf216z7t5pOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5XI8XE63WWXsVNW3BhNswUsUXW9VXdhyyIe2EapNaoA=;
 b=ApB303GHrP7eKnW01yuK8fRS2OTxFbbV4doFOnM1t7MCrY/NmrgIy8HWmoFa0SBu9Ng28MwKMaFowuvTNy2gmlbxV3WxhcHFdsckXt2kRjvEb75yegeX4f4zP5P5lK+gHMTyaANM+3RJHp2aG4nX4ZwkCAEF26RxKs60hejLO3NCro4RtF9cuevJDHhUQXiOJPhWyvjfz5PEzJc8qVQdR4hZAf17PnbHx2kYKJ/dKqdPy24XY9SLyA1dYH90XjObbX0EFbqV3H38joV6QUfJqMs2/vmqjE1KkPRx/jcW4/xJZGTLkQO0hwnnnZZ8K+CCs1nNUWJg+wfvnhQ8vr+O3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ2PR11MB7576.namprd11.prod.outlook.com (2603:10b6:a03:4c9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.31; Thu, 5 Oct
 2023 15:06:49 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 15:06:49 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 5 Oct 2023 11:06:18 -0400
Message-ID: <20231005150619.9521-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231005150619.9521-1-rodrigo.vivi@intel.com>
References: <20231005150619.9521-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0322.namprd04.prod.outlook.com
 (2603:10b6:303:82::27) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ2PR11MB7576:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b8960dc-883f-4e02-648d-08dbc5b4b2dd
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lcEc7Si1Phumnmwmu9AwUo5NZY3PfJCm88DwTrzLVPjCgnCCerFmcHrhW1PMCRLCuXNVKEPCzYdHkLWZA2nRoIvW1HpDG2RlOjiKBO9jM4tUkry170/pjUDazCZw4bBr7/cBLeaFAG+Wz3DX7iA+dMFh2FL7k1rAU6ReiCFqsYjUocO460MJEVEHrfIC9Y6W9bERD9Ul0uaEU3syhTAAH49hCKlMzjIYFchqibdylOEAT+gCGb1Mwonclk8cJOvjGVPMWnqGf2t7j7GMIX1JALEXkx25yrohgpJ3zU0ecoLFqdpGbhwDJo6BBH0OzTzoHRvQH1Uh8kzgSE4MoyR7PDsrGmQsG96mEkcBklOe2CUUMkiSPzfMLY/M/wV7LFYj2EvTATDclkb7VpBOHHlrRQSwIi1av4B7f0W6y4/jdx6zPen4ugiMm4oeZ4QzuCgPoACyE/skbMUh10CwZjOC/lJAEznIEcZeQzxqJpNEVWCmd5hTvIKfdrdIEJyGAYriNpNgeDfXBOyYyBRw6M9yzxtkjQIGFz0AsO3qZW4vQZLpDUnNZ0a7lKq0F5STC17n
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(39860400002)(366004)(346002)(396003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(83380400001)(66476007)(6916009)(66556008)(316002)(1076003)(107886003)(54906003)(26005)(66946007)(6666004)(6512007)(36756003)(2616005)(6506007)(38100700002)(86362001)(82960400001)(478600001)(6486002)(2906002)(8676002)(41300700001)(8936002)(4326008)(44832011)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?132H2zvudEUx4QMjE3scjYUvAD27bsN0446JQHMryEIBkeLWhaejfIbndlTO?=
 =?us-ascii?Q?xzpJhLOIoou8Sj9CQ8+XocSxXpGVjmdKDM9FPhRaxYK+ytH/FcBjkZfU6orx?=
 =?us-ascii?Q?WDI1YL6R1ZSmlzsbhc+9DRIpzDnd6aEhmgqYNcpwdpPPqWdn9ThcUSE3DfI+?=
 =?us-ascii?Q?3lH744TpcUlx3ETK3jaSzGPYwErvIsy51au8tzBFhR24thEFrtA4tyA2rgqz?=
 =?us-ascii?Q?VcgvLS4YiHWBbuXtmAqAL1sbhM9jpD+pXJ+6iJopl/RYGBVICqn1UgwDkcRi?=
 =?us-ascii?Q?R7ShN9HAHS7YKOadev5/3GxDYTI8pxwZqDJeR70euljq+VY5Um4DM7ra8JN+?=
 =?us-ascii?Q?krqDZijWj14iKAokaNjQ++tzDVCnPitWcL04tkj5IVdA9sNEGhcbQZYAPsSy?=
 =?us-ascii?Q?B23cUbR7ulN+SGFw5aC484TKRcsTsM1KHCL1D8NIYKCHwgUNcbKICTUR7nVp?=
 =?us-ascii?Q?t59J5n8Ll6sfPCdnA7RLZ6TZsOfhlia6LBYq4ULwoB39Y+Fpnj6przNoH0l7?=
 =?us-ascii?Q?CGFjl8DiT8fRAnnOQRaQ70pOTmyZyqSxN3/i3Ss86OFzMDnkrbkqCYv/2EWW?=
 =?us-ascii?Q?LwwdiDlV23r2vsgn0MX920HdIXkg49c604l5H2XK30DUTaQNGi6ofZpEHXwl?=
 =?us-ascii?Q?EeVg/YKovnaRxFMTaeeFBfGx2xpa3n0KEjPyY/xjem0Z2lDdieACi9HpSY2q?=
 =?us-ascii?Q?Gyc4THaThjM+93zvttWiCG80cpvEIPIO5hY+Nk9tOYrJbPoZvy631ZmHY/M3?=
 =?us-ascii?Q?cjHtcdwvWMViPqUtiXft1WN6n5Oh1DJl95Smq5bTkbVRa2uCjzsvXtOl4pt3?=
 =?us-ascii?Q?ZLsJb6TLIBApUKyti510A/Z4Qr7T67LIWYL4At/6kWkTnRPvep3DhppVy++7?=
 =?us-ascii?Q?RFqc9LXnwXoW9TFnZRHL4cWialHEl/IV/mHGyk485qvno6TdJhXE4Z5staUC?=
 =?us-ascii?Q?5PzdOKcvg08gNLxH1/lcEimJu8iS2g37PbWhXGiwkQHATiObZwBBtF96DrkH?=
 =?us-ascii?Q?0AnkwWEZ8dILqmA0DnSKHqxXHXmdZ9dW3ITrr0Xj+7ncKWwuMXA77lAFh93M?=
 =?us-ascii?Q?vWaQgF7cX0tg656eVh2peJxYK3UDY6tDP6bbYDi63w51IMlx8gxqJkQ528ro?=
 =?us-ascii?Q?6Gn2CORMGzzqftLbOzAbbtGvDZimluXbFsrl66tINuZZoAnJcAJtnSt7PdBu?=
 =?us-ascii?Q?w716SiKx003cG9YYNGN41bap1/+g6ALblAuaqLi22k108RLF+97wn6gRD2ox?=
 =?us-ascii?Q?YkwIkuDOa6DEDGlNQjRQojDPyhzpA+K35dKrKTMUVOX5dY2Yhnb0FyfM8an3?=
 =?us-ascii?Q?eNIR9C/m+SGbtjJF1Cv7/U2E/Q56PTEXSBCZVJFM3P+9KD2KCy8uFuyHDwLi?=
 =?us-ascii?Q?RnDyLAxDL0V0sf0J98iVhYmw2DZa2fROy60V7WRyvsW2WQuG00oKqmo9FAUu?=
 =?us-ascii?Q?nbvUSRTdUyJ24kDvNFyu/fS96dgM8EFYY+3QKlRBqQwyB/u/6NCWUdl7uuBd?=
 =?us-ascii?Q?5C7cXFAt1sxYNmJAMVKJ7mQFqMFRa+RIDJ6WEl06BlPc0ti6RLzMaOwL+z41?=
 =?us-ascii?Q?ApX/Z+KddqtomX4zMDyyhNFHQ+tpHMHIVR+Ed95YyvnDc4eMjTWM9B6YC/wP?=
 =?us-ascii?Q?Ow=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b8960dc-883f-4e02-648d-08dbc5b4b2dd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 15:06:49.1457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ywxfQ7OPaL2GxLSKJ3gtVDQNoiD0IL1setsL1zkY94HunC+6MyniXEp9trgghqvyunCJn80aXVKQ3wpcfROk9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7576
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

