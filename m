Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC9A8C5B549
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 00:03:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C5A10E0A2;
	Thu,  5 Jun 2025 00:03:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lQ7wrV9K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20EF310E0A2
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 00:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749081819; x=1780617819;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ceXq3AXqSIV9nXVVe9MJsF9PthcgNvPFIrLfioHIPUU=;
 b=lQ7wrV9Ktbz+wNhkAWeYA497VpEXKK7bTljKHdrK1+qqE1tjwGsu77PB
 XOlQOk4NN9nfUviZTZv3LFiFzZyvm7iM+Dubebju487qS708urx1mtESO
 DUpUu9jJKdbZK4ipTjADpPjWD8cz1ASZdClE8WeAy6Bc1mr36U0sY9Y3V
 pIuAKJ+qi3VJWl46iSxsZRF6nYa9NIYjWA6yhcQkQ1pKUbfzX+DkZw39a
 YZaLUKuj3a3rZknBR2xQ35DzDrDJYYM8pporBnvaIFPpJ6dGwSRtNdRyM
 k8QdA8dE5A+Q8gKV+4hDhhgLWTPUF5hQnxpIgJEnjwTiHnFyg5rX/LTpq g==;
X-CSE-ConnectionGUID: 9AoJX/eCQCSgp+Bi7vKoWA==
X-CSE-MsgGUID: uo/q8nt3RJGpthzlr/QnWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="61452623"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; d="scan'208";a="61452623"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 17:03:36 -0700
X-CSE-ConnectionGUID: n8v59LLoSse1j/k0VJA3lQ==
X-CSE-MsgGUID: LAFeDkSaTPqHfS+M3jRuFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; d="scan'208";a="146276119"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 17:03:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 17:03:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 4 Jun 2025 17:03:34 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.60) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 4 Jun 2025 17:03:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x/MebEWnfEZTsS9ST26RZlfxlOyS1etvIYtF0EoK9+051umcXnqYQc4lOsQU3OW4EQBDtZ7TTrUtng4ePvH+e2nc5G05KWaAoY6IxHDBYdn9RQB5S3EiIAab+/SnUl8lX5ghWsnq18sDltqtreZgk6CwJvv3jWh0U8kuJU2wcTPKHAWvgApfHFPGXQ5idxxj8+7LcwDWXomOuOO+f8ZLWW72++w5rI02YlaomKRTvj/+PUT7bpnih/wPp4tBz7goZKF21uwHL6NYRO/N/EvwtPnKLS2AF8Zt9/K9UCCEUFcmSvid1MNoxPPzgImWybpivsK8M++nCj4+PiPFvtIp0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTIayAR468XexcBkbfwgsd0ionpMCVvsmqbURn4QIJo=;
 b=oSDb3sGriBuFI/oXXKXMducTAmnNFAjUUCZW4UREDKFFSjmlPw+8K6S0cOiJCQ5OGUuqrlQLjMHh6em7bFCSxxa+5YGdJMQHo10yBis4Dvbs/EkrPN2cySGCdWvfkPs8dBynhgSLDioMGnBKzqxnszZu35icFe3QiknRMFpQwWFZYlQ7K7eSa0xv+QIxE92gmIwDWOM1v3ZbDpmzuSfMmCW1B0olwGTTztV+G46pAuYwDyzFJmz9beFkVkJpKNYu5zCtYFti+npNZE/ma3Y67LUSKjJrdAHhJVtcDbQrLwPtR6pWNh8cm//W92kh4TiGTppn/Gyt8WRvhD+0gn3Zfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY8PR11MB6940.namprd11.prod.outlook.com (2603:10b6:930:58::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Thu, 5 Jun
 2025 00:02:52 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8813.018; Thu, 5 Jun 2025
 00:02:51 +0000
Date: Wed, 4 Jun 2025 17:02:49 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/lrc: Use a temporary buffer for WA BB
Message-ID: <20250605000249.GH6239@mdroper-desk1.amr.corp.intel.com>
References: <20250604-wa-bb-fix-v1-0-0dfc5dafcef0@intel.com>
 <20250604-wa-bb-fix-v1-1-0dfc5dafcef0@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250604-wa-bb-fix-v1-1-0dfc5dafcef0@intel.com>
X-ClientProxiedBy: BYAPR04CA0016.namprd04.prod.outlook.com
 (2603:10b6:a03:40::29) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY8PR11MB6940:EE_
