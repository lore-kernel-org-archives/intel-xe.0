Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD56C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 06:47:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C57C10E9F7;
	Fri,  8 Dec 2023 06:47:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F0DE10E9F7
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 06:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702018036; x=1733554036;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=bC3i4AbGGAxLrJYtV5U+2VPCnUGKKsXLTIQ9LpWapC8=;
 b=OVIKKVKdu8IrMOfTAew9L+vxbuKoqqIJGr7JVWcvkCBM7u5qpVrOiuJ5
 hPE6q6/ktK4BW6SK2x5JfouPoH8oaFHzvCd+cSChSawiHHCTDHfZmRW6i
 DTn+TmwdvJ9CkiYuybWwmcqu2HoW5buG9DeYhcnpYpkYaTBtdoMk2rJrc
 HjozezKTfL8/MSX+WzYwWyvkG/DkUYnfByZqoocngFUyjMtCJDMCzlgOD
 hjg/CwIb735pY38PkeZ0ndOamVVes+BmSX/vuDKz1MTzdHbU+ty72LrQG
 N4ojirJ7SFZvdRR08iB1CELl2nqDMPGzf3qXCtZF2CaSJ189T2KQD9SMT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="460844218"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="460844218"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 22:47:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="765387050"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="765387050"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 22:47:15 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 22:47:15 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 22:47:15 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 22:47:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CvWZpL+3oGzEt49m1RXMjTKrWe7/itneYk71Mcnlx6S+LKCvPkVNH8paT683UZwfSZ+e+FRlIn9/SwIkl0wjslmp5mQ1MBfF0FCjV1GHl6SlN4y/RN7pOxI2A+D2vSbISAhSIujpPsZFkqcWXp61fyb1dpawn5d+Kf7si0jDRW1rnS3dgJ5o3iVbH6ZNcQf/nAQfWB4iTO4Oa+K1dxhWquLncaXlFYhzU2YC3BQhvS/GBBkFugABo3oR7cLS98FcbXc7hgK+KjsXBsjCSJBfb02vB1x8ypQd2lqUbjEVd3fddQ6gAHis+NJXBNw9XH2GhhpHn6wNJCysohy5rXlpYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XEij794GxyFB6EuWZk6/T+AfhzcCI5Rlp9Oj5GeL4rg=;
 b=jGCfpZfzzsC44MHLGaWGoXbTRvNQQTRlWfEQytcc0LbImPe54Uf7QD4kAoG88sS7e1/wABJZrzUtvUafqp+ZRiikEw13tezbqGhYhdjBZrxVyK/mxrIxiv29TLDfzcaNAjlNV92GqJ0ZKK9zJQeVtuoWDEyaczJaLr6fuNbFi52zbq9N4cxsVzxu8XTObLqb/N8+l4eQ6Pc4d5KbKEnmFXD8/hTe/rkwpqkRuN4jUcFcofkwoKfja31Cxw238PTK1NciW/jLZcaDVCiodxehq9M6Q+QAmmCXW+/2/DipuTPG95TgsRW/dIdgdMhnfS8xEdMHbkIG00bqinm6Ws0c6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB4831.namprd11.prod.outlook.com (2603:10b6:a03:2d2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 06:47:13 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 06:47:13 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 09/16] drm/gpuvm: reference count drm_gpuvm structures
Date: Fri, 8 Dec 2023 01:46:36 -0500
Message-ID: <20231208064643.877688-10-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231208064643.877688-1-rodrigo.vivi@intel.com>
References: <20231208064643.877688-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0068.namprd03.prod.outlook.com
 (2603:10b6:a03:331::13) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB4831:EE_
