Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FCCC77B7C
	for <intel-xe@archiver.kernel.org>; Thu, 20 Apr 2023 20:44:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 881E410E26B;
	Thu, 20 Apr 2023 20:44:19 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF69410E26B
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Apr 2023 20:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682023456; x=1713559456;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Hk8TIvIVyr7xleSMP03FHmWihGIM11e7mojur6HWMqI=;
 b=oEWhdnXh3uOB6V7l/u/6JF/SHLADLNdEeYNXdIsjg6BjQKCf3IgqNXkq
 DD1odUW/8A90a9epiwK7KXwi+83C30ebUntqEdiXpoH8Rnij3HzhHV4Pi
 Fni6iB1gHx6V6SPIp+jCCt9eUsDpbyq63ilw8EJXKEhYYqcQ/JOFFzj09
 Frs0oswl3z8xOerxtXo4fL+bygg2Ko3Y6ZdHwYP7ntRRarr9Ylb8w8hFj
 uYXcSt7htD9RJVEpf6XUwwPEw83flxlGSv5E+mnn23jfaUhvtY94EB1X6
 OcDmgFnBbQnSRqyGMmCx2il0+IpvCexLfNr0Ilgk8soOkjiJ10nc3LOJy g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="348637151"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="348637151"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 13:44:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="694710017"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="694710017"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 20 Apr 2023 13:44:15 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 20 Apr 2023 13:44:14 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 20 Apr 2023 13:44:14 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 20 Apr 2023 13:44:14 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 20 Apr 2023 13:44:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E0kOp1eh8rt4tiN6BroAM0cR1ouaNVwOkTcpUsdsSAktkyJpGbAYEF4bHbCza+PdOnR7arG4rXgQBnPD8CeP90cUUV2rwv6CH+ISqNYBi0suaZlkZV4MimzbTNun5/MzpxnA8hRXU/8kiMN0neS2t/awdgafRTYjcsKrjzX9bMhESdoJTxbbV4561zUA6ae8jC1CV1Oehi7uIRvUHyOkaR/84ihd6K4R0kmLs8FFYkTZ4thaVEk0JQtlD+t/34AkzwQjoYBNnmTsIuQwYHbWrZ1XtpNqMTxcEY0wd+S+rd5vDtEqZezicf70zMhPoitXluTe8BFdo3QeRtlCHaZmaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hk8TIvIVyr7xleSMP03FHmWihGIM11e7mojur6HWMqI=;
 b=iydS8a9lxa/E6ejmcvI+++u43PcS24CWVB2Wm1Dh//zUqJAGWFww0H/9cOIR4Sci1hmJAJFKx0ogQc/aVl/LxlM2cL6U/UMl9xVCq6bh7cX3sGSWYMUhykyMyY68NH/NDPsDG9jABKzy7QMFUhHGLhQc1HnjDRRSYvqRjjFLRZGuYHqYh4SGZXEIxMeWL9GrBajkXzDCGHIsKx5VRtkaJayRRBzmvDXFzuSUkaBqR07gzkllWAdH64V5gNB3d8dj0qc/CH814Pf2QKreJUFxN1u5+Bvn2ftpRsGMOifjLlb3b7mtubh0oeIFDkLgFC3M9M5mtb6ulOkorMO57hYQbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 CH3PR11MB7820.namprd11.prod.outlook.com (2603:10b6:610:120::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.22; Thu, 20 Apr 2023 20:44:12 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::401d:5396:cf8d:5d58]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::401d:5396:cf8d:5d58%9]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 20:44:12 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>
Thread-Topic: [Intel-xe] [PATCH 0/4] RFC: Add new device configuration
 infrastructure to
Thread-Index: AQHZcugUsD4YBqxjN0C5KffvW75kja8z8FuAgACchACAAB8GgA==
Date: Thu, 20 Apr 2023 20:44:12 +0000
Message-ID: <bd0c3c5f95510690b45c55a0ed2f87a1b3e2bf94.camel@intel.com>
References: <20230419175501.155319-1-stuart.summers@intel.com>
 <87mt32x5iw.fsf@intel.com>
 <pofqujdm6esn74xfl2eiphxquupoolbqnttbnjs2hmqvtkwspo@4yqkzpqat43m>
