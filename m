Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08DC6CD8CB9
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 15:26:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDDCC10EABD;
	Wed, 10 Jun 2026 15:26:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i6LrfxYj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D713610EABD
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jun 2026 15:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781105165; x=1812641165;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=jaSxbhCQ5B7rcRpi/wTl+LKaU0cVReqYN386WxWrmGg=;
 b=i6LrfxYjO8dIIwWrOCVz/5OKAKyQaKWht+QIXoOnSDulVCAe/dwrWSXz
 5dGbFhKkyTNtOIzVkqa3KZaH/x1n3oWXwV191/Y4WYomzc/2qFtiMvRB+
 gzvIQbf1+CQ8XWalch6WafdfLtoXJ0efdxWkcQIh61IkcUC7l/qYsglsD
 tLG9t1oOuc+oKgRMNG8n3PB6WU3bKP+oOIc0nxQvhnBDJSTpS3t5WdPqD
 F1xk+IM1DzrGk4Qb4I8a/8CTfQwgepVah+Y2X2pwktOplDYZ6utpqpOee
 WT0j8spHI0TCCOoDBJTPUtgHM2RGjTjwHEsC1IhoJZtFpk2ENPzhf/vYM g==;
X-CSE-ConnectionGUID: 7NuSH63UQRGLIrYC1Kf05A==
X-CSE-MsgGUID: 7+qVM2HQQ3+dh/fQBR249A==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92467716"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="92467716"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 08:26:04 -0700
X-CSE-ConnectionGUID: u0gMBlopQwCSvtwvN9mjQQ==
X-CSE-MsgGUID: y9rnSLyiSkOs+WiFpimO5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="284286065"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 08:26:04 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 08:26:03 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 10 Jun 2026 08:26:03 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.43)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 08:26:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pFs+kX933liwcuVFwnN37dYkEzgH7iRzVSfheS795rxrC8baNORkWxfWOcKwjLYheC68LiyJau5s0aA/YI1na+5so5N2zkVwXCJivoA6eNbNa7bnjK5exAGtHFEYeFhLD8aiDLFn3ZZIg2suXBDPnTlkAla9pl1AJ3pkXzNfM9OEF8tYLNT5EuWWt5QCFcWZBlc0v8z7RBpKUfMbrMqukQOJn6S89kFR7Rgu/XraY7IiPfYng97xZH0jEqj19l/5e+2Pqpgcwh8RRwO3IQFJJbH39NxuqHPpjslb0Y+mDDm/Veey4LPpN9/j1rn6k4srISZQprNfwFG4SOVWUzbNyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1UXEQ/fE4Pb5o2M7/J1zOD9nJpHEJGX4YTFDZvRSkfk=;
 b=MFJ4UAx9fC/FChHaPzKGaTeOJuCl+dIJuu50AsU7OFf/qU4xn6vegWmHNLWm5uCl4t3MB0mhamgU4afKTZCNkHv+wqUV7U/lmGZlVraOJofwAMB1VKlaWx8EngdFUOkuiM4ZiPep18U+sz2lsoaTL6WObizZ18kZLZtmdIqeHcSst0dWLPNA8G3ltqXe7h8R3qSIefoRiWU7a8aOZAb8TIC/NyFcPdGR9e3dKIxzH5nJRG7I7Uh2ZPXuehU7ZaIU7dEYHvMYzV/Stnj5AUzBW2NV9zf2z+9qxg905vz676072xHDNSGjZzVQydHcxMfg6MwP/UjtKPLU84r0laiiig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by SA2PR11MB4843.namprd11.prod.outlook.com (2603:10b6:806:fb::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.11; Wed, 10 Jun
 2026 15:25:55 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 15:25:55 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Sanjay
 Yadav" <sanjay.kumar.yadav@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 2/2] drm/xe/lrc: fix spurious warning when reading context
 timestamp
Date: Wed, 10 Jun 2026 11:25:50 -0400
Message-ID: <20260610152548.404575-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260610152548.404575-3-rodrigo.vivi@intel.com>
References: <20260610152548.404575-3-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0127.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::12) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|SA2PR11MB4843:EE_
X-MS-Office365-Filtering-Correlation-Id: 65a9b12b-32e6-454e-51d2-08dec7049090
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: UlD7ZVLkY0KD3bv+CDktljskxFOrJ4zM4Su7dZ4d1NEp/JW3mahmukL+4O07F/+30FttQI3Cg7uczLtP7q4Fbs+s2mvsHtX9ZTXpNSKiWSdTRK79fsJ/MI8XPgc6pc9Nffioov2WC3HDkomt3JjxTaFeZMKaabFMf3mzjKsah6G0FdfzYBQt0uqfLRFUEpRiIsOiJFuZn+0reLbIcvKj4ggYuDbilDLyYqKvMetypkrSeyv+w7xL6+CKpB3cterq7MJJCyCv7jXtl9VbuPLj8t8WAxRoGQAY+bkWOj+m+/NPlL9s2nBJTztB48jItWJO9FaCAPp42Ois6RTNZxAkIfUm1mA5VTFY3aFAHGEb0dqDgUG/l2FmZqgvP7BeGm61KbGAh/vjAU5SGbWIRJzT9vvxdgHkxUEQ5eVqQ1SpR9xgD6LZ3d6hcaw6N/X7KWddgXOsDm4he7lfv82NuI/JnNWC9RkrHvh+1JnjdTa99FQlrGHQ+pBzZiwoCkUIOwn+8kw5qFvGdRSLipwlMgdZVXEhyfTcz0V053MNiPWagCsOGJ+aF8P9y6xuLGJ2rH3Qry2WSFZDZ5oDanG5KS1bhgFQGiIxdaAo7Re7jP9HSBbcj9396/JUxOzELkQnyOV0e6bzjwQebcZTQ6KzmXdoVcfohtGBbh1X4H9y6uY1ubae95EYHqhVGrqwateDpRIA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qUeDJFnQqA6CEmAHar3f3QFLY19cu50dvHgcsexr5eftq5WyD+y29Gmtjxry?=
 =?us-ascii?Q?Q1Y53vDa4mvB+swldELAS7SW1ltAI+cmCvEE1PODYxQs4bZNJYyVLSJPm+n2?=
 =?us-ascii?Q?YmG0C2tV4knMkLMV9P8XHXMRdKu0Gna9WyMjnfTDHyDAUOSt/LWw1E3cr3b1?=
 =?us-ascii?Q?ynpJQbwC5t4hJ+VirtGKNzrGG3LnvG4Z5AqirRvNe2Uh4ztUBGcbDaLL9LQ5?=
 =?us-ascii?Q?VZLh4DT2F9eHEsHVER7sXB4gyExuWprg2CfabYD4SG6PJmzdnwZMphdYvnuY?=
 =?us-ascii?Q?ZkLQroBHc943F4MplbWoPPbGCVoIzWLHsiOkApYeaTZI9ITzmQMERh+HcaL9?=
 =?us-ascii?Q?D9gTsCnLD2aeuGCdD6lEbf6FORL3tqgbqvG22Piu+wghbZSBBT6qyHEML7Kc?=
 =?us-ascii?Q?z/oSXfLE70toe0IP4Zt28o1F8wY9M8OlLMMavu6hhxjyfEb62bdNt8ws00O9?=
 =?us-ascii?Q?wwuWRdw/okSum7i0bOpn8kJi9VyZQr1p7TQt07kwVmTO1HZeZ3tSWnvzPKe4?=
 =?us-ascii?Q?aeJWeUe/AYb06Ah41mRE2P3iIg/0TYUwJzMhWeowAjBb6cC4h4hYzcAk5b9H?=
 =?us-ascii?Q?MJKP4UM5cVgwZ7LV/ZlQ5CPLtqcrOnJlnuMoziSSy8fuRL69CNmlF5RxpgDr?=
 =?us-ascii?Q?kOjo06SiGzA8ROgw7Fb7tRIw7SNFctyqm67cqvn5UEues3Z0JPMN+/l03Aav?=
 =?us-ascii?Q?n7fQrMQUBnBUsPCyLtdL5rVOWJPQqHoYXyD2KZoQnsOZQxQ0t/cLQi9yzDQk?=
 =?us-ascii?Q?gtCcuWE3lAA0TAguykO7zVGRsM0G6bcVmhvg+Ta2mecVAxYVuyNMbi2X1EyZ?=
 =?us-ascii?Q?8MPvTtddqMIdOlhY78aWiPUAH5HcJNk26zL1bxyJz2PTyMggTwzT1JxYj/y0?=
 =?us-ascii?Q?utHFQPM8Xuo9S9DjPs3yJgCV2U6AlNexhlA1XPJ9ZPh/FM3coUXNvp/ZA/x2?=
 =?us-ascii?Q?3TBJCoENth2Mn2k6M0TJWRlk3WdFwAys5GXDC6DdSb1gU2yoCi9ERpywyf7J?=
 =?us-ascii?Q?/RlbA1JrcliGZvuBofJhShaULwFlYcBGxX2qHVhhxc81uHiAIeguWsBrLyqg?=
 =?us-ascii?Q?Cx7JhSq87isVipDh6zuhAvf2RhZG6gc3A1yKse/rTvBmxTyhEqmvI7wtflUv?=
 =?us-ascii?Q?oZTQ1QfUyNaOvgyaFJx8XSPk/J82rE4+8PbYv74t9DJSPUGX8gf/vOTd+yJb?=
 =?us-ascii?Q?FdPbRHdQZ5qtGRoeUWeVuAAw9yHc82nnn0k1lqcQBRIoim7IVWpNOm/Ppd7Y?=
 =?us-ascii?Q?sHI6CTDZRgWQBMhVaupG7PsuMYiJ8rYpMz5MkextHbJGys5H72aGK6lBFtk0?=
 =?us-ascii?Q?ueI4wxIAw/3SwNqAQsyl61XJ2q3PSGnxJv5Q5ASFNCB/W44DVkwWzY1ncCKO?=
 =?us-ascii?Q?PMHXy0kBq3Njx/TasaCONkT60T0I+nfZ/LVUxjkcLVHC+vcGzqftRYDGh8Os?=
 =?us-ascii?Q?NdQf2bgvdjuNfC8NN2XjeJqy8H2B9aaKwuUnSuTaZAHkTmY8j9KoJYc5hl7F?=
 =?us-ascii?Q?XtNNtUdsumUHCnQKAV8HdyxAX6zDq4TB+Rf8yR50NNE9//jXCwCU+Yktv4pE?=
 =?us-ascii?Q?Vd6lFEOEamAr5ux470tbXvfInXDOT8ONFD3qfnL/rt6gkuXfADJiPnWWR6Eh?=
 =?us-ascii?Q?+gLifk2AF/rnm2F2OEi+zzRuPfJ/4Z4XSKAwNh87IMck4dlCxzIzLzU0jS7R?=
 =?us-ascii?Q?Qh3xn/q7HV3WBC61e4zCcJ/ULU0sasdmXOuPM6zPHJufyYZShHrF/zjuZIxu?=
 =?us-ascii?Q?KOPr6RAiAw=3D=3D?=