X-MS-Office365-Filtering-Correlation-Id: fc509a1a-896c-4631-831a-08dbf7b98255
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tVLKrx5sosYKLBprQJQXo2piY9JF/Gw77SHKpQ9bjyHqog7fMkQUE9pxgUq+ytIDWhYhCX9Xf7A+tSrO43wBF9UOxoudej2nSS4YzZsU3E+CsS9K/+qBu2rmxn87s0X/4ukXbFrKQVkysE3Sw12eQSDzH9gIHcLBr87Ho+bmVDD5huH0Xdag3HyNmtXzUmX1mutRcj5Gcs5O9scMw+592+BYttFs3vXOITmS3cW3aR0Ruj2l9PJAF+UJUJBgvffK/qUTaa8xp5SB0vXvaEUyZUaIi3+xvTnzHbVPfs+AGR73490R2msD4o+Bf0R2eekZf8g/6XTMAKI/7/NlNhmSqvrK6ATKH79fih1GkmmhECO/GjrYF8PYHkhXv4DLyowSPC68hWXNDsibjViyYrgBLHus68wVmrM7uBFn/G9bxs8vbzTwlm1yArpMMIHoojwuV50qovGuvJVo62TuAXGfmQnOIwAYcbBOJQrOtBq/Ho0pzhMm2zsfMhoPRaFr6uwlHgAmkW3NCtouqSketAGgDMkwi7fZOY7E61m0I08r30k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(366004)(39860400002)(136003)(376002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(5660300002)(2906002)(8936002)(8676002)(36756003)(86362001)(44832011)(41300700001)(82960400001)(66574015)(83380400001)(6512007)(26005)(2616005)(1076003)(66946007)(66476007)(66556008)(316002)(38100700002)(6666004)(6506007)(966005)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEFPeldvZUY0MEMrU2R6K2RKa0JsWE1ESkhqdytVNk03UjdPQmY0NWNiM0JY?=
 =?utf-8?B?V0svdlB4NXVUMkU0WGZUenRBZUc4S2Z2U21NS3JVd1ZZbkJCNDJmQzFwOEk5?=
 =?utf-8?B?STY5N1J3Z3RUemI0M3JjTXM2cmQ0U3A2cUs4R3V0cmVQWHYwUGtBekg1VEpQ?=
 =?utf-8?B?cm1OV1ExMDNzN2hhbTJuVmY3MmtIU0hrUlVzWDNrUVgzMkFrMkZnRDVScW1Y?=
 =?utf-8?B?QlcyWVVRQ1ZCam00UkwvOWpQbWl0ci9GampRUmhRMUIwNkZCQitRVm5GRmVn?=
 =?utf-8?B?bnNEVitWV1lHaURaNUdoak9yblFnQUZrcGlzUml1Q2k3Z1hqNjVqZWdOM2Jn?=
 =?utf-8?B?ZmJqZU9LbmVpTTJZUVN4MDFKd2VCQWhBd0lya3FMbWd0c0p0K21vKzZLeUtQ?=
 =?utf-8?B?aWs1dGRGUkVTaHNDMUhoOG1QcnpkRHlwcGtSNXNRNjc0RnY4UzJ4K29lRjhC?=
 =?utf-8?B?QzZLbzlGcWdKMHdhbld5ZVRDSW5FR2pUNlZ0N3FJY1Njb28wTlV0RXR2MjZo?=
 =?utf-8?B?UUdhOEltbjNsc2NOMmZZbDRtMTVPYlZRbmozLzlXOXRzdEJTSzR6bzRXRTZq?=
 =?utf-8?B?bTJYM212ZFJXUW0ycjAyNUtsRUpQNEFjK21NUDlHRW44Zzl1d1V4VGZoYzh4?=
 =?utf-8?B?L1NSeGFZamJJMkFjeXd0WVBiSUw5WnVxV05xbTVKekxmM3AreHVNVTRDaEM3?=
 =?utf-8?B?QWtwbDdwYTRhZlVMK0Y0UnVJa05hWHEwV2o0ejNJQ2htRUMrSkVGdFFNdEhH?=
 =?utf-8?B?ZGtSRDBGME05ZmxPTVNrUXdheFo1K2FEcDc3dzc1RWVpWGltei9sbWdnOXNu?=
 =?utf-8?B?Tk9kaGtDZm5vdzVqVHZHQXFYWE9NY0EvS1dpNDZtVVN1R1pMc1hkRFduSlFM?=
 =?utf-8?B?K05ISVVabHFma1FmcWRWOWlqclF6emJmUytRWHFEaFQyTTUwS1NjRTNGRW9E?=
 =?utf-8?B?YVR6U3d5dEovS25TVHE4bjJodE4xWkNwcElLS0RMSEhUZ3VlYnZpRHo4MjJX?=
 =?utf-8?B?aUs2MDNLeURMbG04NWd1U3ljQmljVmNQbGtidTI5RjZPTmxWMVBtcDJjOFh1?=
 =?utf-8?B?cmN6OUxpQzd6T3RWME1KMkMxZTdlNVhmMmFwemlLS0VZcnM1MnR2eHVlWUxi?=
 =?utf-8?B?N3RHTW5ZOFoxaENuMEQrcEljaktKd0hrSklaL2k1dGFSRU02NGw4bjYwSnpq?=
 =?utf-8?B?UldOZjc4RkZjWVlmL3BNTStRaWh2eHJDMkN1YWxjMDhjV3FkYWJxbThzd1di?=
 =?utf-8?B?WHJpQTg3VThQWkRuYW1Yelpsd1RzRDZZMlROekJSUlhjOWY4cy8wRE0vMTI3?=
 =?utf-8?B?QmNtY1oyVXR2YURwbC9YaUJkTHMwalJaTU9mWDhZUlljQlNLSFB6VzlGbyt3?=
 =?utf-8?B?UVY4NkdGWTBpNElGOEdHa1B0ZE4rZ0pjMUd5NkxMRGhvVnFMSVplM2dnWkRP?=
 =?utf-8?B?SzZrY3NCa3ptWTJTRHMxV2lYUWtYK2JVZDBMYmNIR2ZTR1l5REtkODRZNXcw?=
 =?utf-8?B?WGJzZnFSS1NBU24zRXRDRk41Q1ZQL000c3loc0J5RzRxUGFmVDQwZHo3ZnpF?=
 =?utf-8?B?MHNYaW8xSzAyYTJaMjk2UC9HTUNtdE5neStuL1ZQUjNLVXV4Z1FFWTNuTWJt?=
 =?utf-8?B?bnl3dXErbysrTnIvQnd0RlZHb25ITHhwcEpROWgrWUNDOHJjSnhoODhGNUxt?=
 =?utf-8?B?ZG1SYnF1eFhFTkVoVytoM1R5a21Fdk5ac0laejVNaCs5WVBqNDRGWTUyc3RW?=
 =?utf-8?B?aG1zSXJDVyt5YTd6OTN2MHN4RmZuOW9pUzY1cmhQeHBzSVo4ZThMVWRCRm1M?=
 =?utf-8?B?ODdsejlFUTB2UDVkb2hzcHVTaEdiMnJPUk5KM1M5OGViakVwbmFSeXVhNWdY?=
 =?utf-8?B?NUwxVHpMVlAxdllVaUk5SFlxSHZiZDNNMDhGQnZnVlUxZ2p4U29kaTRMeTlK?=
 =?utf-8?B?TWM3N2pXOEdYNFZhc0FzR0lWTWRFbkNkVitvRGkwWk54cllOQ3dRc0tObUk4?=
 =?utf-8?B?MmE0Rm9Gd0lMdXY0bmVKVG4ybmx1dzBVQzhPSWtLTVBZWXBJUEpQYUdid1pW?=
 =?utf-8?B?YnZ5bHdxKzFyRCs5NXhzcEVSdlllMVpPalVidTlQSk1OQ0pPQVBhWU1pZDVF?=
 =?utf-8?B?QUVMOVBwODZZMzh1a0hkSDlub3JYaFZMWlh6RktsVkRTMXdJcWY4N3VnRU03?=
 =?utf-8?B?TUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc509a1a-896c-4631-831a-08dbf7b98255
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 06:47:13.2163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8oU5i8aW7KJnnYNU2rLPZJ6kb9brzU7d/zkusXmXD2Cy2UGLUrBYS68uiUhgzzY4wpd8K2gQAglehWmRd+5ZKA==
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

Implement reference counting for struct drm_gpuvm.

(cherry picked from commit 8af72338dd81d1f8667e0240bd28f5fc98b3f20d)

Acked-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231108001259.15123-10-dakr@redhat.com
---
 drivers/gpu/drm/drm_gpuvm.c            | 56 +++++++++++++++++++++-----
 drivers/gpu/drm/nouveau/nouveau_uvmm.c | 20 ++++++---
 include/drm/drm_gpuvm.h                | 31 +++++++++++++-
 3 files changed, 90 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 0a010b52e33d..10bd15822b9b 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -746,6 +746,8 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
 	gpuvm->rb.tree = RB_ROOT_CACHED;
 	INIT_LIST_HEAD(&gpuvm->rb.list);
 
+	kref_init(&gpuvm->kref);
+
 	gpuvm->name = name ? name : "unknown";
 	gpuvm->flags = flags;
 	gpuvm->ops = ops;
@@ -770,15 +772,8 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_init);
 
