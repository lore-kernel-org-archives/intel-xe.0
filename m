Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A01CC07548
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 08:01:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C16EB10E4FE;
	Wed, 15 Nov 2023 08:01:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DEDA10E4FE
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 08:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700035281; x=1731571281;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=TeawKgY3FY08+PndldNSrqFdMjHpGvzmd2T/UyXg91s=;
 b=M5WNwipLZS8dm7z0os2EgRkg/uMNGmDQlLnxYINvWahtKE/CMh20+y8G
 lDYE8PadnOC/GZlFXSsDGxqXJcxhGZ1TTUBf6D3Ovn8qQIX+VFqO/Hf5i
 Rxoezr1dOZrGmeFodoVLYfF9Gw3OiGJ5P4Q5VylUjTgnoI2zn/GwWg5Rn
 h3Gegtu63iFAuvJvWw9jwaZDcdKlk1KEcBrhNntbFiTxsbelm5DRwKU98
 eWo5a3NsV7j1q6N5xrbOK8PEDDlXryZzvC2B7aLYSsdW4SDFL7su/IWXk
 045NWsgTnKb8mi/MQzt9hS15t/OZ4evMrQqboLfkgER50/t1gtipBkuFS w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="3946554"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; 
   d="scan'208";a="3946554"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 00:01:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="741361771"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; d="scan'208";a="741361771"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2023 00:01:13 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 00:01:12 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 00:01:12 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 15 Nov 2023 00:01:12 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 15 Nov 2023 00:01:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cepDclpsgdjgJrkn4GPpNhPT/gZDIs85kSR9mr2qHmYl0FAyNN4kQLwhf2vv3jxlpyN9Qj5DAe1kdf1Oc33k4TCPHllBXYUz1gp7n6c98+7TwnT/kqnwRPVhqfK10kJt/uVJY0P6Ur7JdpjoqDgR9Aj0S3KOhscjHOBTqKGTKKGBImT9wykHFUaIbpRreGbiEZJ0VKkKAQf0jCQAcNsbhhL0daQYxmoi+v/EI5frbzUlJJxW9d/lGcBurTUoWVw+5DAbWa4YBJGF+zEBFPVfYGak2e1k91biGG9PCuqQhTix23NzGah4dG3kUBnqB33Uu5YxDcax7OYgWP5CySngPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TeawKgY3FY08+PndldNSrqFdMjHpGvzmd2T/UyXg91s=;
 b=oEcc9Sba+9rYQc03keQnOeVz8z1e6Frw241kQNamnmYYQiiYP0Jeeb0extESiuAXRg+KyHNLtbooSFI2I3yp6cW22nzoG4Ikq1tIHGhgJ0UFT81ATnrGTWA6bbco3wNHo+TXV+qiC3qLXHLKM30wgr9V7SkwzwkGfrLFy1UlHKLzCqvmVWdVI5LS041FTf3BAxgfcrCuvk11n/WmRkeoZxUTRZPL5Q4egogRhi2bw6gFDAO9i3S+/AE1D9ndSaxCM5R8Xqfj4ZuBVRCbIi+dwC7maZ79FG7Ar/S+VUwbzbAyBYNp0aI0hTrYQnUbajZpUdoJ+67vA9mQa0WojSzLSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 SJ2PR11MB8423.namprd11.prod.outlook.com (2603:10b6:a03:53b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Wed, 15 Nov
 2023 08:01:10 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892%3]) with mapi id 15.20.6977.029; Wed, 15 Nov 2023
 08:01:10 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH v3 0/9] Intel_fbdev.c refactoring
