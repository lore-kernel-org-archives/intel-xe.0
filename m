Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 375D4C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 06:47:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4A7910E9DF;
	Fri,  8 Dec 2023 06:47:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7563310E9DF
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 06:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702018022; x=1733554022;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=3f1uK5vTLbobMwo2Yfi6Y6jaPnxJfPG/mL4vTRtEXo0=;
 b=UH7RjMF3se4Bnxp7vAsnL6oiVrUVgvv2UkQNLIa984oI4i7feIj3SEoR
 jrxegMNE01nmwhdkqCJsnCjf/CEoQOkDTvs/pLQGVE79SU+5aOJc7AkeB
 8SuMQo7jZ/wu1390L/gnhiRMw+nxVfVTlxHsys4ut6QZV4EYXSs7Y95Ct
 rxyg5lrXPkc4AN21ZY5UWsZyEQNZn5Uk+FH+fvhYKoYIOkReBVjSE6jNX
 H2Rqe5xzpBIqy+CHhKdH6k5nQ31ETRtrOcrp4mftAXrA+FvlEF5b0o2DF
 m/O/f2/AIr/MM85ILZ5cLCuy8C4uAtywZDWjgWvfCCXJKsG+waxw42vQP Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="373867334"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="373867334"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 22:46:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="838028404"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="838028404"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 22:46:57 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 22:46:56 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 22:46:56 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 22:46:56 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 22:46:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H0w9VqSnEPDyHsw2WOqjJS68RXVWO8Ch1VEoAdEONv04aIIe+yROSx+lf+Kp553reY66aOFesXp8iJVEFCG5xUUkJ5lwG1/3+SmaA0uTU//c3PUQqsqLdS2je+gTLSLLC+3QM3lcRvuPPU0LxV9awOsRvi7voXlYKejjkWg58jCDqdjG7S4gJkMbPXzEmAqrEmb8LT08XfOCrcQ8Sf9LoSbyTSHrZyPC8dweJSxO+OFcqFWKwiIySDZhacD9MBfkn17Y2FK8dy59+1COp4XyM3c+gtapHb7XxbK6m5n/jBnOfwa19yQdIL/llGEJtdZhRnGUDSZJRzfbGFfdh7M5gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FWCZxa41ddGmHJ+BA2zvpimhNlnqxtHG9kqnB3nIXw0=;
 b=LtLG0f9HZTaOk+Njt/oFsVar3MqPhEzACPiX4JLD7Z2rHVivhEdR4WqfLu2mDiB9D6QiOxiWqjKxsRnH7d4QF6VcgEbrkW9lbAzrnSVqjQDcVLWSflntnuLUCgNoAfNIxHRrGtKvlYjViOORFlJnFA5ZrkIaS1/herjpqjIjTuJ6/S3qYD5tfQVrMpDJhtlY2Ro8iw26/pSTlsN8OlIDw04pzgGslhQpt1agAEVmpebf5gABc6dfD2KfwDmFnb5a+DiiqzPG+Cn/9XkecaAH8rSfjU72fBrcGN8yZmYnNdt8GWbtIjp1Akpzqb0RgmCNHVBntfXEuqhlPGwIbhZRng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB4831.namprd11.prod.outlook.com (2603:10b6:a03:2d2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 06:46:54 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 06:46:54 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 03/16] drm/gpuvm: export drm_gpuvm_range_valid()
