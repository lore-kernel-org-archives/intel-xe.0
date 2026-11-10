Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D93E606A335
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 06:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O3Qgf3bN
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE9110E2E4;
	Tue, 10 Nov 2026 06:31:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF77410EE23;
 Tue, 10 Nov 2026 06:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794292298; x=1825828298;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=QPZvdA0PZrrGD/3BLRcqqD8K+NbLZ+usr0azRxrMyCM=;
 b=O3Qgf3bNLQGz0b87aAyq6OdKZfCh8attJoQ5pNXiF/8IFUmaGQfoS1AH
 inKSXCl1PmihN6/XANEp5b+u2T2rUo+ZqNm0Cnj1OnxOKLCVuj9SRiCbN
 abFtOCk7IQSVDTOlm17/vu14ZSWMVX8CLki8uYOBARJJOGRO6b7aS7ljh
 /0hrDMDDc7rLCDkBMYQO7MIa41gHD/spUU0iyvnzDh9Y6Fstxwa4FRP45
 28+Bpyhbf2M1bxIjYnmypcu8bfbFiuna5Uy2Q5gKMA/i/dnUI2Ly0cxuA
 GGUTmrC5bhSRmCwfcTl5QhmirTXb7qUkRf9bVL7TTpzFUHUQNn+UTAmgH w==;
X-CSE-ConnectionGUID: z0KmTrCkQ+KYX1zRoeFrbg==
X-CSE-MsgGUID: eeLwGg2NTpylv4hys+1ZqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2897980"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="2897980"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 22:31:38 -0800
X-CSE-ConnectionGUID: itNpdwiyTBOba+QFtbqXKA==
X-CSE-MsgGUID: IV0cAadsQ6CKEl4LqVNJVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="7946610"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 22:31:37 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 22:31:37 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 9 Nov 2026 22:31:37 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.33) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 22:31:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kN4MmSQTo5bbrSGFyCrIrUpGMk79/y4jdYi8cWvGCQYE2TpfpuEV0dHCpTBcg66bzSh2DwUR2ad01DuiJFiUGXLQ42pxEz76juQMsNtGNBsgzSNwzZZ+81TwD/wHhT1dU3eLbSKKt3LOZHuYKWLXhqpmPOjJTJ7K2hhNQ2E/Q2DnYZPC02JOdZEpTrUvZ/zgoMaHuEGrltKu3Gm2v9QSx2+nGBgerg6Y5rev7u05sRcn27+m9zl92fgLNA+yD4cIuU02CaotEbJnxpJBJP8CGfnbuyv2nzJLh01dVEfnCuSQ41bPjSyIlftBx5+tdKej7AGC/EdgVFb6w1zXhcY4kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QPZvdA0PZrrGD/3BLRcqqD8K+NbLZ+usr0azRxrMyCM=;
 b=jArJndHlCOgI+a04AgqjUo8wrB4UUqGHOx93yqwcvQos7BhgiR1QF2gHmsnGRMI7I/eL9x6gryi5tEJVkSEqTqscir9aIOTvVepbULfxChzKfxU6/bXPhCwIVMvMQ5GSOdQFImQ7CU3E6QzunRgW1mcg/oJtBuT4BCPCAh7VcgguHd0LP3lMxHFYEQu9kiWSAJNWu/HSDaHNA1/D/M4y1+u172OAl2o1lWuf6oE4EpphBO8bBYm9BOBbNKCJfCtXdvIWIPzE9HnLerT6TW6cb1d6gPSRzbHdKW2KUORdl53V+b4ZXZYrN/X4yRQog/iuCApQzQFQnGin5W2hyn6wDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by SA0PR11MB4686.namprd11.prod.outlook.com
 (2603:10b6:806:97::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 06:28:28 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff%8]) with mapi id 15.21.0592.010; Tue, 10 Nov 2026
 06:28:27 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: =?utf-8?B?TWljaGHFgiBHcnplbGFr?= <michal.grzelak@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v1 2/2] drm/i915/psr: clean register macro's name from typo
