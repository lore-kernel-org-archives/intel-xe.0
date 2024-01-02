Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5664C46CD2
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jan 2024 16:30:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 429F610E1F3;
	Tue,  2 Jan 2024 16:30:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC4810E1F3
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jan 2024 16:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704213025; x=1735749025;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=gqHE4AMU4N5rXRN4l0yJzmnqIlGGrLWm/+2WZElz9vI=;
 b=ADD3wi1BIk8thIqtzbLLGXXl5HVVj5DYEdVKPvTIp8ql6x++KeqqKVBT
 0FkpQJwFJ/gHqpyQZ00ajTDFVMGbzKORxFcqP9RU6mrZt/9m3XeZsDm4x
 FtQQIR8+hQGfAhG5yONl63l4hDYDApAmF3FqXkHs7EToZdREHmCsVIQEY
 AXR8UXO2H4LBH7bb748R9bxoqhVvC6VpJfkZHTjy46Z+/zy9MRuKhw0Pm
 xk3gqzOYs/rGhvE2WtygHgpktQZdsMvBxjIxwDF3gpDiuoSqxAJGHrko0
 gzqPGXcFndrjiAsLDLrQ5Cb6BOZts1s24i8Wf5yWI5uziARByZeKige0r w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="10282117"
X-IronPort-AV: E=Sophos;i="6.04,325,1695711600"; d="scan'208";a="10282117"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 08:30:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="903152261"
X-IronPort-AV: E=Sophos;i="6.04,325,1695711600"; d="scan'208";a="903152261"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jan 2024 08:30:25 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Jan 2024 08:30:24 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Jan 2024 08:30:24 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Jan 2024 08:30:24 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Jan 2024 08:30:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=csCo6y1CWRA26Ja9V2rhv5WdmS/do+0s/y0S1IF18OtQ6E3taGMKPke99kp6oQYiEwI3XFoSTYXocejJDbt54naDKJZA5y5GtXmLRO3c7/h82Ut0EFxpmYLYoqCZkE/T3VYH5Ig+w9NRvijxHLlHTySXflVewWm8cBS8whf8SI74n+s7x1OIGbI9Ld6amungONK19LQewqLm6sjvyzPfbV90gbRD4VB7g6GpH0UAOdbsMTwBup4lVzbOFVDppzkdnorMDFHVO+DvcyhWaeU6POR/2RnZ6ZfVqXqrrHIVbqtCBqdeByITUVeO5nkCShMdC7pnmF5Kr/Gi5vxte4rWfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gqHE4AMU4N5rXRN4l0yJzmnqIlGGrLWm/+2WZElz9vI=;
 b=XSfz7qywwrQx51fRgfHW2KETY4/voS90Dd4NWUCBrwi2QAkG26KdlbKjAtK13wCA+HceGPgqj8EzMQeWhd1wisTI5DM6PY5MjVXbAL6KxDdwB1ICXnA4LHViul8DP6PKNz5sptIONoZ9rZ9yaVwhtMbTbqTOWzKdXVE7lbpAFgHaS8XjyHAn7xTy2EX02JbanUWwniIpQq3f/oJqrYNULNcgIReW7FxlfbFirYUYe62DIVqRRfJkoBa98huF/4ykk0gTg9RQkDG/noDJfkUtnIsnVCyNPJe5NeRHf4rm62Hv414aScy48cWLfWOSIK4E2863hFY1nJgyZ5VIGegh4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DS7PR11MB6199.namprd11.prod.outlook.com (2603:10b6:8:99::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7135.25; Tue, 2 Jan 2024 16:30:19 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::f3c8:b435:76a3:b957]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::f3c8:b435:76a3:b957%5]) with mapi id 15.20.7159.013; Tue, 2 Jan 2024
 16:30:19 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe/xe2: Use XE_CACHE_WB pat index
Thread-Topic: [PATCH] drm/xe/xe2: Use XE_CACHE_WB pat index
Thread-Index: AQHaPW37+94TIJGS9UWn9x4rnWxwqrDGhf+AgAAwtCA=
Date: Tue, 2 Jan 2024 16:30:19 +0000
Message-ID: <MW4PR11MB7056C159A40991C3F9D10D5EB361A@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20240102113340.836193-1-himal.prasad.ghimiray@intel.com>
 <c435935326b41a0ccc42613e28d2865cd50f2f0f.camel@linux.intel.com>
