Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E2AE7717F
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 19:43:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22CE310E14A;
	Fri, 13 Dec 2024 19:43:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HysRu+rm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D80FB10E14A
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Dec 2024 19:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734119003; x=1765655003;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=jAzylpNNbuMNBKxBWKCZH+br/oZqa20O8CxNfqA2ixk=;
 b=HysRu+rmA1iM7OG9F0ITzasV5hFbI7XCSIGgn8sETlwcGgncCeLE6VSb
 aEbRJaEk3VyKm3H1m9BXelYq+XFZdsQDXfpcVbASrQdGfBQHblpcyIO8f
 e+J5c7nUEGgqc5IdzsQGY9o4/uUN2skDZFLCMikg2DCQqpxPXc4nDRpQM
 +MzPYBqaY1K2m3pyG3hrtNU3TQm976ryV0VBmevcnEMNgYNapoJPRaqsZ
 y/7XwY/fw/SzDQ86KGYIVDjbZd8I+nfqzjqnHVVAlJXue2YoP1okuHH/z
 yawxIjod2HeM5Q+xjVW3K3S5yD/A6SgcexM8UTMN1zGn+0+ofeH7HP34p Q==;
X-CSE-ConnectionGUID: K1Y+wgsASzqSbl6TNj0afQ==
X-CSE-MsgGUID: GnsXezKSTZeUSL+kDZGFFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="45273710"
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; d="scan'208";a="45273710"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 11:43:23 -0800
X-CSE-ConnectionGUID: r51FOBoZSXaCNj79jX7L7w==
X-CSE-MsgGUID: eNWKjlwoTdeIL+xiwlIXww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; d="scan'208";a="96376529"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2024 11:43:23 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 13 Dec 2024 11:43:22 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 13 Dec 2024 11:43:22 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 13 Dec 2024 11:43:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iU8htyI4Rh1RhTRdi62X2qyY4RphApSdmD2pkRVI8ODgm+4zIacNSJcI2x6pxDiVSFuWFgif4nZiMeBHu/ehU2mp3z8nwRovoYu5Q/UKcXsVGWL/HLc7J0GiJ+tf7Hf6P4TX+QczP5wWYwvSuxJcTak06rtKCMuUz5v5xmE4jpgRTlqGuPmscmNHkNQ86oTrC9KgUpKI2OwWFW+iWro/IBJRzYqVLiQD8vpONGiJLI3fHYeWiNkClxiisdzrMkUf/5vO1eyoJCm4P+54O+bxFmilPDMRkPTbCfMGiFxI55fWQcbBEQgBGtCghh30x+rwgSOfRq8twRDuLqgC2K5mCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jAzylpNNbuMNBKxBWKCZH+br/oZqa20O8CxNfqA2ixk=;
 b=dnvBk42ViIoZ4227lMlX+aaopkPj7nkSSj/JuBzdL5qvrRkGgBPpqeMPwqcsY1J0Y1fEJ4Ht6JVss4J0+XtUrYb6bl4noECBImiwyyYyImPkv3ALcyQlfarHCTqTWChjc8dLBc3Zj4LXOQ+ZKE1pYZnsyPqF5bBD88rebYppuUMTErq9mChai+R02QL/hw90YND4bNVlUHCSpaz7f9FiphxzZ8TTHWTXMfHPsDLskS5BU8GBGNwzEF1KZvOMygo0GWonvk17LfGzf381nEH7XS2oZkdIVLCf0gQwZV62fp04hfywtFmLAmntCz2FoGuIy+xVd3jW1NR/ASASK1rPxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by IA1PR11MB7727.namprd11.prod.outlook.com (2603:10b6:208:3f1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.17; Fri, 13 Dec
 2024 19:43:04 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%7]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 19:43:04 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Filipchuk, Julia"
 <julia.filipchuk@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] Revert "drm/xe/devcoredump: Add ASCII85 dump helper
 function"
Thread-Topic: [PATCH] Revert "drm/xe/devcoredump: Add ASCII85 dump helper
 function"
