Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC5E5C25B74
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 10:39:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B60F10E853;
	Tue, 21 May 2024 10:39:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z0VJ9jy4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E938810E853
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 10:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716287946; x=1747823946;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6ImmY2nsd2XYk+VQB694HStc+aerat7PBLldtf9u6G0=;
 b=Z0VJ9jy4ZEl+g5ECkcwgV/wK32GuvuT7QDgGku8nRPf7jADluTZQMRER
 O4TEcB4Vf4W8Y52ScLuLA8bnoyfomUhH+ssfNgNT0zFW0/ndGwGyrp+aW
 /HKC2iryL/zM6klc5ZFX442fK/4vH417pkTH3BJzFPsXrtoCSC4exmx3K
 hd10ma0XkV1XsAxL2VcQ9qvFcN2UroCg0X4hxjMnJDSm11lAYtQZDBSzr
 2+skUPPtGQmtXpTLgxwmvoZ/HP7gv1eG/EJsbzSDl5xGylnG8voqLUjAG
 Vf3YjHiy9UqCeUGEOUhGPR1AOS6nLitP4xp4P7eSyzdkb2WyZxIdUK6OI Q==;
X-CSE-ConnectionGUID: tMwlI2RlSVCuDRGH4GxMLg==
X-CSE-MsgGUID: HEyo0gr6T+KnoYHYY90gGA==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="16309167"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="16309167"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 03:39:05 -0700
X-CSE-ConnectionGUID: fDzXcns7QZmR7+goeccigw==
X-CSE-MsgGUID: 1bQTtcLqRymJnDf2FwQQzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="37649606"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 May 2024 03:39:04 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 03:39:04 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 03:39:04 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 21 May 2024 03:39:04 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 21 May 2024 03:39:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hD0WPTQOGOU1vlovEjbxGEXXNz8OsnuUc08LX9BquWJyatT9brpZK36kaLheRgTjngaw3QDqm+N/kOvhR1Dib6HSpfJegf15M4TOIlXjenICjfQCrVAxwSMWraqoQ6MxbBQ2kE4ZH3Gzhk1v3znsNDfvsAlka/+MPb7S+NjYYxOSeryjWH/23D/V74uxAURomVl7a4hmRKIHB6QW4oMFu48QmVqLokCRF3it22LRo7gAYtIYtQtlpe83IMOa1Qz+Mu77sdcNOVufgoQp/yyCvvhjem2FIE+L4ou91hcAH6HUHBjhhNGa6XZArexsQu2EwqysyiXuX8cE+9Vlt+M3dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2unA5z11OxBD8f4oKYzdjsuTY0UVlhpdc2+2kR4lV8Y=;
 b=K6MJYFpYhB9gluFrFUWvji5wwuHBjSwLiU7AA7NXSjMHnaX030stO1+R/ncV2vkZNwqtiZqgKNzW2dvhmrRsd8qdiU4nkXix+2xu5kQ+6IuErpfhs8EDWG5pYT/mu4dBCT3ZIj9CUjPA98Np/7m+zwFZOnFNVy6Udz6BiDnGMfqZMteHTUjO67lYEAoCxFbMWWiPfaMKKJbdZAvA4/p73UiziTd/UQuNbw1oW3XpivpVCEjyTuzgZi9wjDarGw4yq3oA4u4pezTSnqtlBRPo49Vn6ZhP3/5BOtDCucDlSCSwugxtnmdVl6vNunoIQz8MtPbQFkmlzgScHJYm/YNYxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by MN2PR11MB4536.namprd11.prod.outlook.com (2603:10b6:208:26a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 10:39:02 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%3]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 10:39:02 +0000
Date: Tue, 21 May 2024 12:38:55 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/4] drm/xe: Fix xe_uc.h
Message-ID: <Zkx5v_EkXjo8vF9Z@fdugast-desk>
References: <20240521102828.668-1-michal.wajdeczko@intel.com>
 <20240521102828.668-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240521102828.668-2-michal.wajdeczko@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: MI1P293CA0013.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::15) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|MN2PR11MB4536:EE_
