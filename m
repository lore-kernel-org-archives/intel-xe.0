Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2552C04FF6
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 19:30:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A27E010E54E;
	Wed, 20 Sep 2023 19:30:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E56A10E549
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 19:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695238221; x=1726774221;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=cNdrnPTWZWGc2d85bEJDmx5MUiNPfrm4Hcxo21RMJqw=;
 b=hBQz4EcvJR8W/nObACa3M/DthnLQ0EfMouHUOXzShMUKc0/vzMIQHxfP
 QlaQpFNQAhVnIEWsRznKu7QcnjKk1Hw3fXdGPIgiuy3ifY/d8NxLV+YfM
 KKInyrk3XRuxFbpOtskZYUrVDoF8d7EaumyT82PTpU7dtq0h7uq1rUkMb
 ERhlq2U/SLlb29NoQYCnPhliTYWnGS76MqtlGTQ9Xwt5kVjufebZ2lhGz
 0eagipar6iqA/J279+XHDqanDjkR0C21/ieTSpYA+cQSPUPSu+elcEz3/
 eQTc/84HiHu+JvYmpnw7NRyEbOqv6EKnOEQsixQmuP2WD47RqZ2UFFmaq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="377618951"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="377618951"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 12:30:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="812287472"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="812287472"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 12:30:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 12:30:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 12:30:19 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 12:30:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hnlCIWRHfnt4b5WOX/W5VdfP9QyNmwx1kKnHdjFGXxgSLzhqXtD93S4D/xhExLcApzrb4IYox5PcCXnJrCLZBhyJVDNoWxTEb8gu5FQXAlyvITIElXKGQ2JAVYgQ3cj4f+sxyjI6699lg1JMYaldolmWJww7XNL9geq3yghFvwvJRvq5+UVfXGKRd2d14eeKmhiEk/k1hJf9snrkiAoPohMAvlbgrUZHLQT/3g1yINuWsTfOcKX83rWaDUcPBZ8y6Q204Od0BfRJ40asIRV342WEYrw5TW2SRJYYTsJUH83x7wcHjOE7Sz+22XTEglCDD+x0oCqF56f7pNWovW55vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=asQhbY1Ye+6JSzD+5wfuHwuDQIXdggvngP60D/5qw1o=;
 b=kZts2ydTzKgETSPLPG6V5we/wS/spkm5FiZC+PwmwN5BCx62drA2BudSdkd6wfLYZVahT5crn0FTRGX0nFkzQx7QKv2cfpdLsAlEagrk5IovCtcwa7mskgFl3ggHecXwzRzIo2q+3YnojFxK7jc/vS1OjQbmWg1iAjBOJF5DjrJD7LLlhk42ntBWytCoHhMlGFkME9XVB3oD+fgR9xi12IQYaaoVe8BSVIT/iDIjtIymem5akWd4T2YteBocMpOGJjvzTGJ38iD64hvtDZKXaomEJ5WPxgKpO9DuG6TjJtjD+kuX/yZDdtQlQjcDsQWgRdOOCiNUHaG8Jz7jFSX2hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB4951.namprd11.prod.outlook.com (2603:10b6:510:43::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Wed, 20 Sep
 2023 19:30:15 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Wed, 20 Sep 2023
 19:30:15 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 20 Sep 2023 15:29:28 -0400
Message-ID: <20230920192940.135004-9-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230920192940.135004-1-rodrigo.vivi@intel.com>
References: <20230920192940.135004-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0098.namprd03.prod.outlook.com
 (2603:10b6:a03:333::13) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB4951:EE_
X-MS-Office365-Filtering-Correlation-Id: 55e0c2c0-ede4-4a05-ab6e-08dbba1003d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4dAPlqEDYaGT7YnkTB/hUYnMqyaf3zPxf1T2BUzbTOhdLVLYcYd5X5fzPJ78Y1393cOdkh6XNpFl068u3sqwIiym+0kIJvPdfWxGRajJCKN3whjUm7D6IDxDBVAuejjX7s3p4qYZJNbRInfoyhQH2dDvNQOFQ/gc0XQAgObnW5mNai1LWP/ExRGqc9GlSzkawPBn3bEQpYyBBdcR/TsoWWhpUowztFIw7rhJ1t7lDkW3sNPSoLIXxVq28rEezIuwZkNrwfy7MafDB2N//dx3mHa8eonS4r7TxdsA9y+fOvJfy3xCFeUScc9P0UUmp8kmcLaK2DQfaN8Ym9acylN2pfR8I4nIqkjUdtXNUDkdQxh2pC3h9Q0unSgttcIy0pJY4yXKALm7kxf6fBzHfb+Yh3OGnTfZB2k9gmtTz7HOK9iTTPzSG6P8U4aziP3Z3xqWHHxe7YY6ZVUGkSJfzaOSQOWRZuLy/+IWMSDZzsFBlatI7jn7dDT2KUF9dF7Yl17P/+mqUhAcXPVM+ahFtw4VMJfSytfWUhBsJQ5wnoJQUzDJQFIZXYeIoIiuS2ws3a9D
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(376002)(346002)(136003)(396003)(451199024)(1800799009)(186009)(6512007)(6486002)(6506007)(36756003)(82960400001)(6666004)(83380400001)(38100700002)(86362001)(107886003)(2616005)(26005)(1076003)(66946007)(54906003)(66556008)(66476007)(316002)(6916009)(41300700001)(2906002)(5660300002)(44832011)(4326008)(8676002)(8936002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UXvf712Qbq6n0KgMDetCURzmctSx8IqbwpG+0pO1w6AOQLS0udBijWUApMgx?=
 =?us-ascii?Q?ptU6FAxoOOd3BXSim6dIzmKOMoXhv9yuHE2c/ufOlP7Smx66lzUaYPQ1SHAe?=
 =?us-ascii?Q?WinC/mddklvmlJ5Np4FLkq1NNT7pQ2RgBsPczI9V9ZRQVSootEgO8y5Cpii0?=
 =?us-ascii?Q?2XL4l5J9rC821W9sRDaTT7eeOl/ELrsXtb1jZ8dzHbLqCKVy815yaRfpJIHA?=
 =?us-ascii?Q?tCWByH6A3DCBpHTovvw8szg4kzE0AX0a+sPuZwBYDsOtVSyFW6YRvmA6rHKQ?=
 =?us-ascii?Q?5STe7tuElmn2zUH4wFILGBExMXAgX3KfmVt0hz0p/WOBpHf8zE3k9M0MyUwR?=
 =?us-ascii?Q?RZ57cS5eRqXXRNZiaoMZj1bRO+w01rZfONHCkx45FZJJb1cBJFUz+uGQYprA?=
 =?us-ascii?Q?FxQWKyEvGedkTBACUuxSHtqnRwns3oJQiIN6gdCYcFiArCajLEyIAM6ZnSnW?=
 =?us-ascii?Q?TPEZ8ZWTsp9vY9yyINhRIk8oFjjgDVpGBUkgwqvUqBOC50nW7qyo4tBrozGM?=
 =?us-ascii?Q?ES5mF27glR7ZwM0kFmFIBnPo2p2A9QtHKPEEVWZW08l5PpsLv00B9YULR9lA?=
 =?us-ascii?Q?Av6MXQajbRBJiSptS0LIpxuSg9QLs/vs3atltiyZLmh3dCcCKYbo9mJZHZ7X?=
 =?us-ascii?Q?HfNmxiRD+vU0McZoNAZIHv3DMRO64/sDPKYy1JcN1JfpIcUKsmBDqJUhaLsw?=
 =?us-ascii?Q?Qldouae1D75/ZHyXaQ2vJK1UBnXpWhixUUhwX+jdrWYMhiRP4JLwL51ALbtM?=
 =?us-ascii?Q?ggT8vwZo8W/A7pZUda0mNKkzh+lAiJUf176lPuw0swO8j2uZYR2oh9rbziYN?=
 =?us-ascii?Q?1vVIhsnJ5y/pjPQE9b/GE/S67Yo4RfGqOIs1QMxCd3RM5NnQoveTY7gHDc5G?=
 =?us-ascii?Q?N66ExeIlqukRNxy99fw3iktbG2OTNyYcsvbSGJHJM/+UAv4LjerH2oXYWsKl?=
 =?us-ascii?Q?pCqAB55EJg3qZt6cgPjVF/TUw2/5uhmK0XOtYVPNjam0c+oO0ukx7Yjf4biE?=
 =?us-ascii?Q?kIuz6WeoDeL9E/FfXcXCTczvwEtY/B7LOAkK4EKACZAhncXMvm3bDO4h1NJT?=
 =?us-ascii?Q?+q0wQUpCiaIUtCRA2RvK4f2VTeAxom6aChpq5QSeXC0RNgOl3TcG65BXfx1J?=
 =?us-ascii?Q?udoKNXFa/S4bkKuwto4Eo33mCf9I2D5QvPpuwzde58koieTyZkdxK9bL13Q1?=
 =?us-ascii?Q?kxgAEB9RZeZhp4/ut2XKW631ttSeB9WDNZMpH+bWH5CYHu0g0RiAP3alvORH?=
 =?us-ascii?Q?Fl52pP3ORKrT7XQ1s/4dAx/H5rHy5LuYX1OkWcW2YUI5XcKBHF5m95uKRF9D?=
 =?us-ascii?Q?bnqMpDMeugDmJ7Tq8zswvVH+70ZEnv62NYsDFYMO5menMFPnzt/VTZQqEm8D?=
 =?us-ascii?Q?2zRaP+nGDD5iQJ9PC8q+ud40g6GVa05tnSN/HqWLMrpYPdKYaPXE9PrP9xRr?=
 =?us-ascii?Q?4YRbvqlvbCCJdpqHJ6jJKOjlNGt85UVnozc/WVgFby/8Cw2MvX4gpsnR6IPV?=
 =?us-ascii?Q?5Xqku+d95h3dyj1Y4JxFZLhkL4oy0NWpkTD1CY0aQGi4/pI14K4n4oDOAR0/?=
 =?us-ascii?Q?fdKTbXhoR8/FWx/Apo0UnoZbD8vcX18k1O+6trEyYuyFmpeOugKb/MiGk8lZ?=
 =?us-ascii?Q?6A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 55e0c2c0-ede4-4a05-ab6e-08dbba1003d6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 19:30:15.1713 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ll0xs+5RwZJDkITJlmmaJhm3Y1T2ZSrSnWuL7HJWDg/+k+FxzsDVBx4iedR5Z4bJwn+ItzaHO/Q+glmvVzKzVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4951
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v2 08/20] drm/xe: Deprecate
 XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE implementation
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

From: Matthew Brost <matthew.brost@intel.com>

We are going to remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from the
uAPI, deprecate the implementation first by making
XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE a NOP. After removal of
XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE the proper is simply inherented
from the VM.

v2:
 - Update commit message with explaination of removal (Niranjana)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 57 ++++++------------------
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  6 +--
 2 files changed, 16 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 6f1e64896a2d..68cd2234acf5 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -323,39 +323,6 @@ static int exec_queue_set_preemption_timeout(struct xe_device *xe,
 static int exec_queue_set_compute_mode(struct xe_device *xe, struct xe_exec_queue *q,
 				       u64 value, bool create)
 {
-	if (XE_IOCTL_DBG(xe, !create))
-		return -EINVAL;
-
-	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_COMPUTE_MODE))
-		return -EINVAL;
-
-	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_VM))
-		return -EINVAL;
-
-	if (value) {
-		struct xe_vm *vm = q->vm;
-		int err;
-
-		if (XE_IOCTL_DBG(xe, xe_vm_in_fault_mode(vm)))
-			return -EOPNOTSUPP;
-
-		if (XE_IOCTL_DBG(xe, !xe_vm_in_compute_mode(vm)))
-			return -EOPNOTSUPP;
-
-		if (XE_IOCTL_DBG(xe, q->width != 1))
-			return -EINVAL;
-
-		q->compute.context = dma_fence_context_alloc(1);
-		spin_lock_init(&q->compute.lock);
-
-		err = xe_vm_add_compute_exec_queue(vm, q);
-		if (XE_IOCTL_DBG(xe, err))
-			return err;
-
-		q->flags |= EXEC_QUEUE_FLAG_COMPUTE_MODE;
-		q->flags &= ~EXEC_QUEUE_FLAG_PERSISTENT;
-	}
-
 	return 0;
 }
 