In-Reply-To: <pofqujdm6esn74xfl2eiphxquupoolbqnttbnjs2hmqvtkwspo@4yqkzpqat43m>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|CH3PR11MB7820:EE_
x-ms-office365-filtering-correlation-id: d5d48088-6ec6-474b-f2a3-08db41dfff73
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: brXDfRP+MiyUdvWb1OOgCBXXdb5ENbyeTLdLUfeT/nK+ieSRbPQpkeqyLj5z6pUlvmeqdQN5A7jslcf1pcvyVXpt9ir7nAW16g0urJ59e9Th++OIQoN7x+Dzb8+sLOwa1uhdMQRuuE0uFLRN5qLGT2WehKvDxJWbXqzEgOJrRE+auou7PxLPYFJ0uEfpHsCKYYyf79wkGLWD6E8g+n3gooCrpNgAf0ijGSacJPJH9dWAi+6e1YtFYJwsuaA66r/yHocUWuH984d+DYiViimDhFgMNjMw8XHBu+YpCIy0szEVdQRVKmeCIhQCzjH5aqiliQJaekxhVFHJP3hYndNdK8mhPGk7O0AXj8M2F8A5pmonBB8FY3GtVTGuWr/LWoPwm5/+1/91cLr3llYEfu71kw0U7XIkzquJDWFShKosp59wn+OCfAs2TbY6aFovVJnHufIl5w/+AS2zPVS27s62cNkIgJ97TDNIJ8z/tT5SM8F/NEzpnFNna4GdMZ2zg47rlcASnvOSpxIYLWbdy5Mtjv/2p0TQaBmlNHGMxcgjvcK4rIU0Q4tHUPWBy9rdyGkA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(396003)(39860400002)(346002)(136003)(451199021)(2616005)(316002)(76116006)(66946007)(82960400001)(64756008)(4326008)(966005)(66556008)(83380400001)(6486002)(71200400001)(478600001)(54906003)(8676002)(122000001)(41300700001)(8936002)(91956017)(66446008)(38100700002)(110136005)(66476007)(2906002)(38070700005)(5660300002)(26005)(6506007)(6512007)(186003)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aWFqeTA4RDAwNW5jWndrSzZzZXNJYm1UaEtJcG81ZDVOb1N4MytSZHowOHJN?=
 =?utf-8?B?bjdBelFTOGJMaGl0N3k2djRrTmZjcFlwRFZsejg3N2FPcFNOUUs0UmpENVF5?=
 =?utf-8?B?VTlpMDVtQTZtRGxDNlNNdkNIWjdrTG83aHE3SG0xSHllbit2WmpTT04yVU5F?=
 =?utf-8?B?cWRPL0FDb0k5dGFWcG9adGhBdUFJS1NrbUZ3OVJvZGhUdGJZSStqdk0yWkFh?=
 =?utf-8?B?aGpXcjNxMEVIUGM4NUdFU0VzSGM5akxLTGFVQVdxOEFUVTAvUCtlTHZ6bWFH?=
 =?utf-8?B?d01FekFXUGpWa085bi9wakkxVUkzWEVmdUltcWtubWVHOWVGRlJRNWhJWWxz?=
 =?utf-8?B?Q2lEaW1MWSs4NTU4M2RtTWFqRXA3NW9ROUJwS1NFbWhRNnpNZHZGNW1UcjNq?=
 =?utf-8?B?NHd1NmVYVVdjbW9IS0UvN2c4MjdBRzRsUnplRWROUDV5cjNTdWI3TjJjR3Vz?=
 =?utf-8?B?R1FTR0RCZlp0cDhYck1OYzczRUx0Y0czek9OWGRDejBWY0pzaDhWMHhPc3Rj?=
 =?utf-8?B?V0NHU2ZTM2x2OHRHek9lQ3gyRmJWQ0ZPZ3FYbTVNUFUzdzUyTjR0ajQ1czhu?=
 =?utf-8?B?OWkyTHA3Z09lanpyZnFlVjRiRTBkejNGSzQxcUF3U01VaHh5MWowUlZiQUtF?=
 =?utf-8?B?eEsrSjVKbU5VeWpacndYRDNGK2x0QmtJZGxNQlhHTVZsVkFBbG16U0ZENUpW?=
 =?utf-8?B?QlVSS2ovQVVCVGlaSFptTGZDK2R4bXNCM2xpOTVTbFFNUUVVcEVMWHFiK2Vv?=
 =?utf-8?B?NW9USWZRemhjdWl2QVdCTG4zb3A2NlFtdVhHVkMvUXJsSk5qcUsvTnZ6cHJO?=
 =?utf-8?B?QlRnZENray9jTVdFdmJQYVdWSFRnQ0RlVlFObHFYbWd1ZFBESWF3SVNoRmVu?=
 =?utf-8?B?STR4NFg4RmlFNUNGRFkwRS8wREp6OHNhc0lpOVBvY2pEcnN3czR1ZUZxMy93?=
 =?utf-8?B?azlrQ3pIMzBFNjE5SUJIa3RSZ3ltd05maXE5YW1oampScVNXOVdDYVoySVB2?=
 =?utf-8?B?WHZrYXE5d1lza1lXamQzM0VlUmhJSUo1Yi9FRzJCUWJXNUNZanJIWWltQ1ow?=
 =?utf-8?B?YjhGU09nbVhWQlBtRDUvcXIxY3NkWUozRlpncHBBR2hTK3FOaEdQQkxnSHNW?=
 =?utf-8?B?MjdlMjY0SFJZb3p5dlB6WW5QL3hyNjRUZy9iNXovdFRPQ05xTlhhdDdKd3Ix?=
 =?utf-8?B?M20vejdWN0pnSmVvZ1pTdE9RZ1lUY1MzNGtxNTU2QXVWMHlQdzBESXZXY1VT?=
 =?utf-8?B?a3k4TXlOZzdQNTA1RUpUQWJZZVNkUkZPTXd1VUFZWTZjdG0yRXJsVkpSM0Vr?=
 =?utf-8?B?YzBTYjBrVEVaZGlhdC9kZDJMS1B5SDNwKzExcDVNVWtMcnZZcHlpSWFNMW1Y?=
 =?utf-8?B?RHRDalMrYzF4TFlId3JieFArNFNYOFY2MmJRYnVkcDRHUnRyQTZZZHI1Wito?=
 =?utf-8?B?VjZ5M21EdE85UU9yMzZPNFZFRDg3ditXWHpSVmR4SThJdFF5K2w5WVVoRHgx?=
 =?utf-8?B?TU8yYkZVRDNkUEo0bFlIYSs1OVNmZlcrd0l0WFJNU0wveXdEb1VMMUJxaG5u?=
 =?utf-8?B?M296OXBQdTF3K1N6Wi9sWXhSRUdJLzFYWmVtaGxkYlFVang0ejUxZmVhbDU0?=
 =?utf-8?B?NWNpRFR5eDdGODBNQjQxNWkrbDFmYmU2L2wzVnNmaU83NFZncnBOQjQ0aVZF?=
 =?utf-8?B?SXJRUk1ld05FeTJwYU04UkdDelVWR2cxdWw0bGxDTGpLcHlaZXlrS1U1Z2dN?=
 =?utf-8?B?UFljWEk1eXZ4Ynh2Um40TUtrY2xYODdwZGNaRVc2NjBYZ29qMmx5bWM3Y1F1?=
 =?utf-8?B?WDJ3M0ZQdEdsUGtQdERVTTc2cFE1bEtVQlM0NkNqMzhoeGRsSlMxWktGUE1S?=
 =?utf-8?B?cGw2YzNUOWJOakJRWHVyc3l1REpKaE5JZ1hNazRWV3JyNytZYW9qRnF6UmtH?=
 =?utf-8?B?QWFRQ0drSGtERlBTNUxoSGdVVUFERkFtSVNxMjh5R2JOQklRWTFyUGFSSWFT?=
 =?utf-8?B?b3hYTitCR09lbWdiMzJ6V0tDK0JwVG0zTDZWK1E1YUJpZUc0Q21IbTF2aXl0?=
 =?utf-8?B?SnFWeWp4MDZLYUtOVXoycE5kLzU2bTd6a1dDczRYUHFnc3Q4SFdXRXdQaG9t?=
 =?utf-8?B?RlVrRWUzZkdZZEs2R1dJZTNQSzFEclZxZlptSW1oenhEUFJsMCtLc2NVU29o?=
 =?utf-8?B?bkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3404916563B6F54DA8AB48B69098C597@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5d48088-6ec6-474b-f2a3-08db41dfff73
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2023 20:44:12.1965 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CKBZf98hRcd7CXlnQbhezyeDDj7Ar6uM4OGsmNu9Yr8oLqsHuXqZmokIh7KSu/Rz2n8DQCnHRj+5FUy0na+UBa+V/MTHuHKfQMKi40tr5xs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7820
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/4] RFC: Add new device configuration
 infrastructure to
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTA0LTIwIGF0IDExOjUzIC0wNzAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+IE9uIFRodSwgQXByIDIwLCAyMDIzIGF0IDEyOjMyOjU1UE0gKzAzMDAsIEphbmkgTmlrdWxh
IHdyb3RlOg0KPiA+IE9uIFdlZCwgMTkgQXByIDIwMjMsIFN0dWFydCBTdW1tZXJzIDxzdHVhcnQu
c3VtbWVyc0BpbnRlbC5jb20+DQo+ID4gd3JvdGU6DQo+ID4gPiBUaGlzIGlzIGF0dGVtcHRpbmcg
dG8gdGFrZSB0aGUgYmVzdCBwYXJ0cyBvZiBpOTE1IG1vZHVsZQ0KPiA+ID4gcGFyYW1ldGVycw0K
PiA+ID4gKG1pbnVzIHRoZSBhY3R1YWwgbW9kdWxlIHBhcmFtZXRlcnMpIGFuZCBhZGQgdG8geGUg
dG8gYWxsb3cgZm9yDQo+ID4gPiBiZXR0ZXINCj4gPiA+IGRlYnVnZ2FiaWxpdHkgYW5kIGNvbmZp
Z3VyYXRpb24gaW4gb3JkZXIgdG8gaGVscCBpc29sYXRlIHByb2JsZW1zDQo+ID4gPiBvbiBhIHBl
ci1kZXZpY2UgbGV2ZWwgaW5zdGVhZCBvZiBnbG9iYWwgbW9kdWxlIHBhcmFtZXRlcnMuDQo+ID4g
PiANCj4gPiA+IE5vdGUgdGhhdCBJIGRpZCByZXZpZXcgYSBmZXcgb3B0aW9ucyBoZXJlOiBjb25m
aWdmcyAobm90DQo+ID4gPiBnZW5lcmFsbHkNCj4gPiA+IHVzZWQgYnkgdGhlIGRybSBzdGFjayks
IG1vZHVsZSBwYXJhbWV0ZXJzICh3ZSBoYXZlIHNvbWUgbmVnYXRpdmUNCj4gPiA+IGhpc3Rvcnkg
aGVyZSksIHN5c2ZzIChub3QgdGhlIHJpZ2h0IGFwcHJvYWNoIGdpdmVuIHRoZSBmb2N1cyBvbg0K
PiA+ID4gdXNlciBpbnRlcmZhY2UgaGVyZSkuIERlYnVnZnMgaXMgdXNlZCBpbiB2YXJpb3VzIGRy
bSBkcml2ZXJzIHRvDQo+ID4gPiBjb25maWd1cmUgdmFyaW91cyBkZXZpY2UgY2hhcmFjdGVyaXN0
aWNzLiBUaGUgaW5mcmFzdHJ1Y3R1cmUNCj4gPiA+IGJlaW5nDQo+ID4gPiBwcmVzZW50ZWQgaGVy
ZSBoYXMgYXQgYSBoaWdoIGxldmVsIGJlZW4gcHJlc2VudCBpbiB0aGUgaTkxNQ0KPiA+ID4gZHJp
dmVyDQo+ID4gPiBmb3Igc29tZSB5ZWFycyBub3csIHNvIHByb3ZpZGVzIGEgZ29vZCBzdGFydGlu
ZyBwb2ludCBmb3IgcXVpY2sNCj4gPiA+IGRlYnVnIGFkZGl0aW9ucyB3aXRob3V0IGV4cG9zaW5n
IHVzZXJzIHRvIHNvbWUgb2YgdGhlIGNoYWxsZW5nZXMNCj4gPiA+IGZhY2VkIHdpdGggbW9kdWxl
IHBhcmFtZXRlcnMgaW4gdGhlIHBhc3QuDQo+ID4gDQo+ID4gTG9va2luZyBpbnRvIGNvbmZpZ2Zz
IGhhcyBiZWVuIG9uIG15IHRvZG8gbGlzdCBmb3IgYSBsb25nIHRpbWUuDQo+ID4gSXQncw0KPiA+
IHNvbWV0aGluZyB0aGF0IG9mdGVuIGdldHMgcmVjb21tZW5kZWQgYXMgYSByZXBsYWNlbWVudCB0
byBtb2R1bGUNCj4gPiBwYXJhbWV0ZXJzLCBidXQgdGhlIGRvY3VtZW50YXRpb24gYXMgd2VsbCBh
cyB0aGUgZXhpc3RpbmcgZXhhbXBsZXMNCj4gPiBpbg0KPiA+IHRoZSBrZXJuZWwgYXJlLCBJIHRo
aW5rLCBsZXNzIHRoYW4gc3RlbGxhci4gQmFzaWNhbGx5IHdvdWxkIHJlcXVpcmUNCj4gPiBpbXBs
ZW1lbnRpbmcgaXQgYW5kIHNlZWluZyBob3cgaXQgYWN0dWFsbHkgd29ya3MuDQo+ID4gDQo+ID4g
SW4gYW55IGNhc2UsIEkgZG9uJ3QgdGhpbmsgaXQgc2hvdWxkIGJlIGRpc21pc3NlZCB3aXRoIGp1
c3QgIm5vdA0KPiA+IGdlbmVyYWxseSB1c2VkIGJ5IHRoZSBkcm0gc3RhY2siLiBBIGRlY2VudCBp
bXBsZW1lbnRhdGlvbiBjb3VsZCBzZXQNCj4gPiB0aGUNCj4gPiBleGFtcGxlIGdvaW5nIGZvcndh
cmQuDQo+ID4gDQo+ID4gVGhlIG1haW4gcHJvYmxlbSB3aXRoIGRlYnVnZnMgaXMgdGhlIGluYWJp
bGl0eSB0byBzZXQgdGhlIGRlZmF1bHQNCj4gPiB2YWx1ZXMNCj4gPiBwcmlvciB0byBwcm9iaW5n
IHRoZSBkZXZpY2UuIFRoaXMgaXMgd2hlcmUgbW9kdWxlIHBhcmFtZXRlcnMgYXJlDQo+ID4gaGFu
ZHksDQo+ID4gYnV0IHRoZXkgYXJlbid0IGRldmljZSBzcGVjaWZpYyAoYW5kLCBhcyB5b3Ugbm90
ZSwgZ2VuZXJhbGx5DQo+ID4gZGlzY291cmFnZWQpLg0KPiA+IA0KPiA+IExvb2tpbmcgYXQgdGhl
IHBhdGNoZXMsIEknbSBub3Qgc3VyZSBJIHVuZGVyc3RhbmQgd2hhdCB0aGUNCj4gPiBwcm9jZWR1
cmUgZm9yDQo+ID4gc2V0dGluZyB0aGUgZGVidWdmcyB2YWx1ZXMgYmVmb3JlIHByb2JpbmcgdGhl
IGRldmljZSB3b3VsZCBiZS4gQ2FuDQo+ID4geW91DQo+ID4gcHJvdmlkZSBhbiBleGFtcGxlIHNl
cXVlbmNlIG9uIHRoZSBjb21tYW5kLWxpbmUgcGxlYXNlPw0KPiANCj4gSSB0aGluayB0aGF0IGZv
ciBhbnkgc29sdXRpb24gIT0gcGFyYW1ldGVycyBpczogIHNwbGl0IHRoZSBtb2R1bGUNCj4gbG9h
ZA0KPiBhbmQgdGhlIG1vZHVsZSBiaW5kIHBoYXNlcy4gIEkndmUgYmVlbiB1c2luZyB0aGF0IGZv
ciBhIGxvbmcgdGltZQ0KPiBzaW5jZQ0KPiBpdCdzIGEgZ2VuZXJhbCBzb2x1dGlvbiBmb3IgYXR0
YWNoaW5nIHRyYWNlcG9pbnRzIG9uIGVhcmx5IHByb2JlIGFuZA0KPiBpdCBhcHBsaWVzIHRvIGFu
eSBrZXJuZWwgbW9kdWxlIChkaWZmZXJlbnRseSB0aGFuIGUuZy4gYWRkaW5nIGENCj4gIm5vbW9k
ZXNldCINCj4gcGFyYW1ldGVyIHRvIGFjaGl2ZSBzaW1pbGFyIHRoaW5nKS4gRm9yIGEgZGVidWdn
aW5nIHRoaW5nLCB1c3VhbGx5DQo+IGZvciBlYXJseQ0KPiBicmluZyB1cCB0aGF0IHdvdWxkIGJl
IGFjY2VwdGFibGUgSSB0aGluay4NCg0KUmlnaHQgSSBrbm93IHdlJ3ZlIGRvbmUgdGhpcyBtYW55
IHRpbWVzIHdpdGggaTkxNSB3aXRob3V0IGlzc3VlLiBUaGlzDQppcyB0aGUgd2F5IHdlJ3JlIGNv
bmZpZ3VyaW5nIHRoZXNlIHRoaW5ncyBwZXIgZGV2aWNlIG5vdy4gQnV0IGl0J3MNCnN0aWxsIGEg
Z29vZCBwb2ludCBhYm91dCBjb25maWdmcy4NCg0KQW55d2F5IGl0IGlzbid0IHdvcmtpbmcgd2l0
aCB4ZSB0b2RheSwgYnV0IHRoYXQncyB3aHkgSSBzZW50IHRoaXMgYXMgYW4NClJGQyBmaXJzdCB0
byBnZXQgZmVlZGJhY2suDQoNCkkgd2FzIGFsc28gdGhpbmtpbmcgdGhlIHNhbWUgYWJvdXQgZGVi
dWcuLi4gcmVhbGx5IGFsbCBvZiB0aGVzZSBzaG91bGQNCmJlIGNvbnNpZGVyZWQgZGVidWdnaW5n
IGZlYXR1cmVzL2Z1bmN0aW9ucyBzaW5jZSB0aGUgZHJpdmVyIHNob3VsZCB0bw0KYWJsZSB0byBh
dXRvZGV0ZWN0IHRoZSBkZWZhdWx0IHNldHRpbmdzIGZvciBlYWNoIGRldmljZSBjb25maWd1cmF0
aW9uDQpiYXNlZCBvbiB2YXJpb3VzIHJlZ2lzdGVycyBhbmQgcGVyLXBsYXRmb3JtIGRlZmluaXRp
b25zLiBTdGlsbCwgbGV0IG1lDQpkaWcgaW50byBjb25maWdmcyBhIGJpdCBtb3JlIGJlZm9yZSBt
YWtpbmcgdGhhdCBmaW5hbCBkZXRlcm1pbmF0aW9uLg0KDQpSZWFsbHkgYXBwcmVjaWF0ZSB0aGUg
dGhvdWdodHMgaGVyZSB0aG91Z2ghDQoNCi1TdHVhcnQNCg0KPiANCj4gTW9yZSBjb250ZXh0Og0K
PiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL3hlL2tlcm5lbC8tL2lzc3Vlcy8y
MzANCj4gDQo+IEx1Y2FzIERlIE1hcmNoaQ0K
