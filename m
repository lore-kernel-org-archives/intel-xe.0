Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38095606A319
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 11:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q5vS4tf8
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C920510E035;
	Wed, 21 Oct 2026 11:19:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42E7E10E035;
 Wed, 21 Oct 2026 11:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792581588; x=1824117588;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vTl8/sKcJPxTVeAzXgvt40RUSSnUG5wUxNCLInj3U5s=;
 b=Q5vS4tf8A4SG3aKM516ogfAeHmYq/3ZQtOqPQa6k7bQsdq9O9c6iOoqt
 MPpaL7zx60XyDtlKCch96rKgxS60v/kFvnn622mdHe1+3BhqDjYKhFeL6
 4s3PQYwkPFcIec3846r6JhVQ5yQcELngJJrXOagt/NPbjU5CcKgCz6gMd
 dmKFVEAgfF+KWTu3HtGiLhc99T8UPdIzX2fWarp++m/cGXfUTEDxwHGhn
 K0+DrJUUQLrpffLDaXxsaDgbg0N+2RSLMSoyGfCSDVgZ3jYyr4eFYwOcj
 4MMu4LdmmcWQmungglCTMuzzjejLcJLhqXzQZ8CNKI/fNLfDYnv84bKEm A==;
X-CSE-ConnectionGUID: YxyeLhzURMCsfcoNfNlOSQ==
X-CSE-MsgGUID: 5nBy8lsaRoeraxRAJ1prow==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1320119"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1320119"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 04:19:15 -0700
X-CSE-ConnectionGUID: UxeUnR3SSi+j+irne/XnZg==
X-CSE-MsgGUID: AW7VYE+JT9aoNL2OXYoOzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3393326"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 04:19:10 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 04:19:10 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 04:19:10 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.32) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 04:19:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hU0t2+2c1OlQoAdkGlYLketCyF1xBziYuupogLJ3m/nkZl77b5YFJkwQVAaJX8gLOoPQrVIn7++nWa8A1a8pYrxSTj+4CrRkkHXCfuaKpmtxqWeMiX/0/4mx/9UBpirn1KXUIIRJXd8iWeYgnupEnSGK+VLo8zWQZstrF7Z7ngPjT+Zav+xBswYNiMpdgPbkW3/k+hdzliRLVi8TDqw4occWL66iaC8xysAbxCSRtH1cOAMu2fTbkZ5+19olDgoQ/1na42aMrEpPUMGwlEMWdhQIe4pSU28AeE/pbHtQt2hCMwXYJ1N7cyCcts1Ss9MUcTjjgzbWiQ6MiFRUuOJK5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vTl8/sKcJPxTVeAzXgvt40RUSSnUG5wUxNCLInj3U5s=;
 b=hGY3Fw61i/iybi5bd3CHo2vOq2lhhKCT7CNeOQvustrHB10srtSLtKht8a387Nm+agXjpQ04cYUhBRCSenwVO3jCcfXahoA6v775AmsGvbozi9PO5P8H8k6OO40hFHOoJt/4W+FBqZ25/CSXqVNITC9MOye1OEcK6DsPSChwgFuTO8DF8Ck124eTEHDvx9P2KkhZ7ld1WlWJouUvOfaM/deA/5c6Xv6LSVwSDXjbldBRVz/XXkmYD/AqDsYvt206dz74ZIofID1VK2XsreUp0j6PUKnSGSqDbvRHNyiVgKWsq637uXGgEWNlCYCpYS8nzCWHdilHZSsM/+Yz5vyFZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::28) by SN7PR11MB6876.namprd11.prod.outlook.com
 (2603:10b6:806:2a7::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.17; Wed, 21 Oct
 2026 11:18:57 +0000
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::79ab:f4ae:b1c2:61d9]) by DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::79ab:f4ae:b1c2:61d9%5]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 11:18:57 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Hogander, Jouni" <jouni.hogander@intel.com>
Subject: RE: [PATCH 7/8] drm/i915/psr: Remove drm_info_once on failed
 selective fetch area
