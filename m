Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77887C4332F
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 19:13:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2052910E4F6;
	Mon, 11 Dec 2023 19:13:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A6B310E4F8
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 19:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702322022; x=1733858022;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=dlw3t5SEeJl0DP17Ejcj41usD7cC5bQGKVqdt77Tk40=;
 b=DZmNBW8WE3uUq7rXN94v4g2ugJG81lWNMT8vavM9bvVLU8sTIyfNm90z
 ynAilKnQhdfn2JYCgHuTbuoXH895agSCdffEJHZHKgmDCIxXnsXe4Vxi6
 AYP5a205tqhSCyFiS8ZFVYV070tym+Y80+iQeayu7WftcX6DBlzqnigwx
 qZWXBvhAmBKotcXC1Wlr3DmHjpdz7mqYc5VkK1+0eez/bQLsRv2tsdbbr
 GUHNDIPKDaVAVGMaIoFq8SXAa7SGgdg7oxmcHHCRRDDzzoWKS98BT7OK8
 APXcrr2oNCCzSyEVf1lsFrlxCezB7lnJOFnFMEc3K68Cj4WsRjzd2h9xf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="391866933"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="391866933"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 11:13:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1104585736"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="1104585736"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 11:13:42 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 11:13:41 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 11:13:41 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 11:13:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZRyeQtN/NFNeleSQ6M/DSqyBrJo0Tdg2LoMb6GI2YNB32BefzH3GfqvtckliCbnWqLOcrOH61SxB8tylgyGJYx2uzFYdi8Faaed+izPbDBAWmf0ztQNaX9IPBruQ7uYhA5mkfkOGRQ8qBhJVOFfibse0IWi1ixF7njwlA98WP81FbIh7HHBGUGuILinV707N+gEcgSFtlgDepEst4DS04fnpYIjU5J3gur2PN0VPOaBTtFkqVyD/UsXLREijcxVYO9gU3hNh86f4IexFRZdB7uhubDQ3K/p27kQR41kjIEwIytMaztdc7j44eVYGIlNcr2l4DIqd6S2IY7aKUOsvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wXFjbsGmBM6SECCZF2P5bONF4rOV5uefizcbuAs3VHY=;
 b=dm9ka379WVksNS7BSTPaIdifCXBulX6snO0X5TJ/SaPPbio/NHDU38XHQurjI4S3Dy8176GsTq9L4k8qclvinPE+a+Fabe73SGqgFo6N/NyEl6sa7mV/C5JqdMIwgMvLwxeJBIId0vFsprYPypofGjkwAEPQncNYxxvCT8zBmIqtzpJfp7uc/rWACOXhRDhQmArUw6g/fg1RhxMaQv7OpHDMkc9Tqv4YxizyFvwGk6xAKrS+rSJ5HnPJGN5rz41fqm49AHzOqGcsYVjnmC3pZxFp19ZzX5GnvIV7TEV4q7KnU1UOB5ykUl0r76e5/au7hHuAVIoA5V+tlI4lnhPQNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB7764.namprd11.prod.outlook.com (2603:10b6:610:145::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Mon, 11 Dec
 2023 19:13:39 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 19:13:39 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: [PATCH 09/13] drm/sched: Fix bounds limiting when given a malformed
 entity
Date: Mon, 11 Dec 2023 14:13:02 -0500
Message-ID: <20231211191306.1069362-9-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231211191306.1069362-1-rodrigo.vivi@intel.com>
References: <20231211191306.1069362-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0164.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::19) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB7764:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ea926e5-cc33-43de-88ab-08dbfa7d480d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1AwRDD2hchIGcPV1pC/y4yK75Dqv67tAZ+KfgHrCP5GNl4g8Ro2a4pj9vDWFblUxj+GSvJ4jtuRCiJKBDD8Ac8YNH6PEWP66h+pUBek8sPcmBPiah+GIIbHHnG6DqvB0lRAw/t+/D1+YCTD5IPV0ft2oPj56sGGsHpWKAnjU95efE2qNOk1hdt9yiAITNBWMQ9Z85vPvaqQqoJYLF20mOBritruTz5xuonnZfYa1B1auN9IOfQM1dj3IKzWCDxK8oaHN+ud3kqMKX1tPFcMEUSQIPNL2B8ETyu2JhigdcRRrVryiodu1dQORhXvm8Q9eNY1RLWLk48Ae7szc7eSDZowjOUvIkEVa6KOmKnfpO6B6ndserip34Ck2kV3ViIg+BHZvaWPN8GBkvhJQWLML1tbRF+SKXBOr0j+nvgk4i2/C1UZ+JLqNIFYnMPA3I9XmlihM2PNMwKY8Nnt3ylbTaH+LU7la99nqSPG2HQG2Zrbe8/ZzXt82RtkYFKGD3dHSIdAT+26T9FJc1hAL82Qb+iDUKunY9wJ57m7V7KBSWO8S5POsgsgkM1DaKlgQfl3+MU+Ok7Tmg01UGSR9Nj821g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(396003)(346002)(39860400002)(366004)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(83380400001)(2906002)(41300700001)(478600001)(82960400001)(66574015)(6486002)(66556008)(66476007)(6636002)(66946007)(966005)(316002)(38100700002)(6666004)(86362001)(8676002)(8936002)(6506007)(6512007)(44832011)(36756003)(1076003)(5660300002)(26005)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ti9WbEQ3MFNPWVV4d2dhaWtmRm5ZcUs0dzEyNmRwTGhnaituUEFyYW1UTnhz?=
 =?utf-8?B?MkFCZWx1a1VZcExkdkpNZjQ1VllHZGtQQXpVa2NXT0NtM3k4OGpMaGRLMUNN?=
 =?utf-8?B?TDhvRVdVUlFEVnlpckhOdHI4SFdrbW81MmdGYml1MTA5cXJueDM3QzJwMmMw?=
 =?utf-8?B?clFPUWRkbks3eWtxNm5heit0Nk1tMmZxNCthdlRpV0dFMmtnd0RNVUZnNUNH?=
 =?utf-8?B?VGsyaW9sSjdrKzlsaXd2Q0l4dkJuSWNCN25aK0RjSFA4SlQ3VmxMMzdjTjEz?=
 =?utf-8?B?ZUxQVjBJalhxWWpRWVBKWVN2R0Z6anduTEdQTXdzcHR1ek52eGxtVjVFSVVm?=
 =?utf-8?B?OW9vaDJKK1dFWW9QZjhpRHdaUDNCU0E1Y293QWphd0pJM29YOWlPQWtvREJI?=
 =?utf-8?B?L245L1dObDJMbXVObHl3Z2JhN2ZFa1BwN25xOGZpMFdpTXR5ZlhhbWVsdk0r?=
 =?utf-8?B?QlRXbzNWcjVmN1BiQzB4dkI5VFY5ekMxSlBOc2pIU1N6ZnNub2FpbHBVZVU0?=
 =?utf-8?B?NTFpN3JkQnVLMWs1UVVvMVZvM2xtcTRMeFI0c1lKZ2FEa2ZJZnhrTEw3T3dV?=
 =?utf-8?B?QWZvTFk0K0VJZ1dRa0RNa2s1Zk03T1JybWY1cXR3ZlJuOXd6dVphdjFBRmE1?=
 =?utf-8?B?Qy9lQVNPckR3NmZQSEYwRmYxckZ5RS9jMEQraDNmTVhFcWo5YWdjcFI5WDdW?=
 =?utf-8?B?am1IOEhyS2p6RFdDbHNOS3NTcXZiOFF2NnNmckhNMUIzZWdPbmxRdTNlNHFE?=
 =?utf-8?B?S0xtWGZtQUZUTW9FR1lmVkZpdGdhUm1kR2UzT2J4Tk85RjdqNy9NVGl0bTZH?=
 =?utf-8?B?ZDVxRnlEZXd1M2dmT2FTT3loaVVzTXZ3WnYzK0RmdCtGbzdWK2VLVXpBSUQr?=
 =?utf-8?B?aTdWUkJ2akZIVS9qVFZqblVzZUJ1SkZ3V3pmZTBOQXgzWlB5cDl1VG90bnhL?=
 =?utf-8?B?c01uSGtCVHVnNHNiVDhhaHZZN0sxakpnQVdFVnlyVHA4NjBGV0RnOVVSbjlx?=
 =?utf-8?B?dm1XUVJmZDQ0aFY4Mlgva0RqUHFrMDRhN0lVdWU4cjBxUnZQaTRBTWgvcEJL?=
 =?utf-8?B?Yk5sVkpZbzhsbjZXM0pFMmRNOU52em9aeWpzQjErVkxrUGFjQjRVTk1IYTA0?=
 =?utf-8?B?eHVvdFVHQlpydVI5Sm4ranJOSE9SU05yTVFLV3ZyaUhKTlhneGNtUmM5Tjg1?=
 =?utf-8?B?dVJYL2FNQWM0bHhaOS9mczFGWTdHQUxieEUwMmFGR01qWm5ZN0pPZGg4Z1Nm?=
 =?utf-8?B?YTcwU1VKazNnbURTUVdZMWFHZEZ0SWNldXJlZ0h3Mm9PcEZBM203akxSK1Bs?=
 =?utf-8?B?WGw1VVZIa1FoYmgvaGY2UFZrbkExNUJjNCs3NG5LQTdPQkdSZ0JkZFBSTWMy?=
 =?utf-8?B?bDM1Z3JCekY0M3M0aXJqT1dEZ0RHUld0WVEzY0tGVEhlNTh3cjlsVEgwMkJi?=
 =?utf-8?B?bmk4ZS9ZUTdERTlRVStncncrdW04TStqZTNJeFNkMWxNWHlLVGdvc01ZaUta?=
 =?utf-8?B?ZGlET1ZEWHdGK015ZDVrS3NOdzliZGpwckc5YUh3QTlibEQxeTlKMWFtZEd0?=
 =?utf-8?B?aGtVcXVYc0NQcnRoSk16eThwVDB4WEdyUWt6MnRwYTRUcDkvRnp4dHIwNjJw?=
 =?utf-8?B?V0NBZ1AyUzV5dGJ4M01kbVgxeTRYRFNabHJFemFzQjhQejQwamYxZWowUEZo?=
 =?utf-8?B?ZW9QNEJCVzVUbm9IQTN3QlRRZURvWXNtSjBtV1gvc2dLc2hTYlMvaUJKblBI?=
 =?utf-8?B?SXBjN3NaVElVcU5xd0hETEF1ZUlBczFSaWZiZU5vdi8vUFpuOTJrNkg2Y3lN?=
 =?utf-8?B?OXZhckZxSlU2T3hnNHhtMHZPYmlqT3ZSVDNZRTA3VDB4dHlxZi9wRmJ4S1o1?=
 =?utf-8?B?OXFpL1dObU1mQ1NTYlpnYmNIR0drZzlaN1NpY0R6OExhRXNsdFUzR3dKVk9W?=
 =?utf-8?B?aXp5WWtCRFladFBHMll1cFE5M01LdE5TK0hwZXlUYW14VlAzYnBpZXZvR0R0?=
 =?utf-8?B?QXFJRTVHbHZtSjlXS2tLSmZwYWNPb25LT2U0NmU1VHRYdldsaEM0WTVrTHRE?=
 =?utf-8?B?WVZnQURKVUc1UUhhcVRzSHNYU2U2RGE0NDA1a0RQNFlidWxJWjB6akdDQmRy?=
 =?utf-8?Q?rkJMRJDnPc7faF/fg4WwDqTjw?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ea926e5-cc33-43de-88ab-08dbfa7d480d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 19:13:39.2095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3HvIWw2EohzlBEnU2WxbWJUJgU5FRB+xyCQtjjASSchoxuPXagXRPb5ATlRdBR3VzKuekP9QhTfmv+Fa4hynEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7764
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

