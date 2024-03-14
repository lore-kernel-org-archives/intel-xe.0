Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BFDC54E60
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 17:01:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 290C610FC28;
	Thu, 14 Mar 2024 17:01:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hBcRFUSK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87D010FC28
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 17:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710435662; x=1741971662;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Wcx4uao47tlb9tOJ+xVNLRqbGLUdsQndl4k8YVwRemA=;
 b=hBcRFUSKXVXmzsZ7KNlZRIrZj4t0Gx/LcicbWMHfIE4RpV2R7Zt0ZEq9
 vbo7l1caYEjqR1I+BvFFp7DK+TvJ1LVMmCj+DSoF6qgX88PbeOgNKGdbf
 AqLdHqXW0rrgwg8C/T+woa9D2TBIZ/koKpreB3qgHc9dayypKLt/N0Wrl
 ValHqsMju3MRL4wacGPmh8PAaB2pOlEDFtlRm26CJZ2tYkhb8OlxGRBFG
 JTaRtDduerJndbC9w7GWiWjeZK9AVQfVcV/lWA+bu25pq68vHVeRcoHc3
 /d6E75HxUDzWLGtQ4qL3hJ+11nDwv5xoWSvVCyp+yBHolkX3iQysP5YLe A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="16424218"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="16424218"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 10:00:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="12426148"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2024 10:00:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 10:00:55 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 10:00:55 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 10:00:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VjAlNCZVNYzQ9bOqXExn8H8HG9beDgxfu/4KcVk38gdXc+FazyAXxMd4EVbCElo4Paaq5BzT8FDyXSL0NBv7yDsJRmsCEHa3x9sJo5XZ/JrbUoluah9ptxwMrcyJCMZT+byURd/QFYOres0ymUsen2jCm2mWwh4VAwubqzqVpNHiMI+bVD1/PXbmx5WBa/gMjORcTH9aWra6F+EJNj1gdoBau3UZYep1wFmwRySr8DkmBY5fS6irfkeWIR3R84fgLVWpCC7peHq7A78LkeFVn/vI9RR1f2Giil9whbiIxi4v1ly4H3Ajha4Dk7SDealdTVcS/Vov5a7DeFheOJ9SBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=chBZjwwNLLjKA+hTZCnkH7e9wHHYqWTUXuCu43MO2to=;
 b=FgtPYhAKrNjWPG9f0Ya9sH3Xh9FT/1NHS6NpPrxzcBGo4tuIA0fKjysHUfYoKUKjwkIhFxOcn9lWpm+g3dSsm9UlVD9xw0mRE1iuwEnsKLegtzDRHx0hLmUMc2dO5DUvc1GNd76m3fQBbt5wPD+CbFHYtkbvaL6L7xZRsOWOYWt2lqsi6tImWyDE8EaHA7fLtS7VIFDMG1h8bmXdlrbf8SJnNDpc/ClEZYh7p4f2BAlUNBZuG8YC1PbtAchLI1dJghgOVidqhSRivMnYuHxnk5nOwEYV9KUS1651evGiy5NggOJo6IELpzjiLZG7dZttG/rHIH122rWBrA7DqrRPjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL1PR11MB5317.namprd11.prod.outlook.com (2603:10b6:208:309::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18; Thu, 14 Mar
 2024 17:00:52 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7386.017; Thu, 14 Mar 2024
 17:00:52 +0000
Date: Thu, 14 Mar 2024 12:00:50 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>
Subject: Re: [PATCH] drm/xe/display: mark DPT with XE_BO_PAGETABLE
Message-ID: <dibnzpe5c3g34vfaodp5xw2au64cqsw5yqcaku6rgps47b6xzh@i4gzcr62grjs>
References: <20240314164905.239449-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240314164905.239449-2-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR03CA0097.namprd03.prod.outlook.com
 (2603:10b6:a03:333::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL1PR11MB5317:EE_
X-MS-Office365-Filtering-Correlation-Id: ca45f4a0-07f6-432a-10e4-08dc44484e7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: toOC78R8YQf5s7VwlfgBuvkLwZ/KBNfJcgLUP44AB3uvhhZ3zkCORFewQAMHsI99+JPpApETBIyhxPK6eNbAUZxMwC2VOUGKYgKP5qjMV1IDg3b9zPrGY9f13uCfMJp4+mX8N6uJBuoHi/XuuNoUK5v60ghJxyNXYgJkrBr6HyYkjyERfeiE65fS+ana6vaoNwzdxZ1IRxQMTUo/ze74MABSSNy93nbDdgnXYud98VyxhoJqpCL2QEZv8ecLIpExRJFaB4p8X4LpLF73J5UNXvswHepQwbdEbdAvQIhC70CUU9XCaYPqejgWLM3dIKJnplUvF6VQ4436MtX+4SGEy0DDprzdJBXwQtZDrNrWWKxPHS0bgAQwJCjyRc9WQsym6RFDc71rAox2H5D01vsbTO8WIvAP1JFdyFZFrFtQbYSlTAyGRAVo2mNaW1jA6qtCPrrM4b2jbAbYz7fxGw9ogln+jWZHv8GpmuvBTqPnsmbcUtvmoR1MxzUMl2zmRuqljIk6ytWR8HTs0SDF4Ypht7oJhS1VJfhRcvptlSeZWw1awVEySm6mnrsDOo/z2VDwAAJ61A1LTcABrtDbdUEnK33ekW2g6MC6G8ibXgQIc1o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4mEXQOF5n0xBLfM8wle5YtVrQHkwqMvQPHxNwtMVPpj1dzXzaPthV9kCsvaY?=
 =?us-ascii?Q?6vxa06UyD7PbKssdShXZTg/cG44NXYiPEPsq+G4xuhicyiEmWqU4XNzWGoR8?=
 =?us-ascii?Q?j5a4rLU3/jvogQufNLVk1YBwwW9VfxpnF3AqmYzl8WEOHiwwa7KAHEM6Qzyg?=
 =?us-ascii?Q?pwYLhLyyC1HIzHRtmQdDWdnfJcpFoWijhtVtZmQMH36VxBtkxn2Hr5QSupV2?=
 =?us-ascii?Q?LfYF/6B+GL7fi6p+YtozFsCnuOZeluDnV61oEKYDG5cFQewWK1rSAmg0yyQW?=
 =?us-ascii?Q?PZ5Fw6/tEQDSTHsmN+L6Ij/QHpuTu9TAzM1PsHG5WLIIP2H2JwbjFUI5D5Pj?=
 =?us-ascii?Q?En2mcfGwinWdXxeP8tpS88xMzMWKfczyrqkndkJEOvCo6dwfGRSdDmnEjUQF?=
 =?us-ascii?Q?7xxMFpBTnma5OJUq8xurp/LtjGKlf+H6fOHMD1mD+9Qv8sK7G89mUvWUzppW?=
 =?us-ascii?Q?4/3KF+RxnVBszyaFByM35H/9RXRi9fuJ97TKCV4hYibJ4G5NOWGKPM7MSDR2?=
 =?us-ascii?Q?b3BmNFBVkhfUzP8FO8iwlPARpbYqCVn12888+OcMcT9ZFUIF+7KSc6wftcp/?=
 =?us-ascii?Q?O+FJyZfMc7GI1KGl7PYbS8oCZzIW4cCEF0KoWIWTHFDHn6I2lvzs7xzgzg4I?=
 =?us-ascii?Q?fJ24ekzZAPFRr5iGxeYfKhfaOCyhC3GE0hu8lRQ+4v1Cghx+VY32OQEDezw1?=
 =?us-ascii?Q?wcpC49JtxpKF0aOYa6JU2lOh3p5iUEM1Qw/U0jn8P88Xqe3Y8TMx8+EmNBpI?=
 =?us-ascii?Q?cPSh6msfAjesb/bSHGTDbuQiqxoyzfCQVEtBvrlvlrolO1oYicZTPRxiQ9mf?=
 =?us-ascii?Q?5IDTRzje6kC/78+iZRbVrKHPf067QEVHDOOgErvmE+nx+1FEDM+eRhUK3vMu?=
 =?us-ascii?Q?wW4NEjX/UcOwIMktci9ZIg9i8DIpYDLmYFv0dFRgwa54lnDVALEUvBwderdE?=
 =?us-ascii?Q?z3UKDre364W3SJekS5vWbOm2oEWH/O+rC3+VpBnjEwcIZQ1lv9zqBQZlNFvP?=
 =?us-ascii?Q?iAsJilRX2rT7TgRqVTw05Hn40RPAugaMQyew98bngR4JWrjUPVYreGkEdUDe?=
 =?us-ascii?Q?mDOduKc++cdCIm0XuSWgT3V7AY4NmWIplhAm6+UGBZZvgI0VlDT5ZQiFKeIW?=
 =?us-ascii?Q?VCr6GfcwRYjmT3iPCJdCTids/02mm5ugUb2FsIl9YQfBy+MeQwRYZjHXyafV?=
 =?us-ascii?Q?g3Yq1CA2D0El3Jk92bsSZqanj8WOwkADMd3Ad36XA41ptatbcA55GDEHqEGR?=
 =?us-ascii?Q?0QHlTGn70Dpjn4D20lxH0ZULUmGahCyBDKB+7yRAMG7nKwscD4JPNUV/lKdb?=
 =?us-ascii?Q?eK8ggS8fvNc3157hDRzH4IixyngGe3cHWiex6n4Ja0TWSzasB9iCkSenxTZp?=
 =?us-ascii?Q?5NC6HZnBkIw3G7rUBDsL4ezJsVGp1PSdMnMKpQY9Mz+pMML4zGWwkJmLY6MH?=
 =?us-ascii?Q?5rPdWBbyravKfzdJjxaSbWPlbLu63FUE+BL7waknBievA+6M+NG+NxLb6yS+?=
 =?us-ascii?Q?VVBNfyFPYlgNpaTRvIrmduZnq/uN5cGE5jTyuHwgnYlkwEhUAVWBiUa6mlle?=
 =?us-ascii?Q?ZzY/oHE14/Y9xHXtbOv9+ieWgrQw2kjznNvaSu7O/+GUZ50c/SUd3ZWLL9ts?=
 =?us-ascii?Q?eA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca45f4a0-07f6-432a-10e4-08dc44484e7c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 17:00:52.7490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UhqqsjfRJvU3tFW3sPXEq87k88DhnC/nzuF//LawMpyszq6APEBAXWBfrBNyudt9HO/O1tgTdBFZEhfo2FG4Wonxmk4Bf1HxKx6vMCKQwEg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5317
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

On Thu, Mar 14, 2024 at 04:49:06PM +0000, Matthew Auld wrote:
>Otherwise in the case where we use normal system memory, the CPU access
>will always be cached, like when filling the DPT PTEs, which is likely
>not what we want since HW access could be incoherent on platforms like
>LNL. Marking as XE_BO_PAGETABLE will force wc/uc underneath on such
>platforms.
>
>Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

humn... since you're touching these flags, could you take a look at
https://lore.kernel.org/intel-xe/20240314052619.2628396-1-lucas.demarchi@intel.com/ ?

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/display/xe_fb_pin.c | 9 ++++++---
> 1 file changed, 6 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>index 722c84a56607..b220f136be70 100644
>--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>@@ -100,17 +100,20 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
> 		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
> 					   ttm_bo_type_kernel,
> 					   XE_BO_CREATE_VRAM0_BIT |
>-					   XE_BO_CREATE_GGTT_BIT);
>+					   XE_BO_CREATE_GGTT_BIT |
>+					   XE_BO_PAGETABLE);
> 	else
> 		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
> 					   ttm_bo_type_kernel,
> 					   XE_BO_CREATE_STOLEN_BIT |
>-					   XE_BO_CREATE_GGTT_BIT);
>+					   XE_BO_CREATE_GGTT_BIT |
>+					   XE_BO_PAGETABLE);
> 	if (IS_ERR(dpt))
> 		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
> 					   ttm_bo_type_kernel,
> 					   XE_BO_CREATE_SYSTEM_BIT |
>-					   XE_BO_CREATE_GGTT_BIT);
>+					   XE_BO_CREATE_GGTT_BIT |
>+					   XE_BO_PAGETABLE);
> 	if (IS_ERR(dpt))
> 		return PTR_ERR(dpt);
>
>-- 
>2.44.0
>
