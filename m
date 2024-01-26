Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C598C47DDB
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 20:32:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F1210FE67;
	Fri, 26 Jan 2024 20:32:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B66A10FE62
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 20:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706301117; x=1737837117;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=PaR4Zxfi5CnpdbfbWE/VHoibkqKDgdLrtyQ/bgYxdN8=;
 b=DUPrOsocfDp9LRJzdm9ojqFEYNgo/B31wNxXt0xUSDe+o18qxiC+AI4O
 eHUujsRhshM7taaVJZyDX6TqwmDz2fzaTPhMmDBruS2bHDn8WbIkk6QOa
 FCBDzsWhCz6cT7eEw6GOzl9dgtK/Wgwy/gb6zw04ISV9ovqEb92jw+sGQ
 lz1AuA0Lj2s+JEBGhbFDJXcI3tvRE98C5xNDd+N1QyAFVtsdXYndMN/4T
 O266CunpzKHFPyPE5BX6G2++l3tJCdU0bP69uO3XQbPcvkea3SN5It9IX
 YKWk1sLutLL2X6Dk6dYcLN72TlUtYbCzRWHVKJdiwkXLsdrBHqnYZNGHv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9948680"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9948680"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 12:31:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="877482149"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="877482149"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 12:31:57 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:31:56 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 12:31:56 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 12:31:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GAIPrBrFsMSni/koMdaUCcsQ+Wc2s6Y4KU26Y0Aie6dKFXE2LIiM0OHgFG/Bh8LCblbtGJ+V74um3dQ7Jeq5IAfnZjUgwiV9PK3kpugi1E1hYRV2udkl/rxgMg55mMdKi7W88dUu+5aQL0aOMKrGfyZHluY9givrFqxFmc1dqvRzecW2tzBvVIHd+2lBmdw2RRkwDUXX9NXuI63tPC38uKKDJh5Juk339G2JFMmgWhxmG5pr15ktYFi3oWTqAXAS3loN8aedHASM/69T62a5omYo5xDROBWjEd0l0rX8KmC8ZcaWb3+HuXYC6lS+Hp9kp2Iirtx0Swx/6N+j0hHxSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ZqDN0Hsggdknn2DM/8Abh1UdX7IzmBEdC1DB66ACII=;
 b=ke4tEYwULFRQh7zL3e2v4aat65e6RTvcrletOYbGEZFqAtCiYt5GFkF0v1D7HUs4OFOU19EnBf83HPOgCUhzDiDQldGLdtfgZh1tuBnXu6Pbu3u30RqCMCx43aQSg36g1amb0c9fl506ToDZkppafwz1AuyUPtApMBdv6uXz8FBqpqkSKu0w2+6v314ILNzhEMRus1Kxt5lVibzST0Q/8/14HKUNQCXcMS+so2LCY714yKln0zZBxFoxJ4HKKnOP1IVnMaeFgboeVOJfhj0lXYwT+IQvPTKgGO9k0GU5JJxWe8bEHkWIEfsrMcvrcC5x9xclz/j02UTzQ7/7TTbDaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CYYPR11MB8407.namprd11.prod.outlook.com (2603:10b6:930:c1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Fri, 26 Jan
 2024 20:31:54 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 20:31:53 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 21/34] drm/xe: Convert GuC CT paths from mem_access to
 xe_pm_runtime
