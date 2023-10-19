Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ADCACDB465
	for <intel-xe@archiver.kernel.org>; Thu, 19 Oct 2023 05:36:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33BBB10E011;
	Thu, 19 Oct 2023 05:36:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1795010E011
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Oct 2023 05:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697693800; x=1729229800;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=/VUGbW40pW4zwnljJQ2ezNbsW65YON0bcSjCfMfzNHU=;
 b=ho4slFIf1a6VtbpSZNAmxGz2nRZ9Oifwo3qQOTq1rk1c/1P+U4PeNs6H
 i8OaR3PnYu/mz8BQP8okBX7VeKDvcSNH8rTrUbc7E7q1hJeJZJQNkDw+4
 kIbLsDfZGDNCkFWYcpGpVB70HPJUW9Xi/YSxjkWpc6zQovbehBs5mU0M5
 +RTN5F1lycBSPBz3f5izPoozks15L7a636fkf7W3OEJa5ThZW0xGNSSVF
 Y7IJzCRR8Odhj2X1mUO0Uqyqx9YC7QDmhn8bF1gCyaO4x3owi+ZFiAg3N
 n6Osq6IcFy4G6ok59cZGAKf2MHcjFs11YMuK7Q4azAjHixrx+kaGQPRqx w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="376552433"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; d="scan'208";a="376552433"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 22:36:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="847549421"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; d="scan'208";a="847549421"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Oct 2023 22:36:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 18 Oct 2023 22:36:38 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 18 Oct 2023 22:36:38 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 18 Oct 2023 22:36:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lNrN5vjhP/MVOjj7roZZS58uM2n1SBxsGUXdjv8arVehLQ9BLXLgCFimfuL5X5+WVL05eKfVcl8RIA1VMdoKnmuSbhg9C1OBuE3bfATQt94S9yA8E1OgY6W4WkbK0xftHmmy1Qb0CWsBymZKKThCgqo5kNy8jAmOudVwhFwvc2YgAYh4tlfztmrNyb/5MePi4zb13715aoEB4KemaKHUDrc0SBDavPcjiSyRL87wVPqdLYBsaoo7I41X6I8GKVfx0KBEEl3mdjj1vZuSHD8F5K6o4h1XKnKe8XRTAy52ysPuW6NFiy60yC6JK3erg7SSjef/OvvXtgJVxO7EWHkJrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/VUGbW40pW4zwnljJQ2ezNbsW65YON0bcSjCfMfzNHU=;
 b=bosJTTI93LC+Jw5zSeTPr5calmYAPTfOlu2U8ouSn5m3buBvpsAvwpSMvgXamtaOxZcfbWGDkVzqnwdpGaFplOC7ZaeffA/gXyOpPnLbQ+CipiNREI1tBEMeIOVKG4j3iB4qE4JJ80rJcqEMIh4UsNkH6Lr0H7auwuVGzSHDJoBnAV6BA/dndmGizX42D9WXuG6iAgyzM3O3BuQAfUhs73V2i5p3t8+QR7cZISOXRuQh1gCBK4yzuEJeD8thDQlTABWQqJXCcDKemFoxFBhptgrBu0h/a6jx3en9+UAr8C1z99C5JPW0KWea21fKCPWu+b2Ok3qttbskTyOLxul6VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SA2PR11MB5145.namprd11.prod.outlook.com (2603:10b6:806:113::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.37; Thu, 19 Oct
 2023 05:36:36 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::163d:1c68:1eeb:3514]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::163d:1c68:1eeb:3514%7]) with mapi id 15.20.6907.025; Thu, 19 Oct 2023
 05:36:36 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Welty, Brian" <brian.welty@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH v2 05/10] drm/xe: Notify userspace about GSC
 HW errors.
Thread-Index: AQHaAXa9Yz4Xc9JKUEiCAF6UcmJxa7BQShAAgABOSnA=
Date: Thu, 19 Oct 2023 05:36:35 +0000
Message-ID: <MW4PR11MB705661DB0BF942C87D8CBA75B3D4A@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20231018040033.1227494-1-himal.prasad.ghimiray@intel.com>
 <20231018040033.1227494-6-himal.prasad.ghimiray@intel.com>
 <be063286-ae1e-460c-80f2-89f86485a9c7@intel.com>
