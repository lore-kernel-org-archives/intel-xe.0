Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CE8C05027
	for <intel-xe@archiver.kernel.org>; Fri,  3 Feb 2023 20:24:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B78A510E09C;
	Fri,  3 Feb 2023 20:24:35 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F7510E09C
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Feb 2023 20:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675455872; x=1706991872;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=UytNa120kX+oSPmeQ1gplHiqBTsw1zxkR246MWj8sxs=;
 b=C0KAawlOGejFCyw33/0HXSTOu4Lo38mZSixh7Wmk/NAGqXHOSqK/oRWe
 UdcUbQZFkJNy1UhkP/EGzIHzxQXW1R2nXEy/ExM+CFIk3XAJ31QFcEiHS
 N8cEi2xvjqblCB2Cksmrmq/e3/XHZwazx0Npj373sCaqH903hQTWQRAHM
 xFrE+OTljhK0gc0+mYyuoYlpRVNSrlFaMASadWKfNA3RmlW48Oa7eq54s
 9gJnIZiXo12cUiKArLp6EBaDwFUZEVieL78/tO1WAYhG8UzXGBRqwI4k7
 MPI0odSxKLB7EqeF4jq6hqH4xnemLZAZcdmTs0MWXe1uBigXS7x/gZELp A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="312503015"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="312503015"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 12:24:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="754594599"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="754594599"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP; 03 Feb 2023 12:24:31 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:24:31 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:24:30 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 12:24:30 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 3 Feb 2023 12:24:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TTn/sI/rrbTnvV1g6xXm8K1UDDXTCM6QFam3ZgOPqD2IYmBtNI76bkb3oanB7Fyd1oxep/0KxaBrA9x4Dpc7L90jGyvlLi2OxXJBJim2jzJjstoY9Vml5RCaCLEPhWOX9JQyTotssVI99sI3SWGsm+ZRupqLB8hALc+q5mMuhvUlepSRKZovgJC55blMZuUNEsZxFIrA/HWi7AWipmS9sxMmhvq5+lFRY4244CdEp2R/qO7kBloG+nuSNdtTGiNy1nFuOsQ1fuS8iTyG6B+DIRodZokwz0vvUsEQD440cxjQzwAxcX+26riNQnalPYoLvO+DaGfj/TSMltt2Fkj/tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l6zoyuEgEbOKAh6Vts0WMG6dykAOJm1iY1HISJLbxtk=;
 b=dl+e3kng4JEBiYAcJkRfY1l9SxyluLb3k9F0jrFppClKcmA7u2PXA67KlAQMiJ4jvPp/d9pTyitDsHR4qWhXdFBR6hJX5FHwoMk54G+z5ImOsadRH/9vBGuaQHC0QNnpwbmQ7KMJrMpSI1D4bimrmzKHdDf4uNdbLMscYIJRyNifViOtZ2I0yiyVjR+BgWJu9b8sBdm6at6E7gS3sgwPdD9NcovU2/s16dpQoMZ16RS2QkW01cx+tXcbWJFCp1zFYdw9GuSU4aUVytNgtDsVnTsutFxX2DEoWbnxO38My42R+NpMHZ39LTGqZoYcQvM/CtKH9MuoJfDAfpsZFQo2Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB5817.namprd11.prod.outlook.com (2603:10b6:510:13a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Fri, 3 Feb
 2023 20:24:29 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%7]) with mapi id 15.20.6064.022; Fri, 3 Feb 2023
 20:24:29 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 3 Feb 2023 15:23:51 -0500
