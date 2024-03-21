Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C2EC54E68
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 14:29:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE92510EB2D;
	Thu, 21 Mar 2024 14:29:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cs21lTvB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B208E10EB2D
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 14:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711031366; x=1742567366;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9csHmdtl5AB8YK5Mw6cTIspEqht5B5f8tFzOTx9/Rjg=;
 b=cs21lTvBM51JEBymgoGjGeVB0ux7hHx4bbC+umtoPYZv1tW3tZBknR6H
 M3y7Uf9iKR2KFDp1BOulFkrSQtdlXW0jo+gJ5bN7cvZz8eL86YoVl7set
 8kt8PEMKEoxCmO0mbbIZXZYB5a6ziSjZhfatrn0xrlo59Jcknsn06i8oX
 AIwF4knY5Y+w9G8Hig3Dnaycy9KTzTHnV96fPgtz8EZo52VrfTRP8XGKH
 O41wSuZHyiwes+AANoxK5aqA+HOnkRHrBXCpllQuOdbepd+HfM6R68lKQ
 Fso9TBxKlYnztQXoh5wF5CWNLLVghTfXV5vXOzk3wycb8VTYoRQrolBas A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="5965860"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="5965860"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 07:29:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="15172466"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Mar 2024 07:29:25 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 07:29:24 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 07:29:24 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Mar 2024 07:29:24 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Mar 2024 07:29:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bdn7sk68RT1iWLT1SjvLBdS/2iuWClsNp3JuoaOi13kzv9YwW6LbWJ72jIsp4w9Y4Ugj8GFxN5uZ4nWnLbaSaAiuck2pKzFewUBk6l3l37xKCnd8jPE/bsTrCRh8QfiDcBhCp46e6zk++NlNd9I0lsFVTcPVQWet1d9RXDP99l9SoOmPWFyu8arNLMob/gQx8aq3aaY/tR7vcWn/xYR3JdR//VnTj+m++3JmeKZggSUh/2NDpit+q8yXfkFRMZ74fTaQRopRQL0YgGiIN1FKp3Y1rt2szT5sIETTXpihRLcNH3FYYE88+xP5L1w6NYIJAvNRxv2CcKkob2/nYVPtfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m7Y5i1V/V6/tJtDYAM7AI2VQAt56LbN+bS2pDjqgsbo=;
 b=RInhC7HNpOwBcXNtIxAUej++y8tdpJ/0IBNTVogadoVdkWLjx5GDfh/MozojZpq8aIlx67SySt200GPICFFnNkJv9x4nIvRFEwqsmA6YWm/gtYAVv0EaZS5zRu4uT1Gg2JBGgBnxDXAmnF3Lpq5N6mjx+768j6dS6SK4Ly3HTAFfPiUJCfXo53ivs9/bFZmJkO89tBLLL+16xQ4nQFGiFXRvMIwZUn55RTi5aSgPqpcynumOhRGhmoKww66m13HZoJsCg9iQiiMLFQa9AL5fe0ptjydpkGa4OdSePUjaufKisA59dz9YlkeAtxqoJ+OUcuYE/26lZn29cQb9hN3+9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB8668.namprd11.prod.outlook.com (2603:10b6:8:1b6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.12; Thu, 21 Mar
 2024 14:29:22 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7409.010; Thu, 21 Mar 2024
 14:29:22 +0000
Date: Thu, 21 Mar 2024 09:29:19 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>,
 <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe: Use FIELD_PREP for lrc descriptor
Message-ID: <qgx6ibhvazmqh3ymgi4l55hixs6tyx4yut6aoozu2erhkkq3or@y4yvbsupmu6x>
References: <20240321054715.10440-1-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240321054715.10440-1-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: BY3PR03CA0030.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB8668:EE_
X-MS-Office365-Filtering-Correlation-Id: c27c93a0-405a-4bcb-0ec5-08dc49b34d38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5l/8f12glRYeJQNyaAXrxrU8oCrtMSRLXNvVoV7YMbJuymLoiaasmhzKXf8o4CGezz/CEPQVOPa+jhuGBmPWJ97dyBOtttbbytaC5H1O4A707tzhLFc0KEfW3MZQiCBs6Y9v0eYzM5l3wpjm/o+sVyAxRscrPZG+EtWXb5nw/fa8KfUlX0EWkWbw+w83HERyTfNru0JH+cVZyL7Sj2EkNPDDDtGbLWz5fRAhAV8NoCuD/2lD4X1nK5sb3J5PdOo6IFFhjtY3/XnFKsTmRQM45PQngUvg0jyqsISn+I/u3H9NpUPJrbVFtuqh0OKGaqiQv/ukTudrZMBv4ZR0wIiqIUlGsvTUoRdXHBN5n5ZWqecMYB3yoGxhGaoU3W/+2l9pzLmUexukw138qrJ8wFBGSqphGnoTiZAg6IZQeSrd9ahK2wP3QNVF5D4wLeZxCMXSbNlxJmUm8e7eKL/cA4oAumfENE4pvJu6UAJ8fWlASHhx7SA0NnsBz6SbdQqy07NujxYytFQ23jMXyeMOScC5ggqRcASCs9cCTcu77TY3jgvshJ5Aw5kXh2Cl7uXzbFU2FwYQOVrbiCOIAs3pcW5dvVG2Mi7+HXD+64i38YXIrOt8WN0W5pDMIBMEEcEa+Q1xn6p/yIE5TaCY4u1+TDsaaCVSYaVYYssJlftIOs5gnH8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GAbQ+Hf8mFEdUIvgCrqDmcipdVMv7r5n+KVTz23DtvcjsSjmYXRpJ9jgU2r7?=
 =?us-ascii?Q?0OEVb88x52x4tS5I4zc1VaOTparkPYXsN88iZJrAJrdZwyva+xSp2npOGQ8A?=
 =?us-ascii?Q?ZLWDPnQtYYTvoEJz1Fohh6GbEB5YorRrw5klgNbFroGDwSZujuoW6Le3rbOb?=
 =?us-ascii?Q?suYBgdv7zXGQi3z2P/GCNK81nsMXmdSzfwWiQv2L5K4ilyCDGqDgo2vuLKuO?=
 =?us-ascii?Q?j2gUOr4oD0yalWy+33B3ANUHyFMjhzuVlN3jYTQbPKvhpPlvz9vj8KNFPjFm?=
 =?us-ascii?Q?IdKLwVj83HeZPgoCIJhrpRNITnyDAktHaUoeVdAs7iX7n9q78er+Bt7Aj9NQ?=
 =?us-ascii?Q?7wdCUiHzwW/vmdxWKHLI7/H9AWUAuZkGDuh0hJcYY/4/EdchaftDPsbB4VUg?=
 =?us-ascii?Q?dyiFlfNwcdonKQ9agvP05k3csLh5CSsqZuaBO0MmjiV+CoypJ2dg7208YLWs?=
 =?us-ascii?Q?rXLkW1FT1Y3mk3e0QhB02Q43U2q5UktJ31BREky5XIadF7ite24bOBxyXsWW?=
 =?us-ascii?Q?LjR3HNmH4FKiBQ/18D9Ra/xkCL9Qgv+hYcwaVUXsZMQaKiIlk3SMAazLxc1K?=
 =?us-ascii?Q?GemD6k9ji/s2locT+HNAOJaNWDUBY7kEnoQnuXJMvqYG43wsp9KiCDsE9aEg?=
 =?us-ascii?Q?FcTXju6yKkY+JclAt2jMWDJpV1txPgGnmNaCLj6o0fGwzNyiHKFLKVuvBNeR?=
 =?us-ascii?Q?HDc8l3i1jroLq+5Ck2/oJql9L4/EHv55CEwOTcFhpzB8IiQ3R2oZ13yNpPw7?=
 =?us-ascii?Q?F+Zjj4renFWBi5Qj6W1ZSoXgctO+5miT5Dms+R5BHo0QGERm+Y8UEU6+H7TI?=
 =?us-ascii?Q?WcqNxm8hkQyCcMgchXX3uYEFQe/HEmeBE39veg3ZsJxOdsF/pw6AbdzFUZJh?=
 =?us-ascii?Q?bB2Z5Ddv66H2evGxspVmFCxv76DMUca2ItlgTZOWUqgBovvtP/DBTIxAKOk8?=
 =?us-ascii?Q?mPw8SCa3BLf3Y6NLEN4t+rYsuWk/uwdnuhEqpyPGGR7V7+tZtVmcLurro7an?=
 =?us-ascii?Q?oxmBK6eee8lu9euozlHX9IMV9AUDbquCa7JsU4NB8NFdI3g2u21ta7AbT7x2?=
 =?us-ascii?Q?kN9vA/8gX2v8jowtk3qzbOaHLbG0iIpsV5RLo2ESe/Ps+kmoA3aBjmkLn6HU?=
 =?us-ascii?Q?yyeYu9yuUFBKQdBbA1HTVc3JUs5bhiZgwAwxazIZYnOSXF/DjxlZDoTbLZvb?=
 =?us-ascii?Q?z+w8V6NCDQsPqDSxt1Om6nUaVhJ9qaOYI180K1W2eiVpLzFJ59MR29BeLVEp?=
 =?us-ascii?Q?Jzs/6w1dj+X2R2/cLlb7GPFke193cjYR4z197V378uVsf29rHrPDogrLu/wL?=
 =?us-ascii?Q?NT05z7T+Ovl4GI/nWpYsZq+aqZji8A8nWxGow7NMvGZzkOdF33W1V9fFICMZ?=
 =?us-ascii?Q?2nPKZp8DaM8WHgrO5slewff4LUwncHb1LVZpLQzWSIA5j3pXD5i0VRpa3jxX?=
 =?us-ascii?Q?7YrQ90aj1QqIaVer6n061hoc5ZQGFdwNYT4Tbjmkx1jic+uYh0Q94LGru7z/?=
 =?us-ascii?Q?pxND6W1JBVtmyF5UMu6qzOT6glgS5fxlJMrJONfRNjRP6KvHzSnl7mPL9zKC?=
 =?us-ascii?Q?LLx3AAu/yGTxJuvkHZ6It91U7j35tkPAoYiH+ObLIZ9wHM0KP+k+2joSK9S0?=
 =?us-ascii?Q?aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c27c93a0-405a-4bcb-0ec5-08dc49b34d38
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 14:29:22.4981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CYNzQddATfw1xEEiFMFzIVGd0rdO7YPka3teSqCxs4GD6vZrM0zf/0qiVGDrKg6u1jvBv3jikNGLIWdOLmMUam3qTTWWqTa/8Z9L6UZn/bE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8668
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

On Wed, Mar 20, 2024 at 10:47:15PM -0700, Niranjana Vishwanathapura wrote:
>Use FIELD_PREP for setting lrc descriptor fields instead
>of shifting values to fields.
>
>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>---
> drivers/gpu/drm/xe/xe_lrc.c | 20 ++++++++++----------
> 1 file changed, 10 insertions(+), 10 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index 95e0f7b1ec3f..f07ee9d8b856 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -26,13 +26,13 @@
> #include "xe_sriov.h"
> #include "xe_vm.h"
>
>-#define LRC_VALID				(1 << 0)
>-#define LRC_PRIVILEGE				(1 << 8)
>-#define LRC_ADDRESSING_MODE_SHIFT		3
>+#define LRC_VALID				BIT(0)
>+#define LRC_PRIVILEGE				BIT(8)
>+#define LRC_ADDRESSING_MODE			GENMASK(4, 3)
> #define LRC_LEGACY_64B_CONTEXT			3
>
>-#define ENGINE_CLASS_SHIFT			61
>-#define ENGINE_INSTANCE_SHIFT			48
>+#define LRC_ENGINE_CLASS			GENMASK(63, 61)

you will either need to use GENMASK_ULL() or wait us having
GENMASK_U64() available. This will break the build in arch=i386

Lucas De Marchi

>+#define LRC_ENGINE_INSTANCE			GENMASK(53, 48)
>
> struct xe_lrc_snapshot {
> 	struct xe_bo *lrc_bo;
>@@ -797,19 +797,19 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> 	if (xe->info.has_asid && vm)
> 		xe_lrc_write_ctx_reg(lrc, PVC_CTX_ASID, vm->usm.asid);
>
>-	lrc->desc = LRC_VALID;
>-	lrc->desc |= LRC_LEGACY_64B_CONTEXT << LRC_ADDRESSING_MODE_SHIFT;
>+	lrc->desc = FIELD_PREP(LRC_VALID, 1);
>+	lrc->desc |= FIELD_PREP(LRC_ADDRESSING_MODE, LRC_LEGACY_64B_CONTEXT);
> 	/* TODO: Priority */
>
> 	/* While this appears to have something about privileged batches or
> 	 * some such, it really just means PPGTT mode.
> 	 */
> 	if (vm)
>-		lrc->desc |= LRC_PRIVILEGE;
>+		lrc->desc |= FIELD_PREP(LRC_PRIVILEGE, 1);
>
> 	if (GRAPHICS_VERx100(xe) < 1250) {
>-		lrc->desc |= (u64)hwe->instance << ENGINE_INSTANCE_SHIFT;
>-		lrc->desc |= (u64)hwe->class << ENGINE_CLASS_SHIFT;
>+		lrc->desc |= FIELD_PREP(LRC_ENGINE_INSTANCE, hwe->instance);
>+		lrc->desc |= FIELD_PREP(LRC_ENGINE_CLASS, hwe->class);
> 	}
>
> 	arb_enable = MI_ARB_ON_OFF | MI_ARB_ENABLE;
>-- 
>2.43.0
>
