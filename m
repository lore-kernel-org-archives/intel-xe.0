Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556ADC10F04
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 06:47:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A83110E9F6;
	Fri,  8 Dec 2023 06:47:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6329410E9F6
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 06:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702018033; x=1733554033;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=KFENgD6Z9MYWylZzPe/LuCdyYapcAtdN/7LUb75rRVU=;
 b=BaPFONPJVJFTqXVA7qop+Mel9nitWiYzXmr/fMROlqFntoGT01gd945z
 9sF82POrmO43tnZeh6SQrL6wRHD65aJanqco5PejgxVn2IAN4fN68Hflx
 rzIXMtRgefHOzz3kB/kKRbln+ZvPsGgObL7tdeyO4SxjPaVz9/b3iLpHS
 Wm4kwBgOLDC6B3YpDD/hTcdZ7Co4MEnLoTEN69HVnI2aAYNyCyIB+cePi
 cvhvDK3nXxm+wNVeuFUDcZf9Gj/5mIzvTTt0iTqMuCgfHhAQ4kbJCf8Su
 BNUijBjcFdHxKIEWBEwBNYN5nZuzJPggQKl/qNkFAliT+sZZjfghvqUub w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="397153995"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="397153995"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 22:47:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="895421074"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="895421074"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 22:47:12 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 22:47:12 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 22:47:12 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 22:47:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h9Q9uw//Ffi1dyISVcF3/v+ie7OWROKJJQ7D16QAg0NiB9zxkS1yHmKHQWBljPb2KDWqQqIic+zBRkSulUnPWVomQlauDoP7E8whRnw3iR1+XlTqtSqyRVUhrhdBuNyzgr/v9qmY9xeH5bDMd8FRWLjWJDOFECOF1TzKG+0Ig3FmNtjr7254eiRVEsF1IFZzJHrGkC3sjxhYY1Xh2nTprmTUmKa9pRX2TkVqM/S4rwu/DlKJYu9U3VzOwcNs7i+NdGtyshhPCj8ba1PTOj7B7nYjt+r07G/svivaMQ/PKzm8WhCYLyZGrb7dcqQMwwENLPSn3l3XRBV9W8xPmj2+Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0MWPJJsHzUW4rmNYzP/oypdp2suQ6p7w+PI9iw6Nf2A=;
 b=PKdOrmrA54Yc70x+q8GkBAVB0y4qihbYOJTKgGZu6NeR+h5YS4fvlmo5B9plqpDkpW0llE0DLXvFPzJmORM+CU6FvFTWZaNdCzf4ybb2qUGr8bbq0BmFyG/CnkFPGSVqBFbnq9e43Qa3Uq7qUTNuc2SYqQGxh0RY9HbQTR+0WukmPSqE8DO0AfFXBPmi4com6td5f2ql35Y54ouf3RbeTNkHLXU6Uu3JTJgg7iL9fxXLH1owIIvh7YNlIDR/nme1zQSjsrzljk2qLHLuANfrssA1HkqMjaq4FayIQ2vtZDMzZpo6MlrPB+k5S/auo1/Hs+Lsrfpx+XamsuKE7xOFZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB4831.namprd11.prod.outlook.com (2603:10b6:a03:2d2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 06:47:10 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 06:47:10 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 08/16] drm/nouveau: separately allocate struct nouveau_uvmm