Message-ID: <20230203202409.577032-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203202409.577032-1-rodrigo.vivi@intel.com>
References: <20230203202409.577032-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:a03:254::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB5817:EE_
X-MS-Office365-Filtering-Correlation-Id: 69e5831e-e65e-44d1-c558-08db0624a6b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b4D5GRYt69xe6ewQeBrB2uMN34E4uMOl2GXhJKBDrWH7g5cg1ZoNJSdjEaurLqXU/HjqPRjTsdhLefLOKZ9y0sVKxlq1oq7v16QwzOW88b39UFBRiKVzj25baKAuy1ldcLU+Ibz7hgv9vcvw4sRcLycCJeN5p9F5tncJwLjjQExTthM3kah3zlMSfR7CSniwr9d/LDpMXjw3U37KJzimsVKET4K1TTDVOZNYVpL4Rbe5ZRNKwV0gfrWsiJljcKWyesMqhxwph0jSsdpfBJ4xfz71bN9z1r3kb2t8RT4u52CtM0SGkyTBpQ6KSHvAo5HCS05QgGdCNKHU7Ou70iOYFy1Ixqs1A7LgTmhLhNW55W9OCZPp63OiIOEnKdA3z3CakC4gKtWtqc2v/jLvwl3R98ofwojoAE/fwbyU4S+mnf2dnPnwRwQZeRDrZREpYy12aNLUefYLBxl8nIS82qZKUpp/riRArObR9JVjJnOyOpKA8idtYo689KAld4Oz6pvFt2FJ5OMKlofr2icYLY5zYRrcH3IE/HibFId3DplenTYN8U/C2Whq0hejd1bmmiFayyBSgjhDZ5UeEuo85Czi2VP6aY1pLrmIMFtETIoteRisnkB/16TfXxeK4KnLlAcUN6XFPlfZwEvQk/dNdUcOjw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(396003)(39860400002)(346002)(136003)(366004)(451199018)(6666004)(316002)(4326008)(36756003)(6916009)(66556008)(54906003)(8936002)(66476007)(8676002)(5660300002)(82960400001)(66946007)(38100700002)(86362001)(66899018)(26005)(186003)(1076003)(66574015)(6512007)(41300700001)(6506007)(2906002)(44832011)(478600001)(2616005)(83380400001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHVoYTdnaWNpYURaTU1udXZxMjM5N2dWemNxVFo4Qk9uTVl1Zjc1ZnplNU5V?=
 =?utf-8?B?YXdhQWh3VWxUQUVOeWp3ZDJ4SHdRalV4WGVaL3VXRG5xUW5tOHVMNHc4aGIr?=
 =?utf-8?B?NTZ3c3VHMUljR0dUbFZHaE00eFduaHdxYjE0ZFE5THF2dzRBU3RTQWZxSEdk?=
 =?utf-8?B?OVQ1akNOdDhUK1hKUWRvZXlSYzFtTDZVQ2JPdHUwbkNiMDVBSkEyK3o3dzhD?=
 =?utf-8?B?R2ZITGNIODBJUUcxSUkzQ1F1dUpoZXRwcmdCZlJqUVB4emg0d1BvYkJMc0FT?=
 =?utf-8?B?QXkrb05XY01RK0ZuYktOMjRPRTg5Wkh2VGhYdkdvZTdpY1BvRitKUlVOVkFv?=
 =?utf-8?B?QTRkM2VvcmU4ZUNDUi9ENVQzVDZ5bnVtVEdrVCswN2NyUkdXRGx4SmNYNkw0?=
 =?utf-8?B?L1o4NkgxVXBGclZLaFNHNTg0UlQvRW5TU3NBcUpKR2VKTnhtMUZxcEI2TkVl?=
 =?utf-8?B?T2p3bEtvRDhyb1U4aC9GRTF1dHI3eWxKOVBRZEZCMjlyc3psTUlvUTJxT1Zm?=
 =?utf-8?B?akxqOUV6MGZGNUl4bWkyemM2c09RYkFHaGVtampQQzhYT2JsTU9XcVBHNG56?=
 =?utf-8?B?N2RXS0VzU2NaZXJWNFFmKzJaaUM5a1p0TlREa3YzVDV1a2tjZkNxd0RmcGY2?=
 =?utf-8?B?REdQN3hRb1NMTE84cHh0TGowYlpxbG8rMVA1UGdwZXJyWnNKMXFJU0FGaGRr?=
 =?utf-8?B?elRCUnpKQmYyQldZMFpoTEdLbmEvNWJpTFQxOVRIY2MzcTU3eVNDeEJrNmJX?=
 =?utf-8?B?Q0FPdmE0aVQ4eFB1bHBkVGUrWjY3a3hZTTJ2T0xVdGNkQlR0Smgxb01KTVdT?=
 =?utf-8?B?bk1TbVlCMUQ4MTNQL1E0clB0T3BDZ3hLL29TQVlPeXV4R3VxamhjRDVmL3NG?=
 =?utf-8?B?Tkx5RUEvdkRiWHlhS0g0NTlGNGpYbnVnSUNMWjYrd0JkMVpSWTJiK1NnN1Qr?=
 =?utf-8?B?TjI3dzFzMno4clByMUwyY2dLbGtndkV5MjNwNGZRcEhwVk9kSVMzYmFSMzZO?=
 =?utf-8?B?TFlOQVdkTDVCd1k1dmlCZlkvLzM0aEt1OFFNaVQ0b2NkY0NWd3FwVHVTeGFR?=
 =?utf-8?B?T0xLcFlPRnZKNXNJbGd3Y0l6blQwSjhMSkpEVkZwVkdHSUcxb0graFdPYWVB?=
 =?utf-8?B?OGN4djFnQ0x6b1lhQm8zUjN4K2JCQUZ3Wk9BWEhXV3Buc2l5cEpTUWM3LzZQ?=
 =?utf-8?B?b0F5dlZmeno1YW44MlQvbWVubUltVEVra2pidzhRUUx1WkZodGo5MzZ6SEht?=
 =?utf-8?B?dDJCeWk3UlJMNFN4OElDZ2xZV3IrTGxmcGpLSURDUnp0RFczU0kvSmpIMkJh?=
 =?utf-8?B?R3ZDenRJNVBGZGVkYU5BVitnS3kvUTlWUlloYzFTR0Nma0lZT2I0THBFYzV5?=
 =?utf-8?B?RVZhNVJqODVCRjlrTnBFRklyeW1NUEQ2VkJIcDEwQkpOZkFXMEhXbU5aNjZa?=
 =?utf-8?B?QS9nY244UnkzS09IaGZNUlBVdVMyNXdJY3ZacFQvQ2dSK2loc3FSWHphT2p4?=
 =?utf-8?B?bjA5QThTQU1KaGxqVXVSck9kekVHMEE1SHFReC9wbWxVbVF1MXp0bGRvYkhM?=
 =?utf-8?B?RGVkQmQvTFNCc0lEVk5Sc1VRYnRianFPL3FhaUNUK01iOVROdW55eFZwU2R6?=
 =?utf-8?B?VWpIV0xNZVhmTXNYaXdXMER6V3kvN0hCYVdxL2wxbWNjVlgrdXFjaDdWY2Y3?=
 =?utf-8?B?aHExYURJOHdPc3JtdVRXaHk3UnlKNVZHZGUxVklWYWdhSkVKYXhXZVduaFpJ?=
 =?utf-8?B?aHdDdk1JTS83T2pGRDdEZ09sOTUyNlN4OXBzb1NXbHBvbHVjUlR4WVlac1FJ?=
 =?utf-8?B?TG9rQTk3bjkvbitwWVd0OVVHTEIzckw5a0kvTEJRT29aNnhLZ3RIM2ExQ3hp?=
 =?utf-8?B?ZmdiZlpaR0xiREp4dkZQNGF4a0xIVUVLMk5QSklXVktRQks5MENoeGJVSysz?=
 =?utf-8?B?NlhNS1hsa2xKdE9YU0hpMmtJcXhrQmxVWDRpN212M0hxVHZFWGF6ckFDYnNH?=
 =?utf-8?B?Tk01RkVIbGZyMTdjcnZDYmxUSlJ0MmNUcVpSektTampaMGRWVzltcXdVVnZL?=
 =?utf-8?B?dmhBaTVETngwYTBhbFc1STJCT0FyZWY4MSs5b1NQbmZJOWlzSTVZZWxpdHh5?=
 =?utf-8?B?Z1FNdFlwK3lMbmI0NjhZSndxTTdFb3BNeFJ0b2x2clpCcFp4djFtVXBxUTA4?=
 =?utf-8?B?V0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 69e5831e-e65e-44d1-c558-08db0624a6b5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 20:24:29.1076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YEbhVXMXa5FUf4bh3L/gpW++1FdKLFQHLR7U1Q4kqW8Pt415hsMZ1ekcJDKXp39K8B2WCpxVtOw213x7PfheFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5817
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 04/22] drm/xe: Add TLB invalidation fence
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
Cc: niranjana.vishwanathapura@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

