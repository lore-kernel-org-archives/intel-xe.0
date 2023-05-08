Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF249C77B75
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 17:07:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ADB410E0CE;
	Mon,  8 May 2023 17:07:07 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B868910E0CE
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 17:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683565626; x=1715101626;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=t/buz6LGvUFwaRakn+hbjgG+ZJumDIJgjArtUizFg90=;
 b=I/Ee2q8F/KOm/pqpc6RffGf1kDW1M0KqTpkbB717z6XrtLdS3CfD3p7Y
 LFPPOvqe+BYb+vRndfpW6Vsb410pwG0ht+SG+ioM70H275uGlipadG5Jt
 M85o0x6EBPDsG7L5EBgByJIefh9egw2NqC1oNNgnM9FwO+bEjQxWJSSgA
 w+FOdJ4j3pq0EktcMNJbhyrzOyuQfIfN7CEnZ43eDQAakMWzynKvqXXOx
 Oe2PC2haZ+h7LPhjZGB89lFF0TfXLTAC/Az/O7YoeaEBHreCowNFKoWOn
 w0FS+/PU5ddw8FPlH8GUq/3kwWu8uA9QnOaz3+2dmKW8WTWC5l15wWmiq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="377800241"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="377800241"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 10:07:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="1028470033"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="1028470033"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 08 May 2023 10:07:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 10:07:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 10:07:04 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 10:07:04 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 10:07:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QdyWAXiCY6hlHtPcaGKoB1LZUwJ025bzlhj1u9Ri4kOg/D+SVod1/K9te+owsON5rAnR5NnMBR/1c8xrVyNyF05TVDjEq6ZG/69V5M0f+Ejtpo6GPw7MUmrRULk5DiK8gthtogNIXLCMESWX5VBQLGbpshksQcKsHfa1hxFXT2BFZoEOh73pu590Ws7D0Go9JasjK9n5BZVTy+wnYsSAwTPkSJZdUqA3GYj20QxkDKC48m9K/D3tXNlXXpUC44Xv8uSXW+rgm5OT5LGucPuXS9sX3EotnDmpdIcK6jXiiHxc1MMSJaG/c6ViYioo5izCEdaiETqZMa6SkGwcM8mZ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XV+DpzfAdYFMSVXIGxaem7sf4G67999YzHRYoQD/zHE=;
 b=W7yaAgNgfauvR5z3jFhnF5VDaG6e0CRUMzlM71gZnJhFRElxgFDwoLDP9AJVm2ugsVI5rhQRdHlpfVzjE04ukpIJJBIy+yADWqLevZ7ar/M75S9E6eSqDcXzTBa8bskXi62G8y4ACYG2WeJdfFdY9RI6hG0HnLaRwH1L9v26EwrWXgQ2bC0Z1jbkL1Dk6RLmgG/LK3fwiSptsSWWmp8xsFLwzfZUPCzKefbak2+jIrpMzN+pW10FNRku3BvRuRXdQpPtg7EQ/vKy1RUcSR/RJkZfGT8Sostje/XbVF4ziAiU2MA+AOvqzZTQ3f3dkRNX3PMAESfs8JRiDtS/YJwmnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM6PR11MB4675.namprd11.prod.outlook.com (2603:10b6:5:2ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 17:06:55 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 17:06:55 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 8 May 2023 13:06:12 -0400
Message-ID: <20230508170616.1289914-8-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508170616.1289914-1-rodrigo.vivi@intel.com>
References: <20230508170616.1289914-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::7) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM6PR11MB4675:EE_
X-MS-Office365-Filtering-Correlation-Id: 63168ef1-1140-489b-fc40-08db4fe6a00e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w90DntGsNqmg3n8KoA7cM7dlDMrDNkNEvH69/hJq9ZTZjkYZW1o5fuEEz7cVu3CUN61dbDV5jBXVWXDYCa+X0no2gnl0G5EVK4DviwK6AEkpj4Sj7IVCbbadx+NyspwSl2uaVWrW4zBuBQ8HQ1+vFatHOSHHnvSWFxmQrdV+nv8ENTR9LfHFJF8Dq2RnLBBX5biCh0rozV64vsm8qal2wdhzYmsy5obpcsoO6CyHtXBeCMwiFJcrwWvAWE1yiy2shUts0Z1IGzeJkHBOuj30K2zAQQ/c+6HNFBKDsmA+ZwBXHAKVpchyPICfdaFr8Ps5OqC/HzqNlOxZm2gOCOXs5O8q5zOwvBkBAI6UkaJZBNdrgHaRers+5YswpirM/axpqrO16O1Ikj2uc04qbttZtO/ukY6Qr7QkElwy+kVgQXTi0hLdslHJR683Mqfvz08PSQgG7UDXJYJUycXVdQ1qFf3FsH3FovuIoimsb7DgsvYgBS1Li9dM5cGzhDTziPN3JcGUqO6rl5RpuJINqqZ7AD9t/Thd/CCETXWOfkBOYjTqBHMt8rNV4j9slvUBkPBA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(39860400002)(366004)(136003)(346002)(451199021)(36756003)(38100700002)(2906002)(44832011)(30864003)(316002)(5660300002)(8676002)(8936002)(86362001)(66556008)(66946007)(6916009)(82960400001)(41300700001)(66476007)(45080400002)(83380400001)(186003)(107886003)(26005)(6506007)(6512007)(1076003)(6486002)(478600001)(6666004)(2616005)(54906003)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?56L9Q46aB+o29z4JxxvU9oOZ0Bj1U8JYXS4dYHOL2j7EJVSwTESpoiy14YR5?=
 =?us-ascii?Q?0dxm7yYc8ADTfvDk9VPzupeYeVezfFDPiQqUz85Ua880UIEejXoav7G/EQv0?=
 =?us-ascii?Q?7rIA239BIIy8GKHIsxcsTUnByfsDvGr/qjG/qJt7KVQLLQKaJV68SYjC3D4G?=
 =?us-ascii?Q?wEKWVhR0QYFJe75j631ylXOQd0n+IFNdLC1QcFXTSauHfgFDVdE2e31xQZGl?=
 =?us-ascii?Q?zu4q/BRNjXLm/xRcjrm4etPLbb33Hs/bpDnbdof4mLSc6sze79vgAQpWf5o9?=
 =?us-ascii?Q?yVTLYwXXeiNKohuMkQIDHkzedC9NAplHi6zFClUdM5mIJmSPakiVh0OpTfM6?=
 =?us-ascii?Q?Tgl4JaTdmDReS8CXjwuAzavgSdcJKH9Usgscpt9D5Ey1xXgVMjj4jGxi9Z8a?=
 =?us-ascii?Q?j2A8HeDepSX3PYVALSkgZ9SxAQcUecsrFM/h64jv4uqfYU3TYcDA7bQ+9KT4?=
 =?us-ascii?Q?AHECo25PcirP0vVYmtAI+9NBjU75gQ1AHAehaPPUuQNCXrN/h+USK4nI6BMr?=
 =?us-ascii?Q?4F4ktJopNsrwC2mKBEuOfm+PPFeX2YeCQI5BgP5auvRHFcokfjJSi/GJHYP4?=
 =?us-ascii?Q?9hzxeUpNh3e7ksSCxQSMAbOalXRby+iceHlOxvlBmCEcO7fPOytdE5I7X3sd?=
 =?us-ascii?Q?uZvkvJjjNXsoYN32nW1r2NulZ/A3Qcx2xH7jcLxZf5iMObGaNokTYyhXqpgP?=
 =?us-ascii?Q?7PELErLveUOJHwdL8ipa6bAhbo1zryGGt4yMsMNjlnONX6CvNS0QIcvqCX5v?=
 =?us-ascii?Q?UgQqcGdoWq1az9haCrceH1SZr1k+EHhIK1m7bB445UPBdpzIDOSLrB8Gqkdi?=
 =?us-ascii?Q?zEg5otxDe8NSvXIZ0FELS+BO4LwdcaD1nPOyFky1LKGhpWXN7yhnHpkZBMOF?=
 =?us-ascii?Q?IKZ8nnQ528CjfgPoJ8G+j/voaIfRAqP72PPSAET+UnAFXMpQkLEd3AGqmgTF?=
 =?us-ascii?Q?smBX1kyzRhKL9v2xd18s3J48v8zm4zZNiklHTTwCBVFDnBic3EaAUVJplDnb?=
 =?us-ascii?Q?2i2fk9KsFww8bwdGTBlUety5HHv4zbrzJlQb9fhGRu6zBdoGqBBm9iDZND+l?=
 =?us-ascii?Q?9g3qGoYz8khac8GkWy11cButX4sUYOtLrSR0iaQoR9BblnTBkhMItdaEQG8g?=
 =?us-ascii?Q?wAj7+ExyhcHVjgZRKwkNWCc0nOL0LHeRO5i4EFPyjWhUFg9aaDDuYV/Ihiv1?=
 =?us-ascii?Q?fn/skAxGM9RqxTnvUwQ4jbVbPYLjqNmthlmZhwA18WBlOAXdJtCRazC18aFG?=
 =?us-ascii?Q?IHnRoqbeVhxXIb153T+kRx3SsrtWEuRx9gvimVn0VMUbckbROkhSscma4IKj?=
 =?us-ascii?Q?DT9jQAzx9tdk3+LFCgTSzVAZ+mpuHW6RE46aBFrQlef0hpcza7X3gekDoSkC?=
 =?us-ascii?Q?zVWX+YwKqZBFSYS/Z3dYjwpAmwTFXGXBjrlgIH6LCRX6pblY8xH0kz3r+JQB?=
 =?us-ascii?Q?HOf8ACs8DXJaztqIlkhxUUkHQR62htw0h/Un0gZcBLDxd9DFviNQ2FAbzR6R?=
 =?us-ascii?Q?R5y2vTzx7n+yDevFhqJR+IpHx/EAf2Eal4CkXGz5hfQevd+8Jn6BUyMNmi8m?=
 =?us-ascii?Q?3GcsybKlmL+Iq3OAEa0oy3QSSlvw0ryFvJ65uj7Y2Ee7aQEkjOzaAMZ+it24?=
 =?us-ascii?Q?cQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63168ef1-1140-489b-fc40-08db4fe6a00e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 17:06:55.2291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8/jrMXaO/QVTT828crILRkcSnderDn4k4rEv2hJmEvE8CosdRHRgXBOUfotIsru5NlK1H4HNlGzoLQAteenZcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4675
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 07/11] drm/xe: Convert GuC Engine print to
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

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c              |   2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c       | 255 +++++++++++++++++++----
 drivers/gpu/drm/xe/xe_guc_submit.h       |  11 +-
 drivers/gpu/drm/xe/xe_guc_submit_types.h |  91 ++++++++
 4 files changed, 314 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 985f6e901ee4..dc891ad1d367 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -857,5 +857,5 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 
 	xe_guc_ct_print(&guc->ct, p, false);
