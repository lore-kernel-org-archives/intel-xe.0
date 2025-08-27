Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EBC6CA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 20:42:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E3E510E8B8;
	Wed, 27 Aug 2025 20:42:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AJ4ozpGF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C30610E8B8
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 20:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756327360; x=1787863360;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qzggT5u+RQmZWNm72pE6fzSgL+T8F4tbROUP/7Rw2J4=;
 b=AJ4ozpGFVZ1um2GA8Hjg5IerTr2eqMLbK1iqnDvnwMU7XfW+V3AnTSys
 TjF9ObpESJGorrxev2xDiTqHARhWIiprWgLyHC8Jb4ICFQ5vT/soHf42y
 trF5sgF1rDQ289fWP8b9CYmu7LGsHYQN8mawwInZRvbUZ0iZmxNw6cKch
 FmBpi57z0SfIhuPdkL3CkawvuqMuTLsu1eYmbU681ih3S+RAA/b9QSIDk
 VSaYC9DyozRR9NBOMhzek3Kdo1wVfx/Nd90Ud6b2XgkZx6HJcZH+LsAVZ
 wgrEMQQ4MycMtKsZ9uAk6AzDW5EZMGaIgw2PDaZvaOD/tAaItCRu/ruMF Q==;
X-CSE-ConnectionGUID: zwglXbbIRxaLeMJ4+y0kPQ==
X-CSE-MsgGUID: Dm5kJmZoSVmKNe/Y6wjyrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="58738757"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="58738757"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 13:42:39 -0700
X-CSE-ConnectionGUID: ECklDAHHQf6ba+O4YTHpGQ==
X-CSE-MsgGUID: lylrys/9Q5WM+Rek7SQaig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="170325789"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 13:42:39 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 13:42:38 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 13:42:38 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.62) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 13:42:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JqIMJw9LVN2FHVpRwi9Yy2htSpFkvjnRhQakUlxlycPQmKlkqceyIVkoEYEV8v9lNQAgOEjZ6pYPLn97BZ+ppMlnaXr0ymrBoVfy0KnkJkukByy4xp/lADkIQcBGL+1H2mtgJ7kEhK0GUS3ehpceSFz3O2ODHVpqSShHv1TiXyizaA+dmk9a9ytpnizpjVxWWHcj2j8Zfkili8AScoBI8YJw33D+WeYru4YCO5HIdWhJ1i6qNk0/54kaZvJu1ZlBnmACxHGyXkDwnwgs6Sasejo//yVum2hKLE8nE4sP4MnLNC9y+nMDU5XqenvoPXR+Zj5KT4apXyJlyt8y5zlwWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O7LS3GKwOXPrvr7EnuhlAHWg1anIZgHM1I1aTNI2wGA=;
 b=k0Oh5VmFiL6aFeK0yDKxpXYN2inhJ5tUgSE54iwGFuPiB9qD7qzhO8zgFqiJFHPds1V4ZZxjWtjMfGSWlRCW3juFj0Ax1+v/Wr2RiI6NbmkO2x8fQnrx5+J4x5bMlc43I7Nm0nd06VyugjYNy5xAF20ygxFB4/T3THRhdbsjgWux0+BHsRHicJDwVVf2bUKZYyBSxN+hoDzS/Tl0GQtmO25J/mhHqRiqpzPywMW4mVjMWpuscKhkLC8dJrDoeo14B7mkLb2A8LBj1hQIJeaqNEJU4Ehw029fJxDGnjKmluamMfI0/v8krMhs+YCqJQugYqYbw7IOwgY8luFg2aYswg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by SJ0PR11MB4846.namprd11.prod.outlook.com
 (2603:10b6:a03:2d8::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Wed, 27 Aug
 2025 20:42:36 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab%6]) with mapi id 15.20.9073.014; Wed, 27 Aug 2025
 20:42:36 +0000
Message-ID: <c04c5641-f724-4416-bd6a-08d5a0dcd159@intel.com>
Date: Thu, 28 Aug 2025 02:12:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/uapi: Fix kernel-doc formatting for madvise and
 vma_query
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
References: <20250827190136.3810508-1-himal.prasad.ghimiray@intel.com>
 <aK9SPl80UTjp5Cvt@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aK9SPl80UTjp5Cvt@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0113.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::14) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|SJ0PR11MB4846:EE_