Fence will be signaled when TLB invalidation completion.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c                    |  1 +
 drivers/gpu/drm/xe/xe_gt_debugfs.c            |  2 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c          |  2 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   | 43 +++++++++++++++++--
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h   |  6 ++-
 .../gpu/drm/xe/xe_gt_tlb_invalidation_types.h | 26 +++++++++++
 drivers/gpu/drm/xe/xe_gt_types.h              |  5 +++
 drivers/gpu/drm/xe/xe_vm.c                    |  2 +-
 8 files changed, 80 insertions(+), 7 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 1eb280c4f5f4..0be75f8afe4b 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -668,6 +668,7 @@ static int gt_reset(struct xe_gt *gt)
 
 	xe_uc_stop_prepare(&gt->uc);
 	xe_gt_pagefault_reset(gt);
+	xe_gt_tlb_invalidation_reset(gt);
 
 	err = xe_uc_stop(&gt->uc);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index cd1888784141..30058c6100ab 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -96,7 +96,7 @@ static int invalidate_tlb(struct seq_file *m, void *data)
 	int seqno;
 	int ret = 0;
 
-	seqno = xe_gt_tlb_invalidation(gt);
+	seqno = xe_gt_tlb_invalidation(gt, NULL);
 	XE_WARN_ON(seqno < 0);
 	if (seqno > 0)
 		ret = xe_gt_tlb_invalidation_wait(gt, seqno);
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 93a8efe5d0a0..705093cb63d7 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -245,7 +245,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 		 * defer TLB invalidate + fault response to a callback of fence
 		 * too
 		 */
