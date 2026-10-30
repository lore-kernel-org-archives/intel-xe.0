Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052CF606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 06:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h0pK1TYY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0DF210E84E;
	Fri, 30 Oct 2026 06:35:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C138310E84E
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 06:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793342094; x=1824878094;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ngf5FMaio1280+70ykcbwXH+FV+pn9ahSfvtAYZf0B8=;
 b=h0pK1TYYgzYbV1Vdlftd3sk81sXpzlhOB19c2yzyckN+DWyd6l3TPEfT
 UkZx/ZF/etbOwCq/71wVFdDyjySxbGtA7fl3GyG0u/SYb+kRIahWiftMm
 Bbp7dyRUOPrBOULftbWISFz2ffKm1h4b1jUtTQLgDrncGPHwJh76r+we4
 Zh6y6R6ZQRPKE9fGsVR6c/U5oaSFSvbdVFnbYeMXkK1oXiW+8HeEVffVh
 uMYEQU5Oa1Ekj8WWGcyyuoZiyQ9VHBl61AM/8Y6awJxRbhfTwkG71ivTe
 380dyxlrG9I7Z6yBtUPZUGFeZxWd2rC1ALh9wa05168bbOD0osVOHG7fT A==;
X-CSE-ConnectionGUID: mQNw0WWZQveZAoEbqQwGfw==
X-CSE-MsgGUID: v/UakLLwSjOxjm/2Snaduw==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2091534"
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="2091534"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 23:34:54 -0700
X-CSE-ConnectionGUID: lKIgZpbeSwCp1eqYKWxAtg==
X-CSE-MsgGUID: K9jvkE0TTiWT0GSmUJTuZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="5489728"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 23:34:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 23:34:53 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 23:34:53 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.24) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 23:33:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z7YtnOAS9qrxp6/c97d7R230VGHzI3KSIUNKzAFANAGez/cFCm06zXHpqL2iVv56bCjsoTsApf69Ag8hjoKd0S+3wIsgTD+kbe1/H2ubxquu1g0tE+mf4xJDelG28p14YxvhBYgNLkz0OxoM6W1rnYDZ1MqIU5ZP11MUuW7/VRE3ax4zzvLop7Q55XJ4E2kC7XGlzPjC5GNA4KhXR+OgTWbPG3OfY01dPXsLYtj5qZKA/AeKBHVak7xM792fTTAsVuIqO1WyaL47XdBudEdGPqJ4ZRcvK1CTwJI5zA2e+G5VcXRJAa9yWCITbmZPfW8p+kh2gqJUjw+/mQxlgJ+SLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xRyu+bZf6XwiKYMdnjfTqqCtf+IgIAomXko6xp7eFEM=;
 b=xPMsZjsFMJ98EyAlQmBvqtT5XhhrpFdbIAmVYlmbwMDIPEvZjyjPpbYuTci10gx9ZTQnAaV1n7WQtUi8lzjGztdsWZq08SscwOAQit8NrHnkEC4Q6P3+InxdaUH0U94NOPf55coMufiiCHMQq797P0FKSMwr3fywjnq9uFD5HDULAREDp48AupC45Xq0bLmuV+I9zgUl1CDv0o1KEy6qZNGy3Ul9EFeFBXP5wBLCC3VVOZQKzYSjM+hHorDoJm0R2Zqs5y7abskZDqffxnuhgrAi79MLRhIUOWb5DJxNYN4mBZBRM7DjUntCo15thpCrrTcWDlNjwR81j2vXR9pCGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB087165.namprd11.prod.outlook.com (2603:10b6:8:4c4::7)
 by CY8PR11MB7010.namprd11.prod.outlook.com (2603:10b6:930:56::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Fri, 30 Oct
 2026 06:33:52 +0000
Received: from DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f]) by DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f%5]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 06:33:51 +0000
Message-ID: <bf50cc04-739d-40d3-8412-5c268a2da34b@intel.com>
Date: Fri, 30 Oct 2026 12:03:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/9] drm/xe/hwmon: Enable fan curve control support
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>
References: <20261015190751.1268916-1-karthik.poosa@intel.com>
 <20261015190751.1268916-7-karthik.poosa@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20261015190751.1268916-7-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0187.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::12) To DS6PR11MB087165.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB087165:EE_|CY8PR11MB7010:EE_
