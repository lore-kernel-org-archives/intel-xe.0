Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7ACD30CDB
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 00:10:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B166310E37F;
	Wed, 14 Jan 2026 00:10:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HkSGdk5M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAAB010E37F
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 00:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768349451; x=1799885451;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+nvNIw/BISMoCKHj1j9kMGp+XaJzTKxo1gdNHKsXd0U=;
 b=HkSGdk5My7t2OsPOzi40m6iZCe6otFfA6gtaEVmPbFSgs81HmbCme4p3
 cbscKD3UEWAExgaaJrz8EIxA25jftFLthBl3iBb4r8xNaBIamuo/v+EeE
 sd3bNPi564GsQ1kNQxT4E7TEHuFqCwzzpLCzlkdbFS38dQTsA21xjclcq
 bmB7nKWknTXPETRf1kAEygwHMCTrNTanUCPnR0Y9m+cBKb2kFPg2BTLXW
 Gq145Lojy9VWA8MKYQNr3M61LDICABWRMUbW0/R/qaV0HPiJun5Td1xdn
 vRKQVy4bj3wUfN0JF3RwhNAdUifc6j7bOhtuugptUZoT7x1JHiZsSEkE2 w==;
X-CSE-ConnectionGUID: ReR+/pwWQDWnmjr6gIVqqQ==
X-CSE-MsgGUID: Dr1Eap31R5ma/vKR8MNL9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69701662"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="69701662"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 16:10:51 -0800
X-CSE-ConnectionGUID: PQF9SWXKTseCuPvRfKAhSw==
X-CSE-MsgGUID: on3T1reeSlOovpsSNQwh5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="235774725"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 16:10:50 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 16:10:49 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 16:10:49 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.58) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 16:10:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CCl1+H/TS27kr2OEHYhLM0G3ZTOK1uzKOtX0ghryBVUQHTZKtAUTLjm1Kbb6X/ZAvxeNfZrLqyKKgJjwYErIJvL/dTVy1Cb8J7QA9di13o+AQ5H3R8JFEf0yIJwCOaHmkJ6xgmkw2mL49Tsg6vpXym3PIn0XLfXvAk73+Dh9hWDKACWNUMAxIK6iDf+n5Bg8PiPQkAQduRBVu45lCLfA14tMKlYI5WYEN6zRdxVoorm89rpSnrGNWUTrltEz+7oEZARCKCl487aoKVp1z91kl44ohoqDAOY/UG344gNd4qFgTCeH3RrV4eTuz+Q8HQDpDAmkndzhPGe5DWHsNrtBVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/jbV8g9tGyWkyc6PINtl/FPLTLKsDnd78sG2cvRrQxY=;
 b=zV3cwJ1BPsDchUUry8aG3WnM1+N8Yon5wd9v2t8hvXdGSLbLjagtjjaRFD6reAWyZ+teUbZpZsCYyYM/HDtUus+y+P+LVblxiRXp7gtRpemxbdeT711yOw2KoBjB5RCkZBtyL91MqI0Cb/ETdXc36vUpphGZIw8UYLJws5ocLJuunDTQ4AfDHUD0MznlInG9ZxO6+UYG35Rv6Sn2U+TT8m6NMQ5FQY8vLtCPv6zmuOId5XXwJFrJ3naaJaKjNe38h8EOmTyPO+7nm9rMYbLejR59IcY9C8wRg5wMUwV2Fpo1SypeiwnqZ9gsvp1YWLIdhrW3JUzslnZmioLDNjdYig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6474.namprd11.prod.outlook.com (2603:10b6:510:1f2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 00:10:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Wed, 14 Jan 2026
 00:10:41 +0000
Date: Tue, 13 Jan 2026 16:10:39 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 00/79] Cleanup unused headers reported by clangd
Message-ID: <aWbe/6D9Fvmg9rzi@lstrano-desk.jf.intel.com>
References: <20260113230315.3081153-81-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260113230315.3081153-81-matthew.d.roper@intel.com>
X-ClientProxiedBy: BY5PR16CA0032.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::45) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6474:EE_
X-MS-Office365-Filtering-Correlation-Id: 90c97adc-f5ba-4105-4e0d-08de53015ad3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uVt6bNmct7auJnuOYOVC/kY81UsFH6nIWaj3Uv5lQ/lJ7UcWppqSR/E4EP74?=
 =?us-ascii?Q?6hBPki+rpjb1ibpmyIBRZgnqRw1RodPbnNJD1/F9gpGaTmUhF5RilU64xxt6?=
 =?us-ascii?Q?4vjfRSzJQ6tp/eOXwMR8BHp7cgULmNJxYP1dr2RCExKrurl5ZUBxB94OgT6+?=
 =?us-ascii?Q?Ss2vebATDrdhkonHjuenXI9ANd1gDDCncgnXctycJHRrXr05oZAWlBp/pQmS?=
 =?us-ascii?Q?8UNkqouT+yMCW/OJ6HFh1OQszm/jcvKzVi6m18j090WlBmlwfH2gsxPWYK98?=
 =?us-ascii?Q?13mEJgoP1bJ8vZ4M299bQ6qW5e+vW8ZMJkGH6C4ObqdFpYgnrGa2xqc0rU5X?=
 =?us-ascii?Q?t1oYogI0G73N68ady4dcoExM5c6ydD+exvmOqvBTSLvTRWiaqHR9DLiUG74E?=
 =?us-ascii?Q?sWIWj2kf/CzYrCbPmiggt+dGOOuozZVEJ68ipMI3c7oN9NRnhdaykP6z+j1i?=
 =?us-ascii?Q?0ZxxQaC4O4URbWWPJySzD/XpUuxUjaTcFuI7L0Q9QGGRz+bDAlF429rCCGQQ?=
 =?us-ascii?Q?qbqvMGsq1gmIl8DsFROCEH/roLobvM+THRYQ/JlkvNzsFAw+ZqWpq8Ir0GWc?=
 =?us-ascii?Q?NTWVRsuDwoTpClv/Sf26qusHIADcA7xUTbEtqZOduziJ1DQT+yjvkXrW1SJV?=
 =?us-ascii?Q?kvpFnIN5kFg1QknCXbZaKsEKuxwovEj8LO7hTH2UNamjWeZlAd7ND9aZYNXG?=
 =?us-ascii?Q?628f22elMdeMR1/IER2yebSLts1gGiL1xf3mxwsXCvqyOSgCHCaiTmFAPSdo?=
 =?us-ascii?Q?gUJI7QGKZVduq4sqZGZ7JyUHnxI4uNdNJ+5v1e3M0zVAoj1OEGJt3XULm4jN?=
 =?us-ascii?Q?PviBRecLZ2zW7K+VaZ+ZU/f9Kbw/1tYrR8G2Hjx2fR7z3exix/ddTC2L7wbu?=
 =?us-ascii?Q?rAYi+B4TodHjZwze+J2KH7JbQ5vmCR/lCqArR67mW2L/XypDamkZ3bc40ICe?=
 =?us-ascii?Q?BnzHZqCzA6Z7Joh1xkZJZJi/ozXcT4HwwlrtN+GfSvaqzn5dAIkXZ6xkY13d?=
 =?us-ascii?Q?fsH4iQSMMY+xBSQ5d0BxgCbysAtDy90vxONBridN7Td3tua0rMLXqhNBfUoO?=
 =?us-ascii?Q?eeECSZfjFLqp7C/S4YLr1IN2OAaVg5vFIAqxPYxwnrBl8iatnzp0WGOATiVT?=
 =?us-ascii?Q?3WzWXC9WdOg3An4iqcZG1oriiHk4G6NFLYB+du4tDoR2FrI/yyYLz+bdtqwk?=
 =?us-ascii?Q?7E5Rfq2DDxOBBXqvS8UFRwX8UgQY4HI+xrSzLZcEFoZ1XFDsJecMf3W3v5ci?=
 =?us-ascii?Q?3JBM5dovmbRhfA6x4KeFoiDP8aK2a5laNlNoj7N8K8s4WG8pGMw2N2/zZQhI?=
 =?us-ascii?Q?71ksTqvxpURwgvkAiI9bGNWDGYsw1ePnSE6WPYInNuy+oXmladnlUGJfTEh9?=
 =?us-ascii?Q?5C6b/cVrxyXG+X43bZAQ7xKUskmVKX+mOwJnMC6znHMLLAODQQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZG4NiqW6eR3HAXqFmkQaTNOrZk80Riitn+UF5fsqGPuHc1ZadeG6EqgAufFP?=
 =?us-ascii?Q?BVqIGZNaPL1RabBw48T1+IeqaJpOQf6Oe3d3qBZDO9pIiMgxj/RTDluKLX+I?=
 =?us-ascii?Q?R1VmQ1g4R+zvmHsiBBWjB6O2m25CE+yR5uSrrn1cwPt0zeKQt0Jyu5UAQ0x2?=
 =?us-ascii?Q?OSjyxxcXs6U5+MH1VuQWbJMuQNECT9GGLw2i/cwMItuZtCx7BZEhH9W93nU0?=
 =?us-ascii?Q?m3mcgOaVGNYpElQT3ljl5He6+2p4++UBsrPdXZn7VYlPpqtpRBO8P8EpuASD?=
 =?us-ascii?Q?gUfd0/KDoB5SULNbtTG8MXhTK4dUrTsOfKEh1thVk8nQmfO4IglY7Meb9thU?=
 =?us-ascii?Q?nsNNcfOk93mkuKUrajcsH19pmDoY33ZM7oy4tm62fhAzmXocAxTVXcBSfZOh?=
 =?us-ascii?Q?MOsIpuKC3MP26FSOQjJoAR9ZlZHN+8TmeYna+hzikkX/wsLMxqcRnsXkI6cj?=
 =?us-ascii?Q?G9by6qEbX5bomK9G/WOFkZDEQraCpyxhcWqurfL0QZOFvOmmLu7Qi4pmNo4s?=
 =?us-ascii?Q?42pH+iDKBZZV1lIqOkVsiWjWE6gH4mGhydKW4KCHnsKOdc9q2c/r/apwL6Uv?=
 =?us-ascii?Q?7ZL/FdI4KX7kXVJHU+qsMiW7pss+XcweSZnsaeJ+cmUnGm3B1QG4CsJ9vDy4?=
 =?us-ascii?Q?WADDklfej5E9qXm3UAz3iZCDkgR1Q+NQ2XdMCKFecUZm7UT6Qew3/dh5jB+U?=
 =?us-ascii?Q?CKmTDsLueItn97YPMSYCzOCszlOWdNAvBnAi3njGZo06BWk4SIP81SMthUaf?=
 =?us-ascii?Q?H2LLRU2O/ytNIjNZWxNbWp/l5iUT9X36H4qtCNSSsVW/6AA1KuaZq+F8Eg4N?=
 =?us-ascii?Q?jdDyO/NbcIVXkuWfJj1YcTkJANG2cg8iGdL72+PH3/K8T47ZaO9cFoKQvH3E?=
 =?us-ascii?Q?zrk+9GZMlyZEbSEBCHwR1YcOQaZ5wsFFRypVvYMiB/NdyQ+Adt057Ed364Gr?=
 =?us-ascii?Q?FqGMP3PB+8xy0PzJr7d8rzoAQeLJBcOF3BzkBLeo4qa4jda/5H73ZWO6Em8R?=
 =?us-ascii?Q?8XgBwZgtl4KPzl0Lo7yC7JP1gyGFRTIffANfgA/nFTi8K6wGgwP9VBEA9py0?=
 =?us-ascii?Q?qbqpIEM+FwvrP2UgN+X1Z8SxOu0A/3n88J5EIBGNMTcpLSiNFq6Gh5L/nZIy?=
 =?us-ascii?Q?QepAODLxvY3SpT2k+8aPSB0d8S4VhoW2ThL+Z+CiUclCfBU242JUGb41wX2f?=
 =?us-ascii?Q?hBbD3XGuHcnb1WdMzmSzn8jL0U2B8Ags10roAmtp7t7VDwYyoJfjeNYbXwvK?=
 =?us-ascii?Q?gYbSFXuJwADlemoCSVt0c9iZH1c5CNEf/TkkUsmVwyIixoeqpJZ+73wouusQ?=
 =?us-ascii?Q?aVjI/IrvSKovhg1Ai+I1VldFLJ0uVuB9lUSh5yO6ecBZ+WdiplaVQmeqoigv?=
 =?us-ascii?Q?a45paAD/cIz5MIqVMnIFjNWAet4ugIMjOv2CSRNV9189w6RkV1bldkughv7t?=
 =?us-ascii?Q?iHbB0MkNsm6O49cNYNmCCvAgjnSWofV5hbLYzGz/YaE2+2pTT9Mg1H0FSqcj?=
 =?us-ascii?Q?eWGZX+EqMT3i5va7g29+mqZrJMX3zQzYvqIwIKOmXm6GTJ9A+sXf6F0AtxE7?=
 =?us-ascii?Q?/vEAuWeA5gVT/KOG0I9w1orcUGbD72xfK/Xxl/LtYYyNI4MVMRl2uO3RU3aI?=
 =?us-ascii?Q?f7TavhLakeI1aZQQ6mdXtx+24TtDHQBmWCwhNiwHnTutd1Be7covdN5ngrGD?=
 =?us-ascii?Q?jIP50DyBaoZCFdQ0Al6lvNFVG9z0LMLScto1VakcS/c7TJCXsciS/SO+uMs1?=
 =?us-ascii?Q?R/WvMaO4KinfhtIlvc9aL0x2ybERkPw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90c97adc-f5ba-4105-4e0d-08de53015ad3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 00:10:41.8655 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zlb4ld/CBqgRI3TvilyrtS0DNxqvyth+zS8y9iELqqTp7fRGTr2Ero/yz27KNwCV4MccMdLqgXdFBhbUxCfF2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6474
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

