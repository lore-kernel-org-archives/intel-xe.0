Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E6D5C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 06:46:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D67C110E9D7;
	Fri,  8 Dec 2023 06:46:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74A2210E9D7
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 06:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702018014; x=1733554014;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=Mh9cmmPlA2CJka0E7LyIPkt9lbQhPKdAPXK78o/z42c=;
 b=EoRgtPeuli6ZfTnae/XURp2oqjcENSM9bqgiVFEIDrOkQwKR61aNETEI
 lJtQkNIaaCa9E6xwq8QxDv74QRyxtiiGctoP/60QuEZyh9FzEmKgM/TVS
 GElqMfgNH+gRU+5UlVviEfJduxw+ivu1s2ojFvuqjZotarKcxj0zxWLlX
 IpDoBIBv/NrBhkwxf3SxHwCaAECW+D7hhqxuyPmrgwy/3GZV7pFHzMC5h
 R1YKZQ+g0vQyq9WBJ9OPgHIpiWY1rDRTS6rKTnko6GS9MnCi5LvE7uXIz
 QFjLexO3dT5KULoqSfB2hnCfp79CIWImFUduClZr9GZCBVIHmUQPL7bxz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="397153906"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="397153906"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 22:46:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="895420932"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="895420932"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 22:46:53 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 22:46:53 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 22:46:52 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 22:46:52 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 22:46:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J7YKMAAoWuqhkUWtKopppzT+OFOV+FWbZMA1DoALGBp2D7Jq0+XhUnZzZqjY1ZghOU6okvi2C975immqSVlzNbYIRXCUJeLveN/rsWcKd/XP98Ce+0VZnKLLnAL7Viikei5BqHc62mGK/m180tdqQQKEkL6FJ1jVEj++7G32Dq7pHqsnvDbDiM93+XlM1uC9VeWHiOTa3jkTQZjlOAeWMw32yK8ccPddLODBt8FMak5CSVLr+DivJJ1oS9lbXQFdq2Pe5ej9WndrW94xbtPPf6iRolCBiG5NRuNjjjsqxYbX4CPQM9/jvdwI/Bm10ExNCOIe9lrLriQe8ifmOiWrkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8OvRfyVhli0bcLxrthp3yjTXWmtYvRYLiQN9FnBkjsc=;
 b=kik9Idz5+BQs4xYFhp/yNh6ROhf1TFt2WURjX/hnvRBN4zv23ZiojZKxeYV4SrXCF3dpYMYyHQ8dtcUygyCLbhqFbcMtdeP3YvGqkYlakg+IhTk087Lod27w2xrpWaH3qNKdV7GS45ir1vOyJGPpkOTnHcHZeVjC2wy0brGNveua6tsmhCA1Y20ZsdMrw0rUhf+zfN9G71XgfVSOw0U6mBim4jsKqnhBwdH2dI+jVOw4oGb6RXJfflvCeNnqvRyzC8J5yNrdMh7Fj69cPPGFOCV5vElJyu58uwf+Iu5+erOjHaPKcpMxi8YmqduDcumNoZ9wY9GwlAMzmKEyVGdCNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB4831.namprd11.prod.outlook.com (2603:10b6:a03:2d2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 06:46:49 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 06:46:49 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 01/16] drm/gpuvm: convert WARN() to drm_WARN() variants
Date: Fri, 8 Dec 2023 01:46:28 -0500
Message-ID: <20231208064643.877688-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231208064643.877688-1-rodrigo.vivi@intel.com>
References: <20231208064643.877688-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR21CA0001.namprd21.prod.outlook.com
 (2603:10b6:a03:114::11) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB4831:EE_
