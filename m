Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D901BC369A2
	for <intel-xe@archiver.kernel.org>; Mon, 14 Apr 2025 16:02:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7732E10E623;
	Mon, 14 Apr 2025 16:02:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eSaJyYME";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65AEA10E623
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Apr 2025 16:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744646572; x=1776182572;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Gf4sVOpwbTAQtnVx+Q/atv8W0q6skol7qFv4Q6uAXkU=;
 b=eSaJyYMEjWcW7b6AbAfnVwlOPI14Ipf0gI7vjbW7ie7NfYIggjJvMEPv
 Nz4Hs+NqSArEPGWTYzoKFwceBTcS5F2aEm17kMgirP/qzp4/F3GpvRjwj
 YtEK3F2JSzd8dRgCDmgtk8sC/zxNcKSLG7k4JZb+YnR3Ai6zOXCphj1/G
 WkAW9oiAKRHHjDFOe2HYdZWPvMJ94xD2ZaJ2MaWY0ckWkPgYbkkF0SeYE
 hjmqnsH3ta+OjIyjrkl9fRB8EBgEyNGSmY+BBp/L/jOHvpds/EJAwxVaz
 I4vTsmlatYky+CTzCS6GdC9ooXrLJIFMDPKz6Oth+r9vPyxZ6lPF44OXq Q==;
