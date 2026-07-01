Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E8CC43602
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 16:03:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4482E10F032;
	Wed,  1 Jul 2026 16:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WM75xHfj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66D2110F02E;
 Wed,  1 Jul 2026 16:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782921825; x=1814457825;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=sI1PNJRsb4JYcvs/20Z/41fP52P2E2+mQRExxxPuM+4=;
 b=WM75xHfjBCZILiPe7KkmPIZvd9g8y2BP0RUv3xKt8Z/wwhruKI5N1xIM
 Mszh2OE3xPNRA47pwwrdzBv/KM+jZYrkJk1IvSaXqWPRqYWbQQH+5M3Bd
 qY7flQSbbVLu/rCrBwqfKQHqtL2sWA2XWgTG8fw1aWsde25EhnA+H9d1m
 WBE7dM40LsGXBmS4KygYVGBWb/cKscZ4WnaqUl0BJ1wURWJmOMqC86b2i
 /ur4klWsllRmptqh3F5tOxFP5UKIhECL5qp8OFEv4+bHMNqX4WHOVXbRE
 y/sK0HI+fB/+aovR/y3Ox1Zr8191NFjLSLipLnfttnMvY1hZEdSuwpWJu g==;
X-CSE-ConnectionGUID: QtDM91w3R3+Z2CN79H7gVg==
X-CSE-MsgGUID: aMjZ64hXQWi8TiM0C8Oq/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="71185412"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; d="scan'208";a="71185412"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 09:03:41 -0700
X-CSE-ConnectionGUID: DyJ8QnpZQTWJMUaJfhaq8A==
X-CSE-MsgGUID: WTvLTjCtT8K1u+pLtnAqOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; d="scan'208";a="256190123"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 09:03:40 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 1 Jul 2026 08:32:49 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 1 Jul 2026 08:32:49 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.33) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 1 Jul 2026 08:32:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HdANdPWBaZ7J7FRm6sTZNB4GqXtLgF8A7tbGnCGn4PfPCWsXxxlM/lCI9KZGygF8InP+J2q6JIQlYU2oQ33BP+qT+R0DLQvK37vOzmc7VxXUIb/SeakyRC4TGRl8w6tc9FsnO/Y4gE6Fxhzg6vc8rOu56gzlrkh/LD/xgewX0uGDxSbj9RSM7AGQQYplpqG5IJjDR+AeQO7HwrpZmOYrVTdtNEV6QpqhB4fBwzOLjMU+rm8CsAIQUL3hdo2B9MuCsY8b+WG/corOu6txTIKQr65QNaq+Cs9ksxX1trqi5J3UPaxpSIDQWqDb+UmpbBabwknIMW6ZEIhJpgbWEWr1Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jolHeK238/Q4Gjdg1O2hMvcJbxfM+0QXTwgUhxg3aWM=;
 b=wMhBvh8CGdNLJ3PyXghiKC5dacTWzVcY17/E1FfZCmEzZU+pTN7w/kLA5k3ew9iu7pSkWlmLaZzZRQhWqQmEPB3nN74pu3GMP8TWWDDaMyoCJvCZyzU/lUneHTNqcTY7wQHdED3ncXTXrcUtziTUxPW430IFSmH6Rl+cHahUfeOJdz09FXXbYMcQJDq48UAc1/Wm6vw4YE4OsU7usEGdiEY/VRur/f6RNhvzhfvF5sMIgXNMd4rvz1kHth6Qf6PjEtnFLS/QKVxOkfFJouoxUXZ8KG6+ssW0xiMGc6ahgnxdWHIkUAaF+VhpkAUlhzmHgUaj21LhXWAURAv73ojUJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9273.namprd11.prod.outlook.com (2603:10b6:208:573::17)
 by MN2PR11MB4598.namprd11.prod.outlook.com (2603:10b6:208:26f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 15:32:47 +0000
Received: from IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa]) by IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa%4]) with mapi id 15.21.0159.018; Wed, 1 Jul 2026
 15:32:47 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: [PATCH v2 08/34] drm/i915/dp_link_caps: Re-enable link configurations
 after a link reset