Thread-Topic: [PATCH v1 2/2] drm/i915/psr: clean register macro's name from
 typo
Thread-Index: AQHdbLLhbP26flcyLk2li/i3frgwu7cm3+Aw
Date: Tue, 10 Nov 2026 06:28:27 +0000
Message-ID: <DS4PPFE901A304FC4C5B1FA4B93526BB552E3722@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20261104231812.1704129-1-michal.grzelak@linux.intel.com>
 <20261104231812.1704129-3-michal.grzelak@linux.intel.com>
In-Reply-To: <20261104231812.1704129-3-michal.grzelak@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|SA0PR11MB4686:EE_
x-ms-office365-filtering-correlation-id: f897766e-b983-4bc7-81b4-08df3ef3d492
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|261009223027099003|261021121427099003|261102123227099003|261021123027099003|4143699003|11063799006|56012099006|10067099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: IC/Y8/mK9XLDKoMZ9FYytpSyGlNhDneWIFnpjflyavkqFKNio/b0b0KO48qAJANgk9nDDEes+gn7+K7Uvz60lbsp5ODy9LkvQCvjZuN4LC2Hcyu0elynPmtZMemVnkmhIgN068KTuLIAHRoM4xClOu9iQVzQhCYzecBBDXeKbGLcopY9qmTXIyZdQkI2/b3GNGEuIDOLda3Aic9vzy0fMZdhNd5RWSRBdW6eE74eVQPs7QHjuO9y/Xejg+fFarh0AhkPdReLYqsr8Fi25e+YbbNFOlUgxMRAb+OWNY3ZZv/F7K3d0m6aJnpOFPjr7k8k00oZR3d9OsssjyyIANEVlELelUH37hP+Tdf5+wynCG3VhGACldWGB/IGgvRATXqqDA/zlYq6NnOhkGGTclv2AsmU0HFeVkkJTnq+kXUQ7yJCiGOBAWduaSUais9pC6X3PYUgMjLG/ptF0ycxXNhRdQxqhMe5H5mIbXijyHQgwdMrQdOoK5v4t8SwYlvP67vtB2+77MZUlys2SAopxrBPNxJgUOBjcI5UfJ8WavDTAQVy9fITit2/MKLWQFd3c4HpwLvAZKfZrBzxYaQPG6xjXY4nORcPJhCu29zizfbS+MoUDoBMMJ53HnXz5nztwooEDRghgXNo7OKVHmaSDwKyQLvwk1ArYUN/eOBYvW19XXFszLsal8klHCehHeZ561R4FmUxDxPWSbDLGcHVdZBhi3DQ/LQHQ0S+UQEVajJwTOc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(261009223027099003)(261021121427099003)(261102123227099003)(261021123027099003)(4143699003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NlFUdUFhd05jMjhCNTBpeHN4VTlRRTR0alRwNEUwRmsycGswNWJNOVpEeHpR?=
 =?utf-8?B?Q3FkUlU2SEsyRS9pN1hCUS84WU9kUVVqSVRNQjhpMWhSMHMvbHFYTDBjamRL?=
 =?utf-8?B?Y2l3Mm5PL0pha2tDaHYxdGw5UEV1eUY1d3c0U09VeUNyQlo0eWc2bTNMbkhS?=
 =?utf-8?B?UVdDMzh6bHRxSFhsMW1iYjBqWVlDcTVMSmsydkZNL3lRYUM3MW9TQ3dmQitq?=
 =?utf-8?B?Z3NZUFpMK1Z0a0FrTHE0azg4elBnN09tSnNoMGoxVHdJVkFia2tRMlN2eGN5?=
 =?utf-8?B?cnZ4RGN2WVp1MXJQRlhsWEUvUVdUK1pHWjdPT2t4RDRraUsybDRuYyt2YnMz?=
 =?utf-8?B?Mmp1YTJwY2hkek1Oa2VoL1dKc016UjNWWHVOc0c5TEdPOEkxZGF2SWhOOE5O?=
 =?utf-8?B?dVdjQUZGOUdTdUxvckFBRWhjQi9xejBRa3lQMGg0djY1MU5tbzZqclNtNVlR?=
 =?utf-8?B?cmp3c3hMUlZqUi9VMVdjQWVkdVVHK3dYc1ZrUVhoSEZ4MktRdUJwM1kzTFkv?=
 =?utf-8?B?dzJEMVl5QisraHR5dWwyaUFOVkhRN3Z4azAzeUxaakxuMWp5SzBURU9Eak1W?=
 =?utf-8?B?UlZrWnlCaFYzMEVIVUc4MmFnWWRwbjlxTXVwaHRxUlVVcmZONmhHNGNhODQ4?=
 =?utf-8?B?RmFjZTluN2RyYU9EeWFGaUlCUTRia2lTbTNPYjcxUHZLa2FxZlhzNFI0Q1ZK?=
 =?utf-8?B?Sy83NVBpTGRXNzVvRmdxeEFkaHkvajY0YS9XMWNiSjBjb3hFN2xiTDg2Sm0w?=
 =?utf-8?B?SVZqUjFpU1Z4N3l0NzIrNjVwQjhSZC9odkc3RzVESlRiVWhXTWZrTDVya1hi?=
 =?utf-8?B?YVdVbDRYOUR4NWZ5MDFrYllCUkExUGIvb0ZESHJiN0dDQlcwZkZsQXlxMmcx?=
 =?utf-8?B?RmRyOG5EQys3dVJraTloNkp0M0FiaE0yTkNESE11aVIvdDIwd2NQTjIrQmNo?=
 =?utf-8?B?NWxybzhhckl4Sm5vRGVrYmFBc1ovaUVMME1Ld08va2FjWnRyWk5EWTVmTkc5?=
 =?utf-8?B?cEl6Tk5Rc2VYZ2ZGS2pvNkFoWm9HaWxOMVdrUXg3S015bytXUERPMWtyOU1F?=
 =?utf-8?B?SVM0cUwvM0kyYXdPbnFTK0F3dFBZSUcyZDRzdjNhc2dTOSt0R1hzbHk4RDE0?=
 =?utf-8?B?WTRVODdMWHQyNGlnQzhRc3pnZEhwaXRVMlU2a0tldm41YTg1ak56dlpQNmZD?=
 =?utf-8?B?OFBCNncrdFd0UHhlWUxjaCt5NWhKbnhocS83MTI3RHErd3Fzb3gxZTBGRlNW?=
 =?utf-8?B?NElvS2xaK24venZsYkVkOVNONGNNZ2gvVEtWM0huWHVCM3JHTFFyWkxMemla?=
 =?utf-8?B?alVWMHJoNXRPMzViNWRaTkh1aVdaLzREZ0w4aXF4UzZVcFljbUxBWlNraVBM?=
 =?utf-8?B?dEMyRURCREZXQ0Rxa0t0a0twVEwxMU9HZk84VnFzbExsS3I3Y0hTWXJZdGxo?=
 =?utf-8?B?TldGaCtQTUcyd1BZcHQ0RXBPMkRuajNmNkpxVUFzOVRndHJWdkpXb2JxbTFI?=
 =?utf-8?B?OW84cllXbVVicSttVjFrZGxqZzVvWlliUlVYU2JZT1lLSjRQMDBPU1dJZFNF?=
 =?utf-8?B?eW1UVmZzKzFJbE05SDZTNTc0VGFqSjhQTHM0Vm9ZN1Rkc3ZxQ25rT00rMlo2?=
 =?utf-8?B?SHJsa0tJbUpMcnJuVFVWYS9WSGN1ZUlHa2JKenlQWEpVWE9HbmxSaVpLeTY4?=
 =?utf-8?B?dTJZeE5hdTR0TkNUMEp2VE1PRS82WWY4dE56NWJuSTFZb2NHeTNpZml2WHJz?=
 =?utf-8?B?bUNjNlJTdVFxRTFuRDhXQjBKcG9RYStXbWlSWFV0eUpRSGRqVUVBQy9lWHNw?=
 =?utf-8?B?WE93NGl5YWh3TUlWeEZzVUc0RHBqajFqN09qRGo3bnpBanUzSmJhWmt1ZkRM?=
 =?utf-8?B?czZ3MnM4amY1TDZvT2prVk9ZdlNZOEovOUtWVGlPM1E2TUp4T3hqQVB2Mlpp?=
 =?utf-8?B?dFRiUG50dWE5MFRmTG1WYXBQQ2kwTHBOczBGUXpOcm1BNnB1OXhuV1ZEQzVk?=
 =?utf-8?B?dEJnV2tXKy9vVGRTVjNtcnh5SUZNQWxzekNaOGxFSkZ4K0lMdHZTNjhSK2c0?=
 =?utf-8?B?ZkdwVEtiaEJlbWpaU2lYV2dReW9JUXpsVnNRK1VMZUdUcHZkd3pHdmdwdmk5?=
 =?utf-8?B?aEovWkZ6OWQvTElwYnl0NFA3SnlKejFXMGRrOUpEdGc3K1JOcUZnN1Y0UVVI?=
 =?utf-8?B?akNENEhacGM2MGRpUnB4UlJ1VC9SZ0FWOXg5UE4rbTF0eld0Y1VFYXo1cUNm?=
 =?utf-8?B?R3MrcGxFdnQzUFd1UVpQOEJKdTBTUHlWVzZTU0pSczUwTGtONC8rWW5BNmJk?=
 =?utf-8?B?eEIzL0k5enNPNVZCNTBjc2ZCOTh5amhsWllUVmZqaEpKWjdKREhUUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: lJZBsMF6sNGPOB2w6IHy/oymIP4HEV5D/e+Vmec4V2nc/KgzPpUHqkASFUTQbQUQufMUrXSLBi21BFjtqV3k2a5hP6B0mTAVGw+/fCCY7+pKgcS+Lpd+TUL7h8xiogJTSUzUr4Ry7qMA0Eit2DIA4Cxunf1Urxe3MhbZKp/AU24tF82sLSLxJauRSJiGSQsvyRr1APVkpgFhCXyMU6A4HQOXhQGd6T0lXImMLkoDOxjWILy+j2yY393THYX+qV3QR02Fv7TTP2EVuwCXKsksokUgPL8QG8dO19ubwHDR3tZoFgU882TlL6B64Fv2dZbNUXeZS5xQSnHgq0l8fr0BVw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f897766e-b983-4bc7-81b4-08df3ef3d492
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2026 06:28:27.4027 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PBv8EoHab9eHtiC5yrr99OfL0DiQcIRLg65Y6SZFXFQqp/cYLJyrp6uGZrLC6xMOyZFGBigf/qzbssp5YnWDxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4686
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PiBTdWJqZWN0OiBbUEFUQ0ggdjEgMi8yXSBkcm0vaTkxNS9wc3I6IGNsZWFuIHJlZ2lzdGVyIG1h
Y3JvJ3MgbmFtZSBmcm9tIHR5cG8NCj4gDQo+IEFwcGx5IHMvX0NPTlRJTlVPU18vX0NPTlRJTk9V
T1NfLyBmb3IgYm90aA0KPiBBRExQX1BTUjJfTUFOX1RSS19DVExfU0ZfQ09OVElOVU9TX0ZVTExf
RlJBTUUgYW5kDQo+IFBTUjJfTUFOX1RSS19DVExfU0ZfQ09OVElOVU9TX0ZVTExfRlJBTUUuDQo+
IA0KPiBObyBmdW5jdGlvbmFsIGNoYW5nZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhxYIg
R3J6ZWxhayA8bWljaGFsLmdyemVsYWtAbGludXguaW50ZWwuY29tPg0KDQpMR1RNLA0KUmV2aWV3
ZWQtYnk6IFN1cmFqIEthbmRwYWwgPHN1cmFqLmthbmRwYWxAaW50ZWwuY29tPg0KDQo+IC0tLQ0K
PiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYyAgICAgIHwgNiArKyst
LS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyX3JlZ3MuaCB8IDQg
KystLQ0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9w
c3IuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMNCj4gaW5k
ZXggNWJmYWM2NDI4NGVmOC4uNWUwY2YzNGUxYTgxOSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jDQo+IEBAIC0xMDc0LDcgKzEwNzQsNyBAQCBzdGF0aWMg
dm9pZCBkZzJfYWN0aXZhdGVfcGFuZWxfcmVwbGF5KHN0cnVjdCBpbnRlbF9kcA0KPiAqaW50ZWxf
ZHApDQo+IA0KPiAgCWludGVsX2RlX3JtdyhkaXNwbGF5LA0KPiAgCQkgICAgIFBTUjJfTUFOX1RS
S19DVEwoZGlzcGxheSwgaW50ZWxfZHAtPnBzci50cmFuc2NvZGVyKSwNCj4gLQkJICAgICAwLA0K
PiBBRExQX1BTUjJfTUFOX1RSS19DVExfU0ZfQ09OVElOVU9TX0ZVTExfRlJBTUUpOw0KPiArCQkg
ICAgIDAsDQo+IEFETFBfUFNSMl9NQU5fVFJLX0NUTF9TRl9DT05USU5PVU9TX0ZVTExfRlJBTUUp
Ow0KPiANCj4gIAlpbnRlbF9kZV9ybXcoZGlzcGxheSwgVFJBTlNfRFAyX0NUTChpbnRlbF9kcC0+
cHNyLnRyYW5zY29kZXIpLA0KPiBkcDJfY3RsX2NsZWFyLCBkcDJfY3RsX3NldCk7ICB9IEBAIC0y
NjE4LDggKzI2MTgsOCBAQCBzdGF0aWMgdTMyDQo+IG1hbl90cmtfY3RsX3BhcnRpYWxfZnJhbWVf
Yml0X2dldChzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxheSkgIHN0YXRpYyB1MzINCj4gbWFu
X3Rya19jdGxfY29udGludW91c19mdWxsX2ZyYW1lKHN0cnVjdCBpbnRlbF9kaXNwbGF5ICpkaXNw
bGF5KSAgew0KPiAgCXJldHVybiBkaXNwbGF5LT5wbGF0Zm9ybS5hbGRlcmxha2VfcCB8fCBESVNQ
TEFZX1ZFUihkaXNwbGF5KSA+PSAxNCA/DQo+IC0JICAgICAgIEFETFBfUFNSMl9NQU5fVFJLX0NU
TF9TRl9DT05USU5VT1NfRlVMTF9GUkFNRSA6DQo+IC0JICAgICAgIFBTUjJfTUFOX1RSS19DVExf
U0ZfQ09OVElOVU9TX0ZVTExfRlJBTUU7DQo+ICsJICAgICAgIEFETFBfUFNSMl9NQU5fVFJLX0NU
TF9TRl9DT05USU5PVU9TX0ZVTExfRlJBTUUgOg0KPiArCSAgICAgICBQU1IyX01BTl9UUktfQ1RM
X1NGX0NPTlRJTk9VT1NfRlVMTF9GUkFNRTsNCj4gIH0NCj4gDQo+ICBzdGF0aWMgdm9pZCBpbnRl
bF9wc3JfZm9yY2VfdXBkYXRlKHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHApIGRpZmYgLS1naXQN
Cj4gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzcl9yZWdzLmgNCj4gYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzcl9yZWdzLmgNCj4gaW5kZXggYTU3
YmMxMTEyOTBkMS4uNTZkZjRkMmY5NzI4NiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9wc3JfcmVncy5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfcHNyX3JlZ3MuaA0KPiBAQCAtMjQxLDcgKzI0MSw3IEBADQo+ICAj
ZGVmaW5lICBQU1IyX01BTl9UUktfQ1RMX1NVX1JFR0lPTl9FTkRfQUREUl9NQVNLDQo+IAlSRUdf
R0VOTUFTSygyMCwgMTEpDQo+ICAjZGVmaW5lICBQU1IyX01BTl9UUktfQ1RMX1NVX1JFR0lPTl9F
TkRfQUREUih2YWwpDQo+IAlSRUdfRklFTERfUFJFUChQU1IyX01BTl9UUktfQ1RMX1NVX1JFR0lP
Tl9FTkRfQUREUl9NQVNLDQo+ICwgdmFsKQ0KPiAgI2RlZmluZSAgUFNSMl9NQU5fVFJLX0NUTF9T
Rl9TSU5HTEVfRlVMTF9GUkFNRQ0KPiAJUkVHX0JJVCgzKQ0KPiAtI2RlZmluZSAgUFNSMl9NQU5f
VFJLX0NUTF9TRl9DT05USU5VT1NfRlVMTF9GUkFNRQ0KPiAJUkVHX0JJVCgyKQ0KPiArI2RlZmlu
ZSAgUFNSMl9NQU5fVFJLX0NUTF9TRl9DT05USU5PVU9TX0ZVTExfRlJBTUUNCj4gCVJFR19CSVQo
MikNCj4gICNkZWZpbmUgIFBTUjJfTUFOX1RSS19DVExfU0ZfUEFSVElBTF9GUkFNRV9VUERBVEUN
Cj4gCVJFR19CSVQoMSkNCj4gICNkZWZpbmUgIEFETFBfUFNSMl9NQU5fVFJLX0NUTF9TVV9SRUdJ
T05fU1RBUlRfQUREUl9NQVNLDQo+IAlSRUdfR0VOTUFTSygyOCwgMTYpDQo+ICAjZGVmaW5lICBB
RExQX1BTUjJfTUFOX1RSS19DVExfU1VfUkVHSU9OX1NUQVJUX0FERFIodmFsKQ0KPiAJUkVHX0ZJ
RUxEX1BSRVAoQURMUF9QU1IyX01BTl9UUktfQ1RMX1NVX1JFR0lPTl9TVEFSVF9BREQNCj4gUl9N
QVNLLCB2YWwpDQo+IEBAIC0yNDksNyArMjQ5LDcgQEANCj4gICNkZWZpbmUgIEFETFBfUFNSMl9N
QU5fVFJLX0NUTF9TVV9SRUdJT05fRU5EX0FERFIodmFsKQ0KPiAJUkVHX0ZJRUxEX1BSRVAoQURM
UF9QU1IyX01BTl9UUktfQ1RMX1NVX1JFR0lPTl9FTkRfQUREUg0KPiBfTUFTSywgdmFsKQ0KPiAg
I2RlZmluZSAgQURMUF9QU1IyX01BTl9UUktfQ1RMX1NGX1BBUlRJQUxfRlJBTUVfVVBEQVRFDQo+
IAlSRUdfQklUKDMxKQ0KPiAgI2RlZmluZSAgQURMUF9QU1IyX01BTl9UUktfQ1RMX1NGX1NJTkdM
RV9GVUxMX0ZSQU1FDQo+IAlSRUdfQklUKDE0KQ0KPiAtI2RlZmluZSAgQURMUF9QU1IyX01BTl9U
UktfQ1RMX1NGX0NPTlRJTlVPU19GVUxMX0ZSQU1FDQo+IAlSRUdfQklUKDEzKQ0KPiArI2RlZmlu
ZSAgQURMUF9QU1IyX01BTl9UUktfQ1RMX1NGX0NPTlRJTk9VT1NfRlVMTF9GUkFNRQ0KPiAJUkVH
X0JJVCgxMykNCj4gDQo+ICAjZGVmaW5lIF9MTkxfU0ZGX0NUTF9BCQkJCTB4NjA5MTgNCj4gICNk
ZWZpbmUgX0xOTF9TRkZfQ1RMX0IJCQkJMHg2MTkxOA0KPiAtLQ0KPiAyLjQ1LjINCg0K
