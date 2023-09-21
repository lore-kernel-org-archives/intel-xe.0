Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6074E7D0AB
	for <intel-xe@archiver.kernel.org>; Thu, 21 Sep 2023 21:08:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D09D10E608;
	Thu, 21 Sep 2023 21:08:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A95B10E61B
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Sep 2023 21:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695330504; x=1726866504;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=C9nfsBnoHfZgPKVZ74Eq/XpXeX5ZzlU1wp5ruNxOfhM=;
 b=Wvs6yStjWRS2NzUyrohneTojbqrpg24Y1CanQAJwgE4OvMx4T+XlUyKU
 lG4f057o4P5sUzeh1FanAqBlwCtl1oYdhP12mmWVPaACJFsaOfM0JN6Gz
 irpwI/d9Bs8kqbGY8D6fclVB3nBUknEgMTt7Et1AuC7LL8wwy1sQQ0Ppx
 EbQkJYYj4W2vPhCyqsODQB3sFp/2TNxo0e6Mio2+Fgb8FovYTBTAxm5Oj
 g1B8ifZf7Hl3t+fP3tKFU37f+rmhjOFwUrJt4kL3s5nSoaGuTM4QfXrmf
 tBdtgT2XJ5QO4FzfCwsYvq43t5oW5KVZiAUmEdqLrw0JNbmslO8anReBf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="447143614"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; d="scan'208";a="447143614"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 14:08:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="870990167"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; d="scan'208";a="870990167"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Sep 2023 14:08:23 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 21 Sep 2023 14:08:23 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 21 Sep 2023 14:08:23 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 21 Sep 2023 14:08:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gXHoXAcYYYRXlk8sFko+kTywizuj8rUjzwfOLA5+MDd+x3No2LExs8yqiRfv5gLAiOZW85WbPhBNRrN3GBiok+2rCpMM/9/ZebnXUjjgZ7mOFLz1xGvlIq5kYACh+kvkKz2SaZWjqHsjP19detMQYYJ32/szXgTjAjNCqdik6TWpieiYkYjrNYkiKtzwBrng5gvCHQLXOa0ut748JAiKafvijLOduv2VjWgRioBWBsW4mnbwpBZnHd2DC5KuxS31/v8iISVugJRKlZ1F0ecwsuXs5x7Hi1BEu7m+Hkmzyds0TyiKV5JY67cbdSs9CUwnbA5dHloFng0gWhWlFTF5MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8EsanuOS0Yano637z9JqysG2PjRpubtyo/EeYJV/00s=;
 b=LKeE97HnyZ+tG/gJBlNmeNvG6ykkJT36DaDQo/urAAkBq0mmxwDTXOj5JzNMdgtYh+76ZB5nMu87ArizVXcA/Dxbv+ZEtS5pcL3n7Hpvj6/4P2ZoVWR/CG8wtbyKMYt2n2wx5RVhj2lgFzt/UmGMu+uqq5vymVUb20SP/TDlZRq4IgnmJaI0HawLY+6+O9Y7bsyUPG7FU2gT1YAZJG+8K589Q3iWRt7+wT/UZ8/EclQyGGgip8EZyEGfU3f9Ogjf6F9CFTwNvkMH0hRR1dQUDdkgfK0MZqYV0ppek1g9bG//NL9WeymC2vRjGC8TsaAZneymwSBpl5jYgLSqlZdHiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB6359.namprd11.prod.outlook.com (2603:10b6:8:b9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Thu, 21 Sep
 2023 21:08:21 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Thu, 21 Sep 2023
 21:08:21 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 21 Sep 2023 17:08:00 -0400
