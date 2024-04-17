Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851BCC001CC
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 20:40:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4534710E765;
	Wed, 17 Apr 2024 20:40:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TqQyWP8Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B49B10EB48
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Apr 2024 20:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713386430; x=1744922430;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=zOASp27sIP6fkextP+Y6WGc8bP/I4m5DzEebWPndnYI=;
 b=TqQyWP8Z4MXasa3G6qFJkIoWvTSBj5kkaVOxccnaNQZndPMA4JaQBSwP
 f7mHHbxZswHW+kR1mMOCGgNFx1SV/TaNaiurGJ/HIEx/GWH1eiLTbVioK
 UVwXiuGDvI8UlqvkalOG9vLET22GUWhG1By+KjU4MaI0OON5OSWiAuhb+
 dlAgamFiq5UnxNz1+tz8/LTn9pkXHpMfd2/cxACuhJ1S5bYiKtJECEF0e
 BWryXA/uXpoTfNo06sm5bfCm5pSJQDWyDIAEUnmBbpYQdKWqUP0v22/ED
 l266LHW51pwobZXt2lcwHA4XsgJ2eGaYbMUGedMaInwojbYKjnwhHJgkq Q==;
X-CSE-ConnectionGUID: yl4zLfO3QxSu+R/SmIeerg==
X-CSE-MsgGUID: kghB3kHzSai6i+W60NkQOA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9070465"
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; 
   d="scan'208";a="9070465"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 13:40:29 -0700