X-MS-Office365-Filtering-Correlation-Id: 05caf81a-936f-4edb-50be-08dde5aa40fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M3hOdXhHdStucDlmTlhyc0NSRVlNMXBORDRWMTI4b0R4Qk5qNWRGdnlpcGRR?=
 =?utf-8?B?QldsYVRqWEpQZko3OHowVFdBZ2JnZjkrTXN1R0NkRG1aS3A5dmJ6eUtnbjBN?=
 =?utf-8?B?OHZGSjlMWVpzWldaSjI2R0JrdFNldkJkRFdxdXpFU1NFTE5FdnNhZC9neG1R?=
 =?utf-8?B?OXhRNW50R3MyK0ZvU1RxTlljWTdlRWYyNkRDLzhjSE9FMXdiMFJ3d3BOQ0N3?=
 =?utf-8?B?VHorWmtNSHpnR0xIU1FCVTIzT1owSWJ0NWpHZFJuVVE3Q1g2YjhlaktXT3ZJ?=
 =?utf-8?B?RkRtK1crTU9zRVJxNUxGZ1AvZDc1MUdWMkgwT1QybmtXb3BQNndTUloyZFdv?=
 =?utf-8?B?cUgvR3N3VXZBU0RJdHIrTVpIWUFqd2hwSjRuQ1dyWEJ2V2VxK0IybklEdzli?=
 =?utf-8?B?SkhQN2haOHZxQ25STWNWUFRzaW1IT0ZuZVoyTExBZkU5enNVL3ovRFZhMllq?=
 =?utf-8?B?VFFNVVlGN2RYdmxoRzJYMXNmdThMbFVlemZHVk5NQ0hEYkpaMm5QcEU4czJp?=
 =?utf-8?B?Yi9iUndPVEtEUmMvWVJQbWRxVm5oc2hvOURuUnNDLy9TbUJ6MmlJNGhEV1RS?=
 =?utf-8?B?dzhXaGJLNWtUbi93TlQ4WGp2UjlCK1EwT1ZCaGl3MDV0ZkZFbng3Q2lJcDFR?=
 =?utf-8?B?dUpQb2RMSGNvam5lVUcxS28zS09laDVBNElndE9RaHlSRWljNGRuUXBsS2hI?=
 =?utf-8?B?VUpuTjNOZWF3L0UremlQVlBZQmdkR3QzYVMveGFPRm9aTWdZU1Axdy9yZ2VS?=
 =?utf-8?B?UUdaK1l5RnpqTHpUNXZXcWUwbkg1ek94ODNKV1JTQk82b2pZUUZwZStUSUxo?=
 =?utf-8?B?VllnTDlxNWVrdHh2UE9IYzkzYjF3V0NjU052TjZac3JOdU9kRHVETDlZMndv?=
 =?utf-8?B?N1dGYTNQV1FLU3BaUFRLd1o2eHdOZUxCUmRQTEhsaldrbzdQNjhzajI4VlMy?=
 =?utf-8?B?SGt1RXNJMWtmT0kyVmFNYVhLVi8zUXRYNTFLSFRQNndPVjdSMDVRdmdxRlhw?=
 =?utf-8?B?TUJNdTljVVE4ZVpJcmErbjczb1dCRGh6cGNBbWZkRnRvNzJRRVZrTU8xeXVY?=
 =?utf-8?B?ZU93KzJyNTczQWxIemcvRkkveS9oenkzcHlRTU1ENVpvOHIvR1V5MCtHMWlJ?=
 =?utf-8?B?SFRnK00rZXU0WWM0ekZlSytzYXBWTjlybTQ0UVQvaGI0MDM2OGhPU0kvTUJP?=
 =?utf-8?B?UmNPbjNEN0N2RzhnNHRzM1dkZGgvcVk3cStvWkZGRFdRS000S1BBblVLL21X?=
 =?utf-8?B?aTNZMi94bFFnSmhhdGQ2QmlMVUVNdld6YWpKWEpXdjBreXBLWmY5d2lwbFcw?=
 =?utf-8?B?aWkvQlhqVTlwaFRDSDhpUytPVXZyS3czQk0zanEvUHo2V1hqRG9UejhoYVVU?=
 =?utf-8?B?czIyWFVvRmpQUXEwU0Uxazk5L2taU3Ixb21VWk9kTUNNQWpRN0pDZVc0UzVI?=
 =?utf-8?B?WEM2SXVWbVpUZnk3WDlEejhLc09oZDNYTHIxcE1hQ25zazBQa1dVY3loQ1Jn?=
 =?utf-8?B?a09TYTNFVEliSkFEeWZETGxzR01XRG9HT3Z1WDZYSXc3ZWM1YUdRSVpGSUhq?=
 =?utf-8?B?VkhDTnN2ZjE2TE92Q3RCeTU1TERkNFJ3SlNJSjZwY1NoVHM2S2lyVUwrN3da?=
 =?utf-8?B?Y3VYN1k1OEprVmN4RzFjUkNydExwWnAvelg3Y1NMeVVieHpycmFuVXZpUXJV?=
 =?utf-8?B?Wk4wK09UQ3JiNnlqaDRpeGJjK0JsT1BxbmxBNWlUTjM3VU4zQW5NaDBTMFB1?=
 =?utf-8?B?QmdEN2hLSVVuaEQzanJLVEkyODZoUnpIdGFFY2dyenVWTFpWeEEvN2FjWnl6?=
 =?utf-8?B?aDk4WTloOHcwMGtWN3A0MFh1M1prSHA3ZldCL2l0bmdmZ2xidHVzQVhOM2VM?=
 =?utf-8?B?VmUxRzg0YTVVWlo1ZFdGN2xjWjNuQXZJZkYzSWJTbnlQa0hpK0l6M3Bud21u?=
 =?utf-8?Q?9N8K6cp7bEs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnRXZjBQS085UDBsLy9NSVZuZnhJVUNZeVowdWRxU0VxcnlTK1VNRFlZall0?=
 =?utf-8?B?a2lVdm1Nek9oNXhwRTVxZnB5WEoxdGlZdGRnV0RVWkFkVUhhRWVKb2d0VWI4?=
 =?utf-8?B?SHNKUUhwU3ZVMWFmRzU2NUM5WVhXWkNCS1dXaEFmdkhubmlZT0tuQ2VQaUpt?=
 =?utf-8?B?TEc3cVpGU2NFN3JUVkxNalN0enJTK1VKQUFIVW1TU0VMNHBpVWc2dllpdGV0?=
 =?utf-8?B?UGtaSDQzV2MvdndwdTdTUmxKY2VzcWlabHhrNnUzaG1MVTN5eEh3RmYrR1Vt?=
 =?utf-8?B?ek9aN1ZENlFUUEpvQmtQbmVMZS85SHc5VFFPL0Z2b1ZjTUFiQXVXSmN1NlIx?=
 =?utf-8?B?UXB2Vk9meUNuVCttd2ZVVnROSHRXYnlicXZlNzB3UW5BTXU1UW44M3B3bWs4?=
 =?utf-8?B?ZkNOd2k4WHUwY0RIMzZkY3ErMHBWdnd6T3EzdFoyay95SFppUTJUT3RrdnVS?=
 =?utf-8?B?SEEyZmpFQTV4TUNiN21lZENrekViVFVHSCtHSHRPWkhpOHVnSEpCODVLTmdV?=
 =?utf-8?B?L3BjU01CU0x1ZXhCbmRGNHNPbnFMRlJNZ3VxK2ZaK3JGSWk3Z1ArajlwZHpm?=
 =?utf-8?B?cGhDTEdXZDJKeTRGSTRPR1lFdE5ScnR5RE56ZGplSk1aMUVRRktaUjdzTnZJ?=
 =?utf-8?B?MisybHJZQU9CdmpidzRRZkNabFQreU1KSmdTWnEyc0hFZWJIWHR2cU91U1hF?=
 =?utf-8?B?SU5MMVZ5MTVGWnBmZXkyaG1uUGhxV3owOVNZbmcxR2tOdUtkV3Z0N0sxMzMv?=
 =?utf-8?B?QkR0eVBsNGhaTHVWaUV2VXk3a3A3dlBIUXpTTkxrUEwyUkJyNURPTzFNUzVq?=
 =?utf-8?B?R291MFNjbytRajh4cUk1a3IwQW9XOFFIaU1CL25zdUFSdnVuSXlPVEJKSDh1?=
 =?utf-8?B?RGJla3RjZklKNUltbW5Yb1YyWTREZU9CclI0KzdMcXVWc1FIejdFSGtzVU55?=
 =?utf-8?B?RzNURVpJN3pVemxpZ3JrOHEzekEvRTYyellPeWNTbGlQb2hNck9UUVRHa3pS?=
 =?utf-8?B?WXFJbWtWUUdpc2lZWDFDWG5FRnZ1akZFOEYxaTIrYWdpK0ltOUE0NnJLeHMr?=
 =?utf-8?B?YjFpM1pxQ2d2OUtQSlp3bTZDWFN5YUhqMEpHQ0N3dG9PeWh2WjJ4T3h1Rnc3?=
 =?utf-8?B?d0JsTU9GZkd4V2tia0hJS0FGNTJPMEFQQzNwZzRXWVgwVElTTEpDSjM5dHpO?=
 =?utf-8?B?MTJpMmpGRFRzWFoyV2ZCTG5XdlVZRmhGaWZyNTQ2WnRjd1U3d01pTWQvc2hS?=
 =?utf-8?B?VlEyUCtFSFVxL0liYmlKcVlITzRjYTFUSVBWc1R5cWl0YUkySWlDdXY4bDQx?=
 =?utf-8?B?MTR4Z01aTEIyNmFjL1cxUDVDMy9aUU9CY1BLV3N6dUQ0UE1LcSsxOCt0MVBG?=
 =?utf-8?B?VG9JUjVocDdiQSs5MXFXeXNYbExVZTl3cFdSN216WHVsLzcvYkEyd3NmbFhr?=
 =?utf-8?B?YVppOUdIUFpFZmhWUDBlOTk5Z0h1YkNoRTNiSFA5MlJvT09kSTRFWG43eUNP?=
 =?utf-8?B?VUFlMnZpS2pFSllQc056WWFueEU2enJlNzRTWlNUZm9aU2dURE8yQUJQM093?=
 =?utf-8?B?ZElkVnQ4NnhTUnJ4QTlCOGlTekpnRDI4TUhzLzdqSDZBbzZtcDNNb1ZHcU95?=
 =?utf-8?B?Mkd6bFZiT2oyL0g1TU5oaDhSaDFNS3crbmttTlJKUzNHZ1NxdEhtOG96SEpK?=
 =?utf-8?B?Z08yNngxU1JnajBGRktxYTRrWUJJRHlFVk9qOHBtQ2dZTS8yL1d4VFljNTEy?=
 =?utf-8?B?dENXQUM4cWtxQkVjZGlvMlI1YnUreDdIeGpxRGJiMnE0QzArQkFmZGhxMyto?=
 =?utf-8?B?dTRYMytxM2JNLzlFUXdTM0p5aGJoNXBscWNpSWFlSTFkaTlBUlJNRkRmbVpy?=
 =?utf-8?B?USs0Y1hvSUhOUzVuZVhVWWZia3Y4MmRUYlo4d2srV2Vtc0RuRWo4bU9HcFRK?=
 =?utf-8?B?YlJUK0RxNkd4WEN0QnFqNkVMQkNId2xibE5NcUE4ak9UeWF1WjNMZW9GOW9y?=
 =?utf-8?B?QXBONTdLZFdaM3J5WGRmVUN0bVFIb3B3KzVSNUptc2VYcEQ1c2gvV3VQMGo5?=
 =?utf-8?B?Vy9IMWRUZlhsNHZibG9QbTkvUFVISWZoVVBHb2Y5bU1qT0NKSFJjK3VQOG1F?=
 =?utf-8?B?VHRTekVRdkt5QnU3cjNHZ201MDFmNVdHUTc0eG5OK29qUCtaUXUyOExTVi9F?=
 =?utf-8?B?aUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 05caf81a-936f-4edb-50be-08dde5aa40fe
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 20:42:35.9033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wrZ7ri5I97/U9Zgus1qmDsxmIq0mlkGstq0YuUqhii//Y8QooBJqCndP5Z6PPS6HaSfQHrv5O3XARJa1VF5A7ue4hKwtVbHO2uh1UZr3RH8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4846
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



