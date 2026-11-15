Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F34C606A31A
	for <intel-xe@archiver.kernel.org>; Sun, 15 Nov 2026 12:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j23t5KjI;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=W3QGekDH
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BA9010E8B2;
	Sun, 15 Nov 2026 12:06:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C0C610E83F;
 Sun, 15 Nov 2026 12:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794744381; x=1826280381;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4g3dhtFkWEC6K7xG41y1M/ncdvmiUeDNACciVIaEZSw=;
 b=j23t5KjIMn5eqBj+KMRY39sdOZlQ5x2tAC0Sif3nPbv+tFv+4oXpqxDx
 iNlcn+wY3cRfJKXLp9MqEAzONBl2kDS6HplcjmgsMYOVkfaGKfRo6Uhtn
 l0nH/XSNACJ5/4tVfDIBCCAY3dikGcQBR9qn9JNq44u2aISSKP8A3Vm/c
 3+x9xXEAjVqQVpd6q87CrqYG9MFmGp7uOVpZkAeXA95UakkB886sZHkBQ
 XYSre4aqlz4UKPOBoxKNsfw3+hJRQz1H5x8p77Jk5A5L3NlfSEWkmJ/1v
 TJdHQq0RuMoKTCdoYfTF0qmJR+Kl1wV5q5zSQiO2esOf0sLv27laW9cab A==;
X-CSE-ConnectionGUID: 7tcPo8mETkmogbKkxq3yzQ==
X-CSE-MsgGUID: 5ZSDg/FASiqh9nLONQ35Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3534590"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3534590"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2026 04:06:20 -0800
X-CSE-ConnectionGUID: TiW6TVASQdCoBdHl2FdYCg==
X-CSE-MsgGUID: DUdsaLe+RxCAc61Qo47Syg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9256016"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2026 04:06:20 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 15 Nov 2026 04:06:19 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Sun, 15 Nov 2026 04:06:19 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.54) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 15 Nov 2026 04:06:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y18we3rBUc6WPBY77HRw5llUrlUaTdCpY31QTBsaQL5DaoxlR1ND8thfHF3yah0Qdw6cAOUYQJJfQKDhnAE5NVOAHLeMSThTl3iXy8VQKHJVMHDJyP9+f/RPkcNb+NCjRu8pdMU52F/MrtKaFZwfihECeT7WqRDX7QK4uHSTaW/DF4LMSxvD02JVXDoxol0krGe7kLtV8N7D6AGrZJ1mb0vDlzf8G8f17vj4Z0sTAO4ojGOv7x9snOAn39ZfMSwdobBe1fUTA3mvl6zIZh0E16n25+13z0jVIQQIJGHLfVpl3X2vHBj+g4u1UghrFrOxtoTeTIJw0o9jyCgrLs9CnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5op40KYkd7ciILvaCRtIdxukVMXtYabVKteAO+x2Bpw=;
 b=o/KnRb1SE37byRN8120E/8VIkDRKSgyBtVN8CLeIm9VWLk73+H1pWkk/jeE2wq09pPJY3fZ7KWAneIeN6xNwmuAHVugpmmKXCVSfkpRYbRN3/uHZptiCTdcvJPnn56Htwr7gpx3/FiJVE/X772d8zazPYcmYQYeXd1x65acm7ZTdYh/A6hamHgWhd9KV/H3RsEz9t7hFwO46JiCGQzu+ViHHqNELe4AxTpLU4s/0DahnslZko0d1BV/S/O7fUIU+gw/zTLpNoNuG23s0te2KW20uME2rlm8tgAkkomvGAFZc2bnJucK0/eDPMQ+ENQrOoc9VIrPlIzCNQj3bDX5cnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5op40KYkd7ciILvaCRtIdxukVMXtYabVKteAO+x2Bpw=;
 b=W3QGekDHXYLnfAMSBfls/fHclmfONU94ZGsxTa30co4qD5Rz6jx6B1Bn6b3UweD8rlt4bKOVr0He05Wz6eyREheB7mVO+3KQl46lufumSAkN+SNb6NTf1X1IWmTLilqOe1Pft+BJ6RZVb1a/bEFAb1Y3c8cP4uwDOoTmZhQPNJU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LY0PR11MB357627.namprd11.prod.outlook.com
 (2603:10b6:404:21a::11) by PH8PR11MB9805.namprd11.prod.outlook.com
 (2603:10b6:510:3c2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Sun, 15 Nov
 2026 12:05:44 +0000
Received: from LY0PR11MB357627.namprd11.prod.outlook.com
 ([fe80::71fd:d139:945b:a71c]) by LY0PR11MB357627.namprd11.prod.outlook.com
 ([fe80::71fd:d139:945b:a71c%5]) with mapi id 15.21.0615.012; Sun, 15 Nov 2026
 12:05:44 +0000
Message-ID: <d051aeb6-ab02-4252-bb1e-79f23100e677@intel.com>
Date: Sun, 15 Nov 2026 17:35:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] drm/i915/display: Add HAS_DP_SYMBOL_TG()
To: Arun R Murthy <arun.r.murthy@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: Jani Nikula <jani.nikula@linux.intel.com>, <uma.shankar@intel.com>,
 <suraj.kandpal@intel.com>
