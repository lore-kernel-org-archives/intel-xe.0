Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F18CC001B2
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 14:58:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89DA110E8C6;
	Thu,  9 Nov 2023 14:58:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7FC610E8C3
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 14:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699541932; x=1731077932;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ZoeDCeWUWEs/U+BNkOoJuwsZKWuOLD40UdEBIeoNiZ0=;
 b=Ep6FadMSqcDg+SXJqM3OiESfNjU6DByU1jrWpzUSDQe2P0AG7VPYM26f
 6+gpKE5zuvj49lL3oWEGyiK0rpk/gZOwUhWtoAnPCabQF1/RVaF6ey7ae
 e4bvLdjhLCrnVmZnvRzhl7MSsYgJUcygP9KHaNyGEW2HRbGzWNuMiKDOd
 HI/ivzE23TDxfzCR1XQlS9hcCupLjGitFL32jAhsGq2/d/FSWDw1GCZb7
 tROmzcJUSfhwR2ClD8SaQQ7jPB1xef6cApZIiNpZJxBKajpbOcL1+878q
 2Iuyh/+bO9znkqSHKt8NNKOiL7IgYSbZ9omkQQxzyjp42Tw5WoAD1h4Qv A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="454300291"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="454300291"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 06:54:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="756897356"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="756897356"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 06:54:31 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 06:54:30 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 06:54:30 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 06:54:30 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 06:54:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PSYhCEhvKrT01J/OCKskbwSKBZuCggOxHYiPPRLU51KL39YtCNYU7tZbkIUz2sR5+XRzBhyYZMMxVZtJ2MiwhaynIzOE4C9euLYJ2vlaeyTBUgkj3N0rTIYO6tHnJaUw2RQxs7bp7+5K4AAL6tgppB7t2S78PjGOWRysAegiJTO00f8ccuCF1g07zDMrsAjjHh9SPIKLwxnLgTPJ+fQ1w1P6/9nyQ8Ev+UcdiE0cZzJH5/PTYHg2BblRc+wPwjWHEBi2FN1H7l5CJ2IEY4xRoGlunfwpWoJOuImlAsSA28dCWqitt4kUZTMSOFsmexaiCKoZ/ROOhI8N6GVW8s8wzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q50aIfUWWdUv1CH4ZCJtHi7GasydFq+AZCWxK0qGpNE=;
 b=OihxTT7ukX776653ebmGnoqQF9023YtLGT4CkGiFe33y38sYfGbI1Dd8B2PR/xkexd7cNAPY5VI3YG4/b8oLyRdK20rL+WEWdwjzta/Mr/WHAZWpBFJjOcP0khvgdaZXGj2kmZ9MDhoZU49l6+yfNoyjwxYGsnUNqgrBCH9LihblySDJOarpoHFnBxP89REZgVLFk4aoF3F3SJku0j5rxK3yIixsAyiORbk8O/F6xW3UwgTmnVWq2YJdqQZF8bs0rhs1b2+7B/4OK3yxa8DO4jcQDNlkigdOpxENZRCWndy3DkPCF+E498xu3OJhtDZCXp3xnHm9vbH0iOBrYTiGEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB7943.namprd11.prod.outlook.com (2603:10b6:208:3fc::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Thu, 9 Nov
 2023 14:54:29 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.6977.018; Thu, 9 Nov 2023
 14:54:29 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 9 Nov 2023 09:53:27 -0500
Message-ID: <20231109145347.345120-10-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231109145347.345120-1-rodrigo.vivi@intel.com>
References: <20231109145347.345120-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0083.namprd03.prod.outlook.com
 (2603:10b6:303:b6::28) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB7943:EE_
X-MS-Office365-Filtering-Correlation-Id: f9f97974-eb67-478d-0d72-08dbe133c646
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q8k+56Jt8Cqdc3PnrTFyvtDBDZkJaLG4dmJXzyMt2RmrUI8bpXEFcHOP0LQYN/hlNCOu2nwofGOFRKC+LVMPlCTyE+7CLb58RF1Xzd1yMhdGK5De5h7NFc2QJCpTi2OHcR5ApjwZTUJGxCiRZkMTeUgEC6M3fbK6jQ62+hexNV9aOFduiJ3aHBm7OkqomsvqVeQutT3JxO0Qibubq+GQPfMLqwLSewl1oqYiqvF8RhcJe9D16TI6V372hMhSX0tSoETngss+d5ABJvdfyVvF47iGYRaznOdZYgJhKRMtBGD0SfKtdGmVCW5NwwdeDWvmjMBNUcqVuXCTsVHo93daToa/wGU8jfh+/oq009z9LfGgw+67zaPEf7rGKfDZGJ0FA8qmb2ZeiRtmujF5tbyQQ9kOLsdqz3c7u0KSbjW7I1mTEIg8nt1Zv2eJyiPEzlOJZcI161fwih99zRS9MocfuEsm1SxapSD8Mb1CiNu4qlj2jwgthgKvrkinrwho+kB3kjYyWnRKd+Wo7c7n2HRKAYJzOPHDETyPE9CsBeBo0l9ycVqm1sj0odz1Uir7z7/y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(39860400002)(346002)(136003)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(83380400001)(26005)(2906002)(82960400001)(41300700001)(8676002)(8936002)(38100700002)(478600001)(4326008)(6486002)(44832011)(86362001)(6506007)(2616005)(66556008)(66946007)(66476007)(316002)(107886003)(6916009)(4744005)(5660300002)(1076003)(6512007)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jRwdXAqlcgNV2KrsB3Szp9I4lpD6oy2rGVPIbwfdP07z2cDGhLIscddsLqni?=
 =?us-ascii?Q?hA7pRNtOmuzsy9uqh8R6SWP0apuujU1yK+5B9dht+K2uNGeUnIZwg6IdSK8m?=
 =?us-ascii?Q?tAS0c8AvAu2rzvPH0oulxsmcPRJ5Zi+GURJ5he3Ym0kNI9v8XWDnk6uhs68T?=
 =?us-ascii?Q?eROZMpwogTT3cECbn7t+1HQ5o0nmJs71HHev7NODheVmFH4Elevz+1auqhdu?=
 =?us-ascii?Q?Sh+pJQVrMvMo7Ec342xXDy8RgTEd21M9DCiPLAe2Jc+ZS08TG8v+DKGQTwyw?=
 =?us-ascii?Q?N3Ef9tLggpuxAVSwS8nMne4cNsVhOjGMvJXoy7yxMpTZoJMBQEDWi7GmpGg1?=
 =?us-ascii?Q?U5zOyJDY+fk8XcDQB+7RJ6dR0GXG3ZcSBvNzF5+UcM4CWZu3Wu9VdTFUebEU?=
 =?us-ascii?Q?dNTa+Tc3uOZJdeGEen9c09/ycZDAF/tVMoYrhWnEs9oPjQJiT2tnDcVEpzJa?=
 =?us-ascii?Q?vvBjV6qrbgFqippm0NQdYKkQ4ZjM3DUOLbEK4/BOzmcHTrHP4iHwJWZzGPR2?=
 =?us-ascii?Q?N4GHzYn7Ne634Zm4+V55qDK1qZmDDYuwfijfXwk2hvP2ebFbmnYC6PF6o8Yb?=
 =?us-ascii?Q?G9l620Qls7kjDhXkno9k7Wfbs4XVNCezW1zMYYX6dDqKefB5rvTzB3QkANbG?=
 =?us-ascii?Q?p+yvLMMdSbKrf9pTxmUDbf0996YkZaSxkw1JI+OTIcruLPkHiQSi+3I0A7Qd?=
 =?us-ascii?Q?D4WBrSe0+VxkxPGELCvlYnRqvY9D6pMJiscJKtF1/knzAR6RwbyErLIAuuBQ?=
 =?us-ascii?Q?f7vpaBPotaKWd8BUsolHBCOysMziPGMMgjilPIbW5Y4fBswXZFmrIIQ7hPeC?=
 =?us-ascii?Q?chiVdrDaoB99+sjwNI8CfBaJZeKH/b7OWoFm8rWZFWMowE6v7IwLSpVrJx+k?=
 =?us-ascii?Q?sHrykr9nPYv0uefoq2gkO3L/TJsLNKZzrQetzeR8Q8g0WWRtLextYgrz//iJ?=
 =?us-ascii?Q?GcY6OWsTqfWOhQk+o9vB4CGiZXObDPNpPBdHWfnhaNjy3L4p/DJZZXLu+y8N?=
 =?us-ascii?Q?GYRQRmy8IkdbBIEOFilRncLMd3S71QNbGVdavJXUH/ziUcIR+WIW8QlDaUlS?=
 =?us-ascii?Q?EZ4CkObp1AwPaFPYhzKTQrXyT4VEWs+5lrYbq3QQPvX8RAVh/8qrHT5lQbvu?=
 =?us-ascii?Q?YQzFynTKglLecAl6bRnc1yoVMLVzJt0GZ4w70pWFPIuKIN9IwcnfJJp+E7DG?=
 =?us-ascii?Q?7x88Vm7X6Q3V692KHZCKMluSoly7PRtgsDgfrzS99F/BJM0DJFQl2R/NuFpf?=
 =?us-ascii?Q?n1PCbWZHIO51zkFgfHsMDWkPk1YDQ8cy+vR9sxnygr0wgr9f8C5pfUaBDWWu?=
 =?us-ascii?Q?BQyIUOw85k257y+N0eA9RfKL8pXQ+qmHSwzy6NOHzW6Gjlc9oTOHDAJjMd8v?=
 =?us-ascii?Q?5BPElP27E2w22st/x0xR+8ua6cXrj2bYp9yIIDWffe4xgIEVn0rQmCpf/hBs?=
 =?us-ascii?Q?dm2Z0u3W3rMwspGJ36WXnABewGRNpnLvdcq2SIp8o/5Qj1xMOP/xf5zR+T8V?=
 =?us-ascii?Q?ZEUJ/x1mYIHGBtoU9bWVMfg1ePQTNckSdjbG9RwDM9e1GQkE1XZ5Gwggkepb?=
 =?us-ascii?Q?aomp8QDjZCxS+OgvniP0MiupxHjnK3cAE89TzgATYAk3FiIs4Oc49agSH+VL?=
 =?us-ascii?Q?aA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9f97974-eb67-478d-0d72-08dbe133c646
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 14:54:29.0046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OMqrqsCTEdNndCF/hjca3xTEiIwci82KxVhTITf8hVWRYzxuxE0c1Z8I+iR3miOMYOW7FbC4ilK07kBpgBGvsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7943
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 09/20] Revert "drm/sched: Don't store
 self-dependencies"
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This reverts commit b832c809e82fe0767f486a5707f5808602c58480.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 9337d3cf517b..506371c42745 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -699,13 +699,6 @@ int drm_sched_job_add_dependency(struct drm_sched_job *job,
 	if (!fence)
 		return 0;
 
-	/* if it's a fence from us it's guaranteed to be earlier */
-	if (fence->context == job->entity->fence_context ||
-	    fence->context == job->entity->fence_context + 1) {
-		dma_fence_put(fence);
-		return 0;
-	}
-
 	/* Deduplicate if we already depend on a fence from the same context.
 	 * This lets the size of the array of deps scale with the number of
 	 * engines involved, rather than the number of BOs.
-- 
2.41.0

