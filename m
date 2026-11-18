Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9D4606A331
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 22:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BQjVwwtc;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=S2DHay5P
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F146710E6E1;
	Wed, 18 Nov 2026 22:00:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25BA510E6E1
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 21:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795039199; x=1826575199;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=GpmOnWqv8HURoDoYY90g5eRF0ozaWWSQxAwAkDuzCV8=;
 b=BQjVwwtc4qnJJtPdhfruHBWcqW0xEbIyjrTJ/hMfjoggTJCIeYJc8vKm
 orv0WRlu4aW1IZVAfW1pEoGyTeQsJHlID8XiWDk5TkoiXT2IutGjw86/2
 cBF4sRRB2H3PfaVieVqpQ/HfHFYhlYbR+5wrZt4fLgvLiS1nxzuB/Jdq0
 it+ikiC4pzMOFz2aXj9/09XpsK4v0VWk9tvzcxLK/kz7WGdLAO2SqkF2G
 QngmaQHMMB7oHucJFmqvCEB6OzakQjU/Jb/a/h6TEbYXCPmqpVgUicwO3
 WvVt7OzocjFgecam5fV0dheW8cGOp5UqbrOKl6FGe0SgsjpNtjAQL+t7D Q==;
X-CSE-ConnectionGUID: /i+yPbhISjyI5NHNUZ4P/A==
X-CSE-MsgGUID: iW0HbtXJTNyaEuM6Yqmlvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3917351"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3917351"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 13:59:58 -0800
X-CSE-ConnectionGUID: hRAIOaPfTKyC6bZpcmzanw==
X-CSE-MsgGUID: tlkjLbt2ROy5TldKqQK/Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10343790"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 13:59:57 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 13:59:57 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 18 Nov 2026 13:59:57 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.47) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 13:59:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mfr5wDoib/sVniY0+LW+CaV3SgRbMxMUuAJddHnfCaj4Aur/mDrFOwktmiJehprWQ9qkr5buaFugQb9ZyQF/BawDkBIhSKmEsAFsqT8ISB/E75FNkO/6E8OAevDFqfaONDNKblJfai9Ue43ZuPjNDvvI6L81dMP1Fo08c3eHcw79BleO6ZUsrD7C2sLC1VuukkTMBW6D+O7X1RlT8FIqSjelwnD1CoyQ8HRiv06d5n53Qfx+WGdDt7fti4AQSxuSVzaS7NQfyZQvWc28SO2keL5y47JA09+4hbOw5Lb4qERwaTNLY9Hfl2xH8j4qbXT4wRgp+KyEKv93fRw4A1aUvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GpmOnWqv8HURoDoYY90g5eRF0ozaWWSQxAwAkDuzCV8=;
 b=BlYEcbw6xkiJBaIUdrepJ+AI+xLeHqX/iL1SC8hSJ8N9op3x11kaP55RhSRYW6TXZJ3iuEtHpWb1MlHyxravkgd+uu6HDulhSNdkEwvCw7tUASVpoHJz1qeOITGKPWvyV4lz8AwT8SIg4dO1O2k5ywrsnx4zB0W8Zcw5BLUfnyKHkN8vY6ymzaIYPXaVBTWCkLfPy1HcuOxU2Tp8Z4CKoK5Ll9yljk3kVyrUtbR6QO4hSN4ackoSqI0BkZOz4DPfC2SFPrOg7XgzCOxOpK6qMGS7zpvbZ0rwVGfD2O8zPnbKrq4LyA4WJh+vR9+vByzVe6xhyKci/m7X1bducYtzlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GpmOnWqv8HURoDoYY90g5eRF0ozaWWSQxAwAkDuzCV8=;
 b=S2DHay5PGJ0cJSowyxNmIbOSSP3lvc5XqZkQGb1+7KlLxJTeiRDMtf31aRvI+pyZ3mJokOqeM0w7U0c10RmYcUWhjw3uwdAFIwUWFnWBEwwdW7FQxYUEawbLc57t7fD9u2+IIvWtYSs4RZP1Rpk8I7EnkbJnAg/5QWYUXJwis4g=
