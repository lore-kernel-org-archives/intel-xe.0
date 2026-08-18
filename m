Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A13C5DF74
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 06:54:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBF1810E4D2;
	Tue, 18 Aug 2026 06:54:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GuGGVrD9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC4E410E2E9;
 Tue, 18 Aug 2026 06:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787036061; x=1818572061;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=+WL5WJw+R2zBqPr5lHTU2QVD2rM7f0VwegiI50tSoBk=;
 b=GuGGVrD9B7Gt2r0Cm9YxJUbf1KDNwSYWs6CpLfVhqzwKm8vUbjI6wCCY
 JgPm8OXjYc1suSdzyum/2reLOk0HM6EkmopPjnDg5wDY/vQJXIVPBtHGy
 wYcOnSOqQemAUvnKkA2jbNeKPUA3K5juurBmoJu7We+3P0brdf3MCL7T3
 jB8cwQ0lJjJXQJurVi/RZonnqV2yA517uOgYZlZRqRB8AB7xRTmg9RJIr
 pe4aikwpLSRRRRTiCs6IXwDZqdxzerIFMCWaFrgercEdlfi9p3j3Ip+qD
 TN39R8DrsS/fpbsi06f9E7ocohM1CYAbMLXLYYj5Px6e/j8UhxbUT4jon w==;
X-CSE-ConnectionGUID: SPqLp4Z6Sb+DJjAhBshE+A==
X-CSE-MsgGUID: hd911xN9Q6GeYROplgRbmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="87375837"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="87375837"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 23:54:21 -0700
X-CSE-ConnectionGUID: CptrrVmzTruLrQWe2Dv39g==
X-CSE-MsgGUID: KjnHLgq7Rhy8UKAxNoaHsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="260921550"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 23:54:14 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 17 Aug 2026 23:54:13 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 17 Aug 2026 23:54:13 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.57) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 17 Aug 2026 23:54:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pQyt9+qRaeXJmraWbg/gZXbDX2bFT34/ePRTFiMwDG74J6Rw8OMQxq5ganOXpmRrJqP4mD49Qo59J562qTDMY61n+/HExiow79is8+HPofbCFyT2RUdYijXbf4ZhcT+WoBY9d5gwKLUPgWX1UAGYjT1WdqXWLi7XS0FxDPKnAk5wLK2OsLwBfr9ddr2s66E9PR3ThDzKv0zx6Pb800HTWEvv/Y/ER2fwI+v4ChjDV0j9DRz7xyHZtcy1796bw3kmS2PGD1JCkAZY6jaS+LlNXy86xed7gGiIsEe7fxKipJBKZvMX/2Z3vmtwFw3m2tZn6KybLr+kRi8x9Tdzzkr8EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+WL5WJw+R2zBqPr5lHTU2QVD2rM7f0VwegiI50tSoBk=;
 b=ePSz3KVsyr1jRxKKK+L47VBtBprt2YM8xGqPzKORkzOSUGlJcwYcOOLLbjJxXc2ix0EJwf8o68Dm9Nsn+Boz42guxIUoZJ8nxDAxR/Zh5llwPFt0W6UvtGMAefUAchjnpydK3GdEdAPawWHet9N842J7tPTwKdpu728vUEUvebd54Vo/inAt1lO5OtWOrsuQI19IQKuQw4qR8OmC+8hjvCUPJ/sbQS2tyfg7lGWifgni8EZokPGhP1GrKNowVZpTc2h311q2Ho6U+wGTeBK9r/6f30I+3RUbdaVRziblsBieekYXboVaUAFGOdMYP5V/Dpijw9+3FoKfwWsMq2HhEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by PH8PR11MB7000.namprd11.prod.outlook.com (2603:10b6:510:220::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 06:54:10 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::5a6:cd7:969c:fa41]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::5a6:cd7:969c:fa41%4]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 06:54:10 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>
CC: "Deak, Imre" <imre.deak@intel.com>
Subject: Re: [RFC PATCH 2/5] drm/i915/display: add pme_capable() to the parent
 interface
Thread-Topic: [RFC PATCH 2/5] drm/i915/display: add pme_capable() to the
 parent interface
