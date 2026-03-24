Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BEEFEC118
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 21:15:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A83010E10A;
	Tue, 24 Mar 2026 21:15:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P9UFj4C2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B98E010E17A
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Mar 2026 21:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774386922; x=1805922922;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=w+JIwd9MQXhDzGw2dnE6ULZI8PfvXEhciZDh0Qr8tdc=;
 b=P9UFj4C2M2x5ZJWEM3BMg7YCGMx0/JaWJU+L3LuGiI+/QWw2Gevo8rE7
 k7ZZdJ7p59M+g/RtND/mSY1gcxhAOPJji4H/L0HczymWQxy3V2tR2zghA
 Y7R5zwYPc714ISzXgi4Co4Mk+crgr6ycUxF76SnbVMNtqiYJwsgsbU07k
 phu5NXD05CqILFeIJ4Q4kBbkMRb1Am25H9WukBMNZKsypWTM6/7dNRe4b
 oWbldhLwVTB1OBwbA9XNWWXbWUpv+iwrxwEN+3ysm2cBnicBHyDMh2Sdm
 we1TcIIzer+3tQE2dRG02AZImPk87WeDbylTnHmsz6qqEGmMRuO7SGk+/ A==;
X-CSE-ConnectionGUID: 5twCg0mgQ3+7Y2LxsS6zEQ==
X-CSE-MsgGUID: oeVEeDvNT2ere6pqkJIJ3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75610212"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="75610212"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 14:15:13 -0700
X-CSE-ConnectionGUID: TM1+h63fQ1aj04aB8pUrNw==
X-CSE-MsgGUID: Ehj1oYMnTPyy722A+I2yOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="223684504"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 14:15:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 14:15:12 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 24 Mar 2026 14:15:12 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.45) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 14:15:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lZyVwJoXFrMWibkYUQlr/S1HQhlZILG2golJkRE2QYMQ3iYw06Mq7kW0BWg8k3EkVE6+6nyfL1p38PGkE6PCfySb4Mwdc6Kl7WyX33oasK1TIySg9l8RLSJiaR3Zcmy91BU7WC8mSpNeskDLyaQa39qnoFgDss6SYIoUSpoeuWQ50A2dMgGwdAjNLEDWqHqnherW0npZH5bkyKh5WtSRpRmUuHQqM5MpWglntcH2eBlvH8WvANWte2g7qBB49sDTeXxOWA4SBm3Ea0+u8ILPpma1h/9VMfx2DtbMsTWf6b3yAm7q2jOaRviks3vgYv5Epa6/uDWwvP4TM3oNKo5VxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w+JIwd9MQXhDzGw2dnE6ULZI8PfvXEhciZDh0Qr8tdc=;
 b=Ua6dkGjy7enFisUF8rNeMMaN7E6X6sZWGtRye8gKvRFDF6JdslpXiPClvhv2YLrsyrlMQ3T9gkb7H2BeutbIIOXACyXYq4WzZj/FmVVpQvPeBBQ8uXC7RENrkdT+w2LyntYcSLou1hoev9IlqdZzKb3D5uqckBhz/jBEbudPBZ9/wZpdGpiSODQWfh7XJFE5kIcgOnZiGAV9DFkwCMUYAiv1C3PtGFwrbAptLwdY5I7b0BmbwItye2cSKIuAXJjJY91syJ03xo1ubtycm7YMXcdYNwE5GZ5myp95iP8kJZIKRaILP/gvOI0vSMxOA3ypp27ebFZLUUOsxF9LFz/6CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SN7PR11MB7568.namprd11.prod.outlook.com (2603:10b6:806:34e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 21:15:09 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 21:15:08 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Kumar
 G, Naresh" <naresh.kumar.g@intel.com>
CC: "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v3 1/1] drm/xe: Set GT rp min frequency as 1.2GHz default
 for BMG/CRI
Thread-Topic: [PATCH v3 1/1] drm/xe: Set GT rp min frequency as 1.2GHz default
 for BMG/CRI
Thread-Index: AQHcu7wXfTAVayxqMEaE8ZgNbr1YMrW+LxoA
Date: Tue, 24 Mar 2026 21:15:08 +0000
Message-ID: <41a25e7636ae6262818c51974cd2e602178cdb21.camel@intel.com>
References: <20260324182136.709386-3-naresh.kumar.g@intel.com>
 <20260324182136.709386-4-naresh.kumar.g@intel.com>
In-Reply-To: <20260324182136.709386-4-naresh.kumar.g@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SN7PR11MB7568:EE_
x-ms-office365-filtering-correlation-id: 0b87c7a1-1eb3-4a1c-cba9-08de89ea6dbb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: 2Ve6ZnTtXHwiDaNbErkKO2cZcrgsxyA1B5ioEbMX5NDHLp+8XYXqpsIb519WlLjDElcysb9wu8xPToP0zrxhhewjdIGhPZxn6myYt929IwsVxqc+b2DQn7mH0MyMmglIJ6rtTvw09KtPKAXznK3jjNpBwcXq2slPstRkkMPJCRwTJlgwcmJcxYaHMCf/eKclkJYJX4n1zrsdm9RGEQTs+8L8oevI5gYqJA74MUm6aZMVcsZ+QSYciJGRTl5xMmATuGdlApx97vML38ryeHkZGrXExa4p1dDKAscrTxTzTwHlchPEcssDyqYPHKQTMQNLuWzobkcUPUDj3I64T47J3V8USIfXjVrGCk/3PwK9fazTqQesMgE0aEcxL4XydaJg2RGmXiV3vXYErS8Nx/H2X2qG80V21GOSZhi6NDz7dNfH7NW1T4vPfOVBsZfHhHNtwrbQ2gtW/B/pXARmMU2w75QCkhCZkEHfPg14zzqEOHmBpzjGCptmTkg4CcfVASli7D1j5RXT16h7lEpASQaNvKwtl3k3nqXO175IspQJsmlnXpDmwPwTpCawgGN2VBkTrNp0eZFIB+WjN5mIk5jxtM4VGWoLlivk9ua4sEwCCif5dnnW/MHhHRSmuxeac1qWrVhrIAhtha2h4bF0EK/x4ZIT55yU3wqj0MZ+gOK6utS9m+u4ZYgoAvsN7QZ44B2XwW8JVR75nYzRc1RIm2P9owpUjdQK3QF5qEOCrzn37XEX+reFv2vDrRr0dGpokiQoxOlybx6MzQ3HXZSw1zgCmDlXRmLd4kSdix8D/vIvSrk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YjB5TUdCbFRWakxXMU8wUXBuK2VhaHZOMGMxRDc3TVZmMEdUUkZNWmxBckl3?=
 =?utf-8?B?TmxYVW8zcndzZ09XYUJuTWF0NWwxbGFpcGE2MmlOVTRrNG8yNDlYL00rYzdz?=
 =?utf-8?B?KzdKUVdpamFhQ01uK3VaTjZzdGExY3Z4Ymt5WjU1RFBURnVCMWV1MTh3RGM1?=
 =?utf-8?B?amNZaW9vR2tEdHNrRjBOLzNpcXh1aUFCUnFLcmd5N0dqZjU2bThJeG5lWnhj?=
 =?utf-8?B?Z3VSUjBYYzdreHdyRk11UlhaWXYwL0EreXpOVUc2RGF2UkVXVm9xNWFQbnRx?=
 =?utf-8?B?eUZibUtNMzZHcGxrRHR3d1lVNHlHR3JCME1wQTB5MDZWVUtnU05oZVpTMGg1?=
 =?utf-8?B?cHJxOHEvV2JJM3B0VU13cWVzby83eGJRbU5ReGhVUU9HbXhKQngvVGxIZ3Q0?=
 =?utf-8?B?ZHBvaW90TDlPN0d5UGZ2MlhUZXJjSndZTHlqNGZUcGZGVnJDaFhPZ21GY0Rw?=
 =?utf-8?B?dnZNWk5pN0VzanFRWjJwNHBYTHQ2RlhwSzlSeTdhZ0pRQ1BKR2xHQnIxZjFG?=
 =?utf-8?B?Q2lCMEdMaFYyNDJjRGp3Z1dJZS8zc0dVYTZiMzNUUVhpNWw5RHArL2Z1WVNL?=
 =?utf-8?B?TEZua3k1c1hWeGc5UVBuQ0tNR2hocTRVMlYxbGs0RWFHd0YzYS9wdSt3aCtB?=
 =?utf-8?B?Zi9SUjFxbEZZd0hMd2czWnBmMnBYMDJyWGhtekx2MUxoOGVYeTZKNDMyeDdW?=
 =?utf-8?B?ZC9kd3pnOE8rUnJ6K0VxR3BwTTN2K3Y5SGxQK0prcForanh3WUtxU0lxQkFL?=
 =?utf-8?B?dGN4d0MwT2ZuUnIrU2dBUXpFbm1EU1hiQjdLWjZ2MnNyQ0hXdjcwd3hqR0lJ?=
 =?utf-8?B?MWdZUlgxd2JhTHFPMUxzMjRUTkU5a0lHNFZaL1A2Y2tCMVJjOWlNd1FLaGpx?=
 =?utf-8?B?bXgrRlREd2tBZkx6YUxjd1R1aTV6dG1sQ1ViQkZXVDhZZ1V4dGpRRTRjTTRp?=
 =?utf-8?B?NlJQMkdQOENLRmFydEkzZlM1WllBYkZUdEh4YndDamNYL0hGRG9ETkZ6eXdM?=
 =?utf-8?B?SmxxQ2JxR2FDbnFQUG05YlMwZ1VFUTh4QVdqK2YrMndiSnA4eE1vL3g5WWNt?=
 =?utf-8?B?RGx4Z1EzVERSaTJma0c3MU1SSGtJa2hIdDlLbVpHWEI4cWRaYVVzcGQ5NlZp?=
 =?utf-8?B?eG53aE53K3MxdFNxb3VoeDgyU3UzQTVaazE2dkY3SkYvRkVIQjRlZW1QRitJ?=
 =?utf-8?B?MTQvbk5TU2E4MiswT1ZicVJsNWlGZHI2MXY2QWtZZlNCaE9VOEU3Zy9vSVNH?=
 =?utf-8?B?akVBZ1R1eEpOUkk0bGRDQjZya1JZVnhGY3VYaDExWGhETkh1aXlvbjBSRllS?=
 =?utf-8?B?TnBGeVdsK0UzUGFtRTFPVkVab3pXb3R0RGtLM0F6RzkxMW9yVUxBWXNuMEU3?=
 =?utf-8?B?aXhaV3c0cFU3WVp4MWt6aGw3SlU2Ky8xT0tmaE1QZGpjcHZzUzFDZWFhWG5X?=
 =?utf-8?B?bkJPaFAxa0h5MHlhcTBFVkJsbWVMV1Rzc0VMMUMrSXpiRENTOXpqL0lvK2Zj?=
 =?utf-8?B?RnhZTnhVVG41MlZGZVkweWhZUXhqdzV6Z1JteUY3N2VtN0hlTlhXcEY4RDB0?=
 =?utf-8?B?dk82aHJtT1UzeFloTE1vZWpES29WOXBKb0NyZnBlYmtkdWV6S2ZuVk5uTVlZ?=
 =?utf-8?B?UzNDTVJjNHQvOUZYVlFLK1hCSndoRFZmNWlPR2FrQjhGQld3MysrbjdkaGYr?=
 =?utf-8?B?K1pXNnFkWUlDSlJiL3h1dEc4a3JjM0QrczkzcTVRYjdvUE54R0t3cHloaVdv?=
 =?utf-8?B?eGlHNnZxZWUxSG9LdGxBbG9SY0YrdnVGbG9GdVd4cVppclhNWisyVEszeldS?=
 =?utf-8?B?ektvaUU5OGsvV0pncGtnQ2NHY3crUm9SUFhGVEYrZWV0YktnSnlRSThwTWZC?=
 =?utf-8?B?ZWI0eS9CVkkrN000dUNHU2E2b3FJdnd4d3pEeEd2Y2puN295L0lkOEFQT3RC?=
 =?utf-8?B?Rko5VW40THBZaWlxbzc4ZEZKSGI0aU16OU4rZXR6QXlMNEk3RHJZeGJ1ckVt?=
 =?utf-8?B?Q2pIZkh2LzFpUFFtYTFtQjdKM3RVOXB6S3lTMEh3TFpNWUxCbGZjTHBjekhw?=
 =?utf-8?B?OWZNVnV5dkEwYkU1eWFxWU80d2srYkorTlFvbmNVRGYyM2NoTzVWNElCT0JC?=
 =?utf-8?B?M2kyZ294ZDVUdlpOS1FOV2RMbklOYTN3MXFRT3U2VzIxUEt3QnhRWENndE9h?=
 =?utf-8?B?My9wUkZOemtkakRCbmdQeVV6RVM1TmZ4OVo3Y01sQTRNcFFxTHdKNzMvODhF?=
 =?utf-8?B?WnJmN2RwRDl4czJBeUR4NC9wYXFIeGV4VjdFZ3UrZXJOZXRrejQrYk9pM0k0?=
 =?utf-8?B?d1lqcU9sbGo1cFEyemtHREZJQnMyQ3M5NHM2SkFpd1lqSktrUjJkL1lYeEtR?=
 =?utf-8?Q?mApudBT5eKHb4O6M=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0EF50A587288424988977A67787B6773@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: QkKy+3zU2rKJv0z0wuk4Fc20T6svlYnm3N2uzssZ7+7MRm/Qel9zsjuupB7DFFg0fWwpI8/aYObPpDa1Ysh98NB9ub7ME0kRbp6ohXAG11GZZVk7KD5hFn20F5dzZo3QljBssdLTsw9CZQE4KS5x/wxFBBgQtYv2P0zGoNoH2JRCjFZRzmy1ImUtLohZraFOPn+zQ6OQkJ4TKiJvHXvrlo6nqluxFQEQkJu43DEBQa2QHj5WKPwDM9kYm1LL0CHsrqYfz++ICnbN0jkhKvqyAIOrBGFDMhpjjRdJ2RR2RVwmZlgbCxHoRcTQL3dfAfJZ5U2dzRj5dDJRiz9rHtWzVg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b87c7a1-1eb3-4a1c-cba9-08de89ea6dbb
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2026 21:15:08.9476 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uwDbsGWEyNFwVu0wL8gA6bieFw6XVqhTp1FCX1gK63jy4xI38hmK/euntz0/zUPZ9h8x4Zt9BTEQcBsOBsbQDaCt+s7OVVN3cO54lOcJKzc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7568
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

T24gVHVlLCAyMDI2LTAzLTI0IGF0IDIzOjUxICswNTMwLCBOYXJlc2hrdW1hciBHb2xsYWtvdGkg
d3JvdGU6DQo+IMKgV2hpbGUgcHJldmlvdXNseSBhcHBsaWVkIG9ubHkgdG8gYm90aCB0aWxlcyBH
VDAoR3JhcGhpY3MpIGFuZA0KPiBNZWRpYShHVDEpDQo+IMKgdGhlIEJNRyBHMjEoQmF0dGxlIGlt
YWdlKSBwbGF0Zm9ybSB2aWEgd29ya2Fyb3VuZCBXYV8xNDAyMjA4NTg5MCwNCj4gwqB0aGlzIDEu
MiBHSHogbWluaW11bSBpcyBub3cgdGhlIGRlZmF1bHQgZm9yIEdUMChHcmFwaGljcykgdGlsZQ0K
PiDCoG9mIEJNRyBhbmQgQ1JJIHBsYXRmb3Jtcy4NCj4gDQo+IMKgU2V0dGluZyB0aGlzIGZyZXF1
ZW5jeSBmbG9vcigxLjJHSHopIGRlZmF1bHQgaXMgY3JpdGljYWwgaW4gbXVsdGkNCj4gR1BVDQo+
IMKgZW52aXJvbm1lbnQgZm9yIHN1cHBvcnRpbmcgZWZmZWN0aXZlIFBlZXItdG8tUGVlcihQMlAp
IHRyYW5zYWN0aW9ucy4NCj4gDQo+IHYyOg0KPiAtIEZpeCBJbmRlbnRhdGlvbihUaG9tYXMpDQo+
IC0gQWRkIGNvbW1lbnQgYWJvdXQgcG93ZXIgaW1wYWN0KFN0dWFydCkNCj4gDQo+IHYzOihUaG9t
YXMvQW5rdXIvTWF0dCBSb3BlcikNCj4gLSBBZGQgc2V0dGluZyBmcmVxdWVuY3kgdG8gb25seSBH
VDAoR3JhcGhpY3MpIFRpbGUgb2YgQk1HL0NSSQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogTmFyZXNo
a3VtYXIgR29sbGFrb3RpIDxuYXJlc2gua3VtYXIuZ0BpbnRlbC5jb20+DQo+IC0tLQ0KPiDCoGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfcGMuYyB8IDI5ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKystDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3BjLmMNCj4g
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3BjLmMNCj4gaW5kZXggNWU1NDk1YTM5YTNjLi4y
YWJmYzJmZmYwODMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfcGMu
Yw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3BjLmMNCj4gQEAgLTg1Niw2ICs4
NTYsMjEgQEAgdm9pZCB4ZV9ndWNfcGNfaW5pdF9lYXJseShzdHJ1Y3QgeGVfZ3VjX3BjICpwYykN
Cj4gwqDCoMKgwqDCoMKgwqDCoHBjX2luaXRfZnVzZWRfcnBfdmFsdWVzKHBjKTsNCj4gwqB9DQo+
IMKgDQo+ICtzdGF0aWMgYm9vbCBwY19uZWVkc19taW5fZnJlcV9jaGFuZ2Uoc3RydWN0IHhlX2d1
Y19wYyAqcGMpDQo+ICt7DQo+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV9kZXZpY2UgKnhlID0g
cGNfdG9feGUocGMpOw0KPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfZ3QgKmd0ID0gcGNfdG9f
Z3QocGMpOw0KPiArDQo+ICvCoMKgwqDCoMKgwqDCoGlmICh4ZV9ndF9pc19tZWRpYV90eXBlKGd0
KSkNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBmYWxzZTsNCj4gKw0K
PiArwqDCoMKgwqDCoMKgwqBpZiAoeGUtPmluZm8ucGxhdGZvcm0gPT0gWEVfQkFUVExFTUFHRSB8
fA0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqAgeGUtPmluZm8ucGxhdGZvcm0gPT0gWEVfQ1JFU0NF
TlRJU0xBTkQpDQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gdHJ1ZTsN
Cj4gKw0KPiArwqDCoMKgwqDCoMKgwqByZXR1cm4gZmFsc2U7DQo+ICt9DQo+ICsNCj4gwqBzdGF0
aWMgaW50IHBjX2FkanVzdF9mcmVxX2JvdW5kcyhzdHJ1Y3QgeGVfZ3VjX3BjICpwYykNCj4gwqB7
DQo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfdGlsZSAqdGlsZSA9IGd0X3RvX3RpbGUocGNf
dG9fZ3QocGMpKTsNCj4gQEAgLTg4NSw3ICs5MDAsMTkgQEAgc3RhdGljIGludCBwY19hZGp1c3Rf
ZnJlcV9ib3VuZHMoc3RydWN0DQo+IHhlX2d1Y19wYyAqcGMpDQo+IMKgwqDCoMKgwqDCoMKgwqBp
ZiAocGNfZ2V0X21pbl9mcmVxKHBjKSA+IHBjLT5ycDBfZnJlcSkNCj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqByZXQgPSBwY19zZXRfbWluX2ZyZXEocGMsIHBjLT5ycDBfZnJlcSk7
DQo+IMKgDQo+IC3CoMKgwqDCoMKgwqDCoGlmIChYRV9ERVZJQ0VfV0EodGlsZV90b194ZSh0aWxl
KSwgMTQwMjIwODU4OTApKQ0KPiArwqDCoMKgwqDCoMKgwqAvKg0KPiArwqDCoMKgwqDCoMKgwqAg
KiBTZXR0aW5nIEdUIFJQIG1pbiBmcmVxdWVuY3kgdG8gMS4yR0h6IGJ5IGRlZmF1bHQgZm9yDQo+
ICvCoMKgwqDCoMKgwqDCoCAqIEdUMChHcmFwaGljcykgVGlsZSBvZiBCTUcgYW5kIENSSS4NCj4g
K8KgwqDCoMKgwqDCoMKgICoNCj4gK8KgwqDCoMKgwqDCoMKgICogV2hpbGUgQk1HIEcyMSBXQSB3
aWxsIGFwcGx5IG1pbiBmcmVxZXVuY3kgZm9yDQoNCi9zL2ZyZXFldW5jeS9mcmVxdWVuY3kvDQoN
Cj4gK8KgwqDCoMKgwqDCoMKgICogYm90aCBHVDAoR3JhcGhpY3MpIGFuZCBHVDEoTWVkaWEpIFRp
bGUuDQo+ICvCoMKgwqDCoMKgwqDCoCAqDQo+ICvCoMKgwqDCoMKgwqDCoCAqIFRoaXMgaXMgYW4g
YWN0aXZlIGZyZXF1ZW5jeSwgc28gaWYgdGhlIGRldmljZSBpcyBpZGxlDQo+ICvCoMKgwqDCoMKg
wqDCoCAqIHdlIGFyZW4ndCBleHBlY3RpbmcgaGlnaCBwb3dlciBvdXRwdXQgYWNyb3NzIGJvYXJk
DQoNCklmIHlvdSBwb3N0IGFub3RoZXIgc2VyaWVzLCB5b3UgbWlnaHQgYWRkIHRoaXMgbGFzdCBz
ZW50YW5jZSBhbHNvIHRvDQp0aGUgY292ZXIgbGV0dGVyLiBJIHRoaW5rIGl0J3MgaW1wb3J0YW50
IGZvciBjdXN0b21lcnMgdG8ga25vdyB0aGF0IGl0DQpvbmx5IGFwcGxpZXMgd2hpbGUgdGhleSBh
cmUgcnVubmluZyB3b3JrbG9hZHMuDQoNCj4gK8KgwqDCoMKgwqDCoMKgICoNCj4gK8KgwqDCoMKg
wqDCoMKgICovDQo+ICvCoMKgwqDCoMKgwqDCoGlmIChYRV9ERVZJQ0VfV0EodGlsZV90b194ZSh0
aWxlKSwgMTQwMjIwODU4OTApIHx8DQoNCklzIHRoZXJlIGEgcmVhc29uIG5vdCB0byBtb3ZlIHRo
aXMgYnVnIElEIGNoZWNrIHVwIHRvDQpwY19uZWVkc19taW5fZnJlcV9jaGFuZ2UoKSBhbHNvIHNv
IHdlIGp1c3QgY2hlY2sgZXZlcnl0aGluZyBpbiBvbmUNCnBsYWNlPw0KDQpUaGFua3MsDQpTdHVh
cnQNCg0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGNfbmVlZHNfbWluX2ZyZXFfY2hhbmdlKHBj
KSkNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXQgPSBwY19zZXRfbWluX2Zy
ZXEocGMsIG1heChCTUdfTUlOX0ZSRVEsDQo+IHBjX2dldF9taW5fZnJlcShwYykpKTsNCj4gwqAN
Cj4gwqBvdXQ6DQoNCg==
