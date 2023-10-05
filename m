Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379F4E75451
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 16:26:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF8C910E42F;
	Thu,  5 Oct 2023 16:26:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5826110E42F
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 16:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696523168; x=1728059168;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Oe5/W28S2/ttd8Q03WgZipH7d4Y/EIIxGC/+r6//pOM=;
 b=QgAZIq8uL5AMHgst2iob2GTy1QltOX+xjw/zqGMemBmAwQ+uPShLT9vB
 ZMG9SkeydyMLFeA0pqhPD4GE6L8tJ4DvVdfZRqWyaM8pMPmA6ouoCLCeh
 FpF523jstcDdOJb4RZJje5YKNeObzT09smKataFEJfmsCaHD3/FirvjNp
 rSkVmUcOgOBzZVnWwAXMkK2A4y/ObxshDc8lbPWyT7yiUsORi/Z0MnDEB
 2bcshz0nkaGdc4iHnFikNDCM8x7bWWDq53+zzPshLUIMafRXaD9CSabUq
 VTLbnY9OID5bPsDPhQn5W11BWa4bC47/9LKGJTHFxaKeW8M0eeAJ7tq06 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="2151553"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="2151553"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 09:26:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="925655128"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="925655128"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Oct 2023 09:26:07 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 09:26:07 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 09:26:06 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 5 Oct 2023 09:26:06 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 5 Oct 2023 09:26:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k/5ZETNfEc83E5XvdmX6a1H3VnOLq1fWyN3lcXHE0yohNC3vRUl0MyFretkKKvWZYD/t+AkMNJi3voEpmeQ0S+7ZN9MzNYRpBJXElX1lo75e6o3rtu0uvX4MtmGlv5kWDoFbVnOYD+D7t7W4uYxuhggsmiGAbIyWjeUgEIiVhadvzrITDR4FnQxJUa3oyfSTVp8m3HT7MGf1SQg50NFhnrzl9eCVngC/kUxEXgnIyrbZgDzZlnBkPiB253nySrBwfk0g4t6QPdQ+ljBwtnz6/TJDXATIQddEC8OXq+ZeXmTO4GY9b3/c/J3c2M9dMqarBG+k+Nl7txO/DJBpudI/IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oe5/W28S2/ttd8Q03WgZipH7d4Y/EIIxGC/+r6//pOM=;
 b=AqfbqSbe+Xe/Tbs3wPEz1rCAhR3Qd5eK1yV3OQBOB9HZ6WrWmdnysS6mjf90AFACY7CB8atWyWcqIieIlAjWuYFsLHD9S4gZb6e6pTJfPD+rrv9YdAYgI3yUp6PQ+6yIjxujel1bSD6FkNs2piHP91GFd3mRX9+KuahvRvRFsSFTBgHwPDAp0f1idnLYOyAcauhfzmE28AlG0yY7OpX2ePJbZq3AMIPv9tckMymnQlA3VRGawb1z/JhIr1wuntZDTuQS8Sc8fJ95JgopN8GYWjHPae83KlsLM+4yV+PhoaGw9eKjQ/V3GxgTVEszCV4Tz9o9FOJUlk4q3YvAuz6KdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SN7PR11MB7996.namprd11.prod.outlook.com (2603:10b6:806:2e3::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.35; Thu, 5 Oct 2023 16:26:04 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::b0d1:9c31:5561:496]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::b0d1:9c31:5561:496%5]) with mapi id 15.20.6838.016; Thu, 5 Oct 2023
 16:26:03 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Thread-Topic: [Intel-xe] [PATCH 1/2] drm/xe: Print devcoredump to drm_info
Thread-Index: AQHZ8L9kxUyrUquO5Ee69XE+HZNLSrA5rl0AgAG0BoCAAAnbAIAAA4eA
Date: Thu, 5 Oct 2023 16:26:03 +0000
Message-ID: <9d192e8a023dcfaa6487f82c0bfd4baf0345f746.camel@intel.com>
References: <20230926212056.40881-1-stuart.summers@intel.com>
 <ZR1qnvcWDY40i0vD@intel.com>
 <4c1b54f514d3303c1436e66bf278fc16d5ad7e41.camel@intel.com>
 <ZR7gpm90CTkEQA+P@intel.com>
