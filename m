Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67628C2A072
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jan 2026 06:29:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CBF310E34B;
	Mon,  5 Jan 2026 06:29:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VRDmub2f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 649F110E11F
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jan 2026 06:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767594569; x=1799130569;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PcUQENpMiLYCok5giSccBv6F+EcYBU6AX+S2zQFqJ1U=;
 b=VRDmub2ffjdpTbfErvqyAH/8QzxCPWB7Makotn+Tlwhb3bSNoaZjuzH3
 im/fiwClZeTt+gWsOCPxIYGEIKy13JP0Tt5Y2UCtFq1ZRvDZJmbXaE/Ku
 ZmzeQKRiRcyb/RZJVIwqXZ2HqBpIzJ5vdoSiEGD/j3mqu4w+fj6ApohuE
 hD3AB6jULOCkvD5/hdQZSAe5pcG8Yd141XQCjuvZcYEJVleo3JUoWL2Vc
 9b1QMKf5TkEIqqjig+Q7vpPoETFyyR5KTfr3vhgwjcRP34H58GbvMfqGg
 /Itslzr3YHSk8SuuLTaqEzEtQXQ8Qou78rLxILLp0wafN1ByyMfF3ZX8a g==;
X-CSE-ConnectionGUID: 41NRdZaCQwqwz472HVXJZw==
X-CSE-MsgGUID: fkDLBip1ReGKrEN99j0Otw==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="56519771"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="56519771"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 22:29:28 -0800
X-CSE-ConnectionGUID: ZEDySWgcTYeAWOBolWNxDQ==
X-CSE-MsgGUID: d7ZuFldITruruql3zt13jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="206796078"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 22:29:28 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 4 Jan 2026 22:29:27 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 4 Jan 2026 22:29:27 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.13) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 4 Jan 2026 22:29:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DFpDwUR1YXmRGkt58gCnq2jo1V3U4WIyeVLu3og4jmNdIzRpAjKMIbR9SO0bZirq/G9x3srq8KiPotLV5nEwpHQBEP+R1dx9ryTCEyadYTCGgny1jJpxSVoOTkiFNRlzupYOmH9WD5caxKjZBEDLKwca82VIbBOg4NOivLmy6tJNmQ2EXFXVH8l772mkCQVNZsgC2yBwn3ojaPGGPFC4Mqluju7LdMGY5P7+cDZ3dce2vhmpeTT0FgVIVUEgD3NOZOKAW+B4eRl8ES0l13rHFf0PITA+0oy3V0JK4ZmDq4UirTZLxIaXSI+j3YkqLQVY1xqZAxBnnnXkp/VqtzZCCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RiBqVPvsMRHZVedIQFflw7ULge1t4QdSqUtPcZRUAsk=;
 b=le3Q3uvukO9hE5UPSDAD+UO4CczE3Dq+91q+IJpZO02dYDZziDOChSb99bDRo1CbUfVON9tTbZjmGPJas9yObVMM13W/P1uIygbhb1tXgdFIrhB4uuM8W+I0UPPFv6Dz5/98n6hyEqUlVApVlDQsVR9OHF0pbD/aXyI9GhnnOqekEleF3kbKwcbXOYGkhUzRuBT3101ohBREkP74WdCmFEvuBSrgNBJKapBaBrIUfSQGZPJihUjOAQI4cq7ZsOSOjhEj8h5r7xWaI9+Zl5V7A2BhTPiXwACeFMYkKq7CFVOC89BWuPOmGeNZ5575C4d28LgBm5+rN8RyIbkeqovXBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4; Mon, 5 Jan 2026 06:29:25 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%7]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 06:29:25 +0000
Message-ID: <f7fabd06-901a-4f93-bc1f-00f7997a5efb@intel.com>
Date: Mon, 5 Jan 2026 11:59:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] drm/xe/sysctrl: Add system controller component
 for Xe3p dGPU platforms
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <umesh.nerlige.ramappa@intel.com>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
References: <20260102165450.561614-3-anoop.c.vijay@intel.com>
 <20260102165450.561614-4-anoop.c.vijay@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20260102165450.561614-4-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0123.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d0::17) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DM4PR11MB6019:EE_
