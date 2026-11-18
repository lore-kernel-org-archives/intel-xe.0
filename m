Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C6E606A325
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 22:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Agw7YUUp;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=AKVRoddZ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D53E810E811;
	Wed, 18 Nov 2026 22:18:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64FA710E811
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 22:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795040302; x=1826576302;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=OGjevN/c32U8bBMGmr4U502YQD6Jw2rX1uLwfxE+ARw=;
 b=Agw7YUUplOgScHWrqiDAP9Iz9lBHEPsPx/IGhL6U7A4xS/TBlkI7vzSU
 Dujb+YLOJDqhDSIZqjXGX2NhqEM4lM7ip5eDEwOdNLDiRynCWRU5q1K1i
 DoGcCctywCK4uVEtmJM9jPaKOh+AjWK/uZrwiaC5XhlAKL7TXqImhHaay
 xRfN3n04rfyyBd685KRcMcIaMOb6HD1zXBdhunKnQBjCbb/K+r68pgsky
 sL6nqG5yEOXOnB+H/XGkQVfD1VQv1c8ilHFVC/Zekj68Q+b869CgKeKIO
 NUvJXIk2PBWUo/Hcme+hrufV5X2NHaMk4xaVDmwfw7jhDS0wx0LPqmV5m Q==;
X-CSE-ConnectionGUID: cAYUV57xSbqwUVLgci5mSQ==
X-CSE-MsgGUID: jUkLOJ8jQQG9E1H40lxPvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3770950"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3770950"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 14:18:21 -0800
X-CSE-ConnectionGUID: +iL20f/MSMOvabdGpD/igA==
X-CSE-MsgGUID: 15RU6uUwTLK/gqeCoV9rtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="12215002"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 14:18:21 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 14:18:20 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 18 Nov 2026 14:18:20 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.61) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 14:18:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n/CmWt5bDZixHoIEMZU5IGlNAMQYAWYB0512gc351LA6COYAkrHSkIMkYEsFWu6M+EqoMZNZdrUReQKka5vHCZh8p+2pJbaQ0JyUhUFiKUWv4ARHYVDaOZfyMAv7fsb+AuG5B0moXMACopTwW5wx/lAaVrQO2mXhIGNqBLPJtOeFWlspTD9vQ5DMq+xEojpyLyvOAIf355jYZYQSmZjzHIhYmGtVvITUoiA/JesthQbQoxBZi0YBVmJOn9ZV9xcUW+lnpaEPHPnUExIC7n3q/MW+aa3O8+V197QqJnq8oGdN+xW8QBNHv7wPmstHUFhNMRFihXxtqb5WybYOm9kxnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OGjevN/c32U8bBMGmr4U502YQD6Jw2rX1uLwfxE+ARw=;
 b=ZpktnBzVd5IPbaouJT3D93mZwPxGxi+0m9KdIy1uWf/dMKkjaJv7lzS0Hpu9MoKwuXhxJdLgbPqgmT1SVCX69Hur+MU6a49jWhwngemJ3X1PhYmetM/7A2N5Mvd+BKFEX21kUEjHzsEh/tm8JFm/2l5VvrFMrJExSjw7PZemeJwnx6tgAbxKrB8JRBHICWxWAcgS1r6r6fC2vucJcophw8U6RTe++9anKnC9MkjwfT/9QNS4WctmUQvqiMJKnWXkCsNSqnwiGUCmNdx7V1ZUbLh4m4FlVggASrfR4xNj03Bcg2YwqMGH47yCcSDoroPYJnD04sxHcm97IboPM0r9Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGjevN/c32U8bBMGmr4U502YQD6Jw2rX1uLwfxE+ARw=;
 b=AKVRoddZwQwaM/5ubd1cg9rIWGFqYLJEAVUq4XOQKfaGrQRjXgxvALlqX9ExJ4K1Zc7dfHy2JOAJYsa+kDz0nbMLpYutvBg14z02gfPxagLqZ9DxcIO2mXLtOeTziIqp6gPYTo1n+xTrK8hSGDDd0Bo0R3Pj5Ur9huNqKs8qTtQ=
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by SA0PR11MB4605.namprd11.prod.outlook.com (2603:10b6:806:95::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 22:18:17 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 22:18:17 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>, "Anirban, Sk"
 <sk.anirban@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Poosa, 
 Karthik" <karthik.poosa@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>,
 "Jadav, Raag" <raag.jadav@intel.com>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>, "Purkait, Soham" <soham.purkait@intel.com>,
 "Koujalagi, Mallesh" <mallesh.koujalagi@intel.com>
Subject: Re: [PATCH] drm/xe/xe_late_bind_fw: Skip OCODE late bind if same
 version is already running
Thread-Topic: [PATCH] drm/xe/xe_late_bind_fw: Skip OCODE late bind if same
 version is already running
Thread-Index: AQHddqgh3qmlvnCJi0uXRWQwF3fnHLcz9kYAgAAEFACAAG2/gA==
Date: Wed, 18 Nov 2026 22:18:16 +0000
Message-ID: <ccafcb84edd1f68ac2f46c75576ac56b0acb0387.camel@intel.com>
References: <20261117125904.2877468-2-sk.anirban@intel.com>
 <avxyUc1VLSYm7DbG@intel.com>
 <6179a816-4d28-4c82-b020-d6282c97c7d4@intel.com>
 <875d7ae8-d70e-4985-a317-63907477f09c@intel.com>
In-Reply-To: <875d7ae8-d70e-4985-a317-63907477f09c@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.60.2 (3.60.2-3.fc44) 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7187:EE_|SA0PR11MB4605:EE_
x-ms-office365-filtering-correlation-id: 669bc8f6-28c9-4ecc-6c16-08df45c1d84c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|22082099003|18002099003|261009223027099003|4143699003|261022113327099003|11063799006|261028144727099003|261022075727099003|56012099006|261022105027099003|261026121527099003|261026140227099003|38070700021|10067099003;
x-microsoft-antispam-message-info: On4Wl6Ij4qL5oFoB1kXR/cg4FsJHUK22EAGuUZyZwaBRQFC7qJKDjffyH1iH5kfiIMmdYJE4SHxibPr3hgaec9Xfg2esOYj8UT6zQu0O1LX9moEJ/dq/7ZoalGBTcN1bGzq6b8fwphOpqOpjHGhKy7kWlBHwq1vyM2xHZ7KRHcaWzS3sfpv2/mwvv77SnRG/bD5k/urXYGXYN6SJsvzscYGgsBOCqRpyZaQVzyz5RXdd0m9gznTjhXSJunQJKoZo4KBJvD73A+aBj7Z0+ORamhQVRuU3ZQinetGDzAW2MHvwwGiBU9aTgifzX07T8uBCVAiA8hysxc4P8cKzBqdNoazpMKeHEdqbsPIiPufNYKHVtNg7hnPmd5Q615VpF3CmqPX0vAx5SnXDZnwTH7QKwWcTMpFk5ksRrVqtTlkQ0DEI1+v8A+2IWPpuBsNrFfdxBoIezUEEqmOhNjTQZbicvZdhtyqku5CpU+VrYUPxqFl+914pGsXpMeC+V9aaPJAztX09L3HQnz0tEKtRnGObgTS6SJN3ceQlxiQpuvVel6NVeCAPxlWleODugjNVMOA1ZFDpgeboVlLp0FPhyiXvi7TLLuFIEK2cKtqN/kl6oqICMGvv94vWMMyGgDbM2uMJSFQ5qhaQhaf8f3e36XEyvq1hp5feyr/oUnquo0eY3Tsw53DVtso58ium7hk+nOF5XD1JKejoCIzz6ESw+NuJFmPLCNNlv6YEKP3UGfCm47c=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(261009223027099003)(4143699003)(261022113327099003)(11063799006)(261028144727099003)(261022075727099003)(56012099006)(261022105027099003)(261026121527099003)(261026140227099003)(38070700021)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R1MxeU0rK2tvQjFuVEhCaHJETVJOM2tnem9lTjVpbDdJazJJNFZqYzY4eE9s?=
 =?utf-8?B?UzYyVlIzcXlJQUE3dVBzWmRlay9OL1cxZ0Y4TVZzdlJObVkyTzRad0pmbWdR?=
 =?utf-8?B?RjA2V0VseVQ4L2NhNWE1cmxmVE83VHE0SzFFNE4ySE03STdMUFFpM2lyQjNv?=
 =?utf-8?B?SlJwYzEvNng1b0MwMnovWFF4Vk05VmVzNDBoMkRDenV1T3UwZjFqTUdaR1J4?=
 =?utf-8?B?a1lXSE5HaWU0U3pNazdDU3BHRndBTGlHK0d2bngxOWlWMHdJdjdzR1NMbzR5?=
 =?utf-8?B?TGtwOWcrL0tvTmxEcTQ5Q2ZMaU9rMHFLNTRnajJ3bERWakdXaXI1NzFXU0lH?=
 =?utf-8?B?cmdZNTYvUHFuN2luaU1Vd1JGcFBPNWIzSjBvZmpSbThTTEJsSEd4bEJSWDZt?=
 =?utf-8?B?VXBrUy9mS0F2TVlJMVZYSTdZMDRMc3MzZkRlY2xha2tKeUZBcFkxajFINi9q?=
 =?utf-8?B?Y1Y1OWN3LzUvY1ZRZ3hOMElVUkRpRXhuSnZPRU9yZHp4TCtXT3A0My9TKzUz?=
 =?utf-8?B?N3J1MVNBRHU0U0xpN1NQUEZVODY1MGE3R2VveTFwdjVnWFdaS3hTMzNmeitR?=
 =?utf-8?B?MHduN2ZldXFjVFhtRmI1bzNOTzNUL21HYTk1cXpHV2ZlNGkzNWlWSG1mQW9X?=
 =?utf-8?B?WUg1NTV1VEcrbGs2MGN3bTJ3WlErcWVucytoVCt4QVlEMHo3NFE2cDJBd0sy?=
 =?utf-8?B?L2pqMHRJN2s0WUtaMEEzd0M1T3NNU2hSU2M0c0RUMjlQclAwc2hnNnJLbDlX?=
 =?utf-8?B?RWFtak96QXhwbVhiaFRLZzk3RmE0cEJhbzl5TU5uamtGOENSY1hxRTJLenc1?=
 =?utf-8?B?bWJoSDFqVHhaZE5qYzdMNEQyQk8vYkJlYXlEbUJJaXZNZGIzS2l3bFZmRmw0?=
 =?utf-8?B?T1o0aDZnS1pIVzQrUk9ycmwySEdLdkZvVVhNVDVQUjZaWWV4RWxHRE9Kdndq?=
 =?utf-8?B?UjA3MEwvOWNCYmVMa3psRFBjMndoVkxUQVFCcjVzc2NZbzFSc3Z5QWY4M0ZU?=
 =?utf-8?B?dGVGWGxyWFlkbGduZ2RBQWVUSUZtd1Uvci8rYUcxWHlFa2RlaExCTTNnVmNv?=
 =?utf-8?B?akJ1SGZiRTlLeVlDRW1zVTRXZ283STBsdm50SzBFenJsMjJsQ20vbG9SYS92?=
 =?utf-8?B?azBtanA0OXFCZG02RWZsUzRlWjd4RjJnMzROSHlwM2FuNFdKNWVTcVZzQldH?=
 =?utf-8?B?cVhkRGI5ZVNLcEpGQkFZMjMxajFEcy9zems3VFdpdXRPUzVTOGV0VzRZMktY?=
 =?utf-8?B?aFpZeDhrc3lHZ3gzeFNtL29mVXUzR0JTS2xWY2g5UXNqd2NXOHBjMFhCeS8v?=
 =?utf-8?B?YkR1UE5NNTRaNVUvTm5SKy9oOWVnR0psVzNBTHkrWHN2MGJUQ0dqMDRRRmR5?=
 =?utf-8?B?WWNwenBMdStZc0RrUmIyc3VaZXJORVh3dGtGbVNNQk0xcndTYmd5bEc2djNk?=
 =?utf-8?B?OXF0WXlMcEpQZW0xekJ4NFg5SXY0MWhpcjN0MStzbGp3MUZVdlFQSGxaRklL?=
 =?utf-8?B?S0lSYklsYWszdGVGa2FTZU9PSXZld3NZZlJkTVVYKzFGb2x4ejh2OEpTaTUz?=
 =?utf-8?B?R1d2WlFFd1dnU1FGT09XL0NZbnlvN1hVd3NmMjhQZTJEWWRxSkVhd1ZXRDN0?=
 =?utf-8?B?RlVEK1pZZEdaVWNmakdKMU1tek1oVEV3ellaSU42Y2NDa3g4V285MktyQmtY?=
 =?utf-8?B?SWJ2ZXZTSXJMWEd6RnlEbWFxb0xMdGl5OURrTFM5dFBBMVFSYmdqZHoyck5G?=
 =?utf-8?B?MDNZTExoNkJkaU56OXQwQXBEaE5Lc0NKN3l6YUp5VU5vMGhoQ3YvdmNKTnRK?=
 =?utf-8?B?YWV4THBvZzBBSkMxWFlIYjNHbmpEK1pRUmtoMytqWGpMeFNROWhFOUNqNVFW?=
 =?utf-8?B?SEtQemp5KzE1TFBWcjNoek5oZXJQS21EU3Nva0k3K1J4SzZuWTRKdjNIZFUr?=
 =?utf-8?B?dzZBLzBpeFR6ZUR4cE1wbktqdXc1NG9PYjBuL1R6K1pTUUMvdkQ2aXp6QUlE?=
 =?utf-8?B?Q0dSVlJtSkNmcC96N0ZvWnZyL2p0Q1pLL3BtT2M3eXpSN0RhV0J4dzl3UTBr?=
 =?utf-8?B?ajQwaGdPY28xb0hiZVlJZm45TVIrd2l1eGxlZmZSdXRzNitTMGdaYTVuNWF5?=
 =?utf-8?B?d3FPNWliOGVQY1grRHd1c1BINE45TTVKYTQzT1JRVTRYb3JaZE05SUV4Um9D?=
 =?utf-8?B?NE9DRkh3NExXcmNRNHN3VDZhcVpua25UWjEzWEhyMHZvQmtCVGt6M3FDam5N?=
 =?utf-8?B?SDlMUU15ekI1SXVOZkhhMGtKNXYzZE0rMkZEWGZ3V05vL1hSOFN3VkJPa0JQ?=
 =?utf-8?B?clRyZzg0U3JFVzNZMytraEV4NFM5Ris5aE5sdzFXNEo1VnUwa3ZGUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4DC0DEC16E70DE4FABD491C3F4E69C15@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: fqtgzFtNdmmXxMLGZKKWOvzUluXoYPI9qc78+cOHHMIMGGCSFNMmk2ALpxZ2d8LV3j6SiUXzHDzmwpfYa6sj1HxIYeZaGWV6v6cEa6hymBlEz+IjJZjtfG3XSQmqLvD0P4l7Wo07LtsgFZWZnUlvXLLyfOJO+vcsF4NQjcQF/Ht6Ipbqa59U+bSFYwqfgZg3IiJCttLWssqrIMOUgealyURBH73zRReNWRKzRRXMdipM0Vzp4UJKhUf9F5rm2lAwYMo9Pul9qU4iwZzRGaadjcUeAGCtsado1PnxYUy3rDXlvln3Y0GHsjxeQvN6fK0ZEBWuoNKwVS1CQy+zfmBkTQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 669bc8f6-28c9-4ecc-6c16-08df45c1d84c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2026 22:18:16.8965 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fMB/yu0xttistj5tVyKsBZsyHoa4chcdZ7qUU/A6hDC7TnQTSB1EncbRvAiGNqNSAamyr1TQo67G2lStcED1Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4605
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCAyMDI2LTExLTE4IGF0IDIxOjE1ICswNTMwLCBOaWxhd2FyLCBCYWRhbCB3cm90ZToN
Cj4gwqANCj4gDQo+IMKgDQo+IMKgDQo+IE9uIDE4LTExLTIwMjYgMjE6MDAsIE5pbGF3YXIsIEJh
ZGFsIHdyb3RlOg0KPiDCoA0KPiDCoA0KPiA+IMKgDQo+ID4gDQo+ID4gwqANCj4gPiDCoA0KPiA+
IE9uIDE3LTExLTIwMjYgMjA6NTcsIFJvZHJpZ28gVml2aSB3cm90ZToNCj4gPiDCoA0KPiA+IMKg
DQo+ID4gPiDCoA0KPiA+ID4gLSBEcm9wIHRoZSBzZGtfYXBpX3ZlcnNpb24gY2hlY2sgKGl0IGFs
c28gc2F2ZXMgYSBtYWlsYm94IGNhbGwpLg0KPiA+ID4gSnVzdCBjaGVjaw0KPiA+ID4gwqDCoHhl
X3N5c2N0cmxfaXNfb29ibXNtX2Z3X3JlYWR5KCkuDQo+ID4gPiDCoA0KPiA+IMKgDQo+ID4gVGhp
cyBpcyBmaW5lIGFjcm9zcyBEM0NvbGQgYnV0IG5vdCBmb3IgbW9kdWxlIHJlbG9hZC7CoA0KPiA+
IMKgDQo+ID4gSWYgYSB1c2VyL2RldmVsb3BlciB3YW50cyB0byB0cnkgYSBkaWZmZXJlbnQgT0Nv
ZGUgdmVyc2lvbiwgdGhlIG5ldw0KPiA+IHZlcnNpb24gd29uJ3QgYmUgTEJlZCB1bnRpbCB0aGUg
c3lzdGVtIGlzIHJlYm9vdGVkLiDCoA0KPiA+IMKgDQo+IMKgDQo+IMKgSSBtZWFuIHRoZSBuZXcg
T0NvZGUgd29uJ3QgYmUgZG93bmxvYWRlZCB1bnRpbCB0aGUgYm9hcmQgaXMgcG93ZXItDQo+IGN5
Y2xlZC4NCg0KWWVzLCBhbmQgSSB0aGluayB0aGF0J3MgYWNjZXB0YWJsZTogYSBuZXcgb0NvZGUg
dGFrZXMgZWZmZWN0IGFmdGVyIGENCmNvbGQgcmVib290LiBMb2FkaW5nIGEgZGlmZmVyZW50IHZl
cnNpb24gb24gbW9kdWxlIHJlbG9hZCBpcyByZWFsbHkgYQ0KbmV3IGZlYXR1cmUuIFdlIGNhbiBh
ZGQgaXQgb25jZSBGVyBnaXZlcyB1cyBhIHJlbGlhYmxlIHdheSB0byByZWFkIHRoZQ0KcnVubmlu
ZyB2ZXJzaW9uLg0KDQpVbnRpbCB0aGVuLCBsZXQncyBza2lwIHRoZSByZWxvYWQgd2hlbmV2ZXIg
b0NvZGUgaXMgYWxyZWFkeSBydW5uaW5nLCBvbg0KcHJvYmUgYXMgd2VsbCBhcyByZXN1bWUuIElm
IGRldmVsb3BlcnMgbmVlZCBpdCwgYSBkZWJ1ZyBrbm9iDQooY29uZmlnZnM/ISkgdG8gZm9yY2Ug
dGhlIHJlbG9hZCB3b3VsZCBjb3ZlciB0aGF0IGNhc2UuDQoNCj4gwqANCj4gVGhhbmtzLA0KPiDC
oEJhZGFsDQo+IMKgDQo+ID4gwqANCj4gPiDCoMKgDQo+ID4gwqANCj4gPiBUaGFua3MsDQo+ID4g
wqBCYWRhbMKgDQo+ID4gwqANCj4gwqANCg==
