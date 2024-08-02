Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D581CC3DA4A
	for <intel-xe@archiver.kernel.org>; Fri,  2 Aug 2024 21:29:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8231A10E0D1;
	Fri,  2 Aug 2024 21:29:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h8GlPCsn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11BA510E0D1
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Aug 2024 21:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722634147; x=1754170147;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yFiA/mD3ReCV9manC9ELVNPHwkJeCquy/k9bSFZSgcQ=;
 b=h8GlPCsn7Bf2OUXzqIcX1qURxpDvHgtMVJ3gQd9+OBYEzj3N8LeRlANb
 9EpCqJavrxSjVPhUE1YXPS/UoMfTp/YLELWmGblFW1t0gLsPQAlPT3c5I
 L/HjnxhXlEbENhsTRxl6ykDPzEuam63gDfXZB5S4XG/wb7XOvHg2/N/y7
 MeKqtINiGUPKqoQDvbmbvBkX4nrbYLE1ZXjH26ujaDL3eM249dc0UQZcG
 q9JxzSvhmbHFN1dKWUmf0rWScNFBNyiZvAsx97Z8aQ7mqv4EBNx31Ug6y
 ieUzM9Hml1RRLRke34oRGfaFwHBmcFrOmiPVcEh8BZSybxX+1J7SgWVQy w==;
X-CSE-ConnectionGUID: ZA4eoNUFRJOzo+EIV8BjbA==
X-CSE-MsgGUID: Ea86kXLYSQCwkEykOcrTMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="32043088"
X-IronPort-AV: E=Sophos;i="6.09,258,1716274800"; d="scan'208";a="32043088"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 14:29:07 -0700
X-CSE-ConnectionGUID: E1ZcjGmaSOyGANwTH8+7Xg==
X-CSE-MsgGUID: I8xQePZsQ0mc3jxSC6XCJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,258,1716274800"; d="scan'208";a="60352884"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Aug 2024 14:29:07 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 2 Aug 2024 14:29:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 2 Aug 2024 14:29:05 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 2 Aug 2024 14:29:05 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 2 Aug 2024 14:29:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=urwFO1SblzAeKP5DIDZHyr/gCTxptG63/BSGb35902gSlQ1bcrvPPcjcLDAxIT5Qx4o68MEm+czw/mV/bO0JLp4G7nPRNn4a2R79yj1R4PTMtpdI4S084iV8JTT0iBX9mI9G2BvFDb5pURrwpYyi9Br4VQXqaAUkLpuQKEg/LQQUxYH+I8DtPxoYpj/m3YrsP82GlmkbZhUWG3PlF4Z+JGao9Y6SJLtL66vybi8MejG/yB9to3rBdfYnEEw6boP29h7YGNtnpqQYyOuXQSY60Zj2zteqoxPPZMsuohmy9XiC9pb8NQFkQ2rg1hmtM0IfWZCJVD5t6qNi6P3JuOpHvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F7MmStPpyKQy4q5YuFfVr83rjaoLaID6fnMvhzaBJHU=;
 b=ysC5niLdMqUYpU2hIXqfEHp9g7JY3gCOCyFds8nSdjYht+LBLjsa2b1b6JXwlmp5757SStCoRXewiUZgBpnQ1oCfJCs0+5i/BAvi5cc7lc1y4P6V0TG1tXmkr0SNpP7BjXGYk9sOW30gx/xMBqWu5BBMusA120rjecJcvDl6CVM9wS6whKIvpR0If8c1EvuUabRuR2ufrYMPL44/qxYATW4aA8JTv/eDGEmfcOLNlALJZW+vuvvQQ630nmEY9JKdG5s1ARI9GUPwG1H7unnZXHX2C6Uq0mTPBOxh4MW6lNJdj/VLeldlpqrJNTWgrS05Gd4yJCSC7gD2TUYkYykUxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ1PR11MB6178.namprd11.prod.outlook.com (2603:10b6:a03:45b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.19; Fri, 2 Aug
 2024 21:28:57 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7828.024; Fri, 2 Aug 2024
 21:28:57 +0000
Date: Fri, 2 Aug 2024 14:28:50 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v3 1/1] drm/xe/xe2: Introduce performance changes
Message-ID: <20240802212850.GA5091@mdroper-desk1.amr.corp.intel.com>
References: <cover.1722607628.git.akshata.jahagirdar@intel.com>
 <c2dd753fdc55df6a6432026f2df9c2684a0d25c1.1722607628.git.akshata.jahagirdar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c2dd753fdc55df6a6432026f2df9c2684a0d25c1.1722607628.git.akshata.jahagirdar@intel.com>
