Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 217F5C77B75
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 13:18:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC5D210E0C8;
	Fri, 19 May 2023 13:18:45 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D58AB10E04F
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 13:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684502323; x=1716038323;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=CVwfKmjXmkmoqrdYyLfKqUKQYzjP9OXSDgmblEzdTCY=;
 b=Er4d+EBJg4ZOBmMbougH8L3t5uyAjYsM1S5Ao8lj8CbnXL5IqkYFiahm
 VtcwfjfaZqoUQc/dechKqXdhLIBBT+RYdRVenREWObT7qcuXABQTh/Nf4
 5mG6BO4T+lR8TS6tjgYgXMm/HhkHsTucXI3NcvTUxUKwRNGKwNUsJ6eyI
 8WsQ9FsYidZliwpsHT63CUrhfaBNPNFDpA1t75f4e/ehZIdvi74kQ0Gm8
 OkdpwIRwrTOer+aCRptHZKRIKCRzDxMWBxGSOHOcH7vHWgsFa+GSgrmMU
 lt1pO+j3NQIuL4JVq4ghIvpp/n39gtnAnf3/O9aJOVnt/+DS27A7NDlls A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="415831143"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; d="scan'208";a="415831143"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 06:18:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="735512243"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; d="scan'208";a="735512243"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 19 May 2023 06:18:42 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 19 May 2023 06:18:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 19 May 2023 06:18:41 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 19 May 2023 06:18:41 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 19 May 2023 06:18:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jiqYO6wKq6c/ia8uwFZVDeDVuIikyTPM87Q47O9QUAdhY/Dv6oJvRQdWM7gZLEHMEshkxDn0pk5RizDigTBZT5kKp+ZxFQBamx5YYuNXFvMMA3QB0mtsrLccIfScK8KAuS6S3q6wmMGmEbKtIdl2qitxfV5F71Hmjofixq2Wednvv6doqbjRAFNSXTfJ7LtRjHx0+LguJgRWYI0xX0j/fecYL4/L7hnOHREv5xsWFnEdTB6O4wInA0IhZKg4eNODTYclg0L665WWsIP06pZbdjKZJgLkxLfrCGqIzmVAHSYfhpQbqqfxyW8wEfgAPbWE6QH7EvV4unRr3PJwg+umsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+XIL6adfgJXkR0tPy/GhqeOnM+2h7HILKS65m2otEw=;
 b=LgBnqGB5fhWccFaHnKSpACVrQ8e7j/sEl0JMynjNe2qx4RGG2x46nXHoH997T4jmaQAPVB4HXHCsAXT7jyCb3VroJL6LiSNFBI0DDWO/vdTLe000Xgk8iSQ3w71ORXG25PQE/RPQpw6XAHcHHQTw+3Jw7ePRjpzJJEPCZCXaT8v47NrS95zoQ6yT17EBq98DYJYBbckl/7PZDl+jIHIVRZNNnrCtgUTeTnHJ2T1ZqiXGdminrpLFza2b7ulZlsqeZ0TcTWt83IxeRxHpBJ201A+4lo5H/MagYkuEVlDkAHNZ1mdwbBW+OAET0jVP/q9SON4rY594CR3DWhs/Wd7Bmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB5644.namprd11.prod.outlook.com (2603:10b6:510:ef::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Fri, 19 May
 2023 13:18:39 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6411.021; Fri, 19 May 2023
 13:18:39 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 19 May 2023 09:18:14 -0400
Message-ID: <20230519131820.2020660-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230519131820.2020660-1-rodrigo.vivi@intel.com>
References: <20230519131820.2020660-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0088.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::29) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB5644:EE_
X-MS-Office365-Filtering-Correlation-Id: 236ff42b-213d-419d-35d0-08db586b8f2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hMQ4HSRNrwMzHVqrLW33+O5VwYpTPyywpdvEsGmx03K2rG6uLrM30YCHbVsqMm21Fr8Rh6f2lW771ORvt341h9oCcFZ7/HwmDt86IYv1zzA8eQlxIMNy/oGfBHdrvmxcs5Ul4tJe/xcBxdv5Pk4sy3K2ia9qdPtKRJaq+ZhfpBqykv0FYi6c8eW+NvQruKbBknZtvDsXY2v/mb+0VbL2RnqaR24Db1wb8ry1Z0JdJgHKmWkPyFBKGAPOUerZMPQ1YX7aJirCatVcz8+X2Q6pR7sUfnN84nxYnuyxn4M3IXUqdz++3U7nfAZWMgMjZ+3aAIYGt20IBMuT49+zeKgnMfYek87T/tierBhU7sUm+uRbdhDNf/Ik1tQqmcUFAeejBBbwXzSLzuLuAJBGCwchfHyDiYGvDzFz6leTYMhKRsdeVA8Ep6HC4XenFEs2OFuL73n+dJlDNNZuxgjFi3Y1LZAJSnxPJ+Mdjh8hVVWqaCKuhMlSN5ynoeOR3SZDkclP2ZlW6tx4Dftw8fwIxan7riFCaMsnJgnuUo60bjv7wqTFJTUK+DM+1p4klh6UFNrd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(39860400002)(136003)(396003)(376002)(451199021)(5660300002)(478600001)(66476007)(66946007)(66556008)(2906002)(8676002)(8936002)(316002)(6486002)(6916009)(41300700001)(6666004)(44832011)(6512007)(6506007)(26005)(1076003)(186003)(82960400001)(2616005)(36756003)(83380400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?30nSnBcawuEfbfbo8niTxKC3a+4nV3puUwRVtT7htAX9hfo2H/2NvZ/SOSzs?=
 =?us-ascii?Q?eRWBOaPEZFm5Gg4EYDPzTKqxep+jycU4XD2b6QYr8pvTBBsJgjg877tS/GnT?=
 =?us-ascii?Q?6naZ0Xm21k4aDl1x7sa0yHhcS86zWXu4Mi0FocvrXrw7BxVrVM5VcM7Ifrhq?=
 =?us-ascii?Q?rLGmmhh155d3iNhT/CegR8H920/jKuSvNiiwQhEAzM70/WV8jaH0+dFamqX5?=
 =?us-ascii?Q?gOHXsS0rZAIVu9tbet52WbAMWixsg4rqVUXr3I3PJSH7wFCyduj223CdP2Il?=
 =?us-ascii?Q?Ak7ICT9lHfxsOkjOyPWi+af3pFnrXbu6iGEdZfJEzUGS3jr7kXOH0JpEohau?=
 =?us-ascii?Q?ksk6EWgaewLn7FJ7NxoUFkMSFQAvVd5JPPpXdW2H3sRdhs9p2by6Z9XTsztk?=
 =?us-ascii?Q?IZXBsNP1EMkXA2Y7y8yk1jIlTURfjR/bApXTksdKVmj5WjrdaJvnkfOJj2vK?=
 =?us-ascii?Q?G915PhpYLQU8grUZmPljF9puXZXxwav6vgvaIdjmr5D4ROo9Jdm0PVgVdeM0?=
 =?us-ascii?Q?lCMTNO1NDqIN7vhJtm6zyS0ly+S1Teq21K7SKaVqeNNURQCVcMkJb4tR1Uzt?=
 =?us-ascii?Q?ptvNOufXhv4m7SNVr1MS7AzO8Qwip08gWPUnsKjeJQ0NPxuScGax+ZwxZT5X?=
 =?us-ascii?Q?72XJ1snRVCoDHf6sGDOC+6G0+Nt81mCbuEOCxngpRxzgyRERd6h+hH+W9BmS?=
 =?us-ascii?Q?4amW1vAETFcQ+YUk8HZ37hz7JOml5ZxhgsVGEU5qTGS7+G4vuOaONZNR+p1i?=
 =?us-ascii?Q?EX7394A3Ir9YPjbj+ZLC+3O9jO7uHPrhjEv6NWQrpHPXaczwgUKvrx8y9mvg?=
 =?us-ascii?Q?ZeGGDD8xlLziRvjhajXXNRk2SVK7KdFzgp6fHAl2YG6hEAbaL7s/wT/P1ANv?=
 =?us-ascii?Q?DOpbNr1govp2hBHIXAC/BOldjWb/LKTUKeHqVE7b2kIUznnyY29auldBIl+v?=
 =?us-ascii?Q?MSpwL4vMi53egaLXoaC9w7fmO3ZJ2yoAWEGPVYpNn/0zMmMDnCZmtTX6yk3D?=
 =?us-ascii?Q?/vZUPzU9Bfo4WR/5jkZWSE4S7mBs2uIepdt+pIhZ3UC5BXyZrZWANmlmIexf?=
 =?us-ascii?Q?hFJVqtkHzHaev9QF0jPss2qSEo6nNyYK6+2eaCe1srzvRn6nyL+Yts+d6r+o?=
 =?us-ascii?Q?q7wVBnkx06m48NzmRUChz9TiSFkKnsRK9jBBbG1UE84bxkSuAY7w5dlmOhF+?=
 =?us-ascii?Q?nsItUdOxsMyydlvX8XjXke+hdXq6AgZV6YWYdbILfdvDjbGHN+dY+w0zuqYg?=
 =?us-ascii?Q?VylX9nSXBBKhAOeC12ua2vlezUQZbzFvYpYuBUfz8qQaVwrTuQjc99j3gCYh?=
 =?us-ascii?Q?XIiTxQIBJ6qpgjj9ZGVKMAIPOxFL3KVIJsDjwFUu8aHUodsx6TxEEZ87HQd7?=
 =?us-ascii?Q?UWIEOYd0oJPGFWuVXZt9bPBVz6rmb2xES6kTCLB+LrS7Th64bcyQ7zkxcDpf?=
 =?us-ascii?Q?+KSXbwaUoYhYSZu5z1+p7WPBwhc1emcdQ6L7AxNbv4hidk/Cjbs6sl+Ee/8S?=
 =?us-ascii?Q?iWauMra9qfVVcWl8060QISC+gZ5VPU31RbL1Omciy4oAzY9DTLZu7KWKcw12?=
 =?us-ascii?Q?c3gDo6NrPn1nnzk3+z+z9ZqZhJpQ41D4ZRt4nTR7h2IAw5Go99QICyKoo5Bn?=
 =?us-ascii?Q?6g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 236ff42b-213d-419d-35d0-08db586b8f2c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 13:18:39.3786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WwYrZAIVLhYlT2ktvB9MML+ZhGof9FqqthPyfpF9q3Wn4+U0CU1NYuoWOvoVD8EEpqZJ2x43JxZ0wQWj6drRkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5644
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [CI 05/11] drm/xe: Add GuC CT snapshot to xe_devcoredump.
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

Let's start to move our existent logs to devcoredump one by
one. Any format change should come on follow-up work.

v2: Rebase and add the dma_fence locking annotation here.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c       | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  4 ++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 00b9cc44c773..b0e3db148ce2 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -11,6 +11,7 @@
 
 #include "xe_engine.h"
 #include "xe_gt.h"
+#include "xe_guc_ct.h"
 
 /**
  * DOC: Xe device coredump
@@ -48,6 +49,11 @@ static struct xe_device *coredump_to_xe(const struct xe_devcoredump *coredump)
 	return container_of(coredump, struct xe_device, devcoredump);
 }
 
+static struct xe_guc *engine_to_guc(struct xe_engine *e)
+{
+	return &e->gt->uc.guc;
+}
+
 static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 				   size_t count, void *data, size_t datalen)
 {
@@ -78,6 +84,9 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	ts = ktime_to_timespec64(ss->boot_time);
 	drm_printf(&p, "Uptime: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
 
+	drm_printf(&p, "\n**** GuC CT ****\n");
+	xe_guc_ct_snapshot_print(coredump->snapshot.ct, &p);
+
 	return count - iter.remain;
 }
 
@@ -89,6 +98,8 @@ static void xe_devcoredump_free(void *data)
 	if (!data || !coredump_to_xe(coredump))
 		return;
 
+	xe_guc_ct_snapshot_free(coredump->snapshot.ct);
+
 	coredump->captured = false;
 	drm_info(&coredump_to_xe(coredump)->drm,
 		 "Xe device coredump has been deleted.\n");
@@ -98,9 +109,15 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 				 struct xe_engine *e)
 {
 	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
+	struct xe_guc *guc = engine_to_guc(e);
+	bool cookie;
 
 	ss->snapshot_time = ktime_get_real();
 	ss->boot_time = ktime_get_boottime();
+
+	cookie = dma_fence_begin_signalling();
+	coredump->snapshot.ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
+	dma_fence_end_signalling(cookie);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index 52bd27ca1036..4e3371c7b9c5 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -23,6 +23,10 @@ struct xe_devcoredump_snapshot {
 	ktime_t snapshot_time;
 	/** @boot_time:  Relative boot time so the uptime can be calculated. */
 	ktime_t boot_time;
+
+	/* GuC snapshots */
+	/** @ct_snapshot: GuC CT snapshot */
+	struct xe_guc_ct_snapshot *ct;
 };
 
 /**
-- 
2.39.2

