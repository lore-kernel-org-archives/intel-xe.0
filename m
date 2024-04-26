Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553E2C04FFE
	for <intel-xe@archiver.kernel.org>; Fri, 26 Apr 2024 09:17:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 035CD10F07A;
	Fri, 26 Apr 2024 09:17:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GeHQmAUv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99BBD10F0B2
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Apr 2024 09:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714123042; x=1745659042;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LJgg0/mWtzsf7oO5Ky2zskAYbYS0WpXo+qD0xv5cHCE=;
 b=GeHQmAUvjbbqKQgq4ix7DCrM/zmCrrPev9ItUV8R0R3CJXlHL13xYEQq
 NzVse68l1LHSla7+ELwclLae4+BBRIj5VVvqbo16UnZQD4qkk66fdovZf
 UNJeQdAsk+Q8psAZ+RTIyq0SKTvFBZj/lDXXKKkxSghfvJt5rH5UYQJ4g
 KuXr8F9t10+ynK3iLsnKCP1sGqrHkf44fZfY9ofqNZX0u/dBOIcGzW1wO
 mvD6TIyD7CXBXhwlJF+cLlMHzO52qscg/9P049GwK0l2EXzGViwn+Dkkv
 F3CcmYay6noIEHUabRGCglSGdLT8yTRdxKIP+bbQ6+slSHYM6yPkWTxjU A==;
X-CSE-ConnectionGUID: Xk2SzEw6TpejaSYXKjptbQ==
X-CSE-MsgGUID: GxnNecf+RSawqblp1MBiMw==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="27307657"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="27307657"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 02:17:21 -0700
X-CSE-ConnectionGUID: Dq0T9zxcTX2PEslFBxiz7w==
X-CSE-MsgGUID: 0JGLbzzvRAG9KiY3zr7G8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="30182063"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Apr 2024 02:17:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Apr 2024 02:17:20 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Apr 2024 02:17:20 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Apr 2024 02:17:20 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Apr 2024 02:17:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KSFGWusvPn1SCAsquyWSOafWms4amBmfUKEWAwzfz+3Mv3d+ujRxCE9f3ySjI4wNb/EJk1kPEZ6UtUmJ/bEvAgJDo7SRbP4Y1XC7F1gH0Pybi1c3qBy4scJaS95RhSAZW4JkIV78hPHcy0okB5FOBUXezb0pJBhicNN93TS2uAiIpBty7ZwIN8Pf/VRZSSnn+T2QFhfmNyQCnrZOvcRzRaShmF2Z4HzEYnrUL5h8zWj6NUOC8xzMAyBoTJipGH+cc5dNJiLEcteHDMya5qD3hbCFNheBzG3Skx/mNnVAyc3FOZEhvjRIP9hvJwePqYy1F2/cg3VjKkU3xIGfWx3Muw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t5POgDIUAa7gKXjYMtKV/5iT76OCk001CQfK+n8YC4c=;
 b=juOukf2vOwgyqUuGnHnmAar84WxiZhzBfIu+KQkqFE+tsUaS6cMIEbuDTVAryVCLtdSrQpm9007JPU+z5/tUiEGxeqm0Pq/854HOdSbzb2MU3RMuOFTPy3xZ4vWiBp9SS4BiD+tjO+NQbzySihkuqESzLAARX3NyZu6k+oi5k8ndeZgs8FK7KvDPZhFNAGqmzxlgJr62b+gzgEOuKH4sJ9LhfCRufTENDdt+9NanHOIJGpt3Mcwsqd4icxNdNbhljiU0vuHVHPHTfDXnGca1BngdfAyrFvvK7aMbjCGt+Q5IiCgH3xn2n+N6xFeSfHOVgdQSuezpWZvRiZAGCDU3UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Fri, 26 Apr
 2024 09:17:18 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb%5]) with mapi id 15.20.7519.021; Fri, 26 Apr 2024
 09:17:18 +0000
Date: Fri, 26 Apr 2024 11:17:15 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/pf: Initialize and update PF services on
 driver init
Message-ID: <20240426091715.zhkclnw5lzn2xbs5@intel.com>
References: <20240425143927.2265-1-michal.wajdeczko@intel.com>
 <20240425143927.2265-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240425143927.2265-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MI1P293CA0011.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::20) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|MW4PR11MB6909:EE_
