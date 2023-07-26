Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70140C001DC
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 19:25:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D5B210E4AB;
	Wed, 26 Jul 2023 19:25:31 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C30A10E4AD
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 19:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690399529; x=1721935529;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=HYGjABzV7cy57mxSsDPkh1+cHKBz/9CmNcMCiBmJRac=;
 b=A1+r6Z4kB0eThe5zsEEJNKctnOj+BRZvRbQ+eOg3wJXrDFWOyC1z1cNn
 eaH/u5wbWmqorg8DIZs1B+v3z6wh48xVrRVS+wPc9IBv1u+oL0L7xLtI+
 JTHvGEnGTfxVtj7uG+0uBJ9O+ZATSJcqd2A2CJrgpqgJyvxOn867YHV1F
 5h7l6ZM4lFZ9om1F6D5nk5SzTwkizmfnBI6ty1gHqPJw2b1vf/O8iXwYa
 JXJ4h2tVoKKMO2m3GxgDADyY1Cs/E14XzhxRbiyWrjnEyZpve/hRg5XKk
 1ZOq9TuiFcpgJe8sLiOBv9Fq65FpzaaZWce2oBkoFMYHZ2yIrm1J9MuYQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="370787538"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="370787538"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 12:25:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="816815715"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="816815715"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 26 Jul 2023 12:25:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 12:25:27 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 12:25:27 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 12:25:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HJWg/NE9F1ftq2vLIOudSEyVhUbdzgdMI+Komyb5cTh1WDqhPxP6wefBcq3MksX0dJVsFYnNc3dJWzzQHBva7hbj8EvzDAVCpktEef5oEdI4AL3BSceNF9QQij8nDDX8ihQRe9utaRFi11GhzbqeBglaoZJDcIm+5FbKrkMSzS9xFL7DLfAGlemOIHfEjOaEh+vXl2w2PSMqQkmSodDN/fOTMd1Pr+EXOrVNVn472cCWeFLAkxkCW/+Jzqrbcz7lMLKm39Hb4zUMrkXltuap5W7pBf4fGt9XDx4zvHpDEq0+xCGauFF/eCeM9SDhsRNfgIHJWQro3IJEr3i82vMivw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SR8RmY04SlTD6AbdFr59UQ9oGPdl1e5tt62z+47LJZg=;
 b=VCUteUmfKKZuoL5PZ6mueNbooWAD9fXUNcVkQhlQhCD2FvT7NhR05AAX3fZDtnDhOFVN5/Gl9ZFGdC3dTnHAmhXMEnlCR99S3S8ADiLfDhxwvXyBiTG8DsELvM8M2kCe2UU2AcPA0MkOP2x6XfQMX9PPCQJYs0pl2x1Nuvl5bBeVX3ooua+9bMepLneELbAlW7biZH3ZTgMCqVNKuSi0Hae+psF8QAo6apjjRcA+dOR+MonxXZryEAYUiJcn+gDxTGgk1FFYTT4BOk+umJQy7flq+P1Yr0p3CtECuqVCGwNewwMqycph7XAVJvc/IlPnXpeyK0h14QL5otWTWI1mYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL1PR11MB6002.namprd11.prod.outlook.com (2603:10b6:208:386::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 19:25:25 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 19:25:25 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 26 Jul 2023 15:25:19 -0400
Message-ID: <20230726192520.383531-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0080.namprd03.prod.outlook.com
 (2603:10b6:a03:331::25) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL1PR11MB6002:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d6775fe-5866-421d-8137-08db8e0e1025
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iCP4Wf/iIzO3Tj+XTnwyRuQ/7FXw9xRYJAHb8YsJjBGqq6cm+YXc/C6Sx5W+gjHpM/GJ8g0ij786yktApUQoM6O3XWFQvv64vYDx8Kn/CtRl4DlsmjVbqRbcNOudhU83UyVr0YQXi0p77UBwQ3bCWOdfAWXkjFVRxpfoNLXaUIt+lZ2syoR14pcEdAgWQQJyh2PGe8UFEo2NMhKNXwA/+HAnE/EYkSpROgCXFNq9nGolLIvWdlCwxHpZIA2rNbupI5ZHdzRvQ8ulwJy19jMgujU0Mc/mDALYd+QNYb5u9/mZu/g6z5Od1PbbqcQ5faiTFVYGGLxKH8VNc1HNd8Qa+5fLm219hgIP/yBbbHZGzTBUJyMgRPQZQpq7J0ok0IOzTY43e+tLlkB6OBb6eJzdHIDlRGN0+9M6U7x54gBHMSrEnWXuSuq+gd282C93H6Q84xezyQ+HQ1xwAaT9uACbBvyqg3+FRllEaW1C5PIrpbPkpP6yOplDVdtegbVpKJHX28oe3Wk9X31BE54IbKgfn5XMe5SlZelAVj4bX6pC6eJw+QDxRzpUuJ5eIlEefVhr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(136003)(346002)(376002)(366004)(451199021)(2616005)(83380400001)(86362001)(66946007)(38100700002)(82960400001)(36756003)(5660300002)(107886003)(44832011)(8676002)(8936002)(6916009)(316002)(4326008)(41300700001)(66556008)(66476007)(6486002)(6666004)(6512007)(6506007)(1076003)(186003)(26005)(478600001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7tChX2ZxH6ZOO/xXjDU9JGIZ0RdUxOhXVX78Ehx6cNJu9ZeW07IzaIGz9Og2?=
 =?us-ascii?Q?Vjz+qYc07Rm/ps3TpKRDDPegq9/ff+Z9UJDPxrXZ/lQIzSuZp+lRDTrq6wdV?=
 =?us-ascii?Q?FbZEFo8tFFCOaRgusyc+Lq423Fc7aGaxMbK1DZEokxIna5n9LgfODkPk/siO?=
 =?us-ascii?Q?hrPdQApvBPRadTYXrZ58Jvxyw5isQ3KPpv2DunfzGDgb5FHrWqjMpiXF/g7z?=
 =?us-ascii?Q?J8XuLtPIW/hYSeG8vWj6l/waJwEym9azdK7UfzZU19VK9pj62d8nLT5fefFz?=
 =?us-ascii?Q?a+E5HUShOlvSKZ/ulPwjrGKU2PPXSLvL+NmMBOPsrIi3s1P3Xw8Dl+lwJ7rf?=
 =?us-ascii?Q?PLgy+vxv+6/CYvsgiR0SuJWJY4m4kUGw8OW2z8O/I/p/aLfAjG8ZyFiAJA/B?=
 =?us-ascii?Q?0u43mNhNJhMGmrAMh7idSWLA+MPT/UCFFMhxYSOAa23ESML/h0CDjex5S6vs?=
 =?us-ascii?Q?k5/NHJMTF6xbnfZ0yqoFu0k3efo0l8IPWJW0Rk53FqsZZG+Sl9FRfTd5YeUP?=
 =?us-ascii?Q?IPWUEequzcEddz72pOz8QeUSHroOAa+MX5Ld5nbMC0L87KpybBB1cdcDpJS8?=
 =?us-ascii?Q?TDX8d59GreMhdI1sykh4YbEXt0ky1aVu6RkatUc3/40sNhI1GNs3G0QvFlnM?=
 =?us-ascii?Q?Th9Zr29hhMf5QUtBiQZfJQyxifm52A7LBK88UaD075HSsZ43PcppeoenARnU?=
 =?us-ascii?Q?on3omoYX7aK2cE5bud6OrSrVSOAxnK4OlOuAFth6yG2OhDzs5FCEHzr5bK3c?=
 =?us-ascii?Q?EFn5DE2rtnbIriQWJl5FkEboubUr+wBjbZDT8I8L1WiBvZeexwlH88tGprXY?=
 =?us-ascii?Q?wwtpA2y8BcDLlT4CKZoT0ptjlFstUI4Ij5b4/7qWB9ty5XhDryxeUdFvvBYk?=
 =?us-ascii?Q?t9VUu/KjN4+etFfQjrQTgJjof9YZSNfCcj0Zse1hcBS4dnx/tMDzn66Xc8SR?=
 =?us-ascii?Q?KXRHNaYjZSzkmyBBwss1QDdWM1pR/i/wUSKnrGrKE81152eKl4B/PKArSVm3?=
 =?us-ascii?Q?F5jgjjv/RfgJ3kW1dUXSpuWD1btcwFLJq8Iy6D1RpB35HLwom8ctP2Y//iTi?=
 =?us-ascii?Q?HNgu2SlGDbsbvY3GYIerHvQs+Dwfb3HIK+q1Xa+3PT8XDjPk3oGMz68Gfz1y?=
 =?us-ascii?Q?wOy9AWFryTcWsdmm1t0669grlCWkgTTb0BMubocHj/aL5wYi6CyPyIG/ABsL?=
 =?us-ascii?Q?BGHBAqxcdt7RRNMTs7iLsG3Y3GX1eP6u3y8ZHxhwn4vA9+DKt8b/0fz5rmGq?=
 =?us-ascii?Q?32GndQwUz7SxxgQWnIr0og2AHZ/k1VyU2PZmCntaWqQvm9lo8gL5/+w06uLH?=
 =?us-ascii?Q?vfs7/wEhoUSRSYIjUp198H/TfjURaPG74rjzcvyEqpjtd3gtjt/qp4w+GCCu?=
 =?us-ascii?Q?UtIVJnSA/6Vydfne/BssWLy/gIbK6Vd/VdrJOv2dwSRo+SuXyQzfMHimPmtV?=
 =?us-ascii?Q?jp0Rj+l82cnKj4Xh3Vv+LZjK23l9iscuW7t+gmhSa/fPFkseJxzQ1msjjzD5?=
 =?us-ascii?Q?o3QS22xG85s3RYG3XjJ7J8Ip+CXcdNkB4hOgV5ulsQyhll3XejRpjd/pF1nW?=
 =?us-ascii?Q?8PEhpFPZ10M7Zv2stuNRi3dYSjrTy9MtXYJHZHd4CqtKny7vV1o8xAUXcnXa?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d6775fe-5866-421d-8137-08db8e0e1025
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 19:25:25.5825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DxFbgxUksz4R4N92QwxswG/oloMZCNEr8LKU2iI49wlU6IM23eFtk1aknaDR9XL9YYlkJHDh9T+HBcqyHDljsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6002
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 1/2] drm/xe: Add DRIVER_DATE to coredump error.
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This might be an useful debugging information if the driver
date is properly updated with a certain cadence. With this
we know from which point in time in our development the
driver was from.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index f53f4b51233a..79b506dc2622 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -10,6 +10,7 @@
 #include <generated/utsrelease.h>
 
 #include "xe_device.h"
+#include "xe_drv.h"
 #include "xe_engine.h"
 #include "xe_force_wake.h"
 #include "xe_gt.h"
@@ -83,6 +84,7 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	drm_printf(&p, "**** Xe Device Coredump ****\n");
 	drm_printf(&p, "kernel: " UTS_RELEASE "\n");
 	drm_printf(&p, "module: " KBUILD_MODNAME "\n");
+	drm_printf(&p, "driver date: " DRIVER_DATE "\n");
 
 	ts = ktime_to_timespec64(ss->snapshot_time);
 	drm_printf(&p, "Snapshot time: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
-- 
2.41.0

