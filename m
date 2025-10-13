Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCABCCD183
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 10:03:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FCD110E420;
	Mon, 13 Oct 2025 10:03:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ltFjl5qL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3B1810E1E4
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 10:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760349814; x=1791885814;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Y5ZsC6Z4Nlg384cAF5+Jb8GZxwK9rdc8R1S5ADDNWH4=;
 b=ltFjl5qLPeWLOvT2eOuLq5j8Yh1OmS8FIVv/EcrVWXHC42NoBz/4WIhE
 mVDD0xuAc4kQG07Mhul50rrZ4uWH5veyMFGS9irmoleeiKF4MFwJCalth
 MLIo/GKc6ilhnxsTD1TyxkS6LuSbUgxa3g/iiClK9kpDPFwfcjrpDapl/
 tJOVAKqnOkIA1wFd5zXhI2apcBjhZxpfcDk3vN3x7X/xXGTLxf8PnmMGY
 gBXF2Bb+776alIabT7/p20m+RRfUQGM6qWTTIfPGq8cdsNrEvrnHnnFzF
 vO8hdrh9ouzdciSwo4qIEHOxO47qRmI8dA+44RKsyRHqfxCsh6gE01hZe A==;
X-CSE-ConnectionGUID: Jaj1EJDFTlajnzYECMDj9w==
X-CSE-MsgGUID: 9FdfdaZLSPSHKWcEUUZ4Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="62524711"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="62524711"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 03:03:33 -0700
X-CSE-ConnectionGUID: GnaLvHHPRR2iN0Shbe+mMw==
X-CSE-MsgGUID: FRCK3SNRSGGmg+4vOLVS7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="218671962"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 03:03:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 03:03:32 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 03:03:32 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.71) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 03:03:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hEgzF/W7neKJGKB+Q3shZ6XslTTrTfShMcOpCpbpmqyB4NoL2isokQkgR00n+WEeCFQq4EAj8wr3X2i9a/XapaC9QPpazLKx8qJafT7pJrZche/GX101X6GcOpSW3DzWGrBmwdC6fSHrCTwkGcZ+dq+ECvgZZ/5loBFmm8lxWu1HjKgSuMGEEvHEO7EsYd8Pnp93geWnVr2BtWleCn5/iXd3mFB+bwtNTkkRyrqHpMk4Rwrkd6GulcAGqlHWSWapJu0nZOtzTmrreySd90SC3vbH1YZf8d469y5x1VcwwwIchz7V/cXhXeKHeM4nj6NvesaqEBcjLxxvXNHAkUMPQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kkXFuTHb8O5ahLdkXAvyaUojT3eL/cWzOXV9cWgcZZ0=;
 b=eYzZ1IuKtVbxu2doPvmAnILgeOx/PU268bNC7GWL8mIRm22x5jjcUHZJb8ij6qxmt9/g/T7YS9XnR/rM+SDoUWKc8+EyiRppJ6X1tWyeLpjj1pQaw4kjjdkIdIL3QE2ji4ip6V2Qf/iFQwPeKGTjAkQhhTCmfxJGgS7C+Nv0n9/5hGlXLluQNnm6xD1/agmVaF47V3QT5VZ5rNfpWuuQSJnoQjCIl4upwakm+dLuNUjYsrad0Ejw9Xw7qTiQwS+414IXtYBPP7gap7vT+XwF7fmg1dwS6bLWrimjEdJeEIfN/KOX9hfu/EfLGCQILSlJ9N0NOkSR/VdJXeD9TH524g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by SA0PR11MB4702.namprd11.prod.outlook.com (2603:10b6:806:92::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Mon, 13 Oct
 2025 10:03:30 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%5]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 10:03:29 +0000
Message-ID: <9b2eb57b-8c56-4440-9604-1823bc93a2b5@intel.com>
Date: Mon, 13 Oct 2025 15:33:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Refresh RPe frequency while setting min
 frequency
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>
References: <20251009180853.578184-2-sk.anirban@intel.com>
 <aOgTgFc_-FgrV9wJ@intel.com> <694610a1-6735-4875-978f-c626e9300050@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <694610a1-6735-4875-978f-c626e9300050@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0081.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::13) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|SA0PR11MB4702:EE_
