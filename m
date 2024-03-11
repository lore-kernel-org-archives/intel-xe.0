Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56285C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 11 Mar 2024 19:30:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED0ED112C3B;
	Mon, 11 Mar 2024 19:29:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l6jc5NbA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A00DD112C3C
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Mar 2024 19:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710185399; x=1741721399;
 h=resent-from:resent-date:resent-message-id:resent-to:from:
 to:cc:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=ySxvZZ+cW22f2GyBxGYYq6Kb0eVtvM99yxptmTTQWFU=;
 b=l6jc5NbAkI/hexz6SLDPXx6kCjClRvX8aezU9YEs/LcafoTrdc6XF1oV
 v4xfc87dka/drdJDU1yf4gv3JgtmJYDrwADEzDdPTiZMqU05xyeSMmpF2
 vLtifZxxWAHThVyapSYdIaxH0xLSS+bySuBvy74sYvcvF5Tw7e11iiAVH
 pt3LSi+B89IUx+FRyic3gkHmmPeJR2Gs65jP2m4WswUSH72DdT+ilFOV0
 LCfW65k+wXmlAej2gcxKL8yqzy2X2kCT4TTLw8KQAZmWI8O4loSJwIMN1
 74Arb1b60pvWYuNJTHBrCrVHZItDmZKqaYo1OF3MGFQQ+lUjveO5RLlFv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4726701"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="4726701"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 12:29:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="11712229"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2024 12:29:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 12:29:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 12:29:57 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Mar 2024 12:29:57 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Mar 2024 12:29:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U6tRHOaqXdTP4BnTfkZa11wjlGnyLEr6f29DzrhKsJ0dQIGnFWte3R7J2jIboP0w3fKK8k9Wpq8g8rkLuGBzVI/zdcu9GIQiHj56OLX/cUQmN/oVrMENWIdP1Aob5FLZLJarr0EewxkwbF4I6i5m3JxXEoniRlnlz/GjUAspPLAM6sfSg3jpCYbtLICD4flG7aJMueXp27sb7s7RsqUreno/02JyXjpMQVZ3mDUDz0SZVqe9qIN0TH3pBnaByvI85Ar59eFHphSO70SJ7cuB+nnqoDM0A8Y9AxYIdXx5ncbbqsFeSdDMF11i5spFR/1c9etXrO/iQhXOkv9hPUDx9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=was4OWZ1w3G1oWq++TCMl0dY2SrQOSGQk1Ex/5rwt4A=;
 b=H4QdTenRkJZ8MWLrOpaY/Q3bKtv/XPpf0LeXKFJ4/m+GER0Vj7AHOapQMvXLtDwBH/vahwPT62nMU3jPKVIRA4G30ZNONLkzCFjgmJNYlZ0AzY6Od0zK78ub53Wu1vXZGibM1g/LzeA1XzWNk4yjp6fMSIyekRTeJJXgP0He/5pZNhAyVAg8XKubtqdc+8NAAXG9vEM+7i5Ykznv1cU4UxZcmmCRq+Ho+uw3XYumeEYYTMzBLDiB5Td94+vI5zW5G+pBKOcJ/IydQHNy5+kxocYgiPTZ/6TOnLpTlduG4MMKIacOvqvxk+8M77sWr7f0FW30v2Z3TFWm8B8eZEjFww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB4822.namprd11.prod.outlook.com (2603:10b6:510:39::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.14; Mon, 11 Mar
 2024 19:29:54 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7386.016; Mon, 11 Mar 2024
 19:29:54 +0000
Resent-From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Resent-Date: Mon, 11 Mar 2024 15:29:51 -0400
Resent-Message-ID: <Ze9br7WMXmX2t5RM@intel.com>
Resent-To: <intel-xe@lists.freedesktop.org>
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-gfx@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: [PATCH 09/11] drm/xe: Convert mem_access_if_ongoing to direct
 xe_pm_runtime_get_if_active
Date: Mon, 11 Mar 2024 15:23:01 -0400
Message-ID: <20240311192303.33961-9-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240311192303.33961-1-rodrigo.vivi@intel.com>
References: <20240311192303.33961-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0106.namprd05.prod.outlook.com
 (2603:10b6:a03:334::21) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB8253:EE_|MN0PR11MB6059:EE_|PH0PR11MB4822:EE_
X-MS-Office365-Filtering-Correlation-Id: f1bd7bd6-ee0b-46bf-1a4c-08dc4201a126
X-Microsoft-Antispam: BCL:0;
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b810e19-9a8b-47d4-de64-08dc4200bed3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 19:23:35.4846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FMpaBJnOh7f+CiizyA9edEfgRpHemxEAxhceClIcj+mQY/IlumbhO4F/cEOxcb8NNlm6x87qlJdVwbZcC0fQIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8253
X-MS-Exchange-Transport-EndToEndLatency: 00:00:01.5011085
X-MS-Exchange-Processed-By-BccFoldering: 15.20.7386.010
X-Microsoft-Antispam-Mailbox-Delivery: rwl:1; ucf:0; jmr:0; auth:0; dest:I;
 ENG:(910001)(944506478)(944626604)(920097)(815096)(255002)(410001)(930097)(140003);
X-Microsoft-Antispam-Message-Info: J1HHcJC8as7WW0SU+j9GpUkBVVZIc+NtKOnfTTPUw1J0bAWHaLMFl7/pO3USpSyGBsAzWGe9S5deLZKKvAi4OqHuevwx6xuykZ7nG84fl6sYeDdsQ7ctN4LHQlYhrCEuMH3BLAWYNP/AiK5WS0hK37nNDeDicX2qL0wA40smDuQ6N3LWPlFC7/3JguxMS9p5L1i4QOez3IPzaRLvExemgw9ilvx7Oi3O3GFSC8bzLGCXv1n586s/hYnblDaFcJ9IjE3NfhB2YxU0noAVjLhiq/OZT4XO1Ec6QbSzOR38xVKsD5QvOchfX26swGhjSSOP8Z0CtrMc6Db4Fv3Ve2W7Ast4iN2CJa3AObBxJqm6k4nSVQ2FpCK6NXkIpBhPqnwt13nYQJsbF9N3vTZ3b14K2KVmY78rJA5EJKelu5r/qN8ybq2AXOM98P21Y3QMjg09N71zqe08CpZ40oAMSkutU+hw4Gc7K5cTD0xn/xh2bx5PQZ2TY8Z1MgHECvfrEYf10ZsGWhT7HJLONqDOV8hxzKzZrL/CNGu+ycCP8GkZN/SqsRLZUTGqsk7xN3f3mVQM1s+Y0DAiKth3GG68V/U6VUCPnIf4taTxNhFQzioXHuVkVMiAZfdc/VtpTNQDbpQeWI/G1IW/ZuxsSdiukWqDoTlbZ7ZpaWZ3r57I3GXnO1s=
X-TUID: pH89LW1OlS7F
X-ClientProxiedBy: SJ0PR03CA0058.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5b810e19-9a8b-47d4-de64-08dc4200bed3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0LK+4ptg6r/IxKZqf/AJyK+I60fpWvC5tn3omKzFlgOFc0CrlY2zi51FFXal?=
 =?us-ascii?Q?iFHdQlboBJT9jrvfkwll5JKSxY8m7ktT6bnlQS4Emf9uvRSd2r6z9HcV1Ahk?=
 =?us-ascii?Q?FtYkhafmDk8daMhMJQURDz7SSLMPGkOlnXR+EGygeQr5sZ4ZDgC2AQ2Xv/Kj?=
 =?us-ascii?Q?+joXwvyCmxwYYPsi8/qy42BqLkgjKi/K4kX3BC2Qjt7rpl/P3LyUm639nqVR?=
 =?us-ascii?Q?R6DWuuc4SU3affbwMaez9ZmOGKyzfb5XwdSJJrt1/HR9N9FmkMPelkP0luf8?=
 =?us-ascii?Q?PqBwxtpNt873Swh94TASEajNNEhqP8Xln3cC6iLPaGvAbz0s61ln8Yqkji2T?=
 =?us-ascii?Q?j3KIAlnZ89QX7BOEkTehY17TUJ2bUjc7vrMJOCQFBlxRoooQpB0j8b3RFP3N?=
 =?us-ascii?Q?UdCVF+7C+2Lgy2YI1vHwbXXQANtQYVPv76W9sCa1kXiyX92HeIXttHA9pUlc?=
 =?us-ascii?Q?3rA7lqhy4DM7mTAoYd/JXETCyBI5XCs+AD+CeBjIBX1qcqX+BnxM6dbDYByC?=
 =?us-ascii?Q?YsGlz4hd8P0gUFEoDm8NnNfGlSXU1QxR0d9eHZ94GHSaPA/ZnuiC/5eSgLEa?=
 =?us-ascii?Q?3MmaNiZAmB7YnbPtw6NGX02NCrEHwMvVp9ID9V5hM4rO6JVqI6ietpi4X57L?=
 =?us-ascii?Q?872JSAjfTpa5XCW873PA/xM/aHftBSLfydNMBj7+VZ/m91HtbpjzRmZYpzci?=
 =?us-ascii?Q?iYany1klwVzxFi4OVnHj16UWBSZIT5lzc7KsvplKLrsL91JA42KHguIrpOjp?=
 =?us-ascii?Q?nXr2xfzAR+e4mao45zlgMmB5GBjpv0lvMSmCc3gPFt2qCUdDavnKe1YrFzgx?=
 =?us-ascii?Q?bbUszU3uczNX9SMV2Opg3PeDdx/+hcHhhhPY9Y4Nz+H/55lq7o7f6Dt+pgR6?=
 =?us-ascii?Q?t8DpSR2aJ5aLi82ZiXTgQzj/f1jSaQzotX4wfhi3ZcRG+Jrd7KRYhLWYEGD3?=
 =?us-ascii?Q?uby9FOrF898WpUuJTJM0idFiC1q9ZFyP6IeAudKGc+Ymp4z9PHeOKun7Hl4+?=
 =?us-ascii?Q?ytUaozHUPBVmVXoXPiC7w1jT/e2yJaE7fdAzihOI3fMpaCzBeSAy88PJcDSm?=
 =?us-ascii?Q?z8YjqUY12c2+5yG5unJP+zL8EMfHJiy052Os/w91fEsoXFZRouyqakH/GtRA?=
 =?us-ascii?Q?iqFCNwJ4X668eU6eJ2mHiGjkmzSuA+VpQRL10OpARrK+deJJpoAviO+ho5OJ?=
 =?us-ascii?Q?8rX9bu4bmmRp1IouYn072waI62i9Co46cWHW2fR7xDNjhXORe1EfcHbUwxLN?=
 =?us-ascii?Q?gH3mCOb+65br/Hxm77Aj9mNBbwxmY65shdaw1l/hgzQjtHWtfb4zSgCnoEjq?=
 =?us-ascii?Q?dP539166ToAjHwCI402GpDyoXelBDqmrkjqN3xiEFT8LDpsP2OxEI8/Ne7UL?=
 =?us-ascii?Q?l10fdwju1NkGuopJmm//Zvrd4feUqK0WFYQb5lhNYOfSVVgNrWHXfJVPBn3J?=
 =?us-ascii?Q?uXv1QYHocVjHxXXrgaRTKypLDBCppTKN45kC1hBTjBTq8gi0J+LQmbdDNNNU?=
 =?us-ascii?Q?LGB+gCCpZXlieuWjfSljHNHDugPjoDey+DdNwnN8H+y9YSP6crhggpdWXruz?=
 =?us-ascii?Q?Etaz3Mvp9cwvub2XIHVZa7wAvCD71/hW4zahwZzB6byrOfdUtyYYydo28tgN?=
 =?us-ascii?Q?5A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1bd7bd6-ee0b-46bf-1a4c-08dc4201a126
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 19:29:54.7807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8MG+JiczZKZkGBSIQ2VAGTEQ4GSt+RwtlfkU5oimVEpqicL9WeBV1Oy6o4fBVQgwrUgKZgMDW+2Nuc4kCOsLMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4822
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

Now that assert_mem_access is relying directly on the pm_runtime state
instead of the counters, there's no reason why we cannot use
the pm_runtime functions directly.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 17 -----------------
 drivers/gpu/drm/xe/xe_device.h |  1 -
 drivers/gpu/drm/xe/xe_guc_ct.c |  8 ++++----
 3 files changed, 4 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index a9128bde85c1..6c7850dd70b5 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -655,23 +655,6 @@ void xe_device_assert_mem_access(struct xe_device *xe)
 	XE_WARN_ON(xe_pm_runtime_suspended(xe));
 }
 
-bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe)
-{
-	bool active;
-
-	if (xe_pm_read_callback_task(xe) == current)
-		return true;
-
-	active = xe_pm_runtime_get_if_active(xe);
-	if (active) {
-		int ref = atomic_inc_return(&xe->mem_access.ref);
-
-		xe_assert(xe, ref != S32_MAX);
-	}
-
-	return active;
-}
-
 void xe_device_mem_access_get(struct xe_device *xe)
 {
 	int ref;
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 2327b6c0ae6a..b45592b0bf19 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -134,7 +134,6 @@ static inline struct xe_force_wake *gt_to_fw(struct xe_gt *gt)
 }
 
 void xe_device_mem_access_get(struct xe_device *xe);
-bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe);
 void xe_device_mem_access_put(struct xe_device *xe);
 
 void xe_device_assert_mem_access(struct xe_device *xe);
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 355edd4d758a..8d7b1b42b2e6 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1203,7 +1203,7 @@ void xe_guc_ct_fast_path(struct xe_guc_ct *ct)
 	bool ongoing;
 	int len;
 
-	ongoing = xe_device_mem_access_get_if_ongoing(ct_to_xe(ct));
+	ongoing = xe_pm_runtime_get_if_active(ct_to_xe(ct));
 	if (!ongoing && xe_pm_read_callback_task(ct_to_xe(ct)) == NULL)
 		return;
 