In-Reply-To: <be063286-ae1e-460c-80f2-89f86485a9c7@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|SA2PR11MB5145:EE_
x-ms-office365-filtering-correlation-id: c3e27ca6-2618-424c-86ca-08dbd0655c15
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zPZWBQkgrvmdQJH+Mwc+kdgSBLkiitdj5Xfg4NobvUVMR9xi8JlwGgid8KL5Iwk7hH/5fHGShH64m0Kji6sIm88lfB4tuvVk7hO+K4aiDClE38EOzvvJg0OYjm/Ykf0moZ8CcNQ58fh9sF9hYZPiY4vbVDDjFq0E16yNn9vYfskLSb4KvsxMDmjr2b+CG/IYfMcC+Q+GRcauXFPXDBUap71GT0AeHkHtd6vl3ryXY0OyqQz4v5Wyx9HNjSa+JfuOJVXScygjBPwoWjIo2PVg8hG+dN/9T0Pfi8SjtY8i9QTehoLp5lYzEL8pd3OqrnGXd+gL81bP/ryif+ldwFxLqSkyZ8EvYXTXqMG9b6W/OAbHM45seRfQcqKsvr2Ja2ck2JCfSgzFuPDSmALx1Dyvxpy3JSgZZb++6bc2wSuCQm6BDlFA4KUl0sHSkoeZsJA3w7XrkYdw3AztA+MEP9q6S/fc8XaSy0KBQ1NEEdHwJJYgWlD0xupfkl2Q1TXAfkvUxQoMGVVDb6p+e3+JAWIU+UqLME0ONwPxWqP2UMvEyZm4xwwx9AGV2YIAELCu1p1Gh3w6AL0ZpqJl24ZSJ3MUMZuIiTCPZSUD1fJ7J+v+jsQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(39860400002)(346002)(376002)(136003)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(71200400001)(966005)(55016003)(76116006)(64756008)(66946007)(66556008)(66476007)(66446008)(110136005)(478600001)(38070700005)(38100700002)(2906002)(41300700001)(82960400001)(8676002)(316002)(5660300002)(52536014)(86362001)(122000001)(33656002)(8936002)(9686003)(26005)(7696005)(53546011)(83380400001)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WG40U0VmVjFyUDNrN2dScXBsRDFhZTRobzNEancvVm8ySWRaV1dCWVRtT25u?=
 =?utf-8?B?dVd0ck5qdVEvRmgxSTRpYVM0TFh5OFlRUnQzdkdqZkRvaXlGUkdJS1lucGx4?=
 =?utf-8?B?ckVKeVQ5OFhWaXpXNHJoSU4xQUJnM0FBNk4wbU1mOTF5RXR1Y0RRNVh0OUhR?=
 =?utf-8?B?UGZFZTE1MndKUGNrVUtoMFVLQzhETTRoYmdRaGIwM0VVU1FTQ1h0SjRuUElW?=
 =?utf-8?B?b2tHa2ZmWlQrTmF2aER1YzNpSmo4b2l2N25MUmV1R0RoTFBoZE5nRHBBbHps?=
 =?utf-8?B?Wjd2bzdCNEFON2hnZlBGYXdxU25RSklBL3FKc25kMUNMR2xXa2lMMnBpMk9J?=
 =?utf-8?B?cmVzUUtDRWtPUXRnUzBRUG51SkU0VUtWWGZuam11YXYzakRLdThZOU1KR3lo?=
 =?utf-8?B?ZWhyQmdJbGdQWXNlYUFUclpkZ2JXSEtweFZHek10WUxtNWI0S2lPcjFKcnM3?=
 =?utf-8?B?VTYzMW1IRzZURm92NndmRkI0WjVVbDNQZGdDOTRMVWw2ZFFmbzQwVzBuSWt5?=
 =?utf-8?B?N2ppeC92WlFLM2NqWWwxamNyWTN3NktkWDZoSzlTenZ3cWNOcFkwUGNHaUZ3?=
 =?utf-8?B?QzBVandYQjNHU3doK3ZxWnFqMzdSeUpiV2dDS2t3aEl1a0NZSjJwZ2tOblRp?=
 =?utf-8?B?ZjFpZnlLcmRjVHA0Yk9WVFZoN1lJOHJLYXVLOXQyZzVFM0NZUTgwNTN3WC93?=
 =?utf-8?B?dzZ2L2t0MkdqWGpVbW5BU1FQVHhuYkEyMEd4RWhnUkMweTlwL3VZOUdNRkU4?=
 =?utf-8?B?ZFJOb1lKUVROVTcxTXFvRGd1UkJjcnZTY3pMNkVkaTU0a09ySnVUWGNwRE5s?=
 =?utf-8?B?R3RZdkxXY21PaExyN3Iza05uemNZMjFLMlczTHA3SkFWWG4zTXJ5Tnk1cVZt?=
 =?utf-8?B?bnZDdjl2UUxscmc3VFczMDVmMDdSYWM5L0doSGozNkxKdmFjRThDMVRxT0JF?=
 =?utf-8?B?Smx1UlpCbmRFMkQzclZWTXFZTnNhZmZzK1NmS3VjSVA4ditFbDFYT0xBSmtF?=
 =?utf-8?B?RkMwNW8zbEZjcVcrSFdaR08yYmRVWWYwUFRwT0s4SGR1MU0raFlwV1hUNWZX?=
 =?utf-8?B?aUJVQkY5aUJLNVkvK0tWNkRGY3pZbmhxSkpsSlFMVnkxMU81K29sR2gySWti?=
 =?utf-8?B?cEhmTytkcTR0ajdwOUdxTnJSMkRCVFQvWTlwS09IcHpJdXB4bVVXc1JyTWxk?=
 =?utf-8?B?dDNQWjEwRlBJeFRqZlV6WnJ0YVhoZktKQlgvcm1XMUZOWGZwSUZTdFZIbXdB?=
 =?utf-8?B?b2s5c2tmMmp2em50L040OW85c2J4aFZDSllETml5T2FSdS8xTmZqajM5MU5W?=
 =?utf-8?B?NWZ6NnNGMlA5UjFOZy9PcGpGdENaaVk3bUpKdU9FRkw1NTlERjJ2N0p6MGdC?=
 =?utf-8?B?RHh5bkJrc1RQcytZTzkyMTFqa0ZIK0F0RSt4TkdiZVhvZDRBUTZsZHhHZjhJ?=
 =?utf-8?B?MVVXMW1Pd1MzWU9nMkpPNXBzcy9hSktzdWFCZHJhektjM01CNmhia3JsalJy?=
 =?utf-8?B?SjlDdzNDZ214VnZCcytGanEwUmFQM3l1WE5rYnhqOGZTZ0djYzh5UjUzeCsy?=
 =?utf-8?B?Tm9OOFBNZjhiaXRGMUdmNDhZd3hzSFNHSzJxTWdFSENpL1MxQi9ENlZGMmdX?=
 =?utf-8?B?QU5Ja1dmbGZ5K0tkdWxVU0dDUHVIM2FHYS9mSVFOSnBxTk9rcTVoYWM3eFVT?=
 =?utf-8?B?ZFVtSzJKN0JBbWx1VmhEUkVwelgrcy8rUXRMdEhrSmFVYlBNQW5KZDhLQ1pR?=
 =?utf-8?B?aG10QklyS0w5RlNYcUsrR29iQ0JOTmdvNThnZ2Q3V3ZhbEtEcERPU09iQ0xF?=
 =?utf-8?B?WTRhQ0tEaEFpaHBJMWppaGlDaWRwRFg2Nm5pQVRNZWJyUDNrZmo4ajJYOFlV?=
 =?utf-8?B?c2NIdmJRNFNTSzM1MzZEWTJyYXI1L1FzdkdUR1R0QTNFWEpXdzlVK1Q2aU9L?=
 =?utf-8?B?UERqbEkxT1Z3VExEWFdGcTYvS09vT1NuQ3NjL2hQVG1HYU9CdXg5MXFSQ1l1?=
 =?utf-8?B?Qkd3bzlISk5aTlJ2TWtweWU3Nk9FME9lbUVadklwNkFuTkVBUlMrd3pqeTNj?=
 =?utf-8?B?SldwQWNkZUk1b1hzZStXei9GSTkwQkVqYVZMMTNRWUJZclRUbzhlcEJmRUl2?=
 =?utf-8?B?UXYvVG1uTzNOS09wVlBHSmNXWHNvNXZjMkx2UDk1V2V2VHMwdkVVdVp1WENj?=
 =?utf-8?B?QXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3e27ca6-2618-424c-86ca-08dbd0655c15
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2023 05:36:35.8111 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HFRTanJczwIUL+zUgeezI09jbXxnlATFvQXxAj6xkTOQeeIdGjX7l/Hd6tKc1InvJiMSqwjDCtamwZYYOKJkGm3qKjB6Wwk9kigodOs73wY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5145
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 05/10] drm/xe: Notify userspace about GSC
 HW errors.
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

