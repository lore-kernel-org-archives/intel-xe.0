Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A733EB64D9
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jun 2023 02:50:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A29C10E345;
	Wed, 28 Jun 2023 02:50:07 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6787410E344
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jun 2023 02:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687920604; x=1719456604;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=EqbG6QOW8AW9QXKiXpEJKGpXO3CjXEhY728UMw6gL78=;
 b=aC6+718XLbXUX2SQYhGJE6U/L2RPqlp38bKrErIJjS39nIWYsCywIleu
 oMgW22w/5NYfGZy5jcfLZduRtthkQARYjP1pF67krDc2NK08MGB9nb0jV
 7aEM8vkrSlFl+fPjnhox6rfEncfKh1sJ3a9vWSqM9ww5ErWa9oFh0pQVO
 8G49EQlaP6lT64A187E2Q8naHmFIa1UgDeedT3Xdvx++cCbG560Z1djRq
 GAKMwehtQ9KvJ8wZ2LrPUk3/S/XFe/h+GNO53GdnPaAKrhnVodhsqR7Gt
 KElnsmHQVM2Ft+k+3Bct6+4amzit4BLCLejskhog5A4bvRnKsAt0x02Km g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="359227444"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; d="scan'208";a="359227444"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 19:50:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="963422582"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; d="scan'208";a="963422582"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga006.fm.intel.com with ESMTP; 27 Jun 2023 19:50:03 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 27 Jun 2023 19:50:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 27 Jun 2023 19:50:02 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 27 Jun 2023 19:50:02 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 27 Jun 2023 19:50:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CkMPc2/1KwsjID/RZitJLdgZhSFEAh5vzGjpR8uBA77Nes92135uoiOV8wueo1syGuypQ+RzEhkqMPUMYVshRvr3RaZxUNVs5oN1N1y1rbjLi3rghC2lKZN2GIjKLVHct68XSKeWR21m4nBArr9/0DRL11krNlhqPMnPPhHAQ6p4qBJDUuKI086Q6mOzwJAGV50HzDAcHCgHdF2dMvvzIws3Yo/nElmyPEBeS3TZ8LfKYDjMYFTwKLEJ1ie3FPbDHYLnbwBAQ7UGkp+Ps58dyZ9S5MItP9eMctvklS+g/HOf+kfKCq/Ykqlh5s0B9NE6/SV262qbbUBXmCUjEpBoiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EqbG6QOW8AW9QXKiXpEJKGpXO3CjXEhY728UMw6gL78=;
 b=nqyFVejO8xwJ/qNDkguKBRf5dWh/K3G51b4SCFz4pcQp37bK/Q6cRGOpckS5Qlp1hOObqMWmbWA+GXenH6MBT8Awa9suKk1EZvgBT7ounLv3IxKl90ZAy0wiI1AXODXgQ7SIQCVBd3fJ8yPS7Lu1HSgdqLBgg/jCji5W5Opebhli3R5pihgPO6LPNxFPMVviMir5q7W4MAAMIlRXT/7GZjPMb1fdPsMDxFWG6NSKQPkK4VGgLzc6mj5Hwh2DuzRcuC+FwIO9W0X0RcGrRHSrW0eJxS4gXiHSJuSRzKNT3h0TXispzrUr+W86kJkVipbcXfD8/QS0oNz/IVyZ1S9sBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH0PR11MB4806.namprd11.prod.outlook.com (2603:10b6:510:31::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Wed, 28 Jun
 2023 02:50:00 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e%7]) with mapi id 15.20.6521.024; Wed, 28 Jun 2023
 02:50:00 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH V4 1/3] drm/xe: Add sysfs entry for tile
Thread-Index: AQHZpNpabl17y7Kz00GnRwknLi1B7q+fizGw
Date: Wed, 28 Jun 2023 02:49:59 +0000
Message-ID: <MW4PR11MB70566C07AE69A80924B98B92B324A@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230622072818.3182423-1-tejas.upadhyay@intel.com>
 <20230622072818.3182423-2-tejas.upadhyay@intel.com>
