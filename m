Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B44EE2084
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 11:35:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BED310E1A1;
	Fri,  6 Feb 2026 11:35:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WXor7lDU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 716E210E1A1
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Feb 2026 11:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770377702; x=1801913702;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lrw14q4yYUNmWXvMRZSosX8Et6ZZHw0VDOF6kArw0uk=;
 b=WXor7lDUvnuBAxHsEJT2Yr/VVaiwvBGXmit7CZCXs14R+yDMksxu1Afl
 OLc6hIXFuUdbBZKKfXAEpCQQDAKhf8BL26uezmjObnkpHJ/vzAq/bx2lf
 xJ/RpK5ePPpIyIrqEDHKjwFUSVw+RLKMOMl+AfpZiB1jWdEfAiCGY+uBH
 pIMCn6Iu8ZMwDGXJreoxtxDpj08VFYZkxd+7RRUjFd/NYthwKWCGm/OcN
 QhUuQ+o0Q+DkG2qFIPpBL6mBsbLgzGeFhg08KbhQi2MpwBvLolOv+5Icy
 5lYwsK96sDzR/C/zRgRjtYHnCFvwy7Ws0DimmLKI76iVCOoVpFogjT1Ql w==;
X-CSE-ConnectionGUID: JzweggzSTiqsnaXpytlv4A==
X-CSE-MsgGUID: mVP/II3QSd+Go7NyoXoDkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="94234199"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="94234199"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 03:35:01 -0800
X-CSE-ConnectionGUID: 00dps7QHSWSjp/iEQUSCNg==
X-CSE-MsgGUID: S+3VqaAhQNC6U3kkB60HOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="209941404"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 03:35:01 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 6 Feb 2026 03:35:00 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 6 Feb 2026 03:35:00 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.34) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 6 Feb 2026 03:35:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Na76Th16DuOd15rZ5LA0JbpomC5K7oOIaTlds/2GP/EjHUR3K8rFHe8AlDVUl0CAX7PSOLhYdlLrmEml6+LnwhEO6PjUN4yfkuDbthOCaxej8pZCOpuVgko9rqKjtIVeK4rwT1ZIUcb5k1mfy/ceRU9XGkqbAkzKloXWp9bIDBgXYq4xmbynegqgx7IQW17MLtmXh7dnoTh91RCz/SVYurbFmiHhiESxjIvfg9LCsd2cRdBm6iubdMurX2P4GVDLLPB7lpah9CZkjQv+1pnBrXQfPU6KlMDYUMiH4TzqSR40VOFltSPS3O0bdbgRc2dls8uypo1ZlSCGxxmzg/PJ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zwufj/FZZPghmeHfWhu1Vd/7WHiUYKSHUpuF0MS2Al4=;
 b=tsxmSd5Y8P5VC/7JD1Q+EvUTQgApklnZ4h8wa/m+XkI1wCLNq8fKZ/jWB8S8HYVPlXgEXcFm2bZKLgqaihWVMtVPFDFbCB5yHvUiWkxh9+tMDemwryk5wLUhgVJ3v6KqmSdjc5ZVWewgplegZGxLQCHNWkNhTdRmhVR2W9/LBYPTCkfyq3CLxoSjUY4fAR2raWBEf6uLPxO+xbdMOpeT5dkOOAawI7pznfIR01Q1EnUZ6pf5DmY1iPQdeAlcgbyOc61BvyVotARDEZxRn8/Q28HwM2g6QPDwjbV3e+85VKBh/g+ZMSQVExBFqgEPgqiF2bmsZtn0dIYI16pG5MQVnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by LV1PR11MB8792.namprd11.prod.outlook.com (2603:10b6:408:2b5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Fri, 6 Feb
 2026 11:34:58 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1451:ad37:6612:37fb]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1451:ad37:6612:37fb%4]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 11:34:58 +0000
Message-ID: <9f60c847-733f-4307-a76a-690739f2b7c4@intel.com>
Date: Fri, 6 Feb 2026 17:04:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] drm/xe/guc: Add Wa_14025883347 for GuC DMA failure
 on reset
