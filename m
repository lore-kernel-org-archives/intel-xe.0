Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B8CC4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 06:18:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6007910E037;
	Fri,  8 Dec 2023 06:18:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18AD910E037
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 06:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702016323; x=1733552323;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=WpCqH71jn23wE/I1CkYhfrhxlNiIDeKTil9LzSvxmAQ=;
 b=UJzbAmKF9/NtrJ3H426w5u/+eusAiBq9uNXlf53XeFHLM/hIvfGqmToM
 92NeGgWnVbUzayabqEpWDVKOxg0vCGNUeqSgaFpK+bnb/NVCps6Q+C3Cw
 NHt7Jb9sbiI1P/oZhAgW+4LrdqhhXVN5gR2erlHJtJodg8omAWXaNNPsN
 eJq5F83x+19HNHzCmw+SWBBMu50vR172Aj5u86wDOnVAQ4LfSgZyejO63
 Uom4j4iy+NVSPYvjhVm1EF6N3sGa8g9bhRRsaLRN9l+d4LHwZFYS3d8co
 TJ10eoR0U9h+r3t+X1NMwtoNPWsHJoL/vuoa7E7YyIqqhhkAFxcuLctjQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="13062498"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="13062498"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 22:18:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="772025084"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="772025084"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 22:18:41 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 22:18:41 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 22:18:41 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 22:18:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QswZIh4goeH6cSYlqC4CC6ij09/2OPmEx7qrPG9CInrTptMC4rJLJl119WNxldU2tSApfL/2q4PtwBFYH5aI6qq7Mf5M4NOyX//SmT54un/vbpowhQ/RaK9nxEAdzV0mQzLw7aV4S06dNSIyIQiyHtSyKCvAY5NiS4K3/5nP1rUyco0oErY5Ch0RrlDKBlqrJFHWbA2849od+YPJ08fdkxn3lDKpIqU6T3GU9GjwoNmWhBG7uVB4u/eOtOg7wgXEfdQ5WPT7bSpw9mY6EFsLEjnU+JOjPJZs0Yiy30pfSpWnFpOQ8F3rPq2BalpzoMajb5nmqoVglEzmOCXnN+Ra5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WpCqH71jn23wE/I1CkYhfrhxlNiIDeKTil9LzSvxmAQ=;
 b=KgNsNgkSS+DsCqda+IAI4zKKDr/25oUycryOpB6Vcm2pdPpfBI/2xKACQWBLcuL3Gtzb9A4C/ebIdSU64gGbbM7m9Td2QProRe0m26a7/LvgwOQVAD22INWUpTf9bdt/7NGEn0YuYjdZqMJVso0UtDoQsO/i4Z+KqCXMcfWT+7VsH8s6+A0K2DvcARJMTGUdMNy54sOF/CA/Ael/RMEmmeeT7nKwy8xCGozNtwjw3qNjYmT8G6YquFKL0w0vOEyat2VsmvCDXOaDNw6zcSAejatG2LXZBptEVqTMdMxQbi8l2SBld5xBCBB2gUAADHt/LVq9AKFkpWRraTP9467O2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 PH7PR11MB5958.namprd11.prod.outlook.com (2603:10b6:510:1e1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 06:18:39 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892%3]) with mapi id 15.20.7068.028; Fri, 8 Dec 2023
 06:18:38 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v5 0/9] Intel_fb.c refactoring
Thread-Topic: [PATCH v5 0/9] Intel_fb.c refactoring
Thread-Index: AQHaKM2GbBFQuwynX0q4W0Zv8QbggLCd7U+AgAD914A=
Date: Fri, 8 Dec 2023 06:18:38 +0000
Message-ID: <87cc527a8e5021456fb37781ac97bda8f5794bed.camel@intel.com>
References: <20231207052252.2092191-1-jouni.hogander@intel.com>
 <da07bf9b-116b-48c6-bd4c-20ffcb20da54@linux.intel.com>
