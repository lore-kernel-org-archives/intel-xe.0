Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B1F6C61DD6
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 11:12:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF4410E561;
	Fri,  4 Sep 2026 11:12:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HCt64f9Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B5D10E561
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 11:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788520328; x=1820056328;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=X4kucMxWbeXdeOzQ+lq/nNv9y4s023fSf+F0hD8Ei9E=;
 b=HCt64f9Zqbd2VN3WMYAfwIGmfFJpLJc7V8/IZ8KFjpx7rf66NwGgovNC
 0y/O+spHVxI5uvU+XuCL/TtdZSHI5PR59LYsS6wApWm2sP9ca2ICqUmUX
 +ZDzmUqodiNO02Fztf3mnisVl4F4eRQiX4SarCF3u3/m01xQ+H/GxHOpf
 +nBoA+ipL9vg1kniujarXCJoGY4QTZQgzOmYu/PS9MBkailKEWepgvJkB
 MlH4J762olN+DNpu3IL2VY/bSsHYIZD4MiVyDAf8SXAzSpSda6ftBIt+L
 4mQspn2D5aBVF2JZzjp1ivyncOqbu/DZqRPr283O5Q5NvidSIYZf2o224 A==;
X-CSE-ConnectionGUID: U7Y0A7qVQpu7OV0vtsWecw==
X-CSE-MsgGUID: X6UfDnjwRmmJwwIvikUSxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="99349780"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="99349780"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 04:12:08 -0700
X-CSE-ConnectionGUID: q04HQZs9RwyDGi3kNARl+A==
X-CSE-MsgGUID: ndv2QRh+QiqMcj0P4w5jbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="273534551"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 04:12:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 04:12:06 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 4 Sep 2026 04:12:06 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.61) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 04:12:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LCsEgUhkZ63WqKuAHK3Q5EAZf1sf+5fS0V828TYdgm7dbPVbtX7u1UMmJw03l43lU5xCtneJiP1erDd2hyn9Dv8+Zw8KpeFmsIqAAsAxQ/xYq/mejdu967+fz8+LVhUi/R1iPxnIFlGzqb9R61q4oR6FSAiWa0PK2rVI2ht+rtVIzlbqYQMfBqIDMThex7WpVpHKykSpo9lkKc6YxRx3UEEgtaI5a5vOmt5NLHLByohfs80sJpRWTD8znBmfdWrZdHRfS+p/K6oW7H3FX7rSCeUb1WfNIpGxkxMhltA8zv6RKP5IlsMeRE5ay7AEtP66CVHG16cBRg9hJgz4N+SG9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gk3O0V2HjO+j37N5o/xKrhs/3gZ6E4bvwWw+9qSOi/A=;
 b=t8W/po8fnnhkWU5++rxQP5+WG0JfuwVweEKOduFn8wVW6n7OVjhTmA/lGZwX4dMBgcazvgKACudDQaM3/UKdY6NDRl8A7Q5JAZtNdPYTdbjq98mXcSkLavM6yjWUbesz19opdYr2oSUDhIKtf+bZD3Sbblln2BpnM9HJI7eFMEKfAtJpD8dFtc/E4Iho5V0tDtQNEhGk0WiKfKaU7xgLKDonrZZ38O84e/T4vHgch/hXtQorZV5Mps+W7uJ6q1nuz+SguoQulrXSnxNoBtS9pJ7lmtkC+e/mhZ42QPUIAiy4deQ9JSCmtlNKhMydN4Noq3ylV/UkT6AZDvOQOYf1dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MW3PR11MB4700.namprd11.prod.outlook.com (2603:10b6:303:2d::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.12; Fri, 4 Sep 2026 11:12:03 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 11:12:03 +0000
Message-ID: <f3d29b84-0849-4513-9a55-f6861e92c076@intel.com>
Date: Fri, 4 Sep 2026 16:41:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] drm/xe/sysctrl: Return error codes from
 sysctrl_wait_bit_clear()
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, <intel-xe@lists.freedesktop.org>,
 <rodrigo.vivi@intel.com>, <matthew.brost@intel.com>,
 <aravind.iddamsetty@linux.intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <karthik.poosa@intel.com>,
 <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <dnyaneshwar.bhadane@intel.com>,
 <anoop.c.vijay@intel.com>
