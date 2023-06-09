Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77856C7EE2F
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jun 2023 15:55:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA8410E6C4;
	Fri,  9 Jun 2023 15:55:00 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 130FB10E6C4
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jun 2023 15:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686326097; x=1717862097;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=b1xZx7a5V8SgiC9NMZKK3QCQRMYGvcs9F+sjBOw3YoM=;
 b=A9Ebrgv2bK5EpBntaUIu9EfPm/LComH5gMV3B8erXGTs8RxAevF1x0or
 x2eCEl4fDBH2gl+y2x8SmB+G+HITr942fCgHIPgrMHQvHift1U6RmrMxi
 gjnWtjG+qjFJswQeV2ayDGZ0kstx4HY5SnvbRBj5WYD4DH6/77iGNaGPc
 6vmVDChqnP/h8Q657eStM2lP6tQ6ooagHSiEA7Kc70poGQwQ7WgqIUdkm
 1LWrmGck7Dbpq54zptEpuaKgaJVIp7gpzt7HPguOruS2QpHsUe+XBIVxK
 2h5IEcM48IrbxIK+EIOYuNQxB1LYBj5XGbE9JdnJ+3+ZPxC9jzXsyPzXQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="423505813"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; d="scan'208";a="423505813"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 08:54:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="800259149"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; d="scan'208";a="800259149"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 09 Jun 2023 08:54:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 9 Jun 2023 08:54:53 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 9 Jun 2023 08:54:53 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 9 Jun 2023 08:54:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lx5iTE10lM7k5cGLsxSaAhdefjqfoI6VD4AGSqm2HSW/B0nF1M+EBowk8qRzxyC+Pj0Z62FSqIcZBT6D4MC5b386HKutSyPXWuLFSxYZiSFxtoSLTMHq/7sNYqnk/6i+oiZqGYenp5QGD/8daIugOHtaUnU9L6Z43Jo3/eikseDYJRAlNzSvDfNdX2JWnDFRxfKV+mmDQDZPa1Eg00y79nzIBCqBHHenAQt3eWum/zR8ItcxpFbtn9cHfYjGDPpsAqS7kmrzCSFVTBXL6qp3/j6K0fvzdjsgxp4ZQyQRlnnoH8ArI2CSyraJ3dTuyk5Lgoay0fvgip9aYG6mEQRkMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b1xZx7a5V8SgiC9NMZKK3QCQRMYGvcs9F+sjBOw3YoM=;
 b=NZKkJQMmIMsm0+IZXzqP7pF28TJlTg2ei8ykP6vj6SgNM5k7xisSORL3RtMEBUtEEwljWkFshdLv3A9vPauN3fDi6EwYcs+ayTfIy+9AayKf+vBEQi3d9xjozVpuVx/ADaBVsoIGwDIMUiu2O5hxZ6HohIOfaNLRZ4DohO/Zi92LuNyyVOggyE+ERXyCxzJYDzagEfH+RS2x8ArIlV7IUWs546/M2UgLFISlw4BkTMQoa4kGK/2NRUt4WdsrNnpIUYt/PlqfacEC3llrDiLMC6ExJcpH5jYskxleq0RTmf/Kkpf7W+L4t8TYvY6WffD37F9ZYOcwJ6IG+QIGfzs7nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by PH7PR11MB6546.namprd11.prod.outlook.com (2603:10b6:510:212::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Fri, 9 Jun
 2023 15:54:53 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0%7]) with mapi id 15.20.6455.034; Fri, 9 Jun 2023
 15:54:52 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Thread-Topic: [Intel-xe] [PATCH 1/2] drm/xe: Invalidate TLB also on bind if in
 scratch page mode
Thread-Index: AQHZmWgy/OmmiWPflkOfCPV0b0Xh4a+CocYAgAAA2QA=
Date: Fri, 9 Jun 2023 15:54:52 +0000
Message-ID: <9ce51fdbbe897b58816732e49ddc8dccc4085837.camel@intel.com>
References: <20230607174729.54899-1-thomas.hellstrom@linux.intel.com>
 <20230607174729.54899-2-thomas.hellstrom@linux.intel.com>
 <ZINKknFps5aTrLNi@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZINKknFps5aTrLNi@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|PH7PR11MB6546:EE_
