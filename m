Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC8CC7EE22
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 21:08:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 132F610E038;
	Mon,  8 May 2023 21:08:59 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1048E10E138
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 21:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683580136; x=1715116136;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=pJlWUl16gKLR+2zyd6YbUJOmWoZfNxU6CBFZywrlQLY=;
 b=YBumPWAhf9n5qmXg6vbT0JfowiHe5btxpuhJEvAx8xUDHN2jWX+UVlT+
 QQUo51ZFrj+YVNzsdjWLpVV9QwTaHknm2C1jRxTgD6no5YNroBgmvGnYu
 qIQ9x+14yOmtt9OPy77VF32p81DMA6wi2mzKthmYwsdk3moLRCQIDs06m
 bwb+o1W7KaG10EAUhg7LqbTzh7vg18XWJfz2e5mQCk55f9yMervzyo/4y
 mfclMoZnbnn6p92g0dfmhq+52H+RpKGoQXzLH1xYjN13hOLj+GyCa6NcN
 C3v57eQ7DwHilY9pp2sY4GBz1J2uyqljYZqUWU5QyxMnEU37K7e+HOKuP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="415319319"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="415319319"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 14:08:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="649029282"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="649029282"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 08 May 2023 14:08:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 14:08:54 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 14:08:54 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 14:08:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jlKNlZotLY2P9gOsG+gxwvAPVoyRrY/t7wYXE0mnlMCIMCI6Q7XUE10rN9vcmRrLBk2w+4zEK0N8XNqdiCb0Pajy9t2VBD+h/AFvfLPrKeY7toda8PeQHmuCz2Fa7NWpNwNeoVzdMhgzhHFCbUX/Wk0pXzTM1Q8Z7Fdc592jiHylMX5DWq9V1YLGoUKfRDMJDfNTiz8iYTsZitiWQ/Mm9oEyBjrzGGFl2JugUWar8cxLlN1z/dT5UIfKpbd4epzprlxx2ksMyZbd3O67OT16bIT7fPsNANw3Q99Y3lUVaYtAv28/1YO6qfTEXCZ8QTAncpY9zYkiAU6wpUQIpU+MhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lSWLJbd9WqAlL15HhQj1YtqPqwHXYv2QB34ZYCSDyO4=;
 b=Pfjma1qchV9DFdicgAzBvEqSHeQM5lCKmHU6njuUU9i7QgQA5iRM2OpOjq3T57dBZuP0HoirRXKPLsWUieSrOMTHVKVGJSlkc3cUixXXIrxYiHiFh9vsg48qIxer/Y2jpIgEjIUOfuqqSeNc6gWj1SG4pwJ2kXv/SS73ydrRQNx48K1bV9Z5DP7XYkun9apv4PwHCU3tpE0MjyyrwdWeI8rMlylEbUrFMeNI5d9wAXPvmj5oILp8t233xnQVMeTrnYxRgPCE3civxw1JvSKWNOHkApEeCOCeai3ECic8ANRQAsI4w0h1fQofIrdCBnC/ML6HZjQcRNtfh6IeDdTlFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB5011.namprd11.prod.outlook.com (2603:10b6:303:6d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 21:08:51 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 21:08:51 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 8 May 2023 17:08:20 -0400
Message-ID: <20230508210825.1405432-6-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508210825.1405432-1-rodrigo.vivi@intel.com>
References: <20230508210825.1405432-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:a03:254::6) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB5011:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fdb660f-7f3d-46a9-01ce-08db50086c3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gFEDbm1E+/BGih9+AVOW5fvVPC9abrzpaHLrsYXGgMJU8tLpphOzcYxJwv8oPg8XC2CvsuuNEf9W5BA949CJWlMsFzxUqGm6RYLOtgwZiFXBF7cHLHgVbkUkATGctI6BcXZmpLxuWTbf/r2xCxVX3hFtL8BB4goUYQVhC7WDhGUcgehCizrs1fS2pRjXWGnfLeip7VjP/AN7lp8mJP7KuiG+UciIbcYmF+mdxoMhdoJwXJLCFhnPXjLDz2+fxdOG+fh8KVF8CxuE8+uCNxhrfzCll2nSkX0Lgu9FSExOpt6qDT8h6TirFK+DgJSMMwQGtECJMdij3UhjVhV+nuJxVFg8b7LlGp0u+tR11Ss7ejP3Nj1CBVnRUq1Yd1YSgSXXyG3+tG8d4AhBrc9i9ZOVpkUfFD4wgUGgbRtQm0vGMtw73csogkg661fiCSAFOPv9rvEv4UQVnatm6en6WlGUUN9mXlHAdySNNAnUewoJmkRJFINshUCVSclSy/WZ2Fr82LpLeUClscurdUNZB/v/cocIfJzryxd/nCOXhdRjA5M5OvTxAuU7KuqBmvCloD2N
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(396003)(376002)(366004)(136003)(451199021)(86362001)(66476007)(36756003)(54906003)(66946007)(316002)(4326008)(6916009)(66556008)(478600001)(6486002)(5660300002)(2906002)(8936002)(8676002)(41300700001)(44832011)(38100700002)(82960400001)(186003)(2616005)(6506007)(26005)(107886003)(1076003)(6512007)(83380400001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTBRQXp2MWVwZVQyRmVPb0t6T09VTzNpRGFHMjRqdVpjTG51UzByUGJVdUdC?=
 =?utf-8?B?ZjBTVUZnRFlsanJyY0diamNUczdRT2F6ZEZmZGd0UTZWRm0xRVFpQkRzeHdB?=
 =?utf-8?B?THZDWVRNWDNMZm9kT0g3dXBtK3UxZ0Y2anptZkpyT3crdXpWVmFuOENEblYv?=
 =?utf-8?B?WmJUWTg0bDkydkkxWnpINlh5V0NxQTdFR29TckkxNDVJanMvaHI3cEZpMnRs?=
 =?utf-8?B?Z1Q1ZzRQS1R1dlV4eWpCMG81RE5aNXFXYW9UMzRFL1FjL2ZzNnd1NEZtcjFT?=
 =?utf-8?B?ckVTVE9DWnlQNGsyN29reEsvT21ma3hZY1dkSm5iRHk0bUt4WTY2d1NDU2wv?=
 =?utf-8?B?R3V6YXppNWRNS1M1NWF4enU2bzI5ZW5RNU9RSDRXUTNQcGRRNGZraVY4bVRp?=
 =?utf-8?B?RGRqbWc4aXVUMHZ4bnBneHdGZnpRNGp0eG0zK3hablVOajRNeHhVRE1pZUZQ?=
 =?utf-8?B?ampZSTRaaEV6MDBoRkVpRVhtamN3WEROdVE4L3dqOTUvZm9VY24wbmdVQ01R?=
 =?utf-8?B?NWtDbDBwc2JHVk5aeWRZdU0zN3pYbE9vUWsvb1BJd3hlN3hSd3NVQ1NBVU5w?=
 =?utf-8?B?RkVLaG81YXhQRnRxeW5CSHRnT250aS9xMHFLdmFhQVZuRWc3aG1OUjlHUklY?=
 =?utf-8?B?Y1RCY0NLUUlzMS93bVBiL2h3WWNad0hJajdMb0l3TUNpMzBBNnVxQVFQQXNt?=
 =?utf-8?B?dUJCYU5KQU5YdDdYVzZRaWdmODRoQks1KzdnVkF4Rks5OG5ma05NQi9sZDZV?=
 =?utf-8?B?TkRkMTNFSE1kdS9mOUQwS1gvc2dIL2M1b1EzcE9wOEV2enRhMll4ZUhRaVZw?=
 =?utf-8?B?c2ppdi9OL3ByTWMzSVlIQlQxM3MvVW9QVVV1STE5b2NkbUFZNDc1UTVUNW9s?=
 =?utf-8?B?T1lIZkJJc3E3QktVOFlEVGhXOWNoKzdCMGl5ZHJBRFg2QmxIeEV3alN4ZmVr?=
 =?utf-8?B?dVVjUkpXa1l0Qk8rY25oMzBKbzBQQzZmZURYZ2p6UzRuY0hCUllsd0tyQmtG?=
 =?utf-8?B?S0xYK3YvK001aC93SW5kZmFJZG02TU1oN3pLVFMxS3FuckZ0SzlqMVVHRjBa?=
 =?utf-8?B?dzhIVHpDeWpYNjRuR2hqSjc0SnpyY2dBQ3pHN3U0eVAwTlJsRTVodXVQU0lG?=
 =?utf-8?B?cU0vbDVmYlN2S2ZkNy93dGJTSDVjY0FsQVMwUVF3dG12bkNSTTlhSmtmS0hr?=
 =?utf-8?B?SzJyc3FSUUtBa2NCZURNMVR1ZHRwSkUwS1d3a2Y0NllyeG1RbzI4N2IvUjRC?=
 =?utf-8?B?anQ3czBOZnNodTNuL1F4YXdncGJUeFJVSm9nRDhBbVhtZGxrTHQzUDQ0UjJQ?=
 =?utf-8?B?RmV6MWIyYzJoWTVsdzBZTGd2Wkc5WnVmaVUyV2tUcVZSRGlxc2xkem5hTUU5?=
 =?utf-8?B?V1RZVVlBSktnbWgzM0JuOGpxUnJJeXNYK0lRemFHK0Urbko4MEpRc2JkMjhE?=
 =?utf-8?B?eVBod2dTZldBZm15WUJ4UHlGUjVOd2JTN3dNWldsaElVZzhBMkcyTHVQeFBn?=
 =?utf-8?B?ZTFwVHJLRHhiUndoeVo3V2JsT3lLQVVSSG5YUWtGcEhFQW96WHgrelZ6OWMy?=
 =?utf-8?B?ak1rc0lpSE5mZXhvOE9UblFUYzQvZkVBWTlzdjg5VnI5dndVSWhteWpqaXI3?=
 =?utf-8?B?SCtsTzZrSjdFVjlYa0VPRElBKzBQQjEwamhGTHhKL2drOXhsRkJFeWFZQWF6?=
 =?utf-8?B?R2dZc0NYdzNFbmh4S2tNa1RFcGZybmdIdkIyRy9yN1dJL3V1Z3llejJlbWhq?=
 =?utf-8?B?cjI2YWhja1U5RkpBTExFcW1DTzVHQ1ZrSkVDUmhVakthVnBiaHhyS2pqUXp2?=
 =?utf-8?B?aXhrUUZTby9zN29vRHFwclJMK3NWQ3Bqb1NCdDMwM1RwZW5TN1RVSG82dUl5?=
 =?utf-8?B?MXhMNWFtOWVObzcrTkZHT0xXSWF4UjV4T0tOOWdHTzg0RnBCdFR3TkpSUTlQ?=
 =?utf-8?B?cFJaUDhlQ0QrM3Q1OEUwaFV0eFA3WWRIL0JBTjhTZUZxREc1RXlpUFNOc3lW?=
 =?utf-8?B?VDhsK2U0QmRCdVpVK2U3YmZZZWF0ZWIwZlJGb3FUMlE5TUgzVWpPczBKam91?=
 =?utf-8?B?NEhhdnhpaHZEVm1Md3gvczFsRzBqbUZ5OTlobktKM3J3a3RuWCtJbFNROW9V?=
 =?utf-8?B?U2ljNEhUdHFDanFtSTU1UTlaL1UwajYxQ3hDdUlMQld5S2NCeFI3NGhORjZU?=
 =?utf-8?B?TVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fdb660f-7f3d-46a9-01ce-08db50086c3b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 21:08:51.1256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tbScDIJ6LNWoO/JaX2S/OWLhZiAL7J90sbvVj85iqTznmNtmsWVZ3wGUuGjaNsjLRQvlANViVUCv4yUjgIDpXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5011
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v3 06/11] drm/xe: Introduce guc_submit_types.h
 with relevant structs.
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

