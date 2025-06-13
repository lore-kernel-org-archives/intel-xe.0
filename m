Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB04DC71148
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 14:15:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FCE710E9DA;
	Fri, 13 Jun 2025 14:15:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FrbldOoE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB5A510E9E6
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 14:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749824121; x=1781360121;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=nIBlBne7AzPpKohmWpdEVYi2JeM310uHPRk7vMhDh3k=;
 b=FrbldOoEb7yVSYS2aFSGlWKrTHoWnS4ixBepDNMtxeXeefxdDte6n9QH
 kKx6qCm1J9kDKZw2oX/jkcbRf4bmZ8hQ3q9mmPJ80YA6O9Yby+e84rbBv
 fi1HRnEK87E3ITQ08+iyyExlLhVSSpfvhtBiSCRu74SBOdWfa81r6pcnJ
 JD+loukey09aHN6pIS7p1/EdVWrfUblWBHyQ+3R1GKQVvCh9QHJIlzYxi
 lbNwNd2ryZHrmPv6x/fF1eYIdGkhyWZLNykWCtxMKMZRk7CC0fhnfM7Ew
 7CaEcmy0Kq1J38Lod3Or6DHx2qiX+6oJat8BfLV1g7vaGsE7ZxG/9uhZb Q==;
X-CSE-ConnectionGUID: cx1QYmU0S5SFFEaj9LOUhA==
X-CSE-MsgGUID: 70AfzQcET4y/de9NpLJLxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="69619452"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="69619452"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 07:15:20 -0700
X-CSE-ConnectionGUID: PVFdcdwPTb2M4S+RFy+L4A==
X-CSE-MsgGUID: zaz7arpbRZe7ICP4r+wsVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="147678478"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 07:15:20 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 07:15:19 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 13 Jun 2025 07:15:19 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.48)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 07:15:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ms8fKcnveigEPOCOFajGzzDd5NhIoGbRxGTWtUFD0E3WO+jbxoV+vV7s13GuoLjrYUOfGCoQDUvEv6SaHZ9rYLdHpm4XyWU4+VXmVuYbrIgoucXZ6tya0AIv/gcZ6nXFxHpvXMljri7D6TLhgj9e+W+rIhZtpzs0b6hpmUVoVX8fjXlRrqLKqqEZ+BPMGD9afEasXqxuK7hsMLq1S4dKiKm3a1BH6jrK/YLVZRHYBByUmlBlbEsz46XigB9AU+Xq+BR0BRNNNn6D0fYhxy/IxarwLXki6DN37F/9hnvIwreNYf7qwLYn/Dw0Vzsu2f04kNvYYJ/ihvUDtrgh4388BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nIBlBne7AzPpKohmWpdEVYi2JeM310uHPRk7vMhDh3k=;
 b=Iaaosg5gchtf2T2hKdRkohfdkLUWCuDD1t3mEBTjzVLi0eX+ZkQfAwdX64KdSW/Dl8O0e6nUHG4tSKIzrCwfGwImIV8RoxQMGG84oxL9jXm+bhwYi+rRYAOF4SODncIhjZF/7XbUJRJTJ01JlfmvZy1VRhUr52/CzOvzWIP/RUwwJIdQAzPtNqBR1Qb+Mf8TQkqV+ZETDgxrXWGhHVZRSw+rg/AEEYzvU/hbZfNem6ENJA/KgSw8TJYsxmXRiKnyIl/zDUd9/TpJB30EIaFqTOU7W6SZZOwH2cAdrgU6mtPgnSWBI//QFeuDtL71eEu61j51vXHgfu200wPcJQfgUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SJ0PR11MB4829.namprd11.prod.outlook.com (2603:10b6:a03:2d3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.22; Fri, 13 Jun
 2025 14:15:01 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%4]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 14:15:01 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 02/20] drm/xe/uapi: Add madvise interface
Thread-Topic: [PATCH v4 02/20] drm/xe/uapi: Add madvise interface
Thread-Index: AQHb3F7mRzz29DVhkECzl111mHFLZLQBIlmA
Date: Fri, 13 Jun 2025 14:15:01 +0000
Message-ID: <475a218cec59fa37ad493849cda53148868af4a8.camel@intel.com>
References: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
 <20250613125558.2607665-3-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250613125558.2607665-3-himal.prasad.ghimiray@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SJ0PR11MB4829:EE_