To: Sk Anirban <sk.anirban@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>, <vinay.belgaumkar@intel.com>,
 <daniele.ceraolospurio@intel.com>, <nishanth.p.reddy@intel.com>,
 <rodrigo.vivi@intel.com>, <matthew.d.roper@intel.com>
References: <20260202105313.3338094-3-sk.anirban@intel.com>
 <20260202105313.3338094-4-sk.anirban@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20260202105313.3338094-4-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0003.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::20) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|LV1PR11MB8792:EE_
X-MS-Office365-Filtering-Correlation-Id: da07d536-72a6-4517-373c-08de6573c1ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eWRZb1RjSDZueHJ4RXFzejVaVE53RWZPOWV4a0Y2cUJGNkxxQVRoT0dqRnlK?=
 =?utf-8?B?R0I3TUlhNWUvUVpZeThxYWtjSzRTd2VrcW53NmdqUG1XNUlhU1VUd3pNSFMr?=
 =?utf-8?B?YUVtY0FOcVA5TmZKa01YUVBGdVJiWG1vNTNwRDl3MU41VzZqRkVYWVJldmZ1?=
 =?utf-8?B?Sit4bnNuL0MvYnF1UGxTbVV3cnJDVG9tK2s4TkV0RVhib2ZmZW5kZS91RDFy?=
 =?utf-8?B?cU11MUwyT2RNK09GWk1jK0x4QUJTR2xnNGxiMnhGd0FiN1VNQ3d1dlpESmcy?=
 =?utf-8?B?ZmhRSmwrbkRjRG8vOEQwM3pXU1Jsck5PUVhwZGdlVkdGWFJLZWR3NE5YQ3Rn?=
 =?utf-8?B?UDUrN3BaK3JhWGhqdXF2Mlp6QlBLakNPa3AyZTZJUmVxNUwxM0wyYXB4OXZV?=
 =?utf-8?B?YU9oVWV6MDNONXhPak9VcFZDYW9GYnlYWFo0akJ5ZzVLSTJkM2VHUDkrbmJO?=
 =?utf-8?B?d1IzWG5wWGtUalVVKzVkeUxLN1J6eUxQWEpkSVhRblI2WnpXa0lCWDdOU2l2?=
 =?utf-8?B?VmlIV2I4anFxZk1wYmhFQ0I5Z1phcXhXbVNCMFJKbllPUFlDWTZROGQ1SlJL?=
 =?utf-8?B?SVFDeXd1S3pFaGlXR2J1SFg5c0ZoQjc5SWVscXJ5dHRvYndISkRRclN1ZzlL?=
 =?utf-8?B?cmZDeWpsYkpBTUlPS3FNdjlaUU1iajZvNlE4UTVCSTRXTzlRQnZhbGlYeVpP?=
 =?utf-8?B?Mll5QzNrZFBXZUZYUU56d2FuY05SZFo5WU9MbFdEV1djRXZIUTZzTWpsYUZn?=
 =?utf-8?B?Zzc5a0wzd2xpTHNRUVN3MGZDV0FYeENJOE5ldUdLeGk3WkIwWnNKdXc3bUJv?=
 =?utf-8?B?YWVqRnh4VytsMGpRWEVnaDNTM2I3bzdTOHk0emJ5aU4rWlBsVUhCLy9nRFFX?=
 =?utf-8?B?VXE5OXNlaWhSUU5GNWJTWVk1QWFxWWNVT2lrblBvNVl5U0grcWhENGxWeDQr?=
 =?utf-8?B?aGc4VGhMYzVPUjJ3V0w1MXBBS0tXWml2OSt2QTlPNWhVV0VjOUtiRm5HQ29l?=
 =?utf-8?B?VndzVTVXaDJ6UnRoRzdMbUgrb3lVc3BRZ3pEVFNITmlwRGs0VGVJeHB0TDFp?=
 =?utf-8?B?dHdzNDJKQnR4RGovbjVIMUU5anMvS1AxOGlDdGk1OHRQMjlNbVF6OGdEWkQ3?=
 =?utf-8?B?eFY3aTJOYVVxYVlQR05peW9wKzVoK1U0WEQ2QTJKVkZMVk1lZVpLSndnSnVC?=
 =?utf-8?B?TTRpWmx0ZElYSkZ1QytmbnM5R2syUkl3cjU4aS96djcycElBVEgzZGFWbUI2?=
 =?utf-8?B?MlNnYTEzdFRuWVRweWxvMHQrRlhBdGo0OC9zL0dPRWJBbllSRHFOa3d1Q05J?=
 =?utf-8?B?Tmh1YWZrUkpLSHFHWkRLeEk0MlgzOGhBUjU0TjBJTUlMYU43YytWSjQwTEcz?=
 =?utf-8?B?OVI0VFhSbU4zeDNoNmxMZWE2QmpzRVNxMU5NenJCb3hFWXY5N2gzYXpGMXU0?=
 =?utf-8?B?WnJjQTBKNVB4N3BlSmJEblNzdFUwWWNYcTBWRFFPSGN0RXEwbE1LM2xUSGxM?=
 =?utf-8?B?cU9zcEN5SEhHUzMyRm4wb0hjMmxBdzh3bnJIQ3ZHSVVoUDQ3SjdqdG45WU16?=
 =?utf-8?B?UXNjZDZoUmUyaUhqTGZtUjA2NlVLdWExdE5uSnZYeUtyL1BNR3lUVFBuR2Zm?=
 =?utf-8?B?cVR0eERZdjBsWU1RSUVrRURqMVpMWWRqQWxMUEN1cnBJWkthcUdqVFZnM3ov?=
 =?utf-8?B?ZjdqMXZRSEhleTBIMm5MR1JMZi9iR24xS1ZLZkJzdFg0SXAwT2J3M2xTQkZu?=
 =?utf-8?B?WHhrelJsU0ZJZW5xdUNiaHNjZngwaE9SbTRtL3JJZXFRWFk1RUh6OW9EY0VZ?=
 =?utf-8?B?ZTlCaEhGcko2UGZsaVdFaC9EZWJoTnlienBpVXVYZEVTeWc3d3B5WklDQVli?=
 =?utf-8?B?R2ZETTMzeUtHdGNyU2l4RjlheTU2QTNPRzBmL3NmVEZrNThwaFhpWXVWdGdq?=
 =?utf-8?B?ZS90NGs5dFZZemIzUEpZZEFzK1ZaSjVXckMyTDVvUVE3bUlabEVaRHFZT0lj?=
 =?utf-8?B?SDVCS1pSZU1aRVREUXlycHBJR2NUVitlaElXcnBLMDNXTUpXbWFDWXh4SkU0?=
 =?utf-8?B?OWVvUjJCZ1gzcTkyNkNyd1NtK055cHloMTF2VE55a2JJelhVTFUrZCtRamNZ?=
 =?utf-8?Q?vMO4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjIzUnl6b3l4a2UwZGRzZnBQV0NSVHhUZHA2alRvbTRQc2U4WTdmQXZEdlBO?=
 =?utf-8?B?RmJuN091ZEdZRHJycmU5THlwbGI3VDdwR09nV3k1Qy9GeEVJMm80aVRrVzlv?=
 =?utf-8?B?WGFsK0RhTkNRaEYrNDRoUHJaRU92bGFVZG9ZWVdkOG5wcHIxeDVla0JXN3JC?=
 =?utf-8?B?UFdkZXFGRExFZDVpUDZEOSt4dW02MHFVWXo4SVRDZ2pVVGJsa3VaQ3p4U2ZO?=
 =?utf-8?B?OGUvYW9jL3lwNWVVeGV0ZmFyamdENVdJUmlVUVRCdHZuaHlyOTdqR1BxSHp4?=
 =?utf-8?B?VWtJdHU5ZjR6MmtKYkhJbXdWRzk3cmxjajdCNlIzQlp2UStLRGQvMWpZSDgw?=
 =?utf-8?B?NUxML3NQeTFIZXdTZmhrcFBhK0pGT0ZEVG1ZQ0M5cXYycmF0NXh1bHFWN1BW?=
 =?utf-8?B?WUUyZnBFeDVMNUZ1VitOTnpXVmVZdkNxVzdMU3VrVzFLR2Fta2dZdWc2ajUz?=
 =?utf-8?B?ZURiR1pieDltQzBiWWpPRFVCdDdOMjhkelJYMjRoT2QrSWo4aWZxWERLbTVD?=
 =?utf-8?B?c1hxMk5YWXpEdTlGSENyZFhmanErMklyQWdOZ3NqYmg4ci9DUkgwZFRHOXJr?=
 =?utf-8?B?VnVpRFJMRndXTEpjUHhXQlhwRTRBdUpLNzQwd2g2UDBGVGlVVXBzTDFua3oy?=
 =?utf-8?B?V200MEhFVFNxNzQ5RnYrdnRqZGFsVWRpcnNaWVN0VVdIdFN0MGxjQW5WNjFj?=
 =?utf-8?B?ams3czJKU0Y3M0lvMjUrb2xsOVIwVXNZaVJWb0xxM1ZHbjRTTXNvRC9jTTBJ?=
 =?utf-8?B?akNza0dpaTBCeVI4ejBvUTgvS1VScWpBejF6WnhmR1Z2Qnd0Q1JvUEhPTHg4?=
 =?utf-8?B?REJmKzFoSjVZN3Z0K2FkL3ROb05NVXVwS2QzeHlNa3VRN1JZWGNKMXZPSUZD?=
 =?utf-8?B?VFdqY3J4Q2lZMXRBR3BQakNicTJPZzRGcDlIWVpNZXlYQWd5VnVFZmNFU25o?=
 =?utf-8?B?ak8yVVZCRzNVVTNWTms5QjNpRGRZUWR0NzdmSWU3S0F2MTJNUGVlak9ZZFFi?=
 =?utf-8?B?ZmRyY0drU3BQS3dPcyttaitIb2JCbGdHZFpXY2FhaXNCbG15THp5MnhYRFFO?=
 =?utf-8?B?MFNYRnNFSmNjdlRRNUU4a1VpcTVlejdpd1dUK2hmRitoNGs4c0p1NGF2L3Jw?=
 =?utf-8?B?a2ZENlJwL0tyS3JHK2ptWjBLLzc5aEVzaVgxcXlzWnR0UVhOeWhFeko5MlFv?=
 =?utf-8?B?ZGtzb2o4MTZlYTUyL3NXWStFVlRvVllkeW1MRTV4a1lZaVArbzRYaVpMVzhG?=
 =?utf-8?B?dE9WYUhlZ0cvaGY1SUpvaVNKQTQ5cEd6U2dsMm92bHJ0K3hId29EYVc2TjE5?=
 =?utf-8?B?bWZ5emxQSlpHb2I0Q0M5QVhkekxUN3p1TFFoRUlpYWh4Vzg0aFkxbk9zZlZZ?=
 =?utf-8?B?WWdYaDlEYlpEaDRGTjhwUHp2dUJiM0NGNiswTDE3ZytwRk5UbmpiWDRiOWdI?=
 =?utf-8?B?Z29URVY2NnFCV0NTaUdrSlFQcUJTNXRjYkNiSU1IbFlZTUJRUkFqNkhiR1dL?=
 =?utf-8?B?eU0yd09PZlNSZ3d4MVZZa0poNnRBbmJWUlQzWHg4cXNJVEhOVU1Wam1EWVNs?=
 =?utf-8?B?T0F2cmkxTHRnYjY1Yk5PbkR2cHFydzNXZiswYjlVWVhPRDh5ZEFKRVFKbDhm?=
 =?utf-8?B?NEF3eHNnQTNrTFE1RUZVcDFqZnJLS3VzcCs0eEI5RnZSNUZhQVNydFZlMlU1?=
 =?utf-8?B?VGo0OGpIVWRzNWpEMlJtQStBOEowTGNQNEJDK0R2bzFVYis4OFpXL0ZLNFNr?=
 =?utf-8?B?cHRWRCtSeU9oUlM4SVpBV1o4M0wvZHZOSUROUGo1SnJJYjJUdjJZNWIxWDJm?=
 =?utf-8?B?QWhsd2tMalRMT0lBM0tvWFhoQTd4b2szcklKcUkxNFhoTWJ0c3lQNWpab0M0?=
 =?utf-8?B?VnpLbzhxQStxQ0FhSTJZZUpnVVpjQ3FPZXlCQmh1OEpJSzJLVklUTXJPOEZY?=
 =?utf-8?B?M21sU0lud1djN0o3VGlXcGY0U2h5cVQyakVIYXFqM01RQlh0QTMyYmpIK3Bt?=
 =?utf-8?B?aFU0ZnFQQVVFU0Vid2kwaGFTb3liMDZBaTh6TmZ4cEFpZjgxWlRIVkFOTXl3?=
 =?utf-8?B?V2NQTDNYcUM1cWt0UUZnS01yaTBtcHFJVUwybUY3UDBJNFc5alhlYmJ3c1hv?=
 =?utf-8?B?Qk1DTCtXSi93M1R2eHN3QTdaOHMwVnBoeDJMQ3ZEUCtsM05aRGZpVS81blIw?=
 =?utf-8?B?WnUxR3padG9KSFdSdjVkNmZUNElpWGFSLzZYOEZLQ3c1THlPOElOTXlac0E4?=
 =?utf-8?B?YUEzcjlkME0xbVZSaVIrZXNTQUFJQ0V0QTEwK1RJbGtzVWNqejFTY1hnYmFI?=
 =?utf-8?B?Y29HQkRwcVNKQUdQb3JJZ1VsVzZZZXFxM3BHUXNZV0RVT3JjanlkQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da07d536-72a6-4517-373c-08de6573c1ef
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 11:34:58.6275 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8FEBmk0UzTQxMwudXRaJbvVRzFzqV2htrMgs0B/2A3s4EDSiSqqPloHXsv8eordO8EyM8QYHZQsYdKFQteNdMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8792
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


