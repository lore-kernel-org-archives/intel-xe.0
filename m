Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B535DC47DDF
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jan 2024 22:37:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6C41136A8;
	Tue, 30 Jan 2024 22:37:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B668B1136A9
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jan 2024 22:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706654247; x=1738190247;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=f/xCUKzTsqSf+BxLWog8HeNNuZa9Fkp/Hj4SKsXtR3w=;
 b=Fta3lv9nNiWypzoutXYFRXlmrNttRn9EA32L/MXkGmHIgRLsdPoYiskO
 Ct7KWGb4HZ40CVs/2sBToOyMB0aAOAP3/E8L9v4KMFFuyNUWThU4QpuxV
 14c8vorHxIMJn0QJd4SmF4yKu3s0pgZBQc3U4SOJe7iDFTgZiNk4as4/J
 bzQgSo5axvXI4lqaFw1yGBdfQR7nWuXu6DmcDMZpNPcqBh9jxsnvhM5Bq
 qEbf4jjJyKDGbqzCWO4v3k968vxbc2bWyvU4SVRPNJ6r2cfyxlc6IxX5D
 0Iz008rx71oIBdEwPU3xLCzooEvHg08w4tN4LX27aJNO4/ihmY8hb1IQs w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="2359033"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="2359033"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 14:37:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="22560649"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2024 14:37:20 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 14:37:20 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 14:37:19 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Jan 2024 14:37:19 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Jan 2024 14:37:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UIqp3Rbg2UJTKmoQzY6gk4bivLmQ3EWRMm0EcEt/FpHHbEt90uQwXoKiu5pf/z/gywSHTZnILd61+gnDsN03+cyfsc1UCpYkxhGwPXD7FdJSP3BzwVO7n9+SwGumWfM1UJLGGzjxZBvcXaaLGB6JbfwtGaLopdXXuwE1xF3sdiP3+47pU5LhymQHZXHJYTBD+PaINgIX27sekiYdBCT8oGdF+RvZRhJ20GBGVPvM9b8SQfKlSLa8wvJKTbvABmtVS8bzyogRqaEzNhNBxT2p3wAVR9HRJPqCY96/7Q1uDhkVeMLG+n+/N7M6Eou9tsoSwaknUXFJ7h5l6tDuR7B7tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aiq1iNWHOv/EaDBmNGgKGZBvTyk0Jukzbw8E/TJsluc=;
 b=XoHenCYaNuispMK7dwiOKEy4KfwopHuONpR+sYdlHbykE1HUx73OjXcpqGUfzjNhXJMjI/0Uf46Go5PuJOaTCvGSiLdDBBqfjv+tcz7egV86TYw62ASe877DpozFSCeT8bZQCgBb/ZdDRQe67J4HiXijmv/EP4Hmj4BEg1xMhDDAiigRUtV22P1VaiRs+YvznFX4mLpQplaC0CvxLNj74gNbhq7YBgvJ2fAgcnitW0mlc6E5LciU6cd3sSHa+LtdW4O734UK08YOwWN2hR/y82B0KN3NNJpgp6sTaJRN/eG+FzVcPrOdKajs+n1Zbbs2pEdungLGZXybheXajziIhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ1PR11MB6297.namprd11.prod.outlook.com (2603:10b6:a03:458::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Tue, 30 Jan
 2024 22:37:13 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7228.029; Tue, 30 Jan 2024
 22:37:12 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/xe: Convert xe_device_snapshot to a standalone
 snapshot
Date: Tue, 30 Jan 2024 17:37:08 -0500
Message-ID: <20240130223709.50881-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0192.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ1PR11MB6297:EE_
X-MS-Office365-Filtering-Correlation-Id: 69b1fb2c-2945-4bf6-9334-08dc21e400a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OGa1sxRkXWZGRXx8+aZpwpT6lXmn6s1e8dwJcUC/qJPE0q8qx7B3lG+cO4xaTOFAPM+OtYQeTOSRF/5NpAGgT4jyEUZdN0wxX9DvSg17TASeX97vJlM+C0asCkzQFcclfN89gt/68PrqwUctQKm0LAEjmigge61pWeXfQow8VelVqoliySJQRN2VCK2WIrXd6fGn7WJaHdiinmuw/RYKFa9l4WQN4dwZD75hy4ByewJs59LbQQZkreRDwNjcVGy39MzlsxX1FdIS3SxUAOCHovjf/fAM1zo1BjmTI8FNYW4kQSQoCyvSONwWWWGhDazZQKPXxiLUn2jMSJIZ57tX7QVBsZICQb/RZMP32BR8ZLbGYgE9/HkBE1LsFxV0Fh2NCYZSYdFgepS4ZOx0a+eiulyWQ7/ttCY6Bwxi/nfvgyAt6YM4uQx4lOlr9kFEbCYjvmhdkZ855GAIekyzYaM7YFCpobYwZ+ahaTrB4gs5YpfhdwK1gtVPG20i5zLtbJHIaCzko5BRpuaSWETwtpN5TmURFJoEnRKcl7JwU3V68B4GpaWq7pSREs4tT6zMzHhU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(136003)(346002)(39860400002)(366004)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(83380400001)(6506007)(6512007)(1076003)(6666004)(66946007)(38100700002)(316002)(107886003)(8936002)(41300700001)(44832011)(5660300002)(4326008)(2906002)(66476007)(8676002)(66556008)(54906003)(6916009)(6486002)(2616005)(36756003)(86362001)(82960400001)(478600001)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTNNSTJZVElCYmdJUU81Q29JajhUSFFWbHp5V2NtQVNEZENaYVhteFBwbnJk?=
 =?utf-8?B?eWc4eUMwU2NhaCttWkROU0Yrai9NdVJ2eGVZUGZ1WW5iVlB5a2VLTUM0bmFV?=
 =?utf-8?B?ditaK003MGdPeXRXWVNGY1NtMzZqa3JyN3B6SWRQN1JITnQzWStuQitPYmE1?=
 =?utf-8?B?Q0t6RXI4bGlxYnZxV1FtaEE5RTg3S3FhMmhRSkpRYWs2d2JvY053NWE2ZzF3?=
 =?utf-8?B?ak5jdDJ4d2JFbTdFaFRiaEQzbGhNNCs1UmJPM2VsOVZUSi9kYnlFcDRRdHlE?=
 =?utf-8?B?RVBUSGZZbGNOdXhVUEd6SnJFa3FxNlBxQUxDd0RZRTZvU3IxdlZLTnNTem5p?=
 =?utf-8?B?ZDhrU0N5U1B0YTIrTUkrc1RjRElOTmU0NU54YmFTR29mLzMzZWpNUytML0lR?=
 =?utf-8?B?ZE5HV0NXY2pYc2gxNTJIRjcwTVRQTWJtelRXbU9HMEpQMVRnWXYwcU1xcEtS?=
 =?utf-8?B?Nitoc1RTVnBnVms3cjdtRzlQOEprWnQ0QU5CZVZxdXBrbUVuU2h4eHhLbzd4?=
 =?utf-8?B?ZjYvUVYwdm54WXYzMkdqcFdmd2NReEJseEdUUnIyc3cvM3B1alc3QSs2OWw4?=
 =?utf-8?B?OFJhYkE1SmdDT05LcW5Pa0JYeEdlL2ZsMlpBRFBJckNVNWdmZjBZeUVnTVEr?=
 =?utf-8?B?aW5nYUgvY0t0LzA0bjRiS1RlQnRUZU5FTnNUSkYzUlVlYTcwMWFGWW9qeTI0?=
 =?utf-8?B?Mm9hYlQrQm92WW05Y2daUWlIcTRJcUIxT0JMaVJuRXBQWGo3WDJpWFdWc1Y1?=
 =?utf-8?B?NW9sNFdBZzZORUpkTzZiY0N4ZGpnb3RSOUlBWXdzSDRoanZieE4rdzhHbVZU?=
 =?utf-8?B?Qk44b002TEZQZnNGeWJSTEtxdkNOZXRJcXJZWmhqZGJ2REQyWEpZK25xZDNI?=
 =?utf-8?B?clByNUpnam43NXptMFVrL0U5cGZVTDFldDRYMlhuV2txeURlY0dKMm1sd3BZ?=
 =?utf-8?B?VTJlY2hDOHZVa2NSUkZNM1hEKzRuaEdsSHh5Mk9nSmxxR1k0Z3RGNFNUUngr?=
 =?utf-8?B?TTZsQ2ovZnViVTFPV0VrbDNWQTJ4Qm9RSFBpejY5aExGdmxoVW5SZHZMTHBs?=
 =?utf-8?B?cjR5c2NJMTdSMTBpZ2k2cnlnb3J0Q3VKSzE2elZRcmt1OTg3ZnhWa2Q3TXFv?=
 =?utf-8?B?Vm9iNHAzMktVNlR4YkR3ckp5eEllRDhQOVNsY2cvVkl3S1Rob0NUdEY3ZXVE?=
 =?utf-8?B?RHVuNDdzeDVPU1d0akRTK3pMem1GcDB5WlZqVWZtVTN4M3lzVnkzck9OeXpr?=
 =?utf-8?B?QzZtRVlueWU2QjBoSzBpM0RMMTU5RWJnblFUeDIrOEhVMTZxMmswdjA0akFK?=
 =?utf-8?B?VlpFa2NoaFV4TlAxaHJmZDZYeXhaM09CQisrZTlkc0xnM0pLb0tUMkJiYlJy?=
 =?utf-8?B?dEZGWmdsNGVaN1hrZzJwdkVtUWRoTmlGVmU1M0xBOVBPdEdpRUhNdGZrTnVi?=
 =?utf-8?B?NTZ0UTNmRWk5RE9zaGhmK1BFeVFZWDRKTUJhOHgrV2pvVDZvN0NzS3ZUbVBM?=
 =?utf-8?B?RUM0MTQyT09YT2pzc1dndTk2dUI3UVp3NncrcjVYdUJiREk2L01XaW5oZG9F?=
 =?utf-8?B?enBYVkFQOWFUL1BrVnlyUHByeGZ4U3NiNmFJUlozajZwZmgwejNHYy96bjNs?=
 =?utf-8?B?NEJGbmE0bjEySTJhZjdlN0N4NUY4QVB2Z0JDYjRSRmdEZ2RmK0RiMTIzTWpW?=
 =?utf-8?B?Vm9UOHM4RnlhUUpuU2lkWkdKakM3RlZDNHlKbEN0ZEZTbGtPb2hNOVBDQm9F?=
 =?utf-8?B?OVNRcE5QTk5uZTNBZUdVeU1sazhiWFBVdG56VDdmZklFbWlGTmZ6SmZkWUNT?=
 =?utf-8?B?akMwL0x4d0lSams2MDl0dFJiTnQ0ZktVZVdieXVFc05IWW5rMExCWGRVd21G?=
 =?utf-8?B?d2d1a1JyTlN2ci9KZzlWRFlQcmkxZU9CQXVxb3lkVWZTOGFEbjdtVk1QdjJP?=
 =?utf-8?B?Vy82a0xrS1pUL1VjZTdJSWFwTWFYeTZDcjFBVjFFZy82YXFXRFk1RCtRTnpC?=
 =?utf-8?B?L2pzOUtmb3RqYmhtSERISGN3Zk5tS3BJVE9HWHdmUUgvdmwxdVZIL1RsOFZG?=
 =?utf-8?B?UFg3QzMwZU5hYmpnVlJ3YWdSVXk3RkZ6cW5hR3hnMUFBT2lUSEcwV1RTSTJJ?=
 =?utf-8?Q?ELHr0elh7PUkJSvjWsZqFOj9H?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 69b1fb2c-2945-4bf6-9334-08dc21e400a4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 22:37:12.9323 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8UaUBrqADS6sZNCK0qAYkM077eHgDTZ1c6fqCkVkVxfCeHe35szrsAvUcis77/1yP8dz2NhODPGhizX3eY5amw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6297
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

devcoredump direction is that the snapshot could be taken
even after the driver unbind. At that point the xe device
will be gone. So, let's convert to a proper snapshot.

Cc: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c       |  5 +-
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  3 +-
 drivers/gpu/drm/xe/xe_device.c            | 80 ++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_device.h            |  6 +-
 drivers/gpu/drm/xe/xe_device_types.h      | 13 ++++
 5 files changed, 94 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index e701f0d07b67..30e7edbb8b6f 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -63,7 +63,6 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 				   size_t count, void *data, size_t datalen)
 {
 	struct xe_devcoredump *coredump = data;
-	struct xe_device *xe = coredump_to_xe(coredump);
 	struct xe_devcoredump_snapshot *ss;
 	struct drm_printer p;
 	struct drm_print_iterator iter;
@@ -90,7 +89,7 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	drm_printf(&p, "Snapshot time: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
 	ts = ktime_to_timespec64(ss->boot_time);
 	drm_printf(&p, "Uptime: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
-	xe_device_snapshot_print(xe, &p);
+	xe_device_snapshot_print(ss->xe, &p);
 
 	drm_printf(&p, "\n**** GuC CT ****\n");
 	xe_guc_ct_snapshot_print(coredump->snapshot.ct, &p);
@@ -114,6 +113,7 @@ static void xe_devcoredump_free(void *data)
 	if (!data || !coredump_to_xe(coredump))
 		return;
 
+	xe_device_snapshot_free(coredump->snapshot.xe);
 	xe_guc_ct_snapshot_free(coredump->snapshot.ct);
 	xe_guc_exec_queue_snapshot_free(coredump->snapshot.ge);
 	for (i = 0; i < XE_NUM_HW_ENGINES; i++)
@@ -153,6 +153,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 
 	xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
 
+	coredump->snapshot.xe = xe_device_snapshot_capture(gt_to_xe(q->gt));
 	coredump->snapshot.ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
 	coredump->snapshot.ge = xe_guc_exec_queue_snapshot_capture(job);
 
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index 50106efcbc29..8950b1ca7456 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -26,7 +26,8 @@ struct xe_devcoredump_snapshot {
 	/** @boot_time:  Relative boot time so the uptime can be calculated. */
 	ktime_t boot_time;
 
-	/* GuC snapshots */
+	/** @xe: Xe Device Info snapshot */
+	struct xe_device_snapshot *xe;
 	/** @ct: GuC CT snapshot */
 	struct xe_guc_ct_snapshot *ct;
 	/** @ge: Guc Engine snapshot */
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 6faa7865b1aa..6999bb7aea42 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -728,22 +728,84 @@ void xe_device_mem_access_put(struct xe_device *xe)
 	xe_assert(xe, ref >= 0);
 }
 
-void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p)
+/**
+ * xe_device_snapshot_capture - Take a quick snapshot of the Xe Device info.
+ * @xe: faulty Xe device.
+ *
+ * This can be printed out in a later stage like during dev_coredump
+ * analysis.
+ *
+ * Returns: a Xe device snapshot that must be freed by the
+ * caller, using `xe_device_snapshot_free`.
+ */
+struct xe_device_snapshot *
+xe_device_snapshot_capture(struct xe_device *xe)
 {
+	struct xe_device_snapshot *snapshot;
 	struct xe_gt *gt;
 	u8 id;
 
-	drm_printf(p, "PCI ID: 0x%04x\n", xe->info.devid);
-	drm_printf(p, "PCI revision: 0x%02x\n", xe->info.revid);
+	snapshot = kzalloc(sizeof(*snapshot), GFP_ATOMIC);
+
+	if (!snapshot) {
+		drm_err(&xe->drm, "Skipping Xe Device snapshot.\n");
+		return NULL;
+	}
 
+	snapshot->devid = xe->info.devid;
+	snapshot->revid = xe->info.revid;
+	snapshot->gt_count = xe->info.gt_count;
+
+	snapshot->gt = kmalloc_array(xe->info.gt_count,
+				    sizeof(struct gt_info_snapshot), GFP_ATOMIC);
 	for_each_gt(gt, xe, id) {
-		drm_printf(p, "GT id: %u\n", id);
+		snapshot->gt[id].type = gt->info.type;
+		snapshot->gt[id].gmdid = gt->info.gmdid;
+		snapshot->gt[id].reference_clock = gt->info.reference_clock;
+	}
+
+	return snapshot;
+}
+
+/**
+ * xe_decice_snapshot_print - Print out a given Xe device snapshot.
+ * @snapshot: Xe device snapshot object.
+ * @p: drm_printer where it will be printed out.
+ *
+ * This function prints out a given GuC Submit Engine snapshot object.
+ */
+void xe_device_snapshot_print(struct xe_device_snapshot *ss,
+			      struct drm_printer *p)
+{
+	int i;
+
+	drm_printf(p, "PCI ID: 0x%04x\n", ss->devid);
+	drm_printf(p, "PCI revision: 0x%02x\n", ss->revid);
+
+	for(i = 0; i < ss->gt_count; i++) {
+		drm_printf(p, "GT id: %u\n", i);
 		drm_printf(p, "\tType: %s\n",
-			   gt->info.type == XE_GT_TYPE_MAIN ? "main" : "media");
+			   ss->gt[i].type == XE_GT_TYPE_MAIN ? "main" : "media");
 		drm_printf(p, "\tIP ver: %u.%u.%u\n",
-			   REG_FIELD_GET(GMD_ID_ARCH_MASK, gt->info.gmdid),
-			   REG_FIELD_GET(GMD_ID_RELEASE_MASK, gt->info.gmdid),
-			   REG_FIELD_GET(GMD_ID_REVID, gt->info.gmdid));
-		drm_printf(p, "\tCS reference clock: %u\n", gt->info.reference_clock);
+			   REG_FIELD_GET(GMD_ID_ARCH_MASK, ss->gt[i].gmdid),
+			   REG_FIELD_GET(GMD_ID_RELEASE_MASK, ss->gt[i].gmdid),
+			   REG_FIELD_GET(GMD_ID_REVID, ss->gt[i].gmdid));
+		drm_printf(p, "\tCS reference clock: %u\n", ss->gt[i].reference_clock);
 	}
 }
