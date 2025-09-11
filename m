Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB126CAC58E
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 14:35:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AFD610EB54;
	Thu, 11 Sep 2025 14:35:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lgeaA+2L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D4210EB54
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Sep 2025 14:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757601354; x=1789137354;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5FgcQ2wjPEdJ3XIeU2JvEYB4/Botsg5kuv8YEUv2AjY=;
 b=lgeaA+2LR6FcpjD7C5SmxiKoD8g2rO4ywHAe5dSyPsj1903wb3khYBbg
 NP3j2K7mw3XIXCIl7lVvPki/ohP35/tvvIYo8VVauRioNGa2JZjKuVmtf
 XQyGURlozXEHgu3Z58mRo7fkySNxhDrQZhGWFiL5+gtfy2dLzyv+nTfzE
 T6ge1Dmo+tBXU7Xn2ssS6h1soAHvhQHgRhiFZfmzEhxrdYLgK6GXBfuP1
 x1ogrYDMhp+58IRlJFtCCe/I4MrMQR/h+euaaHmUZkM+KCwqK0evLuSMg
 eWlwJgk3dYRrThHpdeoUcBSBR9ql/7QUuP2YW26q1LW0lvRRQTAQ7gdPr g==;
X-CSE-ConnectionGUID: hGnMp1UVSw2ZVVgp93EPEw==
X-CSE-MsgGUID: g98TLFXzSgSFj3N2OLpj3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="77390187"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="77390187"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 07:35:53 -0700
X-CSE-ConnectionGUID: IOTkMs7NSHqd8uDwgCijYg==
X-CSE-MsgGUID: 9bNtzDeTRz2YbtDQHOxniA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="173610699"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 07:35:53 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 07:35:52 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 11 Sep 2025 07:35:52 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.77) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 07:35:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SC5Sko+UpiK02K/pg2NkXN3Sesd4z4E+TY8Acgd4X6lLDCTrWKg6k3kDE5CVaRlAgnZ0q3crOGkN84WjzouTkvaw2rkXCw2QdKSuwGwvZNAbCKWHn/zC2kjeD+YVmSpRMl4VGgQSzW+/XaEnZJGCu6o9/+DkUty0yVes9VY3PqzOwssIZvSj09p0BKDqwjUcvyvwwM3r5jvJaSWraVaQ0F+sIGJBvcAui0kBKjuYFyjl0zecZxqwKbj6nr+R4h3+bp3niGONCODUgrpGIbkxJzoDl3JOL/1JYFgwGpaCwhF8UZdBKa05M3Js7MhvLxsaSoVOq4G0/laCovDqgNIEPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=71eyjOc6/z1znvNObl+qkUGdp9bmaCHl16rpkqcHndI=;
 b=Vwp9mVbeeqXUP6FkZUCyCM9NF81zO4RdQ3RlDT0ZQCi5UdZYOgyaQQv/2rxVXXszp9OZzyFh/a6qBLghizrumL4o8WkUMOnSPjPxsg9wOXT7yxy2CbiBnALjUwAxlDMvhRhvgoaQwxrQyYkBZ/eUR+ce2upAWcDhoDdirrc5ugWbWSFPDdowcumUiXajtCr6OHL4NxTzZ3NIqzExnMgYtP5q3RMwxy9Mc5VGxtjJqKfUjEV+mN7VDxZibNd1O7hOOwAzZA9LP9TCcV27UwwgzzMY2V7LDoHwChjAPRBSz31m7UhalfVtDn+yCAX6itzEOrBh4lUFpgOBIgpHJHn1AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 14:35:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 14:35:49 +0000