Thread-Index: AQHbTWkcZhgIo/ttdkKNQ0lly9C4rLLkPnMAgAAI5oCAAAQoAIAABxGAgAAK0ICAAAWGgIAAAjQAgAAIA4CAAAOsgIAAItEA
Date: Fri, 13 Dec 2024 19:43:03 +0000
Message-ID: <ed2b683f31dbb98521336b6f79029fc3b3718a21.camel@intel.com>
References: <20241213141252.1488109-1-rodrigo.vivi@intel.com>
 <t6j573cbepbjwiclv5ulewcapwqyf7np4bvdut6gjario6wmeq@sk3cxg6mnos7>
 <a49a74a0b2ac363691f26dddde60aae60461ccbb.camel@intel.com>
 <7cd068ff3630f40e31cd4d971ad794986b017ab5.camel@intel.com>
 <26263eveox7cc3dqfqezodcunjamqgd7wrotzwmbci2o2ia42v@kkc3kpaizsef>
 <11116b4e7978ad7b5dc91d25c1d0232c809912c6.camel@intel.com>
 <w6zmdulew6aqkrkmjme7bdjp6jkllhswpazppd3t5gqnpysg4j@alphmd6gcxcr>
 <74c5a108-c5aa-49e3-b841-ff7ca838fae0@intel.com>
 <29a8ead7e28a72f7d9498d1701932836d7c14981.camel@intel.com>
 <1b38e47f-15a7-4267-8b3d-0ffa9219710e@intel.com>
