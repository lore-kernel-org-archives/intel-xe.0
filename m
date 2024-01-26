Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57838C47DDB
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 20:31:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1890F10E2B6;
	Fri, 26 Jan 2024 20:31:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C6610FE60
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 20:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706301083; x=1737837083;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=NLeZN9J8YCL+ZQtNatMeCU510Am0bWRZCjeRhxc/lPg=;
 b=AJsLqFMHpok0+1hMeHLkPWyV8e9JTGXmKwhSQGny+NV7vWTA5sjnlQZe
 dYEdA66ZW0hNnEvz0rsZ8+DVGtVAmWW5erowEcNUGbA5CGbVcEDIKL+QE
 kFLHQKkNaOujo99bsFyBtPb4nUFE+sxgoDbmKEZIOmz3rdPh6/R9z6f+3
 O32HnB1M3k7VyNP5N5SK3zWiUWdz9J2OEXY0nH/o1qLZvbTeWwyRrvAfQ
 Gkzf5stOGZS/6Ri5s1q9ChJAD5pgxeJUvr82TOJdkppmvAlWZaP4ifWfO
 ZnIpiCJFcnc1UJ9f5cbXyl3FjS0OOIKqrJG3LZq6+JxK4deRjVGu+rWEm A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9948438"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9948438"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 12:31:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="877481920"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="877481920"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 12:31:22 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:31:22 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 12:31:22 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 12:31:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BmHS0v5SWIvPZ7WSSJsZgNSGRsYGaDXIPfmpe9Z8jDK2ep1CrLDN/QI5Eq0ecs78EMAhGKofdeJjS7y/H6qso5Hk4vRIB5oqkKNeH/S36JsLwBO4Nug7PubcXNZHVX8ZyuJFllHSildRF87H8ypVjkv0yQM+US4Jt2Yt+IrMwubDAiGZdEzWHuNQ6cyHMwj1zNOATYLfodtQt5tUKjnbxVt4v+7VT6NuF0DpliyWubd1loCt4xI3l15Qd4tkmDoejncJRUbIE4ovscaih3EPsy1QqZraFdjKEOa84wMZKZ8B0Sum2gKSoBGiG4gsTaAeOSVHp3YdAEuuaRYAKSsADQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sh7Xo1LfMJ//wmvCs26CEct6R5VgCAX+St9ePIlvRoc=;
 b=KbYUQ4cjtRyVYZpCWh88592LcSFXu+IhcvK9aKAbUuZ78rSYB9d/f6eSnDb2TPeViZuE0L5iVCEl1izCNq40wSgfkTobRDoV06VI5gDg/2lJeq/Wz+GqGfHXkIq4sjIZYP1OVqx8/FIO1w3i7dURiluaKHaYZwM+zyWG/DjTnZuR/ls5MQn6OpEpoV5CPBuQBzsGcG+bx9VjePm3IIufGDQ3s0abzxjXMRgXTLUSB3cMsE+Wf0IFpwo6zyNrReS4Uk/x5a8kIP2zeszqub0VonnIZaDRawSaDvVkrSX8Zpc7nDxx72asNr0wko4BC29+Fqk6z9LddNZJHT0OBZNTpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by LV8PR11MB8700.namprd11.prod.outlook.com (2603:10b6:408:201::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.24; Fri, 26 Jan
 2024 20:31:17 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 20:31:17 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 10/34] drm/xe: Convert scheduler towards direct pm_runtime
