Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCEF606A33D
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 08:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=InEvDz+C;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=bSljV/dB
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A99D10F17A;
	Tue, 17 Nov 2026 08:28:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB23B10F15F;
 Tue, 17 Nov 2026 08:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794904121; x=1826440121;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TLk1jE74XcuXFsZkYcAQn2w70wZV867CuF905ec/cbw=;
 b=InEvDz+Cv691H3ItnsM/he7tdpWnAbtZdPJURgVfJnQkaJFCfOLRpmBd
 bVpyinImmASeF56PWqezstz1eGd2qV2t1F9h/5FY2lQefay8cG+ak4HY4
 jGRIRO3oQWISLXUOHbx3Oq55nLTgoy1KMJu6Jgq2V9JOz7DYFrLXPDG2f
 bL7t7DEvchbv11pMS5HUECCXMqPxT8kDBCL0oDzt1b/hpiwMhEdM9Smw/
 VegCkM8v6FYJAXVGt+6QQMkP7QLTnWUyLSFauHbRcL98B0zzrw9NA75En
 QUVYQkGXkmYdrb0Ux3Tpd7LuN2V/reeJ3EgPfFBSCCWYXCgBP+4P3rdls A==;
X-CSE-ConnectionGUID: azrLCkupRp2KzzbDtbQ+TA==
X-CSE-MsgGUID: KnNs70KzQTmL1hk2RCj1fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3686557"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3686557"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 00:28:40 -0800
X-CSE-ConnectionGUID: Q9ZE6X/FQxWAhth81Z/wPw==
X-CSE-MsgGUID: WIfjpU2QQjKrqffZkh1WCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; d="scan'208";a="11515875"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 00:28:40 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 00:28:39 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 17 Nov 2026 00:28:39 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.36) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 00:28:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eoO2Lu8JfDvoE0N8Sd4R8NPDoNE0OLqJgC9ifAPW9S0h/up3V8VQxdIdAuC/rR2cqh8vAGt51lO+D4qg6BtW5bCw0FR69ssu8ypqS+/zPyxvvJxm4fB1+sW8BqiIMvcBfs0MKoXAS0io9//SrORR+ek3L4iT19lRgiUO4hmSn3z3hlBSxilVK50hghS0GacaxyOZRBKzLiffufFCbAj67auPxuEZsw/oJn3VsyXP9/DkV8+ie8VqQUfKwCU/qbSimwA0KZLHlwNxjRZWSOlxATAQbGuv7B9tL2JrcTx3qiYevDrexXJ7OF90XNngMkd+pEp622fKbeSQoEMyN6gQmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TLk1jE74XcuXFsZkYcAQn2w70wZV867CuF905ec/cbw=;
 b=pAc3rxZyLNGHPghhvzquG+EmMbPGZG7xOqs0yhgZ/k0NCdVTTpfdS3SJTU1FoJqVAKxRPaf6zSjpl8hxTSU0Obd2SPyywz3RLJ18HqAonN4s8Pw0A+38B9kyU3gxAENc0x/91e79HLPBKOvJH1fvaWTLnOaX4I8AAT2R0NpUo8hqwhxwzycdq0x95WQ8OHfjn1nSe71Aiu0ObYhFaSloxVX/hq5rfafJ54M5+Nz3qMzQT1Wmnao+GI61AkQLxnOEU2AXaWyzDCNRb+1THlteFjUHnjD5h3bXQQQR0vtRcfjH67vDvMg5lrtQCpP4iPsMEAJpaY4LmSul4GNtQkyS+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TLk1jE74XcuXFsZkYcAQn2w70wZV867CuF905ec/cbw=;
 b=bSljV/dBdW39kra2xuthaZZXSNJjNrY0GOMQv5d/BjVvoeLTZ5zb0ordiyCalomt+VvEbRtWznpCPIp7PD39tCR7XTbiF3LRybNBMJYV+NEFVHzCUDdAGN3rKRRDFOxAo9LILFq2NGGrNkgT1R0lwSXoKFXKmGvepswxi0EADMA=