x-ms-office365-filtering-correlation-id: 561ff50a-ae3f-4be2-88ee-08ddaa84afa7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QjNTc0M2R3h5SW41MnZ5VzhCa1UwVDFBcjBzZFZsb2xHdkdSdU1iMkZuVzg2?=
 =?utf-8?B?SXBQU2pJQXhPa0V5NlgvSjZFbU84R0hIZkNFMVRHOXZzanhyOTRLVjdVZktr?=
 =?utf-8?B?ZEdNODFtdit1MWE2WU9XZ1lpcCs1ZE9NUnc2RzJZU1kzTTl5MHk0d2xFRCty?=
 =?utf-8?B?YkJXb3pEL0Y0N0M0WVc5SVNnVGJ2cm1aMzlRYzRiSlBtVW9RWTAvb0xUdnpo?=
 =?utf-8?B?dWVnOGg1bG9jUHk0RDhrWmN5Vzd4dlNwWVdxOHJhTmxtaEQwaGMrR1M0dEwy?=
 =?utf-8?B?bGN3QU5FK2tBRldqTzhOdEN4bWxBbDhMbjVkaDM0RzJBL0xldVd6UzJwKzBM?=
 =?utf-8?B?Szl4RnZraUx4aWo2RVp5VTJ5NUZwdzRYbjRDaEZ1Y2QxZFBWSDRlWHMzNWFB?=
 =?utf-8?B?NzJWa2tmZkdHZ0Rja1EwY3FPZVplV2dTcTR6V2tZSzFDS3hobmJpYWw2c0pM?=
 =?utf-8?B?UVV2OGFJVXdWTlh5ODRyUDVxMTV6U3JmY0ZneDJnVG1RYVdFN1VUb1NFTHRO?=
 =?utf-8?B?U2RaRzN5a09ZUXlObllPdVd6VU1WSFUzQm5VOWdGUUZ5ci95QXVlMnRicTd2?=
 =?utf-8?B?UXRFa2hrc0R4R0hCQXdneGY3aEVRZDgrZ3M1U3VnZ0p5WHVtOE0zc0lqWlBD?=
 =?utf-8?B?Y3UzMkhWZTAxK3p5M05wNW90dWQ0V2szNDJmOG4reHRxczRKVUZPcThrakRK?=
 =?utf-8?B?WFYvWDEyN3poaUI1OWdWWEp4aEd3SFlpUkxrNzZ1V2NEZEorcVR5NWxJQ2Er?=
 =?utf-8?B?aUlhL1ZFQ3lXa1FnV0hIc1VVWlYzR240SEFTbmdUaEVtZDNBR3FzYitScHZK?=
 =?utf-8?B?RUNxMmxnNmRuZFVDMEFFUHMrbjJQSUpqV0VhS0dQZzJuZjR3Vkwra2IyRHp0?=
 =?utf-8?B?eG12Q3dBTGxmOTFsTmdIN2ExZ0txYi9sZUdkOEVxYWZNdnpocUZNVjdHdDFO?=
 =?utf-8?B?ZzBqWjJhVHh3SUxrSW1MSVV0dXFpTkNLQzVnNWhGbDBxQ0ZDQjQyM0IzZElk?=
 =?utf-8?B?RHN1UEFNdTJlYlVmSmlWT3pCZmJuSDhTSjNQcmplSndjNXhmTHNmUUJ2SkJ2?=
 =?utf-8?B?V0FiU3NFVU54bGRPbE5MMHI2TnFsM1BTR2h6VzZlSVVjNUk2WWhNM2doYklT?=
 =?utf-8?B?WXcrRENXeFZSOEFKblk3RG4zb3BtclF6eG5iYkZVeVFrRnZnM0Jha2ZVS3I2?=
 =?utf-8?B?cXhLeFpGejhacWVCcldtSDhOaDBwOTZyM08xMnc4blRvV3lxVEhHOWoraW13?=
 =?utf-8?B?c0xKQTVmV09GWXlYbHdZdlRoQjhxOUlhazd0VUpYT0pKOUY4SEh0ZlJNVklm?=
 =?utf-8?B?UktZL1M2MkU2eFdVSFd3ek5uRjViSU45Z0oyZURUaEFWenRob09zSGxCVSs0?=
 =?utf-8?B?aXNwRXpIdjNOZVZGYUZOT1ZRSVVjUXBZSllIbUtSb3ZMK2ZoSEEwaW9Ra1ND?=
 =?utf-8?B?bDdaajBNOXFKTzJ2QkdKSldSSUJUdXVyNFhsRWpQeHZjMGhDUythdlRhY2FK?=
 =?utf-8?B?Q3RNeU1mekRSWEN0ekJRcjR2NTRTZVkrb2crWjNUZWpYVkc3RGNldUZ5SnRK?=
 =?utf-8?B?cEtXeFZKMVM5SlFVMWF3aTNXU3ZacnFLWWYwVXJTN3BPSGw1WnFkb05GeU45?=
 =?utf-8?B?UDBpYm1PeWxnUmJ2bTRiVHVNNnRnd3VrTlQwV00wMGlTK2diRXVqWnN2aW5Z?=
 =?utf-8?B?bFBUSVQ1dXA3c3Z3QnphU0d1RGJERWY0c042cEhtdmJ0N0hBN0RqcklndmFt?=
 =?utf-8?B?NE5xTURhVVEya2ZzOTNlM1Bua3djZXdSYzk2YlhLenErNlREejJRNjY3eVJ6?=
 =?utf-8?B?cmxPUGZQK20vYXh2eU5JUHNGbHNjZkwxK0VIdkFsUVRZdVRycmkzMEpJSHlZ?=
 =?utf-8?B?RVhvQ2VTOE9nMEh3Ykl0RW5kZUxZRXNIVWE1MjFVNnpXMWhTU0dua25pdjhE?=
 =?utf-8?B?NU1FUWVod1FTb3MxVEQxbWVPbTdBdUpxSTVBUjJoNkRGcFlyeTBMVzFnZURX?=
 =?utf-8?B?K3ZiQVdwQ3ZBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WEZaUkxyUm1LREdsVk5jeE1LU2hYVHJIbGdtVkx1eHN4MUZhT3FpZzJ5ZVFX?=
 =?utf-8?B?aFdkdFhNOTVFbmpGczZrd0JsMStHampCWXJaOEhYK1E0by92SC9RZ0NpNWpt?=
 =?utf-8?B?QjdUVDlsWGhIUm81N1BLSXEzMGVWaThFREVFTlJ2aVN6YWxxY05jbkczNHh2?=
 =?utf-8?B?WFB4WTRBVEVBVHFKSkVYODNweUV2RDVJK3BDYkpYZHpJdVE4c0I3SklFN1ZM?=
 =?utf-8?B?dnYvQ3A2dzhEczNLYVE4Ni8reWsyVGZxTnovOVVITmxQWS9pUi9OaEpnQlNH?=
 =?utf-8?B?eDh6ei9TZWRqUjQ0eWVHVGhGQVhzZ3A1c3J6SkRkaXpYSWw4b01NWXhWT2dF?=
 =?utf-8?B?Rk0wMGlodngvSkZXUjlOTzhDelphdGdHdDVUbnprbHVlaEF1NVNEcEtySnNs?=
 =?utf-8?B?MCt5TXhxU0NPTEtTMWg1NTNCRjVnOHUxQzdybjZ1T1lzZzd0ZlpCOVArZHRJ?=
 =?utf-8?B?VVlWU2ZEOFFCUDY1RHpWa3RUUlI2K2FEZlpGSlhwQ1lNV3hXQkt6TDdMbldi?=
 =?utf-8?B?WlUrSDJYS2NrRTJnNnRqaWRuL0dyTVNFK2orVWlVcEZ2c1owT3haR2Q4dzNY?=
 =?utf-8?B?VEkyTUxIVVU4MHlwcHJYcHBMb3BERXlZcWI5MVdqVDBWUUJIM1Q1NzNiU2Ry?=
 =?utf-8?B?UDVpc0l6TU9hWjdYcUpVSi9FeWZaWGZjNWFmWHRtanRUVENTa3kvaUF5NmFj?=
 =?utf-8?B?Tnh3Ukloekx0Q1ZYbVJVSEF6cDBIaDVUUzl2K2NRckpteDBhZnRWbVJ0MmZo?=
 =?utf-8?B?NDY3dUxRajc3ZGdKdnFmeTdKdFZtaVJDY2prR2t0L2tyRXFJNDZJSFJEdlBn?=
 =?utf-8?B?dDN6UDc3ZzNHN21JNXRXRkhjYStvYlM2RmcyTU12QmIzZ2hQODJ5eGFnMWlV?=
 =?utf-8?B?VWk3VjFRU0lwRTBYdkV2cy9Qekhab0xqekZaRkRtSDE0My8zdytWWmg1NllP?=
 =?utf-8?B?dm5ZaUwxOHpITzhFK3RXS21JcmR4SWFhMWk5Qm5qLy9wV2pBMldRRnlzNGli?=
 =?utf-8?B?ZTNhKy9ZLzBKU1BTNlkzRld2YjFDTURQaGFGYlFoVURzaXBWSmVvaSszRTkw?=
 =?utf-8?B?YnBtclFYWkJPODJUMW4vRmkyRXdWZEFRTEM3a2RJYnQ2YXYzNzdPZ3BhY2pT?=
 =?utf-8?B?ZlRmNUJyTUU4eGhwN2FjbzA2NlR6NmNseUVrK3ozSnAzSERJTVYyT3dVSTZJ?=
 =?utf-8?B?K1BsYW1NcnFvNCtlUU5XYXAySklVK2Q4T1d2OVJ1UjNMWUltVEZneVU2K1Bn?=
 =?utf-8?B?eFVGVWh1akZjNjZPWGRiT2RNNzdUNnhvZUlNU3RlWGVOOCtuMWo2VEFWUlBP?=
 =?utf-8?B?UGcvNUNZL0RyVE4yclNyQlFDSmxwQnpsUS94YTFzZksxVyswODFsZ0FZS2R1?=
 =?utf-8?B?MkRPMVZCWXp3b3p0dUpXcjBmclhFVVFpN2RIcnd1My9wSkhTL3NxOFFVUkxs?=
 =?utf-8?B?TW54RFlvR2l4MDNCdVcxTU83OEVWeUxQRkFzamdoQnA0OHV4K2hRWVowbGw3?=
 =?utf-8?B?MFhjMEdyVzNib3BxQlM4RVh6NFZRL0ZBRjVQaDhZUUQreUNNdzIzTzZjTjBR?=
 =?utf-8?B?UmN1Vk1iRUc2SDh5V05TZVFvSGRjNE5XL0d2V2FSZ1NBVnFxZk4wMWY2VnNo?=
 =?utf-8?B?Z0NtNWQ2amN2cFdTUDA4bVR2L0lvNzlGbEJFR0E4aUtnZTExNjZQQkRDSE5D?=
 =?utf-8?B?Mk9VYUJxbk1JMW9zUzd4SnkzUEdGK3NpcWR2MEhHSFFjTjMvZXB6S0Q1MDhp?=
 =?utf-8?B?QWFiK1lMU2xlR0tIQWlBVnNFUWR0K2NVQ0F0TVRBTmJjL2w5OVQyeTQ0V2VL?=
 =?utf-8?B?WC9FVklIQzErNjFuOFZKVXpVT3pUZ0lISjFZU2o2WUFpbmliMUlEaExqeVdS?=
 =?utf-8?B?UktMUi9oRHJoWXJzWWJUM0hnV2w5YWdMaFdVaElpT2FHSHExeE1SSWZlanhD?=
 =?utf-8?B?R09JZklCbHhPQ1VXQXhGK1NzckZEMDhvNXZQYm1jektZMEZSQS9TT09yeXpo?=
 =?utf-8?B?Z3VhZUx0WnJ5NHUrS0diVjZJT3VFUkNmUUphamljdXJaTWdLTmFpbkMzenZ0?=
 =?utf-8?B?cjNHQXBPV3pKbjRDZ21TaUJDR2tYa0s4ZkFzNklIWnkveVdjZTZWblN3R01U?=
 =?utf-8?Q?fjvo/6xgAaQugD6o1OLu49AgF?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BD2F6C203FEDE64EAF27CEEEBB8F398D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 561ff50a-ae3f-4be2-88ee-08ddaa84afa7
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2025 14:15:01.5685 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: do13sKWWRgUM0UVgpDDx8L8xT1xA/lMq86JdWRF1YlNzuYsS0sr7X60c6344RKYwTKEYWjbi0Er5PkLnclXkWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4829
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

