Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E5DC25B47
	for <intel-xe@archiver.kernel.org>; Fri, 27 Oct 2023 10:01:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A55E10E02C;
	Fri, 27 Oct 2023 10:01:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ACD910E02C
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Oct 2023 10:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698400880; x=1729936880;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=iaZ5ildMm22CTdaHRd7WlUua/YXsD/sC8OvVBRHw4PY=;
 b=UfT/m+gLvWyX9NhEJutmlqyg9DMaHzXOO63a7wqMfTYWuxLmu9RmuyFQ
 V3lIw2+4OR+OCfBSrLp+nrUHVUfw6N45UZjzhm5+83De8uEgfgS22uhmJ
 RuhlXmKkobg5opu1Hz+xk+WzyBDPKMQzLFkDkwKWzod+sSlxJuVEtZ4N6
 jdHFf5NodTxtmLh7dI4r8D0LGGz372diGKb9JxNgNLvjW8X90q1Tgxm1B
 ukWGwutBG+NebtTWcZps1Gs4eKYOHZ8ZnRKe3v9LxrajpJPDngpQxV3Zi
 4Vc3DCE5F4yZFR8Sbx0+EH3Gs+sJSRbpZ5W7sJRtsQ9IOvlAr28e/JFY/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="9285984"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="9285984"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 03:01:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="829935461"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; d="scan'208";a="829935461"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Oct 2023 03:01:19 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 27 Oct 2023 03:01:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 27 Oct 2023 03:01:18 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 27 Oct 2023 03:01:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XDfcah6OGdo3eqIAZtXKqdKUG82F3KIB+7W4awU8v8MdNrLo2O98n8EWUXOFWeIwdg6pLFxZoYCReEXaP7pZVnNtiCK53x0K2+mOMy12ClDqvjouxQFd/gwpWDWWDbVjzUosq2G9iaq/zAm5xX3Fr/WSPKT7DqURjZ8H8yG6u/WYzDcNsAEZr6dSVpwrcO3XfgIS2da4oFKMFibWN7ZVFx7fdT1cEcgj3J0+D95XbMbMKaSEXp4VD78zkYR55sLVG+vby2X0XsC26xVrwX0s9XTC9/wDBXHKN2HNTYNx8WQK3FSXAddc9GhdEpwSjr5sacrL48zF8lZNMtmfv71czw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iaZ5ildMm22CTdaHRd7WlUua/YXsD/sC8OvVBRHw4PY=;
 b=cJf7WiNysTVtqiSSr6xvu64tiXTj0Gs3kLKNta81GbH4Drk2d+SV2Ban+GpS1uwqmR/eTQfnNV/yOe9N7p7kPWz51c4bArm2GIzWEyrX5GXGANf1gXNT4PiztCMu1N+KArYi5UN6/iANrFjf0ydkpum25+ytyLrzhsWfgo7bUWno/OEv/Y/ogkTphHCp4RB6z5DPERJq8HvTN3oNOreBMofsjHQ0Vh+nIFWZhVm9nCdXN3/OAp/nJnBQE2kRm64lcXAgfAuSzxD96taoD8ESgb49HXk1YyvdmYb2U59qlWBqCv3DkECXlt/F/8Ch3qAxOuDoJq02gepdq46J/haDfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.22; Fri, 27 Oct 2023 10:01:14 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892%3]) with mapi id 15.20.6933.024; Fri, 27 Oct 2023
 10:01:13 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