Date: Thu, 11 Sep 2025 09:35:47 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/xe: Work around a loongarch clang error report
Message-ID: <ipbveiem3ndqb2c54wh2ejhgfgy6ac7uhpkuo2fgazjbo2ne4v@siks2uosck7c>
References: <20250910161122.103584-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250910161122.103584-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BY5PR04CA0013.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB7573:EE_
X-MS-Office365-Filtering-Correlation-Id: a29825cc-abb3-4337-2671-08ddf1408096
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?+fYb3Kmrtln0rjSpC2MrCQbqb/JSNJ5PUlVEvm8wsdG5DKQzcElOnUobjp?=
 =?iso-8859-1?Q?r4JmlcWAfWBGmuBbC299WzWH8Z6ocJVGvOD/lP3Sf37zrrWb307UTtZY/b?=
 =?iso-8859-1?Q?8pdowjbW4xRM69f0mx27j1G3r+ygF0Lld0NRMwAO2vlaqHMhsjzr2pbvGZ?=
 =?iso-8859-1?Q?GOwQAlLkLP7o8vaMWAY4Zkl6tme2OelXQB5w3oKVumq5lkEp+RZaiPN2FC?=
 =?iso-8859-1?Q?xusbVu51WJHyiATdfXwWchHXuwg6vmOM2E5ap3KNKT1SKo4l/7TzWBHWHR?=
 =?iso-8859-1?Q?3+DUFXbqHuwQKMndURMui50OFuWuwaREP+J26a/knufdWKZPI2r1p3djP/?=
 =?iso-8859-1?Q?qqK6LXZPbJ2tz77qfn7DB+Fpq9LNp7R9KRsyw8LxdBI3FFen58FAI9Dzjb?=
 =?iso-8859-1?Q?PJzkNYaL8p2OlnSUm2a4yRLz05XiMdpOd44mB9Y5r/XnyDAu4XIxTwq5FG?=
 =?iso-8859-1?Q?J1/KYwUxJ8m7Cr8ldnmlrnQ1HKWiDaxX5Bs4jUjYqVP2J0Wh3iAT2JGQXp?=
 =?iso-8859-1?Q?ClxugBv0MUi96znvFe2rmmf3Yq0GHaqH1MPWSbbizLh3yM+ztcfpoeKp+C?=
 =?iso-8859-1?Q?XhmjNL3EgMwT/TCf630f85+EpvKJsm8wdcmsyedqle2bsi00SESVmRsQkc?=
 =?iso-8859-1?Q?QwPJd/visnIeWiPFXOi7nRt38NbOUx7IEAqmn1C/pCjAO2dY4rFyXEZLrM?=
 =?iso-8859-1?Q?YcYEcCeeUiP7R4qiidaRgjioHm5zT9+ChiRkTT/BeAA0poIHG7+aaZH/Vi?=
 =?iso-8859-1?Q?+n8hzfLftpvr0OKv67sMdwmqXHBAnUudQ7FYshVfbyLyXnPkcBMRLX7qD1?=
 =?iso-8859-1?Q?VTJhirjPlZMjgrqswjviBHtXNWcXPRNE2+f+/n/f8SKKS1LWD3fI6ZS5ec?=
 =?iso-8859-1?Q?XVtqIRlY8cB21csR+jN12kRkjCip+C+eyUc6pzCdcr+6L7YRG6+RoHWsH0?=
 =?iso-8859-1?Q?nYGBNcSjTpd3to6tTj7tV/PyN/B4boRHZIVsjesaEMTnuHvCLThyGRyjBK?=
 =?iso-8859-1?Q?Zpsix1dpsDDtBifbodRmbCtwY9aC6VCzEGP9mujdEKynJs7dxDS6vWPYNM?=
 =?iso-8859-1?Q?1ijWPiJmlLx5YS32uk9CZ9ZAJdHNM+WNQnoMTpyW7a2n1iAJkshItlnEtR?=
 =?iso-8859-1?Q?bfWqNa4vvxhvWE22DB1aEx44uUzDkh3qSTGgxJlq0P+Ajsk8mFEVknjDsL?=
 =?iso-8859-1?Q?jP5B9MvJB0san6wuQSHyVPnTte5asKQsipiIyPddLFXXmn7Qlaja5uoKFH?=
 =?iso-8859-1?Q?31/5GD1/ibHz09W+nCgM9Rs+w5xwzo0dpi65Hvaf37tH0UtucWgGMCY8cD?=
 =?iso-8859-1?Q?8K+Xm/CyA7/6V6BgEOvjD6JzzNOZKDtwZq7iZqzlE04NGI0Ecw0n/7M4+Q?=
 =?iso-8859-1?Q?hNOOQ4Fu6aIBC3J2mOs/GE6A3t/68cvprWbC3tQpydsn1NW2iIBUeAkT5U?=
 =?iso-8859-1?Q?Yk+P9z9anNr5a+ON?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?L7BNaRtQRr0hSWBQ9yzlbRNT7afBZI7/wVPcgswJ+XMroKZRvzTtTiSOeu?=
 =?iso-8859-1?Q?uajpwPPN7dh1ki0z0vUkzch7D8caj9RAyqcm4O4FtRh/6t7HEZVCzTYQP5?=
 =?iso-8859-1?Q?qY0um+3B//QbmoG1WcaY7e3Z+Pvrw4QcueMJD/AL85gKNhAJlOthQ4dhBs?=
 =?iso-8859-1?Q?6lb0aOasTdKYHM9Rom/ISwlv+LqxQgJuNHsvkPdEul3ROQi7IhOwL7QWY9?=
 =?iso-8859-1?Q?8bahkCHqWRKnDU/FVcuiZekTFpggi/8hleW+42pF+FSrxIXsaG4rAWhAzJ?=
 =?iso-8859-1?Q?yPg64ENuhsG5ocIZvuUqc4pxJzOtcI3eZN2Y523nxJEz1lohqQf8o75lcn?=
 =?iso-8859-1?Q?BI/ilcpJ8iPC4z8vHNd4I0+Mezp3BZMkseFd0IRH5m9a66iesK80klrTc8?=
 =?iso-8859-1?Q?jeOCMQj5D+Iz0m4BFMbJwfGsOcYXAKRYPUvL37lcb1+GVe6ptVjizsZbYE?=
 =?iso-8859-1?Q?QtNq8urjim2+HqOZ2OUb7MvlITsRofflzasaJVk+Hwp1qblIHHBuNOgZue?=
 =?iso-8859-1?Q?aG0tVlCsV54HbsRsadrvK+51GPdHT4X2oH1iyUpdmQMDZ2u4S/TRqR1pMG?=
 =?iso-8859-1?Q?Gdx78qv0iPTXDzt+g5epp5xhIdhfN37qHikJpEJfijyHxdZpLNvIpNRIFn?=
 =?iso-8859-1?Q?7z0ry5+fB/ViUgQjS9fF8ZVQ7ZrX1+FjO0bnd6a1h8lPSbjAfpYGI18PXO?=
 =?iso-8859-1?Q?TmKNHa9139iXAGUpR5ZZOpieO+Za5QW9QkOVda15Dd+72nudmchJOgJQu/?=
 =?iso-8859-1?Q?3aO9uGNPT3Jz6kSbMzA3YvsMFmPN3O6McbC8SSsA8bVf9JsBUrwM/0uce3?=
 =?iso-8859-1?Q?sJenPE8GxYV3g3BgVbQ3tN9zOGmQG3pCgwGQJ86qBOFo4yvOkdhalwS5jj?=
 =?iso-8859-1?Q?nUTxQKNokN2Tp/8qU8jMndR2bBKBhbXn1vzkm9GXEZiZx08zY/cCQlhKgO?=
 =?iso-8859-1?Q?oyXjao1elxQiEbzSvmUihZi5nHeEMS8RewoEo7MIAKvvyUBiX/IVEu0SUX?=
 =?iso-8859-1?Q?CF7yLbQ1lt3SpSrtA14Jmihjb15HjwpLfnp5OL62y7nMd9Pwblr2lNfTuS?=
 =?iso-8859-1?Q?RCKD5X8Cmnesg6vzWEK1N35/N9uZnBOuIi8YiRkSjp2TT9RrTvDofsYh1w?=
 =?iso-8859-1?Q?f0CtthLRTs3fLc/MIstdG23rpG8AeBfBDZfHm1i+ajwcWQZ36+qP28yCH5?=
 =?iso-8859-1?Q?y94yYICJh1B7YV7mzQoYrVkmzGXPnbTYxmuw4y9BIl4lgJV+LvObxqQzNA?=
 =?iso-8859-1?Q?o8jLFdl79O6oo21/I8+ysOBWOqvRehM0VU61TU3M0lD4f2KmZN5xNm4TW/?=
 =?iso-8859-1?Q?lFAZucGeuiJb36ptJFVGtyFFDpibsKefpHNXGkImNIr/G3Ga6AaYfKO6fX?=
 =?iso-8859-1?Q?yipKRWQ6DbKAkJNYpzlP9m9kMUG3hOE+q3o+/V8wFrQli5aHaOXIAG7Rbo?=
 =?iso-8859-1?Q?v24lm0Pju583XXch1h/vgz2hrJ6G0SQ0DpkjJHNrM0b9jYO972kFlM8EJT?=
 =?iso-8859-1?Q?hbojVczy93fj+Dvu7OrcHelGXrfaL/p14YNDlLWkyAKTzcGAkxo6/8Lce6?=
 =?iso-8859-1?Q?kcDcX5M1uETaUN5uUSchr2wnLAv/b3iIFEbkThLO99oAKXdzHk5k2s6mrv?=
 =?iso-8859-1?Q?a+rhFgJ0yUILbpoeHY9Q4Lw3C8ZMzt5MocsIC17jWX4DGw9is5mRHCcQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a29825cc-abb3-4337-2671-08ddf1408096
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 14:35:49.6374 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ctSh7bZ59lxMIF+sf/9+/ss67GJAxtvjptoLT5Ir76StjupMfbyh+vdr/eZPRSYSAnSmqd9VoUPkF9ySTJsLJ0zIT245E9EKrYhdMUbcoY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7573
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