References: <20261104-vlk-64036-dp-symbol-tg-v4-0-d06fe6c466a9@intel.com>
 <20261104-vlk-64036-dp-symbol-tg-v4-4-d06fe6c466a9@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20261104-vlk-64036-dp-symbol-tg-v4-4-d06fe6c466a9@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0099.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::10) To LY0PR11MB357627.namprd11.prod.outlook.com
 (2603:10b6:404:21a::11)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LY0PR11MB357627:EE_|PH8PR11MB9805:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a6ed81c-2fef-4dcf-0944-08df4310c6e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|56012099006|11063799006|4143699003|261026121527099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: saLHkXK3M3QvJmlXPOBijrjyd8dKaCz2JqLm85ceIr9VFBERfbWps3ColE7mJFA8PnoKyAiX6zMuiSct7QYUXtc44E3EfVMCoHz1Hq7X+hjTcwa3K5B6RHHV05o/eFj+hE6tC4+miXotcmUC6bTJIzaNfKFuUiGmqSGQwIChkoGmGACQy8jN34chbfS5D65hf95KSfNPbuua0RzNoCOz8iNuWB97J4be2fhF9w1rZ8f9vazaSWIDhM/I/sBYtu1JSwBZdK4wYqjU1elhkA2OLWv3D/vgiPGJq2hhOIe06CCg83m9nVIfGhUQK5wSLkEtlOvmNva/is47TMvo7levLtBOd7kp63KTws3woIN65lnCwdHgxZm0o++gJxYvA9kHgHuXuBHHTGUBc3xRtbjT71pgcL4N4RJmk5AdHoAIXm1OV7ldDi4BBDsjrhiox+jW4YDbFTjea55b+l9U85AWTV/jHloW1rvyPT+xAQNAzV5HzmpNysZPwwuo1KKR+qyX4DoQiPAkaRv1j3fDlJhlfZMH253uvBG51m6xx7M3J8nyV6O3mxLGrG+PtLKegW5xmr6lpidujZI3hzZiqzqVzsba/O7XXt8s8Xyi5O1lO3fWZnKLqu492Zq5ttIDjHB8K71Zgsdzg5Ur8uiNKGyZMkiL+YjJMDQlxWRRppo+ebg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LY0PR11MB357627.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(56012099006)(11063799006)(4143699003)(261026121527099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TElRSHVzVXhlS2JLYTFWL0xNKzdSL2pBK3lkUnN4OHU4ejI4bHNhOFI3TDln?=
 =?utf-8?B?Rlk2YWZzUHk1OTJreitzbDVYOXljYWFGWnN2U2o3TGk0by9uWVpFYXFqZTJD?=
 =?utf-8?B?MHdjeisrSUF5MGdrbjZXRnVtTkM1c0JaMmJTYVNOb3hwVG1UMmtqSlJ5QnJa?=
 =?utf-8?B?bmV5ZU11bmRNL3d5T095bldXWGhvNUVHUUNpWGtwWm5FZmFyaEM0eWNUYzZu?=
 =?utf-8?B?K3krMlc0Q2M5aWdCSk5IV1l4OXVwc3hITFErS2J4WVVHWVd4S2g5M1RyMW1z?=
 =?utf-8?B?cVFPd1dXSmtaQnFVQW5vKzVBZFkxUkdneGsvcUlSSTJCRUNMZ2NhSWVhbWFD?=
 =?utf-8?B?SFp4eC8xYXJUV2RRVmljdy9ocFdiQUlVOEMyZ0ZPOFpBbElucUwwOUdVUUQ1?=
 =?utf-8?B?MkNiWXQzRmJtclVlU1NscEdlYkE4M2NGTGtraE5NeFhhREk2NGpNYVlibmRV?=
 =?utf-8?B?TGliRTg2a2JpYUp3UjVheWR0Rjk5RFNrU29CY0ROcWZBeHRSTE5TV1h6b2to?=
 =?utf-8?B?WWRPcFMrdm5UQnVVYmVvazBkbUJiVHh0U3RuaHhDUy9YNGl4R1J6V0pYN1BQ?=
 =?utf-8?B?UU5jUXVac09FdTZIVWVKeDdYSlMrNnFNQUszNFByeC9EMVBUb0locWhBTEl5?=
 =?utf-8?B?K25oaTZMNDNlN0N2aEllQWlaaWFWeFBDZlBQSVUzclAxbnFWVThRL3MrMkdM?=
 =?utf-8?B?bDhRaTVVUWhrbGx5R2RrblNIMHh3MVU5a2pDYkV2WWRnK0YrTUJlYUpqUjRl?=
 =?utf-8?B?U2R1cmlER2w5ZjFlWC9FN2FuWXhDRUdaSjVtbkx5MCtIYkliN21EQi9KSnRL?=
 =?utf-8?B?U2xHbEVWb0svdlBUK0VLM0pRY2FFSjBxNUdhTFM5MjQwWDdjd0RTaktwRkoy?=
 =?utf-8?B?ODNFL2QvMUhja2tlMzhPWVByYm5TbTB2TFpKNnYxN1JOR2pTV0dqUmUxdzRn?=
 =?utf-8?B?dUsxVHVxeWhvYnRQVTNBTEp0bW1odmp0Znl6QkNoTVhsYjZORk9VQlhKTll5?=
 =?utf-8?B?czNoK1V5SzRMRkV4Wm5sYWRiMG0yK0lpbXhWK3puOGc1NkQzeG9mNW44bVNQ?=
 =?utf-8?B?NXY4djNvb2NZTmltREVXSEJ4ZTVGc3JTcS9GVGU5SHVTQk80V3JIVnExSkt2?=
 =?utf-8?B?Z0dCWmUrSnI4ekkwTUdWaStXYVAydVZ4amUxOFB4d2tsYy9Dc3V5K0t6VVVj?=
 =?utf-8?B?WEY1UHk1ekJ1L1AyMlpQTHE0VFVHWDJIaGlkbGlvRnFqem9QZ2xlZmJWYkM4?=
 =?utf-8?B?VzR0eTh1QjRpNElUd1VWeW44bkJsTjFFTUZjOVlmTU92Vy9EVHdQSmRkcTFa?=
 =?utf-8?B?Rm9BdFQ2cUc4NmhwYlZ2SmRXbUtjazhJZUd6MjBXYkxtNWhWVHpNOFhUNUdt?=
 =?utf-8?B?bjlZS0FCUWtBM1VHTFhQTktYcGZMSUR6OXIrU01GTTE3aUk3dVc2b2M5cVVy?=
 =?utf-8?B?MU43bEFqWGdyYXp4MzVoQzVXTlhvd1dkQjRSME41dnVOaHl5YVpvT0IwZGJp?=
 =?utf-8?B?NExkdGFjOW5ObVpqWkhBMkFKOXhhK1FoRmpTTStIRXhmSnVWM2grTkFiTUxu?=
 =?utf-8?B?RW1aWWVldTE5enMyNWJLQ2Y2bXE4N3Z2Q05tSUxyTWt4Y3JXbUMwSGwySWZ6?=
 =?utf-8?B?b0Q4NUNsRXRyeG1WWWpPcmswT3VxdFB6bUNMME9Wb1V0VFNEVkQyaUNpNUxL?=
 =?utf-8?B?RWpySzVPUFFiWGkvcGJ5SmIzZ0Y1SkFoM2tkclY0TnlqS2pPQ3E2d3g4c2Q3?=
 =?utf-8?B?OFFIY3l6Q3kwWW90aUFpNldyZGtyT3VNd3dRaVhaSGVmeG4yOWhjYUxrOStp?=
 =?utf-8?B?S0lsUkhWeGVMLzhLTEdwQkpUMXJNMGpYLzJLVDczQU5XTUdjODJsUUhnekFC?=
 =?utf-8?B?OTNDbzlpcFZVS1ZEbG9qU04zVHJiWDQvTXpDek40WmsrUnhJcCtMb2YwUEYy?=
 =?utf-8?B?NlBIRStMb2txb1BuUUw1QW1nN2EwMmErczRKTnB2OGxXdGEzZTh3TTFUZlFq?=
 =?utf-8?B?U3dJODlYdFJvMkVabkNYYnhOM09qT0FIUWJDWk1FVGlnaDJ5MHVab0d0akJX?=
 =?utf-8?B?LzkydnNEV2xCajZRcUZBZDM5cXZOYmFSYXorL1lhOEpBaEUyZW9LT2tXejZS?=
 =?utf-8?B?QjBxZ1VCOGdNcE8vdHJSV0R0QTRlOWd2Z0hFenZCelU2SVFhamw2bzhxQUM4?=
 =?utf-8?B?ME81OWFrbXNXakFkZFV1MFJXYnpocEtnVmxJZ01HWmlLYjJDWlF2WlFiUHRF?=
 =?utf-8?B?VEFNbEpPZTdwbjB6bi9xSG45bThqUUIrRHQrWm9uVWREcjVTckEwUFpYckcz?=
 =?utf-8?B?cHF1ZGVjQ09iMXZDTXdIVEZjUEwvZ2NlbDZ2RlNrMFRKWUNSdlUwSFp1STMr?=
 =?utf-8?Q?/G7In6tVMTI4A/tw=3D?=
X-Exchange-RoutingPolicyChecked: exc1jpMpCDwCJM4gDZ3CuEmZNFrGNpjDypyV1ZSK8o6rOMkYYrm97ot+8bpvjeKumzjoO9IdjnnkpA9YcpCO/x7UnZOy/gFusf8pTSamXrrf/ZdPpSKFA3AnSxJo0JPMMhPYG87Rnr5ty2istiDfGC01QgpKzomwTR+Onaofj1P7J+9e/MH/D7ZXObZyhhKgyAXxxXZ6OTCn/6SKGZaMeFrk0ipbkdaCFiucrMaGM9ONC7DF/0qJq1v8JauHb2xp3aX2cM2ZfZdU6j8cmMrHOLqTIdhDZ0eVll31it3hNcO0GjcxW6jlOwsreUo2eDLcSTHACx1iPQTWQJIrqjduZQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a6ed81c-2fef-4dcf-0944-08df4310c6e1
X-MS-Exchange-CrossTenant-AuthSource: LY0PR11MB357627.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2026 12:05:44.5709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1YKmZeEeKwAWgg/lnGKzEuPpi/6wi0FF0JgvBFdGFo9PB5gDw3I7TurXB3c5fMBiWzI/UF0rNgTMmykPfBCHzaElVKiRlhmGuRKSUFY8C/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9805
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/4/2026 8:54 AM, Arun R Murthy wrote:
> Add a macro for the display versions with the DP link layer (LL) symbol
> based timing generator.
> 
> Bspec: 68922
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_display_device.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
> index 7121e7cd95124f3df88fa39f4307db4a209feea1..9c4cafd15c19c39bc0403a05c3b2da58adce1aee 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_device.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_device.h
> @@ -169,6 +169,7 @@ struct intel_display_platforms {
>   #define HAS_DOUBLE_WIDE(__display)	(DISPLAY_VER(__display) < 4)
>   #define HAS_DP20(__display)		((__display)->platform.dg2 || DISPLAY_VER(__display) >= 14)
>   #define HAS_DPT(__display)		(DISPLAY_VER(__display) >= 13)
> +#define HAS_DP_SYMBOL_TG(__display)	(DISPLAY_VER(__display) >= 35)
>   #define HAS_DP_MST(__display)		(DISPLAY_INFO(__display)->has_dp_mst)

nit: Please move |HAS_DP_SYMBOL_TG| to follow |HAS_DP_MST| to keep the 
|HAS_*| list alphabetical.

>   #define HAS_DSB(__display)		(DISPLAY_INFO(__display)->has_dsb)
>   #define HAS_DSC(__display)		(DISPLAY_RUNTIME_INFO(__display)->has_dsc)
> 