@@ -365,7 +332,7 @@ static int exec_queue_set_persistence(struct xe_device *xe, struct xe_exec_queue
 	if (XE_IOCTL_DBG(xe, !create))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_COMPUTE_MODE))
+	if (XE_IOCTL_DBG(xe, xe_vm_in_compute_mode(q->vm)))
 		return -EINVAL;
 
 	if (value)
@@ -742,18 +709,21 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 		xe_vm_put(vm);
 		if (IS_ERR(q))
 			return PTR_ERR(q);
+
+		if (xe_vm_in_compute_mode(vm)) {
+			q->compute.context = dma_fence_context_alloc(1);
+			spin_lock_init(&q->compute.lock);
+
+			err = xe_vm_add_compute_exec_queue(vm, q);
+			if (XE_IOCTL_DBG(xe, err))
+				goto put_exec_queue;
+		}
 	}
 
 	if (args->extensions) {
 		err = exec_queue_user_extensions(xe, q, args->extensions, 0, true);
 		if (XE_IOCTL_DBG(xe, err))
-			goto put_exec_queue;
-	}
-
-	if (XE_IOCTL_DBG(xe, q->vm && xe_vm_in_compute_mode(q->vm) !=
-			 !!(q->flags & EXEC_QUEUE_FLAG_COMPUTE_MODE))) {
-		err = -EOPNOTSUPP;
-		goto put_exec_queue;
+			goto kill_exec_queue;
 	}
 
 	q->persistent.xef = xef;
