Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38EFFC77B75
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 21:08:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C18410E0A9;
	Mon,  8 May 2023 21:08:49 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2782D10E0A9
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 21:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683580127; x=1715116127;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=10ye/kzR32LnUT46t26qZ5nasGnka0o3nGqxD3xBRwY=;
 b=YwRfJSY8GjabQ0T9Kgc8amptKq7On1rxzcSAehD3u6wusm1cr7cjlTun
 nmZaAuGUsjOEFcXLIyPacoQb2Sga1sEfc87XzoJJHgxTBfOTuxbSZFOPk
 82ouVHqA/X8SV12/BHW4HD7jsbyd3kSXboMTHBIYy0PZf2bGJVsHW1m25
 Hp15d1IpmXWqEYpNo3KriBo84te4VYHhtqq3VG/9Owk45hrJcG6JDG0Z8
 jmjF+NOnD21VOE1jTSQcNT8ZNmSf332BXgbFFR7RuZ/7pEo/2o6395gsZ
 5iVcBwjX8JF6RT/w/HJu1CERGRTr77CjOofGRd9x0pcYRgsh1WVv4/Wkh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="415319288"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="415319288"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 14:08:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="649029234"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="649029234"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 08 May 2023 14:08:46 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 14:08:45 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 14:08:45 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 14:08:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BXbC0tQDVFSCRrzuLUxSxSm2bj4rVH88RK70bTCadPHWw1vOxxKSjzyAPpA5UChGbu6rkuSOkuUUmmKK1NG82F4mWKNFhO51a1FGomXrrO9xpiXxGKOAykRhWDijAU5c5sPtevi3Xn6J3Ox3Bjw4E8ynJ+OQnlAmmHrrdI4CAIjl2RkF6PW0qlkdfa5Sq15tkLihPP/WqStQFNTRi7b3bYSzV4xi+hiM/L1X6zRoxT8TbWwsk9gRtggDa5h6snVqTSejqU7UCl74lAPfNZOsXsORCDbZFP39pRtM1Fuuf2/7dkaAXhRH7kv7QW/rdZkyJQIzLc6EPjY7heRQO6XpYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=042OaVkCc+S6ub05Nrlibn1Zbp2rwJqKC1b6zzvREUA=;
 b=nGaf9Zm1WpjTdlt1c9gbNnJtOBr+arb70D1QPkuFpW9/xuIF4od7y/Xzdd6PDADmp0eCFbPIZAtlDk7HwFZEotdYXD6rRndm4YzUjPVH80l4kKZSKkTXK/njgHhV/gvWzoGGTh3r0R6/aau+hF9Js90+iuBhSZGL6Sbqjx1U1NBLFnPnUPd5EvJC7nCjsnxEaK+1w59ZVP/BuhTwv+eDyFxOst+2YJIW+Glx1CsE//NFEkYOLlQsFpGazhRmT0cH8pzRkyocJkHYEBa+dmPbUDJxT+jDEkTyWsZaDaNIVQMJ8lP7TEWts3il732eGVZDRW0hFVzZBcaxu4Q73IOJyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW5PR11MB5883.namprd11.prod.outlook.com (2603:10b6:303:19f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 21:08:43 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 21:08:43 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 8 May 2023 17:08:18 -0400
