Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B47606A514
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 06:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZVOZhXYI;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=mvtnuZDi
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CBA910E1D4;
	Fri, 20 Nov 2026 06:12:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D55310E1D4;
 Fri, 20 Nov 2026 06:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795155154; x=1826691154;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DH9NPCiGDEFZ0hUtht7XYD/6lx9jmKD5ZFLBGBLKu2s=;
 b=ZVOZhXYI5jaRB6OwCotu5aVxVnsgD9G8OmVhZdjzT6JqWiYx8FdOQdSx
 BhsyHo8eX3LSHArlx0DH/UfsjMj5AtI+YKXLYrgkOBuHmASh1nWI1i4DQ
 eIyUpg4m8XgMyq/ucyi5hASQ6B00vvNiTsgEocAzSmeYG/kCrCJqgAqFd
 W0BneU9y0GzZf20fa8Atpkpwv733Luu9TNI9uevsQqo/lE5rNDg79/rAY
 A/zSvbCdSJKCPqonxTQhobG/QHETwCRScZtnIFPLt8h8BjwdUnY7YLE8m
 lNoUYdWooQo4T7BKgCcsOc+xW0bD9Eq53a4TRm4jOpLpGs8ND6WpzYGbq A==;
X-CSE-ConnectionGUID: ZXRln9FmQUWJqHh0yQUbbA==
X-CSE-MsgGUID: TX6z5ZMXQGiVvhhqjihCWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3924672"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3924672"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 22:12:31 -0800
X-CSE-ConnectionGUID: n3ZliuQmT4aPvlEbG+uteQ==
X-CSE-MsgGUID: 7/OzeVe/SH+KJKIBedu5aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="10853095"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 22:12:30 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 22:12:29 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 22:12:29 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.2) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 22:12:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VXd2XqkBAupgyh3iISTMkQEEWBMAnfmTWlusAr0FzUemr7wCdCZRK2/uhgkaliaM84v01IKU0FNwB90fApVuOA+o8Vvrns9c8mqBVEtYGVisYd8Z1GDl8iLKDR2qAUebRUkAUQosIsc1Wt2Oq8ObfcpcTXcv/UbTX8lCw8WIEefMoQihxl53bHWEsRuFOIudvLdxCS6BuhIWL0eIs6RgJp/fteLAP2IWv1vqRTstuCF7bIJbsi2SFAvrTapvO6utCm8uOyQsE+WtNSDoKL3Q84KUoqM45McxMgzvLOYBFhhsARSG8T5VHAWjUkCdvw3Zb6sZWEpBO1E0e9WqKZN0tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DH9NPCiGDEFZ0hUtht7XYD/6lx9jmKD5ZFLBGBLKu2s=;
 b=tl4SzwwzRlxySwhKWl8RMR3lmVQR7YYZYK98ogB5XufBGID07aix6jpS8fl/daJFPBQ6QnLPcCKWHl33CyN8iBxiaCKzurtCnxH0VTzie9VkTHLtCxim2xRY2wETDP/7JVYQPUOzIAg6muGWwGnahEfd0bRWsfECAmZGCO5JoXR/uijNHCa0FTzNTmBcUSgt0gjFfMQnlO9vCtC7KYsR7759j1+CtqIeSOg8HfaUIeZbZ+y6zJXDbyZ2rcn1f/oxvJ6HULyysp7YMym+q+Vvy07fiaI3fiDXX1qjsCvfOeVSxasClM9fDfCRODP43N6JP5q0KBqK3W7jeb4fQb+/HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DH9NPCiGDEFZ0hUtht7XYD/6lx9jmKD5ZFLBGBLKu2s=;
 b=mvtnuZDiRqI71Q5+v7Ez6z9fPCPUZnd1z3+whb/CaooUMMpoaDyNdfM2EQ2FAu7opAnsM/s42+u3pvvdBmd82C1bkIH3jX2HQnyLV9VXxXeLgdaROF0pbNjizndoaJTDuQY6my9VU545M3vPVOCjdOjq1iqWCTnIkiUbLSeENCs=
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by PH7PR11MB6745.namprd11.prod.outlook.com
 (2603:10b6:510:1af::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 06:12:19 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff%8]) with mapi id 15.21.0615.012; Fri, 20 Nov 2026
 06:12:19 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: =?utf-8?B?TWljaGHFgiBHcnplbGFr?= <michal.grzelak@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Grzelak, Michal" <michal.grzelak@intel.com>