In-Reply-To: <da07bf9b-116b-48c6-bd4c-20ffcb20da54@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|PH7PR11MB5958:EE_
x-ms-office365-filtering-correlation-id: 447d7661-538f-4b7b-0634-08dbf7b584a3
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /qoaHsjHY4Y5bVJ6Aw8D95iDszY0Rc1RmJRO1PuzLgkWSh5k6SBrudp7ZSMjmfgItOdyYGJTk3bkiALzXceHqNaVFIaCcELyh3CdMU6/9wDtiZihuPnTpuTBIgXyFhHfrAQf9DvOP1gugQ2KWZTeQxbFOtkHg5vMUMdLcmL1LTtTMS422aEH1ofl1z5Ha9I6iUChD7TTL7CPu190fV50X6aQ+bEPAQyXDx/qFFrpc16zNnTt0cWpSR65Q7Cj32XR1KK0k3oc2jgGYerLwVlzrcJgdi77zykTJ0APBgyrzrTe2xih7/nG9/oVn/BqU3iwau7sKKKkkMPMmDaJA6vuX412XFG4JFYifCJ0beuu4vjeQtEn0BqebsRsdBR+gWOltF0fEr1dy143cfnor2teWB2hz1lrOkMYGlLuyN/+TpqjRpj7z3SOkwl55JTTsOl+WngWA8nFPVLDp24Hu67f5W8D77GIX0cuhagX/x4mZrW9sq7lxjXVZBl+sYxDR/piw7XBKML7WzPFKAMzYNZr4/7H50Nv29g4gtqJIcYz+oS2H9pnvBlYHDr7mcQLFlMb1Y6mGgvVGIuBVcz2udxe/ERDj9zQzZC9Tlf4z0vccU8enWxRbpYJhvKfRciWkyO4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(366004)(39860400002)(136003)(376002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(5660300002)(2906002)(4326008)(8936002)(8676002)(36756003)(86362001)(38070700009)(41300700001)(82960400001)(66574015)(83380400001)(6512007)(26005)(2616005)(91956017)(66446008)(66946007)(64756008)(76116006)(66476007)(54906003)(66556008)(110136005)(316002)(38100700002)(71200400001)(6506007)(122000001)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NXRmYTA0ZzFMaTc5NXoyZDQvdFdUNnVYc25TRFE4dTYwTE42WlVrTzZCR3Ix?=
 =?utf-8?B?ZWxITklxcDNtRmtjekwwMVZyYW1PSHNxSkd0dUpzd21lNlNZRUV2ek1KdzIv?=
 =?utf-8?B?MjJVRDl5blJtT2s5WHpXLzFJV2o4WlU2Ym1YYlY0dk90RS9BRTV3eStQdGt5?=
 =?utf-8?B?clFyTzNFTkJ3dnY3SUg4QU9nbW5hcjJTVGs2OWdYanY5SHh5dVhkbkpGQmdn?=
 =?utf-8?B?MnpoaEVIclh5MmpTOHBzUG9Oc1hmNDNRMHNleHk0a2p6ZjZLbWFrZ0FycjF4?=
 =?utf-8?B?TXRNMlljUWY5eGMzampnUzVaUHQrWFU5TlBnb00xMGIvbjM3aHl4NUxaVitr?=
 =?utf-8?B?a1ZPYkxpVkZRb1pCRUdTblpWT2hPR0VkRTVCZjJ2a1B4eEZoOE5KSWxpaXN5?=
 =?utf-8?B?NzNLdTNMMTVaZVkvSTdqY1QzSVNZczdVNWUrMTZaQmxRUmhxMHB2SDhlc2dS?=
 =?utf-8?B?eTdGMEpMaEFBRVp6bU5HTTNpK0RsN0JpOGQvanlsTWNYcWtubWFmVSs3OFgx?=
 =?utf-8?B?M1FERERVQndocUllcWZzdklrMVpkMmVCWTZPYWp3Y0plRmo0V3FHaThMbjI3?=
 =?utf-8?B?NkQ4TzFyUXpZS0lJOG0xUTZyWXpJYmNTaGNDNFFYN0hQYnNaK3RyeDhab1dQ?=
 =?utf-8?B?Uk1QM2gwN2FhL2ViRGdvZWlzdGg1ZVlpSXp2a2Q1dGRCNTNJMjNrdHkvUmpq?=
 =?utf-8?B?VUNzeDdiaGtVaS9CVmpHMUNrekRsMi94NG12RnByeHhPZ3VlSll0d1gxbEh2?=
 =?utf-8?B?K0l1RGtxL2V6K3ZVOTY5M0FqdFlzK1NodnBzdytINHZ4NlZuSEluWnU3WlZ6?=
 =?utf-8?B?RmVqaWs1eEdYeVN2dXZvOVk0cXpTT3M2eHdTVTdid2kvZXYzaTVYSWVCN0xp?=
 =?utf-8?B?U1pzQkc1dnpKUVlXVTV6UVo1YkJoais3b0tWL1VBVUF6NHhqVzRSeEhBeGxm?=
 =?utf-8?B?Zy9VRCtZMWNiZWJLN1BYemVtSDhrVndjL1hpQTVJcUdDZE40N0xEeU4vZDVm?=
 =?utf-8?B?ZFRiaXVCdUc0bTcyWVpFeEVKUmsvTGlOcUFSSWtTaDcybEJOQXpTNkEyZzU0?=
 =?utf-8?B?NnRxRzgzUlgxODJkSndiY3RWd0QzaWNHMWZaOUE1VTBHUFZ1bEprRkd2cjl2?=
 =?utf-8?B?MStEby83cGgzcDkvN2oycVFrMUtCb0thdEtOa2x2M0pGeUZXb0YzMFVLSnBI?=
 =?utf-8?B?QjI3YTZvM0x0SGRTM2gxcHFjT3J1YXNEREs4TUVZUU5oRjA3VTVsWUJFTDR4?=
 =?utf-8?B?SGFxQStBRWtRV3V3RXNKVEJicUdicHRxR1N6aTBNUWlOTXIweGJvR3M4Y2Jy?=
 =?utf-8?B?TEpVWmlYaVlmVjZNZVcxZ2RIZHgvSHM0QnoyT0FCZ3dJQS81aUJ1UDRjZzhR?=
 =?utf-8?B?SnBmeUJrUG1hTERKbkR6UDhBeTRzUHlVc2s0amhkajZlVFYxMVB0VUtpV0o0?=
 =?utf-8?B?aWNHTU9LMHF6MkNxd2Y0MTZNMlhqZC9wdUVZSkZ3YU96R0Z2Vk5FUnFmeXFQ?=
 =?utf-8?B?c1BiTjdMa2hkNlF3ZEdGZGNCRlV4M2duTC9rZ3Q4TGs4c0oweEw5RkE4Yklj?=
 =?utf-8?B?MXh0S2dydGxVWDNodlFqQ2Q0c0UweUhDRElJTXVHNXNoMnplTmt5b2RiZE9K?=
 =?utf-8?B?cG04VGM3RHpUSnpJbzVrQUJ3RDFjSzcrNW5OYUhWS09vQlNlWTdDeDR3enp3?=
 =?utf-8?B?eXBwMjF5KzJoaGNtWGkwUVZUa2lnQ1lSK3hoT2MzeGJPNnAxUkRkS09ZUjVa?=
 =?utf-8?B?R3BtVjB1aGZjajQ2eVpNbDJJYmhrM1FsYldxT1BPSGtQT3dTV2tvdm12R1Yz?=
 =?utf-8?B?RDI3bnFMU3ZwNXBiTXNacHdRN2xncld6a2UwZVNvaTMzMFRkblJrZUpwUDM1?=
 =?utf-8?B?cEpKZGx6ZE9OdDNQNHliVkJNVDR6cCtpbkd4NWVWYkllWFFYWGtHUWg5TnNl?=
 =?utf-8?B?eHd2SmtDZmxNdjRZZWlWd3owOVNILzMyT0lGQXpDM2RyMkhxeGlkcmIwd3pi?=
 =?utf-8?B?bzZkckl4TEI4MHh3blRMV1RWbk9PR2lrUkJpOEJqanZHdUVRb0RJNllNUFZD?=
 =?utf-8?B?THIzOE1GejdpdExKRTAwamlwbEMzNU5uRUo3Q1VyRkRpcXJncGZEdU0xTk1i?=
 =?utf-8?B?eG9FS1FUTVBFS0MvNkJnU3VuNzFTNHJJNktCYUdwN212elk2K3lkM1djemd6?=
 =?utf-8?B?cHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <50CBC5B5D0B8CF43B8D2084651066B4A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 447d7661-538f-4b7b-0634-08dbf7b584a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2023 06:18:38.9351 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: knU7J808fka3JPSgrNLdbDuDhYvSosKh9osuKOidy6x+DN955BQsheqD9AkAcQ9QCCxZeDrVqfpTLnvN2Fk9OcfFFlPiJJHjjfbCJD7Tsaw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5958
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTEyLTA3IGF0IDE2OjEwICswMTAwLCBNYWFydGVuIExhbmtob3JzdCB3cm90
ZToNCj4gUmV2aWV3ZWQtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBs
aW51eC5pbnRlbC5jb20+DQo+IA0KPiBJJ3ZlIG5vdGljZWQgdjIgaGFzIGEgYS1iIGZyb20gSmFu
aSwgc2VlbXMgdG8gYmUgbWlzc2luZyBpbiBsYXRlcg0KPiB2ZXJzaW9ucz8NCj4gDQoNClRoYW5r
IHlvdSBNYWFydGVuLiBUaGVzZSBhcmUgbm93IHB1c2hlZCB0byBkcm0teGUtbmV4dCB3aXRoIHlv
dXIgcmIgdGFnDQphbmQgYWNrIGZyb20gSmFuaS4NCg0KQlIsDQoNCkpvdW5pIEjDtmdhbmRlcg0K
DQoNCj4gRGVuIDIwMjMtMTItMDcga2wuIDA2OjIyLCBza3JldiBKb3VuaSBIw7ZnYW5kZXI6DQo+
ID4gVGhpcyBwYXRjaCBzZXQgaXMgcmVmYWN0b3JpbmcgaW50ZWxfZmIuYyBjb2RlIHRvIGdldCBy
aWQgb2YNCj4gPiBpZmRlZnMuIFRoaXMgaXMgZG9uZSBieSBzcGxpdHRpbmcgaTkxNSBhbmQgWGUg
c3BlY2lmaWMgcGFydHMgZnJvbQ0KPiA+IGludGVsX2ZiLmMgaW50byB0aGVpciBvd24gc291cmNl
IGZpbGVzLg0KPiA+IA0KPiA+IFNvbWUgaWZkZWZzIGFyZSB0YWNrbGVkIGJ5IGFkZGluZyBkZWZp
bml0aW9ucyBpbnRvIFhlIGNvbXBhdGliaWxpdHkNCj4gPiBoZWFkZXJzLg0KPiA+IA0KPiA+IFBh
dGNoIDcuIHNob3VsZCBiZSBzZW50IHRvIGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcu
DQo+ID4gDQo+ID4gdjU6DQo+ID4gwqDCoCAtIHMvdXNlcl9tb2RlX2NtZC9tb2RlX2NtZA0KPiA+
IMKgwqAgLSBGaXggdHlwbyBpbnRlbF9mYiB2cy4gaW50ZWxfZmJfYm8NCj4gPiB2NDogRW1wdHkg
ZnVuY3Rpb24gaW5zdGVhZCBvZiBkZWZpbmUNCj4gPiB2MzoNCj4gPiDCoMKgIC0gaW50ZWxfZmJf
Ym9fZnJhbWVidWZmZXJfZmluaSBhZGRlZA0KPiA+IMKgwqAgLSB4ZV9ib19nZXQvcHV0IGFuZCB1
bnBpbiBtb3ZlZCB0bw0KPiA+IGludGVsX2ZiX2JvX2ZyYW1lYnVmZmVyX2luaXQvZmluaQ0KPiA+
IHYyOiBpOTE1IGNoYW5nZXMgYXJlIG5vdyBiYWNrcG9ydGVkDQo+ID4gDQo+ID4gQ2M6IE1hYXJ0
ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+DQo+ID4gQ2M6
IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gPiBDYzogSmFuaSBOaWt1
bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4NCj4gPiANCj4gPiBKb3VuaSBIw7ZnYW5kZXIgKDkp
Og0KPiA+IMKgwqAgUmV2ZXJ0ICJGSVhNRTogZHJtL2k5MTU6IHhlIGludGVsX2ZiLmMgZnJhbWVi
dWZmZXIgaW5pdCBhbmQNCj4gPiBkZXN0cm95IHhlDQo+ID4gwqDCoMKgwqAgY2hhbmdlcyINCj4g
PiDCoMKgIGZpeHVwISBGSVhNRTogZHJtL2k5MTUvZGlzcGxheTogUmVtYWluaW5nIGNoYW5nZXMg
dG8gbWFrZSB4ZQ0KPiA+IGNvbXBpbGUNCj4gPiDCoMKgIGRybS9pOTE1L2Rpc3BsYXk6IHVzZSBp
bnRlbF9ib190b19kcm1fYm8gaW4gaW50ZWxfZmIuYw0KPiA+IMKgwqAgZHJtL2k5MTUvZGlzcGxh
eTogQ29udmVydCBpbnRlbF9mYl9tb2RpZmllcl90b190aWxpbmcgYXMgbm9uLQ0KPiA+IHN0YXRp
Yw0KPiA+IMKgwqAgZHJtL2k5MTUvZGlzcGxheTogSGFuZGxlIGludmFsaWQgZmJfbW9kaWZpZXIg
aW4NCj4gPiDCoMKgwqDCoCBpbnRlbF9mYl9tb2RpZmllcl90b190aWxpbmcNCj4gPiDCoMKgIGRy
bS9pOTE1L2Rpc3BsYXk6IFNwbGl0IGk5MTUgc3BlY2lmaWMgY29kZSBhd2F5IGZyb20gaW50ZWxf
ZmIuYw0KPiA+IMKgwqAgZHJtL2k5MTUvZGlzcGxheTogQWRkIGludGVsX2ZiX2JvX2ZyYW1lYnVm
ZmVyX2ZpbmkNCj4gPiDCoMKgIGZpeHVwISBkcm0veGUvZGlzcGxheTogSW1wbGVtZW50IGRpc3Bs
YXkgc3VwcG9ydA0KPiA+IMKgwqAgZml4dXAhIGRybS94ZS9kaXNwbGF5OiBJbXBsZW1lbnQgZGlz
cGxheSBzdXBwb3J0DQo+ID4gDQo+ID4gwqAgZHJpdmVycy9ncHUvZHJtL2k5MTUvTWFrZWZpbGXC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAxICsNCj4gPiDCoCBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiLmPCoMKgwqDCoMKgwqAgfCAyNDcgKysrKyst
LS0tLS0tLQ0KPiA+IC0tLS0tDQo+ID4gwqAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9mYi5owqDCoMKgwqDCoMKgIHzCoMKgIDIgKw0KPiA+IMKgIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfZmJfYm8uY8KgwqDCoCB8wqAgOTcgKysrKysrKw0KPiA+IMKgIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZmJfYm8uaMKgwqDCoCB8wqAgMjYgKysN
Cj4gPiDCoCBkcml2ZXJzL2dwdS9kcm0veGUvTWFrZWZpbGXCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfMKgwqAgMSArDQo+ID4gwqAgLi4uL2NvbXBhdC1pOTE1LWhlYWRlcnMv
Z2VtL2k5MTVfZ2VtX29iamVjdC5oIHzCoCAxNiArKw0KPiA+IMKgIGRyaXZlcnMvZ3B1L2RybS94
ZS9kaXNwbGF5L2ludGVsX2ZiX2JvLmPCoMKgwqDCoMKgIHzCoCA3NCArKysrKysNCj4gPiDCoCBk
cml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS9pbnRlbF9mYl9iby5owqDCoMKgwqDCoCB8wqAgMjQg
KysNCj4gPiDCoCA5IGZpbGVzIGNoYW5nZWQsIDMwNSBpbnNlcnRpb25zKCspLCAxODMgZGVsZXRp
b25zKC0pDQo+ID4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZmJfYm8uYw0KPiA+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiX2JvLmgNCj4gPiDCoCBjcmVhdGUgbW9kZSAxMDA2
NDQgZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkvaW50ZWxfZmJfYm8uYw0KPiA+IMKgIGNyZWF0
ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS9pbnRlbF9mYl9iby5oDQo+
ID4gDQoNCg==