X-CSE-ConnectionGUID: sAaaXWuYSnakCbhjwGRhug==
X-CSE-MsgGUID: UsKxkwlaQySKmk4ml2gH3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="60172071"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Apr 2024 13:40:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 13:40:28 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Apr 2024 13:40:28 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 13:40:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D8hNznl2k1PxyDGn4jM6cxXYm3LUWZXCeK+C1EfLxgWAXcTN1sZ+xhWUxg0/Y35cATUhAECQ0FJLwa8QneQ8AoM6AVKTyTkBbCmsCuPC8R/bIFC4u+WPrfF/1YP+AbRH8f2vIo3pA4bOS3/6gobJ3CS53vQOfyTgikBQS5uLhMYkEAkNA7vCDAENap/3TixHfIsp3kNgX/gnlbXX4GZqIYjYVsqcENN031XVPAq+MW9xPmeithOIeCImKUFE3OkTOey/uwknix4HFUHVRCAoP8nMqhY+itFZuPXMl7cxnCB2xlgiDE5SVEKxQfk6NCpAo2FfVmNpWgWMQlq3LAmDcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=so1AWT6i9ClY6mmWw/h370HOUOLz25Y04SdvJ/48TnQ=;
 b=hSM3j8DFS09yC4VzVRLettzgin0yqCSDLY3qm/4VXxJ3C2aQq7EGYmOVOCfHk2C/Gi4On1HFVeGcO5HqPGakOuYCZ5aehFl8i0hiR+hy6RvW125mpcG3jDLNxcmHnNYvtJAcHiNfRmZA8bj2t3GdQ4Gmx+DOlt4UHd1wS29YBVEqeaYXFzZkp4B7A8HnFdKRyj5FRWvr0MrzFXRMMIur5FXnfWg/4ov0+V1ksvYPs228Mt0FcsNax+gimgfgFYZkieBo0x9FIJQnzvHo9wVz8M5joPBAnQc136jqeKH4QCK8Ku4Q9Js3VNnp/iO+eLButKHtBR4adUSIF8n2SenpYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB4983.namprd11.prod.outlook.com (2603:10b6:510:40::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.26; Wed, 17 Apr
 2024 20:40:26 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7472.037; Wed, 17 Apr 2024
 20:40:26 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, Francois Dugast <francois.dugast@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [CI 10/10] drm/xe: Add outer runtime_pm protection to
 xe_live_ktest@xe_dma_buf
Date: Wed, 17 Apr 2024 16:39:52 -0400
Message-ID: <20240417203952.25503-10-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240417203952.25503-1-rodrigo.vivi@intel.com>
References: <20240417203952.25503-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0044.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::19) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB4983:EE_
X-MS-Office365-Filtering-Correlation-Id: ea410a50-5f59-4a19-9729-08dc5f1e9cdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YkTDMdoj0GjJM8vNSHvim1Zog4hyMCi5TNLnXhPGET2se6apnTh0z6nGrvP1DUI5C1XAnRv35ah/vbn8bpzJDFGMNhm4uONOhwSMbi5Tc0U1BFAw9Gjm2Zl5dk/zqI+et4ETlfA/twsmSuQr/wEeVCa1lyny0SnQbiTQ6jdNTlTqCIe1m0zoCrKo0Jcdt1Ha1cIrGf2Ur9zIIRDqlFxfTj31JQVTJLwgLBxJFMkEpiDOd27wMSg1OA6PCFRhyBHiJQsr8iawaLGPKb+zrgLVgW0aGnZ3GmNOj611HtDlY/gEm/jBC0WI4qxi3FIP0TSYhbUoYGFToAiE5PBXOC2TtH+5FWQcBjd/fwCHkm8jk9lE3NSLZDgzGfZJQay5Q8b3guzWDVSAWyOa4N3cTL74ok7fGuAcI18pjTp1m9pi0iyf/J7QphaK3NQ1J0bHfURwUbYRftRNz/6u5wKT/H/mvzJe91vOCk2iVYna++dJYEhxn9FKhg7/4cXA2k0SVI0mdVuPZojNB7COD8SM2qmVyM6GA2MIYZ7IZfPOSUTM/UShVSQc0KKiFlw4p/RoxVkrinBZeD1kloG1dBuAz6MvZqe589ttxokefj0BFLoKBlWfTg0iT3FLcCgdLY6swq0+vrOg6ybQDzE4N671ivUEbTz+BwjQ4x5BVxsfWIlIUCM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?be0eTHZoOnLuquKZsMsbUq+nyVdbICIXDU4BWse7liMNvlpg6oZgE9dUdT+/?=
 =?us-ascii?Q?c4VBIL96orBTUiZ2ZWLRM6HDldM2IsTt7rl9z8brMOMBxZjLD1eThUhbeoyb?=
 =?us-ascii?Q?jjaXmqKyPmFvoNCWRhYxkkmBF+GlLRWXfUn2A/Uz3Tv4oMkbiMnTCN+d+r5S?=
 =?us-ascii?Q?1hafhvRx5o9P5KepDVCuOtNJZeoanVcYzHHaaKLHe7Hlznt3Np6JotEP63Dt?=
 =?us-ascii?Q?2qluoG+1XU8hBmdkAJtyOidSqTfSB/aq+ar1mjunoWonBoSiP1Q4l3HXbDQm?=
 =?us-ascii?Q?u4O21stOu74AzGZTJOThikdQ95tK/8nclPUA3D53JOnApRZW/x424Fc9UAde?=
 =?us-ascii?Q?GSo8GYODnTSA5iS+0KzkdmzKtbEg5bj78llcB4wGJcloWbQlR0r08sALQG+H?=
 =?us-ascii?Q?Q71/AxOJnMyIZDzg7HbqlFpqHSkTRBJ6yAxLWYDo9gXuKAzh66iDvrmrATs3?=
 =?us-ascii?Q?5NqkKt2T7mdK/F+f1oAE5HKEKPEexfkql5M9BKyYZBXkgVoT6yXq8nfjoeYc?=
 =?us-ascii?Q?Q+BM1GmHZR4GYnTKQ0241dmxjyxRFWxru0w7PfPeoEGAyYmnEB6fPPciuCgu?=
 =?us-ascii?Q?Km3rwJYUWSef1mxnQHLBTHNpUoE/hrNDH6O43nCfxWQmc5T++9iHo5/LVKMw?=
 =?us-ascii?Q?10crtrVnxTeH+Y5HG+0LRLvM2WcB1bllYZHw5yaJxglHPBjtbUHjkqPZyzjf?=
 =?us-ascii?Q?x6VgUllXCUNyXrSg+D8nbCM4Gz+mo9nM8crnN2+RDoqBAjgutJelhc17h6r7?=
 =?us-ascii?Q?tsZYEAEd6/DE9RP8H16+vyQtAdIfhsdt/qED1SSIqrIcGK/EOyWrJGSH5kCC?=
 =?us-ascii?Q?8gOFYEkcs4i0dnJFUlfIphVgMJNQl3Z8OkPVKEZzBk+psbXyCnkec63vb93O?=
 =?us-ascii?Q?iODdLVWTTns80LI6Zf9N9RHD87eINpufwqpNgTDTZDoXiKGdnLyjYsMHUH8n?=
 =?us-ascii?Q?9yhvGKvf8a5w0Bgv3NQZ0DcRqvgEbnvP0YsCvy38PyUkzkJ+HMZTL95DRtQs?=
 =?us-ascii?Q?NqDwhsr+kt2oq0ck/zhkZ5oORybkUwxwKmoiXteuKM4FcIdsuEMI/Kr9ntE2?=
 =?us-ascii?Q?qp6x3TKEhWoMMmJkLML+yG4iD0NTzy94eSI6b4rQGNDxgRAZ9KBpJZIZ0+Wx?=
 =?us-ascii?Q?lExmgLx/3GTTEePQnT2yBbWeuWi7YkquKe8z3SpJOTtZQRWZfuOy2KGd4KIh?=
 =?us-ascii?Q?TAnA40tHHUflNmxU1H1WImFARdxoPi8jEPJOhXLls7VPT3cx36WItzQeJ+vD?=
 =?us-ascii?Q?PnbcNkpD/wIP9NHPiVeLHCDTeNqVjZN9foffoq4xNqmY/vM2HFbhVCCOUi9X?=
 =?us-ascii?Q?8PSM5C6l3/up2/DRGRfgRP/q13k4HVsOT4mBozI4IilnSM9RWen5h7xvDLj1?=
 =?us-ascii?Q?F4yR/ihao4yMvtuG0nGBiOtRm5+xOeu3o/3JyEictlexc/f33Z6aCv3UPF9H?=
 =?us-ascii?Q?BVIKRH58jeAfJAQpjwMm3g7LKCRwcflWjqrmWWibusPJKbqm7EhgIeAiZivI?=
 =?us-ascii?Q?s2ce80O7gdeZUFLn/Z1Mwgatn7pppT3uPReSmLTcuocTw0XZEXP1zzRUx6md?=
 =?us-ascii?Q?j9jELbSaR6ZzA8m1GquDzpBhKKJMhksCm8jvINi/eoDwZoXDfImQcUidTkJF?=
 =?us-ascii?Q?Kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ea410a50-5f59-4a19-9729-08dc5f1e9cdb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 20:40:26.7040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PUyXqUcsZ+kN0vxQAot4eSP90kR963WykP/xFvxfRCDwO/dv2lH/upN6Rj/MDYnBDwyRvOB4N585RJTj5tiiMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4983
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

