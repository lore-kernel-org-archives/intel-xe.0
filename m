Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E65CA0EE0
	for <intel-xe@archiver.kernel.org>; Thu, 14 Aug 2025 02:24:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AB6E10E07C;
	Thu, 14 Aug 2025 02:24:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hMz1Ws0x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAA4610E07C
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Aug 2025 02:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755138242; x=1786674242;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xaDwvsccTTGmMHy4ALO664xblXMTP7jPH9vtn+sMqOI=;
 b=hMz1Ws0xFP2wE4FRMI3DF0czHICW6e0iWzcR3hS4VI6THhLIyhyXoZij
 KEqVvHpIP7NO2GpibP3h7US6GNa1F4ByzbXlRN/bz98Nb6FKXqEkmUcQX
 dETyatIC6cqPnKPm7+CrmIFJ+V5n0qxwqZ/e0CFpbRvgBLEncLuRvWD9B
 v40bZwO7YPc3WqC11sT4Fv6rcLt3wqv4MrJ0m+zjvm8c+OnjGzsHfSvM3
 Q0i4nIwpRrd9hXMue5SAlYgOtyI1/OrSYI6koaEwEC+xWhg6LLZCNnB6P
 Gh9TySIBBTMr+gI63Mu/9ZO8zLEV/e/dywGrL1KWV0sqquq1/R7uhlXSC Q==;
X-CSE-ConnectionGUID: o9ckgrBlTRmwZ4RxWG+hNw==
X-CSE-MsgGUID: Ktl7i7edRdqC2xvmcmN2nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57368459"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="57368459"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 19:24:01 -0700
X-CSE-ConnectionGUID: 1L7O9XWISZuNnNL5+tnLEQ==
X-CSE-MsgGUID: rub0SB3vSaatVktofBSRRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="167007636"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 19:24:00 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 13 Aug 2025 19:24:00 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 13 Aug 2025 19:24:00 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.79) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 13 Aug 2025 19:24:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dZMB1QeYmVOFtfiSWV5VljNyRud/x7rEisLboUhA6XkKCz0EVpKH+8sXRUhrAa25vt42wCokUf/thF5XRKb7XQJn35d32caY6xbmWEfUneOJG5Kv8LGXk8mx/rVdWaRyt1q0+FKprOT1O8sl2R+NeMS7R+td+Kgz0JNcw0SEfpWNty4eWN5sS8nf6dtc0PoFbGUwh0d3ZI8S5fAgZfyipxp4asdpd25RK7Et9Sz3hFsGZNvG9/37ZQLiFYlKOGrLLhXRkTh6rIPJgzQvoGut9+ZtgR5a9XTjzKRuXXXz5qLRdqGH3kYULkxjP3GiSTUFCNzid9B/rfSdGyp/m0zeRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ckZBqbJSTcurbYqK6KSYpSZ/d9cM1W2sjCrYxH5W6fc=;
 b=baJN2YkCaVRAYj58yl8g/RktI9JDcfKXKV2TpkNjyqjiiJlBAlv+LFgBP68dY8ZYrEfs4YC5O6isdF11TDWtxlaKuyER9B5+9PAA+7MSpp2r534rsIMyC10ry/a+eNCEfQ31S3yoAuLEnPZZijfbTXLZnXJBIrYlSKS6blKdoyBxO4nQ28cAKqBEEiNZKtna3Kj3mrLcvNGUGWljnNrENh/Cot0vl/XCd7U0u6GfUsSmkawzyZzWU/1qbJZcEG8R3sJOOKPHdX2CYjzNLuYfqPXAb077G49MWFckJSfzbxsioyMWT1pl+QCLPxg/FLBrHugI/9Cm3feMwc5/4ykDDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7796.namprd11.prod.outlook.com (2603:10b6:610:121::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Thu, 14 Aug
 2025 02:23:52 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 02:23:52 +0000
Date: Wed, 13 Aug 2025 19:23:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH 06/15] drm/xe: Convert xe_bo_create_user() for exhaustive
 eviction
