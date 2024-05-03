Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E5DC4345F
	for <intel-xe@archiver.kernel.org>; Fri,  3 May 2024 19:13:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37FB2112947;
	Fri,  3 May 2024 19:13:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U/GmL7qy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38417112947
 for <intel-xe@lists.freedesktop.org>; Fri,  3 May 2024 19:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714763610; x=1746299610;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=EvsCssEsNbyGbJX3UzktmF+MMAW88j59tzEYGPFcC38=;
 b=U/GmL7qyxha8coThl44WE4YqXh4aY+bZDPSxMCEULTWokQA/YHwsj7tU
 do8CiUfoOMu3IR70o1sAxpj+dbfaqHAKo2DCahaiQL+XgTVo65txQy6wO
 gVqhy7Bn3e+twJ//Ts9exyf7R/xtD3BBdy/4IeartzT7cF7gRWo/fsh9t
 nLf6De0zCGcbmU7XP9a9CMKWiGIQgDuxifgsLiO0Lg86W//DvfSipWGNm
 pdYBiBhgs/flQBylAsLLTjIMDCrSCLf0nYuOmhXQrkcCKI/yT1DsQZFSs
 cGIwg3YbT8YiuUKlgDur8t4CWMLwkhi+sXQDQUVBeT/61ZhBmqaiuic5+ Q==;