X-MS-Office365-Filtering-Correlation-Id: c2955810-0330-40d9-751e-08dc65d1ab87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YzdlR1dPcjVpMDlXVi80ZHRMSDFPaHFOdnlZeTg5SUxhSkRZcUN4TVQrbnpx?=
 =?utf-8?B?QW01djFGR2o5bGtqY0VVSXlaTEkrWi9IZHI0TkI3U0xzc0VSVVVUK3l1WTM2?=
 =?utf-8?B?RTZhYUJTakRabkE5OHBHMEtGV204TTgxWHppUXRRcm04MHBTOW84RG8zYTlW?=
 =?utf-8?B?YTZpb0ZaK1JMTHpkeDBrRzhBU3NpSDI0TTVyYll1ekZVUDk1WVdrUUZPT1NN?=
 =?utf-8?B?ZHZ6V3pVNXlXWGw5Y3ZRRUMxc2NpQjQzNnZ3N0dkQjFKUzc4cEJuZWFBanRD?=
 =?utf-8?B?SVppMzMrcGlCcDZocVdrZm0vVjQ5cjJXaEVFMllCRDZPcGZub0cyUUF0QXFT?=
 =?utf-8?B?djFPVGtpOCtnNC90MHVjUndHVytBN0xiTGhSYi9yZlpTczg0ODRudys2SDlQ?=
 =?utf-8?B?QllOMWw3U2ZybStidGtyQjVTVmw0TTJDVmlyZkU5WU5jSExlYXhxNHNlUnJt?=
 =?utf-8?B?ZzNVbE5BUjhobFNydHdyOHJRMEFvcmpqcVRGWWJlTWM1aExTWnl4R091V080?=
 =?utf-8?B?eHVqc3Bsb0lOMmg5SnRMTzQrc3doUFB4YkE0cGlPRTQyWDdYeWJhb2xiNms4?=
 =?utf-8?B?QURsNnBrN25JODVLM0UrRG5IMCtzc1JXTkpwNzlwMkVoUDF4RGQ4b3JBdnV0?=
 =?utf-8?B?TkZ5SEVPNGVKRnkyNG9UR1VnY1VDWnZSenlwVmcvb2RlK1JwWFNiS2xqVEh4?=
 =?utf-8?B?L1B6REppNE53OXZXbWNEUENEeTFUSFB6UnUveHBZWWMwM2c4M29CSE05NmE1?=
 =?utf-8?B?c2ZaUFh0ZWhGZUkrY2lBYTRrK25GK2RIc0s0cjJEdHo4WDVLMVFSejZDazMr?=
 =?utf-8?B?SitwUUhRVmMyMFJUT0ZLUm5oTU96UVdLUVZqNzhCZjJoaWlFOHpBZ1NJYnJy?=
 =?utf-8?B?eEh4R3piTEFuSVB1d0ZKM1ZXdkpkekpQZ2czZGpMODVpenhHTUpDSDQ5TFJx?=
 =?utf-8?B?NWtjQ1lVVWZzMzhsWWx6dzVlcFNYOW9nUEV4eFdzR3FDaDhaM2R4b0RMeWY0?=
 =?utf-8?B?UDJhcUVMRVd1cWdxTHdMSGUvUjU5eTM5MkRJc0FWMjRKQmw2QzlEVTNpNDEr?=
 =?utf-8?B?R0lKL1AxUkNIbHBhSHpBcXFyQXlVZnIzZXdadmZHV2Z4eDk5WTkzaHpkRDZD?=
 =?utf-8?B?NjdMOHcvUXdQcUNIT29tUll4Sy83ZTVsWW5yNkQ0SDN0VXVvcDN1TDRsbENG?=
 =?utf-8?B?OFBlOW1HNXBhMWo1bmgvbFZicVBveDBBa0o2UjFVNHAxTE12RkZjaFJCZkRK?=
 =?utf-8?B?NTFPRFFWRTNJZEM0ZVo3K3JOMHJNWnp1UjEyZ1lxeEFrU0FBRXRhSURXTG9Z?=
 =?utf-8?B?RmE4dmErV3pGQ3dpdzJET3pKajNqMU9wcmxMeS9HL0NJZEVTd0luM21TZ3NC?=
 =?utf-8?B?OFp3U3NYelg1Q21pSk5qSURJVDVYb0RpUWVoUE5Qbzg2UklLY1RyQ2JNcTc2?=
 =?utf-8?B?Uktud3VpM21IalVScGE5bS9xYnh3QjkxalFXdEhJNDVPZUt4WkVWKzVqdTJ6?=
 =?utf-8?B?NVV2Y08vVEw5b2xsQXFHdHgrQUNGWnM5MU54NFp0M2VjRXNFcWt1UEFicVpL?=
 =?utf-8?B?VVNwTHVVWFJMWEJzQ2xwTEpBQXlXVjBOSEFsYUhpdVFNdlZWKzJLZDF4end6?=
 =?utf-8?B?TVB2WFlLU3dBa1k3akNodGVBRVIxbUI1TWE4SllKb1pvc2NiRHRNcXhzU2cr?=
 =?utf-8?B?RnJJcGxlcThQQzY5bzRpZVZKUE56UUF2VElONk9VZG45b0U5MmRURHBBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjVFbStMZWZQSjhobzhsUkdqMXU5TFNPakE3VkQ5STV0a2dPR0RjLzJoMlJv?=
 =?utf-8?B?T0RMWW55Qi9RMkhnZ2Vmb01WbE9haW0zVlNFcjBlMlhsUzdkZmdIcFNycHFM?=
 =?utf-8?B?MDJMNExnOWxHeUhQblh5U2hNZlJtNUtpaWd1K2VJZXVzaENYeGU1M0h5R1Nm?=
 =?utf-8?B?RHJJZHVJTGlsUGZlVHFoU2FXTFZKUDVBaGRVZjA0T01RMlFUZmg5a0tLcFYy?=
 =?utf-8?B?a0JSYUsrejlmdHlDVEV6cGN4NjlTcVJlS1hiVHcyRnVHOHAvNnl2T2FSNnU4?=
 =?utf-8?B?SFVrVm8rbzdMYll2NFlGZXdOTmRxWFR2VXhzKzEwUHV6bWdlM1NLNHpBWTdN?=
 =?utf-8?B?QWhNeUMyTlo2Mll0cVdYSzB4RE9TQk5iTC9vNi9RUDgraHRFZkVOK2wvVU9s?=
 =?utf-8?B?REN2VGF4STRQWDhZNEg4N2RZWC82RzZ6RG1tWEJWVXROLzI3MWl4ZmpBTlBK?=
 =?utf-8?B?dkZYQWlFWXZEV1M3cStrSWtUbWtKck1sdmt1WUl3K0g2M2x2aDBsTXJQR3p3?=
 =?utf-8?B?LzBaR2tXQkt1ajhORlRZeFFQUGwyUU41bkJhb3B4T3dBOFIwMWlOOGhVNDlD?=
 =?utf-8?B?UkIwbnNUSWVTZTRNbnd4a2UyZjMxcjNyVkVwLzBvTTgyVm9LUWJjT3g3d1dK?=
 =?utf-8?B?dmR6VGkxZGM2eXFXTmVIbzRsK3VsRDVlbHJIdkRaOVpXWXVnYVFUMDhjUUVZ?=
 =?utf-8?B?R21XZDdqR1liZlYyYUJKVU5UNndZbjRST09JSFY2aFJsMWhobGg2R3lqNzIw?=
 =?utf-8?B?YTFlSSs4QUJGQUpDMGNmTUFnU041bGh6WkRGd0tseGZjRXdBczJJcVhVbElS?=
 =?utf-8?B?RmZ0WGNFMEROM0MxL3hIdkdVeWF0Mkt2c1k3cnJvK1VTYTBKY0Jqd2pNSjBo?=
 =?utf-8?B?YkJ1T0ljMVU4ak5NWndUV3hpYVRVaWFTTngxYkdpU21ZV2krOGFjTWl5ejJn?=
 =?utf-8?B?TzNqQThXWGx3QUZCU2JvaTZpQ1hZOWFzN0dEUFlMRDc4MGF0b24zRnBTTzho?=
 =?utf-8?B?c08vZE1MMlpnQm1leFkvM1dKSEJxSXRhc09pREkzeTh5MUVPQ1hEZXp4ZUx2?=
 =?utf-8?B?UVl3OUNwTFYyTloyVU1iTVNmSkpPS2h4TE02S2V6Z2ROaHNGQ1FuRkFwbTdq?=
 =?utf-8?B?UEI5VlJ5Yld6bnNENFpLZFZCK1lUWlN1bHozNElOM1dvQURyZUN6bmxnVlBU?=
 =?utf-8?B?R3FsanVDOTBMZldmUzM4MkFCNjF5NVhENUhaZ1hTR0Fxb0MzU2ZuRGN1SXVD?=
 =?utf-8?B?Ty90ZkNUTEgwWXAvSVJRalVUSXR0WVFpR1RSZXhkQk9BSmtveGJQa2NacUdi?=
 =?utf-8?B?UWIvRHZ0aWFNRGRjbVdKNnBYVzIrNm5TOVN0ZCt0L2FhRkZzOXVnV3Z2Wjdj?=
 =?utf-8?B?b3lWUTNsaDlVazQyVG9CZlphNXBjTHBEV2xLZWRIY0xSOU1DYVVsTjR4dmUv?=
 =?utf-8?B?cjByVjdQY2c0MU1UQU52bTk5MFN4MzJ1ZTBQSC90THB4VWdpK1JlNkFKa2ts?=
 =?utf-8?B?aUZQeXkzUWxjWXVBK3plZnF2MmsycDd2RjFSaUttemFXamZrRkozV292WmVN?=
 =?utf-8?B?UmZBZXNRUkMvVUY5WjMyMmd4ZTIyWXVvRnNMRXVoTXpzY0N0dGl1aHVJMzBJ?=
 =?utf-8?B?ZTcxeDZSYkxnMWREOGtleWljL3dUSEJuSVRjZU9NUHR6V3JPS0w0dzhYMmUz?=
 =?utf-8?B?Y0hCNk43QVNyV01oN050T0h2cGQzUlhTTlM3U2xYL0RmY1ErZVE2MERzcUsx?=
 =?utf-8?B?elFNRGoxb1Y2VW0zWHBWT2p4RkxiN2c1Uk9WZjBjSUNIOVZwbmJ2RHlPdVpj?=
 =?utf-8?B?OTNobWhDeVRKbDQ0Y2dlRGduZzU0RVgySUtmN056VmdsYWdsR2MxL3VFcEdY?=
 =?utf-8?B?cVZaOVNuckF0ZjdDVUxHNTFRbnBzd3AwNTlIRTVYRzdQZFRIYklQU2VyME1Y?=
 =?utf-8?B?ZWlYMUpydjh5WHVtcmZmc0J4dkF3L3YxZlNZWFZSMVpRRlBYQUtpZUxYU0c3?=
 =?utf-8?B?WWEwcVorbUdWLzdNM05rUHYrQ1BaQWgyNkhIRUQzRTIyWDQ1dlN4TlFUdDQv?=
 =?utf-8?B?KzZlQy9xeDdpN3BlemdZZ2Nhc3BYandab0dEN3FDQUl6eC90RC9yWE5uRkN0?=
 =?utf-8?B?Tk14NVdFQ21FWmk5NVBGNTd2OWhBN2UxZC9GS05KTWFPT05OcTdqNHFmNW05?=
 =?utf-8?B?R3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2955810-0330-40d9-751e-08dc65d1ab87
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 09:17:18.0912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vm5hy+sjRVr4/0g7YG541nMVOBaJF50HZS31OiaxWH6P0ob9MDHsAYCpbtSeYi4hE4kL5mjXxwDtx5Sq9Wsn+2hIIuIhl7Go8xtS7GDmvGY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6909
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on czw [2024-kwi-25 16:39:27 +0200]:
> The xe_gt_sriov_pf_init_early() and xe_gt_sriov_pf_init_hw() are
> ideal places to call per-GT PF service init and update functions.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> index 687ea81931d1..7decf71c2b7d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> @@ -9,6 +9,7 @@
>  
>  #include "xe_gt_sriov_pf.h"
>  #include "xe_gt_sriov_pf_helpers.h"
> +#include "xe_gt_sriov_pf_service.h"
>  #include "xe_mmio.h"
>  
>  /*
> @@ -51,6 +52,10 @@ int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
>  	if (err)
>  		return err;
>  
> +	err = xe_gt_sriov_pf_service_init(gt);
> +	if (err)
> +		return err;
> +
>  	return 0;
>  }
>  
> @@ -74,4 +79,6 @@ void xe_gt_sriov_pf_init_hw(struct xe_gt *gt)
>  {
>  	if (pf_needs_enable_ggtt_guest_update(gt_to_xe(gt)))
>  		pf_enable_ggtt_guest_update(gt);
> +
> +	xe_gt_sriov_pf_service_update(gt);
>  }

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.43.0
> 

-- 
