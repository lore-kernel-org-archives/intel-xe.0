Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A38C61CE8
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 18:27:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D853710E0FF;
	Thu, 12 Jun 2025 18:27:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jLkUWM2u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD41810E0FF
 for <Intel-Xe@lists.freedesktop.org>; Thu, 12 Jun 2025 18:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749752839; x=1781288839;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Rw7aDjYKR1Fyh7Lgq15hivi6MIh/WqgaxiXbmABvUig=;
 b=jLkUWM2u1XqYsDcNrWbKV4kZRy++UzRk8dMPRcmZEV4kIxBTSGlBd3Mo
 bf/omFTubS61txp3v83uY6jzZqIu0dTI/HdfcT2ioFOTzKIezVOge4a7T
 vKYM3KxIPPyB8vYhSaGWW3Mr58gy7mP2CVhhoTr1EdPNw96M18qOY6VOg
 8K3fd58/dtY8/O2OsIJ1azdkj5b+Oq21Vqei0u0smQ0B2viSXLtCuQpsV
 N1eebuiUxSqB5oFcsl7ZQsHZeqURZtc5woNn1xfB7OO+uhxX68leIVCTL
 DftGFPH5+UTNTs0nCMjuM1q1FB1CNiEzZMof5MHWm3u3mA4LTgmdInyXw Q==;
X-CSE-ConnectionGUID: YYCmu3cxQKKv/rRnRzRKAA==
X-CSE-MsgGUID: qt+VQh0pQ0ec/f6ex3laJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="63297768"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="63297768"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 11:27:19 -0700
X-CSE-ConnectionGUID: gKKEz2zOSzKfseHscP4vJw==
X-CSE-MsgGUID: ko5eh3C4SH6xG+JS7kVucg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="147436708"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 11:27:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 11:27:18 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 11:27:18 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.84)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 11:27:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R06g+PpNaqJIYFn7/N5XR7MTGfPL8XIpdWtt/xg2xywwAsx+nL8uLz7xx761OeOqF5LsREPI3cNDpvyLj7SeogSyAC1Rn3Q/vRx7PIiFks8MO4v4uObtu4hK0KSltzbPY6NA3OsJTbsXVnED/xYMiefYPli7AwS4PlzCaIUJaQBkq0q3Z1lQ6ap8FYMBpPVv47gcishEZRih7zmbvAzyPj0WYx0sDgcRw4CVkX8nYCGEAmbmcxlJFO45Y7Ws2CVyOsTgYgh53etrXF/jWScp9T4MQ5grAKvk43NXqbTXOdnp19dRP/7kubesFWS5bFEo3XVxV/N29OJLKi1l+M7XTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rw7aDjYKR1Fyh7Lgq15hivi6MIh/WqgaxiXbmABvUig=;
 b=O5+8KAr3IMd500DqhviulZ0SWEgPsHRDh8rdUuawBWdwgnxQgRvpp1Su1RjQrKM5nJEhEhjyHXwfVNuYh9/W2t/9YRdACF7D/yJHUfSCQ7llxl7M7dMMJZd9bFb84MaBKfMkZZiEIzmNYMu9RZw7n0CNOKKPZBnK2TcPdHr418lwvTDEGDoPwB/FsnVUak9ubKmh++koobeXhSvvQN45s5OLflI6Fci15eInLo6HhULQHp9fqJBDts347WFEsnBY0RyyVldCdB6q/MtVOhcEFU7C46KVBUQwe5wyoeS6YJSWdj8BgDn2KdFaw+fz4+1RzFUvhenviP+nAvyZR21HLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS0PR11MB7734.namprd11.prod.outlook.com (2603:10b6:8:df::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.23; Thu, 12 Jun 2025 18:27:16 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8813.024; Thu, 12 Jun 2025
 18:27:16 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>,
 "Intel-Xe@Lists.FreeDesktop.Org" <Intel-Xe@Lists.FreeDesktop.Org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 2/2] drm/xe/guc: Add support for NPK as a GuC log target
Thread-Topic: [PATCH 2/2] drm/xe/guc: Add support for NPK as a GuC log target
Thread-Index: AQHb2xS1G6L4Gnmrj06JQMCG4b4JFrP+fC9wgAAmsgCAAPFNQIAAOmQAgAAAXIA=
Date: Thu, 12 Jun 2025 18:27:16 +0000
Message-ID: <CH0PR11MB5444E69BE6FC406E515DC61BE574A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250611210553.3756700-1-John.C.Harrison@Intel.com>
 <20250611210553.3756700-3-John.C.Harrison@Intel.com>
 <CH0PR11MB5444BB01251782688FECD0E6E575A@CH0PR11MB5444.namprd11.prod.outlook.com>
 <a47f94c7-7677-4945-ba4e-cba894428472@intel.com>
 <CH0PR11MB544461EFF28E40A16C84A175E574A@CH0PR11MB5444.namprd11.prod.outlook.com>
 <f466922e-2884-4e42-ad64-4d1ce063b4fa@intel.com>
