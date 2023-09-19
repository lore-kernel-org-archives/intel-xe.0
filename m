Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 467EACD5BCB
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 14:26:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D9110E292;
	Tue, 19 Sep 2023 14:26:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC20810E28D;
 Tue, 19 Sep 2023 14:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695133563; x=1726669563;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Cf3Umxzvi4e6qjGHQ9kxXg7S1O30hQH9HHEGrN+XjBE=;
 b=ZVXT3VZ1UOvqcGl8GKZvCcqaCcXG6fxSL4jldcoRj1DwYWivxGz+8B2K
 /VG7qGf4DI6JYOnhPAWgFrFJe/Lns2sCWqL7Ulf9gmysvLA+yXOsbZvnq
 ma1gyAH15gCAl9hqu78N+kI+3V3LppKSHgT4akSGa8ry13AvaWaMUEwgH
 oqitvU+tJkgUjkL8hOdhSQHRi9mNmIYK5sVpVY0ogdJ2/31aYk8Zy9hZv
 QziLc3C+Ht6GoYODEk6der3m+SRENQsKnE5E2pO2dLl84+iey5ixcf8QU
 cvPC7K0Yjhw6ZPF1qKL+MmSmlRUxIsiv/flkrRVCRzB6PUubPOd+cRJUQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="466278711"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="466278711"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 07:26:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="695924354"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="695924354"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 07:26:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 07:26:03 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RiVBTJH9M7VLAPXx7E3bKFHCbch1rsjBXSrgBhYVkH7fulrGI4zbYFOPUsl3328NusrSIRpaZa9hI1Gkk2CmdBMqH4rghcXMwcw3DWiDeWf4VmxDLwHCkNLfShxBDFaoajTdDFjwGSZcgFw9FINN09i7zs20a3v31F4OmzqhEVWvp4WoPRpSMoD4CFSJJgKMHmzUtGZiSKYnm8YQy8Q4VRmEESAPULSW2Drc7Ax7JPsyK+m+aPoyZL02uBe5HhFUe6e7A4hdsTQAWfX22PwdflXRH6djctAxW+gtOS2rhcGNlhh3SVDNBQCi3fE9Sh2tE+ES5fVZSOd2A2pQ42qufw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZtQtPcZIG/Pl4eUrUCojQicu8dOZ3y0MwhQtjZJAsB8=;
 b=XpSLVKLOLdDGoPC/tlbMOPnreg2Ygi6qzHqr4xXAWyQndbW96Yab1FEsQI8LBFyNjUclBSO4075D6EDtJlrogLkLaRfBu4lJJ3p3+VSnSIXmx9/93nw6wcAfpA4uDWhuiREv59j3iIBdQtaUxfh+cBS1w+FFRc+brkOORM1+whuL86p3zz1Wk+Xx81ZTwhWNDZLYyJSr7FeIN94g7QYM8T71fDTmOOqdbJ46omNQkn3u1Gs/r8YM4GeM1gtQQeenIH6efesLPLmqMuY4icvHyCQDGwy4TzDkFAAHx/zjZQQSf73ThnWzwjICnU+OxoSAyHp7XexT/0An17SijF/KnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO6PR11MB5585.namprd11.prod.outlook.com (2603:10b6:5:356::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Tue, 19 Sep
 2023 14:25:55 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Tue, 19 Sep 2023
 14:25:55 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <igt-dev@lists.freedesktop.org>
Date: Tue, 19 Sep 2023 10:19:50 -0400
Message-ID: <20230919142000.91363-8-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919142000.91363-1-rodrigo.vivi@intel.com>
References: <20230919142000.91363-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0097.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::38) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO6PR11MB5585:EE_
X-MS-Office365-Filtering-Correlation-Id: 713aca99-3c36-4bfb-1058-08dbb91c5580
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fjsS2TSBlQqJQLBnxQz03VI2OPO1KRlkp3f00VVnNe4KVXThWF70azu3sWmWl3PSE833b/4nSXbAiWAogGmmOrPhC0iSFR1BCtLmFkvKj12RwiCyOjyD9XxZyEu7qwoMIc9c7KvBPg6710sYrp9k/vHCLsvpEIATlHeM7b3gEotWobJlPiyP3FVLTtKhwWMTIVUvUDzrNu6r0Oc3+jDOveweVSdY2X+VzmUxoPGLGprK0MlrY2tAJ7MMJNz+DLhR411Qu4eumWIDqqQ8hsVqml5HPkT28DZsbdPM6pUcHn+bJWMRgGQn2KYlP0yS6kNqBEQe8L2gKPF6posZ2tl+UP6QgTiwxHypjHBPU2TgFOCHQ4VILOZvw3ETQhzbsWj48Bt4+UtAIwcR+WGJUyQ0qdzxgKtkCybazvTIjQYFRO+R11FoiNhhYDwIm0RXmVv6jhH++UcrFmcVgXERUOWJ0XAYVHdqytMFHVMmfUW3fmSKgVJAIKkR6OJauGBScJIhvoSskN3DfjclYEDuYwwmuXXWFVilGEYmfaHVW4oAXn15hfV+hYP2XhnhbcIVYwY7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(396003)(39860400002)(346002)(376002)(451199024)(1800799009)(186009)(36756003)(44832011)(5660300002)(83380400001)(86362001)(15650500001)(4326008)(8936002)(8676002)(41300700001)(450100002)(6506007)(6486002)(6666004)(82960400001)(107886003)(26005)(1076003)(2616005)(6512007)(66946007)(478600001)(2906002)(38100700002)(316002)(66476007)(66556008)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rl2IqoSb7uunYNxRYvYieBmGRvE8wNW+XhsJH36dGGKTxIyPs8T0dDY5dUf0?=
 =?us-ascii?Q?smCmWbRfol/qIsSKTFyaN12ljDiVXxfjLzS/w+6p9wLmJfW6bRYjhwdmHB5k?=
 =?us-ascii?Q?uTnVerzdcxR4wfMY+MwbDr28J00q6QRp1WTXgEkfIFxgUxDWFwDCGsnMzjDv?=
 =?us-ascii?Q?Oyl0wDxYOzk8hOmEBk9nETvSnFlE51smuJ/THjfY7qvSgty5FU752H7qfAZf?=
 =?us-ascii?Q?aiON9b/QoLscmk8Xte5WFV6f8bSbw5uCRLBXjp9tLJVc1MIFoSTWhO6UfX4F?=
 =?us-ascii?Q?ylNxbHJWGPcVeGKC9oUbA63xVSPZc1d0ygbnh8pkIMtxcoRWMPCY7Q2diH6e?=
 =?us-ascii?Q?hKhwTf/RMpwfaZS90kJNurwLwQaoP/c3Ox9eI9MowAQQoHI4GRHg8tIzJqNe?=
 =?us-ascii?Q?ZAHkqUMwP9S+YDJOHwr//qkbWkzYQY0nLtG//9tOFc2UVXDyzpDP80+HHBav?=
 =?us-ascii?Q?irfQf6zZE0KKiZR+dSuwAU782oQdk3RehrsUr8ARg77PBzBP+rUHxSxvxoC6?=
 =?us-ascii?Q?eSq+B9UyZANyZmc9neJoRYxHtXVkQ8u01Oux1lupegl6C9Flmpy2eAIushXJ?=
 =?us-ascii?Q?DjMfWeBWJuv7Rs0B7kc7Lbh503qXJlZepH6QhwRY+BaS1Bum9QVIsadYRq6K?=
 =?us-ascii?Q?TAnJPVvZIsT4LzEFEZ4f1J0KUaiXS0cq7TgN/RxUSpMh/NW7BojC4ioMVM/A?=
 =?us-ascii?Q?L7lPhNhTuiUFPIESWLjlaBM/+oLKw1rLVirWnwi7MH784hiEk/WgsTMm+6xZ?=
 =?us-ascii?Q?91EyqsM0CvyirfGLXDvGScFkBVpzih+n4TSNw6oRqG+Rlwo+91skp1BWE5Qc?=
 =?us-ascii?Q?skBZqkiAxBRnegsBE6oHEgosIhu84waDVB5CAL/Fel8uaDjOFDrdFuZN3YEN?=
 =?us-ascii?Q?hJ2XO8wyTtN0CxopOFic3iEzQbF5uaWz78QFk9U1q/AklD6ihSzHh8x/N2Jy?=
 =?us-ascii?Q?URCLUCbJ0zVW6A1+Jyby2FlYmQSOh45HroR2e12BM0sqBxv3QnLgZac9OMjE?=
 =?us-ascii?Q?gX80wm969NZoK2bo0gmFtdCgnetwOBOqwcREbDFio+8jIaY0wC7857kNGjaH?=
 =?us-ascii?Q?CtkoHJgcXGTSlNq/Lm5/nTkEEAMT9L9OWB9ZnT0hNk1+wZN5BnF/vBI1lWkw?=
 =?us-ascii?Q?Uw2qYa1W/VfA3Z72+LczMWgPGemTYVKfEPPxvt7b5uW/otbYkPSFn/aKsvSs?=
 =?us-ascii?Q?Ci0nlUglxlx6rQoQwMLq5ocISStPsC6iLNLkjjYI01Zh9XYncdPB9Qg5PZzo?=
 =?us-ascii?Q?/P8TPy4vKLMG4WIvSVLYSUIZ7L6vWzXmHxWa2Mh4wOU71IhT83zCDW1qfjUb?=
 =?us-ascii?Q?o1z+83bWRsBHTgcYYnMLlOXoogT/1OjumLxAzyEdIg3DOC3/pcQuPSVtyLur?=
 =?us-ascii?Q?nvbFdIhzUp/jfooXu13wDZx71Qnnnct8dEok4brcTicDBteu/zvrD4r45GDt?=
 =?us-ascii?Q?oaIPnLooocxiLlDW4xj9r98xfqFZN52o8wy/j0MfIpSH7DeMQ6eCmgFmoV37?=
 =?us-ascii?Q?ShHsu0Df35zVKtud0IOZ1Cl29w1jpHL5tnCAuZ25U0rKgL5LhRsw+2CYnxRh?=
 =?us-ascii?Q?lSjfiengljp1bbGj0GEq+UtgDBYunnn1RWQMiecCbiXI7vdZ7WkAnxlzN4YU?=
 =?us-ascii?Q?6w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 713aca99-3c36-4bfb-1058-08dbb91c5580
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 14:25:55.0035 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qocw0hNtrFUGLAyISc9kuAs8MCpyPXVA8ReFv260nsuYZv3FJRURltQQ58hcIHdcjV1J8sdw5if8W0kqerLr3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5585
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH i-g-t 07/16] xe: Update uAPI and remove
 XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE has been removed from uAPI,
