Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8F9CCD19D
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 11:11:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 230DF10E1D0;
	Wed, 18 Sep 2024 11:11:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UY2jbnvL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA17A10E1D0
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Sep 2024 11:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726657873; x=1758193873;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0ob3bbYbHml5pvI0rNpJnyCkXYPjTyBwIPw/ielEaSg=;
 b=UY2jbnvLqtswuBi5riOw4oljpmbwIx/xnJc8F8npHYc8lYHEZH2Tv1Zo
 Sa0J21ryxdc7HlX4TZScZqls57z72KrjG5PZMw9SnmDgrxS4B7Rex47sl
 zQb2wh9ZAu/yd8vaJ/30AAUNP1Dxv32dyeJ1Qy6eZ9yfSkdyKUV4Me5sG
 NhZPZ/1/DI2gry3yITZVHvCgPWPE85Sd94vqO7gaglAwHvE0VN7OGgFNF
 7TDX6AtEHtCtLDyMfRKfFn8G94oa6EVF7uPOBGgW4aV0wGdYvbPAB8NpF
 wwsL57gOEFCuSIH78+1G3Zu9Q6O3FrjnSf8I+kR++29/6GCrwe70reC5j w==;
X-CSE-ConnectionGUID: p8wq22asRV6WnqLXFiS+tQ==
X-CSE-MsgGUID: FDXkUxyCR8CM53/MU+o3Gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="13573081"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="13573081"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 04:11:13 -0700
X-CSE-ConnectionGUID: PS9geTSvQ66cF05VSxz/Ug==
X-CSE-MsgGUID: d4PHaXlyT3mI68+QIWjHfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="100338278"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2024 04:11:13 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 04:11:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 04:11:12 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 18 Sep 2024 04:11:12 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 18 Sep 2024 04:11:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rOHP4YYOgArgk4b+EjbNbi5peK1g61FmSUfHgV3zCvn0X+ch/FgCZ0jhlDzHssqDC7/xpKX3F1V9iMc0iKuu991/u8uy+W1MWIXkLD52cN1vPr/ciqJC/+wf1F7gueMgSH616CNgFYJiUDqoKR7WEnzCNf0OhQm1tjMY97NEy+HLEtve9Qr/1d6pf/neQaMVaroHhmZCNBNi5c93EUhnjzrZlAqiQeqdbGmpojpLE+AeZQtETVFZG3U491MDpHRIyBDQSJ3KzAPSrkKp7kfRujobV5mSzzlDC0Jjlin0R7kcMB1Iu2HN42xq7ZddZ/0J/t/v4Ks4yls+yJTuYeJfKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ob3bbYbHml5pvI0rNpJnyCkXYPjTyBwIPw/ielEaSg=;
 b=pKpY2XRWWQVmfBkno12A3k/eSYc6AwDI3RE9Kxel26g10xEQPLkmW0NyNATdK1huIl1VDxX5JzHXqNFWlsNOuQJtdFwPsuDPmWG72Lt/K7oK0qR9tm9x8kN1XJ/6mOGm80498L3KD913L09GfGPorgeF8xsyY6HJP4rvquzeTQqDsrqhZDl4ivZnE5/AUMRnEPG34Fi43TbilV3Pu77NF5KyeWhhw3ZYASt7W8OJGpnPOuSYAO+950nEcwnsNycbsXr9cfTFWstyPq268sIHZmS6/yGyoCtcedURzMgkM1iL3BdJNA0nTMQUJZrh79gFcYzzFU/9uNFiZwdvVBUusw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by CH3PR11MB8342.namprd11.prod.outlook.com (2603:10b6:610:167::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.17; Wed, 18 Sep
 2024 11:11:10 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 11:11:10 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH] drm/xe: Decrement client count immediately on file close
Thread-Topic: [PATCH] drm/xe: Decrement client count immediately on file close
Thread-Index: AQHbCaEPPmFS3sVFGUKU+fz+xX0tYrJdSZ6AgAAHCoCAABK54A==
Date: Wed, 18 Sep 2024 11:11:10 +0000
Message-ID: <SJ1PR11MB6204F9F42C3C6C7344C4777A81622@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240918081150.280055-1-balasubramani.vivekanandan@intel.com>
 <SJ1PR11MB6204E9E9031470ED7D32AF5281622@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <ZuqlWzSaEso1RgI1@bvivekan-mobl1>
