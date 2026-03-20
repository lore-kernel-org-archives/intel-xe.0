Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDBD1099B30
	for <intel-xe@archiver.kernel.org>; Fri, 20 Mar 2026 22:21:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DADF10E00F;
	Fri, 20 Mar 2026 22:21:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gwarz+9Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EE2A10E00F
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Mar 2026 22:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774045287; x=1805581287;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2H4VzTbnExdsofW2lmjSWuN1mf+5efDMkaGU579nKbM=;
 b=gwarz+9Zgdrabpm6PNdcVRunC22ovQwrEI1fVjnungstn3S4y6bnIuxp
 oSZoIFRtNG60py52dEKvXrn9CGC2MfNpwGx7v8d338NgRfY1NBf19gqLi
 2TsSXVDfOPV3+a+gC8CDJnaL17PFywtssfm5hFlHbRpc5B6C6bzR7wDyt
 kEAGQls0ANBDDdpV56UNfG2CAh2ZodASTXo0DHEqB7sEkeUjEGv1LvZ7x
 h+1roZHRJYh+VpaCVecJ2pf929BtSKSY7U7Y01JxmMqfpKUWq6Yi/50rH
 GIQ+k/CO9J/F5qB5L2rYRk1BXOWc1WLW21Qe02fae7SDMfmBWQuPELFjq A==;
X-CSE-ConnectionGUID: SaEHieLGQdSXNIyFBxDDPw==
X-CSE-MsgGUID: i1EYwONxQeGHNrPan2KBNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="74154325"
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; d="scan'208";a="74154325"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 15:21:27 -0700
X-CSE-ConnectionGUID: qiEvRJYNQgWJUsLmhg5FCw==
X-CSE-MsgGUID: 2IQM4sqHS4GTn9ORXkPw3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; d="scan'208";a="222640293"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 15:21:27 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 20 Mar 2026 15:21:26 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 20 Mar 2026 15:21:26 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.65) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 20 Mar 2026 15:21:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HNoLx7GSkBKvkhiivKGN0/re4YquB+mmCiI2JyuUIG7QwqmpRsTVnkexypriItiPOaCntg5M1GFgRPKZdPR5Wiw5YMSU+3JKkMnaN4yQo3hwZUxlprwi1mB+0Ss6cCw18o0FhuEVcC8OqIa6WyVGvDM0Jy5J2N0O16g7+dmsFd9ljc5+COJUdlCfVwjNXZN4vpFj8b+nTsSlh68X6HFzsUiTR7BLDseaa7H+6xZZC/YBKzPjiFUbuhwhyc6WO2Z7SFvfr6f15+19Wt2ro6PvwF2iUJNz6lmrnOOJRt6OOz1AL8lu0ArVEeXZIxhup7bCAqwCok3I/5E7z5EYKAW0dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2H4VzTbnExdsofW2lmjSWuN1mf+5efDMkaGU579nKbM=;
 b=AjTKZsiJoWdXvu8yL93dBZAIiUyXv2UbZzjaZmWTJ4cmzpM3lAxnohrAeAR3iROm6rAttb8jpJWoxKm20zYcKAm7fjAAktt2aP1kSGhJaCPf9jhkultbioerRH2XjvE27GYEt1hABSwF1iQQVaiQhwGOYLhWLOCWToXmxsQvbHNQx3NDWXOtJ8uUnlRDlr/g5GidxLz51+jvOI476b9TUYjciDv8AHs3yk0dIAiAQO9saMIplsiv5CijzsETGOvQCjo6ioIK9DBK+qsAaqsa1u2I9I22obsbCEeCGfokaI+PbSyKC0ghvOmxcstWu5fIMo5l7KiWND55KKNmFOoS7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 PH8PR11MB6708.namprd11.prod.outlook.com (2603:10b6:510:1c7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Fri, 20 Mar
 2026 22:21:23 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680%5]) with mapi id 15.20.9745.007; Fri, 20 Mar 2026
 22:21:21 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "kernel-dev@igalia.com" <kernel-dev@igalia.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, "Ruhl, Michael J" <michael.j.ruhl@intel.com>, 
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: RE: [PATCH v23 10/12] drm/xe/display: Respect remapped plane alignment
Thread-Topic: [PATCH v23 10/12] drm/xe/display: Respect remapped plane
 alignment