remove all references in Xe tests.

Align with commits
 ("drm/xe: Remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from uAPI") and
("drm/xe: Deprecate XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE implementation")

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
[Rodrigo updated header with built version from make header_install]
[Rodrigo added the commit subjects of the kernel uapi changes]
---
 include/drm-uapi/xe_drm.h          | 21 +++++++--------------
 tests/intel/xe_evict.c             | 14 +++-----------
 tests/intel/xe_exec_balancer.c     |  8 +-------
 tests/intel/xe_exec_compute_mode.c | 20 ++------------------
 tests/intel/xe_exec_reset.c        | 10 ++--------
 tests/intel/xe_exec_threads.c      | 13 ++-----------
 tests/intel/xe_noexec_ping_pong.c  | 10 +---------
 7 files changed, 18 insertions(+), 78 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 1d869f5e8..a9060bcf8 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -784,21 +784,14 @@ struct drm_xe_exec_queue_set_property {
 	/** @exec_queue_id: Exec queue ID */
 	__u32 exec_queue_id;
 
-#define XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY			0
+#define XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
 #define XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
 #define XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
-	/*
-	 * Long running or ULLS engine mode. DMA fences not allowed in this
-	 * mode. Must match the value of DRM_XE_VM_CREATE_COMPUTE_MODE, serves
-	 * as a sanity check the UMD knows what it is doing. Can only be set at
-	 * engine create time.
-	 */
-#define XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE		3
-#define XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		4
-#define XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		5
-#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		6
-#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		7
-#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY		8
+#define XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		3
+#define XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		4
+#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		5
+#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		6
+#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY	7
 	/** @property: property to set */
 	__u32 property;
 
@@ -1092,7 +1085,7 @@ struct drm_xe_vm_madvise {
 };
 
 /**
- * XE PMU event config IDs
+ * DOC: XE PMU event config IDs
  *
  * Check 'man perf_event_open' to use these ID's in 'struct perf_event_attr'
  * as part of perf_event_open syscall to read a particular event.
diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index 5b64e56b4..5d8981f8d 100644
--- a/tests/intel/xe_evict.c
+++ b/tests/intel/xe_evict.c
@@ -252,19 +252,11 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
 	}
 
 	for (i = 0; i < n_exec_queues; i++) {
-		struct drm_xe_ext_exec_queue_set_property ext = {
-			.base.next_extension = 0,
-			.base.name = XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
-			.property = XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE,
-			.value = 1,
-		};
-
 		if (flags & MULTI_VM)
-			exec_queues[i] = xe_exec_queue_create(fd, i & 1 ? vm2 : vm, eci,
-						      to_user_pointer(&ext));
+			exec_queues[i] = xe_exec_queue_create(fd, i & 1 ? vm2 :
+							      vm, eci, 0);
 		else
-			exec_queues[i] = xe_exec_queue_create(fd, vm, eci,
-						      to_user_pointer(&ext));
+			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
 	}
 
 	for (i = 0; i < n_execs; i++) {
diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
index a4a438db7..f4f5440f4 100644
--- a/tests/intel/xe_exec_balancer.c
+++ b/tests/intel/xe_exec_balancer.c
@@ -458,18 +458,12 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	memset(data, 0, bo_size);
 
 	for (i = 0; i < n_exec_queues; i++) {
-		struct drm_xe_ext_exec_queue_set_property ext = {
-			.base.next_extension = 0,
-			.base.name = XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
-			.property = XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE,
-			.value = 1,
-		};
 		struct drm_xe_exec_queue_create create = {
 			.vm_id = vm,
 			.width = flags & PARALLEL ? num_placements : 1,
 			.num_placements = flags & PARALLEL ? 1 : num_placements,
 			.instances = to_user_pointer(eci),
-			.extensions = to_user_pointer(&ext),
+			.extensions = 0,
 		};
 
 		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE,
diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index 6d1084727..02e7ef201 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -120,15 +120,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 			xe_get_default_alignment(fd));
 
 	for (i = 0; (flags & EXEC_QUEUE_EARLY) && i < n_exec_queues; i++) {
-		struct drm_xe_ext_exec_queue_set_property ext = {
-			.base.next_extension = 0,
-			.base.name = XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
-			.property = XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE,
-			.value = 1,
-		};
-
-		exec_queues[i] = xe_exec_queue_create(fd, vm, eci,
-					      to_user_pointer(&ext));
+		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
 		if (flags & BIND_EXECQUEUE)
 			bind_exec_queues[i] =
 				xe_bind_exec_queue_create(fd, vm, 0);
@@ -156,15 +148,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	memset(data, 0, bo_size);
 
 	for (i = 0; !(flags & EXEC_QUEUE_EARLY) && i < n_exec_queues; i++) {
-		struct drm_xe_ext_exec_queue_set_property ext = {
-			.base.next_extension = 0,
-			.base.name = XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
-			.property = XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE,
-			.value = 1,
-		};
-
-		exec_queues[i] = xe_exec_queue_create(fd, vm, eci,
-					      to_user_pointer(&ext));
+		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
 		if (flags & BIND_EXECQUEUE)
 			bind_exec_queues[i] =
 				xe_bind_exec_queue_create(fd, vm, 0);
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 6e3f0aa4b..68e17cc98 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -540,14 +540,8 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	memset(data, 0, bo_size);
 
 	for (i = 0; i < n_exec_queues; i++) {
-		struct drm_xe_ext_exec_queue_set_property compute = {
-			.base.next_extension = 0,
-			.base.name = XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
-			.property = XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE,
-			.value = 1,
-		};
 		struct drm_xe_ext_exec_queue_set_property preempt_timeout = {
-			.base.next_extension = to_user_pointer(&compute),
+			.base.next_extension = 0,
 			.base.name = XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
 			.property = XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT,
 			.value = 1000,
@@ -557,7 +551,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 		if (flags & EXEC_QUEUE_RESET)
 			ext = to_user_pointer(&preempt_timeout);
 		else
-			ext = to_user_pointer(&compute);
+			ext = 0;
 
 		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
 	};
diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index d19708f80..306d8113d 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -313,17 +313,8 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 	}
 	memset(data, 0, bo_size);
 
-	for (i = 0; i < n_exec_queues; i++) {
-		struct drm_xe_ext_exec_queue_set_property ext = {
-			.base.next_extension = 0,
-			.base.name = XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
-			.property = XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE,
-			.value = 1,
-		};
-
-		exec_queues[i] = xe_exec_queue_create(fd, vm, eci,
-					      to_user_pointer(&ext));
-	};
+	for (i = 0; i < n_exec_queues; i++)
+		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
 
 	pthread_barrier_wait(&barrier);
 
diff --git a/tests/intel/xe_noexec_ping_pong.c b/tests/intel/xe_noexec_ping_pong.c
index 3f486adf9..88b22ed11 100644
--- a/tests/intel/xe_noexec_ping_pong.c
+++ b/tests/intel/xe_noexec_ping_pong.c
@@ -64,13 +64,6 @@ static void test_ping_pong(int fd, struct drm_xe_engine_class_instance *eci)
 	 * stats.
 	 */
 	for (i = 0; i < NUM_VMS; ++i) {
-		struct drm_xe_ext_exec_queue_set_property ext = {
-			.base.next_extension = 0,
-			.base.name = XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
-			.property = XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE,
-			.value = 1,
-		};
-
 		vm[i] = xe_vm_create(fd, DRM_XE_VM_CREATE_COMPUTE_MODE, 0);
 		for (j = 0; j < NUM_BOS; ++j) {
 			igt_debug("Creating bo size %lu for vm %u\n",
@@ -82,8 +75,7 @@ static void test_ping_pong(int fd, struct drm_xe_engine_class_instance *eci)
 			xe_vm_bind(fd, vm[i], bo[i][j], 0, 0x40000 + j*bo_size,
 				   bo_size, NULL, 0);
 		}
-		exec_queues[i] = xe_exec_queue_create(fd, vm[i], eci,
-					      to_user_pointer(&ext));
+		exec_queues[i] = xe_exec_queue_create(fd, vm[i], eci, 0);
 	}
 
 	igt_info("Now sleeping for %ds.\n", SECONDS_TO_WAIT);
-- 
2.41.0

