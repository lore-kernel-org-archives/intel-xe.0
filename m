Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 950DCC4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 06:47:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DBD210E9D1;
	Fri,  8 Dec 2023 06:47:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A4B10E9D1
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 06:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702018030; x=1733554030;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=FXMQt/by+OH342YF3qyqXygDyFMcxHG5CiwULfJFKPA=;
 b=NK5rCOxgvIXncuS/QeHY0aSs5SBTjbpnyO8mmCmObdHmlpE63cKDscin
 oZ/CHlKiVuLB6Z1lKVjcI1un9MqbZnwl0ogRQk02Jp+IBRfH8ydQOcSvC
 K7qyb9u3Ic3gysCF8vl1uSR3NfehCaEo9vB3rjMEdjS1AKNp9nLr6qeIM
 3esGnrcJmcTto9P0XWhdi501gbydpvx+IR8ikcVilXyMCimyETSFwN+vx
 Ofv0Y0ussCcRj5S2RyTAcREZw4hs9yfw5RvakSslCtSTRQ8lLymBR30Ga
 Ezu/FNYPVKBHfmi4KGRDrW8KrMDpKqDVXyJgxPp7fb9VwAP60dklKAb5d w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="398234948"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="398234948"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 22:47:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="945321448"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="945321448"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 22:47:08 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 22:47:07 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 22:47:06 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 22:47:06 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 22:47:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z9l1HDYhl6C913wUo3Du2oG5BzEjokbPcWE5tsqIPiQRZnlc6H/x3/VF2Drp9wV3toQ6seUuUmEfmM0lKe3S+l9DO0B9PL03Fwlo0uN4gOuEYTHRsNmDRRoOZCGFR5y6mNet3fVamymF77YKNIpW5Et11+nrhGJXywMlvUIctTr+CuGd4naFqJe9fibzvwSnpAn0n3SaTTfofwyRGSl4ofA0SRCoTJdizjyunyA5myae/VZvnu9Qj0zaEi4WSh5PMr/j/k1KlL4X8hW+kcUY3mXzmwvnwFreAQ0TwUOQIetiPjiWWO28TK0hCz8eAFVp5gaMErvoFSyZf5B1V5rX8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5YGLXkQsDPdQjL9KDDT7QFQiKg9zUUo3PL5fe2Luhuo=;
 b=iRhZ2BXd0v52ThJoYTTrgSUHnSoocf36kNIgWYJPK1jhnP7oa3Dxi+2OuLlZtmfcugWh65vLTPCgvcdPCASQyvU5w2b/8VNipZcL9DUkEg0PhzXpIWoWpYUp0ODmL6dwwoKTQaqDmy6CYAwr+fG4vIUTXo2QDfmsJLDMMQ/Fkj4Gv/AhoWLmfMKbYHVa1X4j2FW7ZoVHXEY09c5ySLa/KGhlXZA2Cmux+/gNxz84pdAwYDVsWpg5fA4R8NLn1Rxg2ykyyi3AYpOat3H82/xjV+Gt4EAMwjzV0WoHbXnVeKeHH1rmHbm5jjWLXMmW2e36JYWn19jfvAVW+mV1Y46KSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB4831.namprd11.prod.outlook.com (2603:10b6:a03:2d2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 06:47:04 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 06:47:04 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 06/16] drm/nouveau: make use of the GPUVM's shared dma-resv
Date: Fri, 8 Dec 2023 01:46:33 -0500
Message-ID: <20231208064643.877688-7-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231208064643.877688-1-rodrigo.vivi@intel.com>
References: <20231208064643.877688-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0024.namprd10.prod.outlook.com
 (2603:10b6:a03:255::29) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB4831:EE_
