Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2E4C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 05:12:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8589910E9D2;
	Fri,  8 Dec 2023 05:12:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 131EA10E9D9
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 05:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702012327; x=1733548327;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ShYERw2oeHRmS4EygxOvTNyoa7L38xWABb+PUO2t+YQ=;
 b=fHBL8bJKcb6KKA5QSe9G+HKNR3sPQih/Ma4mnEHkYHoFVEWXYsRYz5oa
 vRjefhHtpc6VPExKeYkxakyR8zTgAooEFrsTHKeZPZXvxrwtvIPO8eYsO
 t0ocIvRRRcQWtrPDLUJ5FiQpkGAeVAEHmEKT6XDrA4jZfRcajQGaWf4s4
 2stwPB3tl4w26YT+1L1udHbxkCankfAL2Tp+ib9OCgBh0Ttxg0eGdvQDE
 ZW/CiK0UVDFQ4nYDJ8UVOE2RFH/c4Mox3umLmcVdSlhjYvgcPwfNrbrp3
 GMa/jwMdCpq/OzteoEkqom0Jf3ahXKBjeK1imL+p/nmgJpeIMBrpqc8dP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="458670818"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; d="scan'208";a="458670818"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 21:12:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="748218961"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; d="scan'208";a="748218961"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 21:12:06 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 21:12:06 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 21:12:05 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 21:12:05 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 21:12:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E6phGbxi8PxFGb5cVkaEK9dgrI8zq2gYrnuGJJgvVS1jDWPQX5GQB+0jz4Tr1hlWHk3y5O+HMhS6v6Ok3rbLrsWuPMS/8C7mAhrTsNE8we8Ndwg5pJc3zix6Kk8L7bbob49LtItXueEu1ycfU9R1dwWX3b9SnbRl02WqLqMylY4Tt7tcP4XpViAgIJCP92hCk7b5HSRfg+/OG9+zXs+bkgvYxrUdFjRt2dLyjO+5r7wWGIK39qILiLI1qisA2VRbHEbarlHe913TpQHvBNoM3jAERIxxkXI1XYCUtBjQteJG0olH7sVIBUhNdaxioaR9bPiD86e9AyEQh62S4PAhMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=of7PHn4Y13FTciZphdagMIKtZQWkGQd9M8e2D1AL3T4=;
 b=hDkmcRbEeoxLULHRlKqQL7XCkYpYycI8EH1ku2U8+U+1UoufZeNISb0LNIhWbMVlQEDjkV23hde/tqHXFmVHnjf2SkEDYCaKjK09fN+CHKvXeL/uosntMN5m+bd6fbdNXNek4jFQGAsV9eV6aFKgJTAtvN1IDTzwwVabQE0uFEcxXsH9aNCJ5kdVV5mIOgnTH8wbSfXqMF2766nMDWfjHu92wR6G9ez9GQ0qsFJHz/DxqpWPj33wVgrno7PbAnPRaB7rZs+IPgtD4FUVjn08Bk+H+OF1M0bLBcBIcdpspxbKtmeMKc+OEfJ2R+bknFJC9gzG+aEZsKQFBWowgUzwHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW4PR11MB6957.namprd11.prod.outlook.com (2603:10b6:303:22a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Fri, 8 Dec
 2023 05:12:02 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 05:12:02 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 2/3] drm/xe: Create a xe_gt_freq component for raw management
 and sysfs