Date: Fri, 8 Dec 2023 01:46:35 -0500
Message-ID: <20231208064643.877688-9-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231208064643.877688-1-rodrigo.vivi@intel.com>
References: <20231208064643.877688-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0004.namprd21.prod.outlook.com
 (2603:10b6:a03:114::14) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB4831:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a48d725-1f6f-4cc8-bcc7-08dbf7b9808b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g/vJ0oeVokHSHS0TO+Fn8iY8gH7dhK0hvfMR1lOFhwqx1UZULDM7V2F4bFVsIkF+S1bpROHWTemyAp0AnXF6rgtx90tcD7yghT5AqlEaEBWDstLynYHNzhaH475YFmgLki/w3+Sibs/eAZXHZwrkSonKMs6WpU8+Wq4MT33hZVXw7Ps0ERy4QMJauiMx6ZcboLidApiiPicfZnHBAGu9L8P/lozAaXlzG7/gcrW9Xh0YQeYtDphHF1ObYknUM1aP/IYzEFxKYIpsaDT6Z9YYMFUqHz6zg9otsDfvp99xAkSLwy+dv7OnI8uVd79z7kPfel7qjC6NdfmCTWIHIw6KgpD19F9c1zdvEw7P8bLIRPfCSQc3YpjiX5+P+N9KPenI8ojWU2f3izUaKV9KWWiI8ueQNuo/C11ZcW+Lx0H7B487YwG03VeCY21qjvA/vnURj6aEl5YnnY711hmU7/RCmFghc/gltqMrtN55YZqzDurindAnjFOPqfvkGi5LrxGvt1SeJFTqX+hh30as/PHRfXO4fySxbpnha4UmuRnQAFDCV17Rba09Gc4OHppXOwHL9Qr7ZzuSkFD9hz4h+N7NANbS1UpYZu1zkF80jG6ITGU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(366004)(39860400002)(136003)(376002)(230922051799003)(230173577357003)(230273577357003)(1800799012)(451199024)(186009)(64100799003)(5660300002)(2906002)(8936002)(8676002)(36756003)(86362001)(44832011)(41300700001)(82960400001)(83380400001)(6512007)(26005)(2616005)(1076003)(66946007)(66476007)(66556008)(316002)(38100700002)(6666004)(6506007)(966005)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Byk82QLi9gwX7FMPrsowA89qcKBO9FmDkhGVM6pa483LXZapweWpTVRn1AeL?=
 =?us-ascii?Q?OdrFTa2q7QD0HYyhyy7owBTzs9Y7UHiz8t2R2sfvySTXdlsQZyi1F3YJCzsi?=
 =?us-ascii?Q?y5WtROJggsbgwnBnQoJSCNW2ujK+LCTAcZHdei2zqG916oDCzioYNqIST1aI?=
 =?us-ascii?Q?aUEnObyzKLXaPurNKhQK9s0NK5zz7fUmJO3JpxZGkPeFPdnYX08S+T2W9IXQ?=
 =?us-ascii?Q?y1BCng17fvNhdh+7c3QpE/2TKIjvSMVvsg5XbLmPZH3YywjIOzdUGqyrexHp?=
 =?us-ascii?Q?I2sXm9a3YEQ6btfLnpYGGSp9YcWo/4aTSMkWHOFm4HeGW84riGV+MN3Bz7Hn?=
 =?us-ascii?Q?K4w90KIBP3iWA3fxM8sQrGzp74wGKr1NA2SyuF9tCkLPou9tFjEG/8IaNrhT?=
 =?us-ascii?Q?sNBBWvJSGsG9u7jMPNtvRu6i1EwvF3aZgYr3d7f4uhBRLKa+/L1D7fTJBdmi?=
 =?us-ascii?Q?PGcwR36ihlUlWdGuVTVWkjmKkRIv4TvT432YVznolW4e/85eHIPwnUlaCtIc?=
 =?us-ascii?Q?SvoMGDMwvWspzFDBCz+m1S+NtNh3P78z8eNkIg9RweVJbURE1+JfG0kzU7Bp?=
 =?us-ascii?Q?KqqnqHzXP1idgwjtDWOkWwQ1QLQBx/PaBJ9s0/dPMIg+XY4KEYLKmRda6e5T?=
 =?us-ascii?Q?ZNjUV2Yj66DmeEPP1yhQs+/1ujNzOFRJm0DtCud7g6wNda19OSPHA1OU0hW1?=
 =?us-ascii?Q?LJycgqv9kak0kUz9ZkfnnIOX4Fd2tVLQlmNPixWtir2wQwHoyFj9pExn/ooc?=
 =?us-ascii?Q?o+nXI5ot/FoVoQHlMaRrtWB1dHyG1KwmXU1KG8ud3lMuJsmh11tlR6E1+WTN?=
 =?us-ascii?Q?8FqWcWmn1tHVwZ5+yMaNSHIxSJsorcxKuML2c+No7roxkqbm+GXum1SvvW7P?=
 =?us-ascii?Q?57vXu428vH5a6FHDpgG7LP/lvMpwLzlxFMePx0e9T7CQOdL6g8SdDAnyr4kW?=
 =?us-ascii?Q?miWs/clJpFfO6tgVCkDlmgS/ZM64ILcgIcdwVyKMLCqQtM5r8Hxa4pVRjpVE?=
 =?us-ascii?Q?h+UFt/uDw/j6offdeLA7WEYpz6EeMVx2WEoRjhLc+51agZFeT7Y8/88fbSk8?=
 =?us-ascii?Q?r8t8QO37QUlaiftvBNcltKM9eVUtcEPZ+hUXKPml3R89yrvANayBi6H87bFf?=
 =?us-ascii?Q?agSJtqfpVxUCV6/2wUu/FrhJWv36/P/WPAqSvf2rHjh6z+PByG9lQ1WNfVqk?=
 =?us-ascii?Q?POp/felwgunM8bJietHSEJTED50lPawe4E8q9t/k8T5JuSVLUIESR8yEfCt0?=
 =?us-ascii?Q?ZJZh2JGM2Jx8A5mLv3xlpphGRPVacuDyDD5gYmli1P/iBDoPqGrC0ea/iJAe?=
 =?us-ascii?Q?i7OW6uvxUy1fKt0R1paMVICkVUN0Vld7nYohXhG3o//tZ3v91C0W1dIBOvhr?=
 =?us-ascii?Q?1Ww499I1/m4EIxYI+0piaY4tTPYMHtbazAR8YL81Ejio1NQeQmfgOdoXiiuK?=
 =?us-ascii?Q?zOAU9LKVvTJuBUriLNV1W/5JVtoDpMyOQ6jmzP2lLJYyyW1ikene8DuCv6NS?=
 =?us-ascii?Q?aPFsCP4tJ/8MHVgv3gxt28bcvXcHERFdeP9tyzTKOaVcKPBKmkGtKZ3SNcgQ?=
 =?us-ascii?Q?zg5nGHX3qLC1WDkegZkFO5eU71/ugZSZRYlIoeEDWns/B0X42PQ/rbHqd+Bv?=
 =?us-ascii?Q?Tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a48d725-1f6f-4cc8-bcc7-08dbf7b9808b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 06:47:10.3457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8YXCso9rwlvMFQlghHZyA/XGvxrqBZjrZKLOLjjwYRs8S1TP4hxQ551prenbps4+Z6YL+DJaquMHGvizVlpoAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4831
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

