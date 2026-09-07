Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5303EC79FA1
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 15:48:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFA4810E8A2;
	Mon,  7 Sep 2026 15:48:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kGrHtLo1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E64A210E8A9
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 15:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788796109; x=1820332109;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=B/UkzMb5ujSyFJ3k0hplqBUyT7pztJb1dxB11vCPHz8=;
 b=kGrHtLo16qA1KAHqWV2BlWHOpOol90fruKZX/dZ/BcXcA5oxvbeI2VA3
 4ZsZMwEtz1LuRc1HP72WhMg9uAJAo2SoD1Q2Ufi0lqv3Pamt5dW/nIrAV
 C82jS/kfhjWYii7lVS2ZtFhWhw4tz4s+CB3QPbdRPuZ4t5fQmBfM6jZGp
 za4fObWJqkBEXNfWBQ4d9dnJsg8NFZq8oRN+ju6xiNBRuXnTcpuMl7+z8
 fV0Rp4AUjB/mk8BkxSmzKD0N55vTnDykDTq1xm7Bww3EGIXMSgViTArP1
 0APZ5s0ekLdn9X3+9bJB4uIryRo9c3W9fzy3c36MDif4Ify+OxHnof6S3 Q==;
X-CSE-ConnectionGUID: dqx/kjMdRHS+zmafAsJizA==
X-CSE-MsgGUID: T5AXnLJLREKW75wyQAF1vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89248921"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="89248921"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 08:48:28 -0700
X-CSE-ConnectionGUID: mP9p0NJMS9e2O2D/7GCLiw==
X-CSE-MsgGUID: UyZzw57nSDGebUXabkGIyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="270231562"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 08:48:28 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 08:48:27 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 08:48:27 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.33) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 08:48:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oaHoYepu4oLad/+17Bfko/TshYEhgSmbYNdv9z5H6DiSlEDU/PuIva3TmY4oVAthqY1up9CHVYb7vVJYbtj6Kg6AYuRoYMoMkSYjoLa3h2Jh2qkvTa54qUmu0CNKZU2Uc4OImDeoe9YTAtmKzWvLdfW6QpUyH5mI/B3AXumRegf7+ORep02D+123ZtLpozEHmH7LMGfyTSRosCyqQDLoC0WEy2m8jO4EQiI5jIw61kyVur/eTDNB29JDV/G7ocBgTalGeHKcvDDONvVv01rvha/h9Wv0y3wmeobXJlC2evuKiOz8FNRpq4Eh6dOX+akJ5TD9KGEXS7oyGiKzX+kZvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nZFJv1U7as4i60DETnc7SxQPEpVgh8AOopAnGcSqNes=;
 b=ZjP7oTj8KcpUWkNPevqathGb3mR3OOqrGJ90mqDM3HEXPT/D2OOkERdJCiE2HdBsyBARsSrXTEOgK5reuYCyiohddFIRzo8nGbFjL3XwUb4rG74UOnknaPV3zuX8RgLexYyOoZhcvGsS9I/7llLLXjVHHo4b0OnAoroOlh5hTDuAfWBAseoObJrIHqyS9ZvIqOtjeciiObWJN2XYIMJPgtK6zYh1v7PfUXDM4cR8FTTTgbwNJN9kcH7B8ZTUcMR4RSDG9wchDz6AK0VwmfLu/rLV6gfr9PApdhh8HTE7AQU0aaOQm9qrevqOprWxcI+LMwjGQYF69eLDtNdR8r6Gdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by IA1PR11MB7811.namprd11.prod.outlook.com (2603:10b6:208:3f9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 15:48:19 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 15:48:19 +0000
Message-ID: <b1ac6708-86e1-4c26-858b-5343b075bbf9@intel.com>
Date: Mon, 7 Sep 2026 17:48:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/cri: Expose device UUID through sysfs
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "Jadav, Raag" <raag.jadav@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>, "Koujalagi, Mallesh" <mallesh.koujalagi@intel.com>,
 "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>,
 "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
References: <20260904160608.2004174-4-badal.nilawar@intel.com>
 <20260904160608.2004174-6-badal.nilawar@intel.com>
 <65b77b6b-a21f-4631-9cb3-a5c0e07645c5@intel.com>
 <5ac64235-025a-48c9-ac18-893fcfd6db6a@intel.com>
 <01acf34a-3231-45c7-b8ce-e70ead34a44d@intel.com>
 <BN9PR11MB5242477CE55973FF7BD0720A95B22@BN9PR11MB5242.namprd11.prod.outlook.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <BN9PR11MB5242477CE55973FF7BD0720A95B22@BN9PR11MB5242.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR09CA0130.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::14) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|IA1PR11MB7811:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bfcb4af-9fe1-407a-d274-08df0cf7709f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|6133799003|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: iONcELuBdg5Xes69/CpuPtJjzJTzRQQx9oyQoLA81KDvDoVCuu9Vl6DMrzfRt7XYVXBZq40t7O6HS87asf5GEKWebFc8zMIc7Bznzfw4olemz3byL5SdxxPOZpF+9N4T5pZHBpbMO4+OvnLjBpe+qe/gqeJb8Me5PQyBVNPOJXoHmtTRa6GwQ/HG8Lf+AY8Y1miTmOjV1J8mSv404yhETos2tfMjmFyPps1gCrCOi1GL0B/Lb9Lp0lII81+JKfui/afJrADJKUiuVyWfTdrBDAxxzClNlE3+lcxuc2gW8lZ965UaiwlBd6KDM9elXl7S+u0jjEoG1wy1pSChzsAsESob3ejTclJneGDPRZJ0q3JyX4XcZQb9K2xaFhgtVKKFyqs3z1d2TrF+yuTFY9xYWzxVsGwa4Hk1Es9EW947rw1CJgLvb30mlVt7hnFolVJnIEdMZ4e3OxD2RedgeABy/jp1LIfkNJuydFkB22ecwfeZbZK5AkAQvbAXOI495S5QirS5cWtXCDS9nYK4/S1WoJXQE+YpptHUlghiIcWZXL5ODHC0CB7GF8wnnaVisc4ikMVhXlkceen1FxqGLPfV8ylDjPR8dDWY/sBYFcpSmrQbiALTLNiPgZed1iWFay1/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(6133799003)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGNSZ3hGVXF4WEtmSEVEZ1hqbzBtKzdCb0tKcUJCdy9pUnNvMUx0Sml3amxV?=
 =?utf-8?B?MFZhRWU5UU9KTnh3U2JCb2ZXVG95SUhrYmw1dnZ2enQyTGtxcVhvWmZCc2pn?=
 =?utf-8?B?clhQZjQ1VnpHYk4yWHVtWXR1OHV3eFo1VEg1anVwSWsvOFpuY2lGelEwa2c0?=
 =?utf-8?B?Q1FBS29MNWJCd2V4VXNQRS8zMTBGU0FMRk5ueUh6VTZQQVJLMElqTENGZXAv?=
 =?utf-8?B?WUEyRExiZTRKcXJSZ3pkcVpjWTlrQVZaQU1kZkhvWHZwb1VlTk81cllUNzZo?=
 =?utf-8?B?OUNPZEQrZ0U1ejVyWG0rVjFhaG5uNC9sRS9BakVmRlZjejgraDNSQlpVOTNJ?=
 =?utf-8?B?SW5Pd2ZaSTVEK3VxY0hXVGd1T1drZUhQd0ZObW96UUg0Mjd3SzhSMFlTbitG?=
 =?utf-8?B?Q2hXblczWVhOTHFxZHZ4czMvZGxmdXZEekJOdFgxTlQ3RHFCY0hRdkQ3RXJJ?=
 =?utf-8?B?emFNOW9iS21CQnJuSXpnV1RBZE9mZ3RQMkRZMHZsNE0yN1dDU0JHRzZxaFRv?=
 =?utf-8?B?QktaKzZSbXlsSjhiNUhHNkVFaUg0aklEcXdyMk1WSVdtOXJEVVVLRGhPenVS?=
 =?utf-8?B?ZDZ3cmVwMS9nMDVwRktlZ2JhWUY0SmxrZzFTdStyYk1hRzVuT0svekdyTERa?=
 =?utf-8?B?MjN0YjRWR3dCTjNaQVFqcUpTRU1ka0ZSWXRWRmttRDcxenRBSHhCUmlESGwz?=
 =?utf-8?B?cTA2YVk1SU5IT292ZEFGWGdGTG90NTlSV3hVZVhmN2V4b3J4bTFpQ2lWUldy?=
 =?utf-8?B?RjEvazJjSE4yYy9rNWtjdkFCRkxoT1NlN0hFTmhyaXpoLzQxR0pLR3NjK3ZR?=
 =?utf-8?B?djlZUTBNM2ZvTUEySEw1bHgrait3YXNYTEJrN25BK1U3VGVicWVIc1diR1JH?=
 =?utf-8?B?a3ViYzZMOHpuMlJjTnF2ZDl1RHJEWHNmMzUrdW50aFNHV0NGL2s5ZkdPWEhC?=
 =?utf-8?B?TlRYL3ZRSTFnRGs3UkpjVGg1aTZDam9LZFpYU3FGL2NEWFFreWZ5c2ZkOHdx?=
 =?utf-8?B?elgzRjdlQ29TMDZQb1pEY2lqeTlEZm84d3FkWmVHU2xzVlkzUUxPdXNuSmdp?=
 =?utf-8?B?Skg0eHZBaDRvUThZTXVFMHd3aDdSQjg0a1FQQm9EM3pQd1JTdmdPcFdKMk5l?=
 =?utf-8?B?cEVXeFpMcjNXeXlBb1FWRUZPQjhRc2tGVlhTeXoxM2h4UW1MVW5IekFycmdm?=
 =?utf-8?B?WUdSMWc5ak5mQnBoNENWQjBrc1dRU3Z3YXFZWTBqVC84d1c3dHZzdFdUT1Na?=
 =?utf-8?B?L0RGUkZNNzdzdVd5Ykw5U09oZzk3cThHQ1dsUUpPZENHRHEzdEVNMHdmTGJR?=
 =?utf-8?B?OTB3NEZZWE5pT0ZMK0FLMHc3eTRFSUxObnozWGVoc0Q3dnBzaXk4UndOOWFQ?=
 =?utf-8?B?TFpnVG9sZmJOOHRtb0lCM1R0UnhUSkhxTEJybUVYallNN2FocVR4MFR5R0t0?=
 =?utf-8?B?Q2l6MG51MVJwTTNWV05pZm16R1BGbWxUWGdRY25PS0lCV1RrTk5NcWd6ek4v?=
 =?utf-8?B?QitkRlFxVm5abjRXdHZWMEprTi9VWDVYeTQ0VHdDU25aUm1WcXdqdjdEYlFE?=
 =?utf-8?B?SmVUK2lHQWdLTS9STFVSN1pPV1BWYkN1a1JrTkFWR0RPVWxUY2tLOXV2eEtT?=
 =?utf-8?B?Z3lzWkV1VE81L2h3Sy92VURhZVNkVzR4ODJwQzFUMHZpNFBlR1I0U29nSU8w?=
 =?utf-8?B?M3A4TVVtQ1hNU2pyeGtjNzRQQ3ZJTmI1QzdtSG03YmlqdFgrOWpEencrcFBh?=
 =?utf-8?B?QmpNbWplRWJMM0p2L0JXWGVxQ3IwUnBDT2RzbUlKeXlPVUtROHN4cVFiTGd4?=
 =?utf-8?B?QytWWHZlN3cra1o3dlAxMU5QMmM3amFTQWVUMjV4WFRxejhmUWI0YWpTallh?=
 =?utf-8?B?eTNFSUVWR1NodGlhQ1ZvSUFFbHMrN25oY2h4VXU3cVFka3pDV0VuMFB5anVM?=
 =?utf-8?B?YmJQMEpwdzVOdFZoTkw3UDl6T2xYd1g2ZzB3Mmd4UWlIVkRKcmRCNTVkbEVI?=
 =?utf-8?B?V3pLb2dzaGVoRTBvbFRaM1oyRGJEbGk3M1ZLRC9qcGI5Qkl2dlFmM0RveEto?=
 =?utf-8?B?VGVBYkUxUy9JV1ZIVlRhdUhGNEZzTzVGVTNpWTBsNjZBNXo0bTBqVllPU0do?=
 =?utf-8?B?eDBERHIxeUdDSXdpNXdrdXN0OS9RcW9Cb3lhSHlIS1RtQzBXakhVR0pGak9S?=
 =?utf-8?B?a3BiU0M3cktmTVVucS85cHRXY0VHTTVEbjA0UWYxMTZrbWZBMjExOHpSQ3lr?=
 =?utf-8?B?bmgwTVE5ZGVWZVMvcTh4WHdUVzdRd1pCTTJpdDNjbnRjMFB0b3BMSTZmcWlo?=
 =?utf-8?B?NmV4MHlkTWdaaVlBWk12dGlXRy9iakZlbkE5bG1Rb3RPejlmT0p5ZXRGOHlZ?=
 =?utf-8?Q?Htgkf3czbO1+WYqk=3D?=
