Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A95EC27C4F
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 16:56:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2671110E964;
	Wed, 26 Jun 2024 16:56:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XXpSiQHG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C61A010E964
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 16:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719420978; x=1750956978;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=wu/UouZVZBfL2eZtITpLpVUKhZPKhVJANBABsb/LPvM=;
 b=XXpSiQHGkDgaCB0a1UlAZTGYN/rtJMFI06AEfKhxYLCqoHOSC/hb8O6c
 msKxPXxrC3kED+DhVXNmdN4rO1Xqf7BwnqOrk4YJIxXCrjQ2nN0MXVpSr
 5+tCWWFyzSV7Wxn+xd7QjIJPMS5j3nRYDSs/wNT4zwQijgaFi+6o+XLcV
 Vbb2zogpojW2immlJAYOgDqfr5usXT66ry9oFz/PKaZ+whfEoV61Ybk3/
 LhlGSydouIPbbfhP7xokuGuJahXHRxK3Qfeqpee43QgNtVQwxdAz+9Lou
 54CKr2aZrP8fjBudFO2gXG8VGOAuDaGmxhqtIYmEKkvxRJ8ooNUieMqrM A==;
X-CSE-ConnectionGUID: dW0xbeOrT96LJ9BiUbv2Gw==
X-CSE-MsgGUID: fJwUDI9uTPGMTfJ+EXt0XA==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16642245"
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="16642245"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 09:56:18 -0700
X-CSE-ConnectionGUID: yZJeXPsgSgmJg86pYLA2/A==
X-CSE-MsgGUID: m2yTwcoxTymErtqK3qYPhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="44034439"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jun 2024 09:55:52 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 09:55:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 26 Jun 2024 09:55:43 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 26 Jun 2024 09:55:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GEZnVLDlUc2MgQrL3gXTdaJzv3rI3OkA2QT3H7132AbkDDjQngHKXvkD2cD4x/W2pfXo9ayB0oQi96pEQXnndBk1Me8BZFZR+K5q7zETcsaXG4+pnlg+wPw8n3p2QFvP4n4SydNIgMrmNKfg9mZyAmdV7pm3bC/AWy2ZZkFuZ7kV9i5agBuvbOLAP1FNxwgLJ4dSaI+XG9z21m/hoo5apopjBDNrTd4ndzj8XnjxQ2F1FcpcYtbR5fM0g3bTWwB4H3d/mUn3MWCugPg32B4s9GoYw71KU/aChlQPPwVh/RX5t8m+B0AEKTE7o7sTP8eBRVZDebs0HlEKvkT3mhJefQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wu/UouZVZBfL2eZtITpLpVUKhZPKhVJANBABsb/LPvM=;
 b=dK8lR8TeU5K5U6v7VBl/FyFSFDNkA1xbt64MX7kua1fGWkJRQ0bLQAglDocQxpYORSk3oAYdn3pEgxta2oGKkjPDp4Or8AY7rRv/ulaNKcuBWOXp9oamed6dAdbL8HIoB3iboNba5+rw4pLzP3WJfT3y1otcNaXVwmVWhNipmF8GVtCrISs09eFGHZKaW3tiUcikzGOnllUpu3Qz5Wdkv+wp2xwWdWVOTVXub0G/iptp3yh2N1jA72AU+rt43yQ6bqBQeb3tD6QJ8Nua7voAuO9d7IwVnbROYyNOLyi847y+LIc7R+0Sjhy7l3t+2KtVunUZ8yWrCXdf2oW96TQ/yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by PH7PR11MB6746.namprd11.prod.outlook.com (2603:10b6:510:1b4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.29; Wed, 26 Jun
 2024 16:55:40 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%7]) with mapi id 15.20.7698.032; Wed, 26 Jun 2024
 16:55:40 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH v5 0/2] drm/xe/oa: Add NO_PREEMPT property