SGkgQnJpYW4sDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogV2VsdHks
IEJyaWFuIDxicmlhbi53ZWx0eUBpbnRlbC5jb20+DQo+IFNlbnQ6IDE5IE9jdG9iZXIgMjAyMyAw
NjoyMg0KPiBUbzogR2hpbWlyYXksIEhpbWFsIFByYXNhZCA8aGltYWwucHJhc2FkLmdoaW1pcmF5
QGludGVsLmNvbT47IGludGVsLQ0KPiB4ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVj
dDogUmU6IFtJbnRlbC14ZV0gW1BBVENIIHYyIDA1LzEwXSBkcm0veGU6IE5vdGlmeSB1c2Vyc3Bh
Y2UgYWJvdXQgR1NDDQo+IEhXIGVycm9ycy4NCj4gDQo+IA0KPiANCj4gT24gMTAvMTcvMjAyMyA5
OjAwIFBNLCBIaW1hbCBQcmFzYWQgR2hpbWlyYXkgd3JvdGU6DQo+ID4gU2VuZCB1ZXZlbnQgaW5j
YXNlIG9mIG5vbmZhdGFsIGVycm9ycyByZXBvcnRlZCBieSBnc2MuDQo+ID4NCj4gPiB2Mg0KPiA+
IC0gTm8gbmVlZCB0byBwcm92aWRlIHRpbGUgaW5mbyBpbiB1ZXZlbnQgYmVjYXVzZSBlcnJvciBp
cyBhY2NlcHRlZA0KPiA+IG9ubHkgaW4gdGlsZTAuIChBcmF2aW5kKQ0KPiANCj4gVGhpcyBpcyB1
c2VyIEFQSS4gIERvbid0IHdlIG5lZWQgdG8gZGVtb25zdHJhdGUgdXNlci1zcGFjZSBjb25zdW1l
ciBvZiB0aGlzDQo+IGJlZm9yZSBtZXJnZT8gIERvIHdlIGF0IGxlYXN0IGhhdmUgSUdUPyAgQWxz
byBzZWUgcXVlc3Rpb24gYmVsb3cuDQoNCmh0dHBzOi8vb25lLWFwaS5naXRsYWItcGFnZXMuZGV2
dG9vbHMuaW50ZWwuY29tL2xldmVsX3plcm8vc3lzbWFuL2FwaS5odG1sI19DUFB2NDQxWkVTX0VW
RU5UX1RZUEVfRkxBR19ERVZJQ0VfUkVTRVRfUkVRVUlSRUQgaXMgdGhlIGNvbnN1bWVyIGZvciB0
aGlzIHVldmVudC4NClRoZSBoYXJkd2FyZSBlcnJvciBpbmplY3Rpb24gdmlhIElHVCBpcyBub3Qg
cG9zc2libGUuIEl0IGV4cGxpY2l0bHkgbmVlZHMgcHl0aG9uIFNWIGFuZCBJVFAuDQo+IA0KPiA+
DQo+ID4gQ2M6IEFyYXZpbmQgSWRkYW1zZXR0eSA8YXJhdmluZC5pZGRhbXNldHR5QGludGVsLmNv
bT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBIaW1hbCBQcmFzYWQgR2hpbWlyYXkgPGhpbWFsLnByYXNh
ZC5naGltaXJheUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0veGUv
eGVfZGV2aWNlX3R5cGVzLmggfCAgMyArKysNCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9o
d19lcnJvci5jICAgICB8IDE2ICsrKysrKysrKysrKysrKysNCj4gPiAgIGRyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9od19lcnJvci5oICAgICB8ICAzICsrLQ0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2lycS5jICAgICAgICAgIHwgIDQgKysrKw0KPiA+ICAgaW5jbHVkZS91YXBpL2RybS94ZV9k
cm0uaCAgICAgICAgICAgIHwgIDggKysrKysrKysNCj4gPiAgIDUgZmlsZXMgY2hhbmdlZCwgMzMg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaA0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2RldmljZV90eXBlcy5oDQo+ID4gaW5kZXggMjk5OGVlNTE3ZjBkLi5kMmVlNTU0OWQyMGMg
MTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oDQo+
ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oDQo+ID4gQEAgLTE5
Niw2ICsxOTYsOSBAQCBzdHJ1Y3QgeGVfdGlsZSB7DQo+ID4gICAJc3RydWN0IHRpbGVfaHdfZXJy
b3JzIHsNCj4gPiAgIAkJc3RydWN0IHhhcnJheSBod19lcnJvcjsNCj4gPiAgIAl9IGVycm9yczsN
Cj4gPiArDQo+ID4gKwkvKiogQGdzY19od19lcnJfd29yazogd29ya2VyIGZvciB1ZXZlbnQgdG8g
cmVwb3J0IEdTQyBIVyBlcnJvcnMNCj4gKi8NCj4gPiArCXN0cnVjdCB3b3JrX3N0cnVjdCBnc2Nf
aHdfZXJyX3dvcms7DQo+ID4gICB9Ow0KPiA+DQo+ID4gICAvKioNCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2Vycm9yLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9od19lcnJvci5jDQo+ID4gaW5kZXggMWU5NGVlNzJhMzRmLi45YWM4MTdjMWRkMDMgMTAw
NjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2Vycm9yLmMNCj4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZXJyb3IuYw0KPiA+IEBAIC0zLDYgKzMsOCBAQA0K
PiA+ICAgICogQ29weXJpZ2h0IMKpIDIwMjMgSW50ZWwgQ29ycG9yYXRpb24NCj4gPiAgICAqLw0K
PiA+DQo+ID4gKyNpbmNsdWRlIDxkcm0veGVfZHJtLmg+DQo+ID4gKw0KPiA+ICAgI2luY2x1ZGUg
InhlX2h3X2Vycm9yLmgiDQo+ID4NCj4gPiAgICNpbmNsdWRlICJyZWdzL3hlX3JlZ3MuaCINCj4g
PiBAQCAtMzg3LDYgKzM4OSwxOSBAQCB4ZV9ndF9od19lcnJvcl9oYW5kbGVyKHN0cnVjdCB4ZV9n
dCAqZ3QsIGNvbnN0DQo+IGVudW0gaGFyZHdhcmVfZXJyb3IgaHdfZXJyKQ0KPiA+ICAgCQl4ZV9n
dF9od19lcnJvcl9sb2dfdmVjdG9yX3JlZyhndCwgaHdfZXJyKTsNCj4gPiAgIH0NCj4gPg0KPiA+
ICt2b2lkIHhlX2dzY19od19lcnJvcl93b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykgew0K
PiA+ICsJc3RydWN0IHhlX3RpbGUgKnRpbGUgPSBjb250YWluZXJfb2Yod29yaywgdHlwZW9mKCp0
aWxlKSwNCj4gZ3NjX2h3X2Vycl93b3JrKTsNCj4gPiArCWNoYXIgKmNzY19od19lcnJvcl9ldmVu
dFszXTsNCj4gPiArDQo+ID4gKwljc2NfaHdfZXJyb3JfZXZlbnRbMF0gPSBYRV9HU0NfSFdfSEVB
TFRIX1VFVkVOVCAiPTEiOw0KPiA+ICsJY3NjX2h3X2Vycm9yX2V2ZW50WzFdID0gIlJFU0VUX1JF
UVVJUkVEPTEiOw0KPiA+ICsJY3NjX2h3X2Vycm9yX2V2ZW50WzJdID0gTlVMTDsNCj4gPiArDQo+
ID4gKwlrb2JqZWN0X3VldmVudF9lbnYoJnRpbGUtPnhlLT5kcm0ucHJpbWFyeS0+a2Rldi0+a29i
aiwNCj4gS09CSl9DSEFOR0UsDQo+ID4gKwkJCSAgIGNzY19od19lcnJvcl9ldmVudCk7DQo+ID4g
K30NCj4gPiArDQo+IC4uLg0KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL3hlX2Ry
bS5oIGIvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiA+IGluZGV4IGQ0OGQ4ZTNjODk4Yy4u
MDZmNmZjZTE1MzFkIDEwMDY0NA0KPiA+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgN
Cj4gPiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+ID4gQEAgLTE2LDYgKzE2LDE0
IEBAIGV4dGVybiAiQyIgew0KPiA+ICAgICogc3ViamVjdCB0byBiYWNrd2FyZHMtY29tcGF0aWJp
bGl0eSBjb25zdHJhaW50cy4NCj4gPiAgICAqLw0KPiA+DQo+ID4gKy8qKg0KPiA+ICsgKiBET0M6
IHVldmVudCBnZW5lcmF0ZWQgYnkgeGUgb24gaXQncyB0aWxlIG5vZGUuDQo+IA0KPiBXaGF0IGRv
ZXMgJ3RpbGUgbm9kZScgbWVhbj8gIElmIEknbSBub3QgbWlzdGFrZW4sIGlzbid0DQo+IHRpbGUt
PnhlLT5kcm0ucHJpbWFyeS0+a2Rldi0+a29iaiBqdXN0IHRoZSBkZXZpY2Ugbm9kZT8NCk1pc3Mg
ZnJvbSBteSBlbmQuIEl0IHNob3VsZCBiZSBkZXZpY2Ugbm9kZS4NCj4gDQo+ID4gKyAqDQo+ID4g
KyAqIFhFX0dTQ19IV19IRUFMVEhfVUVWRU5UIC0gRXZlbnQgaXMgZ2VuZXJhdGVkIHdoZW4gR1ND
IHJlcG9ydHMNCj4gSFcNCj4gPiArICogZXJyb3JzLiBUaGUgdmFsdWUgc3VwcGxpZWQgd2l0aCB0
aGUgZXZlbnQgaXMgYWx3YXlzDQo+ICJSRVNFVF9SRVFVSVJFRD0xIi4NCj4gPiArICovDQo+ID4g
KyNkZWZpbmUgWEVfR1NDX0hXX0hFQUxUSF9VRVZFTlQgIkRFVklDRV9TVEFUVVMiDQo+IA0KPiBT
byBib3RoIFhFX1JFU0VUX0ZBSUxFRF9VRVZFTlQgYW5kIFhFX0dTQ19IV19IRUFMVEhfVUVWRU5U
IGFyZQ0KPiBkZWZpbmVkIGFzICJERVZJQ0VfU1RBVFVTIi4gIFNob3VsZCBiZSB1bmlxdWUgb3Ig
aXNuJ3QgdGhpcyBnb2luZyB0byBiZQ0KPiBjb25mdXNpbmcgdG8gdGhlIHVzZXIgcmVhZGluZyB0
aGVzZSBldmVudHM/DQoNClRoZSB2YWx1ZXMgcHJvdmlkZWQgYXJlIGRpZmZlcmVudCBhbmQgdWV2
ZW50cyBhcmUgb24gZGlmZmVyZW50IG5vZGVzLiANClhFX1JFU0VUX0ZBSUxFRF9VRVZFTlQgaXMg
YXQgcGNpIG5vZGUgb2YgeGUgZGV2aWNlIHdoZXJlYXMgWEVfR1NDX0hXX0hFQUxUSF9VRVZFTlQN
CklzIGF0IGRldmljZSBub2RlLg0KDQpCUg0KSGltYWwgDQo+IA0KPiAtQnJpYW4NCj4gDQo+IA0K
PiA+ICsNCj4gPiAgIC8qKg0KPiA+ICAgICogRE9DOiB1ZXZlbnQgZ2VuZXJhdGVkIGJ5IHhlIG9u
IGl0J3MgcGNpIG5vZGUuDQo+ID4gICAgKg0K