On 02-02-2026 16:23, Sk Anirban wrote:
> Prevent GuC firmware DMA failures during GuC-only reset by disabling
> idle flow and verifying SRAM handling completion. Without this, reset
> can be issued while SRAM handler is copying WOPCM to SRAM,
> causing GuC HW to get stuck.
>
> v2: Modify error message (Badal)
>      Rename reg bit name (Daniele)
>      Update WA skip condition (Daniele)
>      Update SRAM handling logic (Daniele)
> v3: Reorder WA call (Badal)
>      Wait for GuC ready status (Daniele)
> v4: Update reg name (Badal)
>      Add comment (Daniele)
>      Add extended graphics version (Daniele)
>      Modify rules
>
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>

LGTM
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Thanks,
Badal

> ---
>   drivers/gpu/drm/xe/regs/xe_guc_regs.h |  8 ++++++
>   drivers/gpu/drm/xe/xe_guc.c           | 38 +++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_wa_oob.rules    |  3 +++
>   3 files changed, 49 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> index 87984713dd12..5faac8316b66 100644
> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> @@ -40,6 +40,9 @@
>   #define   GS_BOOTROM_JUMP_PASSED		REG_FIELD_PREP(GS_BOOTROM_MASK, 0x76)
>   #define   GS_MIA_IN_RESET			REG_BIT(0)
>   
> +#define BOOT_HASH_CHK				XE_REG(0xc010)
> +#define   GUC_BOOT_UKERNEL_VALID		REG_BIT(31)
> +
>   #define GUC_HEADER_INFO				XE_REG(0xc014)
>   
>   #define GUC_WOPCM_SIZE				XE_REG(0xc050)
> @@ -83,7 +86,12 @@
>   #define   GUC_WOPCM_OFFSET_MASK			REG_GENMASK(31, GUC_WOPCM_OFFSET_SHIFT)
>   #define   HUC_LOADING_AGENT_GUC			REG_BIT(1)
>   #define   GUC_WOPCM_OFFSET_VALID		REG_BIT(0)
> +
> +#define GUC_SRAM_STATUS				XE_REG(0xc398)
> +#define   GUC_SRAM_HANDLING_MASK		REG_GENMASK(8, 7)
> +
>   #define GUC_MAX_IDLE_COUNT			XE_REG(0xc3e4)
> +#define   GUC_IDLE_FLOW_DISABLE			REG_BIT(31)
>   #define GUC_PMTIMESTAMP_LO			XE_REG(0xc3e8)
>   #define GUC_PMTIMESTAMP_HI			XE_REG(0xc3ec)
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 2efc4678fa73..369b5a8f129a 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -911,6 +911,41 @@ int xe_guc_post_load_init(struct xe_guc *guc)
>   	return xe_guc_submit_enable(guc);
>   }
>   
> +/*
> + * Wa_14025883347: Prevent GuC firmware DMA failures during GuC-only reset by ensuring
> + * SRAM save/restore operations are complete before reset.
> + */
> +static void guc_prevent_fw_dma_failure_on_reset(struct xe_guc *guc)
> +{
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	u32 boot_hash_chk, guc_status, sram_status;
> +	int ret;
> +
> +	guc_status = xe_mmio_read32(&gt->mmio, GUC_STATUS);
> +	if (guc_status & GS_MIA_IN_RESET)
> +		return;
> +
> +	boot_hash_chk = xe_mmio_read32(&gt->mmio, BOOT_HASH_CHK);
> +	if (!(boot_hash_chk & GUC_BOOT_UKERNEL_VALID))
> +		return;
> +
> +	/* Disable idle flow during reset (GuC reset re-enables it automatically) */
> +	xe_mmio_rmw32(&gt->mmio, GUC_MAX_IDLE_COUNT, 0, GUC_IDLE_FLOW_DISABLE);
> +
> +	ret = xe_mmio_wait32(&gt->mmio, GUC_STATUS, GS_UKERNEL_MASK,
> +			     FIELD_PREP(GS_UKERNEL_MASK, XE_GUC_LOAD_STATUS_READY),
> +			     100000, &guc_status, false);
> +	if (ret)
> +		xe_gt_warn(gt, "GuC not ready after disabling idle flow (GUC_STATUS: 0x%x)\n",
> +			   guc_status);
> +
> +	ret = xe_mmio_wait32(&gt->mmio, GUC_SRAM_STATUS, GUC_SRAM_HANDLING_MASK,
> +			     0, 5000, &sram_status, false);
> +	if (ret)
> +		xe_gt_warn(gt, "SRAM handling not complete (GUC_SRAM_STATUS: 0x%x)\n",
> +			   sram_status);
> +}
> +
>   int xe_guc_reset(struct xe_guc *guc)
>   {
>   	struct xe_gt *gt = guc_to_gt(guc);
> @@ -923,6 +958,9 @@ int xe_guc_reset(struct xe_guc *guc)
>   	if (IS_SRIOV_VF(gt_to_xe(gt)))
>   		return xe_gt_sriov_vf_bootstrap(gt);
>   
> +	if (XE_GT_WA(gt, 14025883347))
> +		guc_prevent_fw_dma_failure_on_reset(guc);
> +
>   	xe_mmio_write32(mmio, GDRST, GRDOM_GUC);
>   
>   	ret = xe_mmio_wait32(mmio, GDRST, GRDOM_GUC, 0, 5000, &gdrst, false);
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 5cd7fa6d2a5c..ac08f94f90a1 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -73,3 +73,6 @@
>   15015404425_disable	PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)
>   16026007364    MEDIA_VERSION(3000)
>   14020316580    MEDIA_VERSION(1301)
> +
> +14025883347	MEDIA_VERSION_RANGE(1301, 3503)
> +		GRAPHICS_VERSION_RANGE(2004, 3005)
