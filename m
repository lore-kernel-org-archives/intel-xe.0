Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFEC9C02183
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jan 2025 23:57:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D3D10E815;
	Mon, 13 Jan 2025 23:57:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K9LGkr/v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7ABA10E80E
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jan 2025 23:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736812655; x=1768348655;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=LDlO8NmuufdENI5ORbwyEEc0vUGipLi8uW4YhpNo2DQ=;
 b=K9LGkr/vR5xzgurqjqidUmcGrnd9/NoWnr0KFMeJjirzIlPyzpIsoGBP
 /PhtlBlog9pxqrwW8E/S+/b00wa7JglJhlz92mGIpOWA55rTGo8lzQrK2
 U4b52nTZzN0YekEZqReyyGKQ1lGMmjdvUuM/im/9hB8JNQnPMmaMzCB46
 mVyPjGK0BM6aZPZheuHZjHcyxpaKOqrYjsRZUv3ncwQUcWcVvKt9lgimo
 QRdnvAubzX4WkPazA/jI/XsSwk1ONTakvpf2/7PlK3GHjT0YuIxGCrdOi
 wS21cT8ldSISouFj6NyBIWmM9Yvv3BGQQ1J3HFYJfm9YLz7WQDT7e9g3d Q==;
X-CSE-ConnectionGUID: Tw5yGFQCT/yJXup9xY0jkQ==
X-CSE-MsgGUID: seKY48D8QlyqbxOcMBSsrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="62468895"
X-IronPort-AV: E=Sophos;i="6.12,312,1728975600"; d="scan'208";a="62468895"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 15:57:34 -0800
X-CSE-ConnectionGUID: gwIUDAgcRcu0HAz5YQHxRw==
X-CSE-MsgGUID: uLhkvEx5TXK35h2hOB3SIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,312,1728975600"; d="scan'208";a="104717182"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jan 2025 15:57:34 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 13 Jan 2025 15:57:34 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 13 Jan 2025 15:57:34 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 13 Jan 2025 15:57:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gOH0iCBjTwFhJeN2TRHXJpEuysSpRZe6qY4jJu6+ttmMdAsY+X7NwGfUTEjdrsLm4iToPpPkBxEn3zfb6/Fhp7AR/C04fMQJXm2XbUytOR5j4NeKJ3P9yHlygT8KkGFwef0DHEo7HttvU4NtSroksoGRL/PXfySxGP42VAvjjvIrVRP+EcTPvKMDk6QztKbTrg+K/nbCf5XUFFhmpVk8O2rW8rxLEbcuc8TKiNvO5H/82VjmV/LGx4pyClb++SG3dCQJVairukkMu4w/ZAJhxtLWdTZZQtB/L4ar/x6Ubf6jWV/1xloHrlIbhhqJwEYsGthgUq9U93dJwnRlF+IhBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LDlO8NmuufdENI5ORbwyEEc0vUGipLi8uW4YhpNo2DQ=;
 b=Rf38eljX0jgA+jRt1jr2nJGTTk8Quv4UmpX4IjE3We+CeMMrK8vS0UpJWNGh0cODpv5rhJ+zdcAJK5yVtOPKL2Xs0ib5wP1mi86Q81FIz4JBQKGPptfQ1PBdCoXS7TRSqHU87Y/NN14J3qhAwpfspy7rJOxH46bP19dhAZQ0vgjJ140Qr5UBJioymRFpKoqsRhnLqGV4O2cftrUOflmTSZ+DUco8xHZz6HyI9nIc2fd5zBTe+16gDm8Gr6vG4KvupWvA8hxwo6VKlTyNSar4qRgdsr4R7dbQfcYoP9PVOOChHzJWYpnatNu7E/9M/Iw9DPKEEFaMmVt90NZQQik/mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.17; Mon, 13 Jan 2025 23:57:31 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%6]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 23:57:31 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
CC: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>, "Mrozek, Michal"
 <michal.mrozek@intel.com>, "Souza, Jose" <jose.souza@intel.com>
