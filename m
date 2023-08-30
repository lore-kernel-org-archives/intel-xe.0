Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2956C6FA8F
	for <intel-xe@archiver.kernel.org>; Wed, 30 Aug 2023 16:18:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF1B10E55A;
	Wed, 30 Aug 2023 16:18:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B89F910E55A
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Aug 2023 16:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693412302; x=1724948302;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=zbxeotWyhnN5f0Vs4P1q7NJi6BiKAzheNW10fvtDt90=;
 b=f+DVF5VfK6oEGgMqOwyjBRZElRcabhxteCnKyyo1M+9s2qIJ6V6AE5iM
 U+E+tCrrGwdiA2gxgEv62t454nKa7+3KDTQjxSDrHwS+WAqHbU+VTyolV
 gDlc2p89jBRe11kNBfxhIVCAus2THk+Dm7rXnwFeiYHPeMF3R5dSvDEWZ
 vEz0bFzYS5TPTyYK+8h+jrjev0biCql39vz7IcoJOMb/2qWAGYQbmW2BP
 7eXpipd0+X07y/ia4wSNwdSVAeke2jnUp350W5TxX0+cWDmLNN7QjUbMR
 QVnFxf23yVtDv6/WX58eBiXKUqRLDontZVo/JhlbCRWBIkxXhdPZEBt/r Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="360679703"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; d="scan'208";a="360679703"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 09:11:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="912881418"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; d="scan'208";a="912881418"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 30 Aug 2023 09:11:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 30 Aug 2023 09:11:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 30 Aug 2023 09:11:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 30 Aug 2023 09:11:35 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 30 Aug 2023 09:11:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nH/B0HSHjksCAfcFS62fziIMRXSOPKF7GSOSNuBk17vAJaPaiMLiC38dP9Yf8Gcjk3BiNjak9brh1hUPO+OlR1P9FjUENBQ0N2YVLaY2grGpg6+ueuVJRDEUvAuHAqyHrQsXIEcOA5M3EqP1x4B9fCmpG6wMChpfz8F8GMRvO9rf5f/SPJNwIsKAxpBQQrbrdzJq8gOsWhxybdblAOcbpEoKOw9dLkIZ0nRsinZ/6+/iNlowKZrZM+SbSSzRXxoSjIMjbV3/4cb/vmTizghvKST79rXQ/qYmB83MJkEot2VyNZphxp9lI0bXzCIWapDK+tau0YWr7M5eFA3wOB97Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3/JkAZE2BsRkTQ74Tb77bx9Lc+5WgksurE1tYfcth6M=;
 b=Vv51XKjwnEi28kMF8ZJ+R9QiziLOvK/i5tmfi/1/V8hfQobo4toqVPzuf7q2jOlIYCZ/LH9FMImlgmK5egSvomRA07nHGAltzjUBRQTgdq8cPVec34jciISuit4dKlj2mtAbJyENzZ7HKT5NWDwjbSYgKqFKt8dmU2s16qgvgxDO1ex569VT/vtaQPeEqYGaKcT7X5qZACan5R3HJjKqhYUQFaO0nWMoBWv24arkBZGAUbbbtMoDUViJZSxKsa68YqiCaevFG1OmoEUlE6bbujIV3F90MYy1bCR7lm63AeQ/ps2I5F7IhA+tuM7Bg+Ypkc83EE5WGjbeBy0QlDDOeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH0PR11MB5508.namprd11.prod.outlook.com (2603:10b6:610:d7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.18; Wed, 30 Aug
 2023 16:11:31 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.020; Wed, 30 Aug 2023
 16:11:31 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 30 Aug 2023 12:11:24 -0400
Message-ID: <20230830161124.81799-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR08CA0068.namprd08.prod.outlook.com
 (2603:10b6:a03:117::45) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH0PR11MB5508:EE_
X-MS-Office365-Filtering-Correlation-Id: 845b906f-4084-4ff6-5801-08dba973c5cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E6obUqJ3s4z72YLCvgDhSoXFVHaoMfnjbs2UEllhHv7Lf7lzxtr12HalwL6sDhUNgR0jnMaxeJEh+raijxj3nOwJDsaTHEJwGwYFRHTx+aEJswR4MoIBgq61EfxixOngSIch+61oxvteFGSOZvj0OV+qmVmwNkkmYRP8/1+iSDY1n3YqL+RcftQ5o5h/j9ZT3OliSCNKfxn0cLzUGkBXqOmpln7ME/Gi2jOWVZzWX3yRgUC+xaqZEmOOTDnyq+QJHHwdG/TU5BxBrgsqTGAZ1tr/E7Q4NVN3eLD2I1E3UtBot4O4Ohool6TNtkjzxHkdjTkE7elYtRk3lio6FtmQzVEz7jL1pHZ538iQu6487SyausfcpcQrl3KhCD/syoQxlnj0yrOwtmMk3L5b24+eOChu5UTEv/iyIQ0OzDicZ9vDax557yI1AbHs6nrm4guKYwi+bL8zj47lcevvkug43rzhZR+2XAFoq7uI1NBFWFAEy5+EVlO4noHz2Tqyqn0963pDu9GV+Zx2dVkFMB08uN6MjOelI23XxfeEUDtvTAI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(376002)(136003)(346002)(396003)(451199024)(1800799009)(186009)(6512007)(38100700002)(316002)(41300700001)(6916009)(82960400001)(4326008)(2906002)(2616005)(86362001)(8676002)(44832011)(5660300002)(83380400001)(36756003)(1076003)(26005)(8936002)(6666004)(66476007)(966005)(66946007)(66556008)(6506007)(6486002)(54906003)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUF4U0FQSVBvKzFVM0pyWDVxZ3lleFJJN2Y3QjVpMHdFMnVDOGFyL3ZtRWts?=
 =?utf-8?B?ZzV2VTVDSWorY3pzV3RlNlMyd1p3TjIrc0ZBcGczSE05a2UvNExSOVZIejdM?=
 =?utf-8?B?WmtRNDJrWXY2WHZHMGNKKy92NytPZjdlYVgxMHNNbmRrd0pmQ1dIcEk3R3VO?=
 =?utf-8?B?azdEcXZpUjlNQzJnMFUrMDRSakY4NlBjcG40aWU0NnJtS2FhWTBDUlRWTmFY?=
 =?utf-8?B?Vjh0cThPSU5tU2psMUFPQ1lEdEZic0MzN2FEV1FxNjJhUW1oa015RjdzdzJJ?=
 =?utf-8?B?ZjlXR2Nqc2R5YUgrSHJ0TjRFenB1WXVnUnNQa3lickhSbFpQOFYweSszaG9O?=
 =?utf-8?B?em5pM0dNLzhET1VPSmxoSnZMZXB0ZFg3MEgrMTVPeW4vZ0tpWWsvYjEwM1Rv?=
 =?utf-8?B?ZVRjY1VVSmkrWDR1UldXTHFRSWg2VEtuTVEwREFuQ09SaDl3QitLL1RoM1Jn?=
 =?utf-8?B?MWNDMllab0pZVVN4QVplMjdaa2t1cVgxMkh5aDFMRE1kaVdNcnhadGNGTGta?=
 =?utf-8?B?NTRYRlJWMDc5U1JIV1RhUHV4TnNzbTlFdGVXS3IzV0ZUYkRmR3VJVUhWZjd6?=
 =?utf-8?B?bVpLcmFmeDBsc1lTTzRuVE41aXpSbGZJV1hQUGRZWk8rTjE1MGRRZjJnMjBl?=
 =?utf-8?B?YkJsa3crY0NabUQrRkFOWEhGOFNrZmFhK0xrYVlPaUwvUXhsQzMycTI4Nnkw?=
 =?utf-8?B?UlBwZk82N2MzQVd1eXlmaEZIWVF5U2FwbHVyOEIvLzUvSlhmWkg0UHM3cm85?=
 =?utf-8?B?QmY4R1lLdWNBcUdzbXVKaVI4ZnZrUXM1TnFic1lsUmtMLy9nS1ZveWFXNThj?=
 =?utf-8?B?TitUK2E0eElGVkdqeVRCRSs3bUNodkx5TktTWDVkQmhXclNYbnBKckM4ZGFt?=
 =?utf-8?B?ZHZ6b05qMGliZXM5T1JvUmNRMDBEWEFPOUFIeEhxSlJRMHJjUDBZNElBWE1T?=
 =?utf-8?B?UnBpRm9BWXE2bDFjK21NQy9qQkFEcWJlUGRXazdCWWpiR25WRkVmUGpGWUk0?=
 =?utf-8?B?S280UnJiNW5XNytwbzJsS2U0R2RaMmlFMkY3Q2hBM3lDTmMySkthTkd6U3FO?=
 =?utf-8?B?Z3N5NXZuU2tINmdxcnc4R3FTbWhjVjkvOWF2SFZNSWMzd1JST3gwMmIvM0VU?=
 =?utf-8?B?QURqMGJrdkRaSmlrbGZROFJJNXVKcTJCcnpOQnNEa0JEeHVLRXBEc1Z5NSt2?=
 =?utf-8?B?Z3d0cC9SM082WVpwdzFsdTRUeFRLVHZvN2pmOHpMOVFKMXdKYXU1K0NKVHFX?=
 =?utf-8?B?c1hUODNLWTg1UG95ZHBwUXRDa25WcWVlMHZ5bVh5eWZETlpXbkRFVld1MXRx?=
 =?utf-8?B?emc4SS90Y0ZpOEx6enEwdThQQUhMazRVaCtDc0JEQUY0dyt1Q3JGZS9JWU82?=
 =?utf-8?B?Q2JUNnM3ZTJQbEYyZ0l1dzJKVWcvZ2w5TWI0RHAwSER5cis4dmEvYmpuOVlU?=
 =?utf-8?B?MlVnRUQrOFJPb2NrNnZQOElialg4RGR2NkRRS1lzcVlMeXN3cDFHVm8vb1A1?=
 =?utf-8?B?N2tuU1paTS96MCtpa0ZWampUYnFqTTN5OGhUZjZXZ1JYNGltZHBXdFU5dExB?=
 =?utf-8?B?UzdDYmZkRDN2VURSVTJRcXRJREF6am80ZUNtckE3VXRqeWVad3Zrc0Q0VCtR?=
 =?utf-8?B?aHBIZ1hSei9PU2FDZGRXTEhjUzlJZldzOTBJTGg2L3dSVkVnMVBmNDl0Rlh0?=
 =?utf-8?B?TCtIYnlCTG42cTJJQm9Pd2FVOGV3OCtwWWU3ZzZjVWdyZ0dpZkM2aGxueGV2?=
 =?utf-8?B?ZDBsRGRQdzV5MThQM1BXcUdmQmt2TWFIS0F6eEt1Ny9acHJBSXB3ejdBcFl6?=
 =?utf-8?B?YjRSazJwcGlDbTJZU3R0MTlnaThFU0ppbjJjaGs2bEpHeTFYdkh3RDVzQTha?=
 =?utf-8?B?c0ZSMDlacExpTDFlSm9JVVJOZVZ2d2NLcW1ieFc2NXZvRmNLMGVpUkorVUk3?=
 =?utf-8?B?aXZ5QU9UMkVjczJ4TTk3cW5LVGN2NXJtTVl5U0JGTWRoQmd2TE91aDFHVGt0?=
 =?utf-8?B?QldBRjhsWnBPOWJVU1I2clFrcEJqT3R5aW5sdytPeGtrbkhTUkVzb2IrMTFr?=
 =?utf-8?B?Q1NKSEhUd1JWNzhuTGxCaHlxSnpsbWNTR09ORDRUQStrK0p0RWMwUC9xMkV2?=
 =?utf-8?Q?3III7lgxWvmA9PXzz5LNAuj5s?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 845b906f-4084-4ff6-5801-08dba973c5cb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 16:11:31.1069 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZVjQYMfqTpyvN9p2GvS4+gDAZTlJi4xY08HMwAB1/bJIE7eGgiRHfxJuwroDCWWH11Jv1+W9zLNYYBQhfHcwwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5508
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH] drm/xe/uapi: Typo lingo and other small
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

Link: https://lore.kernel.org/all/863bebd0c624d6fc2b38c0a06b63e468b4185128.camel@linux.intel.com/
Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/uapi/drm/xe_drm.h | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

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