Date: Fri, 26 Jan 2024 15:30:19 -0500
Message-ID: <20240126203044.1104705-11-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0124.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::9) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|LV8PR11MB8700:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cf22b44-1cee-4c91-eb63-08dc1eadbfc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SRDAZ+2bFT3D/6mjrLh1IbWDbVo7HP0N7glchxTqNBlyrpbFYgxNJKUpwoDYV8Z/t8Nrq/karuT1B/A/fccjgcwM18R7Vyviymm5ySTfUr9PbAVjzBq4uocZGWkjITeLdwYmf1gn0sBZAu7jev0ZrYEKQWP1jhp2x4AoZtF7lzvMR/jC4GkJhWK654Bz3RMGgek/24vJvhF8UlPtDaZQb5WmowXeG078Sh//Xc2Z/DoLwIYgn8iH+yFC9Zi3G//s3PAJRBOWGS697hTW4zCDS1dMJIYLVy3e8hsUxf/j0vcPEbTNIc+0sG9phd5Ynz8RLi1/kOI8c1okDKEl/T148GSAi+VkN17KVEz1U2iUVk/MPKURmbHavAjurP75f2FHyROKTNrjBsjPQhC6pW2PwXcbuFcCkqLIqVt9Pi4AHW+RUYodZMKcGrfwFVV6qY4yuBbWdPDc/E71HJEfJgTouTmgbtqKhxlRD+qPOux026gUWKdUpfUjof936KfKWpPX7khTgmg45cgimmcIfWWSEB21cKZpBrDMfZJ7458hbxHz4HG5J0svB4C3acZGH7im
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(136003)(366004)(346002)(39860400002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(41300700001)(83380400001)(26005)(107886003)(6512007)(66946007)(1076003)(38100700002)(5660300002)(44832011)(6506007)(2616005)(2906002)(4326008)(8936002)(66556008)(8676002)(66476007)(478600001)(316002)(6916009)(36756003)(6486002)(82960400001)(86362001)(66899024);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Equ4B1jqCWN67nchgr3DxYh3PdjVVggojKKQx7tKPg+YSBTfO8vbZ3ddhzdB?=
 =?us-ascii?Q?q3LFzm2fddxj4WliHWHuv7lhCWMGkdo7xm8K42wDlsQtpn0shgAXXF85eATc?=
 =?us-ascii?Q?Kb530bL6LWRj2517XCxlWA1w8MtPDtpWQ4VdYI4Z25SybI+JxPFv5Z81kdrF?=
 =?us-ascii?Q?w7yya26D77/YB+DP430WylfIjj+nqZkNXD3KYMC0zLeEXWkyEFzLjpdpFcmC?=
 =?us-ascii?Q?aOZJVANQqbLJQtA1XrltHCZqTyHHZG+cQ3v/fP2lyhAZc7gERWqTLbXXPm8M?=
 =?us-ascii?Q?+91DM8yyDaDKaHE6l3xJoG1ZGU3fLdr+L/06rFLJQG0z12j58L30L18uYp0I?=
 =?us-ascii?Q?awNeZ/aFXiwdvya8+gHBo4f3t8roaQerVUFcRk2PHkyi24H/Ukhy9uiJ/m9E?=
 =?us-ascii?Q?KZf9HUptJ3z5U8fbFRMiYqlNlGUg8RnrteoqJd1j0EqCDwa8DycZJMTAqsQS?=
 =?us-ascii?Q?j/sUsTpCMnd8L10KfpBT/Ez8Zyw5y7OhcxC6BWjGfA92yJPQpJsOwQDmKDCN?=
 =?us-ascii?Q?ebe6VGtsZQdKH4WNrT/OQqQ27AKRGvn5DZ0XZYXaelaqHL2RFipk7lr5g07+?=
 =?us-ascii?Q?brFPorBVCEkMqQHpT0ev9OBw+vl2frI8ah5PkxMrZJlrhzCWeIb++g9drQ5o?=
 =?us-ascii?Q?qqOtbNm2iwpHz0dzm5VTPr4BTH2eR1CsFmeiHOiFEmE2Kj2clVa7nR8uKJTZ?=
 =?us-ascii?Q?MhWzJdTRY1PB+FvPay809j4Bu6/1jqA5bY6bbhUYtaxdnbSNxk1sObDQzK/M?=
 =?us-ascii?Q?tLWgjcz8kC7AoxDiBXGwRJsHli5wO1m447iVlp4KLJ6+sNflvugCdalIZe8h?=
 =?us-ascii?Q?4NbEWT/myIDh6t86MMpA0XhzUjqx8VorbJsh9oIUu5bpNqyjomV/E6/4nOh9?=
 =?us-ascii?Q?kUOPqySxg5Qphu9H/PHr9E0Z0nY5Oh4f1F+lYzYFiNwzRrbtItAChCrUVNvw?=
 =?us-ascii?Q?6JBvfNgju+YF2aX9UpXHVWsSYhePExXCeWzHZBhQ7rumZ4djP9grBDwDZQjr?=
 =?us-ascii?Q?FUieg6Qpf8DojpVe3Wm/ls+agy7/rdL+0Peb/mKQMT/NvSHtMpveD1ptOvXk?=
 =?us-ascii?Q?eaCPHy8lXPftCbxbB5SrqS2NN3nbqRYTI6MoPo5MzafiSvwRC6bEibXSrHnT?=
 =?us-ascii?Q?+XuFdC3wb/AiG+y/TtrD/MPzfHSZ+ed6cDsHv1ini+0G5HUOVVtMEDelG7K/?=
 =?us-ascii?Q?bNopzL/xSlV/dbefexkyO75xi9T4tdS9sYaLdX9uBYyxKGm+qCd29Bw6hUhs?=
 =?us-ascii?Q?hvNp0/v3Fz2XnwCmrhkCwYaxTF4ktHu0yBKa2OLppGby/eDJzZCWcqAN2bbI?=
 =?us-ascii?Q?aDqICJwKc+0ZFs8wCFfZkmFdbLKp6szrPVREtkPy+FqYidCDqY0JFwYgGuXv?=
 =?us-ascii?Q?+yGFWgfdpqFj0rbrafOQ0GDND8cux3k9mCy3MbWktQ/1AN1R7iX9MVvHmVmy?=
 =?us-ascii?Q?J1adHoGQ091xZFsPIca0X2UJvf/hC1ddJ3DrRQKgHOlbJcA8Hp5pb8xu4xyf?=
 =?us-ascii?Q?sRroZyDsc2LWUVzVCFfvjxIaDV8mC13HKgwTB7ZBho+N8kPYYtU1iXBfrqAw?=
 =?us-ascii?Q?PAiyF2Kwbf9+npJjxrL5d1HM/UoQPOBAUMhHx3mzGiFd4Snn8wAyl93wb3Nb?=
 =?us-ascii?Q?5A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cf22b44-1cee-4c91-eb63-08dc1eadbfc6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 20:31:17.7355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EaLzTXC0WROExJLpPhtisAXeAmRMxBiwscbuOmD5rRGLSBvU02RbULMwfVXzlmXPQwZdmhQPsP/5wgRgUu2Mrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8700
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

Let's ensure our PCI device is awaken on every GT execution to
the end of the execution.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c          | 19 -------------------
 drivers/gpu/drm/xe/xe_gpu_scheduler.c       |  8 ++++++--
 drivers/gpu/drm/xe/xe_gpu_scheduler.h       |  3 ++-
 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h |  2 ++
 drivers/gpu/drm/xe/xe_guc_submit.c          |  2 +-
 drivers/gpu/drm/xe/xe_sched_job.c           | 12 +++++++-----
 6 files changed, 18 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index c0b7434e78f1..04bd6a639d41 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -111,7 +111,6 @@ static void __xe_exec_queue_free(struct xe_exec_queue *q)
 
 static int __xe_exec_queue_init(struct xe_exec_queue *q)
 {
-	struct xe_device *xe = gt_to_xe(q->gt);
 	int i, err;
 
 	for (i = 0; i < q->width; ++i) {
@@ -124,17 +123,6 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
 	if (err)
 		goto err_lrc;
 
-	/*
-	 * Normally the user vm holds an rpm ref to keep the device
-	 * awake, and the context holds a ref for the vm, however for
-	 * some engines we use the kernels migrate vm underneath which offers no
-	 * such rpm ref, or we lack a vm. Make sure we keep a ref here, so we
-	 * can perform GuC CT actions when needed. Caller is expected to have
-	 * already grabbed the rpm ref outside any sensitive locks.
-	 */
-	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm))
-		drm_WARN_ON(&xe->drm, !xe_device_mem_access_get_if_ongoing(xe));
-
 	return 0;
 
 err_lrc:
@@ -221,8 +209,6 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
 
 	for (i = 0; i < q->width; ++i)
 		xe_lrc_finish(q->lrc + i);
-	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm))
-		xe_device_mem_access_put(gt_to_xe(q->gt));
 	__xe_exec_queue_free(q);
 }
 