Date: Fri, 8 Dec 2023 01:46:30 -0500
Message-ID: <20231208064643.877688-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231208064643.877688-1-rodrigo.vivi@intel.com>
References: <20231208064643.877688-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0365.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::10) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB4831:EE_
X-MS-Office365-Filtering-Correlation-Id: 13b81d6e-981a-4151-cceb-08dbf7b97749
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kr8dw6hPWnEwgTsoMTB2q95TEPSGCT9LVzcTenEuQUHP9g5QN/SP0pFz2rZJH7BDHmk6XTwyL5oX+Kcv52/9XWU5u3gzepigAAAkLp4SD74Q6CckrJ7PGN0C32JLjWjFe0jyih55bXpKKcqibTvmDPp1+oMDsSOxPWUep2QLME/ZQJXVP2kPmrEIo/2Jy0Q3bhosLAa7zfeRS8sDVrd+00toNNDz7QfnzOvBIlk2Dr07fwkrvtYU+LSzVDaBmes9ZvPF1PvPhb+E27uXJBkba3NunmlRSdizIhLJVr7zxjfNxO+Z2QWm6xS183Vf5xOWsDHQzh08qeU+QfGIA5K3SX/9s2jM1L9p6cEhKj5VGPB0mOw8iWBBKN0trY6cbiVtNDBtGuUwTlC49I3WUV5DsJ4r9imxY7HPvU1GpafT0g7bzz5aAF88EQ0Ye96L2JbgNwhvkFWcRdQLJtXA1xieDtnV895FxWwHHo+ruYGc0qAasrbH7zSy5W4C5F04p3rA5IFp3xsZ+KXUgAL2EfIOmyHeOiB4zP9WslgWd7Hi1Dw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(366004)(39860400002)(136003)(376002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(5660300002)(2906002)(8936002)(8676002)(36756003)(86362001)(44832011)(41300700001)(82960400001)(66574015)(83380400001)(6512007)(26005)(2616005)(1076003)(66946007)(66476007)(66556008)(316002)(38100700002)(6666004)(6506007)(966005)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OS82WFgxTmZYRnEwN09tYUk3VVpEM3QvUDdMOFdMa0Q1K2R0WStGZzd3WUVX?=
 =?utf-8?B?WTlsaUZ0Mi9BOXQ0aEdONjF1TG9Ud1hMZHJVRzFxcW13blByQ2RaOTBrbUVt?=
 =?utf-8?B?ZWxJQ3MzZVZMSEcyckk5V2k5NG8vTUlpVnBRb3pkVE5rL0hwSjMwMW45OTZG?=
 =?utf-8?B?dU9QbXJCaTZ3Umo0NkJtenpBdnM3QUZsZytRME9FamRtWHozWWZ1U2ZCOVh0?=
 =?utf-8?B?ZVpvdlZTd3hLSWZ0S0J5cDQxcWtUS0liaGJkM0Vld3lsaXJ2NWhrLzQrdGhW?=
 =?utf-8?B?MmE3VExiRk5SWFhDSUxMZ2VWMEs4UzhPQXZwUVlGZ2I2UTVSeUZaMVFlbTB2?=
 =?utf-8?B?T0hDbW5lRTV3TDBzNW5nenhJZU9UcFJLMEI4TDIwUHZjb2RsLzA4cmhzZVg2?=
 =?utf-8?B?eW5QVEFVWkNSVWNleTZWSGJJSVhsRk9qSlA5d0pmUVRTdlZyV0ZkRTBsdDlT?=
 =?utf-8?B?MzNsUWJmR1B1bHU1Q2g3RWxiamM0ZFBGRlhzUGtWOUpSY21RdFBjQ0xFSm41?=
 =?utf-8?B?YkxOb3d1RHNVOW9VWTJ1djl2UmlSY2FaNC9helRYa3UwZTF3SlNHUFNnUldT?=
 =?utf-8?B?Nkp4RkhqTDU5SFdPMlhCQ3NiemhJNTRvWTFmY0NwWEYwQi9jdFcydmR4R3Bn?=
 =?utf-8?B?dnZuWEVpdVZxclRvYXREa2dWeGZhM3BKUEJSVWdYRUt3RGgzdnlnUXZZU2hW?=
 =?utf-8?B?aWZqaGNtNUhSWWp3UDRidjdXUWdxYTRKN3FzWnpFZGlXK3MycmJCYStocGNs?=
 =?utf-8?B?VDFhV3pQSW4rZWNSTzczMmdIWmlOUWo4VlRSYU9CQVBEeUFVL0o5Skticyto?=
 =?utf-8?B?VlArbzYrM1NGblpITmRxemJrVTlWWUhCUElmWld0Q3hRblBYUHp3b1IrUE56?=
 =?utf-8?B?NGtoRW9NTURNbmFTc2FJa1RjOUZtY3N4U1B6MnlXMjVGYUJQZFUwbnI4SVA2?=
 =?utf-8?B?T2Z2OTFEQ3FiVXJXdGtJVkQ0Ukhzd1NlOTFWd0VqOWlrcVZIWUhFNjROM3I5?=
 =?utf-8?B?b0xNdDRFMXh1ZlZFektNb3ZVV2plOHN3M0lMcng3elFCVWl5ckdwSzZDWFJF?=
 =?utf-8?B?VXo2VGo0RWd2aGtiby96akRPMVdmSWovOTZYeDFkVTNxL2p1anh1V1BZeU5q?=
 =?utf-8?B?RDErcUJJNHV3UDEreUk5ZzdWSlkrcEs0Rms2UEdhTFpUZE5IQXRZVkRsWmNr?=
 =?utf-8?B?c1U5cEdURXNCdWFZUVRnMTJJYktGM05pa2g5bk0xVVZ5Zy9VMEJNeWhrTkFs?=
 =?utf-8?B?LzJGcDJlTG1SNTlCRnpqaHZNNWJZTU5IUko1WUIrbHZ5MjJLNXpQclozWDFD?=
 =?utf-8?B?eWY1WGdiN2dHNHRTZWV5QXRWeFpWZEI4aE5IdUtvdXlQelM1T2RDMVZ4dmdU?=
 =?utf-8?B?MXVyeE9ZdEx3dElwOEZjR3Y2Ymh6STlnbGxKMUsrVHcvTXQwaEtiN1RxUkR4?=
 =?utf-8?B?Sy9taUw3aEEwL3VrUnM2Q0N4ZGYzWEwySXRjeU53ODBSbWlRcU9PS0pOc1Z0?=
 =?utf-8?B?ZFRUYjE2Y3ByY042eFJJUVN3YUpEN0E0b3dzandiSU0vL0NBNlRycFBLU0xq?=
 =?utf-8?B?dWFEaUZJdDNUYWVrbHhOWmxrNkhicCtESjdyaUNCa0VRa3lLODFNS0d3US9Q?=
 =?utf-8?B?TjNRVldWeVF4TVNxWmU1OWlWRnYrbW9SUG11azhUWnRpM1EyK0d6NXNRaGJv?=
 =?utf-8?B?eERuMmxJNXFIeXFremQ3Z0ZCMi9PanVMcW9SUjlIMHBhRXMyWTlSVWtVcjB3?=
 =?utf-8?B?S3dXL1FTNFIrNStBcjhtb0V5OU9FMTZtMER6Q2swSGxUMFJJTGZVblNlT0Z4?=
 =?utf-8?B?V3VxYTZLMVI3ckxpeWJVODJodEIrUDJDSXJFS2VwdHJ3TCtyOXBISG5JczJF?=
 =?utf-8?B?RG85b1NPaklNTEFQTTBkR1oyU1J3eVNBVnpCVFdQUDltbUM3SUd5Z2hHRXRn?=
 =?utf-8?B?Z1dnL1JXWWl4Yjh6ZW40eU1qUGJaYjdwWjNPOUI2dVJocVIxN1EyYW03RW5y?=
 =?utf-8?B?SE5hMjk4akVpZG5ua1F4SkxaWDErVmlCUnRFT2k2UHlRT0ZoV2VpWTQ5R21Y?=
 =?utf-8?B?SE0xWHZIV1lwcXBvUDFOdWQrcFErWFNnR094alBUc1MyVWJ3LzQ0QWZiL3Qr?=
 =?utf-8?B?enhUaW8rNmFqbU5SVUcwdDF2UlU2RXVIa0dPQXBFUkpoUU9rM053ei9LTWRY?=
 =?utf-8?B?a3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13b81d6e-981a-4151-cceb-08dbf7b97749
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 06:46:54.7488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZuY2fIxJYGFbTJjiH4gnveBSJuOR7rtA7LMVhvA/snRR0YtrDS089kj135uzSo4dsy9MPs9/Bo3z8om7WxevSA==
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

Drivers may use this function to validate userspace requests in advance,
hence export it.

(cherry picked from commit 9297cfc9405bc6b60540b8b8aaf930b7e449e15a)

Acked-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231108001259.15123-4-dakr@redhat.com
---
 drivers/gpu/drm/drm_gpuvm.c | 14 +++++++++++++-
 include/drm/drm_gpuvm.h     |  1 +
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 1cbeb4169f9c..dd46d14fd3e6 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -649,7 +649,18 @@ drm_gpuvm_in_kernel_node(struct drm_gpuvm *gpuvm, u64 addr, u64 range)
 	return krange && addr < kend && kstart < end;
 }
 