-		ret = xe_gt_tlb_invalidation(gt);
+		ret = xe_gt_tlb_invalidation(gt, NULL);
 		if (ret >= 0)
 			ret = 0;
 	}
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index a39a2fb163ae..0058a155eeb9 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -17,11 +17,27 @@ guc_to_gt(struct xe_guc *guc)
 int xe_gt_tlb_invalidation_init(struct xe_gt *gt)
 {
 	gt->tlb_invalidation.seqno = 1;
+	INIT_LIST_HEAD(&gt->tlb_invalidation.pending_fences);
 
 	return 0;
 }
 
-static int send_tlb_invalidation(struct xe_guc *guc)
+void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
+{
+	struct xe_gt_tlb_invalidation_fence *fence, *next;
+
+	mutex_lock(&gt->uc.guc.ct.lock);
+	list_for_each_entry_safe(fence, next,
+				 &gt->tlb_invalidation.pending_fences, link) {
+		list_del(&fence->link);
+		dma_fence_signal(&fence->base);
+		dma_fence_put(&fence->base);
+	}
+	mutex_unlock(&gt->uc.guc.ct.lock);
+}
+
+static int send_tlb_invalidation(struct xe_guc *guc,
+				 struct xe_gt_tlb_invalidation_fence *fence)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
 	u32 action[] = {
@@ -41,6 +57,15 @@ static int send_tlb_invalidation(struct xe_guc *guc)
 	 */
 	mutex_lock(&guc->ct.lock);
 	seqno = gt->tlb_invalidation.seqno;
+	if (fence) {
+		/*
+		 * FIXME: How to deal TLB invalidation timeout, right now we
+		 * just have an endless fence which isn't ideal.
+		 */
+		fence->seqno = seqno;
+		list_add_tail(&fence->link,
+			      &gt->tlb_invalidation.pending_fences);
+	}
 	action[1] = seqno;
 	gt->tlb_invalidation.seqno = (gt->tlb_invalidation.seqno + 1) %
 		TLB_INVALIDATION_SEQNO_MAX;
@@ -55,9 +80,10 @@ static int send_tlb_invalidation(struct xe_guc *guc)
 	return ret;
 }
 
