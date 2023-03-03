Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EDC8C7EE2F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Mar 2023 14:50:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B9A410E634;
	Fri,  3 Mar 2023 14:50:32 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F87610E632
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Mar 2023 14:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677855030; x=1709391030;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=/A2B0RQmP3yYHZpjQ29N13QhoM7Dwnqy9GuhVqCpK0w=;
 b=IXSV8DEgBMA1MEeep3ePnZwCDWT4iclwui27gWm+yg45AqAqU4BwwJNb
 496YepM/sN/J8qi5Y/HDLSnX+ISJlYKwTGdak+K9LoLxMGG+fVgCQ7C9z
 1K6+exOWtupZA7errh3tABlzD8gKvfOmpvIYlsY1R0f9/qmqUF+P5OaJI
 0tm3+QAU4IjRb+oLx38KErUrpEanjrVZ7thssMoypnDQW3PjnSi9BvEyJ
 BJrs8Ss9h3QPTErYhAtSPEV6eqdoyk3qijvvzH1BqYAYoy0KRwjXQtynQ
 /hs1rPrDjsg7nDhQSXdczEfZVEC3t98stn/K0yzeAjd5YW12H3L3RNS5d Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="399866396"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="399866396"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 06:50:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="677673161"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="677673161"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP; 03 Mar 2023 06:50:30 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 3 Mar 2023 06:50:29 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 3 Mar 2023 06:50:29 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 3 Mar 2023 06:50:29 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 3 Mar 2023 06:50:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GWGre+IwEGwp4YcwBBYUaW57Crv0CTJz+ruDFIiAgNJCtfK3c0kLRHRnTXDcM3tj8V4lj0Q1pj5aKCjc+gNaCr+fiYIMte5D9JqTXKRv7ohzKzbkGF3LU/7qkyLRM89ZGsKX550OfHpHghckJhZ4vtuGdvluVH3VZwXuO7ipA4Z1XkQbaYdZmh9wNdzko+V6X1hOKm2+4HtQHmRN52Sg6UOI4EAEgwgZ4gtfGmD4w30dXNGRr9xJPsSSun53tj7lFjwf30aOn75HkhcyDaaTkhAZ+f+fWEYM6vpZTwuxPlhLSErU3BzHoI3P4p7j+Bx8WclkD5Badf5FSr6NVupLLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H0AShvDpv3pioIgHHu7/bl2pfWhBAmHcC7yESsLGaI4=;
 b=ENavXojp1V58V5zNEvV1rI7vC5oVzLp/iylC6cMSFOHLL6oDBcg3Oht1L029oI0HcwK6IM3gY/iIUG5KdrUtESHONzE+7nENaLoGk9kGI5MztqKpm7HdfdYwctZS7nXtNVu5TptoBkD44H3fzKu1Yac1zDPCPgPPhBoeYcNuc7TgKbR8Ngio1JkdHCYJQ+uoGroJ7bX3BDLtGIyPhd3X11/8JV8LmnMdPG2ZZB1qAs6KO0iCM3BmDjmX1Ilv2ZMWbfaF0aYf7aNQYFEjAFvOZWfR6c4iqbrYctcn3Iywh2H00exSuyyKMPefxhZAd0u84Fw1M0cbQUv6GyU1WQ0cwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5389.namprd11.prod.outlook.com (2603:10b6:5:394::17)
 by SN7PR11MB6921.namprd11.prod.outlook.com (2603:10b6:806:2a8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Fri, 3 Mar
 2023 14:50:27 +0000
Received: from DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::efa4:91b6:58e9:a831]) by DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::efa4:91b6:58e9:a831%5]) with mapi id 15.20.6156.022; Fri, 3 Mar 2023
 14:50:27 +0000