References: <20260820101632.527214-9-mallesh.koujalagi@intel.com>
 <20260820101632.527214-10-mallesh.koujalagi@intel.com>
 <9894fca5-809b-4952-9edf-01b3d448d9df@intel.com>
 <3ae4858b-0bbb-4052-9c73-726643cf7266@intel.com>
 <292aaec1-662d-466a-83a6-dc820dace637@intel.com>
 <87216310-a723-43ce-ae62-6b85d2525bbd@intel.com>
 <e37b716d-3fcf-44b0-993c-70b39fe59951@intel.com>
 <d76a1ee0-7317-4cf5-b521-46cb9998fa88@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <d76a1ee0-7317-4cf5-b521-46cb9998fa88@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0042.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::9) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MW3PR11MB4700:EE_
X-MS-Office365-Filtering-Correlation-Id: c0d6820d-fbb5-4302-daca-08df0a75590d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|10067099003|3023799007|11063799006|4143699003|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: bd98LOBYY/HB5NwEOpdEiBfyl51uMBLWsO/TpNcYzvY4rFd4z2nmLkZ11HVqFrGxUg+Ou9WTOU3ZoxsMRblKXr6oPP6nWAIXrQr97UHbtACjnq2/rTORiD2haw/J1LmaVX9w3AGhPy6/t0rtMlEx8a8WBhBf9TBxhkmn0GFM1zji151u5hmVxx0dPHT7d7KRKb2mRUM4GDsiedD+SXYFj61CabYgGW15oQrUXCvBPxPlW/Sd/3jYHnQyCH20PVaiCpIFJicB8XQ/uzCYm5FM5fx+F7u0OpcQQkd/l3+HNspDQZftCYzau+d3V7aTIzBnQOTcbMLkE58TQhLUgBATHnRNKSm+spgmDpmjVprID7HVzLNaZO+IaWLcKt21YbZYy4IybPTUiq2bRUV9z3QcBeMra/7KRTKKgmfpavN7z8ip7vE4NoaLX7zegmvygxzQqQGtw414OBWJi9ynpy0se9K4WuPZuS83C55lzBCIiVIytMJcWo8RAwAxTQSVXraEZmCIyt+Jl3IiR4ZBOywspL0EUyMQOn/1ot9qAuqGcGO8fVAAblh3iTVmoQJcpmIcEMiDFVcpbVLATYTNBpV9TQg/jw9aDEa+0gfde4He80kpIQJAHGjL6lyKK/0VvoJQITvwL/Qz3xfb7QkclcbCsFvE1Rmhc/eGzWvATEMs6Ms=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(3023799007)(11063799006)(4143699003)(56012099006)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0R3OEhQSnNWMFVKbVdWYXJmZklBQ0cwYzYrSDF1Y2ZXYitYaWNyNEgxQW1I?=
 =?utf-8?B?M05yajB0OFlaMjArMVg3ZFQyR1krdVY3aXR4aDJBQmtQRytSNXVpZC9JSFFZ?=
 =?utf-8?B?a2JjSDVldWk0Rlp4WUFyTWNGbFRweVl2TS9lOE5aL1NiclF6QStrZVI1T21L?=
 =?utf-8?B?UHdkUStreHZnc0xlajRjTHNHNU81OHVoZnltMmpZWjJhYTh3azBFNU5GbGhX?=
 =?utf-8?B?TE1ERGU3T0ZLMVlwUVp4dHhEK0pmUXBmcWhPTDNteDIySVBBaXlCdGlEVGRu?=
 =?utf-8?B?UThYN1RBUGpNWDRuTXpPcHhGZURXSWxUeFZkd2U0OWtEdzZhZWNuZmNFbWUz?=
 =?utf-8?B?Q01Cd2dXczhIZWdjY0F5L3JqUnV3eFJIUVhKU1h4bUlzZ2Q2SUhMaWVIdldj?=
 =?utf-8?B?K3I5OXJBeXd2MXQ4T2d6b1dBcmFQZ01QUEZIY3JNak8yeXUvUVVwZlp6eVlQ?=
 =?utf-8?B?NC9iSXoxL05uT3htN3ZWUTVXMmlUUWx4S2R0L2ZoM2d6TWFxYjlrVytBVWsr?=
 =?utf-8?B?akxwMy81UjQvcytob0lmbDJGdmZYS1prZnIyMkJqVHIvbWY4N1ZiMXhLTFM5?=
 =?utf-8?B?OTNHOUZoRDlJdUhYSkNEemExQ3d3Z08wYS94QXJDVUJMa0ZhOHZ5UUtIMTZr?=
 =?utf-8?B?OXN3MmRpUk00TUVwUTJQaVhzRU1LUE4wc2pjdW1CUUZKRS9OYTUrcEZKWmNS?=
 =?utf-8?B?SmZ0SUtmOUlTeFVjZ2tmWEdIbWJmWEVFMXhsTk1ZejlhRXRobFpJMG43RXY1?=
 =?utf-8?B?NDBpc3NDby9PeWY1RGdOK0Ivd0x3ck1DRWRmTFhxZEhxeFNPVFVHYXJsQTk2?=
 =?utf-8?B?NFRqNDdjaVpPZnFpNjF4N2IzbHE2bFJQY293U0pBQWo0YndiME9MUFF4TFMr?=
 =?utf-8?B?em5RSU53R1dtWDNCV0s4Q2h4L2JPMWtwdHVZZS9ZcW9qM1NYcVJwd1lTOEoy?=
 =?utf-8?B?clRQWEp6M1p2Yy94aUpya2FQN0xQdUlwNldycGh2S2htWVRpYzdoUEcvNTEw?=
 =?utf-8?B?aXpzUDFBNy83eGNlaXl1ZWplcTlYUWZ1NUNPMVlXbWNiQlo0cGlOdkQzYmVB?=
 =?utf-8?B?TEhYWG1Hc21lVnpjNmVoYkpUZkdobnA4TjcxcXZqWXB4bDgweFkvSE83ajFD?=
 =?utf-8?B?ZmtsaXdUYTJsMWEvTmxWZklML0dDVHhydzY4Y1V5VVcwVkMveEk1UnczaHN1?=
 =?utf-8?B?TjA1MUk4TDl1UkJaVEhjYjljRzd1T0JPZS9ENUdxOEo0NFdtOWY1d01ETE16?=
 =?utf-8?B?czFWSnVSQjFneTllek1ycDV3WHNyb3h5MmtPQWhRV3pKbDRGdzhXTzNxMktG?=
 =?utf-8?B?L05WMEZOOUx6a1J3T2Y5N3k2WC9oUmhIenRGcktFSkxtU2ZZM2xQRXpMdk1R?=
 =?utf-8?B?RDNVV2YwNWowRUhWU2NTZ240dWdRM1FiQzhwV2V1QlpYY0g2bDRFOHpORFVG?=
 =?utf-8?B?dFU1YkloSlB4aERYeE1ySWticXVodHY0akg0U2tPbkRhTVVMcmFvMFVQZ2xh?=
 =?utf-8?B?bnhBQzU3S1dwekl6YWNTYVo2MU5mbDZ1bUJYVXRqYWlZTkVLRUFjWEZRdXNZ?=
 =?utf-8?B?eFJYSGtOZi9VMUJEM0p4b01jVXF5czJ5WWVZK2R1NVRkMTBrN0NYMkFsYStS?=
 =?utf-8?B?MkpHd21VVmhZWGNPVUxsd3J6ckVsOHdmSHdzTVY4WnJweWo3alc5aTg1K2gx?=
 =?utf-8?B?cmZ6L1RzVHpsbTNSekhYaGR2a2kvUDlIRTVFOC9ycXFhVW15QStJbW1EUzFr?=
 =?utf-8?B?cTA2RTdYdmRybDl2NEtKYW1QdlRiSzBlQ1VMalBqTVRzOFNTM2Y4YmNYTlBS?=
 =?utf-8?B?cFJkZ3FRY1BpeFUxV3RyZDNFOHF3Y1diNjJkakx1T0l5NGorRDlzWTNUU0F6?=
 =?utf-8?B?eTVpZVVtaFB3Uno5NWFEbDBSeDZjU3FxdjN2Y0Y4b3pIL2pBdkhZRXRyaXMw?=
 =?utf-8?B?YzhZZmhVV3gvZ2hLZUJ3blFZQ3BLYkhVSWRxTENmWklDR0ozMzdGMHdpWFJp?=
 =?utf-8?B?STlEM3ZMd1lOVElSQWd2TWNXN1NONzlGL2dxeFlvWngxY1hOaEpjaGN4REx1?=
 =?utf-8?B?bElha3FjWGdESnhMcUpkV2tvWDVBU1ZRZUdDOEdDV3UyUHR1ditrWW0ydnM4?=
 =?utf-8?B?bmozMlNEOE8zMnhGazNITnNlbjBScGZINjVyd1FmN04rbC9xQlJWY01kc1FC?=
 =?utf-8?B?S3p6aStueUVTZnVGSGpqVjJHL1F6WXhOUy96c2Y2YnMrK29LSnpod2p2V3FW?=
 =?utf-8?B?UTFOQzAwM2VsZThHQzNkMCtYMjMxU2J1VmIvNStLM3llU1lqZzlVR3pWZGda?=
 =?utf-8?B?Q245Nm5DRENlcURpOCtWUm1hNG80VzdrUU5sSzJKNXNTczArRXE5Zz09?=
