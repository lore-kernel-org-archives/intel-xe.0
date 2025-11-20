Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4AE4CF64BB
	for <intel-xe@archiver.kernel.org>; Thu, 20 Nov 2025 07:38:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9761B10E701;
	Thu, 20 Nov 2025 07:38:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GE4g036J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4127E10E701
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Nov 2025 07:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763624334; x=1795160334; h=from:to:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=JwZrIfreN8pb8dLFMkgMYIvxo8Vj2bJX53Shtfc52t4=;
 b=GE4g036J7r2yLs2sue+HezkDFx/Y7vJO0uSh9ZNd4dbujcMe2rjS47zf
 FCvW8BXQZ8ZQJ8MiwXxaV0fxVOTX7t/scukASV4DmodI5t22cOCIfMHXD
 Zsm+/iC7/pTm8V4C6DkDSV83Sna/q3hTOVzHI3MuwYOebutk0NSwUWtxU
 Z6+S3eekZnuOPSg/MThmX2Pp4Hh4244hCsWXQcqJkSVaU4TjNwRTfGwUm
 M2EWAgNzjwhW1f5e25Kubk+gA/4F2oJpyigsxM4GqrYSz39c27tP4RHUZ
 6/Vm1joWPRwl+ky/QKvGWuys/al9n/yanZcr4prXVulzuSaT1gRmV0ONQ g==;
X-CSE-ConnectionGUID: pfxNL0rNQvOdAwvpU9heHg==
X-CSE-MsgGUID: Gz0zeBi8Q5aYGODxUX3ufg==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="77042124"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="77042124"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 23:38:54 -0800
X-CSE-ConnectionGUID: HKBdyzcTRN+Nn14FPDFWug==
X-CSE-MsgGUID: /vFNrQ+7RHKq21sl1cYO5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="191416301"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 23:38:54 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 23:38:53 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 19 Nov 2025 23:38:53 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.30) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 23:38:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p0PHmFh7yogEIwd/DUGseTG8MEPemLxbz1h9BcmywR4d37O++DP5gR7xJZ+fu5I0XGe0p2Buy3xNDVQ9Lu8hab1g0GDeOvlZIH7NnPfCYoW/C6Je4KMSSCdSB0JW+9uNrPHDLTzWWpUT6Vi8CuFOq66r7YuD4XiHMIxi8GJOCOYZiASxGJ7VOOkA9YInE29WjsEmp2hLCXRK7MuG/w1V1JE5jVdxIeZFuX6WKqx9VN2QCGLLTK1QYDrBqF3ZfjOjeGXUb7OHEzW+BJ3eF+06xk6ckF6LZuw8HJ2YI+k7+WyA/rpPSfNJrgakhiGMVJz77LTduheaFss/iKWSBwQVPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C/0xddetmrjYG8HDosHdxLsTtDFyKjJXsoTCArGJUZE=;
 b=AfFgCyDHufqs/GJO1eUFxWOo1ATgXHOkc/odUmRwbr28ErKWFySMKWcJyVLJtWnWWGQUmk38eWWUW4JP3wXj/cvXuyPeiyMz3WM7FDjE+B4zNSHE7dhH0E4xeBQ/CdfxyGNNNi5GYaLHF7yoxawIysHqYSAzK32RUjoOZRDoNkCI2GH4bd1gYAQ32N4cBqbwJehYD1YqQXly4qIVX2yHHxh6/0QdT+2FKb/3EYcXIe+4rV3bAySBVtLfMCbC6Gs8c2lPZ5J0CDf/4sXaHw0f5ObyX4w4Ws77+8mCYwdkNtc9JNZLK/KglmQn7Nu4Wa2Al2toS75o865WNMzuRlhDjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by SA1PR11MB7040.namprd11.prod.outlook.com (2603:10b6:806:2b7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 07:38:51 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 07:38:51 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH CI] drm/i915/cx0: Fix port to PLL ID mapping on BMG
