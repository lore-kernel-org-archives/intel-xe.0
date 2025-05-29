Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28086C54FB3
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 16:19:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB8DE10E009;
	Thu, 29 May 2025 16:19:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C1pBgtYp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E42B10E009
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 16:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748535561; x=1780071561;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yqcA+a/Twh2MUeo+D8wiSOkxj6UxI+yQOXnMAcZcB1A=;
 b=C1pBgtYpmakFVZpSczylwMSFNxaYZTvtfM8Nf0LrwUywoeLW1QWqBUmj
 DRaKexZLsltz1NmycjqKJRu1CueIT5jfDvGwX6r6q4vHKQv5WMAyqIcG1
 bTmEJEFMOduu6L5bOmnFAPmOLnb/2+3ss9G9RAlL2XQbcDGG1ioGAH+IJ
 TGTj4dQP8ClJk0XQITX7CaN82CNJeCmGHLGHCkwYrEhX5T1hXRaGZm1pC
 UUQEhu0EnezvThNw1vHNEAnwOV0gyW/SeChKBj+7ixsoFkSelA+eno3i3
 zHZOoP83yZTW1uNL2LdxgyzZ8dG2od9imLTizQDNdXUr4IlFQGK3N+v6V g==;
X-CSE-ConnectionGUID: tzUhlr3cTwmKHWDYLTj/8w==
X-CSE-MsgGUID: DrnbkyUNQZuNf3wxJOs+fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50712068"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="50712068"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 09:19:21 -0700
X-CSE-ConnectionGUID: ltXaWK7KQvWQAfLIMf9RFA==
X-CSE-MsgGUID: 0M6fsz2NR8ScMKolx47fJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="143636114"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 09:19:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 09:19:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 09:19:20 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.55)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 09:19:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jMSajohHlcsO3cytRh8m0WhG9acOG+I9xk8RxxnDkYh+9kvqC0nqId/LKFpJb4Zvz2u0bUdL15XKJUKj/k9UcmObqVj6irJCa8nlGUdpklVQpsq/1bM46lWm2GKu0FWdA94BeE7rC0XesQu9dIYCEvOZ6PikivVyTq+PI7RTQHY1tPGsZn9YVwpuRT/wqH+IwqYSeQRdr4706F4VtZgVAqwPl8/PxqIhZ9LnDfYO355ie1LuR9RqW4/Vs+aC+KSFREPiXSSGbtR/qscZP1eEz6yarsRYKOG+nVL/M/QvtzsI5kiiuqStOUf81N+JqWE/e9wMU3V1wH5c2TZdROFBIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBv8BCEj4odHh0DezM56CMKE4LOf4KGWDXjrSyHqfDY=;
 b=QFoYfRKGTc04u46HW/dXWhmi61vcVG4LUeW6UviroD0seGgEkTnJjS9nDFJSkJXaWCd6HsHtU7d1aN5n46YZsRXBUsVP6ZH7YSaMsuO2qQQjVgCrqptTwsfERIZQ1bEH9m6GMW27ydoWa+lJ10ayWL9ggkD8tyeRpOeVC3KDs7WqzKd4wZc3g38vEgAmecM16MmzSLZ5SNggXEPeUjqZji9v666Q5u4BXSf+bd10D9j0HkXyQhWkxOeEiJCtHKz40gHUQcoM4r/+hPGJXb3m+3yTl8+CG/Idtpkey9h3rJVlPPNNNZVgHjy5MXw5QSsn/vQF0QDk/T3x9fhTB2rJ1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ2PR11MB7520.namprd11.prod.outlook.com (2603:10b6:a03:4c2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Thu, 29 May
 2025 16:18:37 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%7]) with mapi id 15.20.8769.022; Thu, 29 May 2025
 16:18:37 +0000
Date: Thu, 29 May 2025 12:18:33 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <riana.tauro@intel.com>,
 <intel-xe@lists.freedesktop.org>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v1] drm/xe: drop redundant conversion to bool
