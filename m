Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65351CD4857
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 16:51:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF5710E542;
	Wed,  4 Sep 2024 16:51:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bPSYRG+C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30BE410E54B
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 16:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725468686; x=1757004686;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=Dl7QiAppVAl0QZgWHWWEZynkvg0gTjsuZ2KWsAMAqcU=;
 b=bPSYRG+CCSBSmV6Nkq0igT7mUWwr51KiCkKBN2QCDshPA+dD7JTnJCX9
 uwJqj0TPR0dFrkuxfOBlkd2naq1cxIdy5wtOc+wD2vIP5UONgGBfj2VQf
 /DdCv05KRz0O6O87vlakAiaZSRILT+EWd6OD/vPpK3Rmj+DKaTcw7Je0F
 9EeUoRklR5Vxw923dLEtWHTqojMKP5xGPQrjpklXPfu4TkHnGxcU5Lc8r
 lk8tPRUzCk1Du3JOMqMwDGFeA/+Dmw0SrNgG30wDIgNrsCiN0wKMRJU4Y
 mxVHNrKpKha0Ap983gdNm3S8nZwIplAw0P9g5ig/ZyawAzyqWhNsJw6Bm A==;
X-CSE-ConnectionGUID: VGSMgpyFTtuwzn7Hl8nzTQ==
X-CSE-MsgGUID: BA8WLgOITGqIk4o+QjjMVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24257190"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="24257190"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 09:51:25 -0700
X-CSE-ConnectionGUID: aEGZlcxtR2mYU+/n8gCCJw==
X-CSE-MsgGUID: lYwfcJWDRo+9g6ARKUP4Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="96134009"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Sep 2024 09:51:24 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Sep 2024 09:51:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Sep 2024 09:51:24 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 4 Sep 2024 09:51:24 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 4 Sep 2024 09:51:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u/V1QaI9vbmTbdtViaP3Nl13jrj9nVHOslwWfbj5u2ZRtMj9CnCVtfUqBrqDPFNrBPNpVv+wVwGv6adOj0bqtK63cn+eQ2Dxg+JiS4ZxveZHzYXloAcP8do9c6a3EfmQRwJ7gAEcrja8dSkpaYlVny4hJCUZOtKSMTS+DH+5TYj+Ps7H9C1Xr/taVk8RCsKz4577g3T1GczkOF24JQlSrJd4KA5a4EYZFzXPN9xcjv8LWStfsykfP0jY86BE6xiThPEruAwGg+QfF2Ql1CTiqBNthg9OflgN9qlRId7QxwvBG+LhR3OVKFAgSzNpJKZQ3dcOX5FGLbHgxV/arLIZTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GhyfloLdzakGso6rubn7XKxOBpFcsHrqVe1HFdp0tVw=;
 b=v6Q1o9jd1ShsESPEKC8a+58CFKoZLdPrq7P8lR1vOIu5G1m2nKD6IloNQERBF/nC8I+UyRrDGenWD0T193xdTgcyO8tP/ZpJttOHg1sxmeo20aWpNuqiZFjHdi7n116PVvAAAwl3hBTgMjCE0yCQ+pJ2BNDxJdhx0hOP/qwkuOO1e6aE0B73uygYMTOEGa1L0wZaTfEjh2Bcv8q+KE2CRBpHyviAjuGtQbnOcVs2929nElkoYzsrft+lBnw958L21Pfmuk9Vj562OsPWqNCJZErBXGdw1JwVkU/u+B6L7mTko0XFxurUcW9ptpCjDw65aZCy1ugQ3wjdj2w0mhEpAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by MN2PR11MB4535.namprd11.prod.outlook.com (2603:10b6:208:24e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Wed, 4 Sep
 2024 16:51:21 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 16:51:20 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH] drm/xe: Suppress missing outer rpm protection warning