X-Exchange-RoutingPolicyChecked: IyCXtf56mYK/6tVpouByVKfMOKvgobtoA+AoEnpl7cP2VqJl3aXXfg/BLIMQKpIP8U01Yg+GA+961DIVCthEVs1dZX5ulaJHMLMo9wLlvGOvzWoKkxwkeoRZMBDnJus0jg/DA7WKX2fDagxWE6mP0e1Lrimz5Ex1rRg1yyFuo1pbPeaoxVHOa4gvun/QJhoorEo/jsEPG+NeRe2EjFh5bOuarXQLsWiqfglDIysQ8rrBMBTCAv3E9373Vnh/XgfqoD9lmLzuECFzE3Gn64USi80F65rZXPHHQfh0Y2L95A/zODF1lHQR8IMdCocxMMcuWGBHbkmP17N99N3qIiOIww==
X-MS-Exchange-CrossTenant-Network-Message-Id: 65a9b12b-32e6-454e-51d2-08dec7049090
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 15:25:55.4183 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9R9u2HL+HDQHhdCuMghPIZ37t/vWxbzky9PU24P3mfAQ7Y/iuKcXjXf52sV5Y3w4xwb7G3V+aL0rcqUffM9bWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4843
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

Fixes the following warning that fires during timeout handling for a
context running on the USM-reserved copy engine:

  xe 0000:03:00.0: [drm] Tile0: GT0: Unexpected engine class:instance 3:8 for utilization
  WARNING: at engine_id_to_hwe+0x88/0xc0 [xe]
    xe_lrc_context_timestamp+0x61/0xb0 [xe]
    guc_exec_queue_timedout_job+0x713/0x1020 [xe]