Date: Fri, 26 Jan 2024 15:30:30 -0500
Message-ID: <20240126203044.1104705-22-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0074.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CYYPR11MB8407:EE_
X-MS-Office365-Filtering-Correlation-Id: b719e7a0-44d0-43ee-a1cb-08dc1eadd545
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GPuLN2nhPc+BoJ6qXUu0/3iF0fAbQWWgpVgRvi724HrrzKJBOjVB3yPSPPzo5TKNtbDR4/3aSMMNFvgBL2JhJhFjZGUiVosZYCMT8DRiNa8/c84EraaInE0+Vuyp6ISB/cUqbVjCTb77VGY4L2tpOhmyef358wLZLMbkzEkxDRWNMKDCE5MggRjCsG4WX5ge2qlpRdcgy2w2vNgl++unYW5uutfM+sqrtj2WbIYqGHkK02aWyMBaLABbmCrYb34++LKz6sMRe+Rtza910iT6J/9OjmjrMqfQkL/i/LFivvtiymsZH9M2wKfPZ3xZP+rLDYCnDgvqb3hyqHWEs5XhYjWBy6bRxAvF1M2LGhu/666l5NWQ67Po0O+6Q7WMMhPs6HZI2n5x0r8qXa5yIVblwSuIZHQL2yBKtmOJ/RuYMcCBFXKWLdEFJEpXkC4N1itcCfcf7AK2wVsiwIQ3QzA5AHXC4MfVatp3ciC7RUfFLYCyss0h0LYIZxb+Ubj75UAJR8gfyqMQmnt0gLJ4DVtQqn9u5gqDHSjq58XQMtSnLXPyq7Yv2N0XyMLFoAwP86/C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(39860400002)(136003)(396003)(366004)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(38100700002)(82960400001)(6666004)(41300700001)(6486002)(478600001)(26005)(44832011)(2616005)(83380400001)(6512007)(6506007)(316002)(54906003)(2906002)(4326008)(36756003)(8676002)(66556008)(5660300002)(6916009)(66946007)(66476007)(8936002)(86362001)(107886003)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9f4CCEIGrKb1kZePAXqBM6NA9SPETW580vedXg3hwqd+yIHfumcZ1Wywb3/c?=
 =?us-ascii?Q?k6GpJCJVem9zrQbYPxs5QNbnH8UX+phsWSvDzjo7qByDs1Qix3cEIpyD5jxu?=
 =?us-ascii?Q?WvmzggEifdFf573yCtEPG/ZspuWPn5UG5e7GlCl1WZ/v3uBuKVfCla+NYLUV?=
 =?us-ascii?Q?kj/6FxOoA5Rp0CxfUcO+53KrH2RBxKGuCmRUpqw3rBimc3EB9fQIyxqmR4nT?=
 =?us-ascii?Q?F1CLYPFg+ZHf3p0GSqVlSKAbl5c/yZvsVijpsaGf3D4l3WneYn4zHBQBpCH2?=
 =?us-ascii?Q?56IapDbOnH7RcNnQ2tNJm2IKx/YCOULA63DqDBtjsbfadyi5AySuGzn/jrv2?=
 =?us-ascii?Q?htxo4m226Y1VtbDDod0szgjXyIitiM4w2KvJ+8FZIdGRf/EL4b3w/fBwJRWo?=
 =?us-ascii?Q?LsbwK2xJd+DNyMHjp0SbNv9wAcBTOuUbs/qUSLm1k95jzzHSkgdUwkzDSH8l?=
 =?us-ascii?Q?zvJ0W+pBoLo1dPLVqoCpppEYvMZHz6IBxjn3/NiN8nT3JcLuKElAmoDbEF/f?=
 =?us-ascii?Q?CmqUQ5b7SZBEmfpBiux6s72afbvAU99qLTa7xUNtq1youQR8FFHw4iUgg4iM?=
 =?us-ascii?Q?ZOO+4YLYNDxag9Y0Xhz3gfWsin80O23V53Mas3mef4yIYqOFIdp4zECwTLkh?=
 =?us-ascii?Q?TylUAigBF8lm21C2WE1+Dy0kxCgLmxTsGr8H6UwcAdgD/IVcTAjLv7qvRoJh?=
 =?us-ascii?Q?Wuj0tldIF36DqTCavcEiLCR69SwMs/DIgY9NEQHn+z/HzafYgGdXWmN1tkps?=
 =?us-ascii?Q?cAPgALRy4udk5M7LNqaL8e3eU0Eq/gIXkTitdKywYIddf323cRBnLzvNZi6s?=
 =?us-ascii?Q?DfoS3O+UHlXoQHg8Rlm2mcr3yAxO0KXRRaW7GJoWQo5bOJvPg/PJlSZJrxN6?=
 =?us-ascii?Q?1cAF9/Tn5i+cK0JedIupZcYoaSM/UVkV23mR0HZy+BaVYIqThwt0YM06zgq7?=
 =?us-ascii?Q?Xf7nW3/+rfH/n0JW2bwozxABjD1mn7qwg6RqwDYIfl7paZNsVJZQT5LmJsEs?=
 =?us-ascii?Q?MlqTFrSKMddBQoT2CyrDhbNRXlEBhscIAxh4/vXJD2pYLe1gG7QjI2Qc8UwD?=
 =?us-ascii?Q?e706DBXhD8T0iYt+uxw9BhWJCeURLGRorG1Xh7wzz/pIXKwOhoZf4/ykfjKK?=
 =?us-ascii?Q?Z/3EsVvQfdFbX7KWkfPc9h4aa4AEdWAzDexl1YUtwwuTKc0AI0EGuxGP4CgA?=
 =?us-ascii?Q?NfUc4Bvw27IQ2mDe2cjKuKPg83NsqaEni7HMcsGbEyUZc6hrwtRI6IN7YQxK?=
 =?us-ascii?Q?8/+oYUNqnPeBnCe8w+hI6aSy773CJdjHadHQdab87wpPvi/bledPfNg1o9Ij?=
 =?us-ascii?Q?YLf3rQ7O0tLCBPOFRieS5b93okntwg7Lv2APYn32rW+mePzV6ZiJt3Qa/pLF?=
 =?us-ascii?Q?iBQd23ra6OjQ4OLKFePy7/9xC5t2vk7MrHMLaQObpCv/AyR96WNV03Plwfpb?=
 =?us-ascii?Q?rvLMhrMwwD/tUQtLKkzGTGG5wwBmEYjQE4a403gbK1D5KYgby5J92vd5xZz+?=
 =?us-ascii?Q?PWpiif+tk8zi59VrUVd4TkUqMhCT5Tv1zEcPF1dDCTam0f5+sf8ZoZWx8aZk?=
 =?us-ascii?Q?F/I+uHE6/VYMPgBeHghKuglJV3ePmK2CfhdIPUZ6orAcEzLMHvOXk1hPG/if?=
 =?us-ascii?Q?AQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b719e7a0-44d0-43ee-a1cb-08dc1eadd545
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 20:31:53.8977 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UCLByTeCkQTVywxa23P8XO4evQA2U+Ob6NM2GneQGsU/dCeC0UXj8A3JjO0GLRSK7ZdCid/9Fh93Bder5GeCYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8407
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

