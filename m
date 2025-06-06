Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE3EC5AD49
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 18:49:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81ACE10EC51;
	Fri,  6 Jun 2025 18:49:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RD8CXuQK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FDB910EC39
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 18:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749235785; x=1780771785;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=s4P5vPINcCQPEy8t8II5TIFVAst1PHwbTlIWKfld4fg=;
 b=RD8CXuQKNCyO7/7QVY81xJEE5qvQHFXo+rzqtg/ZyAfldj5kecA3v6iP
 +BMmQWMm83Q29rms1sKmVt0dUUoHum04b0qeH+4rPzMXWGz0PGLuyPTeu
 BUw0PFz/Uf42/eI5HkTsyvvTYLMj7CpNqkv749Hbf5KA8m0XRcKdrZT9v
 zWIwa8Ya3fKDlAWICpS/gZ/CweSJDmkV3fJL3+4rTKVAg6Lg8X5ayWRVP
 aAdUkPcqJMY93XwsrdTURw780shT00COrvxvkSg2w6kHqrVEj7cSmAX7w
 Is7oRx/sul044GAr7WG7wXtHX5shcwIMw6KdKmYCvuJJhN4Ws5hzR+1/W w==;
X-CSE-ConnectionGUID: B75JOTvUS+qHzkn+tlWc2g==
X-CSE-MsgGUID: N7ZDDYaBRdmZPu6C8+YPvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="62052505"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="62052505"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 11:49:44 -0700
X-CSE-ConnectionGUID: Lr+bitu+SnmlrZOda8AUgA==
X-CSE-MsgGUID: qx57bWihRiedHzmWzWXeiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="176849886"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 11:49:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 6 Jun 2025 11:49:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 6 Jun 2025 11:49:43 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.56) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 6 Jun 2025 11:49:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ugRFr93WQviXlMbb0qNIvdlCdvkc/qJY1dUXk6bWMzl52btBNy0v7lw7UVD9PWGKaQRue/Oio6zNAnwqZZtOWd/4SOEqItBZ33T2XQCqK8obAvO7X+PtfoasMOHWO+K1ieXlcyxlikfUbrm1k3cQ6Esg5tOgEIupPSvqZlTJeG9X/TQ0i5ayaIUSoK5QN2KPXDe2CPb5lzOMHxWZ5t5X5ddimWHfc8GIe+CgBR5Hg2ZhAeU91xLrGs/rX5jrkEhfmzz5KOZXgmWsWCQeEcBhSeC4h3gljv582S3aCFdt8QZROhdVDb0BO5CZ+BSi23x3rgMHztKCn7J3X3iIXqKwSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YlctYkK5n2jMbrL/6+ugWPt56pYpgUg+aLVSd8NxkkE=;
 b=cdRCdooYG77IgwG1apIjAkYwMjiUa7VxSw8vm5WynxWPn0AhRRxf6EX3duUoc95xsbB8/z7a4v5l+NVGzEe3AQnf/1sO6TqJjG5KUjdcbG7HVQhDm+u/riVvhFgIfDxhB0M4wjSD6poTs7fPzZspeOdKCHK56nzpMYDy1hexyRQ/OOyV5RP3NqhgQb5LpfpwMvDoHQ+iMRBYlXyIXYGqsV+BaAHnIDKIFslr6OTMakIv+fHMQVwekvEK9WRLYVXtSICuQ0nwTTTvFS9S0KCbCiouqXbY5TrJfocrvRlXZyMQLe9/3bK55S1zYCO8l1nvcJtn+tVLUKz4DcFwvNv6sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA0PR11MB7330.namprd11.prod.outlook.com (2603:10b6:208:436::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Fri, 6 Jun
 2025 18:49:12 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8813.018; Fri, 6 Jun 2025
 18:49:12 +0000
Date: Fri, 6 Jun 2025 11:49:09 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= success for
 Small improvements in topology code
Message-ID: <20250606184909.GL5080@mdroper-desk1.amr.corp.intel.com>
References: <20250604202908.769-1-michal.wajdeczko@intel.com>
 <174917286585.53928.14181326621738188412@1538d3639d33>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <174917286585.53928.14181326621738188412@1538d3639d33>
X-ClientProxiedBy: SJ0PR03CA0262.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::27) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA0PR11MB7330:EE_
X-MS-Office365-Filtering-Correlation-Id: a540da51-afca-40bc-971a-08dda52ad43f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/MSIPnx4Tz1oDghndGEeEsJgnd/mUSeaziu6ScczQQcSh11OJPfpU5Flvgi3?=
 =?us-ascii?Q?/I+cnYvXDTGN+rcQC5+yMHQ3PpUiNechOwb0u2+k77YEFvqbF6m5hwrDvxht?=
 =?us-ascii?Q?0mWkRHKygErTGCzg7SwtLoTnDXprY0mkMZPCvyLb28D2MLeQjpicl3DFBYfw?=
 =?us-ascii?Q?SQFCkl2XvNkCM7R5svGxx3SYSgsn6nvR+HdOcswbfUYEa4K7jV6HEVbsQsAC?=
 =?us-ascii?Q?xyuNo7NaFcp18E0dDzmRVcSjPk/nBKdCGEk4SXrxLdx/JyKlx8I1Vxhk9W0B?=
 =?us-ascii?Q?K/KiPJN1+xJJqpjhgs7Wm7l9bHjXI1P1Bu/AhMYBo75uGXGOq5AVZN3XYxxW?=
 =?us-ascii?Q?p9uCvVV9LfCmBxps/qQwUDlGG7wiVG18mxfkuBVMKf3R4Y4PmdCj0yN5opJF?=
 =?us-ascii?Q?VwLAtFD554hS1XkEEgYZmePIGK9j/1MGQkaWJGoumyOOU3pD7qp+umAqy4s2?=
 =?us-ascii?Q?nHq4zd+SksQkYZFVNkgbLMalC4Sob+GdBp3IEVveMpA7J4vYlN9HQ5dVJC3J?=
 =?us-ascii?Q?yIz4c4I0taH8ylAHIyK5Z355aNDKtHBR7O8swbBVGADi33hbW+wSYTLmviSd?=
 =?us-ascii?Q?d8acC2J0DKVTrdA2uPVL/JW8j1ZxF7GAdlFOMeusd+m9R9yMhzZQjVNTdrEz?=
 =?us-ascii?Q?LzOcDvGLq6JKnWJalFbYCqSCJRjJW4qSomZ46DimQ00lj2L9vvbJO1798VRA?=
 =?us-ascii?Q?H2CnKF59u6pBiAWdyxcNcVt+M+m4xKec2ZL1K8LX8c31I5YRJb5WbCgTyQ14?=
 =?us-ascii?Q?ecmwLjaY1r167aFSKTcoMkBtsGimkoyg/kw/2bLdr1yIjTwKY8AXRIzVPdMA?=
 =?us-ascii?Q?BW6QOf2lA0x3KJKWmR9GlSO/n0cA9eXgomswselUxW2ViuUIe05cqFlTtEZ/?=
 =?us-ascii?Q?HW/nQY6zQCjOHdjNQnL9WppI/9pVyz7mXZUctZymEZU+dOVxNOedGyXSzAUJ?=
 =?us-ascii?Q?48ch5fvebdAqQWidy4YTis5U2w0tXMjAvzgUmAg8lZV954Kja4IsTYNKH1ZX?=
 =?us-ascii?Q?igQsU56boshzIZuP7iLZ8Gxd3LtzlQURGFVWhpoEVOLlUwXTLWqelB1d89oV?=
 =?us-ascii?Q?Ateu8MaFub1iusjzdFFGX7mxD1gH5RCCG7dLm7aCiGOC3b+s8iyMNm4uB5YY?=
 =?us-ascii?Q?I2V7xkE8/HA3n/XlhLVHhABvO2Y6KmwaWH0uewdv3JYiyOFjyhRt2g774Rt2?=
 =?us-ascii?Q?y3le5M8njAlM/W/egyw33FZMuEaIiG1ikN/YB2OIEzwp0GG25WStZla24T3z?=
 =?us-ascii?Q?6Ak+p0d9vx6MgdK9DTqDh/peqerG8D5xQ7rD1YFUix86BoYv4vcDF771yrpz?=
 =?us-ascii?Q?icxUsTbEfRQ++UKqvvxERBF/YwWhnU8pGcjEpdSRLGYZNqrbhOQlJDMR9d67?=
 =?us-ascii?Q?REU98dw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4ImEik/k+MzrKQMRrnsWNF70n3z7+5uly2IXv8yIX5hZcSLeHXtMcgoj4eXY?=
 =?us-ascii?Q?6ejnxCkFHxjPaPq5ZC37QnOwxOm6EQRDz0UkpG81rM8ZTStDho88qDMzNrEl?=
 =?us-ascii?Q?sKdzG3yvJP2JtSbi6FKHdRF2T0ApxNC24pOb2QWbDzjMNOMrHgaE9HBCAPfq?=
 =?us-ascii?Q?mvCguEW5sHscYCkf7eLqUlpGK/M+4GuHrm12tT2FqB/k1xG0aiCmzPJfxmBJ?=
 =?us-ascii?Q?mpHWNHh34iHj+rzISv1XhDucS6dL0wI72fiyrSPXU4aDP0LROpyKyLAuLR4b?=
 =?us-ascii?Q?acPv586X/1Ip5uoZgeub8rp7yDkot8p7ue8PnJ28dlVhFM/dF6N37UcecI+/?=
 =?us-ascii?Q?Y+jCdZoGw0x7Gw2ukPRa5O5uc9F4hc0XXIO9kjwfsjeb+Is/1yJcG3/4a1eX?=
 =?us-ascii?Q?UmiS/U1vHVN3/zcvP596SV1cMSYOk1sT4rFhf2rE10aqbsnG8u//vdawzHec?=
 =?us-ascii?Q?8ZaGzV/uWfTgrUc1B3u6KNd/LIaTDs0QYyltBmQNr5Qzcn33egEEyQC/CNeR?=
 =?us-ascii?Q?suBToJw38cw8C8b3e2NfBkMjboBz9IaTKyDS5K7M7IP2dwsLW0FFKG6oCPO3?=
 =?us-ascii?Q?FOsIhU+lRxucxaIFV1AnOLw0fSyL7ML1vTy8v8IeQWWgeaKJFutuAREb2GEA?=
 =?us-ascii?Q?o1qsvUHSvXl3V0HZ/KA9COWv6hD9f5yQNxpwhz2DwupKW2M24m5wRki1jqn9?=
 =?us-ascii?Q?NKoKn1mvxPyeVnhClUvcC0mOS4cFpCPkRdpE9dqa9Cs5zAr7n0avjNy5n2lj?=
 =?us-ascii?Q?gVLgowo8qiXhu+w7tL728qSVzqWSb+30VvKk7ElN/2HreNb8O5KcEomdfMC6?=
 =?us-ascii?Q?VCGZr0adr33rLmX1ov5Nb9LhCipSl6jhc45HCDPJCVUIEbCLDinXeP0XwOno?=
 =?us-ascii?Q?Xjso85vjosJhZka4znJWhJKlAYFoGJ+M/fYSou35yIebHcusCiJGELT6l9I8?=
 =?us-ascii?Q?jelqkwMbTFnrVTW+nYuyyteScp/eIxO6pp769qqWUdX5lSGERR04tBiPm10N?=
 =?us-ascii?Q?YM+qCKmRXBvaZknV6DfB6Y0XPKsZuJOrJFoELOMekLc9L244FGKEJR3wIGjz?=
 =?us-ascii?Q?iOMj+EwHMF8obOuMAavVQoETd3nXJpy1b6Oo15oNDJdqwulH3SQHolPw0y47?=
 =?us-ascii?Q?hABCRESwVObtWOKfaCDPT1MLymXAgjCNzHTffD6CHXWua8D52/tUuXWpmQ20?=
 =?us-ascii?Q?FBZUhat/Ll45VoMELFGFhoIcaEKpm4HMjFOra4shQLccuT82lFj+nl02kF7U?=
 =?us-ascii?Q?kDT+XZgufxZUv44czzgV5YEiHyJOxRWBAUmMimXvt7cNk+3NKekaC9UUk0TJ?=
 =?us-ascii?Q?kTwbBq9PsAexGLO06XGYsfMOa4UXqakjN0YNWw3tp9PWLFg4/cq8+1FLe3iM?=
 =?us-ascii?Q?EzXU7SAIV1HSt90/Bs3ZoATXlSwowUYU+CyUpiR2OMNMWPPSpMkigzutU0jO?=
 =?us-ascii?Q?hpMcMUrZwrLKkUUGQSFdnfn3+3/k+7QO2McHV5qqtH50tBSFhaMFxrRVEpnf?=
 =?us-ascii?Q?LGz0mzFrjqHDuY0ceAkYJfGinnnYfQW8T1/ZsiWzahspx4ppmtmds1UsAfad?=
 =?us-ascii?Q?tIuIFeo7oN8k4oxOy7fGRR3/Pz/E2HAZhyqGC0953tQv5WQn3DlB+gjso16w?=
 =?us-ascii?Q?Cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a540da51-afca-40bc-971a-08dda52ad43f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 18:49:12.6891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7obWId3iWjJpkTLFCfMf68/9M1IZMaxX889X4ivbIWAHP8yBVaHLvQ5xfi6Glw5/BvrSJlbf/L7OHaWig1f/kS7WFhvP2ith3mUu1DFYcYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7330
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

