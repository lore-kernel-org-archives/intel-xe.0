Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48C3C4707B
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 19:18:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A198810E4D2;
	Tue,  9 Jan 2024 19:18:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E03E210E4D2
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 19:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704827889; x=1736363889;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=2crdRapBbBVslonijntTHHOCcXEKB3c6jfMpfPAIqmU=;
 b=YXKwnLwxuntbPomQ7O5MQTiA9EaOKw86Yp8kCqxOiFl/wfdGuIzp4IwK
 q3HkgxcgaHpC7A9ZeiS4mNhWBfO9pPLN48VJ/7Br0osIE9BZ+o7ERWMu6
 zozur7hww1iq33uHtrPymQikxyGc8MAS29r2mXeB29cjf7aK9q/Kb+02c
 h6ujxZnvErbpxVqlwR7w74UMfJ2T0KjyfabaNYk3cjjuNP7gDYMtRk6Mw
 D6YYV170GqigvTRE6mZTi95cSuPeTlf4XX+5j7gLOEFfrPGj0ruavkLUt
 5s0O4vLWp9idNi8cdRurSP8edRu0z7IREt55fDLPqN26g+ZNpnLEKBtSk g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5074534"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; 
   d="scan'208";a="5074534"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 11:18:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="1113183855"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; d="scan'208";a="1113183855"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2024 11:17:59 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Jan 2024 11:17:58 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Jan 2024 11:17:58 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Jan 2024 11:17:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W+aem7kz0/wPCkcBA48I6mOV+yz68Kn74IlOjKWlrdds3A4J6YSh5AHLBENbfFOgJ4eiuj0VhCjpzBSUb+1lWeXI1HuhqDyTt33GuTyCXaX92HGsLH4BEaDCPYygSaHp82MMTChGcB07MTRge/5emq8b24tgPG3kfXGlewKB8Q9Tf20ny5dOPNbWG7UiljEUlMXLHt/xOPTdJlXJqjv81QfvpyPpyqysBW5hOWewQfQbg3n7vwYMMjUCgKQiyN7LL+gc/g3MOAhP8fNIvR6UL18MjyVL8/f+yq4jK5IRdvJDvVcPIHvzifyfyYr3qtm3MpubjTvOglmY/M5LC5Q2zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2crdRapBbBVslonijntTHHOCcXEKB3c6jfMpfPAIqmU=;
 b=JxRT0LwOg/1PsE84+6+F3L6mGJCm7AeQR/OaXNGT8xRBegrwgst+IPS7cyhnTLz8iobN7RbzJwuMp/mTzIRIQCOq920gyVR/QCT1tUvRPfjaniOGSygGhBShUGtvGt7Z7D5VhdIiyqilB/4wq2iAI2Llr1or66xORERhaAGz/ITQLDoMV+WAqiBBLD6Mtf5YNVu3lkpFCB9mPY1skS7tG6aT83JFpAXSCmpA0Kzqd+EUPCJ1op+xeDMemLk/1aPavey8pcWlunlLc3zdsvepdP2eQ3iM/3cYcvLGLZ++TTHjS2oLzH2rI4u31od+fP9EkjsgH+NZ6WUGmjZTCbHBTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SJ2PR11MB7597.namprd11.prod.outlook.com (2603:10b6:a03:4c6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 19:17:53 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::da85:3d5:65fd:4a21]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::da85:3d5:65fd:4a21%7]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 19:17:53 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/gsc: add support for GSC proxy interrupt
Thread-Topic: [PATCH 2/2] drm/xe/gsc: add support for GSC proxy interrupt
Thread-Index: AQHaLJdkHXlD3jMZiE2UtSBkunUqoLDQeacAgAAEmgCAAYmiAA==
Date: Tue, 9 Jan 2024 19:17:53 +0000
Message-ID: <f619a1f0622c8fd16d3acd9c96f5120380499d01.camel@intel.com>
References: <20231212010600.3479465-1-daniele.ceraolospurio@intel.com>
 <20231212010600.3479465-3-daniele.ceraolospurio@intel.com>
 <da9150ba144d47c347ec3e17d3ec81b8609ce943.camel@intel.com>
 <be241892-665d-4da0-99ab-d897a1eaabd1@intel.com>
