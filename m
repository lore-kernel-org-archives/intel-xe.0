Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D5ADC48BF8
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 16:40:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2937210E9B7;
	Thu, 22 Feb 2024 16:40:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HR8AnYa0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 321D710E9B5
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 16:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708620009; x=1740156009;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Wd359ZMYBQ9A3I++swTvNOFlxSyEsWo5ZwTkG0nymH8=;
 b=HR8AnYa01dKd11i5IN7eHQPFqohJny64AJA3WFHsB/m0DTUsAEIHq0ZN
 EXS7lunsVicfM76JYgjV2TWZI1KwALHMrvdqioXb/ImWwubUvaw/Sj1ho
 rjcON7YghOsuLeU1XpK2/ZEogMR+Syv9L8AofJcyKLci1CJJ/p+/sq/b0
 iOFpQ9f/3P+FUG5sIfCCBR08okPoM2Qf/nrKQ5dvSl54DnwKO/rzuB8AX
 ChORUbOykkJA7T73E9mHjNJrVZN13NXdOZHUZnIj7jcgoEvmeSqWDqodF
 ROqibxaOaYQuobD7Jb+7lUqrcGXT66vJG3E+Nb+KiOhmlHwPIXBo0Zwfa w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="5809275"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5809275"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 08:40:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5746875"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Feb 2024 08:40:08 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 08:40:08 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 08:40:07 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 22 Feb 2024 08:40:07 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 08:40:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UYooAC5YbZppfu8wKSqAOv2U5nYZ+Md2UyV1wBQ7LD6N2yZqs5XRAbnL7g2A9rOEKjg5bHWPHhYGGuhuFS1WQpoI2Od5E3T91m7qcEBE1Kzo+tFoWg5P5YiBdsR10yopnZiyLeeO9fVeZlzd8Sa4I2bFXzRB7h2Qt+ARR0TpFzMQ1JroCXA0Xxayh4Ts4cUJt+wzGd5eHZaLE7qieEJS7njqI3Yhroq5JISVeE+l2/M2muxBsLeEzMEBi4456LNdQQKUM82Xkwr8aeWaYc5TF00yVUzMHdlMZqvK9qgOMzvK0D6Ob/mSTwHqDzaBI5myDnYs/xc9eeBptTgpTyg8ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Xw2mvT12Y+21JUVeemxBQIeJR+jSG75uQtY1TWOXxQ=;
 b=VcDzFn8OjidEnMWZPXn41cCIljRN9iUHkJWaCnHDbTXHNkDBK+HeeMpFFGLYhK5v+g5KCuKqZsTNNnVXf8npj4qiRlsMQiHOjrf+b2z7HxwGC9g14/izgfFblAaKNJa55AOxNM/ebGWjkiLkhcpWZJGWcuJgKegTnLj3PPC2qfFMyb6VZsBF20hTmI+9lXa2GdAprnzw6FXG71bYEG0q/2W8uYZRwSaFFkfL7XSRYKrmeTos97PUVMGFRajbWVk0lduFTFBFWRbJwXmhwX2q3xwcky6Vg9tQd/QQXIuvyQpkRNxOBCKY7aKbvGpL706SWrWeGVNK2ZqlBKRFXTMMQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB4848.namprd11.prod.outlook.com (2603:10b6:a03:2af::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.10; Thu, 22 Feb
 2024 16:40:05 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7339.009; Thu, 22 Feb 2024
 16:40:05 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: [PATCH 08/14] drm/xe: Replace dma_buf mem_access per direct
 xe_pm_runtime calls
Date: Thu, 22 Feb 2024 11:39:31 -0500
Message-ID: <20240222163937.138342-8-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240222163937.138342-1-rodrigo.vivi@intel.com>
References: <20240222163937.138342-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0197.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB4848:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ae0e2e5-ef67-4335-dd88-08dc33c4eca5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dsl/IkQOSNg2KgbQDWS3R7umLO3cGDoZ/JWQZ9znrO3G9Qpj0F/gXhdgB534shmXY2k5jdpFwYZOx1pAUtyu7brk/vVUgN3izQPx4Xq5pe0roURafHe79g/9Yo+5X+0R5wYXbmZ9BG+wikcgBIkQEGdB2dVI5Woku91MDSO/1IZHDpYSrxp3xO1fFMImoSnpuRL1yevKMJkXMBsOGqqQdL4TV3NT+coRd1H50kr7MqQHiXoe5JtC8sRAmroiz6FBBP7ritVCuZLesmDefzBvY1046sz3wYZrBK22sSnobyJR5aiHlTvo/1GdvKGwVEr5sw77lVedIZd3WgHqUAWzaINEKBpztuqQug1i0F3zUYsDBslnn0Z1246PFQ0imVp1E2NJEh8mgkUzWVacIB4u0ISaJAHrg5THq/tfPfnvykb5g1Dq5gqEAktl+8pt0XiQLlus3SGlTlSAs+s9MJPDDVlAOrTAG6YBgBhiRRMs9MR5InhmGD8IcBL8F3hvqI00Y2yDTkh6FRdYtRT5fYZepejqTXV0u+1DCkmWEp/zvFo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TaHQLyz1zSVdKlLhTITBgxOHfXVJ25Y/vOBso31YJJCKyJDhMi8BR7QMeh8t?=
 =?us-ascii?Q?jLxqgfcOc2ZC71uqbScxUtQ3sPqvmhhk4x3mf/nc/dQrjkacg03V5eAeioX0?=
 =?us-ascii?Q?T0nmU/U/lAqekF6e+n/r5/ZfW5QMxoEEmUSZlXQO13dGp+PQrCIxJ9q0+Af7?=
 =?us-ascii?Q?6B9jn20/DesmIwjqKYSl4vwNvJtCghK7Frf+FZPBOHElhAXErcf+BhV4QT7r?=
 =?us-ascii?Q?wYvC9ot3CQmf/Zhf4wadW/2sKWZj48ZnSBHYVpGHI4G62o7Q3t/v4zKqwGRW?=
 =?us-ascii?Q?M7mh5TKNFru6Df6tJ0RIhsREQ4EG0zKgGDKE9cphV5q/pxb5MlJ58yC2OHJE?=
 =?us-ascii?Q?CV9QbWzkbdA3AG2owDnmZDexhT+ToUEVhRh5O4WmFau3Y+CRFzo87OPgScUg?=
 =?us-ascii?Q?CbmKcPitWTVb/+Inlznof8FaFaZTGIBBd3IYBnE9i42G9u2vSsRy3LDeyEMw?=
 =?us-ascii?Q?R43DDTI8p4gvz9GFa4ZORThANVT/tTSe5GNePczK4NdY8ykjEPLmSjdSNr+a?=
 =?us-ascii?Q?vWrfCrBPN2l2W/EmfTi56NS5ClQ8HvRrDjKEAkO1d2bw4lSy/JkasbZWopwG?=
 =?us-ascii?Q?XNMXnTuTdpa+i0hfmGZqnkOLl/+wSWV01W6zw/BIM2YTB/VprqeADtP0meQu?=
 =?us-ascii?Q?Tr7edsAP/tGsiM1OmXThUWjhfpRaPVoOUkFzBycl1PBhqqGPXA7Yw7VoNYZu?=
 =?us-ascii?Q?IqIIb2NT7/UnlLiUXNBAFeh3GSHk8NgkQ+UAcfbDWm46cgy+oN+dRzQS4VdF?=
 =?us-ascii?Q?QFepAeabtoIFVyyOkfDfiPN93885wKkYOrTZsIdBYloq+r9abg+7AfxzykNC?=
 =?us-ascii?Q?z/kjsrFoviNvwFLsYO22t1FES6IYHneOoKMdxHgBzholKNhGpaT1GP6pkB6h?=
 =?us-ascii?Q?LnpkQhvJbihi1ixCKy7+C2h5GgEGz8TXwpPuQkAAwt+cUwFBprfk3wIgEPCo?=
 =?us-ascii?Q?YQJsiFJD3OJmGnfbZn2knnMz+WS8hmvEMFe8f1ZF1yjKXVrq8lg3hajZSQis?=
 =?us-ascii?Q?TmCOpOKeU1Z2RVdSFJVLB+NvldvWHCf6fPYtad7CqrgaJPnjQtj/hyWXS9eL?=
 =?us-ascii?Q?PCp4EuQ6cFTPE9HRL/75j2LSQkq6F5CzE4UgKwIJDgmxjSBACK4vfL1B0xUN?=
 =?us-ascii?Q?zKnczrJLFWHI1cI955gvgcQe0R4UFC4jrrv3nBP1sTYpltxHPKsN8dM2R5Ct?=
 =?us-ascii?Q?i/HeH1534zJCeFKH2X7pZC7B5Ll0CvFrQoSFKZrGSKtIqBRybX4szXIpexUy?=
 =?us-ascii?Q?lBlNxkXjNUreEODcXpAvOpesdGVEhaxqtlaWzdKys6demR38jvsmZ1TxjutJ?=
 =?us-ascii?Q?eQio9jBg0VBrve6rfwBwuxF/2S4ToIHVe8+7J2rv7xQGTx5RMxMQbFakVa9d?=
 =?us-ascii?Q?qAAJP34R14picKFSFNKm7Wfplb7/bg8HPs5orLGdeNlaqbiW0XRxsDtd/7IZ?=
 =?us-ascii?Q?c74t0SqnSK8jNDuIk7/Bo4HDWlBULkPpR/dFOKWYRk9CiyaZ6iAHcyUBZM9l?=
 =?us-ascii?Q?0DsRbqbLJDaABdjegWbebNc+f/mrKLcYmCAFsuO4doYQRPp/0mG3ug4iC8T1?=
 =?us-ascii?Q?2dWklaR1fmeJMkGqqXRDu7vOfGRUEdn/ToKPaAp44TVkTpyfpdvGR3YUHWx2?=
 =?us-ascii?Q?nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ae0e2e5-ef67-4335-dd88-08dc33c4eca5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 16:40:05.8263 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AuI4UELqFwHFyopS7M5ejqxs+tsGi22mc0r/x7a1KANEepnz1IzSS35KhWV18OK80UG9QMjA2zH6w/wU6EZJyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4848
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

Continue on the path to entirely remove mem_access helpers in
favour of the direct xe_pm_runtime calls. This item is one of
the direct outer bounds of the protection.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_dma_buf.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index da2627ed6ae7..5b26af21e029 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -16,6 +16,7 @@
 #include "tests/xe_test.h"
 #include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_pm.h"
 #include "xe_ttm_vram_mgr.h"
 #include "xe_vm.h"
 
@@ -33,7 +34,7 @@ static int xe_dma_buf_attach(struct dma_buf *dmabuf,
 	if (!attach->peer2peer && !xe_bo_can_migrate(gem_to_xe_bo(obj), XE_PL_TT))
 		return -EOPNOTSUPP;
 
-	xe_device_mem_access_get(to_xe_device(obj->dev));
+	xe_pm_runtime_get(to_xe_device(obj->dev));
 	return 0;
 }
 
@@ -42,7 +43,7 @@ static void xe_dma_buf_detach(struct dma_buf *dmabuf,
 {
 	struct drm_gem_object *obj = attach->dmabuf->priv;
 
-	xe_device_mem_access_put(to_xe_device(obj->dev));
+	xe_pm_runtime_put(to_xe_device(obj->dev));
 }
 
 static int xe_dma_buf_pin(struct dma_buf_attachment *attach)
-- 
2.43.2