X-MS-Office365-Filtering-Correlation-Id: 854f7290-46db-45f4-3436-08de0a3fc24c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dXMwZFQ4SmpLbGR6QUgxM3g4S3B3NWFERE1qYzE5RDZhbURBMVZkUEZoenBa?=
 =?utf-8?B?SnBpK0krWWxabHh6R2NUd2tsVlptdnU5czBRUVdXcVF6ejhvMTNSemZTZGNZ?=
 =?utf-8?B?Y3RaR05LazZWc3dGMXB0VHJBNCsrRjZRQXZ4UG1WWlFiRDVuWFREbE5DWTJI?=
 =?utf-8?B?UzIzVWt6aDBUVFdlYURhMHVuWUY4Q3JDNG44dmpucVpvNVhvK2c0cjVnUmtR?=
 =?utf-8?B?SUZHSzdSbnVhQXRkakxwVGdzUWtITXdnTkxhMHJVVDFKUm1nbnhhMkxydmtF?=
 =?utf-8?B?VVViWkFIMTBhODRvOW5aaGxEcnd5SEptQnJWQTh3aFk0MmlhQUJMRGJ5QXd0?=
 =?utf-8?B?ZS9wWTB4T2lxRE12eFJYbUFZRmg2NXFCaGlPSU83Zzg3R29hTWlDNUpjazFL?=
 =?utf-8?B?UU1mY2VubkRtc3BFcE1TUFhzRlZzS25LaG44eFJGbGlublV3dWs2QTFEUDJp?=
 =?utf-8?B?cEVlaG15MDUxRFlvRUU2dGNXVTBTeUU5U1RKUkZueVpXTU1qWm1VZG4ya3Vl?=
 =?utf-8?B?QytlaktHQUtoM25KUTUvemZJWDJCNHZZaXlRbWxvWjRRb1lyaVl5VGVrTm1O?=
 =?utf-8?B?WWh5S0NYOTVGcEtzVFdleFpLdVFrOHVsUjRYbDd6WGJBc1F3TEpKMmpVZnAx?=
 =?utf-8?B?Z285TUpRczVid0lPOXpqbk0zQm5PM1hSTTZTbldDNUZjOWVMZ1ZtNkdVS1Fs?=
 =?utf-8?B?VkhZWW4vbFBJOCtPZHhhS2NHRHovNnpkWkJ3SmxiY0lJaW1aaEdFWm5KMWVW?=
 =?utf-8?B?bXR6L2pKTVd1bG9NQ0RvSGVSa2wwRFpkSlNjUW94dit6bWJkU2NUZnE0ZkJ3?=
 =?utf-8?B?c3RMbUxINTV3cFJVT3ZlZkJPTE9kOS9MMmdZQVlzWWxVckRBM21jUUNYSGE5?=
 =?utf-8?B?WjRxSUgvZm4xeXJjcDdURzBLWFZ6czcyYm9mUUZkdmcrR0FxaGNUcUt4empP?=
 =?utf-8?B?cUE5cGxId1pQUk5vQjF3WGZhOWJBNGVOSHhFMEJ0UGk1dFB4bW9NMWswWW1k?=
 =?utf-8?B?KzY0d0FlVEdMZjhSeHY1YlVDUUR2VHZXenczRCtGNUpzOTRZSVJFRDdMUnNQ?=
 =?utf-8?B?YVZwOTNUMFQvQnVBSWh2TnpEZytsVHdremhTc1NPcjZjNHc0NXJKUkhuNlBG?=
 =?utf-8?B?YVJrUGJwV1NEMThseTdQKzlaa2VqYVNxKzdGYUpudmNtZzlaM1paZGgwRHlj?=
 =?utf-8?B?d1hVSUFRbElQeUt3V3NGeU04ZzFZc1BiOVBEQjF5enpzcjh0eHQ0YkVQMkpN?=
 =?utf-8?B?YkhTMjI5aHdPU3VQQWcwVmNjY0VGS29ucWkwQmZFL1FiNmx1MjA0NTJ6QStM?=
 =?utf-8?B?eGpENm5ES2RHSFRxcDJPN0toU014RmpnRlpKN3MwQlVuWDROWWJSckxRSlVL?=
 =?utf-8?B?UHZtN3dpcXJmSWhndnhTRGlEYmI4MjJBMTBtaEprYmcxQ0xLUitkZHVJUG1P?=
 =?utf-8?B?RDkrcUxkMEYyR2JEQzBieUY4RkNGc284UVF1MHhybU9tUFlpLzlJTXlnZnZN?=
 =?utf-8?B?UlFDTzJtZklISlZGcHBERE5HM3JST01wUVZXUEV2Yy85TXJjQlVaV1FFclFt?=
 =?utf-8?B?V016Qm1wSUM0b2pwVGxmNUJyWlV1Qjl0NDhSODN3Z1dDNENXMXBoS0dKQmU2?=
 =?utf-8?B?TFNKdFY2UVVSenl0Y1FSV25zeHl0YXJsRGZwQ0oxZWM0RFlJM3BSVjd6ZTli?=
 =?utf-8?B?UTIzMzBOcUwxYllwTllZY2dhR3lkcFJiSjJLMzRkZTlGamtaVEZKZ2krdEN1?=
 =?utf-8?B?N2JSNGJHbnVMa3IzTkVLd3dka0lHRC83VHJqMzg4Nmc2Snh1Z3pOeWtYWGJ3?=
 =?utf-8?B?Vm5OWEdpcUVveGh4SlZhRk1vVldIdGRuS25Hd05hN0p0MklDYitMVjJ6SjdL?=
 =?utf-8?B?QnN6QzNMZnJOK04zWnBYTUc1NCszdFFOUFZ3WjNGQWs2eFE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUZYaDY3VDI2VDM0SFhXbHdsaG5wNmNrNUVSZjcycEFTa1VnSHMxZFZnaE04?=
 =?utf-8?B?eWcweDdoeGg4RmZibnpHQzlXTXF2Q1VtZ3Rpbmc4Q0dFV1I0a29HMnhrZnBr?=
 =?utf-8?B?aGJRNWJDWU83Y3NWRjI3ajR3bUd6TWY0Um15UmIrcmhGRTlML1RFejErSjFx?=
 =?utf-8?B?NnpUb0FubFVsZ1VHVHRobUFmYUIwdno2Q1VxSkZ5VzNFSzBTdDR2dDRLbFVJ?=
 =?utf-8?B?aEIvRXdLWS9ValJKWWVneHhnZXYrdFpGajRZMEkyaTJjQ2JTYXVuQnNnYVNk?=
 =?utf-8?B?cHNCeFBwTVdvc0FOVENMUDFYZ2VQOERObnl5VTk4ZmIzbUF4aXFza2c0R2t3?=
 =?utf-8?B?K3VzRDRLZUJ3SHdYaGpid2tRcXNBTWJYTElYaTZYdDNjZUExcHJzeGRqTlhQ?=
 =?utf-8?B?eXRNbnRZNnlMdy9sSCtlRjNoQjlCclBCenJqL0VVS2Yvekh6VUMyREVpN2lK?=
 =?utf-8?B?UFVSVER2bUNIbmhLaTg4N2pxZFhaQnZLb2REeTRLcnNZcXlUZkthYUYvZ2k5?=
 =?utf-8?B?VDM4ZEpNWWNndTMvTHlHbGh0TURKVFU1cW9RUC9NU0FuYWVBRzRSaWVrVXpw?=
 =?utf-8?B?TUZTbUIxNG5weFNnaXRuN2lnVElmSHFPdGFCSHpvQTNBbThqd1ZZTTFFUEpq?=
 =?utf-8?B?UTVZNXJicmdqcDBlSVloTC9wQzdyMFE5Qnh5OGNreUdtN29TY0FSOVQ0aXUr?=
 =?utf-8?B?R1NiVDZKMXZFMFdPYW1HYllNOHFvNm5va2FXOEpFZkE4S2dQazNPYkEzck95?=
 =?utf-8?B?ZzlRUVJkL1F6OGxlSUlmSGkyV0VUNTdSeWVpV2xYWUpyWVc3UytiNFd6RzhI?=
 =?utf-8?B?MFhXWXg5bzVGbjFldXlIZlZFN3RSMHN2TStvTG9UZEVaZmUvaFZwRk85NEw2?=
 =?utf-8?B?M2NBNGptVTFJN09FL1ovVXZHWHp5N3N0Z0lIZ3UzOFpqVlhuYzhabFJhTFQ0?=
 =?utf-8?B?TEpudFJVSFNaTDh2bXpDaGtUdEFhTkNKSnZQeHJTOHhOSFFpWXRCcU16NVVB?=
 =?utf-8?B?clBQTitOTkhCOHlDbUJGbTNYZi9wV2dxa3JFMEJXR1hDWFFOQm5JRmZFdXJJ?=
 =?utf-8?B?NUxQV1hHM2k0UUcwOTRyLzQrNnQ1NGJzaFIrSlMyc3AvQ0E3eXdXNDduQnRE?=
 =?utf-8?B?UDhHRGNzK3JpZDNJQ2QzSGRMV3BsRlRKczFQNHFZZ054TjdWaU5pRlNMcU5i?=
 =?utf-8?B?eDFZaUU1YlpDdEM2RzNua3FqQUg4L2lWOEphcGc2ZkZHcEltUDNmZ3hCUHFt?=
 =?utf-8?B?TU45Q1VMVDRZeEk2U0o0M3llTXJFTDJJR0hseGhEZ01xZ0dnSDU5NEJVV1Fl?=
 =?utf-8?B?N0pYbkIybVp6c09YakhQVmp2MWRTSE9CZm9SS21UQ2FmcnJ3bExWdUtBb0lw?=
 =?utf-8?B?QnpGbUtqV2JGTVlVZFRmc2dTbVhoSEtEcEdPZ1dqZitKczRvYXhUSTBOVnM5?=
 =?utf-8?B?M0s3aDYxVWM1Y3gzVWdObnR4MzI1R0Z6c1F4em9OS3lzZ09ReEJrWWlySFZU?=
 =?utf-8?B?Z1AxYkpMQjNNOVVBMlRqSFRTWVErRiszUFJxNU5yTjg1R2dtMk5NWDc2a0NI?=
 =?utf-8?B?SjZaSC9nMkYrVEVSbnRTTUhBUWpsdmJYWitrTGQ5dU40aVJsTTl2L2NKejlx?=
 =?utf-8?B?M1pnZDQwM25jZzZ2SXJ3dkFmUzF4d2VObklKQTJOQTZOcXVDeWhtcU4wa0dz?=
 =?utf-8?B?WVZZU055RGZKV1Y5ZnpOYkpaWDdzdnZtc2RmYVJCdCs3aEpuV2hnRTVOQllP?=
 =?utf-8?B?dWVBY0lHbkw3dHN2L01uWTloR2lJT3NwV3ZhajZXbitTV0hUQllWWFZDUjNy?=
 =?utf-8?B?UEJlSzV6WkZBRlhSU0JGY2tJS0QyTW9zaFNlaVZTa0xzVXIvTVlvelFhRWRi?=
 =?utf-8?B?YVcwN1RQeWlsd1RoOHY1N1hYRkpLci9INHhhMDk3bGpJUkhnMWw4TUFzbWlj?=
 =?utf-8?B?S3ZwR2JONHArTHRZZU1WeDdBZ2pxWEh1TGU3cUZxVEtkUW82aUdrU2pJRGky?=
 =?utf-8?B?ZjJvNXZQSk5ZVUxPcFNzdFR4SFFpSXo5QmhoK2ozVkJIdWZSQkJKZjRCNCs4?=
 =?utf-8?B?eFYwRmVXUW9NQ29aQ21MdjFEUURPUy9oNElVNW4vcjd6WEFiMnFiQWE2MEUv?=
 =?utf-8?Q?damoa85vLUovpER3v0ji6GOLc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 854f7290-46db-45f4-3436-08de0a3fc24c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 10:03:29.7700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZsSzdtSy6yNNeBw/MlBCUQRICISglRTSDXk9rTpHenhoMpbK1y22U0YyPzQ/ELxEFAKazF36jgh7ZovcDnBgBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4702
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