On Fri, Jun 06, 2025 at 01:21:05AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Small improvements in topology code
> URL   : https://patchwork.freedesktop.org/series/149851/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11_FULL -> xe-pw-149851v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to drm-xe-next.  Thanks for the patches.


Matt

> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-149851v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@test-cursor:
>     - shard-lnl:          NOTRUN -> [SKIP][1] ([Intel XE#664])
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-lnl-2/igt@kms_async_flips@test-cursor.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-lnl:          NOTRUN -> [SKIP][2] ([Intel XE#1407])
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-adlp:         [PASS][3] -> [DMESG-FAIL][4] ([Intel XE#4543])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
>     - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#1124]) +5 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-lnl-2/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
>     - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#1512])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-lnl-2/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:
>     - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#2887]) +4 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-lnl-2/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-d-dp-2:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-d-dp-2.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#3432])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
>     - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#787]) +41 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][12] -> [INCOMPLETE][13] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_cdclk@plane-scaling:
>     - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#4416]) +3 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-lnl-2/igt@kms_cdclk@plane-scaling.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#373]) +5 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-lnl-2/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
> 
>   * igt@kms_content_protection@lic-type-0:
>     - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#5176])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-lnl-2/igt@kms_content_protection@lic-type-0.html
> 
>   * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][17] ([Intel XE#1178])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-bmg-5/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x512:
>     - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#2321]) +1 other test skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-512x512.html
> 
>   * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
>     - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#309])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-lnl-2/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
> 
>   * igt@kms_dsc@dsc-with-output-formats:
>     - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#2244])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-lnl-2/igt@kms_dsc@dsc-with-output-formats.html
> 
>   * igt@kms_feature_discovery@display-2x:
>     - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#702])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-lnl-8/igt@kms_feature_discovery@display-2x.html
> 
>   * igt@kms_flip@2x-nonexisting-fb:
>     - shard-bmg:          [PASS][22] -> [SKIP][23] ([Intel XE#2316]) +5 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb.html
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html
> 
>   * igt@kms_flip@2x-plain-flip:
>     - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1421]) +1 other test skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-lnl-2/igt@kms_flip@2x-plain-flip.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
>     - shard-lnl:          NOTRUN -> [FAIL][25] ([Intel XE#301]) +1 other test fail
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
>     - shard-lnl:          NOTRUN -> [FAIL][26] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-bmg:          [PASS][27] -> [INCOMPLETE][28] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-8/igt@kms_flip@flip-vs-suspend.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-bmg-2/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#1401]) +1 other test skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
>     - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#651]) +3 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
>     - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#656]) +12 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html
> 
>   * igt@kms_lease@simple-lease:
>     - shard-bmg:          [PASS][33] -> [DMESG-WARN][34] ([Intel XE#3428]) +2 other tests dmesg-warn
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_lease@simple-lease.html
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-bmg-4/igt@kms_lease@simple-lease.html
> 
>   * igt@kms_plane_lowres@tiling-4@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#599]) +3 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-lnl-2/igt@kms_plane_lowres@tiling-4@pipe-b-edp-1.html
> 
>   * igt@kms_plane_multiple@tiling-yf:
>     - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#5020])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-lnl-2/igt@kms_plane_multiple@tiling-yf.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:
>     - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#2763]) +3 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-lnl-2/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html
> 
>   * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
>     - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#2893]) +2 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-lnl-2/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
>     - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#2893] / [Intel XE#4608])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#4608]) +1 other test skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1.html
> 
>   * igt@kms_psr@fbc-psr2-cursor-blt@edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#4609]) +1 other test skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html
> 
>   * igt@kms_psr@pr-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#1406]) +3 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-lnl-2/igt@kms_psr@pr-basic.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>     - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#3414] / [Intel XE#3904])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-lnl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#362])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-lnl-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
>     - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#4837]) +3 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-lnl-2/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html
> 
>   * igt@xe_evict@evict-small-cm:
>     - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#688]) +1 other test skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-lnl-2/igt@xe_evict@evict-small-cm.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
>     - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#1392]) +2 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-lnl-2/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html
> 
>   * igt@xe_exec_basic@multigpu-once-basic:
>     - shard-dg2-set2:     [PASS][48] -> [SKIP][49] ([Intel XE#1392]) +2 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-466/igt@xe_exec_basic@multigpu-once-basic.html
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset:
>     - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#4943]) +8 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset.html
> 
>   * igt@xe_mmap@small-bar:
>     - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#512])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-lnl-2/igt@xe_mmap@small-bar.html
> 
>   * igt@xe_module_load@force-load:
>     - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#378])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-lnl-8/igt@xe_module_load@force-load.html
> 
>   * igt@xe_pm@d3hot-mmap-vram:
>     - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#1948])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-lnl-2/igt@xe_pm@d3hot-mmap-vram.html
> 
>   * igt@xe_sriov_scheduling@equal-throughput:
>     - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#4351])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-lnl-8/igt@xe_sriov_scheduling@equal-throughput.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@crc@pipe-d-hdmi-a-3:
>     - shard-bmg:          [DMESG-WARN][55] ([Intel XE#3428]) -> [PASS][56] +6 other tests pass
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-bmg-4/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
>     - shard-bmg:          [SKIP][57] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][58]
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
>     - shard-bmg:          [SKIP][59] ([Intel XE#2291]) -> [PASS][60] +2 other tests pass
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
> 
>   * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
>     - shard-bmg:          [SKIP][61] ([Intel XE#2316]) -> [PASS][62] +4 other tests pass
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
> 
>   * igt@kms_joiner@invalid-modeset-force-big-joiner:
>     - shard-bmg:          [SKIP][63] ([Intel XE#3012]) -> [PASS][64]
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-big-joiner.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic:
>     - shard-dg2-set2:     [SKIP][65] ([Intel XE#1392]) -> [PASS][66] +1 other test pass
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-dg2-433/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html
> 
>   * igt@xe_pm@s4-vm-bind-unbind-all:
>     - shard-lnl:          [ABORT][67] ([Intel XE#1794]) -> [PASS][68]
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-lnl-8/igt@xe_pm@s4-vm-bind-unbind-all.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>     - shard-dg2-set2:     [INCOMPLETE][69] ([Intel XE#2705] / [Intel XE#4212]) -> [INCOMPLETE][70] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_content_protection@lic-type-0:
>     - shard-bmg:          [SKIP][71] ([Intel XE#2341]) -> [FAIL][72] ([Intel XE#1178])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_content_protection@lic-type-0.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-bmg-5/igt@kms_content_protection@lic-type-0.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
>     - shard-lnl:          [ABORT][73] ([Intel XE#4760]) -> [SKIP][74] ([Intel XE#1397] / [Intel XE#1745])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
>     - shard-lnl:          [ABORT][75] ([Intel XE#4760]) -> [SKIP][76] ([Intel XE#1397])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][77] ([Intel XE#2311]) -> [SKIP][78] ([Intel XE#2312]) +8 other tests skip
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
>     - shard-bmg:          [SKIP][79] ([Intel XE#2312]) -> [SKIP][80] ([Intel XE#4141]) +2 other tests skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][81] ([Intel XE#4141]) -> [SKIP][82] ([Intel XE#2312]) +5 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
>     - shard-bmg:          [SKIP][83] ([Intel XE#2312]) -> [SKIP][84] ([Intel XE#2311]) +9 other tests skip
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw:
>     - shard-bmg:          [SKIP][85] ([Intel XE#2312]) -> [SKIP][86] ([Intel XE#2313]) +6 other tests skip
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          [SKIP][87] ([Intel XE#2313]) -> [SKIP][88] ([Intel XE#2312]) +9 other tests skip
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          [SKIP][89] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][90] ([Intel XE#3544])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          [SKIP][91] ([Intel XE#2426]) -> [SKIP][92] ([Intel XE#2509])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
>   [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
>   [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
>   [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
>   [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
>   [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>   [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
>   [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
>   [Intel XE#5176]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5176
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11 -> xe-pw-149851v1
> 
>   IGT_8396: 8396
>   xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11: 9becf23dcd5721a2ddb80f01d4964a1657117f11
>   xe-pw-149851v1: 149851v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149851v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