In-Reply-To: <1b38e47f-15a7-4267-8b3d-0ffa9219710e@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|IA1PR11MB7727:EE_
x-ms-office365-filtering-correlation-id: fef672e5-26ca-4a8f-0b08-08dd1bae5c16
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dVJBb0h3Z21sRnpBeTB4R0o3QlB0TUhuWm9ZQysyRnRXTkZBMUdmMGlkdllQ?=
 =?utf-8?B?TWFVOWZURzRJMWhvaHY2eUVBd1lyaFNtVHF0YlZETVlUblJXTE9Xd0Y4aFd6?=
 =?utf-8?B?ejExZE5lYy91dzA0ZGRSMXJ3L1FQYXRNVjNoT0VFSHBZblpGWXNuVUhVV01G?=
 =?utf-8?B?NFNJM0gyVDZHdE1JY0gwQngyalNUc1N0UFlTYWZsLzA3QmNHcDc5S3VlQ0NX?=
 =?utf-8?B?b0FPSkxCd1N1R3ZpRjh4eDRRM0hKY3d5ZzM1NGlQVXI4RytSYW96Q2FDU0Fo?=
 =?utf-8?B?Nm0yeCsvMzdxTFBsODN4M0dkM1RwcFJhSmpQb255ZmhTaEpVUDJwaVNWSDZW?=
 =?utf-8?B?OThFV2ZvR2F0Y1M2NERKK2wyQm9qbWdPWDJPWW5NZ2xCSWNPSGx6UlJlaFlm?=
 =?utf-8?B?TkxxSkdwVUdMa3FCQUhwK2twNHpRR3ZOdGUwUXR2RC93R2dOeU40eDQvUFhO?=
 =?utf-8?B?Uzd2LzIwSXZ4b25BdGhMZm1aYlUyVFlBb2k3VWFldERSMkJHR2RHUy9FS1pR?=
 =?utf-8?B?TmU5eUFEdWV0VUFFWXpxcitKcEVGN3VpS2xseDV1dTFuUWFpZmhmczVHSFhj?=
 =?utf-8?B?M2wweHlhTWRNT2VTeWs4TTAxdGJXM21uMXp4Q3NVQVlvZ3lJRUZGcXBhNTZH?=
 =?utf-8?B?ZDZoREF2eUdRcFhaLzJNbzFPWWxCblRETjZFSjFCQlpHOFhOYVhWUDFkcGJH?=
 =?utf-8?B?NVVaNnNBb0M4cFJrTmdBamc4dUI4VndSSndhc3VjREFRV1Y4TEtQRUs5djZr?=
 =?utf-8?B?YUIxRDFYanprWG1ZYWREbVBmREpVWmtYUjU0RkpibDM2U2JjQXIzdm9Md1Nx?=
 =?utf-8?B?WnNCc3pmU2NYR25iUFlSUXo4ckN3b21Ja1RVWHFPTmFjM0ozWmRRM09yUzU4?=
 =?utf-8?B?MDIrVnM4ZytqYzhSc0MvM0d1dEt5YjlaWW5NZjNyMFJoNi9YVEVRVDFIVk5N?=
 =?utf-8?B?YU1NemJzNWtNbVREaEhLVGRpa3Z5VzhRa3BQMDVqSmgzMEwrbnJZdUpzMTdY?=
 =?utf-8?B?ZVlIL2NUVW1mRXI1TFhZU2lIQ0t1alBpMnViVjFMMDZicjA0VWtFejRtRnp4?=
 =?utf-8?B?aTF3MURZbVlsT0I1bjN6QUJ5L1hKK0t6cnZWNGtlNEdIdXpUY0ZFU0tnK3lj?=
 =?utf-8?B?ZUJMNTBQRnk0S0FqK1ZhUXMxaVFoTHVjL0JhVGJRNFYvT2JUSEVyK252c2JF?=
 =?utf-8?B?Mm9pK0pzMjlMTDA2cUJjcXJMZ2lEZEx6azh1ZTQ2eWpNRXNNUUp3MDBnMXh2?=
 =?utf-8?B?Skk1Y2JaVkNVbit3a2hCZGtlT2Q5Z1Z0YWJFSHc3TTRYRHozdi9KSW96Y1Ir?=
 =?utf-8?B?UFZIM1I0K09TRkp6S1d2eURtSm45a3dhQnhjaHovbEFiSGxNUnJGTkNMLzNM?=
 =?utf-8?B?ZzV0cjRJTWZRN2lzd2I1U0NsMzJEejVIT3B2QzRQZnRBanVaOHhQL2hnUVhL?=
 =?utf-8?B?cDhXM1prWGtuOHhCNkJtSEdhZ1FGRG12L0twNkRiRE8xZk53SjUwU1ZjZTNt?=
 =?utf-8?B?RGhYc1lmVTJYOHVXcDdUWWhHMlAxWlgyNDJ4ZlZJTnk3RndtVXJvaW94TnVx?=
 =?utf-8?B?OExqVVRRMkNGckgvb3lNM3dTa0RXNEFDcm1PUHl5S1hnZGg5dEM0ZkdEUXVN?=
 =?utf-8?B?b2liMUkySVNrQ29ZN3ZLa1l4Q0ttODJmRG8xbFloQndHNzNxU1dSZ2g0OHNQ?=
 =?utf-8?B?MGR5OWJraUFSSUowdVBoY3RnYkpzNTRYYVpZS3VtU0dpU3lJdCtwZk40TTFN?=
 =?utf-8?B?TWNTQS82VkoyRXVPVnZPNzVldmFiRDduVzlWUW5RSG1TL0wrMlBhZlVIaCt5?=
 =?utf-8?B?bDRJRS82WnVhY1hEM2hGZGZxMTg5cnZFMW13cWNyNVZrcHh0TVpKVW9wUi9s?=
 =?utf-8?B?Y2x4R0d5QmJpMmZGQ2xBVlA0YWR1M2xVMGdXcjZwM2xJVGc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Tnl5QlVKVFVYRlg3VStLWlkveU9XbURwRmlwUllkcGtGRStCN0VRYU11Ui9T?=
 =?utf-8?B?cnozOGFRWm8wemF4VGhyU0xDMXBCNHdxUzV3ZXBrVzhRcVpxbFNEZnNqY3Jk?=
 =?utf-8?B?dVMrUWdhV2ZZNDRVV081ZW1RRy90U0tTQkgxdHI0Vk1sSDBxdUhjamRmZ3FP?=
 =?utf-8?B?K0xqa0xNWVMyNDR0RSt3bXR6b1lCTmo3WklWWWpmRC9oeFMyODU1bUdZc0dk?=
 =?utf-8?B?RnltTlk4UkF0cndZNmhwU1pXTWhPcE4vWDY1UlhRRW9aMUpEZnBUSkxGeXhX?=
 =?utf-8?B?VVlwUWdDSFNzMWdiaCtLV3hUVzNDWmVBVlhXRVNKM0o4UzROa25PM05OUjJa?=
 =?utf-8?B?Qi9CN0l5SkhSd0YrRWJmNWg1b0hDY1J1V0cyNUVRUm82clVHZnZ0RkRqems0?=
 =?utf-8?B?QUxsNHdhaGhwcGw3OHFSYnAzSURYdGs5RlBQMGZlRXlHNzdWQzJ3MmVVUkJP?=
 =?utf-8?B?cWgrdWRFSFdVWER6d3JNZ05kWHAyWW0wSEJldElRdUNwWUNIakdkcUk4UFVB?=
 =?utf-8?B?UkpjQzl0TlU2eTBvSlVkbjhuK1hmZEpXYU9scU5iUFNONWdnR2VHL2pLWkVP?=
 =?utf-8?B?VStuamc5L1lqOVBSOGNnVy9KaWx3ZUpJTFFreTB2QktFeXJVUTlWYXA1R2Ux?=
 =?utf-8?B?OXBVWDRqSFhkaVBKd3RJVEJRNmlZazliKzh5aVVGejlPQVpPZ21zRE5MZjd1?=
 =?utf-8?B?V28yQnlwaHA3T2tmSnlGZXZQZUVOREE5V3JjWi9Ba1pLcS92YWFXWVNBNzdP?=
 =?utf-8?B?UGE0cjBXQldSNzJNVklKOVJOQTlhYVE1Nk4yMFRwZkZQL0l6elpkcGpqelJW?=
 =?utf-8?B?bVV3eXJic1pTSjl1c2pCZit5TllkVG4rT0RnaFpvUEU0bEJSMnM3WTNZbWwz?=
 =?utf-8?B?YzdVdjd0a3h5SUR6N3FlU1dkSFIvbG5vSzBCVk5xSGZub3NGWjNYZnJTL0V3?=
 =?utf-8?B?WDJLNFBxK0NvaVBNYnJZYmMyRUNDd29BWXhVdFVnSFlkUEtyZVg2cmg0WWtu?=
 =?utf-8?B?eVgxOWpHbjBzc0RBVWwzcnFHRlpNR1JyMUE2VTM3SmJpSzFhTll5K3pBL05w?=
 =?utf-8?B?TUxhUjVXRGliUFZORERTNis3eUZiT2NoMTYxWVg0eklQOWQ5bTdiakhsOTlm?=
 =?utf-8?B?WVNPSFVXdFp3aDVubmJ1aGRTODF1cmFZaTlYQ3cyZk1CYzJ3TDJQbWZpOE44?=
 =?utf-8?B?aUFyWDk3ZFN3OFM2MURRTURRMENHajdLQXFlN241Qk9oUlNpQjVIRThWNGQy?=
 =?utf-8?B?c2dsZkpKOERjOTNiVDNuOTZWVGxVeTlFQWRScVZNSmhqVExTRnZTTkllSGhv?=
 =?utf-8?B?T1dRdU1tK1VEeW8wamNzUTFtNGNSaURoQlpIZXVkQUhiUW9hbE9jWDAwenYy?=
 =?utf-8?B?cmdzVmQ4c0xCSUJYbkhiSktMY2hzMTlOZjZFNDRSVHFaWWMyWkVONHFqd0pN?=
 =?utf-8?B?bWVtWTNKRXlVNGFwcVFsYmRPOHIwVWJoMnZhb0ZCZmRlblRwUW84OFdqaGRU?=
 =?utf-8?B?Z2UrSkpGWmZER3k0bXdjNy9TZXdnOXNxOWtUczI1aVZSZTVrSW9GbTJIMTZ4?=
 =?utf-8?B?UGppMTc2V1Z5Vzc4N28vWjgxQldkSklreEdBZGMrL2F5N0dJaWlUN2kwMDdr?=
 =?utf-8?B?d3orRlFvbzJEcU5YemczaEhRaG1OamNvY0pOTktnMzBHUG5NR1ZQcXRJT2xz?=
 =?utf-8?B?R3VDbWZhcCttZ2I2SU9oSS9mZit4U0hXR3V0SDdtWWdSdWhUNTlNRm1ha29S?=
 =?utf-8?B?dkhDUzEwSWlJM1VCeEs0TlRPVFFpYUt5S0tObGg4RXpKMDkxZnArcWpDRFFP?=
 =?utf-8?B?S0tTR0NtdHlnQWdlM0dGUUdWQUptMzdCdEpKUHFsNm9HQjByRFEvVkFHQXRu?=
 =?utf-8?B?OWFBKy9lck5sQzJRRnMxeG9qdGpXVUJHNVdmRVM3K1dXS203aHNVb3dNTk5P?=
 =?utf-8?B?OS8rODF5UHdLNlF3OFpqZm55MGhtc21wNjB5cVM2ODhSVTMwV1RKOEltNy9C?=
 =?utf-8?B?UG9jQ1grRktxQnVIWDI4MFZqN3V5aWJtUUR4blFXNkhrVXZ6aXEvS1lwWWYv?=
 =?utf-8?B?eXg5cUlmaW9nRlJ4WTZKZlprZ2lTWEpQTGQzZUdpV1dWc0hhN3VMTGlNeXJs?=
 =?utf-8?B?L3dVbStjYVNtdlJ4dEhTTUttUnl0bWQzLzh4N0RkNVpLS2QyVzFIQ2VScHNL?=
 =?utf-8?B?N1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <272803A80AB3CD409C032AD174ABE25F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fef672e5-26ca-4a8f-0b08-08dd1bae5c16
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2024 19:43:03.9643 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +T47OrKt2gyLE2blIQhVikm/w8pQt3OuGNS70KTNM+CERsSGE89uBtXswW9Hqg4gakGx2tefLFkVwbeJqEPEgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7727
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

