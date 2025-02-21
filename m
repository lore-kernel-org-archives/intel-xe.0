Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 056EBC021B3
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 20:45:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D4E510E2AA;
	Fri, 21 Feb 2025 20:45:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IVVVf9fK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 019CF10E2AA
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 20:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740170710; x=1771706710;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HJgxocFJ3T3iCi9xbX8iUdnwIMKKAKFEGJTnaYRpNx0=;
 b=IVVVf9fKtQ+01GC6duAwcbw7gMmHoZ3xG1kkebH+0J7y88SWjCl/EeQ5
 F3urJ16cwRRs19DAe7P2S9fTuu8YUPH1Q5nkFDhQVVFQ6jZbCzjFE2puB
 57vc+naHXwrcY3gH1koirzItgOfmJaCWxiBwgc0GPm87PYzduSohWCCZy
 o9pCM8bPEBTgVDB4MRguQc9QEoPHaFpD7zoGzFb/P97Za+YblMVmhv0qI
 MYarzGePirlBBZXao50BFIzxX30/tyDX4Fpvh88z3lxUTEdinieG99e3V
 qRhOvrWwiO6OWj3uKzNJM2WWLcypogz/bMySXKTsPb6L+giG0+OwpDscR A==;
X-CSE-ConnectionGUID: eYhrpbYsQSe4E2hanFtOtQ==
X-CSE-MsgGUID: nwnlklDbRKqxz4DhCZN0lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="66368109"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="66368109"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 12:45:09 -0800
X-CSE-ConnectionGUID: +5XQhBS3R+yEKIaphJXEAQ==
X-CSE-MsgGUID: 5OhEbrtcQh+nErqnb1a/EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="152666463"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Feb 2025 12:45:08 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 21 Feb 2025 12:45:07 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 21 Feb 2025 12:45:07 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Feb 2025 12:45:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZVRuLcHSr93UNbzqKTl2D08x2rRssfyyUlON17kkXDGprSBLxn7RIgngwThFcHvpGFf7AiQC35gyr3YkC8HiB0qvvTvnHt7gWydqeWXDEjq/v3xzgs1MX9AIlKKIXnHVgFxuPlPBcgy0ziyvlQBcPBq/oLJ1hxIjVQw2cqtu9bAbbCG2+ehUi9wAxsoH9Diad2Nyj95u3SFOsPQ6FS+8LvJGdvkPiHWi7OquN0+mBK2ABPF0GzlX4Td3XGCFzgvT8h0KbKC35EveyUuBXL+8U2t+zOsf/KOCpdu/5ONoFOyWH/gL2/Qo0l8xLkW+R8gpCOKZ4pZ5eam79/dlHfUysg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7yodIklJDZPi30uNHpdQaDsCpyUY1hep97wv/RV4EMQ=;
 b=uqqvgGounoNU7OPRzrLlYGZs8cxILm8C2Y6UTy899OQVdYohIjZRyEKpHu4ThnO1Vp/HAft5SLRc5xrTMlHxcaT1vfLiXvfXg83xR38RBQYaDcgUwHHZWgQcHW4oXWsJx99E8KwG2QN6nYX9AnNpAXNNz/x+iDp68Rrxz9B45jzHUEZiIAdZBGeItVqkUedxNU72DU1je+07cRiqDbEmIRn2m5O4FekQ1ufrqrkb9uomw+LIAibdlktnYBl4G62KFTvTrrVHPlzZU+bHecFkdp7xcCxE5q1S8gcTlnn1wUCSbUQK9m1MiSKLv1C78/EYb9CVE4S/lna/1XIuzVmgTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MN0PR11MB6232.namprd11.prod.outlook.com (2603:10b6:208:3c3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Fri, 21 Feb
 2025 20:45:05 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 20:45:04 +0000
Date: Fri, 21 Feb 2025 12:45:02 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 4/7] drm/xe: Define xe_ip instances before
 xe_device_desc
Message-ID: <20250221204502.GY5109@mdroper-desk1.amr.corp.intel.com>
References: <20250221-xe-unify-ip-descriptors-v2-0-5bc0c6d0c13f@intel.com>
 <20250221-xe-unify-ip-descriptors-v2-4-5bc0c6d0c13f@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250221-xe-unify-ip-descriptors-v2-4-5bc0c6d0c13f@intel.com>