In-Reply-To: <20230622072818.3182423-2-tejas.upadhyay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|PH0PR11MB4806:EE_
x-ms-office365-filtering-correlation-id: 1dfefbe6-cb70-42e0-2182-08db77825d5c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GwBEBl1AKyeIj9igA0X6MOr+rWyj0rmp1Dz1GXqJ6PREFM/PtFZyZMztT43MgJDtO/1CGTKRzpc488R3WiDVRwD/9KyFRLyWX09hS/q/LGA9YHOjsXKbyYCOyoj1QFnB36SamvKJwhHiQY1WDjcQhYK6UPaOvq6/wzMW6Yh/hk6cuCumvgYnS/shxUqjdcIXSJhy1sQD44dqQrzZ/KCRoCH8B66NJlTuwcR51ddLNE7bH70uIgu8B9JonGIZSQdTQCMYUjSrZHrrSxWsJloAAHTg+Yk52AyLpIR3v1j9KESClwjE9N8uQAiCP3LHWWsum00DRFiW9jIqt16g1qq8rD7e6rASYyWGXgzcKuam8PQQTuUBQ21fibKf3p4sAV022PrA7vhfpPFe4PpHLvJYPHunfciv8HdhixDndbIKIdh+P/myHXZzM5KU+UwrfsBeLtm9Cw7T39oP20UDrX3G2E/aGQPt+Mow4jHmY3t/TtGSiSiNK0Q0szlvuv9kr1FBg3iH11HGBY43Jh689+6+OXceHGxr2+NyfKyWyFl1VLdVTsI5AC7Lr9UkZtQWD6xHs8XJMNUGySettj7W2LzwbtflBo6LvmMqxXD4/Ze4wMi0HXakTierzallmMPRhakL
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(39860400002)(346002)(396003)(366004)(451199021)(66899021)(83380400001)(8936002)(316002)(52536014)(7696005)(71200400001)(110136005)(8676002)(41300700001)(33656002)(55016003)(122000001)(86362001)(82960400001)(38100700002)(64756008)(9686003)(5660300002)(66946007)(66556008)(66446008)(66476007)(478600001)(2906002)(186003)(26005)(76116006)(38070700005)(6506007)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bitGZElkSHpycktJZW11RlBydjNTVUV6SS9zbnpGNXBNMVdFUmJYdm1XOG9j?=
 =?utf-8?B?M1RzZDNRZ2xRQlkyelRrcWQ4aGF5WWxQclZTNlBYSDJUTlhpUTVkTzg4eVkx?=
 =?utf-8?B?bzVTZDJtRnhtU0hBVUdwakJiR3VCS0lBcnFFVm1hSGhsZHhlMVFKUVhqb3RZ?=
 =?utf-8?B?M0VURmpOcXBpU1JCL21Pa1duTThQVHNZRFlwSnI1YW9veWd4S3ZwRWNrTlg5?=
 =?utf-8?B?Q1E2eUJMUHQ1UndrK0Q4KzNyMGNtalMvRk9VSjRNN3pFNkozRElSTE1STFpp?=
 =?utf-8?B?VXhQSFJtblZjRlNFNWhWWlNoaXY5OGtISlppRHZPbi9va3ZCTm4zM2JPekU0?=
 =?utf-8?B?ZVFWWEE3WUptVjhwblMyb0ErdzFGVmhJcHJDek1FRTVTamZZdW1QQkRuUTVI?=
 =?utf-8?B?aWxIVHYzSUhUUHgrcE5LYURiaXZVOGk1b3JaRU5oUXhtTGRXRE4wSUNQSDVG?=
 =?utf-8?B?UjhhaEhZUSt3ekRlanVmaWFJaHNJWHdTN0R5SHQ5UGlyazVSdUlIZ3Q2YTdX?=
 =?utf-8?B?V21XS0RscmJpTlIvempvZmFyNUtxL2tqTHB4VTE0SnJ1SGVwYTJNb3ZibVVO?=
 =?utf-8?B?cnRvMDVPWEN2UWg4eGI5OGRHVmZUekJuTE1rSWtncUx5R20vQXZKTVpSTWhq?=
 =?utf-8?B?UWFHMzU4OEE5SSt4Wnk3UjhBQ3lUOEsvUWNOMzJ4Ui9hbDA3L2ZoVTkrblND?=
 =?utf-8?B?NTV3NFMwTGdrL0VWRFAxaGZ1ak93U29rSWVmb05BaFhaMFlzODdUYUhlb1hu?=
 =?utf-8?B?a0s3VzQyQmNtK0VpZ2tuVUFQVlhlY1RDNENPUk9NdVlxUHdBWnY0ZUE3UUFP?=
 =?utf-8?B?NEtiYng0REZ3VFo2TkFPRkxGY0lESDRBMU5ndWNWZlBWbXlSYnJWTU9xU3dX?=
 =?utf-8?B?d3orTEpCejIrMmdncDltYkFzNWxlcGU3SUtMdFB6SGlVU1dJUFZSVGNnK3Fi?=
 =?utf-8?B?S0dVc1dJNkh1L0hyZllLL1VqSVlOQXlFckNnWnp2dUJFUUVDdlI2YjBiUkhm?=
 =?utf-8?B?djhVS3NDZHpiNW9oRmh5c0JXZ2hqSHpIa05nNWR0Vnpha2owOTFCaHZ2YUJy?=
 =?utf-8?B?ajNvbjM3NkxSQlROcnlRSlhjWFVpYTdvc0JrNkVXTHdybHdsZ0M3bkR2dExN?=
 =?utf-8?B?OHNlVEo2bmZrVzRzUnY5TU5xenNwVkdSRnFNVW9ydWN6WHhoRFF4M2FmRTEy?=
 =?utf-8?B?MUlmMktSczBrWDB4TWR3VFlHamV0NDVkbFVpZy95TnNNbmtyeDdOOEVwMlB0?=
 =?utf-8?B?VHpNNGZGVnNyb1pwcWFYeGFJeERGZUdiQ2dQU0lBYjhQU0hOK0VpY1MweXly?=
 =?utf-8?B?M1ZFNC9Hak9Yd1duTTE5Njl3WjhXTk5rZlNRdGdEWHVXbEJEckM0dXZEcThi?=
 =?utf-8?B?LzgrUFNSNzFuQm0yREJPSW1kamo3RnNDNi9qQTZ5WmRjSE4rOXRlZkhKVDVl?=
 =?utf-8?B?b20wa3ZTVXZFVmxrWnRTYW9haVFyeTQzSnYxc0REb2xPMys2U3ZEaUhlY2Nx?=
 =?utf-8?B?bmlWRC9CdkdFalZtVjlkdXpoeG81elZnNzdKYThOTjZIN2hOSlV0blRPK2pT?=
 =?utf-8?B?ajRMcjdrVjgwWjRCM0VxZXcvcnpOMVdONkVrREFDd0VONUdITUs3bkgyanNm?=
 =?utf-8?B?L1BpRkg1ckgzN251UVY4K0JoSSswTU56eU9Bc3kxcUFaMk4rOGE0VGxSc0tm?=
 =?utf-8?B?MHQ5TC90eVBvTm5GNlp2OGNKc21uK0dYRTJrK2tvaDB1dTg2VFJzUlZsa0Vr?=
 =?utf-8?B?WGpQUGFlWEZoZjRSdWZjUUQ4V3MvTU9aL3hjQnhzUjRwcnExV2VZL0VuVGdl?=
 =?utf-8?B?TVRsRTYxbm9ORndSeWpsaTlaYTBWcWd1RnpGdjhicmNWdU4vREsvOUFKSzY0?=
 =?utf-8?B?V3J0b0g4RDNqV1NyUzZYU2hSN0xGMVRiMmQxL0ZhQWU1MnNwM1hmWHk3aWFH?=
 =?utf-8?B?NUlySkFmSHZ4aGk2dXNCY3EweTdjdExLN3hpa0ZmZmIyTGRNMi9PTUVGNVFS?=
 =?utf-8?B?UGMrSkVtNHVGSUhkS0Q5TiszRk1ZUnA2QXpLajVxZm1KWStBOUhodG05akV0?=
 =?utf-8?B?VEtaQ2tFVUpOaVBWWkhSdTJJeEU5TTRGeVFqSlZwRHVIVlovM3JFaUtuTHkz?=
 =?utf-8?B?ZmdGTm1DanpWeFZmQTJYcmoyTFpwS0pnZGxEV09BOU1TWEVlQ3oxbC94Q3Yx?=
 =?utf-8?B?b1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dfefbe6-cb70-42e0-2182-08db77825d5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2023 02:49:59.8491 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M6kNS0RZQYMWhFIjYGQ4O+VK7+hyb3QqXm7nE5Wqz9ImrvlnErcSOrjX1N9uzs4WD69baQgTCO6XYREj6+f/MvnWeMEwjWj5zf/3CZZJVxM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4806
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V4 1/3] drm/xe: Add sysfs entry for tile
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwteGUgPGludGVs
LXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgVGVqYXMNCj4g
VXBhZGh5YXkNCj4gU2VudDogMjIgSnVuZSAyMDIzIDEyOjU4DQo+IFRvOiBpbnRlbC14ZUBsaXN0
cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogW0ludGVsLXhlXSBbUEFUQ0ggVjQgMS8zXSBk
cm0veGU6IEFkZCBzeXNmcyBlbnRyeSBmb3IgdGlsZQ0KPiANCj4gV2UgaGF2ZSByZWNlbnRseSBp
bnRyb2R1Y2VkIHRpbGUgZm9yIGVhY2ggZ3B1LCBzbyBsZXRzIGFkZCBzeXNmcyBlbnRyeSBwZXIg
dGlsZQ0KPiBmb3IgdXNlcnNwYWNlIHRvIHByb3ZpZGUgcmVxdWlyZWQgaW5mb3JtYXRpb24gc3Bl
Y2lmaWMgdG8gdGlsZS4NCj4gDQo+IFY0Og0KPiAgIC0gUmVvcmRlciBoZWFkZXJzIC0gQXJhdmlu
ZA0KPiBWMzoNCj4gICAtIE1ha2UgQVBJIHRvIHJldHVybiB2b2lkIGFuZCBhZGQgZHJtX3dhcm4g
LSBBcmF2aW5kDQo+IFYyOg0KPiAgIC0gQWRkIGxvZ3MgaW4gZmFpbHVyZSBwYXRoDQo+IA0KPiBS
ZXZpZXdlZC1ieTogQXJhdmluZCBJZGRhbXNldHR5IDxhcmF2aW5kLmlkZGFtc2V0dHlAaW50ZWwu
Y29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBUZWphcyBVcGFkaHlheSA8dGVqYXMudXBhZGh5YXlAaW50
ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZSAgICAgICAgICAg
ICAgfCAgMSArDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmggICAgIHwg
IDMgKysNCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV90aWxlLmMgICAgICAgICAgICAgfCAgMyAr
Kw0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RpbGUuaCAgICAgICAgICAgICB8ICAyICsNCj4g
IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV90aWxlX3N5c2ZzLmMgICAgICAgfCA1OSArKysrKysrKysr
KysrKysrKysrKysrKysNCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV90aWxlX3N5c2ZzLmggICAg
ICAgfCAxOSArKysrKysrKw0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RpbGVfc3lzZnNfdHlw
ZXMuaCB8IDI3ICsrKysrKysrKysrDQo+ICA3IGZpbGVzIGNoYW5nZWQsIDExNCBpbnNlcnRpb25z
KCspDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RpbGVfc3lz
ZnMuYw0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV90aWxlX3N5
c2ZzLmgNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0veGUveGVfdGlsZV9z
eXNmc190eXBlcy5oDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL01ha2Vm
aWxlIGIvZHJpdmVycy9ncHUvZHJtL3hlL01ha2VmaWxlDQo+IGluZGV4IDA4MWM1N2ZkODYzMi4u
ZTM2MzJiYWFlZmNlIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUvTWFrZWZpbGUN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL01ha2VmaWxlDQo+IEBAIC05OCw2ICs5OCw3IEBA
IHhlLXkgKz0geGVfYmIubyBcDQo+ICAJeGVfc3RlcC5vIFwNCj4gIAl4ZV9zeW5jLm8gXA0KPiAg
CXhlX3RpbGUubyBcDQo+ICsJeGVfdGlsZV9zeXNmcy5vIFwNCj4gIAl4ZV90cmFjZS5vIFwNCj4g
IAl4ZV90dG1fc3lzX21nci5vIFwNCj4gIAl4ZV90dG1fc3RvbGVuX21nci5vIFwNCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaA0KPiBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaA0KPiBpbmRleCAwMjI2ZDQ0YTZhZjIuLmYyZDQy
OThmYjBhMSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBl
cy5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaA0KPiBAQCAt
MTUxLDYgKzE1MSw5IEBAIHN0cnVjdCB4ZV90aWxlIHsNCj4gDQo+ICAJLyoqIEBtaWdyYXRlOiBN
aWdyYXRpb24gaGVscGVyIGZvciB2cmFtIGJsaXRzIGFuZCBjbGVhcmluZyAqLw0KPiAgCXN0cnVj
dCB4ZV9taWdyYXRlICptaWdyYXRlOw0KPiArDQo+ICsJLyoqIEBzeXNmczogc3lzZnMnIGtvYmog
dXNlZCBieSB4ZV90aWxlX3N5c2ZzICovDQo+ICsJc3RydWN0IGtvYmplY3QgKnN5c2ZzOw0KPiAg
fTsNCj4gDQo+ICAvKioNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90aWxl
LmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdGlsZS5jDQo+IGluZGV4IDY0MTRhYTgxMDM1NS4u
YWM3MDQ4NmQwOWMzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdGlsZS5j
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90aWxlLmMNCj4gQEAgLTEwLDYgKzEwLDcg
QEANCj4gICNpbmNsdWRlICJ4ZV9taWdyYXRlLmgiDQo+ICAjaW5jbHVkZSAieGVfc2EuaCINCj4g
ICNpbmNsdWRlICJ4ZV90aWxlLmgiDQo+ICsjaW5jbHVkZSAieGVfdGlsZV9zeXNmcy5oIg0KPiAg
I2luY2x1ZGUgInhlX3R0bV92cmFtX21nci5oIg0KPiANCj4gIC8qKg0KPiBAQCAtMTQyLDYgKzE0
Myw4IEBAIGludCB4ZV90aWxlX2luaXRfbm9hbGxvYyhzdHJ1Y3QgeGVfdGlsZSAqdGlsZSkNCj4g
IAlpZiAoSVNfRVJSKHRpbGUtPm1lbS5rZXJuZWxfYmJfcG9vbCkpDQo+ICAJCWVyciA9IFBUUl9F
UlIodGlsZS0+bWVtLmtlcm5lbF9iYl9wb29sKTsNCj4gDQo+ICsJeGVfdGlsZV9zeXNmc19pbml0
KHRpbGUpOw0KPiArDQo+ICBlcnJfbWVtX2FjY2VzczoNCj4gIAl4ZV9kZXZpY2VfbWVtX2FjY2Vz
c19wdXQodGlsZV90b194ZSh0aWxlKSk7DQo+ICAJcmV0dXJuIGVycjsNCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90aWxlLmggYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdGls
ZS5oDQo+IGluZGV4IDMzYmY0MTI5MjE5NS4uNzgyYzQ3ZjhiZDQ1IDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfdGlsZS5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV90aWxlLmgNCj4gQEAgLTYsNiArNiw4IEBADQo+ICAjaWZuZGVmIF9YRV9USUxFX0hfDQo+ICAj
ZGVmaW5lIF9YRV9USUxFX0hfDQo+IA0KPiArI2luY2x1ZGUgInhlX2RldmljZV90eXBlcy5oIg0K
PiArDQo+ICBzdHJ1Y3QgeGVfdGlsZTsNCj4gDQo+ICBpbnQgeGVfdGlsZV9hbGxvYyhzdHJ1Y3Qg
eGVfdGlsZSAqdGlsZSk7IGRpZmYgLS1naXQNCj4gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdGls
ZV9zeXNmcy5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RpbGVfc3lzZnMuYw0KPiBuZXcgZmls
ZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLjM4NmM2YWNjZDRkZA0KPiAtLS0g
L2Rldi9udWxsDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90aWxlX3N5c2ZzLmMNCj4g
QEAgLTAsMCArMSw1OSBAQA0KPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVA0KPiAr
LyoNCj4gKyAqIENvcHlyaWdodCDCqSAyMDIzIEludGVsIENvcnBvcmF0aW9uDQo+ICsgKi8NCj4g
Kw0KPiArI2luY2x1ZGUgPGxpbnV4L2tvYmplY3QuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9zeXNm
cy5oPg0KPiArI2luY2x1ZGUgPGRybS9kcm1fbWFuYWdlZC5oPg0KPiArDQo+ICsjaW5jbHVkZSAi
eGVfdGlsZS5oIg0KPiArI2luY2x1ZGUgInhlX3RpbGVfc3lzZnMuaCINCj4gKw0KPiArc3RhdGlj
IHZvaWQgeGVfdGlsZV9zeXNmc19rb2JqX3JlbGVhc2Uoc3RydWN0IGtvYmplY3QgKmtvYmopIHsN
Cj4gKwlrZnJlZShrb2JqKTsNCj4gK30NCj4gKw0KPiArc3RhdGljIHN0cnVjdCBrb2JqX3R5cGUg
eGVfdGlsZV9zeXNmc19rb2JqX3R5cGUgPSB7DQo+ICsJLnJlbGVhc2UgPSB4ZV90aWxlX3N5c2Zz
X2tvYmpfcmVsZWFzZSwNCj4gKwkuc3lzZnNfb3BzID0gJmtvYmpfc3lzZnNfb3BzLA0KPiArfTsN
Cj4gKw0KPiArc3RhdGljIHZvaWQgdGlsZV9zeXNmc19maW5pKHN0cnVjdCBkcm1fZGV2aWNlICpk
cm0sIHZvaWQgKmFyZykgew0KPiArCXN0cnVjdCB4ZV90aWxlICp0aWxlID0gYXJnOw0KPiArDQo+
ICsJa29iamVjdF9wdXQodGlsZS0+c3lzZnMpOw0KPiArfQ0KPiArDQo+ICt2b2lkIHhlX3RpbGVf
c3lzZnNfaW5pdChzdHJ1Y3QgeGVfdGlsZSAqdGlsZSkgew0KPiArCXN0cnVjdCB4ZV9kZXZpY2Ug
KnhlID0gdGlsZV90b194ZSh0aWxlKTsNCj4gKwlzdHJ1Y3QgZGV2aWNlICpkZXYgPSB4ZS0+ZHJt
LmRldjsNCj4gKwlzdHJ1Y3Qga29ial90aWxlICprdDsNCj4gKwlpbnQgZXJyOw0KPiArDQo+ICsJ
a3QgPSBremFsbG9jKHNpemVvZigqa3QpLCBHRlBfS0VSTkVMKTsNCj4gKwlpZiAoIWt0KQ0KPiAr
CQlyZXR1cm47DQo+ICsNCj4gKwlrb2JqZWN0X2luaXQoJmt0LT5iYXNlLCAmeGVfdGlsZV9zeXNm
c19rb2JqX3R5cGUpOw0Ka29iamVjdF9pbml0IGV4cGVjdHMga29ial90eXBlIHRvIGJlIGNvbnN0
IHBsZWFzZSBtYWtlIHhlX3RpbGVfc3lzZnNfa29ial90eXBlIGNvbnN0LiANCg0KQlINCkhpbWFs
IA0KPiArCWt0LT50aWxlID0gdGlsZTsNCj4gKw0KPiArCWVyciA9IGtvYmplY3RfYWRkKCZrdC0+
YmFzZSwgJmRldi0+a29iaiwgInRpbGUlZCIsIHRpbGUtPmlkKTsNCj4gKwlpZiAoZXJyKSB7DQo+
ICsJCWtvYmplY3RfcHV0KCZrdC0+YmFzZSk7DQo+ICsJCWRybV93YXJuKCZ4ZS0+ZHJtLCAiZmFp
bGVkIHRvIHJlZ2lzdGVyIFRJTEUgc3lzZnMgZGlyZWN0b3J5LA0KPiBlcnI6ICVkXG4iLCBlcnIp
Ow0KPiArCQlyZXR1cm47DQo+ICsJfQ0KPiArDQo+ICsJdGlsZS0+c3lzZnMgPSAma3QtPmJhc2U7
DQo+ICsNCj4gKwllcnIgPSBkcm1tX2FkZF9hY3Rpb25fb3JfcmVzZXQoJnhlLT5kcm0sIHRpbGVf
c3lzZnNfZmluaSwgdGlsZSk7DQo+ICsJaWYgKGVycikgew0KPiArCQlkcm1fd2FybigmeGUtPmRy
bSwgIiVzOiBkcm1tX2FkZF9hY3Rpb25fb3JfcmVzZXQNCj4gZmFpbGVkLCBlcnI6ICVkXG4iLA0K
PiArCQkJIF9fZnVuY19fLCBlcnIpOw0KPiArCQlyZXR1cm47DQo+ICsJfQ0KPiArfQ0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RpbGVfc3lzZnMuaA0KPiBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV90aWxlX3N5c2ZzLmgNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5k
ZXggMDAwMDAwMDAwMDAwLi5lNGYwNjUwMzllYmENCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfdGlsZV9zeXNmcy5oDQo+IEBAIC0wLDAgKzEsMTkgQEANCj4g
Ky8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBNSVQgKi8NCj4gKy8qDQo+ICsgKiBDb3B5cmln
aHQgwqkgMjAyMyBJbnRlbCBDb3Jwb3JhdGlvbg0KPiArICovDQo+ICsNCj4gKyNpZm5kZWYgX1hF
X1RJTEVfU1lTRlNfSF8NCj4gKyNkZWZpbmUgX1hFX1RJTEVfU1lTRlNfSF8NCj4gKw0KPiArI2lu
Y2x1ZGUgInhlX3RpbGVfc3lzZnNfdHlwZXMuaCINCj4gKw0KPiArdm9pZCB4ZV90aWxlX3N5c2Zz
X2luaXQoc3RydWN0IHhlX3RpbGUgKnRpbGUpOw0KPiArDQo+ICtzdGF0aWMgaW5saW5lIHN0cnVj
dCB4ZV90aWxlICoNCj4gK2tvYmpfdG9fdGlsZShzdHJ1Y3Qga29iamVjdCAqa29iaikNCj4gK3sN
Cj4gKwlyZXR1cm4gY29udGFpbmVyX29mKGtvYmosIHN0cnVjdCBrb2JqX3RpbGUsIGJhc2UpLT50
aWxlOyB9DQo+ICsNCj4gKyNlbmRpZiAvKiBfWEVfVElMRV9TWVNGU19IXyAqLw0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RpbGVfc3lzZnNfdHlwZXMuaA0KPiBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV90aWxlX3N5c2ZzX3R5cGVzLmgNCj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwLi43NTkwNmJhMTFhOWUNCj4gLS0tIC9kZXYvbnVsbA0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdGlsZV9zeXNmc190eXBlcy5oDQo+IEBAIC0w
LDAgKzEsMjcgQEANCj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBNSVQgKi8NCj4gKy8q
DQo+ICsgKiBDb3B5cmlnaHQgwqkgMjAyMyBJbnRlbCBDb3Jwb3JhdGlvbg0KPiArICovDQo+ICsN
Cj4gKyNpZm5kZWYgX1hFX1RJTEVfU1lTRlNfVFlQRVNfSF8NCj4gKyNkZWZpbmUgX1hFX1RJTEVf
U1lTRlNfVFlQRVNfSF8NCj4gKw0KPiArI2luY2x1ZGUgPGxpbnV4L2tvYmplY3QuaD4NCj4gKw0K
PiArc3RydWN0IHhlX3RpbGU7DQo+ICsNCj4gKy8qKg0KPiArICogc3RydWN0IGtvYmpfdGlsZSAt
IEEgdGlsZSdzIGtvYmplY3Qgc3RydWN0IHRoYXQgY29ubmVjdHMgdGhlIGtvYmplY3QNCj4gKyAq
IGFuZCB0aGUgVElMRQ0KPiArICoNCj4gKyAqIFdoZW4gZGVhbGluZyB3aXRoIG11bHRpcGxlIFRJ
TEVzLCB0aGlzIHN0cnVjdCBoZWxwcyB0byB1bmRlcnN0YW5kDQo+ICt3aGljaA0KPiArICogVElM
RSBuZWVkcyB0byBiZSBhZGRyZXNzZWQgb24gYSBnaXZlbiBzeXNmcyBjYWxsLg0KPiArICovDQo+
ICtzdHJ1Y3Qga29ial90aWxlIHsNCj4gKwkvKiogQGJhc2U6IFRoZSBhY3R1YWwga29iamVjdCAq
Lw0KPiArCXN0cnVjdCBrb2JqZWN0IGJhc2U7DQo+ICsJLyoqIEB0aWxlOiBBIHBvaW50ZXIgdG8g
dGhlIHRpbGUgaXRzZWxmICovDQo+ICsJc3RydWN0IHhlX3RpbGUgKnRpbGU7DQo+ICt9Ow0KPiAr
DQo+ICsjZW5kaWYJLyogX1hFX1RJTEVfU1lTRlNfVFlQRVNfSF8gKi8NCj4gLS0NCj4gMi4yNS4x
DQoNCg==