On Wed, Sep 10, 2025 at 06:11:22PM +0200, Thomas Hellström wrote:
>There seems to be a problem with the clang loongarch compiler in
>that it confuses instruction pointer reads if there are more than
>one per function. So break one out to a separate function
>(The one in xe_validation_guard()).

if that is the case I'd expect much more breakage, particularly on the
schedule code.

why would it fail here and not in e.g.
kernel/sched/core.c:migrate_swap_stop()?

isn't that jump pointer in drm_exec_until_all_locked() breaking the
outer scope of the the scoped_guard()?

Lucas De Marchi


>
>Fixes: 59eabff2a352 ("drm/xe: Convert xe_bo_create_pin_map() for exhaustive eviction")
>Cc: Matthew Brost <matthew.brost@intel.com>
>Reported-by: kernel test robot <lkp@intel.com>
>Closes: https://lore.kernel.org/oe-kbuild-all/202509101853.nDmyxTEM-lkp@intel.com/
>Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>---
>Sending out this patch in case we need a quick fix. But if this is
>indeed a compiler error we shouln't hide it by merging this.
>---
> drivers/gpu/drm/xe/xe_migrate.c | 29 +++++++++++++++++++----------
> 1 file changed, 19 insertions(+), 10 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>index 6fad5d469629..1d667fa36cf3 100644
>--- a/drivers/gpu/drm/xe/xe_migrate.c
>+++ b/drivers/gpu/drm/xe/xe_migrate.c
>@@ -394,6 +394,24 @@ struct xe_migrate *xe_migrate_alloc(struct xe_tile *tile)
> 	return m;
> }
>
>+static int xe_migrate_lock_prepare_vm(struct xe_tile *tile, struct xe_migrate *m, struct xe_vm *vm)
>+{
>+	struct xe_device *xe = tile_to_xe(tile);
>+	struct xe_validation_ctx ctx;
>+	struct drm_exec exec;
>+	int err = 0;
>+
>+	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {}, err) {
>+		err = xe_vm_drm_exec_lock(vm, &exec);
>+		drm_exec_retry_on_contention(&exec);
>+		err = xe_migrate_prepare_vm(tile, m, vm, &exec);
>+		drm_exec_retry_on_contention(&exec);
>+		xe_validation_retry_on_oom(&ctx, &err);
>+	}
>+
>+	return err;
>+}
>+
> /**
>  * xe_migrate_init() - Initialize a migrate context
>  * @m: The migration context
>@@ -405,8 +423,6 @@ int xe_migrate_init(struct xe_migrate *m)
> 	struct xe_tile *tile = m->tile;
> 	struct xe_gt *primary_gt = tile->primary_gt;
> 	struct xe_device *xe = tile_to_xe(tile);
>-	struct xe_validation_ctx ctx;
>-	struct drm_exec exec;
> 	struct xe_vm *vm;
> 	int err;
>
>@@ -416,14 +432,7 @@ int xe_migrate_init(struct xe_migrate *m)
> 	if (IS_ERR(vm))
> 		return PTR_ERR(vm);
>
>-	err = 0;
>-	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {}, err) {
>-		err = xe_vm_drm_exec_lock(vm, &exec);
>-		drm_exec_retry_on_contention(&exec);
>-		err = xe_migrate_prepare_vm(tile, m, vm, &exec);
>-		drm_exec_retry_on_contention(&exec);
>-		xe_validation_retry_on_oom(&ctx, &err);
>-	}
>+	err = xe_migrate_lock_prepare_vm(tile, m, vm);
> 	if (err)
> 		return err;
>
>-- 
>2.51.0
>
