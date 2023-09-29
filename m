Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E063E71D33
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 21:02:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E0B10E13D;
	Fri, 29 Sep 2023 21:02:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E22110E13D
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 21:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696021330; x=1727557330;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=sVW8z+dndP0hyw5hSdQ36DQ5AieXTRrI1YSxvLtCv6c=;
 b=Gko7q5qx8dSeimLRunqX4sAyHVUNY9ryf7osDrhxzkmR4+FrAI1DW2jD
 ajzIadF1DVoPEnV9x+mlDQ6CqiwNn0zmSR1QmYGHcE17qGbXXqg9cmkUM
 jh3kCufeGsbJ2693SOYIK9R0jAeTQHA4Se4tvt1Ckmi59a95rW3UimXiX
 fKDIjkG1cl4f+0EFwgalpLbojN9bw1vp3P/BWS03AvLJzo1/HTJEV8GQ9
 0fIxFxQxU3tGZW2CNHN6Z/NV1DsdfVLA4WLKNrB7fn6In98u7T20DX5fj
 muJZAVrP5thnvLNwSqlERiGv/ixJKOee34yLvyGjTywO3ofAVTgUUlV20 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="413281557"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="413281557"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 14:01:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="865831668"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="865831668"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Sep 2023 14:01:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 14:01:37 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 29 Sep 2023 14:01:37 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 29 Sep 2023 14:01:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M0f10OtIrvD4NAv3MBf4k8tYdJ+5/4RHZx5L726hsDJiCp3dBPM9zfPbilwJL+avAV8IeiZJshGD19ItUS7Lejx2FPym8QuBw5MdwfcgtlOgTXEELanEta5ffGmw89agdCDiTbtGNL4TOtkx0lV9epyZf2/2HSm0TjCenWky9TutCP5xzf+y7brbvb1ENQVkuDpu2Q+yYPtFILI+wsLzddMDH23sC5HlARO07gPrBqqr7GrNqYyNRCZFUkz4uFgxs0K5TTbSQ3ho1sRJVMZOmgNqxXUaC08MoIeGFF2KSwG7mC1FYpjeURxBNncuwMsqkfedkTEjs1CZ5OzH5PMUiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KYpEjGA4Kj4uq2O2axj6u2+C+VYoNV74OBQAdF8tbCU=;
 b=DK1ClcqtDMnGsgnIHivPuU/BXsNG9GhxP0I9ao+aejBqCJZL2ml41WIOMRP0oUTsm/sOCrNOtOFBe+b+PxmN5oQ95zhButff1f0PF2G1mx96HkB2sN4r+rjtJyAVIeR21+igvs9gpe4HebXsP4KmTcSlOJjwRijRqBCsmLvIRodQfLQLYhToxYvvjFLaHvXsuKXi0Z1aVCOI1r6OU+UKXUhriEior22opUZHlfWtxQrJZ3PxA2/Mlv7zk3oGvY8dn4HLUdgj29zwMoyEDBMjLtgV8MS9W+Vo3NQwb5wchSAzVH58SwB0J06m7bRwUFRpGhNht7LXPStnQC1iFaRNiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB6922.namprd11.prod.outlook.com (2603:10b6:806:2a9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Fri, 29 Sep
 2023 21:01:34 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6813.017; Fri, 29 Sep 2023
 21:01:34 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 29 Sep 2023 17:01:26 -0400
Message-ID: <20230929210130.1203203-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0029.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::34) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB6922:EE_
X-MS-Office365-Filtering-Correlation-Id: 7993a3d5-68c7-437d-4f19-08dbc12f43ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nygDPYy90toN2taAdAGacKv3qpBxMQ/aOQGdpV30ehTW7ycRrTKAQMXnghsVvkXkiGbiJOfOQrdUi0NacmY4ytYfTdBOzG/Jhe4f2FaZEr2WFXf6xNxs+Eeu6le6/bBZf0fe4ZnJcnZNgRNSzGGNndxk+fVQwuljSsuXtW87GxMb3PULWah0VKsTfHzr18moTofq11arLwBGJXP50xVlhlqvRfp/E85UsV9i7DPdPogWcQTDBEh3XYnvbdJFngD3TvpgyhcF8OG1bQiORme0u6w9aa08g6wd7YZENMHB48Jh7B4KRCOGXrMXh23ZnzCL/g248/JysPrWknm/NUokfLMqi+wvODKm/KfDO8VlrUwOw1IBrmQJ8hYR95kizlGyv+ME2rRERszK139Yp/PxYR629HJY3C9L8NgyybDzoNA836mr7NevNQgcqzpdIGigEHNLZeD/FW4yXdkrDHImaZRdNTO/e+MVWzMBJ3mHyTjz147c3ru97rHN4fRCe1fUD5B91nyDUMSvwrWpJTu5984zXCBqeyNB4Xi22HWUSlpDZZ3Wb3pPTdNYtMeHBzSb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(396003)(39860400002)(366004)(376002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(2906002)(1076003)(6666004)(30864003)(5660300002)(38100700002)(36756003)(6486002)(6506007)(6512007)(6916009)(107886003)(2616005)(41300700001)(26005)(66476007)(82960400001)(66556008)(66946007)(4326008)(8936002)(316002)(86362001)(8676002)(83380400001)(478600001)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGZtR3dOM0lnTU1mMU5iM0t5U1dmbG9yeGpxRm5XcWY0aTd4ZTNjTDJWVHZr?=
 =?utf-8?B?L3k3VHBoZ0U3TzJqZkEvYlZsTDFjempoMzdqc1JLUVVUNTdzUlpCcUxRNm40?=
 =?utf-8?B?SlZMbkp2YUF0M2IvWUtLS2FLUG9wYk5pL25pai93VnFNZjMrc0tVY1V3WGgx?=
 =?utf-8?B?aCtDa3piaTNybW9TWVNFQ2pRdVQ0SzQ0ekJ2RDJpZU5xQnUvN3ZtTGl3VWtm?=
 =?utf-8?B?SjE4dG0zRkRZeDI4N1U2cnN0RVVPM2s1MWZ3MCtsQkhqS1FTSXdmUzJVbUJS?=
 =?utf-8?B?V0RBZ21LekNrcGRsL1J2WlRZNVo2QUplRDUyTkR3WkxseFo0QWQ0ckIwRTRw?=
 =?utf-8?B?UWZYbFo4RGFDS2x6ODZDVXVYdGRtcGZlQnNONDZSTjg1QzlXSVJreXdUeENu?=
 =?utf-8?B?ZkFlZVpYeDBrdGN2MytVMFd2TUh1Qkx4WTF6Y0tkZ25tUTBGOVZIcytCRTJm?=
 =?utf-8?B?MElreURVUXM3NTd0UDkxSTkzTEU4QW1tdHNUMmVkM3gxQkdPTXVuNHlxSU5C?=
 =?utf-8?B?NmUvbkF1TXdzZkNrc1lpL2UvdmxCL0ZybW1qMFhTOVBES3pXdXVhS0pYKzFp?=
 =?utf-8?B?TGcreVFlRmNHdFEzUkRPTmU5WVFoaWtUSjhWK1lYdm9oZVM4bDBIR0NIdlEw?=
 =?utf-8?B?RG1KMXJCbGs3WHEzQ0k4T3RnUjFtZXZ4VlZNTE9CY2pTdmRHZkhmMFgvZFpS?=
 =?utf-8?B?dlBCMktGb2VUM0V0UktpaDlBK0pheXZPdjFPbC8vZ0h6b2kyNnFlUUJUY1dp?=
 =?utf-8?B?TWMzRnVJQmIwejlhZ2NZRS9mQXNCMWNxOGFOcHB0MExHTFBYb2FPbEtnMWNU?=
 =?utf-8?B?Y3Z0Q1BPRWxtWURidTljMjVkT2dSelRSWWJiaGwrNW1LSkIyNDUrY2k3K0lZ?=
 =?utf-8?B?ZmlJcGVFMEZsWUlDRE1sWURGS2lYZTBGaG5XenFONWJKOE1zdFl4bUhMVVpG?=
 =?utf-8?B?ZlhxcnVCckRHTFlZYWlKVDA1UjY1M09CMC9GSXFoWDlRV0p1S2NmdXhKbk1D?=
 =?utf-8?B?MG9hbG9GNTFzTGl6eHNSQU9IYWpMM0pXQjRtbmdKb1ZCaUdwMHpPUExaMHFh?=
 =?utf-8?B?RHJNWVp5TlA1T0xnZ3dwUHQyR002RnVHd2RRNjJZaEJSL2Z2ZWlJL1Bkc0ph?=
 =?utf-8?B?ZFNXbHdEc2RXaWRyeHBNeXVtTkc5aWNWbGpleGJLTWFzWUx1RG5YTG5WdnpC?=
 =?utf-8?B?V2ZGZlBmUlRnQ1ZlVTVUa1pSQTJPTkg4aTQ5dlMxMU9OUTRxVkErYnZJUzFJ?=
 =?utf-8?B?TXhCUjBsSWU3RW5Hdjl5UFFzb25jOFdTOElmZmE3aUJ1K0tuNjFmc0VmRmk3?=
 =?utf-8?B?T3d4M2tUalYzUXhSZ2QrdTJyRENZUTFHS05ieXBvYmdMZ29MVnU1dDNDaVdE?=
 =?utf-8?B?alRnQlBvaG1MRTFmbjcycks3WVNmeUluTnE0QjZjSk85L0JNOEJvOVM2ZlVU?=
 =?utf-8?B?SjFlMDB6ZG9KM1BWMVB4UVdJVnRZMHVGcmMxZVhzRE05SXJTVXMrelFHanJv?=
 =?utf-8?B?ZWM4bFVWUGZoeTQ1MWNrNk01TDd6cTBwSkhMV2hxMVA3RjlndU5DNVFtV2lH?=
 =?utf-8?B?MzBnT2cwVzF0N3liQ3lCSUJmcmRZTmUzTHBvbnFnVFhJYVJOUU5xTlFMV3Bz?=
 =?utf-8?B?SFo0bTZvY0xiWWpXODJveGZaVUI4RVlLczQxVXFHVGlxQmFEcG5mbVl6SC8w?=
 =?utf-8?B?NVA5SUh5d2tXVXQxcGF5YXg2N1pJRkcrUVBEZThpM1Fzbm9XSitTM2M1OWQ2?=
 =?utf-8?B?c1BpNVc4SFhibzFkZElmSXhTZjl0Rk9nUGZkRklhWDN3elBrZXk0bXRDQ1Nn?=
 =?utf-8?B?NjJpOEUraWNPdjlhNkVnVERCMFdybW5lZWp3NkxyN1JyUUhnNy90QVN1TGZo?=
 =?utf-8?B?ZUVYeC9HdmFRb05DR2MrS29sQ3VOSURuMzl5UDdqem1BRnNWNXNlQitJV3da?=
 =?utf-8?B?aWF4dklIVmpkU2ZGMDNaRWhQSVdmVjhVZS91YWdhbVRYMXFjWGVhL25ROUF5?=
 =?utf-8?B?dHgvVC95Y2FLdDJGZzUvanZnQWlBNXgyMnZFNVA3QUtkSFdSWW1nRDBqZ0t2?=
 =?utf-8?B?S3g3K01SNDk4U2lZN1QvU2Y4UGpxcFc1bkhxaFBiRkF1cjJ3MnQrMXJCODRT?=
 =?utf-8?Q?puhmSwOaxTVMsecsll5lPHZCc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7993a3d5-68c7-437d-4f19-08dbc12f43ae
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 21:01:34.8959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JcfoThmZVXs6yLC0J727OL+bB5eK52L1s2XvWtM7im8lPsiciZMIadj+YVMzMunVRjBTI1bR46/xUEF4Vcz+Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6922
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 1/3] drm/xe: Kill xe_bo_doc.h
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

