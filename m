Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB75FE9E311
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 15:46:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6345910E087;
	Wed, 11 Feb 2026 15:46:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jkF3IyGj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9309A10E087
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Feb 2026 15:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770824798; x=1802360798;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4EjeqgCpxoIcbHz+lE79DCE4A9yZgdamX+j64xLkZKY=;
 b=jkF3IyGj+woxpjKEl60QNSxXBJHFX/e0fGlRkjyEm4Ph5dYUGcdCNSZy
 iz6soUHHUEebDOHIjDLPwy3dYezs1ULC1Er88o/dbQ90CaZzLrMfCAWgT
 KtmD1wFNLLlK8TBRzlHHKjRECc0xInSYeW1/rc0Avaw2nIX2dijCnyqMb
 9tHWcgIN5EJOGgmV2/hISDfXqSFNqdCr78FxXrkJkXC8DHsf8qA53Vr92
 gRPkr/f9+OlrMZHrib5AzUM8pJE14HTtLAOlDbcN7YXRhqdvW8h/LQFH1
 68IjkOJQvcaXbcDIUjL6FZEXfIymPSon+kp2GyjchQacG6KiDG2boDL2q A==;
X-CSE-ConnectionGUID: OtrLulOBSFK0CmA0SV65gA==
X-CSE-MsgGUID: Ww2GNHiPSd6JkPn8esOO4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="71875377"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="71875377"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 07:46:38 -0800
X-CSE-ConnectionGUID: iwTYHWejS/ui4gnmUDSg1g==
X-CSE-MsgGUID: vd1LuXFLSV2ZEUTxODBtsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="212310704"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 07:46:38 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 07:46:37 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 11 Feb 2026 07:46:37 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.62) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 07:46:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=osniyHdnTNaSPlYMMMFbnBAa+q9fejuJOYwuPX/4RO8yfLk+tkIfnPEBJiIzzmm0J2saFKSlSey2LCkHYIRDQ779PjrPhlIRXsI3d+ldqLzqSOGKyCk+IISRXXuJ8UoDpHZQRrDnUuOaHesIRP6k1KfnkRfWWSfLKqCxR4m4WIZRqOk0tEoDgEYQpNcbAvCGo7WZJ+eyLxke/l+37+vkMJwd72BIx2PZY+8+jl2GHmy8T9XehM5PexQYETDlWIQ+6L+WCBOoWfWbwMgfUKDMxYgb4Z0lUl1UZ0vne9M7S1/QBdA1uq1au2MfJ5oaX36tWSDzO3ueSG1Tve8Dtpjevg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y16hFdQRnomKETTwoHajmq6/1QewO9LK/Wrg4ViO7qA=;
 b=DyiMVylgshKDaTiHttr0Ir8QM8/N483C22KtuuQF1hE/TMoEILttBFUc+oBOq3GIGfWUvnS39xoCjPvIJBk3sh2Cn4XIxUq1X+iQqNZe3LrKYsRogr9Ibhd96LpaOL62MbmAJTzQmzCQzvlHKOyj1x1SfQRfaazM7LfqRkYSZTIEIplsc05l8OiPM7PGhT9do1tFjJnU9hzacyeznrvMqbJB7XW30l/68Qph0GQsQl3bUzg6FZYRHUZkS7LWg3IZx6N9ddzSj5Pf+5rNp4SW/fLQX56hYRZaU3yEF1om4JXQE7cw/S+Xm+N+7ztamXj6DR6CBSgJnXCzZN68PecR/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7798.namprd11.prod.outlook.com (2603:10b6:930:77::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 15:46:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 15:46:34 +0000
Date: Wed, 11 Feb 2026 07:46:32 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pallavi.mishra@intel.com>
Subject: Re: [PATCH v5 0/9] drm/xe/madvise: Add support for purgeable buffer
 objects
Message-ID: <aYykWLYG1MsY46en@lstrano-desk.jf.intel.com>
References: <20260211152644.1661165-1-arvind.yadav@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260211152644.1661165-1-arvind.yadav@intel.com>
X-ClientProxiedBy: MW4PR03CA0349.namprd03.prod.outlook.com
 (2603:10b6:303:dc::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7798:EE_
X-MS-Office365-Filtering-Correlation-Id: 119f8819-e72a-4935-0d48-08de6984bc07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?6QpOP8pZBQ4oJLszj9EEJqBko99w8PmEckx0ZiaT7Xl7rcB3afEWhhzBQl?=
 =?iso-8859-1?Q?bBpLftATE6co37WQMCLszE7QEXoCCHOUBVsXrcN4Hb9uthApyy6vGSyMeF?=
 =?iso-8859-1?Q?RzWCy1+lcrPRrgjynQ+4c3nftfhyN3wSPppUr4XyH1I16/8gpttmca/gnA?=
 =?iso-8859-1?Q?B2wSqufemvEdhytDEQXDcu1P5Pkqltn9iKGXeDMOUNjVihS/6dreFqiO3h?=
 =?iso-8859-1?Q?SdYtvMpXIeDrjODcOnyd9DdoXOtTdRs6r+ET5JcwO7rOLr4126uXhc5zTU?=
 =?iso-8859-1?Q?py3Xv8UHoX1OTz1kdmbKrlaOERrzEQqQQj2GERc7ICWWamlD25OjbETux7?=
 =?iso-8859-1?Q?QIspEYca1bf18BiaSAqJ9eGVmIhhCArKHICmZZ1bVfXuEAkDAhGXCI7oD7?=
 =?iso-8859-1?Q?Ys21zvbAyq5y1xvmCY/AIqu+mtdoW0FUYAAa2tz5uzgy6yN5BWgnhW96WK?=
 =?iso-8859-1?Q?l0/c6iPPfsW0zbuDRCimbUbwSxSMZmEIIl77c4VDclv4slH4bQHlB7tSW2?=
 =?iso-8859-1?Q?f6poU+Uw4Mu/K5P0o6qvLDCwlrhHLi8SETN+a0G6TCS4wdEsYB+aZhlJvE?=
 =?iso-8859-1?Q?FLn1O3FO16v5ZOau4Ki4D9IylcCIu3KHePYITnNF1nQx4bzzA9yvb3N0UO?=
 =?iso-8859-1?Q?QASfWuQKWVbSgmP90B2aqD1srtgxO+PlvVUF22c0mudm0tf9YHKXEfPBzy?=
 =?iso-8859-1?Q?hhUpU9gluqAB3JFApZqCQn3Ot0FrxBy66EVVwUgCeIIakhUaUjSjcPwTtK?=
 =?iso-8859-1?Q?vessIhUOmIS9X/VBPuZuhdHGbZBkSIEsFss80JcAtZpkACg6W31vNtN9zV?=
 =?iso-8859-1?Q?OuuXpjTXQNpe4o7IJjR1Kn9HYLlbKMwKrvTtUfLA0EHUjRVLjLP6iTIxec?=
 =?iso-8859-1?Q?wOg9aEJHDgR1XJ160Q1OtcZVkXz5VkOlFtkTImGB0/YH3dGZjTePLjrj9X?=
 =?iso-8859-1?Q?UHnvANLO2txJKwB01wfQUAWS2F/fDuiyDYjyjasHgOnIfFGSOlM7pW3IrB?=
 =?iso-8859-1?Q?Fl2Baezhr3MGRt8x/DT2w6qUgkxSzgEwtrxXq1NWCdC7z9NcATmAP702Cy?=
 =?iso-8859-1?Q?6C7wcX57i91rJCcJvCIgodT2nMrz1L6ClVFGIftnZaPgvFA78uuIzNcV8q?=
 =?iso-8859-1?Q?jUSOS97uB/bV5nJA3GpbBXiT7j8+LLrsj9RhMy2aERVkmkVZi1yh/2T8NJ?=
 =?iso-8859-1?Q?vfyAzsqM7n6QPT0JGxguSUwWJPNiuoEKW6Xk4kpLUZC/apFLILNWM+rl7n?=
 =?iso-8859-1?Q?NxRVbLlJkYwh4/AaH6Sz37p8FdIeEiJbcI5yE9prp5pP5HjZEUyrfetabu?=
 =?iso-8859-1?Q?ABiUEvAMV081T5C48sR8Er2323yrg4WV9y0YByGUpzGyij1vfMQRriCuIQ?=
 =?iso-8859-1?Q?YN9MffQN1s2puemJ31Qztd/T2xyCzCBkvldnfh+A6sQOqO6yijG8c+JTxc?=
 =?iso-8859-1?Q?+LO22iChWgbPHQtDbgB7WFb3WpNfrKvxp6cILeRBMga3Ininj36ePXxV8E?=
 =?iso-8859-1?Q?xILSDhV6kinGu6hQ80VhtTvMNY+/4SLdLoMD/hz1nigExVLJDTWZs9Dcjl?=
 =?iso-8859-1?Q?k7JOpjt0xGo+g2a9sDb4sOyn5ba+x49GL1Axdk0YhJDmCwjv4brUdpFrA2?=
 =?iso-8859-1?Q?OcPaeBdN4Va48=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?IL7EOZ8PVAuV9m0GEP3JBP63EkK6tnsMhdPCQRsK55Ph1843wdDgYinYQK?=
 =?iso-8859-1?Q?z6zdYaLfno3ANbEQ9kjIB9EVTQ20pMFakGJZn9E1ra4wxcOy+1pcY4wXSL?=
 =?iso-8859-1?Q?eaCqeL+32FbYFPJRotfUA3dnJyzg99zzqYqh5BeCZDhWTHb7xmckytOzyM?=
 =?iso-8859-1?Q?CciJDRaKIsTfvOfKmbqg4qE5atq2WyqPpIsutZCxrJfDVO7TJWWBJRmmHm?=
 =?iso-8859-1?Q?2uCZHbwOZbT2KrP4Pc4kqyLeWiobaQZv/2VzxRPE6Wd1+bdjgFbxBL0v1t?=
 =?iso-8859-1?Q?VNcJ1Vun7bc5bD+XM399q1Gpd39+SB3FR7zWeVKeWmF+aiA8qiU+y0NvIV?=
 =?iso-8859-1?Q?j5Yi2om0pP6ckg13bbP4/gTAxnusNSSmXWDRgqAiArZLKr+mVvhz9QL3zT?=
 =?iso-8859-1?Q?aBnd6NoBMAG8+OZ/RLzPUeggdUqz5VNiUmqDXwf3dr9kAAjN6F7DLrXE1/?=
 =?iso-8859-1?Q?c4GpTZbrOjCCJHpweS42QHU83yDZ6jtaUOItX0bydvlCEFey4wzQQEwGIL?=
 =?iso-8859-1?Q?hUDQjaB9Ej4yiE8SB/KpjUJha4Mw2Wc6RRIsqaAKCgwdoh84q6ZYog+bEo?=
 =?iso-8859-1?Q?7Wb5HMqOj3wrdcB5i10Pn14aArO0Sashswg/eeyjmXxsxVtbn+j+SkNcwR?=
 =?iso-8859-1?Q?G2fyFDt9tH9VB7xLGivzqFAomK1mQ2bEEV2chY30YFejTTEF2u4X56wWwa?=
 =?iso-8859-1?Q?PVf9G8R02oXON3wNrdlqMKOycGZYkK9wu1ZbQRjAAYydicFFE7R0J6C8AE?=
 =?iso-8859-1?Q?aMev5SnPpxcGm9ulvetsuPJxwRl9W5cyGdnnlfzLoc8wk49H9EsIKCzZP+?=
 =?iso-8859-1?Q?duGB39jLxeYzM6j0N2EqzFvcC6afQq02kdcSe7eLi7NoI/TIOUXqWeAa6i?=
 =?iso-8859-1?Q?KqWJvpvcwMoMHuzSKAUWz4MfM4J6Q/uVYyWBNiUNQQDouw7Rx1HPst++ep?=
 =?iso-8859-1?Q?D3NLOYskyldt7fYb4ydMsPYllrF2xN8tKYzVIgmfJC9VSK/Vcfg9IG4tKp?=
 =?iso-8859-1?Q?Ts+k4AOb3KjB5yhzAlZEg5OQcMfHex/CRvIK+kkkOBlul3sIB9t7LXosts?=
 =?iso-8859-1?Q?UTwl425W3Y4kKuFHKjCKRyPEHwCuYbbX17oi4HcVU1hrWkF+6D1ZnFD3jf?=
 =?iso-8859-1?Q?RUyLXXjor5Y3BTVqStVsQiRMIK/OUuT84pdeT+S5O3xbaT5PWUgkGYHVuA?=
 =?iso-8859-1?Q?C+3fPscpRNOSGMl+h+sMkX/lVqhoHfNt0xZhqU8BOuvu49UyjmKKR8qkfe?=
 =?iso-8859-1?Q?IgG/4cWdNiLikX3QoIyB9RmCIYYMIiQ4TRc2DKF/4RvDAjf5KLudBUWqnD?=
 =?iso-8859-1?Q?bJEjcXx84hx40pJl/zCoes+pigvtmIUq8yRsiHzkKylBiReIQl+7nVS/Ef?=
 =?iso-8859-1?Q?rn96wOU58RgI8iKqu+ADEbtTtB9B9B08GFd0CcpkCH9KkVZE/aMM2/wEbt?=
 =?iso-8859-1?Q?DarqgrnRspLcDqmnW2EAK/5saW1jkRaTobq3cdPWk7DM6hv3FZuNBdM68w?=
 =?iso-8859-1?Q?DURccEoxJHQMuFVZ3SwHAZPDCqGAKClLViMsVxR3EZhUIfn3hCNhhwtG19?=
 =?iso-8859-1?Q?z5rfNW3S3n+Vd2Fz0YhQbwdTa7HihhYQ8IDD3qq05p+gO1FE6uWe0DpP7Z?=
 =?iso-8859-1?Q?vpQUrXaWLA55qwWMnnfpy1Bvzf50QbNmPiSXOLzCp/jA2GSvPFy3tgVrJS?=
 =?iso-8859-1?Q?J8hT+OGGoz/YQbr9YCQayNjBD9PnWnGIW5djpxO7I3H6WfUt5AsQFFGprr?=
 =?iso-8859-1?Q?DUe4dMloC9igAaRCZDeokkUA09Iomf9fsPCBVvJz1aJYXz8Y2vCtQCgJs2?=
 =?iso-8859-1?Q?AWlIjs2mBez5iyht7uMWPyoU1HQj9TU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 119f8819-e72a-4935-0d48-08de6984bc07
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 15:46:34.5870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kTpZ+0zduT4gPveeybdLMPX75egcF3zrTZSYpTusVexFgko6GsBHaTKjV2qRsSM8pOb/aY6Ho/6FeCQOiDVRjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7798
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

On Wed, Feb 11, 2026 at 08:56:29PM +0530, Arvind Yadav wrote:

I have a feeling from the KMD POV we are getting close for this being
ready to merge. What is the status a UMD PR to use this feature (?) as
this is a prerequisite to merging.

Also it likely time to start collecting ack's from the UMD teams on the
the uAPI patch too.

Matt 

> This patch series introduces comprehensive support for purgeable buffer objects
> in the Xe driver, enabling userspace to provide memory usage hints for better
> memory management under system pressure.
> 
> Overview:
> 
> Purgeable memory allows applications to mark buffer objects as "not currently
> needed" (DONTNEED), making them eligible for kernel reclamation during memory
> pressure. This helps prevent OOM conditions and enables more efficient GPU
> memory utilization for workloads with temporary or regeneratable data (caches,
> intermediate results, decoded frames, etc.).
> 
> Purgeable BO Lifecycle:
> 1. WILLNEED (default): BO actively needed, kernel preserves backing store
> 2. DONTNEED (user hint): BO contents discardable, eligible for purging
> 3. PURGED (kernel action): Backing store reclaimed during memory pressure
> 
> Key Design Principles:
>   - i915 compatibility: "Once purged, always purged" semantics - purged BOs
>     remain permanently invalid and must be destroyed/recreated
>   - Per-VMA state tracking: Each VMA tracks its own purgeable state, BO is
>     only marked DONTNEED when ALL VMAs across ALL VMs agree (Thomas Hellström)
>   - Safety first: Imported/exported dma-bufs blocked from purgeable state -
>     no visibility into external device usage (Matt Roper)
>   - Multiple protection layers: Validation in madvise, VM bind, mmap, and
>     fault handlers
>   - Async TLB invalidation: Uses xe_bo_trigger_rebind() for non-blocking
>     GPU mapping invalidation
>   - Scratch PTE support: Fault-mode VMs use scratch pages for safe zero reads
>     on purged BO access.
>   - Purgeable state is not applied to imported/exported dma-bufs,
>     those BOs always behave as WILLNEED.
>   - TTM shrinker integration: Encapsulated helpers manage xe_ttm_tt->purgeable
>     flag and shrinker page accounting (shrinkable vs purgeable buckets)
> 
> v2 Changes:
>   - Reordered patches: Moved shared BO helper before main implementation for
>     proper dependency order
>   - Fixed reference counting in mmap offset validation (use drm_gem_object_put)
>   - Removed incorrect claims about madvise(WILLNEED) restoring purged BOs
>   - Fixed error code documentation inconsistencies
>   - Initialize purge_state_val fields to prevent kernel memory leaks
>   - Use xe_bo_trigger_rebind() for async TLB invalidation (Thomas Hellström)
>   - Add NULL rebind with scratch PTEs for fault mode (Thomas Hellström)
>   - Implement i915-compatible retained field logic (Thomas Hellström)
>   - Skip BO validation for purged BOs in page fault handler (crash fix)
>   - Add scratch VM check in page fault path (non-scratch VMs fail fault)
> 
> v3 Changes (addressing Matt and Thomas Hellström feedback):
>   - Per-VMA purgeable state tracking: Added xe_vma->purgeable_state field
>   - Complete VMA check: xe_bo_all_vmas_dontneed() walks all VMAs across all
>     VMs to ensure unanimous DONTNEED before marking BO purgeable
>   - VMA unbind recheck: Added xe_bo_recheck_purgeable_on_vma_unbind() to
>     re-evaluate BO state when VMAs are destroyed
>   - Block external dma-bufs: Added xe_bo_is_external_dmabuf() check using
>     drm_gem_is_imported() and obj->dma_buf to prevent purging imported/exported BOs
>   - Consistent lockdep enforcement: Added xe_bo_assert_held() to all helpers
>     that access madv_purgeable state
>   - Simplified page table logic: Renamed is_null to is_null_or_purged in
>     xe_pt_stage_bind_entry() - purged BOs treated identically to null VMAs
>   - Removed unnecessary checks: Dropped redundant "&& bo" check in xe_ttm_bo_purge()
>   - Xe-specific warnings: Changed drm_warn() to XE_WARN_ON() in purge path
>   - Moved purge checks under locks: Purge state validation now done after
>     acquiring dma-resv lock in vma_lock_and_validate() and xe_pagefault_begin()
>   - Race-free fault handling: Removed unlocked purge check from
>     xe_pagefault_handle_vma(), moved to locked xe_pagefault_begin()
>   - Shrinker helper functions: Added xe_bo_set_purgeable_shrinker() and
>     xe_bo_clear_purgeable_shrinker() to encapsulate TTM purgeable flag updates
>     and shrinker page accounting, improving code clarity and maintainability
> 
> v4 Changes (addressing Matt and Thomas Hellström feedback):
>   - UAPI: Removed '__u64 reserved' field from purge_state_val union to fit
>     16-byte size constraint (Matt)
>   - Changed madv_purgeable from atomic_t to u32 across all patches (Matt)
>   - CPU fault handling: Added purged check to fastpath (xe_bo_cpu_fault_fastpath)
>     to prevent hang when accessing existing mmap of purged BO
> 
> v5 Changes (addressing Matt and Thomas Hellström feedback):
>   - Add locking documentation to madv_purgeable field comment (Matt)
>   - Introduce xe_bo_set_purgeable_state() helper (void return) to centralize
>     madv_purgeable updates with xe_bo_assert_held() and state transition
>     validation using explicit enum checks (no transition out of PURGED) (Matt)
>   - Make xe_ttm_bo_purge() return int and propagate failures from
>     xe_bo_move(); handle xe_bo_trigger_rebind() failures (e.g. no_wait_gpu
>     paths) rather than silently ignoring (Matt)
>   - Replace drm_WARN_ON with xe_assert for better Xe-specific assertions (Matt)
>   - Hook purgeable handling into madvise_funcs[DRM_XE_VMA_ATTR_PURGEABLE_STATE]
>     instead of special-case path in xe_vm_madvise_ioctl() (Matt)
>   - Track purgeable retained return via xe_madvise_details and perform
>     copy_to_user() from xe_madvise_details_fini() after locks are dropped (Matt)
>   - Set madvise_funcs[DRM_XE_VMA_ATTR_PURGEABLE_STATE] to NULL with
>     __maybe_unused on madvise_purgeable() to maintain bisectability until
>     shrinker integration is complete in final patch (Matt)
>   - Call xe_bo_recheck_purgeable_on_vma_unbind() from xe_vma_destroy()
>     right after drm_gpuva_unlink() where we already hold the BO lock,
>     drop the trylock-based late destroy path (Matt)
>   - Move purgeable_state into xe_vma_mem_attr with the other madvise
>     attributes (Matt)
>   - Drop READ_ONCE since the BO lock already protects us (Matt)
>   - Keep returning false when there are no VMAs - otherwise we'd mark
>     BOs purgeable without any user hint (Matt)
>   -  Use struct xe_vma_lock_and_validate_flags instead of multiple bool
>     parameters to improve readability and prevent argument transposition (Matt)
>   - Fix LRU crash while running shrink test
>   - Skip xe_bo_validate() for purged BOs in xe_gpuvm_validate()
>   - Split ghost BO and zero-refcount handling in xe_bo_shrink() (Thomas)
> 
> Arvind Yadav (8):
>   drm/xe/bo: Add purgeable bo state tracking and field madv to xe_bo
>   drm/xe/madvise: Implement purgeable buffer object support
>   drm/xe/bo: Handle CPU faults on purged buffer objects
>   drm/xe/vm: Prevent binding of purged buffer objects
>   drm/xe/madvise: Implement per-VMA purgeable state tracking
>   drm/xe/madvise: Block imported and exported dma-bufs
>   drm/xe/bo: Add purgeable shrinker state helpers
>   drm/xe/madvise: Enable purgeable buffer object IOCTL support
> 
> Himal Prasad Ghimiray (1):
>   drm/xe/uapi: Add UAPI support for purgeable buffer objects
> 
>  drivers/gpu/drm/xe/xe_bo.c         | 187 ++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_bo.h         |  60 +++++++
>  drivers/gpu/drm/xe/xe_bo_types.h   |   6 +
>  drivers/gpu/drm/xe/xe_pagefault.c  |  12 ++
>  drivers/gpu/drm/xe/xe_pt.c         |  40 ++++-
>  drivers/gpu/drm/xe/xe_vm.c         |  90 +++++++++--
>  drivers/gpu/drm/xe/xe_vm_madvise.c | 249 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm_madvise.h |   3 +
>  drivers/gpu/drm/xe/xe_vm_types.h   |  11 ++
>  include/uapi/drm/xe_drm.h          |  44 +++++
>  10 files changed, 667 insertions(+), 35 deletions(-)
> 
> -- 
> 2.43.0
> 
