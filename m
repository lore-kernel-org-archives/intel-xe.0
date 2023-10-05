Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB77E92707
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 15:07:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7255010E41F;
	Thu,  5 Oct 2023 15:07:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A0C10E41F
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 15:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696518462; x=1728054462;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=J47R4g/rQILAPlQMroIEaNgv1hcLKD1SWzdjqi9VCAg=;
 b=Cx0Sktf0Yl4bM20QjwVEIivV2UpTUExioEjXbjD0XGfJCj9v7iU2a/Ul
 x5OQfb6zHpkebRiNM6BVVxgyUccvuryffVqYnWyCksWVRqm9D2Zk+gDwm
 uEwCYVGIcnf+otYLh6U/LQaFA1BNw2sip/YIk0Zu1ACtGPi5nIboFX7nT
 iHHfs0cQcpIiFA/i6DmsxnXPCqIfcqdPDTOVNrirqmUN0ZsCSNVtJ5UIB
 EbO7aTRnx0QCLG99w0fj6nKufkQqsg44sf9Oi/ekhgyu4+nde3tC1A/2Z
 oefyCtPJ5nXSt0wnRwIhVdHONvfU3zO3jfKPZ/zCO/g22o6aWNMY4BXXA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="380803003"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="380803003"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 08:06:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="781283030"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="781283030"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Oct 2023 08:06:41 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 08:06:41 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 5 Oct 2023 08:06:41 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 5 Oct 2023 08:06:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O22b9Qjjjifg/p8cIY+a7mv7yCG94LFFc+7TLCU3wvkF7saz1v2h5wKzBGGz14SD0DQKVhy6+AiVySpj5cJmxSOtcTn+/qXdw1TYoNJZpU1fXyBLMXjz03nlsWQPpkLPUDaEJDJPyby7ZNPhm0Q96yDip9ravG8vrw45uW9sipRhXVYKaopwXOCYbJOe49tjHuwq1Hskzzeyb1QjUYU01R5xCTccdYQBOu3J4uflX3YCLeh+P5OS6KA5Ql2GqiQJVN58xl4QAdmrEHPbRCtePa2j4c36qCwPUIQr5gCzGwXK62w1AnhhnsZDqiyahF/nZHNXfafXuLGXfGxTSJoBmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4qHsZU0+JPRNwqbkdDGmCtLDBHC1ex89Bi5+yfpahXE=;
 b=Ay0sif6RQodXbPY6gxPWdWIUG7o3lya1TRu79gzMmooerBPa+tlHrazpWcI4djaZuSYVF+8jvJ5aUE32N2oAUn8RoK7UkVF1Iinssv9QRM8ZMAbsOrOZ8aB4x9eBoz5MNz9LIlBUBYvwK/xEDJHue94cLjA0RTeBqxUql6lnpt53c/DomBFIrWeU0VnRG5U6AUpOWOBXkyNmINIiVVQVPAmnxeDMd6KPbtdleL9TQgVmObmU8ytoDCjtmGmAqSkgueTlXOAPDKJG4V92e4uuKvZLB8Q3s/n9eMAF0BuN6Rq+2og/7fgmI86DOLyh6n+JTVIp47U1vBlBnvsco+HxIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ2PR11MB7576.namprd11.prod.outlook.com (2603:10b6:a03:4c9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.31; Thu, 5 Oct
 2023 15:06:33 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 15:06:33 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 5 Oct 2023 11:06:15 -0400
Message-ID: <20231005150619.9521-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231005150619.9521-1-rodrigo.vivi@intel.com>
References: <20231005150619.9521-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4P220CA0030.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ2PR11MB7576:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bcd0756-6f6e-46f2-2342-08dbc5b4a908
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X85vPA6fatAPUaxf/VaGgmW4xRhUfD4hZedf7ufW4BJLAgoHiLQSyfnjmDC4ymDL+gMT50LKcu7L4FlwHlm6FkqcrQQlZNZWjt18igAtc/bMmXyPE1PPGl+hKxTypZNNobOKQb2q+L4CS5dzqEnOpBO4t5cXCNGFvytLyL2jcagiHy9w9PfvNoTG0deGg3QkX86ei6ld21pYbHj9/PTpECukXGfSzFvxRxu1Nw+QbMQ5MhCSyFF48NtHYzSR8fO6Bk0qbbTY5x/5eQ46ugu8xzi1GGdPfTU5qg/766ZRDhzzGa3A0etziqg4prfnNSewEF5VRgJcjSV7g5odzV7M12rkzDh2mwPfB0oE73MowMIwq0WcYDDMLPisGLniSO2HcGdnWXo6rqboJOiALJtRqViGkqAQmbv9odch+lajsSmX3WCrzzKmu+IRtFiuNt8mJHzYUo89hpbOQh1luGW2s4XBPgTMmTnW8eFdhXCFFlGVh+0qV7xk/abehPGUueinbUBwYOPFUDf86MpNKrGRmpKjtTc2imUg1UTAAow59pt/5TIVl5o6ghu83f/a0WDu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(39860400002)(366004)(346002)(396003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(83380400001)(66476007)(6916009)(66556008)(316002)(1076003)(107886003)(54906003)(26005)(66946007)(6666004)(6512007)(36756003)(2616005)(6506007)(38100700002)(86362001)(82960400001)(478600001)(6486002)(2906002)(8676002)(41300700001)(8936002)(4326008)(44832011)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Cw2TlGwkqZYsCgev7hW2lOWlxHGQd7z07QgER3jSHkAGk5d2EZv0b60xu6XM?=
 =?us-ascii?Q?XcwN6rBFuHKFTWLk3IKGbrJ+VKRPDmZBFdQFixYR3flSL+g3SRNa5m9GiieP?=
 =?us-ascii?Q?+PyNXJW3azRGsUp7NS7nLHAcLzeNL9mPmKuCjXsS5a2THejvbS695IxfFwyT?=
 =?us-ascii?Q?u6lp3mgIqpV78Pq6bUMiWCXBrqZr8c4n6PV4iDovSojUonRrTK6GsO1G/YmW?=
 =?us-ascii?Q?8FkhWcXBuL6BwwDbghnnWz022G/UGJM7TlO64NFntdtSUNrBNv1yr1lJfNOg?=
 =?us-ascii?Q?VdxN7r/4tjtZueDMlAsTZwYJmBA2yaKYpuZuOTfW9C8v5O+oU1NqQhA2um9Q?=
 =?us-ascii?Q?FTOiYTP8AwdP5Uq6uh/jP/N3iC95luXWRp2FrzhNI6v4laCvy2IEDiYmFN3t?=
 =?us-ascii?Q?/opt4iSB9yX/wqB0cle/wX5ja+yiT8rg9lBqwhY3JPrkeBpcR+6f+8yXsbn+?=
 =?us-ascii?Q?lfZYsoa17bKdmYlX7Y+3yBYJvI3QIkmxQebgdeJFq74lWMd4GM4fosxdKFK3?=
 =?us-ascii?Q?1UmJPfroAwEQKtQGpOmpxO1WQeMewtt3qosf60yQcO6P7NUY8Porm0oAiCVR?=
 =?us-ascii?Q?dpoDkgO6osjnPzk3TZEvex0YIvNHejhgtRflOF2tsXfuQVp5fsfWTCjXhKUN?=
 =?us-ascii?Q?LLXEl1ud0g4smn3f2CwgD8JoR4CRHeOYy3eIGXS15QsXJuhGwskCFP8IXQek?=
 =?us-ascii?Q?G8Wg4+aKyuyfubvNT01VpM6WFpt5iurbHZxqK2r4MrjRHAMt3rZ8PA21Tmnt?=
 =?us-ascii?Q?wdl9gWQNIFhIzU+j7ExJoJ0F2FGGB6gGlCGMLwaqnJ5S2IgPB07xc7f0qnkX?=
 =?us-ascii?Q?vhfuomUwlptn80DXFHW+maQJp7HrFY87CJBI5B4Q0iaAKiBSlsKeRNqLlnFU?=
 =?us-ascii?Q?/xvVHh+dnYkW0EVwvV4VtledtQyYxTRxZ3qHluAuA/bdpm1ln1ErAfy1MUT7?=
 =?us-ascii?Q?YvmkeX49DXyWXsqmpRpc+V9Pc8rA+QPBx98TYXProrVov1oL9CoOeXZJ8koj?=
 =?us-ascii?Q?drCyUkHCNOVCdeslBYxuCv1N8VL86IrgL8J8qsDxbtAMOZy0MLelqw0mn4pF?=
 =?us-ascii?Q?myAmnxohTUWPPILr6QeQEJPkzPHVorU0z2ljoXsW7QCFX0xlQLr0u/M00llt?=
 =?us-ascii?Q?n5jXS0jT0ic+6h8sggUJvnc2pwZIBq2ElX60UQ6TdZPtA/x5sgffULHvsqOR?=
 =?us-ascii?Q?sclOG8SPU5ZiNSgfFw7H23FYzFLy1c/W1OfwGgNNcW72JiwoiLcSiIrKXuIV?=
 =?us-ascii?Q?5Bj4fPW1Txyctjq9phRADi7/7Ov/v2Z8TihLa2Rllcu7qpLnvfzJ7V2b1tvE?=
 =?us-ascii?Q?b7Oc+CbipJFcXAEGb/kNKZcv69MZ/jRrHsMsZWEONFEMjQU110Ehb1Pacq5W?=
 =?us-ascii?Q?We9sYmVg09ZeSqjqkTvWd+3vA+GIJfxHK31RI+zPb/qQhXwG36jXRK/nq88T?=
 =?us-ascii?Q?1ytqLszvTLVkI+skEwLJJXABCk69Db0EL0cr5+jFpkFI1ecpsI/NB/cVZaQL?=
 =?us-ascii?Q?GRLE+UOFYi71ghnlJthQcs17hsqOfN+GRMeotx7k+T3ECs8pdWGMa2fM+itT?=
 =?us-ascii?Q?Ty3i84siO5ZCl0X9O57KPDqNutS87tTm8Av7EGkmWeOxNd9zNpMcBb/1a446?=
 =?us-ascii?Q?gw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bcd0756-6f6e-46f2-2342-08dbc5b4a908
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 15:06:32.9694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JWpFVwjnkOFNXjfP29uSGCbPl7wWh1Pw4fHEOmQ6espWdviSCDQqJCKZp6r0ascj3SawS1j/7Ea8ZfAf6cnl8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7576
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [CI 2/6] drm/xe: add read/write support for MMIO
 extension space
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

A distinction has to be made when addressing the MMIO space or
the additional MMIO extension space.

Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
Reviewed-by: Ofir Bitton <obitton@habana.ai>
Reviewed-by: Moti Haimovski <mhaimovski@habana.ai>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index 9e0fd4a6fb29..ae09f777d711 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -29,7 +29,7 @@ static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
 	if (reg.addr < gt->mmio.adj_limit)
 		reg.addr += gt->mmio.adj_offset;
 
-	return readb(tile->mmio.regs + reg.addr);
+	return readb((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg.addr);
 }
 
 static inline u16 xe_mmio_read16(struct xe_gt *gt, struct xe_reg reg)
@@ -39,7 +39,7 @@ static inline u16 xe_mmio_read16(struct xe_gt *gt, struct xe_reg reg)
 	if (reg.addr < gt->mmio.adj_limit)
 		reg.addr += gt->mmio.adj_offset;
 
-	return readw(tile->mmio.regs + reg.addr);
+	return readw((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg.addr);
 }
 
 static inline void xe_mmio_write32(struct xe_gt *gt,
@@ -50,7 +50,7 @@ static inline void xe_mmio_write32(struct xe_gt *gt,
 	if (reg.addr < gt->mmio.adj_limit)
 		reg.addr += gt->mmio.adj_offset;
 
-	writel(val, tile->mmio.regs + reg.addr);
+	writel(val, (reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg.addr);
 }
 
 static inline u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
@@ -60,7 +60,7 @@ static inline u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
 	if (reg.addr < gt->mmio.adj_limit)
 		reg.addr += gt->mmio.adj_offset;
 
-	return readl(tile->mmio.regs + reg.addr);
+	return readl((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + reg.addr);
 }
 
 static inline u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr,
-- 
2.41.0