X-CSE-ConnectionGUID: o4r9KnyIS7q9Wqz/Clrv9g==
X-CSE-MsgGUID: kqU2gFQFT9CSDI1Fd9JG4w==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10708789"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="10708789"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 12:13:30 -0700
X-CSE-ConnectionGUID: E1v5g3xsSdemZTBCkEiFLA==
X-CSE-MsgGUID: 9vAAM2itR8Cs7ttssv3rNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="27943492"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 May 2024 12:13:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 12:13:29 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 3 May 2024 12:13:29 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 3 May 2024 12:13:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XAsvoNOoptEL++5TZSqDdMujwECZesKYRYGfXcOw8QZrbZwB9CkiLc1U4xVL0rNGq25YlibDE+GxC2XMvtqBk/wrah8GKxNeTjsLKdJYJrvZyYjfk580xNuzOCiM+dwIpNyVM4QKKmcUA8TL0wU6rzr/Q5HphW2rG2ufLyX0pwut+BYJXbbTEJdtFzLmOaxAksEWls9HJxfwzL3i6wTVw06nGvRHQyjMSj+YBkUfdW57HH8m3bZTAC73m0u3r+rznaMqJjVkNxOx92cH06aUh+WcvYVSmXyaO61F+O57UIwKk9HCTIOCqdOVICTP74u0tW550K4MMDo+zamiQuadag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=isuE1Zg1Z4hXfce5U3YLvrqridBSAnHv92SeVQnnQHA=;
 b=ls4Lek6npeo5UQwbjswJQfIs3StGqD64oCbWP39X5w01CbgvqbTVCvLMFwOCpyUyrp4VsnMl1ycVrlZMsaS/1zacd8ON9KO0/HO4wS/miglB/WmqM6eoTDjBp2dEni+u86n/NB1FV6skdsUnTbDBH8nkyolhNb7pAFe6aFMwCRwk+vPtRTbqsO9oUkXU7rNy3Y1+h9nLfjHDw6gF/RHVqgv4afN3ZAsWNc/gYFhCyPK8b778OkbtXjxKpzxL2ioSN8nDTOQjXFPJXvrpobrmMKdSJhpfGhw6UGoBWJTlEIokUsLGCXWok/3TMOT4UsfmPmIUbIKWGvPJK9sYpsOlzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB7922.namprd11.prod.outlook.com (2603:10b6:930:7b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.33; Fri, 3 May
 2024 19:13:26 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7519.031; Fri, 3 May 2024
 19:13:26 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, <matthew.brost@intel.com>,
 <francois.dugast@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <matthew.auld@intel.com>, <anshuman.gupta@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: [PATCH 3/7] drm/xe: Relax runtime pm protection during execution
Date: Fri, 3 May 2024 15:13:05 -0400
Message-ID: <20240503191309.7022-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240503191309.7022-1-rodrigo.vivi@intel.com>
References: <20240503191309.7022-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0027.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::40) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB7922:EE_
X-MS-Office365-Filtering-Correlation-Id: f41571dd-0d63-44e6-ba60-08dc6ba51be3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LwuFHXHOWV8+y1PE8pVb7tzOvkQ6I5+rYut3ecsHBvuAZfLDoTR+iTwA9hwt?=
 =?us-ascii?Q?aOlXKF/H8GHtKMxLqdV8ZcBfakIcBYER6m9dRxfPMunLhQNkDau70mtR7pHR?=
 =?us-ascii?Q?KgnvW+leGkhDQPhZGAgu+wBaFGrcvbqnIhTErfDbEQf0YXF3PNBC91B/4pBa?=
 =?us-ascii?Q?5iNkPLeNYCYYg3uBPsLx+YaGE3xFyhymGiaeOJUBiRX9W+95HooROXiw78bV?=
 =?us-ascii?Q?jUCAU7Y9OUIXk4LSvPG6QK3/9zA2r4N4QP+YARu7+XjwAjDHuFjmWUEkQ1zZ?=
 =?us-ascii?Q?TgZVR9TkHF/e0wtr+RXRkBbNG10XfoHwUDj3983vnpe0GGOhPWbj8UMwuOhB?=
 =?us-ascii?Q?fop2AUzM5whI3ZFU4Vgzt3APed+ry/XABd8poy7h3Pp7NhGOikLoqC2tOLRm?=
 =?us-ascii?Q?HcOwHrJwof1H/U5kdXed0iwG/KPqUzTEAFX9dSE/mO4hYf0QiL6uRho4POF5?=
 =?us-ascii?Q?+D1lxHR4OesrEQl2Qqu70DZ6aQplWBc3iEFXtnKlmfZT+zxWTWE5pmsWKuGm?=
 =?us-ascii?Q?IS3cTIbrSrSj0JSvPRsyFwlqq6FncMf/+6gyS8sYPeMiIFXIMVXVWqkHRidv?=
 =?us-ascii?Q?+NTwkT05livFJqASkfC5ya7e4TsiH+sFiJNuwBsrym/yDZVTCEwyXEwEvle9?=
 =?us-ascii?Q?riWUth7ONrM89njYkpdtkvk3QSQZgCwqoX9Q3VYaVFOr2t3MeiJIbl2D2OQT?=
 =?us-ascii?Q?rtVEzVvXs7gr8QRxh8JNR6NfhWpv7ctqIaG0mGzpPXv/UNAxfuZNuAV+ufdB?=
 =?us-ascii?Q?AM6z3HINznLB6yJaG8hkQx2jeaa6pKKPnan1a8qZ/CzAsxJTgOKppQ/V0q3B?=
 =?us-ascii?Q?t5hGgSi2dS2Lby7TMB4HuXnUbLMsZ+mnYVCleCZR9+fyTWsis0E6wm7BpncK?=
 =?us-ascii?Q?QHWlUP+vhxuRtRVASNjUUuar1CNOHemrcOW1JjrBRsi33yAAv3ZHHHdjLptW?=
 =?us-ascii?Q?dJgJ1HrIJ5nBL+HlUfwy9fwOQ5OHC/OBUSVAGA46gHQeKxD3ULiD0AhPFnm5?=
 =?us-ascii?Q?Fd5R57m3jbVmri6dpFK2jgPBK28ihjRF9UliqHZXJDuce/YT9LN9idKHYE3B?=
 =?us-ascii?Q?SIPCYG6pkSMPt71VDs6gDJdecVv0iwAWm8r2vxpli3LLbT6nLtSfY/sHOESM?=
 =?us-ascii?Q?zUMK8g2ZHu8lYbQ7nhU1A2ZbVHFg/PzcVtlH9ia/x3lqWloLucaRa7zBpmNe?=
 =?us-ascii?Q?J+7qyROR6R2qyZblqsLyhvcL7R+Kb774M4CUeJeqPFhGHqa/tbxHf+tk1tTQ?=
 =?us-ascii?Q?lOIdxWYJ/ZBdN3AtBzesv1dzDhD8SYZqyThnMBQw1Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hXT7Gd7mLEfEQao6ZfEaur9JK7b3tb/3LLoJAu7hnZwolH3fbg2GURRAt/cS?=
 =?us-ascii?Q?UGVCbD3ivq6xHZcTbveOqwD0PFelKtRQ9ZwkX8Yy/7LXNmKf69Wr1D/Kpwan?=
 =?us-ascii?Q?EZLwOZB4iypMzU7lr9qwVEAIacF6znjs7fYyaStMdmHyKEW2Ru6N2dlP0Vfz?=
 =?us-ascii?Q?5SoR4N46YKrIoDJvav7Z/bi3VV+DM6n/5jo34AY+D/608VX6H3larqQW9zkb?=
 =?us-ascii?Q?8U7bqZe0k1SbKiPkllOjYnz4M6tNyfDWl+XiX85SEnROkAfKZ3XmoA7OR/Fz?=
 =?us-ascii?Q?kgLRT7wq69Xn8dh4HKYEWLgeLUDMp9s7ROR0w6zA4XQxQVJ+Vddlud8WrZoP?=
 =?us-ascii?Q?IGADbKr+9mSqujGQ497gJEiKTA2h1F+jPISbkPF6L90ImUpX5ZmqT8VC17C4?=
 =?us-ascii?Q?NtFUmh0eM8XUWeqaQUnq2dmGmqm7qbarYlQZCHTsNLzwDVGWSBjIXsITn5Va?=
 =?us-ascii?Q?kSFplhPwFeRclnHM2kiGxtG2z1fZ7EPv5/iRvpi2cx2DAqyrI95Fui0IWzaH?=
 =?us-ascii?Q?RuigTRYz9TMDJuy28foTxDOMaojL2snF7un2lMkxHrqBHCM9EOIYszWWNd8F?=
 =?us-ascii?Q?D/WfcvbfRJs0N0S00Eo7nit5JtazkrcFyz9V71x7yF7tSeywGL9tMIhEXYrh?=
 =?us-ascii?Q?MnqrKws7gNOkXNQzdGHtrWrTLg6BVaJzv8BemlqLpt6Seh32+OTh20bKGu3i?=
 =?us-ascii?Q?PrSP4qlOeFz0JoxpsuI3gXZKtW7Nzt3QCVJTXUz+9hRmoQD6TZ55Cl3pWNWZ?=
 =?us-ascii?Q?0oWZcPZ0dtfIpIkXnUQU91qsQIo91LkuGcc7Ot8cUeNWJ0aRByHSptdrI0Go?=
 =?us-ascii?Q?1xs0IORvcKPassHhUwMwxguCMiN31EU7OgPwYFt+XcisvU8tr8DSVqLPs3lR?=
 =?us-ascii?Q?IluZHe6rJD/gNYt4naDkVvGiEcNKn/9dOvghVHghv7sRHwYw9wUftgCUSWfv?=
 =?us-ascii?Q?dKVRWZlUE6rhlnl7QM4cTCF+HZ3SPgO4cUQZKqX4vwZfAn4EkackuVFR48E1?=
 =?us-ascii?Q?xWG/ecRzhKM+YJlq0ZJCuCuWyZkkmemc/pA+NPUlonFqWjVbPgWsUQSwiBUH?=
 =?us-ascii?Q?rBFwmi8dy7Xi9P5bunTC17Tn4EAchapBh7//5k5TgnDG3jaIHK7gX1TVOOoJ?=
 =?us-ascii?Q?zaqmIoNwa4jFAF+myWbzZ3b3YhhQaAyhLZdyfrM1xtnPNgf2sdmC0RtQIX4t?=
 =?us-ascii?Q?6fU+Mk75uqks5GWImdOeVXtqNqdqy72eR6nKyNh4zlwRCaf17rnzLoulJWN0?=
 =?us-ascii?Q?PvT3ovm8b0GpRjG9kn3QDTHJ/FSW5Gxl3R3w94nw8JZT/jBY5rHCcCCBR9Ib?=
 =?us-ascii?Q?FsqplGXwr6kFvb5jWPuAFAvcnPZgCl0udnQiYDPzxMc+fZlO7BXuCrtMsPZo?=
 =?us-ascii?Q?mY50Is/SJRpGNHFTrmfJXd/TJgVasKid1W52xnJfx6bLJ+kwgezNVuQCWucJ?=
 =?us-ascii?Q?ZNUQxep7LGKMSfNfrkIS8vxN5jMDCLrSd8T9bO/ILfuxwUpCXugSY0jOLz+Z?=
 =?us-ascii?Q?uuN2rHBGA41d3b9M7hP3PyBhDEKr0mNtUFdopziOnrMrTIG7hzlRfkOY0Ige?=
 =?us-ascii?Q?euARBRmiuGiPz8POxeWtI5MvbobLCX2L5x6L5HDF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f41571dd-0d63-44e6-ba60-08dc6ba51be3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2024 19:13:26.3503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AO/N+XHLENChEtKa9oV6JRuY6AF+VrrbT1QsGm+9do+B540BFM8Oy/y8zYj5VsUFrYTHpXki97jhJr4A7xhf6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7922
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