-/**
- * drm_gpuvm_destroy() - cleanup a &drm_gpuvm
- * @gpuvm: pointer to the &drm_gpuvm to clean up
- *
- * Note that it is a bug to call this function on a manager that still
- * holds GPU VA mappings.
- */
-void
-drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
+static void
+drm_gpuvm_fini(struct drm_gpuvm *gpuvm)
 {
 	gpuvm->name = NULL;
 
@@ -790,7 +785,35 @@ drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
 
 	drm_gem_object_put(gpuvm->r_obj);
 }
-EXPORT_SYMBOL_GPL(drm_gpuvm_destroy);
+
+static void
+drm_gpuvm_free(struct kref *kref)
+{
+	struct drm_gpuvm *gpuvm = container_of(kref, struct drm_gpuvm, kref);
+
+	drm_gpuvm_fini(gpuvm);
+
+	if (drm_WARN_ON(gpuvm->drm, !gpuvm->ops->vm_free))
+		return;
+
+	gpuvm->ops->vm_free(gpuvm);
+}
+
+/**
+ * drm_gpuvm_put() - drop a struct drm_gpuvm reference
+ * @gpuvm: the &drm_gpuvm to release the reference of
+ *
+ * This releases a reference to @gpuvm.
+ *
+ * This function may be called from atomic context.
+ */
+void
+drm_gpuvm_put(struct drm_gpuvm *gpuvm)
+{
+	if (gpuvm)
+		kref_put(&gpuvm->kref, drm_gpuvm_free);
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_put);
 
 static int
 __drm_gpuva_insert(struct drm_gpuvm *gpuvm,
@@ -839,11 +862,21 @@ drm_gpuva_insert(struct drm_gpuvm *gpuvm,
 {
 	u64 addr = va->va.addr;
 	u64 range = va->va.range;
+	int ret;
 
 	if (unlikely(!drm_gpuvm_range_valid(gpuvm, addr, range)))
 		return -EINVAL;
 
-	return __drm_gpuva_insert(gpuvm, va);
+	ret = __drm_gpuva_insert(gpuvm, va);
+	if (likely(!ret))
+		/* Take a reference of the GPUVM for the successfully inserted
+		 * drm_gpuva. We can't take the reference in
+		 * __drm_gpuva_insert() itself, since we don't want to increse
+		 * the reference count for the GPUVM's kernel_alloc_node.
+		 */
+		drm_gpuvm_get(gpuvm);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(drm_gpuva_insert);
 
@@ -876,6 +909,7 @@ drm_gpuva_remove(struct drm_gpuva *va)
 	}
 
 	__drm_gpuva_remove(va);
+	drm_gpuvm_put(va->vm);
 }
 EXPORT_SYMBOL_GPL(drm_gpuva_remove);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 54be12c1272f..cb2f06565c46 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1780,6 +1780,18 @@ nouveau_uvmm_bo_unmap_all(struct nouveau_bo *nvbo)
 	}
 }
 
