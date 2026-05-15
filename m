Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 155B3CD343F
	for <intel-xe@archiver.kernel.org>; Fri, 15 May 2026 06:25:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF44D10E021;
	Fri, 15 May 2026 06:25:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pei3Wona";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8A2C10E021
 for <intel-xe@lists.freedesktop.org>; Fri, 15 May 2026 06:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778826307; x=1810362307;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kK8Vd5j6Zg3PwEYQhYO8sLM1U0czSO56cPiqIdDp+xw=;
 b=Pei3Wona67Mnz2wlA6eLRe4pX95IN9Y9NqcCuZyzCl/Yu8oOV9HzB6d2
 GmapNeLurt1fpr2uSB7zYutK+4EplPwOn6DHLmV1EBrSoGETui+7zRRbD
 x1pJJYz8SlwueISzcTK6+NQgRDY0PIJ+hqEiMPQTdNoYr0JZQuUegIh8h
 bWEdNVu7iBxenMshH2cGf9XwTtaNUkdBrhwNNFb4NtL4qxX0yZzD9tiRM
 aLgYnF5ArGXYTqzYn6kzO+xsIq7kIpQQAcpRLs2LdCPDGUuNHnjdWbH8L
 4pnSrs0Vxqc3f4aS26+M6dBBzjZmEZnXN5nf12nITdXxXlzcFyBJ8IjFo Q==;
X-CSE-ConnectionGUID: /DubQwaHSs6F2uPZjty30w==
X-CSE-MsgGUID: iW435bGJSPaQedyjxhgtkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="90088609"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="90088609"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 23:25:05 -0700
X-CSE-ConnectionGUID: V2kj7GGpQVKu1MiabKHfnw==
X-CSE-MsgGUID: 2f4+bYbCSl2LsP45Kz2tag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="234351575"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 23:25:04 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 23:25:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 14 May 2026 23:25:03 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.71) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 23:25:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j1biTKonf+aEyRuVsKpUqs0n5Xu6JdmOcUIBQTYQvEKC2uYCu5JHa6+l3EjaV+WjOT7YwUmDxgFbYwd20+7YScq+sMxWPKoMMwvovz9ca4p9PM38hzzyAClSwagdQ8M7OhNKRI9dc/Z3g4aCdpf4RO/kjzg3FtKH8olxDjLVcT8vH8+H/iwEj+bx+1c+7XUvkewstI4/xF54Xuz/C2Mgi2w+T+65+7GkNtd4Nxan92aG6VsIPS6SViFbsL83ISmM+ojfXkl7srsAZaBe2JU0rPuktQ3Lig+WEMH8+AWvKCBlN550cEXIszCL68jDvblBnW8LKctSV5wF17iRJt3AwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kK8Vd5j6Zg3PwEYQhYO8sLM1U0czSO56cPiqIdDp+xw=;
 b=l1sJNJnBiQNRPoi3auWfW7haJzP4w4kDvh3EN6JxFiHFUix66VH00moMd9j9KzPrGjYJR60RM/oYCiObmR/LES6EE6DU9ph/NO+miLO2mUFR2p3Usi72B1iPJSqytWbYxTFZzmIwMEXWHuBBXybuIuGXbBEDmapydriYbID8pUvqaPu63MBc5gbKKB43qqPRUwSqfQIL3tbm2E6pnTog2sLmUKHANXrrnLlROkfWwnpNGtsoJzxWN1DlMehmf6rghqK6vt4CSx51kwxgrEEhO+Zns7zrw4z37xdxDUevbjV3y9+Bw14Ytpl2OBboKktoobkWsDHBukdext6qvF2pbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by BL3PR11MB6506.namprd11.prod.outlook.com (2603:10b6:208:38d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.13; Fri, 15 May
 2026 06:25:00 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%5]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 06:24:59 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Girotra, Himanshu" <himanshu.girotra@intel.com>, "Sousa, Gustavo"
 <gustavo.sousa@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Sousa, Gustavo" <gustavo.sousa@intel.com>
