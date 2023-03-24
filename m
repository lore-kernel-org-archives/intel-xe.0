Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C0BDC76196
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 15:19:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 024A010E17B;
	Fri, 24 Mar 2023 15:19:28 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E89FC10E17B
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Mar 2023 15:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679671165; x=1711207165;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=EfT3tlIMyyoGYXebfE/NDrZ1Dr1/K36+jJXQUuj6Aqk=;
 b=HXhsKKNx15TUqLsPxUmuRR84MmDBLRg8FsgMqc4pn8EGmP1DbMg2ZniX
 fNW6PgqhinpFiBa7B1iUnNVU3b4lK6VMZQi3XJPOEn7viv6aa5P7Xq6ro
 GZBZc85GA7XdbxxZ59cnjZ56EBNH3OcDZ0+FdrmE1srRxiypKc8lix3O2
 bbP1G0cpon97l1HdC63QjCVO/rMNbkKlT92KdBJRHWFouQihyvuv9ewkm
 4INWru0LPwcnR8+80tsY+dSxEa6C8MpOqGdDDuqXEWYl0nDCFWnsfpkDa
 j9vt1V23v6EutPkwysq27JmcFf5PYoWraYNEiAgKQ9m/9MCdPpp8Twxo9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="337304213"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="337304213"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 08:19:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="793474848"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="793474848"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 24 Mar 2023 08:19:23 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 08:19:19 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 24 Mar 2023 08:19:19 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 24 Mar 2023 08:19:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jfbiejtSTJ84JhhLId3UvMAr4jun8zL1FvNXHqOfmfEDkGVyjuLgmdiI7NXbTZEaWh92xvzcmF4JcLe8BEK+wOkpgmiPvQIQL4rmSUBiUpyIpM1ODY8lFS3UJnARV1H2nPZx2h8TtxHEm8y0a1py/NEeLSJZdQFRfvhePlu7wtpxi3SX2mknURye1Qrl96/59Ywo32/JxSud/nTnG9ZKZUrxKLLdx6qNGxzHauAJT4xg+N9TKdCCkf4RvyACTbUQ91A6hLBwKjH5nmLPVTG+UASu1eT9Lm4GKmvzsGtCk5WQDvgrPLVhtVqBJu9z2ZYBTsH+6qfBwZLIvG07Y3+Q9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EfT3tlIMyyoGYXebfE/NDrZ1Dr1/K36+jJXQUuj6Aqk=;
 b=UJ2K2qgorfPuwrs34VMv88o0sD5KBRCYQoZQO+90P+FHYjERu36NOKKbgnMKumiUg/FcJjVEaVS0CE7jHk5g4iQS12TE3tD0clijzJ6yk4gmx6R9K6Er+qHAISH4hPNGEBr191SVdibC9EIuRbWXlNSeV5lp3/8uNtShdNNhiFZuevEqI18VG69BHmixUyCq0nIZpd2Qepg410FjKtfHU67WFb9UBprH5GU8Ih0vdCb7FjAmLu2Kv6WcpG1iZ52AgjIWQOf4HWy9oBNUjEBprBColMlLq4XLeTDZiB4pzJycxXbORjfWRJ8LD2NxboK+I0Ta/dcj57t3+Rj4gBa8fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY4PR11MB2054.namprd11.prod.outlook.com (2603:10b6:903:2d::9)
 by SA3PR11MB7463.namprd11.prod.outlook.com (2603:10b6:806:304::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.39; Fri, 24 Mar
 2023 15:19:17 +0000
Received: from CY4PR11MB2054.namprd11.prod.outlook.com
 ([fe80::ecb6:23da:cb6c:683b]) by CY4PR11MB2054.namprd11.prod.outlook.com
 ([fe80::ecb6:23da:cb6c:683b%10]) with mapi id 15.20.6178.038; Fri, 24 Mar
 2023 15:19:17 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>
Thread-Topic: [PATCH v2 2/6] drm/xe/bo: refactor try_add_vram
Thread-Index: AQHZXX8Jay3cqagf/UWvE5lf2W3mZa8KDPyA
Date: Fri, 24 Mar 2023 15:19:16 +0000
Message-ID: <3e93e7a1a99097ab1e92a516a2499d9afceea40c.camel@intel.com>
References: <20230323115926.391900-1-matthew.auld@intel.com>
 <20230323115926.391900-3-matthew.auld@intel.com>
In-Reply-To: <20230323115926.391900-3-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY4PR11MB2054:EE_|SA3PR11MB7463:EE_
x-ms-office365-filtering-correlation-id: c176ab2a-0fe0-4911-79b1-08db2c7b223c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B/tAz1AjngSXeljd9SKGGz3slrBJdiU96BYQVosnvIFO1SQi/mB31UVkmUsuC3CkOl26I0oJXsOj8lAn+QYMoopR8PWlwM1Sh4cxWrTSICRXIrwLuDO5PSg3uWC8nqUZTTDxX8+5pz+3AqJHPpNHTcJI+fC5jMKOWoYmxC11D3AxUYKclvT/uFfiCCn0uWP9iRYkko0ssvHxkzO20s/hTyh+MPDzkPRqyvlWu/bMHqQeG26n+k7q1c6UMPIQ/WlOIfG1/MjjOX3YZs72qzCQ7PmhBO98lVBeLMUA3CjNE3BJXugQQEw53aNG789/C/6uozhQvKQg1P450j+9mHuSCv3I4BRxfit3vqBbeT+4WUwtSlBjIWO7lIMLOaStNj6Iz7fMEEFS7+fEcNYVjbSn2hTyKW6u/i0BJr7PIgctzfzGuza5sysCGGF2OgSvGhYNrkvMeueC5MytoQF4MG+vrqjBD8HP/2u2dYwlEHHpNng386bOa5z7ISddbOjSr6nT+QvOa3DPmW8AVtqkCW3bAII5IGnenPqYq53k9MUbOxELbiNue4XyYe/iLyWNJ/QVBteEhD17OZGNoHjzfy2lOK7xFGx35ejh07HBjVwc1NNuWkP47IV5yTqF9i7GQef0ede9VXgeEHXr+VjDu0IbROEZJjaDvw6i7xxiYIP/TFxsoeh/fT1JqDS5Ge5Nbm2MrpFBM91W369sStnjnbVTrA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR11MB2054.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(136003)(346002)(396003)(366004)(39860400002)(451199018)(82960400001)(6486002)(36756003)(66476007)(110136005)(38100700002)(66556008)(6636002)(478600001)(66946007)(76116006)(91956017)(66446008)(2906002)(8676002)(64756008)(38070700005)(316002)(2616005)(186003)(122000001)(71200400001)(41300700001)(8936002)(86362001)(83380400001)(5660300002)(26005)(6512007)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T0dwVU5sVEVObGlQa0Q5Y0pRSVB3bUZMY29MK1lIWDdJSTlDMHkwYXQyUUNj?=
 =?utf-8?B?eFJCUExGbSt2RjRtN0dScXMvZDlRQ1h4Y0txTlYvL2o3eVN2QU9FbnBoZG5X?=
 =?utf-8?B?azQ5V0dYNlhHWG9KZ0hQY2E1Vk1zQ1pVK2pMejdlbzY1WGhlVzg2NlpkaWts?=
 =?utf-8?B?ODJtdGRVd2IxUHJUQ21iSmhBR2V1TnE4ZXh0WTNvVCtrK3ZLOW9nNFdzSjVp?=
 =?utf-8?B?UGRYQU1TVkpIendRdnhsbFUySlh3QkUyNEVzbTJIMEtCVVBacWw5MGhjZG1q?=
 =?utf-8?B?RnZodHZLcTNFSWxIdWtDMnFQd1dvaHpXSzFDempIV1hJTDZXVm1CMHlsS1Z5?=
 =?utf-8?B?Smd3Qlg3L0tmNUlNbml3aGVDQ1BvcU1oTGdwV3BYYWJKalVRRk5RMFc2ZGMr?=
 =?utf-8?B?M3gxM3l1Vkc2QVl6KzhHQ1h0dTUwc0kzaVdtWXEwUnMveFpyaTFwMW93N1Yr?=
 =?utf-8?B?cEdyeERVemk0c3JmZWc2cjdUSVJSeDlLRE5zbmpEWmI4akxSQXIrZWZhcU5K?=
 =?utf-8?B?MEhOOVpOU1RmMW5QakcrdzM3blg5MGdWUEdOdmVaU285TmRKcjc2NjVGMk9I?=
 =?utf-8?B?N084SHR3VFN0NmZCdkVGdko5MDI0aU1CRlU5OHIreGdlVnF1cHkxTUNkOUlI?=
 =?utf-8?B?Q1JPbHBKVkwraWpGT1ZEZDVQazVJeXFRL2FUcDVZWUQyRWZ4WlpMWStxV0l6?=
 =?utf-8?B?akNnQk1qc3o2cTdqMDhqdXRJRlpveTBpVjVpQzhJZG5IMWtGWmkvT213RVdr?=
 =?utf-8?B?cmlOSW1vWllzQ0VqdW1qZGlkT2ZDbkFCRldlS3Bvd2VNaHRGU2RLSDJWREF0?=
 =?utf-8?B?R2VNZ1IwRXlNL0g0TFdDTWhhUVlCbTFVejRURy9tRm80Um1Yc1hyL0E5WWxu?=
 =?utf-8?B?TUFINFFYM003VXVYdytJYUpEN1ErVjQ4Uk9vNmYwLzJ0V2VicndEam9sSWZy?=
 =?utf-8?B?RkR0S2czNnp1dlhIYmNiNDRzT2hkSDkzWGRocWZZZkMxSkdFbjUyYkJOQmVY?=
 =?utf-8?B?TkVnOHNzR210WlhmdXd0RTBDRktYQ1JINS9qZkZsNjZ6NWhQdzA5bm5qcWpy?=
 =?utf-8?B?K1pQL0dGczRmQTdPNTl6cW9jN0hZTG40V0JCc3QzTlFqTGtZbnZEUnlBYWJZ?=
 =?utf-8?B?NERLZ2tDdU1hblhHSFovZFExOWxLTEZiWHNNMndLTVRRWWxhOFYza0xyMWRK?=
 =?utf-8?B?V21YWWFXWUQwbENNNk4xdzRBMWR3U203Rnczc2tIRlR6dEs4YUZzaWUra3Bt?=
 =?utf-8?B?QTZmYnNiNXBDd3ZFYXg2TlFnN0xkTy96cEpTaDBDVURGaFZrRFRnTERxbndE?=
 =?utf-8?B?YTJSbERSWEFzT1VpMUt6bkMyQ29sVDlha0J4ZUpLcEdXRkVmSVFUQStXeXlM?=
 =?utf-8?B?bzdvN2lPUW5YYTlCeERtTUdablhzQkZpRDA2ZTZ0dGNFQkd2SkJaVjZ5dkRO?=
 =?utf-8?B?cjdQVjhtK0hDWjhYWHRPY045Tzc1a3NUSHFiaUZkRlMxV056WlUrL0VTWVhq?=
 =?utf-8?B?M3cwU0FqUW1zTEc3RHNwcFJYQ1RvSUJyVEhEVjYyWGFvaHVYNE82cW9YcUgx?=
 =?utf-8?B?SGx2dGlPNXdYSURwdjQ4RXY0TVE0TlpvWkp2eWRiSVhQTFFEYXJMK0FtWDlq?=
 =?utf-8?B?ZGR2Yk9mSzF6N3kvVjlMaEdHS2NkYklERHRnRDAxWVJvd0dhYzc5SVBaY3VG?=
 =?utf-8?B?K3BsVk9OMnlpcUp1L3VoV0dCY2ZKOWVGS1V2OGpRYWdPL1l0Z1lkS0ZZS2p0?=
 =?utf-8?B?M3J6KzFPZitPL2dKMzVmQW1WRHc0OHZxeWxyeW9YazA3UWphWjlOaWdKVUxh?=
 =?utf-8?B?K0taTEZTMUJIbzdkQXNLYXp2RzQ4TkZuQjAyWXVwaDdicVMwMVBpOHl4V0pE?=
 =?utf-8?B?VU4xRkRldEU5c1FDbWpNWjB6Sk1PQnI2bVRiTGNJbWFTK2ZqcWs4L3BTM3gr?=
 =?utf-8?B?c3pZR0RsY2NMbXV2cUhJanFRZEphaVJNZDhHU29RM2xnWTlqSFpzUzB2bDFz?=
 =?utf-8?B?cUFWUG1yeFArRTJYSEoyaXI4cURhV2ZWK2R4cE5VYjZKSUpPSm1KRkFhZ2dm?=
 =?utf-8?B?WFJPZjVwV0hxdkJ4aVpYM2R3Y0lsNkFnQ2RZRHBSWXJLOWliOWVrVisvTlJ5?=
 =?utf-8?B?bWxXdEsrUnU4ejV0UFVha25WSk5jNjcyRm9sdkpYWmZHYStyVUJIcVhEYzNk?=
 =?utf-8?B?M3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <88EB375A707ED24DA8F45B713FC85523@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB2054.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c176ab2a-0fe0-4911-79b1-08db2c7b223c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2023 15:19:16.9732 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mZzVghgtAwG6JtN6cdTgK2Dsgtb9B1jyhYah/881QWqKGalu22gktywPaUjBI1wETOXQg5rIwG0WBP/4XTc0Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7463
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/6] drm/xe/bo: refactor try_add_vram
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
IEdldCByaWQgb2Ygc29tZSBvZiB0aGUgZHVwbGljYXRpb24gaGVyZS4gSW4gYSBmdXR1cmUgcGF0
Y2ggd2UgbmVlZCB0bw0KPiBhbHNvIGNvbnNpZGVyIFtmcGZuLCBscGZuXSwgc28gYmV0dGVyIGFk
anVzdCBpbiBvbmx5IG9uZSBwbGFjZS4NCj4gDQoNClJldmlld2VkLWJ5OiBKb3PDqSBSb2JlcnRv
IGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4NCg0KPiBTdWdnZXN0ZWQtYnk6IEpvc8Op
IFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5
OiBNYXR0aGV3IEF1bGQgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2JvLmMgfCA4NiArKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDU1IGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jIGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2JvLmMNCj4gaW5kZXggYWY0MjAwYWE5NDlmLi4xYzhlMGZiYWYx
ZGYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jDQo+IEBAIC05Myw1NSArOTMsNDIgQEAgc3RhdGljIHZv
aWQgdHJ5X2FkZF9zeXN0ZW0oc3RydWN0IHhlX2JvICpibywgc3RydWN0IHR0bV9wbGFjZSAqcGxh
Y2VzLA0KPiAgCX0NCj4gIH0NCj4gIA0KPiAtc3RhdGljIHZvaWQgdHJ5X2FkZF92cmFtMChzdHJ1
Y3QgeGVfZGV2aWNlICp4ZSwgc3RydWN0IHhlX2JvICpibywNCj4gLQkJCSAgc3RydWN0IHR0bV9w
bGFjZSAqcGxhY2VzLCB1MzIgYm9fZmxhZ3MsIHUzMiAqYykNCj4gK3N0YXRpYyB2b2lkIGFkZF92
cmFtKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCBzdHJ1Y3QgeGVfYm8gKmJvLA0KPiArCQkgICAgIHN0
cnVjdCB0dG1fcGxhY2UgKnBsYWNlcywgdTMyIGJvX2ZsYWdzLCB1MzIgbWVtX3R5cGUsIHUzMiAq
YykNCj4gIHsNCj4gLQlzdHJ1Y3QgeGVfZ3QgKmd0Ow0KPiArCXN0cnVjdCB4ZV9ndCAqZ3QgPSBt
ZW1fdHlwZV90b19ndCh4ZSwgbWVtX3R5cGUpOw0KPiAgDQo+IC0JaWYgKGJvX2ZsYWdzICYgWEVf
Qk9fQ1JFQVRFX1ZSQU0wX0JJVCkgew0KPiAtCQlndCA9IG1lbV90eXBlX3RvX2d0KHhlLCBYRV9Q
TF9WUkFNMCk7DQo+IC0JCVhFX0JVR19PTighZ3QtPm1lbS52cmFtLnNpemUpOw0KPiArCVhFX0JV
R19PTighZ3QtPm1lbS52cmFtLnNpemUpOw0KPiAgDQo+IC0JCXBsYWNlc1sqY10gPSAoc3RydWN0
IHR0bV9wbGFjZSkgew0KPiAtCQkJLm1lbV90eXBlID0gWEVfUExfVlJBTTAsDQo+IC0JCQkvKg0K
PiAtCQkJICogRm9yIGV2aWN0aW9uIC8gcmVzdG9yZSBvbiBzdXNwZW5kIC8gcmVzdW1lIG9iamVj
dHMNCj4gLQkJCSAqIHBpbm5lZCBpbiBWUkFNIG11c3QgYmUgY29udGlndW91cw0KPiAtCQkJICov
DQo+IC0JCQkuZmxhZ3MgPSBib19mbGFncyAmIChYRV9CT19DUkVBVEVfUElOTkVEX0JJVCB8DQo+
IC0JCQkJCSAgICAgWEVfQk9fQ1JFQVRFX0dHVFRfQklUKSA/DQo+IC0JCQkJVFRNX1BMX0ZMQUdf
Q09OVElHVU9VUyA6IDAsDQo+IC0JCX07DQo+IC0JCSpjICs9IDE7DQo+ICsJcGxhY2VzWypjXSA9
IChzdHJ1Y3QgdHRtX3BsYWNlKSB7DQo+ICsJCS5tZW1fdHlwZSA9IG1lbV90eXBlLA0KPiArCQkv
Kg0KPiArCQkgKiBGb3IgZXZpY3Rpb24gLyByZXN0b3JlIG9uIHN1c3BlbmQgLyByZXN1bWUgb2Jq
ZWN0cw0KPiArCQkgKiBwaW5uZWQgaW4gVlJBTSBtdXN0IGJlIGNvbnRpZ3VvdXMNCj4gKwkJICov
DQo+ICsJCS5mbGFncyA9IGJvX2ZsYWdzICYgKFhFX0JPX0NSRUFURV9QSU5ORURfQklUIHwNCj4g
KwkJCQkgICAgIFhFX0JPX0NSRUFURV9HR1RUX0JJVCkgPw0KPiArCQkJVFRNX1BMX0ZMQUdfQ09O
VElHVU9VUyA6IDAsDQo+ICsJfTsNCj4gKwkqYyArPSAxOw0KPiAgDQo+IC0JCWlmIChiby0+cHJv
cHMucHJlZmVycmVkX21lbV90eXBlID09IFhFX0JPX1BST1BTX0lOVkFMSUQpDQo+IC0JCQliby0+
cHJvcHMucHJlZmVycmVkX21lbV90eXBlID0gWEVfUExfVlJBTTA7DQo+IC0JfQ0KPiArCWlmIChi
by0+cHJvcHMucHJlZmVycmVkX21lbV90eXBlID09IFhFX0JPX1BST1BTX0lOVkFMSUQpDQo+ICsJ
CWJvLT5wcm9wcy5wcmVmZXJyZWRfbWVtX3R5cGUgPSBtZW1fdHlwZTsNCj4gIH0NCj4gIA0KPiAt
c3RhdGljIHZvaWQgdHJ5X2FkZF92cmFtMShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgc3RydWN0IHhl
X2JvICpibywNCj4gLQkJCSAgc3RydWN0IHR0bV9wbGFjZSAqcGxhY2VzLCB1MzIgYm9fZmxhZ3Ms
IHUzMiAqYykNCj4gK3N0YXRpYyB2b2lkIHRyeV9hZGRfdnJhbShzdHJ1Y3QgeGVfZGV2aWNlICp4
ZSwgc3RydWN0IHhlX2JvICpibywNCj4gKwkJCSBzdHJ1Y3QgdHRtX3BsYWNlICpwbGFjZXMsIHUz
MiBib19mbGFncywgdTMyICpjKQ0KPiAgew0KPiAtCXN0cnVjdCB4ZV9ndCAqZ3Q7DQo+IC0NCj4g
LQlpZiAoYm9fZmxhZ3MgJiBYRV9CT19DUkVBVEVfVlJBTTFfQklUKSB7DQo+IC0JCWd0ID0gbWVt
X3R5cGVfdG9fZ3QoeGUsIFhFX1BMX1ZSQU0xKTsNCj4gLQkJWEVfQlVHX09OKCFndC0+bWVtLnZy
YW0uc2l6ZSk7DQo+IC0NCj4gLQkJcGxhY2VzWypjXSA9IChzdHJ1Y3QgdHRtX3BsYWNlKSB7DQo+
IC0JCQkubWVtX3R5cGUgPSBYRV9QTF9WUkFNMSwNCj4gLQkJCS8qDQo+IC0JCQkgKiBGb3IgZXZp
Y3Rpb24gLyByZXN0b3JlIG9uIHN1c3BlbmQgLyByZXN1bWUgb2JqZWN0cw0KPiAtCQkJICogcGlu
bmVkIGluIFZSQU0gbXVzdCBiZSBjb250aWd1b3VzDQo+IC0JCQkgKi8NCj4gLQkJCS5mbGFncyA9
IGJvX2ZsYWdzICYgKFhFX0JPX0NSRUFURV9QSU5ORURfQklUIHwNCj4gLQkJCQkJICAgICBYRV9C
T19DUkVBVEVfR0dUVF9CSVQpID8NCj4gLQkJCQlUVE1fUExfRkxBR19DT05USUdVT1VTIDogMCwN
Cj4gLQkJfTsNCj4gLQkJKmMgKz0gMTsNCj4gLQ0KPiAtCQlpZiAoYm8tPnByb3BzLnByZWZlcnJl
ZF9tZW1fdHlwZSA9PSBYRV9CT19QUk9QU19JTlZBTElEKQ0KPiAtCQkJYm8tPnByb3BzLnByZWZl
cnJlZF9tZW1fdHlwZSA9IFhFX1BMX1ZSQU0xOw0KPiArCWlmIChiby0+cHJvcHMucHJlZmVycmVk
X2d0ID09IFhFX0dUMSkgew0KPiArCQlpZiAoYm9fZmxhZ3MgJiBYRV9CT19DUkVBVEVfVlJBTTFf
QklUKQ0KPiArCQkJYWRkX3ZyYW0oeGUsIGJvLCBwbGFjZXMsIGJvX2ZsYWdzLCBYRV9QTF9WUkFN
MSwgYyk7DQo+ICsJCWlmIChib19mbGFncyAmIFhFX0JPX0NSRUFURV9WUkFNMF9CSVQpDQo+ICsJ
CQlhZGRfdnJhbSh4ZSwgYm8sIHBsYWNlcywgYm9fZmxhZ3MsIFhFX1BMX1ZSQU0wLCBjKTsNCj4g
Kwl9IGVsc2Ugew0KPiArCQlpZiAoYm9fZmxhZ3MgJiBYRV9CT19DUkVBVEVfVlJBTTBfQklUKQ0K
PiArCQkJYWRkX3ZyYW0oeGUsIGJvLCBwbGFjZXMsIGJvX2ZsYWdzLCBYRV9QTF9WUkFNMCwgYyk7
DQo+ICsJCWlmIChib19mbGFncyAmIFhFX0JPX0NSRUFURV9WUkFNMV9CSVQpDQo+ICsJCQlhZGRf
dnJhbSh4ZSwgYm8sIHBsYWNlcywgYm9fZmxhZ3MsIFhFX1BMX1ZSQU0xLCBjKTsNCj4gIAl9DQo+
ICB9DQo+ICANCj4gQEAgLTE3MSwyMCArMTU4LDkgQEAgc3RhdGljIGludCBfX3hlX2JvX3BsYWNl
bWVudF9mb3JfZmxhZ3Moc3RydWN0IHhlX2RldmljZSAqeGUsIHN0cnVjdCB4ZV9ibyAqYm8sDQo+
ICANCj4gIAlpZiAoYm8tPnByb3BzLnByZWZlcnJlZF9tZW1fY2xhc3MgPT0gWEVfTUVNX1JFR0lP
Tl9DTEFTU19TWVNNRU0pIHsNCj4gIAkJdHJ5X2FkZF9zeXN0ZW0oYm8sIHBsYWNlcywgYm9fZmxh
Z3MsICZjKTsNCj4gLQkJaWYgKGJvLT5wcm9wcy5wcmVmZXJyZWRfZ3QgPT0gWEVfR1QxKSB7DQo+
IC0JCQl0cnlfYWRkX3ZyYW0xKHhlLCBibywgcGxhY2VzLCBib19mbGFncywgJmMpOw0KPiAtCQkJ
dHJ5X2FkZF92cmFtMCh4ZSwgYm8sIHBsYWNlcywgYm9fZmxhZ3MsICZjKTsNCj4gLQkJfSBlbHNl
IHsNCj4gLQkJCXRyeV9hZGRfdnJhbTAoeGUsIGJvLCBwbGFjZXMsIGJvX2ZsYWdzLCAmYyk7DQo+
IC0JCQl0cnlfYWRkX3ZyYW0xKHhlLCBibywgcGxhY2VzLCBib19mbGFncywgJmMpOw0KPiAtCQl9
DQo+IC0JfSBlbHNlIGlmIChiby0+cHJvcHMucHJlZmVycmVkX2d0ID09IFhFX0dUMSkgew0KPiAt
CQl0cnlfYWRkX3ZyYW0xKHhlLCBibywgcGxhY2VzLCBib19mbGFncywgJmMpOw0KPiAtCQl0cnlf
YWRkX3ZyYW0wKHhlLCBibywgcGxhY2VzLCBib19mbGFncywgJmMpOw0KPiAtCQl0cnlfYWRkX3N5
c3RlbShibywgcGxhY2VzLCBib19mbGFncywgJmMpOw0KPiArCQl0cnlfYWRkX3ZyYW0oeGUsIGJv
LCBwbGFjZXMsIGJvX2ZsYWdzLCAmYyk7DQo+ICAJfSBlbHNlIHsNCj4gLQkJdHJ5X2FkZF92cmFt
MCh4ZSwgYm8sIHBsYWNlcywgYm9fZmxhZ3MsICZjKTsNCj4gLQkJdHJ5X2FkZF92cmFtMSh4ZSwg
Ym8sIHBsYWNlcywgYm9fZmxhZ3MsICZjKTsNCj4gKwkJdHJ5X2FkZF92cmFtKHhlLCBibywgcGxh
Y2VzLCBib19mbGFncywgJmMpOw0KPiAgCQl0cnlfYWRkX3N5c3RlbShibywgcGxhY2VzLCBib19m
bGFncywgJmMpOw0KPiAgCX0NCj4gIAl0cnlfYWRkX3N0b2xlbih4ZSwgYm8sIHBsYWNlcywgYm9f
ZmxhZ3MsICZjKTsNCg0K