On 28-08-2025 00:15, Matthew Brost wrote:
> On Thu, Aug 28, 2025 at 12:31:35AM +0530, Himal Prasad Ghimiray wrote:
>> Correct kernel-doc formatting issues in the UAPI definitions for
>> madvise and VMA query interfaces to resolve docutils warnings during
>> documentation build.
>>
>> Fixes: 418807860e94 ("drm/xe/uapi: Add UAPI for querying VMA count and memory attributes")
>> Fixes: 231bb0ee7aa5 ("drm/xe/uapi: Add madvise interface")
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   include/uapi/drm/xe_drm.h | 29 +++++++++++++++++------------
>>   1 file changed, 17 insertions(+), 12 deletions(-)
>>
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 7dedd45ab995..a164deedae33 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -2006,12 +2006,12 @@ struct drm_xe_query_eu_stall {
>>    * .. code-block:: C
>>    *
>>    * struct drm_xe_madvise madvise = {
>> - *          .vm_id = vm_id,
>> - *          .start = 0x100000,
>> - *          .range = 0x2000,
>> - *          .type = DRM_XE_MEM_RANGE_ATTR_ATOMIC,
>> - *          .atomic_val = DRM_XE_ATOMIC_DEVICE,
>> - *         };
>> + *     .vm_id = vm_id,
>> + *     .start = 0x100000,
>> + *     .range = 0x2000,
>> + *     .type = DRM_XE_MEM_RANGE_ATTR_ATOMIC,
>> + *     .atomic_val = DRM_XE_ATOMIC_DEVICE,
>> + *     };
>>    *
>>    * ioctl(fd, DRM_IOCTL_XE_MADVISE, &madvise);
>>    *
>> @@ -2073,12 +2073,16 @@ struct drm_xe_madvise {
>>   		 * Used when @type == DRM_XE_MEM_RANGE_ATTR_ATOMIC.
>>   		 *
>>   		 * Supported values for @atomic.val:
>> -		 * - DRM_XE_ATOMIC_UNDEFINED: Undefined or default behaviour
>> -		 *   Support both GPU and CPU atomic operations for system allocator
>> -		 *   Support GPU atomic operations for normal(bo) allocator
>> -		 * - DRM_XE_ATOMIC_DEVICE: Support GPU atomic operations
>> -		 * - DRM_XE_ATOMIC_GLOBAL: Support both GPU and CPU atomic operations
>> -		 * - DRM_XE_ATOMIC_CPU: Support CPU atomic
>> +		 * - DRM_XE_ATOMIC_UNDEFINED: Undefined or default behaviour.
>> +		     Support both GPU and CPU atomic operations for system allocator.
>> +		     Support GPU atomic operations for normal(bo) allocator.
> 
> Missing a couple of * here?

sphinx was throwing "WARNING: Unexpected indentation" for multiline 
bullet for * usage in other lines apart from first.

Removing these * docutil doesn't throw any such warning.
> 
> Matt
> 
>> +		 *
>> +		 * - DRM_XE_ATOMIC_DEVICE: Support GPU atomic operations.
>> +		 *
>> +		 * - DRM_XE_ATOMIC_GLOBAL: Support both GPU and CPU atomic operations.
>> +		 *
>> +		 * - DRM_XE_ATOMIC_CPU: Support CPU atomic only, no GPU atomics supported.
>> +		 *
>>   		 */
>>   		struct {
>>   #define DRM_XE_ATOMIC_UNDEFINED	0
>> @@ -2196,6 +2200,7 @@ struct drm_xe_mem_range_attr {
>>    * Example:
>>    *
>>    * .. code-block:: C
>> + *
>>    *    struct drm_xe_vm_query_mem_range_attr query = {
>>    *         .vm_id = vm_id,
>>    *         .start = 0x100000,
>> -- 
>> 2.34.1
>>