-int xe_gt_tlb_invalidation(struct xe_gt *gt)
+int xe_gt_tlb_invalidation(struct xe_gt *gt,
+			   struct xe_gt_tlb_invalidation_fence *fence)
 {
-	return send_tlb_invalidation(&gt->uc.guc);
+	return send_tlb_invalidation(&gt->uc.guc, fence);
 }
 
 static bool tlb_invalidation_seqno_past(struct xe_gt *gt, int seqno)
@@ -97,8 +123,11 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
 int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
+	struct xe_gt_tlb_invalidation_fence *fence;
 	int expected_seqno;
 
+	lockdep_assert_held(&guc->ct.lock);
+
 	if (unlikely(len != 1))
 		return -EPROTO;
 
@@ -111,5 +140,13 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	smp_wmb();
 	wake_up_all(&guc->ct.wq);
 
+	fence = list_first_entry_or_null(&gt->tlb_invalidation.pending_fences,
+					 typeof(*fence), link);
+	if (fence && tlb_invalidation_seqno_past(gt, fence->seqno)) {
+		list_del(&fence->link);
+		dma_fence_signal(&fence->base);
+		dma_fence_put(&fence->base);
+	}
+
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
index f1c3b34b1993..7e6fbf46f0e3 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
@@ -8,11 +8,15 @@
 
 #include <linux/types.h>
 
+#include "xe_gt_tlb_invalidation_types.h"
+
 struct xe_gt;
 struct xe_guc;
 
 int xe_gt_tlb_invalidation_init(struct xe_gt *gt);
-int xe_gt_tlb_invalidation(struct xe_gt *gt);
+void xe_gt_tlb_invalidation_reset(struct xe_gt *gt);
+int xe_gt_tlb_invalidation(struct xe_gt *gt,
+			   struct xe_gt_tlb_invalidation_fence *fence);
 int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno);
 int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
 
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
new file mode 100644
index 000000000000..ab57c14c6d14
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_GT_TLB_INVALIDATION_TYPES_H_
+#define _XE_GT_TLB_INVALIDATION_TYPES_H_
+
+#include <linux/dma-fence.h>
+
+/**
+ * struct xe_gt_tlb_invalidation_fence - XE GT TLB invalidation fence
+ *
+ * Optionally passed to xe_gt_tlb_invalidation and will be signaled upon TLB
+ * invalidation completion.
+ */
+struct xe_gt_tlb_invalidation_fence {
+	/** @base: dma fence base */
+	struct dma_fence base;
+	/** @link: link into list of pending tlb fences */
+	struct list_head link;
+	/** @seqno: seqno of TLB invalidation to signal fence one */
+	int seqno;
+};
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 3bfce7abe857..a755e3a86552 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -169,6 +169,11 @@ struct xe_gt {
 		 * @seqno_recv: last received TLB invalidation seqno, protected by CT lock
 		 */
 		int seqno_recv;
+		/**
+		 * @pending_fences: list of pending fences waiting TLB
+		 * invaliations, protected by CT lock
+		 */
+		struct list_head pending_fences;
 	} tlb_invalidation;
 
 	/** @usm: unified shared memory state */
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 92ecc7fc55b6..4c0080d081f3 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3321,7 +3321,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 		if (xe_pt_zap_ptes(gt, vma)) {
 			gt_needs_invalidate |= BIT(id);
 			xe_device_wmb(xe);
-			seqno[id] = xe_gt_tlb_invalidation(gt);
+			seqno[id] = xe_gt_tlb_invalidation(gt, NULL);
 			if (seqno[id] < 0)
 				return seqno[id];
 		}
-- 
2.39.1