For the G2H and TLB invalidation cases, the outer bounds
protection of the pm_runtime are not going to work. So
we need to have the inner side protections here.

Cc: Matthew Auld <matthew.auld@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c      |  3 ++
 drivers/gpu/drm/xe/xe_guc_ct.c       | 79 +++++++++++++---------------
 drivers/gpu/drm/xe/xe_guc_ct_types.h |  2 +
 3 files changed, 41 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 8abdf3c17e1d..b3669eac23c9 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -64,6 +64,9 @@ static int info(struct seq_file *m, void *data)
 			   xe_force_wake_ref(gt_to_fw(gt), XE_FW_GT));
 		drm_printf(&p, "gt%d engine_mask 0x%llx\n", id,
 			   gt->info.engine_mask);
+		drm_printf(&p, "gt%d g2h_outstanding %d g2h_pm_refs %d\n", id,
+			   gt->uc.guc.ct.g2h_outstanding,
+			   gt->uc.guc.ct.g2h_pm_refs);
 	}
 
 	xe_pm_runtime_put(xe);
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index f3d356383ced..139cfe733661 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -287,16 +287,49 @@ static int guc_ct_control_toggle(struct xe_guc_ct *ct, bool enable)
 	return ret > 0 ? -EPROTO : ret;
 }
 
+static void guc_ct_g2h_outstanding_clear(struct xe_guc_ct *ct)
+{
+	int i;
+
+	for (i = 0; i < ct->g2h_pm_refs; i++)
+		xe_pm_runtime_put(ct_to_xe(ct));
+	ct->g2h_outstanding = 0;
+	ct->g2h_pm_refs = 0;
+}
+
+static void guc_ct_g2h_outstanding_dec(struct xe_guc_ct *ct)
+{
+	if (ct->g2h_pm_refs > 0)
+		xe_pm_runtime_put(ct_to_xe(ct));
+	ct->g2h_pm_refs--;
+	ct->g2h_outstanding--;
+}
+
+static void guc_ct_g2h_outstanding_add(struct xe_guc_ct *ct, int num_g2h)
+{
+	struct xe_device *xe = ct_to_xe(ct);
+	int i;
+
+	for (i = 0; i < num_g2h; i++) {
+		if (xe_pm_runtime_get_if_in_use(xe))
+			ct->g2h_pm_refs++;
+		else
+			drm_err(&xe->drm, "Failed to grab RPM ref for outstanding g2h\n");
+	}
+	ct->g2h_outstanding += num_g2h;
+}
+
 static void xe_guc_ct_set_state(struct xe_guc_ct *ct,
 				enum xe_guc_ct_state state)
 {
 	mutex_lock(&ct->lock);		/* Serialise dequeue_one_g2h() */
 	spin_lock_irq(&ct->fast_lock);	/* Serialise CT fast-path */
 
+
 	xe_gt_assert(ct_to_gt(ct), ct->g2h_outstanding == 0 ||
 		     state == XE_GUC_CT_STATE_STOPPED);
 
-	ct->g2h_outstanding = 0;
+	guc_ct_g2h_outstanding_clear(ct);
 	ct->state = state;
 
 	spin_unlock_irq(&ct->fast_lock);
@@ -428,7 +461,7 @@ static void __g2h_reserve_space(struct xe_guc_ct *ct, u32 g2h_len, u32 num_g2h)
 		lockdep_assert_held(&ct->fast_lock);
 
 		ct->ctbs.g2h.info.space -= g2h_len;
-		ct->g2h_outstanding += num_g2h;
+		guc_ct_g2h_outstanding_add(ct, num_g2h);
 	}
 }
 
