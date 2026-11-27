Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37778606A321
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 06:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LcW9I+tx;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=GVcQZv1m
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF1601120AA;
	Fri, 27 Nov 2026 06:04:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 494F31120AA;
 Fri, 27 Nov 2026 06:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795759451; x=1827295451;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bQ3ejrxPJ1CWWQgD8aYIhdm77OVoph7CX6Mts3B+COQ=;
 b=LcW9I+txwf17WQb6XmBUE1RZIfTdN7Lj8tKoQUo94ckur2LLYeLymU0A
 sKkETOg+bXkg0+RkHThN+A6/ULDv+tJBojw0cloRzzOyGrHIrbwExTNYS
 2zjJ6Gl0GTvzCmWYrl0F9FsIyqpMbnFMDbCVga7yAM0TOdQqcZ24/YYyN
 laxpT36OyTSMC30jPr1QeSErsF74mWNwpfzRupf0eYucj/zE3+uXNR7xi
 Tis/wRI3doAozGOsg/FZ43Az0DBKlkqhjd4ux0w8LwrlDGmoTjQY6zuc3
 +LA3m1SioN9ox2jhjdCxvumj5dQxhrwVP0knIlnyFEi67Uo+o8hFEG6X1 w==;
X-CSE-ConnectionGUID: GabOXNmvR4G7a6IlZqT7Gw==
X-CSE-MsgGUID: 70cKUAyMThKGSQM3gPmCng==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4577696"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4577696"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 22:04:10 -0800
X-CSE-ConnectionGUID: D7V6m6L6TY+tLrTrQEfaPg==
X-CSE-MsgGUID: iYUbInEHRgy7vVj7fmYvsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12177576"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 22:04:10 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 22:04:09 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 22:04:09 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.53) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 22:04:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=howmsBy7rLzZTGTQnN+w3Y0HLZszx8ZpG86hCmlLqmSu37rLdPLyBoB6E458oLIK0dbBDNTckD3SpasSvVbr/S8XQLuoiGzcYRsEnfjkPnivQZFnDrbhSEoIfMeqoQALfO7ku/hn7GnG3Fl7I8HvJlGz8b0o4BrYeIhMTHQtUnXAt4eO+0d5KX57iUl0o7eiNZuECpHwAY+dgqF5YAw2mYg/X0Ak0ab5fWxtW6WYMUeRQeTLPNqLwKUyGSS4Lh3i7hC8dBGo3uc//bV32TaxxuYO3I0FX0AnOClEnmFyhP4xWBjCstArsaCKy4eNEjEtFqXRC5VKJTQDCoY+QtEa4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6mcGNOtTEzd5bJuv3QuttJe4pcdBS5P/E3xHtTnaUUg=;
 b=n82vawsxQZhcaAKGsnUNV/zr9y3BKdMG6PEVQgOf8WKXRugyvAgxtJyFUJjNZpxujjJ6VfA68G4xdpYc/p9sRUDxBoCJSUUuPYCl3OwNVaUPUyiKaShXoZtsG/JgreTUXEQ3GevjUdoIYZ4eHs8NUBgxuFyvxsq2uSbb9G35CVWbw2Zck6KmKug32t3PKBNRnNXsccJnjiHL2H/CLDccUOjh1l3lHT7fAmCLC8dQRl48cbF7iW5DAp69WNWF9iLZ0uXkpH/nstSFZFzRUucOxu5KzujzFDDWzBQHukq4lAPm08ofXAUWUN9jE7Ytmn/VP1ytGyI1QbQo3TuaQNKFkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6mcGNOtTEzd5bJuv3QuttJe4pcdBS5P/E3xHtTnaUUg=;
 b=GVcQZv1matQOJR2WFfb3PocUqA6t2Iju/JJx3gWsVukDOrQMQL6JTNldjvnXCpW97uA7xuOwzkPKmGawYWLXYJPbVjfeu0LUwBBKnOls3ShbVvzGyNycXey+h5QxgNVwr10NYqWYTauEK7x1PjQPUc0mhqQmo6qSvqkguKRCa8s=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21) by IA3PR11MB9397.namprd11.prod.outlook.com
 (2603:10b6:208:573::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Fri, 27 Nov
 2026 06:04:07 +0000
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460]) by LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460%5]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 06:04:07 +0000
Message-ID: <ed36e44c-0257-46b1-8df1-2238ed40ce01@intel.com>
Date: Fri, 27 Nov 2026 11:34:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/13] drm/i915/vrr: Include VRR safe window in state dump
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>
References: <20261023165803.31016-1-ville.syrjala@linux.intel.com>
 <20261023165803.31016-13-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20261023165803.31016-13-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0302.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21e::19) To LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB148960:EE_|IA3PR11MB9397:EE_