X-MS-Office365-Filtering-Correlation-Id: 625b8920-6d16-4d95-2d05-08de4c23c543
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cUliNEpmMWRHUlBqaE8rR1Z2bTdSbzJ2bDF0YnNrWllYOHVwcy9IZldZL2hK?=
 =?utf-8?B?K0lHM2dlekdKaHNWMXZ1UE5TNHdDa0FrNWhoUTBDN0RnakFYM0s0OEVNWGdl?=
 =?utf-8?B?VzlneDFXS1VGZFBkazlnUnJBdHZGRnRCbHVBRHpNQUxiMFA5bHpMYWg3Ulkx?=
 =?utf-8?B?cmxZWEx6SzdCSzNvTXNiNm9pMU5pUnhnMnZTaFR5enhLVDFMZkhnWTVPU1Ba?=
 =?utf-8?B?bjBtNmgxLzNPRGdRb1VEYlp3R0Y1c01mTE9Mak5qQWJvUGllR1loSFRiYkxk?=
 =?utf-8?B?ZThWa1ZSZERHZlRxU3NoWFp6aVc4OXFFcGxJOUl2R2crWXFWZWgySWFQbTZS?=
 =?utf-8?B?N3htQTZWd1AvaklzQXVlcDZqUmJLaFRucTN2NEtXOFVwcUE2K255MCtsbTlz?=
 =?utf-8?B?dlN3Qld5c2FSdFQzRXVScnY2QUJGT29XUVY3YjN6OGRpZitwQWJ3SDAvcXZq?=
 =?utf-8?B?REt6Tk1vRzhSMFhUNDJOWmtSWnZnTTdnOTBhZjE5bGd3QmJrSDFqVHlHM2VB?=
 =?utf-8?B?bWpuT0dOakEwNzYzSnFHcUVuaTFLMEJOVk9RWjdXVzFwN2d2T3JGbXNxUmtx?=
 =?utf-8?B?SjYxRERIbXdxdENodlcxUk9Qc2FraVFBZkxuTkVXR1BXWWgwYjZ6dXZaQUlP?=
 =?utf-8?B?WUhKZXgzaG1ZVFNZVGYzYkFpN3l5Tk94VkZlUkNVQUpnREZFd0E2ejdNQWlM?=
 =?utf-8?B?OWE0QzQwclp1V0FIT2RFUlZ3RlVyU3AzNXBSUzlLekp3TThkK0tKN0dYb2Nq?=
 =?utf-8?B?ZmlNbThZcjh1dlhOWnVSckNYd3FqTmZKeklRYXRSb0NWdXVXbmtzM0ZkM2tz?=
 =?utf-8?B?blhLMTgreTBNdThZWHNOS1dwZndZc1libnRiekVoTjA2MWYyaExQano2Y29D?=
 =?utf-8?B?YmFtdXBVdjV6RkVrelhRNGdQN1ZUaU5KWUV3VHhJN1E1VTZOYVlPbmZHWWlz?=
 =?utf-8?B?eTYxMkhRRmJtUDlsd0RrODRDdFh1cGZFckhQMjJvZ3NSTUUycnpMcVpwZm8x?=
 =?utf-8?B?RkxaZkhXSEtReENTaGlkdXUzNE9LZjF3SWRSRU9uNUZwb1hmL29RUFBBaDdL?=
 =?utf-8?B?R1NSSFE4c09rSWJwTndxNEhIb0ZtbjZtWFBzOXJ5VFdOdHlySi9YN25vNTh1?=
 =?utf-8?B?a3B1T2pHWTZ2RGk5UUdVcVIvQzRDNFVoNWpSSWxDK1VLR3VJNERQejUyK0xG?=
 =?utf-8?B?eWZWdERtMEk4OVVlVXJWU0pwRXBKWFFtekdvcEZVbGgrUElOeGlrekZaam5G?=
 =?utf-8?B?RGJaMmZQRVpTMElOWnpVTmQ3anRmQU5WakZGS2pkWU9SV1V5ZDQrNm1tVDMv?=
 =?utf-8?B?cDdCS0IyalpXVlNjR0VPeUxkb2hUdkxjVkd4T3l5NDVycW9MMzREbVBXVzRN?=
 =?utf-8?B?T21ZSmhXdGExUHpkUVNrdGdZNmUrZVlOZHhxNVR4YjExYnVGV1N1Ri9GZHVl?=
 =?utf-8?B?cWw2elRPaENMVjNLUDEvSWNBaE52UkZhdWI4NXNOM3NlUzdLOWJwN21sSUgz?=
 =?utf-8?B?NHh5QndXUTY5T1V2eDhmY1hkS09nQUtydzJ0czc1UUJpeTl5UTFGVWcrLytD?=
 =?utf-8?B?UGYvVUpodHhpRXFpZlczVTg1ZGVyditvdUxVY0orc0R2SmR1UGp0Y0F1SkhG?=
 =?utf-8?B?aTdGWktqYzJnNDJmTE9GcXk1dXl0eVpXV05nWHVEWnNMdkdQZzlqZnNIQW02?=
 =?utf-8?B?TzBlaEkvWS9FV1RpM01pS3gzMnU5NW45RXUrL3RKUThLRHdLRm5ZOU9UMC9a?=
 =?utf-8?B?S3EwWk9XU0x0d1JBclVKM0FUdzJvTmpkL2pOV0ZYUUVYcEw4MnF3b2VrMTBq?=
 =?utf-8?B?ZTg4ZU1MRzdvbXd4bU1nUHR0NWJ0akZ4STdUaUdXRC9IeEFQY3QwMkd0TXBw?=
 =?utf-8?B?SEF1dU1GbzdXVnV3dHZxaU1haDNJbkFHRE5FQlpoWldqWkhEMDNkeFEwaHR4?=
 =?utf-8?B?dTVjdnR3a3NRRUVRbmg0dUZjdmNDSFJnNDE3emorNElXUVFRQkVnWHN0eFRK?=
 =?utf-8?B?bHV0ZGtxdEZRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ykk5Q0ZKcTk2S1NaWEpxa3Z4Smp5NnkzNG1YeTg3QnNvZnZVYTJDcWtEWDFL?=
 =?utf-8?B?Mm4xd3RGakVsRERLT2dLaFNqMklBN2tqczhIREd2dStOWWJmeDdhRW5CenB2?=
 =?utf-8?B?dVhyZXFrb29ocHd2WjZFTGwxT2xjZEFVUzl1K0dlWGo2UVVMSStmckFXT1M5?=
 =?utf-8?B?UVRDbkU0Z1RBWDBFMDdONlRvbDFuMGNnSGx1MngxMXB4U0dGckVEdUx3Y0JP?=
 =?utf-8?B?T296YjFxL2VsTWNGOFRKdW1KdkxPcm5KUmJpeHNOTUdZOG5qUmhNSDR0MVVU?=
 =?utf-8?B?cFZ3ZUNRdng1dmpQZW1kWGNiNGNRbTRvQ29SK1ZCakk5aW5JT3dnZGRzUWxK?=
 =?utf-8?B?UTJLNER1U0c2aGpudkVsZEFPM3EzdTdTV1UvZ0w2ZlNuQThTK2JCbnRLSVV0?=
 =?utf-8?B?Zk1TYTVNallZbnowQ01mRnE2dHVRZG5EYk00OXpNZGVpT3g1Y3RuUmtoR2sz?=
 =?utf-8?B?Y3VTa3ljNGl2YnZUbnpRRHBaRmd1SElld0lkMEMwTlBDcEE5MVg4YVBNTXlp?=
 =?utf-8?B?WmV3QTZueXVPV3ZuMkxIUzQzemxSb2p4VXdua2M1a3NqVVhFSVdrZUlXUUdq?=
 =?utf-8?B?U0RVTHA1RnBTRUVndWVTNHFjdG9VMm9ZR0xGaHdvOW5SZ2ZJbUkwT2o2U2hR?=
 =?utf-8?B?SEZQakRodlV6YzBBeXFCMTZMcXNNazdURmVoMEdhQmxuby9mWVpjOXFlaXlN?=
 =?utf-8?B?VlBYLzFRQnBmWFRmdm1MbXFFRHQrdEc3dnhMRHE4L092czd6UzRMdEVhbVdN?=
 =?utf-8?B?ekZabVduanYxZVFGNGZNRlB0dDNoamM1YVVNUDJpR1ZaeElLcTJEUlh5U28x?=
 =?utf-8?B?bm0zN2k5ekIxU2JFa3RqOVhGMkpyN3ZBYzl1d3phNTBkS1NYMjdXd0QyRFc1?=
 =?utf-8?B?TFlvQnZXY1k4YmxWdUxaOVhCV2VRaEtWcnplUEowVHROM0x6aC9mNlFPODZv?=
 =?utf-8?B?ZzI4RTFzVlpjSXNXTHRmT0NKNGpsRCtEZnRiOXZCNWlnTWdJQ3RTVTBUdTUw?=
 =?utf-8?B?UWMwaG8waEVITHIwaVY1TXdSUmZxMDZ0dzkwSnFDUFdJSzltREpwbG5uZTRn?=
 =?utf-8?B?OUpNYjR3SWZRdDEwNmFVbnZWamltYWRjV0JzRno5eTNuMklVZDN5b3k3Njg1?=
 =?utf-8?B?cGMwTWlRd1hGVVR1VU1FSng3enpybmZlaHJHb252Q3c0VlNXMFRiTnptUDZS?=
 =?utf-8?B?QnhSb0VtcXJWaHEyN0UvVm1Vd1F2VDNRcXA1bDBTaEN3WG1VSzY0amhwOGRD?=
 =?utf-8?B?aUwzZ0FZa2M0cUlPL2h1SGh0RCs4cnNpb1ZHOVp0MHk0bHd6OCtqdEJEYTFn?=
 =?utf-8?B?ZWY4MlhhajAyeURIelFWWDNyV2VOaFk0TFVlV3JoYzJjZ0lzVTRTUzkxdFpS?=
 =?utf-8?B?ZE1GNVY1UGRqT2puV1dPMEU1Mzh1V21KNnphcGRRMVhMemRqZVI3M0I2U0c2?=
 =?utf-8?B?UlJoc29zNFJ5WXFVdGE4dHluZ1F3ZUJyNlEzZmxYWjg3Y1BKWUM1bnhKWnFX?=
 =?utf-8?B?ZVgwZTVxVnZVeE5CK0tmSTB2TGFxSGZiSUdvUlVRWnZPZGJ6bGxnYXBIZHQ3?=
 =?utf-8?B?VEZ5dnoxWS92ZUZtSVJRSUtNOFp2cHZQNWg3RHNtLzhRQzcyTXc0YVJqbVJK?=
 =?utf-8?B?Rkwvb1JHTmRuMkRmbklhazRmajZKeDB5WkdtUjlFQ2lMUGJtQmxManpRd0hn?=
 =?utf-8?B?MVduN3ErRWIxTGU5ZVQ4OGpxNGZxUG5VeVFZdFE0dUpXK0xxL2FhZWVQNHhE?=
 =?utf-8?B?Q3R3akVFNm9pQlFTNDhpZTg0eitGQzJTbWNZSmdDbXJ1NkZlb21KN1VUazF2?=
 =?utf-8?B?Zlk0RWFIeUNVK1RWVTJoamszTmdEZVZQYWdHcGkvS2Z0SzNlRENJcFdhYWxC?=
 =?utf-8?B?a1pwRTlkb1l1dW8zSXdlT3hybVpzbUZuOUFrV0lSc2dZZ015WXNDOU1KSk0z?=
 =?utf-8?B?TFVmQmhYWG4vSDhaODdFU0VqcTZNVEVudHRuZHdsdUxUWCtaVFc1Nkh2K3Jv?=
 =?utf-8?B?ZUtCc3gyRTRGSWFHaGJBb3BBOG5xK2JPYnpieHQ3aVB6WmRzM3FZZUd4cnFR?=
 =?utf-8?B?TzRKM0FGbE00VjU1emY4eTRQQU1uZlkxY0FhUGtPWElwc3J5Si9uaitwSG4r?=
 =?utf-8?B?c1NqUWlZVzBZaFhFVk91em9SbDYwaHJydVRRZ2cxZzRZVVh4NlMrSnNCWHdE?=
 =?utf-8?B?N004dlVCamsrOHhDcEJoNE5OQStKZnl2UVpZOEpyT0dmVEZYemdRTU1MWWxq?=
 =?utf-8?B?SXdJZWkwbDh2bGtLQkpzYnp5dEdic2U3Q3VtTWpqVUdUMXN4YUVDMVoxaHFk?=
 =?utf-8?B?R2hmcWpXSnlHUjF4b1FTRmw0REtlUUZ1czYybVdwTTFRYkw2c0FXUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 625b8920-6d16-4d95-2d05-08de4c23c543
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 06:29:25.4411 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4FCatReR4oTZeMEK7N6NZ6/Yq0CVaHnW5TeCxBoS8hWTOrquQ7j4YpLtMaba6BoUTebfkFKsAjLNwbEAu1Ahsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6019
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

