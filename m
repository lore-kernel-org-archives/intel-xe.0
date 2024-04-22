Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA056C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Apr 2024 20:15:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7470D10FF96;
	Mon, 22 Apr 2024 20:15:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fg/VMbAu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C24BB10FF96
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Apr 2024 20:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713816911; x=1745352911;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=nhs5WtnoN6sMnwHwAoP5klpS2PvCpfD28xTdLiNUnxI=;
 b=Fg/VMbAumN6XCl+F9Kzvl+3HbE3OEaJ2c1SBWFKJC7oR168v9PYgxlqP
 oKe+L/sVKPhWA5MlkGn2mETofV/PQGq/NA4G+C9kq54tgfiX6w1EPiFb0
 vR9D5aGxrqv/2IHFx3tGqy0MbZAU9VY3jwDccIMqtFLZnRPOWJFKOE5iI
 0P1hJ8OIUqN+s6nJNk0mWscSmO+9jXBskw4/hD1b0gv9tRxxkGMLrUMhV
 q8FxNhp5os71tXpVLHVYPbYxC2n1tiXDwd4/sUMtjyaYugfkjYx68jWYP
 Rymw+ZWJaWBCPzU6hFmpmbBcG3FfOVwTCOGDDV9g5j4I8zyt76kMdAQmD Q==;