X-Exchange-RoutingPolicyChecked: HYMmHny7mHUO85h3UmK72oa/09QFUNbGEvb0b1ARIRJVBNrWE8W2xX8whHKVjxPBQmGEapXXWDBG1tucQPUhG1eAOZzyuPJpwv2fzPDy6HZZvtQH1/4ySgFYOWk4W7TupMlGlw3bNGI8wNi1Fx1W/gpNTqxg+WhqVWo0TUXocD05ACeSTEcbgckDldNWWxQiFP5G+dCI3Hb5NXbkgwN0jPgkWFheMFWCG/jWdK/lxcfIOWajhgPCltvlnH/ABkNfyv65gg064s5cp58Y+aNS1BkKuVpIVtSk3ax66dF35mw7MoNcX4DErL8PDHB67KxETYZOskVtVjRCwBAlpFnDpQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bfcb4af-9fe1-407a-d274-08df0cf7709f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 15:48:19.7990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rCJ+0e8UsACTqakayrAftVIWrzORI3gzHMaMs1ngVoxuukgpTpkN0HsNjhsG98m/FuVrqSJzIMIqPcXIJPntP10M882tFRYAtTl+LTZnUwg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7811
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



On 9/7/2026 2:04 PM, Gupta, Anshuman wrote:
> 
> 
>> -----Original Message-----
>> From: Wajdeczko, Michal <michal.wajdeczko@intel.com>
>> Sent: Monday, September 7, 2026 5:25 PM
>> To: Nilawar, Badal <badal.nilawar@intel.com>; intel-
>> xe@lists.freedesktop.org; Vivi, Rodrigo <rodrigo.vivi@intel.com>
>> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Jadav, Raag
>> <raag.jadav@intel.com>; Tauro, Riana <riana.tauro@intel.com>; Koujalagi,
>> Mallesh <mallesh.koujalagi@intel.com>; Iddamsetty, Aravind
>> <aravind.iddamsetty@intel.com>; heikki.krogerus@linux.intel.com;
>> Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
>> Subject: Re: [PATCH 2/2] drm/xe/cri: Expose device UUID through sysfs
>>
>>
>>
>> On 9/7/2026 11:13 AM, Nilawar, Badal wrote:
>>>
>>> On 04-09-2026 22:07, Michal Wajdeczko wrote:
>>>>
>>>> On 9/4/2026 6:06 PM, Badal Nilawar wrote:
>>>>> Expose a read-only sysfs attribute, device_uuid, that reports the
>>>>> GPU's unique hardware identifier.
>>>>>
>>>> Bspec: 53048,53049
>>> Sure
>>>>
>>>>> Assisted-by: Claude:claude-opus-4.8
>>>>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>>>>> ---
>>>>>   .../ABI/testing/sysfs-driver-intel-xe-gpu     | 10 ++++++
>>>>>   drivers/gpu/drm/xe/regs/xe_regs.h             |  2 ++
>>>>>   drivers/gpu/drm/xe/xe_device.c                |  3 ++
>>>>>   drivers/gpu/drm/xe/xe_device_sysfs.c          | 36
>>>>> +++++++++++++++++++
>>>>>   drivers/gpu/drm/xe/xe_device_types.h          |  3 ++
>>>>>   5 files changed, 54 insertions(+)
>>>>>   create mode 100644
>>>>> Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
>>>>>
>>>>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
>>>>> b/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
>>>>> new file mode 100644
>>>>> index 000000000000..1a4bdfbad8d7
>>>>> --- /dev/null
>>>>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
>>>>> @@ -0,0 +1,10 @@
>>>>> +What:        /sys/bus/pci/drivers/xe/.../device_uuid
>>>>> +Date:        September 2026
>>>>> +KernelVersion:    7.4
>>>>> +Contact:    intel-xe@lists.freedesktop.org
>>>>> +Description:    RO. Unique 64-bit identifier of the device
>>>>> +instance, read from
>>>>> +        the device's CRI_DEVICE_UUID register and printed as a
>>>> hmm, maybe in the user facing documentation we should refer to this
>>>> register as
>>>>
>>>>     DEVICE_UUID(102008)
>>>>
>>>> instead of the meaningless macro name?
>>> I will drop "read from ..." statement.
>>>>
>>>>> +        zero-padded 16-digit hexadecimal string.
>>>> if this is UUID, shouldn't we print it in UUID format? see %pU
>>> I this is not UUID, i will rename the node as device_uid.
>>>>
>>>>> +
>>>>> +        This sysfs file is present only on Intel Xe platforms that
>>>>> +        provide a device UUID. It is available to all users.
>>>>> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h
>>>>> b/drivers/gpu/drm/xe/regs/xe_regs.h
>>>>> index ef4746b7b5d3..68226fe0b659 100644
>>>>> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
>>>>> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
>>>>> @@ -30,6 +30,8 @@
>>>>>   #define XEHP_MTCFG_ADDR                XE_REG(0x101800)
>>>>>   #define   TILE_COUNT                REG_GENMASK(15, 8)
>>>>>   +#define CRI_DEVICE_UUID                XE_REG(0x102008)
>>>>> +
>>>>>   #define GGC                    XE_REG(0x108040)
>>>>>   #define   GMS_MASK                REG_GENMASK(15, 8)
>>>>>   #define   GGMS_MASK                REG_GENMASK(7, 6) diff --git
>>>>> a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>>>> index 8583b2e9ecf4..e8db8871990b 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>>>> @@ -801,6 +801,9 @@ int xe_device_probe_early(struct xe_device *xe)
>>>>>       if (IS_SRIOV_VF(xe))
>>>>>           vf_update_device_info(xe);
>>>>>   +    if (xe->info.platform == XE_CRESCENTISLAND)
>>>>> +        xe->device_uuid =
>>>>> +xe_mmio_read64_2x32(xe_root_tile_mmio(xe), CRI_DEVICE_UUID);
>>>>> +
>>>>>       /*
>>>>>        * Check for pcode uncore_init status to confirm if the SoC
>>>>>        * initialization is complete. Until done, any MMIO or lmem
>>>>> access from diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c
>>>>> b/drivers/gpu/drm/xe/xe_device_sysfs.c
>>>>> index a73e0e957cb0..a4d326159dce 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
>>>>> @@ -8,6 +8,7 @@
>>>>>   #include <linux/pci.h>
>>>>>   #include <linux/sysfs.h>
>>>>>   +#include "regs/xe_regs.h"
>>>>>   #include "xe_device.h"
>>>>>   #include "xe_device_sysfs.h"
>>>>>   #include "xe_mmio.h"
>>>>> @@ -264,6 +265,35 @@ static const struct attribute_group
>>>>> auto_link_downgrade_attr_group = {
>>>>>       .attrs = auto_link_downgrade_attrs,
>>>>>   };
>>>>>   +/**
>>>>> + * DOC: device_uuid
>>>> do we need this?
>>>> you already described that in Documentation/ABI
>>> I think I will drop the Documentation/ABI and keep DOC: section.
>>
>> hmm, but all other sysfs entries are defined in Documentation/ABI (which
>> IMO is the correct place, not a local DOC section)
> Is there a way to link the Documentation/ABI doc with drm/Xe Doc,  in case local doc is not preferred.
> https://docs.kernel.org/gpu/xe/index.html 
> As this is Xe specific sysfs , AFAIU there should be some way from Xe Kernel Doc to refer this sysfs ?

it should be sufficient to use:

	"See Documentation/ABI/testing/sysfs-driver-intel-xe-gpu 
	"for a complete description of the attributes.

see https://elixir.bootlin.com/linux/v7.2.2/source/Documentation/hwmon/sysfs-interface.rst#L92
and resulting https://docs.kernel.org/hwmon/sysfs-interface.html#attribute-access

> Thanks,
> Anshuman
>>
>>
>>>>
>>>>> + *
>>>>> + * Each Xe device exposes a 64-bit UUID that uniquely identifies the SoC.
>>>>> + * The value is read from the CRI_DEVICE_UUID register and can be
>>>>> + * read back through the ``device_uuid`` sysfs entry.
>>>>> + *
>>>>> + *    $ cat /sys/bus/pci/devices/<bdf>/device_uuid
>>>>> + */
>>>>> +
>>>>> +static ssize_t
>>>>> +device_uuid_show(struct device *dev, struct device_attribute *attr,
>>>>> +char *buf) {
>>>>> +    struct pci_dev *pdev = to_pci_dev(dev);
>>>>> +    struct xe_device *xe = pdev_to_xe_device(pdev);
>>>>> +
>>>>> +    return sysfs_emit(buf, "%016llx\n", xe->device_uuid);
>>>> %pU ?
>>> Not needed.
>>>>
>>>>> +}
>>>>> +static DEVICE_ATTR_RO(device_uuid);
>>>>> +
>>>>> +static struct attribute *device_uuid_attrs[] = {
>>>>> +    &dev_attr_device_uuid.attr,
>>>>> +    NULL
>>>>> +};
>>>>> +
>>>>> +static const struct attribute_group device_uuid_attr_group = {
>>>>> +    .attrs = device_uuid_attrs,
>>>>> +};
>>>>> +
>>>>>   int xe_device_sysfs_init(struct xe_device *xe)
>>>>>   {
>>>>>       struct device *dev = xe->drm.dev; @@ -285,5 +315,11 @@ int
>>>>> xe_device_sysfs_init(struct xe_device *xe)
>>>>>               return ret;
>>>>>       }
>>>>>   +    if (xe->info.platform == XE_CRESCENTISLAND) {
>>>> use .is_visible instead
>>>
>>> Will add has flag.
>>
>> to be clear: my point was to move this check to the
>>
>> 	attribute_group.is_visible
>>
>> and I don't care whether it will use .has_uid or .platform field
>>
>>
>>>
>>> Thanks,
>>> Badal
>>>
>>>>
>>>>> +        ret = devm_device_add_group(dev, &device_uuid_attr_group);
>>>>> +        if (ret)
>>>>> +            return ret;
>>>>> +    }
>>>>> +
>>>>>       return 0;
>>>>>   }
>>>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
>>>>> b/drivers/gpu/drm/xe/xe_device_types.h
>>>>> index 180d450a6deb..6fdd16eac906 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>>>> @@ -257,6 +257,9 @@ struct xe_device {
>>>>>           bool oob_initialized;
>>>>>       } wa_active;
>>>>>   +    /** @device_uuid: unique 64-bit identifier read from
>>>>> CRI_DEVICE_UUID */
>>>>> +    u64 device_uuid;
>>>>> +
>>>>>       /** @survivability: survivability information for device */
>>>>>       struct xe_survivability survivability;
>>>>>
> 