Message-ID: <aJ1Itfuulf9okiHw@lstrano-desk.jf.intel.com>
References: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
 <20250813105121.5945-7-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250813105121.5945-7-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR02CA0041.namprd02.prod.outlook.com
 (2603:10b6:a03:54::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7796:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c892fa2-d425-4e9d-e8df-08dddad99c27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?9Zk9F2Q5znVjW+czxVNIJmkKQEoLrClcbYc7pNoTqGVg3JQFAdyToQnNx2?=
 =?iso-8859-1?Q?jmNBsgDR5bPcHHXZT/rrY5kUuuQVz2OIo4EOjyu81BCgYY4v+GWa73Ua5K?=
 =?iso-8859-1?Q?1mwD1Tt652AjJsIPaWig0AeYpajclUzlImlXcgrNtqwUseU3DsbF9EWwR7?=
 =?iso-8859-1?Q?kaCqc0Vk+0AmXc2BDEGpODk/OBx/jOLESFO7fNzLg6bjac09op3HWJ0DK0?=
 =?iso-8859-1?Q?BugUivD3Us21go600vk7+ASou8+m75mT31jZVftVO69lwp5jAZy1RxHRyf?=
 =?iso-8859-1?Q?etuOr16gOVHAMy9lgkTXtRDF9qbMwISRAt0VFtFN12gXmc9GccQCf/8lEH?=
 =?iso-8859-1?Q?w9f9qzfecwl9MK6yxrMgvgIclJBYDzoKWzwheKdG+0whS+oewv5KM5cLec?=
 =?iso-8859-1?Q?pCjxFeEnAecx2ActDyfrR49jj1BwIOzBv6dc79E/XsyLLcf7xVcD/Yk0IO?=
 =?iso-8859-1?Q?tN6iLmy2EtYeGt7hMvgw57UVMKGgq7Q/LA6zsyeSqeqH/qqqYZmAng+w5C?=
 =?iso-8859-1?Q?dNFCoO8IdL2hv07TnmMmqcwwpeRFvTVc59HDYip4YD9tZnC7LTybgYjRVM?=
 =?iso-8859-1?Q?JKtdLVWo+6EmjRhVNIbF8M7dCXlQH4yx9Q47QqB3DBpHJt3B1V6X5bo7ii?=
 =?iso-8859-1?Q?tQJISlXoO8Nm4loXLzTEDX76vTwSqn6AVk5FOfsj0AmE7mTzfoYD/id7uK?=
 =?iso-8859-1?Q?l6aw5mLFeWJZqlEy3yPxhZcZsdu5R0LZSc7gW/VbyDpDwT+qnmQxIDtXKY?=
 =?iso-8859-1?Q?FJIS/9yBVqqKQYKeRlo/VWJ1niRfiaCisFd1GfQlimafHh4MqJleoEComl?=
 =?iso-8859-1?Q?woAkwhYvDHyny5eq6o1yPIX1ysRlNhK86KJjPESZsXfXLbWxdTo0HgQAO9?=
 =?iso-8859-1?Q?kyqPZoNB9DyDq3qH4My0TMBGY0OSTqPXym2gxPpAvhBzL3k1+NlzgwFHob?=
 =?iso-8859-1?Q?nTLpLfIEHrsN9ld7ucQLV8IuvwG5tjK9maTGTXKoPXQX8KsLnkMtZLXF5Q?=
 =?iso-8859-1?Q?TmI86cyN07jT1pAtH0lPEGvrn/4L2rBoVD2K6FRsFMGhGuXeLs4yudkxxT?=
 =?iso-8859-1?Q?H/GWhJraX0EplIgMGU1T7bmEgRtELSoTaaw1f4+DJSzNOEU8GGPLr7lAOZ?=
 =?iso-8859-1?Q?wkZx+QG7zCR/9vAmAhkr3ZxW4vnXags2CISBfEfIcsvtsa7FwbxxTgh8qR?=
 =?iso-8859-1?Q?GOMvnaRrCkm+kZChZ00+vVRX57wqsXy3kp3ktxYFgegojcja7rcoVne13i?=
 =?iso-8859-1?Q?ps4rOyvBNrgIgxvceLUi/pexKQ5FyRTj4CayFj/EZYpZFFEG+UvKhXOpRd?=
 =?iso-8859-1?Q?E/PybJvx274Ym9dIZlPRkfh9mRaKJ1LsDJdXl5MysqsB5to6v7RaYYsMc0?=
 =?iso-8859-1?Q?mvj8Jo0GU6DdzzCW4IawM5jOtAfWYYFvp5pbsgvd2NJOjNURNQPN3l+a5p?=
 =?iso-8859-1?Q?nOla0FW7xFqbDBfKRtky6lSHk6Foa9DUGOyZdMiupnDme0kfqQlTFlape3?=
 =?iso-8859-1?Q?4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?d+LputaT3K0+UJ4IPOCS1Rmm5UV3DsirDkefe3X1tbT6IVGCD5OaSjHiNe?=
 =?iso-8859-1?Q?inwtHmrSugCYvQqkBeZUDVXE89eGXjFltc9BniVSy+8fn7/36AYIedtpOa?=
 =?iso-8859-1?Q?l2zEn4kLWy0o9GHFDKhVnDXf0RZNr5smMJKM+yyOO25xjqgIkWd4WrAwUU?=
 =?iso-8859-1?Q?1fYblmQt39uqXxiZUnEHgN3ExxNUHmb6IHpPprCqc5zkopc6JBaT8gSWAz?=
 =?iso-8859-1?Q?CAapTPgDWqzZpPm6X9d71RWh9h1NwIrNOceLjGPwhfGt4Dhrk5zkbgIZSe?=
 =?iso-8859-1?Q?htQPAmq+39/0m1PtXTbhBgsH+238KUNoa1KEPC05ZIb6Uz4HZSE78+nrIy?=
 =?iso-8859-1?Q?yypklAdJekA5LCK03d92/S4PD3tmO2Mn28g1X3THscPx7eHZkYcTWRL6ri?=
 =?iso-8859-1?Q?3agamQSyp0juDw2HlBEgPal3b1mKi85LQNbFyJ/iL8hOFlEn/nl0cYSTyL?=
 =?iso-8859-1?Q?P0YIVJPNlVCwuqVBjaDFJK8LyIIt1VvaAme4Y11sBC/qLQp4GH2oZ+YYL+?=
 =?iso-8859-1?Q?2Az9EvklDkJnXyyvnrNA4Pn/ZNvtxcKLZaGoreFNQ6yLy3wjswxsmJKPV9?=
 =?iso-8859-1?Q?zZlfhqWgec+bw6Ud5O+RRracKsCprMlxBK+F2DgRQSfpwGOHOYJJDdkA/i?=
 =?iso-8859-1?Q?w7BQ5/ikd++SdNo4P4X8mdtUg/XDMo2VJPHJasfGxZpQ+TwEAp2o0SUkGB?=
 =?iso-8859-1?Q?rJ3y6tfhhDDlAvxCDafJIC5pa8qfEqRBhqvSKKJkSihkWVX6RdQZrbj/PU?=
 =?iso-8859-1?Q?HQmR3knfNCTqfFgD3RvNYFbH7yuSj2FQqaHjSaiiHaeivI8SlzmLhk9dva?=
 =?iso-8859-1?Q?Bi/dX2kRnJ/bC+pqq7IbqIL1o/IdYpNy/NmLyCzKbb0gUQ4E7D7JjcoiiL?=
 =?iso-8859-1?Q?7JwTn3iI2HzZiqzqPny6sX3hWkb92tGW4VALc7r0auawoFJ/+7sCRtgG6K?=
 =?iso-8859-1?Q?0EcDL57GS3GFydZWsWdZbHf5Lk4apewPleVoT8m/cIuF25a753rCo//d4R?=
 =?iso-8859-1?Q?Im0HtAgp+ExGBgehhPM9k/xGdBc1kpjuy1jBOKidI8cN9zvvf1YCriwfha?=
 =?iso-8859-1?Q?a4FsVo9gT7zVviTn9U2zYoy9XYD3la6mKAG3YTOzat0W/t1TPbf4173qS6?=
 =?iso-8859-1?Q?AtOQx9ld3X0/Q+HR9o7aTtX+8Vvga+OLdRPuJ4sainwjGPAHkHHfG3qs3c?=
 =?iso-8859-1?Q?BrhwhGG11bnWxF9OHMlJWmv4kzZ/qD9lNWvsQlKgE9Js3Pb/4bsLjexsk9?=
 =?iso-8859-1?Q?4n0G3oepD/CnokyJ/5TZ2kXyJA5PLctBJZTg2yT6zKVqtf8+JSLcD5KjlR?=
 =?iso-8859-1?Q?JdaQxQDp38qDaOO6M5w0Mt3l8Kx8LGfgpHCAwJ3TBw0ZU4gv6DxqzKEl2o?=
 =?iso-8859-1?Q?KjrsmnIlNC198sukzzfab6hiZL6mL1Srs2wMIPGiKS5vnmvQj5Uf7La2AU?=
 =?iso-8859-1?Q?OenTT0PIBluN2g52J9AcZ4xTXiwtrW8CtYkpMRGt7seQS5VcOGcRuZum2Y?=
 =?iso-8859-1?Q?qOgXYCu4ClPTjWhvQgK+0A2i+M7wazLlQLlXZJP7X/Z6UyMK/ezlR6ge2a?=
 =?iso-8859-1?Q?ya4C9h2zhGFKhl6KSbou+yi9Zve5vCnR/dWOpGaB8SyRX+7POdY0bfaV6v?=
 =?iso-8859-1?Q?1FiGM0Y4OD+451tKeX75G14M5y8UiT7phtiapDQB8DmN0UtMXSicjgUg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c892fa2-d425-4e9d-e8df-08dddad99c27
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 02:23:52.3860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d0oKmVQ22+2xjjWU4U4Z8Xspcjz6GI3aDj0m3LMm5B8Dic/ksgs3fFqbeGlCe4TWarqCU20NvHjPhTXOw/+EiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7796
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

On Wed, Aug 13, 2025 at 12:51:12PM +0200, Thomas Hellström wrote:
> Use the xe_validation_guard() to convert xe_bo_create_user()
> for exhaustive eviction.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/tests/xe_bo.c      |  16 ++--
>  drivers/gpu/drm/xe/tests/xe_dma_buf.c |   4 +-
>  drivers/gpu/drm/xe/tests/xe_migrate.c |  12 +--
>  drivers/gpu/drm/xe/xe_bo.c            | 116 +++++++++++++++++---------
>  drivers/gpu/drm/xe/xe_bo.h            |   9 +-
>  drivers/gpu/drm/xe/xe_device.c        |   2 +
>  drivers/gpu/drm/xe/xe_device_types.h  |   3 +
>  drivers/gpu/drm/xe/xe_vm.c            |  14 ++++
>  drivers/gpu/drm/xe/xe_vm.h            |   2 +
>  9 files changed, 116 insertions(+), 62 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
> index 06ceba6c3c25..42f914692a02 100644
> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> @@ -139,8 +139,8 @@ static void ccs_test_run_tile(struct xe_device *xe, struct xe_tile *tile,
>  	else
>  		kunit_info(test, "Testing system memory\n");
>  
> -	bo = xe_bo_create_user(xe, NULL, NULL, SZ_1M, DRM_XE_GEM_CPU_CACHING_WC,
> -			       bo_flags);
> +	bo = xe_bo_create_user(xe, NULL, SZ_1M, DRM_XE_GEM_CPU_CACHING_WC,
> +			       bo_flags, exec);
>  	if (IS_ERR(bo)) {
>  		KUNIT_FAIL(test, "Failed to create bo.\n");
>  		return;
> @@ -220,18 +220,18 @@ static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struc
>  
>  	for (i = 0; i < 2; ++i) {
>  		xe_vm_lock(vm, false);
> -		bo = xe_bo_create_user(xe, NULL, vm, 0x10000,
> +		bo = xe_bo_create_user(xe, vm, 0x10000,
>  				       DRM_XE_GEM_CPU_CACHING_WC,
> -				       bo_flags);
> +				       bo_flags, exec);
>  		xe_vm_unlock(vm);
>  		if (IS_ERR(bo)) {
>  			KUNIT_FAIL(test, "bo create err=%pe\n", bo);
>  			break;
>  		}
>  
> -		external = xe_bo_create_user(xe, NULL, NULL, 0x10000,
> +		external = xe_bo_create_user(xe, NULL, 0x10000,
>  					     DRM_XE_GEM_CPU_CACHING_WC,
> -					     bo_flags);
> +					     bo_flags, NULL);
>  		if (IS_ERR(external)) {
>  			KUNIT_FAIL(test, "external bo create err=%pe\n", external);
>  			goto cleanup_bo;
> @@ -497,9 +497,9 @@ static int shrink_test_run_device(struct xe_device *xe)
>  		INIT_LIST_HEAD(&link->link);
>  
>  		/* We can create bos using WC caching here. But it is slower. */
> -		bo = xe_bo_create_user(xe, NULL, NULL, XE_BO_SHRINK_SIZE,
> +		bo = xe_bo_create_user(xe, NULL, XE_BO_SHRINK_SIZE,
>  				       DRM_XE_GEM_CPU_CACHING_WB,
> -				       XE_BO_FLAG_SYSTEM);
> +				       XE_BO_FLAG_SYSTEM, NULL);
>  		if (IS_ERR(bo)) {
>  			if (bo != ERR_PTR(-ENOMEM) && bo != ERR_PTR(-ENOSPC) &&
>  			    bo != ERR_PTR(-EINTR) && bo != ERR_PTR(-ERESTARTSYS))
> diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> index 965dd3280468..8126b35f4aeb 100644
> --- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> @@ -122,8 +122,8 @@ static void xe_test_dmabuf_import_same_driver(struct xe_device *xe)
>  		size = SZ_64K;
>  
>  	kunit_info(test, "running %s\n", __func__);
> -	bo = xe_bo_create_user(xe, NULL, NULL, size, DRM_XE_GEM_CPU_CACHING_WC,
> -			       params->mem_mask);
> +	bo = xe_bo_create_user(xe, NULL, size, DRM_XE_GEM_CPU_CACHING_WC,
> +			       params->mem_mask, NULL);
>  	if (IS_ERR(bo)) {
>  		KUNIT_FAIL(test, "xe_bo_create() failed with err=%ld\n",
>  			   PTR_ERR(bo));
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index dfb445d09759..afa794e56065 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -642,11 +642,11 @@ static void validate_ccs_test_run_tile(struct xe_device *xe, struct xe_tile *til
>  	struct drm_exec *exec;
>  	long ret;
>  
> -	sys_bo = xe_bo_create_user(xe, NULL, NULL, SZ_4M,
> +	sys_bo = xe_bo_create_user(xe, NULL, SZ_4M,
>  				   DRM_XE_GEM_CPU_CACHING_WC,
>  				   XE_BO_FLAG_SYSTEM |
>  				   XE_BO_FLAG_NEEDS_CPU_ACCESS |
> -				   XE_BO_FLAG_PINNED);
> +				   XE_BO_FLAG_PINNED, NULL);
>  
>  	if (IS_ERR(sys_bo)) {
>  		KUNIT_FAIL(test, "xe_bo_create() failed with err=%ld\n",
> @@ -669,10 +669,10 @@ static void validate_ccs_test_run_tile(struct xe_device *xe, struct xe_tile *til
>  	}
>  	xe_bo_unlock(sys_bo);
>  
> -	ccs_bo = xe_bo_create_user(xe, NULL, NULL, SZ_4M,
> +	ccs_bo = xe_bo_create_user(xe, NULL, SZ_4M,
>  				   DRM_XE_GEM_CPU_CACHING_WC,
>  				   bo_flags | XE_BO_FLAG_NEEDS_CPU_ACCESS |
> -				   XE_BO_FLAG_PINNED);
> +				   XE_BO_FLAG_PINNED, NULL);
>  
>  	if (IS_ERR(ccs_bo)) {
>  		KUNIT_FAIL(test, "xe_bo_create() failed with err=%ld\n",
> @@ -694,10 +694,10 @@ static void validate_ccs_test_run_tile(struct xe_device *xe, struct xe_tile *til
>  	}
>  	xe_bo_unlock(ccs_bo);
>  
> -	vram_bo = xe_bo_create_user(xe, NULL, NULL, SZ_4M,
> +	vram_bo = xe_bo_create_user(xe, NULL, SZ_4M,
>  				    DRM_XE_GEM_CPU_CACHING_WC,
>  				    bo_flags | XE_BO_FLAG_NEEDS_CPU_ACCESS |
> -				    XE_BO_FLAG_PINNED);
> +				    XE_BO_FLAG_PINNED, NULL);
>  	if (IS_ERR(vram_bo)) {
>  		KUNIT_FAIL(test, "xe_bo_create() failed with err=%ld\n",
>  			   PTR_ERR(vram_bo));
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index e71addf51ed0..5e40b6cb8d2a 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2185,30 +2185,66 @@ struct xe_bo *xe_bo_create_locked(struct xe_device *xe, struct xe_tile *tile,
>  				     flags, 0, exec);
>  }
>  
> -struct xe_bo *xe_bo_create_user(struct xe_device *xe, struct xe_tile *tile,
> -				struct xe_vm *vm, size_t size,
> -				u16 cpu_caching,
> -				u32 flags)
> -{
> -	struct drm_exec *exec = vm ? xe_vm_validation_exec(vm) : XE_VALIDATION_UNIMPLEMENTED;
> -	struct xe_bo *bo = __xe_bo_create_locked(xe, tile, vm, size, 0, ~0ULL,
> -						 cpu_caching, ttm_bo_type_device,
> -						 flags | XE_BO_FLAG_USER, 0, exec);
> -	if (!IS_ERR(bo))
> -		xe_bo_unlock_vm_held(bo);
> +static struct xe_bo *xe_bo_create_novm(struct xe_device *xe, struct xe_tile *tile,
> +				       size_t size, u16 cpu_caching,
> +				       enum ttm_bo_type type, u32 flags,
> +				       u64 alignment, bool intr)
> +{
> +	u32 drm_exec_flags = intr ? DRM_EXEC_INTERRUPTIBLE_WAIT : 0;
> +	struct xe_validation_ctx ctx;
> +	struct drm_exec exec;
> +	struct xe_bo *bo;
> +	int ret = 0;
>  
> -	return bo;
> +	xe_validation_guard(&ctx, &xe->val, &exec, drm_exec_flags, ret, false) {
> +		bo = __xe_bo_create_locked(xe, tile, NULL, size, 0, ~0ULL,
> +					   cpu_caching, type, flags, alignment, &exec);
> +		drm_exec_retry_on_contention(&exec);
> +		if (IS_ERR(bo)) {
> +			ret = PTR_ERR(bo);
> +			xe_validation_retry_on_oom(&ctx, &ret);
> +		} else {
> +			xe_bo_unlock(bo);
> +		}
> +	}
> +
> +	return ret ? ERR_PTR(ret) : bo;
>  }
>  
> -struct xe_bo *xe_bo_create(struct xe_device *xe, struct xe_tile *tile,
> -			   struct xe_vm *vm, size_t size,
> -			   enum ttm_bo_type type, u32 flags)
> +/**
> + * xe_bo_create_user() - Create a user BO
> + * @xe: The xe device.
> + * @vm: The local vm or NULL for external objects.
> + * @size: The storage size to use for the bo.
> + * @cpu_caching: The caching mode to be used for system backing store.
> + * @flags: XE_BO_FLAG_ flags.
> + * @exec: The drm_exec transaction to use for exhaustive eviction, or NULL
> + * if such a transaction should be initiated by the call.
> + *
> + * Create a bo on behalf of user-space.
> + *
> + * Return: The buffer object on success. Negative error pointer on failure.
> + */
> +struct xe_bo *xe_bo_create_user(struct xe_device *xe,
> +				struct xe_vm *vm, size_t size,
> +				u16 cpu_caching,
> +				u32 flags, struct drm_exec *exec)
>  {
> -	struct drm_exec *exec = vm ? xe_vm_validation_exec(vm) : XE_VALIDATION_UNIMPLEMENTED;
> -	struct xe_bo *bo = xe_bo_create_locked(xe, tile, vm, size, type, flags, exec);
> +	struct xe_bo *bo;
> +
> +	flags |= XE_BO_FLAG_USER;
>  
> -	if (!IS_ERR(bo))
> -		xe_bo_unlock_vm_held(bo);
> +	if (vm || exec) {
> +		xe_assert(xe, exec);
> +		bo = __xe_bo_create_locked(xe, NULL, vm, size, 0, ~0ULL,
> +					   cpu_caching, ttm_bo_type_device,
> +					   flags, 0, exec);
> +		if (!IS_ERR(bo))
> +			xe_bo_unlock_vm_held(bo);
> +	} else {
> +		bo = xe_bo_create_novm(xe, NULL, size, cpu_caching,
> +				       ttm_bo_type_device, flags, 0, true);
> +	}
>  
>  	return bo;
>  }
> @@ -2757,8 +2793,9 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>  	struct xe_device *xe = to_xe_device(dev);
>  	struct xe_file *xef = to_xe_file(file);
>  	struct drm_xe_gem_create *args = data;
> +	struct xe_validation_ctx ctx;
> +	struct drm_exec exec;
>  	struct xe_vm *vm = NULL;
> -	ktime_t end = 0;
>  	struct xe_bo *bo;
>  	unsigned int bo_flags;
>  	u32 handle;
> @@ -2832,25 +2869,26 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>  			return -ENOENT;
>  	}
>  
> -retry:
> -	if (vm) {
> -		err = xe_vm_lock(vm, true);
> -		if (err)
> -			goto out_vm;
> +	err = 0;
> +	xe_validation_guard(&ctx, &xe->val, &exec,
> +			    DRM_EXEC_INTERRUPTIBLE_WAIT, err, false) {
> +		if (vm) {
> +			err = xe_vm_drm_exec_lock(vm, &exec);
> +			drm_exec_retry_on_contention(&exec);
> +			if (err)
> +				break;
> +		}
> +		bo = xe_bo_create_user(xe, vm, args->size, args->cpu_caching,
> +				       bo_flags, &exec);
> +		drm_exec_retry_on_contention(&exec);
> +		if (IS_ERR(bo)) {
> +			err = PTR_ERR(bo);
> +			xe_validation_retry_on_oom(&ctx, &err);
> +			break;
> +		}
>  	}
> -
> -	bo = xe_bo_create_user(xe, NULL, vm, args->size, args->cpu_caching,
> -			       bo_flags);
> -
> -	if (vm)
> -		xe_vm_unlock(vm);
> -
> -	if (IS_ERR(bo)) {
> -		err = PTR_ERR(bo);
> -		if (xe_vm_validate_should_retry(NULL, err, &end))
> -			goto retry;
> +	if (err)
>  		goto out_vm;
> -	}
>  
>  	if (args->extensions) {
>  		err = gem_create_user_extensions(xe, bo, args->extensions, 0);
> @@ -3223,11 +3261,11 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
>  	args->size = ALIGN(mul_u32_u32(args->pitch, args->height),
>  			   page_size);
>  
> -	bo = xe_bo_create_user(xe, NULL, NULL, args->size,
> +	bo = xe_bo_create_user(xe, NULL, args->size,
>  			       DRM_XE_GEM_CPU_CACHING_WC,
>  			       XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
>  			       XE_BO_FLAG_SCANOUT |
> -			       XE_BO_FLAG_NEEDS_CPU_ACCESS);
> +			       XE_BO_FLAG_NEEDS_CPU_ACCESS, NULL);
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
>  
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index b1b6cb622d71..c6bb90ca5c2e 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -104,13 +104,8 @@ struct xe_bo *xe_bo_create_locked(struct xe_device *xe, struct xe_tile *tile,
>  				  struct xe_vm *vm, size_t size,
>  				  enum ttm_bo_type type, u32 flags,
>  				  struct drm_exec *exec);
> -struct xe_bo *xe_bo_create(struct xe_device *xe, struct xe_tile *tile,
> -			   struct xe_vm *vm, size_t size,
> -			   enum ttm_bo_type type, u32 flags);
> -struct xe_bo *xe_bo_create_user(struct xe_device *xe, struct xe_tile *tile,
> -				struct xe_vm *vm, size_t size,
> -				u16 cpu_caching,
> -				u32 flags);
> +struct xe_bo *xe_bo_create_user(struct xe_device *xe, struct xe_vm *vm, size_t size,
> +				u16 cpu_caching, u32 flags, struct drm_exec *exec);
>  struct xe_bo *xe_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
>  				   struct xe_vm *vm, size_t size,
>  				   enum ttm_bo_type type, u32 flags);
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 3e0402dff423..6b152aa89dbb 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -452,6 +452,8 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  	if (err)
>  		goto err;
>  
> +	xe_validation_device_init(&xe->val);
> +
>  	init_waitqueue_head(&xe->ufence_wq);
>  
>  	init_rwsem(&xe->usm.lock);
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 01e8fa0d2f9f..a4eb32bac151 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -26,6 +26,7 @@
>  #include "xe_sriov_vf_ccs_types.h"
>  #include "xe_step_types.h"
>  #include "xe_survivability_mode_types.h"
> +#include "xe_validation.h"
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>  #define TEST_VM_OPS_ERROR
> @@ -575,6 +576,8 @@ struct xe_device {
>  	 */
>  	atomic64_t global_total_pages;
>  #endif
> +	/** @val: The domain for exhaustive eviction, which is currently per device. */
> +	struct xe_validation_device val;
>  
>  	/* private: */
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 600aaadb4bee..1c2d9d9065c6 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -47,6 +47,20 @@ static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
>  	return vm->gpuvm.r_obj;
>  }
>  
> +/**
> + * xe_vm_drm_exec_lock() - Lock the vm's resv with a drm_exec transaction
> + * @vm: The vm whose resv is to be locked.
> + * @exec: The drm_exec transaction.
> + *
> + * Helper to lock the vm's resv as part of a drm_exec transaction.
> + *
> + * Return: %0 on success. See drm_exec_lock_obj() for error codes.
> + */
> +int xe_vm_drm_exec_lock(struct xe_vm *vm, struct drm_exec *exec)
> +{
> +	return drm_exec_lock_obj(exec, xe_vm_obj(vm));
> +}
> +
>  /**
>   * xe_vma_userptr_check_repin() - Advisory check for repin needed
>   * @uvma: The userptr vma
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 4ba26eed7e96..3b6e7234dac4 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -292,6 +292,8 @@ void xe_vm_kill(struct xe_vm *vm, bool unlocked);
>   */
>  #define xe_vm_assert_held(vm) dma_resv_assert_held(xe_vm_resv(vm))
>  
> +int xe_vm_drm_exec_lock(struct xe_vm *vm, struct drm_exec *exec);
> +
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)
>  #define vm_dbg drm_dbg
>  #else
> -- 
> 2.50.1
> 
