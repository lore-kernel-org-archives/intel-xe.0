Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA242606A33D
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 15:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BDWLH/vN;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=FnOXJ0Ck
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ED6510E142;
	Thu, 26 Nov 2026 15:00:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7315C10E142
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 14:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795705194; x=1827241194;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=n/QOXLl2BMM3PjqcJog0YmCuJaYfWcwKK5iOVWiPTE0=;
 b=BDWLH/vNGCt5SMpKsg1vszHsOdux1bb55DD3/7B2H4UJi+KhfjOsGHZt
 a3zIJp1/X6nGIxcDhxcyENiDYy5yGG91X2WGx6kJKFbCoeVvx2p/wh5Ns
 Iy60k85cMYoBbX8/dmC4veqy2RlRLnTlQxSdoFm3H3etRiFfgN4vZIurj
 Thvr3P2pcQDe0e4Zq//gVJPC2DIr2EA/5DtNRit2Z+w8vPAfS0uethnvE
 HfdjdptIgwi0PO+0NFDawwRCzo7xgE0M736og+j8GbZP8bD9AkiqhGH92
 clN+MSsEIX/j7icPKiRGzObfAO9IGiXlIZsSbSqrox99N6M7+ySo+ONN3 w==;
X-CSE-ConnectionGUID: VQDERjNlSvSotvkbJequ/A==
X-CSE-MsgGUID: rD9J4A8/QoCfSTf1yK8xKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4514625"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208,217";a="4514625"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 06:59:54 -0800
X-CSE-ConnectionGUID: qCRcog83QxqmsywmP/RukA==
X-CSE-MsgGUID: 2iknzx7gSoS0Vo1kp+8eFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208,217";a="12080635"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 06:59:53 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 06:59:52 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 06:59:52 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.4) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 06:59:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ED6gcjbjVFo4lpAscTEABgYc0CcUb32apQ3WcajojnA7FtpS/D8zVIeOuZrXo8dKeKyvQmbsNlChhcizo130a0ebqqARFaU9jGwGSJ8gmZ+EN0EO5e1GWCQqQgPhlwh63V8ZQPPw/qEAxIykCtEhTkThJu5fwVisH1gQELP4kLOPWpN/zbpCu4Wy7PdX+N7IKUl2xqzGp2ONQiSPTwQmkGfGjjQ1zLcXlsLCgkRlagDKJFS9sOIh8gp+bjKVP0ayKjyUaAH1w6OcQcetKAohGPx2WpnFia4l21FmnUYqZJhrUkvdKWYaDDL+nm03I9FFMS2VA3rvx9WuCLV1g2Lwrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L7m06yc9UK56EcrZYCBGIXrjL1BU5Gvd2zZtcO+2mfk=;
 b=mpOZLgnxRxuhtpQ2Ef6wiBqYdiojVsnNT0aJ/lG1ebFtJHb+igsx7/w0lg3M1K/alUzgZAbRX0dTK0YkHhhD5hwFvcfY75USLGT4D+TjGsFQl6S2VaQ7eN59GSwIVnsvVQzOfwR3IFYoa60nR3XbTxxRwfbM8RIxsT/TwKAcPjNQqptu3bkl74mKUTgEdp3L0iFXOKMLWS5Yn8Ui7Ya3ErKh9Uyb0MyhYpB5vf+X8cz7PRV/mu2e8zZFM/6KOX9URow83lri6wzF4+txnFRZ9hN2CXGqEPlF/cDdOJ0bIfpjtvuvTKqMRPTflTyeE+xvKnWIayXgCRu5g5OP9qvB+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L7m06yc9UK56EcrZYCBGIXrjL1BU5Gvd2zZtcO+2mfk=;
 b=FnOXJ0Ckbm+Fw8WnGNj27n/CDZm8m6ol0pbFsHn/D9//jrZmpr3LXhc5BvBC7wRlUdBgOrxysR+U5mMuWUuwrKOIspSzzeq5UbbdAQZXjzIF5IkluvmKjj1Qnk51xlIq2rgFqEMxZV8yW4ylNkZ8pgvEPXeWonL4S6ZSag6V+8s=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by SN7PR11MB7538.namprd11.prod.outlook.com (2603:10b6:806:32b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Thu, 26 Nov
 2026 14:59:48 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 14:59:47 +0000