Keep the documentation inside the code.
No update to the documentation itself at this time.
Let's first ensure that the entire documentation is closer
to the relevant code, otherwise it will get very easily outdated.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 Documentation/gpu/xe/xe_mm.rst |   2 +-
 drivers/gpu/drm/xe/xe_bo.c     | 170 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo_doc.h | 179 ---------------------------------
 3 files changed, 171 insertions(+), 180 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/xe_bo_doc.h

diff --git a/Documentation/gpu/xe/xe_mm.rst b/Documentation/gpu/xe/xe_mm.rst
index 6c8fd8b4a466..bcb5ad56da9a 100644
--- a/Documentation/gpu/xe/xe_mm.rst
+++ b/Documentation/gpu/xe/xe_mm.rst
@@ -4,7 +4,7 @@
 Memory Management
 =================
 
-.. kernel-doc:: drivers/gpu/drm/xe/xe_bo_doc.h
+.. kernel-doc:: drivers/gpu/drm/xe/xe_bo.c
    :doc: Buffer Objects (BO)
 
 Pagetable building
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 61789c0e88fb..8ced990e3982 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -27,6 +27,176 @@
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_vm.h"
 
+/**
+ * DOC: Buffer Objects (BO)
+ *
+ * BO management
+ * =============
+ *
+ * TTM manages (placement, eviction, etc...) all BOs in XE.
+ *
+ * BO creation
+ * ===========
+ *
+ * Create a chunk of memory which can be used by the GPU. Placement rules
+ * (sysmem or vram region) passed in upon creation. TTM handles placement of BO
+ * and can trigger eviction of other BOs to make space for the new BO.
+ *
+ * Kernel BOs
+ * ----------
+ *
+ * A kernel BO is created as part of driver load (e.g. uC firmware images, GuC
+ * ADS, etc...) or a BO created as part of a user operation which requires
+ * a kernel BO (e.g. engine state, memory for page tables, etc...). These BOs
+ * are typically mapped in the GGTT (any kernel BOs aside memory for page tables
+ * are in the GGTT), are pinned (can't move or be evicted at runtime), have a
+ * vmap (XE can access the memory via xe_map layer) and have contiguous physical
+ * memory.
+ *
+ * More details of why kernel BOs are pinned and contiguous below.
+ *
+ * User BOs
+ * --------
+ *
+ * A user BO is created via the DRM_IOCTL_XE_GEM_CREATE IOCTL. Once it is
+ * created the BO can be mmap'd (via DRM_IOCTL_XE_GEM_MMAP_OFFSET) for user
+ * access and it can be bound for GPU access (via DRM_IOCTL_XE_VM_BIND). All
+ * user BOs are evictable and user BOs are never pinned by XE. The allocation of
+ * the backing store can be defered from creation time until first use which is
+ * either mmap, bind, or pagefault.
+ *
+ * Private BOs
+ * ~~~~~~~~~~~
+ *
+ * A private BO is a user BO created with a valid VM argument passed into the
+ * create IOCTL. If a BO is private it cannot be exported via prime FD and
+ * mappings can only be created for the BO within the VM it is tied to. Lastly,
+ * the BO dma-resv slots / lock point to the VM's dma-resv slots / lock (all
+ * private BOs to a VM share common dma-resv slots / lock).
+ *
+ * External BOs
+ * ~~~~~~~~~~~~
+ *
+ * An external BO is a user BO created with a NULL VM argument passed into the
+ * create IOCTL. An external BO can be shared with different UMDs / devices via
+ * prime FD and the BO can be mapped into multiple VMs. An external BO has its
+ * own unique dma-resv slots / lock. An external BO will be in an array of all
+ * VMs which has a mapping of the BO. This allows VMs to lookup and lock all
+ * external BOs mapped in the VM as needed.
+ *
+ * BO placement
+ * ~~~~~~~~~~~~
+ *
+ * When a user BO is created, a mask of valid placements is passed indicating
+ * which memory regions are considered valid.
+ *
+ * The memory region information is available via query uAPI (TODO: add link).
+ *
+ * BO validation
+ * =============
+ *
+ * BO validation (ttm_bo_validate) refers to ensuring a BO has a valid
+ * placement. If a BO was swapped to temporary storage, a validation call will
+ * trigger a move back to a valid (location where GPU can access BO) placement.
+ * Validation of a BO may evict other BOs to make room for the BO being
+ * validated.
+ *
+ * BO eviction / moving
+ * ====================
+ *
+ * All eviction (or in other words, moving a BO from one memory location to
+ * another) is routed through TTM with a callback into XE.
+ *
+ * Runtime eviction
+ * ----------------
+ *
+ * Runtime evictions refers to during normal operations where TTM decides it
+ * needs to move a BO. Typically this is because TTM needs to make room for
+ * another BO and the evicted BO is first BO on LRU list that is not locked.
+ *
+ * An example of this is a new BO which can only be placed in VRAM but there is
+ * not space in VRAM. There could be multiple BOs which have sysmem and VRAM
+ * placement rules which currently reside in VRAM, TTM trigger a will move of
+ * one (or multiple) of these BO(s) until there is room in VRAM to place the new
+ * BO. The evicted BO(s) are valid but still need new bindings before the BO
+ * used again (exec or compute mode rebind worker).
+ *
+ * Another example would be, TTM can't find a BO to evict which has another
+ * valid placement. In this case TTM will evict one (or multiple) unlocked BO(s)
+ * to a temporary unreachable (invalid) placement. The evicted BO(s) are invalid
+ * and before next use need to be moved to a valid placement and rebound.
+ *
+ * In both cases, moves of these BOs are scheduled behind the fences in the BO's
+ * dma-resv slots.
+ *
+ * WW locking tries to ensures if 2 VMs use 51% of the memory forward progress
+ * is made on both VMs.
+ *
+ * Runtime eviction uses per a GT migration engine (TODO: link to migration
+ * engine doc) to do a GPU memcpy from one location to another.
+ *
+ * Rebinds after runtime eviction
+ * ------------------------------
+ *
+ * When BOs are moved, every mapping (VMA) of the BO needs to rebound before
+ * the BO is used again. Every VMA is added to an evicted list of its VM when
+ * the BO is moved. This is safe because of the VM locking structure (TODO: link
+ * to VM locking doc). On the next use of a VM (exec or compute mode rebind
+ * worker) the evicted VMA list is checked and rebinds are triggered. In the
+ * case of faulting VM, the rebind is done in the page fault handler.
+ *
+ * Suspend / resume eviction of VRAM
+ * ---------------------------------
+ *
+ * During device suspend / resume VRAM may lose power which means the contents
+ * of VRAM's memory is blown away. Thus BOs present in VRAM at the time of
+ * suspend must be moved to sysmem in order for their contents to be saved.
+ *
+ * A simple TTM call (ttm_resource_manager_evict_all) can move all non-pinned
+ * (user) BOs to sysmem. External BOs that are pinned need to be manually
+ * evicted with a simple loop + xe_bo_evict call. It gets a little trickier
+ * with kernel BOs.
+ *
+ * Some kernel BOs are used by the GT migration engine to do moves, thus we
+ * can't move all of the BOs via the GT migration engine. For simplity, use a
+ * TTM memcpy (CPU) to move any kernel (pinned) BO on either suspend or resume.
+ *
+ * Some kernel BOs need to be restored to the exact same physical location. TTM
+ * makes this rather easy but the caveat is the memory must be contiguous. Again
+ * for simplity, we enforce that all kernel (pinned) BOs are contiguous and
+ * restored to the same physical location.
+ *
+ * Pinned external BOs in VRAM are restored on resume via the GPU.
+ *
+ * Rebinds after suspend / resume
+ * ------------------------------
+ *
+ * Most kernel BOs have GGTT mappings which must be restored during the resume
+ * process. All user BOs are rebound after validation on their next use.
+ *
+ * Future work
+ * ===========
+ *
+ * Trim the list of BOs which is saved / restored via TTM memcpy on suspend /
+ * resume. All we really need to save / restore via TTM memcpy is the memory
+ * required for the GuC to load and the memory for the GT migrate engine to
+ * operate.
+ *
+ * Do not require kernel BOs to be contiguous in physical memory / restored to
+ * the same physical address on resume. In all likelihood the only memory that
+ * needs to be restored to the same physical address is memory used for page
+ * tables. All of that memory is allocated 1 page at time so the contiguous
+ * requirement isn't needed. Some work on the vmap code would need to be done if
+ * kernel BOs are not contiguous too.
+ *
+ * Make some kernel BO evictable rather than pinned. An example of this would be
+ * engine state, in all likelihood if the dma-slots of these BOs where properly
+ * used rather than pinning we could safely evict + rebind these BOs as needed.
+ *
+ * Some kernel BOs do not need to be restored on resume (e.g. GuC ADS as that is
+ * repopulated on resume), add flag to mark such objects as no save / restore.
+ */
+
 static const struct ttm_place sys_placement_flags = {
 	.fpfn = 0,
 	.lpfn = 0,
diff --git a/drivers/gpu/drm/xe/xe_bo_doc.h b/drivers/gpu/drm/xe/xe_bo_doc.h
deleted file mode 100644
index f57d440cc95a..000000000000
--- a/drivers/gpu/drm/xe/xe_bo_doc.h
+++ /dev/null
@@ -1,179 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Copyright © 2022 Intel Corporation
- */
-
-#ifndef _XE_BO_DOC_H_
-#define _XE_BO_DOC_H_
-
-/**
- * DOC: Buffer Objects (BO)
- *
- * BO management
- * =============
- *
- * TTM manages (placement, eviction, etc...) all BOs in XE.
- *
- * BO creation
- * ===========
- *
- * Create a chunk of memory which can be used by the GPU. Placement rules
- * (sysmem or vram region) passed in upon creation. TTM handles placement of BO
- * and can trigger eviction of other BOs to make space for the new BO.
- *
- * Kernel BOs
- * ----------
- *
- * A kernel BO is created as part of driver load (e.g. uC firmware images, GuC
- * ADS, etc...) or a BO created as part of a user operation which requires
- * a kernel BO (e.g. engine state, memory for page tables, etc...). These BOs
- * are typically mapped in the GGTT (any kernel BOs aside memory for page tables
- * are in the GGTT), are pinned (can't move or be evicted at runtime), have a
- * vmap (XE can access the memory via xe_map layer) and have contiguous physical
- * memory.
- *
- * More details of why kernel BOs are pinned and contiguous below.
- *
- * User BOs
- * --------
- *
- * A user BO is created via the DRM_IOCTL_XE_GEM_CREATE IOCTL. Once it is
- * created the BO can be mmap'd (via DRM_IOCTL_XE_GEM_MMAP_OFFSET) for user
- * access and it can be bound for GPU access (via DRM_IOCTL_XE_VM_BIND). All
- * user BOs are evictable and user BOs are never pinned by XE. The allocation of
- * the backing store can be defered from creation time until first use which is
- * either mmap, bind, or pagefault.
- *
- * Private BOs
- * ~~~~~~~~~~~
- *
- * A private BO is a user BO created with a valid VM argument passed into the
- * create IOCTL. If a BO is private it cannot be exported via prime FD and
- * mappings can only be created for the BO within the VM it is tied to. Lastly,
- * the BO dma-resv slots / lock point to the VM's dma-resv slots / lock (all
- * private BOs to a VM share common dma-resv slots / lock).
- *
- * External BOs
- * ~~~~~~~~~~~~
- *
- * An external BO is a user BO created with a NULL VM argument passed into the
- * create IOCTL. An external BO can be shared with different UMDs / devices via
- * prime FD and the BO can be mapped into multiple VMs. An external BO has its
- * own unique dma-resv slots / lock. An external BO will be in an array of all
- * VMs which has a mapping of the BO. This allows VMs to lookup and lock all
- * external BOs mapped in the VM as needed.
- *
- * BO placement
- * ~~~~~~~~~~~~
- *
- * When a user BO is created, a mask of valid placements is passed indicating
- * which memory regions are considered valid.
- *
- * The memory region information is available via query uAPI (TODO: add link).
- *
- * BO validation
- * =============
- *
- * BO validation (ttm_bo_validate) refers to ensuring a BO has a valid
- * placement. If a BO was swapped to temporary storage, a validation call will
- * trigger a move back to a valid (location where GPU can access BO) placement.
- * Validation of a BO may evict other BOs to make room for the BO being
- * validated.
- *
- * BO eviction / moving
- * ====================
- *
- * All eviction (or in other words, moving a BO from one memory location to
- * another) is routed through TTM with a callback into XE.
- *
- * Runtime eviction
- * ----------------
- *
- * Runtime evictions refers to during normal operations where TTM decides it
- * needs to move a BO. Typically this is because TTM needs to make room for
- * another BO and the evicted BO is first BO on LRU list that is not locked.
- *
- * An example of this is a new BO which can only be placed in VRAM but there is
- * not space in VRAM. There could be multiple BOs which have sysmem and VRAM
- * placement rules which currently reside in VRAM, TTM trigger a will move of
- * one (or multiple) of these BO(s) until there is room in VRAM to place the new
- * BO. The evicted BO(s) are valid but still need new bindings before the BO
- * used again (exec or compute mode rebind worker).
- *
- * Another example would be, TTM can't find a BO to evict which has another
- * valid placement. In this case TTM will evict one (or multiple) unlocked BO(s)
- * to a temporary unreachable (invalid) placement. The evicted BO(s) are invalid
- * and before next use need to be moved to a valid placement and rebound.
- *
- * In both cases, moves of these BOs are scheduled behind the fences in the BO's
- * dma-resv slots.
- *
- * WW locking tries to ensures if 2 VMs use 51% of the memory forward progress
- * is made on both VMs.
- *
- * Runtime eviction uses per a GT migration engine (TODO: link to migration
- * engine doc) to do a GPU memcpy from one location to another.
- *
- * Rebinds after runtime eviction
- * ------------------------------
- *
- * When BOs are moved, every mapping (VMA) of the BO needs to rebound before
- * the BO is used again. Every VMA is added to an evicted list of its VM when
- * the BO is moved. This is safe because of the VM locking structure (TODO: link
- * to VM locking doc). On the next use of a VM (exec or compute mode rebind
- * worker) the evicted VMA list is checked and rebinds are triggered. In the
- * case of faulting VM, the rebind is done in the page fault handler.
- *
- * Suspend / resume eviction of VRAM
- * ---------------------------------
- *
- * During device suspend / resume VRAM may lose power which means the contents
- * of VRAM's memory is blown away. Thus BOs present in VRAM at the time of
- * suspend must be moved to sysmem in order for their contents to be saved.
- *
- * A simple TTM call (ttm_resource_manager_evict_all) can move all non-pinned
- * (user) BOs to sysmem. External BOs that are pinned need to be manually
- * evicted with a simple loop + xe_bo_evict call. It gets a little trickier
- * with kernel BOs.
- *
- * Some kernel BOs are used by the GT migration engine to do moves, thus we
- * can't move all of the BOs via the GT migration engine. For simplity, use a
- * TTM memcpy (CPU) to move any kernel (pinned) BO on either suspend or resume.
- *
- * Some kernel BOs need to be restored to the exact same physical location. TTM
- * makes this rather easy but the caveat is the memory must be contiguous. Again
- * for simplity, we enforce that all kernel (pinned) BOs are contiguous and
- * restored to the same physical location.
- *
- * Pinned external BOs in VRAM are restored on resume via the GPU.
- *
- * Rebinds after suspend / resume
- * ------------------------------
- *
- * Most kernel BOs have GGTT mappings which must be restored during the resume
- * process. All user BOs are rebound after validation on their next use.
- *
- * Future work
- * ===========
- *
- * Trim the list of BOs which is saved / restored via TTM memcpy on suspend /
- * resume. All we really need to save / restore via TTM memcpy is the memory
- * required for the GuC to load and the memory for the GT migrate engine to
- * operate.
- *
- * Do not require kernel BOs to be contiguous in physical memory / restored to
- * the same physical address on resume. In all likelihood the only memory that
- * needs to be restored to the same physical address is memory used for page
- * tables. All of that memory is allocated 1 page at time so the contiguous
- * requirement isn't needed. Some work on the vmap code would need to be done if
- * kernel BOs are not contiguous too.
- *
- * Make some kernel BO evictable rather than pinned. An example of this would be
- * engine state, in all likelihood if the dma-slots of these BOs where properly
- * used rather than pinning we could safely evict + rebind these BOs as needed.
- *
- * Some kernel BOs do not need to be restored on resume (e.g. GuC ADS as that is
- * repopulated on resume), add flag to mark such objects as no save / restore.
- */
-
-#endif
-- 
2.41.0