@@ -762,14 +732,15 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	err = xa_alloc(&xef->exec_queue.xa, &id, q, xa_limit_32b, GFP_KERNEL);
 	mutex_unlock(&xef->exec_queue.lock);
 	if (err)
-		goto put_exec_queue;
+		goto kill_exec_queue;
 
 	args->exec_queue_id = id;
 
 	return 0;
 
-put_exec_queue:
+kill_exec_queue:
 	xe_exec_queue_kill(q);
+put_exec_queue:
 	xe_exec_queue_put(q);
 	return err;
 }
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 347d28442701..f73b9e80b25a 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -60,12 +60,10 @@ struct xe_exec_queue {
 #define EXEC_QUEUE_FLAG_PERMANENT		BIT(2)
 /* queue keeps running pending jobs after destroy ioctl */
 #define EXEC_QUEUE_FLAG_PERSISTENT		BIT(3)
-/* queue for use with compute VMs */
-#define EXEC_QUEUE_FLAG_COMPUTE_MODE		BIT(4)
 /* for VM jobs. Caller needs to hold rpm ref when creating queue with this flag */
-#define EXEC_QUEUE_FLAG_VM			BIT(5)
+#define EXEC_QUEUE_FLAG_VM			BIT(4)
 /* child of VM queue for multi-tile VM jobs */
-#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(6)
+#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(5)
 
 	/**
 	 * @flags: flags for this exec queue, should statically setup aside from ban
-- 
2.41.0

