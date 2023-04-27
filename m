Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB961C77B61
	for <intel-xe@archiver.kernel.org>; Thu, 27 Apr 2023 19:10:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8478D10EBBD;
	Thu, 27 Apr 2023 19:10:35 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F54910EBBD
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Apr 2023 19:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682622633; x=1714158633;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=o9/1MR+R75IK9AtFRX/Jr0nzyCePM2yssVKvsUJLn+0=;
 b=TW6ftPIApJ9eQ+VSxby0ey6RtEP+BL6iNA9dtUs9XMy+ru0/8gwComEL
 iio5ngogUfFmpjospgzFACJtDRWHqAE1gODPcY/6rphqbZC909FpxVgi1
 fh2+CeUAJSyokNYEdVRBaL50nY4Nt0y5J3+vAoBOXcAGXYNwk0FGqWDG9
 WKfJNHwW9v5OpLw6sxK7wEqEI3kxWNeJ0hXksiTts5bgfaKAn2SvyvjqW
 wz2HMsieJVFE3/tZCwHtF6pIe1DC+Zp2tLfiJOaKc5qIwqDCItIWiYfJ5
 1+18bRTsVZIkpJQXEQAALfCNOUmsQKGG9BRFH6KA6fzfJPZluQW89VwsT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="349531129"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; d="scan'208";a="349531129"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 12:10:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="763958738"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; d="scan'208";a="763958738"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 27 Apr 2023 12:10:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 27 Apr 2023 12:10:31 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 27 Apr 2023 12:10:31 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 27 Apr 2023 12:10:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q8wjzh8ohFipQy4dm9A9RLeaxjDpF0eu8YE/xJIjIFc2SORz/38n74O1lOwnAJNmUs6RtLCpeML6UyzJvS2R8iKx90Gnv1rzhPwukc8MMKy5NlALOG8jCoC3uv9N4vlnnH9RT49upDqQFZizivz0kj+I62SJmRB4skHu+BYpSAA76FGruC8IFk+oZUAC8jU3/9d5o/8sS+c+NRiEYpES0xc+7XJ1CakuAo5rm2b3PjVIhcKdBWev3Dg3owAXrcG1ormGJJdNaVyFfPazCQTOUFBAOxGgkN9xdb8WSY9MqHDO9tA0z4FSZq8dWSFdV55QPpwnRu+oDCfX/4dwBAuN1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o9/1MR+R75IK9AtFRX/Jr0nzyCePM2yssVKvsUJLn+0=;
 b=oDfayPU7nYtndA+DpKxJz7OfhzRX1kf+a5TJaLNtBoqEIrv16EYnPOaL904kh2V4knmjppRfqh0EzaZfWvQgsTgie8+oCQfeMp2Zj3FIk2RARj2F6zNO/NsqO73r1pn0awufB8mLaYrMpD7wWw0mP2AFCQbYC+9sngzIctfSy5/9T05cGTCytb72HllptPlmKoLQ7xRRjEaMC19FQkYVRHUyMPuWVsc61ecs17xGEXQz/8CJVKE7RpOPLq7pALyAl+pIWWRORPQeFLPy5eC7ub6sozVsB5KRj5awUZ5WkADt/hI+dS9pACy4Fw++cwJyZ+6CtxgmIlPzSNdYm1YEuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CH3PR11MB7675.namprd11.prod.outlook.com (2603:10b6:610:122::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Thu, 27 Apr
 2023 19:10:29 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651%3]) with mapi id 15.20.6340.021; Thu, 27 Apr 2023
 19:10:29 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "rodrigo.vivi@kernel.org" <rodrigo.vivi@kernel.org>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Thread-Topic: [Intel-xe] [PATCH 2/2] drm/xe: Set default MOCS value for copy
 cs instructions
