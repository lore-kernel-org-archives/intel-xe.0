Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561D9C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 06:47:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D79810E9F4;
	Fri,  8 Dec 2023 06:47:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C036B10E9F4
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 06:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702018026; x=1733554026;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=sHAV5jqIedTlmGPcH4/jcJAg7kSvzPZcJ1wOTx/ttMs=;
 b=atA6BxcEA2zfCPWNfu9yzQNZhP/WtBkanR1eMKm69lbNrEvaM2e7S+/Z
 ECjL3OhfTLKUH6Cz5zirxBvcpbmJDcF1vG6eZ0kBBPK/JfirCUNe7cOPu
 CpyRCa9GOblAazzrQgdTuMziPfKpFFfxLd6vbyZpK6kRJMbNKvzA9UGxR
 3OLTvyKy7a5+4zEDy5BXvOG8U7sNBGJhaBmxGzUKqVjhMYHxMVCIwpoeN
 zWqZOX3UPixp1wU3bMTfvXSarm9tIrAIJ8K3cxLeptspd+I1+0vl4OYDr
 lWZSasFGaZKzbaSabLP6YPd+hry0sMKE7/eFAynXsGfx2Y5QvCRrK8AbJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="460844192"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="460844192"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 22:47:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="765386952"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="765386952"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 22:47:04 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 22:47:03 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 22:47:03 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 22:47:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TC95tqfoLFGzXRkm2K8O8uSsGRovIRmLm6vfHmDvVgGQGU6evkjhi5M5bu8v5fPpELWwNlQEk8KqDw3kdYyUKw+8Ee4v2IkOHxeTjYsyEXpGHQKwtMzBUa71wGwIpIwHM7BLVXz1PjxqygY34j8b0a4FRsTbqUuHq/ErGnBPDTjnuEmO2P4ZL67MME2rGj6EtrHfxBePfq1263TnIHpDS0zkWetpt42UfgyfzoDVyaTiR6YlKqSftXWujK1QeFi3TFvbHJo5rSTjANT6gTpbca/sg9fkAc7QRR/mv5A9OktSjqvWYt213kjBGIgn6B2ergcKngdYX+atHpt1WEhItw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BlQAdSCnEhaYIn+47hxIp733pMM5MHtUwPl/OIpVT9o=;
 b=B3GUUufI7ddCSI/MZ1B4YwKMOigb7pP7+TMs3nXNXB61jj00gzSXnCTBGJQ6BAD1F9Kffn0g6RWSAUghsgTY66OOgQB4HJ27fCkPXIMtqy51bE+bcvyQGqTJ0Ccx4g+IDX6vc4dmVUE9lOnD/zh/oHvlgEWBDV4WiLEA5xipEzmTswuXlOXYYcGkMi7KCOIxjNGCtvtcFXB2Gq97SXybHV+Z8fD8Phenr/VY3o7h9bQVpjCxh55Dn3VOgpIH9uL9HlmF4i5VfxSidu3Fcq/uRatiQRtw22LY+tPQv2smfpdaNc2dhhxcR2Cw2U5pXydj8iws8jAzRPvfzN+MdkMCiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB4831.namprd11.prod.outlook.com (2603:10b6:a03:2d2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 06:47:01 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 06:47:01 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 05/16] drm/gpuvm: add common dma-resv per struct drm_gpuvm