+static void
+nouveau_uvmm_free(struct drm_gpuvm *gpuvm)
+{
+	struct nouveau_uvmm *uvmm = uvmm_from_gpuvm(gpuvm);
+
+	kfree(uvmm);
+}
+
+static const struct drm_gpuvm_ops gpuvm_ops = {
+	.vm_free = nouveau_uvmm_free,
+};
+
 int
 nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
 			   void *data,
@@ -1830,7 +1842,7 @@ nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
 		       NOUVEAU_VA_SPACE_END,
 		       init->kernel_managed_addr,
 		       init->kernel_managed_size,
-		       NULL);
+		       &gpuvm_ops);
 	/* GPUVM takes care from here on. */
 	drm_gem_object_put(r_obj);
 
@@ -1849,8 +1861,7 @@ nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
 	return 0;
 
 out_gpuvm_fini:
-	drm_gpuvm_destroy(&uvmm->base);
-	kfree(uvmm);
+	drm_gpuvm_put(&uvmm->base);
 out_unlock:
 	mutex_unlock(&cli->mutex);
 	return ret;
@@ -1902,7 +1913,6 @@ nouveau_uvmm_fini(struct nouveau_uvmm *uvmm)
 
 	mutex_lock(&cli->mutex);
 	nouveau_vmm_fini(&uvmm->vmm);
