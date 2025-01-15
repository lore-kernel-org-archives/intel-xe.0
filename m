Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C370C02180
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jan 2025 15:10:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2699E10E06B;
	Wed, 15 Jan 2025 15:10:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="al0MIZ75";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0928510E06B
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jan 2025 15:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736953799; x=1768489799;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Iu7C2KLkaWT6doITa3vMe3VH4aVus6URVh9ml/Vjg58=;
 b=al0MIZ75Uc2s8+xIetPlTU/Sebc24MGtZjMWL0++78nrNwALYcDebSrH
 JVsBLknmOXYjjWsH4DTGHXwA/xXX1WY90D+HaJY6G0LHUMBOfMPRIa9Vl
 zCeVn9KKSKTyX9Ru4F4IYelW+9x7/PyF0BhqLBYAvsagojZsnFCjpjIsl
 XwIZoPpu7RSyBu3U5fJRwCBG4UvjD+Es/J+fNgcIluPyead/WAa92Kgt9
 /MC8esqwPXRRTySUqQb8zbt3fyQ+kYCAmLTb3HRvHlROfQhtz0g3qbvlK
 EOK8XApZ+X5p/0s0qGyp3rq8vAlpK6iS9C8+WWTwIxwy+c6M+QKO6IXig A==;
X-CSE-ConnectionGUID: yLBVYvUSSCK6ATa2f5bmGg==
X-CSE-MsgGUID: nDMQMza3SEOnibqGrfaM2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="40104822"
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; d="scan'208";a="40104822"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 07:09:59 -0800
X-CSE-ConnectionGUID: 5wWkfFe5QCmHDq0BTdrw5g==
X-CSE-MsgGUID: I9bN5z8IRNGUohCyesuqLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; d="scan'208";a="105004137"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jan 2025 07:09:59 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 15 Jan 2025 07:09:58 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 15 Jan 2025 07:09:58 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 15 Jan 2025 07:09:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UtVVSVJtJP76PV49TclV9DBg2SUK+AwGjKKhmN1vFmntf2qZGVGDQwKQGuNIVRXX4sgpWGNwR6+xVHdmzPQFNN6hvpvF8dG5sz9XsQ/HK6qxhG79pzN+HtIOZ9P3YCC0X8B5aqRIleIpHlKMlxnQ0/oUgL+N6D8dhT/jtP6Cbe3OdPK7DZJQhot3cHAhy0MsI2Ub3HwEKIGloLBzcw58ovsHt/gt5ZOXtDBMkhfwMoxTmwvQSeg38hSo4hc1MB+8aat7NT+Mb/+zsZcpx2ibJTncjrXMDLjAXUdlbxQkfwtLjuq8jIhFkX6uEFPkVWlQZ4lPzsjxF0AQOfPL/OgaOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iu7C2KLkaWT6doITa3vMe3VH4aVus6URVh9ml/Vjg58=;
 b=wQqSO0rg9QNdZWmaFMR0ahnBV25POBvBGqYcGqM1AkDmkA2NrCL3GII1nHuoKBAhmBNaxckRx6T6bfj6zx6GuIj/Mz4Oy95rcdd8Bine4mnfm9wKFcDZ/GyiZ9gyk1O1uVaQttvPHpbuHYtF+Lta2skbb0374kEBTqWe6QsmhMvZ1IZK3zqsIuZD7h8oprV9JDzV/t9nzgkIH21dh2ytiKTdzGZwrOy67/vNs1xK8n4yr8kkEMAmuzoB7x3ajXi3lK/B376goGtoRe4Ow42EA3C5jGUNwhUn78OgOSAYJGTMm0ib11F80HohZ5/5S8BVRyZzZs7N/KxU63ttLmkFQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA2PR11MB5050.namprd11.prod.outlook.com (2603:10b6:806:fb::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 15:09:41 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 15:09:41 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 1/2] drm/xe/display: Move dpt allocation to helper