X-MS-Office365-Filtering-Correlation-Id: 0644b471-1334-48ee-1c12-08dbf7b97d04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +XiTqC73K8zAnCMawzbhnOhgv+c+M4i91p+gnUxf56xn1dVQDIot4Wwyt52iTDxmV/CETi+F8glINnMvtyCdWx1hUySxKYsZAeGYeauGbpMkJ+IPnmUL69qPwcxHE/NhMz+hSQnTWp3jqObT1o3YhFeOYpVl+tW+trPpWzCQekBILX9jUPHBpnynyNKGiqg09UpYPjGNhG0nZfXkCgxYQr5L6KpoxbSyXUE9EK4C3hyU4G3ihLw/ojZDMJVUMhOD2wM6v94uItRY4CJ6LDdYMroTI/wCqqROxv4kTgX70r0iU/pU7wTjFvaprFyKKibcozJlk8IHS7aNTfxGJh4GNBSHkl6olaZyZB1OtDwhdrC3SBVu2GeDpxppNv/FLgJXraR2EgPWc5PMyT5E6dDKIIHtxFPrfz/qMrTvi86KxwYEL6ddF2D+3YxCOMDWZmqp0YZSmlve9XRQKGA0ODCOwsfgTNNKl2PLpyDbTupL1y2AYTrJ4ZvkYr5PQh+1zNBBqjeVZRRgilX16cvyc5FobQIKau6LPu0bvwHkcv9T6PzvyGspQTYUaYnDUH4EYFJgUjvU2KICdyWFBGz+J6c1MBgdfVkLFq3L1SbT/uiNIh4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(366004)(39860400002)(136003)(376002)(230922051799003)(230173577357003)(230273577357003)(1800799012)(451199024)(186009)(64100799003)(5660300002)(2906002)(8936002)(8676002)(36756003)(86362001)(44832011)(41300700001)(82960400001)(83380400001)(6512007)(26005)(2616005)(1076003)(66946007)(66476007)(66556008)(316002)(38100700002)(6666004)(6506007)(966005)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8KbNX/HOSxGlLt7FVrSRcQ3xRpkIPWjjoZfU8dER0tUM6AnUJTcjAXVfqtIc?=
 =?us-ascii?Q?rEnx3YLZ/uKgp91zDfLFizJCq2YKsDXuON8LBcJYtNtJX1yXppe+Kdm8D6pn?=
 =?us-ascii?Q?s3HQRbVVFjwV4inFzrUB9UAOvPuJxl4QYh3ltpw6UCecjqtzPfHmy5DuxFz4?=
 =?us-ascii?Q?s3Wum9BSD6+Vateyhzgh9pA0BDV4T0TkjV5A9KNb2dzwYn5yJXxNQOhpJbFy?=
 =?us-ascii?Q?3qwsz/4W6yQoKzlgBf7DzpMFMDxWrOJrMP3mvOyr72uylR7Cl8bsKg36VMR5?=
 =?us-ascii?Q?f0/toitpdgjaVvsvlZxoEZZ+sXmml5xjzLdPg8yV+dIkNb+a24lPucHw5kO0?=
 =?us-ascii?Q?uRbUy1KKgJCgxwSLXqQhZLNkEefwaXTwyJPuIpgeoPYh74qPqvThqf+51Osn?=
 =?us-ascii?Q?ajtUmQYONGQhOQJb62gsA8ew3M4Cuhm/CYNGdazMnYCFqA+K5FX86OJg9CtG?=
 =?us-ascii?Q?0mEaEyT/rYcitpu9EfAuZzFTs9Z/a1xDihQ3hOWZ18TZG1w9XNERycRAqdHI?=
 =?us-ascii?Q?RE4uxyr7slX18F4kE2VXk2fg/1vYBbrBsJfVSwSoMgyrK8Sf15AhhkRbMcFy?=
 =?us-ascii?Q?nMdaotHoUQnpYYZTyeH1QwQdT9N+TMvlR5AZThba8+ADl87D3fAJwHg558Qw?=
 =?us-ascii?Q?i7+UKu5uFMpTUDOkgcHT5abcf4CFL2+asuf9ybpj+3gHL8dzV73UEr3JQsWu?=
 =?us-ascii?Q?I5RDlqiw77DUR4XCaJ0QCmClkISAzSpq7sFgL5p0nmbjbONw6Jmq3hVLyJ39?=
 =?us-ascii?Q?PfAEHzKPlJEjtxM8QOV0lP0y/Yk2bEu00HIMVYyna/rg/QXJB0hlcq6z6IXq?=
 =?us-ascii?Q?FYPt9/GRZEBemWDcnqsSR5SVPkAwDYzEAQx5YsClBNaNHjEB2GiiAoyybsI4?=
 =?us-ascii?Q?90N8iaNwb6M4vFf2kxHuColjaYILz1pwGDN70PgScbF/VtrJeTDdGt7dYy0k?=
 =?us-ascii?Q?zm6sVkPXC9BU1SJ0SaDtGBfa2ys8HneL+p81NqLAHAjaL+ajl/kQjsDCIhgR?=
 =?us-ascii?Q?c2sHwhWaOXXXNAUuRBSVOvvVBYVN2rNSrXMtFpTJzLRfSgeRMaECEHd5/Ufc?=
 =?us-ascii?Q?jUloMzEM2L2QuviTAi64+jY0r6ZFqP+9B9ocka4QY1xPg5/2kiRpp4GZ4ogn?=
 =?us-ascii?Q?Qs4/qh4eqAgXwJCieOSRRN4av/dAQcCeHmwRGDN8CRdWk6Fau3iofBMbWqZa?=
 =?us-ascii?Q?KEV1AM3XmpKHEo/A3V8kkKQr/UiMuxXQyVC1glHLYT2q4uQxN5f8SiH0+jMh?=
 =?us-ascii?Q?shO5IgUZe+bcg2unypcuF1q09xrhnh845vWcyx1tRL1ZmfA2/7PIi425IU+Z?=
 =?us-ascii?Q?+Hw5yYlm6RTJ0gnRvoN0J8yL5JnPzqKZn7g3LGSXXUW7cX38YHDnE2WB2vhP?=
 =?us-ascii?Q?bMqK3RaWqZz/c634fFxmCwxD/Pgwo/dN6YE/P1sjIxSI8VIpQnGixRWU+xzp?=
 =?us-ascii?Q?Xqb4OjRjyDXfOa/Gw6WAKS7XfE8tYJRvCZjUuelZ1lWtGbcE9u+thT/KjQBC?=
 =?us-ascii?Q?Og2yiZfuWfuXxYkDbzGoe5Htt52GRzsldbWlxJlBA9Mi/Fe7MGuTXTogM1ec?=
 =?us-ascii?Q?z9at1NzHV6uuxO14lCFbFdEt9YbCOtV1mteeRoUc54L3tNdQoSWIhmWnDNI3?=
 =?us-ascii?Q?qQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0644b471-1334-48ee-1c12-08dbf7b97d04
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 06:47:04.3359 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: syXbrvMGA0JMn5p4VHTedFfxGePh18BWCvcVLymZOaX0KS638jmFxp7+gQuoqgkbFejl50BPIYcp9K5cNxKrDw==
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