Date: Fri, 8 Dec 2023 01:46:32 -0500
Message-ID: <20231208064643.877688-6-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231208064643.877688-1-rodrigo.vivi@intel.com>
References: <20231208064643.877688-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::34) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB4831:EE_
X-MS-Office365-Filtering-Correlation-Id: 28388487-c4dc-428a-3000-08dbf7b97b14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g5P3J7Bgt9FaU4L0URAv7ZWHpD+zTfBTyyGVvUY7rYs/86Z844uPm8vDXhCbgP8tFju5BJYhdEhznIv0xjIykDUtrBFH7eEc9/85SKjDPb2HNcVWNztiSvOWO5mWIFXHGAg1Ok05ka1E+TXpYGJViIAIZiydwOKCmMwc5GkBnKQFTsd1AglEwzTnIabK5WM3f5KMYRI2NuxippEP8fL+PJAp9a/hjUU6tqNy9TAZS/8GxiojrMqhU76mrNVnCHiQr4e+8vBc083XyFGwiBPS8+PewXZwJhJlkdqHIquxVgoZgRS/TVdy0Zp4Vl5h0QAhJzPlOTrCngsMmkvy5cTRsaWJcDgiZVyKKp9Md8wqgUjJR+4Cj5HyJAPCfylXij9mHuN1S+SyIoE/REaamv0k8fHuNvsPv/QnmzgApwntWxztHMK16brQk7SGLkwiuYNk82TWIEEBlESsOTZFttP9NyjGSMmCU8tcGp9R9bhihZ5a0KwAPoUU+0GRxI+fQna0q+zDsVYBJKrJusdkzOY4rcxHrhUj4FSG8readUZdov/balMvSxJQBOmgKzv3oY8CvElCKA5FVCR1rg7OKU4Qc4u5wJKD7ADu5vn8WkGcZIc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(366004)(39860400002)(136003)(376002)(230922051799003)(230173577357003)(230273577357003)(1800799012)(451199024)(186009)(64100799003)(5660300002)(2906002)(8936002)(8676002)(36756003)(86362001)(44832011)(41300700001)(82960400001)(66574015)(83380400001)(6512007)(26005)(2616005)(1076003)(66946007)(66476007)(66556008)(316002)(38100700002)(6666004)(6506007)(966005)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnlLRzZvNjBPU291RjRPQ1d1Z3hGTHlsR1NGSWFSdjhKaTRycEFGaEpIK0Z0?=
 =?utf-8?B?dVEyR292TXo0TjJDS2ZtU2Z1TW5PM0tOYU95bXhWTC9jTC80Mmp4eFRtakdn?=
 =?utf-8?B?L1lxanQ5TmVoNlo5Zys3ZnVOVmYrZEtyRGhicHN5VkhrdlBDR1ExSS9aQVlz?=
 =?utf-8?B?SGtVcjI3djArZmRpdFJMZDd3M3BoUUk5eFA5OHJXL0ltTVlKWUszd3h0S3lU?=
 =?utf-8?B?ckJXT3Rad2hZTGNHaWpRQXdDV1A4ZEg4QnBNbHZiNFJuQzlYQVBlalZHKzNl?=
 =?utf-8?B?UGpoZTB2VzJaRnc4NlZsVTNWcUZ1bWlqZ0tvWUdDSlFCRUdvN1Qyci9XUkZF?=
 =?utf-8?B?REh6VjlPbzBKaWRJTDAwWEp2czdIeGY0enRiTFduUUFYZEtianFrMHFjK1lL?=
 =?utf-8?B?cWFLUDhMNHN3eDFMN3BwVUYrdVFRWFVhQmM3L3laRlNGdmgwU2dTOWJNaTdu?=
 =?utf-8?B?bk1qWDJDbURUVUtaRjZzWmtOMldNQndMZ0k2U0dhemVHaTdGT1k0b1doa0V2?=
 =?utf-8?B?WkVkTm80NHNCV3hZRnU4WkpLWEs1ODF3UzBIZFAzUUtZRkFTRHRnK3VldURy?=
 =?utf-8?B?ZG0ranFXMUx1RmlDQ1A1TVNPMjdRaFg3VXFQS0t4dFFQc3R6UEZuYTduMXRQ?=
 =?utf-8?B?dVRSVXhOdFVJRTF1Q3g5bktuWDl0MnJWOGttZ1h3ZVpnK2hpZXhMS2hqNnQw?=
 =?utf-8?B?bklDWElFcFdoZkI3eE4wRUVIditPS2xrcGNSM3dIdDJHOW1qaVppZHhWWmJt?=
 =?utf-8?B?R1lock4zT29UcTBhSWN0aFBWREYxWG9IT1NGTkplZVJqTnpMTUJjTVh3cnhN?=
 =?utf-8?B?aVdNODlnV3kwM0N6aFp5WkRmbmo4anVlSm83d1JwSVgyKy9qZHRKcUJpQTVP?=
 =?utf-8?B?RmFDNmxtSFdGWXpjd0VUcVZKV3ExbVZuN2g1Z0U1UlJxWmo2S2ZuRjNES1Ni?=
 =?utf-8?B?NmJaV2puYkNHQ1lZSEtWcFZNbldoTksrZDlzc2Z3U0l1NG5yV0JSZXRPZldZ?=
 =?utf-8?B?TDAzTmlEWW9PeVlibGg0TlkybU9ub1Q3aFlNTWU3NmNSWWFlTEZSSHRTQnBh?=
 =?utf-8?B?aktRelVVZy9aczJYWTR6SWtSam8yN1hhUUtHQXdZQ1BqTkROQldyejA4S2ZY?=
 =?utf-8?B?RnFiRWxSZ0EvazVTb2hCL1BieHNDdVFudmE2REF5Nzh6SVBqOTJhZEdPMmFG?=
 =?utf-8?B?WkVmb0VZYWVWSjBqR3JGb2h1bWNyMkJxb1ByVVM5WjhWSHlpalQ2Zkpwc0ZT?=
 =?utf-8?B?bWFUNGMveWxUVWovelNiaVpqNGZWR0ZUUVZVZ01xUnQxcHVsSWRsSHJISGVU?=
 =?utf-8?B?UFdhZ2MyZ21RUlc2TlZCaFdaVndLcmU5Vm04U28vTmJjWkZNMlpqOWpRNGZR?=
 =?utf-8?B?WXord0RYbnNGK200NFFxTE45NmQwR0lUckx4OFpOVTZkMVAwYWxxZkpHekhT?=
 =?utf-8?B?Uk9Ua21MdHlTNUN1WXpQSkFyVDBMYXRJd0RMTWgxdVkvd0psVDR0b25FTUJV?=
 =?utf-8?B?KzFPWTlxbEhybzlWbDUySUV0VFVaNmw1b2dTSGdrd05qT2hEUXhqRTRDeExS?=
 =?utf-8?B?SlY0UjdJelVJa2c4U0ZqQ0JSa0pidnROMkxzaitFMnR0eUNuaUo0bkprQjBv?=
 =?utf-8?B?Y1hlenpaajVCdXF2OHVyRlpicXZ2ek5UMXNJRVFPSzArQlFTRXExSHpKVHV5?=
 =?utf-8?B?Z2RnZGU5S295NDJjVnRuMHZkNjF6Q3VLbER6OUhvTlAxTCs2MnNGVWR0c2Vj?=
 =?utf-8?B?TkJ1RHNHTWNRaVVxSTltYWNPY2lhV0poeGFXZVZReE1UYXFZazhHRXdRdFNU?=
 =?utf-8?B?RDNzcU5xYVF1Y0ZhYUVWRmp1ZU9jaEhkL3lhYmNJM28vdENpdWc2YU16STVI?=
 =?utf-8?B?ZHczRnNJWHVLNkJMd2I4K3RQNVBJOGVtRFB4MzlEdmNXaVI0amllOStwZnhI?=
 =?utf-8?B?MlVpYWRMSkRoOTFNK290WmdwNnYrcG1GNVNzK292ZSt1M2ViUjVIQ3MwdEVa?=
 =?utf-8?B?QXVoMWNTcmVwRUdJYVN3cTM5QkVRV1BVdHMxdm1sM1dWcFlvOERHVmdJd0h1?=
 =?utf-8?B?TzZ5eGpJTUpPaDlDUFdQSW56R2FxRkpJdkFDQXFKQmpCdXdzRnRvUVl0VWlY?=
 =?utf-8?B?dXV5eVMrNkdsNjVQcEp4a0x1M0M5VGJZUHNpcmlyaTVXSEtKVCtncyt5bThk?=
 =?utf-8?B?Qmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28388487-c4dc-428a-3000-08dbf7b97b14
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 06:47:01.2194 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LDKB9Qwdyq2J3OmG7JxEt7s4mSuR1ReerG/EXhboCCrL2RKrRvIHaErozrntLcoJ24lnk2KvRqtyMCt3ZGfADQ==
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

