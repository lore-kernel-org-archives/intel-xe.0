Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A362EC83F1A
	for <intel-xe@archiver.kernel.org>; Wed, 23 Jul 2025 20:16:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6957E10E02D;
	Wed, 23 Jul 2025 20:16:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y0dt6N9i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 515AA10E02D
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Jul 2025 20:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753301789; x=1784837789;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=TLZJPM+nlgDCtjkSxhGg2g9F0oimsnUkpl/oy2g97/U=;
 b=Y0dt6N9iQ/1ns6y1r9VbiUSNb6TXFIXexKbR2ArSz3iaq0wzTOWSJbEs
 9nyuvmTadZly4zpK89xi712b72a2QxQe87kUgdLh1rNiE7sazNCOtnu3p
 8KUzbBE/U7fJsxX3ajm4p+VDOYHI0UggQ+gkUR+FHfBOKPhAi4YcrFEuF
 g7viCjI233pkCSSgBI/H8N6mq+3dcv1gmJ+rX7lZN8u53EcRawRDAW6dH
 6nGW28E0Z6pzKlaOiqDrKjNyUZ9oHG+9VruPJkP1sRi54JfnNQBNmt0zH
 Lp0aS6RUPU4XgEaNC6oMtwaYxBoBMglAV4kuqoVU0yVmI9TXXQDBGvmIs Q==;
X-CSE-ConnectionGUID: CwI+TlevS/67d6SQcKFLNg==
X-CSE-MsgGUID: m0zBX6ffQSWzARo5nThxhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="59256409"
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; d="scan'208";a="59256409"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 13:16:27 -0700
X-CSE-ConnectionGUID: hWYXoWDITv2cAdz/It4swg==
X-CSE-MsgGUID: kqP6sbunS1alwgCMpmMPSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; d="scan'208";a="163802099"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 13:16:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 13:16:18 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 23 Jul 2025 13:16:18 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.70)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 13:16:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uqoovH19erMKS2jgeX8s3Lf8Bc0h3Y56CZ+j+APZSYOAnKXHZaFHyF+8jsIOS3uCj4/JHZY6A9CLJexvo1OS58knhbk3XOImVw3m0ARAv4h3UG/zBtPeq99fePBRjnEZXMW2F9EdhSFudwg1uX47yoUXhAXkY+8hJCvB40ygdtWhpWTkzjQ/e0XpBqYLxxQhHacirpDufzmguxjjnfh0HUNTIkZICNtQz+UicDnDxkR5ICzFlttLh5beXPubc+/nYk711DYe5aJT4gC6i/UYguJWCpAv7Hy9UEIbCyYq143kWEo8V9+Jl5VmYo95w053ZwQAvfWZ/IorDqp2kUWHrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LsWTh4aChueJM6whQvlN0TsKAjfcZPPgWFdVqO2gmys=;
 b=atr3TYPSlScXy9BiKsQSkZcI+FjFMca5ZfeuVMnQ49TUcV/R/QFLk3I7PEqN0vfZPjixoG5O9Ofj/kTufDxYwbpqRj+cTTvtkr9gqsvUB4qgoAyXPsQf5d5uRb8y1TFoy4DGVQ6jkNxiyPgimpCeW7v601rOB71E9LanhzRkIf/kBxm6ZF3hVNH8awoZDdUxGd/exs2HNWY6MifUbEnaNloYxBVXHO8f3Vp9J9DGVdZBAHUZKzIws7E3ng9hHuhR8u//XsY+M57EwZNlQHoN0jr296Ptf7E+9YywG/DoK/gCokRjv77PwQh2Js9l2+8bgONiGHcKnvORnER2wexpsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by IA1PR11MB7773.namprd11.prod.outlook.com (2603:10b6:208:3f0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 23 Jul
 2025 20:16:02 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.8857.025; Wed, 23 Jul 2025
 20:16:02 +0000
