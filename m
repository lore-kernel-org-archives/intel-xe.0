Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ACB7C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 17:40:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 308A710E058;
	Fri, 26 Jul 2024 17:40:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AmrYU2YH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2298310E058
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 17:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722015629; x=1753551629;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/LNtZf5Hu2B4dT5Y4szG/jefkY/8rc+0TiL2F6E6rms=;
 b=AmrYU2YHHvSQG62AbsYyGWGgzgpKWsKXe4wcm0hbLPRv4kpwYQZ+DwgD
 LKvWe4NhLc5+P9uAhijMFrj0PrsQT0CynHgPFrxlvvOOSS0yTcvU/apxK
 W0TNFxhC89hXuctRxE1VxtmnJiT8ANNUxlWLJVWdcKGZ+14CiwJKMDDMS
 o3ZlzbwX2ZBC+k6K1+qQQnsPD/JqS8DM69HDk4qzic0X1K2F3boqx6EDk
 l9kEIxUBtURGDucDMKp8akFhpZXLptzpGlorTSAhMIhyNxsgnFXsY/qgd
 NIUoAdjt2Ikjvh/vNeUcx5j1aZf9DkBw6x7vC22ZbMpkOTaxtV8ZTajo5 A==;
X-CSE-ConnectionGUID: /G58qdh2STWfDZfwYr8p7A==
X-CSE-MsgGUID: DvePmARkRNGpCDZNeC1T2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="12732995"
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="12732995"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 10:40:29 -0700
X-CSE-ConnectionGUID: P9gl/X2MT5iz6JBkRA493Q==
X-CSE-MsgGUID: xjT0CtLiT/q3J4zV7zR/zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="57494053"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jul 2024 10:40:29 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 10:40:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 10:40:28 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 26 Jul 2024 10:40:28 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 26 Jul 2024 10:40:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mTVWTfq1VeXo8B+ZfuK4bN3PAgwozDpZphgc0dqdevK+1v1RkZvpN8aZX/gbAyc1YKiJcP5J7tvPE1VRJbQIdYbuSDAMoDBRTP2vLSAKhkgc8flpGRsoLR//fcTe3NQtlG7wPfYjGTFB2LlwxUv9BlQfrqXG/l5y4MIcIbPBkG6PVtSD6i01FhFKQ6ES/HDpB3ALdqgOgmWEZ85ZjWkdnhoIud8AToKnuS6OUy3IRq5FvOvzDULb2GOUkHPiw0i5UEn3JNaXUTD+XHdUqnrYVeKlFbr0i2DGhYJaIt4sRjIbDBkUEb0/gjFL27fzUNOci+qkZ4dQR1Nx7O7IPAqdWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FcewuivwovJ8mHRG5aUpAXbaC8i7Uj6s/WjMyYF6tIY=;
 b=iYK78ffvcVLl4QtmpUbIQKVwBH/6yNgqgt4gx97lwDkjY6jJxL95R8eH2D6Hhgq/M56O0aHn1FH+ia26KE4W7QxOuHdMOa2PmbjWjEhd+aTdU+gsaRJ8P0NLX0F3YESL0nJ3MDDLAvdIEOzyuQT43KFhncoWHNgnHyW7MwG1jKvZiqIm9VGK+KdKbYcbtI6Zy2e4F4Ba9cMCkJR84M30PtvoJHWvKIDOfhStdkhj3nB76OT8Iv3HUhF0aEPZ5Wh84bKSBdhyxa2BAe1NNDXk5VTmruw1TDH89Bq+2MyaEQuMyULtisU2uknHQJRHLHKa0en9sRBc34pE6oizOqPFZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB7806.namprd11.prod.outlook.com (2603:10b6:8:db::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Fri, 26 Jul
 2024 17:40:25 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7784.017; Fri, 26 Jul 2024
 17:40:25 +0000
Date: Fri, 26 Jul 2024 12:40:22 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/migrate: Future-proof compressed PAT check
Message-ID: <3weu26krx6xf43kpzqp5tqwlyuaiqxwtcn5i2tw6nvsqtfdiik@r5cxvr7swv5e>
References: <20240726171757.2728819-2-matthew.d.roper@intel.com>
 <871e6e40-37b0-4ae3-822d-b6aaf6587def@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <871e6e40-37b0-4ae3-822d-b6aaf6587def@intel.com>
X-ClientProxiedBy: MW4PR04CA0037.namprd04.prod.outlook.com
 (2603:10b6:303:6a::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB7806:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e197ae6-64bf-4182-ee45-08dcad9a0838
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DALfX2/N+fMwl+At7XgGyQOurvvsAKJ52bwyzaOCAwNMI0l9YFBRNNpw+6d9?=
 =?us-ascii?Q?zP3ovZgiMzVOF4FXVWR3LV8onAPk/xl1LP5FHR7/HWS7aA2XnH8yPSm5HlwZ?=
 =?us-ascii?Q?tl6f3pRulHh1MsNBMliU4ZoQ8SbwUkCh2zuUXwacwZqQjjYeoL/I5CPuCVwP?=
 =?us-ascii?Q?zEJoqNcXlskpaJnactnkng0i1yGgLtt69FgjMRl1pTfgvpAVzlGGhggvBHhR?=
 =?us-ascii?Q?jNO8V7BNGz8M1zuexZ0I2+MtkxrEhLmWMl8dIvTfcGUJjl9wNd034M/6lVlb?=
 =?us-ascii?Q?Xf6Az+RUqrnz777JWVCDPTCIu83pqrh36ImHX8YiXxR/j02dTop2vN8CacAc?=
 =?us-ascii?Q?qTtpV07PRZT3yDtsJrxcBCJNf5Tnl7hEPeSviRLo6ubkc0TDuMuNiLyqwIrK?=
 =?us-ascii?Q?e9QfkAS6Sayfv1y7vT6yGhEqS4CS3W1lme8YlT95anJjAam4/7+hyEeZ320Z?=
 =?us-ascii?Q?d1QQsuIvi9Y0ekxWrXo1AE51J1hZ+4kvR6HgMPcNc3MG5UBJI64Ao/p+tGww?=
 =?us-ascii?Q?rh0gecICdZ2+aBjIuEaCb5MPSdDT8cAiHQ61PAnWygVUPco7iPcmCY6TURFe?=
 =?us-ascii?Q?y0V5cyQplnI35TYdzCz3UN7trUROcHPWc3j9cxjqx2qYmKDFGBZDoZGr2A5C?=
 =?us-ascii?Q?dPy17U4+CLY6VYW0CZlLNg5WYepivrMG8UwY/6kUnDiSWamKSjq+1XwbsaOa?=
 =?us-ascii?Q?dQrNj7rJ0m3pAy46nGZbqG+puRGdoZn2d+/NSmZusYTjLYzKcjaAxZB6EOIa?=
 =?us-ascii?Q?735sJVGBvsBjmRrPmBiPqljglzxY1djCNxRo+A6mfmIaAdfFlmkXKVkJ+tWu?=
 =?us-ascii?Q?+E/8uf/0l5+wjoT0378K/MEtpSYeToXx8ZCFfMQdiDgJMHVrmd1OlOVD7R5u?=
 =?us-ascii?Q?MwD7FWIvh6RkolM4nwa+5zfdJoOvxA8bHzhNgzhnNiX3SWXTf0V2zjNCVCJi?=
 =?us-ascii?Q?4O7K09dPrPUrwC9lLFkMlDmx6nXhCyYMe/9lD0Z4OV34NyTN512WqxoFXzAP?=
 =?us-ascii?Q?GlAtg+207jBiWzAF9LCJBpSKInf0N9dB3DEChoLay394bxZmLPD4uK9QB56g?=
 =?us-ascii?Q?Cs83WbGUJQBujln/V2sBI2PnEPziffY7pyMzAezpm1mQeokLW06T6q5AXL1Q?=
 =?us-ascii?Q?yUzbloa2yewMqzHhtuIyJoi1bFPLOX+S4kYn9VgwhwXvi06HxbGm4mkHOhtz?=
 =?us-ascii?Q?dLdaQ7S89LeTt7Z4iX+dCmirQYtsyoRlQlHp+ethwDBSv5mT1yfUXFZCO5QR?=
 =?us-ascii?Q?N/Au9y6PVV7MbMXPxPXCE+Slc8zm1ZBjx+l94uhgs4NMbRE2uCvM1HdGHDO4?=
 =?us-ascii?Q?CWJbWy5TuueTfPKJgxmUQsfbyPTqPjHlxFmyWsJLFby2sA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jUELKlLpQG/p9Bp9L1i2KgF1X9/VulkLTwv7awsImCiApqIMA/JXaQmEonLz?=
 =?us-ascii?Q?zIDTMZcMai6VZiTSLvGC8ymhlY+d6pP/UgmtXctWqT1EqkDRO44wRhIq+EkT?=
 =?us-ascii?Q?N4hJZYHJTHB0UQJUzpzmQuqkKIy51WriS2FGxa5ApD+pkcOEx3536H4pXhfM?=
 =?us-ascii?Q?E4ncKZc+A25TyB7dCi8phwRpoQZo52saqMec4163K+qZAUzEF+0SK/ukUqxL?=
 =?us-ascii?Q?Ytltgf5DYLqbqsfN4qt0zLh88b9t3CXAZcF3W7kBUzxmUYsGl0xTZCnSmQy9?=
 =?us-ascii?Q?QqhEnYfLL8XoQTJJLwTLGBeRYTeY14j2JihhtoNw4Xpr3xmzdy1xmWtL+rj0?=
 =?us-ascii?Q?fuMpAAOuUfGBXyJY/FmoLVZuWjPLdtiLmHu4jPF4Fci++aYxyBQsmgPl1ssd?=
 =?us-ascii?Q?SKrJeaAH/ZH6VV20NWe6rpsW221D4SegZ66P8rhXNLRA6SCR/CALIg8IQQ3Z?=
 =?us-ascii?Q?Td1Db7AmNClxp68DJjH2CTGtRktSo2SJXS8XJ9nm4fF5zFqXY88xU/gGsdJQ?=
 =?us-ascii?Q?Id4WabuQ6dTmuuRsh1gnVLHQbjGvHqWudOnTsHo4tdBlFkYDKNdOVNzmfmHs?=
 =?us-ascii?Q?Zdlnpvb+4EdWPGrA8ZcMIGgPtPQSqe2BvoM28QDlH7eQOhKltfOMgcjm/tsn?=
 =?us-ascii?Q?S4tEgmnQ4PMWQ/+2pqLdKsDsXRwhI440lJjEAyNXpWf/Xlj2uJhlbvLHH8e1?=
 =?us-ascii?Q?LnmmXODFMDi3hzyYJK9R5O0Hh7jvB8srFaQyrM/gWNPDRAyKqwREfmPvzeIQ?=
 =?us-ascii?Q?mEu8DadW2btbSnXaNPQXbWCibDWw0HokVBhcl/X84kGuQ2we5zKXWetn4/RP?=
 =?us-ascii?Q?83T6kEfF0/zLJf1r+ulRxNVY7EdQIZmb6HEW0Byqs3YCjvYf+zFGVplQe72O?=
 =?us-ascii?Q?nMCOrNsCUuu9C/KAlXKVFsqC1HBswRAtkpcfvvDvXmseO+UlMgfm+PTtWOof?=
 =?us-ascii?Q?LOvEatnDIm7+/r6u7Yx4WvvrNCKlDHTXAzWGu4IhovmKXLBD+rOw6kFEHp6G?=
 =?us-ascii?Q?+Ct3Q1IDz29cD+NqL/d2Oa28qig5iTPNAtpC/D7ppzuo8rEC7gFcDSNwpcSS?=
 =?us-ascii?Q?BNZXi2IQpT4V3h/NchmrT13qMQBbJrgJjXBo/J7F4egrjNHiOLspd9qbgwlp?=
 =?us-ascii?Q?5ujaIA+oJZ1pvk1ekHAy5L7DLf5HP/fwYMJJSW4hdhEMBBPdnj8xiIQ5fMen?=
 =?us-ascii?Q?eaDzlFemK/mTOHi6mJWMT0zNhT/YiXxlsqCn2HNSzNuMmzhN1sxbaLNi6YrV?=
 =?us-ascii?Q?ncRWUISuDVW+BRo45YZB/w5fYhyuVvfoszgm4KntV0ci49hACgAwhjkd2VM1?=
 =?us-ascii?Q?lpR8IXKQIivoOdJyVJmFUiWnifQ9GPNkeg5zZmYMtTs5RUCYt8JougkgM9L1?=
 =?us-ascii?Q?g+dZGkQ1Ak0MJ0LOnnYTT/qUvM+Jf6s5ts3Nl/6hFLfN7iLmfOrbwFb0Z6LT?=
 =?us-ascii?Q?y53MAsFGbemuwugSxcqSLdKUIA0yH4SFENyT5qLbrcxSQj2Uki1kjdyBSYxT?=
 =?us-ascii?Q?pTQJsKAR9/BnKKALj3O/WIma8FcTESBpiEzfATU/xrLI4xB+A3gzXSuk4fKU?=
 =?us-ascii?Q?7UiZ5qgyo3EwYktUcbcpbSHecYeC4ltbBuVMujYN0Q827/VtUtqvhIy7QlRw?=
 =?us-ascii?Q?mQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e197ae6-64bf-4182-ee45-08dcad9a0838
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 17:40:25.5778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cSMOo1VLb0ksaUUYaXd6Gh+yb/7/Zv5Y7oPmkx/jKo8dQwfCVx81VMa99vs1U8fzcnoX5rGbmIvUAGXUzZfqM8dPpaBl0XBl15DR14lCjMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7806
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

On Fri, Jul 26, 2024 at 10:26:00AM GMT, Jahagirdar, Akshata wrote:
>
>On 7/26/2024 10:17 AM, Matt Roper wrote:
>>Although all current Xe2 platforms support FlatCCS, we probably
>>shouldn't assume that will be universally true forever.  In the past
>>we've had platforms like PVC that didn't support compression, and the
>>same could show up again at some point in the future.  Future-proof the
>>migration code by adding an explicit check for FlatCCS support to the
>>condition that decides whether to use a compressed PAT index for
>>migration.
>>
>>While we're at it, we can drop the IS_DGFX check since it's redundant
>>with the src_is_vram check (only dGPUs have VRAM).
>>
>>Cc: Akshata Jahagirdar<akshata.jahagirdar@intel.com>
>>Cc: Lucas De Marchi<lucas.demarchi@intel.com>
>>Signed-off-by: Matt Roper<matthew.d.roper@intel.com>
>>---
>>  drivers/gpu/drm/xe/xe_migrate.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>>index c007f68503d4..6f24aaf58252 100644
>>--- a/drivers/gpu/drm/xe/xe_migrate.c
>>+++ b/drivers/gpu/drm/xe/xe_migrate.c
>>@@ -781,7 +781,8 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>>  	bool copy_ccs = xe_device_has_flat_ccs(xe) &&
>>  		xe_bo_needs_ccs_pages(src_bo) && xe_bo_needs_ccs_pages(dst_bo);
>>  	bool copy_system_ccs = copy_ccs && (!src_is_vram || !dst_is_vram);
>>-	bool use_comp_pat = GRAPHICS_VER(xe) >= 20 && IS_DGFX(xe) && src_is_vram && !dst_is_vram;
>>+	bool use_comp_pat = xe_device_has_flat_ccs(xe) &&
>>+		GRAPHICS_VER(xe) >= 20 && src_is_vram && !dst_is_vram;

I was thinking we'd drop the GRAPHICS_VER() check too... but yeah, for
platforms with flatccs before xe2 (DG2) we didn't have the bit in the
pte.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>LGTM.
>
>Reviewed-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
>
>>  	/* Copying CCS between two different BOs is not supported yet. */
>>  	if (XE_WARN_ON(copy_ccs && src_bo != dst_bo))