Thread-Topic: [10/10] revert more (fbc)
Thread-Index: AQHaCLyEaUJNjc/d6kWz/GCExIgTXw==
Date: Fri, 27 Oct 2023 10:01:13 +0000
Message-ID: <70a32fe76ebfd2685b5fa0e33fb339da571ccf8b.camel@intel.com>
References: <20231025102045.817068-11-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20231025102045.817068-11-maarten.lankhorst@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|PH0PR11MB5674:EE_
x-ms-office365-filtering-correlation-id: 259d9b22-4e6b-4238-5f60-08dbd6d3a71f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lM5JTLxftW5HBSmF4xaGdV7cZ+7RTT/psHDXblLr3a2BcUqDnqVb6F2jsUYgPRtNzzTctUaaThCXOgCf58fWxpQq9IPv1GsaVJmWZDllfOvyovR6o0bArCC+U+e1FPER39goLmrq76n+744mu2JdVdovpB1/PsAtX4ZIQ7qAwGwEApOGnDDcBE3sttfyiOIVvGtcGOTodAirAnPIkC+58r4RCecy8CrVWGnZqkc77nkzzxXhDJrUJlaSiDHjxM/2EfRKU1TLdg9uf8pUXJPLvb4yFWlsn8vLrdHRSADoI31yransR+SQJbUaRXW9a74cMONcYP8VLMOjj5WQZV57nvyQvk+LVpmRDn7uG63oGrVXyXB/MHrDPX4an0L6gAGsUdS+Mu69SXmpn0Z6BE7oUHwWVntTOfi3/zHeCyo96zAg8cuzCFv7MTCeiUWMC0YInGSyeihubuT2U8lYBBnVloQ75P6JfX32AiQuV4s7Uztx77KxHCt3rIWIH7Xppe+diE2il1fruCgLnJH462ELM7Zp5kebMqnQxT9AQCYiVLDU0prMDPemmLZvDQ6ub67BCsS59qaAMdP/Hs5CUQcE/hRenfpjkjVgLVad3DaiWjE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(376002)(396003)(346002)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(41300700001)(66946007)(64756008)(316002)(66476007)(66446008)(66556008)(26005)(4001150100001)(478600001)(8936002)(8676002)(91956017)(6486002)(76116006)(110136005)(5660300002)(2906002)(966005)(6506007)(71200400001)(83380400001)(36756003)(2616005)(6512007)(66574015)(38100700002)(86362001)(122000001)(82960400001)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VS82bjdpWWdHUzRXT1hEbS84MXp4R3libVREdTNjeWlmeVY0MVRaL1pMRnll?=
 =?utf-8?B?Y2JQeHIrWm5pbnZyWlRZM1d6OUQ1dFpTK2ptcTVCVUhrVkFQTE1qTUF1WU9j?=
 =?utf-8?B?S2dTbEk2Z0ZOeEErMEhYMmVhclFibU5oZlZiUXppSWY1NWVydTNSY3hRdVpN?=
 =?utf-8?B?NEVOT3NKbG8wMU5QaWlzQ1hFZ3ZjRWxFTCsraVJOV3ZyVWVPL0lPS01zbmFK?=
 =?utf-8?B?Z1gyTmNSMzVBaTRSRkttMUgyZlFucFF2emlhd3hGMENsamRpTGlPOU40ZXI4?=
 =?utf-8?B?VnhRMWpYbUhQZjN5dTJFeGNVd0FPcDIxUkZndTBDTnFDTklUM3FWRW1LQ1dI?=
 =?utf-8?B?dEM0NlY5cVBmUnpPWUV1NlVtc2xjcXQ0ak9WQzlTRnd0ZjVUMitXZkpQTnQ3?=
 =?utf-8?B?VDA2dWFveUF6WGwyTXB5eXRIb1g4alFQTnIvVnkxUDF3djNEQW1IVURnUlFw?=
 =?utf-8?B?VmswUU5oMkliYVQrYlZKUXV2NXAyTm1HaWoxeHNSYXRVS1hNZW5OZkxHQXpi?=
 =?utf-8?B?Y1ZDNDVWVlZwSVlEZFIyL2FGMTRuUUs4dGt0anlRdGlsMWpoK3lwNmJkVjd2?=
 =?utf-8?B?bnFXZFp5NmFSOEZGb1V0YXlJZGN1QWZEVzhSV3JJMkJhTitYRXU3TXhkYTFZ?=
 =?utf-8?B?aFB4Z3pTWDN2TWRCVWJMdzhDeVZORm4ySEJ5RmQ4bHk2ME5EdVUwWWtKTmFs?=
 =?utf-8?B?YnFIZjFsMXBZemdXT2pyNVdDTzdlMEljQWQ2WkQrL2oyVVo1SUd4ZEtUVURI?=
 =?utf-8?B?cFlIQXZaZG55MSt5SzJydGFkcmtoZElMbStwdzJVZk9VMUcvREVmT3BhbGtU?=
 =?utf-8?B?RWhNZjZ6YW1mNUZtYk5RTm0vYmY4UTQ3YlNWWHVJYlAxemcwVUVrenhINHhn?=
 =?utf-8?B?aC9RRFRRZ2YrVVgzQThxSFRmVU4rcTB6YlJNMU1OR24weHdEczhyMFludWto?=
 =?utf-8?B?MlNRMUZ4MFNnMHJPNGJBN2VFYTdGbnlFMUt6Ulp0bHF2empkczc5NW84Nk9K?=
 =?utf-8?B?TEhwWU5uS1ZxeTlrNVd1c2k4QWR0L2IwMDZaVlU4czBDRXVOUHkvUm4vakN3?=
 =?utf-8?B?QjJaQjZMN051czdvckYyQXJLTW9Eb3BHWGVRbm1JYnF2YlptczJWeHRUUklx?=
 =?utf-8?B?aXo4azNZTUVRRWExRGNGYk1nREs1VThxdUFBVEVzYUZSOUVjQ3ZHb0VDUmoy?=
 =?utf-8?B?MGlCVnZ0WkZQMkl2NkNWb1JYanVmT29GOVpTNEk4Yko2Ynh6ejNFQzBwS0ZF?=
 =?utf-8?B?VTNPSGZZS2d4QzBjYWErZHFjSTJ2NzRWNmZhdEpVdCtkZ2c5QkVqNmlLNitI?=
 =?utf-8?B?dG1EZE1TcFE4NDhRb2wxUitic0FZQWg0K3NRTEZmZ0FCWG5TRUxXNEtiSXp3?=
 =?utf-8?B?MWU1cjRsTHVtVjZFcTRNQkRtQXQyUnlta3lqbEhsQXJXMXprYy9IZDNucWdm?=
 =?utf-8?B?bjdyVytDdndQd0o4UExZYVZXWWVMaEQ4UmxVYXVxNnJjNjFXeWtQRnh6TnNB?=
 =?utf-8?B?bXg3bW52QUVvcDBPTEJOS2haV3J4Ym1DcStUZnUrMzk4bklQTFEwdUxtUTNU?=
 =?utf-8?B?VlpKd0F1akloNWFnTFg1RG15ZXlxU3BDOEpsZTlrU3l1UHp1NThCUnk0a3Zn?=
 =?utf-8?B?d2kxV09CeFA0a21hRHBPL0JRakg1dEhlUUlWZ2xjdkZoczJieDJ4bWtyUUQ3?=
 =?utf-8?B?dlRYZ01HTk8xaStyNHRQa2hqcE9hMjZ3bWgyWXVvbFFOTmhZOStiVWNYWWdR?=
 =?utf-8?B?b01HbUlhcXk4ajNkeGtwSzBDeHFTMnVFNk9leWRkL0xib0tBd1FEdTJxNTh4?=
 =?utf-8?B?TDd4dktHbkc2R2t5M0dSSklEZkI5Y3FXckxCbXlPQWRVZWxKQWtLVzJNTmJD?=
 =?utf-8?B?ajFGTFk2VEhIcHdzRks1ZGxXM0xXN2VhT05JNFowWUpvL1BlT1FYOHkrVFZl?=
 =?utf-8?B?MTVnMnQzSCtBaFZOSW9DT010UWtCVDIxVkIwdFpNTEdHRlpIb25VOWZUTVJh?=
 =?utf-8?B?NzNFaWZKbTdTamFPWk5ZUit2LytGcGd5M2xaclFHU280WW10R2tFU3BZdEVy?=
 =?utf-8?B?MWU0ZkNwTkdrTlUyUzhXTFB2MkJxVGFEMUcrRy9NWG1LVlpwWGYrQy9QeW4y?=
 =?utf-8?B?b01LQVg0VHEycXZ6ZzQvQ2RDSXVjMUZuODJZaXBQZTRlS25wYkF5R051NEtC?=
 =?utf-8?B?MkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <24CD124D17B59349BB759B90C08A5D36@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 259d9b22-4e6b-4238-5f60-08dbd6d3a71f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2023 10:01:13.2850 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JU9jt8Rr83nHo6OUJwZwT1J+Lxv1CHD4ETCFqmF14yor0H/OzcXCqupOXokSPDi5goDQMfaR6rBUIU4GxjSL6fEXYBgRqEf3P5FUSYXmjOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5674
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [10/10] revert more (fbc)
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