Message-ID: <340414e8-1e0d-4774-ae82-9b75dfcee015@intel.com>
Date: Wed, 23 Jul 2025 13:16:01 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/ptl: Apply Wa_16026007364
To: Sk Anirban <sk.anirban@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>
References: <20250716101622.3421480-2-sk.anirban@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250716101622.3421480-2-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0049.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::24) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|IA1PR11MB7773:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f6e330b-0047-433e-4b9b-08ddca25bedd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TkJXelQySytsd2ZrSzRlYXJMa0IzWllVMFFWS2Fwc0ZPL2FpUW1xekp6SGUr?=
 =?utf-8?B?TERFek9wM1hLVGZmRmxPZTJnSFVLTnArSHJhZkdGWEJqcWR1TWpyNUI0V05Q?=
 =?utf-8?B?N2V5Y3V0QU9nbzZZaE9JcDl0eFRQSzFvVTdKeSs3ODgxQllLNXRZUXZHVnJp?=
 =?utf-8?B?TkRhWlJHclhCeTl0VDZCd29ZMTEyK1J1T0NnTjF3d2VIWFZWNDJYZmhCcGky?=
 =?utf-8?B?Q3JJbGVqVVFCVFQ0K0pWeGw2dUFmV0V1VlJnd2RsTzYyN1J6TUIrOUNoSFRh?=
 =?utf-8?B?bG9GTGpDWnhwZlVJZUZTZXJhSzRIdTlYMUgzMzZiM1JMSWt0amRSYnNORW1E?=
 =?utf-8?B?azFQNXZJTDNKeERsd3VRVi9JTjQ4VUhkazA2UlZkeGx5ZG9JeU02UTlZYjBM?=
 =?utf-8?B?Y1R0bWI5UnZkd0JVNEFvWGR2QkJZMGxieU5kbUVUcktZcFN1cUhqZU1hWVl2?=
 =?utf-8?B?S3B1aTJUTXl2ZjJHRTU0TlpDYXZsU1ZFeEdYWjRobjRmbWtobUNsaU80cER1?=
 =?utf-8?B?UVY3R2pXU1ZRc3dXWlB5N0VMZEUyV3RZVkZoMG9HMTByNHZDdHFxWWxUazZq?=
 =?utf-8?B?QzBOTDF3aTRsM25KV2RUOENTUUU0V1JvY2RiVnppdFgyc3ZGY1hGdlpyMlJh?=
 =?utf-8?B?NUV3VVZkU2h0ckJMaHhOOEQ0OE9NNWt2SjZvbHNTQUgyVHJ0V2tEOTFYRDVC?=
 =?utf-8?B?SFRwYVFaQ1pqQVVaSng2SnhLckhOQjJ4d2syZ0N4TzNGWFpzeU1pYlA1OVhh?=
 =?utf-8?B?SlE1aTVFUUNwOGM5VDNlazhlbExxK3F2eXY2TDk5c1hKM2NTZ0Nvc1hPRzVB?=
 =?utf-8?B?UGV0SFROc3BQTGZzV3I2eThOUWlxOFd4cmdoZG4vSHBhOTMvT093VkhuYTY4?=
 =?utf-8?B?c1E2aEpUODRNTEpQREVhWkllREJvV0MrSEtvbUYzajBzWk5vQUlKWnY1ZmVT?=
 =?utf-8?B?U0Y5c0FCNTFCVHcrcjQ3dWxGWFZlY2hCM2F1Y3RPYllRd21FQ3dVK1lrOGdu?=
 =?utf-8?B?YUI1dUtXMlowdUs4ejZLaGM1clFabk1YazZDL0tNRWh6Z3lCS2orNGtFZ2JE?=
 =?utf-8?B?SEFtOWxkay8vSEQyUzc0SHZUaWd2d3lkcHJkcFZXbVQwR1pjK1RkVWxEQk0w?=
 =?utf-8?B?dXl0c3V0R243UnZWVTR4RHZnclNhL1ZLaDUrWTMxU3ZmTG1MVU1PQnltMHZk?=
 =?utf-8?B?WjN2N0QyKzU2Y2o5cFd5LzBKTHQ2b24rWCtDa0xqTDFYNXRtVnVoa3VzVVVn?=
 =?utf-8?B?b2lzdzl5RVhTZHJmNVI1RmdUdFpkdnB1MjdWYUNxOUlYUXdFS25RQ0sxSzIy?=
 =?utf-8?B?TnJZZUczayt4b2lkb0Y2RDRiNEtQWHJzZ3E3d3dWUWJ4WVMyRVdlR01panVM?=
 =?utf-8?B?WS9iNUkzU0xMcnJmd01KZFRZcVFqWE55WHpHaE93UVlTeFYzQ3o5eWpRNFRY?=
 =?utf-8?B?ZFZnZEdHTkJtNnFUUENERDF2d0MyT0lGeUwrN21ONTFIYWljcG4rbFUxQTlG?=
 =?utf-8?B?U2NsT20rUnRTY2tOcG9qR2JjeTZtYktJUHVFeDdoZWpISXIzbzd0QUYwbVR6?=
 =?utf-8?B?Yi9PRGJzK2drWUdSSklPMkVwaXRTS1VuVWVSMk94alc2bllKcEhDVVdTQmE2?=
 =?utf-8?B?UWdrUTZ5cENzL0UvMkc0Y2p6UGpGdzFXSnRiaGR4TDJQZ2V2aU9IUjIrN0I1?=
 =?utf-8?B?NHQvVlRqOEpOWHpWdzYvMkdoVlBkM2ZrOFRQZVM1TnRQZ1FEUVcweHFwQzhq?=
 =?utf-8?B?akR3V2hSZ1llczExRXhxSy9IYzZBcHQwWWIyZ3orWG9UbmdwUDZIa2RKbGFH?=
 =?utf-8?B?MWJwVStGeU5yeU9ycHhFRG5IS1hwRGZuRVp3Q0FqTXBUQ3lKSlg5am42MjJI?=
 =?utf-8?B?cHZoZlNUanFla1FYcVFmVVBaS0ZiT210UHU4M0ZNK2xDcWY2ZW42Q252MlBy?=
 =?utf-8?Q?q4drRgvU5JM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmVBR3NRM1FSVVRmdXZQVUlCT25KVVEybXpMQ2Nxa0FlZlJpV1FUYnFoSmU3?=
 =?utf-8?B?WUFtL3N6dE5mZmZ5VXAyMzg1MFBPUXFmNlZsKzdYS3NhbkxrbWVwaWd5a3hI?=
 =?utf-8?B?T2tZQ2l6TGsrVkM0UkdGREtLT0lVVUZsalJwMTdUYUhTZ2RaL3d5WEdTbnpj?=
 =?utf-8?B?RHJ5bTRQUU4rbVJPaStRcTYyTGhLSWE5Y1Z3bzV4ajBUaUNKOHBQVlhqbEVD?=
 =?utf-8?B?dWFYMTBsbnRORTFpbjE0Vks5UDgvbEh0cUl1S05PdGtZRU1GOGVUMmw2MFla?=
 =?utf-8?B?NUc3T29YSGgxaGdvYi8zMnZrSDdLR0xneXdrWHd2RjN2R2ttR0hjaXVTSEs1?=
 =?utf-8?B?cGpETTlyWFdkQUp2cU1vWmltakZvZmR3U3FBQU5GaitTU0o0ZTVRV01DbUFQ?=
 =?utf-8?B?ZWNEdjcxK2hENXF5MlczU1NtcUJnUDNMa0NRZWVHcE9UR2lQWHRxNVVBUnAw?=
 =?utf-8?B?UC80eExHaWFocDNnazN6b0NUY2EvL3UvRkdNb0gwMksxd1JSWXRPSUVqZms1?=
 =?utf-8?B?dnlGOUR1d0lubWFtY0Y5YVBxbk5mc01JYXovbnRDMlhVd2lScGdZU2FhZjdT?=
 =?utf-8?B?WkF1Vm0vR2YxWVRielBFWWhhUTRzSFEyVitWV0xMQnF6dkd5MnUvakt5SG91?=
 =?utf-8?B?YVphclp5RFluZVZTSmVOTzFHdGlGQkhqdlBxV1Z3MVIvWGppTmo0cUhiZ2pE?=
 =?utf-8?B?Vjd6OXJJOVRrOWc2czM2b3VKdHJ3bVJCK2xLdUxnYWwrWVcrWVgxdlNSaEFL?=
 =?utf-8?B?TWFjNDRLaExBTTBsQ1Q2N0NlQ2wxa2NkbXJNMWRvaXZsaUxvbEppdnNwQmpw?=
 =?utf-8?B?eEE5QWVtSm5sbkluRmxSOHFLN1JGMjhBVnBwVWhSTVZnODhpR21adVRVaDhD?=
 =?utf-8?B?S1ppUnNYUVN4VDVtRVVqdDJFVUZab2l5RHJ2dUNxdTIxVTF4TFFkMTlQcjdZ?=
 =?utf-8?B?d1owVlk1N0J0WTBNRmJWWGwxbnhOUGNtamhLZzJpVDQrVXA2Si9DdzhjY3NL?=
 =?utf-8?B?b0l4aWdUMWwwSk51YUhmSHZIOE5kVTA5eDlGTHJCNmtKWkw2ckVkTkR3Q0NC?=
 =?utf-8?B?NWZSeHpidzhac2RXbnVGdVVQVU4vbTdicUxyanJERytwL1hkeDRXNFlZMjVN?=
 =?utf-8?B?Mk5keXUzYUo0alVzV0IvYXJ0NFJDcU1Gb0p3aGVFY1cyRzczdW5ra3gvQ3NX?=
 =?utf-8?B?RWpwbWNzNmZ5QW9PdVF0dTYxTk91a29qVE1URjBsV1FLdnloamZqMmJ5WlM3?=
 =?utf-8?B?cEc2cGt1RzJMLzlKVjJoR09HejZVOU9IRm9xN2dHQWFGclRmVW1XWnRFK3l6?=
 =?utf-8?B?S28zL3NGRUpOK00reGhNTlRBOHdYZHNHcXVXR1FWSFBsKzRMUnJmb2gyQTdk?=
 =?utf-8?B?R3VHR1U3RHdMRWxNNVFXay9xbEdxTlZnTWNVRTR6MEUzUzBVUFBSYkd5cVVx?=
 =?utf-8?B?RS9iWlBlOWl2elo3bU4wOXZCZjQxbEE1bUpZYzRrM2p5TFFwN0lMMW5EK3Ez?=
 =?utf-8?B?SWdSRVFuV215bjl4V0RhYWhiNDNtTDREUHhURjMwc291OHB4R1dvbm8xTG0v?=
 =?utf-8?B?WUpkRzFTMVY5VXZYSW9HT1RJS3R0QVcyTk5Ha3FMWjlqVUNRdjNETzNKa0Yy?=
 =?utf-8?B?S25nUFhkbnhyd3U3RTV2UHZ4YkJQRG1UaFRyWHpXdzJhbWJLVmdFRHIxQTFL?=
 =?utf-8?B?OFBUNGtFbTVPZ1lnTzB5L2lzN0t5QXIrbFlLMU1pZ0w0QldnZTl5SldpODNz?=
 =?utf-8?B?azNBUFAxcEtzNEtpQjhlbkVxMERJSVF2Wlp5anVvWkFJbWhRbjAzaFdzYUFz?=
 =?utf-8?B?Q3VkRE1iVmJPVGRjUTVIcGZ0YkRYUElsa2FuK3pDeXhHa01CTWMxbTM4Y1ZK?=
 =?utf-8?B?NWRSQ3hranNyWEl4T0hESDRLNmVQRnVtZGYzOUJONUlUZ3lFSUZ4ekhoYysw?=
 =?utf-8?B?VUxoNkM0YXRNRnVoVGM2dlh4ZDIrejhXelJiQlRkLzJ1VGlFU2JJSWRDQ1Ex?=
 =?utf-8?B?akorSVE1S1RRQTVkd21XdWEza3l0VGZPa2NkVS9aeDFNSVlWRmZGSjlFTnJK?=
 =?utf-8?B?YmFTMmcxU2VQaDBHRlR6cERvQXQ0Wlo3WUJZNjVkYk9rK0FWblZVU29OZVJX?=
 =?utf-8?B?U2JLMXdlcFIyWWNDMjBDbEdLa2xBVVlzU0dldTNyTHBHaUI4MUZmRVp5UzlQ?=
 =?utf-8?Q?UOXIPV2QX+egHv1REkfX4Zw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f6e330b-0047-433e-4b9b-08ddca25bedd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 20:16:02.2872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sLnaBAg5rb0ISzChycWzwW7caVlnw2ovz7upuMWwauSER7OUaX3o9XL39TbcZj1sgyfSZ6WLMUJrZfcNi6Yp6lL0py5WS3ESRvJeSBcJOSc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7773
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