From: Luben Tuikov <ltuikov89@gmail.com>

If we're given a malformed entity in drm_sched_entity_init()--shouldn't
happen, but we verify--with out-of-bounds priority value, we set it to an
allowed value. Fix the expression which sets this limit.

(cherry picked from commit 2bbe6ab2be53858507f11f99f856846d04765ae3)

Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
Fixes: 56e449603f0ac5 ("drm/sched: Convert the GPU scheduler to variable number of run-queues")
Link: https://patchwork.freedesktop.org/patch/msgid/20231123122422.167832-2-ltuikov89@gmail.com
Reviewed-by: Christian König <christian.koenig@amd.com>
Link: https://lore.kernel.org/r/dbb91dbe-ef77-4d79-aaf9-2adb171c1d7a@amd.com
---
 drivers/gpu/drm/scheduler/sched_entity.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 4d42b1e4daa6..ee645d38e98d 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -81,12 +81,15 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 		 */
 		pr_warn("%s: called with uninitialized scheduler\n", __func__);
 	} else if (num_sched_list) {
-		/* The "priority" of an entity cannot exceed the number
-		 * of run-queues of a scheduler.
+		/* The "priority" of an entity cannot exceed the number of run-queues of a
+		 * scheduler. Protect against num_rqs being 0, by converting to signed.
 		 */
-		if (entity->priority >= sched_list[0]->num_rqs)
-			entity->priority = max_t(u32, sched_list[0]->num_rqs,
-						 DRM_SCHED_PRIORITY_MIN);
+		if (entity->priority >= sched_list[0]->num_rqs) {
+			drm_err(sched_list[0], "entity with out-of-bounds priority:%u num_rqs:%u\n",
+				entity->priority, sched_list[0]->num_rqs);
+			entity->priority = max_t(s32, (s32) sched_list[0]->num_rqs - 1,
+						 (s32) DRM_SCHED_PRIORITY_MIN);
+		}
 		entity->rq = sched_list[0]->sched_rq[entity->priority];
 	}
 
-- 
2.43.0

