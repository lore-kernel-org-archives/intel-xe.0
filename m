Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAA9606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 16:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D/9TZSav
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3611112459;
	Thu, 29 Oct 2026 16:44:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 225E9112459
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 16:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793292235; x=1824828235;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=A1f7dbdWeSmqH0QgsoOPrQn4XVd3ltP65WYki5hfvKo=;
 b=D/9TZSavsn1liq2IzcO2asitkMfur6BhnJPemtZ4FgkoooX0GRXm67WN
 CFIGKJMQfIL6iJR2YpSgvq9MhXKWoym9cGSS7E+SSwqJEOz4bQSFLGbwf
 CLdV2Bt0z+EqCXd6izUEyumRods/Igl13PDW/OuMEknbRYNRdzS/9ygyQ
 C+evLXftw3Nu+fjv2i6l3PSucbhnJnnSwTgZOe0wNU5qHoSIEQf0m45bZ
 bczFMXJI9y0Cw8KZ35vB0J1wuhqhzA99hi3G3EGGVMnN4HZZ+lSBVA93O
 l/PyJM8HksF2XFvt+kh1RZOOUeSJE+euM+tyFIMG3A4ubYoNKNJznrFc6 g==;
X-CSE-ConnectionGUID: 58rEBPkcRBuGs3kQakRRHw==
X-CSE-MsgGUID: EbGV7ES5Q02RlE9GMyp1Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2058967"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2058967"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 09:43:55 -0700
X-CSE-ConnectionGUID: 5+vO+ROnSf27CzeKaeS3Cg==
X-CSE-MsgGUID: fWWBcXO5SYqaSr1lP6wivA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5217359"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 09:43:55 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 09:43:54 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 09:43:54 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.62) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 09:43:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TSOb8pSI+RoV1sEvjEorfm8TIwQ6x0d/+wzvyA5mYudmFjYmuiP0M0MP/bFBYVCCY/ThzoLmNbLCSaOF1kqPcKe9zRG4MNJlCGWizLBwTZBPScIvnN9oQzopAwvO8yU/15oVuA58f/A9nab1nfgjvDcWQk1FZxGBc5fpk9tCjDV0RzrrZn5hNGRVfxFZkUKZNgNi/4TTTzeAuMfIJTByiOXNcJe7HoH9z+Ot2GWH5GovoO5lYIkR3g+yv72jvJZ286OZJWEtFWFCg/KBphBsyJsfCa8zazKF8KGiAWeN2NAIW/mc23brvcA2Bgrs9Xh24USs11B9Xfx6aRVSwCFpKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fU/yMVgHJc7HtcfhjoJSpTYDbWHMakKHTytbknp8ux4=;
 b=yYVZwojJxEG5meNge+fjZBsiFukAyj5g3PhwmBoGNPWAOkzlpBpIBK2vD1W0atVfAj56ws9BZjhrRHo8u1ICubYyZbW/HXXmlxYM/Uv/3MzhbLBO2+AtlE0zJzpB4gYUuaPHtjjPvojkUv8uBU5KFVtTYhZCK2tThaTM07JNLDLArfvffUg2GpmQ/8MLAGGUSbe1oNkk6e5mOFOrCi+SABnS3yU37QYVqNey1qY6QoLoO7YUzq6J0N4cSzQCAVv+FsJOC9y1XhP3q+GgR6fmIWu3EOJW1XZrxndKEza5hxu4d4kYk16xoSMwuhuxnxy3R0HF1EtpwppwNnvPF0Y1Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 by IA3PPF4F834DF7A.namprd11.prod.outlook.com
 (2603:10b6:20f:fc04::c6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Thu, 29 Oct
 2026 16:43:49 +0000
Received: from CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc]) by CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc%7]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 16:43:49 +0000
Message-ID: <da374559-aaab-4d0a-be4d-1e75e42fc8dd@intel.com>
Date: Thu, 29 Oct 2026 09:43:47 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] drm/xe/xe_late_bind_fw: Add support to load Ocode
 firmware
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <michael.j.ruhl@intel.com>, <alexander.usyskin@intel.com>,
 <anoop.c.vijay@intel.com>, <shamim.begum@intel.com>,
 <kelvin.gardiner@intel.com>