DRM GEM objects private to a single GPUVM can use a shared dma-resv.
Make use of the shared dma-resv of GPUVM rather than a driver specific
one.

The shared dma-resv originates from a "root" GEM object serving as
container for the dma-resv to make it compatible with drm_exec.

In order to make sure the object proving the shared dma-resv can't be
freed up before the objects making use of it, let every such GEM object
take a reference on it.

(cherry picked from commit 6118411428a393fb0868bad9025d71875418058b)

Reviewed-by: Dave Airlie <airlied@redhat.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231108001259.15123-7-dakr@redhat.com
---
 drivers/gpu/drm/nouveau/nouveau_bo.c   | 11 +++++++++--
 drivers/gpu/drm/nouveau/nouveau_bo.h   |  5 +++++
 drivers/gpu/drm/nouveau/nouveau_gem.c  | 10 ++++++++--
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |  7 ++-----
 drivers/gpu/drm/nouveau/nouveau_uvmm.h |  1 -
 5 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 0f3bd187ede6..7afad86da64b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -148,10 +148,17 @@ nouveau_bo_del_ttm(struct ttm_buffer_object *bo)
 	 * If nouveau_bo_new() allocated this buffer, the GEM object was never
 	 * initialized, so don't attempt to release it.
 	 */
-	if (bo->base.dev)
+	if (bo->base.dev) {
+		/* Gem objects not being shared with other VMs get their
+		 * dma_resv from a root GEM object.
+		 */
+		if (nvbo->no_share)
+			drm_gem_object_put(nvbo->r_obj);
+
 		drm_gem_object_release(&bo->base);
-	else
+	} else {
 		dma_resv_fini(&bo->base._resv);
+	}
 
 	kfree(nvbo);
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.h b/drivers/gpu/drm/nouveau/nouveau_bo.h
index 07f671cf895e..70c551921a9e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.h
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.h
@@ -26,6 +26,11 @@ struct nouveau_bo {
 	struct list_head entry;
 	int pbbo_index;
 	bool validate_mapped;
+
+	/* Root GEM object we derive the dma_resv of in case this BO is not
+	 * shared between VMs.
+	 */
+	struct drm_gem_object *r_obj;
 	bool no_share;
 
 	/* GPU address space is independent of CPU word size */
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index a0d303e5ce3d..49c2bcbef129 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -111,7 +111,8 @@ nouveau_gem_object_open(struct drm_gem_object *gem, struct drm_file *file_priv)
 	if (vmm->vmm.object.oclass < NVIF_CLASS_VMM_NV50)
 		return 0;
 
-	if (nvbo->no_share && uvmm && &uvmm->resv != nvbo->bo.base.resv)
+	if (nvbo->no_share && uvmm &&
+	    drm_gpuvm_resv(&uvmm->base) != nvbo->bo.base.resv)
 		return -EPERM;
 
 	ret = ttm_bo_reserve(&nvbo->bo, false, false, NULL);
@@ -245,7 +246,7 @@ nouveau_gem_new(struct nouveau_cli *cli, u64 size, int align, uint32_t domain,
 		if (unlikely(!uvmm))
 			return -EINVAL;
 
-		resv = &uvmm->resv;
+		resv = drm_gpuvm_resv(&uvmm->base);
 	}
 
 	if (!(domain & (NOUVEAU_GEM_DOMAIN_VRAM | NOUVEAU_GEM_DOMAIN_GART)))
@@ -288,6 +289,11 @@ nouveau_gem_new(struct nouveau_cli *cli, u64 size, int align, uint32_t domain,
 	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA)
 		nvbo->valid_domains &= domain;
 
+	if (nvbo->no_share) {
+		nvbo->r_obj = drm_gpuvm_resv_obj(&uvmm->base);
+		drm_gem_object_get(nvbo->r_obj);
+	}
+
 	*pnvbo = nvbo;
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index f74bf30bc683..8977a518de96 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1802,7 +1802,6 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
 	int ret;
 
 	mutex_init(&uvmm->mutex);
-	dma_resv_init(&uvmm->resv);
 	mt_init_flags(&uvmm->region_mt, MT_FLAGS_LOCK_EXTERN);
 	mt_set_external_lock(&uvmm->region_mt, &uvmm->mutex);
 
@@ -1842,14 +1841,14 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
 			    kernel_managed_addr, kernel_managed_size,
 			    NULL, 0, &cli->uvmm.vmm.vmm);
 	if (ret)
-		goto out_free_gpuva_mgr;
+		goto out_gpuvm_fini;
 
 	cli->uvmm.vmm.cli = cli;
 	mutex_unlock(&cli->mutex);
 
 	return 0;
 
-out_free_gpuva_mgr:
+out_gpuvm_fini:
 	drm_gpuvm_destroy(&uvmm->base);
 out_unlock:
 	mutex_unlock(&cli->mutex);
@@ -1907,6 +1906,4 @@ nouveau_uvmm_fini(struct nouveau_uvmm *uvmm)
 	nouveau_vmm_fini(&uvmm->vmm);
 	drm_gpuvm_destroy(&uvmm->base);
 	mutex_unlock(&cli->mutex);
-
-	dma_resv_fini(&uvmm->resv);
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.h b/drivers/gpu/drm/nouveau/nouveau_uvmm.h
index 06a0c36de392..22607270fae0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.h
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.h
@@ -12,7 +12,6 @@ struct nouveau_uvmm {
 	struct nouveau_vmm vmm;
 	struct maple_tree region_mt;
 	struct mutex mutex;
-	struct dma_resv resv;
 
 	bool disabled;
 };
-- 
2.43.0

