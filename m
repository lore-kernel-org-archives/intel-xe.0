Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC957E7E650
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 16:46:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86CC610E40B;
	Tue, 26 Sep 2023 16:46:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C624410E40B
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 16:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695746803; x=1727282803;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=L1ZfI+shuF2vyKS2QHBOINXXInwScccY1RCHyjL0Wbg=;
 b=dlZMPszh9yFsdjRnfoFhIzm0UJ0HScurCZy/DqDUecnDJ1ZqQYf/k5Ar
 zv5LJ4EnKq+avbjsQ0+llWtg5hHQO+z3B1amov7tkIH8nGz9ulkP3H1zz
 aNSWT87eT57WQz8vZkrEdDaLrGzjEzTaZbyjg4xPFgAWxvpQCtaFimUCV
 7ykM6eLa+UTbbZUT66MiEesqWAme+/HpBjHzhTXpxX+ruqqO5iJfc2u6B
 GgzwhhCpJ2Ahc6aKxjJBApoPvt1dB5mHGzF0Yrb8+iJi0hFFl5euoi171
 sPThHJWQkGgAfwswFIstW6O3mzP5GXTS4KiAWJjVQb5UzX75sMD247EYI Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="412529052"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="412529052"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 09:46:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="698535400"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="698535400"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 09:46:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 09:46:39 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 09:46:39 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 09:46:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZyAQdFXVcNeEva13XyqeH/BVJDKZ08y8yuNvfG3XpSkyxuhawh6PoO/c9TA7+kh+B4D7FjEl+xgSbyLCHcBlO7VpzaCvWln9ms622G+pycCNxdGaeoS3JG0G+hQEp7fuQ5c7/rvlDctpZudDa9P7Q0KRD8SDQgpkf+QCQkCSZ7yEzgELHCd9IWhTiJ0dMTGttrscAqR88rrRm7uhtEqGBkPIwizF9RxdvlhUA5G2yuAfIFgIL1RrlETB9o33yyrn/EBdtjBxN4EOlAv7mt4MT164HYmz8DdHfmCLc3qmkLWzu6zI4pm7tf+EJsuRRdsXbT3VaxsbtK96jAn/v+anBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L1ZfI+shuF2vyKS2QHBOINXXInwScccY1RCHyjL0Wbg=;
 b=h1abCkLUkIz+Yt5ev6p0TBhlOKkNALC7TT4Bqso2wzOEZPNw6jECihTdw+or5hzRVGczDM85u9MHyR1wULIilnUmCkSQXadFdGZLmXo55KLSu7L6vAlo0EUBwLmD/VWvQwbUqsfX/M2h2sGSbyQOyCggluURRY6uDyZSStGhRfd8rNrYiS044vO4VMsAg/D9+JVliWjQ+k1jU7Cs4ZU8bXXYRv7ykrV30Ersg5sSZW9qFG7QNwJirrRsXaXmlsXEksWt68hMChZMVv8E/KwWqXUKlM83aylNIvVg6Nx4ajoyBLA1dD4JawgkX9afBJN6kpnVvNlqnURlquaARBOPlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by DM4PR11MB5439.namprd11.prod.outlook.com (2603:10b6:5:39b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 16:46:37 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47%7]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 16:46:37 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>
Thread-Topic: [Intel-xe] [PATCH v3 27/30] drm/xe: Extend uAPI to query HuC
 micro-controler firmware version
Thread-Index: AQHZ8HoGcN+923X40UuKuEW2Quipi7AtUQ0A
Date: Tue, 26 Sep 2023 16:46:36 +0000
Message-ID: <f749c938c60f7b6a9cfda34846c457aafe400150.camel@intel.com>
References: <20230926125540.7-1-francois.dugast@intel.com>
 <20230926125540.7-28-francois.dugast@intel.com>
