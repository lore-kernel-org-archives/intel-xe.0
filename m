Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40454CCFA04
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 20:09:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF66D10E326;
	Tue,  4 Nov 2025 20:09:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="adsoteDX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98D2610E326
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 20:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762286990; x=1793822990;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fBIKr+6gAdu56Sanpuz1iaTTOAzIrH6btBn8Rf6Dk+g=;
 b=adsoteDXclnndlOlmALd0yo/BG9KJfo9ftZ9aMluHkLME67zjjtoYq+K
 8pQxYF2+fukXavCt8Znoce2zjvcncKXTdT10XWl4MjH9GiLTOA0FZ5uz2
 L8krthLrkbKpzkhDB7JyRRwDmjgaNeHCxbHdsx7fBMrlmdQulvwZdEKBL
 vNv6tCCcz1NAi5WPZbRoO5i7bEWmjdoqDW3z09yG4HDyXtyTIS8ZjsvrT
 4b6thE9yibZxxc+Od206iAORpWjcGqWf/qJTXeJJgSHQjW5p4NfsSafxT
 wSaeNI51Mnqv2Q/VFec8fKN6oI1zjeuENkcW2UqznU/NInL+/qA1eQWhD g==;
X-CSE-ConnectionGUID: zPee7yFpSjO43Dch98uWzw==
X-CSE-MsgGUID: p9wzo2eMR02d01R4Sor1HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="82021661"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="82021661"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 12:09:49 -0800
X-CSE-ConnectionGUID: 7LM44nHjSmCYsV5g6jsKuA==
X-CSE-MsgGUID: exOazZH5SJqzRHsKPCq5oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="210748301"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 12:09:49 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 12:09:48 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 4 Nov 2025 12:09:48 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.58) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 12:09:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PwqagBW7HhM6Bn49ayAzJqv1pyrk2AIvindJwJdbb3ohVY59fcr5jZK+X8piwMLcUCddrAtA+TUaQlqS5cQBLGIbzlM3Bq6iSuU6pjsTeStdXVLNhpFoOi1g7rkkp0pMOySAbL3GP2SLI8oRMCptKxBaBYN8ItqP17/7KsLANf/0GUMPWt0QC9htci4kZZ3vzzlm7A02HQZT2mloLMaDBehGja6MSaXLKXcZ8WUzRspRlq+nAjoYSinP1GpoElFpteSxVV4rpyilTotksp6sdg6pyiE8f0mYwPNlEULW6wQ4aZjO3HWgiu5WI7NfodKz1f/2fO8AFdBpLjiHlDtWCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1e0XVv1272UFXxZT3ORP1LCsclUN+FJSVOnYsmPyYSc=;
 b=rUNf3WvaGwi0pSGVeuY4EsED1GkAQ3c7Rs/9Yv25aSHG3Gg0j/1Kk1FagHMHP0YkRIm2ogOW48XM8IQUOC80eyycPrrH8vtUt9kZRhG7lKBHGRt6+vaTqeuwSUqz+lxufVjf6zgStMbKA2U80rWF4NZT54JLPixJI4ix74fCbZB50HAGM2VWB/rY/wsgso1nHuPFUURHqUgSfEoyrpTzUKqmBeMY8PyzbqkBsa1bKLDPZ26rccYJYoW7yNRL2XLutzeKZQrxA1qHEZOZQVappqs8SG+oMNPL3ntY2olT7PwqEZuSrLHD2mcmYCNALXLiabYOCQl6khMUG2KULsF25g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by SA1PR11MB7064.namprd11.prod.outlook.com (2603:10b6:806:2b7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 4 Nov
 2025 20:09:45 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%5]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 20:09:45 +0000
Message-ID: <53a1eb63-20f8-4be7-ba1e-8c538455c244@intel.com>
Date: Wed, 5 Nov 2025 01:39:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] drm/xe/guc: Eliminate RPa frequency caching
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>, <vinay.belgaumkar@intel.com>,
 <rodrigo.vivi@intel.com>