X-MS-Office365-Filtering-Correlation-Id: dc574001-d44b-495a-f6b3-08dda3c4508c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?U3/ud0B5VpVL1qPiiyK8EpYfzS+ZTvp8J0FctLYDB/2R7uOL74EBUkrpYqQI?=
 =?us-ascii?Q?yDOUBYY6Md9cSy7pYMP1xdoxeqhgxQNmKFL6F87vuq1zn93tLiEyS0F2Zl1k?=
 =?us-ascii?Q?MjP14C/HIqKS+lh4cbMrueE+ecK+22KVDZcgR+0/7lgD0jSTqcfnVY67DpOa?=
 =?us-ascii?Q?yadhrnAigolBdutOwK5EhxlMu6WshAFNoHaYICtvkyQmCHprDy1RvQW0WZmc?=
 =?us-ascii?Q?X4z6qKl4XgOjJAgn5TiM/V44+iahT7FxCGL5hZglkkklZ3Be91Dpo0P6Pd1M?=
 =?us-ascii?Q?nV49CR6WIStQGwn/Axf1iJQkzT02urkVJsN+VHvFTJ1D1PMGc2T1IfITxwiJ?=
 =?us-ascii?Q?PREsUKoJSlFoENdgHPNp9kcEXp61cnDRk1XpwFPJC+H10W+nVREHjbZ22bwW?=
 =?us-ascii?Q?xmA7wqalAe5RI6A4BX3I6Vczsf0BjrOlyZ7p/mN3/B2/1Jf0eA4gBEZcuqA2?=
 =?us-ascii?Q?Q76aXC3op8X8bSDP9XiJt9on5LJKGy4Umhk9s7AiK1Xsdim6SncaL9iu+vXd?=
 =?us-ascii?Q?IvsnNeq0Rlz6VHwYpRLLHqxvF+b0WmV0dpkWxePPYrKmxUiJh7FyyPkJvxS5?=
 =?us-ascii?Q?gM8v8ZkpMeRG8t12WoqtjX1k2OTNbpJZBDh1l5INiJaEw7dLWaM4yLmQ8kpW?=
 =?us-ascii?Q?xKKLIH2Y4XI5bs7G7pLb9MB5C7I8lBq1cGTPgRhsg+kSiCQDdsdZ9ECWcDKG?=
 =?us-ascii?Q?60w1BlUQrwqyUoxJKo3pk25vjdTE01U9yMBMhctuEDwY1+HadDlX/RvdxKQV?=
 =?us-ascii?Q?jipQhPyn+wdowyX8UsdUjFCmA71Cpe6l6t2jEZa0iHqmF9CmRuoM9L/Ue0OO?=
 =?us-ascii?Q?Wt8JOzFtohVPXoW17JqM4/bavlG5rjVXdRIRZEc8ezmHo+hOym13inmmxG8h?=
 =?us-ascii?Q?n6QpYSZXnNPBRlE1+YywflMQs85oLIy+0QBOr1nNmgsUBG6CEgpVhRaT+yyS?=
 =?us-ascii?Q?qLaD4qCrESaSxHq48jQUD/GLlIC6XxeNyax+6gIuZNl+WW2FimfTT4cDxPoT?=
 =?us-ascii?Q?JrqXTgNPl02A8IYP3Lc4FITLq6UGUI5PVeiX2syIpe9efVjY5umYYcHqbsO2?=
 =?us-ascii?Q?KoPJVOKR1reqnLPqhxhq78C70/t+6uNB6ciSKS8N2zHJFWatiVXsrJk70ThI?=
 =?us-ascii?Q?2c5yl5di10Ze7Yg9owVfbzrXXMtfoCFBVZ9jLlFaasRrQgV8A6btMK+MD2ak?=
 =?us-ascii?Q?we04KUX/zEbmlkDZaKR5NmpwlnYXk5sn5cV/Mxh7VUtsDaI8x/aZP2Zked77?=
 =?us-ascii?Q?LzW8cYr0/45lLJcK+NN/AWVx96FusUY57gWAQjhqEVjUXg1Ice6ErNmapdGC?=
 =?us-ascii?Q?p55zY5738hvLJ7VKcs7zXvDi5dJHUfacyGqVzSv3KIMrfBJbTl4JuurmO/Jk?=
 =?us-ascii?Q?rzKboLOkaE+IbyVy6xqc+lxA2PhbbaCe2fwHYhGDqt3Cf5DoMqfU053BuNVI?=
 =?us-ascii?Q?pEIDFMb6ibs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q8dZh7qLOoclGwZqbXttfjjegMzBJNcXcXFhV2Ca/1g+/824LDEKsxiRrKGM?=
 =?us-ascii?Q?TZVIBeGNy28f63vSNwaaxI54Q4jEYcpRmCp+TjFzBZvHbscP56RW3wZEXPyP?=
 =?us-ascii?Q?PFjZYULjBcpU+av7z4OGRp+Dc466vm+KtqX5IwGzO6IepkR0x57IYrPNUKwd?=
 =?us-ascii?Q?2NJnCnZGDCvM7ekILflv4MTdP09SKUbme9zphAEY1H2T+VbZ4Kkku4Fn06pB?=
 =?us-ascii?Q?2UiKH5XxrBr4o5l9nkIz6lc2b/d/nPcSTGgsnCpsyExh+W9tmUbatLn/LrQP?=
 =?us-ascii?Q?jfQ6h2Z76XYo/CcKSel9HZEfHleVVBRg1sYjS6qrciE8nm/bIniMhs6NURCD?=
 =?us-ascii?Q?Ah762Fu7o1o20t7e3xNA6zHQgFOghkOkVYNdQhPxFlWHBRYLk5HyunsZqwhs?=
 =?us-ascii?Q?leEApiNtA6VcePpimyWOERmHXJQdYracJXdFniiAonQIXnznDUWcWit7hsy4?=
 =?us-ascii?Q?iTPJRHcy4LGgyN71vN1B32bU+mEdqU1Mlmu5ohRFZAKNvkzyWfuBkamWub3e?=
 =?us-ascii?Q?EJLHxTSPj6N2ZmjWp0yfbqSdiV2fX0mz78ozAcsQUZpu5OZZjKZfHm2bHDVr?=
 =?us-ascii?Q?uwmwgu6daebm3oVaFVCgjvE0gayZffHAZURmbzlwWiZv6t47ZPY3ZoDJCiRl?=
 =?us-ascii?Q?M7K5/YO+KNuRLuja7Nk/RcfUo/XbM18ciSGADfmH/4p9p1OQlaKbMGbwt9cs?=
 =?us-ascii?Q?IH2etauf8DgDIxg4Rmm8Ru+vmrNgUXWHq9JG5OuEtn1DIZsT45YUaBrgiE8k?=
 =?us-ascii?Q?RJCRlF+rkbaXtX1o965iW+5ADAs1RHyyb3qeQvm4ibli6sH4e9xfzhElGGYZ?=
 =?us-ascii?Q?3Jkfr3z7bVt6CWxV/UFfdfG+5i7lANSDCqXDcVIczeEemcKxabivTViA/2b+?=
 =?us-ascii?Q?8K4Kn7yvc1FlvECT0AzyqPwUXF/lJSM5RlFW0UO7eK/513f/sax6CH8dIW5e?=
 =?us-ascii?Q?RTVDU0X/HUoejbIaZOKTQwIRiLaBC1sztRF6DA3mKwB6AzSy8elNyhwlCCBM?=
 =?us-ascii?Q?IS38YsEodtFkVSmewTsoFwVu6lORSEYoa+hd1pHc34ZopMWo7NNBFK87Bx3V?=
 =?us-ascii?Q?yz54iTL4YBLCF3KpJJRdc90PmhMbO8UYafXdzWvCLb963WlUR16H68iNywIJ?=
 =?us-ascii?Q?oPIVV1MhqS8ncL/aF91CASzo9om2ZYOmWhgKJ2C59/YjHG+Me2hqbxLld35W?=
 =?us-ascii?Q?xiYh2FO33ALnuZ1y+cUcObJ8qO+t1e74tQFpC7Si2kzv/Ijf6ABtZkmmmx9c?=
 =?us-ascii?Q?3Pv/qRlV0Q17ShW01vYEC6Uq/hdavQQOf2GeWNh0T/2qw031rawaqhIhHsfp?=
 =?us-ascii?Q?+h7/c6KNtjRA72U2OlCrDTo4A0MA4PBAiIzciTDffQDqfsZ8ZIXcyoV/L6gL?=
 =?us-ascii?Q?I/ivwN5zGaE3pR7cgqTgYr+x0hQqHh+4lmWR5rd4WLOP3Zk9NIka6jtjdH01?=
 =?us-ascii?Q?EDYt6xJgTfbCpJUqfGLDV8FLvdBlG6iqmWI2PVnQXEoIlBQnngjOn6TaD8XT?=
 =?us-ascii?Q?xtA8fbtEDLwgJMw2vuJdl1FvYUDeq/f4Qw8BXDzpiQjKsI6PK049Q3g06N9h?=
 =?us-ascii?Q?D6gjM/5CA1NAddrR21qC5TTA1daht1ybHHrBB2b0SWRF5ef+c385jqeeR76M?=
 =?us-ascii?Q?Tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc574001-d44b-495a-f6b3-08dda3c4508c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 00:02:51.8468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uyDs336WTvavhnjhbawmgqAw62hWsZAVh7Y6QDfNRk+1gWECc6LyAa5s7BqPhKc58qANheu+jCjXmjLoEMykiVBRdLAST4oA2PydDwsO9Z4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6940
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

