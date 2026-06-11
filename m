Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 964B1CD98D5
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 21:11:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55CE210F172;
	Thu, 11 Jun 2026 21:11:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JMHW5irz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6689510E8A1
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 21:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781212279; x=1812748279;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KfTmn5DIaiHspcSyfY0cE12ZIyqZFi3Kv0F9gyMj5WM=;
 b=JMHW5irzgqHFjRBcs32mI6FDZyImTpNmNlhH1VsOHn2WKR6QLKrdDeEu
 i5/vdFsd4w8FUzUn7I3Rf7Wjccw4vYtjZqQiDAe9RIODCe+PWa1PbI6dk
 AFIVZpY08vllG+A2iUukUyvGyV3WqjKYEd2lwCYitme1MKCHcDpQ05pzC
 tYEuQQg8yIWBcWlwCcy+rx8mAWJISwpVXtOyyv6TWi1bbrWTyuiRyQ0ZR
 wjf5o0z6tbhTn1unsu9SBtN8OmktJ99TsQ7mC9+bWzGQeAeYPA8OCgp2X
 7iiltqpRa0pj5mMDTNelA+J4NOGfUjgpGkZnLnDv1iv5GLRSWog+4zXBw A==;
X-CSE-ConnectionGUID: rpVoG/cxRiCm0nDXUu7Jog==
X-CSE-MsgGUID: Js6W5w8dQa2G1a/qSCT3PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92359683"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="92359683"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 14:11:19 -0700
X-CSE-ConnectionGUID: j/DP82HcSDy/MFjPfCQBdw==
X-CSE-MsgGUID: PmoslsktRXWAVi6fKpHEew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="244175566"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 14:11:18 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 14:11:17 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 11 Jun 2026 14:11:17 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.7) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 14:11:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LinBeQ0o57i+zp1gADhJMx0GHTcUWC5IxQcO6hp6XhCwbJBG0e72V0P7+ZEyh9rkNKnUSWxoEsE9X660edM8cwd6CiyhE5+efbnqSyMEGGPzm+W+QCiHpvPEHWH4te/lZdxNZpDiYqFbkk7FdHJnzMRe0LddeWedPKDvlHN/goFpYyNQghUSICXQeWApYmYrE3/3xSN+X37Mca2FqXKkguoTp6OezlQVH9RcUshxJEURkRnVDNPqwKYH0VJ7iBIJHsY1a2bKyv3a0skAO83P86b13ZfyuvH8fFJ0myOhXcC2ljN/9Bu8wxvopoJVLCOb559TgZLmdOcG+iNw9sW4tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=crXOSdAXKkTP+dtBDa/c+XnSmQzFFHQqrEAFaN+3Uhk=;
 b=iv/3OdDXIdb9BM0nO5UHcD/+BONSpQ042pdS3Msbo5la2GIQrWFwhtYpAxYDt6KLgAmSqaFnvAvbwqYd2F4nAOEYW6usrCnavOMY2shaTh1hR84nxRsPS4N0ZUVeKlmKBtrycGbWijhOJ6A5ifJHFszpFe+x+GupwpZqEgHO69KDZVMwAwCqjlZDoNx9bZRhyVil2NZ7AITbrGt+7pAFrwwGQnGLHEXjAqMgcdSs7lpCVi9hdwhl4nUaSUxlAds19hlsbL+6lLtbR2ADjhJZGi8O3/N8A5M0rSytnvesE32DIZreOTxFPbYPCGTtCWh4e/IL8PvdJe6wXylS9/8AUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SN7PR11MB6876.namprd11.prod.outlook.com (2603:10b6:806:2a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Thu, 11 Jun
 2026 21:11:08 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0092.016; Thu, 11 Jun 2026
 21:11:08 +0000
Date: Thu, 11 Jun 2026 14:11:06 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/xe3p_lpg: Add missing references to workarounds
Message-ID: <20260611211106.GI6214@mdroper-desk1.amr.corp.intel.com>
References: <20260610-add-missing-wa-references-v1-1-0947577238bf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260610-add-missing-wa-references-v1-1-0947577238bf@intel.com>
X-ClientProxiedBy: BY3PR05CA0030.namprd05.prod.outlook.com
 (2603:10b6:a03:254::35) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SN7PR11MB6876:EE_
X-MS-Office365-Filtering-Correlation-Id: d109b8b1-0aa1-48eb-4d6f-08dec7fdf4e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 39VhSKcLCMsjkDiUbDcDsQM1JqNlU3mZkoMlQUyJhjrn0seUfc3jNEu5n/08m/GKRz48tBVYmyNqAgflDr4Tr2zqi2FrvCmTtjvXrB2WEId/VnqiPklr22SLZkN2dN5l4yQWEQqMcR3af6DwV6y2Xv70jp0uEQFt9Hed6e2qYBewtZ5K8TzulGSLRUN6xIshKNkxJOF5pF4Vwf+cdQpbaNhN+W1FcRCICAqcSoYkPzTKhiV4btWfvPOkx/qIhpVk0S2Mc+v2nqBUSxshKpD71S82e8TdYsEAr9xC1+cq1jhZ0fWE91zeI8i1C3wCbGDcz+mMFTZCGc+MH4CgP/lk6ojWdWvFecoBdN6R3ZQd6RiUs75L48ze+7ypsDXOf7nyea6iP38vxsqQKxl9+Nyk067aG7KzgCeGeLNVQTPhbETthtXGWMO9otUvpqS/4V+pvj4KPe2RcSDMx0aMCM2VoB7FUbmxmY/Aj4lkjvlo1h5QKSng1W335/hCJi+VItgbgJeEFMj5K6Yj7ljwJmclTj4MUuhm0hCafzksB6wKdSWqhohbrBkpwOJZAjdkJ2GMFdWED9oOVEAAUXPafYuglAzR0XeiS2O/r9rXYB80m46dzN77zDVmueOe68pjJaIjhVwsjBAPzaANlrd9X3RcNNeCnjTIUyaGavPrEY26qeHHrYqfKsXjnuDT7hG+8sql
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TXtb8TwHcVXe1uHf+ZIre2dn2103rI3ojoVLIvQ+zHzMcRF2SAjoyLmd9GSV?=
 =?us-ascii?Q?K3gv4RYsqjN5e7vl/42f0sFRR1uki1UfK23Nuv3PPbnQdJGs7RaEL7VWrlYv?=
 =?us-ascii?Q?nvao7CuaTuYkAOH8X78rayQkp3tWKKcsA0Ghj8E7a7D8SQLkeOlUfp3UjbIf?=
 =?us-ascii?Q?hypNTxjLbhOS/0TFLFcWu3B2syqc/ndH0VD3W1gNAYneFgsBrq0o3SPeYc0W?=
 =?us-ascii?Q?9JMxu8YPTgUMY+cXCprj9EPmYhZ83f3PuLy2xaJuoMqPHS/Q1RqHTRwWFfvp?=
 =?us-ascii?Q?sXHCIuMp5j51J3iGmlIPGgyfi7zhHHioEedlL+pUsbhpfjsERvr98nXR5Wqg?=
 =?us-ascii?Q?yT274V88OfMGQ45krjFi42qk0cS9lueG90Ei3d2z66TLou10DJoA4liAx8cA?=
 =?us-ascii?Q?gXnV0DocFKjM9Xd/DC/cxzcVL7zvYutqggr3myygKS3HPSX+maGjGEP3CnRM?=
 =?us-ascii?Q?bfyB0Uoo2JidwyfMgOBeXsHgRT+74xfnrrNO6lQ5hQb+vKHdi1vfog/1iXZb?=
 =?us-ascii?Q?77MfwHyiHrJLKeR1coN9kbElyzB6DJwGSQk6q7XEtldK1jEb43riyqtVrlwv?=
 =?us-ascii?Q?xxCDMpdRNtEucolhVeZv+Fk48hO0x5Nkv004QnVM/98JCltMWhmUa1W8unMQ?=
 =?us-ascii?Q?6m+U/KgpdJGyT+lN6VqPuVelrkxJdo/e1XKrBcoc5gd1dJIUi5F8BrTsF0hA?=
 =?us-ascii?Q?SQ7GQQwwekLC8OzIOMwgYD1jgyZzCGLgr/WjwmGxHWLSpC/IR/0VLszoh/ji?=
 =?us-ascii?Q?ARadH/MTxcvYIBM+RRee3ew2rnbiBaxzlhmnJCU4+TdhelaAjLBKkhrah53e?=
 =?us-ascii?Q?MCD1RL1CjJ04p2Z7G0HaMjpOmKaPQIh8iM2epc0q/81K9bxqkBDsRYu5pTq5?=
 =?us-ascii?Q?5VMkGF5NRScoOcT3TynB8wwI/TW7HFrgZMY+U/NaPn99hl/BaJgF1YOoqsNO?=
 =?us-ascii?Q?BfL9vyrritgtmXDmuJWf/K9e5Cov6WgjVw+dBlEG60Yne1FYj8kg2w0MqkhT?=
 =?us-ascii?Q?oafRfNGCNfBzhVAxmdAuAmfPzAJkWoOUpqm+7E8IFj3ncOivHW5eEi6JLgy3?=
 =?us-ascii?Q?MILM+fwxErL8ncle76bXDmY/WIpstr+SCR8I53PFpFCdOOAweLNZHxfGz0v7?=
 =?us-ascii?Q?J5rjYdUzBExlr9Gs6idb5b5BccgEY+ZoWrGrlKbVqfAJkozw7Ma/eVPmVNfu?=
 =?us-ascii?Q?z6RkqnN++NgDigREIUjbCTMMNhJ0poY2puDdmqAYQ27r9oAXPTN2QiVOLegY?=
 =?us-ascii?Q?/K9H9OOWKOkZ9kHI0f11dwzbAgoQW5moHmgO+v/4i9nZfNuIdbei6PfRXikb?=
 =?us-ascii?Q?Chm7o/M/5vW5OxaQUgt3pBqjU19w1tI9KPqkIZ1jZeyuR68oA4xxw1oBJ++h?=
 =?us-ascii?Q?EMboHcHIqBtHGXFC5dLY6lM1MlWlxyJRtThGaEjKsdQAZQr3O4iTtEqcyQXj?=
 =?us-ascii?Q?3ZJ85ukk8YRFKQWloYXXhFfJ5REhObIT1nHiw5ESbGFXGd+zbgq1ZUjc7mNU?=
 =?us-ascii?Q?GmRd6CR4XYPNhdouP3iwXYFgZBtqgKRE+LtrF7wX2rx1kbzuIuVJCDmrzvmf?=
 =?us-ascii?Q?IGE25YiKMhwNgF2stj9dCPTuFJD1VmXT5rXGhlhKTSk2dNBo4Gdryr6Z7bOY?=
 =?us-ascii?Q?vnLiPwyp3L4FIsG97G7x4eGtJCKCvCIHpjog1lTC9LINkTao8aJwqueIzu0M?=
 =?us-ascii?Q?QMM4UXwagx7ezmTH1TJinQ2jjzLBuHEkaqSV0BqY+2Nr8d1kD9V6Q171V6vg?=
 =?us-ascii?Q?aTlN0F3xK/DfYL2PlqLgq62ab+xWtkY=3D?=
X-Exchange-RoutingPolicyChecked: f4rXfGwwRChUL71X1RyJg/rkjvK8fmTTegADrN1ht8uNyGGwAtg57sIr2zg48PyfFOEosFohUPXPfw3VcoCPqDMlyJ49dWACrHV/4F5XL2Uvjhfzkls/vWa6hK90/ItR5qrLFqlwUuAsrgcBJmzoeHgYffrLVoOZw2IlqJoX9FYhGgnmZ1m+sYyUkv59Y8Ucq0D2QPpjUXIDbjzj8ZhWmUNY5WfnxP7+zsp4tjVFhX/EtyVzIvceJXnGAnbwPFOYvOzQhkDD/JrAhtKMB8CV5eD9Mrqm3qkv5wZQG59fGY2NG95/krqHvRce823eKrC1EDbtks3Nb6qX9D3LHO3fcA==
X-MS-Exchange-CrossTenant-Network-Message-Id: d109b8b1-0aa1-48eb-4d6f-08dec7fdf4e6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 21:11:08.4437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OLpohWu79CssOfuxU6Dh8oqBs3mCVqtEijdlkxFklnzYWt1jZP+InOYxe0PmtiFcwoQEumMe/fpN4HvtM+SmEO3pOCZCLD6o9rPb9+hxXTo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6876
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

On Wed, Jun 10, 2026 at 06:20:47PM -0300, Gustavo Sousa wrote:
> Sometimes the same workaround implementation ends up being the
> recommended fix different hardware issues, which are tracked by
> different workaround lineage numbers.
> 
> Some of the Xe3p_LPG workarounds got "dismissed" because the
> implementations were already in the driver, however for a different
> lineage number.
> 
> Even though the implementation for workaround #A is already present in
> the driver for workaround #B, it is still important to reference #A in
> the driver for tracking purposes.  Without such a reference, we risk
> dropping the workaround implementation if, for some reason in the
> future, we decide that #B is not necessary anymore while #A is still
> required.
> 
> As such, add the missing references for Xe3p_LPG.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
> Note: I realized this while reviewing the workaround database for
> Xe3p_LPG against our current driver code.  There could be more cases
> for other IPs.
> ---
>  drivers/gpu/drm/xe/xe_wa.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 635d5461f712..139434946f8f 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -293,7 +293,7 @@ VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_was = XE_RTP_TABLE_SR(
>  	  XE_RTP_ACTIONS(SET(MMIOATSREQLIMIT_GAM_WALK_3D,
>  			     DIS_ATS_WRONLY_PG))
>  	},
> -	{ XE_RTP_NAME("14026144927, 16029437861"),
> +	{ XE_RTP_NAME("14026144927, 16029437861, 14026127056"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0)),
>  	  XE_RTP_ACTIONS(SET(L3SQCREG2, L3_SQ_DISABLE_COAMA_2WAY_COH |
>  			     L3_SQ_DISABLE_COAMA))
> @@ -587,12 +587,12 @@ static const struct xe_rtp_table_sr engine_was = XE_RTP_TABLE_SR(
>  
>  	/* Xe3p_LPG*/
>  
> -	{ XE_RTP_NAME("22021149932"),
> +	{ XE_RTP_NAME("22021149932, 14026290593"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0),
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, SAMPLER_LD_LSC_DISABLE))
>  	},
> -	{ XE_RTP_NAME("14025676848"),
> +	{ XE_RTP_NAME("14025676848, 14026270459"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0),
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, LSCFE_SAME_ADDRESS_ATOMICS_COALESCING_DISABLE))
> 
> ---
> base-commit: 10db0c83b0ccc3211990b54235475abb9d383851
> change-id: 20260610-add-missing-wa-references-c58331fb7e55
> 
> Best regards,
> --  
> Gustavo Sousa <gustavo.sousa@intel.com>
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