X-MS-Office365-Filtering-Correlation-Id: a21ee594-5468-4607-9b6c-08df4c4c3f56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|261026121527099003|10067099003|11063799006|56012099006|4143699003|261009223027099003|261021121427099003|261102123227099003|261022075727099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: D85E3Tt97eVu0ZV0j4xOqeXb0Y2Cri6m05Ef+AvVlLNBXkm1Wfjewii9K7OSXwEbHyLRvetHazb6P/3d4Prr42J0Qt2H6hwKESOCIzEQj60qKYr4AeZ/Yu3zupYsTiWMkzSefLG/PbUqvPNCvjJBIITbrQx7NcVa4DESLfO9yO6MQp/IiOpdrrYjHk+ZOtTjGqKuZrMXJSWvGTEAx8pZol1xyyMXm4xKXuMCEN6NNXLYH+knExHXSRIZSmEZUz3rHw9Ssn15hibLDNX0OWSgIIw7HHJjveRhAK+5KbWw/Zo443JddQmh+YeDBTMS/3GqmPEqb7woAkFd0V8aQUPg9GinaCirXilFwWWMEumrpK0ccBLV9RdRq8v8ih413hvyjxle/Pdq9tb2H6OTz+ROHOl01jPkI/RvfuPaPT7XugYfw4i21EGkjD5+neiq1UaFxFFrTUPUegp1Gm0Zp7Mu9I2qa3wP2Iem39lA/ut2lZw6ZN3JHDMI1qsaije3VDe9aj0ezIDIFxpDbZZbFYQ/0uaTj0g+cCbrekLmvWm47xmkDS31WIEI2R1RRI8GSgjBSDcrr64sCQLxQooE0Q1WJe/wM9PQh7kR/Tm7GhkkvUuWNxl5pFy42IvZzGfAPhIP5bTqYKXfh1IPQjwF8f+ekr4ybVaMaIq4d13gutV06jE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB148960.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(261026121527099003)(10067099003)(11063799006)(56012099006)(4143699003)(261009223027099003)(261021121427099003)(261102123227099003)(261022075727099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1BmOHM5VHR0VEFaRU1qU2hycHhKeEdiekxmZTFlak8rNjlUUEtLUzE5b2tz?=
 =?utf-8?B?aUdMRHZ0MzBldmtuUnFXMGlIdTlwOG92V3hWaThrS3ozbW5zQ3ZYZUYyOW55?=
 =?utf-8?B?MGZXdVR1N0NVKzdDeTlrWGRDTXRpbXR4WVUyL0s3UDVIRmM3VW1ZTEJJSU51?=
 =?utf-8?B?eU1PTGl3TG9EU0hLMlNNVERkWldYM3JmbFh0S2RNZ2F4bmVOanFndFNIcGtR?=
 =?utf-8?B?cmxUQUlDU2tndHR1Mk5QMTE4OHkvQTBmeERiUjdzZ0I5UXp2d2hadHRWK0lZ?=
 =?utf-8?B?TWk4WTEwOVJsZTlHOGw2d0xaQ01FNDliS0VSN1JpSUlWaGtqNUZiZkJNSGdH?=
 =?utf-8?B?ajNDTmJkT2NkY0hlQnZzR1pvdElsQnpBbzhYRkEzQ1BMM1pRRzJQU2IyRGta?=
 =?utf-8?B?WVJGTm55L3F0UjBQUmtKWXNZbEtBTDgvSFhLMjBsemVHQTR0RUNTYUZOVXEv?=
 =?utf-8?B?ZVBmdFdnNFpmdlFUSHdJcW9vWGdjWGxxY0V0Y3J3U2hCRVpUbU5waVVxZDZj?=
 =?utf-8?B?Ym53NHBrczM3VjFRNHkvSERoTkhRaGl4d1JrV1lzeFdGV3BFNmQwek4xU0x6?=
 =?utf-8?B?eEtnMXdic0wxbHVEdktSQXpnUDkyQTRKR1AwS2pUNys4S3JvQ3BYcHhnZEEw?=
 =?utf-8?B?NkpEUWlmbXl4OXN2Q2NhMWQyRC9hVGpkRmpVR3pSRjl4eHJpd1dpTU4veHh5?=
 =?utf-8?B?MlNzMFRtTVJONzJKVXRpZVc1Yk9LakYyK0ZNaGFITzJZNFFBNitIR1BDV1U3?=
 =?utf-8?B?T2dqTTI1VE1rdnI1bk5lTWU3TlBzVm9kcVVuWVJMMDBic2s4bVp2QWpKdmNo?=
 =?utf-8?B?WEl5aVlmeE0rN0VRTVBxQkNnbWJpNUdsZEFZQzd0bnVhYm8wRVdkbXFweWpa?=
 =?utf-8?B?YWZTUUx1UnRMNTluNFoyVDZCZkNVRlFrdUNOYmI1Vks4d3VQeFA1eURGMlhw?=
 =?utf-8?B?ejhmbzdtWGlVSjFYUDRDaWVVR2Vka3hFem5iNkw4eDdLWU54ZkF0Qm1BKzl1?=
 =?utf-8?B?d0hWcUpiaXlmRnhIS1FsS0twRWJ1NmZXVXJMQ3pUQUJiYmRTUEtZZFdLR0Rh?=
 =?utf-8?B?VEVXT2FQaWY4VCt3TElKRTRoZlVhZlZZUTRtK2ZDQ25TSzhmTk1LUDBxZHlF?=
 =?utf-8?B?K2QwOU5aUXdDd1lQdXQ0T3llcit3d0xOVlR2WTJLRnd3TERlK1ZUV0ZndGFr?=
 =?utf-8?B?d045VW1TZHhIcklmRi9yUmZ0ak9CWERUVExVb01vM3loOW9QMHE1cDBKZkZN?=
 =?utf-8?B?MmIrWEpUN2F4Z0NYNVEvRDd3RzFNNzBQU0djU0JoRkYzb1VEYStkajZoMUNZ?=
 =?utf-8?B?QUNCbEMyY3V4MitrVWdDb21pckxBckRtd3RjY25EbUVybTRIUU5xbFRMcVpW?=
 =?utf-8?B?TW8xeW5RSkNTYjN1dHQ0TUZnOFR4V1FXNFVibDVWdXhJVFE4c1ZvR3BDMEJB?=
 =?utf-8?B?YWxwV3hqVlJNZ0hGcGZLbEs4b3NwU1Y4SWhOY2xWTVhhZmdaMXB5N0FGRTlS?=
 =?utf-8?B?OXJqb1dPeUh4ZUhPc2VKN3BFVmhIdStjcXVSRDJEbGx4akdNdytCSnRxOHpI?=
 =?utf-8?B?cmpoa3ZhOExnazlhNnVHc3p0SWN4djZVblFVbFB0Z1RRQTdKOUhPWWo1dTBB?=
 =?utf-8?B?RVpsZzdaRzMvelVSc3ZCZDVQcURQZnlhL1Z4NURCdWFDeThUS0IxbU91SGpp?=
 =?utf-8?B?bm93NEltQlhmemFBWGtDRnBMUExtZlhVTFpOYUZrWURnK01EU0xGNytMbmFi?=
 =?utf-8?B?cWIxd3RvVmt6dmZTRjI4bnBWRm43VEtzYUYrWnZmWWxFUGtudjB4TDlITDhx?=
 =?utf-8?B?bGRBWDVxUzdocWZPdFVuSnNhNnNUMWFOQjB5U2ZuNjZ4MXJLajNQVnBXZDNQ?=
 =?utf-8?B?R1k2cTAvcWFIdlBXR2dHOXZDczluNTBiYmdhVGFocVJFcWN4bDZ1KzlTYlRj?=
 =?utf-8?B?b0lOY3pYcVNGYnQ0elErSFAveXZSd2x5VDhWc082bUtVU3F5SFA1S09LTmZi?=
 =?utf-8?B?QjZHQVQ3YkRqTDdQcDhJWnhqWE5XVlEwakxRL2NVbmF5anFqNEV4dUh4MHZT?=
 =?utf-8?B?c2k0WE1Eb1dVTklkR0FLY0dXd3ZrVG1vNndsWDVHVmwzTXcyTTVWOGM1TFNY?=
 =?utf-8?B?cUkyWlRadVZFL00wZkl4c2N5Nlp5d05wcjZ1YnlyaURMUlRtNDN4RU5NckI4?=
 =?utf-8?B?RWtlQlBtR2pTS3BDL0JBOHdIMlNpZnZKSzhVZG1mT1pwZ2c1NVRJd3ljc2My?=
 =?utf-8?B?K1BieHpIdW1vazRYVkF1RllRaHh4eFJWQXNLZ2ZDNGxkRXRuakxhYW0xY3ZJ?=
 =?utf-8?B?YVhocGg4dEt5c0ZzelZ1N2IvQ1ZTeUZhZU1nRnJzTUNtM0t4a2FaeStJYXFw?=
 =?utf-8?Q?hzR9gQVNv9aygGyg=3D?=
X-Exchange-RoutingPolicyChecked: i5V8wBEh9tE1b6I7gB0VZc0dthf6mhld5yJ3opZGJVNmTbarcYihEo1vIcRQXIfwrBZ0CfcXnGjQldE6nwf5PV4oo6ljRa5wxr+SPE6vVgVYGGl64utweEfE0GzRj3wnqQO102sKAjFQiVmFAZfK8NA5IbbJJ6dm5ArFhiiA2blNFW5zL4HNmQIP51ocLMxbiVm1cRwp5Zk9jUklYysGgsYAPOK2qNISq0XnHn5er/NKT0MyCD14EnicP0HXxA4bEDwu8j9MDvQG+Yw/ZOVU3OQ8UMNstJuFyEE9t2mK9/XbmALZphDvGARjqiX22SoHmAph0XNximRzPcreTX0n4Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: a21ee594-5468-4607-9b6c-08df4c4c3f56
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB148960.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 06:04:07.6482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dt1NYP3IvBrBMdaWSIx8imbt2jTYgMFx0F72PIMgGo7N81DIV8znGGXUcQMFkW3DV8KyblTthDVmKRg+Uirxbp8KjwTe+o2QfG4igTIJltU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9397
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


On 10/23/2026 10:28 PM, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Include information about the VRR safe window in the CRTC state
> dump. Obviously the safe window changes dynamically depending
> on whether/when a push happens, but we can at least dump the
> vmin/vmax extremes. Avoids having to calculate these by hand
> while debugging things.
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   drivers/gpu/drm/i915/display/intel_crtc_state_dump.c |  3 +++
>   drivers/gpu/drm/i915/display/intel_vrr.c             | 12 ++++++++++++
>   drivers/gpu/drm/i915/display/intel_vrr.h             |  2 ++
>   3 files changed, 17 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> index c51b21222dc6..f07c64bbc8ba 100644
> --- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> +++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> @@ -314,6 +314,9 @@ void intel_crtc_state_dump(const struct intel_crtc_state *pipe_config,
>   	drm_printf(&p, "vrr: vmin vblank: %d, vmax vblank: %d, vmin vtotal: %d, vmax vtotal: %d\n",
>   		   intel_vrr_vmin_vblank_start(pipe_config), intel_vrr_vmax_vblank_start(pipe_config),
>   		   intel_vrr_vmin_vtotal(pipe_config), intel_vrr_vmax_vtotal(pipe_config));
> +	drm_printf(&p, "vrr: safe window start: %d, vmin safe window end: %d, vmax safe window end: %d\n",
> +		   intel_vrr_safe_window_start(pipe_config), intel_vrr_vmin_safe_window_end(pipe_config),
> +		   intel_vrr_vmax_safe_window_end(pipe_config));
>   	drm_printf(&p, "vrr: dc balance: %s, vmin: %d vmax: %d guardband: %d, slope: %d max increase: %d max decrease: %d vblank target: %d\n",
>   		   str_yes_no(pipe_config->vrr.dc_balance.enable),
>   		   pipe_config->vrr.dc_balance.vmin, pipe_config->vrr.dc_balance.vmax,
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index 3d31d37af4e2..d8f17a44dbe6 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -1303,6 +1303,18 @@ static int vrr_safe_window_end(const struct intel_crtc_state *crtc_state,
>   	return vblank_start - crtc_state->set_context_latency;
>   }
>   
> +int intel_vrr_vmin_safe_window_end(const struct intel_crtc_state *crtc_state)
> +{
> +	return vrr_safe_window_end(crtc_state,
> +				   intel_vrr_vmin_vblank_start(crtc_state));
> +}
> +
> +int intel_vrr_vmax_safe_window_end(const struct intel_crtc_state *crtc_state)
> +{
> +	return vrr_safe_window_end(crtc_state,
> +				   intel_vrr_vmax_vblank_start(crtc_state));
> +}
> +
>   int intel_vrr_vmin_safe_window_end_live(const struct intel_crtc_state *crtc_state)
>   {
>   	return vrr_safe_window_end(crtc_state,
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.h b/drivers/gpu/drm/i915/display/intel_vrr.h
> index 332f9b4a57cc..6f7b7e3e2902 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.h
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.h
> @@ -50,6 +50,8 @@ void intel_vrr_dcb_reset(const struct intel_crtc_state *old_crtc_state,
>   			 struct intel_crtc *crtc);
>   bool intel_vrr_always_use_vrr_tg(struct intel_display *display);
>   int intel_vrr_safe_window_start(const struct intel_crtc_state *crtc_state);
> +int intel_vrr_vmin_safe_window_end(const struct intel_crtc_state *crtc_state);
> +int intel_vrr_vmax_safe_window_end(const struct intel_crtc_state *crtc_state);
>   int intel_vrr_vmin_safe_window_end_live(const struct intel_crtc_state *crtc_state);
>   
>   int intel_vrr_dcb_vmin_vblank_start_next_live(const struct intel_crtc_state *crtc_state);
