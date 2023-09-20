Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24DB6C04FF3
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 19:30:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E64CB10E549;
	Wed, 20 Sep 2023 19:30:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9FD10E54A
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 19:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695238222; x=1726774222;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=jbLghbi4AqtobhcZK8PGzcYYYgolUocmQw/MNGiGwbo=;
 b=eLhFxN3xRAzxdXOW7CreLoxWYAMY1sxpD+wnNM7BPlHdThspDia+053O
 0uutBq2pq32xlgPzIM4tfEDK4jUzpl+NugnZYt2bBbMOcWBMhljp5nJ3o
 kGCe40Zz5+cSGI88vdv3AWxszuiMUwoLLnldo/FZMP0bssaZLSjNR5cdf
 pguMKRSMejl0rDv8s769zemgV+2RDUhQMmEf1WdJmH6BzIG7r721oBbla
 pEMg56ecsg4a1HNaqEuuYwpLqn2TBN2KcpCfgHbU+SjmZ0Gq9QD9yxe6i
 vl+iWdqxkZ18/LrU/pK+68HKwO7+BQ4ffVjCMvvLG42h6D4SpLlts8o2O g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="377618954"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="377618954"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 12:30:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="812287474"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="812287474"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 12:30:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 12:30:21 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 12:30:21 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 12:30:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YWA3OkGl7YbMG0CrHo0fxtnFWkSqZ+36nVui3UiWRcjfnik9BJq9/836y7TGAs2VeX30vaNywSvKgpxq7aQA+4DgesWJwnpICsjC2ZAqQ2TDnbaCAc5TgyymGX8emFRcViKRuHT+Rxt+IPZUWGE87ohxpilQRxg/QKtztsyn4hCAhgQ6t1DtxXyeq4XRzkw8PdvnGw25/TmYyzcDfv9YSokh1JuR6lPhQfsMsageNJxv5Y7+wL0zfiSTi9eA3x97CriUNq1RI2Gkkcaz9GZZlwOOaNdClXW0i+vjG7l2/2qLUdMRmm51npqNHYAm4XR/iQualHogfStdLSgetiJC7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7dHAwBAjXnYYILJHI79/1kiyC19g8YzHEt3dVztK4UU=;
 b=j2I/LUqQMhAADdFiIP+HcI/3pMBpn3xeYNBVDoPEDPAHkNxBwFcd7huvHcPDupbCtChYsxeLKPXsSP9uEREkm+Ecb7HpycL4bESspBHejdkaVk/rKKmegqgaD6JXVPiCWDT+PKcv6XrHcytlwB0c/Rkj/Mqa+LwaqEHlPnxjwfID8SIcM6vAtXaMjBgvR9IkfWz/Ay4ULWjifmvgxqG6l3k4uHqgFXCebh5QH9CeceD/50kKG6eqRkigm2qAQap505Lbtsf0TVtBOLaQqe7Up8sgw8dYUsQ4LlkajWZ2jHM84YqpWogfkp1iDZlTVWZZUSfWdiDdg50oz2AzG3FYZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB4951.namprd11.prod.outlook.com (2603:10b6:510:43::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Wed, 20 Sep
 2023 19:30:19 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Wed, 20 Sep 2023
 19:30:19 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 20 Sep 2023 15:29:29 -0400
Message-ID: <20230920192940.135004-10-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230920192940.135004-1-rodrigo.vivi@intel.com>
References: <20230920192940.135004-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0106.namprd03.prod.outlook.com
 (2603:10b6:a03:333::21) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB4951:EE_
X-MS-Office365-Filtering-Correlation-Id: fd0ce427-5f08-494d-b060-08dbba10061e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y4ph+5qH4YTgphcecgMV54pP8vXRk+N1n+EVy0H+I3LQKkQ/fEIigypacedHSMttPMVJPBL3aAQPL1KmrX19T2dyt/yDRkfqebM0PIPVWWMjr47ktH0xp8pkLWrp1YtW03RYew2qSBW62hYBzr4z5NmXpAcshpvL1cK11T+gTWDfnvSLuE7SA5rY8zIZ3axMZKrSBqhEMded9dPNQVdaoOiBUCC4Ujx+zXj8053C82W48eRXzajuYE9s0qwSI2rZBPUSwA4GMZM+VcYPfzzgSi82Z9T/joyd/hDSHp1+IvOGv4cRPu7YgqNPmfaasI9+wpMudX1S8MHCQSTD/iHpgXMrEGdkJ6L0x6HEekfAWWUtR/xllJU31LnOKwi5NC9pMqcbwzNjwEijTzdHZXCfyU94COB1qL7gwKBKKd/J1Wccaa+PTtQEdrOMecCnvhoWXdmm68rX4486wTfgpU36zMG2eeXxWmPMj2beuk68n94rBq9RwESHCflr6uRvw87hffqzLrdBznjTIPA1/Z7018SheYbqeZwINW09ustqdQSn5lwXAqa5FaYwMiqGP4ke
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(376002)(346002)(136003)(396003)(451199024)(1800799009)(186009)(6512007)(6486002)(6506007)(36756003)(82960400001)(6666004)(83380400001)(38100700002)(86362001)(107886003)(2616005)(26005)(1076003)(66946007)(54906003)(66556008)(66476007)(316002)(6916009)(41300700001)(2906002)(5660300002)(44832011)(4326008)(8676002)(8936002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AcW4BUs8NjVWlo+7EoatnYat8RjXoCE1fyz7fwI7gNhUenmhRP7XRUd8cIXg?=
 =?us-ascii?Q?Ei75yCU8DBLm1m9t8SY2BiwpIeeiPx76gZ5RfX8Uh4oB3EaSnSQd3sabMwzf?=
 =?us-ascii?Q?1aG5X5+lBGFvy5efVI1P0/EbbU7KlkgLUDtp2DPBhx3Cw58zaGiMukPz3pzn?=
 =?us-ascii?Q?UyKLPpRfS7gauuNfLEO+wTtxM6HrLqPMCbnUcPbutrV9qQmQusZDOG2/EWXG?=
 =?us-ascii?Q?TDp8J3z8Ut57TQCW7YcMa1Moo0RygfoA8gb/g1r8NrlJ8V6tx3mNAnNQ9acJ?=
 =?us-ascii?Q?pApVWuehFAmYXwEzsBNTt9+5uZOsytAB4W5MSmxizRXqdX4T6NLu5hGfIi5d?=
 =?us-ascii?Q?LXqN/HCHUAx7Th0Srt1zXKRBRP3j0tZco8s2necB9b9fQM8SIL3RZ3Ci97H3?=
 =?us-ascii?Q?ZGbixIb2YHYLpOhNyTemU68Ax8nihZt8dGFu1mB14PuazNOa/aNzFFHF84IX?=
 =?us-ascii?Q?UYZsIYyJx5FkFyJi29ZxLLQfBDooMiSWEXmDt7Hgt65HykVviBnseG8P9nQ2?=
 =?us-ascii?Q?knLFQcgbDkN/fAPQkTliSLAWv9xKeT/o16oIJz32c0V5i5LJojIY2wVBjva9?=
 =?us-ascii?Q?ZosKt261V/+tXIikpN3zO7Dxib2n6tKcURihobe+qh2Ujc4ZIoOHC3Ch7DqT?=
 =?us-ascii?Q?vBPtmoHQL1NB/8afRXW9P5MIW7NK+7sZs9ehdbYj08OWIg2MZn1X0GRZW74e?=
 =?us-ascii?Q?C0RqEw5w81JaVFCXh2cSRedFdj+ZI0XcTO/6h7l/MFG7gRKjvWYLGZFiLNLh?=
 =?us-ascii?Q?KwhgV4fjX/GG5yE5cKXzAVUWASKZ4gfTngLjN5JwmTwID2kKIx5mm5wI47DZ?=
 =?us-ascii?Q?WcXGXdu1NhwJoBl2PnExrX/v2/6s2uExN9RxtLPnS/LCp8ewl3TlAYF41iz7?=
 =?us-ascii?Q?2XB7e3aNsKzHnHXA3ejtwgIGje1SQ9OUvRJY9XA8hPob5BBEUAT3fbH8czgV?=
 =?us-ascii?Q?NDLcAF3UVOvrqsVLgmVhR7HVpL2lZq1YcfAX999MOJQWaX2fnNaGp13Nyopj?=
 =?us-ascii?Q?D6B0meOvLo1x0fqv0Z9hJTlaG0MO5Un44T0GzuG/Cudf87GvoRgM1a56SpkR?=
 =?us-ascii?Q?h3ByAP9YqDZ2yI2tEAVZDJzZCBUXbBdE7gtuKw3j76THfxR4XEBSBaxZboxM?=
 =?us-ascii?Q?Tdubu7fV8zch41cciVXEiCPy4rtxaDa8RkNOvilgFihNNhqQ65nbsyMQVFZU?=
 =?us-ascii?Q?wVxvMeE+Q0Zeu9uR/7NlwkCif5Xd3NIl9Ghzz42sudUAGTxPjNYTsKlS5M6E?=
 =?us-ascii?Q?If5SxZmxG8E7XU6e2Tn56a5dBXVWrkgBOtQUTo6SpqF7lCd/tw58p7nU+B24?=
 =?us-ascii?Q?rgIFFIpbsnIE7kNVSvAEPSItuCn/7VtM0DrbVC0Osw7NVPTPrTSFJuuMbjm/?=
 =?us-ascii?Q?JfyXHtTLkley7qlIq7BryMl8As5gUN4l8Xy6PYQ9i3Worg4KQutDu5z+q+3U?=
 =?us-ascii?Q?GgwLWU4dYY8P0EepNeb8mTSrNVDrPiaXlU83+ztxzu6MQLe0rBILyRdTN2r0?=
 =?us-ascii?Q?eSEdXI57pT/1RuXMnNRRb2V3P6qRK/+PJAK2mR5zRXS6DR7zmRbLT5akYo6C?=
 =?us-ascii?Q?vqkbVmq5hetZNGNFd/6T4AC9Vi1v4V/WvpbIRTggHjc9A1Og02lJOPh0Oixl?=
 =?us-ascii?Q?0w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd0ce427-5f08-494d-b060-08dbba10061e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 19:30:19.1355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Yi+n4/L1QC5FTA5GtboU1coXIwwKRVXEI2DXnFSB8udwWhWwESP1q0Gznj51nAPkso98k6QEwI3YKRxndHW2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4951
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v2 09/20] drm/xe: Rename exec_queue_kill_compute
 to xe_vm_remove_compute_exec_queue
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

Much better name and aligns with xe_vm_add_compute_exec_queue. As part
of the rename, move the implementation from xe_exec_queue.c to xe_vm.c.

Suggested-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 20 ++------------------
 drivers/gpu/drm/xe/xe_vm.c         | 21 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h         |  1 +
 3 files changed, 24 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 68cd2234acf5..170d9d9c48d2 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -775,22 +775,6 @@ int xe_exec_queue_get_property_ioctl(struct drm_device *dev, void *data,
 	return ret;
 }
 
-static void exec_queue_kill_compute(struct xe_exec_queue *q)
-{
-	if (!xe_vm_in_compute_mode(q->vm))
-		return;
-
-	down_write(&q->vm->lock);
-	list_del(&q->compute.link);
-	--q->vm->preempt.num_exec_queues;
-	if (q->compute.pfence) {
-		dma_fence_enable_sw_signaling(q->compute.pfence);
-		dma_fence_put(q->compute.pfence);
-		q->compute.pfence = NULL;
-	}
-	up_write(&q->vm->lock);
-}
-
 /**
  * xe_exec_queue_is_lr() - Whether an exec_queue is long-running
  * @q: The exec_queue
@@ -861,11 +845,11 @@ void xe_exec_queue_kill(struct xe_exec_queue *q)
 	list_for_each_entry_safe(eq, next, &eq->multi_gt_list,
 				 multi_gt_link) {
 		q->ops->kill(eq);
-		exec_queue_kill_compute(eq);
+		xe_vm_remove_compute_exec_queue(q->vm, eq);
 	}
 
 	q->ops->kill(q);
-	exec_queue_kill_compute(q);
+	xe_vm_remove_compute_exec_queue(q->vm, q);
 }
 
 int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index ab132b88c135..2af331cf2d35 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -380,6 +380,27 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 	return err;
 }
 
+/**
+ * xe_vm_remove_compute_exec_queue() - Remove compute exec queue from VM
+ * @vm: The VM.
+ * @q: The exec_queue
+ */
+void xe_vm_remove_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
+{
+	if (!xe_vm_in_compute_mode(vm))
+		return;
+
+	down_write(&vm->lock);
+	list_del(&q->compute.link);
+	--vm->preempt.num_exec_queues;
+	if (q->compute.pfence) {
+		dma_fence_enable_sw_signaling(q->compute.pfence);
+		dma_fence_put(q->compute.pfence);
+		q->compute.pfence = NULL;
+	}
+	up_write(&vm->lock);
+}
+
 /**
  * __xe_vm_userptr_needs_repin() - Check whether the VM does have userptrs
  * that need repinning.
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index f966ed39b711..ceae9c1be697 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -168,6 +168,7 @@ static inline bool xe_vm_no_dma_fences(struct xe_vm *vm)
 }
 
 int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q);
+void xe_vm_remove_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q);
 
 int xe_vm_userptr_pin(struct xe_vm *vm);
 
-- 
2.41.0