Subject: RE: [PATCH] drm/xe/guc: Use xe_device_is_l2_flush_optimized()
Thread-Topic: [PATCH] drm/xe/guc: Use xe_device_is_l2_flush_optimized()
Thread-Index: AQHc4wvwQ+Ds2NikbkyjpbKwdEfELLYNbD6AgAE0f8A=
Date: Fri, 15 May 2026 06:24:59 +0000
Message-ID: <DS0PR11MB87180B8324EF263C8F688F0D81042@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260513-guc-l2-flush-opt-use-xe_device_is_l2_flush_optimized-v1-1-36fa866d6ed8@intel.com>
 <CH0PR11MB5564D434BB05246B60A8568F98072@CH0PR11MB5564.namprd11.prod.outlook.com>
In-Reply-To: <CH0PR11MB5564D434BB05246B60A8568F98072@CH0PR11MB5564.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|BL3PR11MB6506:EE_
x-ms-office365-filtering-correlation-id: e39a6af3-e746-413d-6f00-08deb24ab0d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|10070799003|1800799024|56012099003|38070700021|4143699003|11063799003|3023799003|22082099003|18002099003;
x-microsoft-antispam-message-info: Ic14P/NrtW+0l12836nfpigQzTr8Vp7E2axtcr51ZaV4kDKW72g0zz7/jSUMCUWIIGvQoSbFPwobDT4ZznBg8THI1iqL8XL6e8wKnJ1AaMeXhwsMLJdSaNFfKoy9vnp+Juu7GRPKxZYSpj6qtgdG15ZdeEB9J/Vx+LVG1oYuz8sgWdJJPVgskONCvNpPo6y7UPy74ZU+ikn2m5JSc58A/vujBg7ub9dUhZEWtdxf9N3HKSzo8CubWkhWUgmwRx9n3jG+qBZKVh7eB2sbBcUQUNuWAANtLpLxVA/QLYw8k1hDvLtmgUdRxCqmjRmQbVRPLx65s+GqfR1F6ga5QgKHLt6BDkaZEBJViqX/JgKYLigZqQgLA6uQqcqIqJqMwyuskJ0CQyuGdMXUK65zK6Jy2G2sDQSZXm/aMbdhJfMkNz8lWHNclI0b35sopvDHdb1yk5qWWFtXpi5sEoF0ivFE4GI/A1IAA3Q8jRGk//z8eQb1Jel+FHER/InakYbB8J2ZGW/fWfDE0PxE8tTmwIWVfLeCyv7W/lA/lrQd0qVxEOTO7CV/ikM2J9zaFpabUXUc/fl4kYoNIcsGct0A++vNVOxsVFjyD+mKCvlRdwXy+j79SHqatAkaQ0aLv1I5uxoBpbStKlkYe6dW6Ks+RNKUErBMj814vWfNtVC6mWjQhVd/HahRlxTfRalKl7jmYbpeWaX8smzk5yS9yOZTPOXdSB3muJJPJzEKuAGuFGkltz5UM50Dn6ythkfvTZQEA8dM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(56012099003)(38070700021)(4143699003)(11063799003)(3023799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U2hJVCsyZGZhdEE3TnlJdVJ2TkRQdDZ0ZnVUcGMvcFMvdFpoNmxjcHJ2WkEw?=
 =?utf-8?B?cmIvM0k3WTFqTzQxMzlHNm1yMEZxb1JST0VaREY3RTZPUmlCM3Y1M1pKTG1M?=
 =?utf-8?B?cHB1ckVtY0RqbEJxWjZ4Qi8vVjlhdmtKRWRnbHZiOXpnME5LUVpoa1NNcHpl?=
 =?utf-8?B?blBSa2p2eVo5bDVmVWV5eEYzYXFFVGtXVEpkSjFIZUZ2Q3F3YmRVdzU5WVJq?=
 =?utf-8?B?dDZPZkNOd1dIVUgwRHV5aHhsMElwMGxtblVGZzJQYnFRZCtLRmZVODRGaVFD?=
 =?utf-8?B?d3lZajQrK1BsMGJlRzJJZE9GVGU0cmFjYWJScFJPTk81OEJETmwraFI3ZDF2?=
 =?utf-8?B?UjVPQUZkZHZKZHNwaGJmYzYxYXcrdzA1UFRzSjJ6UC83UzRZQTFmQ293ZVMz?=
 =?utf-8?B?U1VvMWQ3WHFuWUtmUHpJcWZFMXNMTWRiWDFJSE10NVpteU9WZHMxeDBVdFlJ?=
 =?utf-8?B?WVBSemRRRFVuU0Q4UzcvN2hncmxLRkV3Z2xNV3RHL0JjRWJvbDIwSEgxWjFt?=
 =?utf-8?B?cGtaVWVXejRnblhpbXdJZTlEUlZhdFBzVHIvaklqenlVZ0N2MktWWGFMeEFL?=
 =?utf-8?B?MGdLTTdLdGlYOExWU0syV3RIM2lwK2dhTllGSVBDR1U1YndtbXc4cVgxTVlw?=
 =?utf-8?B?dFM4NDVxZUtyZlY5anFHZFlMaHp5ellVdzAwTTBuTFFxbW9jK2hyVUhsTUND?=
 =?utf-8?B?dEFIMjZoN2l4Q2lYQ0dJL1NneHd0RWVxdGo3N0VML1dYcG1OOHZmMzlyMUZV?=
 =?utf-8?B?RG12SnQxclFMZEdsaHFXd3Vsc0NEcGNBYnYzb2pobjZhLzJmQWtVamJESTRB?=
 =?utf-8?B?dXFOV1JZRGd3bDNaWEdmRUFhcy92aWlWcmRyWThyYzZmNXA2d3J6STdTYjJz?=
 =?utf-8?B?SU1PYkVhNkdoMmRHVTdiVGViOE8yZWRXaXQ4bW1iWVdXa05JWXhWWDNTbkM2?=
 =?utf-8?B?MjFTcUIvbGtvVWNiOVVpeDNhcWpDcGJiTjFBUGR6K3BoTFBhYnpjOGlkR0VL?=
 =?utf-8?B?ejZOM09VVy9tRitLRnFRQmhFS3JlelllSG9JTGRPd3U3d3lwdVlWbnJpNGNj?=
 =?utf-8?B?SGdFWE1kL3IrTVUzeVAxbXkxT0t1Z2luMmYzM1EvVWFoWktDdUxVK0pmN3Rp?=
 =?utf-8?B?S1dWSlluWWNkbFdiWXpMY3NiRzJaSmVmdGJyMWxveUdrd1RtbGdhYVdCNllB?=
 =?utf-8?B?UktxTjFkRHBzZXg3MC8xeklhWm5SNXp3R2swekRNN2JFOElSZUZoUVdJYUNz?=
 =?utf-8?B?TjJHUThWYUJsZmpuQWFKR1FBbUozNDVkS01VVk9ROUlwcGdIc0RvWW5nRWps?=
 =?utf-8?B?djdDREMvNmZYSUhscElMT1VqMkpQTUV1OW9XRWVzNk5lVTNGeUpaYVZPSjZN?=
 =?utf-8?B?T0k4djBXcWl4aFpyaFVHdmkvTEF1SWVBMWtSaGlSaWpHSTZDTHVONkFsTXox?=
 =?utf-8?B?WVRQNFE1SUdqbjVTeHArL3QxSWFvOXpCTHBxRGgxWWI5WlhQQkJudzRPL3cr?=
 =?utf-8?B?M0ZzdUNnaFh3V3Q3ejJtZlpQSEQvcFpwZFFDREYrMmFneUxGcmJmNzI5a3gy?=
 =?utf-8?B?bDZ5ZnUrcVcxdWpaS3JDZEgybXpVeCtjblFucmR0VEJvU2NjUHZIWHkxSVp4?=
 =?utf-8?B?L0pSSUJJSjRrZk1COWtVekVtVEhNZkkybVJtSlNrVEVtV1JxcEEvMVB6a3Er?=
 =?utf-8?B?WE8vcG03ekdHSGtkT3loZ3lGQ1pES0Z6VjBpRlRuL3dYK2ZJaFRGVkg3UjBn?=
 =?utf-8?B?S2g5TjJXK2RXTFVoNmhVYkdJTUpJbklmaU93VWNIeURpckN4cDk4UlF2ZGJk?=
 =?utf-8?B?Mkh5a25ScldzRTVsbW43UVN0dGtFU3FHSlZ6YW5BL2JkR3Z2TkI3TDFpTXpC?=
 =?utf-8?B?SEdYTU1wWHcveStHMDBnZGNJK3QxSW1aQzJwRDY5SzR2YU5iL0oyM1Fuc0hs?=
 =?utf-8?B?bjRVVXVSN2t6NU1WK3ZjWTBFQkRXZUdKT2M4OE5FSk0rc3BzZXROdWJuNGc3?=
 =?utf-8?B?WlNockNzY0kzejFpVHJQM0NUSWJRSmJLQVZtZFNPUTRVQmVQTHJzKzI5QWJj?=
 =?utf-8?B?Ty9rN3B6NHFjaTl1ZS9UZitRWGVJcXdBTjlDM3FoNnBvTFExQ1VocHN2ODMy?=
 =?utf-8?B?aGQrUjc0ZjNUV25uTXhuTDdQSGhFWkthSW5JclpUSTVTblRjQkQ5YldXV0Jk?=
 =?utf-8?B?WlBkM1hHUzV0MFhLcnJURk03eXdMZWlISCtlSkRTV3A5L3BYSFAvSTFOZ1du?=
 =?utf-8?B?YVhYNUdrRTYrbDBHRDc2WFBaMmJUYnBqckdwRW85anBtdFlyUTNHMThhVlRq?=
 =?utf-8?B?RlhEcDN1ZGNBanhGTlVsTjVIK2F0bnBiYlpyVGRnTTJXbzE0NHlSdWtVZ1lK?=
 =?utf-8?Q?ApUYwMxKQQhdocxhxTiyXi0gj63ALIrEwkQ4g2ZNMxJGK?=