Received: from MW4PR11MB6570.namprd11.prod.outlook.com (2603:10b6:303:1e3::6)
 by IA4PR11MB9346.namprd11.prod.outlook.com (2603:10b6:208:55f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 08:28:37 +0000
Received: from MW4PR11MB6570.namprd11.prod.outlook.com
 ([fe80::63e8:6dc8:402b:36d1]) by MW4PR11MB6570.namprd11.prod.outlook.com
 ([fe80::63e8:6dc8:402b:36d1%6]) with mapi id 15.21.0615.009; Tue, 17 Nov 2026
 08:28:36 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>, "Syrjala, Ville"
 <ville.syrjala@intel.com>, "Heikkila, Juha-pekka"
 <juha-pekka.heikkila@intel.com>
Subject: RE: [PATCH v4 2/2] drm/i915/fbc: Apply Wa_14028723391
Thread-Topic: [PATCH v4 2/2] drm/i915/fbc: Apply Wa_14028723391
Thread-Index: AQHdcP9G78LomkGhaE6RrZhyLybUsLcx+TNg
Date: Tue, 17 Nov 2026 08:28:36 +0000
Message-ID: <MW4PR11MB6570959FF3A202196747C6ADEF7B2@MW4PR11MB6570.namprd11.prod.outlook.com>
References: <20261110103513.176529-1-vinod.govindapillai@intel.com>
 <20261110103513.176529-2-vinod.govindapillai@intel.com>
In-Reply-To: <20261110103513.176529-2-vinod.govindapillai@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB6570:EE_|IA4PR11MB9346:EE_
x-ms-office365-filtering-correlation-id: c64704ef-1612-443e-8edc-08df4484c6a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|10070799003|1800799024|23010399003|261102123227099003|38070700021|10067099003|4143699003|260925022911599003|260925021311599003|11063799006|260925021911599003|56012099006|261028144727099003|261026140227099003|261021123027099003|261022105027099003|261021121427099003|261009223027099003|22082099003|18002099003;
x-microsoft-antispam-message-info: BLnJeI0XGTvqoJ6wDUkafkJ/Bgo8mS+EQ7sOkFztdKYdSr6F8OUyHlb/nT/5Iud58cfd1+sL6r+u7Ibs5QhYQ76n3dB3NGOXBuZXqbYjxNYxr3SxHEQteHW+eXzbkGZsXHwuzdGNeRKKvkKhgYIR8TXr/4VHcZqV7j64rRmfMJEBVKPFrFA9Aaxpu8RvCRSyeP/Y16ZYC4Sk/H1w5PExEtZ6J+pSufBVNHEzPDY/RX+3kuyEQN0kw58rudkh3ovBS3s1BFcfQGpvHJFJ1hZxOPZjNVNLgeEHWTtlUsm8SIfXwOQ2A5I89lMozaow/HbttBuFWVyTyzYecm/LPog/CPhKdSAfq2XZTU0B5ySnr7lgsKl+Sp9133sFAKbj9JhUHk9FIM6OOktosvlHmYeEgWrvJNXPZW0frRHPQj5w595nPiGeaZf+yxjgkfjgZQTfH/nExB0JXMwB7taepHw631iZklGs0jUn/9/pc5/Lepp9COD/PN5pIkjJfPeocioo8Il3OAHaAPoNaArQLol8qZxZfhS51EUZ/D+eMeY1cw+SpWoujOdgIZ/fe2iGSbWe9ehR4IdkSWkJxmWNH1U+uzQqpRliffvVl2fLXq7eQUj8SbNgZYWjgD7qpWpSWhJwB6yCuWkEZyR0lPJOl8rfz5iR4HfJSvNW4FdCtPT4ueZ5AKX2BIH5ObVhtT9lFhDzOpiDuo9okVuWbvlcf0gaTvJ0bH/ehAvnvBSckD4cGME=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6570.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(23010399003)(261102123227099003)(38070700021)(10067099003)(4143699003)(260925022911599003)(260925021311599003)(11063799006)(260925021911599003)(56012099006)(261028144727099003)(261026140227099003)(261021123027099003)(261022105027099003)(261021121427099003)(261009223027099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NTl4bFR4c25LNGxlTzBCTXdoK2kva3BkMW1sMjRnSUFzVktzVDNidWlUL1NW?=
 =?utf-8?B?V0NMaXM3TkluTlRXRUtBTVpGQ3U4MFEzMG9yRHBpUmZLNDJOdUQwbXdYQUZ5?=
 =?utf-8?B?NWdhazVCcCtPRndMTm1WSHJGMWc0cVpWKzFWUG40eDNGOTRoREs0VHRVcXpT?=
 =?utf-8?B?R2d3bnBleUFsN1NjVU5XdnQ1bTMyM1VHT3JvTXN5dW9wWjE1TGVOcFk1SDQ3?=
 =?utf-8?B?QW9YZC9IRkhtc3NlZC9lZDBqaGZVcGxSVFYyT24wSDRxYWVVSHVwc0lHelR4?=
 =?utf-8?B?N254Q2E5Q1dmYjJhV3ducm1LdzN4VWNDUVNvdlh3R21hRk9ScEhheHljVlc4?=
 =?utf-8?B?OFI2Vkx5c2UyZFkyMmcxZUlleW04bWU4RUZMOFp3dTBiKzBQZmM4YmNBQVQ3?=
 =?utf-8?B?V3pwMVRNZVBYMDBkK3NIZms4OFJ2TEJZbXh4SmlEbVp5UU1XeTRhcC8zN1hH?=
 =?utf-8?B?bW5FNVBKbEx4dmhWTVA2ZTBPNHZkdjhLdXpmYjl3ZkVYd3NCSWNuQVY0Wko3?=
 =?utf-8?B?dXhIZm82cXNkMjNvR1BqWmdNZGNvQ1RqNVRXdnM5U2ErY253b2MyY2hGZVJS?=
 =?utf-8?B?bFh2ZTlpMVJTT0N2SnljSlo3b05DTjRpNk1lNDVKZjZyL09WTkRrazZTdGtJ?=
 =?utf-8?B?Mk16ZXZVOTRvRVhLNks0WGRDVkZ0dEdza2tIM1h0cUtVcWdVTEVibDdMQTRJ?=
 =?utf-8?B?STNxTjJsZkVHa3Q4V3BzSnVXV2JDb0lSbXNjWXBNcmNjYkpQdHdUbHhNNE1J?=
 =?utf-8?B?STZQQWJjUVd0ZFVhcEk0Sm9NbGhidXZCandIcWljR0NhMnlxZG9PWktydlEv?=
 =?utf-8?B?b0QwRjNzbWV5Wjlkc2xCa1hGUncyY0FlVWt0NTVQNC9wNTloYmpXRDBrQVFu?=
 =?utf-8?B?YnRvV3J3NHhqM0RwUE9iVGlJZGZzVHJGb2tLRGhPR0h1RHZBM3lyek85amww?=
 =?utf-8?B?V2lsa1Nwbm1VSzZjbEFDdE1uRHFOcjFqWmVqMDJLMUxURDYwd1FYSmZRTCtI?=
 =?utf-8?B?RjEwcVB1SjJWV28zQkFXTVZHWmFTQUdRUytjdEloS2hQMjg3QkFYOEVvVlh1?=
 =?utf-8?B?Q1p4aWxSUDlzLzRwK2RPdCtXTllaTW9wMGR0N09FbGlXRnZER3N6ZXpPWlFy?=
 =?utf-8?B?aGhyVEdJWXhlUXNSMDNHRm4yelR6Rm1hd09qdHF0ZVBrYlRVTG1tektjUjRv?=
 =?utf-8?B?NitoQlorTWpZQ2xJNGJXL3RBN1pVR3JucEswSnVPbUxUTXhvcWx5SXdJZUFQ?=
 =?utf-8?B?OGFhdGJJZ1Y3aENjUVlMWHJ3YWVWcDhoeDNKZDJ0TTArcWhmOHZHSUhEU3Yy?=
 =?utf-8?B?bTIxMFd5YklRTk04cUVPVGxYaGljbVFDaTlYRWYvS2R3R2tEOUI4MVIraHJr?=
 =?utf-8?B?RitwTDF2Y1FkWDhNdG92QjIwcjRCRnlaQ0RxcWxVYTI0TE90QWJSMXBGMWc5?=
 =?utf-8?B?VHRHNG1tN1V2MVR2VTlVQnFyaXpYOUhKZTBMMUFHQWtFS0Y0QWpsTmpZSlFv?=
 =?utf-8?B?MThEYnRocnVDNmdoZHBScms3a3hSNTBSM3NpK2FtenV5b0pHVmRGb1JCazF0?=
 =?utf-8?B?dEFhbGI5L0NpNkFwdHNjRDdZbEE0WWpvaDBEUlhhalZDVnI0SzNkTVpDUit6?=
 =?utf-8?B?YXBhcEc4SzNQVkFjMXg2Tnh2QWhzQVYyaEdJMCs2Z0ZtRGhySEFkT2V0VDFx?=
 =?utf-8?B?Yjk1bFEvNEJCOEovUUUyeFp0dWhxL0dseDF3QlNXSVlYdG45UDhMWnY0Nk1y?=
 =?utf-8?B?TzdGUkZpNHNCUnpXYmUwZCtBTHk0RzBUSThrY3REcDRzejRLLytnRHBFOVpp?=
 =?utf-8?B?eWxrZ3ZOVEE3REdHL0dIaXZNQzBkTGJwaytyS0s0QWUrMGIyZnBkWXlPNjcx?=
 =?utf-8?B?aHEyM3ZpeHlUY0NCRUkrd2ZGenoxdG4yYUtLam5IYVNiWEhGTlQ4bm1KeGxF?=
 =?utf-8?B?U1RpS2prQy82eks2UHYxaForMzhLR2FhY1ZuR1g0dG9KRFQ4REpBclJTNGFK?=
 =?utf-8?B?Tkh3VTR2T25MTVQwYmdOYWR6bFlrMnY2bFcwRS94djd4cGtvZHZCdW1teE0r?=
 =?utf-8?B?SmhZdmlSODV0Y3lHZ251V2lpckRqNmN3UTJURDZUb1F5WHZRODVyUmVoRUZT?=
 =?utf-8?B?Y0tIbzN3RERwUmZCNHdMQmJWNDV4cHZLblhYSW1GcVFlNjJZblVlUGNOdlhs?=
 =?utf-8?B?cDFrVlZoYUtPelBaOE9DTVhPMkFGVVN6TVQ0VUFUTFNqUnRPcTNrcDlUR3Z4?=
 =?utf-8?B?ZXBuL3hDMkFqOHZ2RVRPNk1qZnNrVk9tVnU0dm5LbmdHRE1CeXh1YWlDd1RO?=
 =?utf-8?B?Q0pZcTVNVUlwd0pBWWcrcGg3Z1U2RWd5ZlVJc1JhUDRieVlvVnBiYnlBNkY5?=
 =?utf-8?Q?sbyqz1gx2uON3wmNVubfwmyWXWyE0pAp0uuYK?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ofJ533NWr0tNH5xQmuTaH46dU2a/Z2b6pskKQ8eOoKaGqh4N7Yo/uFFwla2CmHuTYxdSxLozOVWewr6w+BgnS8kJt3zQmNwCrQ9LlCHmhWUjq1fZc0/PudWrYbvL03q1OUrXbIOyhOzHT5jHfnsy4I3/ymjbXR651cVQfntev4C6JWBsgXkY+zpRxP8RiiM+3UuAAGd17LDWG4Byjo/iadV1jeK8XZCbMyR2sjg8MEuawBYJpQvKw0bce5nzZxZHoSePYIpOaI2SvEUu8S/TOMRxtSr7UGR3BGHpxEyUyOUnfKg4nm1hpj3TnS0lVTvyVCWGMp7ze4YP74M4fJTSog==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6570.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c64704ef-1612-443e-8edc-08df4484c6a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2026 08:28:36.8396 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oi5Hk/N3ofGySqxrtr8zweIY+B0kkHZlv8W5JXkHIzoHea0fWz7d8IS06uS3zar/1fRKtVTnszS8F7At3v6REg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9346
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBJbnRlbC1nZnggPGludGVsLWdm
eC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIFZpbm9kIEdvdmlu
ZGFwaWxsYWkNCj4gU2VudDogVHVlc2RheSwgMTAgTm92ZW1iZXIgMjAyNiAxMi4zNQ0KPiBUbzog
aW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnDQo+IENjOiBHb3ZpbmRhcGlsbGFpLCBWaW5vZCA8dmlub2QuZ292aW5kYXBpbGxhaUBp
bnRlbC5jb20+OyBTeXJqYWxhLCBWaWxsZSA8dmlsbGUuc3lyamFsYUBpbnRlbC5jb20+OyBIZWlr
a2lsYSwgSnVoYS1wZWtrYSA8anVoYS0NCj4gcGVra2EuaGVpa2tpbGFAaW50ZWwuY29tPg0KPiBT
dWJqZWN0OiBbUEFUQ0ggdjQgMi8yXSBkcm0vaTkxNS9mYmM6IEFwcGx5IFdhXzE0MDI4NzIzMzkx
DQo+IA0KPiBTY3JlZW4gY29ycnVwdGlvbiB3aXRoIEZCQyBlbmFibGVkIG9uIGEgcGxhbmUgd2l0
aCB0aGUgRlAxNi4NCj4gVGhlIHJlY29tbWVuZGVkIHdvcmthcm91bmQgaXMgdG8gZGlzYWJsZSBG
QkMgaW4gY2FzZSBvZiBGUDE2DQo+IGZvcm1hdCB3aXRoIGFscGhhLiBTbyByZW1vdmUgdGhlIERS
TV9GT1JNQVRfQVJHQjE2MTYxNjE2RiBhbmQNCj4gRFJNX0ZPUk1BVF9BQkdSMTYxNjE2MTZGIGZy
b20gdGhlIHN1cHBvcnRlZCBmb3JtYXRzIGxpc3QgZnJvbQ0KPiB0aGUgYWZmZWN0ZWQgcGxhdGZv
cm1zLg0KPiANCg0KUmV2aWV3ZWQtYnk6IE1pa2EgS2Fob2xhIDxtaWthLmthaG9sYUBpbnRlbC5j
b20+DQoNCj4gU2lnbmVkLW9mZi1ieTogVmlub2QgR292aW5kYXBpbGxhaSA8dmlub2QuZ292aW5k
YXBpbGxhaUBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9mYmMuYyB8IDIgLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZmJj
LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiYy5jDQo+IGluZGV4IDJl
NDM3Yjk2OTQ1MS4uMjZkYzhiMDg4NTIxIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2ZiYy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZmJjLmMNCj4gQEAgLTEyMDUsOSArMTIwNSw3IEBAIHN0YXRpYyBib29sIHhl
M3BfbHBkX2ZiY19waXhlbF9mb3JtYXRfaXNfdmFsaWQoY29uc3Qgc3RydWN0IGludGVsX3BsYW5l
X3N0YXRlICpwDQo+ICAJY2FzZSBEUk1fRk9STUFUX0FSR0I4ODg4Og0KPiAgCWNhc2UgRFJNX0ZP
Uk1BVF9BQkdSODg4ODoNCj4gIAljYXNlIERSTV9GT1JNQVRfUkdCNTY1Og0KPiAtCWNhc2UgRFJN
X0ZPUk1BVF9BUkdCMTYxNjE2MTZGOg0KPiAgCWNhc2UgRFJNX0ZPUk1BVF9YUkdCMTYxNjE2MTZG
Og0KPiAtCWNhc2UgRFJNX0ZPUk1BVF9BQkdSMTYxNjE2MTZGOg0KPiAgCWNhc2UgRFJNX0ZPUk1B
VF9YQkdSMTYxNjE2MTZGOg0KPiAgCQlyZXR1cm4gdHJ1ZTsNCj4gIAlkZWZhdWx0Og0KPiAtLQ0K
PiAyLjQzLjANCg0K