T24gV2VkLCAyMDIzLTEwLTI1IGF0IDEyOjIwICswMjAwLCBNYWFydGVuIExhbmtob3JzdCB3cm90
ZToKPiBTaG91bGQgYmUgYSBub29wLgoKSGVsbG8gTWFhcnRlbi4gSSBjb3VsZG4ndCBmaWd1cmUg
b3V0IGZvciB3aGF0IGJyYW5jaCB0aGlzIHBhdGNoIGlzCnByZXBhcmVkIGZvcj8gQWxsIHRoZSBy
ZW1vdmVkIGlmZGVmcyBpbiB0aGlzIHBhdGNoIGFyZSBhbHJlYWR5IHJlbW92ZWQKZWFybGllci4g
U2VlIG15IChtZXJnZWQpIHBhdGNoIHNldCBoZXJlOgoKaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRl
c2t0b3Aub3JnL3Nlcmllcy8xMjI5MDUvCgpCUiwKCkpvdW5pIEjDtmdhbmRlcgoKPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50
ZWwuY29tPgo+IC0tLQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9mYmMu
YyB8IDEzICsrKysrKysrKy0tLS0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZmJjLmMKPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
ZmJjLmMKPiBpbmRleCBjZDMxNmUwY2FhYTQxLi43MTMyMTBmNmQ3YzEzIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZmJjLmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiYy5jCj4gQEAgLTQ1Myw3ICs0NTMsNiBAQCBz
dGF0aWMgdm9pZCBnNHhfZmJjX3Byb2dyYW1fY2ZiKHN0cnVjdCBpbnRlbF9mYmMKPiAqZmJjKQo+
IMKgCj4gwqDCoMKgwqDCoMKgwqDCoGludGVsX2RlX3dyaXRlKGk5MTUsIERQRkNfQ0JfQkFTRSwK
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpOTE1X2dlbV9z
dG9sZW5fbm9kZV9vZmZzZXQoJmZiYy0KPiA+Y29tcHJlc3NlZF9mYikpOwo+IC0KPiDCoH0KPiDC
oAo+IMKgc3RhdGljIGNvbnN0IHN0cnVjdCBpbnRlbF9mYmNfZnVuY3MgZzR4X2ZiY19mdW5jcyA9
IHsKPiBAQCAtNjEyLDggKzYxMSwxMCBAQCBzdGF0aWMgdm9pZCBpdmJfZmJjX2FjdGl2YXRlKHN0
cnVjdCBpbnRlbF9mYmMKPiAqZmJjKQo+IMKgwqDCoMKgwqDCoMKgwqBlbHNlIGlmIChESVNQTEFZ
X1ZFUihpOTE1KSA9PSA5KQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc2tsX2Zi
Y19wcm9ncmFtX2NmYl9zdHJpZGUoZmJjKTsKPiDCoAo+ICsjaWZkZWYgSTkxNQo+IMKgwqDCoMKg
wqDCoMKgwqBpZiAoaW50ZWxfZ3Rfc3VwcG9ydF9sZWdhY3lfZmVuY2luZyh0b19ndChpOTE1KSkp
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzbmJfZmJjX3Byb2dyYW1fZmVuY2Uo
ZmJjKTsKPiArI2VuZGlmCj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgaW50ZWxfZGVfd3JpdGUoaTkx
NSwgSUxLX0RQRkNfQ09OVFJPTChmYmMtPmlkKSwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBEUEZDX0NUTF9FTiB8IGl2Yl9kcGZjX2N0bChmYmMpKTsKPiBA
QCAtODAwLDcgKzgwMSw2IEBAIHN0YXRpYyBpbnQgaW50ZWxfZmJjX2FsbG9jX2NmYihzdHJ1Y3Qg
aW50ZWxfZmJjCj4gKmZiYywKPiDCoMKgwqDCoMKgwqDCoMKgZHJtX2RiZ19rbXMoJmk5MTUtPmRy
bSwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAicmVzZXJ2ZWQgJWxs
dSBieXRlcyBvZiBjb250aWd1b3VzIHN0b2xlbiBzcGFjZQo+IGZvciBGQkMsIGxpbWl0OiAlZFxu
IiwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpOTE1X2dlbV9zdG9s
ZW5fbm9kZV9zaXplKCZmYmMtPmNvbXByZXNzZWRfZmIpLAo+IGZiYy0+bGltaXQpOwo+IC0KPiDC
oMKgwqDCoMKgwqDCoMKgcmV0dXJuIDA7Cj4gwqAKPiDCoGVycl9sbGI6Cj4gQEAgLTk3OCw3ICs5
NzgsNyBAQCBzdGF0aWMgdm9pZCBpbnRlbF9mYmNfdXBkYXRlX3N0YXRlKHN0cnVjdAo+IGludGVs
X2F0b21pY19zdGF0ZSAqc3RhdGUsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGludGVsX2NydGMgKmNy
dGMsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGludGVsX3BsYW5lICpwbGFuZSkKPiDCoHsKPiAtwqDC
oMKgwqDCoMKgwqBzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSA9IHRvX2k5MTUoc3RhdGUt
PmJhc2UuZGV2KTsKPiArwqDCoMKgwqDCoMKgwqBfX21heWJlX3VudXNlZCBzdHJ1Y3QgZHJtX2k5
MTVfcHJpdmF0ZSAqaTkxNSA9IHRvX2k5MTUoc3RhdGUtCj4gPmJhc2UuZGV2KTsKPiDCoMKgwqDC
oMKgwqDCoMKgY29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUgKmNydGNfc3RhdGUgPQo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaW50ZWxfYXRvbWljX2dldF9uZXdfY3J0Y19z
dGF0ZShzdGF0ZSwgY3J0Yyk7Cj4gwqDCoMKgwqDCoMKgwqDCoGNvbnN0IHN0cnVjdCBpbnRlbF9w
bGFuZV9zdGF0ZSAqcGxhbmVfc3RhdGUgPQo+IEBAIC05OTMsNyArOTkzLDcgQEAgc3RhdGljIHZv
aWQgaW50ZWxfZmJjX3VwZGF0ZV9zdGF0ZShzdHJ1Y3QKPiBpbnRlbF9hdG9taWNfc3RhdGUgKnN0
YXRlLAo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoC8qIEZCQzEgY29tcHJlc3Npb24gaW50ZXJ2YWw6
IGFyYml0cmFyeSBjaG9pY2Ugb2YgMSBzZWNvbmQgKi8KPiDCoMKgwqDCoMKgwqDCoMKgZmJjX3N0
YXRlLT5pbnRlcnZhbCA9IGRybV9tb2RlX3ZyZWZyZXNoKCZjcnRjX3N0YXRlLQo+ID5ody5hZGp1
c3RlZF9tb2RlKTsKPiAtCj4gKyNpZmRlZiBJOTE1Cj4gwqDCoMKgwqDCoMKgwqDCoGZiY19zdGF0
ZS0+ZmVuY2VfeV9vZmZzZXQgPQo+IGludGVsX3BsYW5lX2ZlbmNlX3lfb2Zmc2V0KHBsYW5lX3N0
YXRlKTsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqBkcm1fV0FSTl9PTigmaTkxNS0+ZHJtLCBwbGFu
ZV9zdGF0ZS0+ZmxhZ3MgJiBQTEFORV9IQVNfRkVOQ0UKPiAmJgo+IEBAIC0xMDAyLDYgKzEwMDIs
NyBAQCBzdGF0aWMgdm9pZCBpbnRlbF9mYmNfdXBkYXRlX3N0YXRlKHN0cnVjdAo+IGludGVsX2F0
b21pY19zdGF0ZSAqc3RhdGUsCj4gwqDCoMKgwqDCoMKgwqDCoGlmIChwbGFuZV9zdGF0ZS0+Zmxh
Z3MgJiBQTEFORV9IQVNfRkVOQ0UpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBm
YmNfc3RhdGUtPmZlbmNlX2lkID3CoCBpOTE1X3ZtYV9mZW5jZV9pZChwbGFuZV9zdGF0ZS0KPiA+
Z2d0dF92bWEpOwo+IMKgwqDCoMKgwqDCoMKgwqBlbHNlCj4gKyNlbmRpZgo+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgZmJjX3N0YXRlLT5mZW5jZV9pZCA9IC0xOwo+IMKgCj4gwqDC
oMKgwqDCoMKgwqDCoGZiY19zdGF0ZS0+Y2ZiX3N0cmlkZSA9IGludGVsX2ZiY19jZmJfc3RyaWRl
KHBsYW5lX3N0YXRlKTsKPiBAQCAtMTAxMSw2ICsxMDEyLDcgQEAgc3RhdGljIHZvaWQgaW50ZWxf
ZmJjX3VwZGF0ZV9zdGF0ZShzdHJ1Y3QKPiBpbnRlbF9hdG9taWNfc3RhdGUgKnN0YXRlLAo+IMKg
Cj4gwqBzdGF0aWMgYm9vbCBpbnRlbF9mYmNfaXNfZmVuY2Vfb2soY29uc3Qgc3RydWN0IGludGVs
X3BsYW5lX3N0YXRlCj4gKnBsYW5lX3N0YXRlKQo+IMKgewo+ICsjaWZkZWYgSTkxNQo+IMKgwqDC
oMKgwqDCoMKgwqBzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSA9IHRvX2k5MTUocGxhbmVf
c3RhdGUtCj4gPnVhcGkucGxhbmUtPmRldik7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgLyoKPiBA
QCAtMTAyOCw2ICsxMDMwLDkgQEAgc3RhdGljIGJvb2wgaW50ZWxfZmJjX2lzX2ZlbmNlX29rKGNv
bnN0IHN0cnVjdAo+IGludGVsX3BsYW5lX3N0YXRlICpwbGFuZV9zdGF0ZSkKPiDCoMKgwqDCoMKg
wqDCoMKgcmV0dXJuIERJU1BMQVlfVkVSKGk5MTUpID49IDkgfHwKPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoChwbGFuZV9zdGF0ZS0+ZmxhZ3MgJiBQTEFORV9IQVNfRkVOQ0UgJiYK
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpOTE1X3ZtYV9mZW5jZV9pZChwbGFu
ZV9zdGF0ZS0+Z2d0dF92bWEpICE9IC0xKTsKPiArI2Vsc2UKPiArwqDCoMKgwqDCoMKgwqByZXR1
cm4gdHJ1ZTsKPiArI2VuZGlmCj4gwqB9Cj4gwqAKPiDCoHN0YXRpYyBib29sIGludGVsX2ZiY19p
c19jZmJfb2soY29uc3Qgc3RydWN0IGludGVsX3BsYW5lX3N0YXRlCj4gKnBsYW5lX3N0YXRlKQoK
