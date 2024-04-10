Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF6EEC67861
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 01:59:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 394DD113099;
	Wed, 10 Apr 2024 01:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WaGVCKu5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5904113096
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 01:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712714337; x=1744250337;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=UNKEI6zirD4ax0r37exyn+F+dFl0Gli9c6//Bmb1YwA=;
 b=WaGVCKu5HIrWUngWuwP6C9B1lJhHWTOcD1hso7eazQRvN87EE0LLCb+X
 5hPiak+1S3wmGpMXxjsfI6ycoNRUl0xj8XlrtfXgcsv3EjWLzRRS5RYtQ
 LFskntY1+96gUYbpFZkPszkqqxSaszRaOAWW9ffhmmhsfGekLc+CEfGtp
 Bo483DLgzfS/DXANFrWzXvs9uD/mwMtLGt+oWxoKfkCBXQ64QLBPdQGxV
 X8pNnboZxzRFNRwqxnBtEw6jaAOhbqK5GqcfNBImCUjq9ZK7AACmBDJRL
 ZBqJDK2dG8Dmb1x97HyFvCT3ER7/9uSbKofcXMn028z5Wkun/kxmnTu8Z A==;
X-CSE-ConnectionGUID: 7Ro+HBdgTZ6diKLgbdL7vg==
X-CSE-MsgGUID: G+LfqPdwQ7qkbA3asLb3fQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7914102"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="7914102"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 18:58:57 -0700
X-CSE-ConnectionGUID: VRxnzdx/RdmQ80uu3a0GQA==
X-CSE-MsgGUID: 7/g/vm2qSrC4GLoJXi7QgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20970977"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Apr 2024 18:58:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 18:58:56 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Apr 2024 18:58:56 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Apr 2024 18:58:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X13WamuWV46C+9X1gQQf7XzvpSamWtNmXFd1DH3FVPIt9BXzFcbP9HItFK6Wj84wfzDU8/4HTnwmGleVMGfRlp6bD+0fvCSBOBSptdhRv8tE5uD0WGp8QXNsbBECfTa0BDBcOVkzTQWK2t0me6X93f5IjeVBZ+0B9qDat06oN+GTZCFxZ1lcRqNj63cLIr0fMgNWbKRmqKnm0eBccCVkZuUtUZwxyCmH7ecdpjQNyB8wnHgjgVlslhtzuMs0Nve0tChlhZhxUJSKwY9+kAteNEHke7hEab0k3CSnE6eiyAgsidhkESZFwFAAg2c0j27oNGGjwOLLjSqN27xJkSoutg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6FjisuDv2RXy/ZfmbDBZaJi3GLe+SlXoOAKL3qb1htk=;
 b=VBCMGXLXGQJBinPavkyIFh9v1+C2nSlMg7GUuJmGoPq8XfajXlmC8WXYYkjeb6UPpEFjgoqjV6pD4+ABcuV18MtlbPYVN5YOU2TFq8TmOc8D4IKb5XXBx2HKFoQQlnsLlCGPHlWs4fjeFQM/loIlVg0yHWBpEfJr3oStAFJ82VxQiqJpAXZlzGK2/HEuu+ups/DCWwYWLpTQRWwjKR1tFzfsy/ZDCQESLrPxTofJFNogD1LDn9iwHo6oVFx8oAlD8m9GigxM5E5hlr+mnhE6qZE0iEPLul+yxojZ/joOqm66kVEkUtk43zV8gw9wr2jcE/uQCNQFgujUp3xpQnN6dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB6891.namprd11.prod.outlook.com (2603:10b6:930:5c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Wed, 10 Apr
 2024 01:58:54 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 01:58:54 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: [PATCH 6/9] drm/xe: Convert xe_gem_fault to use direct xe_pm_runtime
 calls
Date: Tue, 9 Apr 2024 21:58:22 -0400
Message-ID: <20240410015826.1093368-6-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240410015826.1093368-1-rodrigo.vivi@intel.com>
References: <20240410015826.1093368-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0068.namprd17.prod.outlook.com
 (2603:10b6:a03:167::45) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB6891:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rv5zsALMHgEoZ7g9ccLDiPrEa5IgqIeHNJNOYMsP2L2T8mxVCse6OrArb5H8Cb/yWwkYL701K2hkX9ys4A7er6hXdBuaz51QOt74fuMhZEqabkFfPMG9cLEUGLl7VUmPiqAu9rOXhBNRd1djGSgwpnP40y75gx9EhcfBvh/Ho3cV1cybXoW+1n0dOLd/j/U6mOjfAyUN15P/5bgKlsEnhjur1+0ORmHVICy38DS/IuhMqwmHj8SvA/EzpAcD4m4jDaJ8CAibZDKYe29P+83MRUhYnh9xoGni8OQkWHcfkku7YqSTWJ0TMVUdI7o6c1es5zwKfecdLhsiHCSCvQvDcZLaj41Y/nClY+ljuxJRG/QX/EnVv31+gENpcPxs238qQh62wVcDWgUc+TXOfRboSXSrGdSPUCI93fMkswS9Mq/z/XL6Gryzekan+kkgywnvYJuCaSTowsdqeOGWgrIyfBzVDI3Gou9LC1IMzDFaKWwwUQzFRYMtwZiEEp23o5m0rnnrDwZa1MYzGCc/bq3EU4SrriyIrcUH+bDVta6SRhLpdSt2JX+GLT2d0FGSfEyBdhwYGP+Av3kRvy/5ZFhiGxW0dtDxFkb8BAkXJqad0u3oh0q82jreR76jgPnKf3ZYcI5ynS+euuq0PZ6+lcAYdniqeFdbbDekAxi4KAdZ44U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GTGG+YX/fcH+3axappnHBpAlCbwcRtAGCLcZ384mqxzdUsrAhVg3UKxSukS9?=
 =?us-ascii?Q?Q02B/V1Am8UJLgnZJINh1rIryn7NkkZop2sMLQ4q2N8nrnCr2+LNotO/D0aR?=
 =?us-ascii?Q?d8zpBONdumpm67TqntTsNqMybmnKEiWw+c5eojJZ8qF7/k1aJiztiFKKEVhc?=
 =?us-ascii?Q?1kvDglzsY6As/C0wQVDXGzrb19dk8MXu5y7Jte9r/sfXVlrrtTPLoA6R1Z4K?=
 =?us-ascii?Q?boaHkGT5GAcx2HvWzYEjzsmBkFp0ze9m8+uTfjNOCfOERnVZi/S0x0KtNfFn?=
 =?us-ascii?Q?L2ByBlj+ixveXIyInkQG7ZYVEfC2YqswLW2eXzAxB0tUOznW+KyLdG1VLYSg?=
 =?us-ascii?Q?XXdojQn1EDEzlMwYw2GTQSPFEt2AQ/O+Gounr30B5UJEHH2PLp/zM8hpAvIg?=
 =?us-ascii?Q?/MrUqtLmyELiF3kWoDwNt82IHSgawvdVapsXplvebcbKZmMrew64Ql/XtUXH?=
 =?us-ascii?Q?yHW2jGJYjNwfC5LMVX5Ka8FWRxl2XuMSkxiUWpnnUp7Ha0U5PoIRmsSpNDXC?=
 =?us-ascii?Q?VgDQlb4w2iAkivIBfCBex4qdpHiUiMjx0IKfC6lFxirqI/HDU3Z6N2b222VJ?=
 =?us-ascii?Q?nGTtmp82gfM8tb7Hi6EaXdakvTzqwfNR4xslbw51D4BkNwEQ8zxdcsiJmht8?=
 =?us-ascii?Q?UBvTHPqDyNYkfjWBcxRaliPqv3DvLfoDridsOE1dYiyUQ0KYo94bcpdmj0Qn?=
 =?us-ascii?Q?CdTksmXeJ0XZe8wDFU1i8r5GGIVV4iWLl3UIXr9KrgqLND6HR9Qrxk6s9Uhq?=
 =?us-ascii?Q?UduLbDsMoD81gAVrQsmv+Ut0duJYKuCUehjjHsDr+8hcOMBJo3wUgF3R/UyR?=
 =?us-ascii?Q?LHY8X6kjG9HJwPi9R+fBf0OmQlzSMDOvgeFX7wLgQcTQtHbA3NC/Q4U+Mr8G?=
 =?us-ascii?Q?xsPIMr/i+ImxLmhHSeFQXY79peui3XrnRm0r8pOO8++1uAPjmdjhNQe7nXf1?=
 =?us-ascii?Q?26OpPVA0dTJsBM4XGIhKeJsXc1GtIh98aX4cICPTbhao6qQlZd8nKqjGTFWK?=
 =?us-ascii?Q?uInSvolVm9zArp2XpE9heV9nwjpJk9bg74u48N8i/XwEnmEHIf/1GoZDEtqZ?=
 =?us-ascii?Q?RKt+spqExlDFr54yr2QO5LOX84zBvzp7/G1fuy4aLFSINdkMVNtQuFjUojBD?=
 =?us-ascii?Q?lBXZ7/jEDvghXGGpwkJFE2MAmj2yImMz06gQcnJ3kue6WCw5gpdWT04d6Upf?=
 =?us-ascii?Q?f4OFq5KkQ2xT+pq9VRExxawGMk94CQwNG8Se50sPkUgvVdu5PyrsrAo/yh4Q?=
 =?us-ascii?Q?tvhh4GF6sEk2r0zakKwsmqZqzjsA27qkpGWMUQOf8/Q2BJGZWpj+4YCgaPxO?=
 =?us-ascii?Q?KH2/EW98OjgVZoHkk90MTNtPDMGZlCT0Ga+prQ/GktNG/w8Wc0B1TPKwJEQ1?=
 =?us-ascii?Q?gEjjAID/Lg4fKaVob4lmEzB48AP9ds7Vvi+SC7ZFj/mh94KJo4tZXm3Hsmiu?=
 =?us-ascii?Q?Attk5Jv8SABewHEgL4+n3B5ph+xxyC6exB8riW6tdVJhXnnVCrSlIJA1doiR?=
 =?us-ascii?Q?KzryfyiXM7iGLRcrKCQzhpBcj6E2yKS12y86ekgk8C4/cQGUAXFAnQpd5qRo?=
 =?us-ascii?Q?mEzcuPcrjDpYc4iokNtehKh1azmUj+wUVGnhFs91X7+BR90xnUu3yBEQ/6Z7?=
 =?us-ascii?Q?mQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c25598df-7fee-486f-38e9-08dc5901c666
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 01:58:53.9880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /EuH8080b4DDcT3VaGHdBTbd8lPZUduvTOatrcUzSFuJgaUfpWQW3bubo9pqrUMSiQICUIGn8yssvmgm9x3pFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6891
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

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index fdeb3691d3f6..9889adcc458b 100644
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
@@ -1107,7 +1108,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	int idx;
 
 	if (needs_rpm)
-		xe_device_mem_access_get(xe);
+		xe_pm_runtime_get(xe);
 
 	ret = ttm_bo_vm_reserve(tbo, vmf);
 	if (ret)
@@ -1138,7 +1139,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	dma_resv_unlock(tbo->base.resv);
 out:
 	if (needs_rpm)
-		xe_device_mem_access_put(xe);
+		xe_pm_runtime_put(xe);
 
 	return ret;
 }
-- 
2.44.0