+
+/**
+ * xe_device_snapshot_free - Free all allocated objects for a given xe device snapshot.
+ * @snapshot: Xe device snapshot object.
+ *
+ * This function free all the memory that needed to be allocated at capture
+ * time.
+ */
+void xe_device_snapshot_free(struct xe_device_snapshot *snapshot)
+{
+	if (!snapshot)
+		return;
+
+	kfree(snapshot->gt);
+	kfree(snapshot);
+}
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 270124da1e00..409bfbcffb4a 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -175,6 +175,10 @@ static inline bool xe_device_has_memirq(struct xe_device *xe)
 
 u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
 
-void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
+struct xe_device_snapshot *
+xe_device_snapshot_capture(struct xe_device *xe);
+void xe_device_snapshot_print(struct xe_device_snapshot *snapshot,
+			      struct drm_printer *p);
+void xe_device_snapshot_free(struct xe_device_snapshot *snapshot);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index eb2b806a1d23..50dac1a5b053 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -540,6 +540,19 @@ struct xe_device {
 #endif
 };
 
+struct gt_info_snapshot {
+	enum xe_gt_type type;
+	u32 gmdid;
+	u32 reference_clock;
+};
+
+struct xe_device_snapshot {
+	u16 devid;
+	u8 revid;
+	u8 gt_count;
+	struct gt_info_snapshot *gt;
+};
+
 /**
  * struct xe_file - file handle for XE driver
  */
-- 
2.43.0