References: <20251104104207.696448-4-sk.anirban@intel.com>
 <20251104104207.696448-6-sk.anirban@intel.com>
 <24d58635-9dbb-4d88-9c18-bea7ca5f133f@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <24d58635-9dbb-4d88-9c18-bea7ca5f133f@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0079.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::14) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|SA1PR11MB7064:EE_
X-MS-Office365-Filtering-Correlation-Id: 0711f19e-2a7c-4a1f-7661-08de1bde18d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?emVsYkFXTWFMays4YVluNXZHL2JRT2FpSnlVSFIrTjlnaVkrT21jNHR0azRD?=
 =?utf-8?B?d2o3UUdZRFowbE1jYkpjMytrL2hING0rZk1VZzdkZzkzOGoyMmdYcEM4TVd5?=
 =?utf-8?B?bVVoR2Q1M1M5NHR2VWoydUJCQW5JZkFvR3lxUjhPc1JsS2lTb3FEQ2E0Tllj?=
 =?utf-8?B?Zjd4N3c1VkE1aTRlUG5rR3lzQlkrMU0xcEg0OE9RWlU1R1REMmdyZUFDMkVV?=
 =?utf-8?B?VmdDWWttYUFHb0wwUHdSOUVGaGZlRWUwcGYxU2hmQWo1enBCbVN0QWkvZmNW?=
 =?utf-8?B?RG5KUURhVXBKaERFWUJZeFJUNytTWHZibStQaFliZ1NPMkJTUFVZWEY4eDdr?=
 =?utf-8?B?TFV4RGJRMERPVW1QZmgxQXZyTmlBaTVuZjhOVmh4SzhmUmlnazJNNUxQbHNa?=
 =?utf-8?B?QTU3aUgzMklyTXV3cDdxV216dng1SGF4RmxsVnhWSGVLNFNEb3VIcTd4T1F5?=
 =?utf-8?B?Z1YvMjAwUTJIUVU3ekcyVEw3T3R5cVJCSVhXWFR6T1pld3IyekJFaUhZRmcx?=
 =?utf-8?B?QS8xN3lMZ2ZXT1NaWmdDbllWRDZabWJHN0ZyNXFyVVViL1BDU216NENRamJt?=
 =?utf-8?B?SVRiMlU1cXRYc0JBQmE1TmJVRkxiM1JGQTZLcjhZZXdqRFFRVG9JbjRlWjNw?=
 =?utf-8?B?UXBTZHRMUnlzaGRBMDlpVUoxQm5RemNqM01LY2lRODAvQ3lpWDA3Z2dwRHNw?=
 =?utf-8?B?TjN0L2krMkJBN2F2eXBvZzdhemNXcXFON2ltbUR0VU83bkVCTy9VT2k0VEhR?=
 =?utf-8?B?ai9QY2FJbEx1UnFsZENiZjIrL3NqRmwxcEpIYWxqT2lCVFBGQjg1UVhwSlZF?=
 =?utf-8?B?akVEUGxWQWFSVFBNUWZEOVFhU08vTmRYVyt6MitYQ0gwK3gzWVhjUGJ5VC81?=
 =?utf-8?B?RmZOZnRYbUhCcjZHNld2MzM5ZXNNOVR1ckYxQ3p0WkMzUmlIc3lQY2NOUnJQ?=
 =?utf-8?B?aGZNSGNCeUx2NVVaMjV5MFhrN0FjS3AzQ1lhb245amdBSzE0ZlZSS1NKVi9M?=
 =?utf-8?B?MEp4ODh4V3EyZVVrd201cWxRQUV5aTBTcnB1Q2duNHVFVjlxRmJYSUk1OUFJ?=
 =?utf-8?B?Qm8yLzEwVVQxS0JmdmtzN0NpYTVsdmZ0d0pDNzlFV24xTmhSODM4UlNBaUJT?=
 =?utf-8?B?b1JUYnc2K1JweTRUN2g0MHBYK1RlV1NSZlN5YkJqaURiSGJmeWdXbW1lZStX?=
 =?utf-8?B?VUhrcytWUFo5ZjBkRFBSQ2pNQUJWUEt3ME5GWWowVVBUdjExVnFqN01ONmpF?=
 =?utf-8?B?ZG1NSDlFTjlML1ByeDJzTUhBSE1RaEtpSkxyTlpZYVNBM2l0MUtKZE1sSzZp?=
 =?utf-8?B?WU1HUFpFNWZkeWJGOWIrdmNoZnViT0I1ZE9idFlhMWhXU1pxeFM0UVdVUnRH?=
 =?utf-8?B?VFI2cHVHT1kyejBsMldGVzN4cEhqaWJNbGhhU01UUlMyeXV5bWNVb2l2L082?=
 =?utf-8?B?c0xZYVdWWTdGb0NYcXczcjZqRHFDb1FIOWVqaWVPN1hTMnhxQm9ZVis2R05D?=
 =?utf-8?B?cVRESi9EWi95czFVbE10V0duWkE2ZnRuN2NtY3ZQWnVRWHVUdEFaUW1uRGhL?=
 =?utf-8?B?MURXTk9WTzE4Z2IrR21MbkRUcGVHQjlzVWpFcXFuZWQrTFdpWW5zWW5ZVEhk?=
 =?utf-8?B?THhyeWhIWDJSdldPZVNhS1BjbE1RdmNMMXJoQ3lpS2FJTHA5bUFoVlJLZTR2?=
 =?utf-8?B?U3VCTnorUGtRbmRKR28rUUFuYnM2MENvU3lPMU5mWW5iSFdjc2VabGRyYWxw?=
 =?utf-8?B?c3ZJUEV0OEJDUytIQVhYeEgxVmU5T1I2VHR0YkMvdlRRMGowV1FxekdtVTc3?=
 =?utf-8?B?TlZnSjR3a3JjWmdoRnRQcXg2dkJDQll3YWpVK1F1aTVudlVQVUJ2YTcwN3Yx?=
 =?utf-8?B?RldZYmhJSVB3QjhMekJYSE45eUJwVmR0SGJBWWpoQ2ZkNUNlNm1mSFZlUWZ3?=
 =?utf-8?Q?x48xOr3u8YVnsAi2pzomslaLW+vukFc9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0VvYml4OUtra1o4K0dSQ1pob3UzYVpXbjk0ZTgzMnVjNndhVzhRajV2OStk?=
 =?utf-8?B?UXdIRmxmelZGb3hoNlBDVUhtYWpqMGthTmkrc3l3b0s4dU9SM0E3WGRuN0VV?=
 =?utf-8?B?MkZDajhDbmEreVQ1MmlHYVFPdU5ycm9QclhybTRRRVk5clpOT0tPL0Q0T2VR?=
 =?utf-8?B?dDhNdGhNeGp4Y0lWM0FXZ0hoSWhXVGlHMnlLeHlrSFV5aHlTYmJyaG0raE1L?=
 =?utf-8?B?ZjZCYzExRGR6N1FNRUREVHFxN3c4eGl3cXlqTzhteVgrT296cG82TGliT2Y1?=
 =?utf-8?B?ajc2K0FMR01zdkdydDg2cmp3NnB3QnRGdWFvUlllbmVkYjU0YzgwdmhZOGl6?=
 =?utf-8?B?eGJ2NUkraXZINUVwOU0yem1KTGFIcEFBYVcwRDRjcVZUNGFUK0p5cHBTWGpN?=
 =?utf-8?B?akp5dGNKaU1EWFp1STRvYlBCaDBUMEdlc0NCT0c5YnBySnl5bEs5bzB6WlZo?=
 =?utf-8?B?dFROKytGUWh1SytlMVRycndrd3Q5YVNpOHhRMURlM1VYa1NIUVNLU2R6Qi9W?=
 =?utf-8?B?Q2t2aUU3V2JyR1llT0hWVjJ4SEpLZEhLR3hzNXFOMWFaUWRndkx3WllIbkl5?=
 =?utf-8?B?VCtSTHhVbkxldEdRL1JMRTlna01vMTkzVFdHazl2OStha1pQbHpsNXdPalha?=
 =?utf-8?B?Q25mRHFMR2dSTTNPZysvdHp2QVRvT0s2TWtIRWpsaUtYY0Z3TTBjdGM2cy9X?=
 =?utf-8?B?b3ZLKzVBTmtnV1MvM1dQUmlESU51T21NOWVZcXEzcnNUZjRiQm80TEFOSFFK?=
 =?utf-8?B?Wk5IdUJrN1JkYjRObkVmditIL0VCTHRaZzQrRFlSZ2tzMnBtNjducmdUa0Vr?=
 =?utf-8?B?eW9IZFFWQkt4RkVQd3NzQW1qeUJnYk15UmxmWGxERElXR1g3K05RMk1KVE9s?=
 =?utf-8?B?MEdueVRMMWZDNEl6ZURsditKWDJZUFREb1hpUVo3VFNlWG5WK2F6MHZETm9t?=
 =?utf-8?B?cmNVcUs4Z2w5aEswZExTVy9qRWRLN096alVBeER3MGdhOTY0VXcwZWVKU28z?=
 =?utf-8?B?Q0FuTEVEOUtJU0xMRm5hcUx4TEJ2ZFN3cm44MjRNenNjWDRDYm0wK0R0NzJw?=
 =?utf-8?B?eEZBL1M0ZnBldElPTjFCQ1VNWWdPREZhN3g4K2dESUtvWHZaWDVwVVBxZCtv?=
 =?utf-8?B?TlIyaEFjNFV1b2VxNFZKdWQ3ZDA2ZkRBc0NlbDZpOWxMTVFHRUE4LzdvRlk2?=
 =?utf-8?B?TVhJNjRzcjZxMlBVNWQvbzhBMEVZZFV0R1BHZzE1RVFJWUNqT09hTHVSaVNO?=
 =?utf-8?B?SnRldGlKU2tuUTNiRnBaSHByRE4yWDByUzhvcGFZTURiV1kvWFpUVUxQeXZX?=
 =?utf-8?B?Qis2cFhKTURBN1Z3T0xrbWtPbk5vZmRXZDBQeTBRK085NlJMR0l0bnZScDBr?=
 =?utf-8?B?WElhd3RtQlJRK3lRVllEMVJqRENjUDZweEpkZTkrdEdEcThkaUtRNllHRms3?=
 =?utf-8?B?Qll5WS8vL1dXeHdUTE10VzlGL2xzZ3JqZDlNbTM0bWdLM3JYd2wzdTdQZFlC?=
 =?utf-8?B?cDhmTElLRU1DbmRtZTJiRHpINDN5RnpESVlZVCt3M2pxSzR3a2ZUTzZNRGdl?=
 =?utf-8?B?UXR1aGVtbjN5WHRnVXdoUDRRdHp2WldCU1A1R3dyT0ZWeHNDNzZ4MG05MDFT?=
 =?utf-8?B?NWYzb3NCUXpFNnJvTWFKblRHTFZ1MVdNVWQ1UzlNaVRFWnkvTFN6VDB1R1Zx?=
 =?utf-8?B?SHpoQ3ZRSW94dEZtSzFrb09NQTQyaHhuSVlZSWlrUXpWOUl3SW9VcmgxT3F1?=
 =?utf-8?B?ZHMrMURxN3FEM1d4SmdjWCtlTlg1NmtzY3pwdmpnTVc1M3d3SDlJajZCS0JC?=
 =?utf-8?B?bmVkcTlPRnMzVlVxOUFRT3daQlg4REhzd2JHZGlGUzkybVh4UzJZanNwbnpB?=
 =?utf-8?B?bzViTEVNcVZsZmpUSVdMNjhxQndsRjhHNDJHV0xyaEhYK2VsZnAwWnZtMnc4?=
 =?utf-8?B?SUJ1b20wYjJ4cHNBOG93OTY1UzcvUTFpVTJJTUFaRVR5ejcwK1NURUxCdklo?=
 =?utf-8?B?Z3VtaU5IREc0MTRiWTREODFhNDBXUWIyS1VrQWJOVjBtSC9VNitTR2lNeTUy?=
 =?utf-8?B?OEhjUUhTUHdUaFlMU3o1UGFzck0raE5LMTZQRnBoMUsxUUZNZkh1TWZhMTNh?=
 =?utf-8?Q?6lKv9R08i96Hn5qGEx1lPCH/T?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0711f19e-2a7c-4a1f-7661-08de1bde18d3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 20:09:45.2993 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wdXIGednCpUfGnVycMt5LvkErZh3O8KNr6z5sxKfbEozB57oP8pbqdHtpVIwNJE3NgMCrDhmkcJKQQfewNz5RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7064
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

