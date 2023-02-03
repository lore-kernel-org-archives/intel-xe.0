Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 225AFC05027
	for <intel-xe@archiver.kernel.org>; Fri,  3 Feb 2023 20:24:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 043E410E189;
	Fri,  3 Feb 2023 20:24:55 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AAA210E09C
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Feb 2023 20:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675455892; x=1706991892;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ERfc73UbcNknREdsfN+g3F6N8JueNx81yqzyM8xqkOY=;
 b=PbPZIHtYEqK6I29/D+ATwa4ywt/CkLwiiFAUAr4f+A37rgJdqjJlCBGq
 67OGAoPn3uBEhM7SpKnnzstZYfkWDyQGdzWoh2swEsYCpshwmoxonnBLM
 8xS1YDBoSh813s5HTYCxUFB/6wvT7lTv+tvsburBvJ/AU44eBeRc8puM5
 nuqafFcJbgqWyfNDbXlEfFV6KcLGP5SZG0r6JXdUNhZvasHQ+HkjmUiRx
 InwTT2waP1lt0qyE4JUE/RZC0LN1DtvWwxT/oEY7E6bTMhVyUyUIxaNp4
 b4F5zZwoa4TUr4sMQv6yM8d2e/aGadij3yjIwuQXH2ArmwZJwjMZ5c1/j Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="330975796"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="330975796"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 12:24:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="729376823"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="729376823"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 03 Feb 2023 12:24:51 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:24:50 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 12:24:50 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 3 Feb 2023 12:24:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fX9upwd0Ixz8YWNdIr6OdCaeciInHetgchVrprPRg78OM2arvEyQxwN7oW5OfbUip0lyvyYbUdB+GJz8uG0/3ke6+dgPHKXtbWro8TCKSef0WfNoKCe3Z0Z6MXY20phdIquEQ0U64ifpP/80JJutmaJ3PnsWagZ0lXtJ8sPWh51i9EorDXQzlpKdUtb/nIkl0ou/rP1Xyopy/ad+sVtR/67ObNcZHG08zSAXjYF2/pUgHhgJHgg9slfja2bjpiKCDLeAEnFXfGjow5bIwIlReWVZbBRy++lXLfaApH9rpwg3hHK3L4Io9EJpD/hHXvVlOYuWR13LXzBnesO3KbQubQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QWzu3FYjz17n/0kGYtKZjaAXOmlzujWTvEUaumRdlrU=;
 b=gfriUAFBaVtFlmof7c2yQc6FrLkJCG3hkxcExsQ+gJPJuNB5hcjJETBbbAnW/dYMAbDulljummLOn9azDsEJFc4Sv8EF06sls1x5PgI95Tn/xrzIY3nURlLFqCuVbT5Yrm0AIPq3AqjS/rM/ZM/NgFsRxIrQJ9Is3ub1QznW0UMiKyZx1FbXLb7gjQ6pK29gAuH/bft19042gqYR4mSxjduy6TOTL9xyAbx9vEEnvSXoeV4LH5T9Q89nTMhBjLeTYNIUlyTbjVpcdZjTlAERcZOVFBG16jO7c6GCmtTh1jWOegfd1SKVv7wwEwHvPZmysaDd4/5sv4ehzzEH6SF//g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB5817.namprd11.prod.outlook.com (2603:10b6:510:13a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Fri, 3 Feb
 2023 20:24:44 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%7]) with mapi id 15.20.6064.022; Fri, 3 Feb 2023
 20:24:44 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 3 Feb 2023 15:23:55 -0500