x-ms-office365-filtering-correlation-id: 1739ed90-48ea-4222-2440-08db6901dd24
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dP970aP5LYPcakJhPRF8f63J+Z2UC4gopO4XnBIgfQytC885/e8/SpLbfe6JhuhS3klYPimdgpd3xev9wE7iX6s3HQgo/E1EW2/jbGdmahKe+BSak2HO7XkVEgG0bWbPESUAqQWLme8ohQ3uInX7nhjEttiJLxtOCq+lsH+da2qxNBmDD8FtqDeUj2iD4nqZl/xggUSfho6isWG7pubo54OVibpNdoAvB1se1hqQ7EjXCL7RbmUvcMffVb3NeFJdNChOl04GjDu6Bk/sEt5MIaD77iUkxTukqVGe+mQW6uzNCciKmdQrotSbeo0+IidbUlh2ZmH5B8HPQ4sCrh8UJhCeXaOqwb91J08tqMo9dukVao5JQDpqZxyOzy+pQ4FGWlZUqJXCj06P7MhPcrhU3g5wnzP9rxkrSVoxr1srAKnVPYYaaJH/I/eT3bO/TUJKWhdr5MNKdRt2M49kOe+z9b16JORS0cyg6W6zFB1rKwval9CqkSMNWqkGNkPmUf08faRvzIO9cAFXWIP05WVRxSIpBWSDlGM/ppLcme4CSdM4EU/B34N+M0EVfY6BUj9i
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(396003)(366004)(376002)(39860400002)(451199021)(71200400001)(110136005)(38070700005)(36756003)(2906002)(86362001)(478600001)(5660300002)(8676002)(8936002)(66946007)(76116006)(66556008)(4326008)(91956017)(64756008)(66446008)(66476007)(122000001)(82960400001)(38100700002)(41300700001)(316002)(83380400001)(66574015)(6512007)(6506007)(2616005)(26005)(186003)(6486002)(966005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?djlxcWpTN0hVTG0xL0hFZWE1am11UzYxdTdaclQwQ0dFbjZyRVdFdUt3VSts?=
 =?utf-8?B?K1VpRDRpSjNYaXBkRHNsUzZKQTYzNzhFek5uOEVvbmlib3lXTHVEYzNjYThK?=
 =?utf-8?B?Q3NGOEc5U3FKcWtrb1V6QldVL3RMTGdtQXFqd3p4c1Q2Z01aMTc3UHBFelFn?=
 =?utf-8?B?WWdyeFlFWnBLaGFBQkFONkIwTXpUWkJSQWU5aDlGVjZWUEpsWGFZa0ZSNW5w?=
 =?utf-8?B?WkV6Ui8wL21aUGtJSktyaWpuUEtudkpWajhLYVVvT3BZcFNYZE9IWnJTNDBW?=
 =?utf-8?B?RFByYVlUSmVvRFZwVFZtRUZlbVBCRjB0b0c2dHJNbTRldjZpRzRYTFRQeGRR?=
 =?utf-8?B?ejNEYW5xcUxuaWcxQmVrNDlEcnkwdTltVmlUQ3U4cFRvNDJ6a1RuY1E3KzhV?=
 =?utf-8?B?dDdEL1Bjd1M1VEIwZUtZU1d1T3lGSTRkM2FsNXQ2ZTZyZklSU01hT1cxMXRx?=
 =?utf-8?B?WHlnODZHMlcyZDBEY0o1eDJEalA5Q3ZkNnZnbjBTTXZzQkxPYWY0MVZXZiti?=
 =?utf-8?B?dGlTMGVWMk13MmNWNzR5M1RDckh2bDFXeHdYa21GdlFkTlc4eWFKeVZyL2VL?=
 =?utf-8?B?US9tY1J5QTJpRnRiNTBpd0YwbVlTWVVsb1dncWRKTjQvYkUzRDJvOHhNN3dR?=
 =?utf-8?B?Ly9yZnB2eFhPbk9CWTRvc2lHSDFIWXdPeU1qeWdndXNsRU1WQUgvR2ZzaHYx?=
 =?utf-8?B?SHZWUVBaenhrQ01EZ1kzdnpNNlF6OHc1SEZ2ZnNmaGgrUm1KUGUxR0ZOMkVB?=
 =?utf-8?B?VEw1Y0RZRmlhVmtnSHhVb0p6bWM3MmZZUGl0NDFGZXdLaHkyeTJWZkZERkpX?=
 =?utf-8?B?WWpySWtxWmdFNWZWL3lXbDlkSXI3dFU0ZjRaTk10UGtma3hSYS9WRHQ3eWNC?=
 =?utf-8?B?ckMrbjlKcEc2cHgreDFQckNhYTY0Y2Q5am1nTzl0ZjVtMmREbWRZVVAwRWJj?=
 =?utf-8?B?K0M3VFBnN243OHA1Zm8vZGtvZWR0UTVQYkZzekN0THBTVzBkYUlFTE83N0xw?=
 =?utf-8?B?MUMrWGNwa3JleTE0bXdnQ1pHU2Q0NkU4LzVwbTAyb2QrVjdpSWtybHNSRFZp?=
 =?utf-8?B?aG9qUlJNVlVwaFcwSm9Xc0dJKzloQmN1V3hnY21OL1pzelFhTFZlTlMvWFdJ?=
 =?utf-8?B?VG5SVFFwd0pVdytmR3RNWkdhM1VKdHdoY01xamFzV2F5Z1BsUG9WUHJaVW51?=
 =?utf-8?B?SnZoaStwOVV3cyt6V1p3cGlSNldtWEp4SzNCS3NQQnd6WTJYSTV1VWMrMlZZ?=
 =?utf-8?B?U1FuUUg3ZjdQU0Yzc3Y5QmFwK2dkSmhhRFVXMWYrMjFhNnRqbDk5TzhSb0R3?=
 =?utf-8?B?dUZENUppL29uRDNiK1crWGNmTlM2WHZMeFFxdDJPcGtDRHdTcTdvazdWTEZT?=
 =?utf-8?B?SFJ4OHZTZXViZlFQbTJSNXhXcG5IbHgrSVNxWnc4VXNwVUtQZ24wZjc2VHpo?=
 =?utf-8?B?VXpYVzV2aDhyL3FpRTFIYXFLR0pYdFNOSFRtZDhKNFZrZEp5OWZld3lFV0k5?=
 =?utf-8?B?SWNWTkZ4KzV1azdZbE1adlhZV3JyUExSSFhZaUxnbjdva3hYcGIvREFkMVUy?=
 =?utf-8?B?WFBONlZ1OW84cnoxdXZlb0MxWVdMelp6TWQ2dEV3Z1JjY0JvNnhhMUU3c20w?=
 =?utf-8?B?T1RWaWFXK09lK2l1WUMxUHBYbHBwUmM0QWs2VmdqbnpuQWcvQ2NPZ2ttVzV3?=
 =?utf-8?B?ZlA2Tkt0dDlQdW5jK0psbTBiVlhoM2JnMVpHUDN2eDNDQ0VUMjg3a3FvVmU4?=
 =?utf-8?B?anV3cGx4a2M1b0JDa1JHN0k5WGxtbWlteTZmYzBvb0VTcmtrR25zeCt0SlR6?=
 =?utf-8?B?RlpHTGNPVElYMEJzdVhSbkRJbFBhMnlwbUlrbWNqMkNvUWhBR3VseTZMaWlJ?=
 =?utf-8?B?UEFDekxDODZCN2JwVTdrblJWM3JrY3RWUzFQMkx6MlZENERoRy80MGhIZEtP?=
 =?utf-8?B?Q3hrVE5USit0RWwvTkxYMUhHemNuRWZETk1rSCtsUGxwN3dsRzBLWHk1WGdm?=
 =?utf-8?B?SC9UamZHNmNFNElBd0QxVUhaN01Ra1ZJWktuVGZ0bE9LcHQraVU1a05EZVFo?=
 =?utf-8?B?RVlIOU1sSFJWaVI0QUJhb0ZlQXJsckdjYnRJdnZiVEpmcmxxR3NJYWQxdyts?=
 =?utf-8?Q?0NKcCmg2TGvfonKG1bnGZTibw?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3A3B504F81AE644CB7B7A6DB66676757@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1739ed90-48ea-4222-2440-08db6901dd24
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2023 15:54:52.8992 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YgvFEcyXajSthb3oK03cOJID0zbi5nL3hGnKdPqXSbG5sltgco2IkYZvxO9T9FbOt7mAKz44Z4BUiA7jrbIPtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6546
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Invalidate TLB also on bind if
 in scratch page mode
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIzLTA2LTA5IGF0IDE1OjUxICswMDAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBXZWQsIEp1biAwNywgMjAyMyBhdCAwNzo0NzoyOFBNICswMjAwLCBUaG9tYXMgSGVsbHN0
csO2bSB3cm90ZToNCj4gPiBGb3Igc2NyYXRjaCB0YWJsZSBtb2RlIHdlIG5lZWQgdG8gY292ZXIg
dGhlIGNhc2Ugd2hlcmUgYSBzY3JhdGNoIFBURSBtaWdodA0KPiA+IGhhdmUgYmVlbiBwcmUtZmV0
Y2hlZCBhbmQgY2FjaGVkIGFuZCB1c2VkIGluc3RlYWQgb2YgdGhhdCBvZiB0aGUgbmV3bHkNCj4g
PiBib3VuZCB2bWEuDQo+ID4gRm9yIGNvbXB1dGUgdm1zLCBpbnZhbGlkYXRlIFRMQiBnbG9iYWxs
eSB1c2luZyBHdUMgYmVmb3JlIHNpZ25hbGxpbmcNCj4gPiBiaW5kIGNvbXBsZXRlLiBGb3IgIWxv
bmctcnVubmluZyB2bXMsIGludmFsaWRhdGUgVExCIGF0IGJhdGNoIHN0YXJ0Lg0KPiA+IA0KPiA+
IEFsc28gZG9jdW1lbnQgaG93IFRMQiBpbnZhbGlkYXRpb24gd29ya3MuDQo+ID4gDQo+ID4gU2ln
bmVkLW9mZi1ieTogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50
ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9ncHVfY29t
bWFuZHMuaCB8ICAxICsNCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3B0LmMgICAgICAgICAg
ICAgICAgfCAxNyArKysrKysrKysrKysrKystLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVf
cmluZ19vcHMuYyAgICAgICAgICB8IDE1ICsrKysrKysrKysrKy0tLQ0KPiA+ICAzIGZpbGVzIGNo
YW5nZWQsIDI4IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hlX2dwdV9jb21tYW5kcy5oIGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3JlZ3MveGVfZ3B1X2NvbW1hbmRzLmgNCj4gPiBpbmRleCAwZjljNWIwYjhh
M2IuLmQyZDQxZjcxNzUyNSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUvcmVn
cy94ZV9ncHVfY29tbWFuZHMuaA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hl
X2dwdV9jb21tYW5kcy5oDQo+ID4gQEAgLTczLDYgKzczLDcgQEANCj4gPiAgI2RlZmluZSAgIFBJ
UEVfQ09OVFJPTF9TVE9SRV9EQVRBX0lOREVYCQkJKDE8PDIxKQ0KPiA+ICAjZGVmaW5lICAgUElQ
RV9DT05UUk9MX0NTX1NUQUxMCQkJCSgxPDwyMCkNCj4gPiAgI2RlZmluZSAgIFBJUEVfQ09OVFJP
TF9HTE9CQUxfU05BUFNIT1RfUkVTRVQJCSgxPDwxOSkNCj4gPiArI2RlZmluZSAgIFBJUEVfQ09O
VFJPTF9UTEJfSU5WQUxJREFURSAgICAgICAgICAgICAgICAgICAoMTw8MTgpDQo+ID4gICNkZWZp
bmUgICBQSVBFX0NPTlRST0xfUFNEX1NZTkMJCQkJKDE8PDE3KQ0KPiA+ICAjZGVmaW5lICAgUElQ
RV9DT05UUk9MX1FXX1dSSVRFCQkJCSgxPDwxNCkNCj4gPiAgI2RlZmluZSAgIFBJUEVfQ09OVFJP
TF9ERVBUSF9TVEFMTAkJCSgxPDwxMykNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3B0LmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcHQuYw0KPiA+IGluZGV4IGJlZjI2
NTcxNTAwMC4uZTgxN2ZhOWZlNjVlIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9wdC5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3B0LmMNCj4gPiBAQCAt
MTI5Nyw3ICsxMjk3LDIwIEBAIF9feGVfcHRfYmluZF92bWEoc3RydWN0IHhlX3RpbGUgKnRpbGUs
IHN0cnVjdCB4ZV92bWEgKnZtYSwgc3RydWN0IHhlX2VuZ2luZSAqZSwNCj4gPiAgDQo+ID4gIAl4
ZV92bV9kYmdfcHJpbnRfZW50cmllcyh0aWxlX3RvX3hlKHRpbGUpLCBlbnRyaWVzLCBudW1fZW50
cmllcyk7DQo+ID4gIA0KPiA+IC0JaWYgKHJlYmluZCAmJiAheGVfdm1fbm9fZG1hX2ZlbmNlcyh2
bWEtPnZtKSkgew0KPiA+ICsJLyoNCj4gPiArCSAqIElmIHJlYmluZCwgd2UgaGF2ZSB0byBpbnZh
bGlkYXRlIFRMQiBvbiAhTFIgdm1zIHRvIGludmFsaWRhdGUNCj4gPiArCSAqIGNhY2hlZCBQVEVz
IHBvaW50IHRvIGZyZWVkIG1lbW9yeS4gb24gTFIgdm1zIHRoaXMgaXMgZG9uZQ0KPiA+ICsJICog
YXV0b21hdGljYWxseSB3aGVuIHRoZSBjb250ZXh0IGlzIHJlLWVuYWJsZWQgYnkgdGhlIHJlYmlu
ZCB3b3JrZXIsDQo+ID4gKwkgKiBvciBpbiBmYXVsdCBtb2RlIGl0IHdhcyBpbnZhbGlkYXRlZCBv
biBQVEUgemFwcGluZy4NCj4gPiArCSAqDQo+ID4gKwkgKiBJZiAhcmViaW5kLCBhbmQgc2NyYXRj
aCBlbmFibGVkIFZNcywgdGhlcmUgaXMgYSBjaGFuY2UgdGhlIHNjcmF0Y2gNCj4gPiArCSAqIFBU
RSBpcyBhbHJlYWR5IGNhY2hlZCBpbiB0aGUgVExCIHNvIGl0IG5lZWRzIHRvIGJlIGludmFsaWRh
dGVkLg0KPiA+ICsJICogb24gIUxSIFZNcyB0aGlzIGlzIGRvbmUgaW4gdGhlIHJpbmcgb3BzIHBy
ZWNlZGluZyBhIGJhdGNoLCBidXQgb24NCj4gPiArCSAqIG5vbi1mYXVsdGluZyBMUiwgaW4gcGFy
dGljdWxhciBvbiB1c2VyLXNwYWNlIGJhdGNoIGJ1ZmZlciBjaGFpbmluZywNCj4gPiArCSAqIGl0
IG5lZWRzIHRvIGJlIGRvbmUgaGVyZS4NCj4gPiArCSAqLw0KPiA+ICsJaWYgKChyZWJpbmQgJiYg
IXhlX3ZtX25vX2RtYV9mZW5jZXModm0pKSB8fA0KPiA+ICsJICAgICghcmViaW5kICYmIHZtLT5z
Y3JhdGNoX2JvW3RpbGUtPmlkXSAmJiB4ZV92bV9pbl9jb21wdXRlX21vZGUodm0pKSkgew0KPiA+
ICAJCWlmZW5jZSA9IGt6YWxsb2Moc2l6ZW9mKCppZmVuY2UpLCBHRlBfS0VSTkVMKTsNCj4gPiAg
CQlpZiAoIWlmZW5jZSkNCj4gPiAgCQkJcmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7DQo+ID4gQEAg
LTEzMTMsNyArMTMyNiw3IEBAIF9feGVfcHRfYmluZF92bWEoc3RydWN0IHhlX3RpbGUgKnRpbGUs
IHN0cnVjdCB4ZV92bWEgKnZtYSwgc3RydWN0IHhlX2VuZ2luZSAqZSwNCj4gPiAgCQlMTElTVF9I
RUFEKGRlZmVycmVkKTsNCj4gPiAgDQo+ID4gIAkJLyogVExCIGludmFsaWRhdGlvbiBtdXN0IGJl
IGRvbmUgYmVmb3JlIHNpZ25hbGluZyByZWJpbmQgKi8NCj4gPiAtCQlpZiAocmViaW5kICYmICF4
ZV92bV9ub19kbWFfZmVuY2VzKHZtYS0+dm0pKSB7DQo+ID4gKwkJaWYgKGlmZW5jZSkgew0KPiA+
ICAJCQlpbnQgZXJyID0gaW52YWxpZGF0aW9uX2ZlbmNlX2luaXQodGlsZS0+cHJpbWFyeV9ndCwg
aWZlbmNlLCBmZW5jZSwNCj4gPiAgCQkJCQkJCSAgdm1hKTsNCj4gPiAgCQkJaWYgKGVycikgew0K
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcmluZ19vcHMuYyBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9yaW5nX29wcy5jDQo+ID4gaW5kZXggMmRlZWU3YTJiYjE0Li5jMjBm
ZTQxYzA3MjkgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Jpbmdfb3Bz
LmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcmluZ19vcHMuYw0KPiA+IEBAIC0x
NSw2ICsxNSw3IEBADQo+ID4gICNpbmNsdWRlICJ4ZV9tYWNyb3MuaCINCj4gPiAgI2luY2x1ZGUg
InhlX3NjaGVkX2pvYi5oIg0KPiA+ICAjaW5jbHVkZSAieGVfdm1fdHlwZXMuaCINCj4gPiArI2lu
Y2x1ZGUgInhlX3ZtLmgiDQo+ID4gIA0KPiA+ICAvKg0KPiA+ICAgKiAzRC1yZWxhdGVkIGZsYWdz
IHRoYXQgY2FuJ3QgYmUgc2V0IG9uIF9lbmdpbmVzXyB0aGF0IGxhY2sgYWNjZXNzIHRvIHRoZSAz
RA0KPiA+IEBAIC0xMDcsNyArMTA4LDcgQEAgc3RhdGljIGludCBlbWl0X2ZsdXNoX2ludmFsaWRh
dGUodTMyIGZsYWcsIHUzMiAqZHcsIGludCBpKQ0KPiA+ICAJcmV0dXJuIGk7DQo+ID4gIH0NCj4g
PiAgDQo+ID4gLXN0YXRpYyBpbnQgZW1pdF9waXBlX2ludmFsaWRhdGUodTMyIG1hc2tfZmxhZ3Ms
IHUzMiAqZHcsIGludCBpKQ0KPiA+ICtzdGF0aWMgaW50IGVtaXRfcGlwZV9pbnZhbGlkYXRlKHUz
MiBtYXNrX2ZsYWdzLCB1MzIgZXh0cmFfZmxhZ3MsIHUzMiAqZHcsIGludCBpKQ0KPiA+ICB7DQo+
ID4gIAl1MzIgZmxhZ3MgPSBQSVBFX0NPTlRST0xfQ1NfU1RBTEwgfA0KPiA+ICAJCVBJUEVfQ09O
VFJPTF9DT01NQU5EX0NBQ0hFX0lOVkFMSURBVEUgfA0KPiA+IEBAIC0xMTcsNyArMTE4LDggQEAg
c3RhdGljIGludCBlbWl0X3BpcGVfaW52YWxpZGF0ZSh1MzIgbWFza19mbGFncywgdTMyICpkdywg
aW50IGkpDQo+ID4gIAkJUElQRV9DT05UUk9MX0NPTlNUX0NBQ0hFX0lOVkFMSURBVEUgfA0KPiA+
ICAJCVBJUEVfQ09OVFJPTF9TVEFURV9DQUNIRV9JTlZBTElEQVRFIHwNCj4gPiAgCQlQSVBFX0NP
TlRST0xfUVdfV1JJVEUgfA0KPiA+IC0JCVBJUEVfQ09OVFJPTF9TVE9SRV9EQVRBX0lOREVYOw0K
PiA+ICsJCVBJUEVfQ09OVFJPTF9TVE9SRV9EQVRBX0lOREVYIHwNCj4gPiArCQlleHRyYV9mbGFn
czsNCj4gPiAgDQo+ID4gIAlmbGFncyAmPSB+bWFza19mbGFnczsNCj4gPiAgDQo+ID4gQEAgLTI1
MCwxNCArMjUyLDIxIEBAIHN0YXRpYyB2b2lkIF9fZW1pdF9qb2JfZ2VuMTJfcmVuZGVyX2NvbXB1
dGUoc3RydWN0IHhlX3NjaGVkX2pvYiAqam9iLA0KPiA+ICAJc3RydWN0IHhlX2d0ICpndCA9IGpv
Yi0+ZW5naW5lLT5ndDsNCj4gPiAgCXN0cnVjdCB4ZV9kZXZpY2UgKnhlID0gZ3RfdG9feGUoZ3Qp
Ow0KPiA+ICAJYm9vbCBsYWNrc19yZW5kZXIgPSAhKGd0LT5pbmZvLmVuZ2luZV9tYXNrICYgWEVf
SFdfRU5HSU5FX1JDU19NQVNLKTsNCj4gPiArCXN0cnVjdCB4ZV92bSAqdm0gPSBqb2ItPmVuZ2lu
ZS0+dm07DQo+ID4gIAl1MzIgbWFza19mbGFncyA9IDA7DQo+ID4gKwl1MzIgZXh0cmFfZmxhZ3Mg
PSAwOw0KPiA+ICANCj4gPiAgCWR3W2krK10gPSBwcmVwYXJzZXJfZGlzYWJsZSh0cnVlKTsNCj4g
PiAgCWlmIChsYWNrc19yZW5kZXIpDQo+ID4gIAkJbWFza19mbGFncyA9IFBJUEVfQ09OVFJPTF8z
RF9BUkNIX0ZMQUdTOw0KPiA+ICAJZWxzZSBpZiAoam9iLT5lbmdpbmUtPmNsYXNzID09IFhFX0VO
R0lORV9DTEFTU19DT01QVVRFKQ0KPiA+ICAJCW1hc2tfZmxhZ3MgPSBQSVBFX0NPTlRST0xfM0Rf
RU5HSU5FX0ZMQUdTOw0KPiA+IC0JaSA9IGVtaXRfcGlwZV9pbnZhbGlkYXRlKG1hc2tfZmxhZ3Ms
IGR3LCBpKTsNCj4gPiArDQo+ID4gKwkvKiBTZWUgeGVfcHQuYyBmb3IgYSBkaXNjdXNzaW9uIG9u
IFRMQiBpbnZhbGlkYXRpb25zLiAqLw0KPiA+ICsJaWYgKCF4ZV92bV9ub19kbWFfZmVuY2VzKHZt
KSAmJiB2bS0+c2NyYXRjaF9ib1tndF90b190aWxlKGd0KS0+aWRdKQ0KPiA+ICsJCWV4dHJhX2Zs
YWdzID0gUElQRV9DT05UUk9MX1RMQl9JTlZBTElEQVRFOw0KPiANCj4gSSB0aGluayB3ZSBuZWVk
IGEgc2ltaWxhciBpZiBzdGF0ZW1lbnQgKyBlbWl0X2ZsdXNoX2ludmFsaWRhdGUgY2FsbCBpbg0K
PiB0aGUgZnVuY3Rpb25zIHRoYXQgZW1pdCBqb2JzIGZvciBkaWZmZXJlbnQgY2xhc3NlcyB0b28s
IHJpZ2h0Pw0KDQpIYW5kbGVkIGluIHRoZSBuZXcgdmVyc2lvbjogaHR0cHM6Ly9wYXRjaHdvcmsu
ZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xMTkxMjQvDQoNCj4gDQo+IGUuZy4gZW1pdF9qb2JfZ2Vu
MTJfY29weSwgZW1pdF9qb2JfZ2VuMTJfdmlkZW8NCj4gDQo+IE1hdHQNCj4gDQo+ID4gKw0KPiA+
ICsJaSA9IGVtaXRfcGlwZV9pbnZhbGlkYXRlKG1hc2tfZmxhZ3MsIGV4dHJhX2ZsYWdzLCBkdywg
aSk7DQo+ID4gIA0KPiA+ICAJLyogaHNkZXM6IDE4MDkxNzU3OTAgKi8NCj4gPiAgCWlmIChoYXNf
YXV4X2Njcyh4ZSkpDQo+ID4gLS0gDQo+ID4gMi4zOS4yDQo+ID4gDQoNCg==