Hi,

On 04-11-2025 20:17, Nilawar, Badal wrote:
>
> On 04-11-2025 16:12, Sk Anirban wrote:
>> Remove the cached pc->rpa_freq field and refactor RPA frequency handling
>> to fetch values directly from hardware registers on each request.
>>
>> v2: Check graphics version instead of platform (Rodrigo)
>>
>> Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Suggested-by: Badal Nilawar <badal.nilawar@intel.com>
>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_pc.c       | 55 +++++++++++++---------------
>>   drivers/gpu/drm/xe/xe_guc_pc_types.h |  2 -
>>   2 files changed, 26 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c 
>> b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index a9c29f123b37..01fc8ecb373d 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -362,7 +362,7 @@ static int pc_set_max_freq(struct xe_guc_pc *pc, 
>> u32 freq)
>>                      freq);
>>   }
>>   -static void mtl_update_rpa_value(struct xe_guc_pc *pc)
>> +static u32 mtl_get_rpa_freq(struct xe_guc_pc *pc)
>>   {
>>       struct xe_gt *gt = pc_to_gt(pc);
>>       u32 reg;
>> @@ -372,7 +372,7 @@ static void mtl_update_rpa_value(struct xe_guc_pc 
>> *pc)
>>       else
>>           reg = xe_mmio_read32(&gt->mmio, MTL_GT_RPA_FREQUENCY);
>>   -    pc->rpa_freq = decode_freq(REG_FIELD_GET(MTL_RPA_MASK, reg));
>> +    return decode_freq(REG_FIELD_GET(MTL_RPA_MASK, reg));
>>   }
>>     static u32 mtl_get_rpe_freq(struct xe_guc_pc *pc)
>> @@ -388,24 +388,28 @@ static u32 mtl_get_rpe_freq(struct xe_guc_pc *pc)
>>       return decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
>>   }
>>   -static void tgl_update_rpa_value(struct xe_guc_pc *pc)
>> +static u32 pvc_get_rpa_freq(struct xe_guc_pc *pc)
>>   {
>> -    struct xe_gt *gt = pc_to_gt(pc);
>> -    struct xe_device *xe = gt_to_xe(gt);
>> -    u32 reg;
>> -
>>       /*
>>        * For PVC we still need to use fused RP0 as the approximation 
>> for RPa
>>        * For other platforms than PVC we get the resolved RPa 
>> directly from
>>        * PCODE at a different register
>>        */
>> -    if (xe->info.platform == XE_PVC) {
>> -        reg = xe_mmio_read32(&gt->mmio, PVC_RP_STATE_CAP);
>> -        pc->rpa_freq = REG_FIELD_GET(RP0_MASK, reg) * 
>> GT_FREQUENCY_MULTIPLIER;
>> -    } else {
>> -        reg = xe_mmio_read32(&gt->mmio, FREQ_INFO_REC);
>> -        pc->rpa_freq = REG_FIELD_GET(RPA_MASK, reg) * 
>> GT_FREQUENCY_MULTIPLIER;
>> -    }
>> +
>> +    struct xe_gt *gt = pc_to_gt(pc);
>> +    u32 reg;
>> +
>> +    reg = xe_mmio_read32(&gt->mmio, PVC_RP_STATE_CAP);
>> +    return REG_FIELD_GET(RP0_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>> +}
>> +
>> +static u32 tgl_get_rpa_freq(struct xe_guc_pc *pc)
>> +{
>> +    struct xe_gt *gt = pc_to_gt(pc);
>> +    u32 reg;
>> +
>> +    reg = xe_mmio_read32(&gt->mmio, FREQ_INFO_REC);
>> +    return REG_FIELD_GET(RPA_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>>   }
>>     static u32 pvc_get_rpe_freq(struct xe_guc_pc *pc)
>> @@ -426,17 +430,6 @@ static u32 tgl_get_rpe_freq(struct xe_guc_pc *pc)
>>       return REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>>   }
>>   -static void pc_update_rp_values(struct xe_guc_pc *pc)
>> -{
>> -    struct xe_gt *gt = pc_to_gt(pc);
>> -    struct xe_device *xe = gt_to_xe(gt);
>> -
>> -    if (GRAPHICS_VERx100(xe) >= 1270)
>> -        mtl_update_rpa_value(pc);
>> -    else
>> -        tgl_update_rpa_value(pc);
>> -}
>> -
>>   /**
>>    * xe_guc_pc_get_act_freq - Get Actual running frequency
>>    * @pc: The GuC PC
>> @@ -535,9 +528,15 @@ u32 xe_guc_pc_get_rp0_freq(struct xe_guc_pc *pc)
>>    */
>>   u32 xe_guc_pc_get_rpa_freq(struct xe_guc_pc *pc)
>>   {
>> -    pc_update_rp_values(pc);
>> +    struct xe_gt *gt = pc_to_gt(pc);
>> +    struct xe_device *xe = gt_to_xe(gt);
>>   -    return pc->rpa_freq;
>> +    if (GRAPHICS_VERx100(xe) >= 1260)
>> +        return pvc_get_rpa_freq(pc);
>> +    else if (GRAPHICS_VERx100(xe) >= 1270)
>> +        return mtl_get_rpa_freq(pc);
>
> This code will never execute in its current position; it should be 
> checked first. The correct order is:
>
> if (GRAPHICS_VERx100(xe) >= 1270)
>     return mtl_get_rpa_freq(pc);
> else if (GRAPHICS_VERx100(xe) >= 1260)
>     return pvc_get_rpa_freq(pc);
> Regards, Badal
>
I had intended to check only for PVC here, my mistake. I've sent the 
corrected version.

Thanks,
Anirban
>> +    else
>> +        return tgl_get_rpa_freq(pc);
>>   }
>>     /**
>> @@ -1134,8 +1133,6 @@ static int pc_init_freqs(struct xe_guc_pc *pc)
>>       if (ret)
>>           goto out;
>>   -    pc_update_rp_values(pc);
>> -
>>       pc_init_pcode_freq(pc);
>>         /*
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h 
>> b/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> index f27c05d81706..711bbcdcb0d3 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> @@ -19,8 +19,6 @@ struct xe_guc_pc {
>>       atomic_t flush_freq_limit;
>>       /** @rp0_freq: HW RP0 frequency - The Maximum one */
>>       u32 rp0_freq;
>> -    /** @rpa_freq: HW RPa frequency - The Achievable one */
>> -    u32 rpa_freq;
>>       /** @rpn_freq: HW RPN frequency - The Minimum one */
>>       u32 rpn_freq;
>>       /** @user_requested_min: Stash the minimum requested freq by 
>> user */

