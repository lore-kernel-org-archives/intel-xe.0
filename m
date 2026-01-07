Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50ADFCF6BF1
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jan 2026 05:50:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDAC910E00B;
	Wed,  7 Jan 2026 05:50:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bcwIXPRL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17F8F10E00B
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jan 2026 05:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767765032; x=1799301032;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=mB5s4Z8ex4cvRPckVXAG9SWSfjyKEJJMd8ZttOTQ9XM=;
 b=bcwIXPRLxF2kvHZ/SVgjQEE7a0lvZ3eQAH0itDpYVzhGM1UkIxNi0yv9
 Xg+zmzZiVNXWzIEb7mEy4IfMZU5gTr53VKTYS0w2f1Wlm9gCJbQjIcln+
 ALFpRDUn2NX/zJh9QI5xGFHfHaLAa8kZ7X4ZSXl+WFOQ76Fcs03FQALx8
 ACR/kZ54Q/lY5KZU0276WaKZUqa0gXLVzTSxSEACIDv/PNvn7khtGv0Li
 irgKZhHlUQ43RvCTOzwrhiLo1jyM9fqpGkL5YB+Dt9VGaHXeqQ2Z4W/hl
 nkp2LOlN22a5f1BVSNNRjbyOQ0jAmHvzPRq6k6OCbaUlJAZQ0ncbK2zCG w==;
X-CSE-ConnectionGUID: vmL17mSoQMCTP1p4dMl+OQ==
X-CSE-MsgGUID: 82Fyd5PFSQqJJZMiBsB3RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="79433590"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="79433590"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 21:50:31 -0800
X-CSE-ConnectionGUID: QweFvt1GQLCQt5/nfveTbA==
X-CSE-MsgGUID: ZV3Tn036S6Oh0OarFxPfLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="202744962"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 21:50:30 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 21:50:29 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 6 Jan 2026 21:50:29 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.4) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 21:50:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WtoBbvKJPcQT+agcP0aF0/rdSygLW+r60WmWNpVfujiwg/eEDfw18VtML4DyCrTMqwSNez+h56SGTxN2jv4jXemwClx8IhyOC2Moy/2pSRpKQ3RLVdtjAIN8i2DK74gZhJvulDngKohvEslVJ0FHRKOzZLMgpvgtFIQ60YJrJpiKOptUh6Kpgy2lMFe65aRY8JcrrWmbYwm8tH7EMdJu8VmpUEo16Da41gVvIh2/hHAhucEgs3sYsl4qZ4ei8qKWzY65MXotEi+MKIz7M43i/H3UbG7D96pdr2A49l6EIHsoKZHqjkdDo6pnAQy8zfpXG5WZEIp0gSYiYU48cxtK/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TX9l2AM+XON3+HWamMFCrNgUZokOjWSNhUKcKFTXyt0=;
 b=KT3Kx4hjuTp02MsFCQ0IxlDttozWBICNDdalFJe1G4qosYOH/yx0blBOeUgXnC2ELRMY42mJaBJrDuEBg+HjDGDkmv/ppklcJPZRC5f11GRxCOHAStJJ63j3I4LFPd5RQfJft/cRuj9Bhm47ZQWKyIfw8LOMbZ5VEhOmZ9a/nZ1rWzMgzpfzlQFEAZOQT42as+5Zpk8dX1hB2jiu8prtP3u2zfUHWNX95fiiMWZxowxeUFZLyH29Uh4qRTLxZ9kjF+ODxmdCeTnmaMG7ldEZw4T+iyxbeE4x4q0aSRn3/HbWJgvyhoD99Nl4u6dMtYvys81OOw+icyh5ZCMrlakadQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA3PR11MB7486.namprd11.prod.outlook.com (2603:10b6:806:314::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.2; Wed, 7 Jan 2026 05:50:21 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%7]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 05:50:21 +0000
Message-ID: <471a7fb0-532b-43db-bcf9-fa2320ac21a2@intel.com>
Date: Wed, 7 Jan 2026 11:20:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] drm/xe: Decouple GuC RC code from xe_guc_pc
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251223085129.412961-1-vinay.belgaumkar@intel.com>
 <20251223085129.412961-2-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20251223085129.412961-2-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0117.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::20) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA3PR11MB7486:EE_