In-Reply-To: <be241892-665d-4da0-99ab-d897a1eaabd1@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.0-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SJ2PR11MB7597:EE_
x-ms-office365-filtering-correlation-id: 71655ce3-6065-448a-67e8-08dc1147adb3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4VBTCxrLtSCJjzt1Kwp/7dnaiB3FQuXuCpZA3a7DZ3l1hibCYWIqoaQKzetUeq9KTVw3ZpmhOlM8GaS5Z2Wb1D0mM/1gs/GcaNPrQIDF3r7HmXJFWIwtVrKTXJcS6zJIbCm4zejUe579zM9zKVNcBgQfuWZsHfJMB12mOpfCFzblf987puoUifvpG44+VuAVcBFT8pyLbr/x1Uvy2CE1JGi0Ll2ZSCam9oavAPk9Ps3wlnJaZcs+vX7yJCTHRosL8oMO6dZTor5Xjb2TyfTqzId3elF+Ca3jsdtwV4D8eq1NtjQjGAhdKoW6SRqFgJ0o1HVi0jRkQtmBqfSa8I1rBMvue67lhlr/E1Vb3XgDGSSPoUK0leV3FxyGZ+goZkVZ5E8wljO3aFVPNAvYZ7pl1h0q4jzs998MudegF7j2QNRG8yzIB3UkjOQy02ladRb/vK31P7bAQFwgYyxAICSSlwqN7XAIvwUi1Mb1aZuXWjZ2lS2jl5wKSr8e+bwaRN1BWUxseZqy8CN+thOY9lBcK2oJEk3/Es1sRq6sWBGdfS4emX+Yi8gtqMivvx50Y94WR/rIKkE9g69toV7P00sc0qUu3Sjpjjc1owIuBipCXwffeUXIdM7fFGSSepMb201IL21Zr0un9TXuO9g05bdZeg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(396003)(366004)(346002)(376002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(53546011)(26005)(478600001)(6512007)(2616005)(6486002)(71200400001)(6506007)(83380400001)(38070700009)(2906002)(5660300002)(107886003)(4001150100001)(8936002)(41300700001)(66446008)(66556008)(6636002)(66476007)(64756008)(316002)(91956017)(76116006)(110136005)(8676002)(66946007)(4326008)(38100700002)(82960400001)(122000001)(36756003)(86362001)(87944015);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UWdvNUgxRStjM3lFQUY4WHdPTlFTNDZJMHluaU0wUDRzOG9XcVBkZ2p3ZERj?=
 =?utf-8?B?eHBCaHdPOEd2Z21yRy8ycHNFM242MkowWXdBR3l5cVdFZ09ETUI2a1Z0eEtH?=
 =?utf-8?B?OGNWZ2s2NnRvbjU0OGgzVkk2WEhTZFUwRmJ0Q3BmNkYwYU9QYi9xc0ZQU3B0?=
 =?utf-8?B?R3RZbllEMFp1TFhFSEhLWXJoYk1DWDE4RTU4cUs4d0ppS3FjRmVNOWpaaE9E?=
 =?utf-8?B?eFZXZERseE5RTGtZMkt0Snl6MGxQd1JhR1JlS3MwS1M0NUMrOTByZXFJbitZ?=
 =?utf-8?B?cDVNTFpUQmoramgxV2c3NUtaQjR5M0hTcjUwVk1JMVdJSUJ6Nng3SVlTVksr?=
 =?utf-8?B?U1NJQzBlaU9YYXBmVFVTTEhqMHNvb2JMUjNGaGhUYnVqMnY5alpiMjFJNFUy?=
 =?utf-8?B?bWllQjRGNjJBYTZya0U2Z09tV3dtN0UrUlVXVGFudkdWK3licks1WDBMYThJ?=
 =?utf-8?B?SG5oeVlNMHVSbGVBZkR1Y084Q0xOajlmVUt1dDczeWVFeWhqMkM2L2VxTHdy?=
 =?utf-8?B?RU5hdXJtdmlha1JRSit4Ty9vOEVOdXlGZGdkVnBqN0JOVkNFdFNoaW84eUN1?=
 =?utf-8?B?K0J5WG1jeVpBamtyamJndC9vbC96dERPMU1EUDNzZGZZUWRscHJKN0pUcDV4?=
 =?utf-8?B?QjJWWksxS3pITWo4VjA0eU1sYzQwNWRHVjF2bHZlbjNyZ243R2FRWWxEdDJn?=
 =?utf-8?B?dWF3MXBmRWMzL3c1dG5YbDY2YS84amJrRURyYktubnZUYnJHYW9jMHRtQ1pn?=
 =?utf-8?B?RVlzeTUwb3NhUXpRNWNpR09qUVMrTFBCT3h3MStHcDlJUkl2ZXUyY1VkTHVj?=
 =?utf-8?B?R01lVG9Iem1TSC91Zk41Z0g2alNkVWNIU1UvVXRmOXNWSFlHM3RHMVU2T1Fr?=
 =?utf-8?B?eC9nZnZZMGcwdmxaUlZXMDNyYlFoQmE4bHN0MWhDZHRTa0lwaFlKL3pKeGRP?=
 =?utf-8?B?YVFKd3pHTzc4UDRDcGkzUmg2QndqYnBaVUtFRFdNVjU5ajRQSk4yNUh6ekNw?=
 =?utf-8?B?Y0hvQmlxL2NHQmRHc3hMRmtHcUpwaTBLb2kycWFZcG0zYlBjYWNXL3BHbUVE?=
 =?utf-8?B?ck5GL2FabzE3NHRUOXhzb1EyRjJmWFF2elIzN2VubzUxUEpQL1lhb0h6WHBI?=
 =?utf-8?B?eEQ1cTh2ZHN3cW1NL1JISFRDeERCV2FIekNYU0NBVmErRnB4VE5KZk0wQTBD?=
 =?utf-8?B?eXovdHFTTHk5dE5QQ1Y5TlRtYVhjWDBvVzNBV1dJTVNhMmZtcHJXVWJsdjhy?=
 =?utf-8?B?RThqVFJvTFBNcmpVek9ZTDNBOURTWUU4V3pHNnhScCtRQVh3Rmx4UUgveTM3?=
 =?utf-8?B?Y3ArV05kV0Y2WGllSUsxZWZ0QWJrci9zUEZzTEpCNTEyYWk1SWJibEtaMXUv?=
 =?utf-8?B?S3p5R2NvV3hyME4wWmNIaFZXL0hVYmVYR1VIcFBRWldrY0NMUWNsUVZaYVFR?=
 =?utf-8?B?VnNwWkxiZ3E4Q3N6OFh4aW5NaWNXWjd0MFNSUEVjWTF5K2dWbFRDMkg3eEkz?=
 =?utf-8?B?dDN1YXhtMzlWNlJrY0g0U2lKZ3lSdnluY2I2cGNMcWo5NjNueitqTlM0ZEcr?=
 =?utf-8?B?VzV6aGM0VURtdmxTQ3k5RGpmOE1NSUFYSXdsczYwbnZqQm1Yck9iaXdjMEpY?=
 =?utf-8?B?WkZnNmNTZkRYRUQzMExqSUxlYUhuMmIwZG5CK05RTExoZllHZ2MwUDBpNVdX?=
 =?utf-8?B?SzhyNUVLd3IxMTNCdUl0VWEvNjlsVGtMekZmQ1FISXRHZGJ4bGFNVCsweUIy?=
 =?utf-8?B?cnVJZG9EYjEvb0t3dVQ1V1hONDM4SjZoUDNrV0REZGNaSzFidURDY3lBQm1Y?=
 =?utf-8?B?MzZob2F0aERnRXM4WlJJcFlSRHp2UXB4bWNrU2E0VXVvK083WnBIVmhSTC9L?=
 =?utf-8?B?cmFsb1gxTE9IaHJwN2dYL3p2UkR5Rm1LREE4U3lkWlZGTTgwUys0NXlsOXM4?=
 =?utf-8?B?Sjl4a1EzNXQ2emMwSk05ZGEvR3AxeWZIa0NEV3BPNnB2dzZSa1dOcjlLTU5v?=
 =?utf-8?B?MURUZ3ZsMlNZaHJ4TUZ0Yjc0WnpiUHkwMXdIOWRVbHd2N1BZcVNMcjRzVVlw?=
 =?utf-8?B?N2tGbUZhbzZXTlk5UXhMNmJsTFR3Ym0rU2VmZ3hnUzNRWkNEd29lajh0Ni80?=
 =?utf-8?B?RFBmNldQVm4rdjVVa2t0OFpOM1M5Z0tVS2VoVHZSek9FRER3dEFOTENCTThm?=
 =?utf-8?Q?VApKTo8Yrv7JeNGRjxXP4yg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A5A43C072B2D8B48806DE70EEA94DE5F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71655ce3-6065-448a-67e8-08dc1147adb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2024 19:17:53.4291 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a+23L/v7BEOzM+8o/x9aQxQn6HVmArTzQo3arayQhLkKd/r1OJTavjszwBw8OQCz26D5cWrgSEE0XJRAkH9mkctTL1bZ5AWgH37jo6ZsT1aoTO5Jf9q3CYjewaRmhfJD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7597
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

T24gTW9uLCAyMDI0LTAxLTA4IGF0IDExOjQ4IC0wODAwLCBEYW5pZWxlIENlcmFvbG8gU3B1cmlv
IHdyb3RlOg0KPiBPbiAxLzgvMjAyNCAxMTozMiBBTSwgVGVyZXMgQWxleGlzLCBBbGFuIFByZXZp
biB3cm90ZToNCj4gPiBPbiBNb24sIDIwMjMtMTItMTEgYXQgMTc6MDUgLTA4MDAsIERhbmllbGUg
Q2VyYW9sbyBTcHVyaW8gd3JvdGU6DQphbGFuOnNuaXANCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9ndF9yZWdzLmggYi9kcml2ZXJzL2dwdS9kcm0veGUvcmVn
cy94ZV9ndF9yZWdzLmgNCj4gPiA+IGluZGV4IDVmNWE3MmU5ZDBkOC4uOWY1ZjIxNTAwMzRhIDEw
MDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3JlZ3MveGVfZ3RfcmVncy5oDQo+
ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9ndF9yZWdzLmgNCj4gPiA+IEBA
IC00NTAsNiArNDUwLDcgQEANCj4gPiA+ICAgI2RlZmluZSAgIElOVFJfRU5HSU5FX0NMQVNTKHgp
CQkJUkVHX0ZJRUxEX0dFVChHRU5NQVNLKDE4LCAxNiksIHgpDQo+ID4gPiAgICNkZWZpbmUgICBJ
TlRSX0VOR0lORV9JTlRSKHgpCQkJUkVHX0ZJRUxEX0dFVChHRU5NQVNLKDE1LCAwKSwgeCkNCj4g
PiA+ICAgI2RlZmluZSAgIE9USEVSX0dVQ19JTlNUQU5DRQkJCTANCj4gPiA+ICsjZGVmaW5lICAg
T1RIRVJfSEVDSTJfSU5TVEFOQ0UJCQkzDQo+ID4gYWxhbjogc2hvdWxkIHdlIHN0aWNrIHdpdGgg
T1RIRVJfR1NDX0hFQ0kyX0lOU1RBTkNFIHRvIG1hdGNoIHRoZSBuYW1pbmcgaW4gb3VyIGh3IHNw
ZWNzPw0KPiANCj4gQUZBSUNTIHRoZSBIVyBzcGVjcyBhY3R1YWxseSBoYXZlICJTZWN1cml0eSBF
bmdpbmUgSEVDSTIiOyBJIGFiYnJldmlhdGVkIA0KPiBpdCB0byBqdXN0IEhFQ0kyIHNpbmNlIHRo
ZSBtYXNrIHJlZ2lzdGVyIHdhcyBsaWtlIHRoYXQgYXMgd2VsbCAoc2VlIA0KPiBiZWxvdyBjb21t
ZW50KQ0KYWxhbjogaG1tLi4uICBpIHRoaW5rIHRoZXJlIGlzIGEgaHcgc3BlYyBwYWdlIHRoYXQg
anVzdCBsaXN0cyB0aGUgdmFyaW91cyBlbmdpbmUgaW5zdGFuY2VzDQogLSBob3BlIGknbSBub3Qg
bWlzdGFrZW4gLSB3aWxsIHN5bmMgd2l0aCB1IG9mZmxpbmUuDQphbGFuOnNuaXANCg0KDQo+ID4g
PiAgICNkZWZpbmUgUkVOREVSX0NPUFlfSU5UUl9FTkFCTEUJCQlYRV9SRUcoMHgxOTAwMzApDQo+
ID4gPiBAQCAtNDYyLDYgKzQ2Myw3IEBADQo+ID4gPiAgICNkZWZpbmUgVkNTMF9WQ1MxX0lOVFJf
TUFTSwkJCVhFX1JFRygweDE5MDBhOCkNCj4gPiA+ICAgI2RlZmluZSBWQ1MyX1ZDUzNfSU5UUl9N
QVNLCQkJWEVfUkVHKDB4MTkwMGFjKQ0KPiA+ID4gICAjZGVmaW5lIFZFQ1MwX1ZFQ1MxX0lOVFJf
TUFTSwkJCVhFX1JFRygweDE5MDBkMCkNCj4gPiA+ICsjZGVmaW5lIEhFQ0kyX1JTVkRfSU5UUl9N
QVNLCQkJWEVfUkVHKDB4MTkwMGU0KQ0KPiA+IGFsYW46IHNpbWlsYXJseSwgaSBiZWxpZXZlIGl0
IG1vcmUgbWFpbnRhaW5hYmxlIHRvIGZvbGxvdyBodyBzcGVjOiBDUllQVE9fUlNWRF9JTlRSX0VO
QUJMRQ0KPiANCj4gVGhpcyBpcyBIRUNJMl9SU1ZEX0lOVFJfTUFTSyBpbiB0aGUgTVRMIHNwZWNz
Lg0KYWxhbjogb2theSB0aGFua3MgLSBJIHNlZSB0aGF0Lg0KDQo+ID4gPiAgIGludCB4ZV9nc2Nf
cHJveHlfc3RhcnQoc3RydWN0IHhlX2dzYyAqZ3NjKQ0KPiA+ID4gICB7DQo+ID4gPiAgIAlpbnQg
ZXJyOw0KPiA+ID4gICANCj4gPiA+ICsJLyogZW5hYmxlIHRoZSBwcm94eSBpbnRlcnJ1cHQgaW4g
dGhlIEdTQyBzaGltIGxheWVyICovDQo+ID4gPiArCWdzY19wcm94eV9pcnFfdG9nZ2xlKGdzYywg
dHJ1ZSk7DQo+ID4gYWxhbjogbml0OiBqdXN0IGEgcXVlc3Rpb24gLT4gZG9lcyBody9mdyByZXF1
aXJlIHVzIHRvIGVuYWJsZSB0aGUgZ3NjIGhlY2kyIGludGVycnVwdHMgaWYNCj4gPiB3ZSBhcmUg
bm90IHlldCBwcm9jZXNzaW5nIGV2ZW50LWJhc2VkIHJlcXVlc3RzIGJ1dCByYXRoZXIgZG9pbmcg
anVzdCB0aGUgcHJvYWN0aXZlLXN0YXJ0dXAtcHJveHkNCj4gPiBzZXF1ZW5jZT8gKGkuZS4gbWF5
YmUgb25seSBlbmFibGUgSVJRcyBhZnRlciB0aGUgcHJveHktcmVxdWVzdCBoYW5kbGVyIGNhbGwg
YmVsb3c/IGJ1dCBpDQo+ID4gZ3Vlc3MgaXQgZG9lc250IG1hdHRlciBlaXRoZXIgd2F5KQ0KPiAN
Cj4gTm90IHJpZ2h0IG5vdywgYnV0IHRoZXJlIHdhcyB0YWxrIGEgd2hpbGUgYmFjayB0byBtb3Zl
IGZyb20gYSBsb29wIHRvIGEgDQo+IGZ1bGx5IGlycS1kcml2ZW4gZmxvdyAoaS5lLiB0aGUgR1ND
IHdvdWxkIGdlbmVyYXRlIGEgbmV3IGludGVycnVwdCBmb3IgDQo+IGVhY2ggbWVzc2FnZSBpbnN0
ZWFkIG9mIGNoYWluaW5nIHRoZW0gYXMgaXQgZG9lcyBub3cpLiBJZiB3ZSBldmVyIGdvIA0KPiB0
aGF0IHdheSwgdGhhdCB3b3VsZCByZXF1aXJlIHVzIHRvIGhhdmUgaXJxIGVuYWJsZWQgYmVmb3Jl
IHRoZSBmaXJzdCANCj4gcHJveHkgaXMgc2VudCwgd2hpY2ggaXMgd2h5IEkgd2VudCB3aXRoIHRo
YXQgb3JkZXJpbmcgaGVyZS4NCmFsYW46IHNvdW5kcyBnb29kIC0gc291bmRzIGxpa2Ugc29tZXRo
aW5nIHdlIGRvbnQgd2FudCB0byBpbnZlc3QgaW4gdW5sZXNzIHdlIHJlYWxseQ0KaGF2ZSBhIHVz
ZS1jYXNlIGZvciBpdCBjb25zaWRlcmluZyB0aGUgZ3NjLXByb3h5LWludGVyYWN0aW9uIGlzIGJh
c2ljYWxseSBhIGZpeGVkIGZzbS4NCg0KPiA+ID4gKwkvKiogQHdvcmtfYWN0aW9uczogbWFzayBv
ZiBhY3Rpb25zIHRvIGJlIHBlcmZvcm1lZCBpbiB0aGUgd29yayAqLw0KPiA+IGFsYW46IG5pdDog
ZGlkIHlvdSBtZWFuICJpbiB0aGUgd29ya2VyIj8NCj4gDQo+IHdlIHVzdWFsbHkgY2FsbCB0aGUg
ZnVuY3Rpb25zIGp1c3QgX3dvcmsoKSwgbm90IF93b3JrZXIoKSwgc28gSSBtYXRjaGVkIGhlcmUN
CmFsYW46IHNvdW5kcyBnb29kIC0gaXRzIGEgbml0IGFueXdheS4NCg0KDQoNCg==