-	drm_gpuvm_destroy(&uvmm->base);
-	kfree(uvmm);
+	drm_gpuvm_put(&uvmm->base);
 	mutex_unlock(&cli->mutex);
 }
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 239680b83079..4dc83a27506a 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -247,6 +247,11 @@ struct drm_gpuvm {
 		struct list_head list;
 	} rb;
 
+	/**
+	 * @kref: reference count of this object
+	 */
+	struct kref kref;
+
 	/**
 	 * @kernel_alloc_node:
 	 *
@@ -273,7 +278,23 @@ void drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
 		    u64 start_offset, u64 range,
 		    u64 reserve_offset, u64 reserve_range,
 		    const struct drm_gpuvm_ops *ops);
-void drm_gpuvm_destroy(struct drm_gpuvm *gpuvm);
+
+/**
+ * drm_gpuvm_get() - acquire a struct drm_gpuvm reference
+ * @gpuvm: the &drm_gpuvm to acquire the reference of
+ *
+ * This function acquires an additional reference to @gpuvm. It is illegal to
+ * call this without already holding a reference. No locks required.
+ */
+static inline struct drm_gpuvm *
+drm_gpuvm_get(struct drm_gpuvm *gpuvm)
+{
+	kref_get(&gpuvm->kref);
+
+	return gpuvm;
+}
+
+void drm_gpuvm_put(struct drm_gpuvm *gpuvm);
 
 bool drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm, u64 addr, u64 range);
 bool drm_gpuvm_interval_empty(struct drm_gpuvm *gpuvm, u64 addr, u64 range);
@@ -683,6 +704,14 @@ static inline void drm_gpuva_init_from_op(struct drm_gpuva *va,
  * operations to drivers.
  */
 struct drm_gpuvm_ops {
+	/**
+	 * @vm_free: called when the last reference of a struct drm_gpuvm is
+	 * dropped
+	 *
+	 * This callback is mandatory.
+	 */
+	void (*vm_free)(struct drm_gpuvm *gpuvm);
+
 	/**
 	 * @op_alloc: called when the &drm_gpuvm allocates
 	 * a struct drm_gpuva_op
-- 
2.43.0