Date: Wed, 1 Jul 2026 18:31:37 +0300
Message-ID: <20260701153204.4124150-9-imre.deak@intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20260701153204.4124150-1-imre.deak@intel.com>
References: <20260701153204.4124150-1-imre.deak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVZP280CA0097.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:275::11) To IA3PR11MB9273.namprd11.prod.outlook.com
 (2603:10b6:208:573::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9273:EE_|MN2PR11MB4598:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f6e2f38-f533-40ee-cf99-08ded786008f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|56012099006|11063799006|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: GJvvQTWToKJnWcvBdG+fn072dAcFCYhukfXvIEbq27EGPVW0OF7RHaUS4DxUMe1XuZMgNoas+9zqbrSutYN6HKpvv4pfxBY9qVDaqgmcfSmY/3hDRXtvBLsIJVFuXQ5faq2yEk5+fli+9FyDvbX86oxibQ1pV1vyxNx7RiFUYKVPfIzVMLLqJMIvXqA1zEp/tEnv7XmEOLu86qgAQHyVoQcmuhPFgTXX2xJ5QpnyGdVkBNG3P+3JDMsLQZ7b332yuAPBQCF4ZW3jGCenK0CboxOtsvM0Q0/hUhZSdkdiaNKwUueJlXgW4fO2tz9W0URv0Q327vs1Ty/Hj72D8ZfN8VxY+U0U4RpB1Po/ogSuYZcTsVqToTsZY5klcDU+8VeO8M+p4epIY5BJaD891coU9cN02pGhpAlf3C9iykxZWbYk+DvslbSHJC5RV+J+/tem5KMRZBxY4DIr5Kvjzt97c2UdZoRnzBx570Z+f+wf62xzauwTkhLeunQVeYzuq7u72FnAdxDuXwZRTbUr0PETdmtW++4AyfeYfr68nLzjQN/Ng9E8N5Da+IdGk93PeX1HMr/F+X87okmn1j6nKY6UgYDpZNRCdGZnseCGdMwtr1okAQ4JRZQN5RanjQPMgAuDTB+VGFmu7G/3qC7cORefCKSTnlNa9IiFUR8HOmavDx4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9273.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(56012099006)(11063799006)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l2E35pHWgJjmJVfqIa8k+jpSdjvpXGnmTYiZtk+CVE6Bhm0Z+qSrWW6ilZ70?=
 =?us-ascii?Q?Ha3CBn+yi4TkXpLdeR2Sg9PuX77fUafCpqx5byqUYzPzY04DmWNcB4enm1Sn?=
 =?us-ascii?Q?KIIgvbSxyQwykuIzMIPx/7jqCXiocJLrvCjiCky+fzLHMkCF8R7rchQgDq9z?=
 =?us-ascii?Q?YOXl6XVgayIzUTmpMvXs1121waJKMomdvfZvT4adZC21W9op6IBN2qOyjYDu?=
 =?us-ascii?Q?SPpIVuOeJZQ0V8v1vQfzmoly11MjMKrhEy9tWRzHHTj0E8FCHlF35Oc3hAOz?=
 =?us-ascii?Q?zYaZ2czoDSyYtrwG/3ixe/IGMftfdIwIeegOa+JPjEvHBv89Nx1ZQa38TLPI?=
 =?us-ascii?Q?wpw/9Nd2JiLaCv5YgCPeK9Olf9yQgZM+Jcj9P5yjZ03q1fyqXJ0ovgEMG0FW?=
 =?us-ascii?Q?3ZscrvO8QHaC9jW4qHWBgy89z5GKhxng2vVcr3WH/Zkk61cgCeRO1UQiX2zE?=
 =?us-ascii?Q?M9AloewajmBie1CeD2FTOWCincYzc0vi8t7FJtwlo+dzQIqrKxKi+3k7KAvj?=
 =?us-ascii?Q?mgBZKMxd/NMDJ6rgll9WWTiPX3NRLx6F+uRrvBsR0IQB2xWBpcEqABzDMHPE?=
 =?us-ascii?Q?+S7YaQyuH4XsL6jc1hMg4JJ0hzstFGxIqtAF3bNZ5oHM+H5IK4tujwCrILR9?=
 =?us-ascii?Q?hULqsbBunjtMoCsGb75Zgd3qOEpXuxpGsahKXBRzrQsMP48EO5EaJQXuTlcu?=
 =?us-ascii?Q?+KggJKYbmnpwq4JLjNe2D6MCBzlebsXbRE53Xq+IIqnyWQP86y9xEfZ2ajiK?=
 =?us-ascii?Q?+VLxb3qyvyPT3m10JQnY2fJ6W+QPISq2oKTQFogKMPAHqwZ1bZVfytow5lL2?=
 =?us-ascii?Q?J4oG3hCtG4FDJ2iiEobLB+s6cAg0xwxW1FqRylxn4o/GXC5NGXgHGMit6/TV?=
 =?us-ascii?Q?zor5veghjzuty4W6wuOp5t5GtBWs5CdS4Nq/lV0lA856SDMdIvNqgTQ8ITe9?=
 =?us-ascii?Q?bjKYFOjPmrmQObf6I6cmO4abC//U+qorJKtWQYwl64WcyIqn4mLdVY0NEUQ/?=
 =?us-ascii?Q?mHtvP+/Q+Jra1d4xBgZC1HlAdx+LmLcIIEGLDm4T+wA+2+f2y/hjeU8B7yoB?=
 =?us-ascii?Q?9S4pgIEV6BVaGoea8n1llSlTnxpLXbT4yV/A+92Z39ezZKqKCfCKWAVCB5Bi?=
 =?us-ascii?Q?UzZl2iXDWT8ZJaIyczS2Z6w8Vs+P5eXwCjiygJ4l2Q3yGXw/cqg3p677At0Y?=
 =?us-ascii?Q?Y5wMCwEtNhm/eMuhOVi725q31NkwZrXG2kDbJU9qQoU82cq2WSW7EQEofYkM?=
 =?us-ascii?Q?qKBKa8NunN6xlpigxgAYjQf1buHBiT9nRPgM1N9bDeIZPtcZc48QFynwlRFU?=
 =?us-ascii?Q?eJJP5ulFVri+Kiito/ebrvdNfIG+2+UoM3iGXtyfqvn5wxcvZfNeN4OLnfgN?=
 =?us-ascii?Q?eLlKZVjmttDOqGUhUzKWPO80EWcxh3/fV0a+3zQ97LrdSc5OntKpTapl6Bgn?=
 =?us-ascii?Q?94+Rd1STya4tMZ3Z5i11MeU2Be+feBkXenP7dNFgoXLEsrH2lWLSFtfGw/4y?=
 =?us-ascii?Q?yHdoAg9pbY9g6tEhF4S5FmQwYTTFcT7HWgmRpSAzg0KgisPj3J9KfShKZEqP?=
 =?us-ascii?Q?9aWaCF8Ow0M/lFNeI854umTQvZplkF42ddtzVp99MIA2NecJzytU0m/iPJNk?=
 =?us-ascii?Q?/2Gb9guNroUFtzKjvLtXF433EuwNoF+2/SUM0gA2T/BHcNWFVXyKj/ZMgOsn?=
 =?us-ascii?Q?sFv/CZH5wUsxlfm3dWIjP2891eNRW+Jm/JknVBk+MRpO19j7rfQAn9X6HyKL?=
 =?us-ascii?Q?la+gEE8q7g=3D=3D?=
X-Exchange-RoutingPolicyChecked: E3iamrUMNkzmBw0sqU/JJhGeNCGlBp/bw8X1UDzh78uUa1f11EIWpWn41V3wd3qFS6nGW4uD6b/1VMYaK1TIpt0n3Ma17Q2nkxPJQA2q/vtgJc7EEAWoOH0Ht4TvTr+PHdRMo9jkiR2amttgaPdAGQ4PzGM45s7mCN+DS79SiBufVnhESM3mHgPhpjZ+bsSEXd8L2nVvzgY3KAQg7OmKvzTlMjrsIzmFcJRgvG1Zc1+LNl8mzIJcg1iTzB68VKyNaWT/Mjmck63qcHGXULfC5CAFWXTapyn5z5oUTWAyqOuWjCJ2CZRB/+gGoLsKxmiybHd1E/nOEzo/nAtD7sR5CA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f6e2f38-f533-40ee-cf99-08ded786008f
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9273.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 15:32:47.0185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sc/ruYuia1Le24Cre3GHtn3K8J5T+hD4xRApzB6wZzWymjNs3ItAGnsk4iY6f902SR7U0JLXUvej5gUma0FJyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4598
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

Re-enable link configurations after the link is reset via a call
to intel_dp_link_caps_reset(), allowing a subsequent modeset to
use all the link configurations of a sink newly connected or an already
connected sink changing its capabilities.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_link_caps.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
index 03e40e8d24fb6..667d2e55cea19 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
@@ -561,6 +561,12 @@ static void reset_max_link_limits_no_update(struct intel_dp_link_caps *link_caps
 	set_max_link_limits_no_update(link_caps, &max_link_limits);
 }
 
+static void reset_max_link_limits_reenable_all(struct intel_dp_link_caps *link_caps)
+{
+	link_caps->enabled_configs = INTEL_DP_LINK_CAPS_FILTER_ALL;
+	reset_max_link_limits_no_update(link_caps);
+}
+
 /**
  * intel_dp_link_caps_get_max_limits - get the current maximum link limits
  * @link_caps: link capabilities state
@@ -824,7 +830,7 @@ int intel_dp_link_config_index(struct intel_dp_link_caps *link_caps,
 void intel_dp_link_caps_reset(struct intel_dp_link_caps *link_caps)
 {
 	/* TODO: Update the maximum link information. */
-	reset_max_link_limits_no_update(link_caps);
+	reset_max_link_limits_reenable_all(link_caps);
 }
 
 static int i915_dp_force_link_rate_show(struct seq_file *m, void *data)
-- 
2.49.1

