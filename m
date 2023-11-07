Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9423C4332F
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 13:19:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B6AE10E04C;
	Tue,  7 Nov 2023 13:19:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A84FA10E04C
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 13:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699363175; x=1730899175;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=enmX4oEK5JFUXoGoewJ4TcyGq0ix3bS5yIg83DW8ftU=;
 b=YT1OzxSOLKQGEcobxDcaThGHqxDp04Y7akydbq8JgpPZZlNpRPeK1gH3
 nv8y5gdlPEGSPRLyMqxJv7OFrm4vSgja6o+0Zwq5qO7bDeAU4wUeTTPyv
 cGQmrZlMNadnVPaTC6AYX/iG1maCRonxBhZrjqZC+KDFNKUAuNxtiF32e
 2UQpPe6fkJLiS7uwnzv8ApL5z2RkEIjoERR1N1HXyOExmHbp+iXiYJNPo
 kOvRfmMiiaNJJ8DevYAYgbSA5/yjvN040ne8+75aB4tfmRDLrHk2pRa8Z
 g6bFX+udXXcsgKWIbTlgBqitryc89G7fhA8CnxP4qZqDPVTZjjnQKSDFA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="453818972"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; d="scan'208";a="453818972"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 05:19:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="906421541"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; d="scan'208";a="906421541"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2023 05:19:34 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 05:19:33 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 05:19:33 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 7 Nov 2023 05:19:33 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 7 Nov 2023 05:19:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UTTGNF3wHxdQGQ+DiBuI10e8CTCVpXpFHLzMHcF4/hwuEOfQ/iIztc8TvYHXfvLWS0ugunJwBs9bGI5PaHyVUeiFN8Ku0pp0L/8PO8eZ3jV5Am9qTDvLYpmrsdTPSXFy22uDAejIaxUtmpuyzZK+kK688MPQWRpG20XxDkSchDo5BmVLeQB75vLhFos71d5hd4dvi8SCX2F7YAGUoId0RHpfsIfwnLrK1Vj4kOafVM5smo+YlwNvkjuABlbYRC/a4gXFkn4/zTBYW4NEf+s5yqorY4H9LlYLrhX2FjOCdD/Lebzz1QOg/RxSrbSXVBJ17AxxTrHO2VjpM56yRAwgKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=enmX4oEK5JFUXoGoewJ4TcyGq0ix3bS5yIg83DW8ftU=;
 b=KV6oGBJVLbE24e8ue3ntRA5AbrOmMMR6jB/ow5yI2ZWoHSwQUaddctVEzgVH7S7wX/RRDRiG+ajkBbVvohg2dg//tbCeI3slhoRjUjQ4u0NnErHP5CIp8Rdlpg6NN8ElfkWpNXAnJvVmRdumubiXTKH7ImuUNEq3D3myZ3yTm/FKil66Lw7NBiXyE3SEOF3eBNEW/bsYJZTe6L68AuiOWWQXKrSWBxHfJMCyAcCAmHKn2NMXEJdoe/240+g2VFoLWLThIXJDE0fA3+HW7Ub4zCRqcz8pq7SXnORvXYP0RS6UXvsDETI/7z4mnEEtU71zek/VCryO9u+tXKBEXzS5hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 CY5PR11MB6413.namprd11.prod.outlook.com (2603:10b6:930:37::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.28; Tue, 7 Nov 2023 13:19:29 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892%3]) with mapi id 15.20.6954.029; Tue, 7 Nov 2023
 13:19:29 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>
Thread-Topic: [Intel-xe] [PATCH 1/8] fixup! drm/xe/display: Implement display
 support
Thread-Index: AQHaEH1TsgWvsQXqMkOBSK9WZEoDR7Bu0j4AgAAG2IA=
Date: Tue, 7 Nov 2023 13:19:29 +0000
Message-ID: <6ceb3cddd14ae64e2955c9a4bdf2b37c4d93dc89.camel@intel.com>
References: <20231106064834.161647-1-jouni.hogander@intel.com>
 <20231106064834.161647-2-jouni.hogander@intel.com>
 <87y1f9yb8d.fsf@intel.com>