Hi Anoop

On 1/2/2026 10:24 PM, Anoop, Vijay wrote:
> From: Anoop Vijay <anoop.c.vijay@intel.com>
> 
> Add a new system controller (sysctrl) component for Intel Xe3p dGPU
> platforms.
> 
> This component provides the foundational infrastructure for communication
> with the System Controller firmware using MKHI protocol over a mailbox
> interface.
> 
> Key features introduced:
>   - Detection and initialization of System Controller interface on Xe3p
>     dGPU platforms
>   - Mailbox communication with System Controller firmware
>   - Fragmented message transfer for large command payloads
> 
> This implementation establishes the base for future System Controller
> feature enablement and firmware command handling.

Cover letter is not required for a single patch.
Also had version diff so that it's easier for the reviewers to know what 
changed between versions since this is a big patch.

> 
> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile               |   2 +
>   drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h |  44 +++
>   drivers/gpu/drm/xe/xe_device.c            |   5 +
>   drivers/gpu/drm/xe/xe_device_types.h      |   6 +
>   drivers/gpu/drm/xe/xe_pci.c               |   2 +
>   drivers/gpu/drm/xe/xe_pci_types.h         |   1 +
>   drivers/gpu/drm/xe/xe_sysctrl.c           |  62 ++++
>   drivers/gpu/drm/xe/xe_sysctrl.h           |  18 +
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox.c   | 409 ++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox.h   |  77 ++++
>   drivers/gpu/drm/xe/xe_sysctrl_types.h     |  23 ++
>   11 files changed, 649 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
>   create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.c
>   create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.h
>   create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>   create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>   create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 2b20c79d7ec9..947fbcac65d5 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -121,6 +121,8 @@ xe-y += xe_bb.o \
>   	xe_step.o \
>   	xe_survivability_mode.o \
>   	xe_sync.o \
> +	xe_sysctrl.o \
> +	xe_sysctrl_mailbox.o \
>   	xe_tile.o \
>   	xe_tile_sysfs.o \
>   	xe_tlb_inval.o \
> diff --git a/drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h b/drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
> new file mode 100644
> index 000000000000..6627a9c32c4f
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
> @@ -0,0 +1,44 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_SYSCTRL_REGS_H_
> +#define _XE_SYSCTRL_REGS_H_
> +
> +#include "xe_regs.h"
> +
> +#define SYSCTRL_BASE_OFFSET		0xDB000
> +#define SYSCTRL_BASE			(SOC_BASE + SYSCTRL_BASE_OFFSET)
> +#define SYSCTRL_MAILBOX_INDEX		0x03
> +#define SC_BAR_LENGTH			0x1000