X-ClientProxiedBy: SJ0PR03CA0057.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::32) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MN0PR11MB6232:EE_
X-MS-Office365-Filtering-Correlation-Id: c0981f3b-605c-42a3-6c51-08dd52b89eb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?k9hS4MIobD0dxnhnT81SZ7KZ7E7587Ql9J3KKhOyL0RvavFe9CdcyxrPnGer?=
 =?us-ascii?Q?2uqbspm8E2a32jNHrHVQ7Kwlr5U0MPNZq5q7f6RZoxpmgGXD0fmcWo3L7+8G?=
 =?us-ascii?Q?nBOoaek2vKxsa37FvjsrRoyypUUbwSc8dS0Q/4r2UIbWPCRwwRlf6oG8T16h?=
 =?us-ascii?Q?0s2eQNQTWm4rh9VWSTKuJkzjiNnUFmtH2L2vTzqHnz7RD8S5gUya/MUpLy1p?=
 =?us-ascii?Q?n4wXuWKMWt50NgdaJXW1s4iIsWSYQYEVYIDpDsgp15uLFAo9cf2r74f6Teov?=
 =?us-ascii?Q?Y9Pul51/9NwnUWFAGhrMUhuFCAv/hgYra/QPFPdGcXRwormzrguyuzIhVA9Y?=
 =?us-ascii?Q?vgyorlXrH10U7cJaunh3763BOvoZTBZfk0ye1F35JC8Frr1bh1o98E8AWy4/?=
 =?us-ascii?Q?JcnL6vBTcX6oDdyENCFIMq0lsdEGrq2Xf+4ArwJv1UsntJgJE+FwvGoEJaTw?=
 =?us-ascii?Q?P7kM8WnLfeW/vy+3bBNb6Hi9C4znaZVn0+p9TrO3Xq+YU3k9I84F8PqZtGIj?=
 =?us-ascii?Q?efsPTpbgH8Zb38oFi9WFAlG1u5Ke0R1c5pOciqRixWl2z/Wy+EF0jD+mA1Fy?=
 =?us-ascii?Q?8YIuwkjwL51SQZNxgIo4M/D+H5o6a325mss8hUz582W8pTcf/ftWwI/8YGHp?=
 =?us-ascii?Q?R77gHyTAaJFgkk+L10b3wx+hVZh6tuuSGRnaYiZqMjbo+of/euX6Hkr1sUfi?=
 =?us-ascii?Q?ujtAgsxgNynV75a4JdCgCF7GP0p05ykFVskdOunFnypyM/dsXzLjodWS9gPe?=
 =?us-ascii?Q?b/Ms0PSZaeQC+A4VL6abvP04iJvPqG8NQAygZIo/Vu4jSh92Jn0mGAXGWQtk?=
 =?us-ascii?Q?tag2zXOi5gtDE5zJSemEidt0Jmqhcq9S+ppZHfop5Z+PbQlYTfAOHfjOcq5g?=
 =?us-ascii?Q?mLcFN5LAkW664jY2IumZZsKdeO9bLNu21WEO3u6BaQXfcadMi8cYt3uQF9T2?=
 =?us-ascii?Q?5pTfYGk7yLZGjkaOzkqfK+jDrmNljJTZnARsQIxMA9H62CN06JG6Ed6Dvln6?=
 =?us-ascii?Q?kVcvM9ZGiUZ4bIsuGpzlivCCkVU30J9atsupyvM1Bv6p4dOy6FUA9VhuVvOr?=
 =?us-ascii?Q?rxyOFHuwFlax4gCTKERXZXs3ABKhbPJg76ulaQdu7wItDE+HK9bIknif2cYH?=
 =?us-ascii?Q?AcMHtb8VlqVtn3CCPq+aG6otNw9OBtRmOm7k3xNm4Xx2C6hWx4f1eGU4XUCX?=
 =?us-ascii?Q?bbHwa4SEcg26/XDBYOszdROPJh6MRi1LpnCaaYYjiaU4Lsc7KlL3eBAoJcsr?=
 =?us-ascii?Q?GstclAOxS2cZrOraGmWo/cJlsnexuB13ApXQRWK4NJBUAfPkiQ2ZhQ1VEwJP?=
 =?us-ascii?Q?zcDrLjqQyFJ+GXQGxH54rJ7u4XbnQ9Pm08s4oYzs1OwS1sA3V0zkOw+Bjpz4?=
 =?us-ascii?Q?3wuy3ZHGa2LuitGTBKMLXul/bNoi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lyqcPofKRZzA2SYCClQuhCjGWnh/CTmM9o5i+tPPTKsXbN4Ce+nlE3d3em72?=
 =?us-ascii?Q?4JI6fTKsH9tEW/yKtYTgVdEKmAhUpcEFXGt/Lby3DUpBEs7jGgTQ8+M1eSzH?=
 =?us-ascii?Q?zqegbUwM7jLzEiHpCEMV28uvT5l/nKRKsAEzCbZGmpXzJd93aY10yc+BE9DL?=
 =?us-ascii?Q?LYwuPTlRKbPf91P5a/rjP/qbqtZbFDfIsfvWmFF3YNvJo2vv5N5GJ2/TsBSf?=
 =?us-ascii?Q?Q9r0tk/Fpsoymeo5wlW4K+hYXKfdgAFjF2ZO6l+NBV7idUOwX+9N0wiDkx8D?=
 =?us-ascii?Q?4m4jpIDidWMexWo8KKnffoFd7ZwDgIFL//r1PQl0oaXrwIAmFb5sX9wPRej0?=
 =?us-ascii?Q?aLjMaHDPYrwiUJzfe0R1oUJ/k54jFiZWfnsgLT5cowwWy0L+X+EoyuwVZvp2?=
 =?us-ascii?Q?CsBl/zGzKMAsLnc4gvh2GCmPzE34joceQUjtz2eXQLlng3KICb8CqB4SxpVb?=
 =?us-ascii?Q?VilfKANTFVre5qymI3vjSURaCcP6b2oOSJRC17oEkdEeV14+lo8VWRJRN4n2?=
 =?us-ascii?Q?EY5Fw+7r/DQNnQmLa1nTS+3LjIld68GRxDNtsz5F8dDxvCxN4l79m7DHBqAH?=
 =?us-ascii?Q?ervbEI/8Ksj6kul1y95b+eqQJJCe70PYlxd9HA5aMvZlxWcnq9HDQmMc0Poc?=
 =?us-ascii?Q?o0QllwFoW9LBzKfskJaoLg3B4t99xPEbhCbq0/4ZknQ2xjQlxV4dEuDOC2As?=
 =?us-ascii?Q?0MMPI+ekEf3Wk3Ah609b+dbG1KapnxJgwwZhbRRjjr8wSYlkeDLg6L3v+GWM?=
 =?us-ascii?Q?rOe3zYdwbONt6ElyFYiW6hc1b/JuT3PyMH4eWGXYATwpdtL1LyDLEcUVujgv?=
 =?us-ascii?Q?scQh+zEz+byXpF4SR/D2l2BIYMazx4Zli6i68npi4MpaA+NsVolQmCJWUGRB?=
 =?us-ascii?Q?j8sjnu5wBodhFrR2OaNXUu9WJTShqHOdKoI6GDl+pCCuevezcv6bXoFDWeqV?=
 =?us-ascii?Q?pastWLdX5wHQPTjBjx90sMR+oToyTXUoMFeLd0Ypn5ESbyjimGluXaiPbCdv?=
 =?us-ascii?Q?rLdVLK1Cyb75aynlyoJxs7VTwtU06OwnSENB6hLcik63qPX3nWf7MqWr+MqO?=
 =?us-ascii?Q?wrtI0Rp2lK5pyXIrikUX3YQC5674jHOt+5F5EncH47eEcY5SWJyRytXjL/7m?=
 =?us-ascii?Q?K6345hI6mb+5jGDRqGaf2WLcwuSEKPsq4MhGeQzloJmT+3UYTKWSMPD/sOrN?=
 =?us-ascii?Q?ekY7i02gKOSQJMdSFpBUsd8/LmB5bK1mWClfA7XUMJzV8qIZWFmLWlE0jEl6?=
 =?us-ascii?Q?eH5g7EhFayW84hyxv62T3Ke1L0IHhpmEidKOUjU3MkIGXhejToz5Eo/B/Tu0?=
 =?us-ascii?Q?VH1XJij2aT6VT9nLn4eXoBxHlIFsMdeRnsSqSaq0TLCxuM1ODELj58FvL1y8?=
 =?us-ascii?Q?dahg57Fza80PsaOuE16D0kXfjnT9SIDS7Q15lzlZVLugoRFWaL4zsP3F5cdz?=
 =?us-ascii?Q?X1ZWUEVQWZQJPGudKjAvhL0GXIafUW9d5KJcVJt8o6DEstwXMUb4G9CVSxDk?=
 =?us-ascii?Q?ZmqYAEOh6ZSSzhwuDhYl3FSKScZcbOuNsU3QvyQvwYTPZwA7DfY7ggW2AYys?=
 =?us-ascii?Q?KPzq1n81qZMpb/HYPaekSL+KBaVt+jBG0S4DyY2aNXHEB5PRvmwA3ptMpyag?=
 =?us-ascii?Q?Cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0981f3b-605c-42a3-6c51-08dd52b89eb8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 20:45:04.7966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TGR1V6PUdv+EINugbCItMDdefQnAzTRTBS0bZQb7QQMIsNIlOd1+LCOSwbiB80pYYVLax4Si9EUO2mB1/nJgdgoyLJ2VQeXHtl6gTooK1X8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6232
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

