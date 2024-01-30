Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BBDC47DDB
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jan 2024 22:37:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5619C1136A2;
	Tue, 30 Jan 2024 22:37:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E601136A2
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jan 2024 22:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706654243; x=1738190243;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=0qR8k+a0Lfz9mXzGekhFV8ZFSWpjKbyUy4+29htTkr4=;
 b=llnuZsMCZbhDMulaubsHPWHc+B9RYbpFGEAugkQXAZc3uXofpIlwvJ8j
 KLxR8G7cr+fB+zeJdGUcBd2ifHaPUEezKfVgnsW+rQaLKrfL4ebhiOcd7
 vmqbCF7TEPzjFpsAxJSw3bhKHsbU/95GQOSXrxoQagcMZRPpqVGv22Y3n
 R19qIh1CLyGbe3MpP95n4ya8lAJ6qTWmoOLL6BwmZ9RzSnWbzSZMwWbBh
 RhLiTCLYR9bQw9WSC1FO14ihJK9pXrVNSKEIjuHaHD+95ABX07M6FWUT4
 71nUg+KP5ok7kmaRGaAPrvjSRj0tGzhPKN37Mm7VVeVix6gnuotLEM9cP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="3267827"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="3267827"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 14:37:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="3943239"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2024 14:37:21 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 14:37:20 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Jan 2024 14:37:20 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Jan 2024 14:37:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EyhXHvWihqWODFqp0dsxLactPwVQJucRxGRA/Q71trpTnuQ5iGInDiwO92zhrdwuATGdoBonIBx2hIYCR0oI0IEBeZMzMEiGXTNJOWRQxeBBWrut+5FjDhjwqw/PbI0jxBtws1JNtT8d54NAfV2iAYPBuru3/KAtJZ4he5be+w3CUoryfLkT3ciNb2dUto1fYmPnOAs72X+T7BNpR/KCRN2m/jxI8IUbYHRCkgOkjUqCYg4075NfjKAE0NPrFUcKnRi2JHFyk3dq/EIi2QAwn0lzJv6x8ygJAfTUnguU/U/R+6n8IIwggWBGIlglE+IW7frGx0YegZvUcwEhJP4XFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LTR3apv5Eq9ARA6vIRAT+AE43KeGT5pXu/GZcr+bD/g=;
 b=WDfIM4rOjqLs3StaxWcQAT8QHm3cL0L5dDjePqYkvhvDucW9L4QMuHcsSU3SBwGVa+a48S6uopo+FPzYtixxwOrFqb/ReE2CFDpOylg6aM9O2cbX+hqh/TNCtzvMbV1JBl2sMiqw1yvUOFQauYoWOW+7aax20E8LOdzbnglWAZ1W6356RjcmCQ/uoMo2JChJhZ49J73b/737CM+LfNXqsn8jTEwUL7SKH2kO1kEur8v2vor/10X16D6GxxA/G9UTBTvSE2WITvIS5jQydZ9KM7riJf5DwABsxGLEX0m9ZJzrnHN4VCN6BJ3MhWp0p8rm6svp0W/uSb25P8PUteziyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ1PR11MB6297.namprd11.prod.outlook.com (2603:10b6:a03:458::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Tue, 30 Jan
 2024 22:37:16 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7228.029; Tue, 30 Jan 2024
 22:37:16 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/xe: Make a standalone snapshot to that survives unbind
Date: Tue, 30 Jan 2024 17:37:09 -0500
Message-ID: <20240130223709.50881-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240130223709.50881-1-rodrigo.vivi@intel.com>
References: <20240130223709.50881-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::38) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ1PR11MB6297:EE_
X-MS-Office365-Filtering-Correlation-Id: 40afbc4a-68de-413c-b557-08dc21e40294
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EAS27K2JjP5RAuiP3zb0pY9Lt1b3BA9bp67I3Yb1CJQTutFQWXuo3UkntO5heoLQMZGUbrGIzj7kecZP8dzJFxUuFLeYg0onLaEDdWP4P47hqQkCJDnTM9IUeG6rHcHm3dZ1Ix6V0LmqzH85KgmE490iXHW9eLAPdVF2x795Pg0rzaEBYsDrSTwq+ootGA4pVYK7y9dtTciZXZMHi884Ok2ttUcpaclaCyLa5hsq5OogH2isSZQEqT9/Y/3gwV6pN4BINnLDKSvOEdcqTzT1yIdbGHXtLi/JhMJkLLPSnOxm+qBdHGO2xxG1Oe+Bnv/qWSSwBrb9d9TdF9UklH3WYl5K1MoIBN6Kn+fTDdQDmL+DkbSJ85LUG/K/CyRjRpWL+D4izzEG3ii+2ChHbASBGpmLTUjKvyZKrDx21sJLOtqTEOpysnn4g/yX3KcWluFMvmdMrtIEPrbZxkarqdsfWnmc+BrVR67kgcHCXv0OxomWZZqckfChqabamFy7BXLuVsRc5194pJiAXJSOu6qKSENYb7OmPAKHKbGoLek06Qtu3sTIDOZvVr6+H9MepS5P
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(136003)(346002)(39860400002)(366004)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(83380400001)(6506007)(6512007)(1076003)(6666004)(66946007)(38100700002)(316002)(107886003)(8936002)(41300700001)(44832011)(5660300002)(4326008)(2906002)(66476007)(8676002)(66556008)(54906003)(6916009)(6486002)(2616005)(36756003)(86362001)(82960400001)(478600001)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LyttNDJwcXJWUjNtWjQ2OGNPTWY1WXFMdXJidkV2TDZVYVZGT05XZEhGMmNY?=
 =?utf-8?B?TVo3MlZEKzRMUTd0Sk5nN2FBYmJ1SG1kWnNBZUZsSWdzZ1dCQml3R3ZzdjM5?=
 =?utf-8?B?YWk5WFo3bTJhL2lNbjU5bGw1dFFvb1h3WkZBUnJaZVlUbGV5bnBjM3lXUzZW?=
 =?utf-8?B?VkFIdGY0djczTmFYT25zN0h5eVVHY3RjSVRpQnIzWkZHRU5rbEd6WE1idVJr?=
 =?utf-8?B?a1NXcXZDNjZvLzFXZDZBaldXN1NLZFRjcDM2djdSTkFsbkhkSnNSZk1KZ1Zn?=
 =?utf-8?B?a0JXdkRkNCtHU3dFVW8wbjJlOU83Q2RjdnRTV3ZNcHdCOEh6N3R3RExwQnFR?=
 =?utf-8?B?QVJSM0E5TkhldStKak1XeXpMWXgzd0VEMVNiMTcrSnYzdS9JNnNoWFh3YTVB?=
 =?utf-8?B?Y09KWFFGbVkvZHhoYTZFeGRaeVdKK0Vub1ZVS3BXZW94MWhZN1lSbmRmTUtL?=
 =?utf-8?B?S2pvRjJjbnpKSkFEYWFXdlVkbFl1SUozY1BucUJTNk96Zlk1bmpVNlFuN0FZ?=
 =?utf-8?B?dC9CQjlNaWI3QXRoUEFCdjRrdm5Gb3lwZ2J3ZitNRXI2SFRLdUR1d2FCRDlJ?=
 =?utf-8?B?UWhrbHBjTUhDWHVScit0QXJNMjZCaXhaM1F1S3dRK1RpUEZDekx4aDE4MzBh?=
 =?utf-8?B?YTVMcjVpTmRLem5WbGZLY25wSHUwdjdhaGVORzRxTjNxZEkyR2FtbzVYRFFZ?=
 =?utf-8?B?aHFhWlhBRlJKVFFCS2o5d3NJS0lFeElRMi9lcmc0WWN6MmJvWWNZd1hjV3Zk?=
 =?utf-8?B?NEZpYkVKT3NkWTZiZkdzYmVnMk8wWlRpdTdNZ0ZRR2hLWXZqN0VkU3BUTi90?=
 =?utf-8?B?cFFGWkh4VTZkU1A0NTNHOUFVLzhRb0ljUitLQkRxRjR5alRCbFhhRG9BQTE2?=
 =?utf-8?B?ampod1Vjcnp3ejh3N3FIY09uUzV0ZWZ1YTZOV2FUc3NXaHlNM2dTNFFoUlNE?=
 =?utf-8?B?OXIrZTdvRWtKRk55U2JXUXJHbW9LTVV4d0VkUVppMnc5VXQ4NkRZUWNDTjln?=
 =?utf-8?B?NFcvMkNQU081S3JkU1pTNzcwTmp6bmNNOWxrVWZDTTVPTllhY2FFY21aOVZS?=
 =?utf-8?B?T3Z0elRhUDBPaDJLU0FBVmVVZ2NwSkQ0NHJCNTJ0RGpkUUZTYTRHYkZqZTVL?=
 =?utf-8?B?Y0JKakRIbkc2d2FpeWRjVGJlTXk2NGErN0VDTVovcmxPQytJNHZySFpjbURh?=
 =?utf-8?B?R1VoZko3WEU0UHcxVStubG1IbFZMME5wTVVpb1daNzZSUHhqRWJiczd5bno4?=
 =?utf-8?B?c0ZQWWt0UHQyVHRJQmlkL0R1WEIxdVRPaEZSRWpqUGYzY0tGOUlhRGlrc3c2?=
 =?utf-8?B?ZlUrVmJUNFU4MnhwOWRKbkZLY2xvK0lwa0syQzhVRWc5Q2wzNVhLUGs5Nzc1?=
 =?utf-8?B?ZmZLVWZodlZyT2xlODZCMDE3cDF2VlB0UVlRZHR6c1lOK3hZR2F5YW1LSUgz?=
 =?utf-8?B?RWM2VThuMjZuYk5ZcW01NDhRczdsNVhmZVlCZm1iZmFQUWg3N0tXWHQ4V2xr?=
 =?utf-8?B?TGhFTS9WUG9MNnMzdWdXSEhNc1BGSERhb3BMV2ZpSG9XU3ZlRm5mazdWTmhv?=
 =?utf-8?B?aHFUaWYwZ3FsYkc1YVEwdDExWHJxNnBIMnFMRTFDejNEM0JjVnYxNHJHbTJ0?=
 =?utf-8?B?QmVRZytFTUZlVVJ6U2FtSXRxSEwzYndUYVZRRDRFNXgybXJaWlU1R2lLZkFX?=
 =?utf-8?B?WEdkb2w2d3FmZTI5VFBOcS90elBVbUNrdDlaYXYxVkxGYWJ1TyttT0IwbUNH?=
 =?utf-8?B?NldFNmR3MTI3OEJ5WkRMNmJ3RzM2b3JlamVoL3R2K3k2M0xydE5LNW5IcW1G?=
 =?utf-8?B?cEQyZWx3K2RoTWlZaWhGQUVpWnhUTFkwSUU1UlhpeHNlSU9tUGFhRzZReGdt?=
 =?utf-8?B?YlZlSWtudmJGOCtEWE8wU2VQcERTMng2YkpDeUdTbzNuVUtnNmtJTG9IaGZi?=
 =?utf-8?B?SXpibVBWT1ZDTFkwdjRhL2t5NTVnb1FQcnFKMU14Mk0rRUMxNzZuejJtRTdw?=
 =?utf-8?B?Q3k0UlErWTQrRkFYVTNCT3Rib05uTHpOZVVLSHd4Q0pEWlkvbjIzMlRYZE55?=
 =?utf-8?B?UlBSQzhGTjREVWQvb1ViblVybnJjYTZpWkdZRzJ5MDhPNnpXdjQrUEF0RDZ1?=
 =?utf-8?Q?eMtebocs+b/ybWGQDH6JJcuSZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40afbc4a-68de-413c-b557-08dc21e40294
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 22:37:16.2197 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4pQ/Mzvte0tMlmuae8PV+8CeC9csAAMredywmfbhxTK6Hnc1HSPZ5Titqk8tLAMtH+07CyBAgIesrT5Pe20DTw==
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

