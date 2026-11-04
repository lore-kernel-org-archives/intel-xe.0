Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5E0606A33B
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 20:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FL2T+zN7
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A8D10E8E8;
	Wed,  4 Nov 2026 20:26:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A22F110FED3
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Nov 2026 20:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793823959; x=1825359959;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=+y+Ci9KrS7bVsaC5zLYPs+TkGoHHEDZva0PrOE8TxkA=;
 b=FL2T+zN7FZCrlnaeoYmjJoYO4mcnuEkOoeWtYh88TLNVYklThCsfLx0Y
 cGpA28Q6HOub9HNcgT7nl8zL5kfTbbt+vhMxNx+uUGsZ3Zx1LN3E87yzO
 J113diULfe15YjNTIhJf9VxKwtr42rpwmCajtmzqP8KAfStAWm1DL8K3r
 Es8sXuJiVkvEoz4k7wxA4dDI1SLeD/QHZKDRPRZHjXt5QbZJ9P/9UD28A
 61kHvSdIg4omEJN1HFnc/drD/NYz8+WZ5VXjf3a20s7Xbvn0rt6utrGh4
 2OHOUwqsHT4OYvUIFUuIZx6yyjzttdoisE54uk8V1KKtzECDCWqhpLKlo Q==;
X-CSE-ConnectionGUID: jmKreKbVTsWjjv9AZDGPgw==
X-CSE-MsgGUID: BV/BhESSTCKTz7TWlZfZcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2590071"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2590071"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 12:25:59 -0800
X-CSE-ConnectionGUID: PfYdeyXHTIuzJKj5l5/Sbg==
X-CSE-MsgGUID: d+uqovBjQ5qLiDQqV3V95w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6972597"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 12:25:58 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 12:25:57 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 4 Nov 2026 12:25:57 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.13) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 12:25:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=huOsOXnUUiM4+g6azf4Jtt0tyUgHb2d6Umo2nuoFMAmGDzwtTRzMVa7E197PKAhErBhOLZoxI5bcxJaNwndFro98KQ3Ns7nAonMSNSex8uGAgVHA0A2oeL94AW8+zMWB1T7rCwOozOVab24SioC1pxuhSmeFJPfmptXVPeVaO6LaBdsDBzUxkv4QDnJB1RgqYCoOI6aYmPtZqKOHcVhgCiaOB/v5WttDsy7YmyhohFw/BC93t1PhLd/2cLpfUPZji752ehT9nVPRWLELtaRFklGVGIjSRTFSe9qyQUsBTS95hs+bRtEDDLkUb5Ol3o+aWwaDWgam8ERRvj2e++KTmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+y+Ci9KrS7bVsaC5zLYPs+TkGoHHEDZva0PrOE8TxkA=;
 b=O2zX6HAImiPx8BGy3uEsCmQ2VugiFAIubYAoKcRgwtwPkCDpJnP7D5hlSWkSZX7k2UHOlCwbCjd8veCrZWgRLMqYf0/QXJdFOiOAKUzXkECUVzWiJaAGZ1Xy83Ny5TBH+L83Pa2XNiUt/a8LDDn1MapS9ErOSctnM2MQqAuU1Oh6vxGWkTDlbHPfT8sEPe873TKOWb2gyMu+ue6ErBh2mi7n0X0DXtekgPO+2r8uvtZgmbHT5LnAqk2YJi6mYcnwWvudUUX3n47NozPRUPTi0rymjXrQJ+SPg+05wtp/qrupmq5UII9A+NN6lIXAFFM9GvBQYL8Sqn8ZnX82JIL2ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from AT6PR11MB072844.namprd11.prod.outlook.com
 (2603:10b6:170:10a::16) by PH0PR11MB4901.namprd11.prod.outlook.com
 (2603:10b6:510:3a::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Wed, 4 Nov
 2026 20:25:52 +0000
Received: from AT6PR11MB072844.namprd11.prod.outlook.com
 ([fe80::520a:561:ace1:e64b]) by AT6PR11MB072844.namprd11.prod.outlook.com
 ([fe80::520a:561:ace1:e64b%6]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 20:25:52 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "brgl@kernel.org" <brgl@kernel.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "andriy.shevchenko@linux.intel.com"
 <andriy.shevchenko@linux.intel.com>, "Kumar G, Naresh"
 <naresh.kumar.g@intel.com>, "Vivekanandan, Balasubramani"
 <balasubramani.vivekanandan@intel.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
 "bartosz.golaszewski@oss.qualcomm.com" <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH] drm/xe/i2c: Fix use-after-free on driver unload
Thread-Topic: [PATCH] drm/xe/i2c: Fix use-after-free on driver unload
Thread-Index: AQHdWAv2C1K8lB/uD0uf3ba2q+QLVLb5znsAgAAZS4CAFepAgIAAaF4AgASkLgCACEuPAIAAjOeAgADHcACAAAbOgA==
Date: Wed, 4 Nov 2026 20:25:52 +0000
Message-ID: <15e0bb3e55a27fabc6a58e29f789feb4cedb387b.camel@intel.com>
References: <20261009164241.923756-2-balasubramani.vivekanandan@intel.com>
 <7939f69c-bc63-4465-a578-8024e20c4eb8@intel.com>
 <aszdvyOY5zkyFTU1@bvivekan-mobl1> <at8_996Aarbq0_TO@black.igk.intel.com>
 <at-XhFGST5C3lFTu@ashevche-desk.local>
 <q2caxyahv532pazvrfgzartdn6433hkkz35ofwhfuizdzbd5ch@rkvjmv63kdce>
 <80e999b49fb3489a891742dc4267be740b0035c6.camel@intel.com>
 <vr6opngpmfg75pngzrkb7xnllrjnpjq5dlliishq3tm3wdm4n7@kwlo3kdvjquf>
 <eac803a47fcc89ba9c76a21c589ba06660b0d547.camel@intel.com>
In-Reply-To: <eac803a47fcc89ba9c76a21c589ba06660b0d547.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AT6PR11MB072844:EE_|PH0PR11MB4901:EE_
x-ms-office365-filtering-correlation-id: 1313d745-9af5-48d2-e2f9-08df3ab1d2b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|261022105027099003|261022075727099003|261009223027099003|261026140227099003|38070700021|261028144727099003|4143699003|11063799006|10067099003|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info: 6WASlaS0ar3275mO3eOgU48JzohbMTHVFzWfWZFwdwZz/yisdb5GyoHaivpl/aDKQIm5w14E0Zqb3um+tZOTwaLGf5evp2bgUlupCttvrgRN1LCB2vTkZpjyfYYG5rGbB57UFZKK80QFrlGuNKvSP1X8kxuQLs1i/tx5aceNdbF+Wafoy2Tx7S+F6wtyNmnbe+TjomuCS+Bt1HwDJUnpwyMgPNrT3arB8fN4UsYWbJAhTL0ZSOATM1TA0IiJtvL0X+GjB88fxmSD0H856gj5vwVosRjhVehiL0FuzqM1wLLqKyjHqh9z0IoIWiwIleng+GkF28HcSgiKTdhU+kAjoG0SqxbHkOTfoLofEv+dOIjht3gFtri5q+WZ/nRS7drwBY8N9w6Q76xUudpQIAVUk9cKIRpf9btlRxW3GNmnrM+7abV4Ky4Tu5L1GBQvhe/b8a8CuJXASnjq/s8RnPI45IUUJ24FTjxxKl/exaEgYcbJ8hUMRSkoiLMx2W3HkEyL8/9WqA6UhqFyU5+G7wzrqLLIVrYXCFp7MyQNP1vkSzN7BOMKUfDyaBj2nm1amjYkxnB1KfB9VsHMta1z4c9WhYMxU6B7oy5DMeel7touZF0Uh4X5s3m+l3Dyn/5jAFrl2EGhqpHHcp6dhD20MIc1viaRTAkOT98P44dUOjNDpjU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AT6PR11MB072844.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(261022105027099003)(261022075727099003)(261009223027099003)(261026140227099003)(38070700021)(261028144727099003)(4143699003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZCtFcjBERmdiT2g4cXg3QVZSdmN5WUxlSkQzUmZoMkduUGo3bTZxdFdWckZF?=
 =?utf-8?B?SytQcXdjZ1lxWjh5emthOTQ5dnI1a2oyTk5rTHppQ3kvelFKUVNjWjZLRFVR?=
 =?utf-8?B?N2VpVmR2c3JGSzVINXZsUWVxR1RYNS9ZMC9OVXQ3UTNVNGVqM0tCbndCenVw?=
 =?utf-8?B?M1g1L1UvNUJNRXloOXpReFZhdFlMRGtORXVzcUUxWkUvT0hpQmxaM0QvbnVx?=
 =?utf-8?B?eGJLS3dGWk5GVVRoNnBhMVR4VXMySk9nM2VKMGJZU1FnWlpiV1NCNnpFbDFk?=
 =?utf-8?B?R29jVHFjdEk5YlRYdy8xQW1nZmtYdXlWa1R2Rld6RHFyVjIrcWphMmx4aWxv?=
 =?utf-8?B?V0VFZi9TSndmREJqVXFaa2d4ck5CQ1NTZHNockJ3T0hLY1liLzRsWkc5TUZp?=
 =?utf-8?B?S1E2dlR4eis3b1FzeS90dXdzRUt1SFJuWHdJSXhzRFdxZzBVVHZiTnZ4dlZR?=
 =?utf-8?B?ZVgzY0ZEZVR1SSs0SzBnSXdlMklFTUlXckp3K0Y2YUMwb1NkeXNXL09LVjZC?=
 =?utf-8?B?T0ZpVXl1NHFtTFU4Tk1pWnlZaVJ5ckhEZWdoaWh0NytpMS9MenpTRnJNbEh1?=
 =?utf-8?B?UTI4ZVE4cUZoR29tUldGMXBQeXR2Z3lWc0VHa0s3dnZXZFZKUWRpY3BUR1RY?=
 =?utf-8?B?Unl3TUQ0OXhWV1k0dU5ucEIxS0ZBOVBLUjFpTDdJZTV4Rm5DYm1zbEJpeld3?=
 =?utf-8?B?Vm5JdjRJVUxKSCtYdHhaNmNFR2s1a3dFdll1aUFwQ3BFYlRrNDZGdWVRdzhu?=
 =?utf-8?B?ejd0NC92R0tXSVd3WU9nZml1ZEU5a0ZmVE5OdHhHMkxQQmVGZW04QmxzZWdB?=
 =?utf-8?B?VmUyLzJtRFFrUmphWkkrRWZCbjBkcTJMVFM1MDRGVnh1Ump6d1VvNjRPbkhM?=
 =?utf-8?B?clAvMjZ0ZlQyeHBwSWdkbHg2WU8vbG9OcGw2RHFzbDdjZ3phWUxlYStMNmtJ?=
 =?utf-8?B?eGgvdjZpVTkrdXVtdDZsM3FwTWdxWUJQZUhwT3l5OUFYdjIvWVZBMEpvbVEr?=
 =?utf-8?B?RWlDZUhnczVPd1FzU0lCdlluSEJySnZCbWk1ekw3M2pNZS8vMGFybTF2amdj?=
 =?utf-8?B?QnVWMXNSZm82R0I1Wkh2a3hWQWZxdlFWOFprVitPeHBYTUNRYjRwcEVMQWFq?=
 =?utf-8?B?aDc5VEF0MWExcGNsWGZyNlIrY0Rvc0NvMTI4R2FwYXJpTzk2U1JFd2g3anA0?=
 =?utf-8?B?M1NMcWVQdmVkNG96ck5iV2o5em5TZFFMYTlwUStIMnVjU3hMbi9WdDFRSUJT?=
 =?utf-8?B?RitRU3MwL0pieXdmclp2UFBtUk1Dbjc3SDFzTUJXSG5BVVpDVnh0VFpkWmlK?=
 =?utf-8?B?eFpFeDJ4RzJ6Tnp1bHh2TEJDR3FaOGttREtjRkRKWVFHRXJkeHdvdnY4SWNk?=
 =?utf-8?B?WmZSUTdCaVBpWTBzYmEydUZSLzI5aFZPSEY2bU1mZkw1MWxCU2lrbUlYYnFR?=
 =?utf-8?B?YStGbTMvVHlianlRYVFzVmhCSUNuVlZwMGhsRE5yU2x4Tm14SnZEZlBFT1ZI?=
 =?utf-8?B?UXJBQjIvTWY3eEFkZ2hZbHZLcWVqcXhZR1FGQ3VROWtoOU90c1RnQ2Zscmxi?=
 =?utf-8?B?MzdhNXlQR0R5eFZsVTlUdEc2V2RidWtGcWJXcS9mck5GbVpUQVgwM2hUTUI4?=
 =?utf-8?B?aFJSK29LclFmbzJ0MS82Qmkrb3pnSGhOWGo3S3UwZjQxTWhLbjlPVHNCU2Vi?=
 =?utf-8?B?c21YNlJQWEhMWU9TNDlJUFE0Tkd1Mk00TS96cTREYTd0RDdWK1NGaVRqSWFx?=
 =?utf-8?B?SkdqWTE5L2tFUWhOdXNNQ2UrUnNOczVKVzdLN2l0V0lRbDdkV08xQytSRjBi?=
 =?utf-8?B?Mm45UTBUSGZFdHFSWTFNd1EzbXYyb0FWSERFQnVUQ3RrbjhvNk03Vm9TV3FX?=
 =?utf-8?B?aGJ4UmJmOS9EVVM3cXBlQk8veENHWlRQbWJ3K2l2QmE4RjVsbTY5bnVwT0o2?=
 =?utf-8?B?OXpPZm85NGpLT05YYjI0Y0NzYTFMcVlxdlh3Tll0TEhhTE42Y1p5WU9YR1JW?=
 =?utf-8?B?UWZ5YWlTMG5iRVNWSWcwRHpCYm9YTTFrbFptZFBEUGsrV01PVlQ3Vm1hQjVw?=
 =?utf-8?B?K2JVVnJNSHZMcGc2cDBUY3ZPZHg1Q0YrdlNCOCt3bWNocFJVNWdkWHV4M0VF?=
 =?utf-8?B?elM2S3JiVU8rQnBhUk44TUJTOHJyTEtXU1hQUzJOTjcwLzVlR1NFNTJOVGZz?=
 =?utf-8?B?bmF1dUFLR2pJQ0VCai9mQUpqWlQ4VURZVGNNT0ZYSVBTRkMvTDBKYWRqcUJs?=
 =?utf-8?B?YzBreGN1SUhNMElwR1BuMFYySUtpU3dFZzFLancrNWtqOG50N1F6TVlZb0tj?=
 =?utf-8?B?U1RacEZpenRTcVRlZ1hoM2ZWdUFyWFQ2bXRGQlloN3d4cFhHZXhtMEx0am1Y?=
 =?utf-8?Q?9Z/KeV8Q4Bb4rkQU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <43D28F83228C384385C460D4C6D4F7A7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: MqosUCMxWgUu5zOsBV3m2hoxYLf8SYzD5tEwrcF0//I/AhPHz/wtLXpqsZqezwWPtnJA8qKKy6Pe6XcMmarX0gVCHC44tlft6XaGK0tskcv7X8qXWm0CpMCH7DfzNpwfcXx2NA38CvC9zbhQ2+n0dKidGGjO505bhkKTzOb4P+1rrkqStYZ0LbQGtV7iYdrnLzgzidoguVrM8kLUZCAJ3wIvzxBwS9I8+qT5lE/LWGecUxeLXhDXWTDl+tOzlBTZ/+O/zmqJ9w9XmGQEWLe6AkG3pWkFD3g9mulvuh4mrmZqwPw3q9k8t0oBOuHbUuFwc02E6Si82JHIv1RIvb2bSA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AT6PR11MB072844.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1313d745-9af5-48d2-e2f9-08df3ab1d2b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2026 20:25:52.8604 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cGFT2QnyExSXtudAGsVuGtfbNLtm4wS10RUAL/UK71i68YU0SXDvqHn9aLEXgRR0Kn0rQ34iThv4ulMm3du0PFq4fUNkuQjVP2gVd64lYvI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4901
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

T24gV2VkLCAyMDI2LTExLTA0IGF0IDIwOjAxICswMDAwLCBTdW1tZXJzLCBTdHVhcnQgd3JvdGU6
DQo+IE9uIFdlZCwgMjAyNi0xMS0wNCBhdCAwOTowNyArMDEwMCwgQmFydG9zeiBHb2xhc3pld3Nr
aSB3cm90ZToNCj4gPiBPbiBUdWUsIE5vdiAwMywgMjAyNiBhdCAxMTo0MzoyM1BNICswMDAwLCBT
dW1tZXJzLCBTdHVhcnQgd3JvdGU6DQo+ID4gPiBPbiBUaHUsIDIwMjYtMTAtMjkgYXQgMTg6MDIg
KzAxMDAsIEJhcnRvc3ogR29sYXN6ZXdza2kgd3JvdGU6DQo+ID4gPiA+IE9uIE1vbiwgT2N0IDI2
LCAyMDI2IGF0IDA4OjEwOjEyUE0gKzAyMDAsIEFuZHkgU2hldmNoZW5rbw0KPiA+ID4gPiB3cm90
ZToNCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gVGhlIGJlbG93IHBhdGNoIGFjdHVhbGx5IGxv
b2tzIG1vcmUgY29ycmVjdCB0byBtZSBjb21wYXJlZA0KPiA+ID4gPiA+ID4gdG8NCj4gPiA+ID4g
PiA+IHRoZQ0KPiA+ID4gPiA+ID4gc3dub2RlIHBhdGNoIGFib3ZlLg0KPiA+ID4gPiA+ID4gDQo+
ID4gPiA+ID4gPiBBbmR5LCBJJ20gc29ycnkgdG8gYm90aGVyIHlvdSB3aXRoIHRoaXMsIGJ1dCBj
YW4geW91IHRha2UgYQ0KPiA+ID4gPiA+ID4gbG9vay4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBC
YXJ0IGlzIGluIENjIGFuZCBJIGJlbGlldmUgaGUgcmVjZW50bHkgcHJvcG9zZWQgc29tZSBmaXhl
cw0KPiA+ID4gPiA+IGFnYWluc3QNCj4gPiA+ID4gPiBkcml2ZXINCj4gPiA+ID4gPiBjb3JlLCBi
dXQgSSBjYW4ndCBzYXkgbm93IGhvdyByZWxldmFudCB0aGV5IGFyZSAoYXQgbGVhc3QgYWxsDQo+
ID4gPiA+ID4ga2V5d29yZHMgc291bmRzDQo+ID4gPiA+ID4gdmVyeSBzaW1pbGFyKS4NCj4gPiA+
ID4gPiANCj4gPiA+ID4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjYxMDIzLXN3
bm9kZS1kZXYtbm90aWZ5LWJhbGFuY2UtdjItMC05NDhkOTIwYTc5ZjZAb3NzLnF1YWxjb21tLmNv
bS8NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBDYSB5b3UgZ2l2ZSBhIHRyeSBhbmQgc2VlIGlmIGl0
IHJlc29sdmVzIHlvdXIgaXNzdWU/DQo+ID4gPiA+ID4gDQo+ID4gPiA+IMKgDQo+ID4gPiA+IEhp
IQ0KPiA+ID4gPiANCj4gPiA+ID4gU29ycnksIEkgbWlzc2VkIHRoaXMgdGhyZWFkIGJlZm9yZS4g
VGhpcyBzZXJpZXMgZml4ZXMgYSBkaWZmZW50DQo+ID4gPiA+IGlzc3VlLg0KPiA+ID4gPiBJJ2xs
IHRha2UgYSBsb29rIGF0IHRoaXMgb25lIGJ1dCBpdCdsbCBwcm9iYWJseSBiZSBhIGRpZmZlcmVu
dA0KPiA+ID4gPiBmaXguDQo+ID4gPiA+IA0KPiA+ID4gPiBPbiB0aGF0IG5vdGU6IGlzIHRoZSBz
d25vZGUgYmFsYW5jaW5nIHNlcmllcyBnb29kIHRvIGdvPyBJDQo+ID4gPiA+IGhhdmVuJ3QNCj4g
PiA+ID4gcmVjZWl2ZWQgYW55IHJldmlld3MuDQo+ID4gPiA+IA0KPiA+ID4gPiBCYXJ0DQo+ID4g
PiANCj4gPiA+IEkgd2FzIHNlZWluZyB0aGlzIG9uIG15IHNpZGUgdG9vIG9uIHhlIGRyaXZlciB1
bmJpbmQgYW5kIHB1dCBhDQo+ID4gPiBxdWljaw0KPiA+ID4gdW5pdCB0ZXN0IHRvZ2V0aGVyIHdp
dGggQ2xhdWRlIGluIHRoYXQgcmVwcm9kdWNlcyBpZiB0aGF0J3MNCj4gPiA+IGludGVyZXN0aW5n
Li4uDQo+ID4gPiANCj4gPiANCj4gPiBXaGVuIHRoZSBmaXggZ29lcyBpbiwgcGxlYXNlIGNvbnNp
ZGVyIHN1Ym1pdHRpbmcgdGhpcyB0ZXN0IGluIGFuDQo+ID4gYWN0dWFsDQo+ID4gcGF0Y2ggdG9v
Lg0KPiANCj4gVGhhbmtzIGFuZCB5ZXMgdGhhdCB3YXMgbXkgcGxhbi4gSnVzdCB0aG91Z2h0IEkn
ZCBjaGltZSBpbiBoZXJlIHNpbmNlDQo+IHRoaXMgc2VlbXMgdG8gaGF2ZSBwb3BwZWQgdXAgaW4g
YSBmZXcgcGxhY2VzLg0KDQpPayB3ZW50IGFoZWFkIGFuZCBzZW50IHRvIGRyaXZlci1jb3JlLiBM
aWtlIHlvdSBzYWlkIHdlIHNob3VsZCB3YWl0IHRvDQptZXJnZSBzb21ldGhpbmcgbGlrZSB0aGlz
IHVudGlsIGFmdGVyIHRoZSBmaXggZ29lcyBpbiBpZGVhbGx5IDopDQoNCmh0dHBzOi8vcGF0Y2h3
b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTc3Nzg1Lw0KDQpUaGFua3MsDQpTdHVhcnQNCg0K
PiANCj4gVGhhbmtzLA0KPiBTdHVhcnQNCj4gDQo+ID4gDQo+ID4gQmFydA0KPiANCg0K