On Fri, Feb 21, 2025 at 03:51:43PM -0300, Gustavo Sousa wrote:
> We will soon update the code so that pre-GMDID IPs are also defined with
> struct xe_ip. Since we will need to refer to them in instances of
> struct xe_device_desc, let's move up the current instances of xe_ip
> (GMDID-based) so that all IP descriptors are kept together.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pci.c | 38 +++++++++++++++++++-------------------
>  1 file changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 0476e16da8644711ab7d6eeef37add732a0b75fb..2c00b37e2e835a7c2edad1475a2b76964ee85b8c 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -201,6 +201,25 @@ static const struct xe_media_desc media_xelpmp = {
>  		BIT(XE_HW_ENGINE_GSCCS0)
>  };
>  
> +/* GMDID-based Graphics IPs */
> +static const struct xe_ip graphics_ips[] = {
> +	{ 1270, "Xe_LPG", &graphics_xelpg },
> +	{ 1271, "Xe_LPG", &graphics_xelpg },
> +	{ 1274, "Xe_LPG+", &graphics_xelpg },
> +	{ 2001, "Xe2_HPG", &graphics_xe2 },
> +	{ 2004, "Xe2_LPG", &graphics_xe2 },
> +	{ 3000, "Xe3_LPG", &graphics_xe2 },
> +	{ 3001, "Xe3_LPG", &graphics_xe2 },
> +};
> +
> +/* GMDID-based Media IPs */
> +static const struct xe_ip media_ips[] = {
> +	{ 1300, "Xe_LPM+", &media_xelpmp },
> +	{ 1301, "Xe2_HPM", &media_xelpmp },
> +	{ 2000, "Xe2_LPM", &media_xelpmp },
> +	{ 3000, "Xe3_LPM", &media_xelpmp },
> +};
> +
>  static const struct xe_device_desc tgl_desc = {
>  	.graphics = &graphics_xelp,
>  	.media = &media_xem,
> @@ -362,25 +381,6 @@ static const struct xe_device_desc ptl_desc = {
>  #undef PLATFORM
>  __diag_pop();
>  
> -/* GMDID-based Graphics IPs */
> -static const struct xe_ip graphics_ips[] = {
> -	{ 1270, "Xe_LPG", &graphics_xelpg },
> -	{ 1271, "Xe_LPG", &graphics_xelpg },
> -	{ 1274, "Xe_LPG+", &graphics_xelpg },
> -	{ 2001, "Xe2_HPG", &graphics_xe2 },
> -	{ 2004, "Xe2_LPG", &graphics_xe2 },
> -	{ 3000, "Xe3_LPG", &graphics_xe2 },
> -	{ 3001, "Xe3_LPG", &graphics_xe2 },
> -};
> -
> -/* GMDID-based Media IPs */
> -static const struct xe_ip media_ips[] = {
> -	{ 1300, "Xe_LPM+", &media_xelpmp },
> -	{ 1301, "Xe2_HPM", &media_xelpmp },
> -	{ 2000, "Xe2_LPM", &media_xelpmp },
> -	{ 3000, "Xe3_LPM", &media_xelpmp },
> -};
> -
>  /*
>   * Make sure any device matches here are from most specific to most
>   * general.  For example, since the Quanta match is based on the subsystem
> 
> -- 
> 2.48.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