From: Danilo Krummrich <dakr@redhat.com>

Allocate struct nouveau_uvmm separately in preparation for subsequent
commits introducing reference counting for struct drm_gpuvm.

While at it, get rid of nouveau_uvmm_init() as indirection of
nouveau_uvmm_ioctl_vm_init() and perform some minor cleanups.

(cherry picked from commit 266f7618e761c8a6aa89dbfe43cda1b69cdbbf14)

Reviewed-by: Dave Airlie <airlied@redhat.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231108001259.15123-9-dakr@redhat.com
---
 drivers/gpu/drm/nouveau/nouveau_drm.c  |  5 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h  | 10 ++--
 drivers/gpu/drm/nouveau/nouveau_uvmm.c | 63 +++++++++++++-------------
 drivers/gpu/drm/nouveau/nouveau_uvmm.h |  4 --
 4 files changed, 40 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 50589f982d1a..f603eaef1560 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -190,6 +190,8 @@ nouveau_cli_work_queue(struct nouveau_cli *cli, struct dma_fence *fence,
 static void
 nouveau_cli_fini(struct nouveau_cli *cli)
 {
+	struct nouveau_uvmm *uvmm = nouveau_cli_uvmm_locked(cli);
+
 	/* All our channels are dead now, which means all the fences they
 	 * own are signalled, and all callback functions have been called.
 	 *
@@ -199,7 +201,8 @@ nouveau_cli_fini(struct nouveau_cli *cli)
 	WARN_ON(!list_empty(&cli->worker));
 
 	usif_client_fini(cli);
-	nouveau_uvmm_fini(&cli->uvmm);
+	if (uvmm)
+		nouveau_uvmm_fini(uvmm);
 	nouveau_sched_entity_fini(&cli->sched_entity);
 	nouveau_vmm_fini(&cli->svm);
 	nouveau_vmm_fini(&cli->vmm);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index e73a233c6572..7f7051df84a6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -93,7 +93,10 @@ struct nouveau_cli {
 	struct nvif_mmu mmu;
 	struct nouveau_vmm vmm;
 	struct nouveau_vmm svm;
-	struct nouveau_uvmm uvmm;
+	struct {
+		struct nouveau_uvmm *ptr;
+		bool disabled;
+	} uvmm;
 
 	struct nouveau_sched_entity sched_entity;
 
@@ -121,10 +124,7 @@ struct nouveau_cli_work {
 static inline struct nouveau_uvmm *
 nouveau_cli_uvmm(struct nouveau_cli *cli)
 {
-	if (!cli || !cli->uvmm.vmm.cli)
-		return NULL;
-
-	return &cli->uvmm;
+	return cli ? cli->uvmm.ptr : NULL;
 }
 
 static inline struct nouveau_uvmm *
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index f765e3835306..54be12c1272f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1636,18 +1636,6 @@ nouveau_uvmm_bind_job_init(struct nouveau_uvmm_bind_job **pjob,
 	return ret;
 }
 
-int
-nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
-			   void *data,
-			   struct drm_file *file_priv)
-{
-	struct nouveau_cli *cli = nouveau_cli(file_priv);
-	struct drm_nouveau_vm_init *init = data;
-
-	return nouveau_uvmm_init(&cli->uvmm, cli, init->kernel_managed_addr,
-				 init->kernel_managed_size);
-}
-
 static int
 nouveau_uvmm_vm_bind(struct nouveau_uvmm_bind_job_args *args)
 {
@@ -1793,17 +1781,25 @@ nouveau_uvmm_bo_unmap_all(struct nouveau_bo *nvbo)
 }
 
 int
-nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
-		  u64 kernel_managed_addr, u64 kernel_managed_size)
+nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
+			   void *data,
+			   struct drm_file *file_priv)
 {
+	struct nouveau_uvmm *uvmm;
+	struct nouveau_cli *cli = nouveau_cli(file_priv);
 	struct drm_device *drm = cli->drm->dev;
 	struct drm_gem_object *r_obj;
-	u64 kernel_managed_end = kernel_managed_addr + kernel_managed_size;
+	struct drm_nouveau_vm_init *init = data;
+	u64 kernel_managed_end;
 	int ret;
 
-	mutex_init(&uvmm->mutex);
-	mt_init_flags(&uvmm->region_mt, MT_FLAGS_LOCK_EXTERN);
-	mt_set_external_lock(&uvmm->region_mt, &uvmm->mutex);
+	if (check_add_overflow(init->kernel_managed_addr,
+			       init->kernel_managed_size,
+			       &kernel_managed_end))
+		return -EINVAL;
+
+	if (kernel_managed_end > NOUVEAU_VA_SPACE_END)
+		return -EINVAL;
 
 	mutex_lock(&cli->mutex);
 
@@ -1812,44 +1808,49 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
 		goto out_unlock;
 	}
 
-	if (kernel_managed_end <= kernel_managed_addr) {
-		ret = -EINVAL;
-		goto out_unlock;
-	}
-
-	if (kernel_managed_end > NOUVEAU_VA_SPACE_END) {
-		ret = -EINVAL;
+	uvmm = kzalloc(sizeof(*uvmm), GFP_KERNEL);
+	if (!uvmm) {
+		ret = -ENOMEM;
 		goto out_unlock;
 	}
 
 	r_obj = drm_gpuvm_resv_object_alloc(drm);
 	if (!r_obj) {
+		kfree(uvmm);
 		ret = -ENOMEM;
 		goto out_unlock;
 	}
 
+	mutex_init(&uvmm->mutex);
+	mt_init_flags(&uvmm->region_mt, MT_FLAGS_LOCK_EXTERN);
+	mt_set_external_lock(&uvmm->region_mt, &uvmm->mutex);
+
 	drm_gpuvm_init(&uvmm->base, cli->name, 0, drm, r_obj,
 		       NOUVEAU_VA_SPACE_START,
 		       NOUVEAU_VA_SPACE_END,
-		       kernel_managed_addr, kernel_managed_size,
+		       init->kernel_managed_addr,
+		       init->kernel_managed_size,
 		       NULL);
 	/* GPUVM takes care from here on. */
 	drm_gem_object_put(r_obj);
 
 	ret = nvif_vmm_ctor(&cli->mmu, "uvmm",
 			    cli->vmm.vmm.object.oclass, RAW,
-			    kernel_managed_addr, kernel_managed_size,
-			    NULL, 0, &cli->uvmm.vmm.vmm);
+			    init->kernel_managed_addr,
+			    init->kernel_managed_size,
+			    NULL, 0, &uvmm->vmm.vmm);
 	if (ret)
 		goto out_gpuvm_fini;
 
-	cli->uvmm.vmm.cli = cli;
+	uvmm->vmm.cli = cli;
+	cli->uvmm.ptr = uvmm;
 	mutex_unlock(&cli->mutex);
 
 	return 0;
 
 out_gpuvm_fini:
 	drm_gpuvm_destroy(&uvmm->base);
+	kfree(uvmm);
 out_unlock:
 	mutex_unlock(&cli->mutex);
 	return ret;
@@ -1864,9 +1865,6 @@ nouveau_uvmm_fini(struct nouveau_uvmm *uvmm)
 	struct nouveau_sched_entity *entity = &cli->sched_entity;
 	struct drm_gpuva *va, *next;
 
-	if (!cli)
-		return;
-
 	rmb(); /* for list_empty to work without lock */
 	wait_event(entity->job.wq, list_empty(&entity->job.list.head));
 
@@ -1905,5 +1903,6 @@ nouveau_uvmm_fini(struct nouveau_uvmm *uvmm)
 	mutex_lock(&cli->mutex);
 	nouveau_vmm_fini(&uvmm->vmm);
 	drm_gpuvm_destroy(&uvmm->base);
+	kfree(uvmm);
 	mutex_unlock(&cli->mutex);
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.h b/drivers/gpu/drm/nouveau/nouveau_uvmm.h
index 22607270fae0..f0a6d98ace4f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.h
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.h
@@ -12,8 +12,6 @@ struct nouveau_uvmm {
 	struct nouveau_vmm vmm;
 	struct maple_tree region_mt;
 	struct mutex mutex;
-
-	bool disabled;
 };
 
 struct nouveau_uvma_region {
@@ -78,8 +76,6 @@ struct nouveau_uvmm_bind_job_args {
 
 #define to_uvmm_bind_job(job) container_of((job), struct nouveau_uvmm_bind_job, base)
 
-int nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
-		      u64 kernel_managed_addr, u64 kernel_managed_size);
 void nouveau_uvmm_fini(struct nouveau_uvmm *uvmm);
 
 void nouveau_uvmm_bo_map_all(struct nouveau_bo *nvbov, struct nouveau_mem *mem);
-- 
2.43.0

