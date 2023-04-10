Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25DCAC76196
	for <intel-xe@archiver.kernel.org>; Mon, 10 Apr 2023 16:24:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF2D910E0EA;
	Mon, 10 Apr 2023 16:24:13 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD5D10E0EA
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Apr 2023 16:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681143852; x=1712679852;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=xTSl3WPz/K+MX05QQ0D1UYiEjkEfx4g6NVSQh+EstVY=;
 b=idgsCSqXGbmxhM1tVYs2A6IqB0aWzjuMIYGN/ccDDuF1JAtj8M4wUS/0
 d4M5r0LnNJYUcTrimPWaKIYkrZOnO1RLDtB+hZ+LJzsIxHEPJbXHNuwRH
 Kq79/x2XBjKQRQxlYDqEM7U1ShqV3YNFt7tyiUKW4veNaiJQJmh+9lFQ9
 VDjGFpA3l3VdXeKMlnyTb2sx5GF6Sp4kl94z2tfmwi98mg+Ulc52fKva+
 ci/jNU3FEiKMgPGLVGLTaVNI06KxVWeB/j+yckd/f9yhAaMzN3f5y7+JO
 exz45ZHPMtvBwGl6BXwHVKilaFOhNBgf9iXUUqhgVy2a5NAvxggOnhOEi g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="323027021"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="323027021"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 09:24:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="1018028277"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="1018028277"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP; 10 Apr 2023 09:24:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 10 Apr 2023 09:24:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 10 Apr 2023 09:24:11 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 10 Apr 2023 09:24:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E9husQwKAbRnFTWHZQdtkE7YczKzqtubtI23nVetsGcnBpWjsktVQzXA4j6FWJA1XxiHJNHI6ny2dODHy9Yy7BCr5R9jrGX5ZXfcgW94nBg1QatcrBh+v96DUTJYENDomy3JSopQEeaZ1GJ0Fk0ePwJBQO+8wsx0f65cJHhvdEWhTqt+DV1QRZ/j0Spwk0r5LiEDq4RB3YXhe2b0X1bsY56LjViwhWX5JbVLkF4JSktiotA8jwZDGOA9gWKhufjKZphJQq+C9So6zeHn+xznxSewj9dkBPAGSxN4HO8IGyU05gQ2C2M17yNmtx2Vd8WtwJgRComiYygM2SN+BWZ2Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xTSl3WPz/K+MX05QQ0D1UYiEjkEfx4g6NVSQh+EstVY=;
 b=juTO75bVwxFn+UkpxCwbsFlm0481wLBTNL7jEEYiIQPGrBLmHoAXuQiv4TRFLzOIM9AxVTWpIr64+dsQQ5kBy4oJK3EQWv4/WZtjceQ9YHl1UUNk8QY8R2GA9N53+UZk8CjDXJaZyE4euEPrGnAKYSIfh71PhM5biCtXm3z4DQhG2p3MyRRi2tzrd45SkB9oc5iYgIHeiXPTHOWfWrTWg8m4ybGt01OTCzV4/6A+3VCs7sEOkz1wa+cTRaK50Wo9UVYeABkuAMU63xPTbOoUMlG25XZelS2VE99McEWpjeSHb9+FX5+V+7ioKIbp1IwodmelXZPqxNiN3GrYYFb9+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SJ0PR11MB4848.namprd11.prod.outlook.com (2603:10b6:a03:2af::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.34; Mon, 10 Apr
 2023 16:24:09 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651%3]) with mapi id 15.20.6277.038; Mon, 10 Apr 2023
 16:24:09 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Thread-Topic: [Intel-xe] [PATCH v2 rebased 4/6] drm/xe/display: Enable modular
 fia in TGL
Thread-Index: AQHZaJSMR6ZsdytSyUGeoT9qcYq7na8ks9sAgAAMuQA=
Date: Mon, 10 Apr 2023 16:24:09 +0000
Message-ID: <fd512e4feaf3949b2cf5209e741b358159ed7f53.camel@intel.com>
References: <20230406143133.29474-1-jose.souza@intel.com>
 <20230406143133.29474-4-jose.souza@intel.com> <ZDQteoVKCktzyNus@intel.com>