In-Reply-To: <87y1f9yb8d.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|CY5PR11MB6413:EE_
x-ms-office365-filtering-correlation-id: 794482fb-bb54-4bdf-f826-08dbdf942c82
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DFmjh3UG8p3CMifJjXzdJrgFB8FkU0mydfD1kU1aQjV12zIJV2CZbHjUHgyIFWosUpZvCilgqkoSZvfZ4X9RpMKTLI72++A0krVdA33VLsuZtgZ86XRuOoNyaxcj1ooTrPrQ0w2S2HJqPoN9w3RwsMut8dgudjMFsuWrHwK4EMnUCmx1IJw3biDTfGml68sSfTNycmxDdpFXN9K0u78nULIHB7Qf7O0Q+yEJgXnMtqzsWmB1BYMcCnjjhjE3oxvizZEAQfZj69VVNTkMDx7Y58dvFdfhh0ugz5ArfXQqgTsNzXjGBRUiMc0tkgDkI5xSOXYqmDzXeprvfn3jRsvRsws3uKDhPUuplUTYiNkiZ9B143mFG4OYpAMXwhsnx7nVXDuTgad778a+x5/DrT0nSTJzwUcB3xHCTEyMUDH+BfDFUGSluCiUVl+45vQFvdaAdybH/TXWAXOmZswD9HEwrinpZpaOlP3C7GftzzbKkzIMowS735cfy4xgN06pOC4UlZCJLB+0lm6/YsWkQhQJs5xQNWRsthc5FvSch7SLZF79YeOeUK+NH+OnxPqXeg3r4YMLhvepuBigvNGJ6YcnM7avflo4sL6p04QGH2UprQ8IXLYocwAcApUANNIKDqV2
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(346002)(39860400002)(136003)(376002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(478600001)(41300700001)(6512007)(6486002)(6506007)(2616005)(71200400001)(8936002)(83380400001)(8676002)(76116006)(2906002)(5660300002)(26005)(91956017)(66476007)(316002)(66946007)(64756008)(66446008)(110136005)(66556008)(38100700002)(82960400001)(122000001)(86362001)(36756003)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q0w1d2cydWVJaTN3RloxZGVjSHNoYk1FK2dYTmdOQzk0d0tkYkpNWGlxeHFB?=
 =?utf-8?B?NEdzZ2dOdWpIMThjclZoSmdhbmhzNzFsbUVHTnNzZ0V1dWtraDcvTnZlMmsw?=
 =?utf-8?B?Z2svdytWSnMyaExYREVBVk5DQlB1bmV5cFJ5d3NUVDN0UWZSNG5HRllLSjJX?=
 =?utf-8?B?dmpOMU85SXZBSXhjSS9tZ0lTdGxGS280bUlwb3dPNXNGSzlLQ05PSmE3bDZ6?=
 =?utf-8?B?S2V3MjhXUk1ndGMyQnlkdVRnWEZDZU9PT2tlcGRldWd5UTg5cWw1b1N1UXBy?=
 =?utf-8?B?MThwajU5dHQ3ZFpZeVVsWTZlOGd0MHNhdHU5Y1BwdW1ReG90VlJMWnFwMCtD?=
 =?utf-8?B?U3BLZ3RyZUtVMWE3cnFVUGhXNFVqb3NvRGF3cnhhMldRbENheHV2K3hGeUtZ?=
 =?utf-8?B?aGRHYUNXZm1KOUlEeDRTb3B5TC9YTi9UUzlIbTJ1b2V0WW11clZBZXZSTFZP?=
 =?utf-8?B?ZFRDMFlnS0JjcWZDUFdnaFI4OFNuZm5aUERzUzZJaFczaEhRVjJRQllaVzhq?=
 =?utf-8?B?N21kallid3pubVcyTHZ0RlNpV2VWSHpJMG5YQ2VJRE8wVitQa0ZrcStlcVU1?=
 =?utf-8?B?MnJ1WWlMWGQ2WjdsSCtlQzJ2eFFkRzI3RGNxb0FoRkpmelRMTFdiNXBNQVVR?=
 =?utf-8?B?TVVoaThCRGMvaFNNSUhLMmV6V2xRYjdpWDJUOHh3YjJrdXJwQmlQRUY1QzdB?=
 =?utf-8?B?djBtN1JVaEUvOWh2c2hBamxvZzEvcDFOUlFWb3ZjbWVkWnhJNkJOZ3c0YmU4?=
 =?utf-8?B?Q00wNng5T1dsTUtGenRkaTdnNDlSRTh2NlF0b2ZMNXBFZ05ONXVJUUx5L3B0?=
 =?utf-8?B?NFU0TFFKQlRiTnBFcnF3MytMYWMybldjeHZMKzA0RHNZOGFFTXkva2xpTjNr?=
 =?utf-8?B?OFlKSTdxZWJxd29hcGlRYWdkVDdkaFQzV0xUenJwMkVSTlo5dER5MGhqUDdL?=
 =?utf-8?B?UDJUTEV4b1BuZ2Y5TFczMi8xZS9iNVZJU3ZHdm5wOCs2SkRDRitmR21kQ09v?=
 =?utf-8?B?S3pINTNidlc4NUg4UE1pVmVXQmVRZG5RNFhMcnFHR0RhMXRnQSswRzZGeUx5?=
 =?utf-8?B?R0ZWMk53Vk14MlZCZk5za3UxaEJ5Vk1hUnN3RUwzM2xmTUZMaVlSUUVOeTNY?=
 =?utf-8?B?VEJMRm5yNzQxeUJ3SEJnZVFMcGwzTEFFc3BvWUxSbHN3Z2twS2YzT1RvWE1C?=
 =?utf-8?B?NVRlaWN6Q3dSVHBXWGtsa0FWOHk4UGltMy9GM0Uvc2lGaE1pUFdWbFZwaE1T?=
 =?utf-8?B?aFNuTFFvMUVLYVZsVitEU3I2dmxZbE1lZWR0ZmdiM3VmUWxOWnp4MWhWQVNU?=
 =?utf-8?B?YnZvc2sza1QwenR3ME5BKzhuSXBhbmpSYU1McUtsN3BSdTRQbGlSQ1hMVmN2?=
 =?utf-8?B?UkdFb2E1MjJKN3UxZ0dwcWNobVJoVjNQcVU3MURadTQ5UDB2a2tFSndtR3Rw?=
 =?utf-8?B?VDVCbU5JQldiNStVUUQ5R043LzlQYThqQ3FhdVFmZ1BRTFFzazliV3J4ZjFL?=
 =?utf-8?B?dUpoVjQ2dmRNSW5ic045NDZ2Z2F6RGZ2UlFheTV5TUNwZFBOTG94c1FxanJY?=
 =?utf-8?B?KzJhejlmMkVSbUpqQVUwR0ZqRDdnT24yRE5WV3Z3NGQ5VWh5MXhCNkQ5OGxl?=
 =?utf-8?B?K2IyNDIrM0FqaDNGVWdxTUJIaTFkc0xEaHgyYUNyZzJ4NGtlVDZaT0dDZFVD?=
 =?utf-8?B?UFFWQVdzWGw2Q1cxQjA1NXB2aE1mVjNyd2pVUW44L3ZodnV3NXJZdlFVY3h2?=
 =?utf-8?B?QXF6SW5yRTQ1U2RGS0dTWDhUUG14SnRFSmJwTzNJOG1Iem4zQUN6ZmJKZWJs?=
 =?utf-8?B?YkxoRWxlQ3BQZk1JRG1OKzRnVDNwMjMxcFo1L0dEY20yNU5hSHgrQnhBeG1B?=
 =?utf-8?B?SEs3Ykx6R3NHQWV1T1l0RkNsTUk5d2R0eWRwNS9YTExFRjZJeHppQWhaTkts?=
 =?utf-8?B?U0xWZ0hOWkcraEpyNHBIQk5zWnphSnB0ZXMzYWsrbW9DVk5McGNweHhuamVT?=
 =?utf-8?B?TEloQ2JzTjZoTXIreWdtVXd3cElQbUMyNEdIemtDNEt2dkZtQldrcWJpaUR2?=
 =?utf-8?B?cmZsM3pYK213TkxQaE5QQmtabEttdEo4b0ZONnkzN2ZTZXlia09pRWVWeFM2?=
 =?utf-8?B?UlZxWEJmZ3o5c0dQKzRUYlBkT2VHZEtvV1VRRlkzOHEybERzYnRsVHF4SHJS?=
 =?utf-8?B?Q3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D9689CD1C8A25743AF45EF1C3D1CB6BC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 794482fb-bb54-4bdf-f826-08dbdf942c82
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2023 13:19:29.7785 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8mdPKxhEweawD9XyvWImkSpHSKoZMPUifgg74W+2U+RnmoOa8CruUJnVvjoZtybUo5Q80dxYAa5kkd/u94An2wyV2/uPJX57FFIAMHXQ7pA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6413
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/8] fixup! drm/xe/display: Implement display
 support
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