Thread-Topic: [PATCH 7/8] drm/i915/psr: Remove drm_info_once on failed
 selective fetch area
Thread-Index: AQHdT/giAMIczgpNRUmd7lxEz+rsvrcH++pg
Date: Wed, 21 Oct 2026 11:18:56 +0000
Message-ID: <DS4PPF69154114F9CBD47E071DA0EA99F62EF662@DS4PPF69154114F.namprd11.prod.outlook.com>
References: <20260929094434.77129-1-jouni.hogander@intel.com>
 <20260929094434.77129-8-jouni.hogander@intel.com>
In-Reply-To: <20260929094434.77129-8-jouni.hogander@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF69154114F:EE_|SN7PR11MB6876:EE_
x-ms-office365-filtering-correlation-id: a1ffce62-2677-4a89-afad-08df2f651929
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|10070799003|366016|38070700021|56012099006|4143699003|11063799006|261009223027099003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: uMEyH8ycsNxs4bA3Cq1Q2A5D3yD9hqA3YTomPSsd1fkg5fHB875JNyc5PzS1R/1ZsRJDYKS3cTjNEvK2Qt49cNh/Tbl1zkiqFRQXFXj3toFnZfHkbk1L9bmBnPua5MlXjl+ZfND+5zZ2WT4DjILyWykwOuTp0ASkJRsHnXk8viTvVJj0NQbOte+3CisHr8eFiGxo2kkxflA36yNt2dQoDhSWEs6ohqwuP+RHtPyO4/WQA8q9ghSqeBuWV02EfryAPGgXBgylYvyJVgJXPA5NnWPez8mRonWSTa5FZmg7s02+THUaxoZB87rxjoJ6eH9vM6W3+WAL+uJyoTXH41sRLMjItfsSF5s61ZmrMRUwh0CGXX/JwgYOMxekncduflBk/tA+5OlEXfDzXrGNmCtAnWzKPWFWfcB8qSe+KXJxRJ0eEy+BOjAzpOglSVM0lBfS/4ZgFgKyuibM8cqss2Wtw56ipLEl/EzI4WBCeegvvAPALwpwtA1ZrczQxk6cUuxeIAv3X8RESobvlRpBhiMN5VTW2/S3xfiLfaLQmHueUgwPNHKOMaINVktkNU0sU4VjtMylvuCRAyNTIDMBAeMc/HZewNChFGvwkf6XyhG8cPnnZdAOYkeXgbaNNcqgX/ehC8Df0iSA1Lvh+rICSYZ/Hy6LqGjrloLD5OGglG7Y8byd2tjFhRx1XL1EFrYKN9h1Zd/XiXeVWeJ6AZEe4mfNMFvjevOFD01Cj1xQxTOjohE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF69154114F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(10070799003)(366016)(38070700021)(56012099006)(4143699003)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bUVGK3grR1hudmp5R2ZwbXpyVzB6aFRZZ09YaHdSVndkTXVLS1pCQ1RHSDhn?=
 =?utf-8?B?Nng4T2Nnc08vWTdTd2V6VGhNaTl0Vnp0UGZqeTlReWVuUkloSWhUY0g3MS9U?=
 =?utf-8?B?R2hVWloyQktaeWdXOWZQZHpqTDdOUTFOWllNb3RLVjFwcjdZZEFsdDFHZGdZ?=
 =?utf-8?B?T29zdkppUFZVWmdIajE1UVBlQWk0TXp6akVrOFg2MlBXc3JWMVNHNjRsa3dD?=
 =?utf-8?B?UGRqVFVKRlozQStqcDNGT0xmREYvZHJPcGs2UDJFcGJxbG54UzREOWU1ZGRE?=
 =?utf-8?B?Nm1DWkJyUGtnOEZYd3dlT0xOa1hBWENKZ05uTUpNbG1rb2ZFWlF4TXVFY0Qw?=
 =?utf-8?B?c0M4UlhrcDc4MW0rdGF6QWtoTndHMTBPcUVsb2FvNWptTHZacFhXZ3FMOXR0?=
 =?utf-8?B?M0VGdXpzbmRCY0VwdHZURmRnZU00MlhLRUF2RWJoeWNmSzIwZHBQaEZ3a0pi?=
 =?utf-8?B?TnVYVG15aDIzY1VGamJZZFZRc3JraGZyK2hwNmZFNmpNUGJjWFh5SSt4Q1BQ?=
 =?utf-8?B?V1daRkMwRXBzVGRGU25CaTAyN21WaytiMml2V21uSHpIUnQvNHY5SjRvdE1n?=
 =?utf-8?B?RW1xUUlOejZ1VDVvbE5tQmlPdmlvWDY3Tjltc3Q2ZHFqSFdteWVBNFBaeCt5?=
 =?utf-8?B?SGxMMUVTU3hPcGpNaWRsUEwrK2tDVXZhQktudXZETHFLRkhoczJJZXR5MzIr?=
 =?utf-8?B?TG5qTlRnYzAwcU0vcUh5QjNld0Nvd2l5MXlVSXZXYWl1anl3NnQ2UWh5R0tx?=
 =?utf-8?B?Wm9oZDNNNzdPWEhoWWtLU1l4S1VRWC84bCtMd0REL0x2bDZyKzdKYVdtSUdv?=
 =?utf-8?B?L3BjLzA1bGYxNDZMK1Vvc0toRW13OFlMQ2dBUnQyL04xUFdUcjl4MGpZSkFG?=
 =?utf-8?B?SWZEcVcrREpPYWZLY2tYMGhPVE9wREZUdmVySkw0L0xESEJISzB0UStLWXZR?=
 =?utf-8?B?MkNuL293NDE2SVdzUFdmb3NsVEZtMXlOVHR5Z0NlYXhvN2ZTNk5RbEsvdDRM?=
 =?utf-8?B?blVmdmdPYXBMbVp4YmtNdGNUbklwUWpBeWhPeFF2dkhhSXRlL21zTkpJTFF3?=
 =?utf-8?B?RUhJaDNTbExLL2E0VDloTW41eUtRanJJcCtCTFo0UnBuWCtnQy9odGdOK1M2?=
 =?utf-8?B?aCtZcmhUUlB6cjZNMnpmNFB4bG05Q2lQNVY4Qkxza3NIVDA3TlZ3REJSRnpy?=
 =?utf-8?B?UUp0MkRoTWZFSm9mWWp1VmxFdUREa3hJYUxqVm56YVhJTVpwVXAxVGVSZWE4?=
 =?utf-8?B?VGlpaGdLanNBemxxOHhYQkVqbTlWcjNXZ29tL1BnckY4MXF4SnRENXlQcm9D?=
 =?utf-8?B?Sm5lU1phNGNYKzhSY2tiMDI4QnlrbStud1FtWTFDOG5XNk9rakk0UW03NUcw?=
 =?utf-8?B?WVFTQU9YRExPNUpiWks5ZWJHWGt0dXNzZFZzd1c5ZzZWUEJkV01qUStYV1FS?=
 =?utf-8?B?d1htaGlrNFJ3bUd1Und0QWdqMUF1dkxtQTI0WjljOTQrRHFONk16OXVLVzlk?=
 =?utf-8?B?VWJBZDBLbms0SlpsSkdtSGtJMm10TzVNZ0pUZHN3T21mWXJkMGpDY0QvdUc5?=
 =?utf-8?B?T1pUdklJMjJEQWpvdVZOK1hXOXg5alc3RUozemNNSCtWRGdWZHVsQXFhcHV6?=
 =?utf-8?B?MEhPdjc5MWowdmsxYTQ4azNwQlN3cWlmckFoLzNjWlIwYnpZbnNGOUVvalVn?=
 =?utf-8?B?NkE0RGRCZWdzQmZjZlRBSWRsRmZSMHNHbFpmZ3hHemRVeHdOWWIzaDRJdWVV?=
 =?utf-8?B?OHY1b3gxOWgyY25FcCtkeStIOHNOeGRiOUdmdUhPbmhGOFVsdDZQd2hYZm5T?=
 =?utf-8?B?SGhYK1d2WUl0WXFjaFNpdXNPWWRLMnVKYlR0SlZrN0NicW5Zem5XeXJ3ank3?=
 =?utf-8?B?N0VaeVMxV3JPM3VUZlZtWDhaMUowd05lSys1aXg4ZDNxSmRyaWxySW04Zlls?=
 =?utf-8?B?aVBoeWcxL25WdHFjYTlqWGNZK1lrd1h0a1pmTnRjcm51T09hb0p0enJ4V0J2?=
 =?utf-8?B?OXlBMjBYNThjZGVBbVVpQnlzZXpkVm9rZmJwQnFCbmY3RzM0RlM0K1AwaHBk?=
 =?utf-8?B?U3RHT2NzRkg2VWg3d0R2SGY3aXFNVUVnL0dQYWExVTRpMmVTa3Y4bjRWQVdn?=
 =?utf-8?B?bHNjUlJqZERuUHgzck9kL2JpQnp5VUM2enJWdzZuYlpjSUYwcjVGV3pXaC9P?=
 =?utf-8?B?OGlXTTNjNnozOFkycXMrNWRURXNQUy91UmJOemRpTmZoWWt6MllJci9UcEcx?=
 =?utf-8?B?R3p4Tmh5c2hUazVFamxjWHUreGU2RDB5dnlOMllMdU0zUWNMSkkrTmU4Z1B0?=
 =?utf-8?B?dmRlOW5lbmhmb1hVTENMcWI4bnQvV1hTTjdJMlRldGhWWUxKTEZYQnFvQkQw?=
 =?utf-8?Q?NdK+3ZFJxUsgn4+3+TqWASO+6aqId7L1ly2mi?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: w7KmHFOus9LlveEnuIRCgtaqWtMWCQrBn1r34Ervw9JPQc7mQG7dXCkaDPaTxTQh26yI7uYslkK70lLuGTHE/wShVotBSz3uT40oIQK5fPyWIDqUCD7Sh6VeELrgSvDvY9mQgg6yKrfhhdZSSn/XJNg7cbAWQ5AqwaGHWz+/SzgOmLEAwC9g9O17WQVX9i/V2StpodT7Ox1KJcRqPHuiheanZ6kxaW8vXOWjwrDmnrRmenvNg4We5m8d8rOy0OVLbWFJxzUE9rR2A5F4ZOdNc8jzfoJwI/J3SyB+qSWY8Ewg3raJC/NJPDgIIFV03ne7FifxEEurPQkWqpyIfqWDxw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF69154114F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1ffce62-2677-4a89-afad-08df2f651929
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2026 11:18:56.9708 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KMu+XY/IknQn0VJJWhWiOwduI2d3VUz7LnbvmZFz4r8VArGl8kkccRXCka2N4gnWY9tfcB5DmYOQdCvqTyzBgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6876
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBJbnRlbC14ZSA8aW50ZWwteGUt
Ym91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBKb3VuaSBIw7ZnYW5k
ZXINCj4gU2VudDogVHVlc2RheSwgMjkgU2VwdGVtYmVyIDIwMjYgMTIuNDUNCj4gVG86IGludGVs
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zw0KPiBDYzogSG9nYW5kZXIsIEpvdW5pIDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQo+IFN1
YmplY3Q6IFtQQVRDSCA3LzhdIGRybS9pOTE1L3BzcjogUmVtb3ZlIGRybV9pbmZvX29uY2Ugb24g
ZmFpbGVkIHNlbGVjdGl2ZSBmZXRjaCBhcmVhDQo+IA0KPiBTZWxlY3RpdmUgZmV0Y2ggYXJlYSBp
cyBsZWZ0IGFzIHplcm8gc2l6ZWQgb25seSB3aGVuIG5vbmUgb2YgdGhlIHBsYW5lcw0KPiByZXBv
cnQgYW55IGRhbWFnZS4gVGhpcyBpcyBhIG5vcm1hbCBvdXRjb21lIGUuZy4gb24gaW5pdGlhbCBj
b21taXQgYW5kIG5vdA0KPiBhIGZhaWx1cmUsIHNvIGRyb3AgdGhlIG1pc2xlYWRpbmcgbWVzc2Fn
ZSBhbmQganVzdCBkbyB0aGUgZnVsbCB1cGRhdGUNCj4gc2lsZW50bHkuDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5pLmhvZ2FuZGVyQGludGVsLmNvbT4NCg0KUmV2
aWV3ZWQtYnk6IE1pa2EgS2Fob2xhIDxtaWthLmthaG9sYUBpbnRlbC5jb20+DQoNCj4gLS0tDQo+
ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jIHwgNyArLS0tLS0tDQo+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDYgZGVsZXRpb25zKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMNCj4gaW5kZXggZTJiMzViOWZl
ZTViMi4uZDhmZWZiMTNjMjc5MCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9wc3IuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX3Bzci5jDQo+IEBAIC0yODg5LDcgKzI4ODksNiBAQCBpbnRlbF9wc3JfYXBwbHlfc3Vf
YXJlYV93b3JrYXJvdW5kcyhzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSkNCj4g
IGludCBpbnRlbF9wc3IyX3NlbF9mZXRjaF91cGRhdGUoc3RydWN0IGludGVsX2F0b21pY19zdGF0
ZSAqc3RhdGUsDQo+ICAJCQkJc3RydWN0IGludGVsX2NydGMgKmNydGMpDQo+ICB7DQo+IC0Jc3Ry
dWN0IGludGVsX2Rpc3BsYXkgKmRpc3BsYXkgPSB0b19pbnRlbF9kaXNwbGF5KHN0YXRlKTsNCj4g
IAljb25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqb2xkX2NydGNfc3RhdGUgPQ0KPiAgCQlp
bnRlbF9hdG9taWNfZ2V0X29sZF9jcnRjX3N0YXRlKHN0YXRlLCBjcnRjKTsNCj4gIAlzdHJ1Y3Qg
aW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSA9IGludGVsX2F0b21pY19nZXRfbmV3X2NydGNf
c3RhdGUoc3RhdGUsIGNydGMpOw0KPiBAQCAtMzAwNiwxMiArMzAwNSw4IEBAIGludCBpbnRlbF9w
c3IyX3NlbF9mZXRjaF91cGRhdGUoc3RydWN0IGludGVsX2F0b21pY19zdGF0ZSAqc3RhdGUsDQo+
ICAJICogc2hvdWxkIGlkZW50aWZ5IGNhc2VzIHdoZXJlIHRoaXMgaGFwcGVucyBhbmQgZml4IHRo
ZSBhcmVhDQo+ICAJICogY2FsY3VsYXRpb24gZm9yIHRob3NlLg0KPiAgCSAqLw0KPiAtCWlmIChj
cnRjX3N0YXRlLT5wc3IyX3N1X2FyZWEueTEgPT0gLTEpIHsNCj4gLQkJZHJtX2luZm9fb25jZShk
aXNwbGF5LT5kcm0sDQo+IC0JCQkgICAgICAiU2VsZWN0aXZlIGZldGNoIGFyZWEgY2FsY3VsYXRp
b24gZmFpbGVkIGluIHBpcGUgJWNcbiIsDQo+IC0JCQkgICAgICBwaXBlX25hbWUoY3J0Yy0+cGlw
ZSkpOw0KPiArCWlmIChjcnRjX3N0YXRlLT5wc3IyX3N1X2FyZWEueTEgPT0gLTEpDQo+ICAJCWZ1
bGxfdXBkYXRlID0gdHJ1ZTsNCj4gLQl9DQo+IA0KPiAgCWlmIChmdWxsX3VwZGF0ZSkNCj4gIAkJ
Z290byBza2lwX3N1X2FyZWFfY2FsYzsNCj4gLS0NCj4gMi40My4wDQoNCg==