Message-ID: <20230508210825.1405432-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508210825.1405432-1-rodrigo.vivi@intel.com>
References: <20230508210825.1405432-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0041.namprd07.prod.outlook.com
 (2603:10b6:a03:60::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW5PR11MB5883:EE_
X-MS-Office365-Filtering-Correlation-Id: 52298cc3-95b6-4db9-0926-08db500867be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lRPU2hMis24jTUIdsOWxv2XwbxGL1nuhfP4/TXFJ7JIop/P7mw+B2l7zS5sipYK4J8iSZSveuxcMFwKd6h/WJkXcgFM+xRETN3yCYbiXiJNbfXOPGIPBm1O9qjDQ9syojZ9sB6EhLiR7xjlHX3OZZmwodA54RdePTPr0ecaOj42aBOhPMJ/7I48UBa7oV+3+0Da2P70Zi2A/NFM2zSLnMX/MTmRGr6uTNe3dmHuQIsGd91FFJ+C4zp4Q7ziAoIK7A3eBGuJfX/Dfc47/eWIBELa3jffU2mRorIfZ3hOaHslfl8KJWSpi8+x48Snl1cKHDKnFpt8I24XGfKNEf0dj1e2dB1x7Hcln6Z5X9nIakOKrQ7XAk+rAPKe25bYBn3JwQKJg53EjWJiwH1lO0Q5HM/BpElV5O3FnkvMWb2k81q5iGhhH4g9ihScZW4kpN3XmfCazJKfZO5EUPeBX3+bTfDSkuPknrBRRak6dvu+mFy9VA1XtGVjLZGaeCzVnGiqOS3ViMh7LOeZFqDMotmFdj9TjEYL49jv4WODeGwl9kxIUxwpQ0ebzwhYFwOHxVT+l
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(136003)(396003)(376002)(366004)(451199021)(83380400001)(107886003)(478600001)(6666004)(54906003)(6486002)(2616005)(6512007)(26005)(186003)(6506007)(1076003)(4326008)(2906002)(30864003)(44832011)(36756003)(38100700002)(6916009)(66946007)(66476007)(82960400001)(41300700001)(66556008)(86362001)(8936002)(316002)(5660300002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Dd63u+9kT51vsDe7MAiBrta5Br75sKi4v6PcpKPYIQi1PhLx1Jmcdh0rEdUW?=
 =?us-ascii?Q?yzzOGTVwo1wZM66wfxpcO2hq0hCeTEbdc1DXJsir8592Lp2+UAo7vl7Xaq8b?=
 =?us-ascii?Q?0eDeR3QxK3AFcVp2bO1An1wTAu3akBs329Z1FNdirxJ7bvmKz9p6jCGf/nva?=
 =?us-ascii?Q?DBFsgI/uKBdXKOGrX4iw2eRuunwzT+y/K/L6d4d0tvzG6mRanWnspV1NstBI?=
 =?us-ascii?Q?5VQVsqIgsgBlJsxtlQeVW6qPthOnSK9j7EzeERlzrV3/EMwi1fFypxNrEP8u?=
 =?us-ascii?Q?mcSgC2CkK0thbD0fOQk8CuLAoQZESeig4blY+judOT68Sft6fxMvlTtQ5VJR?=
 =?us-ascii?Q?+owHgCpEBv4UfJD3e55TpjMaJ0m8QqRVN9gH5VYjf941yFwMV8hKgNKafbDO?=
 =?us-ascii?Q?IUsHfZuPmTXy5K/lSo0P0P9uCC+LTDl+OIgKzRvXj1McwE52qF0Z6BVfGjpZ?=
 =?us-ascii?Q?1CBa15yxO9EGq29WQ+bTrbTqZ1twt7zsyBCg0WDLNWxn+ALvhNwm3fvN2ote?=
 =?us-ascii?Q?/8pgsDYyssLyVH1KrEWUyeLIJVogF5SSgJnhhuOp8M/HMR9sTvPAovWZmacI?=
 =?us-ascii?Q?XSKwh5nXzLaCafxWHvzeAzwWT8LyaTIP40JdRFDfUs1mgKjLrkX30RFsAaRY?=
 =?us-ascii?Q?JIdwLB2AwV8rFcl4kFK8TGcgi7ZzMx8mCmrcA1mjupfnSxMje8ef1BQmY8Bv?=
 =?us-ascii?Q?EyXsmSJ0l/FQjwgp21rGi91GyvFMSzzoFwfJVJA/Oqr6lVncYhro7z8P69aR?=
 =?us-ascii?Q?1iqJfEBMMhSkkxSK1NNBw6/lRnm3ok3Lxz2TdGtU8ry9WKb8RB+uuj/PR1dl?=
 =?us-ascii?Q?TwIR/DJP+JqnAjVeW9qEAwHblRnTzLMZawlXOZYw+glyvGzY8tksaJTC0d7w?=
 =?us-ascii?Q?8A2aZ1kZghYufeGroov6qTRgaEuc3NiDWQgsPzMeC1waKW/lU/4Hh+HjZqgp?=
 =?us-ascii?Q?xf80ntQHqz2Sew3vEboKEWRgVYRnqvozZwW8kYo6wO92noJbjJwyUQK4Kryu?=
 =?us-ascii?Q?YZ0deDXxzWV+V0PiX4uEawubYHsAYC5oRA9zXOFvjOOBG8ruS4zwysWwcPN9?=
 =?us-ascii?Q?JISEgAfE24KHi++gW6GZsRAnafGyQLODEulX1afxMHcSiKUwBmW/NBh1WTX/?=
 =?us-ascii?Q?Ad4cnrsG1Y1Vd9dVZCzwRImwNWGA7FOOgGwkjp/C7oioeVismrXAtF/6MGRJ?=
 =?us-ascii?Q?Rx/oPXq3gEGSOjr/bKhpFF7f19nXIBVhzrEpRmN4LOhP2YmFx/JU5uR3oFr6?=
 =?us-ascii?Q?qbePe3pohVmEh76iV23xWnEKDHWtyykhRQtJHw3CDvCGTicJWX/bzi4n9XFi?=
 =?us-ascii?Q?PkQgXU+OS/2ZrzezSIDqgz0tr7PLDXHX8lAnGc9gufS/OmqQTdUOJNbFoQfN?=
 =?us-ascii?Q?+iYU0NOgrqGp42ZBMQbkol/ci7B9C8yVqOTlO/o53/4fAJbH9Q7QjLGI370j?=
 =?us-ascii?Q?12A543CEnKhC1/nV4HSbhe7C5jiPsPXYJBU6PByU2kFfhkDYieaxbXdyc+jO?=
 =?us-ascii?Q?d0EWVg3JEm7c/bcuQgCMM1TmgWOPC2Bt7iXiVny66epsQeNKZ6MOxyM1MJCv?=
 =?us-ascii?Q?60S2zJPFznTRP/rLPnCkSxE0RoFK3JNLl/tEXx1cV+0y5J1wwoThKh8JqzYN?=
 =?us-ascii?Q?Lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52298cc3-95b6-4db9-0926-08db500867be
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 21:08:43.7075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KRpjgMGR3zE4n8eTGSA4cBFX1UDRMqOfH7KkAD9lN15JtKGLlbxGurZEY6Cb0p7373xEGTUlpxkyGtgZ86HzUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5883
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v3 04/11] drm/xe: Convert GuC CT print to
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

v2: Handle memory allocation failures. (Matthew)
    Do not use GFP_ATOMIC on cases like debugfs prints. (Matthew)
v3: checkpatch fixes

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c          |   2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c       | 166 +++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_guc_ct.h       |   8 +-
 drivers/gpu/drm/xe/xe_guc_ct_types.h |  26 +++++
 drivers/gpu/drm/xe/xe_guc_submit.c   |   2 +-
 5 files changed, 179 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 62b4fcf84acf..985f6e901ee4 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -856,6 +856,6 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
 
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 
-	xe_guc_ct_print(&guc->ct, p);
+	xe_guc_ct_print(&guc->ct, p, false);
 	xe_guc_submit_print(guc, p);
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index e16e5fe37ed4..d66e595c8020 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -595,7 +595,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
 
 broken:
 	drm_err(drm, "No forward process on H2G, reset required");
-	xe_guc_ct_print(ct, &p);
+	xe_guc_ct_print(ct, &p, true);
 	ct->ctbs.h2g.info.broken = true;
 
 	return -EDEADLK;
@@ -1088,38 +1088,40 @@ static void g2h_worker_func(struct work_struct *w)
 			struct drm_device *drm = &ct_to_xe(ct)->drm;
 			struct drm_printer p = drm_info_printer(drm->dev);
 
-			xe_guc_ct_print(ct, &p);
+			xe_guc_ct_print(ct, &p, true);
 			kick_reset(ct);
 		}
 	} while (ret == 1);
 	xe_device_mem_access_put(ct_to_xe(ct));
 }
 