Maintain consistency. Either SYSCTRL or SC

> +
> +#define SC_MB_CTRL			XE_REG(SYSCTRL_BASE + 0x10)
> +#define   SC_MB_CTRL_RUN_BUSY		REG_BIT(31)
> +#define   SC_MB_CTRL_IRQ		REG_BIT(30)
> +#define   SC_MB_CTRL_RUN_BUSY_OUT	REG_BIT(29)
> +#define   SC_MB_CTRL_PARAM3_MASK	REG_GENMASK(28, 24)
> +#define   SC_MB_CTRL_PARAM2_MASK	REG_GENMASK(23, 16)
> +#define   SC_MB_CTRL_PARAM1_MASK	REG_GENMASK(15, 8)
> +#define   SC_MB_CTRL_COMMAND_MASK	REG_GENMASK(7, 0)
> +
> +#define SC_MB_DATA0			XE_REG(SYSCTRL_BASE + 0x14)
> +#define SC_MB_DATA1			XE_REG(SYSCTRL_BASE + 0x18)
> +#define SC_MB_DATA2			XE_REG(SYSCTRL_BASE + 0x1C)
> +#define SC_MB_DATA3			XE_REG(SYSCTRL_BASE + 0x20)
> +
> +#define MKHI_FRAME_PHASE		REG_BIT(24)
> +#define MKHI_FRAME_CURRENT_MASK		REG_GENMASK(21, 16)
> +#define MKHI_FRAME_TOTAL_MASK		REG_GENMASK(13, 8)
> +#define MKHI_FRAME_COMMAND_MASK		REG_GENMASK(7, 0)
> +
> +#define SC_MB_FRAME_SIZE		16
> +#define SC_MB_MAX_FRAMES		64
> +#define SC_MB_MAX_MESSAGE_SIZE		(SC_MB_FRAME_SIZE * SC_MB_MAX_FRAMES)
> +#define SC_MKHI_COMMAND			5
> +
> +#define SC_MB_DEFAULT_TIMEOUT_MS	500
> +#define SC_MB_RETRY_TIMEOUT_MS		20
> +#define SC_MB_POLL_INTERVAL_US		100
> +
> +#endif /* _XE_SYSCTRL_REGS_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index e101d290b2a6..805d48dd954d 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -66,6 +66,7 @@
>   #include "xe_survivability_mode.h"
>   #include "xe_sriov.h"
>   #include "xe_svm.h"
> +#include "xe_sysctrl.h"
>   #include "xe_tile.h"
>   #include "xe_ttm_stolen_mgr.h"
>   #include "xe_ttm_sys_mgr.h"
> @@ -1032,6 +1033,10 @@ int xe_device_probe(struct xe_device *xe)
>   	if (err)
>   		goto err_unregister_display;
>   
> +	err = xe_sysctrl_init(xe);
> +	if (err)
> +		goto err_unregister_display;
> +
>   	err = xe_device_sysfs_init(xe);
>   	if (err)
>   		goto err_unregister_display;
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index a85be9ba175e..6295b2c35d4a 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -29,6 +29,7 @@
>   #include "xe_sriov_vf_ccs_types.h"
>   #include "xe_step_types.h"
>   #include "xe_survivability_mode_types.h"
> +#include "xe_sysctrl_types.h"
>   #include "xe_tile_sriov_vf_types.h"
>   #include "xe_validation.h"
>   
> @@ -340,6 +341,8 @@ struct xe_device {
>   		u8 has_soc_remapper_telem:1;
>   		/** @info.has_sriov: Supports SR-IOV */
>   		u8 has_sriov:1;
> +		/** @info.has_sysctrl: Supports System Controller */
> +		u8 has_sysctrl:1;
>   		/** @info.has_usm: Device has unified shared memory support */
>   		u8 has_usm:1;
>   		/** @info.has_64bit_timestamp: Device supports 64-bit timestamps */
> @@ -606,6 +609,9 @@ struct xe_device {
>   	/** @heci_gsc: graphics security controller */
>   	struct xe_heci_gsc heci_gsc;
>   
> +	/** @sc: System Controller */
> +	struct xe_sysctrl sc;
> +
>   	/** @nvm: discrete graphics non-volatile memory */
>   	struct intel_dg_nvm_dev *nvm;
>   
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 91e0553a8163..b6dc3030b673 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -426,6 +426,7 @@ static const struct xe_device_desc cri_desc = {
>   	.has_soc_remapper_sysctrl = true,
>   	.has_soc_remapper_telem = true,
>   	.has_sriov = true,
> +	.has_sysctrl = true,
>   	.max_gt_per_tile = 2,
>   	.require_force_probe = true,
>   	.va_bits = 57,
> @@ -701,6 +702,7 @@ static int xe_info_init_early(struct xe_device *xe,
>   	xe->info.has_soc_remapper_telem = desc->has_soc_remapper_telem;
>   	xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev)) &&
>   		desc->has_sriov;
> +	xe->info.has_sysctrl = desc->has_sysctrl;
>   	xe->info.has_mem_copy_instr = desc->has_mem_copy_instr;
>   	xe->info.skip_guc_pc = desc->skip_guc_pc;
>   	xe->info.skip_mtcfg = desc->skip_mtcfg;
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index 5f20f56571d1..53e44a32883d 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -56,6 +56,7 @@ struct xe_device_desc {
>   	u8 has_soc_remapper_sysctrl:1;
>   	u8 has_soc_remapper_telem:1;
>   	u8 has_sriov:1;
> +	u8 has_sysctrl:1;
>   	u8 needs_scratch:1;
>   	u8 skip_guc_pc:1;
>   	u8 skip_mtcfg:1;
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
> new file mode 100644
> index 000000000000..e0e7b0ecf2bf
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
> @@ -0,0 +1,62 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <drm/drm_managed.h>
> +#include <linux/device.h>
> +#include <linux/mutex.h>
> +
> +#include "regs/xe_sysctrl_regs.h"
> +#include "xe_device.h"
> +#include "xe_printk.h"
> +#include "xe_soc_remapper.h"
> +#include "xe_sysctrl.h"
> +#include "xe_sysctrl_mailbox.h"
> +#include "xe_sysctrl_types.h"

A short documentation of System controller would be helpful here.

> +
> +static void xe_sysctrl_fini(void *arg)
> +{
> +	struct xe_sysctrl *sc = arg;
> +	struct xe_device *xe = sc_to_xe(sc);
> +
> +	if (!xe->soc_remapper.set_sysctrl_region)
> +		return;
 > +> +	xe->soc_remapper.set_sysctrl_region(xe, 0);
> +}
> +
> +/**
> + * xe_sysctrl_init - Initialize SC subsystem
> + * @xe: xe device instance
> + *
> + * Entry point for SC initialization, called from xe_device_probe().
> + * This function checks platform support and initializes the system controller.
> + *
> + * Return: 0 on success, error code on failure
> + */
> +int xe_sysctrl_init(struct xe_device *xe)
> +{
> +	struct xe_sysctrl *sc = &xe->sc;
> +	int ret;
> +
> +	if (!xe->info.has_sysctrl)
> +		return 0;
> +
> +	ret = devm_add_action_or_reset(xe->drm.dev, xe_sysctrl_fini, sc);

Add this after set_sysctrl region.

> +	if (ret)
> +		return ret;
> +
> +	if (!xe->soc_remapper.set_sysctrl_region)
> +		return -ENODEV;
> +
> +	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX
> +
> +	ret = drmm_mutex_init(&xe->drm, &sc->cmd_lock);
> +	if (ret)
> +		return ret;
> +
> +	xe_sysctrl_mailbox_init(sc);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
> new file mode 100644
> index 000000000000..fe90d6577d54
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_SYSCTRL_H_
> +#define _XE_SYSCTRL_H_
> +
> +struct xe_device;
> +
> +static inline struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
> +{
> +	return container_of(sc, struct xe_device, sc);
> +}
> +
> +int xe_sysctrl_init(struct xe_device *xe);
> +
> +#endif /* _XE_SYSCTRL_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> new file mode 100644
> index 000000000000..940ea535da2e
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> @@ -0,0 +1,409 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/errno.h>
> +#include <linux/minmax.h>
> +#include <linux/mutex.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/types.h>
> +
> +#include "regs/xe_sysctrl_regs.h"
> +#include "xe_device.h"
> +#include "xe_mmio.h"
> +#include "xe_pm.h"
> +#include "xe_printk.h"
> +#include "xe_sysctrl.h"
> +#include "xe_sysctrl_mailbox.h"
> +#include "xe_sysctrl_types.h"
> +
> +static bool xe_sysctrl_mailbox_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
> +					      unsigned int timeout_ms)
> +{
> +	struct xe_device *xe = sc_to_xe(sc);
> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> +	int ret;
> +
> +	ret = xe_mmio_wait32_not(mmio, SC_MB_CTRL, bit_mask, bit_mask,
> +				 timeout_ms * 1000, NULL, false);
> +
> +	return ret == 0;
> +}
> +
> +static bool xe_sysctrl_mailbox_wait_bit_set(struct xe_sysctrl *sc, u32 bit_mask,
> +					    unsigned int timeout_ms)
> +{
> +	struct xe_device *xe = sc_to_xe(sc);
> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> +	int ret;
> +
> +	ret = xe_mmio_wait32(mmio, SC_MB_CTRL, bit_mask, bit_mask,
> +			     timeout_ms * 1000, NULL, false);
> +
> +	return ret == 0;
> +}
> +
> +static int xe_sysctrl_mailbox_write_frame(struct xe_sysctrl *sc, const void *frame,
> +					  size_t len)
> +{
> +	static const struct xe_reg regs[] = {
> +		SC_MB_DATA0, SC_MB_DATA1, SC_MB_DATA2, SC_MB_DATA3
> +	};
> +	struct xe_device *xe = sc_to_xe(sc);
> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> +	u32 val[SC_MB_FRAME_SIZE / sizeof(u32)] = {0};
> +	u32 dw = DIV_ROUND_UP(len, sizeof(u32));
> +	u32 i;
> +
> +	memcpy(val, frame, len);
> +
> +	for (i = 0; i < dw; i++)
> +		xe_mmio_write32(mmio, regs[i], val[i]);
> +
> +	return 0;
> +}
> +
> +static int xe_sysctrl_mailbox_read_frame(struct xe_sysctrl *sc, void *frame,
> +					 size_t len)
> +{
> +	static const struct xe_reg regs[] = {
> +		SC_MB_DATA0, SC_MB_DATA1, SC_MB_DATA2, SC_MB_DATA3
> +	};
> +	struct xe_device *xe = sc_to_xe(sc);
> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> +	u32 val[SC_MB_FRAME_SIZE / sizeof(u32)] = {0};
> +	u32 dw = DIV_ROUND_UP(len, sizeof(u32));
> +	u32 i;
> +
> +	for (i = 0; i < dw; i++)
> +		val[i] = xe_mmio_read32(mmio, regs[i]);
> +
> +	memcpy(frame, val, len);
> +
> +	return 0;
> +}
> +
> +static void xe_sysctrl_mailbox_clear_response(struct xe_sysctrl *sc)
> +{
> +	struct xe_device *xe = sc_to_xe(sc);
> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> +
> +	xe_mmio_rmw32(mmio, SC_MB_CTRL, SC_MB_CTRL_RUN_BUSY_OUT, 0);
> +}
> +
> +static int xe_sysctrl_mailbox_prepare_command(struct xe_sysctrl *sc,
> +					      u8 group_id, u8 command,
> +					      const void *data_in, size_t data_in_len,
> +					      u8 **mbox_cmd, size_t *cmd_size)
> +{
> +	struct xe_device *xe = sc_to_xe(sc);
> +	struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
> +	size_t size;
> +	u8 *buffer;
> +
> +	size = sizeof(*mkhi_hdr) + data_in_len;
> +	if (size > SC_MB_MAX_MESSAGE_SIZE) {
> +		xe_err(xe, "sysctrl: Message too large: %zu bytes\n", size);
> +		return -EINVAL;
> +	}
> +
> +	buffer = kmalloc(size, GFP_KERNEL);
> +	if (!buffer)
> +		return -ENOMEM;
> +
> +	mkhi_hdr = (struct xe_sysctrl_mailbox_mkhi_msg_hdr *)buffer;
> +	mkhi_hdr->data = cpu_to_le32(FIELD_PREP(MKHI_HDR_GROUP_ID_MASK, group_id) |
> +				     FIELD_PREP(MKHI_HDR_COMMAND_MASK, command & 0x7F) |
> +				     FIELD_PREP(MKHI_HDR_IS_RESPONSE, 0) |
> +				     FIELD_PREP(MKHI_HDR_RESERVED_MASK, 0) |
> +				     FIELD_PREP(MKHI_HDR_RESULT_MASK, 0));
> +
> +	if (data_in && data_in_len)
> +		memcpy(buffer + sizeof(*mkhi_hdr), data_in, data_in_len);
> +
> +	*mbox_cmd = buffer;
> +	*cmd_size = size;
> +
> +	return 0;
> +}
> +
> +static int xe_sysctrl_mailbox_send_frames(struct xe_sysctrl *sc, const u8 *mbox_cmd,
> +					  size_t cmd_size, unsigned int timeout_ms)
> +{
> +	struct xe_device *xe = sc_to_xe(sc);
> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> +	u32 ctrl_reg, total_frames, frame;
> +	size_t bytes_sent, frame_size;
> +
> +	total_frames = DIV_ROUND_UP(cmd_size, SC_MB_FRAME_SIZE);
> +
> +	if (!xe_sysctrl_mailbox_wait_bit_clear(sc, SC_MB_CTRL_RUN_BUSY, timeout_ms)) {
> +		xe_err(xe, "sysctrl: Mailbox busy\n");
> +		return -EBUSY;
> +	}
> +
> +	sc->phase_bit ^= 1;
> +	bytes_sent = 0;
> +
> +	for (frame = 0; frame < total_frames; frame++) {
> +		frame_size = min(cmd_size - bytes_sent, (size_t)SC_MB_FRAME_SIZE);
> +
> +		if (xe_sysctrl_mailbox_write_frame(sc, mbox_cmd + bytes_sent, frame_size)) {
> +			xe_err(xe, "sysctrl: Failed to write frame %u\n", frame);
> +			sc->phase_bit ^= 1;
> +			return -EIO;
> +		}
> +
> +		ctrl_reg = SC_MB_CTRL_RUN_BUSY |
> +			   FIELD_PREP(MKHI_FRAME_CURRENT_MASK, frame) |
> +			   FIELD_PREP(MKHI_FRAME_TOTAL_MASK, total_frames - 1) |
> +			   FIELD_PREP(MKHI_FRAME_COMMAND_MASK, SC_MKHI_COMMAND) |
> +			   (sc->phase_bit ? MKHI_FRAME_PHASE : 0);
> +
> +		xe_mmio_write32(mmio, SC_MB_CTRL, ctrl_reg);
> +
> +		if (!xe_sysctrl_mailbox_wait_bit_clear(sc, SC_MB_CTRL_RUN_BUSY, timeout_ms)) {
> +			xe_err(xe, "sysctrl: Frame %u acknowledgment timeout\n", frame);
> +			return -ETIMEDOUT;
> +		}
> +
> +		bytes_sent += frame_size;
> +	}
> +
> +	return 0;
> +}
> +
> +static int xe_sysctrl_mailbox_process_first_frame(struct xe_sysctrl *sc,
> +						  const struct xe_sysctrl_mailbox_mkhi_msg_hdr *req,
> +						  void *out,
> +						  size_t frame_size,
> +						  size_t *payload_bytes)
> +{
> +	struct xe_device *xe = sc_to_xe(sc);
> +	u32 frame_data[4];
> +	struct xe_sysctrl_mailbox_mkhi_msg_hdr *resp_hdr;
> +	size_t hdr_size = sizeof(*resp_hdr);
> +	size_t payload_size;
> +	int ret;
> +
> +	ret = xe_sysctrl_mailbox_read_frame(sc, frame_data, frame_size);
> +	if (ret)
> +		return ret;
> +
> +	resp_hdr = (struct xe_sysctrl_mailbox_mkhi_msg_hdr *)frame_data;
> +
> +	if (!XE_SYSCTRL_MKHI_HDR_IS_RESPONSE(resp_hdr) ||
> +	    XE_SYSCTRL_MKHI_HDR_GROUP_ID(resp_hdr) != XE_SYSCTRL_MKHI_HDR_GROUP_ID(req) ||
> +	    XE_SYSCTRL_MKHI_HDR_COMMAND(resp_hdr) != XE_SYSCTRL_MKHI_HDR_COMMAND(req)) {
> +		xe_err(xe, "SC: Response header mismatch\n");
> +		return -EPROTO;
> +	}
> +
> +	if (XE_SYSCTRL_MKHI_HDR_RESULT(resp_hdr) != 0) {
> +		xe_err(xe, "SC: Firmware error: 0x%02lx\n",
> +		       XE_SYSCTRL_MKHI_HDR_RESULT(resp_hdr));
> +		return -EIO;
> +	}
> +
> +	payload_size = frame_size - hdr_size;
> +	if (payload_size > 0)
> +		memcpy(out, (u8 *)frame_data + hdr_size, payload_size);
> +
> +	*payload_bytes = payload_size;
> +
> +	xe_sysctrl_mailbox_clear_response(sc);
> +
> +	return 0;
> +}
> +
> +static int xe_sysctrl_mailbox_process_frame(struct xe_sysctrl *sc,
> +					    void *out, size_t frame_size,
> +					    unsigned int timeout_ms)
> +{
> +	struct xe_device *xe = sc_to_xe(sc);
> +	int ret;
> +
> +	if (!xe_sysctrl_mailbox_wait_bit_set(sc, SC_MB_CTRL_RUN_BUSY_OUT, timeout_ms)) {
> +		xe_err(xe, "sysctrl: Response frame timeout\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	ret = xe_sysctrl_mailbox_read_frame(sc, out, frame_size);
> +	if (ret)
> +		return ret;
> +
> +	xe_sysctrl_mailbox_clear_response(sc);
> +
> +	return 0;
> +}
> +
> +static int xe_sysctrl_mailbox_receive_frames(struct xe_sysctrl *sc,
> +					     const struct xe_sysctrl_mailbox_mkhi_msg_hdr *req,
> +					     void *data_out, size_t data_out_len,
> +					     size_t *rdata_len, unsigned int timeout_ms)
> +{
> +	struct xe_device *xe = sc_to_xe(sc);
> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> +	struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
> +	u32 ctrl_reg, total_frames, frame;
> +	size_t hdr_size = sizeof(*mkhi_hdr);
> +	u8 *out = data_out;
> +	size_t received = 0;
> +	size_t frame_size;
> +	int ret = 0;
> +
> +	if (!xe_sysctrl_mailbox_wait_bit_set(sc, SC_MB_CTRL_RUN_BUSY_OUT, timeout_ms)) {
> +		xe_err(xe, "sysctrl: Response frame 0 timeout\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	ctrl_reg = xe_mmio_read32(mmio, SC_MB_CTRL);
> +	total_frames = FIELD_GET(MKHI_FRAME_TOTAL_MASK, ctrl_reg) + 1;
> +
> +	if (total_frames == 1)
> +		frame_size = min(hdr_size + data_out_len, (size_t)SC_MB_FRAME_SIZE);
> +	else
> +		frame_size = SC_MB_FRAME_SIZE;
> +
> +	ret = xe_sysctrl_mailbox_process_first_frame(sc, req, out, frame_size, &received);
> +	if (ret)
> +		return ret;
> +
> +	out += received;
> +
> +	for (frame = 1; frame < total_frames; frame++) {
> +		size_t remaining = data_out_len - received;
> +
> +		frame_size = min_t(size_t, remaining, SC_MB_FRAME_SIZE);
> +
> +		ret = xe_sysctrl_mailbox_process_frame(sc, out, frame_size, timeout_ms);
> +		if (ret)
> +			break;
> +
> +		received += frame_size;
> +		out += frame_size;
> +	}
> +
> +	*rdata_len = received;
> +
> +	return ret;
> +}
> +
> +static int xe_sysctrl_mailbox_send_command(struct xe_sysctrl *sc,
> +					   const u8 *mbox_cmd, size_t cmd_size,
> +					   void *data_out, size_t data_out_len,
> +					   size_t *rdata_len, unsigned int timeout_ms)
> +{
> +	const struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
> +	size_t received;
> +	int ret;
> +
> +	ret = xe_sysctrl_mailbox_send_frames(sc, mbox_cmd, cmd_size, timeout_ms);
> +	if (ret)
> +		return ret;
> +
> +	if (!data_out || !rdata_len)
> +		return 0;
> +
> +	mkhi_hdr = (const struct xe_sysctrl_mailbox_mkhi_msg_hdr *)mbox_cmd;
> +
> +	ret = xe_sysctrl_mailbox_receive_frames(sc, mkhi_hdr, data_out, data_out_len,
> +						&received, timeout_ms);
> +	if (ret)
> +		return ret;
> +
> +	*rdata_len = received;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_sysctrl_send_command - Send command to System Controller via mailbox
> + * @handle: XE device handle
> + * @cmd_buffer: Pointer to xe_sysctrl_mailbox_command structure
> + * @rdata_len: Pointer to store actual response data size (can be NULL)
> + *
> + * Send a command to the System Controller using MKHI protocol. Handles
> + * command preparation, fragmentation, transmission, and response reception.
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +int xe_sysctrl_send_command(void *handle, void *cmd_buffer, size_t *rdata_len)
> +{
> +	struct xe_device *xe = handle;
> +	struct xe_sysctrl *sc = &xe->sc;
> +	struct xe_sysctrl_mailbox_command *cmd = cmd_buffer;
> +	u8 *mbox_cmd = NULL;
> +	size_t cmd_size = 0;
> +	u8 group_id, command_code;
> +	int ret = 0;
> +
> +	if (!xe) {
> +		pr_err("sysctrl: Invalid device handle\n");
> +		return -EINVAL;
> +	}
> +
> +	if (!cmd) {
> +		xe_err(xe, "sysctrl: Invalid command buffer\n");
> +		return -EINVAL;
> +	}
> +
> +	if (!xe->info.has_sysctrl)
> +		return -ENODEV;
> +
> +	group_id = XE_SYSCTRL_APP_HDR_GROUP_ID(&cmd->header);
> +	command_code = XE_SYSCTRL_APP_HDR_COMMAND(&cmd->header);
> +
> +	if (!cmd->data_in && cmd->data_in_len) {
> +		xe_err(xe, "sysctrl: Invalid input parameters\n");
> +		return -EINVAL;
> +	}
> +
> +	if (!cmd->data_out && cmd->data_out_len) {
> +		xe_err(xe, "sysctrl: Invalid output parameters\n");
> +		return -EINVAL;
> +	}
> +
> +	might_sleep();
> +
> +	ret = xe_sysctrl_mailbox_prepare_command(sc, group_id, command_code,
> +						 cmd->data_in, cmd->data_in_len,
> +						 &mbox_cmd, &cmd_size);
> +	if (ret) {
> +		xe_err(xe, "sysctrl: Failed to prepare command: %d\n", ret);
> +		return ret;
> +	}
> +
> +	guard(xe_pm_runtime)(xe);
> +
> +	guard(mutex)(&sc->cmd_lock);
> +
> +	ret = xe_sysctrl_mailbox_send_command(sc, mbox_cmd, cmd_size,
> +					      cmd->data_out, cmd->data_out_len, rdata_len,
> +					      SC_MB_DEFAULT_TIMEOUT_MS);
> +	if (ret)
> +		xe_err(xe, "sysctrl: Mailbox command failed: %d\n", ret);
> +
> +	kfree(mbox_cmd);
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_sysctrl_mailbox_init - Initialize the System Controller mailbox state
> + * @sc: System controller structure
> + */

Missing description https://docs.kernel.org/doc-guide/kernel-doc.html

> +void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc)
> +{
> +	struct xe_device *xe = sc_to_xe(sc);
> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> +	u32 ctrl_reg;
> +
> +	ctrl_reg = xe_mmio_read32(mmio, SC_MB_CTRL);
> +	sc->phase_bit = (ctrl_reg & MKHI_FRAME_PHASE) ? 1 : 0;
> +
> +	xe_mmio_rmw32(mmio, SC_MB_CTRL, MKHI_FRAME_PHASE, 0);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> new file mode 100644
> index 000000000000..3e472418ebd0
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> @@ -0,0 +1,77 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef __XE_SYSCTRL_MAILBOX_H__
> +#define __XE_SYSCTRL_MAILBOX_H__
> +
> +#include <linux/bitfield.h>
> +#include <linux/types.h>
> +
> +struct xe_sysctrl;
> +
> +#define MKHI_HDR_GROUP_ID_MASK		GENMASK(7, 0)
> +#define MKHI_HDR_COMMAND_MASK		GENMASK(14, 8)
> +#define MKHI_HDR_IS_RESPONSE		BIT(15)
> +#define MKHI_HDR_RESERVED_MASK		GENMASK(23, 16)
> +#define MKHI_HDR_RESULT_MASK		GENMASK(31, 24)
> +
> +struct xe_sysctrl_mailbox_mkhi_msg_hdr {
> +	__le32 data;
> +} __packed;
> +
> +#define APP_HDR_GROUP_ID_MASK		GENMASK(7, 0)
> +#define APP_HDR_COMMAND_MASK		GENMASK(15, 8)
> +#define APP_HDR_VERSION_MASK		GENMASK(23, 16)
> +#define APP_HDR_RESERVED_MASK		GENMASK(31, 24)
> +
> +struct xe_sysctrl_mailbox_app_msg_hdr {
> +	__le32 data;
> +} __packed;
> +
> +#define XE_SYSCTRL_APP_HDR_GROUP_ID(hdr) \
> +	FIELD_GET(APP_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
> +
> +#define XE_SYSCTRL_APP_HDR_COMMAND(hdr) \
> +	FIELD_GET(APP_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
> +
> +#define XE_SYSCTRL_APP_HDR_VERSION(hdr) \
> +	FIELD_GET(APP_HDR_VERSION_MASK, le32_to_cpu((hdr)->data))
> +
> +#define XE_SYSCTRL_MKHI_HDR_GROUP_ID(hdr) \
> +	FIELD_GET(MKHI_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
> +
> +#define XE_SYSCTRL_MKHI_HDR_COMMAND(hdr) \
> +	FIELD_GET(MKHI_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
> +
> +#define XE_SYSCTRL_MKHI_HDR_IS_RESPONSE(hdr) \
> +	FIELD_GET(MKHI_HDR_IS_RESPONSE, le32_to_cpu((hdr)->data))
> +
> +#define XE_SYSCTRL_MKHI_HDR_RESULT(hdr) \
> +	FIELD_GET(MKHI_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
> +
> +/**
> + * struct xe_sysctrl_mailbox_command - System Controller mailbox command structure
> + */
> +struct xe_sysctrl_mailbox_command {
> +	/** @header: Application message header containing command information */
> +	struct xe_sysctrl_mailbox_app_msg_hdr header;
> +
> +	/** @data_in: Pointer to input payload data (can be NULL if no input data) */
> +	void *data_in;
> +
> +	/** @data_in_len: Size of input payload in bytes (0 if no input data) */
> +	size_t data_in_len;
> +
> +	/** @data_out: Pointer to output buffer for response data (can be NULL if no response) */
> +	void *data_out;
> +
> +	/** @data_out_len: Size of output buffer in bytes (0 if no response expected) */
> +	size_t data_out_len;
> +};

structures are defined in _types.h

Thanks
Riana

> +
> +void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc);
> +int xe_sysctrl_send_command(void *handle, void *cmd_buffer, size_t *rdata_len);
> +
> +#endif /* __XE_SYSCTRL_MAILBOX_H__ */
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> new file mode 100644
> index 000000000000..88a34967688b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_SYSCTRL_TYPES_H_
> +#define _XE_SYSCTRL_TYPES_H_
> +
> +#include <linux/mutex.h>
> +#include <linux/types.h>
> +
> +/**
> + * struct xe_sysctrl - System Controller driver context
> + */
> +struct xe_sysctrl {
> +	/** @cmd_lock: Mutex protecting mailbox command operations */
> +	struct mutex cmd_lock;
> +
> +	/** @phase_bit: MKHI message boundary phase toggle bit */
> +	u32 phase_bit;
> +};
> +
> +#endif /* _XE_SYSCTRL_TYPES_H_ */

