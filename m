Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE286C77B75
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 21:09:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAFAD10E138;
	Mon,  8 May 2023 21:09:07 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EA0F10E138
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 21:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683580146; x=1715116146;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=qRFopXH07Aw1+g6s65jWU89U6OFyoyebDMkRADs+OqY=;
 b=md5RbF9+YrUD8ZpUHh9wKqUf8pGo/q5xB8ZdlADI/YZBxt7md0itLn1z
 ooUj7s8iohx/+T6WqudCcqKhVQebSWE/guGssQaF3jrq8wrzYWhtLJ3zb
 xMdmePZm4tdfdnF8JUSDI5gov38XGtF1NjSsENUpk6+//yiZ7WzxHpHDE
 HFKUXgZtmFrdfeopDT1dLLqhQU9xziqcSPmRWUyVAo0Fcnvsp32rWXlW6
 9B689Y7K1IhfRW45YZQoJooeZFek5WyiiPSoF4qtpfDadmRDcNzSkO0V2
 /TueejDcZ9Z+hqi2SG4+pNK3JHgiwtEJlxh3NT7MZ20Os772ZTsttb/Z6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="347222745"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="347222745"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 14:09:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="676199850"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="676199850"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP; 08 May 2023 14:09:05 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 14:09:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 14:09:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 14:09:05 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 14:09:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eqfiSLqU6Adc/G65xl27v7xDvf03mdrEDjdzTj9vyWIIZlYJ5LevagGCGvPpTfXQcH8Ew/PwKwAJ0tzGkbvAFaCU9tgjQxSpXzD1wQo0YcJ1clWWJxtsr58MHqCyE9HbfmY+QGX00XlKmMcMn4ojDXJhfxSPAyivxArik+v2yfSgxgc8F9Q+56BZyv37igtmli5Z7YgviAqkiPuZi/xh51LqnukyfF2vrsayaIOZ3B+UpquOrKGOv9+0BB+38b1nWOZJasD2zBzzxRhP+yr7QThIoKQUtclhA4jPpQYr51/rTfBHEbugEU+c0yhD0qF1s+vTPzU8leZkXkVq3AHCMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uYLwFw5Qj4iO4Kh1cf628Cw0UHdxUrerUaCzqK1uNcA=;
 b=MhB+aOeYe1ijUiHsi+uYvCYP0yE8Mmp4AM7W+Vi7wPm8GASKfKywhdvrrPjHSMO7tcoJf0JNfW/BrPylRYCLJNBuMl931p36dOgQMg2UU0aO0hl9nsyQoKwMR5/jShiI5Ix3RPJFDe9HSuMh0a5m9wRbH0bJDbsv28zG33cWdT4CQp2gWyt6KPuhYI1S5UUCUqCUlsYv3nfezuqK8W7kiTjRK72wW4QBax41Q6xZbuVFHrwORDrA4sieR5GDZn1L5y43j1RJJHwA0N1Vp/zRXMebaZykCnTDE0FyZ0VHltP3ArPmU4tryVcMMAgha/jhhGiEjpBK2u2v7CXlWEYuEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB5011.namprd11.prod.outlook.com (2603:10b6:303:6d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 21:09:02 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 21:09:02 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 8 May 2023 17:08:23 -0400
Message-ID: <20230508210825.1405432-9-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508210825.1405432-1-rodrigo.vivi@intel.com>
References: <20230508210825.1405432-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0020.namprd08.prod.outlook.com
 (2603:10b6:a03:100::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB5011:EE_
X-MS-Office365-Filtering-Correlation-Id: 14a7eaca-a8c4-4160-5ec8-08db50087321
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zra4S6grBNn3xFll6zAfCkk/3dY8+FBMwG5/ejaRNTtr6n2DmsbQHocaFKUmZQ6r/wY3n1DfB2CD3JMMD8TGI89Ddb6IWW7PtpodVpIIZ90PoNwbac8mQBHLY4LisE8Fcoc99GNae0FLCtx9CAQl2aMOHaaQlf2d5BI3+8skC2vuJuAL7JEk0ECjrj9TZf+VbtWAzYKT8T9XRdalzcCXAOJZi8KDNymPHb0AqSe34Sm+RqmP4ainsLKNZTjd83FY6DqutWP1ewitwjMVBEcNIZa6/WcSGDBRixq2p0nkNVbdrclOAw02NfOFwbtdZ05ynIszEZLz7oeW1GvpgccH1HPDKy5BOUon2IsEH1A7DQJdKC0JOGFXCB6OLwVtDcgLAGlhg6CuloSmY6+qmlbGUnpMMUsQ/eN+fwKe1+5r4cNF09UgRyffujOEndYHCGgJ8qypUT68i8UU/0jqY+csAUccbZ75R3INSOobN/v1JqhFt99KPuzLTIGuv0TukPuaCJdQgfPmwBVEyDHzvh3pTwq9S07YPddnmdSYUjulXbqi5GYIvoUq37FnWJC6dwrN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(396003)(376002)(366004)(136003)(451199021)(86362001)(66476007)(36756003)(54906003)(66946007)(316002)(4326008)(6916009)(66556008)(478600001)(6486002)(5660300002)(2906002)(8936002)(8676002)(41300700001)(30864003)(44832011)(38100700002)(82960400001)(186003)(2616005)(6506007)(26005)(107886003)(1076003)(6512007)(83380400001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u3EUeQI9sCPs4dRC4QiS6Gg8IgUFItFnp/C1rrQkAT6UT6zNzxh7uZQxiccv?=
 =?us-ascii?Q?u3x18gkzEwh/lrKzMYQze0Cylpok33VHsRzZM18zmbMfI4BwcEbXIfLSbRjH?=
 =?us-ascii?Q?orylB+Gdf/0rA8/DgT/pBrBs96jXpDjxdduEULnOqYIIwil5iFen5DUp9CQg?=
 =?us-ascii?Q?+tC0QUQYOtXU+WbmkyZ64jLVA9Eys/HTlIDM+R8VKl9CwZRIdbYvV5FKklq/?=
 =?us-ascii?Q?mkc/QDHsuTxaaNy55uk0Jbbro1yVxCBre8rmcq34Chx5OszUCsplJ7gcDuh9?=
 =?us-ascii?Q?hQTUQycd5pnY0Phh2fqBUOSW3cxfZb7Ec+lZS2tcvG7HVWjE2xIcNmcP1sTb?=
 =?us-ascii?Q?hUgGGp9QJzR91KlYJ3AUTOAcSejIZFuvmLRLzSUVRetvooj/G2e3/QwExWDb?=
 =?us-ascii?Q?K9SkWFDpSNS6HOPBat8tbm36V777P8ye7Vi4CIh7iz0NGLZJp6rj6IrqikFf?=
 =?us-ascii?Q?RD0zBtVarG6e48WFwQUt+6dBy7rMpen5Ym1L1r6h81MEGphji/gbaUHqPm4c?=
 =?us-ascii?Q?4DDbsH90x+cN5mUp+USczZ17sx344GQoGwJzNChVmaIIhnyRfx/x5DRsSHZT?=
 =?us-ascii?Q?utK5AnSlG3oJ6nJ24ecKxLRHQR7UCNpK/96+UjU7X1QU/sZKB0rqpSFIVrjS?=
 =?us-ascii?Q?RSEZK6lEe2QBNYcjsFkoXs85UBBXBgd/ldvQMiktD+CVvAhaCvkkIXycuGoj?=
 =?us-ascii?Q?T+B0XUvznyPZuYA2PDTkFxb/ScGJ6BZs+2dQw3CP4oJsLDEmZ0hi+3VSQiSB?=
 =?us-ascii?Q?JuIZfrpwrJNtOH39nUSNJlsIca2FR1ZVAwx9tUUx5HgUgve05dOh+3UqZAuh?=
 =?us-ascii?Q?3OXEZ21/dyOh5c7Qn5pnIHSFUZYMO3u0He3xoiw+Uxea0G5dLjUyYC0JHj+j?=
 =?us-ascii?Q?8V1LGTw7eSJnbckjW2fSwOBn5uBdzzvShPfCNvRdri00X+WEdXzLIo5cxfHc?=
 =?us-ascii?Q?6tNjuDl+iMhkBfxzIJ8bhrWDM3i1oe6RjqOb9cKRVSYyRgjvK/ivQ8gJht/A?=
 =?us-ascii?Q?n3TKOdH1SvFTuSCUrZ1q0kJNKfR4avm0LSx1ezCKjS1orCWKGFWvJKUegTYw?=
 =?us-ascii?Q?JjEfw1ZJVmDnuRKNj/LQ5YMukDn3k8sTrBn2OqOSfFv6mkroJdeH4SGxI/Ut?=
 =?us-ascii?Q?6cJFSxwXGYqkSEY1u5oMUMXgALm/gdwusun0B7ebwkTzOW21nBJNcSZSuTgz?=
 =?us-ascii?Q?DRpAtElpf/DPF2zfTegYOgz+RJOIav8CURCOBPTxxBlioalVI193Wm1Cfqod?=
 =?us-ascii?Q?Ls1aDXelB9hipgGoGrhEevX7UsGKsO9HX0JD862opYYfWJU811uL2yayvumM?=
 =?us-ascii?Q?RqCK5Q7VnnK+I6F6xjt55T00Vk3wWIk1cBsdU4A/chhDtilYWQSJ8VPsCDxV?=
 =?us-ascii?Q?DY/QmAUH4YUjB6NS50QtUngcZg90uE2dkhLn2OvzLYg780S3oWCfefoPvYdi?=
 =?us-ascii?Q?KbBHG0KF4YkgBsibSkz7lnITU9GCK7NB38lSSGtCRdZHETgCfbHBawsVs+RM?=
 =?us-ascii?Q?jY9k630z1W32br1pyXKOZpU3IxbSJSxyNzDf4bBkTtYMIA/R72445yOO40kN?=
 =?us-ascii?Q?d/OpBFIb1Fr/gT9RlZFNVj4FuyoWdID1AM3OCvx9vJlHRhXO0C7JIm9J7C9P?=
 =?us-ascii?Q?8Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14a7eaca-a8c4-4160-5ec8-08db50087321
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 21:09:02.7883 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1gmm6qQNTOWKn+uXyCwVt/goiT/0NJMkw5+JiS77xlF3TYLg7/tGH3UbflBdsgPt7emcdMGM6Hx0iU6VUciqsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5011
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v3 09/11] drm/xe: Convert Xe HW Engine print to
 snapshot capture and print.
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

The goal is to allow for a snapshot capture to be taken at the time
of the crash, while the print out can happen at a later time through
the exposed devcoredump virtual device.

v2: Addressing these Matthew comments:
    - Handle memory allocation failures.
    - Do not use GFP_ATOMIC on cases like debugfs prints.
    - placement of @reg doc.
    - identation issues.
v3: checkpatch

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c      |   2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c      |   2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c       | 225 ++++++++++++++++++------
 drivers/gpu/drm/xe/xe_hw_engine.h       |   9 +-
 drivers/gpu/drm/xe/xe_hw_engine_types.h |  78 ++++++++
 5 files changed, 255 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index c45486c2015a..13ca17f1ff6f 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -42,7 +42,7 @@ static int hw_engines(struct seq_file *m, void *data)
 	}
 
 	for_each_hw_engine(hwe, gt, id)
-		xe_hw_engine_print_state(hwe, &p);
+		xe_hw_engine_print(hwe, &p, false);
 
 	xe_device_mem_access_put(xe);
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index b5ec1aa55451..1f1aaea99a13 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -752,7 +752,7 @@ static void simple_error_capture(struct xe_engine *e)
 			if (hwe->class != e->hwe->class ||
 			    !(BIT(hwe->logical_instance) & adj_logical_mask))
 				continue;
-			xe_hw_engine_print_state(hwe, &p);
+			xe_hw_engine_print(hwe, &p, true);
 		}
 		xe_analyze_vm(&p, e->vm, e->gt->info.id);
 		xe_force_wake_put(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index a9adac0624f6..fc69aabd705c 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -569,77 +569,186 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
 		xe_hw_fence_irq_run(hwe->fence_irq);
 }
 