X-MS-Office365-Filtering-Correlation-Id: f2c7546b-70ed-4137-a4bf-08df364fc317
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|10067099003|261026135527099003|261021130227099003|261021135927099003|261026140227099003|261026130827099003|261021133027099003|261022105027099003|56012099006|11063799006|4143699003|261022113327099003|261009223027099003|261022075727099003|261022115727099003|261021121427099003|261021123027099003|261028144727099003|6133799003|261026121527099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: DcA97XYn/rAdIZLVsYCTDh0Oc088Rmok62lOWHRZT5FP8BsnsZGAY6Dy+PhtyLaW3LotwCMLHzzPshm15aDqE+Cu+FHstr7WPyoIT5PFXz2oK+VEOdZtvfMnuedaZivjuWLUlDzOs1vDiw28nNMcX1Ks1K/bZ4vumHYbS8Zglf/s95Fqb3SsQfst68QOMZbtybWbfeNK/oa3fd7dEjRS7zX7w5fBoucJRikGT8iN22QO1uIgXkyN5C4FaFP2kIOKvm+Rf/gDdWIdBws9QJUW6FOVHVoRkBM8vo4CqTBht4QGzpnWDhdx1bQn8FFPPLKKShsecItiUwUVAvuFCM86P5dVVFo/q9ly/rSP9XmJR1DOjac/sPgnhpdKa8t2NhtC6lxb3k+TRmxjX3hlEsvddDLK+p2uoG3ZQ827lSd6l8NEt3Xtca6U5Lp6hjlJacneKxW/ATop1eYWnCUNwwGR3Dg+iGWvXMcC9KA1dJBmoi44xL/MiDflPzPFu0FEI0KrKroEyGlSH3AcXM4MQXEpDrMQYGJVejTAyjyYIXMm80ocHyvsAIPYFiYJ7UDW6GrANP8tXlq+U9ONxoxBFfHATKEbyn3vS7zhQqexgFkvcXslv2UQEBWj7McDy9b1JQK2yVEFM4AfhlGS9FlcWrep/wJkyTKKAkRrZ5RjfSBGbL4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS6PR11MB087165.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(261026135527099003)(261021130227099003)(261021135927099003)(261026140227099003)(261026130827099003)(261021133027099003)(261022105027099003)(56012099006)(11063799006)(4143699003)(261022113327099003)(261009223027099003)(261022075727099003)(261022115727099003)(261021121427099003)(261021123027099003)(261028144727099003)(6133799003)(261026121527099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0ZKYWVrNmpOWTlFK2hiUm1PTjg0dXlIWFRKR1dqWmI4RXBCTUpGZkZlWE5j?=
 =?utf-8?B?b1psSDlnOW0vOVZMNTc4NkRXVEZhdTdZSEZ3UXJoVjJxNHJKQlVseEZsK3gy?=
 =?utf-8?B?cGRjTWdvSXdQZGJuYTg2TVJyZlZTSjd1OTFnVlNpK1dYODZGV3Z0eWJ3TW1R?=
 =?utf-8?B?VGRkRHRpQjF6aGYyUFZxM3kzaDlEc3VGb1BjQmN2VzdFL0NhWGxKNXdqRTVP?=
 =?utf-8?B?M2JGUjA4Q0JGelZXajhyTmxnL0I0S2YvclpvbGF2b29HSHlvaEZXcDBMWS8y?=
 =?utf-8?B?eSsybjd0WDFacFVGKzFyRmUxYTV3STV3RUVsUDFjY01MdGNlWStiVXphakFM?=
 =?utf-8?B?bjZnRmMyU2M4cVU2NmU2N3dIZTlWRlprTXVFYW5BdlhIcE9iNXJ3YXVFMHcz?=
 =?utf-8?B?cWYvbGVTRWpoTlphMlhyU2xBUHNQSFB3U3BqdFM3YVpKV3d1TTNRTWNFRFpr?=
 =?utf-8?B?U09xQlhQMEwxUEF2VUI5K2ZUdlZ5YWhteHBBQjVTQk1ycUNwcWNaM2ZTSFdX?=
 =?utf-8?B?TFBlR2w0SlJDMlRoYmduYnpmNWZjSmJyaEp2VXJNcHV2VytzRklhZklRYTVl?=
 =?utf-8?B?ZVhqVHJ5VkE3YmY4SVcxSXAwSTJGQ2tKQ3hXM3ZxQjAyTURTNTJjaWRITGxk?=
 =?utf-8?B?dThzV1ArRkdROU5NT0Z4YWlnbFZCQjNGcTFVdzZyVllJV1VnT0FKNkMzUUM5?=
 =?utf-8?B?WWhNVkNmYVBLaXNHOFhyOU1TUSs0RlhMMjBkUVRtZHRxUGxpYll6MTZIaTZ2?=
 =?utf-8?B?NlY0VkFlREhYWGUvK3JNZmIwSllweEtqeHdqdEt5ejZPa0dUdGxrYmJzTktO?=
 =?utf-8?B?UWlEaGVQZm1RMTZYWW4wTVN1RVpTRXBBdFhYOExkdk5uNG13cU12UXhSNGRP?=
 =?utf-8?B?TE8xcHEvOUVVcVFINmRndy9JbC9lVXhFdk1GWktSUHA2M1Z3Wjl1WURGWmZs?=
 =?utf-8?B?K3B3VUd2T3RRbE0yTFhRVDR2bHZrbXBURENvekRySzdITmhUdit0SGVJemhQ?=
 =?utf-8?B?Z0ZONkJBamRUWDFESERXRVMxK3FJZDhzSHh3QnRPcEw2NUQ0allYKzhVNlpV?=
 =?utf-8?B?Z0FkUTFZYTJ4RCt2VERhOXZzbFV5RVpHa1ZWVFo1d2lJeFdhMU1aNVVramdz?=
 =?utf-8?B?UDFQMlJ0NXBrbUMyUFpWMHlCYTZnS3lOUVVQdzVHMk1FRGVLdUxzblVLTkNW?=
 =?utf-8?B?TnIwQ1BsaExqMThxWkRDN1VmbGErb0Zmemx1VXRyV09xd0d0ZEVqR2tkR3Jo?=
 =?utf-8?B?Z2Q3STQwMk5Qb1NwMXEwQlIrbjZjRDZ5WDdmR1VkOU8zTjR4QmErUnV0ZmVI?=
 =?utf-8?B?NUhxOW02VXF6ZDZhZ01DcmJSSlYrVkFCMTVwTjZ6Q2VISXVORlJ1ZXg2YzFC?=
 =?utf-8?B?YVRGNURMcWNyMkorWXhDSWw3eVYzQzc0OEdYZEtvSlJjOTJmVDlZaERmTXdV?=
 =?utf-8?B?bnhpVWZIa3V0U0lkU0lNVTFjZkZXK0JiZENTalQrZGFCTk5ZNWFwVlhseTlO?=
 =?utf-8?B?Z1N2NHhsOUNhRkxrRHVHb0xaVDkyb3RzQi9hRVNlbXhsaHFBUGxYZnpDZDJN?=
 =?utf-8?B?LzdFcVhia1Y4cmpEQ2d2S1Q0Y3JNOGI4aXYvd3M1NXdMODVURmppWGN2dHJX?=
 =?utf-8?B?R2hGYjZ5NDVwRVVxU0ZtUXJpa3pkME5UaHdiN3NnVEJjWXJSVDlKakpkQURY?=
 =?utf-8?B?NnRyYzEwR2JrSDBpMFJTT29jNFoxY2ZFdTd6QThEUXAyN0Rrd0ZqeUpBNkdt?=
 =?utf-8?B?cTdPRFUyQ3Y4V1ZuVURQNGJpdUMrTHBFYmN3QytZTmtSMXhOVGFtTmdpaDhO?=
 =?utf-8?B?cUh1eSsyMzJIbXdsS1k1Kzl0ckoyb0VndVFJR0h4ck1PQXlKT2QzcHdLcUN6?=
 =?utf-8?B?cG1ycGZNRFBrQS8yZVpHOXpFMktFTng2V2E5VSsycWt5K3U5YXZUbUJFU1Av?=
 =?utf-8?B?Vm03TG82VjMrQWR0aGZKL3hKYVI1a3U4OGZmVm5SV1J2RmtlOGtkWTFmZlps?=
 =?utf-8?B?ZUc2TGNydHpRbm1FRHNPSERXV1JETXVneG43cDVQaVBUWlliNGVuay9aajVT?=
 =?utf-8?B?cTNRL2luSndRMDVBVlpyWWhGMnpIQVduVE0wZkZpdmhtQ3JKMEFkWHc4OU1X?=
 =?utf-8?B?bWMzWUwwSllWQWI0RUFBRm9GeE5jL0JneURMR3hUOTM0cjA3RHU1MWVsNjNX?=
 =?utf-8?B?djVIMXBlTXZrSVZSbTlrTFlZNVZBUUtUTTFNZHg4NVU1cUhrUDVNdTd1UmlV?=
 =?utf-8?B?VG9xL1N0YVhKckE4bnJZVzJnSFdoME5lb3RjWWxaby92dm1QNG9Qa0s5aWt6?=
 =?utf-8?B?Q2p4M0o4S0gwVjlZelJxcFJQT1FPeVpoeUl0SjNZT2NadjdybDlkUWZSNTlX?=
 =?utf-8?Q?NyCOxAE03sDTQvq4=3D?=
X-Exchange-RoutingPolicyChecked: ZxLq/3HkY2q8CWF5bsCWCwAqt8SeXnlgvE/Kui5LVh6r6q5Y5eDw0eT+mrIYLXlxobQEWNjF212a4EqUa9dyomXgf1+tw2rwKKtmm+J4ZYD5gYxaJ/XqskOvAIJDVf3YW/yT6vbZW1UY0iueuWAnKzOsTbCXgln9GvPO7ZUX8mlYTj+cGS7Bpncyu+PzO0kQiS9RogT/4iok2N8PygznjX8Le9AoRqco0tGd3/kALbOidtT2m5F+gH7ql9CoKG+MXm/h6Q3iHEHLQzwkqdLvdvUdHplqXx4ifSAxkIEIvdsQt/0GLHihv0u7eUVlZddWnxbsy1Fgd9/A3Z6teOF6oA==
X-MS-Exchange-CrossTenant-Network-Message-Id: f2c7546b-70ed-4137-a4bf-08df364fc317
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB087165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 06:33:51.6694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HnydhNxhpCuFqsh7jmH1jWdodxR/tph8YrLNgbyR2tndOMTGdBZHjXIUZtDmvhVMrENZtV3t+vWsd2btkSvdjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7010
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
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Karthik,

On 16-10-2026 00:37, Karthik Poosa wrote:
> Expose curve-point temperature and pwm controls via
> pwmF_auto_point[P]_temp and pwmF_auto_point[P]_pwm, where
> F is the fan number and P is the fan curve point number.
> Each fan curve point has temperature and pwm sysfs.
>
> Update Xe hwmon ABI documentation for pwm auto point temperature
> attributes.
>
> v2:
> - Use xe helpers for dmesg logs.
> - Update kernel version in Xe hwmon documentation.
> - Correct debug level of some dmesg logs.
>
> v3:
>   - Allow variable fan curve points from >=2 to MAX_FAN_CONTROL_POINTS.
>   - Expose all MAX_FAN_CONTROL_POINTS fan-curve slots so users can extend
>     a short fan table.
>   - Stage temp/PWM pairs without changing the active curve. Commit at a
>     (0, 0) end marker or after all MAX_FAN_CONTROL_POINTS pairs.
>   - Write the points together, verify the firmware count, then update the
>     active cache.
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Assisted-by: LLM
> ---
>   drivers/gpu/drm/xe/xe_hwmon.c | 693 +++++++++++++++++++++++++++++++++-
>   1 file changed, 692 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index c3d5c682768d..de2adb56d15b 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -193,6 +193,12 @@ struct xe_hwmon_fan_info {
>   			/** @speed: fan speed in percentage */
>   			u8 speed;
>   		} fcp[MAX_FAN_CONTROL_POINTS];
> +		/** @staged_fcp: curve supplied via sysfs but not yet committed */
> +		struct fan_control_point staged_fcp[MAX_FAN_CONTROL_POINTS];
> +		/** @temp_staged: bitmask of temperature fields supplied via sysfs */
> +		u16 temp_staged;
> +		/** @speed_staged: bitmask of PWM fields supplied via sysfs */
Either "PWM" or "speed" should be used consistently throughout the series.
IMHO "PWM" and "speed in terms of percentage" are not same so there 
should be a clear distinction and same should be applicable for entire 
series.
> +		u16 speed_staged;
>   	} fan_table[FAN_TABLE_MAX];
>   	/** @max_rps: maximum fan RPS */
>   	u32 max_rps;
> @@ -899,8 +905,11 @@ static const struct attribute_group hwmon_attrgroup = {
>   	.is_visible = xe_hwmon_attributes_visible,
>   };
>   
> +static const struct attribute_group hwmon_curve_attrgroup;
> +
>   static const struct attribute_group *hwmon_groups[] = {
>   	&hwmon_attrgroup,
> +	&hwmon_curve_attrgroup,
>   	NULL
>   };
>   
> @@ -1200,6 +1209,74 @@ static int xe_hwmon_get_fan_point_count(struct xe_hwmon *hwmon, u8 fan, u32 *poi
>   	return 0;
>   }
>   
> +static int xe_hwmon_commit_user_fan_table(struct xe_hwmon *hwmon, u8 fan,
> +					  const struct fan_control_point *points, u32 point_count)
> +{
> +	/* The extra write is for the final write that sets the number of fan control points */
> +	struct xe_pcode_write writes[MAX_FAN_CONTROL_POINTS + 1];
> +	u32 accepted_count = 0;
> +	int point;
u32 ?
> +	int ret;
> +
> +	if (!point_count) {
> +		xe_err(hwmon->xe, "no fan control points provided for fan %d\n", fan);
> +		return -ENODATA;
> +	}
> +
> +	for (point = 0; point < point_count; point++) {
point is int but point_count is  u32.
> +		u8 temp = points[point].temp;
> +		u8 speed = points[point].speed;
> +
> +		/* Ensure fan control points are strictly increasing order */
> +		if (point > 0) {
> +			u8 prev_temp = points[point - 1].temp;
> +			u8 prev_speed = points[point - 1].speed;
> +
> +			if (temp < prev_temp || speed < prev_speed) {
This only rejects a point that is smaller than the previous one. But the 
comment says "fan control points are strictly increasing order".
> +				xe_dbg(hwmon->xe,
> +				       "fan %d invalid point prev > current %d: %u/%u prev=%u/%u\n",
> +					fan, point, temp, speed, prev_temp, prev_speed);
> +				return -EINVAL;
> +			}
> +		}
> +
> +		/* Prepare the write for this fan control point */
> +		writes[point].mbox = PCODE_MBOX(FAN_SPEED_CONTROL, FSC_WRITE_FAN_TABLE,
> +						fan);
> +		writes[point].data = FIELD_PREP(FAN_CONTROL_POINT_TEMP_MASK, temp) |
> +				FIELD_PREP(FAN_CONTROL_POINT_SPEED_MASK, speed);
> +	}
> +
> +	xe_dbg(hwmon->xe, "committing fan %d user table with %d points\n", fan, point_count);
> +
> +	writes[point_count].mbox = PCODE_MBOX(FAN_SPEED_CONTROL, FSC_WRITE_NUM_FAN_CONTROL_POINTS,
> +					      fan);
> +	writes[point_count].data = point_count;
> +
> +	ret = xe_pcode_write_batch(xe_device_get_root_tile(hwmon->xe), writes, point_count + 1);
> +	if (ret) {
> +		xe_dbg(hwmon->xe,
> +		       "failed to write fan %d user table count to %d, ret=%d\n", fan, point_count,
> +		       ret);
> +		return ret;
> +	}
> +
> +	/* Verify if the user fan table was accepted correctly */
> +	ret = xe_hwmon_get_fan_point_count(hwmon, fan, &accepted_count, USER_FAN_TABLE);
> +	if (ret)
> +		return ret;
> +
> +	if (accepted_count != point_count) {
> +		xe_err(hwmon->xe, "fan %d table count mismatch after commit, expected %u, got %u\n",
> +		       fan, point_count, accepted_count);
> +		return -EIO;
> +	}
> +
> +	xe_dbg(hwmon->xe, "fan %d user table committed successfully with %d points\n", fan,
> +	       point_count);
> +	return 0;
> +}
> +
>   static int xe_hwmon_activate_user_fan_table(struct xe_hwmon *hwmon, u8 fan,
>   					    bool is_full_speed, enum fan_table_type table_source)
>   {
> @@ -1264,6 +1341,8 @@ static int xe_hwmon_activate_user_fan_table(struct xe_hwmon *hwmon, u8 fan,
>   	}
>   
>   	fi->fan_table[USER_FAN_TABLE].point_count = point_count;
> +	fi->fan_table[USER_FAN_TABLE].temp_staged = 0;
> +	fi->fan_table[USER_FAN_TABLE].speed_staged = 0;
>   	fi->pwm_enable_mode = XE_FAN_PWM_MANUAL_USER_TABLE;
>   	fi->is_full_speed = is_full_speed;
>   
> @@ -1328,12 +1407,622 @@ static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 pwm, boo
>   			  fi->fan_table[USER_FAN_TABLE].fcp[i].speed);
>   	}
>   	fi->fan_table[USER_FAN_TABLE].point_count = MIN_FAN_CONTROL_POINTS;
> +	fi->fan_table[USER_FAN_TABLE].temp_staged = 0;
> +	fi->fan_table[USER_FAN_TABLE].speed_staged = 0;
>   
>   	fi->pwm_enable_mode = XE_FAN_PWM_MANUAL_USER_TABLE;
>   	fi->is_full_speed = full_speed;
>   	return 0;
>   }
>   
> +#define XE_CURVE_IDX(fan, point)	(((fan) << 8) | (point))
> +#define XE_CURVE_FAN(idx)		((u8)(((idx) >> 8) & 0xff))
> +#define XE_CURVE_POINT(idx)		((u8)((idx) & 0xff))
> +
> +static int
> +xe_hwmon_decode_curve_index(u32 index, u8 *fan, u8 *point)
> +{
> +	u8 local_fan = XE_CURVE_FAN(index);
> +	u8 local_point = XE_CURVE_POINT(index);
> +
> +	if (local_fan >= FAN_MAX || local_point >= MAX_FAN_CONTROL_POINTS)
Add a xe_dbg/xe_warn before these -EINVAL returns for clarity.
> +		return -EINVAL;
> +
> +	*fan = local_fan;
> +	*point = local_point;
> +
> +	return 0;
> +}
> +
> +static inline enum fan_table_type xe_hwmon_get_active_fan_table(struct xe_hwmon *hwmon, u8 fan)
Drop inline.
> +{
> +	if (hwmon->fi[fan].pwm_enable_mode == XE_FAN_PWM_AUTO_STOCK_TABLE)
> +		return STOCK_FAN_TABLE;
> +	else
> +		return USER_FAN_TABLE;
> +}
> +
> +static ssize_t
> +xe_hwmon_pwm_auto_point_temp_show(struct device *dev,
> +				  struct device_attribute *attr, char *buf)
> +{
> +	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
> +	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
> +	struct xe_hwmon_fan_info *fi;
> +	u32 point_count;
> +	u8 fan;
> +	u8 point;
> +	u8 temp;
> +	int ret;
> +	enum fan_table_type active_table;
Inverted xmas tree.
> +
> +	ret = xe_hwmon_decode_curve_index(sattr->index, &fan, &point);
> +	if (ret)
> +		return ret;
> +
> +	guard(xe_pm_runtime)(hwmon->xe);
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	fi = &hwmon->fi[fan];
> +	active_table = xe_hwmon_get_active_fan_table(hwmon, fan);
> +
> +	ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, active_table);
> +	if (ret)
> +		goto unlock;
> +
> +	/* Slots beyond the active curve can still be staged for the next curve. */
> +	if (point >= point_count &&
> +	    (active_table != USER_FAN_TABLE ||
> +	    !(fi->fan_table[USER_FAN_TABLE].temp_staged & BIT(point))))
> +		temp = 0;
> +	else if (point >= point_count)
> +		temp = fi->fan_table[USER_FAN_TABLE].staged_fcp[point].temp;
> +	else
> +		temp = fi->fan_table[active_table].fcp[point].temp;
> +	ret = sysfs_emit(buf, "%u\n", temp * MILLIDEGREE_PER_DEGREE);
> +
> +unlock:
> +	mutex_unlock(&hwmon->hwmon_lock);
> +
> +	return ret;
> +}
> +
> +static int xe_hwmon_update_user_fan_point(struct xe_hwmon *hwmon, u8 fan, u32 point,
> +					  bool is_temp, u8 value)
> +{
> +	struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
> +	struct fan_table *table;
> +	u32 point_count;
> +	int ret;
> +
> +	table = &fi->fan_table[USER_FAN_TABLE];
> +
> +	if (is_temp) {
> +		table->staged_fcp[point].temp = value;
> +		table->temp_staged |= BIT(point);
> +	} else {
> +		table->staged_fcp[point].speed = value;
> +		table->speed_staged |= BIT(point);
> +	}
> +
> +	/* Wait for a complete prefix; (0, 0) ends the curve without becoming a point. */
> +	for (point_count = 0; point_count < MAX_FAN_CONTROL_POINTS; point_count++) {
> +		if (!(table->temp_staged & BIT(point_count)) ||
> +		    !(table->speed_staged & BIT(point_count)))
> +			return 0;
> +		if (!table->staged_fcp[point_count].temp &&
> +		    !table->staged_fcp[point_count].speed)
> +			break;
> +	}
> +
> +	if (point_count < MIN_FAN_CONTROL_POINTS)
Add a xe_dbg/xe_warn before these -EINVAL returns for clarity.
> +		return -EINVAL;
> +
> +	ret = xe_hwmon_commit_user_fan_table(hwmon, fan, table->staged_fcp, point_count);
> +	if (ret)
> +		return ret;
> +
> +	/* Publish the new curve only after firmware accepts its point count. */
> +	memcpy(table->fcp, table->staged_fcp, point_count * sizeof(table->fcp[0]));
> +	table->point_count = point_count;
> +	table->temp_staged = 0;
> +	table->speed_staged = 0;
> +	fi->pwm_enable_mode = XE_FAN_PWM_MANUAL_USER_TABLE;
> +	fi->is_full_speed = false;
> +	return 0;
> +}
> +
> +static int xe_hwmon_get_u8_from_sysfs(long val, bool is_temp, u8 *out)
Could "get" be dropped from the name, e.g. xe_hwmon_sysfs_to_hw_val()?
> +{
> +	long hw_val;
> +
> +	if (is_temp)
> +		hw_val = DIV_ROUND_CLOSEST(val, MILLIDEGREE_PER_DEGREE);
> +	else
> +		hw_val = DIV_ROUND_CLOSEST(val * 100, U8_MAX);
> +
> +	if (hw_val < 0 || hw_val > U8_MAX)
Add a xe_dbg before these -EINVAL returns for clarity.
> +		return -EINVAL;
> +
> +	*out = hw_val;
> +
> +	return 0;
> +}
> +
> +static ssize_t
> +xe_hwmon_pwm_auto_point_temp_store(struct device *dev,
> +				   struct device_attribute *attr,
> +				   const char *buf, size_t count)
> +{
> +	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
> +	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
> +	struct xe_hwmon_fan_info *fi;
> +	u8 fan;
> +	u8 point;
> +	u8 temp;
> +	long val;
> +	int ret;
> +
> +	ret = xe_hwmon_decode_curve_index(sattr->index, &fan, &point);
> +	if (ret)
> +		return ret;
> +
> +	ret = kstrtol(buf, 10, &val);
> +	if (ret)
> +		return ret;
> +
> +	ret = xe_hwmon_get_u8_from_sysfs(val, true, &temp);
> +	if (ret)
> +		return ret;
> +
> +	guard(xe_pm_runtime)(hwmon->xe);
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +	fi = &hwmon->fi[fan];
> +
> +	if (fi->pwm_enable_mode != XE_FAN_PWM_MANUAL_USER_TABLE) {
> +		drm_err(&hwmon->xe->drm,
> +			"pwm%d_enable not in manual mode; cannot update temp point %d\n",
> +			fan, point);
> +		ret = -EINVAL;
> +		goto unlock;
> +	}
> +
> +	drm_dbg(&hwmon->xe->drm,
> +		"staging fan %d point %d temp to %u\n", fan, point, temp);
> +	ret = xe_hwmon_update_user_fan_point(hwmon, fan, point, true, temp);
> +
> +unlock:
> +	mutex_unlock(&hwmon->hwmon_lock);
> +
> +	return ret ? ret : count;
> +}
> +
> +static ssize_t
> +xe_hwmon_pwm_auto_point_pwm_show(struct device *dev,
> +				 struct device_attribute *attr,
> +				 char *buf)
> +{
> +	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
> +	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
> +	struct xe_hwmon_fan_info *fi;
> +	u8 fan;
> +	u8 point;
> +	u32 point_count;
> +	int ret;
> +	enum fan_table_type active_table;
> +
> +	ret = xe_hwmon_decode_curve_index(sattr->index, &fan, &point);
> +	if (ret)
> +		return ret;
> +
> +	guard(xe_pm_runtime)(hwmon->xe);
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	fi = &hwmon->fi[fan];
> +	active_table = xe_hwmon_get_active_fan_table(hwmon, fan);
> +
> +	ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, active_table);
> +	if (ret)
> +		goto unlock;
> +
> +	if (point >= point_count &&
> +	    (active_table != USER_FAN_TABLE ||
> +	    !(fi->fan_table[USER_FAN_TABLE].speed_staged & BIT(point))))
> +		ret = sysfs_emit(buf, "0\n");
> +	else
> +		ret = sysfs_emit(buf, "%u\n",
> +				 DIV_ROUND_CLOSEST((point >= point_count ?
> +						    fi->fan_table[USER_FAN_TABLE].staged_fcp[point].speed :
> +						    fi->fan_table[active_table].fcp[point].speed) * U8_MAX,
> +						    100));
Could the value selection be split into if/else if/else like the temp 
sibling, instead of the nested ternary?
> +
> +unlock:
> +	mutex_unlock(&hwmon->hwmon_lock);
> +
> +	return ret;
> +}
> +
> +static ssize_t
> +xe_hwmon_pwm_auto_point_pwm_store(struct device *dev,
> +				  struct device_attribute *attr,
> +				  const char *buf, size_t count)
> +{
> +	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
> +	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
> +	struct xe_hwmon_fan_info *fi;
> +	long val;
> +	u8 point;
> +	u8 fan;
> +	u8 pwm;
> +	int ret;
> +
> +	ret = xe_hwmon_decode_curve_index(sattr->index, &fan, &point);
> +	if (ret)
> +		return ret;
> +
> +	ret = kstrtol(buf, 10, &val);
> +	if (ret)
> +		return ret;
> +
> +	ret = xe_hwmon_get_u8_from_sysfs(val, false, &pwm);
> +	if (ret)
> +		return ret;
> +
> +	guard(xe_pm_runtime)(hwmon->xe);
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +	fi = &hwmon->fi[fan];
> +
> +	if (fi->pwm_enable_mode != XE_FAN_PWM_MANUAL_USER_TABLE) {
> +		drm_err(&hwmon->xe->drm,
> +			"pwm%d_enable is not in manual user mode, cannot update pwm point %d\n",
> +			fan, point);
> +		ret = -EINVAL;
> +		goto unlock;
> +	}
> +
> +	/* Preserve zero for the (0, 0) end marker instead of clamping it. */
> +	if (pwm)
> +		pwm = max_t(u8, pwm, min_t(u32, fi->min_pwm, U8_MAX));
> +
> +	drm_dbg(&hwmon->xe->drm, "staging fan %d point %d pwm to %u\n",
> +		fan, point, pwm);
> +	ret = xe_hwmon_update_user_fan_point(hwmon, fan, point, false, pwm);
> +
> +unlock:
> +	mutex_unlock(&hwmon->hwmon_lock);
> +
> +	return ret ? ret : count;
> +}
> +
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point1_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(0, 0));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point1_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(0, 0));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point2_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(0, 1));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point2_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(0, 1));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point3_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(0, 2));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point3_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(0, 2));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point4_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(0, 3));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point4_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(0, 3));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point5_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(0, 4));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point5_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(0, 4));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point6_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(0, 5));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point6_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(0, 5));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point7_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(0, 6));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point7_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(0, 6));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point8_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(0, 7));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point8_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(0, 7));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point9_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(0, 8));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point9_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(0, 8));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point10_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(0, 9));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point10_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(0, 9));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point1_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(1, 0));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point1_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(1, 0));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point2_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(1, 1));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point2_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(1, 1));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point3_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(1, 2));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point3_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(1, 2));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point4_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(1, 3));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point4_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(1, 3));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point5_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(1, 4));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point5_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(1, 4));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point6_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(1, 5));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point6_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(1, 5));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point7_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(1, 6));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point7_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(1, 6));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point8_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(1, 7));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point8_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(1, 7));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point9_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(1, 8));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point9_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(1, 8));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point10_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(1, 9));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point10_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(1, 9));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point1_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(2, 0));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point1_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(2, 0));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point2_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(2, 1));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point2_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(2, 1));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point3_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(2, 2));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point3_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(2, 2));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point4_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(2, 3));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point4_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(2, 3));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point5_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(2, 4));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point5_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(2, 4));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point6_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(2, 5));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point6_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(2, 5));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point7_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(2, 6));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point7_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(2, 6));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point8_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(2, 7));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point8_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(2, 7));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point9_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(2, 8));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point9_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(2, 8));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point10_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(2, 9));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point10_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(2, 9));
nit: could this be collapsed with a macro, e.g.:

#define XE_FAN_POINT_ATTRS(fan, point)        \
      static SENSOR_DEVICE_ATTR(pwm##fan##_auto_point##point##_temp, 0644,\
                    xe_hwmon_pwm_auto_point_temp_show,       \
                    xe_hwmon_pwm_auto_point_temp_store,      \
                    XE_CURVE_IDX((fan) - 1, (point) - 1));   \
      static SENSOR_DEVICE_ATTR(pwm##fan##_auto_point##point##_pwm, 0644, \
                    xe_hwmon_pwm_auto_point_pwm_show,        \
                    xe_hwmon_pwm_auto_point_pwm_store,       \
                    XE_CURVE_IDX((fan) - 1, (point) - 1))

#define XE_FAN_ATTRS(fan)      \
      XE_FAN_POINT_ATTRS(fan, 1);  XE_FAN_POINT_ATTRS(fan, 2);  \
      XE_FAN_POINT_ATTRS(fan, 3);  XE_FAN_POINT_ATTRS(fan, 4);  \
      XE_FAN_POINT_ATTRS(fan, 5);  XE_FAN_POINT_ATTRS(fan, 6);  \
      XE_FAN_POINT_ATTRS(fan, 7);  XE_FAN_POINT_ATTRS(fan, 8);  \
      XE_FAN_POINT_ATTRS(fan, 9);  XE_FAN_POINT_ATTRS(fan, 10)

