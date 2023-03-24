Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 535A5C6FD20
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 15:13:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C101D10E4B9;
	Fri, 24 Mar 2023 15:13:52 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D404810E4B9
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Mar 2023 15:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679670831; x=1711206831;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=1/5Gv9A1Ytee6JyOIMTlJRJzufgPwFyCgVV0XH/VghE=;
 b=L53EykBK2gQimADZU2N1eitzlhtsywDTS1qkGwElkrLrp59yusrBiFoM
 DYV9vh5sbFTaWb59n4wlUg4uxCsV03TB8lEKRBa5gpvOP8pEGcSyGYaoE
 FZCgxRimCJyZh7jSbprrPdfE3zj0jbgAjdLzlMqKAy7MxvgIF89pYxvQc
 C4FJvKI/7saohKR7dov3r21Aw40BXdswCDImX/Ibjz/Ug992RfI7D7CoD
 tNtxW61D7VedIWfpyo6z1yG4m9I7e7Hs8QSXzN4jS4YWMQ/obsnHYkYn/
 ENnr1lU8Ku9IWm5gQyiiAeHD299qb0diPDA7MsHy837CGO9Q1nfDQnly+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="337301960"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="337301960"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 08:13:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="747179973"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="747179973"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP; 24 Mar 2023 08:13:51 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 08:13:50 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 08:13:50 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 24 Mar 2023 08:13:50 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 24 Mar 2023 08:13:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lfjGH/u7wHZfbqaVKHrHIPQ93jbQZSn2W0iwX+3i6asDCZ5WEl5B9hbyffFaEUcCZnnRk08sx3YGZzg7b+yhCPOsPnjmnRjws4R7bbVVW/Ejc5yEHOo0z32hohG0g6YymSSjoCddVmbIOAUEtMPVLDQmX4GNzuGJwjKUNPAquIGfhGk30A4NvRGdpdoaahjMN4RLuAJV7Ojqu9l8A95BjfSnKSYKsFn1iUULYHn34PdzfpCUJooh+x3mitqHBODnlH8ENsckHlcQU61Rrdq84DOJkqGsn3mvnH0WmT9N43NNtc4rSkbAlgN9hKeZYhIvHtULzDsKvU55S9bLh622lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/5Gv9A1Ytee6JyOIMTlJRJzufgPwFyCgVV0XH/VghE=;
 b=F4WWULIgIqbTY1WzN+e6vsG7ZpmW5AU7IqSY2xh6V8WqxGqIDC1iAzKQLZBGUBVWEicdyn4xsLAYpUlh0TwUjWw0ZwLsrgHNF0ZPpKpbyZyDD1RK97KpQ8E6sgtGr+yUci2qbUWBBautAPVTe09M2AJgqc/y2eujY3NDRDwAXT9PD+Cr8G4oWXyOgcdPmbZYmB7BbnTbdkC6/NOnpC8EbArR2CjmWyTS0UK+kk/FA/ZttGLV3YoSq2y06KnNBo/rTlR+vRMaV/TJf0hW5EDmuVpEjYTrlZgU+9Zu62RUR4kEKdVaWFJ/3q2OyFu7HR5WtD0nP4Enp727RrhSm4aFkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY4PR11MB2054.namprd11.prod.outlook.com (2603:10b6:903:2d::9)
 by MW6PR11MB8392.namprd11.prod.outlook.com (2603:10b6:303:23a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 15:13:48 +0000
Received: from CY4PR11MB2054.namprd11.prod.outlook.com
 ([fe80::ecb6:23da:cb6c:683b]) by CY4PR11MB2054.namprd11.prod.outlook.com
 ([fe80::ecb6:23da:cb6c:683b%10]) with mapi id 15.20.6178.038; Fri, 24 Mar
 2023 15:13:47 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>
Thread-Topic: [PATCH v2 1/6] drm/xe: add XE_BO_CREATE_VRAM_MASK
Thread-Index: AQHZXX8DODXsITkpnEyI2nKYG5KP0q8KC3QA
Date: Fri, 24 Mar 2023 15:13:47 +0000
Message-ID: <fac8b38f89330f9270f0429a213560ed07d25522.camel@intel.com>
References: <20230323115926.391900-1-matthew.auld@intel.com>
 <20230323115926.391900-2-matthew.auld@intel.com>
In-Reply-To: <20230323115926.391900-2-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY4PR11MB2054:EE_|MW6PR11MB8392:EE_
x-ms-office365-filtering-correlation-id: 4183cb74-516c-478e-7728-08db2c7a5ded
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4LH6p4Fll+2oSi1bC23Zg2qBKUWOIV3NSod3LqZllWD1NZC2kRZoq37ey37uKgKRmRiLXcAk847oyGwSZOgugJDTeEHOUQegegR/vW9sNscfnzACkCgwhNvJ49NGYCiOIvKJ7OdQtxyR+pt3nZzLDixtmG4mzd+i9ZctvqYOky8JrwJ9CSqKi4EoF2Tp+fJaOxM3Pp6cnXk5qu+q83gE9noJg6ElP3OcCCwUgs2WmKO5a6i+KNoY7j3cupy5eyyLYg1NZ5H6uEvtwhcKAm7n738Q/eFkuW5Gra+3MNBgagvNYxYJqSUuSrrtJ5xurAC3hDXMvMPooKX77xKBBUFPP+QO/cw9bekC3rApKSPA8cPR9XzKSu4jtjI2yfVcvXaax7DzrCSuvmVL0nZS2OLdPLCClcB8Yqnq3Z1LVs72YMlBisSWo70HIDopxzO4ZWf8QRGIKIsd3fIUV7vOK0oSD0hgVMHnivcF1vcabsvMukzn5tluld3VSlWTvkaYsXY3514EMyYQoLWzZrUD96H18R9ZgvbDOgFd+ejrQR/Vkmj5LOV7z8DSgX4tZgEnGmb3fEv6EB9gEm3TPhYBaWb4dYqzm7ChvOdvgq2TG4uQN4wf2sfwxFdbjwc10gyWb35ippW/QHfsSQslNt7CrTrDlLav1bfuA0tKmO3mR01z/52ZTkekljAeWmXxHE4tyX7AvSNaSI0MU1mAiQgkxqY5gA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR11MB2054.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(366004)(376002)(39860400002)(346002)(451199018)(38100700002)(2906002)(2616005)(38070700005)(478600001)(6486002)(36756003)(186003)(86362001)(83380400001)(71200400001)(6636002)(91956017)(316002)(66946007)(66556008)(110136005)(76116006)(66476007)(8676002)(64756008)(5660300002)(66446008)(8936002)(6506007)(122000001)(26005)(6512007)(82960400001)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bUhSUDlGVnc3c3ZiUlI1TXVXWldZMTdqcjV5aVNDOGVzVS9BVXZLenhkZHZC?=
 =?utf-8?B?aWQ4Mnl5TWFuY0ZaRU1YQlRuNHlyMFh0dEdLdnlUWExmaHBSQlR6QmdKUlow?=
 =?utf-8?B?ei9qc3FiOWxIR1A5dFRHWVI3QjQ5U1ozSjdBckpKUnlMNElKeEYzVGViaU1w?=
 =?utf-8?B?OWFjRzFJNVErdmtwbm1BN2o1SWRjZ2RuQThPTzErVE9xSDJzcHUrQXZIbFZZ?=
 =?utf-8?B?a21iYWpsa2ZiSE5RMTlTc3M4RlI3UTlHK2xlUHdybFFlTFRVdldNcno5UEhs?=
 =?utf-8?B?VExTQWZEQjJqc1lWaUwyNytFZVNCNnAwa09WVDZDNzdQRjJoT0lOMEw4c2Ft?=
 =?utf-8?B?VDZOSzlGT0JIUlNTRzZleUR2MG5PS1I3ZEc2V294bG5hSHlpdWtSTEJZRXRR?=
 =?utf-8?B?bUwxbWVFYTBRaHF0bDZ1NnZPY0lXVW1GWXpMTkZWamVxM0VuSGtsZ25OL2FP?=
 =?utf-8?B?Um5wZm1zNktUNjlYK2k3WU9QanlIUzQ0M0NGRHZoNTBGRCtXZWVlR2htWWJS?=
 =?utf-8?B?d0JnTTlwNUx5YkdOeWtxUGtkdEFVRkZvMGFDdHArT0Jtb2RCTGV3MnB0WjN6?=
 =?utf-8?B?L05SeURvWkVLMWs2aTk0d0FLS1FWeVNXZC9PbEhJTXJaMnVzdHk4eGNuUHhj?=
 =?utf-8?B?ZnI5RnhyZ0hPRjErN1RXYjVmMXIrcDJ6YTkrTy91UmhaeHNBN2FXVE0rbVVJ?=
 =?utf-8?B?U2UzVHFYM3gvS3pZVHc2ZGlTTzhOTjNQOEFxenpLTUQzODMxRExCcTl5cnVv?=
 =?utf-8?B?OU5rU0E2R1M1QzVhcmNyM1VtdU1VY0ZTUjRWd0lRMkcwNE5pSXdLV3RiVDJa?=
 =?utf-8?B?Y2xvYnFDbnFCeW9YMDdSOVlOcWdrcTNOaUp4ZWhCaGI4OWZIdkJRK3pweDk2?=
 =?utf-8?B?ZjdLcVFQSXUvT0ozTmxoWFhzbXloMWFQSU1JVTRXVzNCbEF1QVdwU01VRzcr?=
 =?utf-8?B?Mk5QSHV3WE9CUUlLRE9BUEN4MExMSm9SWUZUWUI3bzFrdlFlZ1BIMlA2UnNt?=
 =?utf-8?B?N0NXeVpYcEY0WWJLdzdJUEg5NzNad2YwMWpIZUtiZmdyUytZR01MbU9ENm96?=
 =?utf-8?B?M0RVN1JtWW8rcWwrNG9KZW9oa0VJQW0zT1IvejFhRTlsblhna1N4ZlBrZDJO?=
 =?utf-8?B?UEJxQ1Jkem85Wm9xa3ZnbGhMV3B5N05vcHlVdmdwd2s2cGpweHc1Tmttd1FY?=
 =?utf-8?B?R3c0VnVzRkwwQmhSOGFwSE9QakVFMFBnTHc2QXhCeWptWkpHWnFtbm96V3ZM?=
 =?utf-8?B?QmxTZHJheDFxQTJVY1g5YmR1dE5tVGp4QW8yZE5Md3o0QWFPY1dscnRGd0VJ?=
 =?utf-8?B?UjhoVHF3b0dRVHc4aCs1K2pudklWajA4eVRLNnZtdXBhRGN4aC9SUE0wRE5B?=
 =?utf-8?B?K3E1ekN0dW9mbjZNNXJBOFMvbWN1cTRTb2Uxa0VIeUhpT01xaWloU0NYSlRz?=
 =?utf-8?B?amhwUzNGSWM4d0dwcm9WN3JLSXV3WXkvNDZrNFVQUTA5c2R1RWIxUDNBaW9Q?=
 =?utf-8?B?bDBnMGc0dCtuU3F6THlmSlAwWGNXWVRYUmlmRERzbmpUYW1xRmVGZFpES2Jk?=
 =?utf-8?B?bWV3bVdzVmpad2N4T0I4MEpqRXJ1UXpoVlFqTTJSVnRnbXdlRnBRQjh0MHhv?=
 =?utf-8?B?T2RBZlMvN2J2VjFBc1ZPa0Y1TTczVi8ySVZhTmR0eS90Wm5lK3VZNUw2enhr?=
 =?utf-8?B?ZUoxcjlzdG5KYTNnbXphR3N3UjRTcElPU1dkVjNWUmxDRmlmM2kxK2E1ckUx?=
 =?utf-8?B?T3EzeEdybGRZbmI0a3lXYlV0dDRQYlFRMldWblVJczZ0aCtlZE5pRHhHOFpn?=
 =?utf-8?B?UjJLakdycWpwcGw1eDhwTnNaQ1lJWC9HeWRNdjlUSmtHeS8xY3FMK0dmUUNp?=
 =?utf-8?B?S05RSGU1akwvVmlFZzN2NVFXcEtMQ1kwUUhLRmk4ak9NUzVpalphY1dPd1U2?=
 =?utf-8?B?YjlJaXF3WWZMN0U1d2xYdlZWZ0JIOTNBVDl3WU5xMUFIekFxRXhGeGYveldL?=
 =?utf-8?B?K0poeFBTUVpmRjBFc0J6MElwaTc0TG0vVzJJRENXYmdsam9xdGYwQlg4S28y?=
 =?utf-8?B?V3hYTHd2NVM2QkVOZEZNTUtrMFJXT1VNU2RGK1EwQm14blFmbkJVVkVWTThK?=
 =?utf-8?B?OEhOVmxtWW5ROHZlclJLMUtYalJGbFQ3b24ybC9UZ253RVFrMkY1QmJRWmpF?=
 =?utf-8?B?MWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8FD24A60768F5F4A8387A357330D33FC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB2054.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4183cb74-516c-478e-7728-08db2c7a5ded
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2023 15:13:47.6064 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: THg8quscjMzJ6VucrByOES8URvv2uS0eqlkdgla7ripK+oDwIdB5fwZX0gXDeXsCh0u9RA9qySLIOOx/jxbNIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8392
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/6] drm/xe: add XE_BO_CREATE_VRAM_MASK
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