In-Reply-To: <20230926125540.7-28-francois.dugast@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|DM4PR11MB5439:EE_
x-ms-office365-filtering-correlation-id: 37519b78-d4ff-4e3a-992e-08dbbeb02660
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BaauC4FJ5oD73XXvD6cLvZFPKaQH759C+LtqaqriX2ru0jor1Z3E0iHzwOQVAypF/dT+TRZWnQg0OZf6n/9BAVmLRyQ7cBw2Eis8N68aMs21WZN9hCfONLyFoEYHdCnPD09I3DJc/9vQRwYmKK6hPp4cDQT9QIFVPSrwHWWlknHRfYDE8IdvSy76rrxUfFANlflHPdZUYqFGtL4rEvriv2qSNHVu5p9A4TBnONUR6VpaP6qnKXY4c+sA28gfP6akDClreVAWgDyfp6gSB1o9UBibF+wi0l4Of5ynVoqgmaB0+5Bvn2wOALpkXLqRn1ftwBjCgQKK4MNTEESVbHbLZC1a0apVvW0gn6cVYT+Uur8RdR/3ydTeuSm66tLv4w9NqfpTASLrj7nX83JLdSo6v3NFMnrXnyQqGqGkomFzboGcP8Q6WCj9PubCX30DOQfFQhN5L02nE6G05kshklhf3fxJM0EomT0b9CDpuQptyABk7RM3aU+Fagvq3IdxxWxt06OjrgoiSltnSHCtQRt08QwI2LAglVhrSP2UBTI4qjpImKHqMTW3TuHm75TMoHqyRTbGDHkMfLJSXLUhqda0ZXs7WndeJNqUgcZrs9RCPWWh7TOjUDNyM/h8d7X8iXgl
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(366004)(136003)(346002)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(2906002)(5660300002)(76116006)(316002)(66446008)(66556008)(6636002)(66476007)(66946007)(110136005)(64756008)(41300700001)(91956017)(8676002)(8936002)(83380400001)(71200400001)(2616005)(26005)(36756003)(86362001)(38070700005)(38100700002)(82960400001)(122000001)(478600001)(6512007)(6506007)(6486002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YzNVQ1B5OCsvcVlSS012SFY5VzBEYjc3ZldlajVnanhYU3U5WmsxYS9JVHJZ?=
 =?utf-8?B?M3JyLzQ1YVlneHdqVUk3THBaRnJnSVBGRTZoRU5HWTlKRGY3NjR4WXM4YTVG?=
 =?utf-8?B?eFdKRnBQMks4R1F6OVVQMlUzSE1jVzFzNEtySjRnYXdaQXhwSU9YeURiams3?=
 =?utf-8?B?Unp4TGVCeE80WWFlLyt6NUJQdGhLN29mWXIwODlBdXB5SFcySlVJcnhTazND?=
 =?utf-8?B?a2tuS0Q3ZlJyKzVqekt5WFlPMkQ4V0lqSDIzYlRPQ0wvaEFDOVZVZC9oVVpV?=
 =?utf-8?B?M0xNTk9ueWhwWU9GVHMyUmE2WXlxbG4vNElZZXZ4TCtaano3bHpBbEZOUHFl?=
 =?utf-8?B?QkUxM2JIVVVRamY4NFNkakR6eXhSbWFzbnRmWlNiMWh4MytkU290YnlkSVdi?=
 =?utf-8?B?cnZMS3FMZzNicmllL2h2UGxPYjFtc0FLNjdrcTJhTkt2NEpkZGZkOEEzUmNa?=
 =?utf-8?B?MXlHM0VnQjk4YWVFTUVjcFVsZlFJSGtwM2J2U3JjbElVQURhUWJEYWRzV05j?=
 =?utf-8?B?VTluV25TVHJsd1lVVWZzdGw4bURBcSt4RjlHZmFIbXRNeUVQRmtTeXVBaTYr?=
 =?utf-8?B?VktSZmN3M2xKbEFuSFYvK2pxVkdOOS9BZTEycU9lYW5TKytTUlp0Qm9iYkRr?=
 =?utf-8?B?eTZTOWFxNVJSczgwSzQ2YmF6Zi9GTTJaWHhDejUxN091bnVwWnJOeW5NckNn?=
 =?utf-8?B?UWxaYkIycWpweU4yYmRXeFBVY3o4bzVuS1VsdkxMM0JVVVBVY2NoVHQxVFhm?=
 =?utf-8?B?NUJVeWZTM3Z3dHAxcEFRSjI2cFpMc1NFbkFVNzBpbFgvdlp1NWRSVVZHb0hu?=
 =?utf-8?B?V2R1dkVYYTlSRkdhaWNCSW9aS2lJVUVlbXZ6MkppM2QvSUZTdUtKSzdqcXND?=
 =?utf-8?B?cFN6dHlQWFdYd1c1OWk5a1B5d2VxMVBPMHhTMEZCcVpqNHltTVJaeTRqcjVq?=
 =?utf-8?B?N2JFMWF1UndCbStwcW03cFdOZnBsd3lNQlhxRzJHU0xQbDhxK3FrbHVsS2Qw?=
 =?utf-8?B?OTlvdWFIVzk5S1l1MmhKUW9pbUowenNhU2s4TGxWRFAvRXJVdHFwYTRBWit3?=
 =?utf-8?B?YXJndG5Fb3hlODlMQS9jTjQycFZRQm4zV2taTSt3ZU9HSlBodmhwTzdjM3A3?=
 =?utf-8?B?WXIvM0dUMTBVb2dybENBNmxPNDFDbHVjdGdBVVhpODJtNitOUVZGeFpuY05H?=
 =?utf-8?B?Mi9xNVJDbEFFRWNMQit3eklZQUJ1OWVsR1NnQS9mYjYxTkRzZXhtT1VJZ0Iy?=
 =?utf-8?B?Ykhxd3Vza0FsZ3liS1NMYmFLWFJWUzJkRDdXWXR1bGg3S0tnKzNXQ29YbjBS?=
 =?utf-8?B?WE5VQ0dvWlVUTFBjWUcrSmYybDFwVCtuRk1tcXl2T0VXdi85aWxZa0F5ZkFE?=
 =?utf-8?B?QkJYTjF0VndTam1JMDllcElnem41T1JETFhseTZZTjNkWkllSDRsdVd1RDhN?=
 =?utf-8?B?WjFIWmE2MUhxd0U4QzVmVmNkZnA0MS9jOWpkL3dnWWhPWUFvaVBGdkdNVm9n?=
 =?utf-8?B?WHB2ekpZbm0xOG9TTWoyTFdha21JcE9FRU50U25mSUZzdTJLUVpzQkd6d1Vo?=
 =?utf-8?B?TTQ3UStqb3BiRFo4R0VIZExJK2FzbHlOUW52WkVKY3FWY0xQSlBxenprNThG?=
 =?utf-8?B?NnZDTTFkYlhtR3RjZGxaZTRTcWNkVEtOV0p1ZVMvQUliT3A2Rk1vMlhMemNI?=
 =?utf-8?B?a2U1UW53Vjlwb2cwK011UktGMFl1SXpFcWNYd3NtQVJLYWU1KzA4NTFZaDNx?=
 =?utf-8?B?Rnc3d3V0MlpJWkwwb21WUDlPTzMzVE1yOUpyWWFEbEhIVUdhbjZKaXp4eEpq?=
 =?utf-8?B?bjFESUFROGNZUHNlZUt3eXQ1SzZuV1Z6SElMSTlVY3gxbnRQS2xubDg4TU52?=
 =?utf-8?B?OGRHb0wxV2MzR0x1Ky85ZHBIMmdyemplaUpKMlYrV25McnpxQzZ2Rkplck9Q?=
 =?utf-8?B?OVIwQTdvbmtTQnlsZ1pZTlVHOGk2QTZtM0w5ZC9vWHBWTVRueDFuQnBza3ZL?=
 =?utf-8?B?NVZKNmZpR0tYeXR0ZnJ6RW0wemgwZjEzNTJqQVIzUmdNSnFDQm5VcDRPelA2?=
 =?utf-8?B?WEUyNWtCVEpLQ2RlS1VOWUNpTFZMVUlkWkdpRThYeis3US9EYkxpTFQ4Y3Fx?=
 =?utf-8?B?dTZhS3Y2bDVUZW5FK0J2VXhlK2JGbkJ1SXNmbWFBRmF1M24rdjBWd0lHbUcr?=
 =?utf-8?B?UVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <429A1EAE8A62D94F9E9342730A0EAC01@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37519b78-d4ff-4e3a-992e-08dbbeb02660
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2023 16:46:36.9963 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1jgQ6ZluKSSAf+OWHGUWXXj5U3WqDby5XP7+5qCJfN6oH5+Rx/PGeAlsthp4fCa+4xuFT9yYrgEmIu86KTWJEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5439
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 27/30] drm/xe: Extend uAPI to query HuC
 micro-controler firmware version
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