-static bool
+/**
+ * drm_gpuvm_range_valid() - checks whether the given range is valid for the
+ * given &drm_gpuvm
+ * @gpuvm: the GPUVM to check the range for
+ * @addr: the base address
+ * @range: the range starting from the base address
+ *
+ * Checks whether the range is within the GPUVM's managed boundaries.
+ *
+ * Returns: true for a valid range, false otherwise
+ */
+bool
 drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm,
 		      u64 addr, u64 range)
 {
@@ -657,6 +668,7 @@ drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm,
 	       drm_gpuvm_in_mm_range(gpuvm, addr, range) &&
 	       !drm_gpuvm_in_kernel_node(gpuvm, addr, range);
 }
+EXPORT_SYMBOL_GPL(drm_gpuvm_range_valid);
 
 /**
  * drm_gpuvm_init() - initialize a &drm_gpuvm
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index baa1a96c038c..ed766dd9d96b 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -253,6 +253,7 @@ void drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
 		    const struct drm_gpuvm_ops *ops);
 void drm_gpuvm_destroy(struct drm_gpuvm *gpuvm);
 
+bool drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm, u64 addr, u64 range);
 bool drm_gpuvm_interval_empty(struct drm_gpuvm *gpuvm, u64 addr, u64 range);
 
 static inline struct drm_gpuva *
-- 
2.43.0

