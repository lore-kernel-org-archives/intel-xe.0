Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48509C27C55
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 10:04:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 835B410E023;
	Mon, 10 Jun 2024 10:04:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c0DmMIAj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE72E10E023
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 10:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718013848; x=1749549848;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=nsENHD+3dOqm2N8TuReUyqKgmehD8PNCtIgXtTo+0iE=;
 b=c0DmMIAjIE1n7y9PHzyZ9WonbtXZ8JDediPOn8pDgAobvGQ96+yMjQz8
 hlBN1M/3GiX8wKlMkvvNtBVtXVtB+ln5z1cRK0+IKJl6IE9NKFwJcLipC
 aWDLQ64WTnQ6yrCZHhurSBsGS0J5n1hZnACUMFj0A/RnwPNq6r+auwU71
 k5mHpavyAK8z0ZmGqwGLgfweqREaVqM+SJafRWVx7/6bnnHdw2ePviMVL
 LeoRY/upkKCnwCC2UF+v0gmJmOOz/6/ZW0ox6IpVkHUaWLTA/8fZzAWbl
 3OGS+bD5ZUHGFYPq5fJkjeaomPKAn9L4iiy6jFG8K+fF4DaaF4spTCi37 A==;
X-CSE-ConnectionGUID: 73jt15nKQvOdtAMsAbFZsA==
X-CSE-MsgGUID: lGtRkl2pTGqPTK6+oY2ZHg==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14502532"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14502532"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 03:04:07 -0700
X-CSE-ConnectionGUID: e1j0ti1iRhuI63/6VocUzw==
X-CSE-MsgGUID: 0k1Bf7wzTMiazAg0Uv30Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="43444985"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jun 2024 03:04:06 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 03:04:05 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 10 Jun 2024 03:04:05 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 10 Jun 2024 03:04:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YAOcR7/ftcePy5FVVSh7mGO4FcFQBCD8dKr5qwP24ka8jTDYQ+9Yr8A9VXrUBPV/zWxT4JmUUpixJA7cxB91Zx4Dk69rdQtTzyROdfwBt9UDj43hqz/L/qqXG4hg/x+9n/I/8Dol2y4vjdQpOk75fT93d2h9pT13SUWGD/VtFY+w+oslHZ0IQmUKyBOU3Kwcg5SHyCHRgZmow6Rdfvf13kjol/13F3VUOaWfE9nd4WXJtJUaQe9v0CM06oGi80fadxENK92hjXvODzkAzO2bBkJh86QiYR3rnv85fNnXYfM6T0pJJkKDpkyK7CnC+/8J443/xMmV9RjlG3NftVlpPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SyeNg3TWMVrheYcA2I62ks4Cml53yELu4PB78L3fulE=;
 b=nGrA9OKD0QGUAWB+81TMDpL0cumaaF4YofZkKNze4gz6ULbBzI42rM1I/WX/T4BZa4JBgJ18d1I7eiPbFLqZV24x10pt5k7jpen/jkk8Cu20rPQZXcsGpQJWe3sGoBdpiU6W3g4K2Y7WeAzieHefmhEdPn6E3w4TRXnE1WyF32h/eXV8OsPwR10dvUqlwfg+qK6nKDZoZ0qmJs1aQX50taJB3RNvIx5TZ4/AYKHEXBVvC2u/xWoJxbgF7HWX85E4xXEyfoq22vodBxC0uX2WOfTuSKDXZOPtEdHR+jf/vJHHfB1f3pF1UG9JiDGAilQQp60TPUA/D1TvMGzCzDxWfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CY8PR11MB7362.namprd11.prod.outlook.com (2603:10b6:930:85::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 10:03:45 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%3]) with mapi id 15.20.7633.036; Mon, 10 Jun 2024
 10:03:45 +0000
Message-ID: <8104bc32-2537-4c8e-a4d7-4ab9a80e9b03@intel.com>
Date: Mon, 10 Jun 2024 15:33:41 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_series_starting_?=
 =?UTF-8?Q?with_=5BCI=2C1/2=5D_drm/xe=3A_Ensure_caller_uses_sole_domain_for_?=
 =?UTF-8?Q?xe=5Fforce=5Fwake=5Fassert=5Fheld?=
To: <intel-xe@lists.freedesktop.org>
References: <20240607125741.1407331-1-himal.prasad.ghimiray@intel.com>
 <171779873761.28455.16962403162797158122@a6498e030952>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <171779873761.28455.16962403162797158122@a6498e030952>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0045.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::20) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CY8PR11MB7362:EE_