Date: Fri, 8 Dec 2023 00:11:51 -0500
Message-ID: <20231208051153.664055-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231208051153.664055-1-rodrigo.vivi@intel.com>
References: <20231208051153.664055-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0079.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW4PR11MB6957:EE_
X-MS-Office365-Filtering-Correlation-Id: 48b7da0f-2e9c-4de0-a074-08dbf7ac367e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5186iCV5ve3gFkIIwYA5wQev3aTKgMAl3vyJxnXcVhjCEIOlGKSUrgxZ1GmyZlXljQaE3DFXYLi5GwTo6KKmj/ZSyP7XUWN8raNmOTcEU4LChFPcTNSuO4rVZp/liFbAovJkrXJ1kPTo37+f0GACDc1eYU8LAhlke2ipSrt3I3uBg2M4n3xIy3/2yy5p/I0ykIe1kALLirJhb1En+G+XyrGrdV5NNPgAsuDCbEogaJt20T73miMhbqHijjBOpzhYnzSWM6+C+r9sG5XnCaFSV2h8O3miOYTKmvAfMgMoQy52qph11clBVvMbmqXG4Ur+m45rCCDlpROh9LAOwyFVzuAMCbEgInbsXfBmttqpP8p9UeZcy7r+HXCjHhLcPLNRsQfaTefHPE+MN+w4JnBWsD5FcS0XdPelx5gT99Wh+yxCYWAZdNFbDGTb8EB1SshUkKMyMIXHbNeaNpzN0I3a4BEoWF+Gwceg6wDnTq5q5xq3s18fIQJbUbd/ZObrhW8nMkDh/e8B2JfA8mrkfSOdbXlSQY+YfZv1f6f34E/3Slvt0Jo3tK3YELt+gSRCIFTw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(346002)(136003)(396003)(366004)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(86362001)(36756003)(82960400001)(30864003)(2906002)(5660300002)(6666004)(6506007)(478600001)(1076003)(26005)(107886003)(6486002)(54906003)(66946007)(316002)(66556008)(6916009)(83380400001)(8676002)(8936002)(4326008)(66476007)(44832011)(6512007)(2616005)(41300700001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RThoNmpZWThkRGlLZlFyeTZHQkFEYkFSZEVXVjBEK3dxaFVtL2NtZmhLbkhF?=
 =?utf-8?B?WU14d2hhUHE1enZzdllWdGVVWmgvWElVMW9OQStSTjhCYjlycEhSUlJFM0Rm?=
 =?utf-8?B?WVFhZlc4TmYxU3lxRHBaYUdabEkwVE5xclRYdzQyb1hYOE1BcjY1bHo3ZmNX?=
 =?utf-8?B?NGZiTzBoRWJHbVFMbXAyalV4Y3FDTUhCczhOaGFhT3RGdmJsS3pNZHYwMjls?=
 =?utf-8?B?aTFGQjlVZHZ5YlVyS2tJM3MrajVkOVRMRGhsZit0OG9kaDAwbTRYZ1FDRjFq?=
 =?utf-8?B?L054cGxzTFRUb1M0OXdaMVJiVWpiUys5Y0N6SXRPRzBUTXE2K1lURWhESVV1?=
 =?utf-8?B?NUxqYXNaTkJpMXRGMThoakMyQWxmVmxUdzJ6c2R5ZXBhaUtHMzdxSlBoOXFR?=
 =?utf-8?B?OXVTTGFzL3pibTJEajJLWXd6OWlvK2FuNm9CY3JVMXQ1VUlmY2haaWtsV0p4?=
 =?utf-8?B?ejNYZmNENVZIMTlxaU9CN2NJakg4ZDNsMkEzRnMzWFdWbmRoQlNFTXBVM2pT?=
 =?utf-8?B?bmRBb1BvNWM2L2E2cVd1SCtxQ05QQ0xsbC9NamJSSDRhLzIycElnWm43cksv?=
 =?utf-8?B?eFpXaEZ2ekNtbUhQZXJpSUdWNmk1dHZ6Q1g1RFJTRkFya00rZnFUVmFETitX?=
 =?utf-8?B?b0tBY2Y2NllVTVA1ZUYzeEQrNGtrR1lTSW9IRFgvckVuRWl3V1VtemNWbnBO?=
 =?utf-8?B?d1loVnlTNG5NdVRoYTFsVk9lRFpVam85ck5UdnMwcGZ6NDNMTGxXVTZiNmRs?=
 =?utf-8?B?RlUvbzhqbG1rN2VIdUF0MzRtdnUzZUl5TThvV3dFelg1bE11eWZHbDlVRjNy?=
 =?utf-8?B?MlV2QjJyMHZyQmRNMFhCVHJiNTRvK05pU3AwOWpNc1hFU28xRzhEVlgrN1p6?=
 =?utf-8?B?UXV3SmtseGZxbXdsU0szZmgvc3cvVzdqZWJVUnI2V0lBclc2ZXJhN2o3R0lP?=
 =?utf-8?B?NmtiTW1HYmZxTDdXbEhmd3BDdVFGUURiU3VIdmJvSFhrYWgwZW8vQ3hPNEtw?=
 =?utf-8?B?YWFJRmthb1lvTHpEUjF3U2Z0VmtmSDZXUGxpb3FIa2RvM0JmS25McVhLRWhZ?=
 =?utf-8?B?Rm43enJFQ3htaEhRV2h5bFdkdUFDQ09raTNJY1ZXQ2d6cnZHK1RpUDcxWkk5?=
 =?utf-8?B?Z0dITFFBMDluOGpuMDVxa0tPRVU1aDh2cGdTVGJteU1lclhWT1l2MEl3azdh?=
 =?utf-8?B?STZ4RXVhclBwL0dsSlZHRWZ3SUZERjRkcXQzaWtuVTVtMjdoS3RtQnd0VEx4?=
 =?utf-8?B?SjJMcnRqVW5kM2YwMHVjZ1BvVllhWmNiU0tYZXhGMEttRWtVT0JneGRzdEEy?=
 =?utf-8?B?TXZsOXVacW4zWWJCYVhGNy9ETHJpbmQ5QktmZXFzVlBSNjMrdE1rQ0tnR2gw?=
 =?utf-8?B?Q2t3Q2gyalVaRmJlaFRyWDl5L0VSN0lXODNtK0JuaGRhY0RPUWxmcjVnK2FU?=
 =?utf-8?B?bzJLQnhyUktKTWhwR1M1TXZGZ1NBSEYvSVFKL3FPVlZ1QXBvS3NyNUR3eldS?=
 =?utf-8?B?Q3loRVcrcy9wT2dSc1U5L2NuRHo2TnE1d1Fkd2lnVFI5blZibnRPM0kvT1Qr?=
 =?utf-8?B?Z1R5NFVIYm5UdXFWNVU5VVN6Vk5odS9pV21ySmZTT25Ba1hIZnE3OU5YNVRm?=
 =?utf-8?B?Z093QU5Pa3J4WXZmMzhUSGlqYXpYK3hEdGROcTBYU01TVnVmV1dZZE9hQm9N?=
 =?utf-8?B?cVRzUGdNdGlMWnFTRGtjUUdOaUM2SWhDMlhvUVEzc3ZBZzNTdzVoQ1Z6bVAz?=
 =?utf-8?B?ZTFUSmZvcnRYNzQ2MDZ2bmplKzNaVnN2dUx1THAzVXg4NG1ObUlxVk1OTlY5?=
 =?utf-8?B?WUtqbWsrdEdYQjQ1Sm5VMXh6bVV1YVVZek93V0hob0k2Nk84cldVMjZHK29k?=
 =?utf-8?B?emlQazhGTDI1ZmIvc3EybHFzdktBN3czd091NWo0REdIUFdEQVVOWk9XWk1s?=
 =?utf-8?B?NEVra21GQnFvMGUrTzUzbWluWDlKTzErVnlwV2RkbW1XKzBvUExubGhnVGt2?=
 =?utf-8?B?UFRZL3N3NkYwU2dYMjBRSW9YTVViMTZqWVloMTJpNTFMRXBTSVlWYVRIZ3RG?=
 =?utf-8?B?bURLUVlTTm00MHMwd1Fwcnl3Z2J3enRWM3U2eFlSTGxodis4Y2kxcEJBandU?=
 =?utf-8?B?RXRFUDFEVytyNUtRRmdtS3ZQdlhJRjBYMzBRVjNNZzdJMVArRktEQk5OZGs0?=
 =?utf-8?B?Y3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48b7da0f-2e9c-4de0-a074-08dbf7ac367e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 05:12:02.6598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nExfb4WvDDYfOcZTnWO7WGM6IOnnYZYv7YDll5yCmyv37Qusk1QJluLjfGIY3a/QtFQZqyqVn1OOnXQQbS1RBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6957
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Goals of this new xe_gt_freq component:
1. Detach sysfs controls and raw freq management from GuC SLPC.
2. Create a directory that could later be aligned with devfreq.
3. Encapsulate all the freq control in a single directory. Although
   we only have one freq domain per GT, already start with a numbered
   freq0 directory so it could be expanded in the future if multiple
   domains or PLL are needed.

Note: Although in the goal #1, the raw freq management control is
mentioned, this patch only starts by the sysfs control. The RP freq
configuration and init freq selection are still under the guc_pc, but
should be moved to this component in a follow-up patch.

v2: - Add /tile# to the doc and remove unnecessary kobject_put (Riana)
    - s/ssize_t/int on some ret variables (Vinay)

Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/Makefile      |   1 +
 drivers/gpu/drm/xe/xe_gt.c       |   3 +
 drivers/gpu/drm/xe/xe_gt_freq.c  | 216 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_freq.h  |  13 ++
 drivers/gpu/drm/xe/xe_gt_types.h |   3 +
 drivers/gpu/drm/xe/xe_guc_pc.c   | 205 +++++++++++++++--------------
 drivers/gpu/drm/xe/xe_guc_pc.h   |  10 ++
 7 files changed, 347 insertions(+), 104 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_freq.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_freq.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index f7894ae68e00..232627e0946e 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -73,6 +73,7 @@ xe-y += xe_bb.o \
 	xe_gt_ccs_mode.o \
 	xe_gt_clock.o \
 	xe_gt_debugfs.o \
+	xe_gt_freq.o \
 	xe_gt_idle.o \
 	xe_gt_mcr.o \
 	xe_gt_pagefault.o \
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index fe3c7aac2369..dfd9cf01a5d5 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -24,6 +24,7 @@
 #include "xe_gsc.h"
 #include "xe_gt_ccs_mode.h"
 #include "xe_gt_clock.h"
+#include "xe_gt_freq.h"
 #include "xe_gt_idle.h"
 #include "xe_gt_mcr.h"
 #include "xe_gt_pagefault.h"
@@ -511,6 +512,8 @@ int xe_gt_init(struct xe_gt *gt)
 	if (err)
 		return err;
 
+	xe_gt_freq_init(gt);
+
 	xe_force_wake_init_engines(gt, gt_to_fw(gt));
 
 	err = all_fw_domain_init(gt);
diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
new file mode 100644
index 000000000000..2c3830d0e9e5
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
@@ -0,0 +1,216 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "xe_gt_freq.h"
+
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+
+#include <drm/drm_managed.h>
+#include <drm/drm_print.h>
+
+#include "xe_device_types.h"
+#include "xe_gt_sysfs.h"
+#include "xe_guc_pc.h"
+
+/**
+ * DOC: Xe GT Frequency Management
+ *
+ * This component is responsible for the raw GT frequency management, including
+ * the sysfs API.
+ *
+ * Underneath, Xe enables GuC SLPC automated frequency management. GuC is then
+ * allowed to request PCODE any frequency between the Minimum and the Maximum
+ * selected by this component. Furthermore, it is important to highlight that
+ * PCODE is the ultimate decision maker of the actual running frequency, based
+ * on thermal and other running conditions.
+ *
+ * Xe's Freq provides a sysfs API for frequency management:
+ *
+ * device/tile#/gt#/freq0/<item>_freq *read-only* files:
+ * - act_freq: The actual resolved frequency decided by PCODE.
+ * - cur_freq: The current one requested by GuC PC to the PCODE.
+ * - rpn_freq: The Render Performance (RP) N level, which is the minimal one.
+ * - rpe_freq: The Render Performance (RP) E level, which is the efficient one.
+ * - rp0_freq: The Render Performance (RP) 0 level, which is the maximum one.
+ *
+ * device/tile#/gt#/freq0/<item>_freq *read-write* files:
+ * - min_freq: Min frequency request.
+ * - max_freq: Max frequency request.
+ *             If max <= min, then freq_min becomes a fixed frequency request.
+ */
+
+static struct xe_guc_pc *
+dev_to_pc(struct device *dev)
+{
+	return &kobj_to_gt(dev->kobj.parent)->uc.guc.pc;
+}
+
+static ssize_t act_freq_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	struct xe_guc_pc *pc = dev_to_pc(dev);
+
+	return sysfs_emit(buf, "%d\n", xe_guc_pc_get_act_freq(pc));
+}
+static DEVICE_ATTR_RO(act_freq);
+
+static ssize_t cur_freq_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	struct xe_guc_pc *pc = dev_to_pc(dev);
+	u32 freq;
+	ssize_t ret;
+
+	ret = xe_guc_pc_get_cur_freq(pc, &freq);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%d\n", freq);
+}
+static DEVICE_ATTR_RO(cur_freq);
+
+static ssize_t rp0_freq_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	struct xe_guc_pc *pc = dev_to_pc(dev);
+
+	return sysfs_emit(buf, "%d\n", xe_guc_pc_get_rp0_freq(pc));
+}
+static DEVICE_ATTR_RO(rp0_freq);
+
+static ssize_t rpe_freq_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	struct xe_guc_pc *pc = dev_to_pc(dev);
+
+	return sysfs_emit(buf, "%d\n", xe_guc_pc_get_rpe_freq(pc));
+}
+static DEVICE_ATTR_RO(rpe_freq);
+
+static ssize_t rpn_freq_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	struct xe_guc_pc *pc = dev_to_pc(dev);
+
+	return sysfs_emit(buf, "%d\n", xe_guc_pc_get_rpn_freq(pc));
+}
+static DEVICE_ATTR_RO(rpn_freq);
+
+static ssize_t min_freq_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	struct xe_guc_pc *pc = dev_to_pc(dev);
+	u32 freq;
+	ssize_t ret;
+
+	ret = xe_guc_pc_get_min_freq(pc, &freq);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%d\n", freq);
+}
+
+static ssize_t min_freq_store(struct device *dev, struct device_attribute *attr,
+			      const char *buff, size_t count)
+{
+	struct xe_guc_pc *pc = dev_to_pc(dev);
+	u32 freq;
+	ssize_t ret;
+
+	ret = kstrtou32(buff, 0, &freq);
+	if (ret)
+		return ret;
+
+	ret = xe_guc_pc_set_min_freq(pc, freq);
+	if (ret)
+		return ret;
+
+	return count;
+}
+static DEVICE_ATTR_RW(min_freq);
+
+static ssize_t max_freq_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	struct xe_guc_pc *pc = dev_to_pc(dev);
+	u32 freq;
+	ssize_t ret;
+
+	ret = xe_guc_pc_get_max_freq(pc, &freq);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%d\n", freq);
+}
+
+static ssize_t max_freq_store(struct device *dev, struct device_attribute *attr,
+			      const char *buff, size_t count)
+{
+	struct xe_guc_pc *pc = dev_to_pc(dev);
+	u32 freq;
+	ssize_t ret;
+
+	ret = kstrtou32(buff, 0, &freq);
+	if (ret)
+		return ret;
+
+	ret = xe_guc_pc_set_max_freq(pc, freq);
+	if (ret)
+		return ret;
+
+	return count;
+}
+static DEVICE_ATTR_RW(max_freq);
+
+static const struct attribute *freq_attrs[] = {
+	&dev_attr_act_freq.attr,
+	&dev_attr_cur_freq.attr,
+	&dev_attr_rp0_freq.attr,
+	&dev_attr_rpe_freq.attr,
+	&dev_attr_rpn_freq.attr,
+	&dev_attr_min_freq.attr,
+	&dev_attr_max_freq.attr,
+	NULL
+};
+
+static void freq_fini(struct drm_device *drm, void *arg)
+{
+	struct kobject *kobj = arg;
+
+	sysfs_remove_files(kobj, freq_attrs);
+	kobject_put(kobj);
+}
+
+/**
+ * xe_gt_freq_init - Initialize Xe Freq component
+ * @gt: Xe GT object
+ *
+ * It needs to be initialized after GT Sysfs and GuC PC components are ready.
+ */
+void xe_gt_freq_init(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	int err;
+
+	gt->freq = kobject_create_and_add("freq0", gt->sysfs);
+	if (!gt->freq) {
+		drm_warn(&xe->drm, "failed to add freq0 directory to %s, err: %d\n",
+			 kobject_name(gt->sysfs), err);
+		return;
+	}
+
+	err = drmm_add_action_or_reset(&xe->drm, freq_fini, gt->freq);
+	if (err) {
+		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
+			 __func__, err);
+		return;
+	}
+
+	err = sysfs_create_files(gt->freq, freq_attrs);
+	if (err)
+		drm_warn(&xe->drm,  "failed to add freq attrs to %s, err: %d\n",
+			 kobject_name(gt->freq), err);
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_freq.h b/drivers/gpu/drm/xe/xe_gt_freq.h
new file mode 100644
index 000000000000..f3fe3c90491a
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_freq.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_GT_FREQ_H_
+#define _XE_GT_FREQ_H_
+
+struct xe_gt;
+
+void xe_gt_freq_init(struct xe_gt *gt);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 4e48c4643163..f74684660475 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -307,6 +307,9 @@ struct xe_gt {
 	/** @sysfs: sysfs' kobj used by xe_gt_sysfs */
 	struct kobject *sysfs;
 
+	/** @freq: Main GT freq sysfs control */
+	struct kobject *freq;
+
 	/** @mocs: info */
 	struct {
 		/** @uc_index: UC index */
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index b1876fbea669..2b627ea950f1 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -57,19 +57,6 @@
  *
  * Xe driver enables SLPC with all of its defaults features and frequency
  * selection, which varies per platform.
- * Xe's GuC PC provides a sysfs API for frequency management:
- *
- * device/gt#/freq_* *read-only* files:
- * - act_freq: The actual resolved frequency decided by PCODE.
- * - cur_freq: The current one requested by GuC PC to the Hardware.
- * - rpn_freq: The Render Performance (RP) N level, which is the minimal one.
- * - rpe_freq: The Render Performance (RP) E level, which is the efficient one.
- * - rp0_freq: The Render Performance (RP) 0 level, which is the maximum one.
- *
- * device/gt#/freq_* *read-write* files:
- * - min_freq: GuC PC min request.
- * - max_freq: GuC PC max request.
- *             If max <= min, then freq_min becomes a fixed frequency request.
  *
  * Render-C States:
  * ================
@@ -100,12 +87,6 @@ pc_to_gt(struct xe_guc_pc *pc)
 	return container_of(pc, struct xe_gt, uc.guc.pc);
 }
 
-static struct xe_guc_pc *
-dev_to_pc(struct device *dev)
-{
-	return &kobj_to_gt(&dev->kobj)->uc.guc.pc;
-}
-
 static struct iosys_map *
 pc_to_maps(struct xe_guc_pc *pc)
 {
@@ -388,14 +369,17 @@ static void pc_update_rp_values(struct xe_guc_pc *pc)
 	pc->rpn_freq = min(pc->rpn_freq, pc->rpe_freq);
 }
 
-static ssize_t act_freq_show(struct device *dev,
-			     struct device_attribute *attr, char *buf)
+/**
+ * xe_guc_pc_get_act_freq - Get Actual running frequency
+ * @pc: The GuC PC
+ *
+ * Returns: The Actual running frequency. Which might be 0 if GT is in Render-C sleep state (RC6).
+ */
+u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc)
 {
-	struct kobject *kobj = &dev->kobj;
-	struct xe_gt *gt = kobj_to_gt(kobj);
+	struct xe_gt *gt = pc_to_gt(pc);
 	struct xe_device *xe = gt_to_xe(gt);
 	u32 freq;
-	ssize_t ret;
 
 	xe_device_mem_access_get(gt_to_xe(gt));
 
@@ -408,20 +392,25 @@ static ssize_t act_freq_show(struct device *dev,
 		freq = REG_FIELD_GET(CAGF_MASK, freq);
 	}
 
-	ret = sysfs_emit(buf, "%d\n", decode_freq(freq));
+	freq = decode_freq(freq);
 
 	xe_device_mem_access_put(gt_to_xe(gt));
-	return ret;
+
+	return freq;
 }