T24gRnJpLCAyMDI0LTEyLTEzIGF0IDA5OjM4IC0wODAwLCBKb2huIEhhcnJpc29uIHdyb3RlOg0K
PiBPbiAxMi8xMy8yMDI0IDA5OjI1LCBTb3V6YSwgSm9zZSB3cm90ZToNCj4gPiBPbiBGcmksIDIw
MjQtMTItMTMgYXQgMDg6NTYgLTA4MDAsIEpvaG4gSGFycmlzb24gd3JvdGU6DQo+ID4gPiBPbiAx
Mi8xMy8yMDI0IDA4OjQ4LCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6DQo+ID4gPiA+IE9uIEZyaSwg
RGVjIDEzLCAyMDI0IGF0IDA0OjI4OjU4UE0gKzAwMDAsIEpvc2UgU291emEgd3JvdGU6DQo+ID4g
PiA+ID4gT24gRnJpLCAyMDI0LTEyLTEzIGF0IDA5OjUwIC0wNjAwLCBMdWNhcyBEZSBNYXJjaGkg
d3JvdGU6DQo+ID4gPiA+ID4gPiBPbiBGcmksIERlYyAxMywgMjAyNCBhdCAwMzoyNDo1OVBNICsw
MDAwLCBKb3NlIFNvdXphIHdyb3RlOg0KPiA+ID4gPiA+ID4gPiBPbiBGcmksIDIwMjQtMTItMTMg
YXQgMDc6MTAgLTA4MDAsIEpvc8OpIFJvYmVydG8gZGUgU291emEgd3JvdGU6DQo+ID4gPiA+ID4g
PiA+ID4gT24gRnJpLCAyMDI0LTEyLTEzIGF0IDA4OjM4IC0wNjAwLCBMdWNhcyBEZSBNYXJjaGkg
d3JvdGU6DQo+ID4gPiA+ID4gPiA+ID4gPiBPbiBGcmksIERlYyAxMywgMjAyNCBhdCAwOToxMjo1
MkFNIC0wNTAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+ID4gPiA+ID4gPiA+ID4gPiA+IFdlIGRv
IG5vdCBicmVhayB1c2Vyc3BhY2UuDQo+ID4gPiA+ID4gPiA+ID4gVGhlcmUgaXMgb3RoZXIgcGF0
Y2ggdGhhdCBhbHNvIGJyZWFrcyBNZXNhIHBhcnNlcjoNCj4gPiA+ID4gPiA+ID4gPiANCj4gPiA+
ID4gPiA+ID4gPiBkcm0veGUvZGV2Y29yZWR1bXA6IEltcHJvdmUgc2VjdGlvbiBoZWFkaW5ncyBh
bmQgYWRkIHRpbGUgaW5mbw0KPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+ID4gPiBU
aGlzIHJldmVydHMgY29tbWl0IGVjMTQ1NWNlN2UzNWEzMTI4OWQyZGJjMTA3MGI5ODA1Mzg2OTg5
MjEuDQo+ID4gPiA+ID4gPiA+ID4gPiBCdXQgd2UgaGF2ZSB1c2VycyBjYWxsaW5nIHRoaXMgZnVu
Y3Rpb24uLi4uIHRoZSByZXZlcnQgaXMgbm90DQo+ID4gPiA+ID4gPiBzbyBzaW1wbGUuDQo+ID4g
PiA+ID4gPiA+ID4gPiBJIHRoaW5rIHdlIG5lZWQgdG8gcmV2ZXJ0IHRoZSBmdW5jdGlvbmFsaXR5
IHJhdGhlciB0aGFuDQo+ID4gPiA+ID4gPiByZXZlcnRpbmcgYWxsDQo+ID4gPiA+ID4gPiA+ID4g
PiB0aGUgcGF0Y2hlcywgb3RoZXJ3aXNlIGl0IHdpbGwgY2F1c2UgYSBsb3Qgb2YgaGVhZGFjaGVz
Lg0KPiA+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4gPiBJIHByb3Bvc2Ugd2UgZ28g
d2l0aDoNCj4gPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+ID4gYSkgZHJvcCB0aGUg
XG4gdGhhdCBicm9rZSBtZXNhIGFuZCBtZXJnZSB0aGF0IHdpdGggY2Mgc3RhYmxlLg0KPiA+ID4g
PiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4gPiBiKSBtb3ZlIGJhY2sgdGhlIGVudHJ5IHRv
IHRoZSBwcmV2aW91cyBzZWN0aW9uIHRoYXQgYnJva2UgbWVzYQ0KPiA+ID4gPiA+ID4gYW5kIGNj
DQo+ID4gPiA+ID4gPiA+ID4gPiAgwqDCoMKgwqAgc3RhYmxlLg0KPiA+ID4gPiA+ID4gPiA+ID4g
DQo+ID4gPiA+ID4gPiA+ID4gPiAgwqDCoMKgwqAgSm9zw6ksIHdvdWxkIGl0IGJlIG9rIHRvIG1l
cmdlIGEgcGF0Y2ggaW4gbWVzYSBhbmQgcG9ydCB0aGF0DQo+ID4gPiA+ID4gPiA+ID4gPiAgwqDC
oMKgwqAgdG8gbWVzYSBzdGFibGUgdGhhdCBzaW1wbHkgbG9va3MgYXQgMiBwb3NzaWJsZSBzZWN0
aW9ucz8NCj4gPiA+ID4gPiA+IE9yIGV2ZW4NCj4gPiA+ID4gPiA+ID4gPiA+ICDCoMKgwqDCoCBk
cm9wIHRoZSBzZWN0aW9uIGNoZWNrcy4uLiA/DQo+ID4gPiA+ID4gPiA+IEJ1dCBpZiBYZSBLTUQg
aXMgcmV2ZXJ0aW5nIHRoZSBwYXRjaCB0aGF0IGNoYW5nZWQgdGhlIGh3Y3R4DQo+ID4gPiA+ID4g
PiBzZWN0aW9uIHdoeSB3b3VsZCBNZXNhIG5lZWQgdG8gYWxzbyBwYXJzZSB0aGUgbmV3KGZ1dHVy
ZSB0byBiZQ0KPiA+ID4gPiA+ID4gcmV2ZXJ0ZWQpIHNlY3Rpb24/DQo+ID4gPiA+ID4gPiANCj4g
PiA+ID4gPiA+IGZpcnN0IGlzIHRvIHVuZG8gdGhlIGRhbWFnZSwgd2l0aCAwIGNoYW5nZXMgaW4g
bWVzYS4gV2UgZG8gdGhhdA0KPiA+ID4gPiA+ID4gZmlyc3QgYW5kDQo+ID4gPiA+ID4gPiAqdGhl
biogd2UgYWdyZWUgb24gd2hhdCdzIHBvc3NpYmxlIHRvIGRvIHRvIGFjY29tb2RhdGUgdGhlIDIg
cGFyc2VycyB3ZQ0KPiA+ID4gPiA+ID4gaGF2ZS4NCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4g
SWYgd2UgY2FuIGdldCBzb21ldGhpbmcgaW4gbWVzYSB0byB3b3JrIHRoYXQgaXMgYmFja3dhcmQg
Y29tcGF0aWJsZQ0KPiA+ID4gPiA+ID4gKGkuZS4gdGhlDQo+ID4gPiA+ID4gPiBjaGFuZ2VkIHBh
cnNlciBpcyBhYmxlIHRvIHBhcnNlIGJvdGggYmVmb3JlIGFuZCBhZnRlciB0aGUga2VybmVsDQo+
ID4gPiA+ID4gPiBjaGFuZ2UpLA0KPiA+ID4gPiA+ID4gdGhlbiBpdCBjb3VsZCBiZSBjb25zaWRl
cmVkIHRvIGEgbWVzYSBzdGFibGUgYW5kIHRoZSBrZXJuZWwgc2lkZQ0KPiA+ID4gPiA+ID4gY2hh
bmdlZC4NCj4gPiA+ID4gPiBPa2F5LCByZWFzb25hYmxlIHBsYW4uIEJ1dCB0aGUgYXNjaWk4NSBl
bmNvZGVyIHdpdGggXG4gd2lsbCBub3QgYmUNCj4gPiA+ID4gPiBicm91Z2h0IGJhY2sgcmlnaHQ/
DQo+ID4gPiA+IG1heWJlIGxldCdzIGFncmVlIG9uIGhvdyB0byBwb3NzaWJseSBicmluZyBpdCBi
YWNrPyBJIHN1Z2dlc3RlZCB1c2luZyBhDQo+ID4gPiA+IHNwYWNlIGFzIGNvbnRpbnVhdGlvbiBs
aW5lIGNoYXIuIFRoaXMgd2F5IHlvdSBjYW4ganVzdCBjaGVjayB0aGUgbGFzdA0KPiA+ID4gPiBj
aGFyDQo+ID4gPiA+IHJldHVybmVkIGJ5IGdldGxpbmUoKSB5b3UgYXJlIGNhbGxpbmcgYW5kIHNl
ZSBpZiB5b3UgY2FuIGdvIGFoZWFkIGFuZA0KPiA+ID4gPiBwcm9jZWVkIG9yIGlmIHlvdSBzdGls
bCBuZWVkIHRvIGdldCBtb3JlIGRhdGEuIE5laXRoZXIgc3BhY2Ugbm9yIG5ld2xpbmUNCj4gPiA+
ID4gYXJlIHBhcnQgb2YgdGhlIGFzY2lpODUgY2hhcmFjdGVyIHNldCwgc28gaXQncyBzYWZlIGFu
ZCB5b3UgY2FuIGhhbmRsZQ0KPiA+ID4gPiBjb250aW51YXRpb24gaW4gb25lIHBsYWNlIGluIHlv
dXIgbG9vcC4NCj4gPiA+ID4gDQo+ID4gPiA+IGlmIHlvdSBhcmUganVzdCBpZ25vcmluZyBhbnkg
YXNjaWk4NSwgdGhlbiBJIGJlbGlldmUgaXQncyBldmVuIHNpbXBsZXI6DQo+ID4gPiA+IHlvdSBj
aGVjayBzZWN0aW9ucyBhbmQga2V5cyB3aXRoIGEgc3BhY2Ugc2luY2UgYm90aCBrZXlzIGFuZCBz
ZWN0aW9uDQo+ID4gPiA+IHRpdGxlcyBjb250YWluIHNwYWNlLCB3aGljaCBpcyBub3QgcGFydCBv
ZiB0aGUgYXNjaWk4NSBjaGFyIHNldC4NCj4gPiA+ID4gDQo+ID4gPiA+IEx1Y2FzIERlIE1hcmNo
aQ0KPiA+ID4gWWVzLCBJIHdvdWxkIHN0cm9uZ2x5IHByZWZlciB0byB1c2UgbGluZSB3cmFwcGVk
IEFTQ0lJODUgZGF0YSBmb3IgYWxsDQo+ID4gPiBibG9icyBpbiB0aGUgZGV2Y29yZWR1bXAuIElu
Y2x1ZGluZyB0aGluZ3MgbGlrZSBiYXRjaCBidWZmZXJzIGFuZCBvdGhlcg0KPiA+ID4gVk0gZW50
cmllcyB0aGF0IHRoZSBtZXNhIHRvb2wgaXMgcHJlc3VtYWJseSB3YW50aW5nIHRvIGRlY29kZS4N
Cj4gPiA+IA0KPiA+ID4gSWYgYWRkaW5nIGEgPHNwYWNlPiBjaGFyYWN0ZXIgdG8gdGhlIGVuZCBv
ZiBlYWNoIGxpbmUgaXMgYW4gYWNjZXB0YWJsZQ0KPiA+ID4gZml4IHRoZW4gSSBoYXZlIG5vIHBy
b2JsZW1zIHdpdGggdGhhdC4gQnV0IG5vdCBsaW5lIHdyYXBwaW5nIGF0IGFsbA0KPiA+ID4gbWVh
bnMgaGF2aW5nIHRvIGNhcnJ5IHRoYXQgY2hhbmdlIGFzIGEgbm9uLXVwc3RyZWFtIHBhdGNoIGlu
IGVpdGhlciB0aGUNCj4gPiA+IGludGVybmFsIHRyZWUgb3IgaW4gaW5kaXZpZHVhbCBkZXZlbG9w
ZXIncyBsb2NhbCB0cmVlcy4gRWl0aGVyIHRoYXQgb3INCj4gPiA+IHdlIGp1c3QgY2Fubm90IGRl
YnVnIGEgbG90IG9mIGhhcmQgdG8gcmVwcm8gcHJvYmxlbXMuDQo+ID4gQ2FuJ3QgWGUgS01EIHVz
ZSB0aGUgbGluZSB3cmFwcGVkIHZlcnNpb24gb2YgQVNDSUk4NSB3aGVuIHByaW50aW5nIHRvIGRt
ZXNnIGFuZCBrZWVwIHRoZSByZWd1bGFyIGVuY29kZXIgd2hlbiBkZXZjb3JlZHVtcCBmaWxlIGlz
IHJlYWQ/DQo+IEFwcGFyZW50bHkgbm90LiBFdmVuIHdoZW4gbm90IGRlbGliZXJhdGVseSBsaW5l
IHdyYXBwaW5nIHRoZSBvdXRwdXQsIEkgDQo+IGFtIHN0aWxsIHNlZWluZyBpdCBiZWluZyB3cmFw
cGVkIHdoZW4gZHVtcGluZyB2ZXJ5IGxhcmdlIGJ1ZmZlcnMgc3VjaCBhcyANCj4gdGhlIEd1QyBs
b2cuIEl0IGxvb2tzIGxpa2Ugc29tZXRoaW5nIGluIGEgbG93ZXIgbGF5ZXIgaXMgYWxzbyBmb3Jj
aW5nIA0KPiBsaW5lIHdyYXBwaW5nIG9mIHN1cGVyIGxvbmcgbGluZXMuIFNvIGVpdGhlciB3ZSBj
YW4ndCBhZGQgZnVsbCBzaXplIEd1QyANCj4gbG9ncyB0byB0aGUgZGV2Y29yZWR1bXAgb3Igd2Ug
bmVlZCB0byBzdXBwb3J0IGxpbmUgd3JhcHBlZCBkYXRhIGluIHRoZSANCj4gbWVzYSB0b29sLg0K
DQpJdCBpcyBwcm9iYWJseSBzb21lIGltcGxlbWVudGF0aW9uIGRldGFpbCBvZiBfX2RybV9wcmlu
dGZuX2NvcmVkdW1wKCkuIFRoYXQgY291bGQgYmUgcmVwbGFjZWQgdG8gc29tZXRoaW5nIGxpa2Ug
aTkxNSBlcnJvciBkdW1wIHdyaXRlIGZ1bmN0aW9ucyB0byBub3QNCmhhdmUgYW55IGxpbWl0IGF0
IGxlYXN0IHdoZW4gdGhlIHRhcmdldCBpcyBhIGZpbGUgZGVzY3JpcHRvciwgZm9yIGRtZXNnIHlv
dSBhcmUgZnJlZSB0byBhZGQgYW55IGxpbmUgd3JhcHBpbmcuDQoNCj4gDQo+IEpvaG4uDQo+IA0K
PiA+IA0KPiA+ID4gSm9obi4NCj4gPiA+IA0KPiANCg0K
