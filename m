Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E24BC4332F
	for <intel-xe@archiver.kernel.org>; Mon, 30 Oct 2023 06:50:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E31210E221;
	Mon, 30 Oct 2023 06:50:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E873D10E21C
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Oct 2023 06:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698648631; x=1730184631;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=3SlTnBeJ3rmYMYLKn2adJQcGnVm/evoA04Qfr5Ms1/8=;
 b=D3mQmIgFjAQTsV5uIGFB0sKQcrDZjXmtgODSKDQEYMOYzl9rnFlPuLl5
 DuMbFISvkkd4mRr/Oxo9/SwW1k2q9BXYAWz1u348QPJkzmZB0BWpNE9pe
 A//Mif4p2z2x8vq4CAEuWSuRfus9Pw7chwEp6Tg3ihdhv0BeMwzz43b5W
 PEgTo0qpgAyC2ev9hb8iK5NgSoPyLWi/Qf6VPpX6Drz0krxrQ3VYdkmze
 YMyDd4RDmUUnB66twd2jvoALA3fPD7My2sHSZDP4H+sNmvOmPwbHEV/On
 Pc8VkCOgQhOfmStLWsBlbbPFX7vfCjIkUApwRlOqRksgoV27WNqQaoAaw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="9557723"
X-IronPort-AV: E=Sophos;i="6.03,262,1694761200"; 
   d="scan'208";a="9557723"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2023 23:50:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="830587466"
X-IronPort-AV: E=Sophos;i="6.03,262,1694761200"; d="scan'208";a="830587466"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Oct 2023 23:50:28 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 29 Oct 2023 23:50:28 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 29 Oct 2023 23:50:28 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 29 Oct 2023 23:50:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DEHJh5m8xBdPT/dqz6GlVEpx2wuqF1BxZMEc0gJh+7Hd9mWqlk5iPCfFMOplu7LfXyfcAhlpeWYUy3QiY3scFFp3rQH5hU/H83GAnjhGFdnbRgen557NElD0t4kGLWjFTBhUzwlsqMbxlD0OKS0DHkzJvqacSCfUDIlLOveYgVEdV8Aww4Q9Srd30EUmYkoxcSYar6urQ60ayPcKDhYNnJS5MY/GnICvLhORSmauN1G3vvleIY3Q4WVsMoA6uXV+yND86esDvttD8VstDw8KL2wFmaNBKgDOBQ+EnHANGpAlddlXUdtGGmiJDWuXEIZSm/OYO8fOgnq9FoieawMd1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3SlTnBeJ3rmYMYLKn2adJQcGnVm/evoA04Qfr5Ms1/8=;
 b=dyC8FFBVyc0yd9Sb5NXfbmPkNKJUkb81XL4i0ULSOaRQpKSGuYOFCnimNeddNe1iBFKiK1OGsqyGLfm+pctbxECm+vROVgiBoB4NZy1LteCBF5JoYTTel62yf0ZCmnUfNlUPsu7cZwt3wG09FD/KnpHdmiX+fQDA78pthuuZUyjlVTLCCDwyvq4KUggDRKKgLL2z2PDjfM+b/GdD0Q+HCwroc6SWeY4sBuU8/s0zU7z7WM8wsfoGCjIWNRU+wq1uKTozS/0NznHg/9xLhO4VaUS0RHgy7MRiCj8ztqiQSbdztFmXtFoCFqV9nhhOB9vmwuM4XJqz7WZfOUeJXu2DQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 DS7PR11MB7931.namprd11.prod.outlook.com (2603:10b6:8:e5::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.26; Mon, 30 Oct 2023 06:50:20 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892%3]) with mapi id 15.20.6933.024; Mon, 30 Oct 2023
 06:50:20 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nikula, Jani" <jani.nikula@intel.com>
Thread-Topic: [PATCH 00/31] Backport display parameter patches
Thread-Index: AQHaCKuL9lUBwgYasUOQJJJlFF2wG7BdUykAgASWMYA=
Date: Mon, 30 Oct 2023 06:50:20 +0000
Message-ID: <aad7c29c37fe5aa0e484f4700868d50ddb2be8dc.camel@intel.com>
References: <20231027075918.2206862-1-jouni.hogander@intel.com>
 <871qdg78pb.fsf@intel.com>