T24gRnJpLCAyMDI1LTA2LTEzIGF0IDE4OjI1ICswNTMwLCBIaW1hbCBQcmFzYWQgR2hpbWlyYXkg
d3JvdGU6DQo+IFRoaXMgY29tbWl0IGludHJvZHVjZXMgYSBuZXcgbWFkdmlzZSBpbnRlcmZhY2Ug
dG8gc3VwcG9ydA0KPiBkcml2ZXItc3BlY2lmaWMgaW9jdGwgb3BlcmF0aW9ucy4gVGhlIG1hZHZp
c2UgaW50ZXJmYWNlIGFsbG93cyBmb3IgbW9yZQ0KPiBlZmZpY2llbnQgbWVtb3J5IG1hbmFnZW1l
bnQgYnkgcHJvdmlkaW5nIGhpbnRzIHRvIHRoZSBkcml2ZXIgYWJvdXQgdGhlDQo+IGV4cGVjdGVk
IG1lbW9yeSB1c2FnZSBhbmQgcHRlIHVwZGF0ZSBwb2xpY3kgZm9yIGdwdXZtYS4NCj4gDQo+IHYy
IChNYXR0aGV3L1Rob21hcykNCj4gLSBEcm9wIG51bV9vcHMgc3VwcG9ydA0KPiAtIERyb3AgcHVy
Z2VhYmxlIHN1cHBvcnQNCj4gLSBBZGQga2VybmVsLWRvY3MNCj4gLSBJT1dSL0lPVw0KPiANCj4g
Q2M6IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPg0KPiBTaWduZWQtb2Zm
LWJ5OiBIaW1hbCBQcmFzYWQgR2hpbWlyYXkgPGhpbWFsLnByYXNhZC5naGltaXJheUBpbnRlbC5j
b20+DQo+IEFja2VkLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVs
LmNvbT4NCg0KcmVtb3ZpbmcgbXkgYWNrLCBJIGdhdmUgYWNrIGp1c3QgdG8gdGhlIHB1cmdlYWJs
ZSBwYXJ0Lg0KVGhhdCBpcyB0aGUgb25seSBwYXJ0IHRoYXQgTWVzYSBjYW4gbWFrZSB1c2UsIGFu
ZCBub3cgdGhhdCBpcyBkcm9wcGVkIHNvIG5vIHBhcnQgb2YgdGhpcyBwYXRjaCBoYXMgbXkgYWNr
Lg0KDQo+IC0tLQ0KPiAgaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCB8IDExOCArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDExOCBpbnNl
cnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCBi
L2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gaW5kZXggNmE3MDJiYTc4MTdjLi5iNWY4ZDEx
ZmFhYTggMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gKysrIGIv
aW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiBAQCAtODEsNiArODEsNyBAQCBleHRlcm4gIkMi
IHsNCj4gICAqICAtICZEUk1fSU9DVExfWEVfRVhFQw0KPiAgICogIC0gJkRSTV9JT0NUTF9YRV9X
QUlUX1VTRVJfRkVOQ0UNCj4gICAqICAtICZEUk1fSU9DVExfWEVfT0JTRVJWQVRJT04NCj4gKyAq
ICAtICZEUk1fSU9DVExfWEVfTUFEVklTRQ0KPiAgICovDQo+ICANCj4gIC8qDQo+IEBAIC0xMDIs
NiArMTAzLDcgQEAgZXh0ZXJuICJDIiB7DQo+ICAjZGVmaW5lIERSTV9YRV9FWEVDCQkJMHgwOQ0K
PiAgI2RlZmluZSBEUk1fWEVfV0FJVF9VU0VSX0ZFTkNFCQkweDBhDQo+ICAjZGVmaW5lIERSTV9Y
RV9PQlNFUlZBVElPTgkJMHgwYg0KPiArI2RlZmluZSBEUk1fWEVfTUFEVklTRQkJCTB4MGMNCj4g
IA0KPiAgLyogTXVzdCBiZSBrZXB0IGNvbXBhY3QgLS0gbm8gaG9sZXMgKi8NCj4gIA0KPiBAQCAt
MTE3LDYgKzExOSw3IEBAIGV4dGVybiAiQyIgew0KPiAgI2RlZmluZSBEUk1fSU9DVExfWEVfRVhF
QwkJCURSTV9JT1coRFJNX0NPTU1BTkRfQkFTRSArIERSTV9YRV9FWEVDLCBzdHJ1Y3QgZHJtX3hl
X2V4ZWMpDQo+ICAjZGVmaW5lIERSTV9JT0NUTF9YRV9XQUlUX1VTRVJfRkVOQ0UJCURSTV9JT1dS
KERSTV9DT01NQU5EX0JBU0UgKyBEUk1fWEVfV0FJVF9VU0VSX0ZFTkNFLCBzdHJ1Y3QgZHJtX3hl
X3dhaXRfdXNlcl9mZW5jZSkNCj4gICNkZWZpbmUgRFJNX0lPQ1RMX1hFX09CU0VSVkFUSU9OCQlE
Uk1fSU9XKERSTV9DT01NQU5EX0JBU0UgKyBEUk1fWEVfT0JTRVJWQVRJT04sIHN0cnVjdCBkcm1f
eGVfb2JzZXJ2YXRpb25fcGFyYW0pDQo+ICsjZGVmaW5lIERSTV9JT0NUTF9YRV9NQURWSVNFCQkJ
RFJNX0lPVyhEUk1fQ09NTUFORF9CQVNFICsgRFJNX1hFX01BRFZJU0UsIHN0cnVjdCBkcm1feGVf
bWFkdmlzZSkNCj4gIA0KPiAgLyoqDQo+ICAgKiBET0M6IFhlIElPQ1RMIEV4dGVuc2lvbnMNCj4g
QEAgLTE5NzAsNiArMTk3MywxMjEgQEAgc3RydWN0IGRybV94ZV9xdWVyeV9ldV9zdGFsbCB7DQo+
ICAJX191NjQgc2FtcGxpbmdfcmF0ZXNbXTsNCj4gIH07DQo+ICANCj4gKy8qKg0KPiArICogc3Ry
dWN0IGRybV94ZV9tYWR2aXNlIC0gSW5wdXQgb2YgJkRSTV9JT0NUTF9YRV9NQURWSVNFDQo+ICsg
Kg0KPiArICogVGhpcyBzdHJ1Y3R1cmUgaXMgdXNlZCB0byBzZXQgbWVtb3J5IGF0dHJpYnV0ZXMg
Zm9yIGEgdmlydHVhbCBhZGRyZXNzIHJhbmdlDQo+ICsgKiBpbiBhIFZNLiBUaGUgdHlwZSBvZiBh
dHRyaWJ1dGUgaXMgc3BlY2lmaWVkIGJ5IEB0eXBlLCBhbmQgdGhlIGNvcnJlc3BvbmRpbmcNCj4g
KyAqIHVuaW9uIG1lbWJlciBpcyB1c2VkIHRvIHByb3ZpZGUgYWRkaXRpb25hbCBwYXJhbWV0ZXJz
IGZvciBAdHlwZS4NCj4gKyAqDQo+ICsgKiBTdXBwb3J0ZWQgYXR0cmlidXRlIHR5cGVzOg0KPiAr
ICogLSBEUk1fWEVfVk1BX0FUVFJfUFJFRkVSUkVEX0xPQzogU2V0IHByZWZlcnJlZCBtZW1vcnkg
bG9jYXRpb24uDQo+ICsgKiAtIERSTV9YRV9WTUFfQVRUUl9BVE9NSUM6IFNldCBhdG9taWMgYWNj
ZXNzIHBvbGljeS4NCj4gKyAqIC0gRFJNX1hFX1ZNQV9BVFRSX1BBVDogU2V0IHBhZ2UgYXR0cmli
dXRlIHRhYmxlIGluZGV4Lg0KPiArICoNCj4gKyAqIEV4YW1wbGU6DQo+ICsgKg0KPiArICogLi4g
Y29kZS1ibG9jazo6IEMNCj4gKyAqDQo+ICsgKiBzdHJ1Y3QgZHJtX3hlX21hZHZpc2UgbWFkdmlz
ZSA9IHsNCj4gKyAqIMKgwqDCoMKgwqDCoMKgwqAgLnZtX2lkID0gdm1faWQsDQo+ICsgKiDCoMKg
wqDCoMKgwqDCoMKgIC5zdGFydCA9IDB4MTAwMDAwLA0KPiArICogwqDCoMKgwqDCoMKgwqDCoCAu
cmFuZ2UgPSAweDIwMDAsDQo+ICsgKiDCoMKgwqDCoMKgwqDCoMKgIC50eXBlID0gRFJNX1hFX1ZN
QV9BVFRSX0FUT01JQywNCj4gKyAqIMKgwqDCoMKgwqDCoMKgICAuYXRvbWljX3ZhbCA9IERSTV9Y
RV9WTUFfQVRPTUlDX0RFVklDRSwNCj4gKyAqICAgICAgICAgfTsNCj4gKyAqDQo+ICsgKiBpb2N0
bChmZCwgRFJNX0lPQ1RMX1hFX01BRFZJU0UsICZtYWR2aXNlKTsNCj4gKyAqDQo+ICsgKi8NCj4g
K3N0cnVjdCBkcm1feGVfbWFkdmlzZSB7DQo+ICsJLyoqIEBleHRlbnNpb25zOiBQb2ludGVyIHRv
IHRoZSBmaXJzdCBleHRlbnNpb24gc3RydWN0LCBpZiBhbnkgKi8NCj4gKwlfX3U2NCBleHRlbnNp
b25zOw0KPiArDQo+ICsJLyoqIEBzdGFydDogc3RhcnQgb2YgdGhlIHZpcnR1YWwgYWRkcmVzcyBy
YW5nZSAqLw0KPiArCV9fdTY0IHN0YXJ0Ow0KPiArDQo+ICsJLyoqIEBzaXplOiBzaXplIG9mIHRo
ZSB2aXJ0dWFsIGFkZHJlc3MgcmFuZ2UgKi8NCj4gKwlfX3U2NCByYW5nZTsNCj4gKw0KPiArCS8q
KiBAdm1faWQ6IHZtX2lkIG9mIHRoZSB2aXJ0dWFsIHJhbmdlICovDQo+ICsJX191MzIgdm1faWQ7
DQo+ICsNCj4gKyNkZWZpbmUgRFJNX1hFX1ZNQV9BVFRSX1BSRUZFUlJFRF9MT0MJMA0KPiArI2Rl
ZmluZSBEUk1fWEVfVk1BX0FUVFJfQVRPTUlDCQkxDQo+ICsjZGVmaW5lIERSTV9YRV9WTUFfQVRU
Ul9QQVQJCTINCj4gKwkvKiogQHR5cGU6IHR5cGUgb2YgYXR0cmlidXRlICovDQo+ICsJX191MzIg
dHlwZTsNCj4gKw0KPiArCXVuaW9uIHsNCj4gKwkJLyoqDQo+ICsJCSAqIEBhdG9taWM6IEF0b21p
YyBhY2Nlc3MgcG9saWN5DQo+ICsJCSAqDQo+ICsJCSAqIFVzZWQgd2hlbiBAdHlwZSA9PSBEUk1f
WEVfVk1BX0FUVFJfQVRPTUlDLg0KPiArCQkgKg0KPiArCQkgKiBTdXBwb3J0ZWQgdmFsdWVzIGZv
ciBAYXRvbWljLnZhbDoNCj4gKwkJICogLSBEUk1fWEVfVk1BX0FUT01JQ19VTkRFRklORUQ6IFVu
ZGVmaW5lZCBvciBkZWZhdWx0IGJlaGF2aW91cg0KPiArCQkgKiAgIFN1cHBvcnQgYm90aCBHUFUg
YW5kIENQVSBhdG9taWMgb3BlcmF0aW9ucyBmb3Igc3lzdGVtIGFsbG9jYXRvcg0KPiArCQkgKiAg
IFN1cHBvcnQgR1BVIGF0b21pYyBvcGVyYXRpb25zIGZvciBub3JtYWwoYm8pIGFsbG9jYXRvcg0K
PiArCQkgKiAtIERSTV9YRV9WTUFfQVRPTUlDX0RFVklDRTogU3VwcG9ydCBHUFUgYXRvbWljIG9w
ZXJhdGlvbnMNCj4gKwkJICogLSBEUk1fWEVfVk1BX0FUT01JQ19HTE9CQUw6IFN1cHBvcnQgYm90
aCBHUFUgYW5kIENQVSBhdG9taWMgb3BlcmF0aW9ucw0KPiArCQkgKiAtIERSTV9YRV9WTUFfQVRP
TUlDX0NQVTogU3VwcG9ydCBDUFUgYXRvbWljDQo+ICsJCSAqLw0KPiArCQlzdHJ1Y3Qgew0KPiAr
I2RlZmluZSBEUk1fWEVfVk1BX0FUT01JQ19VTkRFRklORUQJMA0KPiArI2RlZmluZSBEUk1fWEVf
Vk1BX0FUT01JQ19ERVZJQ0UJMQ0KPiArI2RlZmluZSBEUk1fWEVfVk1BX0FUT01JQ19HTE9CQUwJ
Mg0KPiArI2RlZmluZSBEUk1fWEVfVk1BX0FUT01JQ19DUFUJCTMNCj4gKwkJCS8qKiBAYXRvbWlj
LnZhbDogdmFsdWUgb2YgYXRvbWljIG9wZXJhdGlvbiAqLw0KPiArCQkJX191MzIgdmFsOw0KPiAr
DQo+ICsJCQkvKiogQGF0b21pYy5yZXNlcnZlZDogUmVzZXJ2ZWQgKi8NCj4gKwkJCV9fdTMyIHJl
c2VydmVkOw0KPiArCQl9IGF0b21pYzsNCj4gKw0KPiArCQkvKioNCj4gKwkJICogQHBhdF9pbmRl
eDogUGFnZSBhdHRyaWJ1dGUgdGFibGUgaW5kZXgNCj4gKwkJICoNCj4gKwkJICogVXNlZCB3aGVu
IEB0eXBlID09IERSTV9YRV9WTUFfQVRUUl9QQVQuDQo+ICsJCSAqLw0KPiArCQlzdHJ1Y3Qgew0K
PiArCQkJLyoqIEBwYXRfaW5kZXgudmFsOiBQQVQgaW5kZXggdmFsdWUgKi8NCj4gKwkJCV9fdTMy
IHZhbDsNCj4gKw0KPiArCQkJLyoqIEBwYXRfaW5kZXgucmVzZXJ2ZWQ6IFJlc2VydmVkICovDQo+
ICsJCQlfX3UzMiByZXNlcnZlZDsNCj4gKwkJfSBwYXRfaW5kZXg7DQo+ICsNCj4gKwkJLyoqDQo+
ICsJCSAqIEBwcmVmZXJyZWRfbWVtX2xvYzogcHJlZmVycmVkIG1lbW9yeSBsb2NhdGlvbg0KPiAr
CQkgKg0KPiArCQkgKiBVc2VkIHdoZW4gQHR5cGUgPT0gRFJNX1hFX1ZNQV9BVFRSX1BSRUZFUlJF
RF9MT0MNCj4gKwkJICoNCj4gKwkJICogU3VwcG9ydGVkIHZhbHVlcyBmb3IgQHByZWZlcnJlZF9t
ZW1fbG9jLmRldm1lbV9mZDoNCj4gKwkJICogLSBEUk1fWEVfUFJFRkVSUkVEX0xPQ19ERUZBVUxU
X0RFVklDRTogc2V0IHZyYW0gb2YgZmF1bHRpbmcgdGlsZSBhcyBwcmVmZXJyZWQgbG9jDQo+ICsJ
CSAqIC0gRFJNX1hFX1BSRUZFUlJFRF9MT0NfREVGQVVMVF9TWVNURU06IHNldCBzbWVtIGFzIHBy
ZWZlcnJlZCBsb2MNCj4gKwkJICoNCj4gKwkJICogU3VwcG9ydGVkIHZhbHVlcyBmb3IgQHByZWZl
cnJlZF9tZW1fbG9jLm1pZ3JhdGlvbl9wb2xpY3k6DQo+ICsJCSAqIC0gRFJNX1hFX01JR1JBVEVf
QUxMX1BBR0VTDQo+ICsJCSAqIC0gRFJNX1hFX01JR1JBVEVfT05MWV9TWVNURU1fUEFHRVMNCj4g
KwkJICovDQo+ICsJCXN0cnVjdCB7DQo+ICsjZGVmaW5lIERSTV9YRV9QUkVGRVJSRURfTE9DX0RF
RkFVTFRfREVWSUNFCTANCj4gKyNkZWZpbmUgRFJNX1hFX1BSRUZFUlJFRF9MT0NfREVGQVVMVF9T
WVNURU0JLTENCj4gKwkJCS8qKiBAcHJlZmVycmVkX21lbV9sb2MuZGV2bWVtX2ZkOiBmZCBmb3Ig
cHJlZmVycmVkIGxvYyAqLw0KPiArCQkJX191MzIgZGV2bWVtX2ZkOw0KPiArDQo+ICsjZGVmaW5l
IERSTV9YRV9NSUdSQVRFX0FMTF9QQUdFUwkJMA0KPiArI2RlZmluZSBEUk1fWEVfTUlHUkFURV9P
TkxZX1NZU1RFTV9QQUdFUwkxDQo+ICsJCQkvKiogQHByZWZlcnJlZF9tZW1fbG9jLm1pZ3JhdGlv
bl9wb2xpY3k6IFBhZ2UgbWlncmF0aW9uIHBvbGljeSAqLw0KPiArCQkJX191MzIgbWlncmF0aW9u
X3BvbGljeTsNCj4gKwkJfSBwcmVmZXJyZWRfbWVtX2xvYzsNCj4gKwl9Ow0KPiArDQo+ICsJLyoq
IEByZXNlcnZlZDogUmVzZXJ2ZWQgKi8NCj4gKwlfX3U2NCByZXNlcnZlZFsyXTsNCj4gK307DQo+
ICsNCj4gICNpZiBkZWZpbmVkKF9fY3BsdXNwbHVzKQ0KPiAgfQ0KPiAgI2VuZGlmDQo=