-	xe_guc_submit_print(guc, p);
+	xe_guc_submit_print(guc, p, false);
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 168e2b0dfc5b..514b8e9df0fc 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -718,7 +718,8 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
 		       G2H_LEN_DW_DEREGISTER_CONTEXT, 2);
 }
 
-static void guc_engine_print(struct xe_engine *e, struct drm_printer *p);
+static void guc_engine_print(struct xe_engine *e, struct drm_printer *p,
+			     bool atomic);
 
 #if IS_ENABLED(CONFIG_DRM_XE_SIMPLE_ERROR_CAPTURE)
 static void simple_error_capture(struct xe_engine *e)
@@ -746,7 +747,7 @@ static void simple_error_capture(struct xe_engine *e)
 
 		xe_force_wake_get(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
 		xe_guc_ct_print(&guc->ct, &p, true);
-		guc_engine_print(e, &p);
+		guc_engine_print(e, &p, true);
 		for_each_hw_engine(hwe, guc_to_gt(guc), id) {
 			if (hwe->class != e->hwe->class ||
 			    !(BIT(hwe->logical_instance) & adj_logical_mask))
@@ -1596,76 +1597,244 @@ int xe_guc_engine_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	return 0;
 }
 
-static void guc_engine_wq_print(struct xe_engine *e, struct drm_printer *p)
+static void
+guc_engine_wq_snapshot_capture(struct xe_engine *e,
+			       struct xe_guc_submit_engine_snapshot *snapshot)
 {
 	struct xe_guc *guc = engine_to_guc(e);
 	struct xe_device *xe = guc_to_xe(guc);
 	struct iosys_map map = xe_lrc_parallel_map(e->lrc);
 	int i;
 
+	snapshot->guc.wqi_head = e->guc->wqi_head;
+	snapshot->guc.wqi_tail = e->guc->wqi_tail;
+	snapshot->parallel.wq_desc.head = parallel_read(xe, map, wq_desc.head);
+	snapshot->parallel.wq_desc.tail = parallel_read(xe, map, wq_desc.tail);
+	snapshot->parallel.wq_desc.status = parallel_read(xe, map,
+							  wq_desc.wq_status);
+
+	if (snapshot->parallel.wq_desc.head !=
+	    snapshot->parallel.wq_desc.tail) {
+		for (i = snapshot->parallel.wq_desc.head;
+		     i != snapshot->parallel.wq_desc.tail;
+		     i = (i + sizeof(u32)) % WQ_SIZE)
+			snapshot->parallel.wq[i / sizeof(u32)] =
+				parallel_read(xe, map, wq[i / sizeof(u32)]);
+	}
+}
+
+static void
+guc_engine_wq_snapshot_print(struct xe_guc_submit_engine_snapshot *snapshot,
+			     struct drm_printer *p)
+{
+	int i;
+
 	drm_printf(p, "\tWQ head: %u (internal), %d (memory)\n",
-		   e->guc->wqi_head, parallel_read(xe, map, wq_desc.head));
+		   snapshot->guc.wqi_head, snapshot->parallel.wq_desc.head);
 	drm_printf(p, "\tWQ tail: %u (internal), %d (memory)\n",
-		   e->guc->wqi_tail, parallel_read(xe, map, wq_desc.tail));
-	drm_printf(p, "\tWQ status: %u\n",
-		   parallel_read(xe, map, wq_desc.wq_status));
-	if (parallel_read(xe, map, wq_desc.head) !=
-	    parallel_read(xe, map, wq_desc.tail)) {
-		for (i = parallel_read(xe, map, wq_desc.head);
-		     i != parallel_read(xe, map, wq_desc.tail);
+		   snapshot->guc.wqi_tail, snapshot->parallel.wq_desc.tail);
+	drm_printf(p, "\tWQ status: %u\n", snapshot->parallel.wq_desc.status);
+
+	if (snapshot->parallel.wq_desc.head !=
+	    snapshot->parallel.wq_desc.tail) {
+		for (i = snapshot->parallel.wq_desc.head;
+		     i != snapshot->parallel.wq_desc.tail;
 		     i = (i + sizeof(u32)) % WQ_SIZE)
 			drm_printf(p, "\tWQ[%zu]: 0x%08x\n", i / sizeof(u32),
-				   parallel_read(xe, map, wq[i / sizeof(u32)]));
+				   snapshot->parallel.wq[i / sizeof(u32)]);
 	}
 }
 