Thread-Topic: [PATCH v5 0/2] drm/xe/oa: Add NO_PREEMPT property
Thread-Index: AQHax26z5QkwKpS+fU6CCkMv1cysJLHaRHkA
Date: Wed, 26 Jun 2024 16:55:40 +0000
Message-ID: <760e7d389b66748e839cc249933a9a95d0ad977f.camel@intel.com>
References: <20240626021343.1054590-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240626021343.1054590-1-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|PH7PR11MB6746:EE_
x-ms-office365-filtering-correlation-id: ce110a75-789f-4141-5c7f-08dc9600cf5e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230038|366014|376012|1800799022|38070700016;
x-microsoft-antispam-message-info: =?utf-8?B?UjB6TXVwbUNra1k1U042elJnU3BBOGhGTzVQcjFxWitwR1J5VG1Mbm5UUDJJ?=
 =?utf-8?B?bDMzdzhSY0pHbkVxWGY4MUhaY0RuYUtMYXdKV3QrRG9KWHB0MXRTTG81SFR1?=
 =?utf-8?B?akh4cW9kYzF2Q2Fmdll4OGFjdnpWaVFPeUlxbEt1ZVh6dmdXWDZyR1U4QVYv?=
 =?utf-8?B?azArRmd4UnFsS2twaVpFUkk1WWtXaXR6MUtBUmFma3lrTWNBdVFvS1VXMUY0?=
 =?utf-8?B?RnE4SGRGdzVZNjNSSmRpOWZZR2ttQ0RKRm02aTVyKzNaeEdHTGJrMnhmaUVz?=
 =?utf-8?B?akxSbXhiUU1WNnc4UlJkVGl1K0JydUdYOXcvSmJQVnZ0c1J2Rm9JTDRRTU1s?=
 =?utf-8?B?UzJZYSsvcTR6d1M5ODhVT2ZtZkxIQjdPaTA2Y3dONzRabm0xQmNrckRqNTZj?=
 =?utf-8?B?SFh6QUZTWVZvWTdxSzlibUpCY3JrYVNVYU9NU3l2TnF2QS9DaG1sbkptY1Ni?=
 =?utf-8?B?aXU5b3hlc1c5VkdKUXVrV2ZzQld6RlE1ZGNQUGR5K2VycVZoZUZZZUlVQjdH?=
 =?utf-8?B?ZitBVHFmaDMwSzFRejV1Qk1aWmpjZW9hTEJnTnp1S1k0T09hMnRSMGtkOTZK?=
 =?utf-8?B?TVhrQjJVcHd6Vlk4RmdjUnY3UDY0MGFXSUM3MkJXOGVFSC9RdTh3ZGR3UGgw?=
 =?utf-8?B?clhGeFNSWXk1WkdnbmRuUHRVd1NZcXE2bDcwa3JEeVpmZnJ5bXU2SmQyMmRS?=
 =?utf-8?B?M0xMRHM4QVFBUFBMMExJcTJjQWZpeXhxUUNaZFc0VWZ4WjZwTzJqbmpwYXJU?=
 =?utf-8?B?aGUxeldZYzJDbmF1TDNJN1FTUVYxSDZzTUtOTjQvSm03SC9XVTJDQnM1SGhp?=
 =?utf-8?B?ZVF0Vi9VQXpINGVlSEVCV0lNcEJLQ1BkSzEzWmRjbEJscnZUclZjTGpRWExq?=
 =?utf-8?B?N3lQTEk2RXBvNmNSbHdndUJ4bTQ2OXBkTStJS3VoTDNwZ1Mrd24xRWpFTytr?=
 =?utf-8?B?Z3RwRXZiaVREUnRGckpDVFZwMHVtNzRrSkVBdFVzTDVySlcybGNpWjZ4TzdB?=
 =?utf-8?B?NzRyM0JhSmtHdkNJVzAzYkFzbUR6S0U1NzB3SVVKK0NvVkY5T3ZZM203VmQ2?=
 =?utf-8?B?Wmdmb3UvZ3pGa2FnaEJZaUFienc5cEJKYVM1Rnlidk1GcS9rSFlQMUppVU9X?=
 =?utf-8?B?YWNHVlhvZER0aFN3Q2VEb2RzT0tKV2VUVkppci84dnpMM0VaYzd6S1FPaE1G?=
 =?utf-8?B?MEJpTjF4R043RmNEcmhWMjFWZVpKSEV2SWIzQmNxMkdHMjdHWlNzTzhqdHZS?=
 =?utf-8?B?TUpxT3lxejkrRy9uNldqVU5lTlBWeDgvWTB2dUl5RTAzMUFSNzRDc0hxazZZ?=
 =?utf-8?B?RzRiWVhvbWhsdkZLak9STkRCU0RyRXVuREdrbU1ra1ZCTkxzQzBEVEJrU3ZV?=
 =?utf-8?B?SmNXS01Tb0NEaFFxMml5b2JXVHIzZlBSUmdMTWZFRkRKaysrN0lmNHd2UzVB?=
 =?utf-8?B?ZlQ0RGlINC82cHh3UEp3TE1GaUVkWXJEb3l4cmZHdncyZTRFU3ZUZUw1NmJt?=
 =?utf-8?B?dTNPM3ludEVpTnlWb0J2ZGlFQStTN0JHcFZvbDQxbnE1d3hjdG52aWI2SHlY?=
 =?utf-8?B?NEd0eEdvckpIZlYrRU05SDh4UDFDeWpsSzczcU1OWTd4NDh0U0VFUHlscE1Y?=
 =?utf-8?B?ZkE5MFBqTWNYNGVxcExxTG9kdHBGL2l4K3BwcTBQZXF3ZHZ0bS9YenFBYUpu?=
 =?utf-8?B?Y29MZk1JY3lLZU5sWjZIekIyUEFMSy81UDhxTDZCUE1qVVU4YkRVdGY3cFZp?=
 =?utf-8?B?YTVvcnUxNDRiSFJFQlpYaENaVGpPK3lQb1VNZW44KzZnSEdFZ2VQR25FRnpp?=
 =?utf-8?B?dDFmR0ZkQzNXM1J6empmQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(366014)(376012)(1800799022)(38070700016); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UlJmRVZleG9lZjAzU2djaEZOM0tHRVkvNUQ1N0htaks0VlBtenA5dE9yWjBv?=
 =?utf-8?B?WGlzc2RuZWpXVjE2SmdZdzQ3SXlnb0Rzalk5RlVYRnUydnZSSi9laWM2YmNy?=
 =?utf-8?B?UkdvSzVFaTd6MU1KeHlFZVptYndjUDVDMDZ2MVlPb1ZMbFVUSXlNakxscG9G?=
 =?utf-8?B?T2hUOFZRODlXanBmYnJJd2xRN092SU9JdW83TVA4QjJPZnBrNFJPOEl0Vncv?=
 =?utf-8?B?cUxzeVZJd0ZtcnJ6ZEQyNTd6bmtRMjZ3SWRFRGlxNm5GWlZldnA0N0dPM0hk?=
 =?utf-8?B?MUpEMW4rcXV1Mk5zOFpFUXo2andYWGJYR0haRkVnaWh1Vitzc3Y2VzVZYVlW?=
 =?utf-8?B?U29wRnE3R2J5bW9sR1Y0bHFCaGFydVJWRDREV2dCZk9QZVNTdm5uM0RBdXFM?=
 =?utf-8?B?VEtySUxVTkhXMmU1NDZkWFBYRmYvcms1N3BpVmoyZnIwWkVhaTFiLzN3cHpF?=
 =?utf-8?B?S2YzNG1nQnhWaTJoN0FmYUxUektsd0YyQi9qY1hiek5qTFRTNlFZakxXcEtk?=
 =?utf-8?B?b216REljQ1dlVkRseUw5OTlWcHVISTVRQy9hVVg1NGh6QXNUT01Ma0hNZ09S?=
 =?utf-8?B?b1lSQUdhSUdnQUlQc3JXRGhQRTY3MEUrNmgzOVNHUUpoTitlT3R6bFFvQmVC?=
 =?utf-8?B?bkszWGppblBLa29wVFZQVGNXRktWMERGRUpaYWZpTkRHSmNPTURuQUV2REN0?=
 =?utf-8?B?ZzRRRmI2cldJdEhIU2NIRThPa0M5VktRUWsrc3R1eTRrV2Q5UEU3VEY2eEZo?=
 =?utf-8?B?bTlROUlUYU9jdHh5djJsRi9RaWlEeTJqMCszWTFVTk42RUl4TXdkSUt5UGk0?=
 =?utf-8?B?ZklYL21SeVBlY09GMGN6Z1l0YjJPNitFemJWdno2UXJCbzNqMUNMbU52eTkz?=
 =?utf-8?B?TW14dkRwZ29nSVNSUlIxMnRyTExJWllyN3FhM0lrK3FoS0luVE5ZT25kaTRy?=
 =?utf-8?B?aXFlS1VxNjU1djJnYXdYQjNrcUw0cHhYTlRMS0lPN0E4d05RTzRmemdMZWFQ?=
 =?utf-8?B?bUxVeGdxWFNaL1g0Ym5tT2ZiZ202bDlDTWhXYURrL3MxMXE4SkY2MzlNR2M2?=
 =?utf-8?B?dW8waFBhckd6TFIrMFdrRDE2dXQ1dzdpTnlseHQzS1Roc3dEekx1UDhlbWhL?=
 =?utf-8?B?d3AvSGlsNld4Y0lCMFhVdENyNmh2c0g5TFgrU1Z0NFhZOW1TUHJNUXhzb2x3?=
 =?utf-8?B?SjNBM09Td05SYnVEVHJkcllRYWVqSjFndEJwU1Y3T2RuT0x6Z3NBWjhJRXJx?=
 =?utf-8?B?SkowRFA2N0NPajZEZ2hhazNudkRXUlJiRGk4T0tyZk1tYUhwSzF3SEpJVU10?=
 =?utf-8?B?MU9RRTBiVjZZT29DR08yVy8vdy9WSzNxQmhoS01JRFBHY2tDZ1EzZ1Ricmh6?=
 =?utf-8?B?OVhOVHNUZ0ZMQTRMc0p3UTA1d1lrSW9rRTVRWXRHd28veGZiYVdjRWR3SFZK?=
 =?utf-8?B?b1oyd1duMXZzb3E4NUxJdGZycnV0RmtsL3dxbmpkb3hPV2NJWDZVNkp5MjJa?=
 =?utf-8?B?VER5YXR0SVQzWEFyLzhNa1BXUmdIcTJLS1BOUTY1bHdUNkptUU4xQ1NoMFJq?=
 =?utf-8?B?cGlRcGVSMlQ1Qk1mUWxrc3IzWVp3YndjMTVOT1BVVFZRQW8wNzZKeCtFMlZK?=
 =?utf-8?B?R09FOTZ4cFZkbzRnWWUvWFBuNjNqd1RFb1JaOU5LdzZtbzNBejI4d1BRRFdC?=
 =?utf-8?B?YWg1RVYxYytGbkJYd1B3YVdxLzhNYWUwQWpWcXpFL1Ywa1VBOE9COXpTRlY2?=
 =?utf-8?B?NktSUlRidlI2SGxWQ081QUxNSVBNVHZJd1Q0azZpNUl4L0FXZmhiVjh1SHZq?=
 =?utf-8?B?QjlhOFNydE13MDlWNlBuK0o3T2hOYlRyY1JCUTZ6TTJrTU1VMnVvaHFNdUF5?=
 =?utf-8?B?Sy80c29Fd0M3dE1ETG8vRjlWYi9lTEppdGpqNEVxVEFnT3RRUHBZMzREUFFj?=
 =?utf-8?B?dzlxNFlpNGZNbkozTlN5Z01MbDJwOFRoWEZxZU1VSTMxQUlmcFd1eEl2a2ky?=
 =?utf-8?B?QkhsUkIyOXJRTnpaRUFFc3JJcVQ4UmQvQUc3MWxVTkNETmF4RmducHNOMXpO?=
 =?utf-8?B?ZTRaMjViNE5taFhmM3NZSWxrZWI2UndEbkpFRTFjTC9CWEZVVVB1V2JkdGJL?=
 =?utf-8?B?MHhVZ2xRNXVXMEJ4Mm8rR3RWRkZXQTIzb1o4dndXZmlZZytXbXVkR2hVNTdj?=
 =?utf-8?B?K0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <60094100B764624C9024A61C21BD99A9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce110a75-789f-4141-5c7f-08dc9600cf5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2024 16:55:40.2466 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CVMIvUvWxrNc19JKzApOzrjttYy5bTsaAdFbyGHpXl4maQrdWFUCtsmV1nGpA/Te/5up3qRmrkOgjpaA91/lXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6746
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

