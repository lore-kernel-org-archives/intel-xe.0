Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A24FC7EE24
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 17:07:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B51A10E2DC;
	Mon,  8 May 2023 17:07:00 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4374A10E2DC
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 17:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683565618; x=1715101618;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Zre59kx1tETw0Ncd/bSCzE2lvbIi14yUoC8WISmvIpg=;
 b=T9FSBXHXWCnhtoEEFbGPLd2MVB4yy/+JFYBSQA8pc5o28ae3mf0fTnJA
 9p8397/rdLpeyhPBC17wUGxhCj1/0dG01XGOFRzt8kHhQRrqQPg0k54wz
 xyVWT7LclvHGnScgnW1NkD4LCtnzjDgQlVrUhEbWuoM6mrsijCvCCIa7U
 YjYV3OGsgvkY41S331xQnAw1dRdQzyee8dQr/3w6h2LVvFJzRGeKS+1tK
 abs7zvEabel/jLOvyqjkoLc2h0jGPiFwQCQNCgzs7+uZOnihtCDVmZMBI
 /lTqxwdm/iU6cbaETXP6UFPTnb8E7wItdXFSx9TDSmdd2k1PHUJh5QwHb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="412963374"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="412963374"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 10:06:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="729149513"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="729149513"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 08 May 2023 10:06:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 10:06:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 10:06:49 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 10:06:49 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 10:06:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T+GAT+lTXvc14JFJIK+/2maAzo7ErYinuA92G5SjnguO7syJT6Ujf4EBiBIuxIbvHqBlzBZks1ECWw4WbutLn4ubQeL3+3bSjn083861eBAjeLPN1+JLjAlwcIzhjN8BLStPmWpnPtHFYb24v1QntpY7JD5jDOhD69xj+U7dbCpFXhT6/vNbb+YGEqdhq8XNe+7CsR1Y2sSLAoYhjeF6lAS19n/Xio4tzYUgETbIbaerFKcziBLGyrpIpFLP1KuZl1dY1b1fOWeiGwKBWY8gg80SUnNB66UL2G2RLKY1iRK8zAtV0+fFJZ3fcN691QQ9sKZ9HYKsX7VTmxLwRHVVwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O9rePj2Ep2S4rxDDOSzmpPFgfxHoMGUOC3vZ3iPnrwg=;
 b=lpG5JM14gP5oKtEJpzJ/Uku61yom6rU4QDsxW73zbzukYeM9RMvx+ogV7TOV43MynIAEZRIjvHmSJHp3PDpWQpjBE18qWduPk1d3gxIhEXAU+bbnYJ2lE7XyHGBLQarJGuiAZAPMaifV4E9d84zdiWvl/gSIN3JUV702AdzDf1caNJMyPAVdqEqwqNpz6b9y8io0TIMhm2ddp6hlC9bdoIwAEh7US0QoqWKOvJwaaVtua8x4TPAGoqq1sTXxzX+CsOk19hwQOGoPkwjS+Yl1XvzlSg3MAHRkDcQHh9blTNF+q26VGRdrjN3EY7pOOMC57ZT1TfQlHYCM7ey1vZ80Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM6PR11MB4675.namprd11.prod.outlook.com (2603:10b6:5:2ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 17:06:47 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 17:06:47 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 8 May 2023 13:06:10 -0400
Message-ID: <20230508170616.1289914-6-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508170616.1289914-1-rodrigo.vivi@intel.com>
References: <20230508170616.1289914-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0022.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM6PR11MB4675:EE_
X-MS-Office365-Filtering-Correlation-Id: f395e750-e96f-42f3-d016-08db4fe69b39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8Ugs0lZjsgsNBKv2a7EbkK8aMqUWc/8cfFZeXQ7UefmI34P60otUHeh9roDNwy+u8KhFMnWtb6NIhteHfP50grELz9RADmp6FMd3ZBEfMR7jgifsjPpc/MAWjqJmusI8U0HlTzORPryhpiLlZZwLXjW3yxHI7m4OOlpGpl5kXznEmbhvHPEpUFMRZ+Q94G33TtYvtF9tMkFw/nHnwjbWg+agyuuCLMOEn/qDSNyZhELPVpta7M3xiAK7wpz4zQzR8lvl44U2BVEJbCos6LslYscmjc6ZuZPrms5FWPgsgmcLhq0OWmZKdGXVespMEln8aCh+KxZJ7hBpa7fGHZIOItlAqhPn166Rh7vkBDCnjHchFR1Siqlg3L5a2iwY5V0u3Xkvr+MPzL81insW1EgEYT8XIZPCRmak9OHQ0Qwni92agIju0/YZAPwbh4vkRTIbnl1i7vmqTFRI7DR9cNcD4oE8GwYDpP0sgoGVLyLq0XBDTUlBIKAePR0qikOPvKLnrFNX8SxHO4dnZPDuEKz3BjsTTtVxyECjhpUBf3zel1YFncH4VjeRI59xiHz9zeUC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(39860400002)(366004)(136003)(346002)(451199021)(36756003)(38100700002)(2906002)(44832011)(316002)(5660300002)(8676002)(8936002)(86362001)(66556008)(66946007)(6916009)(82960400001)(41300700001)(66476007)(83380400001)(186003)(107886003)(26005)(6506007)(6512007)(1076003)(6486002)(478600001)(6666004)(2616005)(54906003)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?snY3oB5lLNUR9zMm5kVRF8JyIHZBXOg7D7o6QwFCMbl/xrXdzMmri2X5k1xh?=
 =?us-ascii?Q?09Vl4i9ALt8e2G2Blq+VBgSTh9vl5Uk8u5AqoG8UnSODIj1C7LcSrnhQRxri?=
 =?us-ascii?Q?jyfs6KC0ASbHGP9BDStbSxcnWfI1ueiLsUkztpxmnd4QASnRwW68ePSenKll?=
 =?us-ascii?Q?YJROwGmVh62SMybKPMR5O7vv3zdLZ0nXkLMWCFP7OsM1qWEGRz55SdwG6JVJ?=
 =?us-ascii?Q?bnJk0cAwHjvgnVwHYeYTVwq9o0Efa9ZVTxu5u2mzAr8h5idv/8qT1WxKwA50?=
 =?us-ascii?Q?Eiabhr7aRWNZaavyE3ohg0QswPT3gFo0W/rRk/R5W2F26qcyREcVQc6KlOGp?=
 =?us-ascii?Q?g3mEB6OoTkFt8Xvip3qdvL6shKpD4RxvWHJHAT5F80Fg6B1OcTSapwIkxU3S?=
 =?us-ascii?Q?K18yMOjeckGre9OBx6Ih5AskO9ieWjMa+DWoyjNju5w6mRs1Rp2ZEeE3ExVa?=
 =?us-ascii?Q?Ipk4H8boiyVEO+qK+bVLJpg2l1EZyqEBtvtxojkn6uif3rJT15yd1DMNfUgI?=
 =?us-ascii?Q?fY6m2wfUR8mRX9e4lPEV0CsixuQr38TVCZoFRp5cZ2iBeiOI0tC8TjKw9gPS?=
 =?us-ascii?Q?0peQuQXZwniT5iUtEpq+rcXnDMTR9iZctCEFoZQ9RnZVxzr7KSGI0IURCoGS?=
 =?us-ascii?Q?b7AtpcoECBbaK1/kh3AtmYl3CBBZd4b1o4azFPHT3TxWYIPre9h4Twh4kuj3?=
 =?us-ascii?Q?Ll/0mxNgaW9TnI3hbuF7rtAKyxl2nAj68rD87hhKB9Cp9VdXj5zbPCYkV3fo?=
 =?us-ascii?Q?O6PeQi78Lk5fcQSEJBPNXjtkc2EI+hZTRHRMMFNjNeeh6kUD3v/l9ck/a6ju?=
 =?us-ascii?Q?CY8MROx9Bjh5rZNrJp9FK2HK14X5wg2aqmEZ4Cs0klXYp+KQnkXY/srYbN6M?=
 =?us-ascii?Q?Fu2dOzQjPDWxqt916bhYRT/wMULggVlgMYCyXQCQLUWAJeGZ2nE6QBc9If+T?=
 =?us-ascii?Q?s0ZR7UBXKq5SOQ8+dzVlo5r+MP09QlmCyFU0bHRi2cvINV2IrUsShpgxeBlO?=
 =?us-ascii?Q?pSqr2q2O6BDSWsPwE4/17o3fAptphKv56loNOfZNU2BdnuDjTHIBfUluMnMG?=
 =?us-ascii?Q?DGKkLMTxqKAJDOEq+1iX3ZdYSApP4FsIX/ean1w9NBMt380KjdeKQ0vcalzc?=
 =?us-ascii?Q?z/6j7RHxVnadsWYbrIsv3amd5nr453xMVy5jb1yj+8vkz7j4RuIbGTEdcJ23?=
 =?us-ascii?Q?1XT9MFXuVjwzOchGxe8Hurn0jwkOnIgVkX7uH+4kt/zX1x+BZ/RPfniGoru8?=
 =?us-ascii?Q?URTqhwLk+Lvb0ax/pFYzW963GbbaFyUq3n9yZ9Pd6ncbD0dwhZca+uB6EMS0?=
 =?us-ascii?Q?djknKOkNuYWSEUEY8Nj/HQDQsFpVIa5gw+RHlElrgyQXalsq7zvN9J5IRSmf?=
 =?us-ascii?Q?1kHejyp50rFaTpl4oxz33S6l0GKyBO4GUSxHUH0Udu5sGQbol4Ccs3Zvi1Iy?=
 =?us-ascii?Q?c3aWRVACJFTRlIj+MdrYKu1sh3jZOC8XSZngg5Uigmi2MvQkmEAf/dZL7xxU?=
 =?us-ascii?Q?mkqWvTu8nbXDIpCZPQuKU+UKqdKG7QQuwWw5mJYqRoftVUQ6fWuQmQ5OabxN?=
 =?us-ascii?Q?E9hX0b6HarhKZKHBVuuA6FHmAYwM520Y9pkTxHjF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f395e750-e96f-42f3-d016-08db4fe69b39
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 17:06:47.0788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yOxek0nlXZ4r5lW5ugDtWMSfZbPYS+ZhsC21cUmlaG2aLHOJ7NGeomDcXKJf9gZMbb5awRiNbG16sgxUPAU3tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4675
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 05/11] drm/xe: Add GuC CT snapshot to
 xe_devcoredump.
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