Date: Wed, 4 Sep 2024 12:51:16 -0400
Message-ID: <20240904165116.22829-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0265.namprd03.prod.outlook.com
 (2603:10b6:303:b4::30) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|MN2PR11MB4535:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e0d6cc6-4767-4ba5-127f-08dccd01cd3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/oV6Mb4ZqCWdTIdhVvIr0ZDJvUM1Xb9j3P4Zib7sJEqTzzTtjhthNfCUC3YZ?=
 =?us-ascii?Q?8hWh99V2IwVCxfAtEjup7nBLJBkWrxDqK3bq3xrige2cReLqxqOeAt0ZWJ4k?=
 =?us-ascii?Q?OtNTbyoUOgDLPvqPpmGpQ+TavdxOYJuSUKJjIS17OD5FQOYQqbB9gRnLO1Cj?=
 =?us-ascii?Q?2oYLlHO8u622FwJqRwhdaZDUWCx+Kd7RgRfxeg1bSS7n7QBbpGJLHw9lomlA?=
 =?us-ascii?Q?u5m6nTXpAGTKJG/umm7RJxlMnYw+BSeqyfhRBcaHRN4z+0Bz1yFy6q18YzHh?=
 =?us-ascii?Q?b4JJqbYxVZHOkkQN0UNlCa4OWlk3z7sCggcfYW1YnU8IH4JqBXeOsEx2NPOm?=
 =?us-ascii?Q?z9PTqpnar97zaGGAAJxeQlZuiemmKifSUbZeKBYUgKF1rOjiklfLLlV9V6X2?=
 =?us-ascii?Q?EDS3w+0K5ARihCxmJKvxUMkhj5pU+To2QfMZochGCSYj+SwDuzHdban3Ij1h?=
 =?us-ascii?Q?E3df5mcBJ3wZh/eheG1onwuDNIKuJaQ7ZnIbYrpzZePp8dx1Y2N401kkeGVj?=
 =?us-ascii?Q?bluQkUdMM0mTNVS3ViH6aslIjEaK3RW+HH3+1QxPzCtI0ctQgICN4KuSIGOm?=
 =?us-ascii?Q?Ep9KURdrDZ8S1AGOyDTGa9eLqjcQzm7O4r2r1bwBeelHFq2xlrvpxOTBAX8A?=
 =?us-ascii?Q?kAsx28mbbfBY4fT/mXZKWLrMOLfobKplHJmhoVhJj0Y2NhxXBG2p8GKe2dcv?=
 =?us-ascii?Q?kf2+5iXj8ApG126BZ+eeS+Yi6jBG+hLINPA9uWccRzi0JWGypmGbXau7t4lk?=
 =?us-ascii?Q?S3I43CWaxUJQRTqtYrC369S5CuSlluh9sBg2FaaWwP84H4nN01a0KUPP2Sq2?=
 =?us-ascii?Q?HINn0beS9oN/0tl1cZnhhwdFTIvnDESAuAawZlaxBQ7R5bE0EHz4G9mJO6iI?=
 =?us-ascii?Q?s1huWwR+SRzhLUykLE1HGL0dn/9J4fbXdecabAHOJWdU+r4B6Ma6t/5RwnKE?=
 =?us-ascii?Q?Mke3x8Qqm9+AA8I0mHs8zbWcVOEQQ8P+UJFW6P5gsmoQPdTHDOKDjHsFM7FM?=
 =?us-ascii?Q?QhVfaqIZyEpoLLKlppzPDr/nVkOTJPf1Q3Ji4SzOaZa/DT34YtT7HHtmjARM?=
 =?us-ascii?Q?bXZwZPEmrZfM+rPO+Ue+MJFxAn2LHoC2CFmtOW+pePN4z4xP3o/ghkreWzjC?=
 =?us-ascii?Q?7MJ2Vcixp55YeDF5CuiPUGebs9iMD+B1T7UpkZzRm7cEvRCoZ19WQiiVqzTh?=
 =?us-ascii?Q?wuOuQCjMckXWl0ApdIDzjNiD3RBTv6bn71P6G+55aEtEEd2vFpl0gX5H0dtV?=
 =?us-ascii?Q?GVPmBWiNHNi5S4VPsNR+Znjl08FLQTr3/eUnL0EkOw0vrjVJv48l7gpZ4lXL?=
 =?us-ascii?Q?Ut480U86SPSB+wVbch5AC3wqiDxRCbVVPk7O6Ng2Wln1OQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rt0qnInKe2UcSkE3dZ0DEfcOuQ897KRwZaoWREFNJ6inomKJZyamFUr8H4Lu?=
 =?us-ascii?Q?Gh4PjgzmwmLgejswmMS4NDP/Y/ZGeZu2KC+2Uwcc4aXSHXXQPnfk6Ba+2EI4?=
 =?us-ascii?Q?RCUPAjVt8g3HjXpeyVNDEbwEuWFlezZ+EqiAwE5kRL3z6cz6EXyAslvlqiBq?=
 =?us-ascii?Q?QoBj6IMKxFPuTTrOggo5f3uYbjUl/XiG7+Vr2LzBysfUVJVLgjz9INjzivGQ?=
 =?us-ascii?Q?V//p/rOPA4Bwp+inZ1ErgTglcXPv02K2a/VyHKh5fzWc4v2iAkNvhUkm1FLw?=
 =?us-ascii?Q?vmgcwPBHaDtPHatA5g4p+lwRyK2Aet3xX3+LnrAZugwhsHeh0zt7nb+erEgM?=
 =?us-ascii?Q?FdoW5OmaXFo4jX4DdJ1E0YjjVcIscQ/sL2vFBwLRYCzpJRdmaX+Aj2SBsLrg?=
 =?us-ascii?Q?9zAf3HS9nTZtUO7LajIXQxaoRVtb8dxEvEBl7HDHLecycJlItr/RBTOCrXN0?=
 =?us-ascii?Q?XoEl2j4DeVI3fFridGaCQZUgCFU2PFom+8dKhAszM2a7SrNPE3Peu1Tk1rPO?=
 =?us-ascii?Q?sG6gb5Hs6rZxfrXv6Bw+CR1xYfyWu3e9mDLpXGbaVyy0zWi2QaD3hNZ6P1Xj?=
 =?us-ascii?Q?3FgveXKKo47tnMxrTD33BMDbJkjekVvcrgEFkNRSf87VssJBdJnIpmB6wSgP?=
 =?us-ascii?Q?MxLY5fzONC6vnzlI507BcqMZ/ed+5Bk2+TQJ3jQxT+h6aRNNt5I0c0Nb0AQq?=
 =?us-ascii?Q?Qohv/ha3UFN2AbU6qFaQNXZlOD57QteZHw1yEVs+Xq+entH5Nd+Zj9S4+Y7n?=
 =?us-ascii?Q?vldUbMKIWNSl7LpSoyoXhmtSoVyriGQPCKQUKC+JVg/ytuYZRLQOxemWJYlA?=
 =?us-ascii?Q?hrC7YTZQaZuTdzMDxr0f49z+smdmc0GTcY3JN+Pt/vgE3tNEItX8wMIgG8xv?=
 =?us-ascii?Q?pab+pyDhRX3yzsf9JoF90qVIV6cofeTqYNvUiki3gVtQHrjV89IOwXt8IhfY?=
 =?us-ascii?Q?6xCR4LO4HAmytzu5l+oEPH9E4kb9vCOwS8OCrJpndE6UvUXVrRjf679P9I1Z?=
 =?us-ascii?Q?wRQ3H4+y8mXF0xd1uCyko0Q4C2npm+MB+VjytweVtMAv/ceUlmYyx0chfWA6?=
 =?us-ascii?Q?fYVRm+Fkue17OGVYn8dSVtc14reBnh16HfYT/udZ2JDoGtcozvEG45btOqs1?=
 =?us-ascii?Q?qasAfH/wQxYPp8v+xuivEUxB31LKylkMaG58kJzmZ5hBmd0v1r5peZtKQ8wW?=
 =?us-ascii?Q?ynPOcOVrQA5WQUnn/ooqm6cPfedF4EQU3PRrhK9gVeMtj9me3dHzQzQNy0YG?=
 =?us-ascii?Q?YXp8TvBmmifH+pFpai9fZbAHcd9VvmJeuf5dwpGsH4AtgcRwgqRnl6PyLUKM?=
 =?us-ascii?Q?SslRtb/tqRreNZy0PXSF5kPG0PuM0pOYu2zJjTsJVkOP0botN3FDtMP4rBBR?=
 =?us-ascii?Q?7ZwSHDwZKeqdtiTOqztQQbcskoOzmXk518YZml8HPOj0MLq+kLmlyHoDyXRE?=
 =?us-ascii?Q?nZnPSPD2C/AzmVzxg3XnacXKb3GoBuoGWdjVWNlm9AQHAlf31jBfNWzX8AVh?=
 =?us-ascii?Q?djO5xyDi5B4OL0h8BJ0yzfp2RL9UQJSPi1k/BcWo0R7R/MGeCsy4IaqTNpqQ?=
 =?us-ascii?Q?rn3xAeNY35v01jJ1D8eUnwmcBeJDW0c3Slhm9NI0KCn3Wyq0iIW6u+wlgFba?=
 =?us-ascii?Q?Fg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e0d6cc6-4767-4ba5-127f-08dccd01cd3a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 16:51:20.5771 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GpTXSqaRZn406XRMnxTKwV3/BGQIet9v3IWv3r5PUn7IOj7+zhpgGbOjAomOcXMMjhzyKZpIRZP5w3rCP1nHYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4535
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