X-ClientProxiedBy: SJ0PR13CA0134.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::19) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ1PR11MB6178:EE_
X-MS-Office365-Filtering-Correlation-Id: cbfa411f-89c5-4bef-2335-08dcb33a1e11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Qh/nn6jx8K1nLZNfJpUpY4YkPwaATSKf1qLZBT3Wcpk7uyncKlaRcWDHtn8Q?=
 =?us-ascii?Q?oPbdJbJobSEawqjR1A+/H6jVsHSZNHpXPq791UWhtm1llwfzTGA5X0nOF9JR?=
 =?us-ascii?Q?FE/KAEvRRK5d56ywfDYxGeK2IMXOUJPgujgDFT0nttDZWnbN0zhQHv1MGNsR?=
 =?us-ascii?Q?3NmtcmXETLU+4Sp70+QF+bwW/TuiWx5IpPyIzYkoGtYqBW9t7Fvriy61iLqh?=
 =?us-ascii?Q?rnlgSSrjkZIHtuqW5dGZ2jtfq1y4glKdsmpL0LcYP3vYurYRFt/R4Nyrh66F?=
 =?us-ascii?Q?czcOn+5slzUj04Qkxy8pNVoPtHv+nr2UeDJ5AJ/DzatxQn+2PQVrdcJpdvGU?=
 =?us-ascii?Q?KAU2X1CGA7Y8EEOQXr9/EOT5mfO0cgLmDUDOujqSEGm3Z4FOU7hdAgAAIGO1?=
 =?us-ascii?Q?vY3n+gchrO0VWFqGPpDYACe9fkZXTzVb56Y3zE1byzG/QwLPflH2SGgNiqD7?=
 =?us-ascii?Q?O8MDfAdfxe1a/GxJH2QKEkjzkMH6b+uj7fLk/orskbKA+YOGUnqIEq4KSmWZ?=
 =?us-ascii?Q?kkW3j3wOC7ZhSK1220smB9qgRLVuE1AKE66E6Rg9S80GobgvRz4TP0bUXoLY?=
 =?us-ascii?Q?P+H7OQ5WkSC/yYvWjO64mStZifHrEAECro7V3ALfRVjfHsLeteUmvoIhhmVC?=
 =?us-ascii?Q?j0Ta7WC9XU7YcNraLLEW8iVlEe0HtGQ6SyGeEzaMT92AbLvDqgC3qQcNKlJw?=
 =?us-ascii?Q?4JxNBHn+l6L5hR1w570KO2E9NptSRlqfC+2qm2pMRaCJaJPlpvqTSb9xV542?=
 =?us-ascii?Q?uP5RqwQbZyXBXV0aH7iG+KcDCyJqYxORkAUjffKjuYyVQfh4g3W9ZCjc7mas?=
 =?us-ascii?Q?AQSdmcwa7/JmA1G9a+9SBHdUzbSJ7j7qsth5mvajaAIgasuAxeHzMY1I53oF?=
 =?us-ascii?Q?RXQ0vygGyhtR9CKTff9jCJC/SG+J+565xBZNfDEsATQ8b6EaQ0nD/1GKzTvP?=
 =?us-ascii?Q?xFNAzRPlaCa2E6t4vmW8teppbMX2ktF0oLjDiCAzVoK8WDpAMoNCVGIMWXLC?=
 =?us-ascii?Q?2vRQPaMzbg1BM2vzRtmrPppUAwjjdutMRE/vOPpLnq/oGpIlpsEyzB4O37Zy?=
 =?us-ascii?Q?SpNYiwJT42bveAXSWwvmEknFrlqTkmlK28srvvqQd8EGspgb14q8Mm/H1PKR?=
 =?us-ascii?Q?sCiYBsQcMs1fkNUVpPHyyrA2YgbCbGUgsTBMmrG7Hrp3q2Psq7Flg7rdaes8?=
 =?us-ascii?Q?7w20XfwSuPy7TR4ISifGmNQlVERKaOllcKv4RBdEmTg47VS/isB2BEgqOh92?=
 =?us-ascii?Q?UtADFjmo7ucz3deFH3X0zBWEGUVhzr/SaMcOWncYiUU16BwzcRDwZQV4lZzM?=
 =?us-ascii?Q?CegUj8qPd+SZCkqpSC00FyYJsMlxNM+M7gTXS+4USjRMkA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7OwpdAfYv5aV30wm5KzEXgz5cYPL4Br5SEWuzyEaV0FI3eCoK8yGIEiNnQQM?=
 =?us-ascii?Q?CGSYQdVloA9b9aPK9B2yNMhzXac9wwfwKaojekHKuwpmHGeZYxe6V6WSitSH?=
 =?us-ascii?Q?zZgqoYiComdwLTpYwuR0/WT0J5GXHIY4P0cfA15NvAQfmsKyvk+fQhcaLmdy?=
 =?us-ascii?Q?waREp0T6Yx6uNL/X060u5zL63CLBmDCmmoFf7hqkHlsKdJviUqb7bUZLt7P+?=
 =?us-ascii?Q?40tpaoLsRNf9ejn/DTCIyENn8ynUPrFvWIiVkfRI0xeUARVlNqZn5UH82WBK?=
 =?us-ascii?Q?xXy/EYLQFEHiWfBnoz8JPUJF8KN8yAjyw2Jr2tMAL1ZFDajEy/OgR519LeV3?=
 =?us-ascii?Q?hm2OUTNvv1p5L0pMArcr0IaLqqTueWFQcnu9p04AN8ZKDKgStlYBQVyG6ZSv?=
 =?us-ascii?Q?+3/bbDc3+cirTJ23k9X/k47Uwgr5KsG0dLDgh3dFeBsal/vZ7GowQj2xAO9j?=
 =?us-ascii?Q?n99CCWj1mOrGvRbcNO0IgbEDEK9jBzXIEj4Hui9UrbyII3bHkCldYnfMRzBl?=
 =?us-ascii?Q?UF1bqe0DNeqG7yeFqyXEwWdtkEdL/42biiiIYxQ71vk9oO/V5lOgxezQ3cd1?=
 =?us-ascii?Q?bVlM3VPhYBEIExrkCkjzIjV0tmC+CV9rR7tFqwRrEQCYGwvvEARXMGR/T7J8?=
 =?us-ascii?Q?s+pUdz/HiaJp/SleXACwG3lt7ETD3Qx5Y2284kClBntaH6tlAB/7H+EIksvv?=
 =?us-ascii?Q?mOioIn/h4SkQcu0IGgCUX8Dds3hzm/jYy3kTSKmuuStY1jpZp501tASuXukU?=
 =?us-ascii?Q?jFUb43+FL19vaeUn60zgsCV13J7P0q6WLR6bYBKFUP95P2Qrvl3SdE6J0J1n?=
 =?us-ascii?Q?1v/2WX1RG50dsjsaC9JqqnXrP/0oc4slBRNfVq+IQXfqmnd5EcRlEipQtypn?=
 =?us-ascii?Q?+GG1AvO+zCeUD1OpzWeiOCH/6Of6qUc+8ZxbVvrwJvSSUVRbY63WWpjrDM3t?=
 =?us-ascii?Q?nwL2c6wROO3FrGgge3oAzzDhrB3IkUVH2oP1G+Hi587NX8gSgNbOkEOTLip7?=
 =?us-ascii?Q?acYo8sY4P9Rg2G+Y+3DP92fhJLgXDW425/xn/cX0UOhfVgO50cd3X+pqF37r?=
 =?us-ascii?Q?EN/LNgWuvRltCC3P8jWQiJxqpq7esWX0sBLju/tJn+AF9vPN3xVQ5sk+I0Kw?=
 =?us-ascii?Q?JoOEgkHyCd0HEZ2kkiTLES+ULZEUd/IpJdYArcX7EdFnIzVjNYj4+iDdh4HB?=
 =?us-ascii?Q?PVfOefCG3IP8Sejx+KIaDrS3DsIzZaDnQCZ0Xo9WqAvR6u+mqXBOUZmGsy2A?=
 =?us-ascii?Q?/1X+tFmjoAreGkM7+tEAnjzhUk7IeyHN5kP5QuPinlzwsDijYJV+mnF8DGVb?=
 =?us-ascii?Q?OEBWEK38gW2UiUKU68yNEUo7m5cJy4enatdJE7bRCVxR6U+2E34fOfXx0IBS?=
 =?us-ascii?Q?29DBLB/fBiDO9fweUkJOsTI5zMmZAbHtRbJfuAX1+7fyfzMp5A40U0D90pxk?=
 =?us-ascii?Q?iVuJdoEkCLY/Ecq107qbAn9LnhAm/mh/TPZgvCIcTnovlr5FB+PVmX6Tk2v1?=
 =?us-ascii?Q?xkC344HKe7XTYL7kt6Z6rL0ZEy6X+g8wjw94fAQqKXgat1MUVfUeNYaZi75q?=
 =?us-ascii?Q?gdF4IlWJXEG9GVBF19jGX/GNdwF4CcoSoHoTdFUBV/UzWw/b9T67b04dmabP?=
 =?us-ascii?Q?yA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cbfa411f-89c5-4bef-2335-08dcb33a1e11
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 21:28:57.4852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nXAYh6kL+Nx4WUHJua7Dhtidx5Q9hZckohOsgCtpsd9OhlEFZ8zLwIvdnMQ2/TwctiMPsySaIr6BkPQJq0PjYwADodJTFD1jR4f0TeU87a4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6178
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