Let's start to move our existent logs to devcoredump one by
one. Any format change should come on follow-up work.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c       | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  4 ++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index ae6ce92682e8..05e19ee1ced0 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -11,6 +11,7 @@
 
 #include "xe_engine.h"
 #include "xe_gt.h"
+#include "xe_guc_ct.h"
 
 /**
  * DOC: Xe device coredump
@@ -47,6 +48,11 @@ static struct xe_device *coredump_to_xe(const struct xe_devcoredump *coredump)
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
@@ -81,6 +87,9 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	ts = ktime_to_timespec64(ktime_sub(ss->snapshot_time, ss->boot_time));
 	drm_printf(&p, "Uptime: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
 
+	drm_printf(&p, "\n**** GuC CT ****\n");
+	xe_guc_ct_snapshot_print(coredump->snapshot.ct, &p);
+
 	mutex_unlock(&coredump->lock);
 
 	return count - iter.remain;
@@ -96,6 +105,8 @@ static void xe_devcoredump_free(void *data)
 
 	mutex_lock(&coredump->lock);
 
+	xe_guc_ct_snapshot_free(coredump->snapshot.ct);
+
 	coredump->faulty_engine = NULL;
 	drm_info(&coredump_to_xe(coredump)->drm,
 		 "Xe device coredump has been deleted.\n");
@@ -106,10 +117,13 @@ static void xe_devcoredump_free(void *data)
 static void devcoredump_snapshot(struct xe_devcoredump *coredump)
 {
 	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
+	struct xe_guc *guc = engine_to_guc(coredump->faulty_engine);
 
 	lockdep_assert_held(&coredump->lock);
 	ss->snapshot_time = ktime_get_real();
 	ss->boot_time = ktime_get_boottime();
+
+	coredump->snapshot.ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index 3f395fa9104e..1e44d5346364 100644
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