-static void guc_engine_print(struct xe_engine *e, struct drm_printer *p)
+/**
+ * xe_guc_engine_snapshot_capture - Take a quick snapshot of the GuC Engine.
+ * @e: Xe Engine.
+ * @atomic: Boolean to indicate if this is called from atomic context like
+ * 	    TDR or from some regular path like debugfs.
+ *
+ * This can be printed out in a later stage like during dev_coredump
+ * analysis.
+ *
+ * Returns: a GuC Submit Engine snapshot object that must be freed by the
+ * 	    caller, using `xe_guc_engine_snapshot_free`.
+ */
+struct xe_guc_submit_engine_snapshot *
+xe_guc_engine_snapshot_capture(struct xe_engine *e, bool atomic)
 {
+	struct xe_guc *guc = engine_to_guc(e);
+	struct xe_device *xe = guc_to_xe(guc);
 	struct drm_gpu_scheduler *sched = &e->guc->sched;
 	struct xe_sched_job *job;
+	struct xe_guc_submit_engine_snapshot *snapshot;
 	int i;
 
-	drm_printf(p, "\nGuC ID: %d\n", e->guc->id);
-	drm_printf(p, "\tName: %s\n", e->name);
-	drm_printf(p, "\tClass: %d\n", e->class);
-	drm_printf(p, "\tLogical mask: 0x%x\n", e->logical_mask);
-	drm_printf(p, "\tWidth: %d\n", e->width);
-	drm_printf(p, "\tRef: %d\n", kref_read(&e->refcount));
-	drm_printf(p, "\tTimeout: %ld (ms)\n", sched->timeout);
-	drm_printf(p, "\tTimeslice: %u (us)\n", e->sched_props.timeslice_us);
+	snapshot = kzalloc(sizeof(struct xe_guc_submit_engine_snapshot),
+			   atomic ? GFP_ATOMIC : GFP_KERNEL);
+
+	if (!snapshot) {
+		drm_err(&xe->drm, "Failed to allocate memory for GuC Engine snapshot.\n");
+		return NULL;
+	}
+
+	snapshot->guc.id = e->guc->id;
+	memcpy(&snapshot->name, &e->name, sizeof(snapshot->name));
+	snapshot->class = e->class;
+	snapshot->logical_mask = e->logical_mask;
+	snapshot->width = e->width;
+	snapshot->refcount = kref_read(&e->refcount);
+	snapshot->sched_timeout = sched->timeout;
+	snapshot->sched_props.timeslice_us = e->sched_props.timeslice_us;
+	snapshot->sched_props.preempt_timeout_us =
+		e->sched_props.preempt_timeout_us;
+
+	snapshot->lrc = kmalloc_array(e->width, sizeof(struct lrc_snapshot),
+				atomic ? GFP_ATOMIC : GFP_KERNEL);
+
+	if (!snapshot->lrc) {
+		drm_err(&xe->drm, "Failed to allocate memory for GuC Engine LRC snapshot.\n");
+	} else {
+		for (i = 0; i < e->width; ++i ) {
+			struct xe_lrc *lrc = e->lrc + i;
+
+			snapshot->lrc[i].context_desc =
+				lower_32_bits(xe_lrc_ggtt_addr(lrc));
+			snapshot->lrc[i].head = xe_lrc_ring_head(lrc);
+			snapshot->lrc[i].tail.internal = lrc->ring.tail;
+			snapshot->lrc[i].tail.memory =
+				xe_lrc_read_ctx_reg(lrc, CTX_RING_TAIL);
+			snapshot->lrc[i].start_seqno = xe_lrc_start_seqno(lrc);
+			snapshot->lrc[i].seqno = xe_lrc_seqno(lrc);
+		}
+	}
+
+	snapshot->schedule_state = atomic_read(&e->guc->state);
+	snapshot->engine_flags = e->flags;
+
+	snapshot->parallel_execution = xe_engine_is_parallel(e);
+	if (snapshot->parallel_execution)
+		guc_engine_wq_snapshot_capture(e, snapshot);
+
+	spin_lock(&sched->job_list_lock);
+	snapshot->pending_list_size = list_count_nodes(&sched->pending_list);
+	snapshot->pending_list = kmalloc_array(snapshot->pending_list_size,
+					 sizeof(struct pending_list_snapshot),
+					 atomic ? GFP_ATOMIC : GFP_KERNEL);
+
+	if (!snapshot->pending_list) {
+		drm_err(&xe->drm, "Failed to allocate memory for GuC Engine pending_list snapshot.\n");
+	} else {
+		i = 0;
+		list_for_each_entry(job, &sched->pending_list, drm.list) {
+			snapshot->pending_list[i].seqno =
+				xe_sched_job_seqno(job);
+			snapshot->pending_list[i].fence =
+				dma_fence_is_signaled(job->fence) ? 1 : 0;
+			snapshot->pending_list[i].finished =
+				dma_fence_is_signaled(&job->drm.s_fence->finished)
+				? 1 : 0;
+			i++;
+		}
+	}
+
+	spin_unlock(&sched->job_list_lock);
+
+	return snapshot;
+}
+
+/**
+ * xe_guc_engine_snapshot_print - Print out a given GuC Engine snapshot.
+ * @snapshot: GuC Submit Engine snapshot object.
+ * @p: drm_printer where it will be printed out.
+ *
+ * This function prints out a given GuC Submit Engine snapshot object.
+ */
+void
+xe_guc_engine_snapshot_print(struct xe_guc_submit_engine_snapshot *snapshot,
+			     struct drm_printer *p)
+{
+	int i;
+
+	if (!snapshot)
+		return;
+
+	drm_printf(p, "\nGuC ID: %d\n", snapshot->guc.id);
+	drm_printf(p, "\tName: %s\n", snapshot->name);
+	drm_printf(p, "\tClass: %d\n", snapshot->class);
+	drm_printf(p, "\tLogical mask: 0x%x\n", snapshot->logical_mask);
+	drm_printf(p, "\tWidth: %d\n", snapshot->width);
+	drm_printf(p, "\tRef: %d\n", snapshot->refcount);
+	drm_printf(p, "\tTimeout: %ld (ms)\n", snapshot->sched_timeout);
+	drm_printf(p, "\tTimeslice: %u (us)\n",
+		   snapshot->sched_props.timeslice_us);
 	drm_printf(p, "\tPreempt timeout: %u (us)\n",
-		   e->sched_props.preempt_timeout_us);
-	for (i = 0; i < e->width; ++i ) {
-		struct xe_lrc *lrc = e->lrc + i;
+		   snapshot->sched_props.preempt_timeout_us);
 
+	for (i = 0; snapshot->lrc && i < snapshot->width; ++i ) {
 		drm_printf(p, "\tHW Context Desc: 0x%08x\n",
-			   lower_32_bits(xe_lrc_ggtt_addr(lrc)));
+			   snapshot->lrc[i].context_desc);
 		drm_printf(p, "\tLRC Head: (memory) %u\n",
-			   xe_lrc_ring_head(lrc));
+			   snapshot->lrc[i].head);
 		drm_printf(p, "\tLRC Tail: (internal) %u, (memory) %u\n",
-			   lrc->ring.tail,
-			   xe_lrc_read_ctx_reg(lrc, CTX_RING_TAIL));
+			   snapshot->lrc[i].tail.internal,
+			   snapshot->lrc[i].tail.memory);
 		drm_printf(p, "\tStart seqno: (memory) %d\n",
-			   xe_lrc_start_seqno(lrc));
-		drm_printf(p, "\tSeqno: (memory) %d\n", xe_lrc_seqno(lrc));
+			   snapshot->lrc[i].start_seqno);
+		drm_printf(p, "\tSeqno: (memory) %d\n", snapshot->lrc[i].seqno);
 	}