@@ -439,7 +472,7 @@ static void __g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
 		  ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space);
 
 	ct->ctbs.g2h.info.space += g2h_len;
-	--ct->g2h_outstanding;
+	guc_ct_g2h_outstanding_dec(ct);
 }
 
 static void g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
@@ -1199,14 +1232,8 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
  */
 void xe_guc_ct_fast_path(struct xe_guc_ct *ct)
 {
-	struct xe_device *xe = ct_to_xe(ct);
-	bool ongoing;
 	int len;
 
-	ongoing = xe_device_mem_access_get_if_ongoing(ct_to_xe(ct));
-	if (!ongoing && xe_pm_read_callback_task(ct_to_xe(ct)) == NULL)
-		return;
-
 	spin_lock(&ct->fast_lock);
 	do {
 		len = g2h_read(ct, ct->fast_msg, true);
@@ -1214,9 +1241,6 @@ void xe_guc_ct_fast_path(struct xe_guc_ct *ct)
 			g2h_fast_path(ct, ct->fast_msg, len);
 	} while (len > 0);
 	spin_unlock(&ct->fast_lock);
-
-	if (ongoing)
-		xe_device_mem_access_put(xe);
 }
 
 /* Returns less than zero on error, 0 on done, 1 on more available */
@@ -1247,36 +1271,8 @@ static int dequeue_one_g2h(struct xe_guc_ct *ct)
 static void g2h_worker_func(struct work_struct *w)
 {
 	struct xe_guc_ct *ct = container_of(w, struct xe_guc_ct, g2h_worker);
-	bool ongoing;
 	int ret;
 
-	/*
-	 * Normal users must always hold mem_access.ref around CT calls. However
-	 * during the runtime pm callbacks we rely on CT to talk to the GuC, but
-	 * at this stage we can't rely on mem_access.ref and even the
-	 * callback_task will be different than current.  For such cases we just
-	 * need to ensure we always process the responses from any blocking
-	 * ct_send requests or where we otherwise expect some response when
-	 * initiated from those callbacks (which will need to wait for the below
-	 * dequeue_one_g2h()).  The dequeue_one_g2h() will gracefully fail if
-	 * the device has suspended to the point that the CT communication has
-	 * been disabled.
-	 *
-	 * If we are inside the runtime pm callback, we can be the only task
-	 * still issuing CT requests (since that requires having the
-	 * mem_access.ref).  It seems like it might in theory be possible to
-	 * receive unsolicited events from the GuC just as we are
-	 * suspending-resuming, but those will currently anyway be lost when
-	 * eventually exiting from suspend, hence no need to wake up the device
-	 * here. If we ever need something stronger than get_if_ongoing() then
-	 * we need to be careful with blocking the pm callbacks from getting CT
-	 * responses, if the worker here is blocked on those callbacks
-	 * completing, creating a deadlock.
-	 */
-	ongoing = xe_device_mem_access_get_if_ongoing(ct_to_xe(ct));
-	if (!ongoing && xe_pm_read_callback_task(ct_to_xe(ct)) == NULL)
-		return;
-
 	do {
 		mutex_lock(&ct->lock);
 		ret = dequeue_one_g2h(ct);
@@ -1290,9 +1286,6 @@ static void g2h_worker_func(struct work_struct *w)
 			kick_reset(ct);
 		}
 	} while (ret == 1);
-
-	if (ongoing)
-		xe_device_mem_access_put(ct_to_xe(ct));
 }
 
 static void guc_ctb_snapshot_capture(struct xe_device *xe, struct guc_ctb *ctb,
diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
index d29144c9f20b..4220230e7be4 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
@@ -108,6 +108,8 @@ struct xe_guc_ct {
 	} ctbs;
 	/** @g2h_outstanding: number of outstanding G2H */
 	u32 g2h_outstanding;
+	/** @g2h_pm_refs: number of pm_refs for pending G2H */
+	u32 g2h_pm_refs;
 	/** @g2h_worker: worker to process G2H messages */
 	struct work_struct g2h_worker;
 	/** @state: CT state */
-- 
2.43.0

