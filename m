Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96734C021A4
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 16:21:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5839D10E8FE;
	Wed, 12 Feb 2025 16:21:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M3tfwr6B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C96710E8FE
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Feb 2025 16:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739377263; x=1770913263;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Zw2bTR33m6S68xLt7U7e9xIsovlSVA6pwZfwhr75M9w=;
 b=M3tfwr6BJnAEtGE9eBVgDuJz5o39KkYpC6b+niiyX8n0waRm+uAGKEUB
 tTLJ6BVQGeXyaz7A9+QSQ41zEHep546X56MX0SR6o1NOHkKduKI7oHPzD
 nFS3TqNpb8Lf9Pt5ZjcZkbzMlrZ4UdtradW2WbD9xiy+6EBgwFiBe5zG0
 foXYQOXWq6Qo4Z8GzL7vBcyeAFzsq1u1g7JsB9md4PuiaSAdTlsd9uv6Z
 PlwFDptBSnrYM55mU1rDuxXMurOiA3JLKbI5UAzJCUcNZeJFx20GyPjk/
 WFsMFufMz5i51e94e2S+8ZQwhahuMizrFirkHtxVQ1Zbo0+KNxEyx6Ow0 g==;
X-CSE-ConnectionGUID: 4I28f6v9QBeoW6PhFJiheg==
X-CSE-MsgGUID: +K30V7SnSKuMUfNRugS1Lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40163736"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="40163736"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 08:21:03 -0800
X-CSE-ConnectionGUID: Xc2FzNH7QmqYcy0aX6TjEw==
X-CSE-MsgGUID: /3pTkZyTTriPzpc2SmWP9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="113384193"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Feb 2025 08:21:02 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Feb 2025 08:21:01 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Feb 2025 08:21:01 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Feb 2025 08:21:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gOxaIX1SoLq4AD4LGJ4BuDyRiRezoSFIiKdlPAAs78DzzrNtJMMbmftmDhwBRDiORlbYfaKlnlLsDSs8qaq6HBhltJ63Sh0U0FLQa+c8k6XrGu9swucmzPPrxaP+FN14QFJg6h+cMnGnAvqqiKfJfZhl7U7yIOtqerkFmNnXvgjQ9dLng2E4436fNq5HJdan9NqgI18t1tKmA9cGkHZO+mhMJ6oENBcIjKyvwxpwRr1BWVgjOjSAJdT6RK0p5Ct6ak1o5tJFdDLWuy3G5sYXSRYJH2NOUfVWfksKzr45e0TMTQ/gNOCZYE4RDLA5CGHE6Xd0W/N8qHBpGLE8zsQDTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U4tODOsN8czNohK8xypa6/xv1yvNkpgRBtWL2pZV7gI=;
 b=dsAAFmzSKsmsenuqOqINWKejR5I4dil9XFuOtEGBlo24j8VVV/o+WNtigaWf0MB6dlB9U0G+nnHSsPvuXNDce8FSxi/nF59BzmTpwv4fF4bN3AI5t+ZnedKE7b9BpE/FhQfPLXxYPJWSi0PPGCSEGZatJuzCYLvGrqIyDBzjAQZNouAc8Bx77Atj/CKXEW5aIQNfWuB2rqVuc8vgD8yzTBmWi1ooblTjt4WDBdRScVLsxw9CyIQw+rIgxeVeypO/MUrORYirWr4/xtHsOLRyVuKHGwFktXpFfMIcQGJfqUJ2kyHCJA5EbUvnOd3VILhvOE5qo38pn3HnX/F/XMx8gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SN7PR11MB7706.namprd11.prod.outlook.com (2603:10b6:806:32c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Wed, 12 Feb
 2025 16:21:00 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 16:21:00 +0000
Date: Wed, 12 Feb 2025 08:20:58 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/oa: Ensure that polled read returns latest data
Message-ID: <Z6zKaoyr7Uq3jOky@orsosgc001>
References: <20250212010255.1423343-1-umesh.nerlige.ramappa@intel.com>
 <85a5ar3nka.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <85a5ar3nka.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BY5PR17CA0023.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::36) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SN7PR11MB7706:EE_