X-MS-Office365-Filtering-Correlation-Id: af1ad47a-c968-4617-bf5d-08de4db0a4f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VzZzYTB0ZDhnQkh0QTJUckdRZitkODFyaHFia3R3VFV1bE56REV1T3FjdEZn?=
 =?utf-8?B?bDY3WnVDOTBHY2twZ3hKdEFZR1o2T0F1VHZld1dsSTBWemUyV1hiUTRMMHhz?=
 =?utf-8?B?OE4zd1NvMmJvZlpJSzZmNlY3Y2RPU2xrQ0M4SExiQ2NWM1BhWlFUNG9rNmgy?=
 =?utf-8?B?T2FPTVBodGZSa0VpZFNGUkRkUkNRd09rRVFuK3NMSS92WWxubUhYMTA1WnZm?=
 =?utf-8?B?WGZRWFQ5K0FveExOcStWZDlrbDhhWldKNmZ4bUgwRXZTanNMWkxiWGszLzFW?=
 =?utf-8?B?MzRzaFdTZkVkc2RETzhaRXRLc2VmSE1PYTBPTTNaRG1YOUZrM2tsRUxRL2I3?=
 =?utf-8?B?N3RNVkUvR0liZUorZm9nQlJxR1F4V2M5RVd2akJSZzlNR25LZGFkTXU0VnJ0?=
 =?utf-8?B?dWxmR0dmVDdhbVV2cnNBcEQwUXV3ajJrU0NUNFhwVmxlMzFsNDJuYzFrc1RD?=
 =?utf-8?B?eUR4bG04VTBjT0FvSXprUlhNWnV2TGxtWk5XaVBETTQweGFaTGtiKzFCcUg5?=
 =?utf-8?B?SkI4cm5hMGM0Ym9zZlNwM0F5Z2dHUWJIWWJDc0Iwa21zUzA3UEV2emRiemZF?=
 =?utf-8?B?NWpIcnBaVDk4TDNQQW93U3g0bGFwVk4zRlBlWHZsaElCenhCa3hSWEp2dDBz?=
 =?utf-8?B?Y1h0eEpselE3YTRkVDVGQmdnd1ZoUFhjQ21QZzhtVE1LZkY5TTc5QzBkK21J?=
 =?utf-8?B?dFFQenp6SktBY1lydnB5OTVRQ2FNaCtEcHpOdzJQNHVPeHFKd2lWYjBlMTNZ?=
 =?utf-8?B?NTFMdm5GQjh5K0Y2VElUbkdrRGNyNVR0WCs4SGo0WUJLQ2VxdnlOTjdRWXhJ?=
 =?utf-8?B?bk15OEVBVnJvYmFqVHk5MEYrRGluUUdpOGVmeGhpcDVxbG5QMkpMRU9LSzhK?=
 =?utf-8?B?WGY0TGJoSUpsanh0bE1Id0ZRRlovSEhCOTVLbWRBVWlIckZ3WTRlTWd3azFy?=
 =?utf-8?B?c1RTOXlWRWxpdVg0emVKVTFCdElwN2Y0dE9jWk1DZGJUMG82aS9FbkVBeXYr?=
 =?utf-8?B?TVI3RG9rWXBtUEFPZVdlR1N3NWMxaXVOTXREbWRDNXZpeUtUNU9jOFdkay9D?=
 =?utf-8?B?NEVpUTgyVTlhbzVIcU9kV0NFckZNWTB2dnVNcnY0Ly82N1ZEdDBsVDJqVDJ5?=
 =?utf-8?B?UjhDQXBDaXgzMUhoa3ZkeWNMZWczd3RPYjFlMGZSRHFhTXNKR0ZidzJISGZy?=
 =?utf-8?B?d2NQRXFXZVNLNVNkczgvTzIrUm1acnZrTk85TnZpOXpNS2QwRVM5QWFiZ3VX?=
 =?utf-8?B?VGM1V3RTTGh2S016cG9ucjZFQ0d4aFZjU2JGTVNFSkVJbjNlMmpWWEw5Qktl?=
 =?utf-8?B?bmpQN25uVGIwY3JKL1dnNm0vc2ROMDF4N3JBT3ZCWkQxdEZaTGNwb296a3NL?=
 =?utf-8?B?RDgyckNKZUQwT2ErcEMvZ3ZUaGNwcmZDOXlJanZWekFIVEZ0ZEduNnFhemk0?=
 =?utf-8?B?UXhsNVhwS29UWlUvMUQwb09OVWJyL3oyZ3NNd0hhYTExK0grRy9FbFF0NmxP?=
 =?utf-8?B?eFZOTTVQUFU2N0lSazJrbFk2ZDZrTWQ2YjhkZHBMQWg5eXBHMyt5WEJPRkdt?=
 =?utf-8?B?Y0lBdmpFUWlYcHFiUzlBZ3RoSGl2MXdwQU0rZE5sL0NEazQzcGY0RGtXVXRr?=
 =?utf-8?B?UlZDU0J0a0MyaWVMTDRZendQY3owODkxYWV1R1ZMSjNVR1JIdHgwanpYd0xC?=
 =?utf-8?B?RmNTQS9rRTBITmdDZmFDaXU2dGFHR3VVcnZyUzI5WDhQeDFVWCtiTUJVVDJ4?=
 =?utf-8?B?dmtMTStEb1crSmJZTXJtaHg3bVFJRVlvMk52SFl3TDN4bVlQaXdxaGxkSktE?=
 =?utf-8?B?R2o4aUhlcWp1L3IvSVVsSVFYWU53TGh3bStqTXBsbUNZam9uWUpiK1BPWFpi?=
 =?utf-8?B?cFp3L3lLS3AzT09sY3JmeDBhM1hvZmpDUFNrOGVlblFKNUlrQVJSOWFSM3Az?=
 =?utf-8?Q?0w8PSfvCp6AP1CSeuTnRtqhExswZjYB/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nmx3R3Z3LzBRejNEa1AwU1VwU2R5R05BeWZsQjdLaE5xdFk4Q0JBYU9PWXNn?=
 =?utf-8?B?VWdqZTNiTlhKYUF1SE5SMU1YVnZ1cE45RTRQQWZiMFZoaTFXV3Y3TG1yY1M0?=
 =?utf-8?B?emJXRm1ocjBGNkIxWmZrc2xnemdFczdkbnBkRm9reEVQUEM2cVBLTlhuSTNZ?=
 =?utf-8?B?clJwczlJR1M1eXFQbWJsd3duZ08vdVNyQ1MyNGppZFBSTFErSWM0b05tOEtD?=
 =?utf-8?B?MlFVT3NvTjU0NkFTNHhrTC92S0dUME5iQlZUMHBiUEtTLzdsL2pnYzNIdWcy?=
 =?utf-8?B?WEpZaEpwbUFaK1FHTE56QzU5SlpuK1JjdHdIMVFUaXlhS1VYZ1o5OXp0MzRq?=
 =?utf-8?B?aURxOU5WQ3V6cklaclpmM1lSajZCSHU3VGFDaldCQWN4RjNnOC8yZ0pqSWlp?=
 =?utf-8?B?a3hRaGpPVHVBSDl2M3JzeWVDbFMzS2NNVmlXbnRyNHlzRUM1eGJ6TmtUU0Va?=
 =?utf-8?B?NlpNNHBoVWQ3Mi9TTmh1ZkhIQ3E4WFpCeWpSejZubE1lcUVIMFJ5QXRKZFo1?=
 =?utf-8?B?TDBKSDB5RDZMTkV2V1BRSVVQUEw5cE51MEhoQm1DYmx1TTdpYVE1cXlNQ1lt?=
 =?utf-8?B?UkpKNkdwWGNienhKend5dE1wb0U5bkhMSFFkWlVka3VtbDJLMHlpSmw0WUNI?=
 =?utf-8?B?YXVRdUFCTUdBN2Zkc2JRL1hrTm5GZ2xSeXBVb1UzVXhHWUNLUlZJUFhuY21V?=
 =?utf-8?B?eUZYZy8xd2F6TWp4WlpvMzlpMmNYM1FOZFAxbVdDRFQ0SDZDdFZhTnVidlQw?=
 =?utf-8?B?WnpXYlc4eUQzNk5FSitvVjQ0cFRGNkZmUlZBSjB6L25yL1ZKYTdLancyYTI0?=
 =?utf-8?B?dnRodjd1RmhkK1VjZ0h1bCtUOGc1ZWxOMUM5K2ZuRjJjeEJ1T3JPSDYxVmlu?=
 =?utf-8?B?ZTV3YS9rb2JyNklYcSt6SXNqajgxM3Q1QktRWXB4Skd4R2VYek1YOUhiNXBr?=
 =?utf-8?B?STluRi92VUVjUmQ3cmFoWERNbmRvdXVVclYxOGNZQ2JBK3Y0UEVsM2IrNDhZ?=
 =?utf-8?B?MVRiSjZ3WjNmRlhSY0VqUUxFcGJUdUJTWmV5T0QyVmJ4d3g1R2FIVytWOU1r?=
 =?utf-8?B?SkVYcXV2RnBuUE9mMTdkOUV1YVlRWTFKUWpnYy9RS205V1AxOTJBRTBUdlhs?=
 =?utf-8?B?MkRVSjkxZktldWFqY1J3d3hjRTRZYkovUTA4UkVSdzJaQldFemRRbmxLMXhK?=
 =?utf-8?B?YW8za1RqRVBKZldQMGpxSVhCUEl2YkYwSytlcUx2NkthbnR6WWo5MGFLdnRz?=
 =?utf-8?B?b2xaZ2c2b2laeTB4OFhvVlZ5enEyaGxoQXBDSzVNY0xFT1FPUVhBbW04bHZY?=
 =?utf-8?B?dUtiMytLZ0tYK1ZiQTB6WCtsMDBJK0U1V0o2bVZqNWI5QWZKZUY2N1BjZVBN?=
 =?utf-8?B?Tk1CMHBpZ3VDUWdCQmxhY1hWRXc4ZnEvM2N2ZzI4RUQxVC9qTGlJd1NWV3Iz?=
 =?utf-8?B?d2h4dko4Q3VMWEJsdE42UUo4eFV6T0dqTEd0U2ZSeUM0UDlzQWNiWnRiR0dS?=
 =?utf-8?B?UTltZVVnZ2IwQkVuSUhNRlRxdEV3aFYwUHE5ZWtSSHhBWnBLRXhzV0xpQ0RZ?=
 =?utf-8?B?TTQ0bW5JVjBCT3IwRHhWUWdjcWlnbzJ4WTVQVEY0b1ltdEhBam5UaEhzZC9B?=
 =?utf-8?B?N1NkR08wS0FQeC9KbWRXTHB5Mi9XT01hcGZxMnFFNnFWeFNhdkpFZ1ZUQVVl?=
 =?utf-8?B?WENFamFxWGo5WkFaR2Q0cDBQY2g5NHdBWXkzM3VGSXV6THNZaWY1V3piUkhy?=
 =?utf-8?B?RlNvNHZ3YUE5OElsT2J2am9TR2JQaytlbnRMMHRWNjI5N1Z5cjRnTXYrR2FJ?=
 =?utf-8?B?b0M4b0N5NXltWm96R25LSkM4cTd3Zk84VlhEYUZ5Smluazd2U1pCNDk3aHdX?=
 =?utf-8?B?c3cvWDJ2Vi80NzRoSnYwMklEcGdHeENWTHhRU2lRNDZZMUozam8yeElkSlpm?=
 =?utf-8?B?TFVBQWR5dk1oR1Z6aENUTjJ5ciswcnUvRFVNbHpvUVA2dmRVSGhtUFh4UG9m?=
 =?utf-8?B?dENES3c3MnZRaUFXWFZnMzdTNXllSnNrQm1CTDJQSnMxMzBJUG1OcnZUUEJD?=
 =?utf-8?B?QnFOajVCVm9VbndDdkFwUCtKZytlUTlSU24yU3o2TmF4NGhxVkk1bkZ0VHlE?=
 =?utf-8?B?anJxVk9kOGsxUUpsZGdReS9qNW14aGJWU3RaWFU3UzRJRWV5SXloQ1RMWG1j?=
 =?utf-8?B?WkliSll5ckR1dFY0QXV6eTBRaEpyTFB4ZGw5NU9xQ1c0cDFNeFQzMmtDdzAy?=
 =?utf-8?B?azFjbThhTjhlM1FLRjc5RzVQUzRDZWs4RURzYlB2OGNDMTdXMkI3Vk5rUTZo?=
 =?utf-8?B?RWlVaXFRYXlnVllaS1hlL25xMFl6bzlNVjdnSHlSN2x0SEZPZmRrQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af1ad47a-c968-4617-bf5d-08de4db0a4f5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 05:50:21.3894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bB9SV2Mvn9Yb1i8s9RmLldB9hV3eUFRTIPfbtdHLsA3FcLDcZiaOspiJNnyTfKq858yMX8g+AP4O5e8ffHN7qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7486
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

