Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6870EC2D0CD
	for <intel-xe@archiver.kernel.org>; Mon, 19 May 2025 23:08:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 107B010E40B;
	Mon, 19 May 2025 23:08:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GxVjY1tr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8A0610E40B
 for <intel-xe@lists.freedesktop.org>; Mon, 19 May 2025 23:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747696116; x=1779232116;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=358ajkyptQo2Y0Fs/J21HHHzazZ+Xu62FkLM1VcjCm8=;
 b=GxVjY1trTh3twy6ENDVDnj2oNyPohuq+8/ENrvKexFVXjvGN4oArAZG9
 dxqhWfYmZjkXXVbdc6n7zpPrn4ozYL0fVMn7tqImwRX4jyQmMJ5PavuQb
 gotdjHtNdogTcT4RcDrHTZUWFt+ovhGcxhDnDbJOOa7TFoiib4SrxTFHf
 YQhehgqC2/yfYyAjVa4/Ij0za1zp+GBXuHsbva2tBNrU8U1l2w6aNApkE
 sHF+t4kwoiARhN1BDsU4RClQbroeQcfeeW0z087Pkc8VcWRw4ADrxz8d3
 sqQruptdHqnfimMvb5sp2uSD1IjOBaSMPwf0PpzOIZFM8QQELmNwUwxg0 Q==;