Subject: Re: [PATCH] drm/xe: Mark ComputeCS read mode as UC on iGPU
Thread-Topic: [PATCH] drm/xe: Mark ComputeCS read mode as UC on iGPU
Thread-Index: AQHbTO/96QLHfOlDukSqpNvzt/h/erMVk+6A
Date: Mon, 13 Jan 2025 23:57:31 +0000
Message-ID: <e55de9e1a876069e2552e1d07e2d37b0b9acd0fd.camel@intel.com>
References: <20241212234606.2877233-1-matthew.brost@intel.com>
In-Reply-To: <20241212234606.2877233-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DM4PR11MB6360:EE_
x-ms-office365-filtering-correlation-id: d92c729f-f2e7-4969-b2ba-08dd342e0b48
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MnA4dmMyVDE3bnVBN1VOSVBleG9QaFRmUzErc2NySXdWcFFBeks1TGlhWnZI?=
 =?utf-8?B?b0gzNldIQWhuVEU1bW1UL0tVZEtCaXRBMGtpTHl4OUdRaVd2UGZ0aFUrVkJ2?=
 =?utf-8?B?RXEvNXZlQXVUN2JVZzM0ZVpCVnZtaldwYXpjMzZTazFzSEFUWFdwQ2xZUjVy?=
 =?utf-8?B?dnlNZVV4ckxqZU5NbXFOcWk0ZXNVakkvRWxQa1dTd0JRSDBWdWQ5TTlKME1N?=
 =?utf-8?B?R0g5eFFKRGtZeXBKMlJybjdrTjdjRTAxZHNFOXU4KytVV1F4ODFpZjk4M0FB?=
 =?utf-8?B?YWlXSjJMSTRWODl4cTFDMCs0aDcvVU1PbVJOQW1DbS92MjF5NHBzLzZ2dW9w?=
 =?utf-8?B?c1J6NFVrdzhaTDRFbys4azVwbnVsSkQvaDlEYzE4eSsyemJnYjBkNllyRW5N?=
 =?utf-8?B?K1ozUnJGajBSNldtbFpSc0l2YWpXdGl3a0t4aTVJUTFROHFVRnFXbUVKM3JY?=
 =?utf-8?B?T1o5cytnZ3k1Nmp6YXQwZ2NZU0MyWmhmSGUzK1M2c3RubS9hUkFRdTZlSVpj?=
 =?utf-8?B?OGd5WHBiNG5RbG5JUnQzTDRib2ErZHBDWHZqa0pCbHRjbDlRR05uUDJZNHlq?=
 =?utf-8?B?NitQYjR3SlVaby9WSXhOV0x3blR3RVNpY2JkNWNIbHVXQ2NyS3E0YThOYTBn?=
 =?utf-8?B?QzBSWWYyS3VEZDVGdmd3NmF3L1dDMzZDaXNNWHVnb2JZek1pcnB2Mkk2RkNx?=
 =?utf-8?B?WWRLNTkwc2Z3ZnRoYmJLaW1CRXR6WmM1aEdsUXFTWFZZRE5HUU5ETmY5YVVH?=
 =?utf-8?B?ejUxN2M4elNUY1lnOFh6d3hHSmVWSkhHUzNnOTY3ZWFUc2ZDd3dDVHlGNmc1?=
 =?utf-8?B?Mk5KN1Z3Z2dkdWxRWU9Ydll0YXIzSXkyTksxRVpWRTNUZU0zN3hDbmk4ZWx6?=
 =?utf-8?B?amNoOS9BNHlCNGFubGUva1BMZDdDb01rZFFTMDJvcno5bW1lTmVOeTJDdUdN?=
 =?utf-8?B?REd5SGpIN3dTQ1VJMG1vSGx2N0oxYitZNXRQY290UEczU1E4dTRvWXZKaVhZ?=
 =?utf-8?B?V1hISUhxZ1VOTy95RFRDMU82RnAvb21pdUZWTnFzT2Q2b3dGTy9KK3IxRm93?=
 =?utf-8?B?U09zeWZtWkNrcnNqS3JnK2JZU3dndlpDTkJpQXJsbGpQckdZUVJyb2x5N1RX?=
 =?utf-8?B?NW1VTHF2ay9WbzJqai9JUXZYTU5sVTVlMzZoVkdjQmozVkRxZzhWQ0JKTCtX?=
 =?utf-8?B?SUwyNGY4Qmw3TjZIa25nNmtiMEU5TnJWbnB4SGl0VlREQ2QxN2dYSWdROUpy?=
 =?utf-8?B?MW1Tc25RM0gzRHF1b0MzNDhrOTVxTWZIREh4MERIbmRNTVpOWUd6a1NvWmpO?=
 =?utf-8?B?Rng5aDBkRXJIbGNBZTZvU1g4dDAxUWpJOGdVNjhXRXVUayt4OFloTXJYWEE5?=
 =?utf-8?B?WDBpWFZaMGZFN0MyQyt3dGRhTmc2ZkluM0ZBZ0t5U1l2S3JNT2JreXpBaWp0?=
 =?utf-8?B?Q2ppV2N2eDZmYU1Edm53RHBiOVY2YXh1SFd3MTlMdDhXdGQ1WHR1bHB1dTEw?=
 =?utf-8?B?YzdTc1RYY0RGZWxjbzBNd3pvZlVDamVqQXQ0V0VZWCs4L2N0TmV4RytMcnBJ?=
 =?utf-8?B?bStMU0dRcjZFNmQ0bzJ0SkVOK1lVbklsaU80dkdEc3lVQmJtVktFSGNnMHZw?=
 =?utf-8?B?TUU0UU51L0FUQmpGNnl2S0dRdGZmRlNRc1pTenZBeTcxSCtNVmxrR3RaRS9p?=
 =?utf-8?B?STdZRGxKa1JobktrTUlKVEEvcjZJeEo4Z2Qrc0M1Smx4ZVNQbHMxZVI2V25s?=
 =?utf-8?B?NzVBeisrUjdyUENqdDVGc2JkWFVEYkNHR1kvOEhnTHVab3pIK3JFMkM4UWEv?=
 =?utf-8?B?V3FraDNaZ1lkZ2E3UXdFWUFQeThNR3pGcTcrbkt3TXR1MjMyVmpubjRpWm5s?=
 =?utf-8?B?WDRsLytkOUx4WjIzVm90ZXptbWJJbVJheHlOL09qYmhQOG9XWU1LcXRvZWpk?=
 =?utf-8?Q?KsrAe3KvK/JD3+l8wJKdgRlwkSEwiRP9?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q01CeVhIQjEvdGtOUlA3NmtuVVpuSkZFZUdXWm4zVk5QVnZQcURFdTN5dGpx?=
 =?utf-8?B?OUQrRjhjWjhrYm8xT2RDaFRNNDk4TjY2VzVuaVB2ME9YbVlaL0tpbU1NbkFM?=
 =?utf-8?B?M2Rqa01KYzlpVDAvT0kyNkl0KzFlSE1Vb3ZIQjBpQUw1RTVvaHlmdUY4a0tq?=
 =?utf-8?B?M0htdjljNWEwd0crS0x3V0ZYQUZZY0pGUys5bDc1bEdKSEZ5RE0wUkZkOXZY?=
 =?utf-8?B?WVRlNENhcWl0K1FJYzBBWE1kQUo1RmpNUFpkK0ErM0JQZ1NsaEpaTTVWRzd4?=
 =?utf-8?B?OEJVY3BMSG4yYW9xUk15ajNyVWNnbldYdS94WjJha0dsOHMxUWl6Wm9TWjN2?=
 =?utf-8?B?VUdFbVZ0MTNjSjZTbDQycUgvQXhVYjZWUU1sSGp3VXZOekVJdlBKRjkvQVpR?=
 =?utf-8?B?U1FGNEN0RWdwYldwY0Y3ck80TlNuZmNkL3Q3dnIyYWVUZXdURU9mNXUzS0ls?=
 =?utf-8?B?RUM4RjZXMkw2akVPRU9LNWZhazhJeGtVWlYvdmVWdHdDeUVER3l1MUxGai9J?=
 =?utf-8?B?YlQ5bDFLZVNYODkyaFk2Ly9kTGNNdzN2RVorWHJiMldycktRcFJ2YXlzSEFD?=
 =?utf-8?B?RSsxcGFQVUh1NXErS3lPZ1hvWFlEWkgrOG1MWVdTeHVHSWliVDJZemFFUDUy?=
 =?utf-8?B?Mit4ajh3bVJrdjhsWi9JMGw2aVhhUUNnRmRXWTNDNDJ1Z21xMDBxWmJCYmN5?=
 =?utf-8?B?WWR6cGQ5NGhmd0VObGs5M3daalRQN25IejJ5ZEsxczU3R3NOQnlhZUpRNy8z?=
 =?utf-8?B?UFhjMUVYVnBPbWRiZG9rdTM5UDF1M09aMVZzeVlHU0NuY0Z2R1N2SGw5UEo3?=
 =?utf-8?B?RFgxZWRMNnRwQU9BVXQwTjFnQm9KWkpMZDE0aVhlK0ZIbmYxaUhyZDdkUUpL?=
 =?utf-8?B?RDJjR2lNSnVKMEZaUmRySDRqaW1rSVQvNDJuZHlYME9MTFFSNmVGZlgxTFJY?=
 =?utf-8?B?UHVjSDl2V3dybUp1d1QvS29ZODhUQVJ6aVkxUFFjdCtBUFFhMmxQZmdqMlJW?=
 =?utf-8?B?VHUvQUdTV2x6ZlA4YWR3SFpRUU5tM1dLVVFOcXZ1bFpUSGxwTXI1eXdrODMz?=
 =?utf-8?B?Rk10aGpEN1RkTTlUYWpKTjFRU3hsdU1MRllieVE0RmZ0QVNFRjhUNU5zYytv?=
 =?utf-8?B?R1ZXUk15YVhWVnBmbmtTYWt0WjBHS3JNWGQwOVlLeTNZMm5EeGNmOHJoS0ZF?=
 =?utf-8?B?TVczSFpLR0Y3Y1l4SHlZbWR4RjJNTFIzTGFDcVF5dzZ4b2dZNlJHTktXQ0th?=
 =?utf-8?B?ODV3NGgwZ1FPbFFNdW1ZL0Jsb3dHWno5MXFvejYxeFQ3VmJ3NTRmeG9rdHY0?=
 =?utf-8?B?dHl2cDJ1MjRGQjJBNHRrUmhCcTdsWGZ0Ykw0bzMyL3FVUWwxSVBrNHpLc3Qy?=
 =?utf-8?B?K0tYdUQzZ05LaStGUHhOODZIR0NHYndqOEczUmRDeXBKMldNNGwwTG53VStW?=
 =?utf-8?B?ekNzRVFnczlRTkxORitNdEsvK2dYdHRsQklKeEpiV2ZNSlBvL2syUUhRbHdT?=
 =?utf-8?B?N3N3bTZTa2E2SzNRUE5uWXdwN1ZKenVLcTkxVDhEdmdUL0xkWG93aTI1dWlU?=
 =?utf-8?B?UVdZSFVyVDhEU3I2TE1pN3NpYzFEOUczY2ZaTU1PQUVkcFdlSjZ4dWRTM3hx?=
 =?utf-8?B?K0U2MFZoQmNmSnhHZ0lwb3R2cTZPOHBoUUVHWGpoN3RpTit4TnNyMUlMbGF0?=
 =?utf-8?B?MWRIcG1MZ1BoWDVmYk5FbDBkUG9ZeTdwUEtSTjZFa0hHejdobi9hUXhKNmwy?=
 =?utf-8?B?TzBBS0NvWVErTFVEcmp4Zi9BNWJGWUxBdzNVZGM3R0N0cDVPSWkrUGphc0k2?=
 =?utf-8?B?VXJOK2JETVluQ1dyWXpORXlNR0xVYTA5UEZDblM2VWhPZ2w3NnF3cHRGZmI1?=
 =?utf-8?B?alFiaitHTGIwZHp2Nm1vYjkwMEVJUWJwN1lkRU51bG5RWGVPb2VqQTQvZDUr?=
 =?utf-8?B?U1ZYQU53VGQ0OGFKN1VEdTBSbnhUN2FWNzVDY3VEcm52UXE5WDNRVmk3TEdM?=
 =?utf-8?B?Qm5qcmlzS25ZMlB0UHNFbFdZOXBTTlFuaTRpSVJLZTMvTnYxY3VwMGtWUkZD?=
 =?utf-8?B?Y2RwU3I1bVFpSkE0S0RUeG12ZTZyaVlOb0kzWWFQc2NPNEZPaGVmNDhRaDhm?=
 =?utf-8?B?QzF0SWFGZ2Z6eWM0YS9qcXZaeVZ1bEtydytlSnQ1d3VlT1RIc1FxZFhtb0RW?=
 =?utf-8?B?Y2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <51297FD7B991284D9BE6D9C782F5A9C8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d92c729f-f2e7-4969-b2ba-08dd342e0b48
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2025 23:57:31.8308 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mBPbfJFtca22XqmmfC4XRTz1cRIwOutrjdPXVAIcw+RWgFry3tRYMeW6bKmXD5qt4DDlR0iB8Y71Crfe+GhRogFXSczTeaQIXiGCPtxx/LE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6360
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