X-CSE-ConnectionGUID: HX6xcdN0Rea/yBn4E/LEsQ==
X-CSE-MsgGUID: ZVkaQEhJSFu9IHHxQ03P4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="49780350"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="49780350"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 09:02:31 -0700
X-CSE-ConnectionGUID: 00XIzY9BTAesQ/RIAtTZMw==
X-CSE-MsgGUID: a/yyVYHBR8+q6UzM6v4dqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="130834526"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 09:02:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 14 Apr 2025 09:02:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 14 Apr 2025 09:02:15 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 14 Apr 2025 09:01:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qlRkAx/349ucXJu5wNK4aJPTLZfd35WEXaDzppGrCe1OdgZjPj3P6M3oei7vuJetPbEawElrRyxk2x/J/Md4ajpGwwTiUvw0ZgAsbiONr7OiIZ+JZryi5kl4ZtC383PTL3HHvPaTooQOLVuDKFG712ISbrebxS6N4jYd+iC+8ORxFvfd0iLSQKtnWg2U6t3GZC9CJlVgB6obqfbEoh8GDgQ7UeDgsz6aqQy6+eX5ZJ3M+Cr0g3bpwle4dmQZWGEGG+g8qn+4Jc+PgTbqCMl7JmkYqTXAn9SmeaW0tvpSS2aSlwT1qicBpTpqVS/QWeHMXe5BxjdmhoX06I1wmMJLIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sfB+M21ZhbwB2QxHT0shnBzoHX7L1iUXMKgIl67qAu4=;
 b=Bi5F8afj5MuHuBSLSwA8evA4kvDQZL/77gqvjI6M5XqCkDWAxswfcS/7C3IMLd/wGZ/104AxoAsTZDkvWM92IHon2+HJ1o/VeBTN9Mg6UY1buw49rtMIL5VyvC4TockFu4zCbQ81+vBfMwJd7jjv0Fg3w+W+BcaNg6LGx1/QI9eiQ8GupabZJzWXIbm1VPHLs0prrmqbTcHFFqDRcnLwFkCROwAULDHVBNK0DIRRR/Ihee464jyMadczGY4SRL8TXfoiVC3wvf7FuDn03yfhUM7jzt+y/2if1itG1Hi+xb0MltF1RLPiIxWoyVTgFEyfH7SdKGFEIa9a84qaZdhfgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB6267.namprd11.prod.outlook.com (2603:10b6:208:3e5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 16:00:58 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 16:00:57 +0000
Date: Mon, 14 Apr 2025 11:00:55 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Harry Austen <hpausten@protonmail.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Allow building as kernel built-in
Message-ID: <5ztkuw7ip5seoonhtnypq4wkpjnh3okq4fzdnbmmsiadt467fv@ar236dcnik6w>
References: <20250412220137.3892-2-hpausten@protonmail.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250412220137.3892-2-hpausten@protonmail.com>
X-ClientProxiedBy: MW4PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:303:8f::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB6267:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e41fe6a-2207-4dac-99dc-08dd7b6d8b57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?PZRYyp0igdIeifCYZM0kgNs9wDw/6hHd+V4hXgKM5NmO9ObFJ31wTvD+sg?=
 =?iso-8859-1?Q?RV+M38tRTkZ6Ku6zvm91bMCqm5Xk6DRfjINsWhudKheEDwE3v3OqEVIJVP?=
 =?iso-8859-1?Q?0tY2/8qudD9JVsSK4nbdzs3frIUBKZ25faZLqMhJ05WXRItjBVRCrUxqQd?=
 =?iso-8859-1?Q?9EN6nPN7427M9uLkrs2pQ/OfI7pKxCAQpaDonuW6w9TruFlcNmVFERdjnM?=
 =?iso-8859-1?Q?TjILOpe/zdGUIJQ2NIi0p6nERs7tzZEcYS+KQV6V811qhmccOFDOsfp04l?=
 =?iso-8859-1?Q?UvbxNHJHr6sIMxE6mPpx4jf1I6NWpBAJwq6ap4rUORDeusuzarul5Gb/jJ?=
 =?iso-8859-1?Q?i2oljH2+eCN0lI78L47wEiuE2y6h+q+sGsuo0C5hv54k2SmCsg/UJOiUjt?=
 =?iso-8859-1?Q?SlozF1KxZISpelInlNcDZWRtaWQse1PWixhGX3E8kL+S46t2cfipC6NeJu?=
 =?iso-8859-1?Q?dL6qmN6Jno4rP325u9cVRshEHxMZnp3I8LjuO+QD8lIpHPfaxH1SNuQ3VZ?=
 =?iso-8859-1?Q?YC5h4OgbzpkCB95/fUwa8a1Au6nvDSDIJhMYlvm4bKPY9E2AuwWDjoupjX?=
 =?iso-8859-1?Q?6jrxikHM7ONegWfqE0DF2Vazf4INtwOLAmU2uDL3VvREb7Qg6Z8Bu5CZFi?=
 =?iso-8859-1?Q?LhPeswCNrbc1AyCh/kDtYP/NvI9/zWkKvaUpe3Btb1MINEhrfSBkPjjeyy?=
 =?iso-8859-1?Q?2bK2Fw/1Lv4LgpUFPaLuNv6OAq3Gn3MNOTNpXSiksvqYq3laaIAwTTGMjw?=
 =?iso-8859-1?Q?f3eRHqZtYEkeDV8ovNgE+Jt2XEYDS2KjHUYdCQYGcXxPbruFkRZB+OJOx+?=
 =?iso-8859-1?Q?yzg54bEqZNPBX6DR48Ub06Nx1FI0y8UiaFK1pdny+MzRUxznKT7R8CsmeA?=
 =?iso-8859-1?Q?fsvLhREjIV3oG/h1maum2rS3FrcAa4tXu0lH77Dg3kKgEguvjInyNxvCkP?=
 =?iso-8859-1?Q?duaoH/aASlZ7KZlG0jIPeGm+qVP+QQ2DADF8DLXqsKwpb0GFohKYAaaSvH?=
 =?iso-8859-1?Q?hPaYd2r6zXk1BSFpaY8ZqqU9ktZ010JH884qthQ5NeOkmZfy0grSqHiY0D?=
 =?iso-8859-1?Q?v6dUn3Fhj4sfmMaK5Y2q8ixkx+Mm9hDz1+7KzMX6YLZscKdkiKIQWFT38J?=
 =?iso-8859-1?Q?yddcLHv/wxk0qwf3e/CupVEpdh9wzt7ngmNEIbhbwvwRKGjQioUvvNwkTV?=
 =?iso-8859-1?Q?G5oW66eu/xjsfinekxEuPILjAccl4nzz8XfRfnvb7VaIr81PvofHOIdUME?=
 =?iso-8859-1?Q?O0+WD2RK9hd83HebbpcV+h4Ty8/bac0ebC2W7Ob6eDqq3JzUl2BTCvGeT7?=
 =?iso-8859-1?Q?bG0GMt3jwGIJ6I3T8tcbtgLz2RbYTwNoCOTigLNLsZHnRIDV72ZAEzqlUR?=
 =?iso-8859-1?Q?2W8pTUVhLhFYwf9/nO6tLyDzEpaDRW/gghA8y7nCMBZiLeXUC6pPRqU3si?=
 =?iso-8859-1?Q?hnas2DmvPJX3vGSSs44NoF++CuC6+PvQLZtbRm3PzDHbI8fH7b423w0NJJ?=
 =?iso-8859-1?Q?U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?2affd5yttqGAntJkhsvxx/BV61H2r6R+reFkKKXHA29FQAv5UiuhUpEMhl?=
 =?iso-8859-1?Q?/HHYrUQG/EyU5GmS1IVh4W8wtRj5jqBC2jsW1p3iJLfRN1cLV3k1JX2oOw?=
 =?iso-8859-1?Q?aGYvw4PAp5glFZZ0EL5w2WGl2O7g43h7q5M0Cpjx+xE4Ar284Xn2gN4YWL?=
 =?iso-8859-1?Q?WOmRrzYtOQ0Cpm4sOTeEsevhzuUdsRI8rRXl/4NtYu2aHFh0qThTXVFr60?=
 =?iso-8859-1?Q?kB/C4kiL/CZKB/0VusgCvQuXd42L9i0+/8vIn0V7kcWw5fwmWXYZITnWx9?=
 =?iso-8859-1?Q?Umqfb3qMLWYROcNExiFndiXei5dTMHQq3/qPekDenqfl6jHABRfcq+WNwg?=
 =?iso-8859-1?Q?OkJXaavh/Phlt77oliRLbFZUIXyejyRkLxsER24SfgxMiBefGF/+mT5DH0?=
 =?iso-8859-1?Q?iAgqZRb306ldTbcC/0iTI5gL3THN7oJ51aF+Js1LDoiBlUMAHf0WbtVxTH?=
 =?iso-8859-1?Q?EmRIIWUz7iMKAfxITmS3oeQ/sEQcqX+9bc5p+BxkjYO7J35gXuJrkpYbjO?=
 =?iso-8859-1?Q?thBq6NzPJBVYS7HO4G7JThd30W+GDq+Vf4Hd4VqudgQcHGtJ4Tb78whB00?=
 =?iso-8859-1?Q?2Efca3zD/DF6CDkpWIYLW56Mwuoet7BlAgYfWMebKoJYVMym6Xnn2Yt03e?=
 =?iso-8859-1?Q?/ffUGlx4F6baL+/6w/E32+fWEgMRrTExbA1A9CfZEMrifk+0MjkXwDZI+v?=
 =?iso-8859-1?Q?ifMdNC8A8Qu5JNEHacXM8wq/o+wupm8KPHi8lFtzLon/KRzm80zDDTF9Ci?=
 =?iso-8859-1?Q?xT990T390iEwoIjsOTXjTQTpy9w1QO1UnZ9ia7E2gRA0PSFEWjwArS2wi2?=
 =?iso-8859-1?Q?X+9+gClA083Isyo1+zab/MKWMoc5/qP4SObA6QS9gADoCjnTvNvKhXy/Nx?=
 =?iso-8859-1?Q?UwQ6TMunCy2veoBnCDMqmbQjstJAdFCEliHUzPqLp40ZgrvUUGaMZpt85m?=
 =?iso-8859-1?Q?Ms0mx1a+nK20Yg6keFnGJbmFfpuw1a3SwHFvuqf9VjNZXourYO4wnx+mq7?=
 =?iso-8859-1?Q?ZxhDzfJg7tBwi1feX5hO55R/9a1u4/GpGHwCrlal/s7EwtQdBmt4dV0vaO?=
 =?iso-8859-1?Q?KpGTKXPtbFBK1bYdmaRDDYnlDdUchnwLHV5K9P6XLpeY9fqkqdl+I/Cry7?=
 =?iso-8859-1?Q?1oI/cYLFJsx1XwYwvGHjGZEYL0p68zkENXI9+2kLBU2+ijF0OQniToBLwE?=
 =?iso-8859-1?Q?epIRXjQXulbZDVZ+oSToveLnbg21cPiLo3bqV9UV/I2UBFcVnWgJ/n/b64?=
 =?iso-8859-1?Q?gSky4KYbS7cjkPCNmdbUwvQKbdDLC9p/I2tR0v4anFlGvY7Dd8u9LAcxHG?=
 =?iso-8859-1?Q?6yTJbGzS6Gem7QRmGAXQaX6UI32UjtxolaOF3rUyeIsSuN/H0Qm9QHj5Te?=
 =?iso-8859-1?Q?h0aqp+XfpGnTUV5PNDxvJoajcvYlJQkc1Jlucg7tejUK+akZopZ6Md+0Pf?=
 =?iso-8859-1?Q?HdyTpcumMLherp9vqCyBX4X3xV5oWVs8qN+jZqRa6wI430FlZYfbrdHntd?=
 =?iso-8859-1?Q?1dOxQ1KHuOrYol3G8aGMkw1CXFJcJTw2mC565pK9pBpaFhBB4HigH7VFxv?=
 =?iso-8859-1?Q?xFP6OXlm6xKycuLVYdSDfbqDckh4T7IEgEDhgkVweLUrplnCZFbZrlgtW2?=
 =?iso-8859-1?Q?6sX7NrmgJIWLtx0Y4Pwt7h2i0x9U79iXMsFlIAPdbbWsdnKyW1uZGl1w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e41fe6a-2207-4dac-99dc-08dd7b6d8b57
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 16:00:57.7931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eapnz47QsapYy1cpZa/qlQN2lDzGMyKOp+2Seukm7HarvdhcwItzuTFKhp4C3N4uh+zv049CxSs9mLzxWGRvenqvrruqT0VgI7d6IswHsOI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6267
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

On Sat, Apr 12, 2025 at 10:07:21PM +0000, Harry Austen wrote:
>Fix Kconfig symbol dependency on KUNIT, which isn't actually required
>for XE to be built-in. However, if KUNIT is enabled, it must be built-in
>too.
>
>Fixes: 08987a8b6820 ("drm/xe: Fix build with KUNIT=m")
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>Signed-off-by: Harry Austen <hpausten@protonmail.com>
>---
> drivers/gpu/drm/xe/Kconfig | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>index 9bce047901b22..b65bd6b9e65d4 100644
>--- a/drivers/gpu/drm/xe/Kconfig
>+++ b/drivers/gpu/drm/xe/Kconfig
>@@ -1,7 +1,7 @@
> # SPDX-License-Identifier: GPL-2.0-only
> config DRM_XE
> 	tristate "Intel Xe Graphics"
>-	depends on DRM && PCI && MMU && (m || (y && KUNIT=y))
>+	depends on DRM && PCI && MMU && (m || (y && KUNIT!=m))
> 	select INTERVAL_TREE
> 	# we need shmfs for the swappable backing store, and in particular
> 	# the shmem_readpage() which depends upon tmpfs
>@@ -51,7 +51,7 @@ config DRM_XE
>
> config DRM_XE_DISPLAY
> 	bool "Enable display support"
>-	depends on DRM_XE && DRM_XE=m && HAS_IOPORT
>+	depends on DRM_XE && HAS_IOPORT

this wouldn't work with i915 also built-in. Does it now?

Lucas De Marchi