Date: Thu, 20 Nov 2025 09:38:45 +0200
Message-ID: <20251120073845.1270159-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.49.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0009.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::12) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|SA1PR11MB7040:EE_
X-MS-Office365-Filtering-Correlation-Id: 09121392-896a-4aa8-aa6b-08de2807d958
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|376014|10070799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bKdyS2LsSxyWziN/t7TjeIKsW1T46brVikhojKXjyPa89FgZ0qF9U5rT6+CB?=
 =?us-ascii?Q?5QEZ2qwU+l8O66WchH2UeD2AU7m0Cu6eP5f8juv2M/OsMzZigd5D3vk75up2?=
 =?us-ascii?Q?UAUgMaOLWR7zeXS/9aw2CGiVMYxRoHGEkNzce8HJre1OlmAjf//2utQyzPcO?=
 =?us-ascii?Q?omXnSw3Fk+GAUX17gJWxPI1C2WmfLlUwS3xyeQ1sHbUl6/XlRs6SplbzZDUO?=
 =?us-ascii?Q?ELDCjEhBGrsodJTtLfHkIATtqWmsdjR4oPVkFMsYWrGcWRH0Zvt1fZ1Nzo4N?=
 =?us-ascii?Q?ER44D8thAePKs4hzacz9H0TnVyJdkxnarOY80BsIAIoU8+70w5yWOVdMCR18?=
 =?us-ascii?Q?emPrhlyvn/bOMQSdPGku8jBi0aP1mDqWzEVgMGUlFLcRDmygOTNZgK+i/CxS?=
 =?us-ascii?Q?iC7PlXqsZuBjSl+v4K2ITKSIYOlq5IhIPMb+Kfy9PRCMJO+lsY7lguEw/NEh?=
 =?us-ascii?Q?c0sopsoHyN+hrP5mOFLYl3B/2wlaYziEFEGYyEIoXJfhBUxLuLpHpscLrMRn?=
 =?us-ascii?Q?uMGzUnK5gYXePkPPtEpvKcNhBr/XH7m9gngQBcYTlvG/kKol3T8Ezqv4+3Pr?=
 =?us-ascii?Q?1GWF/V1PAkfpA0fwmvwfQdHS1F32nTILhqaepNYhNqXCS4DDvNucv22ye49f?=
 =?us-ascii?Q?yKi/mciz94XInboMQ7VSWMwH4A3WnUV4+ARwUXHnUcZnGETMy+yRXaZ4cwYn?=
 =?us-ascii?Q?O7r8vRMDs5wCc/92h5r3WPK6u+SMkju1X16PqrqVkgEgGHtLahY0qvoK3sAX?=
 =?us-ascii?Q?y98BVmozJ4nb7ErTD21kz3pUTEIv/LLcffcVWq4entiLgzAKogunEIlZdt3N?=
 =?us-ascii?Q?3N3WrzSkOJ9bKWt+QdDcOBjpXNpcsuelqgX7sYxDx2iK7p138lqnsDjMkLyp?=
 =?us-ascii?Q?YyZIzLmzZJXLDs3W2tKUQg8flv6PXvqG8nWFksqpt7PfGyF1vB0Fgppa2H8g?=
 =?us-ascii?Q?jKaqqMQb33ziYemx161Si19qk5M8y+60bziaOiOY4kD0bzHe99+5yKi6MqZI?=
 =?us-ascii?Q?NEQL/e925BTm4vHAdSgvaB2UoeOi/2I/gVqlOGGq9AGgGfOrXiAE7BnVuK2G?=
 =?us-ascii?Q?OyfbK4HnHRFOECxeJHOcQnh3hb9z/c16L1LOSf7TqExpLwQ91aIvPt0TzS2D?=
 =?us-ascii?Q?VAT8FA8A1vTilf6QvykYEG3kFlhW2Xpr9wOUlBRq2b6oTw7/ESur5ToRW3+C?=
 =?us-ascii?Q?1UOXTZWt49YCWylux94ONnMqcjtm6qcOMzmFZ0Zwy5eXpHUyc2A20O4SKzr2?=
 =?us-ascii?Q?L8XzJDKQvG4MHmDcaznTqkOvclA/1mVFJ3TEFXkErNwbXc4Icyas+R1jhvpx?=
 =?us-ascii?Q?7y5P4v3AbBDHBiVJBjhO1v3ftMrZILG3pyolRNd3Szmf58quJrpwYiZ3K1fI?=
 =?us-ascii?Q?QY8aC33ipPDa2iaE2FnkgKJN/yLPbFBc8IL6iksiCpUxI1rV592o+HVmGixz?=
 =?us-ascii?Q?Jz6LfEeO9RIqLzewabOjKDrBfVoVIsbX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mmgqZ/IlnFmg3e30iwvPII7MhOXTnqGJ8PxX1HLL3zMEAUvRi+v/ZnaJ3NZx?=
 =?us-ascii?Q?4oh913kbex8hs7rKkH/60rJkfF4DWuRZGKOKRp+aMOB/9kPXtORGMs3r0TEo?=
 =?us-ascii?Q?s2ARuEnJNfPYcQp0eI86DGIMKj3cAGB5hxcQ3+3GR58RdeLw41C6IHUJhuqk?=
 =?us-ascii?Q?ZSTTD80wVMNzkv0jqk0gnTnMyxR8/4PqQp3KzDAGf7l7hAwlEAPf2e5fx0/2?=
 =?us-ascii?Q?VBafvhakY6tBgmQtvFN3uGuUtaskhORNeP8y/JyBkmGpi/Ke2ffkyDyR6PwM?=
 =?us-ascii?Q?kiatjyoJ/VjyivanCSWmUPPsluz0KJrd7XxYKXdrz1C+7P80B1cr+IiXgsPX?=
 =?us-ascii?Q?PDqtROpPrkftmlgwHk9pHpl23M6FvSMprstQ3rq3ljPuN1bs2lqVXF0gNdo4?=
 =?us-ascii?Q?Lto83ZjefDy6AJaywKuII92pAyIXuV68lglTaYdOuvs8vCoUgHuvpGO2QxP2?=
 =?us-ascii?Q?ipVvCvoo6OfRA+bKrXaZk28QnPycJHwmdQUyMBTSAAZ/0lI3RSjD6wCNlZ/2?=
 =?us-ascii?Q?oiKgps765dMZsSdPBqe+42uY1jiDq+xRLOk1x8WEy+5FNrTETivmMsDMTT9W?=
 =?us-ascii?Q?HNauB1r2fLiagIAPyO7krkuWMJrw5/mwpItOV3J8r6u300SXGxcZ1J0zQta6?=
 =?us-ascii?Q?ZV6icjxd+jy7eWv77HRQ81BaIYDz+2ftpiERjIu8KEfRlI5MUwIVE4mdf7jc?=
 =?us-ascii?Q?Cir0NteypO5dtIMX4+9qreWCh1DW9CqkeGO91tabgQOlz1/n3B7xmuAgVhUS?=
 =?us-ascii?Q?q+9y7a4MvIgEseIPFYI1V/gP+BKKxXwZ12IikorkJwbZZ8ZKqs0N0DRaG/vT?=
 =?us-ascii?Q?Mv4IyzcljVveHhEz4XfEdT6lwXlwi45wNZbgyrgc/R1WfFSW4xYBkBWnnAlq?=
 =?us-ascii?Q?GYd3+awKOiS4RH+mpL/HVrkwT/QZmxfsAMUyd+rcywE2r9A4+WDg6GS3s47M?=
 =?us-ascii?Q?yfU8LAo7GDyAcfUE8UpNVDc7nrLmkup5WFPO1yjkHz6rUk4QGj23cRA/fakK?=
 =?us-ascii?Q?GzzOEzOw94eGDjj4TGCm7IScnhbPVqp0UB+J+PguixgIx4FkjXfC+c67Bgzu?=
 =?us-ascii?Q?IhA8yPKTKpscLfzp9ZyXlLeKRiTIWJG/SEuXdlRHBeQp2Y++li1m7O1/L/2P?=
 =?us-ascii?Q?pnQGFCUGEduyWEh9Gkd4kwCghGl4Kuutgp5XEzjHTaftWzqvWJMRODBuMIxZ?=
 =?us-ascii?Q?YKRBZvKXWpZvkBk3GWy4CQ8muZHtpzLo+q8BUJkdUIkSZe/BiyUna8RvrkkS?=
 =?us-ascii?Q?XpZIn3QvecSzBZ294GPaG53hHes0VP8wXvKTDv/X7vIB1ymIL6uGRKZvgb5R?=
 =?us-ascii?Q?a+9IpPJsQmNKVyqrVlUSnHAJrWLi/ZzTgeG3p+NmZU25uO83HIODJc7EgBj6?=
 =?us-ascii?Q?LHKXG9H81dFQjUvx7aeE6IKqfjvzyNx+mykDCmvdP7Q7UZkp5+GNm86J1N5E?=
 =?us-ascii?Q?ZuXdn1L8deElQivJIHl1sCsuk6bJLuMJM1lSRBCxnSMSzhkdTiFlfGXN2uf9?=
 =?us-ascii?Q?In/WiOKfKSa1Uqrm/+tgaRkfIrjYSbwQ2PbJfrzM9SladFbUgqyN3mu+NTXB?=
 =?us-ascii?Q?x3dZ+lSq19bYSfeftRodm/TebGyyfRyYnppWlV9Wa6mO1BvOY6M3iWbDdxNO?=
 =?us-ascii?Q?JT17HOFYeNib9mmh8LLyuEb+VRaRrTXeL8MDLQ99u9qJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 09121392-896a-4aa8-aa6b-08de2807d958
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 07:38:51.1827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dSM7yBoxxGha+JenG/k4Ay1zlGOKNqml8o72opJ+X0eK5TvH7uC6KOUGpt6CRBf0VSGukm9WBICzAvjcDFYoTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7040
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

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c      | 7 ++++---
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 9 +++++----
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 96fcad6dbb2f4..8471bdab5c62f 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -4294,9 +4294,10 @@ static void mtl_ddi_cx0_get_config(struct intel_encoder *encoder,
 }
 
 /*
- * Get the configuration for either a port using a C10 PHY PLL, or in the case of
- * the PTL port B eDP on TypeC PHY case the configuration of a port using a C20
- * PHY PLL.
+ * Get the configuration for either a port using a C10 PHY PLL, or a port using a
+ * C20 PHY PLL in the cases of:
+ * - BMG port A/B
+ * - PTL port B eDP over TypeC PHY
  */
 static void mtl_ddi_non_tc_phy_get_config(struct intel_encoder *encoder,
 					     struct intel_crtc_state *crtc_state)
diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index 6d7d5394713d6..8ae8cc7ad79d3 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -206,7 +206,7 @@ enum intel_dpll_id icl_tc_port_to_pll_id(enum tc_port tc_port)
 enum intel_dpll_id mtl_port_to_pll_id(struct intel_display *display, enum port port)
 {
 	if (port >= PORT_TC1)
-		return icl_tc_port_to_pll_id(intel_port_to_tc(display, port));
+		return icl_tc_port_to_pll_id(port - PORT_TC1 + TC_PORT_1);
 
 	switch (port) {
 	case PORT_A:
@@ -3507,9 +3507,10 @@ static int icl_get_tc_phy_dplls(struct intel_atomic_state *state,
 }
 
 /*
- * Get the PLL for either a port using a C10 PHY PLL, or in the
- * PTL port B eDP over TypeC PHY case, the PLL for a port using
- * a C20 PHY PLL.
+ * Get the PLL for either a port using a C10 PHY PLL, or for a port using a
+ * C20 PHY PLL in the cases of:
+ * - BMG port A/B
+ * - PTL port B eDP over TypeC PHY
  */
 static int mtl_get_non_tc_phy_dpll(struct intel_atomic_state *state,
 				      struct intel_crtc *crtc,
-- 
2.49.1