Thread-Topic: [PATCH 1/2] drm/xe/display: Move dpt allocation to helper
Thread-Index: AQHbZq5EKKef+MwvU0+YQk/6GGORcLMWnj9AgAECQwCAAFC2QA==
Date: Wed, 15 Jan 2025 15:09:40 +0000
Message-ID: <CH0PR11MB54445024134CDCFC27E2662BE5192@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250114180403.896587-1-juhapekka.heikkila@gmail.com>
 <CH0PR11MB5444F77CC2DE257A7BA51E1DE5182@CH0PR11MB5444.namprd11.prod.outlook.com>
 <4edb736f-907c-4506-ae77-739d3aa377aa@linux.intel.com>
In-Reply-To: <4edb736f-907c-4506-ae77-739d3aa377aa@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA2PR11MB5050:EE_
x-ms-office365-filtering-correlation-id: 0cff0ce1-b32c-4e04-2e2d-08dd3576a2c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RUY2dGprRnNXQ0M3dlNMeGFpZzhpYjdjemxjQTRwQW5uekRMZzZwRGUwckFt?=
 =?utf-8?B?cG96UUZuTERSYklDMWp6RW4vZmF4VTRFd2Fsbm1FUGllUkZydDdKNDFWYTFN?=
 =?utf-8?B?R1IxZzdVWWhYTktwb2lUMVY4d0psOExkYTh2djBLQWdpOVcrc1o2NEE5Wkw5?=
 =?utf-8?B?NGl2ZTdxS2ZWSkFPSzVNajJ5UHFNeitBNlFHK1ZkN2Z5aFZ0UFdVbnZ0RUNw?=
 =?utf-8?B?NDNHMVFVVWQzVHFRVVNpWmJiN0xBaStKcmg0WVhZVlI2dFdWVERUOEcveUF2?=
 =?utf-8?B?c3VRbDJTMEtYTGpzTWN3SEdsaVFoaTRkWmwvNWdmWlY3blNEM3VBWXphZ1RU?=
 =?utf-8?B?Nmw5MzZNWFNEU2NUSklldGpBenVuZkF2eUVrSXpXN0hiRzJ5bDFOOS94M05C?=
 =?utf-8?B?SUY0K0J2blJqRFdMa2t0MXo2Q1NTQVlObkdONEwvdk1RRkVpVHZuMDV0NWs0?=
 =?utf-8?B?bER0UFBoOVFFWDlCZnYxbmNqa2dPUERSWSthZzBWNzZkZTVBVkxCK29DbjY0?=
 =?utf-8?B?Q0t2SXIxdVRzbzYxMDBXb0svMUF0WXh3c2JBa1lSVUppQlpkdkxhMmlJVk91?=
 =?utf-8?B?L25qNDAzSWxlY1ZFMmxDTko2VEZsOWhVTkJmOVRIY2VHcDBSRmYwMkh4R3pj?=
 =?utf-8?B?YkI2c010NDNOL2tBUndCM3BTZ1JFUkFwMDFKRUhnemY0Mlp5dFkrUU02VWhJ?=
 =?utf-8?B?eVFKblgrcXZGdytUa3grd3pyaE5jczdiSFp4c2NHb3krUUZVMzJudGpJVXVO?=
 =?utf-8?B?eXBiNGFWLzJNY1AvcFdyc3VRTGJla2x1N2dqT3luWWlZTHJyd3FUem9YNDVD?=
 =?utf-8?B?eWVJZEJ5MlQ1cXpKNXJwQy9Nb1dIR1NkVGZuVTJkN0s2cS9XSEp3NHd1N1Fk?=
 =?utf-8?B?WEpsMjdrdmNCRWNHUEtDanhpYlRaY2pKcjV4enlLd21rQTlQTXYrbkI0eEFL?=
 =?utf-8?B?ZTh2L296bFRXbXRIYXBTMlNlS25DeUMxWkxxVjlCOXpSckw2M1dYSTZQanZH?=
 =?utf-8?B?K0YrOW5xWjRON3RKK3JHWTRkK1JkNFUyTHZuN1ZXbWVPUGd0K2YvQW9jQ3R2?=
 =?utf-8?B?MDdKc1dRZ2pob0pHbDF5ME4vZDJqWlB0L2JJZ2I4QTh2b3E1dmZUZ284ODcr?=
 =?utf-8?B?Uzl4ZWJRQ2lkRjVKaGU4T1JsM2pSTjVpMjJ0RFNWam5KWUNqRGVBUjVhZVVO?=
 =?utf-8?B?NTFGTkVFTDgzTHpYcFA4WmdpM2tCZ0wwMmIxWWJ3TnRLYUVISGdFdnhOb1Rw?=
 =?utf-8?B?VzhObHk0YlAzWG44ZWJoV3ErWHBtZ0Y2M2JRQlNicGpZR3haUXRLeGtDVkM5?=
 =?utf-8?B?R3c4OFdRY051aXFETVEwMFpETnR6YkQ1QlhQejcyc0lNNkltbzJteVZJY01J?=
 =?utf-8?B?TWROeGRUVVltR0NZZEFsTFBnUmpGV0h3VDgwSFZxcGp0Q2Z5VlB5a3g0a1RB?=
 =?utf-8?B?RmIvQzBHeE1oRG9DZStTd25HY2I1cG9EVzZSbGx4dTliM0p1OUhvMWNsSmE3?=
 =?utf-8?B?WHliZ1E4QjBWVXpQeHdvMXU1R0pzMEhrWk1VZ2srTE5tMVpOMTJNLzl0ajgv?=
 =?utf-8?B?ZzRjdWRQQi94WUxDNXZMRjdIZGxEakZyVWI4YTRiek1SbFUzZHV6OWl2SjZs?=
 =?utf-8?B?bUQ5REJYVkFTNk5XK3Z2TlpOaVRhUFYzY2IweWxVRTV6aXRDbG9XRGs3ZVZR?=
 =?utf-8?B?S2ZXNlV5czBiY1JLM0ppeHhRdnZYZkVkSGZTVUZ2dEoxMlVPMFE2c0k5ZENz?=
 =?utf-8?B?c1NYTkFXQVVmdkRvL2RUQmpWS2VmT2cyMjNOZVVOSE96SWoxb3JCWVF1YVA5?=
 =?utf-8?B?R005cGhQc0x1ZCtBWmFZaGVNcm5wNWdrRXcwS1oyVzBBUy81VnIvc2dheDFu?=
 =?utf-8?B?eFg2RnVhS1N0SWVLY0JsY2JGeW8ycldhajJjMExLR1REVkNxL0VQOGZrNVVH?=
 =?utf-8?Q?vo30a4bXi6wKozILweOOWCta9Rwj9BOK?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N1FWVnFkVWdlTkpFRUVyVkRkNUFCbVNUWktrVHpwVWhVMittY2tJckttS2Rt?=
 =?utf-8?B?VWM2emZEaGRTdUp1RHh6Q3FiTlN4OE4zN0g1cGxZMW5XWHQ1NEJGSWdsUUJy?=
 =?utf-8?B?UmZXUXYwTkx1a1dWVUZCYlZtaU91YWJZNmplRXNhTFdUekFhZE1icVdSS1dj?=
 =?utf-8?B?S1JYcDE1dElwc0NmTU9OWS9GZEFlY2JaSkNNMFZ5MUY3R3NENzdlcnhmbENi?=
 =?utf-8?B?eld6OFh0OEJyMUQ3U1VVZ0FlNklqNVJVbUhYTVplMmIwUmcrUGhxWVE0SDRF?=
 =?utf-8?B?QlozOEtsUEl0Tm12OVpxUlRRNVJ5akVuUVIyM0dhK2VaRUh4STYyZjdwTld0?=
 =?utf-8?B?RlRWMGs0am1kV0NiMnBsdUtLbzZVMDNPcHJpcmpjQjJLbDBTTWg0ekJxbUpH?=
 =?utf-8?B?MUpBb0x1QTdJOTY0VFJ6NEl6cm1vR0FrUFo5MEp5cnVrZTN0MTUrdXVPWURH?=
 =?utf-8?B?azE4RFZFUTUrOE8wRnlPK202TEpobHpPU2RYQ2xEdnJ1RFVsZWYwVjJsTTBp?=
 =?utf-8?B?Vi9YdDF2T1p3M1NZSmczUmpIcm45SmlPZjkzdkhCMW1udDhxb1c0WGpQRWEw?=
 =?utf-8?B?MS9IU1NWbzZ3eGFpZ05lbDk5NXpkZjFtcVk4dVo2eW9RRCtDSkl5SFN4dFE0?=
 =?utf-8?B?SjUyNDM5OU11WkRqY2F6cWpZNzAvMXYwanoyeGo5d0hsbDdMcVpLSFVIYjE4?=
 =?utf-8?B?eFk3UitxQWNHckNMWTZ0MVBxVGR5THdpQVJQN1RONGEwOXR1QnJxUkpKSmlD?=
 =?utf-8?B?cEJHYytDMERYUmRadzR1VVNheHhVRk5QZG42RnBScC9sRXBTZmpROG4xMkp6?=
 =?utf-8?B?Y3NZS1VHL0Zub2lyeHFRR0FreEJrSHFrdVhaZzIyWUpJUTZVYlhLOE0wNHJk?=
 =?utf-8?B?NFpWdWpxZk1Wc3hLQUhSSVRnNXFpcU8rRzdqQ0YycFQvQWJab0krNlhYamdj?=
 =?utf-8?B?dEErQ3c4ZmFCNXVxMGI2cmtXOFA3cEIwelNWbjk4dGdTM1U5R2hsUzhZSkhH?=
 =?utf-8?B?MHF3bDFVYTl1Z2Jybm9JSUViNGU4TVNIT0kzWE81ekUwaXcrU0FYT2ViQ0JK?=
 =?utf-8?B?NHJCeUtwbk1xVmQ1cFMvMkVJVGYwV0pZTXZGSndsZWh2V3EyVTdtQWZxcmVo?=
 =?utf-8?B?TUQ3RFdpbXI4WW81QkMzNm1nbVZjUzVqaHNFbE8yTDN5dXJXNER6K0pQTjh5?=
 =?utf-8?B?Zy9VSDVoU2JMRkRIMHVhc2hYR0dFQU5VTXNJU2FidHQ2WXRQUzFLTHFpTk5k?=
 =?utf-8?B?WllDU1lyUkpTUnoyeUdmRFdlUERLaXFzNmduaURhTlpVUDJFWERiRDg5Um9E?=
 =?utf-8?B?ZFVNdFlHckNXdnkralJJbm9uYS94MHI2NmtkNlhuMTh5NURKV3pvcVlHbitQ?=
 =?utf-8?B?bXdjM0kxSnF5MkNQdk9mdzJ0dG43T0F0SkhQYk9CWDFnaFM1UnZ4YU5sSngy?=
 =?utf-8?B?Yk00OG9KYlZKK0VIaXJ2bzRuOFVxdHg5bjEzQjJBOXQ3cldjMDVqR1AvN25w?=
 =?utf-8?B?QmVCRjVzallWU1VCM1Nad29YSlNGUC9Ia3VxVXRGejQ3Ync4cXliS3R6bjdB?=
 =?utf-8?B?OExGaTV6UWpxSnIxS01RZTczUTUrek1qNDUwNllGSnVUb0pyVjg0S0p1WVph?=
 =?utf-8?B?SFplOGc4ZURmcWljclU0elJseGhycEdBNWI5RDZSOGc4eXFwQzVBMlRxNnR6?=
 =?utf-8?B?b1haSk5hRWlpcVhkVmFCYzhrZlpZMklST0RYeWNxbHc2RCt4MnRPdFBreVFj?=
 =?utf-8?B?K0RmYUEzR1NZYURqVWVOMEp2cDZ2blRZOWM5QjYxbFBsdzBBYnpZU1g0TWcr?=
 =?utf-8?B?aXg5OVhjZk9Gb0pLK1pkS3hMeVpJM0JWRDVnRkkwaUxNYlh1c01EdFZjdElY?=
 =?utf-8?B?cE1rTnVyZU45WTQ2ZzF3Uzc1YXI3SHRmTHRJenA1Q0Nza1AzUjlSMlpPbnFV?=
 =?utf-8?B?ZDFZcTl2SkV4ajlGM1BqNHBFN0hPb0U0Zy9WREF5dUZpQmVYaDdCcnlrQmN0?=
 =?utf-8?B?R2lRV21VSk1TV21XRFNXUTE4eWFvTEZoVjB2ODZuemNkcHhvWi9ManlUSjV3?=
 =?utf-8?B?OGJOcnpKS0xKVkJ6eVVMc1phWEc4andaTE5UQmxwQWdCNEhNeEpOT21hdkJl?=
 =?utf-8?Q?hZ0L0v5IXkZBCCUN+k1RPr6EJ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cff0ce1-b32c-4e04-2e2d-08dd3576a2c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2025 15:09:40.9821 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g0bpVWRJnmQZIR4PkT7rQoSpIlTabejv/rCJWFPoR/aW6Y9Ih5aSadyqHyF30ixLSuSrXS+JzW1iaGMC9AvqtI5+GMNha4DiTTQTziHMPh4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5050
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFy
dGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+IA0KU2VudDogV2VkbmVzZGF5LCBKYW51YXJ5
IDE1LCAyMDI1IDI6MTkgQU0NClRvOiBDYXZpdHQsIEpvbmF0aGFuIDxqb25hdGhhbi5jYXZpdHRA
aW50ZWwuY29tPjsgSnVoYS1QZWtrYSBIZWlra2lsYSA8anVoYXBla2thLmhlaWtraWxhQGdtYWls
LmNvbT47IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KU3ViamVjdDogUmU6IFtQQVRD
SCAxLzJdIGRybS94ZS9kaXNwbGF5OiBNb3ZlIGRwdCBhbGxvY2F0aW9uIHRvIGhlbHBlcg0KPiBE
ZW4gMjAyNS0wMS0xNCBrbC4gMjA6MjIsIHNrcmV2IENhdml0dCwgSm9uYXRoYW46DQo+ID4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBJbnRlbC14ZSA8aW50ZWwteGUtYm91
bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBKdWhhLVBla2thIEhlaWtr
aWxhDQo+ID4gU2VudDogVHVlc2RheSwgSmFudWFyeSAxNCwgMjAyNSAxMDowNCBBTQ0KPiA+IFRv
OiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPiBDYzogSnVoYS1QZWtrYSBIZWlr
a2lsYSA8anVoYXBla2thLmhlaWtraWxhQGdtYWlsLmNvbT4NCj4gPiBTdWJqZWN0OiBbUEFUQ0gg
MS8yXSBkcm0veGUvZGlzcGxheTogTW92ZSBkcHQgYWxsb2NhdGlvbiB0byBoZWxwZXINCj4gPj4N
Cj4gPj4gU2ltcGxpZnkgX194ZV9waW5fZmJfdm1hX2RwdCgpIGJ5IG1vdmluZyBkcHQgYWxsb2Nh
dGlvbiBpbnRvIGhlbHBlci4NCj4gPj4gVGhpcyBhbHNvIGZpeGVzIGJ1ZyB3aGVyZSBkcHQgY291
bGQgaGF2ZSBiZWVuIGFsbG9jYXRlZCBmcm9tIHN5c3RlbQ0KPiA+PiBtZW1vcnkgd2hlbiBvbiBk
Z2Z4Lg0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBKdWhhLVBla2thIEhlaWtraWxhIDxqdWhh
cGVra2EuaGVpa2tpbGFAZ21haWwuY29tPg0KPiA+PiAtLS0NCj4gPj4gICBkcml2ZXJzL2dwdS9k
cm0veGUvZGlzcGxheS94ZV9mYl9waW4uYyB8IDY3ICsrKysrKysrKysrKysrKysrLS0tLS0tLS0t
DQo+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDQzIGluc2VydGlvbnMoKyksIDI0IGRlbGV0aW9ucygt
KQ0KPiA+Pg0KPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkveGVf
ZmJfcGluLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9mYl9waW4uYw0KPiA+PiBp
bmRleCA5ZmE1MWI4NDczN2MuLmMyODg4NTMxNjk4NiAxMDA2NDQNCj4gPj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3hlL2Rpc3BsYXkveGVfZmJfcGluLmMNCj4gPj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL2Rpc3BsYXkveGVfZmJfcGluLmMNCj4gPj4gQEAgLTc3LDYgKzc3LDQ3IEBAIHdyaXRl
X2RwdF9yZW1hcHBlZChzdHJ1Y3QgeGVfYm8gKmJvLCBzdHJ1Y3QgaW9zeXNfbWFwICptYXAsIHUz
MiAqZHB0X29mcywNCj4gPj4gICAJKmRwdF9vZnMgPSBBTElHTigqZHB0X29mcywgNDA5Nik7DQo+
ID4+ICAgfQ0KPiA+PiAgIA0KPiA+PiArc3RhdGljIHN0cnVjdCB4ZV9ibyAqeGVfYWxsb2NfZHB0
X2JvKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLA0KPiA+PiArCQkJCSAgICAgc3RydWN0IHhlX3RpbGUg
KnRpbGUwLCB1NjQgc2l6ZSwNCj4gPj4gKwkJCQkgICAgIHU2NCBwaHlzaWNhbF9hbGlnbm1lbnQp
DQo+ID4+ICt7DQo+ID4+ICsJc3RydWN0IHhlX2JvICpkcHQ7DQo+ID4+ICsNCj4gPj4gKwkvKg0K
PiA+PiArCSAqIElmIERHRlg6IHRyeSBWUkFNMCBvbmx5DQo+ID4+ICsJICovDQo+ID4+ICsJaWYg
KElTX0RHRlgoeGUpKSB7DQo+ID4+ICsJCWRwdCA9IHhlX2JvX2NyZWF0ZV9waW5fbWFwX2F0X2Fs
aWduZWQoeGUsIHRpbGUwLCBOVUxMLA0KPiA+PiArCQkJCQkJICAgICAgc2l6ZSwgfjB1bGwsDQo+
ID4+ICsJCQkJCQkgICAgICB0dG1fYm9fdHlwZV9rZXJuZWwsDQo+ID4+ICsJCQkJCQkgICAgICBY
RV9CT19GTEFHX1ZSQU0wIHwNCj4gPj4gKwkJCQkJCSAgICAgIFhFX0JPX0ZMQUdfR0dUVCB8DQo+
ID4+ICsJCQkJCQkgICAgICBYRV9CT19GTEFHX1BBR0VUQUJMRSwNCj4gPj4gKwkJCQkJCSAgICAg
IHBoeXNpY2FsX2FsaWdubWVudCk7DQo+ID4+ICsJfSBlbHNlIHsNCj4gPj4gKwkJLyoNCj4gPj4g
KwkJICogRm9yIElHRlg6IGZpcnN0IHRyeSBTVE9MRU4uIG9uIGZhaWwgdHJ5IFNZU1RFTS4NCj4g
Pj4gKwkJICovDQo+ID4+ICsJCWRwdCA9IHhlX2JvX2NyZWF0ZV9waW5fbWFwX2F0X2FsaWduZWQo
eGUsIHRpbGUwLCBOVUxMLA0KPiA+PiArCQkJCQkJICAgICAgc2l6ZSwgfjB1bGwsDQo+ID4+ICsJ
CQkJCQkgICAgICB0dG1fYm9fdHlwZV9rZXJuZWwsDQo+ID4+ICsJCQkJCQkgICAgICBYRV9CT19G
TEFHX1NUT0xFTiB8DQo+ID4+ICsJCQkJCQkgICAgICBYRV9CT19GTEFHX0dHVFQgfA0KPiA+PiAr
CQkJCQkJICAgICAgWEVfQk9fRkxBR19QQUdFVEFCTEUsDQo+ID4+ICsJCQkJCQkgICAgICBwaHlz
aWNhbF9hbGlnbm1lbnQpOw0KPiA+PiArCQlpZiAoSVNfRVJSKGRwdCkpIHsNCj4gPj4gKwkJCWRw
dCA9IHhlX2JvX2NyZWF0ZV9waW5fbWFwX2F0X2FsaWduZWQoeGUsIHRpbGUwLCBOVUxMLA0KPiA+
PiArCQkJCQkJCSAgICAgIHNpemUsIH4wdWxsLA0KPiA+PiArCQkJCQkJCSAgICAgIHR0bV9ib190
eXBlX2tlcm5lbCwNCj4gPj4gKwkJCQkJCQkgICAgICBYRV9CT19GTEFHX1NZU1RFTSB8DQo+ID4+
ICsJCQkJCQkJICAgICAgWEVfQk9fRkxBR19HR1RUIHwNCj4gPj4gKwkJCQkJCQkgICAgICBYRV9C
T19GTEFHX1BBR0VUQUJMRSwNCj4gPj4gKwkJCQkJCQkgICAgICBwaHlzaWNhbF9hbGlnbm1lbnQp
Ow0KPiA+PiArCQl9DQo+ID4+ICsJfQ0KPiA+PiArCXJldHVybiBkcHQ7DQo+ID4gDQo+ID4gV2Ug
bWlnaHQgYmUgYWJsZSB0byBjb2xsYXBzZSBzb21lIG9mIHRoaXMgbG9naWMgYnkgc3RvcmluZyB0
aGUgZmxhZ3Mgc2VwYXJhdGVseToNCj4gPiANCj4gPiAiIiINCj4gPiBzdGF0aWMgc3RydWN0IHhl
X2JvICp4ZV9hbGxvY19kcHRfYm8oc3RydWN0IHhlX2RldmljZSAqeGUsDQo+ID4gCQkJCSAgICAg
c3RydWN0IHhlX3RpbGUgKnRpbGUwLCB1NjQgc2l6ZSwNCj4gPiAJCQkJICAgICB1NjQgcGh5c2lj
YWxfYWxpZ25tZW50KQ0KPiA+IHsNCj4gPiAJc3RydWN0IHhlX2JvICpkcHQ7DQo+ID4gCXUzMiBi
YXNlX2ZsYWdzID0gWEVfQk9fRkxBR19HR1RUIHwgWEVfQk9fRkxBR19QQUdFVEFCTEU7DQo+ID4g
CXUzMiBmbGFncyA9IGJhc2VfZmxhZ3M7DQo+ID4gDQo+ID4gCS8qDQo+ID4gCSAqIElmIERHRlg6
IHRyeSBWUkFNMC4NCj4gPiAJICogSWYgSUdGWDogdHJ5IFNUT0xFTi4NCj4gPiAJICovDQo+ID4g
CWZsYWdzIHw9IElTX0RHRlgoeGUpID8gWEVfQk9fRkxBR19WUkFNMCA6IFhFX0JPX0ZMQUdfU1RP
TEVOOw0KPiA+IA0KPiA+IAlkcHQgPSB4ZV9ib19jcmVhdGVfcGluX21hcF9hdF9hbGlnbmVkKHhl
LCB0aWxlMCwgTlVMTCwgc2l6ZSwNCj4gPiAJCQkJCSAgICAgIH4wdWxsLCB0dG1fYm9fdHlwZV9r
ZXJuZWwsDQo+ID4gCQkJCQkgICAgICBmbGFncywgcGh5c2ljYWxfYWxpZ25tZW50KTsNCj4gPiAN
Cj4gPiAJLyoNCj4gPiAJICogRm9yIElHRlgsIHdlIGZpcnN0IHRyeSBTVE9MRU4sIGFuZCBvbiBh
IGZhaWx1cmUgd2UgdHJ5IFNZU1RFTS4NCj4gPiAJICogREdGWCBzaG91bGQgb25seSBhdHRlbXB0
IFZSQU0wDQo+ID4gCSAqLw0KPiA+IAlpZiAoSVNfREdGWCh4ZSkgJiYgSVNfRVJSKGRwdCkpDQo+
ID4gCQlkcHQgPSB4ZV9ib19jcmVhdGVfcGluX21hcF9hdF9hbGlnbmVkKHhlLCB0aWxlMCwgTlVM
TCwNCj4gPiAJCQkJCQkgICAgICBzaXplLCB+MHVsbCwNCj4gPiAJCQkJCQkgICAgICB0dG1fYm9f
dHlwZV9rZXJuZWwsDQo+ID4gCQkJCQkJICAgICAgYmFzZV9mbGFncyB8DQo+ID4gCQkJCQkJICAg
ICAgWEVfQk9fRkxBR19TWVNURU0sDQo+ID4gCQkJCQkJICAgICAgcGh5c2ljYWxfYWxpZ25tZW50
KTsNCj4gPiAJcmV0dXJuIGRwdDsNCj4gPiB9DQo+ID4gIiIiDQo+ID4gVGhpcyBpc24ndCBhIHBh
cnRpY3VsYXJseSBuZWNlc3NhcnkgY29tcHJlc3Npb24sIGJ1dCBpdCBtaWdodCBiZSB3b3J0aCBj
b25zaWRlcmluZy4NCj4gPiBSZXZpZXdlZC1ieTogSm9uYXRoYW4gQ2F2aXR0IDxqb25hdGhhbi5j
YXZpdHRAaW50ZWwuY29tPkV4Y2VwdCB0aGF0IGZhaWxzIG9uIGJvdGggaW50ZWdyYXRlZCBhbmQg
ZGlzY3JldGUsIGR1ZSB0byBJU19ER0ZYKCkgdXNlZCANCj4gd3JvbmdseSBoZXJlLiA7LSkNCj4g
DQo+IEV2ZXJ5IGNoYW5nZSwgbm8gbWF0dGVyIGhvdyBzbWFsbCwgaGFzIHRoZSBvcHBvcnR1bml0
eSB0byBicmVhayB0aGluZ3MuDQoNCkludGVyZXN0aW5nLiAgRm9yIGZ1dHVyZSByZWZlcmVuY2Us
IG1heSBJIGFzayBob3cgSVNfREdGWCBpcyBiZWluZyB1c2VkIGluY29ycmVjdGx5IGluIHRoZSBh
Ym92ZSBleGFtcGxlPw0KLUpvbmF0aGFuIENhdml0dA0KDQo+IA0KPiBSZWdhcmRsZXNzLCBmb3Ig
Ym90aCBwYXRjaGVzOg0KPiBSZXZpZXdlZC1ieTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4u
bGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4NCj4gDQo+IENoZWVycywNCj4gfk1hYXJ0ZW4NCj4g
DQo=