T24gVGh1LCAyMDIzLTAzLTIzIGF0IDExOjU5ICswMDAwLCBNYXR0aGV3IEF1bGQgd3JvdGU6DQo+
IFNvIHdlIGRvbid0IGhhdmUgdG8ga2VlcCByZXBlYXRpbmcgVlJBTTAgfCBWUkFNMS4gQWxzbyBp
ZiB0aGVyZSBhcmUgZXZlcg0KPiBtb3JlIGluc3RhbmNlcywgdGhlbiB3ZSBoYXZlIGxlc3MgcGxh
Y2VzIHRvIHVwZGF0ZS4NCj4gDQoNClJldmlld2VkLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXph
IDxqb3NlLnNvdXphQGludGVsLmNvbT4NCg0KPiBTdWdnZXN0ZWQtYnk6IEpvc8OpIFJvYmVydG8g
ZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3
IEF1bGQgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2JvLmMgfCA4ICsrKy0tLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uaCB8
IDIgKysNCj4gIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jIGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2JvLmMNCj4gaW5kZXggYWI5Y2Q5Mjg2Zjc3Li5hZjQyMDBhYTk0OWYg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9iby5jDQo+IEBAIC05ODcsOCArOTg3LDcgQEAgc3RydWN0IHhlX2Jv
ICpfX3hlX2JvX2NyZWF0ZV9sb2NrZWQoc3RydWN0IHhlX2RldmljZSAqeGUsIHN0cnVjdCB4ZV9i
byAqYm8sDQo+ICAJfQ0KPiAgDQo+ICAJYm8tPnJlcXVlc3RlZF9zaXplID0gc2l6ZTsNCj4gLQlp
ZiAoZmxhZ3MgJiAoWEVfQk9fQ1JFQVRFX1ZSQU0wX0JJVCB8IFhFX0JPX0NSRUFURV9WUkFNMV9C
SVQgfA0KPiAtCQkgICAgIFhFX0JPX0NSRUFURV9TVE9MRU5fQklUKSAmJg0KPiArCWlmIChmbGFn
cyAmIChYRV9CT19DUkVBVEVfVlJBTV9NQVNLIHwgWEVfQk9fQ1JFQVRFX1NUT0xFTl9CSVQpICYm
DQo+ICAJICAgICEoZmxhZ3MgJiBYRV9CT19DUkVBVEVfSUdOT1JFX01JTl9QQUdFX1NJWkVfQklU
KSAmJg0KPiAgCSAgICB4ZS0+aW5mby52cmFtX2ZsYWdzICYgWEVfVlJBTV9GTEFHU19ORUVENjRL
KSB7DQo+ICAJCXNpemUgPSBBTElHTihzaXplLCBTWl82NEspOw0KPiBAQCAtMTA1Miw4ICsxMDUx
LDcgQEAgc3RhdGljIGludCBfX3hlX2JvX2ZpeGVkX3BsYWNlbWVudChzdHJ1Y3QgeGVfZGV2aWNl
ICp4ZSwNCj4gIAlwbGFjZS0+ZnBmbiA9IHN0YXJ0ID4+IFBBR0VfU0hJRlQ7DQo+ICAJcGxhY2Ut
PmxwZm4gPSBlbmQgPj4gUEFHRV9TSElGVDsNCj4gIA0KPiAtCXN3aXRjaCAoZmxhZ3MgJiAoWEVf
Qk9fQ1JFQVRFX1NUT0xFTl9CSVQgfA0KPiAtCQlYRV9CT19DUkVBVEVfVlJBTTBfQklUIHxYRV9C
T19DUkVBVEVfVlJBTTFfQklUKSkgew0KPiArCXN3aXRjaCAoZmxhZ3MgJiAoWEVfQk9fQ1JFQVRF
X1NUT0xFTl9CSVQgfCBYRV9CT19DUkVBVEVfVlJBTV9NQVNLKSkgew0KPiAgCWNhc2UgWEVfQk9f
Q1JFQVRFX1ZSQU0wX0JJVDoNCj4gIAkJcGxhY2UtPm1lbV90eXBlID0gWEVfUExfVlJBTTA7DQo+
ICAJCWJyZWFrOw0KPiBAQCAtMTc1OSw3ICsxNzU3LDcgQEAgYm9vbCB4ZV9ib19uZWVkc19jY3Nf
cGFnZXMoc3RydWN0IHhlX2JvICpibykNCj4gIHsNCj4gIAlyZXR1cm4gYm8tPnR0bS50eXBlID09
IHR0bV9ib190eXBlX2RldmljZSAmJg0KPiAgCQkhKGJvLT5mbGFncyAmIFhFX0JPX0NSRUFURV9T
WVNURU1fQklUKSAmJg0KPiAtCQkoYm8tPmZsYWdzICYgKFhFX0JPX0NSRUFURV9WUkFNMF9CSVQg
fCBYRV9CT19DUkVBVEVfVlJBTTFfQklUKSk7DQo+ICsJCShiby0+ZmxhZ3MgJiBYRV9CT19DUkVB
VEVfVlJBTV9NQVNLKTsNCj4gIH0NCj4gIA0KPiAgLyoqDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfYm8uaCBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5oDQo+IGluZGV4
IGY4NDFlNzRjZDQxNy4uM2MzYTA5ZjQ3ZmI0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0veGUveGVfYm8uaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uaA0KPiBAQCAt
MTcsNiArMTcsOCBAQA0KPiAgI2RlZmluZSBYRV9CT19DUkVBVEVfU1lTVEVNX0JJVAkJQklUKDEp
DQo+ICAjZGVmaW5lIFhFX0JPX0NSRUFURV9WUkFNMF9CSVQJCUJJVCgyKQ0KPiAgI2RlZmluZSBY
RV9CT19DUkVBVEVfVlJBTTFfQklUCQlCSVQoMykNCj4gKyNkZWZpbmUgWEVfQk9fQ1JFQVRFX1ZS
QU1fTUFTSwkJKFhFX0JPX0NSRUFURV9WUkFNMF9CSVQgfCBcDQo+ICsJCQkJCSBYRV9CT19DUkVB
VEVfVlJBTTFfQklUKQ0KPiAgLyogLS0gKi8NCj4gICNkZWZpbmUgWEVfQk9fQ1JFQVRFX1NUT0xF
Tl9CSVQJCUJJVCg0KQ0KPiAgI2RlZmluZSBYRV9CT19DUkVBVEVfVlJBTV9JRl9ER0ZYKGd0KSBc
DQoNCg==