X-MS-Office365-Filtering-Correlation-Id: dc2dda7f-57f6-42b5-46e6-08dd4b813ccf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bDN2bnppYWZleFBhT3RqSC81dStLYmdvT2xLaU12WjViQklscUxvU2dkYWRy?=
 =?utf-8?B?dDQwREJ5NlZEVlEwazNGeUl0NHpad0hoQkxUbWtlTHhZTzVEQ3VwL0lOTmZr?=
 =?utf-8?B?d2ZRU1A3ZGp5dGJaZFI3eFNUSkIyNzVRbjZWM0FQQ2NORFJHWm5UbHhaM3ZW?=
 =?utf-8?B?VTFMUGo5TXZzZklxWTB5TXArRjJoZzBhRGRKL2lJdXd3SzBUZXJUNU5wYWRy?=
 =?utf-8?B?dFdqb2tSMGpONm0wSEtTazlOK3FNdlFaQVFVZnArM1hWRHFNaEo2SlkzSHVr?=
 =?utf-8?B?YVFVbFQ1V2ROSVVqTmhoWU1qUDRLQmFsdWVGVG9iRnNJWjZueXhRSTJJUlpT?=
 =?utf-8?B?VGpOTzB4VTBod0o2VmphUFNJRUJpdmpLVWtlV1dSVmZteDcybTJJTkY5Q21L?=
 =?utf-8?B?Q1lpRi9QNWgzTU1WQ2grZ2x4OS8rWXo4NklHdmYwZnpVbEswMy9QaTFaSEEv?=
 =?utf-8?B?R1JDODlyWldicmpBOGNWV1NjVnJDUmo5VkovcmRFMmtFeWltRU91cVhOQkk1?=
 =?utf-8?B?NTNNdmdwUXZ6OVpMVUNoOGI3eitsaTBhYU5VQ1BYd2ZURG9qWGNRdUJ1SGRo?=
 =?utf-8?B?ZVY3Q3o5ZTJVTm40d3lERk5EbWJ1bnFiSjI5cytvMTZxby96Q3plQWNXVlRo?=
 =?utf-8?B?M3ZOSTFiNEE1c2l0RTBKczNDNmNpYlE1MG9pT05aVFNzeWdMWDFTSmpZd2JJ?=
 =?utf-8?B?dlc4c1VHeE4yU2trUjdRVGNpVVlZd3ZxNFlobGNFemRhSklZR2pTY3hhSE9Q?=
 =?utf-8?B?U2tXMW51NlVJR3hCNXFONnZKUkhiRmNiQmN0WW5DKy9jVU9WajYwWUp3bVly?=
 =?utf-8?B?aWdTUEJEajJGSEd1WHFzQnFObVJzSW1Pbnl1SVAzU2NORlhmTTVLdWlYdlJJ?=
 =?utf-8?B?cU94VVlxUjhkT2lSYXREQXNPWHlDa1N3ZCtLSE9FVGFTemlMYWJOeXB3YWRD?=
 =?utf-8?B?bVgwdkZrak1FNzI5NUozTVFzSHNNOUdnUE1PQ05RNUdkTUZTVy9sZnFxZUVr?=
 =?utf-8?B?SDByNVA3WUtVMGhRdnFwaVNVYk1aZ3ZjeEQyWmZsTFlWelVTUVArUng5QW4x?=
 =?utf-8?B?RXdVS1RhMkZnUnl6UEZoY1FSM3FaTXJxbWpqWGdXeXlrdGNKYldUdVJEUStx?=
 =?utf-8?B?YkJuM0grazdUcVozNkFTVzMxeGRqamdYMHQ0emJaeW9SQlVNS0djWHBoWGRD?=
 =?utf-8?B?Vy9obGduOVpZVkplMGxCS0lvZ0EwK20ySGw0OU4vaHhxSFFHRXU1SXZrc29y?=
 =?utf-8?B?cFJhWEVTcjhzYVFpSmc3TFFuWCtldlM5TGxlVG92alJwR3pZTmRoUldyRTV5?=
 =?utf-8?B?bkNJdVk4WGxEMFVNUi9MRUhUSnRqaDkwL0RLdGZCNlpMaW9Ud2I0QUkwOXAx?=
 =?utf-8?B?MkhNUmtzNW54UUhSSTFUei9na1hIekdKLzR6bEdueCtEd1ZNbnBHSVhUT2pH?=
 =?utf-8?B?cUxUNzl4RkJLVWNiREdtdlh0c29TME1KT3lSUnZwR0srRlBST015YXBvSjV4?=
 =?utf-8?B?dlo4NDBic1FmQ2xFUHIrNGN4clF4c0JUUFZ0WlpRb21YL1pCWGg3dm5zV1ph?=
 =?utf-8?B?dFVZZHBuVEJ0Qng2eEd1RHpHaUswdHJXQmxGUXRiMHhOckFIVExUc3BtQVAz?=
 =?utf-8?B?end4ZXFteWdYV2dRa0hMZEJCdW42MSs3M3I2V3FZUzVtR0FXMVV1QTBjOFh0?=
 =?utf-8?B?SnAwRDhwcDN1aDhxaHAvN0NyYjRMbmxmVjE2OXpueGNBQzlhdEM2bTd1SXR6?=
 =?utf-8?B?QlhNZTQ4NkZTQkZYUkRoV1dEMkROTEVEZ0FaWCs4Q0NXa2NrY2ZtN1AwY3dz?=
 =?utf-8?B?MUp0dzBFZWtXQVRPUWhEVk5VY3JpaVdJSFUvMTlWZ3RyT1J1eGpjWER5SnZ4?=
 =?utf-8?Q?IBglwpn7EpL7x?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWJ2VzJLQnZvQWdZWWNhVE5yMkZaUUh6cHp2VzQwRjF1ZytlM3NwcVlaaldJ?=
 =?utf-8?B?cUdwdkFncE5GTzc3Q1A5SERPVTViRXh5THB5YjBkSUJwYW9zZzB1RnJ0Y0dn?=
 =?utf-8?B?N1FSTHc4NTEzc05MVllBaUplcUhyTUplRnJmVlR4NU9raENtRzdEdGk0a1Zq?=
 =?utf-8?B?SmZacDhFMFE0Z1FXbFdlZlprMitVd05JU1Y2dmF5RnE5TDI0WUNkRjBndldB?=
 =?utf-8?B?QWhwUFhoVW5sSG9HT2lvNzNFcVMxN1NnVUJyKzF2RjdyTHpZREwzbzBHbklo?=
 =?utf-8?B?OXdQaW80OWpUUFU2YWFhcGI5ZWNTeFdKVlFlUXFvTVlUN2NBMUNLSGdrRGhz?=
 =?utf-8?B?U3BLZVdBK2RvcEJFZzNHL21USTlWYTFCVVFMVjIwNDR4MTMyM3ZRakp2ZjJQ?=
 =?utf-8?B?Q01zM3V3bUZlNnhRd01OeHNYM3FTRjJHSE1kUFdjQWhWajRkV3RzMXNTWDZI?=
 =?utf-8?B?cEZEcHZOTGEyRld0a1pRY2RjNFpYRGRrRW1SMTdkck5tanovcmVZajB0cG4r?=
 =?utf-8?B?Sk9mQXlzQmFHb3hIY3NlZVhTRTEreU5lR1NXaFJ3WnFzME1NY2JmeWN4b0h3?=
 =?utf-8?B?dktVV3VIaGt0WUcrbHlLNzlwQTZ5TDh3dCtKcDRYWFd2Qy8vVzRmVmp1bFBS?=
 =?utf-8?B?N0hNOUgyZkdybjNLN0lqQUZvcFhDWTRKNFVhcEk0ZlViL0FBYTkvRjBPZlJv?=
 =?utf-8?B?bXAyeXBMaFpVelRvdTNGK0dRU085STBUaVJDQzk3SlN2aGVjMzh1dm5HR1Rw?=
 =?utf-8?B?UzV3UDVLOEgzUlZuV0NTem4xYW4yekRhTXNBVFFaNVZmZTNxcU5WYjhFUXlP?=
 =?utf-8?B?VWlUUFdva3UreXllRUE3Njh2L0VZV3dlTFVHSkZtK0VDclN1YUpheFNOMzB5?=
 =?utf-8?B?eXdwbi91VHVQVVYzSnRRSEFDRFl1WmhnVTRiZ2xjZTFidm5hbkdyQ2NqVEpm?=
 =?utf-8?B?YVhhNkxwRWpMSm1JNjlFNDhLSEtNZE5uSkdROGxLbE9jaDBqdHg3eXlnWXVF?=
 =?utf-8?B?a2p2ZWtBaUJnQ2tTOHBHbEVGSXdHTjVxNkQ0YlJEbTNuZXJFbmJaTWFKVDQy?=
 =?utf-8?B?bkpCUStSMlBOdnZLUmhUWTFtMzBpWmdBYS8vY3h4a2EwU0lYZDNrSTV6Q0p2?=
 =?utf-8?B?bnBYM3kvNktrRHYxbDRmTDdmTmllQU4xcUpqZC9YMGw3S0o0eGlHaUJpNjRy?=
 =?utf-8?B?TnU3ODcvQS9kWlZuTFZNcUt4U29DQlQ0RXNQeEJ0UGJlN3B0WUxpOS9nZzI4?=
 =?utf-8?B?UytlV3F1Zkpnbi9KeTZQNG04SW84RHJvTVhwdTREWTYwZXpmMllLQlE3WmtD?=
 =?utf-8?B?cXMyWCtwQzI4RFVzeUJjNHdjM1R2ZDdscDErcm1Nd09aVTFMWTZ0bytuZjFP?=
 =?utf-8?B?OFRNQkU5L3p1aXp1ZHJpNGdud2dQUDRpZnZnTm9yaTRuaUVLeWFZZG1lTjhY?=
 =?utf-8?B?bUZ3d2s1TEd5MTdLK2xrN3hldnlNYml0Q2xuQkJMdGhGaEEwbWViMWdDTlAw?=
 =?utf-8?B?OHZjMllaUkpuSHduOXlxbTk2aVZGM0lKODg3ZGJGSm5Pb3pCTnRXTS9ObFl4?=
 =?utf-8?B?ckQwQnZJQWVYa2pVR1VUMU4xRjJOdFRRTnZwMis0amRZOHJzcjI1MlA3YlJT?=
 =?utf-8?B?cFVsK1BIZXdQM0h4RGczYzRhblJYaW8rK1hIdDk0Wjl5UjU3d2w1NG8xWXVo?=
 =?utf-8?B?MzNXU0xDMnBLdkF3QURKamluK2ZaOGJXcU1vbHVmSkJVRXdEYWNqSUNqWE82?=
 =?utf-8?B?aU4xTHFWcnRMTmdCZzFkWFJ1UkxwQXZTSzNOV0hSaEZBZm55QlR4eUVLTXFk?=
 =?utf-8?B?Qm1Kelp1eUdQTnIyVXU2bmM5OUlzUFFISDRxNTVmYW9vaE5Tb04rNE5RcDNG?=
 =?utf-8?B?WjhvTTYrNFlSQmdMQ3RFbHQ1QXI2b1dyN0hRRzNKaEppQWtiQkVMdWZZVTJX?=
 =?utf-8?B?WUdNYlNlTE5EdVhQaUdxTG9BMS9SSnBLOEdCWHhQWTdjRUJtM2JjSExIUk9x?=
 =?utf-8?B?ckx2Y014TkpPdjJlN1JzWUJWU1lFbHRuMUY2S3ZiWVpsc2MxZUpTUUxMSnN2?=
 =?utf-8?B?YUdhWWdqNUE0aVVYWE1GWkZLYWp6UmtvM0NjWm1lREpqTHU4Z0t4WEFXR21j?=
 =?utf-8?B?ZlZ4NElGSEc0d2E2eVc2MWRJYnpIM2JrRnpDeGRLZnJLMGNJSGREdEdOdno1?=
 =?utf-8?Q?wUldBa+hSQd/glGVhF0o8z0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc2dda7f-57f6-42b5-46e6-08dd4b813ccf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 16:21:00.1606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vw0x155eyHduWFscGh1b8XbP5utVvSIvg4UiIVtS1GtBoo5bo2DpNnWsOk3t0oT68LTglT2E+L3ciAIrlrk11JavXs4Tew6Iu7ncBm9mtt0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7706
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