X-CSE-ConnectionGUID: eUfL9UFoR3CRC9B16i869g==
X-CSE-MsgGUID: Eu45AThzSE+1kvekiiySDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49518438"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="49518438"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 16:08:36 -0700
X-CSE-ConnectionGUID: JCSuSsN8R5CZQbyZQiwekw==
X-CSE-MsgGUID: K2NiZFlyRfurf67Bomh5Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="144632333"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 16:08:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 19 May 2025 16:08:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 19 May 2025 16:08:35 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 19 May 2025 16:08:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jjrgwubG5NRdm3DTU2Q2MIvDKTsSreH3XxiTZVB1trKAm4YOhRJW2DuezTrQCKQ3weUbWxuEh/aOd8WNMY4SNKMpO9y1aKHsGF3ATP8N1PNU03dWi6PKBhveXtVQi0BDW2Ed5vBgO/suug90yaepWXGoGiNveuc2UVcwDEOKERft6zdKZ3Y35oMaOVhqqbKJO6Szx2DIiThRDimrHl9efMYmGvixB+ti9LQWZVwshr+FOySrW0wYJNBho3Hf6xCRtnTKjgMsWqvBQ8NGv5EXhZ+bxqG96gp2ZQQe73FJ4eyqw8kPmYH7Ldh6SI7CCdqhGF54anAU/TLPrDkjSA5lsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GdCpXlGc3dBj43+LUCP0jjiGTbj3ehiFn2nBB2YVsQc=;
 b=EzllHSv4MQ804jMHPqxSCE0/t0osdfVEX9XOq/LTYODcKCk2y7mrwHP9reIWHj+6C7KXVHUacoIIVO35LHKHAJsEy3l64rimepp5Df1n1VHES6qgz7WlT4IMNiQjSl1NgoLkDgE2E1zZLtx4msDlwBtHy0DQRa5xrsECY+KYjwprjp7Mzfjn+K4qXduUHgDc1/s+dCUVzJHOP4L4RmdOjAeyvN+VFUkUxFGWY0trNdXP9cvd7IIabe6cHaxrLEwlckiOJFX5+4gwzCgA0KUVeDFxQUkhQCt2J42jp1KbeTnlx7i4D6gB2jRlycbWmGugVdDXIY9y8dU2zBvMXNOWtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 by SA3PR11MB7609.namprd11.prod.outlook.com (2603:10b6:806:319::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 23:07:52 +0000
Received: from MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2]) by MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2%6]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 23:07:52 +0000
Message-ID: <0e183817-4d28-4737-a02d-2cc626bb430a@intel.com>
Date: Tue, 20 May 2025 01:07:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] drm/xe/vf: Pause submissions during RESFIX fixups
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250515221827.1493032-1-tomasz.lis@intel.com>
 <20250515221827.1493032-4-tomasz.lis@intel.com>
 <67aa9b71-53d2-49cc-8c23-c2b496e7c08d@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <67aa9b71-53d2-49cc-8c23-c2b496e7c08d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR02CA0073.eurprd02.prod.outlook.com
 (2603:10a6:802:14::44) To MW4PR11MB6714.namprd11.prod.outlook.com
 (2603:10b6:303:20f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6714:EE_|SA3PR11MB7609:EE_
X-MS-Office365-Filtering-Correlation-Id: 58df0457-1ed1-48e8-0890-08dd9729fb54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YWVCTFBudDBnUmtGVXVFeTlXdVYwdStrVEhpMlJUaFdkOXNOcFJsTjYzenl6?=
 =?utf-8?B?Y0s1Mkd3ZmpOOE5WQWVzY3Y3dHJKQVN2TFNQRkI2ZWJpR3ZWU3VDekpOeGhj?=
 =?utf-8?B?OUtPNGxNUFF4Z1d1QmRERmM5dE81bUgwZjJha0svYmYvVkw1V0YzdFVRT0w1?=
 =?utf-8?B?cC9wa1dRVVlSTmhjeEY2QVNObGJydThSdzBVbnBoSkVEdG9Iam9nYnNYcFcy?=
 =?utf-8?B?Witpblk0R3poWTVXc1hiZEVhaWRMQ01EQXlNaHowWXVjcFRvNHBnT2ZnT0Nt?=
 =?utf-8?B?dmV5UUhMZjMyQkdheU5TaWYwZi9MbWx5bEJVdi8vdVFqMC9EekpXUDRFT3ky?=
 =?utf-8?B?YlYyamU4dkllaHliQ0lBeE1BRXJtUEpNYlduWCt3N1E1UC9XQVUvZWk4WHFD?=
 =?utf-8?B?WVk0bHY4ZEZheDR1NXBhZm1BZFdLVU1GaHp5SDZETlp3VTZ0YjlFUXFZcmVT?=
 =?utf-8?B?T2NnYVRTZkY5VmlnTU1CS1hmbkMyOU9VR0VIVU9nNUN4Tm4vR2dJbHVjYjI4?=
 =?utf-8?B?QUpTbGtnSGN5aXBveDY3dEwyQzZVWmJVc1Z6ZVdkWG9ldTlsNWlKYUFuUlJm?=
 =?utf-8?B?R211b2RldTVGcFRWVXZZd21LZkVlQ0pCNkJjUWNzK1hVM3hCWXRXdFEybS9i?=
 =?utf-8?B?dDJOUUVaSnE3TjUxbThBVWpLRmNhOWJUbENWcXdSVEZ1cUVGbVdwcDA5WkJC?=
 =?utf-8?B?d29yakIrTjB1VU01eHFTcEZhRzhUZlpPSDg1UlVxalZ0MjZCdVVZK3c0KzhB?=
 =?utf-8?B?QzBUOXd1WXRiS3ZBVzhoNGVjYmlaYStxaVhzamgwcys3TWVMVTNJbkFhcmc1?=
 =?utf-8?B?VmdEWFcxQlhMNSsyYVFOQlZ5bEFRM1JuZGFIUis3M0xHYmZvOURwWHdLT0p6?=
 =?utf-8?B?clBGWnN4SGVvOVJHVnZaNHlsTTRJWjZIRGhYSThVR1J3WWh5TVZXZ3ZManda?=
 =?utf-8?B?N29NZk0ySkxNWUVoTnUyRmNGVGZieTJVTmhIdHFZTG5UblgwK2V5blZzeEJF?=
 =?utf-8?B?dGZFa1UzZ0RCVzhTZVo4UFVyOUV1M3JTS20yblBLYTl0ZHRjVGl3emdKNndv?=
 =?utf-8?B?UDFXYUJ4SmJwU0NIdXVaMUJmV2xZNUN2dHBBd1hJb2J5T1owNWtsTWRxbXlw?=
 =?utf-8?B?bndXdFZvYWR3RjB1SS9sbzRUcUNUdlhxbVlrU0NkL0RERDgyTHVpNnY1L1Bm?=
 =?utf-8?B?ZmtSL29yVC8veDdvU1R2VDd2Y2RnS3pSWWlFVWNkcXVId3hGV2NsMUYvYVAz?=
 =?utf-8?B?VUJkTTdrdjloUGg2a2YwTzFqUjJwOU1wV3Q2MTFnWU5Ua0NnMkNhWUp4TmNp?=
 =?utf-8?B?MHR4bFp3dzdHNEIyUG93dUFNVnZleHAvRGlQQXJhOUp4blpaK1hxUUQwTGs1?=
 =?utf-8?B?b3lRNVBoYU1adHNQZG0zZEo0MFdHeWhRVUxBTUdsa3M0RGJ6THN2cnIybmlw?=
 =?utf-8?B?OC9EaUM4MUtBSGFBWWN6dllTL0ZNdzZMYmsyNGdQNXlQQ1gyZDNwcWpiS3Uv?=
 =?utf-8?B?Y1loejAybTNqN1ROUzJIUEFDTkExK2w1bVZpRFZjSVB6bUsydVg3YXZpOHRY?=
 =?utf-8?B?bVBVZC9RRWc0NFo1YkxnV1VpTEFYT3IwclR1Si9kWklyWWM2b2I5c1EzbCtv?=
 =?utf-8?B?ZFVEaGxnNTVaclNtOS9FcmZyVW8xTktiQjNibUpLQUw3dnJHN21OVVlNUktU?=
 =?utf-8?B?akl4SHI3WW80Qy81ZC9GWlZ4WTA1MEZrb2RKQ0Zvb3JzVEMyT1ZkOUczRVRl?=
 =?utf-8?B?ei91RjdXMHNiMktGTmF5SDRKZWFiTy9wUEpGK25LZ2dXam5nVWFWMkE3VzdD?=
 =?utf-8?B?L0NpOE5WWDNSTnYrcE53YmltL1Mxd254bFlGNnFMM3RPV0h2TU5nMTRma3Q0?=
 =?utf-8?B?Z3RpU2lsSlpUeTFqUXVIdisra3BTN2UwQ2IwYkVIVlhmb08zREhvYitBd2c1?=
 =?utf-8?Q?D3RPe4YokyU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6714.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGhDcEVxTXoxZVE2RjFuNFNZdEp0bi96WEc2NnhYQlBGNTljSE4vb3lvMUZ0?=
 =?utf-8?B?UzQ0UkVkSUx3cnJiS3FUMTlWcERNUTZBRmlHMFhuQmw1RGdSTmUvT2lVcnFw?=
 =?utf-8?B?dUxML1J0ZWphUlljdWZud0RhSmZSZEU3cDBnc0czUUtHbmJLMllwZkZ3VUMx?=
 =?utf-8?B?eDUwckNUMWhHTE1xeXRFYTM0OXpueWZJMjMwV0kvQmhaU2F1Q1B2Vm1iZitK?=
 =?utf-8?B?VkVwZGowR1plamFLc0c5NTFyMllScE9XNFg1Q3JhWkttOVljVHBLVjFWM1My?=
 =?utf-8?B?M2xqNGdQK1VHRXZpZXNqUC8xUFoxZ1BsakhOdHBBSlplN2dsaWhWUkY0K2xN?=
 =?utf-8?B?L2UvZ3ZpcStoYVo2VFZ3MzQ2VnBPM1hKWFh5a1gyNWdIMUl5cExQQ2dnYzVl?=
 =?utf-8?B?UWhadnkxTUlHMTh4SnhKZmtTWFNsQU4rNUJ2ZW1SeDZzYiszYXIyTVNLMEE0?=
 =?utf-8?B?TFhIVUZOeUJ6VSs1eXVwdnVzQkNlZXh1VzUyRFlsMmZSOXdEeWFFYXVUZWdY?=
 =?utf-8?B?OW9ZRFovWSs2V1BiR01KdjAyTUlLdWszUkJ0bDNuaHJUbTZyTElzYW9xWFJ2?=
 =?utf-8?B?Vi9CTVkxMFVFS2srZjdIcDFhV3JpMlk0bjdJZFBMMTBnYWdaOCtCOVB6T1Ez?=
 =?utf-8?B?U3ZVQjdnWU9pUmNUQXNKYU84YjlCbHgxNXl6WDdQS0dLWmJKbkRLNjB5NmVP?=
 =?utf-8?B?bllQUDZXSWFXYkp2V3V6LzZZLzdSbTByRmVxR2RFS3M0ckE5Q2c1eFJ4MVpw?=
 =?utf-8?B?M1drV3A5eUk0ZTZSczdzQkltTEFGVkd5MEM2N2dSaHR2SnMyUUhYdGZYeUZ1?=
 =?utf-8?B?Ly9NdUhnbmFoR1NJbjlOUkFickhWSHRTRzl3bmNYeUFJcXBXWDFoMExMY2k0?=
 =?utf-8?B?M25OZFdLNEJwelBUcWdDOHlMWGE1b3VRSVVuTFBJOTJaRkNJVWJBcE5qaEhs?=
 =?utf-8?B?c1oyc3ZXYStTeno1NmxMbjB1azBTUGdTaUhoNkNnNlh5VktQM2hETGU4UUtu?=
 =?utf-8?B?MitxalZqL2x3S2loS0NaUWRaaStzQnROMVhBUEZyZ1RFR0hRNVowaG8vY3d5?=
 =?utf-8?B?eEd2cU5LdEIrWXd1Y3ZaT0ljNEtBUXZ3TWN1Um5BSlFnamcrM2RLaWpkOWRL?=
 =?utf-8?B?NUplQjRCNjR3ekZJV3lRcmMrUFdoRSt0U3pUUHRpNFZBOWloc1RoNHZGald0?=
 =?utf-8?B?TXg3NmNkSm9HWE1XNjNhWWtWV1ZwWkVZS280TmwzRWxoUUpLZ0Y0MkJ5RDFy?=
 =?utf-8?B?enY0bGV6VndKN01MckFUNTdDVDhBUWo3aUhYekl4aXVyNHBEeXk4anpzWGUv?=
 =?utf-8?B?VjZRK3NOdUVQQmxwTTd0dGZ5SnJGWUNtbnVubkZ3UGhxNGxGZXBkY214UmRP?=
 =?utf-8?B?ZTRWRkxSVDVQQmNpek5UODFFNkZ6bFBHUGNFSVkxYVJJUEpGN3p2KzBiMWxj?=
 =?utf-8?B?U2hPSmU1M1pNM1UyYkZvS0RZa1ZSSms4bXJZWjI2bTE1MHpmZTI3N3Fja0hQ?=
 =?utf-8?B?RElhKy9yN2Vxa0JrUjlQa1Y5blNwRXRNSkl1MENpYUI5L2tSd3dmVHhTVDdv?=
 =?utf-8?B?bEMvK1lQZ2dnUlNxK2s0Y2R5eGgxZkRTbWtqSjhSQUg1OXZnTHJLU2JMOUJB?=
 =?utf-8?B?YmZYN094MytZY3VEY011UFF6cThxbHhzNnRLVElWaklreitLWFlQQnFzNXZO?=
 =?utf-8?B?SFl6ankvTExUcU9QRFJxSEptUlBzNGtHZEpEUVBzb1hrbXZoYkhWWW9xckpL?=
 =?utf-8?B?TmdmRm91TW54UEcrNGFGT1g2cVpNYnRndzdTZG9lcHh4VFJQSGtheHdhZkFi?=
 =?utf-8?B?RmRsMEV2UnlFaEk0ZkxTaElvLzlOVFl1bUdCMVV1dENZK0ExQUhtdnNsR1No?=
 =?utf-8?B?U2VNbzU3ZmFuczlZOEtxdElCdHZCR2VJT0NYeXZ1dUQ5WlpKdGJzNTJrTXNh?=
 =?utf-8?B?K3cwdklKbzRFZUZ2UmpyRG9rVVFXcnRqRngrQnE3OGFyRFNwY1FCdDBCU2tz?=
 =?utf-8?B?M1ZCNEw3M09ORmZTQytBL1g4SytZcUNabHAxcmcyWTdET2RhZ21sa1doR0Ra?=
 =?utf-8?B?UGx4ekxmSWxIdEhJYVpTemM4WTJjWG1QSUtBeTN1ZlVZdmJlZ0g3NVcyWHYz?=
 =?utf-8?Q?8hzVDhAgjeebQTPK2r1EvB5s6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 58df0457-1ed1-48e8-0890-08dd9729fb54
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6714.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 23:07:52.6712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z4RvQcystK1jY7I3xLd3g2vCSnBOWGR5FahxOKDn3YQBwvKpdYgZElAMWZKx6kiIuhw2IHSgygNCHy2BOA2TCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7609
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


On 16.05.2025 19:30, Michal Wajdeczko wrote:
>
> On 16.05.2025 00:18, Tomasz Lis wrote:
>> While applying post-migration fixups to VF, GuC will not respond
>> to any commands. This means submissions have no way of finishing.
>>
>> To avoid acquiring additional resources and then stalling
>> on hardware access, pause the submission work. This will
>> decrease the chance of depleting resources, and speed up
>> the recovery.
>>
>> v2: Commented xe_irq_resume() call
>>
>> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gpu_scheduler.c | 13 +++++++++
>>   drivers/gpu/drm/xe/xe_gpu_scheduler.h |  1 +
>>   drivers/gpu/drm/xe/xe_guc_submit.c    | 35 ++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_submit.h    |  2 ++
>>   drivers/gpu/drm/xe/xe_sriov_vf.c      | 42 +++++++++++++++++++++++++++
>>   5 files changed, 93 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
>> index 869b43a4151d..455ccaf17314 100644
>> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
>> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
>> @@ -101,6 +101,19 @@ void xe_sched_submission_stop(struct xe_gpu_scheduler *sched)
>>   	cancel_work_sync(&sched->work_process_msg);
>>   }
>>   
>> +/**
>> + * xe_sched_submission_stop_async - Stop further runs of submission tasks on a scheduler.
>> + * @sched: the &xe_gpu_scheduler struct instance
>> + *
>> + * This call disables further runs of scheduling work queue. It does not wait
>> + * for any in-progress runs to finish, only makes sure no further runs happen
>> + * afterwards.
>> + */
>> +void xe_sched_submission_stop_async(struct xe_gpu_scheduler *sched)
>> +{
>> +	drm_sched_wqueue_stop(&sched->base);
>> +}
>> +
>>   void xe_sched_submission_resume_tdr(struct xe_gpu_scheduler *sched)
>>   {
>>   	drm_sched_resume_timeout(&sched->base, sched->base.timeout);
>> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
>> index c250ea773491..d78b4e8203f9 100644
>> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
>> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
>> @@ -21,6 +21,7 @@ void xe_sched_fini(struct xe_gpu_scheduler *sched);
>>   
>>   void xe_sched_submission_start(struct xe_gpu_scheduler *sched);
>>   void xe_sched_submission_stop(struct xe_gpu_scheduler *sched);
>> +void xe_sched_submission_stop_async(struct xe_gpu_scheduler *sched);
>>   
>>   void xe_sched_submission_resume_tdr(struct xe_gpu_scheduler *sched);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 80f748baad3f..6f280333de13 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -1811,6 +1811,19 @@ void xe_guc_submit_stop(struct xe_guc *guc)
>>   
>>   }
>>   
>> +/**
>> + * xe_guc_submit_pause - Stop further runs of submission tasks on given GuC.
>> + * @guc: the &xe_guc struct instance whose scheduler is to be disabled
>> + */
>> +void xe_guc_submit_pause(struct xe_guc *guc)
>> +{
>> +	struct xe_exec_queue *q;
>> +	unsigned long index;
>> +
>> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
>> +		xe_sched_submission_stop_async(&q->guc->sched);
>> +}
>> +
>>   static void guc_exec_queue_start(struct xe_exec_queue *q)
>>   {
>>   	struct xe_gpu_scheduler *sched = &q->guc->sched;
>> @@ -1851,6 +1864,28 @@ int xe_guc_submit_start(struct xe_guc *guc)
>>   	return 0;
>>   }
>>   
>> +static void guc_exec_queue_unpause(struct xe_exec_queue *q)
>> +{
>> +	struct xe_gpu_scheduler *sched = &q->guc->sched;
>> +
>> +	xe_sched_submission_start(sched);
>> +}
>> +
>> +/**
>> + * xe_guc_submit_unpause - Allow further runs of submission tasks on given GuC.
>> + * @guc: the &xe_guc struct instance whose scheduler is to be enabled
>> + */
>> +void xe_guc_submit_unpause(struct xe_guc *guc)
>> +{
>> +	struct xe_exec_queue *q;
>> +	unsigned long index;
>> +
>> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
>> +		guc_exec_queue_unpause(q);
>> +
>> +	wake_up_all(&guc->ct.wq);
>> +}
>> +
>>   static struct xe_exec_queue *
>>   g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
>> index 9b71a986c6ca..f1cf271492ae 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
>> @@ -18,6 +18,8 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc);
>>   void xe_guc_submit_reset_wait(struct xe_guc *guc);
>>   void xe_guc_submit_stop(struct xe_guc *guc);
>>   int xe_guc_submit_start(struct xe_guc *guc);
>> +void xe_guc_submit_pause(struct xe_guc *guc);
>> +void xe_guc_submit_unpause(struct xe_guc *guc);
>>   void xe_guc_submit_wedge(struct xe_guc *guc);
>>   
>>   int xe_guc_read_stopped(struct xe_guc *guc);
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> index 099a395fbf59..f0d6abedd126 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> @@ -11,6 +11,8 @@
>>   #include "xe_gt_sriov_printk.h"
>>   #include "xe_gt_sriov_vf.h"
>>   #include "xe_guc_ct.h"
>> +#include "xe_guc_submit.h"
>> +#include "xe_irq.h"
>>   #include "xe_pm.h"
>>   #include "xe_sriov.h"
>>   #include "xe_sriov_printk.h"
>> @@ -134,6 +136,44 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
>>   	INIT_WORK(&xe->sriov.vf.migration.worker, migration_worker_func);
>>   }
>>   
>> +/**
>> + * vf_post_migration_shutdown - Stop the driver activities after VF migration.
>> + * @xe: the &xe_device struct instance
>> + *
>> + * After this VM is migrated and assigned to a new VF, it is running on a new
>> + * hardware, and therefore many hardware-dependent states and related structures
>> + * require fixups. Without fixups, the hardware cannot do any work, and therefore
>> + * all GPU pipelines are stalled.
>> + * Stop some of kernel acivities to make the fixup process faster.
> typo acivities
ack
>> + */
>> +static void vf_post_migration_shutdown(struct xe_device *xe)
>> +{
>> +	struct xe_gt *gt;
>> +	unsigned int id;
>> +
>> +	for_each_gt(gt, xe, id)
>> +		xe_guc_submit_pause(&gt->uc.guc);
>> +}
>> +
>> +/**
>> + * vf_post_migration_kickstart - Re-start the driver activities under new hardware.
>> + * @xe: the &xe_device struct instance
>> + *
>> + * After we have finished with all post-migration fixups, restart the driver
>> + * activities to continue feeding the GPU with workloads.
>> + */
>> +static void vf_post_migration_kickstart(struct xe_device *xe)
>> +{
>> +	struct xe_gt *gt;
>> +	unsigned int id;
>> +
>> +	/* make sure interrupts on the new HW are properly set */
>> +	xe_irq_resume(xe);
> hmm, it still looks unbalanced when compared to shutdown
> don't we need xe_irq_suspend() there?
No, the idea is not to stop interrupts on shutdown. We shouldn't receive 
any as it's new hardware, so disabling it would bring no change. And in 
that corner scenario where GuC is running and we could receive them, 
it's better if they are handled - actual work is done outside of IRQs 
anyway, and these should be blocked. As an example, no IRQs would mean 
we get information about a 2nd migration only after recovery of the 1st 
is done. But the first will fail if GGTT range changed again - that's 
why we have the "defer" mechanism.
> also IIRC the whole recovery starts due to a MIGRATED IRQ event, so
> interrupts had to be already working, no?

The GuC IRQ had to work. For the rest - they probably do as well, but..

There's a reason we have a very specific IRQ support routine in bspec. 
The restore process should've restored both MMIO and MEMIRQ areas 
configuring interrupts, but it did that through blitting, which is not 
what the procedure says. In the past, we did had issues with IRQ state  
- while we fixed it by adding such re-enable (and a 2nd re-enable on PF 
side) before we even had MEMIRQ support, it's possible we'd run into 
issues with MEMIRQ as well.

So, for MMIO interrupts (which we never actually use for VFs on Xe) this 
is proven to be required. For MEMIRQs, it's not proven, but it' a matter 
of adhering to sequences given to us by HW teams.

>> +
>> +	for_each_gt(gt, xe, id)
>> +		xe_guc_submit_unpause(&gt->uc.guc);
>> +}
>> +
>>   /**
>>    * xe_sriov_vf_post_migration_reset_guc_state - Reset VF state in all GuCs.
>>    * @xe: the &xe_device struct instance
>> @@ -247,6 +287,7 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>>   
>>   	drm_dbg(&xe->drm, "migration recovery in progress\n");
>>   	xe_pm_runtime_get(xe);
>> +	vf_post_migration_shutdown(xe);
>>   	err = vf_post_migration_requery_guc(xe);
>>   	if (vf_post_migration_imminent(xe))
>>   		goto defer;
>> @@ -258,6 +299,7 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>>   	if (need_fixups)
>>   		vf_post_migration_fixup_ctb(xe);
>>   
>> +	vf_post_migration_kickstart(xe);
> since above call will, as you said in comment above, start "feeding the
> GPU with workloads", shouldn't we do this step _after_ confirming RESFIX
> below and thus truly unblocking the VF submission on the GuC side?

What is the benefit of the reordered code over this one?

We start feeding the GuC with new data before it starts to consume it, 
yes. But the only restriction we have is for these to be close enough to 
not influence timeouts.

Will the reordered code run faster? I don't think so, the difference is 
non-measurable. Will it better handle some scenario? I can't say I see 
any. Low resources, maybe?

On the other side, if interrupts are not fully working, or anything else 
is not ready, then sending the resfix_done requires additional prepare 
function. The kickstart is a good candidate to place any such code.

-Tomasz

>>   	vf_post_migration_notify_resfix_done(xe);
>>   	xe_pm_runtime_put(xe);
>>   	drm_notice(&xe->drm, "migration recovery ended\n");
