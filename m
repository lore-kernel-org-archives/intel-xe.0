Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E37BC4167B
	for <intel-xe@archiver.kernel.org>; Mon,  4 Dec 2023 08:34:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C71E210E06D;
	Mon,  4 Dec 2023 08:34:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 439CA10E06D
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Dec 2023 08:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701678852; x=1733214852;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TzoA2GPTPDRUVIC9r4jxHW1by+W6uKXiunTIc+zLijc=;
 b=QcgSG6U45JVkkg34hmveITMdCAKrl0mqs/ZiOStRURTkDUqTn0oIlkyI
 8x2yBAlXvq1pG4lExacU3H1hi47xisIyihhoqLuN+VO0W/JPhFKNyR7Zn
 /OHcfGZ+ybgOv9xPLjXGLlxYg1eS9V9ucArCkMX5Jb66G1wXvW2FjB6Nb
 cCLgNxr2QkADecihhTOcFPa8J+urLF4NtqxN5r9wUqcpbSbajSvpSgLpU
 zxH0ds8c019jyOidhJB4ziKdNNprNcS4GvH9Bvf//zuT9WFfOd/yp1f13
 tb/leIObt3ZjOjx6dFnIUBNXUqlovdx78eFYVt3PyO72MT4hQKs3uE/+a w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="424866389"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; d="scan'208";a="424866389"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 00:34:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; d="scan'208";a="11886703"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Dec 2023 00:34:09 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Dec 2023 00:34:08 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 4 Dec 2023 00:34:08 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 4 Dec 2023 00:34:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KGTSu7jEk7fhttpZhjI7ITh/4jTIw/rJoccJyIRJk6wgZCwz4TwTyAU/Ise1S4X+kvDVw6Jwjtg5QvhA1qTADGVnYS1OopNAwjqBr7nlg6XiYEEnP4+ScShvmU/Jmd+4Cd5gboJVXYvAE7TvPoI1Eb36a2OrlEgWQAQMhbeKbhbpW0hmUw4f+q0VCDrwLCpzkZXXDmw+fqjB7xH4G/f+5LHZAsZisV7F/gS7EFOrnML5c/fqApM8pwXLCvTNJrDO68JrEmoj6ZJHQJ8IPdauD6RPdeul/ptnXok0opuOkx8bhAWfNOjKN6xfkphtMHdtgyL3EhVkniyRj42pCOtlbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TzoA2GPTPDRUVIC9r4jxHW1by+W6uKXiunTIc+zLijc=;
 b=Re+O96yNv5GwdfZn30kFN6Pm4lJAAyniD4VZxlgi0Ez9JFVbPcmQCZZH1rryCr+p97jM2a9Uo2XStS/6guqQ7Nfd/gjTSn8fnmXy7U8+tRbr67FkbWCsOJQ8JHZnpg0oiVaA6vhqmAcYjYgbq1PANtsA6Oo1Gxxh6NkvfVFNhWB8YuS4mYXUg0zSN8kYpvFslrDBAppBeJjD/vxVK7oeHsIRAELgUmSq5hOSM8BIPxjt2pQCYr3wdzQWIIwanwr77tpvcUIuqVAGWe1SLIlNkwlNF6TFJXO+Pajh/hi2U7u9ShqSF0Blpl171j5octce0joykYr8NVJfw+MhPV+VjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6344.namprd11.prod.outlook.com (2603:10b6:930:3b::6)
 by PH7PR11MB6747.namprd11.prod.outlook.com (2603:10b6:510:1b5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 08:34:05 +0000
Received: from CY5PR11MB6344.namprd11.prod.outlook.com
 ([fe80::d720:57b4:c6ef:ddd8]) by CY5PR11MB6344.namprd11.prod.outlook.com
 ([fe80::d720:57b4:c6ef:ddd8%4]) with mapi id 15.20.7046.033; Mon, 4 Dec 2023
 08:34:05 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH 0/4] Backport fbdev Xe preparation patches from drm-tip
