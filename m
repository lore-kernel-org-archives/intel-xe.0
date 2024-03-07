Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 304A2C5475B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Mar 2024 00:16:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B31113608;
	Thu,  7 Mar 2024 00:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kcr9xE4/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB82F113607
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Mar 2024 00:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709770575; x=1741306575;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=naXObCXfhdo3cQXR5tyBk/I2xBk0itgu33/YV451GAo=;
 b=kcr9xE4/rN1CIgv/Ffx+LsytN3Ltjj4EtqZ8SX9N3IMwVTHaFf0poq27
 ia1fwMtQ0vVmM4AWYjqBgVQB72wftv/Uaf4ROnDGRtWWbybRiRI8i40GF
 RSimBrLk/Pqm2N1h9P4rMGEx7EZKH/biQ6lJT4cRDr5A/OScWLWgQ1VS2
 eU6xHGMJFisDwPLF9cAEz3mNi6rET7/nARo6alH0zlpZdf9yBbIwzI5dS
 +v5qEkr6nPnFctz4JPIlFxivf6xM3rETUWyHrRKUJx8bN+1dn0OfBmiar
 w4+JPAaQlXWuozH/1ny/o30Bf4mMFcieAz0PuhL79HRbDKjYsDY/ccqXb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4350832"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="4350832"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 16:16:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="14620548"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2024 16:16:13 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 16:16:13 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 16:16:12 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 16:16:12 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Mar 2024 16:16:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a3uvfK06deBakY6bZdQbsVjkYxGzIVpM/VUDe5WbhM3L0eGXHPNKMTrVHz4xCw08xArLtvU70l57UKufwweSH7qYrhzuugcC1xy+XygCmKZ9Zg1Dmec2NJ66APRUlEhe01yS4GATmueqKrNrDezIjEQVVVctyykpw3k60RoCsycfQ6q/B/1TemDZs9r6u9xpvh9GOqwLra2pjpiBWN3wzHrPVDJeQgoBLAHrfjLgSkHJlbCgASdC4pEBdYm5BkGno1/wnCRyC09EwXazVPFYtYJ3h1MQJwqEsnaLUoXtAAHwkxeLq1pPmd+xqL9x8GkjtotcoWzIitMPrA7uu8jt6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2dpnzyZCIC/lF38qlETdMGJiaCbiE1C6i+CUM/ywY3c=;
 b=d2iTwWmMF1mJh7PHPyYlYLDXdF/AZbtOMWIIC0kz3HXvuAJUtaW4xzLq0lD8WZ98eL1NNAZP58nbQpJOE87PVbVOQhzaJ720gQqi7e/4Ixvord0XcEqy8RsQO3d/5iAAyu2nqUKPx2fhlznxANsbGLYBNNTNnguMvPjRYMBC1hiHEHGxpPeWPn0ifAoJ81SNWJF4kabXl9Bo9rGsQbtjQf/oXucZNEIumGpeQLXKtUl6P6KbWv4YkicJAmwwdFTxsNm/azaFI6mCLSPnOcVCmPqXtm3VvnFLXnQp6rCR3zRkiE9ExOcKQxv4vdw7UShrnXtkpLaYltbkAfyK2ChQfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB7851.namprd11.prod.outlook.com (2603:10b6:8:fb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.22; Thu, 7 Mar
 2024 00:16:09 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7362.019; Thu, 7 Mar 2024
 00:16:09 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <intel-gfx@lists.freexdesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 05/10] drm/xe: Convert xe_gem_fault to use direct
 xe_pm_runtime calls