XE_FAN_ATTRS(1);
XE_FAN_ATTRS(2);
XE_FAN_ATTRS(3);
> +
> +static struct attribute *hwmon_curve_attributes[] = {
> +	&sensor_dev_attr_pwm1_auto_point1_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point2_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point3_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point4_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point5_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point6_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point7_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point8_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point9_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point10_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point1_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point2_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point3_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point4_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point5_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point6_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point7_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point8_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point9_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point10_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point1_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point2_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point3_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point4_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point5_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point6_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point7_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point8_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point9_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point10_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point1_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point2_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point3_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point4_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point5_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point6_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point7_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point8_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point9_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point10_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point1_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point2_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point3_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point4_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point5_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point6_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point7_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point8_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point9_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point10_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point1_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point2_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point3_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point4_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point5_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point6_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point7_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point8_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point9_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point10_pwm.dev_attr.attr,
> +	NULL
> +};
nit: Could the entries of hwmon_curve_attributes[] be generated with a
small macro. e.g.:

#define XE_ATTR(fan, point, kind) \
&sensor_dev_attr_pwm##fan##_auto_point##point##_##kind.dev_attr.attr

#define XE_FAN_KIND_LIST(fan, kind)                       \
      XE_ATTR(fan, 1, kind),  XE_ATTR(fan, 2, kind),        \
      XE_ATTR(fan, 3, kind),  XE_ATTR(fan, 4, kind),        \
      XE_ATTR(fan, 5, kind),  XE_ATTR(fan, 6, kind),        \
      XE_ATTR(fan, 7, kind),  XE_ATTR(fan, 8, kind),        \
      XE_ATTR(fan, 9, kind),  XE_ATTR(fan, 10, kind)