Message-ID: <aDiI2QhloEEaMnMb@intel.com>
References: <20250529160937.490147-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250529160937.490147-1-raag.jadav@intel.com>
X-ClientProxiedBy: SJ0PR05CA0085.namprd05.prod.outlook.com
 (2603:10b6:a03:332::30) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ2PR11MB7520:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b11183e-84d7-4150-09f1-08dd9ecc7733
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DLUnLYBGTptcJNrP0dyAYV8egIkF+IUIMJaB1xjx/W7Kcix5upgx0FrBZV0N?=
 =?us-ascii?Q?mcqwK47a/2W5T+f0qUfMlMq99Ka3I+ePE9v/9FTIEruzUISX37+IgbFgmHIK?=
 =?us-ascii?Q?Mrh8u57uCoORgmiop29vGXg0C0ioArNw0B63wguZ4m+InIW2DmoVxBXlokik?=
 =?us-ascii?Q?1cpze5XJX6am4SayOtawBZmGIeLeTZOHnohlv58+HpCWNpkPutllND3iMytD?=
 =?us-ascii?Q?Le99GjZKWrBD9GleuaUQlBl3bJvWZ80PULNqDJqodraixy63vE3SR1ddgw9z?=
 =?us-ascii?Q?w6gvzSuZjgbMEO+qBffE7fB3VB5GI7ImdVPK52FRyNtyqzLwxThlWk/yg6Mk?=
 =?us-ascii?Q?FwQLYVSwGgzqI1FTWDolu8MbfvBaptX2Qss3z3fvjzCVzrto6TYMNh/LOqpm?=
 =?us-ascii?Q?XG11EKcY2XxPjLhTsSSBXUoZphqYev8x+uJICTOt5ABQdQftJt9CoNi2ORKC?=
 =?us-ascii?Q?/ksBktyHPF1C+Xw9hEEl0GDvEBcPoFMTIQ1MqAhUd/QudvWat/xSd7gF8KOm?=
 =?us-ascii?Q?phWBEiNZ8M0qmSuD3SG4fqxJsdh8EfzuuAjpf76WZXwTKCQOrWaYgqTFDEmY?=
 =?us-ascii?Q?faFEXICLm/xsHC/+dUMn3mxaxkEOtV2JQz42Xc6LDxUY0/n22YIPwnSVmIqJ?=
 =?us-ascii?Q?KMe9DlTS/cUn+qtg8pLMNt3RBQFAkYT6iIBxdOft3X6YcVJbWDuJ5+kn8wgL?=
 =?us-ascii?Q?8AKhzUfIOSLEvG95Snw4/c/GVG8K8OueRcyD56qfJmpudFeXeQQ2NZrrtMSJ?=
 =?us-ascii?Q?t3PWqnU70hZLziZMqx+2I6m3y9je8DzbuabCQgKPNkgn1H0q9txldQZtQD+s?=
 =?us-ascii?Q?2aSUq69cK/meA0ReORfwsP8mjqK+uw9x/963Sb/Yhe31DzRC/pSK9IpAwrY+?=
 =?us-ascii?Q?ECMVpjrFPs44XQR5xmhz7b1NVQua6ovUhvQxiz/Ft7Fc5grtRvcN8yw9Jm00?=
 =?us-ascii?Q?/uZd26hfgpZbi3Mhp8WCDHEdffIFUeiX8wOhHqDcN7Bjbt0XRiSX/7R8LueE?=
 =?us-ascii?Q?Q7fN1QwJyDhBGm9oUJv8c9ug7Wjbu7nLAPD5PhAPf/O0xiCDHvVSN/Z8kkGn?=
 =?us-ascii?Q?JtGAopBWwfTfT02Bhj1JTlxKC6c0i9X6i/cf7AOEl3oKik93uUd/Afz1xH7N?=
 =?us-ascii?Q?1250mt0QSwLyk9b0TE+YGlFJgBx93X7DAwccY5tUMOca69/cnsZBwFmSMcAm?=
 =?us-ascii?Q?T+5ZemPKlgP0/JRq9vnBZUFw68FJY74I8Rid+ivcMDUTh6cO64eUWqoE1aia?=
 =?us-ascii?Q?tOkt828DDkN/qW44WxpWS+JeORc2spb2+cpmvG6wnOykVk0+oB1NkGTKnpv9?=
 =?us-ascii?Q?k/9rVrGqoWkyZzFtjp7QYOLrW2VY6tYOstJV5atw2UmHt+N2y/eoi2We4Ww+?=
 =?us-ascii?Q?nJQsCCzMz6LFz3yAosXGdj06idCxmRZVV63LBC/ln+8eNn1GGg2VfiVUyP6+?=
 =?us-ascii?Q?zJZT+1kiggw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?joEbjaFE2uMADIp5O3sIgLCZJ0BsL+EYF2YxNOLyyE6g+mzVyEeQr4kdCRpa?=
 =?us-ascii?Q?GohyDanxe+OOHce+aYU5Fz0ggiE5eeh7QRnBQoc3bkR9ncDKAMpYW2Sbh/X/?=
 =?us-ascii?Q?l0b7TBrdzLglF6s56lFp+x/2k1nsU1ixlOM8MR1G4W73z7i0+pEzSdctDb3G?=
 =?us-ascii?Q?U6u4Ee/2IsqoAaBzyApwgH7Zy943s1WlbiwRuSix4RGKbtlGL6lXbuTmSosZ?=
 =?us-ascii?Q?H0h77IpFwfm7Gr2mjXta2QKMzUjL0iaZ0qJMS9YZSbGA4xPT9nenPYDS7SQg?=
 =?us-ascii?Q?xL0IRjXxOlOwdnWHVRtLbx2/VyhVSCN0A/VM9q3aFMEs1NLAKoFTsSDbbzUj?=
 =?us-ascii?Q?scqJUslg8rYAXTvX7Mq/rrj47JDoR/QUj8qqe5T1icfOWcmjMsxIHZOdwltU?=
 =?us-ascii?Q?OwgJkgIVSo/2G96ZucoL1Ta5BGudfJzLk4MINSgOlDuVScjj7NQjnd6DX4tO?=
 =?us-ascii?Q?quvBJjFftnHJz0SssQg8erZMGyqtR1ZbcnlgPW+7Pcm2x+K9917owq2ZQI9u?=
 =?us-ascii?Q?I6mL1mCYoKZr+rCFUH2/S8dGBEZe+TobGoc8UpCZ62sQ8d2hea9PYbnHmPPG?=
 =?us-ascii?Q?n2uGaQh5HoccbmOyjgc1xXbQ//ooAbDb6LOEufe1Dh6iEpe7OPJJ9uOoYQUg?=
 =?us-ascii?Q?nffSLjZF4UpoMaJVNH0pMUkpLF/Nhd+drdeUJpc9kdq79iL+FnYtoiEMHscN?=
 =?us-ascii?Q?vvqsLK9V0TUzuwuQVahgLFf2KlviqTrzfNBJVydvaWcX/QYzCTrEovj/vQKJ?=
 =?us-ascii?Q?M7QgJhbgMlaUwSDOUECpOi4Izu0h1KM6iy4R3yZIqTVPWBZ4sZK/claO6GB8?=
 =?us-ascii?Q?U8lQgUarneBQL1Yrn20VW3JI8PhJLOeIeL8Quv2FPbfqtet1ndG/Z+YxcuUl?=
 =?us-ascii?Q?qc3rriHldJ036Dm+Db2y6x21WdOKNcRW2HInbJThrtbdOmwoKhutwIl/MxHg?=
 =?us-ascii?Q?2H8U/dTG6rr6OZmu4TRcZynJYtLKOkRaUNlyRnabJHiaucRbya44AA6KAVoZ?=
 =?us-ascii?Q?QytfDYgYYCzxOlCcfaOeBy8KIw+49T0lKexe9885KHQ+iCizsioTvxbC2uJY?=
 =?us-ascii?Q?E/FOtYudDJal3ID16nGK5pXh0Nxt1Z5f+7XrKLz/WpUBBcGc4o7S4oU6HMyq?=
 =?us-ascii?Q?NGBKKmBEPTDOr48BRie3gJKXfajm3DVaELJquTKOmGXEQYnUHPLNKgHCw2QM?=
 =?us-ascii?Q?RXg8gWpIHg+pGY0m1lyEvv/qG1xqJ/tyU8lRhgVXu9FMKciHpYI5F3Dfn75Q?=
 =?us-ascii?Q?YQtSOaKbdKOWPg6OadcyFx/hhgTSKvUbLvCorcsckZIgSMOZDWELHxjNEs6M?=
 =?us-ascii?Q?XtljBDioe1wyJsBombHhQHiBvDNrIUfpkC/Bm/urxm+xnnXMM8G7xwThWDfh?=
 =?us-ascii?Q?sYpFLGvgaEHTXp9ef/jpCYnA0041VZGhoRA37T0QHei54D7oIx5+383yqorp?=
 =?us-ascii?Q?IMOfT9c6bRqCL8r57EnM5/ECkuppBeCUr5w/XngpJEbQEA2sSz2XszO4/muI?=
 =?us-ascii?Q?/2WPDN5J3a1BegI0YDO1BNkz/4/+p0c6I7pzNxyCSKQ9Grdn43RuVOoXVtJN?=
 =?us-ascii?Q?HM4jaxXih649jMw/gcG5Y/hTS2gBCgrcAkryq3LYfDPWJ3R/owGr7OK0wvIa?=
 =?us-ascii?Q?Ow=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b11183e-84d7-4150-09f1-08dd9ecc7733
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 16:18:36.9499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XtiaQuVGVJWxxd8xHlA7D586o20khBi6kR3KiUk+oTKcTWBLw87By5dgIXKeTdFmhyz1y7Wr6f3wtf0PU6Woqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7520
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

On Thu, May 29, 2025 at 09:39:37PM +0530, Raag Jadav wrote:
> The result of integer comparison already evaluates to bool. No need for
> explicit conversion.
> 
> No functional impact.
> 
> Fixes: 0e414bf7ad01 ("drm/xe: Expose PCIe link downgrade attributes")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202505292205.MoljmkjQ-lkp@intel.com/
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device_sysfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> index 2e657692e5b5..b9440f8c781e 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> @@ -115,7 +115,7 @@ auto_link_downgrade_capable_show(struct device *dev, struct device_attribute *at
>  	xe_pm_runtime_put(xe);
>  
>  	cap = REG_FIELD_GET(LINK_DOWNGRADE, val);
> -	return sysfs_emit(buf, "%u\n", cap == DOWNGRADE_CAPABLE ? true : false);
> +	return sysfs_emit(buf, "%u\n", cap == DOWNGRADE_CAPABLE);
>  }
>  static DEVICE_ATTR_ADMIN_RO(auto_link_downgrade_capable);
>  
> -- 
> 2.34.1
> 