From: Francois Dugast <francois.dugast@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 3 Mar 2023 15:50:12 +0100
Message-ID: <20230303145015.1018870-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230303145015.1018870-1-francois.dugast@intel.com>
References: <20230303145015.1018870-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0243.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::14) To DM4PR11MB5389.namprd11.prod.outlook.com
 (2603:10b6:5:394::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5389:EE_|SN7PR11MB6921:EE_
X-MS-Office365-Filtering-Correlation-Id: 16e3f023-9135-4504-2612-08db1bf6a04c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qu6NZG8tatFVgD+L00jLwZdpR9NyakFKZUQKEGyXCUILRTtcVcZ+Ku/GvbW7FNT/vphELzPxpaYx5WilA/eWts53Cg1u4ODt/C+yV3oKS5Ui0pFv6utGEDyqaNTIlpZIo15wO0af/VOjivKIyAEsXGjhzx92jKLYrdTM16wEgG9q4tJnL2OBafsz9qSQmTU4FuNJ3SSpvHvJCmAd7wbZjDc8Un3Vpz0zuGHEkmEe4E1DmVHQD6J1A7EBMB9cBDNO14SyJxoz1b7gQ4FHqD3JRvGbxS6bhvZsf4UjKurExKrPb/0VNaj7ZpCKxTDOCtaeGj7SAgvD7e0bCuJO7eN9TG+/1WhVfWfpbyaNQX0Eyn1UfYBIy7WABIb8I4Uv0l23BDHJj7qNHG7dRdd8cqLkUzj+l2S8QYBvCWwTtMg73+65+TSUNhhnl3V31YfPalaX5kTqTVrsK435XAJmT5i8lqRcLvhylCs9J2PnWSHnSxnIiylNrbvn0YI5L0lK2pcS+GZI5fu8B4mwvj0WjycRBq7uUK5NYuGXtUzv2ZkmJuxI3Mf3RbTLrrnyCXNyjwtDtAt71kj5ln6eC28Jr37VsdH5ByAz8xteKdNa81A3ldmVddrbfFI2AI03a8ZlKaGUxzj783m88kRj8tQvZ8I2ug==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5389.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(346002)(39860400002)(376002)(366004)(451199018)(36756003)(83380400001)(478600001)(316002)(66476007)(82960400001)(8676002)(6916009)(38100700002)(26005)(6666004)(6512007)(1076003)(6486002)(2616005)(66556008)(186003)(44832011)(6506007)(66946007)(5660300002)(8936002)(41300700001)(86362001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGx6cVh3UlU5anI4eWR0UW5OeUo1SW9NSU1xSjNoRmVHZXBIRWpmZzlpcys2?=
 =?utf-8?B?Rk5FZnQrcWw1alVNVDQ2TjY5S1ZHSmNNaTBtcTkySm0xMDZmMTVrbHpUdTJt?=
 =?utf-8?B?TXVwZytNSktvdUtZZENvenJpVm5lK0hPNFBISDJzVHgrY0lCQTVDTU1zdncr?=
 =?utf-8?B?eHVMUVdaMVA5cWdJMzNwRUNpWjB2V1FJSG9zVEJpUTFTUzh2ejB4VEhCVGx6?=
 =?utf-8?B?a1lFV3VxZjdYcCthVStZSDdsQm9NK09tdUV0dW9RT3JBVnExNnIzSVlHYUwx?=
 =?utf-8?B?bXVQYTUzaUJ2TkFrZkFlczRocE9uaW4wa09NSXo4aUd6UVFabS8zK3ljYzln?=
 =?utf-8?B?a09xRThOUGF1dkR4NnJ5ODBYY1lYUEZMSk8zMXhkUXhudk5Jem1KOGNrNFNh?=
 =?utf-8?B?bWZ2bGVsN3JHdEZXODhkL2RDdE1BOVZTWTdhcFFFVTE2RXMrUkRaeHVValU2?=
 =?utf-8?B?K1h2eU9vbzZCM3NOMHlJbHZtbFJNbFhOUEpicmUxZXpHZEJUdmQ3SkJ5Wk9a?=
 =?utf-8?B?SnhLSHl4dlJGUDdhV1cyK2k1SEQ4R0xNbmtrZjBNWTh2QWZVTVNrd0JVaklT?=
 =?utf-8?B?QWxxc0J5YXlnbmpYZWJNL2V0Z2RKUGZPTXMyWFN0SGMzZi9tcENSY090M3pD?=
 =?utf-8?B?dXQrVWo1UUtNeVQ4TVVSMDVlQis1aGMxbElQd1RqUDdkdjlRTW1rTkoxMTE3?=
 =?utf-8?B?Vi9ML2M0VTJ3Rk1CR3UvMGo5WmQ3MnBGUVNmcWNuekJ3NzAxUnhLVDBLR2p3?=
 =?utf-8?B?bnhKa3RMaGs3RWZ2c3J1b1lEUnF4MmZkc2JscXpSZ0xNeGJyTnQ2aEFUSU9X?=
 =?utf-8?B?cnBnUTh3SW9RMjVYd3hlOGNaaUs3TDNGYXYzSE9va2lkTFgzaDRPclprWkFK?=
 =?utf-8?B?akNLc1IwbzhEVU41YlVnN1pvOHpVMm1kWnBjSEZVZW1jeTE3a0RNYW1xRFB1?=
 =?utf-8?B?OUlFU2hTbkZEcnY4WU95OFd4Nml4eFZKVGIwb1ViY1NVdHp5dTJuWTY0bUVu?=
 =?utf-8?B?aUdpZUVaZWpCV1FNSW9nRTk4ZjhQWGNCeCs2aEllOW9kQjBtSThReTFNSUVk?=
 =?utf-8?B?a2lxekZoL09yNDU2aUoyMVdDYlhUTHBNTURxRW1VOFRMdm5ISjhlVjRrbGxq?=
 =?utf-8?B?SVZEdVZiWEN4ZWRFM0tvUTZrUENxRXBqZXM2dTNSNGxkSDc5c3JralBPK3Av?=
 =?utf-8?B?R0ZWTDA4M3VaOWgxYU5iMHJvSFQxZE9kajBHZzcwbEJRdHNvREQzWm5FR2ZX?=
 =?utf-8?B?VTJxVWJuY3R1c3c0eFo2eHBMWVIxeFIvbjl6bmZ1akZ6VSswMU82bU9KOFU3?=
 =?utf-8?B?c09MUVUxdFdKYm1hMzl4ZnhJVXV3MnNEUTVhQkRNWHV0dkdoQXZrVkVpbkk3?=
 =?utf-8?B?SjlrUHpIL0ZWY1lFeTkyZlR4MFF4Ykt4azhSeWZOeTVLaFBCenBrUmx4ZkRF?=
 =?utf-8?B?cjlmdTZXeVJhN1R3eEQzVUxnOEJ0TVdJOERCeEtEUHJQb2hhZ2RzNDFQOWNi?=
 =?utf-8?B?eUdqSEJpbEJ3QzJjKzAzZ2lCWjVkeFRMZnlCZ1VUMHZ0dFZxd09lSWhlNWVE?=
 =?utf-8?B?NjA1b1VBbnQyUlJjY0tEVmtrLzJySnBzVDJPRE11STZldzlNUHE4M2FPL2Ny?=
 =?utf-8?B?TDVOc2llNVV5bnR0NG81TENYbkhhTnBNMlg3ZUNFN2dmdVVsNE9MTlQ3Z2hX?=
 =?utf-8?B?TzdyNklwbVpRcUhoWmdOOXhlTSt4OXgrcTJDVVRSdDlaTlJUZEJLbHNVWEVp?=
 =?utf-8?B?U0NrWGV4ZkxLWjVQQVFEdEd2SUFDMndTTmNVUmQySlcxczJib0VoUi95dkFp?=
 =?utf-8?B?YU1sN0JKOHZiYTl0aXdNS1BWYld0ODh0NkJzWmFXb3ZBTzdUelEyTm8zbm50?=
 =?utf-8?B?bnMwa2RsUzh0VlFKeDVEd003cWcwb082WWZzTUFFVENuU3hmYU1VSzVBeVFn?=
 =?utf-8?B?MEhBZGdZeDlwam83N3JJaE9STkhDUGVoU0dyVWNNbXJMT2QrZndCejhJVXI4?=
 =?utf-8?B?dTZ5NzhSVGxTMGVCR3FPYkJhc05PQ2c0N0ZCS05vd3diekkrREg3Y1NGcnha?=
 =?utf-8?B?UWtXajhiYmFLSkwxd29RbGV4NlNRYnl3OVdJZGVPTzA4Y05MZjRGVDhIMkUz?=
 =?utf-8?B?NEFlRm9RT3ZjVFp0SjRuZnpiTDJnN0F6VnYvRzgwUmQvVWpVM0dGZ2grUHF3?=
 =?utf-8?B?dUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16e3f023-9135-4504-2612-08db1bf6a04c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5389.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 14:50:27.0025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u0m2Lv++fBVsSk4u9gIQeEm/ezJzY2PBSl4ihcvq2DHmtXHFwRJ0L49T4P/49ID+xNyfjjFPJJdxmX/ihZDNgSA5o31sJ8K4wK3clU2YHDg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6921
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [RFC PATCH 1/4] drm/xe/gt: Move ppat defines to a common
 file
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

This is a required step to move setup_private_ppat functions out
of xe_gt.c

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c      | 24 +-----------------------
 drivers/gpu/drm/xe/xe_gt_ppat.h | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 23 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_ppat.h

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 343370b44506..ff2f464bf083 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -20,6 +20,7 @@
 #include "xe_gt_clock.h"
 #include "xe_gt_mcr.h"
 #include "xe_gt_pagefault.h"
+#include "xe_gt_ppat.h"
 #include "xe_gt_sysfs.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_gt_topology.h"
@@ -92,20 +93,6 @@ int xe_gt_alloc(struct xe_device *xe, struct xe_gt *gt)
 	return 0;
 }
 
-/* FIXME: These should be in a common file */
-#define CHV_PPAT_SNOOP			REG_BIT(6)
-#define GEN8_PPAT_AGE(x)		((x)<<4)
-#define GEN8_PPAT_LLCeLLC		(3<<2)
-#define GEN8_PPAT_LLCELLC		(2<<2)
-#define GEN8_PPAT_LLC			(1<<2)
-#define GEN8_PPAT_WB			(3<<0)
-#define GEN8_PPAT_WT			(2<<0)
-#define GEN8_PPAT_WC			(1<<0)
-#define GEN8_PPAT_UC			(0<<0)
-#define GEN8_PPAT_ELLC_OVERRIDE		(0<<2)
-#define GEN8_PPAT(i, x)			((u64)(x) << ((i) * 8))
-#define GEN12_PPAT_CLOS(x)              ((x)<<2)
-
 static void tgl_setup_private_ppat(struct xe_gt *gt)
 {
 	/* TGL doesn't support LLC or AGE settings */
@@ -135,15 +122,6 @@ static void pvc_setup_private_ppat(struct xe_gt *gt)
 			GEN12_PPAT_CLOS(2) | GEN8_PPAT_WB);
 }
 