On Fri, Aug 02, 2024 at 07:12:03AM -0700, Akshata Jahagirdar wrote:
> Add Compression Performance Improvement Changes in Xe2
> 
> v2: Rebase
> 
> v3: Rebase, updated as per latest changes on bspec,
>     Removed unnecessary default actions (Matt)
>     formatting nits (Tejas)
> 
> v4: Formatting nits, removed default set action for bit 14 (Matt)
> 
> Bspec: 72161
> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


It looks like there were even more updates to the tuning page today.
But we can handle those as a follow-up patch.


Matt

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 +++
>  drivers/gpu/drm/xe/xe_tuning.c       | 5 +++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 3b87f95f9ecf..c50643ab4c84 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -367,6 +367,9 @@
>  #define XEHP_L3NODEARBCFG			XE_REG_MCR(0xb0b4)
>  #define   XEHP_LNESPARE				REG_BIT(19)
>  
> +#define L3SQCREG2				XE_REG_MCR(0xb104)
> +#define   COMPMEMRD256BOVRFETCHEN		REG_BIT(20)
> +
>  #define L3SQCREG3				XE_REG_MCR(0xb108)
>  #define   COMPPWOVERFETCHEN			REG_BIT(28)
>  
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index 77d4eec0118d..3817b7743b0c 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -45,6 +45,11 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
>  	  XE_RTP_ACTIONS(SET(L3SQCREG3, COMPPWOVERFETCHEN))
>  	},
> +	{ XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
> +	  XE_RTP_ACTIONS(SET(L3SQCREG2,
> +			     COMPMEMRD256BOVRFETCHEN))
> +	},
>  	{}
>  };
>  
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