Any kunit doing any memory access should get their own runtime_pm
outer references since they don't use the standard driver API
entries. In special this dma_buf from the same driver.

Found by pre-merge CI on adding WARN calls for unprotected
inner callers:

<6> [318.639739]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
<4> [318.639957] ------------[ cut here ]------------
<4> [318.639967] xe 0000:4d:00.0: Missing outer runtime PM protection
<4> [318.640049] WARNING: CPU: 117 PID: 3832 at drivers/gpu/drm/xe/xe_pm.c:533 xe_pm_runtime_get_noresume+0x48/0x60 [xe]

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_dma_buf.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
index d54dd5b43007..e7f9b531c465 100644
--- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
@@ -12,6 +12,7 @@
 #include "tests/xe_pci_test.h"
 
 #include "xe_pci.h"
+#include "xe_pm.h"
 
 static bool p2p_enabled(struct dma_buf_test_params *params)
 {
@@ -259,6 +260,7 @@ static int dma_buf_run_device(struct xe_device *xe)
 	const struct dma_buf_test_params *params;
 	struct kunit *test = xe_cur_kunit();
 
+	xe_pm_runtime_get(xe);
 	for (params = test_params; params->mem_mask; ++params) {
 		struct dma_buf_test_params p = *params;
 
@@ -266,6 +268,7 @@ static int dma_buf_run_device(struct xe_device *xe)
 		test->priv = &p;
 		xe_test_dmabuf_import_same_driver(xe);
 	}
+	xe_pm_runtime_put(xe);
 
 	/* A non-zero return would halt iteration over driver devices */
 	return 0;
-- 
2.44.0