These structs and definitions are only used for the guc_submit
and they were added specifically for the parallel submission.

While doing that also delete the unused struct guc_wq_item.

v2: checkpatch fixes.

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_fwif.h         | 29 -----------
 drivers/gpu/drm/xe/xe_guc_submit.c       | 42 +++++-----------
 drivers/gpu/drm/xe/xe_guc_submit_types.h | 64 ++++++++++++++++++++++++
 3 files changed, 76 insertions(+), 59 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_submit_types.h

diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index 20155ba4ef07..27d132ce2087 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -46,35 +46,6 @@
 #define GUC_MAX_ENGINE_CLASSES		16
 #define GUC_MAX_INSTANCES_PER_CLASS	32
 
-/* Work item for submitting workloads into work queue of GuC. */
-#define WQ_STATUS_ACTIVE		1
-#define WQ_STATUS_SUSPENDED		2
-#define WQ_STATUS_CMD_ERROR		3
-#define WQ_STATUS_ENGINE_ID_NOT_USED	4
-#define WQ_STATUS_SUSPENDED_FROM_RESET	5
-#define WQ_TYPE_NOOP			0x4
-#define WQ_TYPE_MULTI_LRC		0x5
-#define WQ_TYPE_MASK			GENMASK(7, 0)
-#define WQ_LEN_MASK			GENMASK(26, 16)
-
-#define WQ_GUC_ID_MASK			GENMASK(15, 0)
-#define WQ_RING_TAIL_MASK		GENMASK(28, 18)
-
-struct guc_wq_item {
-	u32 header;
-	u32 context_desc;
-	u32 submit_element_info;
-	u32 fence_id;
-} __packed;
-
-struct guc_sched_wq_desc {
-	u32 head;
-	u32 tail;
-	u32 error_offset;
-	u32 wq_status;
-	u32 reserved[28];
-} __packed;
-
 /* Helper for context registration H2G */
 struct guc_ctxt_registration_info {
 	u32 flags;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 9e2950f1fd0d..250e56ee2e75 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -22,6 +22,7 @@
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_engine_types.h"
+#include "xe_guc_submit_types.h"
 #include "xe_hw_engine.h"
 #include "xe_hw_fence.h"
 #include "xe_lrc.h"
@@ -378,32 +379,12 @@ static void set_min_preemption_timeout(struct xe_guc *guc, struct xe_engine *e)
 		       __guc_engine_policy_action_size(&policy), 0, 0);
 }
 