In-Reply-To: <ZR7gpm90CTkEQA+P@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SN7PR11MB7996:EE_
x-ms-office365-filtering-correlation-id: 583d1158-e4ba-4490-3d7a-08dbc5bfc50b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IrFB++St4sk5SFTot8UznOJ9hlf61ae334Sd8FsVJc7+L6p8CxYWSz10JpEn/U35VJvD82OinoXBbhS1guH5PMQcYDFR5VuJOOW3aZezpMk1Swxwpp9yU6t91a9vumCcd7TIatzOQtkx2N1J96wC/yGVDUxaYLtseAmZEIbdRFDu6TlQflnnl/PX+eUy+mfim371lfCjFz+l3bFdo9OQ+1wo/IgkWFk1jYzaG8aiuonnQD17t5bmllTItytywV0xw+z/OKaQ97W1jvPRJpOi0ZR9pJ/2Vp0X9BpGztGwSElzRG6PacClw7QyV+t95EeOpMVayYE6wjdMHK1vW+FNe7PwScIsbmVRbh8HjWDCV461N3vvL1IYNdLNQD5dTqdtjh0LsP3DNAeRf9Ko8oM7F1nOYkBRv6kwptXpJgcO4h1pEbe55jifsFU8PdvnYqfqETICFHrPmIolmQ1jRDWKt6BJaGhZQzluIkgVilihF1g3shM2OTxfdK1U7vy6mxAAgYdzSR3vSbgDu1te9lVu/rZL8qYQHaX9WMdHCx+akEhH59Ugd+WJskGECWIirgoFfZ7P7FrL0Q4BfPVQjNuF41MZYkg/f+IJQlZe8nxcLlnqeZmk5yzr7FMgRHqERl2q
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(366004)(346002)(396003)(39860400002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(66446008)(6506007)(71200400001)(478600001)(6486002)(83380400001)(6512007)(26005)(6862004)(6636002)(76116006)(91956017)(66946007)(37006003)(66556008)(66476007)(8936002)(4326008)(316002)(8676002)(2906002)(5660300002)(64756008)(36756003)(41300700001)(38070700005)(38100700002)(122000001)(86362001)(82960400001)(2616005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cUtLU1hRQkYwS3ByMldGd0pjMFFGNVNzMU1IdEl0MU12bGhpYi93TENIMndO?=
 =?utf-8?B?YWR4OW9HUnFaL3QwdzlaVWZxYndtUlZWNWlKdm0vTExjVlRYSXl1K1V0c2xM?=
 =?utf-8?B?S3hJWG1pcnVqd0xuVWlxd29nR0UzTmNDaWFKWFpRRmJwY0Vzd2xSWHByWFZh?=
 =?utf-8?B?YnpOSGJvK1hUVjBUOG11bGhZd3h5Q05vNXRHUUlrL3RxNTVSZFdFQUpmWmNy?=
 =?utf-8?B?bmdDTHFJWEJCbWVmNkhtVk1Wa2tyeXhmNVJtb01lK2JFVXVTSklBWmhXbURE?=
 =?utf-8?B?Z2duQlRQaXJHQzhXaDVISWhQdEpFWGxsTExFVW1PSitOaUdnT084MWlhcnhI?=
 =?utf-8?B?NU54SHJCNEpORGQ5NExBYXpXdEtzUGY5ajJBK1NCYzIxM1JFOUlpZXZxVkNX?=
 =?utf-8?B?TzlrWVJjVnJjWnFSZzZLaGo3cjA5Q3ZzTjJ5NmxWbm92WWVjZ0pCb09tdDRj?=
 =?utf-8?B?cGdqTm13OStzL3Z3bW9MbXVDRUgxSEhIbVRvWW84dEJrcWRlN1p1UFNac3pB?=
 =?utf-8?B?dkpyMU14V2syeEVVWWUvRDM2dWhrOFI3WTFlU1NiOGZEcldsV1Q0UFFDWCtj?=
 =?utf-8?B?dnREa0ZYRVBocEgvUnpubG9aaHRrenRqSEYvVXNYMGRRRGpzSEhCZWphL1Jz?=
 =?utf-8?B?NGJ1RDFkdm5GK2NzQjBpV1BXN3VZODAwOVVsTG5DTnN1M1R2Sk5PZXBITmxz?=
 =?utf-8?B?aE85WVNlR0ZpeU1YQjdsaEp5VTBOWEYwV2xrVWJhL1RrUEpWdkg4bjhXcmtW?=
 =?utf-8?B?L2ZhNDVrY3lTam9HNEx0ZGdxTSs0Y2xnUUpub2dpMXZ4Szl3WFJkRXFPM1FV?=
 =?utf-8?B?aGFWUU1ZVmhHb1AvT3FxK3p0QU1mNDBPTStiR2VoNVdqWUJXYnlaTDJDWCtO?=
 =?utf-8?B?Mlp6bkcrNkQwcGkxNzVuQy9STzZRVitsN1Q4K280UEw1QkRWbzh4d0cwSmxm?=
 =?utf-8?B?UHIvb2E0T2dzVUVoSlkwS3ZYd0hqZDdxb3FiYnR5K0d5RmR3dExzQmZ2WjJN?=
 =?utf-8?B?K2Rsbi9aVzFRUWt5U1lwTENwRHNJbXZ5VlQ1RVBYWkMzS3BSdVdZSmlwTC9D?=
 =?utf-8?B?Rk95cjJJTG84TUxvZEJpOStxczYrRXYyMkJxK2ZBaVdPeGxBaG1KY3MveWl5?=
 =?utf-8?B?ZTgzSTVRZWlBZGUrU1g4K0FNYmkvNDJ6NWNCYnhLaVJMSjdGQ3A3UHVJWUlN?=
 =?utf-8?B?cm9nTVdUSWNrdi9CdDc2WnRYd2IvKzNhV1JSbGc4RGh4RWZSUTRzSGN3VEl2?=
 =?utf-8?B?eTA0bWhqODEwVTBXclkzWDExWDNva1hPOXl2MGRHZFYwcFZqZzNUcThNU1h0?=
 =?utf-8?B?NVgvM3F1U21TOUR3YkorVFo3aHNoUnZoRHdaTW93VzlRVFRjdWx5NkVxQ1No?=
 =?utf-8?B?N1hvVmtHZkFmZWlTVkhublRJT1FzWU9CUmZuOHNKWGw2WTdRQVV6M2hmTSth?=
 =?utf-8?B?WnphQmJVWkdFYkVwN0RHOGlXWjdiUVpGdmZHeHVTVzNlek11ZWdubnNiUFFV?=
 =?utf-8?B?cS82NEFuenlrNDYrNnFNWCs4blFlbzlMNnJEUlNEMjlmTGZ0YkxuUkFuM095?=
 =?utf-8?B?TGNaOUZGTWFuS1FVMkNhVS9TZ1UvTXNYK25CWjR5UGZFR2loblJZaVVFNVJR?=
 =?utf-8?B?V2N4ajlReC9CdGVKa1I0amZEN1o0NmQ4NEZiNjRUckZHVzdwNWZiWHJVOE80?=
 =?utf-8?B?cXYyWEdGd3NXVDh2R0E4VGhiNTF1Nm8yd2FzV09nQVZaZTZxRWNTekNCZlVI?=
 =?utf-8?B?Rk94WjFQSU81S0NPUU55MmZSdEFlOTJmV2ltZlBXT0Vaa2hFM3BaNURkTENN?=
 =?utf-8?B?c0ZBMmZudEhaRjdJN3RteVByNXRkVVhJQnZMaWVnek1VNCtYbXdqd3o2WEtL?=
 =?utf-8?B?U2Uzc3Rrc0o5cTRvb1psNzNvRjIwSmtjN0VHUGlmNzdIbVppT2xoM1p1cDF2?=
 =?utf-8?B?bXZZOVNNOWdXRWc2bWlCbWlSMC9INllPajl3K3ZtMnE0T3RCbUFVZGdXMDd1?=
 =?utf-8?B?T0MwWUVGT2ZWL1h3L2lScDVyeGw1dmdVZk5ycVJ0N3FqYkFBSjNFaVpDaEZ1?=
 =?utf-8?B?ZGU1ME9YK0ZqcE9SdUhwcHBrbGJMTm5CRmhmdHBZMng3WWFaL3BNdUYyaVZT?=
 =?utf-8?B?c256RCtFWjBVdGJ5RkhrMnlQQnBheVN1VHpBbU1zTFcxMmwxRkp1RlRSQzJK?=
 =?utf-8?B?SWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AF895F3CA07A51418C0B5CFB847CBA36@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 583d1158-e4ba-4490-3d7a-08dbc5bfc50b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2023 16:26:03.8312 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4dvpbGSyvoVK5m6eIhAlOqY3jGxGk3Yq2uvDEigDabt+e46fxVAgqrt+o5vDUrJzR6wBN0/9hCK6WoJSU/OWMWyUlkrjSWh8vPwQG/3Qu2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7996
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Print devcoredump to drm_info
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTEwLTA1IGF0IDEyOjEzIC0wNDAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IE9uIFRodSwgT2N0IDA1LCAyMDIzIGF0IDExOjM4OjEwQU0gLTA0MDAsIFN1bW1lcnMsIFN0dWFy
dCB3cm90ZToNCj4gPiBPbiBXZWQsIDIwMjMtMTAtMDQgYXQgMDk6MzcgLTA0MDAsIFJvZHJpZ28g
Vml2aSB3cm90ZToNCj4gPiA+IE9uIFR1ZSwgU2VwIDI2LCAyMDIzIGF0IDA5OjIwOjU1UE0gKzAw
MDAsIFN0dWFydCBTdW1tZXJzIHdyb3RlOg0KPiA+ID4gPiBDdXJyZW50bHkgdGhlIGRldmNvcmVk
dW1wIGlzIGF2YWlsYWJsZSBpbiB0aGUgZmlsZSBzeXN0ZW0NCj4gPiA+ID4gZm9yIGEgdXNlci4g
SG93ZXZlciAxKSBDSSBpc24ndCBjdXJyZW50bHkgc2V0IHVwIHRvIGR1bXANCj4gPiA+ID4gdGhp
cyBkYXRhIGFuZCAyKSBpZiB3ZSB0cnkgdG8gZHVtcCB0aGlzIGR1cmluZyB0aGUgZHJpdmVyDQo+
ID4gPiA+IGxvYWQgd2hlbiBhIGZhaWx1cmUgaXMgb2JzZXJ2ZWQsIHRoZSBkcml2ZXIgd2lsbCBi
ZSB0b3JuDQo+ID4gPiA+IGRvd24gYmVmb3JlIHdlIGhhdmUgYSBjaGFuY2UgdG8gYWN0dWFsbHkg
cmVhZCB0aGlzIGRhdGEuDQo+ID4gPiA+IA0KPiA+ID4gPiBBZGQgYSBxdWljayByb3V0aW5lIHRv
IHByaW50IHRoaXMgb3V0IHdpdGggZHJtX2luZm8gYXMgd2VsbA0KPiA+ID4gPiBpZiBDT05GSUdf
RFJNX1hFX0RFQlVHIGlzIGVuYWJsZWQuDQo+ID4gPiANCj4gPiA+IEkgZmVlbCB0aGlzIGlzIGtp
bmQgb2YgYSBkdXBsaWNhdGlvbiBvZiBzaW1wbGVfZXJyb3JfY2FwdHVyZSgpDQo+ID4gPiB0aGF0
IEkgdGhvdWdodCB3ZSBjb3VsZCBraWxsLi4uIGF0IGxlYXN0IHRoYXQgaGFzIGEgbW9yZSBzcGVj
aWZpYw0KPiA+IA0KPiA+IFdoYXQgd2FzIHRoZSByZWFzb24gdG8ga2lsbCBpdD8NCj4gDQo+IGp1
c3QgaWdub3JlIHRoYXQgdGhvdWdodC4gSSB0aG91Z2h0IGl0IHdhcyBub3QgdXNlZnVsIGFmdGVy
IHdlDQo+IGdvdCB0aGUgZGV2Y29yZWR1bXAsIGJ1dCB5b3UganVzdCBzaG93ZWQgYSBnb29kIGNh
c2UgdG8ga2VlcC4NCj4gDQo+ID4gDQo+ID4gPiBjb25maWc6IENPTkZJR19EUk1fWEVfU0lNUExF
X0VSUk9SX0NBUFRVUkUNCj4gPiA+IA0KPiA+ID4gSSBtZWFuLCBtYXliZSB0aGUgcmlnaHQgdGhp
bmcgdG8gZG8gaXMgdG8ga2lsbCB0aGF0IGFuZCBoYXZlDQo+ID4gPiB0aGlzIG9uZSBoZXJlLCBi
dXQgd2l0aCBhIGRlZGljYXRlZCBjb25maWc/IS4uLg0KPiA+IA0KPiA+IEkgZmVlbCBsaWtlIHRo
ZSBhYmlsaXR5IHRvIGR1bXAgZXh0cmEgaW5mb3JtYXRpb24gd2hlbiBhbiBlcnJvcg0KPiA+IGhh
cHBlbnMNCj4gPiBkdXJpbmcgZHJpdmVyIGxvYWQgaXMgY3JpdGljYWwgZm9yIGRlYnVnLiBXZSBj
b3VsZCBjb21lIHVwIHdpdGggYQ0KPiA+IHdheQ0KPiA+IHRvIGR1bXAgdGhpcyBkdXJpbmcgdGVh
cmRvd24gdG8gc29tZSBvdGhlciBmaWxlIHRoYXQgaXMgcGVyc2lzdGVudA0KPiA+IC0NCj4gPiBl
dmVuIGluIC90bXAgb3Igc29tZXRoaW5nPw0KPiANCj4gd2hhdCBJIG1lYW4gbm93IGlzIHRvIGp1
c3Qga2VlcCBvbmUgdmVyc2lvbiBvZiBpdCwgb3Iga2VlcCB0aGF0DQo+IHNpbXBsZSBlcnJvciBj
YXB0dXJlLCBvciB0aGUgb25lIHRoYXQgeW91IGFyZSBwcm9wb3NpbmcsIGJ1dCBub3QNCj4gYm90
aC4NCj4gYW5kIHdpdGggYSBkZWRpY2F0ZWQgY29uZmlnIGxpa2UgdGhpcw0KPiBDT05GSUdfRFJN
X1hFX1NJTVBMRV9FUlJPUl9DQVBUVVJFDQo+IGluc3RlYWQgb2YgdGhlIHJldXNlIG9mIHRoZSBn
ZW5lcmljIGRlYnVnIGNvbmZpZyBsaWtlIHlvdSBoYWQgaGVyZS4NCg0KT2sgbWFrZXMgYSBsb3Qg
b2Ygc2Vuc2Ugbm93LCB0aGFua3MgUm9kcmlnby4gSSdsbCBjbGVhbiBpdCB1cCBhbmQNCnJlc2Vu
ZCBhZnRlciBzb21lIHJlbGF0ZWQgZGVidWcgSSdtIGRvaW5nLg0KDQpUaGFua3MsDQpTdHVhcnQN
Cg0KPiANCj4gPiANCj4gPiBUaGFua3MsDQo+ID4gU3R1YXJ0DQo+ID4gDQo+ID4gPiANCj4gPiA+
ID4gDQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFN0dWFydCBTdW1tZXJzIDxzdHVhcnQuc3VtbWVy
c0BpbnRlbC5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94
ZV9kZXZjb3JlZHVtcC5jIHwgMTcgKysrKysrKysrKysrKysrKy0NCj4gPiA+ID4gwqBkcml2ZXJz
L2dwdS9kcm0veGUveGVfZGV2Y29yZWR1bXAuaCB8wqAgMyArKysNCj4gPiA+ID4gwqAyIGZpbGVz
IGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiA+ID4gDQo+ID4g
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2Y29yZWR1bXAuYw0KPiA+
ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZjb3JlZHVtcC5jDQo+ID4gPiA+IGluZGV4
IDY4YWJjMGIxOTViZS4uYWE0MWQ4ZTliNjAyIDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfZGV2Y29yZWR1bXAuYw0KPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfZGV2Y29yZWR1bXAuYw0KPiA+ID4gPiBAQCAtNzgsNyArNzgsMTEgQEAgc3RhdGlj
IHNzaXplX3QgeGVfZGV2Y29yZWR1bXBfcmVhZChjaGFyDQo+ID4gPiA+ICpidWZmZXIsDQo+ID4g
PiA+IGxvZmZfdCBvZmZzZXQsDQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqBpdGVyLnJlbWFpbiA9
IGNvdW50Ow0KPiA+ID4gPiDCoA0KPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgc3MgPSAmY29yZWR1
bXAtPnNuYXBzaG90Ow0KPiA+ID4gPiAtwqDCoMKgwqDCoMKgwqBwID0gZHJtX2NvcmVkdW1wX3By
aW50ZXIoJml0ZXIpOw0KPiA+ID4gPiArDQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoGlmIChpdGVy
LmRhdGEpDQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwID0gZHJtX2Nv
cmVkdW1wX3ByaW50ZXIoJml0ZXIpOw0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqBlbHNlDQo+ID4g
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwID0gZHJtX2luZm9fcHJpbnRlcihj
b3JlZHVtcF90b194ZShjb3JlZHVtcCktDQo+ID4gPiA+ID4gZHJtLmRldik7DQo+ID4gPiA+IMKg
DQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqBkcm1fcHJpbnRmKCZwLCAiKioqKiBYZSBEZXZpY2Ug
Q29yZWR1bXAgKioqKlxuIik7DQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqBkcm1fcHJpbnRmKCZw
LCAia2VybmVsOiAiIFVUU19SRUxFQVNFICJcbiIpOw0KPiA+ID4gPiBAQCAtMTAyLDYgKzEwNiwx
NSBAQCBzdGF0aWMgc3NpemVfdCB4ZV9kZXZjb3JlZHVtcF9yZWFkKGNoYXINCj4gPiA+ID4gKmJ1
ZmZlciwgbG9mZl90IG9mZnNldCwNCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiBjb3Vu
dCAtIGl0ZXIucmVtYWluOw0KPiA+ID4gPiDCoH0NCj4gPiA+ID4gwqANCj4gPiA+ID4gKy8qIFBy
aW50IHRoZSBjb3JlZHVtcCBsb2NhbGx5IGFsc28gZm9yIGRlYnVnIHB1cnBvc2VzICovDQo+ID4g
PiA+ICt2b2lkDQo+ID4gPiA+ICt4ZV9kZXZjb3JlZHVtcF9wcmludChzdHJ1Y3QgeGVfZGV2Y29y
ZWR1bXAgKmNvcmVkdW1wKQ0KPiA+ID4gPiArew0KPiA+ID4gPiArI2lmIElTX0VOQUJMRUQoQ09O
RklHX0RSTV9YRV9ERUJVRykNCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgeGVfZGV2Y29yZWR1bXBf
cmVhZChOVUxMLCAwLCAwLCBjb3JlZHVtcCwgMCk7DQo+ID4gPiA+ICsjZW5kaWYNCj4gPiA+ID4g
K30NCj4gPiA+ID4gKw0KPiA+ID4gPiDCoHN0YXRpYyB2b2lkIHhlX2RldmNvcmVkdW1wX2ZyZWUo
dm9pZCAqZGF0YSkNCj4gPiA+ID4gwqB7DQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3Qg
eGVfZGV2Y29yZWR1bXAgKmNvcmVkdW1wID0gZGF0YTsNCj4gPiA+ID4gQEAgLTE5Miw1ICsyMDUs
NyBAQCB2b2lkIHhlX2RldmNvcmVkdW1wKHN0cnVjdCB4ZV9leGVjX3F1ZXVlDQo+ID4gPiA+ICpx
KQ0KPiA+ID4gPiDCoA0KPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgZGV2X2NvcmVkdW1wbSh4ZS0+
ZHJtLmRldiwgVEhJU19NT0RVTEUsIGNvcmVkdW1wLCAwLA0KPiA+ID4gPiBHRlBfS0VSTkVMLA0K
PiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgeGVfZGV2
Y29yZWR1bXBfcmVhZCwNCj4gPiA+ID4geGVfZGV2Y29yZWR1bXBfZnJlZSk7DQo+ID4gPiA+ICsN
Cj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgeGVfZGV2Y29yZWR1bXBfcHJpbnQoY29yZWR1bXApOw0K
PiA+ID4gPiDCoH0NCj4gPiA+ID4gwqAjZW5kaWYNCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9kZXZjb3JlZHVtcC5oDQo+ID4gPiA+IGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2RldmNvcmVkdW1wLmgNCj4gPiA+ID4gaW5kZXggNmFjMjE4YTVjMTk0Li5iYTBjMmE3
YjcxYjQgMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZjb3Jl
ZHVtcC5oDQo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZjb3JlZHVtcC5o
DQo+ID4gPiA+IEBAIC04LDYgKzgsOSBAQA0KPiA+ID4gPiDCoA0KPiA+ID4gPiDCoHN0cnVjdCB4
ZV9kZXZpY2U7DQo+ID4gPiA+IMKgc3RydWN0IHhlX2V4ZWNfcXVldWU7DQo+ID4gPiA+ICtzdHJ1
Y3QgeGVfZGV2Y29yZWR1bXA7DQo+ID4gPiA+ICsNCj4gPiA+ID4gK3ZvaWQgeGVfZGV2Y29yZWR1
bXBfcHJpbnQoc3RydWN0IHhlX2RldmNvcmVkdW1wICpjb3JlZHVtcCk7DQo+ID4gPiA+IMKgDQo+
ID4gPiA+IMKgI2lmZGVmIENPTkZJR19ERVZfQ09SRURVTVANCj4gPiA+ID4gwqB2b2lkIHhlX2Rl
dmNvcmVkdW1wKHN0cnVjdCB4ZV9leGVjX3F1ZXVlICpxKTsNCj4gPiA+ID4gLS0gDQo+ID4gPiA+
IDIuMzQuMQ0KPiA+ID4gPiANCj4gPiANCg0K