Thread-Index: AQHaF42FGG5JraXvP06TRIrVhp+/IrB7BK2A
Date: Wed, 15 Nov 2023 08:01:10 +0000
Message-ID: <fbb8c8c8700187d21a8dfacead241981f510eeff.camel@intel.com>
References: <20231115063210.3112123-1-jouni.hogander@intel.com>
In-Reply-To: <20231115063210.3112123-1-jouni.hogander@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|SJ2PR11MB8423:EE_
x-ms-office365-filtering-correlation-id: 38074e3d-725f-43f5-03a9-08dbe5b107a0
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V8CRQZDdbi3SBjfY3B2SYvjA/3hXwGtXtjBhf8UtZBuynNNT7C5hKN21SymwsgGhoFx10HZjcPiXfN3u8R/Z0GqQLewrWFBQhB3w3LgJtFRS1gQOAyDqq6v4TqgIiGNb/+OrcATtxD5gdky4u7hr8jWuzgurIDsI9q7Q6pecUZ/MNlxq0UMoRosT+CScns5wWD4xD2Q3Ap55523w9vOYO8Ke8r/+Q+m7Xa8qbaEPXTc8PlM5GaJdVg8SplvubgOaLz0SUqHaW4uwNrQnGMAuTsKXjDd+vGiWwtGqI0AVsd0YQ/avqmbE/JOuMyVCvYj4Bw0IJ4J/nNfI9mDVBilu/tIVknepuZu2vCAhwg4xN99ad+aygvNtJ4JWlxmNr0soeTjNL1EMiR5YDkV8lhwL4OW+Gzi9zEmzF51uxRO5uVqBMM9ap3Se/dItRh5ht8cLAsXXBZx5/TXM3suFqc3U1vhTe7/EsgKgfneL4LbLwCv8eRsfynBLEhx2HiLv0Es7B0J9//c2Wvj6r1+jH2gk/p0i+MoAQwq9wGQq5LRLVU4+/7iTH1mLlSL3G8KcTXnkNQt04iVsgu8h4pZ31dLt+4nQjU2ayrlUO1prSa6R4aA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(39860400002)(376002)(346002)(136003)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(66446008)(91956017)(66556008)(66946007)(316002)(54906003)(76116006)(66476007)(2906002)(83380400001)(6916009)(64756008)(478600001)(26005)(2616005)(71200400001)(4326008)(5660300002)(8936002)(8676002)(66574015)(6512007)(4001150100001)(6506007)(38100700002)(122000001)(41300700001)(6486002)(966005)(82960400001)(86362001)(36756003)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cGdmaHdHSUltNWNDWlZ3SDlnYW0yVHFHWm0ycnpiUXlNa0piZTNyMWdpMlJ5?=
 =?utf-8?B?VDhtTjdGT3VmMitXSm5RZkUzOVN3RldkYmFxSVdybDhzaGtBdWozR3lZQ0pu?=
 =?utf-8?B?Q1E3NEI2VmFrR2Y1c2k2VjR3dmJPR2xoUEZCa2c5UHg3Uko2ek5YaWltSlVv?=
 =?utf-8?B?M0l4SW9OalZIdmFsS2J5eVNOUjRjRU10WkoxTUhYcXZkbUNaemJHREw5QTRN?=
 =?utf-8?B?WUhjUERvdjhTWFJROCs2ei9XNG8vNTh3c200a2duMWRPWXltRU9vdndpa1NW?=
 =?utf-8?B?MUc3bFhTbzZaWlIyeXhqMVF4TTJmUFpYQnd1TUlLS29rM2ZhVjRlMTJGUUNz?=
 =?utf-8?B?WUVaT3RseitKMmx6M0lhb1VPNjRvczRCbmhHNlRtOGN2ZlJwVGc4VFljaFov?=
 =?utf-8?B?N3IvSFc5UVgxRitBeUxvMDc4QXdyTmpsaytrb0dKYURaNVdBUUdyU3F4bkV6?=
 =?utf-8?B?bkVmalhUK2ZhblBHYUlzV2RZSHRGam15T2QyUmFSNlFleXJjQjlzNWdvUHJy?=
 =?utf-8?B?b09EMnF6SlBaQmhyU0xyRnlWcWZaeklheGJvWjVjWGEraFZjOVpudDJXYjdF?=
 =?utf-8?B?Z1JxM295VURxSDB4Nlp0TGhiK28zWkgwRjZVc2NkMC9vdnVPL2VKQ3liQzFQ?=
 =?utf-8?B?dStubzdOU09hdnJNUFRMZjJ4ZXcwVHd1ZElWWUdTRzZCUXBlZ012YnFZUkFQ?=
 =?utf-8?B?MkhjazJOeGwrMnNEU041Z01VMCsveWRMclFmVEYxVXJ6RWg1azFxc2N5OVVI?=
 =?utf-8?B?UXpncG9BYWFrNU5uRkhtcEFyRjFMSkR0YU9oSktZWDNzbkN4WXpLR09qd3dS?=
 =?utf-8?B?VHR1NjVzYVZjODdBZU9UNkFTVGpucG9rUVdCcmVxRlJ2UFdTbTJGaXZsblI3?=
 =?utf-8?B?Q3gvWERXT0ZJbm9LV0w1RjExdWIzd3BHa2dsMm16dGR4OGswR3hoSXVkSDJZ?=
 =?utf-8?B?ejkzNThCdXpKb2dicm9oU0JranRkd05zZTNNdmJQVG9ienZjN3BYNWs2dG9p?=
 =?utf-8?B?V25mUEYzZ1I3T2FaanczWmhaSlZRMlp4SmJ2dTlRRm5QYXU4YzUzejVKODA3?=
 =?utf-8?B?OU02M1RQZmF2amZ4bDBYTytKblRCRWVWL3hMeHdBMXpQMUVBOXlWVGxGTHl3?=
 =?utf-8?B?VHczeldKN2ZvQVVqVXBwQjhTbDAvNkhPM1VISVZyeCt4ZUlHeUQzWThTNXdN?=
 =?utf-8?B?U1lpRldCTzdMZXFORWpLUkNuL3c1TDR5RUlxcnVQVW9MTklxbHRjWnN5cmZU?=
 =?utf-8?B?UVFuaFA0blAvNnI4T05idENEb25MYmIvSFFzdUZBWS9jMGNOdEVtaVRWZy94?=
 =?utf-8?B?TFBuNzhjODA2T2JpTVB2Rm9ydUx4cVRuMFcybXIrSlNXcjRyTkFKY2lnQ2Q1?=
 =?utf-8?B?Q3lyeFhJRUg0ZGtQUTRVYlJ0ZnNFSy9RV2RvMlpGbVA0YWsxVnVhOXRDejY1?=
 =?utf-8?B?aVYrZlcrWHM5ZGVIZHFRVndIdW0wVGNVcTdYYzErcFV2V01jVmhaQThwYXU2?=
 =?utf-8?B?cjA5bVNuQmhLbG5YNUNjQ0tiU0dtWEg2Z3JQbTdFV0lWUWpQdWRXQU9BU1dM?=
 =?utf-8?B?ZUY2SzA4MGJnQU5mMk9OODB5aVZOazlNaFVsdGdVSW5KVmdJdzRuY040RVFK?=
 =?utf-8?B?b09BSU50Wjh1djVVcnFpNURSUjYzalNNV0VtVUdrS0tvRCtLQXBlZnVGZGtp?=
 =?utf-8?B?dWRCdm44NzBXdGlyQ2hxY1hoYnUwbHp0TmJRMkQxMUlLTWxZRjdLTjRYNlQ4?=
 =?utf-8?B?aXUzU2ZhWFZ6TC9jbnIvYlk4dmRoTkxUbkFJZFEyai9kUmdWQUdQa3c4L0dX?=
 =?utf-8?B?cHRGRU84TXY1NitROENubmtLcGl4K1laSW1KeTRqRDhjVkxMaU1FcC83MGRu?=
 =?utf-8?B?NjMvNktrdDgrekdFOUxJZkNhc3pZUDFvM3VMRFFIaEhYQVB4WkFCTDJJTjFM?=
 =?utf-8?B?NWVBdHdtS0ZMUUttM3RYdHh3ODRmSDRXdDg2NU5LOWxNZEV4RUovRllaOHVF?=
 =?utf-8?B?TmJrOVR2azZYQVJwRnlNNk1UUjRMS2t1YUViRS9hdHRpaW44Q2FwOXdvY1ZD?=
 =?utf-8?B?eG9RNWhIYjc1RFVYU1FRRW9zUnZPamtpTkt1dUtUbDdPMlRrbE9XSC9Deklw?=
 =?utf-8?B?UmZGak54cnVZd0RrTGd1d211alBTang5UXZzcFhzZktEVzNtNEQ3RGhjTmxG?=
 =?utf-8?B?Tnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F39DCE354D0F6E40892080C7BD038D11@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38074e3d-725f-43f5-03a9-08dbe5b107a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2023 08:01:10.2915 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EU8k2XtMGlAvw9SK2cTpYmWhlGhK/CSbzrnSxJiQ9iHAZPPLqdhCAugIPNEFAWAErfDndUg8gkUMqZzO1rbjEc+Qtv/qJH/1+hL2+3OoZZo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8423
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 0/9] Intel_fbdev.c refactoring
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