T24gVHVlLCAyMDIzLTA5LTI2IGF0IDEyOjU1ICswMDAwLCBGcmFuY29pcyBEdWdhc3Qgd3JvdGU6
DQo+IFRoZSBpbmZyYXN0cnVjdHVyZSB0byBxdWVyeSBHdUMgZmlybXdhcmUgdmVyc2lvbiBpcyBh
bHJlYWR5IGluIHBsYWNlLiBJdA0KPiBpcyBleHRlbmRlZCB3aXRoIGEgbmV3IG1pY3JvLWNvbnRy
b2xsZXIgdHlwZSB0byBxdWVyeSB0aGUgSHVDIGZpcm13YXJlDQo+IHZlcnNpb24uIEl0IGNhbiBi
ZSB1c2VkIGZyb20gdXNlciBzcGFjZSB0byBrbm93IGlmIEh1QyBpcyBydW5uaW5nLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogRnJhbmNvaXMgRHVnYXN0IDxmcmFuY29pcy5kdWdhc3RAaW50ZWwuY29t
Pg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jIHwgOSArKysrKysrKysN
Cj4gIGluY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmggICAgIHwgMSArDQo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDEwIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfcXVlcnkuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jDQo+IGluZGV4IDdh
MGZmZDlhNjU0YS4uYzI1MGNhNTM0YmI5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfcXVlcnkuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYw0KPiBA
QCAtNTMwLDYgKzUzMCwxNSBAQCBxdWVyeV91Y19md192ZXJzaW9uKHN0cnVjdCB4ZV9kZXZpY2Ug
KnhlLCBzdHJ1Y3QgZHJtX3hlX2RldmljZV9xdWVyeSAqcXVlcnkpDQo+ICAJCXJlc3AuYnJhbmNo
X3ZlciA9IDA7DQo+ICAJCWJyZWFrOw0KPiAgCX0NCj4gKwljYXNlIFhFX1FVRVJZX1VDX1RZUEVf
SFVDOiB7DQo+ICsJCXN0cnVjdCB4ZV9odWMgKmh1YyA9ICZ4ZS0+dGlsZXNbMF0ucHJpbWFyeV9n
dC0+dWMuaHVjOw0KPiArDQo+ICsJCXJlc3AubWFqb3JfdmVyID0gaHVjLT5mdy5tYWpvcl92ZXJf
Zm91bmQ7DQo+ICsJCXJlc3AubWlub3JfdmVyID0gaHVjLT5mdy5taW5vcl92ZXJfZm91bmQ7DQo+
ICsJCXJlc3AucGF0Y2hfdmVyID0gaHVjLT5mdy5wYXRjaF92ZXJfZm91bmQ7DQoNCkhhdmUgeW91
IGNvbmZpcm1lZCB0aGF0IEh1QyB3aWxsIG5vdCBoYXZlIHNvbWV0aGluZyBsaWtlIHN1Ym1pc3Np
b24gdmVyc2lvbiBsaWtlIEd1QyBoYXZlPw0KQXQgbGVhc3QgaW4gR3VDLCB3aGVuIHJ1bm5pbmcg
aW4gU1JJT1YgbW9kZSB0aGUgVkZzIHdpbGwgbm90IGhhdmUgYWNjZXNzIHRvIHRoZSBhY3R1YWwg
R3VDIHZlcnNpb24sIHRoYXQgaXMgd2h5IGl0IGhhdmUgc3VibWlzc2lvbiB2ZXJzaW9uLg0KDQpO
b3Qgc3VyZSBpZiBwcm92aWRpbmcgYSBjb21wbGV0ZSBkaWZmZXJlbnQgZmlybXdhcmUgdmVyc2lv
biBmcm9tIG9uZSBrZXJuZWwgdmVyc2lvbiB0byBvdGhlciB3b3VsZCBiZSBjb25zaWRlcmVkIGEg
dUFQSSBicmVhay4uLg0KDQo+ICsJCXJlc3AuYnJhbmNoX3ZlciA9IDA7DQo+ICsJCWJyZWFrOw0K
PiArCX0NCj4gIAlkZWZhdWx0Og0KPiAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gIAl9DQo+IGRpZmYg
LS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oIGIvaW5jbHVkZS91YXBpL2RybS94ZV9k
cm0uaA0KPiBpbmRleCA4NDA5MTg2MGM3ZDIuLmZlN2U4M2E1YmQzZSAxMDA2NDQNCj4gLS0tIGEv
aW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL3hlX2Ry
bS5oDQo+IEBAIC00NzgsNiArNDc4LDcgQEAgc3RydWN0IGRybV94ZV9xdWVyeV90b3BvbG9neV9t
YXNrIHsNCj4gIHN0cnVjdCBkcm1feGVfcXVlcnlfdWNfZndfdmVyc2lvbiB7DQo+ICAJLyoqIEB1
YzogVGhlIG1pY3JvLWNvbnRyb2xsZXIgdHlwZSB0byBxdWVyeSBmaXJtd2FyZSB2ZXJzaW9uICov
DQo+ICAjZGVmaW5lIFhFX1FVRVJZX1VDX1RZUEVfR1VDIDANCj4gKyNkZWZpbmUgWEVfUVVFUllf
VUNfVFlQRV9IVUMgMQ0KPiAgCV9fdTE2IHVjX3R5cGU7DQo+ICANCj4gIAkvKiogQHBhZDogTUJa
ICovDQoNCg==