@@ -704,9 +690,6 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 			if (XE_IOCTL_DBG(xe, !hwe))
 				return -EINVAL;
 
-			/* The migration vm doesn't hold rpm ref */
-			xe_device_mem_access_get(xe);
-
 			flags = EXEC_QUEUE_FLAG_PERSISTENT | EXEC_QUEUE_FLAG_VM |
 				(id ? EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD : 0);
 
@@ -715,8 +698,6 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 						   args->width, hwe, flags,
 						   args->extensions);
 
-			xe_device_mem_access_put(xe); /* now held by engine */
-
 			xe_vm_put(migrate_vm);
 			if (IS_ERR(new)) {
 				err = PTR_ERR(new);
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
index e4ad1d6ce1d5..457f814bfee8 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
@@ -4,6 +4,7 @@
  */
 
 #include "xe_gpu_scheduler.h"
+#include "xe_pm.h"
 
 static void xe_sched_process_msg_queue(struct xe_gpu_scheduler *sched)
 {
@@ -48,13 +49,15 @@ static void xe_sched_process_msg_work(struct work_struct *w)
 
 	msg = xe_sched_get_msg(sched);
 	if (msg) {
+		xe_pm_runtime_get(sched->xe);
 		sched->ops->process_msg(msg);
-
 		xe_sched_process_msg_queue_if_ready(sched);
+		xe_pm_runtime_put(sched->xe);
 	}
 }
 
-int xe_sched_init(struct xe_gpu_scheduler *sched,
+int xe_sched_init(struct xe_device *xe,
+		  struct xe_gpu_scheduler *sched,
 		  const struct drm_sched_backend_ops *ops,
 		  const struct xe_sched_backend_ops *xe_ops,
 		  struct workqueue_struct *submit_wq,
@@ -63,6 +66,7 @@ int xe_sched_init(struct xe_gpu_scheduler *sched,
 		  atomic_t *score, const char *name,
 		  struct device *dev)
 {
+	sched->xe = xe;
 	sched->ops = xe_ops;
 	INIT_LIST_HEAD(&sched->msgs);
 	INIT_WORK(&sched->work_process_msg, xe_sched_process_msg_work);
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
index 10c6bb9c9386..bac37c311859 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
@@ -9,7 +9,8 @@
 #include "xe_gpu_scheduler_types.h"
 #include "xe_sched_job_types.h"
 
-int xe_sched_init(struct xe_gpu_scheduler *sched,
+int xe_sched_init(struct xe_device *xe,
+		  struct xe_gpu_scheduler *sched,
 		  const struct drm_sched_backend_ops *ops,
 		  const struct xe_sched_backend_ops *xe_ops,
 		  struct workqueue_struct *submit_wq,
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
index 6731b13da8bb..f14b88264025 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
@@ -43,6 +43,8 @@ struct xe_sched_backend_ops {
 struct xe_gpu_scheduler {
 	/** @base: DRM GPU scheduler */
 	struct drm_gpu_scheduler		base;
+	/** @xe: back pointer to Xe Device */
+	struct xe_device			*xe;
 	/** @ops: Xe scheduler ops */
 	const struct xe_sched_backend_ops	*ops;
 	/** @msgs: list of messages to be processed in @work_process_msg */
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 2b008ec1b6de..6b313b9b351a 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1219,7 +1219,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 
 	timeout = (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
 		  q->sched_props.job_timeout_ms;
-	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
+	err = xe_sched_init(xe, &ge->sched, &drm_sched_ops, &xe_sched_ops,
 			    get_submit_wq(guc),
 			    q->lrc[0].ring.size / MAX_JOB_SIZE_BYTES, 64,
 			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index 01106a1156ad..c93284ec66c5 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -15,6 +15,7 @@
 #include "xe_hw_fence.h"
 #include "xe_lrc.h"
 #include "xe_macros.h"
+#include "xe_pm.h"
 #include "xe_trace.h"
 #include "xe_vm.h"
 
@@ -67,6 +68,8 @@ static void job_free(struct xe_sched_job *job)
 	struct xe_exec_queue *q = job->q;
 	bool is_migration = xe_sched_job_is_migration(q);
 
+	xe_pm_runtime_put(gt_to_xe(q->gt));
+
 	kmem_cache_free(xe_exec_queue_is_parallel(job->q) || is_migration ?
 			xe_sched_job_parallel_slab : xe_sched_job_slab, job);
 }
@@ -79,6 +82,7 @@ static struct xe_device *job_to_xe(struct xe_sched_job *job)
 struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
 					 u64 *batch_addr)
 {
+	struct xe_device *xe = gt_to_xe(q->gt);
 	struct xe_sched_job *job;
 	struct dma_fence **fences;
 	bool is_migration = xe_sched_job_is_migration(q);
@@ -86,6 +90,9 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
 	int i, j;
 	u32 width;
 
+	if (!xe_pm_runtime_get_if_in_use(xe))
+		drm_err(&xe->drm, "Failed to grab RPM ref for sched_job\n");
+
 	/* only a kernel context can submit a vm-less job */
 	XE_WARN_ON(!q->vm && !(q->flags & EXEC_QUEUE_FLAG_KERNEL));
 
@@ -155,9 +162,6 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
 	for (i = 0; i < width; ++i)
 		job->batch_addr[i] = batch_addr[i];
 
-	/* All other jobs require a VM to be open which has a ref */
-	if (unlikely(q->flags & EXEC_QUEUE_FLAG_KERNEL))
-		xe_device_mem_access_get(job_to_xe(job));
 	xe_device_assert_mem_access(job_to_xe(job));
 
 	trace_xe_sched_job_create(job);
@@ -189,8 +193,6 @@ void xe_sched_job_destroy(struct kref *ref)
 	struct xe_sched_job *job =
 		container_of(ref, struct xe_sched_job, refcount);
 
-	if (unlikely(job->q->flags & EXEC_QUEUE_FLAG_KERNEL))
-		xe_device_mem_access_put(job_to_xe(job));
 	xe_exec_queue_put(job->q);
 	dma_fence_put(job->fence);
 	drm_sched_job_cleanup(&job->drm);
-- 
2.43.0

