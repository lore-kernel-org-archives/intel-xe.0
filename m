Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD506C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  1 Dec 2023 15:46:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F14310E8C4;
	Fri,  1 Dec 2023 15:46:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA6F10E8C4
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Dec 2023 15:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701445519; x=1732981519;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=SZrUDdhkoHUP7bGTN9x4ndnCHS+0R/MTu2OujqTGRlM=;
 b=d5kwbZJXSBRTZ8wYof967MZ898OQn9DhaOxPM0Js7uFxjVHF3UWbsLJ+
 sSkE3oC+spWlFMfkQLqzLh9BaiPtgANQ33SOmrzx0Da/WpENOsSk3sl+v
 2a9Q5ZwxkfiFmezK6ttEqGswobDl+bT4Dmj1sy9CEsCbz034lsNhT4791
 gHLA2jNsvRq/3zd8paGSK6/SAg476KuRE7WpKGggXwurL2/eFfGkFU0ew
 1+ZfCqdUvWUDLH4bGBV5m3jBidun5WLYezgvNly4/Ad74uRJolldU1+gW
 pnfzFV/gld4VAu8w+CuTmsIFsAAHNzdQg88q39W7cLf4vubjGSPnwoZLg g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="526518"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="526518"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 07:44:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="11190061"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Dec 2023 07:44:36 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 1 Dec 2023 07:44:35 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 1 Dec 2023 07:44:35 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 1 Dec 2023 07:44:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bxa83Lpy6YpKs1BQtLX1vNLt9cbFFsN6W6uP+hYIdcSRiSkMVdPE/vOR+vViJFf1fh+C7gYSOH6BEYimtrVpw6Ug15aBehR9aifKOvvZSrSNsO70BdJAqO+NjNStynRgP4eetmtaaolhQ8vR7gxaKvUR3cv8fF/Vp/N/VzYSNkUAjkV9VZcyG3dDiwKqUb4Xs0vuzOXlsor3pMUZpBe8wZnw+lXVNkEt0SwedmeJZMs0/HjZbltpEQg3Dk0QmBKHpXz0cW0t6SimrPGVcK1hXNF4HFlzUOFPTSxQ9TDOcCrOARewX9/wubY7wLRLUeTtDRMwVmYTUNuxbVXYwsc+MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SZrUDdhkoHUP7bGTN9x4ndnCHS+0R/MTu2OujqTGRlM=;
 b=Ok5sOK0ec85HRV4B23yMYUedEdt1SSmnwM/AX6kEM0ivRuhvpUfzeeS2Fl9GwOWYxCGpHoiJ63vtFFcBPAwfrNvaVYWOLoywzzG24aSZeR7x3ITRRSKt0ZV5pS3ElCynR+IfCm2Q+IdDe0Cq68+ZUT4UPIexnJS6V6DNzpDjQrIuyjLfrb4+M/FLz0XNEcnYJaCSIY7xw3cqUHW+C/QEqRDbtwB9FUjEhoKzsN3ATlxYhysAgBYKdfK9fGXITN8tIna8nD6ljlp/BLSglSc388xFBHR7iNGakUqCEhMwI5MNHlBdfFcYvkhRdG53Csz0ulYtxnn2C671c/QVXp0erw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 BN9PR11MB5420.namprd11.prod.outlook.com (2603:10b6:408:101::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.27; Fri, 1 Dec 2023 15:44:29 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892%3]) with mapi id 15.20.7046.027; Fri, 1 Dec 2023
 15:44:29 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nikula, Jani" <jani.nikula@intel.com>
Thread-Topic: [PATCH] fixup! FIXME: drm/i915/display: Remaining changes to
 make xe compile
Thread-Index: AQHaJFwkLyxQ5nwO5UeC8mntmV2WrLCUcE4AgAAhggA=
Date: Fri, 1 Dec 2023 15:44:29 +0000
Message-ID: <3d46b41cdea2f02abd2b7522e2a7345a5ed7f40b.camel@intel.com>
References: <20231201134133.3356433-1-jouni.hogander@intel.com>
 <874jh23um7.fsf@intel.com>