References: <20261028181951.1093283-7-badal.nilawar@intel.com>
 <20261028181951.1093283-10-badal.nilawar@intel.com>
Content-Language: en-US
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20261028181951.1093283-10-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P220CA0165.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::14) To CO1PR11MB4979.namprd11.prod.outlook.com
 (2603:10b6:303:99::16)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4979:EE_|IA3PPF4F834DF7A:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dba927e-b31f-4dc1-832b-08df35dbce7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|22082099003|261026121527099003|18002099003|10067099003|261026135527099003|56012099006|11063799006|4143699003|261028144727099003|261009221227099003|261021133027099003|261022115727099003|261022075727099003|261021135927099003|261021130227099003|261022113327099003|261021123027099003|261022105027099003|261021121427099003|261009223027099003|261026140227099003|261026130827099003;
X-Microsoft-Antispam-Message-Info: p+xDzMtWir/n7t4hnNpFOWtpe8Qq4PxvvgbRNI56EZNAFFg5+E06t87poZDc/Id9/FMtptsF0qlia4XqNuKymyKGY5r69yEIuptMlsp9y6omLTM5h9BS35YHbWaA5nb7BhjLYE6qNmmrLQnSUvzaFbqa6f3uiIm8vxfunbMmMsMjauITa5gUZKRtqEsS4uFzwSbzXcDuxOl50l5NCeetdhfhupwb1Lx8VDEkBxs5LJSyE2Q54Q6bI78lNVhD35VbXwLOCwTaswFgDWkzKLTHRT1ZSvcDNI03xNbBUgK7+JSEbf9ne+zyYND7NCLA2Ht+9qSHa11NXJtGzegRAWkj/mTdyH6xPmCWp3dHLJ9IBW+sLbkEm0SI7tAoY4fVakuccweXbYWhlYrms6kwLy2bnlV/BcMaSuZ89vZHoV+P1ZoOzcloLfn4th8kEdl7ALWwkUJdFYvmMaOINAcfxcBMh9e4hD3rjoEkenNiubtKCln+thXjkNuoOjR81wgPA9Ud/qKshwUSyZyRbE8DLvO4LY9/+FNQz3hiNVjFww27J5G+ZAWqtWiJNypq0tcfYflY9XNu1cgQwvq3Dc9Oyl9mWt5hht2EMrRrVg6GdgWobv0Unntf53nZJWr/OjEoEOVJ6nBOrmywewVVGtlYyT9FPAlTjuSZMzVtTwQwZW5InrI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(22082099003)(261026121527099003)(18002099003)(10067099003)(261026135527099003)(56012099006)(11063799006)(4143699003)(261028144727099003)(261009221227099003)(261021133027099003)(261022115727099003)(261022075727099003)(261021135927099003)(261021130227099003)(261022113327099003)(261021123027099003)(261022105027099003)(261021121427099003)(261009223027099003)(261026140227099003)(261026130827099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHU4cXoxVjA0N21HK215SGMwVWlQNUZkRjZPWnFndkNrUVhhclhuR1RYWW10?=
 =?utf-8?B?NHk4R3J4L0drbDB3ei9aRXp3Q1o3VVNLamE4anl3Um1WTWh3VjE3eTJIMGZt?=
 =?utf-8?B?ekxYRUl0ejBndkpjS0RwQWZKYnNaSEZMT0pZQm9OTmRoRndicEpkdVpVd1Uv?=
 =?utf-8?B?dVRzdkQ2SUd0L1BMOHNqeXF1TklnRmtSZVNZNnJhSlIxWGdqVlZsQ0hYQWJl?=
 =?utf-8?B?K3ZLaHBVem9QdGM2aUl1eTlxd24zN29tQlJjQWg1L2R2ZGdPZThCWG5yRXFU?=
 =?utf-8?B?RnJvUTFrbkJ2ZlhJRm1tRFpRV1gvSFd1eW5BbVQ2aER1NkJHUzByUG1vUm4z?=
 =?utf-8?B?ZHpEUjlOSzJzbFVqcDk5ZVkrTW14NVF3em1rTks1Y215cFRpMHNxdktXRnkx?=
 =?utf-8?B?VWFiOUxaeW9DWjBmRXFOV1JTblM3L01uRm8vay9ndi9UQk00d2Fzc3M0aFNU?=
 =?utf-8?B?Ykxod2ZGdjFWYXlBNkpZU05DVjNiaVNiTmVtQS9va0pVZWpkLzJaOXdvWlN6?=
 =?utf-8?B?ZTNaK2JFOTZDNTh5dW5DODYyRFIyTGpyTFlhMU1EbTlMS3RiYWZDeVVlZVY3?=
 =?utf-8?B?YWZPdkVJZmk1andvM1VmaFhrUXNaU2tLOVBwUHlHTTQrTW9ic1VJMFI3Uzlw?=
 =?utf-8?B?L2NLSmhsQjFCV1dJK3lGSTRwS2Y4ODBIMlhlOUNUb3pvcVE5VUY0bFJTTW9G?=
 =?utf-8?B?YWdSWTEwcjkvTzB4ZjRPaTY4cFdlY0V4L1ZaTThkbHA1VEpjYWFWOGI0d1Jx?=
 =?utf-8?B?cGMzM1JHQWZsS1ZFQ2Z1YXVXa01sTkZvYUwyVy9icUpvMGxlMzhYY0I4YjB1?=
 =?utf-8?B?SldkQjZtbjh5ejRtc29oNC90cHZraElGRTdJcm5rV1FDRE5jM0VSZ2VSSE9K?=
 =?utf-8?B?d1FzWEp3b29UUTgrdmlxaWRyd2loeXhYTkNMR1gwdUNSc1h6V0s2VS92T1Vh?=
 =?utf-8?B?citKMUJ3VGIvcmM2cW5yTEVrV1dFeFpkbUhFM3l2OFJKS3hXU1ZQcERZcEpJ?=
 =?utf-8?B?MjRPejNua0ltc01zaVRKR0xUUHhQekNYUDVrdjE0SHBTWDAvTmx0QkZ2RU1U?=
 =?utf-8?B?d29NWkV5cS83aG9mTHF0M3lQNFNOQnNrZ3lSVExRSlptS24vRzdBaVk2UU0w?=
 =?utf-8?B?QlIxTVdsUGZVUTNPdjQ0RC9PUlkyUVhoS3N1UDJSU3BZcTZ5cUpVZE1SelVR?=
 =?utf-8?B?dnZxM3RqQmVxT0dua0xiM1ppTmdZRTlEY1RMb1Y0SXB4QU4wU1VPQXYySEIv?=
 =?utf-8?B?bzBvM3VHRFdKTks0VlZ1TnJlTUpvZ3k1QVh1Z1AvQ3BiS3dhNFAzMUhLME1m?=
 =?utf-8?B?QUI5U2UxNWVRYzh3cElRdnM0WGh0ZkhTcWttZ3VMdndYRGQ3aGNia00yUTZs?=
 =?utf-8?B?NFJzbXQyTC8rVHlvdHFZTHh2TldWS1FOYWdOVDdTNDdZWTdGbGl4ckMydytv?=
 =?utf-8?B?VFBOQ3h1bTJycUhwWk45VHVCaWl3dVpnS2VBalFYTHcwMXFLOVRMRWJIRVdw?=
 =?utf-8?B?VW1NclgxOU11bVRNaUJSamxxOFM0RE5tdjQ2OEJDV08vS1hxMWZrTE5jQnVW?=
 =?utf-8?B?Y21ZMTNMNWF3ODFOaFBGRkEwaGJDTHhVZUd1bTFPYXloRDVxZVoyVE9iNVVm?=
 =?utf-8?B?LzltNnJqbDFDMTZBZlBNWGJwVzBUekIxYXdKS1FwbytBSE5iUmxTeG9LUmNi?=
 =?utf-8?B?aXFCL2tHNGRTRVV4R1YzUWUwbmxPVG4yMGVsOGFla0c3Mm9paVlOTmRTWE9a?=
 =?utf-8?B?OEQ5TXZncEdwajJTdXZxMDRZa3AycWZtQTRqSGxpcEZVdFlhSndjYWtpbU9o?=
 =?utf-8?B?MjZ0Z0dIYmdaaEZlR1JJcjZ1VnJrb2VvRDdZNFRTekpRM3hVdzRZWENzakp6?=
 =?utf-8?B?WCtDZzZGR2llNnVRa2U4ZzRLN0RQNDBVUDFkdlE4dnJyUGt1TmlUQXZldEw0?=
 =?utf-8?B?Q1Irc3lyaUZqdGplRlk0dkhmelFMVS80UjNURmtCVGVBcWE5RG5LK3hoenpZ?=
 =?utf-8?B?TThPR0gwejBaY3grMnRoWFNIUU5ac0Z4SVB0Y00wTWdZaWJXQWtRSklqeThV?=
 =?utf-8?B?RUVlWStXUXJhVUFsQjNqZVVBWkRXejVGbjRTRmxUalJSdjZsMWNRY0ZKOFhW?=
 =?utf-8?B?eDJ3dk5udVZEOWV1N2l6T3JaSGd1bFd5VDZoZ212eFpGKzVDUHA2TW9FQitL?=
 =?utf-8?B?N2VZd2IyNTJWSnRjRW9pWXJNcUVTb1BMNlBXTFNRbXk0dHFBNVNIYjBGZEt1?=
 =?utf-8?B?a0JsMlNobWRxZEZoYnVrVkk2OWp3aEZreTgyeC85Y05nMG5COXpvdit0c2x1?=
 =?utf-8?B?aFhhVHBQdTZEbi9hZzZIdFRlamZ5bVpoT1ZCUXZzUEtsL2ZPcjk2ZGpzbW52?=
 =?utf-8?Q?ef5uA5Fl8eQ0Atec=3D?=
X-Exchange-RoutingPolicyChecked: iGryCFH7GpaAMX86tlaM2P5TXMEo+V5VNJQ9YGlFf2sjfOlsnMKqmYnR7SdhGmZt5mamHD6fWkcoY8SjdVbS5bGgJ88BvLGWcyi3qnNnGTMcT3FdYd5Q/XVHOK1fASjRn2nPVjhkDMYrM1uZdNHZa7GKjRMmXmr//0LDrweckKaWhmUSWgSHjqQM4CT44K/yD0vp7efT5c3HiRlv0vI5yZ2SP/V/awctFpPriQiTSbudmP7jjX+kvc82iUauKaSlE04JVUwyYoXjLf4aXcpbwaN5h2sgoZL8lbzDusHuYrM4zANIR4Q7jj+uI0tg1tFu5mpEWupFvoVOHwR9TKihmg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dba927e-b31f-4dc1-832b-08df35dbce7f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 16:43:49.0481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S+Y6pI426WWdqB9DOKmt0B8m4GfkpACyco4GUSwgbyDyY30L2Rq0cK2VzvwDwfbpugeSHoYGHKc+pD/RLz8SXgEuVHFiky/lfb0DwUDJ7sk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PPF4F834DF7A
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



On 10/28/2026 11:19 AM, Badal Nilawar wrote:
> Enable loading of Ocode, the legacy OOBMSM firmware, through the
> late binding flow. The payload size check is no longer needed as
> late binding supports larger payloads.
>
> Ocode may not remain backward compatible across IFWI updates. Query
> the SDK API version from the System Controller mailbox and load the
> corresponding xe/cri_ocode_<ver>.bin. Skip loading the firmware if
> the SDK API version in its manifest does not match.
>
> Assisted-by: LLM
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/abi/uc_fw_abi.h            |  3 +-
>   drivers/gpu/drm/xe/xe_late_bind_fw.c          | 76 ++++++++++++++++---
>   drivers/gpu/drm/xe/xe_late_bind_fw_types.h    |  6 +-
>   drivers/gpu/drm/xe/xe_sysctrl.c               | 32 ++++++++
>   drivers/gpu/drm/xe/xe_sysctrl.h               |  1 +
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 12 +++
>   6 files changed, 117 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/abi/uc_fw_abi.h b/drivers/gpu/drm/xe/abi/uc_fw_abi.h
> index 198e949660e0..ef734825d949 100644
> --- a/drivers/gpu/drm/xe/abi/uc_fw_abi.h
> +++ b/drivers/gpu/drm/xe/abi/uc_fw_abi.h
> @@ -331,7 +331,8 @@ struct gsc_manifest_header {
>   	struct gsc_version meu_kit_version;
>   	u32 meu_manifest_version;
>   	u8 general_data[4];
> -	u8 reserved3[56];
> +	u16 sdk_api_version;

As far as I can see from the specs, what we actually have here is a 
u8[24] field which is reserved for data that is specific to the type of 
FW the header belongs to. Since this is the generic header definition, 
it needs to reflect that and not the ocode-specific usage of that field.
We have something similar in the css header, where one chunk of it is 
different between GuC and HuC (see uc_css_guc_info). Following the same 
approach we used there, we could do something like:

struct ocode_manifest_data {
         u16 sdk_api_version;
         u8 reserved [22];
}

and then in gsc_manifest_header you can have:

struct gsc_manifest_header {
         [...]
         union {
                 ip_specific_data[24];
                 struct ocode_manifest_data ocode_data;
         }
         [...]
}

> +	u8 reserved3[54];
>   	u32 modulus_size; /* in dwords */
>   	u32 exponent_size; /* in dwords */
>   } __packed;
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> index 881a46abc4f5..39c47b743edc 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> @@ -17,6 +17,12 @@
>   #include "xe_pcode.h"
>   #include "xe_pcode_api.h"
>   #include "xe_pm.h"
> +#include "xe_sysctrl.h"
> +
> +/*
> + * TODO: Add MODULE_FIRMWARE() for xe/cri_ocode_<ver>.bin once the
> + *       Ocode firmware binary is available upstream.
> + */
>   
>   /*
>    * The component should load quite quickly in most cases, but it could take
> @@ -33,10 +39,12 @@
>   
>   static const u32 fw_id_to_type[] = {
>   		[XE_LB_FW_FAN_CONTROL] = INTEL_LB_TYPE_FAN_CONTROL,
> +		[XE_LB_FW_OCODE] = INTEL_LB_TYPE_OCODE,
>   	};
>   
>   static const char * const fw_id_to_name[] = {
>   		[XE_LB_FW_FAN_CONTROL] = "fan_control",
> +		[XE_LB_FW_OCODE] = "ocode",
>   	};
>   
>   static struct xe_device *
> @@ -104,6 +112,7 @@ static int parse_cpd_header(struct xe_late_bind_fw *lb_fw,
>   	manifest = data + offset;
>   
>   	lb_fw->version = manifest->fw_version;
> +	lb_fw->sdk_api_version = manifest->sdk_api_version;
>   
>   	return 0;
>   }
> @@ -179,6 +188,34 @@ static const char *xe_late_bind_parse_status(uint32_t status)
>   		return "Invalid Payload";
>   	case INTEL_LB_STATUS_TIMEOUT:
>   		return "Timeout";
> +	case INTEL_LB_STATUS_INTERNAL_ERROR:
> +		return "Internal Error";
> +	case INTEL_LB_STATUS_INVALID_FPT_TABLE:
> +		return "Invalid FPT Table";
> +	case INTEL_LB_STATUS_SIGNED_PAYLOAD_VERIFICATION_ERROR:
> +		return "Signed Payload Verification Error";
> +	case INTEL_LB_STATUS_SIGNED_PAYLOAD_INVALID_CPD:
> +		return "Signed Payload Invalid CPD";
> +	case INTEL_LB_STATUS_SIGNED_PAYLOAD_FW_VERSION_MISMATCH:
> +		return "Signed Payload FW Version Mismatch";
> +	case INTEL_LB_STATUS_SIGNED_PAYLOAD_INVALID_MANIFEST:
> +		return "Signed Payload Invalid Manifest";
> +	case INTEL_LB_STATUS_SIGNED_PAYLOAD_INVALID_HASH:
> +		return "Signed Payload Invalid Hash";
> +	case INTEL_LB_STATUS_SIGNED_PAYLOAD_BINDING_TYPE_MISMATCH:
> +		return "Signed Payload Binding type Mismatch";
> +	case INTEL_LB_STATUS_SIGNED_PAYLOAD_HANDLE_SVN_FAILED:
> +		return "Signed Payload Handle SVN Failed";
> +	case INTEL_LB_STATUS_DESTINATION_MBOX_FAILURE:
> +		return "Destination MBOX Failure";
> +	case INTEL_LB_STATUS_MISSING_LOADING_PATCH:
> +		return "Missing Loading Patch";
> +	case INTEL_LB_STATUS_INVALID_COMMAND:
> +		return "Invalid Command";
> +	case INTEL_LB_STATUS_INVALID_HECI_HEADER:
> +		return "Invalid HECI Header";
> +	case INTEL_LB_STATUS_IP_ERROR_START:
> +		return "IP Error Start";

As far as I can see the defines for those status code are already merged 
to the mei header, so adding the extra logs for them could be split to 
their own patch to keep this one focused on the ocode fetch and sdk 
comparison.

Daniele

>   	default:
>   		return "Unknown error";
>   	}
> @@ -298,6 +335,7 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
>   	struct xe_late_bind_fw *lb_fw;
>   	const struct firmware *fw;
>   	u32 num_fans;
> +	u16 sdk_ver = 0;
>   	int ret;
>   
>   	if (fw_id >= XE_LB_FW_MAX_ID)
> @@ -320,9 +358,23 @@ static int (struct xe_late_bind *late_bind, u32 fw_id)
>   			return 0;
>   	}
>   
> -	snprintf(lb_fw->blob_path, sizeof(lb_fw->blob_path), "xe/%s_8086_%04x_%04x_%04x.bin",
> -		 fw_id_to_name[lb_fw->id], pdev->device,
> -		 pdev->subsystem_vendor, pdev->subsystem_device);
> +	if (lb_fw->type == INTEL_LB_TYPE_OCODE) {
> +		/* Get SDK API version */
> +		ret = xe_sysctrl_sdk_api_version(xe, &sdk_ver);
> +		if (ret) {
> +			drm_warn(&xe->drm, "Failed to get OCODE SDK API version: %pe\n",
> +				 ERR_PTR(ret));
> +			return 0;
> +		}
> +
> +		snprintf(lb_fw->blob_path, sizeof(lb_fw->blob_path),
> +			 "xe/cri_ocode_%u.bin", sdk_ver);
> +	} else {
> +		snprintf(lb_fw->blob_path, sizeof(lb_fw->blob_path),
> +			 "xe/%s_8086_%04x_%04x_%04x.bin",
> +			 fw_id_to_name[lb_fw->id], pdev->device,
> +			 pdev->subsystem_vendor, pdev->subsystem_device);
> +	}
>   
>   	drm_dbg(&xe->drm, "Request late binding firmware %s\n", lb_fw->blob_path);
>   	ret = firmware_request_nowarn(&fw, lb_fw->blob_path, xe->drm.dev);
> @@ -332,17 +384,17 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
>   		return 0;
>   	}
>   
> -	if (fw->size > XE_LB_MAX_PAYLOAD_SIZE) {
> -		drm_err(&xe->drm, "Firmware %s size %zu is larger than max pay load size %u\n",
> -			lb_fw->blob_path, fw->size, XE_LB_MAX_PAYLOAD_SIZE);
> -		ret = -ENODATA;
> -		goto release_fw;
> -	}
> -
>   	ret = parse_lb_layout(lb_fw, fw->data, fw->size, "LTES");
>   	if (ret)
>   		goto release_fw;
>   
> +	if (lb_fw->type == INTEL_LB_TYPE_OCODE && lb_fw->sdk_api_version != sdk_ver) {
> +		drm_warn(&xe->drm, "%s late binding fw: SDK API version mismatch %u != %u\n",
> +			 fw_id_to_name[lb_fw->id], lb_fw->sdk_api_version, sdk_ver);
> +		ret = 0;
> +		goto release_fw;
> +	}
> +
>   	lb_fw->payload_size = fw->size;
>   	lb_fw->payload = drmm_kzalloc(&xe->drm, lb_fw->payload_size, GFP_KERNEL);
>   	if (!lb_fw->payload) {
> @@ -355,6 +407,10 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
>   		 lb_fw->version.major, lb_fw->version.minor,
>   		 lb_fw->version.hotfix, lb_fw->version.build);
>   
> +	if (lb_fw->type == INTEL_LB_TYPE_OCODE)
> +		drm_info(&xe->drm, "%s firmware SDK API version %u\n",
> +			 fw_id_to_name[lb_fw->id], lb_fw->sdk_api_version);
> +
>   	memcpy((void *)lb_fw->payload, fw->data, lb_fw->payload_size);
>   	INIT_WORK(&lb_fw->work, xe_late_bind_work);
>   
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> index ee5efe60774e..c7b3ffc743cf 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> @@ -13,14 +13,14 @@
>   
>   #include "abi/uc_fw_abi.h"
>   
> -#define XE_LB_MAX_PAYLOAD_SIZE SZ_4K
> -
>   /**
>    * enum xe_late_bind_fw_id - enum to determine late binding fw index
>    */
>   enum xe_late_bind_fw_id {
>   	/** @XE_LB_FW_FAN_CONTROL: Fan control */
>   	XE_LB_FW_FAN_CONTROL = 0,
> +	/** @XE_LB_FW_OCODE: Ocode firmware */
> +	XE_LB_FW_OCODE,
>   	/** @XE_LB_FW_MAX_ID: Number of IDs */
>   	XE_LB_FW_MAX_ID
>   };
> @@ -45,6 +45,8 @@ struct xe_late_bind_fw {
>   	struct work_struct work;
>   	/** @version: late binding blob manifest version */
>   	struct gsc_version version;
> +	/** @sdk_api_version: late binding blob manifest SDK API version */
> +	u16 sdk_api_version;
>   };
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
> index 4067e1dfdcd5..27a59e8e4487 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
> @@ -217,3 +217,35 @@ bool xe_sysctrl_is_diag_fw_ready(struct xe_device *xe)
>   	return xe_sysctrl_check_app_status(xe, XE_SYSCTRL_APP_DIAG) ==
>   	       XE_SYSCTRL_FIRMWARE_APP_INITIALIZED;
>   }
> +
> +/**
> + * xe_sysctrl_sdk_api_version - Get SDK API version
> + * @xe: Xe device
> + * @version: SDK API version
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int xe_sysctrl_sdk_api_version(struct xe_device *xe, u16 *version)
> +{
> +	struct xe_sysctrl_sdk_api_resp resp = {};
> +	struct xe_sysctrl_mailbox_command cmd = {};
> +	size_t out_len = 0;
> +	int ret;
> +
> +	xe_sysctrl_create_command(&cmd, XE_SYSCTRL_GROUP_CORE, XE_SYSCTRL_CMD_SDK_API_VERSION,
> +				  0, 0, &resp, sizeof(resp));
> +
> +	ret = xe_sysctrl_send_command(&xe->sc, &cmd, &out_len);
> +	if (ret)
> +		return ret;
> +
> +	if (out_len != sizeof(resp)) {
> +		xe_err(xe, "sysctrl: unexpected SDK API version length %zu (expected %zu)\n",
> +		       out_len, sizeof(resp));
> +		return -EPROTO;
> +	}
> +
> +	*version = resp.sdk_api_version;
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
> index b69a3f474236..c0b6d4330c88 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.h
> @@ -22,5 +22,6 @@ void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl);
>   void xe_sysctrl_pm_resume(struct xe_device *xe);
>   bool xe_sysctrl_is_oobmsm_fw_ready(struct xe_device *xe);
>   bool xe_sysctrl_is_diag_fw_ready(struct xe_device *xe);
> +int xe_sysctrl_sdk_api_version(struct xe_device *xe, u16 *version);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index 1f3f782d770e..cdacceebca06 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -57,10 +57,12 @@ enum xe_sysctrl_gfsp_cmd {
>    *
>    * @XE_SYSCTRL_CMD_LOOPBACK: Loopback test command
>    * @XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID: Retrieve application status by ID
> + * @XE_SYSCTRL_CMD_SDK_API_VERSION: Get SDK API version
>    */
>   enum xe_sysctrl_core_cmd {
>   	XE_SYSCTRL_CMD_LOOPBACK				= 0x03,
>   	XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID		= 0x05,
> +	XE_SYSCTRL_CMD_SDK_API_VERSION			= 0x06,
>   };
>   
>   /**
> @@ -126,6 +128,16 @@ enum xe_sysctrl_fw_status {
>   	XE_SYSCTRL_FIRMWARE_COMM_FAILURE,
>   };
>   
> +/**
> + * struct xe_sysctrl_sdk_api_resp - Get sdk api version response
> + */
> +struct xe_sysctrl_sdk_api_resp {
> +	/** @sdk_api_version: SDK API version */
> +	u16 sdk_api_version;
> +	/** @reserved: Reserved for future use */
> +	u16 reserved;
> +} __packed;
> +
>   /**
>    * struct xe_sysctrl_mailbox_command - System Controller mailbox command
>    */