Provide a common dma-resv for GEM objects not being used outside of this
GPU-VM. This is used in a subsequent patch to generalize dma-resv,
external and evicted object handling and GEM validation.

(cherry picked from commit bbe8458037e74b9887ba2f0f0b8084a13ade3a90)

Acked-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231108001259.15123-6-dakr@redhat.com
---
 drivers/gpu/drm/drm_gpuvm.c            | 53 ++++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_uvmm.c | 13 ++++++-
 include/drm/drm_gpuvm.h                | 33 ++++++++++++++++
 3 files changed, 97 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index dd46d14fd3e6..594ebcab5a4b 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -61,6 +61,15 @@
  * contained within struct drm_gpuva already. Hence, for inserting &drm_gpuva
  * entries from within dma-fence signalling critical sections it is enough to
  * pre-allocate the &drm_gpuva structures.
+ *
+ * &drm_gem_objects which are private to a single VM can share a common
+ * &dma_resv in order to improve locking efficiency (e.g. with &drm_exec).
+ * For this purpose drivers must pass a &drm_gem_object to drm_gpuvm_init(), in
+ * the following called 'resv object', which serves as the container of the
+ * GPUVM's shared &dma_resv. This resv object can be a driver specific
+ * &drm_gem_object, such as the &drm_gem_object containing the root page table,
+ * but it can also be a 'dummy' object, which can be allocated with
+ * drm_gpuvm_resv_object_alloc().
  */
 
 /**
@@ -670,11 +679,49 @@ drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm,
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_range_valid);
 
+static void
+drm_gpuvm_gem_object_free(struct drm_gem_object *obj)
+{
+	drm_gem_object_release(obj);
+	kfree(obj);
+}
+
+static const struct drm_gem_object_funcs drm_gpuvm_object_funcs = {
+	.free = drm_gpuvm_gem_object_free,
+};
+
+/**
+ * drm_gpuvm_resv_object_alloc() - allocate a dummy &drm_gem_object
+ * @drm: the drivers &drm_device
+ *
+ * Allocates a dummy &drm_gem_object which can be passed to drm_gpuvm_init() in
+ * order to serve as root GEM object providing the &drm_resv shared across
+ * &drm_gem_objects local to a single GPUVM.
+ *
+ * Returns: the &drm_gem_object on success, NULL on failure
+ */
+struct drm_gem_object *
+drm_gpuvm_resv_object_alloc(struct drm_device *drm)
+{
+	struct drm_gem_object *obj;
+
+	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
+	if (!obj)
+		return NULL;
+
+	obj->funcs = &drm_gpuvm_object_funcs;
+	drm_gem_private_object_init(drm, obj, 0);
+
+	return obj;
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_resv_object_alloc);
+
 /**
  * drm_gpuvm_init() - initialize a &drm_gpuvm
  * @gpuvm: pointer to the &drm_gpuvm to initialize
  * @name: the name of the GPU VA space
  * @drm: the &drm_device this VM resides in
+ * @r_obj: the resv &drm_gem_object providing the GPUVM's common &dma_resv
  * @start_offset: the start offset of the GPU VA space
  * @range: the size of the GPU VA space
  * @reserve_offset: the start of the kernel reserved GPU VA area
@@ -689,6 +736,7 @@ EXPORT_SYMBOL_GPL(drm_gpuvm_range_valid);
 void
 drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
 	       struct drm_device *drm,
+	       struct drm_gem_object *r_obj,
 	       u64 start_offset, u64 range,
 	       u64 reserve_offset, u64 reserve_range,
 	       const struct drm_gpuvm_ops *ops)
@@ -699,6 +747,9 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
 	gpuvm->name = name ? name : "unknown";
 	gpuvm->ops = ops;
 	gpuvm->drm = drm;
+	gpuvm->r_obj = r_obj;
+
+	drm_gem_object_get(r_obj);
 
 	drm_gpuvm_warn_check_overflow(gpuvm, start_offset, range);
 	gpuvm->mm_start = start_offset;
@@ -733,6 +784,8 @@ drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
 
 	drm_WARN(gpuvm->drm, !RB_EMPTY_ROOT(&gpuvm->rb.tree.rb_root),
 		 "GPUVA tree is not empty, potentially leaking memory.\n");
+
+	drm_gem_object_put(gpuvm->r_obj);
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_destroy);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 641a911528db..f74bf30bc683 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1797,8 +1797,9 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
 		  u64 kernel_managed_addr, u64 kernel_managed_size)
 {
 	struct drm_device *drm = cli->drm->dev;
-	int ret;
+	struct drm_gem_object *r_obj;
 	u64 kernel_managed_end = kernel_managed_addr + kernel_managed_size;
+	int ret;
 
 	mutex_init(&uvmm->mutex);
 	dma_resv_init(&uvmm->resv);
@@ -1822,11 +1823,19 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
 		goto out_unlock;
 	}
 
-	drm_gpuvm_init(&uvmm->base, cli->name, drm,
+	r_obj = drm_gpuvm_resv_object_alloc(drm);
+	if (!r_obj) {
+		ret = -ENOMEM;
+		goto out_unlock;
+	}
+
+	drm_gpuvm_init(&uvmm->base, cli->name, drm, r_obj,
 		       NOUVEAU_VA_SPACE_START,
 		       NOUVEAU_VA_SPACE_END,
 		       kernel_managed_addr, kernel_managed_size,
 		       NULL);
+	/* GPUVM takes care from here on. */
+	drm_gem_object_put(r_obj);
 
 	ret = nvif_vmm_ctor(&cli->mmu, "uvmm",
 			    cli->vmm.vmm.object.oclass, RAW,
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index ed766dd9d96b..59b32c5b7d16 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -244,10 +244,16 @@ struct drm_gpuvm {
 	 * @ops: &drm_gpuvm_ops providing the split/merge steps to drivers
 	 */
 	const struct drm_gpuvm_ops *ops;
+
+	/**
+	 * @r_obj: Resv GEM object; representing the GPUVM's common &dma_resv.
+	 */
+	struct drm_gem_object *r_obj;
 };
 
 void drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
 		    struct drm_device *drm,
+		    struct drm_gem_object *r_obj,
 		    u64 start_offset, u64 range,
 		    u64 reserve_offset, u64 reserve_range,
 		    const struct drm_gpuvm_ops *ops);