T24gVGh1LCAyMDI0LTEyLTEyIGF0IDE1OjQ2IC0wODAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBSSU5HX0NNRF9DQ1RMIHJlYWQgaW5kZXggc2hvdWxkIGJlIFVDIG9uIGlHUFUgcGFydHMgZHVl
IHRvIEwzIGNhY2hpbmcNCj4gc3RydWN0dXJlLiBIYXZpbmcgdGhpcyBhcyBXQiBibG9ja3MgVUxM
UyBmcm9tIGJlaW5nIGVuYWJsZWQuIENoYW5nZQ0KPiB0bw0KPiBVQyB0byB1bmJsb2NrIFVMTFMg
b24gaUdQVS4NCj4gDQo+IENjOiBCYWxhc3VicmFtYW5pIFZpdmVrYW5hbmRhbiA8YmFsYXN1YnJh
bWFuaS52aXZla2FuYW5kYW5AaW50ZWwuY29tPg0KPiBDYzogTWljaGFsIE1yb3playA8bWljaGFs
Lm1yb3pla0BpbnRlbC5jb20+DQo+IENjOiBQYXVsbyBaYW5vbmkgPHBhdWxvLnIuemFub25pQGlu
dGVsLmNvbT4NCj4gQ2M6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwu
Y29tPg0KPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZw0KPiBGaXhlczogMzI4ZTA4OWJmYjM3
ICgiZHJtL3hlOiBMZXZlcmFnZSBDb21wdXRlQ1MgcmVhZCBMMyBjYWNoaW5nIikNCj4gU2lnbmVk
LW9mZi1ieTogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+DQo+IC0tLQ0K
PiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuYyB8IDcgKysrKysrLQ0KPiDCoDEg
ZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lLmMNCj4gYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfaHdfZW5naW5lLmMNCj4gaW5kZXggYjE5MzY2NzQ0MTQ4Li5jYzI1OGIyYTc3
YzkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuYw0KPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lLmMNCj4gQEAgLTQxNyw5ICs0MTcs
MTQgQEAgaHdfZW5naW5lX3NldHVwX2RlZmF1bHRfc3RhdGUoc3RydWN0DQo+IHhlX2h3X2VuZ2lu
ZSAqaHdlKQ0KPiDCoMKgwqDCoMKgwqDCoMKgICogZW50cnkgaXMgcmVjb21tZW5kZWQgYnkgdGhl
IHNwZWMgaW4gY2VydGFpbiBjaXJjdW1zdGFuY2VzDQo+IG9uDQo+IMKgwqDCoMKgwqDCoMKgwqAg
KiBzcGVjaWZpYyBwbGF0Zm9ybXMuDQo+IMKgwqDCoMKgwqDCoMKgwqAgKiBCc3BlYzogNzIxNjEN
Cj4gK8KgwqDCoMKgwqDCoMKgICoNCj4gK8KgwqDCoMKgwqDCoMKgICogWFhYOiBBY2NvcmRpbmcg
dG8gaW50ZXJuYWwgY29tbXVuaWNhdGlvbnMgYnNwZWMgaXMgd3JvbmcNCj4gYW5kDQoNCkNhbiB5
b3UgcmVtb3ZlIHRoaXMgcmVmZXJlbmNlIHRvICJpbnRlcm5hbCBjb21tdW5pY2F0aW9ucyI/IEl0
IGxvb2tzDQpsaWtlIGZyb20gdGhlIGxhdGVzdCBpbiBic3BlYyB0aGlzIGlzIHByZXR0eSBjbGVh
ci4NCg0KSSBkbyBzZWUgb25lIHRlc3QgcmVncmVzc2luZyBvbiBMTkwsIGNhbiB5b3UgZG91Ymxl
IGNoZWNrIHRoYXQgdGhpcw0KaXNuJ3QgcmVsYXRlZCB0byB0aGUgY2FjaGluZyBjaGFuZ2UgYmVm
b3JlIHdlIG1lcmdlIHRoaXM/DQoNCk90aGVyd2lzZSBsZ3RtDQoNClRoYW5rcywNClN0dWFydA0K
DQo+ICvCoMKgwqDCoMKgwqDCoCAqIFJJTkdfQ01EX0NDVEwgcmVhZCBpbmRleCBzaG91bGQgYmUg
VUMgb24gaUdQVSBwYXJ0cyBkdWUgdG8NCj4gTDMgY2FjaGluZw0KPiArwqDCoMKgwqDCoMKgwqAg
KiBzdHJ1Y3R1cmUuIEhhdmluZyB0aGlzIGFzIFdCIGJsb2NrcyBVTExTIGZyb20gYmVpbmcNCj4g
ZW5hYmxlZC4gQWRkDQo+ICvCoMKgwqDCoMKgwqDCoCAqIGJzcGVjIGxpbmsgb3IgZGVsZXRlIHRo
aXMgY29tbWVudCBvbmNlIGJzcGVjIGlzIHVwZGF0ZWQuDQo+IMKgwqDCoMKgwqDCoMKgwqAgKi8N
Cj4gwqDCoMKgwqDCoMKgwqDCoGNvbnN0IHU4IG1vY3Nfd3JpdGVfaWR4ID0gZ3QtPm1vY3MudWNf
aW5kZXg7DQo+IC3CoMKgwqDCoMKgwqDCoGNvbnN0IHU4IG1vY3NfcmVhZF9pZHggPSBod2UtPmNs
YXNzID09DQo+IFhFX0VOR0lORV9DTEFTU19DT01QVVRFICYmDQo+ICvCoMKgwqDCoMKgwqDCoGNv
bnN0IHU4IG1vY3NfcmVhZF9pZHggPSBod2UtPmNsYXNzID09DQo+IFhFX0VOR0lORV9DTEFTU19D
T01QVVRFICYmIElTX0RHRlgoeGUpICYmDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKEdSQVBISUNTX1ZFUih4ZSkgPj0g
MjAgfHwgeGUtDQo+ID5pbmZvLnBsYXRmb3JtID09IFhFX1BWQykgPw0KPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGd0LT5t
b2NzLndiX2luZGV4IDogZ3QtDQo+ID5tb2NzLnVjX2luZGV4Ow0KPiDCoMKgwqDCoMKgwqDCoMKg
dTMyIHJpbmdfY21kX2NjdGxfdmFsID0NCj4gUkVHX0ZJRUxEX1BSRVAoQ01EX0NDVExfV1JJVEVf
T1ZFUlJJREVfTUFTSywgbW9jc193cml0ZV9pZHgpIHwNCg0K