On Tue, Jan 13, 2026 at 03:03:05PM -0800, Matt Roper wrote:
> clangd[1] helpfully flags #include's of headers that aren't being
> directly used by the file including them.  In most cases we can either
> drop those #include statements or replace them with a more targeted
> include (such as xe_gt.h to xe_gt_types.h).  Let's drop/simplify a bunch
> of the unnecessary includes in our driver's .c files; this may help
> speed up partial rebuilds for developers since the build system won't
> see as many false dependencies.
> 

Yes, header situation isn't great.

> There's more header-related cleanup that could be done (e.g., some of
> our headers incorrectly include other headers they don't need), but that
> can wait for a follow-up series; this one is already long enough.
> 
> 
> [1] https://clangd.llvm.org/
> 

Once we get the headers into better shape can we get clangd in CI?
Without that a year from we will need another huge series of fixes to
undo all the mistakes we've made in the last year.

Matt 

> Matt Roper (79):
>   drm/xe: Cleanup headers in xe_bb.c
>   drm/xe: Drop unused header in xe_bo.c
>   drm/xe: Cleanup headers in xe_devcoredump.c
>   drm/xe: Drop unused header in xe_device.c
>   drm/xe: Drop unused header in xe_exec.c
>   drm/xe: Cleanup headers in xe_execlist.c
>   drm/xe: Drop unused headers in xe_exec_queue.c
>   drm/xe: Simplify headers in xe_ggtt.c
>   drm/xe: Cleanup headers in xe_gsc_debugfs.c
>   drm/xe: Simplify header in xe_gsc_proxy.c
>   drm/xe: Drop unused headers in xe_gsc_submit.c
>   drm/xe: Drop unused headers in xe_gt.c
>   drm/xe: Cleanup headers in xe_gt_clock.c
>   drm/xe: Drop unused header in xe_gt_debugfs.c
>   drm/xe: Drop unused header in xe_gt_idle.c
>   drm/xe: Drop unused header in xe_gt_mcr.c
>   drm/xe: Drop unused headers in xe_gt_sriov_pf_config.c
>   drm/xe: Drop unused header in xe_gt_sriov_pf_debugfs.c
>   drm/xe: Simplify header in xe_gt_sriov_pf_migration.c
>   drm/xe: Drop unused header in xe_gt_sriov_pf_policy.c
>   drm/xe: Cleanup headers in xe_gt_sriov_pf_service.c
>   drm/xe: Drop unused header in xe_gt_sriov_vf.c
>   drm/xe: Simplify header in xe_gt_stats.c
>   drm/xe: Simplify header in xe_gt_sysfs.c
>   drm/xe: Simplify header in xe_gt_throttle.c
>   drm/xe: Drop unused headers in xe_guc_ads.c
>   drm/xe: Drop unused header in xe_guc_buf.c
>   drm/xe: Cleanup headers in xe_guc_capture.c
>   drm/xe: Cleanup headers in xe_guc_debugfs.c
>   drm/xe: Simplify headers in xe_guc_hwconfig.c
>   drm/xe: Simplify header in xe_guc_log.c
>   drm/xe: Cleanup headers in xe_guc_relay.c
>   drm/xe: Drop unused headers in xe_guc_submit.c
>   drm/xe: Drop unused header in xe_heci_gsc.c
>   drm/xe: Drop unused header in xe_huc.c
>   drm/xe: Clean up headers in xe_huc_debugfs.c
>   drm/xe: Drop unused header in xe_hw_engine.c
>   drm/xe: Simplify include in xe_hw_engine_class_sysfs.c
>   drm/xe: Simplify include in xe_hw_engine_group.c
>   drm/xe: Cleanup headers in xe_hw_fence.c
>   drm/xe: Cleanup headers in xe_i2c.c
>   drm/xe: Drop unused header in xe_irq.c
>   drm/xe: Drop unused headers in xe_memirq.c
>   drm/xe: Drop unused headers in xe_mmio.c
>   drm/xe: Drop unused headers in xe_mocs.c
>   drm/xe: Simplify include in xe_module.c
>   drm/xe: Drop unused header in xe_nvm.c
>   drm/xe: Drop unused headers in xe_page_reclaim.c
>   drm/xe: Drop unused header in xe_pci.c
>   drm/xe: Simplify include in xe_psmi.c
>   drm/xe: Drop unused header in xe_pxp.c
>   drm/xe: Simplify header in xe_pxp_debugfs.c
>   drm/xe: Cleanup headers in xe_reg_sr.c
>   drm/xe: Drop unused headers in xe_reg_whitelist.c
>   drm/xe: Cleanup headers in xe_ring_ops.c
>   drm/xe: Drop unused header in xe_rtp.c
>   drm/xe: Simplify header in xe_sa.c
>   drm/xe: Simplify header in xe_sched_job.c
>   drm/xe: Drop unused header in xe_sriov_packet.c
>   drm/xe: Drop unused header in xe_sriov_pf_debugfs.c
>   drm/xe: Drop unused header in xe_sriov_vf.c
>   drm/xe: Cleanup headers in xe_step.c
>   drm/xe: Drop unused header in xe_survivability_mode.c
>   drm/xe: Cleanup headers in xe_tile.c
>   drm/xe: Cleanup headers in xe_tlb_inval.c
>   drm/xe: Drop unused header in xe_ttm_stolen_mgr.c
>   drm/xe: Drop unused header in xe_ttm_sys_mgr.c
>   drm/xe: Drop unused header in xe_ttm_vram_mgr.c
>   drm/xe: Drop unused headers in xe_uc.c
>   drm/xe: Cleanup headers in xe_uc_debugfs.c
>   drm/xe: Simplify header in xe_uc_fw.c
>   drm/xe: Drop unused header in xe_validation.c
>   drm/xe: Drop unused header in xe_vm.c
>   drm/xe: Drop unused headers in xe_vram.c
>   drm/xe: Drop unused header in xe_vram_freq.c
>   drm/xe: Drop unused header in xe_vsec.c
>   drm/xe: Simplify header in xe_wa.c
>   drm/xe: Drop unused header in xe_wait_user_fence.c
>   drm/xe: Simplify header in xe_wopcm.c
> 
>  drivers/gpu/drm/xe/tests/xe_bo.c              | 1 +
>  drivers/gpu/drm/xe/xe_bb.c                    | 3 +--
>  drivers/gpu/drm/xe/xe_bo.c                    | 1 -
>  drivers/gpu/drm/xe/xe_devcoredump.c           | 3 +--
>  drivers/gpu/drm/xe/xe_device.c                | 1 -
>  drivers/gpu/drm/xe/xe_exec.c                  | 1 -
>  drivers/gpu/drm/xe/xe_exec_queue.c            | 2 --
>  drivers/gpu/drm/xe/xe_execlist.c              | 3 +--
>  drivers/gpu/drm/xe/xe_ggtt.c                  | 3 +--
>  drivers/gpu/drm/xe/xe_gsc_debugfs.c           | 5 ++---
>  drivers/gpu/drm/xe/xe_gsc_proxy.c             | 2 +-
>  drivers/gpu/drm/xe/xe_gsc_submit.c            | 2 --
>  drivers/gpu/drm/xe/xe_gt.c                    | 2 --
>  drivers/gpu/drm/xe/xe_gt_clock.c              | 6 +-----
>  drivers/gpu/drm/xe/xe_gt_debugfs.c            | 1 -
>  drivers/gpu/drm/xe/xe_gt_idle.c               | 1 -
>  drivers/gpu/drm/xe/xe_gt_mcr.c                | 1 -
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 2 --
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   | 1 -
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 2 +-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c    | 1 -
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c   | 5 ++---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c           | 1 -
>  drivers/gpu/drm/xe/xe_gt_stats.c              | 2 +-
>  drivers/gpu/drm/xe/xe_gt_sysfs.c              | 2 +-
>  drivers/gpu/drm/xe/xe_gt_throttle.c           | 2 +-
>  drivers/gpu/drm/xe/xe_guc_ads.c               | 2 --
>  drivers/gpu/drm/xe/xe_guc_buf.c               | 1 -
>  drivers/gpu/drm/xe/xe_guc_capture.c           | 5 +----
>  drivers/gpu/drm/xe/xe_guc_debugfs.c           | 5 ++---
>  drivers/gpu/drm/xe/xe_guc_hwconfig.c          | 4 ++--
>  drivers/gpu/drm/xe/xe_guc_log.c               | 2 +-
>  drivers/gpu/drm/xe/xe_guc_relay.c             | 3 +--
>  drivers/gpu/drm/xe/xe_guc_submit.c            | 2 --
>  drivers/gpu/drm/xe/xe_heci_gsc.c              | 1 -
>  drivers/gpu/drm/xe/xe_huc.c                   | 1 -
>  drivers/gpu/drm/xe/xe_huc_debugfs.c           | 5 ++---
>  drivers/gpu/drm/xe/xe_hw_engine.c             | 1 -
>  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 2 +-
>  drivers/gpu/drm/xe/xe_hw_engine_group.c       | 2 +-
>  drivers/gpu/drm/xe/xe_hw_fence.c              | 4 +---
>  drivers/gpu/drm/xe/xe_i2c.c                   | 4 ++--
>  drivers/gpu/drm/xe/xe_irq.c                   | 1 -
>  drivers/gpu/drm/xe/xe_memirq.c                | 2 --
>  drivers/gpu/drm/xe/xe_mmio.c                  | 4 ----
>  drivers/gpu/drm/xe/xe_mocs.c                  | 2 --
>  drivers/gpu/drm/xe/xe_module.c                | 2 +-
>  drivers/gpu/drm/xe/xe_nvm.c                   | 1 -
>  drivers/gpu/drm/xe/xe_page_reclaim.c          | 4 ----
>  drivers/gpu/drm/xe/xe_pci.c                   | 1 -
>  drivers/gpu/drm/xe/xe_psmi.c                  | 2 +-
>  drivers/gpu/drm/xe/xe_pxp.c                   | 1 -
>  drivers/gpu/drm/xe/xe_pxp_debugfs.c           | 2 +-
>  drivers/gpu/drm/xe/xe_reg_sr.c                | 5 +----
>  drivers/gpu/drm/xe/xe_reg_whitelist.c         | 1 -
>  drivers/gpu/drm/xe/xe_ring_ops.c              | 4 +---
>  drivers/gpu/drm/xe/xe_rtp.c                   | 1 -
>  drivers/gpu/drm/xe/xe_sa.c                    | 2 +-
>  drivers/gpu/drm/xe/xe_sched_job.c             | 2 +-
>  drivers/gpu/drm/xe/xe_sriov_packet.c          | 1 -
>  drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      | 1 -
>  drivers/gpu/drm/xe/xe_sriov_vf.c              | 1 -
>  drivers/gpu/drm/xe/xe_step.c                  | 3 ++-
>  drivers/gpu/drm/xe/xe_survivability_mode.c    | 1 -
>  drivers/gpu/drm/xe/xe_tile.c                  | 3 +--
>  drivers/gpu/drm/xe/xe_tlb_inval.c             | 7 ++-----
>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        | 1 -
>  drivers/gpu/drm/xe/xe_ttm_sys_mgr.c           | 1 -
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          | 1 -
>  drivers/gpu/drm/xe/xe_uc.c                    | 2 --
>  drivers/gpu/drm/xe/xe_uc_debugfs.c            | 2 +-
>  drivers/gpu/drm/xe/xe_uc_fw.c                 | 2 +-
>  drivers/gpu/drm/xe/xe_validation.c            | 1 -
>  drivers/gpu/drm/xe/xe_vm.c                    | 1 -
>  drivers/gpu/drm/xe/xe_vram.c                  | 2 --
>  drivers/gpu/drm/xe/xe_vram_freq.c             | 1 -
>  drivers/gpu/drm/xe/xe_vsec.c                  | 1 -
>  drivers/gpu/drm/xe/xe_wa.c                    | 2 +-
>  drivers/gpu/drm/xe/xe_wait_user_fence.c       | 1 -
>  drivers/gpu/drm/xe/xe_wopcm.c                 | 2 +-
>  80 files changed, 45 insertions(+), 129 deletions(-)
> 
> -- 
> 2.52.0
> 