On Wed, Jun 04, 2025 at 08:03:05AM -0700, Lucas De Marchi wrote:
> In case the BO is in iomem, we can't simply take the vaddr and write to
> it. Instead, prepare a separate buffer that is later copied into io
> memory. Right now it's just a few words that could be using
> xe_map_write32(), but the intention is to grow the WA BB for other
> uses.
> 
> Fixes: 82b98cadb01f ("drm/xe: Add WA BB to capture active context utilization")
> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_lrc.c | 24 ++++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 63d74e27f54cf..bf7c3981897de 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -941,11 +941,18 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
>   * store it in the PPHSWP.
>   */
>  #define CONTEXT_ACTIVE 1ULL
> -static void xe_lrc_setup_utilization(struct xe_lrc *lrc)
> +static int xe_lrc_setup_utilization(struct xe_lrc *lrc)
>  {
> -	u32 *cmd;
> +	u32 *cmd, *buf = NULL;
>  
> -	cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
> +	if (lrc->bb_per_ctx_bo->vmap.is_iomem) {
> +		buf = kmalloc(lrc->bb_per_ctx_bo->size, GFP_KERNEL);

I was originally worried about not zero'ing this buffer with kzalloc,
but since we only copy the specific words that we write here into the
real LRC, the garbage in the rest of the space shouldn't matter.

size here is always 4k today; is it okay to be using kmalloc for a bunch
of 4k allocations or should we be using kmem_cache or alloc_page for
these?  I'm not sure what the allocation recommendations are these days
for page-sized allocations.

I'm also wondering if there's any way to avoid doing this independently
for every context by using CURRENT_LRCA with either WPARID or MI_MATH to
eliminate the ggtt offsets (i.e., the only parts of the batch that
differ from one context to the next).  If the actual contents of the
workaround batchbuffers are the same for every single context, then the
allocation here is only needed once, and even the LRC's actual
workaround batchbuffer could be pointer at a single global page rather
than a per-context allocation inside the LRC.  That might be beyond the
scope of this series though...


Matt

> +		if (!buf)
> +			return -ENOMEM;
> +		cmd = buf;
> +	} else {
> +		cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
> +	}
>  
>  	*cmd++ = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | MI_SRM_ADD_CS_OFFSET;
>  	*cmd++ = ENGINE_ID(0).addr;
> @@ -966,9 +973,16 @@ static void xe_lrc_setup_utilization(struct xe_lrc *lrc)
>  
>  	*cmd++ = MI_BATCH_BUFFER_END;
>  
> +	if (buf) {
> +		xe_map_memcpy_to(gt_to_xe(lrc->gt), &lrc->bb_per_ctx_bo->vmap, 0,
> +				 buf, (cmd - buf) * sizeof(*cmd));
> +		kfree(buf);
> +	}
> +
>  	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
>  			     xe_bo_ggtt_addr(lrc->bb_per_ctx_bo) | 1);
>  
> +	return 0;
>  }
>  
>  #define PVC_CTX_ASID		(0x2e + 1)
> @@ -1125,7 +1139,9 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  	map = __xe_lrc_start_seqno_map(lrc);
>  	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
>  
> -	xe_lrc_setup_utilization(lrc);
> +	err = xe_lrc_setup_utilization(lrc);
> +	if (err)
> +		goto err_lrc_finish;
>  
>  	return 0;
>  
> 
> -- 
> 2.49.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
