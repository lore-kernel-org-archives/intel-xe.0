Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8A5606A31C
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 09:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gDpwD2e3;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=hzm4yuCY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB3F710EE30;
	Mon, 16 Nov 2026 09:47:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3160810E28A
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 09:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794822428; x=1826358428;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=UaGAH+N+eAe1XTAw9vpRnlKUOBVhsf0VqeiUIKgqG7U=;
 b=gDpwD2e3HjE3gS8GhGGp4sPdjPvAmARp2X20HQ9S1vwW7NsPYJ3IEWGn
 +5g/2HRJAbJ/IJY5phTROTHZGX2RL0nXJL2i0f2KIyJdKO/3ZVzaNtKfl
 etG5BiyQvXlN7HVNtFIWwVMYhYny53KL4M8g1Va02tK55SOONvff2Dt+X
 6jDpWIYStproBLAU9uSTc6oskpL0dk6k6JV0t/p7hfMIHLEsAEfV3Kcpi
 pohR6M/fQR+K54fxm7sChZHa0Im7IValI1cZjDcsvEhyNtSu4GtbqzD0f
 EAH2qHpROmceJHrdIknf13C8TcksolpYgo1fZ+JvaqIFbVKlYRSx5HJ3Y w==;
X-CSE-ConnectionGUID: 5QIpN9rOQSefZuqW48WGCg==
X-CSE-MsgGUID: w5Hc4/7QSNSUdYeYoEJ4eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3426445"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3426445"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 01:46:57 -0800
X-CSE-ConnectionGUID: PLQdZbinT8ikwE8Kle6HFg==
X-CSE-MsgGUID: T7EFnSpWRQiXqD3xWPyk0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9312401"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 01:46:53 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 01:46:50 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 16 Nov 2026 01:46:50 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.23) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 01:46:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vTTfH3/RaZhuMmcfc5VYbfLfy5qzo8E4H6OrWbgVy6GpValjjWxhY06KlDhe1uENzuYEcQ4Grn+EPeqb3NfjBveMzIcyXOI7vRuZOO3GSmmN3w3RUaYOTEDS9lWYhsd0YDS+kuaZREjgeTSU+O2DQ/HolbqjCGkst5qLb3mopaMY1DDWiXSmZ0kP56IhZmRn4BxzW4XOGHiEZKFi03QAJpqdm6YK+NIuPljQXp4T6ZpYRBbk8qhqjsjtB7Kaia2MkvsIyKB95gwNUswPHKOYE2+zA3iAUq71cwNRjlTOzHq8K2uq0sXIkSy/d6OMMmS3I2HMnAT10Cvmup2pj74zYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xxRdDhaSx2DUzaLSYeRwExtHrSzXlHEhX7YIlLnGSPo=;
 b=ja6E7ARiuF5XxzwUqVQNzF4vmbTHCRxocldezbCb3RCa4ZyUdcTVzZ70djNBy6OhK25ZlDeGmfyPx7MAiF9X6nNUnhVfW9tsc3mU2kB2JjjhFRnafyk40k5Zyo8eErWQ/3gumnL5zybvn20eilrhAWhsEkpjxplu0lW9nTUTfmi/BRU3nqDtwMgouKtKuFkCAiEC/zhm1f6dbkMR6IChv/2z9bBGaUzzR8Bc3WvwuaBBllnv+9J1vsGfi9zYtq2bsESvUnfPHnzt6gFtcTiY5oyvoLwsSTqQhAtUQJolk+bF7Zw2TiQn+fpjFj/94Y0Ow4Wt01Rfa5rxboK9UTtNOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xxRdDhaSx2DUzaLSYeRwExtHrSzXlHEhX7YIlLnGSPo=;
 b=hzm4yuCY5EUQWW8fMF/6Om5qTpUjuck9RfyVwGBtN5vbXIC7dV5d7rDSZ4pilFEUbYgsagd/oijupJw9gfJ9NHtCKotoqrk4kpPNWEqgqXpmfeH0v5nnVp1wbbSB8ruIO9VPFmHudAzjNWxKskML/SpA8pzFADtyBILj2q9ukt8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by IA3PPFED21B01E3.namprd11.prod.outlook.com
 (2603:10b6:20f:fc04::cd) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 09:45:48 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%3]) with mapi id 15.21.0615.012; Mon, 16 Nov 2026
 09:45:48 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Matthew
 Brost" <matthew.brost@intel.com>
Subject: [PATCH v4 4/7] drm/xe/ttm: Back each VRAM pool with its own buddy
 allocator
