Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2472AE93714
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 20:31:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7B0910E42C;
	Thu,  5 Oct 2023 20:31:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C485710E180
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 20:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696537900; x=1728073900;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=J47R4g/rQILAPlQMroIEaNgv1hcLKD1SWzdjqi9VCAg=;
 b=aMhMXuwwSqZuFW8cgzEjMpU8R20yPMl1F2EFsHmICi3MZEO9bGpq1EEZ
 J9d0L0M4IqX7E6EIFyXFy23JkmvnHmt9QRTZajXUAgNbTHhFoV5KigoEn
 SOz5I7sG+9FOfaBHKoZJFioCZUVeK1zzYcCH1eh80Z3wtMRngaGGWbKk/
 YXYRjF1pZx8fabEB3LWKd2AdJtq/wXhvjSZBffLiPzOUpzlsDCtnjLVuy
 OjWBzgzb4/rYoINyx8laJKsgpSGl1ke1vfISZN/Qrp99gdltlZr8fy9K7
 b0Paco3vwU7HM4+qsIwQy1jY8rkutR/cLKWegD+LScNvtctUSaWYJj9jO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="383505734"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="383505734"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 13:31:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="755609992"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="755609992"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Oct 2023 13:31:38 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 13:31:37 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 5 Oct 2023 13:31:37 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 5 Oct 2023 13:30:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JZostYnqRpPll5Ygx9oYFYHYK2pXAePgQpTtKoHaUL6wQMqFiLoSIQaO+8qoArH+gPOID9nejrDBCQRSwczWGfGt/lWOX01wGoWK2+igWAjkQAnfoXxbUDLZhEhZj2QIQR5cTFCeZPt+xzjvT2sJjm6ixvVAUoPqlknUeNDIqjZXn7oJpRqrUXkQnn30ClUPWUYw+bH9GCmvuZYROl+gvQh9HjNEyuBbHxqFHzi8uBDapb2NnYzZUasRNopkCqerZB+e5SFhzIRUxJvtVHfOtTVilqONQrVlnF/qYgEvnFa8SM2p6ffIy7snNqGo5WKDoY+49dYGiYcj74NLpq9czg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4qHsZU0+JPRNwqbkdDGmCtLDBHC1ex89Bi5+yfpahXE=;
 b=OuZHwBDHp606sCLrB3MA1cyhdt3+dLbd6C7OhdsN16MQPJrJRqoAiHdopna5W8mIinWSCdhFdAhHRKT6wNitQlRbi4TJmcNupHr5rvYsY70uZGKdT5OsnhN1YND5/sQ8kfP7Et86mSWdCFIs0Uv/m9HJatznYVN3EtgoEtNr1o0pQsMUqTTDF2O6E1mzTwJb+Hu4PHpJlhLJjivTbTnNkeAWpGBug0O+uxGL1JdXuBE6h9r0NE2UT+waXomv+TGy11oTvvBbAgaQNnRBF7XUbU4sj1XvhHu9b7RUjDi24e6trGlqP8m/uc4VJfEUE3OQkdK/Ss0A+3UueEya+T+fuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6318.namprd11.prod.outlook.com (2603:10b6:930:3e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Thu, 5 Oct
 2023 20:30:38 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 20:30:38 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 5 Oct 2023 16:30:25 -0400
Message-ID: <20231005203029.14849-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231005203029.14849-1-rodrigo.vivi@intel.com>
References: <20231005203029.14849-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0031.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::44) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY5PR11MB6318:EE_
X-MS-Office365-Filtering-Correlation-Id: dd6ddd5f-7eeb-430e-59d2-08dbc5e1efe9
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RA/mRs7rcuTUae40upLSar8yPeoH/COpE65tQDH3utIH62SFLUWOPAT5Pg4Mc8/NnoSZ+QZ+WSW9RL56m7fDs7uNmuo7sgKt+OSbS6aw2nAlRJduYes3WXIZZNsoLCm2nDLRJ59awb173NiH2jl+B6XDDOj5kx5vMEcbBFidge6njVMIUiohtgZlLtKALtKWfz7rlhyYyWyIGf61L4uMN7t5CrKDVAINrt3KQgXMCVlMrKgY08iVUUbSw3+iT4hJnj/QjZlZJtzAVpx/gh++G7hDeevqNJIbyTpl1yiBfrLEFrKeVn4zKgqaVgnxzDXTqayfB3O6Cj0sK6nJO83/Nkmfu0dq3m6AjAZ+eYrkPIEObHVy+SfuiTkz+4WM1GjgiWRh2GUP+mIi6pVPNjMOw1J73+hoVLwmpChTPlXMq2PT4pBRKyp7AijfY7C5Oq7Z8ZNrcK8xFHzshmMiexk70kT58giQzEN2dhz+GSgh8V+1YDU/a/7D3WLA6X+RfDGupGCUr+SLI6LWvKnHN9AM/dTsLFqGf2Yu6DZ9NiQrDAxYkO97KnK0HK4wNOF5UnAi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(376002)(396003)(136003)(366004)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(107886003)(1076003)(6486002)(2616005)(316002)(6506007)(6512007)(41300700001)(66946007)(6916009)(54906003)(66476007)(66556008)(44832011)(8676002)(8936002)(4326008)(5660300002)(26005)(6666004)(478600001)(83380400001)(2906002)(36756003)(82960400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PdR0AAl+ewF/Br5GjVa3pcJCawSIYfZA+f51mKWY6nl7gp1EDw9ope6knb4G?=
 =?us-ascii?Q?KhY7pNaFpOap6Ezcpn9pDfvf8YJS68D2o7gtBnc1jI8tpxiJqIwsuvcT7/sE?=
 =?us-ascii?Q?R9W8SZNVmzrWpXg9Sf+WGMyWw82JV1mdf+YrdMWxDJyStJFBoQNJjct+ZfIM?=
 =?us-ascii?Q?+l/ihhekF5tmR4aaKc3+9adHu5jL73u/ryPhEsbqmhsYZguIl08pPMiYTiOj?=
 =?us-ascii?Q?EYXw6WK0z2loIlpxZVp6y8nBC4kIOsYcTwS+qje95cgmsAgM3+iSVGHMonte?=
 =?us-ascii?Q?Z4MPm0bDqgdDFdFr4qgMdfUjI8UvSV9sBLEHYT8XjO6PPDnznVr0XqSO5mkk?=
 =?us-ascii?Q?zQryeCMNmCo+BFVstsHnese5tLM53Sd90zaCNAw47Q7xeMHAU2SNLVzKkP2e?=
 =?us-ascii?Q?0HVPFmBrIjvHh7rC+tIyABUSRz6dXsaJzXYZU5/O5a4CoJ0KS21jk4apzyDW?=
 =?us-ascii?Q?2S/mrGQhjZgNhrS+JeByOoAyQ82OK3frrmm6YOP/N2/GeeBjDRUF7ol8bXes?=
 =?us-ascii?Q?xDE4hsXvRwJ4bGRkOA/RLw1O0snQONaNkwiRzWyHvvZB39+gf+L9SzEfip4y?=
 =?us-ascii?Q?9CnWDKAL4HxoRzSsX7mnyYjsxPB/F1s29SdCOvoPwVxoEV/5jcQExrqSLdfk?=
 =?us-ascii?Q?QsilMVEocjkLD8pTRwQdKLNLgNM54PiGIGwuL079ffsvm+Sux4MnbTohHatk?=
 =?us-ascii?Q?A7r2nS7n3pxsFMJgLCFzp7ceVwP/3+zfHLxb4oJmKg3OgPFyyo3fIF8aUW5/?=
 =?us-ascii?Q?gQGqKSOOwPhpTpFLgjfwVVesWoBuFz5aXzoV2Mz4wNRIB6froMiFz73Xl6Yp?=
 =?us-ascii?Q?t/4VkHXIApL1Y8zLwi+2VTikgQFMchXpLBmvUUlT5avMXI32JSqx+2iXutF7?=
 =?us-ascii?Q?kKmUJsAevxPas7eP3xknhWq25bWe+OGemBWD8v4jmwgl/c2oThwyZJI7V4uo?=
 =?us-ascii?Q?/R5yl+u+ts2rTBPGtNGJbSLnseF6aNGZxBeupN1tGOU54+JiCf7D5Jl4NaGG?=
 =?us-ascii?Q?iYQhsa3b9XZDlluxwYUrro2EXO7+kWKJG+yepBNSu/+TppVWyjp6XGlHkUbs?=
 =?us-ascii?Q?3bBcSWSGptxW2+YzjBslKnbYLYLGuE7neklLxDqgK4oc6NMcTN7pXMtFKW59?=
 =?us-ascii?Q?e8+mQde+OMyf7r4qcXWm9ma4zXfxHCWXlOW2RapO075xZVkWk8DGPZwok48Q?=
 =?us-ascii?Q?vLQllUTUYzCsu36GaBOH7gQ6a7dIUumfuQCWXozf2izHumBvQCpcHvOFT/KB?=
 =?us-ascii?Q?wwo9KrsVcpgr+azOaRECECd3dMW7IvdlnVnN1QSRhoDNZ6v3Eim0Z9AwvQ+V?=
 =?us-ascii?Q?Nkd9fYSZbXF7DX1QJHutC7TjS4b1WgedwGD2aNlFvdJcZ7dt+i7itAKt7Q1m?=
 =?us-ascii?Q?dROTv/EnJuGwUJxf6wVBYFHtTBkIssZTenZuX1AbLzUMdVzfYJVxEDTuXyAX?=
 =?us-ascii?Q?yXSEG+Fr5bBH8DNJxo7WQndpH95eR50SYKqZPK9Ycg7gHrn21/sU2Y9wwVJ2?=
 =?us-ascii?Q?xVBsoJ9XBSEGOahz8/VBVMg22W+5VTnn3Lw01sTwr/AOggCLbAKHMW/qOs4q?=
 =?us-ascii?Q?Is4I+eiXeWGlBlA8f8mZZHI5ng2EcoFDtXVN3bP3djzCAoAa4pyGa2KGlN5S?=
 =?us-ascii?Q?Qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd6ddd5f-7eeb-430e-59d2-08dbc5e1efe9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 20:30:38.8665 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TGwD6KwofOPOvyqoZJ/thMaopiLgVc2hvofO9QUVZ69bomlfpSLefDPPn0IbwHrdoIse7mHdPgUZE5mG9yUP3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6318
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