In-Reply-To: <ZDQteoVKCktzyNus@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SJ0PR11MB4848:EE_
x-ms-office365-filtering-correlation-id: 445232f4-0023-486c-b9b9-08db39e00365
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wZaL4okHk4ToqaNR/AZrPtoMP64+a2r9oPFpnLIw2Bl3VgZLGAMDF8oZ0m7NrJI1bvAHzpwpbhKF5AFXWwlx1ZSjKAPK8f/ZAqiqlHnTORREP40m9HNEnau8HImKdhPQoo/hyVqbhU780cjZpdiYFHdPIBdqD+Nl9094CsPKd6hfEiFwI5wQ0ck7vricHpPOpH5nSM9DjXKp2G4pvH0HBt2+zUgW86KhS3/QHuQhIDrOm0eZNbDHz7y/cUnZ5bxK+srKVE3ID9idIKhK4Ztz7Wscs52xzn0c1ZdrTyXYq80ucrb6jo07y3EQSjHNWtA0kYLyEk/SMIyDWg0qSyWigknNYQ7gETkdGdjZNZhDLNiZfWeUdjvx+7prP6Cw4g5DBYWeDgTO5WkVeYhp2bHcXxMP2/lo4nCfZZ43vsWgnDBteJdQZLqqRovAfNPsijTSqBaq56Bvg59VVbGbw0aNXSJKXklQKFn4/AC+vEzr9CkpHZtkboW2NrKoShPfuAjp+VoaS7vu6efCXYWAHWx4brLRb0d+NI89eR6+tUCA+QydH3Fi+SLnmajFJQo8w3EMi0ErX4LhrliHD32HyN0edBC11l35uxB3WWpgTXJl/5jvPI7hgLYPHVZroJ/G/tE3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(366004)(396003)(376002)(136003)(451199021)(86362001)(36756003)(26005)(186003)(6506007)(6512007)(2906002)(2616005)(478600001)(83380400001)(66446008)(66476007)(64756008)(8676002)(91956017)(4326008)(66946007)(66556008)(76116006)(37006003)(316002)(6486002)(5660300002)(41300700001)(71200400001)(6862004)(6636002)(8936002)(38100700002)(38070700005)(82960400001)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q28ybG1aWUo1MmszQ3JuSTYybXcxWDhKdlV4VU0zMktCRVowQzlWR0M0bmFR?=
 =?utf-8?B?azZwbk5ZOWxIT3AvMW02bk1iOEVpcUgwdkhoZit0dkVrS29halZhRWNiR1Ft?=
 =?utf-8?B?Q3V3WVUrWWJpaUdKNDZLMS9PMTJoYlFNb0tBZDY1TUw5V0ZnOWFlLytoelhZ?=
 =?utf-8?B?ZHRDR1hjNURJaUJIelFybnB1S2d0d3JVbEs0OWQ3anRVaDJWVUxadmdMSjY1?=
 =?utf-8?B?MzZ4cUNoYlF5LzdvdUR0d0Z3UWVHVHkwYmpFeFd3Wkl4QWovWEY1N3NERlVt?=
 =?utf-8?B?NVhWdkxQVDVBL3ppK3E3TzFzN2o5MEVmT3g3ZmNDd0pIcDhmRTgzNXFKZGNO?=
 =?utf-8?B?SnFzaG5NQW5Rd2E1OElvTHc0emJJQXZ6ZmhNbHlRVVBmd00yNEVyUjNoQ3VH?=
 =?utf-8?B?ZEJ3NDhoN05HNlJJM2pnTDd2Mi9lViszUk9NN2c5TStDV1pFNURTTnI2VFFP?=
 =?utf-8?B?ZWdTK21pQmVRSGxSd3hyc1B3Tk4rR1JwVjJPdjAwOHhoM2R6RGMyL0RxOGVV?=
 =?utf-8?B?NjFuemtpZ0ZPMDU2aDVMWTJnRzU0c1cyWnVOT0cwd1hCVXpnYWh4ZE0weHNM?=
 =?utf-8?B?TGM2QzM2RHVodmpJbUFUODdUQS9YQk4zdm9pcXU5TTlSOHBpUWI2eGdlMXVD?=
 =?utf-8?B?WXppWGEwUkRBcWovelZUUU5vVTNiYVZyS1RxTjJoNUNneFFVV0t1S2J0SkM5?=
 =?utf-8?B?SktzS2NHT2QxSUVSeDZvRjA1WS8weVBNTkxxeUR6a1NGKzErN1ltWTRpVzVV?=
 =?utf-8?B?SzlteGNVcDAvTmZSQUhCOWlSR0RYaUxmNzVCYlBXMjlUdlVjbFd4eGgxUmJQ?=
 =?utf-8?B?WVlkMitRRC9yNU91LythSzlYWGI2UStRNWFqZWNFWXdWOHREUitIZ3lKTXlr?=
 =?utf-8?B?VXdkeDF1Ti9maTc5OGphNUpkZEZtYk50SFdwWmVEMmh2RFpOZ2ZjTnBPaDNR?=
 =?utf-8?B?YUZNQVZLY05QbWRCK2c5NE40Z2tGcjJYckVjaTlEem4vNmNuTDdhQmtoaFBl?=
 =?utf-8?B?Unp6RmtXZWlNVnpuSGkzMlJJT1c0S3NjMGgrME92UjRrTGg4Y0doS3hZTE8x?=
 =?utf-8?B?THc3blEveDFoUjVBU2hhenVRT0todVQxYzU0VjlQQ0xpSlJNWS9Gbi9KN0d5?=
 =?utf-8?B?M0NaYjJXK1lnRXF2MThSMXFGZjhRQ0xnVGR1Y2R4ZlIyK3RCV3Q1VmhSazBP?=
 =?utf-8?B?TWlDUXRHeGNwWEExSTFkVlBKY2ZIMDBHSGxud1NjQURaWVRhcUlFcVpoZnZw?=
 =?utf-8?B?Mi93djNLNktaeEhxTHVwMVkvUStDa21zU0tGeCswRzRjOXMwUVNHdU1sTkNO?=
 =?utf-8?B?bUpGWmdlbGt2S2N5cDFXL0ZCNXJVU095T051K3EreTFmTHFONE83c2ZZZU1M?=
 =?utf-8?B?SlpjYmNUNFdtSERQZzEvbDdsN0cxSjZrM2NhSUQ5QjYyM3JueTE5ZEg3Mmty?=
 =?utf-8?B?NnNadndtbUhybFoyS2h4K202QlVBMVV1My9JYVliSittTGRZVGdaSXYyRTQ3?=
 =?utf-8?B?dVZXYW5RN296NDVjMnFMTWk4VDVVVWtLcDc2U25BZndZalZybm9QNU1WcUtB?=
 =?utf-8?B?NmFacCtmZW5WQk1BOGFnaTIzeThiOWg4VTYxTlFJRWdqNHVMdHExYXV0R0V2?=
 =?utf-8?B?YVEvWlVlUzVVNGcyODJ5NkNhcEczWFFVajVqN1lpTWlwNWlIc1ZPZjJRUVVQ?=
 =?utf-8?B?UDNQbE15UUtlWVFnVElOeTVnZnA0Tnp6eHF1MzM4VnZBUjNRamFlNHRxOGli?=
 =?utf-8?B?NjZkYUJ2aUUyVXBoNlQ1RWtRNWdHUXZQN1NQcFpNcDhBbjRFSVJVZm94M3o5?=
 =?utf-8?B?cEp3UnFpNlc1dE00T0lYL2djVGhnZkdXRC9ENS9lQkVmSFMrRUkzTkhZMThq?=
 =?utf-8?B?Z3MzK1AyaUwrOWEyWThndkhtZ1Vhdnd2djhOLzlLcTU2RytMWGM3NWFJa2lB?=
 =?utf-8?B?MXdFMVpNL1c2aEtwbDA2QThNQ0Myb0twemhQSDUwa2ZCRDFISDBCM0hVU3ow?=
 =?utf-8?B?Rm4yUEl1T2JLUmF4QjBKRkJsNDNFUGJYZTFnU3RaSFA0ZjVFZldUdXNFcEJF?=
 =?utf-8?B?d25QVVh4dEsrNEhvMlFmR2o3NitOVFF5TTM2aTZlRlIxOG1ySm5vOEg4dUFB?=
 =?utf-8?Q?eRlqa0PwA5N60Jfj6s1LDEpgR?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <03F25BCAFF238740B8080A34354047EE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 445232f4-0023-486c-b9b9-08db39e00365
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2023 16:24:09.5040 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NrQfjZ+tdtfumEPOVCCtXmOPKqVO5AL1Zrr+uZ2R45rfn8fU+tF83tCEgBBOjFx+TGH+pPWBkjYpqzouvy3SOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4848
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 rebased 4/6] drm/xe/display: Enable
 modular fia in TGL
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