Instead of having the coredump embedded to the xe device,
let's dynamically allocate that and remove only when
requested by devcoredump.

This will allow the 'data' to be read even when the xe_device
is already gone at unbind for instance.

Of course, the module cannot be unloaded, but this is
guaranteed by devcoredump holding the xe module reference.
Only after devcoredump device deletion is that this reference
will be put and the xe module can be removed.

Our scripts and IGT helpers neeed to be adjusted to write
something to the data file before rmmod so the driver can
be properly removed or reloaded.

Cc: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c  | 32 ++++++++++------------------
 drivers/gpu/drm/xe/xe_device_types.h |  2 +-
 2 files changed, 12 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 30e7edbb8b6f..64886773b70b 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -49,11 +49,6 @@
 
 #ifdef CONFIG_DEV_COREDUMP
 
-static struct xe_device *coredump_to_xe(const struct xe_devcoredump *coredump)
-{
-	return container_of(coredump, struct xe_device, devcoredump);
-}
-
 static struct xe_guc *exec_queue_to_guc(struct xe_exec_queue *q)
 {
 	return &q->gt->uc.guc;
@@ -69,10 +64,6 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	struct timespec64 ts;
 	int i;
 
-	/* Our device is gone already... */
-	if (!data || !coredump_to_xe(coredump))
-		return -ENODEV;
-
 	iter.data = buffer;
 	iter.offset = 0;
 	iter.start = offset;
@@ -109,10 +100,6 @@ static void xe_devcoredump_free(void *data)
 	struct xe_devcoredump *coredump = data;
 	int i;
 
-	/* Our device is gone. Nothing to do... */
-	if (!data || !coredump_to_xe(coredump))
-		return;
-
 	xe_device_snapshot_free(coredump->snapshot.xe);
 	xe_guc_ct_snapshot_free(coredump->snapshot.ct);
 	xe_guc_exec_queue_snapshot_free(coredump->snapshot.ge);
@@ -121,8 +108,8 @@ static void xe_devcoredump_free(void *data)
 			xe_hw_engine_snapshot_free(coredump->snapshot.hwe[i]);
 
 	coredump->captured = false;
-	drm_info(&coredump_to_xe(coredump)->drm,
-		 "Xe device coredump has been deleted.\n");
+	coredump = NULL;
+	kfree(coredump);
 }
 
 static void devcoredump_snapshot(struct xe_devcoredump *coredump,
@@ -181,21 +168,24 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 void xe_devcoredump(struct xe_sched_job *job)
 {
 	struct xe_device *xe = gt_to_xe(job->q->gt);
-	struct xe_devcoredump *coredump = &xe->devcoredump;
 
-	if (coredump->captured) {
-		drm_dbg(&xe->drm, "Multiple hangs are occurring, but only the first snapshot was taken\n");
+	if (xe->devcoredump && xe->devcoredump->captured) {
+		drm_info(&xe->drm, "Multiple hangs are occurring, but only the first snapshot was taken\n");
 		return;
 	}
 
-	coredump->captured = true;
-	devcoredump_snapshot(coredump, job);
+	xe->devcoredump = kzalloc(sizeof(*xe->devcoredump), GFP_KERNEL);
+	if (!xe->devcoredump)
+		drm_err(&xe->drm, "devcoredump failed\n");
+
+	xe->devcoredump->captured = true;
+	devcoredump_snapshot(xe->devcoredump, job);
 
 	drm_info(&xe->drm, "Xe device coredump has been created\n");
 	drm_info(&xe->drm, "Check your /sys/class/drm/card%d/device/devcoredump/data\n",
 		 xe->drm.primary->index);
 
-	dev_coredumpm(xe->drm.dev, THIS_MODULE, coredump, 0, GFP_KERNEL,
+	dev_coredumpm(xe->drm.dev, THIS_MODULE, xe->devcoredump, 0, GFP_KERNEL,
 		      xe_devcoredump_read, xe_devcoredump_free);
 }
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 50dac1a5b053..4372f5cc98b6 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -214,7 +214,7 @@ struct xe_device {
 	struct drm_device drm;
 
 	/** @devcoredump: device coredump */
-	struct xe_devcoredump devcoredump;
+	struct xe_devcoredump *devcoredump;
 
 	/** @info: device info */
 	struct intel_device_info {
-- 
2.43.0

