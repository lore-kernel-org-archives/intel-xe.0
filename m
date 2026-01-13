Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3BF0CF45DB
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 00:58:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B19910E103;
	Tue, 13 Jan 2026 00:58:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c8bWbLEM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE0CB10E103
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 00:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768265904; x=1799801904;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EWMMda2nUjJTvNRB+odqGCZhjdlD3XzrnDcA57MdpA4=;
 b=c8bWbLEMux40UTySXLlX5hjyrWbSRedHkyEtHxWkO9ylpgbfaVtPWwH2
 /yuOUBcGGsDlAIBXsK8Kev2CJhUgMdhfTnx2C50m/OT6xqYcA4eVwjfa1
 rnQtjHOYWpEhic1t6EWscvsb7Ia5cYiXsVDV93vlU3jEbX87JtJgySvic
 dPiv+J1Z3LdSjb2UPu7S9UNpYFtJ3HonhVPVSaY279FggL74ocy/SW/K5
 SHXP0WqoExM4W9oc3Qgfd376/3YICwjB7APRc8oUqe73yIaX24PsI1AND
 qcTS+YNPbskEX02VFzqrot2/WjX2O1JviOD5WAvdZG4NbRdCXVRzVkQlg g==;
X-CSE-ConnectionGUID: zqMhG3XkTe2mmupXYFKJug==
X-CSE-MsgGUID: iqGzw7DaR9iQamAmlVTBrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="79842736"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="79842736"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 16:58:23 -0800
X-CSE-ConnectionGUID: RTRkIxOAQpWXrYrdb22TDQ==
X-CSE-MsgGUID: BsOAOzKHQkuVm/mQo7c0ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="204638068"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 16:58:22 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 16:58:22 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 12 Jan 2026 16:58:22 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.34) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 16:58:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=exoJ+nE7XNd+JdNJGUqu/v/D1akvPChPJXwVyH7at3hiV3XznSN0PsT+bCPEJkIZxWFbaNsZwWMY3ezSzCJrFPopOof+rRvCKcQF1f/C3MBKHaCsjO6qKd2hFmLZl2Szy0di9Hw26UA31WeEpT5OHwqbESvyuqiQbM1T7a7gQZaiwHDugOmdrBVz7rQEhibdUB+am25IwFFNNeEuwD7YjyfEbHL6kYbpSQXuTTlvSWDgtTDjLYoNuazD8ThRmr5ka5BPsXycJAGdFWk4YIF0Y/m3Pyu6an+KRCTazxh/NtDAzEVQfZKja7uuv5qhecVIhiFhZkHiaazqXvasl/pgFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EWMMda2nUjJTvNRB+odqGCZhjdlD3XzrnDcA57MdpA4=;
 b=KtV+/XO5OHLB5w1Y/c+lQUgeZnEIhX4y2As97L1vaIW9Df1ze5PIcJeOsoq37oO0H8ovqGyfe6X7sjhwWmufMegkMVvLl9awOqPHUh7eeSCw/w4aCEUj4Q0L8qGZyNXdF4npDlpSfl04cNKlI2wawpfy5xK6EYqDTDOZ+ymGp2tzN1zXh15t3IaPne/aKHIg8+qGW6kxuWKc5w07yhkUa+VMQgvt2HYhFeL100qchIe/IgkWn6O4UzcXR6sip0NqPK0EK/xC/6HR2E62DUI06ZKqqHo0ffTGGP7UIEw3q4BBjdsGDjRCS8rkSAzcuGrhjSQi/VU94Wxh2FH3hZwuFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ5PPFC0624F2CA.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::850) by IA4PR11MB9156.namprd11.prod.outlook.com
 (2603:10b6:208:562::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Tue, 13 Jan
 2026 00:58:14 +0000
Received: from SJ5PPFC0624F2CA.namprd11.prod.outlook.com
 ([fe80::88f4:becb:ece5:7e22]) by SJ5PPFC0624F2CA.namprd11.prod.outlook.com
 ([fe80::88f4:becb:ece5:7e22%6]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 00:58:14 +0000
From: "Mishra, Pallavi" <pallavi.mishra@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "Summers, Stuart" <stuart.summers@intel.com>
Subject: RE: [PATCH] drm/xe/tests: Fix g2g_test_array indexing
Thread-Topic: [PATCH] drm/xe/tests: Fix g2g_test_array indexing
Thread-Index: AQHceq3E2G8Do4iOWkerhnhXfcOVCLVPB/iAgABQwDA=
Date: Tue, 13 Jan 2026 00:58:14 +0000
Message-ID: <SJ5PPFC0624F2CA3EBC6DBC5DD1C9AB2C32828EA@SJ5PPFC0624F2CA.namprd11.prod.outlook.com>
References: <20251231233230.428953-1-pallavi.mishra@intel.com>
 <66b789c4-37b6-40f1-a34d-08b6ede3fa9b@intel.com>
In-Reply-To: <66b789c4-37b6-40f1-a34d-08b6ede3fa9b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ5PPFC0624F2CA:EE_|IA4PR11MB9156:EE_
x-ms-office365-filtering-correlation-id: 1028ea5c-c0a4-4a49-0715-08de523ed4d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?N1dsa0dSeVEwUlgwYUFuZ3lQUG5GbzYzQUFlUTVyVk5vYjd6M2hwcE9oZDJj?=
 =?utf-8?B?aGlkRGtnR201dVhlT3JRT1FPMHBka1FyckhmdnpjOGhzNEo1SG5SM3VTTjF4?=
 =?utf-8?B?eUYyVUk3dFBRVXJ2ZExtb2dZRXBFNjFVZVZ4TFJKOEVVV09TWEUrYkJBNC92?=
 =?utf-8?B?bndtTUFpSy9hRUQ5SDZadVhaa29GZFhOamhuc3l1QVoxRDhVMFhSWEFuOUpK?=
 =?utf-8?B?cmM1SU1jS0ZadGhpRlBFVHBwSTc0ckpxSW83a25RVmJ3cU90UWtTSGVmSEZk?=
 =?utf-8?B?OXRTd3EzNllrcjZGc2c0RHZ1dDRjdmxhNHlPZy9JcGZPVER5VCtUYS9pZWZo?=
 =?utf-8?B?MGVnZ0IzK0QrVGFjcXZITDdZMXhTZ21raWoxUjJRTDFkK1EveithVjFvcmxE?=
 =?utf-8?B?anhCNVJxT2pPK0NtLzRtbzhmdVBOQkZ5NkJ4ZFptbTBCVjJnaWg1TnBPM1F1?=
 =?utf-8?B?Z1lvNGt6b0RTUkp0elVUSlVVTXBaZDl3ZjdWbG5DRXp1WHovWkQ3ZlpIWWF4?=
 =?utf-8?B?aGxYaEYzU3Rkcmlhb3lYWnM2eDcvRmY5MUJ5ZGVybXpOWDRnOTIyelQvY1JH?=
 =?utf-8?B?ZWRLZ05VNEszSjY4amhnMnNnSDk4dE5uVkJ2bEpXR1ZTeU8rRG1MRlgyVW5h?=
 =?utf-8?B?aCsvbFFqS1RsQzNRalhHSXlEc2ovb0ZPeXUrNGM4eVNkUmZURXdvU05naUNK?=
 =?utf-8?B?OHZ0RiszakxuQ1J4eVl6NWxHZEZIWjZ4OWpid2ZxS2VBYnZ6aVFIT05VNEU0?=
 =?utf-8?B?VW5TeHFnUHdKNGRpdzZHcnlYeithWTFaNndLeHdZbjJDOGF1a1JIK1UwOFNt?=
 =?utf-8?B?dmtXTFQ4SzhkeTdBVG5XY2xQL2s0UGVjTEo5cU12MlU4bk92T1JPTWlJbWk2?=
 =?utf-8?B?ZjVUN3ZiREpJWjIvbUcyL0NPRU9Uc1pDbHlwWERrekp6V096eU8zUC9FRm9z?=
 =?utf-8?B?dlJtWGd0NERrb0xsWkt2V0JJU1dQRGhWVlg2S0tTaFJVRmM2b2NsUjRXYmtZ?=
 =?utf-8?B?ZGpKZFZCUU1NVFU1KzZ4c0dnV3RiQ0RyODI0bjJvdTNDZFRTVG9DRGwvL3hp?=
 =?utf-8?B?RzZBUCtNNEI0a3Ezamk1WXNyblFtcUUwTXZzNFhyUENLL2hVTjdtVEtpMjlp?=
 =?utf-8?B?Q3ZmUHh2UU5PUU5mdUJQK3V0Z3NBT2ZiclhBV2dZS2RYMTBpVmFmVU9FMmJK?=
 =?utf-8?B?dHMxUk5vVW0xL2pST043c0xzbllubWhxUFEzQkgzakZha2tDMWdaNUFsa1c2?=
 =?utf-8?B?TDc2cTFqcCt5WFZMcnNIbUpOUVFmaUpwOXNaanVqa01TYjkvVHRpckNHeURh?=
 =?utf-8?B?amE4VE1XNyt5MnhaK1g5cnRmSy9zd2o2K1dGa1d2UkNhYzV2WEFhM1pFY3A4?=
 =?utf-8?B?clI4bFpvSFBKZkxTS25XNFYwMzIzS1R1UXFPZ3IwQzZmYVBjYUMrMVAwcUFt?=
 =?utf-8?B?MVNGZzN1dmN3N2JIYXRURkh6cWEzSVFrQUhyWWc4NHlOVUsxRThaWlRqamUy?=
 =?utf-8?B?YnltR2hDWWlCcENDanNLQVpseitOekczNHR2Q0s0NllOc0ZhNWl6NHFtQW1v?=
 =?utf-8?B?RkxwbUdzWTJxaUoyNlFTN3lRVm1wR2p1bjFsWWJNbTkwY1llcDZBRWxzTXlF?=
 =?utf-8?B?Q2lOaUl5WnNDZ1gzQ3ZYTjAyVG5nZFBEVXVTNENYVXp3YXR2WklkK1BxL1hH?=
 =?utf-8?B?RDJ1SXFZbEFoWlU2aVR4WVcvcjUrVDNTQklTVHR2dWU5bGJBMVgyWEpKMzRC?=
 =?utf-8?B?NlI0R002b3JlMzJyRUgybktweUVoeGlBVXBLRnUySndwTFdCRHZidCtjbkho?=
 =?utf-8?B?QTNralRYQ2d4V0FGTGdXZWI2OE9vZkZKelhzL3RNYnBZenQ1TG5Yc3UxL0tJ?=
 =?utf-8?B?V2pyMUprdnJCOVVOV1BvWUhLb0wxZHJOWVFSOWovODZRbG5qc1AxMmdXS25K?=
 =?utf-8?B?TnZBU0tmMHhpUTdTL1hDaWk5S1RFTHJjRGV0VXZFU2lHQ2s1SnYzNFlvQWNB?=
 =?utf-8?B?bnJ5TXRBUjhYV202YWVMUy9KdE1xeU9YcGRmcTMrRkhsRldISkZnSWFIaEp2?=
 =?utf-8?Q?5AeG/Q?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPFC0624F2CA.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RGsvdWxkQUpYWm90TVQycjdZV0R6L0l0UE1YN3lKV2xtODdPVjdFTExsaTVh?=
 =?utf-8?B?OXdEOGtjRjhLczBoOUFHUEFrdktYQlFvNUZ1ZDRvQ2pVWlVLZ0dxRUF5dWta?=
 =?utf-8?B?MW0yeVVWUmVmSElDMCtqWjdBWlozam80ZmxxcitrQlFzaHdsUTVDaWxPc1pn?=
 =?utf-8?B?d04rZ09OZUF6MXRBbnVtUjIvNnlDanFRck81TklxS1hyaU9KbGw1aUNDVTh0?=
 =?utf-8?B?aklILytCb0xwREp3OEM3dm1Qb3NYRWMvSk16dXVpTmMwM1ZFT2NIVCtiSHla?=
 =?utf-8?B?aEYybmpUZFcvdVJzSE55ejh1WFkvN29PdWJQcWpteW9vTGdra1RYNzJGTzVH?=
 =?utf-8?B?b28yRmVtOFdaNGNaWUg0bGtWbkErSHpKWWFFSlY5TFZrZjQ0bkRnVVBEQXFk?=
 =?utf-8?B?bEVBQ3VOUW1MZUxkeFlMdEFQQlErclFtc2Nrc2IxMXhrTDZOMDhUelZrZFJ2?=
 =?utf-8?B?a0Y0eFlOTHloQW1MS0g0TUVqcEk4TytxU2lNQ0syazF2Rkc4SHQ5WTMzV2hQ?=
 =?utf-8?B?b2t0aDBLNlFQNzFhTUVzT1RsZjZHZnR0dnUvN3JoZDVVcXZuclZibEVJamVU?=
 =?utf-8?B?Q2orcXlkSnhicVl6Ky83ckhZNUxjdElXT3VkY0lXQW1IZHRXTU9kbjJDVTR5?=
 =?utf-8?B?WTRaL3FaOXZKeHpVQVJ1NjcrdUNzLzJtbFZVL0NHbFBkZy9mYmpPdHBOYzBN?=
 =?utf-8?B?TGwyYTFoUloxSW1kQ0RYVzV5R1RZNnlVcmFHQ2JCR25UY21PUTJJMWJxYTlZ?=
 =?utf-8?B?cWYvZGk0SUNhemlBMEZxT0YyMEtFYklpZWFEbks4eWFvVFRha2dnR1VUdVcv?=
 =?utf-8?B?UjJEeDg4R3ZSbUYxWmdDbnZ0YXl4OUNKRTljQTFoaUh2ZEZ2M0lwWTZFUXU5?=
 =?utf-8?B?R25qazFzeGFxRGx2Qm1sblhkeFUva0lZM29WZXMvS3pZcGU0UUlsTHMxNFcz?=
 =?utf-8?B?czlCem82aVFHUnY1TUd0RG12eWFVRHpNMWFXMzIwS21MTEtsQXpjWXYwMXll?=
 =?utf-8?B?TitxS1JCVDdFQTQ4UzRjNURQaytoVzM5ckdVTUNCeTZUQXJheVkrV2lRNmdk?=
 =?utf-8?B?ejNZQlRGc3pFYWNHd2cxU2Q3TzdYa2ZvdUczYXQ5cnM1ZytiempCVjlZVkp4?=
 =?utf-8?B?SXIrVS84UGVGVGR0ZXhqRmgvclI3dFk2V3pTNllEdFcrdWpXb2Mvc2JYcHlm?=
 =?utf-8?B?RWpRMlQxVnRvc0lFT3M3SVkxazB5bDhNNXU4WFFMdEdxM2FGTUhtRmgrQ003?=
 =?utf-8?B?ZStiNVVkTFM2dFZYS2hkdmNzYmVFeHhDRUI0NzMyU2RwUEdLeUh3UjlTZUE2?=
 =?utf-8?B?V0ZMR1g1NzRRVVVsMkhBKzd0QitScWpsMVVuVXN2YXlDRjZydUU0VjdnZDQx?=
 =?utf-8?B?UTNCUXBuZGlqMjMrM2dSZFI2ZUc1cVRJLzg1ZzE0STBneFl2cmJ2QVJINUFP?=
 =?utf-8?B?TlM4WTJTeW5ZQU1USTQ4eDdURzZIQVZNbzhMeDVsMllneTJQMi94UWtialgx?=
 =?utf-8?B?YU8xQ3FxcXJGWXFWc1JqR2hWcW43UzNJdFIrQTV3bU4ySlRDMlE2bWQvaGQ2?=
 =?utf-8?B?NWdaMVVhRklxOW1LQ3QvaUtlOTFlN3VRbHFRWHZtRWFZazJDcTFYZEJPZ3Nt?=
 =?utf-8?B?NWtBc2NuZHUyQ1hUVXV2dHgwc1dYUXB0QUlnLzJNVzAzQ1N2bjBSRGpSWGpC?=
 =?utf-8?B?ZkJNTWFCQ0NaTXUvaWlvVTVlTklPS3hvSlBrTzRlb0lsbS9wYVFpd0MvaWtS?=
 =?utf-8?B?ZUoybkw2bUFBRHBxMlBHZklmLytpTVlFOEtNem9Db0RVM0ZhOFRTWGQ3QnE0?=
 =?utf-8?B?M3dJU0FtbDMvNzRnZnVzZzJWTHJ4NkkwWU5OWWsxNUpUd3lob2s1VEZ2cmh6?=
 =?utf-8?B?aHg4dk9KU2tnQkNqeDRqc0JCc2licDZFd3E3Zm5pSUZwWmh1TEg4aE1Ed2h5?=
 =?utf-8?B?RFZ6TWVNaVZGdTBjNGxyc3RxS2g0UzlZQVF3Ymc3aGpxYXNPRXNNOWlYTXFl?=
 =?utf-8?B?dU9tdkpUQTFORmZsemp4bmdqaG9EVW9DVFVtU2FjYkZ1QkdEZkh5d2hrZ1Fi?=
 =?utf-8?B?VEJweFpwb3B2djJyYlNhajRmZkk4S0QzTnNkdHpaOWxCcUdweHArRVFlV3ox?=
 =?utf-8?B?TTRBdUNiMEpEYmFRdVZCbGxieHphaGxITHFoSkUwQTBoWkNjNFRKSmpPVGlH?=
 =?utf-8?B?ejI4TDFyaHZiSFE3SitEenprbHdKcWloMnJjeXRvSTVXT0ZIcHN6NGpmSm1K?=
 =?utf-8?B?YTBJNEZBNFRqN201M3hiL0JodnhjZ2pmTExWVS9rb2w0MXlxazNpd29yQlBh?=
 =?utf-8?B?d3VJNDRkOCtXSWd0L1QwSzdYMHdOOTk3SGQ5MjRTaHdLcUh4VStxZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPFC0624F2CA.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1028ea5c-c0a4-4a49-0715-08de523ed4d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2026 00:58:14.5054 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FlURZTO001hNY0h0MCTBsyBIjXAFJg/FzRT3RMLZNEtzXWFAq9wpk2240/sSFT6/LuBcxUjt30QVUVLRHY/OBKE2Qo31kgvPRvWwWFxrbsE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9156
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ2VyYW9sbyBTcHVyaW8s
IERhbmllbGUgPGRhbmllbGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+DQo+IFNlbnQ6IE1vbmRh
eSwgSmFudWFyeSAxMiwgMjAyNiAxMjowNSBQTQ0KPiBUbzogTWlzaHJhLCBQYWxsYXZpIDxwYWxs
YXZpLm1pc2hyYUBpbnRlbC5jb20+OyBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4g
Q2M6IFZpc2h3YW5hdGhhcHVyYSwgTmlyYW5qYW5hIDxuaXJhbmphbmEudmlzaHdhbmF0aGFwdXJh
QGludGVsLmNvbT47DQo+IFN1bW1lcnMsIFN0dWFydCA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29t
Pg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0veGUvdGVzdHM6IEZpeCBnMmdfdGVzdF9hcnJh
eSBpbmRleGluZw0KPiANCj4gDQo+IA0KPiBPbiAxMi8zMS8yMDI1IDM6MzIgUE0sIFBhbGxhdmkg
TWlzaHJhIHdyb3RlOg0KPiA+IFRoZSBHMkcgS1VuaXQgdGVzdCBhbGxvY2F0ZXMgYSBjb21wYWN0
IE7Dl04gbWF0cml4IHNpemVkIGJ5IGd0X2NvdW50DQo+ID4gYW5kIHZlcmlmaWVzIGVudHJpZXMg
dXNpbmcgZGVuc2UgaW5kaWNlczogaWR4ID0gKGogKiBndF9jb3VudCkgKyBpDQo+ID4NCj4gPiBU
aGUgcHJvZHVjZXIgcGF0aCBjdXJyZW50bHkgY29tcHV0ZXMgaWR4IHVzaW5nDQo+ID4gZ3QtPmlu
Zm8uaWQuIEhvd2V2ZXIsIGd0LT5pbmZvLmlkIHZhbHVlcw0KPiA+IGFyZSBub3QgZ3VhcmFudGVl
ZCB0byBiZSBjb250aWd1b3VzLg0KPiA+IEZvciBleGFtcGxlLCB3aXRoIGd0X2NvdW50PTIgYW5k
IElEcyB7MCwzfSwgdGhpcyBmb3JtdWxhIHByb2R1Y2VzDQo+ID4gaW5kaWNlcyBiZXlvbmQgdGhl
IGFsbG9jYXRlZCByYW5nZSwgY2F1c2luZyBtaXNtYXRjaGVzIGFuZCBwb3RlbnRpYWwNCj4gPiBv
dXQtb2YtYm91bmRzIGFjY2Vzcy4NCj4gPg0KPiA+IFVwZGF0ZSB0aGUgcHJvZHVjZXIgdG8gbWFw
IGVhY2ggR1QgdG8gYSBkZW5zZSBpbmRleCBpbiBbMC4uZ3RfY291bnQtMV0NCj4gPiBhbmQgY29t
cHV0ZToNCj4gPiAgICAgIGlkeCA9ICh0eF9kZW5zZSAqIGd0X2NvdW50KSArIHJ4X2RlbnNlDQo+
ID4NCj4gPiBBZGRpdGlvbmFsbHksIGludHJvZHVjZSBhbiBldmVudC1iYXNlZCBkZWxheSBpbiBn
MmdfdGVzdF9pbl9vcmRlcigpIHRvDQo+ID4gZW5zdXJlIG9yZGVyaW5nIGJldHdlZW4gc2VuZHMu
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQYWxsYXZpIE1pc2hyYSA8cGFsbGF2aS5taXNocmFA
aW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL3hlL3Rlc3RzL3hlX2d1
Y19nMmdfdGVzdC5jIHwgNTANCj4gKysrKysrKysrKysrKysrKysrKysrLQ0KPiA+ICAgMSBmaWxl
IGNoYW5nZWQsIDQ4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3Rlc3RzL3hlX2d1Y19nMmdfdGVzdC5jDQo+ID4g
Yi9kcml2ZXJzL2dwdS9kcm0veGUvdGVzdHMveGVfZ3VjX2cyZ190ZXN0LmMNCj4gPiBpbmRleCAz
YjIxM2ZjYWU5MTYuLjg1ZTk1YzVmNjQzYSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0veGUvdGVzdHMveGVfZ3VjX2cyZ190ZXN0LmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
eGUvdGVzdHMveGVfZ3VjX2cyZ190ZXN0LmMNCj4gPiBAQCAtNDgsNiArNDgsMjUgQEAgc3RydWN0
IGcyZ190ZXN0X3BheWxvYWQgIHsNCj4gPiAgIAl1MzIgc2Vxbm87DQo+ID4gICB9Ow0KPiA+DQo+
ID4gK3N0YXRpYyBpbnQgZ3RfaW5kZXhfZnJvbV9pZChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgaW50
IGd0X2lkKSB7DQo+ID4gKwlpbnQgaWR4ID0gMCwgaWQ7DQo+ID4gKwlzdHJ1Y3QgeGVfZ3QgKmd0
Ow0KPiA+ICsJc3RydWN0IGt1bml0ICp0ZXN0ID0ga3VuaXRfZ2V0X2N1cnJlbnRfdGVzdCgpOw0K
PiA+ICsNCj4gPiArCWZvciAoaWQgPSAwOyBpZCA8IHhlLT5pbmZvLnRpbGVfY291bnQgKiB4ZS0+
aW5mby5tYXhfZ3RfcGVyX3RpbGU7IGlkKyspIHsNCj4gPiArCQlndCA9IHhlX2RldmljZV9nZXRf
Z3QoeGUsIGlkKTsNCj4gPiArCQlpZiAoIWd0KQ0KPiA+ICsJCQljb250aW51ZTsNCj4gPiArCQlp
ZiAoZ3QtPmluZm8uaWQgPT0gZ3RfaWQpDQo+ID4gKwkJCXJldHVybiBpZHg7DQo+ID4gKwkJaWR4
Kys7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJS1VOSVRfRkFJTCh0ZXN0LCAiSW52YWxpZCBpbmRl
eCIpOw0KPiA+ICsJcmV0dXJuIDA7DQo+ID4gK30NCj4gPiArDQo+ID4gICBzdGF0aWMgdm9pZCBn
MmdfdGVzdF9zZW5kKHN0cnVjdCBrdW5pdCAqdGVzdCwgc3RydWN0IHhlX2d1YyAqZ3VjLA0KPiA+
ICAgCQkJICB1MzIgZmFyX3RpbGUsIHUzMiBmYXJfZGV2LA0KPiA+ICAgCQkJICBzdHJ1Y3QgZzJn
X3Rlc3RfcGF5bG9hZCAqcGF5bG9hZCkgQEAgLTEwMiw3DQo+ICsxMjEsNyBAQCBpbnQNCj4gPiB4
ZV9ndWNfZzJnX3Rlc3Rfbm90aWZpY2F0aW9uKHN0cnVjdCB4ZV9ndWMgKmd1YywgdTMyICptc2cs
IHUzMiBsZW4pDQo+ID4gICAJdTMyIHR4X3RpbGUsIHR4X2RldiwgcnhfdGlsZSwgcnhfZGV2LCBp
ZHgsIGdvdF9sZW47DQo+ID4gICAJc3RydWN0IGcyZ190ZXN0X3BheWxvYWQgKnBheWxvYWQ7DQo+
ID4gICAJc2l6ZV90IHBheWxvYWRfbGVuOw0KPiA+IC0JaW50IHJldCA9IDAsIGk7DQo+ID4gKwlp
bnQgcmV0ID0gMCwgaSwgdHhfaWR4LCByeF9pZHg7DQo+ID4NCj4gPiAgIAlwYXlsb2FkX2xlbiA9
IHNpemVvZigqcGF5bG9hZCkgLyBzaXplb2YodTMyKTsNCj4gPg0KPiA+IEBAIC0xNjMsNyArMTgy
LDkgQEAgaW50IHhlX2d1Y19nMmdfdGVzdF9ub3RpZmljYXRpb24oc3RydWN0IHhlX2d1YyAqZ3Vj
LA0KPiB1MzIgKm1zZywgdTMyIGxlbikNCj4gPiAgIAkJZ290byBkb25lOw0KPiA+ICAgCX0NCj4g
Pg0KPiA+IC0JaWR4ID0gKHR4X2d0LT5pbmZvLmlkICogeGUtPmluZm8uZ3RfY291bnQpICsgcnhf
Z3QtPmluZm8uaWQ7DQo+ID4gKwl0eF9pZHggPSBndF9pbmRleF9mcm9tX2lkKHhlLCB0eF9ndC0+
aW5mby5pZCk7DQo+ID4gKwlyeF9pZHggPSBndF9pbmRleF9mcm9tX2lkKHhlLCByeF9ndC0+aW5m
by5pZCk7DQo+ID4gKwlpZHggPSAodHhfaWR4ICogeGUtPmluZm8uZ3RfY291bnQpICsgcnhfaWR4
Ow0KPiANCj4gR2l2ZW4gdGhhdCB3ZSBjYWxsIHRoaXMgdHdpY2UsIGl0IG1pZ2h0IGJlwqAgdXNl
ZnVsIHRvIGp1c3QgaGF2ZSBhIHNpbmdsZSBmdW5jdGlvbg0KPiB0byBkbyBib3RoIHRoZSBpZHgg
c2VhcmNoIGFuZCB0aGUgZm9sbG93LXVwIG1hdGguIFNvbWV0aGluZyBsaWtlICh1bnRlc3RlZCk6
DQo+IA0KPiBzdGF0aWMgaW50IHNsb3RfaW5kZXhfZnJvbV9ndHMoc3RydWN0IHhlX2d0ICp0eF9n
dCwgc3RydWN0IHhlX2d0ICpyeF9ndCkgew0KPiAJc3RydWN0IHhlX2RldmljZSAqeGUgPSBndF90
b194ZSh0eF9ndCk7DQo+IAlpbnQgaWR4ID0gMCwgZm91bmQgPSAwLCBpZCwgdHhfaWR4LCByeF9p
ZHg7DQo+IAlzdHJ1Y3QgeGVfZ3QgKmd0Ow0KPiAJc3RydWN0IGt1bml0ICp0ZXN0ID0ga3VuaXRf
Z2V0X2N1cnJlbnRfdGVzdCgpOw0KPiANCj4gCWZvciAoaWQgPSAwOyBpZCA8IHhlLT5pbmZvLnRp
bGVfY291bnQgKiB4ZS0+aW5mby5tYXhfZ3RfcGVyX3RpbGU7IGlkKyspIHsNCj4gCQlndCA9IHhl
X2RldmljZV9nZXRfZ3QoeGUsIGlkKTsNCj4gCQlpZiAoIWd0KQ0KPiAJCQljb250aW51ZTsNCj4g
CQlpZiAoZ3QgPT0gdHhfZ3QpIHsNCj4gCQkJdHhfaWR4ID0gaWR4Ow0KPiAJCQlmb3VuZCsrOw0K
PiAJCX0NCj4gCQlpZiAoZ3QgPT0gcnhfZ3QpIHsNCj4gCQkJcnhfaWR4ID0gaWR4Ow0KPiAJCQlm
b3VuZCsrOw0KPiAJCX0NCj4gDQo+IAkJaWYgKGZvdW5kID09IDIpDQo+IAkJCWJyZWFrOw0KPiAN
Cj4gCQlpZHgrKzsNCj4gCX0NCj4gDQo+IAlpZiAoZm91bmQgIT0gMikNCj4gCQlLVU5JVF9GQUlM
KHRlc3QsICJHVCBpbmRleCBub3QgZm91bmQiKTsNCj4gDQo+IAlyZXR1cm4gKHR4X2lkeCAqIHhl
LT5pbmZvLmd0X2NvdW50KSArIHJ4X2lkeDsgfQ0KDQpTdXJlLCBJIHdpbGwgY29tZSB1cCB3aXRo
IGEgc2luZ2xlIGhlbHBlciBmdW5jdGlvbiBmb3IgdGhpcy4NCj4gDQo+IA0KPiA+DQo+ID4gICAJ
aWYgKHhlLT5nMmdfdGVzdF9hcnJheVtpZHhdICE9IHBheWxvYWQtPnNlcW5vIC0gMSkgew0KPiA+
ICAgCQl4ZV9ndF9lcnIocnhfZ3QsICJHMkc6IFNlcW5vIG1pc21hdGNoICVkIHZzICVkIGZvciAl
ZDolZCAtDQo+ID4NCj4gPiAlZDolZCFcbiIsIEBAIC0xODAsNiArMjAxLDEwIEBAIGludCB4ZV9n
dWNfZzJnX3Rlc3Rfbm90aWZpY2F0aW9uKHN0cnVjdA0KPiB4ZV9ndWMgKmd1YywgdTMyICptc2cs
IHUzMiBsZW4pDQo+ID4gICAJcmV0dXJuIHJldDsNCj4gPiAgIH0NCj4gPg0KPiA+ICsjZGVmaW5l
IEcyR19XQUlUX1RJTUVPVVRfTVMgMTAwDQo+ID4gKyNkZWZpbmUgRzJHX1dBSVRfUE9MTF9NUyAx
DQo+ID4gKw0KPiA+ICsNCj4gDQo+IEV4dHJhIGJsYW5rIGxpbmUNCg0KV2lsbCByZW1vdmUgDQo+
IA0KPiA+ICAgLyoNCj4gPiAgICAqIFNlbmQgdGhlIGdpdmVuIHNlcW5vIGZyb20gYWxsIEd1Q3Mg
dG8gYWxsIG90aGVyIEd1Q3MgaW4gdGlsZS9HVCBvcmRlcg0KPiA+ICAgICovDQo+ID4gQEAgLTE4
Nyw2ICsyMTIsNyBAQCBzdGF0aWMgdm9pZCBnMmdfdGVzdF9pbl9vcmRlcihzdHJ1Y3Qga3VuaXQg
KnRlc3QsDQo+IHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCB1MzIgc2Vxbg0KPiA+ICAgew0KPiA+ICAg
CXN0cnVjdCB4ZV9ndCAqbmVhcl9ndCwgKmZhcl9ndDsNCj4gPiAgIAlpbnQgaSwgajsNCj4gPiAr
CXUzMiBpZHg7DQo+ID4NCj4gPiAgIAlmb3JfZWFjaF9ndChuZWFyX2d0LCB4ZSwgaSkgew0KPiA+
ICAgCQl1MzIgbmVhcl90aWxlID0gZ3RfdG9fdGlsZShuZWFyX2d0KS0+aWQ7IEBAIC0yMDUsNiAr
MjMxLDI2DQo+IEBADQo+ID4gc3RhdGljIHZvaWQgZzJnX3Rlc3RfaW5fb3JkZXIoc3RydWN0IGt1
bml0ICp0ZXN0LCBzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgdTMyDQo+IHNlcW4NCj4gPiAgIAkJCXBh
eWxvYWQucnhfZGV2ID0gZmFyX2RldjsNCj4gPiAgIAkJCXBheWxvYWQucnhfdGlsZSA9IGZhcl90
aWxlOw0KPiA+ICAgCQkJcGF5bG9hZC5zZXFubyA9IHNlcW5vOw0KPiA+ICsNCj4gPiArCQkJLyog
Q2FsY3VsYXRlIGlkeCBmb3IgZXZlbnQtYmFzZWQgd2FpdCAqLw0KPiA+ICsJCQlpbnQgdHhfaWR4
ID0gZ3RfaW5kZXhfZnJvbV9pZCh4ZSwgbmVhcl9ndC0+aW5mby5pZCk7DQo+ID4gKwkJCWludCBy
eF9pZHggPSBndF9pbmRleF9mcm9tX2lkKHhlLCBmYXJfZ3QtPmluZm8uaWQpOw0KPiA+ICsNCj4g
PiArCQkJaWR4ID0gKHR4X2lkeCAqIHhlLT5pbmZvLmd0X2NvdW50KSArIHJ4X2lkeDsNCj4gPiAr
DQo+ID4gKwkJCS8qIFdhaXQgZm9yIHByZXZpb3VzIHNlcW5vIHRvIGJlIGFja25vd2xlZGdlZA0K
PiBiZWZvcmUgc2VuZGluZyAqLw0KPiA+ICsJCQlpbnQgd2FpdGVkID0gMDsNCj4gDQo+IEFsdGhv
dWdoIEMxMSBhbGxvd3MgaXQsIEkgdGhpbmsgd2UgdHJ5IHRvIGF2b2lkIGhhdmluZyB2YXJpYWJs
ZXMgZGVmaW5lZCBub3QgYXQNCj4gdGhlIGJlZ2lubmluZyBvZiB0aGUgc2NvcGUuDQo+IA0KDQpX
aWxsIGRlZmluZSBpdCBhdCB0aGUgYmVnaW5uaW5nDQoNClRoYW5rcywNClBhbGxhdmkNCj4gRGFu
aWVsZQ0KPiANCj4gPiArDQo+ID4gKwkJCXdoaWxlICh4ZS0+ZzJnX3Rlc3RfYXJyYXlbaWR4XSAh
PSAoc2Vxbm8gLSAxKSkgew0KPiA+ICsJCQkJbXNsZWVwKEcyR19XQUlUX1BPTExfTVMpOw0KPiA+
ICsJCQkJd2FpdGVkICs9IEcyR19XQUlUX1BPTExfTVM7DQo+ID4gKwkJCQlpZiAod2FpdGVkID49
IEcyR19XQUlUX1RJTUVPVVRfTVMpIHsNCj4gPiArCQkJCQlrdW5pdF9pbmZvKHRlc3QsICJUaW1l
b3V0IHdhaXRpbmchIHR4DQo+IGd0OiAlZCwgcnggZ3Q6ICVkXG4iLA0KPiA+ICsJCQkJCQkgICBu
ZWFyX2d0LT5pbmZvLmlkLCBmYXJfZ3QtDQo+ID5pbmZvLmlkKTsNCj4gPiArCQkJCQlicmVhazsN
Cj4gPiArCQkJCX0NCj4gPiArCQkJfQ0KPiA+ICsNCj4gPiAgIAkJCWcyZ190ZXN0X3NlbmQodGVz
dCwgJm5lYXJfZ3QtPnVjLmd1YywgZmFyX3RpbGUsDQo+IGZhcl9kZXYsICZwYXlsb2FkKTsNCj4g
PiAgIAkJfQ0KPiA+ICAgCX0NCg0K