In-Reply-To: <874jh23um7.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|BN9PR11MB5420:EE_
x-ms-office365-filtering-correlation-id: e8a6975a-38e3-4f75-c926-08dbf28467f0
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1F8rZqGIHc473jN7H2tydQev9pbSQONq9eqWyxIZCAyGaOYdcTN6HC0ckxWDvxgXXX5fJgTt1tiEjVP1V1aQ3we6TExbAc42xul99ZdHnID0K4L7TC9VUs7DvtjgUthDs6Jw0ZnIjHMMSXFJEd347aunqYJd2gOeAlbL2+ezTLkGI4UlilLZxJbSt0narUoAZ+9ACXU0l8mr3okKvNUCnl0QY7blgr7f4RX7qiBY4hYirhcwJMUF7O8vcq2KR1ERMRF7yzvwZrogt+NNvwLK0kC1WpwyAwg+Ae8qa5qCNW3feF4VB/f+0gam+A/Km/X9o9whKDGZIsCPbizXdRBp4H8WrvyjXrqiLT536w2ObzBkukVXuD3318w22JKBnVkVDDN4ZWr+Kr33PIDvIGKDFzJD7vyoGfNNZQSPvRfyLrer6VJDIcWbRWish1/XhKPvDTKc9CKPgYgCT6gXj7CIm+3y5MTuZcY5Z2nRuKp5U39Re3Tl8y2trUOhmc+J9z3gdDK6OcCxBUbRU/BE7pZ8Jv7BquCWxuqbCCYqO4j1dnzQgKtF21zdhY84ApLjRe/1w9mUVFA4d2Ci+r7WjCZ+db4PKyw+0xXgoKFjn0FopaNuZNsXrwYBtRVRApHF/6C9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(376002)(346002)(366004)(39860400002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(66574015)(83380400001)(38100700002)(122000001)(82960400001)(38070700009)(86362001)(36756003)(66946007)(110136005)(76116006)(8936002)(91956017)(8676002)(66446008)(4326008)(54906003)(6636002)(66476007)(66556008)(316002)(64756008)(5660300002)(2906002)(6512007)(2616005)(478600001)(6486002)(71200400001)(26005)(6506007)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RVlZcTBoZjZaQmVsdWNPMnpUOVJtUEV6YUVqSVdRYk05Zk5rVXBnZGhpaXE0?=
 =?utf-8?B?WjlGaTNSbzBkVE1OZGE5VGNvblgxRnhRV0p2SXJZRGVKaUNiUklBdzRxeTh3?=
 =?utf-8?B?N0FSeWVNWlI2MzlGQitJSUNBbkxKTEl2OEkwNk1oQlI0K1dKQ0Zpb24vN0JX?=
 =?utf-8?B?Zld5TGFBQktQOWdxdCtxS2JuamRQSTJlWXpESXcya3RabGwvdjY5SDRzQjBu?=
 =?utf-8?B?Lzg2elRxMW05RVc4c2E5eGVoOFRaNC9sVTQzbnZLVHVzOUczeGo4d0xaRTNK?=
 =?utf-8?B?WWU1Z21teWpZUFhHTUJ2NDBIZ1l1Q21MamdXdHUvYW1DaDBWN0VMYVBkeWU3?=
 =?utf-8?B?OFo5L290NmVNaEtXS0NNZkJ2TFdyM0ZoUkJlZjNUQ0VaM0dKdy81SXZkOTJK?=
 =?utf-8?B?ekE1enJqSDR2cGRFNzFsaXhOeldxUUd3OXZJb1A5aFI0KzlwdHlXZ0xoRzFh?=
 =?utf-8?B?aFFZb0I0N0JJUFlzV0FWWWtiVmgraGdIYmtMcFhCUzVEME5QeUJMTWxUQWZo?=
 =?utf-8?B?ZUhiTlJvOFBJSUVrMW5jTXNoZkNzanplZ3hzSlRINWNnNW5WZEhaVSt2MjNq?=
 =?utf-8?B?UWJaT1dvT3BWU2dTeVRrUkpZWlhaTSs3UVA2NjRaMXF0YkgrVEJYWmpwVCtZ?=
 =?utf-8?B?Yk1oSW1EcDU1Y0Q0akIxcndmRzBQTmthUmZ0Z2NGZ01OcllNbk13TkZ1YXFw?=
 =?utf-8?B?enBtYW5uQTRTY2VQWGxYVU9xWGV2aGYwS1RBVmhIdDhEWnEvVmgyNnVBK2po?=
 =?utf-8?B?eEtKSWpGcHhnU3MvRCtZMkVJUXBmZ2VnYXBTcERPSEUwK25DVVBsU05Xc1lZ?=
 =?utf-8?B?MXdOWHlUMUJGS09QcjhvRG8zM2xhSUxNeXZiR2pweU9VNDlMSWtqWTRic1d0?=
 =?utf-8?B?TkVFR3Fva3B6Snd1bHRsOFNCNlFBVnlpWmtVRE00a1pwdCswT0RURmlCb005?=
 =?utf-8?B?VVFnMWl6N2tnSlBHeDBpMWdrWUo5dTkrZVA1aDZvQXJmd1dFdEpucmdsbEJE?=
 =?utf-8?B?YTBUYTBMWmlQYlpzVTRmdXc2Y00ycy9YaTZTVVFJbDQrZmxwSVh1anpLRzVF?=
 =?utf-8?B?cXNPWm91UUtJa3pFVFc3bUQreVZFQU01ZXVOVWEyK2VuNWVsWkdncHcrK0Ro?=
 =?utf-8?B?a053bWNPcm9tNTlPNVFTbzZZVW9jSWVTa1NEdGJjcFFnMlJ2SnVVd3pQQ1FS?=
 =?utf-8?B?cjFhdXZ2ak9WbVVxN3JGVnRRbVhGVWFRSzhpSVhGZkhpOXhvVDRmYjVoTEh4?=
 =?utf-8?B?Y2x0b3hCTmttVWpONUJsOVBDeCswTjVUZjc1VFlEcGRqOEVJMml3Wloxczlp?=
 =?utf-8?B?VzdTL1MxVUNBNlJUeFBLSzdPbXRyeFFKZHdUVzhaNmhKTmMzdkJYUS9HYll2?=
 =?utf-8?B?VDFGRXFiK0UyNWU2bnhhVDNKU3UrQTZWUE00TkVxdDFhUjVxcXFQUUg1U25I?=
 =?utf-8?B?WW1TYWNMTkMxdjJ2UDlZdDBMTzBsV1poMnd6R1JjdTMvckpHYnJoa0ZUb24z?=
 =?utf-8?B?S1NDQXlLekdDR0lEYVUyenc4UEdINGhzTkVMeHBaOXdSdUFaWTNaOURKcjZ1?=
 =?utf-8?B?RDJnMVNXQXRNc0RFZldzdWU0Y1FRU1Q3NVNjWDFPS2FLNzh4NWdmSU0rT2I0?=
 =?utf-8?B?OVBOamh4M3k3K29xcFZwTjFrV1pDeDVaK01lWm91MzhIOEZVMjhWeEpFRXI2?=
 =?utf-8?B?Uys3Q1IwNjFZWGpTUjVpZHk5OUhTQ1Bqa2d1d00yaGpOVUptVTRFd1Uya3ho?=
 =?utf-8?B?RFUvdTFnc3B1VjlnOVJrS1hOZUdiN3NFTUY5TWFyekxFMjc1c0R2VGJwN0p4?=
 =?utf-8?B?S1A2YmZjZ0E0SFI4TXJhZ3Q1S3NVd3dqbzV1bEl0disyc2xCWDUvUm1Bc3Vt?=
 =?utf-8?B?UGtCcWdCMld6cXZWNTB0ODRCb3RNb1BMVmJiVmxRcmZLSFE5eUNCcnFpdU8x?=
 =?utf-8?B?d3F3R05lenhZUW5YeDRQdGNpWmNVZHI4SzNlMi90ZE13TlAzeGdDd1BwdnUw?=
 =?utf-8?B?MUdPdXpNSnRIa1AvQVBnb2FId08xOUU5dDNDMDN3ZXpYcEFiVU5KVWNuaW42?=
 =?utf-8?B?Wi9vem9zQUFwQlAyWlhzSllyY3ZxUzA5L0lxTzIzWjFHOHNjOXF6R0cxeXZp?=
 =?utf-8?B?TzNyZyszZXdmb296aHZPbFN5N1BGcVhVUmlhS0o5Y1RSSGJlTGVYRlhoYVBx?=
 =?utf-8?B?N3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CB99FC2F72A26943A215603AC6CF24F1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8a6975a-38e3-4f75-c926-08dbf28467f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2023 15:44:29.6353 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GYcnNhj5UjfRYxe6URSsGGsDNveWNDATcfZ/n01SWeMiP7tRxSldNvmy+8EXNWdKI5erPDrw3oGyh1nUZlqLOLl6aOfcHA0sxlqBj7Ck8XM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5420
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! FIXME: drm/i915/display: Remaining
 changes to make xe compile
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIzLTEyLTAxIGF0IDE1OjQ0ICswMjAwLCBKYW5pIE5pa3VsYSB3cm90ZToKPiBP
biBGcmksIDAxIERlYyAyMDIzLCBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5pLmhvZ2FuZGVyQGludGVs
LmNvbT4gd3JvdGU6Cj4gPiBSZW1vdmUgYnVuY2ggb2YgdW5uZWNlc3NhcnkgY2hhbmdlcyBmcm9t
IHRoZSBoYWNrIHBhdGNoLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBKb3VuaSBIw7ZnYW5kZXIg
PGpvdW5pLmhvZ2FuZGVyQGludGVsLmNvbT4KPiAKPiBBY2tlZC1ieTogSmFuaSBOaWt1bGEgPGph
bmkubmlrdWxhQGludGVsLmNvbT4KClRoYW5rIHlvdSBKYW5pIGZvciBhY2tpbmcgdGhpcy4gVGhp
cyBpcyBub3cgcHVzaGVkIHRvIGRybS14ZS1uZXh0LgoKQlIsCgpKb3VuaSBIw7ZnYW5kZXIKPiAK
PiAKPiA+IC0tLQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2F0b21p
Y19wbGFuZS5jIHwgOCArKysrLS0tLQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2ZiYy5jwqDCoMKgwqDCoMKgwqDCoMKgIHwgMiAtLQo+ID4gwqBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2Zyb250YnVmZmVyLmPCoCB8IDcgKysrKy0tLQo+ID4gwqBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Zyb250YnVmZmVyLmjCoCB8IDQgLS0t
LQo+ID4gwqA0IGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0p
Cj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2F0b21pY19wbGFuZS5jCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
YXRvbWljX3BsYW5lLmMKPiA+IGluZGV4IGE4ZjM2Y2ExMWUyZS4uMDZjMjQ1NWJkZDc4IDEwMDY0
NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hdG9taWNfcGxh
bmUuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hdG9taWNf
cGxhbmUuYwo+ID4gQEAgLTEwNjYsMTAgKzEwNjYsMTAgQEAgc3RhdGljIGludAo+ID4gwqBpbnRl
bF9wcmVwYXJlX3BsYW5lX2ZiKHN0cnVjdCBkcm1fcGxhbmUgKl9wbGFuZSwKPiA+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fcGxhbmVfc3Rh
dGUgKl9uZXdfcGxhbmVfc3RhdGUpCj4gPiDCoHsKPiA+IC3CoMKgwqDCoMKgwqDCoHN0cnVjdCBp
bnRlbF9wbGFuZV9zdGF0ZSAqbmV3X3BsYW5lX3N0YXRlID0KPiA+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqB0b19pbnRlbF9wbGFuZV9zdGF0ZShfbmV3X3BsYW5lX3N0YXRlKTsKPiA+
IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgaTkxNV9zY2hlZF9hdHRyIGF0dHIgPSB7IC5wcmlvcml0
eSA9Cj4gPiBJOTE1X1BSSU9SSVRZX0RJU1BMQVkgfTsKPiA+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1
Y3QgaW50ZWxfcGxhbmUgKnBsYW5lID0gdG9faW50ZWxfcGxhbmUoX3BsYW5lKTsKPiA+ICvCoMKg
wqDCoMKgwqDCoHN0cnVjdCBpbnRlbF9wbGFuZV9zdGF0ZSAqbmV3X3BsYW5lX3N0YXRlID0KPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB0b19pbnRlbF9wbGFuZV9zdGF0ZShfbmV3
X3BsYW5lX3N0YXRlKTsKPiA+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgaW50ZWxfYXRvbWljX3N0
YXRlICpzdGF0ZSA9Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHRvX2ludGVs
X2F0b21pY19zdGF0ZShuZXdfcGxhbmVfc3RhdGUtPnVhcGkuc3RhdGUpOwo+ID4gwqDCoMKgwqDC
oMKgwqDCoHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdiA9IHRvX2k5MTUocGxhbmUt
Cj4gPiA+YmFzZS5kZXYpOwo+ID4gQEAgLTExNTMsOSArMTE1Myw5IEBAIGludGVsX2NsZWFudXBf
cGxhbmVfZmIoc3RydWN0IGRybV9wbGFuZQo+ID4gKnBsYW5lLAo+ID4gwqB7Cj4gPiDCoMKgwqDC
oMKgwqDCoMKgc3RydWN0IGludGVsX3BsYW5lX3N0YXRlICpvbGRfcGxhbmVfc3RhdGUgPQo+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB0b19pbnRlbF9wbGFuZV9zdGF0ZShfb2xk
X3BsYW5lX3N0YXRlKTsKPiA+IC3CoMKgwqDCoMKgwqDCoF9fbWF5YmVfdW51c2VkIHN0cnVjdCBp
bnRlbF9hdG9taWNfc3RhdGUgKnN0YXRlID0KPiA+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBpbnRl
bF9hdG9taWNfc3RhdGUgKnN0YXRlID0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgdG9faW50ZWxfYXRvbWljX3N0YXRlKG9sZF9wbGFuZV9zdGF0ZS0+dWFwaS5zdGF0ZSk7Cj4g
PiAtwqDCoMKgwqDCoMKgwqBfX21heWJlX3VudXNlZCBzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAq
ZGV2X3ByaXYgPQo+ID4gdG9faTkxNShwbGFuZS0+ZGV2KTsKPiA+ICvCoMKgwqDCoMKgwqDCoHN0
cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdiA9IHRvX2k5MTUocGxhbmUtPmRldik7Cj4g
PiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IGRybV9pOTE1X2dlbV9vYmplY3QgKm9iaiA9Cj4gPiBp
bnRlbF9mYl9vYmoob2xkX3BsYW5lX3N0YXRlLT5ody5mYik7Cj4gPiDCoAo+ID4gwqDCoMKgwqDC
oMKgwqDCoGlmICghb2JqKQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZmJjLmMKPiA+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9mYmMuYwo+ID4gaW5kZXggMTE1MmJkNGNiOGY4Li4zMmRlOTRlMGU2OWUgMTAwNjQ0Cj4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiYy5jCj4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiYy5jCj4gPiBAQCAtNDUzLDcgKzQ1
Myw2IEBAIHN0YXRpYyB2b2lkIGc0eF9mYmNfcHJvZ3JhbV9jZmIoc3RydWN0Cj4gPiBpbnRlbF9m
YmMgKmZiYykKPiA+IMKgCj4gPiDCoMKgwqDCoMKgwqDCoMKgaW50ZWxfZGVfd3JpdGUoaTkxNSwg
RFBGQ19DQl9CQVNFLAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgaTkxNV9nZW1fc3RvbGVuX25vZGVfb2Zmc2V0KCZmYmMtCj4gPiA+Y29tcHJlc3NlZF9m
YikpOwo+ID4gLQo+ID4gwqB9Cj4gPiDCoAo+ID4gwqBzdGF0aWMgY29uc3Qgc3RydWN0IGludGVs
X2ZiY19mdW5jcyBnNHhfZmJjX2Z1bmNzID0gewo+ID4gQEAgLTgwMCw3ICs3OTksNiBAQCBzdGF0
aWMgaW50IGludGVsX2ZiY19hbGxvY19jZmIoc3RydWN0IGludGVsX2ZiYwo+ID4gKmZiYywKPiA+
IMKgwqDCoMKgwqDCoMKgwqBkcm1fZGJnX2ttcygmaTkxNS0+ZHJtLAo+ID4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgInJlc2VydmVkICVsbHUgYnl0ZXMgb2YgY29udGln
dW91cyBzdG9sZW4gc3BhY2UKPiA+IGZvciBGQkMsIGxpbWl0OiAlZFxuIiwKPiA+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGk5MTVfZ2VtX3N0b2xlbl9ub2RlX3NpemUo
JmZiYy0+Y29tcHJlc3NlZF9mYiksCj4gPiBmYmMtPmxpbWl0KTsKPiA+IC0KPiA+IMKgwqDCoMKg
wqDCoMKgwqByZXR1cm4gMDsKPiA+IMKgCj4gPiDCoGVycl9sbGI6Cj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9mcm9udGJ1ZmZlci5jCj4gPiBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZnJvbnRidWZmZXIuYwo+ID4gaW5kZXgg
ZDY0Y2U1YmZlY2E4Li4yZWEzN2MwNDE0YTkgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2Zyb250YnVmZmVyLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZnJvbnRidWZmZXIuYwo+ID4gQEAgLTE5MCw3ICsxOTAs
NyBAQCB2b2lkIF9faW50ZWxfZmJfZmx1c2goc3RydWN0IGludGVsX2Zyb250YnVmZmVyCj4gPiAq
ZnJvbnQsCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZW51
bSBmYl9vcF9vcmlnaW4gb3JpZ2luLAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCBmcm9udGJ1ZmZlcl9iaXRzKQo+ID4gwqB7Cj4gPiAt
wqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSA9IGludGVsX2JvX3Rv
X2k5MTUoKGZyb250LQo+ID4gPm9iaikpOwo+ID4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IGRybV9p
OTE1X3ByaXZhdGUgKmk5MTUgPSBpbnRlbF9ib190b19pOTE1KGZyb250LQo+ID4gPm9iaik7Cj4g
PiDCoAo+ID4gwqDCoMKgwqDCoMKgwqDCoGlmIChvcmlnaW4gPT0gT1JJR0lOX0NTKSB7Cj4gPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNwaW5fbG9jaygmaTkxNS0+ZGlzcGxheS5m
Yl90cmFja2luZy5sb2NrKTsKPiA+IEBAIC0yNTksNiArMjU5LDcgQEAgc3RhdGljIHZvaWQgZnJv
bnRidWZmZXJfcmVsZWFzZShzdHJ1Y3Qga3JlZgo+ID4gKnJlZikKPiA+IMKgwqDCoMKgwqDCoMKg
wqBkcm1fV0FSTl9PTigmaW50ZWxfYm9fdG9faTkxNShvYmopLT5kcm0sCj4gPiBhdG9taWNfcmVh
ZCgmZnJvbnQtPmJpdHMpKTsKPiA+IMKgCj4gPiDCoMKgwqDCoMKgwqDCoMKgaTkxNV9nZ3R0X2Ns
ZWFyX3NjYW5vdXQob2JqKTsKPiA+ICsKPiA+IMKgwqDCoMKgwqDCoMKgwqByZXQgPSBpOTE1X2dl
bV9vYmplY3Rfc2V0X2Zyb250YnVmZmVyKG9iaiwgTlVMTCk7Cj4gPiDCoMKgwqDCoMKgwqDCoMKg
ZHJtX1dBUk5fT04oJmludGVsX2JvX3RvX2k5MTUob2JqKS0+ZHJtLCByZXQpOwo+ID4gwqDCoMKg
wqDCoMKgwqDCoHNwaW5fdW5sb2NrKCZpbnRlbF9ib190b19pOTE1KG9iaiktCj4gPiA+ZGlzcGxh
eS5mYl90cmFja2luZy5sb2NrKTsKPiA+IEBAIC0yODksMTIgKzI5MCwxMiBAQCBpbnRlbF9mcm9u
dGJ1ZmZlcl9nZXQoc3RydWN0Cj4gPiBkcm1faTkxNV9nZW1fb2JqZWN0ICpvYmopCj4gPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZnJvbnRidWZmZXJf
cmV0aXJlLAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIEk5MTVfQUNUSVZFX1JFVElSRV9TTEVFUFMpOwo+ID4gwqDCoMKgwqDCoMKgwqDCoElOSVRf
V09SSygmZnJvbnQtPmZsdXNoX3dvcmssCj4gPiBpbnRlbF9mcm9udGJ1ZmZlcl9mbHVzaF93b3Jr
KTsKPiA+ICsKPiA+IMKgwqDCoMKgwqDCoMKgwqBzcGluX2xvY2soJmk5MTUtPmRpc3BsYXkuZmJf
dHJhY2tpbmcubG9jayk7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgY3VyID0gaTkxNV9nZW1fb2JqZWN0
X3NldF9mcm9udGJ1ZmZlcihvYmosIGZyb250KTsKPiA+IMKgwqDCoMKgwqDCoMKgwqBzcGluX3Vu
bG9jaygmaTkxNS0+ZGlzcGxheS5mYl90cmFja2luZy5sb2NrKTsKPiA+IMKgwqDCoMKgwqDCoMKg
wqBpZiAoY3VyICE9IGZyb250KQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBr
ZnJlZShmcm9udCk7Cj4gPiAtCj4gPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGN1cjsKPiA+IMKg
fQo+ID4gwqAKPiA+IEBAIC0zMzcsNyArMzM4LDcgQEAgdm9pZCBpbnRlbF9mcm9udGJ1ZmZlcl90
cmFjayhzdHJ1Y3QKPiA+IGludGVsX2Zyb250YnVmZmVyICpvbGQsCj4gPiDCoMKgwqDCoMKgwqDC
oMKgfQo+ID4gwqAKPiA+IMKgwqDCoMKgwqDCoMKgwqBpZiAobmV3KSB7Cj4gPiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgZHJtX1dBUk5fT04oJmludGVsX2JvX3RvX2k5MTUob2xkLT5v
YmopLT5kcm0sCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZHJtX1dBUk5fT04o
JmludGVsX2JvX3RvX2k5MTUobmV3LT5vYmopLT5kcm0sCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYXRvbWljX3JlYWQoJm5ldy0+Yml0
cykgJgo+ID4gZnJvbnRidWZmZXJfYml0cyk7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoGF0b21pY19vcihmcm9udGJ1ZmZlcl9iaXRzLCAmbmV3LT5iaXRzKTsKPiA+IMKgwqDC
oMKgwqDCoMKgwqB9Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9mcm9udGJ1ZmZlci5oCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfZnJvbnRidWZmZXIuaAo+ID4gaW5kZXggMDA0NjdkNTEzZTc0Li5hYmI1MWU4YmI5MjAg
MTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Zyb250
YnVmZmVyLmgKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZnJv
bnRidWZmZXIuaAo+ID4gQEAgLTI4LDEwICsyOCw2IEBACj4gPiDCoCNpbmNsdWRlIDxsaW51eC9i
aXRzLmg+Cj4gPiDCoCNpbmNsdWRlIDxsaW51eC9rcmVmLmg+Cj4gPiDCoAo+ID4gLSNpZm5kZWYg
STkxNQo+ID4gLSNpbmNsdWRlICJ4ZV9iby5oIgo+ID4gLSNlbmRpZgo+ID4gLQo+ID4gwqAjaW5j
bHVkZSAiaTkxNV9hY3RpdmVfdHlwZXMuaCIKPiA+IMKgCj4gPiDCoHN0cnVjdCBkcm1faTkxNV9w
cml2YXRlOwo+IAoK