Thread-Index: AQHaJGyh1lem2Mf2a0+/A9po9BisLrCY0CeQ
Date: Mon, 4 Dec 2023 08:34:04 +0000
Message-ID: <CY5PR11MB634475A54F321D670BD0E8E6F486A@CY5PR11MB6344.namprd11.prod.outlook.com>
References: <20231201153923.3433110-1-jouni.hogander@intel.com>
In-Reply-To: <20231201153923.3433110-1-jouni.hogander@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6344:EE_|PH7PR11MB6747:EE_
x-ms-office365-filtering-correlation-id: 0b305a93-1cbf-413a-59b4-08dbf4a3c63c
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iSC5fv2NAUIrTquzQOFifhmALDFPamRyhCk2SH2XGOBsXdEVFJZ15ov5dlIOvcZHrHD3jqTf8xZ7HtwY3QOkaYVy1Mmbo/3777hk6QKiySIBXMXYMVvudRFB2klTr3bCbLhl7MkxRRYlqfmU5RspcB7CHGzOlKjGu2y0/4JuQ9vrqHtFV7rR9vqUZixGVsmNbqcsRfPfWEZyFYCfhWlJeVtbfKUpnT9IovKxmeAJE8Gk4Pl55LjJ/qyKJyzK2Yr2vEW29gp+PoBhw/mdrIDur9ehCb0UKG4hcvJ8vt9BMJHwVlBlbofFJO5p/LBWInXgF2eYIwJeIk8utJS0RT8G/1DPp/SN6KMH2kJsxvQsxHfzrCJVEFrg8fb2EffPZkJl9O+xfCI3sNz4ydVe5Kc8cpnQHeqWVKThmujqHk0LX5IwbS9Dj+rHMSpEFEERYwu4pen3Mf+iZ/CQxNCu1yq42wbpkfS8AdqvxEX8jWXpiJ0rgooSJFMXXOOyygyApFgF6/qV5CC3i0GWEKbG0vZWRCghENezY2lO/thXeQTBA58hegee1egZglP0gJiyP8i1tKolFPq2h4dEN3Db/rN9mxZA4oNwbQ+pcQPREjsBSKbHEoOfUpyNwMzx8vbXNu8X
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6344.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(376002)(396003)(346002)(39860400002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(66446008)(64756008)(54906003)(66556008)(316002)(66476007)(8936002)(86362001)(8676002)(4326008)(52536014)(478600001)(110136005)(76116006)(66946007)(41300700001)(4744005)(2906002)(5660300002)(33656002)(38070700009)(122000001)(9686003)(7696005)(6506007)(26005)(71200400001)(53546011)(83380400001)(82960400001)(38100700002)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RzVPR2ZpYnhrelBtd1I0YmZhQ1N2U0srUTJmSk16aWVnbkN3V1V3djhzdzY1?=
 =?utf-8?B?b2J1WENaa1dVemthb0dpOTNaZjMxc1UvdnJiM1orOUpPeHQ0em1FcFFobVQv?=
 =?utf-8?B?NDFuS2E4WXJQL1Vkb3I2a2g1NTN3YnB0MEdNajU1VXlUWjBabHFzclRsS2lW?=
 =?utf-8?B?R1VaL3o0dURuRFNnSS8zKzZPTmwzVEFXSTNpNFVxejE4blBRNzV2U2IzZktY?=
 =?utf-8?B?aHFZY1lXSi83S3A4QjZTK25sUGJVYnRNbThqYlhZQ043M0ttc3I5YjhBZHd0?=
 =?utf-8?B?SUNkM1BXTFE3TCsyS0Q0RGZMY1dyYmZ2V2t3ZUd1MWJJbDVNV1BBM21LMzBI?=
 =?utf-8?B?cGNZNnlTMTUwd2t2UUtXa29IMm5ySDZTTDI2S21KLzBuMVNrclpkVnpTa1Fw?=
 =?utf-8?B?QWEyalBtVzRCdVQwQ0FSTjZvZWxGU1FmYjJueWo4Tm1oek9vT2ZHa0ZSOHNn?=
 =?utf-8?B?akJERGRvSUtINlRVK3R5bG54VUZkNnQ1dkVqSVpDSXl2amZObDE3bksrNEx3?=
 =?utf-8?B?UWJCeUlDZ3lHN1BRY1JhZDdQLzZVRnowYUJidmtVa29JTitDMG9vYUgrWFhw?=
 =?utf-8?B?bXg1a1l6V2dhZHR6ejVaYnRkbEs1aG1Rb05ZZmdqK1FneCtheTJoR3VJbHZN?=
 =?utf-8?B?YWRFaTBaYmFQVWZTcHpaekgyNi81bkFIU1lkSE9lUzgvcHpBNDBpYVR1bmJi?=
 =?utf-8?B?NDdkdmFDWmp4TWszZnNHQjFaeitpYklRN0xkTE03OVBmM2NpYlBVNDRqTDEv?=
 =?utf-8?B?bkoxaWdKZ0tOTmJlVnZlVExBeXcyRVZIeXZPWENvV29HU3dtZVpTYkZvc1J2?=
 =?utf-8?B?R2o3azAzLzJ3dkJyVnpkeSs3T0hUbFZCWW5UcXA0N2QrT2g1blV2KzVGMGY5?=
 =?utf-8?B?ZmxGUEhVenY1eVhhQXpkbzFyaGY5NnVlUmhmSUdXWDlpWFNjakx3bzVpRDB6?=
 =?utf-8?B?MENNTWYxdFBNM3JvZVFXWmhOZGQ0SXFaR252cmtiR1hRUlRrUFRXKzZpZ3Nv?=
 =?utf-8?B?Sk1FNkI1NUY2L213NzRPTzQ2RzdPZnN0MktKeEhCMnNZMUdLSVdZbHE0VVF3?=
 =?utf-8?B?NHVEajNhQzVEa3UrTzhpREZ2bzBmUEZpMUxVc1U2SmZJNVpYMTJ3WnlzYWdD?=
 =?utf-8?B?QXQzTlJOTEtlUkE1Y0NmcGZCT2hTL0xQOW5CeUkxMG1sZkVuMk9qb1lrdTMw?=
 =?utf-8?B?QlI5S1Q4eU52Z3U1NTc2R1hGYU9LNmtVZmZVbkdvRUJQUnYvT0ZCblhOVzhG?=
 =?utf-8?B?bFAxUStGVm1BbTYrUVc4VXlIRlh4cEJKaWQ2ZG1lUmxJNFoweWxzQ3paL3lC?=
 =?utf-8?B?VmRJZ05sSlQ5SStFNDRObUNYV0FHVCtPdVdFby9kcW5IZ0MyRC80Y2F4MnNx?=
 =?utf-8?B?SnNneUVNY1VLcndQMUpJZFQveURZY296dkdXU2tvM0RBcUlpeDI4ci8rT0V0?=
 =?utf-8?B?UDR5cWEvWHAwQy9Ydk5QS1RwanRobmlVUjVHR1I5Z3NDM0puRnZRbkI3cmFq?=
 =?utf-8?B?TWxybXU3TWJtQlAyL1JJTmRQalYzb2VMMnpFSFpQNWRxUlVTS0kvS0s0M2xY?=
 =?utf-8?B?VGlYTVhaQUtsZDFkdk1ZcGphcWJTWGVaWUd0MmJqUXJZSDNYeFdWZmtYWXNi?=
 =?utf-8?B?VEVUVUZOdHFyTFJudEs1YnJzWVBNd3k5ZWtlUnQrZVNCeEt0ejFMUHZtaTNE?=
 =?utf-8?B?SmJBT0xHOU5DeFlRWDRlWnpMak9hdFlSNHZrVVRJbjNDMTZaT2FtWUtkWExa?=
 =?utf-8?B?ajd3QkNDUldua21NWmFOY2xnWFdFdGZCemU3NzJEVmpKWjJJZVV4MndVL1B1?=
 =?utf-8?B?Uyszc1A2R3hKYWR1QUx4QmJOYW5aazJTZ2Z0LzNzUXlna2k1QTlYb2hhY3Fz?=
 =?utf-8?B?U2ZmNmpheHRRSUZCT2RGVldQODBadUVoeW0zM2dMOTR6c3pSUUhkVFJiQTBn?=
 =?utf-8?B?WXNGZnpNSXJXQ2VzVnpYdDdibjZkMnNqeW54aXptcHVrZmdZWFh2cU41NHdw?=
 =?utf-8?B?UGYxK2RCUmw0VlkvMHVQRlozWWFJVUNxbkduRko3d3JsWng0NzVzUmU5MmtK?=
 =?utf-8?B?WVdncDBZamdSU0VvVVhkcmIwRE53Rmltd3A0SENpTlpGcFNtZCtyTmZSVzNj?=
 =?utf-8?Q?Rhr3msSM6dlYCrvtLd7+nB5KV?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6344.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b305a93-1cbf-413a-59b4-08dbf4a3c63c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2023 08:34:04.5542 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ilbs5bRHNx7s00rTrDLqyNLFOE7eZNDp2sAa/zGs7X08gCEmXx54K6WNi4Q7zvMMQi/hq5kUOcZCDFe81KUsDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6747
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/4] Backport fbdev Xe preparation patches
 from drm-tip
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSG9nYW5kZXIsIEpvdW5p
IDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQo+IFNlbnQ6IEZyaWRheSwgRGVjZW1iZXIgMSwg
MjAyMyA5OjA5IFBNDQo+IFRvOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6
IEhvZ2FuZGVyLCBKb3VuaSA8am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPjsgVml2aSwgUm9kcmln
bw0KPiA8cm9kcmlnby52aXZpQGludGVsLmNvbT47IE5pa3VsYSwgSmFuaSA8amFuaS5uaWt1bGFA
aW50ZWwuY29tPjsgU2hhbmthciwgVW1hDQo+IDx1bWEuc2hhbmthckBpbnRlbC5jb20+OyBNYWFy
dGVuIExhbmtob3JzdA0KPiA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPg0KPiBT
dWJqZWN0OiBbUEFUQ0ggMC80XSBCYWNrcG9ydCBmYmRldiBYZSBwcmVwYXJhdGlvbiBwYXRjaGVz
IGZyb20gZHJtLXRpcA0KPiANCj4gUmV2ZXJ0IGxvY2FsIGZiZGV2IGk5MTUgY2hhbmdlcyBhbmQg
YmFja3BvcnQgc2FtZSBwYXRjaGVzIGZyb20gZHJtLXRpcC4NCg0KQWNrZWQtYnk6IFVtYSBTaGFu
a2FyIDx1bWEuc2hhbmthckBpbnRlbC5jb20+DQoNCj4gQ2M6IFJvZHJpZ28gVml2aSA8cm9kcmln
by52aXZpQGludGVsLmNvbT4NCj4gQ2M6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5j
b20+DQo+IENjOiBVbWEgU2hhbmthciA8dW1hLnNoYW5rYXJAaW50ZWwuY29tPg0KPiBDYzogTWFh
cnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4NCj4gDQo+
IEpvdW5pIEjDtmdhbmRlciAoNCk6DQo+ICAgUmV2ZXJ0ICJkcm0vaTkxNS9kaXNwbGF5OiB1c2Ug
aW50ZWxfYm9fdG9fZHJtX2JvIGluIGludGVsX2ZiZGV2Ig0KPiAgIFJldmVydCAiZHJtL2k5MTUv
ZGlzcGxheTogc3BsaXQgaTkxNSBzcGVjaWZpYyBjb2RlIGZyb20gaW50ZWxfZmJkZXYiDQo+ICAg
ZHJtL2k5MTUvZGlzcGxheTogc3BsaXQgaTkxNSBzcGVjaWZpYyBjb2RlIGZyb20gaW50ZWxfZmJk
ZXYNCj4gICBkcm0vaTkxNS9kaXNwbGF5OiB1c2UgaW50ZWxfYm9fdG9fZHJtX2JvIGluIGludGVs
X2ZiZGV2DQo+IA0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9mYmRldi5j
ICAgIHwgNiArKystLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZmJk
ZXZfZmIuYyB8IDMgKystDQo+IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZmJk
ZXZfZmIuaCB8IDIgKy0NCj4gIDMgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA1IGRl
bGV0aW9ucygtKQ0KPiANCj4gLS0NCj4gMi4zNC4xDQoNCg==