Thread-Index: AQHdLdBBZAurFHtNBkmdWdAW3q2pbbaiCBsAgAFY/wA=
Date: Tue, 18 Aug 2026 06:54:10 +0000
Message-ID: <38839928b5b5147989959741068c001ce180eb0b.camel@intel.com>
References: <20260816224005.886035-1-vinod.govindapillai@intel.com>
 <20260816224005.886035-3-vinod.govindapillai@intel.com>
 <bb80200efea31ed150318deaa8622d8efddb2666@intel.com>
In-Reply-To: <bb80200efea31ed150318deaa8622d8efddb2666@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|PH8PR11MB7000:EE_
x-ms-office365-filtering-correlation-id: bb4368e1-8c86-4721-e799-08defcf581c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|23010399003|366016|376014|38070700021|22082099003|18002099003|10067099003|4143699003|56012099006|11063799006|5023799004;
x-microsoft-antispam-message-info: b9tJYCJuEKdTTqtMpR5MijBMWnkGICWQNNIPwcAPNnV1SluKiDTkmXhakCrxWHYnCPYloyC6B29qEr1TM0v4QEB0s7i8LTuc9Cez/k2ywuYfs7CGqCq7XNR39HF1qoJPzK/NWHZ0sGooaxayg1wFOdP8BwCfyBpj+5n2mTbBmcj6LzQHuqXmV28qq2Kjw2mnEfw2EqElH/SK3UYoIvFmZ9yWReSgkhG7j5i1H1PukzEwfvlnk9jMDJL2krCJ82/LGM/+hIIbc64o3fNXGIxdr3jrX6IA808JOXUltSDh4cZaiTlNqKtKAI41A5vWwxw3u3tQuaoY7Dxl29ZtUO7ZqmY/tAAqFbOiTfJXHaj4aqpp5YoTO+gb+6idN5rCwC6Ye0sQ662GyXVvlkw1gIOYY+P/4GOtXTGEXrN0m4M0O9KFEWlW31cv/oHEG/IM/1/WEkRuZAe3IFV+iunFVzPp3FG1VLj9MpLiRAib12H6VbZ7VMpnGTNS5ZxHjXgLl2zVutVx29xDftlKwYJkJNjg20MLtZRro9wltiM/PHcSea2RbjgaiKBXo03N5UW78K+TXIV2OuVNt2i/062oiGDlcTfRy2Ox2Ia3x3ITCK4M4KdsreYjbHHyi4Vbc9VBO5vzDdkpEgCZYEsmcGjcIwvMzaUVShPjEhvdductt9AqoyD3bvzXOjiLbSyLokW+VZ0ysBJHHkPbf01F+OlXFmY+bN2pGeD+tTzOmoWZRvUsrzc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(23010399003)(366016)(376014)(38070700021)(22082099003)(18002099003)(10067099003)(4143699003)(56012099006)(11063799006)(5023799004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eVlFMm53dE9BYUIwRXNpSi9Ka3g1dWR4YjhRZUo0a2Q5T0d3WVBVM2djUXRO?=
 =?utf-8?B?MHJmZ3Z3T1JrSTY3Um0xSVNRMkpBei9ud0hoczBPUjBiZ2pUSEoybGZGRys5?=
 =?utf-8?B?K2NsOGZIQmFmLzcreXVWaEhLQ0luTzNlUnl5TWU2Y2RuRWNnVFV3ZUE5SG43?=
 =?utf-8?B?MTNmbWhRZmUyVGF4K3d6RS9nQ1RtRXNZOXJ3K0RidDlocUpYdUwwTTVqSmJk?=
 =?utf-8?B?YmVLOFJpaFE1cFJhM2tRMGZhVlBrM1EwTTJjR2VmNUF3dUFJQ0dwVm9mYnpK?=
 =?utf-8?B?T0FTNTdGWDh1ZzlObWRDWHhYQzVRS3BlUmdoKzlXRmNLOGlxZVB0Tkp6WW8r?=
 =?utf-8?B?UnJOWkVORURsWUZZTU5pY0tKaGpKbzdqMVY5NjdqbnhUOWlLQTZWQXdvb3lu?=
 =?utf-8?B?aVVlMFlhYmxzdnhMTU9LT3RjNGFtMWh2eEsvQ3NORTBhQUowNmJXQXhvd3NR?=
 =?utf-8?B?bXdGc1V6TUdmbHlzMEcyTUlVcGtqTnJqWTNKdXR0am5RYm5RTlBjUmxMMERN?=
 =?utf-8?B?TUpaODd2T0xuQ0NEcHc2RHJWS3NNOWVhak1zeXNvUVhkUW9qY3hpd1Y4cXMy?=
 =?utf-8?B?V3ZPcEQzSytianpIVDk0Qm1SMnJVb2R6Sm4zaE43cWgyUzY1dUsyWHdLQlJ0?=
 =?utf-8?B?UkxISTZ5cnhFMmEvekw3QUNDYkhQN2E2Z1kwaDFLTGRVWlpEWnIra2pGZ0E3?=
 =?utf-8?B?VjBMenFpS1JxTG1YT04xWlpzcUFLVFBBeExxb0JMVEl3ZkRmNmhsMWVoWkx0?=
 =?utf-8?B?Slc1bzBBWU1yZFlhakQ1Qlp6UHhZdGNjT1B1b3J6S0NDVGdsRjZaUDkwSDJR?=
 =?utf-8?B?R3FXSk5FNnZGKy9VQTVsZGNsVFpRaUVjbGhlbXFiczJvL3kxSVJ3UnhXT21F?=
 =?utf-8?B?a3V4K0FKWHRhSzJXZEtvaWZRbFlNZTB1Qi9oeU9oeTBRZ2tONmZXY1JJeW9I?=
 =?utf-8?B?cENjdVJlMGhBU3Nwc0ZNQVFuYUZMTkVCbklJdGE1UTQ0MUExT0FQa09lK1hM?=
 =?utf-8?B?dk5NNTNPRFhSRzc5T0dhOEdBaHRCeG8zb2JsdzhoT1RFTkFsY3lWazlhU1cy?=
 =?utf-8?B?bTZBK1RlUUJKT3R4RGdjSjVrYnMyTVJqOG9rcGZESnBSYjA5d2MvcS9abmI4?=
 =?utf-8?B?d2tKZURqYnZnbjFicmV3MGsyVGNDTU1WM2JCb0dkMkNRUDdDanhtSXJCWTFw?=
 =?utf-8?B?bDJUNEtlMVRzWlVIaEZRbko2dGR1Rm9KU3pZTlRxNTZjTkxIQ3NHZmhtdzRo?=
 =?utf-8?B?a2pCVWV3bVFzdFB6TmpCZjZhSGRCY21EVFRaVTNFZG94VDRVR0lzZWF3YU9o?=
 =?utf-8?B?SzBxWWlUUE41WlQvMktuKzFrTVhyQTU2cFVQNHpaeXhlaWt6Wk5PZ08wc2hV?=
 =?utf-8?B?VmxqYkRkWkRHWklsSzcxWXVmeG9rNzlpdjR0VUY5TUY4QVMxcFpXWTFDZXRp?=
 =?utf-8?B?UUx0Y09MUmhQZ1NUMi9rZ3lXM2ZOem5hL1Y2enQzVFZHSjA5RWJwbVBzdytO?=
 =?utf-8?B?Tkw0dzVPTEhyMFJBbmJBeTMxc043NCtuU2FtNml2L0ZHRHhHYVNzanhtckk5?=
 =?utf-8?B?eUVLMTB4WEp4NHB2TDcxaHV4Wm5CcngzZk9PUk1pUWFGVVlhMFMzVGNQeTg3?=
 =?utf-8?B?RjBkN1o4cEtIcWoxcm9UaUoxYzhiUXZDT0ZiVVNnSFpad1ZSRVBpVUFvZWJx?=
 =?utf-8?B?TTR2RWU5TzRuQTBpbDBWN0ZEYVhLT3h5NFNCdUVTcTNQZ0lndDZadEhUR3hx?=
 =?utf-8?B?cGs2R3J6cW1iV0FaMHNQelFWVmlKT2FIVkVnQVZWa04vMHMvM2lNMGJMVjg4?=
 =?utf-8?B?ek00Sk5JZmNNelJaSFpLMWNFWVAwcHlBUklWcGlGdE1qN3pYNFIzTExTbmJv?=
 =?utf-8?B?N2w3bkpUWnVBZGhMM0RLSi8vblpReTk2dE4wcUFrUURhRVROdUNLa24zaXpj?=
 =?utf-8?B?aXZYU3RMZVVEVjh0ZmNhSC8xNXZFK2wzeGt4VFBsUnVYL0VDWGhDbUZRTTI2?=
 =?utf-8?B?WmloN2s4WXR5V25PMHEwUjBGazgrMDJEbnFXS0Y3SzFkSytNeEhVN0l2RWJh?=
 =?utf-8?B?aDBqekJ5cWROOUNTcG5rR0xxelVwaXlCOFY5dnBRSlZjMmo1QVJWYzVLZCtS?=
 =?utf-8?B?dGNZNVJjM0NjSHlGRUM5dFRScEFkbThLMVN0ZHZ4dTU0UW5TaGd1SjJNZXZL?=
 =?utf-8?B?UGxOUEVGS3lGMnNlN01NMGl6ODN1ZE5yTTBiZ2NIQkJiTVB4dzRLNlhGbWlY?=
 =?utf-8?B?QzVuWXpOSGRXZ2tvTk9HckJXVzB4L082blhUT29Vait2SVBNL1F6dldxK2ZP?=
 =?utf-8?B?dTk1Y0dxUWRrMnpDN25vdGx1SnRsNUdrcG15QU9WeW5zSS8zWmVta2FaY1VF?=
 =?utf-8?Q?s2yjvAMFsFH+R984+cZ9Suqp+JOU53PNEQiVhIckMXh9S?=
x-ms-exchange-antispam-messagedata-1: MIJOCjoSriJEIi4i82Uxx6xdN3jl9YvotFE=
Content-Type: text/plain; charset="utf-8"
Content-ID: <500E0593B4C47A40BBF3249654D67289@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: V+t9rLxK9M8+cli4t9OTwqU+jAF9ZZSBI0kEF336kVAVy1RV8ESUJxtZq59PMfOJQvxtH19dcHO2oJIFvgkgbOPG79t6nGQ4F2IY+ZDegbvjEWLdPsrtjshpvIbrObDXaimVVuCVOpPpengTfVwX+tzjDUN3lpEeaUlhvwjuKGijJhUiPHrUOWNJJVm+oyhjgjSzPo3jIp2SqpwlsW3ng9whrRvWN7bgNRpO1EAWNWo3ZYk8fU8MZ/0Phr51sk6313veJGrraSysHTkYZTMhyZg5nhQvmV1XDjGENodQFQrarY3CyTjVuGoobacKVwGyKL2e30monac2cNkvN9cO8w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb4368e1-8c86-4721-e799-08defcf581c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2026 06:54:10.7053 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fETR98SzDWSA5TT6im5y3Wn6BRy30qJ/QG9yQXl1HlmeukvwwuY28yM5gnTMn8wKNKxxkH4Gar37Lr06e4zXu/pWX74clALe0ykWgVLtmU0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7000
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

T24gTW9uLCAyMDI2LTA4LTE3IGF0IDEzOjE5ICswMzAwLCBKYW5pIE5pa3VsYSB3cm90ZToNCj4g
T24gTW9uLCAxNyBBdWcgMjAyNiwgVmlub2QgR292aW5kYXBpbGxhaQ0KPiA8dmlub2QuZ292aW5k
YXBpbGxhaUBpbnRlbC5jb20+IHdyb3RlOg0KPiA+IEFkZCBhIHByb3Zpc2lvbiB0byBxdWVyeSB0
aGUgb3B0aW9uYWwgcG1lX2NhcGFiaWxpdHkgdG8gdGhlIHBhcmVudA0KPiA+IGludGVyZmFjZSBz
byB0aGF0IGl0IGNvdWxkIGJlIGNhbGxlZCBpbmRlcGVuZGVudGx5IGZyb20geGUgb3IgaTkxNQ0K
PiA+IGJhc2VkIG9uIHRoZSBpbXBsZW1lbnRhdGlvbi4NCj4gDQo+IEJ1dCBkbyB3ZSBuZWVkIHRo
aXM/IERpc3BsYXkgaGFzIGFsbCB0aGUgaW5mb3JtYXRpb24gdG8gY2FsbA0KPiBwY2lfZGV2X3J1
bl93YWtlKCkgZGlyZWN0bHksIHdpdGhvdXQgZ29pbmcgdGhyb3VnaCB0aGUgcGFyZW50DQo+IGlu
dGVyZmFjZS4NCj4gDQo+IFRoZSBvbmx5IGRpZmZlcmVuY2UgaXMgdGhpcyBpcyBub3QgYmVpbmcg
c2V0IHVwIGZvciBpOTE1Lg0KDQpPay4gWWVhaCBwY2lfZGV2X3J1bl93YWtlKCkgc2hvdWxkIGhh
bmRsZSB0aGlzIHByb3Blcmx5LiBCdXQgYmVjYXVzZQ0KdGhlIHBsYXRmb3JtIHN1cHBvcnQgZm9y
IHRoZSBwbWUgaXMgYWRkZWQgZnJvbSBOVkwsIEkgdGhvdWdodCBvZiB0aGlzDQphcHByb2FjaC4g
DQoNClNvIHlvdSBhcmUgc3VnZ2VzdGluZyBzb21ldGhpbmcgbGlrZSB0aGlzPw0KDQppZiAocGNp
X2Rldl9ydW5fd2FrZSgpKSwgYXZvaWQgc3RhcnQgSFBEIHBvbGxpbmcgZGlyZWN0bHkgaW4gdGhl
IA0KaW50ZWxfZGlzcGxheV9kcml2ZXI6OmludGVsX2Rpc3BsYXlfZHJpdmVyX3BtX3J1bnRpbWVf
c3VzcGVuZCgpPw0KDQpPciB1c2UgYSB3cmFwcGVyIHRvIGNoZWNrIHRoZSBwbWVfY2FwYWJpbGl0
eS4NCg0KQlINClZpbm9kIA0KDQo+IEJSLA0KPiBKYW5pLg0KPiANCj4gPiANCj4gPiBBc3Npc3Rl
ZC1ieTogR2l0SHViX0NvcGlsb3Q6Y2xhdWRlLW9wdXMtNQ0KPiA+IFNpZ25lZC1vZmYtYnk6IFZp
bm9kIEdvdmluZGFwaWxsYWkgPHZpbm9kLmdvdmluZGFwaWxsYWlAaW50ZWwuY29tPg0KPiA+IC0t
LQ0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3JwbS5j
IHwgNyArKysrKysrDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rp
c3BsYXlfcnBtLmggfCAxICsNCj4gPiDCoGluY2x1ZGUvZHJtL2ludGVsL2Rpc3BsYXlfcGFyZW50
X2ludGVyZmFjZS5owqDCoMKgwqAgfCAxICsNCj4gPiDCoDMgZmlsZXMgY2hhbmdlZCwgOSBpbnNl
cnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZGlzcGxheV9ycG0uYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9kaXNwbGF5X3JwbS5jDQo+ID4gaW5kZXggMGEzMzFmODliNGRiLi43M2Q4NTM4
NDQ3NGUgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9kaXNwbGF5X3JwbS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9kaXNwbGF5X3JwbS5jDQo+ID4gQEAgLTQ2LDYgKzQ2LDEzIEBAIGJvb2wgaW50ZWxfZGlz
cGxheV9ycG1fc3VzcGVuZGVkKHN0cnVjdA0KPiA+IGludGVsX2Rpc3BsYXkgKmRpc3BsYXkpDQo+
ID4gwqAJcmV0dXJuIGRpc3BsYXktPnBhcmVudC0+cnBtLT5zdXNwZW5kZWQoZGlzcGxheS0+ZHJt
KTsNCj4gPiDCoH0NCj4gPiDCoA0KPiA+ICtib29sIGludGVsX2Rpc3BsYXlfcnBtX3BtZV9jYXBh
YmxlKHN0cnVjdCBpbnRlbF9kaXNwbGF5ICpkaXNwbGF5KQ0KPiA+ICt7DQo+ID4gKwljb25zdCBz
dHJ1Y3QgaW50ZWxfZGlzcGxheV9ycG1faW50ZXJmYWNlICpycG0gPSBkaXNwbGF5LQ0KPiA+ID5w
YXJlbnQtPnJwbTsNCj4gPiArDQo+ID4gKwlyZXR1cm4gcnBtLT5wbWVfY2FwYWJsZSAmJiBycG0t
PnBtZV9jYXBhYmxlKGRpc3BsYXktPmRybSk7DQo+ID4gK30NCj4gPiArDQo+ID4gwqB2b2lkIGFz
c2VydF9kaXNwbGF5X3JwbV9oZWxkKHN0cnVjdCBpbnRlbF9kaXNwbGF5ICpkaXNwbGF5KQ0KPiA+
IMKgew0KPiA+IMKgCWRpc3BsYXktPnBhcmVudC0+cnBtLT5hc3NlcnRfaGVsZChkaXNwbGF5LT5k
cm0pOw0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2Rpc3BsYXlfcnBtLmgNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
ZGlzcGxheV9ycG0uaA0KPiA+IGluZGV4IDZlZjQ4NTE1Zjg0Yi4uMmQ0MDcxZmI5MjgyIDEwMDY0
NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV9y
cG0uaA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxh
eV9ycG0uaA0KPiA+IEBAIC0yMSw2ICsyMSw3IEBAIHZvaWQgaW50ZWxfZGlzcGxheV9ycG1fcHV0
KHN0cnVjdCBpbnRlbF9kaXNwbGF5DQo+ID4gKmRpc3BsYXksIHN0cnVjdCByZWZfdHJhY2tlciAq
d2ENCj4gPiDCoA0KPiA+IMKgLyogT25seSBmb3Igc3BlY2lhbCBjYXNlcy4gKi8NCj4gPiDCoGJv
b2wgaW50ZWxfZGlzcGxheV9ycG1fc3VzcGVuZGVkKHN0cnVjdCBpbnRlbF9kaXNwbGF5ICpkaXNw
bGF5KTsNCj4gPiArYm9vbCBpbnRlbF9kaXNwbGF5X3JwbV9wbWVfY2FwYWJsZShzdHJ1Y3QgaW50
ZWxfZGlzcGxheSAqZGlzcGxheSk7DQo+ID4gwqANCj4gPiDCoHZvaWQgYXNzZXJ0X2Rpc3BsYXlf
cnBtX2hlbGQoc3RydWN0IGludGVsX2Rpc3BsYXkgKmRpc3BsYXkpOw0KPiA+IMKgdm9pZCBpbnRl
bF9kaXNwbGF5X3JwbV9hc3NlcnRfYmxvY2soc3RydWN0IGludGVsX2Rpc3BsYXkNCj4gPiAqZGlz
cGxheSk7DQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2ludGVsL2Rpc3BsYXlfcGFyZW50
X2ludGVyZmFjZS5oDQo+ID4gYi9pbmNsdWRlL2RybS9pbnRlbC9kaXNwbGF5X3BhcmVudF9pbnRl
cmZhY2UuaA0KPiA+IGluZGV4IGQ3ZDA2ZGNhYTY5OS4uNTYzZGU0MDNiMTAyIDEwMDY0NA0KPiA+
IC0tLSBhL2luY2x1ZGUvZHJtL2ludGVsL2Rpc3BsYXlfcGFyZW50X2ludGVyZmFjZS5oDQo+ID4g
KysrIGIvaW5jbHVkZS9kcm0vaW50ZWwvZGlzcGxheV9wYXJlbnRfaW50ZXJmYWNlLmgNCj4gPiBA
QCAtMTk2LDYgKzE5Niw3IEBAIHN0cnVjdCBpbnRlbF9kaXNwbGF5X3JwbV9pbnRlcmZhY2Ugew0K
PiA+IMKgCXZvaWQgKCpwdXRfdW5jaGVja2VkKShjb25zdCBzdHJ1Y3QgZHJtX2RldmljZSAqZHJt
KTsNCj4gPiDCoA0KPiA+IMKgCWJvb2wgKCpzdXNwZW5kZWQpKGNvbnN0IHN0cnVjdCBkcm1fZGV2
aWNlICpkcm0pOw0KPiA+ICsJYm9vbCAoKnBtZV9jYXBhYmxlKShjb25zdCBzdHJ1Y3QgZHJtX2Rl
dmljZSAqZHJtKTsgLyoNCj4gPiBPcHRpb25hbCAqLw0KPiA+IMKgCXZvaWQgKCphc3NlcnRfaGVs
ZCkoY29uc3Qgc3RydWN0IGRybV9kZXZpY2UgKmRybSk7DQo+ID4gwqAJdm9pZCAoKmFzc2VydF9i
bG9jaykoY29uc3Qgc3RydWN0IGRybV9kZXZpY2UgKmRybSk7DQo+ID4gwqAJdm9pZCAoKmFzc2Vy
dF91bmJsb2NrKShjb25zdCBzdHJ1Y3QgZHJtX2RldmljZSAqZHJtKTsNCj4gDQoNCg==