X-Exchange-RoutingPolicyChecked: 5Qq0ZB9qVb5NVCFQm+No/6eg7D4SsIHq3Yf4iLKwey6Eyl4+9UUJau8l7a4jq613uQAVWXF8mgrUNIZCnW13fvmaV/Ac9GIOxyvkXXRbs2p4dK0oX3m4GoRCHjGGnjLxdu97qLFH1FfVfMYG0YytIUMCyhpiJmWf7OA+LlNCF1skMnzm2zotBsF1s20x1OnfQ2M9cVpsnrywYYuMpMO81a05bwVcmUkKpwhamoAlKqEyP1Dfz0M8LwtA5JkoYH1nY7iB8cU/bbekV61GnJBHkglMttVqsH0uhEKtH8cxH9hiF8yP3XizT5peqLUCL1HWz7FusrmFREQZsvKUJT3k4Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: c0d6820d-fbb5-4302-daca-08df0a75590d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 11:12:03.3022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /nwjQdgSFOx08x/cQXvCJLLWHOTzAzEkej1jmdYFbMNhXj/e9loJhMo9tzca5TUv2SgDnuJ8MWpLCXWB8c3DXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4700
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


On 04-09-2026 15:48, Mallesh, Koujalagi wrote:
>
> On 04-09-2026 02:36 pm, Tauro, Riana wrote:
>>
>> On 04-09-2026 13:55, Mallesh, Koujalagi wrote:
>>>
>>> On 25-08-2026 01:05 pm, Tauro, Riana wrote:
>>>>
>>>> On 24-08-2026 16:34, Michal Wajdeczko wrote:
>>>>>
>>>>> On 8/24/2026 7:44 AM, Tauro, Riana wrote:
>>>>>> Hi Mallesh/Michal
>>>>>>
>>>>>> On 20-08-2026 15:46, Mallesh Koujalagi wrote:
>>>>>>> Make sysctrl_wait_bit_clear() return an error code rather than a 
>>>>>>> bool.
>>>>>>> and update callers to use xe_log_err() with the propagated error 
>>>>>>> code.
>>>>>> Bit confused here on the usage of SIGID. My assumption based on 
>>>>>> documentation and discussion was
>>>>>> that SIG ID is only needed for error logs based on severity and 
>>>>>> requires a resolution which can be documented.
>>>>>> Am i missing something?
>>>>> from "How to pick a SIGID (the uniqueness rule)"
>>>>>
>>>>>   * A single underlying failure therefore legitimately produces a
>>>>>   * *chain* of reports from different layers, each with its own 
>>>>> SIGID -- e.g. a
>>>>>   * GuC communication failure is reported as %XE_SIGID_RUNTIME_FW 
>>>>> by the firmware
>>>>>   * path, the failed recovery as %XE_SIGID_GT_TDR by the reset 
>>>>> path, and an
>>>>>   * aborted bind as %XE_SIGID_PROBE by the probe path. That chain 
>>>>> lets triage
>>>>>   * follow a fault from origin to final effect; it is not a 
>>>>> duplicate.
>>>>>
>>>>> so in this case, some sysctrl timeout may eventually lead to a 
>>>>> reset and/or
>>>>> wedge and/or runtime-survivability-mode, and this intermediate FW 
>>>>> SIGID may
>>>>> help in any postmortem triage, and if we don't reach that final 
>>>>> state then
>>>>> we can still provide some generic resolution based on site and 
>>>>> errno (COLLECT)
>>>>
>>>> What if the paths are also used in non-critical scenarios for ex: 
>>>> sysctrl commands are used for
>>>> general counter telemetry, gpu health querying and firmware status.
>>>> Wouldn't this be lead to a lot of sigids in dmesg in case of some 
>>>> unrelated failure ..
>>>> Why not only add sigid for critical paths when we are sure it will 
>>>> cause a chain of failure
>>>> instead of these prints on every trivial command failure.
>>>
>>> Ops I miss this.
>>>
>>> I agree that we should not add SIGID for every minor or noisy 
>>> failure. The intent is not to log every non-critical cases,
>>>
>>> but to capture important intermediate failures that can help explain 
>>> the real root cause. If we log only the final critical
>>>
>>> failure, we may miss the earlier cases that actually caused the 
>>> issue. That makes triage and postmortem harder, since
>>>
>>> we lose visibility into how the failure occurred. The idea is to use 
>>> SIGID only for meaningful failure in key execution paths.
>>>
>>> Even when these failure are not fatal, they can provide valuable 
>>> context, make debugging easier and reduce
>>>
>>> mean-time-to triage (MTTT).
>>
>>
>> Suppose a user uses invalid entries for gpu health or counter 
>> management, won't we be polluting the dmesg
>> logs with sig id and cper logs unnecessarily since these are not fatal.
>
> No, we should not emit SIGID/CPER for bad user input  or invalid query 
> parameters in gpu health/counter management path.