-	drm_printf(p, "\tSchedule State: 0x%x\n", atomic_read(&e->guc->state));
-	drm_printf(p, "\tFlags: 0x%lx\n", e->flags);
-	if (xe_engine_is_parallel(e))
-		guc_engine_wq_print(e, p);
+	drm_printf(p, "\tSchedule State: 0x%x\n", snapshot->schedule_state);
+	drm_printf(p, "\tFlags: 0x%lx\n", snapshot->engine_flags);
 
-	spin_lock(&sched->job_list_lock);
+	if (snapshot->parallel_execution)
+		guc_engine_wq_snapshot_print(snapshot, p);
 
-	list_for_each_entry(job, &sched->pending_list, drm.list)
+	for(i = 0; snapshot->pending_list && i < snapshot->pending_list_size;
+	    i++)
 		drm_printf(p, "\tJob: seqno=%d, fence=%d, finished=%d\n",
-			   xe_sched_job_seqno(job),
-			   dma_fence_is_signaled(job->fence) ? 1 : 0,
-			   dma_fence_is_signaled(&job->drm.s_fence->finished) ?
-			   1 : 0);
-	spin_unlock(&sched->job_list_lock);
+			   snapshot->pending_list[i].seqno,
+			   snapshot->pending_list[i].fence,
+			   snapshot->pending_list[i].finished);
+}
+
+/**
+ * xe_guc_engine_snapshot_free - Free all allocated objects for a given
+ * snapshot.
+ * @snapshot: GuC Submit Engine snapshot object.
+ *
+ * This function free all the memory that needed to be allocated at capture
+ * time.
+ */
+void xe_guc_engine_snapshot_free(struct xe_guc_submit_engine_snapshot *snapshot)
+{
+	if (!snapshot)
+		return;
+
+	if (snapshot->lrc)
+		kfree(snapshot->lrc);
+	if (snapshot->pending_list)
+		kfree(snapshot->pending_list);
+
+	kfree(snapshot);
+}
+
+static void guc_engine_print(struct xe_engine *e, struct drm_printer *p,
+			     bool atomic)
+{
+	struct xe_guc_submit_engine_snapshot *snapshot;
+
+	snapshot = xe_guc_engine_snapshot_capture(e, atomic);
+	xe_guc_engine_snapshot_print(snapshot, p);
+	xe_guc_engine_snapshot_free(snapshot);
 }
 