-#define MTL_PPAT_L4_CACHE_POLICY_MASK   REG_GENMASK(3, 2)
-#define MTL_PAT_INDEX_COH_MODE_MASK     REG_GENMASK(1, 0)
-#define MTL_PPAT_3_UC   REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 3)
-#define MTL_PPAT_1_WT   REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 1)
-#define MTL_PPAT_0_WB   REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 0)
-#define MTL_3_COH_2W    REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 3)
-#define MTL_2_COH_1W    REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 2)
-#define MTL_0_COH_NON   REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 0)
-
 static void mtl_setup_private_ppat(struct xe_gt *gt)
 {
 	xe_mmio_write32(gt, GEN12_PAT_INDEX(0).reg, MTL_PPAT_0_WB);
diff --git a/drivers/gpu/drm/xe/xe_gt_ppat.h b/drivers/gpu/drm/xe/xe_gt_ppat.h
new file mode 100644
index 000000000000..5a894bd3bf73
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_ppat.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#ifndef _XE_GT_PPAT_H_
+#define _XE_GT_PPAT_H_
+
+#include "xe_gt.h"
+
+#define CHV_PPAT_SNOOP			REG_BIT(6)
+#define GEN8_PPAT_AGE(x)		((x)<<4)
+#define GEN8_PPAT_LLCeLLC		(3<<2)
+#define GEN8_PPAT_LLCELLC		(2<<2)
+#define GEN8_PPAT_LLC			(1<<2)
+#define GEN8_PPAT_WB			(3<<0)
+#define GEN8_PPAT_WT			(2<<0)
+#define GEN8_PPAT_WC			(1<<0)
+#define GEN8_PPAT_UC			(0<<0)
+#define GEN8_PPAT_ELLC_OVERRIDE		(0<<2)
+#define GEN8_PPAT(i, x)			((u64)(x) << ((i) * 8))
+#define GEN12_PPAT_CLOS(x)              ((x)<<2)
+
+#define MTL_PPAT_L4_CACHE_POLICY_MASK   REG_GENMASK(3, 2)
+#define MTL_PAT_INDEX_COH_MODE_MASK     REG_GENMASK(1, 0)
+#define MTL_PPAT_3_UC   REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 3)
+#define MTL_PPAT_1_WT   REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 1)
+#define MTL_PPAT_0_WB   REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 0)
+#define MTL_3_COH_2W    REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 3)
+#define MTL_2_COH_1W    REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 2)
+#define MTL_0_COH_NON   REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 0)
+
+#endif /* _XE_GT_PPAT_H_ */
-- 
2.25.1

