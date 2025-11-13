Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 014B0CD8CB0
	for <intel-xe@archiver.kernel.org>; Thu, 13 Nov 2025 17:51:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B94DB10E10A;
	Thu, 13 Nov 2025 17:51:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ihw70qmM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D9610E10A
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Nov 2025 17:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763056311; x=1794592311;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=SX1sdtn2YtC8m5HZUpD+LtcuBfqP6BSOw4i0Hw3fwyI=;
 b=Ihw70qmMCGDaLxzV1Wv5Jt4pRKyAyYVhgtNAe91CdpONUL+rOrXhZN/X
 yinMLHbePwrzBiCu8qLvgLx5kjj5QeMZ/kqme4OV2/u4MboGlFLSpZ31b
 tVIVXMklWYkBdskJC2v3g8HGAkm+cIkgXXpNQWO4s6xkzo1b+tvLC98Pw
 M0qzodlfoYJHKFECyzqaEyeX+gCW/1YqrJbbvxPYHwTAP05DKsxb6ztFC
 zGZ0ImZ6LKQgcISUEL1CX92prx3NP6YWY6XBko07fG6Onx3UtIRm36lKx
 Zll5GPFv/B8yXiOPKYsfKx435fXJII+Lj/kRI4l44eC3cnD7jNjQF+Gzp A==;