@@ -1216,7 +1216,7 @@ void xe_guc_ct_fast_path(struct xe_guc_ct *ct)
 	spin_unlock(&ct->fast_lock);
 
 	if (ongoing)
-		xe_device_mem_access_put(xe);
+		xe_pm_runtime_put(xe);
 }
 
 /* Returns less than zero on error, 0 on done, 1 on more available */
@@ -1273,7 +1273,7 @@ static void g2h_worker_func(struct work_struct *w)
 	 * responses, if the worker here is blocked on those callbacks
 	 * completing, creating a deadlock.
 	 */
-	ongoing = xe_device_mem_access_get_if_ongoing(ct_to_xe(ct));
+	ongoing = xe_pm_runtime_get_if_active(ct_to_xe(ct));
 	if (!ongoing && xe_pm_read_callback_task(ct_to_xe(ct)) == NULL)
 		return;
 
@@ -1292,7 +1292,7 @@ static void g2h_worker_func(struct work_struct *w)
 	} while (ret == 1);
 
 	if (ongoing)
-		xe_device_mem_access_put(ct_to_xe(ct));
+		xe_pm_runtime_put(ct_to_xe(ct));
 }
 
 static void guc_ctb_snapshot_capture(struct xe_device *xe, struct guc_ctb *ctb,
-- 
2.44.0