But the system controller interface is same for all where you have added 
sig id logs. A failure in sysctrl_send_cmd or receive/send frames will be
displayed in general non fatal cases too. And it could be due to invalid 
request.

This is not a call chain that leads to a critical failure always. Need 
conclusion on this because one of my patch has a similar condition.

Riana

>
> These are usage errors, not real device or firmware failures.
>
>
> Thanks,
>
> -/Mallesh
>
>>
>> Thanks
>> Riana
>>
>>
>>>
>>>
>>> Thanks,
>>>
>>> -/Mallesh
>>>
>>>>
>>>> Thanks
>>>> Riana
>>>>
>>>>>
>>>>>> How do these errors indicate the need for a resolution.
>>>>>> Do we need it for all kmd logs with components or for errors that 
>>>>>> need a recovery or can be recoverable?
>>>>>>
>>>>>> Thanks
>>>>>> Riana
>>>>>>
>>>>>>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>>>>> ---
>>>>>>>    drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 26 
>>>>>>> ++++++++++++-------------
>>>>>>>    1 file changed, 13 insertions(+), 13 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c 
>>>>>>> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>>>>>>> index e13eebaac1d0..ef847f0a8f2c 100644
>>>>>>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>>>>>>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>>>>>>> @@ -11,6 +11,7 @@
>>>>>>>      #include "regs/xe_sysctrl_regs.h"
>>>>>>>    #include "xe_device.h"
>>>>>>> +#include "xe_log.h"
>>>>>>>    #include "xe_mmio.h"
>>>>>>>    #include "xe_pm.h"
>>>>>>>    #include "xe_printk.h"
>>>>>>> @@ -34,15 +35,11 @@ struct xe_sysctrl_mailbox_msg_hdr {
>>>>>>>    #define XE_SYSCTRL_HDR_RESULT(hdr) \
>>>>>>>        FIELD_GET(SYSCTRL_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
>>>>>>>    -static bool sysctrl_wait_bit_clear(struct xe_sysctrl *sc, 
>>>>>>> u32 bit_mask,
>>>>>>> -                   unsigned int timeout_ms)
>>>>>>> +static int sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 
>>>>>>> bit_mask,
>>>>>>> +                  unsigned int timeout_ms)
>>>>>>>    {
>>>>>>> -    int ret;
>>>>>>> -
>>>>>>> -    ret = xe_mmio_wait32_not(sc->mmio, SYSCTRL_MB_CTRL, 
>>>>>>> bit_mask, bit_mask,
>>>>>>> +    return xe_mmio_wait32_not(sc->mmio, SYSCTRL_MB_CTRL, 
>>>>>>> bit_mask, bit_mask,
>>>>>>>                     timeout_ms * 1000, NULL, false);
>>>>>>> -
>>>>>>> -    return ret == 0;
>>>>>>>    }
>>>>>>>      static bool sysctrl_wait_bit_set(struct xe_sysctrl *sc, u32 
>>>>>>> bit_mask,
>>>>>>> @@ -145,12 +142,14 @@ static int sysctrl_send_frames(struct 
>>>>>>> xe_sysctrl *sc,
>>>>>>>        struct xe_device *xe = sc_to_xe(sc);
>>>>>>>        u32 ctrl_reg, total_frames, frame;
>>>>>>>        size_t bytes_sent, frame_size;
>>>>>>> +    int ret;
>>>>>>>          total_frames = DIV_ROUND_UP(cmd_size, 
>>>>>>> XE_SYSCTRL_MB_FRAME_SIZE);
>>>>>>>    -    if (!sysctrl_wait_bit_clear(sc, 
>>>>>>> SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
>>>>>>> -        xe_err(xe, "sysctrl: Mailbox busy\n");
>>>>>>> -        return -EBUSY;
>>>>>>> +    ret = sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, 
>>>>>>> timeout_ms);
>>>>>>> +    if (ret) {
>>>>>>> +        xe_log_err(xe, SYSCTRL, ret, "Mailbox busy\n");
>>>>>>> +        return ret;
>>>>>>>        }
>>>>>>>          sc->phase_bit ^= 1;
>>>>>>> @@ -173,10 +172,11 @@ static int sysctrl_send_frames(struct 
>>>>>>> xe_sysctrl *sc,
>>>>>>>              xe_mmio_write32(sc->mmio, SYSCTRL_MB_CTRL, ctrl_reg);
>>>>>>>    -        if (!sysctrl_wait_bit_clear(sc, 
>>>>>>> SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
>>>>>>> -            xe_err(xe, "sysctrl: Frame %u acknowledgment 
>>>>>>> timeout\n", frame);
>>>>>>> +        ret = sysctrl_wait_bit_clear(sc, 
>>>>>>> SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms);
>>>>>>> +        if (ret) {
>>>>>>> +            xe_log_err(xe, SYSCTRL, ret, "Frame %u 
>>>>>>> acknowledgment timeout\n", frame);
>>>>>>>                sc->phase_bit = 0;
>>>>>>> -            return -ETIMEDOUT;
>>>>>>> +            return ret;
>>>>>>>            }
>>>>>>>              bytes_sent += frame_size;