Content-Type: multipart/alternative;
 boundary="------------18LHS0fp2cJGLn1KryvDj3w3"
Message-ID: <ca717c32-0740-4aad-9f86-5d4c4854bfd5@intel.com>
Date: Thu, 26 Nov 2026 20:29:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] drm/xe/cper: Handle CPER allocations in atomic
 context
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <jani.nikula@linux.intel.com>, <daniele.ceraolospurio@intel.com>
References: <20261125100716.2151294-8-mallesh.koujalagi@intel.com>
 <20261125100716.2151294-12-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20261125100716.2151294-12-mallesh.koujalagi@intel.com>
X-ClientProxiedBy: MA5P287CA0263.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::11) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|SN7PR11MB7538:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cb4ad43-98fc-4519-0435-08df4bcde9ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|22082099003|18002099003|6133799003|8096899003|11063799006|261026121527099003|56012099006|261022113327099003|261028144727099003|261022105027099003|4143699003|261022075727099003|261009223027099003|261021121427099003|261026140227099003|261021123027099003|261102123227099003|10067099003;
X-Microsoft-Antispam-Message-Info: g/AhlS+RF4GnRmsAObU96dVcfTolnvIjYKnqpJpMHsNyk7w7pnSmlGuAVffo5Vv0FOqevxu5lDuP2zCTtT2sNOcP3sOPbtsBeLIPpFzF166V1oWJjAz78A6tc+mGPbi4+hMTIds/gB97GXUxWc83relPKeOadW1MQFhHm5Y6R307W4bawKIl58XyaBz21pvjo46QvhDCLPh+hPBUTlAFFqQi2Ev6i4dE1USHbSdsGnPu7WRY+JSmp3JK8KhsAqL8sQQz/lqszJ6mJsoScs5qhAorrR8BqVqTpj5JtKKSM9jmyRvW5JAUOhlNdz2GmNOKAW4oBeDLJKDxgtG+Q/zHJpQ9sq62zSlWZyZwNU4LVStQSP+RFPbGAM8hJZsmRyNMfsOwt8mHP3+Hj5EOIIdmv6k8nsaWcwMAvqGtJ1w6k2Y/gNO0isuQoKYGQSucDxdmsWSe/OBND7KfCuqvKs833YHopkiThCGyd1XjQMD2DjQFKxXNY+vQQuH86AdMRqKDTR9KDkazscu7t+vvVgPHzAyuken8b18btRexDx1I3DA23QqUK2UDPgsbxHjsDSS9aXVGVsj2MJsc5NOv9dlKS7U7zlRfugs0EJE1DTTVbsAXTjnMRvJDBIiPUl7OSVHn+wLhWSaPdgYVMDT4zEwack3mED5a4mD7eHocR4DLfhg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(22082099003)(18002099003)(6133799003)(8096899003)(11063799006)(261026121527099003)(56012099006)(261022113327099003)(261028144727099003)(261022105027099003)(4143699003)(261022075727099003)(261009223027099003)(261021121427099003)(261026140227099003)(261021123027099003)(261102123227099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnBtU1AzeU1scjRWRTZFdlVadHdremlXNit4S3dzNjhKR2hpWUZUTFczS3pj?=
 =?utf-8?B?OHMzNzk0TDBqT3l2WmcyenlacXhiZVowUGx4dG1MVlBUbHFRMDZsUmZrTFhI?=
 =?utf-8?B?ZmdkZ0VzSFJ4RHJUUUJTRFhKKzc2SmFEZzQwbXJMWXMyWC82dVg0UHAzaTBC?=
 =?utf-8?B?dW1TUHhoVWp6R0ZrV1Z6emZ0Uk9mc3I2RXM5Y0M2Z0tsSk8xZ0RDdE52YlFq?=
 =?utf-8?B?dWwwYTVxRlc5RXdoSlE2a2g3cHNHTlpRNHNGWE5vWW5TdldKNUtqdEZqSmNL?=
 =?utf-8?B?N0FGL054aGNKUXhmaTdlby9VcjNkQWFaUXVCcXd3UUdWZVozSFc1VFR1dmlK?=
 =?utf-8?B?K2J1cEViVW9kUjEvb280VWthTWxGanBNcXFCZExTOGFtZDVQZjZKSUdpT1lp?=
 =?utf-8?B?ZmpTeXFUZmNxTGUwemR2RmRCcTVNZmJ1cW9lOExwZkluMXlzWkhiTUpuck9m?=
 =?utf-8?B?R3d0cGVzcHVJLzVaUEhJUXk1NnYrQndvL3JEMzNCMVI4R0J4TEcwSWdDazVt?=
 =?utf-8?B?dXFXMlhoWGFsQndiYXI3WnJXaVBsWnJIMzlnQm5RcWJZZE5ocng0T1YxQWx2?=
 =?utf-8?B?TlE4Yjk1Q3d5eDNjMFRmeGdKMHViMkd4aEpuUklaczI3RThoYTg3SW8ycktk?=
 =?utf-8?B?TktWbmMzaFpCSHVWNGVZTlZibkVLR1hYekRCSmJ5M1dWdHpXUGkwZXJJZUVQ?=
 =?utf-8?B?MGVEMVhCcHFiYS8yRDlnWXIxL0U1NzVYNDNDODFJQk5pRlVIY3doakljZ0dt?=
 =?utf-8?B?NXl3ZVIyNmJicEVQQ3dYTTMwSWczSkp1cElCc2RLUmZsUDNCb1dobUEycmxz?=
 =?utf-8?B?bGVSeFh2SWJkelZrK20wdFI3MFU1UVZlMStMTktuRXEwcHl2aUF3eVZTN0dO?=
 =?utf-8?B?L1JvRk4wbmRuMkRoWEh2YTVMS05CWVJJcllMMDJjK3doNG51ZUxJVDN4d0h4?=
 =?utf-8?B?R1dpSEw2OURqb1N0YldDbXZ1MXpaNGFsU2VuOGQzUE9RditVc2h6eFVjQWF0?=
 =?utf-8?B?RWYxU3VxQ1ZwNGRRVk9QY1FRS25vcHBoZi9ZNlVVbWs1RXNpZFNrMTVOZ29y?=
 =?utf-8?B?QkVxZUpQL3BIODkrV25JenRvak5wcnFlZVdWS1BNMTRDWVpidWIwakM5WitM?=
 =?utf-8?B?c1FoQjR0WGJPdGJjNEdVQ1MwZ29mZHlWU2dNY2xJcTFTOEQwbTNuc2NaTXlm?=
 =?utf-8?B?S3Bad0pEbGYvNXZqUnFoaG92L09yUWcvZk41djNyejVBa0V5YURyUGRoOExQ?=
 =?utf-8?B?MllpZFRUNTJHSUxxWm5UWWRzVUhkVHo2Z2dqcFE4bnROclF5NHVZUDRnSkRE?=
 =?utf-8?B?TGQ3ME1PZUZRUk9ubTVBNEY5MjU4d29xcDJKUkMxTUk0TTBWU3ZVSGhPRG13?=
 =?utf-8?B?MnRqcDdpT3d2TFAxMmtKMnNkNUcxakNTMGhxcE5uNXIzbUxVNnArcEgrZldQ?=
 =?utf-8?B?bEc4bTFTUW5kR2RKYlJxdi9qNklDbms5NWhWRks4MERRRnVyZWtQWmVaZXVa?=
 =?utf-8?B?b3FUUDlydUxWY2pDTjFvT25Pekg3MklJVEJOWHhtTHNka1VxUC9GWFptYW1m?=
 =?utf-8?B?OGt1bmxndzA0TGhCTHBwVW5SYThTWllVVzh2ZFNPZUMrT2NVc0NqYUF0QTRF?=
 =?utf-8?B?TnN4UzJmNndxeU9WQzV5aU1Jc2VlM1BuY1gvU1JudnZIWmh1QXlzdG56a1A1?=
 =?utf-8?B?UlhSNUNXSWRqbXVDbm5yMGpRcDk3SGJVQWxzUzRDVjZ4eGpGWmIrY2c0eFZr?=
 =?utf-8?B?Ni9GMTE2dmpNOWpLY3B5ZlZoSkR2QklNczBFOW5rakFoZFB4YjY5TzNTS3Z1?=
 =?utf-8?B?VEVXeTRlclZLYnBOOHlhSzZTcTNFL2hFUVh0NjZlVUpiVUVwemQ3TE84UGIy?=
 =?utf-8?B?dEk2SWpIOCtTMjYzVWhaYXkyMjRtU0FtOHJ1NmxOdklQNmNyME40eVBsU3FH?=
 =?utf-8?B?ZmtyRXNwVGllMDFoemhJZjgvV3lST1E1Vm1ZcnQ0QlB3SzNzb00wcEZLSlQ0?=
 =?utf-8?B?VUR4NDJ2czlEWWE0c1V5Tzg1ZlEvSllzVFhvUTJxdm94MTQwOEVmVy9LWEc5?=
 =?utf-8?B?WlJpSkVpbFpNcmxvbWJsOUp2UFl6ck5wY082U0JJQUJldTVCdnY5MXpNYk5E?=
 =?utf-8?B?NWZtb1JaaXQwTFZFYW9GN1lsNWFJZlpEQ29GL0lXbWYrTXoxVVBKRTh3dDc4?=
 =?utf-8?B?RHN4VEhSN3YvL1gwaEdhT2NCdnBMZVllSkFFZStER1ZJdUlMc01kSlFTcjhv?=
 =?utf-8?B?eThuQU5uNy9xR0JOS2c4b2ZRRnBrNXNzSEY4bW9pcnFHZXJWMGZINlo0SWdr?=
 =?utf-8?B?UlVvcXFXanA3eWRvUDlvRlU2UjhKQmowYjRiVXUraG00Mi9NQVNsQT09?=
X-Exchange-RoutingPolicyChecked: ariHuss0drRKuxYaYAHF4aRY7U9EipK8HjGNtrtLPcXX4YQEKAjLsaBtcQz0mMU/o+RnLirbh12wEdQrGDE6QKkxTD/Jcg7GKmFBrL0UYdIZmo5MaHua9FOhJn+znhx4R94zUwdx5ci64j4j89Fhxw0Z+dill2O9rOhIHUvAEc0lnEqnvtSThJjCMhVqPvAgIYAVCL8BoWGftGO4Zz6jXz2aYGAX+I3NPHjgdMXOyknxKa5qSeX+lY9CLv8jSL74pTi6tj+Pj5gHAyvqQRvnumtG/tLhUMhHazZZIqH2RU0RlLHf4eInJ2ZEqn/x7juRYNferZ4O3M4v0uDUCnVj6w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cb4ad43-98fc-4519-0435-08df4bcde9ea
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 14:59:47.5610 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dyev14henBhdU3riLTTPHg2cq1h9V0C8NuSjiMRH+12uvLoNDG/HmyQxU7L8Kx3kwhWMlaNKxiuJ/DDWXLckzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7538
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
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------18LHS0fp2cJGLn1KryvDj3w3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 25-11-2026 15:37, Mallesh Koujalagi wrote:
> Use GFP_NOWAIT | __GFP_NOWARN for software CPER allocations, keep

Please mention why software CPER allocations need GFP_NOWAIT | 
__GFP_NOWARN here and why a sleepable allocation cannot be used.
Also mention the planned long-term solution.

Thanks,
Badal

> GFP_KERNEL for hardware CPER allocations, and track/report dropped
> records on allocation failures.
>
> Cc: Daniele Ceraolo Spurio<daniele.ceraolospurio@intel.com>
> Cc: Badal Nilawar<badal.nilawar@intel.com>
> Signed-off-by: Mallesh Koujalagi<mallesh.koujalagi@intel.com>
> ---
> v3:
> - Handle atomic context when SIGIDs are logged. (Sashiko)
>
> v4:
> - Add can_sleep bool parameter in per_record_emit. (Badal)
>
> v5:
> - Move gfp variable where it's used.
>
> v6:
> - Pass gfp_t directly. (Badal)
> ---
>   drivers/gpu/drm/xe/xe_cper.c       | 23 ++++++++++++++++-------
>   drivers/gpu/drm/xe/xe_cper_types.h |  3 +++
>   drivers/gpu/drm/xe/xe_printk.h     |  3 +++
>   3 files changed, 22 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
> index 9161f2b52e9b..d8fff57a349e 100644
> --- a/drivers/gpu/drm/xe/xe_cper.c
> +++ b/drivers/gpu/drm/xe/xe_cper.c
> @@ -180,10 +180,14 @@ static void cper_init_section_desc(struct xe_device *xe, u8 severity,
>   	}
>   }
>   
> +/* TODO: Handle xe_log_* helper function for atomic context */
> +/* Software CPER may be emitted from atomic context */
> +#define XE_CPER_SW_GFP	(GFP_NOWAIT | __GFP_NOWARN)
> +
>   static void cper_record_emit(struct xe_device *xe, u8 severity,
>   			     const guid_t *notification_type,
>   			     const struct xe_cper_intel_hdr *ihdr,
> -			     const void *einfo, u32 einfo_len)
> +			     const void *einfo, u32 einfo_len, gfp_t gfp)
>   {
>   	struct cper_section_descriptor *sdesc;
>   	struct xe_cper_nonstd_record *rec;
> @@ -191,9 +195,13 @@ static void cper_record_emit(struct xe_device *xe, u8 severity,
>   	u32 total_len;
>   
>   	total_len = sizeof(struct xe_cper_nonstd_record) + einfo_len;
> -	rec = kzalloc(total_len, GFP_KERNEL);
> -	if (!rec)
> +	rec = kzalloc(total_len, gfp);
> +	if (!rec) {
> +		int total = atomic_inc_return(&xe->cper.dropped);
> +
> +		xe_warn_ratelimited(xe, "CPER: record dropped, total=%d\n", total);
>   		return;
> +	}
>   
>   	rhdr = &rec->record_hdr;
>   	sdesc = &rec->section_desc;
> @@ -477,7 +485,7 @@ void xe_cper_emit_counter(struct xe_device *xe, int cper_sev, enum xe_sigid sigi
>   				    entries[i].einfo_size, &ihdr);
>   
>   		cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR, &ihdr,
> -				 entries[i].einfo, entries[i].einfo_size);
> +				 entries[i].einfo, entries[i].einfo_size, GFP_KERNEL);
>   	}
>   
>   	free_info_arr(info_arr, num_entries);
> @@ -511,9 +519,9 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
>   	char *msg;
>   	size_t msg_len;
>   
> -	msg = kvasprintf(GFP_KERNEL, vaf->fmt, *vaf->va);
> +	msg = kvasprintf(XE_CPER_SW_GFP, vaf->fmt, *vaf->va);
>   	if (!msg)
> -		xe_warn(xe, "Failed to allocate CPER message\n");
> +		xe_warn_ratelimited(xe, "CPER: message dropped\n");
>   
>   	driver->error_type = cper_sev;
>   	driver->error_component = component;
> @@ -525,7 +533,8 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
>   	timestamp = ktime_get_real_ns();
>   
>   	cper_init_intel_hdr(xe, &error_class, timestamp, sigid, 1, msg_len, &ihdr);
> -	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_DRV_ERROR, &ihdr, msg, msg_len);
> +	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_DRV_ERROR, &ihdr, msg, msg_len,
> +			 XE_CPER_SW_GFP);
>   	kfree(msg);
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_cper_types.h
> index 5cfa32c75764..500207bd2e75 100644
> --- a/drivers/gpu/drm/xe/xe_cper_types.h
> +++ b/drivers/gpu/drm/xe/xe_cper_types.h
> @@ -6,6 +6,7 @@
>   #ifndef _XE_CPER_TYPES_H_
>   #define _XE_CPER_TYPES_H_
>   
> +#include <linux/atomic.h>
>   #include <linux/cper.h>
>   #include <linux/types.h>
>   #include <linux/uuid.h>
> @@ -192,6 +193,8 @@ struct xe_cper_info_entry {
>   struct xe_cper {
>   	/** @on_query: Emit a CPER record on each RAS counter query */
>   	bool on_query;
> +	/** @dropped: Number of CPER records dropped due to allocation failure */
> +	atomic_t dropped;
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_printk.h b/drivers/gpu/drm/xe/xe_printk.h
> index 87f51d7edfa8..47886897b4ac 100644
> --- a/drivers/gpu/drm/xe/xe_printk.h
> +++ b/drivers/gpu/drm/xe/xe_printk.h
> @@ -27,6 +27,9 @@
>   #define xe_warn(_xe, _fmt, ...) \
>   	xe_printk((_xe), warn, _fmt, ##__VA_ARGS__)
>   
> +#define xe_warn_ratelimited(_xe, _fmt, ...) \
> +	xe_printk((_xe), warn_ratelimited, _fmt, ##__VA_ARGS__)
> +
>   #define xe_notice(_xe, _fmt, ...) \
>   	xe_printk((_xe), notice, _fmt, ##__VA_ARGS__)
>   
--------------18LHS0fp2cJGLn1KryvDj3w3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 25-11-2026 15:37, Mallesh Koujalagi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20261125100716.2151294-12-mallesh.koujalagi@intel.com">
      <pre wrap="" class="moz-quote-pre">Use GFP_NOWAIT | __GFP_NOWARN for software CPER allocations, keep</pre>
    </blockquote>
    <p>
      <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>
      <div style="font-size: 14px; font-style: normal; font-weight: 400; line-height: 20px;"><font face="monospace">Please mention why software CPER allocations
          need GFP_NOWAIT | __GFP_NOWARN here and why a sleepable
          allocation cannot be used.&nbsp;</font></div>
      <div style="font-size: 14px; font-style: normal; font-weight: 400; line-height: 20px;"><font face="monospace">Also mention the planned long-term solution.</font></div>
      <br>
      <font face="monospace">Thanks,<br>
        Badal&nbsp;</font></p>
    <blockquote type="cite" cite="mid:20261125100716.2151294-12-mallesh.koujalagi@intel.com">
      <pre wrap="" class="moz-quote-pre">
GFP_KERNEL for hardware CPER allocations, and track/report dropped
records on allocation failures.

Cc: Daniele Ceraolo Spurio <a class="moz-txt-link-rfc2396E" href="mailto:daniele.ceraolospurio@intel.com">&lt;daniele.ceraolospurio@intel.com&gt;</a>
Cc: Badal Nilawar <a class="moz-txt-link-rfc2396E" href="mailto:badal.nilawar@intel.com">&lt;badal.nilawar@intel.com&gt;</a>
Signed-off-by: Mallesh Koujalagi <a class="moz-txt-link-rfc2396E" href="mailto:mallesh.koujalagi@intel.com">&lt;mallesh.koujalagi@intel.com&gt;</a>
---
v3:
- Handle atomic context when SIGIDs are logged. (Sashiko)

v4:
- Add can_sleep bool parameter in per_record_emit. (Badal)

v5:
- Move gfp variable where it's used.

v6:
- Pass gfp_t directly. (Badal)
---
 drivers/gpu/drm/xe/xe_cper.c       | 23 ++++++++++++++++-------
 drivers/gpu/drm/xe/xe_cper_types.h |  3 +++
 drivers/gpu/drm/xe/xe_printk.h     |  3 +++
 3 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
index 9161f2b52e9b..d8fff57a349e 100644
--- a/drivers/gpu/drm/xe/xe_cper.c
+++ b/drivers/gpu/drm/xe/xe_cper.c
@@ -180,10 +180,14 @@ static void cper_init_section_desc(struct xe_device *xe, u8 severity,
 	}
 }
 
+/* TODO: Handle xe_log_* helper function for atomic context */
+/* Software CPER may be emitted from atomic context */
+#define XE_CPER_SW_GFP	(GFP_NOWAIT | __GFP_NOWARN)
+
 static void cper_record_emit(struct xe_device *xe, u8 severity,
 			     const guid_t *notification_type,
 			     const struct xe_cper_intel_hdr *ihdr,
-			     const void *einfo, u32 einfo_len)
+			     const void *einfo, u32 einfo_len, gfp_t gfp)
 {
 	struct cper_section_descriptor *sdesc;
 	struct xe_cper_nonstd_record *rec;
@@ -191,9 +195,13 @@ static void cper_record_emit(struct xe_device *xe, u8 severity,
 	u32 total_len;
 
 	total_len = sizeof(struct xe_cper_nonstd_record) + einfo_len;
-	rec = kzalloc(total_len, GFP_KERNEL);
-	if (!rec)
+	rec = kzalloc(total_len, gfp);
+	if (!rec) {
+		int total = atomic_inc_return(&amp;xe-&gt;cper.dropped);
+
+		xe_warn_ratelimited(xe, &quot;CPER: record dropped, total=%d\n&quot;, total);
 		return;
+	}
 
 	rhdr = &amp;rec-&gt;record_hdr;
 	sdesc = &amp;rec-&gt;section_desc;
@@ -477,7 +485,7 @@ void xe_cper_emit_counter(struct xe_device *xe, int cper_sev, enum xe_sigid sigi
 				    entries[i].einfo_size, &amp;ihdr);
 
 		cper_record_emit(xe, cper_sev, &amp;INTEL_CPER_NOTIFY_GPU_ERROR, &amp;ihdr,
-				 entries[i].einfo, entries[i].einfo_size);
+				 entries[i].einfo, entries[i].einfo_size, GFP_KERNEL);
 	}
 
 	free_info_arr(info_arr, num_entries);
@@ -511,9 +519,9 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
 	char *msg;
 	size_t msg_len;
 
-	msg = kvasprintf(GFP_KERNEL, vaf-&gt;fmt, *vaf-&gt;va);
+	msg = kvasprintf(XE_CPER_SW_GFP, vaf-&gt;fmt, *vaf-&gt;va);
 	if (!msg)
-		xe_warn(xe, &quot;Failed to allocate CPER message\n&quot;);
+		xe_warn_ratelimited(xe, &quot;CPER: message dropped\n&quot;);
 
 	driver-&gt;error_type = cper_sev;
 	driver-&gt;error_component = component;
@@ -525,7 +533,8 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
 	timestamp = ktime_get_real_ns();
 
 	cper_init_intel_hdr(xe, &amp;error_class, timestamp, sigid, 1, msg_len, &amp;ihdr);
-	cper_record_emit(xe, cper_sev, &amp;INTEL_CPER_NOTIFY_DRV_ERROR, &amp;ihdr, msg, msg_len);
+	cper_record_emit(xe, cper_sev, &amp;INTEL_CPER_NOTIFY_DRV_ERROR, &amp;ihdr, msg, msg_len,
+			 XE_CPER_SW_GFP);
 	kfree(msg);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_cper_types.h
index 5cfa32c75764..500207bd2e75 100644
--- a/drivers/gpu/drm/xe/xe_cper_types.h
+++ b/drivers/gpu/drm/xe/xe_cper_types.h
@@ -6,6 +6,7 @@
 #ifndef _XE_CPER_TYPES_H_
 #define _XE_CPER_TYPES_H_
 
+#include &lt;linux/atomic.h&gt;
 #include &lt;linux/cper.h&gt;
 #include &lt;linux/types.h&gt;
 #include &lt;linux/uuid.h&gt;
@@ -192,6 +193,8 @@ struct xe_cper_info_entry {
 struct xe_cper {
 	/** @on_query: Emit a CPER record on each RAS counter query */
 	bool on_query;
+	/** @dropped: Number of CPER records dropped due to allocation failure */
+	atomic_t dropped;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_printk.h b/drivers/gpu/drm/xe/xe_printk.h
index 87f51d7edfa8..47886897b4ac 100644
--- a/drivers/gpu/drm/xe/xe_printk.h
+++ b/drivers/gpu/drm/xe/xe_printk.h
@@ -27,6 +27,9 @@
 #define xe_warn(_xe, _fmt, ...) \
 	xe_printk((_xe), warn, _fmt, ##__VA_ARGS__)
 
+#define xe_warn_ratelimited(_xe, _fmt, ...) \
+	xe_printk((_xe), warn_ratelimited, _fmt, ##__VA_ARGS__)
+
 #define xe_notice(_xe, _fmt, ...) \
 	xe_printk((_xe), notice, _fmt, ##__VA_ARGS__)
 
</pre>
    </blockquote>
  </body>
</html>

--------------18LHS0fp2cJGLn1KryvDj3w3--