class:instance 3:8 is XE_ENGINE_CLASS_COPY on the highest BCS instance,
which xe_hw_engine.c reserves for USM (gt->usm.reserved_bcs_instance) and
on which the migrate engine runs kernel contexts. When such a context's
utilization is read - e.g. from the TDR path - engine_id_to_hwe()
rejected it because xe_hw_engine_is_reserved() is true, firing WARN_ONCE
and returning NULL, which made the timestamp read silently fall back to
stale data.

The reserved-engine guard was added defensively with the original WA BB
utilization support and simply overlooked that the migrate engine is a
valid, present engine whose CTX_TIMESTAMP can legitimately be read.

Allow the USM-reserved copy engine specifically (xe_gt_is_usm_hwe()),
while still rejecting the other reserved cases (GSCCS / XE_ENGINE_CLASS_
OTHER and ccs_mode-disabled compute engines), which would indeed be
unexpected on this path. The dynamic engine resolution via the ENGINE_ID
stashed in the PPHWSP by the WA BB is kept intact, so utilization for
load-balanced/virtual exec queues still resolves the engine the context
is actually running on.

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Assisted-by: GitHub-Copilot:claude-sonnet-4.6
Assisted-by: GitHub-Copilot:claude-opus-4.8
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index a4292a11391d..3e7c995085d0 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -2618,13 +2618,19 @@ void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot)
 	kfree(snapshot);
 }
 
+static bool engine_valid_for_utilization(struct xe_gt *gt, struct xe_hw_engine *hwe)
+{
+	/* The USM-reserved copy engine runs kernel migrate contexts queried here */
+	return hwe && (!xe_hw_engine_is_reserved(hwe) || xe_gt_is_usm_hwe(gt, hwe));
+}
+
 static struct xe_hw_engine *engine_id_to_hwe(struct xe_gt *gt, u32 engine_id)
 {
 	u16 class = REG_FIELD_GET(ENGINE_CLASS_ID, engine_id);
 	u16 instance = REG_FIELD_GET(ENGINE_INSTANCE_ID, engine_id);
 	struct xe_hw_engine *hwe = xe_gt_hw_engine(gt, class, instance, false);
 
-	if (xe_gt_WARN_ONCE(gt, !hwe || xe_hw_engine_is_reserved(hwe),
+	if (xe_gt_WARN_ONCE(gt, !engine_valid_for_utilization(gt, hwe),
 			    "Unexpected engine class:instance %d:%d for utilization\n",
 			    class, instance))
 		return NULL;
-- 
2.54.0