Hi Vinay

On 12/23/2025 2:21 PM, Vinay Belgaumkar wrote:
> Move enable/disable GuC RC logic into the new file. This will
> allow us to independently enable/disable GuC RC and not rely
> on SLPC related functions. GuC already provides separate H2G
> interfaces to setup GuC RC and SLPC.
> 
> v2: Comments (Michal W), remove duplicate c6_enable calls from
> xe_guc_pc.
> 
> v3: Clarify crosss interactions between xe_guc_rc and xe_guc_pc
> (Michal W)
> 
> v4: More comments (Michal W)
> 
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile    |   1 +
>   drivers/gpu/drm/xe/xe_gt.c     |   1 -
>   drivers/gpu/drm/xe/xe_guc.c    |   6 ++
>   drivers/gpu/drm/xe/xe_guc_pc.c |  68 +++-------------
>   drivers/gpu/drm/xe/xe_guc_pc.h |   1 -
>   drivers/gpu/drm/xe/xe_guc_rc.c | 139 +++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_guc_rc.h |  15 ++++
>   drivers/gpu/drm/xe/xe_uc.c     |  10 +--
>   drivers/gpu/drm/xe/xe_uc.h     |   1 -
>   9 files changed, 178 insertions(+), 64 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.c
>   create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 89dc48cd73e2..928fdb925c13 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -74,6 +74,7 @@ xe-y += xe_bb.o \
>   	xe_guc_log.o \
>   	xe_guc_pagefault.o \
>   	xe_guc_pc.o \
> +	xe_guc_rc.o \
>   	xe_guc_submit.o \
>   	xe_guc_tlb_inval.o \
>   	xe_heci_gsc.o \
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 313ce83ab0e5..9ee328aa6579 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -822,7 +822,6 @@ static void gt_reset_worker(struct work_struct *w)
>   	if (IS_SRIOV_PF(gt_to_xe(gt)))
>   		xe_gt_sriov_pf_stop_prepare(gt);
>   
> -	xe_uc_gucrc_disable(&gt->uc);
>   	xe_uc_stop_prepare(&gt->uc);
>   	xe_pagefault_reset(gt_to_xe(gt), gt);
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 44360437beeb..beac4050c4dc 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -35,6 +35,7 @@
>   #include "xe_guc_klv_helpers.h"
>   #include "xe_guc_log.h"
>   #include "xe_guc_pc.h"
> +#include "xe_guc_rc.h"
>   #include "xe_guc_relay.h"
>   #include "xe_guc_submit.h"
>   #include "xe_memirq.h"
> @@ -869,6 +870,10 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>   	if (ret)
>   		return ret;
>   
> +	ret = xe_guc_rc_init(guc);
> +	if (ret)
> +		return ret;
> +
>   	ret = xe_guc_engine_activity_init(guc);
>   	if (ret)
>   		return ret;
> @@ -1609,6 +1614,7 @@ void xe_guc_stop_prepare(struct xe_guc *guc)
>   	if (!IS_SRIOV_VF(guc_to_xe(guc))) {
>   		int err;
>   
> +		xe_guc_rc_disable(guc);
>   		err = xe_guc_pc_stop(&guc->pc);
>   		xe_gt_WARN(guc_to_gt(guc), err, "Failed to stop GuC PC: %pe\n",
>   			   ERR_PTR(err));
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 54702a0fd05b..3e7173130066 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -92,6 +92,17 @@
>    * Render-C states is also a GuC PC feature that is now enabled in Xe for
>    * all platforms.
>    *
> + * Implementation details:
> + * -----------------------
> + * The implementation for GuC Power Management features is split as follows:
> + *
> + * xe_guc_rc:  Logic for handling GuC RC
> + * xe_gt_idle: Host side logic for RC6 and Coarse Power gating (CPG)
> + * xe_guc_pc:  Logic for all other SLPC related features
> + *
> + * There is some cross interaction between these where host C6 will need to be
> + * enabled when we plan to skip GuC RC. Also, the GuC RC mode is currently
> + * overridden through 0x3003 which is an SLPC H2G call.
>    */
>   
>   static struct xe_guc *pc_to_guc(struct xe_guc_pc *pc)
> @@ -253,22 +264,6 @@ static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
>   	return ret;
>   }
>   
> -static int pc_action_setup_gucrc(struct xe_guc_pc *pc, u32 mode)
> -{
> -	struct xe_guc_ct *ct = pc_to_ct(pc);
> -	u32 action[] = {
> -		GUC_ACTION_HOST2GUC_SETUP_PC_GUCRC,
> -		mode,
> -	};
> -	int ret;
> -
> -	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
> -	if (ret && !(xe_device_wedged(pc_to_xe(pc)) && ret == -ECANCELED))
> -		xe_gt_err(pc_to_gt(pc), "GuC RC enable mode=%u failed: %pe\n",
> -			  mode, ERR_PTR(ret));
> -	return ret;
> -}
> -
>   static u32 decode_freq(u32 raw)
>   {
>   	return DIV_ROUND_CLOSEST(raw * GT_FREQUENCY_MULTIPLIER,
> @@ -1050,30 +1045,6 @@ int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc)
>   	return ret;
>   }
>   
> -/**
> - * xe_guc_pc_gucrc_disable - Disable GuC RC
> - * @pc: Xe_GuC_PC instance
> - *
> - * Disables GuC RC by taking control of RC6 back from GuC.
> - *
> - * Return: 0 on success, negative error code on error.
> - */
> -int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
> -{
> -	struct xe_device *xe = pc_to_xe(pc);
> -	struct xe_gt *gt = pc_to_gt(pc);
> -	int ret = 0;
> -
> -	if (xe->info.skip_guc_pc)
> -		return 0;
> -
> -	ret = pc_action_setup_gucrc(pc, GUCRC_HOST_CONTROL);
> -	if (ret)
> -		return ret;
> -
> -	return xe_gt_idle_disable_c6(gt);
> -}
> -
>   /**
>    * xe_guc_pc_override_gucrc_mode - override GUCRC mode
>    * @pc: Xe_GuC_PC instance
> @@ -1217,9 +1188,6 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>   		return -ETIMEDOUT;
>   
>   	if (xe->info.skip_guc_pc) {
> -		if (xe->info.platform != XE_PVC)
> -			xe_gt_idle_enable_c6(gt);
> -
>   		/* Request max possible since dynamic freq mgmt is not enabled */
>   		pc_set_cur_freq(pc, UINT_MAX);
>   		return 0;
> @@ -1257,15 +1225,6 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>   	if (ret)
>   		return ret;
>   
> -	if (xe->info.platform == XE_PVC) {
> -		xe_guc_pc_gucrc_disable(pc);
> -		return 0;
> -	}
> -
> -	ret = pc_action_setup_gucrc(pc, GUCRC_FIRMWARE_CONTROL);
> -	if (ret)
> -		return ret;
> -
>   	/* Enable SLPC Optimized Strategy for compute */
>   	ret = pc_action_set_strategy(pc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
>   
> @@ -1285,10 +1244,8 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
>   {
>   	struct xe_device *xe = pc_to_xe(pc);
>   
> -	if (xe->info.skip_guc_pc) {
> -		xe_gt_idle_disable_c6(pc_to_gt(pc));
> +	if (xe->info.skip_guc_pc)
>   		return 0;
> -	}
>   
>   	mutex_lock(&pc->freq_lock);
>   	pc->freq_ready = false;
> @@ -1310,7 +1267,6 @@ static void xe_guc_pc_fini_hw(void *arg)
>   		return;
>   
>   	CLASS(xe_force_wake, fw_ref)(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);

The forcewake can be removed too. Frequency registers don't need a forcewake

> -	xe_guc_pc_gucrc_disable(pc);
>   	XE_WARN_ON(xe_guc_pc_stop(pc));
>   
>   	/* Bind requested freq to mert_freq_cap before unload */
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index 0e31396f103c..1b95873b262e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -15,7 +15,6 @@ struct drm_printer;
>   int xe_guc_pc_init(struct xe_guc_pc *pc);
>   int xe_guc_pc_start(struct xe_guc_pc *pc);
>   int xe_guc_pc_stop(struct xe_guc_pc *pc);
> -int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc);
>   int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_mode mode);
>   int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc);
>   void xe_guc_pc_print(struct xe_guc_pc *pc, struct drm_printer *p);
> diff --git a/drivers/gpu/drm/xe/xe_guc_rc.c b/drivers/gpu/drm/xe/xe_guc_rc.c
> new file mode 100644
> index 000000000000..b7dab3158060
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_rc.c
> @@ -0,0 +1,139 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <linux/device/devres.h>
> +#include <drm/drm_print.h>
> +
> +#include "abi/guc_actions_slpc_abi.h"
> +#include "xe_device.h"
> +#include "xe_force_wake.h"
> +#include "xe_gt.h"
> +#include "xe_guc.h"
> +#include "xe_gt_idle.h"
> +#include "xe_gt_printk.h"
> +#include "xe_guc_ct.h"
> +#include "xe_guc_rc.h"
> +#include "xe_pm.h"
> +
> +/**
> + * DOC: GuC RC (Render C-states)
> + *
> + * GuC handles the GT transition to deeper C-states in conjunction with Pcode.
> + * GuC RC can be enabled independently of the frequency component in SLPC,
> + * which is also controlled by GuC.
> + *
> + * This file will contain all H2G related logic for handling Render C-states.
> + * There are some calls to xe_gt_idle, where we enable host C6 when GuC RC is
> + * skipped. GuC RC is mostly independent of xe_guc_pc with the exception of
> + * functions that override the mode for which we have to rely on the SLPC H2G
> + * calls.
> + */
> +
> +static int guc_action_setup_gucrc(struct xe_guc *guc, u32 control)
> +{
> +	u32 action[] = {
> +		GUC_ACTION_HOST2GUC_SETUP_PC_GUCRC,
> +		control,
> +	};
> +	int ret;
> +
> +	ret = xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
> +	if (ret && !(xe_device_wedged(guc_to_xe(guc)) && ret == -ECANCELED))
> +		xe_gt_err(guc_to_gt(guc),
> +			  "GuC RC setup %s(%u) failed (%pe)\n",
> +			   control == GUCRC_HOST_CONTROL ? "HOST_CONTROL" :
> +			   control == GUCRC_FIRMWARE_CONTROL ? "FIRMWARE_CONTROL" :
> +			   "UNKNOWN", control, ERR_PTR(ret));
> +	return ret;
> +}
> +
> +/**
> + * xe_guc_rc_disable() - Disable GuC RC
> + * @guc: Xe GuC instance
> + *
> + * Disables GuC RC by taking control of RC6 back from GuC.
> + */
> +void xe_guc_rc_disable(struct xe_guc *guc)
> +{
> +	struct xe_device *xe = guc_to_xe(guc);
> +
> +	if (xe->info.skip_guc_pc)
> +		return;

guc_rc_start enables host c6 when guc_pc is skipped. So don't we have to
disable it in this call?


> +
> +	if (guc_action_setup_gucrc(guc, GUCRC_HOST_CONTROL))
> +		return;
> +
> +	XE_WARN_ON(xe_gt_idle_disable_c6(guc_to_gt(guc)));
> +}
> +
> +static void xe_guc_rc_fini_hw(void *arg)
> +{
> +	struct xe_guc *guc = arg;
> +	struct xe_device *xe = guc_to_xe(guc);
> +	struct xe_gt *gt = guc_to_gt(guc);
> +
> +	if (xe_device_wedged(xe))
> +		return;
> +
> +	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
> +	xe_guc_rc_disable(guc);
> +}
> +
> +/**
> + * xe_guc_rc_init() - Initialize GuC RC
> + * @guc: Xe GuC instance
> + *
> + * Initializes GuC RC feature.

This function does not initialize GucRC. I think we can combine both 
init and start as a single function.

> + *
> + * Return: 0 on success, negative error code on error.
> + */
> +int xe_guc_rc_init(struct xe_guc *guc)
> +{
> +	struct xe_device *xe = guc_to_xe(guc);
> +
> +	xe_gt_assert(guc_to_gt(guc), xe_device_uc_enabled(xe));
> +
> +	if (xe->info.skip_guc_pc)
> +		return 0;
> +
> +	return devm_add_action_or_reset(xe->drm.dev, xe_guc_rc_fini_hw, guc);
> +}
> +
> +static int xe_guc_rc_enable(struct xe_guc *guc)
> +{
> +	return guc_action_setup_gucrc(guc, GUCRC_FIRMWARE_CONTROL);
> +}
> +
> +/**
> + * xe_guc_rc_start() - Enable GuC RC feature if applicable
> + * @guc: Xe GuC instance
> + *
> + * Enables GuC RC feature.

Function name can be xe_guc_rc_enable to pair with disable

Thanks
Riana

> + *
> + * Return: 0 on success, negative error code on error.
> + */
> +int xe_guc_rc_start(struct xe_guc *guc)
> +{
> +	struct xe_device *xe = guc_to_xe(guc);
> +	struct xe_gt *gt = guc_to_gt(guc);
> +
> +	xe_gt_assert(gt, xe_device_uc_enabled(xe));
> +
> +	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
> +	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FW_GT))
> +		return -ETIMEDOUT;
> +
> +	if (xe->info.platform == XE_PVC) {
> +		xe_guc_rc_disable(guc);
> +		return 0;
> +	}
> +
> +	if (xe->info.skip_guc_pc) {
> +		xe_gt_idle_enable_c6(gt);
> +		return 0;
> +	}
> +
> +	return xe_guc_rc_enable(guc);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_guc_rc.h b/drivers/gpu/drm/xe/xe_guc_rc.h
> new file mode 100644
> index 000000000000..f2a6ae7f05d8
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_rc.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_GUC_RC_H_
> +#define _XE_GUC_RC_H_
> +
> +struct xe_guc;
> +
> +void xe_guc_rc_disable(struct xe_guc *guc);
> +int xe_guc_rc_start(struct xe_guc *guc);
> +int xe_guc_rc_init(struct xe_guc *guc);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 157520ea1783..300b99acbd51 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -14,6 +14,7 @@
>   #include "xe_gt_sriov_vf.h"
>   #include "xe_guc.h"
>   #include "xe_guc_pc.h"
> +#include "xe_guc_rc.h"
>   #include "xe_guc_engine_activity.h"
>   #include "xe_huc.h"
>   #include "xe_sriov.h"
> @@ -216,6 +217,10 @@ int xe_uc_load_hw(struct xe_uc *uc)
>   	if (ret)
>   		goto err_out;
>   
> +	ret = xe_guc_rc_start(&uc->guc);
> +	if (ret)
> +		goto err_out;
> +
>   	xe_guc_engine_activity_enable_stats(&uc->guc);
>   
>   	/* We don't fail the driver load if HuC fails to auth */
> @@ -244,11 +249,6 @@ int xe_uc_reset_prepare(struct xe_uc *uc)
>   	return xe_guc_reset_prepare(&uc->guc);
>   }
>   
> -void xe_uc_gucrc_disable(struct xe_uc *uc)
> -{
> -	XE_WARN_ON(xe_guc_pc_gucrc_disable(&uc->guc.pc));
> -}
> -
>   void xe_uc_stop_prepare(struct xe_uc *uc)
>   {
>   	xe_gsc_stop_prepare(&uc->gsc);
> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> index 5398da1a8097..255a54a8f876 100644
> --- a/drivers/gpu/drm/xe/xe_uc.h
> +++ b/drivers/gpu/drm/xe/xe_uc.h
> @@ -12,7 +12,6 @@ int xe_uc_init_noalloc(struct xe_uc *uc);
>   int xe_uc_init(struct xe_uc *uc);
>   int xe_uc_init_post_hwconfig(struct xe_uc *uc);
>   int xe_uc_load_hw(struct xe_uc *uc);
> -void xe_uc_gucrc_disable(struct xe_uc *uc);
>   int xe_uc_reset_prepare(struct xe_uc *uc);
>   void xe_uc_runtime_resume(struct xe_uc *uc);
>   void xe_uc_runtime_suspend(struct xe_uc *uc);