In-Reply-To: <c435935326b41a0ccc42613e28d2865cd50f2f0f.camel@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|DS7PR11MB6199:EE_
x-ms-office365-filtering-correlation-id: 8976a766-cd1a-496b-e2c0-08dc0bb01c17
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: md1/AvgT34ZlCS5ysQ/VHj7D969cROkjfbUTpCAiwJltu1o/FR0HcW494UIa6IqKXRu6PhXQPtK610ciHC2IQt6dItjBBITIFJR+2/D35MdIWXwtduXKxr8O/V7SU04phgNqgxxyy9cqSyLR4UD2i4Lk8cN1JmEE4VQzrhihgS0CiNnP9++peVH0j4Q3HvQ25RmzHlM2dFiIF1ea1GxPCo3Bihqa0iJlpDEpSftdLMBvbUDqfaSo+Gy+JNIjsVEPx05LVL+yJghzYUlnR4spkNYtEgivwAS9L0y6Ft4ZK0v2SdlcTnguuQ2QdxcxxkdTFSS9vJFmznP4eZNutx69TCJflXpkhZgo5wpAIIpxywnujGmyuEixlia47wvHtFC6vQsVtyRNmbAxAZBA+YQhm702qJlxxMmmeVufRkyf0aGE2QKfEU5V1AlEndRPiGtDaAXlOEdVTldCLuHIcfEUx2hgrWyVWt2oGwHflHbFvWMdZrigZ6qjWOtBvbZR1whVT2R7wDsH6SDm71IaNKh4V/9vTbSpp1Ce9ra9+xkZfvsIvhVYzTOnhcTsVE8hmO1iT3baJ9OYJLJfutUlqXL9hxBCtJRLtrB3FLK9PhpSZ61uoCjjciPnityNwoodfGIR
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(346002)(136003)(376002)(39860400002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(26005)(66574015)(83380400001)(82960400001)(38100700002)(122000001)(52536014)(8676002)(5660300002)(110136005)(41300700001)(8936002)(316002)(2906002)(71200400001)(9686003)(66946007)(7696005)(66446008)(76116006)(64756008)(6506007)(66476007)(66556008)(478600001)(53546011)(38070700009)(86362001)(33656002)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dHR1NkJDa3V2TEFVQnF6MXA1b1lnQVYvQ0oxdHhqNU5nZFkyUDZraEU5QWxu?=
 =?utf-8?B?RFkrRUV3Qk9vUng1ZTlaeWFNbGViTng1VnVjYW9SQWd0OXRNaDlDUnV0MUcz?=
 =?utf-8?B?dFBHK0gyMmxzMjQweTV1Qkpramp4cSthQjJOL3UyVVBUMDAvMko5Mi9zS2Jv?=
 =?utf-8?B?K3lKdE5EUm9iVGFMdjcyVE5GWnFYWUUxSWp0dENOZnJQdlpRR0tWOFpCRW52?=
 =?utf-8?B?c0RHcmY4c25wclZta0MycUQ4QTR1MUlYNHUvZmE1bFc4cnJRTVZDdGlEeXVk?=
 =?utf-8?B?b1I4bnRnZlBJdjVXbzY2NlpCVlA0d3gzVTZxQ1B5SXU4aTQ4eXdjdFdaeGpB?=
 =?utf-8?B?cG5jbVNmS2luOHZHTldOUkIzdUhJaFA1QmZGNmlYdUZCN0dId2pXeU9NR05Y?=
 =?utf-8?B?RXZwY0NtRW15eHR1RDZ1aUJNSmdvRi83d3loMlNLeWR5TlgzYTgyZ09wZWts?=
 =?utf-8?B?OThKaEZORUxPZVBVNHlVWEZnanhBMFVMSFdJUk9laXlXZ0xheWdNWU9uVTBq?=
 =?utf-8?B?a01zV0RSakRDbkJhM3krUktwOHBOdUU5d01QZEp4OTRKV0dEa3MxWGp5MjZJ?=
 =?utf-8?B?NWNUUXB4Q0hEZTdWV2duck5DOU41Qkk5OGRNSXpFQUlHU3NNeEV4a3JBZUlW?=
 =?utf-8?B?RlZiRnBiUXdwQm1zUVFjSWNoekJKTjJzNTg0QTExRGgxUEdSRU4rSHdjQTJv?=
 =?utf-8?B?N3NuY2g5U1IreUJzRFZUQ1pQYXlaWVZEbWhETzgwSjU1LzEraE9na3BhbGR2?=
 =?utf-8?B?eHhQbWY1Uzc3bG9zd3YwU3UwaEVEQ3UzajlsaWVJbUFab1I3MCtpRXF4d00w?=
 =?utf-8?B?Mm11SVEvQVZrYUc3aW95dlE5VXNLYUFXWFRiL05Xa0M0UUI1Tnp6b2ttVzY4?=
 =?utf-8?B?cEp0RnFlc3pLMGhqT2gyUXc0NmkxWjV6ak1JeTdBaEhrb3ozSWVMQW41Nkdz?=
 =?utf-8?B?NEhkQWNmei80UXV3cEtpVWd5dHJvd0E2SGlONmxmNWUyRE1nL1A5dm5qTThy?=
 =?utf-8?B?UVlpaVFxY2wvSTlPeURqc3cyYlhWOGE3SlpTMmU3bC9ZR0dQS3ZpUmRSaXdZ?=
 =?utf-8?B?RGYrbkNRWWdKa0JYc24rd1d0cjhwQ0tSY29DZDdlUFp4UDl4TnVyVzdFZ3Uv?=
 =?utf-8?B?WTRISWR6SjB2UnVUUzQrc1hSMU94VitLOXZxZTgvWHEvQkpKR1NUVmtaMnI1?=
 =?utf-8?B?emxsTFlVckFXV0lxc0pPNWRzb0VmeC80bVR0OFo4R056RTV3MVRWYS9Kdm9l?=
 =?utf-8?B?UTZraXVJNG80Nk5qclloQW5TSXpBYjVuN3ZFbUlId3cyWDdEc2QwTGxwS1NQ?=
 =?utf-8?B?UGJJTytwVkg0dndvS2IvbTB6ZFc5Nk8vWHNSR0xUNUhTVFB3RGkzc3Z6SU9I?=
 =?utf-8?B?b0NCb3pKL01ORm9hRU9OWHJKS0lla0VHSVZZL2tFWFZuSDFtSFpiVlFSUEZS?=
 =?utf-8?B?N0ZjbGZUKzMzYVZ3Q1Q2MkxpSURDbVorT2lrNzVXalArN2c0T1MwdzNncDd1?=
 =?utf-8?B?cm1zYmFwR1A4QjFmMEdNQU5OSWdsRjNuZXlLNDkrN25Va01IUjhrem9lemxy?=
 =?utf-8?B?a2tKa2g5UEF6bjFORUZ3OEQvWW0zQ256SE5TSXlrc283NG0wcXlPRlJyZXJD?=
 =?utf-8?B?MFUrbnNGNmJQOEJ4Y25KQWtIeDNEVHcwSllXREtsVUFBbndLVG01TVVlN0JY?=
 =?utf-8?B?b1AybkFnTkdTZWJnN2JEdDltWW5vcWRiTDk5NEhidVlMdmRnZU8xaTlsa09D?=
 =?utf-8?B?aHZRdTVwTTNTdXFIVDgrK0gwOW8ycm5yUytnUTRQbVcveEJkU1dkUXNDOXNY?=
 =?utf-8?B?aE1wbS9CZVVZUFRrc3pLM2Jva20xUnlVSWphM3diRXR4VjZ5aTM0WDZkV25I?=
 =?utf-8?B?b3VlWS9SeHRTSXlXS1dLNThXd2RxbkhNYUl1VnVpdU9GaURRZlFhMnQ1LzNI?=
 =?utf-8?B?VWU1RXB6aXdLb0tDRDdUa0U1eXhNdEp4U2FlR2JYSHJhQUprVjRYdnJTUmFW?=
 =?utf-8?B?N0dsd3VabERiVHNvRWxzVWNwRWk1QnNvT29rS1JESW03ME5USzA3YjIxWGxh?=
 =?utf-8?B?NkhTMTE3cjdwZGhMVy9xUTZMb2pYZzVZRFlUbGdsUHFxOWgwQzZHMWtTVHU2?=
 =?utf-8?B?Z3dXd3FaTml5dm50TmxmY05xdjQ1OTE1NXE2ekhFbEgwdVZtWVBKVU1ra2ow?=
 =?utf-8?B?NUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8976a766-cd1a-496b-e2c0-08dc0bb01c17
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2024 16:30:19.2827 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vov1mEFU+mlDU/zcsFD42p2mpA6+uK2cqOKXWj8b15KPECIvw7EuePypXjRDkZ/ffxNAZmkFQ4/z8xq7cb6roFdEG+a7XCLMwkXoN/79RAs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6199
X-OriginatorOrg: intel.com
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVGhvbWFzIEhlbGxzdHLD
tm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPg0KPiBTZW50OiAwMiBKYW51YXJ5
IDIwMjQgMTk6MDUNCj4gVG86IEdoaW1pcmF5LCBIaW1hbCBQcmFzYWQgPGhpbWFsLnByYXNhZC5n
aGltaXJheUBpbnRlbC5jb20+OyBpbnRlbC0NCj4geGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+
IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS94ZS94ZTI6IFVzZSBYRV9DQUNIRV9XQiBwYXQgaW5k
ZXgNCj4gDQo+IE9uIFR1ZSwgMjAyNC0wMS0wMiBhdCAxNzowMyArMDUzMCwgSGltYWwgUHJhc2Fk
IEdoaW1pcmF5IHdyb3RlOg0KPiA+IFVzZSBYRV9DQUNIRV9XQiBwYXQgaW5kZXggYnkgZGVmYXVs
dCBvbiB4ZTIgcGxhdGZvcm1zIGFuZCB1c2UNCj4gPiBYRV9DQUNIRV9OT05FX0NPTVBSRVNTSU9O
IHBhdCBpbmRleCBvbmx5IGlmIGJ1ZmZlciBzdXBwb3J0cw0KPiA+IGNvbXByZXNzaW9uIGFuZCBp
bmRpcmVjdCBhY2Nlc3Mgb2YgZmxhdCBjY3MuDQo+ID4NCj4gPiBGaXhlcyB0aGUgYnJva2VuICJ4
ZV9taWdyYXRlX3Rlc3Qga3VuaXQgdGVzdCIgb24gTE5MLg0KPiA+DQo+ID4gQ2M6IFRob21hcyBI
ZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiBIaW1hbCBQcmFzYWQgR2hpbWlyYXkNCj4gPiA8aGltYWwucHJhc2FkLmdoaW1pcmF5
QGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9taWdyYXRl
LmMgfCAxNCArKysrKysrLS0tLS0tLQ0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9u
cygrKSwgNyBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0veGUveGVfbWlncmF0ZS5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbWlncmF0ZS5j
IGluZGV4IGFkZjFkYWI1ZWJhMi4uY2I2NjYzNmJmYTZmDQo+ID4gMTAwNjQ0DQo+ID4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX21pZ3JhdGUuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9taWdyYXRlLmMNCj4gPiBAQCAtNDM5LDcgKzQzOSw3IEBAIHN0YXRpYyB2b2lkIGVt
aXRfcHRlKHN0cnVjdCB4ZV9taWdyYXRlICptLA0KPiA+IMKgCS8qIEluZGlyZWN0IGFjY2VzcyBu
ZWVkcyBjb21wcmVzc2lvbiBlbmFibGVkIHVuY2FjaGVkIFBBVCBpbmRleCAqLw0KPiA+IMKgCWlm
IChHUkFQSElDU19WRVJ4MTAwKHhlKSA+PSAyMDAwKQ0KPiA+IMKgCQlwYXRfaW5kZXggPSBpc19j
b21wX3B0ZSA/IHhlLQ0KPiA+ID5wYXQuaWR4W1hFX0NBQ0hFX05PTkVfQ09NUFJFU1NJT05dIDoN
Cj4gPiAtCQkJCQnCoCB4ZS0NCj4gPiA+cGF0LmlkeFtYRV9DQUNIRV9OT05FXTsNCj4gPiArCQkJ
CQnCoCB4ZS0+cGF0LmlkeFtYRV9DQUNIRV9XQl07DQo+ID4gwqAJZWxzZQ0KPiA+IMKgCQlwYXRf
aW5kZXggPSB4ZS0+cGF0LmlkeFtYRV9DQUNIRV9XQl07DQo+ID4NCj4gPiBAQCAtNzI5LDE0ICs3
MjksMTQgQEAgc3RydWN0IGRtYV9mZW5jZSAqeGVfbWlncmF0ZV9jb3B5KHN0cnVjdA0KPiA+IHhl
X21pZ3JhdGUgKm0sDQo+ID4gwqAJCX0NCj4gPg0KPiA+IMKgCQlpZiAoIXNyY19pc192cmFtKQ0K
PiA+IC0JCQllbWl0X3B0ZShtLCBiYiwgc3JjX0wwX3B0LCBzcmNfaXNfdnJhbSwNCj4gPiB0cnVl
LCAmc3JjX2l0LCBzcmNfTDAsDQo+ID4gLQkJCQkgc3JjX2JvKTsNCj4gPiArCQkJZW1pdF9wdGUo
bSwgYmIsIHNyY19MMF9wdCwgc3JjX2lzX3ZyYW0sDQo+ID4gY29weV9zeXN0ZW1fY2NzID8gdHJ1
ZSA6IGZhbHNlLA0KPiANCj4gQ2FuJ3Qgd2UganVzdCB1c2UgImNvcHlfc3lzdGVtX2NjcyIgcmF0
aGVyIHRoYW4gImNvcHlfc3lzdGVtX2NjcyA/IHRydWUNCj4gOiBmYWxzZSIgaGVyZSBhbmQgYmVs
b3c/DQoNCk15IGJhZC4gU2ltcGx5IHBhc3NpbmcgY29weV9zeXN0ZW1fY2NzIHdvdWxkIG1ha2Ug
bW9yZSBzZW5zZS4gV2lsbCB1cGRhdGUgaW4gbmV4dCB2ZXJzaW9uLg0KDQo+IA0KPiANCj4gPiAr
CQkJCSAmc3JjX2l0LCBzcmNfTDAsIHNyY19ibyk7DQo+ID4gwqAJCWVsc2UNCj4gPiDCoAkJCXhl
X3Jlc19uZXh0KCZzcmNfaXQsIHNyY19MMCk7DQo+ID4NCj4gPiDCoAkJaWYgKCFkc3RfaXNfdnJh
bSkNCj4gPiAtCQkJZW1pdF9wdGUobSwgYmIsIGRzdF9MMF9wdCwgZHN0X2lzX3ZyYW0sDQo+ID4g
dHJ1ZSwgJmRzdF9pdCwgc3JjX0wwLA0KPiA+IC0JCQkJIGRzdF9ibyk7DQo+ID4gKwkJCWVtaXRf
cHRlKG0sIGJiLCBkc3RfTDBfcHQsIGRzdF9pc192cmFtLA0KPiA+IGNvcHlfc3lzdGVtX2NjcyA/
IHRydWUgOiBmYWxzZSwNCj4gPiArCQkJCSAmZHN0X2l0LCBzcmNfTDAsIGRzdF9ibyk7DQo+ID4g
wqAJCWVsc2UNCj4gPiDCoAkJCXhlX3Jlc19uZXh0KCZkc3RfaXQsIHNyY19MMCk7DQo+ID4NCj4g
PiBAQCAtOTc4LDggKzk3OCw4IEBAIHN0cnVjdCBkbWFfZmVuY2UgKnhlX21pZ3JhdGVfY2xlYXIo
c3RydWN0DQo+ID4geGVfbWlncmF0ZSAqbSwNCj4gPiDCoAkJc2l6ZSAtPSBjbGVhcl9MMDsNCj4g
PiDCoAkJLyogUHJlZW1wdGlvbiBpcyBlbmFibGVkIGFnYWluIGJ5IHRoZSByaW5nIG9wcy4gKi8N
Cj4gPiDCoAkJaWYgKCFjbGVhcl92cmFtKSB7DQo+ID4gLQkJCWVtaXRfcHRlKG0sIGJiLCBjbGVh
cl9MMF9wdCwgY2xlYXJfdnJhbSwNCj4gPiB0cnVlLCAmc3JjX2l0LCBjbGVhcl9MMCwNCj4gPiAt
CQkJCSBibyk7DQo+ID4gKwkJCWVtaXRfcHRlKG0sIGJiLCBjbGVhcl9MMF9wdCwgY2xlYXJfdnJh
bSwNCj4gPiBjbGVhcl9zeXN0ZW1fY2NzID8gdHJ1ZSA6IGZhbHNlLA0KPiA+ICsJCQkJICZzcmNf
aXQsIGNsZWFyX0wwLCBibyk7DQo+ID4gwqAJCX0gZWxzZSB7DQo+ID4gwqAJCQl4ZV9yZXNfbmV4
dCgmc3JjX2l0LCBjbGVhcl9MMCk7DQo+ID4gwqAJCX0NCg0K