Message-ID: <20230203202409.577032-9-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203202409.577032-1-rodrigo.vivi@intel.com>
References: <20230203202409.577032-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0007.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB5817:EE_
X-MS-Office365-Filtering-Correlation-Id: 40d683de-4ff4-4dee-8ef5-08db0624afba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lEEqTjMpjT1lx/IBCbM1FmxTZ/+nPQ2Efc8+78VoPGyl55YZc1DCbTmOPEktQQ9JlvswJzeduHcLDWbCA6oBiAg1xoWIVK2ESfsC6jMa47n/xpjqVoHFe3bLnkDRNlKQQQ9zFUnSYmJCQ6Kou7KvhAgxmmuQPMrzfm+VxAKascyVR10tO3Uv6jilfWpuLA3YBXXbbKXKU1IEEHdHzftVZlucEgOl5ocu9y0MtBufVQS+eJTLZh8UN8QMfCmkuOrZzU7/B4KsuhgAPvCyAzd7CGlzqMuCqlTXhcjKmnm+vE5VMevPlhExHUEXrNQG3v4JPz1YqiHGVv3RvF96cjxzMJ3gaEKihFQNWRuAwNoPtfI56RuY8adri9qn6p15JfNd+TaEzUxz2YOtAnWlhbH4uGkVsK5Tbp82+b/CPV6RcwHXt3W9yXPOSG3XDvilEKFLNe8naot7ouI3iqYVIytkPePK+UkRiYALWzuqlEIY/zMRsD+WsFa4DFH2qWQdKqUTJcnETgUCiu6rv0gHbBnXtEojiBhjkDmAo81m8F/IfkEtEs0Ej5oqZD03saWG++OhnGhP67mpnne9Qvd1ST9LzwjpmBZOcd+c48+nNsXq/3Ax1fSNNDPuXTBI8zH6RCxDKSI6NCZtxqp5WQraDY51Qg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(396003)(39860400002)(346002)(136003)(366004)(451199018)(6666004)(316002)(4326008)(36756003)(6916009)(66556008)(54906003)(8936002)(66476007)(8676002)(5660300002)(82960400001)(66946007)(38100700002)(86362001)(107886003)(26005)(186003)(1076003)(6512007)(41300700001)(6506007)(4744005)(2906002)(44832011)(478600001)(2616005)(83380400001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cFj3QrWQ0SYfOFBB1zuA/zLnWXrP3xHrq8Yr34vTWA4RC439EmX4wKALcmOX?=
 =?us-ascii?Q?ixyU9MOmSsTiv0uMjafUQIMqFbCymCRPfyTdF+CA3P7DQ1q95ig7juT7gX90?=
 =?us-ascii?Q?KK7wdQqPCz92o2VW4rvjkPUAttVZ/IZWnmz74VltqBmybRw1rDoO2JIbkFM+?=
 =?us-ascii?Q?VH0JmZCvn2YqMZzzxy/VeEIh2nbsby3+pp3duw3/KPVOSfznhPMYhyftY+WR?=
 =?us-ascii?Q?PMwXE3i0zkiQgCAphphb6Nj6xATjL4/x8TACLfuERB5GJyxKfoOOBmAMG9d3?=
 =?us-ascii?Q?o5u/cUyi1q9uJ7BjbWr8fhd7mn5r2GbCWsMkhODXdFucHMwSGvjxNeoE3acV?=
 =?us-ascii?Q?M7HHGNCNCZ19GJKS7UGIAJZiOAyrA7ytuf0ZZgXNz8pEC9MC5lTUc3LW87R6?=
 =?us-ascii?Q?WlYlVp0z5gtjgKgRft9h8bzsQ028bqfeTKKhFevH/tMCTVh2LCVbWZHa/xs0?=
 =?us-ascii?Q?ZEt++OcZeI8NqKhXRL7mRNel4HZ7YMId2Qqw9dFe4P3PNApoo3nnjp/DHG3S?=
 =?us-ascii?Q?0TPSywl5aP0GUo/Ceo4v0N4h98vjwEO1EPUq/j354emGfHA6zfsZ/m47rD15?=
 =?us-ascii?Q?0ec/Cs3ug7M2d9WSsvMZ5XtL63KqF3SrQNBxV3yihoQqJAPv1sTMx2LCqLYj?=
 =?us-ascii?Q?+Tlj4i+mVrtbysXoxZ8UtKdsml5rcjmM3ODwkGZjWb1DTCdTz/50isZe9GS7?=
 =?us-ascii?Q?Dv+Zo9I3clf7R8WPYPsjDyZL/0isFv/yLyThiSBJsHcb40+wB32HAs2f6850?=
 =?us-ascii?Q?Kcq/qPI4t0iFIS0DnaACQQeWdvoGKvjfN/MdzG4Vbj0s4HCQaiM/J4WAms6Y?=
 =?us-ascii?Q?nF1sM9NY+/CP2HHl0lbxKpR7tvg/1lES183o5pwDHogmK8nnefLkc4wbup2K?=
 =?us-ascii?Q?B4RkJAmVpmaUyzU3mzIRLAIihdll0OuY+R4NpiX2SYvwCZ01ZlV5g2c7JuZN?=
 =?us-ascii?Q?NUcU3yQo/UiOo4dUoKomv9ajd7x1mUsLnMw9KPAlLvi4n+MGxqtFmuPzaE41?=
 =?us-ascii?Q?lsEr3kZhnJUtb5FHnxhN2xdZOqvG8YxddfwVVu7hBAnFS4DAsAftd30uvinV?=
 =?us-ascii?Q?kxFUd5Ql9NYQNUki3nwdbScuNU5+2ow8niPTzILTOceZvKcrIyumLSZkuh91?=
 =?us-ascii?Q?XzbFqUFVhYlfUx02jk36KPkGMyonmGB47rxRsQ1qHGHcnNpkHcQtIUHr3BGi?=
 =?us-ascii?Q?XnfZGtDEjF6RDxvDj5PLB9iA2PfWPXISGXd3nCeiiLqR02F61WLC4KrWILhP?=
 =?us-ascii?Q?SxkROg4qR+Ek6jIbeETZUIhUxNYunR97wy1+6+XTGXX2lbCKkHj1SfScHdN2?=
 =?us-ascii?Q?G+dgxAgM3wM2BRrTTUDDwFZjD9WX4GghpriRiMeQFZ+VLGcRRKi4Qj+dcdfa?=
 =?us-ascii?Q?Nzmw9teDWBxZ1pV+MOlKUtRtj3LzW2+11fbSA/gwlJODfWtfME4o6gjJUatz?=
 =?us-ascii?Q?EwBKjT8XbVcwGI1T/yYrOBR84B5uGI5qk5G1UGkahyjJRnSP84ZMFNSwI4/l?=
 =?us-ascii?Q?14vHFYAH938agb+a+Oyj/JcxuRhe/JDQr1lE0kpPZsuVMwUGgTlb2kVcpwpL?=
 =?us-ascii?Q?UF3Z+WpsJnRVHbg6kLy1TTJTHGfVuq09Eu7EA6AzCEz8oAq3EsI2j/QTTROp?=
 =?us-ascii?Q?bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40d683de-4ff4-4dee-8ef5-08db0624afba
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 20:24:44.2853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K+t9VCQS0N2/t5x9a12zGDpsqC8Iqgon3j4dZyaDlFdchpG5jmsbHbOEEWGVi+MJQl7KqefTiKfUK3ymHu6V/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5817
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 08/22] drm/xe: Fix build for CONFIG_DRM_XE_DEBUG
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
Cc: niranjana.vishwanathapura@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

GT TLB invalidation functions are now in header
xe_gt_tlb_invalidation.h, include that file in xe_gt_debugfs.c if
CONFIG_DRM_XE_DEBUG is set.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 30058c6100ab..946398f08bb5 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -11,12 +11,15 @@
 #include "xe_gt.h"
 #include "xe_gt_debugfs.h"
 #include "xe_gt_mcr.h"
-#include "xe_gt_pagefault.h"
 #include "xe_gt_topology.h"
 #include "xe_hw_engine.h"
 #include "xe_macros.h"
 #include "xe_uc_debugfs.h"
 
+#ifdef CONFIG_DRM_XE_DEBUG
+#include "xe_gt_tlb_invalidation.h"
+#endif
+
 static struct xe_gt *node_to_gt(struct drm_info_node *node)
 {
 	return node->info_ent->data;
-- 
2.39.1