X-MS-Office365-Filtering-Correlation-Id: a14f4a25-45f7-499a-1b97-08dc89349d62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b1NMRUtxUzlFNjNJTHVubEFrVExGTEowSnhkVWJrbyt6aG9FdmhpaW45SVAy?=
 =?utf-8?B?MXlZeDQwYjI0M25tN2phSkNGZnpuei9xOU54bWk1NURxaERwTmt3R0JhTGZB?=
 =?utf-8?B?R0NVL1VYU1gxNkpLQ0FkSUlhSjYzVEZoZFR4SVNMK0w0cEpPYVRaVlRYWjFS?=
 =?utf-8?B?Q2gvS2NJMzhueExjWlJ5SzV1Y0JvczFML1JPdjBJVkN5Wm9OdTFsczg0amFO?=
 =?utf-8?B?cjNtZHZsdFFBakZCa3A3amt5TFNYRExmdXJHRGw1MHRSdW1KY1FnVkRrRmJ1?=
 =?utf-8?B?emFlV2pIcThuTUtvK0tpMFo4L3hza0czNFVTV0ZIMVpnVE53VldyV01JNERL?=
 =?utf-8?B?K1N3RDdOaTYrNzY1YnB3ZHNJWVpXaUNNZFRUekNmN2JYanJMSFhzRklKU2FQ?=
 =?utf-8?B?d2wrdVIyTVptb2hiRWVWQVNwdWF3UzBBcENtZkxJRHB6MjM0c2xpUGF2bXlw?=
 =?utf-8?B?djU0aEtqZ0FBVG9rSXl3ZDROdmtzVVowc3drUVV6TFFlNFUxK0pqTWtlRThX?=
 =?utf-8?B?eXpKM252MXQ2ZnVPVkZvR1RDQjY0SFpFOFRxYnJlTUxkK3pUSHRDeVlEdEJz?=
 =?utf-8?B?cWtuZmVNNlNUUk9nSUxucUczY1NIc2c1ak00Z0ovR1dxVGVxNjJMTncxZXVI?=
 =?utf-8?B?T3R0VGJDYmw1VkE0TFdVK3h3SUpoOW5UWXlPR3NXUGc3YXVXTS9mRi9adHVO?=
 =?utf-8?B?NElFS2gzckxXOHJqMlRoWldDK1hQcEN5SzdpTHBnNEhYNWlzQXRmNnN5NXVp?=
 =?utf-8?B?SmdIVWJDRFB3K1NhVXk5ajVnR0R4eHdiWGQ1Y3dIOHp0bWpBeUJaL3N6WDlE?=
 =?utf-8?B?TVUxeWh1WGxCQnJHcEZnZFk1MDREaHVkMGs3STV6MklrNGRCS0ZkaVN0eE94?=
 =?utf-8?B?S1ltNWN5MTRyNlJNbVJuQWdPcDNzcU5pUmFVK2t1N3g1Y21MY0NzSWhhSk96?=
 =?utf-8?B?L0tSRy9iRkIxUFJEMVBCVDFhWWlyRzdBSC9jNnlHTHV1N3QxVkdxYlZJcDhn?=
 =?utf-8?B?NHRUanRoTTRHbXZKMm5nOVpVTDIyUFkrWGMvYzdxczU2Nm05clMxT3RlSUU1?=
 =?utf-8?B?cE9WeklUY2pweUZKODNhQUtDM3hUOU1tY3RyR21qT21ySDFyRTBFWE8wSmZK?=
 =?utf-8?B?UDVYUjMyV1p4L1NUUEsrZnhMZEpXV1YyNkV0bDBjZmh1UklzT0JVWEhpUjNp?=
 =?utf-8?B?UDBiOHNFQldxU0l3OTluamRCNDdRTkdvbFBWS1VYQ1hDQnQ1a2JTK0F0Nmtv?=
 =?utf-8?B?Z3pFakFNam1WSm1vYzJhR21LRHRrWmhRb0F6NGRPWUtVZTJUUm9DWm4xUTJX?=
 =?utf-8?B?U1QrTWxwcEg3QzVwV0lXWkN6ZzY1YTdmdGZqRGVZYlpMTnJ1QXo0SUtGM1NJ?=
 =?utf-8?B?U2dBanZzUDIvSVZuTCtDSUVIY0doSTdTNHRLR2pRdTIvNnlrUFBFV2xURUY1?=
 =?utf-8?B?RkM3VjB2RUxVTE5aaUc3RHZhcEg2NU9mNFFaVUl2cVNHK0xJNzJGZUFJMFU4?=
 =?utf-8?B?Vk0yUVJpSkp1MUg0ajVWTUdJUElyQzQ2Z09xbGR1UHFjTzVJelorR0hIaWhD?=
 =?utf-8?B?eXYzWFh1dWYwbzZiR3BDM2pQKzlMekZvTzFRK2tCeXExNnQ5VXViRlY1R09l?=
 =?utf-8?B?Q2JpUDdTVXVtM2JYZWQ3UGt5MW0yYmcvMktBK3laTVZJVUlDRUlRSEpSSXF3?=
 =?utf-8?B?YnRXZkZJMzlrbCtVcHMzQlJEV3FqZ0hpRlpNVENkR1VKOWZWRmNRNGlBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVRIQ21rSkxrVE5XQVR4SlJTOXFkZEx5cThFVHVJMlR5TElBa3JjdURaK2Jo?=
 =?utf-8?B?Y080STAySTB0N3drdjNLdlZ0UU4vVDZmOEdSWHNvNWkzd3lob1dubjh0OUFQ?=
 =?utf-8?B?aHBVajJidWNQc2JwQWhyQkZlVVJPanpYSnJHdTExY1RPczBKbVFEMjNlRlY1?=
 =?utf-8?B?eGJsb0N3YUt1S3NKOVlOQ2doQUwzdTBHTEdianJGQVE3RGRZdWNjTlk3NjhW?=
 =?utf-8?B?anB2WG5abGtYU1Y3Tm0weHFEbDdqem9JUUNnelliUTY5SStaZnliT2dvS2d0?=
 =?utf-8?B?RXVkNFFCazBlYkpQUytaclM4QmkvdjNuV0J2MC8zNXMwVGVXZmF0OElkUjZ3?=
 =?utf-8?B?elZjRkJmc29VMlNONGw2RWJ4NmUyYkd3VXFLenA5aTNkZnliZ1FCK2MrVHhB?=
 =?utf-8?B?cmF2eHk2ZFc0MHdiVlhyck01RTZNTCtSbEQ0U09UT0hyUzczYS9zaUU5UldB?=
 =?utf-8?B?YXJXeTdpekFrM2tJSFNCZ2VvL2dHZithUDBxV3lYclJzYmxtVEp6clV4N3BI?=
 =?utf-8?B?N2M1d2FoMCtGK05KbDhsV1I1cndrS2s3YWJQREwxbXNwT2VNUmtRQTVPbzJN?=
 =?utf-8?B?UWZUQWZiaTN4Ull0bDVyRnJmeGMvcDVid0w3NDN5WTM3QmlDeG02VEcxaWRa?=
 =?utf-8?B?RThLSE9jSjh2dnhtaWQ5ZVhHZC9YdDBGVHdKaHlRMytocThQTHM3Z1RvVXRr?=
 =?utf-8?B?TnErNFFvVjB4OFBlWmFMZlNFVERFeUpZa2N6dDBucngrRWNOSTR6azRWcHdi?=
 =?utf-8?B?L2dUN2RCSkFQcHZhZGI2TGV4N1JQMkFXaHpYcHVNYzRZMHRGNkZiMFB5T1pl?=
 =?utf-8?B?UmZZV0tOWEZzRHdtcWsyS2VzRmlDY21NU1EwckpWalFqNWM4SEc1b0RTVGg4?=
 =?utf-8?B?TXdxUDljQU5vVVh0UWtDWmVvWlN3MlVvUS9GNU1ZRzdYUHNtckpaWkxPU3pq?=
 =?utf-8?B?YksraStxQnFyWE1IR2k2cDRFcG50NjRPc3g3Q0I0djNBSjBVcGZlU2dkdTRM?=
 =?utf-8?B?Q1BKU0JUOWR2eVlXbHRlU1NsdnNXYnNYbXovY21uMmpYRmlHY2h2L2EvUjVH?=
 =?utf-8?B?UVRqRW1OZng0WUVrL0FFdGRTS2Q4RUxXa1o2cWR5NFdubGkwSVMxRjdnZ0VB?=
 =?utf-8?B?dGRmV1lSN1VaNzFpbFZaOUFLaTYzR3hHYlg4MUpYa1VYN3diN3VnSldxYWlF?=
 =?utf-8?B?ZDBPQnlSbC9PYXVqNXVEM05xRzhPTTZjMmpLVXlVNXNLOGcxS3k4NzViSzlC?=
 =?utf-8?B?YzZrTllZbFVmVEZ1VmFkcWIzRzVqMGl0UDhBZ2E5OG1GT2Q2YTRHMDhZY3po?=
 =?utf-8?B?OFNhNnE3RWFYVFFMdUJ4dUhIaGlBeXllakhrZ3NYMW5OMnltN2dYM1BFc0hq?=
 =?utf-8?B?NUhhRE81MlhPZDlwL2d6bUxrQk92Mkg4QWlxSHMrNlM4TVZOZ0liUlMzS2dl?=
 =?utf-8?B?VFpZV2tzWDI1VXd5bFZhSkRZZ21UeFpjczNoWDhMclNJWFFSTThXVitXNExn?=
 =?utf-8?B?cURNWWZSOVkzYWJGQm1ydmNLNm85aFp4WlB6MEh4SWp2OEtmaXJNSmVlc3pl?=
 =?utf-8?B?cU1ncERyMkd3R2swN3VuQzRoQWxRNjVFNHhKZ2ZXc0NVcHNRdHd6OHVXd3Rn?=
 =?utf-8?B?Z1hBcW5qTDg1YS9sUVBLWi8yTmczcFd2aTR6TE14YnR5d29RekdlSmx6bjh2?=
 =?utf-8?B?TExwWkc4TStZUERVSjJyTlMyS0JBMStEc3RrNEVkQUF4WWRRYjJiNlM3NGxL?=
 =?utf-8?B?REdwUGJRZm1IM3NuaGpobk5jL1F4ZDBPTlJESzJJR0JLOEVzTllVVDhmWVFL?=
 =?utf-8?B?L1Vmdk9hOWJOcTFYS2RrWjFIYUR2QW4vWWkvbTJGQytHaXNPTGd3U3llbnFR?=
 =?utf-8?B?cWduNld6cmErcnR4VTlPV2FCYmFDZUI3MFRhNUE0ZjlIK0EzNXgxOU82OTdU?=
 =?utf-8?B?MWUyek5saUpDd0hjc1JDVVlBRUdSZ00yRkhBWWZHV0YzR3lXTHI3UHdLQUpy?=
 =?utf-8?B?aEw2dFlhOHlicjREQ1dSSUhPdXhtMWIxVXZ0bEp1MUVMeGVvMytycytqREtl?=
 =?utf-8?B?MXZ6d0ZJSkF1TW8yNGJldEk3TUxObTFwazFXaW9ESk9yVUJ1UXZLVit1Vm5D?=
 =?utf-8?B?OWIwVXRVNzN1dmU0b0lGN0ZYL3Azei85VkdUTkMyNjRiZ2FOa3h5VnJkMmR1?=
 =?utf-8?B?R0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a14f4a25-45f7-499a-1b97-08dc89349d62
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2024 10:03:45.6528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HkOIRVpkm/5bQx++5pUjphWWqoR8H/iY78EmSEGWVk3v5mAjCQSD/K68AA4nAU5VHhvmrPzOP7vvrZxND6va4XFW+48DgHYs0Tkc43f1Vpw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7362
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