X-CSE-ConnectionGUID: f5LATqfhTEq8wGgsbi5UOw==
X-CSE-MsgGUID: iZM4YG5VSySqmIbbOCflJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="76489277"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="76489277"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 09:51:51 -0800
X-CSE-ConnectionGUID: Deu1DKU+RHm+bi/f83izyw==
X-CSE-MsgGUID: qpt+tjA7TXK5Szyo0+UXNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="189404889"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 09:51:50 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 09:51:50 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 09:51:50 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.2) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 09:51:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hurRJz1/HlThclaCQj3q08a3HZG4v4x4agOAiwMtGwHPG3vbacK4MEUTnce1Iy9v7B8HHUYG8Sr4+/j4fOt8FbTb2lUSZb56kMJsLD76oDfhEmChuHhzLw0lwCe3C2JC6u43noLE2wMnUWyaK+tA7J1YO9beYwr79f7WQiStZ1FDYi5gMRKtUK3YX5Z3yaoog51fzJ67JC6ir5fL2laHqDNhkUE4YO/gFL4xfO++Q+fXfTZ9mDZXZeJm0e7PElg7FGCZaQKlz9MDMUi3luWDlqLxCTuaYeMM84KcrJgaB1PsjDkDV4kTjDfYaX/CJnea4iAt+7TLRWaKjBvtcNM/ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ghd36PJeslWPvKj1+V55AT5Hp/cXeX0dEDx1+yGgv+w=;
 b=dM6L3RD8ifwELNqfSt3fyE47FundzUamOhU2w3QZoSWdE0nQ9UIy3VCMg+VDogd9mQXwzuHsbYrVnrClWIZSb0UsQoWWnMA4c9jIGN8/5vTpuXv+HCqgcg1a38olyyXKjWz83vhYmYtx1SXWM+igXR8PK/Czt19NQf7KY6h+vUbF8HGxooVLwYsZrc2C9jQoYDcZEn5vpQB1TzvU4XsRGyAAvd1KTlB4IVWh3W4rIN7hvGId5Y1a2CUKMuUB2/h/RreZn7RA4egE4GtUo9LdKZ3swXe+LZH9zWuWBi6owC7CeZNve22gCo+JbFIBwPLEOlw4dOyKuruns9GW9XEEig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by IA3PR11MB9158.namprd11.prod.outlook.com (2603:10b6:208:57d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 17:51:48 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 17:51:48 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251110232017.1475869-54-matthew.d.roper@intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
 <20251110232017.1475869-54-matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 22/30] drm/xe/reg_sr: Use scope-based forcewake
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Thu, 13 Nov 2025 14:51:27 -0300
Message-ID: <176305628740.3698.6114747440287563597@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR13CA0235.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::30) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|IA3PR11MB9158:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d36d452-eaef-4676-a458-08de22dd5184
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Uy9naFFmMThqSWp3SXhPS25LaUhDV3ZPeWNhYmFXYy9RU1c1d2pQWEhWbE1S?=
 =?utf-8?B?UmlndzV6dXhJalVzTllqOUdZNU5sWlV6dmhnc2tWbzFCMks3azJHRlpRZ2gw?=
 =?utf-8?B?elg0VU44OHc1RkJUWkc5WVlGRjNKN3J6c28zRG1GdXgxeDlUM1lYNU11Tzg5?=
 =?utf-8?B?aW9Rc2ZsR2lZZmJFRWM2SmNIRG54TGp3eVZIZUNjd0VTNUlYNnVhbkJsZFNE?=
 =?utf-8?B?NCtCdjA0eERJRVd6V1hFS29vSXBUbm5WbFg5THpBQ1YrbXFhRFVZZlNpb0Z2?=
 =?utf-8?B?L01Ga3QzSTREZW94bkxSaUgxSElFczIvTzhxRHRKenJMOHFMbVZkeDdKcUVK?=
 =?utf-8?B?bk40MCtSYTNXR2pMa3RsbDBNS2VUbEt4RFlycHViZCtMakxKdWNhSGNXYVlK?=
 =?utf-8?B?U1NSNWlHOW04YVlHREhGMEVSYXdIQUMzMFVXMkpCb0laZDlBaE9qczhtdEMz?=
 =?utf-8?B?WGwwRGdlSldPdlpMSll2ZmVtQ0dxeXZ1QzRzMGVJTys5SW9TYUpjaTZzbERW?=
 =?utf-8?B?SkhXUXUvaklDUEtiNjg1VldCOWNsWERQN01RYjBKYmxpTE5MVnkyTmt1RXRs?=
 =?utf-8?B?SjhtQVh4a3pYa28zU24wc3ZnVndwdmUreUkrc0NpUDhMbnFhTjhwWWdFYWdx?=
 =?utf-8?B?SktiYnB1VFlRVll1ODkzY0NDeVdLWVAzOUdxWk9Mc214eGFWdDVONXduVEZF?=
 =?utf-8?B?QWxudHRtL3Z6QUpaMWJyeEpBRUd4cUwxVmdYZlY0YWRZRlRuMjB6S2h6SEQz?=
 =?utf-8?B?Y1RwZUh4WEJZeU1jVFp5QXVNVjRlQTFSSWhWM2ZFTWFYWnRlOFdtT3g1SndI?=
 =?utf-8?B?SS9DTmZnTWdCWTRBVXU3SXQwano5bGdUdFFtTklBeUFSRW0xUS9XNUN2UTUr?=
 =?utf-8?B?dTI1WjRRdnhucGgxR0NsKzUvU1hCMkxneHJONUthMWQyVFJ2bzBFazExd2xY?=
 =?utf-8?B?N0lsYUZuZm5jbi9UMDU0L1NwVlplU2xOM01lMmlhaUIvT0E1aGRyekpCV29l?=
 =?utf-8?B?YXNYWmYyaHBvSkZ0b2FSTjFpdFN1cWh3aUFmZWVOOWl5cUdvbVczVFVSa2Vs?=
 =?utf-8?B?U1grdGVjZXZwSG9uRVp0dVdGRE16eHVmSXhzMnFzczNMcDRzWjlOek5ERy91?=
 =?utf-8?B?WS9JSkx6Mk5Eb3VVb1Y2UDVWOHBLZVlWWEhGVE00TlhuY3RTSURqdXpNbUt3?=
 =?utf-8?B?aSt6NWp3TkJvOGp1ckVQZjByUFF3cjh2TFFKWHFyQ3JJZm1sRjlQekVETVI0?=
 =?utf-8?B?ZkhpY0YzL2xzVkhoMEo4ckw4RlpCZit6NkpoRFdaZ3Uxd0IyQ3ZldnU4MzRK?=
 =?utf-8?B?L0ZKQXF5Z0ZGOHkydzFWQURZaHRNQU81dmhqVTdVbW5Cd3JDaG53NkNCWHcv?=
 =?utf-8?B?RzFIRXpVSFRUVmNIR1B2ZmRLRlJVMzlncUtRNC9HcFNnTU5hRmQ2c3M2WXhO?=
 =?utf-8?B?WEpIMGVpeGFnRnJTT3RvYjNvYWFyYlJxNExvZlBzRHFKY2Y2MnB0UG9UMmVC?=
 =?utf-8?B?cDhlOU8wbnNhbnhGTGEwTFdLTjR3anhyeGNaOHhzM1hyUlZZbG9LdzI4TVZs?=
 =?utf-8?B?U2FGb2xtblM3ODFwWWgwMXVOWmxNSGRJOVpLR1F5SGZyTUlwbTZ1eklkZUhY?=
 =?utf-8?B?cWk1cU1icVZtcmVBQlpFNjY4K3gwK0d1b2RtMTZteFcvc0NWYlZ2eC9SR3dh?=
 =?utf-8?B?eHMvZ2pYOGI0K3RQZFVkdS9iUTlwTC9yMzlMcGhKM3Rka21ubFJSZDZwSklL?=
 =?utf-8?B?bWszaDk5Ulc4dDFseHZ2VGdBYUpJUXk0cHh6RVRjb3oxTVpWNlFxMFhFOHdr?=
 =?utf-8?B?T1lBd3RISngyL0tCUkdwaDVBcjJaRzAxWVk4eHQ2WG04YTF4V1c5aDdmSHVM?=
 =?utf-8?B?dFVQdTlCNlExN0V1T2MrMmZoM2UyaDZjc1hJdnNpL2tpazlBYUpKNEVla2gx?=
 =?utf-8?Q?cQQj8GoX1NXf9YgH5nNqbH40TmCLa2yu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFkxZ05QN1Eya3pML2tzMm1YR0dDaEJaVEFzTGRrcy80NFJSVWFQZnd6WEs4?=
 =?utf-8?B?dHpnekNXdTBibTdZQzAvRUdUVC9HTHEwVklPelBOYUVOOXVULytET2VtWWdV?=
 =?utf-8?B?K2xtYUIwZnRTUW5FbldFYitZQXg2YlkrUHF6cVg2cDlURFBLdmF3K1NHbXpl?=
 =?utf-8?B?eDJkVm93VzAvUUxPODFEUEw3M0l2OHBXV3RFcUJFVzRDcW9GQUlweVJ1bk5q?=
 =?utf-8?B?cTV1d0x4S0t4dDlKRnhRM3Y1OE5LYnhLTlY4ZVF6WVQybW1ydVdJdlg4bW9P?=
 =?utf-8?B?MnFPRTVzUm5rbThVKzRxMFdTaUowZElacWEyU3hTc3NkTW5USDNvV2kwMGd1?=
 =?utf-8?B?ZEprUFdYS1c2bFhrL00xK2NVOWcyM0dMMlp6alJ1OTArbTk0NWQ4SmFSOFRV?=
 =?utf-8?B?VE92V21yNHZKb1BCaFAwK1I3WFdnVkhLcTVvZmc3eFFzVm42MVJFSmV2dzRH?=
 =?utf-8?B?U09SYUUvLzNVamk1RndBenltZUNIVDRlZ3BQMHRuSE5EMGhYRTJ5eHpXZFpx?=
 =?utf-8?B?VFdjdUNlZ1dmaWx2SnhTdFRiZEFFb0VBdmJSd3hSTzh6a0JWb3puQ1pJSzZF?=
 =?utf-8?B?QUNwdTBQeVhhMGMrMU03b292KzduU01jcVMxclJqbmpFMzFNZUVCZ0Z3RUp1?=
 =?utf-8?B?TG1razBMSjMxbHlXVXErMnY4cDlMWlVLVXZBeXMxOVcyQk5NeWt4Z0p0RE9a?=
 =?utf-8?B?WW9abUxQL01rdENhbjN4ZFBSZzgyaE91NHl6YXRyeE8yNkRzMWllNkpCNWor?=
 =?utf-8?B?LytGMkwrUE9XbEVYWWpLKzdsSG9mUXZuMGlPQmxZSkF5WmdsL2p1TWl4Mjh4?=
 =?utf-8?B?MjE4b0lZc2hQVXlad3hERlNLcW01V0thMzRyb2ZUTkYybTRTVzR4bXUyeGtJ?=
 =?utf-8?B?T3B5N2lMRFAyOWhZYXNNekJWV0pJSmp2M1lJdTZ2QWg1NzJjay9TTkJFUlkr?=
 =?utf-8?B?ZUZJSnFmZFQrUDlLQTZIT0YramRvWEdwbXRuVWFPdnRWbnZUN3JCME9nM0d0?=
 =?utf-8?B?ZlZlSXhpOFk0bVRzdGVmNU5leWV5VlhlSmZMR1BwR3VWdkJJRXZzMUJ5cHV1?=
 =?utf-8?B?U3pzUzNXcnBSZnEyZGUraG5wcnFDQnowVWd2aGV3dXVhZis2MnZKTXVSeG55?=
 =?utf-8?B?Ym16V1pmYklsS1FmMnIyZTRpVGZzbVFRNzVQMXZnamdPVXJyVVhFcS81ZGpW?=
 =?utf-8?B?dXA5a2lpVkZaSzUxV0FZd29MWFZWWGJMNmE3QTNDZVAzOG1UNURvVTRlTEwr?=
 =?utf-8?B?cXdySCtlUUtBMkxxRXUzcDNGSjVBTk5yblRWNEw0UW82RzFEV21XSmJQUTZR?=
 =?utf-8?B?R2VMbkRISFN6ZGxJTTJyd2xVLzBPUVRsU1hUN2QwMS8wYVZMWTgwQU8rSHpn?=
 =?utf-8?B?djF5R2pYQlVZMFF1VVlKWnRkLzJzeFVZNjVRSTR2R0dLenllU29qQ2ZmUWpw?=
 =?utf-8?B?V0NOLytQSEI2MWZBQURjYzU5V0ovcjB3OHc2bU13dFN4c2xoSXRobmwvUEZr?=
 =?utf-8?B?WnZzRndIQTNjZ2M0OEpVVUpldFUwaElkTk9OUTI0RXJLSTlYZ0R1YkFNUmhr?=
 =?utf-8?B?bFV0Z05qT05QS2NnZCtQZCtzYi9nN1U1bGt4OGpUMmhjM0dDcCtLOHE1ZUhW?=
 =?utf-8?B?MXpjekd5aktyY0lEbW83ZEJqTTBrd3RBaE9MMEEwVllCeDk1UENWUnlWdUlt?=
 =?utf-8?B?d1lWamIxR1JuQjRmTFFBRUFTclFmbDJEOEgyV1NMZVRPNFd0eTFqQ2M0RUVw?=
 =?utf-8?B?ZUUxOVBqV2wvdTNtOHlDUjR4ZGJDZ3NKQVVSMjVJMEtTT3J4SEkwMkEyQTJp?=
 =?utf-8?B?VGJqZ0dUUmk0VkN4VTJWdWoxVkNUNU5JdGxQRHRzUWp6b1hiNlhkY1c2M3FR?=
 =?utf-8?B?L1BTQ3dIOUNrU3pFK0Y1dHkwTVU2NWV2TUZEbk1XdCtiMndVK3gvRzJtRFRE?=
 =?utf-8?B?RE9ZNENPUkx3VVd3c1pqMU8zVWJJNGF0RldqQUxsVTRUNUQ0b3EvQXQ1RDM1?=
 =?utf-8?B?bVFQekM1RTNXbC80WjU5K3MwTjVYdmtwVzBDN2pEdGFoeWJNcmZ2VVBPRkQw?=
 =?utf-8?B?QkpVa0gwd3RNbmhISzNYenpaWmJQZWdyazJCK2tob1c0Y29jOEZNTC8wbjZ5?=
 =?utf-8?B?VHZiOHR0dGp0TGN2M2NlWlR1bElMOFhEMDdRNFM1Mkc1V1hZZmVrNmJVekJT?=
 =?utf-8?B?bnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d36d452-eaef-4676-a458-08de22dd5184
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 17:51:48.5530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6cGjtvl6qqZ7KBvKuc14Wejxsska0zEi3UVPe1FdU0y3FNKQ6Tofe2gIapKR9BsV5bW+KkNgdfo2h20kwuni0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9158
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