X-CSE-ConnectionGUID: BrKOuXe/TjG5++pOevawYQ==
X-CSE-MsgGUID: 9/QTsO1OTdW5M2Q72IZ2FA==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="19984814"
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; d="scan'208";a="19984814"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 13:15:01 -0700
X-CSE-ConnectionGUID: euZbileGR+Wl+YG77S6QzA==
X-CSE-MsgGUID: mgt0+ACeTaK1OxCHGXkQxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; d="scan'208";a="28642605"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Apr 2024 13:15:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 13:15:00 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Apr 2024 13:15:00 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 13:15:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hMedg3s/bsHisp4b3C/O/DsN1xFAuWBIzdEPIty+j3c/0beizQ4NveP1aRzQ99HID4VoABamw0b8NsrtfGIs5Je7bbDVlotxZjbVD48qu9sK/zDSM+lQhzxpFBHlhpGs1Grtmm9/Oh2kjE1PYfWSjUDFt/iam8sU/+gMsM1nxD4j+Te+Fkoj+N6XrJYqPP/MyfhZkWhj7ZjUMCYjOxNnj4tdkUgCw3s3ayA15PK+w19rOy6vvuPnX1UXD/h2hC+meGXh31T2vj6tfBDJhgNPNzcwnaUgO2nue3Krb2+Qh1JguJRacnb2Q6dW+CkQpjbcULbYbrJdgCI16cHNlc8Uwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zx8HZIPZ+Qig7RSxSlqg2mB0WJPWeSl41NdVGLhmReE=;
 b=OaN0RRJh/LPxgAsHovPgbE3iC1iFjnj2zQJuYhKm6TLj719hq49K1Z41QYVyxO/AA4mMPVCecnKrYqPwNtmZrWu1evZEtA1KRonzAwcMPpcl1yFL8tc45pc95MEMXbv5EnVpnhC3B5oF5EJrwrQDLoZUgEvzC2/WBqZPHgUAIrt48QRSEdz7tonseDeRx3ZfWSR6UzzPPatOpHdpI8PlbNYa1sc/MQ48n9qX4j17dK8VgcBWGJY/uQTJe14cdixeT+XpSRp+rqTQu8PfwQU8sTbsKgngpJOUzRXl4LEud+XF2k2NEaglrs5ndKnFiySLnl4IzkGBFEw2uoVNtpI+ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN2PR11MB4646.namprd11.prod.outlook.com (2603:10b6:208:264::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.20; Mon, 22 Apr
 2024 20:14:58 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7519.018; Mon, 22 Apr 2024
 20:14:58 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/xe: make xe_pm_runtime_lockdep_map a static struct
Date: Mon, 22 Apr 2024 16:14:54 -0400
Message-ID: <20240422201454.699089-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0353.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::28) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MN2PR11MB4646:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fc47852-561f-4bf0-8ce1-08dc6308e1ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zGJg2kwuYu+p4bTmKrO9JidrvsXQrHgCpGtR9p8+1MpkpEArDoK9FKm1RRfi?=
 =?us-ascii?Q?H1C1zLK8Gt3VeameRE/Ldz+ndGhO9QFk3PXKvfmaf3kT03B4843zqCuD0/kY?=
 =?us-ascii?Q?vieiNfsxiI29dZY1bAG0YeGEXDD9L09J6dO5EdZo0M3MFh2Ol3+gscBIKtzM?=
 =?us-ascii?Q?2ZMAKOXmuzQzfC0pg+O/qr+JaLKOj//HeM7xpEpfSMce9quLEYCOlYsjY8o+?=
 =?us-ascii?Q?kv2Qj6N+PPlyxSZYyAs9N+LwGw6BJFnqJUNxTNKWbVQTFc/l8uLYL/FdY6iu?=
 =?us-ascii?Q?02bT04x1t5W+SCB1rLQu9mmgocaRUbc48GnyuLO78nhxe/qWMhxivenWT6V4?=
 =?us-ascii?Q?TRmD3EcM4CncnvcYxbBpdNWxD5I/Vx0PeaLYp7rqTwLMxzUNRDtjh2f+2oT9?=
 =?us-ascii?Q?PonseoWHGXa9TsFDOQvseLI0MxziUT8vykJOXfHwNL/bDzGyI3ISRp0XoBe6?=
 =?us-ascii?Q?suGvFREfC9i1cetWuK265gdeBRvrfhDieAgFDYC7jIgyK9Hd5o7SXLJJoRzu?=
 =?us-ascii?Q?6RMat/90I66bwxj5RaflTexiYkx8h/05NY4FJsRpxRZojR17t+cJOBSQHbB2?=
 =?us-ascii?Q?mxHrHfiukTBulxNNbmyhxZOtPurjSFD8c3rHAQQMXKU61ofGt3N5+BRZzWkj?=
 =?us-ascii?Q?7/+iy8Got9ix3Tui+hKYMjaT/xss/a9kbmp63rGFEw8dfIFR2uEIGAzl1w+p?=
 =?us-ascii?Q?SuyjuYxVI0YcWeHMQ9+eCtIo3n6AGStUnHwaS5hkrO6fV4z2wPHFTiyyPNn3?=
 =?us-ascii?Q?B8Cd+U5Zp5CShQU6pCq6K+y2A6sIQfRk8WFe2zj5DhWoLOyezeKKlmXwbBrb?=
 =?us-ascii?Q?jhtPTXvyFOUKIUBN9TB34v7b1rQd4Gt8XWNgQ5mKu3Of+DweVTr8jmGmzWub?=
 =?us-ascii?Q?PjVsdhRW6QfXUOJbBInzMd7A09Ug6vW1qHeqi4nSKqxYODSrNu5uIAzIAN3k?=
 =?us-ascii?Q?+kRwlJCKr/fBFrUK7zdM9pZd3AWd+EsY4r1kMpaHhS+Pxl5/nbbM3WklenQP?=
 =?us-ascii?Q?vaFk6N/HWMo8i6zovN6GViS1UX3cA1Jw6lao+xmPPzw+T6CazUjyx/RlpPvo?=
 =?us-ascii?Q?gVeU+GFBXiXIldc7uBSWbaJUmcYFnwrufcvIXqGbFGnixPiNeSff3WlwBfVj?=
 =?us-ascii?Q?OLemdODxM9tVBwx23nHPi6CJeHsbSix38sIOVcziQ0QASHZT1ikamJMGg5+2?=
 =?us-ascii?Q?R9Ar8xoFMwNMzGo9nOYYJMrHua8p/FV70dC3TjSPJQbz4LsLTUVp+SQJm0jg?=
 =?us-ascii?Q?eLb7BXs6hWCiwBkAqEmIq9Gxpb6xdeX3rbDSQgZJzw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ej14xI5XDwJJ5SXhESwEo93gn5eFfolMTnTB53A6Mnzkt/lsU8AZj4HEH7XZ?=
 =?us-ascii?Q?zi7d9ufd5rU+qoaJe3nelVtUE6Pg7WUl3E+CpD3tL6d+SN/F77mEEdvwdgSo?=
 =?us-ascii?Q?OFzcc3LDVAzpDByClPfhUVWsjHeF7O6n+w3pnBLbsAMUQj1VG0/UnF6SM8st?=
 =?us-ascii?Q?vtTH/PBVZiW8RdR6rK5UqsO5MHQj6eLbpLdAseYjCob3ntKzkDdXmADfiIzE?=
 =?us-ascii?Q?q0wsq560/zKsODD3yuJV2vybDcdfeuhbWTqwgqe+pOvMG0QuFwMMQWsn48eF?=
 =?us-ascii?Q?ejCxsEb76m0CrYAEvYi8V9glEwf0/ZVVhtENBg80WbP433cJGmSlGT+xESzq?=
 =?us-ascii?Q?0RNYHpX6/bKn/tjjTDBWfijOK5RQB6Gqnr35Jwz7zQNTchI04rsmW4D09M5C?=
 =?us-ascii?Q?fMlL9jqbLvUGKXU1LuAtf/r8w8p5xVEuw+Q/YMXb07dhCcxuyIAVPAm4GlOW?=
 =?us-ascii?Q?22XqMDyZOqTeEVWhwb/fcmomt2dQkE19CDgTDgtOB0CxMuCMOtWDMPyFtfVW?=
 =?us-ascii?Q?QBNDdahkj5mt57+ijKgWYxdzXUfyIJs0bizGu/EL3VGh42mdmklAyRp4pEIn?=
 =?us-ascii?Q?uKrtzLEbaIbfiAaVgdgBew7YR/DyvfZ9bniXlm2WcE2A7cT40QPhJZrPjRZ2?=
 =?us-ascii?Q?ylA1mRlhBDcC6xockAOWhCxyqv6V4FRqGu+2Ak9otN3IisjzFQpFMkYsOENL?=
 =?us-ascii?Q?etadantGbmznP3FVc0twFYUGFoWTMJ54gDWIIkHJusJgmpFvMDIVWujvPBIc?=
 =?us-ascii?Q?cX48sA1o3fYyA76Iw7PoFnWgDwF1Pnx84cHBgvGhwYnevBiduUIQtlDaxksk?=
 =?us-ascii?Q?OA4pXpH2Wr07gMvpNVa+InEVk+qNLUw7nNrG5+vAEMlDCNX8HrgLAOEDBDHE?=
 =?us-ascii?Q?fO/OYObvf81W/H7F2fb13Z4YNkxkyqXaRVkv7z/j4C08c8NJwOKulAfmai17?=
 =?us-ascii?Q?fmnFr9lnoUvYhz9J67sb5HL+CAeDqrmmxhEq34QkamXyy8W7s3Q0Y7ym6IMl?=
 =?us-ascii?Q?9bBPrN0IOBAkOf7e4d1glOmG/THIVJBJWs6RlekWUea+5JtIqAFFLmhk+yqX?=
 =?us-ascii?Q?qPhfyBnUUfCbbfwHT9IywXPVH20FxfJ0HP17N7qJxiohsdz1tjnBB3OWMte0?=
 =?us-ascii?Q?/IRkEYF78yBh1J37eerbMb30/QKsm/QU96n11o8vtm+CO9GRhRjMqyNd00j5?=
 =?us-ascii?Q?YK1J4FEplt2laBxiqQT0+ZfwgkLs4bBqqEuQWRayrK3m2f7UHwPdpi36FcjQ?=
 =?us-ascii?Q?A5elV0dax9UKR5v8zCa/sNzhLFZ2T3YjpCZkUQdGkbKc+vogWIRxQn2To6lN?=
 =?us-ascii?Q?R6ONyD7LUF2+vOMASxIh2pMB7+ofIgzwQpORGAW/cTw0Lk/KuBnkj11bAOp2?=
 =?us-ascii?Q?L4MYbO/w7aYzXuk+FxEitxxVyd8tRiY6vjoCXoDWu9Eo8xEgSmPpdcMl/nlv?=
 =?us-ascii?Q?nMlXjL5ccwtmeo0++kBECH71twtdmKBp+7ZZ+flbLuIFqobFzKZs8Kj2CaPG?=
 =?us-ascii?Q?KtIPxnC6UInRejF3M3g8fdlW3PMEUNA5ZbotfttP6w0SQ7b5RX7ZkXHbGvGB?=
 =?us-ascii?Q?sNiIQa74MP2Z1ODSZ6w39OE31BsZhQKT0XiNBwKbRTlgWxGExSSZh9/e2BCJ?=
 =?us-ascii?Q?Jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fc47852-561f-4bf0-8ce1-08dc6308e1ee
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 20:14:58.3052 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p0Hgt8FfGLHLHV5BYye4fTDZd+OeTGeR+njuxcisCR4PlNvq49cabmbDUBojB/ARVgVQYjM0mKpDD8jlVrhffA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4646
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

Fix the new sparse warning:

>> drivers/gpu/drm/xe/xe_pm.c:72:20: sparse: sparse: symbol
'xe_pm_runtime_lockdep_map' was not declared. Should it be static?

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202404191329.EZzOTzwK-lkp@intel.com/
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 37fbeda12d3b..c1831106ea4b 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -69,7 +69,7 @@
  */
 
 #ifdef CONFIG_LOCKDEP
-struct lockdep_map xe_pm_runtime_lockdep_map = {
+static struct lockdep_map xe_pm_runtime_lockdep_map = {
 	.name = "xe_pm_runtime_lockdep_map"
 };
 #endif
-- 
2.44.0