Thread-Index: AQHct4g6yEML6rZ/c0mqcsb1xaUJy7W3JgiggAB7qQCAAF5Z0A==
Date: Fri, 20 Mar 2026 22:21:21 +0000
Message-ID: <DM4PR11MB6360D7DC7E3490760DD7FC1EF44CA@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20260319100707.60157-1-tvrtko.ursulin@igalia.com>
 <20260319100707.60157-11-tvrtko.ursulin@igalia.com>
 <DM4PR11MB636071EEE02758F16A225D93F44CA@DM4PR11MB6360.namprd11.prod.outlook.com>
 <100325e8-1369-4d2b-884d-342964cfe25f@igalia.com>
In-Reply-To: <100325e8-1369-4d2b-884d-342964cfe25f@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|PH8PR11MB6708:EE_
x-ms-office365-filtering-correlation-id: 2c99d230-1768-4eb3-1f6a-08de86cf0416
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: P4cJDuKJ07mThSWLo0U+5i24vhQ68JlaIITirXEHlcghhzkVvug7e7c5k7p5bqhfeMJZls3KoJzm0Txd8ym361kLA7uV8fJz/gd5AoiML8H3iS3OwEBdtsjWQIR5oYJUEYtfTIX4KWiGAWktDRlk2Hp+crxS/3Uo5EH/FfODeXclLOU+PyaE7lXWjiviqi6KFEZtJO0lBvf6UQqY+Mkra9XC+YX5Kkkv71OMvDBQk+q0a0Mwd/hQOXX3uBbqDpMRyfgdYjyQbtKh4DaezwbW7aXV/AlkdEOFH1s9MHzVO2vAIARpHe0IbeAAOp3P5WXbrlqLUiYN7eC8VbfNg1x/SIeOexkp/i02pbpebFJspGh3UZcRyD0w5GaTYLIVSPiVCSAHVq7hewH90Drl8bAzJdBhbUXDGaj0Bz/Ijul0RQSY+5VEvXHtkVSU4K67E034n1CCIOZpUEkR2DZl1MG/TflYe6mm41oI7MTj+7/iPVPvL4QYvzmJXPPA4csCWYy8tsghPEaqFlPq0j8NhdQ0ZHmIKyhehXE4IyM8K8agwFaWmLnvd04qs8wHBYp8GifnUW4zPFf9dyjzRs3BI6a4kzGOBTY91M27IF1/kcnWSUS2lLrtv6mzx3NaiZSikGJSaZ6S0PLuhw0rzN9ig/lUUt4WgLYBPGHWTSzSJRR1I2LxumJI4nd9BRh0F6C0k1CVPzg4Dnet4XKWY+7ytUtmzmHnEQ27kjTlDlH8x/RYAvAfGe7e1mniSa6LbxQJlpqw4Nc0XfJrgxRSp8sA+63p2SqoRtyOW2CwGdMBVJbMyu8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OEVxa1N1SENUWGZOTW5BTlRqRWhpN3RoTUk2Q1dEU2dlMXlEUUVWRmxHbnRl?=
 =?utf-8?B?SEgwNTFMVXlCUUxkelZxNXBXd2c1L2NGV0hNdGoxVURodDVnT2NlQ2ptOWRm?=
 =?utf-8?B?WG8xZGZxT2RtQTkxREdNQ1NQbFVzRnRFV0FaWllkSHBoVjdpek5IWnFRbm5h?=
 =?utf-8?B?YmVFUEJmS1BPVll5NERPZTl4WWI1ajdkMlQvdTlRQWtnSVgwUGRuRUpHMGl1?=
 =?utf-8?B?UTJpRWErcGJEUzZUcU9tUUFrM0lkMXduYWh0amNKaUhPVFJnQ25mbXJXZGFR?=
 =?utf-8?B?VnFLQ0RWR2FIdzdRenVSRFZ6SW5QcFNId1NBY1JtTzM4akwxZnlFcUtaTnEv?=
 =?utf-8?B?VGR3dGQrSkFoaGo1WnRKajFacEV0R3JBcjIveHVCSWJ2c0FEQ2xLVGtTWndW?=
 =?utf-8?B?aitDeFRsMmFBSk5ZYkxXSW03YUZENlpkNk9GUURpbFMrTytRTUNDR3VpRzFs?=
 =?utf-8?B?cjNtWUNaMHgxcUV3T0RCYXlPL25WdTUvdGl3UEo3cUZXSWNBRGtaM211TFN0?=
 =?utf-8?B?V3RhOVlTVHNPT1E4a2sza25ObnYyUUlKZW1waFpZSUxaa0lBalF2Smx3ZER2?=
 =?utf-8?B?ZElpZGtqUXB0UStBS3RKZnNXQUpSZzhMYnpGZWdiNythZDlRNTV2Mi9NeVdG?=
 =?utf-8?B?TXJ1YTdnc0pvbW9ZT0l1VU1hNW5xOWVYT3VzTzUzdnFKV0k3MWswcjU3bU5k?=
 =?utf-8?B?SEg4UGt3TjFCM3p3cUV4Q1FBK0t2OFozdjVRbDdMVlVWbEJZUHJicjRBWWl5?=
 =?utf-8?B?QkVuakJKelRMdmJGdVVBK3FRNGUwOEcvaXZqV1dmRjJkbVhwODFyWEMwVXdE?=
 =?utf-8?B?UHBtZUNCMnhuSy9aTFhtcDlzL0tieGlpcFErWFV1cFdiMHh3ZDNkSFdNYmQ5?=
 =?utf-8?B?VEwyZ1VFV3VmQUZBdXk4OXFjLzdoSDVvdndEci9JZGFHeVQwREdEVFJFM3hj?=
 =?utf-8?B?TDJuTjRFalpaSHhqUVcvWUNFSnlsT3Z4VHBxMm9LWVNnVVhXR3V6MXZhb2xq?=
 =?utf-8?B?YkU2TmFEeHNlcTdGaUxua2NEVXMxdTdJRHhublBkcXdzTXNERExReThsYU5E?=
 =?utf-8?B?bXlHTFNmbDI3enZrdnA5NlVEakVsa2FhOHNoREhSbFAxVStoYlBrYmxLUXQ1?=
 =?utf-8?B?WDg1Y2tnZWlKSXpJSHZ2ZXRMMG05c1NZVklHVWYzYm94LzFSV2hBWjBXRHdy?=
 =?utf-8?B?OFlhR2xnM0RUOXM2R210VFZjM2pOMjcxVzNVNTExS1N4R0RkbUlWT2FOSU52?=
 =?utf-8?B?WXpieDhnVEVRalJMTVV0Q0QxY2RtSG80b2xVYmExK1MrUUx4ZDc5TDcvZW1s?=
 =?utf-8?B?b1Z6cDVmUDNJcWpOek5jQmRQVnlzTUdEUzNKNnVLcFNiVXBLclpLeW5LRHZm?=
 =?utf-8?B?YjN0amNuWThJUkkzR3d0YjkyS2g1UVZYN2t3REVUbmlsSTdSSTNWenVJVUNq?=
 =?utf-8?B?cWdJelZTNzg3TEFMQmhnRmJ5NHdaeTBVRjFSdVh2SmFtTklYdlRYak9vRVV1?=
 =?utf-8?B?WFVDWmxObE1UTGpOeXM0ZVZUMFVRbDJTbmQ5bDdsK1lvV0lxd1ByZmhwdTha?=
 =?utf-8?B?aU5EZjIxZVdoREwxaTNUenE5em5wanhtbVNLYVdkenl1SmMwWkFWTjVhYkgy?=
 =?utf-8?B?RU1KN0NUaWE3Q1UwVEhiZjAxQStZOC8rczZVVDcvcDdtNXB3SFU2amR3dmVy?=
 =?utf-8?B?ZEtmR3grNlo1K2ZWOWYvWXB1N0dDWEVEWFRqNzhYNkVmYVg1d1puRWtjOWxR?=
 =?utf-8?B?amV2ZW1ubE56Z09BU3ZId1JpT3ZwSGJwaEhTaElMWHh0NXFiVW5LSS9VVlB2?=
 =?utf-8?B?dzlYcnFvcjJmMk1KNmw0aU0xeTJ5UzNialcvY09lb0kweWNSeUNKcDA1VUxZ?=
 =?utf-8?B?dTlQMlgreER0djFlNFVUcEYyeDdRRnNOamxLYW5qdm5ROUh6ZWdPcC9EM2xC?=
 =?utf-8?B?cURaYWdGSGVWZVZERzJ4VVFsMDgzbUNFd25KWUNiL2JVL3dMekRQNjdUVkpx?=
 =?utf-8?B?M09yOVArdXdQZnd0NDZaTGw5V0lsTXdaU0lYUEpFSG51RTIxMmFvcUZKRVhS?=
 =?utf-8?B?R0xVaVlUSisxSGtINU1XdGFMc2NTVGdlM0JMOGZiZlVpSlRyS1RxR0ZuVU9Q?=
 =?utf-8?B?SU0zN043cCtqRFRHSUFBWUlVNUJZUmx2dm5saUFBQ0ZvMyswWjdiK0dsR1pG?=
 =?utf-8?B?VHRPOUUyQlJtZ1ZYcURDWEN5NkwyM0ZtdFB2V1VlSnFyZHphbzlITWVOR0JI?=
 =?utf-8?B?cFgrZWI5MytCNU0yUUJFejFZb0dlRXQvTzVVZ0FaUVYxUHFmb0w4blhDUVpD?=
 =?utf-8?B?UEhSbVBWNkd2NEw3WG9OUkJZcUw1VzR3L01HVkdlNXlibVRsRFJiQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: TLMWgj1bX2pre4o1VglN8OuFB/j9NIm2/y9eV2TjYa+q2nYGukpJw989j6sbzg5HHIYayuwlwRa0RXfXt+NmTFjU6zUL4uJl6nH+XScxnaY4ssKz53abKhl2vn5xrEkzpvpvql1qtgsnhn08SLJBsn9ESptrdrxXJU4NQvS9xXA0l/T/Ss8mR8Z/NUJFqFudpJJCFGAvIeiGkI2SVrvw3W7pG4XeRHp+/u8ofpbUP5tZ06m+wKLhrFAEh5js7c/n3G+3ud3Bh8CBSNzZ0nGhc2l3vng8R8enQ5KqV9Wag/ONQ0D4Zmy+NMWBXcD/OkwGZeTXQ5kkqkjfn0IFOWsgkg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c99d230-1768-4eb3-1f6a-08de86cf0416
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2026 22:21:21.6867 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tlji2GlBlthc/Wff1pI9JVm7W4z4OIr2eR4ddLMTi8PVSELnXWQtN/qyj1pxj7IOQRLymxI4pTBzoe7fbVv/BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6708
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVHZydGtvIFVyc3VsaW4g
PHR2cnRrby51cnN1bGluQGlnYWxpYS5jb20+DQo+IFNlbnQ6IEZyaWRheSwgTWFyY2ggMjAsIDIw
MjYgMTA6MTEgUE0NCj4gVG86IFNoYW5rYXIsIFVtYSA8dW1hLnNoYW5rYXJAaW50ZWwuY29tPjsg
aW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBrZXJuZWwtZGV2QGlnYWxpYS5j
b207IEp1aGEtUGVra2EgSGVpa2tpbGENCj4gPGp1aGFwZWtrYS5oZWlra2lsYUBnbWFpbC5jb20+
OyBSdWhsLCBNaWNoYWVsIEogPG1pY2hhZWwuai5ydWhsQGludGVsLmNvbT47DQo+IFZpdmksIFJv
ZHJpZ28gPHJvZHJpZ28udml2aUBpbnRlbC5jb20+OyBUaG9tYXMgSGVsbHN0csO2bQ0KPiA8dGhv
bWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+OyBNYWFydGVuIExhbmtob3JzdA0KPiA8bWFh
cnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYy
MyAxMC8xMl0gZHJtL3hlL2Rpc3BsYXk6IFJlc3BlY3QgcmVtYXBwZWQgcGxhbmUNCj4gYWxpZ25t
ZW50DQo+IA0KPiANCj4gT24gMjAvMDMvMjAyNiAwOToyMCwgU2hhbmthciwgVW1hIHdyb3RlOg0K
PiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBUdnJ0a28gVXJzdWxp
biA8dHZydGtvLnVyc3VsaW5AaWdhbGlhLmNvbT4NCj4gPj4gU2VudDogVGh1cnNkYXksIE1hcmNo
IDE5LCAyMDI2IDM6MzcgUE0NCj4gPj4gVG86IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zw0KPiA+PiBDYzoga2VybmVsLWRldkBpZ2FsaWEuY29tOyBTaGFua2FyLCBVbWEgPHVtYS5zaGFu
a2FyQGludGVsLmNvbT47DQo+ID4+IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpZ2Fs
aWEuY29tPjsgSnVoYS1QZWtrYSBIZWlra2lsYQ0KPiA+PiA8anVoYXBla2thLmhlaWtraWxhQGdt
YWlsLmNvbT47IFJ1aGwsIE1pY2hhZWwgSg0KPiA+PiA8bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29t
PjsgVml2aSwgUm9kcmlnbyA8cm9kcmlnby52aXZpQGludGVsLmNvbT47DQo+ID4+IFRob21hcyBI
ZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT47IE1hYXJ0ZW4NCj4g
Pj4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+DQo+ID4+IFN1
YmplY3Q6IFtQQVRDSCB2MjMgMTAvMTJdIGRybS94ZS9kaXNwbGF5OiBSZXNwZWN0IHJlbWFwcGVk
IHBsYW5lDQo+ID4+IGFsaWdubWVudA0KPiA+Pg0KPiA+PiBJbnN0ZWFkIG9mIGFzc3VtaW5nIFBB
R0VfU0laRSBhbGlnbm1lbnQgYmV0d2VlbiB0aGUgcmVtYXBwZWQgcGxhbmVzDQo+ID4+IHJlc3Bl
Y3QgdGhlIHZhbHVlIHNldCBpbiB0aGUgc3RydWN0IGludGVsX3JlbWFwcGVkX2luZm8uDQo+ID4+
DQo+ID4+IFNpZ25lZC1vZmYtYnk6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpZ2Fs
aWEuY29tPg0KPiA+PiBDYzogSnVoYS1QZWtrYSBIZWlra2lsYSA8anVoYXBla2thLmhlaWtraWxh
QGdtYWlsLmNvbT4NCj4gPj4gQ2M6IE1pY2hhZWwgSi4gUnVobCA8bWljaGFlbC5qLnJ1aGxAaW50
ZWwuY29tPg0KPiA+PiBDYzogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0K
PiA+PiBDYzogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwu
Y29tPg0KPiA+PiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4
LmludGVsLmNvbT4NCj4gPj4gLS0tDQo+ID4+ICAgZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkv
eGVfZmJfcGluLmMgfCAxNSArKysrKysrKysrKystLS0NCj4gPj4gICAxIGZpbGUgY2hhbmdlZCwg
MTIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L3hlX2ZiX3Bpbi5jDQo+ID4+IGIvZHJpdmVycy9n
cHUvZHJtL3hlL2Rpc3BsYXkveGVfZmJfcGluLmMNCj4gPj4gaW5kZXggZWFkNzBlZTQ4MDI4Li4y
M2E3ZWM0MWYwMWQgMTAwNjQ0DQo+ID4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5
L3hlX2ZiX3Bpbi5jDQo+ID4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L3hlX2Zi
X3Bpbi5jDQo+ID4+IEBAIC04Myw5ICs4Myw2IEBAIHdyaXRlX2RwdF9yZW1hcHBlZF90aWxlZChz
dHJ1Y3QgeGVfYm8gKmJvLCBzdHJ1Y3QNCj4gPj4gaW9zeXNfbWFwICptYXAsDQo+ID4+ICAgCQkJ
CQkgcGxhbmUtPmRzdF9zdHJpZGUgLSBwbGFuZS0+d2lkdGgpOw0KPiA+PiAgIAl9DQo+ID4+DQo+
ID4+IC0JLyogQWxpZ24gdG8gbmV4dCBwYWdlICovDQo+ID4+IC0JZGVzdCA9IEFMSUdOKGRlc3Qs
IFhFX1BBR0VfU0laRSk7DQo+ID4+IC0NCj4gPj4gICAJcmV0dXJuIGRlc3Q7DQo+ID4+ICAgfQ0K
PiA+Pg0KPiA+PiBAQCAtMTAwLDYgKzk3LDE4IEBAIHdyaXRlX2RwdF9yZW1hcHBlZChzdHJ1Y3Qg
eGVfYm8gKmJvLA0KPiA+PiAgIAkJY29uc3Qgc3RydWN0IGludGVsX3JlbWFwcGVkX3BsYW5lX2lu
Zm8gKnBsYW5lID0NCj4gPj4gICAJCQkJJnJlbWFwX2luZm8tPnBsYW5lW2ldOw0KPiA+Pg0KPiA+
PiArCQlpZiAoIXBsYW5lLT5saW5lYXIgJiYgIXBsYW5lLT53aWR0aCAmJiAhcGxhbmUtPmhlaWdo
dCkNCj4gPj4gKwkJCWNvbnRpbnVlOw0KPiA+PiArDQo+ID4+ICsJCWlmIChkZXN0ICYmIHJlbWFw
X2luZm8tPnBsYW5lX2FsaWdubWVudCkgew0KPiA+PiArCQkJY29uc3QgdW5zaWduZWQgaW50IGlu
ZGV4ID0gZGVzdCAvIHNpemVvZih1NjQpOw0KPiA+PiArCQkJY29uc3QgdW5zaWduZWQgaW50IHBh
ZCA9DQo+ID4+ICsJCQkJQUxJR04oaW5kZXgsIHJlbWFwX2luZm8tPnBsYW5lX2FsaWdubWVudCkg
LQ0KPiA+PiArCQkJCWluZGV4Ow0KPiA+PiArDQo+ID4+ICsJCQlkZXN0ID0gd3JpdGVfZHB0X3Bh
ZGRpbmcobWFwLCBkZXN0LCBwYWQpOw0KPiA+PiArCQl9DQo+ID4+ICsNCj4gPg0KPiA+IEkgdGhp
bmssIGluIGdlbmVyYWwgb25seSBjb25jZXJuIHdpbGwgYmUgdGhhdCBMaW5lYXIgd2lsbCBiZSBi
cm9rZW4gaWYgYmlzZWN0ZWQgdGlsbA0KPiB0aGlzIHBvaW50Lg0KPiA+IEJ1dCBzaG91bGQgbm90
IGJlIGEgZGVhbCBicmVha2VyIEkgc3VwcG9zZS4NCj4gDQo+IEkgZGlkIG5vdCBmaWd1cmUgb3V0
IHdoYXQgeW91IG1lYW50IGhlcmU/IE9ubHkgdGhlIG5leHQgcGF0Y2ggaW4gdGhlIHNlcmllcyBh
ZGRzDQo+IHN1cHBvcnQgZm9yIGEgbGluZWFyIChhdXgpIHBsYW5lIGFuZCB0aGF0IHRoZW4gaXMg
bm90IGV4cG9zZWQgdG8gdXNlcnNwYWNlIHVudGlsIHRoZQ0KPiBsYXN0LiBJZiBJIGJyb2tlIHNv
bWV0aGluZyBoZXJlIGl0IGlzIG5vdCBpbnRlbnRpb25hbCBidXQgSSBkbyBub3Qgc2VlIGl0Lg0K
DQpZZWFoIEkgc2VlLCBpdHMgZXhwb3NlZCBpbiB0aGUgbGFzdCBwYXRjaC4gSWdub3JlIHRoZSBj
b21tZW50LCBteSBiYWQuDQoNClJlZ2FyZHMsDQpVbWEgU2hhbmthcg0KDQo+IFR3byB0aWxlZCBw
bGFuZXMgaW4gYSBzaW5nbGUgZmI/IElzIHRoYXQgYSBwb3NzaWJsZSB1c2UgY2FzZT8gQnV0IHRo
ZW4gSSBjaGFuZ2VkIGl0DQo+IGZyb20gYXNzdW1pbmcgNGsgYWxpZ25tZW50IHRvIHdoYXQgaXMg
c3BlY2lmaWVkIGluIHJlbWFwX2luZm8uDQo+IA0KPiBSZWdhcmRzLA0KPiANCj4gVHZydGtvDQo+
IA0KPiA+IExvb2tzIEdvb2QgdG8gbWUuDQo+ID4gUmV2aWV3ZWQtYnk6IFVtYSBTaGFua2FyIDx1
bWEuc2hhbmthckBpbnRlbC5jb20+DQo+ID4NCj4gPj4gICAJCWRlc3QgPSB3cml0ZV9kcHRfcmVt
YXBwZWRfdGlsZWQoYm8sIG1hcCwgZGVzdCwgcGxhbmUpOw0KPiA+PiAgIAl9DQo+ID4+ICAgfQ0K
PiA+PiAtLQ0KPiA+PiAyLjUyLjANCj4gPg0KDQo=