T24gTW9uLCAyMDIzLTA0LTEwIGF0IDExOjM4IC0wNDAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IE9uIFRodSwgQXByIDA2LCAyMDIzIGF0IDA3OjMxOjMxQU0gLTA3MDAsIEpvc8OpIFJvYmVydG8g
ZGUgU291emEgd3JvdGU6DQo+ID4gVEdMIGlzIHRoZSBmaXJzdCBwbGF0Zm9ybSB0aGEgaGFzIGl0
Lg0KPiA+IEVuYWJsaW5nIGl0IGZvciBERzEgZG9uJ3QgY2F1c2UgYW55IGlzc3VlcyBhcyBERzEg
ZG9uJ3QgaGF2ZSBhbnkgcmVhbA0KPiA+IFRDIHBvcnRzLCBzbyBpbnRlbF90Y19wb3J0X2luaXQo
KSB3aWxsIG5vdCBiZSBjYWxsZWQgZm9yIERHMS4NCj4gDQo+IHNvLCB3aHkgZG8gd2UgbmVlZCB0
byBlbmFibGUgdGhlbj8NCg0KVEdMIGhhZCBpdCBkaXNhYmxlZC4NClRoaXMgaXMgbmVlZGVkIHRv
IHByb3Blcmx5IGluaXRpYWxpemUgVEMgaW4gc29tZSBza3VzLg0KDQo+IA0KPiA+IA0KPiA+IFNp
Z25lZC1vZmYtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29t
Pg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGlzcGxheS5jIHwgNSArKysr
LQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+
ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kaXNwbGF5LmMgYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfZGlzcGxheS5jDQo+ID4gaW5kZXggNWZhYjViOWZiZGUwYy4u
MDAwMWE5ZDAyNDk1ZCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGlz
cGxheS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Rpc3BsYXkuYw0KPiA+IEBA
IC00ODYsNyArNDg2LDEwIEBAIHZvaWQgeGVfZGlzcGxheV9pbmZvX2luaXQoc3RydWN0IHhlX2Rl
dmljZSAqeGUpDQo+ID4gIAlzd2l0Y2ggKHhlLT5pbmZvLnBsYXRmb3JtKSB7DQo+ID4gIAljYXNl
IFhFX1RJR0VSTEFLRToNCj4gPiAgCWNhc2UgWEVfREcxOg0KPiA+IC0JCXhlLT5pbmZvLmRpc3Bs
YXkgPSAoc3RydWN0IHhlX2RldmljZV9kaXNwbGF5X2luZm8pIHsgR0VOMTJfRElTUExBWSB9Ow0K
PiA+ICsJCXhlLT5pbmZvLmRpc3BsYXkgPSAoc3RydWN0IHhlX2RldmljZV9kaXNwbGF5X2luZm8p
IHsNCj4gPiArCQkJR0VOMTJfRElTUExBWSwNCj4gPiArCQkJLmhhc19tb2R1bGFyX2ZpYSA9IDEs
DQo+ID4gKwkJfTsNCj4gPiAgCQlicmVhazsNCj4gPiAgCWNhc2UgWEVfQUxERVJMQUtFX1M6DQo+
ID4gIAkJeGUtPmluZm8uZGlzcGxheSA9IChzdHJ1Y3QgeGVfZGV2aWNlX2Rpc3BsYXlfaW5mbykg
ew0KPiA+IC0tIA0KPiA+IDIuNDAuMA0KPiA+IA0KDQo=