In-Reply-To: <ZuqlWzSaEso1RgI1@bvivekan-mobl1>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|CH3PR11MB8342:EE_
x-ms-office365-filtering-correlation-id: 5886a70c-aba4-471d-6c7b-08dcd7d29a01
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WnRSOTAwN2tkd3pZRjNtTE9NMityUFF3bzd4b240YWUzN1Z3U2pnR0xIdkJu?=
 =?utf-8?B?NUpIWkd6OUkyZXhudCtJYVM0dk1CamI4Vjg5QmsvQ09aM29jS2cyYlp6Q1pL?=
 =?utf-8?B?bFlQdXJnUzlRdzU0bXZFTWJ5MHNxVWZzZndSeFJhVU9jLytBcnp6K2pSTmRO?=
 =?utf-8?B?VWdZdjh1VlNyb2ZaZ1Y5NExNcDB0djB0TGt4VkNZV0JOODIrT2ltZDlNN0NY?=
 =?utf-8?B?MXVoWmlrUzI0V3owVG1rcVNHYkhTYXN2MzMwMTVvYzFXSHhiS2pJTkJnWjBx?=
 =?utf-8?B?UDJ5eWR5K2RFRWJUeVVVcGtSZHlIQWJ5SUJHaWttTzlzVVJZaVhBdnZDaXY0?=
 =?utf-8?B?aFZsRUxiNmxGOC9GVHY4OW8xdlc3SFllbG0yc3hHOXk4Wlh0YnFHQlRENldh?=
 =?utf-8?B?N2NBTWhET3F3dm9yeVhDQTF4dE5QeXF4R0hBM1RNN0RLT0pHMEFyL1RlWkM0?=
 =?utf-8?B?S3dvRi9rYW5DVTREOWkxR3dpVER1bUYyOW1QcURpdk9OSWVxWkl6MG5adUVL?=
 =?utf-8?B?MUpUTVBmSnhxOFhhdkllejdwbWMzcUJIUlViNFM1b2NWUlZGeUlpNzVaY2JR?=
 =?utf-8?B?V3pSRTFSQ0ZWTGFHNElOM1U4TjNFTTU2VnZLYkgwRW9wNGdPcEloNDBsZTRI?=
 =?utf-8?B?Uk9JM3NScUhjRjZQODBjWk5CNll4RmpzSjUrYkluT3dFeFVibDYycmh4R3Ez?=
 =?utf-8?B?UUxLZkxwbXRGOElIRG1aWGxzREpzZnlVRnhMbHFmbitIaFZtbEtjSzVTVFJ3?=
 =?utf-8?B?MFdtUFVGcEdjSFh0NS9KU3BaVGlHV3h4WG00M2Y2aG9ObkFuWUNlTFZFVUJE?=
 =?utf-8?B?N3pJUWg1bDF6Y3VzenpJYXVzTldsWnJQbjRDdUpYQmsvUnpKNnU0QUsrSG04?=
 =?utf-8?B?aU01R05tekFSS1A0c1dyUGFCWmNDQi9tTVhmRjRMMnJ6bEI3aTRxeDFsaEc5?=
 =?utf-8?B?aUhFNG5ZOEYvMXRqbWlhSGR4SlVIOVgwcEFrbkxJaWM2N3dGTy9UNm9adG43?=
 =?utf-8?B?aExQOWtPR0NqYVFxQlQ4SUJnVFlPTVRYNWV3eEs0anBFQUNIVDgwV2NGb2Yy?=
 =?utf-8?B?Lzh4ZzVxRXBmU3ZmODQ0TUNCRkN3SXBpQS8yOHVGaTJsU2hJWEpENHRCZ01p?=
 =?utf-8?B?VWFGYW15M1FIcFovU0RUQWU3VWZqcU81dmdFdkE1TGl1NzVhTVFyM0FYdVhk?=
 =?utf-8?B?L0hCMHVqNm9acTRvMXIxNGswbUdkTXd0dnZnejF1OXpxZXBVdVJaRndrTVRZ?=
 =?utf-8?B?STFRSEc0aWoyREduWG5Db0ZNMnllWHM2c0tXT1cwUXA3bTNaRlhUK0dYaEoz?=
 =?utf-8?B?dDAvbFB1a21UOFdmNjdnS3BuSTIvQldXemJWQks5N0VYeS9JbEVYUTJNaHpw?=
 =?utf-8?B?Vml3QjN4MmZGb0hiUjQ5YkM0djFwRGgwWWhRaStlb0dSclNoSk1NQzBSZWpP?=
 =?utf-8?B?UThzcnhqTVBTMmVHcktMcTZFYTV1LzVvckwremZKd1J2Wlhzb1AyRStoeGUr?=
 =?utf-8?B?c2JJOGN0VXdkeEZvTUZZbmIrc2ZYNnZHdnhUMUNRVWY5dGNnWkZObFpyQldv?=
 =?utf-8?B?aEhqMG9pUVdiamtxUGtuZ3E4djFzU1NXWDhkU2dFdjlrQUlpd2FKRlRqMVll?=
 =?utf-8?B?b05jeUEzUGo1SlRZUzJzZ3VrSTFvMytZWkFGMWZxQVlzZE5hR1VYUmVnUmtk?=
 =?utf-8?B?eFkvZ0N1WCt4b1l6L09PYkRraGxxaWY3YUNUOUlzSHhkblVIV2dmN1JNalNp?=
 =?utf-8?B?MXl6c2IyUlJ6R1pjYVF3dzNqb0hyWjNwUTNxU3VGbndkLzhMUCtSM1VySDRQ?=
 =?utf-8?B?akpGY00yWjluV2hNSU5WZnBwQVdkTUkxQVAyLys5RFQwcjNubERjTytxa1hF?=
 =?utf-8?B?My9XSFpWcXowbWdoRDk3SCtRdy9reC9zT0hTN2JCV2tjNWc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VmswS2dWWVdhUGhqY2RQOU1ZeEtCNjcwSkZXWVlCWTZibmlzT3FBKzYzR08v?=
 =?utf-8?B?azNXNkNkRDhuc0l2NmIyLzZSMGI2cUxEVG1ldkNVQ1hEcisvVS9lN0ozMmVV?=
 =?utf-8?B?Ym13eU1KZEEzUkRKaUZkOTV1Qk9lWFUvb1ZoWm9WNG85TnFicTF4a0hsWXFu?=
 =?utf-8?B?aE5lQnphSE5DWHF6b0NocC9obUY4bkVSdm1RL3FUOHdJNFdXQklyZzRpcUpu?=
 =?utf-8?B?VGVnR21uYnNwM1U1Q1VCTmdncldqdHk5NGNtRURiYnI5OGprSlBpUDY1T3NX?=
 =?utf-8?B?NUJNZTJVcm1obTJIOEc0T0tyRjJsTHl6WFFrV2lheTlFSksydHZXaDJNZi90?=
 =?utf-8?B?K2h6Z1QwSkFCL0JuUmRHcXVhcGlzKzZhQUJKaUNITVh3TlRCUHF4ViswNkdr?=
 =?utf-8?B?SW0wYTVxYUdvd0QraC9ua0VNSnJnN3JpR2x0R1BSUEhDRnRkbEVpSzdKV0NE?=
 =?utf-8?B?YXdodTJhb0xoSWFHRUM2ZUhzSHh6Y2pnRWY0L1VkaHE3T3RRNXBuLzhsR29r?=
 =?utf-8?B?RGRSa1V4MkNaMGpXbUxUQ0grclZISGdxRWVpWURLSmtkdmF6R0JlcTUwVTFZ?=
 =?utf-8?B?dnJkcTZFTERJWVdHY3JWNXdCTGlIV2NLNjZzZ2MwVzlrSFpqcUk5LzhmanBQ?=
 =?utf-8?B?ZFFaVDZLeHBDTkZVakFpMEZ2VkZGcmV1dGc1NzFwQ01aU3NiRGtZQkMvUnNz?=
 =?utf-8?B?Wk1DSHQwNnBLWXJ5QmZGN2x4eGRYNmg1ZzZCWnhxWWFCWkUxc3VOUC8yOWF6?=
 =?utf-8?B?b3l5MVQ0Y2NjWmJsbzVFSXdScmpVd2d4YU5WM1lTMzBlTnAvS0xUQ3VhdEF2?=
 =?utf-8?B?QmlGckFvZm5WWHFiOVl4b0RqMVZtMm4wc3JZQlYrQVpTVFNHQldmTERHK1Bm?=
 =?utf-8?B?cmJsaXpOblIxRjRLWmZ5Y3BEL1B0U2Q2L3pxT2VXNkkxZmpYSXg4UjJ6Mk5s?=
 =?utf-8?B?YVFyd3R3NGxtVGhkREQ1TUJteWdUbHdsYmhRM2I3NUtTZzd1aWlyVHR0K0sw?=
 =?utf-8?B?dFZjd1YyS2M5dWczNkp1bVp1NXNwMDY3TUJvTVR0U0V1cllLeGRyVFE1Ykpk?=
 =?utf-8?B?RlNDbnlJUXNQWHVpOEdkaGRPdzh5cU00T2Zkd3Y2Ums2dmc3TGhnSHBnWkUz?=
 =?utf-8?B?ZkVHZU1GVkpubGFIdTlrV1hxNTJFdzRvZEp5YVowZHpocXdRRVJsdmt3MG9k?=
 =?utf-8?B?ZU1uL2l2ZmlCZ3Zta3l3NVpEc0JoQkNaWi9iTmN4Q1BGa21UcTZsVEhZd3VH?=
 =?utf-8?B?U1BhYnZYYklvd1h6QzBiZkVFZUlWUVJOeUlPZDBYazhWMXFTYUw2TG9Qb0lK?=
 =?utf-8?B?Q2Fsb2lqOFRiSGJScWpCbDIvT0xJQWo2SklPaVlPVi9kbktqQmF5ZmR1dFJl?=
 =?utf-8?B?QW5iSjdzYm5KdjJPRHNiLzJvRjl0ek1NRXBzUFRGaU1keGpmeFkrYWJXOTJ2?=
 =?utf-8?B?OHhNRTAva2F6SEt0T1ZOZHBwdXE0YVU3NnV6N0xZaFpWdC96eTllMlB4amZ6?=
 =?utf-8?B?eGI2dHI2b1hqQ2QycXg1Tm9BRmRtWGtMblZhZlhBOExJZ1lLU3NmQy92SXFr?=
 =?utf-8?B?d1hQS055blc1RGNtWnI4MlAzMHpYQUV4akZNblBaaHgrM29XVFlqU3NpamtW?=
 =?utf-8?B?dktRZ1JNZUxqeEVSZVVndWVKSWtCUlkxZ2owT0p2dHJWaUdvOHhlVEZ6RTln?=
 =?utf-8?B?RWk4ZVJBeUttbHdWUFhkRlBGSWJ6TFRSaCtiWHJoZFZSMm1kbGJFaUFVREUw?=
 =?utf-8?B?WmdCNUNkMGMyWTZ6dmI4Z2hibEUvVUZzSmU2UjFxbExWZXdrZE1EWUlkN2k3?=
 =?utf-8?B?dEZuM21QUWhXQzYyZVdTT1A0c2JMNlJ3RURRaytTQngxVUNZNGJ6OFFNWlFq?=
 =?utf-8?B?MURwdG9FQWlBMjl0RURxWjBPUnR4YkVDRkc1L2RjZ2JjdHdwSWFtR0Y3alZk?=
 =?utf-8?B?U3NVNnZZdjZHOGFvYlNyZDJYNVR4dmQ1NUFSRnJiQVFzUGdQVTFWK0FwSzJU?=
 =?utf-8?B?dG9IaUd2TjhVVEUvVEVoT3NLQlAvRExJenpFQllYemNqanRtRzByU2NEWS90?=
 =?utf-8?B?Y3dwWTlla09jckVhSndzdHVKRGZLL1NwTmdOaExJUkRaQVBjbDZsemRUTys4?=
 =?utf-8?Q?CLS8zfHanV64zz4wXs+Noh7qs?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5886a70c-aba4-471d-6c7b-08dcd7d29a01
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2024 11:11:10.6352 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lOTSdlFuf5ciEFIlnuIoKpVWzqSfA1ps3Til5QdfNk9yIQzl5RiGf98B5qblixbm7XCuAKM8NjT4PUJZBIEhiBS9jeylxBywfX1cN+oPT9M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8342
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVml2ZWthbmFuZGFuLCBC
YWxhc3VicmFtYW5pDQo+IDxiYWxhc3VicmFtYW5pLnZpdmVrYW5hbmRhbkBpbnRlbC5jb20+DQo+
IFNlbnQ6IFdlZG5lc2RheSwgU2VwdGVtYmVyIDE4LCAyMDI0IDM6MzMgUE0NCj4gVG86IFVwYWRo
eWF5LCBUZWphcyA8dGVqYXMudXBhZGh5YXlAaW50ZWwuY29tPjsgaW50ZWwtDQo+IHhlQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogTmVybGlnZSBSYW1hcHBhLCBVbWVzaCA8dW1lc2gubmVy
bGlnZS5yYW1hcHBhQGludGVsLmNvbT47DQo+IFZpc2h3YW5hdGhhcHVyYSwgTmlyYW5qYW5hIDxu
aXJhbmphbmEudmlzaHdhbmF0aGFwdXJhQGludGVsLmNvbT47IERlDQo+IE1hcmNoaSwgTHVjYXMg
PGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL3hl
OiBEZWNyZW1lbnQgY2xpZW50IGNvdW50IGltbWVkaWF0ZWx5IG9uIGZpbGUgY2xvc2UNCj4gDQo+
IE9uIDE4LjA5LjIwMjQgMTU6MDksIFVwYWRoeWF5LCBUZWphcyB3cm90ZToNCj4gPg0KPiA+DQo+
ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogSW50ZWwteGUgPGlu
dGVsLXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4gPiA+
IEJhbGFzdWJyYW1hbmkgVml2ZWthbmFuZGFuDQo+ID4gPiBTZW50OiBXZWRuZXNkYXksIFNlcHRl
bWJlciAxOCwgMjAyNCAxOjQyIFBNDQo+ID4gPiBUbzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnDQo+ID4gPiBDYzogTmVybGlnZSBSYW1hcHBhLCBVbWVzaCA8dW1lc2gubmVybGlnZS5y
YW1hcHBhQGludGVsLmNvbT47DQo+ID4gPiBWaXNod2FuYXRoYXB1cmEsIE5pcmFuamFuYSA8bmly
YW5qYW5hLnZpc2h3YW5hdGhhcHVyYUBpbnRlbC5jb20+OyBEZQ0KPiA+ID4gTWFyY2hpLCBMdWNh
cyA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPjsgVml2ZWthbmFuZGFuLA0KPiA+ID4gQmFsYXN1
YnJhbWFuaSA8YmFsYXN1YnJhbWFuaS52aXZla2FuYW5kYW5AaW50ZWwuY29tPg0KPiA+ID4gU3Vi
amVjdDogW1BBVENIXSBkcm0veGU6IERlY3JlbWVudCBjbGllbnQgY291bnQgaW1tZWRpYXRlbHkg
b24gZmlsZQ0KPiA+ID4gY2xvc2UNCj4gPiA+DQo+ID4gPiBEZWNyZW1lbnQgdGhlIGNsaWVudCBj
b3VudCBpbW1lZGlhdGVseSBvbiBmaWxlIGNsb3NlLiBJdCBpcyBub3QNCj4gPiA+IHJlcXVpcmVk
IHRvIGJlIGRlZmVycmVkIHRvIHRoZSByZXNvdXJjZSBjbGVhbnVwIGZ1bmN0aW9uLiBPdGhlcndp
c2UNCj4gPiA+IHRoZXJlIHdpbGwgYmUgYSBzbWFsbCB0aW1lIHdpbmRvdywgd2hlcmUgdGhlcmUg
d2lsbCBiZSBhIG5vbi16ZXJvDQo+ID4gPiBjbGllbnQgY291bnQgZXZlbiBhZnRlciBjbG9zaW5n
IGFsbCBvcGVuIGZpbGUgaGFuZGxlcy4NCj4gPiA+IFRoaXMgYWZmZWN0cyBjY3NfbW9kZSh4ZV9j
b21wdXRlKSBpZ3QgdGVzdHMgYXMgdGhlc2UgdGVzdHMgdHJ5IHRvDQo+ID4gPiBjaGFuZ2UgdGhl
IGNjc19tb2RlIGltbWVkaWF0ZWx5IGFmdGVyIGNsb3NpbmcgYWxsIGZpbGUgaGFuZGxlcywgYnV0
DQo+ID4gPiB0aGUgZHJpdmVyIHJlamVjdHMgdGhlIGNjc19tb2RlIGNoYW5nZSByZXF1ZXN0IGFz
IGl0IHNlZXMgYSBub24temVybyBjbGllbnQNCj4gY291bnQuDQo+ID4gPg0KPiA+ID4gRml4ZXM6
IGNlOGMxNjFjYmFkNCAoImRybS94ZTogQWRkIHJlZiBjb3VudGluZyBmb3IgeGVfZmlsZSIpDQo+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBCYWxhc3VicmFtYW5pIFZpdmVrYW5hbmRhbg0KPiA+ID4gPGJh
bGFzdWJyYW1hbmkudml2ZWthbmFuZGFuQGludGVsLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gIGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYyB8IDkgKysrKy0tLS0tDQo+ID4gPiAgMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gPiA+DQo+ID4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jDQo+ID4gPiBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYyBpbmRleCA0ZDNjNzk0ZjEzNGMuLjNiY2NlYTYyMTJm
Zg0KPiA+ID4gMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNl
LmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYw0KPiA+ID4gQEAg
LTEwNywxNyArMTA3LDEyIEBAIHN0YXRpYyBpbnQgeGVfZmlsZV9vcGVuKHN0cnVjdCBkcm1fZGV2
aWNlDQo+ID4gPiAqZGV2LCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUpICBzdGF0aWMgdm9pZCB4ZV9m
aWxlX2Rlc3Ryb3koc3RydWN0IGtyZWYgKnJlZikgIHsNCj4gPiA+ICAJc3RydWN0IHhlX2ZpbGUg
KnhlZiA9IGNvbnRhaW5lcl9vZihyZWYsIHN0cnVjdCB4ZV9maWxlLCByZWZjb3VudCk7DQo+ID4g
PiAtCXN0cnVjdCB4ZV9kZXZpY2UgKnhlID0geGVmLT54ZTsNCj4gPiA+DQo+ID4gPiAgCXhhX2Rl
c3Ryb3koJnhlZi0+ZXhlY19xdWV1ZS54YSk7DQo+ID4gPiAgCW11dGV4X2Rlc3Ryb3koJnhlZi0+
ZXhlY19xdWV1ZS5sb2NrKTsNCj4gPiA+ICAJeGFfZGVzdHJveSgmeGVmLT52bS54YSk7DQo+ID4g
PiAgCW11dGV4X2Rlc3Ryb3koJnhlZi0+dm0ubG9jayk7DQo+ID4gPg0KPiA+ID4gLQlzcGluX2xv
Y2soJnhlLT5jbGllbnRzLmxvY2spOw0KPiA+ID4gLQl4ZS0+Y2xpZW50cy5jb3VudC0tOw0KPiA+
ID4gLQlzcGluX3VubG9jaygmeGUtPmNsaWVudHMubG9jayk7DQo+ID4gPiAtDQo+ID4gPiAgCXhl
X2RybV9jbGllbnRfcHV0KHhlZi0+Y2xpZW50KTsNCj4gPiA+ICAJa2ZyZWUoeGVmLT5wcm9jZXNz
X25hbWUpOw0KPiA+ID4gIAlrZnJlZSh4ZWYpOw0KPiA+ID4gQEAgLTE3OCw2ICsxNzMsMTAgQEAg
c3RhdGljIHZvaWQgeGVfZmlsZV9jbG9zZShzdHJ1Y3QgZHJtX2RldmljZQ0KPiA+ID4gKmRldiwg
c3RydWN0IGRybV9maWxlICpmaWxlKQ0KPiA+ID4NCj4gPiA+ICAJeGVfZmlsZV9wdXQoeGVmKTsN
Cj4gPiA+DQo+ID4gPiArCXNwaW5fbG9jaygmeGUtPmNsaWVudHMubG9jayk7DQo+ID4gPiArCXhl
LT5jbGllbnRzLmNvdW50LS07DQo+ID4gPiArCXNwaW5fdW5sb2NrKCZ4ZS0+Y2xpZW50cy5sb2Nr
KTsNCj4gPg0KPiA+IFRoZSBmaWxlX2Nsb3NlIGhlcmUgaXMgc3ljaHJvbnVzIGFuZCBzZXJpYWxp
emVkIGNhbGwgd2l0aCByZXNwZWN0IHRvDQo+IHVzZXJzcGFjZS4gQW55IHNldHRpbmdzIGRvbmUg
dGhyb3VnaCBzeXNmcyBwb3N0IGZpbGVfY2xvc2Ugc2hvdWxkIG5vdCByZXF1aXJlZA0KPiB0aGlz
IGNoYW5nZSBhcyBmYXIgYXMgSSBrbm93LiBXb3VsZCBwbGVhc2UgZXhwbGFpbiBzY2VuYXJpbyBi
ZXR0ZXI/DQo+IA0KPiBJbiB0aGUgY3VycmVudCBjb2RlLCB0aGUgY2xpZW50IGNvdW50IGlzIGRl
Y3JlbWVudGVkIGluIHRoZSBmdW5jdGlvbg0KPiB4ZV9maWxlX2Rlc3Ryb3kgd2hpY2ggaXMgbm90
IGludm9rZWQgc3luY2hyb25vdXNseSBmcm9tIHhlX2ZpbGVfY2xvc2UuDQo+IEl0IGlzIGNhbGxl
ZCB3aGVuIGFsbCByZWZlcmVuY2VzIHRvIHhlX2ZpbGUgYXJlIGxvc3QuDQo+IFJlZmVyZW5jZXMg
dG8geGVfZmlsZSBhcmUgaGVsZCBkdXJpbmcgY3JlYXRpb24gb2Ygdm0gYW5kIGV4ZWNfcXVldWVz
LiBTbyB0aGUNCj4gc29tZWJvZHkgbWlnaHQgc3RpbGwgYmUgaG9sZGluZyByZWZlcmVuY2UgdG8g
eGVfZmlsZSB3aGlsZSB4ZV9maWxlX2Nsb3NlIGlzDQo+IGNhbGxlZC4gVGhlcmVmb3JlIHRoZSBp
bnZvY2F0aW9uIG9mIHhlX2ZpbGVfZGVzdHJveSBtaWdodCBiZSBkZWZlcnJlZC4NCj4gQXMgb2Yg
cmVzdWx0LCBkcml2ZXIgbWlnaHQgc2VlIGEgbm9uLXplcm8gY2xpZW50IGNvdW50IGV2ZW4gYWZ0
ZXIgYWxsIGZpbGUgaGFuZGxlcw0KPiBhcmUgYWN0dWFsbHkgY2xvc2VkIHdoaWNoIGlzIGluY29y
cmVjdC4gV2UgY2FuIGRlZmVyIG9ubHkgdGhlIGZyZWVpbmcgb2YNCj4gcmVzb3VyY2VzIHRvIHhl
X2ZpbGVfZGVzdHJveSBidXQgdGhlIGNsaWVudCBjb3VudCBjYW4gYmUgaW1tZWRpYXRlbHkgYWRq
dXN0ZWQNCj4gaW4geGVfZmlsZV9jbG9zZS4NCg0KSWYgd2hvZXZlciBoYXMgaG9sZCByZWYsIG1p
Z2h0IHN0aWxsIHVzZSBjY3MsIHdoeSB3b3VsZCB3ZSBhbGxvdyBjaGFuZ2luZyBjY3MgbW9kZSBp
biB0aGF0IGNhc2UhDQoNClRlamFzDQo+IA0KPiBSZWdhcmRzLA0KPiBCYWxhDQo+ID4NCj4gPiBU
ZWphcw0KPiA+ID4gKw0KPiA+ID4gIAl4ZV9wbV9ydW50aW1lX3B1dCh4ZSk7DQo+ID4gPiAgfQ0K
PiA+ID4NCj4gPiA+IC0tDQo+ID4gPiAyLjM0LjENCj4gPg0K
