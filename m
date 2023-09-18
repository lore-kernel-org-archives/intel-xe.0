Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC4A2CD37B0
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 07:29:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB6D10E1C8;
	Mon, 18 Sep 2023 07:29:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB2D610E1C8
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Sep 2023 07:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695022191; x=1726558191;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=3cwX2uC1Y6uSYPHGPquamiBotq1PES9I5QrVhHTSQYw=;
 b=FMBGc+V9KKwhl0Us9nUPnXH+D2kIfvcd9a2gSDR9myK/ZIZ9LY6xv/6N
 zF+4xbZ2gCuuqn44SmNtDCW838o4REpvSRtXVazv+Xz8GLy9XdCECPOEQ
 /nCqZgTl+zFPp47FMdNBgAos0FeIW00Bo0sQpzEG/ZGk/gq1nt5ns8Tr/
 BWZnhGZc22Szxfk9QrDCm0mAxMA12KWgaeRI1Vc9IKQFo7OpLI/V20Vpy
 ntZ9delSukJkWB1EBvZL0abyv4CY4zzqgXZHr7uomRYN9mGa5mhzT7xrx
 doSKoVM2i/BvF/2Ni0/0pL3ig4Png1MrDOpm5mItrnc0p+kw4wAugCHNA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="378498926"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="378498926"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 00:29:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="992606118"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="992606118"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2023 00:29:38 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 18 Sep 2023 00:29:38 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 18 Sep 2023 00:29:38 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 18 Sep 2023 00:29:38 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 18 Sep 2023 00:29:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LukYN0zpGsLzRAARsiorr5qH3CAnNfzYfXr+7ncTi9QlS8z0AHtlTsmm7ZgklNFXNPsiKGQEC3z/lDg/jaddpfLIi9gfHafC+teHRMbwlEuzewl8+shpxqDKlv9Mf7MLZT1bwAjbGLq28CQyPp9ra8GoHkHhFpD4d1A/MysfQUENvEcaXHBo5UDtAY+rqGcc1WmMcaXj9Qx0BGiS6iHMLxLQu901D2cXy5FdW9qdJMqnhcuVD2SXBIa32y77o+ZqUpmDjW3BN886AUcRCySxzhULnbbYPZJ0uJRdd4566ACdhJ8mF5VPCly3Et1NdDN2kmHUA2qHE4u93P/sJArufQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3cwX2uC1Y6uSYPHGPquamiBotq1PES9I5QrVhHTSQYw=;
 b=AHREnSlEe2tKgf+MJBdoKjtgOfkRQ7KUpdolGyJLZnBEb8oaobQNkmTSg487vuXlSR6rxrrQ/phJBvhJmN+CCcEszjZ81pPtaxyoi2YhNxe2yKC2l59WTO2q+CEeZYuvXRanwT34qM7YIB7P+bPTkUMO9a0HBuuo+Zb1yaXLod+JH4RtIGx+UEqsh5kLh1CSO9QAuLyvJomLlyCVTfvtOPCzxYcikgxebZgR1/bR+J6Gk6DLpQAjxp38zxA+OFxMVvs+oEthEtegnUSn9bNe2vFWrKNCylUPg19wXGRpgP7TbpicqbZZKSD7V+8nvhUGuPm2D+q5ImWm2HwX97NRoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 MW4PR11MB6984.namprd11.prod.outlook.com (2603:10b6:303:22e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21; Mon, 18 Sep
 2023 07:29:34 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::3c89:fe31:95fd:c2cf]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::3c89:fe31:95fd:c2cf%5]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 07:29:34 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
Thread-Topic: Revert "FIXME: drm/i915/hpd: skip intel_hpd_poll_fini() for
 non-display paths"