X-MS-Office365-Filtering-Correlation-Id: a355c7a8-874f-40a9-3ed9-08dbf7b973d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0mXztKQjZH4nsIVOv38HeWn0Gau/BGAm5ZVaUjRBvtX1SCKNpxJnMtJzD1Y/e3Ofa3AQFnQXKz/JoM0t211TRdgzGy+9k2CGfdLESFkvg8v0GlYPdFZtiulTu/jF6FK8pS3s9/g2hFHfoG/Iyzl0SEHsDB5OxkvbCvOjD4R0rES0MHd/huHz35I6RFTtqVk07rqzA0V3Ks4P4T53qrQcIj7urIoKEt8y5x5aTJwqsK6TG3R+5qhC2t+AJC8gV73MjIiZvj4dHXDgnxrFiXR/1kxiREn/HYaDszDnxu3V8JOZsarkRdqb1/4sx5M8jmb9kdEMO/AMlw4QzJyL09LouovtiskvCbHKQRDx+bkOLRmKaX0iFSrPmTm9QLjgzbksS1JvVjlkWemfkiR4Wq+xhHpiBUTkW+93kQxif8m4/dwCdhk/NWKGSv7cbx0UTg3uiRrR4j8OkBNhevVuW9jKe8laqwQd5+VEXl9P9WxJ41kpwuGltJMopfkoS2oCwz3uZaYhetQyK7zPfl++eXqYAh/WFok+l6Q4JJaRKgUCxn0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(366004)(39860400002)(136003)(376002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(5660300002)(2906002)(8936002)(8676002)(36756003)(86362001)(44832011)(41300700001)(82960400001)(83380400001)(6512007)(26005)(2616005)(1076003)(66946007)(66476007)(66556008)(316002)(38100700002)(6666004)(6506007)(966005)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEllOEhhTmlTSVpIUzZBWDJLdElJZmNLQUdFQW1tdk9BenlveEpFVlIvVXZB?=
 =?utf-8?B?OVYzNkVTUnU1WFJXeGpnRWVqTll1UDdCZGlLcVJraEJzSVJPZ3VoNEdtTzZ4?=
 =?utf-8?B?RnBCOVh3UFc4eVdxRHkvMVhEdEJ2YUp1YnNGSW1zbW5SVVg1OFN3Y2pIU2Zn?=
 =?utf-8?B?dElqV0JNQ0FJMHFRaEtxZEZYbERKY0VsNDBhUHNMbHUwNXBiclg0NWRqK0lV?=
 =?utf-8?B?NFdOMjNlUjNwZENESHJmQ0NJRE9Eb2RIQWk1M1NsMGUvSTYvanRFL21lMEp5?=
 =?utf-8?B?eDMvTFcwdVltRGxteGVHWGJyeGxsbjZPMFpkSnRIOUN5Ylg3ZFc5SDhGcWo4?=
 =?utf-8?B?Mlh0Y2l2RHdicGVpS3pSSUR0UlB5MDVGc1J2ZFdYcEswQVduTFJNb0ZSWndj?=
 =?utf-8?B?T3FOcTY3MVlTanV3MDdBVzNtUEl0RGNqV0ZBNDI1cjMvWmEyUjVzR0MyMnE3?=
 =?utf-8?B?WWdyNjI4VG9IbXpoNEc2R0VOVkVtYys2Z0Jtd21tdkdPQis4cUhsUVB0OGVa?=
 =?utf-8?B?bVVBTE5uOUNpRmY2b1FvVlJiNmNPbUZGV0Q5ZGhJR0RGbEVqN2NKcjA1dHJY?=
 =?utf-8?B?TGRjZjJLUlMrYTRSZndha2I5NUFzVkpWSTN6NmFCQ1NoSXhkRFNGdmQ4UVFX?=
 =?utf-8?B?Tm1hdndtZkI0dFh1NFAwbVN6eVZGY1BzVmUvTG52Rmo0ZTFMejNLNW1HTFd1?=
 =?utf-8?B?amFaNFVqUm9LbzhNaUJ4VlFNK1gwQUdaTTBPSGpEVmRheDdQdWtMWklMUnJ1?=
 =?utf-8?B?Q2huVWg2bW5ZRXVqRDR3MTVVOU1rdXpXRVJZRDI4aVBTaWphUUNuSHBGVnlB?=
 =?utf-8?B?U25kdk1HTUZDWXlqUGx5dWZaOE5kMmdJVGZyczlDU3kzY3Q5MmthSW5qSGFE?=
 =?utf-8?B?eGpFSVQ0dWcrdlJNeE16SWhVMHFNTWdkbmRnNjk5eUZyTHlDdzRVWjkybHNF?=
 =?utf-8?B?RjdUV0NoRERRM0RMMHFUTGkwU3RjQS80NkRUczFBcmpCL3B1cjl3NzJtbSsw?=
 =?utf-8?B?WlR4L0l5R3lCdXZ1TW1Mc3MxdzhJOXhCRzJQbWN1bzlLUGhiNjI5eWd6UUky?=
 =?utf-8?B?d1V1SXdHK0JRL1NWUmFnbEgrNmFidlNjYzlhZHBuSDBBeEQwQmptU1BCdlNR?=
 =?utf-8?B?VGt1Z0x6MkRCUlJXOEh6L2VFNUljMFRLQ05iZXVqUHp6YU1TNmVCd3JRSVU0?=
 =?utf-8?B?djVsKysybTZWVVlXV0hJSDRqbTM4RlZvVUlkNFcxNWlXeFU1NC9XRGRrU21o?=
 =?utf-8?B?QlcrWVpMZFp6b25Sd3JEZVdTcFRuNFE3TmdvRWpYZ3lmTVF5d3FTUXFXZFow?=
 =?utf-8?B?Q09ZRURyTkVzY0pmSGtLM0djWkswdUtoTm5TM2Z0eDJSYjQyRTc3NjhDYmRx?=
 =?utf-8?B?Zk96djRQYUVTZVhZU29YcG95N09RdDVRZ1gwZkkvbExycnlJdy9RWUJyc2pw?=
 =?utf-8?B?dy9WSHliaHlBK2xuU2t1dGxna3YxMzFtcUE3R0pianA3cVhSb1JOUm5naFNB?=
 =?utf-8?B?RURlODV0c2wxMm84RDNWcXVEVE9KS2dubzlPQW45eFVwUjI1Umx6eTlKcHN4?=
 =?utf-8?B?QU9lK0xSdnRNRmc2NitRSGN3dmlzQUxLUlhxTEhNMGduR1JEcHdUUE5OZGti?=
 =?utf-8?B?bHlJSnN6ZE1vb0JDanhiTjhiUHF1aGJQbktrdGNINGNTY051NmlLVG9WS2ht?=
 =?utf-8?B?TnZ5YlZJWUVPN0Irc0ZTNXdnVGpCaHdJZVRHRGNmTFZDelEvREJSRzZpMXVG?=
 =?utf-8?B?WU9sV3gxQWJCN210VVhlWUtHLzh5YWIvR25CeFNFMENzU0MzMDVyS0N2Qjlw?=
 =?utf-8?B?c3N1b3lUcmxzZ1JqeG5Yek5Wa2wweUtxMFBkWlZYeE9SWSs4azdtdTRCYnNq?=
 =?utf-8?B?clB2MmUzZzlxSzAyR2FmRkpyS2dZL1EvYTBMTHFjbGNNVTFuWm1vaFBvNnly?=
 =?utf-8?B?MDZTNVgreXVGQ1BNaEFKTURSU2owZDRPbVlqd3dhZEg0SHVJcGJKNlFKUVVu?=
 =?utf-8?B?Qm4yUXEvbEZQWXNlS3hQNFUwTmZkOE1EVWgvTjJOUVJ6Qmk3MmtmMWpTTjJY?=
 =?utf-8?B?QUNyYzBqM1cvYnRMVktzRVdBWkpPZC9DWmsrWkdUcXhwYThLNk9iWTRLbXc2?=
 =?utf-8?B?cmxsRXg2Q2djQmQxc1I4cUJrWkltcFUxeWNzY1dJNlhKOUxFa1FFb3hYb0Fa?=
 =?utf-8?B?R2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a355c7a8-874f-40a9-3ed9-08dbf7b973d5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 06:46:49.0009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vSmYFVtsJ/xx4NT4ucinEcO6ORLhcSnZfPWYgSzlX/7hXgqMqTXAjBWESean1g9+Tqi7+wkWoZ4ZkVn93nITOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4831
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Danilo Krummrich <dakr@redhat.com>

Use drm_WARN() and drm_WARN_ON() variants to indicate drivers the
context the failing VM resides in.

(cherry picked from commit 546ca4d35dccaca6613766ed36ccfb2b5bd63bfe)

Acked-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231108001259.15123-2-dakr@redhat.com
---
 drivers/gpu/drm/drm_gpuvm.c            | 32 ++++++++++++++------------
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |  3 ++-
 include/drm/drm_gpuvm.h                |  7 ++++++
 3 files changed, 26 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 02ce6baacdad..b378554b81ac 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -614,12 +614,12 @@ static int __drm_gpuva_insert(struct drm_gpuvm *gpuvm,
 static void __drm_gpuva_remove(struct drm_gpuva *va);
 
 static bool
-drm_gpuvm_check_overflow(u64 addr, u64 range)
+drm_gpuvm_check_overflow(struct drm_gpuvm *gpuvm, u64 addr, u64 range)
 {
 	u64 end;
 
-	return WARN(check_add_overflow(addr, range, &end),
-		    "GPUVA address limited to %zu bytes.\n", sizeof(end));
+	return drm_WARN(gpuvm->drm, check_add_overflow(addr, range, &end),
+			"GPUVA address limited to %zu bytes.\n", sizeof(end));
 }
 
 static bool
@@ -647,7 +647,7 @@ static bool
 drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm,
 		      u64 addr, u64 range)
 {
-	return !drm_gpuvm_check_overflow(addr, range) &&
+	return !drm_gpuvm_check_overflow(gpuvm, addr, range) &&
 	       drm_gpuvm_in_mm_range(gpuvm, addr, range) &&
 	       !drm_gpuvm_in_kernel_node(gpuvm, addr, range);
 }
@@ -656,6 +656,7 @@ drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm,
  * drm_gpuvm_init() - initialize a &drm_gpuvm
  * @gpuvm: pointer to the &drm_gpuvm to initialize
  * @name: the name of the GPU VA space
+ * @drm: the &drm_device this VM resides in
  * @start_offset: the start offset of the GPU VA space
  * @range: the size of the GPU VA space
  * @reserve_offset: the start of the kernel reserved GPU VA area
@@ -668,8 +669,8 @@ drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm,
  * &name is expected to be managed by the surrounding driver structures.
  */
 void
-drm_gpuvm_init(struct drm_gpuvm *gpuvm,
-	       const char *name,
+drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
+	       struct drm_device *drm,
 	       u64 start_offset, u64 range,
 	       u64 reserve_offset, u64 reserve_range,
 	       const struct drm_gpuvm_ops *ops)
@@ -677,20 +678,20 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm,
 	gpuvm->rb.tree = RB_ROOT_CACHED;
 	INIT_LIST_HEAD(&gpuvm->rb.list);
 
-	drm_gpuvm_check_overflow(start_offset, range);
-	gpuvm->mm_start = start_offset;
-	gpuvm->mm_range = range;
-
 	gpuvm->name = name ? name : "unknown";
 	gpuvm->ops = ops;
+	gpuvm->drm = drm;
 
-	memset(&gpuvm->kernel_alloc_node, 0, sizeof(struct drm_gpuva));
+	drm_gpuvm_check_overflow(gpuvm, start_offset, range);
+	gpuvm->mm_start = start_offset;
+	gpuvm->mm_range = range;
 
+	memset(&gpuvm->kernel_alloc_node, 0, sizeof(struct drm_gpuva));
 	if (reserve_range) {
 		gpuvm->kernel_alloc_node.va.addr = reserve_offset;
 		gpuvm->kernel_alloc_node.va.range = reserve_range;
 
-		if (likely(!drm_gpuvm_check_overflow(reserve_offset,
+		if (likely(!drm_gpuvm_check_overflow(gpuvm, reserve_offset,
 						     reserve_range)))
 			__drm_gpuva_insert(gpuvm, &gpuvm->kernel_alloc_node);
 	}
@@ -712,8 +713,8 @@ drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
 	if (gpuvm->kernel_alloc_node.va.range)
 		__drm_gpuva_remove(&gpuvm->kernel_alloc_node);
 
-	WARN(!RB_EMPTY_ROOT(&gpuvm->rb.tree.rb_root),
-	     "GPUVA tree is not empty, potentially leaking memory.");
+	drm_WARN(gpuvm->drm, !RB_EMPTY_ROOT(&gpuvm->rb.tree.rb_root),
+		 "GPUVA tree is not empty, potentially leaking memory.\n");
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_destroy);
 
@@ -795,7 +796,8 @@ drm_gpuva_remove(struct drm_gpuva *va)
 	struct drm_gpuvm *gpuvm = va->vm;
 
 	if (unlikely(va == &gpuvm->kernel_alloc_node)) {
-		WARN(1, "Can't destroy kernel reserved node.\n");
+		drm_WARN(gpuvm->drm, 1,
+			 "Can't destroy kernel reserved node.\n");
 		return;
 	}
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 5cf892c50f43..aaf5d28bd587 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1808,6 +1808,7 @@ int
 nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
 		  u64 kernel_managed_addr, u64 kernel_managed_size)
 {
+	struct drm_device *drm = cli->drm->dev;
 	int ret;
 	u64 kernel_managed_end = kernel_managed_addr + kernel_managed_size;
 
@@ -1836,7 +1837,7 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
 	uvmm->kernel_managed_addr = kernel_managed_addr;
 	uvmm->kernel_managed_size = kernel_managed_size;
 
-	drm_gpuvm_init(&uvmm->base, cli->name,
+	drm_gpuvm_init(&uvmm->base, cli->name, drm,
 		       NOUVEAU_VA_SPACE_START,
 		       NOUVEAU_VA_SPACE_END,
 		       kernel_managed_addr, kernel_managed_size,
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 361fea5cb849..baa1a96c038c 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -29,6 +29,7 @@
 #include <linux/rbtree.h>
 #include <linux/types.h>
 
+#include <drm/drm_device.h>
 #include <drm/drm_gem.h>
 
 struct drm_gpuvm;
@@ -201,6 +202,11 @@ struct drm_gpuvm {
 	 */
 	const char *name;
 
+	/**
+	 * @drm: the &drm_device this VM lives in
+	 */
+	struct drm_device *drm;
+
 	/**
 	 * @mm_start: start of the VA space
 	 */
@@ -241,6 +247,7 @@ struct drm_gpuvm {
 };
 
 void drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
+		    struct drm_device *drm,
 		    u64 start_offset, u64 range,
 		    u64 reserve_offset, u64 reserve_range,
 		    const struct drm_gpuvm_ops *ops);
-- 
2.43.0