Message-ID: <20230921210800.170275-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230921210800.170275-1-rodrigo.vivi@intel.com>
References: <20230921210800.170275-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0004.namprd04.prod.outlook.com
 (2603:10b6:a03:40::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB6359:EE_
X-MS-Office365-Filtering-Correlation-Id: cea4f73e-eab3-4c4c-e134-08dbbae6e2aa
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uemkY+zJSqqrO2M/+J0HseFqRvy8Qu2tjxWzBdoQGazZVYA1KJqC2yIX91pW3E1iqyskuqvFQ0GfbIn4jcmYP3OgkS1d3rdTwJxGgjJYPLCege9nw+xv3QhVy0/wqbcStTRJ5MxhPsb/ePU0Vnj19lVZqNdWpBLdETeepwjCJbQwCJdrkABJHjyXimITzGIGiq9J4SSFPxHWhIo2wggEunlYoLg+5tS+VC2Uu/ljDPUj18KN0R8H/cDiuxqKpdeJFL1qqhROhZE8FZbHhHRcZ8ZX7UOclIDb8qGNSCSoQJmPT3ntWrCPi9m6MGKXt9mZjd7R47qsAdLttw96+dZORjUs9iYJAYk3llF/SK3Ow+5amH+GHU4taL0E+TRVuFE9McNhmYC1wVHAaUEFaWSNOyck6KOLc2SLiwAsxdCCd+ve6GFSlVYrElUvAwMmApYBTHXvRy1Z0y74mGSmSQ6L3aI3iVFdiJ/rm3fFxnAmdnoUBPKrlP6AMzFW5C+hWJSmB7o3+fNp3SP91euXtnbdA+M8y5PrzoM5RtLW+CJgJl1MDL4ty9YN7u846S3joAop
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(376002)(39860400002)(366004)(346002)(186009)(1800799009)(451199024)(8676002)(41300700001)(86362001)(316002)(66556008)(54906003)(66476007)(66946007)(478600001)(2906002)(38100700002)(6916009)(8936002)(4326008)(83380400001)(5660300002)(44832011)(6486002)(82960400001)(6512007)(6666004)(6506007)(107886003)(2616005)(1076003)(26005)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B5O6SlWqioB5XyZJISYCNXVpXU0eY9+zyGJUp16MhEd73c2UFtN57aLWDoJ+?=
 =?us-ascii?Q?zrT74qhqSLyFfxqBKJXkobNHsIcOhQBxbIZinRmg1oIkEQllSiro7QWNsIGm?=
 =?us-ascii?Q?l+zLB1bA9UD7q+YdtC0VOd0YoejTuqrBGQigjJ3nenO0G+qTkUoQ48awbKqX?=
 =?us-ascii?Q?qTq9U0AkYGaNILQw452lumKllUfebMW8uqNiVf4ATZfAs4egly0Ku9XzXJO0?=
 =?us-ascii?Q?DhDsrdGzydMZ24cEZxNTHxTgKPw/VqA/DZNVkIz+2kEX7APg3GfNu99IdSFw?=
 =?us-ascii?Q?3PrZreQP9+zbYnO0ayh4PEt9PQJ6Mt7I7nT0H0x17ZhLQ9J1URwZcjHLgQx3?=
 =?us-ascii?Q?RzfKXvwmy/wjSxsEpYSDJIxM++2HUMlM4XSgxIlecHoZAdxer6tyKVY7DuCG?=
 =?us-ascii?Q?chpme0HnEM0pIp++Vio7bmkBaHYZkhMjOwInao78ucCFD/wRLbWfGT6ToJfP?=
 =?us-ascii?Q?/bHT0TD2ezKH9bR1C64ix3Q+K296QIQXBMssXcc3GL27b1lAZwQvM+Ib/B3W?=
 =?us-ascii?Q?V8jUxznMLGqv6EKNTNZGL0asJy0YRfbLNenLqMUbz+zHpl9abyHFKewwMtQi?=
 =?us-ascii?Q?+j5tPSaQ49DTkRtiOGIeklnuf49gcRYPKr6JkJS1sbvH7r0v/TMEllWw/aEh?=
 =?us-ascii?Q?qHqD7pTuotUWIXCDo2ozd8cgpQDsgcml62MyVFav32QP89WQ295nPEGJeJK9?=
 =?us-ascii?Q?VZvjaJlSf05zMYYytdSFvSFdeC0Lbk2M/GBWhO6PiGemmAnNhmAw9Nn6qk2L?=
 =?us-ascii?Q?f1hvL5kIrxIojPtFSs92MvvT6vKNbWuU4M96CDqj8Ey72TLhJpY5y6rNw+wO?=
 =?us-ascii?Q?/NSeQPwf9JY6LWMibpjQUODHXjDJIqnSKqK92q82GUIx3nPxv7KhkHw/hAIX?=
 =?us-ascii?Q?rK9UL9oBK7TOnT/mBoGMh1n32DY13sknhBu9fff6XGT6HyyNRCazwNeu0zkT?=
 =?us-ascii?Q?DTszUgChydB4jNGSpPZz5D6VtlPmaZUWVvBEZ7VZXgyNGcklC4D0yjFcU6Jf?=
 =?us-ascii?Q?vObRfpBs+3jMt1J8FPwYVD3z+CK9ZcLVpTv0ExJxHal9oETgAbsJClQRkEi9?=
 =?us-ascii?Q?7asGqmztb5qhxfksCaJ/wvSgei827QwrZ8gwRUN2puU+7LEe62Fvn6etwTM7?=
 =?us-ascii?Q?DEgbClEcJmPW+XhZBVqQgOxHSHFjm/HKBDWdJ8VKGnQ73aI+nFcSpbY5relV?=
 =?us-ascii?Q?ol/Ys5qsfR2B5QrVzQa+Se7MKlaCo/VIaf3GvIgRFZbZXAOBGHz/U/ARlWrd?=
 =?us-ascii?Q?R4NAZRj6T1RcIreDfFeK3J1ZcO2tPce2WsmJfNYypGzSTKpfnSFsowxuZYks?=
 =?us-ascii?Q?8ntBgFtUD4YDY4Os4+nr+Y2gSigC3N6095yq1NllMgbEMOzUM7Zzow6c57uG?=
 =?us-ascii?Q?m/4oVvlsM33z5BacAORDqHomSGw8I4dIl+aD4USMXOLVixuquLPO24NEwmaF?=
 =?us-ascii?Q?KvfS4f9TNkF9c6TVeXBHDWy2IazKOmu8ShFEx4TJPlhdhH94sXvRZD++JJD3?=
 =?us-ascii?Q?tBub29s+jeL10Xc8B3dIoA74DLzF0toLzAf3N3P56izcHi5T2k99l+/Ehezr?=
 =?us-ascii?Q?/kyPZrhLc0xi95DnoiB0fWTgdAUaDb6dp1fV4fWdW1uAEE4opBDOewJOEsGR?=
 =?us-ascii?Q?fQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cea4f73e-eab3-4c4c-e134-08dbbae6e2aa
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 21:08:21.3179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IxiV9kMWJD8rnhDYfECuiyrXPQ7ZxwsQS9UhakbxasMfr3/2SFI4ZzXTG5g2mcpinz7BcPmJAiujdZj+/rUV4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6359
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [CI 3/3] drm/xe: add msix support
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
Cc: Ohad Sharabi <osharabi@habana.ai>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Dani Liberman <dliberman@habana.ai>

In future devices we will need to support msix interrupts.

Reviewed-by: Ohad Sharabi <osharabi@habana.ai>
Signed-off-by: Dani Liberman <dliberman@habana.ai>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 6052c944acda..504cb94d0ee8 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -593,16 +593,16 @@ int xe_irq_install(struct xe_device *xe)
 
 	xe_irq_reset(xe);
 
-	err = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI);
+	err = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI | PCI_IRQ_MSIX);
 	if (err < 0) {
-		drm_err(&xe->drm, "MSI: Failed to enable support %d\n", err);
+		drm_err(&xe->drm, "MSI/MSIX: Failed to enable support %d\n", err);
 		return err;
 	}
 
 	irq = pci_irq_vector(pdev, 0);
 	err = request_irq(irq, irq_handler, IRQF_SHARED, DRIVER_NAME, xe);
 	if (err < 0) {
-		drm_err(&xe->drm, "Failed to request MSI IRQ %d\n", err);
+		drm_err(&xe->drm, "Failed to request MSI/MSIX IRQ %d\n", err);
 		goto free_pci_irq_vectors;
 	}
 
-- 
2.41.0