In-Reply-To: <871qdg78pb.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|DS7PR11MB7931:EE_
x-ms-office365-filtering-correlation-id: f0da3540-40bc-4054-b1e4-08dbd9147be9
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2n4rn6VhU7Ll/n5QoZpE0aF+NdCyU2NzkBUajs6BcLQoEIn93AIenlpQ+P0X9Ka4Uz9br9uEbsRmaJ9tYG+OwMQKl4048B3zSjRao0YQvCjRLRQvCtrBUXAtrJ0MQU5S8sX/EgzWdZ/fs8MJSbgCNwbU1N4Obwns/LdHef+0fN+MvWe7yyjs3q47ZTlHNaYxmvF6nUKcm4CIsEuRh2cgj1CxUsyOLLW0LJKhf/J+QWXetR6R0oeDnkjSbqYc0P98prgjEIOtRespiNWrrxZddkgstu6aEGnaGEdKX7Pr3k4aIRdDU04wjJQDRpi1FmPG9kUJZ45ddNnQ+UANL3QQgTrNH6zr6JtFpsjhtjqq6Y5iwee8mX5wVZWljs5QCkEILV+e60enFv0IcCJwjkD4ateOrUgpMPL10gkhsYPMJaUZAK7qTfbJFEHMQ4uoYD9muHMQF4AxSzQdbxaSOmWegFMKNkUPgUROar07iFYHitQMqfq4LqGD02oJuoo+goXbOCstjdrw27aUsYUHYtcHI45dk3rGACqr2pLeuD1AlcBI98MuXxn+57A2JbMas13birc2IJu+bT1D0tcM3FpD8T+Rcqeg/9oCj65G1s8P9idV/nwM42PtagShL5mbCjlq
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(136003)(39860400002)(366004)(376002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(6512007)(26005)(2616005)(478600001)(4326008)(6506007)(71200400001)(2906002)(66574015)(6486002)(83380400001)(91956017)(66556008)(110136005)(66946007)(76116006)(5660300002)(41300700001)(66476007)(8936002)(66446008)(8676002)(6636002)(54906003)(64756008)(316002)(38070700009)(38100700002)(82960400001)(122000001)(86362001)(36756003)(4001150100001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RFNSanNlTmd3QlFpTEhrRkNsOGdLQnRiOUprMERxYmh5WTNINXduZzVsRmdh?=
 =?utf-8?B?eDIxRm5tVjEwRjhWQVpBb2hPZm01Q2hneTlzVTV3eVZkMmlEYks0clduSUpC?=
 =?utf-8?B?KzY2dVV5R0gyZUZjOHc0YnhxdVY2bGpQZTBFWlZicHNPNGpLeWNoN004R0pa?=
 =?utf-8?B?dHhoS2daT25MajdaU3IycWcxVWR6cXZEdTlWRDc5N1N6SGlKSGZnVGg4WmJB?=
 =?utf-8?B?THY2MnRYUlROa2VCQ2MxSCs5U3F0bFo4bjBvcTZ0SWVtSlhkYW80S2FnRlFV?=
 =?utf-8?B?STNWMjVSS1NzMnhPQzlvVWpaZEpDRk5RNFVVblBtR0RVY1N3c0dkdk9adnp2?=
 =?utf-8?B?ZTJaczRITHVVTVZiT0Fodk9iNFJISEtEK084TW01Y2x3cGZIcmF2bzVKMFpt?=
 =?utf-8?B?Wmh4UTRYaXg5bnBON1B1OXZLWTIzcnZQSEQxdlp6RDlpMXh1eCs0NUlSSVpY?=
 =?utf-8?B?SEpxSi9sN2YrYzZiLy90b3JTV3YvZUpIRlo5VzhRbGZkNW9kOXlIMmhMUHVj?=
 =?utf-8?B?bHNNRjRKbGxoTjZwajBtNG9lVzlGeGVDZXRGTmlJTVB0ZVVTb3VmbzhCZ0s1?=
 =?utf-8?B?eGp3TlVjRDBnd3cvK3h2Q2hNZzc0Q05Wb2JDUDUxQmZnUlZiWUdzZXBJZWF0?=
 =?utf-8?B?OXZTRGVPL1h6UVFEdHpPbUQvc3ZTcnJsWDdxSUJZcVhtZG5kMDd3OHdQTThF?=
 =?utf-8?B?S3J0SVVEbld0T214RTRmeXdNbTFnYUFYcE1KRE5oZUZJQ2JBRUtpSDFaaUZC?=
 =?utf-8?B?cVFYZ3ZLNjF3U2IzVTBxaWkxK29QYmVwZEhUTXozcjZCcDZtMkdFbkZBT3hx?=
 =?utf-8?B?ZnF4TjNlTERTMEhnZW5OTmttRGo3R0hQSUNHb1Q0SVg3SlM3eXMybzUvRE5j?=
 =?utf-8?B?anMwdnBYUWlVd0d3cEhsMjA4OHc3QWVvNDNneWh2bUswNFRxdWtZRER3amNw?=
 =?utf-8?B?S083aGtNamFsVTJQNFU3SUpZVm8vSTJEMzNWWERBUGt0Y1I2KzBuMzBWMERl?=
 =?utf-8?B?bzg5cG1rc25EOE5xVlJ4UWJmVXREQkxUeW1yb25JejlVRWJhbStNb1d6OEhx?=
 =?utf-8?B?cmtSR2lFblQrTTF5ckNZczhTL1dDQU9aKzdOSVQ3TnMrekgrTFV3MUhia3Zv?=
 =?utf-8?B?eTBmRmhQRmpHYnE1WFdubXpFai9sVy9udC8xTWgvTTlOcENMek5DbUJkSUJS?=
 =?utf-8?B?M0xMZkJHalQzRGM5aFM2QVRPdUZwRENlek11aThBZ0VhQy9KYVM2Y1YyWGl0?=
 =?utf-8?B?cmMrWk0wQ2s0K2hOU0FGWnUyMWFSeDRKN2hPeUpVeklUc3BiQm5DK0dTd05N?=
 =?utf-8?B?bkdrbUV3TjlZL0ZGUVVpR2l5WWJmQUlsRnJKaCtVVEV6Ulk2UzlCbjVmWnVt?=
 =?utf-8?B?K3NHT2NTemwvZWtXeklWbVEzWFU3SkV3S0o3Z2FnWndMc3V6YWdqU1FwU0Zm?=
 =?utf-8?B?T0NTWWU3ak5VQ2V5VW5mZzRYUDBvSTR2SkJNQnZuWHhTb0FhT2xqaWRKaWc4?=
 =?utf-8?B?UUxDUWNnMGJXYUdPZnNXTGNURlpiUzhjeSt1Y0VrVXB0YkNzL2ZHQ25IbjN2?=
 =?utf-8?B?U0pQUDRvcHNyOVhwaXcrZmtPSWEzVkprR2h5c1VOOExLRXR6ckIwNktqblpa?=
 =?utf-8?B?cmlVdDB4NDlzSEIvcHhHbXloZGJ0MVQ2ODdINngycUh0OWxFR3pySG5tNk5M?=
 =?utf-8?B?WWdLbzZnK0pack96TGQrVmZMeThZRDdoQXgrdmhZUG9RcHo2UU92TlZCYlhZ?=
 =?utf-8?B?dEJDcStEeHVmaHN1Z1kzbXYvU3VDMDMxdERGTktYQmdrT3p6QVdVekI1dGc2?=
 =?utf-8?B?M0NaSzBseGkwbXdZVW1neU4yWmpMbTZwaVRVNnB0cjU3dUhSQm9CWGtXd1JW?=
 =?utf-8?B?M2N3elFTMzc4bk9DSTNWc3FJZWwzdWlJcGR6UEJ3c1ZjMmovbnFmTmRTbFFC?=
 =?utf-8?B?UWVPUDV6Y2k3KzB4dTdiR2xaVzJER1NLT2NXdUIwejBBUW9RdGtqY1FQcjF4?=
 =?utf-8?B?dGNyVExvcFBwZUVvQTJTNGxnQ1RMalRRNHZzTTFDa2RuZTdONmtyckx2Q3c0?=
 =?utf-8?B?RnZqZkpsa2dRdkxFK2tZNUFHZXBhakxBdE9VZUdIelMrUWVLNkVUK2pDK1NV?=
 =?utf-8?B?YnhaWlQwVmc2SFZPTWRMenlBenFZQnowVFcxZXY5MnBZWVVwbjVLTkJ4OUpE?=
 =?utf-8?B?bFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <869CEDBD84D2FC4AACE7019A6BBF12DC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0da3540-40bc-4054-b1e4-08dbd9147be9
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2023 06:50:20.4246 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dD4uI3qStDwPsf86AvCYLLDXy6zNOkWawk5fhfG+RAS6hnu6P/3/4i3GM0l4waomNg7JUTkEPORSThhlwRa97rYgEHoJOkEvzBzfQfvx3MQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7931
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 00/31] Backport display parameter patches
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
Cc: "Coelho, Luciano" <luciano.coelho@intel.com>, "Murthy,
 Arun R" <arun.r.murthy@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIzLTEwLTI3IGF0IDExOjQ3ICswMzAwLCBKYW5pIE5pa3VsYSB3cm90ZToNCj4g
T24gRnJpLCAyNyBPY3QgMjAyMywgSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRl
bC5jb20+IHdyb3RlOg0KPiA+IFRoaXMgcGF0Y2ggc2V0IGlzIGJhY2twb3J0aW5nIGRpc3BsYXkg
cGFyYW1ldGVyIHBhdGNoZXMgZnJvbQ0KPiA+IGludGVsLWRybS1uZXh0LiBBbHNvIHNvbWUgZGVw
ZW5kZW5jaWVzIGFyZSBiYWNrcG9ydGVkIHRvIGF2b2lkDQo+ID4gY29uZmxpY3RzLiBUaGlzIG1h
a2VzIGFsbCBkaXNwbGF5IHBhcmFtZXRlcnMgYXZhaWxhYmxlIGZvciBYZQ0KPiA+IGRyaXZlcg0K
PiA+IGFzIHdlbGwuDQo+ID4gDQo+ID4gZHVtbXkgZGlzcGxheSBwYXJhbWV0ZXJzIGZyb20geGVf
ZGV2aWNlIHN0cnVjdCBhcmUgcmVtb3ZlZCBhcyB0aGV5DQo+ID4gYXJlDQo+ID4gdW5uZWNlc3Nh
cnkuIEFsc28gb25lIEZJWE1FIHBhdGNoIGNhbiBiZSBub3cgcmV2ZXJ0ZWQ6DQo+ID4gDQo+ID4g
IkZJWE1FOiBkcm0vaTkxNTogeGUgZG9lc24ndCBoYXZlDQo+ID4gaTkxNV9tb2RwYXJhbXMudmVy
Ym9zZV9zdGF0ZV9jaGVja3MiDQo+IA0KPiBBY2tlZC1ieTogSmFuaSBOaWt1bGEgPGphbmkubmlr
dWxhQGludGVsLmNvbT4NCg0KVGhhbmsgeW91IEphbmkuIFRoZXNlIGFyZSBub3cgbWVyZ2VkLg0K
DQpCUiwNCg0KSm91bmkgSMO2Z2FuZGVyDQoNCj4gDQo+ID4gDQo+ID4gQ2M6IEphbmkgTmlrdWxh
IDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+DQo+ID4gQ2M6IFVtYSBTaGFua2FyIDx1bWEuc2hhbmth
ckBpbnRlbC5jb20+DQo+ID4gQ2M6IEx1Y2EgQ29lbGhvIDxsdWNpYW5vLmNvZWxob0BpbnRlbC5j
b20+DQo+ID4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5p
bnRlbC5jb20+DQo+ID4gQ2M6IEFydW4gUiBNdXJ0aHkgPGFydW4uci5tdXJ0aHlAaW50ZWwuY29t
Pg0KPiA+IA0KPiA+IEphbmkgTmlrdWxhICgzKToNCj4gPiDCoCBkcm0vaTkxNTogY29udmVydCBJ
TlRFTF9ESVNQTEFZX0VOQUJMRUQoKSBpbnRvIGEgZnVuY3Rpb24NCj4gPiDCoCBkcm0vaTkxNTog
c2VwYXJhdGUgZGlzcGxheSBydW50aW1lIGluZm8gaW5pdA0KPiA+IMKgIGRybS9pOTE1OiBzZXBh
cmF0ZSBzdWJwbGF0Zm9ybSBpbml0IGFuZCBydW50aW1lIGZlYXR1cmUgaW5pdA0KPiA+IA0KPiA+
IEpvdW5pIEjDtmdhbmRlciAoMjgpOg0KPiA+IMKgIFJldmVydCAiRklYTUU6IGRybS9pOTE1OiB4
ZSBkb2Vzbid0IGhhdmUNCj4gPiDCoMKgwqAgaTkxNV9tb2RwYXJhbXMudmVyYm9zZV9zdGF0ZV9j
aGVja3MiDQo+ID4gwqAgZHJtL2k5MTUvZGlzcGxheTogQWRkIGZyYW1ld29yayB0byBhZGQgcGFy
YW1ldGVycyBzcGVjaWZpYyB0bw0KPiA+IGRpc3BsYXkNCj4gPiDCoCBkcm0vaTkxNS9kaXNwbGF5
OiBEdW1wIGFsc28gZGlzcGxheSBwYXJhbWV0ZXJzDQo+ID4gwqAgZHJtL2k5MTUvZGlzcGxheTog
TW92ZSBlbmFibGVfZmJjIG1vZHVsZSBwYXJhbWV0ZXIgdW5kZXIgZGlzcGxheQ0KPiA+IMKgIGRy
bS9pOTE1L2Rpc3BsYXk6IE1vdmUgcHNyIHJlbGF0ZWQgbW9kdWxlIHBhcmFtZXRlcnMgdW5kZXIN
Cj4gPiBkaXNwbGF5DQo+ID4gwqAgZHJtL2k5MTUvZGlzcGxheTogTW92ZSB2YnRfZmlybXdhcmUg
bW9kdWxlIHBhcmFtZXRlciB1bmRlcg0KPiA+IGRpc3BsYXkNCj4gPiDCoCBkcm0vaTkxNS9kaXNw
bGF5OiBNb3ZlIGx2ZHNfY2hhbm5lbF9tb2RlIG1vZHVsZSBwYXJhbWV0ZXIgdW5kZXINCj4gPiDC
oMKgwqAgZGlzcGxheQ0KPiA+IMKgIGRybS9pOTE1L2Rpc3BsYXk6IE1vdmUgcGFuZWxfdXNlX3Nz
YyBtb2R1bGUgcGFyYW1ldGVyIHVuZGVyDQo+ID4gZGlzcGxheQ0KPiA+IMKgIGRybS9pOTE1L2Rp
c3BsYXk6IE1vdmUgdmJ0X3Nkdm9fcGFuZWxfdHlwZSBtb2R1bGUgcGFyYW1ldGVyIHVuZGVyDQo+
ID4gwqDCoMKgIGRpc3BsYXkNCj4gPiDCoCBkcm0vaTkxNS9kaXNwbGF5OiBNb3ZlIGVuYWJsZV9k
YyBtb2R1bGUgcGFyYW1ldGVyIHVuZGVyIGRpc3BsYXkNCj4gPiDCoCBkcm0vaTkxNS9kaXNwbGF5
OiBNb3ZlIGVuYWJsZV9kcHQgbW9kdWxlIHBhcmFtZXRlciB1bmRlciBkaXNwbGF5DQo+ID4gwqAg
ZHJtL2k5MTUvZGlzcGxheTogTW92ZSBlbmFibGVfc2FndiBtb2R1bGUgcGFyYW1ldGVyIHVuZGVy
IGRpc3BsYXkNCj4gPiDCoCBkcm0vaTkxNS9kaXNwbGF5OiBNb3ZlIGRpc2FibGVfcG93ZXJfd2Vs
bCBtb2R1bGUgcGFyYW1ldGVyIHVuZGVyDQo+ID4gwqDCoMKgIGRpc3BsYXkNCj4gPiDCoCBkcm0v
aTkxNS9kaXNwbGF5OiBNb3ZlIGVuYWJsZV9pcHMgbW9kdWxlIHBhcmFtZXRlciB1bmRlciBkaXNw
bGF5DQo+ID4gwqAgZHJtL2k5MTUvZGlzcGxheTogTW92ZSBpbnZlcnRfYnJpZ2h0bmVzcyBtb2R1
bGUgcGFyYW1ldGVyIHVuZGVyDQo+ID4gwqDCoMKgIGRpc3BsYXkNCj4gPiDCoCBkcm0vaTkxNS9k
aXNwbGF5OiBNb3ZlIGVkcF92c3dpbmcgbW9kdWxlIHBhcmFtZXRlciB1bmRlciBkaXNwbGF5DQo+
ID4gwqAgZHJtL2k5MTUvZGlzcGxheTogTW92ZSBlbmFibGVfZHBjZF9iYWNrbGlnaHQgbW9kdWxl
IHBhcmFtZXRlcg0KPiA+IHVuZGVyDQo+ID4gwqDCoMKgIGRpc3BsYXkNCj4gPiDCoCBkcm0vaTkx
NS9kaXNwbGF5OiBNb3ZlIGxvYWRfZGV0ZWN0X3Rlc3QgcGFyYW1ldGVyIHVuZGVyIGRpc3BsYXkN
Cj4gPiDCoCBkcm0vaTkxNS9kaXNwbGF5OiBNb3ZlIGZvcmNlX3Jlc2V0X21vZGVzZXRfdGVzdCBw
YXJhbWV0ZXIgdW5kZXINCj4gPiDCoMKgwqAgZGlzcGxheQ0KPiA+IMKgIGRybS9pOTE1L2Rpc3Bs
YXk6IE1vdmUgZGlzYWJsZV9kaXNwbGF5IHBhcmFtZXRlciB1bmRlciBkaXNwbGF5DQo+ID4gwqAg
ZHJtL2k5MTUvZGlzcGxheTogVXNlIGRldmljZSBwYXJhbWV0ZXJzIGluc3RlYWQgb2YgbW9kdWxl
IGluDQo+ID4gwqDCoMKgIEk5MTVfU1RBVEVfV0FSTg0KPiA+IMKgIGRybS9pOTE1L2Rpc3BsYXk6
IE1vdmUgdmVyYm9zZV9zdGF0ZV9jaGVja3MgdW5kZXIgZGlzcGxheQ0KPiA+IMKgIGRybS9pOTE1
L2Rpc3BsYXk6IE1vdmUgbnVjbGVhcl9wYWdlZmxpcCB1bmRlciBkaXNwbGF5DQo+ID4gwqAgZHJt
L2k5MTUvZGlzcGxheTogTW92ZSBlbmFibGVfZHBfbXN0IHVuZGVyIGRpc3BsYXkNCj4gPiDCoCBm
aXh1cCEgZHJtL3hlL2Rpc3BsYXk6IEltcGxlbWVudCBkaXNwbGF5IHN1cHBvcnQNCj4gPiDCoCBm
aXh1cCEgZHJtL3hlL2Rpc3BsYXk6IEltcGxlbWVudCBkaXNwbGF5IHN1cHBvcnQNCj4gPiDCoCBm
aXh1cCEgZHJtL3hlL2Rpc3BsYXk6IEltcGxlbWVudCBkaXNwbGF5IHN1cHBvcnQNCj4gPiDCoCBm
aXh1cCEgZHJtL3hlL2Rpc3BsYXk6IEltcGxlbWVudCBkaXNwbGF5IHN1cHBvcnQNCj4gPiANCj4g
PiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfMKgwqAgMiArDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2hz
d19pcHMuY8KgwqDCoMKgwqDCoMKgIHzCoMKgIDQgKy0NCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaTl4eF93bS5jwqDCoMKgwqDCoMKgwqAgfMKgwqAgMiArLQ0KPiA+IMKgLi4u
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2JhY2tsaWdodC5jwqDCoMKgIHzCoMKgIDkgKy0N
Cj4gPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYmlvcy5jwqDCoMKgwqAg
fMKgwqAgNiArLQ0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jcnQu
Y8KgwqDCoMKgwqAgfMKgwqAgNiArLQ0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9kaXNwbGF5LmjCoCB8wqDCoCA4ICstDQo+ID4gwqAuLi4vZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZGlzcGxheV9jb3JlLmggfMKgwqAgMiArDQo+ID4gwqAuLi4vZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9kaXNwbGF5X2RlYnVnZnMuY8KgIHzCoMKgIDIgKw0KPiA+IMKgLi4uL2Rp
c3BsYXkvaW50ZWxfZGlzcGxheV9kZWJ1Z2ZzX3BhcmFtcy5jwqDCoMKgIHwgMTc2ICsrKysrKysr
KysrKysrDQo+ID4gwqAuLi4vZGlzcGxheS9pbnRlbF9kaXNwbGF5X2RlYnVnZnNfcGFyYW1zLmjC
oMKgwqAgfMKgIDEzICsrDQo+ID4gwqAuLi4vZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5
X2RldmljZS5jwqDCoCB8wqAgNTIgKysrKy0NCj4gPiDCoC4uLi9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2Rpc3BsYXlfZGV2aWNlLmjCoMKgIHzCoMKgIDIgKw0KPiA+IMKgLi4uL2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZGlzcGxheV9wYXJhbXMuY8KgwqAgfCAyMTcNCj4gPiArKysrKysrKysrKysr
KysrKysNCj4gPiDCoC4uLi9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfcGFyYW1zLmjC
oMKgIHzCoCA2MSArKysrKw0KPiA+IMKgLi4uL2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxh
eV9wb3dlci5jwqDCoMKgIHzCoCAxNCArLQ0KPiA+IMKgLi4uL2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZGlzcGxheV9yZXNldC5jwqDCoMKgIHzCoMKgIDIgKy0NCj4gPiDCoGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuY8KgwqDCoMKgwqDCoCB8wqDCoCA4ICstDQo+ID4gwqAu
Li4vZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9hdXhfYmFja2xpZ2h0LmMgfMKgwqAgNCArLQ0K
PiA+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9tc3QuY8KgwqAgfMKg
wqAgMiArLQ0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcHQuY8Kg
wqDCoMKgwqAgfMKgwqAgNiArLQ0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9kdm8uY8KgwqDCoMKgwqAgfMKgwqAgMiArLQ0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9mYi5jwqDCoMKgwqDCoMKgIHzCoMKgIDIgKy0NCj4gPiDCoGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZmJjLmPCoMKgwqDCoMKgIHzCoCAxMCArLQ0K
PiA+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZG1pLmPCoMKgwqDCoCB8
wqDCoCAyICstDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hvdHBs
dWcuY8KgIHzCoMKgIDIgKy0NCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfbHZkcy5jwqDCoMKgwqAgfMKgwqAgNCArLQ0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9vcHJlZ2lvbi5jIHzCoMKgIDIgKy0NCj4gPiDCoGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfcGFuZWwuY8KgwqDCoCB8wqDCoCA2ICstDQo+ID4gwqBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jwqDCoMKgwqDCoCB8wqAgMTQgKy0N
Cj4gPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfc2R2by5jwqDCoMKgwqAg
fMKgwqAgMiArLQ0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF90di5j
wqDCoMKgwqDCoMKgIHzCoMKgIDIgKy0NCj4gPiDCoC4uLi9kcm0vaTkxNS9kaXNwbGF5L3NrbF91
bml2ZXJzYWxfcGxhbmUuY8KgwqDCoCB8wqDCoCAyICstDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L3NrbF93YXRlcm1hcmsuY8KgIHzCoMKgIDUgKy0NCj4gPiDCoGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2k5MTVfZGVidWdmcy5jwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMyAr
DQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2RyaXZlci5jwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8wqDCoCAzICsNCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJ2LmjC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDYgLQ0KPiA+IMKgZHJpdmVycy9ncHUv
ZHJtL2k5MTUvaTkxNV9ncHVfZXJyb3IuY8KgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMyArDQo+ID4g
wqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2dwdV9lcnJvci5owqDCoMKgwqDCoMKgwqDCoCB8
wqDCoCAyICsNCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcGFyYW1zLmPCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHzCoCA4OSAtLS0tLS0tDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9pOTE1X3BhcmFtcy5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMjIgLS0NCj4gPiDCoGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2RldmljZV9pbmZvLmPCoMKgwqDCoMKgIHzCoCAyMiAt
LQ0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHzCoMKgIDIgKw0KPiA+IMKgLi4uL2dwdS9kcm0veGUvY29tcGF0LWk5
MTUtaGVhZGVycy9pOTE1X2Rydi5oIHzCoMKgIDIgKw0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2RldmljZV90eXBlcy5owqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyMiAtLQ0KPiA+IMKgZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2Rpc3BsYXkuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fMKgIDE1ICstDQo+ID4gwqA0NiBmaWxlcyBjaGFuZ2VkLCA2MDUgaW5zZXJ0aW9ucygrKSwgMjM5
IGRlbGV0aW9ucygtKQ0KPiA+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X2RlYnVnZnNfcGFyYW1zLmMNCj4gPiDCoGNy
ZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
ZGlzcGxheV9kZWJ1Z2ZzX3BhcmFtcy5oDQo+ID4gwqBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gPiBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfcGFyYW1zLmMNCj4gPiDC
oGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZGlzcGxheV9wYXJhbXMuaA0KPiANCg0K
