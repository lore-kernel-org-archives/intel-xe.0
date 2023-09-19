Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE43CD5BCB
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 14:26:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CE7F10E284;
	Tue, 19 Sep 2023 14:26:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 299AA10E3D4
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 14:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695133590; x=1726669590;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=jbLghbi4AqtobhcZK8PGzcYYYgolUocmQw/MNGiGwbo=;
 b=Okc3dqiAU5SAPq8A6MjiN9u3jbzzhN3mG+dyxPCwLDqhNEYiyM0250fC
 t1aic0pfMrIzcETHMpg0zc/hvBQrwwdZe77LOy6Jve/i9pMBR+ZNdghIU
 QMkAsRR1HdOGKgiugyrVAu7FAojOsHjsguQidkxrRG24SyFjPzfPgA5Ft
 VuECrBXXxj4O13Gak/bu4eiE6cyC0ZV4BAL44ay7igDRnNte8p3YEQ/cl
 2ncYlSZmBNgSfDiLrJKFPlX6O+ZCqtJPeGZ7LK28HQ8MVibt57oGrV9ip
 QgZIyqA2+Bn/33Bl7oi2GyPG+CCNYyFAh908oOsq88PQmOYkSHeUfOaET Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="383786127"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="383786127"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 07:26:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="781319688"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="781319688"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 07:26:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:18 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 07:26:18 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L/WJfRJ2eHnduP1P+9Oyow02cdrHJhy056xUosUH3D7HxTvilkPBzS9R+UWIrZ6iJnK0lu4Djry3gcFc6MV/mrtVzrwAz6xd4UhtNn6M0cbniVKwzmpcXtUe2rOK8UEabRmvLJV0aeFApRzHHWmzLjgwahqzjO+e4HsW44UWw701MXCsmUjhAI2NrU1i3a8dyymnk8gRg8lnMyc106br6DAek3XbWcqQuaBGP9cjtMfC0sAYr5aNxCtjFFT6eyCKnTtWgj7Z7SbXDArKIo/uPXkH/t9Ac5UCCFth0j0cl3MCnxDYSLZk/+Oc4WvrHj1jtE3m5cgaHUzxaKHoijtx6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7dHAwBAjXnYYILJHI79/1kiyC19g8YzHEt3dVztK4UU=;
 b=jCf4kvIrau/xpu+gR40/V9LytqyMG6GiirJ3Kh1jZUIgggIpHVhanhicELj0M8vHU7AqoPDq8zGWilbSxQwA6JtTjdDaZjY/kwuCPsU+YrJbaUT+d+r2fa/kQkh6b7BXckAxKmhVfMzIHnE4R0i3kQHJlFShOVBYEw/tsXSF3IqF72z2n8sbEvZx+BflBMrdgqIZGGOXybNSPrbaSRw0bbWwwmqmy1RJi41hvzFCBL/RPq7z/tF/N4s1qZ4nuRBvRlXBZEtpZxcGOEwGAIOQl5zUbrZt3NBGynv32nmOjHMyUmyCqrCdE3gWKc9l0LrFa0uXCd890OvUv7gnWyCEuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB7591.namprd11.prod.outlook.com (2603:10b6:806:32b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Tue, 19 Sep
 2023 14:26:14 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Tue, 19 Sep 2023
 14:26:14 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 19 Sep 2023 10:24:56 -0400
Message-ID: <20230919142504.91652-10-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919142504.91652-1-rodrigo.vivi@intel.com>
References: <20230919142504.91652-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0079.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::24) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB7591:EE_
X-MS-Office365-Filtering-Correlation-Id: fcc10050-f967-4962-8036-08dbb91c60b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VUmyea86g/E2c3NT83TyXrSy3grAMiwLcgEcxh/higp3+yzwhyGiSLb3/y00MdsSPCb6RMZcnPLRbJdQqC+frrkI1qqncxKHw14vhkGFkQlOfotJ1dyDOrCKER/V2wM+5rAN3dmu/vBWsblGUxwPUHorMBTJT51CWZeI1TvLFHXaIVToFEEMJ9PuzABpO7kcJD43B+Vy3E903jB0VLwB9+w7u/8IwAKLN0hMlbvqkEPhR4le2vkVrO8hIJuJCVSaNQrZayvkJG77+2O0QfZNhkkRKaB5U870t4lbT33ysAQy3M5JAoRpAv2NiEQw/sCTmjbTsWOwHG/qDw57YBRTiySSJTqJKb3HPkJWdneFCV+MOdXpazRB/1zyugvHorC79+Sd7K4t9XJYtlG/bXxnQ3ISvEcVOpQnX1BEpdghD8n+svv/a1VdA99E7aBI8TQUFXKMREkFUrqfpjDNaLPLUb3Se2ieFdjvZGHRytFkzEdSX7O0msX/IZCtgJY+dvLdI5+P+TjJ4N0qPSwurfnz3jjWihyG+aqmBequ9bj8jk1A1OcE4TN+gyNwyK5x7wXw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199024)(186009)(1800799009)(316002)(54906003)(6916009)(8936002)(8676002)(4326008)(41300700001)(1076003)(107886003)(2616005)(26005)(83380400001)(6512007)(478600001)(6486002)(6666004)(6506007)(36756003)(86362001)(82960400001)(38100700002)(66476007)(66946007)(66556008)(2906002)(44832011)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pTd7vE5SZIRS257ayo6XLLvj8JBR5aqyEnIzHKjUt7edhV8zwWMl0jLKtRnZ?=
 =?us-ascii?Q?VWb8RVKfAqxH9ZsiEtCaHx8/XjpYM20Om2u6Y9SSYkXsc5XHWtQDipm8AAhP?=
 =?us-ascii?Q?diRsQdvCNC4HFHBaiW9YgPcmNRRdPHzteNQ2z/9XGndd75pDRYBH0HMxs+zH?=
 =?us-ascii?Q?GN9K+eYwSNhaPizdt47qqSFE4uY4T3IOtDRoVtYmKSeYFqXfYjFgrp7mFbRT?=
 =?us-ascii?Q?reKxmp1nGIy6I1LIETOvYqQCeEpcwsmlDhjc+20c/r++ji4tvy7d1V5r9hdF?=
 =?us-ascii?Q?izebd9D4pga8R20VNOWlmWQogt3qz2fzzFDtdE93qw9AO0jTWgglwOrZs+Fc?=
 =?us-ascii?Q?v74v5lmOFpWfezaAUCuJEAny3Gh9zbW5O05P1dNpmhVxtmpwC8oEaPhsvwh0?=
 =?us-ascii?Q?MnHXg7FmDEpubFTPw6xTU9MZIMeM/yhFr6DRJIhMqaaqjxeGYRuN9SxXMsTJ?=
 =?us-ascii?Q?C79TEXk7oe8mD63MliZo2dz16NoPT+hA8eUEaj/MXn6izRyByj8WDTc4L4Td?=
 =?us-ascii?Q?FvWg0iwYRUz1qAq+BL5KALwD05cQOjygByUO0sNy5Moy2+kLWMwTnvCnH33E?=
 =?us-ascii?Q?ew6gYF7CdKfG1444PGUvvA6kJtmZsWACDQwvv2ijfVCUPTpqo+WiiiA0F7oQ?=
 =?us-ascii?Q?BLY6/8MCWK2JmC8g8PUOeGgyzd48eZXlnFiA9x0wvLg0lZTeKKOqxqCiJdgR?=
 =?us-ascii?Q?fUiqdJmiDBJL9Q/5c2ca7NaCsJj6EDvd/+XDntwIgHkplQXlhsVbQQEktxAj?=
 =?us-ascii?Q?yY5MzUfnY0hJDCb/rsQIay88tltSEPErBHNFt22kN9jB6xaFDK5yE1vj5Dtn?=
 =?us-ascii?Q?dx9x6DxMRZ/8kOztZaZ/KQDGoMtic4wGcqxmOPmj9ar2Ey9JzhTMwkQTkxRl?=
 =?us-ascii?Q?OEqyWNRiofVtJI2nBYjxNNU49bjft7RGlSVyB4qyOuzjvy+XCovPeQ29Pyyo?=
 =?us-ascii?Q?9jvo9+YCOaEfQtaVdtqW/mmpHV4t4N3ini4Q7KvcojDtQ2/U4FlW+gklT2pP?=
 =?us-ascii?Q?8DgIO8/CyldEGRJbEj5aDA1DjHl36al88mBmMVoUVY+eui333/VocHAMznMx?=
 =?us-ascii?Q?GP2TaSz6WVRYKI7rlXTnpvouXDJ8EpLiYkNMDWwAzI7WAUxp3pcpvBxSJ+Bo?=
 =?us-ascii?Q?PPUr79NGINY1ROgLRv6Hq7wihBx/ubI8g+/Ry2+Mu0Lt4sZcJpAsh2pwiu8Y?=
 =?us-ascii?Q?Vp6clbF4+Hd7p5Bxj7uAk0ODofQ1yePPMHjdvEvTs+/PtwlCcxpMNczjDYeX?=
 =?us-ascii?Q?c6ZHZ4GxOYKhDKyuA3iE4lEAeeeaF6HCXY4iuhsyWVGOX3EWN/CUZyT6EvBe?=
 =?us-ascii?Q?HbsXg0W0+NoNPRuLfPiVd7DsGu37dmXRej3RJzWj3jNF9+LQ7iU0F//CebsT?=
 =?us-ascii?Q?ycDzZqFVgMhp+nqKoMTVB7SoHCXLcU9sKbLSG6XWaZWJ5dMDXpz0oEjAVUc+?=
 =?us-ascii?Q?3ivZRElTCeYU0LPAp5hJhJd8tr45tYkNZlVRmtkK1u6mxw43OHyqQlUYawD/?=
 =?us-ascii?Q?LsXfMUJJvMzfRQKThHYbLjA/kZCQbPI/0sykJwYdWqX8laWgfxuD6KJquMIh?=
 =?us-ascii?Q?XcY6B0W+mpRBCKoCLqCqGdwbpRD+TGGQs2Kfsc6ymP6+/LWv2wfR6X5yqBpZ?=
 =?us-ascii?Q?wQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fcc10050-f967-4962-8036-08dbb91c60b8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 14:26:13.8327 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iAkX22BoTdaxOdX4EIAO8OLBbpGGldar1IUWYvYHRybaaDYpNjewcKaALLh3fyxBlTZF3B0+mVemIYpjc9m37w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7591
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 09/17] drm/xe: Rename exec_queue_kill_compute to
 xe_vm_remove_compute_exec_queue
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
Cc: kamil.kopryk@intel.com, filip.hazubski@intel.com, jakub.chaberek@intel.com,
 effie.yu@intel.com, bartosz.dunajski@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, carl.zhang@intel.com
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