Date: Mon, 16 Nov 2026 10:45:20 +0100
Message-Id: <20261116094523.2484301-5-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116094523.2484301-1-piotr.piorkowski@intel.com>
References: <20261116094523.2484301-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0325.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:87::14) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|IA3PPFED21B01E3:EE_
X-MS-Office365-Filtering-Correlation-Id: 66df013c-75bc-4bdb-812a-08df43c66467
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|18002099003|22082099003|6133799003|3023799007|11063799006|56012099006|10067099003|261022105027099003|261028144727099003|261026121527099003|261021123027099003|261021121427099003|261009221727099003|261009223027099003|261009221227099003|261009223327099003|261009220027099003|261102123227099003|261102130727099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: NbB6KN9e19rCVg72jznaSn8uM+E20Em5RuweLcFqZ6NBqHK8ty26La52p2hY962dl8L4tBMGT9fmBlFtfP8iaBRQ7b7e6dYj4+P14Bi/MNAFweP9yUzAYS2lrBdWknEjecQlYt6CdiF+QiPvtU81UqhZMMAAneTCB4FKhhmVVkLcJo0IytmDF7OxScMgD4o5M9pFaWTk589s8UcSEXYjf2m32oKbmffJ4JjXKqGv0mQjD8B6v/AGXK2H1RfcFFMF0MRoyIz5SsBTUthttCSAYR0XujmMysNTwjSF5AbJcjJqPW4ibScUMUHO+q1LkFVw5x3oMQJjfg04wr13wTl8lCO2rCLSd+1OmoID02o4ylAvyx7P6oy8vfwIHoNmr65Lqh0XKdhGvG400krWqwp9668HmCKtSqqBuQ0fHS5SciMKl9mKgZssA41pvhrW5mLDIpMiSkqGIGr1wWNpxloKyiodTtT9QWHJD9gUGM+UwtG3Aq7iCHVzKFOZxpCGNCmSKuPhep3/RemKQzRqk4Klp7FxjN1dXXthcPRwwzROzW0FQpKxqWk7cTsyTL1IyTlEkjvx0JvZvt1hXguU/rowsLCDNhIXUQJsnd3cRdgzAW8GleOxsQRAeGuCRU/Nad7RRV7ZnNipMamxnbPFJ9VzWn7JR2Cb8/0ba1v/hx+Qpac=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(18002099003)(22082099003)(6133799003)(3023799007)(11063799006)(56012099006)(10067099003)(261022105027099003)(261028144727099003)(261026121527099003)(261021123027099003)(261021121427099003)(261009221727099003)(261009223027099003)(261009221227099003)(261009223327099003)(261009220027099003)(261102123227099003)(261102130727099003)(261026140227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGhOWkg4ejJ6ZWpBU3dZdjhYK1I0QXl0UGJnM0lZcGM5aVZTbGxoZDBodmwz?=
 =?utf-8?B?Z1EzM1dVR3kvd1BNNTM5M0N1VVMrUXdBWVh5UzFuOFEwTlFXdkRyOWVld2JY?=
 =?utf-8?B?UWx4RTJuYVZqMGNGRUpWVDFhNXp1bnhNeFBXK2hKL0pwZVV5WnUvZ01WcFdw?=
 =?utf-8?B?TWJGRlhOSlYwSFBTYVkySGZCZ05WL25EanBadVJEZzByR2JYTjBmRHhESG9Y?=
 =?utf-8?B?L1VvYmQvTDkxa2d0NTFrTU9zb1FyUnpXcUwvcHZDS2JiK0w1bkRCVVoyNHNz?=
 =?utf-8?B?eVNRamE5Tkx4bnM0WXB6VDZBSVRFbmpkTFZmSWkxNXMwMGdESFQ3VnNGZjJZ?=
 =?utf-8?B?aUFITGlnNFZMNzdkL2NENzBIUnphSnFqcGFpZjRDZko5cytZMnhQOSt2NGFE?=
 =?utf-8?B?UGVqc1V4MjVBWVVRM1VsRHlMUSt5QUxSdGFkbXR5Smk0bzFwWjFFbGVSSHgy?=
 =?utf-8?B?a3JWaGdMeGVxRzN0RmZGUlRVMlZGc1ovZk1hL0oyWEFMb2tEc0NyOXlpcHlQ?=
 =?utf-8?B?djJRaGMyM21qUmxzMzZTd29VWjdFR25sTWFGb3ZadkFaZ0t3eENRcFhIV3Mv?=
 =?utf-8?B?d1dUR2VKK0RPWkdWN2VwRXVkNUhaUEE3SU9ZRmhLWUl6djVZUm5vT2JHYXJO?=
 =?utf-8?B?Z0drNjFtdHBweTBwRlZWNWY3YUU2bWQ4UTRMb0xUSHpkMzV0NytSeVhYZ2E3?=
 =?utf-8?B?dmpzYzBzZlZBbXQvSGR4eVExd2hIR2VFTnlkSEZHYWNKclVkYU9nSnNrcUNj?=
 =?utf-8?B?TGZQRlJiRE5zUTFsY1hCbE4vazkwUGVhM3JtOFgyWkpYdjZ4T3JMbEhBUitN?=
 =?utf-8?B?bWVLeDFYL0lac2djTGRXcTFjL1JaaENiekNPd1loN1RKQThzczVVY0kwbkx5?=
 =?utf-8?B?ZlloVWJNelByTTBJTlhub1pnQkxTMGcyYUFsd0VFTXVVNEZLZVVIUjYwTWsw?=
 =?utf-8?B?ZzYvb3NqNnpsVCtGMlRkWGNBWUJXTXFhUGUwdWR1UHliVUJxb25LUEgwNmEx?=
 =?utf-8?B?NVpsRGFMampFRHZiNWI0elZqaUNGRTBXa2JDc1pDd0VPbmNuQmFKOTFOL3Jt?=
 =?utf-8?B?UC9tYVYyME5oLzVuVzZXZ2hGdVdrUnYrY3FxZy9lbXZGMW1SWnZvL3JLaW54?=
 =?utf-8?B?b0o1RG5GZTBEcUFLUXNUbzJ6TUN2eGhtU0t6K2RTaWZMenFhT1lZTS9tVnhF?=
 =?utf-8?B?ZXJPb3U1YVBONk1ZMGRCSE1jSkdFcGV2Qytkc21SUnJYUUYyMUhXVkFYYmVX?=
 =?utf-8?B?dzV4bzlRMGNGQndYK2lnM2tqSjU5SFVGSjY3emdZQllYNFBBVEgyc2JCK2N1?=
 =?utf-8?B?OTQ5VkpJRlUrQ3Jnc1lQY1dBMWdlNUsvUGdQZ2NDempJSWNhVWdtR2R0dm94?=
 =?utf-8?B?M1l6Y1Y2MnVkdW8wbWI5UllyTWhvVHp2MzhrUFp1UEdaSzdyangrdXV5RDdE?=
 =?utf-8?B?cmpaR1VJSzl5cW5HV0N4QnJMWExNcTNzMjBpV1ZuY2NGRG1ldnRaY2t6dHdj?=
 =?utf-8?B?bDVFeHpWNy9NTzV3b05kV0pzcmR1SDBuT3lHWkZXeDE5dEFPTVljWHFyUHBX?=
 =?utf-8?B?YWZBTDUvbzRJSWdqNkpaVit4TGFxRy9uSnVGT3hFNlpYK2ZJMnMwOHpyalVD?=
 =?utf-8?B?VE9BU3RhQWdrNjVMeW5hN1d0S1NwR3FVSkNWMTdGL0xKTnlPZ2o1eHJJc2FK?=
 =?utf-8?B?WlRlUHRDNjFaVmFteDNKTlBEWjBtNnplQW5LMTA1bHVEUGZ0UDNjN3pTN0hB?=
 =?utf-8?B?eDNrVUtTc0h6Z283elNzVHluUGo4MDFDTjNGSUFTQVA1Vm93ek1RVTkyS3ZK?=
 =?utf-8?B?RkJ0VERxcHVnRU9tbGM0STVpU3Q0dnpGamtNSjlWY3VzNkdGWWo2ZWtLTUkw?=
 =?utf-8?B?QzJURTdaV1RockpuNHFPbkNaVDE5azJ3RjhzbHpZOGcyNHVlUU1GYkNRYTVr?=
 =?utf-8?B?aC9xRTBQTUNranZnRHJLTzJUM29ub2Ztem1sdFlBRmljT1dXSUxBb21OK3FQ?=
 =?utf-8?B?dk5IeWxsL0RPeUYzUGU0MlAxYjlkbHRzOUVndjN0Ulk0cW4xbXN0VXMwb21B?=
 =?utf-8?B?d3dvNmk4V0ZTQXFnQmJENk1FUE80amdXUkg3VUFTSHU0aXR4bFQwOXo5TzJB?=
 =?utf-8?B?Si9KL25zTTdxcFhiSWhvMTRJbEZ2cVlwK1RCZ3RrVHNuemtjOUtDMFFZUEVu?=
 =?utf-8?B?alh1L3QrTXZJL08vRlhCYndncStkTFo3K3R0ZHl0NjZwenZXSC9uRUJINFpG?=
 =?utf-8?B?N1R1cUUycDRGZXNkaXFBMEJhaDBtQWttVmpsMm5BOVkzaWdsL3ZtT0lWY1dY?=
 =?utf-8?B?REhBRU9JaFJlbE4yNFIvTzUwUUdqc3R4emN2Q3poYzZkTDlTRHB2dW56Um9r?=
 =?utf-8?Q?mpCqLhEwMwHlfsOU=3D?=
X-Exchange-RoutingPolicyChecked: w+DqhyqXKTxUGiEK6AXKdJ0TgJ01382NQ6Q9SzhNLU569svrQAPKAovIviYxwqEUroQTgO1W3kHqOzGmGxQk14CLvz2nWj2kMvOLw4Vd+iAZtBYykbF1cI+b/V1qsnuaS4cF284LsjtoKC9IviqffXjci/YhjaVmABGO32yo5tlC7IlDNetYvuDVZoSVq/7t8UZ37SxPAYeoQ5evjfpMTHXFrDz7InwlyZ/gO/5b3h8ukx+aLYKlfms0ZbjTY8X+byiswmGaQNGKVoIe3UDDcVDbZpN/xe56so9dBIHzVYBZggFr5G6mgM28iNB1kwUZD6H3ybk+XK3BjnQJH6XwAA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 66df013c-75bc-4bdb-812a-08df43c66467
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 09:45:47.9490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3wFcznzHgzR2M6RDuvqQyKfRDbRLCyCWSDpCXB503nlEzcmVAQUMT3EfUabmqhmfk2zD+7ZGpDs9APahYv2RtYa4piHdLiAQFTTirfUcNOA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PPFED21B01E3
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Give every pool of a VRAM region a buddy allocator of its own, so that an
allocation can be confined to a pool without resorting to
%GPU_BUDDY_RANGE_ALLOCATION, which constrains the buddy algorithm.

Buddy offsets become partition relative, so resources and the resource
cursor now carry the partition their blocks were allocated from.

A placement range narrowed down to a pool may end up empty, e.g. a small
BAR CPU visible window not reaching the pool, so such a range is rejected
up front instead of underflowing the size check and the partition
relative offsets.

Usage reporting follows the pools: the memory region query reports the
size, usage and CPU visible usage of the general-purpose pools only, with
CPU visible usage now tracked per partition, and the free VRAM of a pool
is that of its own partition.

While at it, make xe_ttm_vram_mgr_intersects() and
xe_ttm_vram_mgr_compatible() treat a zero lpfn as no upper limit, as TTM
defines it, rather than as an empty range when fpfn is non-zero.

Regions still have a single pool spanning their whole usable range, so
apart from the above lpfn handling there is no functional change.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c              |  21 +-
 drivers/gpu/drm/xe/xe_res_cursor.h         |  45 +--
 drivers/gpu/drm/xe/xe_svm.c                |  16 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 366 ++++++++++++++++-----
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |  51 ++-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |   2 -
 6 files changed, 370 insertions(+), 131 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 850510443dc77..6ec02fe4af0b2 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -284,6 +284,14 @@ static int query_mem_regions(struct xe_device *xe,
 	for (i = XE_PL_VRAM0; i <= XE_PL_VRAM1; ++i) {
 		man = ttm_manager_type(&xe->ttm, i);
 		if (man) {
+			u64 total_size;
+			u64 visible_size;
+			u64 used_visible;
+			u64 used;
+
+			xe_ttm_vram_get_general_pool_sizes(man, &total_size, &visible_size);
+			xe_ttm_vram_get_general_pool_used(man, &used, &used_visible);
+
 			mem_regions->mem_regions[mem_regions->num_mem_regions].mem_class =
 				DRM_XE_MEM_REGION_CLASS_VRAM;
 			mem_regions->mem_regions[mem_regions->num_mem_regions].instance =
@@ -292,16 +300,13 @@ static int query_mem_regions(struct xe_device *xe,
 				xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ?
 				SZ_64K : PAGE_SIZE;
 			mem_regions->mem_regions[mem_regions->num_mem_regions].total_size =
-				man->size;
-
-			xe_ttm_vram_get_used(man,
-					     &mem_regions->mem_regions
-					     [mem_regions->num_mem_regions].used,
-					     &mem_regions->mem_regions
-					     [mem_regions->num_mem_regions].cpu_visible_used);
+				total_size;
 
+			mem_regions->mem_regions[mem_regions->num_mem_regions].used = used;
+			mem_regions->mem_regions[mem_regions->num_mem_regions].cpu_visible_used =
+				used_visible;
 			mem_regions->mem_regions[mem_regions->num_mem_regions].cpu_visible_size =
-				xe_ttm_vram_get_cpu_visible_size(man);
+				visible_size;
 			mem_regions->num_mem_regions++;
 		}
 	}
diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
index c3a037e5f34e2..586d572a02729 100644
--- a/drivers/gpu/drm/xe/xe_res_cursor.h
+++ b/drivers/gpu/drm/xe/xe_res_cursor.h
@@ -57,8 +57,14 @@ struct xe_res_cursor {
 	struct scatterlist *sgl;
 	/** @dma_addr: Current element in a struct drm_pagemap_addr array */
 	const struct drm_pagemap_addr *dma_addr;
-	/** @mm: Buddy allocator for VRAM cursor */
-	struct gpu_buddy *mm;
+	/**
+	 * @part: VRAM partition @node was allocated from
+	 *
+	 * Needed to resolve a VRAM region relative offset and a size from a
+	 * buddy block, see xe_ttm_vram_mgr_block_offset(). Only valid for the
+	 * VRAM memory types.
+	 */
+	struct xe_ttm_vram_mgr_part *part;
 	/**
 	 * @dma_start: DMA start address for the current segment.
 	 * This may be different to @dma_addr.addr since elements in
@@ -69,14 +75,6 @@ struct xe_res_cursor {
 	u64 dma_seg_size;
 };
 
-static struct gpu_buddy *xe_res_get_buddy(struct ttm_resource *res)
-{
-	struct ttm_resource_manager *mgr;
-
-	mgr = ttm_manager_type(res->bo->bdev, res->mem_type);
-	return &to_xe_ttm_vram_mgr(mgr)->mm;
-}
-
 /**
  * xe_res_first - initialize a xe_res_cursor
  *
@@ -107,16 +105,18 @@ static inline void xe_res_first(struct ttm_resource *res,
 		cur->size = size;
 		cur->remaining = size;
 		cur->node = NULL;
-		cur->mm = NULL;
+		cur->part = NULL;
 		break;
 	}
 	case XE_PL_VRAM0:
 	case XE_PL_VRAM1: {
+		struct xe_ttm_vram_mgr_resource *vres =
+			to_xe_ttm_vram_mgr_resource(res);
+		struct xe_ttm_vram_mgr_part *part = vres->part;
 		struct gpu_buddy_block *block;
 		struct list_head *head, *next;
-		struct gpu_buddy *mm = xe_res_get_buddy(res);
 
-		head = &to_xe_ttm_vram_mgr_resource(res)->blocks;
+		head = &vres->blocks;
 
 		block = list_first_entry_or_null(head,
 						 struct gpu_buddy_block,
@@ -124,8 +124,8 @@ static inline void xe_res_first(struct ttm_resource *res,
 		if (!block)
 			goto fallback;
 
-		while (start >= gpu_buddy_block_size(mm, block)) {
-			start -= gpu_buddy_block_size(mm, block);
+		while (start >= xe_ttm_vram_mgr_block_size(part, block)) {
+			start -= xe_ttm_vram_mgr_block_size(part, block);
 
 			next = block->link.next;
 			if (next != head)
@@ -133,9 +133,9 @@ static inline void xe_res_first(struct ttm_resource *res,
 						   link);
 		}
 
-		cur->mm = mm;
-		cur->start = gpu_buddy_block_offset(block) + start;
-		cur->size = min(gpu_buddy_block_size(mm, block) - start,
+		cur->part = part;
+		cur->start = xe_ttm_vram_mgr_block_offset(part, block) + start;
+		cur->size = min(xe_ttm_vram_mgr_block_size(part, block) - start,
 				size);
 		cur->remaining = size;
 		cur->node = block;
@@ -152,6 +152,7 @@ static inline void xe_res_first(struct ttm_resource *res,
 	cur->size = size;
 	cur->remaining = size;
 	cur->node = NULL;
+	cur->part = NULL;
 	cur->mem_type = XE_PL_TT;
 	XE_WARN_ON(res && start + size > res->size);
 }
@@ -311,15 +312,15 @@ static inline void xe_res_next(struct xe_res_cursor *cur, u64 size)
 		block = list_entry(next, struct gpu_buddy_block, link);
 
 
-		while (start >= gpu_buddy_block_size(cur->mm, block)) {
-			start -= gpu_buddy_block_size(cur->mm, block);
+		while (start >= xe_ttm_vram_mgr_block_size(cur->part, block)) {
+			start -= xe_ttm_vram_mgr_block_size(cur->part, block);
 
 			next = block->link.next;
 			block = list_entry(next, struct gpu_buddy_block, link);
 		}
 
-		cur->start = gpu_buddy_block_offset(block) + start;
-		cur->size = min(gpu_buddy_block_size(cur->mm, block) - start,
+		cur->start = xe_ttm_vram_mgr_block_offset(cur->part, block) + start;
+		cur->size = min(xe_ttm_vram_mgr_block_size(cur->part, block) - start,
 				cur->remaining);
 		cur->node = block;
 		break;
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 1f6159e97d910..250466615bb5b 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -804,28 +804,22 @@ static u64 block_offset_to_pfn(struct drm_pagemap *dpagemap, u64 offset)
 	return PHYS_PFN(offset + xpagemap->hpa_base);
 }
 
-static struct gpu_buddy *vram_to_buddy(struct xe_vram_region *vram)
-{
-	return &vram->ttm.mm;
-}
-
 static int xe_svm_populate_devmem_pfn(struct drm_pagemap_devmem *devmem_allocation,
 				      unsigned long npages, unsigned long *pfn)
 {
 	struct xe_bo *bo = to_xe_bo(devmem_allocation);
 	struct ttm_resource *res = bo->ttm.resource;
-	struct list_head *blocks = &to_xe_ttm_vram_mgr_resource(res)->blocks;
-	struct xe_vram_region *vr = xe_map_resource_to_region(res);
-	struct gpu_buddy *buddy = vram_to_buddy(vr);
+	struct xe_ttm_vram_mgr_resource *vres = to_xe_ttm_vram_mgr_resource(res);
 	struct gpu_buddy_block *block;
 	int j = 0;
 
-	list_for_each_entry(block, blocks, link) {
+	list_for_each_entry(block, &vres->blocks, link) {
+		u64 offset = xe_ttm_vram_mgr_block_offset(vres->part, block);
 		u64 block_pfn = block_offset_to_pfn(devmem_allocation->dpagemap,
-						    gpu_buddy_block_offset(block));
+						    offset);
 		int i;
 
-		for (i = 0; i < gpu_buddy_block_size(buddy, block) >> PAGE_SHIFT; ++i)
+		for (i = 0; i < xe_ttm_vram_mgr_block_size(vres->part, block) >> PAGE_SHIFT; ++i)
 			pfn[j++] = block_pfn + i;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 226f732ee97be..83baeec2ef9b1 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -37,8 +37,9 @@ xe_ttm_vram_mgr_first_block(struct list_head *list)
 	return list_first_entry_or_null(list, struct gpu_buddy_block, link);
 }
 
-static inline bool xe_is_vram_mgr_blocks_contiguous(struct gpu_buddy *mm,
-						    struct list_head *head)
+static inline bool
+xe_is_vram_mgr_blocks_contiguous(struct xe_ttm_vram_mgr_part *part,
+				 struct list_head *head)
 {
 	struct gpu_buddy_block *block;
 	u64 start, size;
@@ -48,28 +49,94 @@ static inline bool xe_is_vram_mgr_blocks_contiguous(struct gpu_buddy *mm,
 		return false;
 
 	while (head != block->link.next) {
-		start = gpu_buddy_block_offset(block);
-		size = gpu_buddy_block_size(mm, block);
+		start = xe_ttm_vram_mgr_block_offset(part, block);
+		size = xe_ttm_vram_mgr_block_size(part, block);
 
 		block = list_entry(block->link.next, struct gpu_buddy_block,
 				   link);
-		if (start + size != gpu_buddy_block_offset(block))
+		if (start + size != xe_ttm_vram_mgr_block_offset(part, block))
 			return false;
 	}
 
 	return true;
 }
 
-static int xe_ttm_vram_buddy_alloc(struct xe_ttm_vram_mgr *mgr, u64 start,
+/*
+ * Find the partition able to satisfy the VRAM region relative range
+ * [@start, @end). @exact is set if the range covers the whole partition, in
+ * which case the caller can skip %GPU_BUDDY_RANGE_ALLOCATION as every block
+ * of the partition trivially satisfies the range.
+ *
+ * Partitions are a hard split, so a range straddling a partition boundary
+ * cannot be satisfied and NULL is returned.
+ */
+static struct xe_ttm_vram_mgr_part *
+xe_ttm_vram_mgr_select_part(struct xe_ttm_vram_mgr *mgr, u64 start, u64 end,
+			    bool *exact)
+{
+	unsigned int i;
+
+	for (i = 0; i < mgr->num_parts; ++i) {
+		struct xe_ttm_vram_mgr_part *part = &mgr->parts[i];
+
+		if (start == part->pool->offset &&
+		    end == part->pool->offset + part->pool->size) {
+			*exact = true;
+			return part;
+		}
+	}
+
+	for (i = 0; i < mgr->num_parts; ++i) {
+		struct xe_ttm_vram_mgr_part *part = &mgr->parts[i];
+
+		if (start >= part->pool->offset &&
+		    end <= part->pool->offset + part->pool->size) {
+			*exact = false;
+			return part;
+		}
+	}
+
+	return NULL;
+}
+
+/*
+ * Find the partition containing the VRAM region relative offset @addr, or
+ * NULL if @addr is outside the region.
+ */
+static struct xe_ttm_vram_mgr_part *
+xe_ttm_vram_mgr_addr_to_part(struct xe_ttm_vram_mgr *mgr, u64 addr)
+{
+	unsigned int i;
+
+	for (i = 0; i < mgr->num_parts; ++i) {
+		struct xe_ttm_vram_mgr_part *part = &mgr->parts[i];
+
+		if (addr >= part->pool->offset &&
+		    addr < part->pool->offset + part->pool->size)
+			return part;
+	}
+
+	return NULL;
+}
+
+/*
+ * Allocate the VRAM region relative range [@start, @end) from @part. The
+ * range must be contained within @part and is translated to the partition
+ * relative offsets tracked by its buddy allocator.
+ */
+static int xe_ttm_vram_buddy_alloc(struct xe_ttm_vram_mgr *mgr,
+				   struct xe_ttm_vram_mgr_part *part, u64 start,
 				   u64 end, u64 size, u64 min_page_size,
 				   struct list_head *blocks, unsigned long flags,
 				   struct ttm_resource *res, u64 *used_visible)
 {
-	struct gpu_buddy *mm = &mgr->mm;
 	struct gpu_buddy_block *block;
 	int err;
 
-	err = gpu_buddy_alloc_blocks(mm, start, end, size, min_page_size, blocks, flags);
+	err = gpu_buddy_alloc_blocks(&part->mm,
+				     start - part->pool->offset,
+				     end - part->pool->offset,
+				     size, min_page_size, blocks, flags);
 	if (err)
 		return err;
 
@@ -88,10 +155,11 @@ static int xe_ttm_vram_buddy_alloc(struct xe_ttm_vram_mgr *mgr, u64 start,
 		*used_visible = size;
 	} else {
 		list_for_each_entry(block, blocks, link) {
-			u64 blk_start = gpu_buddy_block_offset(block);
+			u64 blk_start = xe_ttm_vram_mgr_block_offset(part, block);
 
 			if (blk_start < mgr->visible_size) {
-				u64 blk_end = blk_start + gpu_buddy_block_size(mm, block);
+				u64 blk_end = blk_start +
+					xe_ttm_vram_mgr_block_size(part, block);
 
 				*used_visible += min(blk_end, mgr->visible_size) - blk_start;
 			}
@@ -99,6 +167,7 @@ static int xe_ttm_vram_buddy_alloc(struct xe_ttm_vram_mgr *mgr, u64 start,
 	}
 
 	mgr->visible_avail -= *used_visible;
+	part->used_visible += *used_visible;
 	return 0;
 }
 
@@ -109,17 +178,20 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 {
 	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
 	struct xe_ttm_vram_mgr_resource *vres;
-	struct gpu_buddy *mm = &mgr->mm;
+	struct xe_ttm_vram_mgr_part *part;
 	u64 size, min_page_size;
 	unsigned long lpfn;
+	bool exact;
 	int err;
 
 	lpfn = place->lpfn;
 	if (!lpfn || lpfn > man->size >> PAGE_SHIFT)
 		lpfn = man->size >> PAGE_SHIFT;
 
-	if (tbo->base.size >> PAGE_SHIFT > (lpfn - place->fpfn))
-		return -E2BIG; /* don't trigger eviction for the impossible */
+	/* don't trigger eviction for the impossible */
+	if (place->fpfn >= lpfn ||
+	    tbo->base.size >> PAGE_SHIFT > (lpfn - place->fpfn))
+		return -E2BIG;
 
 	vres = kzalloc_obj(*vres);
 	if (!vres)
@@ -135,13 +207,21 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 
 	INIT_LIST_HEAD(&vres->blocks);
 
+	part = xe_ttm_vram_mgr_select_part(mgr, (u64)place->fpfn << PAGE_SHIFT,
+					   (u64)lpfn << PAGE_SHIFT, &exact);
+	if (!part) {
+		err = -ENOSPC;
+		goto error_fini;
+	}
+	vres->part = part;
+
 	if (place->flags & TTM_PL_FLAG_TOPDOWN)
 		vres->flags |= GPU_BUDDY_TOPDOWN_ALLOCATION;
 
 	if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
 		vres->flags |= GPU_BUDDY_CONTIGUOUS_ALLOCATION;
 
-	if (place->fpfn || lpfn != man->size >> PAGE_SHIFT)
+	if (!exact)
 		vres->flags |= GPU_BUDDY_RANGE_ALLOCATION;
 
 	if (WARN_ON(!vres->base.size)) {
@@ -154,11 +234,20 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 	if (tbo->page_alignment)
 		min_page_size = (u64)tbo->page_alignment << PAGE_SHIFT;
 
-	if (WARN_ON(min_page_size < mm->chunk_size)) {
+	if (WARN_ON(min_page_size < part->mm.chunk_size)) {
 		err = -EINVAL;
 		goto error_fini;
 	}
 
+	/*
+	 * Buddy offsets are partition relative, so an allocation aligned within
+	 * the partition is only aligned in the region if the base is too.
+	 */
+	if (!IS_ALIGNED(part->pool->offset, min_page_size)) {
+		err = -ENOSPC;
+		goto error_fini;
+	}
+
 	if (WARN_ON(!IS_ALIGNED(size, min_page_size))) {
 		err = -EINVAL;
 		goto error_fini;
@@ -170,7 +259,7 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 		goto error_unlock;
 	}
 
-	err = xe_ttm_vram_buddy_alloc(mgr, (u64)place->fpfn << PAGE_SHIFT,
+	err = xe_ttm_vram_buddy_alloc(mgr, part, (u64)place->fpfn << PAGE_SHIFT,
 				      (u64)lpfn << PAGE_SHIFT, size,
 				      min_page_size, &vres->blocks, vres->flags,
 				      &vres->base, &vres->used_visible_size);
@@ -179,7 +268,7 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 	mutex_unlock(&mgr->lock);
 
 	if (!(vres->base.placement & TTM_PL_FLAG_CONTIGUOUS) &&
-	    xe_is_vram_mgr_blocks_contiguous(mm, &vres->blocks))
+	    xe_is_vram_mgr_blocks_contiguous(part, &vres->blocks))
 		vres->base.placement |= TTM_PL_FLAG_CONTIGUOUS;
 
 	/*
@@ -191,7 +280,8 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 								 typeof(*block),
 								 link);
 
-		vres->base.start = gpu_buddy_block_offset(block) >> PAGE_SHIFT;
+		vres->base.start =
+			xe_ttm_vram_mgr_block_offset(part, block) >> PAGE_SHIFT;
 	} else {
 		vres->base.start = XE_BO_INVALID_OFFSET;
 	}
@@ -208,6 +298,7 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 }
 
 static void xe_ttm_vram_buddy_free(struct xe_ttm_vram_mgr *mgr,
+				   struct xe_ttm_vram_mgr_part *part,
 				   struct list_head *blocks,
 				   u64 used_visible)
 {
@@ -215,8 +306,9 @@ static void xe_ttm_vram_buddy_free(struct xe_ttm_vram_mgr *mgr,
 
 	list_for_each_entry(block, blocks, link)
 		block->private = NULL;
-	gpu_buddy_free_list(&mgr->mm, blocks, 0);
+	gpu_buddy_free_list(&part->mm, blocks, 0);
 	mgr->visible_avail += used_visible;
+	part->used_visible -= used_visible;
 }
 
 /*
@@ -237,7 +329,8 @@ static void xe_ttm_vram_retry_queued_pages(struct xe_ttm_vram_mgr *mgr)
 	lockdep_assert_held(&mgr->lock);
 
 	list_for_each_entry_safe(pos, n, &mgr->queued_pages, queued_link) {
-		if (xe_ttm_vram_buddy_alloc(mgr, pos->addr, pos->addr + PAGE_SIZE,
+		if (xe_ttm_vram_buddy_alloc(mgr, pos->part, pos->addr,
+					    pos->addr + PAGE_SIZE,
 					    PAGE_SIZE, PAGE_SIZE, &pos->blocks,
 					    GPU_BUDDY_RANGE_ALLOCATION, NULL,
 					    &pos->used_visible_size)) {
@@ -259,7 +352,8 @@ static void xe_ttm_vram_mgr_del(struct ttm_resource_manager *man,
 	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
 
 	mutex_lock(&mgr->lock);
-	xe_ttm_vram_buddy_free(mgr, &vres->blocks, vres->used_visible_size);
+	xe_ttm_vram_buddy_free(mgr, vres->part, &vres->blocks,
+			       vres->used_visible_size);
 	if (unlikely(!list_empty(&mgr->queued_pages)))
 		xe_ttm_vram_retry_queued_pages(mgr);
 	mutex_unlock(&mgr->lock);
@@ -273,7 +367,7 @@ static void xe_ttm_vram_mgr_debug(struct ttm_resource_manager *man,
 				  struct drm_printer *printer)
 {
 	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
-	struct gpu_buddy *mm = &mgr->mm;
+	unsigned int i;
 
 	mutex_lock(&mgr->lock);
 	drm_printf(printer, "default_page_size: %lluKiB\n",
@@ -283,7 +377,15 @@ static void xe_ttm_vram_mgr_debug(struct ttm_resource_manager *man,
 	drm_printf(printer, "visible_size: %lluMiB\n",
 		   (u64)mgr->visible_size >> 20);
 
-	drm_buddy_print(mm, printer);
+	for (i = 0; i < mgr->num_parts; ++i) {
+		struct xe_ttm_vram_mgr_part *part = &mgr->parts[i];
+
+		drm_printf(printer, "partition %u: base %lluMiB size %lluMiB%s\n",
+			   i, part->pool->offset >> 20, part->pool->size >> 20,
+			   part->pool->purpose == XE_VRAM_POOL_KERNEL ?
+			   " (kernel only)" : "");
+		drm_buddy_print(&part->mm, printer);
+	}
 	mutex_unlock(&mgr->lock);
 	drm_printf(printer, "man size:%llu\n", man->size);
 }
@@ -296,8 +398,8 @@ static bool xe_ttm_vram_mgr_intersects(struct ttm_resource_manager *man,
 	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
 	struct xe_ttm_vram_mgr_resource *vres =
 		to_xe_ttm_vram_mgr_resource(res);
-	struct gpu_buddy *mm = &mgr->mm;
 	struct gpu_buddy_block *block;
+	unsigned long place_lpfn;
 
 	if (!place->fpfn && !place->lpfn)
 		return true;
@@ -305,13 +407,16 @@ static bool xe_ttm_vram_mgr_intersects(struct ttm_resource_manager *man,
 	if (!place->fpfn && place->lpfn == mgr->visible_size >> PAGE_SHIFT)
 		return vres->used_visible_size > 0;
 
+	/* A zero lpfn means no upper limit */
+	place_lpfn = place->lpfn ? place->lpfn : man->size >> PAGE_SHIFT;
+
 	list_for_each_entry(block, &vres->blocks, link) {
 		unsigned long fpfn =
-			gpu_buddy_block_offset(block) >> PAGE_SHIFT;
+			xe_ttm_vram_mgr_block_offset(vres->part, block) >> PAGE_SHIFT;
 		unsigned long lpfn = fpfn +
-			(gpu_buddy_block_size(mm, block) >> PAGE_SHIFT);
+			(xe_ttm_vram_mgr_block_size(vres->part, block) >> PAGE_SHIFT);
 
-		if (place->fpfn < lpfn && place->lpfn > fpfn)
+		if (place->fpfn < lpfn && place_lpfn > fpfn)
 			return true;
 	}
 
@@ -326,8 +431,8 @@ static bool xe_ttm_vram_mgr_compatible(struct ttm_resource_manager *man,
 	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
 	struct xe_ttm_vram_mgr_resource *vres =
 		to_xe_ttm_vram_mgr_resource(res);
-	struct gpu_buddy *mm = &mgr->mm;
 	struct gpu_buddy_block *block;
+	unsigned long place_lpfn;
 
 	if (!place->fpfn && !place->lpfn)
 		return true;
@@ -335,13 +440,16 @@ static bool xe_ttm_vram_mgr_compatible(struct ttm_resource_manager *man,
 	if (!place->fpfn && place->lpfn == mgr->visible_size >> PAGE_SHIFT)
 		return vres->used_visible_size == size;
 
+	/* A zero lpfn means no upper limit */
+	place_lpfn = place->lpfn ? place->lpfn : man->size >> PAGE_SHIFT;
+
 	list_for_each_entry(block, &vres->blocks, link) {
 		unsigned long fpfn =
-			gpu_buddy_block_offset(block) >> PAGE_SHIFT;
+			xe_ttm_vram_mgr_block_offset(vres->part, block) >> PAGE_SHIFT;
 		unsigned long lpfn = fpfn +
-			(gpu_buddy_block_size(mm, block) >> PAGE_SHIFT);
+			(xe_ttm_vram_mgr_block_size(vres->part, block) >> PAGE_SHIFT);
 
-		if (fpfn < place->fpfn || lpfn > place->lpfn)
+		if (fpfn < place->fpfn || lpfn > place_lpfn)
 			return false;
 	}
 
@@ -397,19 +505,33 @@ static void xe_ttm_vram_free_bad_pages(struct xe_ttm_vram_mgr *mgr)
 
 	list_for_each_entry_safe(pos, n, &mgr->offlined_pages, offlined_link) {
 		list_del(&pos->offlined_link);
-		xe_ttm_vram_buddy_free(mgr, &pos->blocks, pos->used_visible_size);
+		xe_ttm_vram_buddy_free(mgr, pos->part, &pos->blocks,
+				       pos->used_visible_size);
 		--mgr->n_offlined_pages;
 		kfree(pos);
 	}
 	list_for_each_entry_safe(pos, n, &mgr->queued_pages, queued_link) {
 		list_del(&pos->queued_link);
 		/* queued entries have no buddy reservation yet */
-		xe_ttm_vram_buddy_free(mgr, &pos->blocks, 0);
+		xe_ttm_vram_buddy_free(mgr, pos->part, &pos->blocks, 0);
 		--mgr->n_queued_pages;
 		kfree(pos);
 	}
 }
 
+/* Tear down every initialized partition and unpublish it from its pool */
+static void xe_ttm_vram_mgr_fini_parts(struct xe_ttm_vram_mgr *mgr)
+{
+	unsigned int i;
+
+	for (i = 0; i < mgr->num_parts; ++i) {
+		mgr->parts[i].pool->part = NULL;
+		gpu_buddy_fini(&mgr->parts[i].mm);
+	}
+
+	mgr->num_parts = 0;
+}
+
 static void xe_ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
 {
 	struct xe_device *xe = to_xe_device(dev);
@@ -425,40 +547,86 @@ static void xe_ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
 
 	WARN_ON_ONCE(mgr->visible_avail != mgr->visible_size);
 
-	gpu_buddy_fini(&mgr->mm);
+	xe_ttm_vram_mgr_fini_parts(mgr);
 
 	ttm_resource_manager_cleanup(&mgr->manager);
 
 	ttm_set_driver_manager(&xe->ttm, mgr->mem_type, NULL);
 }
 
-int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
-			   u32 mem_type, u64 size, u64 io_size,
-			   u64 default_page_size)
+/*
+ * Back every pool of the region with a buddy allocator of its own.
+ *
+ * Buddy offsets are partition relative, so a partition base has to be aligned
+ * to %XE_TTM_VRAM_MGR_PART_ALIGN, otherwise an aligned buddy allocation is not
+ * aligned in the region. Allocations needing a larger alignment are rejected
+ * by xe_ttm_vram_mgr_new() if the partition base does not honour it.
+ */
+static int xe_ttm_vram_mgr_init_parts(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
+				      struct xe_vram_region *vram)
 {
+	unsigned int i;
+	int err;
+
+	for (i = 0; i < vram->num_partitions; ++i) {
+		struct xe_ttm_vram_mgr_part *part = &mgr->parts[i];
+		struct xe_vram_pool *pool = &vram->partitions[i];
+
+		xe_assert(xe, IS_ALIGNED(pool->offset, XE_TTM_VRAM_MGR_PART_ALIGN));
+		xe_assert(xe, pool->offset + pool->size <= vram->usable_size);
+
+		err = gpu_buddy_init(&part->mm, pool->size, mgr->default_page_size);
+		if (err) {
+			xe_ttm_vram_mgr_fini_parts(mgr);
+			return err;
+		}
+
+		gpu_buddy_driver_set_lock(&part->mm, &mgr->lock);
+
+		part->pool = pool;
+		pool->part = part;
+		mgr->num_parts = i + 1;
+	}
+
+	return 0;
+}
+
+/**
+ * xe_ttm_vram_mgr_init - initialize TTM VRAM region
+ * @xe: pointer to Xe device
+ * @vram: pointer to xe_vram_region that contains the memory region attributes
+ *
+ * Initialize the Xe TTM manager of @vram, with one buddy allocator per pool
+ * of the region.
+ *
+ * Returns 0 for success, negative error code otherwise.
+ */
+int xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_vram_region *vram)
+{
+	struct xe_ttm_vram_mgr *mgr = &vram->ttm;
 	struct ttm_resource_manager *man = &mgr->manager;
+	u64 io_size = xe_vram_region_io_size(vram);
 	struct dmem_cgroup_region *cg;
-	const char *name;
 	int err;
 
 	man->func = &xe_ttm_vram_mgr_func;
-	mgr->mem_type = mem_type;
+	mgr->mem_type = vram->placement;
 	err = drmm_mutex_init(&xe->drm, &mgr->lock);
 	if (err)
 		return err;
 	INIT_LIST_HEAD(&mgr->offlined_pages);
 	INIT_LIST_HEAD(&mgr->queued_pages);
-	mgr->default_page_size = default_page_size;
+	mgr->default_page_size = PAGE_SIZE;
 	mgr->visible_size = io_size;
 	mgr->visible_avail = io_size;
 
-	ttm_resource_manager_init(man, &xe->ttm, size);
-	err = gpu_buddy_init(&mgr->mm, man->size, default_page_size);
+	ttm_resource_manager_init(man, &xe->ttm, xe_vram_region_usable_size(vram));
+
+	err = xe_ttm_vram_mgr_init_parts(xe, mgr, vram);
 	if (err)
 		return err;
 
-	gpu_buddy_driver_set_lock(&mgr->mm, &mgr->lock);
-	ttm_set_driver_manager(&xe->ttm, mem_type, &mgr->manager);
+	ttm_set_driver_manager(&xe->ttm, mgr->mem_type, man);
 
 	/*
 	 * Register the fini action before the cgroup region so that devres
@@ -469,10 +637,9 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 	if (err)
 		return err;
 
-	name = mem_type == XE_PL_VRAM0 ? "vram0" : "vram1";
-	cg = drmm_cgroup_register_region(&xe->drm, name,
+	cg = drmm_cgroup_register_region(&xe->drm, xe_mem_type_to_name[mgr->mem_type],
 					 &(struct dmem_cgroup_init){
-						.size = size,
+						.size = man->size,
 						.ops = &xe_ttm_vram_mgr_dmem_ops,
 						.reclaim_priv = man,
 					 });
@@ -485,23 +652,6 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 	return drmm_add_action_or_reset(&xe->drm, xe_ttm_vram_mgr_set_unused, man);
 }
 
-/**
- * xe_ttm_vram_mgr_init - initialize TTM VRAM region
- * @xe: pointer to Xe device
- * @vram: pointer to xe_vram_region that contains the memory region attributes
- *
- * Initialize the Xe TTM for given @vram region using the given parameters.
- *
- * Returns 0 for success, negative error code otherwise.
- */
-int xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_vram_region *vram)
-{
-	return __xe_ttm_vram_mgr_init(xe, &vram->ttm, vram->placement,
-				      xe_vram_region_usable_size(vram),
-				      xe_vram_region_io_size(vram),
-				      PAGE_SIZE);
-}
-
 int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
 			      struct ttm_resource *res,
 			      u64 offset, u64 length,
@@ -596,21 +746,64 @@ void xe_ttm_vram_mgr_free_sgt(struct device *dev, enum dma_data_direction dir,
 	kfree(sgt);
 }
 
-u64 xe_ttm_vram_get_cpu_visible_size(struct ttm_resource_manager *man)
+/**
+ * xe_ttm_vram_get_general_pool_sizes - Sizes of the general-purpose pools
+ * @man: The TTM resource manager of the VRAM region
+ * @size: total size of the general-purpose pools
+ * @cpu_visible_size: CPU-visible size of the general-purpose pools
+ *
+ * Report only VRAM available to userspace. The visible size is clipped to
+ * the manager's CPU-visible range, which starts at the region base.
+ */
+void xe_ttm_vram_get_general_pool_sizes(struct ttm_resource_manager *man,
+					u64 *size, u64 *cpu_visible_size)
 {
 	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
+	unsigned int i;
+
+	*size = 0;
+	*cpu_visible_size = 0;
+	for (i = 0; i < mgr->num_parts; ++i) {
+		struct xe_vram_pool *pool = mgr->parts[i].pool;
+		u64 end = pool->offset + pool->size;
 
-	return mgr->visible_size;
+		if (pool->purpose != XE_VRAM_POOL_GENERAL)
+			continue;
+
+		*size += pool->size;
+		if (pool->offset < mgr->visible_size)
+			*cpu_visible_size += min(end, mgr->visible_size) - pool->offset;
+	}
 }
 
-void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
-			  u64 *used, u64 *used_visible)
+/**
+ * xe_ttm_vram_get_general_pool_used - Usage of the general-purpose pools
+ * @man: The TTM resource manager of the VRAM region
+ * @used: bytes allocated from the general-purpose pools
+ * @used_visible: CPU-visible bytes allocated from the general-purpose pools
+ *
+ * Counterpart of xe_ttm_vram_get_general_pool_sizes(), memory allocated from
+ * pools serving another purpose, e.g. kernel-only, is not accounted.
+ */
+void xe_ttm_vram_get_general_pool_used(struct ttm_resource_manager *man,
+				       u64 *used, u64 *used_visible)
 {
 	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
+	unsigned int i;
+
+	*used = 0;
+	*used_visible = 0;
 
 	mutex_lock(&mgr->lock);
-	*used = mgr->mm.size - mgr->mm.avail;
-	*used_visible = mgr->visible_size - mgr->visible_avail;
+	for (i = 0; i < mgr->num_parts; ++i) {
+		struct xe_ttm_vram_mgr_part *part = &mgr->parts[i];
+
+		if (part->pool->purpose != XE_VRAM_POOL_GENERAL)
+			continue;
+
+		*used += part->mm.size - part->mm.avail;
+		*used_visible += part->used_visible;
+	}
 	mutex_unlock(&mgr->lock);
 }
 
@@ -625,9 +818,8 @@ u64 xe_ttm_vram_get_pool_avail(struct xe_vram_pool *pool)
 	struct xe_ttm_vram_mgr *mgr = &pool->region->ttm;
 	u64 avail;
 
-	/* A pool still spans the whole region of its manager */
 	mutex_lock(&mgr->lock);
-	avail = mgr->mm.avail;
+	avail = pool->part ? pool->part->mm.avail : 0;
 	mutex_unlock(&mgr->lock);
 
 	return avail;
@@ -790,9 +982,10 @@ static struct xe_bo *xe_ttm_vram_block_owner_get(struct xe_device *xe,
 }
 
 static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 addr,
-					    struct xe_ttm_vram_mgr *vram_mgr, struct gpu_buddy *mm)
+					    struct xe_ttm_vram_mgr *vram_mgr)
 {
 	struct xe_ttm_vram_offline_resource *nentry;
+	struct xe_ttm_vram_mgr_part *part;
 	struct xe_bo *pbo_to_put = NULL;
 	struct xe_bo *pbo = NULL;
 	struct gpu_buddy_block *block;
@@ -802,7 +995,11 @@ static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 addr,
 	scoped_guard(mutex, &vram_mgr->lock) {
 		if (xe_ttm_vram_page_already_processed(vram_mgr, addr))
 			return -EEXIST;
-		block = gpu_buddy_allocated_addr_to_block(mm, addr);
+		part = xe_ttm_vram_mgr_addr_to_part(vram_mgr, addr);
+		if (WARN_ON(!part))
+			return -ENXIO;
+		block = gpu_buddy_allocated_addr_to_block(&part->mm,
+							  addr - part->pool->offset);
 		if (WARN_ON(IS_ERR(block)))
 			return PTR_ERR(block);
 
@@ -812,6 +1009,7 @@ static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 addr,
 		INIT_LIST_HEAD(&nentry->blocks);
 		nentry->status = XE_PAGE_RESERVE_PENDING;
 		nentry->addr = addr;
+		nentry->part = part;
 
 		if (block) {
 			pbo = xe_ttm_vram_block_owner_get(xe, block);
@@ -836,7 +1034,8 @@ static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 addr,
 		} else {
 			/* Immediately offline unoccupied pages */
 			/* Queue free(to-be-reserved) pages */
-			ret = xe_ttm_vram_buddy_alloc(vram_mgr, addr, addr + size,
+			ret = xe_ttm_vram_buddy_alloc(vram_mgr, part, addr,
+						      addr + size,
 						      size, size, &nentry->blocks,
 						      GPU_BUDDY_RANGE_ALLOCATION,
 						      NULL, &nentry->used_visible_size);
@@ -938,7 +1137,6 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
 {
 	struct xe_ttm_vram_mgr *vram_mgr;
 	struct xe_vram_region *vr;
-	struct gpu_buddy *mm;
 
 	/* Assert that the address is PAGE_SIZE aligned */
 	if (WARN_ON_ONCE(!IS_ALIGNED(addr, PAGE_SIZE))) {
@@ -962,7 +1160,6 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
 		return -EIO;
 	}
 	vram_mgr = &vr->ttm;
-	mm = &vram_mgr->mm;
 
 	if (xe_ras_get_disable_vram_page_offline(xe)) {
 		xe_err(xe, "0x%llx is reported as corrupted address by HW\n",
@@ -971,7 +1168,7 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
 	}
 
 	/* Reserve page at address */
-	return xe_ttm_vram_reserve_page_at_addr(xe, addr - vr->dpa_base, vram_mgr, mm);
+	return xe_ttm_vram_reserve_page_at_addr(xe, addr - vr->dpa_base, vram_mgr);
 }
 EXPORT_SYMBOL(xe_ttm_vram_handle_addr_fault);
 
@@ -996,7 +1193,6 @@ int xe_ttm_vram_inject_fault(struct xe_device *xe)
 	struct xe_tile *tile = xe_device_get_root_tile(xe);
 	struct xe_vram_region *vr = tile->mem.vram->region;
 	struct xe_ttm_vram_mgr *vram_mgr = &vr->ttm;
-	struct gpu_buddy *mm = &vram_mgr->mm;
 	u64 addr;
 
 	/* Stay within the buddy-managed range; CCS/GSM/DSM sit beyond usable_size */
@@ -1005,13 +1201,19 @@ int xe_ttm_vram_inject_fault(struct xe_device *xe)
 
 	addr = ALIGN_DOWN(vr->usable_size - PAGE_SIZE, PAGE_SIZE);
 	while (addr < vr->usable_size) {
+		struct xe_ttm_vram_mgr_part *part;
 		struct gpu_buddy_block *block;
 		bool found = false;
 
 		scoped_guard(mutex, &vram_mgr->lock) {
-			block = gpu_buddy_allocated_addr_to_block(mm, addr);
-			if (!block)
-				found = true;
+			part = xe_ttm_vram_mgr_addr_to_part(vram_mgr, addr);
+			if (part) {
+				u64 offset = addr - part->pool->offset;
+
+				block = gpu_buddy_allocated_addr_to_block(&part->mm, offset);
+				if (!block)
+					found = true;
+			}
 		}
 
 		/*
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
index 6cf8217ec46b5..4c625a05c80d1 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
@@ -14,9 +14,6 @@ struct xe_device;
 struct xe_tile;
 struct xe_vram_region;
 
-int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
-			   u32 mem_type, u64 size, u64 io_size,
-			   u64 default_page_size);
 int xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_vram_region *vram);
 void xe_ttm_vram_debugfs_init(struct xe_device *xe, struct dentry *root);
 int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
@@ -29,9 +26,10 @@ void xe_ttm_vram_mgr_free_sgt(struct device *dev, enum dma_data_direction dir,
 			      struct sg_table *sgt);
 
 u64 xe_ttm_vram_get_pool_avail(struct xe_vram_pool *pool);
-u64 xe_ttm_vram_get_cpu_visible_size(struct ttm_resource_manager *man);
-void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
-			  u64 *used, u64 *used_visible);
+void xe_ttm_vram_get_general_pool_sizes(struct ttm_resource_manager *man,
+					u64 *size, u64 *cpu_visible_size);
+void xe_ttm_vram_get_general_pool_used(struct ttm_resource_manager *man,
+				       u64 *used, u64 *used_visible);
 int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr);
 int xe_ttm_vram_inject_fault(struct xe_device *xe);
 
@@ -47,4 +45,45 @@ to_xe_ttm_vram_mgr(struct ttm_resource_manager *man)
 	return container_of(man, struct xe_ttm_vram_mgr, manager);
 }
 
+/**
+ * xe_ttm_vram_mgr_block_offset() - VRAM region relative offset of a block
+ * @part: Partition @block was allocated from
+ * @block: The buddy block
+ *
+ * A VRAM region may be split across several buddy allocators, and the offset
+ * tracked by a partition's buddy allocator is relative to the start of that
+ * partition. A raw &gpu_buddy_block is therefore not enough on its own to
+ * locate the memory it describes, so the owning partition has to be supplied
+ * by the caller. Every block reachable outside this layer hangs off a
+ * &xe_ttm_vram_mgr_resource, so use its @part.
+ *
+ * Use this rather than gpu_buddy_block_offset() anywhere an offset within the
+ * VRAM region (i.e. a DPA relative to the region base) is needed.
+ *
+ * Return: Offset of @block relative to the start of the VRAM region.
+ */
+static inline u64
+xe_ttm_vram_mgr_block_offset(const struct xe_ttm_vram_mgr_part *part,
+			     const struct gpu_buddy_block *block)
+{
+	return part->pool->offset + gpu_buddy_block_offset(block);
+}
+
+/**
+ * xe_ttm_vram_mgr_block_size() - Size of a buddy block
+ * @part: Partition @block was allocated from
+ * @block: The buddy block
+ *
+ * Wrapper around gpu_buddy_block_size() taking the partition @block was
+ * allocated from, see xe_ttm_vram_mgr_block_offset().
+ *
+ * Return: Size of @block in bytes.
+ */
+static inline u64
+xe_ttm_vram_mgr_block_size(struct xe_ttm_vram_mgr_part *part,
+			   struct gpu_buddy_block *block)
+{
+	return gpu_buddy_block_size(&part->mm, block);
+}
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
index 1da3c82b28585..a287acafb4ebb 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
@@ -55,8 +55,6 @@ struct xe_ttm_vram_mgr_part {
 struct xe_ttm_vram_mgr {
 	/** @manager: Base TTM resource manager */
 	struct ttm_resource_manager manager;
-	/** @mm: DRM buddy allocator which manages the VRAM */
-	struct gpu_buddy mm;
 	/** @parts: Partitions this VRAM region is split into */
 	struct xe_ttm_vram_mgr_part parts[XE_TTM_VRAM_MGR_MAX_PARTS];
 	/** @num_parts: Number of initialized entries in @parts */
-- 
2.34.1