-void xe_hw_engine_print_state(struct xe_hw_engine *hwe, struct drm_printer *p)
+/**
+ * xe_hw_engine_snapshot_capture - Take a quick snapshot of the HW Engine.
+ * @hwe: Xe HW Engine.
+ * @atomic: Boolean to indicate if this is called from atomic context like
+ * resets or from some regular path like debugfs.
+ *
+ * This can be printed out in a later stage like during dev_coredump
+ * analysis.
+ *
+ * Returns: a Xe HW Engine snapshot object that must be freed by the
+ * caller, using `xe_hw_engine_snapshot_free`.
+ */
+struct xe_hw_engine_snapshot *
+xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, bool atomic)
 {
+	struct xe_hw_engine_snapshot *snapshot;
+	int len;
+
 	if (!xe_hw_engine_is_valid(hwe))
+		return NULL;
+
+	snapshot = kzalloc(sizeof(*snapshot), atomic ? GFP_ATOMIC : GFP_KERNEL);
+
+	if (!snapshot)
+		return NULL;
+
+	len = strlen(hwe->name) + 1;
+	snapshot->name = kzalloc(len, atomic ? GFP_ATOMIC : GFP_KERNEL);
+	if (snapshot->name)
+		strscpy(snapshot->name, hwe->name, len);
+
+	snapshot->class = hwe->class;
+	snapshot->logical_instance = hwe->logical_instance;
+	snapshot->forcewake.domain = hwe->domain;
+	snapshot->forcewake.ref = xe_force_wake_ref(gt_to_fw(hwe->gt),
+						    hwe->domain);
+	snapshot->mmio_base = hwe->mmio_base;
+
+	snapshot->reg.ring_hwstam = hw_engine_mmio_read32(hwe,
+							  RING_HWSTAM(0).reg);
+	snapshot->reg.ring_hws_pga = hw_engine_mmio_read32(hwe,
+							   RING_HWS_PGA(0).reg);
+	snapshot->reg.ring_execlist_status_lo =
+		hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_LO(0).reg);
+	snapshot->reg.ring_execlist_status_hi =
+		hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_HI(0).reg);
+	snapshot->reg.ring_execlist_sq_contents_lo =
+		hw_engine_mmio_read32(hwe,
+				      RING_EXECLIST_SQ_CONTENTS_LO(0).reg);
+	snapshot->reg.ring_execlist_sq_contents_hi =
+		hw_engine_mmio_read32(hwe,
+				      RING_EXECLIST_SQ_CONTENTS_HI(0).reg);
+	snapshot->reg.ring_execlist_control =
+		hw_engine_mmio_read32(hwe, RING_EXECLIST_CONTROL(0).reg);
+	snapshot->reg.ring_start = hw_engine_mmio_read32(hwe,
+							 RING_START(0).reg);
+	snapshot->reg.ring_head =
+		hw_engine_mmio_read32(hwe, RING_HEAD(0).reg) & HEAD_ADDR;
+	snapshot->reg.ring_tail =
+		hw_engine_mmio_read32(hwe, RING_TAIL(0).reg) & TAIL_ADDR;
+	snapshot->reg.ring_ctl = hw_engine_mmio_read32(hwe, RING_CTL(0).reg);
+	snapshot->reg.ring_mi_mode =
+		hw_engine_mmio_read32(hwe, RING_MI_MODE(0).reg);
+	snapshot->reg.ring_mode_gen7 =
+		hw_engine_mmio_read32(hwe, RING_MODE(0).reg);
+	snapshot->reg.ring_imr = hw_engine_mmio_read32(hwe, RING_IMR(0).reg);
+	snapshot->reg.ring_esr = hw_engine_mmio_read32(hwe, RING_ESR(0).reg);
+	snapshot->reg.ring_emr = hw_engine_mmio_read32(hwe, RING_EMR(0).reg);
+	snapshot->reg.ring_eir = hw_engine_mmio_read32(hwe, RING_EIR(0).reg);
+	snapshot->reg.ring_acthd_udw =
+		hw_engine_mmio_read32(hwe, RING_ACTHD_UDW(0).reg);
+	snapshot->reg.ring_acthd = hw_engine_mmio_read32(hwe,
+							 RING_ACTHD(0).reg);
+	snapshot->reg.ring_bbaddr_udw =
+		hw_engine_mmio_read32(hwe, RING_BBADDR_UDW(0).reg);
+	snapshot->reg.ring_bbaddr = hw_engine_mmio_read32(hwe,
+							  RING_BBADDR(0).reg);
+	snapshot->reg.ring_dma_fadd_udw =
+		hw_engine_mmio_read32(hwe, RING_DMA_FADD_UDW(0).reg);
+	snapshot->reg.ring_dma_fadd =
+		hw_engine_mmio_read32(hwe, RING_DMA_FADD(0).reg);
+	snapshot->reg.ipeir = hw_engine_mmio_read32(hwe, IPEIR(0).reg);
+	snapshot->reg.ipehr = hw_engine_mmio_read32(hwe, IPEHR(0).reg);
+
+	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
+		snapshot->reg.rcu_mode = xe_mmio_read32(hwe->gt, RCU_MODE.reg);
+
+	return snapshot;
+}
+
+/**
+ * xe_hw_engine_snapshot_print - Print out a given Xe HW Engine snapshot.
+ * @snapshot: Xe HW Engine snapshot object.
+ * @p: drm_printer where it will be printed out.
+ *
+ * This function prints out a given Xe HW Engine snapshot object.
+ */
+void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
+				 struct drm_printer *p)
+{
+	if (!snapshot)
 		return;
 
-	drm_printf(p, "%s (physical), logical instance=%d\n", hwe->name,
-		hwe->logical_instance);
+	drm_printf(p, "%s (physical), logical instance=%d\n",
+		   snapshot->name ? snapshot->name : "",
+		   snapshot->logical_instance);
 	drm_printf(p, "\tForcewake: domain 0x%x, ref %d\n",
-		hwe->domain,
-		xe_force_wake_ref(gt_to_fw(hwe->gt), hwe->domain));
-	drm_printf(p, "\tMMIO base: 0x%08x\n", hwe->mmio_base);
-
-	drm_printf(p, "\tHWSTAM: 0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_HWSTAM(0).reg));
-	drm_printf(p, "\tRING_HWS_PGA: 0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_HWS_PGA(0).reg));
-
+		   snapshot->forcewake.domain, snapshot->forcewake.ref);
+	drm_printf(p, "\tMMIO base: 0x%08x\n", snapshot->mmio_base);
+	drm_printf(p, "\tHWSTAM: 0x%08x\n", snapshot->reg.ring_hwstam);
+	drm_printf(p, "\tRING_HWS_PGA: 0x%08x\n", snapshot->reg.ring_hws_pga);
 	drm_printf(p, "\tRING_EXECLIST_STATUS_LO: 0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_LO(0).reg));
+		   snapshot->reg.ring_execlist_status_lo);
 	drm_printf(p, "\tRING_EXECLIST_STATUS_HI: 0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_HI(0).reg));
+		   snapshot->reg.ring_execlist_status_hi);
 	drm_printf(p, "\tRING_EXECLIST_SQ_CONTENTS_LO: 0x%08x\n",
-		hw_engine_mmio_read32(hwe,
-					 RING_EXECLIST_SQ_CONTENTS_LO(0).reg));
+		   snapshot->reg.ring_execlist_sq_contents_lo);
 	drm_printf(p, "\tRING_EXECLIST_SQ_CONTENTS_HI: 0x%08x\n",
-		hw_engine_mmio_read32(hwe,
-					 RING_EXECLIST_SQ_CONTENTS_HI(0).reg));
+		   snapshot->reg.ring_execlist_sq_contents_hi);
 	drm_printf(p, "\tRING_EXECLIST_CONTROL: 0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_EXECLIST_CONTROL(0).reg));
-
-	drm_printf(p, "\tRING_START: 0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_START(0).reg));
-	drm_printf(p, "\tRING_HEAD:  0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_HEAD(0).reg) & HEAD_ADDR);
-	drm_printf(p, "\tRING_TAIL:  0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_TAIL(0).reg) & TAIL_ADDR);
-	drm_printf(p, "\tRING_CTL: 0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_CTL(0).reg));
-	drm_printf(p, "\tRING_MODE: 0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_MI_MODE(0).reg));
+		   snapshot->reg.ring_execlist_control);
+	drm_printf(p, "\tRING_START: 0x%08x\n", snapshot->reg.ring_start);
+	drm_printf(p, "\tRING_HEAD:  0x%08x\n", snapshot->reg.ring_head);
+	drm_printf(p, "\tRING_TAIL:  0x%08x\n", snapshot->reg.ring_tail);
+	drm_printf(p, "\tRING_CTL: 0x%08x\n", snapshot->reg.ring_ctl);
+	drm_printf(p, "\tRING_MODE: 0x%08x\n", snapshot->reg.ring_mi_mode);
 	drm_printf(p, "\tRING_MODE_GEN7: 0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_MODE(0).reg));
-
-	drm_printf(p, "\tRING_IMR:   0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_IMR(0).reg));
-	drm_printf(p, "\tRING_ESR:   0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_ESR(0).reg));
-	drm_printf(p, "\tRING_EMR:   0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_EMR(0).reg));
-	drm_printf(p, "\tRING_EIR:   0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_EIR(0).reg));
-
-        drm_printf(p, "\tACTHD:  0x%08x_%08x\n",
-		hw_engine_mmio_read32(hwe, RING_ACTHD_UDW(0).reg),
-		hw_engine_mmio_read32(hwe, RING_ACTHD(0).reg));
-        drm_printf(p, "\tBBADDR: 0x%08x_%08x\n",
-		hw_engine_mmio_read32(hwe, RING_BBADDR_UDW(0).reg),
-		hw_engine_mmio_read32(hwe, RING_BBADDR(0).reg));
-        drm_printf(p, "\tDMA_FADDR: 0x%08x_%08x\n",
-		hw_engine_mmio_read32(hwe, RING_DMA_FADD_UDW(0).reg),
-		hw_engine_mmio_read32(hwe, RING_DMA_FADD(0).reg));
-
-	drm_printf(p, "\tIPEIR: 0x%08x\n",
-		hw_engine_mmio_read32(hwe, IPEIR(0).reg));
-	drm_printf(p, "\tIPEHR: 0x%08x\n\n",
-		hw_engine_mmio_read32(hwe, IPEHR(0).reg));
-
-	if (hwe->class == XE_ENGINE_CLASS_COMPUTE)
+		   snapshot->reg.ring_mode_gen7);
+	drm_printf(p, "\tRING_IMR:   0x%08x\n", snapshot->reg.ring_imr);
+	drm_printf(p, "\tRING_ESR:   0x%08x\n", snapshot->reg.ring_esr);
+	drm_printf(p, "\tRING_EMR:   0x%08x\n", snapshot->reg.ring_emr);
+	drm_printf(p, "\tRING_EIR:   0x%08x\n", snapshot->reg.ring_eir);
+	drm_printf(p, "\tACTHD:  0x%08x_%08x\n", snapshot->reg.ring_acthd_udw,
+		   snapshot->reg.ring_acthd);
+	drm_printf(p, "\tBBADDR: 0x%08x_%08x\n", snapshot->reg.ring_bbaddr_udw,
+		   snapshot->reg.ring_bbaddr);
+	drm_printf(p, "\tDMA_FADDR: 0x%08x_%08x\n",
+		   snapshot->reg.ring_dma_fadd_udw,
+		   snapshot->reg.ring_dma_fadd);
+	drm_printf(p, "\tIPEIR: 0x%08x\n", snapshot->reg.ipeir);
+	drm_printf(p, "\tIPEHR: 0x%08x\n\n", snapshot->reg.ipehr);
+
+	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
 		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
-			xe_mmio_read32(hwe->gt, RCU_MODE.reg));
+			   snapshot->reg.rcu_mode);
+}
+
+/**
+ * xe_hw_engine_snapshot_free - Free all allocated objects for a given snapshot.
+ * @snapshot: Xe HW Engine snapshot object.
+ *
+ * This function free all the memory that needed to be allocated at capture
+ * time.
+ */
+void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot)
+{
+	if (!snapshot)
+		return;
+
+	kfree(snapshot->name);
+	kfree(snapshot);
+}
+
+/**
+ * xe_hw_engine_print - Xe HW Engine Print.
+ * @hwe: Hardware Engine.
+ * @p: drm_printer.
+ * @atomic: Boolean to indicate if this is called from atomic context like
+ * resets or from some regular path like debugfs.
+ *
+ * This function quickly capture a snapshot and immediately print it out.
+ */
+void xe_hw_engine_print(struct xe_hw_engine *hwe, struct drm_printer *p,
+			bool atomic)
+{
+	struct xe_hw_engine_snapshot *snapshot;
 
+	snapshot = xe_hw_engine_snapshot_capture(hwe, atomic);
+	xe_hw_engine_snapshot_print(snapshot, p);
+	xe_hw_engine_snapshot_free(snapshot);
 }
 
 u32 xe_hw_engine_mask_per_class(struct xe_gt *gt,
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index 013efcd6d8c5..f933fa5cd72d 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -14,9 +14,16 @@ int xe_hw_engines_init_early(struct xe_gt *gt);
 int xe_hw_engines_init(struct xe_gt *gt);
 void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec);
 void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe);
-void xe_hw_engine_print_state(struct xe_hw_engine *hwe, struct drm_printer *p);
 u32 xe_hw_engine_mask_per_class(struct xe_gt *gt,
 				enum xe_engine_class engine_class);
+
+struct xe_hw_engine_snapshot *
+xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, bool atomic);
+void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot);
+void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
+				 struct drm_printer *p);
+void xe_hw_engine_print(struct xe_hw_engine *hwe, struct drm_printer *p,
+			bool atomic);
 void xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe);
 
 bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index 2c40384957da..d3d7ecb7f4d3 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -109,4 +109,82 @@ struct xe_hw_engine {
 	enum xe_hw_engine_id engine_id;
 };
 