#define XE_FAN_ATTR_LIST(fan) \
      XE_FAN_KIND_LIST(fan, temp), XE_FAN_KIND_LIST(fan, pwm)

static struct attribute *hwmon_curve_attributes[] = {
      XE_FAN_ATTR_LIST(1),
      XE_FAN_ATTR_LIST(2),
      XE_FAN_ATTR_LIST(3),
      NULL,

};

Regards,
Soham
> +
> +static umode_t xe_hwmon_curve_attributes_visible(struct kobject *kobj,
> +						 struct attribute *attr, int index)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
> +	u32 attrs_per_fan = 2 * MAX_FAN_CONTROL_POINTS;
> +	u32 fan = index / attrs_per_fan;
> +
> +	if (!hwmon->xe->info.has_fan_control || !IS_FAN_ENABLED(fan))
> +		return 0;
> +
> +	/* All slots must exist at registration, before the user curve has been staged. */
> +	return attr->mode;
> +}
> +
> +static const struct attribute_group hwmon_curve_attrgroup = {
> +	.attrs = hwmon_curve_attributes,
> +	.is_visible = xe_hwmon_curve_attributes_visible,
> +};
> +
>   static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
>   {
>   	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> @@ -2051,7 +2740,7 @@ xe_hwmon_pwm_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>   		xe_dbg(hwmon->xe, "pwm read for fan %d: %ld\n", channel, *val);
>   		break;
>   	case hwmon_pwm_enable:
> -		*val = fi->pwm_enable_mode;
> +		*val = fi->is_full_speed ? XE_FAN_PWM_FULL_SPEED : fi->pwm_enable_mode;
>   		break;
>   	default:
>   		ret = -EOPNOTSUPP;
> @@ -2127,6 +2816,8 @@ xe_hwmon_pwm_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
>   			       channel);
>   			fi->pwm_enable_mode = XE_FAN_PWM_AUTO_STOCK_TABLE;
>   			fi->is_full_speed = false;
> +			fi->fan_table[USER_FAN_TABLE].temp_staged = 0;
> +			fi->fan_table[USER_FAN_TABLE].speed_staged = 0;
>   		} else {
>   			ret = -EINVAL;
>   		}