-void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p)
+/**
+ * xe_guc_submit_print - GuC Submit Print.
+ * @guc: GuC.
+ * @p: drm_printer where it will be printed out.
+ * @atomic: Boolean to indicate if this is called from atomic context like
+ * 	    TDR or from some regular path like debugfs.
+ *
+ * This function capture and prints snapshots of **all** GuC Engines.
+ */
+void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p, bool atomic)
 {
 	struct xe_engine *e;
 	unsigned long index;
@@ -1675,6 +1844,6 @@ void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p)
 
 	mutex_lock(&guc->submission_state.lock);
 	xa_for_each(&guc->submission_state.engine_lookup, index, e)
-		guc_engine_print(e, p);
+		guc_engine_print(e, p, atomic);
 	mutex_unlock(&guc->submission_state.lock);
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index 8002734d6f24..0ac50702f600 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -13,7 +13,6 @@ struct xe_engine;
 struct xe_guc;
 
 int xe_guc_submit_init(struct xe_guc *guc);
-void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p);
 
 int xe_guc_submit_reset_prepare(struct xe_guc *guc);
 void xe_guc_submit_reset_wait(struct xe_guc *guc);
@@ -27,4 +26,14 @@ int xe_guc_engine_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 					   u32 len);
 int xe_guc_engine_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len);
 
