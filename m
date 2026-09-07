Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65EACC79F9E
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 12:04:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C3510E7C2;
	Mon,  7 Sep 2026 12:04:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V5q97NvA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC2FB10E7C2
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 12:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788782693; x=1820318693;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tNnl2QxiLgze3iDbz6G3AqWOnIBSn8tN83QD3QBBQRE=;
 b=V5q97NvABeAXOqDrhvavmFPsaU+nlGrK40IbGvGP1i1SUnVx8VsPAiVy
 eMtQxIJHXu5E/Byr7f55TIWSZ2dtcwy4EPCkK0l3wFuL+y31KPXSi7N6e
 cSSPh6gnUhecw/YpZj2GyhV9FSxR1SZa7BSycjLnI+PgvFawDBr1ydk74
 SDaUdmd3hVqCxpnMrIdjKFhpeq50JPgdfPd1Phd+BiQD09Wl+IROwgzeh
 Y6mPjTwVgdjxKDcq0P2oWpfQ3ZJ+tKdbRX56tOIgidxv2/NA5l85knk7c
 PRkSLLQ/rCjeYTTk+bPvV/hW/Tm/w84OE4daNWBT/1YDS4yiI7UOxDVs6 A==;
X-CSE-ConnectionGUID: 1qdl9ziuRDCMjX0677S+yg==
X-CSE-MsgGUID: lm8nAVLmSZm2XE7aYB8JBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="92886099"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="92886099"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 05:04:51 -0700
X-CSE-ConnectionGUID: Io7kRvtOS/OMl28pSjbYNA==
X-CSE-MsgGUID: fxlK9+XoSHKw7jEOJ0/pNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="274843210"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 05:04:51 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 05:04:50 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 05:04:50 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.57) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 05:04:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iKETPI5dkRkHJuhM2JBWfEqdXTs8UdwLqVgyM72W3LKqK4lSJ8bnLU7cu8eQSWQBuh8hqLrIu9SndduPnoFY9wC5nBnNXmjf+1sfDeKejAHJEfU5T+IdzEv2s5nzf7plI8pEqXMKZ6vvBagtzpXMA6IXyitjNxpuA3//dzVhX1uqo4ojLI7i8+psEdf8PxpiQOnQH3opbSSuZm4EIq10eeCcFOzYJHQuCbOb353wqdly/lnclT0N9DMlKKqxG4GJMU/FChH1I+JIZRrDa5KHiQWRCAnVtha7uJC4ftz5scNX8/6691TGRkkvgSOhnntKfG26CNEQAazYNAUYEvFE2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tNnl2QxiLgze3iDbz6G3AqWOnIBSn8tN83QD3QBBQRE=;
 b=GTPJ6S52uajcCd6u75GG6BInyXLgP24rmEZv57gdFV9Ntp9WnHHqqhW1RcsRORXukIUx6ecWaCn7C6hZyW5LHfE4AhjHaVbD8gO3erJHtL81yZoO3XdyivWCnrzG5eI8CB122OQhzdcv80srSXESUKDQN149BUUFfp813pDJ/AFp2qo8jLo6FvVWDZONtb9r+IC8X0uH1EFvNMSsmEUyN4dykmSQILrAY0TAKPHqThs2uNph6lcpcmIMc6W2Z7IWBQnJHOBJR3hJQXjBCPWQPstBnrA6XIKZ7e5Jf1Hu2tiwgIh0K7cO7Fqaalsc4AedO/ZPpqcRVgy74OomzARF1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5242.namprd11.prod.outlook.com (2603:10b6:408:133::18)
 by DSVPR11MB9892.namprd11.prod.outlook.com (2603:10b6:8:45c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 12:04:47 +0000
Received: from BN9PR11MB5242.namprd11.prod.outlook.com
 ([fe80::5657:45bf:d335:24d5]) by BN9PR11MB5242.namprd11.prod.outlook.com
 ([fe80::5657:45bf:d335:24d5%5]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 12:04:47 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Wajdeczko, Michal" <michal.wajdeczko@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "Jadav, Raag" <raag.jadav@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>, "Koujalagi, Mallesh" <mallesh.koujalagi@intel.com>,
 "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>,
 "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH 2/2] drm/xe/cri: Expose device UUID through sysfs
Thread-Topic: [PATCH 2/2] drm/xe/cri: Expose device UUID through sysfs
Thread-Index: AQHdPIT7NfP7k0uM+0qpL/qfAPOz3La+nkaAgAQ7FACAAC0qgIAAAanw
Date: Mon, 7 Sep 2026 12:04:47 +0000
Message-ID: <BN9PR11MB5242477CE55973FF7BD0720A95B22@BN9PR11MB5242.namprd11.prod.outlook.com>
References: <20260904160608.2004174-4-badal.nilawar@intel.com>
 <20260904160608.2004174-6-badal.nilawar@intel.com>
 <65b77b6b-a21f-4631-9cb3-a5c0e07645c5@intel.com>
 <5ac64235-025a-48c9-ac18-893fcfd6db6a@intel.com>
 <01acf34a-3231-45c7-b8ce-e70ead34a44d@intel.com>
In-Reply-To: <01acf34a-3231-45c7-b8ce-e70ead34a44d@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5242:EE_|DSVPR11MB9892:EE_
x-ms-office365-filtering-correlation-id: d979d204-b3e1-4b67-c34b-08df0cd83659
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|10067099003|4143699003|6133799003|56012099006|11063799006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: fGjOtWVr04PchcRiCtqFdK7C/4IF200wok40/blPwwtk4D0CMpCHdtaROfK+KE0ndvIZw5V8G4Cx41Ck3LZmWLIExD/kDFYKUwpFysZeTlaJEgPzBzr3AbqU1O27VjxV06Kl4hN2nT0xXkCWRrkkziAjjwLQeQozsZzm6TbxpD8+VwIQTfFxjYJkS1BwU4bmZ7vKpophlalfvcCoQ2DRuW+oEsA6nOZQRbMNNisAWXfm/2FoszLRxJG9/RHsnDenqEZmcR0a7yvnb5Qdis/AI5zlprutXc/0e4Q2rNQ7vMDreQvuFqc+akPCoPSZ4jyRbikgvnGYjojpYaccSLP9QLs6j4t4DGhrsMFxva9E0BX8o9wHn05FM2Ku7nC5qrVE5Ky3GR+ujDAXdb8ju+uAf/hvwmZgYKd6yL/M803tllpc/99j2M3rvrNzA/bTLD9X7x6aV8YKS5fMNq18QxkCtyKLsIX0T+JP27h3G3jmhXWCoouOwYPFOIcuz4dkGW8m1s7wuTaafAZN590wFQM2YAwouHLrAPduxLIj/rmurgAZUUp/q2tnWGNPFFurVHg3n1s0pxGSXqRgGJIibjh6NuSEE8Zqx0zr3WiQAnmv0KpEH9aMkzRQUgHE+g9gP4R5XrYRs1s532e/Ugh1eJxbzFm7MboFvFPvOxwhuJNl3QNCRMY9xReTXAYha2D5KR1ptYI0WtT1dRQx75ek9ADHhzeaG+iojBC5HQu9E7pYk1E=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5242.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(4143699003)(6133799003)(56012099006)(11063799006)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MEQ2dDIvYkZ2NStCaERCbTJEcG1JVU5LY3FzYzJtck9LcUVlVEUvRUFWdjNx?=
 =?utf-8?B?NDJFVXg3VHJZd1M4OUh1YkRtcldEb1VselVNdC9wb3l2b0Z0eUZoYUhlbmZZ?=
 =?utf-8?B?MnRaL1R0RmRVdzV2U1p4OTAxa2ppUi9ROUtBcVhYYUdmRlVCVjJwZXpjb1RF?=
 =?utf-8?B?YnA5MDRhUHV4aEFKVWo4dVVVRmRhSTBpK2FCaHFRWEtYdzRHenN6SHNUOWZs?=
 =?utf-8?B?NFZaZm1JVTlnY1A4UmFTb2tUM1RRWlZNY0tMY3VXYjJzaTcwUkJSUC9ZWEox?=
 =?utf-8?B?UGxnREZ1QzFEdUwrV1k2WmFmQzE3c0tQenpkVVNvQmJwRGF6Q1BIQ3hTK1Q4?=
 =?utf-8?B?c0ZoVmQydGhFMzAyamQwQWRSbG5HeG9BamNWbk5MTDNpZGdnNEtMR1lWRTAr?=
 =?utf-8?B?OEYwSHorcGpmQUg3M250b0F0a2dCZGY0QlpDUUlJb1N2dUYvbmhaWmxmclgz?=
 =?utf-8?B?SXlnbU9DTFRRWktRVmp6Z2hwUHN6dk9aaGZzb2VlWGl4TENvZFRRUW5ZVllr?=
 =?utf-8?B?bGhVaGRkRUlrWmFNaE1mUWNYQXVlOXd2N1BqU2RBd291N2NiZkZCY1FxcXFB?=
 =?utf-8?B?RlhNNVdwNlJ5UzJLZUpnaVo1Smd3d1Q4V1NjWWdYUmk3dlhFeFJyWG9DYXI0?=
 =?utf-8?B?cDhIWEFlUGdHeHJWdkwxRUlVbGdMYldWQWJuZ3NoWFQzcnRuR1NYYWVjZG1Z?=
 =?utf-8?B?TjFZbnEvYXlxV0thY2ZUVndHbThHNXpybFkrTnhLTG9Zbi9sOWpVUWEyclZy?=
 =?utf-8?B?cVFhRTNGTzNaMmZNZnhHTGY2ZGpYaHJxOFlXYlVMZjNPQ2JsK0FPS0liTXJp?=
 =?utf-8?B?dFNSc1VoQU5meEJMalFZd0NsWGNOeEM5cFJQVGNYSlFxZmJrUFhkdkNBV3d5?=
 =?utf-8?B?YndoazBsU0swY1BlVE5SUmsxWkRoTEVYcXBhL2QxVmZ6dnp0QWhQTkhxcm5K?=
 =?utf-8?B?MndyQXJCRC9NdnpwWEpreW03SGhnK2ErbnFkZEplMktVUFAvdld4VjdQRDZI?=
 =?utf-8?B?bTBLczNneUo5U0JHREphdGI0VjcwUHQ1cTIraUtqZkVWQXJGbitFNGxJVTgr?=
 =?utf-8?B?QjZUMVpzRnFTTFJ0TXBWN3phRTIwWTJGalE2UmRSZ3Rob1liZ2xxaEpCQzN0?=
 =?utf-8?B?Z2pYV2tXMzJGNE91YllOeXluU2lzZEZPMCtWM3IwQytVbndtVjREd3VsOXdi?=
 =?utf-8?B?bTB2VjZTdThWTG16R1ppblRUQUgxMEtKbXJHUkRFUTFhMUpZa0RyZlFqQkph?=
 =?utf-8?B?N1M3ZHNXZU9wSXFFa1dKc1FVa2pqOW8vaEsybjFIb0NUL2I2Vjd0UDdBQXo3?=
 =?utf-8?B?ZjFFZ0tBZllvdkx2Qzk3bTNTcEFzMzJ1d1hMT3pnT3pRTld5TlBnTDMyeHFi?=
 =?utf-8?B?ZGUzOWl1MS93NXNtTGNpRnRYemJYcVVkNUFXTE1La1lHaWQzNHpFbFRRR3g1?=
 =?utf-8?B?c2lJU1ZBRVcvN0VnOC83THFiTjRlL3c5K3RPelYxcUpzemFoV3NIOENNQkht?=
 =?utf-8?B?WXZja1FEQ3I5RVpGOHRQVUpyL2t5cklZczVIb05BS3NBRkdJdEphZ0JxaTU0?=
 =?utf-8?B?S2srQ3RnTXVtNmhGMHFCUUFFWjY4bWFqVXJYbmdBTmptb1NZUHRGSFZTNGI0?=
 =?utf-8?B?dTR0ZW9SdkFTVzlERW50MCtKMHNnUTg0c2hjTFVhcGpiWkJNa05ocTRHUSsx?=
 =?utf-8?B?citteDNwbFdwdTlYUjh2UklyN1ppdUZibDliQzVrbGtRTGk3bnVDREtqVXJY?=
 =?utf-8?B?RS82dUc4cjNiMzZpQ2Q2aHA4a1pRMXJkYVB4V1pzVTJFNllGNE55TkVweHFl?=
 =?utf-8?B?NnFWYjM2V2x1MUVnQ2Y4Nko3b042elUvejQ5eVZYdDVZbUVEcndSOWZobUcx?=
 =?utf-8?B?QmFzam0vWWdZQkZyRWtxSVpRWnp2UE0yQmk1NHdMTnowTmU5NElnYVd3YnVM?=
 =?utf-8?B?OHhOSlNNazZhVjNCMVFwcGhyODdwZkpndmgyQ3R2dTRjWWZQOG43U0FWcVZZ?=
 =?utf-8?B?elo3V2V0M2kxWENYVlN5UUVTdysyOUM0a3g4ampIeTZpVGUybHRQMGduT1I2?=
 =?utf-8?B?eWF6RWtGYmp5ODhRMkVtdzhZYko3NHVJQkw2ZGJUbDBpQkc4VitKSEdjNDFD?=
 =?utf-8?B?djJZUkV2L1psWW1EcXhoUGI5LzFCOFdQdi8ySHo5a0FWZE9uRUwvVnB6UXdn?=
 =?utf-8?B?ZFptQjlSSFA3dzNyNFBqVWg1QmQ4bjdKVUpqUVczQUxhL1cvMWR4RERsR0Mv?=
 =?utf-8?B?emxXcGRkQS9oenRORE40TFd2ejZYZXdkT2hCbGZjY0kzZk1qdUhmcjEvVjVW?=
 =?utf-8?B?YTBLNDJyc3pieUplZ1VKUmVjL2tWbGJIdHhPSmRNeWRYOWVBT1BLUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Gw6la0ctOtYFjR5av61CRgVmO34Ed4TmQbfvJKijQEhpcFMTCEVtnikvBL6Qln5jaDiAnnZ0Z+qvMzLWQiqOcfOXMo+cs9sAuF6UFE4d0D2j6N56CEfaagw7Vurr3wkrxTaRY/nNv0Ku70aO3BL+UrojSx2IU/DXvPhgkJlJ8/K7KvFNKY38ZalSioxqE8nkwDJNBiNq4/5rRfj8WP0iBLL0S0ajZvtvEWiF18W1LPG7WSbGmLVpIRGExFSu1Bv+UL8+jDFuC3Lcl8Suq3hJivbB45wYPgNM8edpQ05/xeqt6ZJBJCrSz7DqNQqdwKMBvifou1takKFTJwRGOtaMMQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5242.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d979d204-b3e1-4b67-c34b-08df0cd83659
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2026 12:04:47.3642 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uBtKRUwXH3CZtpTlm/PEqzLy4ovevsWl1bXjL14fS7vOZW54PE8vUPYSU1TsteXEzH6FKQyXdUxWQgcXvT5fX3UtWgAcIdhEaDNCicyZMHE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9892
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogV2FqZGVjemtvLCBNaWNo
YWwgPG1pY2hhbC53YWpkZWN6a29AaW50ZWwuY29tPg0KPiBTZW50OiBNb25kYXksIFNlcHRlbWJl
ciA3LCAyMDI2IDU6MjUgUE0NCj4gVG86IE5pbGF3YXIsIEJhZGFsIDxiYWRhbC5uaWxhd2FyQGlu
dGVsLmNvbT47IGludGVsLQ0KPiB4ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFZpdmksIFJvZHJp
Z28gPHJvZHJpZ28udml2aUBpbnRlbC5jb20+DQo+IENjOiBHdXB0YSwgQW5zaHVtYW4gPGFuc2h1
bWFuLmd1cHRhQGludGVsLmNvbT47IEphZGF2LCBSYWFnDQo+IDxyYWFnLmphZGF2QGludGVsLmNv
bT47IFRhdXJvLCBSaWFuYSA8cmlhbmEudGF1cm9AaW50ZWwuY29tPjsgS291amFsYWdpLA0KPiBN
YWxsZXNoIDxtYWxsZXNoLmtvdWphbGFnaUBpbnRlbC5jb20+OyBJZGRhbXNldHR5LCBBcmF2aW5k
DQo+IDxhcmF2aW5kLmlkZGFtc2V0dHlAaW50ZWwuY29tPjsgaGVpa2tpLmtyb2dlcnVzQGxpbnV4
LmludGVsLmNvbTsNCj4gR2hpbWlyYXksIEhpbWFsIFByYXNhZCA8aGltYWwucHJhc2FkLmdoaW1p
cmF5QGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAyLzJdIGRybS94ZS9jcmk6IEV4
cG9zZSBkZXZpY2UgVVVJRCB0aHJvdWdoIHN5c2ZzDQo+IA0KPiANCj4gDQo+IE9uIDkvNy8yMDI2
IDExOjEzIEFNLCBOaWxhd2FyLCBCYWRhbCB3cm90ZToNCj4gPg0KPiA+IE9uIDA0LTA5LTIwMjYg
MjI6MDcsIE1pY2hhbCBXYWpkZWN6a28gd3JvdGU6DQo+ID4+DQo+ID4+IE9uIDkvNC8yMDI2IDY6
MDYgUE0sIEJhZGFsIE5pbGF3YXIgd3JvdGU6DQo+ID4+PiBFeHBvc2UgYSByZWFkLW9ubHkgc3lz
ZnMgYXR0cmlidXRlLCBkZXZpY2VfdXVpZCwgdGhhdCByZXBvcnRzIHRoZQ0KPiA+Pj4gR1BVJ3Mg
dW5pcXVlIGhhcmR3YXJlIGlkZW50aWZpZXIuDQo+ID4+Pg0KPiA+PiBCc3BlYzogNTMwNDgsNTMw
NDkNCj4gPiBTdXJlDQo+ID4+DQo+ID4+PiBBc3Npc3RlZC1ieTogQ2xhdWRlOmNsYXVkZS1vcHVz
LTQuOA0KPiA+Pj4gU2lnbmVkLW9mZi1ieTogQmFkYWwgTmlsYXdhciA8YmFkYWwubmlsYXdhckBp
bnRlbC5jb20+DQo+ID4+PiAtLS0NCj4gPj4+IMKgIC4uLi9BQkkvdGVzdGluZy9zeXNmcy1kcml2
ZXItaW50ZWwteGUtZ3B1wqDCoMKgwqAgfCAxMCArKysrKysNCj4gPj4+IMKgIGRyaXZlcnMvZ3B1
L2RybS94ZS9yZWdzL3hlX3JlZ3MuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArKw0K
PiA+Pj4gwqAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoCAzICsrDQo+ID4+PiDCoCBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2
aWNlX3N5c2ZzLmPCoMKgwqDCoMKgwqDCoMKgwqAgfCAzNg0KPiA+Pj4gKysrKysrKysrKysrKysr
KysrKw0KPiA+Pj4gwqAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5owqDCoMKg
wqDCoMKgwqDCoMKgIHzCoCAzICsrDQo+ID4+PiDCoCA1IGZpbGVzIGNoYW5nZWQsIDU0IGluc2Vy
dGlvbnMoKykNCj4gPj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+Pj4gRG9jdW1lbnRhdGlv
bi9BQkkvdGVzdGluZy9zeXNmcy1kcml2ZXItaW50ZWwteGUtZ3B1DQo+ID4+Pg0KPiA+Pj4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtZHJpdmVyLWludGVsLXhl
LWdwdQ0KPiA+Pj4gYi9Eb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWRyaXZlci1pbnRl
bC14ZS1ncHUNCj4gPj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4+PiBpbmRleCAwMDAwMDAw
MDAwMDAuLjFhNGJkZmJhZDhkNw0KPiA+Pj4gLS0tIC9kZXYvbnVsbA0KPiA+Pj4gKysrIGIvRG9j
dW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1kcml2ZXItaW50ZWwteGUtZ3B1DQo+ID4+PiBA
QCAtMCwwICsxLDEwIEBADQo+ID4+PiArV2hhdDrCoMKgwqDCoMKgwqDCoCAvc3lzL2J1cy9wY2kv
ZHJpdmVycy94ZS8uLi4vZGV2aWNlX3V1aWQNCj4gPj4+ICtEYXRlOsKgwqDCoMKgwqDCoMKgIFNl
cHRlbWJlciAyMDI2DQo+ID4+PiArS2VybmVsVmVyc2lvbjrCoMKgwqAgNy40DQo+ID4+PiArQ29u
dGFjdDrCoMKgwqAgaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4+PiArRGVzY3Jp
cHRpb246wqDCoMKgIFJPLiBVbmlxdWUgNjQtYml0IGlkZW50aWZpZXIgb2YgdGhlIGRldmljZQ0K
PiA+Pj4gK2luc3RhbmNlLCByZWFkIGZyb20NCj4gPj4+ICvCoMKgwqDCoMKgwqDCoCB0aGUgZGV2
aWNlJ3MgQ1JJX0RFVklDRV9VVUlEIHJlZ2lzdGVyIGFuZCBwcmludGVkIGFzIGENCj4gPj4gaG1t
LCBtYXliZSBpbiB0aGUgdXNlciBmYWNpbmcgZG9jdW1lbnRhdGlvbiB3ZSBzaG91bGQgcmVmZXIg
dG8gdGhpcw0KPiA+PiByZWdpc3RlciBhcw0KPiA+Pg0KPiA+PiDCoMKgwqDCoERFVklDRV9VVUlE
KDEwMjAwOCkNCj4gPj4NCj4gPj4gaW5zdGVhZCBvZiB0aGUgbWVhbmluZ2xlc3MgbWFjcm8gbmFt
ZT8NCj4gPiBJIHdpbGwgZHJvcCAicmVhZCBmcm9tIC4uLiIgc3RhdGVtZW50Lg0KPiA+Pg0KPiA+
Pj4gK8KgwqDCoMKgwqDCoMKgIHplcm8tcGFkZGVkIDE2LWRpZ2l0IGhleGFkZWNpbWFsIHN0cmlu
Zy4NCj4gPj4gaWYgdGhpcyBpcyBVVUlELCBzaG91bGRuJ3Qgd2UgcHJpbnQgaXQgaW4gVVVJRCBm
b3JtYXQ/IHNlZSAlcFUNCj4gPiBJIHRoaXMgaXMgbm90IFVVSUQsIGkgd2lsbCByZW5hbWUgdGhl
IG5vZGUgYXMgZGV2aWNlX3VpZC4NCj4gPj4NCj4gPj4+ICsNCj4gPj4+ICvCoMKgwqDCoMKgwqDC
oCBUaGlzIHN5c2ZzIGZpbGUgaXMgcHJlc2VudCBvbmx5IG9uIEludGVsIFhlIHBsYXRmb3JtcyB0
aGF0DQo+ID4+PiArwqDCoMKgwqDCoMKgwqAgcHJvdmlkZSBhIGRldmljZSBVVUlELiBJdCBpcyBh
dmFpbGFibGUgdG8gYWxsIHVzZXJzLg0KPiA+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS9yZWdzL3hlX3JlZ3MuaA0KPiA+Pj4gYi9kcml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9y
ZWdzLmgNCj4gPj4+IGluZGV4IGVmNDc0NmI3YjVkMy4uNjgyMjZmZTBiNjU5IDEwMDY0NA0KPiA+
Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3JlZ3MveGVfcmVncy5oDQo+ID4+PiArKysgYi9k
cml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9yZWdzLmgNCj4gPj4+IEBAIC0zMCw2ICszMCw4IEBA
DQo+ID4+PiDCoCAjZGVmaW5lIFhFSFBfTVRDRkdfQUREUsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBYRV9SRUcoMHgxMDE4MDApDQo+ID4+PiDCoCAjZGVmaW5lwqDCoCBUSUxFX0NPVU5U
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFJFR19HRU5NQVNLKDE1LCA4KQ0KPiA+Pj4g
wqAgKyNkZWZpbmUgQ1JJX0RFVklDRV9VVUlEwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IFhFX1JFRygweDEwMjAwOCkNCj4gPj4+ICsNCj4gPj4+IMKgICNkZWZpbmUgR0dDwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgWEVfUkVHKDB4MTA4MDQwKQ0KPiA+Pj4gwqAg
I2RlZmluZcKgwqAgR01TX01BU0vCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgUkVHX0dF
Tk1BU0soMTUsIDgpDQo+ID4+PiDCoCAjZGVmaW5lwqDCoCBHR01TX01BU0vCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgUkVHX0dFTk1BU0soNywgNikgZGlmZiAtLWdpdA0KPiA+Pj4gYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2
aWNlLmMNCj4gPj4+IGluZGV4IDg1ODNiMmU5ZWNmNC4uZThkYjg4NzE5OTBiIDEwMDY0NA0KPiA+
Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jDQo+ID4+PiArKysgYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmMNCj4gPj4+IEBAIC04MDEsNiArODAxLDkgQEAgaW50
IHhlX2RldmljZV9wcm9iZV9lYXJseShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4gPj4+IMKgwqDC
oMKgwqAgaWYgKElTX1NSSU9WX1ZGKHhlKSkNCj4gPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB2Zl91
cGRhdGVfZGV2aWNlX2luZm8oeGUpOw0KPiA+Pj4gwqAgK8KgwqDCoCBpZiAoeGUtPmluZm8ucGxh
dGZvcm0gPT0gWEVfQ1JFU0NFTlRJU0xBTkQpDQo+ID4+PiArwqDCoMKgwqDCoMKgwqAgeGUtPmRl
dmljZV91dWlkID0NCj4gPj4+ICt4ZV9tbWlvX3JlYWQ2NF8yeDMyKHhlX3Jvb3RfdGlsZV9tbWlv
KHhlKSwgQ1JJX0RFVklDRV9VVUlEKTsNCj4gPj4+ICsNCj4gPj4+IMKgwqDCoMKgwqAgLyoNCj4g
Pj4+IMKgwqDCoMKgwqDCoCAqIENoZWNrIGZvciBwY29kZSB1bmNvcmVfaW5pdCBzdGF0dXMgdG8g
Y29uZmlybSBpZiB0aGUgU29DDQo+ID4+PiDCoMKgwqDCoMKgwqAgKiBpbml0aWFsaXphdGlvbiBp
cyBjb21wbGV0ZS4gVW50aWwgZG9uZSwgYW55IE1NSU8gb3IgbG1lbQ0KPiA+Pj4gYWNjZXNzIGZy
b20gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2Vfc3lzZnMuYw0KPiA+
Pj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3N5c2ZzLmMNCj4gPj4+IGluZGV4IGE3
M2UwZTk1N2NiMC4uYTRkMzI2MTU5ZGNlIDEwMDY0NA0KPiA+Pj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2RldmljZV9zeXNmcy5jDQo+ID4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZGV2aWNlX3N5c2ZzLmMNCj4gPj4+IEBAIC04LDYgKzgsNyBAQA0KPiA+Pj4gwqAgI2luY2x1
ZGUgPGxpbnV4L3BjaS5oPg0KPiA+Pj4gwqAgI2luY2x1ZGUgPGxpbnV4L3N5c2ZzLmg+DQo+ID4+
PiDCoCArI2luY2x1ZGUgInJlZ3MveGVfcmVncy5oIg0KPiA+Pj4gwqAgI2luY2x1ZGUgInhlX2Rl
dmljZS5oIg0KPiA+Pj4gwqAgI2luY2x1ZGUgInhlX2RldmljZV9zeXNmcy5oIg0KPiA+Pj4gwqAg
I2luY2x1ZGUgInhlX21taW8uaCINCj4gPj4+IEBAIC0yNjQsNiArMjY1LDM1IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgYXR0cmlidXRlX2dyb3VwDQo+ID4+PiBhdXRvX2xpbmtfZG93bmdyYWRlX2F0
dHJfZ3JvdXAgPSB7DQo+ID4+PiDCoMKgwqDCoMKgIC5hdHRycyA9IGF1dG9fbGlua19kb3duZ3Jh
ZGVfYXR0cnMsDQo+ID4+PiDCoCB9Ow0KPiA+Pj4gwqAgKy8qKg0KPiA+Pj4gKyAqIERPQzogZGV2
aWNlX3V1aWQNCj4gPj4gZG8gd2UgbmVlZCB0aGlzPw0KPiA+PiB5b3UgYWxyZWFkeSBkZXNjcmli
ZWQgdGhhdCBpbiBEb2N1bWVudGF0aW9uL0FCSQ0KPiA+IEkgdGhpbmsgSSB3aWxsIGRyb3AgdGhl
IERvY3VtZW50YXRpb24vQUJJIGFuZCBrZWVwIERPQzogc2VjdGlvbi4NCj4gDQo+IGhtbSwgYnV0
IGFsbCBvdGhlciBzeXNmcyBlbnRyaWVzIGFyZSBkZWZpbmVkIGluIERvY3VtZW50YXRpb24vQUJJ
ICh3aGljaA0KPiBJTU8gaXMgdGhlIGNvcnJlY3QgcGxhY2UsIG5vdCBhIGxvY2FsIERPQyBzZWN0
aW9uKQ0KSXMgdGhlcmUgYSB3YXkgdG8gbGluayB0aGUgRG9jdW1lbnRhdGlvbi9BQkkgZG9jIHdp
dGggZHJtL1hlIERvYywgIGluIGNhc2UgbG9jYWwgZG9jIGlzIG5vdCBwcmVmZXJyZWQuDQpodHRw
czovL2RvY3Mua2VybmVsLm9yZy9ncHUveGUvaW5kZXguaHRtbCANCkFzIHRoaXMgaXMgWGUgc3Bl
Y2lmaWMgc3lzZnMgLCBBRkFJVSB0aGVyZSBzaG91bGQgYmUgc29tZSB3YXkgZnJvbSBYZSBLZXJu
ZWwgRG9jIHRvIHJlZmVyIHRoaXMgc3lzZnMgPw0KVGhhbmtzLA0KQW5zaHVtYW4NCj4gDQo+IA0K
PiA+Pg0KPiA+Pj4gKyAqDQo+ID4+PiArICogRWFjaCBYZSBkZXZpY2UgZXhwb3NlcyBhIDY0LWJp
dCBVVUlEIHRoYXQgdW5pcXVlbHkgaWRlbnRpZmllcyB0aGUgU29DLg0KPiA+Pj4gKyAqIFRoZSB2
YWx1ZSBpcyByZWFkIGZyb20gdGhlIENSSV9ERVZJQ0VfVVVJRCByZWdpc3RlciBhbmQgY2FuIGJl
DQo+ID4+PiArICogcmVhZCBiYWNrIHRocm91Z2ggdGhlIGBgZGV2aWNlX3V1aWRgYCBzeXNmcyBl
bnRyeS4NCj4gPj4+ICsgKg0KPiA+Pj4gKyAqwqDCoMKgICQgY2F0IC9zeXMvYnVzL3BjaS9kZXZp
Y2VzLzxiZGY+L2RldmljZV91dWlkDQo+ID4+PiArICovDQo+ID4+PiArDQo+ID4+PiArc3RhdGlj
IHNzaXplX3QNCj4gPj4+ICtkZXZpY2VfdXVpZF9zaG93KHN0cnVjdCBkZXZpY2UgKmRldiwgc3Ry
dWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsDQo+ID4+PiArY2hhciAqYnVmKSB7DQo+ID4+PiAr
wqDCoMKgIHN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gdG9fcGNpX2RldihkZXYpOw0KPiA+Pj4gK8Kg
wqDCoCBzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IHBkZXZfdG9feGVfZGV2aWNlKHBkZXYpOw0KPiA+
Pj4gKw0KPiA+Pj4gK8KgwqDCoCByZXR1cm4gc3lzZnNfZW1pdChidWYsICIlMDE2bGx4XG4iLCB4
ZS0+ZGV2aWNlX3V1aWQpOw0KPiA+PiAlcFUgPw0KPiA+IE5vdCBuZWVkZWQuDQo+ID4+DQo+ID4+
PiArfQ0KPiA+Pj4gK3N0YXRpYyBERVZJQ0VfQVRUUl9STyhkZXZpY2VfdXVpZCk7DQo+ID4+PiAr
DQo+ID4+PiArc3RhdGljIHN0cnVjdCBhdHRyaWJ1dGUgKmRldmljZV91dWlkX2F0dHJzW10gPSB7
DQo+ID4+PiArwqDCoMKgICZkZXZfYXR0cl9kZXZpY2VfdXVpZC5hdHRyLA0KPiA+Pj4gK8KgwqDC
oCBOVUxMDQo+ID4+PiArfTsNCj4gPj4+ICsNCj4gPj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGF0
dHJpYnV0ZV9ncm91cCBkZXZpY2VfdXVpZF9hdHRyX2dyb3VwID0gew0KPiA+Pj4gK8KgwqDCoCAu
YXR0cnMgPSBkZXZpY2VfdXVpZF9hdHRycywNCj4gPj4+ICt9Ow0KPiA+Pj4gKw0KPiA+Pj4gwqAg
aW50IHhlX2RldmljZV9zeXNmc19pbml0KHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0KPiA+Pj4gwqAg
ew0KPiA+Pj4gwqDCoMKgwqDCoCBzdHJ1Y3QgZGV2aWNlICpkZXYgPSB4ZS0+ZHJtLmRldjsgQEAg
LTI4NSw1ICszMTUsMTEgQEAgaW50DQo+ID4+PiB4ZV9kZXZpY2Vfc3lzZnNfaW5pdChzdHJ1Y3Qg
eGVfZGV2aWNlICp4ZSkNCj4gPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBy
ZXQ7DQo+ID4+PiDCoMKgwqDCoMKgIH0NCj4gPj4+IMKgICvCoMKgwqAgaWYgKHhlLT5pbmZvLnBs
YXRmb3JtID09IFhFX0NSRVNDRU5USVNMQU5EKSB7DQo+ID4+IHVzZSAuaXNfdmlzaWJsZSBpbnN0
ZWFkDQo+ID4NCj4gPiBXaWxsIGFkZCBoYXMgZmxhZy4NCj4gDQo+IHRvIGJlIGNsZWFyOiBteSBw
b2ludCB3YXMgdG8gbW92ZSB0aGlzIGNoZWNrIHRvIHRoZQ0KPiANCj4gCWF0dHJpYnV0ZV9ncm91
cC5pc192aXNpYmxlDQo+IA0KPiBhbmQgSSBkb24ndCBjYXJlIHdoZXRoZXIgaXQgd2lsbCB1c2Ug
Lmhhc191aWQgb3IgLnBsYXRmb3JtIGZpZWxkDQo+IA0KPiANCj4gPg0KPiA+IFRoYW5rcywNCj4g
PiBCYWRhbA0KPiA+DQo+ID4+DQo+ID4+PiArwqDCoMKgwqDCoMKgwqAgcmV0ID0gZGV2bV9kZXZp
Y2VfYWRkX2dyb3VwKGRldiwgJmRldmljZV91dWlkX2F0dHJfZ3JvdXApOw0KPiA+Pj4gK8KgwqDC
oMKgwqDCoMKgIGlmIChyZXQpDQo+ID4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4g
cmV0Ow0KPiA+Pj4gK8KgwqDCoCB9DQo+ID4+PiArDQo+ID4+PiDCoMKgwqDCoMKgIHJldHVybiAw
Ow0KPiA+Pj4gwqAgfQ0KPiA+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9k
ZXZpY2VfdHlwZXMuaA0KPiA+Pj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVz
LmgNCj4gPj4+IGluZGV4IDE4MGQ0NTBhNmRlYi4uNmZkZDE2ZWFjOTA2IDEwMDY0NA0KPiA+Pj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oDQo+ID4+PiArKysgYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmgNCj4gPj4+IEBAIC0yNTcsNiArMjU3
LDkgQEAgc3RydWN0IHhlX2RldmljZSB7DQo+ID4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgYm9vbCBv
b2JfaW5pdGlhbGl6ZWQ7DQo+ID4+PiDCoMKgwqDCoMKgIH0gd2FfYWN0aXZlOw0KPiA+Pj4gwqAg
K8KgwqDCoCAvKiogQGRldmljZV91dWlkOiB1bmlxdWUgNjQtYml0IGlkZW50aWZpZXIgcmVhZCBm
cm9tDQo+ID4+PiBDUklfREVWSUNFX1VVSUQgKi8NCj4gPj4+ICvCoMKgwqAgdTY0IGRldmljZV91
dWlkOw0KPiA+Pj4gKw0KPiA+Pj4gwqDCoMKgwqDCoCAvKiogQHN1cnZpdmFiaWxpdHk6IHN1cnZp
dmFiaWxpdHkgaW5mb3JtYXRpb24gZm9yIGRldmljZSAqLw0KPiA+Pj4gwqDCoMKgwqDCoCBzdHJ1
Y3QgeGVfc3Vydml2YWJpbGl0eSBzdXJ2aXZhYmlsaXR5Ow0KPiA+Pj4NCg0K