T24gVHVlLCAyMDI0LTA2LTI1IGF0IDE5OjEzIC0wNzAwLCBBc2h1dG9zaCBEaXhpdCB3cm90ZToN
Cj4gQWRkIERSTV9YRV9PQV9QUk9QRVJUWV9OT19QUkVFTVBUIHByb3BlcnR5LiBUaGlzIGlzIGlu
dGVuZGVkIHRvIGJlIFhlIEd1Qw0KPiBlcXVpdmFsZW50IG9mIGk5MTUgcHJvcGVydHkgRFJNX0k5
MTVfUEVSRl9QUk9QX0hPTERfUFJFRU1QVElPTi4NCj4gDQo+IHYyOiBJbnRyb2R1Y2Ugbm9fcHJl
ZW1wdCBleGVjIHF1ZXVlIG9wDQo+IHYzOiBJbnRyb2R1Y2Ugc2V0X25vX3ByZWVtcHQgYW5kIGNs
ZWFyX25vX3ByZWVtcHQgZXhlYyBxdWV1ZSBvcCdzDQo+IHY0OiBSZXZlcnQgdG8gdjEsIHdoaWNo
IGRvZXNuJ3QgYWRkIG5ldyBleGVjIHF1ZXVlIG9wJ3MNCj4gdjU6IFNhbWUgYXMgdjQsIGV4Y2Vw
dCBhZGRlZCAndWFwaScgdG8gUGF0Y2ggMi8yIHRpdGxlDQoNCk1lc2EvVU1EIHVBUEkgdXNlcjog
aHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvbWVzYS8tL21lcmdlX3JlcXVlc3Rz
LzI5MzEyDQpQbGVhc2UgbGV0cyBwdXNoIHRvIG1ha2UgaXQgcGFydCBvZiB0aGUgc2FtZSBrZXJu
ZWwgcmVsZWFzZSBhcyBvdGhlciBPQSBwYXRjaGVzLg0KDQpBY2tlZC1ieTogSm9zw6kgUm9iZXJ0
byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQoNCj4gDQo+IEFzaHV0b3NoIERpeGl0
ICgyKToNCj4gICBkcm0veGUvb2E6IEFsbG93IHN0cmVhbSBlbmFibGUvZGlzYWJsZSBmdW5jdGlv
bnMgdG8gcmV0dXJuIGVycm9yDQo+ICAgZHJtL3hlL29hL3VhcGk6IEFsbG93IHByZWVtcHRpb24g
dG8gYmUgZGlzYWJsZWQgb24gdGhlIHN0cmVhbSBleGVjDQo+ICAgICBxdWV1ZQ0KPiANCj4gIGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9vYS5jICAgICAgIHwgMTA0ICsrKysrKysrKysrKysrKysrKysr
KysrKysrLS0tLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9vYV90eXBlcy5oIHwgICAzICsN
Cj4gIGluY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmggICAgICAgIHwgICA2ICsrDQo+ICAzIGZpbGVz
IGNoYW5nZWQsIDk4IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQ0KPiANCg0K
