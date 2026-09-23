Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310A1C9830B
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 17:50:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF8C610E94D;
	Wed, 23 Sep 2026 17:50:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jgFcZ8Hx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B29A10E94D
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Sep 2026 17:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790185806; x=1821721806;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=rcQcr5tvtnHbpDnWHvgBNx6jrudApAqwtBPmy3mT7dg=;
 b=jgFcZ8HxYAsocEjzYnQB0NnGtWpQicuTAGArR7dzqo5z+3vA026EtmUs
 hfMg6z5nv3zbwPJUmdvvGFC4+oncL5cdN3A+qecriXc5ohG5EChnj54TW
 Pj5u3fwSkeC80ulho1v0/geiYaqcDGC7lyWTxnb5wkpAeJC+2eUb2cKYF
 Wpt1UiWpRf/P4bdiw5DO9pN/+TA09SiQR/BwSOcLv9Q17IhoGjLc5cxSq
 A6A+ZCnfEaDXlNlUbEZCSVJ9eTBlvK+OgX5GOhuxS98rBd10ACRxM6xDC
 MY/Vtgs+5VUxr/blm207o9tvQRYVDKU8Cf3CFeT/pyTVpwUJX+GdtH3Yo A==;
X-CSE-ConnectionGUID: r3UKVZYFRICocZamBrZSJg==
X-CSE-MsgGUID: /awNvXYMTW6cB4wae1x/5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="108407233"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; d="scan'208";a="108407233"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 10:50:03 -0700
X-CSE-ConnectionGUID: aZsP8YL6SoaGyGk9YgRGxg==
X-CSE-MsgGUID: UZLjsCwxQOeD/3BaJwcrng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; d="scan'208";a="273187172"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 10:50:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 10:50:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 23 Sep 2026 10:50:02 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.52) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 10:50:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qu7zcvAbAuTfm7BKVXZDtSRHYhjdOSrM7a8lgnERk8c9Hs683hyhGwj9+1SQ0mG/nnrb58oDcXJpKV9zzAPOAcB525p8iDRJD9+wFvRRdyvYr2b9X0n5NqkaMRCAE104k067r7BheOHApkcs2GNaz8xT3VNpJzIf/KlmE76m8iOR+QBOevEbPRe9EHzcY11Y2TaHFZqkD+ACRgRur8M5HfvSUw9bZSHVSasXMsJ7wLL3/fv05RwD8NAoHMTKoGkoU7mYnmGmQKabpy3Y4dHpjaeuJdk4PTvBH8q0IAgjODumdU2ocbzgreWnjy28zUtlxSzBvX7MRFbLZl3cKZzsAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcQcr5tvtnHbpDnWHvgBNx6jrudApAqwtBPmy3mT7dg=;
 b=GABqF7EQTziEhZBJgGTBK2xIwrLiJawF5D6TwM7xh1PmoE4b3sI1EH3Pz53X4I5ocCWjv5Z1PBEHciLDUgP2OZKCTf4jPIFXdaoYNrc523FBES+ZieAbXPNyq/far83bTAn2GD2NswV2zeQy0WnPG7F6D+mDVqK23O5gReQuH1NunMkIYLJPz4iNaa+4LPhs2PKSxofehV4nXgBh1hCHHGoO2Ew2LbkRK5HQTKYhtHEs65jtFwXrpO8t3sULycVtldMVXbgeOi0wyGw9Kcbn4+/mfhURP1QzwG1+MUSGsHT1kCIRIhwxlOcZ3TWdJqTY10ee4DwuoVg/HFAf8oVtYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB6314.namprd11.prod.outlook.com (2603:10b6:208:3b1::13)
 by SA1PR11MB8327.namprd11.prod.outlook.com (2603:10b6:806:378::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 17:49:58 +0000
Received: from BL3PR11MB6314.namprd11.prod.outlook.com
 ([fe80::2fa8:f753:ee68:e2]) by BL3PR11MB6314.namprd11.prod.outlook.com
 ([fe80::2fa8:f753:ee68:e2%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 17:49:58 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Wajdeczko, Michal" <michal.wajdeczko@intel.com>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "talesam@gmail.com" <talesam@gmail.com>
Subject: Re: [PATCH] drm/xe: Add and use TLBINVAL component
Thread-Topic: [PATCH] drm/xe: Add and use TLBINVAL component
Thread-Index: AQHdSraX1u0u3hYKNEOE4OAsWkEXMLba+h6AgAFkroCAABOpgA==
Date: Wed, 23 Sep 2026 17:49:58 +0000
Message-ID: <013f2fad0dccdda6c1259103259954bf351ee48a.camel@intel.com>
References: <20260922171911.500-1-michal.wajdeczko@intel.com>
 <ca660eb96bacc75620c6c58a521cc28c445ea9e7.camel@intel.com>
 <8afcd21a-4ac2-46a5-a698-524b5ff8519d@intel.com>
In-Reply-To: <8afcd21a-4ac2-46a5-a698-524b5ff8519d@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB6314:EE_|SA1PR11MB8327:EE_
x-ms-office365-filtering-correlation-id: 72e8920e-127f-43b3-6ba6-08df199b15b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|10067099003|4143699003|6133799003|56012099006|11063799006|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: e7U4KT1tthEzEqNZqBJcnM0VYvdHK0jpeewQkzuTiekFdvwcBKjMEZaoaQoJrPL68pUz+ZXwkP+SNBoSUQNgb8TepMJ0YcIJ2s9+it4WpELAgkyIcDZqLr/ZhxXpqp4hUMrVqe+E9ULezNGVXHbwBnrR72oX7dczJRBJpaqVcRt76LzEry59RnNLDiKwlCd00mubq8FZYIq3UAK9Ne5NSBvtDZFQxTOg0EsM+f4WRjNBlT6MK4UHldphAnTmKhXLIq9lw4Ky33cVpOkX8jLe8/jxcZzvIB7PAlYJHkIHkIBkSYNsyOlVAL+IKy2Q/SsFY3opt7RoZXI4j9KrqSfHBVWQHoEjcQZ06o0NbZOjztlYp2EYyNQ/Ik8TE/+NB9AGtk1LKyzJm3w1vwrFzcbtN1zp1p00rZ1jYfUZDAYFDZF0fIYWqh18EaKtfSIc3sBo80s+ME1g4G5neTFr13v4W53BCXBi2CJFFc/dAjJJxPGgGpSEpqfqQdgYCn8jlMNayIr8tjwRL7dPDYwlI2g9UPRqCvlHp/Tucw0ocC1ruiN4IMjFL6PGuk0UUSLR3P0llf8PdNVlgOrDd65LhzA/yU+o3mL7453kXs0OTJRiWPYsd41pJwrtl1m/FjgwN3GUDzzsfsQWfeamUx2IOFe3KBWsi36jyA03TiG9oRFWFUvv0Lc8MVv1YFwPeUgKYt1O+pxU1SSbgoWuv4Jywi7BsOPpc/1xVAgpp5wuvGWhGhk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6314.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(4143699003)(6133799003)(56012099006)(11063799006)(22082099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TFBiQWZCWUhIaDJNaGxPTUJva1J0Y0NIWkwzSytNTFk1K1BiclZiT3NoelpB?=
 =?utf-8?B?T2pLTUdhdG9KUldBclJPUG5UbUs0d01TWGMwaXc2MmJBRncvS0Z4c1RQZ3Nw?=
 =?utf-8?B?cEwvaU0xejJCYVdPcUNOYTV3SksxVDJMWE9qUStIWDVnSStaZEc2aG8yREkv?=
 =?utf-8?B?L0plVldhQkwrM2RxdHNZc3lLclVDL1prWVMvZ1hjV3VKRGRkeGprUmFrZUtG?=
 =?utf-8?B?dzFSanJBdk01OFpiL0NHM1htenNFYjdESnBZbks4bGVpdjk5MlRjWUFaM1Fv?=
 =?utf-8?B?QmplcS92L214SjdwY0ZLbWRzRFRlTnQvN3pLcDYzMityN1VWRzl0dG1LaXFV?=
 =?utf-8?B?K0JFS2dhRjFraURsWXNOSGNjRXQ3UlVlWXJWQ1AzZjhEaG0xR1BVNVN1WkRM?=
 =?utf-8?B?MUtYcEpOSy9HZ0dEM2s2QWpiV0xwT1JDVUJ1TG9GMUtvaGlTdEZUSlRXWXVW?=
 =?utf-8?B?SE11ZDhTMDFNdzVyTW9pUGdxRmh0bVBsTEZiRnZXeEhhazNGT3dBSmJ0R3RC?=
 =?utf-8?B?UE5SdzdkR2hIMkxsY1FDS3RjblBncWMzWEgxa1U3aCtBbFdVTzlsWUtmYklq?=
 =?utf-8?B?ME4xbzJlalpTU28vWlZEVjUyejQ4dllHdnJqd0MvTWxRVUZGbURUTkVybnZN?=
 =?utf-8?B?OGFkTXRYZFVMV2xTMnhPNWNRY3ZRL05BaFBNdEF4bDlnQ3ZOUVozUEpseHFw?=
 =?utf-8?B?ZFk5aWZ6STR6R3NrNmV3Z2lqZ0J2dVNyZU1CaDErVTc2Y1pIVmlldmw0M0RH?=
 =?utf-8?B?VFdBNkk5R2pwV1F0c1hPWGJ0ZUxXSDgxaU13Z3pGSjB4OUk0b01EUmZuL2lY?=
 =?utf-8?B?MGpEZnJYR2U3OUU2ZjdVVDFVNWxRQnI0OGVKUXRDa1QxcENLVkZpczNkcDhR?=
 =?utf-8?B?V3hCdUV3c0loYk5MYWpnQTd0OTZ3dWhvbXZuYkdMUXZORWh6aUd1dkJFTW9k?=
 =?utf-8?B?Y29Za1VYMGtVZFRuNEdES1p2RTJuMWVSL0JMSSt6OE1qYmtRSmgraVhJZU9O?=
 =?utf-8?B?VSt0ZGJoUlIxbDZpcTJ5QmM0cVZTQ0cxbjM1NkdiQlFZRU14YTJmbDRDWUpP?=
 =?utf-8?B?SnhsSmVQS3FnVWVObURhQXRLRzFIUVJYay9iOEt0QU53OGJDNThNbVZ2UmpN?=
 =?utf-8?B?TGF6VHVFUnpibENwanRUa1M5eWM4VkRCd0MwTHN4S1hqa0FPa3krL1VGUHJR?=
 =?utf-8?B?dkpDSXBpc2tBVmFwS3MxSXROQlVITEpBSDFvTXNjMW9pUmxjWnc2TDZlUlk3?=
 =?utf-8?B?MHhFSHNOMHRxN0FVeGhxQktOalE4d2hmMk1vTkZSZFZMR2ZRZUlrdTZ4bmJl?=
 =?utf-8?B?RURtZW0yZEVFYlc4ak0xUEJIU0VrTFNOYzBpZVdJalhrRmNvSER6VEt5eXR4?=
 =?utf-8?B?eUNIZHo1cVZHT05HTkQvMWN6UkppWnVhMzNZZlMya2RtWVQ0d2YwODRaZXlj?=
 =?utf-8?B?cmRvSnkyQmYxcXFKeVkyb2RBbTZqb2lIQ0QwOSt1bHY1SWVQd1h1NXYvODBl?=
 =?utf-8?B?emJWRFgwdTdmeUljZEw3N3dKbVBGOXJ1SldHY2N0cTdOZjR0MTBjOVRVcGxn?=
 =?utf-8?B?Mmd6QlZDYkc0b3BqS3lNeEYxWTlBQk5EcTV0WDFBVlA1eTU5YUtPOFFaS2pX?=
 =?utf-8?B?OUREMHJxdU9lOXlldUVFUFhMRDR1VVIycWxRQXB0TmUvSHZpcTBUT25DTC9S?=
 =?utf-8?B?NFBNU2JPajFQK1FDRmFxUHM4YW1VKy9TeG44NytrYmkxTE5UUlhVV1RSZWU0?=
 =?utf-8?B?cG9NaThWTVg2SjNlRUVUYjhUbWQ4SGhoRzZhMW5wSTFmeUFPM3BFSjBtcEZr?=
 =?utf-8?B?VEs5TnFuTzB2Z1ZwNzZTUnNzTy9DbndNQjNBM1FoQWhWRm5HS0FjWjUwUDJP?=
 =?utf-8?B?Vmp3OHNjNlhibUhKaVFCMmo3WWswUmNjTGlaRG9Yem0yTEVpTG13MURKcnV1?=
 =?utf-8?B?YmkraCtMMVFwSngvYVVZZXRCQmZqdEU2U1dVOURHaHJrMFdISXo5emFhOXd1?=
 =?utf-8?B?bFVvSFNkUVIvWnF0dFIzaDhtc0FLdEdaVHlicmNaRWdqOHIrVW9IYUNYajlY?=
 =?utf-8?B?TC8vRUVROWxOb1VaWWFPYythNG91RFk1NzdaWDV6cXVqT3dlQWowbjdpK3I3?=
 =?utf-8?B?WVZhaUxtVVg1cmpwVE11TGtNZGRCcXIvb2lVRTNTQ0VGWVFHRlBVM0FxZ3Na?=
 =?utf-8?B?NmJSSWRid0NCQk5JZEFzdEd4T1N0WlV5bkFlOTJiamQyYVh3MmlqbWJZNzJq?=
 =?utf-8?B?bHlRYXIwcTgwaGVPOHJBYkhLZ216QW1LT1I3bUV5R0orQXZPNktmOE9RSnF2?=
 =?utf-8?B?YlJuL1ZsWUtQSHBKY0ljT3A0TTEwODZMa21VZEZ5aHVPc3BHNkhER1d6U2RC?=
 =?utf-8?Q?8atVuZTwoamImFAM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC57DF86029BC84E8F8A2D8288D0756D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Jp0DIRvp3EzeJ1hQoMu0YuWch6JdJopm59Ybi/gfHPzJm4AHwfTiukRjObDBe3Vv0CZE0K8gOYEd1CU9HeOLSmwWe02YBCQIepYoliTfvUJzW/8ZDKHptPE6XsVzO/XMnmqLNX4SCEmLQHzs3VYaDui2MniQCL8HyHfUS7FeUYmy9K7tg/RYzSyan+GzsmCEuB8H0+TiFveE+krFecXLDNFmHRwZbU7uszxqpjJzHUY2bc3makAwbErq/8un7tRVTvE7OJwhWYd2jzMjwDch8We9ZzuSXPES5rZXaU/kzDtu9ZpW5ujmESrx0XCeTY9NmuEaqUX1jr273b82X5iUBQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6314.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72e8920e-127f-43b3-6ba6-08df199b15b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2026 17:49:58.3856 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SSIhBK8ozJHypBqI2OCFE9+b9wHOO5q1cOYYZAf/QzPgwAzTWcGUc6fLu98zrsVPIaa1ayfuhNPqzoKAzPJtkm+fyf06OMUAz/Ux0soWMSE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8327
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

T24gV2VkLCAyMDI2LTA5LTIzIGF0IDE4OjM5ICswMjAwLCBNaWNoYWwgV2FqZGVjemtvIHdyb3Rl
Ogo+IAo+IAo+IE9uIDkvMjIvMjAyNiA5OjIyIFBNLCBTdW1tZXJzLCBTdHVhcnQgd3JvdGU6Cj4g
PiBPbiBUdWUsIDIwMjYtMDktMjIgYXQgMTk6MTkgKzAyMDAsIE1pY2hhbCBXYWpkZWN6a28gd3Jv
dGU6Cj4gPiA+IFJlcGxhY2UgdGhlIGV4aXN0aW5nIFRMQiBpbnZhbGlkYXRpb24gZXJyb3IgbWVz
c2FnZSB3aXRoIGEgbmV3Cj4gPiA+IG9uZQo+ID4gPiBiYXNlZCBvbiB0aGUgeGVfbG9nX2Vycigp
IG1hY3JvIGFuZCB1c2UgdGhlIGRlZGljYXRlZCBUTEJJTlZBTAo+ID4gPiBsb2cKPiA+ID4gY29t
cG9uZW50Lgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogTWljaGFsIFdhamRlY3prbyA8bWlj
aGFsLndhamRlY3prb0BpbnRlbC5jb20+Cj4gPiA+IC0tLQo+ID4gPiBDYzogUm9kcmlnbyBWaXZp
IDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPgo+ID4gPiBDYzogTWF0dGhldyBCcm9zdCA8bWF0dGhl
dy5icm9zdEBpbnRlbC5jb20+Cj4gPiA+IENjOiBUYWxlcyBBLiBNZW5kb27Dp2EgPHRhbGVzYW1A
Z21haWwuY29tPgo+ID4gPiAtLS0KPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUvYWJpL3hlX2xv
Z19hYmkuaCB8IDEgKwo+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV90bGJfaW52YWwuY8Kg
wqAgfCA2ICsrKy0tLQo+ID4gPiDCoDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94
ZS9hYmkveGVfbG9nX2FiaS5oCj4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL2FiaS94ZV9sb2df
YWJpLmgKPiA+ID4gaW5kZXggNTI2YWFkZjg1ZmU5Li5hZGIzYzIxMjgyNTEgMTAwNjQ0Cj4gPiA+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS9hYmkveGVfbG9nX2FiaS5oCj4gPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS9hYmkveGVfbG9nX2FiaS5oCj4gPiA+IEBAIC0xNDUsNiArMTQ1LDcg
QEAgZW51bSB4ZV9sb2dfbG9jYXRpb25fYml0cyB7Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBkZWZp
bmUoRFJJVkVSLCA1LCBXQSwgU1csCj4gPiA+ICJXb3JrYXJvdW5kcyIpwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoFwKPiA+ID4g
wqDCoMKgwqDCoMKgwqDCoGRlZmluZShEUklWRVIsIDYsIFBBR0VGQVVMVCwgTUVNX0ZBVUxULCAi
UGFnZQo+ID4gPiBGYXVsdCIpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBc
Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBkZWZpbmUoRFJJVkVSLCA3LCBHVUNTVUJNSVQsIEdUX1RE
UiwgIkd1Qwo+ID4gPiBTdWJtaXNzaW9uIinCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBcCj4gPiA+ICvCoMKgwqDCoMKgwqDCoGRlZmluZShEUklWRVIsIDgsIFRMQklOVkFMLCBH
VF9URFIsICJUTEIKPiA+ID4gSW52YWxpZGF0aW9uIinCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgXAo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgLyoKPiA+ID4gKi/CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAK
PiA+ID4gwqDCoMKgwqAKPiA+ID4gXAo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgZGVmaW5lKERSSVZF
Ul9IQVJEV0FSRSwgMSwgUkVHUywgSU9fQlVTLAo+ID4gPiAiUmVnaXN0ZXJzIinCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoFwKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoGRlZmlu
ZShEUklWRVJfSEFSRFdBUkUsIDIsIEdHVFQsIElPX0JVUywgIkdsb2JhbAo+ID4gPiBHVFQiKcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoFwKPiA+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV90bGJfaW52YWwuYwo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV90bGJfaW52YWwuYwo+ID4gPiBpbmRleCBkZDEwMzBkZTlhYjYuLmRhNjI5ZDQxMDgyOSAx
MDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RsYl9pbnZhbC5jCj4gPiA+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90bGJfaW52YWwuYwo+ID4gPiBAQCAtMTEsNiAr
MTEsNyBAQAo+ID4gPiDCoCNpbmNsdWRlICJ4ZV9ndF90eXBlcy5oIgo+ID4gPiDCoCNpbmNsdWRl
ICJ4ZV9ndWNfY3QuaCIKPiA+ID4gwqAjaW5jbHVkZSAieGVfZ3VjX3RsYl9pbnZhbC5oIgo+ID4g
PiArI2luY2x1ZGUgInhlX2xvZy5oIgo+ID4gPiDCoCNpbmNsdWRlICJ4ZV9tbWlvLmgiCj4gPiA+
IMKgI2luY2x1ZGUgInhlX3BtLmgiCj4gPiA+IMKgI2luY2x1ZGUgInhlX3RsYl9pbnZhbC5oIgo+
ID4gPiBAQCAtODYsOSArODcsOCBAQCBzdGF0aWMgdm9pZCB4ZV90bGJfaW52YWxfZmVuY2VfdGlt
ZW91dChzdHJ1Y3QKPiA+ID4gd29ya19zdHJ1Y3QgKndvcmspCj4gPiA+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+ID4gPiDCoAo+ID4gPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHRyYWNlX3hlX3RsYl9pbnZhbF9mZW5jZV90
aW1lb3V0KHhlLCBmZW5jZSk7Cj4gPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBk
cm1fZXJyKCZ4ZS0+ZHJtLAo+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCJUTEIgaW52YWxpZGF0aW9uIGZlbmNlIHRpbWVvdXQsIHNlcW5vPSVkCj4g
PiA+IHJlY3Y9JWQiLAo+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGZlbmNlLT5zZXFubywgdGxiX2ludmFsLT5zZXFub19yZWN2KTsKPiA+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX2xvZ19lcnIoeGUsIFRMQklOVkFMLCAtRVRJ
TUUsICJmZW5jZSB0aW1lb3V0LAo+ID4gPiBzZXFubz0lZCByZWN2PSVkIiwKPiA+IAo+ID4gQ2Fu
IHdlIGtlZXAgdGhlICJUTEIgaW52YWxpZGF0aW9uIiBwaWVjZSBoZXJlIHNpbmNlIHRoYXQncyBh
IGxpdHRsZQo+ID4gZWFzaWVyIGZvciBncmVwcGluZyB3aGVuIG1hbnVhbGx5IGRlYnVnZ2luZz8K
PiAKPiB0aGlzIHdvdWxkIGJlIGxpdHRsZSByZWR1bmRhbnQsIGFzIHhlX2xvZ19lcnIgd2lsbCBl
bWl0IGRtZXNnIGxpa2UKPiB0aGlzOgo+IAo+IMKgIFtkcm1dICpFUlJPUiogU0lHSUQ9MTA2ICgt
RVRJTUUpIFRMQklOVkFMOiBmZW5jZSB0aW1lb3V0Li4uCj4gCj4gdnMKPiAKPiDCoCBbZHJtXSAq
RVJST1IqIFNJR0lEPTEwNiAoLUVUSU1FKSBUTEJJTlZBTDogVExCIGludmFsaWRhdGlvbiBmZW5j
ZQo+IHRpbWVvdXQuLi4KCkFoIG1ha2VzIHNlbnNlLiBZZWFoIEknbGwgZHJvcCBteSByZXF1ZXN0
IHRoZXJlLgoKV291bGQgYmUgZ3JlYXQgaWYgd2UgY2FuIGdldCBhIHZhcmlhYmxlIGZvciB0aGUg
RVRJTUUsIGJ1dCBpdCdzIG1pbm9yLgpNeSBSLUIgYmVsb3cgc3RpbGwgc3RhbmRzLgoKVGhhbmtz
LApTdHVhcnQKCj4gCj4gPiAKPiA+IEFuZCBzbGlnaHQgbml0cGljay4uIENhbiB3ZSB1c2UgYSB2
YXJpYWJsZSBmb3IgLUVUSU1FIGhlcmUgc2luY2UKPiA+IHdlJ3JlCj4gPiBub3cgdXNpbmcgaXQg
aW4gdHdvIHBsYWNlcyBpbiBjYXNlIHdlIHdhbnQgdG8gY2hhbmdlIGluIHRoZSBmdXR1cmU/Cj4g
PiAKPiA+IE90aGVyd2lzZSB0aGUgcGF0Y2ggbG9va3MgZ29vZDoKPiA+IFJldmlld2VkLWJ5OiBT
dHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPgo+ID4gCj4gPiBUaGFua3Ms
Cj4gPiBTdHVhcnQKPiA+IAo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgZmVuY2UtPnNlcW5vLCB0bGJfaW52YWwtPnNlcW5vX3JlY3YpOwo+
ID4gPiDCoAo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZlbmNlLT5iYXNl
LmVycm9yID0gLUVUSU1FOwo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhl
X3RsYl9pbnZhbF9mZW5jZV9zaWduYWwoZmVuY2UpOwo+ID4gCj4gCgo=