On 10-10-2025 02:17, Belgaumkar, Vinay wrote:
>
> On 10/9/2025 12:56 PM, Rodrigo Vivi wrote:
>> On Thu, Oct 09, 2025 at 11:38:54PM +0530, Sk Anirban wrote:
>>> Replace cached pc->rpe_freq with xe_guc_pc_get_rpe_freq() call to 
>>> ensure
>>> current RPe values are used when setting
>>> SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY.
>>>
>>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5166
>>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>
>>> ---
>>>   drivers/gpu/drm/xe/xe_guc_pc.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c 
>>> b/drivers/gpu/drm/xe/xe_guc_pc.c
>>> index 3c0feb50a1e2..ea1ff96bec32 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>>> @@ -330,7 +330,7 @@ static int pc_set_min_freq(struct xe_guc_pc *pc, 
>>> u32 freq)
>>>        * Our goal is to have the admin choices respected.
>>>        */
>>>       pc_action_set_param(pc, SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
>>> -                freq < pc->rpe_freq);
>>> +                freq < xe_guc_pc_get_rpe_freq(pc));
>> I believe this is correct... But wondering if we should entirely kill 
>> the
>> pc->rpe_freq ?!
>>
>> Vinay, thoughts?
>
> Makes sense. No point caching something that can change based on 
> thermal conditions.
>
> Thanks,
>
> Vinay.
A new series has been sent to address this change, 
https://patchwork.freedesktop.org/series/155809/ .

Thanks,
Anirban
>
>>
>>>         return pc_action_set_param(pc,
>>> SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>>> -- 
>>> 2.43.0
>>>