Date: Wed, 6 Mar 2024 19:15:49 -0500
Message-ID: <20240307001554.162153-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240307001554.162153-1-rodrigo.vivi@intel.com>
References: <20240307001554.162153-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0049.namprd11.prod.outlook.com
 (2603:10b6:a03:80::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB7851:EE_
X-MS-Office365-Filtering-Correlation-Id: f549018c-f0d3-40d3-5caa-08dc3e3bca1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: thidbTfyzGTIKrqtwoY/is4wEAIbROto2yg2z9ar7nTLGCZPjDig44vlFXTD5Wu7yQwEtJW4rqILyp+jcIlM8hgXsZORRAvKdXOyOdO/kKeGGA7bawa9sjd9yMnlxytHcCUoGKsfZeIYJuULWXjUqA2Pzr3gNImYleEgghm3LvYkimsrPybOzJExDI7O5FrHFAuGPx+rcDv2kkC60yNsw2Qwtc/ugYeFH3zkfeVv5U0WeIR3xdtZ8W1Q+GRV3Fis8WOA84L4I5e3sTa963pjKSPn/nL6uwka8z0BgZ8GWUsn68QDix7gCWBHRfQR8sE+s7CCuib8E4r94FPdrCKKB5ehzEfv5jtv5AcsI8SEFfcQm2u4DyDBFi4MsxEsgPfFwOsop16CkkMGTmE60CmR5X3hIgHFAMe3m+o0Yg1DDnOKHBz+cGdmx8e6BIJAqc4m2w2XM30eyto15mg9LkG3QQfgkjNheUcKQvIc4tkeW6tIbkc+SMxL0UOCNRleW5r3Q9dO1XYwDopz0f7vefO7YW7KWhyvbaEFW6zFrxr4YbDqM0F4SYm/bLCoTSQtxkl92rV4QdPGy91pULxU3j3I844/ztykawRG9Hkxq8K6Ei5ySl+Ne/rEHhjmXwOf1xHnoJLO12xu+9DA7iHU/ZhEQlSJJwalVjnMjbZRw08wHfY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kKPrWeCYeyUd418/rtOz4W6q9DsDBRh/pNxJxUR7e9lrsFBg47MBo3a6jisb?=
 =?us-ascii?Q?wL0m64+yV3ty+JQaOlMHcJBH+jFzBfGDPeJnVYccgBPGG01yTVMjHPNgnpfM?=
 =?us-ascii?Q?+1VayW2yNFCmJALw4FYcLJJcE2llNqVoGa0kBXOHN2ouwGOUQlQqdrJpabcp?=
 =?us-ascii?Q?XIn3s30T4iAiSvaIndMSf++Jvid+10pqyWTtlA7hP2CWlhFo/7JDQKaDlaax?=
 =?us-ascii?Q?1wi/kmyPKhVuVV/IV2COtcFhzwVWeDEPk0cGIzfwfS839MjuLdQ5drx9OLta?=
 =?us-ascii?Q?r5ZkMXTsP3un9bBNmw8uIYnDdNMHoz1QPwTbUB5SpThRzoCklmlg0zaOVOaF?=
 =?us-ascii?Q?xIHeFotetNJrlpteLoFHt1aP1zOdvmVXHXHbxVmFnwxCxSNwGGk7LwedjODT?=
 =?us-ascii?Q?/vShL2j9rd2zZuG09Akgo4v1jykHYJ0VFegfrqJ/U4UA4+eFA8+iJ9+a4Mjt?=
 =?us-ascii?Q?mtVFxCvfKJpsLwgg5xSLnCoeShZG9YH7r5A4zvJPn7k0LQCas7NqzzM9kDdQ?=
 =?us-ascii?Q?x9xLy5PGMEKKt0/xzyOB9Xh6HxezdRR3q95b148TjUI13liyn1WpSouUpVHO?=
 =?us-ascii?Q?oKnB6eR8ZTuB5dgZ8SSTdUzsDYLkQ8BGcwQQEONWY/TCPqNwYaIQ6SxPlFXB?=
 =?us-ascii?Q?OkrAqHHQE3u9tUuSbp8A8V9w2UwXcsMHctBF6LIOHh7ow2kTbC0gxR1LcMbZ?=
 =?us-ascii?Q?gN+MLQtQcwxK21QjptqJnTUchd6JH1AFycFTkDMDB4xn/AKTUvHskkzN7y3n?=
 =?us-ascii?Q?5ppr7sCkkFm2mtNRHl9xF2lWNMAC+7K0DMWZWhqyZakOyjVEGp2QldpqP7YR?=
 =?us-ascii?Q?zIPvTABdWzdcagc0l+WqCioeh4D91lH1BoMLPasoXD3mAhIWDdhrmYproQAV?=
 =?us-ascii?Q?YPZvS1OO0seQK0nGulmNUR/BboWOlFuhIaoRTPF+/G0Q61JxCSZBDHI/OoqZ?=
 =?us-ascii?Q?xP7zj/2Blxxffnv6eLPoin5XXTJCWU01t7T6qO400m4NBNUM2jnDuAie+Uxz?=
 =?us-ascii?Q?tdQ3odX7HK7PlAm/h/50Mx4DyEW5oVoWiFIuJQIECH5zEUhASQGeaIUm6yaw?=
 =?us-ascii?Q?xgHy/O1VPesmndz9XjUAAmxgAULEH5+jwWLWDM14Z5nUEO89tcdlM5v650Ce?=
 =?us-ascii?Q?uypq5vAdYOC3nGujG4+rqEFdFMLZX6WjjB8UIhufocCus5B0XmeA9OouuhRO?=
 =?us-ascii?Q?9nRTt+854kITTSKsa1UUVKjOtYtaP0qkkuZJS5e+eWaI6+m/uILe9PvAK2vN?=
 =?us-ascii?Q?UugkgET9oX2tiB4TNF0MWzGL68w7SnkfZY9md+VBMjfanWXWRy2fYit5VSdA?=
 =?us-ascii?Q?P3oPl7U0+Js/psasgv9aXY1d3Ce5hDp1Ov6hnoyrHKHTGO8BNfvcvq1E0aQd?=
 =?us-ascii?Q?nNPKaMwPklyryFexkjt0Y3irOSs6Yc1qAdXUxEwvaWWq4Ylv7G/TBOfSXaqU?=
 =?us-ascii?Q?iNZsv5N7qwCHVy7m6dMop5Tdw5dM8hmRTnZ9BTIVfkncpbDnluyQ6bCvz+Yq?=
 =?us-ascii?Q?FnfX0L3EDqbsRlS6gkvxcMGy9lAu+s48KTkRpWIq5CUcEFE/f3sIIyf6rKKQ?=
 =?us-ascii?Q?I+PEDab/XUkQZRaLqDbCPp4W5EVTg44Bu/cUKmc3om/+xhC8RqWoxUvG97va?=
 =?us-ascii?Q?DQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f549018c-f0d3-40d3-5caa-08dc3e3bca1c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 00:16:09.6334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JUw/2IQLJk0X5Dmjjf5WgFz/qkDGcuUSk/Yp0i1rR3OTrY1HJ8MNwCiEToF/uiQbQ20Za7VvnA2pS2RzJx/5yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7851
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

The gem page fault is one of the outer bound protections where
we want to ensure that the hardware is in D0 before proceeding
with memory access. Let's convert it towards the xe_pm_runtime
functions directly so we can then convert the mem_access to be
inner protection only and then Kill it for good.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index b89ac6db68a1..bc0cc5edc533 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -22,6 +22,7 @@
 #include "xe_gt.h"
 #include "xe_map.h"
 #include "xe_migrate.h"
+#include "xe_pm.h"
 #include "xe_preempt_fence.h"
 #include "xe_res_cursor.h"
 #include "xe_trace.h"
@@ -1136,7 +1137,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	int idx, r = 0;
 
 	if (needs_rpm)
-		xe_device_mem_access_get(xe);
+		xe_pm_runtime_get(xe);
 
 	ret = ttm_bo_vm_reserve(tbo, vmf);
 	if (ret)
@@ -1176,7 +1177,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	dma_resv_unlock(tbo->base.resv);
 out:
 	if (needs_rpm)
-		xe_device_mem_access_put(xe);
+		xe_pm_runtime_put(xe);
 
 	return ret;
 }
-- 
2.43.2

