Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72355C43327
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 03:38:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2FA010E94A;
	Tue, 30 Jun 2026 03:38:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="i9HqMwR/";
	dkim-atps=neutral
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013068.outbound.protection.outlook.com
 [40.107.201.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FDCC10E166
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jun 2026 03:38:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gaY65tkX/Zk1n3GYDLNtXi28azfR1DRx+ZhFvM3O+lcsh5P+tsShDO5cpaQrQKNOg4zA55beMLByNQr30fTaPd9RhtxxxiilQPwxjIvuTGTYXP5JXOqpzQGySyvYGaslhsmiuW2bRsrcK49VBUKNN2LWdHHW5OXagn1eSIaxd567qUpM/J44lY85nU+NOZrlCMMcdYZPrO+94IXa+v3EB/fazW1TIhq4uMz9FjBkBkTdmdZA/kq134AJdBuSEGDJj9UWiXar224IZlWiDuYB2WOvA7zw+0D9xfcTiaqIAr5FRvZUbhWHZt/fjr59dasNoq3FFVPIfICd2IXCJl2/PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l7wMxMpnvXESuaXJ6s8vdF6r0Hb7tjt4Owp+PUNDk8A=;
 b=uPNLKX2fjUR5OCfZ2De5z9kyXglD0Sl+shfahkjOuBDKu3L6jjcDykjPmjF0pa1FmuoimKEhd1el+OibFagEgxD5sUH9GdYGFgj7B/Qc+3QL0dG6i4KMiVhAzEtRkp034RpjHte7+GnfvtdAEtWxNShkZCStbrqAPzr590NPAHAIl2pavOWljddsEUvmHO4km3/2OAnFzRnoF7MlKhecmWFHig+n5CehQLJOR4JcHnbToCgeq7sf4TxaxbWjH3UZg8ggZ6o4fDxm7hZWQ/3GLDf7FggRRjPSApGCZ1uN0g40NqGbvE1mZhMPcQMHacMhefEbV+bRbGzHr2B2+zvpFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l7wMxMpnvXESuaXJ6s8vdF6r0Hb7tjt4Owp+PUNDk8A=;
 b=i9HqMwR/9mXA3rmyrZyKvmh0JrQgvIcNSo218XtxBiNyKJ8TtioNzQwXX8Dsj5EHEMspe/PtAZq/8J3/iKdStqLhSqXpI3pIoQA+XDGPVKc+s/MLnztwrOzAjphWwCHPj1pmotZQwaXrh4xNrdHcK8ARb7y0AhRaC9z9DeRjTNg=
Received: from BY3PR10CA0013.namprd10.prod.outlook.com (2603:10b6:a03:255::18)
 by DS4PR12MB9636.namprd12.prod.outlook.com (2603:10b6:8:27f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 03:38:11 +0000
Received: from CO1PEPF00012E60.namprd05.prod.outlook.com
 (2603:10b6:a03:255:cafe::81) by BY3PR10CA0013.outlook.office365.com
 (2603:10b6:a03:255::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Tue,
 30 Jun 2026 03:38:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E60.mail.protection.outlook.com (10.167.249.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 03:38:10 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 22:38:03 -0500
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 20:38:00 -0700
From: Honglei Huang <honghuan@amd.com>
To: <intel-xe@lists.freedesktop.org>
CC: Honglei Huang <honghuan@amd.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v8 5/5] drm/gpusvm: let the drm_gpusvm core context purely MM
 level
Date: Tue, 30 Jun 2026 11:37:31 +0800
Message-ID: <20260630033731.362150-6-honghuan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630033731.362150-1-honghuan@amd.com>
References: <20260630033731.362150-1-honghuan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E60:EE_|DS4PR12MB9636:EE_
X-MS-Office365-Filtering-Correlation-Id: a96b2d79-244f-4a67-7b4e-08ded65901ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|36860700016|1800799024|82310400026|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: lpC+wTBpC7k+34DCb2IPconXG7MY3wab27fFrHsZedZ2QKHPhU7lBJMVR+LM70huxTWw7Qv8uugLcZBivPVmegYXEROfhLZUxhcqvIFBkp+z0VezqHMX6PUVHNPe+WqEQW3A5c4+x7RlaTXhgPRDR6WRaur5NsXc4+5BpEqBeDUu0go4zkhm/FgsZwTY3+KcDp3WfjAMrMWMvLIkOIM+RIVRp0bLdLaVApxJLi/Mcd+tqu/TcomzHkoAAMWPVAcn+n569VcMeKGyU1bxiMwERpY5Z2znPJdNJlD7rj40q/kdFwZZS77aBdmXp3NGGaq/dYUroUPVxx9QGwfzdYmIbHMbZ8xjTFhiZIh57LgqEKsTiY/PeGT/tD+Nd8uIU4WFkLuMploE5+DNn2zr6VBz3w7plsVCF8/Rn9cXeXpufVejv0u7geH3lBe3dnbkj86Jiq/8JDNHrlOxqHuj2nV/5y7S+awvLCKZqV9lfAfiWHpj7ORS7LL/D2/bBgmLTNWH30//HZxlTtgN//Wn2d7sqYzadBovNaU5/HPNgPLXrlZNQjh0qDmHts1q//kSGNT7QgyoBT+vWV6cf4UOpMkXzIQXEKLZYejI20Fq4faPdVlUPSMkhYHqXDswhOvYNxXsrPKGSDapPuXkRnAgtlBdkkPqHg35VC2AqEycNXeUlIr79KXUGz+9p8sh2knfX+GG7X8AfqrUoOj4ZzP5KzPVUg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6c1GXxdMDPB5kd+lCGN+hRJn9crN11NBkjXtrDXTdS8P2Y/FW+clIJ0aRHBlg2ZWA67fzE7DnNriuhElpb9marKLkigZ0f9LsS8gpyC724dHXof50wFB86QRIedTckZktDIf0bMZclOQUwskHxFYcwgPHvB3plF4mWv2APYeOd6bnSCOJbwiyOhw7FURweASGgW190gAekqBLTwx0iZ/IBqcL+J2mRMm5qDgu1qDJyobCCeiluz4mKBS6/SUOjA3Q7jWX/seaOoYzgIwInXBELsQPKUvmjmKniQ3zIaRaz67J9o6ErOT/qsAcRMHDGKF5dVooH3GP5a1gxoIzGW7uyHlufDKPfyEEVjR+r7yH6latXWK7rVL4+Rtzn+kOTc7NpW4ncsWmcnwtQ/449ADayAToT6GQSZlMFBeJY3qFt72FA+xPMXY+8/GZaUxLAeE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 03:38:10.4859 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a96b2d79-244f-4a67-7b4e-08ded65901ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E60.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9636
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

The core mechanism of drm_gpusvm is HMM, which is fundamentally an
MM side subsystem. A drm_device, enters the picture on the device side at
DMA mapping / GPU bind.

So move struct drm_device from struct drm_gpusvm in drm_gpusvm. Let
drm_gpusvm keep its core neutral and leave device side decisions to
the driver. Make drm_gpusvm a pure MM level object.

  - Move the drm_device from struct drm_gpusvm. drm_device now stored in
    drm_gpusvm_pages.
  - Drop the drm parameter from drm_gpusvm_init()
  - Update the xe call sites in xe_svm_init() and other callers.

drm_device does not disappear from the framework, it is
relocated onto each drm_gpusvm_pages where DMA actually happens.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Honglei Huang <honghuan@amd.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 8 ++++----
 drivers/gpu/drm/xe/xe_svm.c  | 4 ++--
 drivers/gpu/drm/xe/xe_svm.h  | 2 +-
 include/drm/drm_gpusvm.h     | 4 +---
 4 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index e0fd0b2fcc5..fcfe635bc19 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -439,7 +439,6 @@ static const struct mmu_interval_notifier_ops drm_gpusvm_notifier_ops = {
  * drm_gpusvm_init() - Initialize the GPU SVM.
  * @gpusvm: Pointer to the GPU SVM structure.
  * @name: Name of the GPU SVM.
- * @drm: Pointer to the DRM device structure.
  * @mm: Pointer to the mm_struct for the address space.
  * @mm_start: Start address of GPU SVM.
  * @mm_range: Range of the GPU SVM.
@@ -453,7 +452,9 @@ static const struct mmu_interval_notifier_ops drm_gpusvm_notifier_ops = {
  * This function initializes the GPU SVM.
  *
  * Note: If only using the simple drm_gpusvm_pages API (get/unmap/free),
- * then only @gpusvm, @name, and @drm are expected. However, the same base
+ * then only @gpusvm and @name are expected. The @drm drm_device for dma
+ * mappings is bound per-pages via drm_gpusvm_init_pages() before the first
+ * drm_gpusvm_get_pages() call. However, the same base
  * @gpusvm can also be used with both modes together in which case the full
  * setup is needed, where the core drm_gpusvm_pages API will simply never use
  * the other fields.
@@ -461,7 +462,7 @@ static const struct mmu_interval_notifier_ops drm_gpusvm_notifier_ops = {
  * Return: 0 on success, a negative error code on failure.
  */
 int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
-		    const char *name, struct drm_device *drm,
+		    const char *name,
 		    struct mm_struct *mm,
 		    unsigned long mm_start, unsigned long mm_range,
 		    unsigned long notifier_size,
@@ -479,7 +480,6 @@ int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
 	}
 
 	gpusvm->name = name;
-	gpusvm->drm = drm;
 	gpusvm->mm = mm;
 	gpusvm->mm_start = mm_start;
 	gpusvm->mm_range = mm_range;
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index d515647192e..3283b74f7d5 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -911,7 +911,7 @@ int xe_svm_init(struct xe_vm *vm)
 			return err;
 		}
 
-		err = drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM", &vm->xe->drm,
+		err = drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM",
 				      current->mm, 0, vm->size,
 				      xe_modparam.svm_notifier_size * SZ_1M,
 				      &gpusvm_ops, fault_chunk_sizes,
@@ -925,7 +925,7 @@ int xe_svm_init(struct xe_vm *vm)
 		}
 	} else {
 		err = drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM (simple)",
-				      &vm->xe->drm, NULL, 0, 0, 0, NULL,
+				      NULL, 0, 0, 0, NULL,
 				      NULL, 0);
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 1423ab2f1d6..63ea991e2cb 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -235,7 +235,7 @@ static inline
 int xe_svm_init(struct xe_vm *vm)
 {
 #if IS_ENABLED(CONFIG_DRM_GPUSVM)
-	return drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM (simple)", &vm->xe->drm,
+	return drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM (simple)",
 			       NULL, 0, 0, 0, NULL, NULL, 0);
 #else
 	return 0;
diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
index 2862104aa1b..b7d987bf76a 100644
--- a/include/drm/drm_gpusvm.h
+++ b/include/drm/drm_gpusvm.h
@@ -195,7 +195,6 @@ struct drm_gpusvm_range {
  * struct drm_gpusvm - GPU SVM structure
  *
  * @name: Name of the GPU SVM
- * @drm: Pointer to the DRM device structure
  * @mm: Pointer to the mm_struct for the address space
  * @mm_start: Start address of GPU SVM
  * @mm_range: Range of the GPU SVM
@@ -219,7 +218,6 @@ struct drm_gpusvm_range {
  */
 struct drm_gpusvm {
 	const char *name;
-	struct drm_device *drm;
 	struct mm_struct *mm;
 	unsigned long mm_start;
 	unsigned long mm_range;
@@ -271,7 +269,7 @@ struct drm_gpusvm_ctx {
 };
 
 int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
-		    const char *name, struct drm_device *drm,
+		    const char *name,
 		    struct mm_struct *mm,
 		    unsigned long mm_start, unsigned long mm_range,
 		    unsigned long notifier_size,
-- 
2.34.1