x-ms-exchange-antispam-messagedata-1: s+zygq4ydL23tA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: yMBpMH0gVc4iRCVwVOfRxNoDGLL7qTpkSObwVqoZqbYgeGkFhAdvh17Ce8VQAxScO06ITpJzG/JyT0M7Ldq5+qw/0gNx2BqeZ810p95lQSDzAsOLRKPftkVl0hE66MPKqFyXkFQXU43ruM/TDeRL65Dk5FwspM6U4yHlh2OobNl7cuF38GfSvrCHYDkEVLlWw2d2J9WFrtmRQFTouffpQ0Ox30xB7Nzn5oKnPWekhaZ39im426cVerhaEDO5XU3lm2aPmN51i33nwz2FT2cQMon6GTJsNETTfQnlUL+vv+4HABYCO8w0VohMDeH9fR+Zn3zL6WzmNVdYGyzBolwgfg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e39a6af3-e746-413d-6f00-08deb24ab0d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2026 06:24:59.6611 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: awx/1QoDrjKh0ns5h2jMB0+AEl980BvZEXgStHJCNSg+/j5y756vwoBID7ZmPZ4UBX8ZxVsQmpC150aRt/pTp1i2qDe6CwyWeyPGnKo44fo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6506
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2lyb3RyYSwgSGltYW5z
aHUgPGhpbWFuc2h1Lmdpcm90cmFAaW50ZWwuY29tPg0KPiBTZW50OiAxNCBNYXkgMjAyNiAxNzoz
MA0KPiBUbzogU291c2EsIEd1c3Rhdm8gPGd1c3Rhdm8uc291c2FAaW50ZWwuY29tPjsgaW50ZWwt
DQo+IHhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogVXBhZGh5YXksIFRlamFzIDx0ZWph
cy51cGFkaHlheUBpbnRlbC5jb20+OyBTb3VzYSwgR3VzdGF2bw0KPiA8Z3VzdGF2by5zb3VzYUBp
bnRlbC5jb20+DQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0hdIGRybS94ZS9ndWM6IFVzZSB4ZV9kZXZp
Y2VfaXNfbDJfZmx1c2hfb3B0aW1pemVkKCkNCj4gDQo+IA0KPiANCj4gPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IEludGVsLXhlIDxpbnRlbC14ZS1ib3VuY2VzQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+ID4gR3VzdGF2byBTb3VzYQ0KPiA+IFNl
bnQ6IDE0IE1heSAyMDI2IDAwOjM3DQo+ID4gVG86IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZw0KPiA+IENjOiBVcGFkaHlheSwgVGVqYXMgPHRlamFzLnVwYWRoeWF5QGludGVsLmNvbT47
IFNvdXNhLCBHdXN0YXZvDQo+ID4gPGd1c3Rhdm8uc291c2FAaW50ZWwuY29tPg0KPiA+IFN1Ympl
Y3Q6IFtQQVRDSF0gZHJtL3hlL2d1YzogVXNlIHhlX2RldmljZV9pc19sMl9mbHVzaF9vcHRpbWl6
ZWQoKQ0KPiA+DQo+ID4gV2UgZW5jYXBzdWxhdGUgdGhlIGxvZ2ljIHRvIGNoZWNrIGlmIHRoZSBw
bGF0Zm9ybSBoYXMgTDIgZmx1c2gNCj4gPiBvcHRpbWl6YXRpb24gZmVhdHVyZSBpbiB4ZV9kZXZp
Y2VfaXNfbDJfZmx1c2hfb3B0aW1pemVkKCksIGJ1dA0KPiA+IGd1Y19jdGxfZmVhdHVyZV9mbGFn
cygpIGlzIHVzaW5nIGFuIG9wZW4tY29kZWQgdmVyc2lvbiBvZiB0aGF0IHNhbWUgdHlwZSBvZg0K
PiBjaGVjay4NCj4gPiBGaXggdGhhdCBieSByZXBsYWNpbmcgdGhlIG9wZW4tY29kZWQgY2hlY2sg
d2l0aA0KPiA+IHhlX2RldmljZV9pc19sMl9mbHVzaF9vcHRpbWl6ZWQoKS4NCj4gPg0KPiA+IENj
OiBUZWphcyBVcGFkaHlheSA8dGVqYXMudXBhZGh5YXlAaW50ZWwuY29tPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IEd1c3Rhdm8gU291c2EgPGd1c3Rhdm8uc291c2FAaW50ZWwuY29tPg0KPiANCj4gUmV2
aWV3ZWQtYnk6IEhpbWFuc2h1IEdpcm90cmEgPGhpbWFuc2h1Lmdpcm90cmFAaW50ZWwuY29tPg0K
PiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjLmMgfCAyICstDQo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuYyBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9ndWMuYw0KPiA+IGluZGV4DQo+ID4gZTQ2OGI2MzgyNzFiLi40MDIzNzAwZmYyYTkgMTAw
NjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Yy5jDQo+ID4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2d1Yy5jDQo+ID4gQEAgLTk4LDcgKzk4LDcgQEAgc3RhdGljIHUz
MiBndWNfY3RsX2ZlYXR1cmVfZmxhZ3Moc3RydWN0IHhlX2d1YyAqZ3VjKQ0KPiA+ICAJaWYgKHhl
X2d1Y191c2luZ19tYWluX2dhbWN0cmxfcXVldWVzKGd1YykpDQo+ID4gIAkJZmxhZ3MgfD0gR1VD
X0NUTF9NQUlOX0dBTUNUUkxfUVVFVUVTOw0KPiA+DQo+ID4gLQlpZiAoR1JBUEhJQ1NfVkVSKHhl
KSA+PSAzNSAmJiAhSVNfREdGWCh4ZSkgJiYNCj4gPiB4ZV9ndF9pc19tZWRpYV90eXBlKGd1Y190
b19ndChndWMpKSkNCj4gPiArCWlmICh4ZV9kZXZpY2VfaXNfbDJfZmx1c2hfb3B0aW1pemVkKHhl
KSAmJg0KPiA+ICt4ZV9ndF9pc19tZWRpYV90eXBlKGd1Y190b19ndChndWMpKSkNCj4gPiAgCQlm
bGFncyB8PSBHVUNfQ1RMX0VOQUJMRV9MMkZMVVNIX09QVDsNCg0KUmV2aWV3ZWQtYnk6IFRlamFz
IFVwYWRoeWF5IDx0ZWphcy51cGFkaHlheUBpbnRlbC5jb20+IA0KDQpUZWphcw0KPiA+DQo+ID4g
IAlyZXR1cm4gZmxhZ3M7DQo+ID4NCj4gPiAtLS0NCj4gPiBiYXNlLWNvbW1pdDogZTU0YTE0YmJm
OTIwYWE1ZWVmYzcwYWJhOTkyNzQ4MmViZTYzMGY4Yg0KPiA+IGNoYW5nZS1pZDoNCj4gPiAyMDI2
MDUxMy1ndWMtbDItZmx1c2gtb3B0LXVzZS14ZV9kZXZpY2VfaXNfbDJfZmx1c2hfb3B0aW1pemVk
LQ0KPiA+IGY5NGU1NGVmNTFjYg0KPiA+DQo+ID4gQmVzdCByZWdhcmRzLA0KPiA+IC0tDQo+ID4g
R3VzdGF2byBTb3VzYSA8Z3VzdGF2by5zb3VzYUBpbnRlbC5jb20+DQoNCg==