-#define PARALLEL_SCRATCH_SIZE	2048
-#define WQ_SIZE			(PARALLEL_SCRATCH_SIZE / 2)
-#define WQ_OFFSET		(PARALLEL_SCRATCH_SIZE - WQ_SIZE)
-#define CACHELINE_BYTES		64
-
-struct sync_semaphore {
-	u32 semaphore;
-	u8 unused[CACHELINE_BYTES - sizeof(u32)];
-};
-
-struct parallel_scratch {
-	struct guc_sched_wq_desc wq_desc;
-
-	struct sync_semaphore go;
-	struct sync_semaphore join[XE_HW_ENGINE_MAX_INSTANCE];
-
-	u8 unused[WQ_OFFSET - sizeof(struct guc_sched_wq_desc) -
-		sizeof(struct sync_semaphore) * (XE_HW_ENGINE_MAX_INSTANCE + 1)];
-
-	u32 wq[WQ_SIZE / sizeof(u32)];
-};
-
 #define parallel_read(xe_, map_, field_) \
-	xe_map_rd_field(xe_, &map_, 0, struct parallel_scratch, field_)
+	xe_map_rd_field(xe_, &map_, 0, struct guc_submit_parallel_scratch, \
+			field_)
 #define parallel_write(xe_, map_, field_, val_) \