In the regular use case scenario, user space will create an
exec queue, and keep it alive to reuse that until it is done
with that kind of workload.

For the regular desktop cases, it means that the exec_queue
is alive even on idle scenarios where display goes off. This
is unacceptable since this would entirely block runtime PM
indefinitely, blocking deeper Package-C state. This would be
a waste drainage of power.

So, let's limit the protection for the moments where we are
really sending jobs for execution.

This patch also introduces a protection to guc submit fini,
which is not protected anymore by the exec_queue life.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 14 --------------
 drivers/gpu/drm/xe/xe_guc_submit.c |  3 +++
 drivers/gpu/drm/xe/xe_sched_job.c  | 10 +++-------
 3 files changed, 6 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 395de93579fa..33b03605a1d1 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -106,7 +106,6 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 
 static int __xe_exec_queue_init(struct xe_exec_queue *q)
 {
-	struct xe_device *xe = gt_to_xe(q->gt);
 	int i, err;
 
 	for (i = 0; i < q->width; ++i) {
@@ -119,17 +118,6 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
 	if (err)
 		goto err_lrc;
 
-	/*
-	 * Normally the user vm holds an rpm ref to keep the device
-	 * awake, and the context holds a ref for the vm, however for
-	 * some engines we use the kernels migrate vm underneath which offers no
-	 * such rpm ref, or we lack a vm. Make sure we keep a ref here, so we
-	 * can perform GuC CT actions when needed. Caller is expected to have
-	 * already grabbed the rpm ref outside any sensitive locks.
-	 */
-	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm))
-		xe_pm_runtime_get_noresume(xe);
-
 	return 0;
 
 err_lrc:
@@ -216,8 +204,6 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
 
 	for (i = 0; i < q->width; ++i)
 		xe_lrc_finish(q->lrc + i);
-	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm))
-		xe_pm_runtime_put(gt_to_xe(q->gt));
 	__xe_exec_queue_free(q);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index d274a139010b..86baebd49c19 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -35,6 +35,7 @@
 #include "xe_macros.h"
 #include "xe_map.h"
 #include "xe_mocs.h"
+#include "xe_pm.h"
 #include "xe_ring_ops_types.h"
 #include "xe_sched_job.h"
 #include "xe_trace.h"
@@ -1071,6 +1072,7 @@ static void __guc_exec_queue_fini_async(struct work_struct *w)
 	struct xe_exec_queue *q = ge->q;
 	struct xe_guc *guc = exec_queue_to_guc(q);
 
+	xe_pm_runtime_get(guc_to_xe(guc));
 	trace_xe_exec_queue_destroy(q);
 
 	if (xe_exec_queue_is_lr(q))
@@ -1081,6 +1083,7 @@ static void __guc_exec_queue_fini_async(struct work_struct *w)
 
 	kfree(ge);
 	xe_exec_queue_fini(q);
+	xe_pm_runtime_put(guc_to_xe(guc));
 }
 
 static void guc_exec_queue_fini_async(struct xe_exec_queue *q)
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index cd8a2fba5438..a4e030f5e019 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -158,11 +158,7 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
 	for (i = 0; i < width; ++i)
 		job->batch_addr[i] = batch_addr[i];
 
-	/* All other jobs require a VM to be open which has a ref */
-	if (unlikely(q->flags & EXEC_QUEUE_FLAG_KERNEL))
-		xe_pm_runtime_get_noresume(job_to_xe(job));
-	xe_device_assert_mem_access(job_to_xe(job));
-
+	xe_pm_runtime_get_noresume(job_to_xe(job));
 	trace_xe_sched_job_create(job);
 	return job;
 
@@ -191,13 +187,13 @@ void xe_sched_job_destroy(struct kref *ref)
 {
 	struct xe_sched_job *job =
 		container_of(ref, struct xe_sched_job, refcount);
+	struct xe_device *xe = job_to_xe(job);
 
-	if (unlikely(job->q->flags & EXEC_QUEUE_FLAG_KERNEL))
-		xe_pm_runtime_put(job_to_xe(job));
 	xe_exec_queue_put(job->q);
 	dma_fence_put(job->fence);
 	drm_sched_job_cleanup(&job->drm);
 	job_free(job);
+	xe_pm_runtime_put(xe);
 }
 
 void xe_sched_job_set_error(struct xe_sched_job *job, int error)
-- 
2.44.0

