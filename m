Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D0BCA0FF6
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 21:53:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6829510EAE4;
	Thu, 28 Aug 2025 21:53:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KrGTHrMo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7827210EAE4
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 21:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756418026; x=1787954026;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=/gJSGDoFtPOydlAyVM68uQC5eyxWfT5OQq4QLRazsHI=;
 b=KrGTHrMoiLUz4BluXjzpoL2BOpbK1hvA/WyllURbxell3gNYRSsxX6L/
 8L/7nGvFwRGcTUjib0usFxMEQSpF+x95eEz5FtWzGACQqx9ogu3c9xToj
 3Vgrv66kAn33I2mmp7ZIvVV0KU4mVrhWAmdaPrnV1NbBgyrUA+IM8RDgm
 dS0xOftbA9wf7NCkkAIQB5s4aKnbJsC9nE2G8G1PPxuR+rCWnqmgIC2kA
 1JuqMKVKHq0iy885/4kaLsnr344Dr0Wwhpfg0dNtD8KmfPIugHw0b41LX
 2Uu4BMaw07qA2eL5jJmx/jkpoY+p7rOk/dYn/KNkvjsLO3Yj0SPFmj/L6 Q==;
X-CSE-ConnectionGUID: 16aFeWj2T+GHwXgANDq/Jw==
X-CSE-MsgGUID: DeGRhtY7SUmDJnk78h09WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="58410674"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="58410674"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 14:53:46 -0700
X-CSE-ConnectionGUID: 0Rgbq8SzRSq5KjqcNRtF+Q==
X-CSE-MsgGUID: Vwu7ijOqR4qrsCGKSIbZcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="171015165"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 14:53:46 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 14:53:44 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 14:53:44 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.52)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 14:53:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yfvKSACerIoov17/EDS7GLum9pRtyfgZbyEC9EayfJ+5vTYrk2/KIG0OCFpqwAzvHf/2fIAHSIzP2uPlbJ6EzaFwjoa4C9skqPPIDzcEA94vkROXlZhkN/See+yxs2CppD7ZP7H6bvDbmoIXVKl9IHN1bOS9YY+TBO+B59sOTgwYsLN2u9mF1t6PiwYg2t0ljCdE7ftxnLO/hEBySOCCDiKEHZ/hTTC5wuB44d97W3TAX0gVJNIZeoNuGhD5oROLZhV/Vh9Nzmk83K14nEjGPDMPbIalibdEHf4Q9xSh59k4H9VQffypD+dWAh5XN0rCUP7hsZHfDznxbRFQT1Az3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/gJSGDoFtPOydlAyVM68uQC5eyxWfT5OQq4QLRazsHI=;
 b=KpO9/Y/JXwddI00zZKPtYHIS/q4JIQi5m34pM5S+Rius4Vk/wEQbDHII3pxTIx5fYMGu4fdzdd9R37qcpSTiNa1dIuEuQsVAdrrRQ6xxQNkH7ragpGlL0MyqEY+1qWKgseBJouoSCu1zZnH2JR5aoSZ7GfwEP00MQW3ngJjShndZUIfrnxluBZCbfAkOoAZKVOogiq9u+n4O3fTy7b7dBGsp8b0CzAwRrnqL7eW80wyh4kZP+EApAa/xS7h6+D72joPwEnl6V7SV6nr/umhcUf2m/NldWCNwk9pLVKo0pIpohBnaBvi1BJ54n+DKkAtA6SX6blUK8FBNtIcnqe1G7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DS7PR11MB7805.namprd11.prod.outlook.com (2603:10b6:8:ea::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.20; Thu, 28 Aug 2025 21:53:42 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.9052.021; Thu, 28 Aug 2025
 21:53:42 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Update GuC log buffer type value
Thread-Topic: [PATCH] drm/xe/guc: Update GuC log buffer type value
Thread-Index: AQHcF5zmd8mt97z5gU+1KB7AkZwgObR4bJ6AgAAvZwCAAAEwgA==
Date: Thu, 28 Aug 2025 21:53:42 +0000
Message-ID: <e0db801f2d93ff682aa916990aee8c5840eb671b.camel@intel.com>
References: <20250827215217.1030775-1-zhanjun.dong@intel.com>
 <658967b09cecdf0f20ad3547d4ab5ed3e016964d.camel@intel.com>
 <0b71e049-bdc7-4ece-a978-26e4f538efc6@intel.com>
In-Reply-To: <0b71e049-bdc7-4ece-a978-26e4f538efc6@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DS7PR11MB7805:EE_
x-ms-office365-filtering-correlation-id: 0f3d01a2-973b-4599-2a79-08dde67d5acb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?c0RWdnEyN0NuSzhpWXBIRkJWQVp5MnZ6ZTUvcGJYMkxqUW9FdFMvVUNtN01J?=
 =?utf-8?B?bGNJRDNuQlVaQ2NaSmRYSEVNUHBqTHA2cC9yYnQ3dWY3SmE0T3BlV1NzUTRq?=
 =?utf-8?B?NkhyNGg4aytEcVRyNkFwRy9LeW5wUmcrM2dXcG4vQ2E0RWlBOUQ2M0VXNUZh?=
 =?utf-8?B?QzR0V1p5SHlzODMyK0Z5YzJlb0FQcmRFTkp6Sk1Xc3FZQ1dLSEE4Z1p1RFpu?=
 =?utf-8?B?YVNRRzNwWmFneDBrZW1oemZOYU1xTHI2bjczenZnaHNtRkJkZE5vZzc4b09i?=
 =?utf-8?B?dFp5RnRSWW5XNWlHS09lY0pidDV1QUJMSkNVVVRqYUZVY0ZZUDJNVWFReldZ?=
 =?utf-8?B?aC83aDE5ZHozUUE5dmJmS2JaRFpHanM5YWtKUDA4Vyt3N05tYXMwZTd2ZEts?=
 =?utf-8?B?V0NKbmpac09GWUx6dFVTQ3pYVUd3SXArOUY0a0hJSFVrdm5rc0gySDZ6MTA5?=
 =?utf-8?B?dTJUTzdpY0NZd3ZRZ0RGM0RkYXZoNGt6eTJpMlU4NWF6OUV1cUNvdDQxdzBO?=
 =?utf-8?B?TTE3Wm5NN0g2R0U5OVBpL2VOVWVObmpUT2UrQWQ4UHc4U3ZuTldGU29ONlRk?=
 =?utf-8?B?bDJwUkkzZmpNb2VFRGEwMS9mZi92d3pWRTBRV3BRUTdaMHdqTkdQdXZXc1JX?=
 =?utf-8?B?ZzB6aEZ0TktYbGtaSW05YURDaVpwajRwN05jdFM0ZmFuczNjUVErUGJONXNL?=
 =?utf-8?B?WXk3VU5xWlBWaWxseSs3K1pDQVgyOE5qM1UyNklsVWxVcGVCUnZZWncxZ01G?=
 =?utf-8?B?R2hycHhPZ3h3SHNxQVBPWFZ6aktaQ1FOMWR2bkd2SVVVdmxPcnM4UnJnU3Q0?=
 =?utf-8?B?YTlRc3VabEZvbi94ODhweWZhdmtKbVJTeVB6MVN1ZkhZNHZNM1Q5OSthUDdl?=
 =?utf-8?B?NlliM2JPY2paWGlQMG9PM1lPSzV2M1o1NkhzVDMvWG96ZlkwdEhkK2pTYkJ0?=
 =?utf-8?B?MFZoeHE0UUNxWlpmaFA4WG9Cd3FjaGlvcWNpZThsTm5hZzltWHlOS1VzcEdW?=
 =?utf-8?B?Q0FsdEk3K2gvRUI5Ry9nSVVlakZhQmpTZWlkZXMvYk9qTkhhUEZqWGNqZWJP?=
 =?utf-8?B?aHFSbGxBYVRIRzFlSHBEeVVrd2REVVBFaDJld2JsN05iRDgreGFSazI4bW5y?=
 =?utf-8?B?M0NyZkVjT3VaQkxUNWxyR3ozeGg3YU81L1ZVMVZGOThYTUkydEhiOUFXdUJv?=
 =?utf-8?B?aHMzaTEwL2dyUE5ZVmhFcUJoOEZzNWR0QTNJcmc1aExJYkZhZFdPRTZVMVB1?=
 =?utf-8?B?anoxeEtjZnAxa25uNlRHeEVSRlZpM08zNHZnVUM5cExPb0xUUzVyVHhhZFZ3?=
 =?utf-8?B?SnpWRDZYaTFMOWp6SkM4N2p4cWM5NDU5RkpHbmluWnFSMUJnODVLczg2SmRX?=
 =?utf-8?B?NnpkR2hwditKWVROazVCZ3Y1RWcvRlRVNk05NXRINElSVnhYb1JBS2xzb2NP?=
 =?utf-8?B?NHg0cWtiUkVIc2hacWI3OURKQnlmVm1TNytrZDgzS3gyYzdGUk84eUhtU2g2?=
 =?utf-8?B?azBnVGxKaFh6a1VwZWtZOTluQng1b01sUlM3K25udFRENDR2WXFmd2hQVWha?=
 =?utf-8?B?M2tHd3FKZ3orclAyVE55OHBzb1lVUlhNRWZQZm16ZTliZDZxNDV5UXMzNTcy?=
 =?utf-8?B?c2E3bzVjSEJZMiswcVZyVVc4anMxWkxMa1hSVE4zVFB1UGNaL1dDUVl4QjlR?=
 =?utf-8?B?dCsybmw5dE8ra0lYUEFRTUR4Si9JUE9NR0lZcmdEWm1vNm8wU2JkZFBMYlpE?=
 =?utf-8?B?NFA4VFR4UnZMNzh5RUl1TWtqamY2WHQvTVlLblFab1NhWGRCYUhxSWI3b2FN?=
 =?utf-8?B?VnBGaEJ2RWFOVUtjYmpJRzUyNEsvTjBqKzV4SW5iNHRIMVA0Vk5BMms1VDJQ?=
 =?utf-8?B?VjY5K2N0ZmtENEFtRys3c2hVcU5Zb29hU0FCbTkzOGhuOUw3WTVMeVdOTjU4?=
 =?utf-8?B?c3RBcWk3Njl4TTFsbHdDM2VsZWN5dmhLR1d4R2tIY28vQS8zSFNqbW50VVhl?=
 =?utf-8?B?Umt5MEsxaEh3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TVdtbUlGcHJKSStUdTZOcjBLL0g4Z1VzMXRLcXMzRENFNXlndnkycm4zQnpT?=
 =?utf-8?B?RGhkWHBGUnBTSXpGeFNySEpYT1NUQWhWN0I5T0V5TUJxS3ZxZEp2U0NXbEVi?=
 =?utf-8?B?Tmozb09JSHBCd3R1T090N2hBZW4yQm9hNnJFMlY1L0dwQk1FRXRvSE5Zanhn?=
 =?utf-8?B?WEFCNHc3MlFuUVNjcGtvbG82dm1rOS80UTA2c1U0VzNYSWQvb2lNa2lRREVE?=
 =?utf-8?B?UWl3WXM0RS9QR2pPejZlV1RKNkVScy9zVm9ONVVacDhPRGNGQ0diYW5mbmtP?=
 =?utf-8?B?MHd4YTBaWVdxS1ppWTBUTTMxWERYZ2dQckM4ZWFmZ3UxSU1Sa0c2N3BuYTFa?=
 =?utf-8?B?VXJOdDZ2R01vMVlHYWV3TTNxMk15b3A0QVl6T25hbDY4anpkcEtNM0FTbC9Q?=
 =?utf-8?B?TzlJYURvd1JqOUYxYmhGVXpxL0ZiV2xTRm9aZmM4RlE1UjBqeGlYS3NFZ1BW?=
 =?utf-8?B?WTdZMWJBbDhyb1JFQW9CWEoyVXphN1hEemloMERjM01xOFpKZmtIbmE2eVh4?=
 =?utf-8?B?S281Ykc0NU9ZSnRTaWZYdTViUVhPNXd2WjJvUkJTTmxBWVIzZnRpcit1STF5?=
 =?utf-8?B?a3o4VG9rVjZUdWFJdXBQcTFYcHBIblE2MHJrY2tMZXlxQ3YzazhOWDRDMktJ?=
 =?utf-8?B?WlM0bEErbjdUdVRpZURhVDY1R1lmOVp2WEYwUk8xUU9QQm0wSDI5ZEhoWGFU?=
 =?utf-8?B?YW90NWhjS2p1dGRVbGg5cFhGUEw0dHBBZDM0UWFLait5cGdnRVNLMEdDODFN?=
 =?utf-8?B?VXhzcVZNRTFod3RhbzFoZDhiSzhnTnVZWTd1ZndpMDE0RzQ2MVpMWGVDQmls?=
 =?utf-8?B?SHNBU0t6aEMxTkxCSUNHZTNiSWhZTXluZThpbDBUR3VreWhUR2t0MlBmZHI5?=
 =?utf-8?B?QXpVYkFoRzhKaGpteGpmUytTRXlESGlSd1dUb1ZwQVgxTWZySVByaWhkSzRD?=
 =?utf-8?B?bWo4K1B6Rzlmd2xDNEhiRk10bmFBQWkrb1BYRVJsRTR1TnIwN3VmNXNzaDNu?=
 =?utf-8?B?YkErQ2NHMUt5R0Nqa3VWa242T2FWeTZ5TzhtdFFSd3I1dHY3QXRPVmpvYU9k?=
 =?utf-8?B?WTkzaHY5Q2dZWDlNZS9jRlpaTzFSdW5TcFFJN1BDWE5JME1RaEVLK0JPSWdH?=
 =?utf-8?B?Z2hSd3Naam5LT3NwKzAzNTd3UjF2cjBRTVMxdGloMlllejFQMCtxUjhzem5q?=
 =?utf-8?B?TXdIKzRhUnJnT1JScFR6K0ovSG12THk4TDZ1WUt4bUJuekNxTWVkZklGREc2?=
 =?utf-8?B?bWcxS1dkV2VuVUVSM0Z3WmQ0Uy9iKzgxem96UjNEdU1JNWVOSk5JK3N6ZDRh?=
 =?utf-8?B?d05rV0kwVk5jSW1SM1c5U3dqTXAwQ0M1ZlFERVVxcmIxU3BuU256QlFCd3h1?=
 =?utf-8?B?OHlRMnZRQVJweXBlbkpyc0k4UnVSSUpDblBUQUF0TEpsR2VXcHpZMVJ2ZnY2?=
 =?utf-8?B?RVRWQk0vZzRVVWYrdml0UWd2ODk4ODc3VUl1REJzU3ZxczJkdFh5T3lUcFp3?=
 =?utf-8?B?c1ZnRWVyQ3d6RWlSS0x2WHR4WXo2UXB4eHptYm13QXBwb3FKT1BGUWxwZlVL?=
 =?utf-8?B?MUUwRTBuMG5KY25TUWZidmtDM3YvRnVBUEN3aFk4alU1bFV6bTdmTjg3TjA2?=
 =?utf-8?B?UGMrWDZBSng1MUs3TGwzZ1ZKYUxhWEluUHdmODc1TjlqYlRaclZMallWT0Fs?=
 =?utf-8?B?RUZqNjNqdDREdThqcjlMOWptSjQwY285dHp0c2FVNG1GclNXcXNqZWliRXk1?=
 =?utf-8?B?b3NvdkpFclNTTVBpTytqak53R0YxeVZmbmMxUVV1K1JnaHJzWHBSa3hWR1B1?=
 =?utf-8?B?WXNnL3ZUSU9PZ21LeG5RcmlLMWNpNGsxWjNMYUduTEIyazNpdzNWOXd0cm91?=
 =?utf-8?B?V0dWNDU3eEl0VmYyMHVSdEduNy81MnZCRHNyTGFnRTI5VzNGT2VZWU9xWUt6?=
 =?utf-8?B?azN5a1N2RHpiMDZIbThpcVg4eVptaE9CNXo5bTJrT0dmSHBpOE9aeTRib1RB?=
 =?utf-8?B?Q1Q4V1VJbGppTWxwT1pKNS9SSkVCazBHM1JQNkpRWTN0QmdjSWdUaGo0NHFh?=
 =?utf-8?B?RHB2UDJtc2ZURkpVVUlPenBBNEp3dDBqOVBxSG9mOFJVakV6R1lHWGNoc0pt?=
 =?utf-8?B?Mm9oU3R6NzJObVVKR2xqRTQ5QUZUUEZneGpIOHdyd2NZZThvOTJsbGdqTlp3?=
 =?utf-8?B?K0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D5366523022B534EA77E5E3CF6DAEAAA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f3d01a2-973b-4599-2a79-08dde67d5acb
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2025 21:53:42.4608 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iQP+IlpB/91DzkaAbf6SRLpMvUcjrZ9kOb7fDnVmcvljNToSRYOY59M8BA2ZOmoNgYoU+nSxA3LYcPI9Xcy7i/54S7s3hLGuaFMNzay8hdQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7805
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

T24gVGh1LCAyMDI1LTA4LTI4IGF0IDIzOjQ5ICswMjAwLCBNaWNoYWwgV2FqZGVjemtvIHdyb3Rl
Og0KPiANCj4gDQo+IE9uIDgvMjgvMjAyNSA4OjU5IFBNLCBTdW1tZXJzLCBTdHVhcnQgd3JvdGU6
DQo+ID4gT24gV2VkLCAyMDI1LTA4LTI3IGF0IDE3OjUyIC0wNDAwLCBaaGFuanVuIERvbmcgd3Jv
dGU6DQo+ID4gPiBVcGRhdGUgR3VDIGxvZyBidWZmZXIgdHlwZSB2YWx1ZSwgbWFrZSBidWZmZXIg
dHlwZXMgZXF1YWwgdG8NCj4gPiA+IGd1Y19sb2dfYnVmZmVyX3R5cGUgaW4gaW50ZWxfZ3VjX2Z3
aWYuaC4NCj4gPiANCj4gPiBUaGlzIGlzIGp1c3QgdG8gbWFpbnRhaW4gY29uc2lzdGVuY3kgd2l0
aCBpOTE1PyBDYW4geW91IGFkZCBpbiB0aGUNCj4gPiBjb21taXQgbWVzc2FnZSB0aGF0IGludGVs
X2d1Y19md2lmLmggaXMgaW4gdGhlIGk5MTUgZHJpdmVyPw0KPiANCj4gaG1tLCBidXQgbG9va3Mg
bGlrZSBhIEZXIGRlZmluaXRpb24gKGl0J3MgcGFydCBvZiB0aGUgQUJJIGhlYWRlcnMpDQo+IHNv
IElNTyBiZXR0ZXIgcmVhc29uaW5nIHNob3VsZCBiZToNCj4gDQo+ICJ0byBhbGlnbiB3aXRoIHRo
ZSBHdUMgQUJJIHNwZWNpZmljYXRpb24iDQoNCkFncmVlZC4NCg0KPiANCj4gPiANCj4gPiA+IA0K
PiA+ID4gU2lnbmVkLW9mZi1ieTogWmhhbmp1biBEb25nIDx6aGFuanVuLmRvbmdAaW50ZWwuY29t
Pg0KPiA+ID4gLS0tDQo+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS9hYmkvZ3VjX2xvZ19hYmku
aCB8IDIgKy0NCj4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19sb2cuY8KgwqDCoMKg
wqAgfCAyICstDQo+ID4gPiDCoDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQ0KPiA+ID4gDQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hl
L2FiaS9ndWNfbG9nX2FiaS5oDQo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS9hYmkvZ3VjX2xv
Z19hYmkuaA0KPiA+ID4gaW5kZXggNTU0NjMwYjdjY2Q5Li5iMTgxOTY3OWZhMzUgMTAwNjQ0DQo+
ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUvYWJpL2d1Y19sb2dfYWJpLmgNCj4gPiA+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS94ZS9hYmkvZ3VjX2xvZ19hYmkuaA0KPiA+ID4gQEAgLTEwLDgg
KzEwLDggQEANCj4gPiA+IMKgDQo+ID4gPiDCoC8qIEd1QyBsb2dnaW5nIGJ1ZmZlciB0eXBlcyAq
Lw0KPiA+ID4gwqBlbnVtIGd1Y19sb2dfYnVmZmVyX3R5cGUgew0KPiA+ID4gLcKgwqDCoMKgwqDC
oMKgR1VDX0xPR19CVUZGRVJfQ1JBU0hfRFVNUCwNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBHVUNf
TE9HX0JVRkZFUl9ERUJVRywNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoEdVQ19MT0dfQlVGRkVSX0NS
QVNIX0RVTVAsDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgR1VDX0xPR19CVUZGRVJfQ0FQVFVSRSwN
Cj4gPiANCj4gPiBDYW4geW91IG1vdmUgR1VDX0xPR19CVUZGRVJfVFlQRV9NQVggaW4gaGVyZSBh
cyB0aGUgbGFzdCBlbnVtIGFsc28NCj4gPiB0bw0KPiA+IGFsaWduIHdpdGggaTkxNT8NCj4gDQo+
IEd1QyBzcGVjIGRvZXMgbm90IHNwZWNpZnkgTUFYDQo+IA0KPiBpdCdzIG91ciBpbXBsZW1lbnRh
dGlvbiBoZWxwZXIgKHNvIHNob3VsZG4ndCBiZSBwYXJ0IG9mIEFCSSkNCg0KR290IGl0IGFuZCBt
YWtlcyBzZW5zZS4gU2hvdWxkIHdlIG1vdmUgdGhlIE1BWCB0byBvbmUgb2YgdGhlIG5vbi1hYmkN
CmhlYWRlcnMgdGhlbj8NCg0KT3RoZXJ3aXNlIEkgYWdyZWUgd2l0aCBldmVyeXRoaW5nIE1pY2hh
bCBzYWlkIGhlcmUuDQoNClRoYW5rcywNClN0dWFydA0KDQo+IA0KPiA+IA0KPiA+ID4gwqB9Ow0K
PiA+ID4gwqANCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2xv
Zy5jDQo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfbG9nLmMNCj4gPiA+IGluZGV4
IGMwMWNjYjM1ZGM3NS4uNDcwYzgzZWFkNTQzIDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2d1Y19sb2cuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d1Y19sb2cuYw0KPiA+ID4gQEAgLTMzMCw3ICszMzAsNyBAQCB1MzIgeGVfZ3VjX2dldF9sb2df
YnVmZmVyX29mZnNldChzdHJ1Y3QNCj4gPiA+IHhlX2d1Y19sb2cgKmxvZywgZW51bSBndWNfbG9n
X2J1ZmZlcl90eXANCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBlbnVtIGd1Y19sb2dfYnVmZmVyX3R5
cGUgaTsNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqB1MzIgb2Zmc2V0ID0gUEFHRV9TSVpFOy8qIGZv
ciB0aGUgbG9nX2J1ZmZlcl9zdGF0ZXMgKi8NCj4gPiA+IMKgDQo+ID4gPiAtwqDCoMKgwqDCoMKg
wqBmb3IgKGkgPSBHVUNfTE9HX0JVRkZFUl9DUkFTSF9EVU1QOyBpIDwNCj4gPiA+IEdVQ19MT0df
QlVGRkVSX1RZUEVfTUFYOyArK2kpIHsNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoGZvciAoaSA9IDA7
IGkgPCBHVUNfTE9HX0JVRkZFUl9UWVBFX01BWDsgKytpKSB7DQo+ID4gDQo+ID4gSSBzZWUgdGhh
dCBpOTE1IGlzIGdvaW5nIGZyb20gaSA9IEdVQ19MT0dfQlVGRkVSX0RFQlVHIGFuZCBub3QgZnJv
bQ0KPiA+IDAuDQo+ID4gU2hvdWxkIHdlIGRvIHRoYXQgaGVyZSB0b28/DQo+IA0KPiBhY3R1YWxs
eSBpZiAiaSIgd2FzIGRlZmluZWQgYXMgImVudW0iIHRoZW4gd2Ugc2hvdWxkbid0IHVzZSAwDQo+
IG5vciBUWVBFX01BWCAoc2luY2UgaXQgaXMgYWxzbyBub3QgcGFydCBvZiB0aGUgZW51bSkNCj4g
DQo+IG1heWJlIHRoZSBpbXBsZW1lbnRhdGlvbiBzaG91bGQgbG9vayBsaWtlOg0KPiANCj4gwqDC
oMKgwqDCoMKgwqDCoG9mZnNldCA9IFNaXzRLOyAvLyBkb24ndCB1c2UgUEFHRV9TSVpFIQ0KPiAN
Cj4gwqDCoMKgwqDCoMKgwqDCoHN3aXRjaCAodHlwZSkgew0KPiDCoMKgwqDCoMKgwqDCoMKgY2Fz
ZSBHVUNfTE9HX0JVRkZFUl9DQVBUVVJFOg0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoG9mZnNldCArPQ0KPiB4ZV9ndWNfZ2V0X2xvZ19idWZmZXJfc2l6ZShHVUNfTE9HX0JVRkZF
Ul9DUkFTSF9EVU1QKTsNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBmYWxsdGhy
b3VnaDsNCj4gwqDCoMKgwqDCoMKgwqDCoGNhc2UgR1VDX0xPR19CVUZGRVJfQ1JBU0hfRFVNUDoN
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBvZmZzZXQgKz0NCj4geGVfZ3VjX2dl
dF9sb2dfYnVmZmVyX3NpemUoR1VDX0xPR19CVUZGRVJfREVCVUcpOw0KPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGZhbGx0aHJvdWdoOw0KPiDCoMKgwqDCoMKgwqDCoMKgY2FzZSBH
VUNfTE9HX0JVRkZFUl9ERUJVRzoNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBi
cmVhazsNCj4gwqDCoMKgwqDCoMKgwqDCoH0NCj4gDQo+ID4gDQo+ID4gVGhhbmtzLA0KPiA+IFN0
dWFydA0KPiA+IA0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoaSA9
PSB0eXBlKQ0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgYnJlYWs7DQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG9mZnNl
dCArPSB4ZV9ndWNfZ2V0X2xvZ19idWZmZXJfc2l6ZShsb2csIGkpOw0KPiA+IA0KPiANCg0K