Received: from AT6PR11MB072844.namprd11.prod.outlook.com
 (2603:10b6:170:10a::16) by DM4PR11MB6432.namprd11.prod.outlook.com
 (2603:10b6:8:ba::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Wed, 18 Nov
 2026 21:59:54 +0000
Received: from AT6PR11MB072844.namprd11.prod.outlook.com
 ([fe80::520a:561:ace1:e64b]) by AT6PR11MB072844.namprd11.prod.outlook.com
 ([fe80::520a:561:ace1:e64b%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 21:59:54 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Tauro, 
 Riana" <riana.tauro@intel.com>, "Vijay, Anoop C" <anoop.c.vijay@intel.com>
Subject: Re: [PATCH 2/3] drm/xe: Process device OOB workarounds during early
 info init
Thread-Topic: [PATCH 2/3] drm/xe: Process device OOB workarounds during early
 info init
Thread-Index: AQHdbKcDlqONgszPy0auTe5TP8/v0rcpVH8AgAsieQA=
Date: Wed, 18 Nov 2026 21:59:54 +0000
Message-ID: <3ace9322fa49eb38d56624407316007e391d5dd3.camel@intel.com>
References: <20261104215353.234314-5-stuart.summers@intel.com>
 <20261104215353.234314-7-stuart.summers@intel.com>
 <avTIsmNyx96rMfWP@intel.com>
In-Reply-To: <avTIsmNyx96rMfWP@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AT6PR11MB072844:EE_|DM4PR11MB6432:EE_
x-ms-office365-filtering-correlation-id: 9379fc01-a590-4d1a-133b-08df45bf470f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|22082099003|261009223027099003|18002099003|11063799006|4143699003|56012099006|261026121527099003|261102123227099003|261028144727099003|261026140227099003|261021121427099003|261022105027099003|38070700021|261021123027099003|10067099003;
x-microsoft-antispam-message-info: CLEEu00SuPlmdCj1mu3T9oDDsMkjU5K63bdWPhkd9iv6NGH2Bk1cRU4vV/vzS7By9m1T54vS4RPvUpQUNgxns44H/FOExX3LUsIp6rIyvOYWPZheqf62MNp+zf3enn73lJWSXPP5S20DLVT0yvHsKl7RUKtjbn67Fev/r2YwZZlbFX0Bf3PUoCJfO8lfbUsosxzFBILWkK8WeU+NSRh1Wo0QY0lohA76G5XA+4cEsASiQ1Vg4ZpX97e6Dk7D8NYGEJio79XRX53Aiwa3hiAqv9krPqGMpPU1KVm2va97P95s8/soLOEOulWq9iAOP9Lji3pzBECVB9eXvQ20970/Y8+879qo5tQ5KChYyPXiW63npR1wb4TQs2FFVU8nJ7t/1acxVUlgaEecWaDTvg93kg9Ry2VHiYOMjChc9DR9QGsuUu9sLIguwQgfzBUS42mFHNbFQJ3o0d/sRP+4vOQWYvDrDu3Db7u1e9hWrXt9xewTrut0f+tgdqnfQbACwT+8z6zJsIjgfUfXHJeunhoCmglqiEEk6zSrpYL3CyTi7LtlsoqDhxGCr8pJ/UBCV5kMhVgigjWSr7QNWpB7MsgfNWFpJloz8hvwQTIZli+y4ASZynNgO9E7N2pG1qLWCYvCtvh9JrozlpCEX55dLwL6TKDfLu0VBxYJ+HfFFQscnmu7ByuGkbxeCwDb8JLv5TU+wcVwWYkWqpW0OW5KZoDWtNafgY3fR2Sn1qhOo7WrRTE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AT6PR11MB072844.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(22082099003)(261009223027099003)(18002099003)(11063799006)(4143699003)(56012099006)(261026121527099003)(261102123227099003)(261028144727099003)(261026140227099003)(261021121427099003)(261022105027099003)(38070700021)(261021123027099003)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MmNFc1doNU9rbGZuVW1KMExNWkl0anU0RzR5ajJpM3JlWWU5RTIzK3RJVFJY?=
 =?utf-8?B?TEhORkFFVWVJSFFKR3o1RlJ6Y1lFVkRreXE0TkpsVTl1NldKL3BnWjFiWWVk?=
 =?utf-8?B?UktwVjhabCtoQWh3NXlxbHUvMVIvQkxsVXp1WCsxYWczcW9TcHU2SWs1Yzc2?=
 =?utf-8?B?U2hFY2tBbTBKU1Zvdlh0RXVwaXpKTWhubW9YSm5VeEQzWkpmVThKZTVZK0Iz?=
 =?utf-8?B?b2RGejJJa01SUjBROG1rSy9VQlprSWhEMWw3Kzd1WnRVVGlqci9BbnhHU3VU?=
 =?utf-8?B?WG5CT3huRkdzK0VoZHA1aitMWVVNYmo4VHE2dWJ5U3hnVVU5WStXL1hHMEVr?=
 =?utf-8?B?czlrUnljeXkxNXluMnhGSmpvb1B6QnBGalJXcjBKRGlYR3BGOVFwenpLWUhQ?=
 =?utf-8?B?clFWVXR6dlRRbjc4SzE1U045Nlc2bk9hWVdZUzlQK1EwM1M4enhCQWwwY1hj?=
 =?utf-8?B?U2VidEdweTlBN3VWU25oUUhVYWcvOEI4Mk5ab2hBOEhoUldlWktiREFzZ1RK?=
 =?utf-8?B?YmcvNDZyOHVrb0pXY2tpMHRwcFMvWXlxUWJ5SUcxYjVoa3N0Qm9vd2YxdXc3?=
 =?utf-8?B?MUVBMFUwN0pHUGcrMmZ4TUNEdzlXeTFnTEV1ZHFFT2tsTktvWDZPUll3RkpB?=
 =?utf-8?B?emFMZTFBTTNOdTRsQm1iME43RHY1akIwS3dsL2lCdmNIcGJoUVczRml2Q2xn?=
 =?utf-8?B?WlpxRjAvOStidkorM0hhbUNjbnkzQldUOVZKOTlZRXlQM3dTMmVJOS94YmVH?=
 =?utf-8?B?R3lOb3kxR1JBTi9WQWFYY05mQm95alNzQlRyYzh0by93NHdhZ0JkY3ppaXpF?=
 =?utf-8?B?c09qbVl1VWFCeTNKVlBESlNEcVk5Rk04MzFUckdjWForNmsvNEtvTzZDaE1N?=
 =?utf-8?B?V1pJWWtTWllOclZwZmNxOHF1ZDR6Nk9DQmV1dFY2Q0o5MHFJcHBaUWVTcXkv?=
 =?utf-8?B?MFBOeDRtODFHZU9MVnF0all2anBDYS9jaWZZZ0J2NDJaS1ljNDIzVWl2eXR5?=
 =?utf-8?B?d1IxK0ZwazVISWphb0xHNUR2NEJHVFZGejQ5N3g0cm5lVkN4a1U1cDdLZ2Fh?=
 =?utf-8?B?Vk5ndm1Tdm5EeTJIeDJYZ2NKVm4rZ05Jc1d5UHBGUmFGd1d4cG9TbGk4Snlk?=
 =?utf-8?B?Vi9HSldUekIxUTBrTjlVV3ZKeG1XQVZ2TWNrK285cWM4elo5T0xPV2hqRWhx?=
 =?utf-8?B?eU50UW1QaDFodWowM2lCclhxclhXbWpKcmM2Z3NkSDBxTkovUUNRZXlhMkNC?=
 =?utf-8?B?ME4zWkhNWWc4N0hHd1dLOUdNV09kWmsvbHdqUnlySXMyT3MydG5ocFdRU0RY?=
 =?utf-8?B?UjVrWFFmZ0hWTmlzTzFmZFF1SXk1YW5YSno5YUtvMTZvMVZHWjlJazB5aVpj?=
 =?utf-8?B?dW9HTGpSTmY4L202eDBhd3U0LzM0bHlVOW53ZkNiTjdmWTQ2R1JoUzhRNUhM?=
 =?utf-8?B?c2tZSmxFU05HdkV1NlNZUkx6TXFobGhYQ2w5STIvMFdadjZIZkxwaFRicXRK?=
 =?utf-8?B?bmlnbnp3eWFuS1BEalhvUnk3enJUSHhoRGVkbU53L1hway82L2lyNWsxY0Qv?=
 =?utf-8?B?emdRMU4zS0p3TmFEOGtqZldidWhRWm1WZEJnaTMyUk5qN21WR2JKRnYxK3Vs?=
 =?utf-8?B?cHVRVjlHMWViNmlpTldsZEpxVDA2citrOHBoa1RBYUFvUUlSWWFmaWNybnZj?=
 =?utf-8?B?LzB1V2pQOVlNYUVIVGRWRmR2M0xXMnBjUXBEd3QzenFVT3JoWFkzR0paRUdu?=
 =?utf-8?B?YUN5TE5KTHAxS3BkdUkwMlhEMTUyOEFEK2k1c2Z2M3RKejRvUFV1YWdQdFVN?=
 =?utf-8?B?aXZHd0duLy92cy9rRHVDbW12cDdGRE00QmFDSURDNjd3aWFRSXdmRXZZQ2Rh?=
 =?utf-8?B?aWxkYXY4QmNxaXJaSkRQajNBYVNhcTJ4N0xmaURLcXlJZld4ZjBGQUx0d2Rt?=
 =?utf-8?B?cnpQZ3h3SjkyWURtRkRQTE5ReGdmeUNGM1Rkdld5cDg0Q1FrbGFUbExHcm5o?=
 =?utf-8?B?SDJqT3poM2p1Ync4NnB4cVltSG9kcUJSeityaXVXVmZxemdoWFJyVXp3aFZi?=
 =?utf-8?B?L1A1bVE0Q0d6UGd0V2JKeEtLK3BkRXhhMXpXU3MxY3c5SXZaNnNvU1FvZWF4?=
 =?utf-8?B?RmpCTUxieGxnK0VCeER3YVdwQTdOVU9paUNjQnJ6NVozUGRwTVZWZWl4RXdD?=
 =?utf-8?B?dHdlYStlZTFlN0hzVGtBUExYc3Myb2wwbExtMCtjTThOSEdzU3lZdnJ1aGZM?=
 =?utf-8?B?eC9YRHUyelQ3aWhXRkV4enpYVnI1U2txYW1iVzhkb0pVdk9ZZzcrdTZYYk1K?=
 =?utf-8?B?NDRwRGZLQzdsVlZNcTZCVDAyVlFzN3dIMXZQNlFIKzVHeUN2NVFCTVFBTjRh?=
 =?utf-8?Q?fw1xsOkjTuL/EQcE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <37680D64D6E19F4282776CE825682D77@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: J7bxX3mgDWOZOCCDGiTf/BiLR9BiX5zOM6JI3z4a/4Sc4dIqgVU54itx3GuC5CpJ2EtuXdp4cYnoCh+fSM1wwCsj+VJy00rxSnIr4b68Jodrukj3fz7zOPxA02duwpP2YkSYnAXCD4MxOldWgUodWXmipmZO874SnPV+dY5Y22syUlNQ1AH34vQfmn3QL0Q5HE61vknExSJzcBqJtH8WbKGXcRvcEyP8hYjqtvt1E+KI9IsKlrs2F6svWaMr4d1kG/JxlqN3qmMEnBU/J+z4uCZxQobe2hSTKtcTsKLXqdjQOyi3G9oDRiQ9nJmEGqa6XRwwtj3AJHZqbLDz/tjR4g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AT6PR11MB072844.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9379fc01-a590-4d1a-133b-08df45bf470f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2026 21:59:54.2741 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Va4WpypVQbqbZo8FqIzoYRaPywmxF/7mkIeHhGKl84IG1mcbvYHvV3DlwqiNFXo6M7FNvvOTfhaqpvgp5yqkEZfHQcO8rNv/cyB4BcoAqrk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6432
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

T24gV2VkLCAyMDI2LTExLTExIGF0IDE0OjU3IC0wNTAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IE9uIFdlZCwgTm92IDA0LCAyMDI2IGF0IDA5OjUzOjU1UE0gKzAwMDAsIFN0dWFydCBTdW1tZXJz
IHdyb3RlOg0KPiA+IERldmljZSBPT0Igd29ya2Fyb3VuZHMgb25seSBtYXRjaCBvbiBwbGF0Zm9y
bSwgc3VicGxhdGZvcm0gYW5kDQo+ID4gcGxhdGZvcm0NCj4gPiBzdGVwLCBhbGwgb2Ygd2hpY2gg
YXJlIGtub3duIG9uY2UgeGVfaW5mb19pbml0X2Vhcmx5KCkgaGFzIGNvcGllZA0KPiA+IHRoZW0N
Cj4gPiBvdXQgb2YgdGhlIGRldmljZSBkZXNjcmlwdG9yLiBQcm9jZXNzaW5nIHRoZW0gdGhlcmUg
aW5zdGVhZCBvZiBpbg0KPiA+IHhlX2RldmljZV9wcm9iZV9lYXJseSgpIG1ha2VzIFhFX0RFVklD
RV9XQSgpIHVzYWJsZSBmb3IgdGhlIHJlc3Qgb2YNCj4gPiBlYXJseSBwcm9iZSwgd2hpY2ggcnVu
cyBiZWZvcmUgeGVfZGV2aWNlX3Byb2JlX2Vhcmx5KCkuDQo+ID4gDQo+ID4gV2hpbGUgbW92aW5n
IHRoZSBjYWxsLCBjaGVjayB0aGUgcmV0dXJuIHZhbHVlIG9mDQo+ID4geGVfd2FfZGV2aWNlX2lu
aXQoKSwNCj4gPiB3aGljaCB0aGUgb2xkIGNhbGwgc2l0ZSBzaWxlbnRseSBkcm9wcGVkLg0KPiA+
IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFN0dWFydCBTdW1tZXJzIDxzdHVhcnQuc3VtbWVyc0BpbnRl
bC5jb20+DQo+ID4gLS0tDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmMgfMKg
IDMgLS0tDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpLmPCoMKgwqAgfCAxNCArKysr
KysrKysrKysrKw0KPiA+IMKgMiBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
ZGV2aWNlLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYw0KPiA+IGluZGV4
IDI3M2UyYzQ1ZmVhOS4uYWUyODU4NGUxZTk1IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9kZXZpY2UuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZp
Y2UuYw0KPiA+IEBAIC03MTIsOSArNzEyLDYgQEAgaW50IHhlX2RldmljZV9wcm9iZV9lYXJseShz
dHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4gPiDCoHsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgaW50IGVy
cjsNCj4gPiDCoA0KPiA+IC3CoMKgwqDCoMKgwqDCoHhlX3dhX2RldmljZV9pbml0KHhlKTsNCj4g
PiAtwqDCoMKgwqDCoMKgwqB4ZV93YV9wcm9jZXNzX2RldmljZV9vb2IoeGUpOw0KPiA+IC0NCj4g
PiDCoMKgwqDCoMKgwqDCoMKgZXJyID0geGVfbW1pb19wcm9iZV9lYXJseSh4ZSk7DQo+ID4gwqDC
oMKgwqDCoMKgwqDCoGlmIChlcnIpDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqByZXR1cm4gZXJyOw0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNp
LmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2kuYw0KPiA+IGluZGV4IGJhMjNlYzYw
NDc3Yi4uZWUzNzY2ZTJiOTM4IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9wY2kuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2kuYw0KPiA+IEBAIC0x
NSw2ICsxNSw4IEBADQo+ID4gwqAjaW5jbHVkZSA8ZHJtL2RybV9kcnYuaD4NCj4gPiDCoCNpbmNs
dWRlIDxkcm0vaW50ZWwvcGNpaWRzLmg+DQo+ID4gwqANCj4gPiArI2luY2x1ZGUgPGdlbmVyYXRl
ZC94ZV9kZXZpY2Vfd2Ffb29iLmg+DQo+ID4gKw0KPiA+IMKgI2luY2x1ZGUgImRpc3BsYXkveGVf
ZGlzcGxheS5oIg0KPiA+IMKgI2luY2x1ZGUgInJlZ3MveGVfZ3RfcmVncy5oIg0KPiA+IMKgI2lu
Y2x1ZGUgInJlZ3MveGVfcmVncy5oIg0KPiA+IEBAIC0zOSw2ICs0MSw3IEBADQo+ID4gwqAjaW5j
bHVkZSAieGVfc3Vydml2YWJpbGl0eV9tb2RlLmgiDQo+ID4gwqAjaW5jbHVkZSAieGVfdGlsZS5o
Ig0KPiA+IMKgI2luY2x1ZGUgInhlX3RpbGVfcHJpbnRrLmgiDQo+ID4gKyNpbmNsdWRlICJ4ZV93
YS5oIg0KPiA+IMKgDQo+ID4gwqBlbnVtIHRvZ2dsZV9kM2NvbGQgew0KPiA+IMKgwqDCoMKgwqDC
oMKgwqBEM0NPTERfRElTQUJMRSwNCj4gPiBAQCAtNzk0LDYgKzc5NywxNyBAQCBzdGF0aWMgaW50
IHhlX2luZm9faW5pdF9lYXJseShzdHJ1Y3QgeGVfZGV2aWNlDQo+ID4gKnhlLA0KPiA+IMKgwqDC
oMKgwqDCoMKgwqB4ZS0+aW5mby5zdWJwbGF0Zm9ybSA9IHN1YnBsYXRmb3JtX2Rlc2MgPw0KPiA+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3VicGxhdGZvcm1fZGVzYy0+c3VicGxh
dGZvcm0gOg0KPiA+IFhFX1NVQlBMQVRGT1JNX05PTkU7DQo+ID4gwqANCj4gPiArwqDCoMKgwqDC
oMKgwqAvKg0KPiA+ICvCoMKgwqDCoMKgwqDCoCAqIERldmljZSBPT0Igd29ya2Fyb3VuZHMgb25s
eSBtYXRjaCBvbiBwbGF0Zm9ybSwNCj4gPiBzdWJwbGF0Zm9ybSBhbmQNCj4gPiArwqDCoMKgwqDC
oMKgwqAgKiBwbGF0Zm9ybSBzdGVwLCB3aGljaCBhcmUgYWxsIGtub3duIGJ5IG5vdywgc28gcHJv
Y2Vzcw0KPiA+IHRoZW0gaGVyZSBhbmQNCj4gPiArwqDCoMKgwqDCoMKgwqAgKiBtYWtlIFhFX0RF
VklDRV9XQSgpIHVzYWJsZSBmb3IgdGhlIHJlbWFpbmRlciBvZiBlYXJseQ0KPiA+IHByb2JlLg0K
PiA+ICvCoMKgwqDCoMKgwqDCoCAqLw0KPiANCj4gSSBkb24ndCBiZWxpZXZlIHRoaXMgY29tbWVu
dCBpcyBuZWNlc3NhcnkgaGVyZS4gUHJvYmFibHkgQUkgYmVpbmcNCj4gb3ZlciB2ZXJib3NlPw0K
DQpZZWFoIHRoaXMgcmVhbGx5IG5lZWRlZCB0byBiZSBpbiB0aGUgY29tbWl0IG1lc3NhZ2Ugb25s
eS4uLiBTb3JyeSBhYm91dA0KdGhhdCwgSSdsbCBkcm9wIHRoaXMgaW4gYSByZXB1c2ggd2l0aCB0
aGUgci1iJ3MuIEFwcHJlY2lhdGUgdGhlIHJldmlld3MNCmhlcmUhDQoNCi1TdHVhcnQNCg0KPiAN
Cj4gQW55d2F5LA0KPiANCj4gUmV2aWV3ZWQtYnk6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZp
QGludGVsLmNvbT4NCj4gDQo+ID4gK8KgwqDCoMKgwqDCoMKgZXJyID0geGVfd2FfZGV2aWNlX2lu
aXQoeGUpOw0KPiA+ICvCoMKgwqDCoMKgwqDCoGlmIChlcnIpDQo+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHJldHVybiBlcnI7DQo+ID4gKw0KPiA+ICvCoMKgwqDCoMKgwqDCoHhl
X3dhX3Byb2Nlc3NfZGV2aWNlX29vYih4ZSk7DQo+ID4gKw0KPiA+IMKgwqDCoMKgwqDCoMKgwqB4
ZS0+aW5mby5kbWFfbWFza19zaXplID0gZGVzYy0+ZG1hX21hc2tfc2l6ZTsNCj4gPiDCoMKgwqDC
oMKgwqDCoMKgeGUtPmluZm8udmFfYml0cyA9IGRlc2MtPnZhX2JpdHM7DQo+ID4gwqDCoMKgwqDC
oMKgwqDCoHhlLT5pbmZvLnZtX21heF9sZXZlbCA9IGRlc2MtPnZtX21heF9sZXZlbDsNCj4gPiAt
LSANCj4gPiAyLjQzLjANCj4gPiANCg0K