@@ -256,6 +262,33 @@ void drm_gpuvm_destroy(struct drm_gpuvm *gpuvm);
 bool drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm, u64 addr, u64 range);
 bool drm_gpuvm_interval_empty(struct drm_gpuvm *gpuvm, u64 addr, u64 range);
 
+struct drm_gem_object *
+drm_gpuvm_resv_object_alloc(struct drm_device *drm);
+
+/**
+ * drm_gpuvm_resv() - returns the &drm_gpuvm's &dma_resv
+ * @gpuvm__: the &drm_gpuvm
+ *
+ * Returns: a pointer to the &drm_gpuvm's shared &dma_resv
+ */
+#define drm_gpuvm_resv(gpuvm__) ((gpuvm__)->r_obj->resv)
+
+/**
+ * drm_gpuvm_resv_obj() - returns the &drm_gem_object holding the &drm_gpuvm's
+ * &dma_resv
+ * @gpuvm__: the &drm_gpuvm
+ *
+ * Returns: a pointer to the &drm_gem_object holding the &drm_gpuvm's shared
+ * &dma_resv
+ */
+#define drm_gpuvm_resv_obj(gpuvm__) ((gpuvm__)->r_obj)
+
+#define drm_gpuvm_resv_held(gpuvm__) \
+	dma_resv_held(drm_gpuvm_resv(gpuvm__))
+
+#define drm_gpuvm_resv_assert_held(gpuvm__) \
+	dma_resv_assert_held(drm_gpuvm_resv(gpuvm__))
+
 static inline struct drm_gpuva *
 __drm_gpuva_next(struct drm_gpuva *va)
 {
-- 
2.43.0