Subject: RE: [PATCH v2 1/2] drm/i915/psr: clean function's name from typo
Thread-Topic: [PATCH v2 1/2] drm/i915/psr: clean function's name from typo
Thread-Index: AQHddQSRbpz4Dchmlk6Y1yjbeKkQ+rc2ggyQ
Date: Fri, 20 Nov 2026 06:12:19 +0000
Message-ID: <DS4PPFE901A304FFB22E2717BDDAB18E034E3782@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20261115132305.3326951-1-michal.grzelak@linux.intel.com>
 <20261115132305.3326951-2-michal.grzelak@linux.intel.com>
In-Reply-To: <20261115132305.3326951-2-michal.grzelak@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|PH7PR11MB6745:EE_
x-ms-office365-filtering-correlation-id: 9d6b33fe-4c6c-4c50-f0eb-08df46cd3bc3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|22082099003|18002099003|4143699003|11063799006|260925021911599003|260925021311599003|260925022911599003|56012099006|261102123227099003|261021123027099003|261021121427099003|261021135927099003|10067099003|261009223027099003|38070700021;
x-microsoft-antispam-message-info: jUcfUke3lXjBPJb0bS1McfxpNwINlQZnpaism4YSFskDxKO0XbDikzgwlLxmcQa6euMdr5bjR6n+Q0MC5Tr578uv7DVncET/EMykBz4+e/dOk7fapLOMtXJbUsa6YoxzasqWiXquAOWeyi1lC1dxUaKVD6lnsolm6510p5OrA9VlOnbC8X/OTPXy28T5pl7DZm2RiLyPG6h92Sfto068P0khF6GuXazLnXa0Qg6hMGoAy3jolBi7KKRSbPS/3q8X1OJPk1jPGfoiOmJFmgZzq6Tu3o0VjuHlcwVg72NncsgDHWS07whMwqhxYOMq7Zi37FT1YD57rZc2TDroe8qxozBJyNFVjYT+dgkgEDxNJV0wNMinWXpGshvuBTdnWTV6zhU+6xUWOWGEHcEJzgPUZ4bIXaRB/hk1pqhDG1I7f5usTO8vgMcOvlisUEdIdfU8IjwGIbv9c2pxWvSJpsK6tDrnjoDlrLpHRdujNWtgNmvbdtAonhrcBMy8L8hgWoSkfLZDE2mXMH0747mJ4gQ9bwluTgmyJVd3R2PlLQRbUjwKqHnsQ9q4iLPSHAkbnmrbEOFMFZ7hsDPAQXehzqcX6i5t05o0NAnPLouMHBU4kJu0GY3WOfgl1QyN7DOghIAelII3YM+54p9Wlgj6+j51L0W++LTEJmWlfDR/TtW4PXSCYCuwx6BXYywzk0qs5cl/vrWyuzPOWoRpYDwlm1qDeI2rTkSb3kQBDm7eSLu/IEA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(22082099003)(18002099003)(4143699003)(11063799006)(260925021911599003)(260925021311599003)(260925022911599003)(56012099006)(261102123227099003)(261021123027099003)(261021121427099003)(261021135927099003)(10067099003)(261009223027099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?THpRUTI4SEZUTUY3LzhrL1NmWWkvQ1FQbHhjOGtiZkQ1OWFLc0kxYXcrczhk?=
 =?utf-8?B?ZkhROTlaZjh2SnY2aWFCK0tBNGJIb3kxT2JsQ2tUdFlOYWExWXQ1Y3NvOWJq?=
 =?utf-8?B?Q2kwSURId1JyYkVCYkduNVJKL0JZMkhGSEJNVkl5UGNLVU9UNDVwZzBHNzFo?=
 =?utf-8?B?bEJFQmttRVFxOW9uVi90Szl2Y1RyTS8zclM0SGNpVzJYTk1YSmo5Y2pIQ0RN?=
 =?utf-8?B?ZHpoQk16Nms5MFhCTlkrb1dIcXFWUHMxZEFLdElzOFRVVXZPTTVrbCs5d1Ew?=
 =?utf-8?B?aTBRMDRVK1V1MWxDTUVJaWJJbnFBSnd5UEU1eWMyak00WFdoUWlMWjFRZ20x?=
 =?utf-8?B?L2lrOUdUNm1KeWROQTNlZmpFdUNqSEg3U0twbGtUSy9vTU84SE0rMDRJWTNW?=
 =?utf-8?B?eWJBT0ZPWDhSSHR3SG52L1FJWERvL0Q1TUJxbmJNQUJxbGtCd0xzQ2tFajRW?=
 =?utf-8?B?ZW13MGszY1lEc1hndnZHK002MUlXZFg1aWFNNVRGeUQ5TU41WG1WeWpSOWV3?=
 =?utf-8?B?T1gyNkl5cERyN0FVVTFLd0RvU003UFgyQ3RXb2RFMzIwMW4vUmtLeFVzUjZN?=
 =?utf-8?B?ODc3ZXpNVVhiaWZFWFRtMytLclB1NGJFanBqNkJTcjNWWGRzb2t1bElmWHV6?=
 =?utf-8?B?VXF1cWVZUkIrRmFrdFRZcUZOUkpnRDZ3RDBYZ3ZCWHRMb2VWbDlDbmM4Um95?=
 =?utf-8?B?Zk4zU3loK3kwSWlXMmoxQlZQZnZSOHFzcy9qTVNDcDRKaUdHVHc2RDdaRU84?=
 =?utf-8?B?YzUvUHFLZ0ZmMnNpNjVQOVJ1K1JvQUhBRUhVK29QdW9nM1R0L0twVEFqRW1u?=
 =?utf-8?B?WDdGaUh3bEtPa2hCNGE2OVJFeUxjNnZmWEhyaGtkOFdDS2c5QUtTZHc1Szd0?=
 =?utf-8?B?anBUWWlzUlFhdWhNZU1QWVpLcHdZZFVtS0FyMVZMKzVQUlE5c1FRUThxMXd0?=
 =?utf-8?B?MG5qaTA3amFJV08zT1JsNkJVWEk3dWpjSVd5N2FyUFQyU3Y3YTQ4UHlQbTQ1?=
 =?utf-8?B?czRQY3hkNk8vZ0E3VDBucXl6OFk2dGxEdmZ3dWEyeEh0MkxOWkpNZk9TelB0?=
 =?utf-8?B?THRUNHN0VjZFRDRodlJNUzZLQklkNU1mYzF3S0VwQVJJdkk2TWJFc1YyLzIz?=
 =?utf-8?B?eGRDRTZubnBLQ2dQOVczVWwrNWdIajZHdkYrMWhMYzdaWmdUVU5sSHlFV2tj?=
 =?utf-8?B?WllvWlpPOXhhaGg0emNvcDB2L1lRdEdzZG5nQ3ZMUlR5UmEvWTJ1MEc3TXk2?=
 =?utf-8?B?SHFXT3FRY2l4bk03SEVJU1dYTmh5bFE4TVBFU2ZrWXpVMDBXMDJ5SjRVc1dv?=
 =?utf-8?B?ZjNtc3E1VjVIQjc5Q2xnRGZ1dXhmVUN4RWxOellRczFLZnlEc1ZrNGZ3eGo2?=
 =?utf-8?B?VTRQRW91YjhRWWh3QVRHMktGcW5DbG5YK0p2b1pRazBZcU5RakRkQXE5eE5Y?=
 =?utf-8?B?cU1KbTJLMllhdmN4VW1tR2NISjJ5TG1ocjVIS2xqQW5yRmZSWlh1Q2N2RnpC?=
 =?utf-8?B?c2xnYUNzc0Y4Wm1GUkQ3ditTRUNRQXlvS05ZUzk1UVIyS1YwNVVvd2ZRZDMr?=
 =?utf-8?B?cEpkUDhQZzF1WGU5SmZJbVJKWXlkTUVqbnBSYkkzaDJuNFhYYzFMM2ZXUUUv?=
 =?utf-8?B?QWxyVGxNN24zWVhORHhZbDI5d3dabmtnSHBzTzJNQlJpNHJWM1dvYTA4N2xQ?=
 =?utf-8?B?clk2Ykt5cTJJWjU0aW9rRE9iUUVWUEYrTWJjVWxFYTkvd0J0U3hiVU5RM3FU?=
 =?utf-8?B?N3NaN08vV016T2JHQmtUR3VyVzk1eUJXZjlpRW40N3p0QWhFWFMzRkJOTDVX?=
 =?utf-8?B?MjlXckZpKzZLak9LaEVMMGZ1ZVN4OGVZekU5L1ZtZGpCUHZWcDBQa3VVdlp6?=
 =?utf-8?B?NnBUN1d1L1grZkVKaEFYUU9uakw3d2RiOWdleTF5TGR0b1VFT21xU1hZOEVC?=
 =?utf-8?B?VHh5cDUvTGVjbDBVNGZ4cGdBcmZLTVUwV3NqSnV6QnF1SjVjYUE0Zk9Ec1My?=
 =?utf-8?B?NU5NVXZzV2laVlRJbjN3dW1xQ0h5MmR1NXhGOVZCeTYxUEpyRWIxMFI5N2VT?=
 =?utf-8?B?cmhnODBOUThGSE1TNkVqaXdCZC9pK3RMYWVsaDlZbDB6SlRNTDVZK3JEd1h1?=
 =?utf-8?B?ZTFvc05GMEFtTzc3RnYzbUkySzFGeXhDU052bllkQVhmM2VTMzJmbzViN282?=
 =?utf-8?B?cWo4bEczTnlQZVdHWGJ0K0wrazI4UTJLNTFVaDQ4VjNrQkJGMjAxcVBzZFd0?=
 =?utf-8?B?cGpQdGhyR3IraC9BSnZsMThheWtXYnc1NnFJSU5Db2xuYjRvZVZJc1h3Qksv?=
 =?utf-8?B?R3VZUENwSjlDUlcyMVpKN0ZnbFlYOTE1b3NaTjVYZVppWEZkMmV0Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: AYsy3ItyRC47CasdRhMbg2Bdgn0p71jP0W6zHKSphDkZg2PxvJpQE0EIwHxrssGPP9zP0juYuWZEGALOZ0/woeeFUXz4glrpp8BC62WuTTdZESpk2tbdPT30cm/u152GHUs4dcsIJFb6GD6MJJJK3bUrbS9fTLTc+cq1F70I1K+nqdTPubLhTqtj2Yf38tWVfh1kCCxF1epcj6EnU7iC1QRIBMgUNtAEO+5gcNSnt932NwLJfa1jcM0w9L4LDgJpaAZaYjmDlWUYJRgKxfsxxNaxw4KIMC45FviSHurKPt0+PBNIBOl/x/yMA+LytsVyuIoJdtJpHWxrfNn715lQbQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d6b33fe-4c6c-4c50-f0eb-08df46cd3bc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 06:12:19.4641 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RXWerujJtOGXoZtvn+4tiRd8UTj5wQle+bnmq6M09/1L5Ep0xBjiUpwbLfHQLQQIdyRDJxBp+fzFsqijhRhwEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6745
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
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PiBTdWJqZWN0OiBbUEFUQ0ggdjIgMS8yXSBkcm0vaTkxNS9wc3I6IGNsZWFuIGZ1bmN0aW9uJ3Mg
bmFtZSBmcm9tIHR5cG8NCj4gDQo+IEFwcGx5IHMvX2NvbnRpbm91c18vX2NvbnRpbnVvdXNfLyBm
b3INCj4gbWFuX3Rya19jdGxfY29udGludW9zX2Z1bGxfZnJhbWUoKS4NCj4gDQo+IE5vIGZ1bmN0
aW9uYWwgY2hhbmdlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWljaGHFgiBHcnplbGFrIDxtaWNo
YWwuZ3J6ZWxha0BsaW51eC5pbnRlbC5jb20+DQoNCkxHVE0sDQpSZXZpZXdlZC1ieTogU3VyYWog
S2FuZHBhbCA8c3VyYWoua2FuZHBhbEBpbnRlbC5jb20+DQoNCj4gLS0tDQo+ICBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jIHwgOCArKysrLS0tLQ0KPiAgMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jDQo+IGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYw0KPiBpbmRleCBiZDE2NTYzNjAzMjQ5Li5m
MTA5MWM4NWQ3MDE4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX3Bzci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
cHNyLmMNCj4gQEAgLTI2MTUsNyArMjYxNSw3IEBAIHN0YXRpYyB1MzIgbWFuX3Rya19jdGxfcGFy
dGlhbF9mcmFtZV9iaXRfZ2V0KHN0cnVjdA0KPiBpbnRlbF9kaXNwbGF5ICpkaXNwbGF5KQ0KPiAg
CSAgICAgICBQU1IyX01BTl9UUktfQ1RMX1NGX1BBUlRJQUxfRlJBTUVfVVBEQVRFOw0KPiAgfQ0K
PiANCj4gLXN0YXRpYyB1MzIgbWFuX3Rya19jdGxfY29udGludW9zX2Z1bGxfZnJhbWUoc3RydWN0
IGludGVsX2Rpc3BsYXkgKmRpc3BsYXkpDQo+ICtzdGF0aWMgdTMyIG1hbl90cmtfY3RsX2NvbnRp
bnVvdXNfZnVsbF9mcmFtZShzdHJ1Y3QgaW50ZWxfZGlzcGxheQ0KPiArKmRpc3BsYXkpDQo+ICB7
DQo+ICAJcmV0dXJuIGRpc3BsYXktPnBsYXRmb3JtLmFsZGVybGFrZV9wIHx8IERJU1BMQVlfVkVS
KGRpc3BsYXkpID49IDE0ID8NCj4gIAkgICAgICAgQURMUF9QU1IyX01BTl9UUktfQ1RMX1NGX0NP
TlRJTlVPU19GVUxMX0ZSQU1FIDoNCj4gQEAgLTI3MTIsNyArMjcxMiw3IEBAIHN0YXRpYyB2b2lk
IHBzcjJfbWFuX3Rya19jdGxfY2FsYyhzdHJ1Y3QNCj4gaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19z
dGF0ZSwNCj4gIAl2YWwgfD0gbWFuX3Rya19jdGxfcGFydGlhbF9mcmFtZV9iaXRfZ2V0KGRpc3Bs
YXkpOw0KPiANCj4gIAlpZiAoZnVsbF91cGRhdGUpIHsNCj4gLQkJdmFsIHw9IG1hbl90cmtfY3Rs
X2NvbnRpbnVvc19mdWxsX2ZyYW1lKGRpc3BsYXkpOw0KPiArCQl2YWwgfD0gbWFuX3Rya19jdGxf
Y29udGludW91c19mdWxsX2ZyYW1lKGRpc3BsYXkpOw0KPiAgCQlnb3RvIGV4aXQ7DQo+ICAJfQ0K
PiANCj4gQEAgLTMyNzMsNyArMzI3Myw3IEBAIHZvaWQgaW50ZWxfcHNyMl9wYW5pY19mb3JjZV9m
dWxsX3VwZGF0ZShjb25zdCBzdHJ1Y3QNCj4gaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0DQo+
IA0KPiAgCS8qIFNGIHBhcnRpYWwgZnJhbWUgZW5hYmxlIGhhcyB0byBiZSBzZXQgZXZlbiBvbiBm
dWxsIHVwZGF0ZSAqLw0KPiAgCXZhbCB8PSBtYW5fdHJrX2N0bF9wYXJ0aWFsX2ZyYW1lX2JpdF9n
ZXQoZGlzcGxheSk7DQo+IC0JdmFsIHw9IG1hbl90cmtfY3RsX2NvbnRpbnVvc19mdWxsX2ZyYW1l
KGRpc3BsYXkpOw0KPiArCXZhbCB8PSBtYW5fdHJrX2N0bF9jb250aW51b3VzX2Z1bGxfZnJhbWUo
ZGlzcGxheSk7DQo+IA0KPiAgCS8qIERpcmVjdGx5IHdyaXRlIHRoZSByZWdpc3RlciAqLw0KPiAg
CWludGVsX2RlX3dyaXRlX2Z3KGRpc3BsYXksIFBTUjJfTUFOX1RSS19DVEwoZGlzcGxheSwNCj4g
Y3B1X3RyYW5zY29kZXIpLCB2YWwpOyBAQCAtMzcyNSw3ICszNzI1LDcgQEAgc3RhdGljIHZvaWQN
Cj4gaW50ZWxfcHNyX2NvbmZpZ3VyZV9mdWxsX2ZyYW1lX3VwZGF0ZShzdHJ1Y3QgaW50ZWxfZHAg
KmludGVsX2RwKQ0KPiAgCQkJICAgICAgIG1hbl90cmtfY3RsX2VuYWJsZV9iaXRfZ2V0KGRpc3Bs
YXkpIHwNCj4gIAkJCSAgICAgICBtYW5fdHJrX2N0bF9wYXJ0aWFsX2ZyYW1lX2JpdF9nZXQoZGlz
cGxheSkgfA0KPiAgCQkJICAgICAgIG1hbl90cmtfY3RsX3NpbmdsZV9mdWxsX2ZyYW1lX2JpdF9n
ZXQoZGlzcGxheSkgfA0KPiAtCQkJICAgICAgIG1hbl90cmtfY3RsX2NvbnRpbnVvc19mdWxsX2Zy
YW1lKGRpc3BsYXkpKTsNCj4gKwkJCSAgICAgICBtYW5fdHJrX2N0bF9jb250aW51b3VzX2Z1bGxf
ZnJhbWUoZGlzcGxheSkpOw0KPiAgfQ0KPiANCj4gIHN0YXRpYyB2b2lkIF9wc3JfaW52YWxpZGF0
ZV9oYW5kbGUoc3RydWN0IGludGVsX2RwICppbnRlbF9kcCkNCj4gLS0NCj4gMi40NS4yDQoNCg==