-static void guc_ct_ctb_print(struct xe_device *xe, struct guc_ctb *ctb,
-			     struct drm_printer *p)
+static void guc_ctb_snapshot_capture(struct xe_device *xe, struct guc_ctb *ctb,
+				     struct guc_ctb_snapshot *snapshot,
+				     bool atomic)
 {
 	u32 head, tail;
 
-	drm_printf(p, "\tsize: %d\n", ctb->info.size);
-	drm_printf(p, "\tresv_space: %d\n", ctb->info.resv_space);
-	drm_printf(p, "\thead: %d\n", ctb->info.head);
-	drm_printf(p, "\ttail: %d\n", ctb->info.tail);
-	drm_printf(p, "\tspace: %d\n", ctb->info.space);
-	drm_printf(p, "\tbroken: %d\n", ctb->info.broken);
+	xe_map_memcpy_from(xe, &snapshot->desc, &ctb->desc, 0,
+			   sizeof(struct guc_ct_buffer_desc));
+	memcpy(&snapshot->info, &ctb->info, sizeof(struct guc_ctb_info));
 
-	head = desc_read(xe, ctb, head);
-	tail = desc_read(xe, ctb, tail);
-	drm_printf(p, "\thead (memory): %d\n", head);
-	drm_printf(p, "\ttail (memory): %d\n", tail);
-	drm_printf(p, "\tstatus (memory): 0x%x\n", desc_read(xe, ctb, status));
+	snapshot->cmds = kmalloc_array(ctb->info.size, sizeof(u32),
+				       atomic ? GFP_ATOMIC : GFP_KERNEL);
+
+	if (!snapshot->cmds) {
+		drm_err(&xe->drm, "Skipping CTB commands snapshot. Only CTB info will be available.\n");
+		return;
+	}
+
+	head = snapshot->desc.head;
+	tail = snapshot->desc.tail;
 
 	if (head != tail) {
 		struct iosys_map map =
 			IOSYS_MAP_INIT_OFFSET(&ctb->cmds, head * sizeof(u32));
 
 		while (head != tail) {
-			drm_printf(p, "\tcmd[%d]: 0x%08x\n", head,
-				   xe_map_rd(xe, &map, 0, u32));
+			snapshot->cmds[head] = xe_map_rd(xe, &map, 0, u32);
 			++head;
 			if (head == ctb->info.size) {
 				head = 0;
@@ -1131,20 +1133,140 @@ static void guc_ct_ctb_print(struct xe_device *xe, struct guc_ctb *ctb,
 	}
 }
 
-void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p)
+static void guc_ctb_snapshot_print(struct guc_ctb_snapshot *snapshot,
+				   struct drm_printer *p)
+{
+	u32 head, tail;
+
+	drm_printf(p, "\tsize: %d\n", snapshot->info.size);
+	drm_printf(p, "\tresv_space: %d\n", snapshot->info.space);
+	drm_printf(p, "\thead: %d\n", snapshot->info.head);
+	drm_printf(p, "\ttail: %d\n", snapshot->info.tail);
+	drm_printf(p, "\tspace: %d\n", snapshot->info.space);
+	drm_printf(p, "\tbroken: %d\n", snapshot->info.broken);
+	drm_printf(p, "\thead (memory): %d\n", snapshot->desc.head);
+	drm_printf(p, "\ttail (memory): %d\n", snapshot->desc.tail);
+	drm_printf(p, "\tstatus (memory): 0x%x\n", snapshot->desc.status);
+
+	if (!snapshot->cmds)
+		return;
+
+	head = snapshot->desc.head;
+	tail = snapshot->desc.tail;
+
+	while (head != tail) {
+		drm_printf(p, "\tcmd[%d]: 0x%08x\n", head,
+			   snapshot->cmds[head]);
+		++head;
+		if (head == snapshot->info.size)
+			head = 0;
+	}
+}
+
+static void guc_ctb_snapshot_free(struct guc_ctb_snapshot *snapshot)
 {
+	kfree(snapshot->cmds);
+}
+
+/**
+ * xe_guc_ct_snapshot_capture - Take a quick snapshot of the CT state.
+ * @ct: GuC CT object.
+ * @atomic: Boolean to indicate if this is called from atomic context like
+ * reset or CTB handler or from some regular path like debugfs.
+ *
+ * This can be printed out in a later stage like during dev_coredump
+ * analysis.
+ *
+ * Returns: a GuC CT snapshot object that must be freed by the caller
+ * by using `xe_guc_ct_snapshot_free`.
+ */
+struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct,
+						      bool atomic)
+{
+	struct xe_device *xe = ct_to_xe(ct);
+	struct xe_guc_ct_snapshot *snapshot;
+
+	snapshot = kzalloc(sizeof(*snapshot),
+			   atomic ? GFP_ATOMIC : GFP_KERNEL);
+
+	if (!snapshot) {
+		drm_err(&xe->drm, "Skipping CTB snapshot entirely.\n");
+		return NULL;
+	}
+
 	if (ct->enabled) {
+		snapshot->ct_enabled = true;
+		guc_ctb_snapshot_capture(xe, &ct->ctbs.h2g,
+					 &snapshot->h2g, atomic);
+		guc_ctb_snapshot_capture(xe, &ct->ctbs.g2h,
+					 &snapshot->g2h, atomic);
+	}
+
+	return snapshot;
+}
+
+/**
+ * xe_guc_ct_snapshot_print - Print out a given GuC CT snapshot.
+ * @snapshot: GuC CT snapshot object.
+ * @p: drm_printer where it will be printed out.
+ *
+ * This function prints out a given GuC CT snapshot object.
+ */
+void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
+			      struct drm_printer *p)
+{
+	if (!snapshot)
+		return;
+
+	if (snapshot->ct_enabled) {
 		drm_puts(p, "\nH2G CTB (all sizes in DW):\n");
-		guc_ct_ctb_print(ct_to_xe(ct), &ct->ctbs.h2g, p);
+		guc_ctb_snapshot_print(&snapshot->h2g, p);
 
 		drm_puts(p, "\nG2H CTB (all sizes in DW):\n");
-		guc_ct_ctb_print(ct_to_xe(ct), &ct->ctbs.g2h, p);
-		drm_printf(p, "\tg2h outstanding: %d\n", ct->g2h_outstanding);
+		guc_ctb_snapshot_print(&snapshot->g2h, p);
+
+		drm_printf(p, "\tg2h outstanding: %d\n",
+			   snapshot->g2h_outstanding);
 	} else {
 		drm_puts(p, "\nCT disabled\n");
 	}
 }
 