T24gVHVlLCAyMDIzLTExLTA3IGF0IDE0OjU0ICswMjAwLCBKYW5pIE5pa3VsYSB3cm90ZToNCj4g
T24gTW9uLCAwNiBOb3YgMjAyMywgSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRl
bC5jb20+IHdyb3RlOg0KPiA+IFVzaW5nIGk5MTVfZmVuY2VfdGltZW91dCBjYXVzZXMgbGlua2lu
ZyBlcnJvciBhcw0KPiA+IGk5MTVfZmVuY2VfY29udGV4dF90aW1lb3V0DQo+ID4gZG9lc24ndCBl
eGlzdCBmb3IgWGUuIFJldHVybiBqdXN0IE1BWF9TQ0hFRFVMRV9USU1FT1VULg0KPiANCj4gQ29u
c2lkZXJpbmcgdGhlIGltcGxlbWVudGF0aW9uIG9mIGk5MTVfZmVuY2VfY29udGV4dF90aW1lb3V0
KCksIGlzbid0DQo+IDANCj4gbW9yZSBhcHByb3ByaWF0ZT8NCg0KSSBjaG9vc2UgTUFYX1NDSEVE
VUxFX1RJTUVPVVQgYXMgY3VycmVudCBYZSBjb2RlIGlzIHVzaW5nIHRoYXQ6DQoNCmRtYV9yZXN2
X3dhaXRfdGltZW91dChiby0+dHRtLmJhc2UucmVzdiwgRE1BX1JFU1ZfVVNBR0VfS0VSTkVMLCBm
YWxzZSwNCk1BWF9TQ0hFRFVMRV9USU1FT1VUKTsNCg0KMCB3b3VsZCBqdXN0IHJldHVybiBpbW1l
ZGlhdGVseS4NCg0KQlIsDQoNCkpvdW5pIEjDtmdhbmRlcg0KDQo+IA0KPiBCUiwNCj4gSmFuaS4N
Cj4gDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5ob2dh
bmRlckBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUvY29tcGF0
LWk5MTUtaGVhZGVycy9pOTE1X2NvbmZpZy5oIHwgOCArKy0tLS0tLQ0KPiA+IMKgMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL2NvbXBhdC1pOTE1LWhlYWRlcnMvaTkxNV9jb25maWcu
aA0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL2NvbXBhdC1pOTE1LWhlYWRlcnMvaTkxNV9jb25m
aWcuaA0KPiA+IGluZGV4IDEwZTE4YjAzNjQ4OS4uZTgzNWJlYTA4ZDFiIDEwMDY0NA0KPiA+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS94ZS9jb21wYXQtaTkxNS1oZWFkZXJzL2k5MTVfY29uZmlnLmgN
Cj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUvY29tcGF0LWk5MTUtaGVhZGVycy9pOTE1X2Nv
bmZpZy5oDQo+ID4gQEAgLTYsMTggKzYsMTQgQEANCj4gPiDCoCNpZm5kZWYgX19JOTE1X0NPTkZJ
R19IX18NCj4gPiDCoCNkZWZpbmUgX19JOTE1X0NPTkZJR19IX18NCj4gPiDCoA0KPiA+IC0jaW5j
bHVkZSA8bGludXgvdHlwZXMuaD4NCj4gPiAtI2luY2x1ZGUgPGxpbnV4L2xpbWl0cy5oPg0KPiA+
ICsjaW5jbHVkZSA8bGludXgvc2NoZWQuaD4NCj4gPiDCoA0KPiA+IMKgc3RydWN0IGRybV9pOTE1
X3ByaXZhdGU7DQo+ID4gwqANCj4gPiAtdW5zaWduZWQgbG9uZyBpOTE1X2ZlbmNlX2NvbnRleHRf
dGltZW91dChjb25zdCBzdHJ1Y3QNCj4gPiBkcm1faTkxNV9wcml2YXRlICppOTE1LA0KPiA+IC3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgdTY0IGNvbnRleHQpOw0KPiA+IC0NCj4gPiDCoHN0YXRpYyBp
bmxpbmUgdW5zaWduZWQgbG9uZw0KPiA+IMKgaTkxNV9mZW5jZV90aW1lb3V0KGNvbnN0IHN0cnVj
dCBkcm1faTkxNV9wcml2YXRlICppOTE1KQ0KPiA+IMKgew0KPiA+IC3CoMKgwqDCoMKgwqDCoHJl
dHVybiBpOTE1X2ZlbmNlX2NvbnRleHRfdGltZW91dChpOTE1LCBVNjRfTUFYKTsNCj4gPiArwqDC
oMKgwqDCoMKgwqByZXR1cm4gTUFYX1NDSEVEVUxFX1RJTUVPVVQ7DQo+ID4gwqB9DQo+ID4gwqAN
Cj4gPiDCoCNlbmRpZiAvKiBfX0k5MTVfQ09ORklHX0hfXyAqLw0KPiANCg0K