+struct xe_guc_submit_engine_snapshot *
+xe_guc_engine_snapshot_capture(struct xe_engine *e, bool atomic);
+void
+xe_guc_engine_snapshot_print(struct xe_guc_submit_engine_snapshot *snapshot,
+			     struct drm_printer *p);
+void
+xe_guc_engine_snapshot_free(struct xe_guc_submit_engine_snapshot *snapshot);
+void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p,
+			 bool atomic);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_submit_types.h b/drivers/gpu/drm/xe/xe_guc_submit_types.h
index d369ea0bad60..0b726609dc14 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit_types.h
@@ -61,4 +61,95 @@ struct guc_submit_parallel_scratch {
 	u32 wq[WQ_SIZE / sizeof(u32)];
 };
 
+struct lrc_snapshot {
+	u32 context_desc;
+	u32 head;
+	struct {
+		u32 internal;
+		u32 memory;
+	} tail;
+	u32 start_seqno;
+	u32 seqno;
+};
+
+struct pending_list_snapshot {
+	u32 seqno;
+	bool fence;
+	bool finished;
+};
+
+/**
+ * struct xe_guc_submit_engine_snapshot - Snapshot for devcoredump
+ */
+struct xe_guc_submit_engine_snapshot {
+	/** @name: name of this engine */
+	char name[MAX_FENCE_NAME_LEN];
+	/** @class: class of this engine */
+	enum xe_engine_class class;
+	/**
+	 * @logical_mask: logical mask of where job submitted to engine can run
+	 */
+	u32 logical_mask;
+	/** @width: width (number BB submitted per exec) of this engine */
+	u16 width;
+	/** @refcount: ref count of this engine */
+	u32 refcount;
+	/**
+	 * @sched_timeout: the time after which a job is removed from the
+	 * scheduler.
+	 */
+	long sched_timeout;
+
+	/** @sched_props: scheduling properties */
+	struct {
+		/** @timeslice_us: timeslice period in micro-seconds */
+		u32 timeslice_us;
+		/** @preempt_timeout_us: preemption timeout in micro-seconds */
+		u32 preempt_timeout_us;
+	} sched_props;
+
+	/** @lrc: LRC Snapshot */
+	struct lrc_snapshot *lrc;
+
+	/** @schedule_state: Schedule State at the moment of Crash */
+	u32 schedule_state;
+	/** @engine_flags: Flags of the faulty engine */
+	unsigned long engine_flags;
+
+	/** @guc: GuC Engine Snapshot */
+	struct {
+		/** @wqi_head: work queue item head */
+		u32 wqi_head;
+		/** @wqi_tail: work queue item tail */
+		u32 wqi_tail;
+		/** @id: GuC id for this xe_engine */
+		u16 id;
+	} guc;
+
+	/**
+	 * @parallel_execution: Indication if the failure was during parallel
+	 * execution
+	 */
+	bool parallel_execution;
+	/** @parallel: snapshot of the useful parallel scratch */
+	struct {
+		/** @wq_desc: Workqueue description */
+		struct {
+			/** @head: Workqueue Head */
+			u32 head;
+			/** @tail: Workqueue Tail */
+			u32 tail;
+			/** @status: Workqueue Status */
+			u32 status;
+		} wq_desc;
+		/** @wq: Workqueue Items */
+		u32 wq[WQ_SIZE / sizeof(u32)];
+	} parallel;
+
+	/** @pending_list_size: Size of the pending list snapshot array */
+	int pending_list_size;
+	/** @pending_list: snapshot of the pending list info */
+	struct pending_list_snapshot *pending_list;
+};
+
 #endif
-- 
2.39.2