+/**
+ * xe_guc_ct_snapshot_free - Free all allocated objects for a given snapshot.
+ * @snapshot: GuC CT snapshot object.
+ *
+ * This function free all the memory that needed to be allocated at capture
+ * time.
+ */
+void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot)
+{
+	if (!snapshot)
+		return;
+
+	guc_ctb_snapshot_free(&snapshot->h2g);
+	guc_ctb_snapshot_free(&snapshot->g2h);
+	kfree(snapshot);
+}
+
+/**
+ * xe_guc_ct_print - GuC CT Print.
+ * @ct: GuC CT.
+ * @p: drm_printer where it will be printed out.
+ * @atomic: Boolean to indicate if this is called from atomic context like
+ * reset or CTB handler or from some regular path like debugfs.
+ *
+ * This function quickly capture a snapshot and immediately print it out.
+ */
+void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool atomic)
+{
+	struct xe_guc_ct_snapshot *snapshot;
+
+	snapshot = xe_guc_ct_snapshot_capture(ct, atomic);
+	xe_guc_ct_snapshot_print(snapshot, p);
+	xe_guc_ct_snapshot_free(snapshot);
+}
+
 #ifdef XE_GUC_CT_SELFTEST
 /*
  * Disable G2H processing in IRQ handler to force xe_guc_ct_send to enter flow
@@ -1166,7 +1288,7 @@ void xe_guc_ct_selftest(struct xe_guc_ct *ct, struct drm_printer *p)
 		ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 4, 1);
 		if (ret) {
 			drm_printf(p, "Aborted pass %d, ret %d\n", i, ret);
-			xe_guc_ct_print(ct, p);
+			xe_guc_ct_print(ct, p, true);
 			break;
 		}
 	}
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index 49fb74f91e4d..3e04ee64652c 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -13,9 +13,15 @@ struct drm_printer;
 int xe_guc_ct_init(struct xe_guc_ct *ct);
 int xe_guc_ct_enable(struct xe_guc_ct *ct);
 void xe_guc_ct_disable(struct xe_guc_ct *ct);
-void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p);
 void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
 
+struct xe_guc_ct_snapshot *
+xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct, bool atomic);
+void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
+			      struct drm_printer *p);
+void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
+void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool atomic);
+
 static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
 {
 	wake_up_all(&ct->wq);
diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
index 64e3dd14d4b2..93046d95b009 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
@@ -48,6 +48,32 @@ struct guc_ctb {
 	struct guc_ctb_info info;
 };
 
+/**
+ * struct guc_ctb_snapshot - GuC command transport buffer (CTB) snapshot
+ */
+struct guc_ctb_snapshot {
+	/** @desc: snapshot of the CTB descriptor */
+	struct guc_ct_buffer_desc desc;
+	/** @cmds: snapshot of the CTB commands */
+	u32 *cmds;
+	/** @info: snapshot of the CTB info */
+	struct guc_ctb_info info;
+};
+
+/**
+ * struct xe_guc_ct_snapshot - GuC command transport (CT) snapshot
+ */
+struct xe_guc_ct_snapshot {
+	/** @ct_enabled: CT enabled info at capture time. */
+	bool ct_enabled;
+	/** @g2h_outstanding: G2H outstanding info at the capture time */
+	u32 g2h_outstanding;
+	/** @g2h: G2H CTB snapshot */
+	struct guc_ctb_snapshot g2h;
+	/** @h2g: H2G CTB snapshot */
+	struct guc_ctb_snapshot h2g;
+};
+
 /**
  * struct xe_guc_ct - GuC command transport (CT) layer
  *
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 231fb4145297..9e2950f1fd0d 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -764,7 +764,7 @@ static void simple_error_capture(struct xe_engine *e)
 		}
 
 		xe_force_wake_get(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
-		xe_guc_ct_print(&guc->ct, &p);
+		xe_guc_ct_print(&guc->ct, &p, true);
 		guc_engine_print(e, &p);
 		for_each_hw_engine(hwe, guc_to_gt(guc), id) {
 			if (hwe->class != e->hwe->class ||
-- 
2.39.2

