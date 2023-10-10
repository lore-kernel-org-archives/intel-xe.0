Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E466CD6914
	for <intel-xe@archiver.kernel.org>; Tue, 10 Oct 2023 09:31:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E793910E12E;
	Tue, 10 Oct 2023 09:31:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB9010E12E
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Oct 2023 09:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696930310; x=1728466310;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=QpT3LNIh3TRTxU/QMeDOjmTWLDiAGvA1y/I3YM2g9ck=;
 b=PFJL3xnp5jB3Zy++tDDYlHfCgawsKS35QCw2yMzvOJ3kRIMeFX37crE6
 3OYOkUI2Z6O5XTOJtVaiY/KInPZ5lamLh9CfBadxMN8UXUpUBEoLu2HPm
 MAewwU5U9wX1jbyA7tvHujcrRt1pG593X0IbXBVhm4S4V25yzSFGC5X1R
 82rbI18VTr25TkkylkU56WCZ+MlrVuGB6EGgs4zK72BZIPUyACpMTB9dG
 F6McPY0Ff2fWnS7Lq36iRhLF6H04QE02lbgxXmmC/59TITvr754NdMQ/J
 tXCafuUPcMCwrjMMbK5Q2c+FwnoUvB9NcHuMqJ2YSabZT7WHxcH5CQgU8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="448544811"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; d="scan'208";a="448544811"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 02:31:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="753332465"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; d="scan'208";a="753332465"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Oct 2023 02:31:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 10 Oct 2023 02:31:48 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 10 Oct 2023 02:31:48 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 10 Oct 2023 02:31:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cGghSZdtGSqA4242GJ/nJaG0/9tiJ20OOXXzXJIBmI3r8yed3A8rkzCoVLrf3vZ1u9nCkQj4w9EHgScw15vU9bm+GGZnaPayLSEBxplXXvsKOBaV675hgBUVMF47JXLi4qTIyZQjzhzKP8kRtOdgHIA2dRdNxU8q8I9vBToLpKoQ/STUhHtjn4ddEoSABvZW8qiaLvqe+Toq0aN+Z9XDkILBsCeYV0qxaM0Cg947b4NKsllK+WJfoTvnLrREjhRJ9nLyLodQdGzVokzZg7dVWtQFMJTIK3Sso06JRCA7MZ5bP5uBzfRYJiZzH0Q15ZLdu6PxH3Yba3uwex2HWToGPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QpT3LNIh3TRTxU/QMeDOjmTWLDiAGvA1y/I3YM2g9ck=;
 b=W6mguaWQUjwuaWlZwI6cvzvB97qe9g3rllF5CRQCJPS4L9C5YQzAyYir2HXlCWrosgc/q8UZ2SKFXyfMzjsx0Ite+iYuxmX04VriwkjJ7FCGzQKyig98FR80aPPKJvM2fq9oJtvGHshgYMcJDQ0Zg4pvsRaP9OG247LZK4gLwQAv/8TvX8irpDRoomLMY2aE9WGNk70XCRhNUPOUGtBtZikF0e3s77Qx76G14VStUAQwi8aXDzFzd3g+OQ+MnHeCycLdEoeMxAZB/LZ0wDV825wuZATxvr2q0phDktg2fT3gwxFsuVxKfdO5Z8YLpxNs6Csj9F+CTDGhhqn6mBc+2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6344.namprd11.prod.outlook.com (2603:10b6:930:3b::6)
 by DM8PR11MB5622.namprd11.prod.outlook.com (2603:10b6:8:36::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 09:31:42 +0000
Received: from CY5PR11MB6344.namprd11.prod.outlook.com
 ([fe80::898f:11ee:dea5:9b79]) by CY5PR11MB6344.namprd11.prod.outlook.com
 ([fe80::898f:11ee:dea5:9b79%6]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 09:31:42 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [v2 3/3] drm/xe: Create a dummy version for vga decode
Thread-Index: AQHZ+Es95OLVhsE7Lk6eXQ+hkYlbSLBA4VmAgAHE8HCAAB1zgIAABIig
Date: Tue, 10 Oct 2023 09:31:41 +0000
Message-ID: <CY5PR11MB63449E3B13981CF49D8F7CB4F4CDA@CY5PR11MB6344.namprd11.prod.outlook.com>
References: <20231006115645.2402795-1-uma.shankar@intel.com>
 <20231006115645.2402795-4-uma.shankar@intel.com>
 <DM6PR11MB3177EAD727A47713E825B03FBACEA@DM6PR11MB3177.namprd11.prod.outlook.com>
 <DM4PR11MB63604707F3239BFE7A0A1E58F4CDA@DM4PR11MB6360.namprd11.prod.outlook.com>
 <87edi26dqm.fsf@intel.com>
In-Reply-To: <87edi26dqm.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6344:EE_|DM8PR11MB5622:EE_
x-ms-office365-filtering-correlation-id: 2c80f501-013f-4094-3c47-08dbc973b650
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZGjnSuYACUvIqJFKdY1nWhPy3m6lgeJMBNgLnRJ5mO2xS34hwJQILD/uj94WrzxhCvGca427prEgphaVypMrRC8n4hK0YeR8S8g9LXl8dY618P+pu4dZcbSw+Tby0ixq525VpF7FRrRfBYZMPENgV+WRq2MCfsflwirKXwakMc/Bshb6lB1Gxrbbs/5vqf+HrG0MiJqRllACTyy8MEPFf3/bT1aDiV5sqOAmpL1QmJE1zUmM7v68kYqmgJ3PrmD516MEIDryqPHNnME7U0WARgxBaRIIeeoTGJHqpLNVSTuibZjd/eoUXnLxWnsEwkUpotJTyiQUPBvwbgxcOeb8j13glvogKOag8btgs1C5GbK95i0AGaz+Hxcpu7Aw6yjDF/JAJ1i02iLx/bGim1KuckMAsHItKXeUN7W6muEsHlN3V2/UqJktHiJ3N7FKIFUie4Oqj33asxdRkf0J1rttwOV3zO/u9zKDB9iDzzJ8gtU6tqqVECWKgxAe3qWIjdJRnOyVRzP36iO5AcGe1Q3tJC5WYKuLX5K2A7oPgckitrdGyGX+4yvBr4kWB57qJ8Y+QWBb7AsAnoScBqmdjrr2RviB0DEteltsqrMCescvcBRZBeG8hl34CJ5QVbGmsXye
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6344.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(136003)(39860400002)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(33656002)(86362001)(2906002)(5660300002)(8936002)(52536014)(8676002)(41300700001)(55016003)(122000001)(66946007)(76116006)(64756008)(66476007)(66556008)(82960400001)(66446008)(38070700005)(6506007)(38100700002)(7696005)(71200400001)(316002)(110136005)(83380400001)(478600001)(26005)(53546011)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TG5aT3hmL2xieUN1WDlJQ2tnM2wzcDVsZU9tbzFpS3pwbnF5dnFFc1dWYTRC?=
 =?utf-8?B?ZTVMM3lITlY3V0Z2UzBEN2xQU3k4S2tRcDZsVGxZVjZlWitSS0k3czdHc3JK?=
 =?utf-8?B?bmdONlRZLzBiRW1rVDdZdlV2TGw5ZjdVNm9OOG1WTjdIakJ3WC9sd2xWOTZE?=
 =?utf-8?B?MjBqdTNEZHlSd3VUZGYrbDBaNTBVdFlQbTZlaFZVNlRRUWZZOGlONTA1ZWE0?=
 =?utf-8?B?alMwNU0xbTFsNnlUL09FL09zaisvaDNpNllZVFBtS29ETUJxZDlQRFNwZE94?=
 =?utf-8?B?NW1Za3BiYlpwNW1kSkNabFVpQXc4alNlN1dvV0JJM2J4SmQyN2hseFlRc1NU?=
 =?utf-8?B?RmFYOGk2WEhQUlFrakhiYmlBNHppV1NSWWhlRGkrZG5tdDZvcVp5QU5KMVVw?=
 =?utf-8?B?eEVXb0g5ekVOT0xTV28wZUVxTFpZRFJHZTFvQkYyM09qSVJEOVUxQVJhaWpR?=
 =?utf-8?B?U3BINGQ1aHkyRUpEZ0VxZE1NdlZkaFBkTXNPek4yYlNOcDV6THBmZzhUblpr?=
 =?utf-8?B?ZkxZeEVZcnl1MUxsUHpIY21lS2tuZ20wMVBXc3RzY2pja01YYzUxMFgzQlhm?=
 =?utf-8?B?dlZMYzNxL1RKT2VZdE94RnNoWmovVE5IT3A2djBsTWRBSm5UY0ZvTnNRbmsx?=
 =?utf-8?B?MHlTMVZ2UUdmeDJxbHovSkhGVjhqeTQ2Nm9EalNCdWNJTlp4RUVWR3paRXFD?=
 =?utf-8?B?UzRoNXp0MkhkdEwvOWdNUldsWFJmZnplR2VtTE45ZG1jdzl0SFF3NytsV3N5?=
 =?utf-8?B?eS9vTTRqRm9NMnFWaXErcXM3TmtXK2puL2owZFBqMkN1elUvT0Z6WDR6VHRj?=
 =?utf-8?B?OFJ6Z01vS1VDRUFFaHE5SDhYVlRXL3UvM3B5Ykt0ZVBtT1JoM2Y0YUNRRmdk?=
 =?utf-8?B?R0lpM055NmoxSDhIbVcwUFgyakF1OXVNOXg2MjJjNG9kYndRRklQUGJiY05m?=
 =?utf-8?B?OUlsbWJsTk45SWhsNTY1QktYN01HeWtLWXJNTlZ0dlM5bkxVVUR0ZXF6NzIz?=
 =?utf-8?B?YTFQMjVvUTk2S3M2R251SHQ3MU1pWDNSaE1iSWNUc0t5MzdOckhDRStrNGc1?=
 =?utf-8?B?UXc4dGNNQjM2Nm94bkl3SWl3WmErRE9DVDMzNWk3YTZGUTE3VThLNm9nUkRD?=
 =?utf-8?B?bkFrSFdHaXczVEc4Y2JVcm9iQzRoaHRzTGJncWl0VFN5ZXVwQm95OHVBY1BG?=
 =?utf-8?B?Q293RVFPMXFQR2NwWjlVbU1tNGlCcGN3YSs0U1FnQVlZekxLRWxQVlE4YnNz?=
 =?utf-8?B?azJKUEd1blkybG8wY3Y5T01XakYyajY4dm44WmtvQWRoYVhZdC9HTGg5N3k5?=
 =?utf-8?B?U0FucThja1o0Zjk2L2x1NWNQZTZVTlYxUkhVK0JNVWQzRjR2VCtDVFIyL2M3?=
 =?utf-8?B?QlZ6R0RQd2haR3g0Uk4wT21UQUFOd1I0TFlUN1hrZTRVKzVwcWc5SklReVFa?=
 =?utf-8?B?VjVIUGw5cWhYUURoNFZxNVhHQkV5Ym1oZkxDdXYzQ0F3d2tBS01uWVRIMHVa?=
 =?utf-8?B?cVl1OUEyNlladjNVVkZ0dVZBZ1hZSnRFNkI3VFh1NkRYNnA1dVhwVzdtNk9C?=
 =?utf-8?B?R2dPQTVFaFpLdGxZMURSMFdONWxaWUNOOFg5Rkk0TWpMOU9ZeGNHeDAycHM3?=
 =?utf-8?B?T1Q2U3AxbGpLU1NRaHpsMEVDVlF4V2xNWUhPU2tNOHFKVDBxVUMxcmlKd0Ry?=
 =?utf-8?B?ZVlqSWJtMGNlMTZ3Qm1Rcm1rM3VVdUs4TlhFdmNrcXdraWppMXFLS0lMVVoz?=
 =?utf-8?B?Yjk2S01wZ3RUN21xNlJSU3JFYTV1anEwaFkxaTBZUnppUXBiM09JTGtUOWRQ?=
 =?utf-8?B?Z2E1eDdTTE9adk1VZ0hHU0c1Ym5HZ3V2RVgwT0J6RGR1VHBMTWtJT3BoZ3h0?=
 =?utf-8?B?T3BUeFd4a25wRU1QbDh2UDdoY092RGtVaGQ5Z0VabnlNOGE3OW0vMEhHRGNq?=
 =?utf-8?B?a3hzZnlsdUlwTVFVMDlHVE9YZ0xXVUtkMjcrR3pxOC9uQk9mVkRIRXIvVXlP?=
 =?utf-8?B?V3VFd0l3Q0JIZGVid3BQeWJMYmlhWFFvT3RVdE4yOWh3aUp6bzRGM2JCekFi?=
 =?utf-8?B?QWJyVERSQzlTTHRFRjc0QjcvTkhHQStTZzB6Qm9aOTZoR1VER05FZ0lqeHZs?=
 =?utf-8?Q?kyvnVaTkahQrElczlLQHpnkeb?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6344.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c80f501-013f-4094-3c47-08dbc973b650
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2023 09:31:41.9925 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C3QhVVteG0x25jvEsBCW3bWiSWMbzZiXDGagxxKSSIGnvwua41Tz2RljCGM9DCWJ7rnbJAdLqT+ERtEl+0xCNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5622
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [v2 3/3] drm/xe: Create a dummy version for vga
 decode
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTmlrdWxhLCBKYW5pIDxq
YW5pLm5pa3VsYUBpbnRlbC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIE9jdG9iZXIgMTAsIDIwMjMg
Mjo0NCBQTQ0KPiBUbzogU2hhbmthciwgVW1hIDx1bWEuc2hhbmthckBpbnRlbC5jb20+OyBNdXJ0
aHksIEFydW4gUg0KPiA8YXJ1bi5yLm11cnRoeUBpbnRlbC5jb20+OyBpbnRlbC14ZUBsaXN0cy5m
cmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogUkU6IFt2MiAzLzNdIGRybS94ZTogQ3JlYXRlIGEg
ZHVtbXkgdmVyc2lvbiBmb3IgdmdhIGRlY29kZQ0KPiANCj4gT24gVHVlLCAxMCBPY3QgMjAyMywg
IlNoYW5rYXIsIFVtYSIgPHVtYS5zaGFua2FyQGludGVsLmNvbT4gd3JvdGU6DQo+ID4+DQo+ID4+
ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gPiBGcm9tOiBTaGFua2FyLCBVbWEg
PHVtYS5zaGFua2FyQGludGVsLmNvbT4NCj4gPj4gPiBTZW50OiBGcmlkYXksIE9jdG9iZXIgNiwg
MjAyMyA1OjI3IFBNDQo+ID4+ID4gVG86IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0K
PiA+PiA+IENjOiBOaWt1bGEsIEphbmkgPGphbmkubmlrdWxhQGludGVsLmNvbT47IE11cnRoeSwg
QXJ1biBSDQo+ID4+ID4gPGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPjsgU2hhbmthciwgVW1hIDx1
bWEuc2hhbmthckBpbnRlbC5jb20+DQo+ID4+ID4gU3ViamVjdDogW3YyIDMvM10gZHJtL3hlOiBD
cmVhdGUgYSBkdW1teSB2ZXJzaW9uIGZvciB2Z2EgZGVjb2RlDQo+ID4+ID4NCj4gPj4gPiBUaGlz
IGludHJvZHVjZXMgYW4gZXhjbHVzaXZlIHZlcnNpb24gb2YgdmdhIGRlY29kZSBmb3IgeGUuDQo+
ID4+ID4gUmVzdCBvZiB0aGUgZGlzcGxheSBjaGFuZ2VzIHdpbGwgYmUgcmUtdXNlZCBmcm9tIGk5
MTUuDQo+ID4+ID4NCj4gPj4gPiBDdXJyZW50bHkgaXQgYWRkcyBqdXN0IGEgZHVtbXkgaW1wbGVt
ZW50YXRpb24uIFZHQSBkZWNvZGUgbmVlZHMgdG8NCj4gPj4gPiBiZSBoYW5kbGVkIGNvcnJlY3Rs
eSBpbiBpOTE1LCBwcm9wZXIgaW1wbGVtZW50YXRpb24gd2lsbCBiZSBhZG9wdGVkDQo+ID4+ID4g
b25jZSB0aGUgaTkxNSBjaGFuZ2VzIGFyZSBmaW5hbGl6ZWQgYW5kIG1lcmdlZCBpbiB1cHN0cmVh
bS4NCj4gPj4gPg0KPiA+PiA+IHYyOiBBZGRyZXNzZWQgQXJ1bidzIHJldmlldyBjb21tZW50cw0K
PiA+PiA+DQo+ID4+ID4gU2lnbmVkLW9mZi1ieTogVW1hIFNoYW5rYXIgPHVtYS5zaGFua2FyQGlu
dGVsLmNvbT4NCj4gPj4gPiAtLS0NCj4gPj4gUmV2aWV3ZWQtYnk6IEFydW4gUiBNdXJ0aHkgPGFy
dW4uci5tcnV0aHlAaW50ZWwuY29tPg0KPiA+DQo+ID4gVGhhbmtzIEFydW4gZm9yIHRoZSByZXZp
ZXdzLg0KPiA+DQo+ID4gSGkgSmFuaSwNCj4gPiBDYW4geW91IHBsZWFzZSBhY2sgdGhpcyBjaGFu
Z2UsIEkgd2lsbCB0cmlnZ2VyIGEgdGFzayBmb3IgdmdhIGRlY29kZQ0KPiA+IGhhbmRsaW5nIGNs
ZWFudXAgZm9yIGk5MTUgYXMgbmV4dCBzdGVwLg0KPiANCj4gTm90IHN1cGVyIHRocmlsbGVkIGFi
b3V0IGFkZGluZyBhIGZpbGUgbmFtZWQgImRpc3BsYXkgbWlzYyIsIGJlY2F1c2UgZXhwZXJpZW5j
ZQ0KPiBoYXMgc2hvd24gYW55dGhpbmcgbGlrZSB0aGF0IGJlY29tZXMgYSBkdW1waW5nIGdyb3Vu
ZCBmb3IgcmFuZG9tIHN0dWZmLiBCdXQNCj4gYW55d2F5LA0KPiANCj4gQWNrZWQtYnk6IEphbmkg
TmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+DQoNClRoYW5rcyBKYW5pLg0KDQpSZWdhcmRz
LA0KVW1hIFNoYW5rYXINCg0KPiANCj4gPg0KPiA+IFRoYW5rcyAmIFJlZ2FyZHMsDQo+ID4gVW1h
IFNoYW5rYXINCj4gPg0KPiA+DQo+ID4+IFRoYW5rcyBhbmQgUmVnYXJkcywNCj4gPj4gQXJ1biBS
IE11cnRoeQ0KPiA+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+PiA+ICBkcml2ZXJzL2dwdS9k
cm0veGUvTWFrZWZpbGUgICAgICAgICAgICAgICAgICB8ICAxICsNCj4gPj4gPiAgZHJpdmVycy9n
cHUvZHJtL3hlL2Rpc3BsYXkveGVfZGlzcGxheV9taXNjLmMgfCAxNCArKysrKysrKysrKysrKw0K
PiA+PiA+ICAyIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKykNCj4gPj4gPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L3hlX2Rpc3BsYXlfbWlzYy5j
DQo+ID4+ID4NCj4gPj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL01ha2VmaWxl
DQo+ID4+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUvTWFrZWZpbGUgaW5kZXgNCj4gPj4gPiBkZmYx
Mzg2ZWU2YjMuLjE3NWEzNTczNjZkOSAxMDA2NDQNCj4gPj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0veGUvTWFrZWZpbGUNCj4gPj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUvTWFrZWZpbGUN
Cj4gPj4gPiBAQCAtMTUwLDYgKzE1MCw3IEBAIHhlLSQoQ09ORklHX0RSTV9YRV9ESVNQTEFZKSAr
PSBcDQo+ID4+ID4gICAgIGRpc3BsYXkveGVfaGRjcF9nc2MubyBcDQo+ID4+ID4gICAgIGRpc3Bs
YXkveGVfcGxhbmVfaW5pdGlhbC5vIFwNCj4gPj4gPiAgICAgZGlzcGxheS94ZV9kaXNwbGF5X3Jw
cy5vIFwNCj4gPj4gPiArICAgZGlzcGxheS94ZV9kaXNwbGF5X21pc2MubyBcDQo+ID4+ID4gICAg
IGRpc3BsYXkvZXh0L2k5MTVfaXJxLm8gXA0KPiA+PiA+ICAgICBkaXNwbGF5L2V4dC9pOTE1X3V0
aWxzLm8NCj4gPj4gPg0KPiA+PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUvZGlz
cGxheS94ZV9kaXNwbGF5X21pc2MuYw0KPiA+PiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3Bs
YXkveGVfZGlzcGxheV9taXNjLmMNCj4gPj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+PiA+
IGluZGV4IDAwMDAwMDAwMDAwMC4uODFmZjk3ZTcwNGVhDQo+ID4+ID4gLS0tIC9kZXYvbnVsbA0K
PiA+PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L3hlX2Rpc3BsYXlfbWlzYy5j
DQo+ID4+ID4gQEAgLTAsMCArMSwxNCBAQA0KPiA+PiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogTUlUDQo+ID4+ID4gKy8qDQo+ID4+ID4gKyAqIENvcHlyaWdodCDCqSAyMDIzIEludGVs
IENvcnBvcmF0aW9uICAqLw0KPiA+PiA+ICsNCj4gPj4gPiArI2luY2x1ZGUgImludGVsX2Rpc3Bs
YXlfdHlwZXMuaCINCj4gPj4gPiArDQo+ID4+ID4gK3N0cnVjdCBwY2lfZGV2Ow0KPiA+PiA+ICsN
Cj4gPj4gPiArdW5zaWduZWQgaW50IGludGVsX2dtY2hfdmdhX3NldF9kZWNvZGUoc3RydWN0IHBj
aV9kZXYgKnBkZXYsIGJvb2wNCj4gPj4gPiArZW5hYmxlX2RlY29kZSkgew0KPiA+PiA+ICsgICAv
KiBUb0RvOiBJbXBsZW1lbnQgdGhlIGFjdHVhbCBoYW5kbGluZyBvZiB2Z2EgZGVjb2RlICovDQo+
ID4+ID4gKyAgIHJldHVybiAwOw0KPiA+PiA+ICt9DQo+ID4+ID4gLS0NCj4gPj4gPiAyLjQyLjAN
Cj4gPg0KPiANCj4gLS0NCj4gSmFuaSBOaWt1bGEsIEludGVsDQo=