Do not raise a WARN if we are likely within suspending or resuming
path. This is likely this false positive:

rpm_status:           0000:03:00.0 status=RPM_SUSPENDING
console:              xe_bo_evict_all (called from suspend)
xe_sched_job_create:  dev=0000:03:00.0, ...
xe_sched_job_exec:    dev=0000:03:00.0, ...
xe_pm_runtime_put:    dev=0000:03:00.0, ...
xe_sched_job_run:     dev=0000:03:00.0, ...
rpm_usage:            0000:03:00.0 flags-0 cnt-2  ...
rpm_usage:            0000:03:00.0 flags-0 cnt-2  ...
rpm_usage:            0000:03:00.0 flags-0 cnt-2  ...
console:              xe 0000:03:00.0: [drm] Missing outer runtime
                                                     PM protection
console:               xe_guc_ct_send+0x15/0x50 [xe]
console:               guc_exec_queue_run_job+0x1509/0x3950 [xe]
[snip]
console:               drm_sched_run_job_work+0x649/0xc20

At this point, BOs are getting evicted from VRAM with rpm
usage-counter = 2, but rpm status = SUSPENDING.

The xe->pm_callback_task won't be equal 'current' because this call is
coming from a work queue.

So, pm_runtime_get_if_active() will be called and return 0 because rpm
status != ACTIVE (but equal SUSPENDING or RESUMING).

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index da68cd689a96..352f9d593496 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -588,6 +588,18 @@ bool xe_pm_runtime_get_if_in_use(struct xe_device *xe)
 	return pm_runtime_get_if_in_use(xe->drm.dev) > 0;
 }
 
+/*
+ * Very unreliable! Should only be used to suppress the false positive case
+ * in the missing outer rpm protection warning.
+ */
+static bool xe_pm_suspending_or_resuming(struct xe_device *xe)
+{
+	struct device *dev = xe->drm.dev;
+
+	return dev->power.runtime_status == RPM_SUSPENDING ||
+		dev->power.runtime_status == RPM_RESUMING;
+}
+
 /**
  * xe_pm_runtime_get_noresume - Bump runtime PM usage counter without resuming
  * @xe: xe device instance
@@ -604,7 +616,8 @@ void xe_pm_runtime_get_noresume(struct xe_device *xe)
 
 	ref = xe_pm_runtime_get_if_in_use(xe);
 
-	if (drm_WARN(&xe->drm, !ref, "Missing outer runtime PM protection\n"))
+	if (drm_WARN(&xe->drm, !ref && !xe_pm_suspending_or_resuming(xe),
+		     "Missing outer runtime PM protection\n"))
 		pm_runtime_get_noresume(xe->drm.dev);
 }
 
-- 
2.46.0