-static DEVICE_ATTR_RO(act_freq);
 
-static ssize_t cur_freq_show(struct device *dev,
-			     struct device_attribute *attr, char *buf)
+/**
+ * xe_guc_pc_get_cur_freq - Get Current requested frequency
+ * @pc: The GuC PC
+ * @freq: A pointer to a u32 where the freq value will be returned
+ *
+ * Returns: 0 on success,
+ *         -EAGAIN if GuC PC not ready (likely in middle of a reset).
+ */
+int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq)
 {
-	struct kobject *kobj = &dev->kobj;
-	struct xe_gt *gt = kobj_to_gt(kobj);
-	u32 freq;
-	ssize_t ret;
+	struct xe_gt *gt = pc_to_gt(pc);
+	int ret;
 
 	xe_device_mem_access_get(gt_to_xe(gt));
 	/*
@@ -432,56 +421,69 @@ static ssize_t cur_freq_show(struct device *dev,
 	if (ret)
 		goto out;
 
-	freq = xe_mmio_read32(gt, RPNSWREQ);
+	*freq = xe_mmio_read32(gt, RPNSWREQ);
 
-	freq = REG_FIELD_GET(REQ_RATIO_MASK, freq);
-	ret = sysfs_emit(buf, "%d\n", decode_freq(freq));
+	*freq = REG_FIELD_GET(REQ_RATIO_MASK, *freq);
+	*freq = decode_freq(*freq);
 
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 out:
 	xe_device_mem_access_put(gt_to_xe(gt));
 	return ret;
 }
-static DEVICE_ATTR_RO(cur_freq);
 
-static ssize_t rp0_freq_show(struct device *dev,
-			     struct device_attribute *attr, char *buf)
+/**
+ * xe_guc_pc_get_rp0_freq - Get the RP0 freq
+ * @pc: The GuC PC
+ *
+ * Returns: RP0 freq.
+ */
+u32 xe_guc_pc_get_rp0_freq(struct xe_guc_pc *pc)
 {
-	struct xe_guc_pc *pc = dev_to_pc(dev);
-
-	return sysfs_emit(buf, "%d\n", pc->rp0_freq);
+	return pc->rp0_freq;
 }
-static DEVICE_ATTR_RO(rp0_freq);
 
-static ssize_t rpe_freq_show(struct device *dev,
-			     struct device_attribute *attr, char *buf)
+/**
+ * xe_guc_pc_get_rpe_freq - Get the RPe freq
+ * @pc: The GuC PC
+ *
+ * Returns: RPe freq.
+ */
+u32 xe_guc_pc_get_rpe_freq(struct xe_guc_pc *pc)
 {
-	struct xe_guc_pc *pc = dev_to_pc(dev);
 	struct xe_gt *gt = pc_to_gt(pc);
 	struct xe_device *xe = gt_to_xe(gt);
 
 	xe_device_mem_access_get(xe);
 	pc_update_rp_values(pc);
 	xe_device_mem_access_put(xe);
-	return sysfs_emit(buf, "%d\n", pc->rpe_freq);
+
+	return pc->rpe_freq;
 }
-static DEVICE_ATTR_RO(rpe_freq);
 
-static ssize_t rpn_freq_show(struct device *dev,
-			     struct device_attribute *attr, char *buf)
+/**
+ * xe_guc_pc_get_rpn_freq - Get the RPn freq
+ * @pc: The GuC PC
+ *
+ * Returns: RPn freq.
+ */
+u32 xe_guc_pc_get_rpn_freq(struct xe_guc_pc *pc)
 {
-	struct xe_guc_pc *pc = dev_to_pc(dev);
-
-	return sysfs_emit(buf, "%d\n", pc->rpn_freq);
+	return pc->rpn_freq;
 }
-static DEVICE_ATTR_RO(rpn_freq);
 
-static ssize_t min_freq_show(struct device *dev,
-			     struct device_attribute *attr, char *buf)
+/**
+ * xe_guc_pc_get_min_freq - Get the min operational frequency
+ * @pc: The GuC PC
+ * @freq: A pointer to a u32 where the freq value will be returned
+ *
+ * Returns: 0 on success,
+ *         -EAGAIN if GuC PC not ready (likely in middle of a reset).
+ */
+int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq)
 {
-	struct xe_guc_pc *pc = dev_to_pc(dev);
 	struct xe_gt *gt = pc_to_gt(pc);
-	ssize_t ret;
+	int ret;
 
 	xe_device_mem_access_get(pc_to_xe(pc));
 	mutex_lock(&pc->freq_lock);
@@ -503,7 +505,7 @@ static ssize_t min_freq_show(struct device *dev,
 	if (ret)
 		goto fw;
 
-	ret = sysfs_emit(buf, "%d\n", pc_get_min_freq(pc));
+	*freq = pc_get_min_freq(pc);
 
 fw:
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
@@ -513,16 +515,18 @@ static ssize_t min_freq_show(struct device *dev,
 	return ret;
 }
 
-static ssize_t min_freq_store(struct device *dev, struct device_attribute *attr,
-			      const char *buff, size_t count)
+/**
+ * xe_guc_pc_set_min_freq - Set the minimal operational frequency
+ * @pc: The GuC PC
+ * @freq: The selected minimal frequency
+ *
+ * Returns: 0 on success,
+ *         -EAGAIN if GuC PC not ready (likely in middle of a reset),
+ *         -EINVAL if value out of bounds.
+ */
+int xe_guc_pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
 {
-	struct xe_guc_pc *pc = dev_to_pc(dev);
-	u32 freq;
-	ssize_t ret;
-
-	ret = kstrtou32(buff, 0, &freq);
-	if (ret)
-		return ret;
+	int ret;
 
 	xe_device_mem_access_get(pc_to_xe(pc));
 	mutex_lock(&pc->freq_lock);
@@ -541,15 +545,21 @@ static ssize_t min_freq_store(struct device *dev, struct device_attribute *attr,
 out:
 	mutex_unlock(&pc->freq_lock);
 	xe_device_mem_access_put(pc_to_xe(pc));
-	return ret ?: count;
+
+	return ret;
 }
-static DEVICE_ATTR_RW(min_freq);
 
-static ssize_t max_freq_show(struct device *dev,
-			     struct device_attribute *attr, char *buf)
+/**
+ * xe_guc_pc_get_max_freq - Get Maximum operational frequency
+ * @pc: The GuC PC
+ * @freq: A pointer to a u32 where the freq value will be returned
+ *
+ * Returns: 0 on success,
+ *         -EAGAIN if GuC PC not ready (likely in middle of a reset).
+ */
+int xe_guc_pc_get_max_freq(struct xe_guc_pc *pc, u32 *freq)
 {
-	struct xe_guc_pc *pc = dev_to_pc(dev);
-	ssize_t ret;
+	int ret;
 
 	xe_device_mem_access_get(pc_to_xe(pc));
 	mutex_lock(&pc->freq_lock);
@@ -563,7 +573,7 @@ static ssize_t max_freq_show(struct device *dev,
 	if (ret)
 		goto out;
 
-	ret = sysfs_emit(buf, "%d\n", pc_get_max_freq(pc));
+	*freq = pc_get_max_freq(pc);
 
 out:
 	mutex_unlock(&pc->freq_lock);
@@ -571,16 +581,18 @@ static ssize_t max_freq_show(struct device *dev,
 	return ret;
 }
 
-static ssize_t max_freq_store(struct device *dev, struct device_attribute *attr,
-			      const char *buff, size_t count)
+/**
+ * xe_guc_pc_set_max_freq - Set the maximum operational frequency
+ * @pc: The GuC PC
+ * @freq: The selected maximum frequency value
+ *
+ * Returns: 0 on success,
+ *         -EAGAIN if GuC PC not ready (likely in middle of a reset),
+ *         -EINVAL if value out of bounds.
+ */
+int xe_guc_pc_set_max_freq(struct xe_guc_pc *pc, u32 freq)
 {
-	struct xe_guc_pc *pc = dev_to_pc(dev);
-	u32 freq;
-	ssize_t ret;
-
-	ret = kstrtou32(buff, 0, &freq);
-	if (ret)
-		return ret;
+	int ret;
 
 	xe_device_mem_access_get(pc_to_xe(pc));
 	mutex_lock(&pc->freq_lock);
@@ -599,9 +611,8 @@ static ssize_t max_freq_store(struct device *dev, struct device_attribute *attr,
 out:
 	mutex_unlock(&pc->freq_lock);
 	xe_device_mem_access_put(pc_to_xe(pc));
-	return ret ?: count;
+	return ret;
 }
-static DEVICE_ATTR_RW(max_freq);
 
 /**
  * xe_guc_pc_c_status - get the current GT C state
@@ -666,17 +677,6 @@ u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc)
 	return reg;
 }
 
-static const struct attribute *pc_attrs[] = {
-	&dev_attr_act_freq.attr,
-	&dev_attr_cur_freq.attr,
-	&dev_attr_rp0_freq.attr,
-	&dev_attr_rpe_freq.attr,
-	&dev_attr_rpn_freq.attr,
-	&dev_attr_min_freq.attr,
-	&dev_attr_max_freq.attr,
-	NULL
-};
-
 static void mtl_init_fused_rp_values(struct xe_guc_pc *pc)
 {
 	struct xe_gt *gt = pc_to_gt(pc);
@@ -952,6 +952,10 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
 	return ret;
 }
 
+/**
+ * xe_guc_pc_fini - Finalize GuC's Power Conservation component
+ * @pc: Xe_GuC_PC instance
+ */
 void xe_guc_pc_fini(struct xe_guc_pc *pc)
 {
 	struct xe_device *xe = pc_to_xe(pc);
@@ -963,7 +967,6 @@ void xe_guc_pc_fini(struct xe_guc_pc *pc)
 
 	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
 	XE_WARN_ON(xe_guc_pc_stop(pc));
-	sysfs_remove_files(pc_to_gt(pc)->sysfs, pc_attrs);
 	mutex_destroy(&pc->freq_lock);
 }
 
@@ -978,7 +981,6 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_bo *bo;
 	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
-	int err;
 
 	if (xe->info.skip_guc_pc)
 		return 0;
@@ -992,10 +994,5 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 		return PTR_ERR(bo);
 
 	pc->bo = bo;
-
-	err = sysfs_create_files(gt->sysfs, pc_attrs);
-	if (err)
-		return err;
-
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
index 054788e006f3..cecad8e9300b 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
@@ -14,6 +14,16 @@ int xe_guc_pc_start(struct xe_guc_pc *pc);
 int xe_guc_pc_stop(struct xe_guc_pc *pc);
 int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc);
 
+u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc);
+int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq);
+u32 xe_guc_pc_get_rp0_freq(struct xe_guc_pc *pc);
+u32 xe_guc_pc_get_rpe_freq(struct xe_guc_pc *pc);
+u32 xe_guc_pc_get_rpn_freq(struct xe_guc_pc *pc);
+int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq);
+int xe_guc_pc_set_min_freq(struct xe_guc_pc *pc, u32 freq);
+int xe_guc_pc_get_max_freq(struct xe_guc_pc *pc, u32 *freq);
+int xe_guc_pc_set_max_freq(struct xe_guc_pc *pc, u32 freq);
+
 enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
 u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
 u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
-- 
2.43.0