Quoting Matt Roper (2025-11-10 20:20:40-03:00)
>Use scope-based forcewake to slightly simplify the reg_sr code.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_reg_sr.c | 17 +++++------------
> 1 file changed, 5 insertions(+), 12 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr=
.c
>index fc8447a838c4..1a465385f909 100644
>--- a/drivers/gpu/drm/xe/xe_reg_sr.c
>+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
>@@ -168,7 +168,6 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct=
 xe_gt *gt)
> {
>         struct xe_reg_sr_entry *entry;
>         unsigned long reg;
>-        unsigned int fw_ref;
>=20
>         if (xa_empty(&sr->xa))
>                 return;
>@@ -178,20 +177,14 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, stru=
ct xe_gt *gt)
>=20
>         xe_gt_dbg(gt, "Applying %s save-restore MMIOs\n", sr->name);
>=20
>-        fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>-        if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
>-                goto err_force_wake;
>+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>+        if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_AL=
L)) {
>+                xe_gt_err(gt, "Failed to apply, err=3D-ETIMEDOUT\n");
>+                return;
>+        }
>=20
>         xa_for_each(&sr->xa, reg, entry)
>                 apply_one_mmio(gt, entry);
>-
>-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>-
>-        return;
>-
>-err_force_wake:
>-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>-        xe_gt_err(gt, "Failed to apply, err=3D-ETIMEDOUT\n");
> }
>=20
> /**
>--=20
>2.51.1
>