Thread-Index: AQHZb1AVxIjxhfc9O06bkM8wplsizq87Ik6AgAE+QICAAjSugIABA/uA
Date: Thu, 27 Apr 2023 19:10:29 +0000
Message-ID: <533195b64b28e42b4cc0fa8be5bcfe893880fa4c.camel@intel.com>
References: <20230415040906.13230-1-jose.souza@intel.com>
 <20230415040906.13230-2-jose.souza@intel.com>
 <20230424225947.GH10045@mdroper-desk1.amr.corp.intel.com>
 <f3bdffa9fd9fb2c780af10b8354b60b955a776ff.camel@intel.com>
 <ZEnudoKAkZpP1nwN@rdvivi-mobl4>
In-Reply-To: <ZEnudoKAkZpP1nwN@rdvivi-mobl4>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CH3PR11MB7675:EE_
x-ms-office365-filtering-correlation-id: 41861741-647d-47e8-4897-08db475310ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Gs2aaMNQn1X6X8+LPPKhqGE0luHcwagqRL18neft986p4leOi91wOtdgpvHUI2Wab/ZHL/Xr9aj32vEawnwNPsG3cY8SefLFl8M0W2GNUzN5NL7F2xMceLxiBi9FzTTGQYt5OjwBV+epJKl9Rp3SOICsFvpeHLs5A7c92TR4b1eqstTmeg3L7X0UgBAHaykllJ+EVU47zPeyFt/xKsClj30RgAknu5w3Qv2BUrKbQx+ta5sNMw9mALKcdkmWXorhxXqG+D4+obUc30jHFVtw0uiRNwJaqo/QWcIOKZjRvOkTPIoqhZL3HvpWmRg0If7N5kNZj8xz15lzDLDdKmCmJ5DUjsScw2lRkZPDEPJgc+kiCLtxVEmSdFJzjQ3XIb5WEC6G26uTi/+feO9Baqp8WE8NhVcUE/DtVKs/wJf4G8dS3lyzaMipeMuIMVe5lfZGnPsILwkyGMjSv/iGsgyAJZzyKMQnsZFmBbiF62xhkkeOmFK+4bJL/s1NcCghjH9leAtV4hLnLZGe+BvPlMz/83Lh/mL4m10xZjLP+oa9EL4tqTGVBSIsbXqsLHlkqd8x
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(39860400002)(376002)(136003)(396003)(451199021)(6506007)(26005)(6512007)(91956017)(186003)(966005)(66556008)(66476007)(4326008)(64756008)(107886003)(82960400001)(5660300002)(66446008)(41300700001)(76116006)(66946007)(316002)(6486002)(71200400001)(2616005)(6636002)(110136005)(38070700005)(36756003)(54906003)(2906002)(8936002)(8676002)(86362001)(478600001)(122000001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MEExWVpibzhqNndIekxhZkVuUlhlbC9JYUs2YTlWMHRCdkc0ZU5Va3phT2sr?=
 =?utf-8?B?Njc1VnREL1h1NS9WY3AxRUI3MmViRGsyU2huczRRWlBUMTFabXVqL2ErTlpv?=
 =?utf-8?B?SnYwdXJ4akZqNmxvU0thcWFUd3VZU0gyekU1M05yVk9GamVOdVZJYkNPK0pI?=
 =?utf-8?B?emExcXZoR2VlNVFqTzhpdjA0TU02Nm9RU21STjQ1UzRmZFBmT1hucERFUGNw?=
 =?utf-8?B?a2hIM2RQdDhNbGxjbGtVLzBOLzdPUWlPNFJFazgvckJmakRZYllFRjhHMUFW?=
 =?utf-8?B?WGl5TzZhOTlIY0tQcVdZVThDZ2xzTEJDandDeTZhV3g5NXBnY0E3TDlmakFs?=
 =?utf-8?B?anNaRG1BdVBnTzgrcDRyZjZIbEpIUkpyMno3b1NLdy9YN01WV0JxZzQwVXc4?=
 =?utf-8?B?M0lqbmZxMGY3MDZVNklueHR6elB4V2Fxc0MzaDBwZE80R3YxKzJVdVFPRWJu?=
 =?utf-8?B?UmplSk84eHBpSkcvQUNTckl5Y1lpa0U2WGdUS1BRZ3ZGT3dGaUtvZzE1VTd5?=
 =?utf-8?B?MS8wcldKN2lXQ2puTFU5RzlLZWNwbSthVDlhZkxPcFlCNWxLQkRKUFNkMXhx?=
 =?utf-8?B?Z3FhL2VFTlBPVlZkbWJVZkUzRThtQUo0MDdUQlZzS1I3NnhUM3VNem9YU1dD?=
 =?utf-8?B?elhUMUtrRGJGYytFcXF6ajdXaGdad0VMdGxHOXdrWmVUdUFTSE9tQk5ZYkw2?=
 =?utf-8?B?MldaQ2M1ZTZDL2pJTytrek9MSExaZVFtUmtJR0xNdVRjZUdzZ0ZNV2dWQm55?=
 =?utf-8?B?L2RrZEdKSGtOQkgyRVBsUFJOUzhBUmxPUS9qOXZleC9MZ3N1TmdLeU5nNnJF?=
 =?utf-8?B?VDd5ZDVKTU11aVBwdTVuaUttTUg1eUZETXl4U0NtUnBSODdzYXpzaDBUdFJU?=
 =?utf-8?B?OEVkeWxmdUwyNGxCc3lDWkNlU1hZUERhZ1lnZmx2SGdMS3MzMnBsZW5RVzdP?=
 =?utf-8?B?bG4vUzlCbGtERmVxNFIvSXhtUGg2RW1PQ0NsRFh4ZjVpcnZTWEhXeERvL0pS?=
 =?utf-8?B?Skw4QnVhR2ovd2cvQVhpT2w2eStQdkVEMGpGQlM0dE5tblFvcUo1NHJYYnRR?=
 =?utf-8?B?aW5IT3hGLzdUdnZkZkJURXNqMUxhN0hpNzNwM3Y4eGFwZEM0bDlEOEthc3Qr?=
 =?utf-8?B?RnFQS2ZsOTlDQ3JOMytQT2FYRXorT3VER1IzZWkxbnBvZk94YVMrVGZWNUpx?=
 =?utf-8?B?ZjFwVWRoVFg4Nm5EMWJ1YytnSHUveXpnaFRrdW9jK0hSNndKWVFyL1RwSFFG?=
 =?utf-8?B?WmhPUG9Tb0ZqWm4wQTU2NXBUUUF0ZFpJUHJXS2p0eGduK2JlcVJpbDRQVmFZ?=
 =?utf-8?B?ZmFIbnVwbXRzdGxLbU50WXRuT0dRdkw4ZEtjVEI1akFKaEdNQmpneFUyb0lI?=
 =?utf-8?B?UDFaMFVUNEpmeVNoYzYyWHlIL1FmRUFucXNONDlLMDROdTFEVHJyUC96dm5i?=
 =?utf-8?B?Ym92amtlZmVRVW9IZjc4aFdMRDczTXBuejVZRmFiQTJ6dkR2TUhaNW9QWml1?=
 =?utf-8?B?WmVLSklxWFdkdGpOQkMxaDJiZURTMzdkZVNWbEtGMzJDVlh3ck9JMDBaNEpQ?=
 =?utf-8?B?Vm1zUVIrdWFCbUdudkxET0hwQ08rbnNWSFdOMmQrbFBOalhsS3BJRk5HWlRW?=
 =?utf-8?B?Y3BFeWh1WTFvcHZ5ZUNZV0taT0pnRmhYa1EyeWRuWUtNUG1MUUd6eThucElm?=
 =?utf-8?B?eXYrVUFvd0Jxb2JLZUc3K25zWkVxUHczYnZOL0djbHNqVTJZVFAwTGxucWM1?=
 =?utf-8?B?aUhZVmYydzdjZjJsZDhXVHhaQXl3SE9RSUFOZFlEQWtQbC96dGhndnM4RDh1?=
 =?utf-8?B?MHkyUmw3TllaTThGcUJCYkRRSndaM1VJWEpyOGo0cVRscUpyNDhGUUxrUjNi?=
 =?utf-8?B?Tmt6RCtFZXVUZDVDa3RqM2ozTjN5RWZ5cURzUnBzNVEvU1hmTXF3ZHA5b3Fw?=
 =?utf-8?B?YnUwdlowTWFaVHk3NHRXd2ZWV2xDc3RxSFdDY0ZnRnNPZDNMY3h0S0Rtdkpv?=
 =?utf-8?B?MGt4bkoxOU40emRsRzlwZ2QrNmZUdEJyRXNGbndNaHFmdTJCYVRVZnpFZGpX?=
 =?utf-8?B?ZWFGTjhOaE1JYXlwTWUrNXFsZFBSSS9QdFJlczU1WS8yZ2psT2RTSm1wdU52?=
 =?utf-8?Q?nTht7x+SM8FEvO5/7k89OR5Bz?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D305F47EBE1D7940BE3DD1F013EB2F2B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41861741-647d-47e8-4897-08db475310ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2023 19:10:29.4732 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sTrzqAnHyQDmKuC/fgSXHjh4Mwn07/+KKy+gULVVS6PBzdKVwllaCwzEbuiAv5R6/KWNtU3esh7OmNkQ4j8BSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7675
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Set default MOCS value for copy
 cs instructions
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTA0LTI2IGF0IDIzOjM5IC0wNDAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IE9uIFR1ZSwgQXByIDI1LCAyMDIzIGF0IDA1OjU4OjU0UE0gKzAwMDAsIFNvdXphLCBKb3NlIHdy
b3RlOg0KPiA+IE9uIE1vbiwgMjAyMy0wNC0yNCBhdCAxNTo1OSAtMDcwMCwgTWF0dCBSb3BlciB3
cm90ZToNCj4gPiA+IE9uIEZyaSwgQXByIDE0LCAyMDIzIGF0IDA5OjA5OjA2UE0gLTA3MDAsIEpv
c8OpIFJvYmVydG8gZGUgU291emEgd3JvdGU6DQo+ID4gPiA+IGNvcHkgY3MgaW5zdHJ1Y3Rpb25z
IHRoYXQgZG9udCBoYXZlIGEgZXhwbGljdCBNT0NTIGZpZWxkIHdpbGwgdXNlIHRoaXMNCj4gPiA+
ID4gZGVmYXVsdCBNT0NTIHZhbHVlLg0KPiA+ID4gPiANCj4gPiA+ID4gVGhpcyB3YXMgbWFpbmx5
IGNvcGllZCBmcm9tIGk5MTUgc291cmNlIGNvZGUuDQo+ID4gPiA+IA0KPiA+ID4gPiBCU3BlYzog
NDU4MDcNCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9z
ZS5zb3V6YUBpbnRlbC5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJt
L3hlL3JlZ3MveGVfZW5naW5lX3JlZ3MuaCB8ICA5ICsrKysrKysrKw0KPiA+ID4gPiAgZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3dhLmMgICAgICAgICAgICAgICB8IDEzICsrKysrKysrKysrKysNCj4g
PiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gPiANCj4gPiA+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hlX2VuZ2luZV9yZWdzLmgg
Yi9kcml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9lbmdpbmVfcmVncy5oDQo+ID4gPiA+IGluZGV4
IGNjODc0MzQ4Zjc2YmMuLmRiYzRiOWYxNWI0ZTggMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS94ZS9yZWdzL3hlX2VuZ2luZV9yZWdzLmgNCj4gPiA+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3JlZ3MveGVfZW5naW5lX3JlZ3MuaA0KPiA+ID4gPiBAQCAtMTA1LDYgKzEw
NSwxNSBAQA0KPiA+ID4gPiAgCQkoUkVHX0ZJRUxEX1BSRVAoQ01EX0NDVExfV1JJVEVfT1ZFUlJJ
REVfTUFTSywgKHdyaXRlKSA8PCAxKSB8IFwNCj4gPiA+ID4gIAkJIFJFR19GSUVMRF9QUkVQKENN
RF9DQ1RMX1JFQURfT1ZFUlJJREVfTUFTSywgKHJlYWQpIDw8IDEpKQ0KPiA+ID4gPiAgDQo+ID4g
PiA+ICsjZGVmaW5lIEJMSVRfQ0NUTChiYXNlKQkJCQlfTU1JTygoYmFzZSkgKyAweDIwNCkNCj4g
PiA+ID4gKyNkZWZpbmUgICBCTElUX0NDVExfRFNUX01PQ1NfTUFTSwkJUkVHX0dFTk1BU0soMTQs
IDgpDQo+ID4gPiA+ICsjZGVmaW5lICAgQkxJVF9DQ1RMX1NSQ19NT0NTX01BU0sJCVJFR19HRU5N
QVNLKDYsIDApDQo+ID4gPiA+ICsjZGVmaW5lICAgQkxJVF9DQ1RMX01BU0sgKEJMSVRfQ0NUTF9E
U1RfTU9DU19NQVNLIHwgXA0KPiA+ID4gPiArCQkJICBCTElUX0NDVExfU1JDX01PQ1NfTUFTSykN
Cj4gPiA+ID4gKyNkZWZpbmUgICBCTElUX0NDVExfTU9DUyhkc3QsIHNyYykJCQkJICAgICAgIFwN
Cj4gPiA+ID4gKwkJKFJFR19GSUVMRF9QUkVQKEJMSVRfQ0NUTF9EU1RfTU9DU19NQVNLLCAoZHN0
KSA8PCAxKSB8IFwNCj4gPiA+ID4gKwkJIFJFR19GSUVMRF9QUkVQKEJMSVRfQ0NUTF9TUkNfTU9D
U19NQVNLLCAoc3JjKSA8PCAxKSkNCj4gPiA+IA0KPiA+ID4gU2FtZSBnZW5lcmFsIGNvbW1lbnRz
IGZyb20gbGFzdCBwYXRjaCBhYm91dCBmaWxlIHBvc2l0aW9uLCBtYXNrDQo+ID4gPiBkZWZpbml0
aW9uLCBhbmQgcG90ZW50aWFsbHkgZHJvcHBpbmcgbGFzdCB0d28gbWFjcm9zIGFwcGx5IHRvIHRo
aXMgcGF0Y2gNCj4gPiA+IGFzIHdlbGwuDQo+ID4gPiANCj4gPiA+ID4gKw0KPiA+ID4gPiAgI2Rl
ZmluZSBWREJPWF9DR0NUTDNGMTAoYmFzZSkJCQlfTU1JTygoYmFzZSkgKyAweDNmMTApDQo+ID4g
PiA+ICAjZGVmaW5lICAgSUVDUFVOSVRfQ0xLR0FURV9ESVMJCQlSRUdfQklUKDIyKQ0KPiA+ID4g
PiAgDQo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfd2EuYyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV93YS5jDQo+ID4gPiA+IGluZGV4IDVlZjM1NjExMDE0NjYuLjBj
MTI3MDBiZWRkZTUgMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV93
YS5jDQo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV93YS5jDQo+ID4gPiA+IEBA
IC02NjAsNiArNjYwLDE5IEBAIHhlX3dhX3Byb2Nlc3NfcnVudGltZV93YXNfZW5naW5lKHN0cnVj
dCB4ZV9yZWdfc3IgKnNyLA0KPiA+ID4gPiAgCQkJCQkgICBDTURfQ0NUTF9NT0NTX09WRVJSSURF
KG1vY3NfdywgbW9jc19yKSwNCj4gPiA+ID4gIAkJCQkJICAgWEVfUlRQX0FDVElPTl9GTEFHKE1B
U0tFRF9SRUcsIEVOR0lORV9CQVNFKSkpLA0KPiA+ID4gPiAgCQl9LA0KPiA+ID4gPiArCQkvKg0K
PiA+ID4gPiArCQkgKiBTb21lIGJsaXR0ZXIgY29tbWFuZHMgZG8gbm90IGhhdmUgYSBmaWVsZCBm
b3IgTU9DUywgdGhvc2UNCj4gPiA+ID4gKwkJICogY29tbWFuZHMgd2lsbCB1c2UgTU9DUyBpbmRl
eCBwb2ludGVkIGJ5IEJMSVRfQ0NUTC4NCj4gPiA+ID4gKwkJICogQkxJVF9DQ1RMIHJlZ2lzdGVy
cyBhcmUgbmVlZGVkIHRvIGJlIHByb2dyYW1tZWQgdG8gdW4tY2FjaGVkLg0KPiA+ID4gPiArCQkg
Ki8NCj4gPiA+ID4gKwkJeyBYRV9SVFBfTkFNRSgiQkxJVF9DQ1RMX2RlZmF1bHRfTU9DUyIpLA0K
PiA+ID4gPiArCQkgIFhFX1JUUF9SVUxFUyhHUkFQSElDU19WRVJTSU9OX1JBTkdFKDEyMDAsIFhF
X1JUUF9FTkRfVkVSU0lPTl9VTkRFRklORUQpLA0KPiA+ID4gPiArCQkJICAgICAgIEVOR0lORV9D
TEFTUyhDT1BZKSksDQo+ID4gPiA+ICsJCSAgWEVfUlRQX0FDVElPTlMoRklFTERfU0VUKEJMSVRf
Q0NUTCgwKSwNCj4gPiA+ID4gKwkJCQkgQkxJVF9DQ1RMX01BU0ssDQo+ID4gPiA+ICsJCQkJIEJM
SVRfQ0NUTF9NT0NTKG1vY3NfdywgbW9jc19yKSwNCj4gPiA+ID4gKwkJCQkgWEVfUlRQX0FDVElP
Tl9GTEFHKE1BU0tFRF9SRUcsIEVOR0lORV9CQVNFKSkpDQo+ID4gPiANCj4gPiA+IEV2ZW4gdGhv
dWdoIEJMSVRfQ0NUTCBsb29rcyBhIGxvdCBsaWtlIENNRF9DQ1RMIG9uIHRoZSBzdXJmYWNlLCB0
aGVyZQ0KPiA+ID4gYXJlIHNvbWUgaW1wb3J0YW50IGRpZmZlcmVuY2VzIGJldHdlZW4gdGhlIHR3
byB0aGF0IG5lZWQgdG8gYmUgbm90ZWQNCj4gPiA+IGhlcmU6DQo+ID4gPiANCj4gPiA+ICAtIEJM
SVRfQ0NUTCBpcyBub3QgYSBtYXNrZWQgcmVnaXN0ZXIuDQo+ID4gPiAgLSBCTElUX0NDVEwgaXMg
cGFydCBvZiBhbiBlbmdpbmUgY29udGV4dCAoZS5nLiwgYnNwZWMgNDU1ODUpLCBzbyBpdA0KPiA+
ID4gICAgd291bGQgbmVlZCB0byBldmVudHVhbGx5IHdpbmQgdXAgb24gYW4gTFJDIGxpc3QsIG5v
dCBhIEhXRSBsaXN0Lg0KPiA+ID4gDQo+ID4gPiBUaGUgaW5jb25zaXN0ZW5jeSBpbiBoYXJkd2Fy
ZSBkZXNpZ24gaGVyZSBpcyBmcnVzdHJhdGluZy4uLg0KPiA+ID4gDQo+ID4gPiBBbHNvIG5vdGUg
dGhhdCBCTElUX0NDVEwgaXMgZGlyZWN0bHkgd3JpdGFibGUgYnkgdXNlcnNwYWNlIChic3BlYyA0
NTU0NikNCj4gPiA+IHNvIEkgcXVlc3Rpb24gd2hldGhlciBpdCdzIGV2ZW4gb3VyIHJlc3BvbnNp
YmlsaXR5IHRvIGRvIHRoaXMgaW4gWGUuDQo+ID4gPiBJdCdzIHRvbyBsYXRlIHRvIGZpeCBpOTE1
IG5vdyAoYXQgbGVhc3QgZm9yIGN1cnJlbnQgcGxhdGZvcm1zKSwgYnV0IEknZA0KPiA+ID4gc3Vn
Z2VzdCBqdXN0IGRyb3BwaW5nIHRoaXMgc2Vjb25kIHBhdGNoIGZvciBYZSBhbmQgbGVhdmluZyBp
dCB0bw0KPiA+ID4gdXNlcnNwYWNlIHRvIHByb2dyYW0gd2hhdGV2ZXIgdmFsdWUgdGhleSB3aXNo
IGZvciB0aGVpciBvd24gY29udGV4dC4NCj4gDQo+IG9uZSBtaWdodCBhcmd1ZSB0aGF0IHRoZSBN
T0NTIHdhcyBjcmVhdGVkIGV4YWN0bHkgdG8gYmUgYW4gaW1wbGljaXQNCj4gQVBJIHdpdGgga2Vy
bmVsIGFsd2F5cyByZXNwb25zaWJsZSBmb3IgcHJvZ3JhbW1pbmcuIEJ1dCBJIHNlZSB5b3VyIHBv
aW50Li4uDQo+IA0KPiA+IA0KPiA+IENjOiBSb2RyaWdvDQo+ID4gDQo+ID4gT2theSB3aWxsIHNl
bmQgdGhlIGZpcnN0IHBhdGNoIHdpdGggY29tbWVudHMgYWRkcmVzc2VkLg0KPiA+IA0KPiA+IFRo
ZW4gaWYgZGVjaWRlZCB0byBub3QgcHJvZ3JhbSB0aGlzIGluIEtNRCBpdCBuZWVkcyB0byBiZSBk
b2N1bWVudGVkIHB1YmxpY2x5Lg0KPiANCj4gWWVhcCwgSSBmdWxseSBhZ3JlZS4NCj4gDQo+ID4g
VG9nZXRoZXIgd2l0aCBhbGwgb3RoZXIgc21hbGwgYmVoYXZpb3IgY2hhbmdlcyBmcm9tIGk5MTUs
IE1JX0JBVENIX0JVRkZFUl9TVEFSVCBpcyBvdGhlciBjYXNlIHdoZXJlIGJlaGF2aW9yIGNoYW5n
ZWQuDQo+IA0KPiBXaGF0J3MgdGhlIGJlaGF2aW9yIGRpZmZlcmVuY2UgaW4gdGhpcyBjYXNlPw0K
PiANCj4gQ291bGQgeW91IHBsZWFzZSBmaWxlIGEgZ2l0bGFiIGlzc3VlIGZvciB0aGlzIGRvY3Vt
ZW50YXRpb24gb2YgdGhlIGRpZmZlcmVuY2VzDQo+IGFuZCBpbmNsdWRlIHRoZSBkZXRhaWxzIHlv
dSBhbHJlYWR5IGtub3c/IFNvIEkgd2lsbCBhZGQgdGhpcyB0byB0aGUgZG9jIHdoZW4NCj4gSSBn
ZXQgc29tZSB0aW1lIHRvIHN0YXJ0IG9yZ2FuaXppbmcgdGhlIGRvY3MuDQoNCkRvbmU6IGh0dHBz
Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0veGUva2VybmVsLy0vaXNzdWVzLzI1OQ0KDQpX
aGlsZSB3ZSBkaXNjdXNzIHBhdGNoIDIsIGNhbiBzb21lb25lIHBsZWFzZSByZXZpZXcgcGF0Y2gg
MSA/DQpWZXJzaW9uIHdpdGggY29tbWVudHMgYWRkcmVzc2VkIGhlcmU6IGh0dHBzOi8vcGF0Y2h3
b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTE2OTQzLw0KDQpNYXR0UiBpcyBvdXQgZm9yIGEg
ZmV3IGRheXMuDQoNCj4gDQo+IFRoYW5rcywNCj4gUm9kcmlnby4NCj4gDQo+ID4gDQo+ID4gVGhp
cyB3aWxsIHNhdmUgYSBsb3Qgb2YgZGVidWcgdGltZSBpbiB0aGUgb3RoZXIgVU1Ecy4NCj4gPiAN
Cj4gPiA+IA0KPiA+ID4gDQo+ID4gPiBNYXR0DQo+ID4gPiANCj4gPiA+ID4gKwkJfSwNCj4gPiA+
ID4gIAkJe30NCj4gPiA+ID4gIAl9Ow0KPiA+ID4gPiAgDQo+ID4gPiA+IC0tIA0KPiA+ID4gPiAy
LjQwLjANCj4gPiA+ID4gDQo+ID4gPiANCj4gPiANCg0K
