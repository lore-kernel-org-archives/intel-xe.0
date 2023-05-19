Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECEA4C77B7A
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 13:18:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C768C10E04F;
	Fri, 19 May 2023 13:18:56 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3857410E104
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 13:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684502334; x=1716038334;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=zyFMvJdj2ojQFKlCoeuV5qHUWGcClHej8n9MyDK6KRE=;
 b=TaVvEpNfSPP99hV73v16JbjxYIpWGQQbtoXKRkQW9AUb9TLC1AgKu2Z4
 5rnKpcDn9660zjO+B3P9CciVHCHgZ2alJOr+s/UIxHA0jBtVlAI9mrMXJ
 y5JLNipVwpHgpivZUUgcTFbFl+7Gfs6ze+XzLcMXqalCNCpAnBofsXgwf
 fA5MeHRg4BGMAVrQK/54XQJjITLAgRaTpE9NJvQREJJFwjTVjYXzySfgy
 BafXRnW9JZ7OJJoB3fBqKJdAZUVdx9WK3tP81RxZIqV4K8qCEC8d2AhM/
 c9dMC1XwDvxLceDGmClPF9rSirV8azZ7Ojm8ciJQV+RJc9RO/WbNT+E3R A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="380582128"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; d="scan'208";a="380582128"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 06:18:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="949106655"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; d="scan'208";a="949106655"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 19 May 2023 06:18:53 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 19 May 2023 06:18:53 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 19 May 2023 06:18:52 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 19 May 2023 06:18:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C6WMvMStAIfhaL9kF1qUDpy0CVQHxIPvrjXBETWH401MaQPsrJlXlgL83ptcroxx0yti0XBSGbsYZnIXRh9ELuynlmKhy9vZau6ONipZryEIdem2sr3bHEi2UI+U32SaUkiLPf+/iks++z4MMd0VGrPXfwHi0dfoQ1UGHiiyLz2aEGOwnWYFTSVht/HEEDMDKHDyLOJZRNKc7bJAAc3zQMshHnB1KCjwz7buZLZHYnGY+I8NjXIH2V3mmXubfZST5SCrHiyfekH+ugVMoB2TqcQyarSphWU3Rx+8PE5fsmXP9v7SPK9DhikFRLRKJCRBuNemNYIlgH8BKeA9NsqFQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2feGVrreWOzK4HjnkEpp3z/ws6yYxoIdu1cX4K/Ozk8=;
 b=aab97ciC+fFGFiYfdufgadq0dtJlTgkjpkQURHTNsD+AYH2pnDWIhEbzIM+wGLArKSrBt20ZRfrJ0UuP9zSiBXEBsqPslITrSCpTi50+lV57lCjA9iqY4lmaaq/a2r7Byc/nh5tA7pNdL1YZdm1/X5TiWR8Q35tJZYFDIbTsQkZTbbChs6H0bqEH5QY9QtLVOFMp4WLPJApdp1504CIjIhb1xZz8B81jGKGYveW+AupM4v73UTpZMsjTOp+N6TVlLSLcXhV+hiQ4OmWrFccKCFTMoCJXY5Q3AVO8/wrcoDelqXvETPApMfP27NuHqQ+Z778oIsvhandRGwM8iVsh3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB5644.namprd11.prod.outlook.com (2603:10b6:510:ef::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Fri, 19 May
 2023 13:18:51 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6411.021; Fri, 19 May 2023
 13:18:51 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 19 May 2023 09:18:17 -0400
Message-ID: <20230519131820.2020660-8-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230519131820.2020660-1-rodrigo.vivi@intel.com>
References: <20230519131820.2020660-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0058.namprd02.prod.outlook.com
 (2603:10b6:a03:54::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB5644:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e0bcd0a-bafc-4e64-665d-08db586b9649
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r/MMce3wLHK5XT4zhgq9SWdCniEnADfbhQYakgfcuSGG9r9DlbjbCpBFDKTUuLy4TcOPNX4aXcAAd/4pS2DEIBZPO66T7bs5lwjGcNvRAxjKYnsOPzWBP8XvQkAImzAlnQ5IO1OzyUR+aRssqZoW3HEKT8h3YAS1HgFTmgmHMrkPHcRywF0JdE+EbFunpu5DS3aY01HhkfSCmQU61WvPj1ZgtrhHoJ9LR3hGKOuem2q2+EO4Fia10/3w9Pe8qA/z7xyGXg8nInkh6H5GeLts2rr0/ar0q7h4CujWN2AAMz6ypzCMW30sGpRCSKfuxB4GScg7FeqR3GcZkzJV2EJ9b/XNnhLLY+nXTIplePENkenKXNp/DHdBR370xr24NxyTBf4uGbSo+Gum3byp35HAWpBA7xb8SSGvjAlvlUX/aIBSxzAzp6r3qdWP7fIZYtNWyny98OQ4tSZWjr2UNt2Fpcj5jAyWa37HEqLPazvShyfQMpkRLXMmYa/1cGztBPHzF/UKGwY/r5tjWwiVEK5eIE1S/2lnKFk1B6uEfb4v+9bDAZlKPxb/B2lzSsPb1F0k
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(39860400002)(136003)(396003)(376002)(451199021)(5660300002)(478600001)(66476007)(66946007)(66556008)(2906002)(8676002)(8936002)(316002)(6486002)(6916009)(41300700001)(6666004)(44832011)(6512007)(6506007)(26005)(1076003)(186003)(82960400001)(2616005)(36756003)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KLs0K/EFLvhPOJxm0UCLGxLGIOxXugv3/jipy9TMTfJz9tH7ul1ONSbUxC3a?=
 =?us-ascii?Q?YyvvrlsROrZ4vuPacdJann0B3iOSFr4BhgoDtWr5d3RosvDPNujmwosTntX6?=
 =?us-ascii?Q?1myjxj7Bi4S+kUfoBTzV8RLJ8ok7ZUErynCmnFpK4AUkAHDrQlpFf75RzP/W?=
 =?us-ascii?Q?DmyDDTBcCTkhE3IJAe7SvSeiWim6aA2LlttaludJTnYlaD38DD4P9jNGKh0A?=
 =?us-ascii?Q?EckccOybReNYsTx1aIekz/ucNmHXfRhrMT21wyLrR/6WZLAZ76MhC3ge9nLx?=
 =?us-ascii?Q?Tns9zlRsjPwSJvoLy8jjVSHGzXhUEFjuymGBlrW65WhLEgxQfw/mxbfSLU3f?=
 =?us-ascii?Q?eJ69qkdnT7r9XBG/X5656MDAGBylW3a/f6QPiqGlZXsVpqSkwzb+P1w1i5N0?=
 =?us-ascii?Q?rrdiXf8/lTnGto8RMd5F5FmHQiZe8BtdXgRhVYoASMNWbC9XJNGfJaiSaUWE?=
 =?us-ascii?Q?GHaV09PljsU4jtfhAcdMew7Otf9P9AYmQ4ld0/GKCU/iZX8pVVII/cPxWzLj?=
 =?us-ascii?Q?BNpFhhx2cPt4p0n/nIvCDfcqJ2dJ0HRj9M2s6SKsmAMAGtHD6EXLFbicw2j6?=
 =?us-ascii?Q?NDR0iIv80EButKHFUdbOsD8ExBUbj+yQmm3A0FAIAmUPWm6dVpHqkbgt9H2G?=
 =?us-ascii?Q?9eYGMWm+MSNTLmlCxfBHr7cbyXFNOKaG4KSJC1fOz9mpIsd0yXfDLLMdFxWl?=
 =?us-ascii?Q?SPMSV0ZA1PmqWHHUL+S9kBfKHWvn9dk3QrrfSrwEipJqR6+5dkqII7xC4cDw?=
 =?us-ascii?Q?lwi56lyG/k0oBq54KJzKUm0yYo5N3DsYNu9ifK9JEaaDkEwNoLuBYY5/WsCO?=
 =?us-ascii?Q?tq5rQEuU0eqywyjivFgkgR/YO2sLDMyWlasfD7NJ8SMkVSsB7Fr4EbS2K7I/?=
 =?us-ascii?Q?9UVGqUxLRV/pSmog5REJxYEJeSrYcPRp9QvCrTjaUjuvAqXuXjrNiIKD8ous?=
 =?us-ascii?Q?9ixeriZRRvz6jkz8m6tO6qUFaSrhmUuVDeSMbaG3A8gF1qqSxvbOz45iaWtf?=
 =?us-ascii?Q?q1zTjFKWM7kc+MLjDgoEqBkfUmpg3D3wONLMSyPqTA4ygaonSGkVmcDBI01r?=
 =?us-ascii?Q?Ho+/xklBJHQPf/zHkCV1hlWXSAZCbouCs+7YaN5Yb1ZYs+nxDjUEycvuHp0X?=
 =?us-ascii?Q?2CETZUWdnKOKTAx1GW+pzU9AhELe4asKXfqmc7RL7jT+AAuJvSd+jFNjbqWm?=
 =?us-ascii?Q?Z+27tY6mHwxx/jrZNU2TashsdERdHCRs0NbhB4GZ7HPz5pQWIaboSLRfqIOG?=
 =?us-ascii?Q?3hEgyHSBRKpnqK4XzOH91c459y678+R+QoE5rPcG52U3PI2aaw8LmqtkWOsL?=
 =?us-ascii?Q?HNvem9ZdqcI/AocAQlWciBOHLd3FVOedp09s5ifINx23G9x78Bgt60DwiqtH?=
 =?us-ascii?Q?8UfhYu60/hWDAXXOoGgadqL8uJwGD5q3FHAQvoutGtgMUsoKlEY/Go/byrt1?=
 =?us-ascii?Q?9VhSCt2kOXZE9UC8yI7o/wKoLLsz0lPlgWupc12VCcVq+AQ9Vf+7X2NrTY9z?=
 =?us-ascii?Q?oqI1zx6mNC5WfGKi9uowGHMckKJt9BVX2xfa3JxqRXJoTanhDqFuy9EZzYo9?=
 =?us-ascii?Q?xOTSe/siXyBiiL8iOkhK34s77S3PCB/iGvheJUZTl2Uhor/wt3GzGHaU9lCo?=
 =?us-ascii?Q?rA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e0bcd0a-bafc-4e64-665d-08db586b9649
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 13:18:51.1409 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jTopG0yUpCQ7v1KHQgGojmgVEimz9Oh7ScvD5Y7z8BBjRgPwgvKoMvPpo/OXIqAv7wSjhYD58wlL2+IXUNulWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5644
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [CI 08/11] drm/xe: Add GuC Submit Engine snapshot to
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Let's start to move our existent logs to devcoredump one by
one. Any format change should come on follow-up work.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c       | 4 ++++
 drivers/gpu/drm/xe/xe_devcoredump_types.h | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index b0e3db148ce2..7296c0137b47 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -12,6 +12,7 @@
 #include "xe_engine.h"
 #include "xe_gt.h"
 #include "xe_guc_ct.h"
+#include "xe_guc_submit.h"
 
 /**
  * DOC: Xe device coredump
@@ -86,6 +87,7 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 
 	drm_printf(&p, "\n**** GuC CT ****\n");
 	xe_guc_ct_snapshot_print(coredump->snapshot.ct, &p);
+	xe_guc_engine_snapshot_print(coredump->snapshot.ge, &p);
 
 	return count - iter.remain;
 }
@@ -99,6 +101,7 @@ static void xe_devcoredump_free(void *data)
 		return;
 
 	xe_guc_ct_snapshot_free(coredump->snapshot.ct);
+	xe_guc_engine_snapshot_free(coredump->snapshot.ge);
 
 	coredump->captured = false;
 	drm_info(&coredump_to_xe(coredump)->drm,
@@ -117,6 +120,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 
 	cookie = dma_fence_begin_signalling();
 	coredump->snapshot.ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
+	coredump->snapshot.ge = xe_guc_engine_snapshot_capture(e);
 	dma_fence_end_signalling(cookie);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index 4e3371c7b9c5..7c6453224139 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -27,6 +27,8 @@ struct xe_devcoredump_snapshot {
 	/* GuC snapshots */
 	/** @ct_snapshot: GuC CT snapshot */
 	struct xe_guc_ct_snapshot *ct;
+	/** @ge: Guc Engine snapshot */
+	struct xe_guc_submit_engine_snapshot *ge;
 };
 
 /**
-- 
2.39.2