On 7/16/2025 3:16 AM, Sk Anirban wrote:
> As part of this WA GuC will save and restore value of two XE3_Media
> control registers that were not included in the HW power context.
>
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h |  1 +
>   drivers/gpu/drm/xe/xe_guc_ads.c       | 35 +++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_wa_oob.rules    |  1 +
>   3 files changed, 37 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index 0366a9da5977..31dbfeee289e 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -396,6 +396,7 @@ enum xe_guc_klv_ids {
>   	GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET				= 0x9009,
>   	GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO					= 0x900a,
>   	GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH					= 0x900b,
> +	GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG					= 0x900c,
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 131cfc56be00..8ff8626227ae 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -284,6 +284,35 @@ static size_t calculate_golden_lrc_size(struct xe_guc_ads *ads)
>   	return total_size;
>   }
>   
> +static void guc_waklv_enable_two_word(struct xe_guc_ads *ads,
> +				      enum xe_guc_klv_ids klv_id,
> +				      u32 value1,
> +				      u32 value2,
> +				      u32 *offset, u32 *remain)
> +{
> +	u32 size;
> +	u32 klv_entry[] = {
> +			/* 16:16 key/length */
> +			FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
> +			FIELD_PREP(GUC_KLV_0_LEN, 2),
> +			value1,
> +			value2,
> +			/* 2 dword data */
> +	};
> +
> +	size = sizeof(klv_entry);
> +
> +	if (*remain < size) {
> +		drm_warn(&ads_to_xe(ads)->drm,
> +			 "w/a klv buffer too small to add klv id %d\n", klv_id);
> +	} else {
> +		xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), *offset,
> +				 klv_entry, size);
> +		*offset += size;
> +		*remain -= size;
> +	}
> +}

This is now the 3rd version of this function, with the only difference 
being the length of the array. I think it is time to rework this to have 
a single function to handle all cases.
Since this is a WA, I don't want to block this getting merged on having 
to rework the guc_waklv_enable_* functions, but please follow up with a 
cleanup to reduce the code duplication.

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> +
>   static void guc_waklv_enable_one_word(struct xe_guc_ads *ads,
>   				      enum xe_guc_klv_ids klv_id,
>   				      u32 value,
> @@ -381,6 +410,12 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>   		guc_waklv_enable_simple(ads,
>   					GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH,
>   					&offset, &remain);
> +	if (GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(70, 47, 0) && XE_WA(gt, 16026007364))
> +		guc_waklv_enable_two_word(ads,
> +					  GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG,
> +					  0x0,
> +					  0xF,
> +					  &offset, &remain);
>   
>   	size = guc_ads_waklv_size(ads) - remain;
>   	if (!size)
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index e990f20eccfe..46ad72bb1f8d 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -72,3 +72,4 @@ no_media_l3	MEDIA_VERSION(3000)
>   14022085890	GRAPHICS_VERSION(2001)
>   
>   15015404425_disable	PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)
> +16026007364    MEDIA_VERSION(3000)