In-Reply-To: <f466922e-2884-4e42-ad64-4d1ce063b4fa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS0PR11MB7734:EE_
x-ms-office365-filtering-correlation-id: be5e8447-2f74-49eb-6169-08dda9dec27b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?R3Z5UlIwaEI5TzRzVkRDWFlUU21MTzNDbE5hN1BFU1NCbmMvaTVIelEvaEZv?=
 =?utf-8?B?MVlTUWNpeWRua2JtOXREQkdBTWwxSjVjQm5rbi9EZTlHQkJQUGxvTWlpMnVT?=
 =?utf-8?B?ZXQySG81WDd5Z2t1bHkwTGt5MnJrcUY0ZlNCV0x4d3E1cGwyNmhJM0pvNWhC?=
 =?utf-8?B?aG04NkJDNS9Hc2RtTmx4MFlNa1B6QldoOVhHTEk0M1V4aCtKREloY3B6Z1VW?=
 =?utf-8?B?SUNCWE1iTnRZbnFFVGg2UnZmN2QvU3M3VHZwZkhFenNhRE5OdGN5V0RNS0J6?=
 =?utf-8?B?MmIrWEo2TkR5N1N1M0ZacldWMDh3QmNIa1NDcTAvV3RoTUt5L21ZdjgwOWEx?=
 =?utf-8?B?Wk4raEhYSjRzOEs0d1NlTHM2WC9LeTZFV3AxNnNMQ1BXYVdYSVcxbnQyalVD?=
 =?utf-8?B?ZFpOZGZtcDFGS1F0a1lKdkQrWWRSdEUyK3ZZeXRUN2ZIa0pWOG9WWDF3dC94?=
 =?utf-8?B?MVBmU3k2bzlKTnBKZUQxNzMySWt3S1QxamFsbXBvVU0vT1dCYzFOYkVINDJt?=
 =?utf-8?B?TzhqN08xVnBtNVE0WkVnRklVSlNzQm9RU0tRRnhqcHFnM216Y01JdU1KOW42?=
 =?utf-8?B?TWNBaW5JYkRwNFQ4eDRia1V6N3RtYmY1NnljWTZzRG82M01SSlVYMnhRUFhn?=
 =?utf-8?B?TU5zMUpTZVVVSTF6UnVHYjZJcDhObzBLcFhPdS9rcFZVSStFdFNTM0pPcEUz?=
 =?utf-8?B?YnRYcHN2WEVlSjlhRW9jRFFnb2ErUnA0SEVNdmlQR1hjSllXY0NQamMzWWVh?=
 =?utf-8?B?ZVBVYzlIWW1zcnV3VTErVFo2Q1c3YmxDR1pYSDZTdzd0VWhER3ExY2pGZjJC?=
 =?utf-8?B?S1VqaXpvVjdPaGVxd1FHV1drc0pIQ2RpR0p6WmVhTjdwVGcyZVFvMXJpRllK?=
 =?utf-8?B?WmhHVDNGMTRBTVZpMDlXQVBsb3hZT0ZhZStIYkNWb3E5U09XaHRZbjh5bW9D?=
 =?utf-8?B?TVVHVWM2SkFMTDJFYzlXNjVSQnRTUlNvYjlJK0wzc1IxV1dFMituRXpxSTdZ?=
 =?utf-8?B?bUM3bU1hdG0vdkJVenp0UHBQeG93Zlc5Z0paNTlJMno1aVRRZmdtL21tV0VT?=
 =?utf-8?B?Q2FjMG5RRVlXV1V4RzcwVDBVNUNFRXV3dGpRYThjZHEwMEEvTXM1Ui9OemI5?=
 =?utf-8?B?WmhzYWhUM0h6UTVhSVF2L093aEFFS05YVGdtNVE4by8vckI1Z2ZWRmhrT0NV?=
 =?utf-8?B?L01NREMyd2FMejNLUW1pNVBSaDBQZ21VZ01mZ2FTZisvUVNOZW5ROGdMWXhT?=
 =?utf-8?B?Nk5GZTFHMzFzNmpOWnJrd2MwRGVrVnJ4TXR5eUdQUENHMG85ajRUbjJkM05E?=
 =?utf-8?B?cmVXTzhzRVBsazBtYlpBb2dJdUx5aEFacGw5eVRsRi9HMlo3MWhqK2ppYVVw?=
 =?utf-8?B?UXFjcTdBNzJRbDlTbGE4KzYreVFFcjBneXp3WHExY0xxU25wZDdRSDVLM2x0?=
 =?utf-8?B?TkdnVFMyNW1pWFF5ditybVRvMjFQaUNTaE1teWowMGE5ZU9RUjA1NGZQYTFt?=
 =?utf-8?B?QWVVZGNtYWdMNW9tRjBQSkVtMUxIYndVa3hFOStTNS9lWEJ3SS9LckJjeVg1?=
 =?utf-8?B?UDl5eWNGN3NPbC80TmV0TDlLUm45dUdVanJoYVhFZU84ZXUxSGFSQW5yRjhW?=
 =?utf-8?B?UElJMkgrWjRYekhnRTg1cWlCVElqcjU0Mk10MFRURnRUTjA2MWFFOXlJeXA2?=
 =?utf-8?B?OVlkM2k0UTlJcTdRQi9zWlpNdHFpU0NZWWVGallyUy85cTJ2ejlaUkozSkI2?=
 =?utf-8?B?SHc2bW1CU2Q2cEZ4MmNicHhidThCUWQ3ek5jaEhhVlJIblpJUWZFc05yeUpI?=
 =?utf-8?B?dmdOSXRZUVVrOVJSTlVOdVAxenkzTHoyS3J2Zmo2ZFpiTnBibkxnYWo1cWlB?=
 =?utf-8?B?RG5Oamd3Rit2V1dtV3dESlQ4UmY5NlU2YVRmK3I2YjNTRENLMGFNdG5BMEFM?=
 =?utf-8?B?WG8ralVLcUxhYzlqVzYzL0FJOVY4SWgva1kyczJPNm51MDJleU5vcEU0TlhS?=
 =?utf-8?Q?eFISwVRuLMScFcKqSNpq5Fr0me302o=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b0xxQU5nS0hZQXRuK2hqd2Q3S3AxSTlVb2MxTnozbnN2QktoYTBwMFpMOUpK?=
 =?utf-8?B?YW5mc0taVzEwQkN0M0JXc04vZGp4YjQ3MGZPYnBUc1E0eHNEdmo3SjBVOVgz?=
 =?utf-8?B?ZjRBMXlRaFl2bXZPeExFU0VzSDhmT3JBOE9FMlY2VW1aTkJ3NGN4SHhMUnpI?=
 =?utf-8?B?N0RuUlJCZHNDNEhHWlNUTk42S2d2MmF6cnJEVUxnTUFJRjN4QzJpaXFoMW1F?=
 =?utf-8?B?Nk9DZ0JWNnJWa1R3WDBOOEVHRnBsRFNaaGlhOWU1ZmFhQUwwV2hDMEhQdDhV?=
 =?utf-8?B?WUVhdWZUc0l2eGlnZ29CSm14QlZzaGJpK3NaL3ptVDE1ZnhDWWZlcFUwWG5S?=
 =?utf-8?B?dGVtV0FlMWZxa2NJYVZBUWFrNCsrczgzTFFocHFZam5hVy9uekZ4ck1xaitM?=
 =?utf-8?B?cStSOWtES0xNV0JCeWtyZWpZY09HME5IZTRNWklmeEJSdHBQSzZ4Y25Eamo4?=
 =?utf-8?B?UXVnd1UxcjVaMjc4ZU1wVVRCblNMdzRRVWJnYmE3RjE2N2hndlFRRTdaWU90?=
 =?utf-8?B?SnRMV2hTNFVsc3pFSDgyYjU1djE0SWR2eWRLNm9STWkrSDYyMlZVeDVGT0tH?=
 =?utf-8?B?QkZ3bHJTdG5mUEtJUWhCOW5jNHlhVzJJRE8rZklFMWZLTkh4OUtzV3ZnWm44?=
 =?utf-8?B?eHdpdFRDWVltRzNwMHFZa0lPWlFnQ0tYN3dQekYrR0NsOWpzMUlIRUdzempL?=
 =?utf-8?B?NTd3VHJrY1I3M21YZUp1dzZUTmNHaS8yT1ZkL0F3V24zSkhybFZLZkRhdU14?=
 =?utf-8?B?Q3lFbm1Jcmx6Wk9pYnlzcXg3NkFjS2pXUDNheDdVRWo2R2pwb1hMWktQMlZL?=
 =?utf-8?B?WTdiS1g5SzQrMmpycG0rZW5sWGw5c2p4NUdHN295SFVKeTNnQUpTRm9DTk8y?=
 =?utf-8?B?RHdodWJoYi9GUHJrV3lVb1Q2Ry9VRkVWZjJhQlRCc1V5cGdPeVdtT0FnN0k2?=
 =?utf-8?B?QTRuSUVqK1B0NHRkYS91Wk9IM2JTaWExNjVBUFVNSXVRZVlMTFpyUnd1eXVu?=
 =?utf-8?B?bWVqL1ZyNFhpRnRTeHoxaDhnbk1LdUc4cTJmMmJuR3VaNm9KOVcvYWU1emVj?=
 =?utf-8?B?UlhlNzV6ZGJ3emZPQm9SSU5RNTRnaFFDak0xWmFoOUVkZ2JUcEIwMDBNNisw?=
 =?utf-8?B?SEFCMVRMVm1VbTFBRHJUM01DTUUxeEVNZ1R1T0p4b0s5MDJZbEF3VWQyc0JM?=
 =?utf-8?B?ay9zcDBoYUNmeUZsNkRlREtNeFIzK3ZHNzd5VER3WkxIdzBRT1p4cDAvS1h2?=
 =?utf-8?B?Z2l2NStBS2R5SXN0dFBGTWU0Wi96bEFGUm5jVUs0bW9QVC96aFhKTE85V2pC?=
 =?utf-8?B?eWYrdlpmbWwyTnF0VDQrcVhITFhITnduanNFcDBJZzA2aUQvMXhBaEVsRTYz?=
 =?utf-8?B?WW1QbXNZcFg5d2dpUmJJd1FuUEtTdDN5M2tCZ1dtTi9CMWVzb2dKcmRtWmxB?=
 =?utf-8?B?dzJEMjZ3QVFsUzg5TzY2c2VWREFCYjdRMDF6STcwUm1sdEE4eUYzWG9rVjBD?=
 =?utf-8?B?aU90NVhGTUM2cDRPa1ZQQnlTV05EWldIdFpBUE52bzkyRDV4Mm1RZmNPTnNa?=
 =?utf-8?B?b3pFK3J3N2M5eldoNHlUcnJ4dk1kMnFFVnFFSElpZCtiMU9JOHpnYk1DQ3NR?=
 =?utf-8?B?R3FpeVdtQnNJK0pMNTB0a0xNRUtNcnBtSXZJbkJYbmk4cWR0b1EyU3F0ZDN1?=
 =?utf-8?B?MjYyR2FLVzBRdzFlYVJKZWVEZGRMYjA4THptWEpsVVdvdVJuc0huUTVmU0Zv?=
 =?utf-8?B?a1dabjZNVUFESEN6WWJNTCtnamRSeVBwOWIyYVpheHJ5UHdDcUZ5MmdkSjUv?=
 =?utf-8?B?bWdqYzZHRE8wOUhkQ280Nmk3Z0U5NGJSRlduSzJSMlF1USsxS3ZDaUxaZXR5?=
 =?utf-8?B?NU1Vdkcxc2srNDlhU2M3RExsZy9rMjFXOHY4TDQ4cmo4dTArU0JnYzBhUGFl?=
 =?utf-8?B?QjVtNkdPUmZFV3RLakxMSWNEdHNocXVtRkZuREVxQ0tpa1JsRXpYYzBTQ25S?=
 =?utf-8?B?YUNYeDVWVWpGRGdZbmVEMjdWU0c1SlBBYXZ5THhIV1hrU3NpRmlPUU0rclRX?=
 =?utf-8?B?ejhNQU9GNjN3b1VUYTRtYlg0Rmd6MnJ0Tm56UEtZK3U5S1JIeDFLUU5GYkZ6?=
 =?utf-8?B?aldCN1o1TmhyZ0pBRUk3ZHJmaEcxa2pTemNNSkh4Q1ZGUEc5SS9kR2RUbGtZ?=
 =?utf-8?B?aXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be5e8447-2f74-49eb-6169-08dda9dec27b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2025 18:27:16.6950 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 98MzSoNsm5Hgstjoj0UJ9u2FWODICj/omoxJVUYcoxpn1u523539WUfyALmiT9zuRBEPGw1YLB8H/q5O2Zs07Sts330wcFZi3KywmVQjxw0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7734
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

LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogSGFycmlzb24sIEpvaG4gQyA8am9obi5j
LmhhcnJpc29uQGludGVsLmNvbT4gDQpTZW50OiBUaHVyc2RheSwgSnVuZSAxMiwgMjAyNSAxMDo1
MCBBTQ0KVG86IENhdml0dCwgSm9uYXRoYW4gPGpvbmF0aGFuLmNhdml0dEBpbnRlbC5jb20+OyBJ
bnRlbC1YZUBMaXN0cy5GcmVlRGVza3RvcC5PcmcNClN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8yXSBk
cm0veGUvZ3VjOiBBZGQgc3VwcG9ydCBmb3IgTlBLIGFzIGEgR3VDIGxvZyB0YXJnZXQNCj4gDQo+
IE9uIDYvMTIvMjAyNSA3OjMyIEFNLCBDYXZpdHQsIEpvbmF0aGFuIHdyb3RlOg0KPiA+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogSGFycmlzb24sIEpvaG4gQyA8am9obi5j
LmhhcnJpc29uQGludGVsLmNvbT4NCj4gPiBTZW50OiBXZWRuZXNkYXksIEp1bmUgMTEsIDIwMjUg
NDo1NyBQTQ0KPiA+IFRvOiBDYXZpdHQsIEpvbmF0aGFuIDxqb25hdGhhbi5jYXZpdHRAaW50ZWwu
Y29tPjsgSW50ZWwtWGVATGlzdHMuRnJlZURlc2t0b3AuT3JnDQo+ID4gU3ViamVjdDogUmU6IFtQ
QVRDSCAyLzJdIGRybS94ZS9ndWM6IEFkZCBzdXBwb3J0IGZvciBOUEsgYXMgYSBHdUMgbG9nIHRh
cmdldA0KPiA+PiBPbiA2LzExLzIwMjUgMzowNCBQTSwgQ2F2aXR0LCBKb25hdGhhbiB3cm90ZToN
Cj4gPj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+PiBGcm9tOiBJbnRlbC14ZSA8
aW50ZWwteGUtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBKb2hu
LkMuSGFycmlzb25ASW50ZWwuY29tDQo+ID4+PiBTZW50OiBXZWRuZXNkYXksIEp1bmUgMTEsIDIw
MjUgMjowNiBQTQ0KPiA+Pj4gVG86IEludGVsLVhlQExpc3RzLkZyZWVEZXNrdG9wLk9yZw0KPiA+
Pj4gQ2M6IEhhcnJpc29uLCBKb2huIEMgPGpvaG4uYy5oYXJyaXNvbkBpbnRlbC5jb20+DQo+ID4+
PiBTdWJqZWN0OiBbUEFUQ0ggMi8yXSBkcm0veGUvZ3VjOiBBZGQgc3VwcG9ydCBmb3IgTlBLIGFz
IGEgR3VDIGxvZyB0YXJnZXQNCj4gPj4+PiBGcm9tOiBKb2huIEhhcnJpc29uIDxKb2huLkMuSGFy
cmlzb25ASW50ZWwuY29tPg0KPiA+Pj4+DQo+ID4+Pj4gVGhlIEd1QyBoYXMgYW4gb3B0aW9uIHRv
IHdyaXRlIGxvZyBkYXRhIHZpYSBOUEsuIFRoaXMgaXMgYmFzaWNhbGx5IGENCj4gPj4+PiBtYWdp
YyBJTyBhZGRyZXNzIHRoYXQgR3VDIHdyaXRlcyBhcmJpdHJhcnkgZGF0YSB0byBhbmQgd2hpY2gg
Y2FuIGJlDQo+ID4+Pj4gbG9nZ2VkIGJ5IGEgc3VpdGFibGUgaGFyZHdhcmUgbG9nZ2VyLiBUaGlz
IGNhbiBhbGxvdyByZXRyaWV2YWwgb2YgdGhlDQo+ID4+Pj4gR3VDIGxvZyBpbiBoYXJkd2FyZSBk
ZWJ1ZyBlbnZpcm9ubWVudHMgZXZlbiB3aGVuIHRoZSBzeXN0ZW0gYXMgYSB3aG9sZQ0KPiA+Pj4+
IGRpZXMgaG9ycmlibHkuDQo+ID4+Pj4NCj4gPj4+PiBTaWduZWQtb2ZmLWJ5OiBKb2huIEhhcnJp
c29uIDxKb2huLkMuSGFycmlzb25ASW50ZWwuY29tPg0KPiA+Pj4gU28sIHRoaXMgaXMgYmFzaWNh
bGx5IGEgbmV3IG1vZHBhcmFtIHZhbHVlIHRoYXQgcmVkaXJlY3RzIEd1QyBsb2dzIHRvDQo+ID4+
PiBhIHNwZWNpZmljIElPIGFkZHJlc3M/ICBJIHRha2UgaXQgZ3VjX2xvZ190YXJnZXQgPSAyIGlz
IHRoZSBkZWZhdWx0IHZhbHVlLCBhbmQNCj4gPj4+IGd1Y19sb2dfdGFyZ2V0ID0gMSB3b3VsZCBw
cmludCB0aGUgbG9ncyB0byBzdGRvdXQsIHRoZW4/ICBJJ2QgYXNrIHdoeSB3ZQ0KPiA+Pj4gdXNl
IDAgYXMgYSBkZWZhdWx0IHZhbHVlIGFuZCBub3QganVzdCBkZWZhdWx0IHRvIDIgYWxsIHRoZSB0
aW1lLCBidXQgSSB0aGluayBJDQo+ID4+PiBhbHJlYWR5IGtub3cgd2h5ICh3ZSBuZWVkIHRvIGd1
YXJkIGFnYWluc3QgZ3VjX2xvZ190YXJnZXQgPSAwIGFueXdheXMNCj4gPj4+IHRvIHByZXZlbnQg
cHJpbnRpbmcgdG8gc3RkaW4pLg0KPiA+PiBVbSwgcmVhZCB0aGUgcGF0Y2ggLSAiKDA9bWVtb3J5
IFtkZWZhdWx0XSwgMSA9IE5QSywgMiA9IG1lbW9yeSArIE5QSykiLg0KPiA+PiBUaGUgZGVmYXVs
dCBpcyB6ZXJvLiBBbmQgbm8sIG5vdGhpbmcgcHJpbnRzIHRvIHN0ZG91dC4gVGhpcyBpcyBhYm91
dA0KPiA+PiBoYXJkd2FyZSBsZXZlbCBkZWJ1Z2dpbmcuIEl0IGhhcyBub3RoaW5nIHRvIGRvIHdp
dGggc3RkaW4vc3Rkb3V0L3N0ZGVyci4NCj4gPj4gVGhvc2UgY29uY2VwdHMgZG8gbm90IGV4aXN0
IGluIGhhcmR3YXJlIG5vciBpbiB0aGUgS01ELiBJZiB5b3Ugc2VuZCB0aGUNCj4gPj4gR3VDIGxv
ZyB0byB0aGUgTlBLIHRhcmdldCB0aGVuIHlvdSBuZWVkIGEgaGFyZHdhcmUgZGVidWdnZXIgKEpU
QUcsIGV0Yy4pDQo+ID4+IHRvIHJlYWQgaXQsIGFzIGRlc2NyaWJlZCBpbiB0aGUgY29tbWl0IG1l
c3NhZ2UuDQo+ID4gQWgsIG9rYXkuICBXaGVuIEkgcmVhZCAiVGhpcyBpcyBiYXNpY2FsbHkgYSBt
YWdpYyBJTyBhZGRyZXNzIHRoYXQgR3VDIHdyaXRlcw0KPiA+IGFyYml0cmFyeSBkYXRhIHRvIiwg
SSB0aG91Z2h0IHRoYXQgd2FzIGluZGljYXRpbmcgdGhhdCB3ZSdyZSB3cml0aW5nIHRvIHRoZQ0K
PiA+IGluL291dC9lcnIgSU8gYWRkcmVzc2VzLCBhbmQgdGhhdCB0aGUgZGF0YSBiZWluZyBsb2dn
ZWQgImJ5IGEgc3VpdGFibGUNCj4gWW91IHNheSAidGhlIGluL291dC9lcnIgSU8gYWRkcmVzc2Vz
IiBsaWtlIHRoZXJlIGlzIHN1Y2ggYSB0aGluZy4gDQo+IEluL291dC9lcnIgZ2VuZXJhbGx5IHJl
ZmVycyB0byBzdGRpbi9zdGRvdXQvc3RkZXJyLCBiZWluZyB0aGUgZGVmYXVsdCANCj4gZmlyc3Qg
dGhyZWUgZmlsZSBoYW5kbGVzIG9mIGEgdW5peCBwcm9jZXNzLiBGaWxlIGhhbmRsZXMgYXJlIG5v
dCBJTyANCj4gYWRkcmVzc2VzLiBTdWNoIGZpbGUgaGFuZGxlcyBhbHNvIGRvIG5vdCBleGlzdCBp
biB0aGUga2VybmVsLiBBbmQgdGhleSANCj4gYWJzb2x1dGVseSBkbyBub3QgZXhpc3QgaW5zaWRl
IHRoZSBHVCBoYXJkd2FyZS4gTXkgY29tbWVudCB3YXMgcmVmZXJyaW5nIA0KDQpPa2F5LCByaWdo
dC4gIFRoZSBsYXN0IHRpbWUgdGhlIGRpc3RpbmN0aW9uIGJldHdlZW4gSS9PIGFzIGEgZGV2aWNl
IGNvbmNlcHQNCmFuZCBJL08gYXMgYW4gaW50ZXJmYWNlIGNvbmNlcHQgd2FzIHJlbGV2YW50IHRv
IG1lIHdhcyBhYm91dCA4IHllYXJzIGFnbywNCnNvIEkgY2FuIHVuZGVyc3RhbmQgaG93IEkgZ290
IGNvbmZ1c2VkIHRoZXJlLg0KDQo+IHRvIG1lbW9yeSBtYXBwZWQgSU8gYWRkcmVzc2VzLCBpLmUu
IGhhcmR3YXJlIHJlZ2lzdGVycy4gT24gYSBub3JtYWwgDQo+IHN5c3RlbSwgdGhlcmUgaXMgbm90
aGluZyBjb25uZWN0ZWQgdG8gc2FpZCBoYXJkd2FyZSBzbyB0aGUgbG9nZ2VkIG91dHB1dCANCj4g
Z29lcyBub3doZXJlLiBIb3dldmVyLCBpZiB5b3UgaGF2ZSBhIGhhcmR3YXJlIGRlYnVnZ2VyIGF0
dGFjaGVkIHRvIHRoZSANCj4gc3lzdGVtIHRoZW4gaXQgY2FuIHRyYXAgdGhvc2UgYWNjZXNzZXMg
YW5kIHJlY29yZCB0aGUgbG9nLg0KDQpZb3Uga25vdywgc29tZXRpbWVzIEkgZm9yZ2V0IHRoYXQg
dGhlIGludGVuZGVkIGN1c3RvbWVycyBmb3IgdGhlc2UNCnByb2R1Y3RzIGFyZSBtYWpvciBjb21w
YW5pZXMgdGhhdCBlbmQgdXAgc2hvdmluZyB0aGVzZSBjYXJkcyBpbnRvDQpnaWFudCBzZXJ2ZXIg
cmFja3MgYW5kIG5vdCBQQyB1c2VycyB3aXRoIHNjcmVlbnMgYW5kIGtleWJvYXJkcy4NCg0KPiAN
Cj4gPiBoYXJkd2FyZSBsb2dnZXIiIHdhcyBvY2N1cnJpbmcgc2VwYXJhdGVseS4gIEkgZ3Vlc3Mg
SSBhbHNvIHRob3VnaHQgTlBLDQo+ID4gd2FzIGEgd3JpdGluZyBwcm90b2NvbCBhbmQgbm90IGEg
aGFyZHdhcmUgYWRkcmVzcy4NCj4gTlBLIGlzIG5laXRoZXIgYSBwcm90b2NvbCBub3IgYW4gYWRk
cmVzcy4gSXQgaXMgYSBibG9jayBvZiBzaWxpY29uIA0KPiBjYWxsZWQgTm9ydGggUGVhaywgYWxz
byBrbm93biBhcyB0aGUgSW50ZWwgVHJhY2UgSHViLg0KDQoiVGhlIEd1QyBoYXMgYW4gb3B0aW9u
IHRvIHdyaXRlIGxvZyBkYXRhIHZpYSBOUEsuIFRoaXMgaXMgYmFzaWNhbGx5IGEgbWFnaWMgSU8g
YWRkcmVzcy4uLiINCg0KSWYgTlBLIGlzICJhIGJsb2NrIG9mIHNpbGljb24iIGFuZCBub3QgYW4g
SU8gYWRkcmVzcywgdGhlbiBwZXJoYXBzIHRoaXMgd291bGQgYmUgYmV0dGVyDQp3b3JkZWQgYXM6
DQoNCiJUaGUgR3VDIGhhcyB0aGUgb3B0aW9uIHRvIHdyaXRlIGxvZyBkYXRhIHRvIE5QSywgd2hp
Y2ggaXMgYmFzaWNhbGx5IGEgYmxvY2sgb2Ygc2lsaWNvbi4uLiINCg0KPiANCj4gPg0KPiA+IEl0
IGRpZG4ndCBvY2N1ciB0byBtZSB0aGF0IHdlJ2QgbmVlZCB0byBkaXJlY3RseSB3cml0ZSB0aGUg
bG9ncyB0byB0aGUNCj4gPiBoYXJkd2FyZSBsb2dnZXIgaW4gY2FzZXMgb2YgY2F0YXN0cm9waGlj
IGZhaWx1cmUgYmVjYXVzZSB3ZSBhbHJlYWR5IGhhdmUNCj4gPiBtZXRob2RzIG9mIHN0cmVhbWlu
ZyB0aGUgbG9ncyBkaXJlY3RseSB2aWEgdGhlIHNlcmlhbCBwb3J0cy4gIFRob3VnaCBJDQo+ID4g
c3VwcG9zZSB0aGF0IHdlJ3JlIHRhbGtpbmcgYWJvdXQgZGlmZmVyZW50ICJsb2dzIiBhdCB0aGlz
IHBvaW50Pw0KPiBJIGRvbid0IGtub3cgd2hhdCBsb2dzIHlvdSBhcmUgdGFsa2luZyBhYm91dC4g
VGhpcyBwYXRjaCBpcyBxdWl0ZSANCj4gY2xlYXJseSBvbmx5IHRhbGtpbmcgYWJvdXQgdGhlIEd1
QyBsb2cuIFdoaWNoIGlzIGdlbmVyYWxseSBhY2Nlc3NpYmxlIA0KPiB2aWEgZGVidWdmcyBzbmFw
c2hvdHMgb3IgYXMgcGFydCBvZiBhIGRldmNvcmVkdW1wIGNhcHR1cmUuDQo+IEl0IGlzIG5vdCBl
dmVyICdzdHJlYW1lZCBkaXJlY3RseSB2aWEgdGhlIHNlcmlhbCBwb3J0cycuDQoNCkkgd2FzIHJl
ZmVycmluZyB0byB0aGUgZG1lc2cgbG9ncyBhdCB0aGUgdGltZSwgdGhvdWdoIEkgd2lsbCBhZG1p
dCB0aGF0IEkgZm9yZ290DQp0aGVyZSB3ZXJlIGNsYXNzZXMgb2YgbG9ncyB0aGF0IG5ldmVyIGdl
dCBwcmludGVkIHRvIGRtZXNnLiAgSSBkb24ndA0KcGVyc29uYWxseSBhZ3JlZSB3aXRoIHRoZSBw
cmFjdGljZSBhbmQgdGhpbmsgdGhhdCBhbGwgcmVsZXZhbnQgbG9ncyBzaG91bGQNCmJlIHByaW50
ZWQgdG8gZG1lc2cgaWYgcG9zc2libGUsIGV2ZW4gaWYgb25seSBhdCBjZXJ0YWluIGRlYnVnIGxl
dmVscyBvcg0KdXBvbiBkaXJlY3QgcmVxdWVzdC4gIEhvd2V2ZXIsIEkgY2FuIGF0IGxlYXN0IHNl
ZSB3aHkgd2UnZCB3YW50IHRvIHN0b3JlIHRob3NlDQpzZXBhcmF0ZWx5IGluIHRoZSBOUEsgc2ls
aWNvbiBibG9jayBpbiBjYXNlIG9mIGNhdGFzdHJvcGhpYyBmYWlsdXJlIGdpdmVuIHRoZSBmaWxl
cw0KdGhleSBub3JtYWxseSBnZXQgc2F2ZWQgdG8gYXJlIHdpcGVkIG9uIHN5c3RlbSByZXNldC4N
Cg0KPiANCj4gSm9obi4NCj4gDQo+ID4NCj4gPiBUaGUgcmV2aWV3ZWQtYnkgc3RpbGwgc3RhbmRz
Lg0KPiA+IC1Kb25hdGhhbiBDYXZpdHQNCj4gPg0KPiA+Pj4gSSBhbHNvIHRha2UgaXQgdGhpcyBp
cyBtb2RpZmllZCBvbiBib290IGJ5LCBmb3IgZXhhbXBsZSwgd3JpdGluZw0KPiA+Pj4gInhlLmd1
Y19sb2dfdGFyZ2V0PTEiIHRvIENNRExJTkVfTElOVVhfREVGQVVMVCBhcyBhIHBhcnQgb2YgdGhl
IGdydWIgZmlsZS4NCj4gPj4gVGhhdCBpcyBnZW5lcmFsbHkgaG93IG1vZHVsZSBwYXJhbWV0ZXJz
IHdvcmsuIFlvdSBjYW4gYWxzbyBzZXQgdmlhDQo+ID4+IG1vZHByb2JlLmNvbmYgZmlsZXMgYXMg
bG9uZyBhcyB0aGUgWGUgZHJpdmVyIGlzIGEgbW9kdWxlIGFuZCBub3QNCj4gPj4gY29tcGlsZWQg
aW4uDQo+ID4+DQo+ID4+IEpvaG4uDQo+ID4+DQo+ID4+PiBZZWFoLCBzZWVtcyBnb29kLg0KPiA+
Pj4gUmV2aWV3ZWQtYnk6IEpvbmF0aGFuIENhdml0dCA8am9uYXRoYW4uY2F2aXR0QGludGVsLmNv
bT4NCj4gPj4+IC1Kb25hdGhhbiBDYXZpdHQNCj4gPj4+DQo+ID4+Pj4gLS0tDQo+ID4+Pj4gICAg
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Yy5jICAgIHwgNCArKysrDQo+ID4+Pj4gICAgZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX21vZHVsZS5jIHwgNCArKysrDQo+ID4+Pj4gICAgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX21vZHVsZS5oIHwgMSArDQo+ID4+Pj4gICAgMyBmaWxlcyBjaGFuZ2VkLCA5IGlu
c2VydGlvbnMoKykNCj4gPj4+Pg0KPiA+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfZ3VjLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjLmMNCj4gPj4+PiBpbmRleCBl
MTZkMTliNDRiY2MuLjljMGUzMTEzZjdkNSAxMDA2NDQNCj4gPj4+PiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3VjLmMNCj4gPj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Vj
LmMNCj4gPj4+PiBAQCAtMzUsNiArMzUsNyBAQA0KPiA+Pj4+ICAgICNpbmNsdWRlICJ4ZV9ndWNf
c3VibWl0LmgiDQo+ID4+Pj4gICAgI2luY2x1ZGUgInhlX21lbWlycS5oIg0KPiA+Pj4+ICAgICNp
bmNsdWRlICJ4ZV9tbWlvLmgiDQo+ID4+Pj4gKyNpbmNsdWRlICJ4ZV9tb2R1bGUuaCINCj4gPj4+
PiAgICAjaW5jbHVkZSAieGVfcGxhdGZvcm1fdHlwZXMuaCINCj4gPj4+PiAgICAjaW5jbHVkZSAi
eGVfc3Jpb3YuaCINCj4gPj4+PiAgICAjaW5jbHVkZSAieGVfdWMuaCINCj4gPj4+PiBAQCAtNzQs
NiArNzUsOSBAQCBzdGF0aWMgdTMyIGd1Y19jdGxfZGVidWdfZmxhZ3Moc3RydWN0IHhlX2d1YyAq
Z3VjKQ0KPiA+Pj4+ICAgIAllbHNlDQo+ID4+Pj4gICAgCQlmbGFncyB8PSBGSUVMRF9QUkVQKEdV
Q19MT0dfVkVSQk9TSVRZLCBHVUNfTE9HX0xFVkVMX1RPX1ZFUkJPU0lUWShsZXZlbCkpOw0KPiA+
Pj4+ICAgIA0KPiA+Pj4+ICsJaWYgKHhlX21vZHBhcmFtLmd1Y19sb2dfdGFyZ2V0KQ0KPiA+Pj4+
ICsJCWZsYWdzIHw9IEZJRUxEX1BSRVAoR1VDX0xPR19ERVNUSU5BVElPTiwgeGVfbW9kcGFyYW0u
Z3VjX2xvZ190YXJnZXQpOw0KPiA+Pj4+ICsNCj4gPj4+PiAgICAJcmV0dXJuIGZsYWdzOw0KPiA+
Pj4+ICAgIH0NCj4gPj4+PiAgICANCj4gPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX21vZHVsZS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21vZHVsZS5jDQo+ID4+Pj4g
aW5kZXggMWM0ZGZhZmJjZDBiLi5mYzhjNjgxODE5YjkgMTAwNjQ0DQo+ID4+Pj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX21vZHVsZS5jDQo+ID4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX21vZHVsZS5jDQo+ID4+Pj4gQEAgLTIxLDYgKzIxLDcgQEANCj4gPj4+PiAgICBzdHJ1
Y3QgeGVfbW9kcGFyYW0geGVfbW9kcGFyYW0gPSB7DQo+ID4+Pj4gICAgCS5wcm9iZV9kaXNwbGF5
ID0gdHJ1ZSwNCj4gPj4+PiAgICAJLmd1Y19sb2dfbGV2ZWwgPSAzLA0KPiA+Pj4+ICsJLmd1Y19s
b2dfdGFyZ2V0ID0gMCwNCj4gPj4+PiAgICAJLmZvcmNlX3Byb2JlID0gQ09ORklHX0RSTV9YRV9G
T1JDRV9QUk9CRSwNCj4gPj4+PiAgICAjaWZkZWYgQ09ORklHX1BDSV9JT1YNCj4gPj4+PiAgICAJ
Lm1heF92ZnMgPSBJU19FTkFCTEVEKENPTkZJR19EUk1fWEVfREVCVUcpID8gfjAgOiAwLA0KPiA+
Pj4+IEBAIC00NSw2ICs0Niw5IEBAIE1PRFVMRV9QQVJNX0RFU0ModnJhbV9iYXJfc2l6ZSwgIlNl
dCB0aGUgdnJhbSBiYXIgc2l6ZSAoaW4gTWlCKSAtIDwwPWRpc2FibGUtcmVzDQo+ID4+Pj4gICAg
bW9kdWxlX3BhcmFtX25hbWVkKGd1Y19sb2dfbGV2ZWwsIHhlX21vZHBhcmFtLmd1Y19sb2dfbGV2
ZWwsIGludCwgMDYwMCk7DQo+ID4+Pj4gICAgTU9EVUxFX1BBUk1fREVTQyhndWNfbG9nX2xldmVs
LCAiR3VDIGZpcm13YXJlIGxvZ2dpbmcgbGV2ZWwgKDA9ZGlzYWJsZSwgMS4uNT1lbmFibGUgd2l0
aCB2ZXJib3NpdHkgbWluLi5tYXgpIik7DQo+ID4+Pj4gICAgDQo+ID4+Pj4gK21vZHVsZV9wYXJh
bV9uYW1lZChndWNfbG9nX3RhcmdldCwgeGVfbW9kcGFyYW0uZ3VjX2xvZ190YXJnZXQsIGludCwg
MDYwMCk7DQo+ID4+Pj4gK01PRFVMRV9QQVJNX0RFU0MoZ3VjX2xvZ190YXJnZXQsICJHdUMgZmly
bXdhcmUgbG9nZ2luZyB0YXJnZXQgKDA9bWVtb3J5IFtkZWZhdWx0XSwgMSA9IE5QSywgMiA9IG1l
bW9yeSArIE5QSykiKTsNCj4gPj4+PiArDQo+ID4+Pj4gICAgbW9kdWxlX3BhcmFtX25hbWVkX3Vu
c2FmZShndWNfZmlybXdhcmVfcGF0aCwgeGVfbW9kcGFyYW0uZ3VjX2Zpcm13YXJlX3BhdGgsIGNo
YXJwLCAwNDAwKTsNCj4gPj4+PiAgICBNT0RVTEVfUEFSTV9ERVNDKGd1Y19maXJtd2FyZV9wYXRo
LA0KPiA+Pj4+ICAgIAkJICJHdUMgZmlybXdhcmUgcGF0aCB0byB1c2UgaW5zdGVhZCBvZiB0aGUg
ZGVmYXVsdCBvbmUiKTsNCj4gPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X21vZHVsZS5oIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21vZHVsZS5oDQo+ID4+Pj4gaW5kZXgg
NWEzYmZlYThiN2I0Li40ZDk3OGY2ZjI2YjYgMTAwNjQ0DQo+ID4+Pj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX21vZHVsZS5oDQo+ID4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X21vZHVsZS5oDQo+ID4+Pj4gQEAgLTE0LDYgKzE0LDcgQEAgc3RydWN0IHhlX21vZHBhcmFtIHsN
Cj4gPj4+PiAgICAJYm9vbCBwcm9iZV9kaXNwbGF5Ow0KPiA+Pj4+ICAgIAl1MzIgZm9yY2VfdnJh
bV9iYXJfc2l6ZTsNCj4gPj4+PiAgICAJaW50IGd1Y19sb2dfbGV2ZWw7DQo+ID4+Pj4gKwlpbnQg
Z3VjX2xvZ190YXJnZXQ7DQo+ID4+Pj4gICAgCWNoYXIgKmd1Y19maXJtd2FyZV9wYXRoOw0KPiA+
Pj4+ICAgIAljaGFyICpodWNfZmlybXdhcmVfcGF0aDsNCj4gPj4+PiAgICAJY2hhciAqZ3NjX2Zp
cm13YXJlX3BhdGg7DQo+ID4+Pj4gLS0gDQo+ID4+Pj4gMi40OS4wDQo+ID4+Pj4NCj4gPj4+Pg0K
PiA+Pg0KPiANCj4gDQo=