-	xe_map_wr_field(xe_, &map_, 0, struct parallel_scratch, field_, val_)
+	xe_map_wr_field(xe_, &map_, 0, struct guc_submit_parallel_scratch, \
+			field_, val_)
 
 static void __register_mlrc_engine(struct xe_guc *guc,
 				   struct xe_engine *e,
@@ -486,13 +467,13 @@ static void register_engine(struct xe_engine *e)
 		struct iosys_map map = xe_lrc_parallel_map(lrc);
 
 		info.wq_desc_lo = lower_32_bits(ggtt_addr +
-			offsetof(struct parallel_scratch, wq_desc));
+			offsetof(struct guc_submit_parallel_scratch, wq_desc));
 		info.wq_desc_hi = upper_32_bits(ggtt_addr +
-			offsetof(struct parallel_scratch, wq_desc));
+			offsetof(struct guc_submit_parallel_scratch, wq_desc));
 		info.wq_base_lo = lower_32_bits(ggtt_addr +
-			offsetof(struct parallel_scratch, wq[0]));
+			offsetof(struct guc_submit_parallel_scratch, wq[0]));
 		info.wq_base_hi = upper_32_bits(ggtt_addr +
-			offsetof(struct parallel_scratch, wq[0]));
+			offsetof(struct guc_submit_parallel_scratch, wq[0]));
 		info.wq_size = WQ_SIZE;
 
 		e->guc->wqi_head = 0;