T24gV2VkLCAyMDIzLTExLTE1IGF0IDA4OjMyICswMjAwLCBKb3VuaSBIw7ZnYW5kZXIgd3JvdGU6
DQo+IFRoaXMgcGF0Y2ggc2V0IGlzIHJlbW92aW5nIGFsbCB0aGUgaWZkZWZzIGZyb20gaW50ZWxf
ZmJkZXYuYy4gVGhpcyBpcw0KPiBkb25lIGJ5IHNwbGl0dGluZyBpOTE1IHNwZWNpZmljIGNvZGUg
aW50byBpdCdzIG93biBzb3VyY2UgZmlsZSBhbmQNCj4gc2ltaWxhciBzb3VyY2UgZmlsZSBpcyBj
cmVhdGVkIGZvciBYZSBmb3IgWGUgc3BlY2lmaWMgY29kZS4NCj4gDQo+IFJlbWFpbmluZyBpZmRl
ZnMgYXJlIGRyb3BwZWQgYnkgYWRkaW5nIHNvbWUgY29tcGF0aWJpbGl0eSBoZWFkZXJzLg0KPiAN
Cj4gU29tZSBvZiB0aGUgcGF0Y2hlcyBhcmUgc2ltaWxhciBhcyBpbiBzZXQgZnJvbSBNYWFydGVu
IExhbmtob3JzdA0KPiA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPjoNCj4gDQo+
IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTI2MjAwLw0KPiANCj4g
UGF0Y2hlcyAzIGFuZCA5IGFyZSBzdXBwb3NlZCB0byBiZSBzZW50IHRvDQo+IGludGVsLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcuIExldCdzIGZpcnN0IGFncmVlIGlmIHRoaXMgaXMNCj4gYWNj
ZXB0YWJsZSBzb2x1dGlvbiBmcm9tIFhlIHBvaW50IG9mIHZpZXcuDQo+IA0KPiB2MzoNCj4gwqAg
LSBEbyBub3QgY2hlY2sgSVNfRVJSKGZiKSBhcyByZXR1cm5pbmcgYW55d2F5cyBpbg0KPiBpbnRl
bF9mYmRldl9mYl9hbGxvYw0KPiDCoCAtIEFkZCBTUERYLUxpY2Vuc2UgdGFnDQo+IMKgIC0gUmVt
b3ZlIGFjY2lkZW50YWxseSBhZGRlZCBpZmRlZiBJOTE1DQo+IHYyOiBBZGQgbWlzc2luZyBmb3J3
YXJkIGRlY2xhcmF0aW9ucyBpbnRvIGludGVsX2ZiZGV2X2ZiLmgNCg0KVGhlc2UgYXJlIG5vdyBt
ZXJnZWQNCg0KQlIsDQoNCkpvdW5pIEjDtmdhbmRlcg0KDQo+IA0KPiBDYzogTWFhcnRlbiBMYW5r
aG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IEphbmkgTmlr
dWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+DQo+IENjOiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28u
dml2aUBpbnRlbC5jb20+DQo+IA0KPiBKb3VuaSBIw7ZnYW5kZXIgKDkpOg0KPiDCoCBSZXZlcnQg
IkZJWE1FOiBkcm0vaTkxNS9kaXNwbGF5OiBBbGxvdyBmYmRldiB0byBhbGxvY2F0ZSBzdG9sZW4N
Cj4gwqDCoMKgIG1lbW9yeSINCj4gwqAgZml4dXAhIEZJWE1FOiBkcm0vaTkxNS9kaXNwbGF5OiBS
ZW1haW5pbmcgY2hhbmdlcyB0byBtYWtlIHhlDQo+IGNvbXBpbGUNCj4gwqAgZHJtL2k5MTUvZGlz
cGxheTogc3BsaXQgaTkxNSBzcGVjaWZpYyBjb2RlIGZyb20gaW50ZWxfZmJkZXYNCj4gwqAgZml4
dXAhIGRybS94ZS9kaXNwbGF5OiBJbXBsZW1lbnQgZGlzcGxheSBzdXBwb3J0DQo+IMKgIGZpeHVw
ISBkcm0veGUvZGlzcGxheTogSW1wbGVtZW50IGRpc3BsYXkgc3VwcG9ydA0KPiDCoCBmaXh1cCEg
ZHJtL3hlL2Rpc3BsYXk6IEltcGxlbWVudCBkaXNwbGF5IHN1cHBvcnQNCj4gwqAgZml4dXAhIGRy
bS94ZS9kaXNwbGF5OiBJbXBsZW1lbnQgZGlzcGxheSBzdXBwb3J0DQo+IMKgIGZpeHVwISBkcm0v
eGUvZGlzcGxheTogSW1wbGVtZW50IGRpc3BsYXkgc3VwcG9ydA0KPiDCoCBkcm0vaTkxNS9kaXNw
bGF5OiB1c2UgaW50ZWxfYm9fdG9fZHJtX2JvIGluIGludGVsX2ZiZGV2DQo+IA0KPiDCoGRyaXZl
cnMvZ3B1L2RybS9pOTE1L01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fMKgwqAgMyArLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZmJkZXYu
Y8KgwqDCoCB8IDIwMyArLS0tLS0tLS0tLS0tLS0tDQo+IC0tDQo+IMKgZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9mYmRldl9mYi5jIHwgMTE0ICsrKysrKysrKysNCj4gwqBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiZGV2X2ZiLmggfMKgIDIxICsrDQo+IMKg
ZHJpdmVycy9ncHUvZHJtL3hlL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHzCoMKgIDEgKw0KPiDCoC4uLi9jb21wYXQtaTkxNS1oZWFkZXJzL2dlbS9pOTE1X2dl
bV9tbWFuLmjCoMKgIHzCoCAxNyArKw0KPiDCoC4uLi9jb21wYXQtaTkxNS1oZWFkZXJzL2dlbS9p
OTE1X2dlbV9vYmplY3QuaCB8wqAgMTEgKw0KPiDCoC4uLi9nZW0vaTkxNV9nZW1fb2JqZWN0X2Zy
b250YnVmZmVyLmjCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDQgKy0NCj4gwqAuLi4vZ3B1L2RybS94
ZS9jb21wYXQtaTkxNS1oZWFkZXJzL2k5MTVfZHJ2LmggfMKgwqAgMiArDQo+IMKgLi4uL3hlL2Nv
bXBhdC1pOTE1LWhlYWRlcnMvaTkxNV9nZW1fc3RvbGVuLmjCoCB8wqDCoCA0ICstDQo+IMKgLi4u
L2dwdS9kcm0veGUvY29tcGF0LWk5MTUtaGVhZGVycy9pOTE1X3ZtYS5oIHzCoMKgIDYgKw0KPiDC
oGRyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L2ludGVsX2ZiZGV2X2ZiLmPCoMKgIHwgMTAyICsr
KysrKysrKw0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L2ludGVsX2ZiZGV2X2ZiLmjC
oMKgIHzCoCAyMSArKw0KPiDCoDEzIGZpbGVzIGNoYW5nZWQsIDMxMSBpbnNlcnRpb25zKCspLCAx
OTggZGVsZXRpb25zKC0pDQo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfZmJkZXZfZmIuYw0KPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiZGV2X2ZiLmgNCj4gwqBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3hlL2NvbXBhdC1pOTE1LQ0KPiBoZWFkZXJzL2dlbS9p
OTE1X2dlbV9tbWFuLmgNCj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3hl
L2NvbXBhdC1pOTE1LQ0KPiBoZWFkZXJzL2dlbS9pOTE1X2dlbV9vYmplY3QuaA0KPiDCoGNyZWF0
ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS9pbnRlbF9mYmRldl9mYi5j
DQo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L2ludGVs
X2ZiZGV2X2ZiLmgNCj4gDQoNCg==