+/**
+ * struct xe_hw_engine_snapshot - Hardware engine snapshot
+ *
+ * Contains the snapshot of useful hardware engine info and registers.
+ */
+struct xe_hw_engine_snapshot {
+	/** @name: name of the hw engine */
+	char *name;
+	/** @class: class of this hw engine */
+	enum xe_engine_class class;
+	/** @logical_instance: logical instance of this hw engine */
+	u16 logical_instance;
+	/** @forcewake: Force Wake information snapshot */
+	struct {
+		/** @domain: force wake domain of this hw engine */
+		enum xe_force_wake_domains domain;
+		/** @ref: Forcewake ref for the above domain */
+		int ref;
+	} forcewake;
+	/** @mmio_base: MMIO base address of this hw engine*/
+	u32 mmio_base;
+	/** @reg: Useful MMIO register snapshot */
+	struct {
+		/** @ring_hwstam: RING_HWSTAM */
+		u32 ring_hwstam;
+		/** @ring_hws_pga: RING_HWS_PGA */
+		u32 ring_hws_pga;
+		/** @ring_execlist_status_lo: RING_EXECLIST_STATUS_LO */
+		u32 ring_execlist_status_lo;
+		/** @ring_execlist_status_hi: RING_EXECLIST_STATUS_HI */
+		u32 ring_execlist_status_hi;
+		/** @ring_execlist_sq_contents_lo: RING_EXECLIST_SQ_CONTENTS */
+		u32 ring_execlist_sq_contents_lo;
+		/** @ring_execlist_sq_contents_hi: RING_EXECLIST_SQ_CONTENTS + 4 */
+		u32 ring_execlist_sq_contents_hi;
+		/** @ring_execlist_control: RING_EXECLIST_CONTROL */
+		u32 ring_execlist_control;
+		/** @ring_start: RING_START */
+		u32 ring_start;
+		/** @ring_head: RING_HEAD */
+		u32 ring_head;
+		/** @ring_tail: RING_TAIL */
+		u32 ring_tail;
+		/** @ring_ctl: RING_CTL */
+		u32 ring_ctl;
+		/** @ring_mi_mode: RING_MI_MODE */
+		u32 ring_mi_mode;
+		/** @ring_mode_gen7: RING_MODE_GEN7 */
+		u32 ring_mode_gen7;
+		/** @ring_imr: RING_IMR */
+		u32 ring_imr;
+		/** @ring_esr: RING_ESR */
+		u32 ring_esr;
+		/** @ring_emr: RING_EMR */
+		u32 ring_emr;
+		/** @ring_eir: RING_EIR */
+		u32 ring_eir;
+		/** @ring_acthd_udw: RING_ACTHD_UDW */
+		u32 ring_acthd_udw;
+		/** @ring_acthd: RING_ACTHD */
+		u32 ring_acthd;
+		/** @ring_bbaddr_udw: RING_BBADDR_UDW */
+		u32 ring_bbaddr_udw;
+		/** @ring_bbaddr: RING_BBADDR */
+		u32 ring_bbaddr;
+		/** @ring_dma_fadd_udw: RING_DMA_FADD_UDW */
+		u32 ring_dma_fadd_udw;
+		/** @ring_dma_fadd: RING_DMA_FADD */
+		u32 ring_dma_fadd;
+		/** @ipeir: IPEIR */
+		u32 ipeir;
+		/** @ipehr: IPEHR */
+		u32 ipehr;
+		/** @rcu_mode: GEN12_RCU_MODE */
+		u32 rcu_mode;
+	} reg;
+};
+
 #endif
-- 
2.39.2