Thread-Index: AQHZ6gHeAs6BjJcdmUWHCcpVz/srwA==
Date: Mon, 18 Sep 2023 07:29:33 +0000
Message-ID: <279c4847f8ee05d341ded2fabcc84071aa5d9784.camel@intel.com>
References: <20230914145451.159278-1-vinod.govindapillai@intel.com>
In-Reply-To: <20230914145451.159278-1-vinod.govindapillai@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|MW4PR11MB6984:EE_
x-ms-office365-filtering-correlation-id: eb499e8b-6271-40c2-f663-08dbb819015a
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3sXiph/WZFFBnNNNjYxHWcBqcqMV4U+oBy9dxX+0IIJS+Afd/dWDGrXc+JTdxrVyxpkyZLw7MyAIfpAiSSsze0g3lgSPq8JnCTVWQrXbbbbR//KZ87l/OLeTrKvUWSSmIXIAizUVWIcIPVchc2qnlAUQyO2F8CdZNcMzthDVG0I99cTWVbEM981N3KbRM3m6FAhpegi8TpxN44HwTpiHQ7g/hOghOSpWbyLnXlxrOUy48ohpo2pbtVh1HkibuwDSp5MVPCu0kBoVpi1EnYDeEKB1UNU8LNixwkQb4C+K/EFrLNynrMdK69MUGZACOICZS3ArjvzlZEUAPFBpxsxjqogqfVZDulzDi+Sbhi2z4x0wl2jjD6Z7lSdsa4dfqvGMvt4wwvbeXt5kTOAKA80cP4j2miXBQN2ll2MGzt3FnkiF3uUzpfs3sVd4ZSSQFikBlDroRYPYuMMPZTkO1RpCWk2R0E+NNfKj/j1huV4FQ3bdoc3gDNdY5XOXC99MRy2/umtMMmyPEEh/QsG40KbCIo6maSFpFksmCsSsjAR5I/3/OaVWfUPZnNfqx+6tdKEDIhuIc/uC+9+80PClorWKDem/d5dPJq3tVUjmSWhHjEVxnm8z3A1gjJe4F9/rcL4+
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(376002)(136003)(396003)(39860400002)(451199024)(1800799009)(186009)(83380400001)(5660300002)(4326008)(71200400001)(6506007)(6486002)(38100700002)(38070700005)(82960400001)(36756003)(86362001)(122000001)(107886003)(6512007)(2616005)(26005)(2906002)(478600001)(41300700001)(91956017)(110136005)(8676002)(8936002)(6636002)(66556008)(66446008)(316002)(66946007)(76116006)(66476007)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TzQ2Q1FpUDRaRHpjNmlXYVZMbjlkQnBGWEpzb3FqaGJrRFJ4TmNvWnZaRGIy?=
 =?utf-8?B?MkljWW0rNjR4VkZLbTl3Y1NUMlk4TWFIQjZOVEJiUXBBRkFBMWJpTmtWTEFB?=
 =?utf-8?B?dEVjQmp2OU91NzIrRWdMK1h4TUhqS3NsZzVIdDU0WFZWWVF1Ty9vSTE1Yy9l?=
 =?utf-8?B?azFPTjNERlhyZFRMTVI5MkkvZmdjNU9ZUzA5RGRqR3cyZ2VyYzVQYWthNVZD?=
 =?utf-8?B?R0NQZFlWelhhUlRxaGdSYzVaRXg0YVRrcDNmaFd6bWRzeTh1ZXowR2w5UGlK?=
 =?utf-8?B?ZmZpYzhNTUsybXJJZjkyWG9sejU3cWNZbEFKSFFzbEV0WG04V2hNN3hTZWc4?=
 =?utf-8?B?Rkk3VjRvck9VT3JRKzhLME9XZk9CR3NCQnJTOGFBRHpGWHNMSnBDVVRjUXU4?=
 =?utf-8?B?T2hadXRTZDZYb3JRWWhnTDcxZzRBUGl0S1kxZVRlTzJSRnU0dkVzQlBpbEV5?=
 =?utf-8?B?SVpKVUd6MXdvVXJsaVJiVWcyaWtnbnFWdVJONSt5c3EvZmhranVsd3ozL2JE?=
 =?utf-8?B?ZVgyUG9PRHF5QVQ2eW5jWjh2MytwVkFGNWlockh1WlpWZHlQeUJqSklQalZC?=
 =?utf-8?B?WDBuSklQSm9LdmhCRXFEUGR5V1IvTGVWNFJvaW9UVGdGOURxSi9LL01xeEpo?=
 =?utf-8?B?cXRIR2NOSlZsRnp6NUlSeHphOXVXcTNXbTdLSEp4SzhMN0RYZWJBMEg0WW4z?=
 =?utf-8?B?SEozQit6eDJXR2hmK1BvTGVQdGY2WmZ4VWNuZXhnUi9KNXlTblEzemhkUFFO?=
 =?utf-8?B?dHplV01TKzhpaW1DVUh3T25aWjgxd2FLZkpwckwrQi81bEZmV0E3TE9iZm1R?=
 =?utf-8?B?ODhXTlN6clJPUjM5MkR5RDZBa0V0OHZkWk9leVJsZ0xRN29DUEU1ZStCdFpK?=
 =?utf-8?B?dGlZeVAvZHZTZkVMRmNwMjNLZi9mRFBkelkxMERlRTVIVXIrUW00QURWRjhZ?=
 =?utf-8?B?eUlHZjV6OHhmTkhFd3U4Z2psai94a041dUpJdyt3NXZZYkcxbWk3QkkxeGZB?=
 =?utf-8?B?cHhiMEpkblRsRWhJcWdVNnp3bEJhL2RDK2lXZFR2d1hBZmEwNGhjTG1qcVZz?=
 =?utf-8?B?aFVzMDlvbnZieWg3cHZJZUtZZEgvUUpIZGZqTURoTC9WcWxGbjRGSVdKT1lY?=
 =?utf-8?B?R3BFOVkzTHVzeXlRQjB1WkF1eWR5OWRBcDRXVW03ZEJRQVZ5SG8zSzdaOExs?=
 =?utf-8?B?ZWphRjA3TzVNcDdVM2RoTUZzWmZHWlJhMG5KMHQvTWs0ZU16Smh0WktKZTdZ?=
 =?utf-8?B?czlpOW5aZHcvNDNKUTc3aVc1UjY2SU5RSVdMdCtvQkFuTW9HS0hRdkpuZ3Ju?=
 =?utf-8?B?dm9xSkdCYkhuZit0OHRSMTBvejk1SGhlQTMyVkFRNW02MDcrL09UK2FvNVIr?=
 =?utf-8?B?ZVZ4NDZEQmM2bHVuTXZvbG04ZGJQQWcxTHhrb0h3M1lKaDBjL2gyclFITWQ0?=
 =?utf-8?B?bFhWNWQ3RmZoNVZ1b0dvb3U3clJpNTQxM0FvRkpSdXhYMFVOaC96a1FkaEJh?=
 =?utf-8?B?WUN2RkovQS9IM0tDOWN3VGcwRVlQK1BTR3JUcHNIMVdRQTNrWVNTd09TdW1j?=
 =?utf-8?B?MEk0NlZnT2d1bUVQak5CdGR1NHd1Q1VWRWlibTZLaFQyUFpFMEdTTm10MU4x?=
 =?utf-8?B?S0FNYkRRR3dxRDJOWlBhRDZ4Z1JvczJ1VHhxNjhrYkdaTXo2MFRwc2syd2w0?=
 =?utf-8?B?OVhMZ2VYdTZoclNmaE5Nd0NOd3JDYXAxZ0F5aFJoOEFaY0NmSzFZU2h0UjdH?=
 =?utf-8?B?cXpHbzcvSGs5bHRaRDZYbFZRRXdLUGU0TmpEOTZkWno1ajRybzE3UVA0K2Jz?=
 =?utf-8?B?VDMzNzFFa09KK0Z0aWF0cUd1SGhaWVlKR0lQOTBzRTdrZktaQ2FDRjV1VGU2?=
 =?utf-8?B?aGdMdk5uZWlHM3pEMUFiQldyL1MrVzZaYzNaeVl3KyszaVI4ZG9uV3JsK0Vv?=
 =?utf-8?B?ZXBYR2VDb3lQUXl2RFZ1ZUhBNUd5MFFLWWVUOHU3aDgwckM2QnhLQnNFZ3RJ?=
 =?utf-8?B?dGR1dmZRR3JxWjFJK0o0aTBQSjNycXE2ZGs1MDdiL1NCUmp0VjZtdUc3Wksz?=
 =?utf-8?B?eVNsK0JVd21sUjkzdXdvRXM3T2N4eHN4ZkZieUpvU2xoRmY0anJXSEJ4eCtX?=
 =?utf-8?B?bkVqN204aFAyb2Q3MHZvcUY3eU1pRnhsR0V6cVJjYytrZEgrRkh0WjFJVTlM?=
 =?utf-8?B?RkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E02BF6C2F0E74E4EAEF157ACA80CE1EE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb499e8b-6271-40c2-f663-08dbb819015a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2023 07:29:33.9181 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9HttU6+evPETPtxdl27l+K1aMTEjBtwG1LgFrfIwtULKdGvgCpPU+tzbN0vAfyl3Z1rXcV75d8xfqEUnHQHOkRz6pjekyxJ53WFxs0LUf48=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6984
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] Revert "FIXME: drm/i915/hpd: skip
 intel_hpd_poll_fini() for non-display paths"
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTA5LTE0IGF0IDE3OjU0ICswMzAwLCBWaW5vZCBHb3ZpbmRhcGlsbGFpIHdy
b3RlOg0KPiBUaGlzIHJldmVydHMgY29tbWl0IDViNTAzZjdiNmFhMTU2ZDQ1MmZhZTNjOTJkOTA2
MGI1MzFhYTYyOGMuDQo+IA0KPiBUaGlzIGNhbiBiZSByZXZlcnRlZCBhcyB0aGUgaW50ZWxfaHBk
X3BvbGxfZmluaSBpcyBjYWxsZWQgZnJvbQ0KPiBkaXNwbGF5IHBhdGhzDQoNCkkgZG9uJ3Qgc2Vl
IHJlYXNvbiBmb3IgdGhpcyBlaXRoZXIgLT4NCg0KUmV2aWV3ZWQtYnk6IEpvdW5pIEjDtmdhbmRl
ciA8am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBWaW5v
ZCBHb3ZpbmRhcGlsbGFpIDx2aW5vZC5nb3ZpbmRhcGlsbGFpQGludGVsLmNvbT4NCj4gLS0tDQo+
IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMgfCAzIC0tLQ0K
PiDCoDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jDQo+IGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMNCj4gaW5kZXggOWRmODA4MWY3OGQ5
Li5iMmUxNmNiOGQwMjYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfZGlzcGxheS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfZGlzcGxheS5jDQo+IEBAIC04MDI3LDkgKzgwMjcsNiBAQCB2b2lkIGludGVsX2hwZF9w
b2xsX2Zpbmkoc3RydWN0DQo+IGRybV9pOTE1X3ByaXZhdGUgKmk5MTUpDQo+IMKgwqDCoMKgwqDC
oMKgwqBzdHJ1Y3QgaW50ZWxfY29ubmVjdG9yICpjb25uZWN0b3I7DQo+IMKgwqDCoMKgwqDCoMKg
wqBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9saXN0X2l0ZXIgY29ubl9pdGVyOw0KPiDCoA0KPiAtwqDC
oMKgwqDCoMKgwqBpZiAoIUhBU19ESVNQTEFZKGk5MTUpKQ0KPiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgcmV0dXJuOw0KPiAtDQo+IMKgwqDCoMKgwqDCoMKgwqAvKiBLaWxsIGFsbCB0
aGUgd29yayB0aGF0IG1heSBoYXZlIGJlZW4gcXVldWVkIGJ5IGhwZC4gKi8NCj4gwqDCoMKgwqDC
oMKgwqDCoGRybV9jb25uZWN0b3JfbGlzdF9pdGVyX2JlZ2luKCZpOTE1LT5kcm0sICZjb25uX2l0
ZXIpOw0KPiDCoMKgwqDCoMKgwqDCoMKgZm9yX2VhY2hfaW50ZWxfY29ubmVjdG9yX2l0ZXIoY29u
bmVjdG9yLCAmY29ubl9pdGVyKSB7DQoNCg==
