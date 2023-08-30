Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7906C6FA8F
	for <intel-xe@archiver.kernel.org>; Wed, 30 Aug 2023 21:47:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D13010E600;
	Wed, 30 Aug 2023 21:47:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 681CD10E600
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Aug 2023 21:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693432051; x=1724968051;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=paikYpEUiy28BH86AIXw5I2uyekBgAtH8omaRTa2x2g=;
 b=c35iCzpLOO0KW7v4kfXh3Npg5+gy0Xelh3tjbrvgnxOEU34SvGtX7eub
 BrHNwr7WRH6V4904w4k3bwEM7xpn/oE1lycPwaguHVqEJsWjeQ3+AApch
 +HNMFC11Tx3ktMTkF2UatK1+bzXw58F5Cvxju91zJo0esH748K3y5hfBI
 pYb4Rg8HX7+KyHEUHCBQjKMI4TeDcL0ilHC6FOADDmYDNtdyzHlT5mzwf
 xHWfJxtO1JycMlExjTSL6FvaVu8FSp5KFxREd3GvHHcV7orpczLUKX05e
 78QX6EU2DKD6CtV7eI+zXYSmTq9dIuDZ2mMfsVey5abRXS2BGOGFgkDnG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="406748789"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; d="scan'208";a="406748789"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 14:47:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="768553688"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; d="scan'208";a="768553688"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 30 Aug 2023 14:47:26 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 30 Aug 2023 14:47:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 30 Aug 2023 14:47:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 30 Aug 2023 14:47:24 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 30 Aug 2023 14:47:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UdCNA3N99a0KnbGC7SqUECBSYR0/iDzbqD9QvrxSOGXkj9RKvaVgR6Dzl6PMEX/EwwGAoWGGu9+s62yuTatIlq5HYz39YJF1jHgFL86ph34cnmTuJk5ersp5CXIaYh7GutxAZ59kcy+boGEL2DUXJVYQAUHbmsM2sXLYVMoxrbKLwnODx4sgLSGB9K6cFWKkaPHwvNcw/VrcZcR1m3LL82XZHu1GQrhyWYLPcti/TcX4qS71sU7ZA/nkjqG7Vya6BadQYsqCXhrsmxj7ALEX1TnA6IuoMb+EH9bp63eb+j6kDDaBXikV27XlcS63sN4osqzq9uPjbRDnKAefDGZ5/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ojamhx+gDOTmOpfFK6VQeHNiw5/Jf6mKxBbuj19fnJI=;
 b=V5yIXTEm4aSiOLJwdK0vWcyRzsWfU3bHnvN4/+8pHdoY1qYm06+hDye33ccRn1BiuWVasN4S6CbZOnSfMkFEjr11guQqSulj1ok71MbmULODOmoWGnl6HEQmjvfhxrjCiZAmeCZSEFlrhF4Y2jYu3Dh8d6wpB5DiJHm1Cexhw2uZEQCfQ+69fQ2NusaOmFvF0tURHHPptiRSY1ymGa/Tq5p5qO/+s/hpUGxbAbVBoxdT+Tpn0WjDHcNVzo8rPEBhS4dzGrqk8f+53DwmCy4B7xj6pMjRU/9xmWL9qtnJRVAncU4F0hOm7n5EfEQF3RdksbbL1qN+Q/ptEGq05ULPfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW3PR11MB4714.namprd11.prod.outlook.com (2603:10b6:303:5d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Wed, 30 Aug
 2023 21:47:22 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.020; Wed, 30 Aug 2023
 21:47:22 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 30 Aug 2023 17:47:14 -0400
Message-ID: <20230830214715.113435-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0106.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::47) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW3PR11MB4714:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d1308f3-c39c-4fb3-35a3-08dba9a2b0c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t4Z6iU+Erxtg5y7rGjizgVTuC01uz/MYcZAIQreY066+ymPkUZWSAkSZFNiL76Glil9oBWgS6YbYr0SjFzzIhQQGDHX3E6h+u5K2WUbFnma5+RVadGuhlPSUHVokyeNY3oSIC7yzDrbcF0xZFHaZPENlsX8eifQx4IfzsjY2wcvtS9w3CA0shILbSs0hgSSD7YxwYSt6sCg9kC+NBx1a1rMD/KYOw0Y66nUzuXzzYwxGvItB+RpoWBJi8SyuY2FvQG7uo9/MV1t6p2UO4QC0b2fOWD1YQeQs9KU6Mx5bkerWFJ+3V14puLcUfvwPGKN7DMO82nmI2qPgEaxvfeBUdtvGPTCAUVlMvT5ESRvwZtgJQwb5VhB9qs7gh5vTJdBZNLNqfqUhtRvZQ9ek2grgESUpkFaa8A+fzaO7dc546aOSA10/O/MGHOOZ9TNB0GzApS7x6WhlIVelwu3Mz65ruAvMEtcRXADt+BKneir1Vtd+6hYac8D7aWKilOCOTvytoj2fbpwIXQ73QsUskFuijlddwlukcmbCrjUnNW5uE3g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(39860400002)(136003)(376002)(366004)(186009)(451199024)(1800799009)(36756003)(83380400001)(4326008)(44832011)(41300700001)(86362001)(5660300002)(8936002)(8676002)(1076003)(26005)(6506007)(6666004)(6486002)(2616005)(6512007)(966005)(478600001)(38100700002)(66946007)(66556008)(66476007)(54906003)(82960400001)(6916009)(316002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0FkRVYzTkRycG5YZlFMUzlHZ3F4bHY5Rzg4UGg3WC80bDVZVldTSlRWSFlx?=
 =?utf-8?B?U1RuZlhRdWJwL3ZxU25ONkl6Z2p0UlF2QURwOURyR1g1Q29wWk8vd1gvdTlY?=
 =?utf-8?B?R0xRZDdGOGd6RmdEbVVHT1dZSnFSckMxZVhUWXlYZ1g3aDdSWE9uSGtLM1o4?=
 =?utf-8?B?c1U4bzdyYW9tWURHYUExNjc0a2ZQQ1p4WnN2VlpUNFN4UVVpN0w1eU5NdEY1?=
 =?utf-8?B?Q2tLQzFUYnBHU0JEMGVMY3VtT1E0VXZaWEJ3NVJVUUhIbjQ2a2JBb0l0UmQ1?=
 =?utf-8?B?R3dYTW5IOXlwVEpwTHViL0VPenJaeXFJSHBuZzYyWmNJVFhDcGpzY2pSL25h?=
 =?utf-8?B?MGl3UnhqSDlncm1WZm91ZUl3VUEvb21qNktLVmk4V2xNOEI5S0loMk02Mncv?=
 =?utf-8?B?VXp1WlAyeThIRlkrRXhweXhPY3ZlNm95Sy9VSHF5NWsxQUp6QzN3V0x5OW9z?=
 =?utf-8?B?emxtakg4ZXp4TG5Xd2RFMlhtbUNTSDhWRUN2TEhFU3AzNEFvaGlOOUNjUXNW?=
 =?utf-8?B?c1A5RitWU2tPeHYwc2VzZVRZZG43NXM1TVJUNDcrckFPV09TVzZCSzVyTllD?=
 =?utf-8?B?L3FEWmdZTVY4Z1Rnc1VER0VUQkxsU2VWbDc3V2dSSngwaS8xQTBEbUlrbUJW?=
 =?utf-8?B?M0tLQTdYai9ZV1Z6d3NHYzZ2YTBabGZzbHVTYUpVS1lyalJzMEsycmNxNVd3?=
 =?utf-8?B?RlZsc1FsSkZBL0FVN0ZrNFBheHRJTklzZGtLbUh5RXVSVHNlT09WVVg2WjJx?=
 =?utf-8?B?Q1pUc2V3Y1NTTzlnaldIcFN2aTU5QTBhYnFVU1lXdmJTY09CU0w2VTZKdDlH?=
 =?utf-8?B?eWRCR3hjUDlXY3ppNERWZkY0WHpQTVNEM1dhRE82TEdCNzJLdElJS3kxQ2NO?=
 =?utf-8?B?SVZLUldWb1dsSytYVWd4V1dpWXorNGhONkNPazg0TjJ4ZU5GYnhWd3d5VXVq?=
 =?utf-8?B?ZEI2V1dvV1RSYUhqd1Z3dXJ5ZlV6T1BkNG5KUGs3Z2NXbUhqeFpBcGtZV2ZZ?=
 =?utf-8?B?TG8vbS8rQWNLOHArOWxVWjFqTUMrNjl2Qys2VVp3Y0hZQUJMR1Uzd295VGxE?=
 =?utf-8?B?dHBnb2E0eEFzQzg0TlB0V0gzVEd2aWxTYTFvNWhsRHppMlBjYjIvcjR6SS9t?=
 =?utf-8?B?VFFsci9rT0c4RjZGS0JieHdaeFRRUW9hZHVpQW04TFRrNHcyS25rRzJNUkhX?=
 =?utf-8?B?QS9GckVrRDVjWElGRHBJM25ZZFlBNXEycFUrSTFmM2piV2oxQ1BWRnB6Q2JC?=
 =?utf-8?B?dURSNFlWVXlNSlY5S1g1cVhNMWN0N3NtblJzT3B6YXoxditkcVRSUGVkNVEr?=
 =?utf-8?B?NUFFQ00yM1RON29RQjNWeUQ1bmxhUDJIaGMrVVNpdWpudlR2L3BVVHprRHBW?=
 =?utf-8?B?dXl0NEJkcmd6MzB2Vm5tWjBOWmxYMW9naFk0cmoxNnJuTDJUd2w4KzJCdWt6?=
 =?utf-8?B?azBvOW1kdUhVbHRXUm9TUzA4NzRqM2U1eUkxSFNYSTJwSWZFczBhT0hCeTl5?=
 =?utf-8?B?ZzNnOUtkRVpVQitZT0J3Y3p1a1VrL1VmRHIzdUczaHd3OStmOEsrdEdrSG9R?=
 =?utf-8?B?R1ZDdVEvN0NOOE5waHRZWXI4ODdyMUJ6Ri84YWpqM1M1YlF6T0RuRzJFSUpL?=
 =?utf-8?B?UUsyTm9vTnFjU0FmOGNwem10eEF2bkhRNWZPRlUzR1laMlJLOWhNSEZ3cVU3?=
 =?utf-8?B?RjhVdktZZGl3VnZtZlkyOHE1YVZwaGN4R1JqYWM1ZVlkZnF2WERpMEdXdW9w?=
 =?utf-8?B?Y1dxemIrK0hCQzlyajVXako1d1ZvTStkT1ZYU1Y5MThCRVhYbGx3U1lBWXBP?=
 =?utf-8?B?b0MvWE9YYkwweWN5NGtNeGI4U3NYZ2w2K2M3WDl0NmNjb08xaHJQV250dmhr?=
 =?utf-8?B?UThkbTRwdE1BRkoyZEcxdExTNFRtNE5rbzEyN3pLYlQ0YWY3QmdoQWRTVXNp?=
 =?utf-8?B?VHZpbDNhK3pEaWl2NUtOMW5XVWpBWEdaTDhTUTNOd2V3N0xjc2graDQvZVc5?=
 =?utf-8?B?TWhaS05ySjQ3WnpXT242bUU1M1NKVWs2eC9Tak81TjUrSU5OSUJXdWJMa1A3?=
 =?utf-8?B?a3V4RGc5SllYZklKK0xPcm5TOGdZdWgrZElGb0hDQ3dOOEhYTm9qZzFNbUNV?=
 =?utf-8?B?VHU3S1ZONlh5L1huVVNTcURsVzZsT2xmbXZTMnRsc0xxSzJKaUlVMzlFL2pC?=
 =?utf-8?B?MVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d1308f3-c39c-4fb3-35a3-08dba9a2b0c1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 21:47:22.0792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XNOVpTyy7+e+Fz5M/LmRNuFcHF0EbfwiRbEuiP+NSGh5YO4JoBwqLb4mqHmfgT9WVqrZJYRmvybMSSbPIeWdWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4714
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 1/2] drm/xe/uapi: Typo lingo and other small
 backwards compatible fixes.
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