On 08-06-2024 03:48, Patchwork wrote:
> *Patch Details*
> *Series:*	series starting with [CI,1/2] drm/xe: Ensure caller uses sole 
> domain for xe_force_wake_assert_held
> *URL:*	https://patchwork.freedesktop.org/series/134605/ 
> <https://patchwork.freedesktop.org/series/134605/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/index.html 
> <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/index.html>
> 
> 
>   CI Bug Log - changes from
>   xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea_full ->
>   xe-pw-134605v1_full
> 
> 
>     Summary
> 
> *WARNING*
> 
> Minor unknown changes coming with xe-pw-134605v1_full need to be verified
> manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-134605v1_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (3 -> 3)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> xe-pw-134605v1_full:
> 
> 
>       IGT changes
> 
> 
>         Warnings
> 
>   * igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1:
>       o shard-adlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-adlp-4/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html> (Intel XE#1608 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html>
> 
> 
>         Suppressed
> 
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
> 
>   * igt@xe_render_copy@render-hstripes@render-tile4-256x256:
>       o {shard-lnl}: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-lnl-1/igt@xe_render_copy@render-hstripes@render-tile4-256x256.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-lnl-4/igt@xe_render_copy@render-hstripes@render-tile4-256x256.html>

Failures are not related to patches.

> 
> 
>     Known issues
> 
> Here are the changes found in xe-pw-134605v1_full that come from known 
> issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@intel_hwmon@hwmon-read:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-adlp-4/igt@intel_hwmon@hwmon-read.html> (Intel XE#1125 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>   *
> 
>     igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +4 other tests skip
>   *
> 
>     igt@kms_big_fb@4-tiled-16bpp-rotate-270:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-adlp-4/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +1 other test skip
>   *
> 
>     igt@kms_big_joiner@invalid-modeset:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-adlp-4/igt@kms_big_joiner@invalid-modeset.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#346 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/346>)
>   *
> 
>     igt@kms_ccs@crc-primary-basic-yf-tiled-ccs:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-adlp-4/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +5 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-hdmi-a-1:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-adlp-4/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-hdmi-a-1.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +8 other tests skip
>   *
> 
>     igt@kms_chamelium_color@ctm-red-to-blue:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-adlp-4/igt@kms_chamelium_color@ctm-red-to-blue.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>   *
> 
>     igt@kms_chamelium_hpd@dp-hpd:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-adlp-4/igt@kms_chamelium_hpd@dp-hpd.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +2 other tests skip
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-432/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-433/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#282 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) +5 other tests dmesg-warn
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-adlp-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#309 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +1 other test skip
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-435/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html> (Intel XE#282 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>)
>   *
> 
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-adlp-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#323 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:
> 
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>)
>   *
> 
>     igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
> 
>       o shard-adlp: NOTRUN -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html> (Intel XE#1608 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608>) +6 other tests dmesg-fail
>   *
> 
>     igt@kms_flip@plain-flip-ts-check:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-433/igt@kms_flip@plain-flip-ts-check.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-464/igt@kms_flip@plain-flip-ts-check.html> (Intel XE#1150 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1150> / Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>)
>   *
> 
>     igt@kms_flip@plain-flip-ts-check@c-hdmi-a6:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-433/igt@kms_flip@plain-flip-ts-check@c-hdmi-a6.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-464/igt@kms_flip@plain-flip-ts-check@c-hdmi-a6.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) +2 other tests incomplete
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +7 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +4 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +1 other test skip
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1:
> 
>       o shard-adlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-adlp-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1.html> (Intel XE#2028 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028>)
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-1:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-adlp-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-1.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#498 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) +2 other tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d-hdmi-a-1:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-adlp-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d-hdmi-a-1.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#498 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) +1 other test skip
>   *
> 
>     igt@kms_pm_rpm@drm-resources-equal:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-adlp-4/igt@kms_pm_rpm@drm-resources-equal.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#1211 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211>)
>   *
> 
>     igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-adlp-4/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>   *
> 
>     igt@kms_psr@pr-primary-page-flip:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-adlp-4/igt@kms_psr@pr-primary-page-flip.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +4 other tests skip
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak.html> (Intel XE#771 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/771> / Intel XE#899 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>)
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html> (Intel XE#899 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>)
>   *
> 
>     igt@xe_copy_basic@mem-set-linear-0xfd:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-adlp-4/igt@xe_copy_basic@mem-set-linear-0xfd.html> (Intel XE#1126 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>   *
> 
>     igt@xe_evict@evict-beng-cm-threads-large:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-463/igt@xe_evict@evict-beng-cm-threads-large.html> -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-466/igt@xe_evict@evict-beng-cm-threads-large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel XE#392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>)
>   *
> 
>     igt@xe_evict@evict-beng-mixed-threads-large:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-large.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-large.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>   *
> 
>     igt@xe_evict@evict-large-multi-vm-cm:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-436/igt@xe_evict@evict-large-multi-vm-cm.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-435/igt@xe_evict@evict-large-multi-vm-cm.html> (Intel XE#1600 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600>)
>   *
> 
>     igt@xe_evict@evict-mixed-many-threads-small:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-adlp-4/igt@xe_evict@evict-mixed-many-threads-small.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#261 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/261>) +1 other test skip
>   *
> 
>     igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-adlp-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#1392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>)
>   *
> 
>     igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-adlp-4/igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +4 other tests skip
>   *
> 
>     igt@xe_gt_freq@freq_reset_multiple:
> 
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-adlp-6/igt@xe_gt_freq@freq_reset_multiple.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-adlp-2/igt@xe_gt_freq@freq_reset_multiple.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#1975 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1975>)
>   *
> 
>     igt@xe_live_ktest@xe_dma_buf:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-adlp-4/igt@xe_live_ktest@xe_dma_buf.html> (Intel XE#1192 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>   *
> 
>     igt@xe_pm@s4-basic:
> 
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-adlp-4/igt@xe_pm@s4-basic.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-adlp-9/igt@xe_pm@s4-basic.html> (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358>)
>   *
> 
>     igt@xe_pm@s4-d3hot-basic-exec:
> 
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-adlp-1/igt@xe_pm@s4-d3hot-basic-exec.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-adlp-1/igt@xe_pm@s4-d3hot-basic-exec.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358>) +1 other test incomplete
>   *
> 
>     igt@xe_pm@s4-vm-bind-unbind-all:
> 
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-adlp-2/igt@xe_pm@s4-vm-bind-unbind-all.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-adlp-6/igt@xe_pm@s4-vm-bind-unbind-all.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>)
>   *
> 
>     igt@xe_pm_residency@gt-c6-freeze:
> 
>       o shard-adlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-adlp-4/igt@xe_pm_residency@gt-c6-freeze.html> (Intel XE#2009 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2009>)
>   *
> 
>     igt@xe_query@multigpu-query-gt-list:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-adlp-4/igt@xe_query@multigpu-query-gt-list.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@kms_cursor_legacy@forked-bo@all-pipes:
> 
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-433/igt@kms_cursor_legacy@forked-bo@all-pipes.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#282 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-464/igt@kms_cursor_legacy@forked-bo@all-pipes.html> +5 other tests pass
>   *
> 
>     igt@kms_cursor_legacy@torture-move:
> 
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-463/igt@kms_cursor_legacy@torture-move.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-463/igt@kms_cursor_legacy@torture-move.html> +1 other test pass
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank:
> 
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank.html>
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank@b-dp4:
> 
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@b-dp4.html>
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible@b-dp4:
> 
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible@b-dp4.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible@b-dp4.html>
>   *
> 
>     igt@kms_plane_cursor@primary:
> 
>       o {shard-lnl}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-lnl-2/igt@kms_plane_cursor@primary.html> (Intel XE#1330 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330> / Intel XE#1817 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1817>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-lnl-5/igt@kms_plane_cursor@primary.html>
>   *
> 
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
> 
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html> (Intel XE#361 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/361>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html> +2 other tests pass
>   *
> 
>     igt@kms_pm_rpm@basic-pci-d3-state:
> 
>       o {shard-lnl}: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-lnl-2/igt@kms_pm_rpm@basic-pci-d3-state.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-lnl-6/igt@kms_pm_rpm@basic-pci-d3-state.html>
>   *
> 
>     igt@kms_pm_rpm@drm-resources-equal:
> 
>       o {shard-lnl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-lnl-4/igt@kms_pm_rpm@drm-resources-equal.html> (Intel XE#1211 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-lnl-1/igt@kms_pm_rpm@drm-resources-equal.html>
>   *
> 
>     igt@xe_evict@evict-beng-threads-large:
> 
>       o shard-dg2-set2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-464/igt@xe_evict@evict-beng-threads-large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-434/igt@xe_evict@evict-beng-threads-large.html>
>   *
> 
>     igt@xe_evict@evict-mixed-threads-large:
> 
>       o shard-dg2-set2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel XE#392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-435/igt@xe_evict@evict-mixed-threads-large.html>
>   *
> 
>     igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate:
> 
>       o {shard-lnl}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-lnl-5/igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate.html> (Intel XE#1330 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-lnl-8/igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate.html> +1 other test pass
>   *
> 
>     igt@xe_exec_compute_mode@many-userptr-invalidate-race:
> 
>       o {shard-lnl}: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-lnl-8/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html> (Intel XE#1330 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330> / Intel XE#1796 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1796>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-lnl-7/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html>
>   *
> 
>     igt@xe_exec_compute_mode@once-bindexecqueue-userptr-rebind:
> 
>       o {shard-lnl}: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-lnl-6/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-rebind.html> (Intel XE#1330 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-lnl-2/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-rebind.html>
>   *
> 
>     igt@xe_exec_fault_mode@many-userptr-invalidate-race:
> 
>       o {shard-lnl}: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-lnl-6/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html> (Intel XE#1761 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1761>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-lnl-1/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html>
>   *
> 
>     igt@xe_gt_freq@freq_fixed_exec:
> 
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-436/igt@xe_gt_freq@freq_fixed_exec.html> (Intel XE#1414 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1414>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-435/igt@xe_gt_freq@freq_fixed_exec.html>
>   *
> 
>     igt@xe_pm@s4-vm-bind-unbind-all:
> 
>       o {shard-lnl}: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html> (Intel XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-lnl-5/igt@xe_pm@s4-vm-bind-unbind-all.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_big_fb@4-tiled-64bpp-rotate-270:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-432/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html> (Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-433/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +3 other tests skip
>   *
> 
>     igt@kms_big_fb@x-tiled-16bpp-rotate-270:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-435/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html> (Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +1 other test skip
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +7 other tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +7 other tests skip
>   *
> 
>     igt@kms_bw@linear-tiling-2-displays-2160x1440p:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html> (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>   *
> 
>     igt@kms_bw@linear-tiling-4-displays-2560x1440p:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html> (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-464/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +1 other test skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6.html> (Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +55 other tests skip
>   *
> 
>     igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +15 other tests skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-6:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-6.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-6.html> (Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +48 other tests skip
>   *
> 
>     igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +13 other tests skip
>   *
> 
>     igt@kms_chamelium_audio@dp-audio:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-435/igt@kms_chamelium_audio@dp-audio.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-432/igt@kms_chamelium_audio@dp-audio.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +6 other tests skip
>   *
> 
>     igt@kms_chamelium_color@ctm-limited-range:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html> (Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-433/igt@kms_chamelium_color@ctm-limited-range.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>   *
> 
>     igt@kms_chamelium_color@gamma:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-435/igt@kms_chamelium_color@gamma.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-432/igt@kms_chamelium_color@gamma.html> (Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) +1 other test skip
>   *
> 
>     igt@kms_chamelium_frames@hdmi-cmp-planes-random:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-432/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-433/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +5 other tests skip
>   *
> 
>     igt@kms_content_protection@dp-mst-lic-type-1:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html> (Intel XE#307 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-464/igt@kms_content_protection@dp-mst-lic-type-1.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#307 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>)
>   *
> 
>     igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-a-hdmi-a-6.html> (Intel XE#282 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-a-hdmi-a-6.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#282 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) +6 other tests dmesg-warn
>   *
> 
>     igt@kms_cursor_crc@cursor-rapid-movement-512x512:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#308 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html> (Intel XE#308 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>)
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-512x512:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x512.html> (Intel XE#308 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-512x512.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#308 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>)
>   *
> 
>     igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:
> 
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html> (Intel XE#2028 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028>) -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-adlp-6/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html> (Intel XE#1608 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608>)
>   *
> 
>     igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
> 
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#282 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#282 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282> / Intel XE#910 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/910>)
>   *
> 
>     igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
> 
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-435/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#282 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-432/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html> (Intel XE#282 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) +4 other tests dmesg-warn
>   *
> 
>     igt@kms_fbcon_fbt@fbc-suspend:
> 
>       o shard-adlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-adlp-4/igt@kms_fbcon_fbt@fbc-suspend.html> (Intel XE#1608 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-adlp-9/igt@kms_fbcon_fbt@fbc-suspend.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#927 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/927>)
>   *
> 
>     igt@kms_feature_discovery@display-3x:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-435/igt@kms_feature_discovery@display-3x.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#703 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/703>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-432/igt@kms_feature_discovery@display-3x.html> (Intel XE#703 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/703>)
>   *
> 
>     igt@kms_flip@flip-vs-suspend:
> 
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-436/igt@kms_flip@flip-vs-suspend.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#1551 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#1551 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551>)
>       o shard-adlp: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-adlp-9/igt@kms_flip@flip-vs-suspend.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#927 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/927>) -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend.html> (Intel XE#1608 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608> / Intel XE#2034 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2034>)
>   *
> 
>     igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
> 
>       o shard-adlp: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-adlp-9/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html> (Intel XE#1608 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +10 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +18 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-tiling-y:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html> (Intel XE#658 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/658>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-tiling-y.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#658 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/658>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +17 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +21 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +16 other tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#498 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#498 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) +1 other test skip
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html> (Intel XE#498 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#498 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) +2 other tests skip
>   *
> 
>     igt@kms_pm_backlight@fade:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-435/igt@kms_pm_backlight@fade.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#870 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-432/igt@kms_pm_backlight@fade.html> (Intel XE#870 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>   *
> 
>     igt@kms_pm_backlight@fade-with-dpms:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html> (Intel XE#870 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-433/igt@kms_pm_backlight@fade-with-dpms.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#870 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>   *
> 
>     igt@kms_pm_dc@dc3co-vpb-simulation:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-435/igt@kms_pm_dc@dc3co-vpb-simulation.html> (Intel XE#1122 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-432/igt@kms_pm_dc@dc3co-vpb-simulation.html> (Intel XE#1122 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122>)
>   *
> 
>     igt@kms_pm_dc@dc6-dpms:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-435/igt@kms_pm_dc@dc6-dpms.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#908 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/908>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html> (Intel XE#908 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/908>)
>   *
> 
>     igt@kms_psr@fbc-psr2-sprite-plane-onoff:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html> (Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +15 other tests skip
>   *
> 
>     igt@kms_psr@psr-sprite-plane-onoff:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-432/igt@kms_psr@psr-sprite-plane-onoff.html> (Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-464/igt@kms_psr@psr-sprite-plane-onoff.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +13 other tests skip
>   *
> 
>     igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-435/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html> (Intel XE#1149 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html> (Intel XE#1149 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149>)
>   *
> 
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html> (Intel XE#327 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#327 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>)
>   *
> 
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#327 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html> (Intel XE#327 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>)
>   *
> 
>     igt@kms_vrr@flip-dpms:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-432/igt@kms_vrr@flip-dpms.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-464/igt@kms_vrr@flip-dpms.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +6 other tests skip
>   *
> 
>     igt@kms_writeback@writeback-fb-id-xrgb2101010:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-435/igt@kms_writeback@writeback-fb-id-xrgb2101010.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#756 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb2101010.html> (Intel XE#756 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>   *
> 
>     igt@kms_writeback@writeback-pixel-formats:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html> (Intel XE#756 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-464/igt@kms_writeback@writeback-pixel-formats.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#756 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>   *
> 
>     igt@xe_copy_basic@mem-copy-linear-0x369:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x369.html> (Intel XE#1123 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x369.html> (Intel XE#1123 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>   *
> 
>     igt@xe_copy_basic@mem-copy-linear-0xfffe:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfffe.html> (Intel XE#1123 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html> (Intel XE#1123 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123>)
>   *
> 
>     igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-464/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +15 other tests skip
>   *
> 
>     igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +19 other tests skip
>   *
> 
>     igt@xe_media_fill@media-fill:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-435/igt@xe_media_fill@media-fill.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#560 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/560>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-432/igt@xe_media_fill@media-fill.html> (Intel XE#560 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/560>)
>   *
> 
>     igt@xe_pat@pat-index-xelpg:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html> (Intel XE#979 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/979>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-433/igt@xe_pat@pat-index-xelpg.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#979 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/979>)
>   *
> 
>     igt@xe_pm@d3cold-mmap-system:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-432/igt@xe_pm@d3cold-mmap-system.html> (Intel XE#366 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-464/igt@xe_pm@d3cold-mmap-system.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#366 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) +1 other test skip
>   *
> 
>     igt@xe_pm@d3cold-multiple-execs:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-435/igt@xe_pm@d3cold-multiple-execs.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#366 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-432/igt@xe_pm@d3cold-multiple-execs.html> (Intel XE#366 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>   *
> 
>     igt@xe_pm@s2idle-vm-bind-unbind-all:
> 
>       o shard-adlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-adlp-8/igt@xe_pm@s2idle-vm-bind-unbind-all.html> (Intel XE#1608 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608> / Intel XE#2034 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2034>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-adlp-1/igt@xe_pm@s2idle-vm-bind-unbind-all.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>)
>   *
> 
>     igt@xe_pm@s3-basic-exec:
> 
>       o shard-adlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-adlp-8/igt@xe_pm@s3-basic-exec.html> (Intel XE#1608 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-adlp-1/igt@xe_pm@s3-basic-exec.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358>)
>   *
> 
>     igt@xe_pm@s3-vm-bind-userptr:
> 
>       o shard-adlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-adlp-6/igt@xe_pm@s3-vm-bind-userptr.html> (Intel XE#1608 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-adlp-1/igt@xe_pm@s3-vm-bind-userptr.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>)
>   *
> 
>     igt@xe_pm@vram-d3cold-threshold:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-435/igt@xe_pm@vram-d3cold-threshold.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#579 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/579>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html> (Intel XE#579 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/579>)
>   *
> 
>     igt@xe_query@multigpu-query-uc-fw-version-guc:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html> (Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-464/igt@xe_query@multigpu-query-uc-fw-version-guc.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1 other test skip
>   *
> 
>     igt@xe_wedged@wedged-at-any-timeout:
> 
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-dg2-432/igt@xe_wedged@wedged-at-any-timeout.html> (Intel XE#1760 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760>) -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-dg2-464/igt@xe_wedged@wedged-at-any-timeout.html> (Intel XE#1760 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760>)
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea/shard-adlp-8/igt@xe_wedged@wedged-at-any-timeout.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#1760 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134605v1/shard-adlp-8/igt@xe_wedged@wedged-at-any-timeout.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#1330 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330> / Intel XE#1760 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * Linux: xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea ->
>     xe-pw-134605v1
> 
> IGT_7880: 73618605b4370cf902267aaf1d25666ff5e26112 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-1422-d9550a18e990d5709c4bc33073842a3c0a8bcaea: 
> d9550a18e990d5709c4bc33073842a3c0a8bcaea
> xe-pw-134605v1: 134605v1
> 