@@ -594,8 +575,8 @@ static void wq_item_append(struct xe_engine *e)
 
 	XE_BUG_ON(i != wqi_size / sizeof(u32));
 
-	iosys_map_incr(&map, offsetof(struct parallel_scratch,
-					wq[e->guc->wqi_tail / sizeof(u32)]));
+	iosys_map_incr(&map, offsetof(struct guc_submit_parallel_scratch,
+				      wq[e->guc->wqi_tail / sizeof(u32)]));
 	xe_map_memcpy_to(xe, &map, 0, wqi, wqi_size);
 	e->guc->wqi_tail += wqi_size;
 	XE_BUG_ON(e->guc->wqi_tail > WQ_SIZE);
@@ -1674,6 +1655,7 @@ static void guc_engine_print(struct xe_engine *e, struct drm_printer *p)
 		guc_engine_wq_print(e, p);
 
 	spin_lock(&sched->job_list_lock);
+
 	list_for_each_entry(job, &sched->pending_list, drm.list)
 		drm_printf(p, "\tJob: seqno=%d, fence=%d, finished=%d\n",
 			   xe_sched_job_seqno(job),
diff --git a/drivers/gpu/drm/xe/xe_guc_submit_types.h b/drivers/gpu/drm/xe/xe_guc_submit_types.h
new file mode 100644
index 000000000000..d23759959be9
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_submit_types.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_GUC_SUBMIT_TYPES_H_
+#define _XE_GUC_SUBMIT_TYPES_H_
+
+#include "xe_hw_engine_types.h"
+
+/* Work item for submitting workloads into work queue of GuC. */
+#define WQ_STATUS_ACTIVE		1
+#define WQ_STATUS_SUSPENDED		2
+#define WQ_STATUS_CMD_ERROR		3
+#define WQ_STATUS_ENGINE_ID_NOT_USED	4
+#define WQ_STATUS_SUSPENDED_FROM_RESET	5
+#define WQ_TYPE_NOOP			0x4
+#define WQ_TYPE_MULTI_LRC		0x5
+#define WQ_TYPE_MASK			GENMASK(7, 0)
+#define WQ_LEN_MASK			GENMASK(26, 16)
+
+#define WQ_GUC_ID_MASK			GENMASK(15, 0)
+#define WQ_RING_TAIL_MASK		GENMASK(28, 18)
+
+#define PARALLEL_SCRATCH_SIZE	2048
+#define WQ_SIZE			(PARALLEL_SCRATCH_SIZE / 2)
+#define WQ_OFFSET		(PARALLEL_SCRATCH_SIZE - WQ_SIZE)
+#define CACHELINE_BYTES		64
+
+struct guc_sched_wq_desc {
+	u32 head;
+	u32 tail;
+	u32 error_offset;
+	u32 wq_status;
+	u32 reserved[28];
+} __packed;
+
+struct sync_semaphore {
+	u32 semaphore;
+	u8 unused[CACHELINE_BYTES - sizeof(u32)];
+};
+
+/**
+ * Struct guc_submit_parallel_scratch - A scratch shared mapped buffer.
+ */
+struct guc_submit_parallel_scratch {
+	/** @wq_desc: Guc scheduler workqueue descriptor */
+	struct guc_sched_wq_desc wq_desc;
+
+	/** @go: Go Semaphore */
+	struct sync_semaphore go;
+	/** @join: Joined semaphore for the relevant hw engine instances */
+	struct sync_semaphore join[XE_HW_ENGINE_MAX_INSTANCE];
+
+	/** @unused: Unused/Reserved memory space */
+	u8 unused[WQ_OFFSET - sizeof(struct guc_sched_wq_desc) -
+		  sizeof(struct sync_semaphore) *
+		  (XE_HW_ENGINE_MAX_INSTANCE + 1)];
+
+	/** @wq: Workqueue info */
+	u32 wq[WQ_SIZE / sizeof(u32)];
+};
+
+#endif
-- 
2.39.2

