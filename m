Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8351E606A324
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 05:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HL5nlSi+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34B5710E2F6;
	Tue,  3 Nov 2026 05:26:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83B1010E2F6
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Nov 2026 05:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793683606; x=1825219606;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=jw+BXUspbW5QBzUZPQyZwj89rGexqWgQ7FSi2GYeJzc=;
 b=HL5nlSi+KB8/6JBp9n7cFWk5/s/AoASsBNyHfUbHpClkM/x/nEHgNg3h
 tnttLug6gjlrWkdVjAuesG6/NpH8D4TRu6T4DEvBXwttOIOnsl5DtZoDd
 sYakFIyxbsKxZvimO3ipr9SZLA8e9FHr0TtnmEbwDjhuOHGo3fWcyLIzI
 23/eOJEUM/EEaWMsFaffHeEY15dGSoQpv/04h7nUVQN2ptWogriVhXe2d
 /Kz1l44JsBKOMh9bK7hAMJNbV809grMcHI9fBO05xvF4T3DEIUkoCoKia
 3pfRTjcMbZYe4zd0DxoIDo0r5kM1gXErWP7IUWPhaHpOJ7Zu4wTzLZv6q Q==;
X-CSE-ConnectionGUID: x+bRGQ38QxOv5TrUJJMwcw==
X-CSE-MsgGUID: PMEGajlAQJylrOXIoYI01Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2425383"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; d="scan'208,217";a="2425383"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 21:26:45 -0800
X-CSE-ConnectionGUID: sg4nXTpuR4OxSZqFaa0Apg==
X-CSE-MsgGUID: dfQggp7KQcSf6UQKDBP3Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; d="scan'208,217";a="6171205"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 21:26:46 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 21:26:45 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 21:26:45 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.14)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 21:26:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UAz+i7nTlVY7hhYJAOelvSOpW60WvNq6ZVprfR4Ld/+6n1GZcGFrrDaHJOYioibVAYVI0gMjPgqGUYscWoTBhkWQlw2G//aEwbmEj+BwFI6YhusE3/dZjnQ4KYY/vX3CuZYiIx8BIK/AYvrZzTmIXd+R6g0bBzn44pJ3BOn5k+v4p0PLsnjZOWCe2+DnbVFxbp0BGSRBLYBaBUZOl8aOVPGupXVn7PzcuwU38kQG+xYB3cqFtJmhdYig/kX7autPbjriRqGrR8LW4MK6DoD3H2AymxGU7AETQ37HziRENMbEDsk1HgwUvX1fH72dNzNQi7cM0eJCKRsmXD40XI4qkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0kIVTKZvbV4orL0MNnD3Sq0vA+Nlmyy58pq41rg9IHg=;
 b=WtyVAkuIJ56Z+YvNAqwYzk3YEN4bVDikj+Zif1/2/iCwDGc0gB5iA/nM8nKSjszqdaumnIWWwehUpigNpcq4TxkPmWBNGfUPfpPR3v2fafl4Ij3HRMZU+77RKhzXxev2AH7XUlAsvKBnK24UJ8LG9YXqUvT7PwiJquipM6ncxzdiU1vlEdhmNScWcYSjfYfmMaNmjroMe5qH0f4pwiWq+HmbPU9ivX77DHRP+vShHJx0fZoxEhcircMHOd9dhTS8h4/cVw60lKUG2fw1lZ8yP3aH+6WQl7qrCnc9k1usEZN7MAxsoM7VYHoykQx38lH/9t61bHbOopSASTSbppJxpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7145.namprd11.prod.outlook.com (2603:10b6:510:1ec::17)
 by IA0PR11MB7258.namprd11.prod.outlook.com (2603:10b6:208:43d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 05:26:42 +0000
Received: from PH7PR11MB7145.namprd11.prod.outlook.com
 ([fe80::341e:838e:e911:f62b]) by PH7PR11MB7145.namprd11.prod.outlook.com
 ([fe80::341e:838e:e911:f62b%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 05:26:42 +0000
Content-Type: multipart/alternative;
 boundary="------------V6VGbzCYyHshTs039kfBv5UR"
Message-ID: <85d7f778-6b4d-4665-8c86-65aea2454509@intel.com>
Date: Tue, 3 Nov 2026 10:56:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/i2c: Fix use-after-free on driver unload
To: Bartosz Golaszewski <brgl@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
CC: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>, "Bartosz
 Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>, Danilo Krummrich
 <dakr@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
References: <20261009164241.923756-2-balasubramani.vivekanandan@intel.com>
 <auC-ryi8PFiPgiLE@zenone.zhora.eu>
 <gdkx2gc2up64m2xnkazaoehk4ftckfoemvwaws6xevhnjddcyb@drcqglzj3hdy>
Content-Language: en-US
From: "Kumar G, Naresh" <naresh.kumar.g@intel.com>
In-Reply-To: <gdkx2gc2up64m2xnkazaoehk4ftckfoemvwaws6xevhnjddcyb@drcqglzj3hdy>
X-ClientProxiedBy: MA5P287CA0015.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::15) To PH7PR11MB7145.namprd11.prod.outlook.com
 (2603:10b6:510:1ec::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7145:EE_|IA0PR11MB7258:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d07131e-4a04-43bd-8266-08df396b0b80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|10067099003|22082099003|261102123227099003|18002099003|13003099007|8096899003|56012099006|11063799006|5023799004|4143699003|261026140227099003|261022105027099003|261021121427099003|261026121527099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info: 2M5VvvWOU8BHkrWYHzROC5hHugtyAbqvjWND1j8YiaUJpd8C8tczsegbkI5+WdHP6k8UjTYGPTDYsTsNW8XS0mOP1efxL7DDrIaSSsWGRcqorQ3s9mP8/oIsGcw/yjNNXHS+JtN4vgwDNDzfWyFTIhlCy9LChARnhYYtj86b4bhYQXliPt5aYJKhS0DCxjNwkgXU1QIxPymNyEZDFX8VyrwVqY7cYwezFNL23Y3nvQiWAL5A3w8ksdJfEy+Wvz7QPo68Aea760dmzkyNVCVNRey5Gw3d3dp59rTmFuuYXGjVVF/Jrq4xtK/NHxTGs1y3jE76gMOlIGJM28R7OFyNrF66f18OnQaV10SgDcVLj0bUZdwhxKp+Bj4heImRnsjT7oC04oYvaOmnmVaJda5o+Hz8nqkDOr0jcF6I/+nisNbpl+O9rkuAFMofaRpOBF3zWGnvHsQ+Vj8oQYrAJzNBG4fSOkhd0Eoy0vDrIYMIM+3tKEvwhejAcIQWS6VS8pCXcK4zjH/SliAymG0YWd3x5fUIZzWKvuuwyGTdCJOOxhHvI02rS8CRYP9L8TqeuzBWKDHgv2/NyrXt07wVCGDOTCOkB/LlLr5ku0Ze0LigFIWrPCHFXCAW2BoR+RqVjzkoB5RBIPAO1GK+RXslPP6lAMeam8X7mwIEqNPxNGIe8XI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7145.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(22082099003)(261102123227099003)(18002099003)(13003099007)(8096899003)(56012099006)(11063799006)(5023799004)(4143699003)(261026140227099003)(261022105027099003)(261021121427099003)(261026121527099003)(261009223027099003)(261028144727099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TS9TWXM4M0NUN1FpTEgxa3hWamxreHBEbit6SU5vVkxNaG9lV0o1T1BQeGR0?=
 =?utf-8?B?bW8zS0lEVldraWtSa1l2cEdka0RJMko5SkZ3dVBRQXFlZWxmcU85Y1ZFbzhs?=
 =?utf-8?B?aVU3ZjhwQTM5aTFaQzlpTHRpcjZ0SUgySEtMd2gxRmxsN0JCSzJKWHhpbTY3?=
 =?utf-8?B?dWloTStMVzFyV2tPVlI0Z3B2ajVIWXRJYldmUkhoSnlOWDBxTkkzZWw1RjlP?=
 =?utf-8?B?d043NjlZRCtBemxyQVA2YjRPVjRrY1R5c3JuVG92S3FUTDNidFFtQjZhNEpw?=
 =?utf-8?B?b2pMeHhtc3h1TXRnQUNvaHFNODhoUTRnRnluUzhBdTdzSUVUZzRTSGt4eldn?=
 =?utf-8?B?Wmt6WHZ1UFBRaEgwMU9hamFZTzRLTzRPdW40VnN1LzIwK3NrQ1d0QlpPVTRW?=
 =?utf-8?B?cnlBL3VhcUVCQ2daR3B3c2d6VHNOOVdXYnpNK1lrMTVkVEUycGlmZWxOa0dV?=
 =?utf-8?B?dGZuMW9uMVBqb1NNb0dzS294OUhNNnNSSFhXYnVaZFJYRmVpTHRjaUYyNUsz?=
 =?utf-8?B?dFJ5WFR1YjBLZFFzUHhCNHJKWFpVWmpNMWZFMmR5K0I5SnRLa2ZPQTRSb2h6?=
 =?utf-8?B?ZUx0VjZidkZSZmdnbU5rTG1raUdYYkx0T3lsQjJpeDg3ZlVYK3BwaWY5Syt0?=
 =?utf-8?B?ZHYyUUF5Uk5WTDVUczNyZjNJbm9KaHYyTHluY0ZHNEF2RitxMEdQaU0wNFox?=
 =?utf-8?B?NmZ5QkpSTzZhemY2Z0VOVFo0NnY3aHdnZFBRSklWd2pWM0JXZHV3c25DR3R4?=
 =?utf-8?B?RUxTalA1c3BmN2wwY0doM0Q4V2ZBeUUwRGhtVi9NT2k2RHlQZ1Y0Y2dQRks3?=
 =?utf-8?B?VE9vRmw2bzZlWHBIS2pySk54VWxhNVJ1QnA0YVRGOHhIb3djekltTXlkbWxS?=
 =?utf-8?B?UVR5cU9yWW1TRnJzTnM3cjRFS0dOc0UzMHJGMjNYZDEvdlhFRzlnazkrS2tP?=
 =?utf-8?B?RnR1MUd5V0pucUthRnNzeC9kWWdrWHljMU1KNXphWVBDeDZTL25qRVdJYVd6?=
 =?utf-8?B?NWc5WC9wcHJFWVNlRHpBbjNzSnhlcm4zQWM2ZGNxYUZyM3pWaittWUhUd0NS?=
 =?utf-8?B?ZEY0ZmJZbWphOHJKNkRld09FMERCOE1EajBDUEFveXoxYTgyYWZDWXM4M1lk?=
 =?utf-8?B?L0p2ckxncGx6RGVic2RuQ1kvMnlKVENkNGxNR3NacGlhU0tQeXBmRUFBRUhB?=
 =?utf-8?B?VDVHWnBiZU1QWWJOc29zR3Q0QTdNVW1ZQXVJdDgxR0xRZlB0b09PYkxDYkc3?=
 =?utf-8?B?YmlSaVhVODRESXpyZ05ySnZYU0pFNHZ4d0pKckF2cDY2WkVQazc5dmczTGxR?=
 =?utf-8?B?M1dqNGFMQ0w3ZVNMeGV3bkRNWkRIbHpYQkczOWNsSjYyNFQxdDlSVnFtM0hY?=
 =?utf-8?B?TE9JcEdLT3BKRFFHRUhxbGt0cnV3eEdLaXN2QWwyaXNpd3d0dVFwQVBZYk14?=
 =?utf-8?B?VzJuOEd5RW82ekIzTEpJWXRORTdlU3U3TWlGNzdhaEVsWFdhejNCU0dvT1o3?=
 =?utf-8?B?M3lTUXFZYitYbHVkbVE3SlZEcm9zMmo3VkZ5N2NUbk1PcjlKTmVvQ2JXWnhG?=
 =?utf-8?B?M3BsSkQzRHhZWWVkS1pqYTRZNzZ6L1ZGcE9LdE00VWJZd3NGdDRuQkI4NHIv?=
 =?utf-8?B?NXFjRW1McjEwbmdyb2xMd3ZBc1R5STdSTXVyODhnMG1mdDZFN29SVmxycmNW?=
 =?utf-8?B?b0c1WFNqaHlCbnZxVmNxZnRDZkc1R1huS24yc1k4U2FpZFQ2TnZzMWZIWDlY?=
 =?utf-8?B?TndGMC9PcVJHN05pWFVxN2hJbStyWXVqREthYktWUENBZWVNSmNmcDNaZm53?=
 =?utf-8?B?YXArNzNzc3JXRUE3VEhVWkhWVlAvaXFYNHRXVzc1czhXYnF5Z3J0ODZ5eSty?=
 =?utf-8?B?SUpyeVhYc3A0TTZkeVZ1U25zMzFHMDMycnFxbjFUejhJNi9zN2pSUDA4Z2Vm?=
 =?utf-8?B?WmlQQjNiTVpHdmFETUhzeFlURFljQXVUMWExRnJqTHZ6SGdKd2ZLYVIycDNr?=
 =?utf-8?B?UVlyREhtK3lJVE1rRGVzbDcvaGFqYWdOQXJJWW1paGpwajF6ektRM2oyd3Zy?=
 =?utf-8?B?Q1hVVkFQVjdEbVd1NjJmMXB4N0FXd3VaY1AyRExKU0ZPb1QyeHdydHhxSXda?=
 =?utf-8?B?dlZIWTdXVS9zMTFoWnNlMDNSbHZnbVpvNkZBRWRBbEVmTmhYUmpuVmtFZ01w?=
 =?utf-8?B?ZjhiYzRjVmN0YTBRd1pyc1QxR2cxb2pYNFFuMWVPTkdhQW1NVWJHUFNUcGh5?=
 =?utf-8?B?S0Rpdm9CVTIxVUhZT1o5UHJnaEh6cWZJWUloTnFqbXFvRnpHZElWQjBCSTNp?=
 =?utf-8?B?TE50SWdabkwvb1ZoUTdjaTR6RFdPMHJsZmlnbHlDeU9XZVAwNGJEZz09?=
X-Exchange-RoutingPolicyChecked: dQbnay41ttz0tV4gCUj0iBZ/EJOgXP7n3k7k2MXr4TBi0bac1TkQ2XafvVXXHCBZxHHYmyzC/CBYDiXvGsw+1l9hZXCDt++yj7LI1g735s4tTyRxM8OrG3dRsMoDDURnUsJp3DiFwrsUB4hZ27VlElmFBSTu49RgIc72ujvgeY9Gf3OpcPNt1rp4pEG0cvjgd8hje7w0ZH5mwH8ZIXrtWvnBNE7Dh7ZU0De7agSVVbbHjN8HKgl77RqwKeKGix5PdkgHlXwsDiA/jotx8M0YGcIxWKHV4k8G3kfUZ7KxQWxHNDW+EPgQ/vSa81+ZnRjGL5t1f20BvzavFcbMntGEUQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d07131e-4a04-43bd-8266-08df396b0b80
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7145.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 05:26:42.8569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gac4892qOiPp5C/6WPNzui1SIKjG302egT5glVUIyo9/K86ciRvFzrzukwZ4u+mtJ6K4mPkwDzlt9H5ChEyS5h5Bg9sILHYYANM7LaUxK78=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7258
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
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------V6VGbzCYyHshTs039kfBv5UR
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bart,

I have already shared a patch for review at drivers.core mailing list at

linux-drivers-review - [linux-drivers-review] [PATCH] software node: fix 
double put for shared managed nodes - arc 
<https://eclists.intel.com/sympa/arc/linux-drivers-review/2026-10/msg00096.html>

please have review on the same and have added you in CC to that mailing 
list.

Thanks,

Naresh

On 10/29/2026 10:34 PM, Bartosz Golaszewski wrote:
> On Tue, Oct 27, 2026 at 04:11:51PM +0100, Andi Shyti wrote:
>> The patch looks fine to me but I still see that there are some
>> concerns. Like Danilo's points are valid, can those be addressed
>> later?
>>
>> For now:
>>
>> Reviewed-by: Andi Shyti<andi.shyti@linux.intel.com>
>>
>> Let's wait a little and if nothing arises I can apply this for
>> XE.
>>
> Yes, the patch should probably go in anyway but the underlying issue
> will need a separate fix.
>
> Bart
--------------V6VGbzCYyHshTs039kfBv5UR
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Bart,</p>
    <p>I have already shared a patch for review at drivers.core mailing
      list at&nbsp;</p>
    <p><a href="https://eclists.intel.com/sympa/arc/linux-drivers-review/2026-10/msg00096.html">linux-drivers-review
        - [linux-drivers-review] [PATCH] software node: fix double put
        for shared managed nodes - arc</a></p>
    <p>please have review on the same and have added you in CC to that
      mailing list.</p>
    <p>Thanks,</p>
    <p>Naresh</p>
    <div class="moz-cite-prefix">On 10/29/2026 10:34 PM, Bartosz
      Golaszewski wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:gdkx2gc2up64m2xnkazaoehk4ftckfoemvwaws6xevhnjddcyb@drcqglzj3hdy">
      <pre wrap="" class="moz-quote-pre">On Tue, Oct 27, 2026 at 04:11:51PM +0100, Andi Shyti wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
The patch looks fine to me but I still see that there are some
concerns. Like Danilo's points are valid, can those be addressed
later?

For now:

Reviewed-by: Andi Shyti <a class="moz-txt-link-rfc2396E" href="mailto:andi.shyti@linux.intel.com">&lt;andi.shyti@linux.intel.com&gt;</a>

Let's wait a little and if nothing arises I can apply this for
XE.

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Yes, the patch should probably go in anyway but the underlying issue
will need a separate fix.

Bart
</pre>
    </blockquote>
  </body>
</html>

--------------V6VGbzCYyHshTs039kfBv5UR--
