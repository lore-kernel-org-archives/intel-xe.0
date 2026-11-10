Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D518606A32A
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 12:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g+E3/law
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD9CC10F60B;
	Tue, 10 Nov 2026 11:59:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E567C10F622;
 Tue, 10 Nov 2026 11:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794311987; x=1825847987;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=GrP7eXjKPAe6+8O6efB0oARQMrmAda0sqAS9zu8EYUk=;
 b=g+E3/lawj8Tk52el46Ss2M5Rbs/MraSI+PQguWB316KoRhsbyaraj4Hg
 UjBX3wY69+M96HwLs1jpv6JGAA4rnGHgibG1vcVM191UrqPkamFACZec/
 v8Fif1zG+H/BQBWPSZgecm0VrsFNJgc0oxoHQZO0/oC8bsgyQFIDZ1DYF
 A7SCjLWBymvvOaJA28o0nDS8joa88MbzIF/n0sb+adC3WsVX+SJ+cVZDt
 Ng02CKigzV8deVfrqehQ+J9zbTFGN/PHLrKvhSEYiMIaRzozpfx9VSCy1
 0EuSlUnGgAJB6pAg94s0pUXE57MvaLT7VaqDrUTQ+A+/En7Ho31/dDZZh Q==;
X-CSE-ConnectionGUID: Z9D4Uh0xQduTX9vseoiGFA==
X-CSE-MsgGUID: emnb4phjQ9CpCgWzu71X1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2947746"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="2947746"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 03:59:47 -0800
X-CSE-ConnectionGUID: I/AInZg1QMe2JjZfciUw7w==
X-CSE-MsgGUID: ayFpjezmQGaQ/asfBbqEKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8438064"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 03:59:45 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 03:59:44 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 10 Nov 2026 03:59:44 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.13) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 03:59:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xz3R5g0MAAhjUjL2cg9IwYZCLtAvGzYxeJXeeuHtbX7Bl/HR1h48/517j0vjHa33Yy1n9WS4d0emhdqsLg3CktxWC4G6C1mCKDfePpJm6npTnB7anK3KygsiVMrts/Tn0R2RVc4MW7LMzIu3VKGBcrtIgdVcUJD+aqCtBnlJIhQ7gFyzCBCJ/HrCy5q/0Y20qc0sT4dkzkXm1+HP2v5LCdnuIR+BKZXBKQQqEFl6X01l4D7WPC1+ayUgg1+OuCHjebZjxXbeC6Pk0T7dgt3lNiZjapf8i5cq93fvxn//+LcvVyA00PCqcU0w1zF4pRg2eMawU6CwCFH19jQknVGRWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GrP7eXjKPAe6+8O6efB0oARQMrmAda0sqAS9zu8EYUk=;
 b=BzeshwYm0EvSxrx2+Cs/F5hz1fC5IcTnZIH3d68q0ft8bXKLW6WMezleeNzkezQu9v9GgcQ8Pr9wF1Juf0ssldysxFRBnzlZntSVsJ6+iwSVOThqRCGuxVVcfpuENgcFAUcCeyGmwoTYxkvRxzKL5o9nvUELinWpPJMsS3u7Arso0KszUVt3vvAzM+PyhiGZoqqtMbzD3lzpGGVsSASi9tBzpe6FlVpTCDyvqItYU/mSt1xeR1ILa20pcTq34JFx8Q1uB/er08cI3Jk6JrT9STNgoH5JevJkB5bNMl9OH7LD9g1p+S+2XI4tCtcmmzlgo5VWl/Zs3FLFyxZubQACgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV2PR11MB6024.namprd11.prod.outlook.com (2603:10b6:408:17a::16)
 by SA3PR11MB953716.namprd11.prod.outlook.com (2603:10b6:806:536::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 11:59:35 +0000
Received: from LV2PR11MB6024.namprd11.prod.outlook.com
 ([fe80::38ad:3190:bbb2:412b]) by LV2PR11MB6024.namprd11.prod.outlook.com
 ([fe80::38ad:3190:bbb2:412b%6]) with mapi id 15.21.0592.010; Tue, 10 Nov 2026
 11:59:34 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Pramod, Ambica" <ambica.pramod@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "Kahola, Mika" <mika.kahola@intel.com>
Subject: Re: [PATCH 0/2] Frontbuffer tracking fixes
Thread-Topic: [PATCH 0/2] Frontbuffer tracking fixes
Thread-Index: AQHdaD01JjtrsEg3P0uM/qnkMuwC7LcV31yAgBFmD4A=
Date: Tue, 10 Nov 2026 11:59:34 +0000
Message-ID: <b3fc42d4402167152a37e8ca994eeec052f75634.camel@intel.com>
References: <20261030070613.181026-1-jouni.hogander@intel.com>
 <DM6PR11MB2890BA35E537583292286DD4E16D2@DM6PR11MB2890.namprd11.prod.outlook.com>
In-Reply-To: <DM6PR11MB2890BA35E537583292286DD4E16D2@DM6PR11MB2890.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR11MB6024:EE_|SA3PR11MB953716:EE_
x-ms-office365-filtering-correlation-id: aeb615e8-f1ee-4728-e278-08df3f221637
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|10067099003|38070700021|4143699003|11063799006|261102123227099003|261021121427099003|261021123027099003|56012099006|261009223027099003;
x-microsoft-antispam-message-info: XKPsqBa5pxYgCUvsch74UxWJP3YvOhgH78jZ0UfmSK4ByXzzd8BFIPaerB3IsxmETyvd0lz7AEB6V5aeXChw9CCgYUNFZyY653phT3gYvkpaKOT1u2RFVhgaSO2EcKVoIUcCVA+1mB82qIapIbqLWDUbr36POcrEECvyuk+s4gq4qpKV9JIUj/Yn7zlm/6RdEHeoPZS+TfG3J3Yid3dgXXgssRYM4DVqquYpLZ+zTmq72/BhNzerZHA7wArHY0fxF5E/jlOeV0K+a3o8uqn4cDjKYy4mG+ijZJ7VK+zAqzeUIfEId3slaEGnF6YlTOhEqXdO80IPObPs4jL8HHdH3BAG+FONpl2JcpEu4z98lhTsNkZA1q4ksBLsQY227+etHZgg5WxY/OYzBZDkr4pHWoGPuM6RF1q8xMY9l8SXD1/zo38kjwSj6qfGK6coD1VlzpKKBBwRrqo0UQfk4ZbTRgwVkdasoBHy3SU5HqYDwAYEizP/HQR8uozL78qzqZ9XUQL0boy+1BHNkb0AhamFS1LzyHUne2W8b6n96pD3qS8/fAL7UCPTuLi3xnl6o6MyjdRz+ReLEdjy8kf/UXqMECJl9wxh/fOLpzK9vliRTioh3rQdk4fOIl13hk2FK9zFEuW5MZ6vyKL5sDWj1BBU8BcttdYTl9FKdJymW1gGwNO//66T1F6YRFy47ORrfTPmjG1R0Y2jkrlrU+OXmNcTreVzvAeDwVbYM3aHw/X391I=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB6024.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(38070700021)(4143699003)(11063799006)(261102123227099003)(261021121427099003)(261021123027099003)(56012099006)(261009223027099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZWlnNmczMFF5UVBRdkd4aHlqSVQrVnh6RjRNaFJVNWxLeUx6NmpEZXVZWVRp?=
 =?utf-8?B?bFZxZWZkaXZHRUNlUmhjTDVOaCtUNm00dG05dnFBOElGVlNyTjRSTEZpck5X?=
 =?utf-8?B?LzJYZXhGY0pEaGo1dXF1UVByTFlIMjAwcnFWVGVmTDB3TmVaSXBGYkpIUTNJ?=
 =?utf-8?B?Smo5N3E0dDJHNzhWdEkwditaTjl2VWFLWEtYYm9qODFieGRXdG5CU04wbEZO?=
 =?utf-8?B?R2dTWlJudy9XTEo2S29RKzBveEtMUFUveUhkaXVtb2ZJTVZveDJMRU8yR24z?=
 =?utf-8?B?TmROVVJLZi9yNnArNm1UVlkyd3BuRjdWdWQvbFIrSklUSkw1NUcwSlV5NHBL?=
 =?utf-8?B?Q2k0cjd4eG5wc3ozYVYyQ2dBOFd0YW4waVlhNWoyNDJoSGZGbG1OVndrS3Fw?=
 =?utf-8?B?Y0hzam1yRFRzbnZBNDJ5NmdkM3cwVmsyMGR2dXBWaS9MRExvbkE3Rnh5NVNk?=
 =?utf-8?B?aE43bGtJQmF3SUNqa0M5ZHBJMDdwNXJyVEJQc2JNQnBWSTY4MXZieTZpSnVs?=
 =?utf-8?B?aSswd0FrRGlnTWVzYzlFeFdERUVpRThKbGhudE03dVdvOGY0VTBHU3dxdTAz?=
 =?utf-8?B?WFhlOTQ5ak15M0RLa1I3M0xybnVNSkJlSW5ib0MweEkreEpubHI0OU02bFFm?=
 =?utf-8?B?b1ZnTG43KzRoZW5VeEY2aHZhNlR1ZFBZU1duakdsWEpOcGFsR3BXc3dlMzFY?=
 =?utf-8?B?VWpZcElDTUloRkR4YnVBTDU4WXBnTDcrVjRBQUJGcTVValFmMDNxcGJOaENW?=
 =?utf-8?B?anpuRnRKMDJyNjY2cy9PS29NdDNDYkkwZGVzRFUrRW9LZGxNUFZLcE9qMURP?=
 =?utf-8?B?Y2FOV2FIamxGRTNjQUNqOGwvTW1PMWllMWFMak5yUVRxb1JyNUhjdjZoVDdi?=
 =?utf-8?B?NGRqYVRyUk0vMUNqQlRPVjVoRXZUbkZqVHpTcFpiMTJkL3Z0ak9yNmJ1SlVN?=
 =?utf-8?B?RGpmM0FvRE9ESzc2K215UHRMU3d2RllGYVk1YkRBKzQwVDdVMmlBaWMwNElW?=
 =?utf-8?B?VDBERHUrdEtQY1lEUGY2NGJ2aE1UZ1ZqK0d2ZndNUlpFY1Q3aGN2WEw5LzF3?=
 =?utf-8?B?ZXNTdUhidUd2T0NQQm5YbGsvNlJrTmg1WU13cGVJTnRNemcwOGYyd25wcWU5?=
 =?utf-8?B?RklhaDV0TU9EY1RyRUFWMnRHVEh0TlN4eGxGRmlUUXFISTZmcDBGbjdVTDhQ?=
 =?utf-8?B?NWpVZHhrb2F0bU5iMnBtdnFNb1U4dG1aRXhkMWVXN0xXeml3ZzNtZUUvNURo?=
 =?utf-8?B?ZXdIaTIzRFdpUDhySy9iU05EZkxhQnVKelhJUjl6QnI4TnQrbll2RVFKVVNz?=
 =?utf-8?B?K1VXOGRWYU4vdE9KSWRYNS9nMEIwa1ZVaUhZYWp1cG1OQzg3ZTdzdmNRb1VP?=
 =?utf-8?B?L25aWW9lMUJkdHBsdS81VXRjcVA4dUR4eUg0WEdaOWUzSUo2bW9odmpMSWNu?=
 =?utf-8?B?NmtQNDh0QjRnbXFHRS93dWx5c2ttcFNsS0IyOGJ5dnpIMFBHbE5rcHFYMGFt?=
 =?utf-8?B?eUh3aml2Rll2bkZZM1lJY3kzMERTOTVseGpqQ0NMTk1CNEZ0M0hPZjRpYUVF?=
 =?utf-8?B?RjFKL3FWTm05cUQvTVJhQWJVejAySEgwMzIxWFNONkg5V01yVjlOSGcyQXZn?=
 =?utf-8?B?T2VPUzhFdDE5TFJWWEgyREhCS0gxMGkxMVBudVl5dHIzR09lN1ZBM2ZuVnhm?=
 =?utf-8?B?L2t5VVMxVmpkazJZL0F4OE9mb2xWdFpERXhSZXEzMEFsK0tncGptcHJpOEU5?=
 =?utf-8?B?UzkyT1ZvTzlncHgxWHc0NjA5WnlZd3VrRVFGajR0UlZNaElnZkRHWEUxMW5C?=
 =?utf-8?B?Um5YSkVSeW9tSEE4eVlkTTl3bkZWZ2xDTjU1UEp5OVdGRXZPR2plYm1BdlNY?=
 =?utf-8?B?YnZ5Mkgxb3ErT3ErTkVKRmpLV1dBei9KcGpXdnBBZjJKc1ltOHJTckk5T24r?=
 =?utf-8?B?Wkg0SHFGemMya1NLQWc5c1l6TmhvdUQ0NXlGSkF1RUwzekp6a29BU1k0amx0?=
 =?utf-8?B?ZTZBZXpzY2VCQlFscEN0VWhYRmRWczZ5QitYMHpMN2dZMlE1S21Cajk2R0pl?=
 =?utf-8?B?cEJYVEYyL3luSmpIU2RGU1pmZnhvMkR1MkI2ZEEvQk1OZTZZUjQrK0owZG1R?=
 =?utf-8?B?QzRGOHlPbG9ZNDBXYTJtOFdWQUZadlYzVG0vSEdheWhoLzd1WjJaUG5mOFQ4?=
 =?utf-8?B?d2ViQXJDVEtwNFVGK0F5SWQ2amVWeDh6TXBJaFRPaHZvSEVrWVl2UUhzOThJ?=
 =?utf-8?B?S1ZsdjhEOWd4SGN5TWxSRGFIQWxxNXY2MUxwODhRK0ZVRHpHRWU0TmpHYkxj?=
 =?utf-8?B?MHF0cnlSaEs0L091R3ZMY2s0V0V2VTBBbDkzM2Jub0Ezc2hWVk1pdSszNGRZ?=
 =?utf-8?Q?RTZgouMZzgPnQhp8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0034FFE027BA9C46BCC86D1EB77BCED9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: bEXT+F3UuVxl9rubRdBRUupW/RheK/Z9C38yCj31/o5tgsOsfTydt3++VjviYG6tv1aqF7oy1mPpAs1Hic+7oPeri/Rwj5EUac6vZ2D3MvtNcnrnjo7aQh9g27Z0EiltI+aAuktuAfoy1KpQSusAGpgCJb/EsvvYpwX6e2SRfeZdS9qKupHhKgxPQ41y9cSvA5O61I4V1CakTmwcGFuAgEegZICZ68pRAZmCY8OoU2HDlZmrXYgg1z2TAJUAc5MbGQ5vWibkIOqYrImMkk5oVgkgDhvV7OY9x5duyTMiBt+FIpuPsBAAkXOLlxdNfY4o0Om9TDPWbvvxHDr697xX4Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB6024.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aeb615e8-f1ee-4728-e278-08df3f221637
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2026 11:59:34.3470 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pwRMZLzeeJdaCpsGeq7PWSdxPvQDwVKE1I1Rc2EzfN5tOoq44C0HSM0SLTMjAuxyzcG+92ZZY3ZdhXGLhA0pfIZXudnVdC3PG2Iek/2XUcI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB953716
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
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCAyMDI2LTEwLTMwIGF0IDEwOjE3ICswMDAwLCBQcmFtb2QsIEFtYmljYSB3cm90ZToN
Cj4gDQo+IFRlc3QgcGFzc2VkIFBDMTAuMyBlbnRyeSBvbiBOVkwgcGxhdGZvcm0gd2l0aCBhdXRv
LWxvZ2luIGVuYWJsZWQgaW4NCj4gZ2RtMyBjb25maWcuDQo+IA0KPiANCj4gVGVzdGVkLWJ5OiBB
bWJpY2EgUHJhbW9kIDxhbWJpY2EucHJhbW9kQGludGVsLmNvbT4NCg0KVGhhbmsgeW91IEFtYmlj
YSBmb3IgdGVzdGluZyBhbmQgTWlrYSBmb3IgcmV2aWV3LiBUaGVzZSBhcmUgbm93IHB1c2hlZA0K
dG8gZHJtLWludGVsLW5leHQuDQoNCkJSLA0KSm91bmkgSMO2Z2FuZGVyDQoNCj4gDQo+IA0KPiAN
Cj4gRnJvbTogSW50ZWwtZ2Z4IDxpbnRlbC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5v
cmc+IG9uIGJlaGFsZg0KPiBvZiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5pLmhvZ2FuZGVyQGludGVs
LmNvbT4NCj4gU2VudDogRnJpZGF5LCBPY3RvYmVyIDMwLCAyMDI2IDEyOjM2IFBNDQo+IFRvOiBp
bnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIDxpbnRlbC0NCj4gZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZz47IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZyA8aW50ZWwtDQo+IHhl
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4NCj4gQ2M6IEhvZ2FuZGVyLCBKb3VuaSA8am91bmkuaG9n
YW5kZXJAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggMC8yXSBGcm9udGJ1ZmZlciB0cmFj
a2luZyBmaXhlcw0KPiDCoA0KPiBUd28gZnJvbnRidWZmZXIgdHJhY2tpbmcgcGF0aHMgY2FuIGxl
YXZlIGRpc3BsYXkgcG93ZXIgc2F2aW5nDQo+IGluYWN0aXZlOg0KPiBmbGlwIGZsdXNoZXMgbWF5
IG5vdCByZS1hcm0gUFNSLCBhbmQgZmJkZXYgdXBkYXRlcyBtYXkgbGVhdmUgYnVzeQ0KPiBiaXRz
IHNldC4NCj4gUmUtYXJtIFBTUiBhZnRlciBldmVyeSBmbHVzaCBhbmQgZmx1c2ggZmJkZXYgdXBk
YXRlcyBvbmNlIGNvbXBsZXRlLg0KPiANCj4gSm91bmkgSMO2Z2FuZGVyICgyKToNCj4gwqAgZHJt
L2k5MTUvcHNyOiBSZS1hcm0gUFNSIGFmdGVyIGZsdXNoDQo+IMKgIGRybS9pOTE1L2Rpc3BsYXk6
IEZsdXNoIHRoZSBmYmRldiBmcm9udGJ1ZmZlcg0KPiANCj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2ZiZGV2LmMgfCAxMyArKysrKysrLS0tLS0tDQo+IMKgZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuY8KgwqAgfCAxMSArKysrKystLS0tLQ0KPiDC
oDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pDQo+IA0K
PiAtLQ0KPiAyLjQzLjANCg==
