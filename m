Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45463C54FB3
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 21:35:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB3FC10E761;
	Thu, 29 May 2025 21:35:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RaGKsT30";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 241BC10E761
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 21:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748554553; x=1780090553;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=B9IEi/P26Hy91Zd01pv28hdi4UZM5399OXa81RQmGts=;
 b=RaGKsT30CLQAXARqmHejilnyHeo1PpG0e7j4bXKMd3wk9Y0wXhf0xAqY
 7f8zHFg4Z9F7Kz5R8afUJw/kdDbHYNsLeX/rHUjux7ZXPVQAwNF7dmx8e
 eCOu64lIsAOC+DmL2Uz95GHggpR3uXVjP3QEyYwBKhGmaHXi3xr2Y4UmM
 WwGQwzPgSmuO5M+w8lqxb+oMu3QMIxLk99zxbOS9zlIHAy/0pyZFs5/K0
 vfgq3Ny8VuYmCET+6sfY+RCLvRbFYTeXGMnx2o+Yz9sU7yJhNnXM1Rol+
 otSPMjRpnGjFvTtVY/FfnXe4SpdlTnhfOHrzOiZSdI42fF3MAUkgMerVt w==;
X-CSE-ConnectionGUID: b8vFxiMoTAGW2ZzgA649fQ==
X-CSE-MsgGUID: mncaXmNTT2Sl9/9vlOVOeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50786589"
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; d="scan'208";a="50786589"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 14:35:49 -0700
X-CSE-ConnectionGUID: rfI3zVG0QSmjLY94ubgTCA==
X-CSE-MsgGUID: GhGVlCVuR1aOrgFCZ3L5ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; d="scan'208";a="148969988"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 14:35:49 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 14:35:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 14:35:48 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.63)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 14:35:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qi6Ry1M1FcxDSMQiBOfgKVbSeolL6DkDkignnuVtXESe3SdLVii+qLjESP/yVLMT6fyAcSpEjSvzIRyxUrGTHc+/KQptpeqTCsDw8F85hpeyAugtWzSBx7M1/MpThDjPnHY3DceJLdvsVGRyREC60Uc89+/cFkFlRza3UA0Zzq6htcW3u1Q4jjCjYTHuI9Ui4m/3P8JS/2KcXtRIxjGfrvM+3x/nYt6vBH/AOJ1tNk2Hed5oKhM4pNsIdfdmuSXxwkX89XBSge7L1VRoj+eBmr+tHMstN/5y3tRM4CBFerwsEDqihUf2ls0u+YaF22KCb1CkCnsf5uJhntNdphz7CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pab8HbtvPWRNlQSsFqt9noZAVLvyQ4SuAYoUolxNEIs=;
 b=jOyuuKifmnza0xTdo1IQelNtDyIQr5odmIYyBCYt+gAFiWVI5HUX3EDVJ2IEE7P5sCCVQL8qsY5HxPkamUwyK0bvcE5TxF6FsP+JV7agjRr6nhkSHTQfjCHCYwE/uOsu5p3FNAHcn1JL473B6aPVB6VlKWTSSpBiNee1AClX6QdYK72gqJeI27ttupk5C5g1n7X9xRK7H+wckvXBwSZXiJrHVwkDIkBqvyWvled3SYo8kci3AAr3k2bAOELcUAvZps7ObqJwkMWCYG0ieTq6KRQddz1xMhvd0uiGtcyfbsqN5i1T4Q/P78fGpLObPi5nQRRm8aFJBHqSKKz+dcgOaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH0PR11MB4903.namprd11.prod.outlook.com (2603:10b6:510:36::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Thu, 29 May
 2025 21:35:43 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 21:35:43 +0000
Date: Thu, 29 May 2025 14:35:36 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= success for
 drm/xe/mocs: Initialize MOCS index early (rev2)
Message-ID: <20250529213536.GA5080@mdroper-desk1.amr.corp.intel.com>
References: <20250520142445.2792824-1-balasubramani.vivekanandan@intel.com>
 <174837026312.25162.15737277399763910585@1538d3639d33>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <174837026312.25162.15737277399763910585@1538d3639d33>
X-ClientProxiedBy: SCXP298CA0179.CHLP298.PROD.OUTLOOK.COM
 (2603:10d6:300:14c::17) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH0PR11MB4903:EE_
X-MS-Office365-Filtering-Correlation-Id: 3efff893-f987-4be4-9b51-08dd9ef8c3b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lTgvcOVKL6qTTg+pU2EUtSc6oS3sb4yqQLIyU+jAMj28tmgAf7c4U+kWsinx?=
 =?us-ascii?Q?/7fynHuf9DR3lwXI9HkBMZsS4m1lMRaFzxKwQ21uQHG4KRNadpZeQS9mFG72?=
 =?us-ascii?Q?qZnA0iADU8n+V5Kb+kniP+Br2hWQXTMnNC5QtPURgX6MCWWsSVnb+BI0I9xl?=
 =?us-ascii?Q?WShNdW1jUDrcpeq3X4M4hxm6ZIYn3CQ9vtU3UV6ujg1+wbYUFA3WjCtmwsOx?=
 =?us-ascii?Q?YgRHDhb9ISg5B1mBs7bbdsfrflUhRMUH11j7B0djQ4i2P7uoFZFV9QthELYk?=
 =?us-ascii?Q?r1Bn/Y07aLYwcMeEepqk4X8DNNfG5CtnzW6JBdlb6fsl47dan1h4yUW3WNK3?=
 =?us-ascii?Q?mzpChcSocvl9v5/TO0UnvEqX5rGsKV45HGx/GVS88CIFWH7V3pDcxpM92b8m?=
 =?us-ascii?Q?xBlT6hf6fdcYS7kuGtzeTdc/BShpk+2eFlHYa7OOYLW6DnULZ1+702F/F8mD?=
 =?us-ascii?Q?jWiDPQWAj7Ve4QlB47HZJakEV06OE/5+RS1r+3UvFPPhhyPcTTGpw8U5Fkwz?=
 =?us-ascii?Q?jSpImBKGIOBxdj5eeI0KWANQ+LJp2RElnmalhrin/PfevT6FijkycgFfmHUt?=
 =?us-ascii?Q?vJh7LOkiFgk6OQcbXFplWus1565RvTcf1EAG9JrSScubJre/dkT+q0e+nj5g?=
 =?us-ascii?Q?xDnSwdF0eg/IUq3nn/C8rQDC/iAPN8GtwFvxPBGhrPGPkvttEWMr//UDfTWZ?=
 =?us-ascii?Q?ozmiVv9T7KV4yeIGn9Tw/UBQBSjUjHUNktjAyujyaNPMbRhvxXlG0aCI3g8o?=
 =?us-ascii?Q?KnZ9uWL5VJc39DVNUN060K5DpZQqETbqv2O30DOba/a3t9Wiin/MuVcJpRHg?=
 =?us-ascii?Q?CcqzjylUQWMR4CnIeC/3p1EUobD2YQ3U1FRwWypdQIKI4JpTnFyTtIOCbRN5?=
 =?us-ascii?Q?1n//AtUicfN8aLn/31oUA7nQn/sThvsAAnNeEshXL1+HRCvlZc08ueZ0D9OG?=
 =?us-ascii?Q?sEt2fR5buWzPgwjOK9OOsM+noLbbnfDua1IAZjoPL9a77FudUDu+omCDkiNv?=
 =?us-ascii?Q?AKfX9Acq5IqG6UOJtUxinqq/gZPoi+KD0tPmP57khWWyRb19t0y5vYeo8yR1?=
 =?us-ascii?Q?X8JNmifGnEFCewSg2WW1Xpwk/ZlrXACubajHoj382r2fNYh9wDxzV8f29x5U?=
 =?us-ascii?Q?cr5qE1+EEznbnho23tEB9G6f45v56SeKx02qOlt0h+jH6uIej1YbZNlU9ePc?=
 =?us-ascii?Q?fN0HpWRMYNZBUp6kbM/SMoeP2awPfr6+0juusGU6jQNFFiAmhbqEwCGwogLq?=
 =?us-ascii?Q?Yo23MN94zCESOoyi/GaMQnihn1LG7Fm/Qz53gU9aI4qUktZzjJalwX7+Dxum?=
 =?us-ascii?Q?KmIRvW4GP2mFIOmyfd38VsxBms8hPrJdPEONnm/Kdd3WzIAdAnwOsOjmH6pw?=
 =?us-ascii?Q?Me0gFbI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CunMLmMG+rULKT4KcZYGAAjlSuxRqZpvbi2KcPlobTSI4YNgi3FDPGkcqQJN?=
 =?us-ascii?Q?SGE/WvPD+r+zJ65DhPUNehNcFTSSa9qe5aan+d+eLr7LLLcf96PrHwJMUIxR?=
 =?us-ascii?Q?yQhMSES3XuGulP12wjrz59VrJfKWBhb7mG16ryhhoeiDO21BFY9H3te0A9oJ?=
 =?us-ascii?Q?v0S+4UCf3ewQCFWPilad9yA0X89yRRQeL1k9P2GZfd/9eulvm87MCzhxU9xC?=
 =?us-ascii?Q?xXzv7N6b3c+uM+RRKXYT9SEtaZH0GWxOnVCsEaAi4hD27dTkV/5ZGvllkj+E?=
 =?us-ascii?Q?qjnn+bZDQDfxUSpAvSVHnctBErPG7//omggjqayokOBfyW08PKGaestQv7UI?=
 =?us-ascii?Q?kW7UObnomAWfN+xJTQUxA+UvsAbu1Pr8JeGKGp75DR0HbLTfyxD81WvlQioP?=
 =?us-ascii?Q?JaUFoQ+FqgqGznOX5FgXOgRKFROhThGwRMiTRmeQQUFj6yELil7hMMNIEjvN?=
 =?us-ascii?Q?UkgXSM0lAPY3/6dN4f1X8vEsNUA2Hqp+KSgle72VbaweXX/0vGeXqokp395R?=
 =?us-ascii?Q?xGtkMku5+Cd2ypEv4x9xlT8/6h437+PLC4iTAXd1kLz+0wamhRH79eOl1hgJ?=
 =?us-ascii?Q?As9AFEWMDWBc/jyaB3ZbWBV6cUPkE8eDLbwzMTVVqjITaJRIAspkNEcucyV/?=
 =?us-ascii?Q?4f5P1UXivp21djnsYo6R1si6F6zBsxgMZyxufdNh0uXRu2VgKF9A3IG688gq?=
 =?us-ascii?Q?plAYc6f5oCAOjUbcSO55ExTayU3DQu0NLQBbXHtUQAwgt0zvfiSTZFh0i1vw?=
 =?us-ascii?Q?4T2QeRQ3xoBKLX9zf/Lh647n+xrNOSQWsL/D2VoKTHbmWQt4wRFRvNp+cFIU?=
 =?us-ascii?Q?CwZ4XczyDalu/q3dgYJULXhhm1f7KIuU0XmoK9smFvyKMDlPogevTikKy2hm?=
 =?us-ascii?Q?L9D8Vu5F0gkQIUP99J4+14CL3zM4+PN1Kc0+dDVs4GOuTN6qagT5JVQOsmkF?=
 =?us-ascii?Q?mNl6Rhh8IMHoyqZOqmGJc621RGOw7sePFdWyfV3PEh0MGltosYolbjj9OsJp?=
 =?us-ascii?Q?n0KMxinRMwoGokBcSEYkwwa+l1nbkezyFV3uWCdx1lhgsHj2M6zfzEABftQn?=
 =?us-ascii?Q?T+PtZ4CRgj3C9ADSS35Y7uz1bzU7TOa59+L+D7uK6VkzuukXQG78A+I71vEB?=
 =?us-ascii?Q?4++N+29Q4uC+An1RjRkJh/WRCG32zYvLD+hSAAzweibHUfMg86hwhPpNAFPJ?=
 =?us-ascii?Q?ekLj6++Xx/YP+5gaPg/ZZ/vkD8Cgu+Ek7UZSfpvp10xkalwqUTcHrfyfUcNC?=
 =?us-ascii?Q?0JB8s6HAcbTYNsX5mgykANrY8xg6/9pAfKIQbdSHEPYFO67Td7sPA28TLkIm?=
 =?us-ascii?Q?FXszrAIwXKmmbM99OhVgkwyUELb8IVyGYF7PsD8HjzEgndeZBzzdGADe8Ji3?=
 =?us-ascii?Q?4CakV1ixbq9tqFv8ZZdvA8kcEN61IP7s4ntSeiIMBuDBgwJwG+LMHxZ4T1ya?=
 =?us-ascii?Q?/fRvWgOrS9yPrgTHXu9irQalgjMeUUT9pbRFq9pU3WdvAThgq6bt3ehMheer?=
 =?us-ascii?Q?MIM+yQr7wIgsM1PVUpyApdtZxoB5jsZsQgl2u3b27gdfAwlAG5GJLUmlYl9/?=
 =?us-ascii?Q?fFa3NBtI3cb1SCbkutmIZTBCHc69sNq3iCzLqDx1C73IJ40WJ8vc3/F2QjiW?=
 =?us-ascii?Q?AA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3efff893-f987-4be4-9b51-08dd9ef8c3b4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 21:35:43.6187 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bt6lTPGXNayrw/xdFUJCWywkAm19g39Y680oG+JHANAEnVqhZMkw02CUuyYDm+PlOU1uU3u3mpt94J+8oT/+3pJsmI8QyLrw6hm4PoOJNyY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4903
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

On Tue, May 27, 2025 at 06:24:23PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/mocs: Initialize MOCS index early (rev2)
> URL   : https://patchwork.freedesktop.org/series/149256/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5_FULL -> xe-pw-149256v2_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to drm-xe-next.  Thanks for the patch and review.


Matt

> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> New tests
> ---------
> 
>   New tests have been introduced between xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5_FULL and xe-pw-149256v2_FULL:
> 
> ### New IGT tests (3) ###
> 
>   * igt@kms_flip@flip-vs-panning-interruptible@a-hdmi-a2:
>     - Statuses : 1 pass(s)
>     - Exec time: [4.06] s
> 
>   * igt@kms_flip@flip-vs-panning-interruptible@b-hdmi-a2:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.96] s
> 
>   * igt@kms_flip@flip-vs-panning-interruptible@c-hdmi-a2:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.96] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-149256v2_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@intel_hwmon@hwmon-read:
>     - shard-adlp:         NOTRUN -> [SKIP][1] ([Intel XE#1125])
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-3/igt@intel_hwmon@hwmon-read.html
> 
>   * igt@intel_hwmon@hwmon-write:
>     - shard-bmg:          NOTRUN -> [FAIL][2] ([Intel XE#4665])
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-1/igt@intel_hwmon@hwmon-write.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip-atomic:
>     - shard-bmg:          NOTRUN -> [FAIL][3] ([Intel XE#3701] / [Intel XE#3718] / [Intel XE#827])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][4] ([Intel XE#827])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html
> 
>   * igt@kms_async_flips@invalid-async-flip:
>     - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#873])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-2/igt@kms_async_flips@invalid-async-flip.html
> 
>   * igt@kms_async_flips@invalid-async-flip-atomic:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#3768])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-432/igt@kms_async_flips@invalid-async-flip-atomic.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>     - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2370])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2327]) +5 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-2/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-90:
>     - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1407])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-lnl-5/igt@kms_big_fb@linear-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-90:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#316]) +1 other test skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
>     - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#316])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-4/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#607])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][13] ([Intel XE#4543]) +2 other tests dmesg-fail
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
>     - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#1124]) +1 other test skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-lnl-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
>     - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#1124]) +16 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1124]) +6 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2328]) +1 other test skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
>     - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1124]) +3 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
> 
>   * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
>     - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#367]) +2 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-4/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
>     - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#2191])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-lnl-5/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#2191]) +1 other test skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2314] / [Intel XE#2894])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
>     - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#367])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-lnl-5/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#367]) +5 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-7/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2887]) +22 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-8/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#2907])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#455] / [Intel XE#787]) +27 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#2887]) +1 other test skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-lnl-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#787]) +26 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html
> 
>   * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#3432]) +3 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#787]) +160 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#455] / [Intel XE#787]) +17 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-3/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][34] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>     - shard-dg2-set2:     [PASS][35] -> [INCOMPLETE][36] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
>     - shard-dg2-set2:     [PASS][37] -> [INCOMPLETE][38] ([Intel XE#3124])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][39] -> [DMESG-WARN][40] ([Intel XE#1727] / [Intel XE#3113])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_cdclk@mode-transition:
>     - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#4417] / [Intel XE#455])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-3/igt@kms_cdclk@mode-transition.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2724]) +1 other test skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-8/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#4417]) +2 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-3/igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_chamelium_color@ctm-0-25:
>     - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2325]) +1 other test skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-4/igt@kms_chamelium_color@ctm-0-25.html
> 
>   * igt@kms_chamelium_color@ctm-0-50:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#306]) +1 other test skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-432/igt@kms_chamelium_color@ctm-0-50.html
> 
>   * igt@kms_chamelium_color@ctm-0-75:
>     - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#306])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-lnl-5/igt@kms_chamelium_color@ctm-0-75.html
> 
>   * igt@kms_chamelium_color@ctm-negative:
>     - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#306])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-4/igt@kms_chamelium_color@ctm-negative.html
> 
>   * igt@kms_chamelium_edid@dp-edid-resolution-list:
>     - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2252]) +18 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-resolution-list.html
> 
>   * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
>     - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#373]) +3 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-3/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#373]) +3 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#373])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-lnl-5/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2390]) +1 other test skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-7/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2341]) +1 other test skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-1/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_content_protection@lic-type-0:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][54] ([Intel XE#1178]) +2 other tests fail
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-434/igt@kms_content_protection@lic-type-0.html
> 
>   * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][55] ([Intel XE#3304])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-434/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#3278])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-lnl-5/igt@kms_content_protection@uevent.html
>     - shard-bmg:          NOTRUN -> [FAIL][57] ([Intel XE#1188]) +1 other test fail
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-2/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_content_protection@uevent@pipe-a-dp-2:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][58] ([Intel XE#1188])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-432/igt@kms_content_protection@uevent@pipe-a-dp-2.html
> 
>   * igt@kms_cursor_crc@cursor-dpms:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#4208] / [i915#2575]) +18 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-434/igt@kms_cursor_crc@cursor-dpms.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-64x21:
>     - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#1424])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-lnl-5/igt@kms_cursor_crc@cursor-offscreen-64x21.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2321]) +1 other test skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-random-32x32:
>     - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2320]) +6 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-2/igt@kms_cursor_crc@cursor-random-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x512:
>     - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#308])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-4/igt@kms_cursor_crc@cursor-random-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x170:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#308])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x170.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2286]) +1 other test skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#323])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
>     - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#309])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-4/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
>     - shard-bmg:          [PASS][68] -> [SKIP][69] ([Intel XE#2291]) +3 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>     - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2291]) +1 other test skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
> 
>   * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>     - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#1508])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
> 
>   * igt@kms_dp_link_training@uhbr-sst:
>     - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#4354]) +1 other test skip
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-8/igt@kms_dp_link_training@uhbr-sst.html
> 
>   * igt@kms_dp_linktrain_fallback@dp-fallback:
>     - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#4294])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-1/igt@kms_dp_linktrain_fallback@dp-fallback.html
> 
>   * igt@kms_dp_linktrain_fallback@dsc-fallback:
>     - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#4331])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-2/igt@kms_dp_linktrain_fallback@dsc-fallback.html
> 
>   * igt@kms_dsc@dsc-with-output-formats:
>     - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2244]) +1 other test skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-4/igt@kms_dsc@dsc-with-output-formats.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#4156])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-2/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_feature_discovery@chamelium:
>     - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2372])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-7/igt@kms_feature_discovery@chamelium.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2373])
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-2/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#1135])
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-432/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms:
>     - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#1421])
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-lnl-5/igt@kms_flip@2x-flip-vs-dpms.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
>     - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2316]) +1 other test skip
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-panning-vs-hang:
>     - shard-bmg:          [PASS][82] -> [SKIP][83] ([Intel XE#2316]) +3 other tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
>     - shard-bmg:          NOTRUN -> [FAIL][84] ([Intel XE#2882]) +1 other test fail
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
>     - shard-dg2-set2:     [PASS][85] -> [FAIL][86] ([Intel XE#301]) +4 other tests fail
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-adlp:         [PASS][87] -> [DMESG-WARN][88] ([Intel XE#2953] / [Intel XE#4173]) +6 other tests dmesg-warn
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a1:
>     - shard-adlp:         [PASS][89] -> [FAIL][90] ([Intel XE#2882])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-adlp-3/igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a1.html
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-3/igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a1.html
> 
>   * igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a1:
>     - shard-adlp:         [PASS][91] -> [FAIL][92] ([Intel XE#886])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-adlp-3/igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a1.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-3/igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a1.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2293] / [Intel XE#2380]) +3 other tests skip
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2293]) +3 other tests skip
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:
>     - shard-adlp:         [PASS][95] -> [FAIL][96] ([Intel XE#1874]) +1 other test fail
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:
>     - shard-adlp:         [PASS][97] -> [DMESG-FAIL][98] ([Intel XE#4543])
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
>     - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#651]) +4 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2312]) +9 other tests skip
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#2311]) +45 other tests skip
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#4141]) +23 other tests skip
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#656]) +2 other tests skip
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-suspend:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][104] ([Intel XE#2953] / [Intel XE#4173])
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#651]) +15 other tests skip
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:
>     - shard-adlp:         NOTRUN -> [SKIP][106] ([Intel XE#651]) +3 other tests skip
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#2351] / [Intel XE#4208]) +7 other tests skip
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#653]) +5 other tests skip
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#656]) +18 other tests skip
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
>     - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#2313]) +46 other tests skip
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@psr-slowdraw:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#653]) +14 other tests skip
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-slowdraw.html
> 
>   * igt@kms_getfb@getfb-reject-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#2502])
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-7/igt@kms_getfb@getfb-reject-ccs.html
> 
>   * igt@kms_getfb@getfb2-accept-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#2340])
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-4/igt@kms_getfb@getfb2-accept-ccs.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#3374] / [Intel XE#3544])
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#1450]) +1 other test skip
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-lnl-5/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html
> 
>   * igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#1450] / [Intel XE#2568]) +1 other test skip
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-lnl-5/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html
> 
>   * igt@kms_joiner@basic-max-non-joiner:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#4298])
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-463/igt@kms_joiner@basic-max-non-joiner.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-adlp:         NOTRUN -> [SKIP][118] ([Intel XE#356])
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#599]) +3 other tests skip
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-lnl-5/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html
> 
>   * igt@kms_plane_multiple@2x-tiling-x:
>     - shard-bmg:          [PASS][120] -> [SKIP][121] ([Intel XE#4596])
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-x.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-x.html
> 
>   * igt@kms_plane_multiple@tiling-yf:
>     - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#5020]) +1 other test skip
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-1/igt@kms_plane_multiple@tiling-yf.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#2763]) +5 other tests skip
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html
> 
>   * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation:
>     - shard-dg2-set2:     [PASS][124] -> [SKIP][125] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-dg2-436/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-434/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
>     - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#2763]) +19 other tests skip
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#2763] / [Intel XE#455]) +3 other tests skip
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d.html
> 
>   * igt@kms_pm_backlight@brightness-with-dpms:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#2938])
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-432/igt@kms_pm_backlight@brightness-with-dpms.html
> 
>   * igt@kms_pm_backlight@fade-with-dpms:
>     - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#870])
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-4/igt@kms_pm_backlight@fade-with-dpms.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-lnl:          NOTRUN -> [FAIL][130] ([Intel XE#718])
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html
>     - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#2392])
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-2/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
>     - shard-adlp:         NOTRUN -> [SKIP][132] ([Intel XE#836])
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-3/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
>     - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
>     - shard-adlp:         NOTRUN -> [SKIP][134] ([Intel XE#1489]) +1 other test skip
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
>     - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#2893])
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-lnl-5/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#1489]) +15 other tests skip
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#1489]) +3 other tests skip
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-432/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr@fbc-psr-sprite-plane-onoff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#2850] / [Intel XE#929]) +7 other tests skip
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
> 
>   * igt@kms_psr@psr2-sprite-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][139] ([Intel XE#2850] / [Intel XE#929]) +7 other tests skip
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-3/igt@kms_psr@psr2-sprite-blt.html
>     - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#2234] / [Intel XE#2850]) +23 other tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-7/igt@kms_psr@psr2-sprite-blt.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#2414])
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_rotation_crc@primary-rotation-90:
>     - shard-bmg:          NOTRUN -> [SKIP][142] ([Intel XE#3414] / [Intel XE#3904]) +3 other tests skip
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-7/igt@kms_rotation_crc@primary-rotation-90.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][143] ([Intel XE#1127])
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_scaling_modes@scaling-mode-full-aspect:
>     - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#2413])
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-full-aspect.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#2426])
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_vrr@flip-suspend:
>     - shard-adlp:         NOTRUN -> [SKIP][146] ([Intel XE#455]) +9 other tests skip
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-4/igt@kms_vrr@flip-suspend.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][147] ([Intel XE#455]) +11 other tests skip
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-434/igt@kms_vrr@flipline.html
> 
>   * igt@kms_vrr@lobf:
>     - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#2168])
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-8/igt@kms_vrr@lobf.html
> 
>   * igt@kms_vrr@seamless-rr-switch-drrs:
>     - shard-bmg:          NOTRUN -> [SKIP][149] ([Intel XE#1499]) +1 other test skip
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-2/igt@kms_vrr@seamless-rr-switch-drrs.html
> 
>   * igt@kms_writeback@writeback-check-output-xrgb2101010:
>     - shard-bmg:          NOTRUN -> [SKIP][150] ([Intel XE#756]) +1 other test skip
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-2/igt@kms_writeback@writeback-check-output-xrgb2101010.html
> 
>   * igt@kms_writeback@writeback-fb-id:
>     - shard-adlp:         NOTRUN -> [SKIP][151] ([Intel XE#756])
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-3/igt@kms_writeback@writeback-fb-id.html
> 
>   * igt@kms_writeback@writeback-invalid-parameters:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][152] ([Intel XE#756]) +1 other test skip
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html
> 
>   * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>     - shard-bmg:          NOTRUN -> [SKIP][153] ([Intel XE#1091] / [Intel XE#2849])
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-2/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
> 
>   * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][154] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-463/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0x3fff:
>     - shard-adlp:         NOTRUN -> [SKIP][155] ([Intel XE#1126])
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-3/igt@xe_copy_basic@mem-set-linear-0x3fff.html
> 
>   * igt@xe_eu_stall@invalid-sampling-rate:
>     - shard-adlp:         NOTRUN -> [SKIP][156] ([Intel XE#4497])
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-4/igt@xe_eu_stall@invalid-sampling-rate.html
> 
>   * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][157] ([Intel XE#4837]) +5 other tests skip
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-432/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
> 
>   * igt@xe_eudebug@read-metadata:
>     - shard-adlp:         NOTRUN -> [SKIP][158] ([Intel XE#4837]) +3 other tests skip
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-4/igt@xe_eudebug@read-metadata.html
> 
>   * igt@xe_eudebug_online@single-step:
>     - shard-bmg:          NOTRUN -> [SKIP][159] ([Intel XE#4837]) +20 other tests skip
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-4/igt@xe_eudebug_online@single-step.html
> 
>   * igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram:
>     - shard-lnl:          NOTRUN -> [SKIP][160] ([Intel XE#4837])
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-lnl-5/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram.html
> 
>   * igt@xe_eudebug_sriov@deny-eudebug:
>     - shard-bmg:          NOTRUN -> [SKIP][161] ([Intel XE#4518])
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-7/igt@xe_eudebug_sriov@deny-eudebug.html
> 
>   * igt@xe_evict@evict-beng-large-external-cm:
>     - shard-lnl:          NOTRUN -> [SKIP][162] ([Intel XE#688])
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-lnl-5/igt@xe_evict@evict-beng-large-external-cm.html
> 
>   * igt@xe_evict@evict-large-multi-vm:
>     - shard-adlp:         NOTRUN -> [SKIP][163] ([Intel XE#261] / [Intel XE#688])
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-4/igt@xe_evict@evict-large-multi-vm.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
>     - shard-adlp:         NOTRUN -> [SKIP][164] ([Intel XE#688])
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-3/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
>     - shard-bmg:          NOTRUN -> [SKIP][165] ([Intel XE#2322]) +15 other tests skip
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][166] ([Intel XE#1392]) +1 other test skip
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:
>     - shard-lnl:          NOTRUN -> [SKIP][167] ([Intel XE#1392])
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
>     - shard-dg2-set2:     [PASS][168] -> [SKIP][169] ([Intel XE#1392]) +4 other tests skip
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
> 
>   * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
>     - shard-adlp:         NOTRUN -> [SKIP][170] ([Intel XE#1392]) +2 other tests skip
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-rebind:
>     - shard-adlp:         NOTRUN -> [SKIP][171] ([Intel XE#288]) +11 other tests skip
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-3/igt@xe_exec_fault_mode@many-execqueues-rebind.html
> 
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][172] ([Intel XE#288]) +16 other tests skip
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-434/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
> 
>   * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][173] ([Intel XE#2360])
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
> 
>   * igt@xe_exec_system_allocator@fault-threads-same-page-benchmark:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][174] ([Intel XE#4915]) +131 other tests skip
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-432/igt@xe_exec_system_allocator@fault-threads-same-page-benchmark.html
> 
>   * igt@xe_exec_system_allocator@once-mmap-file-nomemset:
>     - shard-adlp:         NOTRUN -> [SKIP][175] ([Intel XE#4915]) +108 other tests skip
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-4/igt@xe_exec_system_allocator@once-mmap-file-nomemset.html
> 
>   * igt@xe_exec_system_allocator@process-many-mmap-huge:
>     - shard-lnl:          NOTRUN -> [SKIP][176] ([Intel XE#4943]) +1 other test skip
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-lnl-5/igt@xe_exec_system_allocator@process-many-mmap-huge.html
> 
>   * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge:
>     - shard-bmg:          NOTRUN -> [SKIP][177] ([Intel XE#4943]) +35 other tests skip
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-7/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge.html
> 
>   * igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-eocheck:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][178] ([Intel XE#4208]) +110 other tests skip
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-434/igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-eocheck.html
> 
>   * igt@xe_exec_threads@threads-hang-fd-rebind:
>     - shard-dg2-set2:     [PASS][179] -> [DMESG-WARN][180] ([Intel XE#3876])
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-dg2-463/igt@xe_exec_threads@threads-hang-fd-rebind.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-433/igt@xe_exec_threads@threads-hang-fd-rebind.html
> 
>   * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
>     - shard-lnl:          NOTRUN -> [SKIP][181] ([Intel XE#2229])
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-lnl-5/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
> 
>   * igt@xe_module_load@load:
>     - shard-adlp:         ([PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206]) -> ([PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [SKIP][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232]) ([Intel XE#378])
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-adlp-9/igt@xe_module_load@load.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-adlp-6/igt@xe_module_load@load.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-adlp-2/igt@xe_module_load@load.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-adlp-2/igt@xe_module_load@load.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-adlp-8/igt@xe_module_load@load.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-adlp-9/igt@xe_module_load@load.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-adlp-4/igt@xe_module_load@load.html
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-adlp-4/igt@xe_module_load@load.html
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-adlp-4/igt@xe_module_load@load.html
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-adlp-3/igt@xe_module_load@load.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-adlp-3/igt@xe_module_load@load.html
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-adlp-3/igt@xe_module_load@load.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-adlp-8/igt@xe_module_load@load.html
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-adlp-1/igt@xe_module_load@load.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-adlp-9/igt@xe_module_load@load.html
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-adlp-6/igt@xe_module_load@load.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-adlp-1/igt@xe_module_load@load.html
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-adlp-3/igt@xe_module_load@load.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-adlp-2/igt@xe_module_load@load.html
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-adlp-1/igt@xe_module_load@load.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-adlp-2/igt@xe_module_load@load.html
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-adlp-8/igt@xe_module_load@load.html
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-adlp-8/igt@xe_module_load@load.html
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-adlp-6/igt@xe_module_load@load.html
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-adlp-6/igt@xe_module_load@load.html
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-3/igt@xe_module_load@load.html
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-2/igt@xe_module_load@load.html
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-4/igt@xe_module_load@load.html
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-8/igt@xe_module_load@load.html
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-3/igt@xe_module_load@load.html
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-4/igt@xe_module_load@load.html
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-2/igt@xe_module_load@load.html
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-2/igt@xe_module_load@load.html
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-6/igt@xe_module_load@load.html
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-6/igt@xe_module_load@load.html
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-6/igt@xe_module_load@load.html
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-9/igt@xe_module_load@load.html
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-9/igt@xe_module_load@load.html
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-4/igt@xe_module_load@load.html
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-2/igt@xe_module_load@load.html
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-8/igt@xe_module_load@load.html
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-4/igt@xe_module_load@load.html
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-4/igt@xe_module_load@load.html
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-8/igt@xe_module_load@load.html
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-1/igt@xe_module_load@load.html
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-1/igt@xe_module_load@load.html
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-1/igt@xe_module_load@load.html
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-1/igt@xe_module_load@load.html
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-8/igt@xe_module_load@load.html
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-3/igt@xe_module_load@load.html
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-3/igt@xe_module_load@load.html
> 
>   * igt@xe_oa@polling-small-buf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][233] ([Intel XE#2541] / [Intel XE#3573]) +4 other tests skip
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-432/igt@xe_oa@polling-small-buf.html
> 
>   * igt@xe_oa@syncs-ufence-wait-cfg:
>     - shard-adlp:         NOTRUN -> [SKIP][234] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-4/igt@xe_oa@syncs-ufence-wait-cfg.html
> 
>   * igt@xe_oa@whitelisted-registers-userspace-config:
>     - shard-adlp:         NOTRUN -> [SKIP][235] ([Intel XE#2541] / [Intel XE#3573])
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-4/igt@xe_oa@whitelisted-registers-userspace-config.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - shard-bmg:          NOTRUN -> [SKIP][236] ([Intel XE#2236])
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-2/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][237] ([Intel XE#1173]) +1 other test fail
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-434/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html
> 
>   * igt@xe_pm@d3cold-mocs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][238] ([Intel XE#2284])
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-432/igt@xe_pm@d3cold-mocs.html
> 
>   * igt@xe_pm@s3-d3cold-basic-exec:
>     - shard-adlp:         NOTRUN -> [SKIP][239] ([Intel XE#2284] / [Intel XE#366])
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-3/igt@xe_pm@s3-d3cold-basic-exec.html
>     - shard-bmg:          NOTRUN -> [SKIP][240] ([Intel XE#2284]) +1 other test skip
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-7/igt@xe_pm@s3-d3cold-basic-exec.html
> 
>   * igt@xe_pm@s4-exec-after:
>     - shard-lnl:          [PASS][241] -> [ABORT][242] ([Intel XE#1794])
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-lnl-4/igt@xe_pm@s4-exec-after.html
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-lnl-2/igt@xe_pm@s4-exec-after.html
> 
>   * igt@xe_pm@s4-vm-bind-userptr:
>     - shard-adlp:         [PASS][243] -> [ABORT][244] ([Intel XE#1794])
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-adlp-4/igt@xe_pm@s4-vm-bind-userptr.html
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html
> 
>   * igt@xe_pmu@fn-engine-activity-load:
>     - shard-bmg:          NOTRUN -> [SKIP][245] ([Intel XE#4650])
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-8/igt@xe_pmu@fn-engine-activity-load.html
> 
>   * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][246] ([Intel XE#4733])
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-432/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html
> 
>   * igt@xe_pxp@pxp-termination-key-update-post-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][247] ([Intel XE#4733]) +6 other tests skip
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-2/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
> 
>   * igt@xe_pxp@pxp-termination-key-update-post-termination-irq:
>     - shard-adlp:         NOTRUN -> [SKIP][248] ([Intel XE#4733])
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-4/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html
> 
>   * igt@xe_query@multigpu-query-config:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][249] ([Intel XE#944]) +1 other test skip
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-432/igt@xe_query@multigpu-query-config.html
> 
>   * igt@xe_query@multigpu-query-invalid-cs-cycles:
>     - shard-bmg:          NOTRUN -> [SKIP][250] ([Intel XE#944]) +3 other tests skip
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-7/igt@xe_query@multigpu-query-invalid-cs-cycles.html
>     - shard-adlp:         NOTRUN -> [SKIP][251] ([Intel XE#944])
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-3/igt@xe_query@multigpu-query-invalid-cs-cycles.html
> 
>   * igt@xe_render_copy@render-stress-0-copies:
>     - shard-adlp:         NOTRUN -> [SKIP][252] ([Intel XE#4814])
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-3/igt@xe_render_copy@render-stress-0-copies.html
> 
>   * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
>     - shard-bmg:          NOTRUN -> [SKIP][253] ([Intel XE#4130])
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-4/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html
> 
>   * igt@xe_sriov_flr@flr-vfs-parallel:
>     - shard-bmg:          NOTRUN -> [SKIP][254] ([Intel XE#4273]) +1 other test skip
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-2/igt@xe_sriov_flr@flr-vfs-parallel.html
> 
>   * igt@xe_vm@munmap-style-unbind-many-all:
>     - shard-dg2-set2:     [PASS][255] -> [SKIP][256] ([Intel XE#4208])
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-dg2-436/igt@xe_vm@munmap-style-unbind-many-all.html
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-434/igt@xe_vm@munmap-style-unbind-many-all.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [INCOMPLETE][257] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][258]
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>     - shard-dg2-set2:     [INCOMPLETE][259] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][260]
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
>     - shard-bmg:          [SKIP][261] ([Intel XE#2291]) -> [PASS][262]
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
>     - shard-dg2-set2:     [FAIL][263] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][264] +3 other tests pass
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
>     - shard-dg2-set2:     [FAIL][265] ([Intel XE#301]) -> [PASS][266] +3 other tests pass
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
>    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-bmg:          [FAIL][267] ([Intel XE#3321]) -> [PASS][268]
>    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
>     - shard-lnl:          [FAIL][269] ([Intel XE#301]) -> [PASS][270]
>    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
>    [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-dg2-set2:     [INCOMPLETE][271] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][272] +1 other test pass
>    [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:
>     - shard-lnl:          [FAIL][273] ([Intel XE#886]) -> [PASS][274]
>    [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html
>    [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-lnl-5/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html
> 
>   * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1:
>     - shard-adlp:         [FAIL][275] ([Intel XE#886]) -> [PASS][276]
>    [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-adlp-6/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html
>    [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-6/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y:
>     - shard-adlp:         [DMESG-FAIL][277] ([Intel XE#4543]) -> [PASS][278]
>    [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html
>    [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend:
>     - shard-adlp:         [DMESG-WARN][279] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][280] +5 other tests pass
>    [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-adlp-3/igt@kms_plane@plane-panning-bottom-right-suspend.html
>    [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-2/igt@kms_plane@plane-panning-bottom-right-suspend.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-adlp:         [FAIL][281] ([Intel XE#718]) -> [PASS][282]
>    [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-adlp-2/igt@kms_pm_dc@dc6-dpms.html
>    [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
>     - shard-dg2-set2:     [SKIP][283] ([Intel XE#1392]) -> [PASS][284] +9 other tests pass
>    [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
>    [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
> 
>   * igt@xe_pm@s4-basic:
>     - shard-lnl:          [ABORT][285] ([Intel XE#1794]) -> [PASS][286]
>    [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-lnl-2/igt@xe_pm@s4-basic.html
>    [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-lnl-5/igt@xe_pm@s4-basic.html
> 
>   * igt@xe_pm@s4-vm-bind-unbind-all:
>     - shard-adlp:         [ABORT][287] ([Intel XE#1794]) -> [PASS][288] +1 other test pass
>    [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
>    [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-4/igt@xe_pm@s4-vm-bind-unbind-all.html
> 
>   * igt@xe_pmu@gt-frequency:
>     - shard-dg2-set2:     [FAIL][289] ([Intel XE#4819]) -> [PASS][290] +1 other test pass
>    [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-dg2-432/igt@xe_pmu@gt-frequency.html
>    [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-433/igt@xe_pmu@gt-frequency.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
>     - shard-dg2-set2:     [SKIP][291] ([Intel XE#367]) -> [SKIP][292] ([Intel XE#4208] / [i915#2575])
>    [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
>    [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>     - shard-dg2-set2:     [INCOMPLETE][293] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [INCOMPLETE][294] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
>    [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
>    [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_content_protection@atomic:
>     - shard-bmg:          [FAIL][295] ([Intel XE#1178]) -> [SKIP][296] ([Intel XE#2341])
>    [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-bmg-4/igt@kms_content_protection@atomic.html
>    [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-1/igt@kms_content_protection@atomic.html
> 
>   * igt@kms_flip@wf_vblank-ts-check:
>     - shard-adlp:         [FAIL][297] ([Intel XE#886]) -> [DMESG-WARN][298] ([Intel XE#2953] / [Intel XE#4173])
>    [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-adlp-6/igt@kms_flip@wf_vblank-ts-check.html
>    [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-adlp-6/igt@kms_flip@wf_vblank-ts-check.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][299] ([Intel XE#2311]) -> [SKIP][300] ([Intel XE#2312]) +6 other tests skip
>    [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
>    [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
>     - shard-bmg:          [SKIP][301] ([Intel XE#4141]) -> [SKIP][302] ([Intel XE#2312]) +2 other tests skip
>    [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
>    [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
>     - shard-bmg:          [SKIP][303] ([Intel XE#2312]) -> [SKIP][304] ([Intel XE#4141]) +3 other tests skip
>    [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
>    [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][305] ([Intel XE#2312]) -> [SKIP][306] ([Intel XE#2311]) +3 other tests skip
>    [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
>    [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
>     - shard-bmg:          [SKIP][307] ([Intel XE#2313]) -> [SKIP][308] ([Intel XE#2312]) +7 other tests skip
>    [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
>    [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
>     - shard-bmg:          [SKIP][309] ([Intel XE#2312]) -> [SKIP][310] ([Intel XE#2313]) +4 other tests skip
>    [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html
>    [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html
> 
>   * igt@kms_plane_multiple@2x-tiling-yf:
>     - shard-bmg:          [SKIP][311] ([Intel XE#5021]) -> [SKIP][312] ([Intel XE#4596])
>    [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html
>    [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-yf.html
> 
>   * igt@kms_psr@fbc-pr-sprite-blt:
>     - shard-dg2-set2:     [SKIP][313] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][314] ([Intel XE#4208])
>    [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-dg2-436/igt@kms_psr@fbc-pr-sprite-blt.html
>    [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-434/igt@kms_psr@fbc-pr-sprite-blt.html
> 
>   * igt@kms_tv_load_detect@load-detect:
>     - shard-dg2-set2:     [SKIP][315] ([Intel XE#330]) -> [SKIP][316] ([Intel XE#4208] / [i915#2575])
>    [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-dg2-436/igt@kms_tv_load_detect@load-detect.html
>    [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html
> 
>   * igt@xe_exec_system_allocator@threads-many-stride-mmap:
>     - shard-dg2-set2:     [SKIP][317] ([Intel XE#4915]) -> [SKIP][318] ([Intel XE#4208]) +4 other tests skip
>    [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5/shard-dg2-436/igt@xe_exec_system_allocator@threads-many-stride-mmap.html
>    [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/shard-dg2-434/igt@xe_exec_system_allocator@threads-many-stride-mmap.html
> 
>   
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
>   [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
>   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
>   [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
>   [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>   [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
>   [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
>   [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
>   [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
>   [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
>   [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502
>   [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
>   [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
>   [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
>   [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
>   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>   [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
>   [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
>   [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
>   [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>   [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
>   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#3701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3701
>   [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
>   [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
>   [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
>   [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
>   [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
>   [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
>   [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
>   [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
>   [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
>   [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
>   [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
>   [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
>   [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
>   [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
>   [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
>   [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>   [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
>   [Intel XE#4665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4665
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
>   [Intel XE#4819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
>   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>   [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
>   [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5 -> xe-pw-149256v2
> 
>   IGT_8380: 8380
>   xe-3145-994b4d24e5526a8b1efca4ca25a3a3be47a886e5: 994b4d24e5526a8b1efca4ca25a3a3be47a886e5
>   xe-pw-149256v2: 149256v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v2/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