Fix typos, lingo and other small things identified during uapi
review.

v2: Also fix ALIGNMENT typo at xe_query.c

Link: https://lore.kernel.org/all/863bebd0c624d6fc2b38c0a06b63e468b4185128.camel@linux.intel.com/
Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c |  2 +-
 include/uapi/drm/xe_drm.h     | 23 ++++++++++++-----------
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 1db77a7c9039..c3d396904c7b 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -195,7 +195,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
 		config->info[XE_QUERY_CONFIG_FLAGS] =
 			XE_QUERY_CONFIG_FLAGS_HAS_VRAM;
-	config->info[XE_QUERY_CONFIG_MIN_ALIGNEMENT] =
+	config->info[XE_QUERY_CONFIG_MIN_ALIGNMENT] =
 		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
 	config->info[XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
 	config->info[XE_QUERY_CONFIG_GT_COUNT] = xe->info.gt_count;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 86f16d50e9cc..7c08bedbeeaf 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -256,7 +256,7 @@ struct drm_xe_query_config {
 #define XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
 #define XE_QUERY_CONFIG_FLAGS			1
 	#define XE_QUERY_CONFIG_FLAGS_HAS_VRAM		(0x1 << 0)
-#define XE_QUERY_CONFIG_MIN_ALIGNEMENT		2
+#define XE_QUERY_CONFIG_MIN_ALIGNMENT		2
 #define XE_QUERY_CONFIG_VA_BITS			3
 #define XE_QUERY_CONFIG_GT_COUNT		4
 #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
@@ -449,7 +449,6 @@ struct drm_xe_gem_create {
 	 * If a VM is specified, this BO must:
 	 *
 	 *  1. Only ever be bound to that VM.
-	 *
 	 *  2. Cannot be exported as a PRIME fd.
 	 */
 	__u32 vm_id;
@@ -489,7 +488,7 @@ struct drm_xe_gem_mmap_offset {
  * struct drm_xe_vm_bind_op_error_capture - format of VM bind op error capture
  */
 struct drm_xe_vm_bind_op_error_capture {
-	/** @error: errno that occured */
+	/** @error: errno that occurred */
 	__s32 error;
 
 	/** @op: operation that encounter an error */
@@ -609,7 +608,7 @@ struct drm_xe_vm_bind_op {
 	 * caused the error will be captured in drm_xe_vm_bind_op_error_capture.
 	 * Once the user sees the error (via a ufence +
 	 * XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS), it should free memory
-	 * via non-async unbinds, and then restart all queue'd async binds op via
+	 * via non-async unbinds, and then restart all queued async binds op via
 	 * XE_VM_BIND_OP_RESTART. Or alternatively the user should destroy the
 	 * VM.
 	 *
@@ -620,7 +619,7 @@ struct drm_xe_vm_bind_op {
 #define XE_VM_BIND_FLAG_ASYNC		(0x1 << 17)
 	/*
 	 * Valid on a faulting VM only, do the MAP operation immediately rather
-	 * than differing the MAP to the page fault handler.
+	 * than deferring the MAP to the page fault handler.
 	 */
 #define XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 18)
 	/*
@@ -727,7 +726,7 @@ struct drm_xe_exec_queue_set_property {
 #define XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		6
 #define XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		7
 #define XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY		8
-	/** @property: property to set */
+	/** @property: property to be set */
 	__u32 property;
 
 	/** @value: property value */
@@ -796,7 +795,7 @@ struct drm_xe_exec_queue_get_property {
 	__u32 exec_queue_id;
 
 #define XE_EXEC_QUEUE_GET_PROPERTY_BAN			0
-	/** @property: property to get */
+	/** @property: property to be gotten */
 	__u32 property;
 
 	/** @value: property value */
@@ -907,7 +906,7 @@ struct drm_xe_mmio {
 /**
  * struct drm_xe_wait_user_fence - wait user fence
  *
- * Wait on user fence, XE will wakeup on every HW engine interrupt in the
+ * Wait on user fence, XE will wake-up on every HW engine interrupt in the
  * instances list and check if user fence is complete::
  *
  *	(*addr & MASK) OP (VALUE & MASK)
@@ -1039,9 +1038,11 @@ struct drm_xe_vm_madvise {
 	 */
 #define DRM_XE_VM_MADVISE_PRIORITY		5
 #define		DRM_XE_VMA_PRIORITY_LOW		0
-#define		DRM_XE_VMA_PRIORITY_NORMAL	1	/* Default */
-#define		DRM_XE_VMA_PRIORITY_HIGH	2	/* Must be elevated user */
-	/* Pin the VMA in memory, must be elevated user */
+		/* Default */
+#define		DRM_XE_VMA_PRIORITY_NORMAL	1
+		/* Must be user with elevated privileges */
+#define		DRM_XE_VMA_PRIORITY_HIGH	2
+	/* Pin the VMA in memory, must be user with elevated privileges */
 #define DRM_XE_VM_MADVISE_PIN			6
 	/** @property: property to set */
 	__u32 property;
-- 
2.41.0