On Tue, Feb 11, 2025 at 06:27:01PM -0800, Dixit, Ashutosh wrote:
>On Tue, 11 Feb 2025 17:02:55 -0800, Umesh Nerlige Ramappa wrote:
>>
>> In polled mode, user calls poll() for read data to be available before
>> performing a read(). In the duration between these 2 calls, there may be
>> new data available in the OA buffer. To ensure user reads all available
>> data, check for latest data in the OA buffer in polled read.
>>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_oa.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>> index fa873f3d0a9d..a692dffcb638 100644
>> --- a/drivers/gpu/drm/xe/xe_oa.c
>> +++ b/drivers/gpu/drm/xe/xe_oa.c
>> @@ -548,6 +548,7 @@ static ssize_t xe_oa_read(struct file *file, char __user *buf,
>>			mutex_unlock(&stream->stream_lock);
>>		} while (!offset && !ret);
>>	} else {
>> +		xe_oa_buffer_check_unlocked(stream);
>>		mutex_lock(&stream->stream_lock);
>>		ret = __xe_oa_read(stream, buf, count, &offset);
>>		mutex_unlock(&stream->stream_lock);
>
>OK, this is what blocking read does when it gets unblocked, so this is
>equivalent to blocking read.
>
>No need to add 'Fixes:' correct?

Right, I don't think a fixes is needed here.

>
>Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Thanks,
Umesh