X-MS-Office365-Filtering-Correlation-Id: 3540ebd2-139f-4122-3724-08dc79823ae4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PIL70Yje6xQU7EDu0RvD3ojMTPViFWlZ4+pfQp0wPslT+Rc5/pTWudbHGpGq?=
 =?us-ascii?Q?muNS+i2Rld2OeVoYHBQz/ndbe3MELfAVn9nmIlJzTaeZqFsbsq0yZ2fp8I52?=
 =?us-ascii?Q?MEe2MEh7UaBhzdMfDO1E4LvmBYpu4xMiw5B3gKQk97WUAs6G1v16rKFLJvdv?=
 =?us-ascii?Q?TfGS5Wj5lyzkP8EYbawR+ywv2oXLYkAkHbjV+xsvRZlAoN7NsUbHn4kQn8NJ?=
 =?us-ascii?Q?TRU7EYWuOSMFZeXkYRH1wdnldOm17OUVrMJU96/P6V5QK86zkdN8z+e+jur2?=
 =?us-ascii?Q?nyuUhI4YYYbtBeyQLNJYjD2v/+684WQQ9BrGFpWZ1y7REXwW7jDF1JFV/vWY?=
 =?us-ascii?Q?Z1SNtyYbRS/TlD5vbssNSuEhromrrNz7756hzeXsvdHWsUJLKp1agSdv6cA/?=
 =?us-ascii?Q?1XWM3yncK7K4Ev57OMSZyMA0bnWG3cx6iOilrIz8KiUaYKFkflnk4/E3Q4sm?=
 =?us-ascii?Q?4a1doDMJWdk350Qw3tpcCfj2Ea4vEAhwyP1bYkwAimH4O1Hl32TEblTaoyPU?=
 =?us-ascii?Q?eXvNNmECrqYBN3Bg5Abyt+RiZSeYrnIDxpvoNwV89P4MMEQ5nYGffCcDk9HM?=
 =?us-ascii?Q?cd/2hNJBDqlwnWKcKOgVqexrGYBA0qFYhDsL4EoGQcShtdvEfrhebWXUxnxp?=
 =?us-ascii?Q?v19dvsi383GFGgaoNTxzpRi8bJ8rqxh0DWoGiqyT1sS0YsReTmS4g1x07L7Z?=
 =?us-ascii?Q?guZAOMeK+5cczCq2v2qIAz4tBUtafPwOvFx3xNkd899br/BYkCNnrAu1iDea?=
 =?us-ascii?Q?wT+s93Zw1Yuz/TnqAMR5K3tkuPN+qZkfcPhrzttGa6cKggS63nhsNaBs6GtS?=
 =?us-ascii?Q?rbXt5jpFuwl+/DyL2dOCPqoMK+gW8kxNbGGjEk9ZEiz2k9g/aWi1ap1wQIEj?=
 =?us-ascii?Q?CjnZInrtvmh5PqMv5ad2m8Fu+5TYvrUrm09C2oR6gw3IwjdPChvjLXykCrfT?=
 =?us-ascii?Q?mjB9OfOihDkv4peZwOjLhBs9dT7IfEf5uoR/gpypA5u3tByk+s25uUnUsEfg?=
 =?us-ascii?Q?OaYvLmaYKNjHjyHJfLCraxtALE6mdi7F/FCTPI+3bg/TkXbsSpaczFaDJ40U?=
 =?us-ascii?Q?ojgZfKc6p2YGEPOY/LyK0Ii0oDfcyymJpjejI4Ccs/grgFCbhv2itFnN9Fda?=
 =?us-ascii?Q?2oNTkcFpEDYKXSVhR7tW3Wxy4Q41gAcg4dEhvyTeWb6cXSjkgrgwZFMk56po?=
 =?us-ascii?Q?o6cicGVdpD8WVccJYd5VnH6PJSEhd2YjnayQDnBYcxBpAAMhwe/HsxS3GvBZ?=
 =?us-ascii?Q?nJM7ZhT2qkI/boMiuo0Sd2HO4D1O+5y4VYWcVPst8A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h6EYekdJLXidOEYjDE83lhg5xrXLCxaOJdwahRjOAhHaHEimphJ+2A+efF1h?=
 =?us-ascii?Q?OXnLm/slTlgOaPF3I3CLLSfT7PwyLhJF5al/1qMtZ3d8ZVUyc1NNqg4PNwga?=
 =?us-ascii?Q?jMDgjFUfatUGeaZ9/FnwxS2GuH5XmPGrXlJAlJm7n5ljk0b8IabHM2b9iAi/?=
 =?us-ascii?Q?Falkv99tt52w/+Z7xsEGqqX14GgU6wlUzFXd2aaUAYHJ1M35hGuK4pULcbLi?=
 =?us-ascii?Q?dv0KlBx3YnedlOThmYVM6odM3M+jVzi2/NGhkYrtzetA40JOeL2kSVWMRt7k?=
 =?us-ascii?Q?taSYnEmmd8zezPsds/DvEqMnC3vBEkhdvfKr/9ijYed5QTKReSSuZ/5S8+5w?=
 =?us-ascii?Q?0NNuCKQFs9jO7pFhIlwqqxQkEv5t+X/1OWuOIT/a0GKxexTFvdJ0vTJf9AgZ?=
 =?us-ascii?Q?6mpOS+SPieOuRxKLj+GOvY/tjulLLNGxKpiP8w4SJbbeYcxsPTPwXEMTX8UL?=
 =?us-ascii?Q?gaI2Qymt9Mv7tcc8xIogaHVEt6MIHfvu+9jMDXN3tesAMlM/8v6kXw/czf2Q?=
 =?us-ascii?Q?go0xuG0+bv5Dx7V9oyWHtOKnVuoiXDDI9tK5GHHcGepEqGDwuH/4u2Ih1xiB?=
 =?us-ascii?Q?PTAp9paSH+zo0XeDpcyjloEkIM95xIyBqZIlQdMesRTk4wBBKfL7Ytwjqc6U?=
 =?us-ascii?Q?XgYAT/2wpita/oUezZtzE4FNfmOWB0INkcVzigIZCTzaRe9+IiZTlaiPZQ0q?=
 =?us-ascii?Q?V7XIlgOwjVPPlvn8l9Vz7pZXvUnlmdTv5B70Hq2uHCxBapkuO7ZCCRpt9WvV?=
 =?us-ascii?Q?XkAo0/iF4ajkxVtP/PsP1nGUWw/Pj9L+6QBFoDOVrR4W8LXWgedhLqMoO009?=
 =?us-ascii?Q?W8MjxkG774QJ5AGgSPHQA4OKoWTmWQ2QFJVbNLF+Cra2qn5sSHLhu69fbiBt?=
 =?us-ascii?Q?wJLQA2vG+Nw/cIufIflegQnofaCRDZ9KCGSrUHaMJs8tB0XOn/+tKMy17Kyc?=
 =?us-ascii?Q?TxzcUyWYj1m/RpE7KgkZWDEPhSFfSaB1DulB1JdCDD61yQKQEwK8L4aQcd5D?=
 =?us-ascii?Q?CI47UhPp8y7nKic7iSTRk27BEsDFWZ8ggd7U+DxamZJBlcpY+5r+NTalN7DO?=
 =?us-ascii?Q?exgeAFTOBAJWva6hVTTDBQGIHpwvWRdFJ96mDSLEO4sy6OPSjzO7bH23IQ9j?=
 =?us-ascii?Q?K0DlciGdtgki/SmM5uhzsg9A7DOIjKmM39K/Yv+qtuCNF1OWJia5sc9tZx96?=
 =?us-ascii?Q?4GbnHbT6bFlOnzyR07+q4/xKKgddU/AAg1R1U4hJAh0msRy9o94w7tam7L4G?=
 =?us-ascii?Q?J8JoY7Wqtq8wrN9UWzlNndfkzAIzH+1U0MQN0ITrcEYR6Dn/ezCnQNbLw2It?=
 =?us-ascii?Q?FxuNNHq7XnxKyWMWuj5oOExW+cjFzRitpABzdhEbIVvaCCN7wF1Yns8yrsMy?=
 =?us-ascii?Q?s9pbpMyN1jwZO+kUey0Ym+xRTY9MACEzIjOnl+OREBYIKNyMc1PlBXu0tc8F?=
 =?us-ascii?Q?n409G3kZ6zygWYIFeg0LA/2m+NZxJ1qBrPP+Xxe5TZv5BwmJ3bQ+L4tJ9iuA?=
 =?us-ascii?Q?hTYYCG8nk2Mx6Wr6Wc49Kteu3R2wDzdhyOu0zwY0gdy/1JeCtpHTidAF1mDj?=
 =?us-ascii?Q?kBkcW1yDVNSOOGNKVQJ7l6Tix5GJ8ry5a/ggyp2ZnNtzrTKc4ZzWdFXUioMn?=
 =?us-ascii?Q?OA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3540ebd2-139f-4122-3724-08dc79823ae4
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 10:39:02.1312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /4eErbgCtR+hUksw4Q02WmFY1r5XPx1ofyM64GObhEaSaWN64Nma7JTTAbXO8Jjq9SQqSwHRyLETbysekDZYBjuXMGk+vxfgEsp3fh8FyV0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4536
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

On Tue, May 21, 2024 at 12:28:25PM +0200, Michal Wajdeczko wrote:
> Prefer forward declaration over #include xe_uc_types.h
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_uc.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> index 5dfa7725483d..11856f24e6f9 100644
> --- a/drivers/gpu/drm/xe/xe_uc.h
> +++ b/drivers/gpu/drm/xe/xe_uc.h
> @@ -6,7 +6,7 @@
>  #ifndef _XE_UC_H_
>  #define _XE_UC_H_
>  
> -#include "xe_uc_types.h"
> +struct xe_uc;
>  
>  int xe_uc_init(struct xe_uc *uc);
>  int xe_uc_init_hwconfig(struct xe_uc *uc);
> -- 
> 2.43.0
> 
